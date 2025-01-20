uint64_t PlaygroundLoggerProbePointConfiguration.streamLoggedResultsEnabled.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t PlaygroundLoggerProbePointConfiguration.streamLoggedResultsEnabled.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*PlaygroundLoggerProbePointConfiguration.streamLoggedResultsEnabled.modify())()
{
  return nullsub_1;
}

LiveExecutionResultsFoundation::PlaygroundLoggerProbePointConfiguration __swiftcall PlaygroundLoggerProbePointConfiguration.init(streamLoggedResultsEnabled:)(LiveExecutionResultsFoundation::PlaygroundLoggerProbePointConfiguration streamLoggedResultsEnabled)
{
  v1->streamLoggedResultsEnabled = streamLoggedResultsEnabled.streamLoggedResultsEnabled;
  return streamLoggedResultsEnabled;
}

void static PlaygroundLoggerProbePointConfiguration.offConfiguration.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

unint64_t PlaygroundLoggerProbePointConfiguration.description.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_23456FC58()
{
  return 0;
}

BOOL static PlaygroundLoggerProbePointConfiguration.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

BOOL sub_23456FD24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PlaygroundLoggerProbePointConfiguration(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PlaygroundLoggerProbePointConfiguration(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *result = a2 + 1;
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
        JUMPOUT(0x23456FEB8);
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
          *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerProbePointConfiguration()
{
  return &type metadata for PlaygroundLoggerProbePointConfiguration;
}

uint64_t sub_23456FEF0(uint64_t a1)
{
  return sub_23456FFF8(a1, qword_2687A89D0);
}

uint64_t static OS_os_log.agent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_234570094(&qword_2687A8980, (uint64_t)qword_2687A89D0, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_23456FF68(uint64_t a1)
{
  return sub_23456FFF8(a1, qword_2687A89E8);
}

uint64_t static OS_os_log.host.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_234570094(&qword_2687A8988, (uint64_t)qword_2687A89E8, a1);
}

uint64_t sub_23456FFA4(uint64_t a1)
{
  return sub_23456FFF8(a1, qword_2687A8A00);
}

uint64_t static OS_os_log.os.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_234570094(&qword_2687A8990, (uint64_t)qword_2687A8A00, a1);
}

uint64_t sub_23456FFDC(uint64_t a1)
{
  return sub_23456FFF8(a1, qword_2687A8A18);
}

uint64_t sub_23456FFF8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_234572AA0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_234572A90();
}

uint64_t static OS_os_log.probe.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_234570094(&qword_2687A8998, (uint64_t)qword_2687A8A18, a1);
}

uint64_t sub_234570094@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_234572AA0();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  BOOL v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

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

BOOL SourceLocationCollectionMode.isOn.getter()
{
  return *v0 != 0;
}

LiveExecutionResultsFoundation::SourceLocationCollectionMode_optional __swiftcall SourceLocationCollectionMode.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (LiveExecutionResultsFoundation::SourceLocationCollectionMode_optional)rawValue;
}

uint64_t SourceLocationCollectionMode.rawValue.getter()
{
  return *v0;
}

BOOL sub_2345701BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2345701D0()
{
  return sub_234572B70();
}

uint64_t sub_234570218()
{
  return sub_234572B60();
}

uint64_t sub_234570244()
{
  return sub_234572B70();
}

LiveExecutionResultsFoundation::SourceLocationCollectionMode_optional sub_234570288(Swift::Int *a1)
{
  return SourceLocationCollectionMode.init(rawValue:)(*a1);
}

