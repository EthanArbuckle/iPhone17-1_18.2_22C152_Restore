@interface AppEventEntityPersonalization
+ (id)databaseTable;
@end

@implementation AppEventEntityPersonalization

+ (id)databaseTable
{
  return @"app_events_personalization";
}

@end