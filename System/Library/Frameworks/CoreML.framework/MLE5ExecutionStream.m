@interface MLE5ExecutionStream
- (BOOL)_executeStream:(e5rt_execution_stream *)a3 error:(id *)a4;
- (BOOL)_prepareForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)_reusableForInputFeatures:(id)a3 options:(id)a4;
- (BOOL)executeForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)prepareAsyncSubmissionForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)reusableForAsyncSubmissionForInputFeatures:(id)a3 options:(id)a4;
- (BOOL)reusableForSyncPredictionForInputFeatures:(id)a3 options:(id)a4;
- (BOOL)setupOperationForInputFeatures:(id)a3 operationPool:(id)a4 error:(id *)a5;
- (MLE5ExecutionStream)init;
- (MLE5ExecutionStreamOperationPool)operationPool;
- (NSArray)operations;
- (OS_dispatch_queue)resetQueue;
- (OS_dispatch_source)resetTimer;
- (e5rt_execution_stream)streamHandle;
- (int64_t)state;
- (unint64_t)streamId;
- (void)_reset;
- (void)_setANEExecutionPriorityWithOptions:(id)a3;
- (void)cancelPendingReset;
- (void)dealloc;
- (void)resetAfterLingering:(double)a3;
- (void)setOperationPool:(id)a3;
- (void)setOperations:(id)a3;
- (void)setResetTimer:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStreamHandle:(e5rt_execution_stream *)a3;
- (void)submitWithCompletionHandler:(id)a3;
@end

@implementation MLE5ExecutionStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetTimer, 0);
  objc_storeStrong((id *)&self->_resetQueue, 0);
  objc_storeStrong((id *)&self->_operationPool, 0);

  objc_storeStrong((id *)&self->_operations, 0);
}

- (void)setResetTimer:(id)a3
{
}

- (OS_dispatch_source)resetTimer
{
  return self->_resetTimer;
}

- (OS_dispatch_queue)resetQueue
{
  return self->_resetQueue;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setStreamHandle:(e5rt_execution_stream *)a3
{
  self->_streamHandle = a3;
}

- (e5rt_execution_stream)streamHandle
{
  return self->_streamHandle;
}

- (void)setOperationPool:(id)a3
{
}

- (MLE5ExecutionStreamOperationPool)operationPool
{
  return self->_operationPool;
}

- (void)setOperations:(id)a3
{
}

- (NSArray)operations
{
  return self->_operations;
}

- (unint64_t)streamId
{
  unint64_t v5 = 0;
  if (e5rt_execution_stream_get_stream_id())
  {
    v2 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_19E58B000, v2, OS_LOG_TYPE_ERROR, "Unexpected failure when getting execution stream id.", v4, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unexpected failure when getting execution stream id."];
  }
  return v5;
}

- (void)_reset
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(MLE5ExecutionStream *)self streamHandle])
  {
    [(MLE5ExecutionStream *)self streamHandle];
    uint64_t v3 = e5rt_execution_stream_reset();
    if (v3)
    {
      uint64_t v4 = v3;
      unint64_t v5 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t last_error_message = e5rt_get_last_error_message();
        __int16 v19 = 1024;
        int v20 = v4;
        _os_log_error_impl(&dword_19E58B000, v5, OS_LOG_TYPE_ERROR, "Failed to reset the stream. E5RT: %s (%d)", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Failed to reset the stream. E5RT: %s (%d)", e5rt_get_last_error_message(), v4);
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = [(MLE5ExecutionStream *)self operations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v10 reset];
        v11 = [(MLE5ExecutionStream *)self operationPool];
        [v11 putBack:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(MLE5ExecutionStream *)self setOperations:MEMORY[0x1E4F1CBF0]];
  [(MLE5ExecutionStream *)self setOperationPool:0];
  [(MLE5ExecutionStream *)self setState:0];
}

- (void)cancelPendingReset
{
  uint64_t v3 = [(MLE5ExecutionStream *)self resetTimer];

  if (v3)
  {
    uint64_t v4 = [(MLE5ExecutionStream *)self resetTimer];
    dispatch_source_cancel(v4);

    unint64_t v5 = [(MLE5ExecutionStream *)self resetQueue];
    dispatch_barrier_sync(v5, &__block_literal_global_61_22121);
  }
}

- (void)resetAfterLingering:(double)a3
{
  if (a3 == 0.0)
  {
    [(MLE5ExecutionStream *)self _reset];
  }
  else
  {
    unint64_t v5 = [(MLE5ExecutionStream *)self resetTimer];

    if (v5)
    {
      v6 = [(MLE5ExecutionStream *)self resetTimer];
      dispatch_suspend(v6);
    }
    else
    {
      v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_resetQueue);
      [(MLE5ExecutionStream *)self setResetTimer:v6];
    }

    uint64_t v7 = [(MLE5ExecutionStream *)self resetTimer];
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);

    objc_initWeak(&location, self);
    v9 = [(MLE5ExecutionStream *)self resetTimer];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    long long v13 = __43__MLE5ExecutionStream_resetAfterLingering___block_invoke;
    long long v14 = &unk_1E59A4F68;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v9, &v11);

    v10 = [(MLE5ExecutionStream *)self resetTimer];
    dispatch_resume(v10);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __43__MLE5ExecutionStream_resetAfterLingering___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained _reset];
  }
}

