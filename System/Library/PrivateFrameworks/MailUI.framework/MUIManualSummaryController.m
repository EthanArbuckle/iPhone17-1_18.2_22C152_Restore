@interface MUIManualSummaryController
+ (BOOL)allowManualSummary;
+ (BOOL)shouldAllowSummarizationForContentLength:(int64_t)a3;
+ (BOOL)shouldAlwaysHideConversationSummarizeControl;
- (MUIManualSummaryController)init;
- (MUIManualSummaryController)initWithMessages:(id)a3 sourceViewController:(id)a4;
- (void)provideFeedbackWithType:(int64_t)a3;
- (void)summarizeMessageWithCompletion:(id)a3;
@end

@implementation MUIManualSummaryController

- (void).cxx_destruct
{
}

+ (BOOL)shouldAlwaysHideConversationSummarizeControl
{
  return sub_1DDEECF48() & 1;
}

- (MUIManualSummaryController)initWithMessages:(id)a3 sourceViewController:(id)a4
{
  swift_getObjectType();
  id v4 = a3;
  id v5 = a4;
  sub_1DDD9C9FC();
  uint64_t v6 = sub_1DDEEEDA8();
  v10 = (MUIManualSummaryController *)sub_1DDE83CD8(v6, a4);

  return v10;
}

- (void)summarizeMessageWithCompletion:(id)a3
{
  swift_getObjectType();
  uint64_t v6 = _Block_copy(a3);
  id v4 = self;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  MUIManualSummaryController.summarizeMessage(completion:)((uint64_t)sub_1DDE841D0, v7);
  swift_release();
}

- (void)provideFeedbackWithType:(int64_t)a3
{
  swift_getObjectType();
  id v4 = self;
  MUIManualSummaryController.provideFeedback(with:)(a3);
}

+ (BOOL)allowManualSummary
{
  return sub_1DDEECF48() & 1;
}

+ (BOOL)shouldAllowSummarizationForContentLength:(int64_t)a3
{
  return sub_1DDEECF48() & 1;
}

- (MUIManualSummaryController)init
{
  return (MUIManualSummaryController *)MUIManualSummaryController.init()();
}

@end