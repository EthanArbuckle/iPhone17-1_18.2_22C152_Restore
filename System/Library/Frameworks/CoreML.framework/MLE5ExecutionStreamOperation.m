@interface MLE5ExecutionStreamOperation
- (BOOL)_bindInputFeaturesAndWaitEvents:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)_bindOutputPortsWithOptions:(id)a3 error:(id *)a4;
- (BOOL)_copyInputFeatures:(id)a3 error:(id *)a4;
- (BOOL)_prepareInputPortsForFeatures:(id)a3 error:(id *)a4;
- (BOOL)_reusableForCompletionSyncPoint:(id)a3 allOutputBackingsUseDirectBinding:(BOOL)a4;
- (BOOL)_reusableForWaitSyncPoints:(id)a3 allInputsUseDirectBinding:(BOOL)a4;
- (BOOL)preloadAndReturnError:(id *)a3;
- (BOOL)prepareAsyncSubmissionForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)prepareForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)reusableForInputFeatures:(id)a3 options:(id)a4;
- (IOSurfaceSharedEventListener)waitEventListener;
- (MLE5ExecutionStreamOperation)initWithProgramLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 configuration:(id)a6 debugLabel:(id)a7 modelSignpostId:(unint64_t)a8;
- (MLE5ProgramLibrary)programLibrary;
- (MLFeatureProvider)outputFeatures;
- (MLModelConfiguration)modelConfiguration;
- (MLModelDescription)modelDescription;
- (MLPixelBufferPool)pixelBufferPool;
- (MTLSharedEvent)completionSharedEventBoundToESOP;
- (NSArray)directlyBoundInputFeatureNames;
- (NSArray)directlyBoundOutputFeatureNames;
- (NSArray)inputPorts;
- (NSArray)outputPorts;
- (NSArray)statePorts;
- (NSArray)waitSharedEventsBoundToESOP;
- (NSError)asyncSubmissionError;
- (NSString)debugLabel;
- (NSString)functionName;
- (NSString)shapeHash;
- (e5rt_execution_stream_operation)_createOperationAndReturnError:(id *)a3;
- (e5rt_execution_stream_operation)_createOperationWithRetryCount:(int64_t)a3 error:(id *)a4;
- (e5rt_execution_stream_operation)operationHandle;
- (id).cxx_construct;
- (id)_directlyBoundFeatureNamesForPorts:(id)a3;
- (id)_inoutPortNames;
- (id)_inputPortNames;
- (id)_multiArrayFeatureFromStateFeature:(id)a3;
- (id)_newArrayOfInoutPorts:(id)a3 featureDescriptionsByName:(id)a4 error:(id *)a5;
- (id)_newArrayOfInputPorts:(id)a3 featureDescriptionsByName:(id)a4 error:(id *)a5;
- (id)_newArrayOfOutputPorts:(id)a3 featureDescriptionsByName:(id)a4 error:(id *)a5;
- (id)_outputPortNames;
- (int64_t)state;
- (unint64_t)modelSignpostId;
- (void)_bindCompletionSyncPointDirectlyIfPossile:(id)a3;
- (void)_bindEventToWaitForCopyingInputFeatures:(id)a3 afterSyncPoints:(id)a4;
- (void)_bindNewCompletionEventsDirectlyWithCompletionSyncPoint:(id)a3;
- (void)_bindNewWaitEventsDirectlyWithWaitSyncPoints:(id)a3;
- (void)_bindWaitEventsDirectly:(id)a3;
- (void)_updateCompletionEventFutureValuesWithCompletionSyncPoint:(id)a3;
- (void)_updateWaitEventFutureValuesWithWaitSyncPoints:(id)a3;
- (void)dealloc;
- (void)reset;
- (void)setAsyncSubmissionError:(id)a3;
- (void)setCompletionSharedEventBoundToESOP:(id)a3;
- (void)setInputPorts:(id)a3;
- (void)setOperationHandle:(e5rt_execution_stream_operation *)a3;
- (void)setOutputPorts:(id)a3;
- (void)setPixelBufferPool:(id)a3;
- (void)setShapeHash:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStatePorts:(id)a3;
- (void)setWaitSharedEventsBoundToESOP:(id)a3;
@end

@implementation MLE5ExecutionStreamOperation

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionSharedEventBoundToESOP, 0);
  objc_storeStrong((id *)&self->_waitSharedEventsBoundToESOP, 0);
  objc_storeStrong((id *)&self->_waitEventListener, 0);
  objc_storeStrong((id *)&self->_outputPorts, 0);
  objc_storeStrong((id *)&self->_statePorts, 0);
  objc_storeStrong((id *)&self->_inputPorts, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_programLibrary, 0);
  objc_storeStrong((id *)&self->_shapeHash, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_asyncSubmissionError, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_pixelBufferPool, 0);

  std::unique_ptr<e5rt_async_event,MLE5ObjectDeleter<e5rt_async_event>>::reset[abi:ne180100]((uint64_t *)&self->_cachedWaitEvent, 0);
}

- (void)setCompletionSharedEventBoundToESOP:(id)a3
{
}

- (MTLSharedEvent)completionSharedEventBoundToESOP
{
  return self->_completionSharedEventBoundToESOP;
}

- (void)setWaitSharedEventsBoundToESOP:(id)a3
{
}

- (NSArray)waitSharedEventsBoundToESOP
{
  return self->_waitSharedEventsBoundToESOP;
}

- (unint64_t)modelSignpostId
{
  return self->_modelSignpostId;
}

- (IOSurfaceSharedEventListener)waitEventListener
{
  return self->_waitEventListener;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setOutputPorts:(id)a3
{
}

- (NSArray)outputPorts
{
  return self->_outputPorts;
}

- (void)setStatePorts:(id)a3
{
}

- (NSArray)statePorts
{
  return self->_statePorts;
}

- (void)setInputPorts:(id)a3
{
}

- (NSArray)inputPorts
{
  return self->_inputPorts;
}

- (MLModelConfiguration)modelConfiguration
{
  return self->_modelConfiguration;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (MLE5ProgramLibrary)programLibrary
{
  return self->_programLibrary;
}

- (void)setShapeHash:(id)a3
{
}

- (NSString)shapeHash
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)functionName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAsyncSubmissionError:(id)a3
{
}

- (NSError)asyncSubmissionError
{
  return self->_asyncSubmissionError;
}

- (NSString)debugLabel
{
  return self->_debugLabel;
}

- (void)setOperationHandle:(e5rt_execution_stream_operation *)a3
{
  self->_operationHandle = a3;
}

- (e5rt_execution_stream_operation)operationHandle
{
  return self->_operationHandle;
}

- (void)setPixelBufferPool:(id)a3
{
}

- (MLPixelBufferPool)pixelBufferPool
{
  return self->_pixelBufferPool;
}

- (id)_multiArrayFeatureFromStateFeature:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 internalStateValue];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 backings];
    if ([v6 count] != 1)
    {
      v7 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
      }
    }
    v8 = [v6 allValues];
    v9 = [v8 firstObject];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
      }
    }
    v11 = +[MLFeatureValue featureValueWithMultiArray:v9];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_outputPortNames
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(MLE5ExecutionStreamOperation *)self operationHandle];
  uint64_t num_outputs = e5rt_execution_stream_operation_get_num_outputs();
  id v3 = (void *)MEMORY[0x1E4F1C3A8];
  if (num_outputs)
  {
    v4 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t last_error_message = e5rt_get_last_error_message();
      __int16 v8 = 1024;
      int v9 = num_outputs;
      _os_log_error_impl(&dword_19E58B000, v4, OS_LOG_TYPE_ERROR, "Failed to get the number of outputs for operation E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v3, @"Failed to get the number of outputs for operation E5RT: %s (%d)", e5rt_get_last_error_message(), num_outputs);
  }
  operator new[]();
}

