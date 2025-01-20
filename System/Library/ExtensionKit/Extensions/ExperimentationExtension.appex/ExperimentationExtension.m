uint64_t sub_100002E0C(char a1)
{
  Swift::String v2;
  void *v3;
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;

  sub_100006D20(71);
  v5._countAndFlagsBits = 0xD00000000000002DLL;
  v5._object = (void *)0x8000000100007730;
  sub_100006CA0(v5);
  if (a1) {
    v2._countAndFlagsBits = 1702195828;
  }
  else {
    v2._countAndFlagsBits = 0x65736C6166;
  }
  if (a1) {
    v3 = (void *)0xE400000000000000;
  }
  else {
    v3 = (void *)0xE500000000000000;
  }
  v2._object = v3;
  sub_100006CA0(v2);
  swift_bridgeObjectRelease();
  v6._object = (void *)0x8000000100007760;
  v6._countAndFlagsBits = 0xD000000000000015;
  sub_100006CA0(v6);
  sub_100006CC0();
  v7._countAndFlagsBits = 41;
  v7._object = (void *)0xE100000000000000;
  sub_100006CA0(v7);
  return 0;
}

uint64_t sub_100002F0C(char a1)
{
  if (a1) {
    return 0xD000000000000011;
  }
  else {
    return 0x726150776F6C6C61;
  }
}

