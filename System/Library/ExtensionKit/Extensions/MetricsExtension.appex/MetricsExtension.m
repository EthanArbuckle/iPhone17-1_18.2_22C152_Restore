unint64_t sub_10000284C(char a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  ValueMetadata *v16;
  Swift::String v17;
  Swift::String v18;

  v4 = sub_100006DB0();
  v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = &type metadata for MetricsExtensionConfig;
  LOBYTE(v14) = a1;
  v15 = *(void *)&a2;
  sub_100006D90();
  sub_100006DA0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v8 = sub_100002A00();
  swift_release();
  v14 = 0xD000000000000017;
  v15 = 0x80000001000076B0;
  v13 = v8;
  sub_100004CC4(&qword_10000C148);
  sub_100006700(&qword_10000C150, &qword_10000C148);
  v9 = sub_100006BB0();
  v11 = v10;
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = v9;
  v17._object = v11;
  sub_100006BD0(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 41;
  v18._object = (void *)0xE100000000000000;
  sub_100006BD0(v18);
  return v14;
}

char *sub_100002A00()
{
  swift_retain();
  sub_100006C60();
  swift_release();
  sub_100006CA0();
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
        sub_100006BD0(v1);
        v10._countAndFlagsBits = 8250;
        v10._object = (void *)0xE200000000000000;
        sub_100006BD0(v10);
        sub_100006C70();
        sub_100006744((uint64_t)v6, &qword_10000C158);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v0 = sub_100005640(0, *((void *)v0 + 2) + 1, 1, v0);
        }
        unint64_t v3 = *((void *)v0 + 2);
        unint64_t v2 = *((void *)v0 + 3);
        if (v3 >= v2 >> 1) {
          v0 = sub_100005640((char *)(v2 > 1), v3 + 1, 1, v0);
        }
        *((void *)v0 + 2) = v3 + 1;
        v4 = &v0[16 * v3];
        *((void *)v4 + 4) = 0;
        *((void *)v4 + 5) = 0xE000000000000000;
      }
      else
      {
        sub_100006744((uint64_t)v6, &qword_10000C158);
      }
      sub_100006CA0();
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

uint64_t sub_100002BAC(char a1)
{
  if (a1) {
    return 0xD000000000000011;
  }
  else {
    return 0x726150776F6C6C61;
  }
}

BOOL sub_100002BF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100002C08()
{
  Swift::UInt v1 = *v0;
  sub_100006D60();
  sub_100006D70(v1);
  return sub_100006D80();
}

void sub_100002C50()
{
  sub_100006D70(*v0);
}

Swift::Int sub_100002C7C()
{
  Swift::UInt v1 = *v0;
  sub_100006D60();
  sub_100006D70(v1);
  return sub_100006D80();
}

uint64_t sub_100002CC0()
{
  return sub_100002BAC(*v0);
}

uint64_t sub_100002CC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100005E9C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100002CF0()
{
  return 0;
}

