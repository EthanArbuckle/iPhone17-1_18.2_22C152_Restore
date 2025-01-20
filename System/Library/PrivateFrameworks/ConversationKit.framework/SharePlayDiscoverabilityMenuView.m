@interface SharePlayDiscoverabilityMenuView
- (_TtC15ConversationKit32SharePlayDiscoverabilityMenuView)initWithCoder:(id)a3;
- (_TtC15ConversationKit32SharePlayDiscoverabilityMenuView)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)didTapMore;
@end

@implementation SharePlayDiscoverabilityMenuView

- (_TtC15ConversationKit32SharePlayDiscoverabilityMenuView)initWithCoder:(id)a3
{
  id v3 = a3;
  SharePlayDiscoverabilityMenuView.init(coder:)();
}

- (_TtC15ConversationKit32SharePlayDiscoverabilityMenuView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32SharePlayDiscoverabilityMenuView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32SharePlayDiscoverabilityMenuView____lazy_storage___moreButton));
  outlined destroy of Any?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit32SharePlayDiscoverabilityMenuView____lazy_storage___appCellRegistration, (uint64_t *)&demangling cache variable for type metadata for UICollectionView.CellRegistration<UICollectionViewCell, Application>?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32SharePlayDiscoverabilityMenuView____lazy_storage___collectionViewLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32SharePlayDiscoverabilityMenuView____lazy_storage___collectionView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit32SharePlayDiscoverabilityMenuView_foregroundApp);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  Swift::Int v8 = SharePlayDiscoverabilityMenuView.collectionView(_:numberOfItemsInSection:)((UICollectionView *)v6, v7);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)SharePlayDiscoverabilityMenuView.collectionView(_:cellForItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)didTapMore
{
  v2 = self;
  SharePlayDiscoverabilityMenuView.didTapMore()();
}

@end