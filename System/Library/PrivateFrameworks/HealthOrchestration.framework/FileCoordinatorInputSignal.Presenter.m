@interface FileCoordinatorInputSignal.Presenter
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (_TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter)init;
- (void)presentedItemDidChange;
@end

@implementation FileCoordinatorInputSignal.Presenter

- (NSURL)presentedItemURL
{
  sub_251169C8C(0, &qword_269B21F98, MEMORY[0x263F06EA8]);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - v4;
  v6 = (char *)self + OBJC_IVAR____TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter_observedURL;
  uint64_t v7 = sub_2511C9180();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_2511C9160();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSURL *)v9;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter_presentedItemOperationQueue));
}

- (void)presentedItemDidChange
{
  if (swift_weakLoadStrong())
  {
    uint64_t v3 = (char *)self + OBJC_IVAR____TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter_observedURL;
    uint64_t v4 = self;
    sub_251166810((uint64_t)v3);

    swift_release();
  }
}

- (_TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter)init
{
  result = (_TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter_observedURL;
  uint64_t v4 = sub_2511C9180();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC19HealthOrchestration26FileCoordinatorInputSignal9Presenter_presentedItemOperationQueue));

  swift_weakDestroy();
}

@end