@interface AVAssetWriterFinishWritingHelper
- (AVAssetWriterFinishWritingHelper)initWithConfigurationState:(id)a3 finishWritingOperations:(id)a4 figAssetWriterCallbackContextToken:(void *)a5 figAssetWriter:(OpaqueFigAssetWriter *)a6;
- (BOOL)_isDefunct;
- (NSOperation)transitionToTerminalStatusOperation;
- (int64_t)status;
- (void)_finishWritingOperationsDidFinish;
- (void)cancelWriting;
- (void)dealloc;
@end

@implementation AVAssetWriterFinishWritingHelper

- (AVAssetWriterFinishWritingHelper)initWithConfigurationState:(id)a3 finishWritingOperations:(id)a4 figAssetWriterCallbackContextToken:(void *)a5 figAssetWriter:(OpaqueFigAssetWriter *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v11 = [[AVWeakReference alloc] initWithReferencedObject:self];
  v25.receiver = self;
  v25.super_class = (Class)AVAssetWriterFinishWritingHelper;
  v12 = [(AVAssetWriterHelper *)&v25 initWithConfigurationState:a3];
  if (v12)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __137__AVAssetWriterFinishWritingHelper_initWithConfigurationState_finishWritingOperations_figAssetWriterCallbackContextToken_figAssetWriter___block_invoke;
    v24[3] = &unk_1E57B1E80;
    v24[4] = v11;
    v13 = +[NSBlockOperation blockOperationWithBlock:v24];
    [(AVWorkaroundNSBlockOperation *)v13 setName:@"Transition to terminal status"];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = [a4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(a4);
          }
          [(AVWorkaroundNSBlockOperation *)v13 addDependency:*(void *)(*((void *)&v20 + 1) + 8 * v17++)];
        }
        while (v15 != v17);
        uint64_t v15 = [a4 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v15);
    }
    v12->_finishWritingOperations = (NSArray *)[a4 copy];
    v12->_transitionToTerminalStatusOperation = (NSOperation *)v13;
    v12->_figAssetWriterCallbackContextToken = a5;
    if (a6) {
      v18 = (OpaqueFigAssetWriter *)CFRetain(a6);
    }
    else {
      v18 = 0;
    }
    v12->_figAssetWriter = v18;
  }

  return v12;
}

uint64_t __137__AVAssetWriterFinishWritingHelper_initWithConfigurationState_finishWritingOperations_figAssetWriterCallbackContextToken_figAssetWriter___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) referencedObject];
  return [v1 _finishWritingOperationsDidFinish];
}

- (void)dealloc
{
  if (self->_figAssetWriterCallbackContextToken)
  {
    objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "unregisterCallbackContextForToken:", self->_figAssetWriterCallbackContextToken);
    self->_figAssetWriterCallbackContextToken = 0;
  }
  figAssetWriter = self->_figAssetWriter;
  if (figAssetWriter) {
    CFRelease(figAssetWriter);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterFinishWritingHelper;
  [(AVAssetWriterHelper *)&v4 dealloc];
}

- (void)_finishWritingOperationsDidFinish
{
  uint64_t v5 = 0;
  int64_t v3 = +[AVOperation statusOfOperations:self->_finishWritingOperations error:&v5];
  if (v3 == 4)
  {
    [(AVAssetWriterHelper *)self transitionToFailedStatusWithError:v5];
  }
  else if (v3 == 2)
  {
    [(AVAssetWriterHelper *)self _transitionToClientInitiatedTerminalStatus:2];
  }
  else
  {
    [(AVAssetWriterHelper *)self _transitionToClientInitiatedTerminalStatus:4];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", 0), "removeItemAtURL:error:", -[AVAssetWriterHelper outputURL](self, "outputURL"), &v4);
  }
}

- (void)cancelWriting
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  finishWritingOperations = self->_finishWritingOperations;
  uint64_t v3 = [(NSArray *)finishWritingOperations countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(finishWritingOperations);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) cancel];
      }
      uint64_t v4 = [(NSArray *)finishWritingOperations countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (int64_t)status
{
  return 1;
}

- (BOOL)_isDefunct
{
  unsigned __int8 v9 = 0;
  figAssetWriter = self->_figAssetWriter;
  uint64_t v3 = *(void **)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  if (*v4 < 5uLL)
  {
    int v6 = 0;
    LOBYTE(v5) = 0;
  }
  else
  {
    uint64_t v5 = (unsigned int (*)(OpaqueFigAssetWriter *, unsigned __int8 *))v4[11];
    if (v5)
    {
      LOBYTE(v5) = v5(figAssetWriter, &v9) == 0;
      int v6 = v9;
    }
    else
    {
      int v6 = 0;
    }
  }
  if (v5) {
    int v7 = v6;
  }
  else {
    int v7 = 1;
  }
  if (!v6) {
    int v6 = v7;
  }
  return v6 == 1;
}

- (NSOperation)transitionToTerminalStatusOperation
{
  return self->_transitionToTerminalStatusOperation;
}

@end