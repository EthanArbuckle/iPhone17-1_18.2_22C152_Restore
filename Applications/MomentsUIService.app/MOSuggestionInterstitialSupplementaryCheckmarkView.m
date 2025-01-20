@interface MOSuggestionInterstitialSupplementaryCheckmarkView
- (_TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView)initWithFrame:(CGRect)a3;
@end

@implementation MOSuggestionInterstitialSupplementaryCheckmarkView

- (_TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView *)specialized MOSuggestionInterstitialSupplementaryCheckmarkView.init(frame:)();
}

- (_TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView_checkmarkView;
  uint64_t v5 = one-time initialization token for CHECK_PLATTER_VIEW_SIZE;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)[objc_allocWithZone((Class)type metadata accessor for MOSuggestionInterstitialCarouselCheckMarkView()) initWithFrame:0.0, 0.0, static MOSuggestionInterstitialCarouselViewConstants.CHECK_PLATTER_VIEW_SIZE];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView_keyColor) = 0;

  result = (_TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView_checkmarkView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView_keyColor);
}

@end