@interface SHManagedSessionCustomCatalogMatcher
- (NSUUID)currentRequestID;
- (SHManagedSessionCustomCatalogMatcher)initWithCustomCatalog:(id)a3;
- (SHMatcher)customCatalogMatcher;
- (SHMatcherDelegate)delegate;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
@end

@implementation SHManagedSessionCustomCatalogMatcher

- (SHManagedSessionCustomCatalogMatcher)initWithCustomCatalog:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHManagedSessionCustomCatalogMatcher;
  v5 = [(SHManagedSessionCustomCatalogMatcher *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 _createMatcher];
    customCatalogMatcher = v5->_customCatalogMatcher;
    v5->_customCatalogMatcher = (SHMatcher *)v6;

    [(SHMatcher *)v5->_customCatalogMatcher setDelegate:v5];
  }

  return v5;
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 requestID];
  currentRequestID = self->_currentRequestID;
  self->_currentRequestID = v5;

  id v7 = [(SHManagedSessionCustomCatalogMatcher *)self customCatalogMatcher];
  [v7 startRecognitionForRequest:v4];
}

- (void)stopRecognition
{
  id v2 = [(SHManagedSessionCustomCatalogMatcher *)self customCatalogMatcher];
  [v2 stopRecognition];
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  id v5 = [(SHManagedSessionCustomCatalogMatcher *)self customCatalogMatcher];
  [v5 stopRecognitionForRequestID:v4];
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [SHMatcherResponse alloc];
  [v6 recordingIntermission];
  double v10 = v9;
  [v6 recordingSignatureOffset];
  double v12 = v11;
  [v6 retrySeconds];
  double v14 = v13;
  v15 = [v6 match];
  v16 = [v6 signature];
  v17 = [(SHManagedSessionCustomCatalogMatcher *)self currentRequestID];
  v18 = [v6 error];

  v20 = [(SHMatcherResponse *)v8 initWithRecordingIntermission:v15 recordingSignatureOffset:v16 retrySeconds:v17 match:v18 signature:v10 runningAssociatedRequestID:v12 error:v14];
  v19 = [(SHManagedSessionCustomCatalogMatcher *)self delegate];
  [v19 matcher:v7 didProduceResponse:v20];
}

- (SHMatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHMatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHMatcher)customCatalogMatcher
{
  return self->_customCatalogMatcher;
}

- (NSUUID)currentRequestID
{
  return self->_currentRequestID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequestID, 0);
  objc_storeStrong((id *)&self->_customCatalogMatcher, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end