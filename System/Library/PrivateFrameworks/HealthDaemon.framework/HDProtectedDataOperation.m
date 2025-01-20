@interface HDProtectedDataOperation
- (BOOL)requestWorkWithPriority:(int64_t)a3 error:(id *)a4;
- (HDProtectedDataOperation)initWithOperationScheduler:(id)a3 debugIdentifier:(id)a4 delegate:(id)a5;
- (HDProtectedDataOperation)initWithProfile:(id)a3 debugIdentifier:(id)a4 delegate:(id)a5;
- (NSString)debugIdentifier;
- (NSString)description;
- (id)diagnosticDescription;
- (uint64_t)_performStateTransitionWithError:(void *)a3 block:;
- (void)_startWorkNow:(void *)a1;
- (void)protectedDataOperationSchedulerProfileIsReady:(id)a3;
- (void)protectedDataOperationSchedulerProtectedDataIsAvailable:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HDProtectedDataOperation

- (HDProtectedDataOperation)initWithProfile:(id)a3 debugIdentifier:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a3 protectedDataOperationScheduler];
  v11 = [(HDProtectedDataOperation *)self initWithOperationScheduler:v10 debugIdentifier:v9 delegate:v8];

  return v11;
}

- (HDProtectedDataOperation)initWithOperationScheduler:(id)a3 debugIdentifier:(id)a4 delegate:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDProtectedDataOperation.m", 81, @"Invalid parameter not satisfying: %@", @"protectedDataOperationScheduler" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)HDProtectedDataOperation;
  v13 = [(HDProtectedDataOperation *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_protectedDataOperationScheduler, a3);
    uint64_t v15 = [v11 copy];
    debugIdentifier = v14->_debugIdentifier;
    v14->_debugIdentifier = (NSString *)v15;

    objc_storeWeak((id *)&v14->_lock_delegate, v12);
    v14->_lock._os_unfair_lock_opaque = 0;
    v14->_lock_shouldBypassMaintenanceCoordinator = 0;
    v14->_lock_state = 1;
  }

  return v14;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@:%p:%@", objc_opt_class(), self, self->_debugIdentifier];
}

- (BOOL)requestWorkWithPriority:(int64_t)a3 error:(id *)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__HDProtectedDataOperation_requestWorkWithPriority_error___block_invoke;
  v5[3] = &unk_1E630DA30;
  v5[4] = self;
  v5[5] = a3;
  return -[HDProtectedDataOperation _performStateTransitionWithError:block:]((uint64_t)self, a4, v5);
}

id __58__HDProtectedDataOperation_requestWorkWithPriority_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 oldState];
  uint64_t v5 = *(void *)(a1 + 40);
  switch([v3 oldState])
  {
    case 1:
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
    case 4:
      uint64_t v4 = 4;
      break;
    case 6:
      if (v5 == 1) {
        uint64_t v4 = 5;
      }
      break;
    case 7:
      uint64_t v4 = 8;
      break;
    default:
      break;
  }
  if ([v3 oldState] != v4)
  {
    uint64_t v6 = [v3 copyWithNewState:v4];

    id v3 = (id)v6;
  }
  if (v5 == 1) {
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  }

  return v3;
}

