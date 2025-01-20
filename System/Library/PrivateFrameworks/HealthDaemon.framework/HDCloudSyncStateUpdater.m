@interface HDCloudSyncStateUpdater
+ (BOOL)persistDataWithStateStore:(id)a3 delegate:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)updateDataWithStateStore:(id)a3 delegate:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (id)_descriptionForDelegate:(uint64_t)a1;
+ (uint64_t)_fetchCloudState:(void *)a3 codableSyncState:(void *)a4 stateStore:(void *)a5 profile:(void *)a6 delegate:(HDCodableSyncState *)a7 error:;
+ (uint64_t)_persistCloudState:(void *)a3 delegate:(void *)a4 profile:(void *)a5 error:;
- (HDCloudSyncStateUpdater)init;
@end

@implementation HDCloudSyncStateUpdater

- (HDCloudSyncStateUpdater)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (BOOL)updateDataWithStateStore:(id)a3 delegate:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v10 = v19;
  id v11 = v18;
  id v12 = v17;
  id v13 = v16;
  char v14 = HKWithAutoreleasePool();

  return v14;
}

uint64_t __87__HDCloudSyncStateUpdater_updateDataWithStateStore_delegate_profile_transaction_error___block_invoke(uint64_t a1, HDCodableSyncState **a2)
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  uint64_t v10 = self;
  id v101 = 0;
  id v102 = 0;
  char v11 = [v7 fetchLocalState:&v102 profile:v8 transaction:v9 error:&v101];
  id v12 = v102;
  id v13 = v101;
  if (v11)
  {
    id v99 = 0;
    id v100 = 0;
    uint64_t v14 = +[HDCloudSyncStateUpdater _fetchCloudState:codableSyncState:stateStore:profile:delegate:error:](v10, (uint64_t)&v100, &v99, v6, v8, v7, a2);
    v15 = (HDCodableSyncState *)v100;
    id v16 = v99;
    if (!v14)
    {
      uint64_t v17 = 0;
      goto LABEL_54;
    }
    if (v14 == 2)
    {
      uint64_t v17 = 1;
LABEL_54:

      goto LABEL_55;
    }
    id v83 = v13;
    id v20 = v6;
    id v86 = v16;
    v21 = v15;
    id v22 = v12;
    id v94 = v8;
    id v89 = v9;
    id v97 = v7;
    id v92 = v22;
    id v85 = v12;
    v87 = v21;
    uint64_t v77 = self;
    if (v22)
    {
      if (v21)
      {
        id v104 = 0;
        id v103 = 0;
        unint64_t v23 = [v97 shouldUpdateWithMergedState:&v104 cloudState:v21 localState:v22 profile:v94 transaction:v89 error:&v103];
        id v24 = v104;
        id v75 = v103;
        id v6 = v20;
        v81 = a2;
        if (v23)
        {
          _HKInitializeLogging();
          v72 = (void *)*MEMORY[0x1E4F29FA8];
          BOOL v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
          id v13 = v83;
          if (v24)
          {
            if (v25)
            {
              id v73 = v24;
              v26 = v72;
              v78 = +[HDCloudSyncStateUpdater _descriptionForDelegate:](v77, v97);
              uint64_t v27 = HKStringFromStateSyncMergeResult(v23);
              *(_DWORD *)buf = 138543618;
              v106 = v78;
              __int16 v107 = 2114;
              uint64_t v108 = v27;
              v28 = (void *)v27;
              _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ merge result \"%{public}@\"", buf, 0x16u);

              id v24 = v73;
            }
            v29 = v24;
            v30 = (HDCodableSyncState *)v24;
            goto LABEL_42;
          }
          id v74 = 0;
          if (v25)
          {
            v44 = v72;
            v45 = +[HDCloudSyncStateUpdater _descriptionForDelegate:](v77, v97);
            *(_DWORD *)buf = 138543362;
            v106 = v45;
            _os_log_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ merge state is nil, no update required", buf, 0xCu);
          }
          v30 = 0;
          unint64_t v23 = 1;
        }
        else
        {
          id v74 = v24;
          _HKInitializeLogging();
          v40 = (void *)*MEMORY[0x1E4F29FA8];
          id v13 = v83;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            v67 = v40;
            v68 = +[HDCloudSyncStateUpdater _descriptionForDelegate:](v77, v97);
            *(_DWORD *)buf = 138543618;
            v106 = v68;
            __int16 v107 = 2114;
            uint64_t v108 = (uint64_t)v75;
            _os_log_error_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_ERROR, "%{public}@ merge error: %{public}@", buf, 0x16u);
          }
          id v41 = v75;
          if (v41)
          {
            if (a2) {
              *a2 = (HDCodableSyncState *)v41;
            }
            else {
              _HKLogDroppedError();
            }
          }

          v30 = 0;
          unint64_t v23 = 0;
        }
        v29 = v74;
