@interface FPXV2ExtensionWrapper
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isInteractionSuppressedForIdentifier:(id)a3;
- (Class)extensionClass;
- (FPXV2ExtensionWrapper)initWithDomain:(id)a3;
- (NSFileProviderExtension)extension;
- (id)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8;
- (id)deleteItemWithIdentifier:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7;
- (id)enumeratorForContainerItemIdentifier:(id)a3 request:(id)a4 error:(id *)a5;
- (id)enumeratorForSearch:(id)a3 request:(id)a4 error:(id *)a5;
- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 usingExistingContentsAtURL:(id)a5 existingVersion:(id)a6 request:(id)a7 completionHandler:(id)a8;
- (id)fetchThumbnailsForItemIdentifiers:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandler:(id)a5 completionHandler:(id)a6;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)itemForIdentifier:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)modifyItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 request:(id)a8 completionHandler:(id)a9;
- (id)performActionWithIdentifier:(id)a3 onItemsWithIdentifiers:(id)a4 completionHandler:(id)a5;
- (id)supportedServiceSourcesForItemIdentifier:(id)a3 completionHandler:(id)a4;
- (void)importDidFinishWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)materializedItemsDidChangeWithCompletionHandler:(id)a3;
- (void)setExtensionClass:(Class)a3;
- (void)setInteractionSuppressed:(BOOL)a3 forIdentifier:(id)a4;
@end

@implementation FPXV2ExtensionWrapper

- (id)methodSignatureForSelector:(SEL)a3
{
  v5 = -[NSFileProviderExtension methodSignatureForSelector:](self->_extension, "methodSignatureForSelector:");
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)FPXV2ExtensionWrapper;
    id v7 = [(FPXV2ExtensionWrapper *)&v10 methodSignatureForSelector:a3];
  }
  v8 = v7;

  return v8;
}

- (NSFileProviderExtension)extension
{
  return self->_extension;
}

- (void)setExtensionClass:(Class)a3
{
}

- (FPXV2ExtensionWrapper)initWithDomain:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPXV2ExtensionWrapper;
  v5 = [(FPXV2ExtensionWrapper *)&v15 init];
  if (v5)
  {
    v6 = [v4 identifier];
    int v7 = [v6 isEqualToString:@"NSFileProviderDomainDefaultIdentifier"];

    if (v7)
    {

      id v4 = 0;
    }
    int v8 = [(objc_class *)v5->_extensionClass instancesRespondToSelector:sel_initWithDomain_];
    extensionClass = v5->_extensionClass;
    if (v8)
    {
      uint64_t v10 = [[extensionClass alloc] initWithDomain:v4];
      extension = v5->_extension;
      v5->_extension = (NSFileProviderExtension *)v10;
    }
    else
    {
      v12 = (NSFileProviderExtension *)objc_alloc_init(extensionClass);
      v13 = v5->_extension;
      v5->_extension = v12;

      if (v4) {
        [(NSFileProviderExtension *)v5->_extension setDomain:v4];
      }
    }
  }

  return v5;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FPXV2ExtensionWrapper;
  if ([(FPXV2ExtensionWrapper *)&v7 conformsToProtocol:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [(NSFileProviderExtension *)self->_extension conformsToProtocol:v4];
  }

  return v5;
}

- (id)itemForIdentifier:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  extension = self->_extension;
  id v12 = 0;
  objc_super v7 = (void (**)(id, void *, id))a5;
  int v8 = [(NSFileProviderExtension *)extension itemForIdentifier:a3 error:&v12];
  id v9 = v12;
  v7[2](v7, v8, v9);

  uint64_t v10 = objc_opt_new();

  return v10;
}

- (id)enumeratorForContainerItemIdentifier:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__11;
  v28 = __Block_byref_object_dispose__11;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__11;
  v22 = __Block_byref_object_dispose__11;
  id v23 = 0;
  extension = self->_extension;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__FPXV2ExtensionWrapper_enumeratorForContainerItemIdentifier_request_error___block_invoke;
  v14[3] = &unk_1E5AF3098;
  v16 = &v24;
  v14[4] = self;
  id v11 = v8;
  id v15 = v11;
  v17 = &v18;
  [(NSFileProviderExtension *)extension _withRequest:v9 execute:v14];
  if (a5) {
    *a5 = (id) v19[5];
  }
  id v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __76__FPXV2ExtensionWrapper_enumeratorForContainerItemIdentifier_request_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  v3 = *(void **)(a1[4] + 16);
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 enumeratorForContainerItemIdentifier:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  objc_super v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)invalidate
{
}

- (id)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8
{
  id v13 = a8;
  extension = self->_extension;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__FPXV2ExtensionWrapper_createItemBasedOnTemplate_fields_contents_options_request_completionHandler___block_invoke;
  v18[3] = &unk_1E5AF3070;
  id v19 = v13;
  id v15 = v13;
  [(NSFileProviderExtension *)extension createItemBasedOnTemplate:a3 fields:a4 contents:a5 options:a6 completionHandler:v18];

  v16 = objc_opt_new();

  return v16;
}

uint64_t __101__FPXV2ExtensionWrapper_createItemBasedOnTemplate_fields_contents_options_request_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)deleteItemWithIdentifier:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  [(NSFileProviderExtension *)self->_extension deleteItemWithIdentifier:a3 baseVersion:a4 options:a5 completionHandler:a7];
  objc_super v7 = objc_opt_new();

  return v7;
}

