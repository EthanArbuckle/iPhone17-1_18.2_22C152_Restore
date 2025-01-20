@interface MLModelCollection
+ (Class)getTrialClientClass;
+ (Class)getTrialDownloadOptionsClass;
+ (Class)getTrialExperimentIdentifiersClass;
+ (Class)getTrialFactorClass;
+ (Class)getTrialFactorLevelClass;
+ (Class)getTrialFileClass;
+ (Class)getTrialLevelClass;
+ (NSProgress)beginAccessingModelCollectionWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler;
+ (id)_namespaceNameFromCollectionIdentifier:(id)a3;
+ (void)endAccessingModelCollectionWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler;
- (BOOL)_downloadWithProgress:(id)a3;
- (BOOL)_endAccess;
- (BOOL)_register;
- (MLModelCollection)initWithIdentifier:(id)a3;
- (NSDictionary)entries;
- (NSString)deploymentID;
- (NSString)identifier;
- (NSString)namespaceName;
- (TRIClient)trialClient;
- (id)_downloadOptions;
- (void)_handleTrialUpdateForNamespaceName:(id)a3;
- (void)_populateEntries;
- (void)_registerForUpdates;
- (void)_setDeploymentID;
- (void)setDeploymentID:(id)a3;
- (void)setEntries:(id)a3;
@end

@implementation MLModelCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_deploymentID, 0);
  objc_storeStrong((id *)&self->_entries, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (void)setDeploymentID:(id)a3
{
}

- (NSString)deploymentID
{
  return self->_deploymentID;
}

- (void)setEntries:(id)a3
{
}

- (NSDictionary)entries
{
  return self->_entries;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)_populateEntries
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  obj = v2;
  v3 = [(MLModelCollection *)v2 trialClient];
  [v3 refresh];

  v4 = [(MLModelCollection *)v2 trialClient];
  v5 = [(MLModelCollection *)v2 namespaceName];
  v6 = [v4 factorLevelsWithNamespaceName:v5];

  v29 = v6;
  if (v6)
  {
    v7 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v13 = [v12 factor];
          v14 = [v13 name];

          v15 = [v12 level];
          v16 = [v15 directoryValue];
          v17 = [v16 path];

          if (v14 && v17)
          {
            v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17];
            v19 = +[MLModelCollectionEntry entryWithModelIdentifier:v14 modelURL:v18];

            [v7 setObject:v19 forKeyedSubscript:v14];
          }
          else
          {
            v19 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v20 = (objc_class *)objc_opt_class();
              v21 = NSStringFromClass(v20);
              *(_DWORD *)buf = 138412546;
              v36 = v21;
              __int16 v37 = 2112;
              uint64_t v38 = (uint64_t)v12;
              _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "%@: missing factorLevel information: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v9);
    }

    [(MLModelCollection *)obj setEntries:v7];
    v22 = v29;
  }
  else
  {
    [(MLModelCollection *)obj setEntries:MEMORY[0x1E4F1CC08]];
    v22 = 0;
  }
  BOOL v23 = v22 == 0;

  objc_sync_exit(obj);
  if (!v23)
  {
    v24 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      v27 = [(MLModelCollection *)obj entries];
      uint64_t v28 = [v27 count];
      *(_DWORD *)buf = 138412546;
      v36 = v26;
      __int16 v37 = 2048;
      uint64_t v38 = v28;
      _os_log_debug_impl(&dword_19E58B000, v24, OS_LOG_TYPE_DEBUG, "%@: set %lu model entries", buf, 0x16u);
    }
  }
}

- (void)_setDeploymentID
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(MLModelCollection *)self trialClient];
  v4 = [(MLModelCollection *)self namespaceName];
  v5 = [v3 experimentIdentifiersWithNamespaceName:v4];

  v6 = [v5 experimentId];
  if (v6)
  {
    [(MLModelCollection *)self setDeploymentID:v6];
    v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      v11 = [(MLModelCollection *)self deploymentID];
      int v14 = 138412546;
      v15 = v10;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_debug_impl(&dword_19E58B000, v7, OS_LOG_TYPE_DEBUG, "%@: set deployment id: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    id v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      int v14 = 138412290;
      v15 = v13;
      _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "%@: experimentId unexpectedly not returned", (uint8_t *)&v14, 0xCu);
    }
    [(MLModelCollection *)self setDeploymentID:0];
  }
}

