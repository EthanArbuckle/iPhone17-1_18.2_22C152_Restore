@interface AppEventEntityOcelotPayout
+ (id)databaseTable;
@end

@implementation AppEventEntityOcelotPayout

+ (id)databaseTable
{
  return @"app_events_ocelot_payout";
}

@end