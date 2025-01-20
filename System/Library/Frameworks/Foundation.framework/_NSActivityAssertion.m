@interface _NSActivityAssertion
+ (id)_expirationHandlerExecutionQueue;
+ (id)_expiringActivities;
+ (id)_expiringAssertionManagementQueue;
+ (id)_expiringTaskExecutionQueue;
+ (void)_dumpExpiringActivitives;
+ (void)_expireAllActivies;
+ (void)_performActivityWithOptions:(unint64_t)a3 reason:(id)a4 usingBlock:(id)a5;
+ (void)_performExpiringActivityWithReason:(id)a3 usingBlock:(id)a4;
- (BOOL)_isEnded;
- (id)_initWithActivityOptions:(unint64_t)a3 reason:(id)a4 expirationHandler:(id)a5;
- (id)debugDescription;
- (void)_endFromDealloc:(BOOL)a3;
- (void)_fireExpirationHandler;
- (void)_reactivate;
- (void)dealloc;
@end

@implementation _NSActivityAssertion

- (id)_initWithActivityOptions:(unint64_t)a3 reason:(id)a4 expirationHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)_NSActivityAssertion;
  v30.receiver = [(_NSActivityAssertion *)&v31 init];
  v30.super_class = (Class)_NSActivityAssertion;
  v10 = [(_NSActivityAssertion *)&v30 init];
  if (!v10) {
    return v10;
  }
  v10->_unint64_t options = a3;
  atomic_store(0, (unsigned __int8 *)&v10->_ended);
  if (a4) {
    v11 = (__CFString *)a4;
  }
  else {
    v11 = @"No Reason Specified (via NSActivityOptions)";
  }
  CFStringRef v12 = (const __CFString *)[(__CFString *)v11 copy];
  v10->_reason = (NSString *)v12;
  atomic_store(0, &v10->_signpostID);
  unint64_t options = v10->_options;
  if ((options & 0x100000) != 0)
  {
    uint64_t v14 = IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, v12, &v10->_systemSleepAssertionID);
    if (v14)
    {
      uint64_t v15 = v14;
      v16 = _NSMethodExceptionProem((objc_class *)v10, a2);
      NSLog((NSString *)@"%@: Warning: Could not create system idle sleep assertion (%d)", v16, v15);
      unint64_t options = v10->_options & 0xFFFFFFFFFFEFFFFFLL;
      v10->_unint64_t options = options;
      if ((options & 0x20000000000) != 0) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t options = v10->_options;
      if ((options & 0x20000000000) != 0) {
        goto LABEL_15;
      }
    }
