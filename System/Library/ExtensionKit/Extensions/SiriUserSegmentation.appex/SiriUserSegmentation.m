uint64_t sub_100005018()
{
  uint64_t v0;

  v0 = sub_100007230();
  sub_100007108(v0, qword_10000C410);
  sub_100006F30(v0, (uint64_t)qword_10000C410);
  return sub_100007220();
}

uint64_t SiriUserSegmentationExtensionError.rawValue.getter(char a1)
{
  return *(void *)&aCancelletasker[8 * a1];
}

uint64_t sub_1000050B8(char *a1, char *a2)
{
  return sub_1000050C4(*a1, *a2);
}

uint64_t sub_1000050C4(char a1, char a2)
{
  if (*(void *)&aCancelletasker[8 * a1] == *(void *)&aCancelletasker[8 * a2]
    && *(void *)&aCancelletasker[8 * a1 + 24] == *(void *)&aCancelletasker[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_100007320();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int sub_10000514C()
{
  return sub_100005154();
}

Swift::Int sub_100005154()
{
  return sub_100007380();
}

uint64_t sub_1000051C0()
{
  return sub_1000051C8();
}

uint64_t sub_1000051C8()
{
  sub_100007240();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000521C()
{
  return sub_100005224();
}

Swift::Int sub_100005224()
{
  return sub_100007380();
}

uint64_t sub_10000528C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s20SiriUserSegmentation0abC14ExtensionErrorO8rawValueACSgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_1000052BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriUserSegmentationExtensionError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000052F8()
{
  char v3 = (uint64_t (__cdecl *)())((char *)&dword_10000C078 + dword_10000C078);
  v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000716C;
  return v3();
}

uint64_t sub_100005398(uint64_t a1)
{
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_10000C048 + dword_10000C048);
  char v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *char v3 = v1;
  v3[1] = sub_100005440;
  return v5(a1);
}

uint64_t sub_100005440(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  char v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_10000553C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  void *v15 = v7;
  v15[1] = sub_100005620;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100005620()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005714(uint64_t a1)
{
  unint64_t v2 = sub_100006234();

  return MLHostExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t sub_1000057C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005894(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000070A8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000070A8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007058(v12);
  return v7;
}

uint64_t sub_100005894(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000072B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005A50(a5, a6);
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
  uint64_t v8 = sub_1000072D0();
  if (!v8)
  {
    sub_1000072E0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000072F0();
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

uint64_t sub_100005A50(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005AE8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005CC8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005CC8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005AE8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005C60(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000072C0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000072E0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100007250();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000072F0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000072E0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100005C60(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100006F68(&qword_10000C070);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005CC8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006F68(&qword_10000C070);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  v13 = a4 + 32;
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
  uint64_t result = sub_1000072F0();
  __break(1u);
  return result;
}

uint64_t _s20SiriUserSegmentation0abC14ExtensionErrorO8rawValueACSgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100008420;
  v6._object = a2;
  unint64_t v4 = sub_100007300(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

unint64_t sub_100005E64()
{
  unint64_t result = qword_10000C000;
  if (!qword_10000C000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C000);
  }
  return result;
}

unint64_t sub_100005EBC()
{
  unint64_t result = qword_10000C008;
  if (!qword_10000C008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C008);
  }
  return result;
}

unint64_t sub_100005F14()
{
  unint64_t result = qword_10000C010;
  if (!qword_10000C010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C010);
  }
  return result;
}

unint64_t sub_100005F6C()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

unint64_t sub_100005FC4()
{
  unint64_t result = qword_10000C020[0];
  if (!qword_10000C020[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C020);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for SiriUserSegmentationExtensionError(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriUserSegmentationExtensionError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriUserSegmentationExtensionError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100006184);
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

uint64_t sub_1000061AC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000061B4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriUserSegmentationExtensionError()
{
  return &type metadata for SiriUserSegmentationExtensionError;
}

ValueMetadata *type metadata accessor for SiriUserSegmentationExtension()
{
  return &type metadata for SiriUserSegmentationExtension;
}

uint64_t sub_1000061E0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100006234()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

uint64_t sub_100006288()
{
  return _swift_task_switch(sub_1000062A4, 0, 0);
}

uint64_t sub_1000062A4()
{
  sub_100007190();
  if (sub_100007180())
  {
    if (qword_10000C080 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_100007230();
    sub_100006F30(v1, (uint64_t)qword_10000C410);
    int v2 = sub_100007210();
    os_log_type_t v3 = sub_100007280();
    if (os_log_type_enabled(v2, v3))
    {
      unsigned int v4 = "Segmentation task is enabled";
LABEL_10:
      unsigned int v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, v4, v6, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    if (qword_10000C080 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_100007230();
    sub_100006F30(v5, (uint64_t)qword_10000C410);
    int v2 = sub_100007210();
    os_log_type_t v3 = sub_100007280();
    if (os_log_type_enabled(v2, v3))
    {
      unsigned int v4 = "Segmentation task is not enabled";
      goto LABEL_10;
    }
  }

  objc_allocWithZone((Class)sub_1000071E0());
  uint64_t v7 = sub_1000071D0();
  int v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v8(v7);
}

uint64_t sub_100006464(uint64_t a1)
{
  v1[6] = a1;
  uint64_t v2 = sub_100007260();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  uint64_t v3 = sub_1000071A0();
  v1[10] = v3;
  v1[11] = *(void *)(v3 - 8);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  return _swift_task_switch(sub_10000659C, 0, 0);
}

uint64_t sub_10000659C()
{
  if (qword_10000C080 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = sub_100007230();
  v0[15] = sub_100006F30(v2, (uint64_t)qword_10000C410);
  id v3 = v1;
  unsigned int v4 = sub_100007210();
  os_log_type_t v5 = sub_100007270();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[6];
  if (v6)
  {
    int v8 = (uint8_t *)swift_slowAlloc();
    v13 = (void *)swift_slowAlloc();
    *(_DWORD *)int v8 = 138412290;
    v0[5] = v7;
    id v9 = v7;
    sub_1000072A0();
    void *v13 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Context: %@", v8, 0xCu);
    sub_100006F68(&qword_10000C060);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_100007190();
  uint64_t v10 = (void *)swift_task_alloc();
  v0[16] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_1000067BC;
  uint64_t v11 = v0[14];
  return static SegmentationTask.performAsync()(v11);
}

uint64_t sub_1000067BC()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100006BF8;
  }
  else {
    uint64_t v2 = sub_1000068D0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000068D0()
{
  v29 = v0;
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v4(v1, v0[14], v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v3 + 88))(v1, v2) == enum case for SegmentationTaskResult.failure(_:))
  {
    uint64_t v5 = v0[14];
    uint64_t v6 = v0[12];
    uint64_t v7 = v0[10];
    (*(void (**)(void, uint64_t))(v0[11] + 96))(v0[13], v7);
    swift_bridgeObjectRelease();
    v4(v6, v5, v7);
    int v8 = sub_100007210();
    os_log_type_t v9 = sub_100007290();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v12 = v0[11];
    uint64_t v11 = v0[12];
    uint64_t v13 = v0[10];
    if (v10)
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      v28[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      sub_100007000();
      uint64_t v15 = sub_100007310();
      v0[4] = sub_1000057C0(v15, v16, v28);
      sub_1000072A0();
      swift_bridgeObjectRelease();
      uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
      v17(v11, v13);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Segmentation task error: %s", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
      v17(v0[12], v0[10]);
    }

    uint64_t v23 = v0[14];
    uint64_t v24 = v0[10];
    v28[3] = (uint64_t)&type metadata for SiriUserSegmentationExtensionError;
    v28[4] = sub_100006FAC();
    LOBYTE(v28[0]) = 1;
    id v25 = objc_allocWithZone((Class)sub_1000071E0());
    uint64_t v22 = sub_1000071C0();
    v17(v23, v24);
  }
  else
  {
    uint64_t v18 = v0[14];
    uint64_t v19 = v0[10];
    v20 = *(void (**)(uint64_t, uint64_t))(v0[11] + 8);
    v20(v0[13], v19);
    id v21 = objc_allocWithZone((Class)sub_1000071E0());
    uint64_t v22 = sub_1000071D0();
    v20(v18, v19);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v26 = (uint64_t (*)(uint64_t))v0[1];
  return v26(v22);
}

uint64_t sub_100006BF8()
{
  v0[2] = v0[17];
  swift_errorRetain();
  sub_100006F68(&qword_10000C050);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    uint64_t v1 = sub_100007210();
    os_log_type_t v2 = sub_100007270();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Segmentation cancelled", v3, 2u);
      swift_slowDealloc();
    }
    uint64_t v5 = v0[8];
    uint64_t v4 = v0[9];
    uint64_t v6 = v0[7];

    sub_100006FAC();
    id v7 = objc_allocWithZone((Class)sub_1000071E0());
    uint64_t v8 = sub_1000071C0();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  }
  else
  {
    swift_errorRelease();
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v9 = sub_100007210();
    os_log_type_t v10 = sub_100007290();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 138412290;
      swift_errorRetain();
      uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
      v0[3] = v13;
      sub_1000072A0();
      *uint64_t v12 = v13;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unexpected error: %@", v11, 0xCu);
      sub_100006F68(&qword_10000C060);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    sub_100006FAC();
    id v14 = objc_allocWithZone((Class)sub_1000071E0());
    uint64_t v8 = sub_1000071C0();
  }
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(uint64_t))v0[1];
  return v15(v8);
}

uint64_t sub_100006F30(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100006F68(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006FAC()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

unint64_t sub_100007000()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    sub_1000071A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

uint64_t sub_100007058(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000070A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100007108(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100007180()
{
  return static SegmentationTask.isEnabled()();
}

uint64_t sub_100007190()
{
  return type metadata accessor for SegmentationTask();
}

uint64_t sub_1000071A0()
{
  return type metadata accessor for SegmentationTaskResult();
}

uint64_t sub_1000071B0()
{
  return static AppExtension.main()();
}

uint64_t sub_1000071C0()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_1000071D0()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_1000071E0()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100007210()
{
  return Logger.logObject.getter();
}

uint64_t sub_100007220()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100007230()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100007240()
{
  return String.hash(into:)();
}

Swift::Int sub_100007250()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100007260()
{
  return type metadata accessor for CancellationError();
}

uint64_t sub_100007270()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100007280()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100007290()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000072A0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000072B0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000072C0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000072D0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000072E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000072F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100007300(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100007310()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100007320()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100007330()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100007340()
{
  return Error._code.getter();
}

uint64_t sub_100007350()
{
  return Error._domain.getter();
}

uint64_t sub_100007360()
{
  return Error._userInfo.getter();
}

uint64_t sub_100007370()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100007380()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}