void sub_234570290(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t LoggingProbePointConfiguration.LogSources.rawValue.getter()
{
  return *(void *)v0;
}

LiveExecutionResultsFoundation::LoggingProbePointConfiguration::LogSources __swiftcall LoggingProbePointConfiguration.LogSources.init(rawValue:)(LiveExecutionResultsFoundation::LoggingProbePointConfiguration::LogSources rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static LoggingProbePointConfiguration.LogSources.none.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void static LoggingProbePointConfiguration.LogSources.printHook.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static LoggingProbePointConfiguration.LogSources.standardOut.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static LoggingProbePointConfiguration.LogSources.standardError.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void sub_2345702D8()
{
  uint64_t v0 = unk_26E751378;
  if ((unk_26E751378 & ~qword_26E751370) == 0) {
    uint64_t v0 = 0;
  }
  qword_2687A8A30 = v0 | qword_26E751370;
}

uint64_t sub_2345702FC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

void *static LoggingProbePointConfiguration.LogSources.standardOutErr.getter@<X0>(void *a1@<X8>)
{
  return sub_2345703D0(&qword_2687A89A0, &qword_2687A8A30, a1);
}

void sub_234570378()
{
  uint64_t v0 = unk_26E7513A8;
  if ((unk_26E7513A8 & ~qword_26E7513A0) == 0) {
    uint64_t v0 = 0;
  }
  uint64_t v1 = qword_26E7513B0;
  if ((qword_26E7513B0 & ~(v0 | qword_26E7513A0)) == 0) {
    uint64_t v1 = 0;
  }
  qword_2687A8A38 = v1 | v0 | qword_26E7513A0;
}

void *static LoggingProbePointConfiguration.LogSources.all.getter@<X0>(void *a1@<X8>)
{
  return sub_2345703D0(&qword_2687A89A8, &qword_2687A8A38, a1);
}

void *sub_2345703D0@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*result != -1) {
    uint64_t result = (void *)swift_once();
  }
  *a3 = *a2;
  return result;
}

Swift::Bool __swiftcall LoggingProbePointConfiguration.LogSources.containsLogSource(_:)(LiveExecutionResultsFoundation::PrintSample::LogSource a1)
{
  return (qword_234573180[*(char *)a1] & ~*v1) == 0;
}

