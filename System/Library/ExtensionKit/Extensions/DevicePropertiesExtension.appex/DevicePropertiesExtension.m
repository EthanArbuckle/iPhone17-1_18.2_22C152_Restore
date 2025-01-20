uint64_t sub_100002378(char a1)
{
  Swift::String v2;
  void *v3;
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;

  sub_100006C20(72);
  v5._countAndFlagsBits = 0xD00000000000002ELL;
  v5._object = (void *)0x8000000100007680;
  sub_100006BA0(v5);
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
  sub_100006BA0(v2);
  swift_bridgeObjectRelease();
  v6._object = (void *)0x80000001000076B0;
  v6._countAndFlagsBits = 0xD000000000000015;
  sub_100006BA0(v6);
  sub_100006BC0();
  v7._countAndFlagsBits = 41;
  v7._object = (void *)0xE100000000000000;
  sub_100006BA0(v7);
  return 0;
}

uint64_t sub_100002478(char a1)
{
  if (a1) {
    return 0xD000000000000011;
  }
  else {
    return 0x726150776F6C6C61;
  }
}

BOOL sub_1000024BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000024D4()
{
  Swift::UInt v1 = *v0;
  sub_100006D20();
  sub_100006D30(v1);
  return sub_100006D40();
}

void sub_10000251C()
{
  sub_100006D30(*v0);
}

Swift::Int sub_100002548()
{
  Swift::UInt v1 = *v0;
  sub_100006D20();
  sub_100006D30(v1);
  return sub_100006D40();
}

uint64_t sub_10000258C()
{
  return sub_100002478(*v0);
}

uint64_t sub_100002594@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100005ED4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000025BC()
{
  return 0;
}

