@interface GKInvertNoiseModifier
- (GKInvertNoiseModifier)init;
- (double)valueAt:(GKInvertNoiseModifier *)self;
- (id)cloneModule;
- (int)requiredInputModuleCount;
@end

@implementation GKInvertNoiseModifier

- (GKInvertNoiseModifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKInvertNoiseModifier;
  return [(GKNoiseModifier *)&v3 initWithInputModuleCount:1];
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKInvertNoiseModifier *)self
{
  long long v7 = v2[1];
  long long v8 = *v2;
  objc_super v3 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:0];
  v9[0] = v8;
  v9[1] = v7;
  [v3 valueAt:v9];
  double v5 = v4;

  return -v5;
}

- (id)cloneModule
{
  v2 = objc_alloc_init(GKInvertNoiseModifier);

  return v2;
}

@end