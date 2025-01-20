@interface CPLBatchExtractionStrategy
+ (id)minglingStrategyWithStorage:(id)a3 coveringScopeIdentifier:(id)a4 maximumBatchSize:(unint64_t)a5;
+ (id)overQuotaStrategyWithStorage:(id)a3 coveringScopeIdentifier:(id)a4;
+ (id)usualStrategyWithStorage:(id)a3 coveringScopeIdentifier:(id)a4;
+ (unint64_t)maximumAlbumsPerBatch;
+ (unint64_t)maximumRecordCountPerBatch;
+ (unint64_t)minimumRecordCountPerBatch;
+ (void)setMaximumAlbumsPerBatch:(unint64_t)a3;
+ (void)setMaximumRecordCountPerBatch:(unint64_t)a3;
- (BOOL)_hasChanges;
- (BOOL)extractBatch:(id *)a3 maximumResourceSize:(unint64_t)a4 error:(id *)a5;
- (CPLBatchExtractionStrategy)initWithName:(id)a3 storage:(id)a4 scopeIdentifier:(id)a5 steps:(id)a6;
- (CPLBatchExtractionStrategyStorage)storage;
- (NSString)currentStepDescription;
- (NSString)name;
- (NSString)scopeIdentifier;
- (NSString)stepsDescription;
- (NSString)strategyName;
- (id)cplFullDescription;
- (id)description;
- (unint64_t)maximumRecordCountPerBatch;
- (void)_computeNextStep;
- (void)reset;
- (void)resetConditionallyFromNewIncomingChange:(id)a3;
- (void)setMaximumRecordCountPerBatch:(unint64_t)a3;
@end

@implementation CPLBatchExtractionStrategy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_destroyWeak((id *)&self->_storage);
  objc_storeStrong((id *)&self->_strategyName, 0);
  objc_storeStrong((id *)&self->_currentStep, 0);
  objc_storeStrong((id *)&self->_stepEnumerator, 0);
  objc_storeStrong((id *)&self->_steps, 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setMaximumRecordCountPerBatch:(unint64_t)a3
{
  self->_maximumRecordCountPerBatch = a3;
}

- (unint64_t)maximumRecordCountPerBatch
{
  return self->_maximumRecordCountPerBatch;
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (CPLBatchExtractionStrategyStorage)storage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
  return (CPLBatchExtractionStrategyStorage *)WeakRetained;
}

- (NSString)strategyName
{
  return self->_strategyName;
}

- (id)cplFullDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(CPLBatchExtractionStrategy *)self name];
  v6 = [(CPLBatchExtractionStrategy *)self stepsDescription];
  v7 = (void *)[v3 initWithFormat:@"<%@ %@ %@>", v4, v5, v6];

  return v7;
}

- (NSString)stepsDescription
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_steps, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_steps;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "shortDescription", (void)v12);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = [v3 componentsJoinedByString:@">"];

  return (NSString *)v10;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CPLBatchExtractionStrategy *)self name];
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@ %@>", v4, v5];

  return v6;
}

- (NSString)currentStepDescription
{
  currentStep = self->_currentStep;
  if (currentStep)
  {
    uint64_t v4 = [(CPLBatchExtractionStep *)currentStep shortDescription];
  }
  else if (self->_finished)
  {
    uint64_t v4 = @"end";
  }
  else
  {
    uint64_t v4 = @"start";
  }
  return (NSString *)v4;
}

- (void)resetConditionallyFromNewIncomingChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_finished)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = __CPLStrategyOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 138412290;
        id v15 = v4;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Resetting finished strategy because of %@", (uint8_t *)&v14, 0xCu);
      }
    }
    [(CPLBatchExtractionStrategy *)self reset];
  }
  else
  {
    p_currentStep = (id *)&self->_currentStep;
    if (self->_currentStep)
    {
      uint64_t v7 = [(NSArray *)self->_steps objectEnumerator];
      id v8 = 0;
      while (1)
      {
        v9 = v8;
        id v8 = [v7 nextObject];

        if (!v8 || v8 == *p_currentStep) {
          break;
        }
        if ([v8 shouldResetFromThisStepWithIncomingChange:v4])
        {
          [*p_currentStep reset];
          objc_storeStrong((id *)&self->_currentStep, v8);
          [*p_currentStep reset];
          if (!_CPLSilentLogging)
          {
            v10 = __CPLStrategyOSLogDomain();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              v11 = [*p_currentStep shortDescription];
              int v14 = 138412546;
              id v15 = v11;
              __int16 v16 = 2112;
              id v17 = v4;
              _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Resetting strategy to %@ because of %@", (uint8_t *)&v14, 0x16u);
            }
          }
          objc_storeStrong((id *)&self->_stepEnumerator, v7);
          goto LABEL_22;
        }
      }
      if (!_CPLSilentLogging)
      {
        long long v12 = __CPLStrategyOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          long long v13 = [*p_currentStep shortDescription];
          int v14 = 138412546;
          id v15 = v13;
          __int16 v16 = 2112;
          id v17 = v4;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEBUG, "Resetting %@ conditionnally because of %@", (uint8_t *)&v14, 0x16u);
        }
      }
      [*p_currentStep resetConditionallyFromNewIncomingChange:v4];
