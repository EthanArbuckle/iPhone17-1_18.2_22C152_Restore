uint64_t sub_1000026D8()
{
  uint64_t v0;
  void *v1;
  uint64_t (__cdecl *v3)();
  uint64_t v4;

  v3 = (uint64_t (__cdecl *)())((char *)&dword_100008058 + dword_100008058);
  v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1000039CC;
  return v3();
}

uint64_t sub_100002778(uint64_t a1)
{
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_100008028 + dword_100008028);
  v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100002820;
  return v5(a1);
}

uint64_t sub_100002820(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_10000291C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  void *v15 = v7;
  v15[1] = sub_100002A00;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100002A00()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100002AF4(uint64_t a1)
{
  unint64_t v2 = sub_100002C5C();

  return MLHostExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100002BA0()
{
  unint64_t result = qword_100008000[0];
  if (!qword_100008000[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100008000);
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriMASPFLPlugin()
{
  return &type metadata for SiriMASPFLPlugin;
}

uint64_t sub_100002C08()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100002C5C()
{
  unint64_t result = qword_100008020;
  if (!qword_100008020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008020);
  }
  return result;
}

uint64_t sub_100002CB0()
{
  sub_1000037EC(&qword_100008060);
  v0[2] = swift_task_alloc();
  uint64_t v1 = sub_100003A10();
  v0[3] = v1;
  v0[4] = *(void *)(v1 - 8);
  v0[5] = swift_task_alloc();
  v0[6] = swift_task_alloc();
  sub_1000037EC(&qword_100008068);
  v0[7] = swift_task_alloc();
  sub_1000037EC((uint64_t *)&unk_100008070);
  v0[8] = swift_task_alloc();
  uint64_t v2 = sub_1000039E0();
  v0[9] = v2;
  v0[10] = *(void *)(v2 - 8);
  v0[11] = swift_task_alloc();
  uint64_t v3 = sub_100003A20();
  v0[12] = v3;
  v0[13] = *(void *)(v3 - 8);
  v0[14] = swift_task_alloc();
  uint64_t v4 = sub_100003A50();
  v0[15] = v4;
  v0[16] = *(void *)(v4 - 8);
  v0[17] = swift_task_alloc();
  return _swift_task_switch(sub_100002F20, 0, 0);
}

uint64_t sub_100002F20()
{
  uint64_t v1 = v0[16];
  uint64_t v3 = v0[14];
  uint64_t v2 = v0[15];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[13];
  uint64_t v7 = v0[7];
  uint64_t v6 = v0[8];
  uint64_t v8 = v0[4];
  uint64_t v27 = v0[2];
  uint64_t v28 = v0[3];
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v3, enum case for Calendar.Identifier.gregorian(_:), v4);
  sub_100003A30();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56))(v6, 1, 1, v2);
  uint64_t v9 = sub_100003A60();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  sub_1000039D0();
  sub_100003A00();
  sub_100003A40();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v27, 1, v28) == 1)
  {
    sub_10000396C(v0[2]);
  }
  else
  {
    (*(void (**)(void, void, void))(v0[4] + 32))(v0[5], v0[2], v0[3]);
    char v10 = sub_1000039F0();
    uint64_t v12 = v0[4];
    uint64_t v11 = v0[5];
    uint64_t v13 = v0[3];
    if (v10)
    {
      id v14 = objc_allocWithZone((Class)sub_100003AB0());
      uint64_t v29 = sub_100003AA0();
      v15 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
      v15(v11, v13);
      v16 = v15;
      goto LABEL_7;
    }
    (*(void (**)(void, void))(v12 + 8))(v0[5], v0[3]);
  }
  uint64_t v17 = v0[4];
  id v18 = objc_allocWithZone((Class)sub_100003AB0());
  uint64_t v29 = sub_100003AA0();
  v16 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
