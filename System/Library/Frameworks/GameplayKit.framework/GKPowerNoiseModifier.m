@interface GKPowerNoiseModifier
- (GKPowerNoiseModifier)init;
- (double)valueAt:(GKPowerNoiseModifier *)self;
- (id)cloneModule;
- (int)requiredInputModuleCount;
@end

@implementation GKPowerNoiseModifier

- (GKPowerNoiseModifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKPowerNoiseModifier;
  return [(GKNoiseModifier *)&v3 initWithInputModuleCount:2];
}

- (int)requiredInputModuleCount
{
  return 2;
}

- (double)valueAt:(GKPowerNoiseModifier *)self
{
  long long v11 = v2[1];
  long long v12 = *v2;
  v4 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:0];
  v14[0] = v12;
  v14[1] = v11;
  [v4 valueAt:v14];
  long double v6 = v5;

  v7 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:1];
  v13[0] = v12;
  v13[1] = v11;
  [v7 valueAt:v13];
  long double v9 = v8;

  return pow(v6, v9);
}

- (id)cloneModule
{
  v2 = objc_alloc_init(GKPowerNoiseModifier);

  return v2;
}

@end