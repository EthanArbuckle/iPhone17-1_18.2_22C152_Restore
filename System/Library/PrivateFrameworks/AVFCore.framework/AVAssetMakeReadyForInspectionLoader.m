@interface AVAssetMakeReadyForInspectionLoader
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (AVAssetMakeReadyForInspectionLoader)initWithURL:(id)a3;
- (BOOL)_inspectionRequiresAFormatReader;
- (BOOL)_isStreaming;
- (BOOL)_providesAccurateTiming;
- (BOOL)_statusOfValuesIsTerminalWhileMutexLockedForKeys:(id)a3;
- (BOOL)_updateStatusWhileMutexLocked:(int64_t)a3 figErrorCode:(int)a4;
- (BOOL)hasProtectedContent;
- (BOOL)isComposable;
- (BOOL)isExportable;
- (BOOL)isPlayable;
- (BOOL)isReadable;
- (OpaqueFigFormatReader)_copyFormatReader;
- (OpaqueFigFormatReader)_copyFormatReaderFromFigObjectWithFigErrorCode:(int *)a3;
- (OpaqueFigPlaybackItem)_playbackItem;
- (OpaqueFigSimpleMutex)_loadingMutex;
- (id)URL;
- (id)_dictionaryOfSpecialGettersForKeyValueStatus;
- (id)_dictionaryOfSpecialLoadingMethodsForKeys;
- (id)_getAndPruneCompletionsWhileMutexLocked;
- (id)_loadValuesUsingDefaultLoadingMethodWhileMutexLockedForKeys:(id)a3;
- (id)_loadValuesWhileMutexLockedForKeys:(id)a3;
- (id)_statusOfValueForKeyThatIsAlwaysLoaded;
- (id)assetInspector;
- (id)figChapterGroupInfo;
- (id)lyrics;
- (int64_t)_status;
- (int64_t)_statusOfValueWhileMutexLockedForKey:(id)a3 error:(id *)a4;
- (int64_t)firstFragmentSequenceNumber;
- (int64_t)fragmentCount;
- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4;
- (void)_serverHasDied;
- (void)_setStatus:(int64_t)a3 figErrorCode:(int)a4;
- (void)cancelLoading;
- (void)dealloc;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4;
@end

@implementation AVAssetMakeReadyForInspectionLoader

- (AVAssetMakeReadyForInspectionLoader)initWithURL:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAssetMakeReadyForInspectionLoader;
  v4 = [(AVAssetInspectorLoader *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_status = 0;
    v4->_loadingMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v5->_URL = (NSURL *)[a3 copy];
  }
  return v5;
}