LABEL_42:

        a2 = v81;
        goto LABEL_43;
      }
      _HKInitializeLogging();
      v35 = (void *)*MEMORY[0x1E4F29FA8];
      id v6 = v20;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v36 = v35;
        v37 = +[HDCloudSyncStateUpdater _descriptionForDelegate:](v77, v97);
        *(_DWORD *)buf = 138543362;
        v106 = v37;
        _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ local state not nil and cloud state is nil, update cloud state", buf, 0xCu);
      }
      v30 = (HDCodableSyncState *)v92;
      unint64_t v23 = 3;
      id v13 = v83;
    }
    else
    {
      v82 = a2;
      _HKInitializeLogging();
      v31 = (void *)*MEMORY[0x1E4F29FA8];
      BOOL v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT);
      id v6 = v20;
      if (v21)
      {
        if (v32)
        {
          v33 = v31;
          v34 = +[HDCloudSyncStateUpdater _descriptionForDelegate:](v77, v97);
          *(_DWORD *)buf = 138543362;
          v106 = v34;
          _os_log_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ local state nil and cloud state not nil, persist cloud state", buf, 0xCu);
        }
        v30 = v87;
        unint64_t v23 = 2;
      }
      else
      {
        if (v32)
        {
          v42 = v31;
          v43 = +[HDCloudSyncStateUpdater _descriptionForDelegate:](v77, v97);
          *(_DWORD *)buf = 138543362;
          v106 = v43;
          _os_log_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ local state and cloud state are nil, no merge required", buf, 0xCu);
        }
        v30 = 0;
        unint64_t v23 = 1;
      }
      a2 = v82;
      id v13 = v83;
    }
