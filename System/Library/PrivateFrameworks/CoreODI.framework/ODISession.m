@interface ODISession
+ (void)_initLogCategories;
- (NSString)availablePartialAssessment;
- (NSString)partialAssessmentID;
- (ODISession)initWithServiceIdentifier:(id)a3 forDSIDType:(unint64_t)a4;
- (ODISession)initWithServiceIdentifier:(id)a3 forDSIDType:(unint64_t)a4 andLocationBundle:(id)a5;
- (ODISession)initWithServiceIdentifier:(id)a3 forDSIDType:(unint64_t)a4 andLocationBundleIdentifier:(id)a5;
- (OS_dispatch_queue)partial_assessment_queue;
- (_TtC7CoreODI18ODISessionInternal)internalSession;
- (id)description;
- (id)initForTransaction;
- (void)dealloc;
- (void)didChangeStateWith:(id)a3 assessmentID:(id)a4;
- (void)getAssessment:(id)a3;
- (void)getAssessmentForTransaction:(id)a3;
- (void)initForTransaction;
- (void)provideFeedbackOnPayloadOutcome:(unint64_t)a3;
- (void)setAvailablePartialAssessment:(id)a3;
- (void)setPartialAssessmentID:(id)a3;
- (void)setPartial_assessment_queue:(id)a3;
- (void)updateWithAdditionalAttributes:(id)a3;
@end

@implementation ODISession

- (id)description
{
  return [(ODISessionInternal *)self->_internalSession description];
}

+ (void)_initLogCategories
{
  if (once != -1) {
    dispatch_once(&once, &__block_literal_global);
  }
}

uint64_t __32__ODISession__initLogCategories__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.CoreODI", "ODISession");
  v1 = (void *)mlog;
  mlog = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.CoreODI", "SessionInitialisation");
  v3 = (void *)initLog;
  initLog = (uint64_t)v2;

  apiLog = (uint64_t)os_log_create("com.apple.CoreODI", "APIInterface");
  return MEMORY[0x270F9A758]();
}

