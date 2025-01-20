@interface FitNoiseAirpodPlacementVideoController
- (_TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController)initWithNoiseDelegate:(id)a3 btAddress:(id)a4;
- (_TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FitNoiseAirpodPlacementVideoController

- (_TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController)initWithNoiseDelegate:(id)a3 btAddress:(id)a4
{
  uint64_t v4 = sub_2512C47F8();
  uint64_t v6 = v5;
  uint64_t v7 = swift_unknownObjectRetain();
  return (_TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController *)FitNoiseAirpodPlacementVideoController.init(noiseDelegate:btAddress:)(v7, v4, v6);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FitNoiseAirpodPlacementVideoController();
  id v4 = v7.receiver;
  [(FitNoiseAirpodPlacementVideoController *)&v7 viewWillAppear:v3];
  uint64_t v5 = sub_2512A9FC0();
  (*(void (**)(char *, uint64_t))((*MEMORY[0x263F8EED0] & *(void *)v5) + 0xB8))(v5, v6);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2512AA178();
}

- (_TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_25129F308((uint64_t)self + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___movieLoopView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController____lazy_storage___topAsset);
}

@end