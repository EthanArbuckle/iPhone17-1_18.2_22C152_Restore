@interface ECWebContentObserver
- (ECWebContentObserver)initWithParser:(id)a3;
- (EDWebContentParser)parser;
- (void)baseURL:(id)a3 didRequestRemoteContentURLs:(id)a4;
- (void)logWebBundleMessage:(id)a3;
- (void)receiveDataDetectionResults:(id)a3;
- (void)requestDataDetectionResultsWithBaseURL:(id)a3;
- (void)setParser:(id)a3;
@end

@implementation ECWebContentObserver

- (ECWebContentObserver)initWithParser:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ECWebContentObserver;
  v5 = [(ECWebContentObserver *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_parser, v4);
  }

  return v6;
}

- (void)baseURL:(id)a3 didRequestRemoteContentURLs:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(ECWebContentObserver *)self parser];
  [v7 baseURL:v8 didRequestRemoteContentURLs:v6];
}

- (void)requestDataDetectionResultsWithBaseURL:(id)a3
{
  id v5 = a3;
  id v4 = [(ECWebContentObserver *)self parser];
  [v4 requestDataDetectionResultsWithBaseURL:v5];
}

- (void)receiveDataDetectionResults:(id)a3
{
  id v5 = a3;
  id v4 = [(ECWebContentObserver *)self parser];
  [v4 receiveDataDetectionResults:v5];
}

- (void)logWebBundleMessage:(id)a3
{
  id v5 = a3;
  id v4 = [(ECWebContentObserver *)self parser];
  [v4 logWebBundleMessage:v5];
}

- (EDWebContentParser)parser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parser);

  return (EDWebContentParser *)WeakRetained;
}

- (void)setParser:(id)a3
{
}

- (void).cxx_destruct
{
}

@end