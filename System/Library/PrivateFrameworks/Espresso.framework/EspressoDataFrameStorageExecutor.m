@interface EspressoDataFrameStorageExecutor
- (void)executeDataFrameStorage:(id)a3 withNetwork:(id)a4 block:(id)a5;
- (void)executeDataFrameStorage:(id)a3 withNetwork:(id)a4 block:(id)a5 blockPrepareForIndex:(id)a6;
- (void)executeDataFrameStorage:(id)a3 withNetwork:(id)a4 referenceNetwork:(id)a5 block:(id)a6 blockPrepareForIndex:(id)a7;
@end

@implementation EspressoDataFrameStorageExecutor

- (void)executeDataFrameStorage:(id)a3 withNetwork:(id)a4 block:(id)a5
{
}

- (void)executeDataFrameStorage:(id)a3 withNetwork:(id)a4 referenceNetwork:(id)a5 block:(id)a6 blockPrepareForIndex:(id)a7
{
  uint64_t v36 = *(void *)&a5.var1;
  var0 = (uint64_t *)a5.var0;
  uint64_t v34 = *(void *)&a4.var1;
  v35 = (uint64_t *)a4.var0;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = (void (**)(id, void, double))a6;
  v11 = (void (**)(id, unint64_t))a7;
  for (unint64_t i = 0; i < [v9 numberOfDataFrames]; ++i)
  {
    v13 = [v9 dataFrameAtIndex:i];
    v14 = objc_opt_new();
    if (v11) {
      v11[2](v11, i);
    }
    v15 = (Espresso *)objc_msgSend(v14, "bindInputsFromFrame:toNetwork:", v13, var0, v36);
    if (v15)
    {
      v17 = Espresso::espresso_os_log_subsystem(v15, v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    v18 = (Espresso *)objc_msgSend(v14, "bindInputsFromFrame:toNetwork:", v13, v35, v34);
    if (v18)
    {
      v17 = Espresso::espresso_os_log_subsystem(v18, v19);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_13:
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1920CB000, v17, OS_LOG_TYPE_ERROR, "Error binding inputs", buf, 2u);
      }
LABEL_14:

      v10[2](v10, 0, 0.0);
      goto LABEL_15;
    }
    v20 = (Espresso *)objc_msgSend(v14, "bindOutputsFromFrame:toNetwork:referenceNetwork:", v13, v35, v34, var0, v36);
    if (v20)
    {
      v17 = Espresso::espresso_os_log_subsystem(v20, v21);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    v22 = (Espresso *)espresso_plan_execute_sync(var0);
    if (v22)
    {
      v30 = Espresso::espresso_os_log_subsystem(v22, v23);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        espresso_plan_get_error_info((uint64_t)var0);
        *(_DWORD *)buf = 136315138;
        uint64_t v38 = v32;
        _os_log_error_impl(&dword_1920CB000, v30, OS_LOG_TYPE_ERROR, "Execution error: %s", buf, 0xCu);
      }

      v10[2](v10, 0, 0.0);
      goto LABEL_25;
    }
    v24.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    int v25 = espresso_plan_execute_sync(v35);
    v26.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    if (v25)
    {
      v31 = Espresso::espresso_os_log_subsystem((Espresso *)v26.__d_.__rep_, (const char *)v27.__d_.__rep_);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        espresso_plan_get_error_info((uint64_t)v35);
        *(_DWORD *)buf = 136315138;
        uint64_t v38 = v33;
        _os_log_error_impl(&dword_1920CB000, v31, OS_LOG_TYPE_ERROR, "Execution error: %s", buf, 0xCu);
      }

      v10[2](v10, 0, 0.0);
LABEL_25:

      break;
    }
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep rep = v26.__d_.__rep_;
    v29 = [v14 outputMatchingBuffers];
    ((void (**)(id, void *, double))v10)[2](v10, v29, (float)((rep - v24.__d_.__rep_) / 1000));

    [v14 freeTemporaryResources];
LABEL_15:
  }
}

- (void)executeDataFrameStorage:(id)a3 withNetwork:(id)a4 block:(id)a5 blockPrepareForIndex:(id)a6
{
  uint64_t v8 = *(void *)&a4.var1;
  var0 = a4.var0;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  v10 = (void (**)(id, void, double))a5;
  v11 = (void (**)(id, unint64_t))a6;
  for (unint64_t i = 0; i < [v35 numberOfDataFrames]; ++i)
  {
    v13 = [v35 dataFrameAtIndex:i];
    v14 = objc_opt_new();
    if (v11) {
      v11[2](v11, i);
    }
    id v15 = [v13 getFunctionName];
    v16 = (char *)[v15 UTF8String];

    if (v16) {
      espresso_network_set_function_name(var0, v8, v16);
    }
    v17 = (Espresso *)objc_msgSend(v14, "bindInputsFromFrame:toNetwork:", v13, var0, v8);
    if (v17)
    {
      v19 = Espresso::espresso_os_log_subsystem(v17, v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v20 = v19;
        v21 = "Error binding inputs";
        goto LABEL_21;
      }
      goto LABEL_12;
    }
    v22 = (Espresso *)objc_msgSend(v14, "bindOutputsFromFrame:toNetwork:executionStatus:", v13, var0, v8, 1);
    if (v22)
    {
      v19 = Espresso::espresso_os_log_subsystem(v22, v23);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v20 = v19;
        v21 = "Error binding static outputs";
LABEL_21:
        _os_log_error_impl(&dword_1920CB000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
      }
LABEL_12:

      v10[2](v10, 0, 0.0);
      goto LABEL_13;
    }
    v24.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    int v25 = espresso_plan_execute_sync((uint64_t *)var0);
    v26.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    if (v25)
    {
      uint64_t v33 = Espresso::espresso_os_log_subsystem((Espresso *)v26.__d_.__rep_, (const char *)v27.__d_.__rep_);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        espresso_plan_get_error_info((uint64_t)var0);
        *(_DWORD *)buf = 136315138;
        uint64_t v37 = v34;
        _os_log_error_impl(&dword_1920CB000, v33, OS_LOG_TYPE_ERROR, "Execution error: %s", buf, 0xCu);
      }

      v10[2](v10, 0, 0.0);
      break;
    }
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep rep = v26.__d_.__rep_;
    v29 = (Espresso *)objc_msgSend(v14, "bindOutputsFromFrame:toNetwork:executionStatus:", v13, var0, v8, 2);
    if (v29)
    {
      v31 = Espresso::espresso_os_log_subsystem(v29, v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1920CB000, v31, OS_LOG_TYPE_ERROR, "Error binding dynamic outputs", buf, 2u);
      }

      v10[2](v10, 0, 0.0);
    }
    else
    {
      uint64_t v32 = [v14 outputMatchingBuffers];
      ((void (**)(id, void *, double))v10)[2](v10, v32, (float)((rep - v24.__d_.__rep_) / 1000));

      [v14 freeTemporaryResources];
    }
LABEL_13:
  }
}

@end