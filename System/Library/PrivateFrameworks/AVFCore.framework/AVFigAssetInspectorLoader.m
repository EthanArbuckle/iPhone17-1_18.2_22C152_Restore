@interface AVFigAssetInspectorLoader
+ (id)_figAssetMediaSelectionPropertiesArray;
+ (id)_figAssetPropertiesForKeys;
+ (id)_figAssetTrackMediaSelectionPropertiesArray;
+ (id)_figAssetTrackPropertiesForKeys;
+ (void)_mapAssetKeys:(id)a3 toFigAssetPropertySet:(id)a4 figAssetTrackPropertySet:(id)a5 callerName:(id)a6;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (AVFigAssetInspectorLoader)initWithFigAsset:(OpaqueFigAsset *)a3 forAsset:(id)a4;
- (AVFigAssetInspectorLoader)initWithURL:(id)a3 figAssetCreationFlags:(unint64_t)a4 figAssetCreationOptions:(id)a5 avAssetInitializationOptions:(id)a6 forAsset:(id)a7 figErr:(int *)a8;
- (BOOL)_isStreaming;
- (BOOL)_prefersNominalDurations;
- (BOOL)hasProtectedContent;
- (BOOL)isAssociatedWithFragmentMinder;
- (BOOL)isCompatibleWithSavedPhotosAlbum;
- (BOOL)isComposable;
- (BOOL)isExportable;
- (BOOL)isPlayable;
- (BOOL)isReadable;
- (Class)_classForTrackInspectors;
- (OpaqueFigAsset)_figAsset;
- (OpaqueFigFormatReader)_copyFormatReader;
- (OpaqueFigSimpleMutex)_loadingMutex;
- (double)_fragmentMindingInterval;
- (id)URL;
- (id)_completionHandlerQueue;
- (id)_loadingBatches;
- (id)asset;
- (id)assetInspector;
- (id)contentKeySpecifiersEligibleForPreloading;
- (id)figChapterGroupInfo;
- (id)figChapters;
- (id)lyrics;
- (id)originalNetworkContentURL;
- (id)resolvedURL;
- (id)variants;
- (int64_t)_loadStatusForProperty:(id)a3 figAsset:(OpaqueFigAsset *)a4 error:(id *)a5;
- (int64_t)_statusOfValueForKey:(id)a3 error:(id *)a4 firstNonLoadedDependencyKey:(id *)a5;
- (int64_t)firstFragmentSequenceNumber;
- (int64_t)fragmentCount;
- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4;
- (unint64_t)downloadToken;
- (void)_addFigAssetNotifications;
- (void)_ensureAllDependenciesOfKeyAreLoaded:(id)a3;
- (void)_invokeCompletionHandlerForLoadingBatches:(id)a3;
- (void)_removeFigAssetNotifications;
- (void)_setFragmentMindingInterval:(double)a3;
- (void)_setIsAssociatedWithFragmentMinder:(BOOL)a3;
- (void)cancelLoading;
- (void)dealloc;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 keysForCollectionKeys:(id)a4 completionHandler:(id)a5;
@end

@implementation AVFigAssetInspectorLoader

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  result = [(AVFigAssetInspectorLoader *)self assetInspector];
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

- (BOOL)_isStreaming
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return [v2 _isStreaming];
}

- (id)assetInspector
{
  assetInspectorOnce = self->_assetInspectorOnce;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AVFigAssetInspectorLoader_assetInspector__block_invoke;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  [(AVDispatchOnce *)assetInspectorOnce runBlockOnce:v5];
  return self->_assetInspector;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 keysForCollectionKeys:(id)a4 completionHandler:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A80)
  {
    unsigned int valuePtr = 0;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v50 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v51 = *MEMORY[0x1E4F1C3C8];
      v52 = "(keys == nil) || [keys isKindOfClass:[NSArray class]]";
      goto LABEL_73;
    }
  }
  if (!a4) {
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v50 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v51 = *MEMORY[0x1E4F1C3C8];
    v52 = "[keysForCollectionKeys isKindOfClass:[NSDictionary class]]";
LABEL_73:
    v53 = (void *)[v50 exceptionWithName:v51, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)v52), 0 reason userInfo];
    objc_exception_throw(v53);
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v15 = [a4 countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (!v15) {
    goto LABEL_15;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v61;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v61 != v17) {
        objc_enumerationMutation(a4);
      }
      objc_msgSend(a4, "objectForKey:", *(void *)(*((void *)&v60 + 1) + 8 * i), v54, v56);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v50 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v51 = *MEMORY[0x1E4F1C3C8];
        v52 = "[[keysForCollectionKeys objectForKey:thisKey] isKindOfClass:[NSArray class]]";
        goto LABEL_73;
      }
    }
    uint64_t v16 = [a4 countByEnumeratingWithState:&v60 objects:v65 count:16];
  }
  while (v16);
