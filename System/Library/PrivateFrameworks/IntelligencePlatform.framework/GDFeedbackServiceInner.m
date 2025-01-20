@interface GDFeedbackServiceInner
- (BOOL)objcRecordWithFeedback:(id)a3 error:(id *)a4;
- (BOOL)objcRecordWithFeedback:(id)a3 for:(int64_t)a4 error:(id *)a5;
- (GDFeedbackServiceInner)init;
@end

@implementation GDFeedbackServiceInner

- (GDFeedbackServiceInner)init
{
  return (GDFeedbackServiceInner *)FeedbackService.init()();
}

- (BOOL)objcRecordWithFeedback:(id)a3 error:(id *)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  FeedbackService.objcRecord(feedback:)((uint64_t)a3);

  swift_unknownObjectRelease();
  return 1;
}

- (BOOL)objcRecordWithFeedback:(id)a3 for:(int64_t)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  v8 = self;
  FeedbackService.objcRecord(feedback:for:)((uint64_t)a3, a4);

  swift_unknownObjectRelease();
  return 1;
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectRelease();
}

@end