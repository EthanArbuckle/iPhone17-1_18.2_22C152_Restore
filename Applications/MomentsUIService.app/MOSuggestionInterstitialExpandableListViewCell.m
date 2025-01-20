@interface MOSuggestionInterstitialExpandableListViewCell
- (_TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell)initWithCoder:(id)a3;
- (_TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell)initWithFrame:(CGRect)a3;
- (void)didTapCheckmark;
- (void)handleTraitChange;
- (void)prepareForReuse;
@end

@implementation MOSuggestionInterstitialExpandableListViewCell

- (_TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell *)MOSuggestionInterstitialExpandableListViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionInterstitialExpandableListViewCell.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_stackView));
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                                                                          + OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_didToggle));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_assetView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_checkmarkView));

  swift_weakDestroy();
}

- (void)didTapCheckmark
{
  v2 = self;
  MOSuggestionInterstitialExpandableListViewCell.didTapCheckmark()();
}

- (void)handleTraitChange
{
  v2 = self;
  MOSuggestionInterstitialExpandableListViewCell.handleTraitChange()();
}

- (void)prepareForReuse
{
  v2 = self;
  MOSuggestionInterstitialExpandableListViewCell.prepareForReuse()();
}

@end