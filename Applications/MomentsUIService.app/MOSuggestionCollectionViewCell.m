@interface MOSuggestionCollectionViewCell
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC16MomentsUIService30MOSuggestionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC16MomentsUIService30MOSuggestionCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)handleTraitChange;
- (void)prepareForReuse;
@end

@implementation MOSuggestionCollectionViewCell

- (_TtC16MomentsUIService30MOSuggestionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService30MOSuggestionCollectionViewCell *)MOSuggestionCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)handleTraitChange
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_gridContainerView);
  v5 = self;
  id v3 = [(MOSuggestionCollectionViewCell *)v5 traitCollection];
  id v4 = [v3 userInterfaceStyle];

  specialized static MOSuggestionTheme.Styles.styleViewAsPlatter(view:traitCollection:)(v2, (uint64_t)v4);
}

- (_TtC16MomentsUIService30MOSuggestionCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionCollectionViewCell.init(coder:)();
}

- (void)prepareForReuse
{
  v2 = self;
  MOSuggestionCollectionViewCell.prepareForReuse()();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = MOSuggestionCollectionViewCell.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_assetGridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_gridContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_journalButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_gridViewHeightAnchor));
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_photoMemoryBanner));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end