@interface ENExposureDetectionSession
+ (int64_t)authorizationStatus;
- (ENExposureConfiguration)configuration;
- (ENExposureDetectionSession)init;
- (ENExposureDetectionSession)initWithXPCObject:(id)a3 error:(id *)a4;
- (OS_dispatch_queue)dispatchQueue;
- (double)estimateRiskWithExposureInfo:(id)a3 referenceTime:(double)a4 transmissionRiskLevel:(char *)a5 skip:(BOOL *)a6;
- (double)scoreWithExposureInfo:(id)a3 skip:(BOOL *)a4;
- (id)description;
- (id)invalidationHandler;
- (unint64_t)maximumKeyCount;
- (void)_activateWithCompletionHandler:(id)a3;
- (void)_invalidated;
- (void)activateWithCompletionHandler:(id)a3;
- (void)addDiagnosisKeys:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)encodeWithXPCObject:(id)a3;
- (void)finishedDiagnosisKeysWithCompletionHandler:(id)a3;
- (void)getExposureInfoWithMaximumCount:(unint64_t)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)setConfiguration:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMaximumKeyCount:(unint64_t)a3;
- (void)updateDaySummary:(id)a3 exposureInfo:(id)a4 score:(double)a5;
@end

@implementation ENExposureDetectionSession

+ (int64_t)authorizationStatus
{
  return +[ENManager authorizationStatus];
}

- (ENExposureDetectionSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)ENExposureDetectionSession;
  v2 = [(ENExposureDetectionSession *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(ENExposureConfiguration);
    configuration = v2->_configuration;
    v2->_configuration = v3;

    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v2->_maximumKeyCount = 1000;
    v5 = v2;
  }

  return v2;
}

- (ENExposureDetectionSession)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [(ENExposureDetectionSession *)self init];
  if (!v7)
  {
    if (a4) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (MEMORY[0x2166BCD00](v6) != MEMORY[0x263EF8708])
  {
    if (a4)
    {
LABEL_12:
      ENErrorF(2);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_13:
    v11 = 0;
    goto LABEL_8;
  }
  v8 = xpc_dictionary_get_value(v6, "expC");
  if (v8)
  {
    v9 = [[ENExposureConfiguration alloc] initWithXPCObject:v8 error:a4];
    if (!v9)
    {
      v11 = 0;
      goto LABEL_7;
    }
    configuration = v7->_configuration;
    v7->_configuration = v9;
  }
  v11 = v7;
LABEL_7:

LABEL_8:
  return v11;
}

- (void)encodeWithXPCObject:(id)a3
{
  configuration = self->_configuration;
  if (configuration)
  {
    v5 = configuration;
    id v6 = a3;
    xpc_object_t value = xpc_dictionary_create(0, 0, 0);
    [(ENExposureConfiguration *)v5 encodeWithXPCObject:value];

    xpc_dictionary_set_value(v6, "expC", value);
  }
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateDone)
  {
    v2 = (ENExposureDetectionSession *)FatalErrorF();
    [(ENExposureDetectionSession *)v2 description];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ENExposureDetectionSession;
    [(ENExposureDetectionSession *)&v4 dealloc];
  }
}

- (id)description
{
  NSAppendPrintF_safe();
  id v2 = 0;

  return v2;
}

