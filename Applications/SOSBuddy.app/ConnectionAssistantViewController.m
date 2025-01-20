@interface ConnectionAssistantViewController
- (BOOL)_canShowWhileLocked;
- (_TtC8SOSBuddy33ConnectionAssistantViewController)initWithCoder:(id)a3;
- (_TtC8SOSBuddy33ConnectionAssistantViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ConnectionAssistantViewController

- (_TtC8SOSBuddy33ConnectionAssistantViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10007C9CC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10007987C();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100079F78(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ConnectionAssistantViewController();
  v4 = (char *)v5.receiver;
  [(ConnectionAssistantViewController *)&v5 viewWillDisappear:v3];
  *(void *)&v4[OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__locationAssertion] = 0;

  swift_release();
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10007A57C();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC8SOSBuddy33ConnectionAssistantViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8SOSBuddy33ConnectionAssistantViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__earthViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__connectionViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__innerShadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy33ConnectionAssistantViewController__displayLink));
  swift_release();
  swift_release();

  swift_release();
}

@end