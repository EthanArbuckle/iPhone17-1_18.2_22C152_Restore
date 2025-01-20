BOOL sub_234576300()
{
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  if (sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0)) {
    sub_23459B854();
  }
  return v2 != 0;
}

void sub_234576ECC(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 72))
  {
    v3 = *(void **)(v1 + 64);
    *(void *)(v1 + 64) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    if (v5)
    {
      *(void *)(v4 + 40) = 0;

      uint64_t v4 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v4 + 72) = 1;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v6 = *(id *)(*(void *)(a1 + 32) + 48);
    uint64_t v8 = [v6 countByEnumeratingWithState:v7 objects:&v32 count:16];
    if (v8)
    {
      uint64_t v12 = v8;
      uint64_t v13 = *(void *)v33;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v6);
          }
          [*(void **)(a1 + 32) welcomeAgent:v9 *(void *)(*((void *)&v32 + 1) + 8 * v14++) v10 v11];
        }
        while (v12 != v14);
        uint64_t v12 = [v6 countByEnumeratingWithState:v9 objects:&v32 count:16];
      }
      while (v12);
    }

    uint64_t v15 = *(void *)(a1 + 32);
    v16 = *(void **)(v15 + 48);
    *(void *)(v15 + 48) = 0;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = *(id *)(*(void *)(a1 + 32) + 56);
    uint64_t v19 = [v17 countByEnumeratingWithState:v18 objects:&v28 count:16];
    if (v19)
    {
      uint64_t v23 = v19;
      uint64_t v24 = *(void *)v29;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v17);
          }
          [*(void **)(a1 + 32) welcomeAgent:v20 with:*(void *)(*((void *)&v28 + 1) + 8 * v25++) with:v21 with:v22];
        }
        while (v23 != v25);
        uint64_t v23 = [v17 countByEnumeratingWithState:v20 objects:v36 count:16];
      }
      while (v23);
    }

    uint64_t v26 = *(void *)(a1 + 32);
    v27 = *(void **)(v26 + 56);
    *(void *)(v26 + 56) = 0;
  }
}

uint64_t sub_23457772C(uint64_t a1)
{
  return MEMORY[0x270F97EE0](*(void *)(a1 + 32));
}

uint64_t sub_234577B7C(uint64_t a1)
{
  return MEMORY[0x270F97FE8](*(void *)(a1 + 32));
}

void sub_234577B84(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [MEMORY[0x263F08850] v2 v3 v4 v5];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 removeItemAtURL:v6 error:*(void *)(a1 + 32)];
}

void sub_2345782A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23457836C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_234578384(uint64_t a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_assignActivityManager_slot_, *(void *)(a1 + 40), a2, a5);
}

void sub_234578468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234578578(uint64_t a1, void *a2, unsigned __int8 a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = a2;
  uint64_t v11 = [v5 countByEnumeratingWithState:v6 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v5);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (*[v14 _managerImplPtr:v7:v8:v9:v10:v17])
        {
          uint64_t v15 = *(void ***)(*(void *)(a1 + 32) + 8);
          v16 = (long long *)[v14 _managerImplPtr:v7 with:v8 with:v9 with:v10];
          sub_234597F44(v15, v16, a3);
        }
      }
      uint64_t v11 = [v5 countByEnumeratingWithState:v7 objects:&v17 count:16];
    }
    while (v11);
  }
}

void sub_2345786B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2345786D4(uint64_t a1, void *a2, unsigned __int8 a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = a2;
  uint64_t v7 = [v5 countByEnumeratingWithState:v6 objects:&v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        if ([v11 _callOutQueue_willDestroyWithTransitionContext:v12 completion:v13] == NO)
        {
          long long v20 = *(void ***)(*(void *)(a1 + 32) + 8);
          uint64_t v21 = (long long *)[v10 _secondTierManagerImplPtr:v16 v17:v17 v18:v18 v19:v19];
          sub_234597F44(v20, v21, a3);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:v16 objects:v22 count:16];
    }
    while (v7);
  }
}

void sub_23457880C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_2345788B0@<X0>(unsigned __int8 *a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x40uLL);
  result = sub_23457890C(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_2345788F8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_23457890C(void *a1, unsigned __int8 *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E752408;
  sub_234598190(a1 + 3, *a2);
  return a1;
}

void sub_234578958(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_23457896C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E752408;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_23457898C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E752408;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x237DC08F0);
}

void sub_2345789E0(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 32);
  sub_234578A10(&v1);
}

void sub_234578A10(void ***a1)
{
  uint64_t v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    id v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 4;
        id v6 = v4;
        sub_234578A84(&v6);
      }
      while (v4 != v2);
      id v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_234578A84(void ***a1)
{
  v2 = *a1;
  if (*v2)
  {
    sub_234578AD8((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_234578AD8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 16)
  {
    uint64_t v4 = *(std::__shared_weak_count **)(i - 8);
    if (v4) {
      sub_234578B24(v4);
    }
  }
  a1[1] = v2;
}

void sub_234578B24(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

BOOL sub_234578B98(void *a1, uint64_t a2, uint64_t *a3)
{
  id v4 = a1;
  uint64_t v9 = (const char *)[v4 UTF8String];
  uint64_t v18 = 0;
  uint64_t v10 = strtoll_l(v9, &v18, 0, 0);
  uint64_t v11 = v18;
  v16 = (char *)&v9[objc_msgSend(v4, v12, v13, v14, v15)];
  if (a3 && v11 == v16) {
    *a3 = v10;
  }
  return v11 == v16;
}

void sub_234578C74()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"error-message";
  v4[0] = objc_opt_class();
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v0 forKeys:(uint64_t)v4 count:1];
  uint64_t v2 = (void *)qword_2687AA038;
  qword_2687AA038 = v1;
}

void sub_234579168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23457935C(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2345793E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23457945C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)XRSpace;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_23457948C(void *a1)
{
}

void sub_2345795A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2345795C8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7[1] = *MEMORY[0x263EF8340];
  v7[0] = *MEMORY[0x263EFF478];
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:a2 count:v7];
  uint64_t v6 = (void *)qword_2687AA050;
  qword_2687AA050 = v5;
}

void sub_234579728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234579814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2345798E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_234579900(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_234579AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234579BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234579E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_234579EEC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_234579EFC(uint64_t a1)
{
}

void sub_234579F04(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_23457A07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_23457A0B0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void sub_23457A204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v17);

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_23457A238(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void sub_23457A378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v16);

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_23457A3A8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void sub_23457A514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v16);

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_23457A544(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void sub_23457A8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_23457A974(uint64_t a1, void *a2)
{
  id v27 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v12 = [v4 _observer_weakRetained:v5 withTransition:v6 withExtra:v7];
  if (v12
    && (![v8 _weak_setTarget:v9 withTransitionContext:v10 completion:v11]
     || (WeakRetained(v13, v14, v15, v16),
         uint64_t v17 = objc_claimAutoreleasedReturnValue(),
         [v27 v18:v19 v20:v21],
         long long v22 = objc_claimAutoreleasedReturnValue(),
         v22,
         v17,
         v17 == v22)))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    long long v23 = [WeakRetained weakRetainedWithObject:v8 queue:v9 retainUntil:v10 completion:v11];
    [v23 removeNotificationShim:v24 withOptions:(WeakRetained)v25 withCompletion:v26];
  }
}

void sub_23457AA60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23457ACA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23457ADAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_23457ADD0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  [*(void **)(a1 + 32) hello:a2 a3:a4 a5:a5];
  uint64_t v10 = *(void **)(a1 + 32);

  return [v10 goodbye:v6 with:v7 and:v8 and:v9];
}

void sub_23457AF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)_XRSpaceNotificationShim;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_23457B0E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23457B154(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a2 == 2)
  {
    id v14 = objc_begin_catch(exc_buf);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v20 = [v12 v15:v16 v17:v18];
      NSLog(&cfstr_ExceptionThrow.isa);
    }
    else
    {
      NSLog(&cfstr_ExceptionThrow_0.isa);
    }

    objc_end_catch();
    JUMPOUT(0x23457B128);
  }
  objc_begin_catch(exc_buf);
  uint64_t v19 = *(void **)&v12[v13];
  *(void *)&v12[v13] = 0;

  objc_exception_rethrow();
}

void sub_23457B20C(_Unwind_Exception *a1)
{
}

void sub_23457B2C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23457B360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23457B374(void *a1)
{
  uint64_t v1 = a1;
  int v2 = 0;
  uint64_t v8 = (dispatch_block_t *)v1;
  atomic_compare_exchange_strong_explicit(v1 + 8, (unsigned int *)&v2, 1u, memory_order_relaxed, memory_order_relaxed);
  if (!v2)
  {
    uint64_t v3 = dispatch_get_global_queue(21, 0);
    dispatch_async(v3, v8[1]);

    dispatch_block_t v4 = v8[1];
    v8[1] = 0;

    [v8[2] removeObserver:v5 forKeyPath:@"isFinished" context:qword_2687A9970];
    dispatch_block_t v6 = v8[2];
    v8[2] = 0;

    dispatch_block_t v7 = v8[3];
    v8[3] = 0;
  }
}

void sub_23457B440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23457B4C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23457B5BC(void *a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1;
  char v43 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  dispatch_block_t v6 = sub_23457BE44(1, v2, v3, v4, v5);
  uint64_t v8 = [v6 countByEnumeratingWithState:v7 objects:(id *)&v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v40 != v10) {
        objc_enumerationMutation(v6);
      }
      v1[2](v1, *(void *)(*((void *)&v39 + 1) + 8 * v11), &v43);
      if (v43) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v6 countByEnumeratingWithState:v12 objects:&v39 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    dispatch_block_t v6 = sub_23457B934(1, v13, v14, v15, v16);
    uint64_t v18 = [v6 countByEnumeratingWithState:v17 objects:&v35 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v6);
          }
          long long v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v23 = v22;
          uint64_t v25 = [v23 countByEnumeratingWithState:v24 objects:&v31 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v32;
            while (2)
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v32 != v27) {
                  objc_enumerationMutation(v23);
                }
                v1[2](v1, *(void *)(*((void *)&v31 + 1) + 8 * j), &v43);
                if (v43)
                {

                  goto LABEL_26;
                }
              }
              uint64_t v26 = [v23 countByEnumeratingWithState:v29 objects:&v31 count:16];
              if (v26) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v19 = [v6 countByEnumeratingWithState:v30 objects:v45 count:16];
      }
      while (v19);
    }
  }
LABEL_26:
}

uint64_t sub_23457B818(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 announceUsedCapability:a2 version:a5];
}

uint64_t sub_23457B8CC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(void **)(a1 + 32) addObject:a2 withObject:a4 withObject:a5];
}

id sub_23457B934(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  dispatch_block_t v6 = [MEMORY[0x263F08B88] a2:a3:a4:a5];
  uint64_t v11 = [v6 _threadDictionary:v7 withKey:v8 withValue:v9 withValue:v10];
  uint64_t v15 = [v11 objectForKeyedSubscript:v12 key:@"XRCapabilityAdditionalContextSets" defaultValue:v13 defaultValueType:v14];

  if (!a1 && !v15)
  {
    uint64_t v15 = objc_opt_new();
    uint64_t v20 = [v6 _threadDictionary:v16 withKey:v17 withValue:v18 withValue:v19];
    [v20 setObject:v21 forKeyedSubscript:(uint64_t)v15];
  }

  return v15;
}

void sub_23457BD18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  uint64_t Index = [v6 firstIndex:v8, v9, v10, v11];
  uint64_t v17 = [v6 _lastIndex:v13, v14, v15, v16];
  uint64_t v22 = [v6 firstIndex:v18, v19, v20, v21];

  [*(void **)(*(void *)(a1 + 32) + 216) objectForKeyedSubscript:v23 withKey:v7 withObject:v24 withObject:v25];
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, uint64_t, id))(v5 + 16))(v5, v7, Index, v17 - v22 + 1, v26);
}

id sub_23457BE44(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = [MEMORY[0x263F08B88] a2:a3:a4:a5];
  uint64_t v11 = [v6 _threadDictionary:v7 withKey:v8 withValue:v9 withValue:v10];
  uint64_t v15 = [v11 objectForKeyedSubscript:v12 key:@"XRCapabilityContextSet" defaultValue:v13 defaultValueIsNil:v14];

  if (!a1 && !v15)
  {
    uint64_t v15 = [MEMORY[0x263F088B0] _weakObjectsHashTable:v16 withHash:v17 withTag:v18 withCount:v19];
    uint64_t v24 = [v6 objc_msgSend_threadDictionary:v20, v21, v22, v23];
    [v24 setObject:v25 forKeyedSubscript:(uint64_t)v15];
  }

  return v15;
}

void sub_23457C140(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7[1] = *MEMORY[0x263EF8340];
  v7[0] = *MEMORY[0x263EFF478];
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:a2 count:v7];
  id v6 = (void *)qword_2687AA058;
  qword_2687AA058 = v5;
}

void sub_23457C3D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23457C518(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23457C580()
{
  qword_2687AA070 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

uint64_t sub_23457C5D0(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a3;
  id v11 = [NSString alloc];
  uint64_t v14 = [v11 initWithFormat:v12 arguments:(uint64_t)v10, (uint64_t)&a9, v13];
  if ([v14 length:v15, v16, v17, v18])
  {
    [v14 dataUsingEncoding:4];
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    do
    {
      uint64_t hasSpaceAvailable = [a1 hasSpaceAvailable:v22, v23, v24, v25];
      if (!hasSpaceAvailable) {
        break;
      }
      id v26 = v26;
      uint64_t v32 = [v26 v28:v29 v30:v31];
      uint64_t v37 = [v26 lengthWith:v33, v34, v35, v36];
      uint64_t v40 = [a1 write:v38 maxLength:v32];
      uint64_t v45 = v40;
      if (v40 < 1)
      {
        if (!v40) {
          abort();
        }
        uint64_t hasSpaceAvailable = 0;
        break;
      }
      if (v40 != [v26 length:v41, v42, v43, v44])
      {
        uint64_t v50 = [v26 lengthWith:v46, v47, v48, v49];
        uint64_t v53 = [v26 subdataWithRange:v51];

        uint64_t v45 = 0;
        id v26 = (id)v53;
      }
    }
    while (v45 != [v26 length:v46, v47, v48, v49]);
  }
  else
  {
    uint64_t hasSpaceAvailable = 1;
  }

  return hasSpaceAvailable;
}

void sub_23457CB08()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"xs:annotation";
  v4[0] = objc_opt_class();
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v0 forKeys:(uint64_t)v4 count:1];
  int v2 = (void *)qword_2687AA078;
  qword_2687AA078 = v1;
}

void sub_23457CDFC()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"xs:pattern";
  v4[0] = objc_opt_class();
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v0 forKeys:(uint64_t)v4 count:1];
  int v2 = (void *)qword_2687AA088;
  qword_2687AA088 = v1;
}

void sub_23457D004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_23457D014(uint64_t result)
{
  if (*(unsigned char *)(result + 88)) {
    BOOL v1 = 1;
  }
  else {
    BOOL v1 = *(void *)(result + 16) > 4uLL;
  }
  if (!v1)
  {
    int v2 = *(void **)result;
    if (*(void *)result == result + 8)
    {
LABEL_14:
      *(unsigned char *)(result + 88) = 1;
    }
    else
    {
      uint64_t v3 = 0;
      while (v3 != 4)
      {
        *(_OWORD *)(result + 24 + 16 * v3) = *((_OWORD *)v2 + 2);
        uint64_t v4 = (void *)v2[1];
        if (v4)
        {
          do
          {
            uint64_t v5 = v4;
            uint64_t v4 = (void *)*v4;
          }
          while (v4);
        }
        else
        {
          do
          {
            uint64_t v5 = (void *)v2[2];
            BOOL v6 = *v5 == (void)v2;
            int v2 = v5;
          }
          while (!v6);
        }
        ++v3;
        int v2 = v5;
        if (v5 == (void *)(result + 8)) {
          goto LABEL_14;
        }
      }
      __break(1u);
    }
  }
  return result;
}

void sub_23457D128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23457D180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t **sub_23457D190(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = a2;
  uint64_t v5 = v4;
  if (v3)
  {
    if (v3 != v4) {
      sub_23457D9A0(v3 + 1, v4[1], v4 + 2);
    }
    *((_OWORD *)v3 + 2) = *((_OWORD *)v5 + 2);
    long long v6 = *((_OWORD *)v5 + 3);
    long long v7 = *((_OWORD *)v5 + 4);
    long long v8 = *((_OWORD *)v5 + 5);
    *((unsigned char *)v3 + 96) = *((unsigned char *)v5 + 96);
    *((_OWORD *)v3 + 4) = v7;
    *((_OWORD *)v3 + 5) = v8;
    *((_OWORD *)v3 + 3) = v6;
    sub_23457D014((uint64_t)(v3 + 1));
  }

  return v3;
}

void sub_23457D228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23457D440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23457D4D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_23457D4E4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_23457E594(exception, "Trying to call lastIndex when the set is empty.");
    __cxa_throw(exception, (struct type_info *)off_264BF0AC0, MEMORY[0x263F8C068]);
  }
  uint64_t v3 = *(void **)(a1 + 8);
  BOOL v1 = (void *)(a1 + 8);
  int v2 = v3;
  if (v3)
  {
    do
    {
      uint64_t v4 = v2;
      int v2 = (void *)v2[1];
    }
    while (v2);
  }
  else
  {
    do
    {
      uint64_t v4 = (void *)v1[2];
      BOOL v5 = *v4 == (void)v1;
      BOOL v1 = v4;
    }
    while (v5);
  }
  return v4[5];
}

void sub_23457D570(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL sub_23457D590(uint64_t a1, unint64_t a2)
{
  if (*(unsigned char *)(a1 + 88))
  {
    unint64_t v2 = *(void *)(a1 + 16);
    if (v2 > 4) {
      sub_23459B8F4();
    }
    if (v2)
    {
      for (uint64_t i = (unint64_t *)(a1 + 32); *(i - 1) > a2 || *i < a2; i += 2)
      {
        if (!--v2) {
          return 0;
        }
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    long long v7 = *(void **)(a1 + 8);
    BOOL v5 = (void *)(a1 + 8);
    long long v6 = v7;
    if (!v7) {
      goto LABEL_20;
    }
    long long v8 = v5;
    do
    {
      unint64_t v9 = v6[5];
      BOOL v10 = v9 >= a2;
      if (v9 >= a2) {
        id v11 = v6;
      }
      else {
        id v11 = v6 + 1;
      }
      if (v10) {
        long long v8 = v6;
      }
      long long v6 = (void *)*v11;
    }
    while (*v11);
    if (v8 == v5 || v8[4] > a2) {
LABEL_20:
    }
      long long v8 = v5;
    return v8 != v5;
  }
}

BOOL sub_23457D650(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 0;
  }
  BOOL v5 = *(void **)(a1 + 8);
  uint64_t v3 = (void *)(a1 + 8);
  uint64_t v4 = v5;
  if (!v5) {
    goto LABEL_13;
  }
  long long v6 = v3;
  do
  {
    unint64_t v7 = v4[5];
    BOOL v8 = v7 >= a2;
    if (v7 >= a2) {
      unint64_t v9 = v4;
    }
    else {
      unint64_t v9 = v4 + 1;
    }
    if (v8) {
      long long v6 = v4;
    }
    uint64_t v4 = (void *)*v9;
  }
  while (*v9);
  if (v6 == v3 || a2 + a3 - 1 < v6[4]) {
LABEL_13:
  }
    long long v6 = v3;
  return v6 != v3;
}

void sub_23457D750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_23457D760(void *result)
{
  unint64_t v2 = (void *)*result;
  BOOL v1 = (void *)result[1];
  if ((void *)*result != v1)
  {
    uint64_t v3 = result[2];
    if (v3 == v2[5])
    {
      uint64_t v4 = (void *)v2[1];
      if (v4)
      {
        do
        {
          BOOL v5 = v4;
          uint64_t v4 = (void *)*v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          BOOL v5 = (void *)v2[2];
          BOOL v6 = *v5 == (void)v2;
          unint64_t v2 = v5;
        }
        while (!v6);
      }
      void *result = v5;
      if (v5 == v1) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = v5[4];
      }
    }
    else
    {
      uint64_t v7 = v3 + 1;
    }
    result[2] = v7;
  }
  return result;
}

void sub_23457D878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23457D990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t **sub_23457D9A0(uint64_t **result, void *a2, void *a3)
{
  BOOL v5 = result;
  if (result[2])
  {
    BOOL v6 = *result;
    uint64_t v7 = result[1];
    void *result = (uint64_t *)(result + 1);
    void v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      BOOL v8 = (uint64_t *)v6[1];
    }
    else {
      BOOL v8 = v6;
    }
    uint64_t v14 = result;
    uint64_t v15 = v8;
    uint64_t v16 = v8;
    if (v8)
    {
      uint64_t v15 = sub_23457DD64((uint64_t)v8);
      if (a2 != a3)
      {
        unint64_t v9 = a2;
        do
        {
          *((_OWORD *)v8 + 2) = *((_OWORD *)v9 + 2);
          sub_23457DB04(v5, v8);
          BOOL v8 = v15;
          uint64_t v16 = v15;
          if (v15) {
            uint64_t v15 = sub_23457DD64((uint64_t)v15);
          }
          BOOL v10 = (void *)v9[1];
          if (v10)
          {
            do
            {
              a2 = v10;
              BOOL v10 = (void *)*v10;
            }
            while (v10);
          }
          else
          {
            do
            {
              a2 = (void *)v9[2];
              BOOL v11 = *a2 == (void)v9;
              unint64_t v9 = a2;
            }
            while (!v11);
          }
          if (!v8) {
            break;
          }
          unint64_t v9 = a2;
        }
        while (a2 != a3);
      }
    }
    result = (uint64_t **)sub_23457DDB8((uint64_t)&v14);
  }
  if (a2 != a3)
  {
    do
    {
      result = (uint64_t **)sub_23457DE64(v5, (_OWORD *)a2 + 2);
      uint64_t v12 = (void *)a2[1];
      if (v12)
      {
        do
        {
          uint64_t v13 = v12;
          uint64_t v12 = (void *)*v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          uint64_t v13 = (void *)a2[2];
          BOOL v11 = *v13 == (void)a2;
          a2 = v13;
        }
        while (!v11);
      }
      a2 = v13;
    }
    while (v13 != a3);
  }
  return result;
}

void sub_23457DAF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_23457DDB8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_23457DB04(uint64_t **a1, uint64_t *a2)
{
  uint64_t v3 = a1 + 1;
  uint64_t v4 = a1[1];
  if (v4)
  {
    do
    {
      while (1)
      {
        uint64_t v3 = (uint64_t **)v4;
        if (a2[5] >= (unint64_t)v4[4]) {
          break;
        }
        uint64_t v4 = (uint64_t *)*v4;
        BOOL v5 = v3;
        if (!*v3) {
          goto LABEL_8;
        }
      }
      uint64_t v4 = (uint64_t *)v4[1];
    }
    while (v4);
    BOOL v5 = v3 + 1;
  }
  else
  {
    BOOL v5 = a1 + 1;
  }
LABEL_8:
  sub_23457DB74(a1, (uint64_t)v3, v5, a2);
  return a2;
}

uint64_t *sub_23457DB74(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  BOOL v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = sub_23457DBCC(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_23457DBCC(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      unint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            BOOL v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            void *v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            unint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        unint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void *sub_23457DD64(uint64_t a1)
{
  result = *(void **)(a1 + 16);
  if (result)
  {
    uint64_t v3 = (void *)*result;
    if (*result == a1)
    {
      void *result = 0;
      while (1)
      {
        uint64_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          result = v4;
          uint64_t v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; uint64_t v3 = (void *)result[1])
      {
        do
        {
          result = v3;
          uint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t sub_23457DDB8(uint64_t a1)
{
  sub_23457DE10(*(void *)a1, *(void **)(a1 + 16));
  unint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        unint64_t v2 = v3;
        uint64_t v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    sub_23457DE10(*(void *)a1, v2);
  }
  return a1;
}

void sub_23457DE10(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_23457DE10(a1, *a2);
    sub_23457DE10(a1, a2[1]);
    operator delete(a2);
  }
}

_OWORD *sub_23457DE64(uint64_t **a1, _OWORD *a2)
{
  uint64_t v4 = operator new(0x30uLL);
  BOOL v5 = v4;
  void v4[2] = *a2;
  int v6 = a1 + 1;
  uint64_t v7 = a1[1];
  if (v7)
  {
    do
    {
      while (1)
      {
        int v6 = (uint64_t **)v7;
        if (*((void *)v4 + 5) >= (unint64_t)v7[4]) {
          break;
        }
        uint64_t v7 = (uint64_t *)*v7;
        int v8 = v6;
        if (!*v6) {
          goto LABEL_8;
        }
      }
      uint64_t v7 = (uint64_t *)v7[1];
    }
    while (v7);
    int v8 = v6 + 1;
  }
  else
  {
    int v8 = a1 + 1;
  }
LABEL_8:
  sub_23457DB74(a1, (uint64_t)v6, v8, (uint64_t *)v4);
  return v5;
}

uint64_t *sub_23457DEF8(uint64_t a1, _OWORD *a2)
{
  unint64_t v3 = *(void *)a2 - 1;
  if (!*(void *)a2) {
    unint64_t v3 = 0;
  }
  BOOL v5 = (uint64_t *)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 8);
  if (!v4) {
    goto LABEL_34;
  }
  int v6 = (uint64_t *)(a1 + 8);
  do
  {
    unint64_t v7 = v4[5];
    BOOL v8 = v7 >= v3;
    if (v7 >= v3) {
      unint64_t v9 = v4;
    }
    else {
      unint64_t v9 = v4 + 1;
    }
    if (v8) {
      int v6 = v4;
    }
    uint64_t v4 = (void *)*v9;
  }
  while (*v9);
  if (v6 == v5)
  {
LABEL_34:
    return sub_23457E420((uint64_t **)a1, (void *)(a1 + 8), a2);
  }
  else
  {
    long long v19 = *a2;
    unint64_t v11 = *((void *)&v19 + 1);
    unint64_t v10 = v19;
    while (1)
    {
      unint64_t v13 = v6[4];
      unint64_t v12 = v6[5];
      if ((v12 == -1 || v12 + 1 != v10) && (!v13 || v13 - 1 != v11) && (v12 < v10 || v11 < v13)) {
        break;
      }
      if (v13 < v10) {
        unint64_t v10 = v6[4];
      }
      if (v11 <= v12) {
        unint64_t v11 = v6[5];
      }
      uint64_t v17 = sub_23457E028((uint64_t **)a1, v6);
      operator delete(v6);
      int v6 = v17;
      if (v5 == v17)
      {
        int v6 = v5;
        break;
      }
    }
    *(void *)&long long v19 = v10;
    *((void *)&v19 + 1) = v11;
    return sub_23457E420((uint64_t **)a1, v6, &v19);
  }
}

uint64_t *sub_23457E028(uint64_t **a1, uint64_t *a2)
{
  unint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      unint64_t v3 = v2;
      unint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      unint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  int v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_23457E09C(v6, a2);
  return v3;
}

uint64_t *sub_23457E09C(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      unint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      unint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  int v6 = (uint64_t **)v3[2];
  unint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *int v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      unint64_t v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      unint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      unint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *unint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        result = v7;
      }
      unint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    uint64_t v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      uint64_t v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        uint64_t *v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        void v7[2] = (uint64_t)v15;
        uint64_t v16 = v7;
      }
      else
      {
        uint64_t v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      uint64_t v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *uint64_t v24 = v23;
      goto LABEL_72;
    }
    uint64_t v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      uint64_t v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    unint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    void v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      result = v7;
    }
    unint64_t v7 = *(uint64_t **)v12;
  }
  long long v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  uint64_t v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    uint64_t v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    uint64_t *v20 = (uint64_t)v7;
    void v7[2] = (uint64_t)v20;
    long long v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  uint64_t v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t *sub_23457E420(uint64_t **a1, void *a2, _OWORD *a3)
{
  int v6 = (uint64_t *)operator new(0x30uLL);
  *((_OWORD *)v6 + 2) = *a3;
  unint64_t v7 = (uint64_t **)sub_23457E4AC(a1, a2, &v9, v6 + 4);
  sub_23457DB74(a1, v9, v7, v6);
  return v6;
}

void sub_23457E498(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_23457E4AC(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v4 = a1 + 1;
  if (a1 + 1 != a2 && a2[5] < *a4)
  {
    while (1)
    {
      int v5 = (void *)*v4;
      a2 = v4;
      if (!*v4) {
        break;
      }
      while (1)
      {
        uint64_t v4 = v5;
        if (v5[5] >= *a4) {
          break;
        }
        int v5 = (void *)v5[1];
        if (!v5) {
          goto LABEL_19;
        }
      }
    }
LABEL_20:
    *a3 = v4;
    return a2;
  }
  uint64_t v6 = *a2;
  if ((void *)*a1 == a2)
  {
    int v8 = a2;
  }
  else
  {
    if (v6)
    {
      unint64_t v7 = (void *)*a2;
      do
      {
        int v8 = v7;
        unint64_t v7 = (void *)v7[1];
      }
      while (v7);
    }
    else
    {
      uint64_t v9 = a2;
      do
      {
        int v8 = (void *)v9[2];
        BOOL v10 = *v8 == (void)v9;
        uint64_t v9 = v8;
      }
      while (v10);
    }
    unint64_t v11 = a4[1];
    if (v11 < v8[4])
    {
      while (1)
      {
        uint64_t v12 = (void *)*v4;
        a2 = v4;
        if (!*v4) {
          goto LABEL_20;
        }
        while (1)
        {
          uint64_t v4 = v12;
          if (v11 < v12[4]) {
            break;
          }
          uint64_t v12 = (void *)v12[1];
          if (!v12)
          {
LABEL_19:
            a2 = v4 + 1;
            goto LABEL_20;
          }
        }
      }
    }
  }
  if (v6)
  {
    *a3 = v8;
    return v8 + 1;
  }
  else
  {
    *a3 = a2;
  }
  return a2;
}

std::logic_error *sub_23457E594(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void sub_23457E704(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23457ECB0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void **)(a1 + 32);
  unint64_t v7 = *(void **)(a1 + 40);
  int v8 = [v7 a2:a3 a4:a4 a5:a5];
  LOBYTE(v6) = [v6 holdReceivedAgent:v9 ticket:(uint64_t)v7 ticket:(uint64_t)v8 ticket:v10];

  if ((v6 & 1) == 0)
  {
    uint64_t v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    [v14 _welcomeAgent:v11 withUser:v15 withDevice:v12 withApp:v13];
  }
}

uint64_t sub_23457EE38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__executeWelcomeForAgent_, *(void *)(a1 + 40), a4, a5);
}

uint64_t sub_23457F00C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  [*(void **)(a1 + 32) runAgentPrologue:a2 withTransitionContext:*(void *)(a1 + 40) completion:a4];
  [*(void **)(a1 + 32) runAgentPrologue:v6 withTransitionContext:*(void *)(a1 + 48) withCompletion:v7 withError:v8];
  [*(void **)(a1 + 32) executeAgent:v9 withTransitionContext:*(void *)(a1 + 40) completion:v10];
  [*(void **)(a1 + 32) executeAgent:v12 withTransitionContext:*(void *)(a1 + 48) completion:v13];
  [*(void **)(a1 + 32) runAgentEpilogue:v15 withTransitionContext:*(void *)(a1 + 40) withCompletion:v16];
  BOOL v21 = *(void **)(a1 + 32);
  uint64_t v22 = *(void *)(a1 + 48);

  return [v21 _runAgentEpilogue:v18 withTransitionContext:v22 completion:v19];
}

