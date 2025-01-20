@interface ASUIServerManager
- (_TtC16AccessorySetupUI17ASUIServerManager)init;
- (void)dealloc;
- (void)failAccessory:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)renameAccessory:(id)a3 currentName:(id)a4 updateSSID:(id)a5 overrideBundleID:(id)a6;
- (void)showMigrationPickerWithOverrideBundleID:(id)a3;
- (void)showPickerWithOverrideBundleID:(id)a3 shouldRetrieveDisplayItems:(id)a4 needsBluetooth:(id)a5 needsWiFi:(id)a6;
- (void)updateMigrationDisplayCount:(id)a3;
@end

@implementation ASUIServerManager

- (_TtC16AccessorySetupUI17ASUIServerManager)init
{
  sub_100037E18();
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_100038358();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();

  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16AccessorySetupUI17ASUIServerManager_currentClientModel);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_10003C9F0(v8);

  swift_unknownObjectRelease();
}

- (void)failAccessory:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  id v7 = self;
  sub_1000393B4(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)updateMigrationDisplayCount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10003A560(v4);
}

- (void)showPickerWithOverrideBundleID:(id)a3 shouldRetrieveDisplayItems:(id)a4 needsBluetooth:(id)a5 needsWiFi:(id)a6
{
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = 0;
    unint64_t v12 = 0;
  }
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = self;
  sub_10003A738(v10, v12, v13, v14, v15);

  swift_bridgeObjectRelease();
}

- (void)showMigrationPickerWithOverrideBundleID:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
  }
  id v7 = self;
  sub_10003B2B8(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)renameAccessory:(id)a3 currentName:(id)a4 updateSSID:(id)a5 overrideBundleID:(id)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;
  if (a6)
  {
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a6 = v16;
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v17 = a5;
  v18 = self;
  sub_10003BF3C(v9, v11, v12, v14, v17, v15, (unint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_10003C59C(v4);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_10003CDAC();
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_10003CEE0((uint64_t)a4);
}

@end