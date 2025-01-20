@interface DOCSpotlightCollectionObserver
- (_TtC18DocumentAppIntents30DOCSpotlightCollectionObserver)init;
- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4;
- (void)collectionDidFinishGathering:(id)a3;
- (void)collectionUpdated;
- (void)dataForCollectionShouldBeReloaded:(id)a3;
@end

@implementation DOCSpotlightCollectionObserver

- (_TtC18DocumentAppIntents30DOCSpotlightCollectionObserver)init
{
  result = (_TtC18DocumentAppIntents30DOCSpotlightCollectionObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents30DOCSpotlightCollectionObserver_configuration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents30DOCSpotlightCollectionObserver_itemCollection));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18DocumentAppIntents30DOCSpotlightCollectionObserver_collectionUpdateBlock);

  sub_100037540(v3);
}

- (void)collectionUpdated
{
  v2 = self;
  sub_10003CA14();
}

- (void)collectionDidFinishGathering:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10003CC88(v4);
}

- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4
{
  uint64_t v7 = sub_1004F42F0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (uint64_t *)((char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = _Block_copy(a4);
  sub_100032070(0, (unint64_t *)&qword_100657A60);
  id v12 = a3;
  v13 = self;
  uint64_t *v10 = sub_1004F5070();
  (*(void (**)(uint64_t *, void, uint64_t))(v8 + 104))(v10, enum case for DispatchPredicate.onQueue(_:), v7);
  LOBYTE(a4) = sub_1004F4320();
  (*(void (**)(uint64_t *, uint64_t))(v8 + 8))(v10, v7);
  if (a4)
  {
    [(DOCSpotlightCollectionObserver *)v13 collectionUpdated];
    _Block_release(v11);
  }
  else
  {
    __break(1u);
  }
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  uint64_t v5 = sub_1004F42F0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (uint64_t *)((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100032070(0, (unint64_t *)&qword_100657A60);
  id v9 = a3;
  v10 = self;
  *uint64_t v8 = sub_1004F5070();
  (*(void (**)(uint64_t *, void, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  LOBYTE(a3) = sub_1004F4320();
  (*(void (**)(uint64_t *, uint64_t))(v6 + 8))(v8, v5);
  if (a3)
  {
    [(DOCSpotlightCollectionObserver *)v10 collectionUpdated];
  }
  else
  {
    __break(1u);
  }
}

@end