LABEL_43:

    v46 = v30;
    if (v23)
    {
      if (v23 == 1)
      {
LABEL_50:
        uint64_t v17 = 1;
LABEL_52:
        id v12 = v85;
LABEL_53:

        id v16 = v86;
        goto LABEL_54;
      }
      if ((v23 & 0xFFFFFFFFFFFFFFFELL) != 2
        || +[HDCloudSyncStateUpdater _persistCloudState:delegate:profile:error:](v10, v46, v97, v94, a2))
      {
        if (v23 == 3)
        {
          id v93 = v6;
          id v47 = v86;
          id v98 = v97;
          id v95 = v94;
          v84 = v46;
          v48 = v46;
          id v88 = v47;
          uint64_t v79 = self;
          if (v47)
          {
            v49 = (HDCodableSyncState *)v47;
          }
          else
          {
            v90 = v48;
            id v51 = v98;
            self;
            v49 = objc_alloc_init(HDCodableSyncState);
            v52 = [v51 domain];
            [(HDCodableSyncState *)v49 setDomain:v52];

            v53 = [v51 key];

            v48 = v90;
            [(HDCodableSyncState *)v49 setKey:v53];
          }
          v91 = v49;
          -[HDCodableSyncState setVersionRange:](v49, "setVersionRange:", [v98 supportedSyncVersionRange]);
          id v104 = 0;
          char v54 = [v98 updateCodableSyncState:v49 withMergeState:v48 profile:v95 error:&v104];

          id v96 = v104;
          if (v54)
          {
            v55 = [(HDCodableSyncState *)v91 data];
            _HKInitializeLogging();
            v56 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
            {
              v57 = v56;
              v58 = +[HDCloudSyncStateUpdater _descriptionForDelegate:](v79, v98);
              uint64_t v59 = [(HDCodableSyncState *)v55 length];
              *(_DWORD *)buf = 138543618;
              v106 = v58;
              __int16 v107 = 2048;
              uint64_t v108 = v59;
              _os_log_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ update cloud state with %ld bytes of data", buf, 0x16u);
            }
            v60 = [v98 key];
            id v103 = 0;
            v76 = v55;
            uint64_t v17 = [v93 setData:v55 forKey:v60 error:&v103];
            id v61 = v103;

            if ((v17 & 1) == 0)
            {
              _HKInitializeLogging();
              v62 = (void *)*MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                v71 = v62;
                v80 = +[HDCloudSyncStateUpdater _descriptionForDelegate:](v79, v98);
                *(_DWORD *)buf = 138543618;
                v106 = v80;
                __int16 v107 = 2114;
                uint64_t v108 = (uint64_t)v61;
                _os_log_error_impl(&dword_1BCB7D000, v71, OS_LOG_TYPE_ERROR, "%{public}@ state store data set error: %{public}@", buf, 0x16u);
              }
              id v63 = v61;
              if (v63)
              {
                if (a2) {
                  *a2 = (HDCodableSyncState *)v63;
                }
                else {
                  _HKLogDroppedError();
                }
              }
            }
            v46 = v84;
            id v12 = v85;
            v65 = v76;
          }
          else
          {
            _HKInitializeLogging();
            v64 = (void *)*MEMORY[0x1E4F29FA8];
            id v12 = v85;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              v69 = v64;
              v70 = +[HDCloudSyncStateUpdater _descriptionForDelegate:](v79, v98);
              *(_DWORD *)buf = 138543618;
              v106 = v70;
              __int16 v107 = 2114;
              uint64_t v108 = (uint64_t)v96;
              _os_log_error_impl(&dword_1BCB7D000, v69, OS_LOG_TYPE_ERROR, "%{public}@ update codable sync state error: %{public}@", buf, 0x16u);

              id v12 = v85;
            }
            v65 = (HDCodableSyncState *)v96;
            if (v65)
            {
              v46 = v84;
              if (a2)
              {
                v65 = v65;
                uint64_t v17 = 0;
                *a2 = v65;
              }
              else
              {
                v66 = v65;
                _HKLogDroppedError();
                v65 = v66;
                uint64_t v17 = 0;
              }
            }
            else
            {
              uint64_t v17 = 0;
              v46 = v84;
            }
          }

          goto LABEL_53;
        }
        goto LABEL_50;
      }
    }
    uint64_t v17 = 0;
    goto LABEL_52;
  }
  _HKInitializeLogging();
  id v18 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    v38 = v18;
    v39 = +[HDCloudSyncStateUpdater _descriptionForDelegate:](v10, v7);
    *(_DWORD *)buf = 138543618;
    v106 = v39;
    __int16 v107 = 2114;
    uint64_t v108 = (uint64_t)v13;
    _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "%{public}@ fetch local state error: %{public}@", buf, 0x16u);
  }
  id v19 = (HDCodableSyncState *)v13;
  v15 = v19;
  if (!v19) {
    goto LABEL_19;
  }
  if (!a2)
  {
    _HKLogDroppedError();
LABEL_19:
    uint64_t v17 = 0;
    goto LABEL_55;
  }
  v15 = v19;
  uint64_t v17 = 0;
  *a2 = v15;
LABEL_55:

  return v17;
}

+ (BOOL)persistDataWithStateStore:(id)a3 delegate:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v13;
  char v11 = HKWithAutoreleasePool();

  return v11;
}

