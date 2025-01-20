@interface SGTrialClientWrapper
- (BOOL)_unarchiveFrom:(id)a3 to:(id)a4;
- (BOOL)_uncompressModelAtPath:(id)a3 toPath:(id)a4;
- (BOOL)refreshEnrollmentInformationForNamespace:(id)a3;
- (BOOL)refreshRolloutIdentifiersForNamespace:(id)a3;
- (SGTrialClientWrapper)initWithClientIdentifier:(int)a3;
- (id)_modelDirectoryPathCreateIfNeeded:(BOOL)a3;
- (id)_modelNameForCurrentEnrollment;
- (id)_modelNameForExperimentId:(id)a3 treatmentId:(id)a4 deploymentId:(id)a5;
- (id)_modelPathForExperimentId:(id)a3 treatmentId:(id)a4 deploymentId:(id)a5 createIfNeeded:(BOOL)a6;
- (id)baseModelName;
- (id)deploymentId;
- (id)experimentId;
- (id)modelPath;
- (id)modelPathForCurrentEnrollment;
- (id)modelPathForExperimentId:(id)a3 treatmentId:(id)a4 deploymentId:(id)a5;
- (id)modelPathForTriClient:(id)a3 andNamespace:(id)a4;
- (id)rolloutIdentifiers;
- (id)treatmentId;
- (void)cleanExperimentModelsFromTrialModelsFolder;
- (void)uncompressModelAndUpdateFactors:(id)a3 destinationPath:(id)a4;
@end

@implementation SGTrialClientWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutIdentifiers, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_triClient, 0);
}

- (id)_modelNameForExperimentId:(id)a3 treatmentId:(id)a4 deploymentId:(id)a5
{
  id v8 = a5;
  v9 = (objc_class *)NSString;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 alloc];
  uint64_t v13 = [(SGTrialClientWrapper *)self baseModelName];
  v14 = (void *)v13;
  if (v8) {
    uint64_t v15 = [v12 initWithFormat:@"%@_%@_%@_%@", v13, v10, v11, v8];
  }
  else {
    uint64_t v15 = [v12 initWithFormat:@"%@_%@_%@", v13, v10, v11, v19];
  }
  v16 = (void *)v15;

  v17 = [v16 stringByAppendingPathExtension:@"mlmodelc"];

  return v17;
}

- (id)_modelNameForCurrentEnrollment
{
  v3 = [(SGTrialClientWrapper *)self experimentId];
  v4 = [(SGTrialClientWrapper *)self treatmentId];
  v5 = [(SGTrialClientWrapper *)self deploymentId];
  v6 = [(SGTrialClientWrapper *)self _modelNameForExperimentId:v3 treatmentId:v4 deploymentId:v5];

  return v6;
}

- (id)_modelDirectoryPathCreateIfNeeded:(BOOL)a3
{
  return +[SGPaths suggestionsSubdirectory:@"TrialModels" creatingDirectoriesIfNeeded:a3];
}

- (id)_modelPathForExperimentId:(id)a3 treatmentId:(id)a4 deploymentId:(id)a5 createIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  id v8 = [(SGTrialClientWrapper *)self _modelNameForExperimentId:a3 treatmentId:a4 deploymentId:a5];
  if (v8)
  {
    v9 = [(SGTrialClientWrapper *)self _modelDirectoryPathCreateIfNeeded:v6];
    id v10 = [v9 stringByAppendingPathComponent:v8];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)modelPathForExperimentId:(id)a3 treatmentId:(id)a4 deploymentId:(id)a5
{
  return [(SGTrialClientWrapper *)self _modelPathForExperimentId:a3 treatmentId:a4 deploymentId:a5 createIfNeeded:0];
}

