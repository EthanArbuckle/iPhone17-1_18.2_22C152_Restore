@interface MLRInternalBMLTTask
+ (BOOL)supportsSecureCoding;
- (BOOL)downloadFactorsSynchronouslyWithError:(id *)a3;
- (BOOL)evaluateTargetingExpressionForPlugin:(id)a3 error:(id *)a4;
- (BOOL)evaluateTargetingExpressionWithParameters:(id)a3 error:(id *)a4;
- (BOOL)fetchDataIfNecessaryWithError:(id *)a3;
- (BOOL)submitTask:(id)a3 result:(id)a4 duration:(double)a5 errorToBeSubmitted:(id)a6 error:(id *)a7;
- (DESRecordSet)recordSet;
- (MLRBMLTSchedulingPolicy)policy;
- (MLRInternalBMLTTask)initWithCoder:(id)a3;
- (MLRInternalBMLTTask)initWithTRIClientBackgroundMLTask:(id)a3 factorsState:(id)a4;
- (MLRInternalBMLTTask)initWithTRIClientBackgroundMLTask:(id)a3 factorsState:(id)a4 recordSet:(id)a5;
- (NSString)description;
- (NSString)pluginID;
- (NSString)taskID;
- (TRIClient)triClient;
- (TRIClientBackgroundMLTask)triBMLT;
- (TRIFactorsState)factorsState;
- (id)MLRSandboxExtensionRequests;
- (id)MLRTaskWithError:(id *)a3;
- (id)attachmentsDirURL;
- (id)performOnPlugin:(id)a3 error:(id *)a4;
- (id)recipeURL;
- (id)taskAttachmentsWithError:(id *)a3;
- (id)taskParametersWithError:(id *)a3;
- (void)attachmentsDirURL;
- (void)encodeWithCoder:(id)a3;
- (void)recipeURL;
@end

@implementation MLRInternalBMLTTask

- (MLRInternalBMLTTask)initWithTRIClientBackgroundMLTask:(id)a3 factorsState:(id)a4
{
  return [(MLRInternalBMLTTask *)self initWithTRIClientBackgroundMLTask:a3 factorsState:a4 recordSet:0];
}

- (MLRInternalBMLTTask)initWithTRIClientBackgroundMLTask:(id)a3 factorsState:(id)a4 recordSet:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([v9 hasPluginId] & 1) == 0)
  {
    v27 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:].cold.8();
    }
    goto LABEL_28;
  }
  if (([v9 hasTaskId] & 1) == 0)
  {
    v27 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:].cold.7();
    }
    goto LABEL_28;
  }
  if (([v9 hasDeploymentId] & 1) == 0)
  {
    v27 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:].cold.6();
    }
    goto LABEL_28;
  }
  if (([v9 hasProjectId] & 1) == 0)
  {
    v27 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:].cold.5();
    }
    goto LABEL_28;
  }
  if (([v9 hasNamespaceId] & 1) == 0)
  {
    v27 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:].cold.4();
    }
    goto LABEL_28;
  }
  if (([v9 hasSchedulingPolicy] & 1) == 0)
  {
    v27 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:]();
    }
    goto LABEL_28;
  }
  if (!v10)
  {
    v27 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:](v27);
    }
    goto LABEL_28;
  }
  v29.receiver = self;
  v29.super_class = (Class)MLRInternalBMLTTask;
  v12 = [(MLRInternalBMLTTask *)&v29 init];
  self = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_factorsState, a4);
    v13 = [v9 pluginId];
    v14 = (NSString *)[v13 copy];
    pluginID = self->_pluginID;
    self->_pluginID = v14;

    v16 = [MLRBMLTSchedulingPolicy alloc];
    v17 = [v9 schedulingPolicy];
    v18 = [(MLRBMLTSchedulingPolicy *)v16 initWithTRIPBStruct:v17];
    policy = self->_policy;
    self->_policy = v18;

    if (self->_policy)
    {
      objc_storeStrong((id *)&self->_recordSet, a5);
      v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v21 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MLRuntime.MLRInternalBMLTTask.syncQueue", v20);
      syncQueue = self->_syncQueue;
      self->_syncQueue = v21;

      v23 = [v9 taskId];
      objc_msgSend(v23, "stringByAppendingFormat:", @"_%u", objc_msgSend(v9, "deploymentId"));
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      taskID = self->_taskID;
      self->_taskID = v24;

      objc_storeStrong((id *)&self->_triBMLT, a3);
      goto LABEL_11;
    }
    v27 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask initWithTRIClientBackgroundMLTask:factorsState:recordSet:]();
    }