uint64_t __76__HDCloudSyncStateUpdater_persistDataWithStateStore_delegate_profile_error___block_invoke(uint64_t a1, HDCodableSyncState **a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  id v6 = v4;
  id v7 = v3;
  uint64_t v8 = self;
  id v17 = 0;
  uint64_t v9 = +[HDCloudSyncStateUpdater _fetchCloudState:codableSyncState:stateStore:profile:delegate:error:](v8, (uint64_t)&v17, 0, v7, v6, v5, a2);

  id v10 = v17;
  char v11 = v10;
  if (v9 == 1)
  {
    if (v10)
    {
      uint64_t v12 = +[HDCloudSyncStateUpdater _persistCloudState:delegate:profile:error:](v8, v10, v5, v6, a2);
    }
    else
    {
      _HKInitializeLogging();
      id v13 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v13;
        id v15 = +[HDCloudSyncStateUpdater _descriptionForDelegate:](v8, v5);
        *(_DWORD *)buf = 138543362;
        id v19 = v15;
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ no cloud state to perist", buf, 0xCu);
      }
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)_descriptionForDelegate:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  id v6 = [v2 domain];
  id v7 = [v2 key];
  uint64_t v8 = [v3 stringWithFormat:@"[%@:%@:%p (%@, %@)]", v4, v5, v2, v6, v7];

  return v8;
}

+ (uint64_t)_fetchCloudState:(void *)a3 codableSyncState:(void *)a4 stateStore:(void *)a5 profile:(void *)a6 delegate:(HDCodableSyncState *)a7 error:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  uint64_t v13 = self;
  id v14 = [v11 domain];
  id v15 = [v11 key];
  uint64_t v16 = [v11 supportedSyncVersionRange];
  id v54 = 0;
  id v55 = 0;
  char v17 = [v12 data:&v55 forKey:v15 error:&v54];

  id v18 = v55;
  id v19 = v54;
  if ((v17 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v27 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      id v41 = v27;
      v42 = +[HDCloudSyncStateUpdater _descriptionForDelegate:](v13, v11);
      *(_DWORD *)buf = 138543618;
      uint64_t v57 = (uint64_t)v42;
      __int16 v58 = 2114;
      *(void *)uint64_t v59 = v19;
      _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "%{public}@ state store data fetch error: %{public}@", buf, 0x16u);
    }
    v28 = (HDCodableSyncState *)v19;
    v21 = v28;
    if (v28)
    {
      if (a7)
      {
        v21 = v28;
        uint64_t v29 = 0;
        *a7 = v21;
LABEL_42:

        goto LABEL_43;
      }
      _HKLogDroppedError();
    }
    uint64_t v29 = 0;
    goto LABEL_42;
  }
  if (v18)
  {
    uint64_t v48 = v13;
    uint64_t v20 = [[HDCodableSyncState alloc] initWithData:v18];
    v21 = v20;
    id v50 = v10;
    if (!v20)
    {
      v30 = (void *)MEMORY[0x1E4F28C58];
      v31 = [v11 domain];
      BOOL v32 = [v11 key];
      objc_msgSend(v30, "hk_assignError:code:format:", a7, 129, @"Unable to decode state sync data for domain %@ key %@", v31, v32);

LABEL_24:
      uint64_t v29 = 0;
LABEL_41:

      id v10 = v50;
      goto LABEL_42;
    }
    id v22 = [(HDCodableSyncState *)v20 domain];
    id v49 = v19;
    if (v22 == v14)
    {
    }
    else
    {
      unint64_t v23 = v22;
      if (!v14)
      {

LABEL_23:
        v38 = (void *)MEMORY[0x1E4F28C58];
        v31 = [(HDCodableSyncState *)v21 key];
        objc_msgSend(v38, "hk_assignError:code:format:", a7, 129, @"Serialized domain %@ does not matched expected value %@", v31, v14);
        goto LABEL_24;
      }
      [(HDCodableSyncState *)v21 domain];
      v25 = id v24 = v14;
      char v26 = [v25 isEqualToString:v24];

      id v14 = v24;
      id v19 = v49;

      if ((v26 & 1) == 0) {
        goto LABEL_23;
      }
    }
    v33 = [(HDCodableSyncState *)v21 key];
    if (v33 == v15)
    {
      v35 = v14;
    }
    else
    {
      v34 = v33;
      v35 = v14;
      if (!v15)
      {

LABEL_38:
        v43 = (void *)MEMORY[0x1E4F28C58];
        v31 = [(HDCodableSyncState *)v21 key];
        id v14 = v35;
        objc_msgSend(v43, "hk_assignError:code:format:", a7, 129, @"Serialized key %@ does not matched %@ for domain %@", v31, v15, v35);
        uint64_t v29 = 0;
        goto LABEL_40;
      }
      v36 = [(HDCodableSyncState *)v21 key];
      char v37 = [v36 isEqualToString:v15];

      if ((v37 & 1) == 0) {
        goto LABEL_38;
      }
    }
    if ((int)[(HDCodableSyncState *)v21 versionRange] <= SHIDWORD(v16))
    {
      if (a3) {
        *a3 = v21;
      }
      id v53 = 0;
      uint64_t v29 = [v11 fetchCloudState:a2 codableSyncState:v21 profile:v50 error:&v53];
      v31 = v53;
      id v14 = v35;
      if (!v29)
      {
        _HKInitializeLogging();
        v40 = (void *)*MEMORY[0x1E4F29FA8];
        id v19 = v49;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          v45 = v40;
          +[HDCloudSyncStateUpdater _descriptionForDelegate:](v48, v11);
          id v47 = v46 = v14;
          *(_DWORD *)buf = 138543618;
          uint64_t v57 = (uint64_t)v47;
          __int16 v58 = 2114;
          *(void *)uint64_t v59 = v31;
          _os_log_error_impl(&dword_1BCB7D000, v45, OS_LOG_TYPE_ERROR, "%{public}@ decode cloud state error: %{public}@", buf, 0x16u);

          id v14 = v46;
          id v19 = v49;
        }
        v31 = v31;
        if (v31)
        {
          if (a7) {
            *a7 = (HDCodableSyncState *)v31;
          }
          else {
            _HKLogDroppedError();
          }
        }

        goto LABEL_24;
      }
    }
    else
    {
      _HKInitializeLogging();
      v31 = HKLogMedication();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = (int)[(HDCodableSyncState *)v21 versionRange];
        *(_DWORD *)buf = 138544386;
        uint64_t v57 = v48;
        __int16 v58 = 1024;
        *(_DWORD *)uint64_t v59 = v39;
        *(_WORD *)&v59[4] = 1024;
        *(_DWORD *)&v59[6] = HIDWORD(v16);
        __int16 v60 = 2114;
        id v14 = v35;
        id v61 = v35;
        __int16 v62 = 2114;
        id v63 = v15;
        _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Codable state has minimum version %d but current version for OS is %d for (%{public}@, %{public}@) ", buf, 0x2Cu);
        uint64_t v29 = 2;
      }
      else
      {
        uint64_t v29 = 2;
        id v14 = v35;
      }
    }
