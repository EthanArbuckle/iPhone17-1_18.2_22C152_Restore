@interface HDMCPregnancyRequirementEvaluator
- (_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator)init;
- (_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator)initWithPregnancyManager:(id)a3;
- (id)isRequirementSatisfied:(id)a3 error:(id *)a4;
- (void)pregnancyModelDidUpdate:(id)a3;
- (void)registerObserver:(id)a3 forRequirement:(id)a4 queue:(id)a5;
- (void)unregisterObserver:(id)a3 forRequirement:(id)a4;
@end

@implementation HDMCPregnancyRequirementEvaluator

- (id)isRequirementSatisfied:(id)a3 error:(id *)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  v7 = (void *)sub_2257375AC(a3);

  swift_unknownObjectRelease();
  return v7;
}

- (void)pregnancyModelDidUpdate:(id)a3
{
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = self;
  *(void *)(v6 + 24) = a3;
  v11[4] = sub_2257318A8;
  v11[5] = v6;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_225730ED8;
  v11[3] = &block_descriptor_14;
  v7 = _Block_copy(v11);
  id v8 = a3;
  v9 = self;
  id v10 = v8;
  swift_release();
  objc_msgSend(v5, sel_notifyObservers_, v7);
  _Block_release(v7);
}

- (_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator)initWithPregnancyManager:(id)a3
{
  v4 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyRequirementEvaluator());
  v5 = (_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator *)sub_225787218(a3, v4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)registerObserver:(id)a3 forRequirement:(id)a4 queue:(id)a5
{
}

- (void)unregisterObserver:(id)a3 forRequirement:(id)a4
{
}

- (_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator)init
{
  result = (_TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers);
}

@end