@interface _NSSwiftProcessInfo
+ (NSProcessInfo)processInfo;
+ (void)cancelPowerStateNotifyNotification;
+ (void)cancelThermalStateNotifyNotification;
+ (void)updatePowerState:(unint64_t)a3;
+ (void)updateThermalState:(unint64_t)a3;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)macCatalystVersion;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion;
- (BOOL)isLowPowerModeEnabled;
- (BOOL)isMacCatalystApp;
- (BOOL)isOperatingSystemAtLeastVersion:(id *)a3;
- (BOOL)isiOSAppOnMac;
- (BOOL)macCatalystVersionIsAtLeastVersion:(id *)a3;
- (NSArray)arguments;
- (NSDictionary)environment;
- (NSString)globallyUniqueString;
- (NSString)hostName;
- (NSString)operatingSystemVersionString;
- (NSString)processName;
- (_NSSwiftProcessInfo)init;
- (double)systemUptime;
- (id)beginActivityWithOptions:(unint64_t)a3 reason:(id)a4;
- (int64_t)thermalState;
- (void)_reactivateActivity:(id)a3;
- (void)_setShouldRelaunchDueToAutomaticTerminationStateChangedHandler:(id)a3;
- (void)endActivity:(id)a3;
- (void)performActivityWithOptions:(unint64_t)a3 reason:(id)a4 block:(id)a5;
- (void)performExpiringActivityWithReason:(id)a3 usingBlock:(id)a4;
- (void)setProcessName:(id)a3;
@end

@implementation _NSSwiftProcessInfo

- (NSString)globallyUniqueString
{
  specialized _NSSwiftProcessInfo.globallyUniqueString.getter();
  v2 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSDictionary)environment
{
  specialized _ProcessInfo.environment.getter();
  v2 = (void *)_NativeDictionary.bridged()();

  return (NSDictionary *)v2;
}

+ (void)cancelPowerStateNotifyNotification
{
  if (one-time initialization token for _globalState != -1) {
    swift_once();
  }
  uint64_t v2 = static _NSSwiftProcessInfo._globalState + 16;
  v3 = (os_unfair_lock_s *)(static _NSSwiftProcessInfo._globalState + 44);
  swift_retain();
  os_unfair_lock_lock(v3);
  closure #1 in static _NSSwiftProcessInfo.cancelPowerStateNotifyNotification()(v2);
  os_unfair_lock_unlock(v3);

  swift_release();
}

+ (void)updatePowerState:(unint64_t)a3
{
  if (one-time initialization token for _globalState != -1) {
    a1 = (id)swift_once();
  }
  v3 = (os_unfair_lock_s *)static _NSSwiftProcessInfo._globalState;
  MEMORY[0x1F4188790](a1);
  swift_retain();
  os_unfair_lock_lock(v3 + 11);
  partial apply for closure #1 in static _NSSwiftProcessInfo.updatePowerState(_:)((uint64_t)&v3[4]);
  os_unfair_lock_unlock(v3 + 11);
  swift_release();
}

- (NSString)processName
{
  uint64_t v2 = (*(void **)((char *)&self->super.super.isa + OBJC_IVAR____NSSwiftProcessInfo__processInfo))[2];
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 40));
  closure #1 in _ProcessInfo.processName.getter((unint64_t *)(v2 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 40));

  swift_release();
  v4 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

+ (NSProcessInfo)processInfo
{
  if (one-time initialization token for _shared != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)static _NSSwiftProcessInfo._shared;

  return (NSProcessInfo *)v2;
}

- (id)beginActivityWithOptions:(unint64_t)a3 reason:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v6 = objc_allocWithZone((Class)_NSActivityAssertion);
  v7 = self;
  id v8 = objc_msgSend(objc_msgSend(v6, sel_init), sel__initWithActivityOptions_reason_expirationHandler_, a3, String._bridgeToObjectiveCImpl()(), 0);
  id result = (id)swift_unknownObjectRelease();
  if (v8)
  {

    swift_bridgeObjectRelease();
    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)endActivity:(id)a3
{
  if (a3)
  {
    self;
    v3 = (void *)swift_dynamicCastObjCClass();
    if (v3)
    {
      objc_msgSend(v3, sel__endFromDealloc_, 0);
    }
  }
}

