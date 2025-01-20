@interface GKMoveNoiseModifier
- (GKMoveNoiseModifier)init;
- (GKMoveNoiseModifier)initWithDelta:(GKMoveNoiseModifier *)self;
- (GKMoveNoiseModifier)initWithInputModuleCount:(unint64_t)a3;
- (double)valueAt:(GKMoveNoiseModifier *)self;
- (id)cloneModule;
- (int)requiredInputModuleCount;
@end

@implementation GKMoveNoiseModifier

- (GKMoveNoiseModifier)init
{
  v3[0] = 0;
  v3[1] = 0;
  long long v4 = 0u;
  return [(GKMoveNoiseModifier *)self initWithDelta:v3];
}

- (GKMoveNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  v4[0] = 0;
  v4[1] = 0;
  long long v5 = 0u;
  return [(GKMoveNoiseModifier *)self initWithDelta:v4];
}

- (GKMoveNoiseModifier)initWithDelta:(GKMoveNoiseModifier *)self
{
  long long v4 = v2[1];
  long long v5 = *v2;
  v6.receiver = self;
  v6.super_class = (Class)GKMoveNoiseModifier;
  result = [(GKNoiseModifier *)&v6 initWithInputModuleCount:1];
  if (result)
  {
    *(_OWORD *)result->_delta = v5;
    *(_OWORD *)&result->_delta[16] = v4;
  }
  return result;
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKMoveNoiseModifier *)self
{
  float64x2_t v10 = *v2;
  double v4 = v2[1].f64[0];
  long long v5 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:0];
  *(double *)&long long v6 = *(double *)&self->_delta[16] + v4;
  v11[0] = vaddq_f64(*(float64x2_t *)self->_delta, v10);
  v11[1] = v6;
  [v5 valueAt:v11];
  double v8 = v7;

  return v8;
}

- (id)cloneModule
{
  v3 = [GKMoveNoiseModifier alloc];
  long long v4 = *(_OWORD *)&self->_delta[16];
  v7[0] = *(_OWORD *)self->_delta;
  v7[1] = v4;
  long long v5 = [(GKMoveNoiseModifier *)v3 initWithDelta:v7];

  return v5;
}

@end