- (void)dealloc
{
  formatReader = self->_formatReader;
  if (formatReader) {
    CFRelease(formatReader);
  }
  if (self->_loadingMutex) {
    FigSimpleMutexDestroy();
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAssetMakeReadyForInspectionLoader;
  [(AVAssetInspectorLoader *)&v4 dealloc];
}

- (id)assetInspector
{
  objc_super v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (void)cancelLoading
{
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  result = self->_formatReader;
  if (result) {
    goto LABEL_5;
  }
  objc_super v4 = [(AVAssetMakeReadyForInspectionLoader *)self _copyFormatReaderFromFigObjectWithFigErrorCode:0];
  if (v4) {
    CFRelease(v4);
  }
  [(AVAssetMakeReadyForInspectionLoader *)self _setStatus:2 figErrorCode:0];
  result = self->_formatReader;
  if (result)
  {
LABEL_5:
    return (OpaqueFigFormatReader *)CFRetain(result);
  }
  return result;
}

- (OpaqueFigSimpleMutex)_loadingMutex
{
  return self->_loadingMutex;
}

- (BOOL)_providesAccurateTiming
{
  return 0;
}

- (OpaqueFigFormatReader)_copyFormatReaderFromFigObjectWithFigErrorCode:(int *)a3
{
  v6 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v6);
  if (a3) {
    *a3 = 0;
  }
  return 0;
}

- (BOOL)_inspectionRequiresAFormatReader
{
  return 1;
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return 0;
}

- (id)_statusOfValueForKeyThatIsAlwaysLoaded
{
  return (id)[MEMORY[0x1E4F28ED0] numberWithInt:2];
}

- (id)_dictionaryOfSpecialGettersForKeyValueStatus
{
  objc_super v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (int64_t)_statusOfValueWhileMutexLockedForKey:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend(-[AVAssetMakeReadyForInspectionLoader _dictionaryOfSpecialGettersForKeyValueStatus](self, "_dictionaryOfSpecialGettersForKeyValueStatus"), "objectForKey:", a3);
  if (v6)
  {
    uint64_t v10 = 0;
    [v6 getValue:&v10];
    int64_t status = (int)objc_msgSend((id)-[AVAssetMakeReadyForInspectionLoader performSelector:](self, "performSelector:", v10), "intValue");
    if (!a4) {
      return status;
    }
  }
  else
  {
    int64_t status = self->_status;
    if (!a4) {
      return status;
    }
  }
  if (status == 3) {
    id v8 = [(AVAssetInspectorLoader *)self _createAVErrorForError:0 andFigErrorCode:self->_basicInspectionFailureCode];
  }
  else {
    id v8 = 0;
  }
  *a4 = v8;
  return status;
}

- (BOOL)_statusOfValuesIsTerminalWhileMutexLockedForKeys:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        if ([(AVAssetMakeReadyForInspectionLoader *)self _statusOfValueWhileMutexLockedForKey:*(void *)(*((void *)&v10 + 1) + 8 * v8) error:0] < 2)return 0; {
        ++v8;
        }
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (id)_getAndPruneCompletionsWhileMutexLocked
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  objc_super v4 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  keysAwaitingCompletion = self->_keysAwaitingCompletion;
  uint64_t v6 = [(NSMutableArray *)keysAwaitingCompletion countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(keysAwaitingCompletion);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (-[AVAssetMakeReadyForInspectionLoader _statusOfValuesIsTerminalWhileMutexLockedForKeys:](self, "_statusOfValuesIsTerminalWhileMutexLockedForKeys:", [v10 objectForKey:@"keys"]))
        {
          uint64_t v11 = [v10 objectForKey:@"handler"];
          if (v11) {
            [v3 addObject:v11];
          }
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [(NSMutableArray *)keysAwaitingCompletion countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  [(NSMutableArray *)self->_keysAwaitingCompletion removeObjectsInArray:v4];
  if ([v3 count]) {
    return v3;
  }
  else {
    return 0;
  }
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  MEMORY[0x199715030](self->_loadingMutex, a2);
  int64_t v7 = [(AVAssetMakeReadyForInspectionLoader *)self _statusOfValueWhileMutexLockedForKey:a3 error:a4];
  MEMORY[0x199715040](self->_loadingMutex);
  return v7;
}

- (int64_t)_status
{
  return self->_status;
}

- (BOOL)_updateStatusWhileMutexLocked:(int64_t)a3 figErrorCode:(int)a4
{
  int v9 = a4;
  int64_t status = self->_status;
  switch(a3)
  {
    case 1:
      if (status <= 0)
      {
        int64_t v6 = 1;
        goto LABEL_13;
      }
      break;
    case 2:
      if (status <= 1)
      {
        if (self->_formatReader
          || (int64_t v7 = [(AVAssetMakeReadyForInspectionLoader *)self _copyFormatReaderFromFigObjectWithFigErrorCode:&v9], (self->_formatReader = v7) != 0)|| ![(AVAssetMakeReadyForInspectionLoader *)self _inspectionRequiresAFormatReader])
        {
          int64_t v6 = 2;
LABEL_13:
          self->_int64_t status = v6;
        }
        else
        {
          self->_int64_t status = 3;
          self->_basicInspectionFailureCode = v9;
        }
      }
      break;
    case 3:
      self->_basicInspectionFailureCode = a4;
      goto LABEL_10;
    case 4:
LABEL_10:
      if (status <= 2) {
        self->_int64_t status = a3;
      }
      break;
    default:
      return status != self->_status;
  }
  return status != self->_status;
}

- (void)_setStatus:(int64_t)a3 figErrorCode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  MEMORY[0x199715030](self->_loadingMutex, a2);
  if ([(AVAssetMakeReadyForInspectionLoader *)self _updateStatusWhileMutexLocked:a3 figErrorCode:v4])
  {
    id v7 = [(AVAssetMakeReadyForInspectionLoader *)self _getAndPruneCompletionsWhileMutexLocked];
  }
  else
  {
    id v7 = 0;
  }
  MEMORY[0x199715040](self->_loadingMutex);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11++) + 16))();
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)_loadValuesUsingDefaultLoadingMethodWhileMutexLockedForKeys:(id)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (id)_dictionaryOfSpecialLoadingMethodsForKeys
{
  if (getDictionaryOfSpecialLoadingMethodsForKeys_onceToken != -1) {
    dispatch_once(&getDictionaryOfSpecialLoadingMethodsForKeys_onceToken, &__block_literal_global_30);
  }
  return (id)getDictionaryOfSpecialLoadingMethodsForKeys_sSpecialLoadingMethodsForKeys;
}

