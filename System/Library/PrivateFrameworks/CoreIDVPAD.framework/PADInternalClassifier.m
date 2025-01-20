@interface PADInternalClassifier
- (_TtC10CoreIDVPAD21PADInternalClassifier)init;
- (void)cancelWithCompletion:(id)a3;
- (void)enableAccessibilityOptions;
- (void)finishLivenessStepUp:(id)a3;
- (void)finishLivenessWithSelfie:(id)a3 performIDMatching:(BOOL)a4 completion:(id)a5;
- (void)pauseLiveness;
- (void)prepareToResumeLiveness;
- (void)processLivenessFrame:(id)a3 withOptions:(PADClassifierFrameOptions)a4 taOptions:(int64_t)a5;
- (void)restartLivenessGesture;
- (void)resumeLiveness;
- (void)skipLivenessGesture;
- (void)startLiveness:(id)a3 onGestureStart:(id)a4 onIncorrectGestureDetected:(id)a5 onGesturesFinished:(id)a6;
@end

@implementation PADInternalClassifier

- (_TtC10CoreIDVPAD21PADInternalClassifier)init
{
  return (_TtC10CoreIDVPAD21PADInternalClassifier *)PADInternalClassifier.init()();
}

- (void)startLiveness:(id)a3 onGestureStart:(id)a4 onIncorrectGestureDetected:(id)a5 onGesturesFinished:(id)a6
{
  v10 = _Block_copy(a4);
  v11 = _Block_copy(a5);
  v12 = _Block_copy(a6);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v10;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v11;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  id v17 = a3;
  v16 = self;
  sub_21F0A06B0(v17, (uint64_t)sub_21F0A52A4, v13, (uint64_t)sub_21F0A54B8, v14, (uint64_t)sub_21F0A52B8, v15);
  swift_release();
  swift_release();
  swift_release();
}

- (void)processLivenessFrame:(id)a3 withOptions:(PADClassifierFrameOptions)a4 taOptions:(int64_t)a5
{
  int v7 = *(_DWORD *)&a4.var0 & 0x10101;
  id v8 = a3;
  v9 = self;
  sub_21F0A12C4(v8, v7, a5);
}

- (void)skipLivenessGesture
{
}

- (void)enableAccessibilityOptions
{
}

- (void)restartLivenessGesture
{
}

- (void)pauseLiveness
{
}

- (void)prepareToResumeLiveness
{
}

- (void)resumeLiveness
{
}

- (void)finishLivenessWithSelfie:(id)a3 performIDMatching:(BOOL)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  v11 = self;
  sub_21F0A17F0(v10, a4, (uint64_t)sub_21F0A54B4, v9);

  swift_release();
}

- (void)finishLivenessStepUp:(id)a3
{
}

- (void)cancelWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  sub_21F0A46F0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_gestureStartBlock));
  sub_21F0A46F0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_incorrectGestureDetectedBlock));
  sub_21F0A46F0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onGesturesFinishedBlock));
  sub_21F0A46F0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlockAccessSemaphore));

  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onClassifierLoaded);
  sub_21F0A46F0(v3);
}

@end