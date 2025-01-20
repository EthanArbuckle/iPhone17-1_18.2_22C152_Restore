uint64_t sub_100003AA4()
{
  uint64_t v0;

  v0 = sub_100006EF0();
  sub_100006AFC(v0, qword_10000C680);
  sub_1000068B8(v0, (uint64_t)qword_10000C680);
  return sub_100006EE0();
}

uint64_t sub_100003B28(char a1)
{
  if (a1) {
    return 0xD000000000000011;
  }
  else {
    return 0x726150776F6C6C61;
  }
}

BOOL sub_100003B6C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100003B84()
{
  Swift::UInt v1 = *v0;
  sub_100007050();
  sub_100007060(v1);
  return sub_100007070();
}

void sub_100003BCC()
{
  sub_100007060(*v0);
}

Swift::Int sub_100003BF8()
{
  Swift::UInt v1 = *v0;
  sub_100007050();
  sub_100007060(v1);
  return sub_100007070();
}

uint64_t sub_100003C3C()
{
  return sub_100003B28(*v0);
}

uint64_t sub_100003C44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100006488(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100003C6C()
{
  return 0;
}

void sub_100003C78(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100003C84(uint64_t a1)
{
  unint64_t v2 = sub_100006864();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100003CC0(uint64_t a1)
{
  unint64_t v2 = sub_100006864();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100003CFC(void *a1)
{
  uint64_t v3 = sub_100005648(&qword_10000C0F0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006820(a1, a1[3]);
  sub_100006864();
  sub_1000070C0();
  char v10 = 0;
  sub_100007010();
  if (!v1)
  {
    char v9 = 1;
    sub_100007020();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_100003E64(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = sub_100006580(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4 & 1;
    *(double *)(a2 + 8) = v5;
  }
}

uint64_t sub_100003E98(void *a1)
{
  return sub_100003CFC(a1);
}

uint64_t sub_100003EB8(uint64_t a1)
{
  v2[10] = a1;
  v2[11] = v1;
  uint64_t v3 = sub_100006F30();
  v2[12] = v3;
  v2[13] = *(void *)(v3 - 8);
  v2[14] = swift_task_alloc();
  uint64_t v4 = sub_100006EC0();
  v2[15] = v4;
  v2[16] = *(void *)(v4 - 8);
  v2[17] = swift_task_alloc();
  v2[18] = type metadata accessor for PeopleSuggesterMetricsLighthouse();
  v2[19] = swift_task_alloc();
  sub_100005648(&qword_10000C100);
  v2[20] = swift_task_alloc();
  uint64_t v5 = sub_100005648(&qword_10000C008);
  v2[21] = v5;
  v2[22] = *(void *)(v5 - 8);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  return _swift_task_switch(sub_1000040A4, 0, 0);
}

uint64_t sub_1000040A4()
{
  if (qword_10000C130 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = sub_100006EF0();
  v0[25] = sub_1000068B8(v2, (uint64_t)qword_10000C680);
  id v3 = v1;
  uint64_t v4 = sub_100006ED0();
  os_log_type_t v5 = sub_100006F40();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[10];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    v18 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    v0[9] = v7;
    id v9 = v7;
    sub_100006F60();
    void *v18 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Context: %@", v8, 0xCu);
    sub_100005648(&qword_10000C110);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  char v10 = (void *)swift_task_alloc();
  v0[26] = v10;
  uint64_t v11 = sub_100005C94(&qword_10000C0C0);
  unint64_t v12 = sub_100005A94();
  unint64_t v13 = sub_100005AE8();
  *char v10 = v0;
  v10[1] = sub_100004304;
  uint64_t v14 = v0[20];
  uint64_t v15 = v0[18];
  uint64_t v16 = v0[10];
  return MLHostExtension.loadConfig<A>(context:)(v14, v16, v15, &type metadata for PeopleSuggesterMetricsLighthouseConfig, v11, v12, v13);
}

uint64_t sub_100004304()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100004400, 0, 0);
}

uint64_t sub_100004400()
{
  v25 = v0;
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[20];
  sub_1000068F0(v0[11], v0[19]);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = v0[24];
  uint64_t v6 = v0[21];
  uint64_t v7 = v0[22];
  uint64_t v8 = v0[20];
  if (v4 == 1)
  {
    (*(void (**)(void, void, void))(v7 + 32))(v0[24], v0[19], v0[21]);
    sub_100006954(v8, &qword_10000C100);
  }
  else
  {
    sub_1000069F4(v0[19]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v5, v8, v6);
  }
  (*(void (**)(void, void, void))(v0[22] + 16))(v0[23], v0[24], v0[21]);
  id v9 = sub_100006ED0();
  os_log_type_t v10 = sub_100006F40();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v13 = v0[22];
  uint64_t v12 = v0[23];
  uint64_t v14 = v0[21];
  if (v11)
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315138;
    sub_1000069B0(&qword_10000C118, &qword_10000C008);
    uint64_t v16 = sub_100007030();
    v0[8] = sub_100005E30(v16, v17, &v24);
    sub_100006F60();
    swift_bridgeObjectRelease();
    v18 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v18(v12, v14);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Configuration: %s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v18 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v18(v0[23], v0[21]);
  }

  v0[27] = v18;
  sub_100006EB0();
  sub_100006E80();
  unint64_t v19 = v0[3];
  v20 = (void *)swift_task_alloc();
  v0[28] = v20;
  void *v20 = v0;
  v20[1] = sub_1000046FC;
  uint64_t v21 = v0[10];
  v22.n128_u64[0] = v19;
  return PeopleSuggesterMetricsWorker.doWork(context:durationThreshold:)(v21, v22);
}

uint64_t sub_1000046FC(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 232) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_100004968;
  }
  else
  {
    *(unsigned char *)(v4 + 240) = a1 & 1;
    uint64_t v5 = sub_100004828;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100004828()
{
  uint64_t v1 = v0[16];
  sub_100006E80();
  id v2 = objc_allocWithZone((Class)sub_100006E40());
  uint64_t v3 = (void (*)(uint64_t, uint64_t))v0[27];
  uint64_t v4 = v0[24];
  uint64_t v5 = v0[21];
  uint64_t v6 = v0[17];
  uint64_t v7 = v0[15];
  uint64_t v8 = sub_100006E30();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v6, v7);
  v3(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v9 = (uint64_t (*)(uint64_t))v0[1];
  return v9(v8);
}

uint64_t sub_100004968()
{
  v0[6] = v0[29];
  swift_errorRetain();
  sub_100005648(&qword_10000C108);
  if (swift_dynamicCast())
  {
    uint64_t v24 = v0[24];
    uint64_t v1 = v0[21];
    uint64_t v3 = v0[16];
    uint64_t v2 = v0[17];
    uint64_t v4 = v0[15];
    uint64_t v25 = v0[14];
    uint64_t v26 = (void (*)(uint64_t, uint64_t))v0[27];
    uint64_t v6 = v0[12];
    uint64_t v5 = v0[13];
    swift_errorRelease();
    id v7 = objc_allocWithZone((Class)sub_100006E40());
    uint64_t v8 = sub_100006E30();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    v26(v24, v1);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v25, v6);
    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRetain();
    swift_errorRetain();
    id v9 = sub_100006ED0();
    os_log_type_t v10 = sub_100006F50();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 138412290;
      swift_errorRetain();
      uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
      v0[7] = v13;
      sub_100006F60();
      *uint64_t v12 = v13;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unexpected error throws: %@", v11, 0xCu);
      sub_100005648(&qword_10000C110);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v14 = v0[16];
    sub_100006E80();
    id v15 = objc_allocWithZone((Class)sub_100006E40());
    uint64_t v16 = (void (**)(uint64_t, uint64_t))(v14 + 8);
    unint64_t v17 = (void (*)(uint64_t, uint64_t))v0[27];
    uint64_t v18 = v0[24];
    uint64_t v19 = v0[21];
    uint64_t v20 = v0[17];
    uint64_t v21 = v0[15];
    uint64_t v8 = sub_100006E30();
    (*v16)(v20, v21);
    v17(v18, v19);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  __n128 v22 = (uint64_t (*)(uint64_t))v0[1];
  return v22(v8);
}

uint64_t sub_100004CE8()
{
  return _swift_task_switch(sub_100004D04, 0, 0);
}

uint64_t sub_100004D04()
{
  objc_allocWithZone((Class)sub_100006E40());
  uint64_t v1 = sub_100006E30();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_100004D78(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100004E0C;
  return sub_100003EB8(a1);
}

uint64_t sub_100004E0C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100004F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *id v15 = v7;
  v15[1] = sub_100004FEC;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100004FEC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000050E0(uint64_t a1)
{
  uint64_t v2 = sub_100005C94(&qword_10000C0C0);

  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100005148()
{
  return sub_100006E70();
}

unint64_t sub_1000051A4(char a1, double a2)
{
  uint64_t v4 = sub_1000070A0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = &type metadata for PeopleSuggesterMetricsLighthouseConfig;
  LOBYTE(v14) = a1;
  unint64_t v15 = *(void *)&a2;
  sub_100007080();
  sub_100007090();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v8 = sub_100005358();
  swift_release();
  unint64_t v14 = 0xD000000000000027;
  unint64_t v15 = 0x8000000100007890;
  uint64_t v13 = v8;
  sub_100005648(&qword_10000C0C8);
  sub_1000069B0(&qword_10000C0D0, &qword_10000C0C8);
  uint64_t v9 = sub_100006F00();
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = v9;
  v17._object = v11;
  sub_100006F10(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 41;
  v18._object = (void *)0xE100000000000000;
  sub_100006F10(v18);
  return v14;
}

char *sub_100005358()
{
  swift_retain();
  sub_100006FA0();
  swift_release();
  sub_100006FE0();
  if (*((void *)&v9 + 1))
  {
    uint64_t v0 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      v6[0] = v7;
      v6[1] = v8;
      v6[2] = v9;
      v1._object = (void *)*((void *)&v7 + 1);
      if (*((void *)&v7 + 1))
      {
        v1._countAndFlagsBits = *(void *)&v6[0];
        sub_100006F10(v1);
        v10._countAndFlagsBits = 8250;
        v10._object = (void *)0xE200000000000000;
        sub_100006F10(v10);
        sub_100006FB0();
        sub_100006954((uint64_t)v6, &qword_10000C0D8);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v0 = sub_100005D20(0, *((void *)v0 + 2) + 1, 1, v0);
        }
        unint64_t v3 = *((void *)v0 + 2);
        unint64_t v2 = *((void *)v0 + 3);
        if (v3 >= v2 >> 1) {
          uint64_t v0 = sub_100005D20((char *)(v2 > 1), v3 + 1, 1, v0);
        }
        *((void *)v0 + 2) = v3 + 1;
        uint64_t v4 = &v0[16 * v3];
        *((void *)v4 + 4) = 0;
        *((void *)v4 + 5) = 0xE000000000000000;
      }
      else
      {
        sub_100006954((uint64_t)v6, &qword_10000C0D8);
      }
      sub_100006FE0();
    }
    while (*((void *)&v9 + 1));
  }
  else
  {
    uint64_t v0 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_release();
  return v0;
}

unint64_t sub_100005504()
{
  return sub_1000051A4(*(unsigned char *)v0, *(double *)(v0 + 8));
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for PeopleSuggesterMetricsLighthouse()
{
  uint64_t result = qword_10000C138;
  if (!qword_10000C138) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000055D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005648(&qword_10000C008);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_100005648(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000568C(uint64_t a1)
{
  uint64_t v2 = sub_100005648(&qword_10000C008);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_1000056F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005648(&qword_10000C008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000575C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005648(&qword_10000C008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000057C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005648(&qword_10000C008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000582C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005648(&qword_10000C008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100005894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000058A8);
}

uint64_t sub_1000058A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005648(&qword_10000C008);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100005918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000592C);
}

uint64_t sub_10000592C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005648(&qword_10000C008);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_1000059A0()
{
  sub_100005A2C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100005A2C()
{
  if (!qword_10000C068)
  {
    sub_100005A94();
    sub_100005AE8();
    unint64_t v0 = sub_100006E90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C068);
    }
  }
}

unint64_t sub_100005A94()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_100005AE8()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for PeopleSuggesterMetricsLighthouseConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterMetricsLighthouseConfig(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PeopleSuggesterMetricsLighthouseConfig(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for PeopleSuggesterMetricsLighthouseConfig()
{
  return &type metadata for PeopleSuggesterMetricsLighthouseConfig;
}

uint64_t sub_100005BF0()
{
  return sub_100005C94(&qword_10000C000);
}

uint64_t sub_100005C24()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100005C94(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PeopleSuggesterMetricsLighthouse();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005CD8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

char *sub_100005D20(char *result, int64_t a2, char a3, char *a4)
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
      sub_100005648(&qword_10000C0E0);
      Swift::String v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      Swift::String v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_100006728(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100005E30(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005F04(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006AA0((uint64_t)v12, *a3);
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
      sub_100006AA0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006A50((uint64_t)v12);
  return v7;
}

uint64_t sub_100005F04(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006F70();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000060C0(a5, a6);
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
  uint64_t v8 = sub_100006F90();
  if (!v8)
  {
    sub_100006FC0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006FD0();
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

uint64_t sub_1000060C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006158(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006338(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006338(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006158(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000062D0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006F80();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006FC0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006F20();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006FD0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006FC0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000062D0(uint64_t a1, uint64_t a2)
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
  sub_100005648((uint64_t *)&unk_10000C120);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006338(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005648((uint64_t *)&unk_10000C120);
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
  uint64_t result = sub_100006FD0();
  __break(1u);
  return result;
}

uint64_t sub_100006488(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726150776F6C6C61 && a2 == 0xEC0000006C616974;
  if (v3 || (sub_100007040() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100007B80)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100007040();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

double sub_100006580(void *a1)
{
  uint64_t v4 = sub_100005648(&qword_10000C0E8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006820(a1, a1[3]);
  sub_100006864();
  sub_1000070B0();
  if (!v1)
  {
    char v12 = 0;
    sub_100006FF0();
    char v11 = 1;
    sub_100007000();
    double v2 = v8;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_100006A50((uint64_t)a1);
  return v2;
}

uint64_t sub_100006728(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_100006FD0();
  __break(1u);
  return result;
}

void *sub_100006820(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100006864()
{
  unint64_t result = qword_10000C3D0[0];
  if (!qword_10000C3D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C3D0);
  }
  return result;
}

uint64_t sub_1000068B8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000068F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PeopleSuggesterMetricsLighthouse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006954(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005648(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000069B0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005CD8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000069F4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PeopleSuggesterMetricsLighthouse();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006A50(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100006AFC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for PeopleSuggesterMetricsLighthouseConfig.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterMetricsLighthouseConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PeopleSuggesterMetricsLighthouseConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100006CC8);
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

uint64_t sub_100006CF0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006CFC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggesterMetricsLighthouseConfig.CodingKeys()
{
  return &type metadata for PeopleSuggesterMetricsLighthouseConfig.CodingKeys;
}

unint64_t sub_100006D1C()
{
  unint64_t result = qword_10000C4E0[0];
  if (!qword_10000C4E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C4E0);
  }
  return result;
}

unint64_t sub_100006D74()
{
  unint64_t result = qword_10000C5F0;
  if (!qword_10000C5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C5F0);
  }
  return result;
}

unint64_t sub_100006DCC()
{
  unint64_t result = qword_10000C5F8[0];
  if (!qword_10000C5F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C5F8);
  }
  return result;
}

uint64_t sub_100006E20()
{
  return static AppExtension.main()();
}

uint64_t sub_100006E30()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100006E40()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100006E70()
{
  return MLHostParameters.init(taskParameters:)();
}

uint64_t sub_100006E80()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_100006E90()
{
  return type metadata accessor for MLHostParameters();
}

uint64_t sub_100006EB0()
{
  return PeopleSuggesterMetricsWorker.init()();
}

uint64_t sub_100006EC0()
{
  return type metadata accessor for PeopleSuggesterMetricsWorker();
}

uint64_t sub_100006ED0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006EE0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006EF0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006F00()
{
  return BidirectionalCollection<>.joined(separator:)();
}

void sub_100006F10(Swift::String a1)
{
}

Swift::Int sub_100006F20()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006F30()
{
  return type metadata accessor for CancellationError();
}

uint64_t sub_100006F40()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100006F50()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006F60()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006F70()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006F80()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006F90()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006FA0()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t sub_100006FB0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100006FC0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006FD0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006FE0()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

uint64_t sub_100006FF0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100007000()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100007010()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100007020()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100007030()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100007040()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100007050()
{
  return Hasher.init(_seed:)();
}

void sub_100007060(Swift::UInt a1)
{
}

Swift::Int sub_100007070()
{
  return Hasher._finalize()();
}

uint64_t sub_100007080()
{
  return Mirror.init(reflecting:)();
}

uint64_t sub_100007090()
{
  return Mirror.children.getter();
}

uint64_t sub_1000070A0()
{
  return type metadata accessor for Mirror();
}

uint64_t sub_1000070B0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1000070C0()
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}