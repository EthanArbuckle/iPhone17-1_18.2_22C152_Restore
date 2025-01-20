@interface EARSpeechRecognitionResultStream
- (_TtC22localspeechrecognition32EARSpeechRecognitionResultStream)init;
- (void)dealloc;
- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4;
- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4;
- (void)speechRecognizer:(id)a3 didProduceEndpointFeaturesWithWordCount:(int64_t)a4 trailingSilenceDuration:(int64_t)a5 eosLikelihood:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10;
- (void)speechRecognizer:(id)a3 didProduceLoggablePackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4;
- (void)speechRecognizer:(id)a3 didReportStatus:(unint64_t)a4 statusContext:(id)a5;
@end

@implementation EARSpeechRecognitionResultStream

- (void)dealloc
{
  v2 = self;
  sub_10002AA0C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_connection));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_modelContextDelegateInterface));
  v3 = (char *)self + OBJC_IVAR____TtC22localspeechrecognition32EARSpeechRecognitionResultStream_asrID;

  sub_100007B2C((uint64_t)v3);
}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_10002AB40((uint64_t)v8, a4);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10002AD70((uint64_t)v8, (uint64_t)v7);
}

- (void)speechRecognizer:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10002AE00((uint64_t)v8, (uint64_t)v7);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10002AE90((uint64_t)v8, (uint64_t)v7);
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10002AF20((uint64_t)v8, (uint64_t)v7);
}

- (void)speechRecognizer:(id)a3 didProduceLoggablePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10002AFB0((uint64_t)v8, (uint64_t)v7);
}

- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  id v5 = a3;
  id v6 = self;
  sub_10002B0BC();
}

- (void)speechRecognizer:(id)a3 didProduceEndpointFeaturesWithWordCount:(int64_t)a4 trailingSilenceDuration:(int64_t)a5 eosLikelihood:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 processedAudioDurationInMilliseconds:(int64_t)a9 acousticEndpointerScore:(double)a10
{
  sub_10000CD4C(0, &qword_100063260);
  uint64_t v18 = sub_100041270();
  id v19 = a3;
  v20 = self;
  sub_10002B144(a6, a8, a10, (uint64_t)v20, a4, a5, v18, a9);

  swift_bridgeObjectRelease();
}

- (void)speechRecognizer:(id)a3 didReportStatus:(unint64_t)a4 statusContext:(id)a5
{
  if (a5) {
    sub_100041130();
  }
  id v8 = a3;
  v9 = self;
  sub_10002B2F4((uint64_t)v9, a4);

  swift_bridgeObjectRelease();
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4
{
  sub_10000CD4C(0, (unint64_t *)&unk_1000642E8);
  sub_100041270();

  swift_bridgeObjectRelease();
}

- (_TtC22localspeechrecognition32EARSpeechRecognitionResultStream)init
{
}

@end