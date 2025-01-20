@interface PCUserAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (PCUserAlertViewController)initWithCoder:(id)a3;
- (PCUserAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didInvalidateForRemoteAlert;
- (void)handleButtonActions:(id)a3;
@end

@implementation PCUserAlertViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_10009DCAC;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_10009A898(a3, v6, v7);
  sub_10000F808((uint64_t)v6);
}

- (void)handleButtonActions:(id)a3
{
  sub_10001280C(0, &qword_1000F7060);
  sub_100012848();
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_10009ADF4(v4);

  swift_bridgeObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (PCUserAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PCUserAlertViewController();
  v9 = [(PCUserAlertViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (PCUserAlertViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PCUserAlertViewController();
  return [(PCUserAlertViewController *)&v5 initWithCoder:a3];
}

- (void)didInvalidateForRemoteAlert
{
  if (qword_1000F66B8 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10009CF7C(v0, (uint64_t)qword_1000FE850);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)v2 = 136315138;
    sub_10009CFB4(0xD00000000000001DLL, 0x80000001000BD820, &v4);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "%s", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

@end