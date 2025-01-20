@interface SpeechRecognizerResponseHandler
- (_TtC9ASRBridge31SpeechRecognizerResponseHandler)init;
- (void)localSpeechRecognizerClient:(id)a3 didAcceptedEagerResultWithRequestId:(id)a4 rcId:(unint64_t)a5 mitigationSignal:(BOOL)a6 featuresToLog:(id)a7;
- (void)localSpeechRecognizerClient:(id)a3 receivedContinuityEndDetected:(id)a4;
- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultCandidateWithRequestId:(id)a4 speechPackage:(id)a5;
- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5;
- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5 metadata:(id)a6;
- (void)localSpeechRecognizerClient:(id)a3 receivedMultiUserTRPCandidatePackage:(id)a4;
- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 speechPackage:(id)a6 metadata:(id)a7;
- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6;
- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6 metadata:(id)a7;
- (void)localSpeechRecognizerClient:(id)a3 receivedTRPCandidatePackage:(id)a4;
- (void)localSpeechRecognizerClient:(id)a3 receivedTRPDetected:(id)a4;
- (void)localSpeechRecognizerClient:(id)a3 receivedVoiceCommandCandidateWithRequestId:(id)a4 speechPackage:(id)a5 metadata:(id)a6;
- (void)localSpeechRecognizerClient:(id)a3 receivedVoiceIdScoreCard:(id)a4;
- (void)localSpeechRecognizerClient:(id)a3 requestAttentionAssetDownload:(BOOL)a4;
@end

@implementation SpeechRecognizerResponseHandler

- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6
{
}

- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5
{
}

- (void)localSpeechRecognizerClient:(id)a3 didAcceptedEagerResultWithRequestId:(id)a4 rcId:(unint64_t)a5 mitigationSignal:(BOOL)a6 featuresToLog:(id)a7
{
}

- (void)localSpeechRecognizerClient:(id)a3 receivedVoiceIdScoreCard:(id)a4
{
}

- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6 metadata:(id)a7
{
}

- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 speechPackage:(id)a6 metadata:(id)a7
{
}

- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5 metadata:(id)a6
{
}

- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultCandidateWithRequestId:(id)a4 speechPackage:(id)a5
{
}

- (void)localSpeechRecognizerClient:(id)a3 receivedVoiceCommandCandidateWithRequestId:(id)a4 speechPackage:(id)a5 metadata:(id)a6
{
}

- (void)localSpeechRecognizerClient:(id)a3 receivedContinuityEndDetected:(id)a4
{
}

- (void)localSpeechRecognizerClient:(id)a3 receivedTRPDetected:(id)a4
{
}

- (void)localSpeechRecognizerClient:(id)a3 receivedTRPCandidatePackage:(id)a4
{
}

- (void)localSpeechRecognizerClient:(id)a3 requestAttentionAssetDownload:(BOOL)a4
{
}

- (void)localSpeechRecognizerClient:(id)a3 receivedMultiUserTRPCandidatePackage:(id)a4
{
}

- (_TtC9ASRBridge31SpeechRecognizerResponseHandler)init
{
  result = (_TtC9ASRBridge31SpeechRecognizerResponseHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  uint64_t v4 = sub_247204938();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end