- (void)activateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__ENExposureDetectionSession_activateWithCompletionHandler___block_invoke;
  v7[3] = &unk_264244688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __60__ENExposureDetectionSession_activateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v2 + 8) || *(unsigned char *)(v2 + 9)) && (ENErrorF(10), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (id)v3;
    if (gLogCategory__ENExposureDetection <= 90
      && (gLogCategory__ENExposureDetection != -1 || _LogCategory_Initialize()))
    {
      id v6 = CUPrintNSError();
      LogPrintF_safe();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  }
  else
  {
    if (gLogCategory_ENExposureDetection <= 30
      && (gLogCategory_ENExposureDetection != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 _activateWithCompletionHandler:v5];
  }
}

- (void)_activateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(ENManager);
  manager = self->_manager;
  self->_manager = v5;
  id v7 = v5;

  [(ENManager *)v7 setDispatchQueue:self->_dispatchQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__ENExposureDetectionSession__activateWithCompletionHandler___block_invoke;
  v11[3] = &unk_2642446B0;
  v11[4] = self;
  [(ENManager *)v7 setInvalidationHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__ENExposureDetectionSession__activateWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_2642446D8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(ENManager *)v7 exposureDetectionActivate:self completion:v9];
}

uint64_t __61__ENExposureDetectionSession__activateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

void __61__ENExposureDetectionSession__activateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    if (gLogCategory__ENExposureDetection <= 90
      && (gLogCategory__ENExposureDetection != -1 || _LogCategory_Initialize()))
    {
      uint64_t v3 = CUPrintNSError();
      LogPrintF_safe();
    }
  }
  else if (gLogCategory_ENExposureDetection <= 30 {
         && (gLogCategory_ENExposureDetection != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__ENExposureDetectionSession_invalidate__block_invoke;
  block[3] = &unk_2642446B0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__ENExposureDetectionSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (gLogCategory_ENExposureDetection <= 30)
  {
    if (gLogCategory_ENExposureDetection != -1 || (result = _LogCategory_Initialize(), result)) {
      result = LogPrintF_safe();
    }
  }
  uint64_t v2 = *(void *)(v1 + 32);
  if (!*(unsigned char *)(v2 + 9))
  {
    *(unsigned char *)(v2 + 9) = 1;
    [*(id *)(*(void *)(v1 + 32) + 24) invalidate];
    uint64_t v3 = *(void **)(v1 + 32);
    return [v3 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_manager)
  {
    uint64_t v6 = MEMORY[0x2166BC8A0](self->_invalidationHandler, a2);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    uint64_t v5 = v6;
    if (v6)
    {
      uint64_t v4 = (*(uint64_t (**)(uint64_t))(v6 + 16))(v6);
      uint64_t v5 = v6;
    }
    self->_invalidateDone = 1;
    if (gLogCategory_ENExposureDetection <= 30)
    {
      if (gLogCategory_ENExposureDetection != -1 || (uint64_t v4 = _LogCategory_Initialize(), v5 = v6, v4))
      {
        uint64_t v4 = LogPrintF_safe();
        uint64_t v5 = v6;
      }
    }
    MEMORY[0x270F9A758](v4, v5);
  }
}

- (void)addDiagnosisKeys:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ENExposureDetectionSession_addDiagnosisKeys_completionHandler___block_invoke;
  block[3] = &unk_264244728;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __65__ENExposureDetectionSession_addDiagnosisKeys_completionHandler___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) count];
  unint64_t v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  if ((!*(unsigned char *)(v4 + 8)
     || !*(void *)(v4 + 24)
     || *(unsigned char *)(v4 + 9)
     || *(unsigned char *)(v4 + 11)
     || v2 > *(void *)(v4 + 64) - *(void *)(v4 + 16))
    && (ENErrorF(10), v5 = objc_claimAutoreleasedReturnValue(), (id v8 = (id)v5) != 0))
  {
    id v14 = (id)v5;
    if (gLogCategory__ENExposureDetection <= 90)
    {
      if (gLogCategory__ENExposureDetection != -1 || (v9 = _LogCategory_Initialize(), id v8 = v14, v9))
      {
        v13 = CUPrintNSError();
        LogPrintF_safe();

        id v8 = v14;
      }
    }
    (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v8, v6, v7);
  }
  else
  {
    if (gLogCategory_ENExposureDetection <= 30
      && (gLogCategory_ENExposureDetection != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    *(void *)(*(void *)(a1 + 40) + 16) += v3;
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = *(void **)(v10 + 24);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __65__ENExposureDetectionSession_addDiagnosisKeys_completionHandler___block_invoke_2;
    v15[3] = &unk_264244700;
    v15[4] = v10;
    unint64_t v17 = v3;
    id v16 = *(id *)(a1 + 48);
    [v12 exposureDetectionAddKeys:v11 completion:v15];
    *(void *)(*(void *)(a1 + 40) + 32) += v3;
  }
}

uint64_t __65__ENExposureDetectionSession_addDiagnosisKeys_completionHandler___block_invoke_2(void *a1)
{
  *(void *)(a1[4] + 16) -= a1[6];
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)finishedDiagnosisKeysWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__ENExposureDetectionSession_finishedDiagnosisKeysWithCompletionHandler___block_invoke;
  v7[3] = &unk_264244688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __73__ENExposureDetectionSession_finishedDiagnosisKeysWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if ((!*(unsigned char *)(v2 + 8) || !*(void *)(v2 + 24) || *(unsigned char *)(v2 + 9) || *(unsigned char *)(v2 + 11))
    && (ENErrorF(10), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (id)v3;
    if (gLogCategory__ENExposureDetection <= 90
      && (gLogCategory__ENExposureDetection != -1 || _LogCategory_Initialize()))
    {
      id v6 = CUPrintNSError();
      LogPrintF_safe();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  }
  else
  {
    if (gLogCategory_ENExposureDetection <= 30
      && (gLogCategory_ENExposureDetection != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 11) = 1;
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 24);
    [v5 exposureDetectionFinishWithCompletion:v4];
  }
}

- (void)getExposureInfoWithMaximumCount:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__ENExposureDetectionSession_getExposureInfoWithMaximumCount_completionHandler___block_invoke;
  block[3] = &unk_264244750;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __80__ENExposureDetectionSession_getExposureInfoWithMaximumCount_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (!*(unsigned char *)(v2 + 8) || (uint64_t v3 = *(void **)(v2 + 24)) == 0 || *(unsigned char *)(v2 + 9) || !*(unsigned char *)(v2 + 11))
  {
    uint64_t v4 = ENErrorF(10);
    if (v4)
    {
      id v7 = (id)v4;
      (*(void (**)(void))(a1[5] + 16))();

      return;
    }
    uint64_t v3 = *(void **)(a1[4] + 24);
  }
  uint64_t v6 = a1[5];
  uint64_t v5 = a1[6];

  [v3 exposureDetectionGetExposureInfoWithMaximumCount:v5 completion:v6];
}

- (double)estimateRiskWithExposureInfo:(id)a3 referenceTime:(double)a4 transmissionRiskLevel:(char *)a5 skip:(BOOL *)a6
{
  id v10 = a3;
  unint64_t v11 = self->_configuration;
  if (([(ENExposureConfiguration *)v11 flags] & 2) != 0)
  {
    [(ENExposureDetectionSession *)self scoreWithExposureInfo:v10 skip:a6];
    double v23 = v22;
  }
  else
  {
    -[ENExposureConfiguration attenuationLevelValueWithAttenuation:](v11, "attenuationLevelValueWithAttenuation:", [v10 attenuationValue]);
    double v13 = v12;
    id v14 = [v10 date];
    v15 = v14;
    if (v14)
    {
      [v14 timeIntervalSinceReferenceDate];
      double v17 = a4 - v16;
      if (v17 > 9.22337204e18) {
        double v17 = 9.22337204e18;
      }
      double v18 = v17 / 86400.0;
      BOOL v19 = v17 < 0.0;
      double v20 = 0.0;
      if (!v19) {
        double v20 = v18;
      }
      uint64_t v21 = (uint64_t)v20;
    }
    else
    {
      uint64_t v21 = 0;
    }
    [(ENExposureConfiguration *)v11 daysSinceLastExposureLevelValueWithDays:v21];
    double v25 = v24;
    [v10 duration];
    -[ENExposureConfiguration durationLevelValueWithDuration:](v11, "durationLevelValueWithDuration:");
    double v27 = v26;
    -[ENExposureConfiguration transmissionLevelValueWithTransmissionRiskLevel:](v11, "transmissionLevelValueWithTransmissionRiskLevel:", [v10 transmissionRiskLevel]);
    double v29 = v28;
    if (a5) {
      *a5 = [v10 transmissionRiskLevel];
    }
    double v23 = v13 * v25 * v27 * v29;
    *a6 = 0;
  }
  return v23;
}

- (double)scoreWithExposureInfo:(id)a3 skip:(BOOL *)a4
{
  id v6 = a3;
  id v7 = self->_configuration;
  BOOL v17 = 0;
  -[ENExposureConfiguration infectiousnessWeightWithDaysSinceOnsetOfSymptoms:skip:](v7, "infectiousnessWeightWithDaysSinceOnsetOfSymptoms:skip:", [v6 daysSinceOnsetOfSymptoms], &v17);
  BOOL v9 = v17;
  *a4 = v17;
  double v10 = 0.0;
  if (!v9)
  {
    double v11 = v8;
    -[ENExposureConfiguration reportTypeWeightWithReportType:skip:](v7, "reportTypeWeightWithReportType:skip:", [v6 diagnosisReportType], &v17);
    BOOL v13 = v17;
    *a4 = v17;
    if (!v13)
    {
      double v14 = v12;
      [(ENExposureConfiguration *)v7 weightedDurationWithExposureInfo:v6];
      double v10 = v14 / 100.0 * (v11 / 100.0 * v15);
    }
  }

  return v10;
}

- (void)updateDaySummary:(id)a3 exposureInfo:(id)a4 score:(double)a5
{
  id v19 = a3;
  id v8 = a4;
  BOOL v9 = [v19 daySummary];
  if (!v9)
  {
    BOOL v9 = objc_alloc_init(ENExposureSummaryItem);
    [v19 setDaySummary:v9];
  }
  [(ENExposureConfiguration *)self->_configuration weightedDurationWithExposureInfo:v8];
  double v11 = v10;
  [(ENExposureSummaryItem *)v9 maximumScore];
  if (v12 < a5) {
    [(ENExposureSummaryItem *)v9 setMaximumScore:a5];
  }
  [(ENExposureSummaryItem *)v9 scoreSum];
  [(ENExposureSummaryItem *)v9 setScoreSum:v13 + a5];
  [(ENExposureSummaryItem *)v9 weightedDurationSum];
  [(ENExposureSummaryItem *)v9 setWeightedDurationSum:v11 + v14];
  switch(-[ENExposureConfiguration mappedDiagnosisReportType:](self->_configuration, "mappedDiagnosisReportType:", [v8 diagnosisReportType]))
  {
    case 1u:
      double v15 = [v19 confirmedTestSummary];
      if (!v15)
      {
        double v15 = objc_alloc_init(ENExposureSummaryItem);
        [v19 setConfirmedTestSummary:v15];
      }
      break;
    case 2u:
      double v15 = [v19 confirmedClinicalDiagnosisSummary];
      if (!v15)
      {
        double v15 = objc_alloc_init(ENExposureSummaryItem);
        [v19 setConfirmedClinicalDiagnosisSummary:v15];
      }
      break;
    case 3u:
      double v15 = [v19 selfReportedSummary];
      if (!v15)
      {
        double v15 = objc_alloc_init(ENExposureSummaryItem);
        [v19 setSelfReportedSummary:v15];
      }
      break;
    case 4u:
      double v15 = [v19 recursiveSummary];
      if (!v15)
      {
        double v15 = objc_alloc_init(ENExposureSummaryItem);
        [v19 setRecursiveSummary:v15];
      }
      break;
    default:
      double v15 = 0;
      break;
  }
  [(ENExposureSummaryItem *)v15 maximumScore];
  if (v16 < a5) {
    [(ENExposureSummaryItem *)v15 setMaximumScore:a5];
  }
  [(ENExposureSummaryItem *)v15 scoreSum];
  [(ENExposureSummaryItem *)v15 setScoreSum:v17 + a5];
  [(ENExposureSummaryItem *)v15 weightedDurationSum];
  [(ENExposureSummaryItem *)v15 setWeightedDurationSum:v11 + v18];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (ENExposureConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (unint64_t)maximumKeyCount
{
  return self->_maximumKeyCount;
}

- (void)setMaximumKeyCount:(unint64_t)a3
{
  self->_maximumKeyCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end