LABEL_28:

    v26 = 0;
    goto LABEL_29;
  }
LABEL_11:
  self = self;
  v26 = self;
LABEL_29:

  return v26;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@(BMLT=%@, recordSet=%@)", v5, self->_triBMLT, self->_recordSet];

  return (NSString *)v6;
}

- (id)attachmentsDirURL
{
  v3 = [(MLRBMLTSchedulingPolicy *)self->_policy attachmentsFactorName];
  triClient = self->_triClient;
  v5 = [(TRIClientBackgroundMLTask *)self->_triBMLT namespaceId];
  v6 = [(TRIClient *)triClient levelForFactor:v3 withNamespaceName:v5];

  if ([v6 levelOneOfCase] != 101)
  {
    id v10 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask attachmentsDirURL]();
    }
    goto LABEL_10;
  }
  v7 = [v6 directoryValue];
  v8 = [v7 path];

  id v9 = [MEMORY[0x263F3A438] coreChannel];
  id v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask attachmentsDirURL]();
    }
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(MLRInternalBMLTTask *)(uint64_t)v3 attachmentsDirURL];
  }

  id v11 = NSURL;
  id v10 = [v6 directoryValue];
  v12 = [v10 path];
  v13 = [v11 fileURLWithPath:v12 isDirectory:1];

LABEL_11:

  return v13;
}

- (id)recipeURL
{
  v3 = [(MLRBMLTSchedulingPolicy *)self->_policy recipeFactorName];
  triClient = self->_triClient;
  v5 = [(TRIClientBackgroundMLTask *)self->_triBMLT namespaceId];
  v6 = [(TRIClient *)triClient levelForFactor:v3 withNamespaceName:v5];

  if ([v6 levelOneOfCase] != 100)
  {
    id v10 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask attachmentsDirURL]();
    }
    goto LABEL_10;
  }
  v7 = [v6 fileValue];
  v8 = [v7 path];

  id v9 = [MEMORY[0x263F3A438] coreChannel];
  id v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask recipeURL]();
    }
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(MLRInternalBMLTTask *)(uint64_t)v3 recipeURL];
  }

  id v11 = NSURL;
  id v10 = [v6 fileValue];
  v12 = [v10 path];
  v13 = [v11 fileURLWithPath:v12 isDirectory:0];

LABEL_11:

  return v13;
}

- (id)taskParametersWithError:(id *)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  v4 = [(MLRInternalBMLTTask *)self recipeURL];
  if (v4)
  {
    id v14 = 0;
    v5 = [[MLRTaskParameters alloc] initWithURL:v4 error:&v14];
    id v6 = v14;
    if (!a3 || v5) {
      goto LABEL_8;
    }
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F3A4A0];
    v15[0] = *MEMORY[0x263F08320];
    id v9 = [NSString stringWithFormat:@"Fail to decode URL=(%@)", v4];
    v15[1] = *MEMORY[0x263F08608];
    v16[0] = v9;
    v16[1] = v6;
    id v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    *a3 = [v7 errorWithDomain:v8 code:5006 userInfo:v10];

LABEL_7:
LABEL_8:

    goto LABEL_9;
  }
  if (a3)
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F3A4A0];
    uint64_t v17 = *MEMORY[0x263F08320];
    id v6 = [NSString stringWithFormat:@"Fail to fetch recipeURL"];
    v18[0] = v6;
    id v9 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    [v11 errorWithDomain:v12 code:5003 userInfo:v9];
    v5 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

