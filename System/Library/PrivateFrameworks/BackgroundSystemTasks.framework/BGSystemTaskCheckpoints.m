@interface BGSystemTaskCheckpoints
+ (BOOL)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5;
+ (BOOL)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 error:(id *)a5;
+ (BOOL)reportTaskCheckpoint:(unint64_t)a3 forTask:(id)a4 value:(id)a5 error:(id *)a6;
+ (BOOL)validateFeatureCheckpoint:(unint64_t)a3;
+ (id)logger;
+ (id)sharedInstance;
- (BGSystemTaskCheckpoints)init;
- (BOOL)reportProgressForTaskWithName:(id)a3 withGlobalTarget:(unint64_t)a4 completed:(unint64_t)a5 atDate:(id)a6 category:(unint64_t)a7 subCategory:(id)a8 error:(id *)a9;
- (NSMutableDictionary)taskToProgressMap;
- (OS_dispatch_queue)queue;
- (void)setQueue:(id)a3;
- (void)setTaskToProgressMap:(id)a3;
@end

@implementation BGSystemTaskCheckpoints

+ (id)logger
{
  if (logger_onceToken_0 != -1) {
    dispatch_once(&logger_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)logger_log_0;
  return v2;
}

uint64_t __33__BGSystemTaskCheckpoints_logger__block_invoke()
{
  logger_log_0 = (uint64_t)os_log_create("com.apple.BackgroundSystemTasks", "BGSTFramework");
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)reportTaskCheckpoint:(unint64_t)a3 forTask:(id)a4 value:(id)a5 error:(id *)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = +[BGSystemTaskCheckpoints logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218498;
    unint64_t v13 = a3;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_1D9606000, v10, OS_LOG_TYPE_DEFAULT, "Received checkpoint %lu for %@ with value %@", (uint8_t *)&v12, 0x20u);
  }

  return 1;
}

