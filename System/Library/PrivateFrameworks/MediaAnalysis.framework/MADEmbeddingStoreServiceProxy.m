@interface MADEmbeddingStoreServiceProxy
- (MADEmbeddingStoreServiceProxy)initWithService:(id)a3;
@end

@implementation MADEmbeddingStoreServiceProxy

- (MADEmbeddingStoreServiceProxy)initWithService:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MADEmbeddingStoreServiceProxy;
  v5 = [(MADEmbeddingStoreServiceProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_service, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end