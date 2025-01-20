@interface MOSuggestionActivityIconAssetView
- (_TtC16MomentsUIService33MOSuggestionActivityIconAssetView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService33MOSuggestionActivityIconAssetView)initWithFrame:(CGRect)a3;
- (void)handleTraitChange;
@end

@implementation MOSuggestionActivityIconAssetView

- (_TtC16MomentsUIService33MOSuggestionActivityIconAssetView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionActivityIconAssetView.init(coder:)();
}

- (void)handleTraitChange
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x110);
  id v3 = self;
  v2();
}

- (_TtC16MomentsUIService33MOSuggestionActivityIconAssetView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_distanceBlue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_timeYellow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_movePink));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_heartRed));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_exerciseNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_workoutDataLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService33MOSuggestionActivityIconAssetView_labelStack);
}

@end