- (id)_inoutPortNames
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(MLE5ExecutionStreamOperation *)self operationHandle];
  uint64_t num_inouts = e5rt_execution_stream_operation_get_num_inouts();
  id v3 = (void *)MEMORY[0x1E4F1C3A8];
  if (num_inouts)
  {
    v4 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t last_error_message = e5rt_get_last_error_message();
      __int16 v8 = 1024;
      int v9 = num_inouts;
      _os_log_error_impl(&dword_19E58B000, v4, OS_LOG_TYPE_ERROR, "Failed to get the number of inout ports for operation. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v3, @"Failed to get the number of inout ports for operation. E5RT: %s (%d)", e5rt_get_last_error_message(), num_inouts);
  }
  operator new[]();
}

- (id)_inputPortNames
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(MLE5ExecutionStreamOperation *)self operationHandle];
  uint64_t num_inputs = e5rt_execution_stream_operation_get_num_inputs();
  id v3 = (void *)MEMORY[0x1E4F1C3A8];
  if (num_inputs)
  {
    v4 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t last_error_message = e5rt_get_last_error_message();
      __int16 v8 = 1024;
      int v9 = num_inputs;
      _os_log_error_impl(&dword_19E58B000, v4, OS_LOG_TYPE_ERROR, "Failed to get the number of inputs for operation. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v3, @"Failed to get the number of inputs for operation. E5RT: %s (%d)", e5rt_get_last_error_message(), num_inputs);
  }
  operator new[]();
}

- (void)_bindCompletionSyncPointDirectlyIfPossile:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v5 = [(MLE5ExecutionStreamOperation *)self outputPorts];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          if (([*(id *)(*((void *)&v9 + 1) + 8 * v8) outputBackingWasDirectlyBound] & 1) == 0)
          {

            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    if ([(MLE5ExecutionStreamOperation *)self state]) {
      [(MLE5ExecutionStreamOperation *)self _updateCompletionEventFutureValuesWithCompletionSyncPoint:v4];
    }
    else {
      [(MLE5ExecutionStreamOperation *)self _bindNewCompletionEventsDirectlyWithCompletionSyncPoint:v4];
    }
  }
LABEL_13:
}

- (void)_updateCompletionEventFutureValuesWithCompletionSyncPoint:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MLE5ExecutionStreamOperation *)self operationHandle];
  uint64_t v12 = 0;
  uint64_t v5 = e5rt_execution_stream_operation_retain_completion_event();
  uint64_t v6 = (void *)MEMORY[0x1E4F1C3A8];
  if (v5)
  {
    uint64_t v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t last_error_message = e5rt_get_last_error_message();
      __int16 v15 = 1024;
      int v16 = v5;
      _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "Failed to retain a completion event bound to the E5 operation. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v6, @"Failed to retain a completion event bound to the E5 operation. E5RT: %s (%d)", e5rt_get_last_error_message(), v5);
  }
  uint64_t v11 = v12;
  [v4 value];
  uint64_t active = e5rt_async_event_set_active_future_value();
  if (active)
  {
    long long v9 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      uint64_t last_error_message = v10;
      __int16 v15 = 1024;
      int v16 = active;
      _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "Failed to set future value of completion event E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v6, @"Failed to set future value of completion event E5RT: %s (%d)", e5rt_get_last_error_message(), active);
  }
  std::unique_ptr<e5rt_async_event,MLE5ObjectDeleter<e5rt_async_event>>::reset[abi:ne180100](&v11, 0);
}

- (void)_bindNewCompletionEventsDirectlyWithCompletionSyncPoint:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 sharedEvent];
  uint64_t v6 = getIOSurfaceSharedEventFromMTLSharedEvent(v5);

  uint64_t v18 = 0;
  uint64_t v7 = e5rt_async_event_create_from_iosurface_shared_event();
  uint64_t v8 = (void *)MEMORY[0x1E4F1C3A8];
  if (v7)
  {
    long long v9 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t last_error_message = e5rt_get_last_error_message();
      __int16 v21 = 1024;
      int v22 = v7;
      _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "Failed to create completion event from client shared event E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v8, @"Failed to create completion event from client shared event E5RT: %s (%d)", e5rt_get_last_error_message(), v7);
  }
  uint64_t v17 = v18;
  [v4 value];
  uint64_t active = e5rt_async_event_set_active_future_value();
  if (active)
  {
    uint64_t v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      uint64_t last_error_message = v15;
      __int16 v21 = 1024;
      int v22 = active;
      _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "Failed to set future value of completion event E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v8, @"Failed to set future value of completion event E5RT: %s (%d)", e5rt_get_last_error_message(), active);
  }
  [(MLE5ExecutionStreamOperation *)self operationHandle];
  uint64_t v12 = e5rt_execution_stream_operation_bind_completion_event();
  if (v12)
  {
    v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      uint64_t last_error_message = v16;
      __int16 v21 = 1024;
      int v22 = v12;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Failed to bind client completion event directly to E5RT E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v8, @"Failed to bind client completion event directly to E5RT E5RT: %s (%d)", e5rt_get_last_error_message(), v12);
  }
  uint64_t v14 = [v4 sharedEvent];
  [(MLE5ExecutionStreamOperation *)self setCompletionSharedEventBoundToESOP:v14];

  std::unique_ptr<e5rt_async_event,MLE5ObjectDeleter<e5rt_async_event>>::reset[abi:ne180100](&v17, 0);
}

- (BOOL)_bindOutputPortsWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(MLE5ExecutionStreamOperation *)self outputPorts];

  if (!v7)
  {
    uint64_t v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "Trying to bind features to output ports without first initializing ports.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Trying to bind features to output ports without first initializing ports."];
  }
  [(MLE5ExecutionStreamOperation *)self outputPorts];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "prepareWithOptions:error:", v6, a4, (void)v16) & 1) == 0)
        {
          BOOL v14 = 0;
          v13 = v9;
          goto LABEL_15;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v13 = [v6 completionSyncPoint];
  [(MLE5ExecutionStreamOperation *)self _bindCompletionSyncPointDirectlyIfPossile:v13];
  BOOL v14 = 1;
LABEL_15:

  return v14;
}

