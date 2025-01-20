@interface GCGenericArcadeStickModelBuilder
+ (Class)modelClass;
- (id)build;
- (void)initializeWithModel:(id)a3;
@end

@implementation GCGenericArcadeStickModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericArcadeStickModelBuilder;
  [(GCGenericDeviceModelBuilder *)&v3 initializeWithModel:a3];
}

- (id)build
{
  v4.receiver = self;
  v4.super_class = (Class)GCGenericArcadeStickModelBuilder;
  v2 = [(GCGenericDeviceModelBuilder *)&v4 build];

  return v2;
}

@end