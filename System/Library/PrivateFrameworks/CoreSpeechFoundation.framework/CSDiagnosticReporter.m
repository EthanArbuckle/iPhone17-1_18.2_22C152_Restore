@interface CSDiagnosticReporter
+ (id)sharedInstance;
- (CSDiagnosticReporter)init;
- (OS_dispatch_queue)queue;
- (SDRDiagnosticReporter)reporter;
- (void)setQueue:(id)a3;
- (void)setReporter:(id)a3;
- (void)submitASRIssueReport:(id)a3;
- (void)submitAudioIssueReport:(id)a3;
- (void)submitAudioIssueReport:(id)a3 withError:(id)a4;
- (void)submitDiagnosticReportWithType:(id)a3 withSubType:(id)a4 withDuration:(double)a5 withContext:(id)a6;
- (void)submitDiagnosticReportWithType:(id)a3 withSubType:(id)a4 withSubTypeContext:(id)a5 withDuration:(double)a6 withContext:(id)a7;
- (void)submitEndpointerIssueReport:(id)a3;
- (void)submitEndpointerIssueReport:(id)a3 withContext:(id)a4;
- (void)submitRemoteCoreSpeechIssueReport:(id)a3 context:(id)a4;
- (void)submitSELFIssueReport:(id)a3;
- (void)submitSiriPowerIssueReport:(id)a3;
- (void)submitTrialIssueReport:(id)a3;
- (void)submitUresIssueReport:(id)a3;
- (void)submitVoiceIdIssueReport:(id)a3;
- (void)submitVoiceTriggerIssueReport:(id)a3;
@end

@implementation CSDiagnosticReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setReporter:(id)a3
{
}

- (SDRDiagnosticReporter)reporter
{
  return self->_reporter;
}

- (void)submitDiagnosticReportWithType:(id)a3 withSubType:(id)a4 withSubTypeContext:(id)a5 withDuration:(double)a6 withContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __111__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withSubTypeContext_withDuration_withContext___block_invoke;
  v21[3] = &unk_1E6200630;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  double v26 = a6;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(queue, v21);
}

void __111__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withSubTypeContext_withDuration_withContext___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) reporter];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6 = [MEMORY[0x1E4F28F80] processInfo];
  v7 = [v6 processName];
  uint64_t v8 = [v2 signatureWithDomain:@"CoreSpeech" type:v3 subType:v4 subtypeContext:v5 detectedProcess:v7 triggerThresholdValues:0];

  v9 = [*(id *)(a1 + 32) reporter];
  double v10 = *(double *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 64);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __111__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withSubTypeContext_withDuration_withContext___block_invoke_2;
  v14[3] = &unk_1E62005E0;
  id v12 = (id)v8;
  id v15 = v12;
  LOBYTE(v8) = [v9 snapshotWithSignature:v12 duration:0 event:v11 payload:v14 reply:v10];

  if ((v8 & 1) == 0)
  {
    id v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v17 = "-[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withSubTypeContext:withDuration:withContex"
            "t:]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v12;
      _os_log_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed to send signature: %@", buf, 0x16u);
    }
  }
}

void __111__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withSubTypeContext_withDuration_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = getkSymptomDiagnosticReplySuccess();
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  int v6 = [v5 BOOLValue];

  v7 = (void *)CSLogContextFacilityCoreSpeech;
  BOOL v8 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      double v10 = v7;
      uint64_t v11 = getkSymptomDiagnosticReplySessionID();
      id v12 = [v3 objectForKeyedSubscript:v11];
      int v16 = 136315650;
      id v17 = "-[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withSubTypeContext:withDuration:withContex"
            "t:]_block_invoke_2";
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Auto bug captured for signature: %@ with sessionID: %@", (uint8_t *)&v16, 0x20u);
LABEL_6:
    }
  }
  else if (v8)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    double v10 = v7;
    uint64_t v11 = getkSymptomDiagnosticReplyReason();
    id v12 = [v3 objectForKeyedSubscript:v11];
    id v14 = getkSymptomDiagnosticReplyReasonString();
    id v15 = [v3 objectForKeyedSubscript:v14];
    int v16 = 136315906;
    id v17 = "-[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withSubTypeContext:withDuration:withContext:]_block_invoke";
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    v21 = v12;
    __int16 v22 = 2112;
    id v23 = v15;
    _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Auto bug capture dampened for signature: %@ with error code: %@ reason: %@", (uint8_t *)&v16, 0x2Au);

    goto LABEL_6;
  }
}

- (void)submitDiagnosticReportWithType:(id)a3 withSubType:(id)a4 withDuration:(double)a5 withContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withDuration_withContext___block_invoke;
  block[3] = &unk_1E6200608;
  block[4] = self;
  id v18 = v10;
  double v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

