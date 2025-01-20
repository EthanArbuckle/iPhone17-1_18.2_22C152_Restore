@interface MOSuggestionCollectionViewSingleAssetCell
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell)initWithCoder:(id)a3;
- (_TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)handleTraitChange;
- (void)prepareForReuse;
@end

@implementation MOSuggestionCollectionViewSingleAssetCell

- (_TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell *)MOSuggestionCollectionViewSingleAssetCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)handleTraitChange
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell_platterView);
  v3 = self;
  id v6 = v2;
  id v4 = [(MOSuggestionCollectionViewSingleAssetCell *)v3 traitCollection];
  id v5 = [v4 userInterfaceStyle];

  specialized static MOSuggestionTheme.Styles.styleViewAsPlatter(view:traitCollection:)(v6, (uint64_t)v5);
}

- (_TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionCollectionViewSingleAssetCell.init(coder:)();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = MOSuggestionCollectionViewSingleAssetCell.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)prepareForReuse
{
  v2 = self;
  MOSuggestionCollectionViewSingleAssetCell.prepareForReuse()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell_assetGridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell_journalButton));
  swift_release();
  swift_weakDestroy();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell_platterView);
}

@end