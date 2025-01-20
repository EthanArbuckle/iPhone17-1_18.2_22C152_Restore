@interface _CDSocialInteractionAdvisor
- (_CDInteractionStore)store;
- (_CDSocialInteractionAdvisor)initWithStore:(id)a3;
- (id)adviseInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5;
- (id)inSeedPredicateForSeed:(id)a3;
- (id)keyForModelWithSettings:(id)a3;
- (id)rankContacts:(id)a3 withSeedContacts:(id)a4 usingSettings:(id)a5;
- (id)recentPredicateForDate:(id)a3 lambda:(float)a4 lookAheadWeeks:(int)a5;
- (void)setStore:(id)a3;
- (void)tuneUsingSettings:(id)a3 heartBeatHandler:(id)a4;
@end

@implementation _CDSocialInteractionAdvisor

- (_CDSocialInteractionAdvisor)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CDSocialInteractionAdvisor;
  v6 = [(_CDSocialInteractionAdvisor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (id)keyForModelWithSettings:(id)a3
{
  v3 = NSString;
  v4 = [a3 interactionPredicate];
  id v5 = [v3 stringWithFormat:@"%@", v4];

  return v5;
}

- (id)rankContacts:(id)a3 withSeedContacts:(id)a4 usingSettings:(id)a5
{
  v56[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v55 = 0;
  int v54 = 0;
  v49 = [[_CDPSimpleModelParameterManager alloc] initWithSettings:v10];
  [(_CDPSimpleModelParameterManager *)v49 getLambda:(char *)&v55 + 4 w0:&v55 threshold:&v54];
  if ([v10 useFuture]) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = 0;
  }
  v12 = [v10 interactionDate];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v15 = v14;

  LODWORD(v16) = HIDWORD(v55);
  v48 = v15;
  uint64_t v17 = [(_CDSocialInteractionAdvisor *)self recentPredicateForDate:v15 lambda:v11 lookAheadWeeks:v16];
  uint64_t v18 = [(_CDSocialInteractionAdvisor *)self inSeedPredicateForSeed:v9];
  v19 = (void *)MEMORY[0x1E4F28BA0];
  v47 = (void *)v17;
  v56[0] = v17;
  v20 = [v10 interactionPredicate];
  v56[1] = v20;
  v56[2] = v18;
  v46 = (void *)v18;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];
  uint64_t v22 = [v19 andPredicateWithSubpredicates:v21];

  v23 = objc_alloc_init(_CDPSimpleModel);
  -[_CDPSimpleModel setRequireOutgoingInteraction:](v23, "setRequireOutgoingInteraction:", [v10 requireOutgoingInteraction]);
  v24 = objc_alloc_init(_CDPInteractionStoreDataHarvester);
  [(_CDPInteractionStoreDataHarvester *)v24 setStore:self->_store];
  v45 = (void *)v22;
  [(_CDPInteractionStoreDataHarvester *)v24 setPredicate:v22];
  [(_CDPSimpleModel *)v23 setHarvester:v24];
  dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __75___CDSocialInteractionAdvisor_rankContacts_withSeedContacts_usingSettings___block_invoke;
  v52[3] = &unk_1E560D730;
  v26 = v25;
  v53 = v26;
  [(_CDPSimpleModel *)v23 loadModel:v52];
  v44 = v26;
  dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
  LODWORD(v27) = HIDWORD(v55);
  LODWORD(v28) = v55;
  [(_CDPSimpleModel *)v23 setLambda:v27 w0:v28];
  v43 = [v9 valueForKey:@"identifier"];
  v29 = -[_CDPSimpleModel _newIdsForPeople:length:](v23, "_newIdsForPeople:length:");
  v51 = v9;
  v30 = -[_CDPSimpleModel _newPredictionResultWithSeed:seedLength:realSeedLength:maxTrainingEmailID:](v23, "_newPredictionResultWithSeed:seedLength:realSeedLength:maxTrainingEmailID:", v29, 0, [v9 count], 0xFFFFFFFFLL);
  v42 = [v8 valueForKey:@"identifier"];
  uint64_t v31 = -[_CDPSimpleModel _newIdsForPeople:length:](v23, "_newIdsForPeople:length:");
  v32 = malloc_type_calloc(0, 0x10uLL, 0x1000040451B5BE8uLL);
  v41 = (void *)v31;
  v50 = v10;
  free(v30);
  free(v29);
  qsort_b(v32, 0, 0x10uLL, &__block_literal_global_72);
  v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v34 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v8, "count"));
  if ([v8 count])
  {
    unint64_t v35 = 0;
    do
    {
      v36 = [v8 objectAtIndexedSubscript:v35];
      v37 = [v36 identifier];
      char v38 = [v34 containsObject:v37];

      if ((v38 & 1) == 0)
      {
        v39 = [v8 objectAtIndexedSubscript:v35];
        [v33 addObject:v39];
      }
      ++v35;
    }
    while ([v8 count] > v35);
  }
  free(v41);
  free(v32);

  return v33;
}

