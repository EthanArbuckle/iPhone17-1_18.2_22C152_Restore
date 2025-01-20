@interface HDCPSSearchOperation
- (HDCPSSearchOperation)initWithRequest:(id)a3 session:(id)a4;
- (HKClinicalProviderSearchResultsPage)page;
- (NSError)error;
- (NSURLRequest)request;
- (NSURLSession)session;
- (void)main;
- (void)setError:(id)a3;
- (void)setPage:(id)a3;
@end

@implementation HDCPSSearchOperation

- (HDCPSSearchOperation)initWithRequest:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDCPSSearchOperation;
  v8 = [(HDCPSSearchOperation *)&v12 init];
  if (v8)
  {
    v9 = (NSURLRequest *)[v6 copy];
    request = v8->_request;
    v8->_request = v9;

    objc_storeStrong((id *)&v8->_session, a4);
  }

  return v8;
}

- (void)main
{
  if (([(HDCPSSearchOperation *)self isCancelled] & 1) == 0)
  {
    v3 = [HDCPSFetchJSONTask alloc];
    v4 = [(HDCPSSearchOperation *)self session];
    v5 = [(HDCPSSearchOperation *)self request];
    id v6 = [(HDCPSFetchJSONTask *)v3 initWithSession:v4 request:v5];

    [(HDCPSFetchJSONTask *)v6 resume];
    [(HDCPSFetchJSONTask *)v6 waitUntilFinished];
    id v7 = [(HDCPSFetchJSONTask *)v6 JSONObject];

    if (v7)
    {
      v8 = [(HDCPSFetchJSONTask *)v6 JSONObject];
      id v12 = 0;
      v9 = +[HDProviderServiceSpecification searchResultsPageFromFetchedJSONObject:v8 error:&v12];
      id v10 = v12;
      [(HDCPSSearchOperation *)self setPage:v9];

      [(HDCPSSearchOperation *)self setError:v10];
    }
    else
    {
      v11 = [(HDCPSFetchJSONTask *)v6 error];
      [(HDCPSSearchOperation *)self setError:v11];
    }
  }
}

- (HKClinicalProviderSearchResultsPage)page
{
  if (([(HDCPSSearchOperation *)self isFinished] & 1) == 0)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"HDCPSSearchOperation.m" lineNumber:63 description:@"Operation must be finished to access results"];
  }
  page = self->_page;

  return page;
}

- (NSError)error
{
  if (([(HDCPSSearchOperation *)self isFinished] & 1) == 0)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"HDCPSSearchOperation.m" lineNumber:68 description:@"Operation must be finished to access results"];
  }
  error = self->_error;

  return error;
}

- (void)setPage:(id)a3
{
}

- (void)setError:(id)a3
{
}

- (NSURLRequest)request
{
  return self->_request;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_page, 0);
}

@end