uint64_t sub_100002D80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v7;
  uint64_t v9;

  v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100003ACC;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_100002E30(uint64_t a1)
{
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_100008028 + dword_100008028);
  v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100002ED8;
  return v5(a1);
}

uint64_t sub_100002ED8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100002FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  void *v15 = v7;
  v15[1] = sub_1000030B8;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_1000030B8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000031AC(uint64_t a1)
{
  unint64_t v2 = sub_100003314();

  return MLHostExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003258()
{
  unint64_t result = qword_100008000[0];
  if (!qword_100008000[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100008000);
  }
  return result;
}

ValueMetadata *type metadata accessor for PFLHRPeriodPredPushPlugin()
{
  return &type metadata for PFLHRPeriodPredPushPlugin;
}

uint64_t sub_1000032C0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100003314()
{
  unint64_t result = qword_100008020;
  if (!qword_100008020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008020);
  }
  return result;
}

uint64_t sub_100003368(uint64_t a1)
{
  v1[8] = a1;
  uint64_t v2 = sub_100003B00();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v3 = sub_100003B50();
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  uint64_t v4 = sub_100003BA0();
  v1[15] = v4;
  v1[16] = *(void *)(v4 - 8);
  v1[17] = swift_task_alloc();
  return _swift_task_switch(sub_1000034E0, 0, 0);
}

uint64_t sub_1000034E0()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[13];
  uint64_t v11 = v0[12];
  uint64_t v3 = v0[10];
  uint64_t v12 = v0[11];
  uint64_t v13 = v0[9];
  sub_100003B40();
  sub_10000394C(&qword_100008030);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100003CA0;
  sub_100003B70();
  sub_100003B80();
  sub_100003B90();
  sub_100003B60();
  v0[7] = v4;
  sub_100003A34(&qword_100008038, (void (*)(uint64_t))&type metadata accessor for PFLPluginConsent);
  sub_10000394C(&qword_100008040);
  sub_100003990();
  sub_100003BD0();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for PFLTaskSource.CKProd(_:), v11);
  sub_100003BC0();
  swift_allocObject();
  v0[18] = sub_100003BB0();
  uint64_t v5 = sub_100003AF0();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v12, enum case for HIDPFLUseCase.HR_Period_Prediction_Push(_:), v13);
  uint64_t v6 = sub_100003AE0();
  v0[19] = v6;
  v0[5] = v5;
  uint64_t v7 = sub_100003A34((unint64_t *)&unk_100008050, (void (*)(uint64_t))&type metadata accessor for NightingalePFLRunner);
  v0[2] = v6;
  v0[6] = v7;
  v14 = (char *)&async function pointer to dispatch thunk of PFLPlugin.run(context:runner:)
      + async function pointer to dispatch thunk of PFLPlugin.run(context:runner:);
  swift_retain();
  v8 = (void *)swift_task_alloc();
  v0[20] = v8;
  void *v8 = v0;
  v8[1] = sub_1000037A8;
  uint64_t v9 = v0[8];
  return ((uint64_t (*)(uint64_t, void *))v14)(v9, v0 + 2);
}

uint64_t sub_1000037A8(uint64_t a1)
{
  uint64_t v2 = *(void *)v1 + 16;
  *(void *)(*(void *)v1 + 168) = a1;
  swift_task_dealloc();
  sub_100003A7C(v2);
  return _swift_task_switch(sub_1000038B4, 0, 0);
}

uint64_t sub_1000038B4()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 168);
  return v1(v2);
}

uint64_t sub_10000394C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003990()
{
  unint64_t result = qword_100008048;
  if (!qword_100008048)
  {
    sub_1000039EC(&qword_100008040);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008048);
  }
  return result;
}

uint64_t sub_1000039EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003A34(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100003A7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003AD0()
{
  return static AppExtension.main()();
}

uint64_t sub_100003AE0()
{
  return NightingalePFLRunner.__allocating_init(useCase:)();
}

uint64_t sub_100003AF0()
{
  return type metadata accessor for NightingalePFLRunner();
}

uint64_t sub_100003B00()
{
  return type metadata accessor for HIDPFLUseCase();
}

uint64_t sub_100003B40()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t sub_100003B50()
{
  return type metadata accessor for PFLTaskSource();
}

uint64_t sub_100003B60()
{
  return static PFLPluginConsent.PrivacyBudget.getter();
}

uint64_t sub_100003B70()
{
  return static PFLPluginConsent.DNU.getter();
}

uint64_t sub_100003B80()
{
  return static PFLPluginConsent.IHA.getter();
}

uint64_t sub_100003B90()
{
  return static PFLPluginConsent.Unlocked.getter();
}

uint64_t sub_100003BA0()
{
  return type metadata accessor for PFLPluginConsent();
}

uint64_t sub_100003BB0()
{
  return PFLPlugin.init(plugin:useCase:consent:taskSource:)();
}

uint64_t sub_100003BC0()
{
  return type metadata accessor for PFLPlugin();
}

uint64_t sub_100003BD0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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