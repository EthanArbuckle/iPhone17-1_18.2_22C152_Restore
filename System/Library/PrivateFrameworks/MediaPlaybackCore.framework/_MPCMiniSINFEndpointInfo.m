@interface _MPCMiniSINFEndpointInfo
- (ICStoreRequestContext)requestContext;
- (NSURL)endpointURL;
- (_MPCMiniSINFEndpointInfo)initWithEndpointURL:(id)a3 maximumBatchSize:(int64_t)a4 requestContext:(id)a5;
- (int64_t)maximumBatchSize;
@end

@implementation _MPCMiniSINFEndpointInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);

  objc_storeStrong((id *)&self->_endpointURL, 0);
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (int64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (_MPCMiniSINFEndpointInfo)initWithEndpointURL:(id)a3 maximumBatchSize:(int64_t)a4 requestContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_MPCMiniSINFEndpointInfo;
  v10 = [(_MPCMiniSINFEndpointInfo *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    endpointURL = v10->_endpointURL;
    v10->_endpointURL = (NSURL *)v11;

    v10->_maximumBatchSize = a4;
    objc_storeStrong((id *)&v10->_requestContext, a5);
  }

  return v10;
}

@end