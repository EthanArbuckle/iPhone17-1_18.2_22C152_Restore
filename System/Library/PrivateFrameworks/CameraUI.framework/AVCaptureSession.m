@interface AVCaptureSession
@end

@implementation AVCaptureSession

BOOL __56__AVCaptureSession_CAMCaptureEngine__cam_hasAddedInput___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

void __67__AVCaptureSession_CAMCaptureEngine__cam_ensureInputs_exclusively___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    [*(id *)(a1 + 40) removeObject:v4];
  }
  else
  {
    v3 = v4;
    if (!*(unsigned char *)(a1 + 56)) {
      goto LABEL_6;
    }
    [*(id *)(a1 + 48) removeInput:v4];
  }
  v3 = v4;
LABEL_6:
}

void __67__AVCaptureSession_CAMCaptureEngine__cam_ensureInputs_exclusively___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_8;
  }
  if (![*(id *)(a1 + 32) canAddInput:v3])
  {
    id v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__AVCaptureSession_CAMCaptureEngine__cam_ensureInputs_exclusively___block_invoke_2_cold_1((uint64_t)v3, (uint64_t *)(a1 + 32), v4);
    }

    goto LABEL_7;
  }
  [*(id *)(a1 + 32) addInput:v3];
LABEL_8:
}

uint64_t __57__AVCaptureSession_CAMCaptureEngine__cam_removeAllInputs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeInput:a2];
}

void __55__AVCaptureSession_CAMCaptureEngine__cam_removeInputs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:")) {
    [*(id *)(a1 + 40) removeInput:v3];
  }
}

BOOL __57__AVCaptureSession_CAMCaptureEngine__cam_hasAddedOutput___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

void __68__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_exclusively___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    [*(id *)(a1 + 40) removeObject:v4];
  }
  else
  {
    id v3 = v4;
    if (!*(unsigned char *)(a1 + 56)) {
      goto LABEL_6;
    }
    [*(id *)(a1 + 48) removeOutput:v4];
  }
  id v3 = v4;
LABEL_6:
}

void __68__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_exclusively___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_8;
  }
  if (![*(id *)(a1 + 32) canAddOutput:v3])
  {
    id v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_exclusively___block_invoke_2_cold_1((uint64_t)v3, v4);
    }

    goto LABEL_7;
  }
  [*(id *)(a1 + 32) addOutput:v3];
LABEL_8:
}

void __70__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_whileRemoving___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(a1[4], "containsObject:"))
  {
    [a1[5] removeObject:v3];
  }
  else if ([a1[6] containsObject:v3])
  {
    [a1[7] removeOutput:v3];
  }
}

void __70__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_whileRemoving___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_8;
  }
  if (![*(id *)(a1 + 32) canAddOutput:v3])
  {
    id v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_exclusively___block_invoke_2_cold_1((uint64_t)v3, v4);
    }

    goto LABEL_7;
  }
  [*(id *)(a1 + 32) addOutput:v3];
LABEL_8:
}

uint64_t __58__AVCaptureSession_CAMCaptureEngine__cam_removeAllOutputs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeOutput:a2];
}

void __67__AVCaptureSession_CAMCaptureEngine__cam_ensureInputs_exclusively___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Failed to add input %{public}@ to session %{public}@", (uint8_t *)&v4, 0x16u);
}

void __68__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_exclusively___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Failed to add output %{public}@", (uint8_t *)&v2, 0xCu);
}

@end