void sub_23457F078(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v4 = [v2 countByEnumeratingWithState:v3 objects:&v37 count:16];
  if (v4)
  {
    uint64_t v8 = v4;
    uint64_t v9 = *(void *)v38;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v2);
        }
        [*(void **)(a1 + 40) runAgentPrologue:v5 withTransitionContext:*(void *)(*((void *)&v37 + 1) + 8 * v10++) withTransitionContext:v6 withTransitionContext:v7];
      }
      while (v8 != v10);
      uint64_t v8 = [v2 countByEnumeratingWithState:v5 objects:v43 count:16];
    }
    while (v8);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = *(id *)(a1 + 32);
  uint64_t v13 = [v11 countByEnumeratingWithState:v12 objects:(id *)&v33 count:16];
  if (v13)
  {
    uint64_t v17 = v13;
    uint64_t v18 = *(void *)v34;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v11);
        }
        [*(void **)(a1 + 40) executeAgent:v14 withArguments:*(void *)(*((void *)&v33 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v11 countByEnumeratingWithState:v14 objects:(id *)&v33 count:16];
    }
    while (v17);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v20 = *(id *)(a1 + 32);
  uint64_t v22 = [v20 countByEnumeratingWithState:v21 objects:v41 count:16];
  if (v22)
  {
    uint64_t v26 = v22;
    uint64_t v27 = *(void *)v30;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v20);
        }
        [*(void **)(a1 + 40) runAgentEpilogue:v23 withTransitionContext:*(void *)(*((void *)&v29 + 1) + 8 * v28++) withTransitionContext:v24 withTransitionContext:v25 withTransitionContext:v29];
      }
      while (v26 != v28);
      uint64_t v26 = [v20 countByEnumeratingWithState:v23 objects:v41 count:16];
    }
    while (v26);
  }
}

void sub_23457F350(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  [*(void **)(a1 + 32) runAgentPrologue:a2 withTransitionContext:*(void *)(a1 + 40) completion:a4];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v6 = *(id *)(a1 + 48);
  uint64_t v8 = [v6 countByEnumeratingWithState:v7 objects:&v47 count:16];
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v48;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v6);
        }
        [*(void **)(a1 + 32) runAgentPrologue:v9 *(void *)(*((void *)&v47 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v6 countByEnumeratingWithState:v9 objects:&v47 count:16];
    }
    while (v12);
  }

  [*(void **)(a1 + 32) executeAgent:v15 withTransitionContext:*(void *)(a1 + 40) completion:v16];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v18 = *(id *)(a1 + 48);
  uint64_t v20 = [v18 countByEnumeratingWithState:v19 objects:&v43 count:16];
  if (v20)
  {
    uint64_t v24 = v20;
    uint64_t v25 = *(void *)v44;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(v18);
        }
        [*(void **)(a1 + 32) executeAgent:v21 withArgument:*(void *)(*((void *)&v43 + 1) + 8 * v26++) withArgument:v22 withArgument:v23];
      }
      while (v24 != v26);
      uint64_t v24 = [v18 countByEnumeratingWithState:v21 objects:v52 count:16];
    }
    while (v24);
  }

  [*(void **)(a1 + 32) runAgentEpilogue:v27 withTransitionContext:*(void *)(a1 + 40) withCompletion:v28 withError:v29];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v30 = *(id *)(a1 + 48);
  uint64_t v32 = [v30 countByEnumeratingWithState:v31 objects:&v39 count:16];
  if (v32)
  {
    uint64_t v36 = v32;
    uint64_t v37 = *(void *)v40;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(v30);
        }
        [*(void **)(a1 + 32) runAgentEpilogue:v33 withTransitionContext:*(void *)(*((void *)&v39 + 1) + 8 * v38++) withTransitionContext:v34 withTransitionContext:v35 withTransitionContext:v39];
      }
      while (v36 != v38);
      uint64_t v36 = [v30 countByEnumeratingWithState:v33 objects:v51 count:16];
    }
    while (v36);
  }
}

uint64_t XREngineeringTypeIDForMnemonic(void *a1)
{
  uint64_t v1 = qword_2687AA0D8;
  id v5 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_2687AA0D8, &unk_26E7524D0);
  }
  uint64_t v6 = [qword_2687AA0D0 indexOfObject:v2 after:v5 withOptions:v3 withContext:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return (unsigned __int16)v6;
  }
}

uint64_t sub_23457FA1C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = [MEMORY[0x263EFF9B0] orderedSetWithCapacity:252 objects:a2, a4, a5];
  uint64_t v6 = (void *)qword_2687AA0D0;
  qword_2687AA0D0 = v5;

  uint64_t v8 = qword_2687AA0D0;

  return MEMORY[0x270F9A6D0](v8, sel_addObjects_count_, XR_ENGINEERING_MNEMONIC_BY_ETYPE, 252, v7);
}

__CFString *XREngineeringMnemonicForTypeID(int a1)
{
  return XR_ENGINEERING_MNEMONIC_BY_ETYPE[a1];
}

uint64_t XREngineeringTypeUnwrapAny(void *a1, uint64_t a2)
{
  id v3 = a1;
  if ([v3 _engineeringType:v4:v5:v6:v7] == 107) {
    Value_fielduint64_t Index = [v3 value:v8 fieldIndex:a2];
  }
  else {
    Value_fielduint64_t Index = 0;
  }

  return Value_fieldIndex;
}

void sub_234580544()
{
  v0 = objc_opt_new();
  uint64_t v1 = objc_opt_new();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_23458060C;
  v12[3] = &unk_264BF1DA0;
  id v13 = v0;
  id v2 = v0;
  [v1 enumerateEngineeringTypeDefs:v3 usingBlock:v4];
  uint64_t v10 = [v2 v6:v7 v8:v9];
  uint64_t v11 = (void *)qword_2687AA0E0;
  qword_2687AA0E0 = v10;
}

void sub_23458060C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void **)(a1 + 32);
  [v3 v6:v7 v8:v9];
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  [v5 setObject:v4 forKeyedSubscript:v10];
}

id sub_234580B38(void *a1)
{
  id v1 = a1;
  if ([v1 _engineeringType:v2:v3:v4:v5] == 135)
  {
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    if ([v1 getValue:v6 fieldIndex:0])
    {
      if ([v1 getValue:v8 fieldIndex:1])
      {
        unint64_t v14 = [v27 v10:v11 v12:v12 v13:v13];
        v25[1] = bswap64([v26 v15:v16 v17:v18 v18:bswap64(v14)]);
        id v19 = objc_alloc(MEMORY[0x263F08C38]);
        uint64_t v23 = [v19 initWithUUIDBytes:v20 bytes:v25 length:v21];

        goto LABEL_8;
      }
    }
  }

  uint64_t v23 = 0;
LABEL_8:

  return v23;
}

void sub_234580C18(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x234580BF0);
  }
  _Unwind_Resume(a1);
}

void sub_234580C38(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  id v5 = a1;
  if ([v5 _engineeringType:v6:v7:v8:v9] == 208)
  {
    unint64_t v14 = [v5 objectValue:v10, v11, v12, v13];
    if ([v14 _callOutQueue_willDestroyWithTransitionContext:v15 completion:v16])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        sub_23459B978(v14, v36, v37, v38, v39);
      }
    }
    else if (([v14 countWithOptions:v19, v20, v21, v22] >= 2))
    {
      unint64_t v26 = 1;
      do
      {
        uint64_t v27 = [v14 objectAtIndexedSubscript:v23 - 1];
        long long v31 = [v14 objectAtIndexedSubscript:v28];
        v4[2](v4, v27, v31);

        v26 += 2;
      }
      while ([v14 count:v32, v33, v34, v35] > v26);
    }
  }
}