- (id)_loadValuesWhileMutexLockedForKeys:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  int64_t v6 = (void *)[MEMORY[0x1E4F1CA80] setWithCapacity:0];
  id v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  id v8 = [(AVAssetMakeReadyForInspectionLoader *)self _dictionaryOfSpecialLoadingMethodsForKeys];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(a3);
        }
        uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v14 = [v8 objectForKey:v13];
        if (v14)
        {
          uint64_t v15 = v14;
          long long v16 = v6;
        }
        else
        {
          long long v16 = v7;
          uint64_t v15 = v13;
        }
        [v16 addObject:v15];
      }
      uint64_t v10 = [a3 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }
  if ([v7 count])
  {
    id v17 = [(AVAssetMakeReadyForInspectionLoader *)self _loadValuesUsingDefaultLoadingMethodWhileMutexLockedForKeys:a3];
    if (v17) {
      [v5 addObjectsFromArray:v17];
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v6);
        }
        v22 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        uint64_t v25 = 0;
        [v22 getValue:&v25];
        uint64_t v23 = [(AVAssetMakeReadyForInspectionLoader *)self performSelector:v25];
        if (v23) {
          [v5 addObjectsFromArray:v23];
        }
      }
      uint64_t v19 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v19);
  }
  return v5;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
LABEL_4:
    if (a4)
    {
      id v7 = (void (*)(id))*((void *)a4 + 2);
      v7(a4);
    }
    return;
  }
  MEMORY[0x199715030](self->_loadingMutex, a2);
  if ([(AVAssetMakeReadyForInspectionLoader *)self _statusOfValuesIsTerminalWhileMutexLockedForKeys:a3])
  {
    MEMORY[0x199715040](self->_loadingMutex);
    goto LABEL_4;
  }
  if (!self->_keysAwaitingCompletion) {
    self->_keysAwaitingCompletion = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  }
  id v8 = (void *)[a4 copy];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a3, @"keys", v8, @"handler", 0);

  [(NSMutableArray *)self->_keysAwaitingCompletion addObject:v9];
  if (objc_msgSend(-[AVAssetMakeReadyForInspectionLoader _loadValuesWhileMutexLockedForKeys:](self, "_loadValuesWhileMutexLockedForKeys:", a3), "count"))
  {
    id v10 = [(AVAssetMakeReadyForInspectionLoader *)self _getAndPruneCompletionsWhileMutexLocked];
  }
  else
  {
    id v10 = 0;
  }
  MEMORY[0x199715040](self->_loadingMutex);
  if ([v10 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * i) + 16))();
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  result = [(AVAssetMakeReadyForInspectionLoader *)self assetInspector];
  if (result)
  {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result duration];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }
  return result;
}

- (id)lyrics
{
  id v2 = [(AVAssetMakeReadyForInspectionLoader *)self assetInspector];
  return (id)[v2 lyrics];
}

- (id)figChapterGroupInfo
{
  return 0;
}

- (BOOL)isPlayable
{
  return 1;
}

- (BOOL)isExportable
{
  return 0;
}

- (BOOL)isReadable
{
  return 0;
}

- (BOOL)isComposable
{
  return 0;
}

- (BOOL)hasProtectedContent
{
  return 0;
}

- (BOOL)_isStreaming
{
  return 1;
}

- (int64_t)firstFragmentSequenceNumber
{
  return 0;
}

- (int64_t)fragmentCount
{
  return 0;
}

- (void)_serverHasDied
{
}

- (id)URL
{
  return self->_URL;
}

@end