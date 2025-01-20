@interface _PADClassifier
- (_PADClassifier)init;
- (void)cancelWithCompletion:(id)a3;
- (void)enableAccessibilityOptions;
- (void)finishLivenessStepUp:(id)a3;
- (void)finishLivenessWithSelfie:(id)a3 idMatchingFaceprints:(id)a4 completion:(id)a5;
- (void)finishLivenessWithSelfie:(id)a3 performIDMatching:(BOOL)a4 completion:(id)a5;
- (void)pauseLiveness;
- (void)prepareToResumeLiveness;
- (void)processLivenessFrame:(id)a3 withOptions:(PADClassifierFrameOptions)a4 taOptions:(int64_t)a5;
- (void)processRecordedLivenessFrame:(id)a3 withPRD:(BOOL)a4 FAC:(BOOL)a5;
- (void)restartLivenessGesture;
- (void)resumeLiveness;
- (void)skipLivenessGesture;
- (void)skipRecordedLivenessGesture;
- (void)startLiveness:(id)a3 onGestureStart:(id)a4 onIncorrectGestureDetected:(id)a5 onGesturesFinished:(id)a6;
- (void)startLivenessVideoProcessing:(id)a3 onGestureStart:(id)a4 onGesturesFinished:(id)a5;
@end

@implementation _PADClassifier

- (_PADClassifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PADClassifier;
  v2 = [(_PADClassifier *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC10CoreIDVPAD21PADInternalClassifier);
    classifier = v2->_classifier;
    v2->_classifier = v3;
  }
  return v2;
}

- (void)startLiveness:(id)a3 onGestureStart:(id)a4 onIncorrectGestureDetected:(id)a5 onGesturesFinished:(id)a6
{
}

- (void)startLivenessVideoProcessing:(id)a3 onGestureStart:(id)a4 onGesturesFinished:(id)a5
{
}

- (void)skipLivenessGesture
{
}

- (void)skipRecordedLivenessGesture
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

- (void)processLivenessFrame:(id)a3 withOptions:(PADClassifierFrameOptions)a4 taOptions:(int64_t)a5
{
}

- (void)processRecordedLivenessFrame:(id)a3 withPRD:(BOOL)a4 FAC:(BOOL)a5
{
  classifier = self->_classifier;
  uint64_t v6 = 0x10000;
  if (!a4) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = 257;
  if (!a5) {
    uint64_t v7 = 1;
  }
  [(PADInternalClassifier *)classifier processLivenessFrame:a3 withOptions:v7 | v6 taOptions:1];
}

- (void)finishLivenessWithSelfie:(id)a3 performIDMatching:(BOOL)a4 completion:(id)a5
{
}

- (void)finishLivenessWithSelfie:(id)a3 idMatchingFaceprints:(id)a4 completion:(id)a5
{
}

- (void)finishLivenessStepUp:(id)a3
{
}

- (void)cancelWithCompletion:(id)a3
{
}

- (void)enableAccessibilityOptions
{
}

- (void).cxx_destruct
{
}

@end