- (ODISession)initWithServiceIdentifier:(id)a3 forDSIDType:(unint64_t)a4 andLocationBundleIdentifier:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v8 = (char *)a3;
  v9 = (char *)a5;
  +[ODISession _initLogCategories];
  v10 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v28 = "-[ODISession initWithServiceIdentifier:forDSIDType:andLocationBundleIdentifier:]";
    __int16 v29 = 2112;
    unint64_t v30 = (unint64_t)v8;
    __int16 v31 = 2048;
    unint64_t v32 = a4;
    __int16 v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_2151BA000, v10, OS_LOG_TYPE_DEFAULT, "Call to %s | identifier: %@, dsidType: %lu, locationBundleID: %@", buf, 0x2Au);
  }
  v11 = initLog;
  if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v8;
    __int16 v29 = 2048;
    unint64_t v30 = a4;
    _os_log_impl(&dword_2151BA000, v11, OS_LOG_TYPE_INFO, "Initializing ODISession with identifier %@ for DSID of type %lu", buf, 0x16u);
  }
  v12 = initLog;
  if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v9;
    _os_log_impl(&dword_2151BA000, v12, OS_LOG_TYPE_INFO, "Initializing ODISession: Location bundle identifier: %@", buf, 0xCu);
  }
  v26.receiver = self;
  v26.super_class = (Class)ODISession;
  v13 = [(ODISession *)&v26 init];
  if (v13)
  {
    v14 = [[_TtC7CoreODI29ODIPartialAssessmentInitiator alloc] initWithProviderID:v8];
    uint64_t v15 = [(ODIPartialAssessmentInitiator *)v14 makeInitialPartialAssessmentPayload];
    availablePartialAssessment = v13->_availablePartialAssessment;
    v13->_availablePartialAssessment = (NSString *)v15;

    uint64_t v17 = [(ODIPartialAssessmentInitiator *)v14 makeInitialPartialAssessmentID];
    partialAssessmentID = v13->_partialAssessmentID;
    v13->_partialAssessmentID = (NSString *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.CoreODI.apa", 0);
    partial_assessment_queue = v13->_partial_assessment_queue;
    v13->_partial_assessment_queue = (OS_dispatch_queue *)v19;

    v21 = [[_TtC7CoreODI18ODISessionInternal alloc] initWithServiceIdentifier:v8 forDSIDType:a4 locationBundle:0 andLocationBundleIdentifier:v9 sessionStateDelegate:v13];
    internalSession = v13->_internalSession;
    v13->_internalSession = v21;

    if (v13->_internalSession)
    {
      v23 = v13;
    }
    else
    {
      v24 = initLog;
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v28 = v8;
          __int16 v29 = 2050;
          unint64_t v30 = a4;
          __int16 v31 = 2114;
          unint64_t v32 = (unint64_t)v9;
          _os_log_error_impl(&dword_2151BA000, v24, OS_LOG_TYPE_ERROR, "Internal session failed to init, returning nil. identifier: %{public}@, for DSID: %{public}lu, location bundle: %{public}@", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_FAULT))
      {
        -[ODISession initWithServiceIdentifier:forDSIDType:andLocationBundleIdentifier:]();
      }
      v23 = 0;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (ODISession)initWithServiceIdentifier:(id)a3 forDSIDType:(unint64_t)a4 andLocationBundle:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v8 = (char *)a3;
  id v9 = a5;
  +[ODISession _initLogCategories];
  v10 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    unint64_t v30 = "-[ODISession initWithServiceIdentifier:forDSIDType:andLocationBundle:]";
    __int16 v31 = 2112;
    unint64_t v32 = (unint64_t)v8;
    __int16 v33 = 2048;
    unint64_t v34 = a4;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl(&dword_2151BA000, v10, OS_LOG_TYPE_DEFAULT, "Call to %s | identifier: %@, dsidType: %lu, locationBundle: %@", buf, 0x2Au);
  }
  v11 = initLog;
  if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    unint64_t v30 = v8;
    __int16 v31 = 2048;
    unint64_t v32 = a4;
    _os_log_impl(&dword_2151BA000, v11, OS_LOG_TYPE_INFO, "Initializing ODISession with bundle with identifier %@ for DSID of type %lu", buf, 0x16u);
  }
  v12 = (void *)initLog;
  if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    v14 = [v9 bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    unint64_t v30 = v14;
    _os_log_impl(&dword_2151BA000, v13, OS_LOG_TYPE_INFO, "Initializing ODISession: Location bundle identifier: %@", buf, 0xCu);
  }
  v28.receiver = self;
  v28.super_class = (Class)ODISession;
  uint64_t v15 = [(ODISession *)&v28 init];
  if (v15)
  {
    v16 = [[_TtC7CoreODI29ODIPartialAssessmentInitiator alloc] initWithProviderID:v8];
    uint64_t v17 = [(ODIPartialAssessmentInitiator *)v16 makeInitialPartialAssessmentPayload];
    availablePartialAssessment = v15->_availablePartialAssessment;
    v15->_availablePartialAssessment = (NSString *)v17;

    uint64_t v19 = [(ODIPartialAssessmentInitiator *)v16 makeInitialPartialAssessmentID];
    partialAssessmentID = v15->_partialAssessmentID;
    v15->_partialAssessmentID = (NSString *)v19;

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.CoreODI.apa", 0);
    partial_assessment_queue = v15->_partial_assessment_queue;
    v15->_partial_assessment_queue = (OS_dispatch_queue *)v21;

    v23 = [[_TtC7CoreODI18ODISessionInternal alloc] initWithServiceIdentifier:v8 forDSIDType:a4 locationBundle:v9 andLocationBundleIdentifier:0 sessionStateDelegate:v15];
    internalSession = v15->_internalSession;
    v15->_internalSession = v23;

    if (v15->_internalSession)
    {
      v25 = v15;
    }
    else
    {
      objc_super v26 = initLog;
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          unint64_t v30 = v8;
          __int16 v31 = 2050;
          unint64_t v32 = a4;
          __int16 v33 = 2114;
          unint64_t v34 = (unint64_t)v9;
          _os_log_error_impl(&dword_2151BA000, v26, OS_LOG_TYPE_ERROR, "Internal session failed to init, returning nil. identifier: %{public}@, for DSID: %{public}lu, location bundle: %{public}@", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_FAULT))
      {
        -[ODISession initWithServiceIdentifier:forDSIDType:andLocationBundleIdentifier:]();
      }
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (ODISession)initWithServiceIdentifier:(id)a3 forDSIDType:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    v12 = "-[ODISession initWithServiceIdentifier:forDSIDType:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    _os_log_impl(&dword_2151BA000, v7, OS_LOG_TYPE_DEFAULT, "Call to %s | identifier: %@, dsidType: %lu", (uint8_t *)&v11, 0x20u);
  }
  v8 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2151BA000, v8, OS_LOG_TYPE_INFO, "Called initWithServiceIdentifier", (uint8_t *)&v11, 2u);
  }
  id v9 = [(ODISession *)self initWithServiceIdentifier:v6 forDSIDType:a4 andLocationBundleIdentifier:0];

  return v9;
}

