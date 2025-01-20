@interface AppCapabilitiesService
+ (NSString)entitlement;
+ (_TtC9appstored22AppCapabilitiesService)defaultService;
- (BOOL)validateAction:(int64_t)a3 bundleID:(id)a4 capabilities:(id)a5 logKey:(id)a6 error:(id *)a7;
- (_TtC9appstored22AppCapabilitiesService)init;
- (void)isCapable:(ASDAppCapabilityMetadata *)a3 withCompletionHandler:(id)a4;
- (void)showIneligibleAlert;
@end

@implementation AppCapabilitiesService

+ (_TtC9appstored22AppCapabilitiesService)defaultService
{
  if (qword_1005A2FA0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1005B1448;
  return (_TtC9appstored22AppCapabilitiesService *)v2;
}

+ (NSString)entitlement
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

- (void)isCapable:(ASDAppCapabilityMetadata *)a3 withCompletionHandler:(id)a4
{
  uint64_t v7 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1005A3AB8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1005A35A0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1000DFAB0((uint64_t)v9, (uint64_t)&unk_1005A4930, (uint64_t)v14);
  swift_release();
}

- (BOOL)validateAction:(int64_t)a3 bundleID:(id)a4 capabilities:(id)a5 logKey:(id)a6 error:(id *)a7
{
  uint64_t v8 = (uint64_t)a5;
  if (!a4)
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (v8) {
LABEL_3:
  }
    uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  id v14 = a6;
  v15 = self;
  sub_100032AD8(a3, v11, v13, v8, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC9appstored22AppCapabilitiesService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppCapabilitiesService();
  return [(AppCapabilitiesService *)&v3 init];
}

- (void)showIneligibleAlert
{
  uint64_t v0 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v0 - 8);
  String.LocalizationValue.init(stringLiteral:)();
  String.init(appStoreDaemonLocalized:comment:)();
  String.LocalizationValue.init(stringLiteral:)();
  String.init(appStoreDaemonLocalized:comment:)();
  String.LocalizationValue.init(stringLiteral:)();
  String.init(appStoreDaemonLocalized:comment:)();
  id v1 = objc_allocWithZone((Class)AMSDialogRequest);
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v4 = [v1 initWithTitle:v2 message:v3];

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [self actionWithTitle:v5];

  [v4 addButtonAction:v6];
  id v7 = [objc_allocWithZone((Class)AMSSystemAlertDialogTask) initWithRequest:v4];
  id v8 = [v7 present];
}

@end