+ (BOOL)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = +[BGSystemTaskCheckpoints logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v19 = a3;
    __int16 v20 = 2048;
    unint64_t v21 = a4;
    _os_log_impl(&dword_1D9606000, v8, OS_LOG_TYPE_DEFAULT, "Received feature checkpoint %lu for feature %lu", buf, 0x16u);
  }

  if (!+[BGSystemTaskCheckpoints validateFeatureCheckpoint:a3])
  {
    unint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BGSystemTaskSchedulerErrorDomain" code:100 userInfo:0];
    id v11 = v13;
    if (a5) {
      *a5 = v13;
    }
    __int16 v14 = +[BGSystemTaskCheckpoints logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[BGSystemTaskCheckpoints reportFeatureCheckpoint:forFeature:error:]((uint64_t)v11, a3, v14);
    }

LABEL_11:
    BOOL v12 = 0;
    goto LABEL_16;
  }
  id v9 = [MEMORY[0x1E4F5FA50] sharedScheduler];
  id v17 = 0;
  char v10 = [v9 reportFeatureCheckpoint:a3 forFeature:a4 error:&v17];
  id v11 = v17;

  if ((v10 & 1) == 0)
  {
    id v15 = +[BGSystemTaskCheckpoints logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      unint64_t v19 = (unint64_t)v11;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      __int16 v22 = 2048;
      unint64_t v23 = a4;
      _os_log_error_impl(&dword_1D9606000, v15, OS_LOG_TYPE_ERROR, "Error: %@ feature checkpoint %lu for feature %lu", buf, 0x20u);
    }

    if (a5)
    {
      id v11 = v11;
      BOOL v12 = 0;
      *a5 = v11;
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  BOOL v12 = 1;
LABEL_16:

  return v12;
}

+ (BOOL)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = +[BGSystemTaskCheckpoints logger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v16 = a3;
    __int16 v17 = 2112;
    unint64_t v18 = (unint64_t)v7;
    _os_log_impl(&dword_1D9606000, v8, OS_LOG_TYPE_DEFAULT, "Received custom checkpoint %lu for task %@", buf, 0x16u);
  }

  id v9 = [MEMORY[0x1E4F5FA50] sharedScheduler];
  id v14 = 0;
  char v10 = [v9 reportCustomCheckpoint:a3 forTask:v7 error:&v14];
  id v11 = v14;

  if ((v10 & 1) == 0)
  {
    BOOL v12 = +[BGSystemTaskCheckpoints logger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      unint64_t v16 = (unint64_t)v11;
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_error_impl(&dword_1D9606000, v12, OS_LOG_TYPE_ERROR, "Error: %@ custom checkpoint %lu for task %@", buf, 0x20u);
    }

    if (a5) {
      *a5 = v11;
    }
  }

  return v10;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__BGSystemTaskCheckpoints_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __41__BGSystemTaskCheckpoints_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (BGSystemTaskCheckpoints)init
{
  v8.receiver = self;
  v8.super_class = (Class)BGSystemTaskCheckpoints;
  v2 = [(BGSystemTaskCheckpoints *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.bgst.taskCheckpoints", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (BOOL)reportProgressForTaskWithName:(id)a3 withGlobalTarget:(unint64_t)a4 completed:(unint64_t)a5 atDate:(id)a6 category:(unint64_t)a7 subCategory:(id)a8 error:(id *)a9
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a6;
  id v17 = a8;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 1;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  id v42 = 0;
  queue = self->_queue;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __118__BGSystemTaskCheckpoints_reportProgressForTaskWithName_withGlobalTarget_completed_atDate_category_subCategory_error___block_invoke;
  v28 = &unk_1E6B6C2D0;
  v32 = &v37;
  v33 = &v43;
  unint64_t v34 = a5;
  unint64_t v35 = a4;
  unint64_t v36 = a7;
  id v19 = v17;
  id v29 = v19;
  v30 = self;
  id v20 = v15;
  id v31 = v20;
  dispatch_sync(queue, &v25);
  if (!*((unsigned char *)v44 + 24))
  {
    uint64_t v21 = +[BGSystemTaskCheckpoints logger];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = v38[5];
      *(_DWORD *)buf = 138413314;
      uint64_t v48 = v24;
      __int16 v49 = 2048;
      unint64_t v50 = a5;
      __int16 v51 = 2048;
      unint64_t v52 = a4;
      __int16 v53 = 2048;
      unint64_t v54 = a7;
      __int16 v55 = 2112;
      id v56 = v19;
      _os_log_error_impl(&dword_1D9606000, v21, OS_LOG_TYPE_ERROR, "Error: %@ Completed %lu [Target:%lu] for workload %lu, subcategory %@", buf, 0x34u);
    }

    if (a9) {
      *a9 = (id) v38[5];
    }
  }
  BOOL v22 = *((unsigned char *)v44 + 24) != 0;

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v22;
}

void __118__BGSystemTaskCheckpoints_reportProgressForTaskWithName_withGlobalTarget_completed_atDate_category_subCategory_error___block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 72) < 0x65uLL)
  {
    dispatch_queue_t v5 = +[BGSystemTaskCheckpoints logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 72);
      unint64_t v7 = *(void *)(a1 + 80);
      uint64_t v8 = *(void *)(a1 + 88);
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      uint64_t v63 = v6;
      __int16 v64 = 2048;
      unint64_t v65 = v7;
      __int16 v66 = 2048;
      uint64_t v67 = v8;
      __int16 v68 = 2112;
      uint64_t v69 = v9;
      _os_log_impl(&dword_1D9606000, v5, OS_LOG_TYPE_DEFAULT, "Completed %lu [Target:%lu] for workload %lu, subcategory %@", buf, 0x2Au);
    }

    char v10 = [*(id *)(a1 + 40) taskToProgressMap];

    if (!v10)
    {
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
      [*(id *)(a1 + 40) setTaskToProgressMap:v11];
    }
    BOOL v12 = *(__CFString **)(a1 + 32);
    if (!v12) {
      BOOL v12 = @"default";
    }
    v58 = v12;
    unint64_t v13 = NSString;
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 88)];
    id v16 = [v13 stringWithFormat:@"%@-%@-%@", v14, v15, *(void *)(a1 + 32)];

    id v17 = [*(id *)(a1 + 40) taskToProgressMap];
    unint64_t v18 = [v17 objectForKeyedSubscript:v16];

    if (!v18)
    {
      id v19 = [MEMORY[0x1E4F1CA60] dictionary];
      id v20 = [*(id *)(a1 + 40) taskToProgressMap];
      [v20 setObject:v19 forKeyedSubscript:v16];
    }
    uint64_t v21 = [*(id *)(a1 + 40) taskToProgressMap];
    BOOL v22 = [v21 objectForKeyedSubscript:v16];
    unint64_t v23 = [v22 objectForKeyedSubscript:@"progress"];

    if (v23) {
      unint64_t v24 = [v23 unsignedIntegerValue];
    }
    else {
      unint64_t v24 = 0;
    }
    uint64_t v25 = [*(id *)(a1 + 40) taskToProgressMap];
    uint64_t v26 = [v25 objectForKeyedSubscript:v16];
    v27 = [v26 objectForKeyedSubscript:@"target"];

    if (v27) {
      uint64_t v28 = [v27 unsignedIntegerValue];
    }
    else {
      uint64_t v28 = 0;
    }
    id v29 = [*(id *)(a1 + 40) taskToProgressMap];
    v30 = [v29 objectForKeyedSubscript:v16];
    id v31 = [v30 objectForKeyedSubscript:@"date"];

    if (v31)
    {
      v32 = [MEMORY[0x1E4F1C9C8] now];
      [v32 timeIntervalSinceDate:v31];
      double v34 = v33;
    }
    else
    {
      double v34 = 0.0;
    }
    if (v28 == *(void *)(a1 + 80)
      && (unint64_t v35 = *(void *)(a1 + 72), v36 = v35 >= v24, v37 = v35 - v24, v36)
      && v37 <= 4
      && v34 < 86400.0)
    {
      v38 = +[BGSystemTaskCheckpoints logger];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v56 = *(void *)(a1 + 72);
        uint64_t v57 = *(void *)(a1 + 80);
        *(_DWORD *)buf = 134218752;
        uint64_t v63 = v56;
        __int16 v64 = 2048;
        unint64_t v65 = v24;
        __int16 v66 = 2048;
        uint64_t v67 = v28;
        __int16 v68 = 2048;
        uint64_t v69 = v57;
        _os_log_debug_impl(&dword_1D9606000, v38, OS_LOG_TYPE_DEBUG, "No significant change since last progress report. Caching the result. Completed %lu [Past :%lu] Target %lu [Past :%lu]", buf, 0x2Au);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
    else
    {
      uint64_t v39 = [MEMORY[0x1E4F5FA50] sharedScheduler];
      v40 = *(void **)(a1 + 48);
      uint64_t v42 = *(void *)(a1 + 72);
      uint64_t v41 = *(void *)(a1 + 80);
      uint64_t v43 = *(void *)(a1 + 88);
      uint64_t v44 = *(void *)(a1 + 32);
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __118__BGSystemTaskCheckpoints_reportProgressForTaskWithName_withGlobalTarget_completed_atDate_category_subCategory_error___block_invoke_23;
      v59[3] = &unk_1E6B6C2A8;
      uint64_t v61 = *(void *)(a1 + 64);
      id v60 = v40;
      [v39 reportTaskWorkloadProgress:v60 target:v41 completed:v42 category:v43 subCategory:v44 completionHandler:v59];

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        uint64_t v45 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
        char v46 = [*(id *)(a1 + 40) taskToProgressMap];
        v47 = [v46 objectForKeyedSubscript:v16];
        [v47 setObject:v45 forKeyedSubscript:@"progress"];

        uint64_t v48 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
        __int16 v49 = [*(id *)(a1 + 40) taskToProgressMap];
        unint64_t v50 = [v49 objectForKeyedSubscript:v16];
        [v50 setObject:v48 forKeyedSubscript:@"target"];

        __int16 v51 = [MEMORY[0x1E4F1C9C8] now];
        unint64_t v52 = [*(id *)(a1 + 40) taskToProgressMap];
        __int16 v53 = [v52 objectForKeyedSubscript:v16];
        [v53 setObject:v51 forKeyedSubscript:@"date"];
      }
      else
      {
        uint64_t v54 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BGSystemTaskSchedulerErrorDomain" code:3 userInfo:0];
        uint64_t v55 = *(void *)(*(void *)(a1 + 56) + 8);
        __int16 v51 = *(void **)(v55 + 40);
        *(void *)(v55 + 40) = v54;
      }
    }
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BGSystemTaskSchedulerErrorDomain" code:4 userInfo:0];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