void *sub_234570434@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_234570440(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_234570448@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_23457045C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_234570470@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_234570484(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_2345704B4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_2345704E0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_234570504(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_234570518(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_23457052C(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_234570540@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_234570554(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_234570568(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_23457057C(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_234570590()
{
  return *v0 == 0;
}

uint64_t sub_2345705A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_2345705B8(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_2345705CC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_2345705DC(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_2345705E8(void *a1, void *a2)
{
  return *a1 == *a2;
}

void LoggingProbePointConfiguration.activeLogSources.getter(void *a1@<X8>)
{
  *a1 = *v1;
}

void *LoggingProbePointConfiguration.activeLogSources.setter(void *result)
{
  void *v1 = *result;
  return result;
}

uint64_t (*LoggingProbePointConfiguration.activeLogSources.modify())()
{
  return nullsub_1;
}

void LoggingProbePointConfiguration.sourceLocationCollectionMode.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 8);
}

unsigned char *LoggingProbePointConfiguration.sourceLocationCollectionMode.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 8) = *result;
  return result;
}

uint64_t (*LoggingProbePointConfiguration.sourceLocationCollectionMode.modify())()
{
  return nullsub_1;
}

LiveExecutionResultsFoundation::LoggingProbePointConfiguration __swiftcall LoggingProbePointConfiguration.init(activeLogSources:sourceLocationCollectionMode:)(LiveExecutionResultsFoundation::LoggingProbePointConfiguration::LogSources activeLogSources, LiveExecutionResultsFoundation::SourceLocationCollectionMode sourceLocationCollectionMode)
{
  char v3 = *(unsigned char *)sourceLocationCollectionMode;
  *(void *)uint64_t v2 = *(void *)activeLogSources.rawValue;
  *(unsigned char *)(v2 + 8) = v3;
  result.activeLogSources = activeLogSources;
  result.sourceLocationCollectionMode = sourceLocationCollectionMode;
  return result;
}

void static LoggingProbePointConfiguration.offConfiguration.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 0;
}

uint64_t LoggingProbePointConfiguration.description.getter()
{
  return 0;
}

BOOL static LoggingProbePointConfiguration.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
}

BOOL sub_2345707A0(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2 && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 8);
}

uint64_t LoggingProbePointConfiguration.LogSources.hashValue.getter()
{
  return *(void *)v0;
}

uint64_t sub_2345707C8()
{
  unint64_t v0 = sub_234571290(qword_26E7513B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A8A80);
  uint64_t result = swift_arrayDestroy();
  qword_2687A9530 = v0;
  return result;
}

uint64_t LoggingProbePointConfiguration.LogSources.description.getter()
{
  uint64_t v1 = *v0;
  if (qword_2687A89B0 != -1) {
LABEL_36:
  }
    swift_once();
  swift_beginAccess();
  uint64_t v2 = qword_2687A9530;
  uint64_t v3 = qword_2687A9530 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(qword_2687A9530 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(qword_2687A9530 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  uint64_t v10 = MEMORY[0x263F8EE78];
  while (v6)
  {
    unint64_t v11 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v12 = v11 | (v9 << 6);
LABEL_26:
    uint64_t v16 = *(void *)(*(void *)(v2 + 48) + 8 * v12);
    if ((v16 & ~v1) == 0)
    {
      swift_beginAccess();
      uint64_t v17 = qword_2687A9530;
      if (*(void *)(qword_2687A9530 + 16) && (unint64_t v18 = sub_234570B80(v16), (v19 & 1) != 0))
      {
        v20 = (uint64_t *)(*(void *)(v17 + 56) + 16 * v18);
        uint64_t v21 = v20[1];
        uint64_t v26 = *v20;
        swift_endAccess();
        uint64_t v27 = v21;
        swift_bridgeObjectRetain();
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_234570C88(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
          uint64_t v10 = result;
        }
        unint64_t v23 = *(void *)(v10 + 16);
        unint64_t v22 = *(void *)(v10 + 24);
        if (v23 >= v22 >> 1)
        {
          uint64_t result = (uint64_t)sub_234570C88((char *)(v22 > 1), v23 + 1, 1, (char *)v10);
          uint64_t v10 = result;
        }
        *(void *)(v10 + 16) = v23 + 1;
        unint64_t v24 = v10 + 16 * v23;
        *(void *)(v24 + 32) = v26;
        *(void *)(v24 + 40) = v27;
      }
      else
      {
        uint64_t result = swift_endAccess();
      }
    }
  }
  int64_t v13 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_36;
  }
  if (v13 >= v7) {
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v3 + 8 * v13);
  ++v9;
  if (v14) {
    goto LABEL_25;
  }
  int64_t v9 = v13 + 1;
  if (v13 + 1 >= v7) {
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v3 + 8 * v9);
  if (v14) {
    goto LABEL_25;
  }
  int64_t v9 = v13 + 2;
  if (v13 + 2 >= v7) {
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v3 + 8 * v9);
  if (v14) {
    goto LABEL_25;
  }
  int64_t v9 = v13 + 3;
  if (v13 + 3 >= v7) {
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v3 + 8 * v9);
  if (v14) {
    goto LABEL_25;
  }
  int64_t v9 = v13 + 4;
  if (v13 + 4 >= v7) {
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v3 + 8 * v9);
  if (v14)
  {
LABEL_25:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v9 << 6);
    goto LABEL_26;
  }
  int64_t v15 = v13 + 5;
  if (v15 >= v7)
  {
LABEL_34:
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687A8A40);
    sub_234570DD0();
    uint64_t v25 = sub_234572AB0();
    swift_bridgeObjectRelease();
    return v25;
  }
  unint64_t v14 = *(void *)(v3 + 8 * v15);
  if (v14)
  {
    int64_t v9 = v15;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v9);
    ++v15;
    if (v14) {
      goto LABEL_25;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_234570B04()
{
  return *(void *)v0;
}

uint64_t sub_234570B0C()
{
  return sub_234572B60();
}

uint64_t sub_234570B38()
{
  return sub_234572B70();
}

unint64_t sub_234570B80(uint64_t a1)
{
  sub_234572B50();
  sub_234572B60();
  uint64_t v2 = sub_234572B70();

  return sub_234570BEC(a1, v2);
}

unint64_t sub_234570BEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

char *sub_234570C88(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687A8A78);
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
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  swift_bridgeObjectRelease();
  return v10;
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

unint64_t sub_234570DD0()
{
  unint64_t result = qword_2687A8A48;
  if (!qword_2687A8A48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687A8A40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A8A48);
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

unint64_t sub_234570E78()
{
  unint64_t result = qword_2687A8A50;
  if (!qword_2687A8A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A8A50);
  }
  return result;
}

unint64_t sub_234570ED0()
{
  unint64_t result = qword_2687A8A58;
  if (!qword_2687A8A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A8A58);
  }
  return result;
}

unint64_t sub_234570F28()
{
  unint64_t result = qword_2687A8A60;
  if (!qword_2687A8A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A8A60);
  }
  return result;
}

unint64_t sub_234570F80()
{
  unint64_t result = qword_2687A8A68;
  if (!qword_2687A8A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A8A68);
  }
  return result;
}

unint64_t sub_234570FD8()
{
  unint64_t result = qword_2687A8A70;
  if (!qword_2687A8A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A8A70);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SourceLocationCollectionMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SourceLocationCollectionMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x234571188);
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

uint64_t sub_2345711B0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2345711B8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SourceLocationCollectionMode()
{
  return &type metadata for SourceLocationCollectionMode;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for LoggingProbePointConfiguration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  BOOL v4 = v3 >= 3;
  int v5 = v3 - 3;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for LoggingProbePointConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LoggingProbePointConfiguration()
{
  return &type metadata for LoggingProbePointConfiguration;
}

ValueMetadata *type metadata accessor for LoggingProbePointConfiguration.LogSources()
{
  return &type metadata for LoggingProbePointConfiguration.LogSources;
}

unint64_t sub_234571290(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687A8A88);
  unsigned int v3 = (void *)sub_234572B00();
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  unint64_t result = sub_234570B80(v4);
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v9 = a1 + 9;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v4;
    uint64_t v10 = (void *)(v3[7] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    unint64_t v14 = v9 + 3;
    uint64_t v4 = *(v9 - 2);
    uint64_t v5 = *(v9 - 1);
    uint64_t v15 = *v9;
    swift_bridgeObjectRetain();
    unint64_t result = sub_234570B80(v4);
    uint64_t v9 = v14;
    uint64_t v6 = v15;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t SourceLocation.filePath.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SourceLocation.filePath.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SourceLocation.filePath.modify())()
{
  return nullsub_1;
}

uint64_t SourceLocation.lineNumber.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t SourceLocation.lineNumber.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*SourceLocation.lineNumber.modify())()
{
  return nullsub_1;
}

uint64_t SourceLocation.column.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t SourceLocation.column.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*SourceLocation.column.modify())()
{
  return nullsub_1;
}