void sub_100002CFC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100002D08(uint64_t a1)
{
  unint64_t v2 = sub_100006180();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100002D44(uint64_t a1)
{
  unint64_t v2 = sub_100006180();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100002D80(void *a1)
{
  uint64_t v3 = sub_100004CC4(&qword_10000C0F0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000613C(a1, a1[3]);
  sub_100006180();
  sub_100006DD0();
  char v10 = 0;
  sub_100006CE0();
  if (!v1)
  {
    char v9 = 1;
    sub_100006CF0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_100002EE8(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = sub_100005F94(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4 & 1;
    *(double *)(a2 + 8) = v5;
  }
}

uint64_t sub_100002F1C(void *a1)
{
  return sub_100002D80(a1);
}

unint64_t sub_100002F3C()
{
  return sub_10000284C(*(unsigned char *)v0, *(double *)(v0 + 8));
}

BOOL SiriMetricsExtensionError.init(rawValue:)(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100008650;
  v6._object = a2;
  Swift::Int v4 = sub_100006CB0(v3, v6);
  swift_bridgeObjectRelease();
  return v4 != 0;
}

unint64_t SiriMetricsExtensionError.rawValue.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_100002FAC()
{
  return 1;
}

Swift::Int sub_100002FB4()
{
  return sub_100006D80();
}

uint64_t sub_10000300C()
{
  return sub_100006BC0();
}

Swift::Int sub_100003028()
{
  return sub_100006D80();
}

uint64_t sub_10000307C@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  Swift::OpaquePointer v3 = (void *)a1[1];
  v4._rawValue = &off_100008688;
  v7._object = v3;
  Swift::Int v5 = sub_100006CB0(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_1000030D0(void *a1@<X8>)
{
  *a1 = 0xD00000000000001CLL;
  a1[1] = 0x8000000100007420;
}

uint64_t sub_100003100(uint64_t a1)
{
  v2[23] = a1;
  v2[24] = v1;
  uint64_t v3 = sub_100006A90();
  v2[25] = v3;
  v2[26] = *(void *)(v3 - 8);
  v2[27] = swift_task_alloc();
  v2[28] = type metadata accessor for MetricsExtension();
  v2[29] = swift_task_alloc();
  sub_100004CC4(&qword_10000C100);
  v2[30] = swift_task_alloc();
  uint64_t v4 = sub_100004CC4(&qword_10000C028);
  v2[31] = v4;
  v2[32] = *(void *)(v4 - 8);
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  uint64_t v5 = sub_100006BA0();
  v2[35] = v5;
  v2[36] = *(void *)(v5 - 8);
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  return _swift_task_switch(sub_100003314, 0, 0);
}

uint64_t sub_100003314()
{
  uint64_t v1 = (void *)v0[23];
  uint64_t v2 = v0[40];
  uint64_t v3 = v0[35];
  uint64_t v4 = v0[36];
  uint64_t v5 = v0[24];
  Swift::String v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[41] = v6;
  v0[42] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v2, v5, v3);
  id v7 = v1;
  uint64_t v8 = sub_100006B80();
  os_log_type_t v9 = sub_100006BF0();
  if (os_log_type_enabled(v8, v9))
  {
    char v10 = (void *)v0[23];
    v11 = (uint8_t *)swift_slowAlloc();
    v26 = (void *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412290;
    v0[22] = v10;
    id v12 = v10;
    sub_100006C20();
    void *v26 = v10;

    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Context: %@", v11, 0xCu);
    sub_100004CC4(&qword_10000C110);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v13 = (void *)v0[23];
  }
  uint64_t v14 = v0[40];
  uint64_t v15 = v0[35];
  uint64_t v16 = v0[36];
  v17 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  v0[43] = v17;
  v0[44] = (v16 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v17(v14, v15);
  v18 = (void *)swift_task_alloc();
  v0[45] = v18;
  uint64_t v19 = sub_1000055FC(&qword_10000C0E0);
  unint64_t v20 = sub_100005400();
  unint64_t v21 = sub_100005454();
  void *v18 = v0;
  v18[1] = sub_10000357C;
  uint64_t v22 = v0[30];
  uint64_t v23 = v0[28];
  uint64_t v24 = v0[23];
  return MLHostExtension.loadConfig<A>(context:)(v22, v24, v23, &type metadata for MetricsExtensionConfig, v19, v20, v21);
}

uint64_t sub_10000357C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100003678, 0, 0);
}

uint64_t sub_100003678()
{
  uint64_t v37 = v0;
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 240);
  sub_1000061D4(*(void *)(v0 + 192), *(void *)(v0 + 232));
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = *(void *)(v0 + 272);
  uint64_t v6 = *(void *)(v0 + 248);
  uint64_t v7 = *(void *)(v0 + 256);
  uint64_t v9 = *(void *)(v0 + 232);
  uint64_t v8 = *(void *)(v0 + 240);
  if (v4 == 1)
  {
    (*(void (**)(void, uint64_t, void))(v7 + 16))(*(void *)(v0 + 272), v9 + *(int *)(*(void *)(v0 + 224) + 20), *(void *)(v0 + 248));
    sub_100006238(v9);
    sub_100006744(v8, &qword_10000C100);
  }
  else
  {
    sub_100006238(*(void *)(v0 + 232));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v5, v8, v6);
  }
  uint64_t v10 = *(void *)(v0 + 272);
  uint64_t v12 = *(void *)(v0 + 256);
  uint64_t v11 = *(void *)(v0 + 264);
  uint64_t v13 = *(void *)(v0 + 248);
  (*(void (**)(void, void, void))(v0 + 328))(*(void *)(v0 + 312), *(void *)(v0 + 192), *(void *)(v0 + 280));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v10, v13);
  uint64_t v14 = sub_100006B80();
  os_log_type_t v15 = sub_100006BF0();
  BOOL v16 = os_log_type_enabled(v14, v15);
  v17 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
  uint64_t v18 = *(void *)(v0 + 312);
  uint64_t v35 = *(void *)(v0 + 280);
  uint64_t v20 = *(void *)(v0 + 256);
  uint64_t v19 = *(void *)(v0 + 264);
  uint64_t v21 = *(void *)(v0 + 248);
  if (v16)
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136315138;
    sub_100006700(&qword_10000C130, &qword_10000C028);
    uint64_t v23 = sub_100006D00();
    *(void *)(v0 + 168) = sub_100005750(v23, v24, &v36);
    sub_100006C20();
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
    v25(*(void *)(v0 + 264), *(void *)(v0 + 248));

    v17(v18, v35);
  }
  *(void *)(v0 + 368) = v25;
  sub_100006A80();
  uint64_t v26 = sub_100006AE0();
  *(void *)(v0 + 376) = v26;
  uint64_t v27 = *(void *)(v26 - 8);
  *(void *)(v0 + 384) = v27;
  *(void *)(v0 + 392) = *(void *)(v27 + 64);
  *(void *)(v0 + 400) = swift_task_alloc();
  uint64_t v28 = swift_task_alloc();
  *(void *)(v0 + 408) = v28;
  sub_100006AB0();
  swift_allocObject();
  uint64_t v29 = sub_100006AA0();
  *(void *)(v0 + 416) = v29;
  sub_100006B60();
  unint64_t v30 = *(void *)(v0 + 144);
  v31 = (void *)swift_task_alloc();
  *(void *)(v0 + 424) = v31;
  void *v31 = v0;
  v31[1] = sub_100003A88;
  uint64_t v32 = *(void *)(v0 + 184);
  v33.n128_u64[0] = v30;
  return MetricsWorker.doWork(metricsExecutor:context:durationThreshold:)(v28, v29, v32, v33);
}

uint64_t sub_100003A88()
{
  *(void *)(*(void *)v1 + 432) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100004068;
  }
  else {
    uint64_t v2 = sub_100003BB8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100003BB8()
{
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 384);
  uint64_t v3 = *(void *)(v0 + 376);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 32))(v1, *(void *)(v0 + 408), v3);
  swift_task_dealloc();
  uint64_t v4 = (void *)swift_task_alloc();
  (*(void (**)(void *, uint64_t, uint64_t))(v2 + 16))(v4, v1, v3);
  int v5 = (*(uint64_t (**)(void *, uint64_t))(v2 + 88))(v4, v3);
  if (&enum case for LighthouseRuntimeProcessorResult.error(_:)
    && v5 == enum case for LighthouseRuntimeProcessorResult.error(_:))
  {
    (*(void (**)(void *, void))(*(void *)(v0 + 384) + 96))(v4, *(void *)(v0 + 376));
    if (*v4
      && (*(void *)(v0 + 152) = *v4,
          swift_errorRetain(),
          sub_100004CC4(&qword_10000C120),
          sub_100004CC4(&qword_10000C128),
          (swift_dynamicCast() & 1) != 0))
    {
      if (*(void *)(v0 + 120))
      {
        uint64_t v7 = *(void *)(v0 + 376);
        uint64_t v6 = *(void *)(v0 + 384);
        uint64_t v34 = *(void *)(v0 + 272);
        uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
        uint64_t v32 = *(void *)(v0 + 400);
        uint64_t v33 = *(void *)(v0 + 248);
        uint64_t v8 = *(void *)(v0 + 208);
        uint64_t v31 = *(void *)(v0 + 216);
        uint64_t v9 = *(void *)(v0 + 200);
        sub_1000062E8((long long *)(v0 + 96), v0 + 56);
        sub_100006300(v0 + 56, v0 + 16);
        id v10 = objc_allocWithZone((Class)sub_100006B20());
        uint64_t v38 = sub_100006B00();
        swift_errorRelease();
        sub_1000063AC(v0 + 56);
        (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v32, v7);
        (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v31, v9);
        v36(v34, v33);
        swift_task_dealloc();
        goto LABEL_22;
      }
    }
    else
    {
      *(void *)(v0 + 128) = 0;
      *(_OWORD *)(v0 + 96) = 0u;
      *(_OWORD *)(v0 + 112) = 0u;
    }
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 328);
    uint64_t v15 = *(void *)(v0 + 304);
    uint64_t v11 = (void *)(v0 + 280);
    uint64_t v16 = *(void *)(v0 + 280);
    uint64_t v17 = *(void *)(v0 + 192);
    sub_100006744(v0 + 96, &qword_10000C118);
    v14(v15, v17, v16);
    uint64_t v18 = sub_100006B80();
    os_log_type_t v19 = sub_100006C10();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "task failed with unset error", v20, 2u);
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
    }
    uint64_t v12 = (void (**)(void *, void))(v0 + 344);
    uint64_t v13 = *(void **)(v0 + 304);
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
    uint64_t v11 = (void *)(v0 + 376);
    uint64_t v12 = (void (**)(void *, void))(*(void *)(v0 + 384) + 8);
    uint64_t v13 = v4;
  }
  (*v12)(v13, *v11);
