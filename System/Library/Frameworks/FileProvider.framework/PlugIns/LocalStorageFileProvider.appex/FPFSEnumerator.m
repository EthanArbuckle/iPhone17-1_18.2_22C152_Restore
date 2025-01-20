@interface FPFSEnumerator
- (NSString)description;
- (_TtC9libfssync14FPFSEnumerator)init;
- (void)currentSyncAnchorWithCompletion:(id)a3;
- (void)dealloc;
- (void)enumerateChangesFromToken:(id)a3 suggestedBatchSize:(int64_t)a4 reply:(id)a5;
- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 reply:(id)a5;
- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 upTo:(int64_t)a5 reply:(id)a6;
- (void)invalidate;
- (void)keepAliveConnectionForRegisteredObserver:(id)a3;
@end

@implementation FPFSEnumerator

- (void)dealloc
{
  v2 = self;
  sub_100122668();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for FPFSEnumerator();
  [(FPFSEnumerator *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_logger;
  uint64_t v4 = sub_10096B480();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1000705CC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_keepAlive));
  v5 = (char *)self + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_invalidated;
  uint64_t v6 = sub_10002B7CC((uint64_t *)&unk_100ACD950);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  v7 = (char *)self + OBJC_IVAR____TtC9libfssync14FPFSEnumerator__currentAnchor;
  uint64_t v8 = sub_10002B7CC(&qword_100ACDA28);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)invalidate
{
  v2 = self;
  sub_100122668();
}

- (void)currentSyncAnchorWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10012D800(v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 reply:(id)a5
{
  uint64_t v9 = sub_10002B7CC((uint64_t *)&unk_100AD0CF0);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = sub_10002B7CC(&qword_100ACCB10);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  _Block_copy(v12);
  id v14 = a3;
  v15 = self;
  sub_10012E028((uint64_t)v14, (uint64_t)v11, a4, (char *)v15, v12);
  _Block_release(v12);
  sub_10002B770((uint64_t)v11, (uint64_t *)&unk_100AD0CF0);
  _Block_release(v12);
}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 upTo:(int64_t)a5 reply:(id)a6
{
  uint64_t v8 = (void (**)(void *, void, void *))_Block_copy(a6);
  _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();
  id v9 = objc_allocWithZone((Class)NSError);
  id v10 = a3;
  id v14 = self;
  NSString v11 = sub_10096BC00();
  swift_bridgeObjectRelease();
  id v12 = [v9 initWithDomain:v11 code:3328 userInfo:0];

  uint64_t v13 = (void *)sub_10096ABE0();
  v8[2](v8, 0, v13);

  _Block_release(v8);
}

- (void)enumerateChangesFromToken:(id)a3 suggestedBatchSize:(int64_t)a4 reply:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  uint64_t v13 = self;
  uint64_t v10 = sub_10096AF60();
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_10012F590(v10, v12, a4, (char *)v13, (void (**)(void, void, void, void, void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_10001E9C0(v10, v12);
}

- (void)keepAliveConnectionForRegisteredObserver:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_keepAlive);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_keepAlive);
  *uint64_t v6 = sub_10012F588;
  v6[1] = (uint64_t (*)())v5;

  sub_1000705CC(v7);
}

- (NSString)description
{
  v2 = self;
  sub_10012C028();

  NSString v3 = sub_10096BC00();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC9libfssync14FPFSEnumerator)init
{
  result = (_TtC9libfssync14FPFSEnumerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end