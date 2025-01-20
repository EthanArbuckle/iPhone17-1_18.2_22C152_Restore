uint64_t sub_100004110()
{
  uint64_t v0;

  v0 = sub_100007030();
  sub_100006B58(v0, qword_10000C670);
  sub_100006AB8(v0, (uint64_t)qword_10000C670);
  return sub_100007020();
}

unint64_t sub_100004194(char a1, double a2)
{
  uint64_t v4 = sub_100007270();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = &type metadata for PhotosSearchClientLighthouseConfig;
  LOBYTE(v14) = a1;
  unint64_t v15 = *(void *)&a2;
  sub_100007250();
  sub_100007260();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v8 = sub_100004324();
  swift_release();
  unint64_t v14 = 0xD000000000000023;
  unint64_t v15 = 0x8000000100007C30;
  v13 = v8;
  sub_100004E7C(&qword_10000C0F8);
  sub_100006BBC();
  uint64_t v9 = sub_100007130();
  v11 = v10;
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = v9;
  v17._object = v11;
  sub_100007140(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 41;
  v18._object = (void *)0xE100000000000000;
  sub_100007140(v18);
  return v14;
}

char *sub_100004324()
{
  swift_retain();
  sub_100007180();
  swift_release();
  sub_1000071C0();
  if (*((void *)&v9 + 1))
  {
    v0 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      v6[0] = v7;
      v6[1] = v8;
      v6[2] = v9;
      v1._object = (void *)*((void *)&v7 + 1);
      if (*((void *)&v7 + 1))
      {
        v1._countAndFlagsBits = *(void *)&v6[0];
        sub_100007140(v1);
        v10._countAndFlagsBits = 8250;
        v10._object = (void *)0xE200000000000000;
        sub_100007140(v10);
        sub_100007190();
        sub_100006C60((uint64_t)v6, &qword_10000C108);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v0 = sub_10000550C(0, *((void *)v0 + 2) + 1, 1, v0);
        }
        unint64_t v3 = *((void *)v0 + 2);
        unint64_t v2 = *((void *)v0 + 3);
        if (v3 >= v2 >> 1) {
          v0 = sub_10000550C((char *)(v2 > 1), v3 + 1, 1, v0);
        }
        *((void *)v0 + 2) = v3 + 1;
        uint64_t v4 = &v0[16 * v3];
        *((void *)v4 + 4) = 0;
        *((void *)v4 + 5) = 0xE000000000000000;
      }
      else
      {
        sub_100006C60((uint64_t)v6, &qword_10000C108);
      }
      sub_1000071C0();
    }
    while (*((void *)&v9 + 1));
  }
  else
  {
    v0 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_release();
  return v0;
}

uint64_t sub_1000044D0(char a1)
{
  if (a1) {
    return 0xD000000000000011;
  }
  else {
    return 0x726150776F6C6C61;
  }
}

