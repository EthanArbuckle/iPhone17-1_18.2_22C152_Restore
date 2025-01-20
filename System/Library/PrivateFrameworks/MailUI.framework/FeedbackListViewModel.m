@interface FeedbackListViewModel
- (_TtC6MailUI21FeedbackListViewModel)init;
- (_TtC6MailUI21FeedbackListViewModel)initWithDaemonInterface:(id)a3 diagnosticsHelper:(id)a4 viewModelHelper:(id)a5;
- (id)_cancellationHandler;
- (id)cancellationHandler;
- (id)messageListItemsForDiagnosticsHelper:(id)a3;
- (void)setCancellationHandler:(id)a3;
- (void)set_cancellationHandler:(id)a3;
@end

@implementation FeedbackListViewModel

- (id)_cancellationHandler
{
  v2 = self;
  uint64_t v9 = sub_1DDDB2790();
  uint64_t v8 = v3;

  if (v9)
  {
    uint64_t v15 = v9;
    uint64_t v16 = v8;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    int v11 = 1107296256;
    int v12 = 0;
    v13 = sub_1DDDAD198;
    v14 = &block_descriptor_114;
    v5 = _Block_copy(&aBlock);
    swift_release();
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)set_cancellationHandler:(id)a3
{
  uint64_t v8 = _Block_copy(a3);
  uint64_t v3 = self;
  if (v8)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v8;
    v5 = sub_1DDDB6FBC;
    uint64_t v6 = v4;
  }
  else
  {
    v5 = 0;
    uint64_t v6 = 0;
  }
  sub_1DDDB2908((uint64_t)v5, v6);
}

- (id)cancellationHandler
{
  v2 = self;
  uint64_t v9 = FeedbackListViewModel.cancellationHandler.getter();
  uint64_t v8 = v3;

  if (v9)
  {
    uint64_t v15 = v9;
    uint64_t v16 = v8;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    int v11 = 1107296256;
    int v12 = 0;
    v13 = sub_1DDDAD198;
    v14 = &block_descriptor_120;
    v5 = _Block_copy(&aBlock);
    swift_release();
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)setCancellationHandler:(id)a3
{
  uint64_t v8 = _Block_copy(a3);
  uint64_t v3 = self;
  if (v8)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v8;
    v5 = sub_1DDDB6FBC;
    uint64_t v6 = v4;
  }
  else
  {
    v5 = 0;
    uint64_t v6 = 0;
  }
  FeedbackListViewModel.cancellationHandler.setter((uint64_t)v5, v6);
}

- (_TtC6MailUI21FeedbackListViewModel)initWithDaemonInterface:(id)a3 diagnosticsHelper:(id)a4 viewModelHelper:(id)a5
{
  id v5 = a3;
  id v6 = a4;
  id v7 = a5;
  return (_TtC6MailUI21FeedbackListViewModel *)FeedbackListViewModel.init(daemonInterface:diagnosticsHelper:viewModelHelper:)(a3, a4, a5);
}

- (id)messageListItemsForDiagnosticsHelper:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v11 = FeedbackListViewModel.messageListItems(for:)((uint64_t)a3);

  if (v11)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAB96720);
    uint64_t v7 = sub_1DDEEED98();
    swift_bridgeObjectRelease();
    id v8 = (id)v7;
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (_TtC6MailUI21FeedbackListViewModel)init
{
  return (_TtC6MailUI21FeedbackListViewModel *)FeedbackListViewModel.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC6MailUI21FeedbackListViewModel_messageProvider);
  sub_1DDD99A20((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MailUI21FeedbackListViewModel__state));

  sub_1DDD5C558();
  sub_1DDD31430();
  sub_1DDDB2B50((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MailUI21FeedbackListViewModel__cancellationHandler));

  uint64_t v3 = OBJC_IVAR____TtC6MailUI21FeedbackListViewModel___observationRegistrar;
  uint64_t v2 = sub_1DDEECFD8();
  (*(void (**)(char *))(*(void *)(v2 - 8) + 8))((char *)self + v3);
}

@end