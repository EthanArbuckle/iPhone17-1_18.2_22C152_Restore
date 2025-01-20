@interface PKAutoRefineTask
- (BOOL)hasOngoingAnimation;
- (id)debugInfo;
- (uint64_t)cancel;
- (uint64_t)isInvalidatedGivenDrawing:(void *)a3 autoRefineController:(void *)a4 currentStroke:(void *)a5 inStrokesToReplace:(void *)a6 lineDrawing:(void *)a7 strokeGroups:(void *)a8 outStrokeGroupsToReplace:(void *)a9 outStrokesToPreserve:;
- (uint64_t)logEventCompletionWithSuccess:(uint64_t)result;
- (uint64_t)queryItemIsEqualToQueryItem:(uint64_t)a1;
- (void)dealloc;
- (void)executeSynthesisWithSession:(void *)a3 processingBlock:(void *)a4 completionBlock:;
- (void)locale;
- (void)trimTaskForNewItem:(unsigned char *)a3 shouldCancel:;
- (void)trimTaskForNewStrokeInRect:(CGFloat)a3 shouldCancel:(CGFloat)a4;
- (void)updateCommittableRange;
@end

@implementation PKAutoRefineTask

void __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v4) {
    v4 = (void *)v4[2];
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "strokeIndexesForColumnsInRange:", a2, 1);

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke_2;
  v13 = &unk_1E64C9FC0;
  id v14 = *(id *)(a1 + 32);
  v15 = &v16;
  [v6 enumerateRangesUsingBlock:&v10];
  v7 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = objc_msgSend(v6, "description", v10, v11, v12, v13);
    int v9 = *((unsigned __int8 *)v17 + 24);
    *(_DWORD *)buf = 134218498;
    uint64_t v21 = a2;
    __int16 v22 = 2112;
    v23 = v8;
    __int16 v24 = 1024;
    int v25 = v9;
    _os_log_debug_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEBUG, "New AutoRefine task checking refinable strokes in column %ld, stroke indexes: %@, foundRefinable ? %d", buf, 0x1Cu);
  }
  if (!*((unsigned char *)v17 + 24)) {
    [*(id *)(a1 + 40) addIndex:a2];
  }

  _Block_object_dispose(&v16, 8);
}

void __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v8 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v8) {
    v8 = (void *)v8[6];
  }
  int v9 = v8;
  int v10 = objc_msgSend(v9, "intersectsIndexesInRange:", a2, a3);

  if (v10)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

uint64_t __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", a2, a3);
}

uint64_t __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke_2_6(uint64_t result, unint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(result + 32);
  unint64_t v5 = *(void *)(v4 + 32);
  if (a2 + a3 > v5)
  {
    if (a2 > v5) {
      unint64_t v5 = a2;
    }
    *(void *)(v4 + 32) = v5;
    uint64_t v6 = *(void *)(result + 32);
    unint64_t v7 = a2 + a3 - 1;
    if (*(void *)(v6 + 40) > v7) {
      *(void *)(v6 + 40) = v7;
    }
    *a4 = 1;
  }
  return result;
}

- (void)updateCommittableRange
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v43 = 0;
    v44 = (double *)&v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = 0;
    uint64_t v39 = 0;
    v40 = (double *)&v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v42 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0;
    uint64_t v4 = [MEMORY[0x1E4F28E60] indexSet];
    unint64_t v5 = *(void **)(a1 + 8);
    if (v5) {
      unint64_t v5 = (void *)v5[2];
    }
    uint64_t v6 = v5;
    unint64_t v7 = *(void **)(a1 + 8);
    if (v7) {
      unint64_t v7 = (void *)v7[2];
    }
    v8 = v7;
    int v9 = [v8 transcriptionPaths];
    int v10 = [v9 firstObject];
    uint64_t v11 = v3 - v2 + 1;
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __42__PKAutoRefineTask_updateCommittableRange__block_invoke;
    v30 = &unk_1E64CA038;
    id v12 = v4;
    id v31 = v12;
    v32 = &v43;
    v33 = &v39;
    v34 = &v35;
    objc_msgSend(v6, "enumerateTokensInTranscriptionPath:columnRange:tokenProcessingBlock:", v10, v2, v11, &v27);

    uint64_t v13 = v36[3];
    if (v13 <= 0)
    {
      *(void *)(a1 + 88) = 0;
      double v14 = 1.0;
    }
    else
    {
      *(double *)(a1 + 88) = v44[3] / (double)v13;
      double v14 = v40[3] / (double)v13;
    }
    *(double *)(a1 + 96) = v14;
    v15 = *(void **)(a1 + 8);
    if (v15) {
      v15 = (void *)v15[4];
    }
    uint64_t v16 = v15;
    uint64_t v17 = objc_msgSend(v16, "objectsAtIndexes:", v12, v27, v28, v29, v30);
    uint64_t v18 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = v17;

    char v19 = *(void **)(a1 + 8);
    if (v19) {
      char v19 = (void *)v19[2];
    }
    v20 = v19;
    uint64_t v21 = *(void **)(a1 + 8);
    if (v21) {
      uint64_t v21 = (void *)v21[2];
    }
    __int16 v22 = v21;
    v23 = [v22 transcriptionPaths];
    __int16 v24 = [v23 firstObject];
    uint64_t v25 = objc_msgSend(v20, "transcriptionWithPath:columnRange:filterLowConfidence:", v24, v2, v11, 0);
    uint64_t v26 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = v25;

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);
  }
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  queryItem = self->_queryItem;
  self->_queryItem = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  uint64_t v4 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v7 = self;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "AutoRefine task destroyed %p.", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PKAutoRefineTask;
  [(PKAutoRefineTask *)&v5 dealloc];
}

- (void)locale
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[1];
    if (v2) {
      uint64_t v2 = (void *)v2[7];
    }
    a1 = v2;
    uint64_t v1 = vars8;
  }
  return a1;
}