void sub_234580D44(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  id v5 = a1;
  if ([v5 _engineeringType:v6:v7:v8:v9] != 163) {
    goto LABEL_20;
  }
  unint64_t v33 = 0;
  if (![v5 getLengthOfUint64Representation:v10 uint64:&v33 length:v11 length:v12]) {
    goto LABEL_20;
  }
  long long v31 = 0;
  uint64_t v32 = 0;
  uint64_t v30 = 0;
  char v29 = 0;
  if (!v33) {
    goto LABEL_19;
  }
  unsigned __int16 v15 = 0;
  while (1)
  {
    if (![v5 getValue:v13 fieldIndex:v15]
      || ![v32 _isValidWithTransitionContext:v13 completion:v16]
      || ![v32 getValue:v13 fieldIndex:0]
      || ![v32 _getValue:v13 fieldIndex:1]
    {
      goto LABEL_18;
    }
    uint64_t v24 = [v31 uuidFromEngineeringValue:v13 engineeringValue:v18 engineeringValue:v19 engineeringValue:v14];
    if (v24)
    {
      unsigned int v25 = [v30 v20:v21 v22:v23];
      uint64_t v26 = v25 <= 1uLL ? 1 : v25;
      uint64_t v27 = v26 - 1;
      uint64_t v28 = v15 ? v27 : v25;
      char v29 = 0;
      v4[2](v4, v24, v28, &v29);
      if (v29) {
        break;
      }
    }

LABEL_18:
    if (v33 <= ++v15) {
      goto LABEL_19;
    }
  }

LABEL_19:
LABEL_20:
}

uint64_t sub_234580EA0(void *a1, uint64_t a2, void *a3, void *a4, void *a5, unint64_t a6, unint64_t a7)
{
  id v12 = a1;
  if ([v12 engineeringType:v13:v14:v15:v16] == 209)
  {
    long long v42 = 0;
    if (a4)
    {
      uint64_t v23 = 0;
      if (![v12 getValue:v17 fieldIndex:0])
      {
LABEL_21:

        goto LABEL_22;
      }
      [v42 uuidFromEngineeringValue:v19, v20, v21, v22];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a3)
    {
      if (![v12 getValue:v17 fieldIndex:2]) {
        goto LABEL_20;
      }
      [v42 v24:v25 v26:v27];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a5)
    {
      if (![v12 getValue:v17 fieldIndex:1]) {
        goto LABEL_20;
      }
      [v42 v28:v29 v30:v31];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (!(a6 | a7))
    {
LABEL_18:
      uint64_t v23 = 1;
      goto LABEL_21;
    }
    if ([v12 getValue:v17 fieldIndex:3])
    {
      uint64_t v36 = [v42 v32:v33 v34:v35];
      long long v40 = v36;
      if (a6) {
        *(unsigned char *)a6 = [v36 isEqualToString:@"shared" withLocale:v38];
      }
      if (a7) {
        *(unsigned char *)a7 = [v40 isEqualToString:@"ephemeral" withOptions:v38 range:v39];
      }

      goto LABEL_18;
    }
LABEL_20:
    uint64_t v23 = 0;
    goto LABEL_21;
  }
  uint64_t v23 = 0;
LABEL_22:

  return v23;
}

uint64_t sub_234581014(void *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  id v6 = a1;
  if ([v6 _engineeringType:v7:v8:v9:v10] == 23)
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v15 = 0;
    if ([v6 getValue:v11 fieldIndex:0])
    {
      if ([v6 getValue:v13 fieldIndex:1])
      {
        if (a3) {
          *a3 = [v22 v16:v17 v18:v18 v19:v19];
        }
        if (a4)
        {
          [v21 v16:v17 v18:v19];
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v15 = 1;
      }
      else
      {
        uint64_t v15 = 0;
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t sub_2345810E0(void *a1, uint64_t a2, uint64_t *a3, id *a4)
{
  id v6 = a1;
  if ([v6 _engineeringType:v7:v8:v9:v10] == 8)
  {
    obuint64_t j = 0;
    uint64_t v22 = 0;
    uint64_t v15 = 0;
    if ([v6 getValue:v11 fieldIndex:0])
    {
      if ([v6 getValue:v13 fieldIndex:1])
      {
        if (a3) {
          *a3 = [v22 v16:v17 v18:v18 v19:v19];
        }
        if (a4) {
          objc_storeStrong(a4, obj);
        }
        uint64_t v15 = 1;
      }
      else
      {
        uint64_t v15 = 0;
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t sub_2345812A4()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)qword_2687AA0F0;
  qword_2687AA0F0 = v0;

  [qword_2687AA0F0 setObject:v2 forKey:@"MACH (0x01)" atIndex:1];
  [qword_2687AA0F0 setObject:v4 forKey:@"NETWORK (0x02)" atIndex:2];
  [qword_2687AA0F0 setObject:v6 forKey:@"FSYSTEM (0x03)" atIndex:3];
  [qword_2687AA0F0 setObject:v8 forKey:@"BSD (0x04)"];
  [qword_2687AA0F0 setObject:v10 forKey:@"IOKIT (0x05)" atIndex:5];
  [qword_2687AA0F0 setObject:v12 forKey:@"DRIVERS (0x06)" atIndex:6];
  [qword_2687AA0F0 setObject:v14 forKey:@"TRACE (0x07)" atIndex:7];
  [qword_2687AA0F0 setObject:v16 forKey:@"MISC (0x14)" atIndex:20];
  [qword_2687AA0F0 setObject:v18 forKey:@"MIG (0xff)"];
  uint64_t result = [MEMORY[0x263F08AB0] _isAppleInternal:v20 v21:v21 v22:v22 v23:v23];
  if (result)
  {
    [qword_2687AA0F0 setObject:v25 forKey:@"DLIL (0x08)"];
    [qword_2687AA0F0 setObject:v27 forKey:@"PTHREAD (0x09)" atIndex:9];
    [qword_2687AA0F0 setObject:v29 forKeyedSubscript:@"CORESTORAGE (0x0a)" atIndex:10];
    [qword_2687AA0F0 setObject:v31 forKeyedSubscript:@"CG (0x0b)"];
    [qword_2687AA0F0 setObject:v33 forKey:@"MONOTONIC (0x0c)" atIndex:12];
    [qword_2687AA0F0 setObject:v35 forKeyedSubscript:@"SECURITY (0x1e)"];
    [qword_2687AA0F0 setObject:v37 forKey:@"DYLD (0x1f)" atIndex:31];
    [qword_2687AA0F0 setObject:v39 forKeyedSubscript:@"QT (0x20)"];
    [qword_2687AA0F0 setObject:v41 forKeyedSubscript:@"APPS (0x21)"];
    [qword_2687AA0F0 setObject:v43 forKeyedSubscript:@"LAUNCHD (0x22)"];
    [qword_2687AA0F0 setObject:v45 forKeyedSubscript:@"SILICON (0x23)"];
    [qword_2687AA0F0 setObject:v47 forKeyedSubscript:@"PERF (0x25)"];
    [qword_2687AA0F0 setObject:v49 forKeyedSubscript:@"IMPORTANCE (0x26)"];
    [qword_2687AA0F0 setObject:v51 forKeyedSubscript:@"BANK (0x28)"];
    [qword_2687AA0F0 setObject:v53 forKey:@"XPC (0x29)"];
    [qword_2687AA0F0 setObject:v55 forKey:@"ATM (0x2a)" atIndex:42];
    [qword_2687AA0F0 setObject:v57 forKey:@"ARIADNE (0x2b)" atIndex:43];
    [qword_2687AA0F0 setObject:v59 forKey:@"DAEMON (0x2c)"];
    [qword_2687AA0F0 setObject:v61 forKey:@"ENERGYTRACE (0x2d)"];
    [qword_2687AA0F0 setObject:v63 forKey:@"DISPATCH (0x2e)"];
    [qword_2687AA0F0 setObject:v65 forKey:@"IMG (0x31)" atIndex:49];
    [qword_2687AA0F0 setObject:v67 forKey:@"UMALLOC (0x33)" atIndex:51];
    [qword_2687AA0F0 setObject:v69 forKeyedSubscript:@"TURNSTILE (0x35)"];
    [qword_2687AA0F0 setObject:v71 forKeyedSubscript:@"AUDIO (0x36)"];
    [qword_2687AA0F0 setObject:v73 forKey:@"GRAPHICS (0x85)" atIndex:133];
    v77 = (void *)qword_2687AA0F0;
    return [v77 setObject:v75 forIntegerKey:@"MUSE (0x34)"];
  }
  return result;
}

void sub_2345815C0()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)qword_2687AA100;
  qword_2687AA100 = v0;

  if ([MEMORY[0x263F08AB0] isAppleInternal:v2 v3:v4 v5:v5])
  {
    id v443 = (id)objc_opt_new();
    [qword_2687AA100 setObject:v6 forIntegerKey:v443];
    [v443 setObject:v8 forKeyedSubscript:@"EXCP_KTRAP_x86 (0x02)"];
    [v443 setObject:v10 forKey:@"EXCP_SYNC_ARM (0x03)"];
    [v443 setObject:v12 forKeyedSubscript:@"EXCP_SERR_ARM (0x04)"];
    [v443 setObject:v14 forKeyedSubscript:@"EXCP_INTR (0x05)"];
    [v443 setObject:v16 forKeyedSubscript:@"EXCP_ALNG (0x06)"];
    [v443 setObject:v18 forKeyedSubscript:@"EXCP_UTRAP_x86 (0x07)"];
    [v443 setObject:v20 forKeyedSubscript:@"EXCP_FP (0x08)"];
    [v443 setObject:v22 forKeyedSubscript:@"EXCP_DECI (0x09)"];
    [v443 setObject:v24 forKeyedSubscript:@"SIGNPOST (0x0a)"];
    [v443 setObject:v26 forKeyedSubscript:@"EXCP_SC (0x0c)"];
    [v443 setObject:v28 forKeyedSubscript:@"EXCP_TRACE (0x0d)"];
    [v443 setObject:v30 forKeyedSubscript:@"EXCP_EMUL (0x0e)"];
    [v443 setObject:v32 forKeyedSubscript:@"IHDLR (0x10)"];
    [v443 setObject:v34 forKeyedSubscript:@"IPC (0x20)"];
    [v443 setObject:v36 forKeyedSubscript:@"RESOURCE (0x25)"];
    [v443 setObject:v38 forKeyedSubscript:@"VM (0x30)"];
    [v443 setObject:v40 forKey:@"LEAKS (0x31)"];
    [v443 setObject:v42 forKeyedSubscript:@"WORKINGSET (0x32)"];
    [v443 setObject:v44 forKeyedSubscript:@"SCHED (0x40)"];
    [v443 setObject:v46 forKeyedSubscript:@"MSGID_INVALID (0x50)"];
    [v443 setObject:v48 forKeyedSubscript:@"LOCKS (0x60)"];
    [v443 setObject:v50 forKey:@"PMAP (0x70)"];
    [v443 setObject:v52 forKey:@"CLOCK (0x80)"];
    [v443 setObject:v54 forKey:@"MP (0x90)"];
    [v443 setObject:v56 forKey:@"VM_PRESSURE (0xa0)"];
    [v443 setObject:v58 forKeyedSubscript:@"STACKSHOT (0xa1)"];
    [v443 setObject:v60 forKey:@"SFI (0xa2)"];
    [v443 setObject:v62 forKey:@"ENERGY_PERF (0xa3)"];
    [v443 setObject:v64 forKey:@"SYSDIAGNOSE (0xa4)"];
    [v443 setObject:v66 forKey:@"ZALLOC (0xa5)"];
    [v443 setObject:v68 forKeyedSubscript:@"THREAD_GROUP (0xa6)"];
    [v443 setObject:v70 forKeyedSubscript:@"COALITION (0xa7)"];
    [v443 setObject:v72 forKey:@"SHAREDREGION (0xa8)"];
    [v443 setObject:v74 forKeyedSubscript:@"SCHED_CLUTCH (0xa9)"];
    [v443 setObject:v76 forKeyedSubscript:@"IO(0xaa)"];
    [v443 setObject:v78 forKeyedSubscript:@"WORKGROUP (0xab)"];
    [v443 setObject:v80 forKeyedSubscript:@"HV (0xac)"];
    [v443 setObject:v82 forKeyedSubscript:@"KCOV (0xad)"];
    [v443 setObject:v84 forKey:@"MACHDEP_EXCP_SC_x86 (0xae)"];
    [v443 setObject:v86 forKey:@"MACHDEP_EXCP_SC_ARM (0xaf)"];
    v442 = objc_opt_new();
    [qword_2687AA100 setObject:v88 forIntegerKey:v442];
    [v442 setObject:v90 forKeyedSubscript:@"NETIP (0x01)"];
    [v442 setObject:v92 forKeyedSubscript:@"NETARP (0x02)"];
    [v442 setObject:v94 forKeyedSubscript:@"NETUDP (0x03)"];
    [v442 setObject:v96 forKeyedSubscript:@"NETTCP (0x04)"];
    [v442 setObject:v98 forKeyedSubscript:@"NETICMP (0x05)"];
    [v442 setObject:v100 forKeyedSubscript:@"NETIGMP (0x06)"];
    [v442 setObject:v102 forKeyedSubscript:@"NETRIP (0x07)"];
    [v442 setObject:v104 forKeyedSubscript:@"NETOSPF (0x08)"];
    [v442 setObject:v106 forKeyedSubscript:@"NETISIS (0x09)"];
    [v442 setObject:v108 forKeyedSubscript:@"NETSNMP (0x0a)"];
    [v442 setObject:v110 forKeyedSubscript:@"NETSOCK (0x0b)"];
    [v442 setObject:v112 forKeyedSubscript:@"NETAARP (0x64)"];
    [v442 setObject:v114 forKeyedSubscript:@"NETDDP (0x65)"];
    [v442 setObject:v116 forKeyedSubscript:@"NETNBP (0x66)"];
    [v442 setObject:v118 forKeyedSubscript:@"NETZIP (0x67)"];
    [v442 setObject:v120 forKeyedSubscript:@"NETADSP (0x68)"];
    [v442 setObject:v122 forKeyedSubscript:@"NETATP (0x69)"];
    [v442 setObject:v124 forKeyedSubscript:@"NETASP (0x6a)"];
    [v442 setObject:v126 forKeyedSubscript:@"NETAFP (0x6b)"];
    [v442 setObject:v128 forKeyedSubscript:@"NETRTMP (0x6c)"];
    [v442 setObject:v130 forKeyedSubscript:@"NETAURP (0x6d)"];
    [v442 setObject:v132 forKeyedSubscript:@"NETIPSEC (0x80)"];
    [v442 setObject:v134 forKeyedSubscript:@"NETVMNET (0x81)"];
    v136 = objc_opt_new();
    [qword_2687AA100 setObject:v137 forIntegerKey:v136];
    [v136 setObject:v139 forKeyedSubscript:@"IOINTC (0x00)"];
    [v136 setObject:v141 forKeyedSubscript:@"IOWORKLOOP (0x01)"];
    [v136 setObject:v143 forKeyedSubscript:@"IOINTES (0x02)"];
    [v136 setObject:v145 forKeyedSubscript:@"IOCLKES (0x03)"];
    [v136 setObject:v147 forKeyedSubscript:@"IOCMDQ (0x04)"];
    [v136 setObject:v149 forKeyedSubscript:@"IOMCURS (0x05)"];
    [v136 setObject:v151 forKeyedSubscript:@"IOMDESC (0x06)"];
    [v136 setObject:v153 forKey:@"IOPOWER (0x07)"];
    [v136 setObject:v155 forKey:@"IOSERVICE (0x08)"];
    [v136 setObject:v157 forKey:@"IOREGISTRY (0x09)" atIndex:9];
    [v136 setObject:v159 forKeyedSubscript:@"IOSTORAGE (0x20)"];
    [v136 setObject:v161 forKeyedSubscript:@"IONETWORK (0x21)"];
    [v136 setObject:v163 forKeyedSubscript:@"IOKEYBOARD (0x22)"];
    [v136 setObject:v165 forKeyedSubscript:@"IOHID (0x23)"];
    [v136 setObject:v167 forKeyedSubscript:@"IOAUDIO (0x24)"];
    [v136 setObject:v169 forKeyedSubscript:@"IOSERIAL (0x25)"];
    [v136 setObject:v171 forKeyedSubscript:@"IOTTY (0x26)"];
    [v136 setObject:v173 forKeyedSubscript:@"IOSAM (0x27)"];
    [v136 setObject:v175 forKey:@"IOPARALLELATA (0x28)" atIndex:40];
    [v136 setObject:v177 forKeyedSubscript:@"IOPARALLELSCSI (0x29)"];
    [v136 setObject:v179 forKeyedSubscript:@"IOSATA (0x2a)"];
    [v136 setObject:v181 forKeyedSubscript:@"IOSAS (0x2b)"];
    [v136 setObject:v183 forKeyedSubscript:@"IOFIBRECHANNEL (0x2c)"];
    [v136 setObject:v185 forKey:@"IOUSB (0x2d)" atIndex:45];
    [v136 setObject:v187 forKeyedSubscript:@"IOBLUETOOTH (0x2e)"];
    [v136 setObject:v189 forKeyedSubscript:@"IOFIREWIRE (0x2f)"];
    [v136 setObject:v191 forKey:@"IOINFINIBAND (0x30)"];
    [v136 setObject:v193 forKey:@"IOCPUPM (0x31)"];
    [v136 setObject:v195 forKeyedSubscript:@"IOGRAPHICS (0x32)"];
    [v136 setObject:v197 forKeyedSubscript:@"HIBERNATE (0x33)"];
    [v136 setObject:v199 forKeyedSubscript:@"IOTHUNDERBOLT (0x34)"];
    [v136 setObject:v201 forKeyedSubscript:@"BOOTER (0x35)"];
    [v136 setObject:v203 forKeyedSubscript:@"IOAUDIO2 (0x36)"];
    [v136 setObject:v205 forKeyedSubscript:@"IOAFK (0x37)"];
    [v136 setObject:v207 forKey:@"IOSURFACEPA (0x40)"];
    [v136 setObject:v209 forKeyedSubscript:@"IOMDPA (0x41)"];
    [v136 setObject:v211 forKeyedSubscript:@"IODARTPA (0x42)"];
    v213 = objc_opt_new();
    [qword_2687AA100 setObject:v214 forIntegerKey:v213];
    [v213 setObject:v216 forKeyedSubscript:@"DRVSTORAGE (0x01)"];
    [v213 setObject:v218 forKeyedSubscript:@"DRVNETWORK (0x02)"];
    [v213 setObject:v220 forKeyedSubscript:@"DRVKEYBOARD (0x03)"];
    [v213 setObject:v222 forKeyedSubscript:@"DRVHID (0x04)"];
    [v213 setObject:v224 forKeyedSubscript:@"DRVAUDIO (0x05)"];
    [v213 setObject:v226 forKeyedSubscript:@"DRVSERIAL (0x07)"];
    [v213 setObject:v228 forKey:@"DRVSAM (0x08)"];
    [v213 setObject:v230 forKey:@"DRVPARALLELATA (0x09)" atIndex:9];
    [v213 setObject:v232 forKeyedSubscript:@"DRVPARALLELSCSI (0x0a)"];
    [v213 setObject:v234 forKeyedSubscript:@"DRVSATA (0x0b)"];
    [v213 setObject:v236 forKeyedSubscript:@"DRVSAS (0x0c)"];
    [v213 setObject:v238 forKeyedSubscript:@"DRVFIBRECHANNEL (0x0d)"];
    [v213 setObject:v240 forKeyedSubscript:@"DRVUSB (0x0e)"];
    [v213 setObject:v242 forKeyedSubscript:@"DRVBLUETOOTH (0x0f)"];
    [v213 setObject:v244 forKeyedSubscript:@"DRVFIREWIRE (0x10)"];
    [v213 setObject:v246 forKeyedSubscript:@"DRVINFINIBAND (0x11)"];
    [v213 setObject:v248 forKeyedSubscript:@"DRVGRAPHICS (0x12)"];
    [v213 setObject:v250 forKeyedSubscript:@"DRVSD (0x13)"];
    [v213 setObject:v252 forKeyedSubscript:@"DRVNAND (0x14)"];
    [v213 setObject:v254 forKeyedSubscript:@"SSD (0x15)"];
    [v213 setObject:v256 forKeyedSubscript:@"DRVSPI (0x16)"];
    [v213 setObject:v258 forKeyedSubscript:@"DRVWLAN_802_11 (0x17)"];
    [v213 setObject:v260 forKey:@"DRVSSM (0x18)" atIndex:24];
    [v213 setObject:v262 forKeyedSubscript:@"DRVSMC (0x19)"];
    [v213 setObject:v264 forKeyedSubscript:@"DRVMACEFIMANAGER (0x1a)"];
    [v213 setObject:v266 forKeyedSubscript:@"DRVANE (0x1b)"];
    [v213 setObject:v268 forKeyedSubscript:@"DRVETHERNET (0x1c)"];
    [v213 setObject:v270 forKeyedSubscript:@"DRVMCC (0x1d)"];
    [v213 setObject:v272 forKeyedSubscript:@"DRVACCESSORY (0x1e)"];
    [v213 setObject:v274 forKeyedSubscript:@"SOCDIAGS (0x1f)"];
    [v213 setObject:v276 forKeyedSubscript:@"DRVVIRTIO (0x20)"];
    v441 = objc_opt_new();
    [qword_2687AA100 setObject:v278 forIntegerKey:v441];
    [v441 setObject:v280 forKey:@"DLIL_STATIC (0x01)"];
    [v441 setObject:v282 forKeyedSubscript:@"DLIL_PR_MOD (0x02)"];
    [v441 setObject:v284 forKeyedSubscript:@"DLIL_IF_MOD (0x03)"];
    [v441 setObject:v286 forKey:@"DLIL_PR_FLT (0x04)"];
    [v441 setObject:v288 forKey:@"DLIL_IF_FLT (0x05)"];
    v290 = objc_opt_new();
    [qword_2687AA100 setObject:v291 forIntegerKey:v290];
    [v290 setObject:v293 forKey:@"FSRW (0x1)"];
    [v290 setObject:v295 forKey:@"DKRW (0x2)"];
    [v290 setObject:v297 forKeyedSubscript:@"FSVN (0x3)"];
    [v290 setObject:v299 forKey:@"FSLOOOKUP (0x4)"];
    [v290 setObject:v301 forKeyedSubscript:@"JOURNAL (0x5)"];
    [v290 setObject:v303 forKeyedSubscript:@"IOCTL (0x6)"];
    [v290 setObject:v305 forKey:@"BOOTCACHE (0x7)"];
    [v290 setObject:v307 forKey:@"HFS (0x8)"];
    [v290 setObject:v309 forKey:@"APFS (0x9)"];
    [v290 setObject:v311 forKeyedSubscript:@"SMB (0xa)"];
    [v290 setObject:v313 forKeyedSubscript:@"MOUNT (0xb)"];
    [v290 setObject:v315 forKeyedSubscript:@"EXFAT (0xe)"];
    [v290 setObject:v317 forKey:@"MSDOS (0xf)"];
    [v290 setObject:v319 forKeyedSubscript:@"ACFS (0x10)"];
    [v290 setObject:v321 forKeyedSubscript:@"THROTTLE (0x11)"];
    [v290 setObject:v323 forKeyedSubscript:@"DECMP (0x12)"];
    [v290 setObject:v325 forKeyedSubscript:@"VFS (0x13)"];
    [v290 setObject:v327 forKeyedSubscript:@"LIVEFS (0x14)"];
    [v290 setObject:v329 forKeyedSubscript:@"CONTENT_PROT (0xcf)"];
    v440 = objc_opt_new();
    [qword_2687AA100 setObject:v331 forIntegerKey:v440];
    [v440 setObject:v333 forKeyedSubscript:@"UUID (0x05)"];
    [v440 setObject:v335 forKeyedSubscript:@"INTERNAL (0x07)"];
    [v440 setObject:v337 forKeyedSubscript:@"API (0x08)"];
    [v440 setObject:v339 forKey:@"DEBUGGING (0x09)"];
    v341 = objc_opt_new();
    [qword_2687AA100 setObject:v342 forIntegerKey:v341];
    [v341 setObject:v344 forKeyedSubscript:@"LOGINWINDOW (0x03)"];
    [v341 setObject:v346 forKeyedSubscript:@"AUDIO (0x04)"];
    [v341 setObject:v348 forKeyedSubscript:@"SYSTEMUI (0x05)"];
    [v341 setObject:v350 forKeyedSubscript:@"SIGNPOST (0x0a)"];
    [v341 setObject:v352 forKeyedSubscript:@"APPKIT (0x0c)"];
    [v341 setObject:v354 forKeyedSubscript:@"UIKIT (0x0d)"];
    [v341 setObject:v356 forKey:@"DFR (0x0e)"];
    [v341 setObject:v358 forKeyedSubscript:@"LAYOUT (0x0f)"];
    [v341 setObject:v360 forKeyedSubscript:@"COREDATA (0x10)"];
    [v341 setObject:v362 forKey:@"SAMBA (0x80)"];
    [v341 setObject:v364 forKeyedSubscript:@"EOSSUPPORT (0x81)"];
    [v341 setObject:v366 forKeyedSubscript:@"MACEFIMANAGER (0x82)"];
    v439 = objc_opt_new();
    [qword_2687AA100 setObject:v368 forIntegerKey:v439];
    [v439 setObject:v370 forKeyedSubscript:@"DATA (0x0)"];
    [v439 setObject:v372 forKeyedSubscript:@"STRING (0x1)"];
    [v439 setObject:v374 forKeyedSubscript:@"INFO (0x2)"];
    v376 = objc_opt_new();
    [qword_2687AA100 setObject:v377 forIntegerKey:v376];
    [v376 setObject:v379 forKeyedSubscript:@"PROC (0x01)"];
    [v376 setObject:v381 forKey:@"MEMSTAT (0x02)"];
    [v376 setObject:v383 forKeyedSubscript:@"KEVENT (0x03)"];
    [v376 setObject:v385 forKeyedSubscript:@"EXCP_SC (0x0c)"];
    [v376 setObject:v387 forKeyedSubscript:@"AIO (0x0d)"];
    [v376 setObject:v389 forKeyedSubscript:@"SC_EXTENDED_INFO (0x0e)"];
    [v376 setObject:v391 forKeyedSubscript:@"SC_EXTENDED_INFO2 (0x0f)"];
    [v376 setObject:v393 forKey:@"KDEBUG_TEST (0xff)"];
    v395 = objc_opt_new();
    [qword_2687AA100 setObject:v396 forIntegerKey:v395];
    [v395 setObject:v398 forKeyedSubscript:@"CS_IO" atIndex:0];
    v400 = objc_opt_new();
    [qword_2687AA100 setObject:v401 forIntegerKey:v400];
    [v400 setObject:v403 forKeyedSubscript:@"SEC_KERNEL" atIndex:0];
    [v400 setObject:v405 forKeyedSubscript:@"SEC_SANDBOX" atIndex:1];
    v407 = objc_opt_new();
    [qword_2687AA100 setObject:v408 forIntegerKey:v407];
    [v407 setObject:v410 forKeyedSubscript:@"MT_INSTRS_CYCLES" atIndex:1];
    [v407 setObject:v412 forKeyedSubscript:@"MT_DEBUG" atIndex:2];
    [v407 setObject:v414 forKeyedSubscript:@"MT_RESOURCES_PROC_EXIT" atIndex:3];
    [v407 setObject:v416 forKeyedSubscript:@"MT_RESOURCES_THR_EXIT" atIndex:4];
    [v407 setObject:v418 forKeyedSubscript:@"MT_TMPTH" atIndex:254];
    [v407 setObject:v420 forKeyedSubscript:@"MT_TMPCPU" atIndex:255];
    v422 = objc_opt_new();
    [qword_2687AA100 setObject:v423 forIntegerKey:v422];
    [v422 setObject:v425 forKeyedSubscript:@"MISC_COREBRIGHTNESS" atIndex:1];
    [v422 setObject:v427 forKeyedSubscript:@"MISC_VIDEOENG" atIndex:2];
    [v422 setObject:v429 forKeyedSubscript:@"EVENT" atIndex:16];
    [v422 setObject:v431 forKeyedSubscript:@"MISC_INSTRUMENTS" atIndex:17];
    [v422 setObject:v433 forKeyedSubscript:@"MISC_INSTRUMENTSBT" atIndex:18];
    [v422 setObject:v435 forKeyedSubscript:@"MISC_LAYOUT" atIndex:26];
    [v422 setObject:v437 forKeyedSubscript:@"BUFFER" atIndex:32];
  }
}

void sub_234582814()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = @"xs:appinfo";
  v4[0] = objc_opt_class();
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v0 forKeys:(uint64_t)v4 count:1];
  id v2 = (void *)qword_2687AA110;
  qword_2687AA110 = v1;
}

uint64_t sub_234583188(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(void **)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40) withObject:a4 withObject:a5];
}

uint64_t sub_234583240(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = [*(void **)(*(void *)(a1 + 32) + 16) a2:a3:a4:a5];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

uint64_t sub_234583370(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_234583380(uint64_t a1)
{
}

uint64_t sub_234583388(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(void **)(*(void *)(a1 + 32) + 16) a2:a3:a4:a5];

  return MEMORY[0x270F9A758]();
}

__CFString *sub_234583438(void *a1, void *a2, uint64_t a3)
{
  uint64_t v590 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  if ([v6 isValid:v7 with:v8 and:v9 and:v10])
  {
    uint64_t result = (__CFString *)[v6 engineeringType:v11, v12, v13, v14];
    uint64_t v20 = @"<private>";
    switch((int)result)
    {
      case 0:
        goto LABEL_190;
      case 1:
        unint64_t v235 = [v6 v16:v17 v18:v19];
        [NSString stringWithFormat:@"{%d,%d}", v237, v238, HIDWORD(v235), v235];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 2:
      case 43:
      case 51:
      case 123:
      case 152:
      case 187:
        uint64_t v44 = (void *)*((void *)v5 + 1);
        uint64_t v45 = [v6 objectValue:v16, v17, v18, v19];
        [v44 stringFromNumber:v46];
        uint64_t v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 3:
      case 97:
        v82 = NSString;
        [v6 setDecimal:v16.decimalValue];
        [v82 stringWithFormat:v83, v84, v85, v86];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 4:
      case 44:
        if ([v6 performSelector:v16 withObject:v17 withObject:v18 withObject:v19] != NO) {
          goto LABEL_34;
        }
        goto LABEL_183;
      case 5:
      case 6:
      case 235:
        v494 = NSString;
        [v6 setDecimal:v16.decimalValue];
        [v494 stringWithFormat:v495, v496, v497, v498];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 7:
      case 17:
      case 28:
      case 29:
      case 30:
      case 35:
      case 36:
      case 55:
      case 59:
      case 64:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 84:
      case 90:
      case 91:
      case 134:
      case 226:
      case 232:
      case 242:
        goto LABEL_11;
      case 8:
        v573 = 0;
        [v5 getTitleAndSubtitleForThreadEngineeringValue:v16 title:v6 subtitle:&v573];
        uint64_t v20 = v573;

        break;
      case 9:
        v573 = 0;
        out[0] = 0;
        v586 = 0;
        if ([v6 getValue:out fieldIndex:0]
          && [v6 getValue:v239 fieldIndex:1]
          && [v573 valueForFieldIndex:v241]
        {
          uint64_t v247 = NSString;
          v248 = [out[0] performSelector:v243 withObject:v244 withObject:v245 withObject:v246];
          uint64_t v253 = [v586 v249:v250 v251:v252];
          [v247 stringWithFormat:@"%@  0x%llx", v255, v256, v248, v253];
          uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v20 = 0;
        }

        break;
      case 10:
        uint64_t v45 = [v6 v16:v17 v18:v19];
        if ([v45 hasPrefix:v257 withString:v258 withString:v259] == NO
          && ![v45 hasPrefix:@"BSC_" options:v261 range:v262]
        {
          goto LABEL_147;
        }
        [v45 substringFromIndex:4];
        uint64_t v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 11:
      case 12:
      case 20:
      case 32:
      case 37:
      case 45:
      case 49:
      case 50:
      case 53:
      case 54:
      case 57:
      case 58:
      case 60:
      case 67:
      case 80:
      case 81:
      case 82:
      case 83:
      case 85:
      case 86:
      case 87:
      case 98:
      case 100:
      case 101:
      case 105:
      case 106:
      case 108:
      case 109:
      case 110:
      case 112:
      case 113:
      case 115:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 128:
      case 129:
      case 132:
      case 137:
      case 138:
      case 141:
      case 144:
      case 145:
      case 148:
      case 149:
      case 153:
      case 154:
      case 156:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 182:
      case 183:
      case 184:
      case 188:
      case 191:
      case 196:
      case 199:
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
      case 211:
      case 212:
      case 213:
      case 214:
      case 217:
      case 218:
      case 219:
      case 220:
      case 224:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 239:
      case 240:
      case 241:
      case 244:
      case 246:
      case 249:
      case 250:
      case 251:
        [v6 setFoo:v17 bar:v18 baz:v19];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 13:
      case 15:
      case 68:
      case 70:
      case 89:
      case 160:
        goto LABEL_13;
      case 14:
        unsigned __int8 v263 = [v6 v16:v17:v18:v19];
        uint64_t v45 = [XRKDebugClassSubclassStringMapping _debugClassNameForClass:v264 withSubclass:v263 withSubclassName:v265 withSubclassDescription:v266];
        if (v45) {
          goto LABEL_147;
        }
        uint64_t v271 = NSString;
        uint64_t v272 = [v6 v267:v268:v269:v270];
        [v271 stringWithFormat:v273, v274, v275, v272];
        uint64_t v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 16:
        unsigned int v276 = [v6 v16:v17 v18:v18 v19:v19];
        if (v276 >= 3) {
          goto LABEL_187;
        }
        uint64_t v277 = off_264BF1ED8;
        goto LABEL_168;
      case 18:
      case 19:
      case 56:
      case 122:
      case 127:
        uint64_t v65 = [v6 v16:v17 v18:v19];
        uint64_t isHighestResolutionTimeEnabled = [v5 _isHighestResolutionTimeEnabled:v66:v67:v68:v69];
        [DTNanoTimestampFormatter stringForNanoseconds:v71 highestResolutionTimeEnabled:isHighestResolutionTimeEnabled];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 21:
        [v6 objectValue:v16, v17, v18, v19];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 22:
        v278 = (void *)*((void *)v5 + 2);
        uint64_t v279 = NSNumber;
        uint64_t v280 = [v6 v16:v17 v18:v19];
        uint64_t v45 = [v279 numberWithUnsignedInt:v280];
        [v278 stringFromNumber:v284 withNumber:(uint64_t)v45 withNumber:v285 withNumber:v286];
        uint64_t v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 23:
        v573 = 0;
        [v5 getTitleAndSubtitleForProcessEngineeringValue:v16 title:v6 subtitle:&v573];
        uint64_t v20 = v573;

        break;
      case 24:
        [v5 stringForCoreProfileBacktraceEngineeringValue:v16 withValue:(uint64_t)v6 withDescription:v18 withDescription2:v19];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 25:
        v573 = 0;
        if (![v6 getLengthOfUint64Representation:v16 value:v573 maxLength:v18 maxLengthIncludingNull:v19]) {
          goto LABEL_190;
        }
        [MEMORY[0x263F089D8] setFoo:v121 bar:v122 baz:v123 qux:v124];
        uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        out[0] = 0;
        if (v573)
        {
          for (unint64_t i = 0; i < (unint64_t)v573; ++i)
          {
            if (i) {
              [v20 appendString:v125, @", ", v126, v127];
            }
            if ([v6 getValue:out fieldIndex:i]
              && [out[0] isValid:v129 with:v130 with:v131 with:v132])
            {
              v134 = (void *)*((void *)v5 + 1);
              uint64_t v135 = NSNumber;
              uint64_t v136 = [out[0] v129:v133 v131:v132];
              uint64_t v140 = [v135 numberWithUnsignedLongLong:v136];
              uint64_t v144 = [v134 stringFromNumber:(uint64_t)v140];
              [v20 appendFormat:@"(%@)", v146, v147, v144];
            }
            else
            {
              [v20 appendString:@"<error>"];
            }
          }
        }

        break;
      case 26:
        uint64_t v287 = NSString;
        uint64_t v288 = [v6 v16:v17 v18:v19];
        [v287 stringWithFormat:v289, v290, v291, v288];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 27:
        [v5 stringForBacktraceEngineeringValue:v16 value:v6 type:v18 name:v19];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 31:
        v573 = 0;
        [v5 getTitleAndSubtitleForCoreEngineeringValue:v16 title:&v573 subtitle:0];
        uint64_t v20 = v573;

        break;
      case 33:
      case 34:
        if (![v6 _setValue:v16 forKey:v17 withTransition:v18 withTransitionContext:v19] || [v6 _setValue:v99 forKey:v100 withTransition:v101 withTransitionContext:v102] == -1) {
          goto LABEL_183;
        }
LABEL_34:
        uint64_t v91 = [v6 v87:v88 v89:v90];
        uint64_t v96 = [v5 _isHighestResolutionTimeEnabled:v92:v93:v94:v95];
        [DTUserTimeFormatter stringForNanoseconds:v97 highestResolutionTimeEnabled:v91];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 38:
      case 104:
      case 114:
      case 133:
      case 185:
      case 205:
        uint64_t v39 = NSString;
        uint64_t v40 = [v6 v16:v17 v18:v18 v19:v19];
        [v39 stringWithFormat:v41, v42, v43, v40];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 39:
      case 40:
      case 41:
      case 42:
      case 236:
        uint64_t v73 = [v6 v16:v17 v18:v19];
        [DTBytesFormatter stringForLongLong:v73];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 46:
      case 142:
      case 157:
      case 158:
      case 181:
      case 216:
        uint64_t v20 = (__CFString *)objc_opt_new();
        *((unsigned char *)v5 + 66) = 1;
        long long v581 = 0u;
        long long v582 = 0u;
        long long v579 = 0u;
        long long v580 = 0u;
        uint64_t v54 = [v6 objectValue:v50, v51, v52, v53];
        uint64_t v56 = [v54 countByEnumeratingWithState:v55 objects:v579 count:v589];
        if (v56)
        {
          uint64_t v57 = *(void *)v580;
          do
          {
            for (uint64_t j = 0; j != v56; ++j)
            {
              if (*(void *)v580 != v57) {
                objc_enumerationMutation(v54);
              }
              uint64_t v59 = sub_234583438(v5, *(void *)(*((void *)&v579 + 1) + 8 * j), 1);
              uint64_t v63 = (void *)v59;
              if (v59) {
                [v20 appendString:v60];
              }
              else {
                [v20 appendString:@"n/a"];
              }
            }
            uint64_t v56 = [v54 countByEnumeratingWithState:v64 objects:v579 count:v589];
          }
          while (v56);
        }

        *((unsigned char *)v5 + 66) = a3;
        break;
      case 47:
        uint64_t v292 = NSString;
        uint64_t v293 = [v6 v16:v17 v18:v18 v19:v19];
        [v292 stringWithFormat:v294, v295, v296, v293];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 48:
        unsigned int v232 = [v6 v16:v17:v18:v19] + 1;
        if (v232 < 5)
        {
          uint64_t v233 = off_264BF1F10;
          goto LABEL_105;
        }
        uint64_t v20 = 0;
        break;
      case 52:
        uint64_t v148 = (void *)*((void *)v5 + 4);
        v149 = NSNumber;
        [v6 setDecimal:v16.decimalValue];
        uint64_t v45 = [v149 numberWithDouble:v150, v151, v152, v153];
        [v148 stringFromNumber:(uint64_t)v45];
        uint64_t v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 61:
      case 66:
      case 69:
      case 99:
      case 111:
      case 125:
      case 139:
      case 146:
      case 164:
      case 189:
      case 190:
        uint64_t v29 = NSString;
        uint64_t v30 = [v6 v16:v17 v18:v18 v19:v19];
        [v29 stringWithFormat:@"%u", v32, v33, v30];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 62:
      case 63:
      case 92:
      case 102:
        uint64_t v77 = NSString;
        uint64_t v78 = [v6 v16:v17 v18:v19];
        [v77 stringWithFormat:v79, v80, v81, v78];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 65:
        v573 = 0;
        v574 = (const unsigned __int8 *)&v573;
        uint64_t v575 = 0x3032000000;
        v576 = sub_234586874;
        v577 = sub_234586884;
        id v157 = objc_alloc(MEMORY[0x263F089D8]);
        id v578 = [v157 initWithString:v158, v159, v160];
        v572[0] = MEMORY[0x263EF8330];
        v572[1] = 3221225472;
        v572[2] = sub_23458688C;
        v572[3] = &unk_264BF1E38;
        v572[4] = &v573;
        [v6 enumerateUint64Values:v161 usingBlock:^(uint64_t v161, BOOL *v162, BOOL *v163) {
        if ([*((void **)v574 + 5) respondsToSelector:v164 withArguments:v165, v166, v167] == YES)
        {
          uint64_t v20 = @"()";
        }
        else
        {
          v534 = (char *)*((void *)v574 + 5);
          uint64_t v535 = [v534 lengthWithOptions:v168 usingBlock:v169 usingBlock:v170 usingBlock:v171];
          [v534 replaceCharactersInRange:NSMakeRange(v536, v535 - 1) withString:@""];
          uint64_t v20 = (__CFString *)*((id *)v574 + 5);
        }
        _Block_object_dispose(&v573, 8);

        break;
      case 88:
        uint64_t v172 = NSString;
        uint64_t v173 = [v6 v16:v17 v18:v19];
        [v172 stringWithFormat:v174, v175, v176, v173];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 93:
        v297 = (void *)*((void *)v5 + 3);
        uint64_t v298 = NSNumber;
        [v6 setDecimal:v16.decimalValue];
        uint64_t v45 = [v298 numberWithDouble:v299, v300, v301, v302];
        [v297 stringFromNumber:v303 withNumber:(uint64_t)v45 withNumber:v304 withNumber:v305];
        uint64_t v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 94:
        uint64_t v177 = [v6 v16:v17 v18:v19];
        [DTBitRateFormatter stringForLongLong:v178];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 95:
      case 96:
        v573 = 0;
        if ([v6 getLengthOfUint64Representation:v16 withValue:(uint64_t)&v573 andMaxLength:v18 andError:v19])
        {
          if (v573)
          {
            id v103 = objc_alloc(MEMORY[0x263F089D8]);
            uint64_t v107 = [v103 initWithString:v104 string:v105];
            v570[0] = MEMORY[0x263EF8330];
            v570[1] = 3221225472;
            v570[2] = sub_2345868C4;
            v570[3] = &unk_264BF1E60;
            uint64_t v20 = v107;
            v571 = v20;
            [v6 enumerateUint64Values:v108 usingBlock:^(uint64_t v109, uint64_t v110) {
            uint64_t v115 = [v20 lengthWithOptions:v111 usingBlock:v112 forRange:v113];
            [v20 replaceCharactersInRange:NSMakeRange(v116, v115 - 1) withString:@""];
          }
          else
          {
            uint64_t v20 = @"()";
          }
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            sub_23459B9FC();
          }
LABEL_190:
          uint64_t v20 = @"<error>";
        }
        break;
      case 103:
        v573 = 0;
        out[0] = 0;
        if ([v6 getValue:v16 fieldIndex:0]
          && [v6 getValue:out fieldIndex:1])
        {
          uint64_t v312 = NSString;
          uint64_t v313 = [v573 v308:v309 v310:v311];
          uint64_t v318 = [v5 _isHighestResolutionTimeEnabled:v314:v315:v316:v317];
          v321 = [DTNanoTimestampFormatter stringForNanoseconds:v319 highestResolutionTimeEnabled:v313];
          uint64_t v326 = [out[0] v322:v323:v324:v325];
          uint64_t v330 = [DTUserTimeFormatter stringForNanoseconds:v327 withTimeZone:v326 andTimeZoneName:v328 andTimeZoneAbbreviation:v329];
          [v312 stringWithFormat:@"%@ (%@)", v332, v333, v321, v330];
          uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v20 = @"-";
        }
        goto LABEL_194;
      case 107:
        v573 = 0;
        if (XREngineeringTypeUnwrapAny(v6, (uint64_t)&v573))
        {
          sub_234583438(v5, v573, a3);
          uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v20 = @"<any>";
        }
        goto LABEL_198;
      case 116:
        uint64_t v334 = [v6 v16:v17 v18:v19];
        if (v334 == 0xEEEEB0B5B2B2EEEELL)
        {
          uint64_t v20 = @"OS_SIGNPOST_ID_EXCLUSIVE";
        }
        else if (v334 == -1)
        {
          uint64_t v20 = @"OS_SIGNPOST_ID_INVALID";
        }
        else
        {
          if (v334)
          {
LABEL_11:
            uint64_t v24 = NSString;
            uint64_t v25 = [v6 v16:v17 v18:v19];
            [v24 stringWithFormat:v26, v27, v28, v25];
            uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_7;
          }
          uint64_t v20 = @"OS_SIGNPOST_ID_NULL";
        }
        break;
      case 124:
        [v5 stringForUserIDEngineeringValue:(uint64_t)v6];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 126:
        if ([v6 v16:v17:v18:v19]) {
          uint64_t v20 = @"Yes";
        }
        else {
          uint64_t v20 = @"No";
        }
        break;
      case 130:
        [v5 stringForTextSymbolEngineeringValue:v16 shouldIncludeLibrary:v6];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 131:
      case 197:
        uint64_t v117 = [v6 v16:v17 v18:v19];
        [NSString stringWithFormat:@"%llu", v119, v120, v117];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 135:
        v573 = 0;
        v574 = (const unsigned __int8 *)&v573;
        uint64_t v575 = 0x3010000000;
        v577 = 0;
        id v578 = 0;
        v576 = (uint64_t (*)(uint64_t, uint64_t))"";
        v569[0] = MEMORY[0x263EF8330];
        v569[1] = 3221225472;
        v569[2] = sub_2345868F4;
        v569[3] = &unk_264BF1E38;
        v569[4] = &v573;
        [v6 enumerateUint64Values:v16 usingBlock:^(uint64_t v569, void *v18, void *v19) {
        memset(out, 0, 37);
        uuid_unparse(v574 + 32, (char *)out);
        id v335 = [NSString alloc];
        uint64_t v20 = (__CFString *)[v335 initWithBytes:v336 length:36 encoding:1];
        _Block_object_dispose(&v573, 8);
        break;
      case 136:
        [v5 stringForInstrumentTypeEngineeringValue:(uint64_t)v6];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 140:
        unint64_t v337 = [v6 v16:v17 v18:v19];
        [NSString stringWithFormat:@"%u/%u", v339, v340, HIDWORD(v337), v337];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 143:
        [v5 stringForSocketAddrEngineeringValue:v16 engineeringValue:(uint64_t)v6 engineeringValue2:v18 engineeringValue3:v19];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 147:
        v573 = 0;
        out[0] = 0;
        if (![v6 getValue:v16 fieldIndex:0]
          || ![v6 getValue:out fieldIndex:2]);
        {
          goto LABEL_230;
        }
        if ([v573 isValid:v183 with:v184 with:v185 with:v186]
          && [out[0] isValid:v187 with:v188 with:v189 with:v190])
        {
          v191 = NSString;
          uint64_t v192 = [v573 v187:v188 v189:v190];
          uint64_t v197 = [out[0] v193:v194:v195:v196];
          [v191 stringWithFormat:@"%@ <0x%llx>", v199, v200, v192, v197];
          uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_194;
        }
        if ([out[0] isValid:v187 with:v188 and:v189 and:v190])
        {
          v552 = NSString;
          uint64_t v553 = [out[0] v548:v549:v550:v551];
          uint64_t v557 = [v552 stringWithFormat:@"0x%llx", v555, v556, v553];
LABEL_229:
          uint64_t v20 = (__CFString *)v557;
          goto LABEL_194;
        }
        if ([v573 isValid:v548 with:v549 and:v550 and:v551])
        {
          uint64_t v557 = [v573 v558:v559:v560:v561];
          goto LABEL_229;
        }
LABEL_230:
        uint64_t v20 = 0;
LABEL_194:

        break;
      case 150:
        v341 = NSString;
        [v6 setDecimal:v16];
        [v341 stringWithFormat:v342, [NSString stringWithFormat:@"%.2lf:1", v343, v344, v345]];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 151:
        v346 = NSString;
        uint64_t v347 = [v6 v16:v17 v18:v19];
        [v346 stringWithFormat:v348, @("%u / 20", v349, v350, v347)];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 155:
        unint64_t v351 = [v6 v16:v17 v18:v19];
        if (*((void *)v5 + 9))
        {
          double v355 = (double)v351 / 1000000000.0;
          id v356 = objc_alloc(MEMORY[0x263EFF910]);
          uint64_t v45 = [v356 initWithTimeInterval:v357 sinceDate:*((void *)v5 + 9)];
          [*((void **)v5 + 6) stringFromDate:v360 timeZone:v361 locale:v362];
          uint64_t v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        [DTUserTimeFormatter stringForNanoseconds:v352 withPrecision:v351 andRounding:v353 andRoundingMode:v354];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 159:
        uint64_t v363 = objc_opt_new();
        v566[0] = MEMORY[0x263EF8330];
        v566[1] = 3221225472;
        v566[2] = sub_23458690C;
        v566[3] = &unk_264BF1E88;
        id v567 = v6;
        id v364 = v363;
        id v568 = v364;
        [v567 enumerateUint64Values:v365 usingBlock:^(uint64_t v566, BOOL *v366, BOOL *v367) {
        if ([v364 _callOutQueue_willDestroyWithTransitionContext:v368 completion:v369]) {
          uint64_t v20 = (__CFString *)v364;
        }
        else {
          uint64_t v20 = @"<empty>";
        }

        break;
      case 161:
      case 162:
        [v5 stringForCallSiteEngineeringValue:v16 value:v6 value2:v18 value3:v19];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 163:
        v573 = 0;
        v372 = objc_opt_new();
        out[0] = 0;
        if (![v6 getLengthOfUint64Representation:v373 withUint64:v573 andUint64:v374 andUint64:v375])
        {
          uint64_t v20 = @"corrupt";
          goto LABEL_222;
        }
        if ([v5 isMultiline:v376 with:v377 with:v378 with:v379])
        {
          if (v573)
          {
            for (unsigned __int16 k = 0; k < (unint64_t)v573; ++k)
            {
              if ([v6 getValue:out fieldIndex:k]
                && [out[0] isValid:v383 with:v384 with:v385 with:v386])
              {
                if ([v372 _callOutQueue_willDestroyWithTransitionContext:v383 completion:v387]) {
                  [v372 appendString:[NSString stringWithFormat:@"\n%@%@", v388, v389]];
                }
                uint64_t v391 = [v5 stringForCallSiteEngineeringValue:v388 value:out[0] unit:v389 unitName:v390];
                v395 = (void *)v391;
                if (v391) {
                  [v372 appendString:v392];
                }
                else {
                  [v372 appendString:v392, @"missing", v393, v394];
                }
              }
              else
              {
                [v372 appendString:v383, @"missing", v385, v386];
              }
            }
          }
          goto LABEL_220;
        }
        if (v573
          && [v6 getValue:out fieldIndex:0]
          && [out[0] isValid:v540 withTransitionContext:v541 completion:v542 withCompletion:v543])
        {
          v544 = sub_234583438(v5, out[0], a3);
          [v372 appendFormat:@"%@ ← (%lu other frames)", v546, v547, v544, v573 - 1];

LABEL_220:
          uint64_t v20 = v372;
          goto LABEL_222;
        }
        uint64_t v20 = @"empty";
LABEL_222:

        break;
      case 173:
        uint64_t v45 = [v6 v16:v17 v18:v19];
        uint64_t v399 = [v45 rangeOfString:@"."];
        if (v399 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_147:
          uint64_t v49 = v45;
        }
        else
        {
          [v45 substringFromIndex:v400 + 1 toIndex:v401 + 1];
          uint64_t v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_16;
      case 186:
        v403 = NSString;
        uint64_t v404 = [v6 v16:v17 v18:v19];
        [v403 stringWithFormat:@"%llx", v406, v407, v404];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 192:
        v408 = NSString;
        unint64_t v409 = [v6 v16:v17 v18:v19];
        [v408 stringWithFormat:@"0x%llx", v411, v412, bswap64(v409)];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 193:
        v573 = 0;
        if ([v6 getValue:v16 fieldIndex:0])
        {
          uint64_t v413 = sub_234583438(v5, v573, a3);
          v414 = v413;
          if (v413) {
            uint64_t v20 = v413;
          }
          else {
            uint64_t v20 = @"<bad size>";
          }
        }
        else
        {
          uint64_t v20 = @"<data>";
        }
LABEL_198:

        break;
      case 194:
        [*((void **)v5 + 7) setUnitOptions:v16 withOptions:v18];
        id v415 = objc_alloc(MEMORY[0x263F08980]);
        [v6 setFoo:v416 bar:v417 baz:v418 qux:v419];
        double v421 = v420;
        uint64_t v426 = [MEMORY[0x263F08CC8] baseUnit:v422 withUnit:v423 withUnit:v424 withUnit:v425];
        uint64_t v45 = [v415 initWithDoubleValue:v426 unit:v428];

        [*((void **)v5 + 7) stringFromMeasurement:v430 withUnit:v431 forDisplay:v432];
        uint64_t v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 195:
        [*((void **)v5 + 7) setUnitOptions:v16 forUnit:v18 withOptions:v19];
        id v433 = objc_alloc(MEMORY[0x263F08980]);
        [v6 setFoo:v434 bar:v435 baz:v436 qux:v437];
        double v439 = v438;
        v444 = [MEMORY[0x263F08CC8] baseUnit:v440 withUnit:v441 andUnit:v442 andUnit:v443];
        uint64_t v45 = [v433 initWithDoubleValue:v445 unit:v446];

        [*((void **)v5 + 7) stringFromMeasurement:v448 withUnit:v45];
        uint64_t v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 198:
        *((unsigned char *)v5 + 66) = 1;
        v451 = objc_opt_new();
        long long v562 = 0u;
        long long v563 = 0u;
        long long v564 = 0u;
        long long v565 = 0u;
        v456 = [v6 objectValue:v452, v453, v454, v455];
        uint64_t v458 = [v456 countByEnumeratingWithState:v457 objects:(id *)&v562 count:16];
        if (v458)
        {
          uint64_t v459 = *(void *)v563;
          do
          {
            for (uint64_t m = 0; m != v458; ++m)
            {
              if (*(void *)v563 != v459) {
                objc_enumerationMutation(v456);
              }
              uint64_t v461 = sub_234583438(v5, *(void *)(*((void *)&v562 + 1) + 8 * m), 1);
              v465 = (void *)v461;
              if (v461) {
                [v451 addObject:v462];
              }
              else {
                [v451 addObject:@"n/a" withValue:v463 forKey:v464];
              }
            }
            uint64_t v458 = [v456 countByEnumeratingWithState:v466 objects:&v562 count:16];
          }
          while (v458);
        }

        *((unsigned char *)v5 + 66) = a3;
        [v451 componentsJoinedByString:@" "];
        uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 206:
        unint64_t v201 = [v6 v16:v17 v18:v19];
        if (!v201) {
          goto LABEL_183;
        }
        if (v201 <= 0x3E7)
        {
          uint64_t v206 = "cycles";
          if (v201 < 2) {
            uint64_t v206 = "cycle";
          }
          [NSString stringWithFormat:@"%llu %s", v204, v205, v201, v206];
          uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_7;
        }
        uint64_t v45 = sub_2345866F0(v201, v202, v203, v204, v205);
        [v45 stringByAppendingString:v537, @"c", v538, v539];
        uint64_t v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_16:
        uint64_t v20 = v49;
LABEL_17:

        break;
      case 207:
        unsigned int v276 = [v6 v16:v17 v18:v18 v19:v19];
        if (v276 >= 4)
        {
          uint64_t v20 = @"Unknown";
        }
        else
        {
          uint64_t v277 = off_264BF1F38;
LABEL_168:
          uint64_t v20 = v277[v276];
        }
        break;
      case 208:
        v470 = objc_opt_new();
        v583[0] = MEMORY[0x263EF8330];
        v583[1] = 3221225472;
        v583[2] = sub_2345867B4;
        v583[3] = &unk_264BF1E10;
        id v584 = v5;
        id v471 = v470;
        id v585 = v471;
        [v6 enumerateKeyValuePairs:v472 usingBlock:v473];
        v475 = v585;
        uint64_t v20 = (__CFString *)v471;

        break;
      case 209:
        v573 = 0;
        [v5 getTitleAndSubtitleForURLSessionEngineeringValue:v16 title:&v573 subtitle:0];
        uint64_t v20 = v573;

        break;
      case 210:
        unint64_t v207 = [v6 v16:v17 v18:v19];
        if (!v207) {
          goto LABEL_183;
        }
        sub_2345866F0(v207, v208, v209, v210, v211);
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 215:
        v476 = (void *)*((void *)v5 + 6);
        v477 = (void *)MEMORY[0x263EFF910];
        [v6 setDecimal:v16.decimalValue];
        uint64_t v45 = [v477 dateWithTimeIntervalSince1970:v478, v479, v480, v481];
        [v476 stringFromDate:v482 timeZone:v483 locale:v484];
        uint64_t v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 221:
        v485 = (void *)*((void *)v5 + 5);
        v486 = NSNumber;
        [v6 setDecimal:v16.decimalValue];
        uint64_t v45 = [v486 numberWithDouble:v487, v488, v489, v490];
        [v485 stringFromNumber:v491];
        uint64_t v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 222:
        int v212 = [v6 v16:v17 v18:v19];
        v213 = strerror(v212);
        v214 = NSString;
        uint64_t v219 = [v6 v215:v216:v217:v218];
        if (v213) {
          [v214 stringWithFormat:@"[%d: %s]", v221, v222, v219, v213];
        }
        else {
          [v214 stringWithFormat:@"%d", v221, v222, v219];
        }
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 223:
        [v6 setDecimal:v16.decimalValue];
        uint64_t v224 = (unint64_t)(v223 * 1000000000.0);
        uint64_t v229 = [v5 _isHighestResolutionTimeEnabled:v225 :v226 :v227 :v228];
        [DTUserTimeFormatter stringForNanoseconds:v230 highestResolutionTimeEnabled:v224];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 225:
        v573 = 0;
        [v5 getTitleAndSubtitleForSwiftTaskEngineeringValue:v16 title:v6 subtitle:&v573];
        uint64_t v20 = v573;

        break;
      case 233:
        v573 = 0;
        [v5 getTitleAndSubtitleForSwiftActorEngineeringValue:v16 title:&v573 subtitle:0];
        uint64_t v20 = v573;

        break;
      case 234:
        unsigned int v232 = [v6 v16:v17:v18:v19] - 1;
        if (v232 >= 4)
        {
LABEL_187:
          uint64_t v20 = &stru_26E758AB0;
        }
        else
        {
          uint64_t v233 = off_264BF1EF0;
LABEL_105:
          uint64_t v20 = v233[v232];
        }
        break;
      case 237:
        v573 = 0;
        [v5 getTitleAndSubtitleForSwiftTaskPriorityEngineeringValue:v16 title:&v573 subtitle:0];
        uint64_t v20 = v573;

        break;
      case 238:
        int v234 = [v6 v16:v17 v18:v19];
        if (v234 == -1)
        {
          uint64_t v20 = @"MACH_PORT_DEAD";
        }
        else
        {
          if (v234)
          {
LABEL_13:
            uint64_t v34 = NSString;
            uint64_t v35 = [v6 v16:v17:v18:v19];
            [v34 stringWithFormat:v36, v37, v38, v35];
            uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_7;
          }
          uint64_t v20 = @"MACH_PORT_NULL";
        }
        break;
      case 243:
        if ([v6 v16:v17:v18:v19])
        {
          uint64_t v20 = @"-";
          if ([v6 v499:v500:v501:v502] != -1)
          {
            uint64_t v507 = [v6 v503:v504:v505:v506];
            v508 = @"+";
            if (v507 <= 0) {
              v508 = @"-";
            }
            if (v507 >= 0) {
              uint64_t v509 = v507;
            }
            else {
              uint64_t v509 = -v507;
            }
            v510 = v508;
            uint64_t v515 = [v5 _isHighestResolutionTimeEnabled:v511 :v512 :v513 :v514];
            v518 = [DTUserTimeFormatter stringForNanoseconds:v516 highestResolutionTimeEnabled:v515];
            [v510 stringByAppendingString:v519];
            uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
LABEL_183:
          uint64_t v20 = @"-";
        }
        break;
      case 245:
        [v5 stringForLibraryAddressEngineeringValue:v16 engineeringValue:(uint64_t)v6 engineeringValue2:v18 engineeringValue3:v19];
        uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 247:
        v522 = (void *)MEMORY[0x263EFFA18];
        v523 = [v6 v16:v17 v18:v19];
        uint64_t v45 = [v522 timeZoneWithName:v524];

        if (v45)
        {
          v531 = [MEMORY[0x263EFF960] systemLocale:v527 locale:v528 locale:v529 locale:v530];
          [v45 localizedName:v532 locale:v533];
          uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v20 = @"-";
        }
        goto LABEL_17;
      case 248:
        break;
      default:
        __break(1u);
        return result;
    }
  }
  else
  {
    int v22 = [v5 v11:v12 v13:v14];
    uint64_t v23 = @"n/a";
    if (v22) {
      uint64_t v23 = @"–";
    }
    uint64_t v21 = v23;
LABEL_7:
    uint64_t v20 = v21;
  }

  return v20;
}

void sub_234584EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t sub_2345866E4(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(result + 32) + 8 * a2) = a3;
  return result;
}

id sub_2345866F0(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 > 0x3E7)
  {
    double v5 = (double)a1;
    int v6 = (int)(log2((double)a1) / 9.96578428);
    uint64_t v7 = NSString;
    long double v8 = pow(1000.0, (double)v6);
    [v7 stringWithFormat:@"%.2f %s", v10, v11, v5 / v8, off_264BF1EA8[v6 - 1]];
  }
  else
  {
    [NSString stringWithFormat:@"%llu", a4, a5, a1];
  uint64_t v12 = };

  return v12;
}

void sub_2345867B4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  sub_234583438(v5, a2, 0);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = sub_234583438(*(void *)(a1 + 32), v6, 0);

  uint64_t v12 = [*(void **)(a1 + 40) lengthWithOptions:v8 range:v9];
  uint64_t v16 = *(void **)(a1 + 40);
  if (v12) {
    [v16 appendFormat:@", (%@ : %@)", v14, v15, v17, v7];
  }
  else {
    [v16 appendFormat:@"(%@ : %@)", v14, v15, v17, v7];
  }
}

uint64_t sub_234586874(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_234586884(uint64_t a1)
{
}

uint64_t sub_23458688C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendFormat:a2, a4, a5, a3];
}

uint64_t sub_2345868C4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(void **)(a1 + 32) appendFormat:a2, a4, a5, a3];
}

uint64_t sub_2345868F4(uint64_t result, uint64_t a2, unint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 8 * a2 + 32) = bswap64(a3);
  return result;
}

uint64_t sub_23458690C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((unint64_t)a2 < 0x33)
  {
    uint64_t v11 = *(void **)(a1 + 40);
    if (a2) {
      return [v11 appendFormat:@" 0x%llx", a4, a5, a3];
    }
    else {
      return [v11 appendFormat:@"0x%llx", a4, a5, a3];
    }
  }
  else
  {
    uint64_t v12 = 0;
    [*(void **)(a1 + 32) getLengthOfUint64Representation:a2 withUint64:v12 withUint64:a4 withUint64:a5];
    return [*(void **)(a1 + 40) appendFormat:v7, @": (%llu more...)", v8, v9, v12 - (void)a2];
  }
}

uint64_t sub_234586994()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v1 = (void *)qword_2687AA120;
  qword_2687AA120 = (uint64_t)v0;

  [qword_2687AA120 setNumberStyle:v2];
  uint64_t v8 = (void *)qword_2687AA120;

  return [v8 setUsesGroupingSeparator:v5];
}

uint64_t sub_2345869F0()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_2687AA130;
  qword_2687AA130 = v0;

  [qword_2687AA130 setNumberStyle:v2];
  [qword_2687AA130 setMaximumFractionDigits:v5];
  [qword_2687AA130 setPositiveSuffix:@" FPS" forState:v8];
  uint64_t v13 = qword_2687AA130;

  return MEMORY[0x270F9A6D0](v13, sel_setNegativeSuffix_, @" FPS", v11, v12);
}

uint64_t sub_234586A6C()
{
  qword_2687AA140 = sub_234586AA8(4);

  return MEMORY[0x270F9A758]();
}

id sub_234586AA8(uint64_t a1)
{
  id v2 = objc_opt_new();
  [v2 setNumberStyle:v3];
  [v2 setUsesGroupingSeparator:v6];
  [v2 setMinimumFractionDigits:a1];
  [v2 setMaximumFractionDigits:4];

  return v2;
}

uint64_t sub_234586B18()
{
  qword_2687AA150 = sub_234586AA8(0);

  return MEMORY[0x270F9A758]();
}

void sub_234586C68()
{
  uint64_t v0 = (void *)MEMORY[0x263F08D50];
  id v3 = (id)objc_opt_new();
  [v0 setValueTransformer:(id)v1 forName:@"XRSecureUnarchiveFromDataTransformerName"];
}

uint64_t sub_234586CCC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return [NSKeyedArchiver archivedDataWithRootObject:a2 requiringSecureCoding:a3 error:a4];
}

id sub_234586CE0(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  id v10 = v8;
  uint64_t v12 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v11 fromData:v10 error:v9];

  return v12;
}

void sub_234586F24(void *a1)
{
}

void sub_234586F3C(_Unwind_Exception *a1)
{
}

void sub_234587030(void *a1)
{
}

void sub_234587048(_Unwind_Exception *a1)
{
}

void sub_234587238()
{
  uint64_t v0 = (void *)qword_2687AA170;
  qword_2687AA170 = MEMORY[0x263EFFA78];
}

void sub_2345877D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v20 = [v3 v4:v5 v6:v7];
  id v8 = objc_alloc(MEMORY[0x263F08D40]);
  uint64_t v11 = [v8 initWithBytes:v9 objCType:(const char *)&v20];
  uint64_t v12 = *(void **)(a1 + 32);
  id v17 = [v3 v13:v14 v15:v16];

  [v12 setObject:v18 forKeyedSubscript:v11];
}

id sub_234587928()
{
  if (qword_2687AA238 != -1) {
    dispatch_once(&qword_2687AA238, &unk_26E7528B0);
  }
  uint64_t v0 = (void *)qword_2687AA230;

  return v0;
}

void sub_234587DB4()
{
  uint64_t v0 = (void *)qword_2687AA180;
  qword_2687AA180 = (uint64_t)&unk_26E761278;
}

void sub_234587EB8()
{
  uint64_t v0 = (void *)qword_2687AA190;
  qword_2687AA190 = (uint64_t)&unk_26E7612A0;
}

void sub_234587F24()
{
  v4[1] = *MEMORY[0x263EF8340];
  id v3 = @"type";
  v4[0] = objc_opt_class();
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v0 forKeys:(uint64_t)v4 count:1];
  uint64_t v2 = (void *)qword_2687AA1A0;
  qword_2687AA1A0 = v1;
}

void sub_234588008()
{
  v4[9] = *MEMORY[0x263EF8340];
  v3[0] = @"mnemonic";
  v4[0] = objc_opt_class();
  v3[1] = @"title";
  v4[1] = objc_opt_class();
  v3[2] = @"enum";
  void v4[2] = objc_opt_class();
  v3[3] = @"usage";
  v4[3] = objc_opt_class();
  v3[4] = @"class";
  v4[4] = objc_opt_class();
  v3[5] = @"attribute";
  v4[5] = objc_opt_class();
  v3[6] = @"experimental";
  v4[6] = objc_opt_class();
  v3[7] = @"deprecated";
  v4[7] = objc_opt_class();
  v3[8] = @"encoding-convention";
  v4[8] = objc_opt_class();
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v0 forKeys:v4 count:v3];
  uint64_t v2 = (void *)qword_2687AA1B0;
  qword_2687AA1B0 = v1;
}