LABEL_21:
  uint64_t v21 = *(void *)(v0 + 400);
  uint64_t v22 = *(void *)(v0 + 376);
  uint64_t v23 = *(void *)(v0 + 384);
  uint64_t v35 = *(void *)(v0 + 272);
  uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
  uint64_t v24 = *(void *)(v0 + 248);
  uint64_t v25 = *(void *)(v0 + 208);
  uint64_t v26 = *(void *)(v0 + 216);
  uint64_t v27 = *(void *)(v0 + 200);
  swift_task_dealloc();
  id v28 = objc_allocWithZone((Class)sub_100006B20());
  uint64_t v38 = sub_100006B10();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26, v27);
  v37(v35, v24);
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
  uint64_t v29 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v29(v38);
}

uint64_t sub_100004068()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[41];
  uint64_t v2 = v0[37];
  uint64_t v3 = v0[35];
  uint64_t v4 = v0[24];
  swift_task_dealloc();
  v1(v2, v4, v3);
  swift_errorRetain();
  swift_errorRetain();
  int v5 = sub_100006B80();
  os_log_type_t v6 = sub_100006C10();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[20] = v9;
    sub_100006C20();
    *uint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "unexpected error throws: %@", v7, 0xCu);
    sub_100004CC4(&qword_10000C110);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  id v10 = (void (*)(uint64_t, uint64_t))v0[43];
  uint64_t v11 = v0[37];
  uint64_t v12 = v0[35];
  uint64_t v20 = v0[34];
  uint64_t v21 = (void (*)(uint64_t, uint64_t))v0[46];
  uint64_t v19 = v0[31];
  uint64_t v13 = v0[26];
  uint64_t v14 = v0[27];
  uint64_t v15 = v0[25];

  v10(v11, v12);
  sub_100006294();
  id v16 = objc_allocWithZone((Class)sub_100006B20());
  uint64_t v22 = sub_100006B00();
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
  uint64_t v17 = (uint64_t (*)(uint64_t))v0[1];
  return v17(v22);
}