LABEL_7:
    if ((options & 0x40000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
  if ((options & 0x20000000000) == 0) {
    goto LABEL_7;
  }
LABEL_15:
  [+[NSString stringWithFormat:@"NSActivityAssertion: %@", a4] UTF8String];
  v10->_transaction = (OS_os_transaction *)os_transaction_create();
  unint64_t options = v10->_options;
  if ((options & 0x40000000000) == 0)
  {
LABEL_8:
    if ((options & 0x80000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  v10->_voucher = (OS_voucher *)voucher_copy();
  unint64_t options = v10->_options;
  if ((options & 0x80000000000) == 0)
  {
LABEL_9:
    if ((options & 0x100000000000) == 0) {
      goto LABEL_22;
    }
LABEL_18:
    if (!a5)
    {
      v26 = +[NSString stringWithFormat:@"%@: called with a nil expiration block", _NSMethodExceptionProem((objc_class *)v10, a2)];
      v27 = (void *)MEMORY[0x1E4F1CA00];
      v28 = (void *)MEMORY[0x1E4F1C3C8];
      goto LABEL_54;
    }
    if (qword_1EB1ED358 != -1) {
      dispatch_once(&qword_1EB1ED358, &__block_literal_global_53);
    }
    v10->_expirationHandler = (id)[a5 copy];
    v10->_lock._os_unfair_lock_opaque = 0;
    v17 = +[_NSActivityAssertion _expiringAssertionManagementQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74___NSActivityAssertion__initWithActivityOptions_reason_expirationHandler___block_invoke_3;
    block[3] = &unk_1E51F6678;
    block[4] = v10;
    block[5] = a4;
    dispatch_async(v17, block);
    unint64_t options = v10->_options;
    goto LABEL_22;
  }
LABEL_17:
  v10->_xpcBoost = +[NSXPCConnection _currentBoost]();
  unint64_t options = v10->_options;
  if ((options & 0x100000000000) != 0) {
    goto LABEL_18;
  }
LABEL_22:
  if ((options & 0x600000000000) != 0)
  {
    if (qword_1EB1ED360 != -1) {
      dispatch_once(&qword_1EB1ED360, &__block_literal_global_118);
    }
    os_signpost_id_t v18 = os_signpost_id_make_with_pointer((os_log_t)qword_1EB1ED368, v10);
    if (v18)
    {
      os_signpost_id_t v19 = v18;
      if (v18 != -1)
      {
        if ((v10->_options & 0x200000000000) != 0)
        {
          if (qword_1EB1ED360 != -1) {
            dispatch_once(&qword_1EB1ED360, &__block_literal_global_118);
          }
          v20 = qword_1EB1ED368;
          if (!os_signpost_enabled((os_log_t)qword_1EB1ED368)) {
            goto LABEL_50;
          }
          reason = v10->_reason;
          if (qword_1EB1ED350 != -1) {
            dispatch_once(&qword_1EB1ED350, &__block_literal_global_17);
          }
          *(_DWORD *)buf = 138543618;
          v33 = reason;
          __int16 v34 = 2114;
          uint64_t v35 = qword_1EB1ED348;
          v22 = " reason=%{signpost.telemetry:string1,public}@ version=%{signpost.telemetry:string2,public}@  enableTelem"
                "etry=YES  isAnimation=YES";
        }
        else
        {
          if (qword_1EB1ED370 != -1) {
            dispatch_once(&qword_1EB1ED370, &__block_literal_global_122);
          }
          if (_MergedGlobals_104)
          {
            if (qword_1EB1ED360 != -1) {
              dispatch_once(&qword_1EB1ED360, &__block_literal_global_118);
            }
            v20 = qword_1EB1ED368;
            if (!os_signpost_enabled((os_log_t)qword_1EB1ED368)) {
              goto LABEL_50;
            }
            v21 = v10->_reason;
            if (qword_1EB1ED350 != -1) {
              dispatch_once(&qword_1EB1ED350, &__block_literal_global_17);
            }
            *(_DWORD *)buf = 138543618;
            v33 = v21;
            __int16 v34 = 2114;
            uint64_t v35 = qword_1EB1ED348;
            v22 = " reason=%{signpost.telemetry:string1,public}@ version=%{signpost.telemetry:string2,public}@  enableTelemetry=YES ";
          }
          else
          {
            if (qword_1EB1ED360 != -1) {
              dispatch_once(&qword_1EB1ED360, &__block_literal_global_118);
            }
            v20 = qword_1EB1ED368;
            if (!os_signpost_enabled((os_log_t)qword_1EB1ED368)) {
              goto LABEL_50;
            }
            v24 = v10->_reason;
            if (qword_1EB1ED350 != -1) {
              dispatch_once(&qword_1EB1ED350, &__block_literal_global_17);
            }
            *(_DWORD *)buf = 138543618;
            v33 = v24;
            __int16 v34 = 2114;
            uint64_t v35 = qword_1EB1ED348;
            v22 = " reason=%{signpost.telemetry:string1,public}@ version=%{signpost.telemetry:string2,public}@ ";
          }
        }
        _os_signpost_emit_with_name_impl(&dword_181795000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v19, "interaction_tracking", v22, buf, 0x16u);
LABEL_50:
        atomic_store(v19, &v10->_signpostID);
        return v10;
      }
      v26 = +[NSString stringWithFormat:@"%@: unable to create a valid signpost ID", _NSMethodExceptionProem((objc_class *)v10, sel__emitSignpostBegin)];
      v27 = (void *)MEMORY[0x1E4F1CA00];
      v28 = (void *)MEMORY[0x1E4F1C3B8];
LABEL_54:
      objc_exception_throw((id)[v27 exceptionWithName:*v28 reason:v26 userInfo:0]);
    }
  }
  return v10;
}

- (void)_endFromDealloc:(BOOL)a3
{
  char v4 = 0;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_ended, (unsigned __int8 *)&v4, 1u);
  if (v4)
  {
    NSLog((NSString *)@"Warning: NSActivity %@ was ended multiple times", a2, a3, self);
  }
  else
  {
    BOOL v5 = a3;
    unint64_t options = self->_options;
    if ((options & 0x100000) != 0)
    {
      IOPMAssertionRelease(self->_systemSleepAssertionID);
      unint64_t options = self->_options;
    }
    if ((options & 0x600000000000) != 0)
    {
      os_signpost_id_t v7 = atomic_load(&self->_signpostID);
      if (v7)
      {
        if (qword_1EB1ED360 != -1) {
          dispatch_once(&qword_1EB1ED360, &__block_literal_global_118);
        }
        if (v7 != -1)
        {
          v8 = qword_1EB1ED368;
          if (os_signpost_enabled((os_log_t)qword_1EB1ED368))
          {
            *(_DWORD *)buf = 67240192;
            BOOL v15 = v5;
            _os_signpost_emit_with_name_impl(&dword_181795000, v8, OS_SIGNPOST_INTERVAL_END, v7, "interaction_tracking", " abandoned=%{signpost.telemetry:number1,public}d ", buf, 8u);
          }
        }
        atomic_store(0, &self->_signpostID);
      }
      unint64_t options = self->_options;
    }
    if ((options & 0x20000000000) != 0)
    {

      self->_transaction = 0;
      unint64_t options = self->_options;
    }
    if ((options & 0x40000000000) != 0)
    {
      if (self->_adoptPreviousVoucher)
      {

        self->_previousVoucher = 0;
      }
      voucher = self->_voucher;
      if (voucher)
      {

        self->_voucher = 0;
      }
    }
    unint64_t v10 = self->_options;
    if ((v10 & 0x80000000000) != 0)
    {

      self->_xpcBoost = 0;
      unint64_t v10 = self->_options;
    }
    if ((v10 & 0x100000000000) != 0)
    {
      v11 = +[_NSActivityAssertion _expiringAssertionManagementQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40___NSActivityAssertion__endFromDealloc___block_invoke;
      block[3] = &unk_1E51F71D0;
      block[4] = self;
      dispatch_async(v11, block);
    }
    os_unfair_lock_lock(&self->_lock);
    id expirationHandler = self->_expirationHandler;
    self->_id expirationHandler = 0;
    os_unfair_lock_unlock(&self->_lock);
    if (expirationHandler) {
      _Block_release(expirationHandler);
    }
  }
}

- (void)_reactivate
{
  if ((self->_options & 0x40000000000) != 0)
  {
    if (self->_voucher)
    {
      v3 = (OS_voucher *)voucher_adopt();
      self->_adoptPreviousVoucher = 1;
      self->_voucher = 0;
      self->_previousVoucher = v3;
    }
  }
}

+ (id)_expiringAssertionManagementQueue
{
  if (qword_1EB1ED308 != -1) {
    dispatch_once(&qword_1EB1ED308, &__block_literal_global_20);
  }
  return (id)qword_1EB1ED310;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (!self->_ended) {
    [(_NSActivityAssertion *)self _endFromDealloc:1];
  }

  v3.receiver = self;
  v3.super_class = (Class)_NSActivityAssertion;
  [(_NSActivityAssertion *)&v3 dealloc];
}

+ (id)_expiringActivities
{
  if (qword_1EB1ED338 != -1) {
    dispatch_once(&qword_1EB1ED338, &__block_literal_global_9);
  }
  return (id)qword_1EB1ED340;
}

+ (void)_performExpiringActivityWithReason:(id)a3 usingBlock:(id)a4
{
  v10[5] = *MEMORY[0x1E4F143B8];
  if (!a3 || !_NSIsNSString() || ![a3 length]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot begin activity without reason string or empty reason string" userInfo:0]);
  }
  v6 = [_NSActivityAssertion alloc];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70___NSActivityAssertion__performExpiringActivityWithReason_usingBlock___block_invoke;
  v10[3] = &unk_1E51F8650;
  v10[4] = a4;
  id v7 = [(_NSActivityAssertion *)v6 _initWithActivityOptions:0x1000000000FFLL reason:a3 expirationHandler:v10];
  v8 = +[_NSActivityAssertion _expiringTaskExecutionQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70___NSActivityAssertion__performExpiringActivityWithReason_usingBlock___block_invoke_2;
  v9[3] = &unk_1E51F7EE0;
  v9[4] = v7;
  v9[5] = a4;
  dispatch_async(v8, v9);
}

+ (id)_expiringTaskExecutionQueue
{
  if (qword_1EB1ED318 != -1) {
    dispatch_once(&qword_1EB1ED318, &__block_literal_global_3);
  }
  return (id)qword_1EB1ED320;
}

+ (id)_expirationHandlerExecutionQueue
{
  if (qword_1EB1ED328 != -1) {
    dispatch_once(&qword_1EB1ED328, &__block_literal_global_6);
  }
  return (id)qword_1EB1ED330;
}

+ (void)_dumpExpiringActivitives
{
  v2 = +[_NSActivityAssertion _expiringAssertionManagementQueue];

  dispatch_async(v2, &__block_literal_global_12);
}

+ (void)_expireAllActivies
{
  v2 = +[_NSActivityAssertion _expiringAssertionManagementQueue];

  dispatch_async(v2, &__block_literal_global_15);
}

- (id)debugDescription
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSActivityAssertion;
  return +[NSString stringWithFormat:@"%@ 0x%16llx %@ %@", [(_NSActivityAssertion *)&v3 debugDescription], self->_options, self->_reason, self->_processAssertion];
}

- (void)_fireExpirationHandler
{
  v4[5] = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[_NSActivityAssertion _expiringAssertionManagementQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46___NSActivityAssertion__fireExpirationHandler__block_invoke;
  v4[3] = &unk_1E51F71D0;
  v4[4] = self;
  dispatch_async(v3, v4);
}

+ (void)_performActivityWithOptions:(unint64_t)a3 reason:(id)a4 usingBlock:(id)a5
{
  if (!a4 || !_NSIsNSString() || ![a4 length]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot begin activity without reason string or empty reason string" userInfo:0]);
  }
  id v8 = [[_NSActivityAssertion alloc] _initWithActivityOptions:a3 reason:a4 expirationHandler:0];
  _CFSetTSD();
  (*((void (**)(id))a5 + 2))(a5);
  _CFSetTSD();
  [v8 _endFromDealloc:0];
}

- (BOOL)_isEnded
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_ended);
  return v2 & 1;
}

@end