void __42__PKAutoRefineTask_updateCommittableRange__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  objc_super v5 = [v3 strokeIndexes];
  [v4 addIndexes:v5];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F5C080]) initWithTokenizedTextResultToken:v3];
  if ([v6 hasValidPrincipalLines])
  {
    [v6 principalOrientation];
    *(double *)(*(void *)(a1[5] + 8) + 24) = v7 + *(double *)(*(void *)(a1[5] + 8) + 24);
    if (v6)
    {
      [v6 principalLines];
      [v6 principalLines];
      [v6 principalLines];
      [v6 principalLines];
      double v8 = *((double *)&v37 + 1) + *((double *)&v30 + 1) - *((double *)&v23 + 1);
      double v9 = *((double *)&v16 + 1);
    }
    else
    {
      uint64_t v41 = 0;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      double v9 = 0.0;
      long long v11 = 0u;
      long long v12 = 0u;
      double v8 = 0.0;
    }
    objc_msgSend(v6, "bounds", v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27,
      v28,
      v29,
      v30,
      v31,
      v32,
      v33,
      v34,
      v35,
      v36,
      v37,
      v38,
      v39,
      v40,
      v41);
    *(double *)(*(void *)(a1[6] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 24) + (v8 - v9) * 0.5 * v10;
    ++*(void *)(*(void *)(a1[7] + 8) + 24);
  }
}

- (void)executeSynthesisWithSession:(void *)a3 processingBlock:(void *)a4 completionBlock:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    double v10 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = a1;
      _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "AutoRefine task performing the synthesis query %p.", buf, 0xCu);
    }

    if (v7)
    {
      long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F5C0B8]) initWithRecognitionSession:v7];
      long long v12 = os_log_create("com.apple.pencilkit", "AutoRefine");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_DEFAULT, "AutoRefine synthesis query initialized.", buf, 2u);
      }

      uint64_t v14 = *(void *)(a1 + 72);
      uint64_t v13 = *(void *)(a1 + 80);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __80__PKAutoRefineTask_executeSynthesisWithSession_processingBlock_completionBlock___block_invoke;
      v18[3] = &unk_1E64CA060;
      v18[4] = a1;
      id v19 = v8;
      id v20 = v9;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __80__PKAutoRefineTask_executeSynthesisWithSession_processingBlock_completionBlock___block_invoke_21;
      v17[3] = &unk_1E64C5D88;
      v17[4] = a1;
      id v15 = (id)[v11 refinedTokensForSingleLineContextStrokes:v13 transcription:v14 completion:v18 shouldCancel:v17];
    }
    else
    {
      long long v16 = os_log_create("com.apple.pencilkit", "AutoRefine");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v22 = a1;
        _os_log_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_DEFAULT, "Session has been invalidated, canceling task %p.", buf, 0xCu);
      }

      -[PKAutoRefineTask cancel](a1);
    }
  }
}

- (uint64_t)cancel
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      uint64_t v5 = v1;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "AutoRefine task cancelled %p.", (uint8_t *)&v4, 0xCu);
    }

    *(unsigned char *)(v1 + 104) = 1;
    result = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(void *)(v1 + 64) = v3;
  }
  return result;
}

void __80__PKAutoRefineTask_executeSynthesisWithSession_processingBlock_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v45 = a2;
  id v44 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5 - *(double *)(*(void *)(a1 + 32) + 56);
  id v7 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218496;
    uint64_t v55 = v8;
    __int16 v56 = 2048;
    uint64_t v57 = [v45 count];
    __int16 v58 = 2048;
    uint64_t v59 = *(void *)&v6;
    _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "AutoRefine synthesis query %p, starting the drawing update block with %ld synthesized tokens, after task duration = %f", buf, 0x20u);
  }
  uint64_t v46 = a1;

  if (v6 >= 0.5)
  {
    double v10 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218496;
    uint64_t v55 = v15;
    __int16 v56 = 2048;
    uint64_t v57 = *(void *)&v6;
    __int16 v58 = 2048;
    uint64_t v59 = 0x3FE0000000000000;
    long long v12 = "AutoRefine synthesis query %p not sleeping before triggering the strokes update: %f >= %f";
    uint64_t v13 = v10;
    uint32_t v14 = 32;
  }
  else
  {
    double v9 = 0.5 - v6;
    [MEMORY[0x1E4F29060] sleepForTimeInterval:v9];
    double v10 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218240;
    uint64_t v55 = v11;
    __int16 v56 = 2048;
    uint64_t v57 = *(void *)&v9;
    long long v12 = "AutoRefine synthesis query %p sleeping for %f before triggering the strokes update.";
    uint64_t v13 = v10;
    uint32_t v14 = 22;
  }
  _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
LABEL_9:

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v17 = v16 - *(double *)(*(void *)(a1 + 32) + 56);
  long long v18 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = [v45 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v55 = v19;
    __int16 v56 = 2048;
    uint64_t v57 = v20;
    __int16 v58 = 2048;
    uint64_t v59 = *(void *)&v17;
    _os_log_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEFAULT, "AutoRefine synthesis query %p, running the drawing update block with %ld synthesized tokens, after task duration = %f", buf, 0x20u);
  }

  long long v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v45, "count"));
  uint64_t v22 = objc_opt_new();
  uint64_t v23 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v45;
  uint64_t v24 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v24)
  {
    uint64_t v25 = 0;
    uint64_t v26 = *(void *)v51;
    double v27 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v51 != v26) {
          objc_enumerationMutation(obj);
        }
        long long v29 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if ([v29 hasPrecedingSpace]) {
          [v22 appendString:@" "];
        }
        long long v30 = [v29 string];
        [v22 appendString:v30];

        long long v31 = [v29 drawing];
        [v23 appendDrawing:v31];

        long long v32 = [v29 drawing];
        [v21 addObject:v32];

        if ([v29 hasValidPrincipalLines])
        {
          [v29 principalOrientation];
          double v27 = v27 + v33;
          ++v25;
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v24);

    if (v25 >= 1)
    {
      double v34 = v27 / (double)v25;
      goto LABEL_26;
    }
  }
  else
  {
  }
  double v34 = 0.0;
