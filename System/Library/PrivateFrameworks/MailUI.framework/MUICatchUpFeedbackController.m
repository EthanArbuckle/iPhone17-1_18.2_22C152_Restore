@interface MUICatchUpFeedbackController
+ (BOOL)isFeedbackRestricted;
+ (void)provideAutomaticSummaryFeedbackWithType:(int64_t)a3 message:(id)a4 sourceViewController:(id)a5;
+ (void)provideHighlightsFeedbackWithType:(int64_t)a3 message:(id)a4 sourceViewController:(id)a5;
- (MUICatchUpFeedbackController)init;
@end

@implementation MUICatchUpFeedbackController

+ (void)provideAutomaticSummaryFeedbackWithType:(int64_t)a3 message:(id)a4 sourceViewController:(id)a5
{
  swift_getObjCClassMetadata();
  id v5 = a4;
  id v6 = a5;
  swift_getObjCClassMetadata();
  static MUICatchUpFeedbackController.provideAutomaticSummaryFeedback(with:message:sourceViewController:)(a3, a4, a5);
}

+ (void)provideHighlightsFeedbackWithType:(int64_t)a3 message:(id)a4 sourceViewController:(id)a5
{
  swift_getObjCClassMetadata();
  id v5 = a4;
  id v6 = a5;
  swift_getObjCClassMetadata();
  static MUICatchUpFeedbackController.provideHighlightsFeedback(with:message:sourceViewController:)(a3, a4, a5);
}

+ (BOOL)isFeedbackRestricted
{
  return sub_1DDEECF48() & 1;
}

- (MUICatchUpFeedbackController)init
{
  return (MUICatchUpFeedbackController *)MUICatchUpFeedbackController.init()();
}

@end