LABEL_15:
  MEMORY[0x199715030](self->_loadingMutex);
  v19 = [(AVFigAssetInspectorLoader *)self _figAsset];
  if ([a3 count])
  {
    if (!v19)
    {
LABEL_21:
      v20 = 0;
      goto LABEL_22;
    }
LABEL_20:
    if (self->_loadingCanceled) {
      goto LABEL_21;
    }
    v20 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    v25 = (void *)[MEMORY[0x1E4F1CA80] setWithCapacity:0];
    [v25 addObjectsFromArray:a3];
    if (a4) {
      objc_msgSend(v25, "addObjectsFromArray:", objc_msgSend(a4, "allKeys"));
    }
    v26 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", 0, v54);
    v27 = (void *)[MEMORY[0x1E4F1CA80] setWithCapacity:0];
    [(id)objc_opt_class() _mapAssetKeys:v25 toFigAssetPropertySet:v26 figAssetTrackPropertySet:v27 callerName:@"-[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:]"];
    if (a4)
    {
      uint64_t v28 = [a4 objectForKey:@"tracks"];
      if (v28)
      {
        v29 = (void *)v28;
        uint64_t v30 = dictionaryOfFigAssetTrackPropertiesForTrackKeys(self->_prefersNominalDurations);
        v31 = (void *)[MEMORY[0x1E4F1CA80] setWithCapacity:0];
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __101__AVFigAssetInspectorLoader_loadValuesAsynchronouslyForKeys_keysForCollectionKeys_completionHandler___block_invoke;
        v59[3] = &unk_1E57B65B0;
        v59[4] = v30;
        v59[5] = v27;
        v59[6] = v31;
        [v29 enumerateObjectsUsingBlock:v59];
        if ([v31 count]) {
          NSLog(&cfstr_AvassetLoadval_0.isa, [v31 allObjects]);
        }
      }
    }
    v32 = (void *)[v26 allObjects];
    if ([v32 count])
    {
      unsigned int valuePtr = 0;
      char v58 = 0;
      if (dword_1EB2D3A80)
      {
        v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v34 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v34) {
        uint64_t v35 = v34;
      }
      else {
        uint64_t v35 = 0;
      }
      v36 = *(uint64_t (**)(OpaqueFigAsset *, void *, char *, unsigned int *))(v35 + 16);
      if (v36) {
        int v37 = v36(v19, v32, &v58, &valuePtr);
      }
      else {
        int v37 = -12782;
      }
      if (dword_1EB2D3A80)
      {
        v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (!v37 && !v58)
      {
        CFNumberRef v39 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
        if (v39)
        {
          CFNumberRef v40 = v39;
          [v20 setObject:v39 forKey:@"AVAsynchronousLoadingPropertyBatchIDKey"];
          CFRelease(v40);
        }
      }
    }
    v41 = objc_msgSend(v27, "allObjects", v55, v56);
    if ([v41 count])
    {
      unsigned int valuePtr = 0;
      char v58 = 0;
      if (dword_1EB2D3A80)
      {
        v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v43 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v43) {
        uint64_t v44 = v43;
      }
      else {
        uint64_t v44 = 0;
      }
      v45 = *(uint64_t (**)(OpaqueFigAsset *, void, void *, char *, unsigned int *))(v44 + 80);
      if (v45) {
        int v46 = v45(v19, 0, v41, &v58, &valuePtr);
      }
      else {
        int v46 = -12782;
      }
      if (dword_1EB2D3A80)
      {
        v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (!v46 && !v58)
      {
        CFNumberRef v48 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
        if (v48)
        {
          CFNumberRef v49 = v48;
          [v20 setObject:v48 forKey:@"AVAsynchronousLoadingTrackPropertyBatchIDKey"];
          CFRelease(v49);
        }
      }
    }
  }
  else
  {
    v20 = 0;
    if ([a4 count] && v19) {
      goto LABEL_20;
    }
  }
LABEL_22:
  if (objc_msgSend(v20, "count", v54, v56))
  {
    if (a5)
    {
      v21 = (void *)[a5 copy];
      [v20 setObject:v21 forKey:@"AVAsynchronousLoadingCompletionHandlerKey"];
    }
    [(NSMutableArray *)self->_loadingBatches addObject:v20];
    MEMORY[0x199715040](self->_loadingMutex);
  }
  else
  {
    MEMORY[0x199715040](self->_loadingMutex);
    if (a5)
    {
      if (dword_1EB2D3A80)
      {
        unsigned int valuePtr = 0;
        v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v23 = valuePtr;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v24 = v23;
        }
        else {
          unsigned int v24 = v23 & 0xFFFFFFFE;
        }
        if (v24)
        {
          int v66 = 136315394;
          v67 = "-[AVFigAssetInspectorLoader loadValuesAsynchronouslyForKeys:keysForCollectionKeys:completionHandler:]";
          __int16 v68 = 2048;
          v69 = v20;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      (*((void (**)(id))a5 + 2))(a5);
    }
  }
}

+ (void)_mapAssetKeys:(id)a3 toFigAssetPropertySet:(id)a4 figAssetTrackPropertySet:(id)a5 callerName:(id)a6
{
  uint64_t v11 = [a1 _figAssetPropertiesForKeys];
  uint64_t v12 = [a1 _figAssetTrackPropertiesForKeys];
  uint64_t v13 = (void *)[MEMORY[0x1E4F1CA80] setWithCapacity:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __101__AVFigAssetInspectorLoader__mapAssetKeys_toFigAssetPropertySet_figAssetTrackPropertySet_callerName___block_invoke;
  v14[3] = &unk_1E57B6588;
  v14[4] = v11;
  v14[5] = v12;
  v14[6] = v13;
  v14[7] = a4;
  v14[8] = a5;
  [a3 enumerateObjectsUsingBlock:v14];
  if ([v13 count]) {
    NSLog(&cfstr_InvokedWithUnr.isa, a6, [v13 allObjects]);
  }
}

- (OpaqueFigSimpleMutex)_loadingMutex
{
  return self->_loadingMutex;
}

- (id)_loadingBatches
{
  return self->_loadingBatches;
}

- (void)_invokeCompletionHandlerForLoadingBatches:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v19 = *(void *)v21;
    do
    {
      uint64_t v5 = 0;
      uint64_t v16 = v4;
      do
      {
        if (*(void *)v21 != v19) {
          objc_enumerationMutation(a3);
        }
        v6 = *(void **)(*((void *)&v20 + 1) + 8 * v5);
        uint64_t v7 = objc_msgSend(v6, "objectForKey:", @"AVAsynchronousLoadingCompletionHandlerKey", v14, v15);
        if (v7)
        {
          v8 = (void *)v7;
          v9 = (void *)[v6 objectForKeyedSubscript:@"AVAsynchronousLoadingPropertyBatchIDKey"];
          if (v9) {
            [NSString stringWithFormat:@", batchID = %ld", objc_msgSend(v9, "longValue")];
          }
          uint64_t v11 = (void *)[v6 objectForKeyedSubscript:@"AVAsynchronousLoadingTrackPropertyBatchIDKey"];
          if (v11) {
            [NSString stringWithFormat:@", track batchID = %ld", objc_msgSend(v11, "longValue")];
          }
          if (dword_1EB2D3A80)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            uint64_t v4 = v16;
          }
          dispatch_async((dispatch_queue_t)self->_completionHandlerQueue, v8);
        }
        else if (dword_1EB2D3A80)
        {
          uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        ++v5;
      }
      while (v4 != v5);
      uint64_t v4 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }
  if (!objc_msgSend(a3, "count", v14, v15))
  {
    if (dword_1EB2D3A80)
    {
      uint64_t v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

+ (id)_figAssetTrackPropertiesForKeys
{
  if (ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce != -1) {
    dispatch_once(&ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce, &__block_literal_global_350);
  }
  return (id)sFigAssetTrackPropertiesForKeys;
}

uint64_t __101__AVFigAssetInspectorLoader__mapAssetKeys_toFigAssetPropertySet_figAssetTrackPropertySet_callerName___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:a2];
  uint64_t result = [*(id *)(a1 + 40) objectForKey:a2];
  if (v4 | result)
  {
    uint64_t v6 = result;
    if (v4) {
      uint64_t result = [*(id *)(a1 + 56) addObjectsFromArray:v4];
    }
    if (v6)
    {
      uint64_t v7 = *(void **)(a1 + 64);
      return [v7 addObjectsFromArray:v6];
    }
  }
  else
  {
    [*(id *)(a1 + 48) addObject:a2];
    v8 = *(void **)(a1 + 56);
    uint64_t v9 = *MEMORY[0x1E4F32230];
    return [v8 addObject:v9];
  }
  return result;
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  return [(AVFigAssetInspectorLoader *)self _statusOfValueForKey:a3 error:a4 firstNonLoadedDependencyKey:0];
}

- (int64_t)_statusOfValueForKey:(id)a3 error:(id *)a4 firstNonLoadedDependencyKey:(id *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v48 = 0;
  MEMORY[0x199715030](self->_loadingMutex, a2);
  uint64_t v9 = [(AVFigAssetInspectorLoader *)self _figAsset];
  if (self->_loadingCanceled)
  {
    uint64_t v10 = 0;
    int64_t v11 = 4;
    goto LABEL_49;
  }
  uint64_t v12 = v9;
  if (!v9)
  {
    id v29 = [(AVAssetInspectorLoader *)self _createAVErrorForError:0 andFigErrorCode:self->_figAssetCreationStatus];
    uint64_t v10 = 0;
    goto LABEL_48;
  }
  uint64_t v13 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_figAssetPropertiesForKeys"), "objectForKey:", a3);
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  if (!v13)
  {
    NSLog(&cfstr_AvassetStatuso.isa, a3);
    int64_t v11 = [(AVFigAssetInspectorLoader *)self _loadStatusForProperty:*MEMORY[0x1E4F32230] figAsset:v12 error:&v48];
    uint64_t v10 = 0;
    goto LABEL_49;
  }
  uint64_t v15 = (void *)v14;
  int v37 = a4;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v16 = [v13 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (!v16)
  {
    uint64_t v10 = 0;
    int64_t v11 = 2;
    goto LABEL_39;
  }
  uint64_t v17 = v16;
  v36 = a5;
  uint64_t v18 = *(void *)v45;
  int64_t v11 = 2;
  uint64_t v38 = *(void *)v45;
  CFNumberRef v39 = v13;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v45 != v18) {
        objc_enumerationMutation(v13);
      }
      uint64_t v10 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      if (v11 >= 3) {
        long long v20 = 0;
      }
      else {
        long long v20 = &v48;
      }
      uint64_t v21 = [(AVFigAssetInspectorLoader *)self _loadStatusForProperty:*(void *)(*((void *)&v44 + 1) + 8 * i) figAsset:v12 error:v20];
      if (v21 <= 1 && v11 != 3)
      {
        int64_t v11 = v21;
        goto LABEL_36;
      }
      if (v21 == 3)
      {
        if (![v10 isEqualToString:@"availableMediaCharacteristicsWithMediaSelectionOptions"])
        {
          [v15 addObject:v10];
LABEL_31:
          int64_t v11 = 3;
          continue;
        }
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v23 = +[AVFigAssetInspectorLoader _figAssetMediaSelectionPropertiesArray];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (!v24) {
          goto LABEL_31;
        }
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v41 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void *)(*((void *)&v40 + 1) + 8 * j);
            if (-[AVFigAssetInspectorLoader _loadStatusForProperty:figAsset:error:](self, "_loadStatusForProperty:figAsset:error:", v28, v12, 0) == 3)[v15 addObject:v28]; {
          }
            }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v49 count:16];
        }
        while (v25);
        int64_t v11 = 3;
        uint64_t v18 = v38;
        uint64_t v13 = v39;
      }
    }
    uint64_t v17 = [v13 countByEnumeratingWithState:&v44 objects:v50 count:16];
  }
  while (v17);
  uint64_t v10 = 0;
