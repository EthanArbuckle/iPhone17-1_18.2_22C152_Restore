@interface EARCSpeechRecognitionResultStreamGlue
- (EARCSpeechRecognitionResultStreamGlue)initWithStream:(EARCSpeechRecognitionResultStream *)a3;
- (void)dealloc;
- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4;
- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4 tokenSausage:(id)a5 nBestChoices:(id)a6;
- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4;
@end

@implementation EARCSpeechRecognitionResultStreamGlue

- (EARCSpeechRecognitionResultStreamGlue)initWithStream:(EARCSpeechRecognitionResultStream *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EARCSpeechRecognitionResultStreamGlue;
  result = [(EARCSpeechRecognitionResultStreamGlue *)&v7 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->ctx;
    long long v6 = *(_OWORD *)&a3->DidRecognizePartialResultTokens;
    *(_OWORD *)&result->_stream.DidRecognizeFinalResults = *(_OWORD *)&a3->DidRecognizeFinalResults;
    *(_OWORD *)&result->_stream.DidRecognizePartialResultTokens = v6;
    *(_OWORD *)&result->_stream.ctx = v5;
  }
  return result;
}

- (void)dealloc
{
  DisposeContext = (void (*)(void *, SEL))self->_stream.DisposeContext;
  if (DisposeContext) {
    DisposeContext(self->_stream.ctx, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)EARCSpeechRecognitionResultStreamGlue;
  [(EARCSpeechRecognitionResultStreamGlue *)&v4 dealloc];
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  if (self->_stream.DidRecognizePartialResultTokens)
  {
    ctx = self->_stream.ctx;
    DidRecognizePartialResultTokens = (void (*)(void *, uint64_t))self->_stream.DidRecognizePartialResultTokens;
    uint64_t v5 = objc_msgSend(a4, "tokens", a3);
    DidRecognizePartialResultTokens(ctx, v5);
  }
}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  DidFinishRecognitionWithError = (void (*)(void *, id))self->_stream.DidFinishRecognitionWithError;
  if (DidFinishRecognitionWithError) {
    DidFinishRecognitionWithError(self->_stream.ctx, a4);
  }
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4 tokenSausage:(id)a5 nBestChoices:(id)a6
{
  DidRecognizeFinalResults = (void (*)(void *, id, id, id))self->_stream.DidRecognizeFinalResults;
  if (DidRecognizeFinalResults) {
    DidRecognizeFinalResults(self->_stream.ctx, a5, a6, a4);
  }
}

- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  DidProcessAudioDuration = (void (*)(void *, double))self->_stream.DidProcessAudioDuration;
  if (DidProcessAudioDuration) {
    DidProcessAudioDuration(self->_stream.ctx, a4);
  }
}

@end