LABEL_22:
    }
  }
}

- (void)reset
{
  currentStep = self->_currentStep;
  if (currentStep)
  {
    [(CPLBatchExtractionStep *)currentStep reset];
    id v4 = self->_currentStep;
  }
  else
  {
    id v4 = 0;
  }
  self->_currentStep = 0;

  stepEnumerator = self->_stepEnumerator;
  self->_stepEnumerator = 0;

  *(_WORD *)&self->_loggedForThisStep = 0;
}

- (BOOL)extractBatch:(id *)a3 maximumResourceSize:(unint64_t)a4 error:(id *)a5
{
  uint64_t v5 = self;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    if (!_CPLSilentLogging)
    {
      v34 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v34, OS_LOG_TYPE_ERROR, "can't extract batches with no size", buf, 2u);
      }
    }
    v35 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStrategy.m"];
    [v35 handleFailureInMethod:a2 object:v5 file:v36 lineNumber:274 description:@"can't extract batches with no size"];

    abort();
  }
  if (self->_finished) {
    return 1;
  }
  unint64_t v8 = a4;
  if (!self->_currentStep)
  {
    if (![(CPLBatchExtractionStrategy *)self _hasChanges])
    {
      if (!_CPLSilentLogging)
      {
        v30 = __CPLStrategyOSLogDomain();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4CAC000, v30, OS_LOG_TYPE_DEBUG, "No changes to extract, finishing immediately", buf, 2u);
        }
      }
      BOOL v6 = 1;
      v5->_finished = 1;
      return v6;
    }
    if (!v5->_currentStep) {
      [(CPLBatchExtractionStrategy *)v5 _computeNextStep];
    }
  }
  v38 = a3;
  *a3 = 0;
  p_storage = (id *)&v5->_storage;
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_storage);
  [WeakRetained beginExtractingBatch];

  long long v12 = objc_alloc_init(CPLExtractedBatch);
  long long v13 = [(CPLExtractedBatch *)v12 batch];
  uint64_t maximumRecordCountPerBatch = v5->_maximumRecordCountPerBatch;
  if (!maximumRecordCountPerBatch) {
    uint64_t maximumRecordCountPerBatch = _CPLMaximumBatchSize;
  }
  unint64_t v40 = maximumRecordCountPerBatch;
  if (v5->_currentStep)
  {
    *(void *)&long long v14 = 138543362;
    long long v37 = v14;
    v39 = v5;
    while (1)
    {
      unint64_t v16 = objc_msgSend(v13, "count", v37);
      id v17 = objc_loadWeakRetained(p_storage);
      unint64_t v18 = [(CPLExtractedBatch *)v12 effectiveResourceSizeToUploadUsingStorage:v17];

      if (v40 <= v16 || (unint64_t v19 = v8 - v18, v8 <= v18))
      {
        [(CPLExtractedBatch *)v12 setFull:1];
        goto LABEL_39;
      }
      if (!_CPLSilentLogging)
      {
        v20 = __CPLStrategyOSLogDomain();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          [(CPLBatchExtractionStep *)v5->_currentStep shortDescription];
          v21 = v12;
          unint64_t v22 = v8;
          v23 = v13;
          v24 = a5;
          v26 = v25 = p_storage;
          *(_DWORD *)buf = 138412290;
          v42 = v26;
          _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_DEBUG, "Will extract changes to batch with %@", buf, 0xCu);

          p_storage = v25;
          a5 = v24;
          long long v13 = v23;
          unint64_t v8 = v22;
          long long v12 = v21;
          uint64_t v5 = v39;
        }
      }
      if (![(CPLBatchExtractionStep *)v5->_currentStep extractToBatch:v12 maximumCount:v40 - v16 maximumResourceSize:v19 error:a5])break; {
      if (!v5->_loggedForThisStep && [v13 count] > v16)
      }
      {
        v5->_loggedForThisStep = 1;
        if (!_CPLSilentLogging)
        {
          v27 = __CPLStrategyOSLogDomain();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [(CPLBatchExtractionStep *)v5->_currentStep shortDescription];
            *(_DWORD *)buf = v37;
            v42 = v28;
            _os_log_impl(&dword_1B4CAC000, v27, OS_LOG_TYPE_DEFAULT, "Extracting batches with %{public}@", buf, 0xCu);
          }
        }
      }
      if (![(CPLExtractedBatch *)v12 isFull])
      {
        [(CPLBatchExtractionStrategy *)v5 _computeNextStep];
        if (v5->_currentStep) {
          continue;
        }
        if (!_CPLSilentLogging)
        {
          v29 = __CPLStrategyOSLogDomain();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B4CAC000, v29, OS_LOG_TYPE_DEFAULT, "Done extracting batches", buf, 2u);
          }
        }
        [(CPLBatchExtractionStrategy *)v5 reset];
        v5->_finished = 1;
        if (v5->_currentStep) {
          continue;
        }
      }
      goto LABEL_39;
    }
    BOOL v6 = 0;
  }
  else
  {
LABEL_39:
    if ([v13 count]) {
      id *v38 = v12;
    }
    BOOL v6 = 1;
  }
  id v31 = objc_loadWeakRetained(p_storage);
  [v31 cleanupAfterExtractingBatch];

  return v6;
}

