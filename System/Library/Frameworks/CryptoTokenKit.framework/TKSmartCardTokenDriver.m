@interface TKSmartCardTokenDriver
- (id)createTokenWithSlot:(id)a3 AID:(id)a4 error:(id *)a5;
@end

@implementation TKSmartCardTokenDriver

- (id)createTokenWithSlot:(id)a3 AID:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__3;
  v38 = __Block_byref_object_dispose__3;
  id v39 = 0;
  v10 = [[TKSmartCardSlot alloc] initWithEndpoint:v8 error:a5];
  if (v10)
  {
    v11 = TK_LOG_token_1();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [(TKSmartCardSlot *)v10 name];
      -[TKSmartCardTokenDriver createTokenWithSlot:AID:error:](v12, (uint64_t)v9, v48, v11);
    }

    v13 = [(TKTokenDriver *)self delegate];
    v14 = [(TKSmartCardSlot *)v10 makeSmartCard];
    v15 = v14;
    if (v9)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __56__TKSmartCardTokenDriver_createTokenWithSlot_AID_error___block_invoke;
      v28[3] = &unk_1E63C8A88;
      id v29 = v14;
      id v30 = v9;
      v33 = &v34;
      id v31 = v13;
      v32 = self;
      [v29 inSessionWithError:a5 executeBlock:v28];

      id v16 = v29;
    }
    else
    {
      uint64_t v17 = [v13 tokenDriver:self createTokenForSmartCard:v14 AID:0 error:a5];
      id v16 = (id)v35[5];
      v35[5] = v17;
    }

    if (v35[5])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"SmartCard driver created token not inherited from TKSmartCardToken class (token %@)", v35[5] format];
      }
      v18 = [(id)v35[5] tokenDriver];
      v19 = [v18 keepAlive];
      [(id)v35[5] setKeepAlive:v19];
    }
    else
    {
      v22 = TK_LOG_token_1();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = [(TKSmartCardSlot *)v10 name];
        v26 = (void *)v25;
        if (a5) {
          id v27 = *a5;
        }
        else {
          id v27 = 0;
        }
        *(_DWORD *)buf = 138543874;
        uint64_t v43 = v25;
        __int16 v44 = 2114;
        id v45 = v9;
        __int16 v46 = 2114;
        id v47 = v27;
        _os_log_error_impl(&dword_1BED55000, v22, OS_LOG_TYPE_ERROR, "failed to create token in slot %{public}@ (AID:%{public}@, error:%{public}@)", buf, 0x20u);
      }
      if (!a5) {
        goto LABEL_12;
      }
      v23 = (void *)MEMORY[0x1E4F28C58];
      id v24 = *a5;
      if (*a5)
      {
        uint64_t v40 = *MEMORY[0x1E4F28A50];
        id v41 = v24;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      }
      else
      {
        v18 = 0;
      }
      *a5 = [v23 errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:v18];
      if (!v24) {
        goto LABEL_12;
      }
    }

LABEL_12:
  }
  id v20 = (id)v35[5];

  _Block_object_dispose(&v34, 8);

  return v20;
}

uint64_t __56__TKSmartCardTokenDriver_createTokenWithSlot_AID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) selectApplication:*(void *)(a1 + 40) error:a2])
  {
    uint64_t v4 = [*(id *)(a1 + 48) tokenDriver:*(void *)(a1 + 56) createTokenForSmartCard:*(void *)(a1 + 32) AID:*(void *)(a1 + 40) error:a2];
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  return 1;
}

- (void)createTokenWithSlot:(uint8_t *)buf AID:(os_log_t)log error:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1BED55000, log, OS_LOG_TYPE_DEBUG, "create token for token in %{public}@ (AID:%{public}@)", buf, 0x16u);
}

@end