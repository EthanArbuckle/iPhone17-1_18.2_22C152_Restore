@interface ACDAutoBugCapture
+ (void)triggerAutoBugCaptureWithType:(id)a3 subType:(id)a4 subtypeContext:(id)a5 detectedProcess:(id)a6;
@end

@implementation ACDAutoBugCapture

+ (void)triggerAutoBugCaptureWithType:(id)a3 subType:(id)a4 subtypeContext:(id)a5 detectedProcess:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess__onceToken != -1) {
    dispatch_once(&triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess__onceToken, &__block_literal_global_13);
  }
  v13 = (void *)triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess__diagnosticReporter;
  if (v12)
  {
    v14 = [(id)triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess__diagnosticReporter signatureWithDomain:@"Accounts" type:v9 subType:v10 subtypeContext:v11 detectedProcess:v12 triggerThresholdValues:0];
  }
  else
  {
    v15 = [MEMORY[0x263F08AB0] processInfo];
    v16 = [v15 processName];
    v14 = [v13 signatureWithDomain:@"Accounts" type:v9 subType:v10 subtypeContext:v11 detectedProcess:v16 triggerThresholdValues:0];
  }
  char v17 = [(id)triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess__diagnosticReporter snapshotWithSignature:v14 duration:0 event:0 payload:&__block_literal_global_20 reply:15.0];
  v18 = _ACDLogSystem();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      int v21 = 138412290;
      v22 = v14;
      v20 = "\"Diagnostic Reporter sent snapshot for signature %@\"";
LABEL_11:
      _os_log_impl(&dword_2183AD000, v18, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v21, 0xCu);
    }
  }
  else if (v19)
  {
    int v21 = 138412290;
    v22 = v14;
    v20 = "\"Diagnostic Reporter failed to send snapshot for signature %@\"";
    goto LABEL_11;
  }
}

uint64_t __90__ACDAutoBugCapture_triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess___block_invoke()
{
  triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess__diagnosticReporter = (uint64_t)objc_alloc_init(MEMORY[0x263F7C080]);

  return MEMORY[0x270F9A758]();
}

void __90__ACDAutoBugCapture_triggerAutoBugCaptureWithType_subType_subtypeContext_detectedProcess___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = _ACDLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_2183AD000, v3, OS_LOG_TYPE_DEFAULT, "\"Received response from Diagnostic Reporter - %@\"", (uint8_t *)&v4, 0xCu);
  }
}

@end