- (void)_computeNextStep
{
  currentStep = self->_currentStep;
  if (currentStep) {
    [(CPLBatchExtractionStep *)currentStep reset];
  }
  if (!self->_stepEnumerator)
  {
    id v4 = [(NSArray *)self->_steps objectEnumerator];
    stepEnumerator = self->_stepEnumerator;
    self->_stepEnumerator = v4;
  }
  self->_loggedForThisStep = 0;
  if ([(CPLBatchExtractionStrategy *)self _hasChanges])
  {
    BOOL v6 = [(NSEnumerator *)self->_stepEnumerator nextObject];
    uint64_t v7 = self->_currentStep;
    self->_currentStep = v6;

    unint64_t v8 = self->_currentStep;
    if (v8)
    {
      [(CPLBatchExtractionStep *)v8 reset];
    }
  }
  else
  {
    v9 = self->_currentStep;
    self->_currentStep = 0;
  }
}

- (BOOL)_hasChanges
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
  LOBYTE(v2) = [WeakRetained hasChangesInScopeWithIdentifier:v2->_scopeIdentifier];

  return (char)v2;
}

- (CPLBatchExtractionStrategy)initWithName:(id)a3 storage:(id)a4 scopeIdentifier:(id)a5 steps:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CPLBatchExtractionStrategy;
  long long v14 = [(CPLBatchExtractionStrategy *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    strategyName = v14->_strategyName;
    v14->_strategyName = (NSString *)v15;

    objc_storeWeak((id *)&v14->_storage, v11);
    uint64_t v17 = [v12 copy];
    scopeIdentifier = v14->_scopeIdentifier;
    v14->_scopeIdentifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    steps = v14->_steps;
    v14->_steps = (NSArray *)v19;

    uint64_t v21 = [v10 copy];
    name = v14->_name;
    v14->_name = (NSString *)v21;
  }
  return v14;
}

