@interface SHMediaTimelineCustomCatalogMatcher
- (NSUUID)timelineRequestID;
- (SHCustomCatalogMatcher)customCatalogMatcher;
- (SHMatcherDelegate)delegate;
- (SHMediaTimeline)contextTimeline;
- (SHMediaTimelineCustomCatalogMatcher)initWithCustomCatalog:(id)a3;
- (void)callDelegateWithSyntheticMatchForResponse:(id)a3;
- (void)dealloc;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)mediaTimeline:(id)a3 hasUpdatedInScopeMediaItems:(id)a4;
- (void)restartTimelineWithMediaItems:(id)a3;
- (void)setContextTimeline:(id)a3;
- (void)setCustomCatalogMatcher:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTimelineRequestID:(id)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
@end

@implementation SHMediaTimelineCustomCatalogMatcher

- (void)dealloc
{
  [(SHMediaTimelineCustomCatalogMatcher *)self stopRecognition];
  v3.receiver = self;
  v3.super_class = (Class)SHMediaTimelineCustomCatalogMatcher;
  [(SHMediaTimelineCustomCatalogMatcher *)&v3 dealloc];
}

- (SHMediaTimelineCustomCatalogMatcher)initWithCustomCatalog:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHMediaTimelineCustomCatalogMatcher;
  v5 = [(SHMediaTimelineCustomCatalogMatcher *)&v9 init];
  if (v5)
  {
    v6 = [[SHCustomCatalogMatcher alloc] initWithCustomCatalog:v4];
    customCatalogMatcher = v5->_customCatalogMatcher;
    v5->_customCatalogMatcher = v6;

    [(SHCustomCatalogMatcher *)v5->_customCatalogMatcher setDelegate:v5];
  }

  return v5;
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 requestID];
  [(SHMediaTimelineCustomCatalogMatcher *)self setTimelineRequestID:v5];

  id v6 = [(SHMediaTimelineCustomCatalogMatcher *)self customCatalogMatcher];
  [v6 startRecognitionForRequest:v4];
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  v5 = [(SHMediaTimelineCustomCatalogMatcher *)self timelineRequestID];
  int v6 = [v5 isEqual:v4];

  if (v6)
  {
    [(SHMediaTimelineCustomCatalogMatcher *)self stopRecognition];
  }
}

- (void)stopRecognition
{
  objc_super v3 = [(SHMediaTimelineCustomCatalogMatcher *)self contextTimeline];
  [v3 stopGenerating];

  [(SHMediaTimelineCustomCatalogMatcher *)self setContextTimeline:0];

  [(SHMediaTimelineCustomCatalogMatcher *)self setTimelineRequestID:0];
}

- (void)mediaTimeline:(id)a3 hasUpdatedInScopeMediaItems:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [SHMatch alloc];
  objc_super v9 = [v7 querySignature];

  v12 = [(SHMatch *)v8 initWithMediaItems:v6 forSignature:v9];
  v10 = [[SHMatcherResponse alloc] initWithRecordingIntermission:v12 recordingSignatureOffset:0 retrySeconds:0 match:0 signature:0.0 runningAssociatedRequestID:0.0 error:0.0];
  v11 = [(SHMediaTimelineCustomCatalogMatcher *)self delegate];
  [v11 matcher:self didProduceResponse:v10];
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v17 = a4;
  uint64_t v5 = [v17 result];
  switch(v5)
  {
    case 1:
      v8 = [v17 match];
      [(SHMediaTimelineCustomCatalogMatcher *)self restartTimelineWithMediaItems:v8];

      goto LABEL_6;
    case 2:
      uint64_t v9 = [(SHMediaTimelineCustomCatalogMatcher *)self contextTimeline];
      if (!v9)
      {
LABEL_11:
        v15 = [(SHMediaTimelineCustomCatalogMatcher *)self contextTimeline];
        [v15 stopGenerating];

        [(SHMediaTimelineCustomCatalogMatcher *)self setContextTimeline:0];
        v16 = [(SHMediaTimelineCustomCatalogMatcher *)self delegate];
        [v16 matcher:self didProduceResponse:v17];

        break;
      }
      v10 = (void *)v9;
      v11 = [(SHMediaTimelineCustomCatalogMatcher *)self contextTimeline];
      if ([v11 isFinished])
      {

        goto LABEL_11;
      }
      v12 = [v17 signature];
      [v12 duration];
      double v14 = v13;

      if (v14 >= 12.0) {
        goto LABEL_11;
      }
LABEL_6:
      [(SHMediaTimelineCustomCatalogMatcher *)self callDelegateWithSyntheticMatchForResponse:v17];
      break;
    case 3:
      id v6 = [(SHMediaTimelineCustomCatalogMatcher *)self delegate];
      [v6 matcher:self didProduceResponse:v17];

      id v7 = [(SHMediaTimelineCustomCatalogMatcher *)self contextTimeline];
      [v7 stopGenerating];

      break;
  }

  MEMORY[0x270F9A758]();
}

- (void)callDelegateWithSyntheticMatchForResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SHMediaTimelineCustomCatalogMatcher *)self contextTimeline];
  id v20 = [v5 inScopeMediaItems];

  id v6 = [SHMatch alloc];
  id v7 = [v4 signature];
  v8 = [(SHMatch *)v6 initWithMediaItems:v20 forSignature:v7];

  uint64_t v9 = [SHMatcherResponse alloc];
  [v4 recordingIntermission];
  double v11 = v10;
  [v4 recordingSignatureOffset];
  double v13 = v12;
  [v4 retrySeconds];
  double v15 = v14;
  v16 = [v4 runningAssociatedRequestID];
  id v17 = [v4 error];

  v18 = [(SHMatcherResponse *)v9 initWithRecordingIntermission:v8 recordingSignatureOffset:0 retrySeconds:v16 match:v17 signature:v11 runningAssociatedRequestID:v13 error:v15];
  v19 = [(SHMediaTimelineCustomCatalogMatcher *)self delegate];
  [v19 matcher:self didProduceResponse:v18];
}

- (void)restartTimelineWithMediaItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SHMediaTimelineCustomCatalogMatcher *)self contextTimeline];
  [v5 stopGenerating];

  id v6 = [[SHMediaTimeline alloc] initWithMatch:v4];
  [(SHMediaTimelineCustomCatalogMatcher *)self setContextTimeline:v6];

  id v7 = [(SHMediaTimelineCustomCatalogMatcher *)self contextTimeline];
  [v7 setDelegate:self];

  id v8 = [(SHMediaTimelineCustomCatalogMatcher *)self contextTimeline];
  [v8 startGenerating];
}

- (SHMatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHMatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHMediaTimeline)contextTimeline
{
  return self->_contextTimeline;
}

- (void)setContextTimeline:(id)a3
{
}

- (SHCustomCatalogMatcher)customCatalogMatcher
{
  return self->_customCatalogMatcher;
}

- (void)setCustomCatalogMatcher:(id)a3
{
}

- (NSUUID)timelineRequestID
{
  return self->_timelineRequestID;
}

- (void)setTimelineRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineRequestID, 0);
  objc_storeStrong((id *)&self->_customCatalogMatcher, 0);
  objc_storeStrong((id *)&self->_contextTimeline, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end