- (void)_setANEExecutionPriorityWithOptions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 aneExecutionPriority];
  unsigned int v6 = [v4 aneQoS];
  if (v5 != @"MLANEExecutionPriority_Unspecified")
  {
    uint64_t v7 = v5;
    dispatch_time_t v8 = v7;
    if (v7 == @"MLANEExecutionPriority_2")
    {
      uint64_t v10 = 2;
    }
    else if (v7 == @"MLANEExecutionPriority_3")
    {
      uint64_t v10 = 3;
    }
    else if (v7 == @"MLANEExecutionPriority_4")
    {
      uint64_t v10 = 4;
    }
    else if (v7 == @"MLANEExecutionPriority_5")
    {
      uint64_t v10 = 5;
    }
    else if (v7 == @"MLANEExecutionPriority_6")
    {
      uint64_t v10 = 6;
    }
    else if (v7 == @"MLANEExecutionPriority_7")
    {
      uint64_t v10 = 7;
    }
    else
    {
      v9 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)__int16 v19 = v8;
        _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "Unrecognized ANE execution priority %@", buf, 0xCu);
      }

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unrecognized ANE execution priority %@", v8 format];
      uint64_t v10 = 0;
    }

    [(MLE5ExecutionStream *)self streamHandle];
    uint64_t v15 = e5rt_execution_stream_set_ane_execution_priority();
    if (v15)
    {
      v16 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t last_error_message = e5rt_get_last_error_message();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)__int16 v19 = v10;
        *(_WORD *)&v19[4] = 2080;
        *(void *)&v19[6] = last_error_message;
        __int16 v20 = 1024;
        int v21 = v15;
        _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "Failed to set execution priority %u for ane operations E5RT: %s (%d)", buf, 0x18u);
      }

      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Failed to set execution priority %u for ane operations E5RT: %s (%d)", v10, e5rt_get_last_error_message(), v15);
    }
    goto LABEL_37;
  }
  if (v6)
  {
    if (v6 == 5) {
      uint64_t v11 = 9;
    }
    else {
      uint64_t v11 = v6;
    }
    [(MLE5ExecutionStream *)self streamHandle];
    uint64_t v12 = e5rt_execution_stream_set_quality_of_service();
    if (!v12) {
      goto LABEL_37;
    }
    long long v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)__int16 v19 = v11;
      *(_WORD *)&v19[4] = 2080;
      *(void *)&v19[6] = e5rt_get_last_error_message();
      __int16 v20 = 1024;
      int v21 = v12;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Failed to set QoS %u for ane operations E5RT: %s (%d)", buf, 0x18u);
    }
LABEL_18:

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Failed to set QoS %u for ane operations E5RT: %s (%d)", v11, e5rt_get_last_error_message(), v12);
    goto LABEL_37;
  }
  uint64_t v14 = qos_class_self();
  uint64_t v11 = v14;
  if (v14 == 5)
  {
    uint64_t v11 = 9;
  }
  else if (!v14)
  {
    uint64_t v11 = 21;
  }
  [(MLE5ExecutionStream *)self streamHandle];
  uint64_t v12 = e5rt_execution_stream_set_quality_of_service();
  if (v12)
  {
    long long v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)__int16 v19 = v11;
      *(_WORD *)&v19[4] = 2080;
      *(void *)&v19[6] = e5rt_get_last_error_message();
      __int16 v20 = 1024;
      int v21 = v12;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Failed to set QoS %u for ane operations E5RT: %s (%d)", buf, 0x18u);
    }
    goto LABEL_18;
  }
LABEL_37:
}

- (void)submitWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3812000000;
  v4[3] = __Block_byref_object_copy__22137;
  v4[4] = __Block_byref_object_dispose__22138;
  v4[5] = 0;
  operator new();
}