uint64_t SourceLocation.callStackAddress.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t SourceLocation.callStackAddress.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*SourceLocation.callStackAddress.modify())()
{
  return nullsub_1;
}

uint64_t SourceLocation.init(filePath:lineNumber:column:callStackAddress:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t static InProcessSymbolicationService.shared.getter()
{
  uint64_t v0 = type metadata accessor for InProcessSymbolicationService();

  return MEMORY[0x270FA0480](v0, &unk_2687A89C0);
}

uint64_t type metadata accessor for InProcessSymbolicationService()
{
  return self;
}

uint64_t sub_234571520()
{
  sub_234571570();
  swift_allocError();
  unsigned char *v0 = 1;
  return swift_willThrow();
}

unint64_t sub_234571570()
{
  unint64_t result = qword_2687A8A90;
  if (!qword_2687A8A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A8A90);
  }
  return result;
}

unint64_t InProcessSymbolicationService.SymbolicationError.errorDescription.getter()
{
  if (*v0) {
    return 0xD00000000000001ELL;
  }
  else {
    return 0xD00000000000002DLL;
  }
}

BOOL static InProcessSymbolicationService.SymbolicationError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t InProcessSymbolicationService.SymbolicationError.hash(into:)()
{
  return sub_234572B60();
}

uint64_t InProcessSymbolicationService.SymbolicationError.hashValue.getter()
{
  return sub_234572B70();
}

unint64_t sub_234571690()
{
  if (*v0) {
    return 0xD00000000000001ELL;
  }
  else {
    return 0xD00000000000002DLL;
  }
}

uint64_t InProcessSymbolicationService.deinit()
{
  return v0;
}

uint64_t InProcessSymbolicationService.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