void __92__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withDuration_withContext___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) reporter];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [MEMORY[0x1E4F28F80] processInfo];
  int v6 = [v5 processName];
  uint64_t v7 = [v2 signatureWithDomain:@"CoreSpeech" type:v3 subType:v4 detectedProcess:v6 triggerThresholdValues:0];

  BOOL v8 = [*(id *)(a1 + 32) reporter];
  double v9 = *(double *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 56);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withDuration_withContext___block_invoke_2;
  v13[3] = &unk_1E62005E0;
  id v11 = (id)v7;
  id v14 = v11;
  LOBYTE(v7) = [v8 snapshotWithSignature:v11 duration:0 event:v10 payload:v13 reply:v9];

  if ((v7 & 1) == 0)
  {
    id v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Failed to send signature: %@", buf, 0x16u);
    }
  }
}

void __92__CSDiagnosticReporter_submitDiagnosticReportWithType_withSubType_withDuration_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = getkSymptomDiagnosticReplySuccess();
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  int v6 = [v5 BOOLValue];

  uint64_t v7 = (void *)CSLogContextFacilityCoreSpeech;
  BOOL v8 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = v7;
      id v11 = getkSymptomDiagnosticReplySessionID();
      id v12 = [v3 objectForKeyedSubscript:v11];
      int v16 = 136315650;
      __int16 v17 = "-[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:]_block_invoke_2";
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      double v21 = v12;
      _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Auto bug captured for signature: %@ with sessionID: %@", (uint8_t *)&v16, 0x20u);
LABEL_6:
    }
  }
  else if (v8)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v10 = v7;
    id v11 = getkSymptomDiagnosticReplyReason();
    id v12 = [v3 objectForKeyedSubscript:v11];
    id v14 = getkSymptomDiagnosticReplyReasonString();
    id v15 = [v3 objectForKeyedSubscript:v14];
    int v16 = 136315906;
    __int16 v17 = "-[CSDiagnosticReporter submitDiagnosticReportWithType:withSubType:withDuration:withContext:]_block_invoke";
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    double v21 = v12;
    __int16 v22 = 2112;
    id v23 = v15;
    _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Auto bug capture dampened for signature: %@ with error code: %@ reason: %@", (uint8_t *)&v16, 0x2Au);

    goto LABEL_6;
  }
}

- (void)submitASRIssueReport:(id)a3
{
}

- (void)submitSELFIssueReport:(id)a3
{
}

- (void)submitRemoteCoreSpeechIssueReport:(id)a3 context:(id)a4
{
}

- (void)submitSiriPowerIssueReport:(id)a3
{
}

- (void)submitUresIssueReport:(id)a3
{
}

- (void)submitEndpointerIssueReport:(id)a3 withContext:(id)a4
{
}

- (void)submitEndpointerIssueReport:(id)a3
{
}

- (void)submitVoiceTriggerIssueReport:(id)a3
{
}

- (void)submitAudioIssueReport:(id)a3 withError:(id)a4
{
  int v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v7 domain];
  uint64_t v10 = [v7 code];

  id v11 = [v6 stringWithFormat:@"%@.%ld", v9, v10];

  [(CSDiagnosticReporter *)self submitDiagnosticReportWithType:@"Audio" withSubType:v8 withSubTypeContext:v11 withDuration:0 withContext:10.0];
}

- (void)submitAudioIssueReport:(id)a3
{
}

- (void)submitVoiceIdIssueReport:(id)a3
{
}

- (void)submitTrialIssueReport:(id)a3
{
}

- (CSDiagnosticReporter)init
{
  if (+[CSUtils isDarwinOS]) {
    goto LABEL_10;
  }
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (!CSIsInternalBuild_isInternal)
  {
LABEL_10:
    uint64_t v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CSDiagnosticReporter;
    id v3 = [(CSDiagnosticReporter *)&v12 init];
    if (v3)
    {
      dispatch_queue_t v4 = dispatch_queue_create("CSDiagnosticReporter", 0);
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v4;

      uint64_t v14 = 0;
      id v15 = &v14;
      uint64_t v16 = 0x2050000000;
      int v6 = (void *)getSDRDiagnosticReporterClass_softClass;
      uint64_t v17 = getSDRDiagnosticReporterClass_softClass;
      if (!getSDRDiagnosticReporterClass_softClass)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __getSDRDiagnosticReporterClass_block_invoke;
        v13[3] = &unk_1E62010B0;
        void v13[4] = &v14;
        __getSDRDiagnosticReporterClass_block_invoke((uint64_t)v13);
        int v6 = (void *)v15[3];
      }
      id v7 = v6;
      _Block_object_dispose(&v14, 8);
      id v8 = (SDRDiagnosticReporter *)objc_alloc_init(v7);
      reporter = v3->_reporter;
      v3->_reporter = v8;
    }
    self = v3;
    uint64_t v10 = self;
  }

  return v10;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8880 != -1) {
    dispatch_once(&sharedInstance_onceToken_8880, &__block_literal_global_8881);
  }
  v2 = (void *)sharedInstance_sharedReporter;
  return v2;
}

uint64_t __38__CSDiagnosticReporter_sharedInstance__block_invoke()
{
  sharedInstance_sharedReporter = objc_alloc_init(CSDiagnosticReporter);
  return MEMORY[0x1F41817F8]();
}

@end