void sub_2345881C4()
{
  uint64_t v0 = (void *)qword_2687AA1C0;
  qword_2687AA1C0 = (uint64_t)&unk_26E7612C8;
}

void sub_2345882E8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = [MEMORY[0x263F086E0] a2:a3:a4:a5];
  uint64_t v10 = [v5 _executablePath:v6 v7:v8 v9:v9];
  uint64_t v15 = [v10 _lastPathComponent:v11, v12, v13, v14];
  int isEqualToString = [v15 isEqualToString:@"etypetool" withOptions:v17 range:v18];

  if (isEqualToString)
  {
    char v20 = getenv("SRCROOT");
    if (v20)
    {
      int v22 = NSURL;
      uint64_t v23 = [NSURL fileURLWithFileSystemRepresentation:v21 isDirectory:1 relativeToURL:0];
      uint64_t v26 = [v22 URLWithString:v24 relativeToURL:v23];
      uint64_t v27 = (void *)qword_2687AA1D8;
      qword_2687AA1D8 = v26;
    }
  }
  if (!qword_2687AA1D8)
  {
    qword_2687AA1D8 = sub_234587928();
    MEMORY[0x270F9A758]();
  }
}

void sub_2345886B4()
{
  v4[4] = *MEMORY[0x263EF8340];
  v3[0] = @"sentinel";
  v4[0] = objc_opt_class();
  v3[1] = @"array";
  v4[1] = objc_opt_class();
  v3[2] = @"packed";
  void v4[2] = objc_opt_class();
  v3[3] = @"bit-width";
  v4[3] = objc_opt_class();
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v0 forKeys:v4 count:v3];
  uint64_t v2 = (void *)qword_2687AA1E0;
  qword_2687AA1E0 = v1;
}

void sub_2345887EC()
{
  uint64_t v0 = (void *)qword_2687AA1F0;
  qword_2687AA1F0 = (uint64_t)&unk_26E7612F0;
}

void sub_234588A24()
{
  void v4[2] = *MEMORY[0x263EF8340];
  v3[0] = @"slot";
  v3[1] = @"remainder";
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v0 forKeys:v4 count:v3];
  uint64_t v2 = (void *)qword_2687AA200;
  qword_2687AA200 = v1;
}

void sub_234588D10()
{
  v4[1] = *MEMORY[0x263EF8340];
  id v3 = @"bit-range";
  v4[0] = objc_opt_class();
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v0 forKeys:(uint64_t)v4 count:1];
  uint64_t v2 = (void *)qword_2687AA210;
  qword_2687AA210 = v1;
}

void sub_234588EF0()
{
  void v4[3] = *MEMORY[0x263EF8340];
  v3[0] = @"type";
  v4[0] = objc_opt_class();
  v3[1] = @"start";
  v4[1] = objc_opt_class();
  void v3[2] = @"end";
  void v4[2] = objc_opt_class();
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v0 forKeys:(uint64_t)v4 count:3];
  uint64_t v2 = (void *)qword_2687AA220;
  qword_2687AA220 = v1;
}

uint64_t sub_2345892B0(void *a1)
{
  id v1 = a1;
  uint64_t v6 = (const char *)[v1 objc_msgSend_objCType:v2 v3 v4 v5];
  if (!strcmp(v6, "C"))
  {
    unsigned __int8 v11 = 0;
    [v1 getValue:v7 atIndex:v8 withType:v9];
    return v11;
  }
  else
  {
    [v7 raiseFormat:v9 format:@"%@ is not an NSValue encoding an XRImplementationClassTypeID", v1];
    return 0;
  }
}

void sub_234589330(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.dt.instruments.DVTInstrumentsUtilities" bundleGroup:a4 bundleType:a5];
  uint64_t v10 = v5;
  if (!v5)
  {
    uint64_t v27 = [MEMORY[0x263F086E0] performSelector:v6 withObject:v7 withObject:v8 withObject:v9];
    uint64_t v32 = [v27 executableURL:v28 options:v29 error:v30];
    uint64_t v37 = [v32 _lastPathComponent:v33 withPath:v34 relativeToPath:v35];
    if ([v37 isEqualToString:v38 string:@"etypetool" v39 v40])
    {
    }
    else
    {
      uint64_t v45 = [MEMORY[0x263F086E0] performSelector:v41 withObject:v42 withObject:v43 withObject:v44];
      uint64_t v50 = [v45 executableURL:v46 options:v47 error:v48];
      uint64_t v55 = [v50 _lastPathComponent:v51 withPath:v52 withPath:v53 withPath:v54];
      int isEqualToString = [v55 isEqualToString:v56];

      if (!isEqualToString)
      {
        uint64_t v81 = (FILE *)*MEMORY[0x263EF8348];
        v82 = "Attempting to use XREngineeringTypeDefinitions.m outside the framework\n";
        size_t v83 = 71;
        goto LABEL_17;
      }
    }
    uint64_t v60 = getenv("SRCROOT");
    if (v60)
    {
      uint64_t v21 = [NSURL fileURLWithFileSystemRepresentation:v61 isDirectory:1 relativeToURL:0];
      uint64_t v64 = [v21 URLByAppendingPathComponent:@"DVTInstrumentsUtilities/EngineeringTypes/engineering_types.etypesdef" isDirectory:1];
      uint64_t v65 = (void *)qword_2687AA230;
      qword_2687AA230 = v64;

      id v91 = 0;
      char v69 = [qword_2687AA230 _checkResourceIsReachableAndReturnError:v66 error:&v91];
      id v70 = v91;
      if (v69)
      {

        goto LABEL_12;
      }
      uint64_t v84 = (FILE *)*MEMORY[0x263EF8348];
      [v70 localizedFailureReasonWithError:v71, v72, v73, v74];
      id v85 = objc_claimAutoreleasedReturnValue();
      uint64_t v90 = (const char *)[v85 UTF8String];
      fprintf(v84, "engineering_types.etypesdef is unreachable: %s\n", v90);

LABEL_18:
      exit(1);
    }
    uint64_t v81 = (FILE *)*MEMORY[0x263EF8348];
    v82 = "SRCROOT must be set to the root of DVTInstrumentsFrameworks.\n";
    size_t v83 = 61;
LABEL_17:
    fwrite(v82, v83, 1uLL, v81);
    goto LABEL_18;
  }
  uint64_t v11 = [v5 URLForResource:@"engineering_types" withExtension:@"etypesdef"];
  uint64_t v12 = (void *)qword_2687AA230;
  qword_2687AA230 = v11;

  if (!qword_2687AA230)
  {
    uint64_t v75 = [MEMORY[0x263F08690] _currentHandler:v13 v14:v15 v16:v16];
    uint64_t v79 = [NSString _etypesdefURL];
    [v75 handleFailureInFunction:v80 file:@"XREngineeringTypeDefinitions.m" lineNumber:203 description:@"Didn't find the engineering_types file in the bundle"];
  }
  if ([qword_2687AA230 _checkResourceIsReachableAndReturnError:v13 error:v15] == NO)
  {
    uint64_t v21 = [MEMORY[0x263F08690] currentHandler:v17, v18, v19, v20];
    uint64_t v25 = [NSString stringWithUTF8String:v22];
    [v21 handleFailureInFunction:v26 file:@"XREngineeringTypeDefinitions.m" lineNumber:204 description:@"Didn't find the engineering_types file in the bundle"];

LABEL_12:
  }
}

uint64_t sub_234589AF4()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1);
  id v1 = (void *)qword_2687AA248;
  qword_2687AA248 = (uint64_t)v0;

  qword_2687AA240 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

void *sub_234589FCC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3) {
    return [a1 setObject:a2 forKey:a3];
  }
  return a1;
}

id sub_234589FD8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v11 = [v6 setWithObject:v8 object:v7 object:v9 object:v10];
    [MEMORY[0x263F08910] deepCopy:v12 classes:v5, v11, v13];
  }
  else
  {
    uint64_t v11 = 0;
    [MEMORY[0x263F08910] deepCopyClasses:v3];
  uint64_t v14 = };

  return v14;
}

id sub_23458A06C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  id v23 = 0;
  uint64_t v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:v5 error:&v23];
  id v9 = v23;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23458A250;
  block[3] = &unk_264BF0B40;
  id v10 = v5;
  id v22 = v10;
  if (qword_2687AA258 == -1)
  {
    if (v9)
    {
LABEL_3:
      uint64_t v11 = (void *)qword_2687AA260;
      if (os_log_type_enabled((os_log_t)qword_2687AA260, OS_LOG_TYPE_ERROR)) {
        sub_23459BB60(v11, v9);
      }
      uint64_t v12 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    dispatch_once(&qword_2687AA258, block);
    if (v9) {
      goto LABEL_3;
    }
  }
  id v16 = (id)qword_2687AA268;
  if (v6)
  {
    uint64_t v17 = [qword_2687AA268 setByAddingObjectsFromSet:v13];

    id v16 = (id)v17;
  }
  id v20 = 0;
  uint64_t v12 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v13 fromData:v16 error:v8];
  id v9 = v20;
  if (v9)
  {
    uint64_t v18 = (void *)qword_2687AA260;
    if (os_log_type_enabled((os_log_t)qword_2687AA260, OS_LOG_TYPE_ERROR)) {
      sub_23459BAC8(v18, v9);
    }
  }

LABEL_13:

  return v12;
}

uint64_t sub_23458A250()
{
  os_log_t v0 = os_log_create("com.apple.dt.DVTInstrumentsUtilities", "KeyedArchiverDeepCopy");
  id v1 = (void *)qword_2687AA260;
  qword_2687AA260 = (uint64_t)v0;

  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  qword_2687AA268 = [v2 setWithObjects:v9, v3, v10, v11, v4, v5, v6, v7, v8, nil];

  return MEMORY[0x270F9A758]();
}

void sub_23458A340(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_23458A3F8(uint64_t a1, const char *a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (a3 == (void *)a4) {
    return 1;
  }
  else {
    return [a3 isEqual:a2];
  }
}

uint64_t sub_23458A414(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_2687AA278 != -1) {
    dispatch_once(&qword_2687AA278, &unk_26E7525B0);
  }
  uint64_t v6 = [a1 descriptionWithLocale:a2 indent:a3];
  if ([v6 rangeOfCharacterFromSet:v7 options:v8 range:v9] == NSNotFound)
  {
    uint64_t v14 = [XREngineeringNumberFormatter _clipsLiteralFormatter:v10 withValue:v11 withUnit:v12 withPrecision:v13];
    uint64_t v16 = [v14 getObjectValue:v15 errorDescription:0] ^ 1;
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

void sub_23458A4C8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  [MEMORY[0x263F089C0] a2:a3:a4:a5];
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [v18 addCharactersInString:v5 withCharactersInString:@"-" withRange:v6 withRange:v7];
  [v18 v8:v9 v10:v11];
  uint64_t v16 = [v18 copyWithZone:v12];
  uint64_t v17 = (void *)qword_2687AA270;
  qword_2687AA270 = v16;
}

id sub_23458A538(void *a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [XREngineeringNumberFormatter _clipsLiteralFormatter:v2 withValue:v3 withUnit:v4 withPrecision:v5];
    uint64_t v10 = [v6 stringFromNumber:(uint64_t)a1];
  }
  else if ([a1 _isCLIPSSymbol:v2 withContext:v3 withOptions:v4 withError:v5])
  {
    uint64_t v10 = [a1 descriptionWithLocale:v11 indent:v12];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = a1;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v21 = [v19 countByEnumeratingWithState:v20 objects:v55 count:16];
      if (v21)
      {
        uint64_t v26 = v21;
        uint64_t v27 = *(void *)v52;
        char v28 = 1;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v52 != v27) {
              objc_enumerationMutation(v19);
            }
            uint64_t v30 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            if ((v28 & 1) == 0) {
              [v10 appendString:@" "];
            }
            uint64_t v31 = [v30 _clipsStringRepresentation:v22 withMaxLength:v23 withTruncationSuffix:v24 withTruncationSuffixLength:v25];
            [v10 appendString:v32];

            char v28 = 0;
          }
          uint64_t v26 = [v19 countByEnumeratingWithState:v22 objects:v55 count:16];
          char v28 = 0;
        }
        while (v26);
      }
    }
    else
    {
      uint64_t v35 = [a1 descriptionWithLocale:v15 indent:v16];
      [v10 appendString:v36];

      uint64_t v43 = [v10 lengthWith:v39, v40, v41, v42];
      [v10 replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:0 range:v43];
      [v10 insertString:@"\"" atIndex:0];
      [v10 appendString:@"\""];
    }
  }

  return v10;
}

id sub_23458A78C(void *a1, uint64_t a2)
{
  v22[1] = *MEMORY[0x263EF8340];
  if (!a1) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v20 = [MEMORY[0x263F08690] currentHandler:v4, v5, v6, v7];
      [v20 _handleFailureInMethod:v21 object:a2 file:@"NSObject+DVTInstrumentsUtilities.m" lineNumber:74 description:@"Invalid parameter not satisfying: %@", @"[self isKindOfClass:NSString.class] || [self isKindOfClass:NSArray.class]"];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22[0] = a1;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:v22];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = a1;
    uint64_t v15 = [v11 indexesOfObjectsPassingTest:v12, ^(id obj, NSUInteger idx, BOOL *stop) {
    return unk_26E752790(obj, idx, stop);
}];
    uint64_t v10 = [v11 objectsAtIndexes:v16 index:v15 indexes:v17 indexes:v18];
  }
  else
  {
LABEL_9:
    uint64_t v10 = (void *)MEMORY[0x263EFFA68];
  }
LABEL_10:

  return v10;
}

uint64_t sub_23458A920(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_23458AB78(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = (void *)MEMORY[0x263F08D40];
  id v10 = a5;
  id v11 = a2;
  uint64_t v14 = [v9 _valueWithRange:a3 range:a4];
  [*(void **)(*(void *)(a1 + 32) + 8) setObject:v15 forKeyedSubscript:v14];

  id v23 = [v10 copyWithZone:v17];
  [*(void **)(*(void *)(a1 + 32) + 16) setObject:v21 forKeyedSubscript:v23];
}

void sub_23458AFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_23458B01C(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  id v8 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    uint64_t v22 = a1[6];
LABEL_8:
    *(unsigned char *)(*(void *)(v22 + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    uint64_t v22 = a1[5];
    goto LABEL_8;
  }
  id v10 = v7;
  if ([v10 countWithObjects:v11, v12, v13, v14] && [v10 countWithObjects:v15, v16, v17, v18] < 4)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_23458B194;
    v23[3] = &unk_264BF1FD8;
    long long v24 = *((_OWORD *)a1 + 2);
    uint64_t v25 = a4;
    [v10 enumerateObjectsUsingBlock:v19, (uint64_t)v23, v20, v21];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
  }

LABEL_11:
}

void sub_23458B194(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
      uint64_t v6 = (unsigned char *)a1[6];
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      *a4 = 1;
      *uint64_t v6 = 1;
    }
  }
}

void sub_23458B238(uint64_t a1, void *a2, void *a3)
{
  id v43 = a2;
  id v5 = a3;
  id v10 = [v5 v6:v7:v8:v9];
  uint64_t v15 = [v10 unsignedIntegerValueForSelector:v11 withObject:v12 withObject:v13 withObject:v14];

  uint64_t v23 = v15;
  if (v5.count >= 2)
  {
    long long v24 = [v5 objectAtIndexedSubscript:v20];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v29 = [v5 objectAtIndexedSubscript:v26];
    uint64_t v34 = v29;
    if (isKindOfClass)
    {
      uint64_t v23 = v15;
    }
    else
    {
      uint64_t v23 = [v29 performSelector:v30 withObject:v31 withObject:v32 withObject:v33];

      if (([v5 _callOutQueue_willDestroyWithTransitionContext:v35 completion:v36] & 1) == 0) {
        goto LABEL_7;
      }
      uint64_t v34 = [v5 objectAtIndexedSubscript:v20];
    }
    [*(void **)(*(void *)(a1 + 32) + 16) setObject:v30 forKeyedSubscript:v34];
  }
LABEL_7:
  uint64_t v40 = [MEMORY[0x263F08D40] valueWithRange:NSMakeRange(v20, v23 - v15 + 1)];
  [*(void **)(*(void *)(a1 + 32) + 8) setObject:v41 forKeyedSubscript:v40];
}

void sub_23458B55C(uint64_t a1, void *a2, void *a3)
{
  id v32 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  uint64_t v11 = [v5 rangeValueForRange:v7 inString:v8 limitedToRange:v9];
  uint64_t v13 = v12;

  uint64_t v17 = [NSNumber numberWithUnsignedInteger:v14];
  [v6 addObject:v18 withKey:(uint64_t)v17 withValue:v19 withValue:v20];

  if (v13 != 1)
  {
    long long v24 = [NSNumber numberWithUnsignedInteger:v21 + v13 - 1];
    [v6 addObject:v25 withKey:(uint64_t)v24 value:v26 value2:v27];
  }
  uint64_t v31 = [*(void **)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v21 withKey:v32 withKeyedSubscript:v22 withKey:v23];
  if (v31) {
    [v6 addObject:v28];
  }
  [*(void **)(a1 + 40) setObject:v28 forKeyedSubscript:v6];
}

void sub_23458BAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 216), 8);
  _Unwind_Resume(a1);
}

