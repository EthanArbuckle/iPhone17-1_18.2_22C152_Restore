@interface QLThumbnailStoreRetrievalOperation
+ (BOOL)canMostRecentClientsGenerateThumbnailsForUTI:(id)a3;
- (BOOL)_finishIfNeeded;
- (BOOL)allowsThumbnailGeneration;
- (BOOL)generateThumbnailsAtBackgroundPriority;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)thumbnailWasAutomaticallyGenerated;
- (BOOL)thumbnailWasJustAutomaticallyGenerated;
- (GSAddition)genStoreAddition;
- (NSData)serializedQuickLookMetadataDictionary;
- (NSDictionary)thumbnailImagesDictionary;
- (NSError)error;
- (NSURL)destinationURL;
- (NSURL)documentURL;
- (QLThumbnailAddition)addition;
- (QLThumbnailGenerationRequest)thumbnailRequest;
- (QLThumbnailStoreRetrievalOperation)init;
- (QLThumbnailStoreRetrievalOperation)initWithDocumentAtURL:(id)a3;
- (id)description;
- (void)_afterDeterminingWhetherWeCanGenerate:(BOOL)a3;
- (void)_afterThumbnailIsGenerated;
- (void)_finishBecauseGenerationFailedWithUnderlyingError:(id)a3;
- (void)_finishWithError:(id)a3;
- (void)_generateThumbnail;
- (void)afterThumbnailIsPutInGenstore;
- (void)cancel;
- (void)main;
- (void)setAllowsThumbnailGeneration:(BOOL)a3;
- (void)setDestinationURL:(id)a3;
- (void)setDocumentURL:(id)a3;
- (void)setError:(id)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setGenerateThumbnailsAtBackgroundPriority:(BOOL)a3;
- (void)setThumbnailRequest:(id)a3;
- (void)start;
@end

@implementation QLThumbnailStoreRetrievalOperation

+ (BOOL)canMostRecentClientsGenerateThumbnailsForUTI:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
  v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.adobe.illustrator.ai-image"];
  v5 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.adobe.photoshop-image"];
  v6 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.adobe.photoshop-large-image"];
  if ([v3 conformsToType:*MEMORY[0x1E4F44400]]
    && ([v3 conformsToType:v4] & 1) == 0
    && ([v3 conformsToType:v5] & 1) == 0
    && ![v3 conformsToType:v6]
    || ([v3 conformsToType:*MEMORY[0x1E4F44450]] & 1) != 0
    || ([v3 conformsToType:*MEMORY[0x1E4F44448]] & 1) != 0
    || [v3 conformsToType:*MEMORY[0x1E4F44470]]
    && ![v3 conformsToType:*MEMORY[0x1E4F44388]]
    || ([v3 conformsToType:*MEMORY[0x1E4F444A0]] & 1) != 0
    || ([v3 conformsToType:*MEMORY[0x1E4F444A8]] & 1) != 0
    || ([v3 conformsToType:*MEMORY[0x1E4F44548]] & 1) != 0)
  {
    char v7 = 1;
  }
  else
  {
    char v7 = [v3 conformsToType:*MEMORY[0x1E4F44418]];
  }

  return v7;
}

- (void)setFinished:(BOOL)a3
{
  if (self->_finished != a3)
  {
    [(QLThumbnailStoreRetrievalOperation *)self willChangeValueForKey:@"isFinished"];
    self->_finished = a3;
    [(QLThumbnailStoreRetrievalOperation *)self didChangeValueForKey:@"isFinished"];
  }
}

