@interface ViewController
- (_TtC10SMS_Filter14ViewController)initWithCoder:(id)a3;
- (_TtC10SMS_Filter14ViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)goToSettings:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ViewController();
  [(ViewController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ViewController();
  id v4 = v6.receiver;
  [(ViewController *)&v6 viewDidAppear:v3];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100005DB0;
  *(void *)(v5 + 56) = &type metadata for String;
  strcpy((char *)(v5 + 32), "VIEW APPEARED");
  *(_WORD *)(v5 + 46) = -4864;
  print(_:separator:terminator:)();

  swift_bridgeObjectRelease();
}

- (void)goToSettings:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  specialized ViewController.goToSettings(_:)();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (_TtC10SMS_Filter14ViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for ViewController();
  v9 = [(ViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC10SMS_Filter14ViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ViewController();
  return [(ViewController *)&v5 initWithCoder:a3];
}

@end