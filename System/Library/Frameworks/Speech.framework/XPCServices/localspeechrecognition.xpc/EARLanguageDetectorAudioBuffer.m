@interface EARLanguageDetectorAudioBuffer
- (_TtC22localspeechrecognition30EARLanguageDetectorAudioBuffer)init;
- (void)addAudioSampleData:(id)a3;
- (void)endAudio;
@end

@implementation EARLanguageDetectorAudioBuffer

- (void)addAudioSampleData:(id)a3
{
  v3 = a3;
  if (a3)
  {
    v4 = self;
    id v5 = v3;
    v3 = (void *)sub_100040EA0();
    unint64_t v7 = v6;
  }
  else
  {
    v8 = self;
    unint64_t v7 = 0xF000000000000000;
  }
  sub_10000BE80((uint64_t)v3, v7);
  sub_10000CB00((uint64_t)v3, v7);
}

- (void)endAudio
{
  v2 = self;
  sub_10000C0BC();
}

- (_TtC22localspeechrecognition30EARLanguageDetectorAudioBuffer)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition30EARLanguageDetectorAudioBuffer_audioBuffer));
}

@end