- (void)_handleTrialUpdateForNamespaceName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v15 = 138412546;
    __int16 v16 = v7;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_19E58B000, v5, OS_LOG_TYPE_INFO, "%@: namespace (%@) updated", (uint8_t *)&v15, 0x16u);
  }
  id v8 = [(MLModelCollection *)self namespaceName];
  char v9 = [v4 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [MLModelCollection alloc];
    v11 = [(MLModelCollection *)self identifier];
    v12 = [(MLModelCollection *)v10 initWithIdentifier:v11];

    [v12 _populateEntries];
    [v12 _setDeploymentID];
    [v12 _registerForUpdates];
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"MLModelCollectionDidChangeNotification" object:v12];
  }
  else
  {
    v12 = +[MLLogging coreChannel];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    int v15 = 138412546;
    __int16 v16 = v13;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "%@: unexpected update notification for namespace (%@)", (uint8_t *)&v15, 0x16u);
  }

LABEL_7:
}

- (BOOL)_endAccess
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(MLModelCollection *)self trialClient];
  id v4 = [(MLModelCollection *)self namespaceName];
  id v12 = 0;
  char v5 = [v3 deregisterNamespaceName:v4 error:&v12];
  id v6 = v12;

  if ((v5 & 1) == 0)
  {
    v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      char v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      v11 = [(MLModelCollection *)self namespaceName];
      *(_DWORD *)buf = 138412802;
      int v14 = v10;
      __int16 v15 = 2112;
      __int16 v16 = v11;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "%@: failed to deregister namespace (%@). %@", buf, 0x20u);
    }
  }

  return v5;
}

- (void)_registerForUpdates
{
  objc_initWeak(&location, self);
  v3 = [(MLModelCollection *)self trialClient];
  id v4 = [(MLModelCollection *)self namespaceName];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__MLModelCollection__registerForUpdates__block_invoke;
  v6[3] = &unk_1E59A3A30;
  objc_copyWeak(&v7, &location);
  id v5 = (id)[v3 addUpdateHandlerForNamespaceName:v4 usingBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __40__MLModelCollection__registerForUpdates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 namespaceName];

  [WeakRetained _handleTrialUpdateForNamespaceName:v4];
}

- (id)_downloadOptions
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = +[MLModelCollection getTrialDownloadOptionsClass];
  if (v2)
  {
    id v3 = (void *)[[v2 alloc] initWithAllowsCellular:1 discretionaryBehavior:0];
  }
  else
  {
    id v4 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v8 = 138412290;
      char v9 = v7;
      _os_log_error_impl(&dword_19E58B000, v4, OS_LOG_TYPE_ERROR, "%@: unable to initialize download options due to soft-link failure", (uint8_t *)&v8, 0xCu);
    }
    id v3 = 0;
  }

  return v3;
}

- (BOOL)_downloadWithProgress:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id v6 = [(MLModelCollection *)self trialClient];
  id v7 = [(MLModelCollection *)self namespaceName];
  int v8 = [(MLModelCollection *)self _downloadOptions];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __43__MLModelCollection__downloadWithProgress___block_invoke;
  v17[3] = &unk_1E59A3A08;
  v17[4] = self;
  uint64_t v19 = &v20;
  char v9 = v5;
  id v18 = v9;
  [v6 downloadNamespaceWithName:v7 options:v8 progress:v4 completion:v17];

  dispatch_time_t v10 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v16 = [(MLModelCollection *)self namespaceName];
      *(_DWORD *)buf = 138412546;
      id v25 = v15;
      __int16 v26 = 2112;
      v27 = v16;
      _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "%@: namespace (%@) download timed out.", buf, 0x16u);
    }
    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = *((unsigned char *)v21 + 24) != 0;
  }

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __43__MLModelCollection__downloadWithProgress___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    char v9 = [*(id *)(a1 + 32) namespaceName];
    int v14 = 138412802;
    id v15 = v8;
    __int16 v16 = 2112;
    __int16 v17 = v9;
    __int16 v18 = 1024;
    LODWORD(v19) = a2;
    _os_log_impl(&dword_19E58B000, v6, OS_LOG_TYPE_INFO, "%@: download completion (%@): %d", (uint8_t *)&v14, 0x1Cu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  if ((a2 & 1) == 0)
  {
    dispatch_time_t v10 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      BOOL v12 = NSStringFromClass(v11);
      v13 = [*(id *)(a1 + 32) namespaceName];
      int v14 = 138412802;
      id v15 = v12;
      __int16 v16 = 2112;
      __int16 v17 = v13;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "%@: namespace (%@) download failed. %@", (uint8_t *)&v14, 0x20u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_register
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(MLModelCollection *)self trialClient];
  id v4 = [(MLModelCollection *)self namespaceName];
  id v12 = 0;
  char v5 = [v3 registerNamespaceName:v4 compatibilityVersion:1 defaultsFileURL:0 applicationGroup:0 cloudKitContainerId:2 error:&v12];
  id v6 = v12;

  if ((v5 & 1) == 0)
  {
    id v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      char v9 = (objc_class *)objc_opt_class();
      dispatch_time_t v10 = NSStringFromClass(v9);
      v11 = [(MLModelCollection *)self namespaceName];
      *(_DWORD *)buf = 138412802;
      int v14 = v10;
      __int16 v15 = 2112;
      __int16 v16 = v11;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "%@: namespace (%@) registration failed. %@", buf, 0x20u);
    }
  }

  return v5;
}

