@interface AppUpdateEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
@end

@implementation AppUpdateEntity

+ (id)databaseTable
{
  return @"app_updates";
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

@end