- (id)modelPathForTriClient:(id)a3 andNamespace:(id)a4
{
  v5 = [a3 experimentIdentifiersWithNamespaceName:a4];
  BOOL v6 = v5;
  if (v5)
  {
    if ([v5 deploymentId] == -1)
    {
      v7 = 0;
    }
    else
    {
      v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "deploymentId"));
    }
    v9 = [v6 experimentId];
    id v10 = [v6 treatmentId];
    id v8 = [(SGTrialClientWrapper *)self _modelPathForExperimentId:v9 treatmentId:v10 deploymentId:v7 createIfNeeded:1];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)modelPathForCurrentEnrollment
{
  v3 = [(SGTrialClientWrapper *)self _modelNameForCurrentEnrollment];
  if (v3)
  {
    v4 = [(SGTrialClientWrapper *)self _modelDirectoryPathCreateIfNeeded:0];
    v5 = [v4 stringByAppendingPathComponent:v3];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)modelPath
{
  v2 = [(SGTrialClientWrapper *)self modelPathForCurrentEnrollment];
  if (v2
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 fileExistsAtPath:v2],
        v3,
        v4))
  {
    id v5 = v2;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)cleanExperimentModelsFromTrialModelsFolder
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v20 = +[SGPaths suggestionsSubdirectory:@"TrialModels" creatingDirectoriesIfNeeded:0];
  v21 = v3;
  int v4 = objc_msgSend(v3, "enumeratorAtPath:");
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    v7 = (void *)v5;
    *(void *)&long long v6 = 138412290;
    long long v19 = v6;
    while (1)
    {
      id v8 = objc_msgSend(v7, "pathExtension", v19);
      if (![v8 isEqualToString:@"mlmodelc"]) {
        goto LABEL_10;
      }
      v9 = [v7 pathComponents];
      id v10 = [v9 lastObject];
      id v11 = [v10 stringByDeletingPathExtension];
      id v12 = [(SGTrialClientWrapper *)self baseModelName];
      int v13 = [v11 containsString:v12];

      if (v13) {
        break;
      }
LABEL_11:
      uint64_t v18 = [v4 nextObject];

      v7 = (void *)v18;
      if (!v18) {
        goto LABEL_12;
      }
    }
    v14 = [v20 stringByAppendingPathComponent:v7];
    id v22 = 0;
    int v15 = [v21 removeItemAtPath:v14 error:&v22];
    id v16 = v22;

    if (!v15 || (id v8 = 0, v16))
    {
      v17 = sgLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v19;
        v24 = v7;
        _os_log_error_impl(&dword_1CA650000, v17, OS_LOG_TYPE_ERROR, "SGReminderTrialClientWrapper: Couldn't delete model override file: %@", buf, 0xCu);
      }

      id v8 = v16;
    }
LABEL_10:

    goto LABEL_11;
  }
LABEL_12:
}

- (BOOL)_unarchiveFrom:(id)a3 to:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v5];
  id v8 = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v6];
  v9 = (void *)MEMORY[0x1CB79B230]();
  id v16 = 0;
  id v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7 options:1 error:&v16];
  id v11 = v16;
  if (v10)
  {
    id v12 = v10;
    char v13 = SGUnarchiverZip((const void *)[v12 bytes], objc_msgSend(v12, "length"), v8);
  }
  else
  {
    v14 = sgLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v7;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_error_impl(&dword_1CA650000, v14, OS_LOG_TYPE_ERROR, "Unable to the source data from file URL: %@. (Error: %@)", buf, 0x16u);
    }

    char v13 = 0;
  }

  return v13;
}

- (BOOL)_uncompressModelAtPath:(id)a3 toPath:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [v8 fileExistsAtPath:v6];

  if (v9)
  {
    id v10 = [(SGTrialClientWrapper *)self modelPathForCurrentEnrollment];
    if (v10
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          id v11 = objc_claimAutoreleasedReturnValue(),
          char v12 = [v11 fileExistsAtPath:v10],
          v11,
          (v12 & 1) == 0))
    {
      [(SGTrialClientWrapper *)self cleanExperimentModelsFromTrialModelsFolder];
      id v16 = sgRemindersLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_debug_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: Unzipping model override at path: %@", buf, 0xCu);
      }

      v17 = [(SGTrialClientWrapper *)self _modelDirectoryPathCreateIfNeeded:1];
      BOOL v18 = [(SGTrialClientWrapper *)self _unarchiveFrom:v6 to:v17];

      if (v18)
      {
        __int16 v19 = [(SGTrialClientWrapper *)self _modelDirectoryPathCreateIfNeeded:0];
        id v20 = [(SGTrialClientWrapper *)self baseModelName];
        uint64_t v21 = [v19 stringByAppendingPathComponent:v20];
        char v13 = [v21 stringByAppendingPathExtension:@"mlmodelc"];

        if (v13)
        {
          id v22 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v25 = 0;
          [v22 moveItemAtPath:v13 toPath:v7 error:&v25];
          v23 = v25;

          if (v23)
          {
            v24 = sgRemindersLogHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v27 = v10;
              __int16 v28 = 2112;
              v29 = v23;
              _os_log_debug_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: Cannot move model to %@. Error %@", buf, 0x16u);
            }
            char v14 = 0;
          }
          else
          {
            v24 = [MEMORY[0x1E4F28CB8] defaultManager];
            char v14 = [v24 fileExistsAtPath:v7];
          }
        }
        else
        {
          v23 = sgRemindersLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEFAULT, "SGReminderTrialClientWrapper: unable to fetch origin path.", buf, 2u);
          }
          char v14 = 0;
        }

        goto LABEL_7;
      }
      char v13 = sgRemindersLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "SGReminderTrialClientWrapper: Error while unzipping the model override.", buf, 2u);
      }
    }
    else
    {
      char v13 = sgRemindersLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_debug_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: Model override is already in uncompressed at path: %@", buf, 0xCu);
      }
    }
    char v14 = 0;
