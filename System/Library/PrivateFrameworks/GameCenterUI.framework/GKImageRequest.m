@interface GKImageRequest
+ (NSArray)searchBundles;
+ (void)setSearchBundles:(id)a3;
- (BOOL)isAvatarImageRequest;
- (BOOL)isContactImageRequest;
- (BOOL)isResourceRequest;
- (BOOL)isSystemImageRequest;
- (GKImageRequest)init;
- (GKImageRequest)initWithURLRequest:(id)a3 dataConsumer:(id)a4 delegate:(id)a5;
- (GKImageRequestDelegate)delegate;
- (GKResourceDataConsumer)dataConsumer;
- (NSURLRequest)urlRequest;
- (id)description;
- (id)makeLoadOperation;
- (unint64_t)cacheOptions;
- (void)didLoadResource:(id)a3 error:(id)a4;
@end

@implementation GKImageRequest

- (GKImageRequest)initWithURLRequest:(id)a3 dataConsumer:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GKImageRequest;
  v11 = [(GKResourceRequest *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    urlRequest = v11->_urlRequest;
    v11->_urlRequest = (NSURLRequest *)v12;

    objc_storeStrong((id *)&v11->_dataConsumer, a4);
    objc_storeWeak((id *)&v11->_delegate, v10);
  }

  return v11;
}

- (GKImageRequest)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(GKImageRequest *)self urlRequest];
  v7 = [(GKImageRequest *)self dataConsumer];
  id v8 = [v3 stringWithFormat:@"<%@:%p urlRequest = %@, dataConsumer = %@>", v5, self, v6, v7];

  return v8;
}

- (BOOL)isResourceRequest
{
  v2 = [(GKImageRequest *)self urlRequest];
  v3 = [v2 URL];
  v4 = [v3 scheme];
  char v5 = [@"resource" isEqual:v4];

  return v5;
}

- (BOOL)isSystemImageRequest
{
  v2 = [(GKImageRequest *)self urlRequest];
  v3 = [v2 URL];
  v4 = [v3 scheme];
  char v5 = [@"systemimage" isEqual:v4];

  return v5;
}

- (BOOL)isAvatarImageRequest
{
  v2 = [(GKImageRequest *)self urlRequest];
  v3 = [v2 URL];
  v4 = [v3 scheme];
  char v5 = [@"avatarimage" isEqual:v4];

  return v5;
}

- (BOOL)isContactImageRequest
{
  v2 = [(GKImageRequest *)self urlRequest];
  v3 = [v2 URL];
  v4 = [v3 scheme];
  char v5 = [@"contactimage" isEqual:v4];

  return v5;
}

- (unint64_t)cacheOptions
{
  if ([(GKImageRequest *)self isResourceRequest]) {
    return 6;
  }
  if ([(GKImageRequest *)self isSystemImageRequest]) {
    return 0;
  }
  return 2;
}

+ (void)setSearchBundles:(id)a3
{
  uint64_t v3 = [a3 copy];
  uint64_t v4 = _searchBundles;
  _searchBundles = v3;

  MEMORY[0x1F41817F8](v3, v4);
}

+ (NSArray)searchBundles
{
  v6[2] = *MEMORY[0x1E4F143B8];
  if (_searchBundles)
  {
    v2 = (void *)[(id)_searchBundles copy];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
    v6[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.GameCenterUI"];
    v6[1] = v4;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  }

  return (NSArray *)v2;
}

- (id)makeLoadOperation
{
  if ([(GKImageRequest *)self isResourceRequest])
  {
    uint64_t v3 = [GKLoadBundleResourceOperation alloc];
    uint64_t v4 = [(GKImageRequest *)self urlRequest];
    char v5 = [v4 URL];
    v6 = [v5 host];
    v7 = [(id)objc_opt_class() searchBundles];
    id v8 = [(GKLoadBundleResourceOperation *)v3 initWithResourceName:v6 searchBundles:v7];

LABEL_5:
LABEL_6:

    goto LABEL_7;
  }
  if ([(GKImageRequest *)self isSystemImageRequest])
  {
    id v9 = [GKLoadSystemImageResourceOperation alloc];
    uint64_t v4 = [(GKImageRequest *)self urlRequest];
    char v5 = [v4 URL];
    v6 = [v5 host];
    id v8 = [(GKLoadSystemImageResourceOperation *)v9 initWithSystemImageName:v6];
    goto LABEL_5;
  }
  if ([(GKImageRequest *)self isAvatarImageRequest])
  {
    v11 = [(GKImageRequest *)self urlRequest];
    uint64_t v12 = [v11 URL];
    uint64_t v4 = [v12 host];

    if ([v4 isEqualToString:@"G"])
    {
      v13 = [(GKImageRequest *)self urlRequest];
      v14 = [v13 URL];
      objc_super v15 = [v14 port];

      if (v15)
      {
        v16 = NSString;
        v17 = [(GKImageRequest *)self urlRequest];
        v18 = [v17 URL];
        v19 = [v18 port];
        uint64_t v20 = [v16 stringWithFormat:@"G:%@", v19];

        uint64_t v4 = (void *)v20;
      }
    }
    v21 = [[GKLoadAvatarResourceOperation alloc] initWithPlayerId:v4];
  }
  else
  {
    if (![(GKImageRequest *)self isContactImageRequest])
    {
      v25 = [GKLoadImageResourceOperation alloc];
      uint64_t v4 = [(GKImageRequest *)self urlRequest];
      char v5 = [(GKImageRequest *)self dataConsumer];
      id v8 = [(GKLoadImageResourceOperation *)v25 initWithURLRequest:v4 dataConsumer:v5];
      goto LABEL_6;
    }
    v22 = [(GKImageRequest *)self urlRequest];
    v23 = [v22 URL];
    v24 = [v23 host];
    uint64_t v4 = [v24 stringByRemovingPercentEncoding];

    v21 = [[GKLoadContactResourceOperation alloc] initWithContactId:v4];
  }
  id v8 = (GKLoadBundleResourceOperation *)v21;
LABEL_7:

  return v8;
}

- (void)didLoadResource:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(GKImageRequest *)self delegate];
  id v8 = v7;
  if (v6) {
    [v7 imageRequest:self didFailWithError:v6];
  }
  else {
    [v7 imageRequest:self didLoadImage:v9];
  }
}

- (GKResourceDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (GKImageRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKImageRequestDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_urlRequest, 0);

  objc_storeStrong((id *)&self->_dataConsumer, 0);
}

@end