LABEL_36:
  a5 = v36;
LABEL_39:
  a4 = v37;
  if (v37)
  {
    BOOL v30 = v11 != 3 || v48 == 0;
    if (!v30 && v15 != 0)
    {
      v32 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(v48, "userInfo"));
      [v32 setObject:v15 forKey:@"AVErrorFailedDependenciesKey"];
      v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = [v48 domain];
      id v29 = (id)objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, objc_msgSend(v48, "code"), v32);
LABEL_48:
      id v48 = v29;
      int64_t v11 = 3;
    }
  }
LABEL_49:
  MEMORY[0x199715040](self->_loadingMutex);
  if (a4 && v11 == 3) {
    *a4 = v48;
  }
  if (a5) {
    *a5 = v10;
  }
  return v11;
}

- (OpaqueFigAsset)_figAsset
{
  return self->_figAsset;
}

+ (id)_figAssetPropertiesForKeys
{
  if (ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce != -1) {
    dispatch_once(&ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce, &__block_literal_global_350);
  }
  return (id)sFigAssetPropertiesForKeys;
}

- (int64_t)_loadStatusForProperty:(id)a3 figAsset:(OpaqueFigAsset *)a4 error:(id *)a5
{
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  int64_t v11 = *(uint64_t (**)(OpaqueFigAsset *, id, char *, uint64_t *, void **))(v10 + 8);
  if (v11)
  {
    unsigned int v12 = v11(a4, a3, (char *)&v20 + 4, &v20, &v19);
    uint64_t v13 = v19;
  }
  else
  {
    uint64_t v13 = 0;
    unsigned int v12 = -12782;
  }
  id v14 = v13;
  if (v12) {
    int v15 = 3;
  }
  else {
    int v15 = HIDWORD(v20);
  }
  if (a5 && v15 == 3)
  {
    if (HIDWORD(v20) == 3) {
      unsigned int v16 = v20;
    }
    else {
      unsigned int v16 = 0;
    }
    if (v12) {
      uint64_t v17 = v12;
    }
    else {
      uint64_t v17 = v16;
    }
    *a5 = -[AVAssetInspectorLoader _createAVErrorForError:andFigErrorCode:](self, "_createAVErrorForError:andFigErrorCode:", v14, v17, v19);
  }
  return v15;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
}