BOOL sub_100002F50(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100002F68()
{
  Swift::UInt v1 = *v0;
  sub_100006E20();
  sub_100006E30(v1);
  return sub_100006E40();
}

void sub_100002FB0()
{
  sub_100006E30(*v0);
}

Swift::Int sub_100002FDC()
{
  Swift::UInt v1 = *v0;
  sub_100006E20();
  sub_100006E30(v1);
  return sub_100006E40();
}

uint64_t sub_100003020()
{
  return sub_100002F0C(*v0);
}

uint64_t sub_100003028@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100005FE0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100003050()
{
  return 0;
}

void sub_10000305C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100003068(uint64_t a1)
{
  unint64_t v2 = sub_1000062C4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000030A4(uint64_t a1)
{
  unint64_t v2 = sub_1000062C4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000030E0(void *a1)
{
  uint64_t v3 = sub_10000500C(&qword_10000C0F0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006280(a1, a1[3]);
  sub_1000062C4();
  sub_100006E60();
  char v10 = 0;
  sub_100006DA0();
  if (!v1)
  {
    char v9 = 1;
    sub_100006DB0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_100003248(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = sub_1000060D8(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4 & 1;
    *(double *)(a2 + 8) = v5;
  }
}

uint64_t sub_10000327C(void *a1)
{
  return sub_1000030E0(a1);
}

uint64_t sub_10000329C()
{
  return sub_100002E0C(*v0);
}

BOOL ExperimentMetricsExtensionError.init(rawValue:)(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100008618;
  v6._object = a2;
  Swift::Int v4 = sub_100006D70(v3, v6);
  swift_bridgeObjectRelease();
  return v4 != 0;
}

unint64_t ExperimentMetricsExtensionError.rawValue.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_10000330C()
{
  return 1;
}

Swift::Int sub_100003314()
{
  return sub_100006E40();
}

uint64_t sub_10000336C()
{
  return sub_100006C90();
}

Swift::Int sub_100003388()
{
  return sub_100006E40();
}

uint64_t sub_1000033DC@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  Swift::OpaquePointer v3 = (void *)a1[1];
  v4._rawValue = &off_100008650;
  v7._object = v3;
  Swift::Int v5 = sub_100006D70(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_100003430(void *a1@<X8>)
{
  *a1 = 0xD00000000000001CLL;
  a1[1] = 0x80000001000074A0;
}

uint64_t sub_100003460(uint64_t a1)
{
  v2[19] = a1;
  v2[20] = v1;
  uint64_t v3 = sub_100006B60();
  v2[21] = v3;
  v2[22] = *(void *)(v3 - 8);
  v2[23] = swift_task_alloc();
  v2[24] = type metadata accessor for ExperimentationExtension();
  v2[25] = swift_task_alloc();
  sub_10000500C(&qword_10000C100);
  v2[26] = swift_task_alloc();
  uint64_t v4 = sub_10000500C(&qword_10000C028);
  v2[27] = v4;
  v2[28] = *(void *)(v4 - 8);
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  uint64_t v5 = sub_100006C80();
  v2[31] = v5;
  v2[32] = *(void *)(v5 - 8);
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  return _swift_task_switch(sub_100003674, 0, 0);
}

uint64_t sub_100003674()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = v0[36];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[32];
  uint64_t v5 = v0[20];
  Swift::String v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[37] = v6;
  v0[38] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v2, v5, v3);
  id v7 = v1;
  uint64_t v8 = sub_100006C60();
  os_log_type_t v9 = sub_100006CD0();
  if (os_log_type_enabled(v8, v9))
  {
    char v10 = (void *)v0[19];
    v11 = (uint8_t *)swift_slowAlloc();
    v26 = (void *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412290;
    v0[18] = v10;
    id v12 = v10;
    sub_100006D00();
    void *v26 = v10;

    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Context: %@", v11, 0xCu);
    sub_10000500C(&qword_10000C110);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v13 = (void *)v0[19];
  }
  uint64_t v14 = v0[36];
  uint64_t v15 = v0[31];
  uint64_t v16 = v0[32];
  v17 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  v0[39] = v17;
  v0[40] = (v16 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v17(v14, v15);
  v18 = (void *)swift_task_alloc();
  v0[41] = v18;
  uint64_t v19 = sub_100005944(&qword_10000C0E0);
  unint64_t v20 = sub_100005748();
  unint64_t v21 = sub_10000579C();
  void *v18 = v0;
  v18[1] = sub_1000038DC;
  uint64_t v22 = v0[26];
  uint64_t v23 = v0[24];
  uint64_t v24 = v0[19];
  return MLHostExtension.loadConfig<A>(context:)(v22, v24, v23, &type metadata for ExperimentationExtensionConfig, v19, v20, v21);
}

uint64_t sub_1000038DC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000039D8, 0, 0);
}

uint64_t sub_1000039D8()
{
  uint64_t v37 = v0;
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 208);
  sub_100006318(*(void *)(v0 + 160), *(void *)(v0 + 200));
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = *(void *)(v0 + 216);
  uint64_t v7 = *(void *)(v0 + 224);
  uint64_t v9 = *(void *)(v0 + 200);
  uint64_t v8 = *(void *)(v0 + 208);
  if (v4 == 1)
  {
    (*(void (**)(void, uint64_t, void))(v7 + 16))(*(void *)(v0 + 240), v9 + *(int *)(*(void *)(v0 + 192) + 20), *(void *)(v0 + 216));
    sub_10000637C(v9);
    sub_10000642C(v8, &qword_10000C100);
  }
  else
  {
    sub_10000637C(*(void *)(v0 + 200));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v5, v8, v6);
  }
  uint64_t v10 = *(void *)(v0 + 240);
  uint64_t v12 = *(void *)(v0 + 224);
  uint64_t v11 = *(void *)(v0 + 232);
  uint64_t v13 = *(void *)(v0 + 216);
  (*(void (**)(void, void, void))(v0 + 296))(*(void *)(v0 + 280), *(void *)(v0 + 160), *(void *)(v0 + 248));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v10, v13);
  uint64_t v14 = sub_100006C60();
  os_log_type_t v15 = sub_100006CD0();
  BOOL v16 = os_log_type_enabled(v14, v15);
  v17 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
  uint64_t v18 = *(void *)(v0 + 280);
  uint64_t v35 = *(void *)(v0 + 248);
  uint64_t v20 = *(void *)(v0 + 224);
  uint64_t v19 = *(void *)(v0 + 232);
  uint64_t v21 = *(void *)(v0 + 216);
  if (v16)
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136315138;
    sub_100006488();
    uint64_t v23 = sub_100006DC0();
    *(void *)(v0 + 136) = sub_100005988(v23, v24, &v36);
    sub_100006D00();
    swift_bridgeObjectRelease();
    v25 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v25(v19, v21);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Configuration: %s", v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v17(v18, v35);
  }
  else
  {
    v25 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v25(*(void *)(v0 + 232), *(void *)(v0 + 216));

    v17(v18, v35);
  }
  *(void *)(v0 + 336) = v25;
  sub_100006B50();
  uint64_t v26 = sub_100006BC0();
  *(void *)(v0 + 344) = v26;
  uint64_t v27 = *(void *)(v26 - 8);
  *(void *)(v0 + 352) = v27;
  *(void *)(v0 + 360) = *(void *)(v27 + 64);
  *(void *)(v0 + 368) = swift_task_alloc();
  uint64_t v28 = swift_task_alloc();
  *(void *)(v0 + 376) = v28;
  sub_100006B80();
  swift_allocObject();
  uint64_t v29 = sub_100006B70();
  *(void *)(v0 + 384) = v29;
  sub_100006C40();
  unint64_t v30 = *(void *)(v0 + 104);
  v31 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v31;
  void *v31 = v0;
  v31[1] = sub_100003DC4;
  uint64_t v32 = *(void *)(v0 + 152);
  v33.n128_u64[0] = v30;
  return ExperimentMetricsWorker.doWork(metricsExecutor:context:durationThreshold:)(v28, v29, v32, v33);
}

uint64_t sub_100003DC4()
{
  *(void *)(*(void *)v1 + 400) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000043B0;
  }
  else {
    uint64_t v2 = sub_100003EF4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100003EF4()
{
  uint64_t v1 = *(void *)(v0 + 368);
  uint64_t v2 = *(void *)(v0 + 352);
  uint64_t v3 = *(void *)(v0 + 344);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 32))(v1, *(void *)(v0 + 376), v3);
  swift_task_dealloc();
  uint64_t v4 = (void *)swift_task_alloc();
  (*(void (**)(void *, uint64_t, uint64_t))(v2 + 16))(v4, v1, v3);
  int v5 = (*(uint64_t (**)(void *, uint64_t))(v2 + 88))(v4, v3);
  if (&enum case for LighthouseRuntimeProcessorResult.error(_:)
    && v5 == enum case for LighthouseRuntimeProcessorResult.error(_:))
  {
    (*(void (**)(void *, void))(*(void *)(v0 + 352) + 96))(v4, *(void *)(v0 + 344));
    uint64_t v6 = *v4;
    if (*v4)
    {
      *(void *)(v0 + 112) = v6;
      swift_errorRetain();
      sub_10000500C(&qword_10000C118);
      sub_10000500C(&qword_10000C120);
      if (swift_dynamicCast())
      {
        uint64_t v7 = *(void *)(v0 + 80);
        sub_10000642C(v0 + 56, &qword_10000C128);
        if (v7)
        {
          uint64_t v8 = *(void *)(v0 + 352);
          uint64_t v32 = *(void *)(v0 + 240);
          v34 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
          uint64_t v30 = *(void *)(v0 + 368);
          uint64_t v31 = *(void *)(v0 + 216);
          uint64_t v9 = *(void *)(v0 + 176);
          uint64_t v28 = *(void *)(v0 + 344);
          uint64_t v29 = *(void *)(v0 + 184);
          uint64_t v10 = *(void *)(v0 + 168);
          *(void *)(v0 + 120) = v6;
          swift_errorRetain();
          swift_dynamicCast();
          id v11 = objc_allocWithZone((Class)sub_100006C00());
          uint64_t v36 = sub_100006BE0();
          swift_errorRelease();
          (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v30, v28);
          (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v29, v10);
          v34(v32, v31);
          swift_task_dealloc();
          goto LABEL_22;
        }
      }
      else
      {
        *(void *)(v0 + 88) = 0;
        *(_OWORD *)(v0 + 56) = 0u;
        *(_OWORD *)(v0 + 72) = 0u;
        sub_10000642C(v0 + 56, &qword_10000C128);
      }
    }
    uint64_t v12 = (void *)(v0 + 248);
    (*(void (**)(void, void, void))(v0 + 296))(*(void *)(v0 + 272), *(void *)(v0 + 160), *(void *)(v0 + 248));
    os_log_type_t v15 = sub_100006C60();
    os_log_type_t v16 = sub_100006CF0();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "task failed with unset error", v17, 2u);
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
    }
    uint64_t v13 = (void (**)(void *, void))(v0 + 312);
    uint64_t v14 = *(void **)(v0 + 272);
  }
  else
  {
    if (&enum case for LighthouseRuntimeProcessorResult.success(_:)
      && v5 == enum case for LighthouseRuntimeProcessorResult.success(_:)
      || &enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
      && v5 == enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
      || &enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:)
      && v5 == enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:))
    {
      goto LABEL_21;
    }
    uint64_t v12 = (void *)(v0 + 344);
    uint64_t v13 = (void (**)(void *, void))(*(void *)(v0 + 352) + 8);
    uint64_t v14 = v4;
  }
  (*v13)(v14, *v12);
