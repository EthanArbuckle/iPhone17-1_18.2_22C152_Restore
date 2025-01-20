@interface _BSCompoundAssertionAcquisitionReference
- (NSString)description;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _BSCompoundAssertionAcquisitionReference

- (void).cxx_destruct
{
}

- (void)invalidate
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (atomic_exchange(&self->_invalid._Value, 1u)) {
    return;
  }
  record = self->_record;
  if (!record)
  {
    v28 = self;
    goto LABEL_32;
  }
  WeakRetained = (char *)objc_loadWeakRetained((id *)&record->_assertion);
  v4 = self;
  if (!WeakRetained)
  {
LABEL_32:
    WeakRetained = 0;
    goto LABEL_25;
  }
  v5 = v4;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)WeakRetained + 4);
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
  v6 = v5;
  os_unfair_lock_assert_owner((const os_unfair_lock *)WeakRetained + 4);
  if (!WeakRetained[20])
  {
    v7 = (os_unfair_lock_s *)(WeakRetained + 32);
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 8);
    v8 = (void *)*((void *)WeakRetained + 6);
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = (id)objc_opt_class();
        uint64_t v11 = *((void *)WeakRetained + 1);
        int v12 = [*((id *)WeakRetained + 5) count];
        *(_DWORD *)buf = 138544386;
        id v31 = v10;
        __int16 v32 = 2048;
        v33 = WeakRetained;
        __int16 v34 = 2114;
        uint64_t v35 = v11;
        __int16 v36 = 2048;
        v37 = v6;
        __int16 v38 = 1024;
        int v39 = v12;
        _os_log_impl(&dword_18AAA8000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> (%{public}@) invalidate acq:%p count:%d", buf, 0x30u);
      }
    }
    if (([*((id *)WeakRetained + 5) containsObject:self->_record] & 1) == 0)
    {
      os_unfair_lock_unlock(v7);
      uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/BaseBoard/BaseBoard/BSCompoundAssertion.m"];
      v24 = (void *)v23;
      v25 = @"<Unknown File>";
      if (v23) {
        v25 = (__CFString *)v23;
      }
      v26 = v25;

      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:sel__syncLock_acquisitionDidInvalidate_ object:WeakRetained file:v26 lineNumber:433 description:@"acquisition invalidated twice"];
    }
    v13 = self->_record;
    [*((id *)WeakRetained + 5) removeObject:v13];
    uint64_t v14 = [*((id *)WeakRetained + 5) count];
    if (!v14)
    {
      v15 = (void *)*((void *)WeakRetained + 5);
      *((void *)WeakRetained + 5) = 0;
    }
    if (v13) {
      id context = v13->_context;
    }
    else {
      id context = 0;
    }
    id v17 = context;
    uint64_t v18 = *((void *)WeakRetained + 3);
    if (v14 && v18)
    {
      if (v17)
      {
        v19 = -[BSCompoundAssertion _dataLock_context]((uint64_t)WeakRetained);
        char v20 = [v19 containsObject:v17];

        if ((v20 & 1) == 0)
        {
          uint64_t v18 = *((void *)WeakRetained + 3);
LABEL_21:
          v21 = (void (**)(void, void))MEMORY[0x18C125630](v18);
          v22 = -[BSCompoundAssertion _dataLock_copyState]((uint64_t)WeakRetained);
          os_unfair_lock_unlock(v7);
          ((void (**)(void, void *))v21)[2](v21, v22);
LABEL_23:

          goto LABEL_24;
        }
      }
    }
    else if (v18)
    {
      goto LABEL_21;
    }
    os_unfair_lock_unlock(v7);
    v22 = 0;
    v21 = 0;
    goto LABEL_23;
  }
LABEL_24:

  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
  -[_BSCompoundAssertionAcquisitionRecord setContext:]((uint64_t)self->_record, 0);
LABEL_25:
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((atomic_exchange(&self->_invalid._Value, 1u) & 1) == 0)
  {
    v4 = NSString;
    -[_BSCompoundAssertionAcquisitionRecord assertion]((id *)&self->_record->super.isa);
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    v6 = -[BSCompoundAssertion _identifier](v5);
    v7 = [v4 stringWithFormat:@"client bug: someone forgot to invoke -invalidate on acquisition %@ (assertion: %@)", self, v6];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v13 = v8;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2048;
      id v17 = self;
      __int16 v18 = 2114;
      v19 = @"BSCompoundAssertion.m";
      __int16 v20 = 1024;
      int v21 = 144;
      __int16 v22 = 2114;
      uint64_t v23 = v7;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v7 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE846CLL);
  }
  v11.receiver = self;
  v11.super_class = (Class)_BSCompoundAssertionAcquisitionReference;
  [(_BSCompoundAssertionAcquisitionReference *)&v11 dealloc];
}

- (NSString)description
{
  record = self->_record;
  if (record) {
    record = (_BSCompoundAssertionAcquisitionRecord *)record->_reason;
  }
  v3 = [NSString stringWithFormat:@"<CAcq %p:%@>", self, record];
  return (NSString *)v3;
}

@end