@interface DiagramAxisMetricsCalculatorFactory.HiLoScalarAxisDimension
- (_TtCC19HealthVisualization35DiagramAxisMetricsCalculatorFactory23HiLoScalarAxisDimension)init;
- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4;
@end

@implementation DiagramAxisMetricsCalculatorFactory.HiLoScalarAxisDimension

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  v6 = self;
  id v7 = a3;
  id v8 = a4;
  sub_1C29F44A0(a3);
  uint64_t v10 = v9;

  if (v10)
  {
    v11 = (void *)sub_1C2A9DCF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (_TtCC19HealthVisualization35DiagramAxisMetricsCalculatorFactory23HiLoScalarAxisDimension)init
{
  result = (_TtCC19HealthVisualization35DiagramAxisMetricsCalculatorFactory23HiLoScalarAxisDimension *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC19HealthVisualization35DiagramAxisMetricsCalculatorFactory23HiLoScalarAxisDimension_displayType));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC19HealthVisualization35DiagramAxisMetricsCalculatorFactory23HiLoScalarAxisDimension_valueFormatter));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCC19HealthVisualization35DiagramAxisMetricsCalculatorFactory23HiLoScalarAxisDimension_unitPreferenceController);
}

@end