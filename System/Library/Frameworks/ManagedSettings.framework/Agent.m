@interface Agent
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC20ManagedSettingsAgent5Agent)init;
- (void)askToOverrideUnremovabilityOfApplication:(id)a3 teamIdentifier:(id)a4 replyHandler:(id)a5;
- (void)clearAllSettingsForRecordIdentifier:(id)a3 storeContainer:(id)a4 storeName:(id)a5 replyHandler:(id)a6;
- (void)clearEffectiveSubscription:(BOOL)a3;
- (void)collectDiagnostics:(id)a3;
- (void)deleteStores:(id)a3 recordIdentifier:(id)a4 storeContainer:(id)a5 replyHandler:(id)a6;
- (void)effectiveMediaSettings:(id)a3;
- (void)fetchConfigurationForBundleIdentifier:(id)a3 categoryIdentifier:(id)a4 categoryName:(id)a5 replyHandler:(id)a6;
- (void)fetchConfigurationForCategoryIdentifier:(id)a3 categoryName:(id)a4 replyHandler:(id)a5;
- (void)fetchConfigurationForWebDomain:(id)a3 categoryIdentifier:(id)a4 categoryName:(id)a5 replyHandler:(id)a6;
- (void)getAllSettingsForRecordIdentifier:(id)a3 storeContainer:(id)a4 storeName:(id)a5 replyHandler:(id)a6;
- (void)getStorePropertiesForRecordIdentifier:(id)a3 storeContainer:(id)a4 storeName:(id)a5 replyHandler:(id)a6;
- (void)getValuesForSettingNames:(id)a3 recordIdentifier:(id)a4 storeContainer:(id)a5 storeName:(id)a6 replyHandler:(id)a7;
- (void)handleAction:(int64_t)a3 bundleIdentifier:(id)a4 categoryIdentifier:(id)a5 replyHandler:(id)a6;
- (void)handleAction:(int64_t)a3 categoryIdentifier:(id)a4 replyHandler:(id)a5;
- (void)handleAction:(int64_t)a3 webDomain:(id)a4 categoryIdentifier:(id)a5 replyHandler:(id)a6;
- (void)removeValuesForSettingNames:(id)a3 recordIdentifier:(id)a4 storeContainer:(id)a5 storeName:(id)a6 replyHandler:(id)a7;
- (void)responsibleClientsForSetting:(id)a3 replyHandler:(id)a4;
- (void)setValues:(id)a3 recordIdentifier:(id)a4 storeContainer:(id)a5 storeName:(id)a6 replyHandler:(id)a7;
- (void)storeNamesForRecordIdentifier:(id)a3 storeContainer:(id)a4 replyHandler:(id)a5;
- (void)subscribeToEffectiveChangesForGroups:(id)a3 objC:(BOOL)a4;
- (void)updateEffectiveSettings:(id)a3;
- (void)updateStoreProperties:(id)a3 recordIdentifier:(id)a4 storeContainer:(id)a5 storeName:(id)a6 replyHandler:(id)a7;
- (void)updateStoreWithNewSettings:(id)a3 removedSettings:(id)a4 newProperties:(id)a5 fullReplacement:(BOOL)a6 recordIdentifier:(id)a7 storeContainer:(id)a8 storeName:(id)a9 replyHandler:(id)a10;
@end

@implementation Agent

- (void)subscribeToEffectiveChangesForGroups:(id)a3 objC:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_100002E44(v6, a4);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100003CAC(v7);

  return v9 & 1;
}

- (_TtC20ManagedSettingsAgent5Agent)init
{
  return (_TtC20ManagedSettingsAgent5Agent *)sub_10002C5B8();
}

- (void).cxx_destruct
{
  sub_100024504((uint64_t)self + OBJC_IVAR____TtC20ManagedSettingsAgent5Agent_postInstallMigrator);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)updateEffectiveSettings:(id)a3
{
}

- (void)effectiveMediaSettings:(id)a3
{
}

- (void)getValuesForSettingNames:(id)a3 recordIdentifier:(id)a4 storeContainer:(id)a5 storeName:(id)a6 replyHandler:(id)a7
{
}

- (void)getAllSettingsForRecordIdentifier:(id)a3 storeContainer:(id)a4 storeName:(id)a5 replyHandler:(id)a6
{
}

- (void)setValues:(id)a3 recordIdentifier:(id)a4 storeContainer:(id)a5 storeName:(id)a6 replyHandler:(id)a7
{
}

- (void)removeValuesForSettingNames:(id)a3 recordIdentifier:(id)a4 storeContainer:(id)a5 storeName:(id)a6 replyHandler:(id)a7
{
}

- (void)clearAllSettingsForRecordIdentifier:(id)a3 storeContainer:(id)a4 storeName:(id)a5 replyHandler:(id)a6
{
  uint64_t v9 = sub_100003C68((uint64_t *)&unk_100077410);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a6);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v17 = v16;
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v20 = v19;
  _Block_copy(v12);
  v21 = self;
  sub_10002F6F4((uint64_t)v11, v15, v17, v18, v20, (uint64_t)v21, (uint64_t)v12);
  _Block_release(v12);
  _Block_release(v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100006E84((uint64_t)v11, (uint64_t *)&unk_100077410);
}