- (BOOL)_copyInputFeatures:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [(MLE5ExecutionStreamOperation *)self inputPorts];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v10 boundFeatureDirectly] & 1) == 0)
        {
          unint64_t v11 = [(MLE5ExecutionStreamOperation *)self modelSignpostId];
          kdebug_trace();
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __57__MLE5ExecutionStreamOperation__copyInputFeatures_error___block_invoke;
          aBlock[3] = &__block_descriptor_40_e5_v8__0l;
          aBlock[4] = v11;
          uint64_t v12 = (void (**)(void))_Block_copy(aBlock);
          v13 = [v10 name];
          BOOL v14 = [v18 featureValueForName:v13];

          int v15 = [v10 copyFeatureValue:v14 error:a4];
          v12[2](v12);

          if (!v15)
          {
            BOOL v16 = 0;
            goto LABEL_13;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 1;
  }
LABEL_13:

  return v16;
}

uint64_t __57__MLE5ExecutionStreamOperation__copyInputFeatures_error___block_invoke()
{
  return kdebug_trace();
}

- (void)_bindEventToWaitForCopyingInputFeatures:(id)a3 afterSyncPoints:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v30 = a4;
  v33 = self;
  value = self->_cachedWaitEvent.__ptr_.__value_;
  p_cachedWaitEvent = (uint64_t *)&self->_cachedWaitEvent;
  uint64_t v6 = (uint64_t)value;
  id v9 = (void *)MEMORY[0x1E4F1C3A8];
  if (!value)
  {
    uint64_t v44 = 0;
    uint64_t v10 = e5rt_async_event_create();
    if (v10)
    {
      unint64_t v11 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = e5rt_get_last_error_message();
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v10;
        _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "Failed to create new AsyncEvent E5RT: %s (%d)", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v9, @"Failed to create new AsyncEvent E5RT: %s (%d)", e5rt_get_last_error_message(), v10);
    }
    *(void *)buf = 0;
    std::unique_ptr<e5rt_async_event,MLE5ObjectDeleter<e5rt_async_event>>::reset[abi:ne180100](p_cachedWaitEvent, v44);
    std::unique_ptr<e5rt_async_event,MLE5ObjectDeleter<e5rt_async_event>>::reset[abi:ne180100]((uint64_t *)buf, 0);
    uint64_t v6 = *p_cachedWaitEvent;
  }
  uint64_t v43 = 0;
  uint64_t v44 = v6;
  uint64_t active_future_value = e5rt_async_event_get_active_future_value();
  if (active_future_value)
  {
    v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t last_error_message = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = last_error_message;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = active_future_value;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Failed to get current future value of async event. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v9, @"Failed to get current future value of async event. E5RT: %s (%d)", e5rt_get_last_error_message(), active_future_value);
  }
  ++v43;
  uint64_t active = e5rt_async_event_set_active_future_value();
  if (active)
  {
    int v15 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = active;
      _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "Failed to set next future value of async event. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v9, @"Failed to set next future value of async event. E5RT: %s (%d)", e5rt_get_last_error_message(), active);
  }
  if (![(MLE5ExecutionStreamOperation *)v33 state])
  {
    [(MLE5ExecutionStreamOperation *)v33 operationHandle];
    uint64_t v16 = e5rt_execution_stream_operation_bind_dependent_events();
    if (v16)
    {
      long long v17 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = e5rt_get_last_error_message();
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v16;
        _os_log_error_impl(&dword_19E58B000, v17, OS_LOG_TYPE_ERROR, "Failed to bind cached dependent event to operation. E5RT: %s (%d)", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v9, @"Failed to bind cached dependent event to operation. E5RT: %s (%d)", e5rt_get_last_error_message(), v16);
    }
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v47 = 0;
  uint64_t v18 = [v30 count];
  long long v19 = [(MLE5ExecutionStreamOperation *)v33 waitEventListener];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v30;
  uint64_t v20 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(obj);
        }
        long long v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v24 = [v23 sharedEvent];
        uint64_t v25 = getIOSurfaceSharedEventFromMTLSharedEvent(v24);

        uint64_t v26 = [v23 value];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __88__MLE5ExecutionStreamOperation__bindEventToWaitForCopyingInputFeatures_afterSyncPoints___block_invoke;
        v34[3] = &unk_1E59A5128;
        v36 = buf;
        uint64_t v37 = v18;
        v34[4] = v33;
        id v35 = v32;
        uint64_t v38 = v43;
        [v25 notifyListener:v19 atValue:v26 block:v34];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v20);
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __88__MLE5ExecutionStreamOperation__bindEventToWaitForCopyingInputFeatures_afterSyncPoints___block_invoke(uint64_t result)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(result + 48) + 8);
  uint64_t v2 = *(void *)(v1 + 24) + 1;
  *(void *)(v1 + 24) = v2;
  if (v2 == *(void *)(result + 56))
  {
    uint64_t v3 = result;
    id v4 = [*(id *)(result + 32) asyncSubmissionError];

    if (!v4)
    {
      uint64_t v5 = *(void **)(v3 + 32);
      uint64_t v6 = *(void *)(v3 + 40);
      id v12 = 0;
      char v7 = [v5 _copyInputFeatures:v6 error:&v12];
      id v8 = v12;
      if ((v7 & 1) == 0) {
        [*(id *)(v3 + 32) setAsyncSubmissionError:v8];
      }
    }
    result = e5rt_async_event_signal();
    uint64_t v9 = result;
    if (result)
    {
      uint64_t v10 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t last_error_message = e5rt_get_last_error_message();
        *(_DWORD *)buf = 136315394;
        uint64_t v14 = last_error_message;
        __int16 v15 = 1024;
        int v16 = v9;
        _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "Failed to signal next future value of async event. E5RT: %s (%d)", buf, 0x12u);
      }

      return objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Failed to signal next future value of async event. E5RT: %s (%d)", e5rt_get_last_error_message(), v9);
    }
  }
  return result;
}

- (void)_bindWaitEventsDirectly:(id)a3
{
  id v4 = a3;
  if ([(MLE5ExecutionStreamOperation *)self state]) {
    [(MLE5ExecutionStreamOperation *)self _updateWaitEventFutureValuesWithWaitSyncPoints:v4];
  }
  else {
    [(MLE5ExecutionStreamOperation *)self _bindNewWaitEventsDirectlyWithWaitSyncPoints:v4];
  }
}