- (void)setExecuting:(BOOL)a3
{
  if (self->_executing != a3)
  {
    [(QLThumbnailStoreRetrievalOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = a3;
    [(QLThumbnailStoreRetrievalOperation *)self didChangeValueForKey:@"isExecuting"];
  }
}

- (BOOL)isConcurrent
{
  return 1;
}

- (QLThumbnailStoreRetrievalOperation)init
{
  return 0;
}

- (QLThumbnailStoreRetrievalOperation)initWithDocumentAtURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLThumbnailStoreRetrievalOperation;
  v6 = [(QLThumbnailStoreRetrievalOperation *)&v9 init];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_documentURL, a3);
    v7->_allowsThumbnailGeneration = 1;
  }

  return v7;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p;",
                 objc_opt_class(),
                 self);
  v4 = self;
  objc_sync_enter(v4);
  if ([(QLThumbnailStoreRetrievalOperation *)v4 isCancelled]) {
    [v3 appendString:@" cancelled"];
  }
  if ([(QLThumbnailStoreRetrievalOperation *)v4 isExecuting]) {
    [v3 appendString:@" executing"];
  }
  if ([(QLThumbnailStoreRetrievalOperation *)v4 isFinished]) {
    [v3 appendString:@" finished"];
  }
  objc_sync_exit(v4);

  [v3 appendString:@">"];

  return v3;
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)QLThumbnailStoreRetrievalOperation;
  [(QLThumbnailStoreRetrievalOperation *)&v2 cancel];
}

- (BOOL)_finishIfNeeded
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v2 = self;
  objc_sync_enter(v2);
  int v3 = [(QLThumbnailStoreRetrievalOperation *)v2 isCancelled];
  if (v3)
  {
    v4 = _log_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      v8 = v2;
      _os_log_impl(&dword_1B281E000, v4, OS_LOG_TYPE_INFO, "Finishing %@ because it is cancelled", (uint8_t *)&v7, 0xCu);
    }

    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    [(QLThumbnailStoreRetrievalOperation *)v2 _finishWithError:v5];
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)_finishBecauseGenerationFailedWithUnderlyingError:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v14 = *MEMORY[0x1E4F28A50];
    v15[0] = v4;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    v6 = 0;
  }
  int v7 = _log_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    documentURL = self->_documentURL;
    int v10 = 138412546;
    v11 = documentURL;
    __int16 v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B281E000, v7, OS_LOG_TYPE_INFO, "Finishing thumbnail store retrieval for %@ because generation failed with %@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLThumbnailErrorDomain" code:0 userInfo:v6];
  [(QLThumbnailStoreRetrievalOperation *)self _finishWithError:v9];
}

- (void)start
{
  int v3 = (OS_os_activity *)_os_activity_create(&dword_1B281E000, "!quicklook/thumbnail-retrieval", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  retrievalActivity = self->_retrievalActivity;
  self->_retrievalActivity = v3;

  [(QLThumbnailStoreRetrievalOperation *)self setExecuting:1];
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_retrievalActivity, &v5);
  [(QLThumbnailStoreRetrievalOperation *)self main];
  os_activity_scope_leave(&v5);
}

- (void)_generateThumbnail
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v3 = (OS_os_activity *)_os_activity_create(&dword_1B281E000, "!quicklook/thumbnail-generation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  generationActivity = self->_generationActivity;
  self->_generationActivity = v3;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_generationActivity, &state);
  os_activity_scope_state_s v5 = NSTemporaryDirectory();
  v6 = [v5 stringByAppendingString:@"QuickLookThumbnail.XXXXXX.jpg"];
  [v6 getFileSystemRepresentation:v16 maxLength:1024];

  uint64_t v7 = mkstemps(v16, 4);
  if ((v7 & 0x80000000) != 0)
  {
    int v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
    [(QLThumbnailStoreRetrievalOperation *)self _finishBecauseGenerationFailedWithUnderlyingError:v10];
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v16 isDirectory:0 relativeToURL:0];
    destinationURL = self->_destinationURL;
    self->_destinationURL = v8;

    int v10 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v7 closeOnDealloc:1];
    v11 = -[QLThumbnailGenerationRequest initWithFileAtURL:size:scale:representationTypes:]([QLThumbnailGenerationRequest alloc], "initWithFileAtURL:size:scale:representationTypes:", self->_documentURL, 4, 1024.0, 1024.0, 1.0);
    __int16 v12 = +[QLThumbnailGenerator sharedGenerator];
    uint64_t v13 = *MEMORY[0x1E4F44410];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__QLThumbnailStoreRetrievalOperation__generateThumbnail__block_invoke;
    v14[3] = &unk_1E6009CF0;
    v14[4] = self;
    [v12 saveBestRepresentationForRequest:v11 toFileHandle:v10 asContentType:v13 allowingThumbnailDownloads:0 completionHandler:v14];
  }
  os_activity_scope_leave(&state);
}

