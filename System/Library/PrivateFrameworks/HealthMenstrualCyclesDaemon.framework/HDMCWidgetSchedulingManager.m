@interface HDMCWidgetSchedulingManager
- (_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager)init;
- (_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager)initWithProfile:(id)a3;
- (void)dealloc;
- (void)didUpdateAnalysis:(id)a3;
- (void)profileDidBecomeReady:(id)a3;
@end

@implementation HDMCWidgetSchedulingManager

- (_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager)initWithProfile:(id)a3
{
  return (_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager *)HDMCWidgetSchedulingManager.init(profile:)(a3);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = (void *)sub_2257974F8();
  if (v5)
  {
    v6 = v5;
    id v7 = objc_msgSend(v5, sel__bridging_analysisProviding);

    if (v7)
    {
      v8 = v4;
      objc_msgSend(v7, sel_unregisterObserver_, v8);

      swift_unknownObjectRelease();
    }
  }
  v9.receiver = v4;
  v9.super_class = ObjectType;
  [(HDMCWidgetSchedulingManager *)&v9 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_profile));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_widgetReloader);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_queue));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_previousAnalysis));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_didBecomeReady);
  sub_225799194(v3);
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = a3;
  v5 = self;
  HDMCWidgetSchedulingManager.profileDidBecomeReady(_:)(v4);
}

- (_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager)init
{
  result = (_TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didUpdateAnalysis:(id)a3
{
  id v4 = a3;
  v5 = self;
  HDMCWidgetSchedulingManager.didUpdate(_:)(v4);
}

@end