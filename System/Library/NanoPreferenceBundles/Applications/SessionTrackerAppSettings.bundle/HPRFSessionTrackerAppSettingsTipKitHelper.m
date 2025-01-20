@interface HPRFSessionTrackerAppSettingsTipKitHelper
+ (void)sendWorkoutPlaylistSelectedTipEvent;
- (HPRFSessionTrackerAppSettingsTipKitHelper)init;
@end

@implementation HPRFSessionTrackerAppSettingsTipKitHelper

- (HPRFSessionTrackerAppSettingsTipKitHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TipKitHelper();
  return [(HPRFSessionTrackerAppSettingsTipKitHelper *)&v3 init];
}

+ (void)sendWorkoutPlaylistSelectedTipEvent
{
  id v0 = [(id)BiomeLibrary() Discoverability];
  swift_unknownObjectRelease();
  id v1 = [v0 Signals];
  swift_unknownObjectRelease();
  id v2 = [v1 source];

  id v3 = objc_allocWithZone((Class)BMDiscoverabilitySignals);
  NSString v4 = sub_20280();
  NSString v5 = sub_20280();
  id v6 = [v3 initWithContentIdentifier:v4 context:v5 osBuild:0 userInfo:0];

  [v2 sendEvent:v6];
  sub_1FDA0();
}

@end