- (void)_reactivateActivity:(id)a3
{
  if (a3)
  {
    self;
    v3 = (void *)swift_dynamicCastObjCClass();
    if (v3)
    {
      objc_msgSend(v3, sel__reactivate);
    }
  }
}

- (BOOL)isOperatingSystemAtLeastVersion:(id *)a3
{
  return specialized _NSSwiftProcessInfo.macCatalystVersionIs(atLeastVersion:)(a3->var0, a3->var1, a3->var2) & 1;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  id result = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)specialized _NSSwiftProcessInfo.operatingSystemVersion.getter();
  retstr->var0 = (int64_t)result;
  retstr->var1 = v5;
  retstr->var2 = v6;
  return result;
}

- (NSArray)arguments
{
  uint64_t v2 = (os_unfair_lock_s *)(*(void **)((char *)&self->super.super.isa + OBJC_IVAR____NSSwiftProcessInfo__processInfo))[2];
  v3 = self;
  swift_retain();
  os_unfair_lock_lock(v2 + 10);
  closure #1 in _ProcessInfo.arguments.getter((uint64_t)&v2[4], &v6);
  os_unfair_lock_unlock(v2 + 10);

  swift_release();
  v4 = (void *)_ContiguousArrayBuffer._asCocoaArray()();

  return (NSArray *)v4;
}

- (int64_t)thermalState
{
  swift_getObjectType();
  uint64_t v3 = one-time initialization token for _globalState;
  v4 = self;
  int64_t v5 = v4;
  if (v3 != -1) {
    v4 = (_NSSwiftProcessInfo *)swift_once();
  }
  uint64_t v6 = (os_unfair_lock_s *)static _NSSwiftProcessInfo._globalState;
  MEMORY[0x1F4188790](v4);
  swift_retain();
  os_unfair_lock_lock(v6 + 11);
  partial apply for closure #1 in _NSSwiftProcessInfo.thermalState.getter((uint64_t)&v6[4], &v8);
  os_unfair_lock_unlock(v6 + 11);

  swift_release();
  return v8;
}

- (BOOL)isLowPowerModeEnabled
{
  swift_getObjectType();
  uint64_t v3 = one-time initialization token for _globalState;
  v4 = self;
  int64_t v5 = v4;
  if (v3 != -1) {
    v4 = (_NSSwiftProcessInfo *)swift_once();
  }
  uint64_t v6 = (os_unfair_lock_s *)static _NSSwiftProcessInfo._globalState;
  MEMORY[0x1F4188790](v4);
  swift_retain();
  os_unfair_lock_lock(v6 + 11);
  partial apply for closure #1 in _NSSwiftProcessInfo.isLowPowerModeEnabled.getter((uint64_t)&v6[4], (char *)&v8);
  os_unfair_lock_unlock(v6 + 11);

  swift_release();
  return v8;
}

- (_NSSwiftProcessInfo)init
{
  return (_NSSwiftProcessInfo *)_NSSwiftProcessInfo.init()();
}

- (BOOL)isMacCatalystApp
{
  return 0;
}

- (double)systemUptime
{
  v7[1] = *(mach_timebase_info *)MEMORY[0x1E4F143B8];
  v7[0] = 0;
  v4 = self;
  mach_timebase_info(v7);
  LODWORD(v2) = v7[0].denom;
  LODWORD(v3) = v7[0].numer;
  uint64_t v5 = mach_absolute_time();

  return 1.0 / (1000000000.0 / (double)v3 * (double)v2) * (double)v5;
}

