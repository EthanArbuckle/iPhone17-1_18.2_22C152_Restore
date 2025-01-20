@interface AMMessagesViewController
+ (_TtC22AudioMessagesExtension24AMMessagesViewController)sharedMessagesViewController;
+ (void)setSharedMessagesViewController:(id)a3;
- (UIStackView)stackView;
- (_TtC22AudioMessagesExtension24AMMessagesViewController)initWithCoder:(id)a3;
- (_TtC22AudioMessagesExtension24AMMessagesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)audioMessageDidCancelMessage;
- (void)audioMessageDidChangeAudioPowerLevel:(float)a3 duration:(double)a4;
- (void)audioMessageDidChangeCurrentPlaybackTime:(double)a3;
- (void)audioMessageDidEndPlayback;
- (void)audioMessageDidSendMessage;
- (void)audioMessageStartedRecordingFromMessages;
- (void)audioMessageStoppedRecordingFromMessages;
- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4;
- (void)didResignActiveWithConversation:(id)a3;
- (void)didStartSendingMessage:(id)a3 conversation:(id)a4;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)setStackView:(id)a3;
- (void)updateSnapshotWithCompletionBlock:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation AMMessagesViewController

- (void)audioMessageDidChangeAudioPowerLevel:(float)a3 duration:(double)a4
{
  v6 = self;
  sub_2E504(a3, a4);
}

- (void)audioMessageDidChangeCurrentPlaybackTime:(double)a3
{
  v4 = self;
  sub_2E834(a3);
}

- (void)audioMessageDidEndPlayback
{
  id Strong = (id)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v3 = self;
    sub_3A4C8(5u, 1, 0.0);
  }
  else
  {
    __break(1u);
  }
}

- (void)audioMessageDidSendMessage
{
  v2 = self;
  sub_2EABC();
}

- (void)audioMessageDidCancelMessage
{
  v2 = self;
  sub_2EC08();
}

- (void)audioMessageStartedRecordingFromMessages
{
  v2 = self;
  sub_2ED58();
}

- (void)audioMessageStoppedRecordingFromMessages
{
  v2 = self;
  sub_2EE20();
}

- (UIStackView)stackView
{
  id Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIStackView *)Strong;
}

- (void)setStackView:(id)a3
{
}

+ (_TtC22AudioMessagesExtension24AMMessagesViewController)sharedMessagesViewController
{
  if (qword_82518 != -1) {
    swift_once();
  }
  id Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC22AudioMessagesExtension24AMMessagesViewController *)Strong;
}

+ (void)setSharedMessagesViewController:(id)a3
{
  uint64_t v3 = qword_82518;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_unknownObjectWeakAssign();
}

- (_TtC22AudioMessagesExtension24AMMessagesViewController)initWithCoder:(id)a3
{
  return (_TtC22AudioMessagesExtension24AMMessagesViewController *)sub_2F0BC(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2F444();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_2F658(a3);
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2F7A4((uint64_t)a3);
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController_conversation);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController_conversation) = (Class)a3;
  id v5 = a3;
  v8 = self;

  id v6 = sub_2E48C();
  id v7 = [v6 powerLevels];

  if (v7)
  {

    sub_2EE20();
  }
}

- (void)didResignActiveWithConversation:(id)a3
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController_conversation);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController_conversation) = 0;
}

- (void)didStartSendingMessage:(id)a3 conversation:(id)a4
{
}

- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4
{
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController_currentPresentationStyle) = (Class)a3;
  id v4 = self;
  sub_2F230(a3);
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  id v5 = self;
  sub_3130C(v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC22AudioMessagesExtension24AMMessagesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22AudioMessagesExtension24AMMessagesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController_logger;
  uint64_t v4 = sub_46730();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController____lazy_storage___audioMessagesControlInterface));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension24AMMessagesViewController_conversation));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    id v7 = self;
    swift_unknownObjectRetain();
    sub_46910();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a3;
    v9 = self;
  }
  sub_2FF2C(a3, (uint64_t)v10);

  sub_316F8((uint64_t)v10);
}

@end