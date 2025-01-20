@interface NTKParmesanTypefaceMetrics
- (NTKParmesanTypefaceMetrics)init;
- (NTKParmesanTypefaceMetrics)initWithDevice:(id)a3;
@end

@implementation NTKParmesanTypefaceMetrics

- (NTKParmesanTypefaceMetrics)initWithDevice:(id)a3
{
  id v3 = a3;
  v4 = (NTKParmesanTypefaceMetrics *)sub_246C1D260(v3);

  return v4;
}

- (NTKParmesanTypefaceMetrics)init
{
  result = (NTKParmesanTypefaceMetrics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanTypefaceMetrics_device);
}

@end