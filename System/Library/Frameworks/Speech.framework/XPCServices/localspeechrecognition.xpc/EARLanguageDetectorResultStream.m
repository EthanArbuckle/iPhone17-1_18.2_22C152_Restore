@interface EARLanguageDetectorResultStream
- (_TtC22localspeechrecognition31EARLanguageDetectorResultStream)init;
- (void)dealloc;
- (void)languageDetector:(id)a3 didCompleteProcessingWithLoggingInfo:(id)a4;
- (void)languageDetector:(id)a3 didProduceResult:(id)a4 processedAudioDuration:(double)a5;
@end

@implementation EARLanguageDetectorResultStream

- (void)dealloc
{
  v2 = self;
  sub_10000C480();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition31EARLanguageDetectorResultStream_connection));

  swift_unknownObjectRelease();
}

- (void)languageDetector:(id)a3 didCompleteProcessingWithLoggingInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10000C540();
}

- (void)languageDetector:(id)a3 didProduceResult:(id)a4 processedAudioDuration:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_10000C6F8(a5, (uint64_t)v10, v9);
}

- (_TtC22localspeechrecognition31EARLanguageDetectorResultStream)init
{
}

@end