- (void)_updateWaitEventFutureValuesWithWaitSyncPoints:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  uint64_t v5 = v28;
  uint64_t v4 = v29;
  if ([v23 count] != (v4 - v5) >> 3)
  {
    uint64_t v6 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = v28;
      uint64_t v20 = v29;
      uint64_t v22 = [v23 count];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = (v20 - v21) >> 3;
      __int16 v32 = 2048;
      uint64_t v33 = v22;
      _os_log_error_impl(&dword_19E58B000, v6, OS_LOG_TYPE_ERROR, "The number of existing dependent events (%tu) doesn't match the one of new events (%tu) while reusing E5 stream. This is a logic error.", buf, 0x16u);
    }

    char v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = v28;
    uint64_t v8 = v29;
    uint64_t v10 = [v23 count];
    objc_msgSend(v7, "raise:format:", *MEMORY[0x1E4F1C3B8], @"The number of existing dependent events (%tu) doesn't match the one of new events (%tu) while reusing E5 stream. This is a logic error.", (v8 - v9) >> 3, v10);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v23;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v25;
    uint64_t v15 = *MEMORY[0x1E4F1C3A8];
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v16) value];
        uint64_t active = e5rt_async_event_set_active_future_value();
        if (active)
        {
          uint64_t v18 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t last_error_message = e5rt_get_last_error_message();
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = last_error_message;
            __int16 v32 = 1024;
            LODWORD(v33) = active;
            _os_log_error_impl(&dword_19E58B000, v18, OS_LOG_TYPE_ERROR, "Failed to set activeFutureValue for AsyncEvent E5RT: %s (%d)", buf, 0x12u);
          }

          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v15, @"Failed to set activeFutureValue for AsyncEvent E5RT: %s (%d)", e5rt_get_last_error_message(), active);
        }
        ++v13;
        ++v16;
      }
      while (v12 != v16);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v12);
  }

  *(void *)buf = &v28;
  std::vector<std::unique_ptr<e5rt_async_event,MLE5ObjectDeleter<e5rt_async_event>>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
}

- (void)_bindNewWaitEventsDirectlyWithWaitSyncPoints:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  unint64_t v3 = [v35 count];
  if (v3)
  {
    if (v3 >> 61) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v3);
    uint64_t v6 = &v4[8 * v5];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  long long v39 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v35;
  uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v7)
  {
    uint64_t v38 = *(void *)v42;
    uint64_t v8 = *MEMORY[0x1E4F1C3A8];
    uint64_t v9 = v4;
    do
    {
      uint64_t v40 = v7;
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v42 != v38) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v12 = [v11 sharedEvent];
        [v39 addObject:v12];
        uint64_t v13 = getIOSurfaceSharedEventFromMTLSharedEvent(v12);
        uint64_t v14 = e5rt_async_event_create_from_iosurface_shared_event();
        if (v14)
        {
          uint64_t v15 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t last_error_message = e5rt_get_last_error_message();
            *(_DWORD *)buf = 136315394;
            uint64_t v46 = last_error_message;
            __int16 v47 = 1024;
            int v48 = v14;
            _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "Failed to create AsyncEvent from IOSurfaceSharedEvent E5RT: %s (%d)", buf, 0x12u);
          }

          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v8, @"Failed to create AsyncEvent from IOSurfaceSharedEvent E5RT: %s (%d)", e5rt_get_last_error_message(), v14);
        }
        [v11 value];
        uint64_t active = e5rt_async_event_set_active_future_value();
        if (active)
        {
          uint64_t v17 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            uint64_t v26 = e5rt_get_last_error_message();
            *(_DWORD *)buf = 136315394;
            uint64_t v46 = v26;
            __int16 v47 = 1024;
            int v48 = active;
            _os_log_error_impl(&dword_19E58B000, v17, OS_LOG_TYPE_ERROR, "Failed to set activeFutureValue for AsyncEvent E5RT: %s (%d)", buf, 0x12u);
          }

          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v8, @"Failed to set activeFutureValue for AsyncEvent E5RT: %s (%d)", e5rt_get_last_error_message(), active);
        }
        if (v9 >= v6)
        {
          uint64_t v18 = (v9 - v4) >> 3;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 61) {
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          }
          if ((v6 - v4) >> 2 > v19) {
            unint64_t v19 = (v6 - v4) >> 2;
          }
          if ((unint64_t)(v6 - v4) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v19;
          }
          if (v20) {
            unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v20);
          }
          else {
            uint64_t v21 = 0;
          }
          uint64_t v22 = (char *)(v20 + 8 * v18);
          *(void *)uint64_t v22 = 0;
          id v23 = v22 + 8;
          while (v9 != v4)
          {
            uint64_t v24 = *((void *)v9 - 1);
            v9 -= 8;
            *((void *)v22 - 1) = v24;
            v22 -= 8;
          }
          uint64_t v6 = (char *)(v20 + 8 * v21);
          if (v4) {
            operator delete(v4);
          }
          uint64_t v4 = v22;
          uint64_t v9 = v23;
        }
        else
        {
          *(void *)uint64_t v9 = 0;
          v9 += 8;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = v4;
  }

  [(MLE5ExecutionStreamOperation *)self operationHandle];
  uint64_t v27 = e5rt_execution_stream_operation_bind_dependent_events();
  if (v27)
  {
    uint64_t v28 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      uint64_t v46 = v34;
      __int16 v47 = 1024;
      int v48 = v27;
      _os_log_error_impl(&dword_19E58B000, v28, OS_LOG_TYPE_ERROR, "Failed to bind dependent events to operation. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Failed to bind dependent events to operation. E5RT: %s (%d)", e5rt_get_last_error_message(), v27);
  }
  [(MLE5ExecutionStreamOperation *)self setWaitSharedEventsBoundToESOP:v39];
  if (v4 != v9)
  {
    uint64_t v29 = *MEMORY[0x1E4F1C3A8];
    id v30 = v4;
    do
    {
      uint64_t v31 = e5rt_async_event_release();
      if (v31)
      {
        __int16 v32 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = e5rt_get_last_error_message();
          *(_DWORD *)buf = 136315394;
          uint64_t v46 = v33;
          __int16 v47 = 1024;
          int v48 = v31;
          _os_log_error_impl(&dword_19E58B000, v32, OS_LOG_TYPE_ERROR, "Unexpected failure to release AsyncEvent E5RT: %s (%d)", buf, 0x12u);
        }

        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v29, @"Unexpected failure to release AsyncEvent E5RT: %s (%d)", e5rt_get_last_error_message(), v31);
      }
      v30 += 8;
    }
    while (v30 != v9);
  }

  if (v4) {
    operator delete(v4);
  }
}

- (BOOL)_bindInputFeaturesAndWaitEvents:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MLE5ExecutionStreamOperation *)self inputPorts];

  if (!v10)
  {
    id v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "Trying to bind features to input ports without first initializing ports.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Trying to bind features to input ports without first initializing ports."];
  }
  if ([(MLE5ExecutionStreamOperation *)self _prepareInputPortsForFeatures:v8 error:a5])
  {
    uint64_t v12 = [v9 waitSyncPoints];
    [(MLE5ExecutionStreamOperation *)self inputPorts];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:buf count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v13);
          }
          if ((objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "boundFeatureDirectly", (void)v20) & 1) == 0)
          {
            char v17 = 0;
            goto LABEL_17;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:buf count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    char v17 = 1;
LABEL_17:

    if ([v12 count])
    {
      if (v17) {
        [(MLE5ExecutionStreamOperation *)self _bindWaitEventsDirectly:v12];
      }
      else {
        [(MLE5ExecutionStreamOperation *)self _bindEventToWaitForCopyingInputFeatures:v8 afterSyncPoints:v12];
      }
    }
    else if ((v17 & 1) == 0 {
           && ![(MLE5ExecutionStreamOperation *)self _copyInputFeatures:v8 error:a5])
    }
    {
      BOOL v18 = 0;
LABEL_25:

      goto LABEL_26;
    }
    BOOL v18 = 1;
    goto LABEL_25;
  }
  BOOL v18 = 0;
