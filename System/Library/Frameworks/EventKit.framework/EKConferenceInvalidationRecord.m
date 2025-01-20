@interface EKConferenceInvalidationRecord
- (NSMutableArray)waitingCompletionHandlers;
- (NSMutableSet)replacementForURLs;
- (NSURL)validURL;
- (void)finishWithURL:(id)a3 error:(id)a4;
- (void)generateNewValidURLForOriginalURL:(id)a3;
- (void)setReplacementForURLs:(id)a3;
- (void)setValidURL:(id)a3;
- (void)setWaitingCompletionHandlers:(id)a3;
@end

@implementation EKConferenceInvalidationRecord

- (void)generateNewValidURLForOriginalURL:(id)a3
{
  id v4 = a3;
  if (generateNewValidURLForOriginalURL__onceToken != -1) {
    dispatch_once(&generateNewValidURLForOriginalURL__onceToken, &__block_literal_global_132);
  }
  uint64_t v5 = generateNewValidURLForOriginalURL__generationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__EKConferenceInvalidationRecord_generateNewValidURLForOriginalURL___block_invoke_2;
  v7[3] = &unk_1E5B9A6B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[EKConferenceUtils _findRoomTypeForURL:v6 queue:v5 completionHandler:v7];
}

void __68__EKConferenceInvalidationRecord_generateNewValidURLForOriginalURL___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.eventkit.ConferenceCreationQueue", v2);
  v1 = (void *)generateNewValidURLForOriginalURL__generationQueue;
  generateNewValidURLForOriginalURL__generationQueue = (uint64_t)v0;
}

void __68__EKConferenceInvalidationRecord_generateNewValidURLForOriginalURL___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__EKConferenceInvalidationRecord_generateNewValidURLForOriginalURL___block_invoke_3;
    v6[3] = &unk_1E5B9A690;
    id v4 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v4;
    +[EKVirtualConference virtualConferenceForRoomType:a2 completion:v6 queue:generateNewValidURLForOriginalURL__generationQueue];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    [v5 finishWithURL:0 error:a3];
  }
}

void __68__EKConferenceInvalidationRecord_generateNewValidURLForOriginalURL___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = [a2 joinMethods];
    uint64_t v5 = [v4 firstObject];
    id v6 = [v5 URL];

    id v7 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138412546;
      v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_DEFAULT, "Generated URL %@ to replace %@", (uint8_t *)&v10, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithURL:v6 error:0];
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    [v9 finishWithURL:0 error:a3];
  }
}

- (void)finishWithURL:(id)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_invalidationLock);
  objc_storeStrong((id *)&self->_validURL, a3);
  v9 = self->_waitingCompletionHandlers;
  waitingCompletionHandlers = self->_waitingCompletionHandlers;
  self->_waitingCompletionHandlers = 0;

  v11 = (void *)[(NSMutableSet *)self->_replacementForURLs copy];
  os_unfair_lock_unlock((os_unfair_lock_t)&_invalidationLock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  __int16 v12 = v9;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v16) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * v16));
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (NSURL)validURL
{
  return self->_validURL;
}

- (void)setValidURL:(id)a3
{
}

- (NSMutableSet)replacementForURLs
{
  return self->_replacementForURLs;
}

- (void)setReplacementForURLs:(id)a3
{
}

- (NSMutableArray)waitingCompletionHandlers
{
  return self->_waitingCompletionHandlers;
}

- (void)setWaitingCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_replacementForURLs, 0);

  objc_storeStrong((id *)&self->_validURL, 0);
}

@end