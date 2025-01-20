@interface DeviceRestrictionsManager
- (void)accountsDidChange:(id)a3;
- (void)updateDeviceRestrictions:(id)a3;
@end

@implementation DeviceRestrictionsManager

- (void)accountsDidChange:(id)a3
{
  uint64_t v4 = sub_10002572C(&qword_10021A5E0);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = type metadata accessor for Notification();
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = type metadata accessor for Notification();
    uint64_t v8 = 1;
  }
  sub_10002538C((uint64_t)v6, v8, 1, v7);
  swift_retain();
  sub_10005A870((uint64_t)v6);
  swift_release();
  sub_100019938((uint64_t)v6, &qword_10021A5E0);
}

- (void)updateDeviceRestrictions:(id)a3
{
  uint64_t v4 = sub_10002572C(&qword_10021A5E0);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = type metadata accessor for Notification();
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = type metadata accessor for Notification();
    uint64_t v8 = 1;
  }
  sub_10002538C((uint64_t)v6, v8, 1, v7);
  swift_retain();
  sub_10005A6B8();
  swift_release();
  sub_100019938((uint64_t)v6, &qword_10021A5E0);
}

@end