- (id)enumeratorForSearch:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__11;
  id v29 = __Block_byref_object_dispose__11;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__11;
  id v23 = __Block_byref_object_dispose__11;
  id v24 = 0;
  extension = self->_extension;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__FPXV2ExtensionWrapper_enumeratorForSearch_request_error___block_invoke;
  v14[3] = &unk_1E5AF30C0;
  id v11 = v8;
  id v15 = v11;
  v16 = self;
  v17 = &v25;
  uint64_t v18 = &v19;
  [(NSFileProviderExtension *)extension _withRequest:v9 execute:v14];
  if (a5) {
    *a5 = (id) v20[5];
  }
  id v12 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __59__FPXV2ExtensionWrapper_enumeratorForSearch_request_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) legacySearchQuery];
  v3 = *(void **)(*(void *)(a1 + 40) + 16);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 enumeratorForSearchQuery:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  objc_super v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__11;
  id v29 = __Block_byref_object_dispose__11;
  id v30 = 0;
  extension = self->_extension;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__FPXV2ExtensionWrapper_fetchContentsForItemWithIdentifier_version_request_completionHandler___block_invoke;
  v20[3] = &unk_1E5AF30E8;
  id v24 = &v25;
  v20[4] = self;
  id v15 = v10;
  id v21 = v15;
  id v16 = v11;
  id v22 = v16;
  id v17 = v13;
  id v23 = v17;
  [(NSFileProviderExtension *)extension _withRequest:v12 execute:v20];
  id v18 = (id)v26[5];

  _Block_object_dispose(&v25, 8);

  return v18;
}

uint64_t __94__FPXV2ExtensionWrapper_fetchContentsForItemWithIdentifier_version_request_completionHandler___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[8] + 8) + 40) = [*(id *)(a1[4] + 16) fetchContentsForItemWithIdentifier:a1[5] version:a1[6] completionHandler:a1[7]];

  return MEMORY[0x1F41817F8]();
}

- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 usingExistingContentsAtURL:(id)a5 existingVersion:(id)a6 request:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__11;
  v39 = __Block_byref_object_dispose__11;
  id v40 = 0;
  extension = self->_extension;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __137__FPXV2ExtensionWrapper_fetchContentsForItemWithIdentifier_version_usingExistingContentsAtURL_existingVersion_request_completionHandler___block_invoke;
  v28[3] = &unk_1E5AF3110;
  v34 = &v35;
  v28[4] = self;
  id v21 = v14;
  id v29 = v21;
  id v22 = v15;
  id v30 = v22;
  id v23 = v16;
  id v31 = v23;
  id v24 = v17;
  id v32 = v24;
  id v25 = v19;
  id v33 = v25;
  [(NSFileProviderExtension *)extension _withRequest:v18 execute:v28];
  id v26 = (id)v36[5];

  _Block_object_dispose(&v35, 8);

  return v26;
}

uint64_t __137__FPXV2ExtensionWrapper_fetchContentsForItemWithIdentifier_version_usingExistingContentsAtURL_existingVersion_request_completionHandler___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[10] + 8) + 40) = [*(id *)(a1[4] + 16) fetchContentsForItemWithIdentifier:a1[5] version:a1[6] usingExistingContentsAtURL:a1[7] existingVersion:a1[8] completionHandler:a1[9]];

  return MEMORY[0x1F41817F8]();
}

- (id)modifyItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 request:(id)a8 completionHandler:(id)a9
{
  [(NSFileProviderExtension *)self->_extension changeItem:a3 baseVersion:a4 changedFields:a5 contents:a6 options:a7 completionHandler:a9];
  id v9 = objc_opt_new();

  return v9;
}

- (void)importDidFinishWithCompletionHandler:(id)a3
{
}

- (void)materializedItemsDidChangeWithCompletionHandler:(id)a3
{
}

- (id)supportedServiceSourcesForItemIdentifier:(id)a3 completionHandler:(id)a4
{
  extension = self->_extension;
  id v11 = 0;
  uint64_t v6 = (void (**)(id, void *, id))a4;
  objc_super v7 = [(NSFileProviderExtension *)extension supportedServiceSourcesForItemIdentifier:a3 error:&v11];
  id v8 = v11;
  v6[2](v6, v7, v8);

  id v9 = objc_opt_new();

  return v9;
}

- (id)performActionWithIdentifier:(id)a3 onItemsWithIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [(NSFileProviderExtension *)self->_extension performActionWithIdentifier:v8 onItemsWithIdentifiers:v9 completionHandler:v10];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
    v10[2](v10, v12);

    uint64_t v11 = objc_opt_new();
  }
  id v13 = (void *)v11;

  return v13;
}

- (id)fetchThumbnailsForItemIdentifiers:(id)a3 requestedSize:(CGSize)a4 perThumbnailCompletionHandler:(id)a5 completionHandler:(id)a6
{
  return -[NSFileProviderExtension fetchThumbnailsForItemIdentifiers:requestedSize:perThumbnailCompletionHandler:completionHandler:](self->_extension, "fetchThumbnailsForItemIdentifiers:requestedSize:perThumbnailCompletionHandler:completionHandler:", a3, a5, a6, a4.width, a4.height);
}

- (BOOL)isInteractionSuppressedForIdentifier:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [(NSFileProviderExtension *)self->_extension isInteractionSuppressedForIdentifier:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)setInteractionSuppressed:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(NSFileProviderExtension *)self->_extension setInteractionSuppressed:v4 forIdentifier:v6];
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_extension;
}

- (Class)extensionClass
{
  return self->_extensionClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);

  objc_storeStrong((id *)&self->_extensionClass, 0);
}

@end