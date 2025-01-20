@interface GESSAlgRepairDegeneratedTrianglesOptions
- (BOOL)enableTopologicalChange;
- (GESSAlgRepairDegeneratedTrianglesOptions)init;
- (float)shortEdgesCollapsingRatioThreshold;
- (void)setEnableTopologicalChange:(BOOL)a3;
- (void)setShortEdgesCollapsingRatioThreshold:(float)a3;
@end

@implementation GESSAlgRepairDegeneratedTrianglesOptions

- (GESSAlgRepairDegeneratedTrianglesOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GESSAlgRepairDegeneratedTrianglesOptions;
  v2 = [(GESSAlgRepairDegeneratedTrianglesOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(GESSAlgRepairDegeneratedTrianglesOptions *)v2 setEnableTopologicalChange:1];
    LODWORD(v4) = 981668463;
    [(GESSAlgRepairDegeneratedTrianglesOptions *)v3 setShortEdgesCollapsingRatioThreshold:v4];
  }
  return v3;
}

- (BOOL)enableTopologicalChange
{
  return self->enableTopologicalChange;
}

- (void)setEnableTopologicalChange:(BOOL)a3
{
  self->enableTopologicalChange = a3;
}

- (float)shortEdgesCollapsingRatioThreshold
{
  return self->shortEdgesCollapsingRatioThreshold;
}

- (void)setShortEdgesCollapsingRatioThreshold:(float)a3
{
  self->shortEdgesCollapsingRatioThreshold = a3;
}

@end