LABEL_26:
  uint64_t v35 = *(void *)(v46 + 32);
  double v37 = *(double *)(v35 + 88);
  double v36 = *(double *)(v35 + 96);
  long long v38 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v39 = *(void *)(v46 + 32);
    uint64_t v40 = [obj count];
    *(_DWORD *)buf = 134218755;
    uint64_t v55 = v39;
    __int16 v56 = 2048;
    uint64_t v57 = v40;
    __int16 v58 = 2117;
    uint64_t v59 = (uint64_t)v22;
    __int16 v60 = 2048;
    double v61 = v17;
    _os_log_impl(&dword_1C44F8000, v38, OS_LOG_TYPE_DEFAULT, "AutoRefine synthesis query %p, running the drawing update block with tokens = %ld, string = %{sensitive}@ after task duration = %f", buf, 0x2Au);
  }

  uint64_t v41 = *(void *)(v46 + 40);
  uint64_t v42 = [obj count];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __80__PKAutoRefineTask_executeSynthesisWithSession_processingBlock_completionBlock___block_invoke_18;
  v48[3] = &unk_1E64C53B8;
  id v43 = *(id *)(v46 + 48);
  v48[4] = *(void *)(v46 + 32);
  id v49 = v43;
  (*(void (**)(uint64_t, void *, id, void *, uint64_t, void *, double, double))(v41 + 16))(v41, v21, v44, v23, v42, v48, v37 - v34, v36);
}

void __80__PKAutoRefineTask_executeSynthesisWithSession_processingBlock_completionBlock___block_invoke_18(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__PKAutoRefineTask_executeSynthesisWithSession_processingBlock_completionBlock___block_invoke_2;
  v3[3] = &unk_1E64C53B8;
  id v2 = *(id *)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __80__PKAutoRefineTask_executeSynthesisWithSession_processingBlock_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "AutoRefine task completed %p.", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __80__PKAutoRefineTask_executeSynthesisWithSession_processingBlock_completionBlock___block_invoke_21(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return *(unsigned char *)(v1 + 104) & 1;
  }
  else {
    return 0;
  }
}

- (BOOL)hasOngoingAnimation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  BOOL v2 = !a1[104] && !a1[105] && a1[106] != 0;
  uint64_t v3 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134218240;
    uint64_t v6 = a1;
    __int16 v7 = 1024;
    BOOL v8 = v2;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "AutoRefine task %p hasOngoingAnimation ? %d", (uint8_t *)&v5, 0x12u);
  }

  return v2;
}

- (uint64_t)logEventCompletionWithSuccess:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    *(unsigned char *)(result + 105) = 1;
    result = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(void *)(v3 + 64) = v4;
    *(unsigned char *)(v3 + 107) = a2;
  }
  return result;
}

- (id)debugInfo
{
  v50[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v38 = [MEMORY[0x1E4F1CA60] dictionary];
    double v34 = [MEMORY[0x1E4F1CA20] currentLocale];
    double v37 = [v34 localeIdentifier];
    uint64_t v1 = CHGetSynthesisModelVersionForLocale();
    uint64_t v35 = (void *)v1;
    if (v37) {
      BOOL v2 = v1 == 0;
    }
    else {
      BOOL v2 = 1;
    }
    if (!v2)
    {
      [v38 setObject:v1 forKeyedSubscript:@"modelVersionForUserLocale"];
      [v38 setObject:v37 forKeyedSubscript:@"userLocale"];
    }
    double v36 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v3 = *(void *)(a1 + 8);
    if (v3)
    {
      id v4 = *(id *)(v3 + 16);
      int v5 = v4;
      if (v4)
      {
        uint64_t v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "tokenColumnCount"));
        uint64_t v6 = [v5 transcriptionPaths];
        uint64_t v40 = [v6 firstObject];

        uint64_t v41 = [v5 refinableTranscriptionPath];
        for (uint64_t i = 0; i < [v5 tokenColumnCount]; ++i)
        {
          BOOL v8 = [v5 tokenRowsAtColumnIndex:i];
          uint64_t v9 = objc_msgSend(v5, "transcriptionWithPath:columnRange:filterLowConfidence:", v40, i, 1, 0);
          double v10 = objc_msgSend(v5, "transcriptionWithPath:columnRange:filterLowConfidence:", v41, i, 1, 0);
          uint64_t v11 = objc_msgSend(v5, "strokeIndexesForColumnsInRange:", i, 1);
          long long v12 = [MEMORY[0x1E4F28E78] string];
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __41__PKAutoRefineTask__serializedTextResult__block_invoke;
          v43[3] = &unk_1E64CA010;
          id v13 = v12;
          id v44 = v13;
          [v11 enumerateRangesUsingBlock:v43];
          v49[0] = @"topTranscription";
          v49[1] = @"refinableTranscription";
          v50[0] = v9;
          v50[1] = v10;
          v49[2] = @"rowCount";
          uint32_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
          v49[3] = @"strokeIndexes";
          v50[2] = v14;
          v50[3] = v13;
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:4];
          [v42 addObject:v15];
        }
        [v36 setObject:v42 forKeyedSubscript:@"tokenColumns"];
      }
    }
    else
    {
      int v5 = 0;
    }

    [v38 setObject:v36 forKeyedSubscript:@"textResult"];
    double v16 = *(void **)(a1 + 8);
    if (v16) {
      double v16 = (void *)v16[2];
    }
    double v17 = v16;
    long long v18 = [v17 refinableTranscription];
    [v38 setObject:v18 forKeyedSubscript:@"refinableTranscription"];

    v47[0] = @"lastColumnToCommit";
    uint64_t v19 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    v48[0] = v19;
    v47[1] = @"firstColumnToCommit";
    uint64_t v20 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
    v48[1] = v20;
    v47[2] = @"startTime";
    long long v21 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
    v48[2] = v21;
    v47[3] = @"completionTime";
    uint64_t v22 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    v48[3] = v22;
    v47[4] = @"duration";
    uint64_t v23 = [NSNumber numberWithDouble:*(double *)(a1 + 64) - *(double *)(a1 + 56)];
    v48[4] = v23;
    v47[5] = @"initialFirstColumnToCommit";
    uint64_t v24 = [NSNumber numberWithInteger:*(void *)(a1 + 16)];
    void v48[5] = v24;
    v47[6] = @"initialLastColumnToCommit";
    uint64_t v25 = [NSNumber numberWithInteger:*(void *)(a1 + 24)];
    v48[6] = v25;
    v47[7] = @"strokesToReplace";
    uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v48[7] = v26;
    double v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:8];
    [v38 setObject:v27 forKeyedSubscript:@"commit"];

    v45[0] = @"isCanceled";
    long long v28 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 104)];
    v46[0] = v28;
    v45[1] = @"isComplete";
    long long v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 105)];
    v46[1] = v29;
    v45[2] = @"hasStrokeAnimationStarted";
    long long v30 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 106)];
    v46[2] = v30;
    v45[3] = @"strokesRefinementSuccessful";
    long long v31 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 107)];
    v46[3] = v31;
    long long v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:4];
    [v38 setObject:v32 forKeyedSubscript:@"status"];
  }
  else
  {
    id v38 = 0;
  }

  return v38;
}

