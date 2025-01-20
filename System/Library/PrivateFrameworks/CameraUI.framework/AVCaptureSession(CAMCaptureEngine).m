@interface AVCaptureSession(CAMCaptureEngine)
- (BOOL)cam_hasAddedInput:()CAMCaptureEngine;
- (BOOL)cam_hasAddedOutput:()CAMCaptureEngine;
- (uint64_t)cam_ensureControls:()CAMCaptureEngine;
- (uint64_t)cam_ensureInputs:()CAMCaptureEngine;
- (uint64_t)cam_ensureInputs:()CAMCaptureEngine exclusively:;
- (uint64_t)cam_ensureOutputs:()CAMCaptureEngine exclusively:;
- (uint64_t)cam_ensureOutputs:()CAMCaptureEngine whileRemoving:;
- (void)cam_removeAllInputs;
- (void)cam_removeAllOutputs;
- (void)cam_removeInputs:()CAMCaptureEngine;
@end

@implementation AVCaptureSession(CAMCaptureEngine)

- (void)cam_removeInputs:()CAMCaptureEngine
{
  id v4 = a3;
  v5 = [a1 inputs];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__AVCaptureSession_CAMCaptureEngine__cam_removeInputs___block_invoke;
  v7[3] = &unk_263FA57E8;
  id v8 = v4;
  v9 = a1;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (uint64_t)cam_ensureInputs:()CAMCaptureEngine
{
  return objc_msgSend(a1, "cam_ensureInputs:exclusively:", a3, 0);
}

- (uint64_t)cam_ensureOutputs:()CAMCaptureEngine whileRemoving:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  id v8 = (void *)[v6 mutableCopy];
  v9 = [a1 outputs];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __70__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_whileRemoving___block_invoke;
  v17[3] = &unk_263FA6E60;
  id v10 = v6;
  id v18 = v10;
  id v11 = v8;
  id v19 = v11;
  id v12 = v7;
  id v20 = v12;
  v21 = a1;
  [v9 enumerateObjectsUsingBlock:v17];
  if ([v11 count])
  {
    v13 = (void *)[v11 copy];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __70__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_whileRemoving___block_invoke_2;
    v16[3] = &unk_263FA6E38;
    v16[4] = a1;
    v16[5] = &v22;
    [v13 enumerateObjectsUsingBlock:v16];
  }
  uint64_t v14 = *((unsigned __int8 *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v14;
}

- (BOOL)cam_hasAddedInput:()CAMCaptureEngine
{
  id v4 = a3;
  v5 = [a1 inputs];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__AVCaptureSession_CAMCaptureEngine__cam_hasAddedInput___block_invoke;
  v9[3] = &unk_263FA6D70;
  id v10 = v4;
  id v6 = v4;
  BOOL v7 = [v5 indexOfObjectPassingTest:v9] != 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (uint64_t)cam_ensureInputs:()CAMCaptureEngine exclusively:
{
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  BOOL v7 = (void *)[v6 mutableCopy];
  id v8 = [a1 inputs];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__AVCaptureSession_CAMCaptureEngine__cam_ensureInputs_exclusively___block_invoke;
  v15[3] = &unk_263FA6D98;
  id v9 = v6;
  id v16 = v9;
  id v10 = v7;
  char v19 = a4;
  id v17 = v10;
  id v18 = a1;
  [v8 enumerateObjectsUsingBlock:v15];
  if ([v10 count])
  {
    id v11 = (void *)[v10 copy];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __67__AVCaptureSession_CAMCaptureEngine__cam_ensureInputs_exclusively___block_invoke_2;
    v14[3] = &unk_263FA6DC0;
    v14[4] = a1;
    v14[5] = &v20;
    [v11 enumerateObjectsUsingBlock:v14];
  }
  uint64_t v12 = *((unsigned __int8 *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v12;
}

- (void)cam_removeAllInputs
{
  v2 = [a1 inputs];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__AVCaptureSession_CAMCaptureEngine__cam_removeAllInputs__block_invoke;
  v3[3] = &unk_263FA6DE8;
  v3[4] = a1;
  [v2 enumerateObjectsUsingBlock:v3];
}

- (BOOL)cam_hasAddedOutput:()CAMCaptureEngine
{
  id v4 = a3;
  v5 = [a1 outputs];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__AVCaptureSession_CAMCaptureEngine__cam_hasAddedOutput___block_invoke;
  v9[3] = &unk_263FA5BA0;
  id v10 = v4;
  id v6 = v4;
  BOOL v7 = [v5 indexOfObjectPassingTest:v9] != 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (uint64_t)cam_ensureOutputs:()CAMCaptureEngine exclusively:
{
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  BOOL v7 = (void *)[v6 mutableCopy];
  id v8 = [a1 outputs];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_exclusively___block_invoke;
  v15[3] = &unk_263FA6E10;
  id v9 = v6;
  id v16 = v9;
  id v10 = v7;
  char v19 = a4;
  id v17 = v10;
  id v18 = a1;
  [v8 enumerateObjectsUsingBlock:v15];
  if ([v10 count])
  {
    id v11 = (void *)[v10 copy];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__AVCaptureSession_CAMCaptureEngine__cam_ensureOutputs_exclusively___block_invoke_2;
    v14[3] = &unk_263FA6E38;
    v14[4] = a1;
    v14[5] = &v20;
    [v11 enumerateObjectsUsingBlock:v14];
  }
  uint64_t v12 = *((unsigned __int8 *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v12;
}

- (void)cam_removeAllOutputs
{
  v2 = [a1 outputs];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__AVCaptureSession_CAMCaptureEngine__cam_removeAllOutputs__block_invoke;
  v3[3] = &unk_263FA6E88;
  v3[4] = a1;
  [v2 enumerateObjectsUsingBlock:v3];
}

- (uint64_t)cam_ensureControls:()CAMCaptureEngine
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v5 = [a1 controls];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        [a1 removeControl:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v7);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v22;
    char v15 = 1;
    *(void *)&long long v12 = 138543362;
    long long v20 = v12;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * j);
        if (objc_msgSend(a1, "canAddControl:", v17, v20, (void)v21))
        {
          [a1 addControl:v17];
        }
        else
        {
          id v18 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            uint64_t v30 = v17;
            _os_log_error_impl(&dword_2099F8000, v18, OS_LOG_TYPE_ERROR, "Failed to add control %{public}@", buf, 0xCu);
          }

          char v15 = 0;
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v13);
  }
  else
  {
    char v15 = 1;
  }

  return v15 & 1;
}

@end