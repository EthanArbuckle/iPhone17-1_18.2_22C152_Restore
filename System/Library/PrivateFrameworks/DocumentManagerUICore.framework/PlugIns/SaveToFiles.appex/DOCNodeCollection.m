@interface DOCNodeCollection
- (BOOL)isGathering;
- (_TtC11SaveToFiles17DOCNodeCollection)init;
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
  v2 = (BOOL *)self + OBJC_IVAR____TtC11SaveToFiles17DOCNodeCollection_isGathering;
  swift_beginAccess();
  return *v2;
}

- (void)setIsGathering:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC11SaveToFiles17DOCNodeCollection_isGathering;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (_TtC11SaveToFiles17DOCNodeCollection)init
{
  result = (_TtC11SaveToFiles17DOCNodeCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10011F030(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC11SaveToFiles17DOCNodeCollection_type), *(void *)&self->logPrefix[OBJC_IVAR____TtC11SaveToFiles17DOCNodeCollection_type], self->logPrefix[OBJC_IVAR____TtC11SaveToFiles17DOCNodeCollection_type + 8]);
  sub_10003BA48((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles17DOCNodeCollection_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SaveToFiles17DOCNodeCollection_isGatheringObservation);
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
  sub_100256F58((uint64_t)v8);
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
  sub_100257FF4(0xD000000000000020, 0x800000010052CE50);
}

- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6
{
  sub_100036804(0, (unint64_t *)&qword_10062D590);
  unint64_t v8 = sub_1004D1510();
  sub_100036804(0, (unint64_t *)&unk_1006324D0);
  sub_100258690();
  unint64_t v9 = sub_1004D1090();
  unint64_t v10 = sub_1004D1510();
  id v11 = a3;
  v12 = self;
  sub_100257334(v8, v9, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end