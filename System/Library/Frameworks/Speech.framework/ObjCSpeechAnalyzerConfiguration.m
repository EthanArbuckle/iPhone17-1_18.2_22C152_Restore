@interface ObjCSpeechAnalyzerConfiguration
- (AVAudioFormat)audioFormat;
- (_TtC6Speech31ObjCSpeechAnalyzerConfiguration)init;
- (void)setAudioFormat:(id)a3;
@end

@implementation ObjCSpeechAnalyzerConfiguration

- (AVAudioFormat)audioFormat
{
  v2 = sub_1B71F10C4();

  return (AVAudioFormat *)v2;
}

- (void)setAudioFormat:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1B71F1150((uint64_t)a3);
}

- (_TtC6Speech31ObjCSpeechAnalyzerConfiguration)init
{
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_78_1();
  uint64_t v3 = v2;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_76_3();
}

@end