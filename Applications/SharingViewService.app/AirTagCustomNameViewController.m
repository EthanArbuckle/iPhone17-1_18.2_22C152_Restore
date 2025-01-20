@interface AirTagCustomNameViewController
- (_TtC18SharingViewService30AirTagCustomNameViewController)initWithContentView:(id)a3;
- (void)updateContinueButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AirTagCustomNameViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100077214();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  [(AirTagCustomNameViewController *)&v5 viewDidAppear:v3];
  [*(id *)&v4[OBJC_IVAR____TtC18SharingViewService30AirTagCustomNameViewController_nameField] becomeFirstResponder];
}

- (void)updateContinueButton
{
  v2 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService30AirTagCustomNameViewController_continueAction];
  BOOL v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService30AirTagCustomNameViewController_nameField];
  v8 = self;
  id v4 = [v3 text];
  if (v4)
  {
    objc_super v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v6 = String.count.getter();
    swift_bridgeObjectRelease();
    BOOL v7 = v6 > 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  [v2 setEnabled:v7];
}

- (_TtC18SharingViewService30AirTagCustomNameViewController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC18SharingViewService30AirTagCustomNameViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  id v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService30AirTagCustomNameViewController_nameField];
}

@end