void __41__PKAutoRefineTask__serializedTextResult__block_invoke(uint64_t a1, NSUInteger a2, NSUInteger a3)
{
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  uint64_t v6 = *(void **)(a1 + 32);
  v9.location = a2;
  v9.length = a3;
  NSStringFromRange(v9);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 appendFormat:@"%@", v7];
}

- (void)trimTaskForNewStrokeInRect:(CGFloat)a3 shouldCancel:(CGFloat)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v7 = a1[5];
    if (v7 < a1[4]) {
      goto LABEL_22;
    }
    LOBYTE(v12) = 0;
    while (1)
    {
      double v13 = -[PKAutoRefineQueryItem boundsForTextResultsColumnAtIndex:](a1[1], v7);
      CGFloat rect = v15;
      CGFloat v69 = v14;
      CGFloat v16 = v13;
      CGFloat v18 = v17;
      uint64_t v19 = (void *)a1[1];
      if (v19) {
        uint64_t v19 = (void *)v19[2];
      }
      uint64_t v20 = v19;
      long long v21 = (void *)a1[1];
      if (v21) {
        long long v21 = (void *)v21[2];
      }
      uint64_t v22 = v21;
      uint64_t v23 = [v22 transcriptionPaths];
      uint64_t v24 = [v23 firstObject];
      uint64_t v25 = objc_msgSend(v20, "transcriptionWithPath:columnRange:filterLowConfidence:", v24, v7, 1, 0);

      v83.origin.x = v16;
      v83.origin.CGFloat y = v18;
      v83.size.width = v69;
      v83.size.height = rect;
      CGFloat Height = CGRectGetHeight(v83);
      v84.origin.CGFloat y = v18;
      double v27 = Height;
      CGFloat y = v84.origin.y;
      CGFloat v67 = v16;
      v84.origin.x = v16;
      v84.size.width = v69;
      v84.size.height = rect;
      double v28 = fmax(CGRectGetWidth(v84) / fmax((double)(unint64_t)[v25 length], 1.0), 20.0);
      if (v28 < v27) {
        double v28 = v27;
      }
      double v65 = v28;
      v85.origin.x = a3;
      v85.origin.CGFloat y = a4;
      v85.size.width = a5;
      v85.size.height = a6;
      double MinX = CGRectGetMinX(v85);
      v86.origin.x = a3;
      v86.origin.CGFloat y = a4;
      v86.size.width = a5;
      v86.size.height = a6;
      CGFloat rect1 = CGRectGetMinY(v86);
      v87.origin.x = a3;
      v87.origin.CGFloat y = a4;
      v87.size.width = a5;
      v87.size.height = a6;
      double Width = CGRectGetWidth(v87);
      v88.origin.x = a3;
      v88.origin.CGFloat y = a4;
      v88.size.width = a5;
      v88.size.height = a6;
      CGFloat v30 = CGRectGetHeight(v88);
      v89.origin.x = a3;
      double v31 = a4;
      v89.origin.CGFloat y = a4;
      double v32 = a5;
      v89.size.width = a5;
      double v33 = a6;
      v89.size.height = a6;
      CGFloat MinY = CGRectGetMinY(v89);
      v90.origin.CGFloat y = y;
      v90.origin.x = v67;
      v90.size.height = rect;
      v90.size.width = v69;
      CGFloat v35 = CGRectGetWidth(v90);
      v91.origin.x = a3;
      v91.origin.CGFloat y = v31;
      v91.size.width = v32;
      v91.size.height = v33;
      double v36 = CGRectGetHeight(v91);
      if (v12)
      {
        BOOL v12 = 1;
      }
      else
      {
        v92.size.height = v36;
        v96.origin.CGFloat y = y;
        v92.origin.x = v67;
        v92.origin.CGFloat y = MinY;
        v92.size.width = v35;
        v96.origin.x = v67;
        v96.size.height = rect;
        v96.size.width = v69;
        BOOL v12 = CGRectIntersectsRect(v92, v96);
      }
      v93.origin.x = MinX + v65 * -0.5;
      v93.size.width = v65 + Width;
      v93.origin.CGFloat y = rect1;
      v93.size.height = v30;
      v97.origin.CGFloat y = y;
      v97.origin.x = v67;
      v97.size.height = rect;
      v97.size.width = v69;
      if (!CGRectIntersectsRect(v93, v97)) {
        break;
      }
      double v37 = os_log_create("com.apple.pencilkit", "AutoRefine");
      a6 = v33;
      a5 = v32;
      a4 = v31;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v39 = (void *)a1[1];
        if (v39) {
          uint64_t v39 = (void *)v39[2];
        }
        uint64_t v40 = v39;
        uint64_t v41 = [v40 topTranscription];
        v94.origin.x = a3;
        v94.origin.CGFloat y = v31;
        v94.size.width = v32;
        v94.size.height = a6;
        NSStringFromCGRect(v94);
        id v42 = (id)objc_claimAutoreleasedReturnValue();
        v95.origin.x = v67;
        v95.origin.CGFloat y = y;
        v95.size.width = v69;
        v95.size.height = rect;
        id v43 = NSStringFromCGRect(v95);
        *(_DWORD *)buf = 134219267;
        v71 = a1;
        __int16 v72 = 2117;
        v73 = v41;
        __int16 v74 = 2048;
        uint64_t v75 = v7;
        __int16 v76 = 2117;
        uint64_t v77 = (uint64_t)v25;
        __int16 v78 = 2112;
        id v79 = v42;
        __int16 v80 = 2112;
        v81 = v43;
        _os_log_debug_impl(&dword_1C44F8000, v37, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription _%{sensitive}@_ - column [%ld] = _%{sensitive}@_ TRIMMED by new stroke that is too close: bounds %@ vs %@", buf, 0x3Eu);
      }
      if (v7-- <= a1[4]) {
        goto LABEL_22;
      }
    }

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_22:
      id v44 = os_log_create("com.apple.pencilkit", "AutoRefine");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        v48 = (void *)a1[1];
        if (v48) {
          v48 = (void *)v48[2];
        }
        id v49 = v48;
        long long v50 = [v49 topTranscription];
        *(_DWORD *)buf = 134218243;
        v71 = a1;
        __int16 v72 = 2117;
        v73 = v50;
        _os_log_debug_impl(&dword_1C44F8000, v44, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription _%{sensitive}@_ CANCELED by new stroke - no safe column remaining", buf, 0x16u);
      }
    }
    else
    {
      BOOL v46 = v7 < a1[5];
      id v44 = os_log_create("com.apple.pencilkit", "AutoRefine");
      BOOL v47 = os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG);
      if (v46)
      {
        if (v47)
        {
          long long v51 = (void *)a1[1];
          if (v51) {
            long long v51 = (void *)v51[2];
          }
          long long v52 = v51;
          long long v53 = [v52 topTranscription];
          uint64_t v54 = a1[5];
          *(_DWORD *)buf = 134218755;
          v71 = a1;
          __int16 v72 = 2117;
          v73 = v53;
          __int16 v74 = 2048;
          uint64_t v75 = v54;
          __int16 v76 = 2048;
          uint64_t v77 = v7;
          _os_log_debug_impl(&dword_1C44F8000, v44, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription _%{sensitive}@_ CANCELED with last column changed from %ld to %ld", buf, 0x2Au);
        }
        a1[5] = v7;
        -[PKAutoRefineTask updateCommittableRange]((uint64_t)a1);
        goto LABEL_24;
      }
      if (!v12)
      {
        if (v47)
        {
          __int16 v58 = (void *)a1[1];
          if (v58) {
            __int16 v58 = (void *)v58[2];
          }
          uint64_t v59 = v58;
          __int16 v60 = [v59 topTranscription];
          uint64_t v61 = a1[5];
          *(_DWORD *)buf = 134218499;
          v71 = a1;
          __int16 v72 = 2117;
          v73 = v60;
          __int16 v74 = 2048;
          uint64_t v75 = v61;
          _os_log_debug_impl(&dword_1C44F8000, v44, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription _%{sensitive}@_ - last column [%ld] NOT TRIMMED by new stroke.", buf, 0x20u);
        }
        char v45 = 0;
        goto LABEL_25;
      }
      if (v47)
      {
        uint64_t v55 = (void *)a1[1];
        if (v55) {
          uint64_t v55 = (void *)v55[2];
        }
        __int16 v56 = v55;
        uint64_t v57 = [v56 topTranscription];
        *(_DWORD *)buf = 134218243;
        v71 = a1;
        __int16 v72 = 2117;
        v73 = v57;
        _os_log_debug_impl(&dword_1C44F8000, v44, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription _%{sensitive}@_ - CANCELED by new stroke that may fall on the same line of text", buf, 0x16u);
      }
    }

LABEL_24:
    char v45 = 1;
LABEL_25:
    *a2 = v45;
  }
}

