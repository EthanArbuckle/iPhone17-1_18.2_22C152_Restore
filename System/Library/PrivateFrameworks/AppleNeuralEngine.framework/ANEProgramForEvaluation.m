@interface ANEProgramForEvaluation
@end

@implementation ANEProgramForEvaluation

void __100___ANEProgramForEvaluation_processRequest_model_qos_qIndex_modelStringID_options_returnValue_error___block_invoke(uint64_t a1, unsigned int *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v4 = +[_ANELog common];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v33 = NSStringFromSelector(*(SEL *)(a1 + 96));
    unsigned int v35 = *a2;
    unsigned int v34 = a2[1];
    int v36 = *(_DWORD *)(a1 + 112);
    *(_DWORD *)buf = 138413058;
    v38 = v33;
    __int16 v39 = 1024;
    unsigned int v40 = v34;
    __int16 v41 = 1024;
    unsigned int v42 = v35;
    __int16 v43 = 1024;
    int v44 = v36;
    _os_log_debug_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_DEBUG, "-----> %@: ANEProgramProcessRequestDirect() status=0x%x : statusType=0x%x : qos=0x%x", buf, 0x1Eu);
  }
  unsigned int v5 = *a2;
  if (*a2 == 19)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    v6 = (unsigned int *)*((void *)a2 + 1);
    v7 = NSString;
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 96));
    v9 = (void *)v8;
    if (v6)
    {
      v10 = [v7 stringWithFormat:@"%@: 0x%x", v8, *v6];

      uint64_t v11 = +[_ANEErrors programInferenceOverflowErrorForMethod:v10];
      uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
      v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      +[_ANEDataReporter addValue:1 forScalarKey:@"InferenceOverflowed"];
      return;
    }
    v23 = [v7 stringWithFormat:@"%@: Expecting EventPayLoad 0x%x", v8, *a2];

    uint64_t v29 = +[_ANEErrors programInferenceOtherErrorForMethod:v23];
    uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8);
    v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;

    +[_ANEDataReporter addValue:1 forScalarKey:@"ModelFailsToRun"];
    v28 = +[_ANELog common];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 96));
      objc_claimAutoreleasedReturnValue();
      __100___ANEProgramForEvaluation_processRequest_model_qos_qIndex_modelStringID_options_returnValue_error___block_invoke_cold_1();
    }
    goto LABEL_18;
  }
  if (v5 != 8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v24 = *(void *)(a1 + 32);
    v25 = *(void **)(a1 + 40);
    v23 = NSStringFromSelector(*(SEL *)(a1 + 96));
    uint64_t v26 = [v25 programInferenceOtherErrorForMessage:a2 model:v24 methodName:v23];
    uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
    v28 = *(NSObject **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
LABEL_18:

    goto LABEL_19;
  }
  if (a2[1]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && !*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    v16 = NSStringFromSelector(*(SEL *)(a1 + 96));
    uint64_t v17 = [v15 programInferenceOtherErrorForMessage:a2 model:v14 methodName:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
    goto LABEL_20;
  }
  uint64_t v20 = +[_ANEPerformanceStats statsWithRequestPerformanceBuffer:a2 + 4 statsBufferSize:a2 + 12];
  [*(id *)(a1 + 48) setPerfStats:v20];

  v21 = [*(id *)(a1 + 48) perfStats];
  LOBYTE(v20) = v21 == 0;

  if (v20) {
    goto LABEL_20;
  }
  v22 = [*(id *)(a1 + 48) perfStats];
  [v22 hwExecutionTime];

  v23 = [*(id *)(a1 + 48) perfStats];
  [v23 emitPerfcounterSignpostsWithModelStringID:*(void *)(a1 + 104)];
LABEL_19:

LABEL_20:
  kdebug_trace();
  if (*(unsigned char *)(a1 + 116))
  {
    kdebug_trace();
  }
  else
  {
    if (v5 != 19) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    kdebug_trace();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
    v32 = [*(id *)(a1 + 40) requestsInFlight];
    dispatch_semaphore_signal(v32);

    objc_msgSend(*(id *)(a1 + 40), "setCurrentAsyncRequestsInFlight:", objc_msgSend(*(id *)(a1 + 40), "currentAsyncRequestsInFlight") - 1);
  }
}

void __100___ANEProgramForEvaluation_processRequest_model_qos_qIndex_modelStringID_options_returnValue_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  uint64_t v2 = *(void *)(v1 + 32);
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)(v3 + 4) = v4;
  *(_WORD *)(v3 + 12) = 2112;
  *(void *)(v3 + 14) = v2;
  _os_log_error_impl(&dword_1DB8AB000, v6, OS_LOG_TYPE_ERROR, "%@: Expecting EventPayLoad lModel=%@", v5, 0x16u);
}

@end