- (uint64_t)_performStateTransitionWithError:(void *)a3 block:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  if (a1)
  {
    uint64_t v6 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v7 = [_HDProtectedDataOperationTransitionContext alloc];
    if (v7) {
      id v8 = [(_HDProtectedDataOperationTransitionContext *)v7 initWithOldState:*(void *)(a1 + 24) newState:0];
    }
    else {
      id v8 = 0;
    }
    id v33 = 0;
    id v9 = v5[2](v5, v8, &v33);
    id v10 = v33;
    id v11 = v10;
    if (v9)
    {
      if ([v9 hasNewState])
      {
        uint64_t v12 = [v9 newState];
        id v32 = v11;
        os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
        uint64_t v13 = *(void *)(a1 + 24);
        switch(v13)
        {
          case 1:
            if (v12 == 2) {
              goto LABEL_23;
            }
            goto LABEL_27;
          case 2:
          case 3:
          case 8:
            if (v12 != 4) {
              goto LABEL_27;
            }
            goto LABEL_23;
          case 4:
            if ((unint64_t)(v12 - 5) >= 2) {
              goto LABEL_27;
            }
            goto LABEL_23;
          case 5:
            if (v12 != 7) {
              goto LABEL_27;
            }
            goto LABEL_23;
          case 6:
            if ((v12 | 2) != 7) {
              goto LABEL_27;
            }
            goto LABEL_23;
          case 7:
            if (v12 != 3 && v12 != 8) {
              goto LABEL_27;
            }
LABEL_23:
            _HKInitializeLogging();
            uint64_t v15 = HKLogInfrastructure();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = NSStringFromHDProtectedDataOperationState(v13);
              v17 = NSStringFromHDProtectedDataOperationState(v12);
              *(_DWORD *)buf = 138543874;
              uint64_t v36 = a1;
              __int16 v37 = 2114;
              v38 = v16;
              __int16 v39 = 2114;
              v40 = v17;
              _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] State will change from %{public}@ to %{public}@", buf, 0x20u);
            }
            *(void *)(a1 + 24) = v12;
            id v11 = v11;

            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
            id v18 = v9;
            os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
            id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
            if ([WeakRetained conformsToProtocol:&unk_1F18A8B28]) {
              id v20 = WeakRetained;
            }
            else {
              id v20 = 0;
            }

            [v20 protectedDataOperation:a1 didTransitionWithContext:v18];
            switch([v18 newState])
            {
              case 2:
                [*(id *)(a1 + 8) registerObserver:a1];
                break;
              case 4:
                [*(id *)(a1 + 8) registerProtectedDataAvailableObserver:a1];
                break;
              case 5:
                uint64_t v27 = [v18 oldState];
                if (v27 == 6)
                {
                  v30 = *(void **)(a1 + 8);
                  v31 = [(id)a1 description];
                  [v30 startEnqueuedWorkWithName:v31];
                }
                else if (v27 == 4)
                {
                  v28 = (void *)a1;
                  uint64_t v29 = 1;
                  goto LABEL_42;
                }
                break;
              case 6:
                v28 = (void *)a1;
                uint64_t v29 = 0;
LABEL_42:
                -[HDProtectedDataOperation _startWorkNow:](v28, v29);
                break;
              default:
                break;
            }

            char v14 = 1;
            goto LABEL_32;
          default:
LABEL_27:
            v21 = (void *)MEMORY[0x1E4F28C58];
            v22 = NSStringFromHDProtectedDataOperationState(v13);
            v23 = NSStringFromHDProtectedDataOperationState(v12);
            objc_msgSend(v21, "hk_assignError:code:format:", &v32, 126, @"Invalid attempt to change state from %@ to %@", v22, v23);

            id v24 = v32;
            id v11 = v24;
            if (!v11) {
              goto LABEL_30;
            }
            if (!a2) {
              goto LABEL_29;
            }
            goto LABEL_11;
        }
      }
      char v14 = 1;
    }
    else
    {
      id v11 = v10;
      if (v11)
      {
        if (a2)
        {
LABEL_11:
          id v11 = v11;
          *a2 = v11;
        }
        else
        {
LABEL_29:
          _HKLogDroppedError();
        }
      }
LABEL_30:

      char v14 = 0;
    }
    os_unfair_lock_unlock(v6);
LABEL_32:
    unsigned __int8 v34 = v14;

    uint64_t v25 = v34;
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_lock_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

id __66__HDProtectedDataOperation__performTransitionToNewStateWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(uint64_t (**)(uint64_t))(v2 + 16);
  id v4 = a2;
  id v5 = (void *)[v4 copyWithNewState:v3(v2)];

  return v5;
}

- (void)_startWorkNow:(void *)a1
{
  id v4 = (void *)a1[1];
  id v5 = [a1 description];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__HDProtectedDataOperation__startWorkNow___block_invoke;
  v6[3] = &unk_1E6305B88;
  v6[4] = a1;
  [v4 startWorkNow:a2 name:v5 asynchronousBlock:v6];
}

