@interface GKAbsoluteValueNoiseModifier
- (GKAbsoluteValueNoiseModifier)init;
- (double)valueAt:(GKAbsoluteValueNoiseModifier *)self;
- (id)cloneModule;
- (int)requiredInputModuleCount;
@end

@implementation GKAbsoluteValueNoiseModifier

- (GKAbsoluteValueNoiseModifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKAbsoluteValueNoiseModifier;
  return [(GKNoiseModifier *)&v3 initWithInputModuleCount:1];
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKAbsoluteValueNoiseModifier *)self
{
  long long v7 = v2[1];
  long long v8 = *v2;
  objc_super v3 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:0];
  v9[0] = v8;
  v9[1] = v7;
  [v3 valueAt:v9];
  double v5 = v4;

  return fabs(v5);
}

- (id)cloneModule
{
  v2 = objc_alloc_init(GKAbsoluteValueNoiseModifier);

  return v2;
}

@end