unint64_t sub_234571708()
{
  unint64_t result = qword_2687A8A98;
  if (!qword_2687A8A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A8A98);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SourceLocation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SourceLocation()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SourceLocation(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SourceLocation(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
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

uint64_t assignWithTake for SourceLocation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SourceLocation(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SourceLocation(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SourceLocation()
{
  return &type metadata for SourceLocation;
}

uint64_t sub_234571940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a6 & 1) == 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for SourceLocationInfo(uint64_t a1)
{
  return sub_234571968(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t sub_234571968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a6 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for SourceLocationInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_234571940(*(void *)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for SourceLocationInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_234571940(*(void *)a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  char v14 = *(unsigned char *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  sub_234571968(v9, v10, v11, v12, v13, v14);
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

uint64_t assignWithTake for SourceLocationInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 40);
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v11;
  *(void *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 40) = v4;
  sub_234571968(v5, v7, v6, v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for SourceLocationInfo(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SourceLocationInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_234571B7C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_234571B84(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SourceLocationInfo()
{
  return &type metadata for SourceLocationInfo;
}

uint64_t method lookup function for InProcessSymbolicationService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InProcessSymbolicationService);
}

uint64_t dispatch thunk of InProcessSymbolicationService.sourceLocationForAddressInCurrentProcess(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t getEnumTagSinglePayload for InProcessSymbolicationService.SymbolicationError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for InProcessSymbolicationService.SymbolicationError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x234571D4CLL);
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

unsigned char *sub_234571D74(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for InProcessSymbolicationService.SymbolicationError()
{
  return &type metadata for InProcessSymbolicationService.SymbolicationError;
}

uint64_t PlaygroundLoggerSample.payload.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  unint64_t v3 = *(void *)(v1 + 8);
  char v4 = *(unsigned char *)(v1 + 16);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return sub_234571DA8(v2, v3, v4);
}

uint64_t sub_234571DA8(uint64_t a1, unint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  else {
    return sub_234571DB8(a1, a2);
  }
}

uint64_t sub_234571DB8(uint64_t a1, unint64_t a2)
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

uint64_t PlaygroundLoggerSample.payload.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t result = sub_234571E50(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
  *(void *)uint64_t v1 = v2;
  *(void *)(v1 + 8) = v3;
  *(unsigned char *)(v1 + 16) = v4;
  return result;
}

uint64_t sub_234571E50(uint64_t a1, unint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  else {
    return sub_234571E60(a1, a2);
  }
}

uint64_t sub_234571E60(uint64_t a1, unint64_t a2)
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

uint64_t (*PlaygroundLoggerSample.payload.modify())()
{
  return nullsub_1;
}

__n128 PlaygroundLoggerSample.init(payload:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  unsigned __int8 v2 = a1[1].n128_u8[0];
  __n128 result = *a1;
  *a2 = *a1;
  a2[1].n128_u8[0] = v2;
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerSample()
{
  return &type metadata for PlaygroundLoggerSample;
}

uint64_t destroy for PlaygroundLoggerSample.Payload(uint64_t a1)
{
  return sub_234571E50(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s30LiveExecutionResultsFoundation22PlaygroundLoggerSampleV7PayloadOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_234571DA8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s30LiveExecutionResultsFoundation22PlaygroundLoggerSampleV7PayloadOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_234571DA8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_234571E50(v6, v7, v8);
  return a1;
}

uint64_t _s30LiveExecutionResultsFoundation22PlaygroundLoggerSampleV7PayloadOwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_234571E50(v4, v5, v6);
  return a1;
}

uint64_t _s30LiveExecutionResultsFoundation22PlaygroundLoggerSampleV7PayloadOwet_0(uint64_t a1, unsigned int a2)
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

uint64_t _s30LiveExecutionResultsFoundation22PlaygroundLoggerSampleV7PayloadOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_2345720AC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2345720B4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PlaygroundLoggerSample.Payload()
{
  return &type metadata for PlaygroundLoggerSample.Payload;
}

LiveExecutionResultsFoundation::PrintSample::LogSource_optional __swiftcall PrintSample.LogSource.init(rawValue:)(Swift::Int rawValue)
{
  unint64_t v2 = 0x304020100uLL >> (8 * rawValue);
  if ((unint64_t)rawValue >= 5) {
    LOBYTE(v2) = 4;
  }
  unsigned char *v1 = v2;
  return (LiveExecutionResultsFoundation::PrintSample::LogSource_optional)rawValue;
}

uint64_t PrintSample.LogSource.rawValue.getter()
{
  return qword_2345734C0[*v0];
}

BOOL sub_234572110(char *a1, char *a2)
{
  return qword_2345734C0[*a1] == qword_2345734C0[*a2];
}

uint64_t sub_234572134()
{
  return sub_234572B70();
}

uint64_t sub_234572184()
{
  return sub_234572B60();
}

uint64_t sub_2345721BC()
{
  return sub_234572B70();
}

LiveExecutionResultsFoundation::PrintSample::LogSource_optional sub_234572208(Swift::Int *a1)
{
  return PrintSample.LogSource.init(rawValue:)(*a1);
}

void sub_234572210(void *a1@<X8>)
{
  *a1 = qword_2345734C0[*v1];
}

uint64_t PrintSample.string.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PrintSample.string.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PrintSample.string.modify())()
{
  return nullsub_1;
}

double PrintSample.timestamp.getter()
{
  return *(double *)(v0 + 16);
}

void PrintSample.timestamp.setter(double a1)
{
  *(double *)(v1 + 16) = a1;
}

uint64_t (*PrintSample.timestamp.modify())()
{
  return nullsub_1;
}

void PrintSample.logSource.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 24);
}

unsigned char *PrintSample.logSource.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 24) = *result;
  return result;
}

uint64_t (*PrintSample.logSource.modify())()
{
  return nullsub_1;
}

uint64_t PrintSample.sourceLocationInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = *(void *)(v1 + 48);
  uint64_t v5 = *(void *)(v1 + 56);
  uint64_t v6 = *(void *)(v1 + 64);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  unsigned __int8 v7 = *(unsigned char *)(v1 + 72);
  *(unsigned char *)(a1 + 40) = v7;
  return sub_23457233C(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_23457233C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 != 255) {
    return sub_234571940(result, a2, a3, a4, a5, a6 & 1);
  }
  return result;
}

__n128 PrintSample.sourceLocationInfo.setter(long long *a1)
{
  __n128 v5 = (__n128)a1[1];
  long long v6 = *a1;
  uint64_t v2 = *((void *)a1 + 4);
  char v3 = *((unsigned char *)a1 + 40);
  sub_2345723BC(*(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(unsigned char *)(v1 + 72));
  __n128 result = v5;
  *(_OWORD *)(v1 + 32) = v6;
  *(__n128 *)(v1 + 48) = v5;
  *(void *)(v1 + 64) = v2;
  *(unsigned char *)(v1 + 72) = v3;
  return result;
}

uint64_t sub_2345723BC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 != 255) {
    return sub_234571968(result, a2, a3, a4, a5, a6 & 1);
  }
  return result;
}

uint64_t (*PrintSample.sourceLocationInfo.modify())()
{
  return nullsub_1;
}

__n128 PrintSample.init(string:timestamp:logSource:sourceLocationInfo:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
  char v6 = *a3;
  uint64_t v7 = *(void *)(a4 + 32);
  char v8 = *(unsigned char *)(a4 + 40);
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(double *)(a5 + 16) = a6;
  *(unsigned char *)(a5 + 24) = v6;
  __n128 result = *(__n128 *)a4;
  long long v10 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(a5 + 32) = *(_OWORD *)a4;
  *(_OWORD *)(a5 + 48) = v10;
  *(void *)(a5 + 64) = v7;
  *(unsigned char *)(a5 + 72) = v8;
  return result;
}

unint64_t sub_234572424()
{
  unint64_t result = qword_2687A8AA0;
  if (!qword_2687A8AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687A8AA0);
  }
  return result;
}

uint64_t destroy for PrintSample(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  int v3 = *(unsigned __int8 *)(a1 + 72);
  if (v3 != 255)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    return sub_234571968(v4, v5, v6, v7, v8, v3 & 1);
  }
  return result;
}

uint64_t initializeWithCopy for PrintSample(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  int v5 = *(unsigned __int8 *)(a2 + 72);
  swift_bridgeObjectRetain();
  if (v5 == 255)
  {
    long long v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v6;
    *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  }
  else
  {
    char v7 = v5 & 1;
    uint64_t v8 = *(void *)(a2 + 32);
    uint64_t v9 = *(void *)(a2 + 40);
    uint64_t v10 = *(void *)(a2 + 48);
    uint64_t v11 = *(void *)(a2 + 56);
    uint64_t v12 = *(void *)(a2 + 64);
    sub_234571940(v8, v9, v10, v11, v12, v7);
    *(void *)(a1 + 32) = v8;
    *(void *)(a1 + 40) = v9;
    *(void *)(a1 + 48) = v10;
    *(void *)(a1 + 56) = v11;
    *(void *)(a1 + 64) = v12;
    *(unsigned char *)(a1 + 72) = v7;
  }
  return a1;
}

uint64_t assignWithCopy for PrintSample(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = (long long *)(a1 + 32);
  int v5 = (long long *)(a2 + 32);
  int v6 = *(unsigned __int8 *)(a2 + 72);
  if (*(unsigned __int8 *)(a1 + 72) == 255)
  {
    if (v6 == 255)
    {
      long long v9 = *v5;
      long long v10 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
      *uint64_t v4 = v9;
      *(_OWORD *)(a1 + 48) = v10;
    }
    else
    {
      char v23 = v6 & 1;
      uint64_t v24 = *(void *)(a2 + 32);
      uint64_t v25 = *(void *)(a2 + 40);
      uint64_t v26 = *(void *)(a2 + 48);
      uint64_t v27 = *(void *)(a2 + 56);
      uint64_t v28 = *(void *)(a2 + 64);
      sub_234571940(v24, v25, v26, v27, v28, v6 & 1);
      *(void *)(a1 + 32) = v24;
      *(void *)(a1 + 40) = v25;
      *(void *)(a1 + 48) = v26;
      *(void *)(a1 + 56) = v27;
      *(void *)(a1 + 64) = v28;
      *(unsigned char *)(a1 + 72) = v23;
    }
  }
  else if (v6 == 255)
  {
    sub_2345726F0(a1 + 32);
    long long v7 = *(_OWORD *)(a2 + 57);
    long long v8 = *(_OWORD *)(a2 + 48);
    *uint64_t v4 = *v5;
    *(_OWORD *)(a1 + 48) = v8;
    *(_OWORD *)(a1 + 57) = v7;
  }
  else
  {
    char v11 = v6 & 1;
    uint64_t v12 = *(void *)(a2 + 32);
    uint64_t v13 = *(void *)(a2 + 40);
    uint64_t v14 = *(void *)(a2 + 48);
    uint64_t v15 = *(void *)(a2 + 56);
    uint64_t v16 = *(void *)(a2 + 64);
    sub_234571940(v12, v13, v14, v15, v16, v6 & 1);
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 56);
    uint64_t v21 = *(void *)(a1 + 64);
    char v22 = *(unsigned char *)(a1 + 72);
    *(void *)(a1 + 32) = v12;
    *(void *)(a1 + 40) = v13;
    *(void *)(a1 + 48) = v14;
    *(void *)(a1 + 56) = v15;
    *(void *)(a1 + 64) = v16;
    *(unsigned char *)(a1 + 72) = v11;
    sub_234571968(v17, v18, v19, v20, v21, v22);
  }
  return a1;
}

