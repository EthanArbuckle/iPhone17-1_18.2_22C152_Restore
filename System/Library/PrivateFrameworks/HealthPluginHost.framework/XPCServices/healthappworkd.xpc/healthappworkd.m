int main(int argc, const char **argv, const char **envp)
{
  id v3;
  id v4;
  id v5;
  int result;

  sub_100003E00();
  __chkstk_darwin();
  sub_100003D10();
  sub_100003CB0();
  sub_100003D00();
  sub_100003CF0();
  swift_allocObject();
  qword_100008030 = sub_100003CC0();
  sub_100003CE0();
  sub_100003BA8(0, &qword_100008018);
  sub_100003CD0();
  sub_100003DB0();
  swift_allocObject();
  qword_100008038 = sub_100003DA0();
  sub_100003CA0();
  qword_100008040 = sub_100003C90();
  v3 = [objc_allocWithZone((Class)HKHealthStore) init];
  qword_100008048 = (uint64_t)v3;
  sub_100003D70();
  v4 = v3;
  qword_100008050 = sub_100003D60();
  sub_100003D30();
  qword_100008058 = sub_100003D20();
  sub_100003D90();
  qword_100008060 = sub_100003D80();
  [objc_allocWithZone((Class)HKProfileStore) initWithHealthStore:qword_100008048];
  sub_100003BF8();
  v5 = (id)qword_100008040;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100003DF0();
  [objc_allocWithZone((Class)HKHealthStore) init];
  sub_100003D50();
  swift_allocObject();
  qword_100008068 = sub_100003D40();
  qword_100008070 = sub_100003CD0();
  sub_100003C38();
  sub_100003DE0();
  swift_allocObject();
  swift_retain();
  swift_bridgeObjectRetain();
  qword_100008078 = sub_100003DC0();
  result = sub_100003DD0();
  __break(1u);
  return result;
}

uint64_t sub_100003BA8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_100003BF8()
{
  unint64_t result = qword_100008020;
  if (!qword_100008020)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100008020);
  }
  return result;
}

unint64_t sub_100003C38()
{
  unint64_t result = qword_100008028;
  if (!qword_100008028)
  {
    sub_100003D50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008028);
  }
  return result;
}

uint64_t sub_100003C90()
{
  return static DaemonHealthExperienceStoreOracle.shared.getter();
}

uint64_t sub_100003CA0()
{
  return type metadata accessor for DaemonHealthExperienceStoreOracle();
}

uint64_t sub_100003CB0()
{
  return static HealthAppPluginSource.knownBundles.getter();
}

uint64_t sub_100003CC0()
{
  return HealthAppPluginSource.init(bundleProvider:knownBundles:disabledBundleIdentifiers:allowedBundleIdentifiers:)();
}

uint64_t sub_100003CD0()
{
  return HealthAppPluginSource.conformingPlugins<A>(_:)();
}

void sub_100003CE0()
{
}

uint64_t sub_100003CF0()
{
  return static HealthAppPluginSource.allowedBundleIdentifiers()();
}

uint64_t sub_100003D00()
{
  return static HealthAppPluginSource.disabledBundleIdentifiers()();
}

uint64_t sub_100003D10()
{
  return type metadata accessor for HealthAppPluginSource();
}

uint64_t sub_100003D20()
{
  return HealthAppNotificationManager.__allocating_init()();
}

uint64_t sub_100003D30()
{
  return type metadata accessor for HealthAppNotificationManager();
}

uint64_t sub_100003D40()
{
  return HealthPlatformContextProvider.init(profileStore:experienceStoreOracle:pinnedContentManager:notificationManager:transactionBuilderManager:healthStore:logger:)();
}

uint64_t sub_100003D50()
{
  return type metadata accessor for HealthPlatformContextProvider();
}

uint64_t sub_100003D60()
{
  return PinnedContentManager.__allocating_init(healthStore:domain:)();
}

uint64_t sub_100003D70()
{
  return type metadata accessor for PinnedContentManager();
}

uint64_t sub_100003D80()
{
  return static OpenTransactionBuilderManager.shared.getter();
}

uint64_t sub_100003D90()
{
  return type metadata accessor for OpenTransactionBuilderManager();
}

uint64_t sub_100003DA0()
{
  return SerialDispatcher.init(providers:)();
}

uint64_t sub_100003DB0()
{
  return type metadata accessor for SerialDispatcher();
}

uint64_t sub_100003DC0()
{
  return RemoteExecutionService.init(contextProvider:executorProviders:listener:)();
}

uint64_t sub_100003DD0()
{
  return dispatch thunk of RemoteExecutionService.run()();
}

uint64_t sub_100003DE0()
{
  return type metadata accessor for RemoteExecutionService();
}

uint64_t sub_100003DF0()
{
  return static Logger.orchestration.getter();
}

uint64_t sub_100003E00()
{
  return type metadata accessor for Logger();
}

void sub_100003E10(Swift::String a1)
{
}

void sub_100003E20(Swift::Int a1)
{
}

uint64_t sub_100003E30()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100003E40()
{
  return _assertionFailure(_:_:file:line:flags:)();
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_retain()
{
  return _swift_retain();
}