void __118__BGSystemTaskCheckpoints_reportProgressForTaskWithName_withGlobalTarget_completed_atDate_category_subCategory_error___block_invoke_23(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (a2)
  {
    *(unsigned char *)(v3 + 24) = 1;
    v4 = +[BGSystemTaskCheckpoints logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1D9606000, v4, OS_LOG_TYPE_DEFAULT, "Successfully reported task workload progress for %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    *(unsigned char *)(v3 + 24) = 0;
    v4 = +[BGSystemTaskCheckpoints logger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __118__BGSystemTaskCheckpoints_reportProgressForTaskWithName_withGlobalTarget_completed_atDate_category_subCategory_error___block_invoke_23_cold_1(a1, v4);
    }
  }
}

+ (BOOL)validateFeatureCheckpoint:(unint64_t)a3
{
  BOOL result = 1;
  if (a3 - 8 > 0x3E || ((1 << (a3 - 8)) & 0x4010040100401007) == 0) {
    return a3 - 1 < 3;
  }
  return result;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)taskToProgressMap
{
  return self->_taskToProgressMap;
}

- (void)setTaskToProgressMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskToProgressMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)reportFeatureCheckpoint:(uint64_t)a1 forFeature:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D9606000, log, OS_LOG_TYPE_ERROR, "%@ %lu is not a valid feature checkpoint", (uint8_t *)&v3, 0x16u);
}

void __118__BGSystemTaskCheckpoints_reportProgressForTaskWithName_withGlobalTarget_completed_atDate_category_subCategory_error___block_invoke_23_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D9606000, a2, OS_LOG_TYPE_ERROR, "reportTaskWorkloadProgress: failed for %{public}@", (uint8_t *)&v3, 0xCu);
}

@end