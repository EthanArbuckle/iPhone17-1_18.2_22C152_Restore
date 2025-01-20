@interface AppDoneEntity
+ (id)databaseTable;
@end

@implementation AppDoneEntity

+ (id)databaseTable
{
  return @"app_done";
}

@end