void sub_1000025C8(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1000025D4(uint64_t a1)
{
  unint64_t v2 = sub_1000061B8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100002610(uint64_t a1)
{
  unint64_t v2 = sub_1000061B8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000264C(void *a1)
{
  uint64_t v3 = sub_100004C94(&qword_10000C110);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006174(a1, a1[3]);
  sub_1000061B8();
  sub_100006D60();
  char v10 = 0;
  sub_100006CA0();
  if (!v1)
  {
    char v9 = 1;
    sub_100006CB0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_1000027B4(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = sub_100005FCC(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4 & 1;
    *(double *)(a2 + 8) = v5;
  }
}

uint64_t sub_1000027E8(void *a1)
{
  return sub_10000264C(a1);
}

uint64_t sub_100002808()
{
  return sub_100002378(*v0);
}

BOOL DevicePropertiesExtensionError.init(rawValue:)(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100008658;
  v6._object = a2;
  Swift::Int v4 = sub_100006C70(v3, v6);
  swift_bridgeObjectRelease();
  return v4 != 0;
}

unint64_t DevicePropertiesExtensionError.rawValue.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_100002878()
{
  return 1;
}

Swift::Int sub_100002880()
{
  return sub_100006D40();
}

uint64_t sub_1000028D8()
{
  return sub_100006B90();
}

Swift::Int sub_1000028F4()
{
  return sub_100006D40();
}

uint64_t sub_100002948@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  Swift::OpaquePointer v3 = (void *)a1[1];
  v4._rawValue = &off_100008690;
  v7._object = v3;
  Swift::Int v5 = sub_100006C70(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_10000299C(void *a1@<X8>)
{
  *a1 = 0xD00000000000001CLL;
  a1[1] = 0x80000001000073F0;
}

uint64_t sub_1000029CC(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  uint64_t v3 = sub_100006A80();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = type metadata accessor for DevicePropertiesExtension();
  v2[13] = swift_task_alloc();
  sub_100004C94(&qword_10000C120);
  v2[14] = swift_task_alloc();
  uint64_t v4 = sub_100004C94(&qword_10000C040);
  v2[15] = v4;
  v2[16] = *(void *)(v4 - 8);
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  uint64_t v5 = sub_100006B70();
  v2[19] = v5;
  v2[20] = *(void *)(v5 - 8);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  return _swift_task_switch(sub_100002BF8, 0, 0);
}

uint64_t sub_100002BF8()
{
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 160);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v6 = *(int *)(*(void *)(v0 + 96) + 20);
  *(_DWORD *)(v0 + 312) = v6;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(void *)(v0 + 216) = v7;
  *(void *)(v0 + 224) = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7(v2, v5 + v6, v3);
  id v8 = v1;
  char v9 = sub_100006B50();
  os_log_type_t v10 = sub_100006BD0();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(void **)(v0 + 56);
    v12 = (uint8_t *)swift_slowAlloc();
    v27 = (void *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412290;
    *(void *)(v0 + 48) = v11;
    id v13 = v11;
    sub_100006C00();
    void *v27 = v11;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Context: %@", v12, 0xCu);
    sub_100004C94(&qword_10000C130);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v14 = *(void **)(v0 + 56);
  }
  uint64_t v15 = *(void *)(v0 + 208);
  uint64_t v16 = *(void *)(v0 + 152);
  uint64_t v17 = *(void *)(v0 + 160);
  v18 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  *(void *)(v0 + 232) = v18;
  *(void *)(v0 + 240) = (v17 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v18(v15, v16);
  v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v19;
  uint64_t v20 = sub_100005838(&qword_10000C100);
  unint64_t v21 = sub_10000563C();
  unint64_t v22 = sub_100005690();
  void *v19 = v0;
  v19[1] = sub_100002E70;
  uint64_t v23 = *(void *)(v0 + 112);
  uint64_t v24 = *(void *)(v0 + 96);
  uint64_t v25 = *(void *)(v0 + 56);
  return MLHostExtension.loadConfig<A>(context:)(v23, v25, v24, &type metadata for DevicePropertiesExtensionConfig, v20, v21, v22);
}

uint64_t sub_100002E70()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100002F6C, 0, 0);
}

uint64_t sub_100002F6C()
{
  uint64_t v65 = v0;
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 112);
  sub_10000620C(*(void *)(v0 + 64), *(void *)(v0 + 104));
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = *(void *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 120);
  uint64_t v7 = *(void *)(v0 + 128);
  uint64_t v9 = *(void *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 112);
  if (v4 == 1)
  {
    (*(void (**)(void, uint64_t, void))(v7 + 16))(*(void *)(v0 + 144), v9 + *(int *)(*(void *)(v0 + 96) + 24), *(void *)(v0 + 120));
    sub_100006270(v9);
    sub_100006474(v8, &qword_10000C120);
  }
  else
  {
    sub_100006270(*(void *)(v0 + 104));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v5, v8, v6);
  }
  uint64_t v10 = *(void *)(v0 + 144);
  uint64_t v12 = *(void *)(v0 + 128);
  uint64_t v11 = *(void *)(v0 + 136);
  uint64_t v13 = *(void *)(v0 + 120);
  (*(void (**)(void, void, void))(v0 + 216))(*(void *)(v0 + 200), *(void *)(v0 + 64) + *(int *)(v0 + 312), *(void *)(v0 + 152));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v10, v13);
  v14 = sub_100006B50();
  os_log_type_t v15 = sub_100006BD0();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
  uint64_t v18 = *(void *)(v0 + 200);
  uint64_t v62 = *(void *)(v0 + 152);
  uint64_t v20 = *(void *)(v0 + 128);
  uint64_t v19 = *(void *)(v0 + 136);
  uint64_t v21 = *(void *)(v0 + 120);
  if (v16)
  {
    unint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v64 = swift_slowAlloc();
    *(_DWORD *)unint64_t v22 = 136315138;
    sub_100006320();
    uint64_t v23 = sub_100006CC0();
    *(void *)(v0 + 40) = sub_10000587C(v23, v24, &v64);
    sub_100006C00();
    swift_bridgeObjectRelease();
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v25(v19, v21);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Configuration: %s", v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v17(v18, v62);
  }
  else
  {
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v25(*(void *)(v0 + 136), *(void *)(v0 + 120));

    v17(v18, v62);
  }
  *(void *)(v0 + 256) = v25;
  v26 = self;
  id v27 = [v26 sharedPreferences];
  unsigned __int8 v28 = [v27 assistantIsEnabled];

  if ((v28 & 1) != 0
    || (id v29 = [v26 sharedPreferences],
        unsigned __int8 v30 = [v29 dictationIsEnabled],
        v29,
        (v30 & 1) != 0))
  {
    (*(void (**)(void, void, void))(v0 + 216))(*(void *)(v0 + 184), *(void *)(v0 + 64) + *(int *)(v0 + 312), *(void *)(v0 + 152));
    v31 = sub_100006B50();
    os_log_type_t v32 = sub_100006BD0();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Assistant or dictation enabled. Continuing.", v33, 2u);
      swift_slowDealloc();
    }
    v34 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
    v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 216);
    uint64_t v36 = *(int *)(v0 + 312);
    uint64_t v38 = *(void *)(v0 + 176);
    uint64_t v37 = *(void *)(v0 + 184);
    uint64_t v39 = *(void *)(v0 + 152);
    v40 = v31;
    uint64_t v41 = *(void *)(v0 + 64);

    v34(v37, v39);
    v35(v38, v41 + v36, v39);
    sub_100006A70();
    uint64_t v42 = sub_100006AB0();
    *(void *)(v0 + 264) = v42;
    *(void *)(v0 + 272) = *(void *)(v42 - 8);
    uint64_t v43 = swift_task_alloc();
    *(void *)(v0 + 280) = v43;
    sub_100006AA0();
    swift_allocObject();
    uint64_t v44 = sub_100006A90();
    *(void *)(v0 + 288) = v44;
    sub_100006B30();
    unint64_t v45 = *(void *)(v0 + 24);
    v46 = (void *)swift_task_alloc();
    *(void *)(v0 + 296) = v46;
    void *v46 = v0;
    v46[1] = sub_1000036C0;
    uint64_t v47 = *(void *)(v0 + 56);
    v48.n128_u64[0] = v45;
    return DevicePropertiesWorker.doWork(executor:context:durationThreshold:)(v43, v44, v47, v48);
  }
  else
  {
    (*(void (**)(void, void, void))(v0 + 216))(*(void *)(v0 + 192), *(void *)(v0 + 64) + *(int *)(v0 + 312), *(void *)(v0 + 152));
    v49 = sub_100006B50();
    os_log_type_t v50 = sub_100006BD0();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Neither assistant nor dictation enabled. Not allowed to process.", v51, 2u);
      swift_slowDealloc();
    }
    v52 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
    uint64_t v53 = *(void *)(v0 + 192);
    uint64_t v54 = *(void *)(v0 + 152);
    uint64_t v61 = *(void *)(v0 + 144);
    uint64_t v55 = *(void *)(v0 + 120);

    v52(v53, v54);
    uint64_t v56 = sub_100006AB0();
    uint64_t v57 = *(void *)(v56 - 8);
    v58 = (char *)swift_task_alloc();
    (*(void (**)(char *, void, uint64_t))(v57 + 104))(v58, enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:), v56);
    uint64_t v63 = sub_100003C38(v58);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v56);
    v25(v61, v55);
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
    v59 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v59(v63);
  }
}