- (void)_ensureAllDependenciesOfKeyAreLoaded:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(AVFigAssetInspectorLoader *)self statusOfValueForKey:a3 error:0] <= 1)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    id v5 = objc_alloc_init(MEMORY[0x1E4F28BB0]);
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObject:a3];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__AVFigAssetInspectorLoader__ensureAllDependenciesOfKeyAreLoaded___block_invoke;
    v12[3] = &unk_1E57B2160;
    v12[4] = v5;
    v12[5] = &v13;
    [(AVFigAssetInspectorLoader *)self loadValuesAsynchronouslyForKeys:v6 completionHandler:v12];
    [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
    [v5 lock];
    if (!*((unsigned char *)v14 + 24))
    {
      double v7 = 5.0;
      do
      {
        objc_msgSend(v5, "waitUntilDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", v7, v9, v10));
        if (*((unsigned char *)v14 + 24)) {
          break;
        }
        uint64_t v11 = 0;
        [(AVFigAssetInspectorLoader *)self _statusOfValueForKey:a3 error:0 firstNonLoadedDependencyKey:&v11];
        if (dword_1EB2D3A80)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        double v7 = v7 + v7;
      }
      while (!*((unsigned char *)v14 + 24));
    }
    objc_msgSend(v5, "unlock", v9, v10);

    _Block_object_dispose(&v13, 8);
  }
}

