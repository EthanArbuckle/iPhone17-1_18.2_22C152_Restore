@interface HMDActionSetStateSubscriptionManager
- (BOOL)isActionSetOn:(id)a3;
- (BOOL)isMonitoringActionSet:(id)a3;
- (HMDActionSetStateSubscriptionManager)init;
- (HMDActionSetStateSubscriptionManager)initWithDelegate:(id)a3;
- (NSArray)allMonitoredActionSets;
- (void)actionSetStateDidChange:(id)a3 state:(BOOL)a4;
- (void)startMonitoringActionSetUUID:(id)a3 observer:(id)a4;
- (void)stopAllMonitoringForActionSetUUID:(NSUUID *)a3 completion:(id)a4;
- (void)stopMonitoringActionSetUUID:(id)a3 observer:(id)a4;
@end

@implementation HMDActionSetStateSubscriptionManager

- (HMDActionSetStateSubscriptionManager)initWithDelegate:(id)a3
{
  swift_unknownObjectWeakInit();
  uint64_t v4 = OBJC_IVAR___HMDActionSetStateSubscriptionManager_monitoredActionSets;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686D64B8);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  *(void *)(v5 + 16) = MEMORY[0x263F8EE80];
  *(Class *)((char *)&self->super.super.isa + v4) = (Class)v5;
  swift_unknownObjectWeakAssign();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ActionSetState.SubscriptionManager();
  return [(HMDActionSetStateSubscriptionManager *)&v7 init];
}

- (void)startMonitoringActionSetUUID:(id)a3 observer:(id)a4
{
}

- (void)stopMonitoringActionSetUUID:(id)a3 observer:(id)a4
{
}

- (void)stopAllMonitoringForActionSetUUID:(NSUUID *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686D95D0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2302DDE70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2686D9540;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2686D8770;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_22F6C83BC((uint64_t)v9, (uint64_t)&unk_2686D98D0, (uint64_t)v14);
  swift_release();
}

- (NSArray)allMonitoredActionSets
{
  v2 = *(os_unfair_lock_s **)((char *)&self->super.super.isa
                            + OBJC_IVAR___HMDActionSetStateSubscriptionManager_monitoredActionSets);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock(v2 + 6);
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_22F62DE74(v4);
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v2 + 6);

  swift_release();
  sub_2302DD2B0();
  uint64_t v5 = (void *)sub_2302DDD60();
  swift_release();
  return (NSArray *)v5;
}

- (BOOL)isMonitoringActionSet:(id)a3
{
  return sub_22F638200(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))ActionSetState.SubscriptionManager.isMonitoringActionSet(_:));
}

- (BOOL)isActionSetOn:(id)a3
{
  return sub_22F638200(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))ActionSetState.SubscriptionManager.isActionSetOn(_:));
}

- (void)actionSetStateDidChange:(id)a3 state:(BOOL)a4
{
  uint64_t v6 = sub_2302DD2B0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2302DD270();
  v10 = self;
  ActionSetState.SubscriptionManager.actionSetStateDidChange(_:state:)((uint64_t)v9, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (HMDActionSetStateSubscriptionManager)init
{
  result = (HMDActionSetStateSubscriptionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22F5E65E8((uint64_t)self + OBJC_IVAR___HMDActionSetStateSubscriptionManager_delegate);
  swift_release();
}

@end