@interface MOSuggestionInterstitialCarouselViewCell
- (_TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell)initWithCoder:(id)a3;
- (_TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MOSuggestionInterstitialCarouselViewCell

- (_TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell *)specialized MOSuggestionInterstitialCarouselViewCell.init(frame:)();
}

- (_TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionInterstitialCarouselViewCell.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell_assetView));
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                                                                          + OBJC_IVAR____TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell_blockUserInteraction));
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                                                                          + OBJC_IVAR____TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell_unBlockUserInteraction));

  swift_weakDestroy();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MOSuggestionInterstitialCarouselViewCell();
  v2 = (char *)v4.receiver;
  [(MOSuggestionInterstitialCarouselViewCell *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell_assetView];
  [v2 bounds];
  [v3 setFrame:];
}

@end