- (id)initForTransaction
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  +[ODISession _initLogCategories];
  v3 = initLog;
  if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_FAULT)) {
    -[ODISession initForTransaction](v3);
  }
  v4 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_queue_t v21 = "-[ODISession initForTransaction]";
    _os_log_impl(&dword_2151BA000, v4, OS_LOG_TYPE_DEFAULT, "Call to %s", buf, 0xCu);
  }
  v5 = initLog;
  if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2151BA000, v5, OS_LOG_TYPE_INFO, "Initializing ODISession for transaction mode", buf, 2u);
  }
  v19.receiver = self;
  v19.super_class = (Class)ODISession;
  id v6 = [(ODISession *)&v19 init];
  if (v6)
  {
    v7 = [[_TtC7CoreODI29ODIPartialAssessmentInitiator alloc] initWithProviderID:@"com.apple.apc.sp.tier1"];
    uint64_t v8 = [(ODIPartialAssessmentInitiator *)v7 makeInitialPartialAssessmentPayload];
    availablePartialAssessment = v6->_availablePartialAssessment;
    v6->_availablePartialAssessment = (NSString *)v8;

    uint64_t v10 = [(ODIPartialAssessmentInitiator *)v7 makeInitialPartialAssessmentID];
    partialAssessmentID = v6->_partialAssessmentID;
    v6->_partialAssessmentID = (NSString *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.CoreODI.apa", 0);
    partial_assessment_queue = v6->_partial_assessment_queue;
    v6->_partial_assessment_queue = (OS_dispatch_queue *)v12;

    id v14 = [[_TtC7CoreODI18ODISessionInternal alloc] initWithServiceIdentifier:@"com.apple.apc.sp.tier1" forDSIDType:1 locationBundle:0 andLocationBundleIdentifier:0 sessionStateDelegate:v6];
    internalSession = v6->_internalSession;
    v6->_internalSession = v14;

    if (v6->_internalSession)
    {
      unint64_t v16 = v6;
    }
    else
    {
      uint64_t v17 = initLog;
      if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_ERROR)) {
        -[ODISession initForTransaction](v17);
      }
      unint64_t v16 = 0;
    }
  }
  else
  {
    unint64_t v16 = 0;
  }

  return v16;
}

- (NSString)availablePartialAssessment
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[ODISession availablePartialAssessment]";
    _os_log_impl(&dword_2151BA000, v3, OS_LOG_TYPE_DEFAULT, "Call to %s", (uint8_t *)&v7, 0xCu);
  }
  v4 = self;
  objc_sync_enter(v4);
  [(ODISessionInternal *)v4->_internalSession provideFeedbackOnPartialAssessmentID:v4->_partialAssessmentID];
  v5 = v4->_availablePartialAssessment;
  objc_sync_exit(v4);

  return v5;
}

- (void)setAvailablePartialAssessment:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  availablePartialAssessment = v4->_availablePartialAssessment;
  v4->_availablePartialAssessment = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)updateWithAdditionalAttributes:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    dispatch_queue_t v12 = "-[ODISession updateWithAdditionalAttributes:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_2151BA000, v5, OS_LOG_TYPE_DEFAULT, "Call to %s | attributes: %@", (uint8_t *)&v11, 0x16u);
  }
  id v6 = (void *)mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    uint64_t v8 = [v4 attributes];
    uint64_t v9 = [v8 allKeys];
    int v11 = 138412290;
    dispatch_queue_t v12 = v9;
    _os_log_impl(&dword_2151BA000, v7, OS_LOG_TYPE_INFO, "Updating with attributes - Keys: %@", (uint8_t *)&v11, 0xCu);
  }
  [(ODISessionInternal *)self->_internalSession updateWithAdditionalAttributes:v4];
  uint64_t v10 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2151BA000, v10, OS_LOG_TYPE_INFO, "Update with attribute completed", (uint8_t *)&v11, 2u);
  }
}