void __56__QLThumbnailStoreRetrievalOperation__generateThumbnail__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    int v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v4 = [*(id *)(a1 + 32) destinationURL];
    [v3 removeItemAtURL:v4 error:0];

    [*(id *)(a1 + 32) _finishWithError:v5];
  }
  else
  {
    [*(id *)(a1 + 32) _afterThumbnailIsGenerated];
  }
}

- (void)_afterDeterminingWhetherWeCanGenerate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  addition = self->_addition;
  if (addition) {
    BOOL v6 = !a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = [[QLThumbnailVersion alloc] initWithFileURL:self->_documentURL automaticallyGenerated:1];
    v8 = _log_0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      documentURL = self->_documentURL;
      v21 = [(QLThumbnailAddition *)self->_addition thumbnailVersion];
      int v22 = 138412802;
      v23 = documentURL;
      __int16 v24 = 2112;
      v25 = v21;
      __int16 v26 = 2112;
      v27 = v7;
      _os_log_debug_impl(&dword_1B281E000, v8, OS_LOG_TYPE_DEBUG, "%@: Stored thumbnail version: %@, proposed version: %@", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v9 = [(QLThumbnailAddition *)self->_addition thumbnailVersion];
    if (!v9
      || (int v10 = (void *)v9,
          [(QLThumbnailAddition *)self->_addition thumbnailVersion],
          v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 shouldBeInvalidatedByThumbnailWithVersion:v7],
          v11,
          v10,
          v12))
    {
      uint64_t v13 = _log_0();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1B281E000, v13, OS_LOG_TYPE_INFO, "Invalidating existing version. Regenerating a thumbnail.", (uint8_t *)&v22, 2u);
      }

      uint64_t v14 = self->_addition;
      self->_addition = 0;
    }
    addition = self->_addition;
  }
  if (addition)
  {
    [(QLThumbnailStoreRetrievalOperation *)self _finishWithError:0];
  }
  else
  {
    v15 = _log_0();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v16)
      {
        uint64_t v17 = self->_documentURL;
        int v22 = 138412290;
        v23 = v17;
        _os_log_impl(&dword_1B281E000, v15, OS_LOG_TYPE_INFO, "No addition for %@, trying generation", (uint8_t *)&v22, 0xCu);
      }

      [(QLThumbnailStoreRetrievalOperation *)self _generateThumbnail];
    }
    else
    {
      if (v16)
      {
        v18 = self->_documentURL;
        int v22 = 138412290;
        v23 = v18;
        _os_log_impl(&dword_1B281E000, v15, OS_LOG_TYPE_INFO, "No addition for %@ and generation not possible", (uint8_t *)&v22, 0xCu);
      }

      v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLThumbnailErrorDomain" code:106 userInfo:0];
      [(QLThumbnailStoreRetrievalOperation *)self _finishWithError:v19];
    }
  }
}

- (void)main
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1B281E000, v0, v1, "QLThumbnailStoreRetrievalOperation for %@", v2, v3, v4, v5, v6);
}

uint64_t __42__QLThumbnailStoreRetrievalOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2 = _log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __42__QLThumbnailStoreRetrievalOperation_main__block_invoke_cold_1();
  }

  return [*(id *)(a1 + 32) _afterDeterminingWhetherWeCanGenerate:0];
}

uint64_t __42__QLThumbnailStoreRetrievalOperation_main__block_invoke_45(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _afterDeterminingWhetherWeCanGenerate:a2];
}

- (void)_afterThumbnailIsGenerated
{
  OUTLINED_FUNCTION_1_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Could NOT associate an iCloud Drive thumbnail for %@: %@");
}