void sub_23458BB28(uint64_t a1, void *a2, void *a3)
{
  id v42 = a2;
  id v5 = a3;
  uint64_t v10 = [v5 rangeValueWithRange:v6, v7, v8, v9];
  uint64_t v12 = [*(void **)(a1 + 32) supportForCapability:v11 versions:v42, v10, v11];
  if (v12 == 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
    id v32 = [*(void **)(*(void *)(a1 + 64) + 16) objectForKeyedSubscript:v13 withKey:v42 withKeyedSubscript:v14 withKey:v15];
    if (v32
      || (objc_msgSend_unimplementedRecoveryForCapability_(*(void **)(a1 + 32), v29, (uint64_t)v42, v30, v31),
          (id v32 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [*(void **)(a1 + 72) addObject:v29 withObject:v32];
    }
    uint64_t v33 = (void *)MEMORY[0x263F08D40];
    uint64_t v34 = [*(void **)(a1 + 32) supportedVersionsForCapability:v29 version:v42 options:v30];
    uint64_t v37 = [v33 valueWithRange:v35 inRange:v34];
    [*(void **)(a1 + 48) setObject:v38 forKeyedSubscript:v37];

    [*(void **)(a1 + 56) setObject:v40 forKeyedSubscript:v5];
  }
  else if (v12 == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    uint64_t v19 = [*(void **)(a1 + 32) abandonedRecoveryForCapability:v13 withTransitionContext:v14 completion:v15];
    if (v19) {
      [*(void **)(a1 + 40) addObject:v16 withTransitionContext:v17 completion:v18];
    }
    uint64_t v20 = (void *)MEMORY[0x263F08D40];
    uint64_t v21 = [*(void **)(a1 + 32) supportedVersionsForCapability:v16 version:v42 options:v17];
    long long v24 = [v20 _valueWithRange:v22 range:v21];
    [*(void **)(a1 + 48) setObject:v25 forKeyedSubscript:v24];

    [*(void **)(a1 + 56) setObject:v27 forKeyedSubscript:v5];
  }
}

uint64_t sub_23458BCFC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = [*(void **)(a1 + 32) appendFormat:a2, a4, a5, a2];
  if (a3 + 1 == *(void *)(a1 + 40))
  {
    uint64_t v11 = *(void **)(a1 + 32);
    return [v11 appendString:v8, @"\n", v9, v10];
  }
  return result;
}

uint64_t sub_23458BD78(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = [*(void **)(a1 + 32) appendFormat:a2, @" %@", a4, a5, a2];
  if (a3 + 1 == *(void *)(a1 + 40))
  {
    uint64_t v11 = *(void **)(a1 + 32);
    return [v11 appendString:v8 string:@"\n" string:v9 string:v10];
  }
  return result;
}

BOOL sub_23458BE38(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = [a1 a2:a3 a4:a4 a5:a5];
  if ([v6 isEqualToString:@"Supported Capability Problem" v8 v9]) {
    BOOL v14 = [a1 v10:v11 v12:v12 v13:v13] == 0;
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

void sub_23458BE94(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v9 = [a1 performSelector:v5 withObject:v6 withObject:v7 withObject:v8];
  uint64_t v13 = [v9 objectForKeyedSubscript:v10 key:@"XRCapabilityRangesKey" defaultValue:v11 defaultValue2:v12];
  uint64_t v17 = [v9 objectForKeyedSubscript:v14 key:@"XRRequiredVersionsKey" defaultValue:v15 defaultValueType:v16];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_23458BF88;
  v23[3] = &unk_264BF20C8;
  id v24 = v17;
  id v25 = v4;
  id v18 = v17;
  id v19 = v4;
  [v13 enumerateKeysAndObjectsUsingBlock:v20, (uint64_t)v23, v21, v22];
}

void sub_23458BF88(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = a2;
  uint64_t v13 = [a3 rangeValueForRange:v9 inRange:v10];
  uint64_t v15 = v14;
  [*(void **)(a1 + 32) objectForKeyedSubscript:v14 withKey:v8 withKeyedSubscript:v16 withKey:v17];
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v24 rangeValueWithRange:v18];
  (*(void (**)(uint64_t, id, uint64_t, const char *, uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v8, v13, v15, v22, v23, a4);
}

void sub_23458C0E8(uint64_t a1, void *a2)
{
  uint64_t v3 = NSString;
  id v4 = a2;
  uint64_t v9 = [v4 v5:v6 v7:v8];
  [v3 stringWithFormat:@"com.apple.dt.etype.%@ %@ %@", v11, v12, v9];
  id v38 = (id)objc_claimAutoreleasedReturnValue();

  [*(void **)(a1 + 32) registerCapability:v13 versions:v38];
  BOOL v14 = NSString;
  uint64_t v19 = [v4 v15:v16 v17:v18];
  uint64_t v23 = [v14 stringWithFormat:@"This version does not support the new engineering type '%@'.", v21, v22, v19];

  [*(void **)(a1 + 32) setUnimplementedRecoverySuggestion:v24 forCapability:v23];
  uint64_t v26 = NSString;
  uint64_t v31 = [v4 v27:v28 v29:v30];

  uint64_t v35 = [v26 stringWithFormat:@"This version no longer supports the engineering type '%@'.", v33, v34, v31];

  [*(void **)(a1 + 32) setAbandonedRecoverySuggestion:v36 forCapability:(uint64_t)v35 capability:(uint64_t)v38];
}

void sub_23458C860()
{
  void v4[2] = *MEMORY[0x263EF8340];
  v3[0] = @"xs:annotation";
  v3[1] = @"xs:restriction";
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v0 forKeys:(uint64_t)v4 count:2];
  id v2 = (void *)qword_2687AA288;
  qword_2687AA288 = v1;
}

void sub_23458D928(void *a1, uint64_t a2)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v8 = v3;
  if (!v3) {
    goto LABEL_22;
  }
  if (![v3 _errorLimit:v4, v5, v6, v7]) {
    || (unint64_t v13 = *((void *)v8 + 4), v13 <= objc_msgSend_errorLimit(v8, v9, v10, v11, v12))
  {
    ++*((void *)v8 + 4);
    uint64_t v19 = [v8 _findErrorMessageForErrorPtr:v9 a2:v11 v12:v12];
    uint64_t v15 = v19;
    if (!v19)
    {
      [v8 writeStringWithFormat:@"%s:%d: error: %s", v22, v23, *(void *)(a2 + 24), *(unsigned int *)(a2 + 32), *(void *)(a2 + 8)];
      uint64_t v33 = *((void *)v8 + 9);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = *(void *)(a2 + 24);
        int v35 = *(_DWORD *)(a2 + 32);
        uint64_t v36 = *(void **)(a2 + 8);
        *(_DWORD *)buf = 136315650;
        uint64_t v68 = v34;
        __int16 v69 = 1024;
        int v70 = v35;
        __int16 v71 = 2080;
        uint64_t v72 = v36;
        _os_log_error_impl(&dword_234574000, v33, OS_LOG_TYPE_ERROR, "%s:%d: error: %s", buf, 0x1Cu);
      }
      goto LABEL_21;
    }
    id v24 = [v19 v20:v21 v22:v23];
    int isEqualToString = [v24 isEqualToString:v25 unique:v26];

    if (isEqualToString)
    {
      [NSString stringWithFormat:@" Repeating element value is: %s.\n", v31, v32, *(void *)(a2 + 40)];
    }
    else
    {
      uint64_t v37 = [v15 v29:v30 v31:v32];
      int v41 = [v37 isEqualToString:v38 key:v39 value:v40];

      if (v41)
      {
        [NSString stringWithFormat:v42, @" Invalid value is: %s.\n", v44, v45, *(void *)(a2 + 48)];
      }
      else
      {
        uint64_t v46 = [v15 v42:v43 v44:v44 v45:v45];
        int v50 = [v46 isEqualToString:v47];

        if (!v50) {
          goto LABEL_17;
        }
        [NSString stringWithFormat:@" '%s' doesn't fulfill the requirements.\n", v53, v54, *(void *)(a2 + 40)];
      }
    uint64_t v55 = };
    if (v55)
    {
      uint64_t v56 = [v15 replacementString:v51, v52, v53, v54];
      uint64_t v60 = [v56 stringByAppendingString:v57];

LABEL_18:
      [v8 writeStringWithFormat:@"%s:%d: error: %@", v62, v63, *(void *)(a2 + 24), *(unsigned int *)(a2 + 32), v60];
      uint64_t v64 = *((void *)v8 + 9);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        uint64_t v65 = *(void *)(a2 + 24);
        int v66 = *(_DWORD *)(a2 + 32);
        *(_DWORD *)buf = 136315650;
        uint64_t v68 = v65;
        __int16 v69 = 1024;
        int v70 = v66;
        __int16 v71 = 2112;
        uint64_t v72 = v60;
        _os_log_error_impl(&dword_234574000, v64, OS_LOG_TYPE_ERROR, "%s:%d: error: %@", buf, 0x1Cu);
      }

      goto LABEL_21;
    }
LABEL_17:
    uint64_t v60 = [v15 replacementStringWithText:v51 replacementRange:v52 selectedRange:v53];
    goto LABEL_18;
  }
  if (!*((unsigned char *)v8 + 40))
  {
    *((unsigned char *)v8 + 40) = 1;
    uint64_t v15 = [*((void **)v8 + 1) v9:v14:v11:v12];
    [*((void **)v8 + 6) writeStringWithFormat:@"%@: error: Too many schema validation errors emitted. Stopping now.\n", v17, v18, v15];
LABEL_21:
  }
LABEL_22:
}

void sub_23458DC54(void *a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = (void *)*((void *)v7 + 6);
  uint64_t v9 = *(void *)(a2 + 24);
  if (!v9) {
    uint64_t v9 = [*((void **)v7 + 1) fileSystemRepresentation:v3 length:v4 encoding:v5];
  }
  [v8 writeStringWithFormat:@"%s:%d: error: %s", v5, v6, v9, *(unsigned int *)(a2 + 32), *(void *)(a2 + 8)];
  uint64_t v10 = *((id *)v7 + 9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = *(void *)(a2 + 24);
    if (!v15) {
      uint64_t v15 = [*((void **)v7 + 1) fileSystemRepresentation:v11 length:v12];
    }
    int v16 = *(_DWORD *)(a2 + 32);
    uint64_t v17 = *(void *)(a2 + 8);
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = v15;
    __int16 v20 = 1024;
    int v21 = v16;
    __int16 v22 = 2080;
    uint64_t v23 = v17;
    _os_log_error_impl(&dword_234574000, v10, OS_LOG_TYPE_ERROR, "%s:%d: error: %s", buf, 0x1Cu);
  }
}

void sub_23458E838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23458EAC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23458EBDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)XRFrameActivityManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_23458ECB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23458EDD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23458EEC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_23458EEE4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void **)(a1 + 40);
  uint64_t result = [*(void **)(a1 + 32) performSelector:a2 withObject:*(void *)(a1 + 40) withObject:a4 withObject:a5];
  if ((result & 1) == 0)
  {
    [*(void **)(a1 + 40) setYieldNow:v9 yielding:v10 withReturnValue:v11];
    [*(void **)(a1 + 32) prepareMinorFrameAgent:v12 withTransitionContext:*(void *)(a1 + 40) withCompletion:v13 withError:v14];
    [*(void **)(a1 + 40) hello:v15, v16, v17, v18];
    [v7 setYieldNow:v19];
    [*(void **)(a1 + 32) escortMinorFrameAgentToExit:v22 withTransitionContext:*(void *)(a1 + 40) completion:v23];
    if ([v7 _nextMovementType:v25 with:v26 with:v27 with:v28] != 2) {
      return [*v7 goodbye:v29 v30:v31 v32:v32];
    }
    uint64_t result = [*(void **)(a1 + 32) _holdBackRevisitingAgent_:v29 with:*(void *)(a1 + 40) and:v31 and:v32];
    if ((result & 1) == 0) {
      return [*v7 goodbye:v29 v30:v31 v32:v32];
    }
  }
  return result;
}

void sub_23458EF98(_Unwind_Exception *a1)
{
}

void sub_23458F138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23458F234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_23458F30C@<X0>(long long *a1@<X1>, unsigned __int8 *a2@<X2>, int *a3@<X3>, void *a4@<X8>)
{
  id v8 = operator new(0x68uLL);
  uint64_t result = sub_23458F380(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_23458F36C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_23458F380(void *a1, long long *a2, unsigned __int8 *a3, int *a4)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E752398;
  sub_23458F478((int)&v6, a1 + 24, a2, a3, a4);
  return a1;
}

void sub_23458F3E4(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_23458F3F8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E752398;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_23458F418(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E752398;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x237DC08F0);
}

uint64_t sub_23458F46C(uint64_t a1)
{
  return sub_234597608(a1 + 24);
}

void sub_23458F478(int a1, int a2, long long *a3, unsigned __int8 *a4, int *a5)
{
  long long v5 = *a3;
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  sub_2345975BC(a2, (int)&v5, *a4, *a5, QOS_CLASS_USER_INITIATED);
  if (*((void *)&v5 + 1)) {
    sub_234578B24(*((std::__shared_weak_count **)&v5 + 1));
  }
}

void sub_23458F4CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_234578B24(a10);
  }
  _Unwind_Resume(exception_object);
}

void *sub_23458F4E4@<X0>(long long *a1@<X1>, unsigned __int8 *a2@<X2>, int *a3@<X3>, void *a4@<X8>)
{
  id v8 = operator new(0x68uLL);
  uint64_t result = sub_23458F558(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_23458F544(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_23458F558(void *a1, long long *a2, unsigned __int8 *a3, int *a4)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E752398;
  sub_23458F5D0((int)&v6, a1 + 24, a2, a3, a4);
  return a1;
}

void sub_23458F5BC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_23458F5D0(int a1, int a2, long long *a3, unsigned __int8 *a4, int *a5)
{
  long long v5 = *a3;
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  sub_2345975BC(a2, (int)&v5, *a4, *a5, QOS_CLASS_USER_INITIATED);
  if (*((void *)&v5 + 1)) {
    sub_234578B24(*((std::__shared_weak_count **)&v5 + 1));
  }
}

void sub_23458F624(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_234578B24(a10);
  }
  _Unwind_Resume(exception_object);
}

void *sub_23458F63C@<X0>(unsigned int *a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x28uLL);
  uint64_t result = sub_23458F698(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_23458F684(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_23458F698(void *a1, unsigned int *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E7523D0;
  sub_2345964EC(a1 + 3, *a2);
  return a1;
}

void sub_23458F6E4(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_23458F6F8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E7523D0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_23458F718(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E7523D0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x237DC08F0);
}

void sub_23458F76C(uint64_t a1)
{
}

void DVTIUAssertRecover(uint64_t a1, uint64_t a2, void *a3)
{
  long long v5 = a3;
  NSLog(&cfstr_Dvtinstruments_0.isa, a1, a2);
  v5[2]();
}

void DVTIUAssertNotMainThread(uint64_t a1, uint64_t a2)
{
}

void DVTIUAssertMainThread(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  [MEMORY[0x263F08B88] a2:a3:a4:a5];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(&cfstr_Dvtinstruments_2.isa, a1, a2, v7);
}

BOOL _DVTIURuntimeCheckForBlockCaptureOfObject(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = 0;
  if (a1 && v3)
  {
    unint64_t v5 = *(void *)(*(void *)(a1 + 24) + 8) + a1;
    if (a1 + 40 <= v5)
    {
      char v6 = (id *)(a1 + 32);
      unint64_t v7 = a1 + 48;
      do
      {
        id v8 = *v6++;
        BOOL v4 = v8 == v3;
        BOOL v9 = v8 == v3 || v7 > v5;
        v7 += 8;
      }
      while (!v9);
    }
    else
    {
      BOOL v4 = 0;
    }
  }

  return v4;
}

uint64_t DVTIUIsAppleInternalOSEnvironment()
{
  if (qword_2687AA2E8 != -1) {
    dispatch_once(&qword_2687AA2E8, &unk_26E7525F0);
  }
  return byte_2687AA2E0;
}

uint64_t sub_23458F930()
{
  uint64_t result = os_variant_has_internal_ui();
  byte_2687AA2E0 = result;
  return result;
}

__CFString *DVTIUCurrentDylibRootPath()
{
  os_log_t v0 = getenv("DYLD_ROOT_PATH");
  if (v0 && (uint64_t v1 = realpath_DARWIN_EXTSN(v0, 0)) != 0)
  {
    unint64_t v5 = v1;
    [NSString stringWithUTF8String:(const char *)v2];
    char v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    free(v5);
  }
  else
  {
    char v6 = @"/";
  }

  return v6;
}

uint64_t DVTIUUidForPid(int a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *(void *)uint64_t v12 = 0xE00000001;
  int v13 = 1;
  int v14 = a1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  memset(v5, 0, sizeof(v5));
  size_t v4 = 648;
  int v1 = sysctl(v12, 4u, v5, &v4, 0, 0);
  if (v4) {
    BOOL v2 = v1 == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2) {
    return DWORD1(v6);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t DVTIsRestrictedPid()
{
  return 0;
}

BOOL DVTIsProcessRestricted(task_name_t a1)
{
  return sub_23458FAE0(a1) < 2;
}

uint64_t sub_23458FAE0(task_name_t a1)
{
  kern_return_t v6;
  int v7;
  int v8;
  int v9;
  int buffer;
  int x;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  long long v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 - 1 > 0xFFFFFFFD) {
    return 0;
  }
  uint64_t v16 = v1;
  uint64_t v17 = v2;
  if (!csr_check()) {
    return 3;
  }
  int has_internal_content = os_variant_has_internal_content();
  uint64_t v15 = 2048;
  *(_OWORD *)task_info_out = 0u;
  int v14 = 0u;
  task_info_outCnt = 8;
  if (task_info(a1, 0xFu, task_info_out, &task_info_outCnt)) {
    return 0;
  }
  x = 0;
  long long v6 = pid_for_task(a1, &x);
  uint64_t result = 0;
  if (!v6)
  {
    buffer = 0;
    long long v7 = proc_pidinfo(x, 30, 0, &buffer, 4);
    uint64_t result = 0;
    if (v7 == 4)
    {
      long long v8 = csops_audittoken();
      uint64_t result = 0;
      if (!v8)
      {
        if ((v15 & 4) == 0)
        {
          if ((v15 & 0x800) != 0)
          {
            if (!has_internal_content) {
              return 0;
            }
            return geteuid() == 0;
          }
          else
          {
            if ((v15 & 0x20000000) != 0) {
              long long v9 = has_internal_content;
            }
            else {
              long long v9 = 1;
            }
            if (v9) {
              return 3;
            }
            else {
              return 2;
            }
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t DVTIsProcessDebuggable(task_name_t a1)
{
  return sub_23458FAE0(a1) & 1;
}

uint64_t DVTIsSimulatorProcess()
{
  return 0;
}

BOOL DVTCheckIfPIDExists(BOOL result)
{
  if (result) {
    return kill(result, 0) != -1 || *__error() != 3;
  }
  return result;
}

void sub_23458FCDC()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_2687AA2F8;
  qword_2687AA2F8 = v0;

  [v2 performSelectorOnMainThread:v3 withObject:v4 waitUntilDone:v5];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 setMaxConcurrentOperationCount:32];
}

uint64_t sub_23458FDA8()
{
  uint64_t v0 = objc_alloc_init(XRFrameCommutator);
  uint64_t v1 = (void *)qword_2687AA300;
  qword_2687AA300 = (uint64_t)v0;

  long long v6 = (void *)qword_2687AA300;

  return [v6 performSelector:v2 withObject:v3 withObject:v4 withObject:v5];
}

void sub_23458FE80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23458FE90()
{
}

void sub_23458FEE4(_Unwind_Exception *a1)
{
  MEMORY[0x237DC08F0](v1, 0x1020C40D1E833C5);
  _Unwind_Resume(a1);
}

void sub_23458FF78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)XRFrameCommutator;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

uint64_t sub_2345900CC(uint64_t a1, void **a2)
{
  if (a2)
  {
    uint64_t v4 = a2 + 29;
    sub_234578A84(&v4);
    uint64_t v4 = a2 + 26;
    sub_234578A84(&v4);
    uint64_t v4 = a2 + 23;
    sub_234578A84(&v4);
    return MEMORY[0x237DC08F0](a2, 0x1020C40D1E833C5);
  }
  return result;
}

void sub_2345905D8(void *a1, void *a2, uint64_t a3)
{
  id v25 = a1;
  uint64_t v8 = [a2 URLByAppendingPathComponent:v5 withPathComponent:a3 withPathComponent:v6 withPathComponent:v7];
  if ([v8 _checkResourceIsReachableAndReturnError:v9 error:v10])
  {
    uint64_t v16 = NSDictionary;
    uint64_t v17 = [v8 relativePath:v12, v13, v14, v15];
    uint64_t v21 = [v16 dictionaryWithContentsOfFile:v18];
    [v25 addEntriesFromDictionary:v22];
  }
}

void sub_234590780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_2345907A4(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  uint64_t v10 = v5;
  unint64_t v18 = a3;
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v11 = [v5 copyWithZone:v6];
    uint64_t v12 = *(void *)(a1 + 32) + 8;
    uint64_t v19 = &v18;
    uint64_t v13 = sub_234590F90(v12, &v18, (uint64_t)&unk_2345A0510, &v19);
    uint64_t v14 = (void *)v13[3];
    v13[3] = v11;
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32) + 8;
    uint64_t v19 = &v18;
    uint64_t v16 = sub_234590F90(v15, &v18, (uint64_t)&unk_2345A0510, &v19);
    id v17 = v10;
    uint64_t v14 = (void *)v16[3];
    v16[3] = v17;
  }
}

void sub_23459086C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234590994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234590A60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234590B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234590C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_234590D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_234590D1C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(void **)(a1 + 32) addObject:a2 withObject:a4 withObject:a5];
}

void sub_234590DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_234590DF4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = *(void **)(a1 + 32);
  [NSNumber numberWithUnsignedLongLong:a2 a3:a3 a4:a4 a5:a5];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v5 addObject:v6];
}

void sub_234590E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234590F28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_234590F90(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t v13 = (void *)(a1 + 16);
  uint64_t i = operator new(0x20uLL);
  *uint64_t i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    sub_234591210(a1, v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v20 = *(void *)a1;
  uint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *uint64_t i = *v21;
LABEL_38:
    *uint64_t v21 = i;
    goto LABEL_39;
  }
  *uint64_t i = *v13;
  *uint64_t v13 = i;
  *(void *)(v20 + 8 * v4) = v13;
  if (*i)
  {
    unint64_t v22 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }
    else
    {
      v22 &= v8 - 1;
    }
    uint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_2345911C0(_Unwind_Exception *a1)
{
  sub_23459145C(v2, v1);
  _Unwind_Resume(a1);
}

void sub_2345911DC()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_234591210(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_234591300(a1, prime);
    }
  }
}

void sub_234591300(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_2345911DC();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void sub_23459145C(uint64_t a1, id *a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
  }
  else if (!a2)
  {
    return;
  }

  operator delete(a2);
}

void *sub_2345914B4(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  uint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *sub_234591568(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint8x8_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  unint64_t v12 = (void *)(a1 + 16);
  uint64_t i = operator new(0x20uLL);
  uint64_t v13 = *a3;
  uint64_t v14 = a3[1];
  a3[1] = 0;
  *uint64_t i = 0;
  i[1] = v6;
  i[2] = v13;
  i[3] = v14;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v7 || (float)(v16 * (float)v7) < v15)
  {
    BOOL v17 = 1;
    if (v7 >= 3) {
      BOOL v17 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v7);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_234591210(a1, v20);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v21 = *(void *)a1;
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *uint64_t i = *v22;
LABEL_38:
    *unint64_t v22 = i;
    goto LABEL_39;
  }
  *uint64_t i = *v12;
  *unint64_t v12 = i;
  *(void *)(v21 + 8 * v3) = v12;
  if (*i)
  {
    unint64_t v23 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v23 >= v7) {
        v23 %= v7;
      }
    }
    else
    {
      v23 &= v7 - 1;
    }
    unint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_234591798(_Unwind_Exception *a1)
{
  sub_23459145C(v2, v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_2345917B4(void *a1, unint64_t *a2)
{
  uint64_t result = sub_2345914B4(a1, a2);
  if (result)
  {
    sub_2345917EC(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

void *sub_2345917EC(void *result, uint64_t *a2)
{
  if (a2)
  {
    uint64_t v2 = *a2;
    sub_23459184C(result, a2, (uint64_t)&__p);
    unint64_t v3 = (id *)__p;
    __p = 0;
    if (v3)
    {
      if (v5) {

      }
      operator delete(v3);
    }
    return (void *)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_23459184C@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  unint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    unint64_t v7 = v6;
    unint64_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  void *v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_234591980(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_2345919D8(a1, *(id **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void sub_2345919D8(uint64_t a1, id *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      int8x8_t v3 = (id *)*v2;

      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void sub_234591A1C(void *a1, void *a2, void *a3)
{
  unint64_t v4 = a2;
  uint64_t v6 = a1[1];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
      *(void *)(*a1 + 8 * i) = 0;
    unint64_t v8 = (id *)a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8) {
      BOOL v9 = a2 == a3;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      uint64_t v10 = v8;
    }
    else
    {
      do
      {
        unint64_t v11 = (void *)v4[3];
        v8[2] = (id)v4[2];
        objc_storeStrong(v8 + 3, v11);
        uint64_t v10 = (id *)*v8;
        unint64_t v12 = (unint64_t)v8[2];
        v8[1] = (id)v12;
        uint64_t v13 = sub_234591B34((uint64_t)a1, v12, v8 + 2);
        sub_234591C8C(a1, v8, v13);
        unint64_t v4 = (void *)*v4;
        if (v10) {
          BOOL v14 = v4 == a3;
        }
        else {
          BOOL v14 = 1;
        }
        unint64_t v8 = v10;
      }
      while (!v14);
    }
    sub_2345919D8((uint64_t)a1, v10);
  }
  while (v4 != a3)
  {
    sub_234591FD8(a1, v4 + 2);
    unint64_t v4 = (void *)*v4;
  }
}

void sub_234591B08(void *a1)
{
  __cxa_begin_catch(a1);
  sub_2345919D8(v1, v2);
  __cxa_rethrow();
}

void sub_234591B20(_Unwind_Exception *a1)
{
}

void *sub_234591B34(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    sub_234591D74(a1, v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }
  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }
  float v16 = *(void **)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0;
  }
  int v17 = 0;
  do
  {
    uint64_t result = v16;
    float v16 = (void *)*v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = v16[1];
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = v16[1];
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }
    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }
    if (v20 != v15) {
      break;
    }
    BOOL v21 = v19 == a2 && v16[2] == *a3;
    int v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

void *sub_234591C8C(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
    if (v6 != v4) {
      goto LABEL_18;
    }
  }
LABEL_19:
  ++result[3];
  return result;
}

void sub_234591D74(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_234591E64(a1, prime);
    }
  }
}

void sub_234591E64(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_2345911DC();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      for (uint64_t i = (void *)*v7; *v7; uint64_t i = (void *)*v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          uint64_t v7 = i;
        }
        else
        {
          size_t v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              uint8x8_t v14 = v13;
              size_t v13 = (void *)*v13;
            }
            while (v13 && i[2] == v13[2]);
            void *v7 = v13;
            *uint8x8_t v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    BOOL v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void *sub_234591FD8(void *a1, void *a2)
{
  int8x8_t v4 = operator new(0x20uLL);
  *int8x8_t v4 = 0;
  unint64_t v5 = (void *)a2[1];
  void v4[2] = *a2;
  void v4[3] = v5;
  unint64_t v6 = v4[2];
  v4[1] = v6;
  uint64_t v7 = sub_234591B34((uint64_t)a1, v6, v4 + 2);
  sub_234591C8C(a1, v4, v7);
  return v4;
}

void sub_234592078(_Unwind_Exception *a1)
{
  sub_23459145C(v2, v1);
  _Unwind_Resume(a1);
}

uint64_t sub_234592094(uint64_t a1)
{
  sub_2345919D8(a1, *(id **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_2345920D0(uint64_t a1, const char *a2, uint64_t a3)
{
  return [NSError errorWithDomain:MEMORY[0x263F087E8] code:a2 userInfo:nil];
}

id sub_2345920EC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v21[1] = *MEMORY[0x263EF8340];
  uint8x8_t v9 = (objc_class *)NSString;
  id v10 = a3;
  id v11 = [v9 alloc];
  uint8x8_t v14 = [v11 initWithFormat:v12 arguments:(uint64_t)v10, (uint64_t)&a9, v13];

  uint64_t v20 = *MEMORY[0x263F08320];
  v21[0] = v14;
  float v16 = [NSDictionary dictionaryWithObjects:v15 forKeys:(uint64_t)v21 count:(uint64_t)&v20];
  unint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:v17 code:0 userInfo:v16];

  return v18;
}

id sub_2345921E8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  void v22[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = a4;
  if (!v7)
  {
    if (a3 <= 199)
    {
      if (a3)
      {
        if (a3 == 100) {
          uint64_t v7 = @"Possible security violation";
        }
      }
      else
      {
        uint64_t v7 = @"Internal DVTInstrumentsUtilities Error";
      }
    }
    else
    {
      switch(a3)
      {
        case 200:
          uint64_t v7 = @"Another application broke a system lock this application requires";
          break;
        case 300:
          uint64_t v7 = @"Internal framework misuse error";
          break;
        case 400:
          uint64_t v7 = @"Operation was denied";
          break;
      }
    }
  }
  if (a5)
  {
    uint64_t v8 = *MEMORY[0x263F08348];
    v21[0] = *MEMORY[0x263F08320];
    v21[1] = v8;
    v22[0] = v7;
    v22[1] = a5;
    uint8x8_t v9 = NSDictionary;
    id v10 = a5;
    [NSDictionary dictionaryWithObjects:v9 forKeys:v11 count:2];
  }
  else
  {
    uint64_t v19 = *MEMORY[0x263F08320];
    uint64_t v20 = v7;
    unint64_t v12 = NSDictionary;
    id v13 = 0;
    [NSDictionary dictionaryWithObjects:v14 forKeys:(v20, v19, 1)];
  unint64_t v15 = };
  int v17 = [MEMORY[0x263F087E8] errorWithDomain:v16 code:@"Instruments Utility Error" userInfo:a3];

  return v17;
}

uint64_t sub_234592370(void *a1, const char *a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v8 = [a1 a2:a3 userInfo:(NSDictionary *)a4];
  unint64_t v12 = [v8 objectForKeyedSubscript:v9 key:@"DVTInstrumentsUtilitiesRecoveryActionKey" defaultValue:v10 defaultValueIsNil:v11];

  int v17 = [a1 performSelector:v13 withObject:v14 withObject:v15 withObject:v16];
  BOOL v21 = [v17 objectForKeyedSubscript:v18 key:v19 defaultValue:v20];

  if (v12) {
    BOOL v26 = v21 == 0;
  }
  else {
    BOOL v26 = 1;
  }
  uint64_t v27 = !v26;
  if (!v26)
  {
    if (a3)
    {
      uint64_t v28 = [v12 copyWithZone:v22];
      uint64_t v29 = (void *)*a3;
      *a3 = v28;
    }
    if (a4)
    {
      uint64_t v30 = [v21 v22:v23 v24:v25];
      uint64_t v31 = (void *)*a4;
      *a4 = v30;
    }
  }

  return v27;
}

uint64_t sub_234592440(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6 = [a1 a2:a3 a4:a4 a5:a5];
  if ([v6 isEqualToString:*MEMORY[0x263F07F70] withOptions:v8 range:v9])
  {
    uint64_t v14 = [a1 v10:v11 v12:v12 v13:v13];

    if (v14 == 516) {
      return 1;
    }
  }
  else
  {
  }
  uint64_t v19 = [a1 v15:v16 v17:v18];
  if ([v19 isEqualToString:*MEMORY[0x263F08438] withOptions:v21 range:v22])
  {
    uint64_t v27 = [a1 v23:v24 v25:v25 v26:v26];

    if (v27 == 17) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

uint64_t sub_2345924F4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6 = [a1 a2:a3 a4:a4 a5:a5];
  if ([v6 isEqualToString:v7])
  {
    uint64_t v14 = [a1 v10:v11 v12:v12 v13:v13];

    if (v14 == 260) {
      return 1;
    }
  }
  else
  {
  }
  uint64_t v19 = [a1 v15:v16 v17:v18];
  if ([v19 isEqualToString:v20 withOptions:*MEMORY[0x263F08438] range:v21 range:v22])
  {
    uint64_t v27 = [a1 v23:v24 v25:v25 v26:v26];

    if (v27 == 2) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

uint64_t sub_234593A14()
{
  return 0xFFFFFFFFLL;
}

id sub_234593A68(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v9 = [a1 pathForResource:v7 ofType:@"plist"];
  if (v9)
  {
    id v10 = objc_alloc(NSDictionary);
    uint64_t v14 = [v10 initWithContentsOfFile:v11 options:v9 error:v12];
    uint64_t v18 = v14;
    if (v14)
    {
      uint64_t v19 = [v14 objectForKey:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v24 = [v19 copyWithZone:v20];
      }
      else {
        uint64_t v24 = 0;
      }
    }
    else
    {
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

uint64_t sub_234593B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](a1, sel_topLevelKeyValueForPlistName_key_, @"version", @"CFBundleVersion", a5);
}

unint64_t XRUnionTimeRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1 != -1 || a2)
  {
    if (a3 != -1 || a4)
    {
      if (a1 > -a2 || a2 == 0) {
        unint64_t v5 = -1;
      }
      else {
        unint64_t v5 = a2 + a1 - 1;
      }
      if (a3 > -a4 || a4 == 0) {
        unint64_t v7 = -1;
      }
      else {
        unint64_t v7 = a4 + a3 - 1;
      }
      if (v5 <= v7) {
        unint64_t v5 = v7;
      }
      if (a1 >= a3) {
        unint64_t v8 = a3;
      }
      else {
        unint64_t v8 = a1;
      }
      if (v8 >= v5) {
        unint64_t v9 = v5;
      }
      else {
        unint64_t v9 = v8;
      }
      if (v8 > v5) {
        unint64_t v5 = v8;
      }
      if (v5 - v9 == -1) {
        return 0;
      }
      else {
        return v9;
      }
    }
    else
    {
      return a1;
    }
  }
  return a3;
}

unint64_t XRMakeInclusiveTimeRange(unint64_t a1, unint64_t a2)
{
  if (a1 >= a2) {
    unint64_t v2 = a2;
  }
  else {
    unint64_t v2 = a1;
  }
  if (a1 <= a2) {
    unint64_t v3 = a2;
  }
  else {
    unint64_t v3 = a1;
  }
  if (v3 - v2 == -1) {
    return 0;
  }
  else {
    return v2;
  }
}

uint64_t XRIntersectionTimeRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1 == -1 && !a2) {
    return -1;
  }
  if (a3 == -1 && !a4) {
    return -1;
  }
  unint64_t v4 = a1 <= a3 ? a3 : a1;
  BOOL v5 = a1 > -a2 || a2 == 0;
  unint64_t v6 = v5 ? -1 : a2 + a1 - 1;
  BOOL v7 = a3 > -a4 || a4 == 0;
  unint64_t v8 = v7 ? -1 : a4 + a3 - 1;
  if (v6 >= v8) {
    unint64_t v6 = v8;
  }
  BOOL v9 = v6 >= v4;
  unint64_t v10 = v6 - v4;
  if (!v9) {
    return -1;
  }
  if (v10 == -1) {
    return 0;
  }
  return v4;
}

uint64_t XRMakeDurationTimeRange(unint64_t a1, uint64_t a2)
{
  BOOL v2 = __CFADD__(a2, a1);
  unint64_t v3 = a1 + a2 - 1;
  if (a1 >= v3) {
    uint64_t v4 = a1 + a2 - 1;
  }
  else {
    uint64_t v4 = a1;
  }
  if (a1 > v3) {
    unint64_t v3 = a1;
  }
  if (v3 - v4 == -1) {
    uint64_t v4 = 0;
  }
  if (v2) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = v4;
  }
  if (a2) {
    return v5;
  }
  else {
    return -1;
  }
}

uint64_t XRDisplayStringFromTimeRange(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 > -(uint64_t)a2 || a2 == 0) {
    return [NSString stringWithFormat:@"[%llu - %llu]", a4, a5, a1, -1];
  }
  else {
    return [NSString stringWithFormat:@"[%llu - %llu]", a4, a5, a1, &a2[a1 - 1]];
  }
}

uint64_t XRStringFromTimeRange(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [NSString stringWithFormat:@"%llu %llu", a4, a5, a1, a2];
}

uint64_t XRTimeRangeFromString(void *a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  id v1 = a1;
  uint64_t v5 = (const char *)[v1 cStringUsingEncoding:v2];
  sscanf(v5, "%llu %llu", &v7, &v8);
  return v7;
}

id sub_234593DA8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7[0] = a3;
  v7[1] = a4;
  uint64_t v5 = [MEMORY[0x263F08D40] valueWithBytes:a2 objCType:@encode(XRTimeRange)];

  return v5;
}

uint64_t sub_234593DF4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = 0;
  v6[1] = 0;
  [a1 getValue:a2 withValue:(uint64_t)v6 forKey:a4 withKey:a5];
  return v6[0];
}

id sub_234593E20(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v15[2] = *MEMORY[0x263EF8340];
  v14[0] = @"start";
  unint64_t v6 = [NSNumber numberWithUnsignedLongLong:a2 a3:a4 a5:a5];
  v14[1] = @"length";
  v15[0] = v6;
  unint64_t v10 = [NSNumber numberWithUnsignedLongLong:a4];
  v15[1] = v10;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v11 forKeys:v15 count:v14];

  return v12;
}

uint64_t sub_234593EFC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6 = [a1 objectForKeyedSubscript:a2 key:@"start" defaultValue:a4 defaultValueType:a5];
  unint64_t v10 = [a1 objectForKeyedSubscript:v7 key:v8 value:v9];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v15 = [v6 v11:v12:v13:v14];
    if (!v10) {
      goto LABEL_23;
    }
  }
  else
  {
    unint64_t v15 = 0;
    if (!v10)
    {
LABEL_23:
      uint64_t v25 = -1;
      goto LABEL_24;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_23;
  }
  uint64_t v20 = [v10 v16:v17 v18:v19];
  BOOL v21 = __CFADD__(v20, v15);
  unint64_t v22 = v15 + v20 - 1;
  if (v15 >= v22) {
    uint64_t v23 = v15 + v20 - 1;
  }
  else {
    uint64_t v23 = v15;
  }
  if (v15 > v22) {
    unint64_t v22 = v15;
  }
  if (v22 - v23 == -1) {
    uint64_t v23 = 0;
  }
  if (v21) {
    uint64_t v24 = v15;
  }
  else {
    uint64_t v24 = v23;
  }
  if (v20) {
    uint64_t v25 = v24;
  }
  else {
    uint64_t v25 = -1;
  }
LABEL_24:

  return v25;
}

