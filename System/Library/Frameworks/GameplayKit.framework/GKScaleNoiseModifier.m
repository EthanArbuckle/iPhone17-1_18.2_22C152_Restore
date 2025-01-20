@interface GKScaleNoiseModifier
- (GKScaleNoiseModifier)init;
- (GKScaleNoiseModifier)initWithFactor:(GKScaleNoiseModifier *)self;
- (GKScaleNoiseModifier)initWithInputModuleCount:(unint64_t)a3;
- (double)valueAt:(GKScaleNoiseModifier *)self;
- (id)cloneModule;
- (int)requiredInputModuleCount;
@end

@implementation GKScaleNoiseModifier

- (GKScaleNoiseModifier)init
{
  __asm { FMOV            V0.2D, #1.0 }
  v8[0] = _Q0;
  v8[1] = _Q0;
  return [(GKScaleNoiseModifier *)self initWithFactor:v8];
}

- (GKScaleNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  __asm { FMOV            V0.2D, #1.0 }
  v9[0] = _Q0;
  v9[1] = _Q0;
  return [(GKScaleNoiseModifier *)self initWithFactor:v9];
}

- (GKScaleNoiseModifier)initWithFactor:(GKScaleNoiseModifier *)self
{
  long long v4 = v2[1];
  long long v5 = *v2;
  v6.receiver = self;
  v6.super_class = (Class)GKScaleNoiseModifier;
  result = [(GKNoiseModifier *)&v6 initWithInputModuleCount:1];
  if (result)
  {
    *(_OWORD *)result->_factor = v5;
    *(_OWORD *)&result->_factor[16] = v4;
  }
  return result;
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKScaleNoiseModifier *)self
{
  float64x2_t v7 = vmulq_f64(*(float64x2_t *)&self->_factor[16], v2[1]);
  float64x2_t v8 = vmulq_f64(*(float64x2_t *)self->_factor, *v2);
  v3 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:0];
  v9[0] = v8;
  v9[1] = v7;
  [v3 valueAt:v9];
  double v5 = v4;

  return v5;
}

- (id)cloneModule
{
  v3 = [GKScaleNoiseModifier alloc];
  long long v4 = *(_OWORD *)&self->_factor[16];
  v7[0] = *(_OWORD *)self->_factor;
  v7[1] = v4;
  double v5 = [(GKScaleNoiseModifier *)v3 initWithFactor:v7];

  return v5;
}

@end