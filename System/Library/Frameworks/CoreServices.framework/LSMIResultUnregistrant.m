@interface LSMIResultUnregistrant
- (LSMIResultUnregistrant)initWithContext:(id)a3 operationUUID:(id)a4 bundleIdentifier:(id)a5 precondition:(id)a6 type:(unsigned int)a7;
- (void)runWithCompletion:(id)a3;
@end

@implementation LSMIResultUnregistrant

- (LSMIResultUnregistrant)initWithContext:(id)a3 operationUUID:(id)a4 bundleIdentifier:(id)a5 precondition:(id)a6 type:(unsigned int)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)LSMIResultUnregistrant;
  v17 = [(LSMIResultUnregistrant *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_strategy, a3);
    objc_storeStrong((id *)&v18->_uuid, a4);
    uint64_t v19 = [v15 copy];
    bundleID = v18->_bundleID;
    v18->_bundleID = (NSString *)v19;

    if (v16)
    {
      v21 = (LSPrecondition *)v16;
    }
    else
    {
      v21 = +[LSPrecondition emptyPrecondition];
    }
    precondition = v18->_precondition;
    v18->_precondition = v21;

    v18->_type = a7;
  }

  return v18;
}

- (void)runWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  v5 = [(LSMIResultRegistrantStrategy *)self->_strategy preUnregistrationContextForBundleIdentifier:self->_bundleID];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__49;
  v28 = __Block_byref_object_dispose__49;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__49;
  v22 = __Block_byref_object_dispose__49;
  id v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__135;
  v16[4] = __Block_byref_object_dispose__136;
  id v17 = 0;
  [(LSMIResultRegistrantStrategy *)self->_strategy beginModificationOperation];
  strategy = self->_strategy;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__LSMIResultUnregistrant_runWithCompletion___block_invoke;
  v15[3] = &unk_1E5230D10;
  v15[4] = self;
  v15[5] = &v24;
  v15[6] = v16;
  v15[7] = &v18;
  [(LSMIResultRegistrantStrategy *)strategy runSyncBlockInWriteContext:v15];
  v7 = registrationCleanupQueue();
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __44__LSMIResultUnregistrant_runWithCompletion___block_invoke_2;
  v12 = &unk_1E522DAF8;
  id v14 = v16;
  id v8 = v5;
  id v13 = v8;
  dispatch_async(v7, &v9);

  _LSLogStepFinished(6, v25[5] == 0, self->_bundleID, &cfstr_UnregisterBund_0.isa, v9, v10, v11, v12);
  v4[2](v4, v19[5], v25[5]);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
}

void __44__LSMIResultUnregistrant_runWithCompletion___block_invoke(void *a1, void *a2)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _LSLogStepStart(6, 0, *(NSString **)(a1[4] + 24), &cfstr_UnregisterBund.isa);
  uint64_t v4 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v4 + 40);
  v5 = [v3 databaseContextWithError:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    uint64_t v6 = *(void *)(a1[5] + 8);
    uint64_t v9 = *(void **)(v6 + 40);
    v7 = (id *)(v6 + 40);
    id v8 = v9;
    id v10 = *(id *)(a1[4] + 32);
    if ([v10 isMet])
    {

      objc_storeStrong(v7, v8);
      uint64_t v11 = a1[4];
      uint64_t v12 = *(void *)(v11 + 24);
      uint64_t v13 = *(unsigned int *)(v11 + 40);
      uint64_t v14 = *(void *)(a1[5] + 8);
      id v33 = *(id *)(v14 + 40);
      uint64_t v15 = [v5 unregisterApplicationWithBundleIdentifier:v12 type:v13 error:&v33];
      objc_storeStrong((id *)(v14 + 40), v33);
      uint64_t v16 = *(void *)(a1[6] + 8);
      id v17 = *(NSObject **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }
    else
    {
      uint64_t v18 = [NSString stringWithFormat:@"Precondition not met: %@", v10];
      v36[0] = *MEMORY[0x1E4F28228];
      *(void *)buf = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v36 count:1];
      uint64_t v20 = _LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", 117, (uint64_t)"validatePrecondition", 324, v19);
      id v21 = v20;

      objc_storeStrong(v7, v20);
      id v17 = _LSInstallLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1[4] + 32);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v22;
        _os_log_impl(&dword_182959000, v17, OS_LOG_TYPE_DEFAULT, "Unregistration precondition not met: %@", buf, 0xCu);
      }
    }

    [*(id *)(a1[4] + 8) endModificationOperation];
    uint64_t v23 = a1[4];
    if (*(void *)(*(void *)(a1[6] + 8) + 40))
    {
      id v24 = *(id *)(v23 + 24);
      v25 = [[_LSDModificationPendingSaveToken alloc] initWithUUID:*(void *)(a1[4] + 16)];
      uint64_t v26 = *(void *)(a1[7] + 8);
      v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __44__LSMIResultUnregistrant_runWithCompletion___block_invoke_140;
      v30[3] = &unk_1E5230CE8;
      id v28 = v24;
      uint64_t v29 = a1[7];
      id v31 = v28;
      uint64_t v32 = v29;
      [v3 armSaveTimerIfNecessary:v30];
    }
    else
    {
      [*(id *)(v23 + 8) flushModificationState];
    }
  }
}

void __44__LSMIResultUnregistrant_runWithCompletion___block_invoke_140(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = _LSInstallLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v12 = 138412802;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "Save after unregistration for %@ attempted: %d save error: %@", (uint8_t *)&v12, 0x1Cu);
  }

  id v9 = v6;
  id v10 = v9;
  if ((a2 & 1) == 0)
  {
    uint64_t v11 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 89, (uint64_t)"-[LSMIResultUnregistrant runWithCompletion:]_block_invoke", 354, 0);

    id v10 = (void *)v11;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) saveDidHappen:v10 == 0 error:v10];
}

uint64_t __44__LSMIResultUnregistrant_runWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precondition, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_strategy, 0);
}

@end