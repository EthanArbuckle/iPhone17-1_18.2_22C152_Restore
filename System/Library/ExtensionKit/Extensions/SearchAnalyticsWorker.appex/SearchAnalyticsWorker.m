uint64_t sub_1000042BC(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v22;
  uint64_t v23;

  v3 = sub_1000070F0();
  v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = a1;
  swift_errorRetain();
  sub_100004DE8(&qword_10000C1D8);
  if (swift_dynamicCast())
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    if (qword_10000C108 != -1) {
      swift_once();
    }
    v7 = sub_1000070B0();
    sub_100004DB0(v7, (uint64_t)qword_10000C278);
    swift_retain_n();
    v8 = sub_100007090();
    v9 = sub_100007100();
    if (os_log_type_enabled(v8, v9))
    {
      sub_100004E5C();
      v10 = (void *)sub_100004E8C();
      sub_100004E78(5.7779e-34);
      v23 = (uint64_t)v1;
      v11 = v1;
      sub_100007130();
      *v10 = v1;
      sub_100004E44();
      sub_100004EA4((void *)&_mh_execute_header, v12, v13, "On-demand task is interrupted: %@");
      sub_100004DE8(&qword_10000C1D0);
      swift_arrayDestroy();
      sub_100004E2C();
      sub_100004E2C();
    }
    else
    {

      sub_100004E44();
    }
  }
  else
  {
    if (qword_10000C108 != -1) {
      swift_once();
    }
    v14 = sub_1000070B0();
    sub_100004DB0(v14, (uint64_t)qword_10000C278);
    swift_errorRetain();
    swift_errorRetain();
    v15 = sub_100007090();
    v16 = sub_100007110();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)sub_100004E5C();
      v18 = (void *)sub_100004E8C();
      *(_DWORD *)v17 = 138412290;
      swift_errorRetain();
      v19 = _swift_stdlib_bridgeErrorToNSError();
      v23 = v19;
      sub_100007130();
      *v18 = v19;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Unexpected error: %@", v17, 0xCu);
      sub_100004DE8(&qword_10000C1D0);
      swift_arrayDestroy();
      sub_100004E2C();
      sub_100004E2C();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  v20 = objc_allocWithZone((Class)sub_100006F70());
  return sub_100006F60();
}

uint64_t sub_10000464C()
{
  uint64_t v2 = v0;
  if (qword_10000C108 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1000070B0();
  sub_100004DB0(v3, (uint64_t)qword_10000C278);
  swift_retain_n();
  v4 = sub_100007090();
  os_log_type_t v5 = sub_100007100();
  v6 = sub_100007000;
  if (os_log_type_enabled(v4, v5))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (void *)sub_100004E8C();
    *(_DWORD *)v7 = 138412290;
    v1 = v7 + 4;
    v18 = *(void **)(v2 + 32);
    id v9 = v18;
    v6 = sub_100007000;
    sub_100007130();
    void *v8 = v18;
    sub_100004E44();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "On-demand task started: %@", v7, 0xCu);
    sub_100004DE8(&qword_10000C1D0);
    swift_arrayDestroy();
    sub_100004E2C();
    sub_100004E2C();
  }
  else
  {

    sub_100004E44();
  }
  sub_1000048FC();
  swift_retain_n();
  v10 = sub_100007090();
  os_log_type_t v11 = sub_100007100();
  if (os_log_type_enabled(v10, v11))
  {
    sub_100004E5C();
    v12 = (void *)sub_100004E8C();
    sub_100004E78(COERCE_FLOAT(*((void *)v6 + 159)));
    id v13 = v1;
    sub_100007130();
    void *v12 = v1;
    sub_100004E44();
    sub_100004EA4((void *)&_mh_execute_header, v14, v15, "On-demand task is finished: %@");
    sub_100004DE8(&qword_10000C1D0);
    swift_arrayDestroy();
    sub_100004E2C();
    sub_100004E2C();
  }
  else
  {

    sub_100004E44();
  }
  id v16 = objc_allocWithZone((Class)sub_100006F70());
  return sub_100006F60();
}

uint64_t sub_1000048FC()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = 0;
  uint64_t v2 = self;
  swift_bridgeObjectRetain();
  id v3 = [v2 defaultManager];
  sub_100007080();
  swift_allocObject();
  sub_100007070();
  sub_100006FB0();
  sub_100006FC0();
  sub_100007060();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = v0;
  swift_retain();
  swift_retain();
  sub_100006FF0();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_100004A8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v5 = (void *)(a2 + 16);
  swift_beginAccess();
  uint64_t v6 = *(void *)(a2 + 16);
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7)
  {
    __break(1u);
  }
  else
  {
    *os_log_type_t v5 = v8;
    if (qword_10000C108 == -1) {
      goto LABEL_3;
    }
  }
  swift_once();