LABEL_21:
  uint64_t v18 = *(void *)(v0 + 368);
  uint64_t v19 = *(void *)(v0 + 344);
  uint64_t v20 = *(void *)(v0 + 352);
  uint64_t v33 = *(void *)(v0 + 240);
  uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
  uint64_t v21 = *(void *)(v0 + 216);
  uint64_t v22 = *(void *)(v0 + 176);
  uint64_t v23 = *(void *)(v0 + 184);
  uint64_t v24 = *(void *)(v0 + 168);
  swift_task_dealloc();
  id v25 = objc_allocWithZone((Class)sub_100006C00());
  uint64_t v36 = sub_100006BF0();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v24);
  v35(v33, v21);
LABEL_22:
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
  uint64_t v26 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v26(v36);
}

uint64_t sub_1000043B0()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[37];
  uint64_t v2 = v0[33];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[20];
  swift_task_dealloc();
  v1(v2, v4, v3);
  swift_errorRetain();
  swift_errorRetain();
  int v5 = sub_100006C60();
  os_log_type_t v6 = sub_100006CF0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[16] = v9;
    sub_100006D00();
    *uint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "unexpected error throws: %@", v7, 0xCu);
    sub_10000500C(&qword_10000C110);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[39];
  uint64_t v11 = v0[33];
  uint64_t v12 = v0[31];
  uint64_t v20 = v0[30];
  uint64_t v21 = (void (*)(uint64_t, uint64_t))v0[42];
  uint64_t v19 = v0[27];
  uint64_t v13 = v0[22];
  uint64_t v14 = v0[23];
  uint64_t v15 = v0[21];

  v10(v11, v12);
  sub_1000063D8();
  id v16 = objc_allocWithZone((Class)sub_100006C00());
  uint64_t v22 = sub_100006BE0();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  v21(v20, v19);
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
  v17 = (uint64_t (*)(uint64_t))v0[1];
  return v17(v22);
}

