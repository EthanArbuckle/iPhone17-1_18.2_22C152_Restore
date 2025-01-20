@interface ASKLoadBundleResourceOperation
+ (id)_searchBundles;
+ (id)supportedScheme;
- (ASKLoadBundleResourceOperation)initWithResourceName:(id)a3;
- (ASKLoadBundleResourceOperation)initWithURLRequest:(id)a3 dataConsumer:(id)a4;
- (NSArray)searchBundles;
- (NSString)resourceName;
- (void)main;
@end

@implementation ASKLoadBundleResourceOperation

- (ASKLoadBundleResourceOperation)initWithURLRequest:(id)a3 dataConsumer:(id)a4
{
  v5 = [a3 URL];
  v6 = [v5 host];
  v7 = [(ASKLoadBundleResourceOperation *)self initWithResourceName:v6];

  return v7;
}

- (ASKLoadBundleResourceOperation)initWithResourceName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASKLoadBundleResourceOperation;
  v5 = [(ASKLoadBundleResourceOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    resourceName = v5->_resourceName;
    v5->_resourceName = (NSString *)v6;
  }
  return v5;
}

+ (id)supportedScheme
{
  return @"resource";
}

+ (id)_searchBundles
{
  if (_searchBundles_onceToken != -1) {
    dispatch_once(&_searchBundles_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)_searchBundles__searchBundles;
  return v2;
}

void __48__ASKLoadBundleResourceOperation__searchBundles__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v4[0] = v0;
  v1 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppStoreKitInternal"];
  v4[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  v3 = (void *)_searchBundles__searchBundles;
  _searchBundles__searchBundles = v2;
}

- (void)main
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v3 = [(id)objc_opt_class() _searchBundles];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v21 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * v7);
      if ([(ASKLoadBundleResourceOperation *)self isCancelled]) {
        break;
      }
      objc_super v9 = (void *)MEMORY[0x1E4FB1818];
      v10 = [(ASKLoadBundleResourceOperation *)self resourceName];
      v11 = [v9 imageNamed:v10 inBundle:v8 compatibleWithTraitCollection:0];

      if (v11)
      {
        v17 = self;
        v18 = v11;
        v19 = 0;
        goto LABEL_13;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v26 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    if ([(ASKLoadBundleResourceOperation *)self isCancelled]) {
      return;
    }
    v12 = NSString;
    v13 = [(ASKLoadBundleResourceOperation *)self resourceName];
    v14 = [(id)objc_opt_class() _searchBundles];
    v3 = [v12 stringWithFormat:@"No image found for %@ in %@", v13, v14, (void)v20];

    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25 = v3;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v11 = [v15 errorWithDomain:@"ASKLoadBundleResourceOperationErrorDomain" code:560557415 userInfo:v16];

    v17 = self;
    v18 = 0;
    v19 = v11;
LABEL_13:
    [(ASKLoadResourceOperation *)v17 didCompleteWithResource:v18 error:v19];
  }
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (NSArray)searchBundles
{
  return self->_searchBundles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBundles, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
}

@end