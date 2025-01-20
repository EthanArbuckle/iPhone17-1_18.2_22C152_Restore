@interface SFSpeechAnalyzerConfiguration
- (AVAudioFormat)audioFormat;
- (SFSpeechAnalyzerConfiguration)init;
- (void)setAudioFormat:(id)a3;
@end

@implementation SFSpeechAnalyzerConfiguration

- (void).cxx_destruct
{
}

- (AVAudioFormat)audioFormat
{
  v2 = sub_1B70E3F54();

  return (AVAudioFormat *)v2;
}

- (void)setAudioFormat:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1B70E7AB4((uint64_t)a3, &OBJC_IVAR___SFSpeechAnalyzerConfiguration__config, (void (*)(uint64_t))sub_1B71F1150);
}

- (SFSpeechAnalyzerConfiguration)init
{
  return (SFSpeechAnalyzerConfiguration *)SFSpeechAnalyzerConfiguration.init()();
}

@end