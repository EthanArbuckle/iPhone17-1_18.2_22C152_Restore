uint64_t sub_1000049B8()
{
  uint64_t v0;

  v0 = sub_10000A930();
  sub_10000A1B4(v0, qword_100010960);
  sub_100009C48(v0, (uint64_t)qword_100010960);
  return sub_10000A920();
}

uint64_t sub_100004A38()
{
  return 1;
}

Swift::Int sub_100004A40()
{
  return sub_10000ABA0();
}

void sub_100004A84()
{
}

Swift::Int sub_100004AAC()
{
  return sub_10000ABA0();
}

uint64_t sub_100004AF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result = sub_100009A0C(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_100004B20()
{
  return 0;
}

void sub_100004B2C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100004B38(uint64_t a1)
{
  unint64_t v2 = sub_100009BF4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100004B74(uint64_t a1)
{
  unint64_t v2 = sub_100009BF4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100004BB0(char a1)
{
  if (a1) {
    return 0x7075727265746E69;
  }
  else {
    return 0x656C6C65636E6163;
  }
}

uint64_t sub_100004BF4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = sub_100007F24(&qword_1000100F0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009BB0(a1, a1[3]);
  sub_100009BF4();
  sub_10000ABE0();
  if (v2) {
    return sub_10000A0B4((uint64_t)a1);
  }
  char v9 = sub_10000AAF0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_10000A0B4((uint64_t)a1);
  *a2 = v9 & 1;
  return result;
}

uint64_t sub_100004D54(void *a1)
{
  uint64_t v2 = sub_100007F24(&qword_1000100F8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009BB0(a1, a1[3]);
  sub_100009BF4();
  sub_10000ABF0();
  sub_10000AB00();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100004E88(char *a1, char *a2)
{
  return sub_100004E94(*a1, *a2);
}

uint64_t sub_100004E94(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x7075727265746E69;
  }
  else {
    uint64_t v3 = 0x656C6C65636E6163;
  }
  if (v2) {
    unint64_t v4 = 0xE900000000000064;
  }
  else {
    unint64_t v4 = 0xEB00000000646574;
  }
  if (a2) {
    uint64_t v5 = 0x7075727265746E69;
  }
  else {
    uint64_t v5 = 0x656C6C65636E6163;
  }
  if (a2) {
    unint64_t v6 = 0xEB00000000646574;
  }
  else {
    unint64_t v6 = 0xE900000000000064;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_10000AB20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_100004F44()
{
  return sub_100004F4C();
}

Swift::Int sub_100004F4C()
{
  return sub_10000ABA0();
}

uint64_t sub_100004FDC()
{
  return sub_100004FE4();
}

uint64_t sub_100004FE4()
{
  sub_10000A970();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000505C()
{
  return sub_100005064();
}

Swift::Int sub_100005064()
{
  return sub_10000ABA0();
}

uint64_t sub_1000050F0@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_10000C770;
  v8._object = v3;
  Swift::Int v5 = sub_10000AAE0(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_100005150@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100004BB0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000518C(uint64_t a1)
{
  v2[2] = v1;
  uint64_t v4 = type metadata accessor for QuartzWorker();
  v2[3] = swift_task_alloc();
  sub_100007F24(&qword_100010110);
  uint64_t v5 = swift_task_alloc();
  v2[4] = v5;
  uint64_t v6 = sub_100007F24(&qword_100010010);
  v2[5] = v6;
  v2[6] = *(void *)(v6 - 8);
  v2[7] = swift_task_alloc();
  char v7 = (void *)swift_task_alloc();
  v2[8] = v7;
  uint64_t v8 = sub_100009CE4(&qword_1000100C8, (void (*)(uint64_t))type metadata accessor for QuartzWorker);
  unint64_t v9 = sub_100008370();
  unint64_t v10 = sub_1000083C4();
  *char v7 = v2;
  v7[1] = sub_10000536C;
  return MLHostExtension.loadConfig<A>(context:)(v5, a1, v4, &type metadata for QuartzWorkerConfig, v8, v9, v10);
}

uint64_t sub_10000536C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100005468, 0, 0);
}

uint64_t sub_100005468()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 32);
  sub_100009C80(*(void *)(v0 + 16), *(void *)(v0 + 24));
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 56);
  uint64_t v7 = *(void *)(v0 + 32);
  uint64_t v8 = *(void *)(v0 + 40);
  if (v4 == 1)
  {
    (*(void (**)(void, void, void))(v5 + 32))(*(void *)(v0 + 56), *(void *)(v0 + 24), *(void *)(v0 + 40));
    sub_100009F64(v7, &qword_100010110);
  }
  else
  {
    sub_10000A058(*(void *)(v0 + 24));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v6, v7, v8);
  }
  sub_10000A8D0();
  if ((*(unsigned char *)(v0 + 72) & 1) == 0)
  {
    if (qword_100010190 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_10000A930();
    sub_100009C48(v9, (uint64_t)qword_100010960);
    unint64_t v10 = sub_10000A910();
    os_log_type_t v11 = sub_10000A9F0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Config doesn't have shouldRun set, exiting early", v12, 2u);
      swift_slowDealloc();
    }
  }
  uint64_t v14 = *(void *)(v0 + 48);
  uint64_t v13 = *(void *)(v0 + 56);
  uint64_t v15 = *(void *)(v0 + 40);
  id v16 = objc_allocWithZone((Class)sub_10000A890());
  uint64_t v17 = sub_10000A880();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v18 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v18(v17);
}

uint64_t sub_1000056B0(uint64_t a1)
{
  v2[19] = a1;
  v2[20] = v1;
  uint64_t v3 = sub_10000A830();
  v2[21] = v3;
  v2[22] = *(void *)(v3 - 8);
  v2[23] = swift_task_alloc();
  uint64_t v4 = sub_10000A7C0();
  v2[24] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[25] = v5;
  v2[26] = *(void *)(v5 + 64);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  uint64_t v6 = sub_10000A7E0();
  v2[30] = v6;
  v2[31] = *(void *)(v6 - 8);
  v2[32] = swift_task_alloc();
  v2[33] = sub_100007F24(&qword_100010108);
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  uint64_t v7 = sub_10000A810();
  v2[36] = v7;
  v2[37] = *(void *)(v7 - 8);
  v2[38] = swift_task_alloc();
  uint64_t v8 = sub_10000A7B0();
  v2[39] = v8;
  v2[40] = *(void *)(v8 - 8);
  v2[41] = swift_task_alloc();
  uint64_t v9 = sub_10000A780();
  v2[42] = v9;
  v2[43] = *(void *)(v9 - 8);
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  v2[47] = type metadata accessor for QuartzWorker();
  v2[48] = swift_task_alloc();
  sub_100007F24(&qword_100010110);
  v2[49] = swift_task_alloc();
  uint64_t v10 = sub_100007F24(&qword_100010010);
  v2[50] = v10;
  v2[51] = *(void *)(v10 - 8);
  v2[52] = swift_task_alloc();
  v2[53] = swift_task_alloc();
  return _swift_task_switch(sub_100005A90, 0, 0);
}

uint64_t sub_100005A90()
{
  if (qword_100010190 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = sub_10000A930();
  v0[54] = sub_100009C48(v2, (uint64_t)qword_100010960);
  id v3 = v1;
  uint64_t v4 = sub_10000A910();
  os_log_type_t v5 = sub_10000A9F0();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[19];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    v18 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    v0[18] = v7;
    id v9 = v7;
    sub_10000AA10();
    void *v18 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Context: %@", v8, 0xCu);
    sub_100007F24(&qword_100010118);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v10 = (void *)swift_task_alloc();
  v0[55] = v10;
  uint64_t v11 = sub_100009CE4(&qword_1000100C8, (void (*)(uint64_t))type metadata accessor for QuartzWorker);
  unint64_t v12 = sub_100008370();
  unint64_t v13 = sub_1000083C4();
  *uint64_t v10 = v0;
  v10[1] = sub_100005D04;
  uint64_t v14 = v0[49];
  uint64_t v15 = v0[47];
  uint64_t v16 = v0[19];
  return MLHostExtension.loadConfig<A>(context:)(v14, v16, v15, &type metadata for QuartzWorkerConfig, v11, v12, v13);
}

uint64_t sub_100005D04()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100005E00, 0, 0);
}

uint64_t sub_100005E00()
{
  uint64_t v53 = v0;
  uint64_t v2 = *(void *)(v0 + 400);
  uint64_t v1 = *(void *)(v0 + 408);
  uint64_t v3 = *(void *)(v0 + 392);
  sub_100009C80(*(void *)(v0 + 160), *(void *)(v0 + 384));
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2);
  uint64_t v5 = *(void *)(v0 + 424);
  uint64_t v7 = *(void *)(v0 + 400);
  uint64_t v6 = *(void *)(v0 + 408);
  uint64_t v8 = *(void *)(v0 + 392);
  if (v4 == 1)
  {
    (*(void (**)(void, void, void))(v6 + 32))(*(void *)(v0 + 424), *(void *)(v0 + 384), *(void *)(v0 + 400));
    sub_100009F64(v8, &qword_100010110);
  }
  else
  {
    sub_10000A058(*(void *)(v0 + 384));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v5, v8, v7);
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 408) + 16))(*(void *)(v0 + 416), *(void *)(v0 + 424), *(void *)(v0 + 400));
  id v9 = sub_10000A910();
  os_log_type_t v10 = sub_10000A9F0();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v13 = *(void *)(v0 + 408);
  uint64_t v12 = *(void *)(v0 + 416);
  uint64_t v14 = *(void *)(v0 + 400);
  if (v11)
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    v52[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315138;
    sub_10000A014(&qword_100010130, &qword_100010010);
    uint64_t v16 = sub_10000AB10();
    *(void *)(v0 + 136) = sub_1000087F0(v16, v17, v52);
    sub_10000AA10();
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
    v18(*(void *)(v0 + 416), *(void *)(v0 + 400));
  }

  *(void *)(v0 + 448) = v18;
  if (sub_10000A9A0())
  {
    id v19 = *(id *)(v0 + 152);
    uint64_t v20 = sub_10000A910();
    os_log_type_t v21 = sub_10000A9F0();
    BOOL v22 = os_log_type_enabled(v20, v21);
    v23 = *(void **)(v0 + 152);
    if (v22)
    {
      uint64_t v24 = swift_slowAlloc();
      v52[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315394;
      uint64_t v25 = sub_10000A8F0();
      *(void *)(v0 + 120) = sub_1000087F0(v25, v26, v52);
      sub_10000AA10();
      swift_bridgeObjectRelease();

      *(_WORD *)(v24 + 12) = 2080;
      uint64_t v27 = sub_10000A900();
      *(void *)(v0 + 128) = sub_1000087F0(v27, v28, v52);
      sub_10000AA10();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v20, v21, "TaskId: %s, TaskName: %s: asked to stop!", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v46 = *(void *)(v0 + 424);
    uint64_t v47 = *(void *)(v0 + 400);
    v52[3] = (uint64_t)&type metadata for QuartzWorkerError;
    v52[4] = sub_100009FC0();
    LOBYTE(v52[0]) = 0;
    id v48 = objc_allocWithZone((Class)sub_10000A890());
    uint64_t v51 = sub_10000A870();
    v18(v46, v47);
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
    swift_task_dealloc();
    v49 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v49(v51);
  }
  else
  {
    v29 = sub_10000A910();
    os_log_type_t v30 = sub_10000A9F0();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Setting up for analysis", v31, 2u);
      swift_slowDealloc();
    }
    uint64_t v32 = *(void *)(v0 + 360);
    uint64_t v33 = *(void *)(v0 + 344);
    uint64_t v35 = *(void *)(v0 + 328);
    uint64_t v34 = *(void *)(v0 + 336);
    uint64_t v37 = *(void *)(v0 + 312);
    uint64_t v36 = *(void *)(v0 + 320);

    sub_10000A7A0();
    sub_10000A760();
    sub_10000A790();
    v38 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    *(void *)(v0 + 456) = v38;
    *(void *)(v0 + 464) = (v33 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v38(v32, v34);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
    sub_10000A770();
    v39 = sub_10000A910();
    os_log_type_t v40 = sub_10000A9F0();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Starting analysis command", v41, 2u);
      swift_slowDealloc();
    }

    v42 = (void *)swift_task_alloc();
    *(void *)(v0 + 472) = v42;
    void *v42 = v0;
    v42[1] = sub_100006504;
    uint64_t v43 = *(void *)(v0 + 368);
    uint64_t v44 = *(void *)(v0 + 352);
    uint64_t v45 = *(void *)(v0 + 304);
    return runAnalysisCommand(startDate:endDate:)(v45, v44, v43);
  }
}