LABEL_7:
  uint64_t v20 = v0[16];
  uint64_t v19 = v0[17];
  uint64_t v21 = v0[15];
  uint64_t v22 = v0[10];
  uint64_t v23 = v0[11];
  uint64_t v24 = v0[9];
  v16(v0[6], v0[3]);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v25 = (uint64_t (*)(uint64_t))v0[1];
  return v25(v29);
}

uint64_t sub_1000032A8(uint64_t a1)
{
  v1[8] = a1;
  uint64_t v2 = sub_100003AE0();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v3 = sub_100003B10();
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  return _swift_task_switch(sub_1000033C4, 0, 0);
}

uint64_t sub_1000033C4()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  sub_1000037EC(&qword_100008030);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100003C60;
  sub_100003B00();
  sub_100003AF0();
  v0[7] = v4;
  sub_1000038D4(&qword_100008038, (void (*)(uint64_t))&type metadata accessor for PFLPluginConsent);
  sub_1000037EC(&qword_100008040);
  sub_100003830();
  sub_100003B40();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for PFLTaskSource.CKProd(_:), v2);
  sub_100003B30();
  swift_allocObject();
  v0[15] = sub_100003B20();
  uint64_t v5 = sub_100003A80();
  swift_allocObject();
  uint64_t v6 = sub_100003A70();
  v0[16] = v6;
  v0[5] = v5;
  uint64_t v7 = sub_1000038D4(&qword_100008050, (void (*)(uint64_t))&type metadata accessor for SiriMASPFLPluginRunner);
  v0[2] = v6;
  v0[6] = v7;
  uint64_t v11 = (char *)&async function pointer to dispatch thunk of PFLPlugin.run(context:runner:)
      + async function pointer to dispatch thunk of PFLPlugin.run(context:runner:);
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[17] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_100003654;
  uint64_t v9 = v0[8];
  return ((uint64_t (*)(uint64_t, void *))v11)(v9, v0 + 2);
}

uint64_t sub_100003654(uint64_t a1)
{
  uint64_t v2 = *(void *)v1 + 16;
  *(void *)(*(void *)v1 + 144) = a1;
  swift_task_dealloc();
  sub_10000391C(v2);
  return _swift_task_switch(sub_100003760, 0, 0);
}

uint64_t sub_100003760()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 144);
  return v1(v2);
}

uint64_t sub_1000037EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003830()
{
  unint64_t result = qword_100008048;
  if (!qword_100008048)
  {
    sub_10000388C(&qword_100008040);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008048);
  }
  return result;
}

uint64_t sub_10000388C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000038D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000391C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000396C(uint64_t a1)
{
  uint64_t v2 = sub_1000037EC(&qword_100008060);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000039D0()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t sub_1000039E0()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_1000039F0()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_100003A00()
{
  return Date.init()();
}

uint64_t sub_100003A10()
{
  return type metadata accessor for Date();
}

uint64_t sub_100003A20()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t sub_100003A30()
{
  return Calendar.init(identifier:)();
}

uint64_t sub_100003A40()
{
  return Calendar.date(from:)();
}

uint64_t sub_100003A50()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_100003A60()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_100003A70()
{
  return SiriMASPFLPluginRunner.init()();
}

uint64_t sub_100003A80()
{
  return type metadata accessor for SiriMASPFLPluginRunner();
}

uint64_t sub_100003A90()
{
  return static AppExtension.main()();
}

uint64_t sub_100003AA0()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100003AB0()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100003AE0()
{
  return type metadata accessor for PFLTaskSource();
}

uint64_t sub_100003AF0()
{
  return static PFLPluginConsent.PrivacyBudget.getter();
}

uint64_t sub_100003B00()
{
  return static PFLPluginConsent.DNU.getter();
}

uint64_t sub_100003B10()
{
  return type metadata accessor for PFLPluginConsent();
}

uint64_t sub_100003B20()
{
  return PFLPlugin.init(plugin:useCase:consent:taskSource:)();
}

uint64_t sub_100003B30()
{
  return type metadata accessor for PFLPlugin();
}

uint64_t sub_100003B40()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}