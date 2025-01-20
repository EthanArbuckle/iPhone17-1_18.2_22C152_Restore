@interface _MPModelShimRequestMiddlewareOperation
- (MPModelRequest)modelRequest;
- (NSArray)invalidationObservers;
- (_MPModelShimRequestMiddleware)middleware;
- (_MPModelShimRequestMiddlewareOperation)initWithMiddleware:(id)a3 modelRequest:(id)a4;
- (id)invalidationHandler;
- (void)execute;
- (void)setInvalidationHandler:(id)a3;
- (void)setMiddleware:(id)a3;
- (void)setModelRequest:(id)a3;
@end

@implementation _MPModelShimRequestMiddlewareOperation

- (void)setInvalidationHandler:(id)a3
{
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (void)execute
{
  v5.receiver = self;
  v5.super_class = (Class)_MPModelShimRequestMiddlewareOperation;
  [(MPAsyncOperation *)&v5 execute];
  modelRequest = self->_modelRequest;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49___MPModelShimRequestMiddlewareOperation_execute__block_invoke;
  v4[3] = &unk_1E57F60A0;
  v4[4] = self;
  [(MPModelRequest *)modelRequest performWithResponseHandler:v4];
}

- (_MPModelShimRequestMiddlewareOperation)initWithMiddleware:(id)a3 modelRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_MPModelShimRequestMiddlewareOperation;
  v9 = [(MPAsyncOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_middleware, a3);
    objc_storeStrong((id *)&v10->_modelRequest, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelRequest, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong((id *)&self->_invalidationObservers, 0);
}

- (void)setModelRequest:(id)a3
{
}

- (MPModelRequest)modelRequest
{
  return self->_modelRequest;
}

- (void)setMiddleware:(id)a3
{
}

- (_MPModelShimRequestMiddleware)middleware
{
  return self->_middleware;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

@end