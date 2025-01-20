@interface GKTerraceNoiseModifier
- (GKTerraceNoiseModifier)init;
- (GKTerraceNoiseModifier)initWithInputModuleCount:(unint64_t)a3;
- (GKTerraceNoiseModifier)initWithPeakInputValues:(id)a3 terracesInverted:(BOOL)a4;
- (double)valueAt:(GKTerraceNoiseModifier *)self;
- (id)cloneModule;
- (int)requiredInputModuleCount;
- (void)dealloc;
@end

@implementation GKTerraceNoiseModifier

- (GKTerraceNoiseModifier)init
{
  return [(GKTerraceNoiseModifier *)self initWithPeakInputValues:&unk_26E94BA68 terracesInverted:0];
}

- (GKTerraceNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  return [(GKTerraceNoiseModifier *)self initWithPeakInputValues:&unk_26E94BA80 terracesInverted:0];
}

- (GKTerraceNoiseModifier)initWithPeakInputValues:(id)a3 terracesInverted:(BOOL)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKTerraceNoiseModifier;
  v7 = [(GKNoiseModifier *)&v13 initWithInputModuleCount:1];
  if (v7)
  {
    int v8 = [v6 count];
    v7->_count = v8;
    v7->_inverted = a4;
    v7->_controlPoints = (double *)malloc_type_malloc(8 * v8, 0x100004000313F17uLL);
    if (v7->_count >= 1)
    {
      uint64_t v9 = 0;
      do
      {
        v10 = [v6 objectAtIndex:v9];
        [v10 doubleValue];
        v7->_controlPoints[v9] = v11;

        ++v9;
      }
      while (v9 < v7->_count);
    }
  }

  return v7;
}

- (void)dealloc
{
  controlPoints = self->_controlPoints;
  if (controlPoints) {
    free(controlPoints);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKTerraceNoiseModifier;
  [(GKTerraceNoiseModifier *)&v4 dealloc];
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKTerraceNoiseModifier *)self
{
  long long v16 = v2[1];
  long long v17 = *v2;
  objc_super v4 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:0];
  v18[0] = v17;
  v18[1] = v16;
  [v4 valueAt:v18];
  double v6 = v5;

  uint64_t count = self->_count;
  if (!count) {
    return v6;
  }
  if (count == 1) {
    return *self->_controlPoints;
  }
  controlPoints = self->_controlPoints;
  double result = *controlPoints;
  if (v6 > *controlPoints)
  {
    double result = controlPoints[(int)count - 1];
    if (v6 < result)
    {
      uint64_t v10 = 1;
      if ((int)count >= 2)
      {
        while (v6 >= controlPoints[v10])
        {
          if (count == ++v10)
          {
            LODWORD(v10) = self->_count;
            break;
          }
        }
      }
      if ((int)count > (int)v10 + 1) {
        int v11 = v10 + 1;
      }
      else {
        int v11 = count - 1;
      }
      unsigned int v12 = v11 & ~(v11 >> 31);
      if (v10 == v12)
      {
        return controlPoints[v10];
      }
      else
      {
        double v13 = controlPoints[v10];
        double v14 = v6 - v13;
        if (self->_inverted) {
          double v15 = controlPoints[v12];
        }
        else {
          double v15 = controlPoints[v10];
        }
        if (self->_inverted) {
          double v14 = 1.0 - (v6 - v13);
        }
        else {
          double v13 = controlPoints[v12];
        }
        return v15 * v15 + (v13 - v15 * v15) * v14;
      }
    }
  }
  return result;
}

- (id)cloneModule
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (self->_count >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      double v5 = (void *)[objc_alloc(NSNumber) initWithDouble:self->_controlPoints[v4]];
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < self->_count);
  }
  double v6 = [[GKTerraceNoiseModifier alloc] initWithPeakInputValues:v3 terracesInverted:self->_inverted];

  return v6;
}

@end