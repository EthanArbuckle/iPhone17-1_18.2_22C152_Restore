@interface HMDActionModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)properties;
@end

@implementation HMDActionModel

+ (id)properties
{
  return (id)MEMORY[0x263EFFA78];
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"actionSet";
}

@end