@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC23LimitedAccessPromptView11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation AppDelegate

- (_TtC23LimitedAccessPromptView11AppDelegate)init
{
  return (_TtC23LimitedAccessPromptView11AppDelegate *)sub_10001CCC8(self, (uint64_t)a2, type metadata accessor for AppDelegate);
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = [v9 role];
  id v13 = [objc_allocWithZone((Class)UISceneConfiguration) initWithName:0 sessionRole:v12];

  type metadata accessor for LimitedAccessPromptSceneDelegate();
  [v13 setDelegateClass:swift_getObjCClassFromMetadata()];

  return v13;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

@end