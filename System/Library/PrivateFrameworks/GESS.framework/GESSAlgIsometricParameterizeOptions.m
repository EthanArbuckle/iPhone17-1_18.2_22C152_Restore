@interface GESSAlgIsometricParameterizeOptions
- (BOOL)enableParallel;
- (BOOL)repairUVSelfIntersection;
- (BOOL)skipInitialStretchOptimization;
- (GESSAlgIsometricParameterizeOptions)init;
- (float)maximumStretchRatio;
- (unsigned)optimizeBoundaryIfFaceNumberLessThan;
- (unsigned)targetNumOfCharts;
- (void)setEnableParallel:(BOOL)a3;
- (void)setMaximumStretchRatio:(float)a3;
- (void)setOptimizeBoundaryIfFaceNumberLessThan:(unsigned int)a3;
- (void)setRepairUVSelfIntersection:(BOOL)a3;
- (void)setSkipInitialStretchOptimization:(BOOL)a3;
- (void)setTargetNumOfCharts:(unsigned int)a3;
@end

@implementation GESSAlgIsometricParameterizeOptions

- (GESSAlgIsometricParameterizeOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GESSAlgIsometricParameterizeOptions;
  v2 = [(GESSAlgParameterizeOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(GESSAlgIsometricParameterizeOptions *)v2 setTargetNumOfCharts:10];
    LODWORD(v4) = 1036831949;
    [(GESSAlgIsometricParameterizeOptions *)v3 setMaximumStretchRatio:v4];
    [(GESSAlgIsometricParameterizeOptions *)v3 setEnableParallel:1];
    [(GESSAlgIsometricParameterizeOptions *)v3 setSkipInitialStretchOptimization:0];
    [(GESSAlgIsometricParameterizeOptions *)v3 setOptimizeBoundaryIfFaceNumberLessThan:100000];
    [(GESSAlgIsometricParameterizeOptions *)v3 setRepairUVSelfIntersection:0];
  }
  return v3;
}

- (unsigned)targetNumOfCharts
{
  return self->targetNumOfCharts;
}

- (void)setTargetNumOfCharts:(unsigned int)a3
{
  self->targetNumOfCharts = a3;
}

- (float)maximumStretchRatio
{
  return self->maximumStretchRatio;
}

- (void)setMaximumStretchRatio:(float)a3
{
  self->maximumStretchRatio = a3;
}

- (BOOL)enableParallel
{
  return self->enableParallel;
}

- (void)setEnableParallel:(BOOL)a3
{
  self->enableParallel = a3;
}

- (BOOL)skipInitialStretchOptimization
{
  return self->skipInitialStretchOptimization;
}

- (void)setSkipInitialStretchOptimization:(BOOL)a3
{
  self->skipInitialStretchOptimization = a3;
}

- (unsigned)optimizeBoundaryIfFaceNumberLessThan
{
  return self->optimizeBoundaryIfFaceNumberLessThan;
}

- (void)setOptimizeBoundaryIfFaceNumberLessThan:(unsigned int)a3
{
  self->optimizeBoundaryIfFaceNumberLessThan = a3;
}

- (BOOL)repairUVSelfIntersection
{
  return self->repairUVSelfIntersection;
}

- (void)setRepairUVSelfIntersection:(BOOL)a3
{
  self->repairUVSelfIntersection = a3;
}

@end