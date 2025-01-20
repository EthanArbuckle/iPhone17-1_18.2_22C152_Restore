@interface BLSHPauseWhenSceneBackgroundAttributeHandler
+ (Class)attributeBaseClass;
+ (Class)entryClass;
+ (id)attributeClasses;
@end

@implementation BLSHPauseWhenSceneBackgroundAttributeHandler

+ (id)attributeClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

+ (Class)attributeBaseClass
{
  return (Class)objc_opt_class();
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

@end