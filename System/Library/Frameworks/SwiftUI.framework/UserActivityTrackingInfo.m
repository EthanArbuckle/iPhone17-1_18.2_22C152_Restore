@interface UserActivityTrackingInfo
- (NSString)description;
- (_TtC7SwiftUI24UserActivityTrackingInfo)init;
- (void)userActivityWillSave:(id)a3;
@end

@implementation UserActivityTrackingInfo

- (void)userActivityWillSave:(id)a3
{
  id v4 = a3;
  v5 = self;
  UserActivityTrackingInfo.userActivityWillSave(_:)((NSUserActivity)v4);
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = UserActivityTrackingInfo.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x18C115780](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (_TtC7SwiftUI24UserActivityTrackingInfo)init
{
  result = (_TtC7SwiftUI24UserActivityTrackingInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_weakDestroy();

  swift_bridgeObjectRelease();
}

@end