- (id)taskAttachmentsWithError:(id *)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  v4 = [(MLRInternalBMLTTask *)self attachmentsDirURL];
  if (v4)
  {
    a3 = [[MLRTaskAttachments alloc] initWithContentsOfURL:v4 error:a3];
  }
  else if (a3)
  {
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = *MEMORY[0x263F3A4A0];
    uint64_t v10 = *MEMORY[0x263F08320];
    v7 = [NSString stringWithFormat:@"Fail to fetch attachmentsDirURL"];
    v11[0] = v7;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a3 = [v5 errorWithDomain:v6 code:5004 userInfo:v8];

    a3 = 0;
  }

  return a3;
}

- (id)MLRTaskWithError:(id *)a3
{
  v5 = -[MLRInternalBMLTTask taskParametersWithError:](self, "taskParametersWithError:");
  if (v5)
  {
    uint64_t v6 = [(MLRInternalBMLTTask *)self taskAttachmentsWithError:a3];
    if (v6) {
      v7 = [[MLRTask alloc] initWithParameters:v5 attachments:v6 internalTask:self];
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)fetchDataIfNecessaryWithError:(id *)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  if (![(MLRBMLTSchedulingPolicy *)self->_policy dodMLRequireDESRecordStore]) {
    return 1;
  }
  v5 = [(MLRBMLTSchedulingPolicy *)self->_policy dodMLPredicate];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    if (!a3) {
      return 0;
    }
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F3A4A0];
    uint64_t v29 = *MEMORY[0x263F08338];
    uint64_t v17 = NSString;
    v18 = [(MLRBMLTSchedulingPolicy *)self->_policy recipeID];
    v19 = [v17 stringWithFormat:@"Invalid DodML client predicate for recipeID=%@", v18];
    v30[0] = v19;
    v20 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v21 = v15;
    uint64_t v22 = v16;
    uint64_t v23 = 1513;
LABEL_8:
    *a3 = [v21 errorWithDomain:v22 code:v23 userInfo:v20];

    return 0;
  }
  v7 = objc_opt_new();
  uint64_t v8 = [v7 fetchRecordSetSynchronouslyForBundleId:self->_pluginID error:a3];
  recordSet = self->_recordSet;
  self->_recordSet = v8;

  uint64_t v10 = self->_recordSet;
  id v11 = [(MLRBMLTSchedulingPolicy *)self->_policy dodMLPredicate];
  uint64_t v12 = [(DESRecordSet *)v10 filteredRecordSetWithJSONPredicate:v11];
  v13 = self->_recordSet;
  self->_recordSet = v12;

  if ([(DESRecordSet *)self->_recordSet count])
  {
    [MEMORY[0x263F3A428] sendEventRecordsMatchedForBundleID:self->_pluginID];
    return 1;
  }
  if (a3 && !*a3)
  {
    v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F3A4A0];
    uint64_t v27 = *MEMORY[0x263F08338];
    v26 = NSString;
    v18 = [(MLRBMLTSchedulingPolicy *)self->_policy recipeID];
    v19 = [v26 stringWithFormat:@"No matched DES records for recipeID=%@", v18];
    v28 = v19;
    v20 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v21 = v24;
    uint64_t v22 = v25;
    uint64_t v23 = 1532;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)downloadFactorsSynchronouslyWithError:(id *)a3
{
  v46[2] = *MEMORY[0x263EF8340];
  if (!self->_triClient)
  {
    id v29 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"nil TRIClient" userInfo:0];
    objc_exception_throw(v29);
  }
  uint64_t v41 = 0;
  v42[0] = &v41;
  v42[1] = 0x3032000000;
  v42[2] = __Block_byref_object_copy_;
  v42[3] = __Block_byref_object_dispose_;
  id v43 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  triClient = self->_triClient;
  v7 = [(MLRBMLTSchedulingPolicy *)self->_policy recipeFactorName];
  v46[0] = v7;
  uint64_t v8 = [(MLRBMLTSchedulingPolicy *)self->_policy attachmentsFactorName];
  v46[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
  uint64_t v10 = [(TRIClientBackgroundMLTask *)self->_triBMLT namespaceId];
  id v11 = objc_opt_new();
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  v32 = __61__MLRInternalBMLTTask_downloadFactorsSynchronouslyWithError___block_invoke;
  v33 = &unk_2643F1EF8;
  v35 = &v37;
  v36 = &v41;
  uint64_t v12 = v5;
  v34 = v12;
  [(TRIClient *)triClient downloadLevelsForFactors:v9 withNamespace:v10 queue:0 options:v11 progress:0 completion:&v30];

  dispatch_time_t v13 = dispatch_time(0, 1800000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = *MEMORY[0x263F08320];
    v15 = [NSString stringWithFormat:@"Timeout while downloading factors for task=%@", self, v30, v31, v32, v33];
    v45 = v15;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    uint64_t v17 = [v14 errorWithDomain:*MEMORY[0x263F3A4A0] code:5008 userInfo:v16];
    v18 = *(void **)(v42[0] + 40);
    *(void *)(v42[0] + 40) = v17;

    v19 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask downloadFactorsSynchronouslyWithError:]((uint64_t)v42, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  int v26 = *((unsigned __int8 *)v38 + 24);
  if (*((unsigned char *)v38 + 24))
  {
    uint64_t v27 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[MLRInternalBMLTTask downloadFactorsSynchronouslyWithError:]((uint64_t)self, v27);
    }

    [(TRIClient *)self->_triClient refresh];
  }
  else if (a3)
  {
    *a3 = *(id *)(v42[0] + 40);
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v26 != 0;
}

void __61__MLRInternalBMLTTask_downloadFactorsSynchronouslyWithError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (TRIClient)triClient
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__MLRInternalBMLTTask_triClient__block_invoke;
  block[3] = &unk_2643F1F20;
  block[4] = self;
  dispatch_sync(syncQueue, block);
  return self->_triClient;
}

