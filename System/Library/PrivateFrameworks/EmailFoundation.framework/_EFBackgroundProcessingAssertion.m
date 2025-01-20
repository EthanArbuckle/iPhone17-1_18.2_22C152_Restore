@interface _EFBackgroundProcessingAssertion
- (BOOL)_iterateFilesPerformingAction:(id)a3 error:(id *)a4;
- (BOOL)_releaseAssertionWithError:(id *)a3;
- (BOOL)_takeAssertionForDuration:(double)a3 error:(id *)a4;
- initWithProtectedFiles:(_DWORD *)a1;
- (os_unfair_lock_s)isActive;
- (uint64_t)incrementAssertionForDuration:(void *)a3 outResetCount:(double)a4 error:;
- (void)_checkIfExpired;
- (void)decrementAssertionWithResetCount:(uint64_t)a1;
@end

@implementation _EFBackgroundProcessingAssertion

- initWithProtectedFiles:(_DWORD *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_EFBackgroundProcessingAssertion;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 5, a2);
      a1[8] = 0;
    }
  }

  return a1;
}

- (os_unfair_lock_s)isActive
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 8;
    os_unfair_lock_lock(a1 + 8);
    [(os_unfair_lock_s *)v1 _checkIfExpired];
    v1 = (os_unfair_lock_s *)(*(void *)&v1[4]._os_unfair_lock_opaque != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (uint64_t)incrementAssertionForDuration:(void *)a3 outResetCount:(double)a4 error:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:");
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  [(id)a1 _checkIfExpired];
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v9 + 1;
  if (v9 && ([v8 timeIntervalSinceDate:*(void *)(a1 + 8)], v10 <= 10.0))
  {
    id v12 = 0;
  }
  else
  {
    id v21 = 0;
    int v11 = [(id)a1 _takeAssertionForDuration:&v21 error:a4];
    id v12 = v21;
    v13 = _ef_log_EFProtectedFile();
    v14 = v13;
    if (!v11)
    {
      v16 = v13;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v19 = *(id *)(a1 + 40);
        v20 = objc_msgSend(v12, "ef_publicDescription");
        *(_DWORD *)buf = 134218498;
        double v23 = a4;
        __int16 v24 = 2114;
        id v25 = v19;
        __int16 v26 = 2114;
        v27 = v20;
        _os_log_error_impl(&dword_1B5A59000, v16, OS_LOG_TYPE_ERROR, "Failed to take assertion of duration %f on files %{public}@ due to error: %{public}@", buf, 0x20u);
      }
      uint64_t v17 = 0;
      --*(void *)(a1 + 16);
      goto LABEL_13;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      double v23 = a4;
      __int16 v24 = 2114;
      id v25 = v15;
      _os_log_impl(&dword_1B5A59000, v14, OS_LOG_TYPE_DEFAULT, "Took assertion of duration %f on files %{public}@", buf, 0x16u);
    }

    objc_storeStrong((id *)(a1 + 8), v8);
  }
  uint64_t v17 = 1;
LABEL_13:
  *a2 = *(void *)(a1 + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  if (a3) {
    *a3 = v12;
  }

  return v17;
}

- (void)decrementAssertionWithResetCount:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    if (*(void *)(a1 + 24) == a2)
    {
      uint64_t v5 = *(void *)(a1 + 16);
      if (!v5)
      {
        v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:sel_decrementAssertionWithResetCount_ object:a1 file:@"EFProtectedFile.m" lineNumber:312 description:@"Decrementing assertion when count is already 0"];

        uint64_t v5 = *(void *)(a1 + 16);
      }
      uint64_t v6 = v5 - 1;
      *(void *)(a1 + 16) = v6;
      if (!v6)
      {
        id v16 = 0;
        int v7 = [(id)a1 _releaseAssertionWithError:&v16];
        id v8 = v16;
        uint64_t v9 = _ef_log_EFProtectedFile();
        double v10 = v9;
        if (v7)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138543362;
            uint64_t v18 = v11;
            _os_log_impl(&dword_1B5A59000, v10, OS_LOG_TYPE_DEFAULT, "Released assertion on files %{public}@", buf, 0xCu);
          }
        }
        else
        {
          id v12 = v9;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            id v13 = *(id *)(a1 + 40);
            v14 = objc_msgSend(v8, "ef_publicDescription");
            -[_EFBackgroundProcessingAssertion decrementAssertionWithResetCount:](v13, v14, buf, v12);
          }
        }
      }
    }
    os_unfair_lock_unlock(v4);
  }
}

- (BOOL)_takeAssertionForDuration:(double)a3 error:(id *)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68___EFBackgroundProcessingAssertion__takeAssertionForDuration_error___block_invoke;
  v5[3] = &__block_descriptor_48_e8_i12__0i8l;
  v5[4] = 0;
  v5[5] = (unint64_t)(a3 * 1000000000.0);
  return [(_EFBackgroundProcessingAssertion *)self _iterateFilesPerformingAction:v5 error:a4];
}

- (void)_checkIfExpired
{
  if ([(NSDate *)self->_currentExpiry ef_isEarlierThanNow])
  {
    unint64_t v3 = self->_resetCount + 1;
    self->_count = 0;
    self->_resetCount = v3;
  }
}

- (BOOL)_releaseAssertionWithError:(id *)a3
{
  return [(_EFBackgroundProcessingAssertion *)self _iterateFilesPerformingAction:&__block_literal_global_126 error:a3];
}

- (BOOL)_iterateFilesPerformingAction:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (unsigned int (**)(id, uint64_t))a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  if (self) {
    protectedFiles = self->_protectedFiles;
  }
  else {
    protectedFiles = 0;
  }
  int v7 = protectedFiles;
  id v8 = 0;
  uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v9)
  {
    char v11 = 1;
    goto LABEL_18;
  }
  uint64_t v10 = *(void *)v22;
  uint64_t v19 = *MEMORY[0x1E4F28798];
  char v11 = 1;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
      id v20 = 0;
      uint64_t v14 = -[_EFProtectedFile fileDescriptorWithError:](v13, &v20);
      id v15 = v20;
      if (v14)
      {
        if (v5[2](v5, v14) != -1) {
          goto LABEL_14;
        }
        uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:v19 code:*__error() userInfo:0];

        id v15 = (id)v16;
      }
      if (v8)
      {
        char v11 = 0;
      }
      else
      {
        id v15 = v15;
        char v11 = 0;
        id v8 = v15;
      }
LABEL_14:
    }
    uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v9);
LABEL_18:

  if (a4) {
    *a4 = v8;
  }

  return v11 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedFiles, 0);
  objc_storeStrong((id *)&self->_currentExpiry, 0);
}

- (void)decrementAssertionWithResetCount:(uint8_t *)buf .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B5A59000, log, OS_LOG_TYPE_ERROR, "Failed to release assertion on files %{public}@ due to error: %{public}@", buf, 0x16u);
}

@end