void sub_234594098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234594134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23459429C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2345946D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234594780(uint64_t a1)
{
}

void sub_2345947DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23459486C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2345949CC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_234594A00(void *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v1 = a1;
  sub_234595A28((void *)v1 + 3);
  [v1 setStrongBlockAdapterToken:v2 withToken:v3 withCompletion:v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [*((void **)v1 + 2) keyEnumeratorWithOptions:v5 usingBlock:v6 context:v7];
  uint64_t v14 = [v9 v10:v11 v12:v13];

  uint64_t v16 = [v14 countByEnumeratingWithState:v15 objects:v20 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        sub_2345950C4(*((void **)v1 + 2), *(void **)(*((void *)&v20 + 1) + 8 * v18++), v1);
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:v19 objects:&v20 count:16];
    }
    while (v16);
  }
}

void sub_234594B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234594BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  unint64_t v10 = v9;

  a9.super_class = (Class)XRLazyKVOAdapter;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_234594CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234594D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234594F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_234594F6C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a2;
  uint64_t v8 = [v5 countByEnumeratingWithState:v6 objects:&v13 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(void **)(a1 + 32) addObserver:v7 forKeyPath:*(void *)(a1 + 40) options:*(void *)(*((void *)&v13 + 1) + 8 * v10++) context:a3];
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:v7 objects:&v13 count:16];
    }
    while (v8);
  }

  [*(void **)(a1 + 48) setObject:v11 forIntegerKey:(uint64_t)v5];
}

void sub_234595088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2345950C4(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v10 = a3;
  if (v6)
  {
    uint64_t v11 = [v5 objectForKey:v6];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    long long v21 = sub_2345955B8;
    long long v22 = &unk_264BF21F0;
    id v12 = v6;
    id v23 = v12;
    id v24 = v10;
    [v11 enumerateObjectsAndIntegerKeys:v13 usingBlock:v14, v15];
    [v5 removeObjectForKey:v16];
  }
}

void sub_2345951C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_2345952EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2345954B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v4);
  _Unwind_Resume(a1);
}

void sub_2345955B8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a2;
  uint64_t v8 = [v5 countByEnumeratingWithState:v6 objects:&v11 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(void **)(a1 + 32) removeObserver:v7 forKeyPath:*(void *)(a1 + 40) context:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:v7 objects:&v11 count:16];
    }
    while (v8);
  }
}

void sub_2345956C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_2345956E4(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v4 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= *(void *)&v2) {
      unint64_t v7 = v5 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v7 = v5 & (*(void *)&v2 - 1);
  }
  uint64_t v8 = *(void **)(*a1 + 8 * v7);
  if (!v8) {
    return 0;
  }
  uint64_t result = (void *)*v8;
  if (*v8)
  {
    do
    {
      unint64_t v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == *a2) {
          return result;
        }
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(void *)&v2) {
            v10 %= *(void *)&v2;
          }
        }
        else
        {
          v10 &= *(void *)&v2 - 1;
        }
        if (v10 != v7) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void sub_2345957D0(void *a1, void *a2, void *a3)
{
  uint64_t v6 = a1[1];
  if (!v6) {
    goto LABEL_9;
  }
  for (uint64_t i = 0; i != v6; *(void *)(*a1 + 8 * i++) = 0)
    ;
  uint64_t v8 = (void *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      v8[2] = a2[2];
      uint64_t v9 = (void *)*v8;
      sub_2345958C8(a1, v8);
      a2 = (void *)*a2;
      uint64_t v8 = v9;
      if (!v9) {
        goto LABEL_9;
      }
    }
    do
    {
      unint64_t v10 = (void *)*v8;
      operator delete(v8);
      uint64_t v8 = v10;
    }
    while (v10);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      sub_234595948(a1, a2 + 2);
      a2 = (void *)*a2;
    }
  }
}

void sub_234595894(void *a1)
{
  __cxa_begin_catch(a1);
  do
  {
    int8x8_t v2 = (void *)*v1;
    operator delete(v1);
    id v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_2345958B4(_Unwind_Exception *a1)
{
}

void *sub_2345958C8(void *a1, void *a2)
{
  unint64_t v4 = a2 + 2;
  unint64_t v5 = a2[2];
  unint64_t v6 = HIDWORD(v5);
  unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * v5) + 8) ^ HIDWORD(v5));
  unint64_t v8 = 0x9DDFEA08EB382D69
     * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
  a2[1] = v8;
  uint64_t v9 = sub_234591B34((uint64_t)a1, v8, v4);
  sub_234591C8C(a1, a2, v9);
  return a2;
}

void *sub_234595948(void *a1, unint64_t *a2)
{
  sub_2345959A0((uint64_t)a1, a2, (uint64_t)&v4);
  return sub_2345958C8(a1, v4);
}

void sub_234595984(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_2345959A0@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 16;
  uint64_t result = operator new(0x18uLL);
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v5;
  unint64_t v7 = *a2;
  result[2] = *a2;
  *(unsigned char *)(a3 + 16) = 1;
  unint64_t v8 = HIDWORD(v7);
  unint64_t v9 = 0x9DDFEA08EB382D69 * (((8 * v7) + 8) ^ HIDWORD(v7));
  void *result = 0;
  result[1] = 0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69 * (v8 ^ (v9 >> 47) ^ v9)) ^ ((0x9DDFEA08EB382D69 * (v8 ^ (v9 >> 47) ^ v9)) >> 47));
  return result;
}

void *sub_234595A28(void *result)
{
  if (result[3])
  {
    id v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      do
      {
        int8x8_t v2 = (void *)*result;
        operator delete(result);
        uint64_t result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void *sub_234595A90(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v7 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
    }
    else
    {
      unint64_t v3 = v8 & (v9 - 1);
    }
    long long v11 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      for (uint64_t i = *v11; i; uint64_t i = (void *)*i)
      {
        unint64_t v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == *a2) {
            return i;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9) {
              v13 %= v9;
            }
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x18uLL);
  *uint64_t i = 0;
  i[1] = v8;
  i[2] = *a3;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    BOOL v16 = 1;
    if (v9 >= 3) {
      BOOL v16 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v9);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    sub_234591210(a1, v19);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v20 = *(void *)a1;
  long long v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    *uint64_t i = *v21;
LABEL_38:
    *long long v21 = i;
    goto LABEL_39;
  }
  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v20 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v22 = *(void *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9) {
        v22 %= v9;
      }
    }
    else
    {
      v22 &= v9 - 1;
    }
    long long v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_234595CD0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_234595CE4(uint64_t a1)
{
  int8x8_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      int8x8_t v2 = v3;
    }
    while (v3);
  }
  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

id sub_234595D30(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (([a1 a2:a3 a4:a5] <= 0x100000000))
  {
    unint64_t v7 = (unsigned __int8 *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
    id v8 = a1;
    unint64_t v13 = (const void *)[v8 v9:v10 v11:v12];
    CC_LONG v18 = [v8 lengthWithOptions:v14 range:v15];
    CC_SHA256(v13, v18, v7);
    id v19 = objc_alloc(MEMORY[0x263EFF8F8]);
    long long v21 = [v19 initWithBytesNoCopy:v20 length:32 freeWhenDone:1];
    unint64_t v6 = [v21 base64EncodedStringWithOptions:v22];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

id sub_234595E04(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v3 = a3;
    unint64_t v4 = objc_opt_new();
    [v4 setGroup:v5 withGroupID:(uint64_t)v3 withGroupName:v6 withGroupType:v7];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

id sub_234595E68()
{
  uint64_t v0 = objc_opt_new();
  [v0 setStopWhenDone:v1];

  return v0;
}

void sub_234595EB0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_234595F44;
  v9[3] = &unk_264BF0D90;
  id v10 = v4;
  uint64_t v11 = a1;
  id v5 = v4;
  [a1 performBlock:v6 afterDelay:v9 usingDispatchQueue:v7 withContext:v8];
}

uint64_t sub_234595F44(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  [*(void **)(a1 + 32) hello:a2 a3:a4 a5:a5];
  [*(void **)(a1 + 32) goodbye:v6, v7, v8, v9];
  uint64_t v14 = [*(void **)(a1 + 32) performSelector:v10 withObject:v11 withObject:v12 withObject:v13];
  if (v14)
  {
    uint64_t v23 = (char *)v14;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v23 _stopWhenDone:v23 withTransitionContext:v15 completion:v16])
      {
        CFRunLoop = (__CFRunLoop *)[*(void **)(a1 + 40) _getCFRunLoop:v23 mode:v18 beforeDate:v19];
        CFRunLoopStop(CFRunLoop);
      }
    }
  }

  return MEMORY[0x270F9A758]();
}

void sub_234595FE4(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v12 = [v4 v5:v6 v7:v8];
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v17 = [v12 v9:v13 v10:v11];
    if (v17)
    {
      uint64_t v18 = dispatch_get_global_queue(17, 0);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = sub_234596110;
      v19[3] = &unk_264BF0D90;
      v19[4] = a1;
      id v20 = v4;
      dispatch_group_notify(v17, v18, v19);
    }
    else
    {
      [a1 _scheduleAgentVisit:v14 withIdentifier:(uint64_t)v4 withOptions:v15 withCompletion:v16];
    }
  }
  else
  {
    [a1 _scheduleAgentVisit:v9 withIdentifier:(uint64_t)v4 withOptions:v10 withCompletion:v11];
  }
}

uint64_t sub_234596110(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(void **)(a1 + 32) scheduleAgentVisit:a2 withCompletion:a4];
}

id sub_23459614C()
{
  if (qword_2687AA328[0] != -1) {
    dispatch_once(qword_2687AA328, &unk_26E752650);
  }
  uint64_t v0 = (void *)qword_2687A9F90;

  return v0;
}

void sub_2345961A0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = [MEMORY[0x263EFFA40] a2:a3 a4:a4 a5:a5];
  int v9 = [v5 XREnableInternalSignposts:v7 withTransitionContext:v8];

  if (v9)
  {
    qword_2687A9F90 = (uint64_t)os_log_create("com.apple.dt.utilities", "Frame Scheduler");
    MEMORY[0x270F9A758]();
  }
}

void sub_234596224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234596234(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 8);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = sub_2345962CC;
  v6[3] = &unk_264BF2218;
  id v7 = v3;
  uint64_t v8 = a1;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t sub_2345962CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2345962DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 8);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = sub_234596374;
  v6[3] = &unk_264BF2218;
  id v7 = v3;
  uint64_t v8 = a1;
  id v5 = v3;
  dispatch_barrier_async(v4, v6);
}

uint64_t sub_234596374(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 40) + 8));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

void sub_2345963BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 8))
  {
    dispatch_group_enter(v3);
    id v5 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_234596478;
    block[3] = &unk_264BF0CD0;
    uint64_t v8 = v4;
    dispatch_barrier_async(v5, block);
    uint64_t v6 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;
  }
}

void sub_234596478(uint64_t a1)
{
}

uint64_t sub_234596480(uint64_t a1, int a2)
{
  *(void *)(a1 + 8) = 0;
  if (a2 == 1) {
    id v3 = MEMORY[0x263EF83A8];
  }
  else {
    id v3 = 0;
  }
  id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, -15);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.dt.frame.inactivity", v4);
  uint64_t v6 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v5;

  return a1;
}

BOOL sub_2345964F0(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (*(unsigned char *)a1)
  {
    BOOL v3 = 0;
  }
  else if (*(_DWORD *)(a1 + 8))
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = *(_DWORD *)(a1 + 12) != 0;
  }
  os_unfair_lock_unlock(v2);
  return v3;
}

uint64_t sub_234596554(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (*(unsigned char *)a1 || (int v4 = *(_DWORD *)(a1 + 4), v4 == -1))
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    *(_DWORD *)(a1 + 4) = v4 + 1;
  }
  os_unfair_lock_unlock(v2);
  return v3;
}

uint64_t sub_2345965BC(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  int v3 = *(_DWORD *)(a1 + 8);
  if (!v3)
  {
    BOOL v4 = *(_DWORD *)(a1 + 12) == 0;
    BOOL v6 = *(unsigned char *)(a1 + 3) == 0;
    BOOL v5 = v4;
    if (*(unsigned char *)a1) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v4 = 0;
  BOOL v5 = 0;
  BOOL v6 = *(unsigned char *)(a1 + 3) == 0;
  if (v3 != -1 && *(unsigned char *)a1 == 0)
  {
LABEL_7:
    *(_DWORD *)(a1 + 8) = v3 + 1;
    BOOL v5 = v4;
  }
LABEL_8:
  os_unfair_lock_unlock(v2);
  return v6 & v5;
}

BOOL sub_23459665C(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  int v3 = *(_DWORD *)(a1 + 8);
  if (v3) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = *(_DWORD *)(a1 + 12) == 0;
  }
  int v5 = *(_DWORD *)(a1 + 4);
  if (!v5) {
    sub_23459C000();
  }
  int v6 = *(unsigned __int8 *)(a1 + 3);
  if (*(unsigned char *)(a1 + 1))
  {
    *(_DWORD *)(a1 + 4) = v5 - 1;
  }
  else
  {
    if (v3 != -1 && !*(unsigned char *)a1) {
      *(_DWORD *)(a1 + 8) = v3 + 1;
    }
    *(unsigned char *)(a1 + 1) = 1;
  }
  os_unfair_lock_unlock(v2);
  return !v6 && v4;
}

uint64_t sub_234596700(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  int v3 = *(_DWORD *)(a1 + 4);
  if (!v3) {
    sub_23459C02C();
  }
  *(_DWORD *)(a1 + 4) = v3 - 1;
  if (!*(unsigned char *)(a1 + 2)) {
    *(unsigned char *)(a1 + 2) = 1;
  }
  os_unfair_lock_unlock(v2);
  return 0;
}

BOOL sub_23459675C(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  int v3 = *(_DWORD *)(a1 + 8);
  if (*(unsigned char *)(a1 + 1))
  {
    if (!v3) {
      sub_23459C058();
    }
    --v3;
    --*(_DWORD *)(a1 + 4);
    *(_DWORD *)(a1 + 8) = v3;
    *(unsigned char *)(a1 + 1) = 0;
  }
  *(unsigned char *)(a1 + 3) = 1;
  if (v3) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = *(_DWORD *)(a1 + 12) == 0;
  }
  os_unfair_lock_unlock(v2);
  return v4;
}

uint64_t sub_2345967DC(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  uint64_t v3 = *(unsigned __int8 *)(a1 + 2);
  if (*(unsigned char *)(a1 + 2)) {
    *(unsigned char *)(a1 + 2) = 0;
  }
  os_unfair_lock_unlock(v2);
  return v3;
}

uint64_t sub_234596828(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (*(unsigned char *)a1 || (v5 = *(_DWORD *)(a1 + 12), v5 == -1) || (int v6 = *(_DWORD *)(a1 + 4)) == 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    int v7 = *(_DWORD *)(a1 + 8);
    if (!v7) {
      sub_23459C084();
    }
    *(_DWORD *)(a1 + 4) = v6 - 1;
    *(_DWORD *)(a1 + 8) = v7 - 1;
    *(_DWORD *)(a1 + 12) = v5 + 1;
    uint64_t v3 = 1;
  }
  os_unfair_lock_unlock(v2);
  return v3;
}

BOOL sub_2345968A8(os_unfair_lock_s *a1)
{
  uint64_t v2 = a1 + 4;
  os_unfair_lock_lock(a1 + 4);
  uint32_t os_unfair_lock_opaque = a1[3]._os_unfair_lock_opaque;
  v5 = (!os_unfair_lock_opaque || (uint32_t v4 = os_unfair_lock_opaque - 1, (a1[3]._os_unfair_lock_opaque = v4) == 0))
    && !a1[2]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v2);
  return v5;
}

uint64_t sub_234596908(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  uint64_t v3 = 1;
  if (!*(unsigned char *)a1)
  {
    *(unsigned char *)a1 = 1;
    uint64_t v3 = 0;
  }
  os_unfair_lock_unlock(v2);
  return v3;
}

void sub_23459695C(uint64_t a1)
{
  unsigned __int8 explicit = atomic_load_explicit((atomic_uchar *volatile)(*(void *)a1 + 32), memory_order_acquire);
  uint64_t v3 = *(os_unfair_lock_s **)a1;
  if ((explicit & 1) == 0)
  {
    int v4 = sub_234596828(*(void *)a1);
    BOOL v5 = *(void (***)(void, void))(a1 + 8);
    if (v4)
    {
      v5[2](v5, *(void *)a1 + 32);
      if (sub_2345968A8(*(os_unfair_lock_s **)a1))
      {
        uint64_t v6 = *(void *)a1;
        int v7 = *(std::__shared_weak_count **)(*(void *)a1 + 48);
        if (v7)
        {
          uint64_t v8 = std::__shared_weak_count::lock(v7);
          if (v8)
          {
            int v9 = v8;
            uint64_t v10 = *(void *)(v6 + 40);
            if (v10)
            {
              uint64_t v11 = *(void *)(v10 + 32);
              if (v11) {
                sub_234597F8C(v11);
              }
            }
            sub_234578B24(v9);
          }
        }
      }
    }
    else
    {
      *(void *)(a1 + 8) = 0;
    }
    JUMPOUT(0x237DC08F0);
  }
  uint64_t v12 = v3 + 4;
  os_unfair_lock_lock(v3 + 4);
  int os_unfair_lock_opaque_low = LOBYTE(v3->_os_unfair_lock_opaque);
  os_unfair_lock_unlock(v12);
  if (os_unfair_lock_opaque_low)
  {
    uint64_t v14 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;
  }
  else
  {
    uint64_t v15 = *(NSObject **)(*(void *)a1 + 24);
    dispatch_async_f(v15, (void *)a1, (dispatch_function_t)sub_23459695C);
  }
}

void sub_234596AB8(_Unwind_Exception *a1)
{
  sub_234578B24(v1);
  _Unwind_Resume(a1);
}

void sub_234596ACC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!sub_234596554(a1)) {
    operator new();
  }
}

void sub_234596BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  sub_234578B24(v10);

  _Unwind_Resume(a1);
}

void sub_234596C08(uint64_t a1, void *a2)
{
}

void sub_234596C10(uint64_t a1)
{
  if (!sub_234596554(a1) && sub_23459665C(a1))
  {
    uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
    if (v2)
    {
      id v3 = std::__shared_weak_count::lock(v2);
      if (v3)
      {
        int v4 = v3;
        uint64_t v5 = *(void *)(a1 + 40);
        if (v5)
        {
          uint64_t v6 = *(void *)(v5 + 32);
          if (v6) {
            sub_234597F8C(v6);
          }
        }
        sub_234578B24(v4);
      }
    }
  }
}

void sub_234596C8C(_Unwind_Exception *a1)
{
  sub_234578B24(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_234596CA0(uint64_t a1)
{
  uint64_t result = sub_234596554(a1);
  if (!result)
  {
    return sub_234596700(a1);
  }
  return result;
}

uint64_t sub_234596CE8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  [*(void **)(a1 + 56) _startingMajorFrame:a2, a3, a4, a5];
  uint64_t result = sub_2345967DC(a1);
  if (result)
  {
    uint64_t result = sub_234596554(a1);
    if (!result)
    {
      return sub_23459665C(a1);
    }
  }
  return result;
}

void sub_234596D48(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!sub_234596554(a1))
  {
    if (sub_2345965BC(a1))
    {
      int v4 = *(std::__shared_weak_count **)(a1 + 48);
      if (v4)
      {
        uint64_t v5 = std::__shared_weak_count::lock(v4);
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)(a1 + 40);
          if (v7)
          {
            uint64_t v8 = *(void *)(v7 + 32);
            if (v8) {
              sub_234597F8C(v8);
            }
            int v9 = *(NSObject **)(a1 + 24);
            v17[0] = MEMORY[0x263EF8330];
            v17[1] = 3221225472;
            v17[2] = sub_234596F8C;
            v17[3] = &unk_264BF2218;
            uint64_t v19 = a1;
            id v18 = v3;
            dispatch_sync(v9, v17);
            if (sub_2345968A8((os_unfair_lock_s *)a1))
            {
              uint64_t v10 = *(void *)(v7 + 32);
              if (v10) {
                sub_234597F8C(v10);
              }
            }
          }
          sub_234578B24(v6);
        }
      }
    }
    else
    {
      uint64_t v11 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_234596F40;
      block[3] = &unk_264BF2218;
      uint64_t v22 = a1;
      id v21 = v3;
      dispatch_sync(v11, block);
      if (sub_2345968A8((os_unfair_lock_s *)a1))
      {
        uint64_t v12 = *(std::__shared_weak_count **)(a1 + 48);
        if (v12)
        {
          uint64_t v13 = std::__shared_weak_count::lock(v12);
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)(a1 + 40);
            if (v15)
            {
              uint64_t v16 = *(void *)(v15 + 32);
              if (v16) {
                sub_234597F8C(v16);
              }
            }
            sub_234578B24(v14);
          }
        }
      }
    }
  }
}

void sub_234596F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  sub_234578B24(v20);

  _Unwind_Resume(a1);
}

uint64_t sub_234596F40(uint64_t a1)
{
  sub_234596828(*(void *)(a1 + 40));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t sub_234596F8C(uint64_t a1)
{
  sub_234596828(*(void *)(a1 + 40));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t sub_234596FD8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 56) = a2;
  return result;
}

void sub_234596FE0(uint64_t a1, void *a2)
{
}

void sub_234596FEC(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = v5;
  if (*(unsigned char *)(a1 + 33)) {
    __assert_rtn("makeActive", "XRFrameScheduler_Private.mm", 506, "!_activated");
  }
  atomic_store(0, (unsigned __int8 *)(a1 + 32));
  dispatch_group_enter(v5);
  uint64_t v7 = *(void *)(a1 + 64);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2345970EC;
  v9[3] = &unk_264BF2240;
  char v12 = a2;
  uint64_t v10 = v6;
  uint64_t v11 = a1;
  uint64_t v8 = v6;
  sub_2345962DC(v7, v9);
  *(unsigned char *)(a1 + 33) = 1;
}

void sub_2345970DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2345970EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 40);
  sub_234597138(v6, (const char *)*(unsigned __int8 *)(a1 + 48), a3, a4, a5);
  dispatch_resume(*(dispatch_object_t *)(v6 + 24));
  uint64_t v7 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v7);
}

void sub_234597138(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  [*(void **)(a1 + 56) _acquiredMinorFrame:a2 withTransitionContext:a4 completion:a5];
  if (sub_23459675C(a1))
  {
    uint64_t v6 = *(std::__shared_weak_count **)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = std::__shared_weak_count::lock(v6);
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)(a1 + 40);
        if (v9)
        {
          uint64_t v10 = *(void *)(v9 + 32);
          if (v10) {
            sub_234597F8C(v10);
          }
        }
        sub_234578B24(v8);
      }
    }
  }
}

void sub_2345971B8(_Unwind_Exception *a1)
{
  sub_234578B24(v1);
  _Unwind_Resume(a1);
}

void sub_2345971CC(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = a3;
  if (!*(unsigned char *)(a1 + 33)) {
    __assert_rtn("makeInactive", "XRFrameScheduler_Private.mm", 518, "_activated");
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  *(unsigned char *)(a1 + 3) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  dispatch_group_enter(v5);
  uint64_t v6 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2345972E4;
  block[3] = &unk_264BF2240;
  char v11 = a2;
  uint64_t v9 = v5;
  uint64_t v10 = a1;
  uint64_t v7 = v5;
  dispatch_barrier_async(v6, block);
  atomic_store(1u, (unsigned __int8 *)(a1 + 32));
  *(unsigned char *)(a1 + 33) = 0;
}

void sub_2345972D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2345972E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  dispatch_suspend(*(dispatch_object_t *)(v2 + 24));
  [*(void **)(v2 + 56) performSelector:v3 withObject:*(unsigned __int8 *)(a1 + 48) withObject:v4 withObject:v5];
  dispatch_resume(*(dispatch_object_t *)(*(void *)(v2 + 64) + 8));
  uint64_t v6 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v6);
}

void sub_23459733C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = v3;
  *(void *)(a1 + 72) = v2;
  if (v4) {
    sub_234578B24(v4);
  }
}

void sub_234597368(uint64_t a1)
{
  if (!sub_234596908(a1))
  {
    uint64_t v2 = dispatch_group_create();
    dispatch_resume(*(dispatch_object_t *)(a1 + 24));
    dispatch_group_enter(v2);
    uint64_t v3 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = sub_234597448;
    v6[3] = &unk_264BF2268;
    uint64_t v7 = v2;
    uint64_t v8 = a1;
    uint64_t v4 = v2;
    dispatch_barrier_async(v3, v6);
    sub_2345963BC(*(void *)(a1 + 64), v4);
    dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v5 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

void sub_234597448(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  [*(void **)(*(void *)(a1 + 40) + 56) a2:a3:a4:a5];
  uint64_t v6 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v6);
}

uint64_t sub_234597488(uint64_t a1, void *a2, char a3, int a4, dispatch_qos_class_t qos_class)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(_WORD *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 34) = a3;
  uint64_t v7 = a2[1];
  *(void *)(a1 + 40) = *a2;
  *(void *)(a1 + 48) = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 16), 1uLL, memory_order_relaxed);
  }
  if (a4 == 1) {
    uint64_t v8 = MEMORY[0x263EF83A8];
  }
  else {
    uint64_t v8 = 0;
  }
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  uint64_t v9 = dispatch_queue_attr_make_with_qos_class(v8, qos_class, 0);
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.dt.frame.activity", v9);
  char v11 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v10;

  dispatch_suspend(*(dispatch_object_t *)(a1 + 24));
  char v12 = operator new(0x28uLL);
  v12[1] = 0;
  int v12[2] = 0;
  *char v12 = &unk_26E7523D0;
  sub_234596480((uint64_t)(v12 + 3), a4);
  uint64_t v13 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = v12 + 3;
  *(void *)(a1 + 72) = v12;
  if (v13) {
    sub_234578B24(v13);
  }

  return a1;
}

