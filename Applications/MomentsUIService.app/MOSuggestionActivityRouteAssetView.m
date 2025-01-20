@interface MOSuggestionActivityRouteAssetView
- (_TtC16MomentsUIService34MOSuggestionActivityRouteAssetView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService34MOSuggestionActivityRouteAssetView)initWithFrame:(CGRect)a3;
- (void)handleTraitChange;
@end

@implementation MOSuggestionActivityRouteAssetView

- (_TtC16MomentsUIService34MOSuggestionActivityRouteAssetView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionActivityRouteAssetView.init(coder:)();
}

- (void)handleTraitChange
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0xC8);
  id v3 = self;
  v2();
}

- (_TtC16MomentsUIService34MOSuggestionActivityRouteAssetView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MomentsUIService34MOSuggestionActivityRouteAssetView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_routeMap));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_distanceBlue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_timeYellow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_movePink));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_exerciseNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_workoutDataLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionActivityRouteAssetView_labelStack);
}

@end