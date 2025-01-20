@interface CRFileSyncPresenter
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (_TtC9Coherence19CRFileSyncPresenter)init;
- (void)presentedItemDidChange;
- (void)presentedItemDidGainVersion:(id)a3;
@end

@implementation CRFileSyncPresenter

- (NSURL)presentedItemURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBC0760);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC9Coherence19CRFileSyncPresenter_fileURL;
  uint64_t v7 = sub_1C4496498();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1C4496418();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC9Coherence19CRFileSyncPresenter_queue));
}

- (void)presentedItemDidChange
{
  v2 = self;
  sub_1C446EA08();
}

- (void)presentedItemDidGainVersion:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C446ECE4(v4);
}

- (_TtC9Coherence19CRFileSyncPresenter)init
{
  result = (_TtC9Coherence19CRFileSyncPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9Coherence19CRFileSyncPresenter_fileURL;
  uint64_t v4 = sub_1C4496498();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = (char *)self + OBJC_IVAR____TtC9Coherence19CRFileSyncPresenter_manager;
  sub_1C3FDA220((uint64_t)v5);
}

@end