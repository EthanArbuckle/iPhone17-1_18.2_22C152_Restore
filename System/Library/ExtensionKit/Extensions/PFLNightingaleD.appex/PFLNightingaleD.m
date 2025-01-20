uint64_t sub_100002C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v7;
  uint64_t v9;

  v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100003A6C;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_100002CEC(uint64_t a1)
{
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_100008038 + dword_100008038);
  v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100002D94;
  return v5(a1);
}

uint64_t sub_100002D94(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100002E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  void *v15 = v7;
  v15[1] = sub_100002F74;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100002F74()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100003068(uint64_t a1)
{
  unint64_t v2 = sub_1000031D0();

  return MLHostExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003114()
{
  unint64_t result = qword_100008010[0];
  if (!qword_100008010[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100008010);
  }
  return result;
}

ValueMetadata *type metadata accessor for PFLNightingaleD()
{
  return &type metadata for PFLNightingaleD;
}

uint64_t sub_10000317C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_1000031D0()
{
  unint64_t result = qword_100008030;
  if (!qword_100008030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008030);
  }
  return result;
}

uint64_t sub_100003224(uint64_t a1)
{
  v1[9] = a1;
  uint64_t v2 = sub_100003AA0();
  v1[10] = v2;
  v1[11] = *(void *)(v2 - 8);
  v1[12] = swift_task_alloc();
  uint64_t v3 = sub_100003B00();
  v1[13] = v3;
  v1[14] = *(void *)(v3 - 8);
  v1[15] = swift_task_alloc();
  uint64_t v4 = sub_100003B50();
  v1[16] = v4;
  v1[17] = *(void *)(v4 - 8);
  v1[18] = swift_task_alloc();
  return _swift_task_switch(sub_10000339C, 0, 0);
}

uint64_t sub_10000339C()
{
  id v1 = [self mainBundle];
  id v2 = [v1 bundleIdentifier];

  if (v2)
  {
    uint64_t v3 = v0[15];
    uint64_t v4 = v0[14];
    uint64_t v16 = v0[13];
    uint64_t v5 = v0[11];
    uint64_t v17 = v0[12];
    uint64_t v18 = v0[10];
    sub_100003B80();

    v0[7] = &type metadata for PFLNightingaleD;
    sub_1000038EC(&qword_100008040);
    sub_100003B90();
    sub_1000038EC(&qword_100008048);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_100003CD0;
    sub_100003B20();
    sub_100003B30();
    sub_100003B40();
    sub_100003B10();
    v0[8] = v6;
    sub_1000039D4(&qword_100008050, (void (*)(uint64_t))&type metadata accessor for PFLPluginConsent);
    sub_1000038EC(&qword_100008058);
    sub_100003930();
    sub_100003BA0();
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, enum case for PFLTaskSource.CKProd(_:), v16);
    sub_100003B70();
    swift_allocObject();
    v0[19] = sub_100003B60();
    uint64_t v7 = sub_100003A90();
    (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v17, enum case for HIDPFLUseCase.NightingaleD_CK(_:), v18);
    uint64_t v8 = sub_100003A80();
    v0[20] = v8;
    v0[5] = v7;
    uint64_t v9 = sub_1000039D4(&qword_100008068, (void (*)(uint64_t))&type metadata accessor for NightingaleDPFLRunner);
    v0[2] = v8;
    v0[6] = v9;
    v19 = (char *)&async function pointer to dispatch thunk of PFLPlugin.run(context:runner:)
        + async function pointer to dispatch thunk of PFLPlugin.run(context:runner:);
    swift_retain();
    v10 = (void *)swift_task_alloc();
    v0[21] = v10;
    void *v10 = v0;
    v10[1] = sub_100003748;
    uint64_t v11 = v0[9];
    return ((uint64_t (*)(uint64_t, void *))v19)(v11, v0 + 2);
  }
  else
  {
    id v13 = objc_allocWithZone((Class)sub_100003AC0());
    uint64_t v14 = sub_100003AB0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v15 = (uint64_t (*)(uint64_t))v0[1];
    return v15(v14);
  }
}

uint64_t sub_100003748(uint64_t a1)
{
  uint64_t v2 = *(void *)v1 + 16;
  *(void *)(*(void *)v1 + 176) = a1;
  swift_task_dealloc();
  sub_100003A1C(v2);
  return _swift_task_switch(sub_100003854, 0, 0);
}

uint64_t sub_100003854()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 176);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1000038EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003930()
{
  unint64_t result = qword_100008060;
  if (!qword_100008060)
  {
    sub_10000398C(&qword_100008058);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008060);
  }
  return result;
}

uint64_t sub_10000398C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000039D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100003A1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003A70()
{
  return static AppExtension.main()();
}

uint64_t sub_100003A80()
{
  return NightingaleDPFLRunner.__allocating_init(useCase:)();
}

uint64_t sub_100003A90()
{
  return type metadata accessor for NightingaleDPFLRunner();
}

uint64_t sub_100003AA0()
{
  return type metadata accessor for HIDPFLUseCase();
}

uint64_t sub_100003AB0()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100003AC0()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100003B00()
{
  return type metadata accessor for PFLTaskSource();
}

uint64_t sub_100003B10()
{
  return static PFLPluginConsent.PrivacyBudget.getter();
}

uint64_t sub_100003B20()
{
  return static PFLPluginConsent.DNU.getter();
}

uint64_t sub_100003B30()
{
  return static PFLPluginConsent.IHA.getter();
}

uint64_t sub_100003B40()
{
  return static PFLPluginConsent.Unlocked.getter();
}

uint64_t sub_100003B50()
{
  return type metadata accessor for PFLPluginConsent();
}

uint64_t sub_100003B60()
{
  return PFLPlugin.init(plugin:useCase:consent:taskSource:)();
}

uint64_t sub_100003B70()
{
  return type metadata accessor for PFLPlugin();
}

uint64_t sub_100003B80()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100003B90()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100003BA0()
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