- (Class)_classForTrackInspectors
{
  return (Class)objc_opt_class();
}

AVFigAssetInspector *__43__AVFigAssetInspectorLoader_assetInspector__block_invoke(uint64_t a1)
{
  uint64_t result = -[AVFigAssetInspector initWithFigAsset:]([AVFigAssetInspector alloc], "initWithFigAsset:", [*(id *)(a1 + 32) _figAsset]);
  *(void *)(*(void *)(a1 + 32) + 40) = result;
  return result;
}

- (BOOL)_prefersNominalDurations
{
  return self->_prefersNominalDurations;
}

- (AVFigAssetInspectorLoader)initWithURL:(id)a3 figAssetCreationFlags:(unint64_t)a4 figAssetCreationOptions:(id)a5 avAssetInitializationOptions:(id)a6 forAsset:(id)a7 figErr:(int *)a8
{
  unsigned int v12 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a5];
  if ([a7 _hasResourceLoaderDelegate])
  {
    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v12 setObject:v13 forKey:*MEMORY[0x1E4F31F70]];
  }
  id v14 = (void *)[a6 objectForKey:@"AVAssetRequiresInProcessOperationKey"];
  if (v14 && ([v14 BOOLValue] & 1) != 0) {
    int v15 = FigAssetCreateWithURL();
  }
  else {
    int v15 = FigAssetRemoteCreateWithURLAndRetry();
  }
  int v16 = v15;

  if (a8) {
    *a8 = v16;
  }
  return 0;
}