- (MLModelCollection)initWithIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MLModelCollection;
  char v5 = [(MLModelCollection *)&v18 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 copy];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = +[MLModelCollection _namespaceNameFromCollectionIdentifier:v4];
  namespaceName = v5->_namespaceName;
  v5->_namespaceName = (NSString *)v8;

  dispatch_time_t v10 = +[MLModelCollection getTrialClientClass];
  if (v10)
  {
    uint64_t v11 = [(objc_class *)v10 clientWithIdentifier:211];
    trialClient = v5->_trialClient;
    v5->_trialClient = (TRIClient *)v11;

LABEL_4:
    v13 = v5;
    goto LABEL_8;
  }
  int v14 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __int16 v16 = (objc_class *)objc_opt_class();
    __int16 v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v17;
    _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "%@: unable to initialize client due to soft-link failure", buf, 0xCu);
  }
  v13 = 0;
LABEL_8:

  return v13;
}

+ (id)_namespaceNameFromCollectionIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v12 = 0;
  id v4 = +[MLCloudDeploymentUtils extractTeamIdentifierAndReturnError:&v12];
  id v5 = v12;
  if (v4)
  {
    id v6 = [NSString stringWithFormat:@"%@.%@", v4, v3];
  }
  else
  {
    id v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      dispatch_time_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138412546;
      int v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "%@: unable to extract team identifier for the client. error:%@", buf, 0x16u);
    }
    id v6 = v3;
  }
  uint64_t v8 = v6;

  return v8;
}

+ (Class)getTrialFactorClass
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getTRIFactorClass_softClass;
  uint64_t v9 = getTRIFactorClass_softClass;
  if (!getTRIFactorClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getTRIFactorClass_block_invoke;
    v5[3] = &unk_1E59A51A0;
    v5[4] = &v6;
    __getTRIFactorClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (Class)v3;
}

+ (Class)getTrialFileClass
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getTRIFileClass_softClass;
  uint64_t v9 = getTRIFileClass_softClass;
  if (!getTRIFileClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getTRIFileClass_block_invoke;
    v5[3] = &unk_1E59A51A0;
    v5[4] = &v6;
    __getTRIFileClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (Class)v3;
}

+ (Class)getTrialLevelClass
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getTRILevelClass_softClass;
  uint64_t v9 = getTRILevelClass_softClass;
  if (!getTRILevelClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getTRILevelClass_block_invoke;
    v5[3] = &unk_1E59A51A0;
    v5[4] = &v6;
    __getTRILevelClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (Class)v3;
}

+ (Class)getTrialFactorLevelClass
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getTRIFactorLevelClass_softClass;
  uint64_t v9 = getTRIFactorLevelClass_softClass;
  if (!getTRIFactorLevelClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getTRIFactorLevelClass_block_invoke;
    v5[3] = &unk_1E59A51A0;
    v5[4] = &v6;
    __getTRIFactorLevelClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (Class)v3;
}

+ (Class)getTrialDownloadOptionsClass
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getTRIDownloadOptionsClass_softClass;
  uint64_t v9 = getTRIDownloadOptionsClass_softClass;
  if (!getTRIDownloadOptionsClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getTRIDownloadOptionsClass_block_invoke;
    v5[3] = &unk_1E59A51A0;
    v5[4] = &v6;
    __getTRIDownloadOptionsClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (Class)v3;
}

+ (Class)getTrialExperimentIdentifiersClass
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getTRIExperimentIdentifiersClass_softClass;
  uint64_t v9 = getTRIExperimentIdentifiersClass_softClass;
  if (!getTRIExperimentIdentifiersClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getTRIExperimentIdentifiersClass_block_invoke;
    v5[3] = &unk_1E59A51A0;
    v5[4] = &v6;
    __getTRIExperimentIdentifiersClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (Class)v3;
}

