@interface MLBackgroundTask
+ (BOOL)cancelAllTasks;
+ (BOOL)cancelTaskWithIdentifier:(id)a3;
+ (BOOL)scheduleTask:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (BOOL)taskIsScheduledWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MLBackgroundTask)init;
- (MLBackgroundTask)initWithCoder:(id)a3;
- (NSString)taskIdentifier;
- (id)activityForScheduling;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setTaskIdentifier:(id)a3;
@end

@implementation MLBackgroundTask

- (void).cxx_destruct
{
}

- (void)setTaskIdentifier:(id)a3
{
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setTaskIdentifier:self->_taskIdentifier];
  return v4;
}

- (MLBackgroundTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskIdentifier"];

  taskIdentifier = self->_taskIdentifier;
  self->_taskIdentifier = v5;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)hash
{
  v2 = [(MLBackgroundTask *)self taskIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MLBackgroundTask *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(MLBackgroundTask *)self taskIdentifier];
      v6 = [(MLBackgroundTask *)v4 taskIdentifier];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)activityForScheduling
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v31 = 0;
  unint64_t v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v31];
  id v30 = v31;
  if (v3)
  {
    id v4 = NSString;
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    v6 = [v5 bundleIdentifier];
    char v7 = [(MLBackgroundTask *)self taskIdentifier];
    v8 = [v4 stringWithFormat:@"%@::%@", v6, v7];

    id DASActivityClass = get_DASActivityClass();
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    v10 = (uint64_t *)get_DASSchedulingPriorityBackgroundSymbolLoc_ptr;
    uint64_t v35 = get_DASSchedulingPriorityBackgroundSymbolLoc_ptr;
    if (!get_DASSchedulingPriorityBackgroundSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __get_DASSchedulingPriorityBackgroundSymbolLoc_block_invoke;
      v39 = &unk_1E59A51A0;
      v40 = &v32;
      v11 = (void *)DuetActivitySchedulerLibrary();
      v12 = dlsym(v11, "_DASSchedulingPriorityBackground");
      *(void *)(v40[1] + 24) = v12;
      get_DASSchedulingPriorityBackgroundSymbolLoc_ptr = *(void *)(v40[1] + 24);
      v10 = (uint64_t *)v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (!v10) {
      goto LABEL_18;
    }
    uint64_t v13 = *v10;
    v14 = [MEMORY[0x1E4F28B50] mainBundle];
    v15 = [v14 bundleIdentifier];
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    v16 = (id *)get_DASExtensionLaunchReasonMLComputeSymbolLoc_ptr;
    uint64_t v35 = get_DASExtensionLaunchReasonMLComputeSymbolLoc_ptr;
    if (!get_DASExtensionLaunchReasonMLComputeSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __get_DASExtensionLaunchReasonMLComputeSymbolLoc_block_invoke;
      v39 = &unk_1E59A51A0;
      v40 = &v32;
      v17 = (void *)DuetActivitySchedulerLibrary();
      v18 = dlsym(v17, "_DASExtensionLaunchReasonMLCompute");
      *(void *)(v40[1] + 24) = v18;
      get_DASExtensionLaunchReasonMLComputeSymbolLoc_ptr = *(void *)(v40[1] + 24);
      v16 = (id *)v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (!v16) {
      goto LABEL_18;
    }
    id v19 = *v16;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    v20 = (uint64_t *)get_DASActivityDurationModerateSymbolLoc_ptr;
    uint64_t v35 = get_DASActivityDurationModerateSymbolLoc_ptr;
    if (!get_DASActivityDurationModerateSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __get_DASActivityDurationModerateSymbolLoc_block_invoke;
      v39 = &unk_1E59A51A0;
      v40 = &v32;
      v21 = (void *)DuetActivitySchedulerLibrary();
      v22 = dlsym(v21, "_DASActivityDurationModerate");
      *(void *)(v40[1] + 24) = v22;
      get_DASActivityDurationModerateSymbolLoc_ptr = *(void *)(v40[1] + 24);
      v20 = (uint64_t *)v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (!v20)
    {
LABEL_18:
      dlerror();
      abort_report_np();
      __break(1u);
    }
    uint64_t v23 = *v20;
    v24 = [MEMORY[0x1E4F1C9C8] date];
    v25 = [MEMORY[0x1E4F1C9C8] distantFuture];
    v26 = [DASActivityClass extensionLaunchActivityWithName:v8 priority:v13 forApplication:v15 withReason:v19 duration:v23 startingAfter:v24 startingBefore:v25];

    v36 = @"MLBackgroundTask";
    v37 = v3;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    [v26 setUserInfo:v27];

    [v26 setAfterUserIsInactive:1];
    [v26 setCpuIntensive:1];
    [v26 setRequiresPlugin:1];
    [v26 setMemoryIntensive:1];
  }
  else
  {
    v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v29 = [(MLBackgroundTask *)self taskIdentifier];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v30;
      _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "Unable to archive task %@: %@", buf, 0x16u);
    }
    v26 = 0;
  }

  return v26;
}

- (MLBackgroundTask)init
{
  v2 = self;
  if ([(MLBackgroundTask *)self isMemberOfClass:objc_opt_class()])
  {
    unint64_t v3 = 0;
  }
  else
  {
    v5.receiver = v2;
    v5.super_class = (Class)MLBackgroundTask;
    v2 = [(MLBackgroundTask *)&v5 init];
    unint64_t v3 = v2;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)taskIsScheduledWithIdentifier:(id)a3
{
  return [a3 length] != 0;
}

+ (BOOL)cancelAllTasks
{
  return 0;
}

+ (BOOL)cancelTaskWithIdentifier:(id)a3
{
  return 0;
}

+ (BOOL)scheduleTask:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    id v4 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v4, OS_LOG_TYPE_ERROR, "Task must be a MLBackgroundPredictionTask or MLBackgroundModelUpdateTask.", buf, 2u);
    }
    BOOL v11 = 0;
    goto LABEL_19;
  }
  if (get_DASActivityClass() && get_DASSchedulerClass())
  {
    id v4 = [v3 activityForScheduling];
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    objc_super v5 = (void *)get_DASActivityGroupClass_softClass;
    uint64_t v16 = get_DASActivityGroupClass_softClass;
    if (!get_DASActivityGroupClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __get_DASActivityGroupClass_block_invoke;
      v18 = &unk_1E59A51A0;
      id v19 = &v13;
      __get_DASActivityGroupClass_block_invoke((uint64_t)buf);
      objc_super v5 = (void *)v14[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v13, 8);
    char v7 = objc_msgSend(v6, "groupWithName:maxConcurrent:", @"CoreML Background Compute", 1, v13);
    v8 = [get_DASSchedulerClass() sharedScheduler];
    [v8 submitActivity:v4 inGroup:v7];
    v9 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      v18 = v4;
      _os_log_impl(&dword_19E58B000, v9, OS_LOG_TYPE_DEFAULT, "Scheduling task %@ on scheduler %@. Activity: %@", buf, 0x20u);
    }

    if (v4) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    BOOL v11 = !v10;

LABEL_19:
    goto LABEL_20;
  }
  BOOL v11 = 0;
LABEL_20:

  return v11;
}

@end