uint64_t sub_1000036C0()
{
  *(void *)(*(void *)v1 + 304) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100003954;
  }
  else {
    uint64_t v2 = sub_1000037F0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000037F0()
{
  uint64_t v2 = v0[34];
  uint64_t v1 = (char *)v0[35];
  uint64_t v3 = v0[33];
  uint64_t v10 = v0[18];
  uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[32];
  uint64_t v4 = v0[15];
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[11];
  uint64_t v7 = v0[9];
  uint64_t v12 = sub_100003C38(v1);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
  v11(v10, v4);
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
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  return v8(v12);
}

uint64_t sub_100003954()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 64) + *(int *)(v0 + 312);
  (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 88), *(void *)(v0 + 72));
  swift_task_dealloc();
  v1(v2, v4, v3);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_100006B50();
  os_log_type_t v6 = sub_100006BF0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 32) = v9;
    sub_100006C00();
    *uint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "unexpected error throws: %@", v7, 0xCu);
    sub_100004C94(&qword_10000C130);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v0 + 256);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
  uint64_t v11 = *(void *)(v0 + 168);
  uint64_t v13 = *(void *)(v0 + 144);
  uint64_t v12 = *(void *)(v0 + 152);
  uint64_t v14 = *(void *)(v0 + 120);

  v10(v11, v12);
  sub_1000062CC();
  id v15 = objc_allocWithZone((Class)sub_100006AF0());
  uint64_t v19 = sub_100006AD0();
  swift_errorRelease();
  v18(v13, v14);
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
  BOOL v16 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v16(v19);
}

