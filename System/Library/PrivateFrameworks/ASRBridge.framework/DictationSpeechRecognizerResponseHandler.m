@interface DictationSpeechRecognizerResponseHandler
- (void)localSpeechRecognizerClient:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 requestId:(id)a5 endpointMode:(int64_t)a6 error:(id)a7;
- (void)localSpeechRecognizerClient:(id)a3 receivedEagerRecognitionCandidateWithRequestId:(id)a4 rcId:(unint64_t)a5 speechPackage:(id)a6 duration:(double)a7;
- (void)localSpeechRecognizerClient:(id)a3 receivedEagerRecognitionCandidateWithRequestId:(id)a4 rcId:(unint64_t)a5 speechPackage:(id)a6 duration:(double)a7 metadata:(id)a8;
- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultCandidateWithRequestId:(id)a4 speechPackage:(id)a5;
- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5;
- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5 metadata:(id)a6;
- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 speechPackage:(id)a6 metadata:(id)a7;
- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6;
- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6 metadata:(id)a7;
- (void)localSpeechRecognizerClient:(id)a3 receivedVoiceCommandCandidateWithRequestId:(id)a4 speechPackage:(id)a5 metadata:(id)a6;
@end

@implementation DictationSpeechRecognizerResponseHandler

- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6
{
  uint64_t v8 = sub_247205FD8();
  unint64_t v10 = v9;
  sub_2471EB2F4();
  uint64_t v11 = sub_2472060E8();
  id v12 = a3;
  v13 = self;
  sub_2471EB5C8(v8, v10, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 speechPackage:(id)a6 metadata:(id)a7
{
  uint64_t v11 = sub_247205FD8();
  unint64_t v13 = v12;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  v17 = self;
  sub_2471EB8B4(v11, v13, v15, v16);

  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedPartialResultWithRequestId:(id)a4 language:(id)a5 tokens:(id)a6 metadata:(id)a7
{
  unint64_t v10 = sub_247205FD8();
  unint64_t v12 = v11;
  sub_2471EB2F4();
  uint64_t v13 = sub_2472060E8();
  id v14 = a3;
  id v15 = a7;
  id v16 = self;
  sub_2471EBC24(v10, v12, v13, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultCandidateWithRequestId:(id)a4 speechPackage:(id)a5
{
}

- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5
{
}

- (void)localSpeechRecognizerClient:(id)a3 receivedFinalResultWithRequestId:(id)a4 speechPackage:(id)a5 metadata:(id)a6
{
}

- (void)localSpeechRecognizerClient:(id)a3 receivedEagerRecognitionCandidateWithRequestId:(id)a4 rcId:(unint64_t)a5 speechPackage:(id)a6 duration:(double)a7
{
  uint64_t v10 = sub_247205FD8();
  unint64_t v12 = v11;
  id v13 = a3;
  id v14 = a6;
  id v15 = self;
  sub_2471EBF18(v10, v12, v14, MEMORY[0x263F70D88]);

  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedEagerRecognitionCandidateWithRequestId:(id)a4 rcId:(unint64_t)a5 speechPackage:(id)a6 duration:(double)a7 metadata:(id)a8
{
  uint64_t v12 = sub_247205FD8();
  unint64_t v14 = v13;
  id v15 = a3;
  id v16 = a6;
  id v17 = a8;
  v18 = self;
  sub_2471EC148(v12, v14, v16, v17, MEMORY[0x263F70D88], 0);

  swift_bridgeObjectRelease();
}

- (void)localSpeechRecognizerClient:(id)a3 receivedVoiceCommandCandidateWithRequestId:(id)a4 speechPackage:(id)a5 metadata:(id)a6
{
}

- (void)localSpeechRecognizerClient:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 requestId:(id)a5 endpointMode:(int64_t)a6 error:(id)a7
{
  id v8 = a5;
  if (a4)
  {
    uint64_t v11 = sub_247205F68();
    if (v8)
    {
LABEL_3:
      uint64_t v12 = sub_247205FD8();
      id v8 = v13;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
LABEL_6:
  id v14 = a3;
  id v15 = self;
  id v16 = a7;
  sub_2471EC38C(v11, v12, (uint64_t)v8, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9ASRBridge40DictationSpeechRecognizerResponseHandler_dictationOptions));
}

@end