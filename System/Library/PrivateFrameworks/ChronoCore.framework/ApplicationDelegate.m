@interface ApplicationDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC10ChronoCore19ApplicationDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation ApplicationDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1DAC5572C();
    sub_1DAD277B8();
  }
  uint64_t v6 = qword_1EBE45588;
  id v7 = a3;
  v8 = self;
  if (v6 != -1) {
    swift_once();
  }
  sub_1DAB9FC70();

  swift_bridgeObjectRelease();
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  BSDispatchQueueAssertMain();
  id v12 = objc_msgSend(v9, sel_role);
  uint64_t v13 = sub_1DAC55464();
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1B88]), sel_initWithName_sessionRole_, 0, v12);
  if (v13) {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  }
  else {
    uint64_t ObjCClassFromMetadata = 0;
  }
  objc_msgSend(v14, sel_setDelegateClass_, ObjCClassFromMetadata);

  return v14;
}

- (_TtC10ChronoCore19ApplicationDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ApplicationDelegate();
  return [(ApplicationDelegate *)&v3 init];
}

@end