LABEL_3:
  uint64_t v9 = sub_1000070B0();
  sub_100004DB0(v9, (uint64_t)qword_10000C278);
  swift_retain_n();
  swift_retain();
  v10 = sub_100007090();
  os_log_type_t v11 = sub_100007100();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v15 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134218242;
    swift_beginAccess();
    sub_100007130();
    swift_release();
    *(_WORD *)(v12 + 12) = 2112;
    id v16 = *(void **)(a3 + 32);
    id v13 = v16;
    sub_100007130();
    *uint64_t v15 = v16;
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "On-demand task completed %ld iteration(s): %@", (uint8_t *)v12, 0x16u);
    sub_100004DE8(&qword_10000C1D0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
    swift_release();
  }
  return 1;
}

uint64_t sub_100004CC0()
{
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_100004CE8()
{
  sub_100004CC0();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for SAWTask()
{
  return self;
}

uint64_t sub_100004D40()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100004D50()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100004D90(uint64_t a1)
{
  return sub_100004A8C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24)) & 1;
}

uint64_t sub_100004DB0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100004DE8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004E2C()
{
  return swift_slowDealloc();
}

uint64_t sub_100004E44()
{
  return swift_release_n();
}

uint64_t sub_100004E5C()
{
  return swift_slowAlloc();
}

void sub_100004E78(float a1)
{
  float *v1 = a1;
}

uint64_t sub_100004E8C()
{
  return swift_slowAlloc();
}

void sub_100004EA4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_100004EC4()
{
  uint64_t v0 = sub_100006FE0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  id v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for KnownAggregationProcessBundleId.SearchAnalyticsWorker(_:), v0);
  uint64_t v4 = sub_100006FD0();
  uint64_t v6 = v5;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_10000C250 = v4;
  *(void *)algn_10000C258 = v6;
  return result;
}

uint64_t sub_100004FC4()
{
  uint64_t result = sub_100007010();
  byte_10000C260 = result & 1;
  return result;
}

uint64_t sub_100004FE8()
{
  return sub_100006DA0((uint64_t)sub_100004FFC);
}

uint64_t sub_100004FFC()
{
  id v1 = [self defaultManager];
  id v2 = objc_allocWithZone((Class)NSUserDefaults);
  id v3 = sub_100006384(0xD000000000000011, 0x8000000100007920);
  uint64_t v4 = sub_100007050();

  if (v4)
  {
    char v5 = sub_100005264();
    swift_unknownObjectRelease();
    LOBYTE(v4) = v5 ^ 1;
  }
  if (qword_10000C0F8 != -1) {
    swift_once();
  }
  if (v4 & 1 | ((byte_10000C260 & 1) == 0))
  {
    if (qword_10000C108 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1000070B0();
    sub_100004DB0(v6, (uint64_t)qword_10000C278);
    uint64_t v7 = sub_100007090();
    os_log_type_t v8 = sub_100007100();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = "On-demand task detected, but feature disabled";
LABEL_14:
      os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, v9, v11, 2u);
      sub_100004E2C();
    }
  }
  else
  {
    if (qword_10000C108 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1000070B0();
    sub_100004DB0(v10, (uint64_t)qword_10000C278);
    uint64_t v7 = sub_100007090();
    os_log_type_t v8 = sub_100007100();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = "On-demand task detected";
      goto LABEL_14;
    }
  }

  objc_allocWithZone((Class)sub_100006F70());
  uint64_t v12 = sub_100006F60();
  id v13 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v13(v12);
}

uint64_t sub_100005264()
{
  NSString v1 = sub_1000070C0();
  unsigned int v2 = [v0 configBoolForKey:v1];

  return v2 ^ 1;
}

uint64_t sub_1000052C0(uint64_t a1)
{
  uint64_t v3 = sub_100004DE8(&qword_10000C220);
  v1[5] = v3;
  v1[6] = *(void *)(v3 - 8);
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  sub_100004DE8(&qword_10000C228);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  uint64_t v4 = swift_task_alloc();
  v1[11] = v4;
  char v5 = (void *)swift_task_alloc();
  v1[12] = v5;
  uint64_t v6 = sub_100007000();
  v1[13] = v6;
  unint64_t v7 = sub_100006338();
  uint64_t v8 = sub_100006D40(&qword_10000C230);
  uint64_t v9 = sub_100006D40(&qword_10000C238);
  *char v5 = v1;
  v5[1] = sub_1000054A4;
  return MLHostExtension.loadConfig<A>(context:)(v4, a1, &type metadata for SearchAnalyticsWorker, v6, v7, v8, v9);
}

