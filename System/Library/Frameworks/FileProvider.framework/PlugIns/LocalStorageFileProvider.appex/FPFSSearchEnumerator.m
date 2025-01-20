@interface FPFSSearchEnumerator
- (NSString)description;
- (_TtC9libfssync20FPFSSearchEnumerator)init;
- (void)currentSyncAnchorWithCompletion:(id)a3;
- (void)dealloc;
- (void)enumerateChangesFromToken:(id)a3 suggestedBatchSize:(int64_t)a4 reply:(id)a5;
- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 reply:(id)a5;
- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 upTo:(int64_t)a5 reply:(id)a6;
- (void)invalidate;
- (void)keepAliveConnectionForRegisteredObserver:(id)a3;
@end

@implementation FPFSSearchEnumerator

- (void)dealloc
{
  v2 = self;
  sub_10061D1A8();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for FPFSSearchEnumerator();
  [(FPFSSearchEnumerator *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC9libfssync20FPFSSearchEnumerator_logger;
  uint64_t v4 = sub_10096B480();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1000705CC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPFSSearchEnumerator_keepAlive));

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)invalidate
{
  v2 = self;
  sub_10061D1A8();
}

- (void)currentSyncAnchorWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10061F9CC(v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  v10 = self;
  sub_100620338(v9, a4, (char *)v10, v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 upTo:(int64_t)a5 reply:(id)a6
{
  uint64_t v9 = sub_10096A630();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_10096A650();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (void (**)(void *, void, void *))_Block_copy(a6);
  id v15 = a3;
  v16 = self;
  sub_10096A5C0();
  sub_100042898((uint64_t)_swiftEmptyArrayStorage);
  sub_100025804((unint64_t *)&qword_100ACB680, (void (*)(uint64_t))&type metadata accessor for CocoaError);
  sub_10096ABD0();
  v17 = (void *)sub_10096A4D0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v18 = (void *)sub_10096ABE0();
  v14[2](v14, 0, v18);

  _Block_release(v14);
}

- (void)enumerateChangesFromToken:(id)a3 suggestedBatchSize:(int64_t)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  id v9 = a3;
  v13 = self;
  uint64_t v10 = sub_10096AF60();
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_100621244(v10, v12, a4, (char *)v13, v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_10001E9C0(v10, v12);
}

- (void)keepAliveConnectionForRegisteredObserver:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC9libfssync20FPFSSearchEnumerator_keepAlive);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPFSSearchEnumerator_keepAlive);
  *v6 = sub_10061F788;
  v6[1] = (uint64_t (*)())v5;

  sub_1000705CC(v7);
}

- (NSString)description
{
  v2 = self;
  sub_10061EBC0();

  NSString v3 = sub_10096BC00();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC9libfssync20FPFSSearchEnumerator)init
{
  result = (_TtC9libfssync20FPFSSearchEnumerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end