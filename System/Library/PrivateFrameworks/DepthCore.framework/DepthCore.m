unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

uint64_t static DiveMetricError.== infix(_:_:)()
{
  return 1;
}

uint64_t DiveMetricError.hash(into:)()
{
  return sub_24CAE6250();
}

uint64_t DiveMetricError.hashValue.getter()
{
  return sub_24CAE6260();
}

uint64_t sub_24CAA0A10()
{
  return 1;
}

uint64_t sub_24CAA0A18()
{
  return sub_24CAE6260();
}

uint64_t sub_24CAA0A5C()
{
  return sub_24CAE6250();
}

uint64_t sub_24CAA0A84()
{
  return sub_24CAE6260();
}

void static DepthMetricUtilities.numberOfDescents(from:)(void *a1)
{
  if (objc_msgSend(a1, sel_workoutActivityType) != (id)84)
  {
    sub_24CAA10C0();
    swift_allocError();
    swift_willThrow();
    return;
  }
  id v2 = objc_msgSend(a1, sel_workoutEvents);
  if (v2)
  {
    v3 = v2;
    sub_24CAA1114(0, &qword_26980A818);
    unint64_t v4 = sub_24CAE5C20();

    uint64_t v11 = MEMORY[0x263F8EE78];
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_24CAE6020();
      swift_bridgeObjectRelease();
      if (v5)
      {
LABEL_5:
        if (v5 < 1) {
          goto LABEL_26;
        }
        for (uint64_t i = 0; i != v5; ++i)
        {
          if ((v4 & 0xC000000000000001) != 0) {
            id v7 = (id)MEMORY[0x253307F70](i, v4);
          }
          else {
            id v7 = *(id *)(v4 + 8 * i + 32);
          }
          v8 = v7;
          if (objc_msgSend(v7, sel_type) == (id)2)
          {
            sub_24CAE5FC0();
            sub_24CAE5FE0();
            sub_24CAE5FF0();
            sub_24CAE5FD0();
          }
          else
          {
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v9 = v11;
        if (v11 < 0) {
          goto LABEL_24;
        }
LABEL_20:
        if ((v9 & 0x4000000000000000) == 0)
        {
          uint64_t v10 = *(void *)(v9 + 16);
LABEL_22:
          swift_release();
          if (!__OFADD__(v10, 1)) {
            return;
          }
          __break(1u);
LABEL_26:
          __break(1u);
          return;
        }
LABEL_24:
        swift_bridgeObjectRetain();
        uint64_t v10 = sub_24CAE6020();
        swift_release();
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v5) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
    if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_20;
  }
}

id static DepthMetricUtilities.maxDepth(from:)(void *a1)
{
  id v1 = a1;
  if (objc_msgSend(a1, sel_workoutActivityType) == (id)84)
  {
    sub_24CAA1114(0, (unint64_t *)&qword_26980A820);
    id v2 = (void *)MEMORY[0x253307DB0]((id)*MEMORY[0x263F09F18]);
    id v3 = objc_msgSend(v1, sel_statisticsForType_, v2);

    if (v3)
    {
      id v1 = objc_msgSend(v3, sel_maximumQuantity);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    sub_24CAA10C0();
    swift_allocError();
    swift_willThrow();
  }
  return v1;
}

id static DepthMetricUtilities.underwaterTime(from:)(void *a1)
{
  if (objc_msgSend(a1, sel_workoutActivityType) == (id)84) {
    return objc_msgSend(a1, sel_duration);
  }
  sub_24CAA10C0();
  swift_allocError();
  return (id)swift_willThrow();
}

void static DepthMetricUtilities.waterTemperatureRange(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (objc_msgSend(a1, sel_workoutActivityType) != (id)84)
  {
    sub_24CAA10C0();
    swift_allocError();
    swift_willThrow();
    return;
  }
  sub_24CAA1114(0, (unint64_t *)&qword_26980A820);
  id v4 = (id)*MEMORY[0x263F09F58];
  uint64_t v5 = (void *)MEMORY[0x253307DB0]();
  id v6 = objc_msgSend(a1, sel_statisticsForType_, v5);

  if (!v6)
  {
    double v7 = 0.0;
    goto LABEL_7;
  }
  double v7 = COERCE_DOUBLE(objc_msgSend(v6, sel_minimumQuantity));

  if (v7 == 0.0)
  {
LABEL_7:
    char v11 = 1;
    goto LABEL_8;
  }
  id v8 = objc_msgSend(self, sel_degreeCelsiusUnit);
  objc_msgSend(*(id *)&v7, sel_doubleValueForUnit_, v8);
  double v10 = v9;

  char v11 = 0;
  double v7 = v10;
LABEL_8:
  v12 = (void *)MEMORY[0x253307DB0](v4);
  id v13 = objc_msgSend(a1, sel_statisticsForType_, v12);

  if (v13 && (id v14 = objc_msgSend(v13, sel_maximumQuantity), v13, v14))
  {
    id v15 = objc_msgSend(self, sel_degreeCelsiusUnit);
    objc_msgSend(v14, sel_doubleValueForUnit_, v15);
    double v17 = v16;

    double v18 = v17;
    if ((v11 & 1) == 0)
    {
      if (v17 <= v7) {
        double v20 = v17;
      }
      else {
        double v20 = v7;
      }
      if (v17 <= v7) {
        double v18 = v7;
      }
      char v19 = 1;
      double v7 = v20;
      goto LABEL_22;
    }
    char v19 = 0;
  }
  else
  {
    double v18 = 0.0;
    if ((v11 & 1) == 0)
    {
      char v19 = 0;
      goto LABEL_22;
    }
    char v19 = 2;
  }
  double v7 = v18;
  double v18 = 0.0;
LABEL_22:
  *(double *)a2 = v7;
  *(double *)(a2 + 8) = v18;
  *(unsigned char *)(a2 + 16) = v19;
}

void sub_24CAA10B4(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_24CAA10C0()
{
  unint64_t result = qword_26980A810;
  if (!qword_26980A810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980A810);
  }
  return result;
}

uint64_t sub_24CAA1114(uint64_t a1, unint64_t *a2)
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

unint64_t sub_24CAA1154()
{
  unint64_t result = qword_26980A828;
  if (!qword_26980A828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980A828);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DiveMetricError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for DiveMetricError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CAA1298);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24CAA12C0()
{
  return 0;
}

ValueMetadata *type metadata accessor for DiveMetricError()
{
  return &type metadata for DiveMetricError;
}

ValueMetadata *type metadata accessor for DepthMetricUtilities()
{
  return &type metadata for DepthMetricUtilities;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_24CAA1300(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_24CAA1308@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_24CAA131C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_24CAA134C(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_24CAA1360(void *result)
{
  *v1 &= *result;
  return result;
}

uint64_t sub_24CAA1378(uint64_t a1, uint64_t a2)
{
  return sub_24CAA15FC(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_24CAA1390(uint64_t a1, id *a2)
{
  uint64_t result = sub_24CAE5B00();
  *a2 = 0;
  return result;
}

uint64_t sub_24CAA1408(uint64_t a1, id *a2)
{
  char v3 = sub_24CAE5B10();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24CAA1488@<X0>(uint64_t *a1@<X8>)
{
  sub_24CAE5B20();
  uint64_t v2 = sub_24CAE5AE0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void *sub_24CAA14CC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24CAA14D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24CAE5AE0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24CAA1520@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CAE5B20();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CAA154C(uint64_t a1)
{
  uint64_t v2 = sub_24CAA1858(&qword_26980A8B8);
  uint64_t v3 = sub_24CAA1858((unint64_t *)&unk_26980A8C0);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24CAA15E4(uint64_t a1, uint64_t a2)
{
  return sub_24CAA15FC(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_24CAA15FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24CAE5B20();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24CAA1640()
{
  sub_24CAE5B20();
  sub_24CAE5BA0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CAA1694()
{
  sub_24CAE5B20();
  sub_24CAE6240();
  sub_24CAE5BA0();
  uint64_t v0 = sub_24CAE6260();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24CAA1708()
{
  uint64_t v0 = sub_24CAE5B20();
  uint64_t v2 = v1;
  if (v0 == sub_24CAE5B20() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24CAE61D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void type metadata accessor for Name(uint64_t a1)
{
}

void sub_24CAA17A8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_24CAA17F0()
{
  return sub_24CAA1858(&qword_26980A8A0);
}

uint64_t sub_24CAA1824()
{
  return sub_24CAA1858(&qword_26980A8A8);
}

uint64_t sub_24CAA1858(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Name(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24CAA189C()
{
  return sub_24CAA1858(&qword_26980A8B0);
}

uint64_t sub_24CAA18E8(char a1, char a2)
{
  if (*(void *)&aZero_2[8 * a1] == *(void *)&aZero_2[8 * a2]
    && *(void *)&aTentativcomple[8 * a1 + 16] == *(void *)&aTentativcomple[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_24CAE61D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24CAA1970(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x800000024CAEAB00;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x656D627553746F6ELL;
      unint64_t v3 = 0xEC00000064656772;
      break;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x776F6C6C616873;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6C616E696D6F6ELL;
      break;
    case 4:
      break;
    case 5:
      unint64_t v5 = 0xD000000000000014;
      unint64_t v3 = 0x800000024CAEAB20;
      break;
    default:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6E776F6E6B6E75;
      break;
  }
  unint64_t v6 = 0x800000024CAEAB00;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEC00000064656772;
      if (v5 == 0x656D627553746F6ELL) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x776F6C6C616873) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      unint64_t v2 = 0x6C616E696D6F6ELL;
      goto LABEL_15;
    case 4:
LABEL_15:
      if (v5 == v2) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 5:
      unint64_t v6 = 0x800000024CAEAB20;
      if (v5 != 0xD000000000000014) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x6E776F6E6B6E75) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_24CAE61D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

unint64_t static PrivateMetadata.numberOfDescentsKey.getter()
{
  return 0xD000000000000025;
}

unint64_t static PrivateMetadata.underwaterTimeKey.getter()
{
  return 0xD000000000000023;
}

unint64_t static PrivateMetadata.maxDepthKey.getter()
{
  return 0xD00000000000001DLL;
}

unint64_t static PrivateMetadata.maxDepthCategoryKey.getter()
{
  return 0xD000000000000025;
}

unint64_t static PrivateMetadata.minTempKey.getter()
{
  return 0xD000000000000021;
}

unint64_t static PrivateMetadata.maxTempKey.getter()
{
  return 0xD000000000000021;
}

unint64_t static PrivateMetadata.diveIDStringKey.getter()
{
  return 0xD000000000000021;
}

unint64_t static PrivateMetadata.currentDepthKey.getter()
{
  return 0xD000000000000021;
}

unint64_t static PrivateMetadata.currentDepthCategoryKey.getter()
{
  return 0xD000000000000029;
}

unint64_t static PrivateMetadata.underwaterTimeCategoryKey.getter()
{
  return 0xD00000000000002BLL;
}

unint64_t static PrivateMetadata.underwaterTimeStartDateKey.getter()
{
  return 0xD000000000000029;
}

unint64_t static PrivateMetadata.underwaterTimeEndDateKey.getter()
{
  return 0xD000000000000027;
}

uint64_t UnderwaterTime.Category.stringValue.getter()
{
  return *(void *)&aZero_2[8 * *v0];
}

uint64_t UnderwaterTime.Category.rawValue.getter()
{
  return *(void *)&aZero_2[8 * *v0];
}

uint64_t static UnderwaterTime.Category.fromString(_:)@<X0>(char *a1@<X8>)
{
  swift_bridgeObjectRetain();
  return UnderwaterTime.Category.init(rawValue:)(a1);
}

uint64_t UnderwaterTime.Category.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_24CAE6080();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 4;
  if (v2 < 4) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_24CAA1DD0(char *a1, char *a2)
{
  return sub_24CAA18E8(*a1, *a2);
}

uint64_t sub_24CAA1DDC()
{
  return sub_24CAA1DE4();
}

uint64_t sub_24CAA1DE4()
{
  return sub_24CAE6260();
}

uint64_t sub_24CAA1E50()
{
  return sub_24CAE6260();
}

uint64_t sub_24CAA1F7C()
{
  return sub_24CAA1F84();
}

uint64_t sub_24CAA1F84()
{
  sub_24CAE5BA0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CAA1FD8()
{
  sub_24CAE5BA0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CAA20E4()
{
  return sub_24CAA2214();
}

uint64_t sub_24CAA20EC()
{
  return sub_24CAE6260();
}

uint64_t sub_24CAA2214()
{
  return sub_24CAE6260();
}

uint64_t sub_24CAA227C@<X0>(char *a1@<X8>)
{
  return UnderwaterTime.Category.init(rawValue:)(a1);
}

uint64_t sub_24CAA2288@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UnderwaterTime.Category.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t UnderwaterTime.category.getter@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  type metadata accessor for UnderwaterTime();
  MEMORY[0x270FA5388]();
  unint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CAA2454(v2, (uint64_t)v5);
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 1:
      id v8 = &v5[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
      char v9 = 2;
      goto LABEL_6;
    case 2:
      id v8 = &v5[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
      char v9 = 3;
LABEL_6:
      *a1 = v9;
      uint64_t v10 = sub_24CAE5730();
      char v11 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);
      v11(v8, v10);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v11)(v5, v10);
      break;
    case 3:
      *a1 = 0;
      break;
    default:
      *a1 = 1;
      uint64_t v7 = sub_24CAE5730();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
      break;
  }
  return result;
}

uint64_t sub_24CAA2454(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnderwaterTime();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
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

uint64_t UnderwaterTime.asComplicationMetadata.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24CAE5730();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  v40 = (char *)&v38 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v38 - v9;
  uint64_t v11 = type metadata accessor for UnderwaterTime();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  double v16 = (char *)&v38 - v15;
  sub_24CAA2454(v0, (uint64_t)&v38 - v15);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
      double v18 = *(void (**)(char *, uint64_t))(v3 + 8);
      v18(&v16[*(int *)(v17 + 48)], v2);
      v18(v16, v2);
      break;
    case 2u:
      char v19 = &v16[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
      uint64_t v39 = v3;
      double v20 = *(void (**)(char *, uint64_t))(v3 + 8);
      v20(v19, v2);
      v20(v16, v2);
      uint64_t v3 = v39;
      break;
    case 3u:
      break;
    default:
      (*(void (**)(char *, uint64_t))(v3 + 8))(v16, v2);
      break;
  }
  uint64_t v21 = sub_24CAE5AE0();
  swift_bridgeObjectRelease();
  uint64_t v22 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v41 = v22;
  sub_24CAA4B18(v21, 0xD00000000000002BLL, 0x800000024CAEACE0, isUniquelyReferenced_nonNull_native, &v41);
  uint64_t v24 = v41;
  swift_bridgeObjectRelease();
  sub_24CAA2454(v1, (uint64_t)v14);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
      v25 = &v14[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
      v26 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
      v26(v10, v14, v2);
      v27 = v40;
      v26(v40, v25, v2);
      uint64_t v28 = sub_24CAE56E0();
      v29 = *(void (**)(char *, uint64_t))(v3 + 8);
      v29(v10, v2);
      char v30 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v41 = v24;
      sub_24CAA4B18(v28, 0xD000000000000029, 0x800000024CAEAD10, v30, &v41);
      uint64_t v31 = v41;
      swift_bridgeObjectRelease();
      uint64_t v32 = sub_24CAE56E0();
      v29(v27, v2);
      char v33 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v41 = v31;
      sub_24CAA4B18(v32, 0xD000000000000027, 0x800000024CAEAD40, v33, &v41);
      uint64_t v24 = v41;
      swift_bridgeObjectRelease();
      break;
    case 3u:
      return v24;
    default:
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v14, v2);
      v34 = v6;
      uint64_t v35 = sub_24CAE56E0();
      char v36 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v41 = v24;
      sub_24CAA4B18(v35, 0xD000000000000029, 0x800000024CAEAD10, v36, &v41);
      uint64_t v24 = v41;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v34, v2);
      break;
  }
  return v24;
}

uint64_t sub_24CAA2A20@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A998);
  uint64_t v10 = MEMORY[0x270FA5388](v78);
  uint64_t v76 = (uint64_t)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  id v14 = (char *)&v72 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  v79 = (char *)&v72 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  char v19 = (char *)&v72 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v72 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AA88);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v72 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  uint64_t v77 = a1;
  UnderwaterTime.Category.init(rawValue:)((char *)&v81);
  int v25 = v81;
  if (v81 == 4)
  {
    uint64_t v26 = type metadata accessor for UnderwaterTime();
    v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56);
    return v27(a5, 1, 1, v26);
  }
  else
  {
    v74 = v24;
    uint64_t v75 = a5;
    uint64_t v29 = (uint64_t)&v24[*(int *)(v22 + 48)];
    char v30 = &v24[*(int *)(v22 + 64)];
    *uint64_t v24 = (_BYTE)v81;
    uint64_t v31 = (uint64_t)v30;
    uint64_t v32 = v29;
    sub_24CAA5168(a3, v29);
    sub_24CAA5168(a4, v31);
    switch(v25)
    {
      case 1:
        uint64_t v73 = a3;
        uint64_t v37 = sub_24CAE5730();
        uint64_t v38 = *(void *)(v37 - 8);
        int v39 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v38 + 48))(v32, 1, v37);
        uint64_t v40 = (uint64_t)v79;
        if (v39 == 1) {
          goto LABEL_15;
        }
        uint64_t v41 = v31;
        uint64_t v42 = v75;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32))(v75, v32, v37);
        uint64_t v43 = type metadata accessor for UnderwaterTime();
        swift_storeEnumTagMultiPayload();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v42, 0, 1, v43);
        char v36 = &qword_26980A998;
        uint64_t v35 = v41;
        goto LABEL_24;
      case 2:
        uint64_t v73 = a3;
        uint64_t v44 = sub_24CAE5730();
        uint64_t v72 = *(void *)(v44 - 8);
        v45 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v72 + 48);
        int v46 = v45(v32, 1, v44);
        uint64_t v40 = (uint64_t)v79;
        if (v46 == 1) {
          goto LABEL_15;
        }
        sub_24CAA5168(v32, (uint64_t)v21);
        if (v45(v31, 1, v44) == 1)
        {
          (*(void (**)(char *, uint64_t))(v72 + 8))(v21, v44);
          goto LABEL_15;
        }
        v64 = *(void (**)(uint64_t, char *, uint64_t))(v72 + 32);
        uint64_t v65 = v31;
        uint64_t v66 = v75;
        v64(v75, v21, v44);
        uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
        v64(v66 + *(int *)(v67 + 48), (char *)v65, v44);
        uint64_t v68 = type metadata accessor for UnderwaterTime();
        goto LABEL_23;
      case 3:
        uint64_t v73 = a3;
        uint64_t v47 = sub_24CAE5730();
        uint64_t v72 = *(void *)(v47 - 8);
        v48 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v72 + 48);
        int v49 = v48(v32, 1, v47);
        uint64_t v40 = (uint64_t)v79;
        if (v49 == 1) {
          goto LABEL_15;
        }
        sub_24CAA5168(v32, (uint64_t)v19);
        if (v48(v31, 1, v47) == 1)
        {
          (*(void (**)(char *, uint64_t))(v72 + 8))(v19, v47);
LABEL_15:
          if (qword_26980A7C0 != -1) {
            swift_once();
          }
          uint64_t v50 = sub_24CAE5860();
          __swift_project_value_buffer(v50, (uint64_t)qword_26980B960);
          sub_24CAA5168(v73, v40);
          sub_24CAA5168(a4, (uint64_t)v14);
          swift_bridgeObjectRetain_n();
          v51 = sub_24CAE5840();
          os_log_type_t v52 = sub_24CAE5D90();
          if (os_log_type_enabled(v51, v52))
          {
            uint64_t v53 = swift_slowAlloc();
            v79 = (char *)swift_slowAlloc();
            v81 = v79;
            *(_DWORD *)uint64_t v53 = 136315650;
            swift_bridgeObjectRetain();
            uint64_t v80 = sub_24CAA4228(v77, a2, (uint64_t *)&v81);
            sub_24CAE5ED0();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v53 + 12) = 2080;
            uint64_t v54 = (uint64_t)v14;
            uint64_t v55 = v76;
            sub_24CAA5168(v40, v76);
            uint64_t v56 = sub_24CAE5B80();
            uint64_t v80 = sub_24CAA4228(v56, v57, (uint64_t *)&v81);
            sub_24CAE5ED0();
            swift_bridgeObjectRelease();
            sub_24CAA51D0(v40, &qword_26980A998);
            *(_WORD *)(v53 + 22) = 2080;
            sub_24CAA5168(v54, v55);
            uint64_t v58 = sub_24CAE5B80();
            uint64_t v80 = sub_24CAA4228(v58, v59, (uint64_t *)&v81);
            sub_24CAE5ED0();
            swift_bridgeObjectRelease();
            sub_24CAA51D0(v54, &qword_26980A998);
            _os_log_impl(&dword_24CA9E000, v51, v52, "UnderwaterTime: Unable to create time from category=%s startDate=%s endDate=%s", (uint8_t *)v53, 0x20u);
            v60 = v79;
            swift_arrayDestroy();
            MEMORY[0x253308900](v60, -1, -1);
            MEMORY[0x253308900](v53, -1, -1);
          }
          else
          {
            swift_bridgeObjectRelease_n();
            sub_24CAA51D0(v40, &qword_26980A998);
            sub_24CAA51D0((uint64_t)v14, &qword_26980A998);
          }

          uint64_t v62 = (uint64_t)v74;
          uint64_t v61 = v75;
          uint64_t v63 = type metadata accessor for UnderwaterTime();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v61, 1, 1, v63);
          char v36 = &qword_26980AA88;
          uint64_t v35 = v62;
        }
        else
        {
          v69 = *(void (**)(uint64_t, char *, uint64_t))(v72 + 32);
          uint64_t v70 = v31;
          uint64_t v66 = v75;
          v69(v75, v19, v47);
          uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
          v69(v66 + *(int *)(v71 + 48), (char *)v70, v47);
          uint64_t v68 = type metadata accessor for UnderwaterTime();
LABEL_23:
          swift_storeEnumTagMultiPayload();
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v66, 0, 1, v68);
          char v36 = &qword_26980A998;
          uint64_t v35 = v32;
        }
LABEL_24:
        uint64_t result = sub_24CAA51D0(v35, v36);
        break;
      default:
        uint64_t v33 = type metadata accessor for UnderwaterTime();
        uint64_t v34 = v75;
        swift_storeEnumTagMultiPayload();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v34, 0, 1, v33);
        sub_24CAA51D0(v31, &qword_26980A998);
        uint64_t v35 = v32;
        char v36 = &qword_26980A998;
        goto LABEL_24;
    }
  }
  return result;
}

uint64_t static UnderwaterTime.underwaterTime(fromComplicationMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4 = 0xEF79726F67657461;
  uint64_t v5 = 0x63676E697373696DLL;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A998);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v25 - v10;
  if (!*(void *)(a1 + 16)) {
    goto LABEL_8;
  }
  unint64_t v12 = sub_24CAA4890(0xD00000000000002BLL, 0x800000024CAEACE0);
  if (v13)
  {
    uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8 * v12);
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AA60);
    if (swift_dynamicCast())
    {
      uint64_t v5 = v26;
      unint64_t v4 = v27;
    }
  }
  if (*(void *)(a1 + 16) && (unint64_t v14 = sub_24CAA4890(0xD000000000000029, 0x800000024CAEAD10), (v15 & 1) != 0))
  {
    uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8 * v14);
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AA60);
    uint64_t v16 = sub_24CAE5730();
    int v17 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v11, v17 ^ 1u, 1, v16);
  }
  else
  {
LABEL_8:
    uint64_t v18 = sub_24CAE5730();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v11, 1, 1, v18);
  }
  if (*(void *)(a1 + 16) && (unint64_t v19 = sub_24CAA4890(0xD000000000000027, 0x800000024CAEAD40), (v20 & 1) != 0))
  {
    uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8 * v19);
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AA60);
    uint64_t v21 = sub_24CAE5730();
    int v22 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v9, v22 ^ 1u, 1, v21);
  }
  else
  {
    uint64_t v23 = sub_24CAE5730();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v9, 1, 1, v23);
  }
  sub_24CAA2A20(v5, v4, (uint64_t)v11, (uint64_t)v9, a2);
  swift_bridgeObjectRelease();
  sub_24CAA51D0((uint64_t)v9, &qword_26980A998);
  return sub_24CAA51D0((uint64_t)v11, &qword_26980A998);
}

unint64_t WaterDepth.Category.stringValue.getter()
{
  unint64_t result = 0xD000000000000011;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x656D627553746F6ELL;
      break;
    case 2:
      unint64_t result = 0x776F6C6C616873;
      break;
    case 3:
      unint64_t result = 0x6C616E696D6F6ELL;
      break;
    case 4:
      return result;
    case 5:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t WaterDepth.Category.rawValue.getter()
{
  unint64_t result = 0xD000000000000011;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x656D627553746F6ELL;
      break;
    case 2:
      unint64_t result = 0x776F6C6C616873;
      break;
    case 3:
      unint64_t result = 0x6C616E696D6F6ELL;
      break;
    case 4:
      return result;
    case 5:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t static WaterDepth.Category.fromString(_:)@<X0>(char *a1@<X8>)
{
  swift_bridgeObjectRetain();
  return WaterDepth.Category.init(rawValue:)(a1);
}

uint64_t WaterDepth.Category.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_24CAE6080();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 6;
  if (v2 < 6) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_24CAA38F8(unsigned __int8 *a1, char *a2)
{
  return sub_24CAA1970(*a1, *a2);
}

uint64_t sub_24CAA3904()
{
  return sub_24CAA1E50();
}

uint64_t sub_24CAA390C()
{
  return sub_24CAA1FD8();
}

uint64_t sub_24CAA3914()
{
  return sub_24CAA20EC();
}

uint64_t sub_24CAA391C@<X0>(char *a1@<X8>)
{
  return WaterDepth.Category.init(rawValue:)(a1);
}

unint64_t sub_24CAA3928@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = WaterDepth.Category.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void WaterDepth.category.getter(char *a1@<X8>)
{
  char v2 = 2;
  switch(v1[8])
  {
    case 1:
      *a1 = 3;
      break;
    case 2:
      char v2 = 4;
      goto LABEL_4;
    case 3:
      *a1 = 0x50100u >> (8 * *v1);
      break;
    default:
LABEL_4:
      *a1 = v2;
      break;
  }
}

void static WaterDepth.depth(fromDepthValue:categoryString:)(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *(void *)a1;
  char v8 = *(unsigned char *)(a1 + 8);
  swift_bridgeObjectRetain();
  WaterDepth.Category.init(rawValue:)((char *)&v18);
  uint64_t v9 = v18;
  char v10 = 3;
  switch((char)v18)
  {
    case 1:
      uint64_t v9 = 1;
      break;
    case 2:
      if (v8) {
        goto LABEL_8;
      }
      char v10 = 0;
      uint64_t v9 = v7;
      break;
    case 3:
      if (v8) {
        goto LABEL_8;
      }
      char v10 = 1;
      uint64_t v9 = v7;
      break;
    case 4:
      if (v8)
      {
LABEL_8:
        if (qword_26980A7C0 != -1) {
          swift_once();
        }
        uint64_t v11 = sub_24CAE5860();
        __swift_project_value_buffer(v11, (uint64_t)qword_26980B960);
        swift_bridgeObjectRetain_n();
        unint64_t v12 = sub_24CAE5840();
        os_log_type_t v13 = sub_24CAE5D90();
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v14 = swift_slowAlloc();
          uint64_t v15 = swift_slowAlloc();
          uint64_t v20 = v15;
          *(_DWORD *)uint64_t v14 = 136315394;
          uint64_t v18 = v7;
          char v19 = v8;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26980AA68);
          uint64_t v16 = sub_24CAE5B80();
          uint64_t v18 = sub_24CAA4228(v16, v17, &v20);
          sub_24CAE5ED0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v14 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v18 = sub_24CAA4228(a2, a3, &v20);
          sub_24CAE5ED0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24CA9E000, v12, v13, "ERROR: Failure to realized serialized WaterDepth from values %s,%s", (uint8_t *)v14, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x253308900](v15, -1, -1);
          MEMORY[0x253308900](v14, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        goto LABEL_14;
      }
      char v10 = 2;
      uint64_t v9 = v7;
      break;
    case 5:
      uint64_t v9 = 2;
      break;
    case 6:
LABEL_14:
      uint64_t v9 = 0;
      char v10 = -1;
      break;
    default:
      break;
  }
  *(void *)a4 = v9;
  *(unsigned char *)(a4 + 8) = v10;
}

uint64_t static WaterDepth.maxDepth(fromMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return static WaterDepth.depth(fromMetadata:valueKey:categoryKey:)(a1, 0xD00000000000001DLL, 0x800000024CAEABA0, 0xD000000000000025, 0x800000024CAEABC0, a2);
}

uint64_t static WaterDepth.depth(fromMetadata:valueKey:categoryKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  unint64_t v7 = 0xEF79726F67657461;
  uint64_t v8 = 0x63676E697373696DLL;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v24 = 0;
    char v25 = 1;
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_24CAA4890(a2, a3);
  if (v15)
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8 * v14);
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v22 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AA60);
    if (swift_dynamicCast())
    {
      char v17 = 0;
      uint64_t v18 = v24;
      goto LABEL_8;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v18 = 0;
  char v17 = 1;
LABEL_8:
  uint64_t v19 = *(void *)(a1 + 16);
  uint64_t v24 = v18;
  char v25 = v17;
  if (v19)
  {
    swift_bridgeObjectRetain();
    sub_24CAA4890(a4, a5);
    if (v20)
    {
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26980AA60);
      if (swift_dynamicCast())
      {
        uint64_t v8 = v22;
        unint64_t v7 = v23;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
LABEL_13:
  static WaterDepth.depth(fromDepthValue:categoryString:)((uint64_t)&v24, v8, v7, a6);
  return swift_bridgeObjectRelease();
}

uint64_t static WaterDepth.currentDepth(fromMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return static WaterDepth.depth(fromMetadata:valueKey:categoryKey:)(a1, 0xD000000000000021, 0x800000024CAEAC80, 0xD000000000000029, 0x800000024CAEACB0, a2);
}

unint64_t WaterDepth.asMaxDepthMetadata.getter()
{
  return sub_24CAA4100(0xD00000000000001DLL, 0x800000024CAEABA0, 0xD000000000000025, 0x800000024CAEABC0);
}

unint64_t sub_24CAA3EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v9 = *(double *)v4;
  unsigned int v10 = *(unsigned __int8 *)(v4 + 8);
  unint64_t v11 = sub_24CAC3ADC(MEMORY[0x263F8EE78]);
  if (v10 < 3)
  {
    id v12 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v9);
    swift_bridgeObjectRetain();
    id v13 = v12;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v19 = v11;
    sub_24CAA4B18((uint64_t)v13, a1, a2, isUniquelyReferenced_nonNull_native, &v19);
    unint64_t v11 = v19;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_24CAE5AE0();
  swift_bridgeObjectRelease();
  char v16 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v19 = v11;
  sub_24CAA4B18(v15, a3, a4, v16, &v19);
  unint64_t v17 = v19;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v17;
}

unint64_t WaterDepth.asCurrentDepthMetadata.getter()
{
  return sub_24CAA4100(0xD000000000000021, 0x800000024CAEAC80, 0xD000000000000029, 0x800000024CAEACB0);
}

unint64_t sub_24CAA4100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CAA3EC8(a1, a2, a3, a4);
}

uint64_t sub_24CAA413C(uint64_t result, unsigned char **a2)
{
  char v2 = *a2;
  *char v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24CAA414C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24CAA4188(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24CAA41B0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_24CAA4228(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_24CAE5ED0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_24CAA4228(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24CAA42FC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24CAA5108((uint64_t)v12, *a3);
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
      sub_24CAA5108((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24CAA42FC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24CAE5EE0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24CAA44B8(a5, a6);
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
  uint64_t v8 = sub_24CAE5FA0();
  if (!v8)
  {
    sub_24CAE6000();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24CAE6060();
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

uint64_t sub_24CAA44B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24CAA4550(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24CAA4730(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24CAA4730(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24CAA4550(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24CAA46C8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24CAE5F40();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24CAE6000();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24CAE5BC0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24CAE6060();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24CAE6000();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24CAA46C8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980AA80);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24CAA4730(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AA80);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_24CAE6060();
  __break(1u);
  return result;
}

unsigned char **sub_24CAA4880(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_24CAA4890(uint64_t a1, uint64_t a2)
{
  sub_24CAE6240();
  sub_24CAE5BA0();
  uint64_t v4 = sub_24CAE6260();
  return sub_24CAA4978(a1, a2, v4);
}

unint64_t sub_24CAA4908(char a1)
{
  char v1 = a1 & 1;
  sub_24CAE6240();
  sub_24CAE6250();
  uint64_t v2 = sub_24CAE6260();
  return sub_24CAA4A5C(v1, v2);
}

unint64_t sub_24CAA4978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24CAE61D0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24CAE61D0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24CAA4A5C(char a1, uint64_t a2)
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

uint64_t sub_24CAA4B18(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v10 = (void *)*a5;
  unint64_t v12 = sub_24CAA4890(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_24CAAE538();
LABEL_7:
    uint64_t v18 = (void *)*a5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_24CAADBF0(v15, a4 & 1);
  unint64_t v21 = sub_24CAA4890(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_24CAE61E0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*a5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_24CAA4CC4()
{
  unint64_t result = qword_26980AA70;
  if (!qword_26980AA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AA70);
  }
  return result;
}

unint64_t sub_24CAA4D1C()
{
  unint64_t result = qword_26980AA78;
  if (!qword_26980AA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AA78);
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivateMetadata()
{
  return &type metadata for PrivateMetadata;
}

uint64_t _s8CategoryOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s8CategoryOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAA4EDCLL);
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

ValueMetadata *type metadata accessor for UnderwaterTime.Category()
{
  return &type metadata for UnderwaterTime.Category;
}

uint64_t _s8CategoryOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s8CategoryOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAA5070);
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

uint64_t sub_24CAA5098(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24CAA50A0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for WaterDepth.Category()
{
  return &type metadata for WaterDepth.Category;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24CAA5108(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24CAA5168(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CAA51D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_24CAA5234()
{
  return objc_msgSend(*v0, sel_invalidate);
}

uint64_t dispatch thunk of SurfaceTimer.invalidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t DepthFormattedStringPair.formattedString.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DepthFormattedStringPair.valueString.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DepthFormattedStringPair.unitString.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24CAA52E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24CAE55D0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  BOOL v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v19[-v8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB30);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = &v19[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = &v19[-v14];
  uint64_t v16 = v1 + OBJC_IVAR___DKDepthFormatter____lazy_storage___decimalDigitsAndPunctuationSet;
  swift_beginAccess();
  sub_24CAA8914(v16, (uint64_t)v15);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v4 + 48))(v15, 1, v3) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v4 + 32))(a1, v15, v3);
  }
  sub_24CAA897C((uint64_t)v15);
  sub_24CAE5590();
  sub_24CAE55A0();
  sub_24CAE55B0();
  uint64_t v17 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
  v17(v7, v3);
  v17(v9, v3);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v13, a1, v3);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v4 + 56))(v13, 0, 1, v3);
  swift_beginAccess();
  sub_24CAA89DC((uint64_t)v13, v16);
  return swift_endAccess();
}

id DepthFormatter.__allocating_init(configuration:)(long long *a1)
{
  id v3 = objc_allocWithZone(v1);
  return DepthFormatter.init(configuration:)(a1);
}

id DepthFormatter.init(configuration:)(long long *a1)
{
  long long v2 = a1[7];
  long long v54 = a1[6];
  long long v55 = v2;
  long long v3 = a1[9];
  long long v56 = a1[8];
  long long v57 = v3;
  long long v4 = a1[3];
  long long v50 = a1[2];
  long long v51 = v4;
  long long v5 = a1[5];
  long long v52 = a1[4];
  long long v53 = v5;
  long long v6 = a1[1];
  BOOL v7 = &v1[OBJC_IVAR___DKDepthFormatter____lazy_storage___decimalDigitsAndPunctuationSet];
  long long v48 = *a1;
  long long v49 = v6;
  uint64_t v8 = sub_24CAE55D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = &v1[OBJC_IVAR___DKDepthFormatter_configuration];
  long long v10 = v55;
  *((_OWORD *)v9 + 6) = v54;
  *((_OWORD *)v9 + 7) = v10;
  long long v11 = v57;
  *((_OWORD *)v9 + 8) = v56;
  *((_OWORD *)v9 + 9) = v11;
  long long v12 = v51;
  *((_OWORD *)v9 + 2) = v50;
  *((_OWORD *)v9 + 3) = v12;
  long long v13 = v53;
  *((_OWORD *)v9 + 4) = v52;
  *((_OWORD *)v9 + 5) = v13;
  long long v14 = v49;
  *(_OWORD *)uint64_t v9 = v48;
  *((_OWORD *)v9 + 1) = v14;
  id v15 = objc_allocWithZone(MEMORY[0x263F08A30]);
  uint64_t v16 = v1;
  sub_24CAA5CD0((uint64_t)&v48, (void (*)(void, void, void, void))sub_24CAA5CA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24CAA5CB8);
  id v17 = objc_msgSend(v15, sel_init);
  *(void *)&v16[OBJC_IVAR___DKDepthFormatter_depthNumberFormatter] = v17;
  uint64_t v18 = BYTE10(v56);
  objc_msgSend(v17, sel_setMaximumFractionDigits_, BYTE10(v56));
  objc_msgSend(v17, sel_setMinimumFractionDigits_, v18);
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08988]), sel_init);
  uint64_t v20 = OBJC_IVAR___DKDepthFormatter_depthMeasurementFormatter;
  *(void *)&v16[OBJC_IVAR___DKDepthFormatter_depthMeasurementFormatter] = v19;
  objc_msgSend(v19, sel_setUnitStyle_, 2);
  objc_msgSend(v19, sel_setUnitOptions_, 1);
  id result = objc_msgSend(v19, sel_numberFormatter);
  if (!result)
  {
    __break(1u);
    goto LABEL_11;
  }
  char v22 = result;
  objc_msgSend(result, sel_setMaximumFractionDigits_, v18);

  id result = objc_msgSend(*(id *)&v16[v20], sel_numberFormatter);
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v23 = result;
  objc_msgSend(result, sel_setMinimumFractionDigits_, v18);
  sub_24CAA5CD0((uint64_t)&v48, (void (*)(void, void, void, void))sub_24CAA5D50, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24CAA5D68);

  id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
  *(void *)&v16[OBJC_IVAR___DKDepthFormatter_depthIntegerNumberFormatter] = v24;
  objc_msgSend(v24, sel_setMaximumFractionDigits_, 0);
  objc_msgSend(v24, sel_setMinimumFractionDigits_, 0);
  id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08988]), sel_init);
  uint64_t v26 = OBJC_IVAR___DKDepthFormatter_depthIntegerMeasurementFormatter;
  *(void *)&v16[OBJC_IVAR___DKDepthFormatter_depthIntegerMeasurementFormatter] = v25;
  objc_msgSend(v25, sel_setUnitStyle_, 2);
  objc_msgSend(v25, sel_setUnitOptions_, 1);
  id result = objc_msgSend(v25, sel_numberFormatter);
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v27 = result;
  objc_msgSend(result, sel_setMaximumFractionDigits_, 0);

  id result = objc_msgSend(*(id *)&v16[v26], sel_numberFormatter);
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v28 = result;
  objc_msgSend(result, sel_setMinimumFractionDigits_, 0);

  id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08780]), sel_init);
  *(void *)&v16[OBJC_IVAR___DKDepthFormatter_hoursMinutesSecondsUnderwaterTimeFormatter] = v29;
  objc_msgSend(v29, sel_setZeroFormattingBehavior_, 2);
  objc_msgSend(v29, sel_setAllowedUnits_, 224);
  id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08780]), sel_init);
  *(void *)&v16[OBJC_IVAR___DKDepthFormatter_hoursMinutesUnderwaterTimeFormatter] = v30;
  objc_msgSend(v30, sel_setZeroFormattingBehavior_, 2);
  objc_msgSend(v30, sel_setAllowedUnits_, 96);
  id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08780]), sel_init);
  *(void *)&v16[OBJC_IVAR___DKDepthFormatter_minutesSecondsShortUnderwaterTimeFormatter] = v31;
  objc_msgSend(v31, sel_setZeroFormattingBehavior_, 0x10000);
  objc_msgSend(v31, sel_setAllowedUnits_, 192);
  id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08780]), sel_init);
  *(void *)&v16[OBJC_IVAR___DKDepthFormatter_secondsOnlyShortUnderwaterTimeFormatter] = v32;
  objc_msgSend(v32, sel_setZeroFormattingBehavior_, 0x10000);
  objc_msgSend(v32, sel_setAllowedUnits_, 128);
  id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08780]), sel_init);
  *(void *)&v16[OBJC_IVAR___DKDepthFormatter_diveHistoryDiveDurationFormatter] = v33;
  objc_msgSend(v33, sel_setAllowedUnits_, 224);
  objc_msgSend(v33, sel_setUnitsStyle_, 2);
  objc_msgSend(v33, sel_setZeroFormattingBehavior_, 14);
  id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08988]), sel_init);
  uint64_t v35 = OBJC_IVAR___DKDepthFormatter_temperatureFormatter;
  *(void *)&v16[OBJC_IVAR___DKDepthFormatter_temperatureFormatter] = v34;
  objc_msgSend(v34, sel_setUnitStyle_, 2);
  id result = objc_msgSend(v34, sel_numberFormatter);
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v36 = result;
  objc_msgSend(result, sel_setMaximumFractionDigits_, 0);

  id result = objc_msgSend(*(id *)&v16[v35], sel_numberFormatter);
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v37 = result;
  objc_msgSend(result, sel_setMinimumFractionDigits_, 0);

  objc_msgSend(*(id *)&v16[v35], sel_setUnitOptions_, 1);
  id v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08988]), sel_init);
  uint64_t v39 = OBJC_IVAR___DKDepthFormatter_temperatureUnitlessFormatter;
  *(void *)&v16[OBJC_IVAR___DKDepthFormatter_temperatureUnitlessFormatter] = v38;
  objc_msgSend(v38, sel_setUnitStyle_, 1);
  objc_msgSend(v38, sel_setUnitOptions_, 5);
  id result = objc_msgSend(v38, sel_numberFormatter);
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v40 = result;
  objc_msgSend(result, sel_setMaximumFractionDigits_, 0);

  id result = objc_msgSend(*(id *)&v16[v39], sel_numberFormatter);
  if (result)
  {
    uint64_t v41 = result;
    objc_msgSend(result, sel_setMinimumFractionDigits_, 0);

    id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
    *(void *)&v16[OBJC_IVAR___DKDepthFormatter_startDateFormatter] = v42;
    objc_msgSend(v42, sel_setDoesRelativeDateFormatting_, 1);
    objc_msgSend(v42, sel_setDateStyle_, 1);
    objc_msgSend(v42, sel_setTimeStyle_, 1);
    id v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
    *(void *)&v16[OBJC_IVAR___DKDepthFormatter_endDateFormatter] = v43;
    objc_msgSend(v43, sel_setDateStyle_, 0);
    objc_msgSend(v43, sel_setTimeStyle_, 1);
    id v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
    *(void *)&v16[OBJC_IVAR___DKDepthFormatter_voiceoverDateFormatter] = v44;
    objc_msgSend(v44, sel_setDateStyle_, 3);
    objc_msgSend(v44, sel_setTimeStyle_, 3);
    id v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
    *(void *)&v16[OBJC_IVAR___DKDepthFormatter_batteryLevelFormatter] = v45;
    objc_msgSend(v45, sel_setMaximumFractionDigits_, 0);
    id v46 = v45;
    objc_msgSend(v46, sel_setNumberStyle_, 3);

    v47.receiver = v16;
    v47.super_class = (Class)type metadata accessor for DepthFormatter();
    return objc_msgSendSuper2(&v47, sel_init);
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_24CAA5CA0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 <= 0x3Fu) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24CAA5CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 <= 0x3Fu) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24CAA5CD0(uint64_t a1, void (*a2)(void, void, void, void), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a1 + 104);
  uint64_t v6 = *(void *)(a1 + 112);
  uint64_t v7 = *(void *)(a1 + 120);
  uint64_t v8 = *(void *)(a1 + 128);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 136);
  a2(*(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(unsigned __int8 *)(a1 + 96));
  a3(v5, v6, v7, v8, v9);
  return a1;
}

uint64_t sub_24CAA5D50(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 <= 0x3Fu) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24CAA5D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 <= 0x3Fu) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24CAA5D80(uint64_t *a1, char a2, char a3, char a4)
{
  uint64_t v4 = *a1;
  switch(*((unsigned char *)a1 + 8))
  {
    case 2:
      goto LABEL_6;
    case 3:
      if (v4)
      {
        if (v4 == 1) {
          uint64_t result = sub_24CAA6894(a2 & 1);
        }
        else {
LABEL_6:
        }
          uint64_t result = sub_24CAA9C80();
      }
      else
      {
        uint64_t result = 11565;
      }
      break;
    default:
      uint64_t v6 = *a1;
      uint64_t result = sub_24CAA5E64((double *)&v6, a2 & 1, a3 & 1, a4 & 1);
      break;
  }
  return result;
}

uint64_t sub_24CAA5E64(double *a1, char a2, int a3, char a4)
{
  LODWORD(v44) = a3;
  uint64_t v8 = sub_24CAE55D0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  long long v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB10);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v4 + OBJC_IVAR___DKDepthFormatter_configuration + 138))
  {
    double v16 = 1.0;
    if (a2)
    {
      uint64_t v40 = v9;
      id v17 = &selRef_meters;
      goto LABEL_6;
    }
LABEL_25:
    id v30 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *a1 * v16);
    id v31 = &OBJC_IVAR___DKDepthFormatter_depthNumberFormatter;
    if ((a4 & 1) == 0) {
      id v31 = &OBJC_IVAR___DKDepthFormatter_depthIntegerNumberFormatter;
    }
    id v20 = *(id *)(v4 + *v31);
    id v32 = objc_msgSend(v20, sel_stringFromNumber_, v30);
    if (v32)
    {
      id v33 = v32;
      uint64_t v22 = sub_24CAE5B20();

      return v22;
    }
    uint64_t v22 = sub_24CAA9C64();

LABEL_32:
    return v22;
  }
  if ((a2 & 1) == 0)
  {
    double v16 = 3.2808399;
    goto LABEL_25;
  }
  uint64_t v40 = v9;
  id v17 = &selRef_feet;
LABEL_6:
  id v18 = [self *v17];
  sub_24CAA1114(0, &qword_26980AB18);
  sub_24CAE5570();
  id v19 = &OBJC_IVAR___DKDepthFormatter_depthMeasurementFormatter;
  if ((a4 & 1) == 0) {
    id v19 = &OBJC_IVAR___DKDepthFormatter_depthIntegerMeasurementFormatter;
  }
  id v20 = *(id *)(v4 + *v19);
  uint64_t v22 = sub_24CAE5E60();
  unint64_t v23 = v21;
  if ((v44 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    goto LABEL_32;
  }
  id v36 = v20;
  uint64_t v37 = v15;
  uint64_t v38 = v13;
  uint64_t v39 = v12;
  uint64_t v47 = 0;
  unint64_t v48 = 0xE000000000000000;
  uint64_t v43 = v22 & 0xFFFFFFFFFFFFLL;
  uint64_t v44 = HIBYTE(v21) & 0xF;
  if ((v21 & 0x2000000000000000) != 0) {
    uint64_t v24 = HIBYTE(v21) & 0xF;
  }
  else {
    uint64_t v24 = v22 & 0xFFFFFFFFFFFFLL;
  }
  if (v24)
  {
    uint64_t v25 = 0;
    uint64_t v41 = (v21 & 0xFFFFFFFFFFFFFFFLL) + 32;
    uint64_t v42 = v21 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v26 = (void (**)(char *, uint64_t))(v40 + 8);
    do
    {
      if ((v23 & 0x1000000000000000) != 0)
      {
        sub_24CAE5F20();
      }
      else
      {
        if ((v23 & 0x2000000000000000) != 0)
        {
          uint64_t v45 = v22;
          uint64_t v46 = v42;
        }
        else if ((v22 & 0x1000000000000000) == 0)
        {
          sub_24CAE5FA0();
        }
        sub_24CAE5FB0();
      }
      uint64_t v28 = v27;
      sub_24CAE5580();
      char v29 = sub_24CAE55C0();
      (*v26)(v11, v8);
      if ((v29 & 1) == 0) {
        sub_24CAE5B90();
      }
      v25 += v28;
    }
    while (v25 < v24);
  }

  swift_bridgeObjectRelease();
  uint64_t v22 = v47;
  (*(void (**)(char *, uint64_t))(v38 + 8))(v37, v39);
  return v22;
}

uint64_t sub_24CAA6298(uint64_t a1)
{
  unsigned int v2 = *(unsigned __int8 *)(a1 + 8);
  long long v3 = (char *)(v1 + OBJC_IVAR___DKDepthFormatter_configuration);
  char v4 = *(unsigned char *)(v1 + OBJC_IVAR___DKDepthFormatter_configuration + 138);
  if (v2 >= 2)
  {
    if (v2 != 2 && *(void *)a1 < 2uLL) {
      return 11565;
    }
    char v9 = *v3;
    uint64_t v10 = *((void *)v3 + 9);
    uint64_t v11 = *((void *)v3 + 10);
    uint64_t v12 = *((void *)v3 + 11);
    unsigned __int8 v13 = v3[96];
    sub_24CAA5CA0(v10, v11, v12, v13);
    if ((v4 & 1) == 0)
    {
      if (v9)
      {
        double v14 = 3.2808399;
        if (qword_26980A758 != -1) {
          swift_once();
        }
        id v15 = &xmmword_269812B00;
      }
      else
      {
        double v14 = 3.2808399;
        if (qword_26980A760 != -1) {
          swift_once();
        }
        id v15 = &xmmword_269812B10;
      }
      goto LABEL_22;
    }
    if ((v9 & 1) == 0)
    {
      double v14 = 1.0;
      if (qword_26980A760 != -1) {
        swift_once();
      }
      id v15 = (long long *)((char *)&xmmword_269812B10 + 8);
      goto LABEL_22;
    }
    double v14 = 1.0;
    if (qword_26980A758 != -1) {
      goto LABEL_31;
    }
    while (1)
    {
      id v15 = (long long *)((char *)&xmmword_269812B00 + 8);
LABEL_22:
      double v17 = *(double *)v15;
      sub_24CAA5D50(v10, v11, v12, v13);
      double v18 = round(v14 * v17);
      if ((~*(void *)&v18 & 0x7FF0000000000000) == 0) {
        break;
      }
      if (v18 <= -9.22337204e18) {
        goto LABEL_29;
      }
      if (v18 < 9.22337204e18) {
        return sub_24CAA675C();
      }
LABEL_30:
      __break(1u);
LABEL_31:
      swift_once();
    }
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR___DKDepthFormatter_depthIntegerNumberFormatter);
  uint64_t v6 = (void *)sub_24CAE5D20();
  id v7 = objc_msgSend(v5, sel_stringFromNumber_, v6);

  if (!v7) {
    return sub_24CAA9C64();
  }
  uint64_t v8 = sub_24CAE5B20();

  return v8;
}

uint64_t sub_24CAA6550(void *a1)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  (*(void (**)(unint64_t *__return_ptr, uint64_t, uint64_t))(v4 + 24))(&v15, v3, v4);
  if (v16 < 2u)
  {
    uint64_t v5 = *(void **)(v1 + OBJC_IVAR___DKDepthFormatter_depthIntegerNumberFormatter);
    uint64_t v6 = (void *)sub_24CAE5D20();
    id v7 = objc_msgSend(v5, sel_stringFromNumber_, v6);

    if (v7)
    {
      uint64_t v8 = sub_24CAE5B20();

      return v8;
    }
    return sub_24CAA9C64();
  }
  if (v16 == 2 || v15 >= 2) {
    return sub_24CAA8C9C(a1);
  }
  if (qword_26980A7C8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_24CAE5860();
  __swift_project_value_buffer(v9, (uint64_t)qword_26980B978);
  uint64_t v10 = sub_24CAE5840();
  os_log_type_t v11 = sub_24CAE5DA0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_24CA9E000, v10, v11, "DepthFormatter: Unknown or notSubmerged depth encountered", v12, 2u);
    MEMORY[0x253308900](v12, -1, -1);
  }

  return 11565;
}

uint64_t sub_24CAA675C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___DKDepthFormatter_depthIntegerNumberFormatter);
  unsigned int v2 = (void *)sub_24CAE5D50();
  id v3 = objc_msgSend(v1, sel_stringFromNumber_, v2);

  if (v3)
  {
    uint64_t v4 = sub_24CAE5B20();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = sub_24CAA9C64();
    uint64_t v6 = v7;
  }
  sub_24CAA9C64();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB20);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_24CAE6F00;
  *(void *)(v8 + 56) = MEMORY[0x263F8D310];
  *(void *)(v8 + 64) = sub_24CAA7F30();
  *(void *)(v8 + 32) = v4;
  *(void *)(v8 + 40) = v6;
  uint64_t v9 = sub_24CAE5B40();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_24CAA6894(char a1)
{
  if (a1) {
    sub_24CAA9C64();
  }
  sub_24CAE5BB0();
  swift_bridgeObjectRelease();
  return 48;
}

uint64_t sub_24CAA694C()
{
  return sub_24CAA9C64();
}

uint64_t sub_24CAA6998()
{
  return sub_24CAA6ECC();
}

uint64_t sub_24CAA69D0()
{
  return sub_24CAA6ECC();
}

uint64_t sub_24CAA6A08()
{
  return sub_24CAA9C64();
}

uint64_t sub_24CAA6A5C(uint64_t a1, char a2, uint64_t a3, unsigned __int8 *a4)
{
  char v4 = *(unsigned char *)(a1 + 8);
  unsigned __int8 v5 = *a4;
  uint64_t v9 = *(void *)a1;
  char v10 = v4;
  unsigned __int8 v8 = v5;
  sub_24CAA6AD0(&v9, a2, &v8, &v11);
  uint64_t v6 = v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_24CAA6AD0@<X0>(uint64_t *a1@<X0>, char a2@<W1>, unsigned __int8 *a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v7 = *a1;
  unsigned int v8 = *((unsigned __int8 *)a1 + 8);
  int v9 = *a3;
  sub_24CAA9C64();
  if (v8 < 2)
  {
    uint64_t v10 = sub_24CAA9C64();
    uint64_t v12 = v11;
    uint64_t v32 = v7;
    char v13 = 1;
LABEL_24:
    uint64_t v23 = sub_24CAA5E64((double *)&v32, 0, 0, v13);
    uint64_t v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB20);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_24CAE6F10;
    uint64_t v27 = MEMORY[0x263F8D310];
    *(void *)(v26 + 56) = MEMORY[0x263F8D310];
    unint64_t v28 = sub_24CAA7F30();
    *(void *)(v26 + 32) = v23;
    *(void *)(v26 + 40) = v25;
    *(void *)(v26 + 96) = v27;
    *(void *)(v26 + 104) = v28;
    *(void *)(v26 + 64) = v28;
    *(void *)(v26 + 72) = v10;
    *(void *)(v26 + 80) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_24CAE5B40();
    uint64_t v31 = v30;
    uint64_t result = swift_bridgeObjectRelease();
    *a4 = v29;
    a4[1] = v31;
    a4[2] = v23;
    a4[3] = v25;
    a4[4] = v10;
    a4[5] = v12;
    return result;
  }
  if (v8 != 2)
  {
    if (!v7)
    {
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v15 = 11565;
      unint64_t v16 = 0xE200000000000000;
      goto LABEL_13;
    }
    if (v7 == 1)
    {
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v15 = 48;
      unint64_t v16 = 0xE100000000000000;
LABEL_13:
      *a4 = v15;
      a4[1] = v16;
      a4[2] = v15;
      a4[3] = v16;
      a4[4] = 0;
      a4[5] = 0;
      return result;
    }
  }
  char v17 = (v9 == 2) | v9;
  if (a2)
  {
    int v18 = *(unsigned __int8 *)(v4 + OBJC_IVAR___DKDepthFormatter_configuration + 138);
    uint64_t v10 = sub_24CAA9C64();
    uint64_t v12 = v21;
    if (v17)
    {
      if (qword_26980A760 != -1) {
        swift_once();
      }
      uint64_t v22 = &xmmword_269812B10;
    }
    else
    {
      if (qword_26980A758 != -1) {
        swift_once();
      }
      uint64_t v22 = &xmmword_269812B00;
    }
    if (v18) {
      uint64_t v22 = (long long *)((char *)v22 + 8);
    }
    uint64_t v32 = *(void *)v22;
    char v13 = 0;
    goto LABEL_24;
  }
  swift_bridgeObjectRelease();
  LOBYTE(v32) = v17 & 1;
  uint64_t v19 = sub_24CAA6E00(&v32);
  *a4 = v19;
  a4[1] = v20;
  a4[2] = v19;
  a4[3] = v20;
  a4[4] = 0;
  a4[5] = 0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24CAA6E00(unsigned char *a1)
{
  if (*a1 == 1) {
    return sub_24CAA9C80();
  }
  else {
    return sub_24CAA9C64();
  }
}

uint64_t sub_24CAA6E94()
{
  return sub_24CAA6ECC();
}

uint64_t sub_24CAA6ECC()
{
  return sub_24CAA9C64();
}

uint64_t sub_24CAA6EF0(double a1)
{
  id v3 = &OBJC_IVAR___DKDepthFormatter_minutesSecondsShortUnderwaterTimeFormatter;
  if (a1 >= 3600.0) {
    id v3 = &OBJC_IVAR___DKDepthFormatter_hoursMinutesSecondsUnderwaterTimeFormatter;
  }
  id v4 = *(id *)(v1 + *v3);
  id v5 = objc_msgSend(v4, sel_stringFromTimeInterval_, a1);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = sub_24CAE5B20();

    id v4 = v6;
  }
  else
  {
    uint64_t v7 = sub_24CAA9C64();
  }

  return v7;
}

uint64_t sub_24CAA6FBC()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR___DKDepthFormatter_diveHistoryDiveDurationFormatter), sel_stringFromTimeInterval_);
  if (v1)
  {
    unsigned int v2 = v1;
    uint64_t v3 = sub_24CAE5B20();

    return v3;
  }
  else
  {
    return sub_24CAA9C64();
  }
}

uint64_t sub_24CAA7058(double a1)
{
  uint64_t v3 = &OBJC_IVAR___DKDepthFormatter_secondsOnlyShortUnderwaterTimeFormatter;
  id v4 = &OBJC_IVAR___DKDepthFormatter_minutesSecondsShortUnderwaterTimeFormatter;
  if (a1 >= 3600.0) {
    id v4 = &OBJC_IVAR___DKDepthFormatter_hoursMinutesUnderwaterTimeFormatter;
  }
  if (a1 >= 60.0) {
    uint64_t v3 = v4;
  }
  id v5 = *(id *)(v1 + *v3);
  id v6 = objc_msgSend(v5, sel_stringFromTimeInterval_, a1);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = sub_24CAE5B20();

    id v5 = v7;
  }
  else
  {
    uint64_t v8 = sub_24CAA9C64();
  }

  return v8;
}

uint64_t sub_24CAA713C()
{
  sub_24CAE5BB0();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_24CAA9C64();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24CAA71EC(uint64_t a1)
{
  sub_24CAA9C64();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB20);
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = MEMORY[0x263F8D6C8];
  *(_OWORD *)(v2 + 16) = xmmword_24CAE6F00;
  uint64_t v4 = MEMORY[0x263F8D750];
  *(void *)(v2 + 56) = v3;
  *(void *)(v2 + 64) = v4;
  *(void *)(v2 + 32) = a1;
  uint64_t v5 = sub_24CAE5B40();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24CAA729C(uint64_t *a1, char a2, char a3)
{
  if (a1[1]) {
    return 11565;
  }
  uint64_t v4 = *a1;
  return sub_24CAA72E4((uint64_t)&v4, a2 & 1, a3 & 1);
}

uint64_t sub_24CAA72E4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB38);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3[OBJC_IVAR___DKDepthFormatter_configuration + 139] == 1) {
    int v9 = &selRef_fahrenheit;
  }
  else {
    int v9 = &selRef_celsius;
  }
  id v10 = [self *v9];
  sub_24CAA1114(0, &qword_26980AB40);
  sub_24CAE5570();
  uint64_t v11 = sub_24CAE5E60();
  uint64_t v19 = v11;
  unint64_t v20 = v12;
  if ((a3 & 1) == 0)
  {
    uint64_t v17 = v11;
    unint64_t v18 = v12;
    char v13 = v3;
    sub_24CAA8A44(&v17, (uint64_t)v13);

    uint64_t v19 = v17;
    unint64_t v20 = v18;
  }
  swift_bridgeObjectRetain();
  char v14 = sub_24CAE5BD0();
  swift_bridgeObjectRelease();
  if (v14)
  {
    uint64_t v17 = 45;
    unint64_t v18 = 0xE100000000000000;
    sub_24CAA8C48();
    sub_24CAE5D70();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v19;
}

uint64_t sub_24CAA7534(uint64_t a1, char a2)
{
  double v3 = *(double *)a1;
  if (*(unsigned char *)(a1 + 16))
  {
    if (*(unsigned char *)(a1 + 16) != 1) {
      return 11565;
    }
    double v4 = *(double *)(a1 + 8);
    if (vabdd_f64(v3, v4) >= 1.0)
    {
      sub_24CAA9C64();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB20);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_24CAE6F10;
      double v15 = v3;
      uint64_t v7 = sub_24CAA72E4((uint64_t)&v15, 0, 0);
      uint64_t v9 = v8;
      uint64_t v10 = MEMORY[0x263F8D310];
      *(void *)(v6 + 56) = MEMORY[0x263F8D310];
      unint64_t v11 = sub_24CAA7F30();
      *(void *)(v6 + 64) = v11;
      *(void *)(v6 + 32) = v7;
      *(void *)(v6 + 40) = v9;
      double v15 = v4;
      uint64_t v12 = sub_24CAA72E4((uint64_t)&v15, 0, a2 & 1);
      *(void *)(v6 + 96) = v10;
      *(void *)(v6 + 104) = v11;
      *(void *)(v6 + 72) = v12;
      *(void *)(v6 + 80) = v13;
      uint64_t v5 = sub_24CAE5AF0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v5;
    }
    double v15 = (v4 + v3) * 0.5;
  }
  else
  {
    double v15 = *(double *)a1;
  }
  return sub_24CAA72E4((uint64_t)&v15, 0, a2 & 1);
}

uint64_t sub_24CAA76C4(long long *a1)
{
  char v1 = *((unsigned char *)a1 + 16);
  long long v4 = *a1;
  char v5 = v1;
  uint64_t v2 = sub_24CAA7534((uint64_t)&v4, 0);
  sub_24CAA9C64();
  return v2;
}

uint64_t sub_24CAA7778()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24CAE5730();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CAE5620();
  if (v6 >= 60.0)
  {
    uint64_t v11 = sub_24CAA9C64();
    v29[0] = v12;
    v29[1] = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB20);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_24CAE6F10;
    char v14 = *(void **)(v0 + OBJC_IVAR___DKDepthFormatter_startDateFormatter);
    sub_24CAE5610();
    double v15 = (void *)sub_24CAE56E0();
    uint64_t v16 = *(void (**)(char *, uint64_t))(v3 + 8);
    v16(v5, v2);
    id v17 = objc_msgSend(v14, sel_stringFromDate_, v15);

    uint64_t v18 = sub_24CAE5B20();
    uint64_t v20 = v19;

    *(void *)(v13 + 56) = MEMORY[0x263F8D310];
    unint64_t v21 = sub_24CAA7F30();
    *(void *)(v13 + 64) = v21;
    *(void *)(v13 + 32) = v18;
    *(void *)(v13 + 40) = v20;
    uint64_t v22 = *(void **)(v1 + OBJC_IVAR___DKDepthFormatter_endDateFormatter);
    sub_24CAE55F0();
    uint64_t v23 = (void *)sub_24CAE56E0();
    v16(v5, v2);
    id v24 = objc_msgSend(v22, sel_stringFromDate_, v23);

    uint64_t v25 = sub_24CAE5B20();
    uint64_t v27 = v26;

    *(void *)(v13 + 96) = MEMORY[0x263F8D310];
    *(void *)(v13 + 104) = v21;
    *(void *)(v13 + 72) = v25;
    *(void *)(v13 + 80) = v27;
    uint64_t v10 = sub_24CAE5AF0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void **)(v0 + OBJC_IVAR___DKDepthFormatter_startDateFormatter);
    sub_24CAE5610();
    uint64_t v8 = (void *)sub_24CAE56E0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    id v9 = objc_msgSend(v7, sel_stringFromDate_, v8);

    uint64_t v10 = sub_24CAE5B20();
  }
  return v10;
}

uint64_t sub_24CAA7A58(uint64_t a1)
{
  return sub_24CAA7A70(a1, &OBJC_IVAR___DKDepthFormatter_startDateFormatter);
}

uint64_t sub_24CAA7A64(uint64_t a1)
{
  return sub_24CAA7A70(a1, &OBJC_IVAR___DKDepthFormatter_voiceoverDateFormatter);
}

uint64_t sub_24CAA7A70(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(v2 + *a2);
  uint64_t v4 = (void *)sub_24CAE56E0();
  id v5 = objc_msgSend(v3, sel_stringFromDate_, v4);

  uint64_t v6 = sub_24CAE5B20();
  return v6;
}

uint64_t sub_24CAA7AE8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 4) >= 2u) {
    return 11565;
  }
  sub_24CAA9C64();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB20);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24CAE6F00;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR___DKDepthFormatter_batteryLevelFormatter);
  uint64_t v4 = (void *)sub_24CAE5D40();
  id v5 = objc_msgSend(v3, sel_stringFromNumber_, v4);

  if (v5)
  {
    uint64_t v6 = sub_24CAE5B20();
    unint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v8 = 0;
  }
  *(void *)(v2 + 56) = MEMORY[0x263F8D310];
  *(void *)(v2 + 64) = sub_24CAA7F30();
  uint64_t v10 = 11565;
  if (v8) {
    uint64_t v10 = v6;
  }
  unint64_t v11 = 0xE200000000000000;
  if (v8) {
    unint64_t v11 = v8;
  }
  *(void *)(v2 + 32) = v10;
  *(void *)(v2 + 40) = v11;
  uint64_t v9 = sub_24CAE5AF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id DepthFormatter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void DepthFormatter.init()()
{
}

id DepthFormatter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DepthFormatter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DepthFormatter()
{
  uint64_t result = qword_26B1814D0;
  if (!qword_26B1814D0) {
    return swift_getSingletonMetadata();
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

unint64_t sub_24CAA7F30()
{
  unint64_t result = qword_26980AB28;
  if (!qword_26980AB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AB28);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DepthFormattedStringPair(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DepthFormattedStringPair()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for DepthFormattedStringPair(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DepthFormattedStringPair(void *a1, void *a2)
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

void *assignWithTake for DepthFormattedStringPair(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DepthFormattedStringPair(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DepthFormattedStringPair(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthFormattedStringPair()
{
  return &type metadata for DepthFormattedStringPair;
}

uint64_t sub_24CAA81F4()
{
  return type metadata accessor for DepthFormatter();
}

void sub_24CAA81FC()
{
  sub_24CAA88BC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for DepthFormatter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DepthFormatter);
}

uint64_t dispatch thunk of DepthFormatter.__allocating_init(configuration:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of DepthFormatter.formatDepth(_:withUnits:strippingWhitespace:allowFractional:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of DepthFormatter.formatDepthValueForComplicationsOnly(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of DepthFormatter.formatMaxDepthForComplicationsOnly(summary:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of DepthFormatter.formatNotSubmerged(withUnits:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of DepthFormatter.depthUnitString.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of DepthFormatter.complicationMaxDepthUnitString.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of DepthFormatter.depthUnitPlusString.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of DepthFormatter.temperatureUnitWithDegreeSignString.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of DepthFormatter.formatMaxDepth(_:compact:includeSpace:deviceType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of DepthFormatter.pairedFormatMaxDepth(_:compact:includeSpace:deviceType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of DepthFormatter.beyondMaxDepthString(forDeviceType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of DepthFormatter.submergeToContinueString.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of DepthFormatter.formatUnderwaterTime(withTimeInterval:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of DepthFormatter.formatDiveHistoryDiveDuration(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of DepthFormatter.formatComplicationDiveDuration(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of DepthFormatter.complicationDurationUnitString(forDuration:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of DepthFormatter.complicationFormatNumberOfDives(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of DepthFormatter.formatTemperature(_:withUnits:withDegreeSymbol:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of DepthFormatter.formatTemperatureRange(_:withDegreeSymbol:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of DepthFormatter.formatTemperatureRangeAndUnit(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of DepthFormatter.formatUnderwaterDateInterval(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of DepthFormatter.formatDiveStartDate(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of DepthFormatter.formatVoiceoverDiveStartDate(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of DepthFormatter.formatBatteryLevel(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

void sub_24CAA88BC()
{
  if (!qword_26B181508)
  {
    sub_24CAE55D0();
    unint64_t v0 = sub_24CAE5EB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B181508);
    }
  }
}

uint64_t sub_24CAA8914(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CAA897C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CAA89DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CAA8A44(void *a1, uint64_t a2)
{
  uint64_t v30 = a2;
  uint64_t v25 = sub_24CAE55D0();
  MEMORY[0x270FA5388](v25);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  unint64_t v7 = a1[1];
  uint64_t v20 = a1;
  uint64_t v28 = 0;
  unint64_t v29 = 0xE000000000000000;
  uint64_t v23 = v8 & 0xFFFFFFFFFFFFLL;
  uint64_t v24 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) != 0) {
    uint64_t v9 = HIBYTE(v7) & 0xF;
  }
  else {
    uint64_t v9 = v8 & 0xFFFFFFFFFFFFLL;
  }
  if (v9)
  {
    v19[1] = v2;
    uint64_t v21 = (v7 & 0xFFFFFFFFFFFFFFFLL) + 32;
    uint64_t v22 = v7 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v10 = (void (**)(char *, uint64_t))(v4 + 8);
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i < v9; i += v13)
    {
      if ((v7 & 0x1000000000000000) != 0)
      {
        sub_24CAE5F20();
      }
      else
      {
        if ((v7 & 0x2000000000000000) != 0)
        {
          uint64_t v26 = v8;
          uint64_t v27 = v22;
        }
        else if ((v8 & 0x1000000000000000) == 0)
        {
          sub_24CAE5FA0();
        }
        sub_24CAE5FB0();
      }
      uint64_t v13 = v12;
      sub_24CAA52E8((uint64_t)v6);
      char v14 = sub_24CAE55C0();
      (*v10)(v6, v25);
      if (v14) {
        sub_24CAE5B90();
      }
    }
    double v15 = v20;
    uint64_t v16 = v28;
    unint64_t v17 = v29;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = 0;
    unint64_t v17 = 0xE000000000000000;
    double v15 = v20;
  }
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *double v15 = v16;
  v15[1] = v17;
  return result;
}

unint64_t sub_24CAA8C48()
{
  unint64_t result = qword_26980AB48;
  if (!qword_26980AB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AB48);
  }
  return result;
}

uint64_t sub_24CAA8C9C(void *a1)
{
  uint64_t v3 = sub_24CAE57A0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 64))(v7, v8);
  if (!v10)
  {
    if (qword_26980A7C8 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_24CAE5860();
    __swift_project_value_buffer(v18, (uint64_t)qword_26980B978);
    sub_24CAA9C00((uint64_t)a1, (uint64_t)v37);
    uint64_t v19 = sub_24CAE5840();
    os_log_type_t v20 = sub_24CAE5DA0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v36 = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      v35[0] = v21 + 4;
      __swift_project_boxed_opaque_existential_1(v37, v37[3]);
      sub_24CAE5F60();
      sub_24CAA9BA8();
      uint64_t v23 = sub_24CAE61B0();
      unint64_t v25 = v24;
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      v35[1] = sub_24CAA4228(v23, v25, &v36);
      sub_24CAE5ED0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
      _os_log_impl(&dword_24CA9E000, v19, v20, "MaxDepthFormatter: No device defined for summary %s", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253308900](v22, -1, -1);
      MEMORY[0x253308900](v21, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
    }

    return 11565;
  }
  uint64_t v11 = v9;
  unint64_t v12 = v10;
  static DeviceType.deviceType(forDeviceIdentifier:)(v9, v10, (char *)v37);
  if (LOBYTE(v37[0]) == 2)
  {
    if (qword_26980A7C8 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_24CAE5860();
    __swift_project_value_buffer(v13, (uint64_t)qword_26980B978);
    swift_bridgeObjectRetain();
    char v14 = sub_24CAE5840();
    os_log_type_t v15 = sub_24CAE5DA0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v37[0] = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_24CAA4228(v11, v12, v37);
      sub_24CAE5ED0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24CA9E000, v14, v15, "MaxDepthFormatter: Unable to resolve max depth value for device %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253308900](v17, -1, -1);
      MEMORY[0x253308900](v16, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 11565;
  }
  if (v37[0])
  {
    if (qword_26980A760 != -1) {
      swift_once();
    }
    uint64_t v26 = &xmmword_269812B10;
  }
  else
  {
    if (qword_26980A758 != -1) {
      swift_once();
    }
    uint64_t v26 = &xmmword_269812B00;
  }
  uint64_t v28 = *(void *)v26;
  uint64_t v29 = *((void *)v26 + 1);
  swift_bridgeObjectRelease();
  v37[0] = v28;
  v37[1] = v29;
  LOBYTE(v36) = *(unsigned char *)(v1 + OBJC_IVAR___DKDepthFormatter_configuration + 138);
  uint64_t v30 = sub_24CAA9220(&v36, 1);
  uint64_t v32 = v31;
  sub_24CAA9C64();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB20);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_24CAE6F00;
  *(void *)(v33 + 56) = MEMORY[0x263F8D310];
  *(void *)(v33 + 64) = sub_24CAA7F30();
  *(void *)(v33 + 32) = v30;
  *(void *)(v33 + 40) = v32;
  uint64_t v27 = sub_24CAE5B40();
  swift_bridgeObjectRelease();
  return v27;
}

uint64_t sub_24CAA9220(unsigned char *a1, char a2)
{
  double v3 = v2[1];
  if (a2)
  {
    double v4 = *v2 * 3.2808399;
    if (*a1) {
      double v4 = v2[1];
    }
    double v5 = round(v4);
    if ((~*(void *)&v5 & 0x7FF0000000000000) != 0)
    {
      if (v5 > -9.22337204e18)
      {
        if (v5 < 9.22337204e18) {
          return sub_24CAE61B0();
        }
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (qword_26980A760 != -1) {
LABEL_16:
  }
    swift_once();
  if (vabdd_f64(v3, *((double *)&xmmword_269812B10 + 1)) <= 0.0001)
  {
    sub_24CAE5F30();
    swift_bridgeObjectRelease();
    sub_24CAE5BB0();
    swift_bridgeObjectRelease();
    sub_24CAE5BB0();
    uint64_t v7 = sub_24CAA9C80();
  }
  else
  {
    sub_24CAE5F30();
    swift_bridgeObjectRelease();
    sub_24CAE5BB0();
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_24CAA9C64();
  }
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

void __swiftcall DepthFormatter.formatMaxDepth(workout:healthStore:)(DepthCore::DepthFormattedStringPair *__return_ptr retstr, HKWorkout workout, HKHealthStore healthStore)
{
  uint64_t v4 = v3;
  uint64_t v7 = sub_24CAE57A0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CAA9B68();
  uint64_t v11 = (void *)MEMORY[0x253307DB0]((id)*MEMORY[0x263F09F18]);
  id v12 = [(objc_class *)workout.super.super.super.isa statisticsForType:v11];

  if (v12)
  {
    id v13 = objc_msgSend(v12, sel_maximumQuantity);

    if (v13)
    {
      id v14 = [(objc_class *)workout.super.super.super.isa device];
      if (v14)
      {
        os_log_type_t v15 = v14;
        id v16 = objc_msgSend(v14, sel_hardwareVersion);

        if (v16)
        {
          uint64_t v17 = sub_24CAE5B20();
          unint64_t v19 = v18;

          static DeviceType.deviceType(forDeviceIdentifier:)(v17, v19, (char *)&v64);
          if (v64 == 2)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            if (v64)
            {
              if (qword_26980A760 != -1) {
                swift_once();
              }
              uint64_t v41 = &xmmword_269812B10;
            }
            else
            {
              if (qword_26980A758 != -1) {
                swift_once();
              }
              uint64_t v41 = &xmmword_269812B00;
            }
            uint64_t v42 = *(void *)v41;
            double v43 = *((double *)v41 + 1);
            swift_bridgeObjectRelease();
            objc_msgSend(v13, sel__value);
            if (v43 <= v44)
            {
              uint64_t v64 = v42;
              unint64_t v65 = *(void *)&v43;
              LOBYTE(v66) = *(unsigned char *)(v4 + OBJC_IVAR___DKDepthFormatter_configuration + 138);
              uint64_t v39 = sub_24CAA9220(&v66, 1);
              uint64_t v40 = v54;
              uint64_t v64 = 0;
              unint64_t v65 = 0xE000000000000000;
              sub_24CAE5F30();
              swift_bridgeObjectRelease();
              uint64_t v64 = 0xD000000000000011;
              unint64_t v65 = 0x800000024CAEB530;
              sub_24CAE5BB0();
              swift_bridgeObjectRelease();
              uint64_t v34 = sub_24CAA9C64();
              uint64_t v36 = v55;
              swift_bridgeObjectRelease();
              sub_24CAA9C64();
              __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB20);
              uint64_t v56 = swift_allocObject();
              *(_OWORD *)(v56 + 16) = xmmword_24CAE6F10;
              uint64_t v57 = MEMORY[0x263F8D310];
              *(void *)(v56 + 56) = MEMORY[0x263F8D310];
              unint64_t v58 = sub_24CAA7F30();
              *(void *)(v56 + 32) = v39;
              *(void *)(v56 + 40) = v40;
              *(void *)(v56 + 96) = v57;
              *(void *)(v56 + 104) = v58;
              *(void *)(v56 + 64) = v58;
              *(void *)(v56 + 72) = v34;
              *(void *)(v56 + 80) = v36;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              uint64_t v38 = sub_24CAE5B40();
              uint64_t v37 = v59;
              swift_bridgeObjectRelease();
              goto LABEL_22;
            }
          }
        }
      }
      objc_msgSend(v13, sel__value);
      uint64_t v64 = v45;
      uint64_t v39 = sub_24CAA5E64((double *)&v64, 0, 1, 1);
      uint64_t v40 = v46;
      sub_24CAA9C64();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB20);
      uint64_t v47 = swift_allocObject();
      *(_OWORD *)(v47 + 16) = xmmword_24CAE6F10;
      uint64_t v48 = MEMORY[0x263F8D310];
      *(void *)(v47 + 56) = MEMORY[0x263F8D310];
      unint64_t v49 = sub_24CAA7F30();
      *(void *)(v47 + 64) = v49;
      *(void *)(v47 + 32) = v39;
      *(void *)(v47 + 40) = v40;
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_24CAA9C64();
      *(void *)(v47 + 96) = v48;
      *(void *)(v47 + 104) = v49;
      *(void *)(v47 + 72) = v50;
      *(void *)(v47 + 80) = v51;
      uint64_t v38 = sub_24CAE5B40();
      uint64_t v37 = v52;
      swift_bridgeObjectRelease();
      uint64_t v34 = sub_24CAA9C64();
      uint64_t v36 = v53;
LABEL_22:

      goto LABEL_23;
    }
  }
  if (qword_26980A7C0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_24CAE5860();
  __swift_project_value_buffer(v20, (uint64_t)qword_26980B960);
  uint64_t v21 = workout.super.super.super.isa;
  uint64_t v22 = sub_24CAE5840();
  os_log_type_t v23 = sub_24CAE5D90();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = v8;
    unint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v63 = retstr;
    uint64_t v64 = v26;
    uint64_t v27 = v26;
    uint64_t v61 = v25;
    uint64_t v62 = v4;
    *(_DWORD *)unint64_t v25 = 136315138;
    v60[1] = v25 + 4;
    id v28 = [(objc_class *)v21 UUID];
    sub_24CAE5770();

    sub_24CAA9BA8();
    uint64_t v29 = sub_24CAE61B0();
    unint64_t v31 = v30;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v7);
    uint64_t v66 = sub_24CAA4228(v29, v31, &v64);
    sub_24CAE5ED0();

    swift_bridgeObjectRelease();
    uint64_t v32 = v61;
    _os_log_impl(&dword_24CA9E000, v22, v23, "DepthFormatter: No workout stats for dive %s", v61, 0xCu);
    swift_arrayDestroy();
    uint64_t v33 = v27;
    retstr = v63;
    MEMORY[0x253308900](v33, -1, -1);
    MEMORY[0x253308900](v32, -1, -1);
  }
  else
  {
  }
  uint64_t v34 = sub_24CAA9C64();
  uint64_t v36 = v35;
  uint64_t v37 = (void *)0xE200000000000000;
  uint64_t v38 = 11565;
  uint64_t v39 = 11565;
  uint64_t v40 = (void *)0xE200000000000000;
LABEL_23:
  retstr->formattedString._countAndFlagsBits = v38;
  retstr->formattedString._object = v37;
  retstr->valueString._countAndFlagsBits = v39;
  retstr->valueString._object = v40;
  retstr->unitString.value._countAndFlagsBits = v34;
  retstr->unitString.value._object = v36;
}

unint64_t sub_24CAA9B68()
{
  unint64_t result = qword_26980A820;
  if (!qword_26980A820)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26980A820);
  }
  return result;
}

unint64_t sub_24CAA9BA8()
{
  unint64_t result = qword_26980AB50;
  if (!qword_26980AB50)
  {
    sub_24CAE57A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AB50);
  }
  return result;
}

uint64_t sub_24CAA9C00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24CAA9C64()
{
  return sub_24CAA9C9C();
}

uint64_t sub_24CAA9C80()
{
  return sub_24CAA9C9C();
}

uint64_t sub_24CAA9C9C()
{
  unint64_t v0 = (void *)sub_24CAE5AE0();
  id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  if (!v1) {
    return 11565;
  }
  uint64_t v2 = (void *)sub_24CAE5AE0();
  uint64_t v3 = (void *)sub_24CAE5AE0();
  id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  uint64_t v5 = sub_24CAE5B20();
  return v5;
}

uint64_t DiveMetrics.samples(for:)()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = sub_24CAE5B20();
  uint64_t v5 = v4;
  if (v3 == sub_24CAE5B20() && v5 == v6) {
    goto LABEL_13;
  }
  char v8 = sub_24CAE61D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    return v1;
  }
  uint64_t v9 = sub_24CAE5B20();
  uint64_t v11 = v10;
  if (v9 == sub_24CAE5B20() && v11 == v12)
  {
    uint64_t v1 = v2;
LABEL_13:
    swift_bridgeObjectRelease_n();
    goto LABEL_14;
  }
  char v14 = sub_24CAE61D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v2;
  if (v14) {
    goto LABEL_14;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_24CAA9EC4@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (os_unfair_lock_s *)(v1 + 120);
  swift_beginAccess();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 120));
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  uint64_t v6 = *(void *)(v1 + 48);
  uint64_t v7 = *(void *)(v1 + 56);
  uint64_t v8 = *(void *)(v1 + 64);
  uint64_t v9 = *(void *)(v1 + 72);
  uint64_t v10 = *(void *)(v1 + 80);
  uint64_t v11 = *(void *)(v1 + 88);
  uint64_t v12 = *(void *)(v1 + 96);
  uint64_t v13 = *(void *)(v1 + 104);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  a1[9] = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v3);
  return swift_endAccess();
}

void sub_24CAA9F88()
{
  uint64_t v0 = swift_allocObject();
  swift_weakInit();
  sub_24CAA1114(0, (unint64_t *)&qword_26980A820);
  uint64_t v1 = (void *)*MEMORY[0x263F09F58];
  swift_retain();
  id v2 = (id)MEMORY[0x253307DB0](v1);
  sub_24CAAA76C(v2, (uint64_t)sub_24CAAB1E0, v0);
  swift_release_n();
}

void sub_24CAAA058(uint64_t a1, void *a2, uint64_t a3)
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    uint64_t v6 = (void *)swift_allocObject();
    v6[2] = a3;
    v6[3] = a2;
    v6[4] = a1;
    sub_24CAA1114(0, (unint64_t *)&qword_26980A820);
    uint64_t v7 = (void *)*MEMORY[0x263F09F18];
    swift_retain();
    id v8 = a2;
    swift_bridgeObjectRetain();
    uint64_t v9 = (void *)MEMORY[0x253307DB0](v7);
    sub_24CAAA76C(v9, (uint64_t)sub_24CAAB760, (uint64_t)v6);
    swift_release();
    swift_release();
  }
}

void sub_24CAAA16C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9 = 0x296C696E28;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v11 = Strong;
    if (a4)
    {
      swift_release();
      goto LABEL_5;
    }
    if (a2)
    {
      swift_release();
      unint64_t v14 = 0xE500000000000000;
      uint64_t v12 = 0x296C696E28;
      goto LABEL_10;
    }
    swift_beginAccess();
    os_unfair_lock_lock((os_unfair_lock_t)(v11 + 120));
    swift_endAccess();
    id v22 = objc_msgSend(*(id *)(v11 + 24), sel_metadata);
    if (!v22) {
      goto LABEL_24;
    }
    os_log_type_t v23 = v22;
    uint64_t v24 = sub_24CAE5A60();

    if (*(void *)(v24 + 16))
    {
      unint64_t v25 = sub_24CAA4890(0xD000000000000028, 0x800000024CAEB6E0);
      if (v26)
      {
        sub_24CAA5108(*(void *)(v24 + 56) + 32 * v25, (uint64_t)&v49);
        sub_24CAA1114(0, (unint64_t *)&qword_26980B140);
        if (swift_dynamicCast())
        {
          uint64_t v27 = (void *)v51;
          if (*(void *)(v24 + 16)
            && (unint64_t v28 = sub_24CAA4890(0xD000000000000026, 0x800000024CAEB710), (v29 & 1) != 0))
          {
            sub_24CAA5108(*(void *)(v24 + 56) + 32 * v28, (uint64_t)&v49);
          }
          else
          {
            long long v49 = 0u;
            long long v50 = 0u;
          }
          swift_bridgeObjectRelease();
          if (!*((void *)&v50 + 1))
          {

            sub_24CAA51D0((uint64_t)&v49, &qword_26980AB78);
            goto LABEL_24;
          }
          if ((swift_dynamicCast() & 1) == 0)
          {

            goto LABEL_24;
          }
          unint64_t v31 = (void *)v51;
          id v32 = objc_msgSend(*(id *)(v11 + 128), sel_stringFromNumber_, v27);
          if (!v32)
          {

            goto LABEL_24;
          }
          uint64_t v33 = v32;
          uint64_t v34 = sub_24CAE5B20();
          uint64_t v36 = v35;

          id v37 = *(id *)(v11 + 136);
          objc_msgSend(v31, sel_doubleValue);
          id v38 = objc_msgSend(v37, sel_stringFromTimeInterval_);

          if (v38)
          {
            uint64_t v39 = sub_24CAE5B20();
            uint64_t v47 = v40;
            uint64_t v48 = v39;

            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v41 = sub_24CAACB24(a1);
            uint64_t v46 = v31;
            uint64_t v43 = v42;
            uint64_t v44 = sub_24CAAD178(a5);
            *(void *)(v11 + 32) = a1;
            *(void *)(v11 + 40) = a5;
            *(void *)(v11 + 48) = v34;
            *(void *)(v11 + 56) = v36;
            *(void *)(v11 + 64) = v41;
            *(void *)(v11 + 72) = v43;
            *(void *)(v11 + 80) = v48;
            *(void *)(v11 + 88) = v47;
            *(void *)(v11 + 96) = v44;
            *(void *)(v11 + 104) = v45;

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_25;
          }
        }
      }
    }
    swift_bridgeObjectRelease();
LABEL_24:
    sub_24CAE5D90();
    sub_24CAA1114(0, (unint64_t *)&qword_26980AB70);
    unint64_t v30 = (void *)sub_24CAE5E90();
    sub_24CAE5830();

LABEL_25:
    swift_beginAccess();
    os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 120));
    swift_endAccess();
    swift_release();
    return;
  }
  if (!a4)
  {
    unint64_t v14 = 0xE500000000000000;
    uint64_t v12 = 0x296C696E28;
    if (!a2) {
      goto LABEL_6;
    }
LABEL_10:
    swift_getErrorValue();
    uint64_t v9 = sub_24CAE61F0();
    unint64_t v15 = v16;
    goto LABEL_11;
  }
LABEL_5:
  swift_getErrorValue();
  uint64_t v12 = sub_24CAE61F0();
  unint64_t v14 = v13;
  if (a2) {
    goto LABEL_10;
  }
LABEL_6:
  unint64_t v15 = 0xE500000000000000;
LABEL_11:
  os_log_type_t v17 = sub_24CAE5D90();
  sub_24CAA1114(0, (unint64_t *)&qword_26980AB70);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v18 = sub_24CAE5E90();
  os_log_type_t v19 = v17;
  if (os_log_type_enabled(v18, v17))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(void *)&long long v49 = v21;
    *(_DWORD *)uint64_t v20 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v51 = sub_24CAA4228(v12, v14, (uint64_t *)&v49);
    sub_24CAE5ED0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v20 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v51 = sub_24CAA4228(v9, v15, (uint64_t *)&v49);
    sub_24CAE5ED0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CA9E000, v18, v19, "DivingDataCalculator internal error: %s %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253308900](v21, -1, -1);
    MEMORY[0x253308900](v20, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

void sub_24CAAA76C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = MEMORY[0x263F8EE78];
  uint64_t v8 = *(void *)(v3 + 112);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = v7;
  v9[5] = a1;
  id v10 = objc_allocWithZone(MEMORY[0x263F0A650]);
  v14[4] = sub_24CAAB66C;
  v14[5] = v9;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_24CAAB004;
  v14[3] = &block_descriptor;
  uint64_t v11 = _Block_copy(v14);
  id v12 = a1;
  swift_retain();
  swift_retain();
  id v13 = objc_msgSend(v10, sel_initWithQuantityType_predicate_quantityHandler_, v12, v8, v11);
  _Block_release(v11);
  swift_release();
  objc_msgSend(*(id *)(v3 + 16), sel_executeQuery_, v13);
  swift_release();
}

uint64_t sub_24CAAA8D8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, void (*a7)(uint64_t, uint64_t), uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v38 = a8;
  uint64_t v39 = a7;
  uint64_t v37 = a6;
  int v40 = a5;
  uint64_t v12 = sub_24CAE5730();
  uint64_t v35 = *(void *)(v12 - 8);
  uint64_t v36 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  os_log_type_t v17 = (char *)&v34 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB68);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_24CAE5630();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t result = MEMORY[0x270FA5388](v21);
  unint64_t v25 = (char *)&v34 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
LABEL_4:
    if ((v40 & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
  sub_24CAAB6B0(a3, (uint64_t)v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    uint64_t result = sub_24CAA51D0((uint64_t)v20, &qword_26980AB68);
    goto LABEL_4;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v25, v20, v21);
  id v27 = a2;
  id v28 = a10;
  sub_24CAE5610();
  sub_24CAE55F0();
  char v29 = (void *)sub_24CAE56E0();
  unint64_t v30 = (void *)sub_24CAE56E0();
  id v34 = objc_msgSend(self, sel_quantitySampleWithType_quantity_startDate_endDate_, v28, v27, v29, v30);

  uint64_t v31 = v36;
  id v32 = *(void (**)(char *, uint64_t))(v35 + 8);
  v32(v15, v36);
  v32(v17, v31);
  uint64_t v33 = swift_beginAccess();
  MEMORY[0x253307C00](v33);
  if (*(void *)((*(void *)(a9 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(a9 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_24CAE5C40();
  sub_24CAE5C70();
  sub_24CAE5C30();
  swift_endAccess();

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v25, v21);
  if (v40)
  {
LABEL_5:
    swift_beginAccess();
    uint64_t v26 = swift_bridgeObjectRetain();
    v39(v26, v37);
    return swift_bridgeObjectRelease();
  }
  return result;
}

id *DepthDataCalculator.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t DepthDataCalculator.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

BOOL static HKQuantitySample.< infix(_:_:)(void *a1, void *a2)
{
  id v3 = objc_msgSend(a1, sel_quantity);
  objc_msgSend(v3, sel__value);
  double v5 = v4;

  id v6 = objc_msgSend(a2, sel_quantity);
  objc_msgSend(v6, sel__value);
  double v8 = v7;

  return v5 < v8;
}

BOOL static HKQuantitySample.> infix(_:_:)(void *a1, void *a2)
{
  id v3 = objc_msgSend(a1, sel_quantity);
  objc_msgSend(v3, sel__value);
  double v5 = v4;

  id v6 = objc_msgSend(a2, sel_quantity);
  objc_msgSend(v6, sel__value);
  double v8 = v7;

  return v8 < v5;
}

BOOL sub_24CAAAEDC(id *a1, void **a2)
{
  id v2 = *a2;
  id v3 = objc_msgSend(*a1, sel_quantity);
  objc_msgSend(v3, sel__value);
  double v5 = v4;

  id v6 = objc_msgSend(v2, sel_quantity);
  objc_msgSend(v6, sel__value);
  double v8 = v7;

  return v5 < v8;
}

BOOL sub_24CAAAF74(id *a1, void **a2)
{
  id v2 = *a2;
  id v3 = objc_msgSend(*a1, sel_quantity);
  objc_msgSend(v3, sel__value);
  double v5 = v4;

  id v6 = objc_msgSend(v2, sel_quantity);
  objc_msgSend(v6, sel__value);
  double v8 = v7;

  return v8 < v5;
}

uint64_t sub_24CAAB004(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, unsigned int a6, void *a7)
{
  unsigned int v25 = a6;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB68);
  MEMORY[0x270FA5388](v13 - 8);
  unint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void (**)(id, void *, char *, void *, void, void *))(a1 + 32);
  if (a4)
  {
    sub_24CAE55E0();
    uint64_t v17 = sub_24CAE5630();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = sub_24CAE5630();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  }
  swift_retain();
  id v19 = a2;
  id v20 = a3;
  id v21 = a5;
  id v22 = a7;
  v16(v19, a3, v15, a5, v25, a7);

  swift_release();
  return sub_24CAA51D0((uint64_t)v15, &qword_26980AB68);
}

uint64_t sub_24CAAB1A8()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24CAAB1E0(uint64_t a1, void *a2)
{
  sub_24CAAA058(a1, a2, v2);
}

unint64_t sub_24CAAB1EC()
{
  unint64_t result = qword_26980AB58;
  if (!qword_26980AB58)
  {
    sub_24CAA1114(255, &qword_26980AB60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AB58);
  }
  return result;
}

uint64_t destroy for DiveMetrics()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for DiveMetrics(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DiveMetrics(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for DiveMetrics(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DiveMetrics(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DiveMetrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DiveMetrics()
{
  return &type metadata for DiveMetrics;
}

uint64_t type metadata accessor for DepthDataCalculator()
{
  return self;
}

uint64_t method lookup function for DepthDataCalculator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DepthDataCalculator);
}

uint64_t dispatch thunk of DepthDataCalculator.metrics.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of DepthDataCalculator.reload()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t sub_24CAAB5EC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CAAB624()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CAAB66C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  return sub_24CAAA8D8(a1, a2, a3, a4, a5, a6, *(void (**)(uint64_t, uint64_t))(v6 + 16), *(void *)(v6 + 24), *(void *)(v6 + 32), *(void **)(v6 + 40));
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

uint64_t sub_24CAAB6B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CAAB718()
{
  swift_release();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_24CAAB760(unint64_t a1, uint64_t a2)
{
  sub_24CAAA16C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

void *sub_24CAAB76C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      long long v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB88);
      long long v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_24CAAC7C4((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_24CAE6020();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

uint64_t sub_24CAAB864(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_24CAACB10();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_24CAAB8E0(v6);
  return sub_24CAE5FD0();
}

void sub_24CAAB8E0(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_24CAE61A0();
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_132;
    }
    if (v3) {
      sub_24CAAC0F8(0, v3, 1, a1);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_140;
  }
  uint64_t v6 = v4;
  v109 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = (char *)MEMORY[0x263F8EE78];
    uint64_t v119 = MEMORY[0x263F8EE78];
    v117 = (void **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_98:
      if (v11 >= 2)
      {
        uint64_t v103 = *v109;
        do
        {
          unint64_t v104 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_127;
          }
          if (!v103) {
            goto LABEL_139;
          }
          uint64_t v105 = *(void *)&v9[16 * v104 + 32];
          uint64_t v106 = *(void *)&v9[16 * v11 + 24];
          sub_24CAAC22C((id *)(v103 + 8 * v105), (id *)(v103 + 8 * *(void *)&v9[16 * v11 + 16]), v103 + 8 * v106, v117);
          if (v1) {
            break;
          }
          if (v106 < v105) {
            goto LABEL_128;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v9 = sub_24CAAC7B0((uint64_t)v9);
          }
          if (v104 >= *((void *)v9 + 2)) {
            goto LABEL_129;
          }
          v107 = &v9[16 * v104 + 32];
          *(void *)v107 = v105;
          *((void *)v107 + 1) = v106;
          unint64_t v108 = *((void *)v9 + 2);
          if (v11 > v108) {
            goto LABEL_130;
          }
          memmove(&v9[16 * v11 + 16], &v9[16 * v11 + 32], 16 * (v108 - v11));
          *((void *)v9 + 2) = v108 - 1;
          unint64_t v11 = v108 - 1;
        }
        while (v108 > 2);
      }
LABEL_109:
      swift_bridgeObjectRelease();
      *(void *)((v119 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_24CAE5C30();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    sub_24CAA1114(0, &qword_26980AB60);
    uint64_t v8 = sub_24CAE5C60();
    *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    v117 = (void **)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v119 = v8;
  }
  uint64_t v112 = v6;
  uint64_t v10 = 0;
  uint64_t v118 = *a1;
  uint64_t v110 = *a1 - 8;
  uint64_t v111 = *a1 + 16;
  uint64_t v9 = (char *)MEMORY[0x263F8EE78];
  uint64_t v115 = v3;
  while (1)
  {
    uint64_t v12 = v10++;
    uint64_t v114 = v12;
    if (v10 < v3)
    {
      uint64_t v13 = *(void **)(v118 + 8 * v12);
      id v14 = *(id *)(v118 + 8 * v10);
      id v15 = v13;
      id v16 = objc_msgSend(v14, sel_quantity);
      objc_msgSend(v16, sel__value);
      double v18 = v17;

      id v19 = objc_msgSend(v15, sel_quantity);
      objc_msgSend(v19, sel__value);
      double v21 = v20;

      uint64_t v3 = v115;
      uint64_t v10 = v12 + 2;
      if (v12 + 2 < v115)
      {
        id v22 = (id *)(v111 + 8 * v12);
        while (1)
        {
          os_log_type_t v23 = *(v22 - 1);
          id v24 = *v22;
          id v25 = v23;
          id v26 = objc_msgSend(v24, sel_quantity);
          objc_msgSend(v26, sel__value);
          double v28 = v27;

          id v29 = objc_msgSend(v25, sel_quantity);
          objc_msgSend(v29, sel__value);
          double v31 = v30;

          if (v18 < v21 == v28 >= v31) {
            break;
          }
          ++v10;
          ++v22;
          uint64_t v3 = v115;
          if (v115 == v10)
          {
            uint64_t v10 = v115;
            goto LABEL_22;
          }
        }
        uint64_t v3 = v115;
LABEL_22:
        uint64_t v12 = v114;
      }
      if (v18 < v21)
      {
        if (v10 < v12) {
          goto LABEL_133;
        }
        if (v12 < v10)
        {
          id v32 = (uint64_t *)(v110 + 8 * v10);
          uint64_t v33 = v10;
          uint64_t v34 = v12;
          uint64_t v35 = (uint64_t *)(v118 + 8 * v12);
          do
          {
            if (v34 != --v33)
            {
              if (!v118) {
                goto LABEL_138;
              }
              uint64_t v36 = *v35;
              *uint64_t v35 = *v32;
              *id v32 = v36;
            }
            ++v34;
            --v32;
            ++v35;
          }
          while (v34 < v33);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_40;
    }
    if (__OFSUB__(v10, v12)) {
      goto LABEL_131;
    }
    if (v10 - v12 >= v112) {
      goto LABEL_40;
    }
    if (__OFADD__(v12, v112)) {
      goto LABEL_134;
    }
    uint64_t v37 = v12 + v112 >= v3 ? v3 : v12 + v112;
    if (v37 < v12) {
      break;
    }
    if (v10 != v37)
    {
      uint64_t v90 = v110 + 8 * v10;
      uint64_t v38 = v118;
      uint64_t v113 = v37;
      do
      {
        v91 = *(void **)(v118 + 8 * v10);
        uint64_t v92 = v12;
        uint64_t v116 = v90;
        do
        {
          v93 = *(void **)v90;
          id v94 = v91;
          id v95 = v93;
          id v96 = objc_msgSend(v94, sel_quantity);
          objc_msgSend(v96, sel__value);
          double v98 = v97;

          id v99 = objc_msgSend(v95, sel_quantity);
          objc_msgSend(v99, sel__value);
          double v101 = v100;

          if (v98 >= v101) {
            break;
          }
          if (!v118) {
            goto LABEL_136;
          }
          v102 = *(void **)v90;
          v91 = *(void **)(v90 + 8);
          *(void *)uint64_t v90 = v91;
          *(void *)(v90 + 8) = v102;
          v90 -= 8;
          ++v92;
        }
        while (v10 != v92);
        ++v10;
        uint64_t v90 = v116 + 8;
        uint64_t v12 = v114;
      }
      while (v10 != v113);
      uint64_t v10 = v113;
      if (v113 < v114) {
        goto LABEL_126;
      }
      goto LABEL_41;
    }
LABEL_40:
    uint64_t v38 = v118;
    if (v10 < v12) {
      goto LABEL_126;
    }
LABEL_41:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v9 = sub_24CAAC5F8(0, *((void *)v9 + 2) + 1, 1, v9);
    }
    unint64_t v40 = *((void *)v9 + 2);
    unint64_t v39 = *((void *)v9 + 3);
    unint64_t v11 = v40 + 1;
    if (v40 >= v39 >> 1) {
      uint64_t v9 = sub_24CAAC5F8((char *)(v39 > 1), v40 + 1, 1, v9);
    }
    *((void *)v9 + 2) = v11;
    uint64_t v41 = v9 + 32;
    uint64_t v42 = &v9[16 * v40 + 32];
    *(void *)uint64_t v42 = v12;
    *((void *)v42 + 1) = v10;
    if (v40)
    {
      while (1)
      {
        unint64_t v43 = v11 - 1;
        if (v11 >= 4)
        {
          uint64_t v48 = &v41[16 * v11];
          uint64_t v49 = *((void *)v48 - 8);
          uint64_t v50 = *((void *)v48 - 7);
          BOOL v54 = __OFSUB__(v50, v49);
          uint64_t v51 = v50 - v49;
          if (v54) {
            goto LABEL_115;
          }
          uint64_t v53 = *((void *)v48 - 6);
          uint64_t v52 = *((void *)v48 - 5);
          BOOL v54 = __OFSUB__(v52, v53);
          uint64_t v46 = v52 - v53;
          char v47 = v54;
          if (v54) {
            goto LABEL_116;
          }
          unint64_t v55 = v11 - 2;
          uint64_t v56 = &v41[16 * v11 - 32];
          uint64_t v58 = *(void *)v56;
          uint64_t v57 = *((void *)v56 + 1);
          BOOL v54 = __OFSUB__(v57, v58);
          uint64_t v59 = v57 - v58;
          if (v54) {
            goto LABEL_118;
          }
          BOOL v54 = __OFADD__(v46, v59);
          uint64_t v60 = v46 + v59;
          if (v54) {
            goto LABEL_121;
          }
          if (v60 >= v51)
          {
            uint64_t v78 = &v41[16 * v43];
            uint64_t v80 = *(void *)v78;
            uint64_t v79 = *((void *)v78 + 1);
            BOOL v54 = __OFSUB__(v79, v80);
            uint64_t v81 = v79 - v80;
            if (v54) {
              goto LABEL_125;
            }
            BOOL v71 = v46 < v81;
            goto LABEL_77;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v72 = *((void *)v9 + 4);
            uint64_t v73 = *((void *)v9 + 5);
            BOOL v54 = __OFSUB__(v73, v72);
            uint64_t v65 = v73 - v72;
            char v66 = v54;
            goto LABEL_71;
          }
          uint64_t v45 = *((void *)v9 + 4);
          uint64_t v44 = *((void *)v9 + 5);
          BOOL v54 = __OFSUB__(v44, v45);
          uint64_t v46 = v44 - v45;
          char v47 = v54;
        }
        if (v47) {
          goto LABEL_117;
        }
        unint64_t v55 = v11 - 2;
        uint64_t v61 = &v41[16 * v11 - 32];
        uint64_t v63 = *(void *)v61;
        uint64_t v62 = *((void *)v61 + 1);
        BOOL v64 = __OFSUB__(v62, v63);
        uint64_t v65 = v62 - v63;
        char v66 = v64;
        if (v64) {
          goto LABEL_120;
        }
        uint64_t v67 = &v41[16 * v43];
        uint64_t v69 = *(void *)v67;
        uint64_t v68 = *((void *)v67 + 1);
        BOOL v54 = __OFSUB__(v68, v69);
        uint64_t v70 = v68 - v69;
        if (v54) {
          goto LABEL_123;
        }
        if (__OFADD__(v65, v70)) {
          goto LABEL_124;
        }
        if (v65 + v70 >= v46)
        {
          BOOL v71 = v46 < v70;
LABEL_77:
          if (v71) {
            unint64_t v43 = v55;
          }
          goto LABEL_79;
        }
LABEL_71:
        if (v66) {
          goto LABEL_119;
        }
        v74 = &v41[16 * v43];
        uint64_t v76 = *(void *)v74;
        uint64_t v75 = *((void *)v74 + 1);
        BOOL v54 = __OFSUB__(v75, v76);
        uint64_t v77 = v75 - v76;
        if (v54) {
          goto LABEL_122;
        }
        if (v77 < v65) {
          goto LABEL_14;
        }
LABEL_79:
        unint64_t v82 = v43 - 1;
        if (v43 - 1 >= v11)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
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
          goto LABEL_135;
        }
        uint64_t v83 = v38;
        if (!v38) {
          goto LABEL_137;
        }
        v84 = v9;
        v85 = &v41[16 * v82];
        uint64_t v86 = *(void *)v85;
        v87 = &v41[16 * v43];
        uint64_t v88 = *((void *)v87 + 1);
        sub_24CAAC22C((id *)(v83 + 8 * *(void *)v85), (id *)(v83 + 8 * *(void *)v87), v83 + 8 * v88, v117);
        if (v1) {
          goto LABEL_109;
        }
        if (v88 < v86) {
          goto LABEL_112;
        }
        if (v43 > *((void *)v84 + 2)) {
          goto LABEL_113;
        }
        *(void *)v85 = v86;
        *(void *)&v41[16 * v82 + 8] = v88;
        unint64_t v89 = *((void *)v84 + 2);
        if (v43 >= v89) {
          goto LABEL_114;
        }
        uint64_t v9 = v84;
        unint64_t v11 = v89 - 1;
        memmove(&v41[16 * v43], v87 + 16, 16 * (v89 - 1 - v43));
        *((void *)v84 + 2) = v89 - 1;
        uint64_t v38 = v118;
        if (v89 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v11 = 1;
LABEL_14:
    uint64_t v3 = v115;
    if (v10 >= v115) {
      goto LABEL_98;
    }
  }
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
  sub_24CAE6000();
  __break(1u);
}

void sub_24CAAC0F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    uint64_t v6 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v7 = *(void **)(v5 + 8 * v4);
    uint64_t v8 = a1;
    uint64_t v21 = v6;
    while (1)
    {
      uint64_t v9 = *(void **)v6;
      id v10 = v7;
      id v11 = v9;
      id v12 = objc_msgSend(v10, sel_quantity);
      objc_msgSend(v12, sel__value);
      double v14 = v13;

      id v15 = objc_msgSend(v11, sel_quantity);
      objc_msgSend(v15, sel__value);
      double v17 = v16;

      if (v14 >= v17)
      {
LABEL_4:
        ++v4;
        uint64_t v6 = v21 + 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v5) {
        break;
      }
      double v18 = *(void **)v6;
      uint64_t v7 = *(void **)(v6 + 8);
      *(void *)uint64_t v6 = v7;
      *(void *)(v6 + 8) = v18;
      v6 -= 8;
      if (v4 == ++v8) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_24CAAC22C(id *__src, id *a2, unint64_t a3, void **a4)
{
  uint64_t v4 = a2;
  uint64_t v5 = __src;
  int64_t v6 = (char *)a2 - (char *)__src;
  int64_t v7 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v7 = (char *)a2 - (char *)__src;
  }
  uint64_t v8 = v7 >> 3;
  uint64_t v9 = a3 - (void)a2;
  uint64_t v10 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v10 = a3 - (void)a2;
  }
  uint64_t v11 = v10 >> 3;
  uint64_t v48 = __src;
  char v47 = a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != a2 || &a2[v11] <= a4) {
        memmove(a4, a2, 8 * v11);
      }
      id v26 = (char *)&a4[v11];
      uint64_t v46 = v26;
      uint64_t v48 = v4;
      if (v5 < v4 && v9 >= 8)
      {
        double v27 = (id *)(a3 - 8);
        double v28 = v4;
        uint64_t v41 = v5;
        while (1)
        {
          unint64_t v43 = v27 + 1;
          uint64_t v45 = v4;
          id v29 = v26 - 8;
          double v30 = *--v28;
          unint64_t v31 = (unint64_t)v26;
          id v32 = *((id *)v26 - 1);
          id v33 = v30;
          id v34 = objc_msgSend(v32, sel_quantity);
          objc_msgSend(v34, sel__value);
          double v36 = v35;

          id v37 = objc_msgSend(v33, sel_quantity);
          objc_msgSend(v37, sel__value);
          double v39 = v38;

          if (v36 >= v39)
          {
            uint64_t v46 = v29;
            if ((unint64_t)v43 < v31 || (unint64_t)v27 >= v31)
            {
              id *v27 = *(id *)v29;
              double v28 = v45;
              id v26 = v29;
              if (v45 <= v41) {
                goto LABEL_45;
              }
            }
            else
            {
              if (v43 != (id *)v31) {
                id *v27 = *(id *)v29;
              }
              double v28 = v45;
              id v26 = v29;
              if (v45 <= v41) {
                goto LABEL_45;
              }
            }
          }
          else
          {
            if (v43 != v45 || v27 >= v45) {
              id *v27 = *v28;
            }
            uint64_t v48 = v28;
            id v26 = (char *)v31;
            if (v28 <= v41) {
              goto LABEL_45;
            }
          }
          --v27;
          uint64_t v4 = v28;
          if (v26 <= (char *)a4) {
            goto LABEL_45;
          }
        }
      }
      goto LABEL_45;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != __src || &__src[v8] <= a4) {
      memmove(a4, __src, 8 * v8);
    }
    id v12 = (char *)&a4[v8];
    uint64_t v46 = v12;
    if ((unint64_t)v4 < a3 && v6 >= 8)
    {
      double v13 = a4;
      do
      {
        double v14 = v5;
        id v15 = *v13;
        id v16 = *v4;
        id v17 = v15;
        id v18 = objc_msgSend(v16, sel_quantity);
        objc_msgSend(v18, sel__value);
        double v20 = v19;

        id v21 = objc_msgSend(v17, sel_quantity);
        objc_msgSend(v21, sel__value);
        double v23 = v22;

        if (v20 >= v23)
        {
          id v25 = v14;
          if (v14 != v13) {
            *double v14 = *v13;
          }
          char v47 = ++v13;
          id v24 = v4;
        }
        else
        {
          id v24 = v4 + 1;
          id v25 = v14;
          if (v14 < v4 || v14 >= v24 || v14 != v4) {
            *double v14 = *v4;
          }
        }
        uint64_t v5 = v25 + 1;
        if (v13 >= (void **)v12) {
          break;
        }
        uint64_t v4 = v24;
      }
      while ((unint64_t)v24 < a3);
      uint64_t v48 = v5;
    }
LABEL_45:
    sub_24CAAC6F4((void **)&v48, (const void **)&v47, &v46);
    return 1;
  }
  uint64_t result = sub_24CAE6060();
  __break(1u);
  return result;
}

char *sub_24CAAC5F8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26980ABA0);
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
  double v13 = v10 + 32;
  double v14 = a4 + 32;
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

char *sub_24CAAC6F4(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_24CAE6060();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_24CAAC7B0(uint64_t a1)
{
  return sub_24CAAC5F8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24CAAC7C4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24CAE6020();
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
    uint64_t v10 = sub_24CAE6020();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_24CAAD5CC();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB90);
          uint64_t v12 = sub_24CAAC9D8(v16, i, a3);
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
    sub_24CAA1114(0, &qword_26980AB60);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_24CAE6060();
  __break(1u);
  return result;
}

void (*sub_24CAAC9D8(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_24CAACA88(v6, a2, a3);
  return sub_24CAACA40;
}

void sub_24CAACA40(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_24CAACA88(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x253307F70](a2, a3);
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
    return sub_24CAACB08;
  }
  __break(1u);
  return result;
}

void sub_24CAACB08(id *a1)
{
}

void sub_24CAACB10()
{
}

uint64_t sub_24CAACB24(unint64_t a1)
{
  unint64_t v3 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    id v4 = (id)sub_24CAE6020();
    swift_bridgeObjectRelease();
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    id v4 = *(id *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
    {
LABEL_10:
      sub_24CAE5D90();
      sub_24CAA1114(0, (unint64_t *)&qword_26980AB70);
      uint64_t v9 = (void *)sub_24CAE5E90();
      sub_24CAE5830();
LABEL_11:

      return 11565;
    }
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v4 = (id)MEMORY[0x253307F70](0, a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_26;
    }
    id v4 = *(id *)(a1 + 32);
  }
  sub_24CAA1114(0, &qword_26980AB80);
  id v5 = objc_msgSend(v4, sel_quantityType);
  sub_24CAA1114(0, (unint64_t *)&qword_26980A820);
  unint64_t v6 = (void *)MEMORY[0x253307DB0]((id)*MEMORY[0x263F09F18]);
  char v7 = sub_24CAE5E80();

  if ((v7 & 1) == 0)
  {

    goto LABEL_10;
  }
  if (v3)
  {
    unint64_t v11 = swift_bridgeObjectRetain();
    uint64_t v8 = (uint64_t)sub_24CAAB76C(v11);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v20[0] = v8;
  sub_24CAAB864(v20);
  uint64_t v1 = v20[0];
  if ((v20[0] & 0x8000000000000000) == 0 && (v20[0] & 0x4000000000000000) == 0)
  {
    uint64_t v12 = *(void *)(v20[0] + 16);
    if (v12) {
      goto LABEL_16;
    }
    goto LABEL_27;
  }
LABEL_26:
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_24CAE6020();
  swift_release();
  if (!v12)
  {
LABEL_27:
    swift_release();
    sub_24CAE5D90();
    sub_24CAA1114(0, (unint64_t *)&qword_26980AB70);
    uint64_t v9 = (void *)sub_24CAE5E90();
    sub_24CAE5830();

    goto LABEL_11;
  }
LABEL_16:
  unint64_t v13 = v12 - 1;
  if (__OFSUB__(v12, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if ((v1 & 0xC000000000000001) != 0)
  {
LABEL_29:
    id v14 = (id)MEMORY[0x253307F70](v13, v1);
    goto LABEL_21;
  }
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v13 < *(void *)(v1 + 16))
  {
    id v14 = *(id *)(v1 + 8 * v13 + 32);
LABEL_21:
    id v15 = v14;
    swift_release();
    v20[0] = 0;
    v20[1] = 0xE000000000000000;
    id v16 = objc_msgSend(v15, sel_quantity);
    objc_msgSend(v16, sel__value);

    sub_24CAE5D30();
    id v17 = objc_msgSend(v15, sel_quantity);
    id v18 = objc_msgSend(v17, sel__unit);

    id v19 = objc_msgSend(self, sel_meterUnit);
    sub_24CAE5E80();

    sub_24CAE5BB0();
    swift_bridgeObjectRelease();
    return v20[0];
  }
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

void sub_24CAACF24(double a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    sub_24CAA1114(0, &qword_26980AB80);
    id v4 = objc_msgSend(self, sel_degreeCelsiusUnit);
    sub_24CAE5E80();

    sub_24CAE5BB0();
    swift_bridgeObjectRelease();
  }
  if ((~*(void *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (a1 < 9.22337204e18)
  {
    sub_24CAE61B0();
    sub_24CAE5BB0();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_9:
  __break(1u);
}

void sub_24CAAD078(uint64_t a1, double a2, double a3)
{
  if (a2 == a3)
  {
    sub_24CAACF24(a2, a1, 0);
    return;
  }
  if ((~*(void *)&a2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (a2 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (a2 < 9.22337204e18)
  {
    sub_24CAE61B0();
    sub_24CAE5BB0();
    sub_24CAE5BB0();
    sub_24CAACF24(a3, a1, 0);
    sub_24CAE5BB0();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_24CAAD178(unint64_t a1)
{
  unint64_t v3 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    id v4 = (id)sub_24CAE6020();
    swift_bridgeObjectRelease();
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    id v4 = *(id *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
    {
LABEL_10:
      sub_24CAE5D90();
      sub_24CAA1114(0, (unint64_t *)&qword_26980AB70);
      uint64_t v9 = (void *)sub_24CAE5E90();
      sub_24CAE5830();
LABEL_11:

      return 11565;
    }
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v4 = (id)MEMORY[0x253307F70](0, a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_31;
    }
    id v4 = *(id *)(a1 + 32);
  }
  sub_24CAA1114(0, &qword_26980AB80);
  id v5 = objc_msgSend(v4, sel_quantityType);
  sub_24CAA1114(0, (unint64_t *)&qword_26980A820);
  unint64_t v6 = (void *)MEMORY[0x253307DB0]((id)*MEMORY[0x263F09F58]);
  char v7 = sub_24CAE5E80();

  if ((v7 & 1) == 0)
  {

    goto LABEL_10;
  }
  if (v3)
  {
    unint64_t v12 = swift_bridgeObjectRetain();
    uint64_t v8 = (uint64_t)sub_24CAAB76C(v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v30 = v8;
  sub_24CAAB864(&v30);
  uint64_t v1 = v30;
  if ((v30 & 0x8000000000000000) == 0 && (v30 & 0x4000000000000000) == 0)
  {
    uint64_t v13 = *(void *)(v30 + 16);
    swift_retain();
    if (v13) {
      goto LABEL_17;
    }
    goto LABEL_32;
  }
LABEL_31:
  swift_retain();
  uint64_t v13 = sub_24CAE6020();
  if (!v13)
  {
LABEL_32:
    swift_release_n();
    sub_24CAE5D90();
    sub_24CAA1114(0, (unint64_t *)&qword_26980AB70);
    uint64_t v9 = (void *)sub_24CAE5E90();
    sub_24CAE5830();

    goto LABEL_11;
  }
LABEL_17:
  if ((v1 & 0xC000000000000001) == 0)
  {
    if (*(void *)(v1 + 16))
    {
      id v14 = *(id *)(v1 + 32);
      swift_release();
      unint64_t v15 = v13 - 1;
      if (!__OFSUB__(v13, 1))
      {
        if ((v15 & 0x8000000000000000) == 0)
        {
          if (v15 < *(void *)(v1 + 16))
          {
            id v16 = *(id *)(v1 + 32 + 8 * v15);
LABEL_23:
            id v17 = v16;
            swift_release();
            id v18 = objc_msgSend(v14, sel_quantity);
            objc_msgSend(v18, sel__value);
            double v20 = v19;

            double v21 = floor(v20);
            id v22 = objc_msgSend(v17, sel_quantity);
            objc_msgSend(v22, sel__value);
            double v24 = v23;

            double v25 = ceil(v24);
            if (v21 == v25)
            {
              id v26 = objc_msgSend(v14, sel_quantity);
              id v27 = objc_msgSend(v26, sel__unit);

              sub_24CAACF24(v21, (uint64_t)v27, 0);
            }
            else
            {
              id v29 = objc_msgSend(v17, sel_quantity);
              id v27 = objc_msgSend(v29, sel__unit);

              sub_24CAAD078((uint64_t)v27, v21, v25);
            }
            uint64_t v10 = v28;

            return v10;
          }
          goto LABEL_38;
        }
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_37;
  }
  id v14 = (id)MEMORY[0x253307F70](0, v1);
  swift_release();
  if (!__OFSUB__(v13, 1))
  {
    id v16 = (id)MEMORY[0x253307F70](v13 - 1, v1);
    goto LABEL_23;
  }
LABEL_39:
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_24CAAD5CC()
{
  unint64_t result = qword_26980AB98;
  if (!qword_26980AB98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26980AB90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AB98);
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

uint64_t DepthFeatureKey.isEnabled.getter()
{
  char v1 = *v0;
  if (qword_26980A750 != -1) {
    swift_once();
  }
  uint64_t v2 = off_26980ABB0;
  swift_beginAccess();
  uint64_t v3 = v2[2];
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_24CAA4908(v1), (v5 & 1) != 0)) {
    uint64_t v6 = *(unsigned __int8 *)(*(void *)(v3 + 56) + v4);
  }
  else {
    uint64_t v6 = 0;
  }
  swift_endAccess();
  return v6;
}

Swift::Bool __swiftcall DepthFeatures.isEnabled(_:)(DepthCore::DepthFeatureKey a1)
{
  char v2 = *(unsigned char *)a1;
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 16);
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_24CAA4908(v2), (v5 & 1) != 0)) {
    char v6 = *(unsigned char *)(*(void *)(v3 + 56) + v4);
  }
  else {
    char v6 = 0;
  }
  swift_endAccess();
  return v6;
}

const char *DepthFeatureKey.domain.getter()
{
  return "Depth";
}

const char *DepthFeatureKey.feature.getter()
{
  if (*v0) {
    return "Sundrift";
  }
  else {
    return "divingd";
  }
}

BOOL static DepthFeatureKey.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DepthFeatureKey.hash(into:)()
{
  return sub_24CAE6250();
}

uint64_t DepthFeatureKey.hashValue.getter()
{
  return sub_24CAE6260();
}

BOOL sub_24CAAD854(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24CAAD86C()
{
  return sub_24CAE6260();
}

uint64_t sub_24CAAD8B4()
{
  return sub_24CAE6250();
}

uint64_t sub_24CAAD8E0()
{
  return sub_24CAE6260();
}

const char *sub_24CAAD924()
{
  return "Depth";
}

const char *sub_24CAAD938()
{
  if (*v0) {
    return "Sundrift";
  }
  else {
    return "divingd";
  }
}

void *sub_24CAAD964()
{
  type metadata accessor for DepthFeatures();
  swift_allocObject();
  uint64_t result = (void *)sub_24CAAD9FC();
  off_26980ABB0 = result;
  return result;
}

uint64_t static DepthFeatures.shared.getter()
{
  if (qword_26980A750 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_24CAAD9FC()
{
  *(void *)(v0 + 16) = sub_24CAC6AD0(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980ABC8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CAE6F10;
  *(unsigned char *)(inited + 32) = 0;
  char v7 = &type metadata for DepthFeatureKey;
  unint64_t v2 = sub_24CAAE87C();
  unint64_t v8 = v2;
  v6[0] = 0;
  char v3 = sub_24CAE5820();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  *(unsigned char *)(inited + 33) = v3 & 1;
  *(unsigned char *)(inited + 34) = 1;
  char v7 = &type metadata for DepthFeatureKey;
  unint64_t v8 = v2;
  v6[0] = 1;
  LOBYTE(v2) = sub_24CAE5820();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  *(unsigned char *)(inited + 35) = v2 & 1;
  unint64_t v4 = sub_24CAC6AD0(inited);
  swift_setDeallocating();
  swift_beginAccess();
  *(void *)(v0 + 16) = v4;
  swift_bridgeObjectRelease();
  return v0;
}

Swift::Void __swiftcall DepthFeatures.override(feature:_:)(DepthCore::DepthFeatureKey feature, Swift::Bool _)
{
  char v4 = *(unsigned char *)feature;
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *(void *)(v2 + 16);
  *(void *)(v2 + 16) = 0x8000000000000000;
  sub_24CAAE1D0(_, v4, isUniquelyReferenced_nonNull_native);
  *(void *)(v2 + 16) = v6;
  swift_bridgeObjectRelease();
  swift_endAccess();
}

uint64_t DepthFeatures.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DepthFeatures.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_24CAADBF0(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26980B240);
  char v36 = a2;
  uint64_t v6 = sub_24CAE6040();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    id v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_24CAE6240();
    sub_24CAE5BA0();
    uint64_t result = sub_24CAE6260();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    id v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *id v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  id v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_24CAADF08(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980ABC0);
  uint64_t result = sub_24CAE6040();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v30 = a2;
    int64_t v8 = 0;
    uint64_t v31 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v12) {
          goto LABEL_31;
        }
        unint64_t v18 = v31[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v18 = v31[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_31:
              if ((v30 & 1) == 0)
              {
                uint64_t result = swift_release();
                char v3 = v2;
                goto LABEL_38;
              }
              uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
              if (v29 >= 64) {
                bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v31 = -1 << v29;
              }
              char v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v12) {
                  goto LABEL_31;
                }
                unint64_t v18 = v31[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      char v20 = *(unsigned char *)(*(void *)(v5 + 48) + v16);
      char v21 = *(unsigned char *)(*(void *)(v5 + 56) + v16);
      sub_24CAE6240();
      sub_24CAE6250();
      uint64_t result = sub_24CAE6260();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(unsigned char *)(*(void *)(v7 + 48) + v14) = v20;
      *(unsigned char *)(*(void *)(v7 + 56) + v14) = v21;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_24CAAE1D0(char a1, char a2, char a3)
{
  char v4 = v3;
  char v7 = a2 & 1;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_24CAA4908(a2 & 1);
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
    uint64_t result = (uint64_t)sub_24CAAE6F0();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(unsigned char *)(v16[7] + v10) = a1 & 1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = v7;
    *(unsigned char *)(v16[7] + v10) = a1 & 1;
    uint64_t v18 = v16[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_24CAADF08(result, a3 & 1);
  uint64_t result = sub_24CAA4908(v7);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_24CAE61E0();
  __break(1u);
  return result;
}

unint64_t sub_24CAAE308()
{
  unint64_t result = qword_26980ABB8;
  if (!qword_26980ABB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980ABB8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DepthFeatureKey(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DepthFeatureKey(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAAE4B8);
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

unsigned char *sub_24CAAE4E0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DepthFeatureKey()
{
  return &type metadata for DepthFeatureKey;
}

uint64_t type metadata accessor for DepthFeatures()
{
  return self;
}

uint64_t method lookup function for DepthFeatures(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DepthFeatures);
}

void *sub_24CAAE538()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26980B240);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CAE6030();
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_unknownObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24CAAE6F0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980ABC0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CAE6030();
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
    unint64_t v20 = __clz(__rbit64(v18));
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = v20 + (v9 << 6);
LABEL_12:
    char v16 = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = v16;
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

unint64_t sub_24CAAE87C()
{
  unint64_t result = qword_26980ABD0;
  if (!qword_26980ABD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980ABD0);
  }
  return result;
}

double *static TemperatureRange.orderedRange(t1:t2:)@<X0>(double *result@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  double v3 = *result;
  if (*result >= *a2) {
    double v4 = *a2;
  }
  else {
    double v4 = *result;
  }
  if (*result < *a2) {
    double v3 = *a2;
  }
  *(double *)a3 = v4;
  *(double *)(a3 + 8) = v3;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void TemperatureRange.temperatureSpan.getter(uint64_t a1@<X8>)
{
  int v2 = *(unsigned __int8 *)(v1 + 16);
  if (*(unsigned char *)(v1 + 16))
  {
    if (v2 == 1)
    {
      *(double *)a1 = vabdd_f64(*(double *)v1, *(double *)(v1 + 8));
      *(unsigned char *)(a1 + 8) = 0;
    }
    else
    {
      *(void *)a1 = 0;
      *(unsigned char *)(a1 + 8) = 1;
    }
  }
  else
  {
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 8) = v2;
  }
}

void TemperatureRange.average.getter(uint64_t a1@<X8>)
{
  double v2 = *(double *)v1;
  int v3 = *(unsigned __int8 *)(v1 + 16);
  if (*(unsigned char *)(v1 + 16))
  {
    if (v3 == 1)
    {
      *(double *)a1 = (*(double *)(v1 + 8) + v2) * 0.5;
      *(unsigned char *)(a1 + 8) = 0;
    }
    else
    {
      *(void *)a1 = 0;
      *(unsigned char *)(a1 + 8) = 1;
    }
  }
  else
  {
    *(double *)a1 = v2;
    *(unsigned char *)(a1 + 8) = v3;
  }
}

void TemperatureRange.minValue.getter(uint64_t a1@<X8>)
{
  uint64_t v2 = *v1;
  BOOL v3 = *((unsigned __int8 *)v1 + 16) > 1u;
  if (*((unsigned __int8 *)v1 + 16) > 1u) {
    uint64_t v2 = 0;
  }
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3;
}

void TemperatureRange.maxValue.getter(uint64_t a1@<X8>)
{
  int v2 = *(unsigned __int8 *)(v1 + 16);
  if (v2 == 1) {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v2 != 1;
}

uint64_t TemperatureRange.values.getter()
{
  uint64_t v1 = *v0;
  if (*((unsigned char *)v0 + 16))
  {
    if (*((unsigned char *)v0 + 16) == 1)
    {
      uint64_t v2 = v0[1];
      __swift_instantiateConcreteTypeFromMangledName(&qword_26980ABD8);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_24CAE6F10;
      *(void *)(result + 32) = v1;
      *(void *)(result + 40) = v2;
    }
    else
    {
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980ABD8);
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = xmmword_24CAE6F00;
    *(void *)(result + 32) = v1;
  }
  return result;
}

double *TemperatureRange.updated(withTemperature:)@<X0>(double *result@<X0>, uint64_t a2@<X8>)
{
  double v3 = *result;
  double v5 = *(double *)v2;
  double v4 = *(double *)(v2 + 8);
  if (!*(unsigned char *)(v2 + 16))
  {
    if (v3 == v5)
    {
      *(double *)a2 = v5;
      *(double *)(a2 + 8) = v4;
      *(unsigned char *)(a2 + 16) = 0;
      return result;
    }
    if (v3 <= v5)
    {
      *(double *)a2 = v3;
      *(double *)(a2 + 8) = v5;
      goto LABEL_14;
    }
    *(double *)a2 = v5;
    goto LABEL_12;
  }
  if (*(unsigned char *)(v2 + 16) != 1)
  {
    *(double *)a2 = v3;
    *(void *)(a2 + 8) = 0;
    *(unsigned char *)(a2 + 16) = 0;
    return result;
  }
  if (v3 >= v5)
  {
    *(double *)a2 = v5;
    if (v3 <= v4) {
      goto LABEL_9;
    }
LABEL_12:
    *(double *)(a2 + 8) = v3;
    goto LABEL_14;
  }
  *(double *)a2 = v3;
LABEL_9:
  *(double *)(a2 + 8) = v4;
LABEL_14:
  *(unsigned char *)(a2 + 16) = 1;
  return result;
}

uint64_t sub_24CAAEB04(char a1)
{
  return *(void *)&aUnknown_6[8 * a1];
}

BOOL sub_24CAAEB24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24CAAEB38()
{
  return sub_24CAAEB04(*v0);
}

uint64_t sub_24CAAEB40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CAB0440(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CAAEB68()
{
  return 0;
}

void sub_24CAAEB74(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24CAAEB80(uint64_t a1)
{
  unint64_t v2 = sub_24CAAFA24();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAAEBBC(uint64_t a1)
{
  unint64_t v2 = sub_24CAAFA24();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CAAEBF8(char a1)
{
  if (a1) {
    return 12639;
  }
  else {
    return 12383;
  }
}

uint64_t sub_24CAAEC10()
{
  return sub_24CAAEBF8(*v0);
}

uint64_t sub_24CAAEC18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CAB0580(a1, a2);
  *a3 = result;
  return result;
}

void sub_24CAAEC40(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24CAAEC4C(uint64_t a1)
{
  unint64_t v2 = sub_24CAAFA78();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAAEC88(uint64_t a1)
{
  unint64_t v2 = sub_24CAAFA78();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CAAECC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CAB063C(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_24CAAECF4(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24CAAED00(uint64_t a1)
{
  unint64_t v2 = sub_24CAAFB20();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAAED3C(uint64_t a1)
{
  unint64_t v2 = sub_24CAAFB20();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CAAED78()
{
  return 0;
}

uint64_t sub_24CAAED84@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24CAAEDB4(uint64_t a1)
{
  unint64_t v2 = sub_24CAAFB74();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAAEDF0(uint64_t a1)
{
  unint64_t v2 = sub_24CAAFB74();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TemperatureRange.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980ABE0);
  uint64_t v28 = *(void *)(v3 - 8);
  uint64_t v29 = v3;
  MEMORY[0x270FA5388](v3);
  BOOL v27 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980ABE8);
  uint64_t v25 = *(void *)(v5 - 8);
  uint64_t v26 = v5;
  MEMORY[0x270FA5388](v5);
  unint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980ABF0);
  uint64_t v24 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980ABF8);
  uint64_t v31 = *(void *)(v11 - 8);
  uint64_t v32 = v11;
  MEMORY[0x270FA5388](v11);
  int64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = *v1;
  uint64_t v14 = v1[1];
  int v15 = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CAAFA24();
  sub_24CAE6280();
  if (v15)
  {
    if (v15 == 1)
    {
      LOBYTE(v35) = 2;
      sub_24CAAFA78();
      char v16 = v27;
      uint64_t v17 = v32;
      sub_24CAE6120();
      uint64_t v35 = v30;
      char v34 = 0;
      sub_24CAAFACC();
      uint64_t v18 = v29;
      uint64_t v19 = v33;
      sub_24CAE6180();
      if (!v19)
      {
        uint64_t v35 = v14;
        char v34 = 1;
        sub_24CAE6180();
      }
      (*(void (**)(char *, uint64_t))(v28 + 8))(v16, v18);
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v13, v17);
    }
    else
    {
      LOBYTE(v35) = 0;
      sub_24CAAFB74();
      uint64_t v23 = v32;
      sub_24CAE6120();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v8);
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v13, v23);
    }
  }
  else
  {
    LOBYTE(v35) = 1;
    sub_24CAAFB20();
    uint64_t v21 = v32;
    sub_24CAE6120();
    uint64_t v35 = v30;
    sub_24CAAFACC();
    uint64_t v22 = v26;
    sub_24CAE6180();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v13, v21);
  }
}

uint64_t TemperatureRange.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v37 = a2;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AC28);
  uint64_t v36 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  double v39 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AC30);
  uint64_t v35 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AC38);
  double v38 = *(char **)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AC40);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  unint64_t v40 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_24CAAFA24();
  uint64_t v14 = v41;
  sub_24CAE6270();
  if (v14) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v40);
  }
  uint64_t v32 = v6;
  char v16 = v38;
  int v15 = v39;
  uint64_t v41 = v10;
  uint64_t v17 = sub_24CAE6110();
  if (*(void *)(v17 + 16) != 1)
  {
    uint64_t v22 = sub_24CAE5F90();
    swift_allocError();
    uint64_t v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AC48);
    *uint64_t v24 = &type metadata for TemperatureRange;
    sub_24CAE60A0();
    sub_24CAE5F80();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x263F8DCB0], v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v9);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v40);
  }
  if (*(unsigned char *)(v17 + 32))
  {
    if (*(unsigned char *)(v17 + 32) == 1)
    {
      LOBYTE(v44) = 1;
      sub_24CAAFB20();
      sub_24CAE6090();
      sub_24CAAFBC8();
      uint64_t v18 = v33;
      sub_24CAE6100();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v5, v18);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v9);
      uint64_t v19 = 0;
      char v20 = 0;
      uint64_t v21 = v44;
    }
    else
    {
      LOBYTE(v44) = 2;
      sub_24CAAFA78();
      sub_24CAE6090();
      LOBYTE(v43) = 0;
      sub_24CAAFBC8();
      uint64_t v28 = v34;
      uint64_t v29 = v15;
      sub_24CAE6100();
      uint64_t v30 = v28;
      double v38 = v12;
      uint64_t v21 = v44;
      char v42 = 1;
      sub_24CAE6100();
      uint64_t v31 = v41;
      (*(void (**)(char *, uint64_t))(v36 + 8))(v29, v30);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v38, v9);
      uint64_t v19 = v43;
      char v20 = 1;
    }
  }
  else
  {
    LOBYTE(v44) = 0;
    sub_24CAAFB74();
    sub_24CAE6090();
    (*((void (**)(char *, uint64_t))v16 + 1))(v8, v32);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v9);
    uint64_t v21 = 0;
    uint64_t v19 = 0;
    char v20 = 2;
  }
  uint64_t v25 = (uint64_t)v40;
  uint64_t v26 = v37;
  *id v37 = v21;
  v26[1] = v19;
  *((unsigned char *)v26 + 16) = v20;
  return __swift_destroy_boxed_opaque_existential_0(v25);
}

uint64_t sub_24CAAF974@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return TemperatureRange.init(from:)(a1, a2);
}

uint64_t sub_24CAAF98C(void *a1)
{
  return TemperatureRange.encode(to:)(a1);
}

BOOL _s9DepthCore16TemperatureRangeO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)a2;
  int v4 = *(unsigned __int8 *)(a2 + 16);
  if (!*(unsigned char *)(a1 + 16)) {
    return !*(unsigned char *)(a2 + 16) && v2 == v3;
  }
  double v5 = *(double *)(a2 + 8);
  if (*(unsigned char *)(a1 + 16) == 1)
  {
    if (v4 == 1 && v2 == v3) {
      return *(double *)(a1 + 8) == v5;
    }
    return 0;
  }
  uint64_t v7 = *(void *)&v5 | *(void *)&v3;
  return v4 == 2 && v7 == 0;
}

unint64_t sub_24CAAFA24()
{
  unint64_t result = qword_26980AC00;
  if (!qword_26980AC00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC00);
  }
  return result;
}

unint64_t sub_24CAAFA78()
{
  unint64_t result = qword_26980AC08;
  if (!qword_26980AC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC08);
  }
  return result;
}

unint64_t sub_24CAAFACC()
{
  unint64_t result = qword_26980AC10;
  if (!qword_26980AC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC10);
  }
  return result;
}

unint64_t sub_24CAAFB20()
{
  unint64_t result = qword_26980AC18;
  if (!qword_26980AC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC18);
  }
  return result;
}

unint64_t sub_24CAAFB74()
{
  unint64_t result = qword_26980AC20;
  if (!qword_26980AC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC20);
  }
  return result;
}

unint64_t sub_24CAAFBC8()
{
  unint64_t result = qword_26980AC50;
  if (!qword_26980AC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC50);
  }
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for TemperatureRange(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TemperatureRange(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24CAAFCBC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24CAAFCD4(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TemperatureRange()
{
  return &type metadata for TemperatureRange;
}

uint64_t getEnumTagSinglePayload for TemperatureRange.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TemperatureRange.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAAFE58);
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

ValueMetadata *type metadata accessor for TemperatureRange.CodingKeys()
{
  return &type metadata for TemperatureRange.CodingKeys;
}

ValueMetadata *type metadata accessor for TemperatureRange.UnknownCodingKeys()
{
  return &type metadata for TemperatureRange.UnknownCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for TemperatureRange.SingularCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CAAFF3CLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TemperatureRange.SingularCodingKeys()
{
  return &type metadata for TemperatureRange.SingularCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for TemperatureRange.RangeCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAB0040);
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

ValueMetadata *type metadata accessor for TemperatureRange.RangeCodingKeys()
{
  return &type metadata for TemperatureRange.RangeCodingKeys;
}

unint64_t sub_24CAB007C()
{
  unint64_t result = qword_26980AC58;
  if (!qword_26980AC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC58);
  }
  return result;
}

unint64_t sub_24CAB00D4()
{
  unint64_t result = qword_26980AC60;
  if (!qword_26980AC60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC60);
  }
  return result;
}

unint64_t sub_24CAB012C()
{
  unint64_t result = qword_26980AC68;
  if (!qword_26980AC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC68);
  }
  return result;
}

unint64_t sub_24CAB0184()
{
  unint64_t result = qword_26980AC70;
  if (!qword_26980AC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC70);
  }
  return result;
}

unint64_t sub_24CAB01DC()
{
  unint64_t result = qword_26980AC78;
  if (!qword_26980AC78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC78);
  }
  return result;
}

unint64_t sub_24CAB0234()
{
  unint64_t result = qword_26980AC80;
  if (!qword_26980AC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC80);
  }
  return result;
}

unint64_t sub_24CAB028C()
{
  unint64_t result = qword_26980AC88;
  if (!qword_26980AC88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC88);
  }
  return result;
}

unint64_t sub_24CAB02E4()
{
  unint64_t result = qword_26980AC90;
  if (!qword_26980AC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC90);
  }
  return result;
}

unint64_t sub_24CAB033C()
{
  unint64_t result = qword_26980AC98;
  if (!qword_26980AC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AC98);
  }
  return result;
}

unint64_t sub_24CAB0394()
{
  unint64_t result = qword_26980ACA0;
  if (!qword_26980ACA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980ACA0);
  }
  return result;
}

unint64_t sub_24CAB03EC()
{
  unint64_t result = qword_26980ACA8;
  if (!qword_26980ACA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980ACA8);
  }
  return result;
}

uint64_t sub_24CAB0440(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x72616C75676E6973 && a2 == 0xE800000000000000 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65676E6172 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24CAB0580(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v3 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CAB063C(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24CAB06AC()
{
  return 12383;
}

uint64_t _s9DepthCore18EventRepresentablePAAE5labelSSvg_0(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_24CAE5B70();
}

uint64_t StateRepresentable.on(_:transitionTo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v20 = a5;
  uint64_t v9 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v23 = a3;
  uint64_t v24 = AssociatedTypeWitness;
  uint64_t v25 = a4;
  uint64_t v26 = AssociatedConformanceWitness;
  uint64_t v14 = type metadata accessor for StateDescription();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v19 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v6, a3);
  StateDescription.init(state:)((uint64_t)v11, a3, (uint64_t)v17);
  StateDescription.on(_:transitionTo:)(v21, v22, v14, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t type metadata accessor for StateDescription()
{
  return swift_getGenericMetadata();
}

uint64_t StateRepresentable.onEntry(perform:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return sub_24CAB09B0(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))StateDescription.onEntry(perform:), a5);
}

{
  return sub_24CAB09B0(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))StateDescription.onEntry(perform:), a5);
}

{
  return sub_24CAB09B0(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))StateDescription.onEntry(perform:), a5);
}

uint64_t sub_24CAB09B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(uint64_t, uint64_t, uint64_t)@<X4>, uint64_t a6@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v23 = a5;
  uint64_t v7 = v6;
  uint64_t v20 = a6;
  uint64_t v21 = a1;
  uint64_t v10 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v24 = a3;
  uint64_t v25 = AssociatedTypeWitness;
  uint64_t v26 = a4;
  uint64_t v27 = AssociatedConformanceWitness;
  uint64_t v15 = type metadata accessor for StateDescription();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v20 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v7, a3);
  StateDescription.init(state:)((uint64_t)v12, a3, (uint64_t)v18);
  v23(v21, v22, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

int *StateDescription.init(state:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a3, a1, a2);
  type metadata accessor for StateTransition();
  uint64_t v7 = sub_24CAE5A40();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
  unint64_t result = (int *)type metadata accessor for StateDescription();
  *(void *)(a3 + result[13]) = v7;
  uint64_t v9 = (void *)(a3 + result[14]);
  *uint64_t v9 = 0;
  v9[1] = 0;
  uint64_t v10 = (void *)(a3 + result[15]);
  *uint64_t v10 = 0;
  v10[1] = 0;
  return result;
}

uint64_t StateDescription.on(_:transitionTo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v22 = a4;
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v10 + 24);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for StateTransition();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v20 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v20, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v21, v5);
  sub_24CAB172C((uint64_t)v14, (uint64_t)v9, v5, v11, (uint64_t)v18);
  sub_24CAB18B8((uint64_t)v18, a3, v22);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t StateDescription.onEntry(perform:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v25 = a1;
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v5 + *(int *)(v13 + 56)))
  {
    uint64_t result = sub_24CAE6010();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v5, v9);
    uint64_t v14 = *(void *)(v5 + *(int *)(a3 + 52));
    uint64_t v15 = (uint64_t *)(v5 + *(int *)(a3 + 60));
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = *(void *)(a3 + 40);
    uint64_t v19 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 32);
    long long v24 = *(_OWORD *)(a3 + 24);
    v19(a4, v12, v9);
    uint64_t v26 = v9;
    long long v27 = v24;
    uint64_t v28 = v18;
    uint64_t v20 = (int *)type metadata accessor for StateDescription();
    *(void *)(a4 + v20[13]) = v14;
    uint64_t v21 = (void *)(a4 + v20[14]);
    *uint64_t v21 = v25;
    v21[1] = a2;
    uint64_t v22 = (uint64_t *)(a4 + v20[15]);
    *uint64_t v22 = v16;
    v22[1] = v17;
    swift_bridgeObjectRetain();
    sub_24CAB6F30(v16);
    return swift_retain();
  }
  return result;
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t (**v23)(uint64_t, uint64_t);
  uint64_t *v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  uint64_t v5 = v4;
  uint64_t v29 = a4;
  uint64_t v30 = a2;
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v4 + *(int *)(v12 + 56)))
  {
    uint64_t result = sub_24CAE6010();
    __break(1u);
  }
  else
  {
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))swift_allocObject();
    uint64_t v15 = *(void *)(a3 + 24);
    uint64_t v14 = *(void *)(a3 + 32);
    *((void *)v13 + 2) = v8;
    *((void *)v13 + 3) = v15;
    uint64_t v16 = *(void *)(a3 + 40);
    *((void *)v13 + 4) = v14;
    *((void *)v13 + 5) = v16;
    uint64_t v17 = v30;
    *((void *)v13 + 6) = a1;
    *((void *)v13 + 7) = v17;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v5, v8);
    uint64_t v18 = *(void *)(v5 + *(int *)(a3 + 52));
    uint64_t v19 = (uint64_t *)(v5 + *(int *)(a3 + 60));
    uint64_t v20 = v19[1];
    uint64_t v28 = *v19;
    uint64_t v21 = v29;
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v29, v11, v8);
    uint64_t v31 = v8;
    uint64_t v32 = v15;
    uint64_t v33 = v14;
    uint64_t v34 = v16;
    uint64_t v22 = (int *)type metadata accessor for StateDescription();
    *(void *)(v21 + v22[13]) = v18;
    uint64_t v23 = (uint64_t (**)(uint64_t, uint64_t))(v21 + v22[14]);
    *uint64_t v23 = sub_24CAB1E7C;
    v23[1] = v13;
    long long v24 = (uint64_t *)(v21 + v22[15]);
    uint64_t v25 = v28;
    *long long v24 = v28;
    v24[1] = v20;
    swift_retain();
    swift_bridgeObjectRetain();
    return sub_24CAB6F30(v25);
  }
  return result;
}

uint64_t StateDescription.onEntry(perform:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CAB137C(a1, a2, a3, (uint64_t)&unk_26FF18F48, (uint64_t)sub_24CAB1E78, (void (*)(uint64_t, uint64_t, uint64_t))StateDescription.onEntry(perform:));
}

uint64_t type metadata accessor for StateTransition()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t StateRepresentable.onExit(perform:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return sub_24CAB09B0(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))StateDescription.onExit(perform:), a5);
}

{
  return sub_24CAB09B0(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))StateDescription.onExit(perform:), a5);
}

uint64_t StateDescription.onExit(perform:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CAB137C(a1, a2, a3, (uint64_t)&unk_26FF18F98, (uint64_t)sub_24CAB1E78, (void (*)(uint64_t, uint64_t, uint64_t))StateDescription.onExit(perform:));
}

uint64_t sub_24CAB137C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = swift_allocObject();
  long long v12 = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v11 + 32) = v12;
  *(void *)(v11 + 48) = a1;
  *(void *)(v11 + 56) = a2;
  a6(a5, v11, a3);
  swift_retain();
  return swift_release();
}

uint64_t StateDescription.onExit(perform:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v4 + *(int *)(v12 + 60)))
  {
    uint64_t result = sub_24CAE6010();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v4, v8);
    uint64_t v13 = *(void *)(v4 + *(int *)(a3 + 52));
    uint64_t v14 = (uint64_t *)(v4 + *(int *)(a3 + 56));
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = *(void *)(a3 + 40);
    uint64_t v18 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
    long long v23 = *(_OWORD *)(a3 + 24);
    v18(a4, v11, v8);
    uint64_t v25 = v8;
    long long v26 = v23;
    uint64_t v27 = v17;
    uint64_t v19 = (int *)type metadata accessor for StateDescription();
    *(void *)(a4 + v19[13]) = v13;
    uint64_t v20 = (uint64_t *)(a4 + v19[14]);
    *uint64_t v20 = v15;
    v20[1] = v16;
    uint64_t v21 = (void *)(a4 + v19[15]);
    *uint64_t v21 = v24;
    v21[1] = a2;
    swift_bridgeObjectRetain();
    sub_24CAB6F30(v15);
    return swift_retain();
  }
  return result;
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (**v25)(uint64_t, uint64_t);
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  uint64_t v5 = v4;
  uint64_t v27 = a1;
  uint64_t v28 = a2;
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v5 + *(int *)(v12 + 60)))
  {
    uint64_t result = sub_24CAE6010();
    __break(1u);
  }
  else
  {
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))swift_allocObject();
    uint64_t v15 = *(void *)(a3 + 24);
    uint64_t v14 = *(void *)(a3 + 32);
    *((void *)v13 + 2) = v8;
    *((void *)v13 + 3) = v15;
    uint64_t v16 = *(void *)(a3 + 40);
    *((void *)v13 + 4) = v14;
    *((void *)v13 + 5) = v16;
    uint64_t v17 = v28;
    *((void *)v13 + 6) = v27;
    *((void *)v13 + 7) = v17;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v5, v8);
    uint64_t v18 = *(int *)(a3 + 56);
    uint64_t v19 = *(void *)(v5 + *(int *)(a3 + 52));
    uint64_t v20 = v5 + v18;
    uint64_t v21 = *(void *)(v5 + v18);
    uint64_t v27 = *(void *)(v20 + 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, v8);
    uint64_t v29 = v8;
    uint64_t v30 = v15;
    uint64_t v31 = v14;
    uint64_t v32 = v16;
    uint64_t v22 = (int *)type metadata accessor for StateDescription();
    *(void *)(a4 + v22[13]) = v19;
    long long v23 = (uint64_t *)(a4 + v22[14]);
    uint64_t v24 = v27;
    *long long v23 = v21;
    v23[1] = v24;
    uint64_t v25 = (uint64_t (**)(uint64_t, uint64_t))(a4 + v22[15]);
    char *v25 = sub_24CAB2470;
    v25[1] = v13;
    swift_retain();
    swift_bridgeObjectRetain();
    return sub_24CAB6F30(v21);
  }
  return result;
}

int *StateRepresentable.emptyStateDescription.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v6, v2, a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return StateDescription.init(state:)((uint64_t)v6, a1, a2);
}

uint64_t sub_24CAB172C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(a5, a1, a4);
  uint64_t v8 = a5 + *(int *)(type metadata accessor for StateTransition() + 36);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32);
  return v9(v8, a2, a3);
}

int *StateDescription.init(state:transitions:entryHandler:exitHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a7 - 8) + 32))(a8, a1, a7);
  uint64_t result = (int *)type metadata accessor for StateDescription();
  *(void *)(a8 + result[13]) = a2;
  uint64_t v15 = (void *)(a8 + result[14]);
  *uint64_t v15 = a3;
  v15[1] = a4;
  uint64_t v16 = (void *)(a8 + result[15]);
  *uint64_t v16 = a5;
  v16[1] = a6;
  return result;
}

uint64_t sub_24CAB18B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = a2;
  uint64_t v59 = a1;
  uint64_t v55 = a3;
  uint64_t v5 = *(void *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = type metadata accessor for StateTransition();
  uint64_t v58 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v48 = (char *)&v46 - v9;
  uint64_t v56 = v4;
  uint64_t v10 = *(void *)(v4 - 8);
  v4 -= 8;
  uint64_t v46 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  char v47 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = v5;
  uint64_t v52 = *(void *)(v5 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v51 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v50 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_24CAE5EB0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  long long v23 = (char *)&v46 - v22;
  uint64_t v24 = *(int *)(v4 + 60);
  uint64_t v54 = v3;
  uint64_t v25 = *(void *)(v3 + v24);
  uint64_t v49 = *(void *)(v4 + 48);
  uint64_t v26 = *(void *)(v49 + 8);
  unint64_t v57 = v6;
  MEMORY[0x253307AA0](v59, v25, v6, v7, v26);
  LODWORD(v4) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v58 + 48))(v23, 1, v7);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v23, v17);
  if (v4 == 1)
  {
    uint64_t v27 = v54;
    uint64_t v60 = *(void *)(v54 + v24);
    uint64_t v28 = v59;
    unint64_t v29 = v57;
    (*(void (**)(char *, uint64_t, unint64_t))(v15 + 16))(v50, v59, v57);
    uint64_t v30 = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v21, v28, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v21, 0, 1, v7);
    sub_24CAE5A90();
    swift_bridgeObjectRetain();
    sub_24CAE5AB0();
    uint64_t v31 = v51;
    uint64_t v32 = v52;
    uint64_t v33 = v53;
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v51, v27, v53);
    uint64_t v59 = v60;
    uint64_t v34 = v55;
    uint64_t v35 = *(int *)(v56 + 60);
    uint64_t v36 = (uint64_t *)(v27 + *(int *)(v56 + 56));
    uint64_t v37 = *v36;
    uint64_t v38 = v36[1];
    uint64_t v39 = *(void *)(v27 + v35);
    uint64_t v40 = *(void *)(v27 + v35 + 8);
    uint64_t v41 = *(void *)(v56 + 32);
    (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v55, v31, v33);
    uint64_t v61 = v33;
    unint64_t v62 = v29;
    uint64_t v63 = v41;
    uint64_t v64 = v49;
    char v42 = (int *)type metadata accessor for StateDescription();
    *(void *)(v34 + v42[13]) = v59;
    uint64_t v43 = (uint64_t *)(v34 + v42[14]);
    *uint64_t v43 = v37;
    v43[1] = v38;
    uint64_t v44 = (uint64_t *)(v34 + v42[15]);
    *uint64_t v44 = v39;
    v44[1] = v40;
    sub_24CAB6F30(v37);
    return sub_24CAB6F30(v39);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v47, v54, v56);
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v48, v59, v7);
    uint64_t v61 = 0;
    unint64_t v62 = 0xE000000000000000;
    sub_24CAE5F30();
    sub_24CAE5BB0();
    sub_24CAE61C0();
    sub_24CAE5BB0();
    sub_24CAE61C0();
    uint64_t result = sub_24CAE6010();
    __break(1u);
  }
  return result;
}

uint64_t sub_24CAB1E40()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24CAB1E7C(uint64_t a1, uint64_t a2)
{
  return sub_24CAB2490(a1, a2, (uint64_t)&unk_26FF19240, (uint64_t)&unk_26980AE88);
}

uint64_t sub_24CAB1E9C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v10;
  *uint64_t v10 = v7;
  v10[1] = sub_24CAB90A4;
  return v12(a6, a7);
}

uint64_t sub_24CAB1F88()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_24CAB21BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v35 = a7;
  uint64_t v36 = a8;
  uint64_t v33 = a3;
  uint64_t v34 = a4;
  uint64_t v31 = a2;
  uint64_t v13 = *(void *)(a6 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v37 = a10;
  uint64_t v32 = a9;
  uint64_t v15 = MEMORY[0x270FA5388](a1);
  uint64_t v30 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AE68);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_24CAE5D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a1, a5);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v31, a6);
  unint64_t v24 = (*(unsigned __int8 *)(v17 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  unint64_t v25 = (v18 + *(unsigned __int8 *)(v13 + 80) + v24) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v26 = (char *)swift_allocObject();
  *((void *)v26 + 2) = 0;
  *((void *)v26 + 3) = 0;
  *((void *)v26 + 4) = a5;
  *((void *)v26 + 5) = a6;
  uint64_t v27 = v34;
  uint64_t v28 = v36;
  *((void *)v26 + 6) = v35;
  *((void *)v26 + 7) = v28;
  *((void *)v26 + 8) = v33;
  *((void *)v26 + 9) = v27;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v26[v24], v19, a5);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v26[v25], v30, a6);
  swift_retain();
  sub_24CAD8CA4((uint64_t)v22, v37, (uint64_t)v26);
  return swift_release();
}

uint64_t sub_24CAB2470(uint64_t a1, uint64_t a2)
{
  return sub_24CAB2490(a1, a2, (uint64_t)&unk_26FF19218, (uint64_t)&unk_26980AE78);
}

uint64_t sub_24CAB2490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CAB21BC(a1, a2, v4[6], v4[7], v4[2], v4[3], v4[4], v4[5], a3, a4);
}

void sub_24CAB24C8(uint64_t a1, void (*a2)(char *, char *, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v68 = a4;
  uint64_t v62 = a8;
  uint64_t v70 = a3;
  uint64_t v67 = a2;
  uint64_t v60 = a1;
  uint64_t v12 = sub_24CAE5EB0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v61 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v57 - v17;
  uint64_t v19 = *(void *)(a6 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v16);
  uint64_t v22 = (char *)&v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *(a7 - 1);
  MEMORY[0x270FA5388](v20);
  unint64_t v25 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = *(void (**)(char *, uint64_t, void *))(v23 + 16);
  uint64_t v65 = (uint64_t (*)(void, void))a7;
  v26(v25, a5, a7);
  uint64_t v63 = v19;
  uint64_t v64 = v22;
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  uint64_t v28 = v22;
  unint64_t v29 = (unint64_t)v67;
  uint64_t v30 = v70;
  uint64_t v70 = a6;
  v27(v28, v30, a6);
  uint64_t v66 = v13;
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v32 = v68;
  uint64_t v68 = v12;
  v31(v18, v32, v12);
  swift_bridgeObjectRetain_n();
  uint64_t v33 = sub_24CAE5840();
  int v34 = sub_24CAE5DA0();
  if (os_log_type_enabled(v33, (os_log_type_t)v34))
  {
    int v58 = v34;
    os_log_t v59 = v33;
    uint64_t v35 = swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    uint64_t v72 = v57;
    *(_DWORD *)uint64_t v35 = 136315906;
    swift_bridgeObjectRetain();
    uint64_t v71 = sub_24CAA4228(v60, v29, &v72);
    uint64_t v69 = v18;
    sub_24CAE5ED0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v35 + 12) = 2082;
    uint64_t v36 = v65;
    uint64_t v37 = (*(uint64_t (**)(void, uint64_t))(a9 + 16))(v65, a9);
    uint64_t v71 = sub_24CAA4228(v37, v38, &v72);
    sub_24CAE5ED0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t (*)(void, void)))(v23 + 8))(v25, v36);
    *(_WORD *)(v35 + 22) = 2082;
    uint64_t v39 = *(uint64_t (**)(void))(v62 + 40);
    uint64_t v40 = v64;
    uint64_t v67 = (void (*)(char *, char *, uint64_t))v31;
    uint64_t v41 = v70;
    uint64_t v65 = (uint64_t (*)(void, void))v39;
    uint64_t v42 = v39(v70);
    uint64_t v71 = sub_24CAA4228(v42, v43, &v72);
    sub_24CAE5ED0();
    swift_bridgeObjectRelease();
    uint64_t v44 = v63;
    uint64_t v45 = *(void (**)(char *, uint64_t))(v63 + 8);
    v45(v40, v41);
    *(_WORD *)(v35 + 32) = 2082;
    uint64_t v46 = v61;
    uint64_t v47 = v68;
    v67(v61, v69, v68);
    int v48 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48))(v46, 1, v41);
    uint64_t v49 = v47;
    uint64_t v50 = v66;
    if (v48 == 1)
    {
      (*(void (**)(char *, uint64_t))(v66 + 8))(v46, v47);
      unint64_t v51 = 0xED00004E4F495449;
      uint64_t v52 = 0x534E4152545F4F4ELL;
    }
    else
    {
      uint64_t v53 = v70;
      uint64_t v52 = v65(v70, v62);
      unint64_t v51 = v54;
      v45(v46, v53);
    }
    uint64_t v71 = sub_24CAA4228(v52, v51, &v72);
    sub_24CAE5ED0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v69, v49);
    os_log_t v55 = v59;
    _os_log_impl(&dword_24CA9E000, v59, (os_log_type_t)v58, "%s: %{public}s ! %{public}s -> %{public}s", (uint8_t *)v35, 0x2Au);
    uint64_t v56 = v57;
    swift_arrayDestroy();
    MEMORY[0x253308900](v56, -1, -1);
    MEMORY[0x253308900](v35, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(char *, uint64_t (*)(void, void)))(v23 + 8))(v25, v65);
    (*(void (**)(char *, uint64_t))(v63 + 8))(v64, v70);
    (*(void (**)(char *, uint64_t))(v66 + 8))(v18, v68);
  }
}

uint64_t sub_24CAB2AB8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (**a3)()@<X8>)
{
  long long v10 = *(_OWORD *)(a2 + a1 - 16);
  long long v11 = *(_OWORD *)(a2 + a1 - 32);
  uint64_t v4 = sub_24CAB6EFC();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  if (v4)
  {
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = v11;
    *(_OWORD *)(v4 + 32) = v10;
    *(void *)(v4 + 48) = v5;
    *(void *)(v4 + 56) = v7;
    uint64_t v8 = sub_24CAB89C4;
  }
  else
  {
    uint64_t v8 = 0;
  }
  *a3 = v8;
  a3[1] = (uint64_t (*)())v4;
  return sub_24CAB6F30(v5);
}

uint64_t sub_24CAB2B64(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if (*a1)
  {
    uint64_t v6 = a4 + a3;
    uint64_t v7 = swift_allocObject();
    long long v8 = *(_OWORD *)(v6 - 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)(v6 - 32);
    *(_OWORD *)(v7 + 32) = v8;
    *(void *)(v7 + 48) = v4;
    *(void *)(v7 + 56) = v5;
    uint64_t v9 = sub_24CAB899C;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v7 = 0;
  }
  sub_24CAB6F30(v4);
  return sub_24CAB2C34((uint64_t)v9, v7);
}

uint64_t sub_24CAB2C00()
{
  uint64_t v0 = sub_24CAB6EFC();
  sub_24CAB6F30(v0);
  return v0;
}

uint64_t sub_24CAB2C34(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 32);
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return sub_24CAB6F40(v5);
}

uint64_t (*sub_24CAB2C88())()
{
  return j__swift_endAccess;
}

uint64_t sub_24CAB2CE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 160);
  swift_beginAccess();
  type metadata accessor for StateDescription();
  uint64_t v4 = sub_24CAE5EB0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_24CAB2DBC(uint64_t a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 160);
  swift_beginAccess();
  type metadata accessor for StateDescription();
  uint64_t v4 = sub_24CAE5EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t sub_24CAB2EA0(uint64_t a1)
{
  *(void *)(v1 + *(void *)(*(void *)v1 + 168)) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CAB2EC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 176);
  swift_beginAccess();
  type metadata accessor for StateDescription();
  uint64_t v4 = sub_24CAE5EB0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_24CAB2FA0(uint64_t a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 176);
  swift_beginAccess();
  type metadata accessor for StateDescription();
  uint64_t v4 = sub_24CAE5EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t sub_24CAB3084@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(*(void *)v1 + 96);
  v13[0] = *(_OWORD *)(*(void *)v1 + 80);
  v13[1] = v13[0];
  v13[2] = v3;
  uint64_t v4 = type metadata accessor for StateDescription();
  uint64_t v5 = sub_24CAE5EB0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = (char *)v13 - v7;
  sub_24CAB2EC4((uint64_t)v13 - v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v8, 1, v4))
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v9 = *(void *)&v13[0];
    uint64_t v10 = *(void *)(*(void *)&v13[0] - 8);
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v10 = *(void *)(*(void *)&v13[0] - 8);
    (*(void (**)(uint64_t, char *))(v10 + 16))(a1, v8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v9 = *(void *)&v13[0];
    uint64_t v11 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, v11, 1, v9);
}

uint64_t sub_24CAB32A4()
{
  if (*(void *)(v0 + *(void *)(*(void *)v0 + 168)))
  {
    type metadata accessor for StateDescription();
    sub_24CAE5A80();
    swift_bridgeObjectRetain();
    swift_getWitnessTable();
    return sub_24CAE5CB0();
  }
  else
  {
    uint64_t result = sub_24CAE6010();
    __break(1u);
  }
  return result;
}

uint64_t sub_24CAB33E0(uint64_t a1)
{
  long long v3 = *(void **)v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  uint64_t v91 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v72 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v71 = (char *)&v64 - v8;
  MEMORY[0x270FA5388](v7);
  unint64_t v89 = (char *)&v64 - v9;
  uint64_t v10 = sub_24CAE5EB0();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v64 - v11;
  uint64_t v13 = v3[12];
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v79 = (void (*)(char *, char *, uint64_t))((char *)&v64 - v16);
  uint64_t v80 = v14;
  uint64_t v69 = *(void (***)(uint64_t, void, uint64_t, uint64_t))(swift_getAssociatedConformanceWitness() + 8);
  uint64_t v81 = AssociatedTypeWitness;
  uint64_t v77 = swift_getAssociatedTypeWitness();
  uint64_t v66 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v75 = (char *)&v64 - v17;
  uint64_t v18 = v3[11];
  uint64_t v68 = v1;
  uint64_t v19 = v3[13];
  uint64_t v94 = v4;
  uint64_t v95 = v18;
  uint64_t v74 = v18;
  uint64_t v78 = v13;
  uint64_t v96 = v13;
  uint64_t v97 = v19;
  uint64_t v73 = v19;
  uint64_t v20 = type metadata accessor for StateDescription();
  uint64_t v88 = sub_24CAE5EB0();
  uint64_t v90 = *(void *)(v88 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v88);
  uint64_t v76 = (uint64_t)&v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v87 = (char *)&v64 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v64 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (char *)&v64 - v29;
  uint64_t v31 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v33 = (char *)&v64 - v32;
  uint64_t AssociatedConformanceWitness = a1;
  uint64_t v94 = a1;
  uint64_t v34 = sub_24CAE5CA0();
  swift_getWitnessTable();
  uint64_t v70 = v34;
  sub_24CAE5D60();
  uint64_t v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48);
  if (v35(v30, 1, v20) == 1)
  {
    (*(void (**)(char *, uint64_t))(v90 + 8))(v30, v88);
    LODWORD(v63) = 0;
    uint64_t v62 = 189;
LABEL_12:
    uint64_t result = sub_24CAE6010();
    __break(1u);
    return result;
  }
  uint64_t v67 = v31;
  uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
  uint64_t v65 = v33;
  v36(v33, v30, v20);
  sub_24CAB2EC4((uint64_t)v27);
  v85 = (uint64_t (*)(char *, uint64_t, uint64_t))v35;
  uint64_t v86 = v31 + 48;
  unsigned int v37 = v35(v27, 1, v20);
  unint64_t v38 = *(void (**)(char *, uint64_t))(v90 + 8);
  v90 += 8;
  v84 = v38;
  v38(v27, v88);
  if (v37 != 1)
  {
    LODWORD(v63) = 0;
    uint64_t v62 = 192;
    goto LABEL_12;
  }
  uint64_t v93 = AssociatedConformanceWitness;
  swift_getTupleTypeMetadata2();
  sub_24CAE5C50();
  uint64_t v39 = v78;
  uint64_t v40 = *(void *)(v78 + 16);
  uint64_t v92 = sub_24CAE5A70();
  MEMORY[0x270FA5388](v92);
  uint64_t v41 = v74;
  *(&v64 - 4) = v4;
  *(&v64 - 3) = v41;
  uint64_t v62 = v39;
  uint64_t v63 = v73;
  uint64_t v83 = v40;
  uint64_t v42 = sub_24CAE5A90();
  swift_getWitnessTable();
  uint64_t v70 = v42;
  sub_24CAE5BF0();
  swift_bridgeObjectRelease();
  sub_24CAE5F50();
  unint64_t v43 = v75;
  sub_24CAE5BE0();
  uint64_t v44 = v77;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_24CAE5EC0();
  uint64_t v80 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v91 + 48);
  uint64_t v81 = v91 + 48;
  int v45 = v80(v12, 1, v4);
  uint64_t v46 = v89;
  if (v45 != 1)
  {
    uint64_t v79 = *(void (**)(char *, char *, uint64_t))(v91 + 32);
    unint64_t v54 = (void (**)(char *, uint64_t))(v91 + 8);
    v91 += 32;
    os_log_t v55 = (void (**)(char *, char *, uint64_t))(v91 - 16);
    uint64_t v69 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v67 + 56);
    uint64_t v56 = v87;
    v79(v89, v12, v4);
    while (1)
    {
      MEMORY[0x253307AA0](v46, v94, v4, v20, v83);
      int v57 = v85(v56, 1, v20);
      v84(v56, v88);
      if (v57 == 1)
      {
        int v58 = *v55;
        (*v55)(v71, v46, v4);
        os_log_t v59 = v72;
        v58(v72, v89, v4);
        uint64_t v60 = v76;
        uint64_t v61 = (uint64_t)v59;
        uint64_t v46 = v89;
        StateDescription.init(state:)(v61, v4, v76);
        (*v69)(v60, 0, 1, v20);
        unint64_t v43 = v75;
        uint64_t v44 = v77;
        sub_24CAE5AB0();
      }
      (*v54)(v46, v4);
      sub_24CAE5EC0();
      if (v80(v12, 1, v4) == 1) {
        break;
      }
      v79(v46, v12, v4);
    }
  }
  (*(void (**)(char *, uint64_t))(v66 + 8))(v43, v44);
  uint64_t v47 = v67;
  int v48 = *(void (**)(uint64_t, char *, uint64_t))(v67 + 16);
  uint64_t v49 = v76;
  uint64_t v50 = v65;
  v48(v76, v65, v20);
  unint64_t v51 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v47 + 56);
  v51(v49, 0, 1, v20);
  uint64_t v52 = v68;
  sub_24CAB2DBC(v49);
  v48(v49, v50, v20);
  v51(v49, 0, 1, v20);
  sub_24CAB2FA0(v49);
  *(void *)(v52 + *(void *)(*(void *)v52 + 168)) = v94;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v50, v20);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CAB3E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v17[0] = a3;
  v17[1] = a4;
  v17[2] = a5;
  v17[3] = a6;
  uint64_t v8 = type metadata accessor for StateDescription();
  uint64_t v9 = sub_24CAE5EB0();
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)v17 - v11;
  MEMORY[0x270FA5388](v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a2, a3);
  uint64_t v15 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v12, a2, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v8);
  sub_24CAE5A90();
  return sub_24CAE5AB0();
}

uint64_t (*sub_24CAB4064(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = sub_24CAB32A4();
  return sub_24CAB40AC;
}

uint64_t sub_24CAB40AC(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return sub_24CAB33E0(*a1);
  }
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_24CAB33E0(v2);
  return swift_bridgeObjectRelease();
}

uint64_t StateMachine.__allocating_init(name:stateDescriptions:log:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  StateMachine.init(name:stateDescriptions:log:)(a1, a2, a3, a4);
  return v8;
}

char *StateMachine.init(name:stateDescriptions:log:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v7 = *(void **)v4;
  swift_bridgeObjectRelease();
  *((void *)v4 + 4) = 0;
  *((void *)v4 + 5) = 0;
  uint64_t v8 = qword_26980ACB0;
  uint64_t v9 = v7[10];
  uint64_t v10 = v7[11];
  swift_getFunctionTypeMetadata2();
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))v7[12];
  *(void *)&v4[v8] = sub_24CAE5A40();
  uint64_t v12 = qword_26980ACB8;
  *(void *)&v4[v12] = sub_24CAE5A50();
  *(_DWORD *)&v4[qword_26980ACC0] = 0;
  uint64_t v13 = &v4[*(void *)(*(void *)v4 + 160)];
  uint64_t v14 = (void *)v7[13];
  uint64_t aBlock = v9;
  uint64_t v29 = v10;
  uint64_t v30 = v11;
  uint64_t v31 = v14;
  uint64_t v15 = type metadata accessor for StateDescription();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v13, 1, 1, v15);
  *(void *)&v4[*(void *)(*(void *)v4 + 168)] = 0;
  v16(&v5[*(void *)(*(void *)v5 + 176)], 1, 1, v15);
  *((void *)v4 + 2) = a1;
  *((void *)v4 + 3) = a2;
  uint64_t v17 = &v4[qword_26980ACC8];
  uint64_t v18 = sub_24CAE5860();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v17, a4, v18);
  sub_24CAB6F70();
  uint64_t v20 = sub_24CAE5DD0();
  uint64_t v21 = swift_allocObject();
  swift_weakInit();
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = v9;
  v22[3] = v10;
  v22[4] = v11;
  v22[5] = v14;
  v22[6] = v21;
  uint64_t v32 = sub_24CAB7020;
  uint64_t v33 = v22;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v29 = 1107296256;
  uint64_t v30 = sub_24CAB4CB0;
  uint64_t v31 = &block_descriptor_0;
  uint64_t v23 = _Block_copy(&aBlock);
  swift_release();
  uint64_t v24 = (int *)&v5[qword_26980ACC0];
  swift_beginAccess();
  notify_register_dispatch("com.apple.depth.dumpfsmstate", v24, v20, v23);
  swift_endAccess();
  _Block_release(v23);

  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a4, v18);
  return v5;
}

uint64_t sub_24CAB44C4()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24CAB451C();
    return swift_release();
  }
  return result;
}

uint64_t sub_24CAB451C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24CAE5B60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CAE56A0();
  uint64_t v42 = *(void *)(v6 - 8);
  uint64_t v43 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  unint64_t v38 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v40 = (char *)&v36 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v36 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v36 - v14;
  uint64_t v16 = NSTemporaryDirectory();
  sub_24CAE5B20();

  sub_24CAE5680();
  swift_bridgeObjectRelease();
  unint64_t v17 = *(void *)(v1 + 24);
  uint64_t v39 = *(void *)(v1 + 16);
  v45[0] = v39;
  v45[1] = v17;
  swift_bridgeObjectRetain();
  sub_24CAE5BB0();
  uint64_t v18 = v13;
  uint64_t v41 = v15;
  sub_24CAE5690();
  swift_bridgeObjectRelease();
  StateMachine.dotRepresentation.getter();
  sub_24CAE5B50();
  uint64_t v19 = sub_24CAE5B30();
  unint64_t v21 = v20;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v21 >> 60 != 15)
  {
    sub_24CAE56B0();
    sub_24CAB8A44(v19, v21);
  }
  if (qword_26980A7C0 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_24CAE5860();
  __swift_project_value_buffer(v22, (uint64_t)qword_26980B960);
  uint64_t v23 = v42;
  uint64_t v24 = v43;
  uint64_t v25 = v40;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v40, v18, v43);
  swift_retain_n();
  uint64_t v26 = sub_24CAE5840();
  os_log_type_t v27 = sub_24CAE5DA0();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = swift_slowAlloc();
    unsigned int v37 = v18;
    uint64_t v29 = v28;
    unint64_t v38 = (char *)swift_slowAlloc();
    v45[0] = (uint64_t)v38;
    *(_DWORD *)uint64_t v29 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_24CAA4228(v39, v17, v45);
    sub_24CAE5ED0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 2080;
    sub_24CAB89EC();
    uint64_t v30 = sub_24CAE61B0();
    uint64_t v44 = sub_24CAA4228(v30, v31, v45);
    sub_24CAE5ED0();
    swift_bridgeObjectRelease();
    uint64_t v32 = *(void (**)(char *, uint64_t))(v23 + 8);
    v32(v25, v24);
    _os_log_impl(&dword_24CA9E000, v26, v27, "Wrote %s state to %s", (uint8_t *)v29, 0x16u);
    uint64_t v33 = v38;
    swift_arrayDestroy();
    MEMORY[0x253308900](v33, -1, -1);
    MEMORY[0x253308900](v29, -1, -1);

    uint64_t v34 = v37;
  }
  else
  {

    uint64_t v32 = *(void (**)(char *, uint64_t))(v23 + 8);
    v32(v25, v24);
    swift_release_n();
    uint64_t v34 = v18;
  }
  v32(v34, v24);
  return ((uint64_t (*)(char *, uint64_t))v32)(v41, v24);
}

uint64_t sub_24CAB4CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t *StateMachine.deinit()
{
  uint64_t v1 = (int *)((char *)v0 + qword_26980ACC0);
  swift_beginAccess();
  notify_cancel(*v1);
  swift_bridgeObjectRelease();
  sub_24CAB6F40(v0[4]);
  uint64_t v2 = (char *)v0 + qword_26980ACC8;
  uint64_t v3 = sub_24CAE5860();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (char *)v0 + *(void *)(*v0 + 160);
  type metadata accessor for StateDescription();
  uint64_t v5 = sub_24CAE5EB0();
  uint64_t v6 = *(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  swift_bridgeObjectRelease();
  v6((char *)v0 + *(void *)(*v0 + 176), v5);
  return v0;
}

uint64_t StateMachine.__deallocating_deinit()
{
  StateMachine.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24CAB4F08(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 88);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v4 + 16))((char *)&v8 - v3);
  swift_beginAccess();
  sub_24CAE5CA0();
  sub_24CAE5C90();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = MEMORY[0x253307C80](v5, v2);
  uint64_t result = swift_bridgeObjectRelease();
  if (v6 == 1) {
    return sub_24CAB5068(result);
  }
  return result;
}

uint64_t sub_24CAB5068(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = (void *)*v1;
  uint64_t v4 = v3[10];
  uint64_t v103 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v95 = (char *)&v81 - v5;
  uint64_t v6 = (void *)v3[11];
  uint64_t v97 = type metadata accessor for StateTransition();
  uint64_t v91 = sub_24CAE5EB0();
  uint64_t v92 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  uint64_t v96 = (char *)&v81 - v7;
  uint64_t v8 = sub_24CAE5EB0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v104 = v8;
  uint64_t v105 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  id v99 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v107 = (char *)&v81 - v12;
  uint64_t v13 = v3[12];
  uint64_t v14 = v3[13];
  uint64_t v102 = v4;
  uint64_t v112 = v4;
  uint64_t v113 = v6;
  uint64_t v98 = v13;
  uint64_t v114 = v13;
  uint64_t v115 = v14;
  uint64_t v108 = v14;
  uint64_t v15 = type metadata accessor for StateDescription();
  uint64_t v89 = sub_24CAE5EB0();
  uint64_t v88 = *(void *)(v89 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v89);
  uint64_t v90 = (char *)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v93 = (char *)&v81 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v81 - v21;
  uint64_t v111 = v15;
  uint64_t v109 = *(void *)(v15 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v94 = (char *)&v81 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v110 = (char *)&v81 - v25;
  uint64_t v26 = sub_24CAE5EB0();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v81 - v29;
  uint64_t v31 = *(v6 - 1);
  uint64_t v32 = MEMORY[0x270FA5388](v28);
  double v101 = (char *)&v81 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v81 - v34;
  uint64_t v36 = (void *)((char *)v2 + qword_26980ACB8);
  swift_beginAccess();
  uint64_t v112 = *v36;
  uint64_t v37 = sub_24CAE5CA0();
  swift_getWitnessTable();
  uint64_t v100 = v37;
  sub_24CAE5D60();
  if ((*(unsigned int (**)(char *, uint64_t, void *))(v31 + 48))(v30, 1, v6) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v30, v26);
  }
  uint64_t v87 = v31;
  (*(void (**)(char *, char *, void *))(v31 + 32))(v35, v30, v6);
  uint64_t v39 = *(void *)((char *)v2 + *(void *)(*v2 + 168));
  if (!v39) {
    goto LABEL_22;
  }
  sub_24CAB2EC4((uint64_t)v22);
  uint64_t v40 = v109;
  uint64_t v41 = v109 + 48;
  uint64_t v42 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v109 + 48);
  uint64_t v43 = v111;
  unsigned int v44 = v42(v22, 1, v111);
  uint64_t v45 = v97;
  if (v44 == 1)
  {
    uint64_t v80 = *(void (**)(char *, uint64_t))(v88 + 8);
    swift_bridgeObjectRetain();
    v80(v22, v89);
LABEL_22:
    uint64_t result = sub_24CAE6010();
    __break(1u);
    return result;
  }
  v84 = v42;
  uint64_t v85 = v41;
  uint64_t v47 = v40 + 32;
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
  uint64_t v48 = (uint64_t)v110;
  uint64_t v83 = v47;
  unint64_t v82 = v46;
  v46(v110, v22, v43);
  uint64_t v49 = *(void *)(v48 + *(int *)(v43 + 52));
  uint64_t v50 = *(void *)(v108 + 8);
  uint64_t v86 = v39;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v51 = v96;
  uint64_t v106 = v35;
  MEMORY[0x253307AA0](v35, v49, v6, v45, v50);
  swift_bridgeObjectRelease();
  uint64_t v52 = *(void *)(v45 - 8);
  uint64_t v53 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v52 + 48))(v51, 1, v45) == 1)
  {
    uint64_t v45 = v91;
    uint64_t v54 = v105;
    uint64_t v55 = v102;
    uint64_t v56 = v103;
    uint64_t v57 = (uint64_t)v107;
    uint64_t v52 = v92;
  }
  else
  {
    uint64_t v55 = v102;
    uint64_t v56 = v103;
    uint64_t v57 = (uint64_t)v107;
    (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v107, &v51[*(int *)(v45 + 36)], v102);
    uint64_t v53 = 0;
    uint64_t v54 = v105;
  }
  (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v45);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 56))(v57, v53, 1, v55);
  uint64_t v58 = v98;
  sub_24CAB24C8(v2[2], (void (*)(char *, char *, uint64_t))v2[3], (uint64_t)v110, v57, (uint64_t)v106, v55, v6, v98, v108);
  os_log_t v59 = v99;
  uint64_t v60 = v104;
  (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v99, v57, v104);
  uint64_t v61 = v54;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48))(v59, 1, v55) == 1)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v59, v60);
    uint64_t v62 = (uint64_t)v110;
    uint64_t v63 = v61;
  }
  else
  {
    uint64_t v64 = v58;
    uint64_t v65 = v95;
    (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v95, v59, v55);
    uint64_t v66 = *(void *)(v64 + 16);
    uint64_t v67 = v93;
    uint64_t v68 = v111;
    MEMORY[0x253307AA0](v65, v86, v55, v111, v66);
    swift_bridgeObjectRelease();
    if (v84(v67, 1, v68) == 1)
    {
      (*(void (**)(char *, uint64_t))(v56 + 8))(v65, v55);
      (*(void (**)(char *, uint64_t))(v88 + 8))(v67, v89);
      uint64_t v62 = (uint64_t)v110;
      uint64_t v63 = v61;
      uint64_t v57 = (uint64_t)v107;
    }
    else
    {
      v82(v94, v67, v68);
      uint64_t v62 = (uint64_t)v110;
      uint64_t v69 = *(void (**)(uint64_t, char *))&v110[*(int *)(v68 + 60)];
      if (v69)
      {
        swift_retain();
        v69(v62, v106);
        uint64_t v68 = v111;
        sub_24CAB6F40((uint64_t)v69);
      }
      uint64_t v70 = v109;
      uint64_t v71 = (uint64_t)v90;
      uint64_t v72 = v94;
      (*(void (**)(char *, char *, uint64_t))(v109 + 16))(v90, v94, v68);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v70 + 56))(v71, 0, 1, v68);
      sub_24CAB2FA0(v71);
      uint64_t v73 = v111;
      uint64_t v74 = *(void (**)(char *, char *))&v72[*(int *)(v111 + 56)];
      uint64_t v75 = v95;
      if (v74)
      {
        swift_retain();
        v74(v75, v106);
        uint64_t v73 = v111;
        sub_24CAB6F40((uint64_t)v74);
      }
      swift_beginAccess();
      uint64_t v76 = (void (*)(char *))v2[4];
      uint64_t v57 = (uint64_t)v107;
      if (v76)
      {
        sub_24CAB6F30(v2[4]);
        v76(v75);
        uint64_t v73 = v111;
        sub_24CAB6F40((uint64_t)v76);
      }
      (*(void (**)(char *, uint64_t))(v109 + 8))(v94, v73);
      (*(void (**)(char *, uint64_t))(v56 + 8))(v75, v55);
      uint64_t v63 = v105;
    }
  }
  swift_beginAccess();
  swift_getWitnessTable();
  uint64_t v77 = v101;
  sub_24CAE5D80();
  uint64_t v78 = *(void (**)(char *, void *))(v87 + 8);
  v78(v77, v6);
  uint64_t v79 = swift_endAccess();
  sub_24CAB5068(v79);
  (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v57, v60);
  (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v62, v111);
  return ((uint64_t (*)(char *, void *))v78)(v106, v6);
}

uint64_t StateMachine.dotRepresentation.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *((void *)v2 + 10);
  unint64_t v4 = *((void *)v2 + 11);
  uint64_t v5 = type metadata accessor for StateTransition();
  uint64_t v122 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  v131 = (char *)&v95 - v7;
  uint64_t v121 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v6);
  v143 = (char *)&v95 - v8;
  uint64_t v140 = v9;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v135 = sub_24CAE5EB0();
  v133 = *(void (***)(char *, char *, uint64_t))(v135 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v135);
  uint64_t v13 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v95 - v14;
  uint64_t v16 = *((void *)v2 + 12);
  uint64_t v17 = *((void *)v2 + 13);
  uint64_t v150 = v3;
  unint64_t v151 = v4;
  unint64_t v141 = v4;
  uint64_t v18 = v16;
  uint64_t v152 = v16;
  uint64_t v153 = v17;
  uint64_t v132 = v17;
  uint64_t v19 = type metadata accessor for StateDescription();
  uint64_t v113 = swift_getTupleTypeMetadata2();
  uint64_t v110 = sub_24CAE5EB0();
  v129 = *(void (***)(char *, char *, unint64_t))(v110 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v110);
  uint64_t v112 = (char *)&v95 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v111 = (char *)&v95 - v23;
  uint64_t v139 = v3;
  uint64_t v24 = *(void *)(v3 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  v138 = (char *)&v95 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  v126 = (char *)&v95 - v27;
  uint64_t v142 = sub_24CAE5EB0();
  uint64_t v134 = *(void *)(v142 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v142);
  uint64_t v127 = (uint64_t)&v95 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v95 - v30;
  uint64_t v32 = *(uint64_t *)((char *)v1 + *((void *)v2 + 21));
  if (!v32) {
    goto LABEL_68;
  }
  uint64_t v150 = 0;
  unint64_t v151 = 0xE000000000000000;
  uint64_t v103 = v32;
  swift_bridgeObjectRetain();
  sub_24CAE5F30();
  sub_24CAE5BB0();
  unint64_t v33 = (unint64_t)v1[3];
  uint64_t v148 = (uint64_t)v1[2];
  unint64_t v149 = v33;
  uint64_t v146 = 32;
  unint64_t v147 = 0xE100000000000000;
  uint64_t v144 = 95;
  unint64_t v145 = 0xE100000000000000;
  sub_24CAB7048();
  sub_24CAE5EF0();
  sub_24CAE5BB0();
  swift_bridgeObjectRelease();
  sub_24CAE5BB0();
  uint64_t v34 = v31;
  v128 = v1;
  sub_24CAB2CE0((uint64_t)v31);
  uint64_t v102 = *(void *)(v19 - 8);
  uint64_t v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v102 + 48);
  uint64_t v114 = v19;
  int v36 = v35(v34, 1, v19);
  uint64_t v101 = v24;
  if (v36)
  {
    uint64_t v37 = *(void (**)(char *, uint64_t))(v134 + 8);
    v37(v34, v142);
  }
  else
  {
    unint64_t v38 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
    uint64_t v39 = v126;
    uint64_t v40 = v139;
    v38(v126, v34, v139);
    uint64_t v37 = *(void (**)(char *, uint64_t))(v134 + 8);
    v37(v34, v142);
    v125 = (void (**)(char *, uint64_t))(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 40))(v40, v18);
    uint64_t v41 = v40;
    uint64_t v24 = v101;
    (*(void (**)(char *, uint64_t))(v101 + 8))(v39, v41);
  }
  sub_24CAE5BB0();
  swift_bridgeObjectRelease();
  sub_24CAE5BB0();
  uint64_t v42 = v127;
  sub_24CAB2EC4(v127);
  if (v35((char *)v42, 1, v114))
  {
    v37((char *)v42, v142);
    uint64_t v43 = v113;
    unsigned int v44 = v112;
    uint64_t v45 = v24;
  }
  else
  {
    uint64_t v46 = v126;
    uint64_t v47 = v139;
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v126, v42, v139);
    v37((char *)v42, v142);
    (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v47, v18);
    uint64_t v45 = v24;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v46, v47);
    uint64_t v43 = v113;
    unsigned int v44 = v112;
  }
  sub_24CAE5BB0();
  swift_bridgeObjectRelease();
  sub_24CAE5BB0();
  int64_t v48 = 0;
  uint64_t v49 = *(void *)(v103 + 64);
  uint64_t v97 = v103 + 64;
  uint64_t v50 = 1 << *(unsigned char *)(v103 + 32);
  if (v50 < 64) {
    uint64_t v51 = ~(-1 << v50);
  }
  else {
    uint64_t v51 = -1;
  }
  unint64_t v52 = v51 & v49;
  uint64_t v109 = v43 - 8;
  uint64_t v100 = v45 + 16;
  uint64_t v99 = v102 + 16;
  uint64_t v108 = (void (**)(char *, char *, uint64_t))(v129 + 4);
  uint64_t v106 = (void (**)(char *, char *, uint64_t))(v45 + 32);
  uint64_t v105 = (void (**)(char *, uint64_t))(v102 + 8);
  uint64_t v134 = TupleTypeMetadata2 - 8;
  uint64_t v120 = v121 + 16;
  uint64_t v119 = v122 + 16;
  v133 += 4;
  v129 = (void (**)(char *, char *, unint64_t))(v121 + 32);
  v128 = (void (**)(char *, char *, uint64_t))(v122 + 32);
  uint64_t v127 = v18 + 40;
  v126 = (char *)(v132 + 16);
  v125 = (void (**)(char *, uint64_t))(v122 + 8);
  v124 = (void (**)(char *, uint64_t))(v121 + 8);
  uint64_t v104 = (void (**)(char *, uint64_t))(v45 + 8);
  int64_t v98 = (unint64_t)(v50 + 63) >> 6;
  int64_t v96 = v98 - 1;
  uint64_t v53 = v114;
  v136 = v13;
  uint64_t v137 = TupleTypeMetadata2;
  v130 = v15;
LABEL_13:
  uint64_t v54 = v111;
  if (!v52)
  {
    int64_t v58 = v48 + 1;
    if (__OFADD__(v48, 1)) {
      goto LABEL_66;
    }
    if (v58 >= v98)
    {
      int64_t v116 = v48;
    }
    else
    {
      unint64_t v59 = *(void *)(v97 + 8 * v58);
      if (v59)
      {
LABEL_19:
        uint64_t v115 = (v59 - 1) & v59;
        unint64_t v55 = __clz(__rbit64(v59)) + (v58 << 6);
        int64_t v116 = v58;
        goto LABEL_15;
      }
      if (v48 + 2 >= v98)
      {
        uint64_t v115 = 0;
        uint64_t v57 = 1;
        goto LABEL_53;
      }
      unint64_t v59 = *(void *)(v97 + 8 * (v48 + 2));
      if (v59)
      {
        int64_t v58 = v48 + 2;
        goto LABEL_19;
      }
      uint64_t v93 = v48 + 3;
      if (v48 + 3 < v98)
      {
        unint64_t v59 = *(void *)(v97 + 8 * v93);
        if (v59)
        {
          int64_t v58 = v48 + 3;
          goto LABEL_19;
        }
        while (1)
        {
          int64_t v58 = v93 + 1;
          if (__OFADD__(v93, 1)) {
            goto LABEL_67;
          }
          if (v58 >= v98) {
            break;
          }
          unint64_t v59 = *(void *)(v97 + 8 * v58);
          ++v93;
          if (v59) {
            goto LABEL_19;
          }
        }
        uint64_t v115 = 0;
        uint64_t v57 = 1;
        int64_t v58 = v96;
LABEL_53:
        int64_t v116 = v58;
        goto LABEL_22;
      }
      int64_t v116 = v48 + 2;
    }
    uint64_t v115 = 0;
    uint64_t v57 = 1;
    goto LABEL_22;
  }
  uint64_t v115 = (v52 - 1) & v52;
  int64_t v116 = v48;
  unint64_t v55 = __clz(__rbit64(v52)) | (v48 << 6);
LABEL_15:
  uint64_t v56 = v103;
  (*(void (**)(char *, unint64_t, uint64_t))(v101 + 16))(v44, *(void *)(v103 + 48) + *(void *)(v101 + 72) * v55, v139);
  (*(void (**)(char *, unint64_t, uint64_t))(v102 + 16))(&v44[*(int *)(v43 + 48)], *(void *)(v56 + 56) + *(void *)(v102 + 72) * v55, v53);
  uint64_t v57 = 0;
LABEL_22:
  uint64_t v60 = *(void *)(v43 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v60 + 56))(v44, v57, 1, v43);
  (*v108)(v54, v44, v110);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v60 + 48))(v54, 1, v43) == 1)
  {
    swift_release();
    sub_24CAE5BB0();
    return v150;
  }
  uint64_t v61 = v54;
  uint64_t v62 = &v54[*(int *)(v43 + 48)];
  (*v106)(v138, v61, v139);
  uint64_t v63 = *(void *)&v62[*(int *)(v53 + 52)];
  uint64_t v64 = *v105;
  swift_bridgeObjectRetain();
  v64(v62, v53);
  int64_t v65 = 0;
  uint64_t v66 = *(void *)(v63 + 64);
  uint64_t v117 = v63 + 64;
  uint64_t v123 = v63;
  uint64_t v67 = 1 << *(unsigned char *)(v63 + 32);
  if (v67 < 64) {
    uint64_t v68 = ~(-1 << v67);
  }
  else {
    uint64_t v68 = -1;
  }
  unint64_t v69 = v68 & v66;
  int64_t v118 = (unint64_t)(v67 + 63) >> 6;
  int64_t v107 = v118 - 1;
  if ((v68 & v66) != 0)
  {
LABEL_27:
    unint64_t v70 = __clz(__rbit64(v69));
    uint64_t v71 = (v69 - 1) & v69;
    unint64_t v72 = v70 | (v65 << 6);
    uint64_t v74 = v136;
    uint64_t v73 = v137;
    goto LABEL_28;
  }
  while (1)
  {
    int64_t v77 = v65 + 1;
    uint64_t v74 = v136;
    uint64_t v73 = v137;
    if (__OFADD__(v65, 1))
    {
      __break(1u);
      goto LABEL_65;
    }
    if (v77 < v118)
    {
      unint64_t v78 = *(void *)(v117 + 8 * v77);
      if (v78) {
        goto LABEL_32;
      }
      v65 += 2;
      if (v77 + 1 >= v118)
      {
        uint64_t v71 = 0;
        uint64_t v76 = 1;
        int64_t v65 = v77;
        goto LABEL_41;
      }
      unint64_t v78 = *(void *)(v117 + 8 * v65);
      if (v78)
      {
        ++v77;
        goto LABEL_32;
      }
      int64_t v79 = v77 + 2;
      if (v77 + 2 < v118) {
        break;
      }
    }
    uint64_t v71 = 0;
    uint64_t v76 = 1;
LABEL_41:
    uint64_t v80 = *(void *)(v73 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v80 + 56))(v74, v76, 1, v73);
    (*v133)(v15, v74, v135);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v80 + 48))(v15, 1, v73) == 1)
    {
      swift_release();
      (*v104)(v138, v139);
      uint64_t v53 = v114;
      uint64_t v43 = v113;
      unsigned int v44 = v112;
      int64_t v48 = v116;
      unint64_t v52 = v115;
      goto LABEL_13;
    }
    uint64_t v81 = &v15[*(int *)(v73 + 48)];
    unint64_t v82 = v15;
    unint64_t v83 = v141;
    (*v129)(v143, v82, v141);
    v84 = v131;
    uint64_t v85 = v140;
    (*v128)(v131, v81, v140);
    uint64_t v148 = 0;
    unint64_t v149 = 0xE000000000000000;
    sub_24CAE5F30();
    swift_bridgeObjectRelease();
    uint64_t v148 = 34;
    unint64_t v149 = 0xE100000000000000;
    int64_t v86 = v65;
    uint64_t v87 = *(void (**)(uint64_t, uint64_t))(v18 + 40);
    uint64_t v88 = v18;
    uint64_t v89 = v139;
    v87(v139, v88);
    uint64_t v142 = v71;
    sub_24CAE5BB0();
    swift_bridgeObjectRelease();
    sub_24CAE5BB0();
    uint64_t v90 = v89;
    uint64_t v18 = v88;
    v87(v90, v88);
    int64_t v65 = v86;
    sub_24CAE5BB0();
    swift_bridgeObjectRelease();
    sub_24CAE5BB0();
    uint64_t v91 = v143;
    (*(void (**)(unint64_t))(v132 + 16))(v83);
    sub_24CAE5BB0();
    swift_bridgeObjectRelease();
    sub_24CAE5BB0();
    sub_24CAE5BB0();
    unint64_t v69 = v142;
    swift_bridgeObjectRelease();
    (*v125)(v84, v85);
    unint64_t v92 = v83;
    uint64_t v15 = v130;
    (*v124)(v91, v92);
    if (v69) {
      goto LABEL_27;
    }
  }
  unint64_t v78 = *(void *)(v117 + 8 * v79);
  if (v78)
  {
    v77 += 2;
LABEL_32:
    uint64_t v71 = (v78 - 1) & v78;
    unint64_t v72 = __clz(__rbit64(v78)) + (v77 << 6);
    int64_t v65 = v77;
LABEL_28:
    uint64_t v75 = v123;
    (*(void (**)(char *, unint64_t, unint64_t))(v121 + 16))(v74, *(void *)(v123 + 48) + *(void *)(v121 + 72) * v72, v141);
    (*(void (**)(char *, unint64_t, uint64_t))(v122 + 16))(&v74[*(int *)(v73 + 48)], *(void *)(v75 + 56) + *(void *)(v122 + 72) * v72, v140);
    uint64_t v76 = 0;
    goto LABEL_41;
  }
  while (1)
  {
    int64_t v77 = v79 + 1;
    if (__OFADD__(v79, 1)) {
      break;
    }
    if (v77 >= v118)
    {
      uint64_t v71 = 0;
      uint64_t v76 = 1;
      int64_t v65 = v107;
      goto LABEL_41;
    }
    unint64_t v78 = *(void *)(v117 + 8 * v77);
    ++v79;
    if (v78) {
      goto LABEL_32;
    }
  }
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  uint64_t result = sub_24CAE6010();
  __break(1u);
  return result;
}

uint64_t sub_24CAB6EFC()
{
  swift_beginAccess();
  return *(void *)(v0 + 32);
}

uint64_t sub_24CAB6F30(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24CAB6F40(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24CAB6F50(uint64_t a1, uint64_t a2)
{
  return sub_24CAB3E94(a1, a2, v2[2], v2[3], v2[4], v2[5]);
}

unint64_t sub_24CAB6F70()
{
  unint64_t result = qword_26980ACD0;
  if (!qword_26980ACD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26980ACD0);
  }
  return result;
}

uint64_t sub_24CAB6FB0()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CAB6FE8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24CAB7020()
{
  return sub_24CAB44C4();
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

unint64_t sub_24CAB7048()
{
  unint64_t result = qword_26980ACD8[0];
  if (!qword_26980ACD8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26980ACD8);
  }
  return result;
}

uint64_t sub_24CAB70A4()
{
  return 32;
}

__n128 sub_24CAB70B0(uint64_t a1, _OWORD *a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_24CAB70BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CAB32A4();
  *a1 = result;
  return result;
}

uint64_t sub_24CAB70E8()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_24CAB33E0(v0);
}

uint64_t sub_24CAB7114()
{
  return 32;
}

__n128 sub_24CAB7120(uint64_t a1, _OWORD *a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t dispatch thunk of EventRepresentable.label.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StateRepresentable.label.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of StateRepresentable.on(_:transitionTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of StateRepresentable.onEntry(perform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t sub_24CAB7190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_24CAB7198()
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

uint64_t *sub_24CAB7268(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = v6 + v9;
  unint64_t v11 = ((v6 + v9) & ~v9) + *(void *)(v8 + 64);
  uint64_t v12 = (*(unsigned char *)(v5 + 80) | *(unsigned char *)(v8 + 80));
  if (v12 > 7 || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0 || v11 > 0x18)
  {
    uint64_t v15 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v15 + ((v12 + 16) & ~v12));
    swift_retain();
  }
  else
  {
    uint64_t v16 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)v4 + v10) & v16, ((unint64_t)a2 + v10) & v16, v7);
  }
  return v4;
}

uint64_t sub_24CAB73C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a2 + 24) - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v6 = *(uint64_t (**)(unint64_t))(v5 + 8);
  unint64_t v7 = (*(void *)(v4 + 56) + a1 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return v6(v7);
}

uint64_t sub_24CAB7468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 16))((*(void *)(v6 + 48) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(void *)(v6 + 48) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_24CAB7510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 24))((*(void *)(v6 + 40) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(void *)(v6 + 40) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_24CAB75B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 32))((*(void *)(v6 + 32) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(void *)(v6 + 32) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_24CAB7660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 24) - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))((*(void *)(v6 + 24) + *(unsigned __int8 *)(v7 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(void *)(v6 + 24) + *(unsigned __int8 *)(v7 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_24CAB7708(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v5 = *(void *)(a3 + 16);
  unsigned int v6 = *(_DWORD *)(v4 + 84);
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  if (v8 <= v6) {
    unsigned int v10 = *(_DWORD *)(v4 + 84);
  }
  else {
    unsigned int v10 = *(_DWORD *)(v7 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64) + v9;
  unsigned int v12 = a2 - v10;
  if (a2 <= v10) {
    goto LABEL_24;
  }
  uint64_t v13 = (v11 & ~v9) + *(void *)(*(void *)(v5 - 8) + 64);
  char v14 = 8 * v13;
  if (v13 <= 3)
  {
    unsigned int v16 = ((v12 + ~(-1 << v14)) >> v14) + 1;
    if (HIWORD(v16))
    {
      int v15 = *(_DWORD *)((char *)a1 + v13);
      if (!v15) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v16 > 0xFF)
    {
      int v15 = *(unsigned __int16 *)((char *)a1 + v13);
      if (!*(unsigned __int16 *)((char *)a1 + v13)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v16 < 2)
    {
LABEL_24:
      if (v10)
      {
        if (v6 >= v8) {
          return (*(uint64_t (**)(void))(v4 + 48))();
        }
        else {
          return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 48))(((unint64_t)a1 + v11) & ~v9, v8, v5);
        }
      }
      return 0;
    }
  }
  int v15 = *((unsigned __int8 *)a1 + v13);
  if (!*((unsigned char *)a1 + v13)) {
    goto LABEL_24;
  }
LABEL_14:
  int v17 = (v15 - 1) << v14;
  if (v13 > 3) {
    int v17 = 0;
  }
  if (v13)
  {
    if (v13 <= 3) {
      int v18 = v13;
    }
    else {
      int v18 = 4;
    }
    switch(v18)
    {
      case 2:
        int v19 = *a1;
        break;
      case 3:
        int v19 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v19 = *(_DWORD *)a1;
        break;
      default:
        int v19 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v19 = 0;
  }
  return v10 + (v19 | v17) + 1;
}

void sub_24CAB7900(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(a4 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  if (v10 <= v7) {
    unsigned int v12 = *(_DWORD *)(v6 + 84);
  }
  else {
    unsigned int v12 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64) + v11;
  size_t v14 = (v13 & ~v11) + *(void *)(*(void *)(v8 - 8) + 64);
  BOOL v15 = a3 >= v12;
  unsigned int v16 = a3 - v12;
  if (v16 != 0 && v15)
  {
    if (v14 <= 3)
    {
      unsigned int v20 = ((v16 + ~(-1 << (8 * v14))) >> (8 * v14)) + 1;
      if (HIWORD(v20))
      {
        int v17 = 4;
      }
      else if (v20 >= 0x100)
      {
        int v17 = 2;
      }
      else
      {
        int v17 = v20 > 1;
      }
    }
    else
    {
      int v17 = 1;
    }
  }
  else
  {
    int v17 = 0;
  }
  if (v12 < a2)
  {
    unsigned int v18 = ~v12 + a2;
    if (v14 < 4)
    {
      int v19 = (v18 >> (8 * v14)) + 1;
      if (v14)
      {
        int v21 = v18 & ~(-1 << (8 * v14));
        bzero(a1, v14);
        if (v14 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }
        else if (v14 == 2)
        {
          *(_WORD *)a1 = v21;
        }
        else
        {
          *a1 = v21;
        }
      }
    }
    else
    {
      bzero(a1, v14);
      *(_DWORD *)a1 = v18;
      int v19 = 1;
    }
    switch(v17)
    {
      case 1:
        a1[v14] = v19;
        return;
      case 2:
        *(_WORD *)&a1[v14] = v19;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v14] = v19;
        return;
      default:
        return;
    }
  }
  switch(v17)
  {
    case 1:
      a1[v14] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v14] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x24CAB7BCCLL);
    case 4:
      *(_DWORD *)&a1[v14] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v7 >= v10)
        {
          uint64_t v24 = *(void (**)(void))(v6 + 56);
          v24();
        }
        else
        {
          unint64_t v22 = (unint64_t)&a1[v13] & ~v11;
          uint64_t v23 = *(void (**)(unint64_t))(v9 + 56);
          v23(v22);
        }
      }
      return;
  }
}

uint64_t sub_24CAB7BF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_24CAB7BFC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24CAB7CA4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0
    || ((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unsigned int v10 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v11 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v11 = *v10;
    unint64_t v12 = ((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v13 = (unint64_t *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v14 = *v13;
    swift_bridgeObjectRetain();
    if (v14 < 0xFFFFFFFF)
    {
      *(_OWORD *)unint64_t v12 = *(_OWORD *)v13;
    }
    else
    {
      unint64_t v15 = v13[1];
      *(void *)unint64_t v12 = v14;
      *(void *)(v12 + 8) = v15;
      swift_retain();
    }
    unint64_t v16 = (v12 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v17 = ((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)v17 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)unint64_t v16 = *(_OWORD *)v17;
      return v4;
    }
    uint64_t v18 = *(void *)(v17 + 8);
    *(void *)unint64_t v16 = *(void *)v17;
    *(void *)(v16 + 8) = v18;
  }
  swift_retain();
  return v4;
}

uint64_t sub_24CAB7E14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  unint64_t v4 = ((a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8) + 15;
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v6 = (void *)(v4 & 0xFFFFFFFFFFFFFFF8);
  if (*v6 >= 0xFFFFFFFFuLL) {
    uint64_t result = swift_release();
  }
  if (*(void *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8) >= 0xFFFFFFFFuLL)
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_24CAB7ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  unint64_t v7 = v6 + a1;
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v7 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v7 = *v8;
  unint64_t v9 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  unsigned int v10 = (unint64_t *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = *v10;
  swift_bridgeObjectRetain();
  if (v11 < 0xFFFFFFFF)
  {
    *(_OWORD *)unint64_t v9 = *(_OWORD *)v10;
  }
  else
  {
    unint64_t v12 = v10[1];
    *(void *)unint64_t v9 = v11;
    *(void *)(v9 + 8) = v12;
    swift_retain();
  }
  unint64_t v13 = (v9 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = ((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)v14 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v13 = *(_OWORD *)v14;
  }
  else
  {
    uint64_t v15 = *(void *)(v14 + 8);
    *(void *)unint64_t v13 = *(void *)v14;
    *(void *)(v13 + 8) = v15;
    swift_retain();
  }
  return a1;
}

uint64_t sub_24CAB7FB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  unint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = v6 + a2;
  unint64_t v9 = (v8 & 0xFFFFFFFFFFFFFFF8) + 15;
  *unint64_t v7 = *(void *)(v8 & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unsigned int v10 = (void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = v9 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v12 = *(void *)(v9 & 0xFFFFFFFFFFFFFFF8);
  if (*v10 < 0xFFFFFFFFuLL)
  {
    if (v12 >= 0xFFFFFFFF)
    {
      uint64_t v14 = *(void *)(v11 + 8);
      *unsigned int v10 = v12;
      v10[1] = v14;
      swift_retain();
      goto LABEL_8;
    }
  }
  else
  {
    if (v12 >= 0xFFFFFFFF)
    {
      uint64_t v13 = *(void *)(v11 + 8);
      *unsigned int v10 = v12;
      v10[1] = v13;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  *(_OWORD *)unsigned int v10 = *(_OWORD *)v11;
LABEL_8:
  uint64_t v15 = (void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v16 = (unint64_t *)((v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v17 = *v16;
  if (*v15 < 0xFFFFFFFFuLL)
  {
    if (v17 >= 0xFFFFFFFF)
    {
      unint64_t v19 = v16[1];
      *uint64_t v15 = v17;
      v15[1] = v19;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
    return a1;
  }
  if (v17 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_14;
  }
  unint64_t v18 = v16[1];
  *uint64_t v15 = v17;
  v15[1] = v18;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_24CAB8130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v7 = *v8;
  unint64_t v9 = ((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = ((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)v10 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v9 = *(_OWORD *)v10;
  }
  else
  {
    uint64_t v11 = *(void *)(v10 + 8);
    *(void *)unint64_t v9 = *(void *)v10;
    *(void *)(v9 + 8) = v11;
  }
  unint64_t v12 = (v9 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v13 = (uint64_t *)((v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = *v13;
  if ((unint64_t)*v13 < 0xFFFFFFFF)
  {
    *(_OWORD *)unint64_t v12 = *(_OWORD *)v13;
  }
  else
  {
    uint64_t v15 = v13[1];
    *(void *)unint64_t v12 = v14;
    *(void *)(v12 + 8) = v15;
  }
  return a1;
}

uint64_t sub_24CAB820C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v7 = *v8;
  swift_bridgeObjectRelease();
  unint64_t v9 = (void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v10 = (unint64_t *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = *v10;
  if (*v9 < 0xFFFFFFFFuLL)
  {
    if (v11 >= 0xFFFFFFFF)
    {
      unint64_t v13 = v10[1];
      *unint64_t v9 = v11;
      v9[1] = v13;
      goto LABEL_8;
    }
  }
  else
  {
    if (v11 >= 0xFFFFFFFF)
    {
      unint64_t v12 = v10[1];
      *unint64_t v9 = v11;
      v9[1] = v12;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  *(_OWORD *)unint64_t v9 = *(_OWORD *)v10;
LABEL_8:
  uint64_t v14 = (void *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (unint64_t *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v16 = *v15;
  if (*v14 < 0xFFFFFFFFuLL)
  {
    if (v16 >= 0xFFFFFFFF)
    {
      unint64_t v18 = v15[1];
      *uint64_t v14 = v16;
      v14[1] = v18;
      return a1;
    }
LABEL_14:
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    return a1;
  }
  if (v16 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_14;
  }
  unint64_t v17 = v15[1];
  *uint64_t v14 = v16;
  v14[1] = v17;
  swift_release();
  return a1;
}

uint64_t sub_24CAB8360(_DWORD *a1, unsigned int a2, uint64_t a3)
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
    unint64_t v8 = ((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
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
        JUMPOUT(0x24CAB84BCLL);
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
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_24CAB84D0(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
  unint64_t v10 = ((((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
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
            if (v7 < 0x7FFFFFFF)
            {
              unint64_t v19 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0) {
                uint64_t v20 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v20 = a2 - 1;
              }
              *unint64_t v19 = v20;
            }
            else
            {
              unint64_t v18 = *(void (**)(void))(v6 + 56);
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
    if (((((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
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
  if (((((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    int v17 = ~v8 + a2;
    bzero(a1, ((((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16);
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
      JUMPOUT(0x24CAB86C8);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t sub_24CAB86F4()
{
  uint64_t result = sub_24CAE5860();
  if (v1 <= 0x3F)
  {
    type metadata accessor for StateDescription();
    uint64_t result = sub_24CAE5EB0();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return result;
}

uint64_t type metadata accessor for StateMachine()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for StateMachine(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StateMachine);
}

uint64_t dispatch thunk of StateMachine.stateChangeHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of StateMachine.stateChangeHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of StateMachine.stateChangeHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of StateMachine.currentState.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of StateMachine.stateDescriptions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of StateMachine.stateDescriptions.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of StateMachine.stateDescriptions.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of StateMachine.__allocating_init(name:stateDescriptions:log:)()
{
  return (*(uint64_t (**)(void))(v0 + 384))();
}

uint64_t dispatch thunk of StateMachine.send(event:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t sub_24CAB899C()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_24CAB89C4()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

unint64_t sub_24CAB89EC()
{
  unint64_t result = qword_26980AE60;
  if (!qword_26980AE60)
  {
    sub_24CAE56A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AE60);
  }
  return result;
}

uint64_t sub_24CAB8A44(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24CAB8A58(a1, a2);
  }
  return a1;
}

uint64_t sub_24CAB8A58(uint64_t a1, unint64_t a2)
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

uint64_t sub_24CAB8AB4()
{
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v0[4] - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0[4] - 8) + 80);
  uint64_t v3 = (int *)v0[8];
  uint64_t v4 = (char *)v0 + v2;
  unsigned int v5 = (char *)v0
     + ((v2 + *(void *)(*(void *)(v0[4] - 8) + 64) + *(unsigned __int8 *)(*(void *)(v0[5] - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0[5] - 8) + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_24CAB8C68;
  uint64_t v9 = (uint64_t (*)(char *, char *))((char *)v3 + *v3);
  unsigned int v7 = (void *)swift_task_alloc();
  uint64_t v6[2] = v7;
  *unsigned int v7 = v6;
  v7[1] = sub_24CAB90A4;
  return v9(v4, v5);
}

uint64_t sub_24CAB8C68()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t objectdestroy_27Tm()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 80) & ~v4;
  uint64_t v6 = *(void *)(v2 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v5 + *(void *)(v3 + 64) + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v4 | v7 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v1);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v2);
  return MEMORY[0x270FA0238](v0, v9, v10);
}

uint64_t sub_24CAB8EAC()
{
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v0[4] - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0[4] - 8) + 80);
  uint64_t v3 = (int *)v0[8];
  uint64_t v4 = (char *)v0 + v2;
  uint64_t v5 = (char *)v0
     + ((v2 + *(void *)(*(void *)(v0[4] - 8) + 64) + *(unsigned __int8 *)(*(void *)(v0[5] - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0[5] - 8) + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_24CAB90A4;
  uint64_t v9 = (uint64_t (*)(char *, char *))((char *)v3 + *v3);
  uint64_t v7 = (void *)swift_task_alloc();
  uint64_t v6[2] = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_24CAB90A4;
  return v9(v4, v5);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

BOOL static LocationTimerPurpose.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t LocationTimerPurpose.hash(into:)()
{
  return sub_24CAE6250();
}

uint64_t LocationTimerPurpose.hashValue.getter()
{
  return sub_24CAE6260();
}

double LocationSettings.locationUpdateTimeout.getter()
{
  return *(double *)v0;
}

void LocationSettings.locationUpdateTimeout.setter(double a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*LocationSettings.locationUpdateTimeout.modify())()
{
  return nullsub_1;
}

double LocationSettings.locationRetryInterval.getter()
{
  return *(double *)(v0 + 8);
}

void LocationSettings.locationRetryInterval.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*LocationSettings.locationRetryInterval.modify())()
{
  return nullsub_1;
}

Swift::Double __swiftcall LocationSettings.timeout(forPurpose:)(DepthCore::LocationTimerPurpose forPurpose)
{
  if (*(unsigned char *)forPurpose) {
    unint64_t v2 = v1 + 1;
  }
  else {
    unint64_t v2 = v1;
  }
  return *v2;
}

unint64_t sub_24CAB91B0()
{
  unint64_t result = qword_26980AE90;
  if (!qword_26980AE90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AE90);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for LocationTimerPurpose(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAB92D0);
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

ValueMetadata *type metadata accessor for LocationTimerPurpose()
{
  return &type metadata for LocationTimerPurpose;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LocationSettings(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LocationSettings(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LocationSettings()
{
  return &type metadata for LocationSettings;
}

double DepthValueRange.min.getter@<D0>(void *a1@<X8>)
{
  double result = *v1;
  *a1 = *(void *)v1;
  return result;
}

double DepthValueRange.min.setter(double *a1)
{
  double result = *a1;
  *uint64_t v1 = *(void *)a1;
  return result;
}

uint64_t (*DepthValueRange.min.modify())()
{
  return nullsub_1;
}

double DepthValueRange.max.getter@<D0>(double *a1@<X8>)
{
  double result = *(double *)(v1 + 8);
  *a1 = result;
  return result;
}

double DepthValueRange.max.setter(double *a1)
{
  double result = *a1;
  *(double *)(v1 + 8) = *a1;
  return result;
}

uint64_t (*DepthValueRange.max.modify())()
{
  return nullsub_1;
}

double DepthValueRange.range.getter@<D0>(double *a1@<X8>)
{
  double result = v1[1] - *v1;
  *a1 = result;
  return result;
}

DepthCore::DepthValueRange __swiftcall DepthValueRange.init(min:max:)(DepthCore::DepthValue min, DepthCore::DepthValue max)
{
  Swift::Double v5 = *v2;
  Swift::Double v6 = *v3;
  *unsigned int v4 = *v2;
  v4[1] = v6;
  result.max = *(DepthCore::DepthValue *)&v6;
  result.min = *(DepthCore::DepthValue *)&v5;
  return result;
}

uint64_t sub_24CAB93FC(char a1)
{
  if (a1) {
    return 7889261;
  }
  else {
    return 7235949;
  }
}

uint64_t sub_24CAB9424()
{
  return sub_24CAB93FC(*v0);
}

uint64_t sub_24CAB942C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CABDD2C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CAB9454(uint64_t a1)
{
  unint64_t v2 = sub_24CABCD30();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAB9490(uint64_t a1)
{
  unint64_t v2 = sub_24CABCD30();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DepthValueRange.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AE98);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CABCD30();
  sub_24CAE6280();
  uint64_t v12 = v9;
  HIBYTE(v11) = 0;
  sub_24CABCD84();
  sub_24CAE6180();
  if (!v2)
  {
    uint64_t v12 = v8;
    HIBYTE(v11) = 1;
    sub_24CAE6180();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t DepthValueRange.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AEA8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CABCD30();
  sub_24CAE6270();
  if (!v2)
  {
    HIBYTE(v12) = 0;
    sub_24CABCDD8();
    sub_24CAE6100();
    uint64_t v9 = v13;
    HIBYTE(v12) = 1;
    sub_24CAE6100();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v10 = v13;
    *a2 = v9;
    a2[1] = v10;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_24CAB9834@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return DepthValueRange.init(from:)(a1, a2);
}

uint64_t sub_24CAB984C(void *a1)
{
  return DepthValueRange.encode(to:)(a1);
}

uint64_t DepthIntervalSummary.dateInterval.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24CAE5630();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t DepthIntervalSummary.dateInterval.setter(uint64_t a1)
{
  uint64_t v3 = sub_24CAE5630();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*DepthIntervalSummary.dateInterval.modify())()
{
  return nullsub_1;
}

__n128 DepthIntervalSummary.depthRange.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v3 = (__n128 *)(v1 + *(int *)(type metadata accessor for DepthIntervalSummary() + 20));
  unsigned __int8 v4 = v3[1].n128_u8[0];
  __n128 result = *v3;
  *a1 = *v3;
  a1[1].n128_u8[0] = v4;
  return result;
}

uint64_t DepthIntervalSummary.depthRange.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t result = type metadata accessor for DepthIntervalSummary();
  uint64_t v6 = v1 + *(int *)(result + 20);
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = v3;
  *(unsigned char *)(v6 + 16) = v4;
  return result;
}

uint64_t (*DepthIntervalSummary.depthRange.modify())()
{
  return nullsub_1;
}

uint64_t sub_24CAB9A20(char a1)
{
  if (a1) {
    return 0x6E61526874706564;
  }
  else {
    return 0x65746E4965746164;
  }
}

uint64_t sub_24CAB9A64()
{
  return sub_24CAB9A20(*v0);
}

uint64_t sub_24CAB9A6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CABDDF8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CAB9A94(uint64_t a1)
{
  unint64_t v2 = sub_24CABCE78();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAB9AD0(uint64_t a1)
{
  unint64_t v2 = sub_24CABCE78();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DepthIntervalSummary.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AEB0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CABCE78();
  sub_24CAE6280();
  LOBYTE(v13) = 0;
  sub_24CAE5630();
  sub_24CABE480(&qword_26980AEC0, MEMORY[0x263F062D0]);
  sub_24CAE6180();
  if (!v2)
  {
    uint64_t v9 = (long long *)(v3 + *(int *)(type metadata accessor for DepthIntervalSummary() + 20));
    char v10 = *((unsigned char *)v9 + 16);
    long long v13 = *v9;
    char v14 = v10;
    v12[15] = 1;
    sub_24CABCECC();
    sub_24CAE6140();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t DepthIntervalSummary.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v21 = sub_24CAE5630();
  uint64_t v19 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AED0);
  uint64_t v20 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DepthIntervalSummary();
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = &v11[*(int *)(v9 + 28)];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  unsigned char v12[16] = 1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CABCE78();
  sub_24CAE6270();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v13 = v19;
  LOBYTE(v23) = 0;
  sub_24CABE480(&qword_26980AED8, MEMORY[0x263F062D0]);
  uint64_t v14 = v21;
  sub_24CAE6100();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v11, v5, v14);
  char v25 = 1;
  sub_24CABCF20();
  sub_24CAE60C0();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v22);
  char v15 = v24;
  *(_OWORD *)uint64_t v12 = v23;
  unsigned char v12[16] = v15;
  sub_24CABCF74((uint64_t)v11, v18);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_24CABCFD8((uint64_t)v11);
}

uint64_t sub_24CABA03C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DepthIntervalSummary.init(from:)(a1, a2);
}

uint64_t sub_24CABA054(void *a1)
{
  return DepthIntervalSummary.encode(to:)(a1);
}

uint64_t sub_24CABA06C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24CAE5730();
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_24CAE5630();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v39 - v12;
  MEMORY[0x270FA5388](v11);
  char v15 = (char *)&v39 - v14;
  id v16 = objc_msgSend(v2, sel_startDate);
  sub_24CAE5710();

  id v17 = objc_msgSend(v2, sel_endDate);
  sub_24CAE5710();

  sub_24CAE5600();
  id v18 = objc_msgSend(v2, sel_minimumQuantity);
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = objc_msgSend(v2, sel_maximumQuantity);
    if (v20)
    {
      uint64_t v21 = v20;
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v15, v6);
      uint64_t v22 = self;
      id v23 = objc_msgSend(v22, sel_meterUnit);
      objc_msgSend(v19, sel_doubleValueForUnit_, v23);
      uint64_t v25 = v24;

      id v26 = objc_msgSend(v22, sel_meterUnit);
      objc_msgSend(v21, sel_doubleValueForUnit_, v26);
      uint64_t v28 = v27;

      (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v6);
      (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v13, v6);
      uint64_t result = type metadata accessor for DepthIntervalSummary();
      uint64_t v30 = a1 + *(int *)(result + 20);
      *(void *)uint64_t v30 = v25;
      *(void *)(v30 + 8) = v28;
      *(unsigned char *)(v30 + 16) = 0;
      return result;
    }
  }
  if (qword_26980A7C8 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_24CAE5860();
  __swift_project_value_buffer(v31, (uint64_t)qword_26980B978);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v15, v6);
  uint64_t v32 = sub_24CAE5840();
  os_log_type_t v33 = sub_24CAE5DA0();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v42 = v35;
    uint64_t v40 = a1;
    *(_DWORD *)uint64_t v34 = 136315138;
    uint64_t v39 = v34 + 4;
    sub_24CABE480(&qword_26980AF80, MEMORY[0x263F062D0]);
    uint64_t v36 = sub_24CAE61B0();
    uint64_t v41 = sub_24CAA4228(v36, v37, &v42);
    a1 = v40;
    sub_24CAE5ED0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    _os_log_impl(&dword_24CA9E000, v32, v33, "DiveGraphDataProvider: Statistics exists for interval, but min/max not populated for dateInterval=%s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253308900](v35, -1, -1);
    MEMORY[0x253308900](v34, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }

  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v15, v6);
  uint64_t result = type metadata accessor for DepthIntervalSummary();
  uint64_t v38 = a1 + *(int *)(result + 20);
  *(void *)uint64_t v38 = 0;
  *(void *)(v38 + 8) = 0;
  *(unsigned char *)(v38 + 16) = 1;
  return result;
}

uint64_t sub_24CABA588(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_24CAE5730();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  v3[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF30);
  v3[9] = swift_task_alloc();
  uint64_t v5 = sub_24CAE5A30();
  v3[10] = v5;
  v3[11] = *(void *)(v5 - 8);
  v3[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF38);
  v3[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF40);
  v3[14] = swift_task_alloc();
  uint64_t v6 = sub_24CAE5660();
  v3[15] = v6;
  v3[16] = *(void *)(v6 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF48);
  v3[19] = v7;
  v3[20] = *(void *)(v7 - 8);
  v3[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CABA814, 0, 0);
}

uint64_t sub_24CABA814()
{
  if (v0[3])
  {
    uint64_t v1 = v0[4];
    uint64_t v2 = self;
    v0[22] = v2;
    uint64_t v3 = (void *)sub_24CAE5750();
    id v4 = objc_msgSend(v2, sel_predicateForObjectWithUUID_, v3);
    v0[23] = v4;

    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF50);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF58);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_24CAE6F00;
    sub_24CAA1114(0, &qword_26980AF60);
    id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_workoutType);
    sub_24CAA1114(0, &qword_26980AF68);
    id v6 = v4;
    sub_24CAE59C0();

    sub_24CAE59F0();
    uint64_t v7 = *(void **)(v1 + 16);
    v0[24] = v7;
    id v8 = v7;
    uint64_t v9 = (void *)swift_task_alloc();
    v0[25] = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_24CABABAC;
    uint64_t v10 = v0[19];
    return MEMORY[0x270EF3200](v8, v10);
  }
  else
  {
    if (qword_26980A7C8 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_24CAE5860();
    __swift_project_value_buffer(v11, (uint64_t)qword_26980B978);
    uint64_t v12 = sub_24CAE5840();
    os_log_type_t v13 = sub_24CAE5D90();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_24CA9E000, v12, v13, "DiveGraphDataProvider: 0 intervals requested, returning empty summary array", v14, 2u);
      MEMORY[0x253308900](v14, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v15 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v16 = MEMORY[0x263F8EE78];
    return v15(v16);
  }
}

uint64_t sub_24CABABAC(uint64_t a1)
{
  uint64_t v3 = *v2;
  id v4 = *(void **)(*v2 + 192);
  *(void *)(v3 + 208) = a1;
  *(void *)(v3 + 216) = v1;
  swift_task_dealloc();

  if (v1) {
    id v5 = sub_24CABB4F0;
  }
  else {
    id v5 = sub_24CABACDC;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24CABACDC(uint64_t a1)
{
  unint64_t v2 = v1[26];
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_24CAE6020();
    a1 = swift_bridgeObjectRelease();
    if (v24) {
      goto LABEL_3;
    }
LABEL_15:
    id v23 = (void *)v1[23];
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_15;
  }
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    id v3 = (id)MEMORY[0x253307F70](0, v1[26]);
  }
  else
  {
    if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_21;
    }
    id v3 = *(id *)(v1[26] + 32);
  }
  v1[28] = v3;
  swift_bridgeObjectRelease();
  self;
  id v4 = (void *)swift_dynamicCastObjCClass();
  v1[29] = v4;
  if (v4)
  {
    id v5 = v4;
    uint64_t v7 = v1[13];
    uint64_t v6 = v1[14];
    unint64_t v8 = v1[3];
    objc_msgSend(v4, sel_duration);
    double v10 = ceil(v9 / (double)v8);
    uint64_t v11 = sub_24CAE5800();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
    uint64_t v12 = sub_24CAE5810();
    a1 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
    if ((~*(void *)&v10 & 0x7FF0000000000000) != 0)
    {
      if (v10 > -9.22337204e18)
      {
        if (v10 < 9.22337204e18)
        {
          os_log_type_t v13 = (void *)v1[22];
          uint64_t v14 = v1[18];
          uint64_t v15 = v1[16];
          uint64_t v39 = v1[17];
          uint64_t v40 = v1[15];
          uint64_t v41 = v1[4];
          LOBYTE(v38) = 1;
          LOBYTE(v37) = 1;
          LOBYTE(v36) = 1;
          LOBYTE(v35) = 1;
          LOBYTE(v34) = 1;
          LOBYTE(v33) = 1;
          LOBYTE(v32) = 1;
          LOBYTE(v31) = 0;
          LOBYTE(v30) = 1;
          LOBYTE(v29) = 1;
          LOBYTE(v28) = 1;
          sub_24CAE5650();
          id v16 = objc_retainAutoreleasedReturnValue(objc_msgSend(v13, sel_predicateForObjectsFromWorkout_, v5, 0, v28, 0, v29, 0, v30, (uint64_t)v10, v31, 0, v32, 0, v33, 0, v34, 0,
                    v35,
                    0,
                    v36,
                    0,
                    v37,
                    0,
                    v38));
          v1[30] = v16;
          sub_24CAA1114(0, (unint64_t *)&qword_26980A820);
          id v17 = (void *)MEMORY[0x253307DB0]((id)*MEMORY[0x263F09F18]);
          sub_24CAA1114(0, &qword_26980AB60);
          id v18 = v16;
          sub_24CAE59C0();

          id v19 = objc_msgSend(v5, sel_startDate);
          sub_24CAE5710();

          (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v39, v14, v40);
          sub_24CAE5A20();
          id v20 = *(void **)(v41 + 16);
          v1[31] = v20;
          id v21 = v20;
          uint64_t v22 = (void *)swift_task_alloc();
          v1[32] = v22;
          *uint64_t v22 = v1;
          v22[1] = sub_24CABB1C0;
          a1 = (uint64_t)v21;
          return MEMORY[0x270EF32B0](a1);
        }
LABEL_23:
        __break(1u);
        return MEMORY[0x270EF32B0](a1);
      }
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v23 = (void *)v1[23];

LABEL_16:
  (*(void (**)(void, void))(v1[20] + 8))(v1[21], v1[19]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(uint64_t))v1[1];
  uint64_t v26 = MEMORY[0x263F8EE78];
  return v25(v26);
}

uint64_t sub_24CABB1C0(uint64_t a1)
{
  uint64_t v4 = *v2;
  id v5 = *(void **)(*v2 + 248);
  *(void *)(*v2 + 264) = v1;
  swift_task_dealloc();

  if (v1)
  {
    uint64_t v6 = sub_24CABB5E8;
  }
  else
  {
    *(void *)(v4 + 272) = a1;
    uint64_t v6 = sub_24CABB308;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24CABB308()
{
  uint64_t v1 = *(void **)(v0 + 272);
  id v20 = *(void **)(v0 + 240);
  id v21 = *(void **)(v0 + 224);
  uint64_t v16 = *(void *)(v0 + 264);
  id v18 = *(void **)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v25 = *(void *)(v0 + 152);
  uint64_t v26 = *(void *)(v0 + 168);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v23 = *(void *)(v0 + 96);
  uint64_t v24 = *(void *)(v0 + 120);
  uint64_t v22 = *(void *)(v0 + 80);
  uint64_t v7 = *(void *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 56);
  uint64_t v19 = *(void *)(v0 + 40);
  uint64_t v8 = *(void *)(v0 + 24);
  id v9 = objc_msgSend(*(id *)(v0 + 232), sel_startDate);
  sub_24CAE5710();

  uint64_t v10 = v3;
  uint64_t v11 = v3;
  uint64_t v12 = v16;
  uint64_t v17 = sub_24CABE0DC(v1, v6, v11, v8);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v19);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v23, v22);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v10, v24);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v26, v25);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(uint64_t))(v0 + 8);
  if (!v12) {
    uint64_t v13 = v17;
  }
  return v14(v13);
}

uint64_t sub_24CABB4F0()
{
  (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 168), *(void *)(v0 + 152));
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t sub_24CABB5E8()
{
  uint64_t v1 = *(void **)(v0 + 240);
  uint64_t v2 = *(void **)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v7 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v0 + 96);
  uint64_t v8 = *(void *)(v0 + 80);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 168), *(void *)(v0 + 152));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_24CABB730(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v56 = a4;
  uint64_t v64 = a2;
  uint64_t v5 = sub_24CAE5660();
  uint64_t v59 = *(void *)(v5 - 8);
  uint64_t v60 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v57 = (char *)v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24CAE5800();
  uint64_t v62 = *(void *)(v7 - 8);
  uint64_t v63 = (void (*)(char *, uint64_t, uint64_t))v7;
  MEMORY[0x270FA5388](v7);
  id v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A998);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24CAE5730();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v55 = (char *)v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v53 - v18;
  MEMORY[0x270FA5388](v17);
  id v21 = (char *)v53 - v20;
  sub_24CAE57E0();
  swift_beginAccess();
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v61 = a3;
  v22(v19, a3, v13);
  sub_24CAE57C0();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v14 + 8);
  int64_t v58 = v19;
  v53[1] = v14 + 8;
  uint64_t v54 = v23;
  v23(v19, v13);
  (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v62 + 8))(v9, v63);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    uint64_t v63 = v22;
    sub_24CAA51D0((uint64_t)v12, &qword_26980A998);
    if (qword_26980A7C8 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_24CAE5860();
    __swift_project_value_buffer(v24, (uint64_t)qword_26980B978);
    uint64_t v26 = v59;
    uint64_t v25 = v60;
    uint64_t v27 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v57, v64, v60);
    uint64_t v28 = sub_24CAE5840();
    os_log_type_t v29 = sub_24CAE5DA0();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      uint64_t v66 = v64;
      *(_DWORD *)uint64_t v30 = 136315394;
      uint64_t v31 = v61;
      swift_beginAccess();
      uint64_t v32 = v58;
      v63(v58, v31, v13);
      sub_24CABE480(&qword_26980AF98, MEMORY[0x263F07490]);
      uint64_t v33 = sub_24CAE61B0();
      unint64_t v35 = v34;
      v54(v32, v13);
      uint64_t v65 = sub_24CAA4228(v33, v35, &v66);
      sub_24CAE5ED0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2080;
      sub_24CABE480(&qword_26980AFA0, MEMORY[0x263F063B0]);
      uint64_t v36 = v60;
      uint64_t v37 = sub_24CAE61B0();
      uint64_t v65 = sub_24CAA4228(v37, v38, &v66);
      sub_24CAE5ED0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v27, v36);
      _os_log_impl(&dword_24CA9E000, v28, v29, "DepthGraphDataProvider: Failed to create endDate from startDate=%s using components=%s", (uint8_t *)v30, 0x16u);
      uint64_t v39 = v64;
      swift_arrayDestroy();
      MEMORY[0x253308900](v39, -1, -1);
      MEMORY[0x253308900](v30, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v25);
    }

    sub_24CABE3C4();
    swift_allocError();
    return swift_willThrow();
  }
  else
  {
    uint64_t v62 = *(void *)(v14 + 32);
    uint64_t v63 = (void (*)(char *, uint64_t, uint64_t))(v14 + 32);
    ((void (*)(char *, char *, uint64_t))v62)(v21, v12, v13);
    uint64_t v40 = v55;
    uint64_t v64 = v13;
    v22(v55, (uint64_t)v21, v13);
    uint64_t v41 = v56;
    unint64_t v42 = *v56;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v41 = v42;
    unsigned int v44 = v21;
    uint64_t v45 = v40;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v42 = sub_24CAE287C(0, *(void *)(v42 + 16) + 1, 1, v42);
      *uint64_t v41 = v42;
    }
    unint64_t v47 = *(void *)(v42 + 16);
    unint64_t v46 = *(void *)(v42 + 24);
    if (v47 >= v46 >> 1)
    {
      unint64_t v42 = sub_24CAE287C(v46 > 1, v47 + 1, 1, v42);
      *uint64_t v41 = v42;
    }
    *(void *)(v42 + 16) = v47 + 1;
    uint64_t v48 = v64;
    uint64_t v49 = (void (*)(char *, char *, uint64_t))v62;
    ((void (*)(unint64_t, char *, uint64_t))v62)(v42+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(void *)(v14 + 72) * v47, v45, v64);
    uint64_t v50 = v58;
    v49(v58, v44, v48);
    uint64_t v51 = v61;
    swift_beginAccess();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 40))(v51, v50, v48);
  }
}

uint64_t sub_24CABBE6C(void *a1)
{
  uint64_t v57 = sub_24CAE5730();
  uint64_t v46 = *(void *)(v57 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v57);
  uint64_t v56 = &v45[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v2);
  unint64_t v55 = &v45[-v4];
  uint64_t v54 = sub_24CAE5630();
  uint64_t v5 = *(void *)(v54 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v54);
  int64_t v58 = &v45[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  unint64_t v47 = &v45[-v8];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF88);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = &v45[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v49 = &v45[-v13];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF90);
  uint64_t v50 = *(void *)(v14 - 8);
  uint64_t result = MEMORY[0x270FA5388](v14);
  uint64_t v48 = &v45[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = a1[3];
  unint64_t v18 = a1[4];
  if (__OFSUB__(v18 >> 1, v17))
  {
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }
  uint64_t v19 = *a1;
  uint64_t v20 = a1[1];
  uint64_t v21 = *(void *)(*a1 + 16);
  uint64_t v53 = a1[2];
  if ((uint64_t)((v18 >> 1) - v17) >= v21) {
    uint64_t v22 = v21;
  }
  else {
    uint64_t v22 = (v18 >> 1) - v17;
  }
  uint64_t v67 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24CAE2DE8(0, v22 & ~(v22 >> 63), 0);
  uint64_t v59 = v19;
  uint64_t v60 = 0;
  uint64_t v61 = v20;
  uint64_t v62 = v53;
  uint64_t v63 = v17;
  unint64_t v64 = v18;
  uint64_t v65 = v17;
  char v66 = 0;
  if (v22 < 0) {
    goto LABEL_27;
  }
  uint64_t v53 = v14;
  if (v22)
  {
    uint64_t v23 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v46 + 16);
    uint64_t v51 = v5 + 32;
    unint64_t v52 = (uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v50 + 48);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    uint64_t v25 = v55;
    uint64_t v24 = v56;
    while (1)
    {
      sub_24CABD89C((uint64_t)v12);
      uint64_t result = (*v52)(v12, 1, v14);
      if (result == 1) {
        goto LABEL_28;
      }
      uint64_t v26 = &v12[*(int *)(v14 + 48)];
      uint64_t v27 = *v23;
      uint64_t v28 = v57;
      (*v23)(v25, v12, v57);
      v27(v24, v26, v28);
      sub_24CAE5600();
      sub_24CAA51D0((uint64_t)v12, &qword_26980AF90);
      uint64_t v29 = v67;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24CAE2DE8(0, *(void *)(v29 + 16) + 1, 1);
        uint64_t v29 = v67;
      }
      unint64_t v31 = *(void *)(v29 + 16);
      unint64_t v30 = *(void *)(v29 + 24);
      if (v31 >= v30 >> 1)
      {
        sub_24CAE2DE8(v30 > 1, v31 + 1, 1);
        uint64_t v29 = v67;
      }
      *(void *)(v29 + 16) = v31 + 1;
      (*(void (**)(unint64_t, unsigned char *, uint64_t))(v5 + 32))(v29+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v31, v58, v54);
      uint64_t v67 = v29;
      --v22;
      uint64_t v14 = v53;
      if (!v22) {
        goto LABEL_16;
      }
    }
  }
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
LABEL_16:
  uint64_t v32 = v49;
  sub_24CABD89C((uint64_t)v49);
  uint64_t v33 = (uint64_t)v32;
  unint64_t v34 = *(unsigned char **)(v50 + 48);
  v50 += 48;
  int64_t v58 = v34;
  if (((unsigned int (*)(unsigned char *, uint64_t, uint64_t))v34)(v32, 1, v14) == 1)
  {
    uint64_t v35 = v67;
  }
  else
  {
    uint64_t v36 = v47;
    uint64_t v37 = (void (**)(unsigned char *, uint64_t, uint64_t))(v46 + 16);
    unint64_t v52 = (uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v5 + 32);
    uint64_t v38 = (uint64_t)v48;
    do
    {
      sub_24CABE418(v33, v38);
      uint64_t v39 = v38 + *(int *)(v14 + 48);
      uint64_t v40 = *v37;
      uint64_t v41 = v57;
      (*v37)(v55, v38, v57);
      v40(v56, v39, v41);
      sub_24CAE5600();
      sub_24CAA51D0(v38, &qword_26980AF90);
      uint64_t v35 = v67;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24CAE2DE8(0, *(void *)(v35 + 16) + 1, 1);
        uint64_t v36 = v47;
        uint64_t v35 = v67;
      }
      unint64_t v43 = *(void *)(v35 + 16);
      unint64_t v42 = *(void *)(v35 + 24);
      if (v43 >= v42 >> 1)
      {
        sub_24CAE2DE8(v42 > 1, v43 + 1, 1);
        uint64_t v36 = v47;
        uint64_t v35 = v67;
      }
      *(void *)(v35 + 16) = v43 + 1;
      (*(void (**)(unint64_t, unsigned char *, uint64_t))(v5 + 32))(v35+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v43, v36, v54);
      uint64_t v67 = v35;
      unsigned int v44 = v49;
      sub_24CABD89C((uint64_t)v49);
      uint64_t v33 = (uint64_t)v44;
      uint64_t v14 = v53;
    }
    while (((unsigned int (*)(unsigned char *, uint64_t, uint64_t))v58)(v44, 1, v53) != 1);
  }
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CAA51D0(v33, &qword_26980AF88);
  return v35;
}

uint64_t sub_24CABC4C8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  id v61 = a2;
  uint64_t v62 = (char *)a4;
  uint64_t v7 = sub_24CAE5630();
  uint64_t v57 = *(void *)(v7 - 8);
  uint64_t v58 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v56 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24CAE5730();
  unint64_t v64 = *(uint8_t **)(v9 - 8);
  uint64_t v65 = (void (*)(void, void, void))v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24CAE5800();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A998);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v63 = (char *)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF38);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF40);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)&v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_24CAE5660();
  uint64_t v66 = *(void *)(v24 - 8);
  uint64_t v67 = v24;
  MEMORY[0x270FA5388](v24);
  uint64_t v68 = a1;
  unint64_t v69 = (char *)&v55 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CAE5620();
  double v27 = fmod(v26 * 0.5, 1.0) * 1000000000.0;
  if ((~*(void *)&v27 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v27 <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v27 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    swift_once();
    goto LABEL_9;
  }
  uint64_t v59 = a3;
  uint64_t v60 = v4;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v23, 1, 1, v12);
  uint64_t v28 = sub_24CAE5810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v20, 1, 1, v28);
  sub_24CAE5650();
  sub_24CAE57E0();
  sub_24CAE5610();
  uint64_t v29 = (uint64_t)v63;
  sub_24CAE57C0();
  unint64_t v31 = v64;
  unint64_t v30 = v65;
  uint64_t v32 = (void (*)(void, void))*((void *)v64 + 1);
  v32(v11, v65);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v33 = v30;
  LODWORD(v30) = (*((uint64_t (**)(uint64_t, uint64_t, void))v31 + 6))(v29, 1, v30);
  sub_24CAA51D0(v29, &qword_26980A998);
  if (v30 == 1)
  {
    sub_24CABE3C4();
    uint64_t v34 = swift_allocError();
    swift_willThrow();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v69, v67);
    *uint64_t v59 = v34;
    return result;
  }
  sub_24CAE5610();
  uint64_t v36 = (void *)sub_24CAE56E0();
  v32(v11, v33);
  id v37 = objc_msgSend(v61, sel_statisticsForDate_, v36);

  if (v37)
  {
    sub_24CABA06C((uint64_t)v62);

    return (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v69, v67);
  }
  if (qword_26980A7C8 != -1) {
    goto LABEL_16;
  }
LABEL_9:
  uint64_t v38 = sub_24CAE5860();
  __swift_project_value_buffer(v38, (uint64_t)qword_26980B978);
  uint64_t v40 = v56;
  uint64_t v39 = v57;
  uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 16);
  uint64_t v42 = v68;
  uint64_t v43 = v58;
  v41(v56, v68, v58);
  unsigned int v44 = sub_24CAE5840();
  os_log_type_t v45 = sub_24CAE5DA0();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    uint64_t v65 = (void (*)(void, void, void))v41;
    uint64_t v48 = v47;
    uint64_t v71 = v47;
    *(_DWORD *)uint64_t v46 = 136315138;
    unint64_t v64 = v46 + 4;
    sub_24CABE480(&qword_26980AF80, MEMORY[0x263F062D0]);
    uint64_t v49 = sub_24CAE61B0();
    uint64_t v70 = sub_24CAA4228(v49, v50, &v71);
    uint64_t v43 = v58;
    sub_24CAE5ED0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v43);
    _os_log_impl(&dword_24CA9E000, v44, v45, "DepthGraphDataProvider: Filling interval gap for interval=%s", v46, 0xCu);
    swift_arrayDestroy();
    uint64_t v51 = v48;
    uint64_t v41 = (void (*)(char *, uint64_t, uint64_t))v65;
    MEMORY[0x253308900](v51, -1, -1);
    unint64_t v52 = v46;
    uint64_t v42 = v68;
    MEMORY[0x253308900](v52, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v43);
  }
  (*(void (**)(char *, uint64_t))(v66 + 8))(v69, v67);
  uint64_t v53 = (uint64_t)v62;
  v41(v62, v42, v43);
  uint64_t result = type metadata accessor for DepthIntervalSummary();
  uint64_t v54 = v53 + *(int *)(result + 20);
  *(void *)uint64_t v54 = 0;
  *(void *)(v54 + 8) = 0;
  *(unsigned char *)(v54 + 16) = 1;
  return result;
}

uint64_t sub_24CABCCF8()
{
  return swift_deallocClassInstance();
}

unint64_t sub_24CABCD30()
{
  unint64_t result = qword_26980AEA0;
  if (!qword_26980AEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AEA0);
  }
  return result;
}

unint64_t sub_24CABCD84()
{
  unint64_t result = qword_26980B180;
  if (!qword_26980B180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B180);
  }
  return result;
}

unint64_t sub_24CABCDD8()
{
  unint64_t result = qword_26980B1C0;
  if (!qword_26980B1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B1C0);
  }
  return result;
}

uint64_t type metadata accessor for DepthIntervalSummary()
{
  uint64_t result = qword_26980AEE8;
  if (!qword_26980AEE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24CABCE78()
{
  unint64_t result = qword_26980AEB8;
  if (!qword_26980AEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AEB8);
  }
  return result;
}

unint64_t sub_24CABCECC()
{
  unint64_t result = qword_26980AEC8;
  if (!qword_26980AEC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AEC8);
  }
  return result;
}

unint64_t sub_24CABCF20()
{
  unint64_t result = qword_26980AEE0;
  if (!qword_26980AEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AEE0);
  }
  return result;
}

uint64_t sub_24CABCF74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DepthIntervalSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CABCFD8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DepthIntervalSummary();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for DepthValueRange()
{
  return &type metadata for DepthValueRange;
}

uint64_t *initializeBufferWithCopyOfBuffer for DepthIntervalSummary(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_24CAE5630();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
    v9[16] = v10[16];
  }
  return a1;
}

uint64_t destroy for DepthIntervalSummary(uint64_t a1)
{
  uint64_t v2 = sub_24CAE5630();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for DepthIntervalSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CAE5630();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  return a1;
}

uint64_t assignWithCopy for DepthIntervalSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CAE5630();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  char v10 = *(unsigned char *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = v10;
  return a1;
}

uint64_t initializeWithTake for DepthIntervalSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CAE5630();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  return a1;
}

uint64_t assignWithTake for DepthIntervalSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CAE5630();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for DepthIntervalSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CABD3C8);
}

uint64_t sub_24CABD3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CAE5630();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DepthIntervalSummary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CABD448);
}

uint64_t sub_24CABD448(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CAE5630();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_24CABD4B8()
{
  uint64_t result = sub_24CAE5630();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for DiveGraphDataProvider()
{
  return self;
}

ValueMetadata *type metadata accessor for DepthIntervalSummary.CodingKeys()
{
  return &type metadata for DepthIntervalSummary.CodingKeys;
}

unsigned char *_s9DepthCore20DepthIntervalSummaryV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CABD654);
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

ValueMetadata *type metadata accessor for DepthValueRange.CodingKeys()
{
  return &type metadata for DepthValueRange.CodingKeys;
}

unint64_t sub_24CABD690()
{
  unint64_t result = qword_26980AF00;
  if (!qword_26980AF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AF00);
  }
  return result;
}

unint64_t sub_24CABD6E8()
{
  unint64_t result = qword_26980AF08;
  if (!qword_26980AF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AF08);
  }
  return result;
}

unint64_t sub_24CABD740()
{
  unint64_t result = qword_26980AF10;
  if (!qword_26980AF10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AF10);
  }
  return result;
}

unint64_t sub_24CABD798()
{
  unint64_t result = qword_26980AF18;
  if (!qword_26980AF18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AF18);
  }
  return result;
}

unint64_t sub_24CABD7F0()
{
  unint64_t result = qword_26980AF20;
  if (!qword_26980AF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AF20);
  }
  return result;
}

unint64_t sub_24CABD848()
{
  unint64_t result = qword_26980AF28;
  if (!qword_26980AF28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AF28);
  }
  return result;
}

uint64_t sub_24CABD89C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A998);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  unsigned int v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v31 - v7;
  uint64_t v9 = sub_24CAE5730();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v31 - v15;
  if (*((unsigned char *)v1 + 56) != 1)
  {
    uint64_t v19 = *v1;
    unint64_t v20 = v1[1];
    unint64_t v21 = *(void *)(*v1 + 16);
    if (v20 == v21)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
      unsigned int v6 = v8;
LABEL_17:
      sub_24CAA51D0((uint64_t)v6, &qword_26980A998);
      *((unsigned char *)v1 + 56) = 1;
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF90);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(a1, 1, 1, v26);
    }
    if (v20 >= v21)
    {
      __break(1u);
    }
    else
    {
      uint64_t v38 = a1;
      unint64_t v22 = v19
          + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
          + *(void *)(v10 + 72) * v20;
      uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
      uint64_t v35 = *(void *)(v10 + 72);
      uint64_t v36 = v23;
      v23(v8, v22, v9);
      v1[1] = v20 + 1;
      id v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
      v37(v8, 0, 1, v9);
      uint64_t v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
      if (v34(v8, 1, v9) == 1)
      {
        unsigned int v6 = v8;
LABEL_16:
        a1 = v38;
        goto LABEL_17;
      }
      uint64_t v32 = *(uint64_t (**)(char *, char *, uint64_t))(v10 + 32);
      uint64_t v33 = v10 + 32;
      uint64_t result = v32(v16, v8, v9);
      uint64_t v24 = v1[6];
      uint64_t v25 = (unint64_t)v1[5] >> 1;
      if (v24 == v25)
      {
        v37(v6, 1, 1, v9);
LABEL_15:
        (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
        goto LABEL_16;
      }
      if (v24 < v25 && v24 >= v1[4])
      {
        v36(v6, v1[3] + v24 * v35, v9);
        v1[6] = v24 + 1;
        v37(v6, 0, 1, v9);
        if (v34(v6, 1, v9) != 1)
        {
          double v27 = (void (*)(uint64_t, char *, uint64_t))v32;
          v32(v13, v6, v9);
          uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF90);
          uint64_t v29 = v38;
          uint64_t v30 = v38 + *(int *)(v28 + 48);
          v27(v38, v16, v9);
          v27(v30, v13, v9);
          return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v29, 0, 1, v28);
        }
        goto LABEL_15;
      }
    }
    __break(1u);
    return result;
  }
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF90);
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  return v18(a1, 1, 1, v17);
}

uint64_t sub_24CABDD2C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7235949 && a2 == 0xE300000000000000;
  if (v3 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7889261 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CABDDF8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65746E4965746164 && a2 == 0xEC0000006C617672;
  if (v3 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E61526874706564 && a2 == 0xEA00000000006567)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CABDEFC(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v17 = a2;
  uint64_t v5 = type metadata accessor for DepthIntervalSummary();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (v9)
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
    sub_24CAE2DAC(0, v9, 0);
    uint64_t v10 = v19;
    uint64_t v11 = *(void *)(sub_24CAE5630() - 8);
    uint64_t v12 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    uint64_t v13 = *(void *)(v11 + 72);
    while (1)
    {
      sub_24CABC4C8(v12, v17, &v18, (uint64_t)v8);
      if (v3) {
        break;
      }
      uint64_t v3 = 0;
      uint64_t v19 = v10;
      unint64_t v15 = *(void *)(v10 + 16);
      unint64_t v14 = *(void *)(v10 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_24CAE2DAC(v14 > 1, v15 + 1, 1);
        uint64_t v10 = v19;
      }
      *(void *)(v10 + 16) = v15 + 1;
      sub_24CABE360((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v15);
      v12 += v13;
      if (!--v9) {
        return v10;
      }
    }
    swift_release();
  }
  return v10;
}

uint64_t sub_24CABE0DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = a2;
  unint64_t v22 = a1;
  uint64_t v7 = sub_24CAE5730();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v24(v10, v25, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF70);
  uint64_t v11 = v7;
  uint64_t v23 = v8;
  unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_24CAE6F00;
  uint64_t v25 = v11;
  v24((char *)(v13 + v12), (uint64_t)v10, v11);
  uint64_t v28 = v13;
  if (a4)
  {
    uint64_t v14 = v23;
    while (1)
    {
      sub_24CABB730((uint64_t)v26, a3, (uint64_t)v10, (unint64_t *)&v28);
      if (v4) {
        break;
      }
      if (!--a4)
      {
        uint64_t v13 = v28;
        goto LABEL_7;
      }
    }
  }
  else
  {
    uint64_t v14 = v23;
LABEL_7:
    unint64_t v15 = v22;
    uint64_t v16 = *(void *)(v13 + 16);
    v27[0] = v13;
    v27[1] = v13;
    v27[2] = v13 + v12;
    v27[3] = v16 != 0;
    v27[4] = (2 * v16) | 1;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_24CABBE6C(v27);
    swift_bridgeObjectRelease();
    id v18 = v15;
    uint64_t v19 = sub_24CABDEFC(v17, v18);
    if (!v4)
    {
      uint64_t v8 = v19;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v25);
      return v8;
    }

    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v25);
  return v8;
}

uint64_t sub_24CABE360(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DepthIntervalSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24CABE3C4()
{
  unint64_t result = qword_26980AF78;
  if (!qword_26980AF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AF78);
  }
  return result;
}

uint64_t sub_24CABE418(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CABE480(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for DiveGraphDataProvider.DiveGraphDataProviderError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CABE564);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DiveGraphDataProvider.DiveGraphDataProviderError()
{
  return &type metadata for DiveGraphDataProvider.DiveGraphDataProviderError;
}

unint64_t sub_24CABE5A0()
{
  unint64_t result = qword_26980AFA8;
  if (!qword_26980AFA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AFA8);
  }
  return result;
}

BOOL BatteryLevel.isLow.getter()
{
  return *(unsigned char *)(v0 + 4) == 1;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for BatteryLevel(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 4);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BatteryLevel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 5) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 5) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 4) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24CABE6B0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 4) <= 1u) {
    return *(unsigned __int8 *)(a1 + 4);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24CABE6C8(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_DWORD *)unint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 4) = a2;
  return result;
}

ValueMetadata *type metadata accessor for BatteryLevel()
{
  return &type metadata for BatteryLevel;
}

DepthCore::TemperatureValue __swiftcall TemperatureValue.init(value:inUnit:)(DepthCore::TemperatureValue value, DepthCore::WaterTemperatureUnit inUnit)
{
  if (*(unsigned char *)inUnit) {
    value.canonicalValue = (value.canonicalValue + -32.0) * 0.555555556;
  }
  *int v2 = value.canonicalValue;
  return value;
}

Swift::Double __swiftcall TemperatureValue.value(forUnit:)(DepthCore::WaterTemperatureUnit forUnit)
{
  Swift::Double result = *v1;
  if (*(unsigned char *)forUnit == 1) {
    return result / 0.555555556 + 32.0;
  }
  return result;
}

id WaterTemperatureUnit.unitTemperature.getter()
{
  int v1 = *v0;
  int v2 = self;
  unsigned int v3 = &selRef_fahrenheit;
  if (!v1) {
    unsigned int v3 = &selRef_celsius;
  }
  id v4 = [v2 *v3];
  return v4;
}

BOOL static TemperatureValue.< infix(_:_:)(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL static TemperatureValue.> infix(_:_:)(double *a1, double *a2)
{
  return *a2 < *a1;
}

BOOL static TemperatureValue.== infix(_:_:)(double *a1, double *a2)
{
  return *a1 == *a2;
}

void Temperature.temperature.getter(uint64_t a1@<X8>)
{
  char v2 = *((unsigned char *)v1 + 8);
  if (v2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *v1;
  }
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t sub_24CABE804(char a1)
{
  if (a1) {
    return 0x74617265706D6574;
  }
  else {
    return 0x6E776F6E6B6E75;
  }
}

uint64_t sub_24CABE844()
{
  return sub_24CABE804(*v0);
}

uint64_t sub_24CABE84C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CAC01FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CABE874(uint64_t a1)
{
  unint64_t v2 = sub_24CABECE8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CABE8B0(uint64_t a1)
{
  unint64_t v2 = sub_24CABECE8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CABE8F4(uint64_t a1)
{
  unint64_t v2 = sub_24CABED3C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CABE930(uint64_t a1)
{
  unint64_t v2 = sub_24CABED3C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CABE96C(uint64_t a1)
{
  unint64_t v2 = sub_24CABED90();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CABE9A8(uint64_t a1)
{
  unint64_t v2 = sub_24CABED90();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Temperature.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AFB0);
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v22 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v20 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AFB8);
  uint64_t v18 = *(void *)(v5 - 8);
  uint64_t v19 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AFC0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v1;
  char v13 = *((unsigned char *)v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CABECE8();
  sub_24CAE6280();
  if (v13)
  {
    char v23 = 0;
    sub_24CABED90();
    sub_24CAE6120();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v19);
  }
  else
  {
    char v25 = 1;
    sub_24CABED3C();
    unint64_t v15 = v20;
    sub_24CAE6120();
    uint64_t v24 = v12;
    sub_24CAAFACC();
    uint64_t v16 = v22;
    sub_24CAE6180();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v16);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

unint64_t sub_24CABECE8()
{
  unint64_t result = qword_26980AFC8;
  if (!qword_26980AFC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AFC8);
  }
  return result;
}

unint64_t sub_24CABED3C()
{
  unint64_t result = qword_26980AFD0;
  if (!qword_26980AFD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AFD0);
  }
  return result;
}

unint64_t sub_24CABED90()
{
  unint64_t result = qword_26980AFD8;
  if (!qword_26980AFD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980AFD8);
  }
  return result;
}

uint64_t Temperature.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AFE0);
  uint64_t v27 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AFE8);
  uint64_t v26 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AFF0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  uint64_t v29 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_24CABECE8();
  uint64_t v13 = v30;
  sub_24CAE6270();
  if (v13) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
  }
  uint64_t v30 = v9;
  uint64_t v14 = sub_24CAE6110();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_24CAE5F90();
    swift_allocError();
    uint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AC48);
    *uint64_t v18 = &type metadata for Temperature;
    sub_24CAE60A0();
    sub_24CAE5F80();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCB0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v8);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
  }
  uint64_t v24 = v14;
  char v15 = *(unsigned char *)(v14 + 32);
  if (v15)
  {
    char v33 = 1;
    sub_24CABED3C();
    sub_24CAE6090();
    sub_24CAAFBC8();
    uint64_t v20 = v25;
    sub_24CAE6100();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v4, v20);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v8);
    uint64_t v21 = v31;
  }
  else
  {
    char v32 = 0;
    sub_24CABED90();
    sub_24CAE6090();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v8);
    uint64_t v21 = 0;
  }
  char v23 = v28;
  uint64_t v22 = (uint64_t)v29;
  *uint64_t v28 = v21;
  *((unsigned char *)v23 + 8) = v15 ^ 1;
  return __swift_destroy_boxed_opaque_existential_0(v22);
}

uint64_t sub_24CABF29C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return Temperature.init(from:)(a1, a2);
}

uint64_t sub_24CABF2B4(void *a1)
{
  return Temperature.encode(to:)(a1);
}

uint64_t static Temperature.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  int v3 = *(unsigned __int8 *)(a2 + 8);
  if (v2)
  {
    if (v3) {
      return 0;
    }
    return v2 & (v3 ^ 1u);
  }
  if (v3) {
    return v2 & (v3 ^ 1u);
  }
  return *(double *)a1 != *(double *)a2 && *(double *)a1 < *(double *)a2;
}

uint64_t static Temperature.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 8);
  unsigned int v4 = *(unsigned __int8 *)(a2 + 8);
  uint64_t result = v3 & v4;
  if ((v3 & 1) == 0 && (v4 & 1) == 0) {
    return *(double *)a1 == *(double *)a2;
  }
  return result;
}

uint64_t sub_24CABF344(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  int v3 = *(unsigned __int8 *)(a2 + 8);
  if (v2)
  {
    if (v3) {
      return 0;
    }
    return v2 & (v3 ^ 1u);
  }
  if (v3) {
    return v2 & (v3 ^ 1u);
  }
  if (*(double *)a1 == *(double *)a2) {
    return 0;
  }
  return *(double *)a1 < *(double *)a2;
}

uint64_t sub_24CABF388(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  int v3 = *(unsigned __int8 *)(a2 + 8);
  if (v3)
  {
    if (v2) {
      return 1;
    }
    return v3 & (v2 ^ 1) ^ 1u;
  }
  if (v2) {
    return v3 & (v2 ^ 1) ^ 1u;
  }
  if (*(double *)a2 == *(double *)a1) {
    return 1;
  }
  return *(double *)a2 >= *(double *)a1;
}

uint64_t sub_24CABF3D4(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  int v3 = *(unsigned __int8 *)(a2 + 8);
  if (v2)
  {
    if (v3) {
      return 1;
    }
    return v2 & (v3 ^ 1) ^ 1u;
  }
  if (v3) {
    return v2 & (v3 ^ 1) ^ 1u;
  }
  if (*(double *)a1 == *(double *)a2) {
    return 1;
  }
  return *(double *)a1 >= *(double *)a2;
}

uint64_t sub_24CABF420(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  int v3 = *(unsigned __int8 *)(a2 + 8);
  if (v3)
  {
    if (v2) {
      return 0;
    }
    return v3 & (v2 ^ 1u);
  }
  if (v2) {
    return v3 & (v2 ^ 1u);
  }
  if (*(double *)a2 == *(double *)a1) {
    return 0;
  }
  return *(double *)a2 < *(double *)a1;
}

uint64_t sub_24CABF464(uint64_t a1, uint64_t a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 8);
  unsigned int v4 = *(unsigned __int8 *)(a2 + 8);
  uint64_t result = v3 & v4;
  if ((v3 & 1) == 0 && (v4 & 1) == 0) {
    return *(double *)a1 == *(double *)a2;
  }
  return result;
}

BOOL static WaterTemperatureUnit.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t WaterTemperatureUnit.hash(into:)()
{
  return sub_24CAE6250();
}

uint64_t WaterTemperatureUnit.hashValue.getter()
{
  return sub_24CAE6260();
}

uint64_t sub_24CABF524@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CAC02F8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24CABF550(uint64_t a1)
{
  unint64_t v2 = sub_24CABF6FC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CABF58C(uint64_t a1)
{
  unint64_t v2 = sub_24CABF6FC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TemperatureValue.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AFF8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CABF6FC();
  sub_24CAE6280();
  sub_24CAE6170();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_24CABF6FC()
{
  unint64_t result = qword_26980B000;
  if (!qword_26980B000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B000);
  }
  return result;
}

uint64_t TemperatureValue.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B008);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CABF6FC();
  sub_24CAE6270();
  if (!v2)
  {
    sub_24CAE60F0();
    uint64_t v10 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_24CABF8AC()
{
  unint64_t result = qword_26980B010;
  if (!qword_26980B010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B010);
  }
  return result;
}

unint64_t sub_24CABF904()
{
  unint64_t result = qword_26980B018;
  if (!qword_26980B018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B018);
  }
  return result;
}

uint64_t sub_24CABF958@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return TemperatureValue.init(from:)(a1, a2);
}

uint64_t sub_24CABF970(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AFF8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CABF6FC();
  sub_24CAE6280();
  sub_24CAE6170();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_24CABFAA8()
{
  unint64_t result = qword_26980B020;
  if (!qword_26980B020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B020);
  }
  return result;
}

BOOL sub_24CABFAFC(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL sub_24CABFB10(double *a1, double *a2)
{
  return *a2 >= *a1;
}

BOOL sub_24CABFB24(double *a1, double *a2)
{
  return *a1 >= *a2;
}

BOOL sub_24CABFB38(double *a1, double *a2)
{
  return *a2 < *a1;
}

BOOL sub_24CABFB4C(double *a1, double *a2)
{
  return *a1 == *a2;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for Temperature(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Temperature(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_24CABFBC4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24CABFBE0(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Temperature()
{
  return &type metadata for Temperature;
}

ValueMetadata *type metadata accessor for WaterTemperatureUnit()
{
  return &type metadata for WaterTemperatureUnit;
}

ValueMetadata *type metadata accessor for TemperatureValue()
{
  return &type metadata for TemperatureValue;
}

ValueMetadata *type metadata accessor for TemperatureValue.CodingKeys()
{
  return &type metadata for TemperatureValue.CodingKeys;
}

unsigned char *_s9DepthCore20WaterTemperatureUnitOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CABFD18);
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

ValueMetadata *type metadata accessor for Temperature.CodingKeys()
{
  return &type metadata for Temperature.CodingKeys;
}

ValueMetadata *type metadata accessor for Temperature.UnknownCodingKeys()
{
  return &type metadata for Temperature.UnknownCodingKeys;
}

unsigned char *_s9DepthCore16TemperatureValueV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CABFDFCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Temperature.TemperatureCodingKeys()
{
  return &type metadata for Temperature.TemperatureCodingKeys;
}

unint64_t sub_24CABFE38()
{
  unint64_t result = qword_26980B028;
  if (!qword_26980B028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B028);
  }
  return result;
}

unint64_t sub_24CABFE90()
{
  unint64_t result = qword_26980B030;
  if (!qword_26980B030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B030);
  }
  return result;
}

unint64_t sub_24CABFEE8()
{
  unint64_t result = qword_26980B038;
  if (!qword_26980B038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B038);
  }
  return result;
}

unint64_t sub_24CABFF40()
{
  unint64_t result = qword_26980B040;
  if (!qword_26980B040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B040);
  }
  return result;
}

unint64_t sub_24CABFF98()
{
  unint64_t result = qword_26980B048;
  if (!qword_26980B048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B048);
  }
  return result;
}

unint64_t sub_24CABFFF0()
{
  unint64_t result = qword_26980B050;
  if (!qword_26980B050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B050);
  }
  return result;
}

unint64_t sub_24CAC0048()
{
  unint64_t result = qword_26980B058;
  if (!qword_26980B058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B058);
  }
  return result;
}

unint64_t sub_24CAC00A0()
{
  unint64_t result = qword_26980B060;
  if (!qword_26980B060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B060);
  }
  return result;
}

unint64_t sub_24CAC00F8()
{
  unint64_t result = qword_26980B068;
  if (!qword_26980B068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B068);
  }
  return result;
}

unint64_t sub_24CAC0150()
{
  unint64_t result = qword_26980B070;
  if (!qword_26980B070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B070);
  }
  return result;
}

unint64_t sub_24CAC01A8()
{
  unint64_t result = qword_26980B078;
  if (!qword_26980B078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B078);
  }
  return result;
}

uint64_t sub_24CAC01FC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74617265706D6574 && a2 == 0xEB00000000657275)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CAC02F8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6163696E6F6E6163 && a2 == 0xEE0065756C61566CLL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24CAC0398()
{
  return 0x6163696E6F6E6163;
}

uint64_t SessionSummary.id.setter(uint64_t a1)
{
  uint64_t v3 = sub_24CAE57A0();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*SessionSummary.id.modify())()
{
  return nullsub_1;
}

uint64_t SessionSummary.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SessionSummary() + 20);
  uint64_t v4 = sub_24CAE5730();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for SessionSummary()
{
  uint64_t result = qword_26980B0E8;
  if (!qword_26980B0E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SessionSummary.startDate.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SessionSummary() + 20);
  uint64_t v4 = sub_24CAE5730();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*SessionSummary.startDate.modify())()
{
  return nullsub_1;
}

uint64_t SessionSummary.endDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SessionSummary() + 24);
  uint64_t v4 = sub_24CAE5730();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t SessionSummary.endDate.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SessionSummary() + 24);
  uint64_t v4 = sub_24CAE5730();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*SessionSummary.endDate.modify())()
{
  return nullsub_1;
}

uint64_t SessionSummary.maxDepth.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = type metadata accessor for SessionSummary();
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(result + 28));
  uint64_t v5 = *v4;
  LOBYTE(v4) = *((unsigned char *)v4 + 8);
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = (_BYTE)v4;
  return result;
}

uint64_t SessionSummary.maxDepth.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t result = type metadata accessor for SessionSummary();
  uint64_t v5 = v1 + *(int *)(result + 28);
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 8) = v3;
  return result;
}

uint64_t (*SessionSummary.maxDepth.modify())()
{
  return nullsub_1;
}

__n128 SessionSummary.temperatureRange.getter@<Q0>(__n128 *a1@<X8>)
{
  char v3 = (__n128 *)(v1 + *(int *)(type metadata accessor for SessionSummary() + 32));
  unsigned __int8 v4 = v3[1].n128_u8[0];
  __n128 result = *v3;
  *a1 = *v3;
  a1[1].n128_u8[0] = v4;
  return result;
}

uint64_t SessionSummary.temperatureRange.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t result = type metadata accessor for SessionSummary();
  uint64_t v6 = v1 + *(int *)(result + 32);
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = v3;
  *(unsigned char *)(v6 + 16) = v4;
  return result;
}

uint64_t (*SessionSummary.temperatureRange.modify())()
{
  return nullsub_1;
}

uint64_t SessionSummary.deviceIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for SessionSummary() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SessionSummary.deviceIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for SessionSummary() + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*SessionSummary.deviceIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t SessionSummary.underwaterTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48);
  uint64_t v4 = type metadata accessor for SessionSummary();
  uint64_t v5 = v1 + *(int *)(v4 + 20);
  uint64_t v6 = sub_24CAE5730();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, v5, v6);
  v7(v3, v1 + *(int *)(v4 + 24), v6);
  type metadata accessor for UnderwaterTime();
  return swift_storeEnumTagMultiPayload();
}

uint64_t SessionSummary.init(id:startDate:endDate:maxDepth:temperatureRange:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10 = *a4;
  char v11 = *((unsigned char *)a4 + 8);
  uint64_t v22 = a5[1];
  uint64_t v23 = *a5;
  char v21 = *((unsigned char *)a5 + 16);
  uint64_t v12 = (int *)type metadata accessor for SessionSummary();
  uint64_t v13 = (void *)(a6 + v12[9]);
  uint64_t v14 = sub_24CAE57A0();
  *uint64_t v13 = 0;
  v13[1] = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(a6, a1, v14);
  uint64_t v15 = a6 + v12[5];
  uint64_t v16 = sub_24CAE5730();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32);
  v17(v15, a2, v16);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v17)(a6 + v12[6], a3, v16);
  uint64_t v19 = a6 + v12[7];
  *(void *)uint64_t v19 = v10;
  *(unsigned char *)(v19 + 8) = v11;
  uint64_t v20 = a6 + v12[8];
  *(void *)uint64_t v20 = v23;
  *(void *)(v20 + 8) = v22;
  *(unsigned char *)(v20 + 16) = v21;
  return result;
}

unint64_t sub_24CAC0BA4(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7461447472617473;
      break;
    case 2:
      unint64_t result = 0x65746144646E65;
      break;
    case 3:
      unint64_t result = 0x687470654478616DLL;
      break;
    case 4:
    case 5:
      return result;
    default:
      unint64_t result = 25705;
      break;
  }
  return result;
}

unint64_t sub_24CAC0C68()
{
  return sub_24CAC0BA4(*v0);
}

uint64_t sub_24CAC0C70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CAC3894(a1, a2);
  *a3 = result;
  return result;
}

void sub_24CAC0C98(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_24CAC0CA4(uint64_t a1)
{
  unint64_t v2 = sub_24CAC1030();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAC0CE0(uint64_t a1)
{
  unint64_t v2 = sub_24CAC1030();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SessionSummary.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B080);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CAC1030();
  sub_24CAE6280();
  LOBYTE(v15) = 0;
  sub_24CAE57A0();
  sub_24CAC2BB0(&qword_26980B090, MEMORY[0x263F07508]);
  sub_24CAE6180();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for SessionSummary();
    LOBYTE(v15) = 1;
    sub_24CAE5730();
    sub_24CAC2BB0(&qword_26980B098, MEMORY[0x263F07490]);
    sub_24CAE6180();
    LOBYTE(v15) = 2;
    sub_24CAE6180();
    uint64_t v10 = (uint64_t *)(v3 + *(int *)(v9 + 28));
    uint64_t v11 = *v10;
    LOBYTE(v10) = *((unsigned char *)v10 + 8);
    *(void *)&long long v15 = v11;
    BYTE8(v15) = (_BYTE)v10;
    char v17 = 3;
    sub_24CAC1084();
    sub_24CAE6180();
    uint64_t v12 = (long long *)(v3 + *(int *)(v9 + 32));
    char v13 = *((unsigned char *)v12 + 16);
    long long v15 = *v12;
    char v16 = v13;
    char v17 = 4;
    sub_24CAC10D8();
    sub_24CAE6180();
    LOBYTE(v15) = 5;
    sub_24CAE6130();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_24CAC1030()
{
  unint64_t result = qword_26980B088;
  if (!qword_26980B088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B088);
  }
  return result;
}

unint64_t sub_24CAC1084()
{
  unint64_t result = qword_26980B0A0;
  if (!qword_26980B0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B0A0);
  }
  return result;
}

unint64_t sub_24CAC10D8()
{
  unint64_t result = qword_26980B0A8;
  if (!qword_26980B0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B0A8);
  }
  return result;
}

uint64_t SessionSummary.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v3 = sub_24CAE5730();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v38 = v3;
  uint64_t v39 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  id v37 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v35 - v7;
  uint64_t v9 = sub_24CAE57A0();
  uint64_t v41 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v42 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B0B0);
  uint64_t v40 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for SessionSummary();
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  char v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v17 = &v16[*(int *)(v14 + 36)];
  *(void *)char v17 = 0;
  *((void *)v17 + 1) = 0;
  os_log_type_t v45 = v17;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CAC1030();
  uint64_t v43 = v12;
  uint64_t v18 = (uint64_t)v46;
  sub_24CAE6270();
  if (v18)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = v41;
    uint64_t v46 = a1;
    LOBYTE(v47) = 0;
    sub_24CAC2BB0(&qword_26980B0B8, MEMORY[0x263F07508]);
    sub_24CAE6100();
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v42, v9);
    LOBYTE(v47) = 1;
    sub_24CAC2BB0(&qword_26980B0C0, MEMORY[0x263F07490]);
    uint64_t v20 = v38;
    sub_24CAE6100();
    uint64_t v42 = (char *)v13;
    char v21 = &v16[*(int *)(v13 + 20)];
    uint64_t v22 = v20;
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
    v23(v21, v8, v20);
    LOBYTE(v47) = 2;
    uint64_t v24 = v37;
    uint64_t v35 = 0;
    sub_24CAE6100();
    uint64_t v25 = v42;
    v23(&v16[*((int *)v42 + 6)], v24, v22);
    char v49 = 3;
    sub_24CAC17E4();
    sub_24CAE6100();
    char v26 = BYTE8(v47);
    uint64_t v27 = &v16[*((int *)v25 + 7)];
    *(void *)uint64_t v27 = v47;
    v27[8] = v26;
    char v49 = 4;
    sub_24CAC1838();
    sub_24CAE6100();
    char v28 = v48;
    uint64_t v29 = &v16[*((int *)v25 + 8)];
    *(_OWORD *)uint64_t v29 = v47;
    v29[16] = v28;
    LOBYTE(v47) = 5;
    uint64_t v30 = sub_24CAE60B0();
    uint64_t v32 = v31;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v43, v44);
    char v33 = (uint64_t *)v45;
    swift_bridgeObjectRelease();
    *char v33 = v30;
    v33[1] = v32;
    sub_24CAC188C((uint64_t)v16, v36);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v46);
    return sub_24CAC2AB0((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for SessionSummary);
  }
}

unint64_t sub_24CAC17E4()
{
  unint64_t result = qword_26980B0C8;
  if (!qword_26980B0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B0C8);
  }
  return result;
}

unint64_t sub_24CAC1838()
{
  unint64_t result = qword_26980B0D0;
  if (!qword_26980B0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B0D0);
  }
  return result;
}

uint64_t sub_24CAC188C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SessionSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CAC18F4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SessionSummary.init(from:)(a1, a2);
}

uint64_t sub_24CAC190C(void *a1)
{
  return SessionSummary.encode(to:)(a1);
}

uint64_t SessionSummary.dateInterval.getter()
{
  uint64_t v1 = sub_24CAE5730();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v11 - v6;
  uint64_t v8 = type metadata accessor for SessionSummary();
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v9(v7, v0 + *(int *)(v8 + 20), v1);
  v9(v5, v0 + *(int *)(v8 + 24), v1);
  return sub_24CAE5600();
}

double SessionSummary.underwaterDuration.getter()
{
  uint64_t v1 = sub_24CAE5730();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UnderwaterTime();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = &v7[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
  uint64_t v9 = type metadata accessor for SessionSummary();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v10(v7, v0 + *(int *)(v9 + 20), v1);
  v10(v8, v0 + *(int *)(v9 + 24), v1);
  swift_storeEnumTagMultiPayload();
  sub_24CAE5720();
  double v11 = UnderwaterTime.timeInterval(untilDate:)();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_24CAC2AB0((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for UnderwaterTime);
  return v11;
}

uint64_t SessionSummary.numberOfDivesMaybe.getter()
{
  return 0;
}

__n128 SessionSummary.with(startDate:endDate:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a3, v3, v7);
  uint64_t v8 = (int *)type metadata accessor for SessionSummary();
  uint64_t v9 = a3 + v8[5];
  uint64_t v10 = sub_24CAE5730();
  double v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  v11(v9, a1, v10);
  v11(a3 + v8[6], a2, v10);
  uint64_t v12 = (uint64_t *)(v3 + v8[7]);
  uint64_t v13 = *v12;
  LOBYTE(v12) = *((unsigned char *)v12 + 8);
  uint64_t v14 = (__n128 *)(v3 + v8[8]);
  unsigned __int8 v15 = v14[1].n128_u8[0];
  char v16 = (void *)(a3 + v8[9]);
  *char v16 = 0;
  v16[1] = 0;
  uint64_t v17 = a3 + v8[7];
  *(void *)uint64_t v17 = v13;
  *(unsigned char *)(v17 + 8) = (_BYTE)v12;
  uint64_t v18 = (__n128 *)(a3 + v8[8]);
  __n128 result = *v14;
  *uint64_t v18 = *v14;
  v18[1].n128_u8[0] = v15;
  return result;
}

uint64_t SessionSummary.with(temperatureRange:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1[1];
  uint64_t v19 = *a1;
  char v5 = *((unsigned char *)a1 + 16);
  uint64_t v6 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, v2, v6);
  uint64_t v7 = (int *)type metadata accessor for SessionSummary();
  uint64_t v8 = v7[5];
  uint64_t v9 = v2 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_24CAE5730();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  v12(v10, v9, v11);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v12)(a2 + v7[6], v2 + v7[6], v11);
  uint64_t v14 = (uint64_t *)(v2 + v7[7]);
  uint64_t v15 = *v14;
  LOBYTE(v14) = *((unsigned char *)v14 + 8);
  char v16 = (void *)(a2 + v7[9]);
  *char v16 = 0;
  v16[1] = 0;
  uint64_t v17 = a2 + v7[7];
  *(void *)uint64_t v17 = v15;
  *(unsigned char *)(v17 + 8) = (_BYTE)v14;
  uint64_t v18 = a2 + v7[8];
  *(void *)uint64_t v18 = v19;
  *(void *)(v18 + 8) = v4;
  *(unsigned char *)(v18 + 16) = v5;
  return result;
}

uint64_t _s9DepthCore14SessionSummaryV2id10Foundation4UUIDVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24CAE57A0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_24CAC1F14(uint64_t a1)
{
  uint64_t v3 = sub_24CAE5730();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v8((char *)&v11 - v9, v1 + *(int *)(a1 + 20), v3);
  v8(v7, v1 + *(int *)(a1 + 24), v3);
  return sub_24CAE5600();
}

uint64_t sub_24CAC2038@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(v2 + *(int *)(result + 28));
  uint64_t v4 = *v3;
  LOBYTE(v3) = *((unsigned char *)v3 + 8);
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = (_BYTE)v3;
  return result;
}

__n128 sub_24CAC2054@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = (__n128 *)(v2 + *(int *)(a1 + 32));
  unsigned __int8 v4 = v3[1].n128_u8[0];
  __n128 result = *v3;
  *a2 = *v3;
  a2[1].n128_u8[0] = v4;
  return result;
}

double sub_24CAC2070(uint64_t a1)
{
  uint64_t v3 = sub_24CAE5730();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for UnderwaterTime();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = &v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v11(v9, v1 + *(int *)(a1 + 20), v3);
  v11(v10, v1 + *(int *)(a1 + 24), v3);
  swift_storeEnumTagMultiPayload();
  sub_24CAE5720();
  double v12 = UnderwaterTime.timeInterval(untilDate:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_24CAC2AB0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for UnderwaterTime);
  return v12;
}

uint64_t sub_24CAC2234(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 36));
  swift_bridgeObjectRetain();
  return v2;
}

double static SessionSummary.previewSummary.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (int *)type metadata accessor for SessionSummary();
  sub_24CAE5720();
  sub_24CAE56D0();
  sub_24CAE5790();
  uint64_t v3 = (void *)(a1 + v2[9]);
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = a1 + v2[7];
  *(void *)uint64_t v4 = 0x40268E219652BD3DLL;
  *(unsigned char *)(v4 + 8) = 1;
  uint64_t v5 = a1 + v2[8];
  double result = 11.6666667;
  *(_OWORD *)uint64_t v5 = xmmword_24CAE82D0;
  *(unsigned char *)(v5 + 16) = 1;
  return result;
}

double static SessionSummary.previewSummaryMaxDepth.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (int *)type metadata accessor for SessionSummary();
  sub_24CAE5720();
  sub_24CAE56D0();
  sub_24CAE5790();
  uint64_t v3 = (void *)(a1 + v2[9]);
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = a1 + v2[7];
  *(void *)uint64_t v4 = 2;
  *(unsigned char *)(v4 + 8) = 3;
  uint64_t v5 = a1 + v2[8];
  double result = 23.0;
  *(_OWORD *)uint64_t v5 = xmmword_24CAE82E0;
  *(unsigned char *)(v5 + 16) = 1;
  return result;
}

uint64_t static SessionSummary.previewSummaryOldDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF38);
  MEMORY[0x270FA5388](v1 - 8);
  id v61 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AF40);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_24CAE5660();
  uint64_t v63 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24CAE5800();
  uint64_t v57 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A998);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v53 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v58 = (char *)&v43 - v15;
  uint64_t v16 = sub_24CAE5730();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v44 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v43 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v59 = (char *)&v43 - v23;
  sub_24CAE57E0();
  unint64_t v52 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v52(v5, 1, 1, v8);
  uint64_t v24 = sub_24CAE5810();
  uint64_t v25 = *(void *)(v24 - 8);
  unint64_t v50 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 56);
  uint64_t v51 = v24;
  uint64_t v49 = v25 + 56;
  v50(v61, 1, 1);
  uint64_t v56 = v5;
  sub_24CAE5650();
  sub_24CAE5720();
  char v26 = v58;
  sub_24CAE57C0();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v22, v16);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v63 + 8);
  uint64_t v54 = v7;
  v63 += 8;
  char v48 = v27;
  v27(v7, v60);
  char v28 = *(void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v29 = v57;
  uint64_t v55 = v9 + 8;
  long long v47 = v28;
  ((void (*)(char *))v28)(v11);
  uint64_t v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  uint64_t v62 = v16;
  uint64_t v46 = v30;
  uint64_t result = v30(v26, 1, v16);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v32(v59, v26, v62);
    sub_24CAE57E0();
    v52(v56, 1, 1, v29);
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v50)(v61, 1, 1, v51);
    char v33 = v54;
    sub_24CAE5650();
    uint64_t v34 = v53;
    sub_24CAE57C0();
    v48(v33, v60);
    v47(v11, v29);
    uint64_t result = v46(v34, 1, v62);
    if (result != 1)
    {
      uint64_t v35 = v44;
      uint64_t v36 = v34;
      uint64_t v37 = v62;
      v32(v44, v36, v62);
      uint64_t v38 = v45;
      sub_24CAE5790();
      uint64_t v39 = (int *)type metadata accessor for SessionSummary();
      uint64_t v40 = (void *)(v38 + v39[9]);
      void *v40 = 0;
      v40[1] = 0;
      v32((char *)(v38 + v39[5]), v59, v37);
      uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v32)(v38 + v39[6], v35, v37);
      uint64_t v41 = v38 + v39[7];
      *(void *)uint64_t v41 = 0x4024000000000000;
      *(unsigned char *)(v41 + 8) = 1;
      uint64_t v42 = v38 + v39[8];
      *(_OWORD *)uint64_t v42 = xmmword_24CAE82E0;
      *(unsigned char *)(v42 + 16) = 1;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24CAC2AB0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24CAC2B10()
{
  return sub_24CAC2BB0(&qword_26980B0D8, MEMORY[0x263F07508]);
}

uint64_t sub_24CAC2B58(uint64_t a1)
{
  uint64_t result = sub_24CAC2BB0(&qword_26980B0E0, (void (*)(uint64_t))type metadata accessor for SessionSummary);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24CAC2BB0(unint64_t *a1, void (*a2)(uint64_t))
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

char *initializeBufferWithCopyOfBuffer for SessionSummary(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24CAE57A0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = sub_24CAE5730();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    v12(&a1[a3[6]], &a2[a3[6]], v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = a3[8];
    uint64_t v15 = &a1[v13];
    uint64_t v16 = &a2[v13];
    *(void *)uint64_t v15 = *(void *)v16;
    v15[8] = v16[8];
    uint64_t v17 = &a1[v14];
    uint64_t v18 = &a2[v14];
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    v17[16] = v18[16];
    uint64_t v19 = a3[9];
    uint64_t v20 = &a1[v19];
    uint64_t v21 = &a2[v19];
    uint64_t v22 = *((void *)v21 + 1);
    *(void *)uint64_t v20 = *(void *)v21;
    *((void *)v20 + 1) = v22;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for SessionSummary(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_24CAE5730();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(a1 + *(int *)(a2 + 24), v6);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SessionSummary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24CAE5730();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(void *)uint64_t v14 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  uint64_t v16 = a1 + v13;
  uint64_t v17 = a2 + v13;
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *(unsigned char *)(v16 + 16) = *(unsigned char *)(v17 + 16);
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SessionSummary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24CAE5730();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  char v15 = *(unsigned char *)(v14 + 8);
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = v15;
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  char v19 = *(unsigned char *)(v18 + 16);
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  *(unsigned char *)(v17 + 16) = v19;
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for SessionSummary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24CAE5730();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(void *)uint64_t v14 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  uint64_t v16 = a1 + v13;
  uint64_t v17 = a2 + v13;
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *(unsigned char *)(v16 + 16) = *(unsigned char *)(v17 + 16);
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for SessionSummary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24CAE5730();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(void *)uint64_t v14 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  uint64_t v16 = a1 + v13;
  uint64_t v17 = a2 + v13;
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *(unsigned char *)(v16 + 16) = *(unsigned char *)(v17 + 16);
  uint64_t v18 = a3[9];
  char v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *char v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CAC3354);
}

uint64_t sub_24CAC3354(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CAE57A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_24CAE5730();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 36) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  int v15 = v14 - 1;
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for SessionSummary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CAC348C);
}

uint64_t sub_24CAC348C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_24CAE57A0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_24CAE5730();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 36) + 8) = a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_24CAC35A0()
{
  uint64_t result = sub_24CAE57A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24CAE5730();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SessionSummary.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAC3754);
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

ValueMetadata *type metadata accessor for SessionSummary.CodingKeys()
{
  return &type metadata for SessionSummary.CodingKeys;
}

unint64_t sub_24CAC3790()
{
  unint64_t result = qword_26980B0F8;
  if (!qword_26980B0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B0F8);
  }
  return result;
}

unint64_t sub_24CAC37E8()
{
  unint64_t result = qword_26980B100;
  if (!qword_26980B100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B100);
  }
  return result;
}

unint64_t sub_24CAC3840()
{
  unint64_t result = qword_26980B108;
  if (!qword_26980B108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B108);
  }
  return result;
}

uint64_t sub_24CAC3894(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7461447472617473 && a2 == 0xE900000000000065 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65746144646E65 && a2 == 0xE700000000000000 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x687470654478616DLL && a2 == 0xE800000000000000 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024CAEBD90 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024CAEBDB0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

unint64_t sub_24CAC3ADC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26980B240);
  unint64_t v2 = (void *)sub_24CAE6050();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unsigned int v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_24CAA4890(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_24CAC3BF8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26980B230);
  unint64_t v2 = (void *)sub_24CAE6050();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unsigned int v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_24CAA4890(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
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

void static DepthSettings.currentDevice.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

DepthCore::DepthValue __swiftcall DepthSettings.nominalDepthLimit(inUnit:)(DepthCore::DepthUnit inUnit)
{
  uint64_t v3 = v1;
  if (*(unsigned char *)inUnit)
  {
    if (*v2)
    {
      if (qword_26980A758 != -1) {
        swift_once();
      }
      unsigned int v4 = (long long *)((char *)&xmmword_269812B00 + 8);
    }
    else
    {
      if (qword_26980A760 != -1) {
        swift_once();
      }
      unsigned int v4 = (long long *)((char *)&xmmword_269812B10 + 8);
    }
  }
  else if (*v2)
  {
    if (qword_26980A758 != -1) {
      swift_once();
    }
    unsigned int v4 = &xmmword_269812B00;
  }
  else
  {
    if (qword_26980A760 != -1) {
      swift_once();
    }
    unsigned int v4 = &xmmword_269812B10;
  }
  *(DepthCore::DepthValue *)&result.canonicalValue = *(DepthCore::DepthValue *)v4;
  void *v3 = *(void *)v4;
  return result;
}

double static DepthLimit.depthLimit(forDeviceType:)@<D0>(unsigned char *a1@<X0>, void *a2@<X8>)
{
  if (*a1)
  {
    if (qword_26980A760 != -1) {
      swift_once();
    }
    uint64_t v3 = &xmmword_269812B10;
  }
  else
  {
    if (qword_26980A758 != -1) {
      swift_once();
    }
    uint64_t v3 = &xmmword_269812B00;
  }
  double result = *(double *)v3;
  uint64_t v5 = *((void *)v3 + 1);
  *a2 = *(void *)v3;
  a2[1] = v5;
  return result;
}

void static DepthLimit.depthLimit(forDeviceIdentifier:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  static DeviceType.deviceType(forDeviceIdentifier:)(a1, a2, &v6);
  if (v6 == 2)
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(unsigned char *)(a3 + 16) = 1;
  }
  else
  {
    if (v6)
    {
      if (qword_26980A760 != -1) {
        swift_once();
      }
      unsigned int v4 = &xmmword_269812B10;
    }
    else
    {
      if (qword_26980A758 != -1) {
        swift_once();
      }
      unsigned int v4 = &xmmword_269812B00;
    }
    uint64_t v5 = *((void *)v4 + 1);
    *(void *)a3 = *(void *)v4;
    *(void *)(a3 + 8) = v5;
    *(unsigned char *)(a3 + 16) = 0;
  }
}

double DepthLimit.feet.getter@<D0>(void *a1@<X8>)
{
  double result = *v1;
  *a1 = *(void *)v1;
  return result;
}

double DepthLimit.meters.getter@<D0>(double *a1@<X8>)
{
  double result = *(double *)(v1 + 8);
  *a1 = result;
  return result;
}

double sub_24CAC3FCC()
{
  double result = 39.624;
  xmmword_269812B00 = xmmword_24CAE8550;
  return result;
}

double sub_24CAC3FE0()
{
  double result = 6.096;
  xmmword_269812B10 = xmmword_24CAE8560;
  return result;
}

void static DeviceType.deviceType(forDeviceIdentifier:)(uint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X8>)
{
  if (qword_26980A768 != -1) {
    swift_once();
  }
  swift_beginAccess();
  char v6 = off_26980B110;
  if (*((void *)off_26980B110 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_24CAA4890(a1, a2);
    if (v8)
    {
      char v9 = *(unsigned char *)(v6[7] + v7);
      swift_endAccess();
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  if (qword_26980A7C0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24CAE5860();
  __swift_project_value_buffer(v10, (uint64_t)qword_26980B960);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_24CAE5840();
  os_log_type_t v12 = sub_24CAE5D90();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    v15[0] = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_bridgeObjectRetain();
    sub_24CAA4228(a1, a2, v15);
    sub_24CAE5ED0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CA9E000, v11, v12, "DeviceType: Device type cache miss for: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253308900](v14, -1, -1);
    MEMORY[0x253308900](v13, -1, -1);

    char v9 = 2;
  }
  else
  {

    char v9 = 2;
    swift_bridgeObjectRelease_n();
  }
LABEL_12:
  *a3 = v9;
}

void *sub_24CAC4250()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980B228);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CAE8570;
  *(void *)(inited + 32) = 0x312C366863746157;
  *(void *)(inited + 40) = 0xE900000000000038;
  *(unsigned char *)(inited + 48) = 0;
  *(void *)(inited + 56) = 0x352C376863746157;
  *(void *)(inited + 64) = 0xE800000000000000;
  *(unsigned char *)(inited + 72) = 0;
  *(void *)(inited + 80) = 0x382C376863746157;
  *(void *)(inited + 88) = 0xE800000000000000;
  *(unsigned char *)(inited + 96) = 1;
  *(void *)(inited + 104) = 0x392C376863746157;
  *(void *)(inited + 112) = 0xE800000000000000;
  *(unsigned char *)(inited + 120) = 1;
  *(void *)(inited + 128) = 0x312C376863746157;
  *(void *)(inited + 136) = 0xE900000000000030;
  *(unsigned char *)(inited + 144) = 1;
  *(void *)(inited + 152) = 0x312C376863746157;
  *(void *)(inited + 160) = 0xE900000000000031;
  *(unsigned char *)(inited + 168) = 1;
  double result = (void *)sub_24CAC3BF8(inited);
  off_26980B110 = result;
  return result;
}

BOOL static DeviceType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DeviceType.hash(into:)()
{
  return sub_24CAE6250();
}

uint64_t DeviceType.hashValue.getter()
{
  return sub_24CAE6260();
}

uint64_t DepthSettings.currentDeviceIsUltra.getter()
{
  return *v0;
}

double DepthSettings.significantDepth.getter@<D0>(double *a1@<X8>)
{
  double result = *(double *)(v1 + 8);
  *a1 = result;
  return result;
}

double DepthSettings.significantDepth.setter(double *a1)
{
  double result = *a1;
  *(double *)(v1 + 8) = *a1;
  return result;
}

uint64_t (*DepthSettings.significantDepth.modify())()
{
  return nullsub_1;
}

double DepthSettings.currentDeviceDepthLimit.getter@<D0>(uint64_t a1@<X8>)
{
  if (*v1 == 1)
  {
    if (qword_26980A758 != -1) {
      swift_once();
    }
    uint64_t v3 = &xmmword_269812B00;
  }
  else
  {
    if (qword_26980A760 != -1) {
      swift_once();
    }
    uint64_t v3 = &xmmword_269812B10;
  }
  double result = *((double *)v3 + 1);
  *(void *)a1 = *(void *)v3;
  *(double *)(a1 + 8) = result;
  return result;
}

void DepthSettings.currentDeviceLimit.getter(double *a1@<X8>)
{
  double v2 = 50.0;
  if (!*v1) {
    double v2 = 10.0;
  }
  *a1 = v2;
}

double DepthSettings.deepDiveTimeThreshold.getter()
{
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v1 = (void *)sub_24CAE5AE0();
  id v2 = objc_msgSend(v0, sel_valueForKey_, v1);

  if (v2)
  {
    sub_24CAE5F00();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_24CAC5B34((uint64_t)v17, (uint64_t)v18);
  if (v18[3])
  {
    sub_24CAC5BFC();
    if (swift_dynamicCast())
    {
      if (qword_26980A7C0 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_24CAE5860();
      __swift_project_value_buffer(v3, (uint64_t)qword_26980B960);
      unsigned int v4 = v16;
      uint64_t v5 = sub_24CAE5840();
      os_log_type_t v6 = sub_24CAE5DA0();
      if (os_log_type_enabled(v5, v6))
      {
        unint64_t v7 = (uint8_t *)swift_slowAlloc();
        char v8 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v7 = 138412290;
        v18[0] = v4;
        char v9 = v4;
        sub_24CAE5ED0();
        void *v8 = v4;

        _os_log_impl(&dword_24CA9E000, v5, v6, "Using custom value for deepDiveTimeThreshold=%@", v7, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26980B148);
        swift_arrayDestroy();
        MEMORY[0x253308900](v8, -1, -1);
        MEMORY[0x253308900](v7, -1, -1);
      }
      else
      {

        uint64_t v5 = v4;
      }

      [v4 doubleValue];
      double v13 = v14;
      goto LABEL_18;
    }
  }
  else
  {
    sub_24CAC5B9C((uint64_t)v18);
  }
  if (qword_26980A7C0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24CAE5860();
  __swift_project_value_buffer(v10, (uint64_t)qword_26980B960);
  unsigned int v4 = sub_24CAE5840();
  os_log_type_t v11 = sub_24CAE5DA0();
  if (os_log_type_enabled(v4, v11))
  {
    os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v12 = 0;
    _os_log_impl(&dword_24CA9E000, v4, v11, "Returning default value", v12, 2u);
    MEMORY[0x253308900](v12, -1, -1);
  }
  double v13 = 180.0;
LABEL_18:

  return v13;
}

double DepthSettings.sessionStopDelay.getter()
{
  return *(double *)(v0 + 16);
}

void DepthSettings.sessionStopDelay.setter(double a1)
{
  *(double *)(v1 + 16) = a1;
}

uint64_t (*DepthSettings.sessionStopDelay.modify())()
{
  return nullsub_1;
}

double DepthSettings.sessionStopDelayLong.getter()
{
  return *(double *)(v0 + 24);
}

void DepthSettings.sessionStopDelayLong.setter(double a1)
{
  *(double *)(v1 + 24) = a1;
}

uint64_t (*DepthSettings.sessionStopDelayLong.modify())()
{
  return nullsub_1;
}

double DepthSettings.sessionRecoveryTimeout.getter()
{
  return *(double *)(v0 + 32);
}

void DepthSettings.sessionRecoveryTimeout.setter(double a1)
{
  *(double *)(v1 + 32) = a1;
}

uint64_t (*DepthSettings.sessionRecoveryTimeout.modify())()
{
  return nullsub_1;
}

double DepthSettings.shortDiveUnderwaterTimeThreshold.getter()
{
  return *(double *)(v0 + 40);
}

void DepthSettings.shortDiveUnderwaterTimeThreshold.setter(double a1)
{
  *(double *)(v1 + 40) = a1;
}

uint64_t (*DepthSettings.shortDiveUnderwaterTimeThreshold.modify())()
{
  return nullsub_1;
}

double DepthSettings.maxDepthMarkerMiniumSeparation.getter@<D0>(double *a1@<X8>)
{
  double result = *(double *)(v1 + 48);
  *a1 = result;
  return result;
}

double DepthSettings.maxDepthMarkerMiniumSeparation.setter(double *a1)
{
  double result = *a1;
  *(double *)(v1 + 48) = *a1;
  return result;
}

uint64_t (*DepthSettings.maxDepthMarkerMiniumSeparation.modify())()
{
  return nullsub_1;
}

double DepthSettings.maxDepthAlertUserDismissSuppressionTimeout.getter()
{
  return *(double *)(v0 + 56);
}

void DepthSettings.maxDepthAlertUserDismissSuppressionTimeout.setter(double a1)
{
  *(double *)(v1 + 56) = a1;
}

uint64_t (*DepthSettings.maxDepthAlertUserDismissSuppressionTimeout.modify())()
{
  return nullsub_1;
}

double DepthSettings.shortDiveCompletionTimeout.getter()
{
  return *(double *)(v0 + 64);
}

void DepthSettings.shortDiveCompletionTimeout.setter(double a1)
{
  *(double *)(v1 + 64) = a1;
}

uint64_t (*DepthSettings.shortDiveCompletionTimeout.modify())()
{
  return nullsub_1;
}

uint64_t DepthSettings.provider.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v1 + 88);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  unsigned __int8 v5 = *(unsigned char *)(v1 + 96);
  *(unsigned char *)(a1 + 24) = v5;
  return sub_24CAA5CA0(v2, v3, v4, v5);
}

__n128 DepthSettings.provider.setter(__n128 *a1)
{
  __n128 v5 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unsigned __int8 v3 = a1[1].n128_u8[8];
  sub_24CAA5D50(*(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(unsigned char *)(v1 + 96));
  __n128 result = v5;
  *(__n128 *)(v1 + 72) = v5;
  *(void *)(v1 + 88) = v2;
  *(unsigned char *)(v1 + 96) = v3;
  return result;
}

uint64_t (*DepthSettings.provider.modify())()
{
  return nullsub_1;
}

double DepthSettings.init(currentDeviceIsUltra:)@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(a2 + 8) = _Q0;
  *(_OWORD *)(a2 + 24) = xmmword_24CAE8580;
  *(_OWORD *)(a2 + 40) = xmmword_24CAE8590;
  double result = 120.0;
  *(_OWORD *)(a2 + 56) = xmmword_24CAE85A0;
  *(void *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = 0;
  *(void *)(a2 + 72) = 0;
  *(unsigned char *)(a2 + 96) = 0x80;
  *(unsigned char *)a2 = a1;
  return result;
}

double static DepthProviderSetting.summaryTest.getter@<D0>(uint64_t a1@<X8>)
{
  double result = 10.668;
  *(_OWORD *)a1 = xmmword_24CAE85B0;
  *(void *)(a1 + 16) = 0x403E000000000000;
  *(unsigned char *)(a1 + 24) = 64;
  return result;
}

double static DepthProviderSetting.fullRangeDemo.getter@<D0>(uint64_t a1@<X8>)
{
  double result = 48.768;
  *(_OWORD *)a1 = xmmword_24CAE85C0;
  *(void *)(a1 + 16) = 0x402E000000000000;
  *(unsigned char *)(a1 + 24) = 64;
  return result;
}

double static DepthProviderSetting.repeatingFullRangeDemo.getter@<D0>(uint64_t a1@<X8>)
{
  double result = 7.0104;
  *(_OWORD *)a1 = xmmword_24CAE85D0;
  *(void *)(a1 + 16) = 0x402E000000000000;
  *(unsigned char *)(a1 + 24) = 65;
  return result;
}

double static DepthProviderSetting.recoveryRangeDemo.getter@<D0>(uint64_t a1@<X8>)
{
  double result = 19.2024;
  *(_OWORD *)a1 = xmmword_24CAE85E0;
  *(void *)(a1 + 16) = 0x3FF0000000000000;
  *(unsigned char *)(a1 + 24) = 64;
  return result;
}

uint64_t static DepthProviderSetting.montereyDiveReplay.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  long long v2 = xmmword_26980B118;
  uint64_t v3 = qword_26980B128;
  *(_OWORD *)a1 = xmmword_26980B118;
  *(void *)(a1 + 16) = v3;
  unsigned __int8 v4 = byte_26980B130;
  *(unsigned char *)(a1 + 24) = byte_26980B130;
  return sub_24CAA5CA0(v2, *((uint64_t *)&v2 + 1), v3, v4);
}

uint64_t static DepthProviderSetting.montereyDiveReplay.setter(uint64_t a1)
{
  long long v7 = *(_OWORD *)a1;
  uint64_t v1 = *(void *)(a1 + 16);
  char v2 = *(unsigned char *)(a1 + 24);
  swift_beginAccess();
  long long v3 = xmmword_26980B118;
  uint64_t v4 = qword_26980B128;
  xmmword_26980B118 = v7;
  qword_26980B128 = v1;
  unsigned __int8 v5 = byte_26980B130;
  byte_26980B130 = v2;
  return sub_24CAA5D50(v3, *((uint64_t *)&v3 + 1), v4, v5);
}

uint64_t (*static DepthProviderSetting.montereyDiveReplay.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_24CAC4C00(char a1)
{
  return *(void *)&aSensor_1[8 * a1];
}

uint64_t sub_24CAC4C20(char a1)
{
  return *(void *)&aMaxdepthreplay[8 * a1];
}

uint64_t sub_24CAC4C40()
{
  return sub_24CAC4C00(*v0);
}

uint64_t sub_24CAC4C48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CAC6BA8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CAC4C70(uint64_t a1)
{
  unint64_t v2 = sub_24CAC5C3C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAC4CAC(uint64_t a1)
{
  unint64_t v2 = sub_24CAC5C3C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CAC4CE8()
{
  return sub_24CAC4C20(*v0);
}

uint64_t sub_24CAC4CF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CAC6CF0(a1, a2);
  *a3 = result;
  return result;
}

void sub_24CAC4D18(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24CAC4D24(uint64_t a1)
{
  unint64_t v2 = sub_24CAC5C90();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAC4D60(uint64_t a1)
{
  unint64_t v2 = sub_24CAC5C90();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CAC4DA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CAC6EA0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24CAC4DCC(uint64_t a1)
{
  unint64_t v2 = sub_24CAC5CE4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAC4E08(uint64_t a1)
{
  unint64_t v2 = sub_24CAC5CE4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CAC4E44(uint64_t a1)
{
  unint64_t v2 = sub_24CAC5D38();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAC4E80(uint64_t a1)
{
  unint64_t v2 = sub_24CAC5D38();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DepthProviderSetting.encode(to:)(void *a1)
{
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B150);
  uint64_t v24 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v27 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B158);
  uint64_t v26 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B160);
  uint64_t v25 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B168);
  uint64_t v31 = *(void *)(v10 - 8);
  uint64_t v32 = v10;
  MEMORY[0x270FA5388](v10);
  os_log_type_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *v1;
  uint64_t v29 = v1[1];
  uint64_t v30 = v13;
  uint64_t v14 = a1[3];
  int v15 = a1;
  unsigned int v16 = *((unsigned __int8 *)v1 + 24);
  __swift_project_boxed_opaque_existential_1(v15, v14);
  sub_24CAC5C3C();
  sub_24CAE6280();
  if (!(v16 >> 6))
  {
    char v35 = 1;
    sub_24CAC5CE4();
    uint64_t v18 = v32;
    sub_24CAE6120();
    sub_24CAE6150();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v12, v18);
  }
  if (v16 >> 6 == 1)
  {
    char v41 = 2;
    sub_24CAC5C90();
    uint64_t v17 = v27;
    uint64_t v18 = v32;
    sub_24CAE6120();
    uint64_t v40 = v30;
    char v39 = 0;
    sub_24CABCD84();
    uint64_t v19 = v28;
    uint64_t v20 = v33;
    sub_24CAE6180();
    if (!v20)
    {
      char v38 = 1;
      sub_24CAE6170();
      char v37 = 2;
      sub_24CAE6170();
      char v36 = 3;
      sub_24CAE6160();
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v12, v18);
  }
  char v34 = 0;
  sub_24CAC5D38();
  uint64_t v22 = v32;
  sub_24CAE6120();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v12, v22);
}

uint64_t DepthProviderSetting.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B198);
  uint64_t v41 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v46 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B1A0);
  uint64_t v40 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B1A8);
  uint64_t v45 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26980B1B0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  os_log_type_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  long long v47 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_24CAC5C3C();
  uint64_t v14 = v48;
  sub_24CAE6270();
  if (!v14)
  {
    uint64_t v39 = v6;
    uint64_t v16 = v45;
    int v15 = v46;
    uint64_t v48 = v10;
    uint64_t v17 = sub_24CAE6110();
    if (*(void *)(v17 + 16) == 1)
    {
      int v18 = *(unsigned __int8 *)(v17 + 32);
      if (*(unsigned char *)(v17 + 32))
      {
        uint64_t v45 = v17;
        if (v18 == 1)
        {
          char v51 = 1;
          sub_24CAC5CE4();
          sub_24CAE6090();
          uint64_t v19 = v44;
          uint64_t v20 = v42;
          uint64_t v27 = sub_24CAE60D0();
          uint64_t v29 = v28;
          (*(void (**)(char *, uint64_t))(v40 + 8))(v5, v20);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v48 + 8))(v12, v9);
          char v30 = 0;
          uint64_t v31 = 0;
        }
        else
        {
          char v56 = 2;
          sub_24CAC5C90();
          sub_24CAE6090();
          uint64_t v19 = v44;
          char v55 = 0;
          sub_24CABCDD8();
          uint64_t v25 = v43;
          sub_24CAE6100();
          uint64_t v26 = v48;
          uint64_t v42 = v49;
          char v54 = 1;
          sub_24CAE60F0();
          uint64_t v32 = v41;
          uint64_t v34 = v33;
          char v53 = 2;
          sub_24CAE60F0();
          uint64_t v31 = v35;
          char v52 = 3;
          char v36 = sub_24CAE60E0();
          uint64_t v37 = v25;
          LOBYTE(v25) = v36;
          (*(void (**)(char *, uint64_t))(v32 + 8))(v15, v37);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v9);
          uint64_t v29 = v34;
          char v30 = v25 & 1 | 0x40;
          uint64_t v27 = v42;
        }
      }
      else
      {
        char v50 = 0;
        sub_24CAC5D38();
        sub_24CAE6090();
        (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v39);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v48 + 8))(v12, v9);
        uint64_t v27 = 0;
        uint64_t v29 = 0;
        char v30 = 0x80;
        uint64_t v31 = 0;
        uint64_t v19 = v44;
      }
      *(void *)uint64_t v19 = v27;
      *(void *)(v19 + 8) = v29;
      *(void *)(v19 + 16) = v31;
      *(unsigned char *)(v19 + 24) = v30;
    }
    else
    {
      uint64_t v21 = sub_24CAE5F90();
      swift_allocError();
      uint64_t v23 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26980AC48);
      *uint64_t v23 = &type metadata for DepthProviderSetting;
      sub_24CAE60A0();
      sub_24CAE5F80();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCB0], v21);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v12, v9);
    }
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
}

uint64_t sub_24CAC5A4C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DepthProviderSetting.init(from:)(a1, a2);
}

uint64_t sub_24CAC5A64(void *a1)
{
  return DepthProviderSetting.encode(to:)(a1);
}

void sub_24CAC5A7C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_24CAE5ED0();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_24CAC5B34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CAC5B9C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24CAC5BFC()
{
  unint64_t result = qword_26980B140;
  if (!qword_26980B140)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26980B140);
  }
  return result;
}

unint64_t sub_24CAC5C3C()
{
  unint64_t result = qword_26980B170;
  if (!qword_26980B170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B170);
  }
  return result;
}

unint64_t sub_24CAC5C90()
{
  unint64_t result = qword_26980B178;
  if (!qword_26980B178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B178);
  }
  return result;
}

unint64_t sub_24CAC5CE4()
{
  unint64_t result = qword_26980B188;
  if (!qword_26980B188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B188);
  }
  return result;
}

unint64_t sub_24CAC5D38()
{
  unint64_t result = qword_26980B190;
  if (!qword_26980B190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B190);
  }
  return result;
}

unint64_t sub_24CAC5D90()
{
  unint64_t result = qword_26980B1C8;
  if (!qword_26980B1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B1C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthLimit()
{
  return &type metadata for DepthLimit;
}

unsigned char *storeEnumTagSinglePayload for DeviceType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAC5EC0);
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

ValueMetadata *type metadata accessor for DeviceType()
{
  return &type metadata for DeviceType;
}

uint64_t destroy for DepthSettings(uint64_t a1)
{
  return sub_24CAA5D50(*(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(unsigned char *)(a1 + 96));
}

uint64_t initializeWithCopy for DepthSettings(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v3 = *(void *)(a2 + 72);
  uint64_t v4 = *(void *)(a2 + 80);
  uint64_t v5 = *(void *)(a2 + 88);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 96);
  sub_24CAA5CA0(v3, v4, v5, v6);
  *(void *)(a1 + 72) = v3;
  *(void *)(a1 + 80) = v4;
  *(void *)(a1 + 88) = v5;
  *(unsigned char *)(a1 + 96) = v6;
  return a1;
}

uint64_t assignWithCopy for DepthSettings(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v3 = *(void *)(a2 + 72);
  uint64_t v4 = *(void *)(a2 + 80);
  uint64_t v5 = *(void *)(a2 + 88);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 96);
  sub_24CAA5CA0(v3, v4, v5, v6);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 88);
  *(void *)(a1 + 72) = v3;
  *(void *)(a1 + 80) = v4;
  *(void *)(a1 + 88) = v5;
  unsigned __int8 v10 = *(unsigned char *)(a1 + 96);
  *(unsigned char *)(a1 + 96) = v6;
  sub_24CAA5D50(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy97_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(unsigned char *)(a1 + 96) = *((unsigned char *)a2 + 96);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for DepthSettings(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v3 = *(void *)(a2 + 88);
  char v4 = *(unsigned char *)(a2 + 96);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = v3;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 96);
  *(unsigned char *)(a1 + 96) = v4;
  sub_24CAA5D50(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DepthSettings(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[97]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DepthSettings(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 96) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 97) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 97) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthSettings()
{
  return &type metadata for DepthSettings;
}

uint64_t destroy for DepthProviderSetting(uint64_t a1)
{
  return sub_24CAA5D50(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t initializeWithCopy for DepthProviderSetting(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 24);
  sub_24CAA5CA0(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for DepthProviderSetting(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 24);
  sub_24CAA5CA0(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  unsigned __int8 v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_24CAA5D50(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DepthProviderSetting(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_24CAA5D50(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DepthProviderSetting(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 24) >> 6) & 0xFFFFFF83 | (4 * ((*(unsigned __int8 *)(a1 + 24) >> 1) & 0x1F))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for DepthProviderSetting(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = 0;
      *(unsigned char *)(result + 24) = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

uint64_t sub_24CAC63AC(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 24);
  int v2 = (char)v1;
  unsigned int v3 = v1 >> 6;
  if (v2 >= 0) {
    return v3;
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24CAC63CC(uint64_t result)
{
  *(unsigned char *)(result + 24) &= 0x3Fu;
  return result;
}

uint64_t sub_24CAC63DC(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    *(unsigned char *)(result + 24) = *(unsigned char *)(result + 24) & 1 | ((_BYTE)a2 << 6);
  }
  else
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 2;
    *(unsigned char *)(result + 24) = 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthProviderSetting()
{
  return &type metadata for DepthProviderSetting;
}

unsigned char *storeEnumTagSinglePayload for DepthProviderSetting.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAC64E8);
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

ValueMetadata *type metadata accessor for DepthProviderSetting.CodingKeys()
{
  return &type metadata for DepthProviderSetting.CodingKeys;
}

ValueMetadata *type metadata accessor for DepthProviderSetting.SensorCodingKeys()
{
  return &type metadata for DepthProviderSetting.SensorCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for DepthProviderSetting.ReplayCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CAC65CCLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthProviderSetting.ReplayCodingKeys()
{
  return &type metadata for DepthProviderSetting.ReplayCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for DepthProviderSetting.LinearRangeCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAC66D0);
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

ValueMetadata *type metadata accessor for DepthProviderSetting.LinearRangeCodingKeys()
{
  return &type metadata for DepthProviderSetting.LinearRangeCodingKeys;
}

unint64_t sub_24CAC670C()
{
  unint64_t result = qword_26980B1D0;
  if (!qword_26980B1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B1D0);
  }
  return result;
}

unint64_t sub_24CAC6764()
{
  unint64_t result = qword_26980B1D8;
  if (!qword_26980B1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B1D8);
  }
  return result;
}

unint64_t sub_24CAC67BC()
{
  unint64_t result = qword_26980B1E0;
  if (!qword_26980B1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B1E0);
  }
  return result;
}

unint64_t sub_24CAC6814()
{
  unint64_t result = qword_26980B1E8;
  if (!qword_26980B1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B1E8);
  }
  return result;
}

unint64_t sub_24CAC686C()
{
  unint64_t result = qword_26980B1F0;
  if (!qword_26980B1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B1F0);
  }
  return result;
}

unint64_t sub_24CAC68C4()
{
  unint64_t result = qword_26980B1F8;
  if (!qword_26980B1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B1F8);
  }
  return result;
}

unint64_t sub_24CAC691C()
{
  unint64_t result = qword_26980B200;
  if (!qword_26980B200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B200);
  }
  return result;
}

unint64_t sub_24CAC6974()
{
  unint64_t result = qword_26980B208;
  if (!qword_26980B208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B208);
  }
  return result;
}

unint64_t sub_24CAC69CC()
{
  unint64_t result = qword_26980B210;
  if (!qword_26980B210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B210);
  }
  return result;
}

unint64_t sub_24CAC6A24()
{
  unint64_t result = qword_26980B218;
  if (!qword_26980B218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B218);
  }
  return result;
}

unint64_t sub_24CAC6A7C()
{
  unint64_t result = qword_26980B220;
  if (!qword_26980B220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B220);
  }
  return result;
}

unint64_t sub_24CAC6AD0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980ABC0);
    int v3 = (void *)sub_24CAE6050();
    for (unint64_t i = (char *)(a1 + 33); ; i += 2)
    {
      char v5 = *(i - 1);
      char v6 = *i;
      unint64_t result = sub_24CAA4908(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v3[6] + result) = v5;
      *(unsigned char *)(v3[7] + result) = v6;
      uint64_t v9 = v3[2];
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

uint64_t sub_24CAC6BA8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726F736E6573 && a2 == 0xE600000000000000;
  if (v3 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79616C706572 && a2 == 0xE600000000000000 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x61527261656E696CLL && a2 == 0xEB0000000065676ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24CAC6CF0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x687470654478616DLL && a2 == 0xE800000000000000;
  if (v3 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x745379616C706572 && a2 == 0xEA00000000007065 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6152657461647075 && a2 == 0xEA00000000006574 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73746165706572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_24CAC6EA0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x656C69466E6F736ALL && a2 == 0xEC00000068746150)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24CAC6F38()
{
  return 0x656C69466E6F736ALL;
}

uint64_t TemperatureSettings.provider.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  unsigned __int8 v6 = *(unsigned char *)(v1 + 32);
  *(unsigned char *)(a1 + 32) = v6;
  return sub_24CAA5CB8(v2, v3, v4, v5, v6);
}

__n128 TemperatureSettings.provider.setter(__n128 *a1)
{
  __n128 v6 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  unsigned __int8 v4 = a1[2].n128_u8[0];
  sub_24CAA5D68(*(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32));
  __n128 result = v6;
  *(__n128 *)uint64_t v1 = v6;
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v3;
  *(unsigned char *)(v1 + 32) = v4;
  return result;
}

uint64_t (*TemperatureSettings.provider.modify())()
{
  return nullsub_1;
}

double TemperatureSettings.init()@<D0>(uint64_t a1@<X8>)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 32) = 0x80;
  return result;
}

double static TemperatureProvider.fullRangeDemo.getter@<D0>(uint64_t a1@<X8>)
{
  double result = 40.5555556;
  *(_OWORD *)a1 = xmmword_24CAE8BF0;
  *(_OWORD *)(a1 + 16) = xmmword_24CAE8C00;
  *(unsigned char *)(a1 + 32) = 64;
  return result;
}

double static TemperatureProvider.repeatingFullRangeDemo.getter@<D0>(uint64_t a1@<X8>)
{
  double result = 40.5555556;
  *(_OWORD *)a1 = xmmword_24CAE8BF0;
  *(_OWORD *)(a1 + 16) = xmmword_24CAE8C00;
  *(unsigned char *)(a1 + 32) = 65;
  return result;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for TemperatureSettings()
{
  return &type metadata for TemperatureSettings;
}

uint64_t _s9DepthCore19TemperatureProviderOwxx_0(uint64_t a1)
{
  return sub_24CAA5D68(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t _s9DepthCore19TemperatureProviderOwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
  sub_24CAA5CB8(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t _s9DepthCore19TemperatureProviderOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
  sub_24CAA5CB8(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  unsigned __int8 v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_24CAA5D68(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t _s9DepthCore19TemperatureProviderOwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_24CAA5D68(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t _s9DepthCore19TemperatureProviderOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 32) >> 6) & 0xFFFFFF83 | (4 * ((*(unsigned __int8 *)(a1 + 32) >> 1) & 0x1F))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s9DepthCore19TemperatureProviderOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 126;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2)
    {
      *(_OWORD *)__n128 result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(unsigned char *)(result + 32) = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

uint64_t sub_24CAC7270(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 32);
  int v2 = (char)v1;
  unsigned int v3 = v1 >> 6;
  if (v2 >= 0) {
    return v3;
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24CAC7290(uint64_t result)
{
  *(unsigned char *)(result + 32) &= 0x3Fu;
  return result;
}

uint64_t sub_24CAC72A0(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    *(unsigned char *)(result + 32) = *(unsigned char *)(result + 32) & 1 | ((_BYTE)a2 << 6);
  }
  else
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for TemperatureProvider()
{
  return &type metadata for TemperatureProvider;
}

uint64_t PrivacySettings.fitnessTrackingEnabled.getter()
{
  return *v0;
}

uint64_t PrivacySettings.fitnessTrackingEnabled.setter(uint64_t result)
{
  *unsigned int v1 = result;
  return result;
}

uint64_t (*PrivacySettings.fitnessTrackingEnabled.modify())()
{
  return nullsub_1;
}

DepthCore::PrivacySettings __swiftcall PrivacySettings.init(fitnessTrackingEnabled:)(DepthCore::PrivacySettings fitnessTrackingEnabled)
{
  v1->fitnessTrackingEnabled = fitnessTrackingEnabled.fitnessTrackingEnabled;
  return fitnessTrackingEnabled;
}

uint64_t getEnumTagSinglePayload for InterfaceSettings(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PrivacySettings(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAC7484);
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

ValueMetadata *type metadata accessor for PrivacySettings()
{
  return &type metadata for PrivacySettings;
}

uint64_t DiveSummary.workoutID.setter(uint64_t a1)
{
  uint64_t v3 = sub_24CAE57A0();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*DiveSummary.workoutID.modify())()
{
  return nullsub_1;
}

uint64_t DiveSummary.dateInterval.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for DiveSummary() + 20);
  uint64_t v4 = sub_24CAE5630();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for DiveSummary()
{
  uint64_t result = qword_26980B268;
  if (!qword_26980B268) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t DiveSummary.dateInterval.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for DiveSummary() + 20);
  uint64_t v4 = sub_24CAE5630();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*DiveSummary.dateInterval.modify())()
{
  return nullsub_1;
}

uint64_t DiveSummary.maxDepth.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = type metadata accessor for DiveSummary();
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(result + 24));
  uint64_t v5 = *v4;
  LOBYTE(v4) = *((unsigned char *)v4 + 8);
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = (_BYTE)v4;
  return result;
}

uint64_t DiveSummary.maxDepth.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t result = type metadata accessor for DiveSummary();
  uint64_t v5 = v1 + *(int *)(result + 24);
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 8) = v3;
  return result;
}

uint64_t (*DiveSummary.maxDepth.modify())()
{
  return nullsub_1;
}

double DiveSummary.underwaterDuration.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for DiveSummary() + 28));
}

uint64_t DiveSummary.underwaterDuration.setter(double a1)
{
  uint64_t result = type metadata accessor for DiveSummary();
  *(double *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*DiveSummary.underwaterDuration.modify())()
{
  return nullsub_1;
}

__n128 DiveSummary.temperatureRange.getter@<Q0>(__n128 *a1@<X8>)
{
  char v3 = (__n128 *)(v1 + *(int *)(type metadata accessor for DiveSummary() + 32));
  unsigned __int8 v4 = v3[1].n128_u8[0];
  __n128 result = *v3;
  *a1 = *v3;
  a1[1].n128_u8[0] = v4;
  return result;
}

uint64_t DiveSummary.temperatureRange.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t result = type metadata accessor for DiveSummary();
  uint64_t v6 = v1 + *(int *)(result + 32);
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = v3;
  *(unsigned char *)(v6 + 16) = v4;
  return result;
}

uint64_t (*DiveSummary.temperatureRange.modify())()
{
  return nullsub_1;
}

uint64_t DiveSummary.numberOfDives.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for DiveSummary();
  uint64_t v6 = v2 + *(int *)(result + 36);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*DiveSummary.numberOfDives.modify())()
{
  return nullsub_1;
}

uint64_t DiveSummary.deviceIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for DiveSummary() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DiveSummary.deviceIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for DiveSummary() + 40));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*DiveSummary.deviceIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t DiveSummary.diveID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DiveSummary();
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CAC7C08(v2 + *(int *)(v5 + 52), (uint64_t)v10);
  sub_24CAC7C70(v2, (uint64_t)v7);
  uint64_t v11 = sub_24CAE57A0();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(a1, v7, v11);
    sub_24CAC7CD4((uint64_t)v7);
    return sub_24CAA51D0((uint64_t)v10, &qword_26980B250);
  }
  else
  {
    sub_24CAC7CD4((uint64_t)v7);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a1, v10, v11);
  }
}

uint64_t sub_24CAC7C08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CAC7C70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DiveSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CAC7CD4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DiveSummary();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t DiveSummary.init(workoutID:dateInterval:maxDepth:underwaterDuration:temperatureRange:numberOfDives:diveID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t **a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>)
{
  uint64_t v43 = a7;
  uint64_t v44 = a2;
  int v41 = a6;
  uint64_t v39 = a3;
  uint64_t v40 = a5;
  uint64_t v45 = a1;
  uint64_t v42 = a8;
  uint64_t v11 = type metadata accessor for DiveSummary();
  uint64_t v12 = (int *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = v17;
  uint64_t v18 = sub_24CAE5630();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_24CAE57A0();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v34 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = *v39;
  int v35 = *((unsigned __int8 *)v39 + 8);
  uint64_t v26 = *a4;
  uint64_t v38 = a4[1];
  uint64_t v39 = v26;
  int v37 = *((unsigned __int8 *)a4 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v25, v45, v22);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v44, v18);
  sub_24CAC7C08(v43, (uint64_t)v17);
  uint64_t v27 = &v14[v12[12]];
  *(void *)uint64_t v27 = 0;
  *((void *)v27 + 1) = 0;
  uint64_t v28 = (uint64_t)&v14[v12[13]];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56))(v28, 1, 1, v22);
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v14, v25, v22);
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(&v14[v12[7]], v21, v18);
  uint64_t v29 = &v14[v12[8]];
  *(void *)uint64_t v29 = v36;
  v29[8] = v35;
  *(double *)&v14[v12[9]] = a9;
  char v30 = &v14[v12[10]];
  uint64_t v31 = v38;
  *(void *)char v30 = v39;
  *((void *)v30 + 1) = v31;
  v30[16] = v37;
  uint64_t v32 = &v14[v12[11]];
  *(void *)uint64_t v32 = v40;
  v32[8] = v41 & 1;
  sub_24CAC82A4((uint64_t)v34, v28);
  swift_bridgeObjectRelease();
  *(void *)uint64_t v27 = 0;
  *((void *)v27 + 1) = 0;
  sub_24CAC830C((uint64_t)v14, v42);
  sub_24CAA51D0(v43, &qword_26980B250);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v44, v18);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v45, v22);
}

uint64_t DiveSummary.init(workoutID:dateInterval:maxDepth:underwaterDuration:temperatureRange:numberOfDives:diveID:deviceIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, uint64_t a11)
{
  uint64_t v15 = *a3;
  char v16 = *((unsigned char *)a3 + 8);
  uint64_t v29 = a4[1];
  uint64_t v30 = *a4;
  char v28 = *((unsigned char *)a4 + 16);
  uint64_t v17 = (int *)type metadata accessor for DiveSummary();
  uint64_t v18 = (void *)(a9 + v17[10]);
  *uint64_t v18 = 0;
  v18[1] = 0;
  uint64_t v19 = a9 + v17[11];
  uint64_t v20 = sub_24CAE57A0();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56))(v19, 1, 1, v20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(a9, a1, v20);
  uint64_t v22 = a9 + v17[5];
  uint64_t v23 = sub_24CAE5630();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(v22, a2, v23);
  uint64_t v24 = a9 + v17[6];
  *(void *)uint64_t v24 = v15;
  *(unsigned char *)(v24 + 8) = v16;
  *(double *)(a9 + v17[7]) = a10;
  uint64_t v25 = a9 + v17[8];
  *(void *)uint64_t v25 = v30;
  *(void *)(v25 + 8) = v29;
  *(unsigned char *)(v25 + 16) = v28;
  uint64_t v26 = a9 + v17[9];
  *(void *)uint64_t v26 = a5;
  *(unsigned char *)(v26 + 8) = a6 & 1;
  sub_24CAC82A4(a7, v19);
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v18 = a8;
  v18[1] = a11;
  return result;
}

uint64_t sub_24CAC82A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CAC830C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DiveSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static DiveSummary.fromHKWorkout(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for DiveSummary();
  uint64_t v118 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24CAE57A0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v115 = (char *)&v103 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  int64_t v116 = (uint8_t *)&v103 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v103 - v16;
  uint64_t v18 = sub_24CAE5730();
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v20 = sub_24CAE5630();
  uint64_t v113 = *(void *)(v20 - 8);
  uint64_t v114 = v20;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v112 = (char *)&v103 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v117 = (char *)&v103 - v23;
  if (objc_msgSend(a1, sel_workoutActivityType) == (id)84)
  {
    uint64_t v110 = v8;
    uint64_t v111 = v7;
    id v24 = objc_msgSend(a1, sel_metadata);
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v108 = a2;
      uint64_t v26 = sub_24CAE5A60();

      id v27 = objc_msgSend(a1, sel_startDate);
      sub_24CAE5710();

      id v28 = objc_msgSend(a1, sel_endDate);
      sub_24CAE5710();

      sub_24CAE5600();
      if (*(void *)(v26 + 16)
        && (unint64_t v29 = sub_24CAA4890(0xD00000000000001DLL, 0x800000024CAEABA0), (v30 & 1) != 0)
        && (sub_24CAA5108(*(void *)(v26 + 56) + 32 * v29, (uint64_t)&v123), (swift_dynamicCast() & 1) != 0))
      {
        char v31 = 0;
        uint64_t v32 = v119;
      }
      else
      {
        uint64_t v32 = 0;
        char v31 = 1;
      }
      uint64_t v121 = v32;
      char v122 = v31;
      if (*(void *)(v26 + 16)
        && (unint64_t v35 = sub_24CAA4890(0xD000000000000025, 0x800000024CAEABC0), (v36 & 1) != 0)
        && (sub_24CAA5108(*(void *)(v26 + 56) + 32 * v35, (uint64_t)&v123), swift_dynamicCast()))
      {
        uint64_t v37 = v119;
        unint64_t v38 = v120;
      }
      else
      {
        unint64_t v38 = 0xEF79726F67657461;
        uint64_t v37 = 0x63676E697373696DLL;
      }
      static WaterDepth.depth(fromDepthValue:categoryString:)((uint64_t)&v121, v37, v38, (uint64_t)&v123);
      swift_bridgeObjectRelease();
      uint64_t v39 = 0;
      uint64_t v40 = *(void *)(v26 + 16);
      LODWORD(v106) = BYTE8(v123);
      uint64_t v105 = v123;
      if (v40)
      {
        unint64_t v41 = sub_24CAA4890(0xD000000000000023, 0x800000024CAEAB70);
        if (v42)
        {
          sub_24CAA5108(*(void *)(v26 + 56) + 32 * v41, (uint64_t)&v123);
          if (swift_dynamicCast()) {
            uint64_t v39 = v119;
          }
        }
      }
      sub_24CAA9B68();
      id v43 = (id)*MEMORY[0x263F09F58];
      uint64_t v44 = (void *)MEMORY[0x253307DB0]();
      double v45 = COERCE_DOUBLE(objc_msgSend(a1, sel_statisticsForType_, v44));

      uint64_t v109 = v17;
      if (v45 != 0.0)
      {
        id v46 = objc_msgSend(*(id *)&v45, sel_minimumQuantity);

        if (v46)
        {
          id v47 = objc_msgSend(self, sel_degreeCelsiusUnit);
          objc_msgSend(v46, sel_doubleValueForUnit_, v47);
          double v49 = v48;

          char v50 = 0;
          double v45 = v49;
LABEL_31:
          unint64_t v64 = (void *)MEMORY[0x253307DB0](v43);
          id v65 = objc_msgSend(a1, sel_statisticsForType_, v64);

          if (v65
            && (id v66 = objc_msgSend(v65, sel_maximumQuantity), v65, v66))
          {
            double v67 = v45;
            id v68 = objc_msgSend(self, sel_degreeCelsiusUnit);
            objc_msgSend(v66, sel_doubleValueForUnit_, v68);
            double v70 = v69;

            double v71 = v70;
            if (v50)
            {
              int v104 = 0;
              goto LABEL_37;
            }
            if (v70 <= v67) {
              double v75 = v70;
            }
            else {
              double v75 = v67;
            }
            if (v70 <= v67) {
              double v71 = v67;
            }
            int v104 = 1;
            double v107 = v75;
          }
          else
          {
            double v71 = 0.0;
            if (v50)
            {
              int v104 = 2;
LABEL_37:
              int v72 = v106;
              uint64_t v73 = v105;
              double v107 = v71;
              double v71 = 0.0;
              uint64_t v74 = (uint64_t)v109;
              if (!*(void *)(v26 + 16)) {
                goto LABEL_50;
              }
LABEL_47:
              unint64_t v76 = sub_24CAA4890(0xD000000000000025, 0x800000024CAEAB40);
              if (v77)
              {
                sub_24CAA5108(*(void *)(v26 + 56) + 32 * v76, (uint64_t)&v123);
                if (swift_dynamicCast())
                {
                  uint64_t v78 = v119;
LABEL_51:
                  uint64_t v103 = v78;
                  if (*(void *)(v26 + 16)
                    && (unint64_t v79 = sub_24CAA4890(0xD000000000000021, 0x800000024CAEAC50), (v80 & 1) != 0))
                  {
                    sub_24CAA5108(*(void *)(v26 + 56) + 32 * v79, (uint64_t)&v123);
                  }
                  else
                  {
                    long long v123 = 0u;
                    long long v124 = 0u;
                  }
                  swift_bridgeObjectRelease();
                  if (*((void *)&v124 + 1))
                  {
                    if (swift_dynamicCast())
                    {
                      uint64_t v81 = v6;
                      sub_24CAE5740();
                      swift_bridgeObjectRelease();
                      goto LABEL_60;
                    }
                  }
                  else
                  {
                    sub_24CAA51D0((uint64_t)&v123, &qword_26980AB78);
                  }
                  uint64_t v81 = v6;
                  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v110 + 56))(v74, 1, 1, v111);
LABEL_60:
                  id v82 = objc_msgSend(a1, sel_UUID, v103);
                  sub_24CAE5770();

                  (*(void (**)(char *, char *, uint64_t))(v113 + 16))(v112, v117, v114);
                  if (v72 == 255)
                  {
                    uint64_t v73 = 0;
                    char v83 = 3;
                  }
                  else
                  {
                    char v83 = v72;
                  }
                  sub_24CAC7C08(v74, (uint64_t)v116);
                  id v84 = objc_msgSend(a1, sel_device);
                  if (v84)
                  {
                    uint64_t v85 = v84;
                    int64_t v86 = (int *)v4;
                    id v87 = objc_msgSend(v84, sel_hardwareVersion);

                    if (v87)
                    {
                      double v88 = v71;
                      uint64_t v106 = sub_24CAE5B20();
                      uint64_t v90 = v89;

LABEL_68:
                      uint64_t v91 = (uint64_t)v81;
                      unint64_t v92 = (uint64_t *)&v81[v86[10]];
                      *unint64_t v92 = 0;
                      v92[1] = 0;
                      uint64_t v93 = (uint64_t)&v81[v86[11]];
                      uint64_t v94 = v110;
                      uint64_t v95 = v111;
                      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v110 + 56))(v93, 1, 1, v111);
                      (*(void (**)(uint64_t, char *, uint64_t))(v94 + 32))(v91, v115, v95);
                      uint64_t v96 = v113;
                      uint64_t v97 = v114;
                      (*(void (**)(uint64_t, char *, uint64_t))(v113 + 32))(v91 + v86[5], v112, v114);
                      uint64_t v98 = v91 + v86[6];
                      *(void *)uint64_t v98 = v73;
                      *(unsigned char *)(v98 + 8) = v83;
                      *(void *)(v91 + v86[7]) = v39;
                      uint64_t v99 = v91 + v86[8];
                      *(double *)uint64_t v99 = v107;
                      *(double *)(v99 + 8) = v88;
                      *(unsigned char *)(v99 + 16) = v104;
                      uint64_t v100 = v91 + v86[9];
                      *(void *)uint64_t v100 = v103;
                      *(unsigned char *)(v100 + 8) = 0;
                      sub_24CAC82A4((uint64_t)v116, v93);
                      swift_bridgeObjectRelease();
                      *unint64_t v92 = v106;
                      v92[1] = v90;
                      uint64_t v101 = v91;
                      uint64_t v102 = v108;
                      sub_24CAC830C(v101, v108);
                      sub_24CAA51D0((uint64_t)v109, &qword_26980B250);
                      (*(void (**)(char *, uint64_t))(v96 + 8))(v117, v97);
                      return (*(uint64_t (**)(uint64_t, void, uint64_t, int *))(v118 + 56))(v102, 0, 1, v86);
                    }
                  }
                  else
                  {
                    int64_t v86 = (int *)v4;
                  }
                  double v88 = v71;
                  uint64_t v106 = 0;
                  uint64_t v90 = 0;
                  goto LABEL_68;
                }
              }
LABEL_50:
              uint64_t v78 = 1;
              goto LABEL_51;
            }
            double v107 = v45;
            int v104 = 0;
          }
          uint64_t v74 = (uint64_t)v109;
          int v72 = v106;
          uint64_t v73 = v105;
          if (!*(void *)(v26 + 16)) {
            goto LABEL_50;
          }
          goto LABEL_47;
        }
        double v45 = 0.0;
      }
      char v50 = 1;
      goto LABEL_31;
    }
    if (qword_26980A7C0 != -1) {
      swift_once();
    }
    uint64_t v51 = sub_24CAE5860();
    __swift_project_value_buffer(v51, (uint64_t)qword_26980B960);
    id v52 = a1;
    char v53 = sub_24CAE5840();
    os_log_type_t v54 = sub_24CAE5D90();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = swift_slowAlloc();
      uint64_t v108 = a2;
      char v56 = (uint8_t *)v55;
      uint64_t v117 = (char *)swift_slowAlloc();
      *(void *)&long long v123 = v117;
      *(_DWORD *)char v56 = 136315138;
      int64_t v116 = v56 + 4;
      id v57 = objc_msgSend(v52, sel_UUID);
      sub_24CAE5770();

      sub_24CAC9C44((unint64_t *)&qword_26980AB50, MEMORY[0x263F07508]);
      uint64_t v58 = v111;
      uint64_t v59 = sub_24CAE61B0();
      unint64_t v61 = v60;
      (*(void (**)(char *, uint64_t))(v110 + 8))(v11, v58);
      uint64_t v119 = sub_24CAA4228(v59, v61, (uint64_t *)&v123);
      sub_24CAE5ED0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CA9E000, v53, v54, "Workout %s has nil metadata", v56, 0xCu);
      uint64_t v62 = v117;
      swift_arrayDestroy();
      MEMORY[0x253308900](v62, -1, -1);
      uint64_t v63 = v56;
      a2 = v108;
      MEMORY[0x253308900](v63, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v118 + 56))(a2, 1, 1, v4);
  }
  else
  {
    uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v118 + 56);
    return v33(a2, 1, 1, v4);
  }
}

uint64_t static DiveSummary.previewData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24CAE5730();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = sub_24CAE5630();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24CAE57A0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CAE5790();
  sub_24CAE5720();
  sub_24CAE56F0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  sub_24CAE5720();
  sub_24CAE5600();
  uint64_t v20 = 0x403B6E978D4FDF3CLL;
  char v21 = 1;
  long long v18 = xmmword_24CAE8C80;
  char v19 = 1;
  sub_24CAE5790();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v4, 0, 1, v13);
  return DiveSummary.init(workoutID:dateInterval:maxDepth:underwaterDuration:temperatureRange:numberOfDives:diveID:)((uint64_t)v16, (uint64_t)v12, &v20, (uint64_t **)&v18, 2, 0, (uint64_t)v4, a1, 2760.0);
}

uint64_t DiveSummary.with(maxDepth:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v43 = a2;
  uint64_t v5 = type metadata accessor for DiveSummary();
  uint64_t v6 = (int *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v39 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  unint64_t v38 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  char v42 = (char *)&v36 - v11;
  uint64_t v12 = sub_24CAE5630();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24CAE57A0();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  char v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void *)a1;
  char v21 = *(unsigned char *)(a1 + 8);
  uint64_t v22 = *(void (**)(void))(v17 + 16);
  uint64_t v40 = v19;
  uint64_t v37 = v22;
  v22();
  uint64_t v23 = v3 + v6[7];
  id v24 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  unint64_t v41 = v15;
  uint64_t v25 = v15;
  uint64_t v26 = (uint64_t)v38;
  v24(v25, v23, v12);
  uint64_t v46 = v20;
  uint64_t v27 = (uint64_t)v39;
  uint64_t v28 = v6[10];
  double v29 = *(double *)(v3 + v6[9]);
  char v47 = v21;
  char v30 = (long long *)(v3 + v28);
  LOBYTE(v28) = *(unsigned char *)(v3 + v28 + 16);
  long long v44 = *v30;
  char v45 = v28;
  uint64_t v31 = v3 + v6[11];
  uint64_t v32 = *(void *)v31;
  int v33 = *(unsigned __int8 *)(v31 + 8);
  sub_24CAC7C08(v3 + v6[13], v26);
  sub_24CAC7C70(v3, v27);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v26, 1, v16) == 1)
  {
    uint64_t v34 = (uint64_t)v42;
    ((void (*)(char *, uint64_t, uint64_t))v37)(v42, v27, v16);
    sub_24CAC7CD4(v27);
    sub_24CAA51D0(v26, &qword_26980B250);
  }
  else
  {
    sub_24CAC7CD4(v27);
    uint64_t v34 = (uint64_t)v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v42, v26, v16);
  }
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(v34, 0, 1, v16);
  return DiveSummary.init(workoutID:dateInterval:maxDepth:underwaterDuration:temperatureRange:numberOfDives:diveID:)((uint64_t)v40, (uint64_t)v41, &v46, (uint64_t **)&v44, v32, v33, v34, v43, v29);
}

uint64_t _s9DepthCore11DiveSummaryV13numberOfDivesSiSgvg_0()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for DiveSummary() + 36));
}

uint64_t DiveSummary.startDate.getter()
{
  return sub_24CAC974C(MEMORY[0x263F062C8]);
}

uint64_t DiveSummary.endDate.getter()
{
  return sub_24CAC974C(MEMORY[0x263F062C0]);
}

uint64_t sub_24CAC974C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t DiveSummary.underwaterTime.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
  type metadata accessor for DiveSummary();
  sub_24CAE5610();
  sub_24CAE55F0();
  type metadata accessor for UnderwaterTime();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24CAC9814@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_24CAE5630();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_24CAC9884@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(v2 + *(int *)(result + 24));
  uint64_t v4 = *v3;
  LOBYTE(v3) = *((unsigned char *)v3 + 8);
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = (_BYTE)v3;
  return result;
}

double sub_24CAC98A0(uint64_t a1)
{
  return *(double *)(v1 + *(int *)(a1 + 28));
}

uint64_t sub_24CAC98AC(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 36));
}

uint64_t sub_24CAC98C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v5 = a1 - 8;
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CAC7C08(v3 + *(int *)(v5 + 52), (uint64_t)v10);
  sub_24CAC7C70(v3, (uint64_t)v7);
  uint64_t v11 = sub_24CAE57A0();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(a2, v7, v11);
    sub_24CAC7CD4((uint64_t)v7);
    return sub_24CAA51D0((uint64_t)v10, &qword_26980B250);
  }
  else
  {
    sub_24CAC7CD4((uint64_t)v7);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a2, v10, v11);
  }
}

uint64_t sub_24CAC9A58(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 40));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t DiveSummary.hashValue.getter()
{
  return sub_24CAE6260();
}

uint64_t sub_24CAC9AD8()
{
  return sub_24CAE6260();
}

uint64_t sub_24CAC9B1C()
{
  return sub_24CAE6260();
}

uint64_t sub_24CAC9B5C()
{
  return sub_24CAC9C44(&qword_26980B0D8, MEMORY[0x263F07508]);
}

uint64_t sub_24CAC9BA4(uint64_t a1)
{
  uint64_t result = sub_24CAC9C44(&qword_26980B258, (void (*)(uint64_t))type metadata accessor for DiveSummary);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24CAC9BFC()
{
  return sub_24CAC9C44(&qword_26980B260, (void (*)(uint64_t))type metadata accessor for DiveSummary);
}

uint64_t sub_24CAC9C44(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for DiveSummary(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v34 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v34 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24CAE57A0();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    uint64_t v10 = a3[5];
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_24CAE5630();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    uint64_t v16 = (char *)a1 + v14;
    uint64_t v17 = (char *)a2 + v14;
    *(void *)uint64_t v16 = *(void *)v17;
    uint64_t v18 = *(uint64_t *)((char *)a2 + v15);
    v16[8] = v17[8];
    *(uint64_t *)((char *)a1 + v15) = v18;
    uint64_t v19 = a3[8];
    uint64_t v20 = a3[9];
    char v21 = (char *)a1 + v19;
    uint64_t v22 = (char *)a2 + v19;
    v21[16] = v22[16];
    *(_OWORD *)char v21 = *(_OWORD *)v22;
    uint64_t v23 = (char *)a1 + v20;
    id v24 = (char *)a2 + v20;
    *(void *)uint64_t v23 = *(void *)v24;
    v23[8] = v24[8];
    uint64_t v25 = a3[10];
    uint64_t v26 = a3[11];
    uint64_t v27 = (uint64_t *)((char *)a1 + v25);
    uint64_t v28 = (uint64_t *)((char *)a2 + v25);
    uint64_t v29 = v28[1];
    char v30 = (char *)a1 + v26;
    void *v27 = *v28;
    v27[1] = v29;
    uint64_t v31 = (char *)a2 + v26;
    uint64_t v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    swift_bridgeObjectRetain();
    if (v32(v31, 1, v7))
    {
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
      memcpy(v30, v31, *(void *)(*(void *)(v33 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v30, (uint64_t *)v31, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v30, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for DiveSummary(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CAE57A0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v10(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = sub_24CAE5630();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = a1 + *(int *)(a2 + 44);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v8, v4);
  }
  return result;
}

char *initializeWithCopy for DiveSummary(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24CAE57A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_24CAE5630();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v13];
  uint64_t v16 = &a2[v13];
  *(void *)uint64_t v15 = *(void *)v16;
  uint64_t v17 = *(void *)&a2[v14];
  v15[8] = v16[8];
  *(void *)&a1[v14] = v17;
  uint64_t v18 = a3[8];
  uint64_t v19 = a3[9];
  uint64_t v20 = &a1[v18];
  char v21 = &a2[v18];
  v20[16] = v21[16];
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  uint64_t v22 = &a1[v19];
  uint64_t v23 = &a2[v19];
  *(void *)uint64_t v22 = *(void *)v23;
  v22[8] = v23[8];
  uint64_t v24 = a3[10];
  uint64_t v25 = a3[11];
  uint64_t v26 = &a1[v24];
  uint64_t v27 = &a2[v24];
  uint64_t v28 = *((void *)v27 + 1);
  uint64_t v29 = &a1[v25];
  *(void *)uint64_t v26 = *(void *)v27;
  *((void *)v26 + 1) = v28;
  char v30 = &a2[v25];
  uint64_t v31 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  swift_bridgeObjectRetain();
  if (v31(v30, 1, v6))
  {
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
    memcpy(v29, v30, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    v8(v29, v30, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v29, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for DiveSummary(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24CAE57A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_24CAE5630();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  char v16 = v15[8];
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v16;
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  uint64_t v17 = a3[8];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  char v20 = v19[16];
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  v18[16] = v20;
  uint64_t v21 = a3[9];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  char v24 = v23[8];
  *(void *)uint64_t v22 = *(void *)v23;
  v22[8] = v24;
  uint64_t v25 = a3[10];
  uint64_t v26 = &a1[v25];
  uint64_t v27 = &a2[v25];
  *(void *)uint64_t v26 = *(void *)v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[11];
  uint64_t v29 = &a1[v28];
  char v30 = &a2[v28];
  uint64_t v31 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v10) = v31(&a1[v28], 1, v6);
  int v32 = v31(v30, 1, v6);
  if (!v10)
  {
    if (!v32)
    {
      v8(v29, v30, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v29, v6);
    goto LABEL_6;
  }
  if (v32)
  {
LABEL_6:
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
    memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v29, v30, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v29, 0, 1, v6);
  return a1;
}

char *initializeWithTake for DiveSummary(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24CAE57A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_24CAE5630();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v13];
  char v16 = &a2[v13];
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v16[8];
  *(void *)&a1[v14] = *(void *)&a2[v14];
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = &a1[v17];
  char v20 = &a2[v17];
  v19[16] = v20[16];
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  uint64_t v21 = &a1[v18];
  uint64_t v22 = &a2[v18];
  *(void *)uint64_t v21 = *(void *)v22;
  v21[8] = v22[8];
  uint64_t v23 = a3[11];
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  char v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v25, 1, v6))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    v8(v24, v25, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v24, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for DiveSummary(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24CAE57A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_24CAE5630();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v13];
  char v16 = &a2[v13];
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v16[8];
  *(void *)&a1[v14] = *(void *)&a2[v14];
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = &a1[v17];
  char v20 = &a2[v17];
  v19[16] = v20[16];
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  uint64_t v21 = &a1[v18];
  uint64_t v22 = &a2[v18];
  *(void *)uint64_t v21 = *(void *)v22;
  v21[8] = v22[8];
  uint64_t v23 = a3[10];
  char v24 = &a1[v23];
  uint64_t v25 = (uint64_t *)&a2[v23];
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *(void *)char v24 = v27;
  *((void *)v24 + 1) = v26;
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[11];
  uint64_t v29 = &a1[v28];
  char v30 = &a2[v28];
  uint64_t v31 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v10) = v31(&a1[v28], 1, v6);
  int v32 = v31(v30, 1, v6);
  if (!v10)
  {
    if (!v32)
    {
      v8(v29, v30, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v29, v6);
    goto LABEL_6;
  }
  if (v32)
  {
LABEL_6:
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
    memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v29, v30, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v29, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DiveSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CACA93C);
}

uint64_t sub_24CACA93C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24CAE57A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_24CAE5630();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 2147483646)
  {
    unint64_t v14 = *(void *)(a1 + a3[10] + 8);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    int v15 = v14 - 1;
    if (v15 < 0) {
      int v15 = -1;
    }
    return (v15 + 1);
  }
  else
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
    uint64_t v18 = v16;
    uint64_t v19 = a1 + a3[11];
    return v17(v19, a2, v18);
  }
}

uint64_t storeEnumTagSinglePayload for DiveSummary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CACAAE4);
}

uint64_t sub_24CACAAE4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_24CAE57A0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_24CAE5630();
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 2147483646)
  {
    *(void *)(a1 + a4[10] + 8) = a2;
  }
  else
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B250);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[11];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

void sub_24CACAC6C()
{
  sub_24CAE57A0();
  if (v0 <= 0x3F)
  {
    sub_24CAE5630();
    if (v1 <= 0x3F)
    {
      sub_24CACADA4();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_24CACADA4()
{
  if (!qword_26980B278)
  {
    sub_24CAE57A0();
    unint64_t v0 = sub_24CAE5EB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26980B278);
    }
  }
}

uint64_t InterfaceSettings.demoCornerMaskEnabled.getter()
{
  return *v0;
}

uint64_t InterfaceSettings.demoCornerMaskEnabled.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*InterfaceSettings.demoCornerMaskEnabled.modify())()
{
  return nullsub_1;
}

unsigned char *storeEnumTagSinglePayload for InterfaceSettings(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CACAEF8);
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

ValueMetadata *type metadata accessor for InterfaceSettings()
{
  return &type metadata for InterfaceSettings;
}

void UnitSettings.depthUnit.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *UnitSettings.depthUnit.setter(unsigned char *result)
{
  *uint64_t v1 = *result;
  return result;
}

uint64_t (*UnitSettings.depthUnit.modify())()
{
  return nullsub_1;
}

void UnitSettings.waterTemperatureUnit.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 1);
}

unsigned char *UnitSettings.waterTemperatureUnit.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 1) = *result;
  return result;
}

uint64_t (*UnitSettings.waterTemperatureUnit.modify())()
{
  return nullsub_1;
}

DepthCore::UnitSettings __swiftcall UnitSettings.init(depthUnit:waterTemperatureUnit:)(DepthCore::DepthUnit depthUnit, DepthCore::WaterTemperatureUnit waterTemperatureUnit)
{
  char v3 = *(unsigned char *)waterTemperatureUnit;
  *unint64_t v2 = *(unsigned char *)depthUnit;
  v2[1] = v3;
  result.depthUnit = depthUnit;
  return result;
}

uint64_t UnitSettings.depthUnitString.getter()
{
  int v1 = *v0;
  unint64_t v2 = self;
  char v3 = &selRef_meters;
  if (!v1) {
    char v3 = &selRef_feet;
  }
  id v4 = [v2 *v3];
  id v5 = objc_msgSend(v4, sel_symbol);

  uint64_t v6 = sub_24CAE5B20();
  return v6;
}

uint64_t UnitSettings.localizedString.getter()
{
  return sub_24CAA9C64();
}

uint64_t UnitSettings.waterTemperatureUnitString.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 1);
  unint64_t v2 = self;
  char v3 = &selRef_fahrenheit;
  if (!v1) {
    char v3 = &selRef_celsius;
  }
  id v4 = [v2 *v3];
  id v5 = objc_msgSend(v4, sel_symbol);

  uint64_t v6 = sub_24CAE5B20();
  return v6;
}

uint64_t UnitSettings.loggingString.getter()
{
  uint64_t v1 = 1952802150;
  if (*v0) {
    uint64_t v1 = 0x73726574656DLL;
  }
  uint64_t v3 = v1;
  swift_bridgeObjectRetain();
  sub_24CAE5BB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24CAE5BB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *DepthCore::UnitSettings result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UnitSettings(unsigned __int16 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for UnitSettings(uint64_t result, unsigned int a2, unsigned int a3)
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
    *(_WORD *)DepthCore::UnitSettings result = a2 - 255;
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
        JUMPOUT(0x24CACB380);
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
          *(unsigned char *)DepthCore::UnitSettings result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UnitSettings()
{
  return &type metadata for UnitSettings;
}

DepthCore::DepthValue __swiftcall DepthValue.init(value:inUnit:)(Swift::Double value, DepthCore::DepthUnit inUnit)
{
  double v3 = 0.3048;
  if (*(unsigned char *)inUnit) {
    double v3 = 1.0;
  }
  result.canonicalValue = v3 * value;
  *int v2 = result.canonicalValue;
  return result;
}

void WaterDepth.depthValue.getter(uint64_t a1@<X8>)
{
  unsigned int v2 = *((unsigned __int8 *)v1 + 8);
  if (v2 <= 2) {
    uint64_t v3 = *v1;
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v2 > 2;
}

Swift::Double __swiftcall DepthValue.value(forUnit:)(DepthCore::DepthUnit forUnit)
{
  double v2 = 3.2808399;
  if (*(unsigned char *)forUnit) {
    double v2 = 1.0;
  }
  return *v1 * v2;
}

id DepthUnit.unitLength.getter()
{
  int v1 = *v0;
  double v2 = self;
  uint64_t v3 = &selRef_meters;
  if (!v1) {
    uint64_t v3 = &selRef_feet;
  }
  id v4 = [v2 *v3];
  return v4;
}

BOOL static DepthValue.== infix(_:_:)(double *a1, double *a2)
{
  return vabdd_f64(*a1, *a2) <= 0.0001;
}

BOOL sub_24CACB4AC(uint64_t a1, char a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 1:
      if (a2 == 1) {
        return vabdd_f64(*(double *)&a3, *(double *)&a1) <= 0.0001 || *(double *)&a3 >= *(double *)&a1;
      }
      unint64_t v5 = 3;
      return v5 >= 4;
    case 2:
      if (a2 == 2) {
        return vabdd_f64(*(double *)&a3, *(double *)&a1) <= 0.0001 || *(double *)&a3 >= *(double *)&a1;
      }
      unint64_t v5 = 4;
      return v5 >= 4;
    case 3:
      if (*(double *)&a3 == 0.0)
      {
        unint64_t v5 = 0;
        if (v4 && *(double *)&a1 == 0.0) {
          return 1;
        }
        return v5 >= 4;
      }
      if (a3 == 1)
      {
        unint64_t v5 = 1;
        if (a2 == 3 && a1 == 1) {
          return 1;
        }
        return v5 >= 4;
      }
      unint64_t v5 = 5;
      if (a2 != 3 || a1 != 2) {
        return v5 >= 4;
      }
      return 1;
    default:
      if (a2)
      {
        unint64_t v5 = 2;
        return v5 >= 4;
      }
      else
      {
        return vabdd_f64(*(double *)&a3, *(double *)&a1) <= 0.0001 || *(double *)&a3 >= *(double *)&a1;
      }
  }
}

BOOL sub_24CACB600(uint64_t a1, char a2, uint64_t a3, char a4)
{
  switch(a2)
  {
    case 1:
      if (a4 == 1) {
        return vabdd_f64(*(double *)&a1, *(double *)&a3) <= 0.0001 || *(double *)&a1 >= *(double *)&a3;
      }
      unint64_t v5 = 3;
      return v5 >= 4;
    case 2:
      if (a4 == 2) {
        return vabdd_f64(*(double *)&a1, *(double *)&a3) <= 0.0001 || *(double *)&a1 >= *(double *)&a3;
      }
      unint64_t v5 = 4;
      return v5 >= 4;
    case 3:
      if (*(double *)&a1 == 0.0)
      {
        unint64_t v5 = 0;
        if (v4 && *(double *)&a3 == 0.0) {
          return 1;
        }
        return v5 >= 4;
      }
      if (a1 == 1)
      {
        unint64_t v5 = 1;
        if (a4 == 3 && a3 == 1) {
          return 1;
        }
        return v5 >= 4;
      }
      unint64_t v5 = 5;
      if (a4 != 3 || a3 != 2) {
        return v5 >= 4;
      }
      return 1;
    default:
      if (a4)
      {
        unint64_t v5 = 2;
        return v5 >= 4;
      }
      else
      {
        return vabdd_f64(*(double *)&a1, *(double *)&a3) <= 0.0001 || *(double *)&a1 >= *(double *)&a3;
      }
  }
}

double static DepthValue.- infix(_:_:)@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 - *a2;
  *a3 = result;
  return result;
}

uint64_t sub_24CACB768(uint64_t result, char a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 1:
      if (a2 == 1) {
        goto LABEL_7;
      }
      unint64_t v5 = 3;
      return v5 < 4;
    case 2:
      if (a2 == 2) {
        goto LABEL_7;
      }
      unint64_t v5 = 4;
      return v5 < 4;
    case 3:
      if (*(double *)&a3 == 0.0)
      {
        unint64_t v5 = 0;
        if (!v4 || *(double *)&result != 0.0) {
          return v5 < 4;
        }
        return result;
      }
      if (a3 == 1)
      {
        unint64_t v5 = 1;
        if (a2 == 3 && result == 1) {
          goto LABEL_22;
        }
        return v5 < 4;
      }
      unint64_t v5 = 5;
      if (a2 != 3 || result != 2) {
        return v5 < 4;
      }
      goto LABEL_22;
    default:
      if (a2)
      {
        unint64_t v5 = 2;
        return v5 < 4;
      }
      else
      {
LABEL_7:
        if (vabdd_f64(*(double *)&a3, *(double *)&result) <= 0.0001) {
LABEL_22:
        }
          *(double *)&double result = 0.0;
        else {
          return *(double *)&a3 < *(double *)&result;
        }
      }
      return result;
  }
}

double DepthValue.canonicalValue.getter()
{
  return *(double *)v0;
}

Swift::Double __swiftcall DepthUnit.conversionFactor(toUnit:)(DepthCore::DepthUnit toUnit)
{
  Swift::Double result = 3.2808399;
  double v3 = 1.0;
  if (*(unsigned char *)toUnit)
  {
    Swift::Double result = 1.0;
    double v3 = 0.3048;
  }
  if (!*v1) {
    return v3;
  }
  return result;
}

uint64_t sub_24CACB8F0(uint64_t a1)
{
  unint64_t v2 = sub_24CACBA9C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CACB92C(uint64_t a1)
{
  unint64_t v2 = sub_24CACBA9C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DepthValue.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B280);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CACBA9C();
  sub_24CAE6280();
  sub_24CAE6170();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_24CACBA9C()
{
  unint64_t result = qword_26980B288;
  if (!qword_26980B288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B288);
  }
  return result;
}

uint64_t DepthValue.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B290);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CACBA9C();
  sub_24CAE6270();
  if (!v2)
  {
    sub_24CAE60F0();
    uint64_t v10 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_24CACBC48@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return DepthValue.init(from:)(a1, a2);
}

uint64_t sub_24CACBC60(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B280);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CACBA9C();
  sub_24CAE6280();
  sub_24CAE6170();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

BOOL static DepthValue.< infix(_:_:)(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL static DepthValue.> infix(_:_:)(double *a1, double *a2)
{
  return *a2 < *a1;
}

BOOL sub_24CACBDBC(double *a1, double *a2)
{
  return vabdd_f64(*a1, *a2) <= 0.0001;
}

void static DepthValue.zero.getter(void *a1@<X8>)
{
  *a1 = 0;
}

double static DepthValue.+ infix(_:_:)@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 + *a2;
  *a3 = result;
  return result;
}

double sub_24CACBDF8@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 + *a2;
  *a3 = result;
  return result;
}

double sub_24CACBE0C(double *a1, double *a2)
{
  double result = *a2 + *a1;
  *a1 = result;
  return result;
}

double sub_24CACBE20@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 - *a2;
  *a3 = result;
  return result;
}

double sub_24CACBE34(double *a1, double *a2)
{
  double result = *a1 - *a2;
  *a1 = result;
  return result;
}

BOOL WaterDepth.isExceedingMaxDepth.getter()
{
  unsigned int v1 = *(unsigned __int8 *)(v0 + 8);
  if (v1 < 2) {
    return 0;
  }
  if (v1 == 3) {
    return *(void *)v0 > 1uLL;
  }
  return 1;
}

BOOL WaterDepth.isSumberged.getter()
{
  return *(unsigned char *)(v0 + 8) != 3 || *(void *)v0 > 1uLL;
}

uint64_t WaterDepth.hasEqualSubmersionState(to:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  int v3 = *((unsigned __int8 *)a1 + 8);
  switch(*(unsigned char *)(v1 + 8))
  {
    case 1:
      return v3 == 1;
    case 2:
      return v3 == 2;
    case 3:
      if (*(void *)v1)
      {
        if (*(void *)v1 == 1 || v3 != 3 || v2 != 2) {
          return 0;
        }
      }
      else if (v3 != 3 || v2 != 0)
      {
        return 0;
      }
      return 1;
    default:
      return !*((unsigned char *)a1 + 8);
  }
}

double *static WaterDepth.from(depthValue:withConfiguration:)@<X0>(double *a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  double v4 = *a1;
  char v5 = *a2;
  double v6 = *((double *)a2 + 1);
  uint64_t v7 = *((void *)a2 + 9);
  uint64_t v8 = *((void *)a2 + 10);
  uint64_t v9 = *((void *)a2 + 11);
  unsigned __int8 v10 = a2[96];
  char v11 = a2[138];
  sub_24CAA5CA0(v7, v8, v9, v10);
  if (v11)
  {
    if (v5)
    {
      if (qword_26980A758 != -1) {
        swift_once();
      }
      uint64_t v12 = (long long *)((char *)&xmmword_269812B00 + 8);
LABEL_10:
      double v13 = 50.0;
      goto LABEL_17;
    }
    double v13 = 10.0;
    if (qword_26980A760 != -1) {
      swift_once();
    }
    uint64_t v12 = (long long *)((char *)&xmmword_269812B10 + 8);
  }
  else
  {
    if (v5)
    {
      if (qword_26980A758 != -1) {
        swift_once();
      }
      uint64_t v12 = &xmmword_269812B00;
      goto LABEL_10;
    }
    double v13 = 10.0;
    if (qword_26980A760 != -1) {
      swift_once();
    }
    uint64_t v12 = &xmmword_269812B10;
  }
LABEL_17:
  double v14 = *(double *)v12;
  sub_24CAA5D50(v7, v8, v9, v10);
  v16[1] = v6;
  v16[2] = v14;
  v16[3] = v13;
  v16[0] = v4;
  return DepthTransform.callAsFunction(depth:)(v16, a3);
}

DepthCore::DepthTransform __swiftcall DepthTransform.init(significantDepth:nominalDepthLimit:deviceLimitDepth:)(DepthCore::DepthValue significantDepth, DepthCore::DepthValue nominalDepthLimit, DepthCore::DepthValue deviceLimitDepth)
{
  Swift::Double v7 = *v3;
  Swift::Double v8 = *v4;
  Swift::Double v9 = *v5;
  *double v6 = *v3;
  v6[1] = v8;
  uint64_t v6[2] = v9;
  result.deviceLimitDepth = *(DepthCore::DepthValue *)&v9;
  result.nominalDepthLimit = *(DepthCore::DepthValue *)&v8;
  result.significantDepth = *(DepthCore::DepthValue *)&v7;
  return result;
}

double *DepthTransform.callAsFunction(depth:)@<X0>(double *result@<X0>, uint64_t a2@<X8>)
{
  double v3 = *result;
  if (*result < 0.0)
  {
    uint64_t v4 = 1;
LABEL_3:
    *(void *)a2 = v4;
    *(unsigned char *)(a2 + 8) = 3;
    return result;
  }
  if (v3 < *v2)
  {
    *(double *)a2 = v3;
    *(unsigned char *)(a2 + 8) = 0;
    return result;
  }
  double v5 = v2[1];
  if (v5 < *v2)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (v3 < v5)
  {
    *(double *)a2 = v3;
    *(unsigned char *)(a2 + 8) = 1;
    return result;
  }
  double v6 = v2[2];
  if (v6 < v5) {
    goto LABEL_14;
  }
  if (v3 >= v6)
  {
    uint64_t v4 = 2;
    goto LABEL_3;
  }
  *(double *)a2 = v3;
  *(unsigned char *)(a2 + 8) = 2;
  return result;
}

unint64_t sub_24CACC19C(char a1)
{
  unint64_t result = 0xD00000000000001ALL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656D627553746F6ELL;
      break;
    case 2:
      unint64_t result = 0x776F6C6C616873;
      break;
    case 3:
      unint64_t result = 0x6C616E696D6F6ELL;
      break;
    case 4:
      return result;
    case 5:
      unint64_t result = 0xD000000000000019;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t sub_24CACC27C()
{
  return sub_24CACC19C(*v0);
}

uint64_t sub_24CACC284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CACEC08(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CACC2AC(uint64_t a1)
{
  unint64_t v2 = sub_24CACDB08();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CACC2E8(uint64_t a1)
{
  unint64_t v2 = sub_24CACDB08();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CACC324(uint64_t a1)
{
  unint64_t v2 = sub_24CACDBB0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CACC360(uint64_t a1)
{
  unint64_t v2 = sub_24CACDBB0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CACC39C(uint64_t a1)
{
  unint64_t v2 = sub_24CACDB5C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CACC3D8(uint64_t a1)
{
  unint64_t v2 = sub_24CACDB5C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CACC414(uint64_t a1)
{
  unint64_t v2 = sub_24CACDC04();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CACC450(uint64_t a1)
{
  unint64_t v2 = sub_24CACDC04();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CACC48C(uint64_t a1)
{
  unint64_t v2 = sub_24CACDCAC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CACC4C8(uint64_t a1)
{
  unint64_t v2 = sub_24CACDCAC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CACC504(uint64_t a1)
{
  unint64_t v2 = sub_24CACDC58();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CACC540(uint64_t a1)
{
  unint64_t v2 = sub_24CACDC58();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CACC57C(uint64_t a1)
{
  unint64_t v2 = sub_24CACDD00();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CACC5B8(uint64_t a1)
{
  unint64_t v2 = sub_24CACDD00();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WaterDepth.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B298);
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v34 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B2A0);
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v45 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v43 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B2A8);
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v40 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B2B0);
  uint64_t v38 = *(void *)(v10 - 8);
  uint64_t v39 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v37 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B2B8);
  uint64_t v32 = *(void *)(v12 - 8);
  uint64_t v33 = v12;
  MEMORY[0x270FA5388](v12);
  double v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B2C0);
  uint64_t v31 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B2C8);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  uint64_t v47 = v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *v2;
  uint64_t v23 = *((unsigned __int8 *)v2 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CACDB08();
  sub_24CAE6280();
  switch(v23)
  {
    case 1:
      LOBYTE(v48) = 3;
      sub_24CACDC04();
      char v24 = v40;
      uint64_t v25 = v46;
      sub_24CAE6120();
      uint64_t v48 = v22;
      sub_24CABCD84();
      uint64_t v26 = v42;
      sub_24CAE6180();
      uint64_t v27 = v41;
      goto LABEL_5;
    case 2:
      LOBYTE(v48) = 4;
      sub_24CACDBB0();
      char v24 = v43;
      uint64_t v25 = v46;
      sub_24CAE6120();
      uint64_t v48 = v22;
      sub_24CABCD84();
      uint64_t v26 = v45;
      sub_24CAE6180();
      uint64_t v27 = v44;
      goto LABEL_5;
    case 3:
      if (v22)
      {
        if (v22 == 1)
        {
          LOBYTE(v48) = 1;
          sub_24CACDCAC();
          uint64_t v25 = v46;
          sub_24CAE6120();
          (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v33);
        }
        else
        {
          LOBYTE(v48) = 5;
          sub_24CACDB5C();
          char v30 = v34;
          uint64_t v25 = v46;
          sub_24CAE6120();
          (*(void (**)(char *, uint64_t))(v35 + 8))(v30, v36);
        }
        return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v21, v25);
      }
      else
      {
        LOBYTE(v48) = 0;
        sub_24CACDD00();
        uint64_t v29 = v46;
        sub_24CAE6120();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v17, v15);
        return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v21, v29);
      }
    default:
      LOBYTE(v48) = 2;
      sub_24CACDC58();
      char v24 = v37;
      uint64_t v25 = v46;
      sub_24CAE6120();
      uint64_t v48 = v22;
      sub_24CABCD84();
      uint64_t v26 = v39;
      sub_24CAE6180();
      uint64_t v27 = v38;
LABEL_5:
      (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v26);
      return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v21, v25);
  }
}

uint64_t WaterDepth.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v58 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B308);
  uint64_t v51 = *(void *)(v3 - 8);
  uint64_t v52 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v55 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B310);
  uint64_t v53 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  id v57 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B318);
  uint64_t v49 = *(void *)(v6 - 8);
  uint64_t v50 = v6;
  MEMORY[0x270FA5388](v6);
  char v56 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B320);
  uint64_t v47 = *(void *)(v8 - 8);
  uint64_t v48 = v8;
  MEMORY[0x270FA5388](v8);
  os_log_type_t v54 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B328);
  uint64_t v45 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B330);
  uint64_t v44 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  double v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B338);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = a1[3];
  uint64_t v59 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v19);
  sub_24CACDB08();
  uint64_t v20 = v60;
  sub_24CAE6270();
  if (v20) {
    goto LABEL_6;
  }
  uint64_t v41 = v12;
  uint64_t v42 = v11;
  uint64_t v22 = v56;
  uint64_t v21 = v57;
  uint64_t v60 = v16;
  uint64_t v23 = v58;
  uint64_t v24 = sub_24CAE6110();
  if (*(void *)(v24 + 16) != 1)
  {
    uint64_t v27 = sub_24CAE5F90();
    swift_allocError();
    uint64_t v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AC48);
    *uint64_t v29 = &type metadata for WaterDepth;
    sub_24CAE60A0();
    sub_24CAE5F80();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v27 - 8) + 104))(v29, *MEMORY[0x263F8DCB0], v27);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v60 + 8))(v18, v15);
LABEL_6:
    uint64_t v30 = (uint64_t)v59;
    return __swift_destroy_boxed_opaque_existential_0(v30);
  }
  switch(*(unsigned char *)(v24 + 32))
  {
    case 1:
      LOBYTE(v61) = 1;
      sub_24CACDCAC();
      uint64_t v32 = v42;
      sub_24CAE6090();
      (*(void (**)(char *, uint64_t))(v45 + 8))(v32, v43);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v18, v15);
      char v26 = 3;
      uint64_t v25 = 1;
      break;
    case 2:
      LOBYTE(v61) = 2;
      sub_24CACDC58();
      uint64_t v33 = v54;
      sub_24CAE6090();
      sub_24CABCDD8();
      uint64_t v34 = v48;
      sub_24CAE6100();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v33, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v18, v15);
      char v26 = 0;
      uint64_t v25 = v61;
      break;
    case 3:
      LOBYTE(v61) = 3;
      sub_24CACDC04();
      sub_24CAE6090();
      sub_24CABCDD8();
      uint64_t v35 = v50;
      sub_24CAE6100();
      uint64_t v36 = v60;
      (*(void (**)(char *, uint64_t))(v49 + 8))(v22, v35);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v18, v15);
      uint64_t v25 = v61;
      char v26 = 1;
      break;
    case 4:
      LOBYTE(v61) = 4;
      sub_24CACDBB0();
      sub_24CAE6090();
      sub_24CABCDD8();
      uint64_t v37 = v46;
      sub_24CAE6100();
      uint64_t v38 = v60;
      (*(void (**)(char *, uint64_t))(v53 + 8))(v21, v37);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v18, v15);
      uint64_t v25 = v61;
      char v26 = 2;
      break;
    case 5:
      LOBYTE(v61) = 5;
      sub_24CACDB5C();
      uint64_t v39 = v55;
      sub_24CAE6090();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v39, v52);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v18, v15);
      char v26 = 3;
      uint64_t v25 = 2;
      break;
    default:
      LOBYTE(v61) = 0;
      sub_24CACDD00();
      sub_24CAE6090();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v14, v41);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v18, v15);
      uint64_t v25 = 0;
      char v26 = 3;
      break;
  }
  uint64_t v30 = (uint64_t)v59;
  *(void *)uint64_t v23 = v25;
  *(unsigned char *)(v23 + 8) = v26;
  return __swift_destroy_boxed_opaque_existential_0(v30);
}

BOOL sub_24CACD618(uint64_t a1, uint64_t a2)
{
  return sub_24CACB4AC(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

BOOL sub_24CACD630(uint64_t a1, uint64_t a2)
{
  return sub_24CACB600(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

uint64_t sub_24CACD648(uint64_t a1, uint64_t a2)
{
  return sub_24CACB768(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

uint64_t sub_24CACD660@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return WaterDepth.init(from:)(a1, a2);
}

uint64_t sub_24CACD678(void *a1)
{
  return WaterDepth.encode(to:)(a1);
}

DepthCore::DepthUnit_optional __swiftcall DepthUnit.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *uint64_t v1 = v2;
  return (DepthCore::DepthUnit_optional)rawValue;
}

uint64_t DepthUnit.rawValue.getter()
{
  return *v0;
}

void *sub_24CACD6B8@<X0>(void *result@<X0>, char *a2@<X8>)
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

void sub_24CACD6D8(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL static WaterType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t WaterType.hash(into:)()
{
  return sub_24CAE6250();
}

uint64_t WaterType.hashValue.getter()
{
  return sub_24CAE6260();
}

BOOL static Pressure.PressureUnit.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Pressure.PressureUnit.hash(into:)()
{
  return sub_24CAE6250();
}

uint64_t Pressure.PressureUnit.hashValue.getter()
{
  return sub_24CAE6260();
}

DepthCore::Pressure __swiftcall Pressure.init(value:unit:)(DepthCore::Pressure value, DepthCore::Pressure::PressureUnit unit)
{
  if (*(unsigned char *)unit) {
    value.canonicalValue = value.canonicalValue * 1000.0;
  }
  *char v2 = value.canonicalValue;
  return value;
}

Swift::Double __swiftcall Pressure.depthValue(forUnit:waterType:)(DepthCore::DepthUnit forUnit, DepthCore::WaterType waterType)
{
  Swift::Double result = *v2 / dbl_24CAE9A40[*(char *)waterType];
  if (!*(unsigned char *)forUnit) {
    return result / 3.2808399;
  }
  return result;
}

Swift::Double __swiftcall Pressure.value(forUnit:)(DepthCore::Pressure::PressureUnit forUnit)
{
  Swift::Double result = *v1;
  if (*(unsigned char *)forUnit) {
    return *v1 / 1000.0;
  }
  return result;
}

double static Pressure.pressure(forDepthValue:unit:waterType:)@<D0>(unsigned char *a1@<X0>, char *a2@<X1>, double *a3@<X8>, double a4@<D0>)
{
  double v4 = 0.3048;
  if (*a1) {
    double v4 = 1.0;
  }
  double result = v4 * (dbl_24CAE9A40[*a2] * a4);
  *a3 = result;
  return result;
}

CMWaterSubmersionDepthState __swiftcall SubmersionStateTransform.callAsFunction(depth:)(DepthCore::DepthValue depth)
{
  double v3 = *(double *)result;
  if (*(double *)result < *v2) {
    return 200;
  }
  double v4 = v2[1];
  if (v4 < *v2)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  if (v3 < v4) {
    return 300;
  }
  double v5 = v2[2];
  if (v5 < v4) {
    goto LABEL_11;
  }
  if (v3 >= v5) {
    return 600;
  }
  else {
    return 500;
  }
}

uint64_t _s9DepthCore05WaterA0O2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)a2;
  int v4 = *(unsigned __int8 *)(a2 + 8);
  switch(*(unsigned char *)(a1 + 8))
  {
    case 1:
      if (v4 == 1) {
        return vabdd_f64(v2, v3) <= 0.0001;
      }
      return 0;
    case 2:
      if (v4 == 2) {
        return vabdd_f64(v2, v3) <= 0.0001;
      }
      return 0;
    case 3:
      if (v2 == 0.0)
      {
        if (v4 != 3 || *(void *)&v3 != 0) {
          return 0;
        }
      }
      else if (*(void *)&v2 == 1)
      {
        if (v4 != 3 || *(void *)&v3 != 1) {
          return 0;
        }
      }
      else if (v4 != 3 || *(void *)&v3 != 2)
      {
        return 0;
      }
      return 1;
    default:
      if (*(unsigned char *)(a2 + 8)) {
        return 0;
      }
      return vabdd_f64(v2, v3) <= 0.0001;
  }
}

BOOL _s9DepthCore05WaterA0O1loiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)a2;
  int v4 = *(unsigned __int8 *)(a2 + 8);
  switch(*(unsigned char *)(a1 + 8))
  {
    case 1:
      if (v4 == 1) {
        return vabdd_f64(v2, v3) > 0.0001 && v2 < v3;
      }
      unint64_t v5 = 3;
      goto LABEL_27;
    case 2:
      if (v4 == 2) {
        return vabdd_f64(v2, v3) > 0.0001 && v2 < v3;
      }
      unint64_t v5 = 4;
      goto LABEL_27;
    case 3:
      if (v2 == 0.0)
      {
        if (v4 != 3 || *(void *)&v3 != 0)
        {
          unint64_t v5 = 0;
          goto LABEL_27;
        }
      }
      else if (*(void *)&v2 == 1)
      {
        if (v4 != 3 || *(void *)&v3 != 1)
        {
          unint64_t v5 = 1;
          goto LABEL_27;
        }
      }
      else if (v4 != 3 || *(void *)&v3 != 2)
      {
        unint64_t v5 = 5;
        goto LABEL_27;
      }
      return 0;
    default:
      if (*(unsigned char *)(a2 + 8))
      {
        unint64_t v5 = 2;
LABEL_27:
        unint64_t v10 = 2;
        switch(*(unsigned char *)(a2 + 8))
        {
          case 1:
            unint64_t v10 = 3;
            break;
          case 2:
            unint64_t v10 = 4;
            break;
          case 3:
            unint64_t v10 = qword_24CAE9A58[*(void *)&v3];
            break;
          default:
            return v5 < v10;
        }
        return v5 < v10;
      }
      else
      {
        return vabdd_f64(v2, v3) > 0.0001 && v2 < v3;
      }
  }
}

unint64_t sub_24CACDB08()
{
  unint64_t result = qword_26980B2D0;
  if (!qword_26980B2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B2D0);
  }
  return result;
}

unint64_t sub_24CACDB5C()
{
  unint64_t result = qword_26980B2D8;
  if (!qword_26980B2D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B2D8);
  }
  return result;
}

unint64_t sub_24CACDBB0()
{
  unint64_t result = qword_26980B2E0;
  if (!qword_26980B2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B2E0);
  }
  return result;
}

unint64_t sub_24CACDC04()
{
  unint64_t result = qword_26980B2E8;
  if (!qword_26980B2E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B2E8);
  }
  return result;
}

unint64_t sub_24CACDC58()
{
  unint64_t result = qword_26980B2F0;
  if (!qword_26980B2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B2F0);
  }
  return result;
}

unint64_t sub_24CACDCAC()
{
  unint64_t result = qword_26980B2F8;
  if (!qword_26980B2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B2F8);
  }
  return result;
}

unint64_t sub_24CACDD00()
{
  unint64_t result = qword_26980B300;
  if (!qword_26980B300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B300);
  }
  return result;
}

unint64_t sub_24CACDD58()
{
  unint64_t result = qword_26980B340;
  if (!qword_26980B340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B340);
  }
  return result;
}

unint64_t sub_24CACDDB0()
{
  unint64_t result = qword_26980B348;
  if (!qword_26980B348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B348);
  }
  return result;
}

unint64_t sub_24CACDE08()
{
  unint64_t result = qword_26980B350;
  if (!qword_26980B350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B350);
  }
  return result;
}

unint64_t sub_24CACDE60()
{
  unint64_t result = qword_26980B358;
  if (!qword_26980B358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B358);
  }
  return result;
}

unint64_t sub_24CACDEB8()
{
  unint64_t result = qword_26980B360;
  if (!qword_26980B360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B360);
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthValue()
{
  return &type metadata for DepthValue;
}

uint64_t getEnumTagSinglePayload for WaterDepth(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WaterDepth(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24CACDFA8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_24CACDFC0(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)unint64_t result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for WaterDepth()
{
  return &type metadata for WaterDepth;
}

ValueMetadata *type metadata accessor for DepthUnit()
{
  return &type metadata for DepthUnit;
}

unsigned char *storeEnumTagSinglePayload for WaterType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CACE0C8);
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

ValueMetadata *type metadata accessor for WaterType()
{
  return &type metadata for WaterType;
}

ValueMetadata *type metadata accessor for Pressure()
{
  return &type metadata for Pressure;
}

unsigned char *_s9DepthCore9DepthUnitOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CACE1DCLL);
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

ValueMetadata *type metadata accessor for Pressure.PressureUnit()
{
  return &type metadata for Pressure.PressureUnit;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for DepthTransform(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DepthTransform(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for DepthTransform()
{
  return &type metadata for DepthTransform;
}

ValueMetadata *type metadata accessor for SubmersionStateTransform()
{
  return &type metadata for SubmersionStateTransform;
}

unsigned char *storeEnumTagSinglePayload for WaterDepth.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CACE360);
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

ValueMetadata *type metadata accessor for WaterDepth.CodingKeys()
{
  return &type metadata for WaterDepth.CodingKeys;
}

ValueMetadata *type metadata accessor for WaterDepth.UnknownCodingKeys()
{
  return &type metadata for WaterDepth.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for WaterDepth.NotSubmergedCodingKeys()
{
  return &type metadata for WaterDepth.NotSubmergedCodingKeys;
}

ValueMetadata *type metadata accessor for WaterDepth.ShallowCodingKeys()
{
  return &type metadata for WaterDepth.ShallowCodingKeys;
}

ValueMetadata *type metadata accessor for WaterDepth.NominalCodingKeys()
{
  return &type metadata for WaterDepth.NominalCodingKeys;
}

ValueMetadata *type metadata accessor for WaterDepth.DepthExceedingNominalRangeCodingKeys()
{
  return &type metadata for WaterDepth.DepthExceedingNominalRangeCodingKeys;
}

ValueMetadata *type metadata accessor for WaterDepth.DepthExceedingSensorLimitCodingKeys()
{
  return &type metadata for WaterDepth.DepthExceedingSensorLimitCodingKeys;
}

unsigned char *_s9DepthCore10WaterDepthO17ShallowCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CACE498);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthValue.CodingKeys()
{
  return &type metadata for DepthValue.CodingKeys;
}

unint64_t sub_24CACE4D4()
{
  unint64_t result = qword_26980B368;
  if (!qword_26980B368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B368);
  }
  return result;
}

unint64_t sub_24CACE52C()
{
  unint64_t result = qword_26980B370;
  if (!qword_26980B370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B370);
  }
  return result;
}

unint64_t sub_24CACE584()
{
  unint64_t result = qword_26980B378;
  if (!qword_26980B378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B378);
  }
  return result;
}

unint64_t sub_24CACE5DC()
{
  unint64_t result = qword_26980B380;
  if (!qword_26980B380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B380);
  }
  return result;
}

unint64_t sub_24CACE634()
{
  unint64_t result = qword_26980B388;
  if (!qword_26980B388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B388);
  }
  return result;
}

unint64_t sub_24CACE68C()
{
  unint64_t result = qword_26980B390;
  if (!qword_26980B390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B390);
  }
  return result;
}

unint64_t sub_24CACE6E4()
{
  unint64_t result = qword_26980B398;
  if (!qword_26980B398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B398);
  }
  return result;
}

unint64_t sub_24CACE73C()
{
  unint64_t result = qword_26980B3A0;
  if (!qword_26980B3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B3A0);
  }
  return result;
}

unint64_t sub_24CACE794()
{
  unint64_t result = qword_26980B3A8;
  if (!qword_26980B3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B3A8);
  }
  return result;
}

unint64_t sub_24CACE7EC()
{
  unint64_t result = qword_26980B3B0;
  if (!qword_26980B3B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B3B0);
  }
  return result;
}

unint64_t sub_24CACE844()
{
  unint64_t result = qword_26980B3B8;
  if (!qword_26980B3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B3B8);
  }
  return result;
}

unint64_t sub_24CACE89C()
{
  unint64_t result = qword_26980B3C0;
  if (!qword_26980B3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B3C0);
  }
  return result;
}

unint64_t sub_24CACE8F4()
{
  unint64_t result = qword_26980B3C8;
  if (!qword_26980B3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B3C8);
  }
  return result;
}

unint64_t sub_24CACE94C()
{
  unint64_t result = qword_26980B3D0;
  if (!qword_26980B3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B3D0);
  }
  return result;
}

unint64_t sub_24CACE9A4()
{
  unint64_t result = qword_26980B3D8;
  if (!qword_26980B3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B3D8);
  }
  return result;
}

unint64_t sub_24CACE9FC()
{
  unint64_t result = qword_26980B3E0;
  if (!qword_26980B3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B3E0);
  }
  return result;
}

unint64_t sub_24CACEA54()
{
  unint64_t result = qword_26980B3E8;
  if (!qword_26980B3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B3E8);
  }
  return result;
}

unint64_t sub_24CACEAAC()
{
  unint64_t result = qword_26980B3F0;
  if (!qword_26980B3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B3F0);
  }
  return result;
}

unint64_t sub_24CACEB04()
{
  unint64_t result = qword_26980B3F8;
  if (!qword_26980B3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B3F8);
  }
  return result;
}

unint64_t sub_24CACEB5C()
{
  unint64_t result = qword_26980B400;
  if (!qword_26980B400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B400);
  }
  return result;
}

unint64_t sub_24CACEBB4()
{
  unint64_t result = qword_26980B408;
  if (!qword_26980B408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B408);
  }
  return result;
}

uint64_t sub_24CACEC08(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D627553746F6ELL && a2 == 0xEC00000064656772 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x776F6C6C616873 && a2 == 0xE700000000000000 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C616E696D6F6ELL && a2 == 0xE700000000000000 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x800000024CAEBE10 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000024CAEBE30)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

double UnderwaterTime.timeIntervalUntilNow.getter()
{
  uint64_t v0 = sub_24CAE5730();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  BOOL v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CAE5720();
  double v4 = UnderwaterTime.timeInterval(untilDate:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

double UnderwaterTime.timeInterval(untilDate:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UnderwaterTime();
  MEMORY[0x270FA5388](v2);
  double v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24CAE5730();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v22 - v11;
  MEMORY[0x270FA5388](v10);
  double v14 = (char *)&v22 - v13;
  sub_24CAA2454(v1, (uint64_t)v4);
  double v15 = 0.0;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
      uint64_t v16 = &v4[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
      uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v17(v14, v4, v5);
      v17(v12, v16, v5);
      sub_24CAE56C0();
      double v15 = v18;
      uint64_t v19 = *(void (**)(char *, uint64_t))(v6 + 8);
      v19(v12, v5);
      v19(v14, v5);
      break;
    case 3u:
      return v15;
    default:
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v4, v5);
      sub_24CAE56C0();
      double v15 = v20;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      break;
  }
  return v15;
}

uint64_t type metadata accessor for UnderwaterTime()
{
  uint64_t result = qword_26980B488;
  if (!qword_26980B488) {
    return swift_getSingletonMetadata();
  }
  return result;
}

BOOL UnderwaterTime.isActive.getter()
{
  uint64_t v1 = type metadata accessor for UnderwaterTime();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CAA2454(v0, (uint64_t)v3);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    sub_24CACF304((uint64_t)v3);
  }
  else
  {
    uint64_t v5 = sub_24CAE5730();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v3, v5);
  }
  return EnumCaseMultiPayload == 0;
}

uint64_t sub_24CACF304(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UnderwaterTime();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL UnderwaterTime.isTentative.getter()
{
  uint64_t v1 = type metadata accessor for UnderwaterTime();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CAA2454(v0, (uint64_t)v3);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = &v3[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
    uint64_t v6 = sub_24CAE5730();
    uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
    v7(v5, v6);
    v7(v3, v6);
  }
  else
  {
    sub_24CACF304((uint64_t)v3);
  }
  return EnumCaseMultiPayload == 1;
}

uint64_t UnderwaterTime.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for UnderwaterTime();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CAA2454(v2, (uint64_t)v6);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
      uint64_t v7 = &v6[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
      uint64_t v8 = sub_24CAE5730();
      uint64_t v9 = *(void *)(v8 - 8);
      (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v6, v8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v7, v8);
      break;
    case 3u:
      uint64_t v13 = sub_24CAE5730();
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a1, 1, 1, v13);
      break;
    default:
      uint64_t v11 = sub_24CAE5730();
      uint64_t v12 = *(void *)(v11 - 8);
      (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(a1, v6, v11);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
      break;
  }
  return result;
}

uint64_t UnderwaterTime.endDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for UnderwaterTime();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CAA2454(v2, (uint64_t)v6);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
      uint64_t v7 = &v6[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
      uint64_t v8 = sub_24CAE5730();
      uint64_t v9 = *(void *)(v8 - 8);
      (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v7, v8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v6, v8);
      break;
    case 3u:
      uint64_t v13 = sub_24CAE5730();
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a1, 1, 1, v13);
      break;
    default:
      uint64_t v11 = sub_24CAE5730();
      uint64_t v12 = *(void *)(v11 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(a1, 1, 1, v11);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v6, v11);
      break;
  }
  return result;
}

uint64_t UnderwaterTime.asTentative(usingEndDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UnderwaterTime();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CAA2454(v3, (uint64_t)v9);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v11 = 1;
  switch(EnumCaseMultiPayload)
  {
    case 1:
    case 2:
      uint64_t v12 = &v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
      uint64_t v13 = sub_24CAE5730();
      uint64_t v14 = *(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8);
      v14(v12, v13);
      v14(v9, v13);
      uint64_t v11 = 1;
      break;
    case 3:
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, v11, 1, v6);
    default:
      uint64_t v15 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48);
      uint64_t v16 = sub_24CAE5730();
      uint64_t v17 = *(void *)(v16 - 8);
      (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a2, v9, v16);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, a1, v16);
      swift_storeEnumTagMultiPayload();
      uint64_t v11 = 0;
      break;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, v11, 1, v6);
}

uint64_t UnderwaterTime.makeTentative(usingEndDate:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UnderwaterTime();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - v7;
  sub_24CAA2454(v1, (uint64_t)v6);
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 1:
    case 2:
      uint64_t v10 = &v6[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
      uint64_t v11 = sub_24CAE5730();
      uint64_t v12 = *(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);
      v12(v10, v11);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v12)(v6, v11);
      break;
    case 3:
      return result;
    default:
      uint64_t v13 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
      uint64_t v14 = sub_24CAE5730();
      uint64_t v15 = *(void *)(v14 - 8);
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v8, v6, v14);
      (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a1, v14);
      swift_storeEnumTagMultiPayload();
      sub_24CACF304(v1);
      uint64_t result = sub_24CACFD44((uint64_t)v8, v1);
      break;
  }
  return result;
}

uint64_t sub_24CACFD44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnderwaterTime();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t UnderwaterTime.complete(withEndDate:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UnderwaterTime();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CAA2454(v1, (uint64_t)v5);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_24CACF304(v1);
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
      uint64_t v14 = &v5[*(int *)(v13 + 48)];
      uint64_t v15 = sub_24CAE5730();
      uint64_t v16 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v15 - 8) + 32);
      v16(v1, v5, v15);
      v16(v1 + *(int *)(v13 + 48), v14, v15);
      return swift_storeEnumTagMultiPayload();
    case 2u:
      uint64_t v9 = &v5[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
      uint64_t v10 = sub_24CAE5730();
      uint64_t v11 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);
      v11(v9, v10);
      return ((uint64_t (*)(char *, uint64_t))v11)(v5, v10);
    case 3u:
      sub_24CACF304(v1);
      return swift_storeEnumTagMultiPayload();
    default:
      sub_24CACF304(v1);
      uint64_t v6 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48);
      uint64_t v7 = sub_24CAE5730();
      uint64_t v8 = *(void *)(v7 - 8);
      (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v1, v5, v7);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, a1, v7);
      return swift_storeEnumTagMultiPayload();
  }
}

uint64_t sub_24CAD0020(char a1)
{
  return *(void *)&aZero_3[8 * a1];
}

uint64_t sub_24CAD0040(char a1)
{
  if (a1) {
    return 0x65746144646E65;
  }
  else {
    return 0x7461447472617473;
  }
}

uint64_t sub_24CAD0080@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CAD331C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24CAD00AC(uint64_t a1)
{
  unint64_t v2 = sub_24CAD1F0C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAD00E8(uint64_t a1)
{
  unint64_t v2 = sub_24CAD1F0C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CAD0124()
{
  return sub_24CAD0020(*v0);
}

uint64_t sub_24CAD012C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CAD33C8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CAD0154(uint64_t a1)
{
  unint64_t v2 = sub_24CAD1E10();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAD0190(uint64_t a1)
{
  unint64_t v2 = sub_24CAD1E10();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CAD01CC()
{
  return sub_24CAD0040(*v0);
}

uint64_t sub_24CAD01D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CAD3564(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CAD01FC(uint64_t a1)
{
  unint64_t v2 = sub_24CAD1E64();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAD0238(uint64_t a1)
{
  unint64_t v2 = sub_24CAD1E64();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CAD0274(uint64_t a1)
{
  unint64_t v2 = sub_24CAD1EB8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAD02B0(uint64_t a1)
{
  unint64_t v2 = sub_24CAD1EB8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CAD02EC(uint64_t a1)
{
  unint64_t v2 = sub_24CAD1F60();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAD0328(uint64_t a1)
{
  unint64_t v2 = sub_24CAD1F60();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UnderwaterTime.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B410);
  uint64_t v64 = *(void *)(v2 - 8);
  uint64_t v65 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v63 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B418);
  uint64_t v61 = *(void *)(v4 - 8);
  uint64_t v62 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v60 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B420);
  uint64_t v58 = *(void *)(v6 - 8);
  uint64_t v59 = v6;
  MEMORY[0x270FA5388](v6);
  id v57 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24CAE5730();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v70 = v8;
  uint64_t v71 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  double v69 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  double v67 = (char *)&v56 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v68 = (char *)&v56 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  id v66 = (char *)&v56 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v56 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B428);
  uint64_t v56 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v56 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for UnderwaterTime();
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v56 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B430);
  uint64_t v74 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  uint64_t v27 = (char *)&v56 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CAD1E10();
  int v72 = v27;
  sub_24CAE6280();
  sub_24CAA2454(v75, (uint64_t)v25);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v35 = &v25[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
      uint64_t v37 = v70;
      uint64_t v36 = v71;
      uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v71 + 32);
      uint64_t v39 = v66;
      v38(v66, v25, v70);
      v38(v68, v35, v37);
      char v81 = 2;
      sub_24CAD1EB8();
      uint64_t v40 = v60;
      uint64_t v41 = v72;
      sub_24CAE6120();
      char v80 = 0;
      sub_24CAD1FB4(&qword_26980B098);
      uint64_t v42 = v62;
      uint64_t v43 = v73;
      sub_24CAE6180();
      if (v43)
      {
        (*(void (**)(char *, uint64_t))(v61 + 8))(v40, v42);
        uint64_t v44 = *(void (**)(char *, uint64_t))(v36 + 8);
        v44(v68, v37);
        goto LABEL_7;
      }
      char v79 = 1;
      os_log_type_t v54 = v68;
      sub_24CAE6180();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v40, v42);
      uint64_t v44 = *(void (**)(char *, uint64_t))(v36 + 8);
      v44(v54, v37);
      uint64_t v51 = v66;
      goto LABEL_11;
    case 2u:
      uint64_t v45 = &v25[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48)];
      uint64_t v37 = v70;
      uint64_t v46 = v71;
      uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v71 + 32);
      uint64_t v39 = v67;
      v47(v67, v25, v70);
      v47(v69, v45, v37);
      char v84 = 3;
      sub_24CAD1E64();
      uint64_t v48 = v63;
      uint64_t v41 = v72;
      sub_24CAE6120();
      char v83 = 0;
      sub_24CAD1FB4(&qword_26980B098);
      uint64_t v49 = v65;
      uint64_t v50 = v73;
      sub_24CAE6180();
      if (v50)
      {
        (*(void (**)(char *, uint64_t))(v64 + 8))(v48, v49);
        uint64_t v44 = *(void (**)(char *, uint64_t))(v46 + 8);
        v44(v69, v37);
LABEL_7:
        uint64_t v51 = v39;
      }
      else
      {
        char v82 = 1;
        uint64_t v55 = v69;
        sub_24CAE6180();
        (*(void (**)(char *, uint64_t))(v64 + 8))(v48, v49);
        uint64_t v44 = *(void (**)(char *, uint64_t))(v46 + 8);
        v44(v55, v37);
        uint64_t v51 = v67;
      }
LABEL_11:
      v44(v51, v37);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v41, v76);
      break;
    case 3u:
      char v77 = 0;
      sub_24CAD1F60();
      uint64_t v52 = v76;
      uint64_t v53 = v72;
      sub_24CAE6120();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v22, v20);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v53, v52);
      break;
    default:
      uint64_t v29 = v70;
      uint64_t v28 = v71;
      (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v19, v25, v70);
      char v78 = 1;
      sub_24CAD1F0C();
      uint64_t v30 = v57;
      uint64_t v31 = v76;
      uint64_t v32 = v72;
      sub_24CAE6120();
      sub_24CAD1FB4(&qword_26980B098);
      uint64_t v33 = v59;
      sub_24CAE6180();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v30, v33);
      (*(void (**)(char *, uint64_t))(v28 + 8))(v19, v29);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v32, v31);
      break;
  }
  return result;
}

uint64_t UnderwaterTime.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v65 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B460);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v63 = v3;
  uint64_t v64 = v4;
  MEMORY[0x270FA5388](v3);
  int v72 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B468);
  uint64_t v71 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v70 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B470);
  uint64_t v60 = *(void *)(v7 - 8);
  uint64_t v61 = v7;
  MEMORY[0x270FA5388](v7);
  double v67 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B478);
  uint64_t v58 = *(void *)(v9 - 8);
  uint64_t v59 = v9;
  MEMORY[0x270FA5388](v9);
  id v66 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B480);
  uint64_t v68 = *(void *)(v11 - 8);
  uint64_t v69 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for UnderwaterTime();
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v54 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v54 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v54 - v24;
  uint64_t v26 = a1[3];
  uint64_t v73 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v26);
  sub_24CAD1E10();
  uint64_t v27 = (uint64_t)v74;
  sub_24CAE6270();
  if (v27) {
    goto LABEL_10;
  }
  uint64_t v55 = v23;
  uint64_t v56 = v20;
  id v57 = v17;
  uint64_t v28 = v70;
  uint64_t v29 = v71;
  uint64_t v30 = v72;
  uint64_t v74 = v25;
  uint64_t v31 = v69;
  uint64_t v32 = sub_24CAE6110();
  if (*(void *)(v32 + 16) != 1)
  {
    uint64_t v37 = sub_24CAE5F90();
    swift_allocError();
    uint64_t v38 = v13;
    uint64_t v40 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AC48);
    uint64_t *v40 = v14;
    sub_24CAE60A0();
    sub_24CAE5F80();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v37 - 8) + 104))(v40, *MEMORY[0x263F8DCB0], v37);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v68 + 8))(v38, v31);
LABEL_10:
    uint64_t v35 = (uint64_t)v73;
    return __swift_destroy_boxed_opaque_existential_0(v35);
  }
  uint64_t v54 = v32;
  switch(*(unsigned char *)(v32 + 32))
  {
    case 1:
      char v76 = 1;
      sub_24CAD1F0C();
      uint64_t v41 = v67;
      sub_24CAE6090();
      sub_24CAE5730();
      sub_24CAD1FB4(&qword_26980B0C0);
      uint64_t v42 = (uint64_t)v55;
      uint64_t v43 = v61;
      sub_24CAE6100();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v41, v43);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v68 + 8))(v13, v31);
      uint64_t v35 = (uint64_t)v73;
      swift_storeEnumTagMultiPayload();
      uint64_t v34 = (uint64_t)v74;
      sub_24CACFD44(v42, (uint64_t)v74);
      uint64_t v36 = v65;
      break;
    case 2:
      uint64_t v44 = v29;
      char v79 = 2;
      sub_24CAD1EB8();
      sub_24CAE6090();
      double v67 = v13;
      sub_24CAE5730();
      char v78 = 0;
      sub_24CAD1FB4(&qword_26980B0C0);
      uint64_t v45 = v28;
      uint64_t v46 = (uint64_t)v56;
      uint64_t v47 = v62;
      sub_24CAE6100();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
      char v77 = 1;
      sub_24CAE6100();
      uint64_t v51 = v68;
      (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v47);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v67, v31);
      swift_storeEnumTagMultiPayload();
      uint64_t v53 = v46;
      uint64_t v34 = (uint64_t)v74;
      sub_24CACFD44(v53, (uint64_t)v74);
      goto LABEL_5;
    case 3:
      char v82 = 3;
      sub_24CAD1E64();
      sub_24CAE6090();
      uint64_t v71 = v14;
      double v67 = v13;
      sub_24CAE5730();
      char v81 = 0;
      sub_24CAD1FB4(&qword_26980B0C0);
      uint64_t v49 = (uint64_t)v57;
      uint64_t v50 = v63;
      sub_24CAE6100();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
      char v80 = 1;
      sub_24CAE6100();
      uint64_t v52 = v68;
      (*(void (**)(char *, uint64_t))(v64 + 8))(v30, v50);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v67, v31);
      swift_storeEnumTagMultiPayload();
      uint64_t v34 = (uint64_t)v74;
      sub_24CACFD44(v49, (uint64_t)v74);
      uint64_t v35 = (uint64_t)v73;
      uint64_t v36 = v65;
      break;
    default:
      char v75 = 0;
      sub_24CAD1F60();
      uint64_t v33 = v66;
      sub_24CAE6090();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v33, v59);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v68 + 8))(v13, v31);
      uint64_t v34 = (uint64_t)v74;
      swift_storeEnumTagMultiPayload();
LABEL_5:
      uint64_t v35 = (uint64_t)v73;
      uint64_t v36 = v65;
      break;
  }
  sub_24CACFD44(v34, v36);
  return __swift_destroy_boxed_opaque_existential_0(v35);
}

uint64_t sub_24CAD171C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return UnderwaterTime.init(from:)(a1, a2);
}

uint64_t sub_24CAD1734(void *a1)
{
  return UnderwaterTime.encode(to:)(a1);
}

uint64_t _s9DepthCore14UnderwaterTimeO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CAE5730();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v71 = v4;
  uint64_t v72 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  double v67 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v70 = (char *)&v65 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v68 = (char *)&v65 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  id v66 = (char *)&v65 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v69 = (char *)&v65 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v65 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v65 - v19;
  uint64_t v21 = type metadata accessor for UnderwaterTime();
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v65 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)&v65 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v65 - v28;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B508);
  uint64_t v31 = MEMORY[0x270FA5388](v30 - 8);
  uint64_t v33 = (char *)&v65 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = (uint64_t)&v33[*(int *)(v31 + 56)];
  sub_24CAA2454(a1, (uint64_t)v33);
  sub_24CAA2454(a2, v34);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_24CAA2454((uint64_t)v33, (uint64_t)v27);
      uint64_t v47 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48);
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        uint64_t v59 = *(void (**)(char *, uint64_t))(v72 + 8);
        uint64_t v60 = v71;
        v59(&v27[v47], v71);
        v59(v27, v60);
        goto LABEL_14;
      }
      uint64_t v48 = v34 + v47;
      uint64_t v49 = v72;
      uint64_t v50 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 32);
      uint64_t v51 = v34;
      uint64_t v52 = v71;
      v50(v18, v51, v71);
      v50(v69, (uint64_t)&v27[v47], v52);
      uint64_t v53 = v66;
      v50(v66, v48, v52);
      char v54 = sub_24CAE5700();
      uint64_t v55 = *(void (**)(char *, uint64_t))(v49 + 8);
      v55(v27, v52);
      if (v54)
      {
        uint64_t v56 = v69;
        char v46 = sub_24CAE5700();
        v55(v53, v52);
        v55(v56, v52);
        v55(v18, v52);
        goto LABEL_17;
      }
      v55(v53, v52);
      v55(v69, v52);
      v55(v18, v52);
      goto LABEL_21;
    case 2u:
      sub_24CAA2454((uint64_t)v33, (uint64_t)v24);
      uint64_t v35 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48);
      if (swift_getEnumCaseMultiPayload() != 2)
      {
        id v57 = *(void (**)(char *, uint64_t))(v72 + 8);
        uint64_t v58 = v71;
        v57(&v24[v35], v71);
        v57(v24, v58);
        goto LABEL_14;
      }
      uint64_t v36 = v34 + v35;
      uint64_t v37 = v72;
      uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 32);
      uint64_t v39 = v68;
      uint64_t v40 = v34;
      uint64_t v41 = v71;
      v38(v68, v40, v71);
      v38(v70, (uint64_t)&v24[v35], v41);
      uint64_t v42 = v67;
      v38(v67, v36, v41);
      char v43 = sub_24CAE5700();
      uint64_t v44 = *(void (**)(char *, uint64_t))(v37 + 8);
      v44(v24, v41);
      if (v43)
      {
        uint64_t v45 = v70;
        char v46 = sub_24CAE5700();
        v44(v42, v41);
        v44(v45, v41);
        v44(v39, v41);
        goto LABEL_17;
      }
      v44(v42, v41);
      v44(v70, v41);
      v44(v39, v41);
LABEL_21:
      sub_24CACF304((uint64_t)v33);
      goto LABEL_15;
    case 3u:
      if (swift_getEnumCaseMultiPayload() != 3) {
        goto LABEL_14;
      }
      sub_24CACF304((uint64_t)v33);
      char v46 = 1;
      return v46 & 1;
    default:
      sub_24CAA2454((uint64_t)v33, (uint64_t)v29);
      if (swift_getEnumCaseMultiPayload())
      {
        (*(void (**)(char *, uint64_t))(v72 + 8))(v29, v71);
LABEL_14:
        sub_24CAD3658((uint64_t)v33);
LABEL_15:
        char v46 = 0;
      }
      else
      {
        uint64_t v62 = v71;
        uint64_t v61 = v72;
        (*(void (**)(char *, uint64_t, uint64_t))(v72 + 32))(v20, v34, v71);
        char v46 = sub_24CAE5700();
        uint64_t v63 = *(void (**)(char *, uint64_t))(v61 + 8);
        v63(v20, v62);
        v63(v29, v62);
LABEL_17:
        sub_24CACF304((uint64_t)v33);
      }
      return v46 & 1;
  }
}

unint64_t sub_24CAD1E10()
{
  unint64_t result = qword_26980B438;
  if (!qword_26980B438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B438);
  }
  return result;
}

unint64_t sub_24CAD1E64()
{
  unint64_t result = qword_26980B440;
  if (!qword_26980B440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B440);
  }
  return result;
}

unint64_t sub_24CAD1EB8()
{
  unint64_t result = qword_26980B448;
  if (!qword_26980B448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B448);
  }
  return result;
}

unint64_t sub_24CAD1F0C()
{
  unint64_t result = qword_26980B450;
  if (!qword_26980B450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B450);
  }
  return result;
}

unint64_t sub_24CAD1F60()
{
  unint64_t result = qword_26980B458;
  if (!qword_26980B458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B458);
  }
  return result;
}

uint64_t sub_24CAD1FB4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24CAE5730();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for UnderwaterTime(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = sub_24CAE5730();
      uint64_t v11 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16);
      v11(a1, a2, v10);
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
      v11((uint64_t *)((char *)a1 + *(int *)(v12 + 48)), (uint64_t *)((char *)a2 + *(int *)(v12 + 48)), v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_24CAE5730();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for UnderwaterTime(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2 || result == 1)
  {
    uint64_t v7 = sub_24CAE5730();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v7 - 8), a1, v7);
    uint64_t v6 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48);
    uint64_t v5 = v7;
    uint64_t v4 = v8;
  }
  else
  {
    if (result) {
      return result;
    }
    uint64_t v3 = sub_24CAE5730();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    uint64_t v5 = v3;
    uint64_t v6 = a1;
  }
  return v4(v6, v5);
}

char *initializeWithCopy for UnderwaterTime(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = sub_24CAE5730();
    uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
    v9(a1, a2, v8);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
    v9(&a1[*(int *)(v10 + 48)], &a2[*(int *)(v10 + 48)], v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_24CAE5730();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithCopy for UnderwaterTime(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24CACF304((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = sub_24CAE5730();
      uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
      v9(a1, a2, v8);
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
      v9(&a1[*(int *)(v10 + 48)], &a2[*(int *)(v10 + 48)], v8);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_24CAE5730();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

char *initializeWithTake for UnderwaterTime(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = sub_24CAE5730();
    uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32);
    v9(a1, a2, v8);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
    v9(&a1[*(int *)(v10 + 48)], &a2[*(int *)(v10 + 48)], v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_24CAE5730();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for UnderwaterTime(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24CACF304((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = sub_24CAE5730();
      uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32);
      v9(a1, a2, v8);
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
      v9(&a1[*(int *)(v10 + 48)], &a2[*(int *)(v10 + 48)], v8);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_24CAE5730();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for UnderwaterTime(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for UnderwaterTime(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24CAD2A7C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24CAD2A8C()
{
  uint64_t result = sub_24CAE5730();
  if (v1 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64;
    swift_getTupleTypeLayout2();
    uint64_t v5 = &v3;
    swift_getTupleTypeLayout2();
    uint64_t v6 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for UnderwaterTime.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAD2C18);
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

ValueMetadata *type metadata accessor for UnderwaterTime.CodingKeys()
{
  return &type metadata for UnderwaterTime.CodingKeys;
}

ValueMetadata *type metadata accessor for UnderwaterTime.ZeroCodingKeys()
{
  return &type metadata for UnderwaterTime.ZeroCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for UnderwaterTime.ActiveCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CAD2CFCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UnderwaterTime.ActiveCodingKeys()
{
  return &type metadata for UnderwaterTime.ActiveCodingKeys;
}

ValueMetadata *type metadata accessor for UnderwaterTime.TentativeCodingKeys()
{
  return &type metadata for UnderwaterTime.TentativeCodingKeys;
}

unsigned char *_s9DepthCore14UnderwaterTimeO19TentativeCodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAD2E14);
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

ValueMetadata *type metadata accessor for UnderwaterTime.CompletedCodingKeys()
{
  return &type metadata for UnderwaterTime.CompletedCodingKeys;
}

unint64_t sub_24CAD2E50()
{
  unint64_t result = qword_26980B498;
  if (!qword_26980B498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B498);
  }
  return result;
}

unint64_t sub_24CAD2EA8()
{
  unint64_t result = qword_26980B4A0;
  if (!qword_26980B4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B4A0);
  }
  return result;
}

unint64_t sub_24CAD2F00()
{
  unint64_t result = qword_26980B4A8;
  if (!qword_26980B4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B4A8);
  }
  return result;
}

unint64_t sub_24CAD2F58()
{
  unint64_t result = qword_26980B4B0;
  if (!qword_26980B4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B4B0);
  }
  return result;
}

unint64_t sub_24CAD2FB0()
{
  unint64_t result = qword_26980B4B8;
  if (!qword_26980B4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B4B8);
  }
  return result;
}

unint64_t sub_24CAD3008()
{
  unint64_t result = qword_26980B4C0;
  if (!qword_26980B4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B4C0);
  }
  return result;
}

unint64_t sub_24CAD3060()
{
  unint64_t result = qword_26980B4C8;
  if (!qword_26980B4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B4C8);
  }
  return result;
}

unint64_t sub_24CAD30B8()
{
  unint64_t result = qword_26980B4D0;
  if (!qword_26980B4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B4D0);
  }
  return result;
}

unint64_t sub_24CAD3110()
{
  unint64_t result = qword_26980B4D8;
  if (!qword_26980B4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B4D8);
  }
  return result;
}

unint64_t sub_24CAD3168()
{
  unint64_t result = qword_26980B4E0;
  if (!qword_26980B4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B4E0);
  }
  return result;
}

unint64_t sub_24CAD31C0()
{
  unint64_t result = qword_26980B4E8;
  if (!qword_26980B4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B4E8);
  }
  return result;
}

unint64_t sub_24CAD3218()
{
  unint64_t result = qword_26980B4F0;
  if (!qword_26980B4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B4F0);
  }
  return result;
}

unint64_t sub_24CAD3270()
{
  unint64_t result = qword_26980B4F8;
  if (!qword_26980B4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B4F8);
  }
  return result;
}

unint64_t sub_24CAD32C8()
{
  unint64_t result = qword_26980B500;
  if (!qword_26980B500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B500);
  }
  return result;
}

uint64_t sub_24CAD331C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7461447472617473 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24CAD33AC()
{
  return 0x7461447472617473;
}

uint64_t sub_24CAD33C8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1869768058 && a2 == 0xE400000000000000;
  if (v3 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657669746361 && a2 == 0xE600000000000000 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x76697461746E6574 && a2 == 0xE900000000000065 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6574656C706D6F63 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_24CAD3564(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7461447472617473 && a2 == 0xE900000000000065;
  if (v3 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746144646E65 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CAD3658(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B508);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t InSessionRecoveryData.sessionUUID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24CAE57A0();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t InSessionRecoveryData.sessionUUID.setter(uint64_t a1)
{
  uint64_t v3 = sub_24CAE57A0();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*InSessionRecoveryData.sessionUUID.modify())()
{
  return nullsub_1;
}

uint64_t InSessionRecoveryData.underwaterTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for InSessionRecoveryData(0);
  return sub_24CAD4630(v1 + *(int *)(v3 + 20), a1, (uint64_t (*)(void))type metadata accessor for UnderwaterTime);
}

uint64_t type metadata accessor for InSessionRecoveryData(uint64_t a1)
{
  return sub_24CAD4F70(a1, (uint64_t *)&unk_26980B5B8);
}

uint64_t InSessionRecoveryData.underwaterTime.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for InSessionRecoveryData(0) + 20);
  return sub_24CAD3860(a1, v3);
}

uint64_t sub_24CAD3860(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnderwaterTime();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*InSessionRecoveryData.underwaterTime.modify())()
{
  return nullsub_1;
}

uint64_t InSessionRecoveryData.maxDepth.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = type metadata accessor for InSessionRecoveryData(0);
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(result + 24));
  uint64_t v5 = *v4;
  LOBYTE(v4) = *((unsigned char *)v4 + 8);
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = (_BYTE)v4;
  return result;
}

uint64_t InSessionRecoveryData.maxDepth.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t result = type metadata accessor for InSessionRecoveryData(0);
  uint64_t v5 = v1 + *(int *)(result + 24);
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 8) = v3;
  return result;
}

uint64_t (*InSessionRecoveryData.maxDepth.modify())()
{
  return nullsub_1;
}

__n128 InSessionRecoveryData.temperatureRange.getter@<Q0>(__n128 *a1@<X8>)
{
  char v3 = (__n128 *)(v1 + *(int *)(type metadata accessor for InSessionRecoveryData(0) + 28));
  unsigned __int8 v4 = v3[1].n128_u8[0];
  __n128 result = *v3;
  *a1 = *v3;
  a1[1].n128_u8[0] = v4;
  return result;
}

uint64_t InSessionRecoveryData.temperatureRange.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t result = type metadata accessor for InSessionRecoveryData(0);
  uint64_t v6 = v1 + *(int *)(result + 28);
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = v3;
  *(unsigned char *)(v6 + 16) = v4;
  return result;
}

uint64_t (*InSessionRecoveryData.temperatureRange.modify())()
{
  return nullsub_1;
}

uint64_t InSessionRecoveryData.didHaveActiveRuntimeSession.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for InSessionRecoveryData(0) + 32));
}

uint64_t InSessionRecoveryData.didHaveActiveRuntimeSession.setter(char a1)
{
  uint64_t result = type metadata accessor for InSessionRecoveryData(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*InSessionRecoveryData.didHaveActiveRuntimeSession.modify())()
{
  return nullsub_1;
}

uint64_t InSessionRecoveryData.init(sessionUUID:underwaterTime:maxDepth:temperatureRange:didHaveActiveRuntimeSession:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v10 = *a3;
  char v11 = *((unsigned char *)a3 + 8);
  uint64_t v12 = *a4;
  uint64_t v13 = a4[1];
  char v14 = *((unsigned char *)a4 + 16);
  uint64_t v15 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(a6, a1, v15);
  uint64_t v16 = (int *)type metadata accessor for InSessionRecoveryData(0);
  uint64_t result = sub_24CAD4FFC(a2, a6 + v16[5], (uint64_t (*)(void))type metadata accessor for UnderwaterTime);
  uint64_t v18 = a6 + v16[6];
  *(void *)uint64_t v18 = v10;
  *(unsigned char *)(v18 + 8) = v11;
  uint64_t v19 = a6 + v16[7];
  *(void *)uint64_t v19 = v12;
  *(void *)(v19 + 8) = v13;
  *(unsigned char *)(v19 + 16) = v14;
  *(unsigned char *)(a6 + v16[8]) = a5;
  return result;
}

unint64_t sub_24CAD3C30(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7461777265646E75;
      break;
    case 2:
      unint64_t result = 0x687470654478616DLL;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0xD00000000000001BLL;
      break;
    default:
      unint64_t result = 0x556E6F6973736573;
      break;
  }
  return result;
}

unint64_t sub_24CAD3CF8()
{
  return sub_24CAD3C30(*v0);
}

uint64_t sub_24CAD3D00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CAD8940(a1, a2);
  *a3 = result;
  return result;
}

void sub_24CAD3D28(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24CAD3D34(uint64_t a1)
{
  unint64_t v2 = sub_24CAD407C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAD3D70(uint64_t a1)
{
  unint64_t v2 = sub_24CAD407C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InSessionRecoveryData.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B510);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CAD407C();
  sub_24CAE6280();
  LOBYTE(v15) = 0;
  sub_24CAE57A0();
  sub_24CAD40D0(&qword_26980B090, MEMORY[0x263F07508]);
  sub_24CAE6180();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for InSessionRecoveryData(0);
    LOBYTE(v15) = 1;
    type metadata accessor for UnderwaterTime();
    sub_24CAD40D0(&qword_26980B520, (void (*)(uint64_t))type metadata accessor for UnderwaterTime);
    sub_24CAE6180();
    uint64_t v10 = (uint64_t *)(v3 + *(int *)(v9 + 24));
    uint64_t v11 = *v10;
    LOBYTE(v10) = *((unsigned char *)v10 + 8);
    *(void *)&long long v15 = v11;
    BYTE8(v15) = (_BYTE)v10;
    char v17 = 2;
    sub_24CAC1084();
    sub_24CAE6180();
    uint64_t v12 = (long long *)(v3 + *(int *)(v9 + 28));
    char v13 = *((unsigned char *)v12 + 16);
    long long v15 = *v12;
    char v16 = v13;
    char v17 = 3;
    sub_24CAC10D8();
    sub_24CAE6180();
    LOBYTE(v15) = 4;
    sub_24CAE6160();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_24CAD407C()
{
  unint64_t result = qword_26980B518;
  if (!qword_26980B518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B518);
  }
  return result;
}

uint64_t sub_24CAD40D0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t InSessionRecoveryData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v24 = type metadata accessor for UnderwaterTime();
  MEMORY[0x270FA5388](v24);
  char v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24CAE57A0();
  uint64_t v23 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v25 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B528);
  uint64_t v22 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (int *)type metadata accessor for InSessionRecoveryData(0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CAD407C();
  uint64_t v26 = v8;
  uint64_t v12 = (uint64_t)v28;
  sub_24CAE6270();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v28 = a1;
  uint64_t v13 = (uint64_t)v11;
  uint64_t v14 = v23;
  LOBYTE(v29) = 0;
  sub_24CAD40D0(&qword_26980B0B8, MEMORY[0x263F07508]);
  sub_24CAE6100();
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v13, v25, v5);
  LOBYTE(v29) = 1;
  sub_24CAD40D0(&qword_26980B530, (void (*)(uint64_t))type metadata accessor for UnderwaterTime);
  sub_24CAE6100();
  sub_24CAD4FFC((uint64_t)v4, v13 + v9[5], (uint64_t (*)(void))type metadata accessor for UnderwaterTime);
  char v31 = 2;
  sub_24CAC17E4();
  sub_24CAE6100();
  char v15 = BYTE8(v29);
  uint64_t v16 = v13 + v9[6];
  *(void *)uint64_t v16 = v29;
  *(unsigned char *)(v16 + 8) = v15;
  char v31 = 3;
  sub_24CAC1838();
  sub_24CAE6100();
  char v18 = v30;
  uint64_t v19 = v13 + v9[7];
  *(_OWORD *)uint64_t v19 = v29;
  *(unsigned char *)(v19 + 16) = v18;
  LOBYTE(v29) = 4;
  char v20 = sub_24CAE60E0();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v26, v27);
  *(unsigned char *)(v13 + v9[8]) = v20 & 1;
  sub_24CAD4630(v13, v21, type metadata accessor for InSessionRecoveryData);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v28);
  return sub_24CAD4698(v13, type metadata accessor for InSessionRecoveryData);
}

uint64_t sub_24CAD4630(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CAD4698(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24CAD46F8(char a1)
{
  return *(void *)&aNone_0[8 * a1];
}

uint64_t sub_24CAD4718@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return InSessionRecoveryData.init(from:)(a1, a2);
}

uint64_t sub_24CAD4730(void *a1)
{
  return InSessionRecoveryData.encode(to:)(a1);
}

uint64_t sub_24CAD4748()
{
  return sub_24CAD46F8(*v0);
}

uint64_t sub_24CAD4750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CAD8B64(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CAD4778(uint64_t a1)
{
  unint64_t v2 = sub_24CAD4FA8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAD47B4(uint64_t a1)
{
  unint64_t v2 = sub_24CAD4FA8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CAD47F0(uint64_t a1)
{
  unint64_t v2 = sub_24CAD50B8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAD482C(uint64_t a1)
{
  unint64_t v2 = sub_24CAD50B8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CAD4868(uint64_t a1)
{
  unint64_t v2 = sub_24CAD510C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAD48A4(uint64_t a1)
{
  unint64_t v2 = sub_24CAD510C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CAD48E0(uint64_t a1)
{
  unint64_t v2 = sub_24CAD5064();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CAD491C(uint64_t a1)
{
  unint64_t v2 = sub_24CAD5064();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SessionRecoveryData.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B538);
  uint64_t v37 = *(void *)(v2 - 8);
  uint64_t v38 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v36 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = type metadata accessor for SessionSummary();
  MEMORY[0x270FA5388](v34);
  uint64_t v35 = (uint64_t)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B540);
  uint64_t v32 = *(void *)(v5 - 8);
  uint64_t v33 = v5;
  MEMORY[0x270FA5388](v5);
  char v31 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for InSessionRecoveryData(0);
  MEMORY[0x270FA5388](v30);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B548);
  uint64_t v29 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for SessionRecoveryData(0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B550);
  uint64_t v40 = *(void *)(v15 - 8);
  uint64_t v41 = v15;
  MEMORY[0x270FA5388](v15);
  char v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CAD4FA8();
  sub_24CAE6280();
  sub_24CAD4630(v39, (uint64_t)v14, type metadata accessor for SessionRecoveryData);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_24CAD4FFC((uint64_t)v14, (uint64_t)v8, type metadata accessor for InSessionRecoveryData);
    char v43 = 1;
    sub_24CAD50B8();
    uint64_t v25 = v31;
    uint64_t v21 = v41;
    sub_24CAE6120();
    sub_24CAD40D0(&qword_26980B578, (void (*)(uint64_t))type metadata accessor for InSessionRecoveryData);
    uint64_t v26 = v33;
    sub_24CAE6180();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v25, v26);
    uint64_t v23 = type metadata accessor for InSessionRecoveryData;
    uint64_t v24 = (uint64_t)v8;
    goto LABEL_5;
  }
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v19 = v35;
    sub_24CAD4FFC((uint64_t)v14, v35, (uint64_t (*)(void))type metadata accessor for SessionSummary);
    char v44 = 2;
    sub_24CAD5064();
    char v20 = v36;
    uint64_t v21 = v41;
    sub_24CAE6120();
    sub_24CAD40D0(&qword_26980B568, (void (*)(uint64_t))type metadata accessor for SessionSummary);
    uint64_t v22 = v38;
    sub_24CAE6180();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v20, v22);
    uint64_t v23 = (uint64_t (*)(void))type metadata accessor for SessionSummary;
    uint64_t v24 = v19;
LABEL_5:
    sub_24CAD4698(v24, v23);
    return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v17, v21);
  }
  char v42 = 0;
  sub_24CAD510C();
  uint64_t v28 = v41;
  sub_24CAE6120();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v17, v28);
}

uint64_t type metadata accessor for SessionRecoveryData(uint64_t a1)
{
  return sub_24CAD4F70(a1, (uint64_t *)&unk_26980B5C8);
}

uint64_t sub_24CAD4F70(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24CAD4FA8()
{
  unint64_t result = qword_26980B558;
  if (!qword_26980B558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B558);
  }
  return result;
}

uint64_t sub_24CAD4FFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_24CAD5064()
{
  unint64_t result = qword_26980B560;
  if (!qword_26980B560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B560);
  }
  return result;
}

unint64_t sub_24CAD50B8()
{
  unint64_t result = qword_26980B570;
  if (!qword_26980B570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B570);
  }
  return result;
}

unint64_t sub_24CAD510C()
{
  unint64_t result = qword_26980B580;
  if (!qword_26980B580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B580);
  }
  return result;
}

uint64_t SessionRecoveryData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v53 = a2;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B588);
  uint64_t v52 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  id v57 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B590);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v50 = v4;
  uint64_t v51 = v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v56 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B598);
  uint64_t v47 = *(void *)(v7 - 8);
  uint64_t v48 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v55 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B5A0);
  uint64_t v54 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for SessionRecoveryData(0);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  char v18 = (char *)&v44 - v17;
  MEMORY[0x270FA5388](v16);
  char v20 = (char *)&v44 - v19;
  uint64_t v21 = a1[3];
  uint64_t v58 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  sub_24CAD4FA8();
  uint64_t v22 = (uint64_t)v59;
  sub_24CAE6270();
  if (v22) {
    goto LABEL_9;
  }
  uint64_t v45 = v15;
  char v46 = v18;
  uint64_t v24 = v55;
  uint64_t v23 = v56;
  uint64_t v25 = v57;
  uint64_t v59 = v20;
  uint64_t v26 = (char *)v12;
  uint64_t v27 = sub_24CAE6110();
  uint64_t v28 = (char *)v27;
  if (*(void *)(v27 + 16) != 1)
  {
    uint64_t v36 = sub_24CAE5F90();
    swift_allocError();
    uint64_t v38 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AC48);
    *uint64_t v38 = v26;
    sub_24CAE60A0();
    sub_24CAE5F80();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v38, *MEMORY[0x263F8DCB0], v36);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v11, v9);
LABEL_9:
    uint64_t v34 = (uint64_t)v58;
    return __swift_destroy_boxed_opaque_existential_0(v34);
  }
  if (*(unsigned char *)(v27 + 32))
  {
    if (*(unsigned char *)(v27 + 32) == 1)
    {
      char v61 = 1;
      sub_24CAD50B8();
      uint64_t v29 = v23;
      sub_24CAE6090();
      type metadata accessor for InSessionRecoveryData(0);
      sub_24CAD40D0(&qword_26980B5B0, (void (*)(uint64_t))type metadata accessor for InSessionRecoveryData);
      uint64_t v30 = v9;
      uint64_t v31 = (uint64_t)v46;
      uint64_t v32 = v29;
      uint64_t v33 = v50;
      sub_24CAE6100();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v32, v33);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v11, v30);
      uint64_t v34 = (uint64_t)v58;
      swift_storeEnumTagMultiPayload();
      uint64_t v35 = v31;
    }
    else
    {
      char v62 = 2;
      sub_24CAD5064();
      sub_24CAE6090();
      uint64_t v55 = v26;
      type metadata accessor for SessionSummary();
      uint64_t v56 = v28;
      sub_24CAD40D0(&qword_26980B5A8, (void (*)(uint64_t))type metadata accessor for SessionSummary);
      uint64_t v41 = (uint64_t)v45;
      uint64_t v42 = v9;
      uint64_t v43 = v49;
      sub_24CAE6100();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v25, v43);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v11, v42);
      uint64_t v34 = (uint64_t)v58;
      swift_storeEnumTagMultiPayload();
      uint64_t v35 = v41;
    }
    uint64_t v39 = (uint64_t)v59;
    sub_24CAD4FFC(v35, (uint64_t)v59, type metadata accessor for SessionRecoveryData);
  }
  else
  {
    char v60 = 0;
    sub_24CAD510C();
    sub_24CAE6090();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v24, v48);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v11, v9);
    uint64_t v39 = (uint64_t)v59;
    swift_storeEnumTagMultiPayload();
    uint64_t v34 = (uint64_t)v58;
  }
  sub_24CAD4FFC(v39, v53, type metadata accessor for SessionRecoveryData);
  return __swift_destroy_boxed_opaque_existential_0(v34);
}

uint64_t sub_24CAD58D0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SessionRecoveryData.init(from:)(a1, a2);
}

uint64_t sub_24CAD58E8(void *a1)
{
  return SessionRecoveryData.encode(to:)(a1);
}

void *initializeBufferWithCopyOfBuffer for InSessionRecoveryData(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24CAE57A0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for UnderwaterTime();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v15 = sub_24CAE5730();
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
      v16(v9, v10, v15);
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
      v16(&v9[*(int *)(v17 + 48)], &v10[*(int *)(v17 + 48)], v15);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      uint64_t v13 = sub_24CAE5730();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v9, v10, v13);
      swift_storeEnumTagMultiPayload();
    }
    uint64_t v18 = a3[6];
    uint64_t v19 = a3[7];
    char v20 = (char *)a1 + v18;
    uint64_t v21 = (char *)a2 + v18;
    *(void *)char v20 = *(void *)v21;
    v20[8] = v21[8];
    uint64_t v22 = (char *)a1 + v19;
    uint64_t v23 = (char *)a2 + v19;
    *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    v22[16] = v23[16];
    *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  }
  return a1;
}

uint64_t destroy for InSessionRecoveryData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  type metadata accessor for UnderwaterTime();
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2 || result == 1)
  {
    uint64_t v11 = sub_24CAE5730();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v12)((void *)(v11 - 8), v5, v11);
    uint64_t v10 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48);
    uint64_t v9 = v11;
    uint64_t v8 = v12;
  }
  else
  {
    if (result) {
      return result;
    }
    uint64_t v7 = sub_24CAE5730();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    uint64_t v9 = v7;
    uint64_t v10 = v5;
  }
  return v8(v10, v9);
}

uint64_t initializeWithCopy for InSessionRecoveryData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for UnderwaterTime();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v13 = sub_24CAE5730();
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    v14(v8, v9, v13);
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
    v14(&v8[*(int *)(v15 + 48)], &v9[*(int *)(v15 + 48)], v13);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    uint64_t v12 = sub_24CAE5730();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v8, v9, v12);
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v16 = a3[6];
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  uint64_t v20 = a1 + v17;
  uint64_t v21 = a2 + v17;
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *(unsigned char *)(v20 + 16) = *(unsigned char *)(v21 + 16);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t assignWithCopy for InSessionRecoveryData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  if (a1 != a2)
  {
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)(a1 + v7);
    uint64_t v9 = (char *)(a2 + v7);
    sub_24CAD4698(a1 + v7, (uint64_t (*)(void))type metadata accessor for UnderwaterTime);
    uint64_t v10 = type metadata accessor for UnderwaterTime();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v13 = sub_24CAE5730();
      uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
      v14(v8, v9, v13);
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
      v14(&v8[*(int *)(v15 + 48)], &v9[*(int *)(v15 + 48)], v13);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      uint64_t v12 = sub_24CAE5730();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v8, v9, v12);
      swift_storeEnumTagMultiPayload();
    }
  }
  uint64_t v16 = a3[6];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v19 = *v18;
  *(unsigned char *)(v17 + 8) = *((unsigned char *)v18 + 8);
  *(void *)uint64_t v17 = v19;
  uint64_t v20 = a3[7];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = (long long *)(a2 + v20);
  long long v23 = *v22;
  *(unsigned char *)(v21 + 16) = *((unsigned char *)v22 + 16);
  *(_OWORD *)uint64_t v21 = v23;
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t initializeWithTake for InSessionRecoveryData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for UnderwaterTime();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v13 = sub_24CAE5730();
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32);
    v14(v8, v9, v13);
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
    v14(&v8[*(int *)(v15 + 48)], &v9[*(int *)(v15 + 48)], v13);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    uint64_t v12 = sub_24CAE5730();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v8, v9, v12);
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v16 = a3[6];
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  uint64_t v20 = a1 + v17;
  uint64_t v21 = a2 + v17;
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *(unsigned char *)(v20 + 16) = *(unsigned char *)(v21 + 16);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t assignWithTake for InSessionRecoveryData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  if (a1 != a2)
  {
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)(a1 + v7);
    uint64_t v9 = (char *)(a2 + v7);
    sub_24CAD4698(a1 + v7, (uint64_t (*)(void))type metadata accessor for UnderwaterTime);
    uint64_t v10 = type metadata accessor for UnderwaterTime();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v13 = sub_24CAE5730();
      uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32);
      v14(v8, v9, v13);
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
      v14(&v8[*(int *)(v15 + 48)], &v9[*(int *)(v15 + 48)], v13);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      uint64_t v12 = sub_24CAE5730();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v8, v9, v12);
      swift_storeEnumTagMultiPayload();
    }
  }
  uint64_t v16 = a3[6];
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  uint64_t v20 = a1 + v17;
  uint64_t v21 = a2 + v17;
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *(unsigned char *)(v20 + 16) = *(unsigned char *)(v21 + 16);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t getEnumTagSinglePayload for InSessionRecoveryData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CAD6704);
}

uint64_t sub_24CAD6704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CAE57A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v11 = type metadata accessor for UnderwaterTime();
    uint64_t v12 = *(void *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) != a2)
    {
      unsigned int v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 32));
      if (v14 >= 2) {
        return ((v14 + 2147483646) & 0x7FFFFFFF) + 1;
      }
      else {
        return 0;
      }
    }
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for InSessionRecoveryData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CAD683C);
}

uint64_t sub_24CAD683C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_24CAE57A0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = type metadata accessor for UnderwaterTime();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(unsigned char *)(a1 + *(int *)(a4 + 32)) = a2 + 1;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_24CAD694C()
{
  uint64_t result = sub_24CAE57A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for UnderwaterTime();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for SessionRecoveryData(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v17 = sub_24CAE57A0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
      uint64_t v18 = (int *)type metadata accessor for SessionSummary();
      uint64_t v19 = v18[5];
      uint64_t v20 = &a1[v19];
      uint64_t v21 = &a2[v19];
      uint64_t v22 = sub_24CAE5730();
      long long v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
      v23(v20, v21, v22);
      v23(&a1[v18[6]], &a2[v18[6]], v22);
      uint64_t v24 = v18[7];
      uint64_t v25 = &a1[v24];
      uint64_t v26 = &a2[v24];
      *(void *)uint64_t v25 = *(void *)v26;
      v25[8] = v26[8];
      uint64_t v27 = v18[8];
      uint64_t v28 = &a1[v27];
      uint64_t v29 = &a2[v27];
      *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
      v28[16] = v29[16];
      uint64_t v30 = v18[9];
      uint64_t v31 = &a1[v30];
      uint64_t v32 = &a2[v30];
      uint64_t v33 = *((void *)v32 + 1);
      *(void *)uint64_t v31 = *(void *)v32;
      *((void *)v31 + 1) = v33;
      swift_bridgeObjectRetain();
LABEL_15:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v8 = sub_24CAE57A0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      uint64_t v9 = (int *)type metadata accessor for InSessionRecoveryData(0);
      uint64_t v10 = v9[5];
      uint64_t v11 = &a1[v10];
      uint64_t v12 = &a2[v10];
      uint64_t v13 = type metadata accessor for UnderwaterTime();
      int v14 = swift_getEnumCaseMultiPayload();
      if (v14 == 2 || v14 == 1)
      {
        uint64_t v34 = sub_24CAE5730();
        uint64_t v35 = *(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16);
        v35(v11, v12, v34);
        uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
        v35(&v11[*(int *)(v36 + 48)], &v12[*(int *)(v36 + 48)], v34);
        swift_storeEnumTagMultiPayload();
      }
      else if (v14)
      {
        memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        uint64_t v15 = sub_24CAE5730();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v11, v12, v15);
        swift_storeEnumTagMultiPayload();
      }
      uint64_t v37 = v9[6];
      uint64_t v38 = &a1[v37];
      uint64_t v39 = &a2[v37];
      *(void *)uint64_t v38 = *(void *)v39;
      v38[8] = v39[8];
      uint64_t v40 = v9[7];
      uint64_t v41 = &a1[v40];
      uint64_t v42 = &a2[v40];
      v41[16] = v42[16];
      *(_OWORD *)uint64_t v41 = *(_OWORD *)v42;
      a1[v9[8]] = a2[v9[8]];
      goto LABEL_15;
    }
    memcpy(a1, a2, *(void *)(v6 + 64));
  }
  return a1;
}

uint64_t destroy for SessionRecoveryData(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v9 = sub_24CAE57A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
    uint64_t v10 = type metadata accessor for SessionSummary();
    uint64_t v11 = a1 + *(int *)(v10 + 20);
    uint64_t v12 = sub_24CAE5730();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
    v13(v11, v12);
    v13(a1 + *(int *)(v10 + 24), v12);
    return swift_bridgeObjectRelease();
  }
  else
  {
    if (result) {
      return result;
    }
    uint64_t v3 = sub_24CAE57A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
    uint64_t v4 = a1 + *(int *)(type metadata accessor for InSessionRecoveryData(0) + 20);
    type metadata accessor for UnderwaterTime();
    uint64_t result = swift_getEnumCaseMultiPayload();
    if (result == 2 || result == 1)
    {
      uint64_t v14 = sub_24CAE5730();
      uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);
      ((void (*)(void *__return_ptr, uint64_t, uint64_t))v15)((void *)(v14 - 8), v4, v14);
      uint64_t v8 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26980A990) + 48);
      uint64_t v7 = v14;
      uint64_t v6 = v15;
    }
    else
    {
      if (result) {
        return result;
      }
      uint64_t v5 = sub_24CAE5730();
      uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
      uint64_t v7 = v5;
      uint64_t v8 = v4;
    }
    return v6(v8, v7);
  }
}

unsigned char *initializeWithCopy for SessionRecoveryData(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v15 = sub_24CAE57A0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v15 - 8) + 16))(a1, a2, v15);
    uint64_t v16 = (int *)type metadata accessor for SessionSummary();
    uint64_t v17 = v16[5];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = &a2[v17];
    uint64_t v20 = sub_24CAE5730();
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
    v21(v18, v19, v20);
    v21(&a1[v16[6]], &a2[v16[6]], v20);
    uint64_t v22 = v16[7];
    long long v23 = &a1[v22];
    uint64_t v24 = &a2[v22];
    *(void *)long long v23 = *(void *)v24;
    v23[8] = v24[8];
    uint64_t v25 = v16[8];
    uint64_t v26 = &a1[v25];
    uint64_t v27 = &a2[v25];
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    v26[16] = v27[16];
    uint64_t v28 = v16[9];
    uint64_t v29 = &a1[v28];
    uint64_t v30 = &a2[v28];
    uint64_t v31 = v30[1];
    *uint64_t v29 = *v30;
    v29[1] = v31;
    swift_bridgeObjectRetain();
LABEL_13:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = sub_24CAE57A0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = (int *)type metadata accessor for InSessionRecoveryData(0);
    uint64_t v9 = v8[5];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = type metadata accessor for UnderwaterTime();
    int v13 = swift_getEnumCaseMultiPayload();
    if (v13 == 2 || v13 == 1)
    {
      uint64_t v32 = sub_24CAE5730();
      uint64_t v33 = *(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16);
      v33(v10, v11, v32);
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
      v33(&v10[*(int *)(v34 + 48)], &v11[*(int *)(v34 + 48)], v32);
      swift_storeEnumTagMultiPayload();
    }
    else if (v13)
    {
      memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      uint64_t v14 = sub_24CAE5730();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v10, v11, v14);
      swift_storeEnumTagMultiPayload();
    }
    uint64_t v35 = v8[6];
    uint64_t v36 = &a1[v35];
    uint64_t v37 = &a2[v35];
    *(void *)uint64_t v36 = *(void *)v37;
    v36[8] = v37[8];
    uint64_t v38 = v8[7];
    uint64_t v39 = &a1[v38];
    uint64_t v40 = &a2[v38];
    v39[16] = v40[16];
    *(_OWORD *)uint64_t v39 = *(_OWORD *)v40;
    a1[v8[8]] = a2[v8[8]];
    goto LABEL_13;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

unsigned char *assignWithCopy for SessionRecoveryData(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24CAD4698((uint64_t)a1, type metadata accessor for SessionRecoveryData);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v15 = sub_24CAE57A0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v15 - 8) + 16))(a1, a2, v15);
      uint64_t v16 = (int *)type metadata accessor for SessionSummary();
      uint64_t v17 = v16[5];
      uint64_t v18 = &a1[v17];
      uint64_t v19 = &a2[v17];
      uint64_t v20 = sub_24CAE5730();
      uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
      v21(v18, v19, v20);
      v21(&a1[v16[6]], &a2[v16[6]], v20);
      uint64_t v22 = v16[7];
      long long v23 = &a1[v22];
      uint64_t v24 = &a2[v22];
      char v25 = v24[8];
      *(void *)long long v23 = *(void *)v24;
      v23[8] = v25;
      uint64_t v26 = v16[8];
      uint64_t v27 = &a1[v26];
      uint64_t v28 = &a2[v26];
      char v29 = v28[16];
      *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
      v27[16] = v29;
      uint64_t v30 = v16[9];
      uint64_t v31 = &a1[v30];
      uint64_t v32 = &a2[v30];
      *uint64_t v31 = *v32;
      v31[1] = v32[1];
      swift_bridgeObjectRetain();
LABEL_14:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v7 = sub_24CAE57A0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = (int *)type metadata accessor for InSessionRecoveryData(0);
      uint64_t v9 = v8[5];
      uint64_t v10 = &a1[v9];
      uint64_t v11 = &a2[v9];
      uint64_t v12 = type metadata accessor for UnderwaterTime();
      int v13 = swift_getEnumCaseMultiPayload();
      if (v13 == 2 || v13 == 1)
      {
        uint64_t v33 = sub_24CAE5730();
        uint64_t v34 = *(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16);
        v34(v10, v11, v33);
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
        v34(&v10[*(int *)(v35 + 48)], &v11[*(int *)(v35 + 48)], v33);
        swift_storeEnumTagMultiPayload();
      }
      else if (v13)
      {
        memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        uint64_t v14 = sub_24CAE5730();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v10, v11, v14);
        swift_storeEnumTagMultiPayload();
      }
      uint64_t v36 = v8[6];
      uint64_t v37 = &a1[v36];
      uint64_t v38 = &a2[v36];
      uint64_t v39 = *(void *)v38;
      v37[8] = v38[8];
      *(void *)uint64_t v37 = v39;
      uint64_t v40 = v8[7];
      uint64_t v41 = &a1[v40];
      uint64_t v42 = &a2[v40];
      long long v43 = *(_OWORD *)v42;
      v41[16] = v42[16];
      *(_OWORD *)uint64_t v41 = v43;
      a1[v8[8]] = a2[v8[8]];
      goto LABEL_14;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

unsigned char *initializeWithTake for SessionRecoveryData(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v15 = sub_24CAE57A0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
    uint64_t v16 = (int *)type metadata accessor for SessionSummary();
    uint64_t v17 = v16[5];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = &a2[v17];
    uint64_t v20 = sub_24CAE5730();
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32);
    v21(v18, v19, v20);
    v21(&a1[v16[6]], &a2[v16[6]], v20);
    uint64_t v22 = v16[7];
    long long v23 = &a1[v22];
    uint64_t v24 = &a2[v22];
    *(void *)long long v23 = *(void *)v24;
    v23[8] = v24[8];
    uint64_t v25 = v16[8];
    uint64_t v26 = &a1[v25];
    uint64_t v27 = &a2[v25];
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    v26[16] = v27[16];
    *(_OWORD *)&a1[v16[9]] = *(_OWORD *)&a2[v16[9]];
LABEL_13:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = sub_24CAE57A0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    uint64_t v8 = (int *)type metadata accessor for InSessionRecoveryData(0);
    uint64_t v9 = v8[5];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = type metadata accessor for UnderwaterTime();
    int v13 = swift_getEnumCaseMultiPayload();
    if (v13 == 2 || v13 == 1)
    {
      uint64_t v28 = sub_24CAE5730();
      char v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32);
      v29(v10, v11, v28);
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
      v29(&v10[*(int *)(v30 + 48)], &v11[*(int *)(v30 + 48)], v28);
      swift_storeEnumTagMultiPayload();
    }
    else if (v13)
    {
      memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      uint64_t v14 = sub_24CAE5730();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v10, v11, v14);
      swift_storeEnumTagMultiPayload();
    }
    uint64_t v31 = v8[6];
    uint64_t v32 = &a1[v31];
    uint64_t v33 = &a2[v31];
    *(void *)uint64_t v32 = *(void *)v33;
    v32[8] = v33[8];
    uint64_t v34 = v8[7];
    uint64_t v35 = &a1[v34];
    uint64_t v36 = &a2[v34];
    v35[16] = v36[16];
    *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
    a1[v8[8]] = a2[v8[8]];
    goto LABEL_13;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

unsigned char *assignWithTake for SessionRecoveryData(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24CAD4698((uint64_t)a1, type metadata accessor for SessionRecoveryData);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v15 = sub_24CAE57A0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
      uint64_t v16 = (int *)type metadata accessor for SessionSummary();
      uint64_t v17 = v16[5];
      uint64_t v18 = &a1[v17];
      uint64_t v19 = &a2[v17];
      uint64_t v20 = sub_24CAE5730();
      uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32);
      v21(v18, v19, v20);
      v21(&a1[v16[6]], &a2[v16[6]], v20);
      uint64_t v22 = v16[7];
      long long v23 = &a1[v22];
      uint64_t v24 = &a2[v22];
      *(void *)long long v23 = *(void *)v24;
      v23[8] = v24[8];
      uint64_t v25 = v16[8];
      uint64_t v26 = &a1[v25];
      uint64_t v27 = &a2[v25];
      *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
      v26[16] = v27[16];
      *(_OWORD *)&a1[v16[9]] = *(_OWORD *)&a2[v16[9]];
LABEL_14:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v7 = sub_24CAE57A0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      uint64_t v8 = (int *)type metadata accessor for InSessionRecoveryData(0);
      uint64_t v9 = v8[5];
      uint64_t v10 = &a1[v9];
      uint64_t v11 = &a2[v9];
      uint64_t v12 = type metadata accessor for UnderwaterTime();
      int v13 = swift_getEnumCaseMultiPayload();
      if (v13 == 2 || v13 == 1)
      {
        uint64_t v28 = sub_24CAE5730();
        char v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32);
        v29(v10, v11, v28);
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A990);
        v29(&v10[*(int *)(v30 + 48)], &v11[*(int *)(v30 + 48)], v28);
        swift_storeEnumTagMultiPayload();
      }
      else if (v13)
      {
        memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        uint64_t v14 = sub_24CAE5730();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v10, v11, v14);
        swift_storeEnumTagMultiPayload();
      }
      uint64_t v31 = v8[6];
      uint64_t v32 = &a1[v31];
      uint64_t v33 = &a2[v31];
      *(void *)uint64_t v32 = *(void *)v33;
      v32[8] = v33[8];
      uint64_t v34 = v8[7];
      uint64_t v35 = &a1[v34];
      uint64_t v36 = &a2[v34];
      v35[16] = v36[16];
      *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
      a1[v8[8]] = a2[v8[8]];
      goto LABEL_14;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_24CAD801C()
{
  uint64_t result = type metadata accessor for InSessionRecoveryData(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SessionSummary();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SessionRecoveryData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAD81ACLL);
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

ValueMetadata *type metadata accessor for SessionRecoveryData.CodingKeys()
{
  return &type metadata for SessionRecoveryData.CodingKeys;
}

ValueMetadata *type metadata accessor for SessionRecoveryData.NoneCodingKeys()
{
  return &type metadata for SessionRecoveryData.NoneCodingKeys;
}

ValueMetadata *type metadata accessor for SessionRecoveryData.InSessionCodingKeys()
{
  return &type metadata for SessionRecoveryData.InSessionCodingKeys;
}

unsigned char *_s9DepthCore19SessionRecoveryDataO19InSessionCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24CAD82A4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionRecoveryData.SummaryCodingKeys()
{
  return &type metadata for SessionRecoveryData.SummaryCodingKeys;
}

uint64_t getEnumTagSinglePayload for InSessionRecoveryData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for InSessionRecoveryData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CAD8438);
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

ValueMetadata *type metadata accessor for InSessionRecoveryData.CodingKeys()
{
  return &type metadata for InSessionRecoveryData.CodingKeys;
}

unint64_t sub_24CAD8474()
{
  unint64_t result = qword_26980B5D8;
  if (!qword_26980B5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B5D8);
  }
  return result;
}

unint64_t sub_24CAD84CC()
{
  unint64_t result = qword_26980B5E0;
  if (!qword_26980B5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B5E0);
  }
  return result;
}

unint64_t sub_24CAD8524()
{
  unint64_t result = qword_26980B5E8;
  if (!qword_26980B5E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B5E8);
  }
  return result;
}

unint64_t sub_24CAD857C()
{
  unint64_t result = qword_26980B5F0;
  if (!qword_26980B5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B5F0);
  }
  return result;
}

unint64_t sub_24CAD85D4()
{
  unint64_t result = qword_26980B5F8;
  if (!qword_26980B5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B5F8);
  }
  return result;
}

unint64_t sub_24CAD862C()
{
  unint64_t result = qword_26980B600;
  if (!qword_26980B600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B600);
  }
  return result;
}

unint64_t sub_24CAD8684()
{
  unint64_t result = qword_26980B608;
  if (!qword_26980B608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B608);
  }
  return result;
}

unint64_t sub_24CAD86DC()
{
  unint64_t result = qword_26980B610;
  if (!qword_26980B610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B610);
  }
  return result;
}

unint64_t sub_24CAD8734()
{
  unint64_t result = qword_26980B618;
  if (!qword_26980B618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B618);
  }
  return result;
}

unint64_t sub_24CAD878C()
{
  unint64_t result = qword_26980B620;
  if (!qword_26980B620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B620);
  }
  return result;
}

unint64_t sub_24CAD87E4()
{
  unint64_t result = qword_26980B628;
  if (!qword_26980B628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B628);
  }
  return result;
}

unint64_t sub_24CAD883C()
{
  unint64_t result = qword_26980B630;
  if (!qword_26980B630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B630);
  }
  return result;
}

unint64_t sub_24CAD8894()
{
  unint64_t result = qword_26980B638;
  if (!qword_26980B638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B638);
  }
  return result;
}

unint64_t sub_24CAD88EC()
{
  unint64_t result = qword_26980B640;
  if (!qword_26980B640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B640);
  }
  return result;
}

uint64_t sub_24CAD8940(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x556E6F6973736573 && a2 == 0xEB00000000444955;
  if (v3 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7461777265646E75 && a2 == 0xEE00656D69547265 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x687470654478616DLL && a2 == 0xE800000000000000 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024CAEBD90 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x800000024CAEBE50)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_24CAD8B64(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701736302 && a2 == 0xE400000000000000;
  if (v3 || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F69737365536E69 && a2 == 0xE90000000000006ELL || (sub_24CAE61D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7972616D6D7573 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24CAE61D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24CAD8CA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CAE5D00();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24CAE5CF0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24CAA51D0(a1, &qword_26980AE68);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24CAE5CC0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24CAD8E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CAE5D00();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24CAE5CF0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24CAA51D0(a1, &qword_26980AE68);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24CAE5CC0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980B730);
  return swift_task_create();
}

uint64_t LastDive.dive.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CAA9C00(v1, a1);
}

uint64_t LastDive.dive.setter(long long *a1)
{
  __swift_destroy_boxed_opaque_existential_0(v1);
  return sub_24CAD9050(a1, v1);
}

uint64_t sub_24CAD9050(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t (*LastDive.dive.modify())()
{
  return nullsub_1;
}

uint64_t LastDive.graphData.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LastDive.graphData.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t (*LastDive.graphData.modify())()
{
  return nullsub_1;
}

uint64_t HealthKitProvider.maxDepth.getter()
{
  return sub_24CAD946C();
}

uint64_t sub_24CAD90F0@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CAE58F0();
  swift_release();
  uint64_t result = swift_release();
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_24CAD917C()
{
  return sub_24CAE5900();
}

uint64_t HealthKitProvider.maxDepth.setter()
{
  return sub_24CAE5900();
}

uint64_t (*HealthKitProvider.maxDepth.modify(void *a1))()
{
  long long v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_24CAE58E0();
  return sub_24CAD9310;
}

uint64_t HealthKitProvider.$maxDepth.getter()
{
  return sub_24CAD9B78((uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth, &qword_26980B650);
}

uint64_t HealthKitProvider.$maxDepth.setter(uint64_t a1)
{
  return sub_24CAD9DE8(a1, &qword_26980B658, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth, &qword_26980B650);
}

uint64_t (*HealthKitProvider.$maxDepth.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B658);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B650);
  sub_24CAE58C0();
  swift_endAccess();
  return sub_24CAD9454;
}

uint64_t HealthKitProvider.minTemperature.getter()
{
  return sub_24CAD946C();
}

uint64_t sub_24CAD946C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CAE58F0();
  swift_release();
  return swift_release();
}

uint64_t sub_24CAD94DC@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CAE58F0();
  swift_release();
  uint64_t result = swift_release();
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_24CAD9568()
{
  return sub_24CAE5900();
}

uint64_t HealthKitProvider.minTemperature.setter()
{
  return sub_24CAE5900();
}

uint64_t (*HealthKitProvider.minTemperature.modify(void *a1))()
{
  long long v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_24CAE58E0();
  return sub_24CAD9310;
}

uint64_t HealthKitProvider.$minTemperature.getter()
{
  return sub_24CAD9B78((uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature, &qword_26980B668);
}

uint64_t HealthKitProvider.$minTemperature.setter(uint64_t a1)
{
  return sub_24CAD9DE8(a1, &qword_26980B670, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature, &qword_26980B668);
}

uint64_t (*HealthKitProvider.$minTemperature.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B670);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B668);
  sub_24CAE58C0();
  swift_endAccess();
  return sub_24CAD9454;
}

uint64_t HealthKitProvider.lastDive.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CAE58F0();
  swift_release();
  return swift_release();
}

uint64_t sub_24CAD98B4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CAE58F0();
  swift_release();
  return swift_release();
}

uint64_t sub_24CAD9934(uint64_t a1)
{
  sub_24CADF044(a1, (uint64_t)v3, &qword_26980B680);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CADF044((uint64_t)v3, (uint64_t)&v2, &qword_26980B680);
  swift_retain();
  sub_24CAE5900();
  return sub_24CAA51D0((uint64_t)v3, &qword_26980B680);
}

uint64_t HealthKitProvider.lastDive.setter(uint64_t a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CADF044(a1, (uint64_t)&v3, &qword_26980B680);
  swift_retain();
  sub_24CAE5900();
  return sub_24CAA51D0(a1, &qword_26980B680);
}

uint64_t (*HealthKitProvider.lastDive.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_24CAE58E0();
  return sub_24CAD9310;
}

void sub_24CAD9AFC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t HealthKitProvider.$lastDive.getter()
{
  return sub_24CAD9B78((uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive, &qword_26980B688);
}

uint64_t sub_24CAD9B78(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_24CAD9BE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return swift_endAccess();
}

uint64_t sub_24CAD9C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  int v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v18 - v14;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_24CAE58D0();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t HealthKitProvider.$lastDive.setter(uint64_t a1)
{
  return sub_24CAD9DE8(a1, &qword_26980B690, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive, &qword_26980B688);
}

uint64_t sub_24CAD9DE8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_24CAE58D0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*HealthKitProvider.$lastDive.modify(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B690);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B688);
  sub_24CAE58C0();
  swift_endAccess();
  return sub_24CAD9454;
}

void sub_24CADA028(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_24CAE58D0();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_24CAE58D0();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

uint64_t HealthKitProvider.__allocating_init(withConfiguration:maxDepth:minTemperature:)(long long *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A410]), sel_init);
  uint64_t v3 = swift_allocObject();
  HealthKitProvider.init(withConfiguration:healthStore:)(a1, v2);
  return v3;
}

uint64_t HealthKitProvider.__allocating_init(withConfiguration:healthStore:)(long long *a1, void *a2)
{
  uint64_t v4 = swift_allocObject();
  HealthKitProvider.init(withConfiguration:healthStore:)(a1, a2);
  return v4;
}

uint64_t HealthKitProvider.init(withConfiguration:healthStore:)(long long *a1, void *a2)
{
  uint64_t v3 = v2;
  id v41 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B688);
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v40 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B668);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B650);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v16 = a1[7];
  long long v50 = a1[6];
  long long v51 = v16;
  long long v17 = a1[9];
  long long v52 = a1[8];
  long long v53 = v17;
  long long v18 = a1[3];
  long long v46 = a1[2];
  long long v47 = v18;
  long long v19 = a1[5];
  long long v48 = a1[4];
  long long v49 = v19;
  long long v20 = a1[1];
  long long v44 = *a1;
  long long v45 = v20;
  uint64_t v21 = v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth;
  v43[0] = 0;
  LOBYTE(v43[1]) = 3;
  sub_24CAE58B0();
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v21, v15, v12);
  uint64_t v22 = v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature;
  v43[0] = 0;
  LOBYTE(v43[1]) = 1;
  sub_24CAE58B0();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v22, v11, v8);
  uint64_t v23 = v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive;
  memset(v43, 0, sizeof(v43));
  sub_24CADF044((uint64_t)v43, (uint64_t)&v42, &qword_26980B680);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980B680);
  sub_24CAE58B0();
  sub_24CAA51D0((uint64_t)v43, &qword_26980B680);
  (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v23, v7, v40);
  uint64_t v24 = v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_graphFetchOperation;
  uint64_t Operation = type metadata accessor for GraphFetchOperation(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(Operation - 8) + 56))(v24, 1, 1, Operation);
  *(void *)(v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_subscriptions) = MEMORY[0x263F8EE88];
  uint64_t v26 = (_OWORD *)(v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration);
  long long v27 = v51;
  v26[6] = v50;
  v26[7] = v27;
  long long v28 = v53;
  char v26[8] = v52;
  v26[9] = v28;
  long long v29 = v47;
  v26[2] = v46;
  v26[3] = v29;
  long long v30 = v49;
  v26[4] = v48;
  v26[5] = v30;
  long long v31 = v45;
  *uint64_t v26 = v44;
  v26[1] = v31;
  type metadata accessor for HealthKitHistoryObserver();
  uint64_t v32 = swift_allocObject();
  v43[0] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980B6B0);
  swift_allocObject();
  id v33 = v41;
  uint64_t v34 = sub_24CAE58A0();
  *(_OWORD *)(v32 + 32) = 0u;
  *(_OWORD *)(v32 + 48) = 0u;
  *(void *)(v32 + 16) = v34;
  *(void *)(v32 + 24) = v33;
  *(void *)(v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_historyObserver) = v32;
  type metadata accessor for DiveGraphDataProvider();
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v33;
  *(void *)(v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_diveGraphDataProvider) = v35;
  id v36 = v33;
  sub_24CADA768();
  v43[0] = v34;
  swift_allocObject();
  swift_weakInit();
  sub_24CADF3C4(&qword_26980B6C8, &qword_26980B6B0);
  swift_retain();
  sub_24CAE5930();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_24CAE5880();
  swift_endAccess();

  swift_release();
  return v3;
}

uint64_t type metadata accessor for GraphFetchOperation(uint64_t a1)
{
  return sub_24CAD4F70(a1, (uint64_t *)&unk_26980B710);
}

uint64_t sub_24CADA768()
{
  uint64_t v48 = sub_24CAE5E40();
  uint64_t v0 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v2 = (char *)v40 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B770);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v42 = (char *)v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B778);
  uint64_t v43 = *(void *)(v5 - 8);
  uint64_t v44 = v5;
  MEMORY[0x270FA5388](v5);
  id v41 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B780);
  uint64_t v46 = *(void *)(v7 - 8);
  uint64_t v47 = v7;
  MEMORY[0x270FA5388](v7);
  long long v45 = (char *)v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void *)*MEMORY[0x263EFF3C8];
  id v50 = (id)*MEMORY[0x263F83390];
  id v51 = v9;
  id v52 = (id)*MEMORY[0x263EFF5D0];
  id v10 = v52;
  long long v49 = (void *)MEMORY[0x263F8EE78];
  id v11 = v50;
  id v12 = v9;
  id v13 = v10;
  sub_24CAE2E24(0, 3, 0);
  uint64_t v14 = v49;
  uint64_t v15 = self;
  id v16 = v11;
  id v17 = objc_msgSend(v15, sel_defaultCenter);
  sub_24CAE5E50();

  unint64_t v19 = v14[2];
  unint64_t v18 = v14[3];
  if (v19 >= v18 >> 1)
  {
    sub_24CAE2E24(v18 > 1, v19 + 1, 1);
    uint64_t v14 = v49;
  }
  v40[1] = &v50;
  v14[2] = v19 + 1;
  unint64_t v20 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v21 = *(void *)(v0 + 72);
  uint64_t v22 = (char *)v14 + v20 + v21 * v19;
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v0 + 32);
  v23(v22, v2, v48);
  id v24 = v51;
  id v25 = objc_msgSend(v15, sel_defaultCenter);
  sub_24CAE5E50();

  long long v49 = v14;
  unint64_t v27 = v14[2];
  unint64_t v26 = v14[3];
  if (v27 >= v26 >> 1)
  {
    sub_24CAE2E24(v26 > 1, v27 + 1, 1);
    uint64_t v14 = v49;
  }
  v14[2] = v27 + 1;
  uint64_t v28 = v48;
  v23((char *)v14 + v20 + v27 * v21, v2, v48);
  id v29 = v52;
  id v30 = objc_msgSend(v15, sel_defaultCenter);
  sub_24CAE5E50();

  long long v49 = v14;
  unint64_t v32 = v14[2];
  unint64_t v31 = v14[3];
  if (v32 >= v31 >> 1)
  {
    sub_24CAE2E24(v31 > 1, v32 + 1, 1);
    uint64_t v14 = v49;
  }
  v14[2] = v32 + 1;
  v23((char *)v14 + v20 + v32 * v21, v2, v28);
  type metadata accessor for Name(0);
  swift_arrayDestroy();
  long long v49 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980B788);
  sub_24CADF408(&qword_26980B790, MEMORY[0x263F07CB0]);
  sub_24CADF3C4(&qword_26980B798, &qword_26980B788);
  id v33 = v41;
  sub_24CAE5870();
  sub_24CAB6F70();
  long long v49 = (void *)sub_24CAE5DD0();
  uint64_t v34 = sub_24CAE5DC0();
  uint64_t v35 = (uint64_t)v42;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v42, 1, 1, v34);
  sub_24CADF3C4(&qword_26980B7A0, &qword_26980B778);
  sub_24CADF408(&qword_26980B7A8, (void (*)(uint64_t))sub_24CAB6F70);
  uint64_t v36 = v44;
  uint64_t v37 = v45;
  sub_24CAE5920();
  sub_24CAA51D0(v35, &qword_26980B770);

  (*(void (**)(char *, uint64_t))(v43 + 8))(v33, v36);
  swift_allocObject();
  swift_weakInit();
  sub_24CADF3C4(&qword_26980B7B0, &qword_26980B780);
  uint64_t v38 = v47;
  sub_24CAE5930();
  swift_release();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v37, v38);
  swift_beginAccess();
  sub_24CAE5880();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24CADAE54(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = v1;
    sub_24CADAEC0(&v3);
    return swift_release();
  }
  return result;
}

uint64_t *sub_24CADAEC0(uint64_t *result)
{
  uint64_t v1 = *result;
  if (*result)
  {
    if (v1 == 1)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v17 = 0u;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_24CADF044((uint64_t)&v17, (uint64_t)&v12, &qword_26980B680);
      swift_retain();
      sub_24CAE5900();
      uint64_t v2 = &v17;
      return (uint64_t *)sub_24CAA51D0((uint64_t)v2, &qword_26980B680);
    }
    if (*(void *)(v1 + 16))
    {
      sub_24CAA9C00(v1 + 32, (uint64_t)&v12);
    }
    else
    {
      *(void *)&long long v14 = 0;
      long long v12 = 0u;
      long long v13 = 0u;
    }
    sub_24CADF044((uint64_t)&v12, (uint64_t)&v15, &qword_26980B748);
    if (v16)
    {
      sub_24CAD9050(&v15, (uint64_t)v11);
      sub_24CAA9C00((uint64_t)v11, (uint64_t)&v17);
      *((void *)&v19 + 1) = 0;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v17 = 0u;
    }
    sub_24CAA51D0((uint64_t)&v12, &qword_26980B748);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24CADF044((uint64_t)&v17, (uint64_t)&v12, &qword_26980B680);
    swift_retain();
    sub_24CAE5900();
    sub_24CAA51D0((uint64_t)&v17, &qword_26980B680);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24CAE58F0();
    swift_release();
    swift_release();
    if (!*((void *)&v13 + 1))
    {
      uint64_t v2 = &v12;
      return (uint64_t *)sub_24CAA51D0((uint64_t)v2, &qword_26980B680);
    }
    long long v18 = v13;
    long long v19 = v14;
    long long v17 = v12;
    uint64_t v3 = *((void *)&v13 + 1);
    uint64_t v4 = v14;
    __swift_project_boxed_opaque_existential_1(&v17, *((uint64_t *)&v13 + 1));
    (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v4 + 24))(&v12, v3, v4);
    uint64_t v5 = v12;
    char v6 = BYTE8(v12);
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)&long long v15 = v5;
    BYTE8(v15) = v6;
    swift_retain();
    sub_24CAE5900();
    uint64_t v7 = *((void *)&v18 + 1);
    uint64_t v8 = v19;
    __swift_project_boxed_opaque_existential_1(&v17, *((uint64_t *)&v18 + 1));
    (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v8 + 32))(&v12, v7, v8);
    BOOL v9 = v13 > 1u;
    if (v13 <= 1u) {
      uint64_t v10 = v12;
    }
    else {
      uint64_t v10 = 0;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)&long long v12 = v10;
    BYTE8(v12) = v9;
    swift_retain();
    sub_24CAE5900();
    sub_24CADB8E0(&v17);
    return (uint64_t *)sub_24CADF014((uint64_t)&v17);
  }
  return result;
}

Swift::Void __swiftcall HealthKitProvider.start()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AE68);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_historyObserver);
  if (*(void *)(v4 + 56))
  {
    if (qword_26980A7C0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24CAE5860();
    __swift_project_value_buffer(v5, (uint64_t)qword_26980B960);
    os_log_t v12 = (os_log_t)sub_24CAE5840();
    os_log_type_t v6 = sub_24CAE5D90();
    if (os_log_type_enabled(v12, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_24CA9E000, v12, v6, "DiveHistorySource: start() should not be called multiple times", v7, 2u);
      MEMORY[0x253308900](v7, -1, -1);
    }
    os_log_t v8 = v12;
  }
  else
  {
    sub_24CAE0220();
    uint64_t v9 = sub_24CAE5D00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = v4;
    swift_retain();
    sub_24CAD8CA4((uint64_t)v3, (uint64_t)&unk_26980B6D0, (uint64_t)v10);
    swift_release();
  }
}

uint64_t sub_24CADB3E4(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24CADB444(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_24CADB444(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24CAE5640();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26980A7D0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24CAE5860();
  __swift_project_value_buffer(v8, (uint64_t)qword_26980B990);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v9 = sub_24CAE5840();
  os_log_type_t v10 = sub_24CAE5DA0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    v17[1] = v2;
    os_log_t v12 = (uint8_t *)v11;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v18 = v13;
    *(_DWORD *)os_log_t v12 = 136315138;
    sub_24CADF408(&qword_26980B7B8, MEMORY[0x263F06320]);
    uint64_t v14 = sub_24CAE61B0();
    _OWORD v17[2] = sub_24CAA4228(v14, v15, &v18);
    sub_24CAE5ED0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl(&dword_24CA9E000, v9, v10, "HealthKitProvider: Received notification: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253308900](v13, -1, -1);
    MEMORY[0x253308900](v12, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  return sub_24CADB6E8();
}

uint64_t sub_24CADB6E8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CAE58F0();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CADF044((uint64_t)&v7, (uint64_t)&v5, &qword_26980B680);
  swift_retain();
  sub_24CAE5900();
  sub_24CAA51D0((uint64_t)&v7, &qword_26980B680);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CAE58F0();
  swift_release();
  swift_release();
  uint64_t v0 = v7;
  char v1 = v8;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v5 = v0;
  char v6 = v1;
  swift_retain();
  sub_24CAE5900();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CAE58F0();
  swift_release();
  swift_release();
  uint64_t v2 = v7;
  char v3 = v8;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v5 = v2;
  char v6 = v3;
  swift_retain();
  return sub_24CAE5900();
}

void sub_24CADB8E0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AE68);
  MEMORY[0x270FA5388](v4 - 8);
  char v62 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_24CAE57A0();
  uint64_t v60 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v59 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B6D8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  os_log_type_t v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  os_log_t v12 = (char *)&v52 - v11;
  uint64_t Operation = type metadata accessor for GraphFetchOperation(0);
  uint64_t v14 = *(void *)(Operation - 8);
  MEMORY[0x270FA5388](Operation);
  uint64_t v16 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = a1[3];
  uint64_t v17 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v18);
  double v19 = (*(double (**)(uint64_t, uint64_t))(v17 + 40))(v18, v17);
  if (DepthSettings.deepDiveTimeThreshold.getter() <= v19)
  {
    uint64_t v30 = v1 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_graphFetchOperation;
    swift_beginAccess();
    sub_24CADF044(v30, (uint64_t)v12, &qword_26980B6D8);
    int v31 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, Operation);
    uint64_t v32 = v1;
    uint64_t v58 = v14;
    if (v31 == 1)
    {
      sub_24CAA51D0((uint64_t)v12, &qword_26980B6D8);
    }
    else
    {
      sub_24CADF21C((uint64_t)v12, (uint64_t)v16, type metadata accessor for GraphFetchOperation);
      if (qword_26980A7C8 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_24CAE5860();
      __swift_project_value_buffer(v33, (uint64_t)qword_26980B978);
      sub_24CAA9C00((uint64_t)a1, (uint64_t)&v66);
      uint64_t v34 = sub_24CAE5840();
      os_log_type_t v35 = sub_24CAE5DA0();
      int v36 = v35;
      if (os_log_type_enabled(v34, v35))
      {
        os_log_t v56 = v34;
        uint64_t v37 = swift_slowAlloc();
        int v54 = v36;
        uint64_t v38 = (uint8_t *)v37;
        uint64_t v55 = swift_slowAlloc();
        uint64_t v65 = v55;
        long long v53 = v38;
        *(_DWORD *)uint64_t v38 = 136315138;
        id v52 = v38 + 4;
        uint64_t v57 = v2;
        __swift_project_boxed_opaque_existential_1(&v66, v67);
        uint64_t v39 = v59;
        sub_24CAE5F60();
        sub_24CADF408((unint64_t *)&qword_26980AB50, MEMORY[0x263F07508]);
        uint64_t v40 = v61;
        uint64_t v41 = sub_24CAE61B0();
        unint64_t v43 = v42;
        (*(void (**)(char *, uint64_t))(v60 + 8))(v39, v40);
        uint64_t v63 = sub_24CAA4228(v41, v43, &v65);
        sub_24CAE5ED0();
        uint64_t v32 = v57;
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v66);
        uint64_t v34 = v56;
        uint64_t v44 = v53;
        _os_log_impl(&dword_24CA9E000, v56, (os_log_type_t)v54, "HealthKitProvider: Cancelling existing graph fetch for uuid=%s", v53, 0xCu);
        uint64_t v45 = v55;
        swift_arrayDestroy();
        MEMORY[0x253308900](v45, -1, -1);
        MEMORY[0x253308900](v44, -1, -1);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v66);
      }

      swift_retain();
      sub_24CAE5D10();
      swift_release();
      sub_24CADF2EC((uint64_t)v16, type metadata accessor for GraphFetchOperation);
    }
    uint64_t v46 = sub_24CAE5D00();
    uint64_t v47 = (uint64_t)v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v62, 1, 1, v46);
    sub_24CAA9C00((uint64_t)a1, (uint64_t)&v66);
    sub_24CAE5CE0();
    swift_retain();
    uint64_t v48 = sub_24CAE5CD0();
    long long v49 = (void *)swift_allocObject();
    uint64_t v50 = MEMORY[0x263F8F500];
    v49[2] = v48;
    v49[3] = v50;
    sub_24CAD9050(&v66, (uint64_t)(v49 + 4));
    v49[9] = v32;
    uint64_t v51 = sub_24CAD8CA4(v47, (uint64_t)&unk_26980B758, (uint64_t)v49);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_24CAE5F60();
    *(void *)&v10[*(int *)(Operation + 20)] = v51;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v58 + 56))(v10, 0, 1, Operation);
    swift_beginAccess();
    sub_24CADF1B4((uint64_t)v10, v30);
    swift_endAccess();
  }
  else
  {
    if (qword_26980A7C8 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_24CAE5860();
    __swift_project_value_buffer(v20, (uint64_t)qword_26980B978);
    sub_24CAA9C00((uint64_t)a1, (uint64_t)&v66);
    uint64_t v21 = sub_24CAE5840();
    os_log_type_t v22 = sub_24CAE5DA0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v64[0] = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      __swift_project_boxed_opaque_existential_1(&v66, v67);
      id v25 = v59;
      sub_24CAE5F60();
      sub_24CADF408((unint64_t *)&qword_26980AB50, MEMORY[0x263F07508]);
      uint64_t v26 = v61;
      uint64_t v27 = sub_24CAE61B0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v60 + 8))(v25, v26);
      uint64_t v65 = sub_24CAA4228(v27, v29, v64);
      sub_24CAE5ED0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v66);
      _os_log_impl(&dword_24CA9E000, v21, v22, "HealthKitProvider: Graph data not needed for dive uuid=%s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253308900](v24, -1, -1);
      MEMORY[0x253308900](v23, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v66);
    }
  }
}

uint64_t sub_24CADC1A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[22] = a4;
  v5[23] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B760);
  v5[24] = v6;
  v5[25] = *(void *)(v6 - 8);
  v5[26] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980B768);
  v5[27] = swift_task_alloc();
  v5[28] = swift_task_alloc();
  uint64_t v7 = sub_24CAE57A0();
  v5[29] = v7;
  v5[30] = *(void *)(v7 - 8);
  v5[31] = swift_task_alloc();
  v5[32] = swift_task_alloc();
  sub_24CAE5CE0();
  v5[33] = sub_24CAE5CD0();
  uint64_t v9 = sub_24CAE5CC0();
  v5[34] = v9;
  v5[35] = v8;
  return MEMORY[0x270FA2498](sub_24CADC348, v9, v8);
}

uint64_t sub_24CADC348()
{
  uint64_t v18 = v0;
  if (qword_26980A7C8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[22];
  uint64_t v2 = sub_24CAE5860();
  v0[36] = __swift_project_value_buffer(v2, (uint64_t)qword_26980B978);
  sub_24CAA9C00(v1, (uint64_t)(v0 + 2));
  char v3 = sub_24CAE5840();
  os_log_type_t v4 = sub_24CAE5DA0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = v0[32];
    uint64_t v7 = v0[29];
    uint64_t v6 = v0[30];
    os_log_type_t type = v4;
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v8 = 136315138;
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    sub_24CAE5F60();
    sub_24CADF408((unint64_t *)&qword_26980AB50, MEMORY[0x263F07508]);
    uint64_t v9 = sub_24CAE61B0();
    unint64_t v11 = v10;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    v0[21] = sub_24CAA4228(v9, v11, &v17);
    sub_24CAE5ED0();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
    _os_log_impl(&dword_24CA9E000, v3, type, "HealthKitProvider: Starting graph data fetch for uuid=%s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253308900](v15, -1, -1);
    MEMORY[0x253308900](v8, -1, -1);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  }

  __swift_project_boxed_opaque_existential_1((void *)v0[22], *(void *)(v0[22] + 24));
  sub_24CAE5F60();
  os_log_t v12 = (void *)swift_task_alloc();
  v0[37] = v12;
  void *v12 = v0;
  v12[1] = sub_24CADC64C;
  uint64_t v13 = v0[31];
  return sub_24CABA588(v13, 40);
}

uint64_t sub_24CADC64C(uint64_t a1)
{
  char v3 = *(void **)v2;
  os_log_type_t v4 = *(void **)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 248);
  uint64_t v6 = *(void *)(*(void *)v2 + 240);
  uint64_t v7 = *(void *)(*(void *)v2 + 232);
  v4[38] = a1;
  v4[39] = v1;
  swift_task_dealloc();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v4[40] = v8;
  v4[41] = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v8(v5, v7);
  uint64_t v9 = v3[35];
  uint64_t v10 = v3[34];
  if (v1) {
    unint64_t v11 = sub_24CADCDD8;
  }
  else {
    unint64_t v11 = sub_24CADC800;
  }
  return MEMORY[0x270FA2498](v11, v10, v9);
}

void sub_24CADC800()
{
  long long v53 = v0;
  uint64_t v1 = v0[38];
  uint64_t v2 = v0[25];
  uint64_t v51 = v0[24];
  swift_release();
  unint64_t v3 = *(void *)(v1 + 16);
  os_log_type_t v4 = (void (**)(void, void, void, void))(v2 + 56);
  uint64_t v5 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  uint64_t v48 = v1;
  swift_bridgeObjectRetain();
  unint64_t v6 = 0;
  while (1)
  {
    if (v6 == v3)
    {
      (*v4)(v0[27], 1, 1, v0[24]);
      unint64_t v6 = v3;
    }
    else
    {
      if (v6 >= *(void *)(v48 + 16))
      {
        __break(1u);
        return;
      }
      uint64_t v7 = v0[38];
      uint64_t v9 = v0[26];
      uint64_t v8 = (unint64_t *)v0[27];
      uint64_t v49 = v0[24];
      uint64_t v10 = *(void *)(type metadata accessor for DepthIntervalSummary() - 8);
      uint64_t v11 = v7
          + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
          + *(void *)(v10 + 72) * v6;
      uint64_t v12 = v9 + *(int *)(v51 + 48);
      sub_24CABCF74(v11, v12);
      uint64_t v13 = (uint64_t)v8 + *(int *)(v51 + 48);
      unint64_t *v8 = v6;
      sub_24CADF21C(v12, v13, (uint64_t (*)(void))type metadata accessor for DepthIntervalSummary);
      (*v4)(v8, 0, 1, v49);
      ++v6;
    }
    uint64_t v14 = v0[28];
    uint64_t v15 = v0[24];
    sub_24CADF284(v0[27], v14);
    if ((*v5)(v14, 1, v15) == 1) {
      break;
    }
    uint64_t v16 = (uint64_t *)v0[28];
    uint64_t v17 = *v16;
    uint64_t v18 = (uint64_t)v16 + *(int *)(v51 + 48);
    uint64_t v19 = v18 + *(int *)(type metadata accessor for DepthIntervalSummary() + 20);
    uint64_t v21 = *(void *)v19;
    uint64_t v20 = *(void *)(v19 + 8);
    char v22 = *(unsigned char *)(v19 + 16);
    sub_24CADF2EC(v18, (uint64_t (*)(void))type metadata accessor for DepthIntervalSummary);
    uint64_t v23 = sub_24CAE5840();
    os_log_type_t v24 = sub_24CAE5DA0();
    BOOL v25 = os_log_type_enabled(v23, v24);
    if (v22)
    {
      if (v25)
      {
        uint64_t v26 = swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = 134217984;
        *(void *)(v26 + 4) = v17;
        os_log_type_t v27 = v24;
        unint64_t v28 = v23;
        unint64_t v29 = "HealthKitProvider: %ld: NULL";
        uint64_t v30 = (uint8_t *)v26;
        uint32_t v31 = 12;
LABEL_2:
        _os_log_impl(&dword_24CA9E000, v28, v27, v29, v30, v31);
        MEMORY[0x253308900](v26, -1, -1);
      }
    }
    else if (v25)
    {
      uint64_t v26 = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 134218496;
      *(void *)(v26 + 4) = v17;
      *(_WORD *)(v26 + 12) = 2048;
      *(void *)(v26 + 14) = v21;
      *(_WORD *)(v26 + 22) = 2048;
      *(void *)(v26 + 24) = v20;
      os_log_type_t v27 = v24;
      unint64_t v28 = v23;
      unint64_t v29 = "HealthKitProvider: %ld: %f-%f";
      uint64_t v30 = (uint8_t *)v26;
      uint32_t v31 = 32;
      goto LABEL_2;
    }
  }
  uint64_t v32 = v0[22];
  swift_bridgeObjectRelease();
  uint64_t v46 = v0 + 12;
  sub_24CAA9C00(v32, (uint64_t)(v0 + 12));
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_24CAE5840();
  os_log_type_t v34 = sub_24CAE5DA0();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v50 = (void (*)(uint64_t, uint64_t))v0[40];
    uint64_t v35 = v0[32];
    uint64_t v36 = v0[29];
    uint64_t v37 = swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    uint64_t v52 = v47;
    *(_DWORD *)uint64_t v37 = 134218242;
    v0[19] = *(void *)(v48 + 16);
    sub_24CAE5ED0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v37 + 12) = 2080;
    __swift_project_boxed_opaque_existential_1(v46, v0[15]);
    sub_24CAE5F60();
    sub_24CADF408((unint64_t *)&qword_26980AB50, MEMORY[0x263F07508]);
    uint64_t v38 = sub_24CAE61B0();
    unint64_t v40 = v39;
    v50(v35, v36);
    v0[20] = sub_24CAA4228(v38, v40, &v52);
    sub_24CAE5ED0();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v46);
    _os_log_impl(&dword_24CA9E000, v33, v34, "HealthKitProvider: Completed graph fetch with count=%ld for uuid=%s", (uint8_t *)v37, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253308900](v47, -1, -1);
    MEMORY[0x253308900](v37, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v46);
  }

  uint64_t v41 = (void (*)(uint64_t, uint64_t))v0[40];
  uint64_t v42 = v0[38];
  uint64_t v43 = v0[32];
  uint64_t v44 = v0[29];
  __swift_project_boxed_opaque_existential_1((void *)v0[22], *(void *)(v0[22] + 24));
  sub_24CAE5F60();
  sub_24CADD0FC(v42, v43);
  swift_bridgeObjectRelease();
  v41(v43, v44);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v45 = (void (*)(void))v0[1];
  v45();
}

uint64_t sub_24CADCDD8()
{
  uint64_t v23 = v0;
  uint64_t v1 = (void *)v0[39];
  uint64_t v2 = v0[22];
  swift_release();
  sub_24CAA9C00(v2, (uint64_t)(v0 + 7));
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_24CAE5840();
  os_log_type_t v6 = sub_24CAE5D90();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (void *)v0[39];
    uint64_t v19 = (void (*)(uint64_t, uint64_t))v0[40];
    uint64_t v8 = v0[32];
    uint64_t v9 = v0[29];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v20 = (void *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = v21;
    *(_DWORD *)uint64_t v10 = 136315394;
    __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
    sub_24CAE5F60();
    sub_24CADF408((unint64_t *)&qword_26980AB50, MEMORY[0x263F07508]);
    uint64_t v11 = sub_24CAE61B0();
    unint64_t v13 = v12;
    v19(v8, v9);
    v0[18] = sub_24CAA4228(v11, v13, &v22);
    sub_24CAE5ED0();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 7));
    *(_WORD *)(v10 + 12) = 2112;
    id v14 = v7;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    v0[17] = v15;
    sub_24CAE5ED0();
    *uint64_t v20 = v15;

    _os_log_impl(&dword_24CA9E000, v5, v6, "HealthKitProvider: Failed to fetch graph data for uuid=%s with error=%@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980B148);
    swift_arrayDestroy();
    MEMORY[0x253308900](v20, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x253308900](v21, -1, -1);
    MEMORY[0x253308900](v10, -1, -1);
  }
  else
  {
    uint64_t v16 = (void *)v0[39];

    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 7));
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

void sub_24CADD0FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CAE57A0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v37 - v9;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24CAE58F0();
  swift_release();
  swift_release();
  if (*((void *)&v44 + 1))
  {
    v46[1] = v44;
    v46[2] = v45;
    v46[0] = v43;
    __swift_project_boxed_opaque_existential_1(v46, *((uint64_t *)&v44 + 1));
    sub_24CAE5F60();
    char v11 = _s9DepthCore11DiveSummaryV2eeoiySbAC_ACtFZ_0();
    unint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
    v12(v10, v4);
    if (v11)
    {
      unint64_t v40 = v12;
      if (qword_26980A7C8 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_24CAE5860();
      __swift_project_value_buffer(v13, (uint64_t)qword_26980B978);
      sub_24CADF34C((uint64_t)v46, (uint64_t)&v43);
      id v14 = sub_24CAE5840();
      os_log_type_t v15 = sub_24CAE5DA0();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        v41[0] = v38;
        uint64_t v39 = a1;
        *(_DWORD *)uint64_t v16 = 136315138;
        v37[1] = v16 + 4;
        __swift_project_boxed_opaque_existential_1(&v43, *((uint64_t *)&v44 + 1));
        sub_24CAE5F60();
        sub_24CADF408((unint64_t *)&qword_26980AB50, MEMORY[0x263F07508]);
        uint64_t v17 = sub_24CAE61B0();
        unint64_t v19 = v18;
        v40(v10, v4);
        uint64_t v42 = sub_24CAA4228(v17, v19, v41);
        a1 = v39;
        sub_24CAE5ED0();
        swift_bridgeObjectRelease();
        sub_24CADF014((uint64_t)&v43);
        _os_log_impl(&dword_24CA9E000, v14, v15, "HealthKitProvider: Adding graph data for uuid=%s", v16, 0xCu);
        uint64_t v20 = v38;
        swift_arrayDestroy();
        MEMORY[0x253308900](v20, -1, -1);
        MEMORY[0x253308900](v16, -1, -1);
      }
      else
      {
        sub_24CADF014((uint64_t)&v43);
      }

      sub_24CAA9C00((uint64_t)v46, (uint64_t)&v43);
      *((void *)&v45 + 1) = a1;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_24CADF044((uint64_t)&v43, (uint64_t)v41, &qword_26980B680);
      swift_bridgeObjectRetain();
      swift_retain();
      sub_24CAE5900();
      sub_24CAA51D0((uint64_t)&v43, &qword_26980B680);
    }
    else
    {
      if (qword_26980A7C8 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_24CAE5860();
      __swift_project_value_buffer(v25, (uint64_t)qword_26980B978);
      sub_24CADF34C((uint64_t)v46, (uint64_t)&v43);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a2, v4);
      uint64_t v26 = sub_24CAE5840();
      os_log_type_t v27 = sub_24CAE5DA0();
      int v28 = v27;
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v29 = swift_slowAlloc();
        unint64_t v40 = (void (*)(char *, uint64_t))swift_slowAlloc();
        v41[0] = (uint64_t)v40;
        *(_DWORD *)uint64_t v29 = 136315394;
        uint64_t v38 = v29 + 4;
        LODWORD(v39) = v28;
        __swift_project_boxed_opaque_existential_1(&v43, *((uint64_t *)&v44 + 1));
        sub_24CAE5F60();
        sub_24CADF408((unint64_t *)&qword_26980AB50, MEMORY[0x263F07508]);
        uint64_t v30 = sub_24CAE61B0();
        uint32_t v31 = v12;
        unint64_t v33 = v32;
        v31(v10, v4);
        uint64_t v42 = sub_24CAA4228(v30, v33, v41);
        sub_24CAE5ED0();
        swift_bridgeObjectRelease();
        sub_24CADF014((uint64_t)&v43);
        *(_WORD *)(v29 + 12) = 2080;
        uint64_t v34 = sub_24CAE61B0();
        uint64_t v42 = sub_24CAA4228(v34, v35, v41);
        sub_24CAE5ED0();
        swift_bridgeObjectRelease();
        v31(v8, v4);
        _os_log_impl(&dword_24CA9E000, v26, (os_log_type_t)v39, "HealthKitProvider: Not updating lastDive graph data, current dive is %s, graph data supplied for %s", (uint8_t *)v29, 0x16u);
        uint64_t v36 = v40;
        swift_arrayDestroy();
        MEMORY[0x253308900](v36, -1, -1);
        MEMORY[0x253308900](v29, -1, -1);
      }
      else
      {
        sub_24CADF014((uint64_t)&v43);
        v12(v8, v4);
      }
    }
    sub_24CADF014((uint64_t)v46);
  }
  else
  {
    sub_24CAA51D0((uint64_t)&v43, &qword_26980B680);
    if (qword_26980A7C8 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_24CAE5860();
    __swift_project_value_buffer(v21, (uint64_t)qword_26980B978);
    uint64_t v22 = sub_24CAE5840();
    os_log_type_t v23 = sub_24CAE5DA0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_24CA9E000, v22, v23, "HealthKitProvider: Not updating lastDive graphData, lastDive is nil", v24, 2u);
      MEMORY[0x253308900](v24, -1, -1);
    }
  }
}

uint64_t HealthKitProvider.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B650);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B668);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B688);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  long long v7 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 112);
  v13[6] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 96);
  v13[7] = v7;
  long long v8 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 144);
  v13[8] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 128);
  v13[9] = v8;
  long long v9 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 48);
  v13[2] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 32);
  _OWORD v13[3] = v9;
  long long v10 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 80);
  v13[4] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 64);
  v13[5] = v10;
  long long v11 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 16);
  v13[0] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration);
  v13[1] = v11;
  sub_24CADDCD4((uint64_t)v13);
  swift_release();
  swift_release();
  sub_24CAA51D0(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_graphFetchOperation, &qword_26980B6D8);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t HealthKitProvider.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B650);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B668);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B688);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  long long v7 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 112);
  v13[6] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 96);
  v13[7] = v7;
  long long v8 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 144);
  v13[8] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 128);
  v13[9] = v8;
  long long v9 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 48);
  v13[2] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 32);
  _OWORD v13[3] = v9;
  long long v10 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 80);
  v13[4] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 64);
  v13[5] = v10;
  long long v11 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 16);
  v13[0] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration);
  v13[1] = v11;
  sub_24CADDCD4((uint64_t)v13);
  swift_release();
  swift_release();
  sub_24CAA51D0(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_graphFetchOperation, &qword_26980B6D8);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_24CADDBA0()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CADDBD8(uint64_t *a1)
{
  return sub_24CADAE54(a1);
}

uint64_t sub_24CADDBE0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CADDC20()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CAB90A4;
  return sub_24CAE2320();
}

uint64_t sub_24CADDCD4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 104);
  uint64_t v3 = *(void *)(a1 + 112);
  uint64_t v4 = *(void *)(a1 + 120);
  uint64_t v5 = *(void *)(a1 + 128);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 136);
  sub_24CAA5D50(*(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(unsigned char *)(a1 + 96));
  sub_24CAA5D68(v2, v3, v4, v5, v6);
  return a1;
}

uint64_t sub_24CADDD3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CAD9BE0(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth, &qword_26980B650);
}

uint64_t sub_24CADDD64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CAD9C50(a1, a2, a3, a4, &qword_26980B658, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth, &qword_26980B650);
}

uint64_t sub_24CADDD94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CAD9BE0(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature, &qword_26980B668);
}

uint64_t sub_24CADDDBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CAD9C50(a1, a2, a3, a4, &qword_26980B670, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature, &qword_26980B668);
}

uint64_t sub_24CADDDEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CAD9BE0(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive, &qword_26980B688);
}

uint64_t sub_24CADDE14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24CAD9C50(a1, a2, a3, a4, &qword_26980B690, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive, &qword_26980B688);
}

uint64_t destroy for LastDive(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LastDive(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for LastDive(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
      }
      else
      {
        long long v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *uint64_t result = *a2;
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
          uint64_t *v3 = *a2;
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

uint64_t assignWithTake for LastDive(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LastDive(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LastDive(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LastDive()
{
  return &type metadata for LastDive;
}

uint64_t sub_24CADE248()
{
  return type metadata accessor for HealthKitProvider(0);
}

uint64_t type metadata accessor for HealthKitProvider(uint64_t a1)
{
  return sub_24CAD4F70(a1, (uint64_t *)&unk_26980B6E0);
}

void sub_24CADE270()
{
  sub_24CADE420(319, &qword_26980B6F0);
  if (v0 <= 0x3F)
  {
    sub_24CADE420(319, &qword_26980B6F8);
    if (v1 <= 0x3F)
    {
      sub_24CADE468();
      if (v2 <= 0x3F)
      {
        sub_24CADE4C4();
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t method lookup function for HealthKitProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HealthKitProvider);
}

uint64_t dispatch thunk of HealthKitProvider.__allocating_init(withConfiguration:healthStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

void sub_24CADE420(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_24CAE5910();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_24CADE468()
{
  if (!qword_26980B700)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26980B680);
    unint64_t v0 = sub_24CAE5910();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26980B700);
    }
  }
}

void sub_24CADE4C4()
{
  if (!qword_26980B708)
  {
    type metadata accessor for GraphFetchOperation(255);
    unint64_t v0 = sub_24CAE5EB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26980B708);
    }
  }
}

uint64_t *sub_24CADE51C(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_24CAE57A0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_24CADE5E8(uint64_t a1)
{
  uint64_t v2 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_24CADE65C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_24CADE6DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_24CADE768(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_24CADE7E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CAE57A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_24CADE868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CADE87C);
}

uint64_t sub_24CADE87C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CAE57A0();
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

uint64_t sub_24CADE93C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CADE950);
}

uint64_t sub_24CADE950(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24CAE57A0();
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

uint64_t sub_24CADEA0C()
{
  uint64_t result = sub_24CAE57A0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CADEAA4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24CADEB80;
  return v6(a1);
}

uint64_t sub_24CADEB80()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CADEC78(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  int v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  void *v3 = v2;
  v3[1] = sub_24CADED58;
  return v5(v2 + 32);
}

uint64_t sub_24CADED58()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_24CADEE6C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CADEEA4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CAB8C68;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26980B720 + dword_26980B720);
  return v6(a1, v4);
}

uint64_t sub_24CADEF5C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CAB90A4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26980B738 + dword_26980B738);
  return v6(a1, v4);
}

uint64_t sub_24CADF014(uint64_t a1)
{
  return a1;
}

uint64_t sub_24CADF044(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CADF0A8()
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 32);
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_24CADF0F0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (uint64_t)(v1 + 4);
  uint64_t v7 = v1[9];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24CAB8C68;
  return sub_24CADC1A4(a1, v4, v5, v6, v7);
}

uint64_t sub_24CADF1B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B6D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CADF21C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CADF284(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CADF2EC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24CADF34C(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2, a1);
  *(void *)(a2 + 40) = *(void *)(a1 + 40);
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_24CADF3BC(uint64_t a1)
{
  return sub_24CADB3E4(a1);
}

uint64_t sub_24CADF3C4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24CADF408(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t DepthFormattingOptions.includeUnits.getter()
{
  return *v0;
}

uint64_t DepthFormattingOptions.includeUnits.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*DepthFormattingOptions.includeUnits.modify())()
{
  return nullsub_1;
}

uint64_t DepthFormattingOptions.stripWhitespace.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t DepthFormattingOptions.stripWhitespace.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*DepthFormattingOptions.stripWhitespace.modify())()
{
  return nullsub_1;
}

uint64_t DepthFormattingOptions.allowFractional.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t DepthFormattingOptions.allowFractional.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 2) = result;
  return result;
}

uint64_t (*DepthFormattingOptions.allowFractional.modify())()
{
  return nullsub_1;
}

uint64_t DepthFormattingOptions.verboseMaxDepth.getter()
{
  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t DepthFormattingOptions.verboseMaxDepth.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 3) = result;
  return result;
}

uint64_t (*DepthFormattingOptions.verboseMaxDepth.modify())()
{
  return nullsub_1;
}

DepthCore::DepthFormattingOptions __swiftcall DepthFormattingOptions.init(includeUnits:stripWhitespace:allowFractional:verboseMaxDepth:)(Swift::Bool_optional includeUnits, Swift::Bool_optional stripWhitespace, Swift::Bool_optional allowFractional, Swift::Bool_optional verboseMaxDepth)
{
  *long long v4 = includeUnits.value;
  v4[1] = stripWhitespace.value;
  v4[2] = allowFractional.value == 2 || allowFractional.value;
  v4[3] = verboseMaxDepth.value == 2 || verboseMaxDepth.value;
  result.includeUnits = includeUnits.value;
  return result;
}

double static DepthFormattingOptions.defaults.getter@<D0>(_DWORD *a1@<X8>)
{
  *(void *)&double result = 16842752;
  *a1 = 16842752;
  return result;
}

uint64_t DepthFormatter.format(depth:options:)(uint64_t *a1, char *a2)
{
  uint64_t v3 = *a1;
  unsigned int v4 = *((unsigned __int8 *)a1 + 8);
  char v5 = *a2;
  if (v4 < 2)
  {
    char v6 = a2[2];
    int v7 = a2[1];
    uint64_t v9 = *a1;
    return sub_24CAA5E64((double *)&v9, v5, v7, v6);
  }
  if (v4 == 2) {
    return sub_24CAA9C80();
  }
  if (v3)
  {
    if (v3 == 1) {
      return sub_24CAA6894(v5);
    }
    return sub_24CAA9C80();
  }
  return 11565;
}

Swift::String __swiftcall DepthFormatter.format(nominal:options:)(DepthCore::DepthValue nominal, DepthCore::DepthFormattingOptions options)
{
  double v4 = **(double **)&options.includeUnits;
  if (*(unsigned char *)(v3 + OBJC_IVAR___DKDepthFormatter_configuration + 138))
  {
    if (*v2) {
      goto LABEL_5;
    }
LABEL_6:
    sub_24CAA9C64();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB20);
    uint64_t v10 = swift_allocObject();
    uint64_t v11 = MEMORY[0x263F8D538];
    *(_OWORD *)(v10 + 16) = xmmword_24CAE6F00;
    uint64_t v12 = MEMORY[0x263F8D5B8];
    *(void *)(v10 + 56) = v11;
    *(void *)(v10 + 64) = v12;
    *(double *)(v10 + 32) = v4;
    goto LABEL_7;
  }
  double v4 = v4 * 3.2808399;
  if ((*v2 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_5:
  sub_24CAE5F30();
  swift_bridgeObjectRelease();
  sub_24CAE5BB0();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_24CAA9C64();
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  sub_24CAA9C64();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB20);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_24CAE6F10;
  uint64_t v9 = MEMORY[0x263F8D5B8];
  *(void *)(v8 + 56) = MEMORY[0x263F8D538];
  *(void *)(v8 + 64) = v9;
  *(double *)(v8 + 32) = v4;
  *(void *)(v8 + 96) = MEMORY[0x263F8D310];
  *(void *)(v8 + 104) = sub_24CAA7F30();
  *(void *)(v8 + 72) = v5;
  *(void *)(v8 + 80) = v7;
LABEL_7:
  uint64_t v13 = sub_24CAE5B40();
  os_log_type_t v15 = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = v13;
  uint64_t v17 = v15;
  result._object = v17;
  result._countAndFlagsBits = v16;
  return result;
}

uint64_t DepthFormatter.formatMaxDepth(summary:options:)(void *a1, unsigned __int8 *a2)
{
  uint64_t v5 = sub_24CAE57A0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v9 = *a2;
  LODWORD(v45[0]) = a2[1];
  int v10 = a2[3];
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v11);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 64))(v11, v12);
  if (!v14)
  {
    if (qword_26980A7C0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_24CAE5860();
    __swift_project_value_buffer(v22, (uint64_t)qword_26980B960);
    sub_24CAA9C00((uint64_t)a1, (uint64_t)&v47);
    os_log_type_t v23 = sub_24CAE5840();
    os_log_type_t v24 = sub_24CAE5DA0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v46 = v26;
      *(_DWORD *)uint64_t v25 = 136315138;
      v45[0] = v25 + 4;
      __swift_project_boxed_opaque_existential_1(&v47, v49);
      sub_24CAE5F60();
      sub_24CAA9BA8();
      uint64_t v27 = sub_24CAE61B0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      v45[1] = sub_24CAA4228(v27, v29, &v46);
      sub_24CAE5ED0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v47);
      _os_log_impl(&dword_24CA9E000, v23, v24, "MaxDepthFormatter: No device defined for summary %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253308900](v26, -1, -1);
      MEMORY[0x253308900](v25, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v47);
    }

    return 11565;
  }
  uint64_t v15 = v13;
  unint64_t v16 = v14;
  static DeviceType.deviceType(forDeviceIdentifier:)(v13, v14, (char *)&v47);
  if (v47 == 2)
  {
    if (qword_26980A7C0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_24CAE5860();
    __swift_project_value_buffer(v17, (uint64_t)qword_26980B960);
    swift_bridgeObjectRetain();
    unint64_t v18 = sub_24CAE5840();
    os_log_type_t v19 = sub_24CAE5DA0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v47 = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_24CAA4228(v15, v16, &v47);
      sub_24CAE5ED0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24CA9E000, v18, v19, "MaxDepthFormatter: Unable to resolve max depth value for device %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253308900](v21, -1, -1);
      MEMORY[0x253308900](v20, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 11565;
  }
  if (v47)
  {
    if (qword_26980A760 != -1) {
      swift_once();
    }
    uint64_t v30 = &xmmword_269812B10;
  }
  else
  {
    if (qword_26980A758 != -1) {
      swift_once();
    }
    uint64_t v30 = &xmmword_269812B00;
  }
  uint64_t v33 = *(void *)v30;
  unint64_t v34 = *((void *)v30 + 1);
  swift_bridgeObjectRelease();
  if (v10) {
    return sub_24CAA9C80();
  }
  uint64_t v47 = v33;
  unint64_t v48 = v34;
  LOBYTE(v46) = *(unsigned char *)(v2 + OBJC_IVAR___DKDepthFormatter_configuration + 138);
  uint64_t v35 = sub_24CAA9220(&v46, 1);
  uint64_t v37 = v36;
  sub_24CAA9C64();
  if (v9)
  {
    swift_bridgeObjectRelease();
    uint64_t v47 = 0;
    unint64_t v48 = 0xE000000000000000;
    sub_24CAE5F30();
    swift_bridgeObjectRelease();
    uint64_t v47 = 0xD000000000000011;
    unint64_t v48 = 0x800000024CAEB530;
    sub_24CAE5BB0();
    swift_bridgeObjectRelease();
    uint64_t v38 = sub_24CAA9C64();
    uint64_t v40 = v39;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB20);
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_24CAE6F10;
    uint64_t v42 = MEMORY[0x263F8D310];
    *(void *)(v41 + 56) = MEMORY[0x263F8D310];
    unint64_t v43 = sub_24CAA7F30();
    *(void *)(v41 + 32) = v35;
    *(void *)(v41 + 40) = v37;
    *(void *)(v41 + 96) = v42;
    *(void *)(v41 + 104) = v43;
    *(void *)(v41 + 64) = v43;
    *(void *)(v41 + 72) = v38;
    *(void *)(v41 + 80) = v40;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB20);
    uint64_t v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_24CAE6F00;
    *(void *)(v44 + 56) = MEMORY[0x263F8D310];
    *(void *)(v44 + 64) = sub_24CAA7F30();
    *(void *)(v44 + 32) = v35;
    *(void *)(v44 + 40) = v37;
  }
  uint64_t v31 = sub_24CAE5B40();
  swift_bridgeObjectRelease();
  return v31;
}

_DWORD *__swift_memcpy4_1(_DWORD *result, _DWORD *a2)
{
  *Swift::String result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DepthFormattingOptions(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[4]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DepthFormattingOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_DWORD *)Swift::String result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 4) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 4) = 0;
    }
    if (a2) {
      *(unsigned char *)Swift::String result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthFormattingOptions()
{
  return &type metadata for DepthFormattingOptions;
}

uint64_t sub_24CAE0028()
{
  return 0;
}

uint64_t SummaryPresentable.deviceIdentifier.getter()
{
  return 0;
}

uint64_t dispatch thunk of SummaryPresentable.dateInterval.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SummaryPresentable.maxDepth.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SummaryPresentable.temperatureRange.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SummaryPresentable.underwaterDuration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of SummaryPresentable.numberOfDivesMaybe.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of SummaryPresentable.diveID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of SummaryPresentable.deviceIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t HealthKitHistoryObserver.__allocating_init(healthStore:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980B6B0);
  swift_allocObject();
  uint64_t v3 = sub_24CAE58A0();
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(void *)(v2 + 16) = v3;
  *(void *)(v2 + 24) = a1;
  return v2;
}

BOOL DiveHistory.hasDives.getter()
{
  return *v0 > 1uLL;
}

uint64_t DiveHistory.diveSummaries.getter()
{
  if (*v0 >= 2uLL) {
    return swift_bridgeObjectRetain();
  }
  else {
    return MEMORY[0x263F8EE78];
  }
}

uint64_t HealthKitHistoryObserver.healthKitDiveHistorySubject.getter()
{
  return swift_retain();
}

uint64_t HealthKitHistoryObserver.init(healthStore:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980B6B0);
  swift_allocObject();
  uint64_t v3 = sub_24CAE58A0();
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(void *)(v1 + 16) = v3;
  *(void *)(v1 + 24) = a1;
  return v1;
}

void sub_24CAE0220()
{
  sub_24CAA1114(0, &qword_26980AF60);
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_workoutType);
  id v2 = objc_msgSend(self, sel_predicateForWorkoutsWithWorkoutActivityType_, 84);
  uint64_t v3 = swift_allocObject();
  swift_weakInit();
  id v4 = objc_allocWithZone(MEMORY[0x263F0A5A0]);
  v8[4] = sub_24CAE3484;
  v8[5] = v3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_24CAE2450;
  v8[3] = &block_descriptor_1;
  int v5 = _Block_copy(v8);
  swift_retain();
  id v6 = objc_msgSend(v4, sel_initWithSampleType_predicate_updateHandler_, v1, v2, v5);

  _Block_release(v5);
  swift_release();
  swift_release();
  objc_msgSend(*(id *)(v0 + 24), sel_executeQuery_, v6);
  uint64_t v7 = *(void **)(v0 + 56);
  *(void *)(v0 + 56) = v6;
}

uint64_t sub_24CAE03B0(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, void *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AE68);
  MEMORY[0x270FA5388](v7 - 8);
  int v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26980A7C0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24CAE5860();
  __swift_project_value_buffer(v10, (uint64_t)qword_26980B960);
  uint64_t v11 = sub_24CAE5840();
  os_log_type_t v12 = sub_24CAE5DA0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_24CA9E000, v11, v12, "DiveHistorySource: Workout observer query triggered", v13, 2u);
    MEMORY[0x253308900](v13, -1, -1);
  }

  if (a4)
  {
    id v14 = a4;
    id v15 = a4;
    unint64_t v16 = sub_24CAE5840();
    os_log_type_t v17 = sub_24CAE5D90();
    if (os_log_type_enabled(v16, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v19 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v18 = 138412290;
      id v20 = a4;
      uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
      v26[1] = v21;
      sub_24CAE5ED0();
      *os_log_type_t v19 = v21;

      _os_log_impl(&dword_24CA9E000, v16, v17, "DiveWorkoutSource: Failed to observer dive workouts with error %@", v18, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26980B148);
      swift_arrayDestroy();
      MEMORY[0x253308900](v19, -1, -1);
      MEMORY[0x253308900](v18, -1, -1);
    }
    else
    {
    }
    return a2();
  }
  else
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      uint64_t v23 = result;
      uint64_t v24 = sub_24CAE5D00();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v9, 1, 1, v24);
      uint64_t v25 = (void *)swift_allocObject();
      v25[2] = 0;
      v25[3] = 0;
      v25[4] = v23;
      v25[5] = a2;
      v25[6] = a3;
      swift_retain();
      sub_24CAD8CA4((uint64_t)v9, (uint64_t)&unk_26980B858, (uint64_t)v25);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_24CAE06F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v9 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v9;
  *int v9 = v6;
  v9[1] = sub_24CAB90A4;
  return sub_24CAE079C(a5, a6);
}

uint64_t sub_24CAE079C(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980AE68);
  v3[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980B7D0);
  v3[9] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for DiveSummary();
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B7D8);
  v3[14] = v5;
  v3[15] = *(void *)(v5 - 8);
  v3[16] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B7E0);
  v3[17] = v6;
  v3[18] = *(void *)(v6 - 8);
  v3[19] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B7E8);
  v3[20] = v7;
  v3[21] = *(void *)(v7 - 8);
  v3[22] = swift_task_alloc();
  uint64_t v8 = sub_24CAE57F0();
  v3[23] = v8;
  v3[24] = *(void *)(v8 - 8);
  v3[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980A998);
  v3[26] = swift_task_alloc();
  uint64_t v9 = sub_24CAE5800();
  v3[27] = v9;
  v3[28] = *(void *)(v9 - 8);
  v3[29] = swift_task_alloc();
  v3[30] = swift_task_alloc();
  uint64_t v10 = sub_24CAE5730();
  v3[31] = v10;
  v3[32] = *(void *)(v10 - 8);
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CAE0B54, 0, 0);
}

uint64_t sub_24CAE0B54()
{
  if (qword_26980A7C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CAE5860();
  v0[35] = __swift_project_value_buffer(v1, (uint64_t)qword_26980B960);
  uint64_t v2 = sub_24CAE5840();
  os_log_type_t v3 = sub_24CAE5D90();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24CA9E000, v2, v3, "DiveHistorySource: Starting new historical query", v4, 2u);
    MEMORY[0x253308900](v4, -1, -1);
  }
  uint64_t v48 = v0[32];
  uint64_t v49 = v0[31];
  uint64_t v5 = v0[28];
  uint64_t v6 = v0[29];
  uint64_t v7 = v0[26];
  uint64_t v46 = v0[27];
  uint64_t v8 = v0[24];
  uint64_t v9 = v0[25];
  uint64_t v10 = v0[23];

  sub_24CAE5720();
  sub_24CAE57E0();
  sub_24CAE57E0();
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v9, *MEMORY[0x263F07870], v10);
  sub_24CAE57D0();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v11(v6, v46);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v7, 1, v49);
  if (v12 == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v15 = v0[31];
    uint64_t v14 = v0[32];
    uint64_t v16 = v0[30];
    uint64_t v18 = v0[26];
    uint64_t v17 = v0[27];
    uint64_t v43 = v0[21];
    uint64_t v44 = v0[20];
    uint64_t v41 = v0[22];
    uint64_t v42 = v0[19];
    uint64_t v45 = v0[18];
    uint64_t v47 = v0[17];
    uint64_t v50 = v0[7];
    sub_24CAE57B0();
    v11(v16, v17);
    os_log_type_t v19 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v0[36] = v19;
    v0[37] = (v14 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v19(v18, v15);
    id v20 = self;
    uint64_t v21 = (void *)sub_24CAE56E0();
    uint64_t v22 = (void *)sub_24CAE56E0();
    id v23 = objc_msgSend(v20, sel_predicateForSamplesWithStartDate_endDate_options_, v21, v22, 0);
    v0[38] = v23;

    id v24 = objc_msgSend(v20, sel__predicateForObjectsFromAppleWatches);
    v0[39] = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980AB88);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_24CAEA930;
    *(void *)(v25 + 32) = v23;
    *(void *)(v25 + 40) = v24;
    id v26 = v23;
    id v27 = v24;
    *(void *)(v25 + 48) = objc_msgSend(v20, sel_predicateForWorkoutsWithWorkoutActivityType_, 84);
    sub_24CAE5C30();
    id v28 = objc_allocWithZone(MEMORY[0x263F08730]);
    sub_24CAA1114(0, &qword_26980B7F0);
    unint64_t v29 = (void *)sub_24CAE5C10();
    swift_bridgeObjectRelease();
    id v30 = objc_msgSend(v28, sel_initWithType_subpredicates_, 1, v29);
    v0[40] = v30;

    sub_24CAA1114(0, &qword_26980AF68);
    id v31 = v30;
    sub_24CAE59E0();

    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x253307670](KeyPath, 1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980B7F8);
    unint64_t v33 = (*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    uint64_t v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = xmmword_24CAE6F00;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v43 + 16))(v34 + v33, v41, v44);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980B800);
    unint64_t v35 = (*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_24CAE6F00;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v45 + 16))(v36 + v35, v42, v47);
    sub_24CAA1114(0, &qword_26980B808);
    sub_24CAE59F0();
    uint64_t v37 = *(void **)(v50 + 24);
    v0[41] = v37;
    id v38 = v37;
    uint64_t v39 = (void *)swift_task_alloc();
    v0[42] = v39;
    *uint64_t v39 = v0;
    v39[1] = sub_24CAE10CC;
    uint64_t v13 = v0[14];
    uint64_t v12 = (uint64_t)v38;
  }
  return MEMORY[0x270EF3200](v12, v13);
}

uint64_t sub_24CAE10CC(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 344) = a1;
  *(void *)(v3 + 352) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_24CAE1800;
  }
  else
  {

    uint64_t v4 = sub_24CAE11E8;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24CAE11E8()
{
  unint64_t v1 = *(void *)(v0 + 344);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_24CAE6020();
    uint64_t v2 = result;
    unint64_t v43 = v1 >> 62;
    unint64_t v45 = v1;
    if (result) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v7 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v43 = v1 >> 62;
  unint64_t v45 = v1;
  if (!v2) {
    goto LABEL_17;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)(v0 + 88);
  unint64_t v6 = v1 & 0xC000000000000001;
  uint64_t v46 = *(void *)(v0 + 344) + 32;
  uint64_t v7 = MEMORY[0x263F8EE78];
  do
  {
    if (v6) {
      id v8 = (id)MEMORY[0x253307F70](v4, *(void *)(v0 + 344));
    }
    else {
      id v8 = *(id *)(v46 + 8 * v4);
    }
    uint64_t v9 = v8;
    uint64_t v11 = *(void *)(v0 + 72);
    uint64_t v10 = *(void *)(v0 + 80);
    static DiveSummary.fromHKWorkout(_:)(v8, v11);

    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v11, 1, v10) == 1)
    {
      sub_24CAE2C04(*(void *)(v0 + 72));
    }
    else
    {
      uint64_t v13 = *(void *)(v0 + 96);
      uint64_t v12 = *(void *)(v0 + 104);
      sub_24CAC830C(*(void *)(v0 + 72), v12);
      sub_24CAC830C(v12, v13);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v7 = sub_24CAE28A0(0, *(void *)(v7 + 16) + 1, 1, v7, &qword_26980B820, (uint64_t (*)(void))type metadata accessor for DiveSummary, (uint64_t (*)(void))type metadata accessor for DiveSummary);
      }
      unint64_t v15 = *(void *)(v7 + 16);
      unint64_t v14 = *(void *)(v7 + 24);
      if (v15 >= v14 >> 1) {
        uint64_t v7 = sub_24CAE28A0(v14 > 1, v15 + 1, 1, v7, &qword_26980B820, (uint64_t (*)(void))type metadata accessor for DiveSummary, (uint64_t (*)(void))type metadata accessor for DiveSummary);
      }
      uint64_t v16 = *(void *)(v0 + 96);
      *(void *)(v7 + 16) = v15 + 1;
      sub_24CAC830C(v16, v7+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v15);
    }
    ++v4;
  }
  while (v2 != v4);
LABEL_18:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_24CAE5840();
  os_log_type_t v18 = sub_24CAE5DA0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 134218240;
    *(void *)(v0 + 24) = *(void *)(v7 + 16);
    sub_24CAE5ED0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2048;
    if (v43)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_24CAE6020();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v20 = *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)(v0 + 32) = v20;
    sub_24CAE5ED0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CA9E000, v17, v18, "DiveHistorySource: Parsed %ld valid dive summaries from %ld workouts", (uint8_t *)v19, 0x16u);
    MEMORY[0x253308900](v19, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
  }

  if (*(void *)(v7 + 16))
  {
    uint64_t v33 = sub_24CAE1E38(v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v33 = 1;
  }
  uint64_t v37 = *(void **)(v0 + 312);
  id v38 = *(void **)(v0 + 320);
  uint64_t v34 = *(void **)(v0 + 304);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
  uint64_t v47 = *(void *)(v0 + 272);
  uint64_t v22 = *(void *)(v0 + 248);
  uint64_t v23 = *(void *)(v0 + 168);
  uint64_t v42 = *(void *)(v0 + 176);
  uint64_t v44 = *(void *)(v0 + 264);
  uint64_t v24 = *(void *)(v0 + 144);
  uint64_t v40 = *(void *)(v0 + 152);
  uint64_t v41 = *(void *)(v0 + 160);
  uint64_t v39 = *(void *)(v0 + 136);
  uint64_t v25 = *(void *)(v0 + 120);
  uint64_t v35 = *(void *)(v0 + 112);
  uint64_t v36 = *(void *)(v0 + 128);
  uint64_t v26 = *(void *)(v0 + 64);
  uint64_t v27 = sub_24CAE5D00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 1, 1, v27);
  uint64_t v28 = swift_allocObject();
  swift_weakInit();
  sub_24CAE5CE0();
  swift_retain();
  uint64_t v29 = sub_24CAE5CD0();
  id v30 = (void *)swift_allocObject();
  uint64_t v31 = MEMORY[0x263F8F500];
  v30[2] = v29;
  v30[3] = v31;
  v30[4] = v28;
  v30[5] = v33;
  swift_release();
  sub_24CAD8E50(v26, (uint64_t)&unk_26980B818, (uint64_t)v30);

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v36, v35);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v40, v39);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v42, v41);
  v21(v44, v22);
  v21(v47, v22);
  sub_24CAE1B0C(*(uint64_t (**)(uint64_t))(v0 + 40));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v32 = *(uint64_t (**)(void))(v0 + 8);
  return v32();
}

uint64_t sub_24CAE1800()
{
  unint64_t v1 = *(void **)(v0 + 352);

  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24CAE5840();
  os_log_type_t v5 = sub_24CAE5D90();
  if (os_log_type_enabled(v4, v5))
  {
    unint64_t v6 = *(void **)(v0 + 352);
    uint64_t v7 = *(void **)(v0 + 320);
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)id v8 = 138412290;
    id v10 = v6;
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v11;
    sub_24CAE5ED0();
    *uint64_t v9 = v11;

    _os_log_impl(&dword_24CA9E000, v4, v5, "DiveHistorySource: Failed to query dive workout history with error %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980B148);
    swift_arrayDestroy();
    MEMORY[0x253308900](v9, -1, -1);
    MEMORY[0x253308900](v8, -1, -1);
  }
  else
  {
    unint64_t v6 = *(void **)(v0 + 352);
    uint64_t v7 = *(void **)(v0 + 320);
  }
  uint64_t v12 = *(void **)(v0 + 304);
  uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
  uint64_t v27 = *(void *)(v0 + 272);
  uint64_t v13 = *(void *)(v0 + 248);
  uint64_t v14 = *(void *)(v0 + 168);
  uint64_t v24 = *(void *)(v0 + 176);
  uint64_t v25 = *(void *)(v0 + 264);
  uint64_t v15 = *(void *)(v0 + 152);
  uint64_t v23 = *(void *)(v0 + 160);
  uint64_t v17 = *(void *)(v0 + 136);
  uint64_t v16 = *(void *)(v0 + 144);
  uint64_t v18 = *(void *)(v0 + 120);
  uint64_t v19 = *(void *)(v0 + 128);
  uint64_t v20 = *(void *)(v0 + 112);

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v20);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v24, v23);
  v26(v25, v13);
  v26(v27, v13);
  sub_24CAE1B0C(*(uint64_t (**)(uint64_t))(v0 + 40));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_24CAE1B0C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = sub_24CAE5860();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  os_log_type_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26980A7C0 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_26980B960);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  sub_24CAB6F30((uint64_t)a1);
  sub_24CAB6F30((uint64_t)a1);
  uint64_t v7 = sub_24CAE5840();
  os_log_type_t v8 = sub_24CAE5DA0();
  if (!os_log_type_enabled(v7, v8))
  {
    sub_24CAB6F40((uint64_t)a1);
    sub_24CAB6F40((uint64_t)a1);

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if (!a1) {
      return result;
    }
    return a1(result);
  }
  uint64_t v9 = swift_slowAlloc();
  uint64_t v17 = v2;
  id v10 = (uint8_t *)v9;
  uint64_t v11 = swift_slowAlloc();
  uint64_t v16 = v11;
  *(_DWORD *)id v10 = 136315138;
  uint64_t v19 = v11;
  if (a1) {
    uint64_t v12 = 5457241;
  }
  else {
    uint64_t v12 = 20302;
  }
  if (a1) {
    unint64_t v13 = 0xE300000000000000;
  }
  else {
    unint64_t v13 = 0xE200000000000000;
  }
  uint64_t v18 = sub_24CAA4228(v12, v13, &v19);
  sub_24CAE5ED0();
  swift_bridgeObjectRelease();
  sub_24CAB6F40((uint64_t)a1);
  sub_24CAB6F40((uint64_t)a1);
  _os_log_impl(&dword_24CA9E000, v7, v8, "DiveHistorySource: Calling completion %s", v10, 0xCu);
  uint64_t v14 = v16;
  swift_arrayDestroy();
  MEMORY[0x253308900](v14, -1, -1);
  MEMORY[0x253308900](v10, -1, -1);

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v17);
  if (a1) {
    return a1(result);
  }
  return result;
}

void sub_24CAE1DD8(id *a1)
{
  id v1 = objc_msgSend(*a1, sel_endDate);
  sub_24CAE5710();
}

uint64_t sub_24CAE1E38(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DiveSummary();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  os_log_type_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
    sub_24CAE2E60(0, v6, 0);
    uint64_t v7 = v17;
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v9 = *(void *)(v3 + 72);
    do
    {
      sub_24CAC7C70(v8, (uint64_t)v5);
      uint64_t v17 = v7;
      unint64_t v11 = *(void *)(v7 + 16);
      unint64_t v10 = *(void *)(v7 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_24CAE2E60(v10 > 1, v11 + 1, 1);
        uint64_t v7 = v17;
      }
      uint64_t v15 = v2;
      unint64_t v16 = sub_24CAE33C8();
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v14);
      sub_24CAC7C70((uint64_t)v5, (uint64_t)boxed_opaque_existential_1);
      *(void *)(v7 + 16) = v11 + 1;
      sub_24CAD9050(&v14, v7 + 40 * v11 + 32);
      sub_24CAC7CD4((uint64_t)v5);
      v8 += v9;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_24CAE1FCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[7] = a4;
  v5[8] = a5;
  v5[6] = a1;
  sub_24CAE5CE0();
  v5[9] = sub_24CAE5CD0();
  uint64_t v7 = sub_24CAE5CC0();
  return MEMORY[0x270FA2498](sub_24CAE2068, v7, v6);
}

uint64_t sub_24CAE2068()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = *(void *)(v0 + 64);
    swift_retain();
    swift_release();
    *(void *)(v0 + 40) = v2;
    sub_24CAE5890();
    swift_release();
  }
  **(unsigned char **)(v0 + 48) = Strong == 0;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

void sub_24CAE213C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980AE68);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v0 + 56))
  {
    if (qword_26980A7C0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_24CAE5860();
    __swift_project_value_buffer(v4, (uint64_t)qword_26980B960);
    os_log_t v11 = (os_log_t)sub_24CAE5840();
    os_log_type_t v5 = sub_24CAE5D90();
    if (os_log_type_enabled(v11, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_24CA9E000, v11, v5, "DiveHistorySource: start() should not be called multiple times", v6, 2u);
      MEMORY[0x253308900](v6, -1, -1);
    }
    os_log_t v7 = v11;
  }
  else
  {
    sub_24CAE0220();
    uint64_t v8 = sub_24CAE5D00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 1, 1, v8);
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = 0;
    v9[3] = 0;
    v9[4] = v0;
    swift_retain();
    sub_24CAD8CA4((uint64_t)v3, (uint64_t)&unk_26980B6D0, (uint64_t)v9);
    swift_release();
  }
}

uint64_t sub_24CAE2320()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24CAB90A4;
  return sub_24CAE079C(0, 0);
}

uint64_t HealthKitHistoryObserver.deinit()
{
  swift_release();

  sub_24CAB6F40(*(void *)(v0 + 32));
  return v0;
}

uint64_t HealthKitHistoryObserver.__deallocating_deinit()
{
  swift_release();

  sub_24CAB6F40(*(void *)(v0 + 32));
  return swift_deallocClassInstance();
}

void sub_24CAE2450(uint64_t a1, void *a2, void *aBlock, void *a4)
{
  uint64_t v6 = *(void (**)(id, uint64_t (*)(), uint64_t, void *))(a1 + 32);
  os_log_t v7 = _Block_copy(aBlock);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  swift_retain();
  id v10 = a2;
  id v9 = a4;
  v6(v10, sub_24CAE34DC, v8, a4);
  swift_release();
  swift_release();
}

uint64_t sub_24CAE2524()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t *initializeBufferWithCopyOfBuffer for DiveHistory(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_bridgeObjectRetain();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for DiveHistory(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t *assignWithCopy for DiveHistory(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_bridgeObjectRetain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for DiveHistory(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DiveHistory(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DiveHistory(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_24CAE2760(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24CAE2778(void *result, int a2)
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

ValueMetadata *type metadata accessor for DiveHistory()
{
  return &type metadata for DiveHistory;
}

uint64_t type metadata accessor for HealthKitHistoryObserver()
{
  return self;
}

uint64_t method lookup function for HealthKitHistoryObserver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HealthKitHistoryObserver);
}

uint64_t dispatch thunk of HealthKitHistoryObserver.__allocating_init(healthStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of HealthKitHistoryObserver.start()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t sub_24CAE281C(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_24CAE2854(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24CAE287C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24CAE28A0(a1, a2, a3, a4, &qword_26980AF70, MEMORY[0x263F07490], MEMORY[0x263F07490]);
}

uint64_t sub_24CAE28A0(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_24CAE6000();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24CAE326C(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

void *sub_24CAE2B20(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_24CAE6060();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_24CAE2BC4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

char *keypath_get_selector_endDate()
{
  return sel_endDate;
}

uint64_t sub_24CAE2C04(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980B7D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CAE2C64()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CAE2C9C()
{
  swift_unknownObjectRelease();
  swift_release();
  if (*(void *)(v0 + 40) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CAE2CEC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_24CAB90A4;
  return sub_24CAE1FCC(a1, v4, v5, v7, v6);
}

uint64_t sub_24CAE2DAC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CAE2E80(a1, a2, a3, (void *)*v3, &qword_26980B840, (uint64_t (*)(void))type metadata accessor for DepthIntervalSummary);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_24CAE2DE8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CAE2E80(a1, a2, a3, (void *)*v3, &qword_26980B848, MEMORY[0x263F062D0]);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_24CAE2E24(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CAE2E80(a1, a2, a3, (void *)*v3, (uint64_t *)&unk_26980B860, MEMORY[0x263F07CB0]);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_24CAE2E60(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CAE30C8(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_24CAE2E80(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  unint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_24CAE6060();
  __break(1u);
  return result;
}

uint64_t sub_24CAE30C8(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980B830);
    int64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980B838);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24CAE6060();
  __break(1u);
  return result;
}

uint64_t sub_24CAE326C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_24CAE6060();
  __break(1u);
  return result;
}

unint64_t sub_24CAE33C8()
{
  unint64_t result = qword_26980B828;
  if (!qword_26980B828)
  {
    type metadata accessor for DiveSummary();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980B828);
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

uint64_t sub_24CAE3484(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, void *a4)
{
  return sub_24CAE03B0(a1, a2, a3, a4);
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

uint64_t sub_24CAE34A4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CAE34DC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_24CAE34EC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24CAE3534()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24CAB8C68;
  uint64_t v5 = (void *)swift_task_alloc();
  v4[2] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_24CAB90A4;
  return sub_24CAE079C(v2, v3);
}

double DiveConfiguration.init()@<D0>(uint64_t a1@<X8>)
{
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(a1 + 8) = _Q0;
  *(_OWORD *)(a1 + 24) = xmmword_24CAE8580;
  *(_OWORD *)(a1 + 40) = xmmword_24CAE8590;
  *(_OWORD *)(a1 + 56) = xmmword_24CAE85A0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 96) = 0x80;
  *(unsigned char *)a1 = 0;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_DWORD *)(a1 + 136) = 16777344;
  *(unsigned char *)(a1 + 140) = 1;
  double result = 120.0;
  *(_OWORD *)(a1 + 144) = xmmword_24CAEAA00;
  return result;
}

uint64_t DiveConfiguration.depth.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v1 + 88);
  *(unsigned char *)a1 = *(unsigned char *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(v1 + 56);
  *(void *)(a1 + 72) = v2;
  *(void *)(a1 + 80) = v3;
  *(void *)(a1 + 88) = v4;
  unsigned __int8 v5 = *(unsigned char *)(v1 + 96);
  *(unsigned char *)(a1 + 96) = v5;
  return sub_24CAA5CA0(v2, v3, v4, v5);
}

__n128 DiveConfiguration.depth.setter(char *a1)
{
  char v2 = *a1;
  long long v10 = *(_OWORD *)(a1 + 24);
  long long v11 = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *((void *)a1 + 7);
  uint64_t v4 = *((void *)a1 + 8);
  __n128 v8 = *(__n128 *)(a1 + 72);
  long long v9 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *((void *)a1 + 11);
  char v6 = a1[96];
  sub_24CAA5D50(*(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(unsigned char *)(v1 + 96));
  *(unsigned char *)uint64_t v1 = v2;
  *(_OWORD *)(v1 + 8) = v11;
  *(_OWORD *)(v1 + 24) = v10;
  *(_OWORD *)(v1 + 40) = v9;
  *(void *)(v1 + 56) = v3;
  *(void *)(v1 + 64) = v4;
  __n128 result = v8;
  *(__n128 *)(v1 + 72) = v8;
  *(void *)(v1 + 88) = v5;
  *(unsigned char *)(v1 + 96) = v6;
  return result;
}

uint64_t (*DiveConfiguration.depth.modify())()
{
  return nullsub_1;
}

uint64_t DiveConfiguration.temperature.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 104);
  uint64_t v3 = *(void *)(v1 + 112);
  uint64_t v4 = *(void *)(v1 + 120);
  uint64_t v5 = *(void *)(v1 + 128);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  unsigned __int8 v6 = *(unsigned char *)(v1 + 136);
  *(unsigned char *)(a1 + 32) = v6;
  return sub_24CAA5CB8(v2, v3, v4, v5, v6);
}

__n128 DiveConfiguration.temperature.setter(__n128 *a1)
{
  __n128 v6 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  unsigned __int8 v4 = a1[2].n128_u8[0];
  sub_24CAA5D68(*(void *)(v1 + 104), *(void *)(v1 + 112), *(void *)(v1 + 120), *(void *)(v1 + 128), *(unsigned char *)(v1 + 136));
  __n128 result = v6;
  *(__n128 *)(v1 + 104) = v6;
  *(void *)(v1 + 120) = v2;
  *(void *)(v1 + 128) = v3;
  *(unsigned char *)(v1 + 136) = v4;
  return result;
}

uint64_t (*DiveConfiguration.temperature.modify())()
{
  return nullsub_1;
}

void DiveConfiguration.interface.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 137);
}

unsigned char *DiveConfiguration.interface.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 137) = *result;
  return result;
}

uint64_t (*DiveConfiguration.interface.modify())()
{
  return nullsub_1;
}

void DiveConfiguration.units.getter(unsigned char *a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 139);
  *a1 = *(unsigned char *)(v1 + 138);
  a1[1] = v2;
}

unsigned char *DiveConfiguration.units.setter(unsigned char *result)
{
  char v2 = result[1];
  *(unsigned char *)(v1 + 138) = *result;
  *(unsigned char *)(v1 + 139) = v2;
  return result;
}

uint64_t (*DiveConfiguration.units.modify())()
{
  return nullsub_1;
}

void DiveConfiguration.privacy.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 140);
}

unsigned char *DiveConfiguration.privacy.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 140) = *result;
  return result;
}

uint64_t (*DiveConfiguration.privacy.modify())()
{
  return nullsub_1;
}

__n128 DiveConfiguration.location.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = v1[9];
  *a1 = result;
  return result;
}

__n128 DiveConfiguration.location.setter(__n128 *a1)
{
  __n128 result = *a1;
  v1[9] = *a1;
  return result;
}

uint64_t (*DiveConfiguration.location.modify())()
{
  return nullsub_1;
}

uint64_t destroy for DiveConfiguration(uint64_t a1)
{
  sub_24CAA5D50(*(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(unsigned char *)(a1 + 96));
  uint64_t v2 = *(void *)(a1 + 104);
  uint64_t v3 = *(void *)(a1 + 112);
  uint64_t v4 = *(void *)(a1 + 120);
  uint64_t v5 = *(void *)(a1 + 128);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 136);
  return sub_24CAA5D68(v2, v3, v4, v5, v6);
}

uint64_t initializeWithCopy for DiveConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v4 = *(void *)(a2 + 72);
  uint64_t v5 = *(void *)(a2 + 80);
  uint64_t v6 = *(void *)(a2 + 88);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 96);
  sub_24CAA5CA0(v4, v5, v6, v7);
  *(void *)(a1 + 72) = v4;
  *(void *)(a1 + 80) = v5;
  *(void *)(a1 + 88) = v6;
  *(unsigned char *)(a1 + 96) = v7;
  uint64_t v8 = *(void *)(a2 + 104);
  uint64_t v9 = *(void *)(a2 + 112);
  uint64_t v10 = *(void *)(a2 + 120);
  uint64_t v11 = *(void *)(a2 + 128);
  unsigned __int8 v12 = *(unsigned char *)(a2 + 136);
  sub_24CAA5CB8(v8, v9, v10, v11, v12);
  *(void *)(a1 + 104) = v8;
  *(void *)(a1 + 112) = v9;
  *(void *)(a1 + 120) = v10;
  *(void *)(a1 + 128) = v11;
  *(unsigned char *)(a1 + 136) = v12;
  *(unsigned char *)(a1 + 137) = *(unsigned char *)(a2 + 137);
  *(_WORD *)(a1 + 138) = *(_WORD *)(a2 + 138);
  *(unsigned char *)(a1 + 140) = *(unsigned char *)(a2 + 140);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  return a1;
}

uint64_t assignWithCopy for DiveConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v4 = *(void *)(a2 + 72);
  uint64_t v5 = *(void *)(a2 + 80);
  uint64_t v6 = *(void *)(a2 + 88);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 96);
  sub_24CAA5CA0(v4, v5, v6, v7);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 88);
  *(void *)(a1 + 72) = v4;
  *(void *)(a1 + 80) = v5;
  *(void *)(a1 + 88) = v6;
  unsigned __int8 v11 = *(unsigned char *)(a1 + 96);
  *(unsigned char *)(a1 + 96) = v7;
  sub_24CAA5D50(v8, v9, v10, v11);
  uint64_t v12 = *(void *)(a2 + 104);
  uint64_t v13 = *(void *)(a2 + 112);
  uint64_t v14 = *(void *)(a2 + 120);
  uint64_t v15 = *(void *)(a2 + 128);
  unsigned __int8 v16 = *(unsigned char *)(a2 + 136);
  sub_24CAA5CB8(v12, v13, v14, v15, v16);
  uint64_t v17 = *(void *)(a1 + 104);
  uint64_t v18 = *(void *)(a1 + 112);
  uint64_t v19 = *(void *)(a1 + 120);
  uint64_t v20 = *(void *)(a1 + 128);
  *(void *)(a1 + 104) = v12;
  *(void *)(a1 + 112) = v13;
  *(void *)(a1 + 120) = v14;
  *(void *)(a1 + 128) = v15;
  unsigned __int8 v21 = *(unsigned char *)(a1 + 136);
  *(unsigned char *)(a1 + 136) = v16;
  sub_24CAA5D68(v17, v18, v19, v20, v21);
  *(unsigned char *)(a1 + 137) = *(unsigned char *)(a2 + 137);
  *(unsigned char *)(a1 + 138) = *(unsigned char *)(a2 + 138);
  *(unsigned char *)(a1 + 139) = *(unsigned char *)(a2 + 139);
  *(unsigned char *)(a1 + 140) = *(unsigned char *)(a2 + 140);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  return a1;
}

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
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
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t assignWithTake for DiveConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v4 = *(void *)(a2 + 88);
  char v5 = *(unsigned char *)(a2 + 96);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = v4;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 96);
  *(unsigned char *)(a1 + 96) = v5;
  sub_24CAA5D50(v6, v7, v8, v9);
  char v10 = *(unsigned char *)(a2 + 136);
  uint64_t v11 = *(void *)(a1 + 104);
  uint64_t v12 = *(void *)(a1 + 112);
  uint64_t v13 = *(void *)(a1 + 120);
  uint64_t v14 = *(void *)(a1 + 128);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  unsigned __int8 v15 = *(unsigned char *)(a1 + 136);
  *(unsigned char *)(a1 + 136) = v10;
  sub_24CAA5D68(v11, v12, v13, v14, v15);
  *(unsigned char *)(a1 + 137) = *(unsigned char *)(a2 + 137);
  *(unsigned char *)(a1 + 138) = *(unsigned char *)(a2 + 138);
  *(unsigned char *)(a1 + 139) = *(unsigned char *)(a2 + 139);
  *(unsigned char *)(a1 + 140) = *(unsigned char *)(a2 + 140);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for DiveConfiguration(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[160]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DiveConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 160) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 160) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DiveConfiguration()
{
  return &type metadata for DiveConfiguration;
}

uint64_t BackgroundTimer.__allocating_init(interval:completion:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6 = swift_allocObject();
  BackgroundTimer.init(interval:completion:)(a1, a2, a3);
  return v6;
}

uint64_t BackgroundTimer.init(interval:completion:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v48 = a1;
  uint64_t v49 = a2;
  uint64_t v4 = sub_24CAE5950();
  uint64_t v53 = *(void *)(v4 - 8);
  uint64_t v54 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v50 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CAE5980();
  uint64_t v51 = *(void *)(v6 - 8);
  uint64_t v52 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v47 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24CAE5940();
  uint64_t v44 = *(void *)(v8 - 8);
  uint64_t v45 = v8;
  MEMORY[0x270FA5388](v8);
  char v10 = (uint64_t *)((char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_24CAE59A0();
  uint64_t v42 = *(void *)(v11 - 8);
  uint64_t v43 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v41 = (char *)&v40 - v15;
  uint64_t v16 = sub_24CAE5DF0();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_24CAE5960();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v40 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_24CAA1114(0, (unint64_t *)&unk_26980B870);
  sub_24CAA1114(0, (unint64_t *)&qword_26980ACD0);
  (*(void (**)(char *, void, uint64_t))(v21 + 104))(v23, *MEMORY[0x263F8F080], v20);
  uint64_t v24 = (void *)sub_24CAE5DE0();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_24CAE46E4(&qword_26980B880, MEMORY[0x263F8F148]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980B888);
  sub_24CAE472C((unint64_t *)&unk_26980B890, &qword_26980B888);
  sub_24CAE5F10();
  uint64_t v25 = sub_24CAE5E00();

  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  uint64_t v26 = v46;
  *(void *)(v46 + 16) = v25;
  uint64_t ObjectType = swift_getObjectType();
  sub_24CAE5990();
  uint64_t v28 = v41;
  MEMORY[0x2533079B0](v14, a3);
  uint64_t v29 = v43;
  id v30 = *(void (**)(char *, uint64_t))(v42 + 8);
  v30(v14, v43);
  *char v10 = 0;
  uint64_t v32 = v44;
  uint64_t v31 = v45;
  (*(void (**)(void *, void, uint64_t))(v44 + 104))(v10, *MEMORY[0x263F8EFE0], v45);
  MEMORY[0x253307E70](v28, v10, ObjectType, a3);
  (*(void (**)(void *, uint64_t))(v32 + 8))(v10, v31);
  v30(v28, v29);
  uint64_t v33 = v26;
  swift_getObjectType();
  uint64_t v34 = swift_allocObject();
  uint64_t v35 = v49;
  *(void *)(v34 + 16) = v48;
  *(void *)(v34 + 24) = v35;
  aBlock[4] = sub_24CAE4470;
  aBlock[5] = v34;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24CAE4498;
  aBlock[3] = &block_descriptor_2;
  uint64_t v36 = _Block_copy(aBlock);
  swift_retain();
  uint64_t v37 = v47;
  sub_24CAE5970();
  id v38 = v50;
  sub_24CAE44F4();
  sub_24CAE5E10();
  _Block_release(v36);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v38, v54);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v37, v52);
  swift_release();
  swift_getObjectType();
  swift_unknownObjectRetain();
  sub_24CAE5E30();
  swift_unknownObjectRelease();
  swift_release();
  return v33;
}

uint64_t sub_24CAE4438()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CAE4470()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24CAE4498(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
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

uint64_t sub_24CAE44F4()
{
  return sub_24CAE5F10();
}

uint64_t sub_24CAE45BC()
{
  return sub_24CAE5E20();
}

uint64_t BackgroundTimer.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t BackgroundTimer.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_24CAE4640()
{
  return sub_24CAE5E20();
}

uint64_t type metadata accessor for BackgroundTimer()
{
  return self;
}

uint64_t method lookup function for BackgroundTimer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BackgroundTimer);
}

uint64_t dispatch thunk of BackgroundTimer.__allocating_init(interval:completion:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of BackgroundTimer.invalidate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t sub_24CAE46E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CAE472C(unint64_t *a1, uint64_t *a2)
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

void sub_24CAE477C()
{
  qword_26980B8C0 = 0x6C7070612E6D6F63;
  *(void *)algn_26980B8C8 = 0xEF68747065442E65;
}

void sub_24CAE47AC()
{
  qword_26980B8D0 = 0x746C7561666564;
  *(void *)algn_26980B8D8 = 0xE700000000000000;
}

void sub_24CAE47D0()
{
  *(_WORD *)&algn_26980B8E8[6] = -4864;
}

void sub_24CAE4800()
{
  qword_26980B8F0 = 0x676E697473;
  *(void *)algn_26980B8F8 = 0xE500000000000000;
}

void sub_24CAE4820()
{
  qword_26980B900 = 0x694B68746C616548;
  *(void *)algn_26980B908 = 0xE900000000000074;
}

void sub_24CAE4848()
{
  qword_26980B910 = 0x72656874616577;
  *(void *)algn_26980B918 = 0xE700000000000000;
}

void sub_24CAE486C()
{
  qword_26980B920 = 0x6E6F697461636F6CLL;
  *(void *)algn_26980B928 = 0xE800000000000000;
}

void sub_24CAE4890()
{
  qword_26980B930 = 0x6E6F6D656164;
  *(void *)algn_26980B938 = 0xE600000000000000;
}

void sub_24CAE48B0()
{
  qword_26980B940 = 0x746E65696C63;
  *(void *)algn_26980B948 = 0xE600000000000000;
}

void sub_24CAE48D0()
{
  qword_26980B950 = 0x746E65696C63;
  *(void *)algn_26980B958 = 0xE600000000000000;
}

uint64_t sub_24CAE48F0()
{
  uint64_t v0 = sub_24CAE5860();
  __swift_allocate_value_buffer(v0, qword_26980B960);
  __swift_project_value_buffer(v0, (uint64_t)qword_26980B960);
  if (qword_26980A770 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26980A778;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_24CAE5850();
}

uint64_t static DepthLog.default.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CAE5424(&qword_26980A7C0, (uint64_t)qword_26980B960, a1);
}

uint64_t sub_24CAE4A0C()
{
  uint64_t v0 = sub_24CAE5860();
  __swift_allocate_value_buffer(v0, qword_26980B978);
  __swift_project_value_buffer(v0, (uint64_t)qword_26980B978);
  if (qword_26980A770 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26980A780;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_24CAE5850();
}

uint64_t static DepthLog.complications.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CAE5424(&qword_26980A7C8, (uint64_t)qword_26980B978, a1);
}

uint64_t sub_24CAE4B28()
{
  uint64_t v0 = sub_24CAE5860();
  __swift_allocate_value_buffer(v0, qword_26980B990);
  __swift_project_value_buffer(v0, (uint64_t)qword_26980B990);
  if (qword_26980A770 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26980A790;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_24CAE5850();
}

uint64_t static DepthLog.healthkit.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CAE5424(&qword_26980A7D0, (uint64_t)qword_26980B990, a1);
}

uint64_t sub_24CAE4C44()
{
  sub_24CAE5530();
  if (qword_26980A770 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26980A780;
  swift_bridgeObjectRetain();
  if (v0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_24CAE5EA0();
  qword_26980B9A8 = result;
  return result;
}

id static DepthLog.osLogger.getter()
{
  if (qword_26980A7D8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26980B9A8;
  return v0;
}

uint64_t sub_24CAE4D7C()
{
  uint64_t v0 = sub_24CAE5860();
  __swift_allocate_value_buffer(v0, qword_26980B9B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26980B9B0);
  if (qword_26980A770 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26980A788;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_24CAE5850();
}

uint64_t static DepthLog.sting.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CAE5424(&qword_26980A7E0, (uint64_t)qword_26980B9B0, a1);
}

uint64_t sub_24CAE4E98()
{
  uint64_t v0 = sub_24CAE5860();
  __swift_allocate_value_buffer(v0, qword_26980B9C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26980B9C8);
  if (qword_26980A770 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26980A7A0;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_24CAE5850();
}

uint64_t static DepthLog.location.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CAE5424(&qword_26980A7E8, (uint64_t)qword_26980B9C8, a1);
}

uint64_t sub_24CAE4FB4()
{
  uint64_t v0 = sub_24CAE5860();
  __swift_allocate_value_buffer(v0, qword_26980B9E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26980B9E0);
  if (qword_26980A770 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26980A798;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_24CAE5850();
}

uint64_t static DepthLog.weather.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CAE5424(&qword_26980A7F0, (uint64_t)qword_26980B9E0, a1);
}

uint64_t sub_24CAE50D0()
{
  uint64_t v0 = sub_24CAE5860();
  __swift_allocate_value_buffer(v0, qword_26980B9F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26980B9F8);
  if (qword_26980A770 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26980A7A8;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_24CAE5850();
}

uint64_t static DepthLog.daemon.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CAE5424(&qword_26980A7F8, (uint64_t)qword_26980B9F8, a1);
}

uint64_t sub_24CAE51EC()
{
  uint64_t v0 = sub_24CAE5860();
  __swift_allocate_value_buffer(v0, qword_26980BA10);
  __swift_project_value_buffer(v0, (uint64_t)qword_26980BA10);
  if (qword_26980A770 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26980A7B0;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_24CAE5850();
}

uint64_t static DepthLog.client.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CAE5424(&qword_26980A800, (uint64_t)qword_26980BA10, a1);
}

uint64_t sub_24CAE5308()
{
  uint64_t v0 = sub_24CAE5860();
  __swift_allocate_value_buffer(v0, qword_26980BA28);
  __swift_project_value_buffer(v0, (uint64_t)qword_26980BA28);
  if (qword_26980A770 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26980A7B8;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_24CAE5850();
}

uint64_t static DepthLog.demo.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24CAE5424(&qword_26980A808, (uint64_t)qword_26980BA28, a1);
}

uint64_t sub_24CAE5424@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24CAE5860();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

ValueMetadata *type metadata accessor for DepthLog()
{
  return &type metadata for DepthLog;
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

unint64_t sub_24CAE5530()
{
  unint64_t result = qword_26980AB70;
  if (!qword_26980AB70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26980AB70);
  }
  return result;
}

uint64_t sub_24CAE5570()
{
  return MEMORY[0x270EEDFA8]();
}

uint64_t sub_24CAE5580()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_24CAE5590()
{
  return MEMORY[0x270EEE0D0]();
}

uint64_t sub_24CAE55A0()
{
  return MEMORY[0x270EEE170]();
}

uint64_t sub_24CAE55B0()
{
  return MEMORY[0x270EEE1A8]();
}

uint64_t sub_24CAE55C0()
{
  return MEMORY[0x270EEE200]();
}

uint64_t sub_24CAE55D0()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_24CAE55E0()
{
  return MEMORY[0x270EEE2E8]();
}

uint64_t sub_24CAE55F0()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_24CAE5600()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_24CAE5610()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_24CAE5620()
{
  return MEMORY[0x270EEE328]();
}

uint64_t sub_24CAE5630()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_24CAE5640()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_24CAE5650()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_24CAE5660()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_24CAE5670()
{
  return MEMORY[0x270EEE9A8]();
}

uint64_t sub_24CAE5680()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_24CAE5690()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_24CAE56A0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24CAE56B0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_24CAE56C0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_24CAE56D0()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_24CAE56E0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24CAE56F0()
{
  return MEMORY[0x270EF09C8]();
}

uint64_t sub_24CAE5700()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_24CAE5710()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_24CAE5720()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24CAE5730()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24CAE5740()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_24CAE5750()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t _s9DepthCore11DiveSummaryV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24CAE5770()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t _s9DepthCore11DiveSummaryV4hash4intoys6HasherVz_tF_0()
{
  return MEMORY[0x270EF0CC8]();
}

uint64_t sub_24CAE5790()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24CAE57A0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24CAE57B0()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_24CAE57C0()
{
  return MEMORY[0x270EF1378]();
}

uint64_t sub_24CAE57D0()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_24CAE57E0()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_24CAE57F0()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_24CAE5800()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_24CAE5810()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_24CAE5820()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_24CAE5830()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24CAE5840()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24CAE5850()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24CAE5860()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24CAE5870()
{
  return MEMORY[0x270EE3AC0]();
}

uint64_t sub_24CAE5880()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_24CAE5890()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_24CAE58A0()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_24CAE58B0()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_24CAE58C0()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_24CAE58D0()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_24CAE58E0()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_24CAE58F0()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_24CAE5900()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_24CAE5910()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_24CAE5920()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_24CAE5930()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_24CAE5940()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_24CAE5950()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24CAE5960()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_24CAE5970()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24CAE5980()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24CAE5990()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_24CAE59A0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_24CAE59B0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_24CAE59C0()
{
  return MEMORY[0x270EF3148]();
}

uint64_t sub_24CAE59D0()
{
  return MEMORY[0x270EF3150]();
}

uint64_t sub_24CAE59E0()
{
  return MEMORY[0x270EF3158]();
}

uint64_t sub_24CAE59F0()
{
  return MEMORY[0x270EF31F8]();
}

uint64_t sub_24CAE5A20()
{
  return MEMORY[0x270EF32B8]();
}

uint64_t sub_24CAE5A30()
{
  return MEMORY[0x270EF32C0]();
}

uint64_t sub_24CAE5A40()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_24CAE5A50()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_24CAE5A60()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24CAE5A70()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_24CAE5A80()
{
  return MEMORY[0x270F9D148]();
}

uint64_t sub_24CAE5A90()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_24CAE5AA0()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_24CAE5AB0()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_24CAE5AC0()
{
  return MEMORY[0x270F9D4A8]();
}

uint64_t sub_24CAE5AD0()
{
  return MEMORY[0x270F9D4B0]();
}

uint64_t sub_24CAE5AE0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24CAE5AF0()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_24CAE5B00()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24CAE5B10()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24CAE5B20()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24CAE5B30()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_24CAE5B40()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_24CAE5B50()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_24CAE5B60()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_24CAE5B70()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24CAE5B80()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_24CAE5B90()
{
  return MEMORY[0x270F9D698]();
}

uint64_t sub_24CAE5BA0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24CAE5BB0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24CAE5BC0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24CAE5BD0()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_24CAE5BE0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24CAE5BF0()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_24CAE5C00()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24CAE5C10()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24CAE5C20()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24CAE5C30()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24CAE5C40()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24CAE5C50()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24CAE5C60()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24CAE5C70()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24CAE5C80()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_24CAE5C90()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_24CAE5CA0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24CAE5CB0()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_24CAE5CC0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24CAE5CD0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24CAE5CE0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24CAE5CF0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24CAE5D00()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24CAE5D10()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_24CAE5D20()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_24CAE5D30()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_24CAE5D40()
{
  return MEMORY[0x270EF1C48]();
}

uint64_t sub_24CAE5D50()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_24CAE5D60()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_24CAE5D70()
{
  return MEMORY[0x270FA2BB8]();
}

uint64_t sub_24CAE5D80()
{
  return MEMORY[0x270F9E240]();
}

uint64_t sub_24CAE5D90()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24CAE5DA0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24CAE5DB0()
{
  return MEMORY[0x270EF33F8]();
}

uint64_t sub_24CAE5DC0()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_24CAE5DD0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24CAE5DE0()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_24CAE5DF0()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_24CAE5E00()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_24CAE5E10()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_24CAE5E20()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_24CAE5E30()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_24CAE5E40()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_24CAE5E50()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_24CAE5E60()
{
  return MEMORY[0x270EF2028]();
}

uint64_t sub_24CAE5E70()
{
  return MEMORY[0x270FA0F68]();
}

uint64_t sub_24CAE5E80()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24CAE5E90()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_24CAE5EA0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_24CAE5EB0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24CAE5EC0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_24CAE5ED0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24CAE5EE0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24CAE5EF0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_24CAE5F00()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24CAE5F10()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24CAE5F20()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_24CAE5F30()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24CAE5F40()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24CAE5F50()
{
  return MEMORY[0x270F9E9C8]();
}

uint64_t sub_24CAE5F60()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_24CAE5F70()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24CAE5F80()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24CAE5F90()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24CAE5FA0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24CAE5FB0()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_24CAE5FC0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24CAE5FD0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24CAE5FE0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24CAE5FF0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24CAE6000()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24CAE6010()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24CAE6020()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24CAE6030()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24CAE6040()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24CAE6050()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24CAE6060()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24CAE6080()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24CAE6090()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24CAE60A0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24CAE60B0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24CAE60C0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24CAE60D0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24CAE60E0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24CAE60F0()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24CAE6100()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24CAE6110()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24CAE6120()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24CAE6130()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24CAE6140()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24CAE6150()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24CAE6160()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24CAE6170()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24CAE6180()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24CAE6190()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_24CAE61A0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24CAE61B0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24CAE61C0()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_24CAE61D0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24CAE61E0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24CAE61F0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24CAE6200()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24CAE6210()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24CAE6220()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24CAE6230()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24CAE6240()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24CAE6250()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24CAE6260()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24CAE6270()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24CAE6280()
{
  return MEMORY[0x270F9FD98]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
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

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x270FA0398]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
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