LABEL_40:
    id v19 = v49;
    goto LABEL_41;
  }
  uint64_t v29 = 1;
LABEL_43:

  return v29;
}

+ (uint64_t)_persistCloudState:(void *)a3 delegate:(void *)a4 profile:(void *)a5 error:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  _HKInitializeLogging();
  id v12 = (os_log_t *)MEMORY[0x1E4F29FA8];
  uint64_t v13 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    id v15 = +[HDCloudSyncStateUpdater _descriptionForDelegate:](v11, v9);
    *(_DWORD *)buf = 138543618;
    BOOL v25 = v15;
    __int16 v26 = 2114;
    uint64_t v27 = objc_opt_class();
    _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ persist cloud state %{public}@", buf, 0x16u);
  }
  id v23 = 0;
  uint64_t v16 = [v9 persistCloudState:v8 profile:v10 error:&v23];

  id v17 = v23;
  if ((v16 & 1) == 0)
  {
    _HKInitializeLogging();
    os_log_t v18 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
    {
      v21 = v18;
      id v22 = +[HDCloudSyncStateUpdater _descriptionForDelegate:](v11, v9);
      *(_DWORD *)buf = 138543618;
      BOOL v25 = v22;
      __int16 v26 = 2114;
      uint64_t v27 = (uint64_t)v17;
      _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@ perist cloud state error: %{public}@", buf, 0x16u);
    }
    id v19 = v17;
    if (v19)
    {
      if (a5) {
        *a5 = v19;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v16;
}

@end