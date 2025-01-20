@interface AppEventEntityOcelot
+ (id)databaseTable;
@end

@implementation AppEventEntityOcelot

+ (id)databaseTable
{
  return @"app_events_ocelot";
}

@end