uint64_t __32__MLRInternalBMLTTask_triClient__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 32))
  {
    uint64_t v2 = result;
    *(void *)(*(void *)(v2 + 32) + 32) = objc_msgSend(MEMORY[0x263F80E20], "clientWithProjectId:factorsState:", objc_msgSend(*(id *)(v1 + 64), "projectId"), *(void *)(*(void *)(result + 32) + 40));
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (BOOL)evaluateTargetingExpressionWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  triClient = self->_triClient;
  if (!triClient)
  {
    id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"use _triClient before initialization" userInfo:0];
    objc_exception_throw(v12);
  }
  uint64_t v8 = v6;
  id v9 = [(TRIClientBackgroundMLTask *)self->_triBMLT customTargeting];
  char v10 = [(TRIClient *)triClient evaluateBMLTTargetingExpression:v9 withParameters:v8 error:a4];

  return v10;
}

- (BOOL)evaluateTargetingExpressionForPlugin:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (([(TRIClientBackgroundMLTask *)self->_triBMLT hasCustomTargeting] & 1) == 0)
  {
    id v9 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[MLRInternalBMLTTask evaluateTargetingExpressionForPlugin:error:](v9);
    }
    goto LABEL_13;
  }
  v7 = [(TRIClientBackgroundMLTask *)self->_triBMLT customTargetingKeysArray];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    id v9 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask evaluateTargetingExpressionForPlugin:error:](self, v9);
    }
