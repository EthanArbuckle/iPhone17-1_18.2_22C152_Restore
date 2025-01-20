@interface EDWebContentParserState
- (EFPromise)dataDetectionPromise;
- (EFPromise)remoteContentPromise;
- (EFPromise)richLinkPromise;
- (NSURL)baseURL;
- (void)setBaseURL:(id)a3;
- (void)setDataDetectionPromise:(id)a3;
- (void)setRemoteContentPromise:(id)a3;
- (void)setRichLinkPromise:(id)a3;
@end

@implementation EDWebContentParserState

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (EFPromise)dataDetectionPromise
{
  return self->_dataDetectionPromise;
}

- (void)setDataDetectionPromise:(id)a3
{
}

- (EFPromise)remoteContentPromise
{
  return self->_remoteContentPromise;
}

- (void)setRemoteContentPromise:(id)a3
{
}

- (EFPromise)richLinkPromise
{
  return self->_richLinkPromise;
}

- (void)setRichLinkPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richLinkPromise, 0);
  objc_storeStrong((id *)&self->_remoteContentPromise, 0);
  objc_storeStrong((id *)&self->_dataDetectionPromise, 0);

  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end