@interface MOSuggestionMotionAssetView
- (_TtC16MomentsUIService27MOSuggestionMotionAssetView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService27MOSuggestionMotionAssetView)initWithFrame:(CGRect)a3;
- (void)handleTraitChange;
- (void)layoutSubviews;
@end

@implementation MOSuggestionMotionAssetView

- (_TtC16MomentsUIService27MOSuggestionMotionAssetView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionMotionAssetView.init(coder:)();
}

- (void)handleTraitChange
{
  v2 = self;
  MOSuggestionMotionAssetView.handleTraitChange()();
}

- (void)layoutSubviews
{
  v2 = self;
  MOSuggestionMotionAssetView.layoutSubviews()();
}

- (_TtC16MomentsUIService27MOSuggestionMotionAssetView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MomentsUIService27MOSuggestionMotionAssetView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionMotionAssetView_snowglobeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionMotionAssetView_motionBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionMotionAssetView_exerciseNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionMotionAssetView_workoutDataLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionMotionAssetView_labelStack));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionMotionAssetView_imageView);
}

@end