uint64_t sub_2345726F0(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for PrintSample(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  int v5 = *(unsigned __int8 *)(a1 + 72);
  if (v5 != 255)
  {
    int v6 = *(unsigned __int8 *)(a2 + 72);
    if (v6 != 255)
    {
      char v8 = v5 & 1;
      uint64_t v9 = *(void *)(a2 + 64);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 64);
      long long v15 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 48) = v15;
      *(void *)(a1 + 64) = v9;
      *(unsigned char *)(a1 + 72) = v6 & 1;
      sub_234571968(v10, v11, v12, v13, v14, v8);
      return a1;
    }
    sub_2345726F0(a1 + 32);
  }
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintSample(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 73)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintSample(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 72) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 73) = 1;
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
    *(unsigned char *)(result + 73) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintSample()
{
  return &type metadata for PrintSample;
}

uint64_t getEnumTagSinglePayload for PrintSample.LogSource(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PrintSample.LogSource(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x234572A28);
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

ValueMetadata *type metadata accessor for PrintSample.LogSource()
{
  return &type metadata for PrintSample.LogSource;
}

uint64_t sub_234572A60()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_234572A70()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_234572A80()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_234572A90()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_234572AA0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_234572AB0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_234572AC0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_234572AE0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_234572AF0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_234572B00()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_234572B10()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_234572B20()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_234572B30()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_234572B40()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_234572B50()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_234572B60()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_234572B70()
{
  return MEMORY[0x270F9FC90]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
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