@interface sec_LWCRExecutor
+ (id)executor;
- (BOOL)evaluateRequirements:(id)a3 withFacts:(id)a4;
@end

@implementation sec_LWCRExecutor

- (BOOL)evaluateRequirements:(id)a3 withFacts:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  memset(&v37[1], 170, 24);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke;
  aBlock[3] = &unk_1E5477CA0;
  id v36 = v6;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke_2;
  v33[3] = &unk_1E5477CC8;
  id v34 = v36;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __51__sec_LWCRExecutor_evaluateRequirements_withFacts___block_invoke_3;
  v31[3] = &unk_1E5477CF0;
  id v7 = v34;
  id v32 = v7;
  v37[0] = &unk_1ED849A68;
  v8 = v31;
  v9 = v33;
  v37[1] = _Block_copy(aBlock);
  v10 = _Block_copy(v9);

  v37[2] = v10;
  v11 = _Block_copy(v8);

  v37[3] = v11;
  v30[0] = v37;
  v30[1] = 0;
  *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v12 = *((_OWORD *)v5 + 4);
  *(_OWORD *)&v41.runtime = *((_OWORD *)v5 + 3);
  *(_OWORD *)&v41.lookup.index_count = v12;
  *(_OWORD *)&v41.sorted = *((_OWORD *)v5 + 5);
  v41.var0.ccstate.der_end = (char *)*((void *)v5 + 12);
  if (der_vm_context_is_valid())
  {
    long long v13 = *((_OWORD *)v5 + 4);
    *(_OWORD *)&v41.runtime = *((_OWORD *)v5 + 3);
    *(_OWORD *)&v41.lookup.index_count = v13;
    *(_OWORD *)&v41.sorted = *((_OWORD *)v5 + 5);
    v41.var0.ccstate.der_end = (char *)*((void *)v5 + 12);
    uint64_t v44 = 0;
    long long v42 = 0u;
    long long v43 = 0u;
    int v38 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    TLE::Executor::getDependentOpsFromDictionary((uint64_t)&v42, (uint64_t)v30, &v41);
    if (v42)
    {
      int v28 = v42;
      long long v29 = (unint64_t)v43;
    }
    else
    {
      if (v44 != 1) {
        operator new();
      }
      if (!*((void *)&v43 + 1)) {
        goto LABEL_33;
      }
      unint64_t v16 = 8 * v44;
      if (*((void *)&v43 + 1) + v16 < *((void *)&v43 + 1) || HIDWORD(v16)) {
        os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v14);
      }
      if ((v16 & 0xFFFFFFF8) == 0) {
LABEL_33:
      }
        os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v14);
      int v28 = 0;
      long long v29 = 0u;
      libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::reset((void **)&v29 + 1, **((void ***)&v43 + 1));
    }
    v17 = (void *)*((void *)&v43 + 1);
    if (*((void *)&v43 + 1))
    {
      if (v44)
      {
        uint64_t v18 = 8 * v44;
        v19 = (void **)*((void *)&v43 + 1);
        do
        {
          v20 = *v19;
          if (*v19)
          {
            uint64_t v21 = v20[1];
            if (v21 <= 0)
            {
              exception = __cxa_allocate_exception(8uLL);
              void *exception = "Over-release of an object";
              __cxa_throw(exception, MEMORY[0x1E4FBA308], 0);
            }
            uint64_t v22 = v21 - 1;
            v20[1] = v22;
            if (!v22) {
              (*(void (**)(void *))(*v20 + 8))(v20);
            }
          }
          *v19++ = 0;
          v18 -= 8;
        }
        while (v18);
      }
      free(v17);
    }
    if (v28)
    {
      BOOL v15 = 0;
    }
    else
    {
      uint64_t v23 = **((void **)&v29 + 1);
      *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v41.runtime = v24;
      *(_OWORD *)&v41.lookup.index_count = v24;
      (*(void (**)(der_vm_context *__return_ptr, void, void *))(v23 + 16))(&v41, *((void *)&v29 + 1), v37);
      if (LODWORD(v41.runtime)) {
        BOOL v25 = 1;
      }
      else {
        BOOL v25 = LOBYTE(v41.dictionary_tag) == 0;
      }
      BOOL v15 = !v25;
    }
  }
  else
  {
    BOOL v15 = 0;
    long long v29 = 0x12uLL;
  }
  libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::reset((void **)&v29 + 1);

  return v15;
}

+ (id)executor
{
  v2 = objc_alloc_init(sec_LWCRExecutor);

  return v2;
}

@end