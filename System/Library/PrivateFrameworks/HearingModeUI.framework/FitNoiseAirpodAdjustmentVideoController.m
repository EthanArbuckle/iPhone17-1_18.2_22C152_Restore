@interface FitNoiseAirpodAdjustmentVideoController
- (_TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FitNoiseAirpodAdjustmentVideoController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FitNoiseAirpodAdjustmentVideoController();
  id v4 = v7.receiver;
  [(FitNoiseAirpodAdjustmentVideoController *)&v7 viewWillAppear:v3];
  v5 = sub_25129E054();
  (*(void (**)(void *, uint64_t))((*MEMORY[0x263F8EED0] & *v5) + 0xE0))(v5, v6);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_25129E21C();
}

- (_TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController____lazy_storage___continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController____lazy_storage___movieLoopView));
  sub_25129F330((uint64_t)self + OBJC_IVAR____TtC13HearingModeUI39FitNoiseAirpodAdjustmentVideoController_listener, &qword_269B2DBD0);
}

@end