@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (_TtC18DKPairingUIService11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = [v9 role];
  id v13 = objc_allocWithZone((Class)UISceneConfiguration);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v13 initWithName:v14 sessionRole:v12];

  return v15;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  uint64_t v7 = sub_100005664(&qword_10001E150);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10);
  NSString v14 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v26 - v15;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v17 = objc_allocWithZone((Class)type metadata accessor for DockKitCorePairingService());
  id v27 = a3;
  v18 = self;
  id v19 = [v17 init];
  uint64_t v20 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v9, 1, 1, v20);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  type metadata accessor for MainActor();
  id v21 = v19;
  uint64_t v22 = static MainActor.shared.getter();
  unint64_t v23 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = v22;
  *((void *)v24 + 3) = &protocol witness table for MainActor;
  *((void *)v24 + 4) = v21;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v24[v23], v14, v10);
  sub_100010F80((uint64_t)v9, (uint64_t)&unk_10001E4F8, (uint64_t)v24);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  return 1;
}

- (_TtC18DKPairingUIService11AppDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return [(AppDelegate *)&v3 init];
}

@end