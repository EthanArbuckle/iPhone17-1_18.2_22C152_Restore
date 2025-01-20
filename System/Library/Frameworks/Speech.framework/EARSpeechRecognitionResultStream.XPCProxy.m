@interface EARSpeechRecognitionResultStream.XPCProxy
- (_TtCC6Speech32EARSpeechRecognitionResultStream8XPCProxy)init;
- (void)speechRecognizerDidFinishRecognitionWithError:(id)a3;
- (void)speechRecognizerDidProcessAudioDuration:(double)a3;
- (void)speechRecognizerDidProduceEndpointFeaturesWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 processedAudioDurationInMilliseconds:(int64_t)a8 acousticEndpointerScore:(double)a9;
- (void)speechRecognizerDidProduceLoggablePackage:(id)a3;
- (void)speechRecognizerDidRecognizeFinalResultCandidatePackage:(id)a3;
- (void)speechRecognizerDidRecognizeFinalResultMultiUserPackages:(id)a3;
- (void)speechRecognizerDidRecognizeFinalResultPackage:(id)a3;
- (void)speechRecognizerDidRecognizePartialResult:(id)a3;
- (void)speechRecognizerDidRecognizeVoiceCommandCandidatePackage:(id)a3;
- (void)speechRecognizerDidReportStatus:(unint64_t)a3;
@end

@implementation EARSpeechRecognitionResultStream.XPCProxy

- (void)speechRecognizerDidFinishRecognitionWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_1B719F84C(a3);
}

- (void)speechRecognizerDidRecognizeFinalResultPackage:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1B719F948(v4);
}

- (void)speechRecognizerDidRecognizeFinalResultMultiUserPackages:(id)a3
{
  sub_1B70C9A4C(0, &qword_1E9E4D200);
  uint64_t v4 = sub_1B7237008();
  id v5 = self;
  sub_1B719F9D0(v4);

  swift_bridgeObjectRelease();
}

- (void)speechRecognizerDidRecognizePartialResult:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1B719FAF8(v4);
}

- (void)speechRecognizerDidRecognizeFinalResultCandidatePackage:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1B719FB80(v4);
}

- (void)speechRecognizerDidRecognizeVoiceCommandCandidatePackage:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1B719FC08(v4);
}

- (void)speechRecognizerDidProduceLoggablePackage:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1B719FC90(v4);
}

- (void)speechRecognizerDidProduceEndpointFeaturesWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 processedAudioDurationInMilliseconds:(int64_t)a8 acousticEndpointerScore:(double)a9
{
  sub_1B70C9A4C(0, (unint64_t *)&qword_1E9E4AB88);
  uint64_t v16 = sub_1B7237428();
  v17 = self;
  sub_1B719FDB4(a3, a4, v16, a8, a5, a7, a9);

  swift_bridgeObjectRelease();
}

- (void)speechRecognizerDidProcessAudioDuration:(double)a3
{
  id v4 = self;
  sub_1B71A0120(a3);
}

- (void)speechRecognizerDidReportStatus:(unint64_t)a3
{
  id v4 = self;
  sub_1B71A0214(a3);
}

- (_TtCC6Speech32EARSpeechRecognitionResultStream8XPCProxy)init
{
}

- (void).cxx_destruct
{
}

@end