void __42__HDProtectedDataOperation__startWorkNow___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v6)
  {
    v18[4] = v6;
    id v19 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __103__HDProtectedDataOperation__notifyDelegateToPerformWorkWithDatabase_accessibilityAssertion_completion___block_invoke;
    v18[3] = &unk_1E630DA80;
    char v10 = -[HDProtectedDataOperation _performStateTransitionWithError:block:](v6, &v19, v18);
    id v11 = v19;
    if (v10)
    {
      *(void *)aBlock = MEMORY[0x1E4F143A8];
      *(void *)&aBlock[8] = 3221225472;
      *(void *)&aBlock[16] = __103__HDProtectedDataOperation__notifyDelegateToPerformWorkWithDatabase_accessibilityAssertion_completion___block_invoke_345;
      v23 = &unk_1E62F4928;
      uint64_t v24 = v6;
      uint64_t v25 = v9;
      uint64_t v12 = (void (**)(void))_Block_copy(aBlock);
      os_unfair_lock_lock((os_unfair_lock_t)(v6 + 16));
      id WeakRetained = objc_loadWeakRetained((id *)(v6 + 40));
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 16));
      _HKInitializeLogging();
      char v14 = HKLogInfrastructure();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (WeakRetained)
      {
        if (v15)
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v21 = v6;
          _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Here we go! Delegate asked to perform work!", buf, 0xCu);
        }

        v16 = [v7 profile];
        [WeakRetained performWorkForOperation:v6 profile:v16 databaseAccessibilityAssertion:v8 completion:v12];
      }
      else
      {
        if (v15)
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v21 = v6;
          _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to perform work because delegate is nil!", buf, 0xCu);
        }

        v12[2](v12);
      }
    }
    else
    {
      _HKInitializeLogging();
      v17 = HKLogInfrastructure();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)aBlock = 138543618;
        *(void *)&aBlock[4] = v6;
        *(_WORD *)&aBlock[12] = 2114;
        *(void *)&aBlock[14] = v11;
        _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to transition to doing work: %{public}@", aBlock, 0x16u);
      }

      v9[2](v9);
    }
  }
}

id __103__HDProtectedDataOperation__notifyDelegateToPerformWorkWithDatabase_accessibilityAssertion_completion___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  uint64_t v2 = (void *)[a2 copyWithNewState:7];

  return v2;
}

uint64_t __103__HDProtectedDataOperation__notifyDelegateToPerformWorkWithDatabase_accessibilityAssertion_completion___block_invoke_345(uint64_t a1)
{
  -[HDProtectedDataOperation _performStateTransitionWithError:block:](*(void *)(a1 + 32), 0, &__block_literal_global_239);
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

id __103__HDProtectedDataOperation__notifyDelegateToPerformWorkWithDatabase_accessibilityAssertion_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [v4 oldState];
  if ((unint64_t)(v5 - 1) < 6)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = NSStringFromHDProtectedDataOperationState([v4 oldState]);
    objc_msgSend(v6, "hk_assignError:code:format:", a3, 126, @"Invalid state at work complete: %@", v7);

    a3 = 0;
    goto LABEL_8;
  }
  if (v5 == 7)
  {
    id v8 = v4;
    uint64_t v9 = 3;
  }
  else
  {
    if (v5 != 8) {
      goto LABEL_8;
    }
    id v8 = v4;
    uint64_t v9 = 4;
  }
  a3 = (void *)[v8 copyWithNewState:v9];
LABEL_8:

  return a3;
}

- (void)protectedDataOperationSchedulerProfileIsReady:(id)a3
{
}

id __74__HDProtectedDataOperation_protectedDataOperationSchedulerProfileIsReady___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  uint64_t v5 = [v4 oldState];
  if ((unint64_t)(v5 - 3) < 6)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = NSStringFromHDProtectedDataOperationState([v4 oldState]);
    objc_msgSend(v6, "hk_assignError:code:format:", a3, 126, @"Invalid state at profile ready: %@", v7);

    id v8 = 0;
    goto LABEL_9;
  }
  if (v5 == 2)
  {
    uint64_t v9 = 4;
    goto LABEL_7;
  }
  if (v5 == 1)
  {
    uint64_t v9 = 3;
LABEL_7:
    uint64_t v10 = [v4 copyWithNewState:v9];

    id v4 = (id)v10;
  }
  id v4 = v4;
  id v8 = v4;
LABEL_9:

  return v8;
}

- (void)protectedDataOperationSchedulerProtectedDataIsAvailable:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__HDProtectedDataOperation_protectedDataOperationSchedulerProtectedDataIsAvailable___block_invoke;
  v6[3] = &unk_1E630DAC8;
  v6[4] = self;
  id v4 = v6;
  uint64_t v5 = v4;
  if (self)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__HDProtectedDataOperation__performTransitionToNewStateWithBlock___block_invoke;
    v7[3] = &unk_1E630DA58;
    id v8 = v4;
    -[HDProtectedDataOperation _performStateTransitionWithError:block:]((uint64_t)self, 0, v7);
  }
}

uint64_t __84__HDProtectedDataOperation_protectedDataOperationSchedulerProtectedDataIsAvailable___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 32)) {
    return 5;
  }
  else {
    return 6;
  }
}

- (id)diagnosticDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_state = self->_lock_state;
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = NSString;
  uint64_t v6 = NSStringFromHDProtectedDataOperationState(lock_state);
  id v7 = [v5 stringWithFormat:@"<%@ %@>", self, v6];

  return v7;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_destroyWeak((id *)&self->_lock_delegate);

  objc_storeStrong((id *)&self->_protectedDataOperationScheduler, 0);
}

@end