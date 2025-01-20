@interface GKAddNoiseModifier
- (GKAddNoiseModifier)init;
- (double)valueAt:(GKAddNoiseModifier *)self;
- (id)cloneModule;
- (int)requiredInputModuleCount;
@end

@implementation GKAddNoiseModifier

- (GKAddNoiseModifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKAddNoiseModifier;
  return [(GKNoiseModifier *)&v3 initWithInputModuleCount:2];
}

- (int)requiredInputModuleCount
{
  return 2;
}

- (double)valueAt:(GKAddNoiseModifier *)self
{
  long long v11 = v2[1];
  long long v12 = *v2;
  v4 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:0];
  v14[0] = v12;
  v14[1] = v11;
  [v4 valueAt:v14];
  double v6 = v5;

  v7 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:1];
  v13[0] = v12;
  v13[1] = v11;
  [v7 valueAt:v13];
  double v9 = v8;

  return v9 + v6;
}

- (id)cloneModule
{
  v2 = objc_alloc_init(GKAddNoiseModifier);

  return v2;
}

@end