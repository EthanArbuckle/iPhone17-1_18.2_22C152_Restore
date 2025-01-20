@interface HMDActionSetStateObserver
- (HMDActionSetStateObserver)init;
- (HMDActionSetStateObserver)initWithDataSource:(id)a3 notificationRegistry:(id)a4;
- (void)currentStateForActionSetUUIDs:(NSArray *)a3 completionHandler:(id)a4;
- (void)device:(id)a3 receivedAttributeReport:(id)a4;
- (void)device:(id)a3 receivedEventReport:(id)a4;
- (void)device:(id)a3 stateChanged:(unint64_t)a4;
- (void)handleActionSetAddedWithNotification:(id)a3;
- (void)handleActionSetUpdatedWithNotification:(id)a3;
- (void)handleMediaProfileHasMediaSessionStateChangedWithNotification:(id)a3;
- (void)handleNaturalLightingProfileStateChangedWithNotification:(id)a3;
- (void)handleWithCharacteristicsChangedNotification:(id)a3;
- (void)stateRegistrationsDidChangeForActionSetUUIDs:(id)a3;
- (void)stopMonitoringActionSet:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDActionSetStateObserver

- (HMDActionSetStateObserver)initWithDataSource:(id)a3 notificationRegistry:(id)a4
{
  v6 = self;
  swift_unknownObjectRetain();
  id v7 = a4;
  id v8 = objc_msgSend(v6, sel_defaultCenter);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F42528]), sel_initWithMinimumTimeInterval_maximumTimeInterval_exponentialFactor_options_, 2, 0, 15.0, 2000.0);
  type metadata accessor for ActionSetState.Observer();
  swift_allocObject();
  v10 = (HMDActionSetStateObserver *)ActionSetState.Observer.init(dataSource:notificationRegistry:notificationCenter:characteristicRetryTimer:)((uint64_t)a3, v7, v8, v9);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v10;
}

- (void)stopMonitoringActionSet:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  id v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = self;
  v9[5] = a3;
  id v10 = a3;
  swift_retain_n();
  id v11 = v10;
  sub_22F54F824((uint64_t)v7, (uint64_t)&unk_2686D98E0, (uint64_t)v9);
  swift_release();
  swift_release();
}

- (void)stateRegistrationsDidChangeForActionSetUUIDs:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2302DD2B0();
  uint64_t v7 = sub_2302DDD80();
  uint64_t v8 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  id v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = self;
  v9[5] = v7;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_22F54F824((uint64_t)v6, (uint64_t)&unk_2686D98D8, (uint64_t)v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)handleActionSetAddedWithNotification:(id)a3
{
}

- (void)handleActionSetUpdatedWithNotification:(id)a3
{
}

- (void)handleWithCharacteristicsChangedNotification:(id)a3
{
  uint64_t v3 = sub_2302DCF50();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2302DCF10();
  swift_retain();
  sub_22F63D568((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)handleMediaProfileHasMediaSessionStateChangedWithNotification:(id)a3
{
}

- (void)handleNaturalLightingProfileStateChangedWithNotification:(id)a3
{
}

- (void)currentStateForActionSetUUIDs:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2686D98C0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2686D8770;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_22F6C83BC((uint64_t)v9, (uint64_t)&unk_2686D98D0, (uint64_t)v14);
  swift_release();
}

- (void)timerDidFire:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = self;
  v10[5] = ObjectType;
  swift_retain_n();
  id v11 = a3;
  sub_22F54F824((uint64_t)v8, (uint64_t)&unk_2686D98B0, (uint64_t)v10);
  swift_release();
  swift_release();
}

- (HMDActionSetStateObserver)init
{
  swift_defaultActor_initialize();
  result = (HMDActionSetStateObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)device:(id)a3 stateChanged:(unint64_t)a4
{
  id v5 = a3;
  swift_retain();
  ActionSetState.Observer.device(_:stateChanged:)((MTRDevice)v5, (MTRDeviceState)a4);

  swift_release();
}

- (void)device:(id)a3 receivedAttributeReport:(id)a4
{
}

- (void)device:(id)a3 receivedEventReport:(id)a4
{
}

@end