@interface GKLoadBundleResourceOperation
- (GKLoadBundleResourceOperation)initWithResourceName:(id)a3 searchBundles:(id)a4;
- (NSArray)searchBundles;
- (NSString)resourceName;
- (void)main;
@end

@implementation GKLoadBundleResourceOperation

- (GKLoadBundleResourceOperation)initWithResourceName:(id)a3 searchBundles:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GKLoadBundleResourceOperation;
  v8 = [(GKLoadBundleResourceOperation *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    resourceName = v8->_resourceName;
    v8->_resourceName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    searchBundles = v8->_searchBundles;
    v8->_searchBundles = (NSArray *)v11;
  }
  return v8;
}

- (void)main
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v3 = [(GKLoadBundleResourceOperation *)self searchBundles];
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
      if ([(GKLoadBundleResourceOperation *)self isCancelled]) {
        break;
      }
      uint64_t v9 = (void *)MEMORY[0x1E4FB1818];
      v10 = [(GKLoadBundleResourceOperation *)self resourceName];
      uint64_t v11 = [v9 imageNamed:v10 inBundle:v8 compatibleWithTraitCollection:0];

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

    if ([(GKLoadBundleResourceOperation *)self isCancelled]) {
      return;
    }
    v12 = NSString;
    v13 = [(GKLoadBundleResourceOperation *)self resourceName];
    objc_super v14 = [(GKLoadBundleResourceOperation *)self searchBundles];
    v3 = [v12 stringWithFormat:@"No image found for %@ in %@", v13, v14];

    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25 = v3;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v11 = [v15 errorWithDomain:@"GKLoadBundleResourceOperationErrorDomain" code:560557415 userInfo:v16];

    v17 = self;
    v18 = 0;
    v19 = v11;
LABEL_13:
    [(GKLoadResourceOperation *)v17 didCompleteWithResource:v18 error:v19];
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