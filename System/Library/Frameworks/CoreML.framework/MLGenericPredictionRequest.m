@interface MLGenericPredictionRequest
- (BOOL)isCancelled;
- (MLFeatureProvider)inputFeatures;
- (MLModel)model;
- (MLPredictionOptions)predictionOptions;
- (id)initForModel:(id)a3 inputFeatures:(id)a4 options:(id)a5;
- (void)cancel;
- (void)submitWithCompletionHandler:(id)a3;
@end

@implementation MLGenericPredictionRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_predictionOptions, 0);

  objc_storeStrong((id *)&self->_inputFeatures, 0);
}

- (MLModel)model
{
  return self->_model;
}

- (MLPredictionOptions)predictionOptions
{
  return self->_predictionOptions;
}

- (MLFeatureProvider)inputFeatures
{
  return self->_inputFeatures;
}

- (BOOL)isCancelled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_cancelled);
  return v2 & 1;
}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
  id v3 = [(MLGenericPredictionRequest *)self model];
  [v3 cancelPredictionRequest:self];
}

- (void)submitWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v5, OS_LOG_TYPE_ERROR, "The completion handler cannot be nil.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The completion handler cannot be nil."];
  }
  char v6 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_used.__a_.__a_value, (unsigned __int8 *)&v6, 1u);
  if (v6)
  {
    v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "Attempting to submit an already submitted prediction request.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Attempting to submit an already submitted prediction request."];
  }
  v8 = [(MLGenericPredictionRequest *)self model];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__MLGenericPredictionRequest_submitWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E59A4EA0;
  id v9 = v4;
  id v11 = v9;
  [v8 submitPredictionRequest:self completionHandler:v10];
}

uint64_t __58__MLGenericPredictionRequest_submitWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)initForModel:(id)a3 inputFeatures:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v12 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "The model cannot be nil.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The model cannot be nil."];
  }
  if (!v10)
  {
    v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "The input feature provider cannot be nil.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The input feature provider cannot be nil."];
  }
  if (!v11)
  {
    v14 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "The options cannot be nil.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The options cannot be nil."];
  }
  v18.receiver = self;
  v18.super_class = (Class)MLGenericPredictionRequest;
  v15 = [(MLGenericPredictionRequest *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_model, a3);
    objc_storeStrong((id *)&v16->_inputFeatures, a4);
    objc_storeStrong((id *)&v16->_predictionOptions, a5);
    atomic_store(0, (unsigned __int8 *)&v16->_used);
    atomic_store(0, (unsigned __int8 *)&v16->_cancelled);
  }

  return v16;
}

@end