void __51__MLE5ExecutionStream_submitWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)atomic_fetch_add(*(atomic_uint *volatile *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), 1u) < 1)
  {
    dispatch_time_t v8 = [*(id *)(a1 + 32) operations];
    unsigned int v6 = [v8 objectAtIndexedSubscript:0];

    v9 = [v6 asyncSubmissionError];

    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = [v6 asyncSubmissionError];
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);

      goto LABEL_17;
    }
    if (a4 == 10)
    {
      uint64_t v14 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t last_error_message = e5rt_get_last_error_message();
        __int16 v20 = 1024;
        int v21 = 10;
        _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
      }

      uint64_t v15 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), 10];
      uint64_t v16 = +[MLModelErrorUtils errorWithCode:0 underlyingError:v15 format:@"Timeout occurred while computing the asynchronous prediction using ML Program."];
    }
    else
    {
      if (!a4)
      {
        uint64_t v12 = 0;
        long long v13 = [v6 outputFeatures];
LABEL_16:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        goto LABEL_17;
      }
      v17 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t last_error_message = e5rt_get_last_error_message();
        __int16 v20 = 1024;
        int v21 = a4;
        _os_log_error_impl(&dword_19E58B000, v17, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
      }

      uint64_t v15 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), a4];
      uint64_t v16 = +[MLModelErrorUtils errorWithCode:0 underlyingError:v15 format:@"Unable to compute the asynchronous prediction using ML Program. It can be an invalid input data or broken/unsupported model."];
    }
    uint64_t v12 = (void *)v16;

    long long v13 = 0;
    goto LABEL_16;
  }
  unsigned int v6 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t last_error_message = a2;
    __int16 v20 = 1024;
    int v21 = a4;
    _os_log_error_impl(&dword_19E58B000, v6, OS_LOG_TYPE_ERROR, "e5rt_execution_stream_submit_async called the completion handler more than once for stream_id = %llu and error: %d", buf, 0x12u);
  }
LABEL_17:
}

- (BOOL)_executeStream:(e5rt_execution_stream *)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  uint64_t v5 = e5rt_execution_stream_execute_sync();
  if (v5)
  {
    unsigned int v6 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t last_error_message = e5rt_get_last_error_message();
      __int16 v11 = 1024;
      int v12 = v5;
      _os_log_error_impl(&dword_19E58B000, v6, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
    }

    if (a4)
    {
      uint64_t v7 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), v5];
      *a4 = +[MLModelErrorUtils errorWithCode:0 underlyingError:v7 format:@"Unable to compute the prediction using ML Program. It can be an invalid input data or broken/unsupported model."];
    }
  }
  kdebug_trace();
  return v5 == 0;
}

- (BOOL)executeForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(MLE5ExecutionStream *)self _prepareForInputFeatures:v8 options:v9 error:a5]&& [(MLE5ExecutionStream *)self _executeStream:self->_streamHandle error:a5];

  return v10;
}

- (BOOL)setupOperationForInputFeatures:(id)a3 operationPool:(id)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 takeOutOperationForFeatures:v8 error:a5];
  __int16 v11 = (void *)v10;
  if (v10)
  {
    v14[0] = v10;
    int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [(MLE5ExecutionStream *)self setOperations:v12];

    [(MLE5ExecutionStream *)self setOperationPool:v9];
  }

  return v11 != 0;
}

- (BOOL)prepareAsyncSubmissionForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v23 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = [(MLE5ExecutionStream *)self operations];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v8);
        }
        if (([*(id *)(*((void *)&v28 + 1) + 8 * i) prepareAsyncSubmissionForInputFeatures:v22 options:v23 error:a5] & 1) == 0)
        {

          BOOL v20 = 0;
          goto LABEL_24;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  [(MLE5ExecutionStream *)self _setANEExecutionPriorityWithOptions:v23];
  if ([(MLE5ExecutionStream *)self state] != 2)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    int v12 = [(MLE5ExecutionStream *)self operations];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v25;
      uint64_t v15 = *MEMORY[0x1E4F1C3A8];
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * v16) operationHandle];
          uint64_t v17 = e5rt_execution_stream_encode_operation();
          if (v17)
          {
            v18 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              uint64_t last_error_message = e5rt_get_last_error_message();
              *(_DWORD *)buf = 136315394;
              uint64_t v33 = last_error_message;
              __int16 v34 = 1024;
              int v35 = v17;
              _os_log_error_impl(&dword_19E58B000, v18, OS_LOG_TYPE_ERROR, "Failed to add operation to E5 stream. E5RT: %s (%d)", buf, 0x12u);
            }

            objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v15, @"Failed to add operation to E5 stream. E5RT: %s (%d)", e5rt_get_last_error_message(), v17);
          }
          ++v16;
        }
        while (v13 != v16);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v13);
    }

    [(MLE5ExecutionStream *)self setState:2];
  }
  BOOL v20 = 1;
LABEL_24:

  return v20;
}