- (uint64_t)queryItemIsEqualToQueryItem:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3) {
      int v5 = (void *)*((void *)v3 + 4);
    }
    else {
      int v5 = 0;
    }
    id v6 = v5;
    uint64_t v7 = *(void **)(a1 + 8);
    if (v7) {
      uint64_t v7 = (void *)v7[4];
    }
    BOOL v8 = v7;
    a1 = [v6 isEqualToArray:v8];
  }
  return a1;
}

- (void)trimTaskForNewItem:(unsigned char *)a3 shouldCancel:
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  int v5 = v4;
  if (a1)
  {
    v107 = v4;
    if (v4)
    {
      id v6 = *((id *)v4 + 2);
      uint64_t v7 = (void *)v5[4];
    }
    else
    {
      id v6 = 0;
      uint64_t v7 = 0;
    }
    id v8 = v7;
    NSRange v9 = (void *)a1[1];
    if (v9) {
      NSRange v9 = (void *)v9[4];
    }
    double v10 = v9;
    v111 = v6;
    v110 = [v8 differenceFromArray:v10];

    uint64_t v11 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = (void *)a1[1];
      if (v12) {
        BOOL v12 = (void *)v12[2];
      }
      double v13 = v12;
      double v14 = [v13 topTranscription];
      double v15 = [v6 topTranscription];
      CGFloat v16 = [v110 insertions];
      uint64_t v17 = [v16 count];
      CGFloat v18 = [v110 removals];
      *(_DWORD *)buf = 134219011;
      v113 = a1;
      __int16 v114 = 2117;
      v115 = v14;
      __int16 v116 = 2117;
      uint64_t v117 = (uint64_t)v15;
      __int16 v118 = 2048;
      uint64_t v119 = v17;
      __int16 v120 = 2048;
      uint64_t v121 = [v18 count];
      _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "AutoRefine Task %p with transcription %{sensitive}@ comparing with new item with transcription %{sensitive}@. different strokes +%ld, -%ld", buf, 0x34u);
    }
    uint64_t v19 = [v110 removals];
    if ([v19 count])
    {

      uint64_t v20 = [v110 removals];
      if ([v20 count])
      {

        long long v21 = [v110 removals];
        if ([v21 count])
        {
          uint64_t v22 = [v110 removals];
          unint64_t v23 = [v22 count];
          uint64_t v24 = (void *)a1[1];
          if (v24) {
            uint64_t v24 = (void *)v24[4];
          }
          uint64_t v25 = v24;
          BOOL v26 = v23 < [v25 count];

          if (v26)
          {
            double v27 = os_log_create("com.apple.pencilkit", "AutoRefine");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              v81 = (void *)a1[1];
              if (v81) {
                v81 = (void *)v81[2];
              }
              uint64_t v82 = v81;
              CGRect v83 = [v82 topTranscription];
              CGRect v84 = (void *)a1[1];
              if (v84) {
                CGRect v84 = (void *)v84[2];
              }
              CGRect v85 = v84;
              uint64_t v86 = [v85 tokenColumnCount];
              CGRect v87 = [v111 topTranscription];
              uint64_t v88 = [v111 tokenColumnCount];
              *(_DWORD *)buf = 134219011;
              v113 = a1;
              __int16 v114 = 2117;
              v115 = v83;
              __int16 v116 = 2048;
              uint64_t v117 = v86;
              __int16 v118 = 2117;
              uint64_t v119 = (uint64_t)v87;
              __int16 v120 = 2048;
              uint64_t v121 = v88;
              _os_log_debug_impl(&dword_1C44F8000, v27, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription %{sensitive}@ (%ld columns) CANCELLED by new item with transcription %{sensitive}@ (%ld columns) that has removed strokes.", buf, 0x34u);
            }
            *a3 = 1;
          }
        }
        else
        {
        }
      }
      else
      {
        CGFloat v30 = [v110 insertions];
        [v30 count];

        unint64_t v31 = a1[4];
        uint64_t v108 = a1[5];
        unint64_t v105 = v108 + 1 - v31;
        if (v108 + 1 <= v31) {
          goto LABEL_46;
        }
        uint64_t v32 = a1[4];
        uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
        unint64_t v104 = v32;
        while (v32 < [v111 tokenColumnCount])
        {
          double v34 = objc_msgSend(v111, "strokeIndexesForColumnsInRange:", v32, 1);
          CGFloat v35 = (void *)a1[1];
          if (v35) {
            CGFloat v35 = (void *)v35[2];
          }
          double v36 = v35;
          double v37 = objc_msgSend(v36, "strokeIndexesForColumnsInRange:", v32, 1);

          id v38 = (void *)a1[1];
          if (v38) {
            id v38 = (void *)v38[2];
          }
          uint64_t v39 = v38;
          uint64_t v40 = (void *)a1[1];
          if (v40) {
            uint64_t v40 = (void *)v40[2];
          }
          uint64_t v41 = v40;
          id v42 = [v41 refinableTranscriptionPath];
          id v43 = objc_msgSend(v39, "transcriptionWithPath:columnRange:filterLowConfidence:", v42, v32, 1, 0);

          uint64_t v44 = [v111 refinableTranscriptionPath];
          char v45 = objc_msgSend(v111, "transcriptionWithPath:columnRange:filterLowConfidence:", v44, v32, 1, 0);

          LODWORD(v44) = [v43 isEqualToString:v45];
          int v46 = [v34 isEqualToIndexSet:v37] & v44;
          uint64_t v47 = v32;
          if ((v46 & 1) == 0)
          {
            v48 = os_log_create("com.apple.pencilkit", "AutoRefine");
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              long long v51 = (void *)a1[1];
              if (v51) {
                long long v51 = (void *)v51[2];
              }
              v101 = v51;
              v103 = [v101 topTranscription];
              long long v52 = (void *)a1[1];
              if (v52) {
                long long v52 = (void *)v52[2];
              }
              v102 = v52;
              uint64_t v99 = [v102 tokenColumnCount];
              uint64_t v97 = a1[4];
              uint64_t v98 = a1[5];
              v100 = [v111 topTranscription];
              uint64_t v53 = [v111 tokenColumnCount];
              *(_DWORD *)buf = 134220803;
              v113 = a1;
              __int16 v114 = 2117;
              v115 = v103;
              __int16 v116 = 2048;
              uint64_t v117 = v99;
              __int16 v118 = 2048;
              uint64_t v119 = v97;
              __int16 v120 = 2048;
              uint64_t v121 = v98;
              __int16 v122 = 2117;
              v123 = v100;
              __int16 v124 = 2048;
              uint64_t v125 = v53;
              __int16 v126 = 2048;
              uint64_t v127 = v32;
              __int16 v128 = 2112;
              v129 = v34;
              __int16 v130 = 2112;
              v131 = v45;
              __int16 v132 = 2112;
              v133 = v37;
              __int16 v134 = 2112;
              v135 = v43;
              _os_log_debug_impl(&dword_1C44F8000, v48, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription %{sensitive}@ (%ld columns, committable range %ld-%ld) TRIMMED by new item with transcription %{sensitive}@ (%ld columns), different strokes in column %ld: %@ [%@] vs  %@ [%@]", buf, 0x7Au);
            }
            uint64_t v47 = v33;
          }

          if (v108 == v32++) {
            char v50 = 0;
          }
          else {
            char v50 = v46;
          }
          uint64_t v33 = v47;
          if ((v50 & 1) == 0) {
            goto LABEL_45;
          }
        }
        uint64_t v47 = v33;
LABEL_45:
        unint64_t v31 = v104;
        if (v47 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_46:
          uint64_t v54 = (void *)a1[1];
          if (v54) {
            uint64_t v54 = (void *)v54[2];
          }
          uint64_t v55 = v54;
          __int16 v56 = (void *)a1[1];
          if (v56) {
            __int16 v56 = (void *)v56[2];
          }
          uint64_t v57 = v56;
          __int16 v58 = [v57 transcriptionPaths];
          uint64_t v59 = [v58 firstObject];
          __int16 v60 = objc_msgSend(v55, "transcriptionWithPath:columnRange:filterLowConfidence:", v59, v31, v105, 0);

          uint64_t v61 = os_log_create("com.apple.pencilkit", "AutoRefine");
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            __int16 v72 = (void *)a1[1];
            if (v72) {
              __int16 v72 = (void *)v72[2];
            }
            v109 = v72;
            v73 = [v109 topTranscription];
            __int16 v74 = (void *)a1[1];
            if (v74) {
              __int16 v74 = (void *)v74[2];
            }
            uint64_t v75 = v74;
            uint64_t v76 = [v75 tokenColumnCount];
            uint64_t v78 = a1[4];
            uint64_t v77 = a1[5];
            id v79 = [v111 topTranscription];
            uint64_t v80 = [v111 tokenColumnCount];
            *(_DWORD *)buf = 134219779;
            v113 = a1;
            __int16 v114 = 2117;
            v115 = v73;
            __int16 v116 = 2048;
            uint64_t v117 = v76;
            __int16 v118 = 2048;
            uint64_t v119 = v78;
            __int16 v120 = 2048;
            uint64_t v121 = v77;
            __int16 v122 = 2112;
            v123 = v60;
            __int16 v124 = 2117;
            uint64_t v125 = (uint64_t)v79;
            __int16 v126 = 2048;
            uint64_t v127 = v80;
            _os_log_debug_impl(&dword_1C44F8000, v61, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription %{sensitive}@ (%ld columns, committable range %ld-%ld, committable string %@) CANCELLED by new item with transcription %{sensitive}@ (%ld columns) - no column remains valid", buf, 0x52u);
          }
          *a3 = 1;
        }
        else
        {
          if (v47 < a1[5])
          {
            v62 = (void *)a1[1];
            if (v62) {
              v62 = (void *)v62[2];
            }
            uint64_t v63 = v62;
            v64 = (void *)a1[1];
            if (v64) {
              v64 = (void *)v64[2];
            }
            double v65 = v64;
            v66 = [v65 transcriptionPaths];
            CGFloat v67 = [v66 firstObject];
            v68 = objc_msgSend(v63, "transcriptionWithPath:columnRange:filterLowConfidence:", v67);

            CGFloat v69 = os_log_create("com.apple.pencilkit", "AutoRefine");
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            {
              CGRect v89 = (void *)a1[1];
              if (v89) {
                CGRect v89 = (void *)v89[2];
              }
              CGRect v90 = v89;
              CGRect v91 = [v90 topTranscription];
              CGRect v92 = (void *)a1[1];
              if (v92) {
                CGRect v92 = (void *)v92[2];
              }
              CGRect v93 = v92;
              uint64_t v94 = [v93 tokenColumnCount];
              CGRect v95 = (void *)a1[4];
              uint64_t v96 = a1[5];
              *(_DWORD *)buf = 134219779;
              v113 = a1;
              __int16 v114 = 2117;
              v115 = v91;
              __int16 v116 = 2048;
              uint64_t v117 = v94;
              __int16 v118 = 2048;
              uint64_t v119 = (uint64_t)v95;
              __int16 v120 = 2048;
              uint64_t v121 = v96;
              __int16 v122 = 2048;
              v123 = v95;
              __int16 v124 = 2048;
              uint64_t v125 = v47;
              __int16 v126 = 2117;
              uint64_t v127 = (uint64_t)v68;
              _os_log_debug_impl(&dword_1C44F8000, v69, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p with transcription %{sensitive}@ (%ld columns, committable range %ld-%ld) TRIMMED to committable range %ld-%ld, new string to refine = %{sensitive}@", buf, 0x52u);
            }
            a1[5] = v47;
            -[PKAutoRefineTask updateCommittableRange]((uint64_t)a1);
            v70 = os_log_create("com.apple.pencilkit", "AutoRefine");
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
            {
              v71 = (void *)a1[9];
              *(_DWORD *)buf = 134218243;
              v113 = a1;
              __int16 v114 = 2117;
              v115 = v71;
              _os_log_impl(&dword_1C44F8000, v70, OS_LOG_TYPE_DEFAULT, "AutoRefine task %p just trimmed has committable transcription = _%{sensitive}@_", buf, 0x16u);
            }
          }
          *a3 = 0;
        }
      }
    }
    else
    {
      double v28 = [v110 insertions];
      [v28 count];

      *a3 = 1;
      long long v29 = os_log_create("com.apple.pencilkit", "AutoRefine");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v113 = a1;
        _os_log_impl(&dword_1C44F8000, v29, OS_LOG_TYPE_DEFAULT, "AutoRefine task %p should be canceled", buf, 0xCu);
      }
    }
    int v5 = v107;
  }
}