LABEL_26:

  return v18;
}

- (BOOL)_prepareInputPortsForFeatures:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(MLE5ExecutionStreamOperation *)self inputPorts];
  if (!v7
    || ([(MLE5ExecutionStreamOperation *)self statePorts],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    id v9 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "Trying to bind features to input ports without first initializing ports.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Trying to bind features to input ports without first initializing ports."];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v10 = [(MLE5ExecutionStreamOperation *)self inputPorts];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v43 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v15 = [v14 name];
        uint64_t v16 = [v6 featureValueForName:v15];

        LODWORD(v14) = [v14 prepareForFeatureValue:v16 error:a4];
        if (!v14)
        {
LABEL_37:
          BOOL v24 = 0;
          goto LABEL_38;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v10 = [(MLE5ExecutionStreamOperation *)self statePorts];
  uint64_t v17 = [v10 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v39;
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v10);
        }
        long long v20 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        long long v21 = [v20 name];
        long long v22 = [v6 featureValueForName:v21];

        long long v23 = [(MLE5ExecutionStreamOperation *)self _multiArrayFeatureFromStateFeature:v22];
        if (!v23)
        {
          uint64_t v25 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v36 = [v20 name];
            *(_DWORD *)buf = 138412290;
            v51 = v36;
            _os_log_error_impl(&dword_19E58B000, v25, OS_LOG_TYPE_ERROR, "The input feature for %@ must be an MLState, but it was not.", buf, 0xCu);
          }
          if (a4)
          {
            uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v48 = *MEMORY[0x1E4F28568];
            uint64_t v27 = NSString;
            uint64_t v28 = [v20 name];
            uint64_t v29 = [v27 stringWithFormat:@"The input feature for %@ must be an MLState, but it was not.", v28];
            v49 = v29;
            id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
            uint64_t v31 = [v26 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v30];
            long long v23 = 0;
            goto LABEL_34;
          }
          long long v23 = 0;
LABEL_36:

          goto LABEL_37;
        }
        if (![v20 prepareForFeatureValue:v23 error:a4]) {
          goto LABEL_36;
        }
        if (([v20 boundFeatureDirectly] & 1) == 0)
        {
          __int16 v32 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            uint64_t v37 = [v20 name];
            *(_DWORD *)buf = 138412290;
            v51 = v37;
            _os_log_error_impl(&dword_19E58B000, v32, OS_LOG_TYPE_ERROR, "The inference engine was unable to access the state buffer for feature named '%@'. Make sure the state buffer's MLMultiArray is instantiated with IOSurface-backed CVPixelBuffer.", buf, 0xCu);
          }
          if (a4)
          {
            uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v46 = *MEMORY[0x1E4F28568];
            uint64_t v34 = NSString;
            uint64_t v28 = [v20 name];
            uint64_t v29 = [v34 stringWithFormat:@"The inference engine was unable to access the state buffer for feature named '%@'. Make sure the state buffer's MLMultiArray is instantiated with IOSurface-backed CVPixelBuffer.", v28];
            __int16 v47 = v29;
            id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
            uint64_t v31 = [v33 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v30];
LABEL_34:
            *a4 = v31;
          }
          goto LABEL_36;
        }
      }
      uint64_t v17 = [v10 countByEnumeratingWithState:&v38 objects:v52 count:16];
      BOOL v24 = 1;
      if (v17) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v24 = 1;
  }
LABEL_38:

  return v24;
}

- (id)_newArrayOfOutputPorts:(id)a3 featureDescriptionsByName:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v22;
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    uint64_t v11 = *MEMORY[0x1E4F1C3A8];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
        [(MLE5ExecutionStreamOperation *)self operationHandle];
        id v14 = v13;
        [v14 UTF8String];
        uint64_t v15 = e5rt_execution_stream_operation_retain_output_port();
        if (v15)
        {
          uint64_t v16 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t last_error_message = e5rt_get_last_error_message();
            *(_DWORD *)buf = 138412802;
            id v29 = v14;
            __int16 v30 = 2080;
            uint64_t v31 = last_error_message;
            __int16 v32 = 1024;
            int v33 = v15;
            _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "Failed to retain E5 execution stream operation input port %@ E5RT: %s (%d)", buf, 0x1Cu);
          }

          [MEMORY[0x1E4F1CA00] raise:v11, @"Failed to retain E5 execution stream operation input port %@ E5RT: %s (%d)", v14, e5rt_get_last_error_message(), v15 format];
        }
        uint64_t v17 = [v7 objectForKeyedSubscript:v14];
        uint64_t v18 = [[MLE5OutputPort alloc] initWithPortHandle:0 name:v14 featureDescription:v17];
        unint64_t v19 = [(MLE5ExecutionStreamOperation *)self pixelBufferPool];
        [(MLE5OutputPort *)v18 setPixelBufferPool:v19];

        [v8 addObject:v18];
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v9);
  }

  return v8;
}

- (id)_newArrayOfInoutPorts:(id)a3 featureDescriptionsByName:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v22;
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    uint64_t v11 = *MEMORY[0x1E4F1C3A8];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
        [(MLE5ExecutionStreamOperation *)self operationHandle];
        id v14 = v13;
        [v14 UTF8String];
        uint64_t v15 = e5rt_execution_stream_operation_retain_inout_port();
        if (v15)
        {
          uint64_t v16 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t last_error_message = e5rt_get_last_error_message();
            *(_DWORD *)buf = 138412802;
            id v29 = v14;
            __int16 v30 = 2080;
            uint64_t v31 = last_error_message;
            __int16 v32 = 1024;
            int v33 = v15;
            _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "Failed to retain E5 execution stream operation input port %@ E5RT: %s (%d)", buf, 0x1Cu);
          }

          [MEMORY[0x1E4F1CA00] raise:v11, @"Failed to retain E5 execution stream operation input port %@ E5RT: %s (%d)", v14, e5rt_get_last_error_message(), v15 format];
        }
        uint64_t v17 = [v7 objectForKeyedSubscript:v14];
        uint64_t v18 = [[MLE5InputPort alloc] initWithPortHandle:0 name:v14 featureDescription:v17];
        unint64_t v19 = [(MLE5ExecutionStreamOperation *)self pixelBufferPool];
        [(MLE5InputPort *)v18 setPixelBufferPool:v19];

        [v8 addObject:v18];
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v9);
  }

  return v8;
}