+ (id)minglingStrategyWithStorage:(id)a3 coveringScopeIdentifier:(id)a4 maximumBatchSize:(unint64_t)a5
{
  v91[20] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v88 = objc_alloc((Class)a1);
  uint64_t v9 = objc_opt_class();
  id v10 = v7;
  id v11 = v8;
  v89 = [[CPLNewChainedRecordExtractionStep alloc] initWithStorage:v10 class:v9 classDescription:@"Person" scopeIdentifier:v11 maximumCount:-1];

  v91[0] = v89;
  uint64_t v12 = objc_opt_class();
  unint64_t v13 = +[CPLBatchExtractionStrategy maximumAlbumsPerBatch];
  id v14 = v10;
  id v15 = v11;
  v87 = [[CPLNewChainedRecordExtractionStep alloc] initWithStorage:v14 class:v12 classDescription:@"Album" scopeIdentifier:v15 maximumCount:v13];

  v91[1] = v87;
  v86 = [[CPLNewAssetExtractionStep alloc] initWithStorage:v14 scopeIdentifier:v15 maximumCount:-1];
  v91[2] = v86;
  uint64_t v16 = objc_opt_class();
  id v17 = v14;
  id v18 = v15;
  v85 = [[CPLByClassExtractionStep alloc] initWithStorage:v17 scopeIdentifier:v18 description:@"New(Master)" class:v16 maximumCount:-1 query:CPLStepNew];

  v91[3] = v85;
  uint64_t v19 = objc_opt_class();
  id v20 = v17;
  id v21 = v18;
  v84 = [[CPLByClassExtractionStep alloc] initWithStorage:v20 scopeIdentifier:v21 description:@"New(ContainerRelation)" class:v19 maximumCount:-1 query:CPLStepNew];

  v91[4] = v84;
  uint64_t v22 = objc_opt_class();
  id v23 = v20;
  id v24 = v21;
  v83 = [[CPLByClassExtractionStep alloc] initWithStorage:v23 scopeIdentifier:v24 description:@"New(FaceCrop)" class:v22 maximumCount:10 query:CPLStepNew];

  v91[5] = v83;
  uint64_t v25 = objc_opt_class();
  id v26 = v23;
  id v27 = v24;
  v82 = [[CPLByClassExtractionStep alloc] initWithStorage:v26 scopeIdentifier:v27 description:@"New(SocialGroup)" class:v25 maximumCount:5 query:CPLStepNew];

  v91[6] = v82;
  uint64_t v28 = objc_opt_class();
  id v29 = v26;
  id v30 = v27;
  v81 = [[CPLByClassExtractionStep alloc] initWithStorage:v29 scopeIdentifier:v30 description:@"Deleted(SocialGroup)" class:v28 maximumCount:-1 query:CPLStepDeleted];

  v91[7] = v81;
  uint64_t v31 = objc_opt_class();
  id v32 = v29;
  id v33 = v30;
  v80 = [[CPLByClassExtractionStep alloc] initWithStorage:v32 scopeIdentifier:v33 description:@"New(Memory)" class:v31 maximumCount:5 query:CPLStepNew];

  v91[8] = v80;
  uint64_t v34 = objc_opt_class();
  id v35 = v32;
  id v36 = v33;
  v79 = [[CPLByClassExtractionStep alloc] initWithStorage:v35 scopeIdentifier:v36 description:@"Deleted(Memory)" class:v34 maximumCount:-1 query:CPLStepDeleted];

  v91[9] = v79;
  uint64_t v37 = objc_opt_class();
  id v38 = v35;
  id v39 = v36;
  v78 = [[CPLByClassExtractionStep alloc] initWithStorage:v38 scopeIdentifier:v39 description:@"New(Suggestion)" class:v37 maximumCount:5 query:CPLStepNew];

  v91[10] = v78;
  uint64_t v40 = objc_opt_class();
  id v41 = v38;
  id v42 = v39;
  v77 = [[CPLByClassExtractionStep alloc] initWithStorage:v41 scopeIdentifier:v42 description:@"Deleted(Suggestion)" class:v40 maximumCount:-1 query:CPLStepDeleted];

  v91[11] = v77;
  uint64_t v43 = objc_opt_class();
  id v44 = v41;
  id v45 = v42;
  v76 = [[CPLByClassExtractionStep alloc] initWithStorage:v44 scopeIdentifier:v45 description:@"Deleted(FaceCrop)" class:v43 maximumCount:-1 query:CPLStepDeleted];

  v91[12] = v76;
  uint64_t v46 = objc_opt_class();
  id v47 = v44;
  id v48 = v45;
  v75 = [[CPLByClassExtractionStep alloc] initWithStorage:v47 scopeIdentifier:v48 description:@"Deleted(ContainerRelation)" class:v46 maximumCount:-1 query:CPLStepDeleted];

  v91[13] = v75;
  uint64_t v49 = objc_opt_class();
  id v50 = v47;
  id v51 = v48;
  v74 = [[CPLDeleteChainedRecordExtractionStep alloc] initWithStorage:v50 class:v49 classDescription:@"Album" scopeIdentifier:v51 maximumCount:-1];

  v91[14] = v74;
  uint64_t v52 = objc_opt_class();
  id v53 = v50;
  id v54 = v51;
  v55 = [[CPLByClassExtractionStep alloc] initWithStorage:v53 scopeIdentifier:v54 description:@"Deleted(Asset)" class:v52 maximumCount:-1 query:CPLStepDeleted];

  v91[15] = v55;
  uint64_t v56 = objc_opt_class();
  id v57 = v53;
  id v58 = v54;
  v59 = [[CPLByClassExtractionStep alloc] initWithStorage:v57 scopeIdentifier:v58 description:@"Deleted(Master)" class:v56 maximumCount:-1 query:CPLStepDeleted];

  v91[16] = v59;
  uint64_t v60 = objc_opt_class();
  id v61 = v57;
  id v62 = v58;
  v63 = [[CPLDeleteChainedRecordExtractionStep alloc] initWithStorage:v61 class:v60 classDescription:@"Person" scopeIdentifier:v62 maximumCount:-1];

  v91[17] = v63;
  uint64_t v64 = objc_opt_class();
  id v65 = v61;
  id v66 = v62;
  v67 = [[CPLByClassExtractionStep alloc] initWithStorage:v65 scopeIdentifier:v66 description:@"Deleted(Record)" class:v64 maximumCount:-1 query:CPLStepDeleted];

  v91[18] = v67;
  id v68 = v65;
  id v69 = v66;
  v70 = [[CPLByClassExtractionStep alloc] initWithStorage:v68 scopeIdentifier:v69 description:@"All" class:0 maximumCount:-1 query:CPLStepAllChanges];

  v91[19] = v70;
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:20];
  v72 = (void *)[v88 initWithName:@"mingling" storage:v68 scopeIdentifier:v69 steps:v71];

  if (a5) {
    objc_msgSend(v72, "setMaximumRecordCountPerBatch:");
  }

  return v72;
}