- (AVFigAssetInspectorLoader)initWithFigAsset:(OpaqueFigAsset *)a3 forAsset:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)AVFigAssetInspectorLoader;
  CFTypeRef cf = 0;
  uint64_t v6 = [(AVAssetInspectorLoader *)&v42 init];
  if (v6)
  {
    v6->_assetInspectorOnce = objc_alloc_init(AVDispatchOnce);
    v6->_weakReferenceToAsset = (AVWeakReference *)(id)[a4 _weakReference];
    if (a3) {
      double v7 = (OpaqueFigAsset *)CFRetain(a3);
    }
    else {
      double v7 = 0;
    }
    v6->_figAsset = v7;
    v6->_loadingMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v6->_loadingBatches = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.avfoundation.avasset.completionsQueue", v8);
    v6->_completionHandlerQueue = (OS_dispatch_queue *)v9;
    if (v6->_loadingMutex && v6->_loadingBatches && v9)
    {
      if (v6->_figAsset)
      {
        long long v41 = 0;
        [(AVFigAssetInspectorLoader *)v6 _addFigAssetNotifications];
        uint64_t v10 = *MEMORY[0x1E4F1CF80];
        uint64_t CMBaseObject = FigAssetGetCMBaseObject();
        uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v12) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        int v15 = *(void (**)(uint64_t, void, uint64_t, NSURL **))(v13 + 48);
        if (v15) {
          v15(CMBaseObject, *MEMORY[0x1E4F32200], v10, &v41);
        }
        v6->_URL = v41;
        uint64_t v16 = FigAssetGetCMBaseObject();
        uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v17) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = 0;
        }
        uint64_t v19 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v18 + 48);
        if (v19)
        {
          v19(v16, *MEMORY[0x1E4F321F0], v10, &cf);
          uint64_t v20 = (void *)cf;
        }
        else
        {
          uint64_t v20 = 0;
        }
        v6->_prefersNominalDurations = ((unsigned __int16)[v20 longLongValue] >> 8) & 1;
        figAsset = v6->_figAsset;
        id v22 = +[AVFigAssetInspectorLoader _figAssetTrackMediaSelectionPropertiesArray];
        id v23 = *(void **)(CMBaseObjectGetVTable() + 16);
        if (v23) {
          uint64_t v24 = v23;
        }
        else {
          uint64_t v24 = 0;
        }
        if (*v24 >= 2uLL)
        {
          uint64_t v25 = (void (*)(OpaqueFigAsset *, __CFString *, id))v24[13];
          if (v25) {
            v25(figAsset, @"trackPropertyForMediaSelectionOptions", v22);
          }
        }
        uint64_t v26 = objc_msgSend(+[AVFigAssetInspectorLoader _figAssetMediaSelectionPropertiesArray](AVFigAssetInspectorLoader, "_figAssetMediaSelectionPropertiesArray"), "arrayByAddingObject:", @"trackPropertyForMediaSelectionOptions");
        v27 = v6->_figAsset;
        uint64_t v28 = *(void **)(CMBaseObjectGetVTable() + 16);
        if (v28) {
          id v29 = v28;
        }
        else {
          id v29 = 0;
        }
        if (*v29 >= 2uLL)
        {
          BOOL v30 = (void (*)(OpaqueFigAsset *, __CFString *, uint64_t))v29[11];
          if (v30) {
            v30(v27, @"availableMediaCharacteristicsWithMediaSelectionOptions", v26);
          }
        }
        v31 = v6->_figAsset;
        v45[0] = *MEMORY[0x1E4F34868];
        uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
        v33 = *(void **)(CMBaseObjectGetVTable() + 16);
        if (v33) {
          uint64_t v34 = v33;
        }
        else {
          uint64_t v34 = 0;
        }
        if (*v34 >= 2uLL)
        {
          uint64_t v35 = (void (*)(OpaqueFigAsset *, __CFString *, uint64_t))v34[13];
          if (v35) {
            v35(v31, @"trackPropertyForPlaybackCapabilities", v32);
          }
        }
        uint64_t v44 = *MEMORY[0x1E4F32248];
        uint64_t v36 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v44, 1), "arrayByAddingObject:", @"trackPropertyForPlaybackCapabilities");
        int v37 = v6->_figAsset;
        uint64_t v38 = *(void **)(CMBaseObjectGetVTable() + 16);
        if (v38) {
          CFNumberRef v39 = v38;
        }
        else {
          CFNumberRef v39 = 0;
        }
        if (*v39 >= 2uLL)
        {
          long long v40 = (void (*)(OpaqueFigAsset *, __CFString *, uint64_t))v39[11];
          if (v40) {
            v40(v37, @"playbackCapabilities", v36);
          }
        }
        if (cf) {
          CFRelease(cf);
        }
      }
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)_addFigAssetNotifications
{
  if (self->_figAsset)
  {
    if (!self->_registeredForFigAssetNotifications)
    {
      id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
      uint64_t v4 = [(AVAssetInspectorLoader *)self _weakReference];
      CFRetain(v4);
      [v3 addListenerWithWeakReference:v4 callback:handleFigAssetLoadingNotification name:*MEMORY[0x1E4F31EA8] object:self->_figAsset flags:0];
      [v3 addListenerWithWeakReference:v4 callback:handleAndReflectFigAssetNotification name:*MEMORY[0x1E4F31EC8] object:self->_figAsset flags:0];
      [v3 addListenerWithWeakReference:v4 callback:handleAndReflectFigAssetNotification name:*MEMORY[0x1E4F31EC0] object:self->_figAsset flags:0];
      [v3 addListenerWithWeakReference:v4 callback:handleAndReflectFigAssetNotification name:*MEMORY[0x1E4F31EE8] object:self->_figAsset flags:0];
      [v3 addListenerWithWeakReference:v4 callback:handleAndReflectFigAssetNotification name:*MEMORY[0x1E4F31EF0] object:self->_figAsset flags:0];
      [v3 addListenerWithWeakReference:v4 callback:handleAndReflectFigAssetNotification name:*MEMORY[0x1E4F31EE0] object:self->_figAsset flags:0];
      [v3 addListenerWithWeakReference:v4 callback:handleAndReflectFigAssetNotification name:*MEMORY[0x1E4F31ED8] object:self->_figAsset flags:0];
      self->_registeredForFigAssetNotifications = 1;
    }
  }
}

