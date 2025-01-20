@interface GKBlendNoiseModifier
- (GKBlendNoiseModifier)init;
- (GKBlendNoiseModifier)initWithInputModuleCount:(unint64_t)a3;
- (GKBlendNoiseModifier)initWithSelectionRangeLowerBound:(double)a3 selectionRangeUpperBound:(double)a4 selectionBoundaryBlendDistance:(double)a5;
- (double)valueAt:(GKBlendNoiseModifier *)self;
- (id)cloneModule;
- (int)requiredInputModuleCount;
@end

@implementation GKBlendNoiseModifier

- (GKBlendNoiseModifier)init
{
  return [(GKBlendNoiseModifier *)self initWithSelectionRangeLowerBound:0.0 selectionRangeUpperBound:1.0 selectionBoundaryBlendDistance:0.0];
}

- (GKBlendNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  return -[GKBlendNoiseModifier initWithSelectionRangeLowerBound:selectionRangeUpperBound:selectionBoundaryBlendDistance:](self, "initWithSelectionRangeLowerBound:selectionRangeUpperBound:selectionBoundaryBlendDistance:", a3, 0.0, 1.0, 0.0);
}

- (GKBlendNoiseModifier)initWithSelectionRangeLowerBound:(double)a3 selectionRangeUpperBound:(double)a4 selectionBoundaryBlendDistance:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)GKBlendNoiseModifier;
  result = [(GKNoiseModifier *)&v9 initWithInputModuleCount:3];
  if (result)
  {
    result->_lowerBound = a3;
    result->_upperBound = a4;
    result->_blendDistance = a5;
  }
  return result;
}

- (int)requiredInputModuleCount
{
  return 3;
}

- (double)valueAt:(GKBlendNoiseModifier *)self
{
  long long v14 = v2[1];
  long long v15 = *v2;
  v4 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:0];
  v18[0] = v15;
  v18[1] = v14;
  [v4 valueAt:v18];
  double v6 = v5;

  v7 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:1];
  v17[0] = v15;
  v17[1] = v14;
  [v7 valueAt:v17];
  double v9 = v8;

  v10 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:2];
  v16[0] = v15;
  v16[1] = v14;
  [v10 valueAt:v16];
  double v12 = v11;

  if (self->_lowerBound > v12 || v12 > self->_upperBound) {
    return v6;
  }
  return v9;
}

- (id)cloneModule
{
  v2 = [[GKBlendNoiseModifier alloc] initWithSelectionRangeLowerBound:self->_lowerBound selectionRangeUpperBound:self->_upperBound selectionBoundaryBlendDistance:self->_blendDistance];

  return v2;
}

@end