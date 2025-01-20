@interface CHSWidgetService
+ (CHSWidgetService)sharedWidgetService;
- (CHSWidgetService)init;
- (void)invalidateRelevancesOfKind:(id)a3 inBundle:(id)a4 completion:(id)a5;
@end

@implementation CHSWidgetService

+ (CHSWidgetService)sharedWidgetService
{
  if (qword_1E92AA470 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E92AA598;
  return (CHSWidgetService *)v2;
}

- (void)invalidateRelevancesOfKind:(id)a3 inBundle:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  sub_190D41978();
  sub_190D41978();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSWidgetService_connection);
  v9 = self;
  v10 = (void *)sub_190D41948();
  v11 = (void *)sub_190D41948();
  v13[4] = sub_190CF4298;
  v13[5] = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = sub_190D3A86C;
  v13[3] = &block_descriptor_11;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_invalidateRelevancesOfKind_inBundle_completion_, v10, v11, v12);
  _Block_release(v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (CHSWidgetService)init
{
  uint64_t v3 = OBJC_IVAR___CHSWidgetService_connection;
  v4 = self;
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_sharedInstance);

  v7.receiver = v5;
  v7.super_class = (Class)CHSWidgetService;
  return [(CHSWidgetService *)&v7 init];
}

- (void).cxx_destruct
{
}

@end