- (id)adviseInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5
{
  v68[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v66 = 0;
  float v64 = 0.0;
  int v65 = 0;
  v56 = [[_CDPSimpleModelParameterManager alloc] initWithSettings:v10];
  [(_CDPSimpleModelParameterManager *)v56 getLambda:&v66 w0:&v65 threshold:&v64];
  if ([v10 useFuture]) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 0;
  }
  LODWORD(v11) = v66;
  v57 = v8;
  uint64_t v13 = [(_CDSocialInteractionAdvisor *)self recentPredicateForDate:v8 lambda:v12 lookAheadWeeks:v11];
  v59 = v9;
  uint64_t v14 = [(_CDSocialInteractionAdvisor *)self inSeedPredicateForSeed:v9];
  uint64_t v15 = [v10 interactionPredicate];
  double v16 = [v10 callerBundleId];
  if ([v16 isEqualToString:@"com.apple.mobilemail"])
  {
  }
  else
  {
    uint64_t v17 = [v10 callerBundleId];
    int v18 = [v17 isEqualToString:@"com.apple.mail"];

    if (!v18) {
      goto LABEL_8;
    }
  }
  v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction == %@)", &unk_1EDE1E120];
  v20 = (void *)MEMORY[0x1E4F28BA0];
  v21 = [v10 interactionPredicate];
  v68[0] = v21;
  v68[1] = v19;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
  v23 = uint64_t v22 = (void *)v15;
  uint64_t v24 = [v20 andPredicateWithSubpredicates:v23];

  uint64_t v15 = v24;
LABEL_8:
  dispatch_semaphore_t v25 = (void *)MEMORY[0x1E4F28BA0];
  int v54 = (void *)v14;
  uint64_t v55 = (void *)v13;
  v67[0] = v13;
  v67[1] = v15;
  v53 = (void *)v15;
  v67[2] = v14;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:3];
  uint64_t v27 = [v25 andPredicateWithSubpredicates:v26];

  double v28 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[_CDSocialInteractionAdvisor adviseInteractionsForDate:andSeedContacts:usingSettings:]();
  }

  v29 = objc_alloc_init(_CDPSimpleModel);
  -[_CDPSimpleModel setRequireOutgoingInteraction:](v29, "setRequireOutgoingInteraction:", [v10 requireOutgoingInteraction]);
  v30 = objc_alloc_init(_CDPInteractionStoreDataHarvester);
  [(_CDPInteractionStoreDataHarvester *)v30 setStore:self->_store];
  v52 = (void *)v27;
  [(_CDPInteractionStoreDataHarvester *)v30 setPredicate:v27];
  [(_CDPSimpleModel *)v29 setHarvester:v30];
  dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __87___CDSocialInteractionAdvisor_adviseInteractionsForDate_andSeedContacts_usingSettings___block_invoke;
  v62[3] = &unk_1E560D730;
  v32 = v31;
  v63 = v32;
  [(_CDPSimpleModel *)v29 loadModel:v62];
  v51 = v32;
  dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
  LODWORD(v33) = v66;
  LODWORD(v34) = v65;
  [(_CDPSimpleModel *)v29 setLambda:v33 w0:v34];
  uint64_t v61 = 0;
  v50 = [v59 valueForKey:@"identifier"];
  v49 = [(_CDPSimpleModel *)v29 _newIdsForPeople:v50 length:&v61];
  v58 = -[_CDPSimpleModel _newPredictionResultWithSeed:seedLength:realSeedLength:maxTrainingEmailID:](v29, "_newPredictionResultWithSeed:seedLength:realSeedLength:maxTrainingEmailID:", v49, v61, [v50 count], 0xFFFFFFFFLL);
  qsort_b(v58, [(_CDPSimpleModel *)v29 nPeople], 0x10uLL, &__block_literal_global_158);
  id v60 = [MEMORY[0x1E4F1CA48] array];
  if ([(_CDPSimpleModel *)v29 nPeople])
  {
    unint64_t v35 = 0;
    unint64_t v36 = 0;
    p_var1 = &v58->var1;
    do
    {
      float v38 = *p_var1;
      if (*p_var1 < v64) {
        break;
      }
      v39 = [(_CDPSimpleModel *)v29 people];
      v40 = [v39 objectAtIndexedSubscript:*((int *)p_var1 - 1)];

      v41 = [(_CDPInteractionStoreDataHarvester *)v30 contactForIdentifier:v40];
      v42 = [v10 contactPrefix];
      uint64_t v43 = [v42 length];

      if (!v43
        || ([v10 contactPrefix],
            v44 = objc_claimAutoreleasedReturnValue(),
            int v45 = [v41 mayContainPrefix:v44],
            v44,
            v45))
      {
        v46 = objc_alloc_init(_CDAdvisedInteraction);
        [(_CDAdvisedInteraction *)v46 setScore:v38];
        [(_CDAdvisedInteraction *)v46 setContact:v41];
        [v60 addObject:v46];
        ++v36;
        unint64_t v47 = [v10 resultLimit];

        if (v36 >= v47)
        {

          break;
        }
      }

      ++v35;
      p_var1 += 4;
    }
    while ([(_CDPSimpleModel *)v29 nPeople] > v35);
  }
  free(v58);
  free(v49);

  return v60;
}