uint64_t sub_100004344()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_10000C140 + dword_10000C140);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100006A5C;
  return v3();
}

uint64_t sub_1000043E4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100004478;
  return sub_100003100(a1);
}

uint64_t sub_100004478(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100004574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_100004658;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100004658()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000474C(uint64_t a1)
{
  uint64_t v2 = sub_1000055FC(&qword_10000C0E0);

  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_1000047B4()
{
  return sub_100006B50();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for MetricsExtension()
{
  uint64_t result = qword_10000C3F0;
  if (!qword_10000C3F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_100004924()
{
  unint64_t result = qword_10000C008;
  if (!qword_10000C008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C008);
  }
  return result;
}

unint64_t sub_10000497C()
{
  unint64_t result = qword_10000C010;
  if (!qword_10000C010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C010);
  }
  return result;
}

unint64_t sub_1000049D4()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

unint64_t sub_100004A2C()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SiriMetricsExtensionError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriMetricsExtensionError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100004B74);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100004B9C()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriMetricsExtensionError()
{
  return &type metadata for SiriMetricsExtensionError;
}

uint64_t *sub_100004BB8(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_100006BA0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    id v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100004CC4(&qword_10000C028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_100004CC4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004D08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006BA0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_100004CC4(&qword_10000C028);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_100004DB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006BA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004CC4(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_100004E70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006BA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004CC4(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_100004F2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006BA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004CC4(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_100004FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006BA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100004CC4(&qword_10000C028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000050A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000050B8);
}

uint64_t sub_1000050B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006BA0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100004CC4(&qword_10000C028);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_1000051B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000051C8);
}

uint64_t sub_1000051C8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100006BA0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100004CC4(&qword_10000C028);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_1000052D0()
{
  sub_100006BA0();
  if (v0 <= 0x3F)
  {
    sub_100005398();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100005398()
{
  if (!qword_10000C088)
  {
    sub_100005400();
    sub_100005454();
    unint64_t v0 = sub_100006B70();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C088);
    }
  }
}

unint64_t sub_100005400()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_100005454()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for MetricsExtensionConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MetricsExtensionConfig(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MetricsExtensionConfig(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for MetricsExtensionConfig()
{
  return &type metadata for MetricsExtensionConfig;
}

uint64_t sub_100005558()
{
  return sub_1000055FC(&qword_10000C000);
}

uint64_t sub_10000558C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000055FC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for MetricsExtension();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *sub_100005640(char *result, int64_t a2, char a3, char *a4)
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
      sub_100004CC4((uint64_t *)&unk_10000C160);
      uint64_t v10 = (char *)swift_allocObject();
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
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
    sub_100005DA8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100005750(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005824(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000063FC((uint64_t)v12, *a3);
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
      sub_1000063FC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000063AC((uint64_t)v12);
  return v7;
}

uint64_t sub_100005824(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006C30();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000059E0(a5, a6);
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
  uint64_t v8 = sub_100006C50();
  if (!v8)
  {
    sub_100006C80();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006C90();
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

uint64_t sub_1000059E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005A78(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005C58(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005C58(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005A78(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005BF0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006C40();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006C80();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006BE0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006C90();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006C80();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100005BF0(uint64_t a1, uint64_t a2)
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
  sub_100004CC4(&qword_10000C138);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005C58(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004CC4(&qword_10000C138);
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
  uint64_t result = sub_100006C90();
  __break(1u);
  return result;
}

uint64_t sub_100005DA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_100006C90();
  __break(1u);
  return result;
}

uint64_t sub_100005E9C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726150776F6C6C61 && a2 == 0xEC0000006C616974;
  if (v3 || (sub_100006D10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100007710)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100006D10();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

double sub_100005F94(void *a1)
{
  uint64_t v4 = sub_100004CC4(&qword_10000C0E8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000613C(a1, a1[3]);
  sub_100006180();
  sub_100006DC0();
  if (!v1)
  {
    char v12 = 0;
    sub_100006CC0();
    char v11 = 1;
    sub_100006CD0();
    double v2 = v8;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_1000063AC((uint64_t)a1);
  return v2;
}

void *sub_10000613C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100006180()
{
  unint64_t result = qword_10000C680[0];
  if (!qword_10000C680[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C680);
  }
  return result;
}

uint64_t sub_1000061D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MetricsExtension();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006238(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MetricsExtension();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100006294()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

uint64_t sub_1000062E8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100006300(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006364(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000063AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000063FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000645C()
{
  v1[2] = v0;
  uint64_t v2 = sub_100006BA0();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v1[6] = swift_task_alloc();
  return _swift_task_switch(sub_10000652C, 0, 0);
}

uint64_t sub_10000652C()
{
  if (!sub_100006A60())
  {
    uint64_t v1 = v0 + 6;
    (*(void (**)(void, void, void))(v0[4] + 16))(v0[6], v0[2], v0[3]);
    uint64_t v2 = sub_100006B80();
    os_log_type_t v3 = sub_100006C00();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = "Siri on device metrics disabled. Not continuing.";
      goto LABEL_7;
    }
LABEL_8:
    uint64_t v5 = *v1;
    goto LABEL_9;
  }
  sub_100006AD0();
  if (sub_100006AC0()) {
    goto LABEL_10;
  }
  uint64_t v1 = v0 + 5;
  (*(void (**)(void, void, void))(v0[4] + 16))(v0[5], v0[2], v0[3]);
  uint64_t v2 = sub_100006B80();
  os_log_type_t v3 = sub_100006C00();
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
  id v9 = objc_allocWithZone((Class)sub_100006B20());
  uint64_t v10 = sub_100006B10();
  swift_task_dealloc();
  swift_task_dealloc();
  char v11 = (uint64_t (*)(uint64_t))v0[1];
  return v11(v10);
}

uint64_t sub_100006700(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006364(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006744(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004CC4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unsigned char *initializeBufferWithCopyOfBuffer for MetricsExtensionConfig.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MetricsExtensionConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MetricsExtensionConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100006908);
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

uint64_t sub_100006930(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006938(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MetricsExtensionConfig.CodingKeys()
{
  return &type metadata for MetricsExtensionConfig.CodingKeys;
}

unint64_t sub_100006958()
{
  unint64_t result = qword_10000C790[0];
  if (!qword_10000C790[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C790);
  }
  return result;
}

unint64_t sub_1000069B0()
{
  unint64_t result = qword_10000C8A0;
  if (!qword_10000C8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C8A0);
  }
  return result;
}

unint64_t sub_100006A08()
{
  unint64_t result = qword_10000C8A8[0];
  if (!qword_10000C8A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C8A8);
  }
  return result;
}

BOOL sub_100006A60()
{
  return isOnDeviceSiriMetricsEnabled()();
}

uint64_t sub_100006A80()
{
  return MetricsWorker.init()();
}

uint64_t sub_100006A90()
{
  return type metadata accessor for MetricsWorker();
}

uint64_t sub_100006AA0()
{
  return MetricsExecutor.init()();
}

uint64_t sub_100006AB0()
{
  return type metadata accessor for MetricsExecutor();
}

uint64_t sub_100006AC0()
{
  return static ExtensionsUtils.isAssistantOrDictationEnabled()();
}

uint64_t sub_100006AD0()
{
  return type metadata accessor for ExtensionsUtils();
}

uint64_t sub_100006AE0()
{
  return type metadata accessor for LighthouseRuntimeProcessorResult();
}

uint64_t sub_100006AF0()
{
  return static AppExtension.main()();
}

uint64_t sub_100006B00()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_100006B10()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100006B20()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100006B50()
{
  return MLHostParameters.init(taskParameters:)();
}

uint64_t sub_100006B60()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_100006B70()
{
  return type metadata accessor for MLHostParameters();
}

uint64_t sub_100006B80()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006B90()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006BA0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006BB0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_100006BC0()
{
  return String.hash(into:)();
}

void sub_100006BD0(Swift::String a1)
{
}

Swift::Int sub_100006BE0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006BF0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100006C00()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100006C10()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006C20()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006C30()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006C40()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006C50()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006C60()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t sub_100006C70()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100006C80()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006C90()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006CA0()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

Swift::Int sub_100006CB0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006CC0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100006CD0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100006CE0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100006CF0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100006D00()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100006D10()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006D20()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100006D30()
{
  return Error._code.getter();
}

uint64_t sub_100006D40()
{
  return Error._domain.getter();
}

uint64_t sub_100006D50()
{
  return Error._userInfo.getter();
}

uint64_t sub_100006D60()
{
  return Hasher.init(_seed:)();
}

void sub_100006D70(Swift::UInt a1)
{
}

Swift::Int sub_100006D80()
{
  return Hasher._finalize()();
}

uint64_t sub_100006D90()
{
  return Mirror.init(reflecting:)();
}

uint64_t sub_100006DA0()
{
  return Mirror.children.getter();
}

uint64_t sub_100006DB0()
{
  return type metadata accessor for Mirror();
}

uint64_t sub_100006DC0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100006DD0()
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