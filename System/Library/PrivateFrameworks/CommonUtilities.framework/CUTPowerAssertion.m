@interface CUTPowerAssertion
- (CUTPowerAssertion)initWithIdentifier:(id)a3;
- (CUTPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4;
- (id)description;
- (void)dealloc;
@end

@implementation CUTPowerAssertion

- (CUTPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v6 = (__CFString *)a3;
  v26.receiver = self;
  v26.super_class = (Class)CUTPowerAssertion;
  v7 = [(CUTPowerAssertion *)&v26 init];
  if (v7)
  {
    v8 = objc_alloc_init(_CUTPowerAssertion);
    id internal = v7->_internal;
    v7->_id internal = v8;

    v10 = (IOPMAssertionID *)v7->_internal;
    if (a4 == 0.0) {
      IOReturn v11 = IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, v6, v10 + 2);
    }
    else {
      IOReturn v11 = IOPMAssertionCreateWithDescription(@"NoIdleSleepAssertion", v6, v6, 0, 0, a4, @"TimeoutActionTurnOff", v10 + 2);
    }
    int v12 = v11;
    if (v11)
    {
      *((_DWORD *)v7->_internal + 2) = 0;
      v13 = +[CUTLog power];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        sub_1A3564B60((uint64_t)v6, v12, v13);
      }

      v7 = 0;
    }
    else
    {
      uint64_t v14 = [(__CFString *)v6 copy];
      v15 = v7->_internal;
      v16 = (void *)v15[2];
      v15[2] = v14;

      v17 = (void *)MEMORY[0x1A6249B10]();
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackReturnAddresses];
      v19 = v7->_internal;
      v20 = (void *)v19[3];
      v19[3] = v18;

      v21 = +[CUTLog power];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v6;
        _os_log_impl(&dword_1A3554000, v21, OS_LOG_TYPE_DEFAULT, "Created power assertion {identifier: %{public}@}", buf, 0xCu);
      }

      v22 = +[CUTLog power];
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

      if (v23)
      {
        v24 = +[CUTLog power];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          sub_1A3564AD8();
        }
      }
    }
  }

  return v7;
}

- (CUTPowerAssertion)initWithIdentifier:(id)a3
{
  return (CUTPowerAssertion *)MEMORY[0x1F4181798](self, sel_initWithIdentifier_timeout_);
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = +[CUTLog power];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *((void *)self->_internal + 2);
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1A3554000, v3, OS_LOG_TYPE_DEFAULT, "Releasing power assertion {identifier: %{public}@}", buf, 0xCu);
  }

  v5 = +[CUTLog power];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    v7 = +[CUTLog power];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1A3564AD8();
    }
  }
  IOPMAssertionID v8 = *((_DWORD *)self->_internal + 2);
  if (v8)
  {
    IOReturn v9 = IOPMAssertionRelease(v8);
    if (v9)
    {
      int v10 = v9;
      IOReturn v11 = +[CUTLog power];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_1A3564BE8((uint64_t)&self->_internal, v10, v11);
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CUTPowerAssertion;
  [(CUTPowerAssertion *)&v12 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<IMPowerAssertion: %p> Identifier: %@   Stack: %@", self, *((void *)self->_internal + 2), *((void *)self->_internal + 3)];
}

- (void).cxx_destruct
{
}

@end