+ (id)_figAssetTrackMediaSelectionPropertiesArray
{
  if (ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce != -1) {
    dispatch_once(&ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce, &__block_literal_global_350);
  }
  return (id)sFigAssetTrackMediaSelectionProperties;
}

+ (id)_figAssetMediaSelectionPropertiesArray
{
  if (ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce != -1) {
    dispatch_once(&ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce, &__block_literal_global_350);
  }
  return (id)sFigAssetMediaSelectionProperties;
}

- (void)_removeFigAssetNotifications
{
  if (self->_figAsset)
  {
    if (self->_registeredForFigAssetNotifications)
    {
      id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
      uint64_t v4 = [(AVAssetInspectorLoader *)self _weakReference];
      [v3 removeListenerWithWeakReference:v4 callback:handleFigAssetLoadingNotification name:*MEMORY[0x1E4F31EA8] object:self->_figAsset];
      [v3 removeListenerWithWeakReference:v4 callback:handleAndReflectFigAssetNotification name:*MEMORY[0x1E4F31EC8] object:self->_figAsset];
      [v3 removeListenerWithWeakReference:v4 callback:handleAndReflectFigAssetNotification name:*MEMORY[0x1E4F31EC0] object:self->_figAsset];
      [v3 removeListenerWithWeakReference:v4 callback:handleAndReflectFigAssetNotification name:*MEMORY[0x1E4F31EE8] object:self->_figAsset];
      [v3 removeListenerWithWeakReference:v4 callback:handleAndReflectFigAssetNotification name:*MEMORY[0x1E4F31EF0] object:self->_figAsset];
      [v3 removeListenerWithWeakReference:v4 callback:handleAndReflectFigAssetNotification name:*MEMORY[0x1E4F31EE0] object:self->_figAsset];
      [v3 removeListenerWithWeakReference:v4 callback:handleAndReflectFigAssetNotification name:*MEMORY[0x1E4F31ED8] object:self->_figAsset];
      CFRelease(v4);
      self->_registeredForFigAssetNotifications = 0;
    }
  }
}

- (void)dealloc
{
  [(AVFigAssetInspectorLoader *)self _removeFigAssetNotifications];

  completionHandlerQueue = self->_completionHandlerQueue;
  if (completionHandlerQueue) {
    dispatch_release(completionHandlerQueue);
  }
  figAsset = self->_figAsset;
  if (figAsset) {
    CFRelease(figAsset);
  }
  if (self->_loadingMutex) {
    FigSimpleMutexDestroy();
  }
  v5.receiver = self;
  v5.super_class = (Class)AVFigAssetInspectorLoader;
  [(AVAssetInspectorLoader *)&v5 dealloc];
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return (OpaqueFigFormatReader *)[v2 _copyFormatReader];
}

- (id)asset
{
  return [(AVWeakReference *)self->_weakReferenceToAsset referencedObject];
}

- (id)_completionHandlerQueue
{
  return self->_completionHandlerQueue;
}

uint64_t __101__AVFigAssetInspectorLoader_loadValuesAsynchronouslyForKeys_keysForCollectionKeys_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:a2];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void **)(a1 + 40);
    return [v6 addObjectsFromArray:v5];
  }
  else
  {
    v8 = *(void **)(a1 + 48);
    return [v8 addObject:a2];
  }
}

