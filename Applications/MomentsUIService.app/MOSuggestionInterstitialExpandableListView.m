@interface MOSuggestionInterstitialExpandableListView
- (_TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView)initWithFrame:(CGRect)a3;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
@end

@implementation MOSuggestionInterstitialExpandableListView

- (_TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionInterstitialExpandableListView.init(coder:)();
}

- (_TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView_collectionView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView_delegate);
  swift_unknownObjectWeakDestroy();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView_queue);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  specialized MOSuggestionInterstitialExpandableListView.collectionView(_:willDisplay:forItemAt:)(v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end