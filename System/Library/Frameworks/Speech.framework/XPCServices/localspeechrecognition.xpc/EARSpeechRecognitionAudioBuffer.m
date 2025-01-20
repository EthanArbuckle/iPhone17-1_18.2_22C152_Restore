@interface EARSpeechRecognitionAudioBuffer
- (_TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer)init;
- (void)addAudioSampleData:(id)a3;
- (void)cancelRecognition;
- (void)endAudio;
- (void)packetArrivalTimestampFromAudioTimestamp:(float)a3 reply:(id)a4;
@end

@implementation EARSpeechRecognitionAudioBuffer

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
  sub_100023B94(v3, v7);
  sub_10000CB00((uint64_t)v3, v7);
}

- (void)endAudio
{
  v2 = self;
  sub_100023D70();
}

- (void)cancelRecognition
{
  v2 = self;
  sub_100023DDC();
}

- (void)packetArrivalTimestampFromAudioTimestamp:(float)a3 reply:(id)a4
{
  unint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(float *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = v6;
  *(void *)(v7 + 32) = self;
  v8 = self;

  sub_10002447C((uint64_t)&unk_100064100, v7);
}

- (_TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition31EARSpeechRecognitionAudioBuffer_audioBuffer));
}

@end