@interface TamaleAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC6Tamale17TamaleAppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation TamaleAppDelegate

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
  id v12 = sub_100068918(v9);

  return v12;
}

- (_TtC6Tamale17TamaleAppDelegate)init
{
  return (_TtC6Tamale17TamaleAppDelegate *)sub_100068860(self, (uint64_t)a2, type metadata accessor for TamaleAppDelegate);
}

@end