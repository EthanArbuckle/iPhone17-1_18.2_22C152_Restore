@interface ATXTrialClientWrapper
- (ATXTrialClientWrapper)initWithClientIdentifier:(int)a3 namespaceName:(id)a4;
- (BOOL)refreshEnrollmentInformation;
- (BOOL)refreshRolloutIdentifiers;
- (NSString)trialExperimentId;
- (NSString)trialNamespaceName;
- (NSString)trialTreatmentId;
- (TRIClient)trialClient;
- (TRIRolloutIdentifiers)trialRolloutIdentifiers;
- (id)BOOLForFactor:(id)a3;
- (id)dictionaryForTrialResource:(id)a3;
- (id)directoryPathForTrialResource:(id)a3;
- (id)filePathForTrialResource:(id)a3;
- (id)longForFactor:(id)a3;
- (id)stringForFactor:(id)a3;
- (int)trialDeploymentId;
- (void)updateFactors;
@end

@implementation ATXTrialClientWrapper

- (ATXTrialClientWrapper)initWithClientIdentifier:(int)a3 namespaceName:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ATXTrialClientWrapper;
  v8 = [(ATXTrialClientWrapper *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4FB0098] clientWithIdentifier:v5];
    trialClient = v8->_trialClient;
    v8->_trialClient = (TRIClient *)v9;

    objc_storeStrong((id *)&v8->_trialNamespaceName, a4);
    objc_initWeak(&location, v8);
    v11 = v8->_trialClient;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__ATXTrialClientWrapper_initWithClientIdentifier_namespaceName___block_invoke;
    v15[3] = &unk_1E5D0A458;
    objc_copyWeak(&v16, &location);
    uint64_t v12 = [(TRIClient *)v11 addUpdateHandlerForNamespaceName:v7 usingBlock:v15];
    token = v8->_token;
    v8->_token = (TRINotificationToken *)v12;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __64__ATXTrialClientWrapper_initWithClientIdentifier_namespaceName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateFactors];
    id WeakRetained = v2;
  }
}

- (BOOL)refreshEnrollmentInformation
{
  [(TRIClient *)self->_trialClient refresh];
  v3 = [(TRIClient *)self->_trialClient experimentIdentifiersWithNamespaceName:self->_trialNamespaceName];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 experimentId];
    trialExperimentId = self->_trialExperimentId;
    self->_trialExperimentId = v5;

    self->_trialDeploymentId = [v4 deploymentId];
    id v7 = [v4 treatmentId];
    trialTreatmentId = self->_trialTreatmentId;
    self->_trialTreatmentId = v7;
  }
  else
  {
    uint64_t v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_INFO, "ATXTrialClientWrapper: Unable to fetch experimentId, deploymentId, treatmentId", v11, 2u);
    }
  }
  return v4 != 0;
}

- (BOOL)refreshRolloutIdentifiers
{
  v3 = [(TRIClient *)self->_trialClient rolloutIdentifiersWithNamespaceName:self->_trialNamespaceName];
  if (v3)
  {
    objc_storeStrong((id *)&self->_trialRolloutIdentifiers, v3);
  }
  else
  {
    v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_INFO, "ATXTrialClientWrapper: Unable to fetch rolloutIdentifiers", v6, 2u);
    }
  }
  return v3 != 0;
}

- (void)updateFactors
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  v8 = v4;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1A790D000, a3, OS_LOG_TYPE_ERROR, "ATXTrialClientWrapper: Method %@ not overriden in %@", (uint8_t *)&v7, 0x16u);
}

- (id)dictionaryForTrialResource:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ATXTrialClientWrapper *)self filePathForTrialResource:v4];
  if (v5)
  {
    id v17 = 0;
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5 options:1 error:&v17];
    id v7 = v17;
    if (v6)
    {
      if ((unint64_t)[v6 length] >= 3
        && ((v8 = v6, uint64_t v9 = [v8 bytes], *(_WORD *)v9 == 19536)
          ? (BOOL v10 = *(unsigned char *)(v9 + 2) == 80)
          : (BOOL v10 = 0),
            v10))
      {
        *(void *)buf = v7;
        uint64_t v11 = [MEMORY[0x1E4F93B50] dictionaryWithData:v8 error:buf];
      }
      else
      {
        *(void *)buf = 0;
        uint64_t v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:buf];
      }
      uint64_t v12 = (void *)v11;
      id v13 = *(id *)buf;

      if (v12) {
        goto LABEL_19;
      }
      v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(ATXTrialClientWrapper *)(uint64_t)v5 dictionaryForTrialResource:v14];
      }
      id v7 = v13;
    }
    else
    {
      v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v5;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_INFO, "ATXTrialClientWrapper: Error loading plist %@: %@", buf, 0x16u);
      }
    }

    uint64_t v12 = 0;
    id v13 = v7;
LABEL_19:

    goto LABEL_20;
  }
  v15 = __atxlog_handle_default();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v4;
    _os_log_impl(&dword_1A790D000, v15, OS_LOG_TYPE_INFO, "ATXTrialClientWrapper: Could not get file path for resource: %@", buf, 0xCu);
  }

  uint64_t v12 = 0;
LABEL_20:

  return v12;
}

- (id)filePathForTrialResource:(id)a3
{
  v3 = [(TRIClient *)self->_trialClient levelForFactor:a3 withNamespaceName:self->_trialNamespaceName];
  id v4 = [v3 fileValue];
  uint64_t v5 = [v4 path];

  return v5;
}

- (id)directoryPathForTrialResource:(id)a3
{
  v3 = [(TRIClient *)self->_trialClient levelForFactor:a3 withNamespaceName:self->_trialNamespaceName];
  id v4 = [v3 directoryValue];
  uint64_t v5 = [v4 path];

  return v5;
}

- (id)BOOLForFactor:(id)a3
{
  v3 = [(TRIClient *)self->_trialClient levelForFactor:a3 withNamespaceName:self->_trialNamespaceName];
  if (v3) {
    id v4 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v3, "BOOLeanValue"));
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)longForFactor:(id)a3
{
  v3 = [(TRIClient *)self->_trialClient levelForFactor:a3 withNamespaceName:self->_trialNamespaceName];
  if (v3) {
    id v4 = objc_msgSend(objc_alloc(NSNumber), "initWithLong:", objc_msgSend(v3, "longValue"));
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)stringForFactor:(id)a3
{
  v3 = [(TRIClient *)self->_trialClient levelForFactor:a3 withNamespaceName:self->_trialNamespaceName];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 stringValue];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (NSString)trialNamespaceName
{
  return self->_trialNamespaceName;
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (int)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (TRIRolloutIdentifiers)trialRolloutIdentifiers
{
  return self->_trialRolloutIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialRolloutIdentifiers, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialNamespaceName, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

- (void)dictionaryForTrialResource:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXTrialClientWrapper: Error parsing plist %@: %@", (uint8_t *)&v3, 0x16u);
}

@end