- (id)_newArrayOfInputPorts:(id)a3 featureDescriptionsByName:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v22;
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    uint64_t v11 = *MEMORY[0x1E4F1C3A8];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
        [(MLE5ExecutionStreamOperation *)self operationHandle];
        id v14 = v13;
        [v14 UTF8String];
        uint64_t v15 = e5rt_execution_stream_operation_retain_input_port();
        if (v15)
        {
          uint64_t v16 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t last_error_message = e5rt_get_last_error_message();
            *(_DWORD *)buf = 138412802;
            id v29 = v14;
            __int16 v30 = 2080;
            uint64_t v31 = last_error_message;
            __int16 v32 = 1024;
            int v33 = v15;
            _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "Failed to retain E5 execution stream operation input port %@ E5RT: %s (%d)", buf, 0x1Cu);
          }

          [MEMORY[0x1E4F1CA00] raise:v11, @"Failed to retain E5 execution stream operation input port %@ E5RT: %s (%d)", v14, e5rt_get_last_error_message(), v15 format];
        }
        uint64_t v17 = [v7 objectForKeyedSubscript:v14];
        uint64_t v18 = [[MLE5InputPort alloc] initWithPortHandle:0 name:v14 featureDescription:v17];
        unint64_t v19 = [(MLE5ExecutionStreamOperation *)self pixelBufferPool];
        [(MLE5InputPort *)v18 setPixelBufferPool:v19];

        [v8 addObject:v18];
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v9);
  }

  return v8;
}

- (e5rt_execution_stream_operation)_createOperationAndReturnError:(id *)a3
{
  return [(MLE5ExecutionStreamOperation *)self _createOperationWithRetryCount:2 error:a3];
}

- (e5rt_execution_stream_operation)_createOperationWithRetryCount:(int64_t)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3 < 1) {
    return 0;
  }
  uint64_t v8 = 0;
  *(void *)&long long v4 = 138413058;
  long long v18 = v4;
  while (1)
  {
    uint64_t v9 = [(MLE5ExecutionStreamOperation *)self programLibrary];
    uint64_t v10 = [(MLE5ExecutionStreamOperation *)self functionName];
    uint64_t v11 = [(MLE5ExecutionStreamOperation *)self modelDescription];
    uint64_t v12 = (e5rt_execution_stream_operation *)objc_msgSend(v9, "createOperationForFunctionName:forceRespecialization:hasRangeShapeInputs:error:", v10, v8 != 0, objc_msgSend(v11, "hasRangeShapeInputs"), a4);

    if (v12) {
      break;
    }
    id v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [(MLE5ExecutionStreamOperation *)self functionName];
      uint64_t v15 = [(MLE5ExecutionStreamOperation *)self programLibrary];
      uint64_t v16 = [v15 modelDisplayName];
      ++v8;
      *(_DWORD *)buf = v18;
      long long v20 = v14;
      __int16 v21 = 2112;
      id v22 = v16;
      __int16 v23 = 2048;
      uint64_t v24 = v8;
      __int16 v25 = 2048;
      int64_t v26 = a3;
      _os_log_impl(&dword_19E58B000, v13, OS_LOG_TYPE_INFO, "Failed to create E5 execution stream operation for the function (%@) in the model (%@). It can happen when APFS purged a compiled E5 bundle. We will recompile the bundle and try again. (Retry %zd / %zd)", buf, 0x2Au);
    }
    else
    {
      ++v8;
    }

    if (v8 == a3) {
      return 0;
    }
  }
  return v12;
}

- (void)reset
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  [(MLE5ExecutionStreamOperation *)self setAsyncSubmissionError:0];
  if ([(MLE5ExecutionStreamOperation *)self operationHandle])
  {
    [(MLE5ExecutionStreamOperation *)self operationHandle];
    uint64_t v3 = e5rt_execution_stream_operation_bind_dependent_events();
    long long v4 = (void *)MEMORY[0x1E4F1C3A8];
    if (v3)
    {
      uint64_t v5 = v3;
      id v6 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t last_error_message = e5rt_get_last_error_message();
        __int16 v39 = 1024;
        int v40 = v5;
        _os_log_error_impl(&dword_19E58B000, v6, OS_LOG_TYPE_ERROR, "Failed to unbind dependent events. E5RT: %s (%d)", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v4, @"Failed to unbind dependent events. E5RT: %s (%d)", e5rt_get_last_error_message(), v5);
    }
    [(MLE5ExecutionStreamOperation *)self operationHandle];
    uint64_t v7 = e5rt_execution_stream_operation_bind_completion_event();
    if (v7)
    {
      uint64_t v8 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = e5rt_get_last_error_message();
        *(_DWORD *)buf = 136315394;
        uint64_t last_error_message = v21;
        __int16 v39 = 1024;
        int v40 = v7;
        _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "Failed to unbind completion event. E5RT: %s (%d)", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v4, @"Failed to unbind completion event. E5RT: %s (%d)", e5rt_get_last_error_message(), v7);
    }
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v9 = [(MLE5ExecutionStreamOperation *)self inputPorts];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v31;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * v12++) reset];
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v10);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = [(MLE5ExecutionStreamOperation *)self statePorts];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v27;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v16++) reset];
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v14);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v17 = [(MLE5ExecutionStreamOperation *)self outputPorts];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v23;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v20++) reset];
      }
      while (v18 != v20);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v18);
  }

  [(MLE5ExecutionStreamOperation *)self setWaitSharedEventsBoundToESOP:MEMORY[0x1E4F1CBF0]];
  [(MLE5ExecutionStreamOperation *)self setCompletionSharedEventBoundToESOP:0];
  [(MLE5ExecutionStreamOperation *)self setState:0];
}

- (NSArray)directlyBoundOutputFeatureNames
{
  uint64_t v3 = [(MLE5ExecutionStreamOperation *)self outputPorts];
  long long v4 = [(MLE5ExecutionStreamOperation *)self _directlyBoundFeatureNamesForPorts:v3];

  return (NSArray *)v4;
}

- (NSArray)directlyBoundInputFeatureNames
{
  uint64_t v3 = [(MLE5ExecutionStreamOperation *)self inputPorts];
  long long v4 = [(MLE5ExecutionStreamOperation *)self _directlyBoundFeatureNamesForPorts:v3];

  return (NSArray *)v4;
}

- (id)_directlyBoundFeatureNamesForPorts:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  long long v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "boundFeatureDirectly", (void)v14))
        {
          if (!v4) {
            long long v4 = (void *)[v7 mutableCopy];
          }
          uint64_t v10 = [v9 name];
          [v4 addObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  if (v4) {
    uint64_t v11 = v4;
  }
  else {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v12 = v11;

  return v12;
}

- (MLFeatureProvider)outputFeatures
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(MLE5ExecutionStreamOperation *)self modelSignpostId];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__MLE5ExecutionStreamOperation_outputFeatures__block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v3;
  long long v4 = (void (**)(void))_Block_copy(aBlock);
  if ([(MLE5ExecutionStreamOperation *)self state] != 1
    && [(MLE5ExecutionStreamOperation *)self state] != 2)
  {
    uint64_t v5 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v5, OS_LOG_TYPE_ERROR, "The operation was never prepared or has been reset", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The operation was never prepared or has been reset"];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = [(MLE5ExecutionStreamOperation *)self outputPorts];
  uint64_t v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [(MLE5ExecutionStreamOperation *)self outputPorts];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v14 = [v13 featureValue];
        long long v15 = [v13 name];
        [v8 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v10);
  }

  id v23 = 0;
  long long v16 = [[MLDictionaryFeatureProvider alloc] initWithDictionary:v8 error:&v23];
  id v17 = v23;
  if (!v8)
  {
    uint64_t v18 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      long long v22 = [v17 localizedDescription];
      *(_DWORD *)buf = 138412290;
      long long v30 = v22;
      _os_log_error_impl(&dword_19E58B000, v18, OS_LOG_TYPE_ERROR, "Failed to build output feature provider with error %@.", buf, 0xCu);
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = [v17 localizedDescription];
    [v19 raise:*MEMORY[0x1E4F1C3A8], @"Failed to build output feature provider with error %@.", v20 format];
  }
  v4[2](v4);

  return (MLFeatureProvider *)v16;
}