- (void)tuneUsingSettings:(id)a3 heartBeatHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 interactionPredicate];
  id v9 = objc_alloc_init(_CDPSimpleModel);
  -[_CDPSimpleModel setRequireOutgoingInteraction:](v9, "setRequireOutgoingInteraction:", [v6 requireOutgoingInteraction]);
  id v10 = objc_alloc_init(_CDPInteractionStoreDataHarvester);
  [(_CDPInteractionStoreDataHarvester *)v10 setStore:self->_store];
  [(_CDPInteractionStoreDataHarvester *)v10 setPredicate:v8];
  [(_CDPSimpleModel *)v9 setHarvester:v10];
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __66___CDSocialInteractionAdvisor_tuneUsingSettings_heartBeatHandler___block_invoke;
  v27[3] = &unk_1E560D730;
  uint64_t v12 = v11;
  double v28 = v12;
  [(_CDPSimpleModel *)v9 loadModel:v27];
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v13 = objc_alloc_init(_CDPModelTuning);
  uint64_t v14 = [(_CDPSimpleModel *)v9 _testingIndices];
  [(_CDPModelTuning *)v13 setTestIndices:v14];

  uint64_t v15 = +[_CDPModelTuning f2Score];
  [(_CDPModelTuning *)v13 setScorer:v15];

  double v16 = [(_CDPSimpleModel *)v9 _testingIndices];
  [(_CDPModelTuning *)v13 setTestIndices:v16];

  [(_CDPModelTuning *)v13 setModel:v9];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  int v18 = [[_CDPSimpleModelParameterManager alloc] initWithSettings:v6];
  objc_initWeak(&location, v13);
  [(_CDPSimpleModelParameterManager *)v18 modelTunerWillResume:v13];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __66___CDSocialInteractionAdvisor_tuneUsingSettings_heartBeatHandler___block_invoke_161;
  v22[3] = &unk_1E5610658;
  id v19 = v7;
  id v23 = v19;
  v20 = v18;
  uint64_t v24 = v20;
  objc_copyWeak(v25, &location);
  v25[1] = *(id *)&Current;
  v25[2] = (id)0x402E000000000000;
  [(_CDPModelTuning *)v13 setHeartBeat:v22];
  v21 = [(_CDPSimpleModelParameterManager *)v20 lastTuningState];
  [(_CDPModelTuning *)v13 resumeTuningWithState:v21];

  [(_CDPSimpleModelParameterManager *)v20 modelTunerWillStop:v13];
  objc_destroyWeak(v25);

  objc_destroyWeak(&location);
}

- (id)recentPredicateForDate:(id)a3 lambda:(float)a4 lookAheadWeeks:(int)a5
{
  double v6 = a4 * *(double *)"" * 86400.0;
  id v7 = a3;
  id v8 = [v7 dateByAddingTimeInterval:v6];
  id v9 = [v7 dateByAddingTimeInterval:(double)a5 * 604800.0];

  id v10 = (void *)MEMORY[0x1E4F28F60];
  [v8 timeIntervalSinceReferenceDate];
  uint64_t v12 = v11;
  [v9 timeIntervalSinceReferenceDate];
  uint64_t v14 = [v10 predicateWithFormat:@"startDate >= CAST(%f, \"NSDate\") AND startDate <= CAST(%f, \"NSDate\")", v12, v13];

  return v14;
}

- (id)inSeedPredicateForSeed:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  double v6 = [v4 setWithArray:v5];
  id v7 = +[_CDInteractionAdvisorSettings extractContactIdentifiers:v6];
  id v8 = [v3 predicateWithFormat:@"(sender.identifier IN %@)", v7];

  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

  uint64_t v11 = +[_CDInteractionAdvisorSettings extractContactIdentifiers:v10];
  uint64_t v12 = [v9 predicateWithFormat:@"(ANY recipients.identifier IN %@)", v11];

  uint64_t v13 = (void *)MEMORY[0x1E4F28BA0];
  v17[0] = v8;
  v17[1] = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v15 = [v13 orPredicateWithSubpredicates:v14];

  return v15;
}

- (_CDInteractionStore)store
{
  return (_CDInteractionStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)adviseInteractionsForDate:andSeedContacts:usingSettings:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_DEBUG, "Final interaction predicate %@", v1, 0xCu);
}

@end