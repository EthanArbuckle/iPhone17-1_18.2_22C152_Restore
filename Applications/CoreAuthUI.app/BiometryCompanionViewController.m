@interface BiometryCompanionViewController
- (_TtC10CoreAuthUI31BiometryCompanionViewController)initWithCoder:(id)a3;
- (_TtC10CoreAuthUI31BiometryCompanionViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7;
- (_TtC10CoreAuthUI31BiometryCompanionViewController)initWithInternalInfo:(id)a3 parent:(id)a4;
- (_TtC10CoreAuthUI31BiometryCompanionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissChildWithCompletionHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BiometryCompanionViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1000463E4(a3);
}

- (void)dismissChildWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = (void *)swift_allocObject();
    v6[2] = v5;
    v7 = sub_10002A9E0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_1000468F0((uint64_t)v7, v6);
  sub_10002A998((uint64_t)v7);
}

- (_TtC10CoreAuthUI31BiometryCompanionViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7
{
  BOOL v16 = a7;
  ObjectType = (objc_class *)swift_getObjectType();
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v12 = self;
  sub_100048C74();
  sub_100048C8C();
  *(void *)&v12->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType] = 0;

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v17.receiver = v12;
  v17.super_class = ObjectType;
  v14 = [(TransitionViewController *)&v17 initWithInternalInfo:isa mechanism:a4 backoffCounter:a5 remoteUIHost:a6 allowsLandscape:v16];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v14;
}

- (_TtC10CoreAuthUI31BiometryCompanionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC10CoreAuthUI31BiometryCompanionViewController *)sub_100046EE0(v5, v7, a4);
}

- (_TtC10CoreAuthUI31BiometryCompanionViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = a3;
  uint64_t v7 = self;
  sub_100048C74();
  sub_100048C8C();
  *(void *)&v7->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType] = 0;

  v10.receiver = v7;
  v10.super_class = ObjectType;
  id v8 = [(BiometryCompanionViewController *)&v10 initWithCoder:v6];

  return v8;
}

- (_TtC10CoreAuthUI31BiometryCompanionViewController)initWithInternalInfo:(id)a3 parent:(id)a4
{
  if (!a3)
  {
    uint64_t v5 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    memset(v7, 0, sizeof(v7));
    return (_TtC10CoreAuthUI31BiometryCompanionViewController *)sub_1000472D0(v5, (uint64_t)v7);
  }
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC10CoreAuthUI31BiometryCompanionViewController *)sub_1000472D0(v5, (uint64_t)v7);
}

- (void).cxx_destruct
{
  v2 = &self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_log];
  uint64_t v3 = type metadata accessor for Logger();
  v4 = *(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end