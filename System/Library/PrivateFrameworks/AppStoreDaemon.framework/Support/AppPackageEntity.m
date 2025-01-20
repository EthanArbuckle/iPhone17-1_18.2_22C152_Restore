@interface AppPackageEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
@end

@implementation AppPackageEntity

+ (id)databaseTable
{
  return @"app_package";
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

@end