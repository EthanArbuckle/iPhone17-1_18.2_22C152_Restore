@interface MOSuggestionInterstitialCarouselView
- (_TtC16MomentsUIService36MOSuggestionInterstitialCarouselView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService36MOSuggestionInterstitialCarouselView)initWithFrame:(CGRect)a3;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation MOSuggestionInterstitialCarouselView

- (_TtC16MomentsUIService36MOSuggestionInterstitialCarouselView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionInterstitialCarouselView.init(coder:)();
}

- (_TtC16MomentsUIService36MOSuggestionInterstitialCarouselView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MomentsUIService36MOSuggestionInterstitialCarouselView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_collectionView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_containerViewBottomConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_pageControl));
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_delegate);
  swift_unknownObjectWeakDestroy();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_queue);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (id)UIView.userInteractionEnabled(_:)();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  id v7 = (id)UIView.userInteractionEnabled(_:)();
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  id v8 = a3;
  v9 = self;
  MOSuggestionInterstitialCarouselView.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)(v8, &a5->x, x);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = type metadata accessor for IndexPath();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v16 = a3;
  id v17 = a4;
  v18 = self;
  specialized MOSuggestionInterstitialCarouselView.collectionView(_:willDisplaySupplementaryView:forElementKind:at:)(v17, v13, v15, (uint64_t)v12);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

@end