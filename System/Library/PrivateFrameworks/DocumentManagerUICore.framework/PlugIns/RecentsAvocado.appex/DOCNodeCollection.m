@interface DOCNodeCollection
- (BOOL)isGathering;
- (_TtC14RecentsAvocado17DOCNodeCollection)init;
- (void)collection:(id)a3 didEncounterError:(id)a4;
- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6;
- (void)collection:(id)a3 didUpdateObservedItem:(id)a4;
- (void)collectionDidFinishGathering:(id)a3;
- (void)dataForCollectionShouldBeReloaded:(id)a3;
- (void)setIsGathering:(BOOL)a3;
@end

@implementation DOCNodeCollection

- (BOOL)isGathering
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC14RecentsAvocado17DOCNodeCollection_isGathering;
  swift_beginAccess();
  return *v2;
}

- (void)setIsGathering:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC14RecentsAvocado17DOCNodeCollection_isGathering;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (_TtC14RecentsAvocado17DOCNodeCollection)init
{
  result = (_TtC14RecentsAvocado17DOCNodeCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10011532C(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC14RecentsAvocado17DOCNodeCollection_type), *(void *)&self->logPrefix[OBJC_IVAR____TtC14RecentsAvocado17DOCNodeCollection_type], self->logPrefix[OBJC_IVAR____TtC14RecentsAvocado17DOCNodeCollection_type + 8]);
  sub_1000391D4((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado17DOCNodeCollection_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14RecentsAvocado17DOCNodeCollection_isGatheringObservation);
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  id v4 = a3;
  v5 = self;
  DOCNodeCollection.data(forCollectionShouldBeReloaded:)(v4);
}

- (void)collection:(id)a3 didEncounterError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_1003ED484((uint64_t)v8);
}

- (void)collection:(id)a3 didUpdateObservedItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  DOCNodeCollection.collection(_:didUpdateObservedItem:)(v6, v7);
}

- (void)collectionDidFinishGathering:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003ED860(0xD000000000000020, 0x8000000100537E50);
}

- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6
{
  sub_1000333C8(0, (unint64_t *)&qword_100627EE0);
  unint64_t v8 = sub_1004CDE30();
  sub_1000333C8(0, (unint64_t *)&unk_10062F6D0);
  sub_1003EE1B0();
  unint64_t v9 = sub_1004CD9A0();
  unint64_t v10 = sub_1004CDE30();
  id v11 = a3;
  v12 = self;
  sub_1003EDB88(v8, v9, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end