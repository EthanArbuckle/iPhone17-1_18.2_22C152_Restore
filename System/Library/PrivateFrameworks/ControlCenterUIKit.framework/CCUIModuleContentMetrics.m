@interface CCUIModuleContentMetrics
+ (id)defaultMetricsForGridGeometryInfo:(CCUIGridGeometryInfo)a3;
- (CCUIGridGeometryInfo)gridGeometryInfo;
- (CCUIModuleContentMetrics)init;
- (CCUIModuleContentMetrics)initWithSymbolConfiguration:(id)a3 symbolFont:(id)a4 symbolScaleFactor:(double)a5 metricsScaleFactor:(double)a6 gridGeometryInfo:(CCUIGridGeometryInfo)a7;
- (NSString)description;
- (UIFont)symbolFont;
- (UIImageSymbolConfiguration)symbolConfiguration;
- (double)metricsScaleFactor;
- (double)symbolScaleFactor;
@end

@implementation CCUIModuleContentMetrics

- (UIImageSymbolConfiguration)symbolConfiguration
{
  return (UIImageSymbolConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR___CCUIModuleContentMetrics_symbolConfiguration));
}

- (UIFont)symbolFont
{
  return (UIFont *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___CCUIModuleContentMetrics_symbolFont));
}

- (double)symbolScaleFactor
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_symbolScaleFactor);
}

- (double)metricsScaleFactor
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_metricsScaleFactor);
}

- (CCUIGridGeometryInfo)gridGeometryInfo
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_gridGeometryInfo);
  double v3 = *(double *)&self->symbolConfiguration[OBJC_IVAR___CCUIModuleContentMetrics_gridGeometryInfo];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (CCUIModuleContentMetrics)initWithSymbolConfiguration:(id)a3 symbolFont:(id)a4 symbolScaleFactor:(double)a5 metricsScaleFactor:(double)a6 gridGeometryInfo:(CCUIGridGeometryInfo)a7
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_symbolConfiguration) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_symbolFont) = (Class)a4;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_symbolScaleFactor) = a5;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_metricsScaleFactor) = a6;
  *(CCUIGridGeometryInfo *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_gridGeometryInfo) = a7;
  v11.receiver = self;
  v11.super_class = (Class)CCUIModuleContentMetrics;
  id v8 = a3;
  id v9 = a4;
  return [(CCUIModuleContentMetrics *)&v11 init];
}

+ (id)defaultMetricsForGridGeometryInfo:(CCUIGridGeometryInfo)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  swift_getObjCClassMetadata();
  id v5 = sub_1D837CAEC(var0, var1);
  return v5;
}

- (NSString)description
{
  double v2 = self;
  CCUIModuleContentMetrics.description.getter();

  double v3 = (void *)sub_1D83820E8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CCUIModuleContentMetrics)init
{
  CCUIGridGeometryInfo result = (CCUIModuleContentMetrics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleContentMetrics_symbolFont);
}

@end