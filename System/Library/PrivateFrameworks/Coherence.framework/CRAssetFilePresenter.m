@interface CRAssetFilePresenter
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (_TtC9Coherence20CRAssetFilePresenter)init;
- (uint64_t)presentedSubitemDidAppearAtURL:(void *)a1;
- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3;
- (void)accommodatePresentedSubitemDeletionAtURL:(id)a3 completionHandler:(id)a4;
@end

@implementation CRAssetFilePresenter

- (NSURL)presentedItemURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBC0760);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3F970C4((uint64_t)self + OBJC_IVAR____TtC9Coherence20CRAssetFilePresenter_presentedItemURL, (uint64_t)v5, &qword_1EBBC0760);
  uint64_t v6 = sub_1C4496498();
  uint64_t v7 = *(void *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_1C4496418();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSURL *)v8;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC9Coherence20CRAssetFilePresenter_presentedItemOperationQueue));
}

- (uint64_t)presentedSubitemDidAppearAtURL:(void *)a1
{
  uint64_t v2 = sub_1C4496498();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4496478();
  if (swift_weakLoadStrong())
  {
    id v6 = a1;
    sub_1C43C98DC((uint64_t)v5, 0);
    swift_release();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

- (void)accommodatePresentedSubitemDeletionAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = sub_1C4496498();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  sub_1C4496478();
  _Block_copy(v10);
  v11 = self;
  sub_1C43D3E2C((uint64_t)v9, (uint64_t)v11, (void (**)(void, void))v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1C43D4120((uint64_t)v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC9Coherence20CRAssetFilePresenter)init
{
  result = (_TtC9Coherence20CRAssetFilePresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C3F962E0((uint64_t)self + OBJC_IVAR____TtC9Coherence20CRAssetFilePresenter_presentedItemURL, &qword_1EBBC0760);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Coherence20CRAssetFilePresenter_presentedItemOperationQueue));
  swift_weakDestroy();
}

@end