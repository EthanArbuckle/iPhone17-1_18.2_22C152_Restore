uint64_t sub_100001680()
{
  uint64_t v0;

  v0 = sub_1000033B0();
  sub_100002EFC(v0, qword_100008410);
  sub_100002CBC(v0, (uint64_t)qword_100008410);
  return sub_1000033A0();
}

uint64_t sub_100001700()
{
  return _swift_task_switch(sub_10000171C, 0, 0);
}

uint64_t sub_10000171C()
{
  objc_allocWithZone((Class)sub_100003330());
  uint64_t v1 = sub_100003320();
  v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_100001790(uint64_t a1)
{
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_100008028 + dword_100008028);
  v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100001838;
  return v5(a1);
}

uint64_t sub_100001838(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100001934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  void *v15 = v7;
  v15[1] = sub_100001A18;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100001A18()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100001B0C(uint64_t a1)
{
  unint64_t v2 = sub_100001D10();

  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100001B6C@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_1000043F0;
  v7._object = v3;
  Swift::Int v5 = sub_100003460(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_100001BC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000031FC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100001C54()
{
  unint64_t result = qword_100008000[0];
  if (!qword_100008000[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100008000);
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeLibraryEventUploader()
{
  return &type metadata for BiomeLibraryEventUploader;
}

uint64_t sub_100001CBC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100001D10()
{
  unint64_t result = qword_100008020;
  if (!qword_100008020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008020);
  }
  return result;
}

uint64_t sub_100001D64(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100001E38(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100002E9C((uint64_t)v12, *a3);
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
      sub_100002E9C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100002E4C(v12);
  return v7;
}

uint64_t sub_100001E38(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100003410();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100001FF4(a5, a6);
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
  uint64_t v8 = sub_100003430();
  if (!v8)
  {
    sub_100003440();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100003450();
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

uint64_t sub_100001FF4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000208C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000226C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000226C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000208C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100002204(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100003420();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100003440();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000033D0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100003450();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100003440();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100002204(uint64_t a1, uint64_t a2)
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
  sub_100002CF4(&qword_100008050);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000226C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100002CF4(&qword_100008050);
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
  uint64_t result = sub_100003450();
  __break(1u);
  return result;
}

uint64_t sub_1000023BC(uint64_t a1)
{
  v1[30] = a1;
  uint64_t v2 = sub_100003380();
  v1[31] = v2;
  v1[32] = *(void *)(v2 - 8);
  v1[33] = swift_task_alloc();
  return _swift_task_switch(sub_10000247C, 0, 0);
}

uint64_t sub_10000247C()
{
  if (qword_100008080 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[30];
  uint64_t v2 = sub_1000033B0();
  v0[34] = sub_100002CBC(v2, (uint64_t)qword_100008410);
  id v3 = v1;
  uint64_t v4 = sub_100003390();
  os_log_type_t v5 = sub_1000033E0();
  BOOL v6 = os_log_type_enabled(v4, v5);
  int64_t v7 = (void *)v0[30];
  if (v6)
  {
    int64_t v8 = (uint8_t *)swift_slowAlloc();
    v13 = (void *)swift_slowAlloc();
    *(_DWORD *)int64_t v8 = 138412290;
    v0[29] = v7;
    id v9 = v7;
    sub_100003400();
    void *v13 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Context: %@", v8, 0xCu);
    sub_100002CF4(&qword_100008048);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_100003360();
  uint64_t v10 = (void *)swift_task_alloc();
  v0[35] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_1000026B4;
  uint64_t v11 = v0[30];
  return BiomeUploadProcessor.doWork(context:)(v11);
}

uint64_t sub_1000026B4()
{
  *(void *)(*(void *)v1 + 288) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100002874;
  }
  else {
    uint64_t v2 = sub_1000027C8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000027C8()
{
  uint64_t v2 = v0[32];
  uint64_t v1 = v0[33];
  uint64_t v3 = v0[31];
  id v4 = objc_allocWithZone((Class)sub_100003330());
  uint64_t v5 = sub_100003320();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  BOOL v6 = (uint64_t (*)(uint64_t))v0[1];
  return v6(v5);
}

uint64_t sub_100002874()
{
  uint64_t v24 = v0;
  *(void *)(v0 + 200) = *(void *)(v0 + 288);
  swift_errorRetain();
  sub_100002CF4(&qword_100008030);
  sub_100002CF4(&qword_100008038);
  if (swift_dynamicCast())
  {
    uint64_t v1 = v0 + 96;
    swift_errorRelease();
    sub_100002D8C((long long *)(v0 + 56), v0 + 16);
    sub_100002DA4(v0 + 16, v0 + 136);
    uint64_t v2 = sub_100003390();
    os_log_type_t v3 = sub_1000033F0();
    if (os_log_type_enabled(v2, v3))
    {
      id v4 = (uint8_t *)swift_slowAlloc();
      v23[0] = swift_slowAlloc();
      *(_DWORD *)id v4 = 136315138;
      sub_100002E08((void *)(v0 + 136), *(void *)(v0 + 160));
      uint64_t v5 = sub_100003470();
      *(void *)(v0 + 224) = sub_100001D64(v5, v6, v23);
      sub_100003400();
      swift_bridgeObjectRelease();
      sub_100002E4C((void *)(v0 + 136));
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "MLHostError: %s", v4, 0xCu);
      swift_arrayDestroy();
      uint64_t v1 = v0 + 96;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100002E4C((void *)(v0 + 136));
    }

    uint64_t v13 = *(void *)(v0 + 256);
    uint64_t v12 = *(void *)(v0 + 264);
    uint64_t v14 = *(void *)(v0 + 248);
    sub_100002DA4(v0 + 16, v1);
    id v15 = objc_allocWithZone((Class)sub_100003330());
    uint64_t v16 = sub_100003310();
    sub_100002E4C((void *)(v0 + 16));
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRetain();
    swift_errorRetain();
    int64_t v7 = sub_100003390();
    os_log_type_t v8 = sub_1000033F0();
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = (uint8_t *)swift_slowAlloc();
      v23[0] = swift_slowAlloc();
      *(_DWORD *)id v9 = 136315138;
      swift_getErrorValue();
      uint64_t v10 = sub_100003470();
      *(void *)(v0 + 208) = sub_100001D64(v10, v11, v23);
      sub_100003400();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Error running worker: %s", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v18 = *(void *)(v0 + 256);
    uint64_t v17 = *(void *)(v0 + 264);
    uint64_t v19 = *(void *)(v0 + 248);
    v23[3] = (uint64_t)&type metadata for BiomeLibraryEventUploaderError;
    v23[4] = sub_100002D38();
    id v20 = objc_allocWithZone((Class)sub_100003330());
    uint64_t v16 = sub_100003310();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  }
  swift_task_dealloc();
  v21 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v21(v16);
}

uint64_t sub_100002CBC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100002CF4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100002D38()
{
  unint64_t result = qword_100008040;
  if (!qword_100008040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008040);
  }
  return result;
}

uint64_t sub_100002D8C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100002DA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_100002E08(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100002E4C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100002E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100002EFC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t getEnumTagSinglePayload for BiomeLibraryEventUploaderError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for BiomeLibraryEventUploaderError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100003054);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000307C()
{
  return 0;
}

ValueMetadata *type metadata accessor for BiomeLibraryEventUploaderError()
{
  return &type metadata for BiomeLibraryEventUploaderError;
}

unint64_t sub_100003098()
{
  unint64_t result = qword_100008058;
  if (!qword_100008058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008058);
  }
  return result;
}

unint64_t sub_1000030F0()
{
  unint64_t result = qword_100008060;
  if (!qword_100008060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008060);
  }
  return result;
}

unint64_t sub_100003148()
{
  unint64_t result = qword_100008068;
  if (!qword_100008068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008068);
  }
  return result;
}

unint64_t sub_1000031A0()
{
  unint64_t result = qword_100008070;
  if (!qword_100008070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008070);
  }
  return result;
}

uint64_t sub_1000031F4()
{
  return 1;
}

uint64_t sub_1000031FC()
{
  return 0x6F737365636F7270;
}

Swift::Int sub_100003220()
{
  return sub_1000034D0();
}

uint64_t sub_100003280()
{
  return sub_1000033C0();
}

Swift::Int sub_1000032A4()
{
  return sub_1000034D0();
}

uint64_t sub_100003300()
{
  return static AppExtension.main()();
}

uint64_t sub_100003310()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_100003320()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100003330()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100003360()
{
  return BiomeUploadProcessor.init(biomeUseCase:)();
}

uint64_t sub_100003380()
{
  return type metadata accessor for BiomeUploadProcessor();
}

uint64_t sub_100003390()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000033A0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000033B0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000033C0()
{
  return String.hash(into:)();
}

Swift::Int sub_1000033D0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000033E0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000033F0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100003400()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100003410()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100003420()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100003430()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100003440()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100003450()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100003460(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100003470()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100003480()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100003490()
{
  return Error._code.getter();
}

uint64_t sub_1000034A0()
{
  return Error._domain.getter();
}

uint64_t sub_1000034B0()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000034C0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000034D0()
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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