+ (Class)getTrialClientClass
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getTRIClientClass_softClass;
  uint64_t v9 = getTRIClientClass_softClass;
  if (!getTRIClientClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getTRIClientClass_block_invoke;
    v5[3] = &unk_1E59A51A0;
    v5[4] = &v6;
    __getTRIClientClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);

  return (Class)v3;
}

+ (void)endAccessingModelCollectionWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  id v5 = identifier;
  uint64_t v6 = completionHandler;
  id v7 = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__MLModelCollection_endAccessingModelCollectionWithIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E59A4EC8;
  uint64_t v11 = v5;
  id v12 = v6;
  id v8 = v6;
  uint64_t v9 = v5;
  dispatch_async(v7, v10);
}

void __81__MLModelCollection_endAccessingModelCollectionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    v2 = [[MLModelCollection alloc] initWithIdentifier:*(void *)(a1 + 32)];
    id v7 = v2;
    if (v2)
    {
      if ([(MLModelCollection *)v2 _endAccess])
      {
        id v3 = 0;
      }
      else
      {
        uint64_t v6 = [v7 identifier];
        id v3 = +[MLModelErrorUtils errorWithCode:10, @"An error occurred ending access for model collection with identifier '%@': internal error", v6 format];
      }
      id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      id v4 = [0 identifier];
      id v3 = +[MLModelErrorUtils errorWithCode:10, @"Failed to end access for model collection with identifier '%@': internal error", v4 format];

      id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v5();
  }
  else
  {
    id v7 = +[MLModelErrorUtils errorWithCode:10, @"Failed to end access for model collection with identifier '%@': invalid identifier", *(void *)(a1 + 32) format];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (NSProgress)beginAccessingModelCollectionWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  id v5 = identifier;
  uint64_t v6 = completionHandler;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__1049;
  uint64_t v20 = __Block_byref_object_dispose__1050;
  id v21 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  [(id)v17[5] setCancellable:0];
  [(id)v17[5] setPausable:0];
  id v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__MLModelCollection_beginAccessingModelCollectionWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E59A39E0;
  id v14 = v6;
  __int16 v15 = &v16;
  v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);

  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return (NSProgress *)v10;
}

void __83__MLModelCollection_beginAccessingModelCollectionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  id v3 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  id v4 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addChild:v2 withPendingUnitCount:5];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addChild:v3 withPendingUnitCount:90];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addChild:v4 withPendingUnitCount:5];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__MLModelCollection_beginAccessingModelCollectionWithIdentifier_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E59A3990;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v12;
  long long v16 = v12;
  uint64_t v6 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  if ([*(id *)(a1 + 32) length])
  {
    id v7 = [[MLModelCollection alloc] initWithIdentifier:*(void *)(a1 + 32)];
    id v8 = v7;
    if (v7)
    {
      if ([(MLModelCollection *)v7 _register])
      {
        [v2 setCompletedUnitCount:1];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __83__MLModelCollection_beginAccessingModelCollectionWithIdentifier_completionHandler___block_invoke_3;
        v13[3] = &unk_1E59A39B8;
        id v9 = v3;
        id v14 = v9;
        if ([(MLModelCollection *)v8 _downloadWithProgress:v13])
        {
          [v9 setCompletedUnitCount:100];
          [(MLModelCollection *)v8 _populateEntries];
          [(MLModelCollection *)v8 _setDeploymentID];
          [(MLModelCollection *)v8 _registerForUpdates];
          [v4 setCompletedUnitCount:1];
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
        else
        {
          uint64_t v11 = [(MLModelCollection *)v8 identifier];
          v6[2](v6, @"Failed to begin access for model collection with identifier '%@': download failed");
        }
        id v10 = v14;
      }
      else
      {
        id v10 = [(MLModelCollection *)v8 identifier];
        v6[2](v6, @"Failed to begin access for model collection with identifier '%@': internal registration failed");
      }
    }
    else
    {
      id v10 = [0 identifier];
      v6[2](v6, @"Failed to begin access for model collection with identifier '%@': internal error");
    }
  }
  else
  {
    v6[2](v6, @"Failed to begin access for model collection with identifier '%@': invalid identifier");
  }
}

void __83__MLModelCollection_beginAccessingModelCollectionWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCompletedUnitCount:0];
  id v10 = +[MLModelErrorUtils errorWithCode:10 underlyingError:0 format:@"Failed to begin access for model collection with identifier '%@': invalid identifier" args:&a9];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__MLModelCollection_beginAccessingModelCollectionWithIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setCompletedUnitCount:a2];
}

@end