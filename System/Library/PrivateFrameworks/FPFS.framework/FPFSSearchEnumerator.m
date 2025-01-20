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
  sub_24D98F5CC();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for FPFSSearchEnumerator();
  [(FPFSSearchEnumerator *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC9libfssync20FPFSSearchEnumerator_logger;
  uint64_t v4 = sub_24DCC9078();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_24D43DD74(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPFSSearchEnumerator_keepAlive));

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)invalidate
{
  v2 = self;
  sub_24D98F5CC();
}

- (void)currentSyncAnchorWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_24D9915B8(v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  v10 = self;
  sub_24D991F24(v9, a4, (char *)v10, v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 upTo:(int64_t)a5 reply:(id)a6
{
  uint64_t v9 = sub_24DCC8288();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v10 = sub_24DCC82A8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (void (**)(void *, void, void *))_Block_copy(a6);
  id v15 = a3;
  v16 = self;
  sub_24DCC8158();
  sub_24D5F77E0(MEMORY[0x263F8EE78]);
  sub_24D993778((unint64_t *)&qword_26986C390, MEMORY[0x263F06060]);
  sub_24DCC8808();
  v17 = (void *)sub_24DCC8128();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v18 = (void *)sub_24DCC8818();
  v14[2](v14, 0, v18);

  _Block_release(v14);
}

- (void)enumerateChangesFromToken:(id)a3 suggestedBatchSize:(int64_t)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  id v9 = a3;
  v13 = self;
  uint64_t v10 = sub_24DCC8B68();
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_24D992E30(v10, v12, a4, (char *)v13, v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_24D400DCC(v10, v12);
}

- (void)keepAliveConnectionForRegisteredObserver:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC9libfssync20FPFSSearchEnumerator_keepAlive);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPFSSearchEnumerator_keepAlive);
  *v6 = sub_24D991374;
  v6[1] = (uint64_t (*)())v5;

  sub_24D43DD74(v7);
}

- (NSString)description
{
  v2 = self;
  sub_24D990FE4();

  objc_super v3 = (void *)sub_24DCC97B8();
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