- (void)getAssessment:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[ODISession getAssessment:]";
    _os_log_impl(&dword_2151BA000, v5, OS_LOG_TYPE_DEFAULT, "Call to %s", (uint8_t *)&v8, 0xCu);
  }
  id v6 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_2151BA000, v6, OS_LOG_TYPE_INFO, "Called getAssessment", (uint8_t *)&v8, 2u);
  }
  [(ODISessionInternal *)self->_internalSession getAssessment:v4];
  id v7 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_2151BA000, v7, OS_LOG_TYPE_INFO, "GetAssessment completed", (uint8_t *)&v8, 2u);
  }
}

- (void)getAssessmentForTransaction:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[ODISession getAssessmentForTransaction:]";
    _os_log_impl(&dword_2151BA000, v5, OS_LOG_TYPE_DEFAULT, "Call to %s", (uint8_t *)&v8, 0xCu);
  }
  id v6 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_2151BA000, v6, OS_LOG_TYPE_INFO, "Called getAssessmentForTransaction", (uint8_t *)&v8, 2u);
  }
  [(ODISessionInternal *)self->_internalSession getAssessment:v4];
  id v7 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_2151BA000, v7, OS_LOG_TYPE_INFO, "GetAssessmentForTransaction completed", (uint8_t *)&v8, 2u);
  }
}

- (void)provideFeedbackOnPayloadOutcome:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[ODISession provideFeedbackOnPayloadOutcome:]";
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    _os_log_impl(&dword_2151BA000, v5, OS_LOG_TYPE_DEFAULT, "Call to %s | outcomeType: %lu", (uint8_t *)&v8, 0x16u);
  }
  id v6 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_2151BA000, v6, OS_LOG_TYPE_INFO, "Called provideFeedbackOnPayloadOutcome", (uint8_t *)&v8, 2u);
  }
  [(ODISessionInternal *)self->_internalSession provideFeedbackOnPayloadOutcome:a3];
  id v7 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_2151BA000, v7, OS_LOG_TYPE_INFO, "provideFeedbackOnPayloadOutcome completed", (uint8_t *)&v8, 2u);
  }
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[ODISession dealloc]";
    _os_log_impl(&dword_2151BA000, v3, OS_LOG_TYPE_DEFAULT, "Call to %s", buf, 0xCu);
  }
  id v4 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2151BA000, v4, OS_LOG_TYPE_INFO, "ODISession dealloc", buf, 2u);
  }
  [(ODISessionInternal *)self->_internalSession validateForDeinit];
  v5.receiver = self;
  v5.super_class = (Class)ODISession;
  [(ODISession *)&v5 dealloc];
}

- (void)didChangeStateWith:(id)a3 assessmentID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  partial_assessment_queue = self->_partial_assessment_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ODISession_didChangeStateWith_assessmentID___block_invoke;
  block[3] = &unk_2642374B8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(partial_assessment_queue, block);
}

uint64_t __46__ODISession_didChangeStateWith_assessmentID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAvailablePartialAssessment:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  return [v3 setPartialAssessmentID:v2];
}

- (_TtC7CoreODI18ODISessionInternal)internalSession
{
  return self->_internalSession;
}

- (NSString)partialAssessmentID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPartialAssessmentID:(id)a3
{
}

- (OS_dispatch_queue)partial_assessment_queue
{
  return self->_partial_assessment_queue;
}

- (void)setPartial_assessment_queue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partial_assessment_queue, 0);
  objc_storeStrong((id *)&self->_partialAssessmentID, 0);
  objc_storeStrong((id *)&self->_internalSession, 0);
  objc_storeStrong((id *)&self->_availablePartialAssessment, 0);
}

- (void)initWithServiceIdentifier:forDSIDType:andLocationBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2151BA000, v0, v1, "Tried to init session with NULL identifier, returning nil. identifier: %{public}@, for DSID: %{public}lu, location bundle: %{public}@");
}

- (void)initForTransaction
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_2151BA000, log, OS_LOG_TYPE_FAULT, "initForTransaction is deprecated", v1, 2u);
}

@end