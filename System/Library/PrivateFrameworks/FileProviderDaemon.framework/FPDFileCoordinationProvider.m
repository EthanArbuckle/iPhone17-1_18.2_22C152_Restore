@interface FPDFileCoordinationProvider
- (BOOL)isRegistered;
- (FPDFileCoordinationProvider)initWithRootURL:(id)a3;
- (FPDFileCoordinationProviderDelegate)delegate;
- (NSOperationQueue)_providedItemsOperationQueue;
- (NSString)_fileReactorID;
- (NSString)extensionIdentifier;
- (NSURL)_providedItemsURL;
- (id)_physicalURLForURL:(id)a3;
- (id)delegateForURL:(id)a3;
- (void)_cancelProvidingItemAtURL:(id)a3 toReaderWithID:(id)a4;
- (void)_movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5;
- (void)_provideItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)_provideItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5;
- (void)_providedItemAtURL:(id)a3 didGainPresenterWithInfo:(id)a4;
- (void)_providedItemAtURL:(id)a3 didLosePresenterWithID:(id)a4;
- (void)_providedItemAtURL:(id)a3 withPresenterWithID:(id)a4 didMoveToURL:(id)a5;
- (void)_writerWithID:(id)a3 didFinishWritingForURL:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setRegistered:(BOOL)a3;
@end

@implementation FPDFileCoordinationProvider

- (FPDFileCoordinationProvider)initWithRootURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPDFileCoordinationProvider;
  v6 = [(FPDFileCoordinationProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_providedItemsURL, a3);
  }

  return v7;
}

- (id)delegateForURL:(id)a3
{
  id v4 = a3;
  id v5 = [(FPDFileCoordinationProvider *)self delegate];
  v6 = [v5 _siblingDelegateForURL:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [(FPDFileCoordinationProvider *)self delegate];
  }
  v8 = v7;

  return v8;
}

- (NSURL)_providedItemsURL
{
  return self->_providedItemsURL;
}

- (NSOperationQueue)_providedItemsOperationQueue
{
  v2 = [(FPDFileCoordinationProvider *)self delegate];
  v3 = [v2 _providedItemsOperationQueue];

  return (NSOperationQueue *)v3;
}

- (NSString)_fileReactorID
{
  v2 = [(FPDFileCoordinationProvider *)self delegate];
  v3 = [v2 _fileReactorID];

  return (NSString *)v3;
}

- (id)_physicalURLForURL:(id)a3
{
  id v4 = a3;
  id v5 = [(FPDFileCoordinationProvider *)self delegateForURL:v4];
  v6 = [v5 _physicalURLForURL:v4];

  return v6;
}

- (void)_provideItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[FPDFileCoordinationProvider _provideItemAtURL:completionHandler:](a2, v9);
  }

  id v10 = objc_alloc_init(MEMORY[0x1E4F28CD8]);
  v11 = [(FPDFileCoordinationProvider *)self delegateForURL:v8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__FPDFileCoordinationProvider__provideItemAtURL_completionHandler___block_invoke;
  v13[3] = &unk_1E6A741C8;
  id v14 = v7;
  id v12 = v7;
  [v11 _provideItemAtURL:v8 withInfo:v10 completionHandler:v13];
}

void __67__FPDFileCoordinationProvider__provideItemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(MEMORY[0x1E4F28CA0], "_setProvidedItemRecursiveGenerationCount:", objc_msgSend(v5, "providedItemRecursiveGenerationCount"));
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [v5 error];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (void)_provideItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FPDFileCoordinationProvider *)self delegateForURL:v10];
  [v11 _provideItemAtURL:v10 withInfo:v9 completionHandler:v8];
}

- (void)_cancelProvidingItemAtURL:(id)a3 toReaderWithID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDFileCoordinationProvider *)self delegateForURL:v7];
  [v8 _cancelProvidingItemAtURL:v7 toReaderWithID:v6];
}

- (void)_writerWithID:(id)a3 didFinishWritingForURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDFileCoordinationProvider *)self delegateForURL:v6];
  [v8 _writerWithID:v7 didFinishWritingForURL:v6];
}

- (void)_providedItemAtURL:(id)a3 didGainPresenterWithInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDFileCoordinationProvider *)self delegateForURL:v7];
  [v8 _providedItemAtURL:v7 didGainPresenterWithInfo:v6];
}

- (void)_providedItemAtURL:(id)a3 didLosePresenterWithID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPDFileCoordinationProvider *)self delegateForURL:v7];
  [v8 _providedItemAtURL:v7 didLosePresenterWithID:v6];
}

- (void)_providedItemAtURL:(id)a3 withPresenterWithID:(id)a4 didMoveToURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FPDFileCoordinationProvider *)self delegateForURL:v10];
  [v11 _providedItemAtURL:v10 withPresenterWithID:v9 didMoveToURL:v8];
}

- (void)_movingItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = [(FPDFileCoordinationProvider *)self delegateForURL:v8];
  id v12 = [v9 destinationDirectoryURL];
  v13 = [(FPDFileCoordinationProvider *)self delegateForURL:v12];

  if (v11 == v13)
  {
    [v11 _movingItemAtURL:v8 withInfo:v9 completionHandler:v10];
  }
  else
  {
    id v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[FPDFileCoordinationProvider _movingItemAtURL:withInfo:completionHandler:](v8, v9, v14);
    }

    v15 = [MEMORY[0x1E4F28CC8] providingRequiredResponse];
    v10[2](v10, v15);
  }
}

- (FPDFileCoordinationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FPDFileCoordinationProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)extensionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExtensionIdentifier:(id)a3
{
}

- (BOOL)isRegistered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_providedItemsURL, 0);
}

- (void)_provideItemAtURL:(const char *)a1 completionHandler:(NSObject *)a2 .cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Calling deprecated method: %@", (uint8_t *)&v4, 0xCu);
}

- (void)_movingItemAtURL:(void *)a1 withInfo:(void *)a2 completionHandler:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a1, "fp_shortDescription");
  uint64_t v6 = [a2 destinationDirectoryURL];
  id v7 = objc_msgSend(v6, "fp_shortDescription");
  int v8 = 138412546;
  id v9 = v5;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_debug_impl(&dword_1D744C000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] needs providing %@ for moving into a different domain %@", (uint8_t *)&v8, 0x16u);
}

@end