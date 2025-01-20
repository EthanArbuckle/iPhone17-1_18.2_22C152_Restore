@interface ProximityReaderSceneUIAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC22ProximityReaderSceneUI33ProximityReaderSceneUIAppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation ProximityReaderSceneUIAppDelegate

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
  id v12 = sub_10000DC28(v9);

  return v12;
}

- (_TtC22ProximityReaderSceneUI33ProximityReaderSceneUIAppDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProximityReaderSceneUIAppDelegate();
  return [(ProximityReaderSceneUIAppDelegate *)&v3 init];
}

@end