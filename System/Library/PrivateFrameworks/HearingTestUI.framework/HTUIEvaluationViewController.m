@interface HTUIEvaluationViewController
- (void)pauseHearingTestSession;
- (void)resumeHearingTestSession;
@end

@implementation HTUIEvaluationViewController

- (void)pauseHearingTestSession
{
  if (*(void *)((char *)self + qword_26B21D5C8))
  {
    v2 = self;
    swift_retain();
    sub_25139F488();
    swift_release();
    sub_251405D08();
  }
  else
  {
    __break(1u);
  }
}

- (void)resumeHearingTestSession
{
  v2 = self;
  sub_25140675C();
}

@end