uint64_t __46__MLE5ExecutionStreamOperation_outputFeatures__block_invoke()
{
  return kdebug_trace();
}

- (BOOL)prepareAsyncSubmissionForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![(MLE5ExecutionStreamOperation *)self preloadAndReturnError:a5]
    || ![(MLE5ExecutionStreamOperation *)self _bindInputFeaturesAndWaitEvents:v8 options:v9 error:a5]|| ![(MLE5ExecutionStreamOperation *)self _bindOutputPortsWithOptions:v9 error:a5])
  {
    goto LABEL_10;
  }
  if ([(MLE5ExecutionStreamOperation *)self state] == 2
    || ([(MLE5ExecutionStreamOperation *)self operationHandle],
        uint64_t v10 = e5rt_execution_stream_operation_prepare_op_for_encode(),
        !v10))
  {
    [(MLE5ExecutionStreamOperation *)self setState:2];
    LOBYTE(a5) = 1;
    goto LABEL_11;
  }
  uint64_t v11 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t last_error_message = e5rt_get_last_error_message();
    __int16 v16 = 1024;
    int v17 = v10;
    _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
  }

  if (a5)
  {
    id v12 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), v10];
    *a5 = +[MLModelErrorUtils errorWithCode:0 underlyingError:v12 format:@"Unable to prepare the model for asynchronous predictions."];

LABEL_10:
    LOBYTE(a5) = 0;
  }
LABEL_11:

  return (char)a5;
}

- (BOOL)prepareForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![(MLE5ExecutionStreamOperation *)self preloadAndReturnError:a5]
    || ![(MLE5ExecutionStreamOperation *)self _prepareInputPortsForFeatures:v8 error:a5]|| ![(MLE5ExecutionStreamOperation *)self _copyInputFeatures:v8 error:a5]|| ![(MLE5ExecutionStreamOperation *)self _bindOutputPortsWithOptions:v9 error:a5])
  {
    goto LABEL_11;
  }
  if ([(MLE5ExecutionStreamOperation *)self state] == 1
    || ([(MLE5ExecutionStreamOperation *)self operationHandle],
        uint64_t v10 = e5rt_execution_stream_operation_prepare_op_for_encode(),
        !v10))
  {
    LOBYTE(a5) = 1;
    [(MLE5ExecutionStreamOperation *)self setState:1];
    goto LABEL_12;
  }
  uint64_t v11 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t last_error_message = e5rt_get_last_error_message();
    __int16 v16 = 1024;
    int v17 = v10;
    _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
  }

  if (a5)
  {
    id v12 = +[MLModelErrorUtils genericErrorWithFormat:@"E5RT: %s (%d)", e5rt_get_last_error_message(), v10];
    *a5 = +[MLModelErrorUtils errorWithCode:0 underlyingError:v12 format:@"Unable to prepare the model for predictions."];

LABEL_11:
    LOBYTE(a5) = 0;
  }
LABEL_12:

  return (char)a5;
}

- (BOOL)reusableForInputFeatures:(id)a3 options:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v35 = a4;
  if ([(MLE5ExecutionStreamOperation *)self operationHandle])
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v7 = [(MLE5ExecutionStreamOperation *)self inputPorts];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v46;
      LODWORD(v10) = 1;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v45 + 1) + 8 * v11);
        id v13 = [v12 name];
        long long v14 = [v6 featureValueForName:v13];

        char v44 = 0;
        if (([v12 reusableForFeatureValue:v14 willBindDirectly:&v44] & 1) == 0) {
          goto LABEL_32;
        }
        BOOL v15 = v44 != 0;

        uint64_t v10 = v10 & v15;
        if (v8 == ++v11)
        {
          uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v51 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_12;
        }
      }
    }
    uint64_t v10 = 1;
LABEL_12:

    __int16 v16 = [v35 waitSyncPoints];
    BOOL v17 = [(MLE5ExecutionStreamOperation *)self _reusableForWaitSyncPoints:v16 allInputsUseDirectBinding:v10];

    if (v17)
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v7 = [(MLE5ExecutionStreamOperation *)self statePorts];
      uint64_t v18 = [v7 countByEnumeratingWithState:&v40 objects:v50 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v41;
LABEL_15:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v41 != v19) {
            objc_enumerationMutation(v7);
          }
          uint64_t v21 = *(void **)(*((void *)&v40 + 1) + 8 * v20);
          long long v22 = [v21 name];
          long long v14 = [v6 featureValueForName:v22];

          id v23 = [(MLE5ExecutionStreamOperation *)self _multiArrayFeatureFromStateFeature:v14];
          if (!v23) {
            break;
          }
          char v24 = [v21 reusableForFeatureValue:v23 willBindDirectly:0];

          if ((v24 & 1) == 0) {
            goto LABEL_33;
          }
          if (v18 == ++v20)
          {
            uint64_t v18 = [v7 countByEnumeratingWithState:&v40 objects:v50 count:16];
            if (v18) {
              goto LABEL_15;
            }
            goto LABEL_22;
          }
        }
      }
      else
      {
LABEL_22:

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v7 = [(MLE5ExecutionStreamOperation *)self outputPorts];
        uint64_t v25 = [v7 countByEnumeratingWithState:&v36 objects:v49 count:16];
        if (!v25)
        {
          uint64_t v26 = 1;
LABEL_37:

          uint64_t v7 = [v35 completionSyncPoint];
          BOOL v32 = [(MLE5ExecutionStreamOperation *)self _reusableForCompletionSyncPoint:v7 allOutputBackingsUseDirectBinding:v26];
LABEL_34:

          goto LABEL_35;
        }
        uint64_t v34 = *(void *)v37;
        LODWORD(v26) = 1;
LABEL_24:
        uint64_t v27 = 0;
        while (1)
        {
          if (*(void *)v37 != v34) {
            objc_enumerationMutation(v7);
          }
          long long v28 = *(void **)(*((void *)&v36 + 1) + 8 * v27);
          long long v29 = objc_msgSend(v35, "outputBackings", v34);
          long long v30 = [v28 name];
          long long v14 = [v29 objectForKeyedSubscript:v30];

          char v44 = 0;
          if (([v28 reusableForOutputBacking:v14 willBindDirectly:&v44] & 1) == 0) {
            break;
          }
          BOOL v31 = v44 != 0;

          uint64_t v26 = v26 & v31;
          if (v25 == ++v27)
          {
            uint64_t v25 = [v7 countByEnumeratingWithState:&v36 objects:v49 count:16];
            if (v25) {
              goto LABEL_24;
            }
            goto LABEL_37;
          }
        }
      }
LABEL_32:

LABEL_33:
      BOOL v32 = 0;
      goto LABEL_34;
    }
  }
  BOOL v32 = 0;
LABEL_35:

  return v32;
}

- (BOOL)_reusableForCompletionSyncPoint:(id)a3 allOutputBackingsUseDirectBinding:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6 || !v4)
  {
    uint64_t v8 = [(MLE5ExecutionStreamOperation *)self completionSharedEventBoundToESOP];
    LOBYTE(v7) = v8 == 0;
    goto LABEL_6;
  }
  uint64_t v7 = [(MLE5ExecutionStreamOperation *)self completionSharedEventBoundToESOP];

  if (v7)
  {
    uint64_t v8 = [(MLE5ExecutionStreamOperation *)self completionSharedEventBoundToESOP];
    uint64_t v9 = [v6 sharedEvent];
    LOBYTE(v7) = v8 == v9;

LABEL_6:
  }

  return (char)v7;
}

- (BOOL)_reusableForWaitSyncPoints:(id)a3 allInputsUseDirectBinding:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 count])
  {
    char v16 = v24 == v25;
    uint64_t v26 = (void **)&v24;
LABEL_17:
    std::vector<std::unique_ptr<e5rt_async_event,MLE5ObjectDeleter<e5rt_async_event>>>::__destroy_vector::operator()[abi:ne180100](&v26);
    goto LABEL_18;
  }
  if (!v4)
  {
    if (v25 - v24 == 8)
    {
      e5rt_async_event_get_iosurface_shared_event();
      id v17 = 0;
      e5rt_async_event_get_iosurface_shared_event();
      id v18 = 0;
      char v16 = v17 == v18;
    }
    else
    {
      char v16 = 0;
    }
    uint64_t v26 = (void **)&v24;
    goto LABEL_17;
  }
  uint64_t v7 = [(MLE5ExecutionStreamOperation *)self waitSharedEventsBoundToESOP];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) sharedEvent];
          [v9 addObject:v14];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v27 count:16];
      }
      while (v11);
    }

    BOOL v15 = [(MLE5ExecutionStreamOperation *)self waitSharedEventsBoundToESOP];
    char v16 = [v9 isEqual:v15];
  }
  else
  {
    char v16 = 0;
  }
LABEL_18:

  return v16;
}

- (BOOL)preloadAndReturnError:(id *)a3
{
  if (![(MLE5ExecutionStreamOperation *)self operationHandle])
  {
    uint64_t v5 = [(MLE5ExecutionStreamOperation *)self _createOperationAndReturnError:a3];
    if (!v5) {
      return (char)v5;
    }
    [(MLE5ExecutionStreamOperation *)self setOperationHandle:v5];
    id v6 = [(MLE5ExecutionStreamOperation *)self _inputPortNames];
    uint64_t v7 = [(MLE5ExecutionStreamOperation *)self modelDescription];
    uint64_t v8 = [v7 inputDescriptionsByName];
    id v9 = [(MLE5ExecutionStreamOperation *)self _newArrayOfInputPorts:v6 featureDescriptionsByName:v8 error:a3];
    [(MLE5ExecutionStreamOperation *)self setInputPorts:v9];

    id v10 = [(MLE5ExecutionStreamOperation *)self inputPorts];

    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v11 = [(MLE5ExecutionStreamOperation *)self _inoutPortNames];
    uint64_t v12 = [(MLE5ExecutionStreamOperation *)self modelDescription];
    id v13 = [v12 stateDescriptionsByName];
    id v14 = [(MLE5ExecutionStreamOperation *)self _newArrayOfInoutPorts:v11 featureDescriptionsByName:v13 error:a3];
    [(MLE5ExecutionStreamOperation *)self setStatePorts:v14];

    BOOL v15 = [(MLE5ExecutionStreamOperation *)self statePorts];

    if (!v15) {
      goto LABEL_7;
    }
    char v16 = [(MLE5ExecutionStreamOperation *)self _outputPortNames];
    id v17 = [(MLE5ExecutionStreamOperation *)self modelDescription];
    id v18 = [v17 outputDescriptionsByName];
    id v19 = [(MLE5ExecutionStreamOperation *)self _newArrayOfOutputPorts:v16 featureDescriptionsByName:v18 error:a3];
    [(MLE5ExecutionStreamOperation *)self setOutputPorts:v19];

    long long v20 = [(MLE5ExecutionStreamOperation *)self outputPorts];

    if (!v20)
    {
LABEL_7:
      LOBYTE(v5) = 0;
      return (char)v5;
    }
  }
  LOBYTE(v5) = 1;
  return (char)v5;
}

- (void)dealloc
{
  if (self->_operationHandle) {
    e5rt_execution_stream_operation_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)MLE5ExecutionStreamOperation;
  [(MLE5ExecutionStreamOperation *)&v3 dealloc];
}

- (MLE5ExecutionStreamOperation)initWithProgramLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 configuration:(id)a6 debugLabel:(id)a7 modelSignpostId:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v39 = a5;
  id v17 = a6;
  id v18 = a7;
  v40.receiver = self;
  v40.super_class = (Class)MLE5ExecutionStreamOperation;
  id v19 = [(MLE5ExecutionStreamOperation *)&v40 init];
  long long v20 = v19;
  long long v21 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_programLibrary, a3);
    uint64_t v22 = [v16 copy];
    functionName = v21->_functionName;
    v21->_functionName = (NSString *)v22;

    objc_storeStrong((id *)&v20->_modelDescription, a5);
    objc_storeStrong((id *)&v20->_modelConfiguration, a6);
    if (v18)
    {
      uint64_t v24 = (NSString *)v18;
      debugLabel = (__CFString *)v21->_debugLabel;
      v21->_debugLabel = v24;
    }
    else
    {
      debugLabel = [v15 modelDisplayName];
      uint64_t v26 = @"Unnamed Model";
      if (debugLabel) {
        uint64_t v26 = debugLabel;
      }
      uint64_t v27 = [NSString stringWithFormat:@"CoreMLInference: %@ (%@)", v26, v16];
      uint64_t v28 = v21->_debugLabel;
      v21->_debugLabel = (NSString *)v27;
    }
    v21->_modelSignpostId = a8;
    v21->_operationHandle = 0;
    inputPorts = v21->_inputPorts;
    v21->_inputPorts = 0;

    statePorts = v21->_statePorts;
    v21->_statePorts = 0;

    outputPorts = v21->_outputPorts;
    v21->_outputPorts = 0;

    waitSharedEventsBoundToESOP = v21->_waitSharedEventsBoundToESOP;
    v21->_waitSharedEventsBoundToESOP = (NSArray *)MEMORY[0x1E4F1CBF0];

    v21->_state = 0;
    id v33 = objc_alloc(MEMORY[0x1E4F2EF98]);
    uint64_t v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v35 = dispatch_queue_create("com.apple.coreml.MLE5WaitEventListenerQueue", v34);
    uint64_t v36 = [v33 initWithDispatchQueue:v35];
    waitEventListener = v21->_waitEventListener;
    v21->_waitEventListener = (IOSurfaceSharedEventListener *)v36;
  }
  return v21;
}

@end