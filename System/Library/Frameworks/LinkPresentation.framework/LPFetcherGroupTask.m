@interface LPFetcherGroupTask
- (BOOL)hasStarted;
- (LPFetcher)fetcher;
- (LPFetcherResponse)response;
- (void)setFetcher:(id)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setResponse:(id)a3;
@end

@implementation LPFetcherGroupTask

- (LPFetcher)fetcher
{
  return self->_fetcher;
}

- (void)setFetcher:(id)a3
{
}

- (LPFetcherResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_fetcher, 0);
}

@end