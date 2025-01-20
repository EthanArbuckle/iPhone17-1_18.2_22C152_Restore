@interface SRCarPlayPresentation
- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3;
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (BOOL)shouldAllowTouchPassThrough;
- (BOOL)shouldProceedToNextCommandAtSpeechSynthesisEnd;
- (BOOL)shouldResumeInterruptedAudioPlayback;
- (BOOL)shouldResumeInterruptedAudioPlaybackForAttendingState:(BOOL)a3;
- (BOOL)shouldUseEventDrivenIdleAndQuietUpdates;
- (SRCarPlayPresentation)init;
- (SRCarPlayPresentation)initWithDelegate:(id)a3 dataSource:(id)a4;
- (SRCarPlayPresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6;
- (SiriUIPresentationDataSource)dataSource;
- (SiriUIPresentationDelegate)delegate;
- (id)viewController;
- (int64_t)options;
- (void)autodismiss;
- (void)configureForRequestOptions:(id)a3;
- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4;
- (void)dealloc;
- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4;
- (void)handleRequestToCeaseAttending;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)siriDidDeactivateWithCompletion:(id)a3;
- (void)siriDidOpenURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5;
- (void)siriDidStartSpeakingWithIdentifier:(id)a3;
- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4;
- (void)siriDidTransitionFromState:(int64_t)a3 event:(int64_t)a4;
- (void)siriDidUpdateASRWithRecognition:(id)a3;
- (void)siriIsIdleAndQuietStatusDidChange:(BOOL)a3 isAttending:(BOOL)a4;
- (void)siriRequestWillStartWithRequestOptions:(id)a3;
- (void)siriWillBePresented:(int64_t)a3;
@end

@implementation SRCarPlayPresentation

- (SiriUIPresentationDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (SiriUIPresentationDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (SiriUIPresentationDataSource)dataSource
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (SiriUIPresentationDataSource *)Strong;
}

- (void)setDataSource:(id)a3
{
}

- (SRCarPlayPresentation)initWithDelegate:(id)a3 dataSource:(id)a4
{
  return (SRCarPlayPresentation *)sub_100082F04();
}

- (SRCarPlayPresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v8 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  void *v8 = 0;
  v8[1] = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_siriIsIdleAndQuiet) = 2;
  id v9 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();

  result = (SRCarPlayPresentation *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  [v3 cancelPreviousPerformRequestsWithTarget:v4];
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for SRCarPlayPresentation();
  [(SRCarPlayPresentation *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_10007E630((uint64_t)self + OBJC_IVAR___SRCarPlayPresentation_delegate);
  sub_10007E630((uint64_t)self + OBJC_IVAR___SRCarPlayPresentation_dataSource);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
}

- (void)autodismiss
{
  v2 = self;
  sub_100083338();
}

- (SRCarPlayPresentation)init
{
  result = (SRCarPlayPresentation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_1000849BC(a3, a4);
}

- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100085104((uint64_t)a3);

  return 1;
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  return 0;
}

- (int64_t)options
{
  return 2;
}

- (BOOL)shouldProceedToNextCommandAtSpeechSynthesisEnd
{
  v2 = self;
  sub_100085260();
  char v4 = v3;

  return v4 & 1;
}

- (BOOL)shouldAllowTouchPassThrough
{
  return 0;
}

- (BOOL)shouldUseEventDrivenIdleAndQuietUpdates
{
  return 1;
}

- (void)siriIsIdleAndQuietStatusDidChange:(BOOL)a3 isAttending:(BOOL)a4
{
  v6 = self;
  sub_100085358(a3, a4);
}

- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_100085988(v6, a4);
}

- (BOOL)shouldResumeInterruptedAudioPlaybackForAttendingState:(BOOL)a3
{
  if (a3) {
    return *((unsigned char *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_shouldResumeMediaOnIdle);
  }
  else {
    return 1;
  }
}

- (BOOL)shouldResumeInterruptedAudioPlayback
{
  return 1;
}

- (void)siriDidDeactivateWithCompletion:(id)a3
{
  char v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    id v5 = sub_100088E4C;
  }
  else
  {
    id v5 = 0;
  }
  id v6 = self;
  sub_100085CCC((void (*)(void))v5);
  sub_100088E04((uint64_t)v5);
}

- (void)siriWillBePresented:(int64_t)a3
{
  char v4 = self;
  sub_100085E44(a3);
}

- (void)siriDidStartSpeakingWithIdentifier:(id)a3
{
}

- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  if (v9)
  {
    v10 = self;
    id v11 = v9;
    sub_10009EB94(v6, v8, a4);

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)siriRequestWillStartWithRequestOptions:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100086180(a3);
}

- (void)siriDidUpdateASRWithRecognition:(id)a3
{
}

- (void)siriDidOpenURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5
{
  uint64_t v8 = sub_10007D3B4((uint64_t *)&unk_1001716F0);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v13 = self;
  sub_100088B5C((uint64_t)v10);

  swift_bridgeObjectRelease();
  sub_100088D3C((uint64_t)v10);
}

- (void)siriDidTransitionFromState:(int64_t)a3 event:(int64_t)a4
{
  uint64_t v6 = self;
  sub_100086638(a3, a4);
}

- (id)viewController
{
  id result = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (void)handleRequestToCeaseAttending
{
  v2 = self;
  sub_100086F80();
}

- (void)configureForRequestOptions:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100087384(v4);
}

@end