@interface CHSActivityService
- (CHSActivityService)init;
- (CHSActivityService)initWithConnection:(id)a3;
- (id)subscribeToActivityID:(id)a3 withHandler:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation CHSActivityService

- (CHSActivityService)init
{
  id v3 = objc_msgSend(self, sel_sharedInstance);
  v4 = [(CHSActivityService *)self initWithConnection:v3];

  return v4;
}

- (CHSActivityService)initWithConnection:(id)a3
{
  return (CHSActivityService *)sub_190CED1A8(a3);
}

- (void)dealloc
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSActivityService_queue_activityServiceAssertion);
  v4 = self;
  if (v3) {
    objc_msgSend(v3, sel_invalidate);
  }
  v5.receiver = self;
  v5.super_class = (Class)CHSActivityService;
  [(CHSActivityService *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (void)invalidate
{
  v2 = self;
  CHSActivityService.invalidate()();
}

- (id)subscribeToActivityID:(id)a3 withHandler:(id)a4
{
  objc_super v5 = _Block_copy(a4);
  uint64_t v6 = sub_190D41978();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  id v11 = CHSActivityService.subscribe(toActivityID:withHandler:)(v6, v8, (uint64_t)sub_190CEF218, v9);

  swift_bridgeObjectRelease();
  swift_release();
  return v11;
}

@end