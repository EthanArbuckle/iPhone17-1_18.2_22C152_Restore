@interface ComplementaryPasscodeViewController
- (_TtC10CoreAuthUI35ComplementaryPasscodeViewController)initWithCoder:(id)a3;
- (_TtC10CoreAuthUI35ComplementaryPasscodeViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7;
- (_TtC10CoreAuthUI35ComplementaryPasscodeViewController)initWithInternalInfo:(id)a3 parent:(id)a4;
- (_TtC10CoreAuthUI35ComplementaryPasscodeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissChildWithCompletionHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ComplementaryPasscodeViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(TransitionViewController *)&v4 viewDidLoad];
  if (objc_msgSend(self, "isSharedIPad", v4.receiver, v4.super_class))
  {
    id v3 = [objc_allocWithZone((Class)LALocalBackoffCounter) init];
    [v2 setBackoffCounter:v3];

    id v2 = v3;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_100054A40(a3);
}

- (void)dismissChildWithCompletionHandler:(id)a3
{
  objc_super v4 = _Block_copy(a3);
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
  sub_1000554C0((uint64_t)v7, v6);
  sub_10002A998((uint64_t)v7);
}

- (_TtC10CoreAuthUI35ComplementaryPasscodeViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7
{
  BOOL v7 = a7;
  ObjectType = (objc_class *)swift_getObjectType();
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v16.receiver = self;
  v16.super_class = ObjectType;
  v14 = [(TransitionViewController *)&v16 initWithInternalInfo:isa mechanism:a4 backoffCounter:a5 remoteUIHost:a6 allowsLandscape:v7];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v14;
}

- (_TtC10CoreAuthUI35ComplementaryPasscodeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v8 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(ComplementaryPasscodeViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC10CoreAuthUI35ComplementaryPasscodeViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(ComplementaryPasscodeViewController *)&v5 initWithCoder:a3];
}

- (_TtC10CoreAuthUI35ComplementaryPasscodeViewController)initWithInternalInfo:(id)a3 parent:(id)a4
{
  if (!a3)
  {
    uint64_t v5 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    memset(v7, 0, sizeof(v7));
    return (_TtC10CoreAuthUI35ComplementaryPasscodeViewController *)sub_100055C9C(v5, (uint64_t)v7);
  }
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC10CoreAuthUI35ComplementaryPasscodeViewController *)sub_100055C9C(v5, (uint64_t)v7);
}

@end