@interface BLSAssertionAcquisitionObserver
+ (BLSAssertionAcquisitionObserver)observerWithCompletion:(id)a3;
- (void)assertion:(id)a3 didCancelWithError:(id)a4;
- (void)assertion:(id)a3 didFailToAcquireWithError:(id)a4;
- (void)assertionWasAcquired:(id)a3;
- (void)completeForAssertion:(uint64_t)a3 success:(void *)a4 error:;
- (void)initWithCompletion:(void *)a1;
@end

@implementation BLSAssertionAcquisitionObserver

+ (BLSAssertionAcquisitionObserver)observerWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = -[BLSAssertionAcquisitionObserver initWithCompletion:](objc_alloc((Class)a1), v4);

  return (BLSAssertionAcquisitionObserver *)v5;
}

- (void)initWithCompletion:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)BLSAssertionAcquisitionObserver;
    id v4 = objc_msgSendSuper2(&v8, sel_init);
    a1 = v4;
    if (v4)
    {
      *((_DWORD *)v4 + 2) = 0;
      uint64_t v5 = MEMORY[0x1BA99C630](v3);
      v6 = (void *)a1[2];
      a1[2] = v5;
    }
  }

  return a1;
}

- (void)assertionWasAcquired:(id)a3
{
}

- (void)completeForAssertion:(uint64_t)a3 success:(void *)a4 error:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    [v7 removeObserver:a1];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v9 = (void (**)(void, void, void))MEMORY[0x1BA99C630](*(void *)(a1 + 16));
    v10 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    v11 = bls_assertions_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [v7 explanation];
      v13 = objc_msgSend(v8, "bls_loggingString");
      int v14 = 134219010;
      uint64_t v15 = a1;
      __int16 v16 = 2048;
      id v17 = v7;
      __int16 v18 = 2114;
      v19 = v12;
      __int16 v20 = 1024;
      int v21 = a3;
      __int16 v22 = 2114;
      v23 = v13;
      _os_log_debug_impl(&dword_1B55DE000, v11, OS_LOG_TYPE_DEBUG, "%p completed acquisition for assertion:%p:%{public}@ with success:%{BOOL}u error:%{public}@", (uint8_t *)&v14, 0x30u);
    }
    ((void (**)(void, uint64_t, id))v9)[2](v9, a3, v8);
  }
}

- (void)assertion:(id)a3 didFailToAcquireWithError:(id)a4
{
}

- (void)assertion:(id)a3 didCancelWithError:(id)a4
{
}

- (void).cxx_destruct
{
}

@end