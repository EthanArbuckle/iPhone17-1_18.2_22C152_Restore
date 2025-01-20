id sub_1000031CC()
{
  id v0;
  id v1;

  v0 = [objc_allocWithZone((Class)HMMutableHomeManagerConfiguration) initWithOptions:1861 cachePolicy:1];
  [v0 setDiscretionary:0];
  [v0 setAdaptive:1];
  v1 = [objc_allocWithZone((Class)HMHomeManager) initWithConfiguration:v0];

  return v1;
}

uint64_t sub_100003258(uint64_t a1)
{
  unint64_t v2 = sub_100003600();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

uint64_t sub_1000032A4()
{
  return sub_100003A30();
}

uint64_t sub_1000032FC()
{
  uint64_t v0 = sub_100003A00();
  sub_1000038EC(v0, qword_100008380);
  sub_1000038B4(v0, (uint64_t)qword_100008380);
  return sub_1000039F0();
}

uint64_t sub_100003360@<X0>(uint64_t a1@<X8>)
{
  if (qword_100008070 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003A00();
  uint64_t v3 = sub_1000038B4(v2, (uint64_t)qword_100008380);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000341C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000343C, 0, 0);
}

uint64_t sub_10000343C()
{
  sub_1000039E0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000034A8()
{
  uint64_t v0 = qword_100008020;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1000034E4(uint64_t a1)
{
  unint64_t v2 = sub_100003794();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000357C()
{
  unint64_t result = qword_100008030;
  if (!qword_100008030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008030);
  }
  return result;
}

uint64_t sub_1000035D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000374C(a1, a2, a3, (void (*)(void))sub_100003600);
}

unint64_t sub_100003600()
{
  unint64_t result = qword_100008038;
  if (!qword_100008038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008038);
  }
  return result;
}

unint64_t sub_100003658()
{
  unint64_t result = qword_100008040;
  if (!qword_100008040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008040);
  }
  return result;
}

unint64_t sub_1000036B0()
{
  unint64_t result = qword_100008048;
  if (!qword_100008048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008048);
  }
  return result;
}

uint64_t sub_100003704()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000374C(a1, a2, a3, (void (*)(void))sub_100003794);
}

uint64_t sub_10000374C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100003794()
{
  unint64_t result = qword_100008050;
  if (!qword_100008050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008050);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeAppIntentsExtensionTestAppIntent()
{
  return &type metadata for HomeAppIntentsExtensionTestAppIntent;
}

ValueMetadata *type metadata accessor for HomeAppIntentsExtension()
{
  return &type metadata for HomeAppIntentsExtension;
}

unint64_t sub_100003810()
{
  unint64_t result = qword_100008060;
  if (!qword_100008060)
  {
    sub_10000386C(&qword_100008068);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008060);
  }
  return result;
}

uint64_t sub_10000386C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000038B4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000038EC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100003950()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100003960()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100003970()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100003980()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100003990()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_1000039A0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000039B0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000039E0()
{
  return static IntentResult.result<>()();
}

uint64_t sub_1000039F0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100003A00()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100003A10()
{
  return static HomeManagerActor.homeManagerCreationBlock.setter();
}

uint64_t sub_100003A20()
{
  return type metadata accessor for HomeManagerActor();
}

uint64_t sub_100003A30()
{
  return static DataModel.context.setter();
}

uint64_t sub_100003A40()
{
  return type metadata accessor for DataModel();
}

uint64_t sub_100003A50()
{
  return static AppExtension.main()();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}