- (NSString)operatingSystemVersionString
{
  unint64_t v2 = self;
  id result = (NSString *)CFCopySystemVersionString();
  if (result)
  {
    v4 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)(result);

    uint64_t v5 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
    return (NSString *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)performExpiringActivityWithReason:(id)a3 usingBlock:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  BOOL v8 = self;
  uint64_t v9 = String._bridgeToObjectiveCImpl()();
  v12[4] = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> ();
  v12[5] = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  v12[2] = thunk for @escaping @callee_guaranteed (@unowned Bool) -> ();
  v12[3] = &block_descriptor_12_0;
  v10 = _Block_copy(v12);
  v11 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel__performExpiringActivityWithReason_usingBlock_, v9, v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
}

+ (void)cancelThermalStateNotifyNotification
{
  if (one-time initialization token for _globalState != -1) {
    swift_once();
  }
  uint64_t v2 = static _NSSwiftProcessInfo._globalState + 16;
  unint64_t v3 = (os_unfair_lock_s *)(static _NSSwiftProcessInfo._globalState + 44);
  swift_retain();
  os_unfair_lock_lock(v3);
  closure #1 in static _NSSwiftProcessInfo.cancelThermalStateNotifyNotification()(v2);
  os_unfair_lock_unlock(v3);

  swift_release();
}

+ (void)updateThermalState:(unint64_t)a3
{
}

- (BOOL)isiOSAppOnMac
{
  return 0;
}

- (void)performActivityWithOptions:(unint64_t)a3 reason:(id)a4 block:(id)a5
{
  BOOL v8 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v9 = v8;
  if (a4)
  {
    id v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v11;
    if (v9)
    {
LABEL_3:
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = v9;
      uint64_t v9 = partial apply for thunk for @escaping @callee_unowned @convention(block) () -> ();
      goto LABEL_6;
    }
  }
  else
  {
    id v10 = 0;
    if (v8) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
LABEL_6:
  v13 = self;
  specialized _NSSwiftProcessInfo.performActivity(options:reason:block:)(a3, (uint64_t)v10, (uint64_t)a4, v9, v12);
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed URL, @guaranteed Error) -> (@unowned Bool))?((uint64_t)v9);

  swift_bridgeObjectRelease();
}

- (void)_setShouldRelaunchDueToAutomaticTerminationStateChangedHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    uint64_t v6 = partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable () -> ();
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(os_unfair_lock_s **)((char *)&self->super.super.isa + OBJC_IVAR____NSSwiftProcessInfo__state);
  MEMORY[0x1F4188790](v4);
  BOOL v8 = self;
  swift_retain();
  os_unfair_lock_lock(v7 + 19);
  partial apply for closure #1 in _NSSwiftProcessInfo._setShouldRelaunchDue(toAutomaticTerminationStateChangedHandler:)((uint64_t)&v7[4]);
  os_unfair_lock_unlock(v7 + 19);
  swift_release();
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed URL, @guaranteed Error) -> (@unowned Bool))?((uint64_t)v6);
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)macCatalystVersion
{
  id result = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)specialized _NSSwiftProcessInfo.operatingSystemVersion.getter();
  retstr->var0 = (int64_t)result;
  retstr->var1 = v5;
  retstr->var2 = v6;
  return result;
}

- (BOOL)macCatalystVersionIsAtLeastVersion:(id *)a3
{
  return specialized _NSSwiftProcessInfo.macCatalystVersionIs(atLeastVersion:)(a3->var0, a3->var1, a3->var2) & 1;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

- (void)setProcessName:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v4 = (*(void **)((char *)&self->super.super.isa + OBJC_IVAR____NSSwiftProcessInfo__processInfo))[2];
  int64_t v5 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 40));
  partial apply for closure #1 in _ProcessInfo.processName.setter((void *)(v4 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 40));

  swift_bridgeObjectRelease();
  swift_release();
}

- (NSString)hostName
{
  uint64_t v2 = (*(void **)((char *)&self->super.super.isa + OBJC_IVAR____NSSwiftProcessInfo__processInfo))[3];
  unint64_t v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
  closure #1 in _ProcessInfo.hostName.getter((void *)(v2 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));

  swift_release();
  uint64_t v4 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

@end