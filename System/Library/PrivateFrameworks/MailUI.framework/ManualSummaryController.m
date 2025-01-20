@interface ManualSummaryController
- (_TtC6MailUI23ManualSummaryController)init;
@end

@implementation ManualSummaryController

- (_TtC6MailUI23ManualSummaryController)init
{
  return (_TtC6MailUI23ManualSummaryController *)ManualSummaryController.init()();
}

- (void).cxx_destruct
{
  uint64_t v3 = OBJC_IVAR____TtC6MailUI23ManualSummaryController_logger;
  uint64_t v2 = sub_1DDEED388();
  (*(void (**)(char *))(*(void *)(v2 - 8) + 8))((char *)self + v3);
  swift_release();
  sub_1DDD31430();
  swift_unknownObjectWeakDestroy();
  sub_1DDDFAC5C((uint64_t)self + OBJC_IVAR____TtC6MailUI23ManualSummaryController_summaryRequest);
  sub_1DDDFB394((uint64_t)self + OBJC_IVAR____TtC6MailUI23ManualSummaryController_summaryResponse);
}

@end