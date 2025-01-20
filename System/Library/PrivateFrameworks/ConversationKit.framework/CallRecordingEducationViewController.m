@interface CallRecordingEducationViewController
- (BOOL)_canShowWhileLocked;
- (void)handleTappedEducationScreenCancel;
- (void)handleTappedEducationScreenContinue;
@end

@implementation CallRecordingEducationViewController

- (void)handleTappedEducationScreenContinue
{
  v2 = self;
  CallRecordingEducationViewController.handleTappedEducationScreenContinue()();
}

- (void)handleTappedEducationScreenCancel
{
  v2 = self;
  CallRecordingEducationViewController.handleTappedEducationScreenCancel()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit36CallRecordingEducationViewController_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit36CallRecordingEducationViewController_continueButton);
}

@end