uint64_t sub_1000054A4()
{
  sub_100006DBC();
  sub_100006D88();
  uint64_t v1 = *v0;
  sub_100006DAC();
  *unsigned int v2 = v1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100005570, 0, 0);
}

uint64_t sub_100005570()
{
  v39 = v0;
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[10];
  sub_100006C50(v0[11], v2);
  if (sub_100006CB8(v2, 1, v1) == 1)
  {
    sub_100006CE0(v0[10]);
    if (qword_10000C108 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_1000070B0();
    sub_100004DB0(v3, (uint64_t)qword_10000C278);
    uint64_t v4 = sub_100007090();
    os_log_type_t v5 = sub_100007100();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "No valid config found", v6, 2u);
      sub_100004E2C();
    }
  }
  else
  {
    (*(void (**)(void, void, void))(v0[6] + 32))(v0[8], v0[10], v0[5]);
    if (qword_10000C108 != -1) {
      swift_once();
    }
    uint64_t v8 = v0[7];
    uint64_t v7 = v0[8];
    uint64_t v9 = v0[5];
    uint64_t v10 = v0[6];
    uint64_t v11 = sub_1000070B0();
    sub_100004DB0(v11, (uint64_t)qword_10000C278);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v7, v9);
    uint64_t v12 = sub_100007090();
    os_log_type_t v13 = sub_100007100();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v35 = v0[7];
      uint64_t v14 = v0[5];
      uint64_t v36 = v0[6];
      uint64_t v37 = v0[8];
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      sub_100006FA0();
      sub_100006D40(&qword_10000C240);
      uint64_t v16 = sub_100007190();
      unint64_t v18 = v17;
      swift_release();
      v0[4] = sub_1000063E8(v16, v18, &v38);
      sub_100007130();
      swift_bridgeObjectRelease();
      v19 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
      v19(v35, v14);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Config found. Task params: %s", v15, 0xCu);
      swift_arrayDestroy();
      sub_100004E2C();
      sub_100004E2C();

      v19(v37, v14);
    }
    else
    {
      uint64_t v21 = v0[7];
      uint64_t v20 = v0[8];
      uint64_t v22 = v0[5];
      uint64_t v23 = v0[6];

      v24 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
      v24(v21, v22);
      v24(v20, v22);
    }
  }
  uint64_t v25 = v0[9];
  uint64_t v26 = v0[5];
  sub_100006C50(v0[11], v25);
  int v27 = sub_100006CB8(v25, 1, v26);
  uint64_t v28 = v0[11];
  uint64_t v29 = v0[9];
  if (v27 == 1)
  {
    sub_100006CE0(v0[11]);
    sub_100006CE0(v29);
    uint64_t v30 = 0;
  }
  else
  {
    uint64_t v31 = v0[5];
    uint64_t v32 = v0[6];
    sub_100006FA0();
    sub_100006CE0(v28);
    uint64_t v30 = v0[2];
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v29, v31);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v33 = (uint64_t (*)(uint64_t))v0[1];
  return v33(v30);
}

uint64_t sub_1000059C8(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return sub_100006DA0((uint64_t)sub_1000059E0);
}

uint64_t sub_1000059E0()
{
  sub_100007040();
  swift_allocObject();
  sub_100007030();
  sub_100007020();
  swift_release();
  if (qword_10000C0F0 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)v0[4];
  uint64_t v3 = qword_10000C250;
  uint64_t v4 = *(void *)algn_10000C258;
  type metadata accessor for SAWTask();
  os_log_type_t v5 = (void *)swift_allocObject();
  v0[5] = v5;
  v5[3] = v4;
  v5[4] = v2;
  v5[2] = v3;
  swift_bridgeObjectRetain();
  id v6 = v2;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[6] = v7;
  void *v7 = v0;
  v7[1] = sub_100005CE4;
  uint64_t v8 = v0[4];
  return sub_1000052C0(v8);
}

uint64_t sub_100005CE4()
{
  sub_100006DBC();
  sub_100006D88();
  *(void *)(v1 + 56) = v0;
  swift_task_dealloc();
  return _swift_task_switch(sub_100005DBC, 0, 0);
}

uint64_t sub_100005DBC()
{
  uint64_t v1 = sub_10000464C();
  swift_release();
  swift_release();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_100005E44()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100006D84;
  return sub_100004FE8();
}

uint64_t sub_100005ED0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005F64;
  return sub_1000059C8(a1);
}