LABEL_7:

    goto LABEL_11;
  }
  id v10 = sgRemindersLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: No file found at source path: %@", buf, 0xCu);
  }
  char v14 = 0;
LABEL_11:

  return v14;
}

- (void)uncompressModelAndUpdateFactors:(id)a3 destinationPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SGTrialClientWrapper_uncompressModelAndUpdateFactors_destinationPath___block_invoke;
  block[3] = &unk_1E65C0688;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

uint64_t __72__SGTrialClientWrapper_uncompressModelAndUpdateFactors_destinationPath___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _uncompressModelAtPath:*(void *)(a1 + 40) toPath:*(void *)(a1 + 48)];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) refresh];
    v3 = *(void **)(a1 + 32);
    return [v3 updateFactors];
  }
  return result;
}

- (id)baseModelName
{
  return &stru_1F24EEF20;
}

- (id)rolloutIdentifiers
{
  return self->_rolloutIdentifiers;
}

- (id)deploymentId
{
  if (self->_deploymentId == -1)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_msgSend(NSNumber, "numberWithInt:");
  }
  return v2;
}

- (id)experimentId
{
  return self->_experimentId;
}

- (id)treatmentId
{
  return self->_treatmentId;
}

- (BOOL)refreshRolloutIdentifiersForNamespace:(id)a3
{
  int v4 = [(TRIClient *)self->_triClient rolloutIdentifiersWithNamespaceName:a3];
  if (v4)
  {
    objc_storeStrong((id *)&self->_rolloutIdentifiers, v4);
  }
  else
  {
    id v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "SGTrialClientWrapper: Unable to fetch rolloutIdentifiers", v7, 2u);
    }
  }
  return v4 != 0;
}

- (BOOL)refreshEnrollmentInformationForNamespace:(id)a3
{
  int v4 = [(TRIClient *)self->_triClient experimentIdentifiersWithNamespaceName:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 experimentId];
    experimentId = self->_experimentId;
    self->_experimentId = v6;

    self->_deploymentId = [v5 deploymentId];
    id v8 = [v5 treatmentId];
    treatmentId = self->_treatmentId;
    self->_treatmentId = v8;
  }
  else
  {
    id v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_INFO, "SGTrialClientWrapper: Unable to fetch experimentId, deploymentId, treatmentId", v12, 2u);
    }
  }
  return v5 != 0;
}

- (SGTrialClientWrapper)initWithClientIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v16.receiver = self;
  v16.super_class = (Class)SGTrialClientWrapper;
  int v4 = [(SGTrialClientWrapper *)&v16 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4FB0098] clientWithIdentifier:v3];
    triClient = v4->_triClient;
    v4->_triClient = (TRIClient *)v5;

    id v7 = [NSString alloc];
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = (void *)[v7 initWithFormat:@"com.apple.suggestd.%@.serialQueue", v9];

    id v11 = (void *)MEMORY[0x1E4F93B18];
    id v12 = v10;
    uint64_t v13 = objc_msgSend(v11, "autoreleasingSerialQueueWithLabel:qosClass:", objc_msgSend(v12, "UTF8String"), 9);
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v13;
  }
  return v4;
}

@end