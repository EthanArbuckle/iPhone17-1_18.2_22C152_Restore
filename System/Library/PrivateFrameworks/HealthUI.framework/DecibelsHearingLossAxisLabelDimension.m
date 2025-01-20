@interface DecibelsHearingLossAxisLabelDimension
- (_TtC8HealthUI37DecibelsHearingLossAxisLabelDimension)init;
- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4;
@end

@implementation DecibelsHearingLossAxisLabelDimension

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  objc_msgSend(v6, sel_doubleValue);
  id v10 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, -v9);
  v14.receiver = v7;
  v14.super_class = (Class)type metadata accessor for DecibelsHearingLossAxisLabelDimension();
  id v11 = [(HKAxisLabelDimensionScalar *)&v14 stringForLocation:v10 formatterForStepSize:v8];

  if (v11)
  {
    sub_1E0ECD1D0();

    v12 = (void *)sub_1E0ECD190();
    swift_bridgeObjectRelease();
  }
  else
  {

    v12 = 0;
  }
  return v12;
}

- (_TtC8HealthUI37DecibelsHearingLossAxisLabelDimension)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DecibelsHearingLossAxisLabelDimension();
  return [(DecibelsHearingLossAxisLabelDimension *)&v3 init];
}

@end