@interface MOSuggestionCollectionView
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC16MomentsUIService26MOSuggestionCollectionView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService26MOSuggestionCollectionView)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)handlePullToRefreshTrigger;
- (void)layoutSubviews;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)shieldViewUnlockButtonPressed:(id)a3;
@end

@implementation MOSuggestionCollectionView

- (void)shieldViewUnlockButtonPressed:(id)a3
{
  v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x100);
  id v5 = a3;
  v6 = self;
  if (v4())
  {
    MOSuggestionCollectionViewModel.initiateAuthentication()();

    swift_release();
  }
  else
  {
  }
}

- (_TtC16MomentsUIService26MOSuggestionCollectionView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionCollectionView.init(coder:)();
}

- (void)handlePullToRefreshTrigger
{
  v2 = self;
  MOSuggestionCollectionView.handlePullToRefreshTrigger()();
}

- (void)layoutSubviews
{
  v2 = self;
  MOSuggestionCollectionView.layoutSubviews()();
}

- (_TtC16MomentsUIService26MOSuggestionCollectionView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MomentsUIService26MOSuggestionCollectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_suggestionCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_onboardingManager));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_engagementWriter));
  swift_unknownObjectWeakDestroy();
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_presentationDelegate);
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_dialogDelegate);
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_segmentedVisibilityDelegate);
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_newEntryHeaderDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_options));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_privacyBadge));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_privacyBadgeTopConstraint));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_refresher));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_protectedContentShield));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_supportingLoadingTextLabel);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v6 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x100);
  id v7 = a3;
  v8 = self;
  uint64_t v9 = v6();
  if (v9)
  {
    int64_t v10 = (*(uint64_t (**)(int64_t))(*(void *)v9 + 600))(a4);

    swift_release();
    return v10;
  }
  else
  {

    return 0;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = MOSuggestionCollectionView.collectionView(_:cellForItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x100);
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = v4();
  if (v7)
  {
    int64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 608))(v7);

    swift_release();
    return v8;
  }
  else
  {

    return 1;
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  v15 = self;
  v16 = MOSuggestionCollectionView.collectionView(_:viewForSupplementaryElementOfKind:at:)(v14, v11, v13, (uint64_t)v10);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v16;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  specialized MOSuggestionCollectionView.collectionView(_:didSelectItemAt:)((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  double v15 = MOSuggestionCollectionView.collectionView(_:layout:sizeForItemAt:)(v12, v13, (uint64_t)v11);
  double v17 = v16;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v18 = v15;
  double v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  double v11 = specialized MOSuggestionCollectionView.collectionView(_:layout:referenceSizeForHeaderInSection:)(v8, a5);
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v8 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x100);
  id v9 = a3;
  id v10 = a4;
  double v11 = self;
  uint64_t v12 = v8();
  if (v12)
  {
    if ((*(uint64_t (**)(int64_t))(*(void *)v12 + 656))(a5))
    {
      [v9 frame];
      CGFloat width = v13;

      swift_release();
      CGFloat height = 80.0;
    }
    else
    {
      CGFloat width = CGSizeZero.width;
      CGFloat height = CGSizeZero.height;

      swift_release();
    }
  }
  else
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }
  double v16 = width;
  double v17 = height;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  double v11 = specialized MOSuggestionCollectionView.collectionView(_:layout:insetForSectionAt:)(v9, a5);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = type metadata accessor for IndexPath();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  double v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v16 = a3;
  id v17 = a4;
  double v18 = self;
  specialized MOSuggestionCollectionView.collectionView(_:didEndDisplayingSupplementaryView:forElementOfKind:at:)(v17, v13, v15);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  double v12 = self;
  id v13 = specialized MOSuggestionCollectionView.collectionView(_:contextMenuConfigurationForItemAt:point:)((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  specialized MOSuggestionCollectionView.collectionView(_:didEndDisplaying:forItemAt:)((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  v4 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x258);
  id v5 = a3;
  uint64_t v6 = self;
  v4();
}

@end