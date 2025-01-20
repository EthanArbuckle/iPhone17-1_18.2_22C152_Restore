@interface AMSUIBundleImageFetchOperation
- (AMSUIBundleImageFetchOperation)initWithImageName:(id)a3 searchBundles:(id)a4 compatibleWithTraitCollection:(id)a5;
- (BOOL)isLowLatency;
- (NSArray)bundlesToSearch;
- (NSString)imageName;
- (UITraitCollection)traitCollection;
- (void)main;
- (void)setBundlesToSearch:(id)a3;
- (void)setImageName:(id)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation AMSUIBundleImageFetchOperation

- (AMSUIBundleImageFetchOperation)initWithImageName:(id)a3 searchBundles:(id)a4 compatibleWithTraitCollection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIBundleImageFetchOperation;
  v11 = [(AMSUIBundleImageFetchOperation *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [NSString stringWithString:v8];
    imageName = v11->_imageName;
    v11->_imageName = (NSString *)v12;

    objc_storeStrong((id *)&v11->_bundlesToSearch, a4);
    objc_storeStrong((id *)&v11->_traitCollection, a5);
  }

  return v11;
}

- (BOOL)isLowLatency
{
  return 1;
}

- (void)main
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(AMSUIBundleImageFetchOperation *)self bundlesToSearch];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v17;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v3);
      }
      if (v6) {
        break;
      }
      uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
      id v10 = (void *)MEMORY[0x263F827E8];
      v11 = [(AMSUIBundleImageFetchOperation *)self imageName];
      uint64_t v12 = [(AMSUIBundleImageFetchOperation *)self traitCollection];
      v6 = [v10 imageNamed:v11 inBundle:v9 compatibleWithTraitCollection:v12];

      if (v5 == ++v8)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v5) {
          goto LABEL_3;
        }

        if (!v6) {
          goto LABEL_14;
        }
LABEL_12:
        v13 = self;
        v14 = v6;
        objc_super v15 = 0;
        goto LABEL_15;
      }
    }

    goto LABEL_12;
  }

LABEL_14:
  v6 = AMSError();
  v13 = self;
  v14 = 0;
  objc_super v15 = v6;
LABEL_15:
  [(AMSUIAssetFetchOperation *)v13 _finishWithImage:v14 error:v15];
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (NSArray)bundlesToSearch
{
  return self->_bundlesToSearch;
}

- (void)setBundlesToSearch:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_bundlesToSearch, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end