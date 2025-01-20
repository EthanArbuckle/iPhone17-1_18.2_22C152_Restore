@interface HGConfigurationInternal
+ (HGConfigurationInternal)defaultConfig;
- (BOOL)enableRawDataLogging;
- (BOOL)requestPartGestures;
- (BOOL)singleDelivery;
- (HGAudioFeedbackConfigurationInternal)audioFeedbackConfig;
- (HGConfigurationInternal)init;
- (HGConfigurationInternal)initWithML:(id)a3 audioFeedbackConfig:(id)a4;
- (HGConfigurationInternal)initWithMlConfig:(id)a3 audioFeedbackConfig:(id)a4 requestPartGestures:(BOOL)a5;
- (HGMLConfigurationInternal)mlConfig;
- (float)gesturePartAcceptableNodVelocity;
- (float)gesturePartAcceptableShakeVelocity;
- (float)gesturePartRepeatTimeout;
- (void)setAudioFeedbackConfig:(id)a3;
- (void)setEnableRawDataLogging:(BOOL)a3;
- (void)setGesturePartAcceptableNodVelocity:(float)a3;
- (void)setGesturePartAcceptableShakeVelocity:(float)a3;
- (void)setGesturePartRepeatTimeout:(float)a3;
- (void)setMlConfig:(id)a3;
- (void)setRequestPartGestures:(BOOL)a3;
- (void)setSingleDelivery:(BOOL)a3;
@end

@implementation HGConfigurationInternal

+ (HGConfigurationInternal)defaultConfig
{
  return (HGConfigurationInternal *)sub_250BE19A4((uint64_t)a1, (uint64_t)a2, &qword_269AF8F40, (void **)&qword_269AF91C8);
}

- (HGMLConfigurationInternal)mlConfig
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_mlConfig);
  swift_beginAccess();
  return (HGMLConfigurationInternal *)*v2;
}

- (void)setMlConfig:(id)a3
{
}

- (HGAudioFeedbackConfigurationInternal)audioFeedbackConfig
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig);
  swift_beginAccess();
  return (HGAudioFeedbackConfigurationInternal *)*v2;
}

- (void)setAudioFeedbackConfig:(id)a3
{
}

- (BOOL)requestPartGestures
{
  v2 = (BOOL *)self + OBJC_IVAR___HGConfigurationInternal_requestPartGestures;
  swift_beginAccess();
  return *v2;
}

- (void)setRequestPartGestures:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HGConfigurationInternal_requestPartGestures;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)singleDelivery
{
  v2 = (BOOL *)self + OBJC_IVAR___HGConfigurationInternal_singleDelivery;
  swift_beginAccess();
  return *v2;
}

- (void)setSingleDelivery:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HGConfigurationInternal_singleDelivery;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)enableRawDataLogging
{
  v2 = (BOOL *)self + OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging;
  swift_beginAccess();
  return *v2;
}

- (void)setEnableRawDataLogging:(BOOL)a3
{
  v5 = (BOOL *)self + OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging;
  swift_beginAccess();
  BOOL *v5 = a3;
  v6 = self;
  sub_250BDF40C();
}

- (float)gesturePartRepeatTimeout
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_gesturePartRepeatTimeout);
}

- (void)setGesturePartRepeatTimeout:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_gesturePartRepeatTimeout) = a3;
}

- (float)gesturePartAcceptableNodVelocity
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableNodVelocity);
}

- (void)setGesturePartAcceptableNodVelocity:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableNodVelocity) = a3;
}

- (float)gesturePartAcceptableShakeVelocity
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableShakeVelocity);
}

- (void)setGesturePartAcceptableShakeVelocity:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableShakeVelocity) = a3;
}

- (HGConfigurationInternal)initWithMlConfig:(id)a3 audioFeedbackConfig:(id)a4 requestPartGestures:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (HGConfigurationInternal *)sub_250BE2FA4(v7, v8, a5);

  return v9;
}

- (HGConfigurationInternal)initWithML:(id)a3 audioFeedbackConfig:(id)a4
{
  return [(HGConfigurationInternal *)self initWithMlConfig:a3 audioFeedbackConfig:a4 requestPartGestures:0];
}

- (HGConfigurationInternal)init
{
  result = (HGConfigurationInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig);
}

@end