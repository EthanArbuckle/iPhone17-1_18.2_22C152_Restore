@interface CLSFaceIdentificationOnDemand
- (id)requestIdentificationOfFaces:(id)a3 error:(id *)a4;
@end

@implementation CLSFaceIdentificationOnDemand

- (id)requestIdentificationOfFaces:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F744E8] analysisService];
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3483;
  v31 = __Block_byref_object_dispose__3484;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3483;
  v25 = __Block_byref_object_dispose__3484;
  id v26 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__CLSFaceIdentificationOnDemand_requestIdentificationOfFaces_error___block_invoke;
  v17[3] = &unk_1E690FA98;
  v19 = &v27;
  v20 = &v21;
  v8 = v7;
  v18 = v8;
  v9 = (void *)MEMORY[0x1D2602540](v17);
  uint64_t v10 = [v6 requestIdentificationOfFaces:v5 withCompletionHandler:v9];
  if (v10)
  {
    dispatch_time_t v11 = dispatch_time(0, 60000000000);
    if (!dispatch_group_wait(v8, v11)) {
      goto LABEL_6;
    }
    [v6 cancelRequest:v10];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 101);
  }
  else
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 100);
  }
  v13 = (void *)v28[5];
  v28[5] = v12;

LABEL_6:
  if (a4) {
    *a4 = (id) v28[5];
  }
  v14 = (void *)v22[5];
  if (!v14) {
    v14 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v15 = v14;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

void __68__CLSFaceIdentificationOnDemand_requestIdentificationOfFaces_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v7;
      _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[CLSMediaAnalysisHelper] -requestIdentificationOfFaces:withCompletionHandler: returned error: %@", (uint8_t *)&v8, 0xCu);
      if (!v6) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  if (v6) {
LABEL_4:
  }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
LABEL_5:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end