void sub_23459758C(_Unwind_Exception *a1)
{
  uint64_t v4 = *(std::__shared_weak_count **)(v1 + 72);
  if (v4) {
    sub_234578B24(v4);
  }
  uint64_t v5 = *(std::__shared_weak_count **)(v1 + 48);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_2345975C0(uint64_t a1)
{
  sub_234597368(a1);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  if (v2) {
    sub_234578B24(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }

  return a1;
}

uint64_t sub_23459760C(uint64_t **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (*a1 != v3)
  {
    while (!sub_2345964F0(*v2))
    {
      v2 += 2;
      if (v2 == v3)
      {
        uint64_t v2 = v3;
        break;
      }
    }
    if (v2 != a1[1]) {
      return *v2;
    }
    uint64_t v2 = a1[1];
  }
  uint64_t v5 = a1[3];
  if (v5 == v2) {
    return 0;
  }
  uint64_t v6 = *v5;
  if (*(unsigned char *)(v6 + 34)) {
    return v6;
  }
  else {
    return 0;
  }
}

uint64_t sub_234597698(uint64_t **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (*a1 == v3)
  {
    uint64_t v5 = a1 + 3;
    uint64_t v4 = a1[3];
    if (v4 == v2) {
      goto LABEL_17;
    }
  }
  else
  {
    while (!sub_2345964F0(*v2))
    {
      v2 += 2;
      if (v2 == v3)
      {
        uint64_t v2 = v3;
        break;
      }
    }
    uint64_t v6 = a1[3];
    uint64_t v5 = a1 + 3;
    uint64_t v4 = v6;
    uint64_t v7 = *(v5 - 2);
    if (v2 != v7)
    {
      uint64_t v8 = *v2;
      if (v4 != v7)
      {
        BOOL v9 = v8 != *v4;
        int v10 = *(unsigned __int8 *)(*v4 + 33);
        BOOL v11 = v10 == 0;
        BOOL v12 = v10 != 0;
        LOBYTE(v13) = v11 && v8 != *v4;
        int v14 = 1;
        goto LABEL_13;
      }
      BOOL v12 = 0;
      BOOL v13 = v8 != 0;
      int v15 = 1;
      int v14 = 1;
      BOOL v9 = v13;
LABEL_19:
      int v16 = 1;
      goto LABEL_20;
    }
    if (v4 == v7)
    {
LABEL_17:
      LOBYTE(v13) = 0;
      int v14 = 0;
      BOOL v9 = 0;
      BOOL v12 = 0;
      int v15 = 1;
      goto LABEL_19;
    }
  }
  LOBYTE(v13) = 0;
  int v14 = 0;
  BOOL v9 = *v4 != 0;
  BOOL v12 = *(unsigned __int8 *)(*v4 + 33) != 0;
LABEL_13:
  int v15 = 0;
  if (*(unsigned char *)(*v4 + 34)) {
    int v16 = 1;
  }
  else {
    int v16 = v14;
  }
LABEL_20:
  int v17 = v16 & ((v15 | v14 & v9) ^ 1);
  int v18 = v17 & !v12;
  if (v13 || v18)
  {
    if ((v18 & 1) == 0)
    {
      if (v12) {
        sub_23459C0DC();
      }
      uint64_t *v5 = v2;
      uint64_t v4 = v2;
    }
    if (*(unsigned char *)(*v4 + 33)) {
      sub_23459C0B0();
    }
    return 3;
  }
  else if ((v14 & v9 & v12) == 1)
  {
    if (!*(unsigned char *)(*v4 + 33)) {
      sub_23459C108();
    }
    return 1;
  }
  else if ((v12 & v17) == 1)
  {
    if (!*(unsigned char *)(*v4 + 33)) {
      sub_23459C134();
    }
    return 2;
  }
  else if ((v16 | !v12))
  {
    if (v14) {
      sub_23459C160();
    }
    if (v12) {
      sub_23459C18C();
    }
    return 0;
  }
  else
  {
    if (!*(unsigned char *)(*v4 + 33)) {
      sub_23459C1B8();
    }
    return 4;
  }
}

void sub_234597870(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(uint64_t **)(a1 + 24);
  id v7 = v5;
  if (v6 == *(uint64_t **)(a1 + 8)) {
    __assert_rtn("activateSelectedManager", "XRFrameScheduler_Private.mm", 713, "_nextReadyManager != _activityManagers.end()");
  }
  sub_234596FEC(*v6, a2, v5);
}

void sub_2345978FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234597914(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  id v5 = *(uint64_t **)(a1 + 24);
  if (v5 != *(uint64_t **)(a1 + 8) && *(unsigned char *)(*v5 + 33)) {
    sub_2345971CC(*v5, a2, v6);
  }
}

void sub_234597984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void **sub_234597998(uint64_t *a1, long long *a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  id v7 = *(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = ((uint64_t)v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_2345995A8();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v18[4] = result;
    int v14 = (char *)sub_234599650((uint64_t)result, v13);
    int v15 = &v14[16 * v10];
    v18[0] = v14;
    v18[1] = v15;
    v18[3] = &v14[16 * v16];
    long long v17 = *a2;
    *(_OWORD *)int v15 = *a2;
    if (*((void *)&v17 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v17 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    v18[2] = v15 + 16;
    sub_234599530(a1, v18);
    BOOL v9 = (void *)a1[1];
    uint64_t result = sub_234599798(v18);
  }
  else
  {
    void *v7 = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    v7[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    BOOL v9 = v7 + 2;
    a1[1] = (uint64_t)(v7 + 2);
  }
  a1[1] = (uint64_t)v9;
  return result;
}

void sub_234597AA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_234599798((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_234597AB4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t **)result;
  uint64_t v3 = *(uint64_t **)(result + 8);
  if (*(uint64_t **)result != v3)
  {
    do
    {
      uint64_t result = sub_2345964F0(*v2);
      if (result) {
        uint64_t result = [*(void **)(*v2 + 56) performSelector:v5 withObject:a2 withObject:v6 withObject:v7];
      }
      v2 += 2;
    }
    while (v2 != v3);
  }
  return result;
}

uint64_t sub_234597B10(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = *(uint64_t **)(a3 + 24);
  if (v5 == *(uint64_t **)(a3 + 8))
  {
    uint64_t v11 = *(void *)(result + 8);
    uint64_t v12 = *(void *)(result + 24);
    if (v12 != v11 && *(unsigned char *)(*(void *)v12 + 33)) {
      sub_23459C1E4();
    }
    *(void *)(result + 24) = v11;
  }
  else
  {
    uint64_t v6 = *(uint64_t **)result;
    uint64_t v7 = *(uint64_t **)(result + 8);
    if (*(uint64_t **)result != v7)
    {
      uint64_t v8 = *v5;
      while (*v6 != v8)
      {
        v6 += 2;
        if (v6 == v7)
        {
          uint64_t v6 = *(uint64_t **)(result + 8);
          break;
        }
      }
    }
    *(void *)(result + 24) = v6;
    if (v6 == v7) {
      sub_23459C210();
    }
    uint64_t v9 = *v6;
    if (!*(unsigned char *)(v9 + 34)) {
      sub_23459C23C();
    }
    uint64_t v10 = *(void *)(v9 + 56);
    return MEMORY[0x270F9A6D0](v10, sel__extendingMinorFrame_, a2, a4, a5);
  }
  return result;
}

void sub_234597BC4(uint64_t a1, unsigned int a2, void *a3)
{
  unint64_t v5 = a3;
  uint64_t v6 = *(void *)(a1 + 8);
  if (a2 < (unint64_t)((*(void *)(a1 + 16) - v6) >> 5))
  {
    uint64_t v7 = v5;
    uint64_t v8 = (uint64_t **)(v6 + 32 * a2);
    int v9 = sub_234597698(v8);
    switch(v9)
    {
      case 1:
        goto LABEL_5;
      case 3:
        sub_234597870((uint64_t)v8, a2, v7);
        break;
      case 4:
LABEL_5:
        dispatch_group_enter(v7);
        dispatch_group_t v10 = dispatch_group_create();
        sub_234597914((uint64_t)v8, a2, v10);
        uint64_t v11 = dispatch_get_global_queue(33, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_234597D20;
        block[3] = &unk_264BF2240;
        uint64_t v14 = a1;
        char v15 = a2;
        unint64_t v13 = v7;
        dispatch_group_notify(v10, v11, block);

        break;
    }

    return;
  }
  __break(1u);
}

void sub_234597D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234597D20(uint64_t a1)
{
  sub_234597BC4(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  uint64_t v2 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v2);
}

void sub_234597D64(uint64_t a1, char a2, unsigned int a3, void *a4)
{
  uint64_t v7 = a4;
  uint64_t v8 = *(void *)(a1 + 8);
  if (a3 >= (unint64_t)((*(void *)(a1 + 16) - v8) >> 5))
  {
    __break(1u);
  }
  else
  {
    int v9 = v7;
    uint64_t v10 = v8 + 32 * a3;
    uint64_t v11 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_234597E44;
    block[3] = &unk_264BF2288;
    void block[4] = a1;
    block[5] = v10;
    char v13 = a3;
    char v14 = a2;
    dispatch_group_async(v9, v11, block);
  }
}

uint64_t sub_234597E44(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = *(unsigned __int8 *)(result + 49);
  uint64_t v6 = *(void *)(*(void *)(result + 32) + 8);
  if (v5 < (*(void *)(*(void *)(result + 32) + 16) - v6) >> 5) {
    return sub_234597B10(*(void *)(result + 40), *(unsigned __int8 *)(result + 48), v6 + 32 * v5, a4, a5);
  }
  __break(1u);
  return result;
}

void sub_234597E70(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 8);
  if (a2 >= (unint64_t)((*(void *)(a1 + 16) - v6) >> 5))
  {
    __break(1u);
  }
  else
  {
    id v7 = v5;
    sub_234597914(v6 + 32 * a2, a2, v5);
  }
}

void sub_234597EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234597EF4(uint64_t a1)
{
  uint64_t v1 = *(uint64_t ***)(a1 + 8);
  uint64_t v2 = *(uint64_t ***)(a1 + 16);
  while (v1 != v2)
  {
    uint64_t v3 = *v1;
    uint64_t v4 = v1[1];
    while (v3 != v4)
    {
      uint64_t v5 = *v3;
      v3 += 2;
      sub_234597368(v5);
    }
    v1 += 4;
  }
}

void **sub_234597F44(void **result, long long *a2, unsigned int a3)
{
  uint64_t v3 = result[1];
  if (a3 >= (unint64_t)(((unsigned char *)result[2] - v3) >> 5))
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = (uint64_t *)&v3[32 * a3];
    uint64_t result = sub_234597998(v4, a2);
    void v4[3] = v4[1];
  }
  return result;
}

uint64_t sub_234597F8C(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  if ((*(_DWORD *)(a1 + 120) - 1) <= 1) {
    *(_DWORD *)(a1 + 120) = 3;
  }
  pthread_cond_signal_thread_np((pthread_cond_t *)(a1 + 8), *(pthread_t *)a1);

  return pthread_mutex_unlock(v2);
}

BOOL sub_234597FF0(BOOL result, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = *(void *)(result + 8);
  unint64_t v4 = (*(void *)(result + 16) - v3) >> 5;
  if (v4 > a2)
  {
    uint64_t v5 = v3 + 32 * a2;
    uint64_t v6 = *(uint64_t **)(v5 + 8);
    id v7 = *(uint64_t **)(v5 + 24);
    if (v7 == v6) {
      return 0;
    }
    uint64_t v8 = *v7;
    if (!*v7 || !*(unsigned char *)(v8 + 34)) {
      return 0;
    }
    if (v4 > a3) {
      return v8 == sub_23459760C((uint64_t **)(v3 + 32 * a3));
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_234598070(uint64_t result, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(uint64_t ***)(result + 8);
  uint64_t v6 = *(uint64_t ***)(result + 16);
  while (v5 != v6)
  {
    id v7 = *v5;
    uint64_t v8 = v5[1];
    while (v7 != v8)
    {
      uint64_t v9 = *v7;
      v7 += 2;
      uint64_t result = sub_234596CE8(v9, a2, a3, a4, a5);
    }
    v5 += 4;
  }
  return result;
}

uint64_t sub_2345980C0(uint64_t a1)
{
  uint64_t v1 = *(uint64_t ***)(a1 + 8);
  uint64_t v2 = *(uint64_t ***)(a1 + 16);
  while (1)
  {
    if (v1 == v2) {
      return 1;
    }
    uint64_t v3 = sub_23459760C(v1);
    if (v3)
    {
      if (sub_2345964F0(v3)) {
        break;
      }
    }
    v1 += 4;
  }
  return 0;
}

void *sub_234598110(void *a1, unsigned int a2)
{
  *a1 = atomic_fetch_add(&qword_2687A9F98, 1uLL);
  memset(v4, 0, sizeof(v4));
  sub_234599820(a1 + 1, a2, (uint64_t)v4);
  uint64_t v5 = (void **)v4;
  sub_234578A84(&v5);
  a1[4] = 0;
  return a1;
}

void sub_234598178(_Unwind_Exception *a1)
{
  *(void *)(v2 - 24) = v1;
  sub_234578A84((void ***)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t sub_234598194(uint64_t a1)
{
  uint64_t result = gettimeofday(&v21, 0);
  unint64_t v3 = 1000000000 * v21.tv_sec + 1000 * v21.tv_usec;
  unint64_t v4 = 1000000000 * *(void *)(a1 + 160) + 1000 * *(int *)(a1 + 168);
  unint64_t v5 = *(void *)(a1 + 144) + *(void *)(a1 + 128);
  if (v3 < v4)
  {
    unsigned int v6 = 0;
    do
    {
      unint64_t v7 = v4 - v5;
      unsigned int v8 = v6 + 1;
      if (v3 >= v4 - v5) {
        break;
      }
      v4 -= v5;
    }
    while (v6++ < 4);
    if (v8 == 5) {
      unint64_t v4 = v3 - v5;
    }
    else {
      unint64_t v4 = v7;
    }
  }
  unint64_t v10 = v3 - v4;
  unint64_t v11 = (v3 - v4) % v5;
  if (*(unsigned __int8 *)(a1 + 124) <= (v11 / 0x3E8 / *(int *)(a1 + 152))) {
    char v12 = 0;
  }
  else {
    char v12 = v11 / 0x3E8 / *(int *)(a1 + 152);
  }
  if (v5 <= v10) {
    char v13 = *(unsigned char *)(a1 + 124);
  }
  else {
    char v13 = 0;
  }
  unsigned __int8 v14 = v12 + v13;
  unsigned __int8 v15 = *(unsigned char *)(a1 + 176) + 1;
LABEL_16:
  if (v15 >= v14)
  {
    unint64_t v20 = v10 - v11 + v4;
    *(void *)(a1 + 160) = v20 / 0x3B9ACA00;
    *(_DWORD *)(a1 + 168) = v20 % 0x3B9ACA00 / 0x3E8;
    *(unsigned char *)(a1 + 176) = v12;
    ++*(void *)(a1 + 272);
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 184);
    uint64_t v17 = *(void *)(a1 + 192);
    while (1)
    {
      if (v16 == v17)
      {
        ++v15;
        goto LABEL_16;
      }
      unint64_t v18 = v15 % *(unsigned __int8 *)(a1 + 124);
      uint64_t v19 = *(void *)(*(void *)v16 + 8);
      if (v18 >= (*(void *)(*(void *)v16 + 16) - v19) >> 5) {
        break;
      }
      uint64_t result = sub_234597AB4(v19 + 32 * v18, v18);
      v16 += 16;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_234598344(uint64_t a1, void *a2)
{
  if (!*a2) {
    sub_23459C268();
  }
  unint64_t v4 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  sub_2345983EC((uint64_t *)(a1 + 232), (uint64_t)a2);
  while (*(void *)(a1 + 232) != *(void *)(a1 + 240))
  {
    if (!*(_DWORD *)(a1 + 120)) {
      break;
    }
    *(_DWORD *)(a1 + 120) = 3;
    pthread_cond_signal_thread_np((pthread_cond_t *)(a1 + 8), *(pthread_t *)a1);
    pthread_cond_wait((pthread_cond_t *)(a1 + 8), v4);
  }

  return pthread_mutex_unlock(v4);
}

void **sub_2345983EC(uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = ((uint64_t)v7 - *a1) >> 4;
    if ((unint64_t)(v9 + 1) >> 60) {
      sub_2345995A8();
    }
    uint64_t v10 = v5 - *a1;
    uint64_t v11 = v10 >> 3;
    if (v10 >> 3 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    v16[4] = result;
    char v13 = (char *)sub_234599650((uint64_t)result, v12);
    unsigned __int8 v14 = &v13[16 * v9];
    v16[0] = v13;
    v16[1] = v14;
    v16[3] = &v13[16 * v15];
    *(_OWORD *)unsigned __int8 v14 = *(_OWORD *)a2;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    v16[2] = v14 + 16;
    sub_234599B34(a1, v16);
    unsigned int v8 = (_OWORD *)a1[1];
    uint64_t result = sub_234599798(v16);
  }
  else
  {
    _OWORD *v7 = *(_OWORD *)a2;
    unsigned int v8 = v7 + 1;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    a1[1] = (uint64_t)v8;
  }
  a1[1] = (uint64_t)v8;
  return result;
}

void sub_2345984C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_234599798((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2345984DC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  unint64_t v5 = *(long long **)(a1 + 184);
  unint64_t v6 = *(long long **)(a1 + 192);
  if (v5 != v6)
  {
    while (**(void **)v5 != a2)
    {
      if (++v5 == v6) {
        goto LABEL_7;
      }
    }
  }
  if (v5 == v6)
  {
LABEL_7:
    uint64_t v7 = 0;
  }
  else
  {
    sub_2345985C0((uint64_t *)(a1 + 208), v5);
    pthread_cond_signal_thread_np((pthread_cond_t *)(a1 + 8), *(pthread_t *)a1);
    uint64_t v7 = 1;
  }
  while (*(void *)(a1 + 208) != *(void *)(a1 + 216))
  {
    if (!*(_DWORD *)(a1 + 120)) {
      break;
    }
    *(_DWORD *)(a1 + 120) = 3;
    pthread_cond_signal_thread_np((pthread_cond_t *)(a1 + 8), *(pthread_t *)a1);
    pthread_cond_wait((pthread_cond_t *)(a1 + 8), v4);
  }
  pthread_mutex_unlock(v4);
  return v7;
}

void **sub_2345985C0(uint64_t *a1, long long *a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = ((uint64_t)v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_2345995A8();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v18[4] = result;
    unsigned __int8 v14 = (char *)sub_234599650((uint64_t)result, v13);
    uint64_t v15 = &v14[16 * v10];
    v18[0] = v14;
    v18[1] = v15;
    v18[3] = &v14[16 * v16];
    long long v17 = *a2;
    *(_OWORD *)uint64_t v15 = *a2;
    if (*((void *)&v17 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v17 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    v18[2] = v15 + 16;
    sub_234599B34(a1, v18);
    uint64_t v9 = (void *)a1[1];
    uint64_t result = sub_234599798(v18);
  }
  else
  {
    void *v7 = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    v7[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = v7 + 2;
    a1[1] = (uint64_t)(v7 + 2);
  }
  a1[1] = (uint64_t)v9;
  return result;
}

void sub_2345986C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_234599798((void **)va);
  _Unwind_Resume(a1);
}

void sub_2345986DC(uint64_t a1, unsigned int a2)
{
  group = dispatch_group_create();
  unint64_t v4 = *(uint64_t **)(a1 + 184);
  unint64_t v5 = *(uint64_t **)(a1 + 192);
  while (v4 != v5)
  {
    sub_234597E70(*v4, a2, group);
    v4 += 2;
  }
  unint64_t v6 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_unlock(v6);
  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  pthread_mutex_lock(v6);
}

void sub_234598770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234598788(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 120) == 1)
  {
    if (*(unsigned char *)(a1 + 124))
    {
      int v2 = 0;
      while (*(_DWORD *)(a1 + 120) == 1)
      {
        sub_2345986DC(a1, v2++);
        if (*(unsigned __int8 *)(a1 + 124) <= v2)
        {
          if (*(_DWORD *)(a1 + 120) != 1) {
            return;
          }
          goto LABEL_7;
        }
      }
    }
    else
    {
LABEL_7:
      unint64_t v3 = *(uint64_t **)(a1 + 184);
      unint64_t v4 = *(uint64_t **)(a1 + 192);
      while (v3 != v4)
      {
        if ((sub_2345980C0(*v3) & 1) == 0) {
          return;
        }
        v3 += 2;
      }
      *(_DWORD *)(a1 + 120) = 2;
      pthread_cond_broadcast((pthread_cond_t *)(a1 + 8));
    }
  }
}

uint64_t sub_234598848(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  pthread_setname_np("Commutator");
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  gettimeofday((timeval *)(a1 + 160), 0);
  *(unsigned char *)(a1 + 176) = 0;
  uint64_t v2 = sub_23459614C();
  uint64_t v56 = (void *)v2;
  int v3 = *(_DWORD *)(a1 + 120);
  if (v3)
  {
    uint64_t v59 = (pthread_cond_t *)(a1 + 8);
    uint64_t v57 = (uint64_t *)(a1 + 208);
    while (1)
    {
      if (v3 == 2)
      {
        do
          uint64_t v2 = pthread_cond_wait(v59, (pthread_mutex_t *)(a1 + 56));
        while (*(_DWORD *)(a1 + 120) == 2);
        *(unsigned char *)(a1 + 256) = 1;
      }
      context = (void *)MEMORY[0x237DC0DF0](v2);
      int v4 = *(_DWORD *)(a1 + 120);
      if (v4 == 4 || v4 == 1)
      {
        unint64_t v6 = *(long long **)(a1 + 232);
        uint64_t v7 = *(long long **)(a1 + 240);
        if (v6 != v7)
        {
          do
          {
            *(void *)(*(void *)v6 + 32) = a1;
            sub_2345985C0((uint64_t *)(a1 + 184), v6++);
          }
          while (v6 != v7);
          sub_234578AD8((uint64_t *)(a1 + 232));
          pthread_cond_broadcast(v59);
        }
        if (*(unsigned char *)(a1 + 256))
        {
          sub_2345986DC(a1, *(unsigned __int8 *)(a1 + 176));
          sub_234598194(a1);
          *(unsigned char *)(a1 + 256) = 0;
        }
        unint64_t v9 = *(void *)(a1 + 128);
        unint64_t v8 = *(void *)(a1 + 136);
        if (v9 != v8 && (v8 > v9 || v8 < v9 && !*(unsigned char *)(a1 + 176)))
        {
          *(void *)(a1 + 128) = v8;
          unint64_t v10 = v8 / *(unsigned __int8 *)(a1 + 124) / 0x3E8;
          *(_DWORD *)(a1 + 152) = v10;
          if ((int)v10 <= 0) {
            __assert_rtn("_main", "XRFrameScheduler_Private.mm", 1142, "_minorFramePeriodInMicroseconds > 0");
          }
          *(void *)(a1 + 144) = 0;
          *(void *)(a1 + 520) = 0;
          *(void *)(a1 + 528) = 0;
        }
        int v11 = *(_DWORD *)(a1 + 168) + *(_DWORD *)(a1 + 152) + *(_DWORD *)(a1 + 152) * *(unsigned __int8 *)(a1 + 176);
        if (v11 <= 999999) {
          __darwin_time_t v12 = *(void *)(a1 + 160);
        }
        else {
          __darwin_time_t v12 = *(void *)(a1 + 160) + 1;
        }
        if (v11 <= 999999) {
          __darwin_suseconds_t v13 = *(_DWORD *)(a1 + 168) + *(_DWORD *)(a1 + 152) + *(_DWORD *)(a1 + 152) * *(unsigned __int8 *)(a1 + 176);
        }
        else {
          __darwin_suseconds_t v13 = v11 - 1000000;
        }
        v60.tv_sec = v12;
        v60.tv_nsec = 1000 * v13;
        dispatch_time_t v14 = dispatch_time(0, 0);
        dispatch_group_t v15 = dispatch_group_create();
        uint64_t v16 = v56;
        os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, (const void *)a1);
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v18 = v17;
          if (os_signpost_enabled(v16))
          {
            int v19 = *(unsigned __int8 *)(a1 + 176);
            LODWORD(buf.tv_sec) = 67109120;
            HIDWORD(buf.tv_sec) = v19;
            _os_signpost_emit_with_name_impl(&dword_234574000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "Minor Frame", "Started Frame %d", (uint8_t *)&buf, 8u);
          }
        }

        while (2)
        {
          if (*(_DWORD *)(a1 + 120) == 3) {
            *(_DWORD *)(a1 + 120) = 1;
          }
          unint64_t v20 = *(uint64_t **)(a1 + 184);
          timeval v21 = *(uint64_t **)(a1 + 192);
          while (v20 != v21)
          {
            sub_234597BC4(*v20, *(unsigned __int8 *)(a1 + 176), v15);
            v20 += 2;
          }
          pthread_mutex_unlock((pthread_mutex_t *)(a1 + 56));
          dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
          pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
          switch(*(_DWORD *)(a1 + 120))
          {
            case 0:
            case 2:
              abort();
            case 1:
              if (pthread_cond_timedwait(v59, (pthread_mutex_t *)(a1 + 56), &v60) == 60) {
                goto LABEL_43;
              }
              continue;
            case 3:
              gettimeofday(&buf, 0);
              BOOL v22 = buf.tv_sec < v12;
              if (buf.tv_sec == v12) {
                BOOL v22 = buf.tv_usec < v13;
              }
              if (v22) {
                continue;
              }
LABEL_43:
              uint64_t v23 = v16;
              os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v23, (const void *)a1);
              if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                os_signpost_id_t v25 = v24;
                if (os_signpost_enabled(v23))
                {
                  LOWORD(buf.tv_sec) = 0;
                  _os_signpost_emit_with_name_impl(&dword_234574000, v23, OS_SIGNPOST_INTERVAL_END, v25, "Minor Frame", "End", (uint8_t *)&buf, 2u);
                }
              }

              dispatch_time_t v26 = v14;
              dispatch_group_t v27 = dispatch_group_create();
              uint64_t v28 = *(BOOL **)(a1 + 184);
              uint64_t v29 = *(BOOL **)(a1 + 192);
              while (v28 != v29)
              {
                BOOL v30 = sub_234597FF0(*v28, *(unsigned __int8 *)(a1 + 176), (*(unsigned __int8 *)(a1 + 176) + 1) % *(unsigned __int8 *)(a1 + 124));
                uint64_t v31 = *v28;
                unsigned int v32 = *(unsigned __int8 *)(a1 + 176);
                if (v30) {
                  sub_234597D64(v31, v32, (v32 + 1) % *(unsigned __int8 *)(a1 + 124), v27);
                }
                else {
                  sub_234597E70(v31, v32, v27);
                }
                v28 += 2;
              }
              pthread_mutex_unlock((pthread_mutex_t *)(a1 + 56));
              dispatch_group_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
              pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));

              dispatch_time_t v14 = v26;
LABEL_53:
              dispatch_time_t v33 = dispatch_time(0, 0);
              if (dispatch_time(v14, 2000 * *(int *)(a1 + 152)) < v33)
              {
                *(unsigned char *)(a1 + 256) = 1;
                sub_2345986DC(a1, *(unsigned __int8 *)(a1 + 176));
                goto LABEL_72;
              }
              if (*(unsigned char *)(a1 + 256)) {
                goto LABEL_72;
              }
              if (*(_DWORD *)(a1 + 120) == 4
                || *(void *)(a1 + 208) != *(void *)(a1 + 216)
                || *(void *)(a1 + 232) != *(void *)(a1 + 240))
              {
                sub_2345986DC(a1, *(unsigned __int8 *)(a1 + 176));
              }
              unsigned int v38 = (*(unsigned __int8 *)(a1 + 176) + 1) % *(unsigned __int8 *)(a1 + 124);
              *(unsigned char *)(a1 + 176) = v38;
              if (v38) {
                goto LABEL_72;
              }
              int v39 = *(_DWORD *)(a1 + 168) + (*(void *)(a1 + 144) + *(void *)(a1 + 128)) / 0x3E8uLL;
              *(_DWORD *)(a1 + 168) = v39;
              if (v39 > 999999)
              {
                ++*(void *)(a1 + 160);
                *(_DWORD *)(a1 + 168) = v39 - 1000000;
              }
              ++*(void *)(a1 + 264);
              uint64_t v40 = *(uint64_t **)(a1 + 184);
              int v41 = *(uint64_t **)(a1 + 192);
              if (v40 == v41) {
                goto LABEL_71;
              }
              char v42 = 1;
              break;
            case 4:
              goto LABEL_53;
            default:
              continue;
          }
          break;
        }
        do
        {
          while (1)
          {
            sub_234598070(*v40, v34, v35, v36, v37);
            if (v42) {
              break;
            }
            char v42 = 0;
            v40 += 2;
            if (v40 == v41) {
              goto LABEL_72;
            }
          }
          uint64_t v43 = *v40;
          v40 += 2;
          char v44 = sub_2345980C0(v43);
          char v42 = v44;
        }
        while (v40 != v41);
        if (v44) {
LABEL_71:
        }
          sub_234598788(a1);
LABEL_72:
      }
      int v3 = *(_DWORD *)(a1 + 120);
      if (v3 == 3) {
        break;
      }
      if (v3 == 4)
      {
        sub_234599C78(v57, *(void **)(a1 + 216), *(uint64_t **)(a1 + 184), *(void **)(a1 + 192), (uint64_t)(*(void *)(a1 + 192) - *(void *)(a1 + 184)) >> 4);
        sub_234578AD8((uint64_t *)(a1 + 184));
        int v3 = 0;
LABEL_77:
        *(_DWORD *)(a1 + 120) = v3;
      }
      uint64_t v45 = *(uint64_t **)(a1 + 208);
      uint64_t v46 = *(uint64_t **)(a1 + 216);
      if (v45 != v46)
      {
        do
        {
          uint64_t v47 = *(uint64_t **)(a1 + 184);
          uint64_t v48 = *(uint64_t **)(a1 + 192);
          uint64_t v49 = *v45;
          int v50 = (std::__shared_weak_count *)v45[1];
          if (v50) {
            atomic_fetch_add_explicit(&v50->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          if (v47 != v48)
          {
            while (*v47 != v49)
            {
              v47 += 2;
              if (v47 == v48)
              {
                uint64_t v47 = v48;
                goto LABEL_93;
              }
            }
            if (v47 != v48)
            {
              for (uint64_t i = v47 + 2; i != v48; i += 2)
              {
                uint64_t v52 = *i;
                if (*i != v49)
                {
                  uint64_t v53 = i[1];
                  *uint64_t i = 0;
                  i[1] = 0;
                  uint64_t v54 = (std::__shared_weak_count *)v47[1];
                  *uint64_t v47 = v52;
                  v47[1] = v53;
                  if (v54) {
                    sub_234578B24(v54);
                  }
                  v47 += 2;
                }
              }
            }
          }
LABEL_93:
          if (v50) {
            sub_234578B24(v50);
          }
          sub_234597EF4(*v45);
          sub_234598FEC(a1 + 184, (unint64_t)v47, *(long long **)(a1 + 192));
          v45 += 2;
        }
        while (v45 != v46);
        sub_234578AD8(v57);
        uint64_t v2 = pthread_cond_broadcast(v59);
        int v3 = *(_DWORD *)(a1 + 120);
      }
      if (!v3) {
        goto LABEL_98;
      }
    }
    int v3 = 1;
    goto LABEL_77;
  }
LABEL_98:
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 8));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 56));

  return 0;
}

void sub_234598F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

unint64_t sub_234598FEC(unint64_t result, unint64_t a2, long long *a3)
{
  if ((unint64_t)a3 < a2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = v3;
    uint64_t v13 = v4;
    if ((long long *)a2 != a3)
    {
      unint64_t v6 = result;
      sub_23459A158((uint64_t)&v11, a3, *(long long **)(result + 8), a2);
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)(v6 + 8);
      if (v9 != v7)
      {
        do
        {
          unint64_t v10 = *(std::__shared_weak_count **)(v9 - 8);
          if (v10) {
            sub_234578B24(v10);
          }
          v9 -= 16;
        }
        while (v9 != v8);
      }
      *(void *)(v6 + 8) = v8;
    }
    return a2;
  }
  return result;
}

uint64_t sub_234599078(uint64_t a1)
{
  return 0;
}

uint64_t sub_234599094(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  while (*(_DWORD *)(a1 + 120))
    pthread_cond_wait((pthread_cond_t *)(a1 + 8), v2);
  *(_DWORD *)(a1 + 120) = 3;
  pthread_attr_init(&v5);
  pthread_attr_setschedpolicy(&v5, 2);
  pthread_attr_getschedparam(&v5, &v4);
  v4.sched_priority = 50;
  pthread_attr_setschedparam(&v5, &v4);
  pthread_create((pthread_t *)a1, &v5, (void *(__cdecl *)(void *))sub_234599078, (void *)a1);
  pthread_attr_destroy(&v5);
  return pthread_mutex_unlock(v2);
}

uint64_t sub_234599188(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  while (1)
  {
    int v3 = *(_DWORD *)(a1 + 120);
    if ((v3 - 1) < 3)
    {
      *(_DWORD *)(a1 + 120) = 4;
      pthread_cond_signal_thread_np((pthread_cond_t *)(a1 + 8), *(pthread_t *)a1);
      goto LABEL_5;
    }
    if (!v3) {
      break;
    }
LABEL_5:
    pthread_cond_wait((pthread_cond_t *)(a1 + 8), v2);
  }
  pthread_mutex_unlock(v2);
  sched_param v4 = *(_opaque_pthread_t **)a1;

  return pthread_join(v4, 0);
}

uint64_t sub_23459921C(uint64_t a1, uint64_t a2)
{
  sched_param v4 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  if (*(unsigned char *)(a1 + 256))
  {
    uint64_t v5 = 0;
  }
  else
  {
    unint64_t v7 = *(void *)(a1 + 128);
    uint64_t v8 = *(void *)(a1 + 144) + v7;
    if (v8 >= 0) {
      uint64_t v9 = *(void *)(a1 + 144) + v7;
    }
    else {
      uint64_t v9 = v8 + 1;
    }
    uint64_t v6 = 1000000000 * *(void *)a2 + 1000 * *(int *)(a2 + 8);
    uint64_t v10 = (1000000000 * *(void *)(a1 + 160) + 1000 * *(int *)(a1 + 168)) % v8 + v6 / v8 * v8 - v6;
    if (v10 >= -(v9 >> 1)) {
      unint64_t v11 = 0;
    }
    else {
      unint64_t v11 = *(void *)(a1 + 144) + v7;
    }
    uint64_t v12 = v11 + v10;
    if (v10 > v9 >> 1) {
      uint64_t v5 = v10 - v8;
    }
    else {
      uint64_t v5 = v12;
    }
    uint64_t v13 = *(void *)(a1 + 520) + v5;
    double v14 = -((double)v13 * 0.01 + (double)v5 * 0.12 + (double)(v5 - *(void *)(a1 + 528)) * 0.0015);
    *(void *)(a1 + 144) = (uint64_t)v14;
    unint64_t v15 = v7 + (uint64_t)v14;
    unint64_t v16 = *(unsigned __int8 *)(a1 + 124);
    if (v15 < v7 >> 1 || v15 > v7 + (v7 >> 1))
    {
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      *(void *)(a1 + 144) = 0;
    }
    else
    {
      uint64_t v18 = v13 + v5;
      v7 += (uint64_t)v14;
      uint64_t v19 = v5;
    }
    *(_DWORD *)(a1 + 152) = v7 / v16 / 0x3E8;
    *(void *)(a1 + 520) = v18;
    *(void *)(a1 + 528) = v19;
    *(void *)(a1 + 8 * (*(void *)(a1 + 264) % 0x1EuLL) + 280) = v5;
  }
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t sub_2345993B4(uint64_t a1, uint64_t a2)
{
  sched_param v4 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  *(void *)(a1 + 136) = a2;

  return pthread_mutex_unlock(v4);
}

uint64_t sub_234599404(uint64_t a1, char a2)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 120) = 0;
  *(unsigned char *)(a1 + 124) = a2;
  *(_OWORD *)(a1 + 136) = xmmword_2345A0550;
  *(unsigned char *)(a1 + 176) = 0;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 241) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 520) = 0u;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 56), 0);
  pthread_cond_init((pthread_cond_t *)(a1 + 8), 0);
  unint64_t v3 = *(void *)(a1 + 136);
  *(void *)(a1 + 128) = v3;
  *(_DWORD *)(a1 + 152) = v3 / *(unsigned __int8 *)(a1 + 124) / 0x3E8;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_OWORD *)(a1 + 504) = 0u;
  return a1;
}

