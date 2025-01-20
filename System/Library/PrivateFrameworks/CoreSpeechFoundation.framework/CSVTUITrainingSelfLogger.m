@interface CSVTUITrainingSelfLogger
+ (id)sharedLogger;
- (void)logSiriSetupPHSEnrollmentDigitalZeroDetectionCompletedWithSiriSetupID:(id)a3 withPageNumber:(int)a4 withPhId:(id)a5 withMaxNumContinuousZeros:(int)a6 withMaxNumAllowedContinuousZeros:(int)a7 withIsMaxNumContinuousZerosOverThreshold:(BOOL)a8 withLocale:(id)a9 withVTAssetConfigVersion:(id)a10 withStageStatus:(int)a11;
- (void)logSiriSetupPHSEnrollmentUtteranceCompletedWithSiriSetupID:(id)a3 withPageNumber:(int)a4 withPhId:(id)a5 withTopScoreForUtterance:(float)a6 withStartSampleCount:(int)a7 withEndSampleCount:(int)a8 withHasSpeechDetected:(int)a9;
@end

@implementation CSVTUITrainingSelfLogger

- (void)logSiriSetupPHSEnrollmentDigitalZeroDetectionCompletedWithSiriSetupID:(id)a3 withPageNumber:(int)a4 withPhId:(id)a5 withMaxNumContinuousZeros:(int)a6 withMaxNumAllowedContinuousZeros:(int)a7 withIsMaxNumContinuousZerosOverThreshold:(BOOL)a8 withLocale:(id)a9 withVTAssetConfigVersion:(id)a10 withStageStatus:(int)a11
{
  BOOL v11 = a8;
  uint64_t v12 = *(void *)&a7;
  uint64_t v13 = *(void *)&a6;
  uint64_t v15 = *(void *)&a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a5;
  id v18 = a9;
  id v19 = a10;
  v20 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136317442;
    v27 = "-[CSVTUITrainingSelfLogger logSiriSetupPHSEnrollmentDigitalZeroDetectionCompletedWithSiriSetupID:withPageNumbe"
          "r:withPhId:withMaxNumContinuousZeros:withMaxNumAllowedContinuousZeros:withIsMaxNumContinuousZerosOverThreshold"
          ":withLocale:withVTAssetConfigVersion:withStageStatus:]";
    __int16 v28 = 2112;
    id v29 = v16;
    __int16 v30 = 1024;
    int v31 = v15;
    __int16 v32 = 2112;
    id v33 = v17;
    __int16 v34 = 1024;
    int v35 = v13;
    __int16 v36 = 1024;
    int v37 = v12;
    __int16 v38 = 1024;
    BOOL v39 = v11;
    __int16 v40 = 2112;
    id v41 = v18;
    __int16 v42 = 2112;
    id v43 = v19;
    __int16 v44 = 1024;
    int v45 = a11;
    _os_log_impl(&dword_1BA1A5000, v20, OS_LOG_TYPE_DEFAULT, "%s logSiriSetupPHSEnrollmentDigitalZero, setupID: %@, pageNumber: %d, phID: %@, maxZeros: %d, maxAllowed: %d, isOverThreshold: %d locale: %@, assetConfigVersion: %@, sessionStatus: %u", (uint8_t *)&v26, 0x52u);
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4FA1238]);
  [v21 setPageNumber:v15];
  [v21 setPhraseId:v17];
  [v21 setMaxNumContinuousZeros:v13];
  [v21 setMaxNumAllowedContinuousZeros:v12];
  [v21 setIsMaxNumContinuousZerosOverThreshold:v11];
  [v21 setLocale:v18];
  [v21 setVtAssetConfigVersion:v19];
  [v21 setStageStatus:a11];
  id v22 = objc_alloc_init(MEMORY[0x1E4FA1228]);
  id v23 = objc_alloc_init(MEMORY[0x1E4FA1230]);
  v24 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v16];
  [v23 setSiriSetupId:v24];

  [v22 setEventMetadata:v23];
  [v22 setEnrollmentZeroDetectionCompleted:v21];
  v25 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v25 emitMessage:v22];
}

- (void)logSiriSetupPHSEnrollmentUtteranceCompletedWithSiriSetupID:(id)a3 withPageNumber:(int)a4 withPhId:(id)a5 withTopScoreForUtterance:(float)a6 withStartSampleCount:(int)a7 withEndSampleCount:(int)a8 withHasSpeechDetected:(int)a9
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v11 = *(void *)&a7;
  uint64_t v13 = *(void *)&a4;
  uint64_t v15 = (objc_class *)MEMORY[0x1E4FA1240];
  id v16 = a5;
  id v17 = a3;
  id v23 = objc_alloc_init(v15);
  [v23 setPageNumber:v13];
  [v23 setPhraseId:v16];

  *(float *)&double v18 = a6;
  [v23 setTopScoreForUtterance:v18];
  [v23 setStartSampleCount:v11];
  [v23 setEndSampleCount:v10];
  [v23 setHasSpeechDetected:a9 != 0];
  id v19 = objc_alloc_init(MEMORY[0x1E4FA1228]);
  id v20 = objc_alloc_init(MEMORY[0x1E4FA1230]);
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4FA1370]) initWithNSUUID:v17];

  [v20 setSiriSetupId:v21];
  [v19 setEventMetadata:v20];
  [v19 setEnrollmentUtteranceCompleted:v23];
  id v22 = [MEMORY[0x1E4F9F9B0] sharedStream];
  [v22 emitMessage:v19];
}

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1) {
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_1389);
  }
  v2 = (void *)sharedLogger_sharedVTUITrainingSelfLogger;
  return v2;
}

uint64_t __40__CSVTUITrainingSelfLogger_sharedLogger__block_invoke()
{
  sharedLogger_sharedVTUITrainingSelfLogger = objc_alloc_init(CSVTUITrainingSelfLogger);
  return MEMORY[0x1F41817F8]();
}

@end