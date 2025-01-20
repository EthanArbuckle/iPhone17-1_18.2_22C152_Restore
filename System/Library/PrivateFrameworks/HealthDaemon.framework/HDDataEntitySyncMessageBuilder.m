@interface HDDataEntitySyncMessageBuilder
@end

@implementation HDDataEntitySyncMessageBuilder

uint64_t __68___HDDataEntitySyncMessageBuilder__addEntity_row_anchor_provenance___block_invoke(void *a1, void *a2, unint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  uint64_t v9 = a1[4];
  if ((int64_t)(*(void *)(v9 + 80) + a3) > *(void *)(v9 + 64))
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 1;
    uint64_t v9 = a1[4];
    if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
    {
      if (*(unsigned char *)(v9 + 112))
      {
        uint64_t v22 = 1;
        goto LABEL_47;
      }
    }
  }
  uint64_t v10 = *(void *)(v9 + 88);
  BOOL v11 = *(uint64_t *)(v9 + 104) >= 1 && a1[8] != *(void *)(v9 + 96);
  int v12 = (int64_t)(v10 + a3) > *(void *)(v9 + 72) || v11;
  BOOL v13 = v12 != 1 || v10 < 1;
  v38 = a5;
  if (v13)
  {
    uint64_t v14 = 0;
  }
  else
  {
    id v40 = 0;
    char v15 = -[_HDDataEntitySyncMessageBuilder _sendCurrentCollectionIsFinal:error:](v9, 0, (uint64_t)&v40);
    id v16 = v40;
    v17 = v16;
    uint64_t v18 = 0;
    uint64_t v19 = a1[4];
    if (a1[8] == *(void *)(v19 + 96)) {
      uint64_t v18 = *(void *)(v19 + 104) + 1;
    }
    *(void *)(v19 + 104) = v18;
    if (v15)
    {
      uint64_t v14 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v20 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = a1[4];
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v37;
        __int16 v43 = 2114;
        v44 = v17;
        _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@: failed to send current collection: %{public}@", buf, 0x16u);
      }
      id v21 = v17;
      if (v21)
      {
        if (a5) {
          *a5 = v21;
        }
        else {
          _HKLogDroppedError();
        }
      }

      uint64_t v14 = 2;
    }

    uint64_t v9 = a1[4];
  }
  uint64_t v23 = a1[8];
  v24 = (void *)a1[5];
  id v39 = 0;
  id v25 = v8;
  id v26 = v24;
  if (v9)
  {
    v27 = *(void **)(v9 + 16);
    v28 = [*(id *)(v9 + 32) codableObjectCollectionForProvenance:v26 profile:*(void *)(v9 + 8)];
    LOBYTE(v27) = [v27 addCodableObject:v25 toCollection:v28];

    if ((v27 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v39, 100, @"Failed to add codable representation to object collection");
      int v30 = 0;
      uint64_t v29 = 2;
      goto LABEL_34;
    }
    uint64_t v29 = 0;
    *(int64x2_t *)(v9 + 80) = vaddq_s64(*(int64x2_t *)(v9 + 80), vdupq_n_s64(a3));
    *(void *)(v9 + 96) = v23;
  }
  else
  {
    uint64_t v29 = 0;
  }
  int v30 = 1;
LABEL_34:

  id v31 = v39;
  if (v30)
  {
    *(unsigned char *)(a1[4] + 112) = 1;
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  else
  {
    _HKInitializeLogging();
    v32 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = a1[4];
      v36 = (void *)a1[8];
      *(_DWORD *)buf = 138543874;
      uint64_t v42 = v35;
      __int16 v43 = 2048;
      v44 = v36;
      __int16 v45 = 2114;
      id v46 = v31;
      _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "%{public}@: failed to add codable representation for anchor %lld: %{public}@", buf, 0x20u);
    }
    id v33 = v31;
    if (v33)
    {
      if (v38) {
        void *v38 = v33;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  if (v14) {
    uint64_t v22 = v14;
  }
  else {
    uint64_t v22 = v29;
  }

LABEL_47:
  return v22;
}

@end