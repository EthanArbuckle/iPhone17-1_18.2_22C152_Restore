@interface MOSuggestionInterstitialCarouselCheckMarkView
- (_TtC16MomentsUIService45MOSuggestionInterstitialCarouselCheckMarkView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService45MOSuggestionInterstitialCarouselCheckMarkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MOSuggestionInterstitialCarouselCheckMarkView

- (_TtC16MomentsUIService45MOSuggestionInterstitialCarouselCheckMarkView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService45MOSuggestionInterstitialCarouselCheckMarkView *)MOSuggestionInterstitialCarouselCheckMarkView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService45MOSuggestionInterstitialCarouselCheckMarkView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionInterstitialCarouselCheckMarkView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  MOSuggestionInterstitialCarouselCheckMarkView.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService45MOSuggestionInterstitialCarouselCheckMarkView_keyColor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService45MOSuggestionInterstitialCarouselCheckMarkView_accessoryButton);
}

@end