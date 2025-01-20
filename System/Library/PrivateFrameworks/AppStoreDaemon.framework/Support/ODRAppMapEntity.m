@interface ODRAppMapEntity
+ (id)databaseTable;
@end

@implementation ODRAppMapEntity

+ (id)databaseTable
{
  return @"odr_app_map";
}

@end