uint64_t sub_100005F64()
{
  sub_100006DBC();
  uint64_t v2 = v1;
  sub_100006D88();
  uint64_t v3 = *v0;
  sub_100006DAC();
  void *v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_100006030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_100006114;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100006114()
{
  sub_100006DBC();
  sub_100006D88();
  uint64_t v1 = *v0;
  sub_100006DAC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_1000061D8(uint64_t a1)
{
  unint64_t v2 = sub_100006338();

  return MLHostExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100006284()
{
  unint64_t result = qword_10000C1E0[0];
  if (!qword_10000C1E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C1E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchAnalyticsWorker()
{
  return &type metadata for SearchAnalyticsWorker;
}

uint64_t sub_1000062E4()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100006338()
{
  unint64_t result = qword_10000C200;
  if (!qword_10000C200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10000C200);
  }
  return result;
}

id sub_100006384(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v3 = sub_1000070C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  id v4 = [v2 initWithSuiteName:v3];

  return v4;
}

uint64_t sub_1000063E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000064BC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006664((uint64_t)v12, *a3);
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
      sub_100006664((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006614((uint64_t)v12);
  return v7;
}

uint64_t sub_1000064BC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1000066C0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_100007140();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_100006798(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_100007160();
    if (!v8)
    {
      uint64_t result = sub_100007170();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100006614(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006664(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_1000066C0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100007180();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_100006798(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_100006830(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_100006A0C(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    unint64_t v2 = sub_100006A0C((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100006830(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_1000070E0();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_1000069A4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100007150();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_100007180();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_100007170();
  __break(1u);
  return result;
}

void *sub_1000069A4(uint64_t a1, uint64_t a2)
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
  sub_100004DE8(&qword_10000C218);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100006A0C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004DE8(&qword_10000C218);
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
  os_log_type_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100006BBC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100006AE4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100006AE4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100007180();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_100006BBC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_100007180();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_100006C50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004DE8(&qword_10000C228);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006CB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100006CE0(uint64_t a1)
{
  uint64_t v2 = sub_100004DE8(&qword_10000C228);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006D40(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007000();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006DA0(uint64_t a1)
{
  return _swift_task_switch(a1, 0, 0);
}

uint64_t sub_100006DC8()
{
  if (qword_10000C0F0 != -1) {
    swift_once();
  }
  qword_10000C268 = qword_10000C250;
  unk_10000C270 = *(void *)algn_10000C258;

  return swift_bridgeObjectRetain();
}

uint64_t sub_100006E34()
{
  uint64_t v0 = sub_1000070B0();
  sub_100006EEC(v0, qword_10000C278);
  sub_100004DB0(v0, (uint64_t)qword_10000C278);
  if (qword_10000C100 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_1000070A0();
}

uint64_t *sub_100006EEC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006F50()
{
  return static AppExtension.main()();
}

uint64_t sub_100006F60()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100006F70()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100006FA0()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_100006FB0()
{
  return MLHostExtensionContext.taskId.getter();
}

uint64_t sub_100006FC0()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t sub_100006FD0()
{
  return KnownAggregationProcessBundleId.rawValue.getter();
}

uint64_t sub_100006FE0()
{
  return type metadata accessor for KnownAggregationProcessBundleId();
}

uint64_t sub_100006FF0()
{
  return SODAHostTask.conclude(with:)();
}

uint64_t sub_100007000()
{
  return type metadata accessor for SODAHostParams();
}

uint64_t sub_100007010()
{
  return static SODAFeatureFlags.isSearchAnalyticsWorkerEnabled.getter();
}

uint64_t sub_100007020()
{
  return dispatch thunk of SODAStreamPruner.pruneStreams()();
}

uint64_t sub_100007030()
{
  return SODAStreamPruner.init(userDefaults:fileManager:)();
}

uint64_t sub_100007040()
{
  return type metadata accessor for SODAStreamPruner();
}

uint64_t sub_100007050()
{
  return static ConfigPlistLoader.loadConfig(fileManager:userDefaults:)();
}

uint64_t sub_100007060()
{
  return dispatch thunk of SODARegisteredHostTaskFactory.makeTask(taskId:taskName:hostParams:)();
}

uint64_t sub_100007070()
{
  return SODARegisteredHostTaskFactory.init(taskNamePrefix:fileManager:userDefaults:)();
}

uint64_t sub_100007080()
{
  return type metadata accessor for SODARegisteredHostTaskFactory();
}

uint64_t sub_100007090()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000070A0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000070B0()
{
  return type metadata accessor for Logger();
}

NSString sub_1000070C0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000070D0()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_1000070E0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000070F0()
{
  return type metadata accessor for CancellationError();
}

uint64_t sub_100007100()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100007110()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100007120()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100007130()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100007140()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100007150()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100007160()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100007170()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100007180()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100007190()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

{
}

{
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

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}