void sub_2345994F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v12 = v11;
  a10 = (void **)(v10 + 232);
  sub_234578A84(&a10);
  a10 = (void **)(v10 + 208);
  sub_234578A84(&a10);
  a10 = v12;
  sub_234578A84(&a10);
  _Unwind_Resume(a1);
}

uint64_t sub_234599530(uint64_t *a1, void *a2)
{
  uint64_t result = sub_234599688((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void sub_2345995A8()
{
}

void sub_2345995C0(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_23459961C(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264BF0AB8, MEMORY[0x263F8C060]);
}

void sub_234599608(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_23459961C(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *sub_234599650(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_2345911DC();
  }
  return operator new(16 * a2);
}

uint64_t sub_234599688(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  int v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = (_OWORD *)(a7 - 16);
    do
    {
      long long v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      *uint64_t v8 = v9;
      *a3 = 0;
      a3[1] = 0;
      *((void *)&v15 + 1) = v8;
      v7 -= 16;
      --v8;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  sub_23459971C((uint64_t)v12);
  return v10;
}

uint64_t sub_23459971C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_234599754(a1);
  }
  return a1;
}

void sub_234599754(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    unint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
    if (v3) {
      sub_234578B24(v3);
    }
    v1 += 16;
  }
}

void **sub_234599798(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_2345997CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  while (v1 != v2)
  {
    *(void *)(a1 + 16) = v1 - 16;
    sched_param v4 = *(std::__shared_weak_count **)(v1 - 8);
    if (v4)
    {
      sub_234578B24(v4);
      uint64_t v1 = *(void *)(a1 + 16);
    }
    else
    {
      v1 -= 16;
    }
  }
}

void *sub_234599820(void *a1, unint64_t a2, uint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_2345998E0(a1, a2);
    uint64_t v6 = (void *)a1[1];
    uint64_t v7 = &v6[4 * a2];
    uint64_t v8 = 32 * a2;
    do
    {
      *uint64_t v6 = 0;
      v6[1] = 0;
      void v6[2] = 0;
      sub_23459995C(v6, *(void **)a3, *(void **)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 4);
      v6[3] = *(void *)(a3 + 24);
      v6 += 4;
      v8 -= 32;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_2345998C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *sub_2345998E0(void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_2345995A8();
  }
  uint64_t result = (char *)sub_234599924((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void *sub_234599924(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_2345911DC();
  }
  return operator new(32 * a2);
}

void *sub_23459995C(void *result, void *a2, void *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_2345999E4(result, a4);
    uint64_t result = sub_234599A28((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_2345999C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_234578A84(&a9);
  _Unwind_Resume(a1);
}

char *sub_2345999E4(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_2345995A8();
  }
  uint64_t result = (char *)sub_234599650((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *sub_234599A28(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  void v7[2] = &v10;
  if (a2 != a3)
  {
    do
    {
      *uint64_t v4 = *a2;
      uint64_t v5 = a2[1];
      v4[1] = v5;
      if (v5) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
      }
      v4 += 2;
      a2 += 2;
    }
    while (a2 != a3);
    uint64_t v10 = v4;
  }
  char v8 = 1;
  sub_234599AB8((uint64_t)v7);
  return v4;
}

uint64_t sub_234599AB8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_234599AF0(a1);
  }
  return a1;
}

void sub_234599AF0(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    unint64_t v3 = *(std::__shared_weak_count **)(v1 - 8);
    if (v3) {
      sub_234578B24(v3);
    }
    v1 -= 16;
  }
}

uint64_t sub_234599B34(uint64_t *a1, void *a2)
{
  uint64_t result = sub_234599BAC((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_234599BAC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  int v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = (_OWORD *)(a7 - 16);
    do
    {
      long long v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      *uint64_t v8 = v9;
      *a3 = 0;
      a3[1] = 0;
      *((void *)&v15 + 1) = v8;
      v7 -= 16;
      --v8;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  sub_234599C40((uint64_t)v12);
  return v10;
}

uint64_t sub_234599C40(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_234599754(a1);
  }
  return a1;
}

void *sub_234599C78(uint64_t *a1, void *a2, uint64_t *a3, void *a4, uint64_t a5)
{
  uint64_t v5 = a2;
  if (a5 >= 1)
  {
    uint64_t v7 = a3;
    uint64_t v11 = a1[2];
    long long v9 = a1 + 2;
    uint64_t v10 = v11;
    unint64_t v12 = *(v9 - 1);
    if (a5 <= (uint64_t)(v11 - v12) >> 4)
    {
      uint64_t v19 = v12 - (void)a2;
      uint64_t v20 = (uint64_t)(v12 - (void)a2) >> 4;
      if (v20 >= a5)
      {
        timeval v21 = &a3[2 * a5];
      }
      else
      {
        timeval v21 = &a3[2 * v20];
        a1[1] = (uint64_t)sub_234599F3C((uint64_t)v9, v21, a4, (void *)*(v9 - 1));
        if (v19 < 1) {
          return v5;
        }
      }
      sub_234599E24((uint64_t)a1, v5, v12, (uint64_t)&v5[2 * a5]);
      sub_23459A068((uint64_t)v26, v7, v21, v5);
    }
    else
    {
      uint64_t v13 = *a1;
      unint64_t v14 = a5 + ((uint64_t)(v12 - *a1) >> 4);
      if (v14 >> 60) {
        sub_2345995A8();
      }
      uint64_t v15 = ((uint64_t)a2 - v13) >> 4;
      uint64_t v16 = v10 - v13;
      if (v16 >> 3 > v14) {
        unint64_t v14 = v16 >> 3;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v14;
      }
      v26[4] = v9;
      if (v17) {
        uint64_t v18 = (char *)sub_234599650((uint64_t)v9, v17);
      }
      else {
        uint64_t v18 = 0;
      }
      BOOL v22 = (uint64_t *)&v18[16 * v15];
      v26[0] = v18;
      v26[1] = v22;
      v26[3] = &v18[16 * v17];
      uint64_t v23 = &v22[2 * a5];
      do
      {
        *BOOL v22 = *v7;
        uint64_t v24 = v7[1];
        v22[1] = v24;
        if (v24) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v24 + 8), 1uLL, memory_order_relaxed);
        }
        v22 += 2;
        v7 += 2;
      }
      while (v22 != v23);
      v26[2] = v23;
      uint64_t v5 = (void *)sub_234599E88(a1, v26, v5);
      sub_234599798(v26);
    }
  }
  return v5;
}

void sub_234599E04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

void *sub_234599E24(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = (void *)((char *)a2 + v6 - a4);
  uint64_t v8 = (_OWORD *)v6;
  if ((unint64_t)v7 < a3)
  {
    long long v9 = v7;
    uint64_t v8 = *(_OWORD **)(a1 + 8);
    do
    {
      *v8++ = *(_OWORD *)v9;
      void *v9 = 0;
      v9[1] = 0;
      v9 += 2;
    }
    while ((unint64_t)v9 < a3);
  }
  *(void *)(a1 + 8) = v8;
  return sub_23459A004((uint64_t)&v11, a2, v7, v6);
}

uint64_t sub_234599E88(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = (uint64_t)(a1 + 2);
  sub_234599BAC((uint64_t)(a1 + 2), (uint64_t)a3, a3, *a1, (void *)*a1, v6, v6);
  a2[1] = v8;
  a2[2] = sub_23459A0E4(v7, (uint64_t)a3, a1[1], (_OWORD *)a2[2]);
  uint64_t v9 = *a1;
  *a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

void *sub_234599F3C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  void v7[2] = &v10;
  if (a2 != a3)
  {
    do
    {
      *uint64_t v4 = *a2;
      uint64_t v5 = a2[1];
      v4[1] = v5;
      if (v5) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
      }
      v4 += 2;
      a2 += 2;
    }
    while (a2 != a3);
    uint64_t v10 = v4;
  }
  char v8 = 1;
  sub_234599FCC((uint64_t)v7);
  return v4;
}

uint64_t sub_234599FCC(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_234599AF0(a1);
  }
  return a1;
}

void *sub_23459A004(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a3 != a2)
  {
    uint64_t v7 = a3;
    do
    {
      long long v8 = *((_OWORD *)v7 - 1);
      v7 -= 2;
      void *v7 = 0;
      v7[1] = 0;
      uint64_t v9 = *(std::__shared_weak_count **)(a4 - 8);
      *(_OWORD *)(a4 - 16) = v8;
      a4 -= 16;
      if (v9) {
        sub_234578B24(v9);
      }
    }
    while (v7 != a2);
  }
  return a3;
}

uint64_t *sub_23459A068(uint64_t a1, uint64_t *a2, uint64_t *a3, void *a4)
{
  uint64_t v5 = a2;
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = a3;
  do
  {
    uint64_t v8 = *v5;
    uint64_t v7 = v5[1];
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = (std::__shared_weak_count *)a4[1];
    *a4 = v8;
    a4[1] = v7;
    if (v9) {
      sub_234578B24(v9);
    }
    a4 += 2;
    v5 += 2;
  }
  while (v5 != v6);
  return v6;
}

_OWORD *sub_23459A0E4(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t v4 = a4;
  uint64_t v9 = a4;
  uint64_t v8 = a4;
  v6[0] = a1;
  v6[1] = &v8;
  void v6[2] = &v9;
  if (a2 != a3)
  {
    do
    {
      *v4++ = *(_OWORD *)a2;
      *(void *)a2 = 0;
      *(void *)(a2 + 8) = 0;
      a2 += 16;
    }
    while (a2 != a3);
    uint64_t v9 = v4;
  }
  char v7 = 1;
  sub_234599FCC((uint64_t)v6);
  return v4;
}

long long *sub_23459A158(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      long long v7 = *v5;
      *(void *)uint64_t v5 = 0;
      *((void *)v5 + 1) = 0;
      uint64_t v8 = *(std::__shared_weak_count **)(a4 + 8);
      *(_OWORD *)a4 = v7;
      if (v8) {
        sub_234578B24(v8);
      }
      ++v5;
      a4 += 16;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void sub_23459A450(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    [v2 finishedWithMode:v4 error:v5 userInfo:v6];

    objc_end_catch();
    JUMPOUT(0x23459A410);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_23459A56C(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a3;
  id v11 = [NSString alloc];
  unint64_t v14 = [v11 initWithFormat:v12 arguments:(uint64_t)v10, (uint64_t)&a9, v13];
  if ([v14 length:v15, v16, v17, v18])
  {
    [v14 dataUsingEncoding:v19 allowLossyConversion:v20];
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    do
    {
      int v27 = [a1 fileDescriptor:v22 withOptions:v23 error:v24];
      id v26 = v26;
      unsigned int v32 = (const void *)[v26 v28:v29 v30:v31];
      size_t v37 = [v26 lengthWith:v33 with:v34 with:v35 with:v36];
      ssize_t v38 = write(v27, v32, v37);
      BOOL v43 = v38 > 0;
      if (v38 < 1) {
        break;
      }
      uint64_t v44 = v38;
      if (v38 != [v26 length:v39, v40, v41, v42])
      {
        uint64_t v49 = [v26 lengthWithOptions:v45 range:v46];
        uint64_t v52 = [v26 subdataWithRange:v44];

        uint64_t v44 = 0;
        id v26 = (id)v52;
      }
    }
    while (v44 != [v26 length:v45, v46, v47, v48]);
  }
  else
  {
    BOOL v43 = 1;
  }

  return v43;
}

uint64_t sub_23459A6A4()
{
  uint64_t result = sub_23459A6EC(0x49656C7070417369, 0xEF6C616E7265746ELL, 0);
  byte_2687A9FA8 = result & 1;
  return result;
}

uint64_t sub_23459A6EC(uint64_t a1, uint64_t a2, char a3)
{
  if (qword_2687A9FE0 != -1) {
    swift_once();
  }
  uint64_t v6 = off_2687A9FE8;
  *(void *)&v13[0] = a1;
  *((void *)&v13[0] + 1) = a2;
  swift_bridgeObjectRetain();
  sub_23459C300();
  if (v6[2] && (unint64_t v7 = sub_23459B2C0((uint64_t)v14), (v8 & 1) != 0)) {
    sub_23459B37C(v6[7] + 32 * v7, (uint64_t)v13);
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  sub_23459B628((uint64_t)v14);
  sub_23459B3D8(&qword_2687AA000);
  int v9 = swift_dynamicCast();
  char v10 = v12;
  if (v12 == 2) {
    char v10 = a3;
  }
  if (!v9) {
    char v10 = a3;
  }
  return v10 & 1;
}

uint64_t sub_23459A7FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_2687A9FE0 != -1) {
    swift_once();
  }
  uint64_t v6 = off_2687A9FE8;
  *(void *)&v11[0] = a1;
  *((void *)&v11[0] + 1) = a2;
  swift_bridgeObjectRetain();
  sub_23459C300();
  if (v6[2] && (unint64_t v7 = sub_23459B2C0((uint64_t)v12), (v8 & 1) != 0)) {
    sub_23459B37C(v6[7] + 32 * v7, (uint64_t)v11);
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  sub_23459B628((uint64_t)v12);
  sub_23459B3D8(&qword_2687AA000);
  sub_23459B3D8(&qword_2687AA010);
  if (swift_dynamicCast() && v10) {
    return v10;
  }
  swift_bridgeObjectRetain();
  return a3;
}

uint64_t static XRInternalizedSettingsStore.appleInternal.getter()
{
  if (qword_2687A9FA0 != -1) {
    swift_once();
  }
  return byte_2687A9FA8;
}

uint64_t sub_23459A96C()
{
  uint64_t result = sub_23459A9E0(0x53736C6F626D7953, 0xEC00000074656568, 0xD000000000000012, 0x80000002345A5680, 0xD000000000000086);
  qword_2687A9FB8 = result;
  unk_2687A9FC0 = v1;
  return result;
}

uint64_t sub_23459A9E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_2687A9FE0 != -1) {
    swift_once();
  }
  int v9 = off_2687A9FE8;
  swift_bridgeObjectRetain();
  sub_23459C300();
  if (v9[2] && (unint64_t v10 = sub_23459B2C0((uint64_t)&v15), (v11 & 1) != 0))
  {
    sub_23459B37C(v9[7] + 32 * v10, (uint64_t)&v17);
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  sub_23459B628((uint64_t)&v15);
  if (!*((void *)&v18 + 1))
  {
    sub_23459B41C((uint64_t)&v17);
    goto LABEL_13;
  }
  sub_23459B3D8(&qword_2687AA010);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    long long v15 = 0u;
    long long v16 = 0u;
    goto LABEL_18;
  }
  if (*(void *)(a1 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_23459B304(a3, a4);
    if (v13)
    {
      sub_23459B37C(*(void *)(a1 + 56) + 32 * v12, (uint64_t)&v15);
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }
  swift_bridgeObjectRelease();
LABEL_18:
  sub_23459B3D8(&qword_2687AA000);
  if (swift_dynamicCast() && *((void *)&v17 + 1)) {
    return v17;
  }
  swift_bridgeObjectRetain();
  return a5;
}

uint64_t static XRInternalizedSettingsStore.symbolsPermissionError_iOS.getter()
{
  if (qword_2687A9FB0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_2687A9FB8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_23459AC2C()
{
  unint64_t v0 = sub_23459ACA0(MEMORY[0x263F8EE78]);
  uint64_t v1 = sub_23459A7FC(0xD00000000000001ALL, 0x80000002345A05A0, v0);
  swift_bridgeObjectRelease();

  return sub_23459ADCC(v1, &qword_2687A9FD0);
}

unint64_t sub_23459ACA0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_23459B3D8(&qword_2687AA018);
  uint64_t v2 = sub_23459C310();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23459B6D8(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_23459B304(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    char v11 = (uint64_t *)(v3[6] + 16 * result);
    *char v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_23459B740(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    void v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_23459ADCC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    unint64_t v4 = sub_23459B304(0x65446E69616D6F44, 0xEE0073746C756166);
    if (v5)
    {
      sub_23459B37C(*(void *)(a1 + 56) + 32 * v4, (uint64_t)&v10);
      sub_23459B3D8(&qword_2687A9FF8);
      if (swift_dynamicCast())
      {
        if (*(void *)(a1 + 16) && (unint64_t v6 = sub_23459B304(0xD000000000000010, 0x80000002345A5660), (v7 & 1) != 0))
        {
          sub_23459B37C(*(void *)(a1 + 56) + 32 * v6, (uint64_t)&v10);
        }
        else
        {
          long long v10 = 0u;
          long long v11 = 0u;
        }
        swift_bridgeObjectRelease();
        if (!*((void *)&v11 + 1))
        {
          swift_bridgeObjectRelease();
          uint64_t result = sub_23459B41C((uint64_t)&v10);
          goto LABEL_8;
        }
        sub_23459B3D8(&qword_2687AA008);
        uint64_t result = swift_dynamicCast();
        if (result)
        {
          *a2 = v9;
          a2[1] = v9;
          return result;
        }
      }
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
LABEL_8:
  *a2 = 0;
  a2[1] = 0;
  return result;
}

uint64_t static XRInternalizedSettingsStore.symbolicationModernization.getter@<X0>(void *a1@<X8>)
{
  if (qword_2687A9FC8 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_2687A9FD0;
  uint64_t v3 = *(void *)algn_2687A9FD8;
  *a1 = qword_2687A9FD0;
  a1[1] = v3;

  return sub_23459AF94(v2);
}

uint64_t sub_23459AF94(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t XRInternalizedSettingsStore.SymbolicationModernization.domainDefaults.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t XRInternalizedSettingsStore.SymbolicationModernization.setupInvocations.getter()
{
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for XRInternalizedSettingsStore()
{
  return &type metadata for XRInternalizedSettingsStore;
}

uint64_t destroy for XRInternalizedSettingsStore.SymbolicationModernization()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s23DVTInstrumentsUtilities27XRInternalizedSettingsStoreO26SymbolicationModernizationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for XRInternalizedSettingsStore.SymbolicationModernization(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for XRInternalizedSettingsStore.SymbolicationModernization(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for XRInternalizedSettingsStore.SymbolicationModernization(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XRInternalizedSettingsStore.SymbolicationModernization(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XRInternalizedSettingsStore.SymbolicationModernization(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XRInternalizedSettingsStore.SymbolicationModernization()
{
  return &type metadata for XRInternalizedSettingsStore.SymbolicationModernization;
}

uint64_t sub_23459B1B0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_23459B1D0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for XRTimeRange()
{
  if (!qword_2687A9FF0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2687A9FF0);
    }
  }
}

void sub_23459B250()
{
  id v0 = [self internalizedSettings];
  uint64_t v1 = (void *)sub_23459C2C0();

  off_2687A9FE8 = v1;
}

unint64_t sub_23459B2C0(uint64_t a1)
{
  uint64_t v2 = sub_23459C2E0();

  return sub_23459B47C(a1, v2);
}

unint64_t sub_23459B304(uint64_t a1, uint64_t a2)
{
  sub_23459C330();
  sub_23459C2D0();
  uint64_t v4 = sub_23459C340();

  return sub_23459B544(a1, a2, v4);
}

uint64_t sub_23459B37C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23459B3D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_23459B41C(uint64_t a1)
{
  uint64_t v2 = sub_23459B3D8(&qword_2687AA000);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23459B47C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_23459B67C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x237DC0750](v9, a1);
      sub_23459B628((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_23459B544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    long long v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23459C320() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_23459C320() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23459B628(uint64_t a1)
{
  return a1;
}

uint64_t sub_23459B67C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_23459B6D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23459B3D8((uint64_t *)&unk_2687AA020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_23459B740(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

BOOL static XRTimeRange.== infix(_:_:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a1 - 1;
  BOOL v5 = -a2 < a1 || a2 == 0;
  uint64_t v6 = v4 + a2;
  if (v5) {
    uint64_t v6 = -1;
  }
  BOOL v7 = -a4 < a1 || a4 == 0;
  uint64_t v8 = v4 + a4;
  if (v7) {
    uint64_t v8 = -1;
  }
  BOOL v9 = v6 == v8;
  return a1 == a3 && v9;
}

BOOL sub_23459B790(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 > -a2 || a2 == 0) {
    uint64_t v5 = -1;
  }
  else {
    uint64_t v5 = a2 + a1 - 1;
  }
  if (a1 > -a4 || a4 == 0) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = a4 + a1 - 1;
  }
  BOOL v8 = v5 == v7;
  return a1 == a3 && v8;
}

BOOL sub_23459B7D4(uint64_t a1, uint64_t *a2)
{
  return sub_23459B790(*(void *)a1, *(void *)(a1 + 8), *a2, a2[1]);
}

uint64_t static XRTimeRange.full.getter()
{
  return 0;
}

uint64_t static XRTimeRange.null.getter()
{
  return -1;
}

uint64_t XRTimeRange.actualStart.getter(uint64_t result)
{
  if (result == -1) {
    return 0;
  }
  return result;
}

uint64_t XRTimeRange.actualLength.getter(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = -1;
  }
  else {
    uint64_t v2 = 0;
  }
  if (a2) {
    uint64_t v2 = a2;
  }
  if (a1 == -1) {
    return 0;
  }
  else {
    return v2;
  }
}

void sub_23459B854()
{
  __assert_rtn("+[NSProcessInfo(DVTInstrumentsUtilities) isRunningVirtualized] == 0");
}

void sub_23459B880()
{
}

void sub_23459B8AC()
{
  *(_WORD *)id v0 = 0;
  _os_log_fault_impl(&dword_234574000, &_os_log_internal, OS_LOG_TYPE_FAULT, "It appears that the block being passed to requestLocalNotification:object:observe:block: captures the observer which would lead to an unrecoverable cycle.  Use the observer parameter passed in to the block instead.\nSet a breakpoint in '_DVTIUInvalidBlockCaptureBreak' to debug", v0, 2u);
}

void sub_23459B8F4()
{
  __assert_rtn("containsIndex", "XRIndexSetImpl.hpp", 337, "_ranges.size() <= CACHE_SIZE");
}

void sub_23459B920()
{
  __assert_rtn("-[XRMobileAgentQueueStop receiveMobileAgent:]", "XRMobileAgentQueueStop.m", 110, "agent.movementType != XRMobileAgentUnsetMovement");
}

void sub_23459B94C()
{
  __assert_rtn("-[XRMobileAgentQueueStop(SubclassPrivate) _welcomeAgent:]", "XRMobileAgentQueueStop.m", 140, "agent.movementType != XRMobileAgentUnsetMovement");
}

void sub_23459B978(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v5 = 134217984;
  uint64_t v6 = [a1 a2:a3 a4:a4 a5:a5];
  _os_log_fault_impl(&dword_234574000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Key Value Typed Array has not even number of elements: %ld", (uint8_t *)&v5, 0xCu);
}

void sub_23459B9FC()
{
  *(_WORD *)id v0 = 0;
  _os_log_error_impl(&dword_234574000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to get a size in points/pixel's underlying array", v0, 2u);
}

void sub_23459BA44()
{
  __assert_rtn("-[XREngineeringTypeDefinitions checksum]", "XREngineeringTypeDefinitions.m", 234, "chunk.length <= chunkSizeTarget");
}

void sub_23459BA70()
{
}

void sub_23459BA9C()
{
}

void sub_23459BAC8(void *a1, void *a2)
{
  id v3 = a1;
  BOOL v8 = [a2 localizedDescriptionWithFormat:v4, v5, v6, v7];
  sub_23458A340(&dword_234574000, v9, v10, "Unarchiving deep copied object failed with error: %@", v11, v12, v13, v14, 2u);
}

void sub_23459BB60(void *a1, void *a2)
{
  id v3 = a1;
  BOOL v8 = [a2 localizedDescriptionWithFormat:v4, v5, v6, v7];
  sub_23458A340(&dword_234574000, v9, v10, "Archiving object to deep copy failed with error: %@", v11, v12, v13, v14, 2u);
}

void sub_23459BBF8(void *a1, uint64_t *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = objc_begin_catch(a1);
  *a3 = v5;
  id v6 = v5;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    uint64_t v7 = *a2;
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_fault_impl(&dword_234574000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Agent '%@' threw an exception and will be sent to its final destination in the failed mode. Exception: %@.", (uint8_t *)&v8, 0x16u);
  }
}

void sub_23459BCC0()
{
  __assert_rtn("-[XRMobileAgent activateAtStop:activationTicket:activationQoS:finalDestination:finalTicket:]", "XRMobileAgent.m", 67, "_itinerary == nil");
}

void sub_23459BCEC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v7 = [a1 descriptionWithLocale:a2 indent:a3];
  uint64_t v12 = [a1 v8:v9 v10:v11];
  long long v17 = [*(void **)a2 performSelector:v13 withObject:v14 withObject:v15 withObject:v16];
  int v18 = 138412802;
  uint64_t v19 = v7;
  __int16 v20 = 2112;
  uint64_t v21 = v12;
  __int16 v22 = 2112;
  uint64_t v23 = v17;
  _os_log_error_impl(&dword_234574000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Agent %@ did not set its itinerary in mode %@ after passing through stop %@", (uint8_t *)&v18, 0x20u);
}

void sub_23459BDD0()
{
  __assert_rtn("-[XRMobileAgentItinerary _visitNextStop:]", "XRMobileAgent.m", 276, "agent->_movementType == XRMobileAgentParkMovement");
}

void sub_23459BDFC()
{
  __assert_rtn("-[XRMobileAgentItinerary _visitNextStop:]", "XRMobileAgent.m", 234, "_nextMovementType == XRMobileAgentParkMovement");
}

void sub_23459BE28(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v7 = [a1 performSelector:(SEL)a2 withObject:a3 withObject:a4 withObject:a5];
  uint64_t v8 = *(void *)(a2 + 40);
  int v9 = 138412802;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_fault_impl(&dword_234574000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Agent '%@' attempted to set a nil next stop.  The current mode is '%@'.  The next mode is '%@'.  Moving to final destination in the failed mode.", (uint8_t *)&v9, 0x20u);
}

void sub_23459BEE8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = [a1 descriptionWithLocale:a2 indent:a3];
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_error_impl(&dword_234574000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Agent %@ has been lost.  Recovering by sending it to its final destination in the failure mode.", (uint8_t *)&v6, 0xCu);
}

void sub_23459BF80(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_234574000, &_os_log_internal, OS_LOG_TYPE_FAULT, "A next stop of nil was set for the itinerary '%@'.  If this agent continues there will be another fault with the details.", (uint8_t *)&v1, 0xCu);
}

void sub_23459C000()
{
}

void sub_23459C02C()
{
}

void sub_23459C058()
{
}

void sub_23459C084()
{
}

void sub_23459C0B0()
{
}

void sub_23459C0DC()
{
}

void sub_23459C108()
{
}

void sub_23459C134()
{
}

void sub_23459C160()
{
}

void sub_23459C18C()
{
}

void sub_23459C1B8()
{
}

void sub_23459C1E4()
{
  __assert_rtn("extendingMinorFrame", "XRFrameScheduler_Private.mm", 763, "_nextReadyManager == _activityManagers.end() || !(*_nextReadyManager)->isActive()");
}

void sub_23459C210()
{
  __assert_rtn("extendingMinorFrame", "XRFrameScheduler_Private.mm", 759, "_nextReadyManager != _activityManagers.end()");
}

void sub_23459C23C()
{
}

void sub_23459C268()
{
  __assert_rtn("addRing", "XRFrameScheduler_Private.mm", 986, "ring != nullptr");
}

void sub_23459C294()
{
  __assert_rtn("-[XRFrameActivityBlockAgent dealloc]", "XRFrameActivityBlockAgent.m", 53, "current != FINISHED_OPERATION");
}

uint64_t sub_23459C2C0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23459C2D0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23459C2E0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_23459C2F0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_23459C300()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_23459C310()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23459C320()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23459C330()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23459C340()
{
  return MEMORY[0x270F9FC90]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AD8](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AE0](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7AE8](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

xmlStructuredErrorFunc *__xmlStructuredError(void)
{
  return (xmlStructuredErrorFunc *)MEMORY[0x270F9BA58]();
}

void **__xmlStructuredErrorContext(void)
{
  return (void **)MEMORY[0x270F9BA60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint64_t archive_entry_free()
{
  return MEMORY[0x270F97D48]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x270F97D78]();
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x270F97D88]();
}

uint64_t archive_entry_set_filetype()
{
  return MEMORY[0x270F97DC0]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x270F97DF0]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x270F97E00]();
}

uint64_t archive_entry_set_size()
{
  return MEMORY[0x270F97E08]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x270F97E58]();
}

uint64_t archive_read_extract()
{
  return MEMORY[0x270F97ED0]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x270F97EF0]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x270F97EF8]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x270F97F20]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x270F97F50]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x270F97F68]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x270F97FB0]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x270F97FF0]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x270F97FF8]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x270F98018]();
}

uint64_t archive_write_set_format_zip()
{
  return MEMORY[0x270F98088]();
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x270F9A490](cls);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t csops_audittoken()
{
  return MEMORY[0x270ED9158]();
}

uint64_t csr_check()
{
  return MEMORY[0x270ED9160]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x270ED9F70](*(void *)&a1, *(void *)&a2);
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

[a1 a2, ...];
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
}

[super a2];
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x270EDAC18](*(void *)&t, x);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x270EDAE00](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x270EDAE30](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE38](a1, *(void *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_signal_thread_np(pthread_cond_t *a1, pthread_t a2)
{
  return MEMORY[0x270EDAE70](a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE78](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFC8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x270EDB038](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDB170](a1, a2);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

uint64_t strtoll_l(const char *a1, char **a2, int a3, locale_t a4)
{
  return MEMORY[0x270EDB6F0](a1, a2, *(void *)&a3, a4);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

xmlDocPtr xmlCtxtReadFile(xmlParserCtxtPtr ctxt, const char *filename, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x270F9BBE0](ctxt, filename, encoding, *(void *)&options);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
}

void xmlLockLibrary(void)
{
}

xmlParserCtxtPtr xmlNewParserCtxt(void)
{
  return (xmlParserCtxtPtr)MEMORY[0x270F9BEA0]();
}

void xmlSchemaFree(xmlSchemaPtr schema)
{
}

void xmlSchemaFreeParserCtxt(xmlSchemaParserCtxtPtr ctxt)
{
}

void xmlSchemaFreeValidCtxt(xmlSchemaValidCtxtPtr ctxt)
{
}

xmlSchemaParserCtxtPtr xmlSchemaNewParserCtxt(const char *URL)
{
  return (xmlSchemaParserCtxtPtr)MEMORY[0x270F9C078](URL);
}

xmlSchemaValidCtxtPtr xmlSchemaNewValidCtxt(xmlSchemaPtr schema)
{
  return (xmlSchemaValidCtxtPtr)MEMORY[0x270F9C080](schema);
}

xmlSchemaPtr xmlSchemaParse(xmlSchemaParserCtxtPtr ctxt)
{
  return (xmlSchemaPtr)MEMORY[0x270F9C088](ctxt);
}

void xmlSchemaSetValidStructuredErrors(xmlSchemaValidCtxtPtr ctxt, xmlStructuredErrorFunc serror, void *ctx)
{
}

int xmlSchemaValidateFile(xmlSchemaValidCtxtPtr ctxt, const char *filename, int options)
{
  return MEMORY[0x270F9C0B0](ctxt, filename, *(void *)&options);
}

void xmlSchemaValidateSetFilename(xmlSchemaValidCtxtPtr vctxt, const char *filename)
{
}

void xmlSetStructuredErrorFunc(void *ctx, xmlStructuredErrorFunc handler)
{
}

void xmlUnlockLibrary(void)
{
}