BOOL sub_100004514(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10000452C()
{
  Swift::UInt v1 = *v0;
  sub_100007220();
  sub_100007230(v1);
  return sub_100007240();
}

void sub_100004574()
{
  sub_100007230(*v0);
}

Swift::Int sub_1000045A0()
{
  Swift::UInt v1 = *v0;
  sub_100007220();
  sub_100007230(v1);
  return sub_100007240();
}

uint64_t sub_1000045E4()
{
  return sub_1000044D0(*v0);
}

uint64_t sub_1000045EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100005710(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100004614()
{
  return 0;
}

void sub_100004620(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000462C(uint64_t a1)
{
  unint64_t v2 = sub_1000059F4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100004668(uint64_t a1)
{
  unint64_t v2 = sub_1000059F4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000046A4(void *a1)
{
  uint64_t v3 = sub_100004E7C(&qword_10000C0D8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000059B0(a1, a1[3]);
  sub_1000059F4();
  sub_100007290();
  char v10 = 0;
  sub_1000071F0();
  if (!v1)
  {
    char v9 = 1;
    sub_100007200();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_10000480C(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = sub_100005808(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4 & 1;
    *(double *)(a2 + 8) = v5;
  }
}

uint64_t sub_100004840(void *a1)
{
  return sub_1000046A4(a1);
}

unint64_t sub_100004860()
{
  return sub_100004194(*(unsigned char *)v0, *(double *)(v0 + 8));
}

uint64_t sub_10000486C()
{
  return _swift_task_switch(sub_100004888, 0, 0);
}

uint64_t sub_100004888()
{
  objc_allocWithZone((Class)sub_100006FC0());
  uint64_t v1 = sub_100006FB0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1000048FC()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_10000C0E0 + dword_10000C0E0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000499C;
  return v3();
}

uint64_t sub_10000499C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100004A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *unint64_t v15 = v7;
  v15[1] = sub_100004B7C;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100004B7C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004C70(uint64_t a1)
{
  uint64_t v2 = sub_1000054C8(&qword_10000C0C8);

  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100004CD8()
{
  return sub_100006FF0();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for PhotosSearchClientLighthouse()
{
  uint64_t result = qword_10000C128;
  if (!qword_10000C128) {
    return swift_getSingletonMetadata();
  }
  return result;
}

ValueMetadata *type metadata accessor for AMLLighthouseConstants()
{
  return &type metadata for AMLLighthouseConstants;
}

uint64_t sub_100004E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004E7C(&qword_10000C010);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_100004E7C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004EC0(uint64_t a1)
{
  uint64_t v2 = sub_100004E7C(&qword_10000C010);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100004F28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004E7C(&qword_10000C010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100004F90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004E7C(&qword_10000C010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100004FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004E7C(&qword_10000C010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100005060(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004E7C(&qword_10000C010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000050C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000050DC);
}

uint64_t sub_1000050DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004E7C(&qword_10000C010);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10000514C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005160);
}

uint64_t sub_100005160(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004E7C(&qword_10000C010);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_1000051D4()
{
  sub_100005260();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100005260()
{
  if (!qword_10000C070)
  {
    sub_1000052C8();
    sub_10000531C();
    unint64_t v0 = sub_100007000();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C070);
    }
  }
}

unint64_t sub_1000052C8()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_10000531C()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for PhotosSearchClientLighthouseConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PhotosSearchClientLighthouseConfig(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[16]) {
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

uint64_t storeEnumTagSinglePayload for PhotosSearchClientLighthouseConfig(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)__n128 result = a2 - 255;
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
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotosSearchClientLighthouseConfig()
{
  return &type metadata for PhotosSearchClientLighthouseConfig;
}

uint64_t sub_100005424()
{
  return sub_1000054C8(&qword_10000C008);
}

uint64_t sub_100005458()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000054C8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PhotosSearchClientLighthouse();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *sub_10000550C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100004E7C((uint64_t *)&unk_10000C110);
      char v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      char v10 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000561C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000561C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1000071B0();
  __break(1u);
  return result;
}

uint64_t sub_100005710(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726150776F6C6C61 && a2 == 0xEC0000006C616974;
  if (v3 || (sub_100007210() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100007D00)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100007210();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

double sub_100005808(void *a1)
{
  uint64_t v4 = sub_100004E7C(&qword_10000C0D0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000059B0(a1, a1[3]);
  sub_1000059F4();
  sub_100007280();
  if (!v1)
  {
    char v12 = 0;
    sub_1000071D0();
    char v11 = 1;
    sub_1000071E0();
    double v2 = v8;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_100005A48((uint64_t)a1);
  return v2;
}

void *sub_1000059B0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000059F4()
{
  unint64_t result = qword_10000C3C0[0];
  if (!qword_10000C3C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C3C0);
  }
  return result;
}

uint64_t sub_100005A48(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005A98()
{
  uint64_t v1 = sub_100006F90();
  v0[16] = v1;
  v0[17] = *(void *)(v1 - 8);
  v0[18] = swift_task_alloc();
  v0[19] = swift_task_alloc();
  v0[20] = swift_task_alloc();
  v0[21] = swift_task_alloc();
  v0[22] = swift_task_alloc();
  v0[23] = swift_task_alloc();
  sub_100004E7C(&qword_10000C0E8);
  v0[24] = swift_task_alloc();
  v0[25] = swift_task_alloc();
  v0[26] = swift_task_alloc();
  v0[27] = swift_task_alloc();
  v0[28] = swift_task_alloc();
  v0[29] = swift_task_alloc();
  v0[30] = swift_task_alloc();
  v0[31] = swift_task_alloc();
  sub_100004E7C(&qword_10000C0F0);
  v0[32] = swift_task_alloc();
  return _swift_task_switch(sub_100005C4C, 0, 0);
}

uint64_t sub_100005C4C()
{
  uint64_t v1 = v0[32];
  id v2 = [objc_allocWithZone((Class)sub_1000070B0()) init];
  uint64_t v3 = sub_100006F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v1, 1, 1, v3);
  unint64_t v4 = sub_1000070A0();
  sub_100006C60(v1, &qword_10000C0F0);
  v92 = v2;
  sub_100007090();
  if (qword_10000C120 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100007030();
  sub_100006AB8(v5, (uint64_t)qword_10000C670);
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_100007010();
  os_log_type_t v7 = sub_100007150();
  if (os_log_type_enabled(v6, v7))
  {
    double v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)double v8 = 134217984;
    if (v4)
    {
      if (v4 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v9 = sub_1000071A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
    }
    v0[15] = v9;
    sub_100007170();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Uploaded %ld data payloads to PET", v8, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  id v91 = [objc_allocWithZone((Class)sub_1000070D0()) init];
  unint64_t v10 = sub_1000070C0();
  swift_bridgeObjectRetain();
  char v11 = sub_100007010();
  os_log_type_t v12 = sub_100007150();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v13 = 134217984;
    if (v10)
    {
      if (v10 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v14 = sub_1000071A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v14 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v14 = 0;
    }
    v0[14] = v14;
    sub_100007170();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Uploaded %ld metrics payloads to CA", v13, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  v90 = v0 + 12;

  v16 = v0 + 29;
  uint64_t v15 = v0[29];
  uint64_t v17 = v0[31];
  uint64_t v18 = v0[16];
  uint64_t v19 = v0[17];
  id v94 = [objc_allocWithZone((Class)sub_100007080()) init];
  id v20 = [objc_allocWithZone((Class)sub_100007100()) init];
  sub_100007050();
  swift_allocObject();
  sub_100007040();
  v93 = v20;
  sub_1000070E0();
  v0[12] = 0;
  sub_100006AF0(v17, v15);
  v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
  if (v21(v15, 1, v18) == 1) {
    goto LABEL_22;
  }
  v16 = v0 + 28;
  uint64_t v22 = v0[28];
  uint64_t v23 = v0[30];
  uint64_t v24 = v0[16];
  v25 = *(void (**)(void, void, uint64_t))(v0[17] + 32);
  v25(v0[23], v0[29], v24);
  sub_100006AF0(v23, v22);
  if (v21(v22, 1, v24) == 1)
  {
    (*(void (**)(void, void))(v0[17] + 8))(v0[23], v0[16]);
LABEL_22:
    sub_100006C60(*v16, &qword_10000C0E8);
    v26 = sub_100007010();
    os_log_type_t v27 = sub_100007160();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Failure to upload data metrics. Dataframes were empty", v28, 2u);
      swift_slowDealloc();
    }

    goto LABEL_32;
  }
  v25(v0[22], v0[28], v0[16]);
  v0[12] = sub_1000070F0();
  v29 = sub_100007010();
  os_log_type_t v30 = sub_100007150();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v31 = 134217984;
    swift_beginAccess();
    unint64_t v32 = *v90;
    if (*v90)
    {
      if (v32 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v33 = sub_1000071A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v33 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
    }
    else
    {
      uint64_t v33 = 0;
    }
    v0[13] = v33;
    sub_100007170();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Uploaded %ld metrics payloads to PET", v31, 0xCu);
    swift_slowDealloc();
  }
  uint64_t v35 = v0[22];
  uint64_t v34 = v0[23];
  uint64_t v36 = v0[16];
  uint64_t v37 = v0[17];

  v38 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
  v38(v35, v36);
  v38(v34, v36);
LABEL_32:
  v89 = v0 + 10;
  v40 = v0 + 27;
  uint64_t v39 = v0[27];
  uint64_t v41 = v0[31];
  uint64_t v42 = v0[16];
  v0[10] = 0;
  sub_100006AF0(v41, v39);
  if (v21(v39, 1, v42) == 1)
  {
LABEL_35:
    sub_100006C60(*v40, &qword_10000C0E8);
    v47 = sub_100007010();
    os_log_type_t v48 = sub_100007160();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Failure to upload user metrics. Dataframes were empty", v49, 2u);
      swift_slowDealloc();
    }

    goto LABEL_45;
  }
  v40 = v0 + 26;
  uint64_t v43 = v0[26];
  uint64_t v44 = v0[30];
  uint64_t v45 = v0[16];
  v46 = *(void (**)(void, void, uint64_t))(v0[17] + 32);
  v46(v0[21], v0[27], v45);
  sub_100006AF0(v44, v43);
  if (v21(v43, 1, v45) == 1)
  {
    (*(void (**)(void, void))(v0[17] + 8))(v0[21], v0[16]);
    goto LABEL_35;
  }
  v46(v0[20], v0[26], v0[16]);
  id v50 = [objc_allocWithZone((Class)sub_100007120()) init];
  v0[10] = sub_100007110();
  v51 = sub_100007010();
  os_log_type_t v52 = sub_100007150();
  if (os_log_type_enabled(v51, v52))
  {
    id v88 = v50;
    v53 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v53 = 134217984;
    swift_beginAccess();
    unint64_t v54 = *v89;
    if (*v89)
    {
      if (v54 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v55 = sub_1000071A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v55 = *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
    }
    else
    {
      uint64_t v55 = 0;
    }
    v0[11] = v55;
    sub_100007170();
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "Uploaded %ld metrics payloads to CA", v53, 0xCu);
    swift_slowDealloc();
    id v50 = v88;
  }
  uint64_t v57 = v0[20];
  uint64_t v56 = v0[21];
  uint64_t v58 = v0[16];
  uint64_t v59 = v0[17];

  v60 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
  v60(v57, v58);
  v60(v56, v58);
LABEL_45:
  uint64_t v61 = v0[25];
  uint64_t v62 = v0[16];
  sub_100006AF0(v0[31], v61);
  if (v21(v61, 1, v62) == 1)
  {
    sub_100006C60(v0[25], &qword_10000C0E8);
  }
  else
  {
    uint64_t v63 = v0[30];
    uint64_t v64 = v0[24];
    uint64_t v65 = v0[16];
    v66 = *(void (**)(void, void, uint64_t))(v0[17] + 32);
    v66(v0[19], v0[25], v65);
    sub_100006AF0(v63, v64);
    unsigned int v67 = v21(v64, 1, v65);
    uint64_t v68 = v0[24];
    if (v67 == 1)
    {
      (*(void (**)(void, void))(v0[17] + 8))(v0[19], v0[16]);
      sub_100006C60(v68, &qword_10000C0E8);
    }
    else
    {
      v66(v0[18], v0[24], v0[16]);
      unint64_t v69 = sub_100007070();
      swift_bridgeObjectRetain();
      v70 = sub_100007010();
      os_log_type_t v71 = sub_100007150();
      if (os_log_type_enabled(v70, v71))
      {
        v72 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v72 = 134217984;
        if (v69)
        {
          if (v69 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v73 = sub_1000071A0();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v73 = *(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v73 = 0;
        }
        v0[9] = v73;
        sub_100007170();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v70, v71, "Populated %ld sessions from Poirot in Insights stream", v72, 0xCu);
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      uint64_t v74 = v0[19];
      uint64_t v75 = v0[16];
      v76 = *(void (**)(uint64_t, uint64_t))(v0[17] + 8);
      v76(v0[18], v75);
      v76(v74, v75);
    }
  }
  unint64_t v77 = sub_100007060();
  swift_bridgeObjectRetain();
  v78 = sub_100007010();
  os_log_type_t v79 = sub_100007150();
  if (os_log_type_enabled(v78, v79))
  {
    v80 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v80 = 134217984;
    if (v77)
    {
      if (v77 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v81 = sub_1000071A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v81 = *(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v81 = 0;
    }
    v0[8] = v81;
    sub_100007170();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v78, v79, "Populated %ld sessions from Biome in Insights stream", v80, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v82 = v0[31];
  uint64_t v83 = v0[30];
  id v84 = objc_allocWithZone((Class)sub_100006FC0());
  uint64_t v87 = sub_100006FB0();
  swift_release();

  sub_100006C60(v83, &qword_10000C0E8);
  sub_100006C60(v82, &qword_10000C0E8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  v85 = (uint64_t (*)(uint64_t))v0[1];
  return v85(v87);
}

uint64_t sub_100006AB8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100006AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004E7C(&qword_10000C0E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_100006B58(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100006BBC()
{
  unint64_t result = qword_10000C100;
  if (!qword_10000C100)
  {
    sub_100006C18(&qword_10000C0F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C100);
  }
  return result;
}

uint64_t sub_100006C18(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006C60(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004E7C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unsigned char *initializeBufferWithCopyOfBuffer for PhotosSearchClientLighthouseConfig.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PhotosSearchClientLighthouseConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PhotosSearchClientLighthouseConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100006E28);
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

uint64_t sub_100006E50(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006E5C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PhotosSearchClientLighthouseConfig.CodingKeys()
{
  return &type metadata for PhotosSearchClientLighthouseConfig.CodingKeys;
}

unint64_t sub_100006E7C()
{
  unint64_t result = qword_10000C4D0[0];
  if (!qword_10000C4D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C4D0);
  }
  return result;
}

unint64_t sub_100006ED4()
{
  unint64_t result = qword_10000C5E0;
  if (!qword_10000C5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C5E0);
  }
  return result;
}

unint64_t sub_100006F2C()
{
  unint64_t result = qword_10000C5E8[0];
  if (!qword_10000C5E8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C5E8);
  }
  return result;
}

uint64_t sub_100006F80()
{
  return type metadata accessor for DateInterval();
}

uint64_t sub_100006F90()
{
  return type metadata accessor for DataFrame();
}

uint64_t sub_100006FA0()
{
  return static AppExtension.main()();
}

uint64_t sub_100006FB0()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100006FC0()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100006FF0()
{
  return MLHostParameters.init(taskParameters:)();
}

uint64_t sub_100007000()
{
  return type metadata accessor for MLHostParameters();
}

uint64_t sub_100007010()
{
  return Logger.logObject.getter();
}

uint64_t sub_100007020()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100007030()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100007040()
{
  return AMLSODAConfig.init(loggingPath:taskId:taskName:)();
}

uint64_t sub_100007050()
{
  return type metadata accessor for AMLSODAConfig();
}

uint64_t sub_100007060()
{
  return dispatch thunk of AMLPhotosSearchInsights.populateBiomeInsightsStream(createBiomeEvents:printDebug:)();
}

uint64_t sub_100007070()
{
  return dispatch thunk of AMLPhotosSearchInsights.populatePoirotInsightsStream(_:_:createBiomeEvents:printDebug:)();
}

uint64_t sub_100007080()
{
  return type metadata accessor for AMLPhotosSearchInsights();
}

uint64_t sub_100007090()
{
  return dispatch thunk of AMLPhotosSearchBiomeDataMetrics.populateLabeledDataStream(withPetPayload:)();
}

uint64_t sub_1000070A0()
{
  return dispatch thunk of AMLPhotosSearchBiomeDataMetrics.petPayloads(forDateInterval:doUpload:printDebug:)();
}

uint64_t sub_1000070B0()
{
  return type metadata accessor for AMLPhotosSearchBiomeDataMetrics();
}

uint64_t sub_1000070C0()
{
  return dispatch thunk of AMLPhotosSearchBiomeUserMetrics.metricsPayloads(doUpload:printDebug:)();
}

uint64_t sub_1000070D0()
{
  return type metadata accessor for AMLPhotosSearchBiomeUserMetrics();
}

uint64_t sub_1000070E0()
{
  return dispatch thunk of AMLPhotosSearchPoirotDataMetrics.retrieveSpotlightDataFrame(_:printDebug:)();
}

uint64_t sub_1000070F0()
{
  return dispatch thunk of AMLPhotosSearchPoirotDataMetrics.metricsPayloads(_:_:_:doUpload:printDebug:)();
}

uint64_t sub_100007100()
{
  return type metadata accessor for AMLPhotosSearchPoirotDataMetrics();
}

uint64_t sub_100007110()
{
  return dispatch thunk of AMLPhotosSearchPoirotUserMetrics.metricsPayloads(_:_:_:doUpload:printDebug:)();
}

uint64_t sub_100007120()
{
  return type metadata accessor for AMLPhotosSearchPoirotUserMetrics();
}

uint64_t sub_100007130()
{
  return BidirectionalCollection<>.joined(separator:)();
}

void sub_100007140(Swift::String a1)
{
}

uint64_t sub_100007150()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100007160()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100007170()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100007180()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t sub_100007190()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_1000071A0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000071B0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000071C0()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

uint64_t sub_1000071D0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000071E0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000071F0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100007200()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100007210()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100007220()
{
  return Hasher.init(_seed:)();
}

void sub_100007230(Swift::UInt a1)
{
}

Swift::Int sub_100007240()
{
  return Hasher._finalize()();
}

uint64_t sub_100007250()
{
  return Mirror.init(reflecting:)();
}

uint64_t sub_100007260()
{
  return Mirror.children.getter();
}

uint64_t sub_100007270()
{
  return type metadata accessor for Mirror();
}

uint64_t sub_100007280()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100007290()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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