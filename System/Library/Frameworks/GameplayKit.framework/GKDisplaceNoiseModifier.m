@interface GKDisplaceNoiseModifier
- (GKDisplaceNoiseModifier)init;
- (double)valueAt:(GKDisplaceNoiseModifier *)self;
- (id)cloneModule;
- (int)requiredInputModuleCount;
@end

@implementation GKDisplaceNoiseModifier

- (GKDisplaceNoiseModifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKDisplaceNoiseModifier;
  return [(GKNoiseModifier *)&v3 initWithInputModuleCount:4];
}

- (int)requiredInputModuleCount
{
  return 4;
}

- (double)valueAt:(GKDisplaceNoiseModifier *)self
{
  long long v17 = v2[1];
  long long v18 = *v2;
  v4 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:1];
  v23[0] = v18;
  v23[1] = v17;
  [v4 valueAt:v23];
  uint64_t v16 = v5;

  v6 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:2];
  v22[0] = v18;
  v22[1] = v17;
  [v6 valueAt:v22];
  uint64_t v15 = v7;

  v8 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:3];
  v21[0] = v18;
  v21[1] = v17;
  [v8 valueAt:v21];
  long long v19 = v9;

  v10 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:0];
  *(void *)&long long v11 = v16;
  *((void *)&v11 + 1) = v15;
  v20[0] = v11;
  v20[1] = v19;
  [v10 valueAt:v20];
  double v13 = v12;

  return v13;
}

- (id)cloneModule
{
  v2 = objc_alloc_init(GKDisplaceNoiseModifier);

  return v2;
}

@end