- (uint64_t)isInvalidatedGivenDrawing:(void *)a3 autoRefineController:(void *)a4 currentStroke:(void *)a5 inStrokesToReplace:(void *)a6 lineDrawing:(void *)a7 strokeGroups:(void *)a8 outStrokeGroupsToReplace:(void *)a9 outStrokesToPreserve:
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  id v91 = a3;
  id v86 = a4;
  id v87 = a5;
  id v90 = a6;
  id v89 = a7;
  if (!a1)
  {
    uint64_t v48 = 0;
    goto LABEL_46;
  }
  if (*(unsigned char *)(a1 + 104))
  {
    uint64_t v17 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v107 = a1;
      __int16 v108 = 2048;
      uint64_t v109 = [v90 strokeCount];
      _os_log_debug_impl(&dword_1C44F8000, v17, OS_LOG_TYPE_DEBUG, "AutoRefine task %p has been canceled, invalid for updating the drawing - %ld strokes generated.", buf, 0x16u);
    }
LABEL_5:
    id v88 = v17;

    goto LABEL_44;
  }
  if (!v90 || ![v90 strokeCount])
  {
    uint64_t v17 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v107 = a1;
      __int16 v108 = 2048;
      uint64_t v109 = [v87 count];
      _os_log_debug_impl(&dword_1C44F8000, v17, OS_LOG_TYPE_DEBUG, "AutoRefine task %p did not generate any drawing from %ld strokes to replace.", buf, 0x16u);
    }
    goto LABEL_5;
  }
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  unint64_t v22 = 0x1E4F1C000uLL;
  uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = v89;
  id v88 = (id)v23;
  uint64_t v24 = [obj countByEnumeratingWithState:&v101 objects:v117 count:16];
  if (!v24)
  {

LABEL_41:
    uint64_t v47 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v107 = a1;
      _os_log_debug_impl(&dword_1C44F8000, v47, OS_LOG_TYPE_DEBUG, "AutoRefine task %p did not have any stroke to replace.", buf, 0xCu);
    }

    goto LABEL_44;
  }
  uint64_t v78 = a8;
  char v25 = 0;
  uint64_t v77 = a9;
  uint64_t v26 = *(void *)v102;
  char v27 = 1;
  uint64_t v79 = *(void *)v102;
  do
  {
    uint64_t v28 = 0;
    uint64_t v80 = v24;
    do
    {
      if (*(void *)v102 != v26) {
        objc_enumerationMutation(obj);
      }
      uint64_t v82 = v28;
      long long v29 = *(void **)(*((void *)&v101 + 1) + 8 * v28);
      CGFloat v30 = objc_msgSend(*(id *)(v22 + 2632), "array", v77);
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v31 = v29;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v97 objects:v116 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v98;
        while (2)
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v98 != v33) {
              objc_enumerationMutation(v31);
            }
            CGFloat v35 = [*(id *)(*((void *)&v97 + 1) + 8 * i) strokeUUID];
            double v36 = [v16 _visibleStrokeForIdentifier:v35];

            if (v25)
            {
              char v25 = 1;
              if (!v36) {
                goto LABEL_37;
              }
            }
            else
            {
              char v25 = -[PKAutoRefineController isRefinableStroke:]((uint64_t)v91, v36);
              if (!v36)
              {
LABEL_37:
                int v46 = os_log_create("com.apple.pencilkit", "AutoRefine");
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  uint64_t v107 = a1;
                  _os_log_debug_impl(&dword_1C44F8000, v46, OS_LOG_TYPE_DEBUG, "AutoRefine task %p cancelled because it can no longer access one of the strokes to replace.", buf, 0xCu);
                }

                goto LABEL_44;
              }
            }
            [v36 _bounds];
            v121.origin.CGFloat x = v37;
            v121.origin.CGFloat y = v38;
            v121.size.CGFloat width = v39;
            v121.size.CGFloat height = v40;
            v119.origin.CGFloat x = x;
            v119.origin.CGFloat y = y;
            v119.size.CGFloat width = width;
            v119.size.CGFloat height = height;
            CGRect v120 = CGRectUnion(v119, v121);
            CGFloat x = v120.origin.x;
            CGFloat y = v120.origin.y;
            CGFloat width = v120.size.width;
            CGFloat height = v120.size.height;
            [v30 addObject:v36];
          }
          uint64_t v32 = [v31 countByEnumeratingWithState:&v97 objects:v116 count:16];
          if (v32) {
            continue;
          }
          break;
        }
        char v27 = 0;
      }

      [v88 addObject:v30];
      uint64_t v28 = v82 + 1;
      unint64_t v22 = 0x1E4F1C000;
      uint64_t v26 = v79;
    }
    while (v82 + 1 != v80);
    uint64_t v24 = [obj countByEnumeratingWithState:&v101 objects:v117 count:16];
  }
  while (v24);

  if (v27) {
    goto LABEL_41;
  }
  if ((v25 & 1) == 0)
  {
    char v50 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v107 = a1;
      _os_log_debug_impl(&dword_1C44F8000, v50, OS_LOG_TYPE_DEBUG, "AutoRefine task %p skips committing synthetic drawing with no refinable strokes.", buf, 0xCu);
    }

    uint64_t v48 = 0;
    *uint64_t v78 = &unk_1F200EF58;
    goto LABEL_45;
  }
  if (!v86
    || (char v96 = 0,
        [v86 _bounds],
        -[PKAutoRefineTask trimTaskForNewStrokeInRect:shouldCancel:]((uint64_t *)a1, &v96, v41, v42, v43, v44),
        !v96))
  {
    long long v51 = *(void **)(a1 + 8);
    if (v51) {
      long long v51 = (void *)v51[2];
    }
    long long v52 = v51;
    CGRect v83 = objc_msgSend(v52, "strokeIndexesForColumnsInRange:");

    uint64_t v53 = *(void **)(a1 + 8);
    if (v53) {
      uint64_t v53 = (void *)v53[4];
    }
    uint64_t v54 = v53;
    id obja = [v54 objectsAtIndexes:v83];

    uint64_t v55 = [MEMORY[0x1E4F1CAD0] setWithArray:v87];
    __int16 v56 = [MEMORY[0x1E4F1CAD0] setWithArray:obja];
    int v57 = [v55 isSubsetOfSet:v56];

    __int16 v58 = os_log_create("com.apple.pencilkit", "AutoRefine");
    BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG);
    if (v57)
    {
      if (v59)
      {
        uint64_t v70 = [v87 count];
        uint64_t v71 = [obja count];
        uint64_t v72 = *(void *)(a1 + 32);
        uint64_t v73 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134219008;
        uint64_t v107 = a1;
        __int16 v108 = 2048;
        uint64_t v109 = v70;
        __int16 v110 = 2048;
        uint64_t v111 = v71;
        __int16 v112 = 2048;
        uint64_t v113 = v72;
        __int16 v114 = 2048;
        uint64_t v115 = v73;
        _os_log_debug_impl(&dword_1C44F8000, v58, OS_LOG_TYPE_DEBUG, "AutoRefine task %p NOT rejecting new drawing with %ld strokes to replace and %ld strokes in the commitable range [%ld-%ld].", buf, 0x34u);
      }

      if (v77)
      {
        __int16 v60 = *(void **)(a1 + 8);
        if (v60) {
          __int16 v60 = (void *)v60[4];
        }
        uint64_t v61 = v60;
        v81 = (void *)[v61 mutableCopy];

        v62 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v81, "count"));
        [v81 removeObjectsInArray:obja];
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v63 = v81;
        uint64_t v64 = [v63 countByEnumeratingWithState:&v92 objects:v105 count:16];
        if (v64)
        {
          uint64_t v65 = *(void *)v93;
          do
          {
            for (uint64_t j = 0; j != v64; ++j)
            {
              if (*(void *)v93 != v65) {
                objc_enumerationMutation(v63);
              }
              CGFloat v67 = [*(id *)(*((void *)&v92 + 1) + 8 * j) strokeUUID];
              v68 = [v16 _visibleStrokeForIdentifier:v67];

              if (v68) {
                [v62 addObject:v68];
              }
            }
            uint64_t v64 = [v63 countByEnumeratingWithState:&v92 objects:v105 count:16];
          }
          while (v64);
        }

        id v69 = v62;
        *uint64_t v77 = v69;
      }
      if (v78) {
        *uint64_t v78 = v88;
      }
    }
    else
    {
      if (v59)
      {
        uint64_t v74 = [v90 strokeCount];
        uint64_t v75 = *(void *)(a1 + 32);
        uint64_t v76 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218752;
        uint64_t v107 = a1;
        __int16 v108 = 2048;
        uint64_t v109 = v74;
        __int16 v110 = 2048;
        uint64_t v111 = v75;
        __int16 v112 = 2048;
        uint64_t v113 = v76;
        _os_log_debug_impl(&dword_1C44F8000, v58, OS_LOG_TYPE_DEBUG, "AutoRefine task %p rejecting new drawing with %ld strokes because some strokes to replace are not in the committable token range [%ld-%ld].", buf, 0x2Au);
      }
    }
    uint64_t v48 = v57 ^ 1u;
    goto LABEL_45;
  }
  char v45 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v107 = a1;
    _os_log_debug_impl(&dword_1C44F8000, v45, OS_LOG_TYPE_DEBUG, "AutoRefine task %p cancelled because current stroke is being drawn nearby.", buf, 0xCu);
  }

LABEL_44:
  uint64_t v48 = 1;
LABEL_45:

LABEL_46:
  return v48;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_strokesToReplace, 0);
  objc_storeStrong((id *)&self->_stringToRefine, 0);
  objc_storeStrong((id *)&self->_providerVersion, 0);

  objc_storeStrong((id *)&self->_queryItem, 0);
}

@end