@interface MagnifierApplicationDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC16MagnifierSupport28MagnifierApplicationDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
@end

@implementation MagnifierApplicationDelegate

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = objc_msgSend(v9, sel_role);
  id v13 = objc_allocWithZone(MEMORY[0x263F82B48]);
  v14 = (void *)sub_235949A88();
  id v15 = objc_msgSend(v13, sel_initWithName_sessionRole_, v14, v12);

  return v15;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_235692DF8();
    sub_235949978();
  }
  id v6 = a3;
  v7 = self;
  char v8 = _s16MagnifierSupport0A19ApplicationDelegateC11application_29didFinishLaunchingWithOptionsSbSo13UIApplicationC_SDySo0k6LaunchJ3KeyaypGSgtF_0();

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  uint64_t v6 = qword_26880E5D0;
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  if (v6 != -1) {
    swift_once();
  }
  int v10 = byte_268812C69;

  if (v10) {
    return 2;
  }
  else {
    return 30;
  }
}

- (_TtC16MagnifierSupport28MagnifierApplicationDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MagnifierApplicationDelegate *)&v3 init];
}

@end