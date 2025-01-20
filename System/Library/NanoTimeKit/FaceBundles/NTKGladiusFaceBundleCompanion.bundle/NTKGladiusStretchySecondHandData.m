@interface NTKGladiusStretchySecondHandData
- (_TtC29NTKGladiusFaceBundleCompanion32NTKGladiusStretchySecondHandData)init;
- (_TtC29NTKGladiusFaceBundleCompanion32NTKGladiusStretchySecondHandData)initWithDevice:(id)a3;
- (double)sampleAtAngle:(double)a3 includeBaseRadius:(BOOL)a4;
@end

@implementation NTKGladiusStretchySecondHandData

- (_TtC29NTKGladiusFaceBundleCompanion32NTKGladiusStretchySecondHandData)initWithDevice:(id)a3
{
  id v3 = a3;
  v4 = (_TtC29NTKGladiusFaceBundleCompanion32NTKGladiusStretchySecondHandData *)sub_144A0(v3);

  return v4;
}

- (double)sampleAtAngle:(double)a3 includeBaseRadius:(BOOL)a4
{
  v5 = self;
  sub_14104(a3);
  double v7 = v6;

  return v7;
}

- (_TtC29NTKGladiusFaceBundleCompanion32NTKGladiusStretchySecondHandData)init
{
  result = (_TtC29NTKGladiusFaceBundleCompanion32NTKGladiusStretchySecondHandData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end