+ (id)overQuotaStrategyWithStorage:(id)a3 coveringScopeIdentifier:(id)a4
{
  v111[26] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v108 = objc_alloc((Class)a1);
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  id v10 = v7;
  v110 = [[CPLNewChainedRecordExtractionStep alloc] initWithStorage:v9 class:v8 classDescription:@"Person" scopeIdentifier:v10 maximumCount:-1];

  v111[0] = v110;
  uint64_t v11 = objc_opt_class();
  id v12 = v9;
  id v13 = v10;
  v109 = [[CPLByClassExtractionStep alloc] initWithStorage:v12 scopeIdentifier:v13 description:@"Deleted(ContainerRelation)" class:v11 maximumCount:-1 query:CPLStepDeleted];

  v111[1] = v109;
  uint64_t v14 = objc_opt_class();
  id v15 = v12;
  id v16 = v13;
  v107 = [[CPLByClassExtractionStep alloc] initWithStorage:v15 scopeIdentifier:v16 description:@"Deleted(Asset)" class:v14 maximumCount:-1 query:CPLStepDeleted];

  v111[2] = v107;
  v106 = [[CPLTrashedAssetExtractionStep alloc] initWithStorage:v15 scopeIdentifier:v16 maximumCount:-1];
  v111[3] = v106;
  v105 = [[CPLNewAssetExtractionStep alloc] initWithStorage:v15 scopeIdentifier:v16 maximumCount:-1];
  v111[4] = v105;
  uint64_t v17 = objc_opt_class();
  id v18 = v15;
  id v19 = v16;
  v104 = [[CPLByClassExtractionStep alloc] initWithStorage:v18 scopeIdentifier:v19 description:@"New(Master)" class:v17 maximumCount:-1 query:CPLStepNew];

  v111[5] = v104;
  uint64_t v20 = objc_opt_class();
  unint64_t v21 = +[CPLBatchExtractionStrategy maximumAlbumsPerBatch];
  id v22 = v18;
  id v23 = v19;
  v103 = [[CPLNewChainedRecordExtractionStep alloc] initWithStorage:v22 class:v20 classDescription:@"Album" scopeIdentifier:v23 maximumCount:v21];

  v111[6] = v103;
  uint64_t v24 = objc_opt_class();
  id v25 = v22;
  id v26 = v23;
  v102 = [[CPLByClassExtractionStep alloc] initWithStorage:v25 scopeIdentifier:v26 description:@"NotDeleted(Person)" class:v24 maximumCount:-1 query:CPLStepNotDeleted];

  v111[7] = v102;
  uint64_t v27 = objc_opt_class();
  id v28 = v25;
  id v29 = v26;
  v101 = [[CPLByClassExtractionStep alloc] initWithStorage:v28 scopeIdentifier:v29 description:@"NotDeleted(FaceCrop)" class:v27 maximumCount:10 query:CPLStepNotDeleted];

  v111[8] = v101;
  uint64_t v30 = objc_opt_class();
  id v31 = v28;
  id v32 = v29;
  v100 = [[CPLByClassExtractionStep alloc] initWithStorage:v31 scopeIdentifier:v32 description:@"NotDeleted(Asset)" class:v30 maximumCount:-1 query:CPLStepNotDeleted];

  v111[9] = v100;
  uint64_t v33 = objc_opt_class();
  id v34 = v31;
  id v35 = v32;
  v99 = [[CPLByClassExtractionStep alloc] initWithStorage:v34 scopeIdentifier:v35 description:@"NotDeleted(Master)" class:v33 maximumCount:-1 query:CPLStepNotDeleted];

  v111[10] = v99;
  uint64_t v36 = objc_opt_class();
  unint64_t v37 = +[CPLBatchExtractionStrategy maximumAlbumsPerBatch];
  id v38 = v34;
  id v39 = v35;
  v98 = [[CPLByClassExtractionStep alloc] initWithStorage:v38 scopeIdentifier:v39 description:@"NotDeleted(Album)" class:v36 maximumCount:v37 query:CPLStepNotDeleted];

  v111[11] = v98;
  uint64_t v40 = objc_opt_class();
  id v41 = v38;
  id v42 = v39;
  v97 = [[CPLByClassExtractionStep alloc] initWithStorage:v41 scopeIdentifier:v42 description:@"NotDeleted(Container)" class:v40 maximumCount:-1 query:CPLStepNotDeleted];

  v111[12] = v97;
  uint64_t v43 = objc_opt_class();
  id v44 = v41;
  id v45 = v42;
  v96 = [[CPLByClassExtractionStep alloc] initWithStorage:v44 scopeIdentifier:v45 description:@"New(ContainerRelation)" class:v43 maximumCount:-1 query:CPLStepNew];

  v111[13] = v96;
  uint64_t v46 = objc_opt_class();
  id v47 = v44;
  id v48 = v45;
  v95 = [[CPLByClassExtractionStep alloc] initWithStorage:v47 scopeIdentifier:v48 description:@"NotDeleted(ContainerRelation)" class:v46 maximumCount:-1 query:CPLStepNotDeleted];

  v111[14] = v95;
  uint64_t v49 = objc_opt_class();
  id v50 = v47;
  id v51 = v48;
  v94 = [[CPLByClassExtractionStep alloc] initWithStorage:v50 scopeIdentifier:v51 description:@"NotDeleted(SocialGroup)" class:v49 maximumCount:5 query:CPLStepNotDeleted];

  v111[15] = v94;
  uint64_t v52 = objc_opt_class();
  id v53 = v50;
  id v54 = v51;
  v93 = [[CPLByClassExtractionStep alloc] initWithStorage:v53 scopeIdentifier:v54 description:@"Deleted(SocialGroup)" class:v52 maximumCount:-1 query:CPLStepDeleted];

  v111[16] = v93;
  uint64_t v55 = objc_opt_class();
  id v56 = v53;
  id v57 = v54;
  v92 = [[CPLByClassExtractionStep alloc] initWithStorage:v56 scopeIdentifier:v57 description:@"NotDeleted(Memory)" class:v55 maximumCount:5 query:CPLStepNotDeleted];

  v111[17] = v92;
  uint64_t v58 = objc_opt_class();
  id v59 = v56;
  id v60 = v57;
  v91 = [[CPLByClassExtractionStep alloc] initWithStorage:v59 scopeIdentifier:v60 description:@"Deleted(Memory)" class:v58 maximumCount:-1 query:CPLStepDeleted];

  v111[18] = v91;
  uint64_t v61 = objc_opt_class();
  id v62 = v59;
  id v63 = v60;
  v90 = [[CPLByClassExtractionStep alloc] initWithStorage:v62 scopeIdentifier:v63 description:@"NotDeleted(Suggestion)" class:v61 maximumCount:5 query:CPLStepNotDeleted];

  v111[19] = v90;
  uint64_t v64 = objc_opt_class();
  id v65 = v62;
  id v66 = v63;
  v67 = [[CPLByClassExtractionStep alloc] initWithStorage:v65 scopeIdentifier:v66 description:@"Deleted(Suggestion)" class:v64 maximumCount:-1 query:CPLStepDeleted];

  v111[20] = v67;
  uint64_t v68 = objc_opt_class();
  id v69 = v65;
  id v70 = v66;
  v71 = [[CPLByClassExtractionStep alloc] initWithStorage:v69 scopeIdentifier:v70 description:@"Deleted(FaceCrop)" class:v68 maximumCount:-1 query:CPLStepDeleted];

  v111[21] = v71;
  uint64_t v72 = objc_opt_class();
  id v73 = v69;
  id v74 = v70;
  v75 = [[CPLDeleteChainedRecordExtractionStep alloc] initWithStorage:v73 class:v72 classDescription:@"Album" scopeIdentifier:v74 maximumCount:-1];

  v111[22] = v75;
  uint64_t v76 = objc_opt_class();
  id v77 = v73;
  id v78 = v74;
  v79 = [[CPLByClassExtractionStep alloc] initWithStorage:v77 scopeIdentifier:v78 description:@"Deleted(Master)" class:v76 maximumCount:-1 query:CPLStepDeleted];

  v111[23] = v79;
  uint64_t v80 = objc_opt_class();
  id v81 = v77;
  id v82 = v78;
  v83 = [[CPLDeleteChainedRecordExtractionStep alloc] initWithStorage:v81 class:v80 classDescription:@"Person" scopeIdentifier:v82 maximumCount:-1];

  v111[24] = v83;
  id v84 = v81;
  id v85 = v82;
  v86 = [[CPLByClassExtractionStep alloc] initWithStorage:v84 scopeIdentifier:v85 description:@"All" class:0 maximumCount:-1 query:CPLStepAllChanges];

  v111[25] = v86;
  v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:26];
  id v88 = (void *)[v108 initWithName:@"overQuota" storage:v84 scopeIdentifier:v85 steps:v87];

  return v88;
}

