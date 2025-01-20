@interface BuddyStartOverAnalytics
+ (void)addEraseEventWithAnalyticsManager:(id)a3 paneIdentifier:(id)a4;
+ (void)addRestartEventWithAnalyticsManager:(id)a3 paneIdentifier:(id)a4;
- (_TtC5Setup23BuddyStartOverAnalytics)init;
@end

@implementation BuddyStartOverAnalytics

+ (void)addRestartEventWithAnalyticsManager:(id)a3 paneIdentifier:(id)a4
{
}

+ (void)addEraseEventWithAnalyticsManager:(id)a3 paneIdentifier:(id)a4
{
}

- (_TtC5Setup23BuddyStartOverAnalytics)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BuddyStartOverAnalytics();
  return [(BuddyStartOverAnalytics *)&v3 init];
}

@end