uint64_t sub_100003C38(char *a1)
{
  uint64_t v3 = sub_100006B70();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v47 = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v41 - v7;
  uint64_t v9 = v1 + *(int *)(type metadata accessor for DevicePropertiesExtension() + 20);
  uint64_t v50 = v4;
  uint64_t v51 = v3;
  uint64_t v44 = *(void (**)(char *))(v4 + 16);
  uint64_t v45 = v9;
  v44(v8);
  uint64_t v10 = sub_100006AB0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = (char *)v41 - v13;
  uint64_t v49 = v11;
  id v15 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v52 = a1;
  __n128 v48 = v15;
  v15((char *)v41 - v13, a1, v10);
  BOOL v16 = sub_100006B50();
  os_log_type_t v17 = sub_100006BD0();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v46 = v4 + 16;
  if (v18)
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v43 = v20;
    v41[0] = v41;
    v57[0] = v20;
    uint64_t v42 = v19;
    *(_DWORD *)uint64_t v19 = 136315138;
    v41[1] = v19 + 4;
    __chkstk_darwin(v20);
    v48((char *)v41 - v13, v14, v10);
    uint64_t v21 = sub_100006B80();
    *(void *)&long long v54 = sub_10000587C(v21, v22, v57);
    sub_100006C00();
    swift_bridgeObjectRelease();
    uint64_t v23 = v49;
    unint64_t v24 = *(void (**)(char *, uint64_t))(v49 + 8);
    v24(v14, v10);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Handling result %s", v42, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v23 = v49;
    unint64_t v24 = *(void (**)(char *, uint64_t))(v49 + 8);
    v24(v14, v10);
  }

  uint64_t v25 = v51;
  v26 = *(uint64_t (**)(char *, uint64_t))(v50 + 8);
  uint64_t v27 = v26(v8, v51);
  uint64_t v28 = v23;
  __chkstk_darwin(v27);
  id v29 = (void *)((char *)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v30(v29);
  int v31 = (*(uint64_t (**)(uint64_t *, uint64_t))(v28 + 88))(v29, v10);
  if (!&enum case for LighthouseRuntimeProcessorResult.error(_:)
    || v31 != enum case for LighthouseRuntimeProcessorResult.error(_:))
  {
    if ((!&enum case for LighthouseRuntimeProcessorResult.success(_:)
       || v31 != enum case for LighthouseRuntimeProcessorResult.success(_:))
      && (!&enum case for LighthouseRuntimeProcessorResult.cancelled(_:)
       || v31 != enum case for LighthouseRuntimeProcessorResult.cancelled(_:))
      && (!&enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:)
       || v31 != enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:)))
    {
      v24((char *)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
    }
    goto LABEL_24;
  }
  (*(void (**)(char *, uint64_t))(v28 + 96))((char *)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  if (!*v29)
  {
    uint64_t v56 = 0;
    long long v54 = 0u;
    long long v55 = 0u;
    v33 = v47;
    goto LABEL_20;
  }
  uint64_t v53 = *v29;
  swift_errorRetain();
  sub_100004C94(&qword_10000C150);
  sub_100004C94(&qword_10000C158);
  char v32 = swift_dynamicCast();
  v33 = v47;
  if ((v32 & 1) == 0)
  {
    uint64_t v56 = 0;
    long long v54 = 0u;
    long long v55 = 0u;
    goto LABEL_20;
  }
  if (!*((void *)&v55 + 1))
  {
LABEL_20:
    sub_100006474((uint64_t)&v54, &qword_10000C148);
    ((void (*)(char *, uint64_t, uint64_t))v44)(v33, v45, v25);
    uint64_t v36 = sub_100006B50();
    os_log_type_t v37 = sub_100006BF0();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "task failed with unset error", v38, 2u);
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
    }
    v26(v33, v25);
LABEL_24:
    id v39 = objc_allocWithZone((Class)sub_100006AF0());
    return sub_100006AE0();
  }
  sub_1000064D0(&v54, (uint64_t)v57);
  sub_1000064E8((uint64_t)v57, (uint64_t)&v54);
  id v34 = objc_allocWithZone((Class)sub_100006AF0());
  uint64_t v35 = sub_100006AD0();
  swift_errorRelease();
  sub_1000063C4((uint64_t)v57);
  return v35;
}

uint64_t sub_1000042BC()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_10000C160 + dword_10000C160);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100006A2C;
  return v3();
}

uint64_t sub_10000435C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000043F0;
  return sub_1000029CC(a1);
}

