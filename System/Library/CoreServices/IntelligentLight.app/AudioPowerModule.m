@interface AudioPowerModule
- (_TtC16IntelligentLight16AudioPowerModule)init;
- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5;
@end

@implementation AudioPowerModule

- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v11 = (id)Strong;
    id v9 = a3;
    v10 = self;
    sub_10000A98C(a4);
  }
}

- (_TtC16IntelligentLight16AudioPowerModule)init
{
  *(void *)&self->moduleAccessor[OBJC_IVAR____TtC16IntelligentLight16AudioPowerModule_moduleAccessor] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16IntelligentLight16AudioPowerModule_audioPowerUpdater) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AudioPowerModule();
  return [(AudioPowerModule *)&v4 init];
}

- (void).cxx_destruct
{
  sub_1000087CC((uint64_t)self + OBJC_IVAR____TtC16IntelligentLight16AudioPowerModule_moduleAccessor);
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16IntelligentLight16AudioPowerModule_audioPowerUpdater);
}

@end