uint64_t sub_100006504()
{
  *(void *)(*(void *)v1 + 480) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100006CE0;
  }
  else {
    uint64_t v2 = sub_100006618;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100006618()
{
  uint64_t v1 = sub_10000A800();
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[22];
    sub_100008E48(0, v2, 0);
    uint64_t v4 = *(void (**)(uint64_t, unint64_t, uint64_t))(v3 + 16);
    v3 += 16;
    uint64_t v54 = v4;
    unint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 64));
    uint64_t v52 = *(void *)(v3 + 56);
    uint64_t v6 = (void (**)(uint64_t, uint64_t))(v3 - 8);
    do
    {
      uint64_t v7 = v0[23];
      uint64_t v8 = v0[21];
      v54(v7, v5, v8);
      uint64_t v9 = sub_10000A820();
      uint64_t v11 = v10;
      (*v6)(v7, v8);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_100008E48(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1) {
        sub_100008E48(v12 > 1, v13 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v13 + 1;
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage[2 * v13];
      *((void *)v14 + 4) = v9;
      *((void *)v14 + 5) = v11;
      v5 += v52;
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease();
  uint64_t v16 = v0[34];
  uint64_t v15 = v0[35];
  uint64_t v18 = v0[32];
  uint64_t v17 = v0[33];
  uint64_t v19 = v0[30];
  uint64_t v20 = v0[31];
  sub_10000A7F0();
  v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
  v49(v16, v18, v19);
  sub_100009CE4(&qword_100010120, (void (*)(uint64_t))&type metadata accessor for DataFrame.Rows);
  sub_10000A9B0();
  id v48 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  v48(v18, v19);
  *(void *)(v16 + *(int *)(v17 + 36)) = v0[13];
  sub_100009D2C(v16, v15);
  os_log_type_t v21 = (uint64_t *)(v15 + *(int *)(v17 + 36));
  uint64_t v22 = *v21;
  sub_10000A9C0();
  if (v22 != v0[12])
  {
    uint64_t v53 = v0[25];
    v57 = v21;
    do
    {
      uint64_t v23 = v0[35];
      uint64_t v24 = v0[32];
      uint64_t v26 = v0[29];
      uint64_t v25 = v0[30];
      uint64_t v55 = v0[28];
      uint64_t v51 = v0[27];
      uint64_t v27 = v0[24];
      unint64_t v28 = (void (*)(void *, void))sub_10000A9E0();
      v50 = *(void (**)(uint64_t))(v53 + 16);
      v50(v26);
      v28(v0 + 8, 0);
      v49(v24, v23, v25);
      sub_10000A9D0();
      v48(v24, v25);
      v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 32);
      v29(v55, v26, v27);
      NSString v30 = sub_10000A960();
      ((void (*)(uint64_t, uint64_t, uint64_t))v50)(v51, v55, v27);
      unint64_t v31 = (*(unsigned __int8 *)(v53 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
      uint64_t v32 = swift_allocObject();
      *(void *)(v32 + 16) = _swiftEmptyArrayStorage;
      v29(v32 + v31, v51, v27);
      v0[6] = sub_100009E60;
      v0[7] = v32;
      v0[2] = _NSConcreteStackBlock;
      v0[3] = 1107296256;
      v0[4] = sub_100007518;
      v0[5] = &unk_10000C868;
      uint64_t v33 = _Block_copy(v0 + 2);
      swift_bridgeObjectRetain();
      swift_release();
      AnalyticsSendEventLazy();
      _Block_release(v33);

      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v55, v27);
      uint64_t v34 = *v57;
      sub_10000A9C0();
    }
    while (v34 != v0[12]);
  }
  uint64_t v36 = v0[37];
  uint64_t v35 = v0[38];
  uint64_t v38 = v0[35];
  uint64_t v37 = v0[36];
  swift_bridgeObjectRelease();
  sub_100009F64(v38, &qword_100010108);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
  v39 = (void (*)(uint64_t, uint64_t))v0[57];
  v56 = (void (*)(uint64_t, uint64_t))v0[56];
  uint64_t v40 = v0[53];
  uint64_t v41 = v0[50];
  uint64_t v42 = v0[46];
  uint64_t v43 = v0[44];
  uint64_t v44 = v0[42];
  id v45 = objc_allocWithZone((Class)sub_10000A890());
  uint64_t v58 = sub_10000A880();
  v39(v43, v44);
  v39(v42, v44);
  v56(v40, v41);
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
  swift_task_dealloc();
  uint64_t v46 = (uint64_t (*)(uint64_t))v0[1];
  return v46(v58);
}

uint64_t sub_100006CE0()
{
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_10000A910();
  os_log_type_t v2 = sub_10000AA00();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[14] = v5;
    sub_10000AA10();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Got an error from runAnalysisCommand: %@", v3, 0xCu);
    sub_100007F24(&qword_100010118);
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
  uint64_t v6 = (void (*)(uint64_t, uint64_t))v0[57];
  uint64_t v15 = (void (*)(uint64_t, uint64_t))v0[56];
  uint64_t v7 = v0[53];
  uint64_t v8 = v0[50];
  uint64_t v9 = v0[46];
  uint64_t v10 = v0[44];
  uint64_t v11 = v0[42];
  id v12 = objc_allocWithZone((Class)sub_10000A890());
  uint64_t v16 = sub_10000A880();
  v6(v10, v11);
  v6(v9, v11);
  v15(v7, v8);
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
  swift_task_dealloc();
  unint64_t v13 = (uint64_t (*)(uint64_t))v0[1];
  return v13(v16);
}

void sub_100006FCC(void *a1, uint64_t *a2)
{
  uint64_t v4 = sub_10000A780();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *a2;
  uint64_t v8 = a2[1];
  BOOL v10 = v9 == 1702125924 && v8 == 0xE400000000000000;
  if (v10 || (sub_10000AB20() & 1) != 0)
  {
    sub_10000A7D0();
    if (v19)
    {
      sub_10000A168(&v18, v20);
      swift_dynamicCast();
      uint64_t v11 = sub_10000A850();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      id v12 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v11];
      if (!v12)
      {

        return;
      }
      uint64_t v13 = (uint64_t)v12;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&v20[0] = *a1;
      *a1 = 0x8000000000000000;
      sub_1000096E8(v13, 1702125924, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
      *a1 = *(void *)&v20[0];
      goto LABEL_12;
    }
    __break(1u);
LABEL_15:
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  sub_10000A7D0();
  if (!v19) {
    goto LABEL_15;
  }
  sub_10000A168(&v18, v20);
  sub_10000A178(0, &qword_100010150);
  swift_dynamicCast();
  uint64_t v15 = v17[1];
  char v16 = swift_isUniquelyReferenced_nonNull_native();
  v17[0] = *a1;
  *a1 = 0x8000000000000000;
  sub_1000096E8(v15, v9, v8, v16);
  *a1 = v17[0];
  swift_bridgeObjectRelease();
LABEL_12:
  swift_bridgeObjectRelease();
}

void sub_100007274(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100007F24(&qword_100010148);
    os_log_type_t v2 = (void *)sub_10000AAB0();
  }
  else
  {
    os_log_type_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  int64_t i = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v11 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v11 >= v27) {
    goto LABEL_32;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v11);
  int64_t v13 = i + 1;
  if (!v12)
  {
    int64_t v13 = i + 2;
    if (i + 2 >= v27) {
      goto LABEL_32;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    if (!v12)
    {
      int64_t v13 = i + 3;
      if (i + 3 >= v27) {
        goto LABEL_32;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = i + 4;
        if (i + 4 >= v27) {
          goto LABEL_32;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v14 = i + 5;
          if (i + 5 < v27)
          {
            unint64_t v12 = *(void *)(v28 + 8 * v14);
            if (v12)
            {
              int64_t v13 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v13 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_36;
              }
              if (v13 >= v27) {
                break;
              }
              unint64_t v12 = *(void *)(v28 + 8 * v13);
              ++v14;
              if (v12) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_10000A160();
          return;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v12 - 1) & v12;
  unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
  for (i = v13; ; unint64_t v10 = v9 | (i << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    long long v18 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    id v19 = v18;
    unint64_t v20 = sub_100008FD4(v17, v16);
    unint64_t v21 = v20;
    if (v22)
    {
      uint64_t v7 = (uint64_t *)(v2[6] + 16 * v20);
      swift_bridgeObjectRelease();
      *uint64_t v7 = v17;
      v7[1] = v16;
      uint64_t v8 = v2[7];

      *(void *)(v8 + 8 * v21) = v19;
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v20;
    uint64_t v23 = (uint64_t *)(v2[6] + 16 * v20);
    uint64_t *v23 = v17;
    v23[1] = v16;
    *(void *)(v2[7] + 8 * v20) = v19;
    uint64_t v24 = v2[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_34;
    }
    v2[2] = v26;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

Class sub_100007518(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_10000A178(0, &qword_100010140);
    v4.super.isa = sub_10000A940().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

uint64_t sub_1000075B4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000A75C;
  return sub_10000518C(a1);
}

uint64_t sub_100007648(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000076DC;
  return sub_1000056B0(a1);
}

uint64_t sub_1000076DC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000077D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_1000078BC;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_1000078BC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000079B0(uint64_t a1)
{
  uint64_t v2 = sub_100009CE4(&qword_1000100C8, (void (*)(uint64_t))type metadata accessor for QuartzWorker);

  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100007A2C()
{
  return sub_10000A8C0();
}

unint64_t sub_100007A80(char a1)
{
  uint64_t v2 = sub_10000ABD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v14 = &type metadata for QuartzWorkerConfig;
  LOBYTE(v12) = a1;
  sub_10000ABB0();
  sub_10000ABC0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v6 = sub_100007C24();
  swift_release();
  unint64_t v12 = 0xD000000000000013;
  unint64_t v13 = 0x800000010000B3C0;
  int64_t v11 = v6;
  sub_100007F24(&qword_1000100D0);
  sub_10000A014(&qword_1000100D8, &qword_1000100D0);
  uint64_t v7 = sub_10000A950();
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = v7;
  v15._object = v9;
  sub_10000A980(v15);
  swift_bridgeObjectRelease();
  v16._countAndFlagsBits = 41;
  v16._object = (void *)0xE100000000000000;
  sub_10000A980(v16);
  return v12;
}

void *sub_100007C24()
{
  swift_retain();
  sub_10000AA60();
  swift_release();
  sub_10000AAD0();
  if (*((void *)&v9 + 1))
  {
    uint64_t v0 = _swiftEmptyArrayStorage;
    do
    {
      v6[0] = v7;
      v6[1] = v8;
      v6[2] = v9;
      v1._object = (void *)*((void *)&v7 + 1);
      if (*((void *)&v7 + 1))
      {
        v1._countAndFlagsBits = *(void *)&v6[0];
        sub_10000A980(v1);
        v10._countAndFlagsBits = 8250;
        v10._object = (void *)0xE200000000000000;
        sub_10000A980(v10);
        sub_10000AA70();
        sub_100009F64((uint64_t)v6, &qword_1000100E0);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v0 = sub_1000086E0(0, v0[2] + 1, 1, v0);
        }
        unint64_t v3 = v0[2];
        unint64_t v2 = v0[3];
        if (v3 >= v2 >> 1) {
          uint64_t v0 = sub_1000086E0((void *)(v2 > 1), v3 + 1, 1, v0);
        }
        v0[2] = v3 + 1;
        uint64_t v4 = &v0[2 * v3];
        v4[4] = 0;
        v4[5] = 0xE000000000000000;
      }
      else
      {
        sub_100009F64((uint64_t)v6, &qword_1000100E0);
      }
      sub_10000AAD0();
    }
    while (*((void *)&v9 + 1));
  }
  else
  {
    uint64_t v0 = _swiftEmptyArrayStorage;
  }
  swift_release();
  return v0;
}

unint64_t sub_100007DD0()
{
  return sub_100007A80(*v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for QuartzWorker()
{
  uint64_t result = qword_100010198;
  if (!qword_100010198) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100007EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007F24(&qword_100010010);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_100007F24(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007F68(uint64_t a1)
{
  uint64_t v2 = sub_100007F24(&qword_100010010);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100007FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007F24(&qword_100010010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100008038(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007F24(&qword_100010010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000080A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007F24(&qword_100010010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100008108(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007F24(&qword_100010010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100008170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100008184);
}

uint64_t sub_100008184(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007F24(&qword_100010010);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1000081F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100008208);
}

uint64_t sub_100008208(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007F24(&qword_100010010);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_10000827C()
{
  sub_100008308();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100008308()
{
  if (!qword_100010070)
  {
    sub_100008370();
    sub_1000083C4();
    unint64_t v0 = sub_10000A8E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010070);
    }
  }
}

unint64_t sub_100008370()
{
  unint64_t result = qword_100010078;
  if (!qword_100010078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010078);
  }
  return result;
}

unint64_t sub_1000083C4()
{
  unint64_t result = qword_100010080;
  if (!qword_100010080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010080);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for QuartzWorkerConfig(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for QuartzWorkerConfig(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for QuartzWorkerConfig(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100008594);
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

ValueMetadata *type metadata accessor for QuartzWorkerConfig()
{
  return &type metadata for QuartzWorkerConfig;
}

uint64_t sub_1000085CC()
{
  return sub_100009CE4(&qword_100010008, (void (*)(uint64_t))type metadata accessor for QuartzWorker);
}

uint64_t sub_100008614()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100008698(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *sub_1000086E0(void *result, int64_t a2, char a3, void *a4)
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
      sub_100007F24(&qword_1000100E8);
      Swift::String v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      Swift::String v10 = _swiftEmptyArrayStorage;
      unint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100009AB8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000087F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000088C4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000A104((uint64_t)v12, *a3);
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
      sub_10000A104((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000A0B4((uint64_t)v12);
  return v7;
}

uint64_t sub_1000088C4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000AA20();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100008A80(a5, a6);
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
  uint64_t v8 = sub_10000AA50();
  if (!v8)
  {
    sub_10000AA80();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000AAC0();
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

uint64_t sub_100008A80(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100008B18(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100008CF8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008CF8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100008B18(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100008C90(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000AA40();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000AA80();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000A990();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    sub_10000AAC0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000AA80();
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100008C90(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_100007F24(&qword_100010138);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100008CF8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007F24(&qword_100010138);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_10000AAC0();
  __break(1u);
  return result;
}

uint64_t sub_100008E48(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008E68(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100008E68(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_100007F24(&qword_1000100E8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10000AAC0();
  __break(1u);
  return result;
}

unint64_t sub_100008FD4(uint64_t a1, uint64_t a2)
{
  sub_10000AB80();
  sub_10000A970();
  Swift::Int v4 = sub_10000ABA0();

  return sub_10000904C(a1, a2, v4);
}

unint64_t sub_10000904C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000AB20() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10000AB20() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100009130(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100008FD4(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100009858();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_100009510(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100009200(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007F24(&qword_100010158);
  char v38 = a2;
  uint64_t v6 = sub_10000AAA0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    char v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_10000AB80();
    sub_10000A970();
    uint64_t result = sub_10000ABA0();
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
    long long v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  char v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_100009510(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10000AA30();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10000AB80();
        swift_bridgeObjectRetain();
        sub_10000A970();
        Swift::Int v9 = sub_10000ABA0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_1000096E8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100008FD4(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100009858();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_100009200(v15, a4 & 1);
  unint64_t v20 = sub_100008FD4(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_10000AB30();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

id sub_100009858()
{
  uint64_t v1 = v0;
  sub_100007F24(&qword_100010158);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000AA90();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

uint64_t sub_100009A0C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7552646C756F6873 && a2 == 0xE90000000000006ELL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_10000AB20();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_100009A9C()
{
  return 0x7552646C756F6873;
}

uint64_t sub_100009AB8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_10000AAC0();
  __break(1u);
  return result;
}

void *sub_100009BB0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100009BF4()
{
  unint64_t result = qword_100010430[0];
  if (!qword_100010430[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010430);
  }
  return result;
}

uint64_t sub_100009C48(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100009C80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QuartzWorker();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009CE4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100009D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007F24(&qword_100010108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009D94()
{
  uint64_t v1 = sub_10000A7C0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100009E60()
{
  sub_10000A7C0();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = &_swiftEmptyDictionarySingleton;
  uint64_t v10 = &_swiftEmptyDictionarySingleton;
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (uint64_t *)(v1 + 40);
    do
    {
      uint64_t v5 = *v4;
      v9[0] = *(v4 - 1);
      v9[1] = v5;
      swift_bridgeObjectRetain();
      sub_100006FCC(&v10, v9);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    uint64_t v2 = v10;
  }
  sub_100007274((uint64_t)v2);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_100009F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009F5C()
{
  return swift_release();
}

uint64_t sub_100009F64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100007F24(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100009FC0()
{
  unint64_t result = qword_100010128;
  if (!qword_100010128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010128);
  }
  return result;
}

uint64_t sub_10000A014(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008698(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000A058(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for QuartzWorker();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000A0B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000A104(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000A160()
{
  return swift_release();
}

_OWORD *sub_10000A168(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000A178(uint64_t a1, unint64_t *a2)
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

uint64_t *sub_10000A1B4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t getEnumTagSinglePayload for QuartzWorkerError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for QuartzWorkerError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000A374);
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

uint64_t sub_10000A39C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000A3A8(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for QuartzWorkerError()
{
  return &type metadata for QuartzWorkerError;
}

uint64_t getEnumTagSinglePayload for QuartzWorkerConfig.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for QuartzWorkerConfig.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000A4B4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000A4DC()
{
  return 0;
}

ValueMetadata *type metadata accessor for QuartzWorkerConfig.CodingKeys()
{
  return &type metadata for QuartzWorkerConfig.CodingKeys;
}

unint64_t sub_10000A4F8()
{
  unint64_t result = qword_100010540[0];
  if (!qword_100010540[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010540);
  }
  return result;
}

unint64_t sub_10000A550()
{
  unint64_t result = qword_100010168;
  if (!qword_100010168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010168);
  }
  return result;
}

unint64_t sub_10000A5A8()
{
  unint64_t result = qword_100010170;
  if (!qword_100010170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010170);
  }
  return result;
}

unint64_t sub_10000A600()
{
  unint64_t result = qword_100010178;
  if (!qword_100010178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010178);
  }
  return result;
}

unint64_t sub_10000A658()
{
  unint64_t result = qword_100010180;
  if (!qword_100010180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010180);
  }
  return result;
}

unint64_t sub_10000A6B0()
{
  unint64_t result = qword_1000108D0;
  if (!qword_1000108D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000108D0);
  }
  return result;
}

unint64_t sub_10000A708()
{
  unint64_t result = qword_1000108D8[0];
  if (!qword_1000108D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000108D8);
  }
  return result;
}

uint64_t sub_10000A760()
{
  return static Date.now.getter();
}

uint64_t sub_10000A770()
{
  return Date.advanced(by:)();
}

uint64_t sub_10000A780()
{
  return type metadata accessor for Date();
}

uint64_t sub_10000A790()
{
  return Calendar.startOfDay(for:)();
}

uint64_t sub_10000A7A0()
{
  return static Calendar.current.getter();
}

uint64_t sub_10000A7B0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_10000A7C0()
{
  return type metadata accessor for DataFrame.Row();
}

uint64_t sub_10000A7D0()
{
  return DataFrame.Row.subscript.getter();
}

uint64_t sub_10000A7E0()
{
  return type metadata accessor for DataFrame.Rows();
}

uint64_t sub_10000A7F0()
{
  return DataFrame.rows.getter();
}

uint64_t sub_10000A800()
{
  return DataFrame.columns.getter();
}

uint64_t sub_10000A810()
{
  return type metadata accessor for DataFrame();
}

uint64_t sub_10000A820()
{
  return AnyColumn.name.getter();
}

uint64_t sub_10000A830()
{
  return type metadata accessor for AnyColumn();
}

uint64_t sub_10000A850()
{
  return convertDateIntoNumericRepresentation(date:)();
}

uint64_t sub_10000A860()
{
  return static AppExtension.main()();
}

uint64_t sub_10000A870()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_10000A880()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_10000A890()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_10000A8C0()
{
  return MLHostParameters.init(taskParameters:)();
}

uint64_t sub_10000A8D0()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_10000A8E0()
{
  return type metadata accessor for MLHostParameters();
}

uint64_t sub_10000A8F0()
{
  return MLHostExtensionContext.taskId.getter();
}

uint64_t sub_10000A900()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t sub_10000A910()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000A920()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000A930()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_10000A940()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000A950()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_10000A960()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000A970()
{
  return String.hash(into:)();
}

void sub_10000A980(Swift::String a1)
{
}

Swift::Int sub_10000A990()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000A9A0()
{
  return static Task<>.isCancelled.getter();
}

uint64_t sub_10000A9B0()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_10000A9C0()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_10000A9D0()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_10000A9E0()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_10000A9F0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10000AA00()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000AA10()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000AA20()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000AA30()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10000AA40()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000AA50()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000AA60()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t sub_10000AA70()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10000AA80()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000AA90()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10000AAA0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10000AAB0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000AAC0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000AAD0()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

Swift::Int sub_10000AAE0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000AAF0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10000AB00()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10000AB10()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10000AB20()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000AB30()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000AB40()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10000AB50()
{
  return Error._code.getter();
}

uint64_t sub_10000AB60()
{
  return Error._domain.getter();
}

uint64_t sub_10000AB70()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000AB80()
{
  return Hasher.init(_seed:)();
}

void sub_10000AB90(Swift::UInt a1)
{
}

Swift::Int sub_10000ABA0()
{
  return Hasher._finalize()();
}

uint64_t sub_10000ABB0()
{
  return Mirror.init(reflecting:)();
}

uint64_t sub_10000ABC0()
{
  return Mirror.children.getter();
}

uint64_t sub_10000ABD0()
{
  return type metadata accessor for Mirror();
}

uint64_t sub_10000ABE0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10000ABF0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
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

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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