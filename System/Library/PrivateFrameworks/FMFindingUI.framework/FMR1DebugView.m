@interface FMR1DebugView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSString)description;
- (_TtC11FMFindingUI13FMR1DebugView)initWithCoder:(id)a3;
- (_TtC11FMFindingUI13FMR1DebugView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)debugModeWithoutBearingAction;
- (void)dotCountSegmentedControlActionWithSender:(id)a3;
- (void)ecoModeAction;
- (void)runTestsAction;
- (void)showControlsToggleActionWithSender:(id)a3;
@end

@implementation FMR1DebugView

- (_TtC11FMFindingUI13FMR1DebugView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D34CF58();
}

- (NSString)description
{
  v2 = self;
  sub_24D2FB1F8();

  id v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_debugModeObservation);
  v4 = self;
  if (v3)
  {
    id v5 = v3;
    sub_24D39C6F0();
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMR1DebugView();
  [(FMR1DebugView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_style);
  v4 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_style);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_dotCountSegmentedControl));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_debugModeWithoutBearingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_debugModeWithoutBearingSwitch));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_debugModeObservation));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_autoTestsActionHandler);
  sub_24D2E44C8(v5);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = self;
  LOBYTE(self) = sub_24D34D224(x, y);

  return self & 1;
}

- (void)showControlsToggleActionWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D34D4BC();
}

- (void)dotCountSegmentedControlActionWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D34C744(v4);
}

- (void)ecoModeAction
{
  id v3 = self;
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_standardUserDefaults);
  objc_msgSend(v5, sel_setFmpfEcoMode_, objc_msgSend(*(id *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_ecoModeSwitch), sel_isOn));
}

- (void)debugModeWithoutBearingAction
{
  id v3 = self;
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_standardUserDefaults);
  objc_msgSend(v5, sel_setFmpfDebugModeWithoutBearing_, objc_msgSend(*(id *)((char *)&v4->super.super.super.isa+ OBJC_IVAR____TtC11FMFindingUI13FMR1DebugView_debugModeWithoutBearingSwitch), sel_isOn));
}

- (void)runTestsAction
{
  v2 = self;
  sub_24D34C9BC();
}

- (_TtC11FMFindingUI13FMR1DebugView)initWithFrame:(CGRect)a3
{
  result = (_TtC11FMFindingUI13FMR1DebugView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end