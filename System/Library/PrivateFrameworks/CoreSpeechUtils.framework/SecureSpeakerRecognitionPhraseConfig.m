@interface SecureSpeakerRecognitionPhraseConfig
- (NSString)name;
- (SecureSpeakerRecognitionPhraseConfig)init;
- (SecureSpeakerRecognitionPhraseConfig)initWithName:(id)a3 satThreshold:(float)a4 multiUserLowScoreThreshold:(int64_t)a5 multiUserHighScoreThreshold:(int64_t)a6 multiUserConfidentScoreThreshold:(int64_t)a7 multiUserDeltaScoreThreshold:(int64_t)a8;
- (float)satThreshold;
- (int64_t)multiUserConfidentScoreThreshold;
- (int64_t)multiUserDeltaScoreThreshold;
- (int64_t)multiUserHighScoreThreshold;
- (int64_t)multiUserLowScoreThreshold;
@end

@implementation SecureSpeakerRecognitionPhraseConfig

- (NSString)name
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24C78B7F0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (float)satThreshold
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionPhraseConfig_satThreshold);
}

- (int64_t)multiUserLowScoreThreshold
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___SecureSpeakerRecognitionPhraseConfig_multiUserLowScoreThreshold);
}

- (int64_t)multiUserHighScoreThreshold
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___SecureSpeakerRecognitionPhraseConfig_multiUserHighScoreThreshold);
}

- (int64_t)multiUserConfidentScoreThreshold
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___SecureSpeakerRecognitionPhraseConfig_multiUserConfidentScoreThreshold);
}

- (int64_t)multiUserDeltaScoreThreshold
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___SecureSpeakerRecognitionPhraseConfig_multiUserDeltaScoreThreshold);
}

- (SecureSpeakerRecognitionPhraseConfig)initWithName:(id)a3 satThreshold:(float)a4 multiUserLowScoreThreshold:(int64_t)a5 multiUserHighScoreThreshold:(int64_t)a6 multiUserConfidentScoreThreshold:(int64_t)a7 multiUserDeltaScoreThreshold:(int64_t)a8
{
  uint64_t v14 = sub_24C78B800();
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___SecureSpeakerRecognitionPhraseConfig_name);
  uint64_t *v15 = v14;
  v15[1] = v16;
  *(float *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionPhraseConfig_satThreshold) = a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionPhraseConfig_multiUserLowScoreThreshold) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionPhraseConfig_multiUserHighScoreThreshold) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionPhraseConfig_multiUserConfidentScoreThreshold) = (Class)a7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SecureSpeakerRecognitionPhraseConfig_multiUserDeltaScoreThreshold) = (Class)a8;
  v18.receiver = self;
  v18.super_class = (Class)SecureSpeakerRecognitionPhraseConfig;
  return [(SecureSpeakerRecognitionPhraseConfig *)&v18 init];
}

- (SecureSpeakerRecognitionPhraseConfig)init
{
  result = (SecureSpeakerRecognitionPhraseConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end