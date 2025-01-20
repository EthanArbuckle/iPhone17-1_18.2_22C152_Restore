@interface SelfServiceInstructionsViewController
- (_TtC11Diagnostics37SelfServiceInstructionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC11Diagnostics37SelfServiceInstructionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SelfServiceInstructionsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000E9350();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000E9FE8(a3);
}

- (_TtC11Diagnostics37SelfServiceInstructionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC11Diagnostics37SelfServiceInstructionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11Diagnostics37SelfServiceInstructionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC11Diagnostics37SelfServiceInstructionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10003B0B8(*(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_onButtonPress]);
  uint64_t v3 = *(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics37SelfServiceInstructionsViewController_onDismiss];

  sub_10003B0B8(v3);
}

@end