- (void)cancelLoading
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  MEMORY[0x199715030](self->_loadingMutex, a2);
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_loadingBatches];
  [(NSMutableArray *)self->_loadingBatches removeAllObjects];
  self->_loadingCanceled = 1;
  MEMORY[0x199715040](self->_loadingMutex);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) objectForKey:@"AVAsynchronousLoadingCompletionHandlerKey"];
        if (v8) {
          (*(void (**)(void))(v8 + 16))();
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

uint64_t __66__AVFigAssetInspectorLoader__ensureAllDependenciesOfKeyAreLoaded___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  [*(id *)(a1 + 32) signal];
  id v2 = *(void **)(a1 + 32);
  return [v2 unlock];
}

- (id)variants
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return (id)[v2 variants];
}

- (id)lyrics
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return (id)[v2 lyrics];
}

- (BOOL)isPlayable
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return [v2 isPlayable];
}

- (BOOL)isExportable
{
  char v3 = [(AVFigAssetInspectorLoader *)self _isStreaming];
  char v4 = objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "isExportable");
  return ([(AVFigAssetInspectorLoader *)self statusOfValueForKey:@"exportable" error:0] == 2) & ~v3 & v4;
}

- (BOOL)isReadable
{
  char v3 = [(AVFigAssetInspectorLoader *)self _isStreaming];
  char v4 = objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "isReadable");
  return ([(AVFigAssetInspectorLoader *)self statusOfValueForKey:@"readable" error:0] == 2) & ~v3 & v4;
}

- (BOOL)isComposable
{
  char v3 = [(AVFigAssetInspectorLoader *)self _isStreaming];
  char v4 = objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "isComposable");
  return ([(AVFigAssetInspectorLoader *)self statusOfValueForKey:@"composable" error:0] == 2) & ~v3 & v4;
}

- (BOOL)isCompatibleWithSavedPhotosAlbum
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return [v2 isCompatibleWithSavedPhotosAlbum];
}

- (id)figChapterGroupInfo
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return (id)[v2 figChapterGroupInfo];
}

- (id)figChapters
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return (id)[v2 figChapters];
}

- (id)URL
{
  return self->_URL;
}

- (id)resolvedURL
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return (id)[v2 resolvedURL];
}

- (id)originalNetworkContentURL
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return (id)[v2 originalNetworkContentURL];
}

- (unint64_t)downloadToken
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return [v2 downloadToken];
}

- (id)contentKeySpecifiersEligibleForPreloading
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return (id)[v2 contentKeySpecifiersEligibleForPreloading];
}

- (BOOL)hasProtectedContent
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return [v2 hasProtectedContent];
}

- (int64_t)firstFragmentSequenceNumber
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return [v2 firstFragmentSequenceNumber];
}

- (int64_t)fragmentCount
{
  id v2 = [(AVFigAssetInspectorLoader *)self assetInspector];
  return [v2 fragmentCount];
}

- (double)_fragmentMindingInterval
{
  [(AVFigAssetInspectorLoader *)self _figAsset];
  CFNumberRef valuePtr = 0;
  uint64_t CMBaseObject = FigAssetGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void (**)(uint64_t, void, void, const __CFNumber **))(v4 + 48);
  if (v5)
  {
    v5(CMBaseObject, *MEMORY[0x1E4F32278], *MEMORY[0x1E4F1CF80], &valuePtr);
    if (valuePtr)
    {
      CFNumberGetValue(valuePtr, kCFNumberSInt64Type, &valuePtr);
      if (valuePtr) {
        CFRelease(valuePtr);
      }
    }
  }
  return 0.0;
}

- (void)_setFragmentMindingInterval:(double)a3
{
  [(AVFigAssetInspectorLoader *)self _figAsset];
  uint64_t valuePtr = (uint64_t)(a3 * 1000.0);
  CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, &valuePtr);
  uint64_t CMBaseObject = FigAssetGetCMBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void (**)(uint64_t, void, CFNumberRef))(v7 + 56);
  if (v8) {
    v8(CMBaseObject, *MEMORY[0x1E4F32278], v4);
  }
  if (v4) {
    CFRelease(v4);
  }
}

- (BOOL)isAssociatedWithFragmentMinder
{
  return self->_fragmentMinderAssociationCount > 0;
}

- (void)_setIsAssociatedWithFragmentMinder:(BOOL)a3
{
  int64_t fragmentMinderAssociationCount = self->_fragmentMinderAssociationCount;
  if (a3) {
    int64_t v4 = fragmentMinderAssociationCount + 1;
  }
  else {
    int64_t v4 = fragmentMinderAssociationCount - 1;
  }
  self->_int64_t fragmentMinderAssociationCount = v4;
}

@end