LABEL_13:
    BOOL v13 = 1;
    goto LABEL_14;
  }
  if (objc_opt_respondsToSelector())
  {
    id v9 = v6;
    char v10 = [(TRIClientBackgroundMLTask *)self->_triBMLT customTargetingKeysArray];
    id v33 = 0;
    id v11 = [v9 targetingKeyValuePairsForKeys:v10 error:&v33];
    id v12 = v33;

    if (v11)
    {
      id v32 = v12;
      BOOL v13 = [(MLRInternalBMLTTask *)self evaluateTargetingExpressionWithParameters:v11 error:&v32];
      id v14 = v32;

      if (!a4 || v13)
      {
        id v12 = v14;
        goto LABEL_28;
      }
      if (v14)
      {
        v15 = v14;
LABEL_21:
        id v12 = v15;
        BOOL v13 = 0;
        *a4 = v12;
LABEL_28:

        goto LABEL_14;
      }
      v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F3A4A0];
      uint64_t v34 = *MEMORY[0x263F08320];
      uint64_t v21 = NSString;
      uint64_t v22 = [(TRIClientBackgroundMLTask *)self->_triBMLT customTargeting];
      uint64_t v23 = [v21 stringWithFormat:@"Custom targeting evaluated as false, predicate=%@, parameters=%@", v22, v11];
      v35 = v23;
      uint64_t v24 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      uint64_t v25 = v19;
      uint64_t v26 = v20;
      uint64_t v27 = 8018;
    }
    else
    {
      if (!a4)
      {
LABEL_27:
        BOOL v13 = 0;
        goto LABEL_28;
      }
      if (v12)
      {
        v15 = v12;
        goto LABEL_21;
      }
      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F3A4A0];
      uint64_t v36 = *MEMORY[0x263F08320];
      uint64_t v30 = NSString;
      uint64_t v22 = [(TRIClientBackgroundMLTask *)self->_triBMLT customTargeting];
      uint64_t v23 = [v30 stringWithFormat:@"Nil parameters returned for predicate=%@", v22];
      uint64_t v37 = v23;
      uint64_t v24 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      uint64_t v25 = v28;
      uint64_t v26 = v29;
      uint64_t v27 = 8017;
    }
    id v31 = [v25 errorWithDomain:v26 code:v27 userInfo:v24];
    *a4 = v31;

    id v12 = 0;
    goto LABEL_27;
  }
  if (!a4)
  {
    BOOL v13 = 0;
    goto LABEL_15;
  }
  uint64_t v17 = (void *)MEMORY[0x263F087E8];
  uint64_t v18 = *MEMORY[0x263F3A4A0];
  uint64_t v38 = *MEMORY[0x263F08320];
  v39[0] = @"dictionaryWithValuesForKeys:error: not implemented";
  id v9 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
  [v17 errorWithDomain:v18 code:8008 userInfo:v9];
  BOOL v13 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_15:
  return v13;
}

- (BOOL)submitTask:(id)a3 result:(id)a4 duration:(double)a5 errorToBeSubmitted:(id)a6 error:(id *)a7
{
  unint64_t v7 = [(MLRBMLTSchedulingPolicy *)self->_policy upload];
  if (v7 == 1) {
    DESLogAndSetSunsetError();
  }
  return v7 != 1;
}

