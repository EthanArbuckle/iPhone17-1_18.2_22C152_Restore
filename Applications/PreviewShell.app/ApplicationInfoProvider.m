@interface ApplicationInfoProvider
- (_TtC12PreviewShell23ApplicationInfoProvider)init;
- (id)applicationInfoForAuditToken:(id)a3;
- (id)applicationInfoForBundleIdentifier:(id)a3;
@end

@implementation ApplicationInfoProvider

- (id)applicationInfoForBundleIdentifier:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = self;
  id v5 = sub_10001876C();

  swift_bridgeObjectRelease();

  return v5;
}

- (id)applicationInfoForAuditToken:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 bundleID];
  if (v6)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    id v6 = sub_10001876C();
    swift_bridgeObjectRelease();
  }
  else
  {
  }

  return v6;
}

- (_TtC12PreviewShell23ApplicationInfoProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ApplicationInfoProvider();
  return [(ApplicationInfoProvider *)&v3 init];
}

@end