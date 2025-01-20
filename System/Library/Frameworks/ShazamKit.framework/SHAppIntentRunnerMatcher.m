@interface SHAppIntentRunnerMatcher
- (SHAppIntentRunnerMatcher)initWithSource:(int64_t)a3;
- (SHMatcherDelegate)delegate;
- (SHMatcherRequest)matcherRequest;
- (WFLinkActionWorkflowRunnerClient)workflowRunnerClient;
- (int64_t)source;
- (void)_stop;
- (void)setDelegate:(id)a3;
- (void)setMatcherRequest:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setWorkflowRunnerClient:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation SHAppIntentRunnerMatcher

- (SHAppIntentRunnerMatcher)initWithSource:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SHAppIntentRunnerMatcher;
  result = [(SHAppIntentRunnerMatcher *)&v5 init];
  if (result) {
    result->_source = a3;
  }
  return result;
}

- (void)startRecognitionForRequest:(id)a3
{
  [(SHAppIntentRunnerMatcher *)self setMatcherRequest:a3];
  id v4 = [objc_alloc((Class)LNMetadataProvider) initWithOptions:2];
  id v5 = [objc_alloc((Class)LNFullyQualifiedActionIdentifier) initWithActionIdentifier:@"RecognizeMusicIntent" bundleIdentifier:@"com.apple.musicrecognition"];
  id v28 = v5;
  v6 = +[NSArray arrayWithObjects:&v28 count:1];
  id v26 = 0;
  v7 = [v4 actionsWithFullyQualifiedIdentifiers:v6 error:&v26];
  id v8 = v26;

  v9 = [v7 valueForKey:@"com.apple.musicrecognition"];
  v10 = [v9 allValues];
  v11 = [v10 firstObject];

  id v12 = objc_alloc((Class)LNValue);
  v13 = +[LNPrimitiveValueType BOOLValueType];
  id v14 = [v12 initWithValue:&__kCFBooleanTrue valueType:v13];

  id v15 = [objc_alloc((Class)LNParameter) initWithIdentifier:@"addToLibrary" value:v14];
  if (v11)
  {
    v16 = +[LNConnectionPolicy policyWithActionMetadata:v11];
    id v27 = v15;
    v17 = +[NSArray arrayWithObjects:&v27 count:1];
    v18 = [v16 actionWithParameters:v17];

    if ([(SHAppIntentRunnerMatcher *)self source]) {
      uint64_t v19 = 7;
    }
    else {
      uint64_t v19 = 6;
    }
    id v20 = [objc_alloc((Class)WFLinkActionWorkflowRunnerClient) initWithLinkAction:v18 bundleIdentifier:@"com.apple.musicrecognition" runSource:v19];
    [(SHAppIntentRunnerMatcher *)self setWorkflowRunnerClient:v20];

    v21 = [(SHAppIntentRunnerMatcher *)self workflowRunnerClient];
    [v21 setDelegate:self];

    v22 = [(SHAppIntentRunnerMatcher *)self workflowRunnerClient];
    [v22 start];
  }
  else
  {
    v23 = sh_log_object();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to fetch metadata for Recognize Music App Intent", v25, 2u);
    }

    v16 = +[SHError errorWithCode:202 underlyingError:v8];
    v24 = objc_opt_new();
    v18 = +[SHMatcherResponse errorResponseForSignature:v24 error:v16];

    v22 = [(SHAppIntentRunnerMatcher *)self delegate];
    [v22 matcher:self didProduceResponse:v18];
  }
}

- (void)stopRecognition
{
  id v4 = [(SHAppIntentRunnerMatcher *)self matcherRequest];
  v3 = [v4 requestID];
  [(SHAppIntentRunnerMatcher *)self stopRecognitionForRequestID:v3];
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = [(SHAppIntentRunnerMatcher *)self matcherRequest];
  v6 = [v5 requestID];
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    id v8 = [(SHAppIntentRunnerMatcher *)self workflowRunnerClient];
    [v8 stop];

    id v12 = +[SHError privateErrorWithCode:203 underlyingError:0];
    v9 = objc_opt_new();
    v10 = +[SHMatcherResponse errorResponseForSignature:v9 error:v12];

    v11 = [(SHAppIntentRunnerMatcher *)self delegate];
    [v11 matcher:self didProduceResponse:v10];

    [(SHAppIntentRunnerMatcher *)self _stop];
  }
}

- (void)_stop
{
  [(SHAppIntentRunnerMatcher *)self setMatcherRequest:0];

  [(SHAppIntentRunnerMatcher *)self setDelegate:0];
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = sh_log_object();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138413058;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 1024;
    BOOL v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "workflowRunnerClient:%@ didFinishRunningWorkflowWithOutput:%@ error:%@ cancelled:%i", (uint8_t *)&v17, 0x26u);
  }

  if (v12)
  {
    id v14 = objc_opt_new();
    id v15 = +[SHMatcherResponse errorResponseForSignature:v14 error:v12];

    v16 = [(SHAppIntentRunnerMatcher *)self delegate];
    [v16 matcher:self didProduceResponse:v15];

    [(SHAppIntentRunnerMatcher *)self _stop];
  }
}

- (SHMatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (SHMatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFLinkActionWorkflowRunnerClient)workflowRunnerClient
{
  return self->_workflowRunnerClient;
}

- (void)setWorkflowRunnerClient:(id)a3
{
}

- (SHMatcherRequest)matcherRequest
{
  return self->_matcherRequest;
}

- (void)setMatcherRequest:(id)a3
{
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherRequest, 0);
  objc_storeStrong((id *)&self->_workflowRunnerClient, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end