uint64_t sub_10000468C()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_10000C140 + dword_10000C140);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100006B3C;
  return v3();
}

uint64_t sub_10000472C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000047C0;
  return sub_100003460(a1);
}

uint64_t sub_1000047C0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000048BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_1000049A0;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_1000049A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004A94(uint64_t a1)
{
  uint64_t v2 = sub_100005944(&qword_10000C0E0);

  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100004AFC()
{
  return sub_100006C30();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for ExperimentationExtension()
{
  uint64_t result = qword_10000C3D0;
  if (!qword_10000C3D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_100004C6C()
{
  unint64_t result = qword_10000C008;
  if (!qword_10000C008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C008);
  }
  return result;
}

unint64_t sub_100004CC4()
{
  unint64_t result = qword_10000C010;
  if (!qword_10000C010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C010);
  }
  return result;
}

unint64_t sub_100004D1C()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

unint64_t sub_100004D74()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ExperimentMetricsExtensionError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ExperimentMetricsExtensionError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100004EBCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100004EE4()
{
  return 0;
}

ValueMetadata *type metadata accessor for ExperimentMetricsExtensionError()
{
  return &type metadata for ExperimentMetricsExtensionError;
}

uint64_t *sub_100004F00(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100006C80();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_10000500C(&qword_10000C028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_10000500C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005050(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006C80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_10000500C(&qword_10000C028);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_1000050FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10000500C(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000051B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10000500C(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10000500C(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006C80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_10000500C(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000053EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005400);
}

uint64_t sub_100005400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006C80();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_10000500C(&qword_10000C028);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_1000054FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005510);
}

uint64_t sub_100005510(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100006C80();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_10000500C(&qword_10000C028);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_100005618()
{
  sub_100006C80();
  if (v0 <= 0x3F)
  {
    sub_1000056E0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1000056E0()
{
  if (!qword_10000C088)
  {
    sub_100005748();
    sub_10000579C();
    unint64_t v0 = sub_100006C50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C088);
    }
  }
}

unint64_t sub_100005748()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_10000579C()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for ExperimentationExtensionConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ExperimentationExtensionConfig(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ExperimentationExtensionConfig(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for ExperimentationExtensionConfig()
{
  return &type metadata for ExperimentationExtensionConfig;
}

uint64_t sub_1000058A0()
{
  return sub_100005944(&qword_10000C000);
}

uint64_t sub_1000058D4()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100005944(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ExperimentationExtension();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005988(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005A5C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000657C((uint64_t)v12, *a3);
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
      sub_10000657C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000652C((uint64_t)v12);
  return v7;
}

uint64_t sub_100005A5C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006D10();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005C18(a5, a6);
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
  uint64_t v8 = sub_100006D40();
  if (!v8)
  {
    sub_100006D50();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006D60();
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

uint64_t sub_100005C18(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005CB0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005E90(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005E90(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005CB0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005E28(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006D30();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006D50();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006CB0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006D60();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006D50();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100005E28(uint64_t a1, uint64_t a2)
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
  sub_10000500C(&qword_10000C138);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005E90(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000500C(&qword_10000C138);
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
  uint64_t result = sub_100006D60();
  __break(1u);
  return result;
}

uint64_t sub_100005FE0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726150776F6C6C61 && a2 == 0xEC0000006C616974;
  if (v3 || (sub_100006DD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100007780)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100006DD0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

double sub_1000060D8(void *a1)
{
  uint64_t v4 = sub_10000500C(&qword_10000C0E8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006280(a1, a1[3]);
  sub_1000062C4();
  sub_100006E50();
  if (!v1)
  {
    char v12 = 0;
    sub_100006D80();
    char v11 = 1;
    sub_100006D90();
    double v2 = v8;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_10000652C((uint64_t)a1);
  return v2;
}

void *sub_100006280(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000062C4()
{
  unint64_t result = qword_10000C660[0];
  if (!qword_10000C660[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C660);
  }
  return result;
}

uint64_t sub_100006318(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ExperimentationExtension();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000637C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ExperimentationExtension();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000063D8()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

uint64_t sub_10000642C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000500C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100006488()
{
  unint64_t result = qword_10000C130;
  if (!qword_10000C130)
  {
    sub_1000064E4(&qword_10000C028);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C130);
  }
  return result;
}

uint64_t sub_1000064E4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000652C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000657C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000065DC()
{
  v1[2] = v0;
  uint64_t v2 = sub_100006C80();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v1[6] = swift_task_alloc();
  return _swift_task_switch(sub_1000066AC, 0, 0);
}

uint64_t sub_1000066AC()
{
  if (!sub_100006B90())
  {
    uint64_t v1 = v0 + 6;
    (*(void (**)(void, void, void))(v0[4] + 16))(v0[6], v0[2], v0[3]);
    uint64_t v2 = sub_100006C60();
    os_log_type_t v3 = sub_100006CE0();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = "Siri on device metrics disabled. Not continuing.";
      goto LABEL_7;
    }
LABEL_8:
    uint64_t v5 = *v1;
    goto LABEL_9;
  }
  sub_100006BB0();
  if (sub_100006BA0()) {
    goto LABEL_10;
  }
  uint64_t v1 = v0 + 5;
  (*(void (**)(void, void, void))(v0[4] + 16))(v0[5], v0[2], v0[3]);
  uint64_t v2 = sub_100006C60();
  os_log_type_t v3 = sub_100006CE0();
  if (!os_log_type_enabled(v2, v3)) {
    goto LABEL_8;
  }
  uint64_t v4 = "Neither assistant nor dictation enabled. Not allowed to process.";
LABEL_7:
  uint64_t v5 = *v1;
  uint64_t v6 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v6 = 0;
  _os_log_impl((void *)&_mh_execute_header, v2, v3, v4, v6, 2u);
  swift_slowDealloc();
LABEL_9:
  uint64_t v7 = v0[3];
  uint64_t v8 = v0[4];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
LABEL_10:
  id v9 = objc_allocWithZone((Class)sub_100006C00());
  uint64_t v10 = sub_100006BF0();
  swift_task_dealloc();
  swift_task_dealloc();
  char v11 = (uint64_t (*)(uint64_t))v0[1];
  return v11(v10);
}

unsigned char *initializeBufferWithCopyOfBuffer for ExperimentationExtensionConfig.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ExperimentationExtensionConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ExperimentationExtensionConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000069E8);
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

uint64_t sub_100006A10(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006A18(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ExperimentationExtensionConfig.CodingKeys()
{
  return &type metadata for ExperimentationExtensionConfig.CodingKeys;
}

unint64_t sub_100006A38()
{
  unint64_t result = qword_10000C770[0];
  if (!qword_10000C770[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C770);
  }
  return result;
}

unint64_t sub_100006A90()
{
  unint64_t result = qword_10000C880;
  if (!qword_10000C880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C880);
  }
  return result;
}

unint64_t sub_100006AE8()
{
  unint64_t result = qword_10000C888[0];
  if (!qword_10000C888[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C888);
  }
  return result;
}

uint64_t sub_100006B50()
{
  return ExperimentMetricsWorker.init()();
}

uint64_t sub_100006B60()
{
  return type metadata accessor for ExperimentMetricsWorker();
}

uint64_t sub_100006B70()
{
  return ExperimentMetricsExecutor.init()();
}

uint64_t sub_100006B80()
{
  return type metadata accessor for ExperimentMetricsExecutor();
}

BOOL sub_100006B90()
{
  return isOnDeviceSiriMetricsEnabled()();
}

uint64_t sub_100006BA0()
{
  return static ExtensionsUtils.isAssistantOrDictationEnabled()();
}

uint64_t sub_100006BB0()
{
  return type metadata accessor for ExtensionsUtils();
}

uint64_t sub_100006BC0()
{
  return type metadata accessor for LighthouseRuntimeProcessorResult();
}

uint64_t sub_100006BD0()
{
  return static AppExtension.main()();
}

uint64_t sub_100006BE0()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_100006BF0()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100006C00()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100006C30()
{
  return MLHostParameters.init(taskParameters:)();
}

uint64_t sub_100006C40()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_100006C50()
{
  return type metadata accessor for MLHostParameters();
}

uint64_t sub_100006C60()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006C70()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006C80()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006C90()
{
  return String.hash(into:)();
}

void sub_100006CA0(Swift::String a1)
{
}

Swift::Int sub_100006CB0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006CC0()
{
  return Double.write<A>(to:)();
}

uint64_t sub_100006CD0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100006CE0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100006CF0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006D00()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006D10()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

void sub_100006D20(Swift::Int a1)
{
}

uint64_t sub_100006D30()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006D40()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006D50()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006D60()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100006D70(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006D80()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100006D90()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100006DA0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100006DB0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100006DC0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100006DD0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006DE0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100006DF0()
{
  return Error._code.getter();
}

uint64_t sub_100006E00()
{
  return Error._domain.getter();
}

uint64_t sub_100006E10()
{
  return Error._userInfo.getter();
}

uint64_t sub_100006E20()
{
  return Hasher.init(_seed:)();
}

void sub_100006E30(Swift::UInt a1)
{
}

Swift::Int sub_100006E40()
{
  return Hasher._finalize()();
}

uint64_t sub_100006E50()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100006E60()
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