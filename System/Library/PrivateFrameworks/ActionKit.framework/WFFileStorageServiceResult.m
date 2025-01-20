@interface WFFileStorageServiceResult
+ (BOOL)supportsSecureCoding;
+ (id)possibleMetadataClasses;
+ (id)resultWithMetadata:(id)a3;
+ (void)getResultWithFileURL:(id)a3 consumingBundleID:(id)a4 resultBlock:(id)a5;
- (NSSecureCoding)metadataObject;
- (NSSecurityScopedURLWrapper)wrappedURL;
- (NSURL)lifecycleManagedURL;
- (WFFileStorageServiceResult)initWithCoder:(id)a3;
- (WFFileStorageServiceResult)initWithFileURL:(id)a3 metadataObject:(id)a4;
- (WFFileStorageServiceResult)initWithWrappedURL:(id)a3 metadataObject:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFFileStorageServiceResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifecycleManagedURL, 0);
  objc_storeStrong((id *)&self->_metadataObject, 0);
  objc_storeStrong((id *)&self->_wrappedURL, 0);
}

- (NSURL)lifecycleManagedURL
{
  return self->_lifecycleManagedURL;
}

- (NSSecureCoding)metadataObject
{
  return self->_metadataObject;
}

- (NSSecurityScopedURLWrapper)wrappedURL
{
  return self->_wrappedURL;
}

- (WFFileStorageServiceResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedURL"];
  v6 = [(id)objc_opt_class() possibleMetadataClasses];
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"metadataObject"];

  v8 = [(WFFileStorageServiceResult *)self initWithWrappedURL:v5 metadataObject:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFFileStorageServiceResult *)self wrappedURL];
  [v4 encodeObject:v5 forKey:@"wrappedURL"];

  id v6 = [(WFFileStorageServiceResult *)self metadataObject];
  [v4 encodeObject:v6 forKey:@"metadataObject"];
}

- (void)dealloc
{
  v3 = [(WFFileStorageServiceResult *)self lifecycleManagedURL];

  if (v3)
  {
    id v4 = [(WFFileStorageServiceResult *)self lifecycleManagedURL];
    [v4 stopAccessingSecurityScopedResource];
  }
  v5.receiver = self;
  v5.super_class = (Class)WFFileStorageServiceResult;
  [(WFFileStorageServiceResult *)&v5 dealloc];
}

- (WFFileStorageServiceResult)initWithFileURL:(id)a3 metadataObject:(id)a4
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"WFFileStorageServiceResult.m" lineNumber:64 description:@"Can't initialize a result with no data"];
  }
  v16.receiver = self;
  v16.super_class = (Class)WFFileStorageServiceResult;
  v10 = [(WFFileStorageServiceResult *)&v16 init];
  if (v10)
  {
    [(id)v8 startAccessingSecurityScopedResource];
    objc_storeStrong((id *)&v10->_lifecycleManagedURL, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F08B18]) initWithURL:v8];
    wrappedURL = v10->_wrappedURL;
    v10->_wrappedURL = (NSSecurityScopedURLWrapper *)v11;

    objc_storeStrong((id *)&v10->_metadataObject, a4);
    v13 = v10;
  }

  return v10;
}

- (WFFileStorageServiceResult)initWithWrappedURL:(id)a3 metadataObject:(id)a4
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"WFFileStorageServiceResult.m" lineNumber:49 description:@"Can't initialize a result with no data"];
  }
  v16.receiver = self;
  v16.super_class = (Class)WFFileStorageServiceResult;
  v10 = [(WFFileStorageServiceResult *)&v16 init];
  uint64_t v11 = v10;
  if (v10)
  {
    lifecycleManagedURL = v10->_lifecycleManagedURL;
    v10->_lifecycleManagedURL = 0;

    objc_storeStrong((id *)&v11->_wrappedURL, a3);
    objc_storeStrong((id *)&v11->_metadataObject, a4);
    v13 = v11;
  }

  return v11;
}

+ (id)possibleMetadataClasses
{
  v2 = +[WFStorageServiceRegistry sharedRegistry];
  v3 = [v2 storageServices];
  id v4 = objc_msgSend(v3, "if_map:", &__block_literal_global);

  objc_super v5 = [MEMORY[0x263EFFA08] setWithArray:v4];

  return v5;
}

uint64_t __53__WFFileStorageServiceResult_possibleMetadataClasses__block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectRepresentationClass];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)resultWithMetadata:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WFFileStorageServiceResult.m", 111, @"Invalid parameter not satisfying: %@", @"metadataObject" object file lineNumber description];
  }
  id v6 = [[WFFileStorageServiceResult alloc] initWithWrappedURL:0 metadataObject:v5];

  return v6;
}

+ (void)getResultWithFileURL:(id)a3 consumingBundleID:(id)a4 resultBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void))a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_10:
    int v15 = 0;
    goto LABEL_11;
  }
  objc_super v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, a1, @"WFFileStorageServiceResult.m", 80, @"Invalid parameter not satisfying: %@", @"fileURL" object file lineNumber description];

  if (!v10) {
    goto LABEL_10;
  }
LABEL_3:
  v24[0] = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v12 = (uint64_t (*)(id, void *))getFPIsFileProviderBookmarkSymbolLoc_ptr;
  v29 = getFPIsFileProviderBookmarkSymbolLoc_ptr;
  if (!getFPIsFileProviderBookmarkSymbolLoc_ptr)
  {
    v24[1] = MEMORY[0x263EF8330];
    v24[2] = 3221225472;
    v24[3] = __getFPIsFileProviderBookmarkSymbolLoc_block_invoke;
    v24[4] = &unk_264E5EC88;
    v25 = &v26;
    v13 = FileProviderLibrary();
    v27[3] = (uint64_t)dlsym(v13, "FPIsFileProviderBookmark");
    getFPIsFileProviderBookmarkSymbolLoc_ptr = *(_UNKNOWN **)(v25[1] + 24);
    v12 = (uint64_t (*)(id, void *))v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (v12)
  {
    int v14 = v12(v9, v24);
    if (v24[0])
    {
      v11[2](v11, 0);
LABEL_15:

      return;
    }
    int v15 = v14;
LABEL_11:
    v17 = [[WFFileStorageServiceResult alloc] initWithFileURL:v9 metadataObject:0];
    if (v15)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __81__WFFileStorageServiceResult_getResultWithFileURL_consumingBundleID_resultBlock___block_invoke;
      v20[3] = &unk_264E58968;
      id v21 = v9;
      v23 = v11;
      v22 = v17;
      WFFileStorageServiceResultAllowFPSandboxExtensionToConsumer(v21, v10, v20);
    }
    else
    {
      ((void (*)(void (**)(id, void), WFFileStorageServiceResult *, void))v11[2])(v11, v17, 0);
    }

    goto LABEL_15;
  }
  v18 = [MEMORY[0x263F08690] currentHandler];
  v19 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _FPIsFileProviderBookmark(CFURLRef, CFErrorRef *)");
  objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"WFFileStorageServiceResult.m", 19, @"%s", dlerror());

  __break(1u);
}

void __81__WFFileStorageServiceResult_getResultWithFileURL_consumingBundleID_resultBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = getWFActionsLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 136315651;
      unint64_t v8 = "+[WFFileStorageServiceResult getResultWithFileURL:consumingBundleID:resultBlock:]_block_invoke";
      __int16 v9 = 2113;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_23C364000, v4, OS_LOG_TYPE_ERROR, "%s Couldn't modify filecoordinationd ACL for sandbox extending %{private}@: %{public}@", (uint8_t *)&v7, 0x20u);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v6();
}

@end