- (BOOL)_prepareForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v23 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = [(MLE5ExecutionStream *)self operations];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v8);
        }
        if (([*(id *)(*((void *)&v28 + 1) + 8 * i) prepareForInputFeatures:v22 options:v23 error:a5] & 1) == 0)
        {

          BOOL v12 = 0;
          goto LABEL_24;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  [(MLE5ExecutionStream *)self _setANEExecutionPriorityWithOptions:v23];
  if ([(MLE5ExecutionStream *)self state] == 1)
  {
    BOOL v12 = 1;
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v13 = [(MLE5ExecutionStream *)self operations];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v25;
      uint64_t v16 = *MEMORY[0x1E4F1C3A8];
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * v17) operationHandle];
          uint64_t v18 = e5rt_execution_stream_encode_operation();
          if (v18)
          {
            __int16 v19 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              uint64_t last_error_message = e5rt_get_last_error_message();
              *(_DWORD *)buf = 136315394;
              uint64_t v33 = last_error_message;
              __int16 v34 = 1024;
              int v35 = v18;
              _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "Failed to add operation to E5 stream. E5RT: %s (%d)", buf, 0x12u);
            }

            objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v16, @"Failed to add operation to E5 stream. E5RT: %s (%d)", e5rt_get_last_error_message(), v18);
          }
          ++v17;
        }
        while (v14 != v17);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v14);
    }

    BOOL v12 = 1;
    [(MLE5ExecutionStream *)self setState:1];
  }
LABEL_24:

  return v12;
}

- (BOOL)reusableForSyncPredictionForInputFeatures:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MLE5ExecutionStream *)self state] == 1
    && [(MLE5ExecutionStream *)self _reusableForInputFeatures:v6 options:v7];

  return v8;
}

- (BOOL)reusableForAsyncSubmissionForInputFeatures:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MLE5ExecutionStream *)self state] == 2
    && [(MLE5ExecutionStream *)self _reusableForInputFeatures:v6 options:v7];

  return v8;
}

- (BOOL)_reusableForInputFeatures:(id)a3 options:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MLE5ExecutionStream *)self operations];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(MLE5ExecutionStream *)self operations];
    uint64_t v11 = [v10 count];

    if (v11 != 1)
    {
      BOOL v12 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        BOOL v20 = [(MLE5ExecutionStream *)self operations];
        *(_DWORD *)buf = 134217984;
        uint64_t v22 = [v20 count];
        _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "MLE5ExecutionStream has %tu operations, which is unexpected.", buf, 0xCu);
      }
      uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v14 = [(MLE5ExecutionStream *)self operations];
      uint64_t v15 = [v14 count];
      [v13 raise:*MEMORY[0x1E4F1C3B8], @"MLE5ExecutionStream has %tu operations, which is unexpected.", v15 format];
    }
    uint64_t v16 = [(MLE5ExecutionStream *)self operations];
    uint64_t v17 = [v16 objectAtIndexedSubscript:0];

    char v18 = [v17 reusableForInputFeatures:v6 options:v7];
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (void)dealloc
{
  resetTimer = self->_resetTimer;
  if (resetTimer) {
    dispatch_source_cancel(resetTimer);
  }
  if (self->_streamHandle) {
    e5rt_execution_stream_release();
  }
  v4.receiver = self;
  v4.super_class = (Class)MLE5ExecutionStream;
  [(MLE5ExecutionStream *)&v4 dealloc];
}

- (MLE5ExecutionStream)init
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)MLE5ExecutionStream;
  v2 = [(MLE5ExecutionStream *)&v13 init];
  if (v2)
  {
    uint64_t v3 = e5rt_execution_stream_create();
    if (v3)
    {
      objc_super v4 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t last_error_message = e5rt_get_last_error_message();
        *(_DWORD *)buf = 136315394;
        uint64_t v15 = last_error_message;
        __int16 v16 = 1024;
        int v17 = v3;
        _os_log_error_impl(&dword_19E58B000, v4, OS_LOG_TYPE_ERROR, "Failed to create a stream. E5RT: %s (%d)", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Failed to create a stream. E5RT: %s (%d)", e5rt_get_last_error_message(), v3);
    }
    operations = v2->_operations;
    v2->_operations = (NSArray *)MEMORY[0x1E4F1CBF0];

    operationPool = v2->_operationPool;
    v2->_operationPool = 0;

    v2->_state = 0;
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.coreml.MLE5ExecutionStream.resetQueue", v7);
    resetQueue = v2->_resetQueue;
    v2->_resetQueue = (OS_dispatch_queue *)v8;

    resetTimer = v2->_resetTimer;
    v2->_resetTimer = 0;
  }
  return v2;
}

@end