- (id)performOnPlugin:(id)a3 error:(id *)a4
{
  v86[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v73 = 0;
  v74[0] = &v73;
  v74[1] = 0x3032000000;
  v74[2] = __Block_byref_object_copy_;
  v74[3] = __Block_byref_object_dispose_;
  id v75 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy_;
  v71 = __Block_byref_object_dispose_;
  id v72 = 0;
  int v7 = objc_opt_respondsToSelector();
  if (((v7 | objc_opt_respondsToSelector()) & 1) == 0)
  {
    uint64_t v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v85 = *MEMORY[0x263F08320];
    v86[0] = @"performTask:outError: not implemented";
    uint64_t v24 = [NSDictionary dictionaryWithObjects:v86 forKeys:&v85 count:1];
    uint64_t v25 = [v23 errorWithDomain:*MEMORY[0x263F3A4A0] code:8008 userInfo:v24];
    uint64_t v26 = *(void **)(v74[0] + 40);
    *(void *)(v74[0] + 40) = v25;

    v15 = 0;
    double v27 = 0.0;
    goto LABEL_18;
  }
  uint64_t v8 = [(MLRInternalBMLTTask *)self triClient];
  triClient = self->_triClient;
  self->_triClient = v8;

  if (!self->_triClient)
  {
    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v83 = *MEMORY[0x263F08320];
    uint64_t v29 = [NSString stringWithFormat:@"Nil TRIClient: missing entitlement?"];
    v84 = v29;
    uint64_t v30 = [NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
    uint64_t v31 = [v28 errorWithDomain:*MEMORY[0x263F3A4A0] code:5001 userInfo:v30];
    id v32 = *(void **)(v74[0] + 40);
    *(void *)(v74[0] + 40) = v31;

    uint64_t v24 = [MEMORY[0x263F3A438] coreChannel];
    double v27 = 0.0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask performOnPlugin:error:]();
    }
    goto LABEL_17;
  }
  char v10 = (id *)(v74[0] + 40);
  id obj = *(id *)(v74[0] + 40);
  BOOL v11 = [(MLRInternalBMLTTask *)self evaluateTargetingExpressionForPlugin:v6 error:&obj];
  objc_storeStrong(v10, obj);
  if (!v11)
  {
    uint64_t v24 = [MEMORY[0x263F3A438] coreChannel];
    double v27 = 0.0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask performOnPlugin:error:].cold.7();
    }
    goto LABEL_17;
  }
  id v12 = (id *)(v74[0] + 40);
  id v65 = *(id *)(v74[0] + 40);
  BOOL v13 = [(MLRInternalBMLTTask *)self downloadFactorsSynchronouslyWithError:&v65];
  objc_storeStrong(v12, v65);
  if (!v13)
  {
    uint64_t v24 = [MEMORY[0x263F3A438] coreChannel];
    double v27 = 0.0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask performOnPlugin:error:].cold.6();
    }
    goto LABEL_17;
  }
  id v14 = (id *)(v74[0] + 40);
  id v64 = *(id *)(v74[0] + 40);
  v15 = [(MLRInternalBMLTTask *)self MLRTaskWithError:&v64];
  objc_storeStrong(v14, v64);
  if (!v15)
  {
    uint64_t v24 = [MEMORY[0x263F3A438] coreChannel];
    double v27 = 0.0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MLRInternalBMLTTask performOnPlugin:error:]();
    }
LABEL_17:
    v15 = 0;
    goto LABEL_18;
  }
  uint64_t v16 = [MEMORY[0x263F08AB0] processInfo];
  [v16 systemUptime];
  double v18 = v17;

  v19 = (void *)MEMORY[0x21D4A5AA0]();
  if (v7)
  {
    uint64_t v20 = (id *)(v74[0] + 40);
    id v63 = *(id *)(v74[0] + 40);
    uint64_t v21 = [v6 performTask:v15 outError:&v63];
    objc_storeStrong(v20, v63);
    uint64_t v22 = v68[5];
    v68[5] = v21;
  }
  else
  {
    dispatch_semaphore_t v44 = dispatch_semaphore_create(0);
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __45__MLRInternalBMLTTask_performOnPlugin_error___block_invoke;
    v59[3] = &unk_2643F1F48;
    v61 = &v67;
    v62 = &v73;
    uint64_t v22 = v44;
    v60 = v22;
    [v6 performAsyncTask:v15 completionHandler:v59];
    dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  }
  v45 = [MEMORY[0x263F08AB0] processInfo];
  [v45 systemUptime];
  double v47 = v46;

  double v27 = v47 - v18;
  if (*(void *)(v74[0] + 40))
  {
    uint64_t v24 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v48 = objc_opt_class();
      [(MLRInternalBMLTTask *)v48 performOnPlugin:buf error:v24];
    }
  }
  else
  {
    v49 = [(id)v68[5] JSONResult];
    BOOL v50 = v49 == 0;

    if (v50)
    {
      v53 = [MEMORY[0x263F3A438] coreChannel];
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        uint64_t v54 = objc_opt_class();
        -[MLRInternalBMLTTask performOnPlugin:error:].cold.4(v54, buf, v53);
      }

      v55 = (void *)MEMORY[0x263F087E8];
      uint64_t v77 = *MEMORY[0x263F08320];
      v78 = @"Plugin fail to return JSON result";
      uint64_t v24 = [NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      uint64_t v56 = [v55 errorWithDomain:*MEMORY[0x263F3A4A0] code:1511 userInfo:v24];
      v57 = *(void **)(v74[0] + 40);
      *(void *)(v74[0] + 40) = v56;
    }
    else
    {
      uint64_t v24 = [MEMORY[0x263F3A438] coreChannel];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v51 = objc_opt_class();
        uint64_t v52 = v68[5];
        *(_DWORD *)buf = 138412546;
        uint64_t v80 = v51;
        __int16 v81 = 2112;
        uint64_t v82 = v52;
        _os_log_impl(&dword_21C376000, v24, OS_LOG_TYPE_DEFAULT, "Plugin(%@) return result=%@", buf, 0x16u);
      }
    }
  }
