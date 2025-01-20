@interface HDMCPregnancyFeatureAdjustmentManager
- (_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager)init;
- (_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager)initWithPregnancyManager:(id)a3 profile:(id)a4 experienceModelProvider:(id)a5;
- (void)experienceModelManagerDidUpdateModel;
- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6;
- (void)pregnancyModelDidUpdate:(id)a3;
@end

@implementation HDMCPregnancyFeatureAdjustmentManager

- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  sub_22572A090((void (*)(void))sub_225731EE8, (void (*)(void))v11);

  swift_release();
}

- (void)pregnancyModelDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2257709D8(v4);
}

- (_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager)initWithPregnancyManager:(id)a3 profile:(id)a4 experienceModelProvider:(id)a5
{
  memset(v13, 0, sizeof(v13));
  uint64_t v14 = 0;
  v8 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyFeatureAdjustmentManager());
  id v9 = a3;
  id v10 = a4;
  swift_unknownObjectRetain();
  uint64_t v11 = sub_22577B3C0(v9, v10, a5, 0, 0, 0, (uint64_t)v13, v8);

  swift_unknownObjectRelease();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager *)v11;
}

- (_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager)init
{
  result = (_TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_22573C334((uint64_t)self+ OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_medicalIDDataManager);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_protectedDataOperation);
}

- (void)experienceModelManagerDidUpdateModel
{
  v2 = self;
  HDMCPregnancyFeatureAdjustmentManager.experienceModelManagerDidUpdateModel()();
}

@end