+ (id)usualStrategyWithStorage:(id)a3 coveringScopeIdentifier:(id)a4
{
  v113[25] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (usualStrategyWithStorage_coveringScopeIdentifier__onceToken != -1) {
    dispatch_once(&usualStrategyWithStorage_coveringScopeIdentifier__onceToken, &__block_literal_global_3837);
  }
  if (usualStrategyWithStorage_coveringScopeIdentifier__forceOverQuotaStrategy)
  {
    uint64_t v8 = [a1 overQuotaStrategyWithStorage:v6 coveringScopeIdentifier:v7];
  }
  else
  {
    id v108 = objc_alloc((Class)a1);
    uint64_t v9 = objc_opt_class();
    id v10 = v6;
    id v112 = v6;
    id v11 = v7;
    v110 = [[CPLNewChainedRecordExtractionStep alloc] initWithStorage:v10 class:v9 classDescription:@"Person" scopeIdentifier:v11 maximumCount:-1];

    v113[0] = v110;
    v109 = [[CPLNewAssetExtractionStep alloc] initWithStorage:v10 scopeIdentifier:v11 maximumCount:-1];
    v113[1] = v109;
    uint64_t v12 = objc_opt_class();
    id v13 = v10;
    id v14 = v11;
    v107 = [[CPLByClassExtractionStep alloc] initWithStorage:v13 scopeIdentifier:v14 description:@"New(Master)" class:v12 maximumCount:-1 query:CPLStepNew];

    v113[2] = v107;
    id v111 = v7;
    uint64_t v15 = objc_opt_class();
    unint64_t v16 = +[CPLBatchExtractionStrategy maximumAlbumsPerBatch];
    id v17 = v13;
    id v18 = v14;
    v106 = [[CPLNewChainedRecordExtractionStep alloc] initWithStorage:v17 class:v15 classDescription:@"Album" scopeIdentifier:v18 maximumCount:v16];

    v113[3] = v106;
    uint64_t v19 = objc_opt_class();
    id v20 = v17;
    id v21 = v18;
    v105 = [[CPLByClassExtractionStep alloc] initWithStorage:v20 scopeIdentifier:v21 description:@"NotDeleted(Person)" class:v19 maximumCount:-1 query:CPLStepNotDeleted];

    v113[4] = v105;
    uint64_t v22 = objc_opt_class();
    id v23 = v20;
    id v24 = v21;
    v104 = [[CPLByClassExtractionStep alloc] initWithStorage:v23 scopeIdentifier:v24 description:@"NotDeleted(FaceCrop)" class:v22 maximumCount:10 query:CPLStepNotDeleted];

    v113[5] = v104;
    uint64_t v25 = objc_opt_class();
    id v26 = v23;
    id v27 = v24;
    v103 = [[CPLByClassExtractionStep alloc] initWithStorage:v26 scopeIdentifier:v27 description:@"NotDeleted(Asset)" class:v25 maximumCount:-1 query:CPLStepNotDeleted];

    v113[6] = v103;
    uint64_t v28 = objc_opt_class();
    id v29 = v26;
    id v30 = v27;
    v102 = [[CPLByClassExtractionStep alloc] initWithStorage:v29 scopeIdentifier:v30 description:@"New(ContainerRelation)" class:v28 maximumCount:-1 query:CPLStepNew];

    v113[7] = v102;
    uint64_t v31 = objc_opt_class();
    id v32 = v29;
    id v33 = v30;
    v101 = [[CPLByClassExtractionStep alloc] initWithStorage:v32 scopeIdentifier:v33 description:@"NotDeleted(Master)" class:v31 maximumCount:-1 query:CPLStepNotDeleted];

    v113[8] = v101;
    uint64_t v34 = objc_opt_class();
    unint64_t v35 = +[CPLBatchExtractionStrategy maximumAlbumsPerBatch];
    id v36 = v32;
    id v37 = v33;
    v100 = [[CPLByClassExtractionStep alloc] initWithStorage:v36 scopeIdentifier:v37 description:@"NotDeleted(Album)" class:v34 maximumCount:v35 query:CPLStepNotDeleted];

    v113[9] = v100;
    uint64_t v38 = objc_opt_class();
    id v39 = v36;
    id v40 = v37;
    v99 = [[CPLByClassExtractionStep alloc] initWithStorage:v39 scopeIdentifier:v40 description:@"NotDeleted(Container)" class:v38 maximumCount:-1 query:CPLStepNotDeleted];

    v113[10] = v99;
    uint64_t v41 = objc_opt_class();
    id v42 = v39;
    id v43 = v40;
    v98 = [[CPLByClassExtractionStep alloc] initWithStorage:v42 scopeIdentifier:v43 description:@"NotDeleted(ContainerRelation)" class:v41 maximumCount:-1 query:CPLStepNotDeleted];

    v113[11] = v98;
    uint64_t v44 = objc_opt_class();
    id v45 = v42;
    id v46 = v43;
    v97 = [[CPLByClassExtractionStep alloc] initWithStorage:v45 scopeIdentifier:v46 description:@"NotDeleted(SocialGroup)" class:v44 maximumCount:5 query:CPLStepNotDeleted];

    v113[12] = v97;
    uint64_t v47 = objc_opt_class();
    id v48 = v45;
    id v49 = v46;
    v96 = [[CPLByClassExtractionStep alloc] initWithStorage:v48 scopeIdentifier:v49 description:@"Deleted(SocialGroup)" class:v47 maximumCount:-1 query:CPLStepDeleted];

    v113[13] = v96;
    uint64_t v50 = objc_opt_class();
    id v51 = v48;
    id v52 = v49;
    v95 = [[CPLByClassExtractionStep alloc] initWithStorage:v51 scopeIdentifier:v52 description:@"NotDeleted(Memory)" class:v50 maximumCount:5 query:CPLStepNotDeleted];

    v113[14] = v95;
    uint64_t v53 = objc_opt_class();
    id v54 = v51;
    id v55 = v52;
    v94 = [[CPLByClassExtractionStep alloc] initWithStorage:v54 scopeIdentifier:v55 description:@"Deleted(Memory)" class:v53 maximumCount:-1 query:CPLStepDeleted];

    v113[15] = v94;
    uint64_t v56 = objc_opt_class();
    id v57 = v54;
    id v58 = v55;
    v93 = [[CPLByClassExtractionStep alloc] initWithStorage:v57 scopeIdentifier:v58 description:@"NotDeleted(Suggestion)" class:v56 maximumCount:5 query:CPLStepNotDeleted];

    v113[16] = v93;
    uint64_t v59 = objc_opt_class();
    id v60 = v57;
    id v61 = v58;
    v92 = [[CPLByClassExtractionStep alloc] initWithStorage:v60 scopeIdentifier:v61 description:@"Deleted(Suggestion)" class:v59 maximumCount:-1 query:CPLStepDeleted];

    v113[17] = v92;
    uint64_t v62 = objc_opt_class();
    id v63 = v60;
    id v64 = v61;
    v91 = [[CPLByClassExtractionStep alloc] initWithStorage:v63 scopeIdentifier:v64 description:@"Deleted(FaceCrop)" class:v62 maximumCount:-1 query:CPLStepDeleted];

    v113[18] = v91;
    uint64_t v65 = objc_opt_class();
    id v66 = v63;
    id v67 = v64;
    uint64_t v68 = [[CPLByClassExtractionStep alloc] initWithStorage:v66 scopeIdentifier:v67 description:@"Deleted(ContainerRelation)" class:v65 maximumCount:-1 query:CPLStepDeleted];

    v113[19] = v68;
    uint64_t v69 = objc_opt_class();
    id v70 = v66;
    id v71 = v67;
    uint64_t v72 = [[CPLDeleteChainedRecordExtractionStep alloc] initWithStorage:v70 class:v69 classDescription:@"Album" scopeIdentifier:v71 maximumCount:-1];

    v113[20] = v72;
    uint64_t v73 = objc_opt_class();
    id v74 = v70;
    id v75 = v71;
    uint64_t v76 = [[CPLByClassExtractionStep alloc] initWithStorage:v74 scopeIdentifier:v75 description:@"Deleted(Asset)" class:v73 maximumCount:-1 query:CPLStepDeleted];

    v113[21] = v76;
    uint64_t v77 = objc_opt_class();
    id v78 = v74;
    id v79 = v75;
    uint64_t v80 = [[CPLByClassExtractionStep alloc] initWithStorage:v78 scopeIdentifier:v79 description:@"Deleted(Master)" class:v77 maximumCount:-1 query:CPLStepDeleted];

    v113[22] = v80;
    uint64_t v81 = objc_opt_class();
    id v82 = v78;
    id v83 = v79;
    id v84 = [[CPLDeleteChainedRecordExtractionStep alloc] initWithStorage:v82 class:v81 classDescription:@"Person" scopeIdentifier:v83 maximumCount:-1];

    v113[23] = v84;
    id v85 = v82;
    id v86 = v83;
    v87 = [[CPLByClassExtractionStep alloc] initWithStorage:v85 scopeIdentifier:v86 description:@"All" class:0 maximumCount:-1 query:CPLStepAllChanges];

    v113[24] = v87;
    id v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:25];
    id v89 = v86;
    id v7 = v111;
    uint64_t v8 = (void *)[v108 initWithName:@"usual" storage:v85 scopeIdentifier:v89 steps:v88];

    id v6 = v112;
  }

  return v8;
}

