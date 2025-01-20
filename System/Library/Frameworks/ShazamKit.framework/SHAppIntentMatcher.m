@interface SHAppIntentMatcher
- (SHAppIntentMatcher)initWithRunnerMatcher:(id)a3;
- (SHMatcher)childMatcher;
- (SHMatcher)matcher;
- (SHMatcherDelegate)delegate;
- (SHMatcherRequest)matcherRequest;
- (void)_stop;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)setChildMatcher:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMatcherRequest:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
@end

@implementation SHAppIntentMatcher

- (SHAppIntentMatcher)initWithRunnerMatcher:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHAppIntentMatcher;
  v6 = [(SHAppIntentMatcher *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_matcher, a3);
  }

  return v7;
}

- (void)startRecognitionForRequest:(id)a3
{
  [(SHAppIntentMatcher *)self setMatcherRequest:a3];
  v4 = [(SHAppIntentMatcher *)self matcher];
  [v4 setDelegate:self];

  id v6 = [(SHAppIntentMatcher *)self matcher];
  id v5 = [(SHAppIntentMatcher *)self matcherRequest];
  [v6 startRecognitionForRequest:v5];
}

- (void)stopRecognition
{
  id v4 = [(SHAppIntentMatcher *)self matcherRequest];
  v3 = [v4 requestID];
  [(SHAppIntentMatcher *)self stopRecognitionForRequestID:v3];
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = [(SHAppIntentMatcher *)self matcherRequest];
  id v6 = [v5 requestID];
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    id v11 = +[SHError privateErrorWithCode:203 underlyingError:0];
    v8 = objc_opt_new();
    objc_super v9 = +[SHMatcherResponse errorResponseForSignature:v8 error:v11];

    v10 = [(SHAppIntentMatcher *)self delegate];
    [v10 matcher:self didProduceResponse:v9];

    [(SHAppIntentMatcher *)self _stop];
  }
}

- (void)_stop
{
  [(SHAppIntentMatcher *)self setMatcherRequest:0];
  [(SHAppIntentMatcher *)self setDelegate:0];
  v3 = [(SHAppIntentMatcher *)self matcher];
  [v3 setDelegate:0];

  [(SHAppIntentMatcher *)self setChildMatcher:0];
  id v4 = [(SHAppIntentMatcher *)self matcher];
  [v4 stopRecognition];
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v5 = a4;
  id v6 = [(SHAppIntentMatcher *)self delegate];
  [v6 matcher:self didProduceResponse:v5];
}

- (SHMatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHMatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHMatcher)childMatcher
{
  return self->_childMatcher;
}

- (void)setChildMatcher:(id)a3
{
}

- (SHMatcher)matcher
{
  return self->_matcher;
}

- (SHMatcherRequest)matcherRequest
{
  return self->_matcherRequest;
}

- (void)setMatcherRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherRequest, 0);
  objc_storeStrong((id *)&self->_matcher, 0);
  objc_storeStrong((id *)&self->_childMatcher, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end