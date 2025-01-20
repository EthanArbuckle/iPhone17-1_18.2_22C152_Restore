@interface _MPModelShimRequestMiddleware
- (MPModelResponse)modelResponse;
- (NSArray)invalidationObservers;
- (id)operationsForRequest:(id)a3;
- (void)setInvalidationObservers:(id)a3;
- (void)setModelResponse:(id)a3;
@end

@implementation _MPModelShimRequestMiddleware

- (void)setModelResponse:(id)a3
{
}

- (void)setInvalidationObservers:(id)a3
{
}

- (MPModelResponse)modelResponse
{
  return self->_modelResponse;
}

- (id)operationsForRequest:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [_MPModelShimRequestMiddlewareOperation alloc];
    v7 = [v5 modelRequest];

    v8 = [(_MPModelShimRequestMiddlewareOperation *)v6 initWithMiddleware:self modelRequest:v7];
    v11[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelResponse, 0);

  objc_storeStrong((id *)&self->_invalidationObservers, 0);
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

@end