void __79__CPLBatchExtractionStrategy_usualStrategyWithStorage_coveringScopeIdentifier___block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  usualStrategyWithStorage_coveringScopeIdentifier__forceOverQuotaStrategy = [v0 BOOLForKey:@"CPLForceOverQuotaStrategy"];

  if (usualStrategyWithStorage_coveringScopeIdentifier__forceOverQuotaStrategy) {
    BOOL v1 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (v1)
  {
    v2 = __CPLStrategyOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "Forcing over quota stragegy", v3, 2u);
    }
  }
}

+ (void)setMaximumAlbumsPerBatch:(unint64_t)a3
{
  _maximumAlbumsPerBatch = a3;
}

+ (unint64_t)maximumAlbumsPerBatch
{
  if ((unint64_t)_maximumAlbumsPerBatch <= 1) {
    return 1;
  }
  else {
    return _maximumAlbumsPerBatch;
  }
}

+ (unint64_t)minimumRecordCountPerBatch
{
  return 10;
}

+ (unint64_t)maximumRecordCountPerBatch
{
  return _CPLMaximumBatchSize;
}

+ (void)setMaximumRecordCountPerBatch:(unint64_t)a3
{
  unint64_t v3 = 100;
  if (a3) {
    unint64_t v3 = a3;
  }
  if (v3 <= 1)
  {
    if (!_CPLSilentLogging)
    {
      id v6 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Maximum record count is too low", v9, 2u);
      }
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLBatchExtractionStrategy.m"];
    [v7 handleFailureInMethod:a2 object:a1 file:v8 lineNumber:61 description:@"Maximum record count is too low"];

    abort();
  }
  _CPLMaximumBatchSize = v3;
}

@end