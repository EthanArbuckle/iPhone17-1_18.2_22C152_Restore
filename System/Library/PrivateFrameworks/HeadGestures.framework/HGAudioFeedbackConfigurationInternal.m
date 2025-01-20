@interface HGAudioFeedbackConfigurationInternal
+ (HGAudioFeedbackConfigurationInternal)defaultAudioConfiguration;
- (BOOL)enableAudioFeedback;
- (BOOL)enableWaitingTone;
- (BOOL)invertedConfirmationAudioFeedbackMode;
- (HGAudioFeedbackConfigurationInternal)init;
- (HGAudioFeedbackConfigurationInternal)initWithEnableAudioFeedback:(BOOL)a3 enableWaitingTone:(BOOL)a4 audioSessionID:(unsigned int)a5;
- (unsigned)audioSessionID;
- (void)enableAudioFeedbackForGestureWithGesture:(unint64_t)a3 enable:(BOOL)a4;
- (void)enableAudioFeedbackForPartGestureWithPart:(unint64_t)a3 enable:(BOOL)a4;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setEnableAudioFeedback:(BOOL)a3;
- (void)setEnableWaitingTone:(BOOL)a3;
- (void)setInvertedConfirmationAudioFeedbackMode:(BOOL)a3;
@end

@implementation HGAudioFeedbackConfigurationInternal

+ (HGAudioFeedbackConfigurationInternal)defaultAudioConfiguration
{
  return (HGAudioFeedbackConfigurationInternal *)sub_250BE19A4((uint64_t)a1, (uint64_t)a2, &qword_269AF8F48, (void **)&qword_269AF91D0);
}

- (BOOL)enableAudioFeedback
{
  v2 = (BOOL *)self + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback;
  swift_beginAccess();
  return *v2;
}

- (void)setEnableAudioFeedback:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)invertedConfirmationAudioFeedbackMode
{
  v2 = (BOOL *)self + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode;
  swift_beginAccess();
  return *v2;
}

- (void)setInvertedConfirmationAudioFeedbackMode:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)enableWaitingTone
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_250C1D468();
  swift_release();
  swift_release();

  return v5;
}

- (void)setEnableWaitingTone:(BOOL)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_250C1D478();
}

- (unsigned)audioSessionID
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  swift_beginAccess();
  return *v2;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (HGAudioFeedbackConfigurationInternal)initWithEnableAudioFeedback:(BOOL)a3 enableWaitingTone:(BOOL)a4 audioSessionID:(unsigned int)a5
{
  return (HGAudioFeedbackConfigurationInternal *)HGAudioFeedbackConfiguration.init(enableAudioFeedback:enableWaitingTone:audioSessionID:)(a3, a4, a5);
}

- (void)enableAudioFeedbackForGestureWithGesture:(unint64_t)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = self;
  sub_250BE0C30(a3, v4);
}

- (void)enableAudioFeedbackForPartGestureWithPart:(unint64_t)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = self;
  sub_250BE1048(a3, v4);
}

- (HGAudioFeedbackConfigurationInternal)init
{
  result = (HGAudioFeedbackConfigurationInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___HGAudioFeedbackConfigurationInternal__enableWaitingTone;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9048);
  BOOL v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end