@interface HKBreathingDisturbancesAxis
+ (id)standardAxisWith:(id)a3;
- (HKBreathingDisturbancesAxis)initWithConfiguration:(id)a3;
- (HKBreathingDisturbancesAxis)initWithDisplayType:(id)a3;
- (id)adjustValueRangeForLabels:(id)a3;
- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4;
@end

@implementation HKBreathingDisturbancesAxis

+ (id)standardAxisWith:(id)a3
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for BreathingDisturbancesAxis());
  id v5 = BreathingDisturbancesAxis.init(displayType:)(a3);
  return v5;
}

- (HKBreathingDisturbancesAxis)initWithDisplayType:(id)a3
{
  return (HKBreathingDisturbancesAxis *)BreathingDisturbancesAxis.init(displayType:)(a3);
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_1E0EA7444(v5);

  if (v7)
  {
    sub_1E0E52230();
    v8 = (void *)sub_1E0ECD320();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)adjustValueRangeForLabels:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_1E0EA6B34(v4);

  return v6;
}

- (HKBreathingDisturbancesAxis)initWithConfiguration:(id)a3
{
  id v3 = a3;
  result = (HKBreathingDisturbancesAxis *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end