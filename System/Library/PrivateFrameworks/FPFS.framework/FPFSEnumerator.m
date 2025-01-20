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
  sub_24D4B90F8();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for FPFSEnumerator();
  [(FPFSEnumerator *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_logger;
  uint64_t v4 = sub_24DCC9078();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_24D43DD74(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_keepAlive));
  v5 = (char *)self + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_invalidated;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B19A0F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  v7 = (char *)self + OBJC_IVAR____TtC9libfssync14FPFSEnumerator__currentAnchor;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B196B98);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)invalidate
{
  v2 = self;
  sub_24D4B90F8();
}

- (void)currentSyncAnchorWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_24D4C437C((char *)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B196F40);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B199410);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  _Block_copy(v12);
  id v14 = a3;
  v15 = self;
  sub_24D4C4BA4((uint64_t)v14, (uint64_t)v11, a4, (char *)v15, v12);
  _Block_release(v12);
  sub_24D415F74((uint64_t)v11, (uint64_t *)&unk_26B196F40);
  _Block_release(v12);
}

- (void)enumerateItemsFromPage:(id)a3 suggestedPageSize:(int64_t)a4 upTo:(int64_t)a5 reply:(id)a6
{
  uint64_t v8 = (void (**)(void *, void, void *))_Block_copy(a6);
  sub_24DCC97E8();
  id v9 = objc_allocWithZone(MEMORY[0x263F087E8]);
  id v10 = a3;
  id v14 = self;
  v11 = (void *)sub_24DCC97B8();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v9, sel_initWithDomain_code_userInfo_, v11, 3328, 0);

  uint64_t v13 = (void *)sub_24DCC8818();
  v8[2](v8, 0, v13);

  _Block_release(v8);
}

- (void)enumerateChangesFromToken:(id)a3 suggestedBatchSize:(int64_t)a4 reply:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  uint64_t v13 = self;
  uint64_t v10 = sub_24DCC8B68();
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_24D4C5D74(v10, v12, a4, (char *)v13, (void (**)(void, void, void, void, void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_24D400DCC(v10, v12);
}

- (void)keepAliveConnectionForRegisteredObserver:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_keepAlive);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync14FPFSEnumerator_keepAlive);
  *uint64_t v6 = sub_24D4C5D6C;
  v6[1] = (uint64_t (*)())v5;

  sub_24D43DD74(v7);
}

- (NSString)description
{
  v2 = self;
  sub_24D4C2AB8();

  objc_super v3 = (void *)sub_24DCC97B8();
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