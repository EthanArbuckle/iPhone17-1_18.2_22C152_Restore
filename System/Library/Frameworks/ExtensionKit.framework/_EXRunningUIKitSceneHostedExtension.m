@interface _EXRunningUIKitSceneHostedExtension
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (_EXRunningUIKitSceneHostedExtension)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (int)_startWithArguments:(const char *)a3 count:(int)a4;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation _EXRunningUIKitSceneHostedExtension

- (int)_startWithArguments:(const char *)a3 count:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = self;
  LODWORD(v4) = sub_2156FBAD8((uint64_t)a3, v4);

  return v4;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_2156FD014();
    sub_21570E058();
  }
  id v6 = a3;
  v7 = self;
  [(_EXRunningExtension *)v7 willFinishLaunching];

  swift_bridgeObjectRelease();
  return 1;
}

- (void)applicationDidFinishLaunching:(id)a3
{
}

- (void)applicationWillResignActive:(id)a3
{
}

- (void)applicationDidBecomeActive:(id)a3
{
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v12 = (void *)sub_2156FC6C4(v9, v10);

  return v12;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = self;
  sub_2156FCBC8(v7, v8);

  swift_unknownObjectRelease();
}

- (_EXRunningUIKitSceneHostedExtension)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _EXRunningUIKitSceneHostedExtension();
  return [(_EXRunningUIKitSceneHostedExtension *)&v3 init];
}

@end