- (void)deleteStores:(id)a3 recordIdentifier:(id)a4 storeContainer:(id)a5 replyHandler:(id)a6
{
  uint64_t v10 = sub_100003C68((uint64_t *)&unk_100077410);
  __chkstk_darwin(v10 - 8);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a6);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v12, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  }
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v18 = v17;
  _Block_copy(v13);
  id v19 = a3;
  unint64_t v20 = self;
  sub_10002FC50((uint64_t)v19, (uint64_t)v12, v16, v18, (uint64_t)v20, (uint64_t)v13);
  _Block_release(v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  sub_100006E84((uint64_t)v12, (uint64_t *)&unk_100077410);
}

- (void)getStorePropertiesForRecordIdentifier:(id)a3 storeContainer:(id)a4 storeName:(id)a5 replyHandler:(id)a6
{
}

- (void)updateStoreProperties:(id)a3 recordIdentifier:(id)a4 storeContainer:(id)a5 storeName:(id)a6 replyHandler:(id)a7
{
}

- (void)updateStoreWithNewSettings:(id)a3 removedSettings:(id)a4 newProperties:(id)a5 fullReplacement:(BOOL)a6 recordIdentifier:(id)a7 storeContainer:(id)a8 storeName:(id)a9 replyHandler:(id)a10
{
  BOOL v32 = a6;
  uint64_t v15 = sub_100003C68((uint64_t *)&unk_100077410);
  __chkstk_darwin(v15 - 8);
  unint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v18 = _Block_copy(a10);
  if (a7)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 0, 1, v19);
  }
  else
  {
    uint64_t v20 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  }
  uint64_t v21 = (void (*)(char *, uint64_t))static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v23 = v22;
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v26 = v25;
  _Block_copy(v18);
  id v27 = a3;
  id v28 = a4;
  id v29 = a5;
  v30 = self;
  sub_100030BEC((uint64_t)v27, (uint64_t)v28, (uint64_t)v29, v32, (uint64_t)v17, v21, v23, v24, v26, (uint64_t)v30, (uint64_t)v18);
  _Block_release(v18);
  _Block_release(v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100006E84((uint64_t)v17, (uint64_t *)&unk_100077410);
}

- (void)storeNamesForRecordIdentifier:(id)a3 storeContainer:(id)a4 replyHandler:(id)a5
{
  uint64_t v8 = sub_100003C68((uint64_t *)&unk_100077410);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (void (*)(char *, uint64_t))((char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = _Block_copy(a5);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(void (*)(char *, uint64_t), void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for UUID();
    (*(void (**)(void (*)(char *, uint64_t), uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;
  _Block_copy(v11);
  unint64_t v17 = self;
  sub_1000312A4(v10, v14, v16, (uint64_t)v17, (uint64_t)v11);
  _Block_release(v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  sub_100006E84((uint64_t)v10, (uint64_t *)&unk_100077410);
}

- (void)collectDiagnostics:(id)a3
{
}

- (void)askToOverrideUnremovabilityOfApplication:(id)a3 teamIdentifier:(id)a4 replyHandler:(id)a5
{
}

- (void)fetchConfigurationForBundleIdentifier:(id)a3 categoryIdentifier:(id)a4 categoryName:(id)a5 replyHandler:(id)a6
{
}

- (void)fetchConfigurationForCategoryIdentifier:(id)a3 categoryName:(id)a4 replyHandler:(id)a5
{
}

- (void)fetchConfigurationForWebDomain:(id)a3 categoryIdentifier:(id)a4 categoryName:(id)a5 replyHandler:(id)a6
{
}

- (void)handleAction:(int64_t)a3 bundleIdentifier:(id)a4 categoryIdentifier:(id)a5 replyHandler:(id)a6
{
}

- (void)handleAction:(int64_t)a3 categoryIdentifier:(id)a4 replyHandler:(id)a5
{
  id v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  _Block_copy(v7);
  uint64_t v11 = self;
  sub_10003232C(a3, v8, v10, (uint64_t)v11, v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)handleAction:(int64_t)a3 webDomain:(id)a4 categoryIdentifier:(id)a5 replyHandler:(id)a6
{
}

- (void)responsibleClientsForSetting:(id)a3 replyHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  sub_1000326D0(v6, v8, (uint64_t)v9, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)clearEffectiveSubscription:(BOOL)a3
{
  v5 = self;
  uint64_t v6 = self;
  unint64_t v7 = (_TtC20ManagedSettingsAgent5Agent *)[v5 currentConnection];
  if (v7)
  {
    uint64_t v9 = v7;
    if (qword_100076398 != -1) {
      swift_once();
    }
    sub_1000086E8((int)[(Agent *)v9 processIdentifier], a3);

    unint64_t v8 = v9;
  }
  else
  {
    unint64_t v8 = v6;
  }
}

@end