@interface ASKImageRequest
- (ASKImageRequest)init;
- (ASKImageRequest)initWithURLRequest:(id)a3 loadOperation:(id)a4 dataConsumer:(id)a5 delegate:(id)a6;
- (ASKImageRequestDelegate)delegate;
- (ASKLoadResourceOperation)loadOperation;
- (ASKResourceDataConsumer)dataConsumer;
- (BOOL)isResourceRequest;
- (NSURLRequest)urlRequest;
- (id)description;
- (unint64_t)cacheOptions;
- (void)didLoadResource:(id)a3 error:(id)a4;
@end

@implementation ASKImageRequest

- (ASKImageRequest)initWithURLRequest:(id)a3 loadOperation:(id)a4 dataConsumer:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ASKImageRequest;
  v14 = [(ASKResourceRequest *)&v18 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    urlRequest = v14->_urlRequest;
    v14->_urlRequest = (NSURLRequest *)v15;

    objc_storeStrong((id *)&v14->_loadOperation, a4);
    objc_storeStrong((id *)&v14->_dataConsumer, a5);
    objc_storeWeak((id *)&v14->_delegate, v13);
  }

  return v14;
}

- (ASKImageRequest)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ASKImageRequest *)self urlRequest];
  v7 = [(ASKImageRequest *)self loadOperation];
  v8 = [(ASKImageRequest *)self dataConsumer];
  v9 = [v3 stringWithFormat:@"<%@:%p urlRequest = %@, loadOperation = %@, dataConsumer = %@>", v5, self, v6, v7, v8];

  return v9;
}

- (unint64_t)cacheOptions
{
  return 2;
}

- (void)didLoadResource:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(ASKImageRequest *)self delegate];
  v8 = v7;
  if (v6) {
    [v7 imageRequest:self didFailWithError:v6];
  }
  else {
    [v7 imageRequest:self didLoadImage:v9];
  }
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (ASKLoadResourceOperation)loadOperation
{
  return self->_loadOperation;
}

- (ASKResourceDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (ASKImageRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASKImageRequestDelegate *)WeakRetained;
}

- (BOOL)isResourceRequest
{
  return self->_isResourceRequest;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_urlRequest, 0);
}

@end