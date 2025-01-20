@interface RestoreKeeper
+ (BOOL)activeRestoreSupportEnabled;
+ (_TtC9appstored13RestoreKeeper)shared;
- (BOOL)hasRestoringCoordinatorForBundleID:(id)a3 logKey:(id)a4;
- (_TtC9appstored13RestoreKeeper)init;
- (id)installForBundleID:(id)a3;
- (id)restoringCoordinatorForBundleID:(id)a3 logKey:(id)a4;
- (void)displayDeleteActiveRestoreDialogWithBundleID:(id)a3 logKey:(id)a4 completion:(id)a5;
- (void)handleActiveRestoreWithCoordinator:(id)a3 userInitiated:(BOOL)a4 logKey:(id)a5;
@end

@implementation RestoreKeeper

+ (_TtC9appstored13RestoreKeeper)shared
{
  if (qword_1005A2FF0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1005B14A8;
  return (_TtC9appstored13RestoreKeeper *)v2;
}

+ (BOOL)activeRestoreSupportEnabled
{
  uint64_t v2 = type metadata accessor for FeatureFlag();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  if (([v6 deviceIsAppleTV] & 1) != 0
    || [v6 deviceIsAudioAccessory])
  {
    char v7 = 0;
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for FeatureFlag.activeRestore(_:), v2);
    char v7 = asd_isFeatureEnabled(_:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v7 & 1;
}

- (void)displayDeleteActiveRestoreDialogWithBundleID:(id)a3 logKey:(id)a4 completion:(id)a5
{
  char v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a4;
  v12 = self;
  sub_100050330(v8, v10, v11, (char *)v12, (void (**)(const void *, void *))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)handleActiveRestoreWithCoordinator:(id)a3 userInitiated:(BOOL)a4 logKey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = self;
  sub_1000513C8(v8, a4, v9);
}

- (BOOL)hasRestoringCoordinatorForBundleID:(id)a3 logKey:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a4;
  uint64_t v10 = self;
  LOBYTE(v6) = sub_10005205C(v6, v8, v9);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (id)installForBundleID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_100050E1C(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)restoringCoordinatorForBundleID:(id)a3 logKey:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = sub_100051C7C(v6, v8, v9);

  swift_bridgeObjectRelease();
  return v11;
}

- (_TtC9appstored13RestoreKeeper)init
{
  uint64_t v3 = OBJC_IVAR____TtC9appstored13RestoreKeeper_lockedRestores;
  sub_10001644C(&qword_1005A43D8);
  uint64_t v4 = swift_allocObject();
  *(_DWORD *)(v4 + 24) = 0;
  *(void *)(v4 + 16) = &_swiftEmptyDictionarySingleton;
  *(Class *)((char *)&self->super.isa + v3) = (Class)v4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RestoreKeeper();
  return [(RestoreKeeper *)&v6 init];
}

- (void).cxx_destruct
{
}

@end