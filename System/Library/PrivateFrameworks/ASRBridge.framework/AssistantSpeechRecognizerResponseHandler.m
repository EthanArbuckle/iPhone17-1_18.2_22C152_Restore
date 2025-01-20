@interface AssistantSpeechRecognizerResponseHandler
- (void)localSpeechRecognizerClient:(id)a3 didAcceptedEagerResultWithRequestId:(id)a4 rcId:(unint64_t)a5 mitigationSignal:(BOOL)a6 featuresToLog:(id)a7;
- (void)localSpeechRecognizerClient:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 requestId:(id)a5 endpointMode:(int64_t)a6 error:(id)a7;
- (void)localSpeechRecognizerClient:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 requestId:(id)a5 error:(id)a6;
- (void)localSpeechRecognizerClient:(id)a3 receivedContinuityEndDetected:(id)a4;
- (void)localSpeechRecognizerClient:(id)a3 receivedEagerRecognitionCandidateWithRequestId:(id)a4 rcId:(unint64_t)a5 speechPackage:(id)a6 duration:(double)a7;
- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5;
- (void)localSpeechRecognizerClient:(id)a3 receivedMultiUserTRPCandidatePackage:(id)a4;
- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6;
- (void)localSpeechRecognizerClient:(id)a3 receivedTRPCandidatePackage:(id)a4;
- (void)localSpeechRecognizerClient:(id)a3 receivedTRPDetected:(id)a4;
- (void)localSpeechRecognizerClient:(id)a3 receivedVoiceIdScoreCard:(id)a4;
- (void)localSpeechRecognizerClient:(id)a3 requestAttentionAssetDownload:(BOOL)a4;
@end

@implementation AssistantSpeechRecognizerResponseHandler

- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6
{
  uint64_t v8 = sub_247205FD8();
  uint64_t v10 = v9;
  uint64_t v11 = sub_247205FD8();
  uint64_t v13 = v12;
  sub_2471CAE98(0, (unint64_t *)&qword_26B128638);
  uint64_t v14 = sub_2472060E8();
  id v15 = a3;
  v16 = self;
  sub_2471C2884(v8, v10, v11, v13, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5
{
  uint64_t v8 = sub_247205FD8();
  unint64_t v10 = v9;
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = self;
  sub_2471C2B58(v8, v10);

  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedTRPDetected:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_2471C2E10(v7);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedMultiUserTRPCandidatePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_2471C3494(v7);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedTRPCandidatePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_2471C4D34(v7);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedContinuityEndDetected:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_2471C5EF4(v7);
}

- (void)localSpeechRecognizerClient:(id)a3 requestAttentionAssetDownload:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_2471C66BC(a4);
}

- (void)localSpeechRecognizerClient:(id)a3 receivedEagerRecognitionCandidateWithRequestId:(id)a4 rcId:(unint64_t)a5 speechPackage:(id)a6 duration:(double)a7
{
  uint64_t v12 = sub_247205FD8();
  unint64_t v14 = v13;
  id v15 = a3;
  id v16 = a6;
  v17 = self;
  sub_2471C6BC8(v12, v14, a5, (uint64_t)v16, a7);

  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 didAcceptedEagerResultWithRequestId:(id)a4 rcId:(unint64_t)a5 mitigationSignal:(BOOL)a6 featuresToLog:(id)a7
{
  BOOL v7 = a6;
  uint64_t v11 = sub_247205FD8();
  unint64_t v13 = v12;
  id v14 = a3;
  id v15 = self;
  sub_2471C7308(v11, v13, a5, v7);

  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedVoiceIdScoreCard:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_2471C7E04(v7);
}

- (void)localSpeechRecognizerClient:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 requestId:(id)a5 error:(id)a6
{
  id v7 = a5;
  if (a4)
  {
    sub_247205F68();
    if (v7)
    {
LABEL_3:
      uint64_t v10 = sub_247205FD8();
      id v7 = v11;
      goto LABEL_6;
    }
  }
  else if (a5)
  {
    goto LABEL_3;
  }
  uint64_t v10 = 0;
LABEL_6:
  unint64_t v12 = (char *)a3;
  unint64_t v13 = self;
  id v14 = a6;
  sub_2471C9B78(v12, v10, v7, 0, 1, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 requestId:(id)a5 endpointMode:(int64_t)a6 error:(id)a7
{
  id v9 = a5;
  if (a4)
  {
    sub_247205F68();
    if (v9)
    {
LABEL_3:
      uint64_t v12 = sub_247205FD8();
      id v9 = v13;
      goto LABEL_6;
    }
  }
  else if (a5)
  {
    goto LABEL_3;
  }
  uint64_t v12 = 0;
LABEL_6:
  id v14 = (char *)a3;
  id v15 = self;
  id v16 = a7;
  sub_2471C9B78(v14, v12, v9, (void *)a6, 0, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_myriadMonitor);
  v3 = (char *)self + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  uint64_t v4 = sub_247205B68();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_requestQueue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_sessionState);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_immutableSessionState);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end