LABEL_18:

  uint64_t v33 = v68[5];
  uint64_t v34 = *(void *)(v74[0] + 40);
  id v58 = 0;
  BOOL v35 = [(MLRInternalBMLTTask *)self submitTask:v15 result:v33 duration:v34 errorToBeSubmitted:&v58 error:v27];
  id v36 = v58;
  id v37 = v58;
  if (!v35)
  {
    uint64_t v38 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = objc_opt_class();
      [(MLRInternalBMLTTask *)v39 performOnPlugin:v76 error:v38];
    }

    char v40 = (void *)v68[5];
    v68[5] = 0;

    if (!*(void *)(v74[0] + 40)) {
      objc_storeStrong((id *)(v74[0] + 40), v36);
    }
  }
  if (a4)
  {
    uint64_t v41 = *(void **)(v74[0] + 40);
    if (v41) {
      *a4 = v41;
    }
  }
  v42 = [(id)v68[5] JSONResult];

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  return v42;
}

void __45__MLRInternalBMLTTask_performOnPlugin_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)MLRSandboxExtensionRequests
{
  v14[2] = *MEMORY[0x263EF8340];
  v3 = [MLRSandboxExtensionRequest alloc];
  v4 = DESSubmissionLogDirectoryURL();
  BOOL v13 = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  id v6 = [(MLRSandboxExtensionRequest *)v3 initWithURLs:v5 requireWrite:1];
  v14[0] = v6;
  uint64_t v7 = [MLRSandboxExtensionRequest alloc];
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [v8 recordDirURLsForBundleId:self->_pluginID];
  char v10 = [(MLRSandboxExtensionRequest *)v7 initWithURLs:v9 requireWrite:1];
  v14[1] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_triBMLT forKey:@"TRIMLRuntimeEvaluation"];
  [v5 encodeObject:self->_factorsState forKey:@"TRIFactorsState"];
  recordSet = self->_recordSet;
  if (recordSet) {
    [v5 encodeObject:recordSet forKey:@"RecordSet"];
  }
}

- (MLRInternalBMLTTask)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TRIMLRuntimeEvaluation"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TRIFactorsState"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecordSet"];

  uint64_t v8 = [(MLRInternalBMLTTask *)self initWithTRIClientBackgroundMLTask:v5 factorsState:v6 recordSet:v7];
  return v8;
}

- (NSString)pluginID
{
  return self->_pluginID;
}

- (NSString)taskID
{
  return self->_taskID;
}

- (TRIFactorsState)factorsState
{
  return self->_factorsState;
}

- (MLRBMLTSchedulingPolicy)policy
{
  return self->_policy;
}

- (DESRecordSet)recordSet
{
  return self->_recordSet;
}

- (TRIClientBackgroundMLTask)triBMLT
{
  return self->_triBMLT;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triBMLT, 0);
  objc_storeStrong((id *)&self->_recordSet, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_factorsState, 0);
  objc_storeStrong((id *)&self->_triClient, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_pluginID, 0);

  objc_storeStrong((id *)&self->_syncQueue, 0);
}

- (void)initWithTRIClientBackgroundMLTask:(os_log_t)log factorsState:recordSet:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C376000, log, OS_LOG_TYPE_ERROR, "Invalid TRIFactorsState: nil factorsState", v1, 2u);
}

- (void)initWithTRIClientBackgroundMLTask:factorsState:recordSet:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21C376000, v0, v1, "Failed to create MLRBMLTSchedulingPolicy with TRIClientBackgroundMLTask=%@", v2, v3, v4, v5, v6);
}

