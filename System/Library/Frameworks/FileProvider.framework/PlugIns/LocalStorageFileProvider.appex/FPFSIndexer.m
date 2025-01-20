@interface FPFSIndexer
- (BOOL)learnNeedsAuthenticationFromBatchError;
- (_TtC9libfssync11FPFSIndexer)init;
- (_TtC9libfssync11FPFSIndexer)initWithExtension:(id)a3 domain:(id)a4 enabled:(BOOL)a5;
- (void)didDropIndexWithDropReason:(unint64_t)a3;
- (void)dumpStateTo:(id)a3;
- (void)indexOneBatchWithCompletionHandler:(id)a3;
- (void)signalNeedsReindexFromScratchWithDropReason:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation FPFSIndexer

- (BOOL)learnNeedsAuthenticationFromBatchError
{
  return 0;
}

- (void)signalNeedsReindexFromScratchWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_10081BA9C((void *)a3, (char *)v7, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)indexOneBatchWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10081D35C((char *)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)dumpStateTo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FPFSIndexer();
  id v4 = a3;
  v5 = (char *)v6.receiver;
  [(FPFSIndexer *)&v6 dumpStateTo:v4];
  objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC9libfssync11FPFSIndexer_spotlightIndexer], "dumpStateTo:", v4, v6.receiver, v6.super_class);
}

- (_TtC9libfssync11FPFSIndexer)initWithExtension:(id)a3 domain:(id)a4 enabled:(BOOL)a5
{
  id v6 = a3;
  id v7 = a4;
  result = (_TtC9libfssync11FPFSIndexer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9libfssync11FPFSIndexer)init
{
  result = (_TtC9libfssync11FPFSIndexer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_10002B770((uint64_t)&self->FPDDomainIndexer_opaque[OBJC_IVAR____TtC9libfssync11FPFSIndexer_lastIndexedAnchor], &qword_100ADC178);
  v3 = *(void **)&self->FPDDomainIndexer_opaque[OBJC_IVAR____TtC9libfssync11FPFSIndexer_spotlightIndexer];
}

- (void)didDropIndexWithDropReason:(unint64_t)a3
{
  id v4 = self;
  id v5 = [(FPFSIndexer *)v4 state];
  [v5 recordIndexDropReason:a3];
}

@end