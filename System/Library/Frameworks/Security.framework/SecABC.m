@interface SecABC
+ (void)triggerAutoBugCaptureWithType:(id)a3 subType:(id)a4;
+ (void)triggerAutoBugCaptureWithType:(id)a3 subType:(id)a4 subtypeContext:(id)a5 domain:(id)a6 events:(id)a7 payload:(id)a8 detectedProcess:(id)a9;
@end

@implementation SecABC

+ (void)triggerAutoBugCaptureWithType:(id)a3 subType:(id)a4 subtypeContext:(id)a5 domain:(id)a6 events:(id)a7 payload:(id)a8 detectedProcess:(id)a9
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v27 = a7;
  id v18 = a8;
  id v19 = a9;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2114;
    v37 = v16;
    _os_log_impl(&dword_18B299000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "TriggerABC for %{public}@/%{public}@/%{public}@", buf, 0x20u);
  }
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  v20 = (void *)getSDRDiagnosticReporterClass_softClass;
  uint64_t v35 = getSDRDiagnosticReporterClass_softClass;
  if (!getSDRDiagnosticReporterClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getSDRDiagnosticReporterClass_block_invoke;
    v37 = &unk_1E5484FA0;
    v38 = &v32;
    __getSDRDiagnosticReporterClass_block_invoke((uint64_t)buf);
    v20 = (void *)v33[3];
  }
  v21 = v20;
  _Block_object_dispose(&v32, 8);
  if (v21)
  {
    id v22 = objc_alloc_init(v21);
    v23 = v22;
    if (v19)
    {
      v24 = [v22 signatureWithDomain:v17 type:v14 subType:v15 subtypeContext:v16 detectedProcess:v19 triggerThresholdValues:0];
    }
    else
    {
      v25 = [MEMORY[0x1E4F28F80] processInfo];
      v26 = [v25 processName];
      v24 = [v23 signatureWithDomain:v17 type:v14 subType:v15 subtypeContext:v16 detectedProcess:v26 triggerThresholdValues:0];
    }
    if (v24)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __101__SecABC_triggerAutoBugCaptureWithType_subType_subtypeContext_domain_events_payload_detectedProcess___block_invoke;
      v28[3] = &unk_1E5477400;
      id v29 = v14;
      id v30 = v15;
      id v31 = v16;
      [v23 snapshotWithSignature:v24 delay:v27 events:v18 payload:0 actions:v28 reply:5.0];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B299000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "TriggerABC signature generation failed", buf, 2u);
    }
  }
}

void __101__SecABC_triggerAutoBugCaptureWithType_subType_subtypeContext_domain_events_payload_detectedProcess___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    int v7 = 138544130;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = a2;
    _os_log_impl(&dword_18B299000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Received response from Diagnostic Reporter - %{public}@/%{public}@/%{public}@: %{public}@", (uint8_t *)&v7, 0x2Au);
  }
}

+ (void)triggerAutoBugCaptureWithType:(id)a3 subType:(id)a4
{
}

@end