- (void)initWithTRIClientBackgroundMLTask:factorsState:recordSet:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21C376000, v0, v1, "Invalid TRIClientBackgroundMLTask: no schedulingPolicy, TRIClientBackgroundMLTask=%@", v2, v3, v4, v5, v6);
}

- (void)initWithTRIClientBackgroundMLTask:factorsState:recordSet:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21C376000, v0, v1, "Invalid TRIClientBackgroundMLTask: no NamespaceId with bmlt=%@", v2, v3, v4, v5, v6);
}

- (void)initWithTRIClientBackgroundMLTask:factorsState:recordSet:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21C376000, v0, v1, "Invalid TRIClientBackgroundMLTask: no ProjectId with bmlt=%@", v2, v3, v4, v5, v6);
}

- (void)initWithTRIClientBackgroundMLTask:factorsState:recordSet:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21C376000, v0, v1, "Invalid TRIClientBackgroundMLTask: no DeploymentId with bmlt=%@", v2, v3, v4, v5, v6);
}

- (void)initWithTRIClientBackgroundMLTask:factorsState:recordSet:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21C376000, v0, v1, "Invalid TRIClientBackgroundMLTask: no TaskId with bmlt=%@", v2, v3, v4, v5, v6);
}

- (void)initWithTRIClientBackgroundMLTask:factorsState:recordSet:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21C376000, v0, v1, "Invalid TRIClientBackgroundMLTask: no PluginId with bmlt=%@", v2, v3, v4, v5, v6);
}

- (void)attachmentsDirURL
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21C376000, v0, v1, "Unexpected type for factor %@", v2, v3, v4, v5, v6);
}

- (void)recipeURL
{
  uint64_t v2 = [a2 fileValue];
  uint64_t v3 = [v2 path];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_21C376000, v4, v5, "path for %@: (%@)", v6, v7, v8, v9, v10);
}

- (void)downloadFactorsSynchronouslyWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21C376000, a2, OS_LOG_TYPE_DEBUG, "Finish downloading factors for %@", (uint8_t *)&v3, 0xCu);
}

- (void)downloadFactorsSynchronouslyWithError:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21C376000, a2, a3, "Fail to download factors with error=%@", a5, a6, a7, a8, 2u);
}

- (void)evaluateTargetingExpressionForPlugin:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = [a1 triBMLT];
  uint64_t v4 = [v3 customTargeting];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21C376000, a2, OS_LOG_TYPE_ERROR, "Ignore customTargeting=(%@) with empty customTargetingKeysArray", v5, 0xCu);
}

- (void)evaluateTargetingExpressionForPlugin:(os_log_t)log error:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21C376000, log, OS_LOG_TYPE_DEBUG, "Skip targeting expression evaluation: no predicate", v1, 2u);
}

- (void)performOnPlugin:(uint8_t *)buf error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_21C376000, log, OS_LOG_TYPE_ERROR, "Fail to submit result for plugin(%@) with error=%@", buf, 0x16u);
}

- (void)performOnPlugin:error:.cold.2()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_21C376000, v0, v1, "Fail to create TRIClient: task=%@, error=%@");
}

- (void)performOnPlugin:error:.cold.3()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_21C376000, v0, v1, "Fail to load task parameters for task=%@ with error=%@");
}

- (void)performOnPlugin:(os_log_t)log error:.cold.4(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21C376000, log, OS_LOG_TYPE_ERROR, "Plugin(%@) fail to return JSON result.", buf, 0xCu);
}

- (void)performOnPlugin:(uint8_t *)buf error:(os_log_t)log .cold.5(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v4 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = v4;
  _os_log_error_impl(&dword_21C376000, log, OS_LOG_TYPE_ERROR, "Plugin(%@) return error=%@", buf, 0x16u);
}

- (void)performOnPlugin:error:.cold.6()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_21C376000, v0, v1, "Fail to download factors for task=%@ with error=%@");
}

- (void)performOnPlugin:error:.cold.7()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_21C376000, v0, v1, "Fail to evaluate custom targeting expression for task=%@ with error=%@");
}

@end