- (void)afterThumbnailIsPutInGenstore
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (![(QLThumbnailStoreRetrievalOperation *)v2 _finishIfNeeded])
  {
    uint64_t v3 = [QLThumbnailAddition alloc];
    documentURL = v2->_documentURL;
    id v8 = 0;
    uint64_t v5 = [(QLThumbnailAddition *)v3 initWithAdditionsPresentOnURL:documentURL error:&v8];
    id v6 = v8;
    addition = v2->_addition;
    v2->_addition = (QLThumbnailAddition *)v5;

    [(QLThumbnailStoreRetrievalOperation *)v2 _finishWithError:v6];
  }
  objc_sync_exit(v2);
}

- (void)_finishWithError:(id)a3
{
  if (!self->_addition) {
    [(QLThumbnailStoreRetrievalOperation *)self setError:a3];
  }
  [(QLThumbnailStoreRetrievalOperation *)self setExecuting:0];

  [(QLThumbnailStoreRetrievalOperation *)self setFinished:1];
}

- (NSDictionary)thumbnailImagesDictionary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  addition = self->_addition;
  if (addition)
  {
    uint64_t v4 = [(QLThumbnailAddition *)addition additionURL];

    if (v4)
    {
      uint64_t v5 = *MEMORY[0x1E4F1C500];
      uint64_t v6 = [(QLThumbnailAddition *)self->_addition thumbnailURLForKey:*MEMORY[0x1E4F1C500]];
      uint64_t v7 = (void *)v6;
      if (v6)
      {
        uint64_t v9 = v5;
        v10[0] = v6;
        uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      }
      else
      {
        uint64_t v4 = 0;
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSData)serializedQuickLookMetadataDictionary
{
  addition = self->_addition;
  if (addition
    && ([(QLThumbnailAddition *)addition metadata],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28F98];
    uint64_t v6 = [(QLThumbnailAddition *)self->_addition metadata];
    uint64_t v7 = [v5 dataWithPropertyList:v6 format:200 options:0 error:0];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (NSData *)v7;
}

- (GSAddition)genStoreAddition
{
  return [(QLThumbnailAddition *)self->_addition genStoreAddition];
}

- (BOOL)thumbnailWasAutomaticallyGenerated
{
  uint64_t v2 = [(QLThumbnailAddition *)self->_addition thumbnailVersion];
  char v3 = [v2 isAutomaticallyGenerated];

  return v3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 256, 1);
}

- (void)setError:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)allowsThumbnailGeneration
{
  return self->_allowsThumbnailGeneration;
}

- (void)setAllowsThumbnailGeneration:(BOOL)a3
{
  self->_allowsThumbnailGeneration = a3;
}

- (BOOL)generateThumbnailsAtBackgroundPriority
{
  return self->_generateThumbnailsAtBackgroundPriority;
}

- (void)setGenerateThumbnailsAtBackgroundPriority:(BOOL)a3
{
  self->_generateThumbnailsAtBackgroundPriority = a3;
}

- (BOOL)thumbnailWasJustAutomaticallyGenerated
{
  return self->_thumbnailWasJustAutomaticallyGenerated;
}

- (QLThumbnailAddition)addition
{
  return (QLThumbnailAddition *)objc_getProperty(self, a2, 288, 1);
}

- (QLThumbnailGenerationRequest)thumbnailRequest
{
  return (QLThumbnailGenerationRequest *)objc_getProperty(self, a2, 296, 1);
}

- (void)setThumbnailRequest:(id)a3
{
}

- (NSURL)documentURL
{
  return (NSURL *)objc_getProperty(self, a2, 248, 1);
}

- (void)setDocumentURL:(id)a3
{
}

- (NSURL)destinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 304, 1);
}

- (void)setDestinationURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_thumbnailRequest, 0);
  objc_storeStrong((id *)&self->_addition, 0);
  objc_storeStrong((id *)&self->_generationActivity, 0);
  objc_storeStrong((id *)&self->_retrievalActivity, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_documentURL, 0);
}

void __42__QLThumbnailStoreRetrievalOperation_main__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B281E000, v0, OS_LOG_TYPE_ERROR, "Could not reach the thumbnails generation service to generate thumbnail for %@", v1, 0xCu);
}

@end