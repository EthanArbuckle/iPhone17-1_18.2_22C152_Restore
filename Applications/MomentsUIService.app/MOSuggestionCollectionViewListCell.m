@interface MOSuggestionCollectionViewListCell
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC16MomentsUIService34MOSuggestionCollectionViewListCell)initWithCoder:(id)a3;
- (_TtC16MomentsUIService34MOSuggestionCollectionViewListCell)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)handleTraitChange;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation MOSuggestionCollectionViewListCell

- (_TtC16MomentsUIService34MOSuggestionCollectionViewListCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService34MOSuggestionCollectionViewListCell *)specialized MOSuggestionCollectionViewListCell.init(frame:)();
}

- (void)handleTraitChange
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.super.super.isa) + 0xD0);
  v3 = self;
  id v6 = (id)v2();
  id v4 = [(MOSuggestionCollectionViewListCell *)v3 traitCollection];
  id v5 = [v4 userInterfaceStyle];

  specialized static MOSuggestionTheme.Styles.styleViewAsPlatter(view:traitCollection:)(v6, (uint64_t)v5);
}

- (_TtC16MomentsUIService34MOSuggestionCollectionViewListCell)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionCollectionViewListCell.init(coder:)();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  MOSuggestionCollectionViewListCell.updateConfiguration(using:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for MOSuggestionCollectionViewListCell();
  v2 = v15.receiver;
  id v3 = [(MOSuggestionCollectionViewListCell *)&v15 layoutSubviews];
  uint64_t v4 = (void *)(*(uint64_t (**)(id))((swift_isaMask & *v2) + 0x138))(v3);
  uint64_t v6 = (void *)(*(uint64_t (**)(void *, uint64_t))((swift_isaMask & *v2) + 0xD0))(v4, v5);
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  [v4 setFrame:v8, v10, v12, v14];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  double v9 = self;
  id v10 = MOSuggestionCollectionViewListCell.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)prepareForReuse
{
  v2 = self;
  MOSuggestionCollectionViewListCell.prepareForReuse()();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_buttonHolder));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_platterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_playButton));
  swift_release();
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_assetView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_addedView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_assetContainerView);
}

@end