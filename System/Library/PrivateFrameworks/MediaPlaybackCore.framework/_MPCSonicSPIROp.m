@interface _MPCSonicSPIROp
- (MPCModelStorePlaybackItemsRequest)request;
- (_MPCSonicSPIROp)initWithRequest:(id)a3 responseHandler:(id)a4;
- (id)responseHandler;
- (void)execute;
@end

@implementation _MPCSonicSPIROp

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (MPCModelStorePlaybackItemsRequest)request
{
  return self->_request;
}

- (void)execute
{
  v9 = [(_MPCSonicSPIROp *)self responseHandler];
  v3 = [(_MPCSonicSPIROp *)self request];
  v4 = [v3 identifiers];
  uint64_t v5 = [v4 totalItemCount];

  if (v5)
  {
    v6 = [MPCModelStorePlaybackItemsResponse alloc];
    v7 = [(_MPCSonicSPIROp *)self request];
    v8 = [(MPCModelStorePlaybackItemsResponse *)v6 initWithRequest:v7 personalizationResponse:0 results:0 performanceMetrics:0];

    [(MPCModelStorePlaybackItemsResponse *)v8 setFinalResponse:1];
    v9[2](v9, v8, 0);
    [(MPAsyncOperation *)self finish];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"SonicSPIROp", 400, @"No identifiers provided");
    v8 = (MPCModelStorePlaybackItemsResponse *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, MPCModelStorePlaybackItemsResponse *))v9)[2](v9, 0, v8);
    [(MPAsyncOperation *)self finishWithError:v8];
  }
}

- (_MPCSonicSPIROp)initWithRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MPAsyncOperation *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    request = v8->_request;
    v8->_request = (MPCModelStorePlaybackItemsRequest *)v9;

    uint64_t v11 = [v7 copy];
    id responseHandler = v8->_responseHandler;
    v8->_id responseHandler = (id)v11;
  }
  return v8;
}

@end