uint64_t sub_1000043F0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000044EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *id v15 = v7;
  v15[1] = sub_1000045D0;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_1000045D0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000046C4(uint64_t a1)
{
  uint64_t v2 = sub_100005838(&qword_10000C100);

  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_10000472C()
{
  return sub_100006B20();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for DevicePropertiesExtension()
{
  uint64_t result = qword_10000C3F0;
  if (!qword_10000C3F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1000048A4()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

unint64_t sub_1000048FC()
{
  unint64_t result = qword_10000C028;
  if (!qword_10000C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

unint64_t sub_100004954()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

unint64_t sub_1000049AC()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DevicePropertiesExtensionError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for DevicePropertiesExtensionError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100004AF4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100004B1C()
{
  return 0;
}

ValueMetadata *type metadata accessor for DevicePropertiesExtensionError()
{
  return &type metadata for DevicePropertiesExtensionError;
}

uint64_t *sub_100004B38(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100006A40();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100006B70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    unint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_100004C94(&qword_10000C040);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_100004C94(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006A40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_100006B70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_100004C94(&qword_10000C040);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);

  return v9(v7, v8);
}

uint64_t sub_100004DCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100006B70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100004C94(&qword_10000C040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_100004ED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100006B70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100004C94(&qword_10000C040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_100004FE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100006B70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100004C94(&qword_10000C040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_1000050F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006A40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100006B70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100004C94(&qword_10000C040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_1000051FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005210);
}

uint64_t sub_100005210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006A40();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100006B70();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = sub_100004C94(&qword_10000C040);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t sub_100005360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005374);
}

uint64_t sub_100005374(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100006A40();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_100006B70();
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = sub_100004C94(&qword_10000C040);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

void sub_1000054D0()
{
  sub_100006A40();
  if (v0 <= 0x3F)
  {
    sub_100006B70();
    if (v1 <= 0x3F)
    {
      sub_1000055D4();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_1000055D4()
{
  if (!qword_10000C0A0)
  {
    sub_10000563C();
    sub_100005690();
    unint64_t v0 = sub_100006B40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C0A0);
    }
  }
}

unint64_t sub_10000563C()
{
  unint64_t result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

unint64_t sub_100005690()
{
  unint64_t result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for DevicePropertiesExtensionConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DevicePropertiesExtensionConfig(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DevicePropertiesExtensionConfig(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for DevicePropertiesExtensionConfig()
{
  return &type metadata for DevicePropertiesExtensionConfig;
}

uint64_t sub_100005794()
{
  return sub_100005838(&qword_10000C018);
}

uint64_t sub_1000057C8()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100005838(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for DevicePropertiesExtension();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000587C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005950(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006414((uint64_t)v12, *a3);
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
      sub_100006414((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000063C4((uint64_t)v12);
  return v7;
}

uint64_t sub_100005950(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006C10();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005B0C(a5, a6);
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
  uint64_t v8 = sub_100006C40();
  if (!v8)
  {
    sub_100006C50();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006C60();
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

uint64_t sub_100005B0C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005BA4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005D84(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005D84(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005BA4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005D1C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006C30();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006C50();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006BB0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006C60();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006C50();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100005D1C(uint64_t a1, uint64_t a2)
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
  sub_100004C94(&qword_10000C140);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005D84(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004C94(&qword_10000C140);
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
  uint64_t result = sub_100006C60();
  __break(1u);
  return result;
}

uint64_t sub_100005ED4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726150776F6C6C61 && a2 == 0xEC0000006C616974;
  if (v3 || (sub_100006CD0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001000076D0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100006CD0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

double sub_100005FCC(void *a1)
{
  uint64_t v4 = sub_100004C94(&qword_10000C108);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006174(a1, a1[3]);
  sub_1000061B8();
  sub_100006D50();
  if (!v1)
  {
    char v12 = 0;
    sub_100006C80();
    char v11 = 1;
    sub_100006C90();
    double v2 = v8;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_1000063C4((uint64_t)a1);
  return v2;
}

void *sub_100006174(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000061B8()
{
  unint64_t result = qword_10000C680[0];
  if (!qword_10000C680[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C680);
  }
  return result;
}

uint64_t sub_10000620C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DevicePropertiesExtension();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006270(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DevicePropertiesExtension();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000062CC()
{
  unint64_t result = qword_10000C128;
  if (!qword_10000C128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C128);
  }
  return result;
}

unint64_t sub_100006320()
{
  unint64_t result = qword_10000C138;
  if (!qword_10000C138)
  {
    sub_10000637C(&qword_10000C040);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C138);
  }
  return result;
}

uint64_t sub_10000637C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000063C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006414(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006474(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004C94(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000064D0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1000064E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000654C()
{
  v1[2] = v0;
  uint64_t v2 = sub_100006B70();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return _swift_task_switch(sub_10000660C, 0, 0);
}

uint64_t sub_10000660C()
{
  if (!sub_100006A50())
  {
    uint64_t v2 = v0[4];
    uint64_t v1 = v0[5];
    uint64_t v4 = v0[2];
    uint64_t v3 = v0[3];
    uint64_t v5 = type metadata accessor for DevicePropertiesExtension();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4 + *(int *)(v5 + 20), v3);
    uint64_t v6 = sub_100006B50();
    os_log_type_t v7 = sub_100006BE0();
    if (os_log_type_enabled(v6, v7))
    {
      double v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Siri on device metrics disabled. Not continuing.", v8, 2u);
      swift_slowDealloc();
    }
    uint64_t v10 = v0[4];
    uint64_t v9 = v0[5];
    uint64_t v11 = v0[3];

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  id v12 = objc_allocWithZone((Class)sub_100006AF0());
  uint64_t v13 = sub_100006AE0();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
  return v14(v13);
}

unsigned char *initializeBufferWithCopyOfBuffer for DevicePropertiesExtensionConfig.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DevicePropertiesExtensionConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DevicePropertiesExtensionConfig.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000068D8);
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

uint64_t sub_100006900(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006908(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DevicePropertiesExtensionConfig.CodingKeys()
{
  return &type metadata for DevicePropertiesExtensionConfig.CodingKeys;
}

unint64_t sub_100006928()
{
  unint64_t result = qword_10000C790[0];
  if (!qword_10000C790[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C790);
  }
  return result;
}

unint64_t sub_100006980()
{
  unint64_t result = qword_10000C8A0;
  if (!qword_10000C8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C8A0);
  }
  return result;
}

unint64_t sub_1000069D8()
{
  unint64_t result = qword_10000C8A8[0];
  if (!qword_10000C8A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C8A8);
  }
  return result;
}

uint64_t sub_100006A30()
{
  return static Calendar.currentUTC.getter();
}

uint64_t sub_100006A40()
{
  return type metadata accessor for Calendar();
}

BOOL sub_100006A50()
{
  return isOnDeviceSiriMetricsEnabled()();
}

uint64_t sub_100006A70()
{
  return DevicePropertiesWorker.init(logger:)();
}

uint64_t sub_100006A80()
{
  return type metadata accessor for DevicePropertiesWorker();
}

uint64_t sub_100006A90()
{
  return DevicePropertiesExecutor.init()();
}

uint64_t sub_100006AA0()
{
  return type metadata accessor for DevicePropertiesExecutor();
}

uint64_t sub_100006AB0()
{
  return type metadata accessor for LighthouseRuntimeProcessorResult();
}

uint64_t sub_100006AC0()
{
  return static AppExtension.main()();
}

uint64_t sub_100006AD0()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_100006AE0()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100006AF0()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100006B20()
{
  return MLHostParameters.init(taskParameters:)();
}

uint64_t sub_100006B30()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_100006B40()
{
  return type metadata accessor for MLHostParameters();
}

uint64_t sub_100006B50()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006B60()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006B70()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006B80()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100006B90()
{
  return String.hash(into:)();
}

void sub_100006BA0(Swift::String a1)
{
}

Swift::Int sub_100006BB0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006BC0()
{
  return Double.write<A>(to:)();
}

uint64_t sub_100006BD0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100006BE0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100006BF0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006C00()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006C10()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

void sub_100006C20(Swift::Int a1)
{
}

uint64_t sub_100006C30()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006C40()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006C50()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006C60()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100006C70(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006C80()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100006C90()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100006CA0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100006CB0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100006CC0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100006CD0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006CE0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100006CF0()
{
  return Error._code.getter();
}

uint64_t sub_100006D00()
{
  return Error._domain.getter();
}

uint64_t sub_100006D10()
{
  return Error._userInfo.getter();
}

uint64_t sub_100006D20()
{
  return Hasher.init(_seed:)();
}

void sub_100006D30(Swift::UInt a1)
{
}

Swift::Int sub_100006D40()
{
  return Hasher._finalize()();
}

uint64_t sub_100006D50()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100006D60()
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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