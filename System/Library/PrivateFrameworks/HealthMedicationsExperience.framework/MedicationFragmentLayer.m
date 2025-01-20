@interface MedicationFragmentLayer
- (_TtC27HealthMedicationsExperience23MedicationFragmentLayer)init;
- (_TtC27HealthMedicationsExperience23MedicationFragmentLayer)initWithCoder:(id)a3;
- (_TtC27HealthMedicationsExperience23MedicationFragmentLayer)initWithLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation MedicationFragmentLayer

- (_TtC27HealthMedicationsExperience23MedicationFragmentLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1C2B746D0();
  swift_unknownObjectRelease();
  return (_TtC27HealthMedicationsExperience23MedicationFragmentLayer *)MedicationFragmentLayer.init(layer:)(v4);
}

- (_TtC27HealthMedicationsExperience23MedicationFragmentLayer)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC27HealthMedicationsExperience23MedicationFragmentLayer_fragment);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC27HealthMedicationsExperience23MedicationFragmentLayer_color) = 0;
  id v5 = a3;

  result = (_TtC27HealthMedicationsExperience23MedicationFragmentLayer *)sub_1C2B74990();
  __break(1u);
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  id v5 = self;
  sub_1C2B1093C(v4);
}

- (_TtC27HealthMedicationsExperience23MedicationFragmentLayer)init
{
  result = (_TtC27HealthMedicationsExperience23MedicationFragmentLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C2B10E04(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC27HealthMedicationsExperience23MedicationFragmentLayer_fragment), *(void *)((char *)&self->super._attr.refcount+ OBJC_IVAR____TtC27HealthMedicationsExperience23MedicationFragmentLayer_fragment), *(uint64_t *)((char *)&self->super._attr.layer+ OBJC_IVAR____TtC27HealthMedicationsExperience23MedicationFragmentLayer_fragment), *(uint64_t *)((char *)&self->super._attr._objc_observation_info+ OBJC_IVAR____TtC27HealthMedicationsExperience23MedicationFragmentLayer_fragment));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC27HealthMedicationsExperience23MedicationFragmentLayer_color);
}

@end