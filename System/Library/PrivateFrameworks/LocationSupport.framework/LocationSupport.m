void sub_1A4541F88(const void *a1)
{
  void *v2;
  void (**v3)(void);
  uint64_t vars8;

  v2 = (void *)MEMORY[0x1A625E010]();
  v3 = (void (**)(void))_Block_copy(a1);
  v3[2]();
}

void sub_1A4542098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A45420CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained prepareAndRunBlock:0];

  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [v4 timer];
  [v3 shouldFire];
}

uint64_t sub_1A4542250(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) valid];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) offsiloHandleInvocation:*(void *)(a1 + 48) selectorInfo:*(void *)(a1 + 56) peer:*(void *)(a1 + 64)];
    if (result)
    {
      v3 = [*(id *)(a1 + 64) delegateSilo];
      id v4 = [v3 identifier];
      CLProfilingIdentifySiloInvocation((uint64_t)v4, *(void **)(a1 + 48));

      uint64_t v5 = *(void *)(a1 + 48);
      return MEMORY[0x1F4181798](v5, sel_invokeWithTarget_);
    }
  }
  return result;
}

void sub_1A45422E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A454231C(uint64_t a1)
{
}

uint64_t sub_1A4542324(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1A454231C;
  v3[3] = &unk_1E5B3E9B8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 async:v3];
}

uint64_t sub_1A4542398(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) valid];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    return MEMORY[0x1F4181798](v3, sel_invoke);
  }
  return result;
}

double sub_1A45425EC(unint64_t a1)
{
  double v2 = *(double *)&qword_1EB30CEA0;
  if (*(double *)&qword_1EB30CEA0 == 0.0)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    unint64_t numer = info.numer;
    if (info.denom)
    {
      unint64_t denom = info.denom;
      unint64_t v5 = info.numer;
      do
      {
        unint64_t numer = denom;
        unint64_t denom = v5 % denom;
        unint64_t v5 = numer;
      }
      while (denom);
    }
    unint64_t v6 = info.numer / numer;
    unint64_t v7 = 1000000000;
    unint64_t v8 = v6;
    do
    {
      unint64_t v9 = v8;
      unint64_t v8 = v7;
      unint64_t v7 = v9 % v7;
    }
    while (v7);
    double v2 = (double)(v6 / v8) / (double)(0x3B9ACA00 / v8 * (info.denom / numer));
    *(double *)&qword_1EB30CEA0 = v2;
  }
  return v2 * (double)a1;
}

void sub_1A4542B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1A4542C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A45433D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id a42)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);

  _Block_object_dispose((const void *)(v43 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A4543938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A45439F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4543A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4543AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1A4543C88(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareAndRunBlock:*(void *)(a1 + 40)];
}

__CFString *sub_1A4543D68(void *a1, int a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = [a1 objectForKey:v5];
  if (!v6)
  {
    if (a2)
    {
      if (a2 == 1) {
        unint64_t v6 = @"_CLUnSupportedService";
      }
      else {
        unint64_t v6 = 0;
      }
    }
    else
    {
      unint64_t v6 = (__CFString *)v5;
    }
  }
  unint64_t v7 = v6;

  return v7;
}

void sub_1A4543DF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4543E00(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 40)])
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
    }
    double v2 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      v12[0] = 68289282;
      v12[1] = 0;
      __int16 v13 = 2082;
      v14 = &unk_1A45670B7;
      __int16 v15 = 2114;
      uint64_t v16 = v3;
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Unavailable service requested\", \"RequestedServiceName\":%{public, location:escape_only}@}", (uint8_t *)v12, 0x1Cu);
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    unint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = *(void *)(a1 + 32);
    unint64_t v8 = *(void **)(v7 + 16);
    if (v8)
    {
      uint64_t v9 = sub_1A4543D68(v8, *(_DWORD *)(v7 + 40), *(void **)(a1 + 40));
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];
        MEMORY[0x1F41817F8]();
      }
    }
  }
}

void sub_1A4544118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A45445A0(void *a1, void *a2)
{
  uint64_t v4 = (void *)MEMORY[0x1A625E010]();
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    goto LABEL_29;
  }
  uint64_t v5 = MEMORY[0x1A625E6B0](a2);
  if (v5 != MEMORY[0x1E4F145A8])
  {
    if (v5 == MEMORY[0x1E4F14590])
    {
      uint64_t v10 = a1[8];
      uint64_t v9 = (std::__shared_weak_count *)a1[9];
      v11 = (std::__shared_weak_count *)operator new(0x70uLL);
      v12 = v11;
      v11->__shared_owners_ = 0;
      v11->__shared_weak_owners_ = 0;
      v11->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7F49D0;
      *(void *)buf = v10;
      uint64_t v16 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CLConnectionMessage::CLConnectionMessage((uint64_t)&v11[1], a2, buf);
      if (v9) {
        sub_1A4547114(v9);
      }
      uint64_t v13 = a1[6];
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      (*(void (**)(uint64_t))(v13 + 16))(v13);
      if (v12) {
        sub_1A4547114(v12);
      }
      sub_1A4547114(v12);
    }
    else
    {
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
      unint64_t v6 = qword_1EB30CE88;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4540000, v6, OS_LOG_TYPE_FAULT, "Got unexpected location event", buf, 2u);
      }
    }
    goto LABEL_29;
  }
  if (a2 != (void *)MEMORY[0x1E4F14520])
  {
    if (a2 != (void *)MEMORY[0x1E4F14528]) {
      goto LABEL_29;
    }
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
    }
    uint64_t v7 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_DEFAULT, "#Warning Location connection invalid!", buf, 2u);
    }
    uint64_t v8 = a1[5];
    if (!v8) {
      goto LABEL_29;
    }
LABEL_28:
    (*(void (**)(void))(v8 + 16))();
    goto LABEL_29;
  }
  if (qword_1EB30CE90 != -1) {
    dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
  }
  v14 = qword_1EB30CE88;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4540000, v14, OS_LOG_TYPE_DEFAULT, "#Warning Connection interrupted!", buf, 2u);
  }
  uint64_t v8 = a1[4];
  if (v8) {
    goto LABEL_28;
  }
LABEL_29:
}

void sub_1A4544848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1A4547114(a10);
  }
  sub_1A4547114(v10);
  _Unwind_Resume(a1);
}

void sub_1A4544888(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a2 + 8);
  v4[0] = *(const char **)a2;
  v4[1] = (const char *)v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  CLConnection::handleMessage(v2, v4);
  if (v3)
  {
    sub_1A4547114((std::__shared_weak_count *)v3);
  }
}

void sub_1A45448F8(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_1A4547114(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A4544AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4545CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

BOOL CLConnection::sendMessage(uint64_t a1, const char **a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (a3)
  {
    int64_t v6 = *(void *)(a1 + 32) + 1;
    *(void *)(a1 + 32) = v6;
    id v7 = (id)[a3 copy];
    objc_msgSend(*(id *)(a1 + 24), "setObject:forKeyedSubscript:", v7, objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", v6));
    uint64_t v8 = _os_activity_create(&dword_1A4540000, "CL: ReplyHandler cached", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &state);

    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
    }
    uint64_t v9 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *a2;
      if ((*a2)[23] < 0) {
        uint64_t v10 = *(const char **)v10;
      }
      *(_DWORD *)buf = 68289794;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = &unk_1A45670B7;
      __int16 v32 = 2082;
      v33 = "activity";
      __int16 v34 = 2082;
      v35 = v10;
      __int16 v36 = 1026;
      int v37 = v6;
      _os_log_impl(&dword_1A4540000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"ReplyHandler cached\", \"event\":%{public, location:escape_only}s, \"MessageName\":%{public, location:escape_only}s, \"ReplyHandlerIdentifier\":%{public}u}", buf, 0x2Cu);
    }
    os_activity_scope_leave(&state);
  }
  else
  {
    int64_t v6 = 0;
  }
  v11 = *a2;
  if ((*a2)[23] < 0)
  {
    sub_1A45472F4(__p, *(void **)v11, *((void *)v11 + 1));
    v11 = *a2;
  }
  else
  {
    long long v12 = *(_OWORD *)v11;
    uint64_t v26 = *((void *)v11 + 2);
    *(_OWORD *)__p = v12;
  }
  uint64_t v13 = sub_1A4548364((const char *)__p, *((void **)v11 + 7), *((void **)v11 + 8), v6, 0);
  v14 = v13;
  if (SHIBYTE(v26) < 0)
  {
    operator delete(__p[0]);
    if (v14) {
      goto LABEL_15;
    }
  }
  else if (v13)
  {
LABEL_15:
    if (*(unsigned char *)(a1 + 73))
    {
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
      __int16 v15 = qword_1EB30CE88;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = *a2;
        if ((*a2)[23] < 0) {
          uint64_t v16 = *(const char **)v16;
        }
        *(_DWORD *)buf = 68289282;
        int v29 = 0;
        __int16 v30 = 2082;
        v31 = &unk_1A45670B7;
        __int16 v32 = 2082;
        v33 = v16;
        _os_log_impl(&dword_1A4540000, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLConnection::sendMessage\", \"name\":%{public, location:escape_only}s}", buf, 0x1Cu);
      }
      xpc_connection_send_notification();
    }
    else
    {
      v21 = _os_activity_create(&dword_1A4540000, "CL: CLConnection::sendMessage", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v21, &state);

      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
      v22 = qword_1EB30CE88;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEBUG))
      {
        v23 = *a2;
        if ((*a2)[23] < 0) {
          v23 = *(const char **)v23;
        }
        *(_DWORD *)buf = 68289538;
        int v29 = 0;
        __int16 v30 = 2082;
        v31 = &unk_1A45670B7;
        __int16 v32 = 2082;
        v33 = "activity";
        __int16 v34 = 2082;
        v35 = v23;
        _os_log_impl(&dword_1A4540000, v22, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLConnection::sendMessage\", \"event\":%{public, location:escape_only}s, \"name\":%{public, location:escape_only}s}", buf, 0x26u);
      }
      xpc_connection_send_message(*(xpc_connection_t *)a1, v14);
      os_activity_scope_leave(&state);
    }
    xpc_release(v14);
    return v14 != 0;
  }
  if (qword_1EB30CE90 != -1) {
    dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
  }
  uint64_t v17 = qword_1EB30CE88;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
  {
    v18 = *a2;
    if ((*a2)[23] < 0) {
      v18 = *(const char **)v18;
    }
    *(_DWORD *)buf = 68289282;
    int v29 = 0;
    __int16 v30 = 2082;
    v31 = &unk_1A45670B7;
    __int16 v32 = 2082;
    v33 = v18;
    _os_log_impl(&dword_1A4540000, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Couldn't create XPC message\", \"name\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
    }
  }
  v19 = qword_1EB30CE88;
  if (os_signpost_enabled((os_log_t)qword_1EB30CE88))
  {
    v20 = *a2;
    if ((*a2)[23] < 0) {
      v20 = *(const char **)v20;
    }
    *(_DWORD *)buf = 68289282;
    int v29 = 0;
    __int16 v30 = 2082;
    v31 = &unk_1A45670B7;
    __int16 v32 = 2082;
    v33 = v20;
    _os_signpost_emit_with_name_impl(&dword_1A4540000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Couldn't create XPC message", "{\"msg%{public}.0s\":\"Couldn't create XPC message\", \"name\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  return v14 != 0;
}

void sub_1A4546320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, os_activity_scope_state_s state)
{
}

void CLProfilingIdentifySiloInvocation(uint64_t a1, void *a2)
{
  if (qword_1EB30CFF8 != -1) {
    dispatch_once(&qword_1EB30CFF8, &unk_1EF7F5180);
  }
  if (byte_1EB30CFE0)
  {
    id v5 = (id)[[NSString alloc] initWithFormat:@"[%@ %@]", a1, NSStringFromSelector((SEL)objc_msgSend(a2, "selector"))];
    uint64_t v4 = [v5 UTF8String];
    off_1EC387EA8(v4);
  }
}

void CLConnectionMessage::~CLConnectionMessage(CLConnectionMessage *this)
{
  uint64_t v2 = (void *)*((void *)this + 5);
  if (v2) {
    xpc_release(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 6);
  if (v3) {
    xpc_release(v3);
  }

  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 10);
  if (v4) {
    sub_1A4547114(v4);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*(void **)this);
  }
}

BOOL CLConnection::sendMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  v5[0] = *(const char **)a2;
  v5[1] = (const char *)v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  BOOL v3 = CLConnection::sendMessage(a1, v5, 0);
  if (v2) {
    sub_1A4547114((std::__shared_weak_count *)v2);
  }
  return v3;
}

void sub_1A45464F4(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_1A4547114(v1);
  }
  _Unwind_Resume(exception_object);
}

void CLConnection::handleMessage(uint64_t a1, const char **a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  uint64_t v4 = *a2;
  if ((*a2)[32] && *((void *)v4 + 3))
  {
    id v5 = (void *)[MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*((void *)v4 + 3)];
    uint64_t v6 = [*(id *)(a1 + 24) objectForKeyedSubscript:v5];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = _os_activity_create(&dword_1A4540000, "CL: Invoking reply-handler", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v8, &state);

      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
      uint64_t v9 = qword_1EB30CE88;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = *a2;
        if ((*a2)[23] < 0) {
          uint64_t v10 = *(const char **)v10;
        }
        int v11 = [v5 intValue];
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)int v29 = 0;
        *(_WORD *)&v29[4] = 2082;
        *(void *)&v29[6] = &unk_1A45670B7;
        __int16 v30 = 2082;
        v31 = "activity";
        __int16 v32 = 2082;
        v33 = v10;
        __int16 v34 = 1026;
        int v35 = v11;
        _os_log_impl(&dword_1A4540000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Invoking reply-handler\", \"event\":%{public, location:escape_only}s, \"MessageName\":%{public, location:escape_only}s, \"ReplyHandlerIdentifier\":%{public}u}", buf, 0x2Cu);
      }
      long long v12 = (std::__shared_weak_count *)a2[1];
      v25 = *a2;
      uint64_t v26 = v12;
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      (*(void (**)(uint64_t, const char **))(v7 + 16))(v7, &v25);
      if (v26) {
        sub_1A4547114(v26);
      }
      [*(id *)(a1 + 24) removeObjectForKey:v5];
      os_activity_scope_leave(&state);
    }
    else
    {
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
      v18 = qword_1EB30CE88;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
      {
        v19 = *a2;
        if ((*a2)[23] < 0) {
          v19 = *(const char **)v19;
        }
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)int v29 = 0;
        *(_WORD *)&v29[4] = 2082;
        *(void *)&v29[6] = &unk_1A45670B7;
        __int16 v30 = 2082;
        v31 = v19;
        __int16 v32 = 1026;
        LODWORD(v33) = [v5 intValue];
        _os_log_impl(&dword_1A4540000, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"No ReplyHandler found\", \"Message Name\":%{public, location:escape_only}s, \"ReplyHandlerIdentifier\":%{public}u}", buf, 0x22u);
        if (qword_1EB30CE90 != -1) {
          dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
        }
      }
      v20 = qword_1EB30CE88;
      if (os_signpost_enabled((os_log_t)qword_1EB30CE88))
      {
        v21 = *a2;
        if (v21[23] < 0) {
          v21 = *(const char **)v21;
        }
        int v22 = [v5 intValue];
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)int v29 = 0;
        *(_WORD *)&v29[4] = 2082;
        *(void *)&v29[6] = &unk_1A45670B7;
        __int16 v30 = 2082;
        v31 = v21;
        __int16 v32 = 1026;
        LODWORD(v33) = v22;
        _os_signpost_emit_with_name_impl(&dword_1A4540000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "No ReplyHandler found", "{\"msg%{public}.0s\":\"No ReplyHandler found\", \"Message Name\":%{public, location:escape_only}s, \"ReplyHandlerIdentifier\":%{public}u}", buf, 0x22u);
      }
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 56);
    if (v4[23] < 0) {
      uint64_t v4 = *(const char **)v4;
    }
    uint64_t v14 = objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", objc_msgSend(NSString, "stringWithUTF8String:", v4));
    if (!v14) {
      uint64_t v14 = v13;
    }
    if (v14)
    {
      __int16 v15 = (std::__shared_weak_count *)a2[1];
      v23 = *a2;
      v24 = v15;
      if (v15) {
        atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      (*(void (**)(uint64_t, const char **))(v14 + 16))(v14, &v23);
      if (v24) {
        sub_1A4547114(v24);
      }
    }
    else
    {
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
      uint64_t v16 = qword_1EB30CE88;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *a2;
        if ((*a2)[23] < 0) {
          uint64_t v17 = *(const char **)v17;
        }
        *(_DWORD *)buf = 136315138;
        *(void *)int v29 = v17;
        _os_log_impl(&dword_1A4540000, v16, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled message %s", buf, 0xCu);
      }
    }
  }
}

void sub_1A4546964(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state)
{
}

uint64_t CLConnectionMessage::CLConnectionMessage(uint64_t a1, xpc_object_t xdict, void *a3)
{
  *(_OWORD *)(a1 + 40) = 0u;
  id v5 = (xpc_object_t *)(a1 + 40);
  *(unsigned char *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 72) = *a3;
  uint64_t v6 = a3[1];
  *(void *)(a1 + 80) = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  if (xpc_dictionary_get_string(xdict, "kCLConnectionMessageNameKey")) {
    MEMORY[0x1A625DAC0](a1);
  }
  int64_t int64 = xpc_dictionary_get_int64(xdict, "kCLConnectionMessageReplyHandlerIdentifierKey");
  if (int64) {
    *(void *)(a1 + 24) = int64;
  }
  *(unsigned char *)(a1 + 32) = xpc_dictionary_get_BOOL(xdict, "kCLConnectionMessageIsReplyingKey");
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kCLConnectionMessageInfoKey");
  *(void *)(a1 + 56) = value;
  id v9 = value;
  *(void *)(a1 + 64) = xpc_dictionary_get_value(xdict, "kCLConnectionMessageFileDescriptorKey");
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(xdict);
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  *(void *)(a1 + 48) = reply;
  if (reply || *(void *)(a1 + 24) && !*(unsigned char *)(a1 + 32)) {
    *id v5 = xpc_retain(remote_connection);
  }
  if (remote_connection)
  {
    if (!*(void *)(a1 + 72))
    {
      xpc_connection_get_audit_token();
      long long v12 = operator new(0x58uLL);
      v12[1] = 0;
      _DWORD v12[2] = 0;
      void *v12 = &unk_1EF7F4A40;
      *((_OWORD *)v12 + 3) = v15;
      *((_OWORD *)v12 + 4) = v16;
      v12[5] = 0;
      v12[4] = 0;
      v12[3] = v12 + 4;
      *((_DWORD *)v12 + 20) = 0;
      uint64_t v13 = *(std::__shared_weak_count **)(a1 + 80);
      *(void *)(a1 + 72) = v12 + 3;
      *(void *)(a1 + 80) = v12;
      if (v13) {
        sub_1A4547114(v13);
      }
    }
  }
  return a1;
}

void sub_1A4546B48(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(std::__shared_weak_count **)(v1 + 80);
  if (v3) {
    sub_1A4547114(v3);
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A4546CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_1A4546CC8(void *a1)
{
  uint64_t v1 = a1;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB30CF60, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EB30CF60))
  {
    operator new();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB30CF28);
  v1[2](v1, qword_1EB30CF58);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB30CF28);
}

void sub_1A4546D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A4546DC0(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = sub_1A4546FE0(*(void *)a2, *(void *)(a2 + 8), *(void *)(a1 + 40));
  if (!v3)
  {
    uint64_t v4 = sub_1A4551420();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      uint64_t v10 = &unk_1A45670B7;
      __int16 v11 = 2082;
      long long v12 = "assert";
      __int16 v13 = 2081;
      uint64_t v14 = "iter != selectorMap.end()";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"getInfoForSelector called on a missing selector\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    id v5 = sub_1A4551420();
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      uint64_t v10 = &unk_1A45670B7;
      __int16 v11 = 2082;
      long long v12 = "assert";
      __int16 v13 = 2081;
      uint64_t v14 = "iter != selectorMap.end()";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "getInfoForSelector called on a missing selector", "{\"msg%{public}.0s\":\"getInfoForSelector called on a missing selector\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    uint64_t v6 = sub_1A4551420();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      uint64_t v10 = &unk_1A45670B7;
      __int16 v11 = 2082;
      long long v12 = "assert";
      __int16 v13 = 2081;
      uint64_t v14 = "iter != selectorMap.end()";
      _os_log_impl(&dword_1A4540000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"getInfoForSelector called on a missing selector\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    abort_report_np();
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), (id)v3[3]);
}

void *sub_1A4546FE0(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!a2) {
    return 0;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69 * (((8 * a3) + 8) ^ HIDWORD(a3));
  unint64_t v4 = 0x9DDFEA08EB382D69 * (HIDWORD(a3) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= a2) {
      unint64_t v7 = v5 % a2;
    }
  }
  else
  {
    unint64_t v7 = v5 & (a2 - 1);
  }
  int v8 = *(void **)(a1 + 8 * v7);
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
        if (result[2] == a3) {
          return result;
        }
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= a2) {
            v10 %= a2;
          }
        }
        else
        {
          v10 &= a2 - 1;
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

void sub_1A4547114(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void *CLConnection::setInterruptionHandler(uint64_t a1, const void *a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  unint64_t v4 = *(const void **)(a1 + 48);
  if (v4) {
    _Block_release(v4);
  }
  uint64_t result = _Block_copy(a2);
  *(void *)(a1 + 48) = result;
  return result;
}

void *sub_1A45472F4(unsigned char *__dst, void *__src, unint64_t a3)
{
  unint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_1A4552A60();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *unint64_t v5 = v8;
    unint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

void CLConnectionServer::handleMessage(uint64_t a1, dispatch_queue_t *this, uint64_t *a3)
{
  if (this)
  {
    CLConnection::pause(this);
    CLConnection::resetAllHandlers(this);
    uint64_t v6 = *(void *)(a1 + 16);
    uint64_t v7 = (std::__shared_weak_count *)a3[1];
    uint64_t v9 = *a3;
    unint64_t v10 = v7;
    __int16 v11 = (CLConnection *)this;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    (*(void (**)(uint64_t, CLConnection **, uint64_t *))(v6 + 16))(v6, &v11, &v9);
    if (v10) {
      sub_1A4547114(v10);
    }
    int v8 = v11;
    __int16 v11 = 0;
    if (v8) {
      CLConnection::deferredDelete(v8);
    }
  }
}

void sub_1A4547434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, std::__shared_weak_count *a4, ...)
{
  va_start(va, a4);
  if (a4) {
    sub_1A4547114(a4);
  }
  sub_1A4550444((CLConnection **)va);
  _Unwind_Resume(a1);
}

uint64_t CLConnection::resetAllHandlers(dispatch_queue_t *this)
{
  dispatch_assert_queue_V2(this[1]);
  dispatch_queue_t v2 = this[5];
  if (v2)
  {
    _Block_release(v2);
    this[5] = 0;
  }
  dispatch_queue_t v3 = this[6];
  if (v3)
  {
    _Block_release(v3);
    this[6] = 0;
  }
  dispatch_queue_t v4 = this[7];
  if (v4)
  {
    _Block_release(v4);
    this[7] = 0;
  }
  dispatch_queue_t v5 = this[2];
  return [v5 removeAllObjects];
}

void CLConnection::pause(dispatch_queue_t *this)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(this[1]);
  if (*((unsigned char *)this + 72))
  {
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
    }
    dispatch_queue_t v2 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      int v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      unint64_t v10 = "assert";
      __int16 v11 = 2081;
      long long v12 = "!fPaused";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Cannot call pause() on a paused CLConnection.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
    }
    dispatch_queue_t v3 = qword_1EB30CE88;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE88))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      int v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      unint64_t v10 = "assert";
      __int16 v11 = 2081;
      long long v12 = "!fPaused";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot call pause() on a paused CLConnection.", "{\"msg%{public}.0s\":\"Cannot call pause() on a paused CLConnection.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
    }
    dispatch_queue_t v4 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      int v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      unint64_t v10 = "assert";
      __int16 v11 = 2081;
      long long v12 = "!fPaused";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Cannot call pause() on a paused CLConnection.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  xpc_connection_suspend((xpc_connection_t)*this);
  *((unsigned char *)this + 72) = 1;
}

void CLConnectionServer::handleConnection()
{
}

void sub_1A45478A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15)
{
  if (a15) {
    std::__shared_weak_count::__release_weak(a15);
  }
  if (v15) {
    std::__shared_weak_count::__release_weak(v15);
  }
  _Unwind_Resume(exception_object);
}

void *CLConnection::setDisconnectionHandler(uint64_t a1, const void *a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  dispatch_queue_t v4 = *(const void **)(a1 + 40);
  if (v4) {
    _Block_release(v4);
  }
  uint64_t result = _Block_copy(a2);
  *(void *)(a1 + 40) = result;
  return result;
}

void CLConnection::start(dispatch_queue_t *this)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(this[1]);
  if (!*((unsigned char *)this + 72))
  {
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
    }
    dispatch_queue_t v2 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      int v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      unint64_t v10 = "assert";
      __int16 v11 = 2081;
      long long v12 = "fPaused";
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Cannot call start() on an unpaused CLConnection.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
    }
    dispatch_queue_t v3 = qword_1EB30CE88;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE88))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      int v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      unint64_t v10 = "assert";
      __int16 v11 = 2081;
      long long v12 = "fPaused";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot call start() on an unpaused CLConnection.", "{\"msg%{public}.0s\":\"Cannot call start() on an unpaused CLConnection.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
    }
    dispatch_queue_t v4 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      int v8 = &unk_1A45670B7;
      __int16 v9 = 2082;
      unint64_t v10 = "assert";
      __int16 v11 = 2081;
      long long v12 = "fPaused";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Cannot call start() on an unpaused CLConnection.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  xpc_connection_resume((xpc_connection_t)*this);
  *((unsigned char *)this + 72) = 0;
}

void *CLConnection::setDefaultMessageHandler(uint64_t a1, const void *a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  dispatch_queue_t v4 = *(const void **)(a1 + 56);
  if (v4) {
    _Block_release(v4);
  }
  uint64_t result = _Block_copy(a2);
  *(void *)(a1 + 56) = result;
  return result;
}

uint64_t CLConnection::CLConnection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *(void *)(a1 + 24) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 64) = 0;
  *(_WORD *)(a1 + 72) = 257;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(void *)(a1 + 112) = 0;
  xpc_retain(*(xpc_object_t *)a1);
  xpc_connection_set_target_queue(*(xpc_connection_t *)a1, *(dispatch_queue_t *)(a1 + 8));
  CLConnection::initializeConnection_nl((dispatch_queue_t *)a1);
  return a1;
}

void sub_1A4547C64(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 119) < 0) {
    operator delete(*(void **)(v1 + 96));
  }
  dispatch_queue_t v3 = *(std::__shared_weak_count **)(v1 + 88);
  if (v3) {
    sub_1A4547114(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CLConnection::CLConnection(uint64_t a1, const char *a2, uint64_t a3)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *(void *)(a1 + 24) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 64) = 0;
  *(_WORD *)(a1 + 72) = 1;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(void *)(a1 + 112) = 0;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  *(void *)a1 = xpc_connection_create_mach_service(a2, *(dispatch_queue_t *)(a1 + 8), 0);
  CLConnection::initializeConnection_nl((dispatch_queue_t *)a1);
  return a1;
}

void sub_1A4547D20(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 119) < 0) {
    operator delete(*(void **)(v1 + 96));
  }
  dispatch_queue_t v3 = *(std::__shared_weak_count **)(v1 + 88);
  if (v3) {
    sub_1A4547114(v3);
  }
  _Unwind_Resume(exception_object);
}

void CLConnection::initializeConnection_nl(dispatch_queue_t *this)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(this[1]);
  dispatch_queue_t v2 = this[1];
  if (!v2)
  {
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
    }
    __int16 v9 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
    {
      *(void *)handler = 68289539;
      *(_WORD *)&handler[8] = 2082;
      *(void *)&handler[10] = &unk_1A45670B7;
      *(_WORD *)&handler[18] = 2082;
      *(void *)&handler[20] = "assert";
      *(_WORD *)&handler[28] = 2081;
      *(void *)&handler[30] = "fEventQueue";
      _os_log_impl(&dword_1A4540000, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CLConnections must always have event queues\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", handler, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
    }
    unint64_t v10 = qword_1EB30CE88;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE88))
    {
      *(void *)handler = 68289539;
      *(_WORD *)&handler[8] = 2082;
      *(void *)&handler[10] = &unk_1A45670B7;
      *(_WORD *)&handler[18] = 2082;
      *(void *)&handler[20] = "assert";
      *(_WORD *)&handler[28] = 2081;
      *(void *)&handler[30] = "fEventQueue";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLConnections must always have event queues", "{\"msg%{public}.0s\":\"CLConnections must always have event queues\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", handler, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
    }
    __int16 v11 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_INFO))
    {
      *(void *)handler = 68289539;
      *(_WORD *)&handler[8] = 2082;
      *(void *)&handler[10] = &unk_1A45670B7;
      *(_WORD *)&handler[18] = 2082;
      *(void *)&handler[20] = "assert";
      *(_WORD *)&handler[28] = 2081;
      *(void *)&handler[30] = "fEventQueue";
      _os_log_impl(&dword_1A4540000, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CLConnections must always have event queues\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", handler, 0x26u);
    }
    abort_report_np();
    __break(1u);
  }
  dispatch_retain(v2);
  xpc_connection_set_context((xpc_connection_t)*this, this);
  xpc_connection_set_finalizer_f((xpc_connection_t)*this, (xpc_finalizer_t)CLConnection::connectionFinalizer);
  v13[4] = this;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1A4544888;
  v14[3] = &unk_1E5B3EA00;
  v14[4] = this;
  v12[4] = this;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1A4557F30;
  v13[3] = &unk_1E5B3E9B8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  _DWORD v12[2] = sub_1A454E2F0;
  v12[3] = &unk_1E5B3E9B8;
  dispatch_queue_t v3 = *this;
  dispatch_queue_t v4 = this[10];
  dispatch_queue_t v5 = (std::__shared_weak_count *)this[11];
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 1;
  *(void *)handler = MEMORY[0x1E4F143A8];
  *(void *)&handler[8] = 3321888768;
  *(void *)&handler[16] = sub_1A45445A0;
  *(void *)&handler[24] = &unk_1EF7F4DF8;
  *(void *)&handler[32] = v13;
  v19 = v12;
  v21 = v16;
  dispatch_queue_t v22 = v4;
  v23 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v20 = v14;
  xpc_connection_set_event_handler((xpc_connection_t)v3, handler);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A45489CC;
  aBlock[3] = &unk_1E5B3EA28;
  aBlock[4] = v16;
  this[8] = (dispatch_queue_t)_Block_copy(aBlock);
  if (v23) {
    sub_1A4547114(v23);
  }
  _Block_object_dispose(v16, 8);
  if (v5) {
    sub_1A4547114(v5);
  }
  dispatch_assert_queue_V2(this[1]);
  xpc_connection_get_audit_token();
  int v6 = operator new(0x58uLL);
  v6[1].isa = 0;
  v6[2].isa = 0;
  v6->isa = (Class)&unk_1EF7F4A40;
  long long v7 = *(_OWORD *)&handler[16];
  *(_OWORD *)&v6[6].isa = *(_OWORD *)handler;
  *(_OWORD *)&v6[8].isa = v7;
  v6[5].isa = 0;
  v6[4].isa = 0;
  v6[3].isa = (Class)&v6[4];
  LODWORD(v6[10].isa) = 0;
  int v8 = (std::__shared_weak_count *)this[11];
  this[10] = v6 + 3;
  this[11] = v6;
  if (v8) {
    sub_1A4547114(v8);
  }
}

void sub_1A4548238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v36 = *(std::__shared_weak_count **)(v34 - 120);
  if (v36) {
    sub_1A4547114(v36);
  }
  _Block_object_dispose(&a33, 8);
  if (v33) {
    sub_1A4547114(v33);
  }
  _Unwind_Resume(a1);
}

uint64_t CLConnection::setHandlerForMessage(uint64_t a1, uint64_t a2, void *a3)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  uint64_t result = [*(id *)(a1 + 16) removeObjectForKey:a2];
  if (a3)
  {
    id v7 = (id)[a3 copy];
    int v8 = *(void **)(a1 + 16);
    return [v8 setObject:v7 forKeyedSubscript:a2];
  }
  return result;
}

void sub_1A45482F4(char *a1)
{
  if (a1)
  {
    sub_1A45482F4(*(void *)a1);
    sub_1A45482F4(*((void *)a1 + 1));
    if (a1[55] < 0) {
      operator delete(*((void **)a1 + 4));
    }
    operator delete(a1);
  }
}

void sub_1A4548350(uint64_t a1)
{
}

void sub_1A454835C(uint64_t a1)
{
}

void *sub_1A4548364(const char *a1, void *a2, void *a3, int64_t a4, BOOL a5)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  xpc_object_t v9 = xpc_string_create(a1);
  *(_OWORD *)keys = xmmword_1E5B3EA48;
  v13[0] = v9;
  v13[1] = a2;
  xpc_object_t v10 = xpc_dictionary_create((const char *const *)keys, v13, 2uLL);
  __int16 v11 = v10;
  if (a3) {
    xpc_dictionary_set_value(v10, "kCLConnectionMessageFileDescriptorKey", a3);
  }
  if (a4) {
    xpc_dictionary_set_int64(v11, "kCLConnectionMessageReplyHandlerIdentifierKey", a4);
  }
  xpc_dictionary_set_BOOL(v11, "kCLConnectionMessageIsReplyingKey", a5);
  if (v9) {
    xpc_release(v9);
  }
  return v11;
}

void sub_1A4548464(uint64_t a1, uint64_t *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  int v6 = sub_1A4548530;
  id v7 = &unk_1EF7F4B78;
  uint64_t v3 = *a2;
  dispatch_queue_t v2 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = v3;
  xpc_object_t v10 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 && *(void *)(v4 + 8) != -1) {
    v6(v5);
  }
  if (v10) {
    sub_1A4547114(v10);
  }
}

void sub_1A4548518(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1A4547114(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A4548530(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  uint64_t v5 = v4;
  int v6 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t *))(v2 + 16))(v2, &v5);
  if (v6) {
    sub_1A4547114(v6);
  }
}

void sub_1A4548590(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1A4547114(a10);
  }
  _Unwind_Resume(exception_object);
}

void CLConnection::deferredDelete(CLConnection *this)
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)this + 1));
  if (*((unsigned char *)this + 72)) {
    CLConnection::start((dispatch_queue_t *)this);
  }
  CLConnection::resetAllHandlers((dispatch_queue_t *)this);
  uint64_t v2 = *((void *)this + 8);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    _Block_release(*((const void **)this + 8));
    *((void *)this + 8) = 0;
  }
  dispatch_queue_t v3 = *(dispatch_queue_t *)this;
  if (*(void *)this)
  {
    barrier[0] = MEMORY[0x1E4F143A8];
    barrier[1] = 3221225472;
    barrier[2] = sub_1A454AEC8;
    barrier[3] = &unk_1E5B3E9B8;
    barrier[4] = this;
    xpc_connection_send_barrier((xpc_connection_t)v3, barrier);
  }
}

void CLConnection::handleDisconnection(dispatch_queue_t *this)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(this[1]);
  uint64_t v2 = _os_activity_create(&dword_1A4540000, "CL: CLConnection::handleDisconnection", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v5);

  if (qword_1EB30CE90 != -1) {
    dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
  }
  dispatch_queue_t v3 = qword_1EB30CE88;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v7 = 0;
    __int16 v8 = 2082;
    uint64_t v9 = &unk_1A45670B7;
    __int16 v10 = 2082;
    __int16 v11 = "activity";
    _os_log_impl(&dword_1A4540000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLConnection::handleDisconnection\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  CLConnection::resetReplyHandlers((CLConnection *)this);
  dispatch_queue_t v4 = this[5];
  if (v4) {
    ((void (*)(void))v4[2].isa)();
  }
  os_activity_scope_leave(&v5);
}

void sub_1A45487B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

uint64_t CLConnection::resetReplyHandlers(CLConnection *this)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = (void *)*((void *)this + 3);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*((id *)this + 3) objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        uint64_t v8 = 0;
        uint64_t v9 = 0;
        (*(void (**)(uint64_t, uint64_t *))(v6 + 16))(v6, &v8);
        if (v9) {
          sub_1A4547114(v9);
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
  return [*((id *)this + 3) removeAllObjects];
}

void sub_1A45488D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1A4547114(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A45488F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 24);
  uint64_t v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A4542324;
  v8[3] = &unk_1E5B3EBC0;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = v2;
  [v4 async:v8];
  uint64_t v6 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = 0;

  int v7 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;
}

uint64_t sub_1A45489CC(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

void sub_1A45489E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _Block_copy(*(const void **)(a1 + 48));
  [v3 setTarget:v4];

  [v3 retainArguments];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A4542398;
  v7[3] = &unk_1E5B3EB70;
  id v5 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v6 = v3;
  id v9 = v6;
  [v5 async:v7];
}

void sub_1A4548AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A4548AEC(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    id v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 24;
        sub_1A45493B4(v4);
      }
      while ((void *)v4 != v2);
      id v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1A4548B70(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 32);
  id v3 = *(unsigned __int8 ***)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
    int v4 = *(unsigned __int8 *)(a1 + 64);
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  else
  {
    int v4 = *(unsigned __int8 *)(a1 + 64);
  }
  v8[0] = v3;
  v8[1] = (unsigned __int8 **)v2;
  sub_1A4548C74((uint64_t)v1, v8, v4 != 0, 0);
  if (v2)
  {
    sub_1A4547114((std::__shared_weak_count *)v2);
    uint64_t v5 = *v1;
    if (!*v1) {
      goto LABEL_11;
    }
    id v6 = v3;
    uint64_t v7 = v2;
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v5 = *v1;
    if (!*v1) {
      return;
    }
    id v6 = v3;
    uint64_t v7 = 0;
  }
  CLConnection::sendMessage(v5, (uint64_t)&v6);
  if (!v2) {
    return;
  }
  sub_1A4547114((std::__shared_weak_count *)v2);
LABEL_11:
  sub_1A4547114((std::__shared_weak_count *)v2);
}

void sub_1A4548C50(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    sub_1A4547114(v1);
    sub_1A4547114(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A4548C74(uint64_t a1, unsigned __int8 ***a2, int a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (*(void *)a1)
  {
    id v9 = *(const void ****)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    if (v9 == (const void ***)v8)
    {
LABEL_20:
      if (a3) {
        goto LABEL_36;
      }
      return;
    }
    uint64_t v10 = *a2;
    int v11 = *((char *)*a2 + 23);
    if (v11 >= 0) {
      long long v12 = (unsigned __int8 *)*((unsigned __int8 *)*a2 + 23);
    }
    else {
      long long v12 = (*a2)[1];
    }
    while (1)
    {
      long long v13 = *v9;
      uint64_t v14 = *((unsigned __int8 *)*v9 + 23);
      if ((v14 & 0x80u) == 0) {
        uint64_t v15 = (unsigned __int8 *)*((unsigned __int8 *)*v9 + 23);
      }
      else {
        uint64_t v15 = (unsigned __int8 *)(*v9)[1];
      }
      if (v15 == v12)
      {
        if (v11 >= 0) {
          long long v16 = (unsigned __int8 *)v10;
        }
        else {
          long long v16 = *v10;
        }
        if ((v14 & 0x80) != 0)
        {
          if (!memcmp(*v13, v16, (size_t)(*v9)[1]))
          {
LABEL_28:
            dispatch_queue_t v22 = v9 + 3;
            if (v9 + 3 != (const void ***)v8)
            {
              do
              {
                long long v23 = *(_OWORD *)v22;
                NSObject *v22 = 0;
                v22[1] = 0;
                uint64_t v24 = (std::__shared_weak_count *)*(v22 - 2);
                *(_OWORD *)(v22 - 3) = v23;
                if (v24) {
                  sub_1A4547114(v24);
                }
                v25 = *(v22 - 1);
                *(v22 - 1) = v22[2];
                v22[2] = 0;

                v22 += 3;
              }
              while (v22 != (const void ***)v8);
              uint64_t v8 = *(void *)(a1 + 56);
              id v9 = v22 - 3;
            }
            while ((const void ***)v8 != v9)
            {
              v8 -= 24;
              sub_1A45493B4(v8);
            }
            *(void *)(a1 + 56) = v9;
            if (a3)
            {
LABEL_36:
              uint64_t v26 = *a2;
              if ((*a2)[6])
              {
                if (qword_1EB30CE90 != -1) {
                  dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
                }
                v27 = qword_1EB30CE88;
                if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
                {
                  v28 = *a2;
                  if (*((char *)*a2 + 23) < 0) {
                    v28 = (unsigned __int8 **)**a2;
                  }
                  *(void *)int v37 = 68289282;
                  *(_WORD *)&v37[8] = 2082;
                  *(void *)&v37[10] = &unk_1A45670B7;
                  *(_WORD *)&v37[18] = 2082;
                  *(void *)&v37[20] = v28;
                  _os_log_impl(&dword_1A4540000, v27, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Trying to cache a reply message\", \"messageName\":%{public, location:escape_only}s}", v37, 0x1Cu);
                  if (qword_1EB30CE90 != -1) {
                    dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
                  }
                }
                int v29 = qword_1EB30CE88;
                if (os_signpost_enabled((os_log_t)qword_1EB30CE88))
                {
                  __int16 v30 = *a2;
                  if (*((char *)*a2 + 23) < 0) {
                    __int16 v30 = (unsigned __int8 **)**a2;
                  }
                  *(void *)int v37 = 68289282;
                  *(_WORD *)&v37[8] = 2082;
                  *(void *)&v37[10] = &unk_1A45670B7;
                  *(_WORD *)&v37[18] = 2082;
                  *(void *)&v37[20] = v30;
                  _os_signpost_emit_with_name_impl(&dword_1A4540000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Trying to cache a reply message", "{\"msg%{public}.0s\":\"Trying to cache a reply message\", \"messageName\":%{public, location:escape_only}s}", v37, 0x1Cu);
                }
              }
              else if (a4)
              {
                v33 = (void *)[a4 copy];
                uint64_t v34 = v33;
                int v35 = a2[1];
                *(void *)int v37 = *a2;
                *(void *)&v37[8] = v35;
                if (v35) {
                  atomic_fetch_add_explicit((atomic_ullong *volatile)v35 + 1, 1uLL, memory_order_relaxed);
                }
                *(void *)&v37[16] = v33;
                sub_1A45491B4((void *)(a1 + 48), (uint64_t)v37);

                if (*(void *)&v37[8]) {
                  sub_1A4547114(*(std::__shared_weak_count **)&v37[8]);
                }
              }
              else
              {
                uint64_t v36 = a2[1];
                if (v36) {
                  atomic_fetch_add_explicit((atomic_ullong *volatile)v36 + 1, 1uLL, memory_order_relaxed);
                }
                *(void *)int v37 = v26;
                *(void *)&v37[8] = v36;
                *(void *)&v37[16] = 0;
                sub_1A45491B4((void *)(a1 + 48), (uint64_t)v37);

                if (*(void *)&v37[8]) {
                  sub_1A4547114(*(std::__shared_weak_count **)&v37[8]);
                }
              }
              return;
            }
            if (qword_1EB30CE90 != -1) {
              dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
            }
            uint64_t v31 = qword_1EB30CE88;
            if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v32 = *a2;
              if (*((char *)*a2 + 23) < 0) {
                __int16 v32 = (unsigned __int8 **)**a2;
              }
              *(_DWORD *)int v37 = 136446210;
              *(void *)&v37[4] = v32;
              v19 = "#Warning Sending an un-cached message '%{public}s' without first clearing the previously cached value";
              v20 = v31;
              uint32_t v21 = 12;
LABEL_54:
              _os_log_impl(&dword_1A4540000, v20, OS_LOG_TYPE_DEFAULT, v19, v37, v21);
              return;
            }
            return;
          }
        }
        else
        {
          if (!*((unsigned char *)*v9 + 23)) {
            goto LABEL_28;
          }
          while (*(unsigned __int8 *)v13 == *v16)
          {
            long long v13 = (const void **)((char *)v13 + 1);
            ++v16;
            if (!--v14) {
              goto LABEL_28;
            }
          }
        }
      }
      v9 += 3;
      if (v9 == (const void ***)v8) {
        goto LABEL_20;
      }
    }
  }
  if (qword_1EB30CE90 != -1) {
    dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
  }
  uint64_t v17 = qword_1EB30CE88;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *a2;
    if (*((char *)*a2 + 23) < 0) {
      v18 = (unsigned __int8 **)**a2;
    }
    *(void *)int v37 = 68289282;
    *(_WORD *)&v37[8] = 2082;
    *(void *)&v37[10] = &unk_1A45670B7;
    *(_WORD *)&v37[18] = 2082;
    *(void *)&v37[20] = v18;
    v19 = "{\"msg%{public}.0s\":\"No connection fConnection\", \"messageName\":%{public, location:escape_only}s}";
    v20 = v17;
    uint32_t v21 = 28;
    goto LABEL_54;
  }
}

void sub_1A4549138(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_1A4550334(exception_object);
}

void *sub_1A45491B4(void *result, uint64_t a2)
{
  id v3 = (char **)result;
  unint64_t v4 = result[2];
  unint64_t v5 = result[1];
  if (v5 >= v4)
  {
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *result) >> 3);
    unint64_t v8 = v7 + 1;
    if (v7 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_1A455BCEC();
    }
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - *result) >> 3);
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x555555555555555) {
      unint64_t v8 = 0xAAAAAAAAAAAAAAALL;
    }
    dispatch_queue_t v22 = result + 2;
    if (v8 > 0xAAAAAAAAAAAAAAALL) {
      sub_1A4552B08();
    }
    uint64_t v10 = 3 * v8;
    int v11 = (char *)operator new(24 * v8);
    long long v12 = &v11[24 * v7];
    v19 = v11;
    v20.i64[0] = (uint64_t)v12;
    long long v13 = &v11[8 * v10];
    *(_OWORD *)long long v12 = *(_OWORD *)a2;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *((void *)v12 + 2) = *(void *)(a2 + 16);
    *(void *)(a2 + 16) = 0;
    id v6 = v12 + 24;
    v20.i64[1] = (uint64_t)(v12 + 24);
    uint32_t v21 = v13;
    uint64_t v15 = *v3;
    unint64_t v14 = (unint64_t)v3[1];
    if ((char *)v14 == *v3)
    {
      int64x2_t v17 = vdupq_n_s64(v14);
    }
    else
    {
      uint64_t v16 = 0;
      do
      {
        sub_1A4549404(&v12[v16 - 24], v14 + v16 - 24);
        v16 -= 24;
      }
      while ((char *)(v14 + v16) != v15);
      int64x2_t v17 = *(int64x2_t *)v3;
      v12 += v16;
      id v6 = (char *)v20.i64[1];
      long long v13 = v21;
    }
    NSObject *v3 = v12;
    v3[1] = v6;
    int64x2_t v20 = v17;
    v18 = v3[2];
    v3[2] = v13;
    uint32_t v21 = v18;
    v19 = (char *)v17.i64[0];
    uint64_t result = (void *)sub_1A4549364((uint64_t)&v19);
  }
  else
  {
    *(_OWORD *)unint64_t v5 = *(_OWORD *)a2;
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(v5 + 16) = 0;
    *(void *)(v5 + 16) = *(void *)(a2 + 16);
    *(void *)(a2 + 16) = 0;
    id v6 = (char *)(v5 + 24);
    result[1] = v5 + 24;
  }
  v3[1] = v6;
  return result;
}

uint64_t sub_1A4549364(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 24;
    sub_1A45493B4(i - 24);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_1A45493B4(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    sub_1A4547114(v2);
  }
}

void *sub_1A4549404(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  a1[2] = 0;
  a1[2] = *(id *)(a2 + 16);
  return a1;
}

void sub_1A4549450(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    sub_1A4547114(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1A4549468(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareAndRunBlock:*(void *)(a1 + 40)];
}

void CLProfilingIdentify(uint64_t a1)
{
  if (qword_1EB30CFF8 != -1) {
    dispatch_once(&qword_1EB30CFF8, &unk_1EF7F5180);
  }
  if (byte_1EB30CFE0)
  {
    uint64_t v2 = (void (*)(uint64_t))off_1EC387EA8;
    v2(a1);
  }
}

void sub_1A45494F8(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 64);
  if (v1) {
    sub_1A4547114(v1);
  }
}

uint64_t sub_1A4549508(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 64);
  *(void *)(result + 56) = *(void *)(a2 + 56);
  *(void *)(result + 64) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1A4549528(void *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3321888768;
  unint64_t v4 = sub_1A45495EC;
  unint64_t v5 = &unk_1EF7F4AD8;
  uint64_t v1 = (std::__shared_weak_count *)a1[7];
  uint64_t v6 = a1[6];
  unint64_t v7 = v1;
  if (v1) {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v2 = a1[5];
  if (v2 && *(void *)(v2 + 8) != -1) {
    v4((uint64_t)v3);
  }
  if (v7) {
    sub_1A4547114(v7);
  }
}

void sub_1A45495D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    sub_1A4547114(a14);
  }
  _Unwind_Resume(exception_object);
}

os_unfair_lock_s *sub_1A45495EC(uint64_t a1)
{
  return sub_1A45495F4(*(os_unfair_lock_s **)(a1 + 32));
}

os_unfair_lock_s *sub_1A45495F4(os_unfair_lock_s *result)
{
  if (!*(void *)&result->_os_unfair_lock_opaque)
  {
    uint64_t v1 = result;
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
    }
    uint64_t v2 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_DEBUG, "Creating connection", buf, 2u);
    }
    os_unfair_lock_lock(v1 + 25);
    operator new();
  }
  return result;
}

void sub_1A45497F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  MEMORY[0x1A625DBC0](v24, 0x10B2C40D4E86D64);
  _Unwind_Resume(a1);
}

void sub_1A4549834(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _os_activity_create(&dword_1A4540000, "CL: Sending cached messages to daemon", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &state);

  if (qword_1EB30CE90 != -1) {
    dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
  }
  uint64_t v3 = qword_1EB30CE88;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289282;
    *(_WORD *)uint64_t v16 = 2082;
    *(void *)&v16[2] = &unk_1A45670B7;
    *(_WORD *)&v16[10] = 2082;
    *(void *)&v16[12] = "activity";
    _os_log_impl(&dword_1A4540000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Sending cached messages to daemon\", \"event\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  uint64_t v4 = *(void *)(a1 + 48);
  for (uint64_t i = *(void *)(a1 + 56); v4 != i; v4 += 24)
  {
    sub_1A4549404(&buf, v4);
    sub_1A4549404(&v9, (uint64_t)&buf);
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    uint64_t v6 = *(void *)a1;
    if (*(void *)a1)
    {
      id v7 = v11;
      if (v11)
      {
        long long v13 = v9;
        unint64_t v14 = v10;
        if (v10)
        {
          atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
          id v7 = v11;
        }
        CLConnection::sendMessage(v6, &v13, v7);
        unint64_t v8 = v14;
      }
      else
      {
        unint64_t v8 = v10;
        long long v13 = v9;
        unint64_t v14 = v10;
        if (v10) {
          atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        CLConnection::sendMessage(v6, (uint64_t)&v13);
      }
      if (v8) {
        sub_1A4547114(v8);
      }
    }

    if (v10) {
      sub_1A4547114(v10);
    }

    if (*(void *)v16) {
      sub_1A4547114(*(std::__shared_weak_count **)v16);
    }
  }
  os_activity_scope_leave(&state);
}

void sub_1A4549A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_1A4549AA8(void *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3321888768;
  uint64_t v4 = sub_1A4549B74;
  unint64_t v5 = &unk_1EF7F4BB0;
  uint64_t v1 = (std::__shared_weak_count *)a1[8];
  uint64_t v7 = a1[7];
  unint64_t v8 = v1;
  if (v1) {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = a1[4];
  uint64_t v2 = a1[6];
  if (v2 && *(void *)(v2 + 8) != -1) {
    v4((uint64_t)v3);
  }
  if (v8) {
    sub_1A4547114(v8);
  }
}

void sub_1A4549B5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1A4547114(a16);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1A4549B74(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(const void **)(v2 + 32);
  *(void *)(v2 + 32) = _Block_copy(v1);
  if (v3) {
    _Block_release(v3);
  }
  uint64_t result = *(void **)v2;
  if (*(void *)v2)
  {
    return CLConnection::setInterruptionHandler((uint64_t)result, v1);
  }
  return result;
}

void sub_1A4549BE4(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    sub_1A4547114(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void *sub_1A4549C34(void *result, void *a2)
{
  uint64_t v2 = a2[7];
  result[6] = a2[6];
  result[7] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[9];
  result[8] = a2[8];
  result[9] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void *sub_1A4549C68(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[8];
  result[7] = a2[7];
  result[8] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t sub_1A4549C9C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1A4549CC8(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 56);
  if (v2) {
    sub_1A4547114(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 40);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

uint64_t sub_1A4549D18(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 72);
  *(void *)(result + 64) = *(void *)(a2 + 64);
  *(void *)(result + 72) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void *sub_1A4549D34(void *result, void *a2)
{
  uint64_t v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[7];
  result[6] = a2[6];
  result[7] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1A4549E2C(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 56);
  if (v2) {
    sub_1A4547114(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 40);
  if (v3)
  {
    sub_1A4547114(v3);
  }
}

void *sub_1A4549E7C(void *result, void *a2)
{
  uint64_t v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[7];
  result[6] = a2[6];
  result[7] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1A4549EB0(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  if (v2) {
    sub_1A4547114(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_1A4549F00(void *a1, uint64_t *a2)
{
  uint64_t v2 = a1[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3321888768;
  uint64_t v7 = sub_1A4549FD0;
  unint64_t v8 = &unk_1EF7F4CE8;
  uint64_t v3 = a1[7];
  uint64_t v9 = v2;
  uint64_t v10 = v3;
  uint64_t v4 = (std::__shared_weak_count *)a2[1];
  uint64_t v11 = *a2;
  long long v12 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = a1[6];
  if (v5 && *(void *)(v5 + 8) != -1) {
    v7(v6);
  }
  if (v12) {
    sub_1A4547114(v12);
  }
}

void sub_1A4549FB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1A4547114(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A4549FD0(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (dispatch_queue_t *)a1[5];
  uint64_t v4 = (std::__shared_weak_count *)a1[7];
  v5[0] = a1[6];
  v5[1] = (uint64_t)v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnectionServer::handleMessage(v2, v3, v5);
  if (v4)
  {
    sub_1A4547114(v4);
  }
}

void sub_1A454A048(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_1A4547114(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A454A060(void *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3321888768;
  uint64_t v4 = sub_1A454A124;
  uint64_t v5 = &unk_1EF7F4AD8;
  uint64_t v1 = (std::__shared_weak_count *)a1[7];
  uint64_t v6 = a1[6];
  uint64_t v7 = v1;
  if (v1) {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v2 = a1[5];
  if (v2 && *(void *)(v2 + 8) != -1) {
    v4((uint64_t)v3);
  }
  if (v7) {
    sub_1A4547114(v7);
  }
}

void sub_1A454A10C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    sub_1A4547114(a14);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A454A124(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
  if (!*(unsigned char *)(v1 + 97))
  {
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
    }
    uint64_t v3 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      uint64_t v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      uint64_t v11 = "assert";
      __int16 v12 = 2081;
      long long v13 = "fPaused";
      _os_log_impl(&dword_1A4540000, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Cannot call start() on an unpaused CLConnectionClient\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
      }
    }
    uint64_t v4 = qword_1EB30CE88;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE88))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      uint64_t v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      uint64_t v11 = "assert";
      __int16 v12 = 2081;
      long long v13 = "fPaused";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot call start() on an unpaused CLConnectionClient", "{\"msg%{public}.0s\":\"Cannot call start() on an unpaused CLConnectionClient\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
      }
    }
    uint64_t v5 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      uint64_t v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      uint64_t v11 = "assert";
      __int16 v12 = 2081;
      long long v13 = "fPaused";
      _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Cannot call start() on an unpaused CLConnectionClient\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  *(unsigned char *)(v1 + 97) = 0;
  uint64_t v2 = *(dispatch_queue_t **)v1;
  if (*(void *)v1)
  {
    CLConnection::start(v2);
  }
}

uint64_t CLConnectionMessage::getObjectOfClasses(CLConnectionMessage *this, NSSet *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)*((void *)this + 7);
  if (!v3) {
    return 0;
  }
  bytes_ptr = xpc_data_get_bytes_ptr(v3);
  size_t length = xpc_data_get_length(*((xpc_object_t *)this + 7));
  if (bytes_ptr) {
    bytes_ptr = (const void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:bytes_ptr length:length];
  }
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:bytes_ptr error:0];
  uint64_t v11 = 0;
  uint64_t v8 = [v7 decodeTopLevelObjectOfClasses:a2 forKey:*MEMORY[0x1E4F284E8] error:&v11];

  if (v11)
  {
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
    }
    uint64_t v9 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 138477827;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1A4540000, v9, OS_LOG_TYPE_FAULT, "The received data object is invalid: %{private}@", buf, 0xCu);
    }
  }
  return v8;
}

uint64_t CLConnectionMessage::getDictionaryOfClasses(CLConnectionMessage *this, NSSet *a2)
{
  if (qword_1EB30D020 != -1) {
    dispatch_once(&qword_1EB30D020, &unk_1EF7F5160);
  }
  uint64_t v4 = (NSSet *)[(id)qword_1EB30D018 setByAddingObjectsFromSet:a2];
  return CLConnectionMessage::getObjectOfClasses(this, v4);
}

void sub_1A454A618(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_1A454A628(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3321888768;
  uint64_t v4 = sub_1A454A6F4;
  uint64_t v5 = &unk_1EF7F4C88;
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = v1;
  if (v1) {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v6 = *(_OWORD *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 && *(void *)(v2 + 8) != -1) {
    v4((uint64_t)v3);
  }
  if (v8) {
    sub_1A4547114(v8);
  }
}

void sub_1A454A6DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1A4547114(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1A454A6F4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(v2 + 16), "setObject:forKeyedSubscript:", (id)objc_msgSend(*(id *)(a1 + 40), "copy"), v3);
    uint64_t result = *(void *)v2;
    if (*(void *)v2)
    {
      return CLConnection::setHandlerForMessage(result, v3, v1);
    }
  }
  else
  {
    uint64_t v5 = *(void **)(v2 + 16);
    return [v5 removeObjectForKey:v3];
  }
  return result;
}

uint64_t sub_1A454A8FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareAndRunBlock:*(void *)(a1 + 40)];
}

BOOL CLConnection::isEntitled(uint64_t a1, uint64_t *a2)
{
  return CLConnectionEntitlementCache::isEntitled(*(uint64_t ***)(a1 + 80), a2);
}

void sub_1A454A968(void *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3321888768;
  uint64_t v4 = sub_1A454AA34;
  uint64_t v5 = &unk_1EF7F4BB0;
  uint64_t v1 = (std::__shared_weak_count *)a1[8];
  uint64_t v7 = a1[7];
  uint64_t v8 = v1;
  if (v1) {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = a1[4];
  uint64_t v2 = a1[6];
  if (v2 && *(void *)(v2 + 8) != -1) {
    v4((uint64_t)v3);
  }
  if (v8) {
    sub_1A4547114(v8);
  }
}

void sub_1A454AA1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1A4547114(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A454AA34(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  uint64_t v2 = *(uint64_t **)(a1 + 40);
  uint64_t v3 = (const void *)v2[3];
  v2[3] = (uint64_t)_Block_copy(v1);
  if (*v2) {
    CLConnection::setDefaultMessageHandler(*v2, v1);
  }
  if (v3)
  {
    _Block_release(v3);
  }
}

uint64_t sub_1A454AAA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareAndRunBlock:*(void *)(a1 + 40)];
}

void sub_1A454AAB0(uint64_t a1)
{
  v11[0] = 0;
  v11[1] = 0;
  uint64_t v12 = 0;
  sub_1A454AC4C();
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (v14 >= 0) {
    p_p = (const char *)&__p;
  }
  else {
    p_p = (const char *)__p;
  }
  CFStringRef v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], p_p, 4u);
  if (v4)
  {
    CFURLRef v5 = CFURLCreateWithFileSystemPath(v2, v4, kCFURLPOSIXPathStyle, 0);
    if (v5)
    {
      CFURLRef v6 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
      if (v6)
      {
        uint64_t v7 = CFBundleCreate(v2, v6);
        uint64_t v8 = v7;
        if (v7)
        {
          Identifier = (__CFString *)CFBundleGetIdentifier(v7);
          if (Identifier) {
            MEMORY[0x1A625DAC0](v11, [(__CFString *)Identifier UTF8String]);
          }
          CFRelease(v8);
        }
        CFRelease(v6);
      }
      CFRelease(v5);
    }
    CFRelease(v4);
  }
  if (v14 < 0) {
    operator delete(__p);
  }
  __int16 v10 = (void *)HIBYTE(v12);
  if (v12 < 0) {
    __int16 v10 = v11[1];
  }
  if (v10)
  {
    *(_OWORD *)a1 = *(_OWORD *)v11;
    *(void *)(a1 + 16) = v12;
  }
  else
  {
    sub_1A454AC4C();
    if (SHIBYTE(v12) < 0) {
      operator delete(v11[0]);
    }
  }
}

void sub_1A454AC04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1A454AC4C()
{
  v0 = (void *)MEMORY[0x1F4188790]();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  void *v0 = 0;
  v0[1] = 0;
  v0[2] = 0;
  uint64_t result = proc_pidpath_audittoken(v1, buffer, 0x1000u);
  if ((int)result >= 1) {
    return MEMORY[0x1A625DAC0](v0, buffer);
  }
  return result;
}

void sub_1A454ACF4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CLConnectionMessage::getDictionary(CLConnectionMessage *this)
{
  if (qword_1EB30D020 != -1) {
    dispatch_once(&qword_1EB30D020, &unk_1EF7F5160);
  }
  CFAllocatorRef v2 = (NSSet *)qword_1EB30D018;
  return CLConnectionMessage::getObjectOfClasses(this, v2);
}

void sub_1A454AEB0(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 72);
  if (v1) {
    sub_1A4547114(v1);
  }
}

void sub_1A454AEC0(uint64_t a1)
{
}

void sub_1A454AEC8(uint64_t a1)
{
  uint64_t v1 = *(xpc_connection_t **)(a1 + 32);
  xpc_connection_cancel(*v1);
  xpc_release(*v1);
  xpc_connection_t *v1 = 0;
}

uint64_t CLConnection::getRemotePid(dispatch_queue_t *this)
{
  dispatch_assert_queue_V2(this[1]);
  dispatch_queue_t v2 = *this;
  return xpc_connection_get_pid((xpc_connection_t)v2);
}

void *CLConnection::getUserNameFromAuditToken@<X0>(void *a1@<X8>)
{
  return sub_1A454EA1C(a1, "mobile");
}

char *CLConnectionMessage::CLConnectionMessage(char *__dst, long long *a2, void *a3)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_1A45472F4(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v5;
  }
  *((void *)__dst + 3) = 0;
  __dst[32] = 0;
  *(_OWORD *)(__dst + 40) = 0u;
  *(_OWORD *)(__dst + 56) = 0u;
  *(_OWORD *)(__dst + 72) = 0u;
  *((void *)__dst + 7) = CLConnectionMessage::createXPCObject(a3);
  return __dst;
}

void sub_1A454AFC4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 80);
  if (v3) {
    sub_1A4547114(v3);
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

xpc_object_t CLConnectionMessage::createXPCObject(void *a1)
{
  xpc_object_t v1 = a1;
  if (a1)
  {
    dispatch_queue_t v2 = (void *)MEMORY[0x1A625E010]();
    uint64_t v3 = (void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v1 requiringSecureCoding:1 error:0];
    xpc_object_t v1 = v3;
    if (v3) {
      xpc_object_t v1 = xpc_data_create((const void *)[v3 bytes], objc_msgSend(v3, "length"));
    }
  }
  return v1;
}

BOOL CLConnectionMessage::sendReply(uint64_t a1, uint64_t a2)
{
  return CLConnectionMessage::sendReply(a1, a1, a2);
}

void CLConnectionClient::CLConnectionClient(uint64_t a1, char *a2, NSObject *a3)
{
  uint64_t v3 = a3;
  *(void *)a1 = a3;
  *(void *)(a1 + 8) = &unk_1EF7F49A8;
  CFURLRef v6 = operator new(0x20uLL);
  v6[1] = 0;
  void v6[2] = 0;
  *CFURLRef v6 = &unk_1EF7F4AB0;
  *(void *)(a1 + 24) = v6;
  *((_DWORD *)v6 + 6) = 31337;
  *(void *)(a1 + 16) = v6 + 3;
  uint64_t v7 = (char *)operator new(0x80uLL);
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = 0;
  *(void *)uint64_t v7 = &unk_1EF7F4A08;
  if (a2[23] < 0)
  {
    sub_1A45472F4(__p, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    uint64_t v9 = *((void *)a2 + 2);
  }
  *((void *)v7 + 9) = 0;
  *((void *)v7 + 3) = 0;
  *((void *)v7 + 4) = v3;
  *((void *)v7 + 6) = 0;
  *((void *)v7 + 7) = 0;
  *((void *)v7 + 5) = 0;
  v7[64] = 1;
  *((void *)v7 + 10) = 0;
  *((void *)v7 + 11) = 0;
  if (SHIBYTE(v9) < 0)
  {
    sub_1A45472F4(v7 + 96, __p[0], (unint64_t)__p[1]);
    uint64_t v3 = *((void *)v7 + 4);
  }
  else
  {
    *((_OWORD *)v7 + 6) = *(_OWORD *)__p;
    *((void *)v7 + 14) = v9;
  }
  *((_WORD *)v7 + 60) = 256;
  dispatch_retain(v3);
  *((void *)v7 + 5) = objc_opt_new();
  v7[120] = 1;
  *((_DWORD *)v7 + 31) = 0;
  if (SHIBYTE(v9) < 0) {
    operator delete(__p[0]);
  }
  *(void *)(a1 + 32) = v7 + 24;
  *(void *)(a1 + 40) = v7;
  dispatch_retain(*(dispatch_object_t *)a1);
  if (a2[23] < 0) {
    a2 = *(char **)a2;
  }
  objc_msgSend(NSString, "stringWithUTF8String:", a2, __p[0]);
  operator new();
}

void sub_1A454B338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15)
{
  sub_1A4548AEC((void ***)&a15);
  if (a14 < 0) {
    operator delete(__p);
  }
  std::__shared_weak_count::~__shared_weak_count(v16);
  operator delete(v18);
  sub_1A454EC9C(v15);
  _Unwind_Resume(a1);
}

void CLConnectionClient::setInterruptionHandler(NSObject **a1, uint64_t a2)
{
  long long v5 = a1[2];
  uint64_t v4 = (std::__shared_weak_count *)a1[3];
  if (v4)
  {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_1A4547114(v4);
  }
  CFURLRef v6 = a1[4];
  uint64_t v7 = (std::__shared_weak_count *)a1[5];
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = *a1;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = sub_1A455B300;
  v14[3] = &unk_1EF7F4E30;
  v14[6] = v5;
  uint64_t v15 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  v14[4] = v8;
  uint64_t v16 = v6;
  uint64_t v17 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  void v14[5] = a2;
  uint64_t v9 = *a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = sub_1A4549AA8;
  block[3] = &unk_1EF7F4D50;
  block[5] = v5;
  uint64_t v11 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = v6;
  uint64_t v13 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  block[4] = v14;
  dispatch_async(v9, block);
  if (v13) {
    sub_1A4547114(v13);
  }
  if (v11) {
    std::__shared_weak_count::__release_weak(v11);
  }
  if (v17) {
    sub_1A4547114(v17);
  }
  if (v15) {
    std::__shared_weak_count::__release_weak(v15);
  }
  if (v7) {
    sub_1A4547114(v7);
  }
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
}

void CLConnectionClient::createConnection(CLConnectionClient *this)
{
  uint64_t v3 = *((void *)this + 4);
  dispatch_queue_t v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = *((void *)this + 2);
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v4)
  {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_1A4547114(v4);
  }
  CFURLRef v6 = *(NSObject **)this;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  v7[2] = sub_1A4549528;
  v7[3] = &unk_1EF7F4C50;
  void v7[4] = v5;
  uint64_t v8 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = v3;
  __int16 v10 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(v6, v7);
  if (v10) {
    sub_1A4547114(v10);
  }
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  if (v2) {
    sub_1A4547114(v2);
  }
}

void CLConnectionClient::setDefaultMessageHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 40);
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = *(void *)(a1 + 16);
  CFURLRef v6 = *(std::__shared_weak_count **)(a1 + 24);
  if (v6)
  {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_1A4547114(v6);
  }
  if (a2)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3321888768;
    v14[2] = sub_1A4548464;
    v14[3] = &unk_1EF7F4B40;
    uint64_t v16 = v7;
    uint64_t v17 = v6;
    if (v6)
    {
      atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      uint64_t v15 = a2;
      std::__shared_weak_count::__release_weak(v6);
    }
    else
    {
      uint64_t v15 = a2;
    }
    uint64_t v8 = v14;
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(NSObject **)a1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3321888768;
  v10[2] = sub_1A454A968;
  v10[3] = &unk_1EF7F4D50;
  v10[5] = v7;
  uint64_t v11 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = v5;
  uint64_t v13 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v10[4] = v8;
  dispatch_async(v9, v10);
  if (v13) {
    sub_1A4547114(v13);
  }
  if (v11) {
    std::__shared_weak_count::__release_weak(v11);
  }
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
  if (v4) {
    sub_1A4547114(v4);
  }
}

void CLConnectionClient::setHandlerForMessage(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*((char *)a2 + 23) >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = (uint64_t *)*a2;
  }
  CFURLRef v6 = (void *)[NSString stringWithUTF8String:v5];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(std::__shared_weak_count **)(a1 + 40);
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v9 = *(std::__shared_weak_count **)(a1 + 24);
  if (v9)
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_1A4547114(v9);
  }
  if (a3)
  {
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
    }
    uint64_t v11 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t buf = 136315138;
      uint64_t v23 = [v6 UTF8String];
      _os_log_impl(&dword_1A4540000, v11, OS_LOG_TYPE_DEBUG, "Setting handler for message %s", buf, 0xCu);
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3321888768;
    v18[2] = sub_1A454E030;
    v18[3] = &unk_1EF7F4B40;
    uint64_t v20 = v10;
    uint32_t v21 = v9;
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      uint64_t v19 = a3;
      std::__shared_weak_count::__release_weak(v9);
    }
    else
    {
      uint64_t v19 = a3;
    }
    uint64_t v12 = v18;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(NSObject **)a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = sub_1A454A628;
  block[3] = &unk_1EF7F4E30;
  void block[6] = v10;
  uint64_t v15 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v16 = v8;
  uint64_t v17 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  block[4] = v6;
  block[5] = v12;
  dispatch_async(v13, block);
  if (v17) {
    sub_1A4547114(v17);
  }
  if (v15) {
    std::__shared_weak_count::__release_weak(v15);
  }
  if (v9) {
    std::__shared_weak_count::__release_weak(v9);
  }
  if (v7) {
    sub_1A4547114(v7);
  }
}

void sub_1A454BA8C(_Unwind_Exception *exception_object)
{
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  if (v1) {
    sub_1A4547114(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CLConnection::getUniqueRemotePid(dispatch_queue_t *this)
{
  if (!MEMORY[0x1E4F4F658]) {
    return xpc_connection_get_pid((xpc_connection_t)*this);
  }
  xpc_connection_get_audit_token();
  return BSVersionedPIDForAuditToken();
}

void sub_1A454BB14(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = (void *)MEMORY[0x1A625E010]();
  if (a2 != (void *)MEMORY[0x1E4F14528]) {
    CLConnectionServer::handleEvent(v3, a2);
  }
}

void CLConnectionServer::handleEvent(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x1A625E6B0](a2);
  if (v3 == MEMORY[0x1E4F14578])
  {
    CLConnectionServer::handleConnection();
  }
  uint64_t v4 = v3;
  if (v3 == MEMORY[0x1E4F145A8])
  {
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E4F14530]);
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4E60);
    }
    uint64_t v8 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136446210;
      uint64_t v12 = string;
      uint64_t v9 = "Got error: %{public}s";
      uint64_t v10 = v8;
LABEL_41:
      _os_log_impl(&dword_1A4540000, v10, OS_LOG_TYPE_FAULT, v9, (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4E60);
    }
    uint64_t v5 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
    {
      if (v4 == MEMORY[0x1E4F145D8])
      {
        CFURLRef v6 = "XPC_TYPE_NULL";
      }
      else if (v4 == MEMORY[0x1E4F14570])
      {
        CFURLRef v6 = "XPC_TYPE_BOOL";
      }
      else if (v4 == MEMORY[0x1E4F145C0])
      {
        CFURLRef v6 = "XPC_TYPE_INT64";
      }
      else if (v4 == MEMORY[0x1E4F145F8])
      {
        CFURLRef v6 = "XPC_TYPE_UINT64";
      }
      else if (v4 == MEMORY[0x1E4F14598])
      {
        CFURLRef v6 = "XPC_TYPE_DOUBLE";
      }
      else if (v4 == MEMORY[0x1E4F14588])
      {
        CFURLRef v6 = "XPC_TYPE_DATE";
      }
      else if (v4 == MEMORY[0x1E4F14580])
      {
        CFURLRef v6 = "XPC_TYPE_DATA";
      }
      else if (v4 == MEMORY[0x1E4F145F0])
      {
        CFURLRef v6 = "XPC_TYPE_STRING";
      }
      else if (v4 == MEMORY[0x1E4F14600])
      {
        CFURLRef v6 = "XPC_TYPE_UUID";
      }
      else if (v4 == MEMORY[0x1E4F145B0])
      {
        CFURLRef v6 = "XPC_TYPE_FD";
      }
      else if (v4 == MEMORY[0x1E4F145E8])
      {
        CFURLRef v6 = "XPC_TYPE_SHMEM";
      }
      else if (v4 == MEMORY[0x1E4F14568])
      {
        CFURLRef v6 = "XPC_TYPE_ARRAY";
      }
      else if (v4 == MEMORY[0x1E4F14590])
      {
        CFURLRef v6 = "XPC_TYPE_DICTIONARY";
      }
      else
      {
        CFURLRef v6 = "Unknown type";
      }
      int v11 = 136446210;
      uint64_t v12 = v6;
      uint64_t v9 = "Unexpected event type %{public}s";
      uint64_t v10 = v5;
      goto LABEL_41;
    }
  }
}

void CLConnectionClient::sendMessage(uint64_t a1, uint64_t *a2, char a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CFURLRef v6 = _os_activity_create(&dword_1A4540000, "CL: CLConnectionClient::sendMessage(cache)", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);

  if (qword_1EB30CE90 != -1) {
    dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
  }
  uint64_t v7 = qword_1EB30CE88;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v20 = 0;
    __int16 v21 = 2082;
    dispatch_queue_t v22 = &unk_1A45670B7;
    __int16 v23 = 2082;
    uint64_t v24 = "activity";
    _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLConnectionClient::sendMessage(cache)\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(std::__shared_weak_count **)(a1 + 40);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = *(std::__shared_weak_count **)(a1 + 24);
  if (v10)
  {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_1A4547114(v10);
  }
  int v11 = *(NSObject **)a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = sub_1A4548B70;
  block[3] = &unk_1EF7F4D18;
  block[4] = v9;
  char v14 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = (std::__shared_weak_count *)a2[1];
  uint64_t v15 = *a2;
  uint64_t v16 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v17 = a3;
  dispatch_async(v11, block);
  if (v16) {
    sub_1A4547114(v16);
  }
  if (v14) {
    sub_1A4547114(v14);
  }
  if (v10) {
    std::__shared_weak_count::__release_weak(v10);
  }
  if (v8) {
    sub_1A4547114(v8);
  }
  os_activity_scope_leave(&state);
}

void sub_1A454C0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

uint64_t CLConnection::getAuditToken(dispatch_queue_t *this)
{
  dispatch_assert_queue_V2(this[1]);
  return xpc_connection_get_audit_token();
}

CLConnection *CLConnection::connectionFinalizer(CLConnection *this, void *a2)
{
  if (this)
  {
    CLConnection::~CLConnection(this);
    JUMPOUT(0x1A625DBC0);
  }
  return this;
}

void CLConnection::~CLConnection(CLConnection *this)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(void *)this)
  {
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
    }
    uint64_t v4 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      char v14 = &unk_1A45670B7;
      __int16 v15 = 2082;
      uint64_t v16 = "assert";
      __int16 v17 = 2081;
      v18 = "__null == fConnection";
      _os_log_impl(&dword_1A4540000, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"deferredDelete() should have nulled out connection\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
    }
    uint64_t v5 = qword_1EB30CE88;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE88))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      char v14 = &unk_1A45670B7;
      __int16 v15 = 2082;
      uint64_t v16 = "assert";
      __int16 v17 = 2081;
      v18 = "__null == fConnection";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "deferredDelete() should have nulled out connection", "{\"msg%{public}.0s\":\"deferredDelete() should have nulled out connection\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
    }
    CFURLRef v6 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      char v14 = &unk_1A45670B7;
      __int16 v15 = 2082;
      uint64_t v16 = "assert";
      __int16 v17 = 2081;
      v18 = "__null == fConnection";
      _os_log_impl(&dword_1A4540000, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"deferredDelete() should have nulled out connection\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_29:
    abort_report_np();
    __break(1u);
  }
  if (*((void *)this + 8))
  {
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
    }
    uint64_t v7 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      char v14 = &unk_1A45670B7;
      __int16 v15 = 2082;
      uint64_t v16 = "assert";
      __int16 v17 = 2081;
      v18 = "__null == fDestructionHandler";
      _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"deferredDelete() should have nulled out handler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
    }
    uint64_t v8 = qword_1EB30CE88;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE88))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      char v14 = &unk_1A45670B7;
      __int16 v15 = 2082;
      uint64_t v16 = "assert";
      __int16 v17 = 2081;
      v18 = "__null == fDestructionHandler";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "deferredDelete() should have nulled out handler", "{\"msg%{public}.0s\":\"deferredDelete() should have nulled out handler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
    }
    uint64_t v9 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      char v14 = &unk_1A45670B7;
      __int16 v15 = 2082;
      uint64_t v16 = "assert";
      __int16 v17 = 2081;
      v18 = "__null == fDestructionHandler";
      _os_log_impl(&dword_1A4540000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"deferredDelete() should have nulled out handler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_29;
  }
  dispatch_queue_t v2 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A454AEC0;
  block[3] = &unk_1E5B3E9E0;
  block[4] = v2;
  dispatch_async(v2, block);

  *((void *)this + 3) = 0;
  if (*((char *)this + 119) < 0) {
    operator delete(*((void **)this + 12));
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 11);
  if (v3) {
    sub_1A4547114(v3);
  }
}

void sub_1A454C690(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_1A4550334(a1);
}

void CLConnectionClient::start(CLConnectionClient *this)
{
  uint64_t v3 = *((void *)this + 4);
  dispatch_queue_t v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = *((void *)this + 2);
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v4)
  {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_1A4547114(v4);
  }
  CFURLRef v6 = *(NSObject **)this;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  v7[2] = sub_1A454A060;
  v7[3] = &unk_1EF7F4C50;
  void v7[4] = v5;
  uint64_t v8 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = v3;
  uint64_t v10 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(v6, v7);
  if (v10) {
    sub_1A4547114(v10);
  }
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  if (v2) {
    sub_1A4547114(v2);
  }
}

void CLConnection::getName(CLConnection *this@<X0>, uint64_t a2@<X8>)
{
  int v4 = *((char *)this + 119);
  if (v4 < 0) {
    uint64_t v5 = *((void *)this + 13);
  }
  else {
    uint64_t v5 = *((unsigned __int8 *)this + 119);
  }
  CFURLRef v6 = (void **)((char *)this + 96);
  if (!v5)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)this + 1));
    xpc_connection_get_audit_token();
    sub_1A454AAB0((uint64_t)&v9);
    if (*((char *)this + 119) < 0) {
      operator delete(*v6);
    }
    *(_OWORD *)CFURLRef v6 = v9;
    *((void *)this + 14) = v10;
    int v4 = *((char *)this + 119);
    if ((v4 & 0x80000000) == 0)
    {
      if (*((unsigned char *)this + 119)) {
        goto LABEL_9;
      }
LABEL_12:
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
      uint64_t v7 = qword_1EB30CE88;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_DEFAULT, "#Warning The client name could not be determined.", v8, 2u);
      }
      MEMORY[0x1A625DAC0]((char *)this + 96, "<Indeterminate>");
      if ((*((unsigned char *)this + 119) & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
    if (!*((void *)this + 13)) {
      goto LABEL_12;
    }
  }
LABEL_9:
  if ((v4 & 0x80) == 0)
  {
LABEL_10:
    *(_OWORD *)a2 = *(_OWORD *)v6;
    *(void *)(a2 + 16) = *((void *)this + 14);
    return;
  }
LABEL_17:
  sub_1A45472F4((unsigned char *)a2, *((void **)this + 12), *((void *)this + 13));
}

BOOL CLConnectionEntitlementCache::isEntitled(uint64_t **a1, uint64_t *a2)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  int v4 = (os_unfair_lock_s *)(a1 + 7);
  os_unfair_lock_lock((os_unfair_lock_t)a1 + 14);
  CFURLRef v6 = (char **)(a1 + 1);
  uint64_t v5 = a1[1];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v7 = (char **)(a1 + 1);
  do
  {
    BOOL v8 = sub_1A454D020(v5 + 4, a2);
    long long v9 = (uint64_t **)(v5 + 1);
    if (!v8)
    {
      long long v9 = (uint64_t **)v5;
      uint64_t v7 = (char **)v5;
    }
    uint64_t v5 = *v9;
  }
  while (*v9);
  if (v7 == v6 || sub_1A454D020(a2, v7 + 4))
  {
LABEL_8:
    if (*((char *)a2 + 23) >= 0) {
      uint64_t v10 = a2;
    }
    else {
      uint64_t v10 = (uint64_t *)*a2;
    }
    CFStringRef v11 = (const __CFString *)[NSString stringWithUTF8String:v10];
    if (v11)
    {
      CFErrorRef error = 0;
      CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      long long v13 = *(_OWORD *)(a1 + 5);
      *(_OWORD *)token.val = *(_OWORD *)(a1 + 3);
      *(_OWORD *)&token.val[4] = v13;
      char v14 = SecTaskCreateWithAuditToken(v12, &token);
      __int16 v15 = v14;
      if (v14)
      {
        CFTypeRef v16 = SecTaskCopyValueForEntitlement(v14, v11, &error);
        CFErrorRef v17 = error;
        if (error)
        {
          if (qword_1EB30CE90 != -1) {
            dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
          }
          v18 = qword_1EB30CE88;
          if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = __p;
            sub_1A4557818();
            if (v59 < 0) {
              uint64_t v19 = *(unsigned char **)__p;
            }
            CFErrorDomain Domain = CFErrorGetDomain(error);
            CFIndex Code = CFErrorGetCode(error);
            *(_DWORD *)uint64_t buf = 136315650;
            *(void *)&uint8_t buf[4] = v19;
            __int16 v61 = 2112;
            *(void *)v62 = Domain;
            *(_WORD *)&v62[8] = 2048;
            *(void *)&v62[10] = Code;
            _os_log_impl(&dword_1A4540000, v18, OS_LOG_TYPE_DEFAULT, "#Warning SecTaskCopyValueForEntitlement failed for token '%s' with error '%@' (%ld)", buf, 0x20u);
            if (v59 < 0) {
              operator delete(*(void **)__p);
            }
          }
          CFRelease(error);
        }
        if (v16)
        {
          CFTypeID v22 = CFGetTypeID(v16);
          BOOL v23 = v22 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v16) != 0;
          CFRelease(v16);
        }
        else
        {
          BOOL v23 = 0;
        }
        if (v17)
        {
          if (qword_1EB30CE90 != -1) {
            dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
          }
          v27 = qword_1EB30CE88;
          if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEFAULT))
          {
            int v28 = *((char *)a2 + 23);
            int v29 = (uint64_t *)*a2;
            int v30 = *((_DWORD *)a1 + 11);
            sub_1A454AAB0((uint64_t)__p);
            if (v28 >= 0) {
              uint64_t v31 = a2;
            }
            else {
              uint64_t v31 = v29;
            }
            __int16 v32 = __p;
            if (v59 < 0) {
              __int16 v32 = *(unsigned char **)__p;
            }
            *(_DWORD *)uint64_t buf = 136315650;
            *(void *)&uint8_t buf[4] = v31;
            __int16 v61 = 1024;
            *(_DWORD *)v62 = v30;
            *(_WORD *)&v62[4] = 2080;
            *(void *)&v62[6] = v32;
            _os_log_impl(&dword_1A4540000, v27, OS_LOG_TYPE_DEFAULT, "#Warning Issue retrieving entitlement, '%s', pid, %d, executable or bundle, '%s'", buf, 0x1Cu);
            if (v59 < 0) {
              operator delete(*(void **)__p);
            }
          }
        }
        CFRelease(v15);
      }
      else
      {
        if (qword_1EB30CE90 != -1) {
          dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
        }
        uint64_t v25 = qword_1EB30CE88;
        BOOL v23 = 0;
        if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEFAULT))
        {
          sub_1A4557818();
          if (v62[9] >= 0) {
            uint64_t v26 = buf;
          }
          else {
            uint64_t v26 = *(unsigned char **)buf;
          }
          *(_DWORD *)__p = 136315138;
          *(void *)&__p[4] = v26;
          _os_log_impl(&dword_1A4540000, v25, OS_LOG_TYPE_DEFAULT, "#Warning SecTaskCreateWithAuditToken failed for token '%s'", __p, 0xCu);
          if ((v62[9] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
          BOOL v23 = 0;
        }
      }
      v33 = *v6;
      uint64_t v34 = (char **)(a1 + 1);
      int v35 = (char *)(a1 + 1);
      if (*v6)
      {
        while (1)
        {
          while (1)
          {
            int v35 = v33;
            uint64_t v36 = v33 + 32;
            if (!sub_1A454D020(a2, (void *)v33 + 4)) {
              break;
            }
            v33 = *(char **)v35;
            uint64_t v34 = (char **)v35;
            if (!*(void *)v35) {
              goto LABEL_62;
            }
          }
          if (!sub_1A454D020(v36, a2)) {
            break;
          }
          v33 = (char *)*((void *)v35 + 1);
          if (!v33)
          {
            uint64_t v34 = (char **)(v35 + 8);
            goto LABEL_62;
          }
        }
        int v37 = v35;
      }
      else
      {
LABEL_62:
        int v37 = (char *)operator new(0x40uLL);
        uint64_t v38 = v37 + 32;
        if (*((char *)a2 + 23) < 0)
        {
          sub_1A45472F4(v38, (void *)*a2, a2[1]);
        }
        else
        {
          *(_OWORD *)uint64_t v38 = *(_OWORD *)a2;
          *((void *)v37 + 6) = a2[2];
        }
        v37[56] = 0;
        *(void *)int v37 = 0;
        *((void *)v37 + 1) = 0;
        *((void *)v37 + 2) = v35;
        *uint64_t v34 = v37;
        v39 = (uint64_t *)**a1;
        v40 = v37;
        if (v39)
        {
          *a1 = v39;
          v40 = *v34;
        }
        v41 = *v6;
        BOOL v42 = v40 == *v6;
        v40[24] = v42;
        if (!v42)
        {
          do
          {
            uint64_t v43 = *((void *)v40 + 2);
            if (*(unsigned char *)(v43 + 24)) {
              break;
            }
            v44 = *(char **)(v43 + 16);
            uint64_t v45 = *(void *)v44;
            if (*(void *)v44 == v43)
            {
              uint64_t v48 = *((void *)v44 + 1);
              if (!v48 || (int v49 = *(unsigned __int8 *)(v48 + 24), v46 = (unsigned char *)(v48 + 24), v49))
              {
                if (*(char **)v43 == v40)
                {
                  v50 = (uint64_t *)*((void *)v40 + 2);
                }
                else
                {
                  v50 = *(uint64_t **)(v43 + 8);
                  uint64_t v51 = *v50;
                  *(void *)(v43 + 8) = *v50;
                  if (v51)
                  {
                    *(void *)(v51 + 16) = v43;
                    v44 = *(char **)(v43 + 16);
                  }
                  v50[2] = (uint64_t)v44;
                  *(void *)(*(void *)(v43 + 16) + 8 * (**(void **)(v43 + 16) != v43)) = v50;
                  uint64_t *v50 = v43;
                  *(void *)(v43 + 16) = v50;
                  v44 = (char *)v50[2];
                  uint64_t v43 = *(void *)v44;
                }
                *((unsigned char *)v50 + 24) = 1;
                v44[24] = 0;
                uint64_t v54 = *(void *)(v43 + 8);
                *(void *)v44 = v54;
                if (v54) {
                  *(void *)(v54 + 16) = v44;
                }
                *(void *)(v43 + 16) = *((void *)v44 + 2);
                *(void *)(*((void *)v44 + 2) + 8 * (**((void **)v44 + 2) != (void)v44)) = v43;
                *(void *)(v43 + 8) = v44;
                goto LABEL_94;
              }
            }
            else if (!v45 || (int v47 = *(unsigned __int8 *)(v45 + 24), v46 = (unsigned char *)(v45 + 24), v47))
            {
              if (*(char **)v43 == v40)
              {
                uint64_t v52 = *((void *)v40 + 1);
                *(void *)uint64_t v43 = v52;
                if (v52)
                {
                  *(void *)(v52 + 16) = v43;
                  v44 = *(char **)(v43 + 16);
                }
                *((void *)v40 + 2) = v44;
                *(void *)(*(void *)(v43 + 16) + 8 * (**(void **)(v43 + 16) != v43)) = v40;
                *((void *)v40 + 1) = v43;
                *(void *)(v43 + 16) = v40;
                v44 = (char *)*((void *)v40 + 2);
              }
              else
              {
                v40 = (char *)*((void *)v40 + 2);
              }
              v40[24] = 1;
              v44[24] = 0;
              uint64_t v43 = *((void *)v44 + 1);
              v53 = *(char **)v43;
              *((void *)v44 + 1) = *(void *)v43;
              if (v53) {
                *((void *)v53 + 2) = v44;
              }
              *(void *)(v43 + 16) = *((void *)v44 + 2);
              *(void *)(*((void *)v44 + 2) + 8 * (**((void **)v44 + 2) != (void)v44)) = v43;
              *(void *)uint64_t v43 = v44;
LABEL_94:
              *((void *)v44 + 2) = v43;
              break;
            }
            *(unsigned char *)(v43 + 24) = 1;
            v40 = v44;
            v44[24] = v44 == v41;
            unsigned char *v46 = 1;
          }
          while (v44 != v41);
        }
        a1[2] = (uint64_t *)((char *)a1[2] + 1);
      }
      v37[56] = v23;
    }
    else
    {
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
      uint64_t v24 = qword_1EB30CE88;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl(&dword_1A4540000, v24, OS_LOG_TYPE_FAULT, "Couldn't get CFString for entitlement", buf, 2u);
      }
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = *((unsigned char *)v7 + 56) != 0;
  }
  os_unfair_lock_unlock(v4);
  return v23;
}

void sub_1A454CFD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  os_unfair_lock_unlock(v22);
  _Unwind_Resume(a1);
}

BOOL sub_1A454D020(void *a1, void *a2)
{
  int v2 = *((char *)a2 + 23);
  int v3 = *((char *)a1 + 23);
  if (v3 >= 0) {
    size_t v4 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v4 = a1[1];
  }
  if (v3 < 0) {
    a1 = (void *)*a1;
  }
  if (v2 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = a2[1];
  }
  if (v2 < 0) {
    a2 = (void *)*a2;
  }
  if (v5 >= v4) {
    size_t v6 = v4;
  }
  else {
    size_t v6 = v5;
  }
  int v7 = memcmp(a1, a2, v6);
  if (v7) {
    return v7 < 0;
  }
  else {
    return v4 < v5;
  }
}

void CLConnectionClient::~CLConnectionClient(const void **this)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, this[6]);
  int v3 = this[6];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A454DF44;
  block[3] = &unk_1E5B3E9B8;
  block[4] = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
  size_t v4 = this[4];
  size_t v5 = (std::__shared_weak_count *)this[5];
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  size_t v6 = *this;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3321888768;
  v10[2] = sub_1A454DED8;
  v10[3] = &unk_1EF7F4AD8;
  v10[4] = v4;
  CFStringRef v11 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(v6, v10);
  int v7 = *this;
  *this = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1A454DF3C;
  v9[3] = &unk_1E5B3E9E0;
  v9[4] = v7;
  dispatch_async(v7, v9);
  if (v11) {
    sub_1A4547114(v11);
  }
  if (v5) {
    sub_1A4547114(v5);
  }
  BOOL v8 = (std::__shared_weak_count *)this[5];
  if (v8) {
    sub_1A4547114(v8);
  }
  sub_1A454EC9C(this + 1);
}

uint64_t **CLConnectionMessage::isEntitled(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *(uint64_t ***)(a1 + 72);
  if (result) {
    return (uint64_t **)CLConnectionEntitlementCache::isEntitled(result, a2);
  }
  return result;
}

char *CLConnectionMessage::CLConnectionMessage(char *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_1A45472F4(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v3 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v3;
  }
  *((void *)__dst + 3) = 0;
  __dst[32] = 0;
  *(_OWORD *)(__dst + 40) = 0u;
  *(_OWORD *)(__dst + 56) = 0u;
  *(_OWORD *)(__dst + 72) = 0u;
  return __dst;
}

void CLConnectionClient::sendMessage(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  size_t v6 = _os_activity_create(&dword_1A4540000, "CL: CLConnectionClient::sendMessage(reply) (Fallback)", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1EB30CE90 != -1) {
    dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
  }
  int v7 = qword_1EB30CE88;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEBUG))
  {
    uint64_t buf = 68289282;
    __int16 v22 = 2082;
    BOOL v23 = &unk_1A45670B7;
    __int16 v24 = 2082;
    uint64_t v25 = "activity";
    _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLConnectionClient::sendMessage(reply)\", \"event\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
  }
  uint64_t v9 = *(void *)(a1 + 16);
  BOOL v8 = *(std::__shared_weak_count **)(a1 + 24);
  if (v8)
  {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_1A4547114(v8);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3321888768;
  v18[2] = sub_1A454E224;
  v18[3] = &unk_1EF7F4B40;
  v18[5] = v9;
  uint64_t v19 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  void v18[4] = a3;
  uint64_t v10 = *(void *)(a1 + 32);
  CFStringRef v11 = *(std::__shared_weak_count **)(a1 + 40);
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CFAllocatorRef v12 = *(NSObject **)a1;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = sub_1A454E0FC;
  v14[3] = &unk_1EF7F4D88;
  void v14[5] = v10;
  __int16 v15 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v13 = (std::__shared_weak_count *)a2[1];
  uint64_t v16 = *a2;
  CFErrorRef v17 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  void v14[4] = v18;
  dispatch_async(v12, v14);
  if (v17) {
    sub_1A4547114(v17);
  }
  if (v15) {
    sub_1A4547114(v15);
  }
  if (v11) {
    sub_1A4547114(v11);
  }
  if (v19) {
    std::__shared_weak_count::__release_weak(v19);
  }
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  os_activity_scope_leave(&state);
}

void sub_1A454D524(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

BOOL CLConnectionMessage::sendReply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3) {
    size_t v5 = (void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  }
  else {
    size_t v5 = 0;
  }
  if (*(void *)(a1 + 48) || *(void *)(a1 + 24))
  {
    if (v5)
    {
      xpc_object_t v6 = xpc_data_create((const void *)[v5 bytes], objc_msgSend(v5, "length"));
    }
    else
    {
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
      int v7 = qword_1EB30CE88;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_FAULT, "Attempting to send nil/null data. An error should be sent instead.", buf, 2u);
      }
      xpc_object_t v6 = xpc_data_create(0, 0);
    }
    BOOL v8 = v6;
    uint64_t v9 = *(void **)(a1 + 48);
    int v10 = *(char *)(a2 + 23);
    if (v9)
    {
      if (v10 >= 0) {
        CFStringRef v11 = (const char *)a2;
      }
      else {
        CFStringRef v11 = *(const char **)a2;
      }
      xpc_dictionary_set_string(v9, "kCLConnectionMessageNameKey", v11);
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 48), "kCLConnectionMessageInfoKey", v8);
      xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "kCLConnectionMessageIsReplyingKey", 1);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 48));
      xpc_release(*(xpc_object_t *)(a1 + 48));
      *(void *)(a1 + 48) = 0;
    }
    else
    {
      if (v10 < 0)
      {
        sub_1A45472F4(__p, *(void **)a2, *(void *)(a2 + 8));
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)a2;
        uint64_t v21 = *(void *)(a2 + 16);
      }
      uint64_t v19 = sub_1A4548364((const char *)__p, v8, *(void **)(a1 + 64), *(void *)(a1 + 24), 1);
      if (SHIBYTE(v21) < 0) {
        operator delete(__p[0]);
      }
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v19);
      xpc_release(v19);
    }
    if (v8) {
      xpc_release(v8);
    }
    return 1;
  }
  else
  {
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
    }
    CFAllocatorRef v12 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
    {
      long long v13 = *(char *)(a2 + 23) >= 0 ? (void *)a2 : *(void **)a2;
      uint64_t v14 = *(int *)(a1 + 24);
      *(_DWORD *)uint64_t buf = 68289538;
      int v23 = 0;
      __int16 v24 = 2082;
      uint64_t v25 = &unk_1A45670B7;
      __int16 v26 = 2082;
      v27 = v13;
      __int16 v28 = 2050;
      uint64_t v29 = v14;
      _os_log_impl(&dword_1A4540000, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unable to send reply message\", \"MessageName\":%{public, location:escape_only}s, \"ReplyHanlderIdentifier\":%{public}ld}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
    }
    __int16 v15 = qword_1EB30CE88;
    BOOL result = os_signpost_enabled((os_log_t)qword_1EB30CE88);
    if (result)
    {
      if (*(char *)(a2 + 23) >= 0) {
        CFErrorRef v17 = (void *)a2;
      }
      else {
        CFErrorRef v17 = *(void **)a2;
      }
      uint64_t v18 = *(int *)(a1 + 24);
      *(_DWORD *)uint64_t buf = 68289538;
      int v23 = 0;
      __int16 v24 = 2082;
      uint64_t v25 = &unk_1A45670B7;
      __int16 v26 = 2082;
      v27 = v17;
      __int16 v28 = 2050;
      uint64_t v29 = v18;
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unable to send reply message", "{\"msg%{public}.0s\":\"Unable to send reply message\", \"MessageName\":%{public, location:escape_only}s, \"ReplyHanlderIdentifier\":%{public}ld}", buf, 0x26u);
      return 0;
    }
  }
  return result;
}

void sub_1A454D8C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CLConnectionClient::sendMessageSync(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v8 = *(CLConnectionMessage **)a2;
  int v7 = *(std::__shared_weak_count **)(a2 + 8);
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *a4 = 0;
  a4[1] = 0;
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 100));
  uint64_t v9 = *(void *)v6;
  if (*(void *)v6)
  {
    CFStringRef v11 = v8;
    CFAllocatorRef v12 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnection::sendMessageSync(v9, &v11, a3, &v13);
    long long v10 = v13;
    long long v13 = 0uLL;
    *(_OWORD *)a4 = v10;
    if (v12) {
      sub_1A4547114(v12);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 100));
  if (v7) {
    sub_1A4547114(v7);
  }
}

void sub_1A454D9A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1A4547114(a10);
  }
  if (v10) {
    sub_1A4547114(v10);
  }
  _Unwind_Resume(exception_object);
}

void CLConnection::sendMessageSync(uint64_t a1@<X0>, CLConnectionMessage **a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  XPCMessage = CLConnectionMessage::createXPCMessage(*a2);
  BOOL v8 = 0;
  if (a3) {
    int v9 = 3;
  }
  else {
    int v9 = 0;
  }
  long long v10 = (const char **)MEMORY[0x1E4F14530];
  *a4 = 0;
  a4[1] = 0;
  CFStringRef v11 = *v10;
  CFAllocatorRef v12 = *(_xpc_connection_s **)a1;
  uint64_t v13 = MEMORY[0x1E4F145A8];
  do
  {
    xpc_object_t v14 = xpc_connection_send_message_with_reply_sync(v12, XPCMessage);
    uint64_t v15 = MEMORY[0x1A625E6B0]();
    if (v15 == v13)
    {
      string = xpc_dictionary_get_string(v14, v11);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
      uint64_t v18 = qword_1EB30CE88;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *a2;
        if (*((char *)*a2 + 23) < 0) {
          uint64_t v19 = *(CLConnectionMessage **)v19;
        }
        *(_DWORD *)uint64_t buf = 136446466;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&unsigned char buf[12] = 2082;
        *(void *)&buf[14] = string;
        _os_log_impl(&dword_1A4540000, v18, OS_LOG_TYPE_ERROR, "Error on message reply (sync) for %{public}s (%{public}s)", buf, 0x16u);
      }
      if (v14 == (xpc_object_t)MEMORY[0x1E4F14520])
      {
        if (v9)
        {
          int v22 = v9;
          goto LABEL_30;
        }
        int v20 = *(NSObject **)(a1 + 8);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = sub_1A4558110;
        v29[3] = &unk_1E5B3E9B8;
        v29[4] = a1;
        uint64_t v21 = v29;
      }
      else
      {
        int v20 = *(NSObject **)(a1 + 8);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1A4558250;
        block[3] = &unk_1E5B3E9B8;
        block[4] = a1;
        uint64_t v21 = block;
      }
      dispatch_async(v20, v21);
      goto LABEL_20;
    }
    if (v15 != MEMORY[0x1E4F14590])
    {
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
      uint64_t v16 = qword_1EB30CE88;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl(&dword_1A4540000, v16, OS_LOG_TYPE_FAULT, "Dropping unexpected response (not a dictionary)", buf, 2u);
      }
LABEL_20:
      int v22 = 0;
      goto LABEL_30;
    }
    uint64_t v23 = *(void *)(a1 + 80);
    __int16 v24 = *(std::__shared_weak_count **)(a1 + 88);
    uint64_t v25 = (std::__shared_weak_count *)operator new(0x70uLL);
    __int16 v26 = v25;
    v25->__shared_owners_ = 0;
    v25->__shared_weak_owners_ = 0;
    v25->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7F49D0;
    *(void *)uint64_t buf = v23;
    *(void *)&uint8_t buf[8] = v24;
    if (v24) {
      atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionMessage::CLConnectionMessage((uint64_t)&v25[1], v14, buf);
    if (v24) {
      sub_1A4547114(v24);
    }
    *a4 = v26 + 1;
    a4[1] = v26;
    if (v8) {
      sub_1A4547114(v8);
    }
    int v22 = 0;
    BOOL v8 = v26;
LABEL_30:
    xpc_release(v14);
    CFAllocatorRef v12 = *(_xpc_connection_s **)a1;
    if (!*(void *)a1) {
      break;
    }
    int v9 = v22 - 1;
  }
  while (v22);
  xpc_release(XPCMessage);
}

void sub_1A454DD40(_Unwind_Exception *exception_object)
{
  long long v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    sub_1A4547114(v3);
  }
  _Unwind_Resume(exception_object);
}

void *CLConnectionMessage::createXPCMessage(CLConnectionMessage *this)
{
  if (*((char *)this + 23) < 0)
  {
    sub_1A45472F4(__p, *(void **)this, *((void *)this + 1));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)this;
    uint64_t v5 = *((void *)this + 2);
  }
  int v2 = sub_1A4548364((const char *)__p, *((void **)this + 7), *((void **)this + 8), 0, 0);
  if (SHIBYTE(v5) < 0) {
    operator delete(__p[0]);
  }
  return v2;
}

void sub_1A454DE04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A454DE20(uint64_t a1)
{
  int v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    sub_1A4547114(v2);
  }
  long long v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    sub_1A4547114(v3);
  }
}

void sub_1A454DE70(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    sub_1A4547114(v1);
  }
}

void *sub_1A454DE80(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[8];
  result[7] = a2[7];
  result[8] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t sub_1A454DEB4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1A454DED0(uint64_t a1)
{
}

void sub_1A454DED8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
  sub_1A454EAD0(v1);
  uint64_t v2 = *(void **)(v1 + 16);
  if (v2)
  {

    *(void *)(v1 + 16) = 0;
  }
  uint64_t v3 = *(const void **)(v1 + 24);
  if (v3)
  {
    _Block_release(v3);
    *(void *)(v1 + 24) = 0;
  }
  size_t v4 = *(const void **)(v1 + 32);
  if (v4)
  {
    _Block_release(v4);
    *(void *)(v1 + 32) = 0;
  }
  *(unsigned char *)(v1 + 96) = 0;
}

void sub_1A454DF3C(uint64_t a1)
{
}

uint64_t sub_1A454DF44(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    dispatch_release(*(dispatch_object_t *)v1);
    uint64_t v2 = *(std::__shared_weak_count **)(v1 + 32);
    if (v2) {
      std::__shared_weak_count::__release_weak(v2);
    }
    uint64_t v3 = *(std::__shared_weak_count **)(v1 + 16);
    if (v3) {
      sub_1A4547114(v3);
    }
    JUMPOUT(0x1A625DBC0);
  }
  return result;
}

void sub_1A454DFB8(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t *))(v2 + 16))(v2, &v5);
  if (v6) {
    sub_1A4547114(v6);
  }
}

void sub_1A454E018(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1A4547114(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A454E030(uint64_t a1, uint64_t *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  uint64_t v6 = sub_1A454DFB8;
  int v7 = &unk_1EF7F4B78;
  uint64_t v3 = *a2;
  uint64_t v2 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = v3;
  long long v10 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 && *(void *)(v4 + 8) != -1) {
    v6(v5);
  }
  if (v10) {
    sub_1A4547114(v10);
  }
}

void sub_1A454E0E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1A4547114(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A454E0FC(void *a1)
{
  uint64_t v2 = (uint64_t *)a1[5];
  uint64_t v3 = a1[7];
  uint64_t v4 = (std::__shared_weak_count *)a1[8];
  if (v4)
  {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v5 = (void (**)(void, void))a1[4];
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v5 = (void (**)(void, void))a1[4];
  }
  v6[0] = v3;
  v6[1] = v4;
  sub_1A454EB9C(v2, (uint64_t)v6, 0, v5);
  if (v4)
  {
    sub_1A4547114(v4);
    sub_1A4547114(v4);
  }
}

void sub_1A454E18C(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    sub_1A4547114(v1);
    sub_1A4547114(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A454E1AC(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t *))(v2 + 16))(v2, &v5);
  if (v6) {
    sub_1A4547114(v6);
  }
}

void sub_1A454E20C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1A4547114(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A454E224(uint64_t a1, uint64_t *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  uint64_t v6 = sub_1A454E1AC;
  int v7 = &unk_1EF7F4B78;
  uint64_t v3 = *a2;
  uint64_t v2 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = v3;
  long long v10 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 && *(void *)(v4 + 8) != -1) {
    v6(v5);
  }
  if (v10) {
    sub_1A4547114(v10);
  }
}

void sub_1A454E2D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1A4547114(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A454E2F0(uint64_t a1)
{
}

os_log_t sub_1A454E2F8()
{
  os_log_t result = os_log_create("com.apple.LocationSupport", "Connection");
  qword_1EB30CE88 = (uint64_t)result;
  return result;
}

os_log_t sub_1A454E328()
{
  os_log_t result = os_log_create("com.apple.LocationSupport", "Connection");
  qword_1EB30CE88 = (uint64_t)result;
  return result;
}

os_log_t sub_1A454E358()
{
  os_log_t result = os_log_create("com.apple.LocationSupport", "Connection");
  qword_1EB30CE88 = (uint64_t)result;
  return result;
}

uint64_t sub_1A454E388()
{
  qword_1EB30CE68 = (uint64_t)os_log_create("com.apple.LocationSupport", "Intersilo");
  return MEMORY[0x1F41817F8]();
}

os_log_t sub_1A454E3CC()
{
  os_log_t result = os_log_create("com.apple.LocationSupport", "Intersilo");
  qword_1EB30CE68 = (uint64_t)result;
  return result;
}

uint64_t sub_1A454E3FC()
{
  qword_1EB30CE68 = (uint64_t)os_log_create("com.apple.LocationSupport", "Intersilo");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A454E440()
{
  qword_1EB30CE68 = (uint64_t)os_log_create("com.apple.LocationSupport", "Intersilo");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A454E484()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  qword_1EB30D018 = result;
  return result;
}

void sub_1A454E544(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)qword_1EB30CED0;
  uint64_t v3 = [*(id *)(a1 + 40) getSilo];
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4)
  {
    objc_msgSend(v4, "setResidentCount:", objc_msgSend(v4, "residentCount") + 1);
  }
  else
  {
    uint64_t v5 = [CLSiloHeartbeatRecord alloc];
    id v6 = [(CLSiloHeartbeatRecord *)v5 initTrackingServiceClass:*(void *)(a1 + 40) name:*(void *)(a1 + 32)];

    int v7 = (void *)qword_1EB30CED0;
    uint64_t v8 = [v6 silo];
    [v7 setObject:v6 forKey:v8];

    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
    }
    uint64_t v9 = (id)qword_1EB30CE68;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      long long v10 = [v6 silo];
      CFStringRef v11 = [v10 identifier];
      v12[0] = 68289282;
      v12[1] = 0;
      __int16 v13 = 2082;
      xpc_object_t v14 = &unk_1A45670B7;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1A4540000, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Heartbeat tracking commenced\", \"silo\":%{public, location:escape_only}@}", (uint8_t *)v12, 0x1Cu);
    }
    uint64_t v4 = v6;
  }
}

void sub_1A454E704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A454E74C(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;
}

uint64_t sub_1A454E7A0()
{
  qword_1EB30CEF0 = objc_alloc_init(CLServiceVendor);
  return MEMORY[0x1F41817F8]();
}

void sub_1A454E7DC()
{
  dispatch_queue_t v0 = dispatch_queue_create("CLServiceVendorQueue", MEMORY[0x1E4F14430]);
  uint64_t v1 = (void *)qword_1EB30CEC8;
  qword_1EB30CEC8 = (uint64_t)v0;

  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = (void *)qword_1EB30CED0;
  qword_1EB30CED0 = v2;

  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)qword_1EB30CEC8);
  uint64_t v5 = (void *)qword_1EB30CED8;
  qword_1EB30CED8 = (uint64_t)v4;

  dispatch_source_set_timer((dispatch_source_t)qword_1EB30CED8, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1EB30CED8, &unk_1EF7F5080);
  if (*(double *)&qword_1EB30CE80 > 0.0) {
    dispatch_resume((dispatch_object_t)qword_1EB30CED8);
  }
  uint64_t v6 = objc_opt_class();
  sub_1A454ED70(v6, @"_CLMainService");
}

uint64_t sub_1A454E8C4()
{
  qword_1EB30CEE0 = +[CLSilo main];
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A454E904()
{
  qword_1EB30CF08 = [[CLDispatchSilo alloc] initMain];
  return MEMORY[0x1F41817F8]();
}

void sub_1A454E94C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 120)) {
    __assert_rtn("~CLConnectionClientInternal", "CLConnectionClient.mm", 73, "!fIsValid");
  }
  uint64_t v2 = *(NSObject **)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = sub_1A454DED0;
  v3[3] = &unk_1E5B3E9E0;
  v3[4] = v2;
  dispatch_async(v2, v3);
  if (*(char *)(a1 + 119) < 0) {
    operator delete(*(void **)(a1 + 96));
  }
  dispatch_source_t v4 = (void **)(a1 + 72);
  sub_1A4548AEC(&v4);
}

void *sub_1A454EA1C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1A4552A60();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_1A454EAD0(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (*(void *)a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 100));
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
    }
    uint64_t v2 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)size_t v4 = 0;
      _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_DEBUG, "Invalidating connection", v4, 2u);
    }
    uint64_t v3 = *(CLConnection **)a1;
    *(void *)a1 = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 100));
    CLConnection::deferredDelete(v3);
  }
}

void sub_1A454EB9C(uint64_t *a1, uint64_t a2, int a3, void (**a4)(void, void))
{
  uint64_t v7 = *(void *)(a2 + 8);
  v15[0] = *(unsigned __int8 ***)a2;
  v15[1] = (unsigned __int8 **)v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  sub_1A4548C74((uint64_t)a1, v15, a3, a4);
  if (v7) {
    sub_1A4547114((std::__shared_weak_count *)v7);
  }
  uint64_t v8 = *a1;
  if (!*a1)
  {
    uint64_t v11 = 0;
    CFAllocatorRef v12 = 0;
    ((void (**)(void, uint64_t *))a4)[2](a4, &v11);
    long long v10 = v12;
    if (!v12) {
      return;
    }
    goto LABEL_9;
  }
  uint64_t v9 = *(std::__shared_weak_count **)(a2 + 8);
  __int16 v13 = *(unsigned __int8 ***)a2;
  xpc_object_t v14 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  CLConnection::sendMessage(v8, (const char **)&v13, a4);
  long long v10 = v14;
  if (v14) {
LABEL_9:
  }
    sub_1A4547114(v10);
}

void sub_1A454EC64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12)
{
  if (a10) {
    sub_1A4547114(a10);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1A454EC9C(void *a1)
{
  *a1 = &unk_1EF7F49A8;
  sub_1A454ECF0((uint64_t)a1);
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    sub_1A4547114(v2);
  }
  return a1;
}

void sub_1A454ECF0(uint64_t a1)
{
  uint64_t v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = &unk_1EF7F4AB0;
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  *(void *)(a1 + 16) = v2;
  *((_DWORD *)v2 + 6) = 31337;
  *(void *)(a1 + 8) = v2 + 3;
  if (v3)
  {
    sub_1A4547114(v3);
  }
}

void sub_1A454ED70(uint64_t a1, void *a2)
{
  id v3 = a2;
  size_t v4 = qword_1EB30CEC8;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = sub_1A454E544;
  v6[3] = &unk_1E5B3EBE8;
  id v7 = v3;
  uint64_t v8 = a1;
  id v5 = v3;
  dispatch_barrier_async(v4, v6);
}

void sub_1A454F3D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A454F70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

CLConnectionServer *CLConnectionServer::CLConnectionServer(CLConnectionServer *a1, void *a2, void *a3, const void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  *(void *)a1 = a3;
  *((void *)a1 + 1) = a2;
  *((void *)a1 + 2) = _Block_copy(a4);
  *((void *)a1 + 3) = &unk_1EF7F49A8;
  id v7 = operator new(0x20uLL);
  v7[1] = 0;
  v7[2] = 0;
  *id v7 = &unk_1EF7F4AB0;
  *((void *)a1 + 5) = v7;
  *((_DWORD *)v7 + 6) = 31337;
  *((void *)a1 + 4) = v7 + 3;
  if (!*((void *)a1 + 1))
  {
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4E60);
    }
    uint64_t v9 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = &unk_1A45670B7;
      __int16 v16 = 2082;
      uint64_t v17 = "assert";
      __int16 v18 = 2081;
      uint64_t v19 = "fXPCService != __null";
      _os_log_impl(&dword_1A4540000, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Connection can't be NULL\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4E60);
      }
    }
    long long v10 = qword_1EB30CE88;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE88))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = &unk_1A45670B7;
      __int16 v16 = 2082;
      uint64_t v17 = "assert";
      __int16 v18 = 2081;
      uint64_t v19 = "fXPCService != __null";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Connection can't be NULL", "{\"msg%{public}.0s\":\"Connection can't be NULL\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4E60);
      }
    }
    uint64_t v11 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v13 = 0;
      __int16 v14 = 2082;
      __int16 v15 = &unk_1A45670B7;
      __int16 v16 = 2082;
      uint64_t v17 = "assert";
      __int16 v18 = 2081;
      uint64_t v19 = "fXPCService != __null";
      _os_log_impl(&dword_1A4540000, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Connection can't be NULL\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    __break(1u);
  }
  CLConnectionServer::initializeService(a1);
  return a1;
}

void sub_1A45500A0(_Unwind_Exception *a1)
{
  sub_1A454EC9C(v1);
  _Unwind_Resume(a1);
}

void CLConnectionServer::initializeService(CLConnectionServer *this)
{
  uint64_t v2 = (_xpc_connection_s *)*((void *)this + 1);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1A454BB14;
  handler[3] = &unk_1E5B3E818;
  handler[4] = this;
  xpc_connection_set_event_handler(v2, handler);
  xpc_connection_resume(*((xpc_connection_t *)this + 1));
}

CLConnectionServer *CLConnectionServer::CLConnectionServer(CLConnectionServer *a1, const char *a2, NSObject *a3, const void *a4)
{
  *(void *)a1 = a3;
  *((void *)a1 + 2) = _Block_copy(a4);
  *((void *)a1 + 3) = &unk_1EF7F49A8;
  uint64_t v8 = operator new(0x20uLL);
  v8[1] = 0;
  v8[2] = 0;
  *uint64_t v8 = &unk_1EF7F4AB0;
  *((void *)a1 + 5) = v8;
  *((_DWORD *)v8 + 6) = 31337;
  *((void *)a1 + 4) = v8 + 3;
  uint64_t v9 = a2;
  if (a2[23] < 0) {
    uint64_t v9 = *(const char **)a2;
  }
  xpc_connection_t mach_service = xpc_connection_create_mach_service(v9, a3, 1uLL);
  *((void *)a1 + 1) = mach_service;
  if (mach_service)
  {
    CLConnectionServer::initializeService(a1);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if (a2[23] < 0) {
      a2 = *(const char **)a2;
    }
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)[NSString stringWithUTF8String:a2], 0, 0, 1u);
  }
  else
  {
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4E60);
    }
    CFAllocatorRef v12 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__int16 v14 = 0;
      _os_log_impl(&dword_1A4540000, v12, OS_LOG_TYPE_FAULT, "Couldn't create XPC service", v14, 2u);
    }
  }
  return a1;
}

void sub_1A45502BC(_Unwind_Exception *a1)
{
  sub_1A454EC9C(v1);
  _Unwind_Resume(a1);
}

void CLConnectionServer::~CLConnectionServer(CLConnectionServer *this)
{
  uint64_t v2 = (void *)((char *)this + 24);
  sub_1A454ECF0((uint64_t)this + 24);
  xpc_connection_cancel(*((xpc_connection_t *)this + 1));
  xpc_release(*((xpc_object_t *)this + 1));
  *((void *)this + 1) = 0;
  _Block_release(*((const void **)this + 2));
  dispatch_release(*(dispatch_object_t *)this);
  sub_1A454EC9C(v2);
}

void sub_1A4550334(void *a1)
{
}

void CLConnectionServer::handleDisconnection(CLConnectionServer *this, CLConnection *a2)
{
  if (a2) {
    CLConnection::deferredDelete(a2);
  }
}

void sub_1A455035C(uint64_t a1)
{
  uint64_t v1 = *(CLConnection **)(a1 + 40);
  if (v1) {
    CLConnection::deferredDelete(v1);
  }
}

uint64_t sub_1A455036C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 56);
  *(void *)(result + 48) = *(void *)(a2 + 48);
  *(void *)(result + 56) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1A4550388(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    sub_1A4547114(v1);
  }
}

void sub_1A4550398(void *a1)
{
  sub_1A454EC9C(a1);
  JUMPOUT(0x1A625DBC0);
}

void sub_1A45503D0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7F4AB0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1A45503F0(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7F4AB0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A625DBC0);
}

void sub_1A4550444(CLConnection **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2) {
    CLConnection::deferredDelete(v2);
  }
}

BOOL sub_1A4550524(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 rangeOfString:a3 options:13] != 0x7FFFFFFFFFFFFFFFLL;
}

void sub_1A455134C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1A4551420()
{
  if (qword_1EB30CE70 != -1) {
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F51E0);
  }
  dispatch_queue_t v0 = (void *)qword_1EB30CE68;
  return v0;
}

uint64_t sub_1A45514E8(uint64_t a1)
{
  for (uint64_t i = 0; i != -120; i -= 24)
  {
    if (*(char *)(a1 + i + 119) < 0) {
      operator delete(*(void **)(a1 + i + 96));
    }
  }
  return a1;
}

uint64_t sub_1A4551530(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
LABEL_41:
    char v29 = 1;
    return v29 & 1;
  }
  uint64_t v3 = a1;
  uint64_t v4 = 0;
  BOOL v5 = 0;
  unint64_t v38 = a2;
  while (1)
  {
    char v37 = v5;
    uint64_t v6 = NSString;
    id v7 = NSStringFromSelector(*(SEL *)(v3 + 16 * v4));
    uint64_t v8 = [v6 stringWithFormat:@"%s::%@", a3, v7];

    uint64_t v9 = v3 + 16 * v4;
    long long v10 = *(char **)(v9 + 8);
    v41 = (void *)(v9 + 8);
    uint64_t v43 = (void *)v9;
    id v44 = (id)v8;
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB30CF40, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1EB30CF40))
    {
      sub_1A454EA1C(&qword_1EB30CF68, "basic_string");
      sub_1A454EA1C(qword_1EB30CF80, "allocator");
      sub_1A454EA1C(qword_1EB30CF98, "__compressed_pair");
      sub_1A454EA1C(qword_1EB30CFB0, "__list_node_base");
      sub_1A454EA1C(qword_1EB30CFC8, "__split_buffer");
      __cxa_atexit((void (*)(void *))sub_1A45514E8, &qword_1EB30CF68, &dword_1A4540000);
      __cxa_guard_release(&qword_1EB30CF40);
    }
    sub_1A454EA1C(buf, v10);
    int v11 = SBYTE3(v56);
    __p = *(uint8_t **)buf;
    if ((v56 & 0x80000000) == 0) {
      CFAllocatorRef v12 = buf;
    }
    else {
      CFAllocatorRef v12 = *(uint8_t **)buf;
    }
    if ((v56 & 0x80000000) == 0) {
      int64_t v13 = BYTE3(v56);
    }
    else {
      int64_t v13 = *(void *)v54;
    }
    __int16 v14 = &v12[v13];
    __int16 v15 = &qword_1EB30CF68;
    while (1)
    {
      int v16 = *((char *)v15 + 23);
      uint64_t v17 = v16 >= 0 ? v15 : (uint64_t *)*v15;
      int64_t v18 = v16 >= 0 ? *((unsigned __int8 *)v15 + 23) : v15[1];
      if (!v18) {
        break;
      }
      if (v13 >= v18)
      {
        int v19 = *(char *)v17;
        int64_t v20 = v13;
        uint64_t v21 = v12;
        do
        {
          int64_t v22 = v20 - v18;
          if (v22 == -1) {
            break;
          }
          uint64_t v23 = (uint8_t *)memchr(v21, v19, v22 + 1);
          if (!v23) {
            break;
          }
          __int16 v24 = v23;
          if (!memcmp(v23, v17, v18))
          {
            if (v24 == v14 || v24 - v12 == -1) {
              break;
            }
            goto LABEL_29;
          }
          uint64_t v21 = v24 + 1;
          int64_t v20 = v14 - (v24 + 1);
        }
        while (v20 >= v18);
      }
      v15 += 3;
      if (v15 == (uint64_t *)&byte_1EB30CFE0)
      {
        int v25 = 0;
        goto LABEL_30;
      }
    }
LABEL_29:
    int v25 = 1;
LABEL_30:
    if (v11 < 0) {
      operator delete(__p);
    }
    if (v25)
    {
      uint64_t v31 = sub_1A4551420();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        uint64_t v32 = [v44 UTF8String];
        *(void *)uint64_t buf = 68289795;
        *(_WORD *)uint64_t v54 = 2082;
        *(void *)&v54[2] = &unk_1A45670B7;
        __int16 v55 = 2082;
        uint64_t v56 = v32;
        __int16 v57 = 2082;
        v58 = "assert";
        __int16 v59 = 2081;
        v60 = "!containsCppTypesToAvoid(pDesc->types)";
        _os_log_impl(&dword_1A4540000, v31, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Method potentially contains a non POD or non Obj-C type in its arguments\", \"methodName\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      v33 = sub_1A4551420();
      if (os_signpost_enabled(v33))
      {
        uint64_t v34 = [v44 UTF8String];
        *(void *)uint64_t buf = 68289795;
        *(_WORD *)uint64_t v54 = 2082;
        *(void *)&v54[2] = &unk_1A45670B7;
        __int16 v55 = 2082;
        uint64_t v56 = v34;
        __int16 v57 = 2082;
        v58 = "assert";
        __int16 v59 = 2081;
        v60 = "!containsCppTypesToAvoid(pDesc->types)";
        _os_signpost_emit_with_name_impl(&dword_1A4540000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Method potentially contains a non POD or non Obj-C type in its arguments", "{\"msg%{public}.0s\":\"Method potentially contains a non POD or non Obj-C type in its arguments\", \"methodName\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      int v35 = sub_1A4551420();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = [v44 UTF8String];
        *(void *)uint64_t buf = 68289795;
        *(_WORD *)uint64_t v54 = 2082;
        *(void *)&v54[2] = &unk_1A45670B7;
        __int16 v55 = 2082;
        uint64_t v56 = v36;
        __int16 v57 = 2082;
        v58 = "assert";
        __int16 v59 = 2081;
        v60 = "!containsCppTypesToAvoid(pDesc->types)";
        _os_log_impl(&dword_1A4540000, v35, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Method potentially contains a non POD or non Obj-C type in its arguments\", \"methodName\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      abort_report_np();
      __break(1u);
    }
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    char v52 = 0;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = sub_1A4551E64;
    v48[3] = &unk_1E5B3E880;
    v48[4] = &v49;
    v48[5] = v43;
    sub_1A4546CC8(v48);
    uint64_t v3 = a1;
    if (*((unsigned char *)v50 + 24)) {
      goto LABEL_37;
    }
    __int16 v26 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:*v41];
    if (!v26) {
      goto LABEL_43;
    }
    v27 = [[CLIntersiloInterfaceSelectorInfo alloc] initWithSelector:*v43 andMethodSignature:v26];
    if (!v27) {
      break;
    }
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = sub_1A4551EA8;
    v45[3] = &unk_1E5B3E8A8;
    int v47 = v43;
    __int16 v28 = v27;
    v46 = v28;
    sub_1A4546CC8(v45);

LABEL_37:
    _Block_object_dispose(&v49, 8);

    BOOL v5 = ++v4 >= v38;
    if (v4 == v38) {
      goto LABEL_41;
    }
  }

LABEL_43:
  _Block_object_dispose(&v49, 8);

  char v29 = v37;
  return v29 & 1;
}

void sub_1A4551B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  while (1)
  {
    if (*((char *)v22 - 1) < 0) {
      operator delete((void *)*(v22 - 3));
    }
    v22 -= 3;
    if (v22 == &qword_1EB30CF68)
    {
      __cxa_guard_abort(&qword_1EB30CF40);

      _Unwind_Resume(a1);
    }
  }
}

void *sub_1A4551E64(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1A4546FE0(*(void *)a2, *(void *)(a2 + 8), **(void **)(a1 + 40));
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

void sub_1A4551EA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  unint64_t v5 = **(void **)(a1 + 40);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (((8 * v5) + 8) ^ HIDWORD(v5));
  unint64_t v7 = 0x9DDFEA08EB382D69 * (HIDWORD(v5) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  unint64_t v9 = a2[1];
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v2 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9) {
        unint64_t v2 = v8 % v9;
      }
    }
    else
    {
      unint64_t v2 = v8 & (v9 - 1);
    }
    int v11 = *(void ***)(*a2 + 8 * v2);
    if (v11)
    {
      for (uint64_t i = *v11; i; uint64_t i = *(void **)i)
      {
        unint64_t v13 = *((void *)i + 1);
        if (v13 == v8)
        {
          if (*((void *)i + 2) == v5) {
            goto LABEL_74;
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
          if (v13 != v2) {
            break;
          }
        }
      }
    }
  }
  __int16 v14 = a2 + 2;
  uint64_t i = operator new(0x20uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v8;
  *((void *)i + 2) = v5;
  *((void *)i + 3) = 0;
  float v15 = (float)(unint64_t)(a2[3] + 1);
  float v16 = *((float *)a2 + 8);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    else {
      int8x8_t prime = (int8x8_t)v18;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v9 = a2[1];
    }
    if (*(void *)&prime > v9) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v9)
    {
      unint64_t v27 = vcvtps_u32_f32((float)(unint64_t)a2[3] / *((float *)a2 + 8));
      if (v9 < 3 || (uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        unint64_t v27 = std::__next_prime(v27);
      }
      else
      {
        uint64_t v29 = 1 << -(char)__clz(v27 - 1);
        if (v27 >= 2) {
          unint64_t v27 = v29;
        }
      }
      if (*(void *)&prime <= v27) {
        int8x8_t prime = (int8x8_t)v27;
      }
      if (*(void *)&prime >= v9)
      {
        unint64_t v9 = a2[1];
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            sub_1A4552B08();
          }
          uint64_t v21 = operator new(8 * *(void *)&prime);
          int64_t v22 = (void *)*a2;
          *a2 = (uint64_t)v21;
          if (v22) {
            operator delete(v22);
          }
          uint64_t v23 = 0;
          a2[1] = (uint64_t)prime;
          do
            *(void *)(*a2 + 8 * v23++) = 0;
          while (*(void *)&prime != v23);
          __int16 v24 = (void *)*v14;
          if (*v14)
          {
            unint64_t v25 = v24[1];
            uint8x8_t v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(void *)&prime) {
                v25 %= *(void *)&prime;
              }
            }
            else
            {
              v25 &= *(void *)&prime - 1;
            }
            *(void *)(*a2 + 8 * v25) = v14;
            uint64_t v30 = (void *)*v24;
            if (*v24)
            {
              do
              {
                unint64_t v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(void *)&prime) {
                    v31 %= *(void *)&prime;
                  }
                }
                else
                {
                  v31 &= *(void *)&prime - 1;
                }
                if (v31 != v25)
                {
                  if (!*(void *)(*a2 + 8 * v31))
                  {
                    *(void *)(*a2 + 8 * v31) = v24;
                    goto LABEL_55;
                  }
                  void *v24 = *v30;
                  *uint64_t v30 = **(void **)(*a2 + 8 * v31);
                  **(void **)(*a2 + 8 * v31) = v30;
                  uint64_t v30 = v24;
                }
                unint64_t v31 = v25;
LABEL_55:
                __int16 v24 = v30;
                uint64_t v30 = (void *)*v30;
                unint64_t v25 = v31;
              }
              while (v30);
            }
          }
          unint64_t v9 = (unint64_t)prime;
          goto LABEL_59;
        }
        int v35 = (void *)*a2;
        *a2 = 0;
        if (v35) {
          operator delete(v35);
        }
        unint64_t v9 = 0;
        a2[1] = 0;
      }
    }
LABEL_59:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v2 = v8 % v9;
      }
      else {
        unint64_t v2 = v8;
      }
    }
    else
    {
      unint64_t v2 = (v9 - 1) & v8;
    }
  }
  uint64_t v32 = *a2;
  v33 = *(void **)(*a2 + 8 * v2);
  if (v33)
  {
    *(void *)uint64_t i = *v33;
LABEL_72:
    void *v33 = i;
    goto LABEL_73;
  }
  *(void *)uint64_t i = *v14;
  void *v14 = i;
  *(void *)(v32 + 8 * v2) = v14;
  if (*(void *)i)
  {
    unint64_t v34 = *(void *)(*(void *)i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v34 >= v9) {
        v34 %= v9;
      }
    }
    else
    {
      v34 &= v9 - 1;
    }
    v33 = (void *)(*a2 + 8 * v34);
    goto LABEL_72;
  }
LABEL_73:
  ++a2[3];
LABEL_74:
  objc_storeStrong((id *)i + 3, v4);
}

void sub_1A45522CC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1A45522E8(void *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = a2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v4);
        }
        if (protocol_isEqual(v3, *(Protocol **)(*((void *)&v20 + 1) + 8 * i)))
        {

LABEL_21:
          uint64_t v13 = 1;
          goto LABEL_24;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v30 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  unsigned int outCount = 0;
  Name = protocol_getName(v3);
  if (qword_1EB30CF30 != -1) {
    dispatch_once(&qword_1EB30CF30, &unk_1EF7F5200);
  }
  unint64_t v9 = qword_1EB30CF38;
  if (os_log_type_enabled((os_log_t)qword_1EB30CF38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v25 = 0;
    __int16 v26 = 2082;
    unint64_t v27 = &unk_1A45670B7;
    __int16 v28 = 2082;
    uint64_t v29 = Name;
    _os_log_impl(&dword_1A4540000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#registerSelectorInfosAndValidateProtocolRecursively \", \"protocolName\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  uint8x8_t v10 = protocol_copyMethodDescriptionList(v3, 0, 1, &outCount);
  int v11 = sub_1A4551530((uint64_t)v10, outCount, (uint64_t)Name);
  free(v10);
  if (!v11) {
    goto LABEL_23;
  }
  CFAllocatorRef v12 = protocol_copyMethodDescriptionList(v3, 1, 1, &outCount);
  uint64_t v13 = sub_1A4551530((uint64_t)v12, outCount, (uint64_t)Name);
  free(v12);
  if (v13)
  {
    __int16 v14 = protocol_copyProtocolList(v3, &outCount);
    if (outCount)
    {
      float v15 = v14;
      uint64_t v16 = 0;
      while (1)
      {
        BOOL v17 = v15[v16];
        if ((sub_1A45522E8() & 1) == 0) {
          break;
        }

        if (++v16 >= (unint64_t)outCount)
        {
          free(v15);
          goto LABEL_21;
        }
      }
      free(v15);
    }
LABEL_23:
    uint64_t v13 = 0;
  }
LABEL_24:

  return v13;
}

void sub_1A455256C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1A45525AC()
{
  qword_1EB30CF48 = objc_alloc_init(CLIntersiloInterface);
  return MEMORY[0x1F41817F8]();
}

void sub_1A4552890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1A45528B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1A45528C0(uint64_t a1)
{
}

void sub_1A45529A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_1A45529C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1A4546FE0(*(void *)a2, *(void *)(a2 + 8), *(void *)(a1 + 40));
  if (v3)
  {
    id v4 = (void *)v3[3];
    uint64_t v5 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_storeStrong(v5, v4);
  }
}

uint64_t sub_1A4552A1C()
{
  qword_1EB30CF38 = (uint64_t)os_log_create("com.apple.locationd.Core", "Core");
  return MEMORY[0x1F41817F8]();
}

void sub_1A4552A60()
{
}

void sub_1A4552A78(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1A4552AD4(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5B3E718, MEMORY[0x1E4FBA1C8]);
}

void sub_1A4552AC0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1A4552AD4(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void sub_1A4552B08()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

uint64_t sub_1A45552A0()
{
  qword_1EB30CE68 = (uint64_t)os_log_create("com.apple.LocationSupport", "Intersilo");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A45552E4()
{
  qword_1E964B6C0 = (uint64_t)os_log_create("com.apple.locationd.Support", "Support");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A4555328(uint64_t a1)
{
  if (qword_1EB30CFE8 != -1) {
    dispatch_once(&qword_1EB30CFE8, &unk_1EF7F4EC0);
  }
  unint64_t v2 = (uint64_t (*)())dlsym((void *)qword_1EB30CFF0, "cprofile_set_current_identifier");
  off_1EC387EA8 = v2;
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

void *sub_1A45553A4()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/CProfileRuntime.framework/CProfileRuntime", 2);
  qword_1EB30CFF0 = (uint64_t)result;
  return result;
}

char *sub_1A45553D0()
{
  uint64_t result = getenv("CPROFILE_ENABLE");
  byte_1EB30CFE0 = result != 0;
  return result;
}

CLDispatchSilo *sub_1A45554B0()
{
  uint64_t result = [[CLDispatchSilo alloc] initWithIdentifier:@"CLSettingsManagerInternalSilo"];
  qword_1EB30CEB0 = (uint64_t)result;
  return result;
}

void sub_1A45559B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained prepareAndRunBlock:0];

  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [v4 timer];
  [v3 shouldFire];
}

void sub_1A4555DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A4555DF8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1A4555E08(uint64_t a1)
{
}

void sub_1A4555E10(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = pthread_self();
  uint64_t v2 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  CFRunLoopRun();
}

id sub_1A4555E7C()
{
  if (qword_1EB30CE70 != -1) {
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
  }
  dispatch_queue_t v0 = (void *)qword_1EB30CE68;
  return v0;
}

void sub_1A45560A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_1A45560BC(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = pthread_self();
  uint64_t v2 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  uint64_t v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;

  unint64_t v8 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return dispatch_semaphore_signal(v8);
}

void sub_1A45565B0(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v3;

  if (!*(void *)(*(void *)(a1 + 32) + 56))
  {
    uint64_t v6 = objc_alloc_init(CLRunLoopSiloThread);
    uint64_t v7 = *(void *)(a1 + 32);
    unint64_t v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = v6;

    if (v6) {
      [v9 setObject:*(void *)(*(void *)(a1 + 32) + 56) forKeyedSubscript:*(void *)(a1 + 40)];
    }
  }
}

uint64_t sub_1A4557278(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(a1 + 40);
  return MEMORY[0x1F40CD9C0](v2, 0);
}

unsigned char *sub_1A45574A0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) ack];
  uint64_t result = *(unsigned char **)(a1 + 40);
  if (!result[16])
  {
    uint64_t result = (unsigned char *)[result shouldBeIdled];
    if (result)
    {
      *(unsigned char *)(*(void *)(a1 + 40) + 16) = 1;
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
      }
      uint64_t v3 = qword_1EB30CE68;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
        int v5 = 138412290;
        uint64_t v6 = v4;
        _os_log_impl(&dword_1A4540000, v3, OS_LOG_TYPE_DEFAULT, "#Idleness: Silo is being idled: %@", (uint8_t *)&v5, 0xCu);
      }
      return (unsigned char *)[*(id *)(a1 + 40) runIdleHandlers];
    }
  }
  return result;
}

uint64_t sub_1A45575B4()
{
  qword_1EB30CE68 = (uint64_t)os_log_create("com.apple.LocationSupport", "Intersilo");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A45575F8()
{
  qword_1EB30D008 = [MEMORY[0x1E4F1CA60] dictionary];
  return MEMORY[0x1F41817F8]();
}

id sub_1A4557638()
{
  if (qword_1E964B850 != -1) {
    dispatch_once(&qword_1E964B850, &unk_1EF7F4F20);
  }
  dispatch_queue_t v0 = (void *)qword_1E964B858;
  return v0;
}

uint64_t sub_1A4557780()
{
  qword_1E964B858 = (uint64_t)os_log_create("com.apple.LocationSupport", "Timer");
  return MEMORY[0x1F41817F8]();
}

void CLConnectionEntitlementCache::getName(uint64_t a1@<X8>)
{
}

void CLConnectionEntitlementCache::CLConnectionEntitlementCache(CLConnectionEntitlementCache *this, audit_token_t *a2)
{
  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
  long long v2 = *(_OWORD *)a2->val;
  *(_OWORD *)((char *)this + 40) = *(_OWORD *)&a2->val[4];
  *(_OWORD *)((char *)this + 24) = v2;
  *((_DWORD *)this + 14) = 0;
}

{
  long long v2;

  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
  long long v2 = *(_OWORD *)a2->val;
  *(_OWORD *)((char *)this + 40) = *(_OWORD *)&a2->val[4];
  *(_OWORD *)((char *)this + 24) = v2;
  *((_DWORD *)this + 14) = 0;
}

uint64_t sub_1A4557818()
{
  uint64_t v0 = MEMORY[0x1E4FBA488] + 104;
  v32[0] = MEMORY[0x1E4FBA488] + 104;
  uint64_t v1 = MEMORY[0x1E4FBA488] + 64;
  uint64_t v27 = MEMORY[0x1E4FBA488] + 64;
  long long v2 = (void *)MEMORY[0x1E4FBA408];
  uint64_t v3 = *(void *)(MEMORY[0x1E4FBA408] + 24);
  v26[0] = *(void *)(MEMORY[0x1E4FBA408] + 16);
  *(void *)((char *)v26 + *(void *)(v26[0] - 24)) = v3;
  v26[1] = 0;
  uint64_t v4 = (std::ios_base *)((char *)v26 + *(void *)(v26[0] - 24));
  std::ios_base::init(v4, v28);
  uint64_t v5 = MEMORY[0x1E4FBA488] + 24;
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  uint64_t v6 = v2[5];
  uint64_t v27 = v2[4];
  *(void *)((char *)&v28[-1] + *(void *)(v27 - 24)) = v6;
  v26[0] = v2[1];
  *(void *)((char *)v26 + *(void *)(v26[0] - 24)) = v2[6];
  v32[0] = v0;
  v26[0] = v5;
  uint64_t v27 = v1;
  std::streambuf::basic_streambuf();
  unint64_t v7 = 0;
  uint64_t v25 = MEMORY[0x1E4FBA470] + 16;
  v28[0] = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)__p = 0u;
  long long v30 = 0u;
  int v31 = 24;
  do
  {
    std::ostream::operator<<();
    if (v7 <= 6)
    {
      char v33 = 124;
      MEMORY[0x1A625DAD0](v34, &v27);
      if (v34[0])
      {
        unint64_t v8 = (char *)&v28[-1] + *(void *)(v27 - 24);
        uint64_t v9 = *((void *)v8 + 5);
        int v10 = *((_DWORD *)v8 + 2);
        int v11 = *((_DWORD *)v8 + 36);
        if (v11 == -1)
        {
          std::ios_base::getloc((const std::ios_base *)((char *)&v28[-1] + *(void *)(v27 - 24)));
          CFAllocatorRef v12 = std::locale::use_facet(&v35, MEMORY[0x1E4FBA258]);
          int v11 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 32);
          std::locale::~locale(&v35);
          *((_DWORD *)v8 + 36) = v11;
        }
        if ((v10 & 0xB0) == 0x20) {
          uint64_t v13 = v34;
        }
        else {
          uint64_t v13 = &v33;
        }
        if (!v9) {
          goto LABEL_31;
        }
        uint64_t v14 = *((void *)v8 + 3);
        BOOL v15 = v14 <= 1;
        uint64_t v16 = v14 - 1;
        size_t v17 = v15 ? 0 : v16;
        if (v13 - &v33 >= 1
          && (*(uint64_t (**)(uint64_t, char *, int64_t))(*(void *)v9 + 96))(v9, &v33, v13 - &v33) != v13 - &v33)
        {
          goto LABEL_31;
        }
        if ((uint64_t)v17 >= 1)
        {
          if (v17 >= 0x7FFFFFFFFFFFFFF8) {
            sub_1A4552A60();
          }
          if (v17 >= 0x17)
          {
            uint64_t v19 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v17 | 7) != 0x17) {
              uint64_t v19 = v17 | 7;
            }
            uint64_t v20 = v19 + 1;
            unint64_t v18 = (void **)operator new(v19 + 1);
            __b[1] = (void *)v17;
            int64_t v37 = v20 | 0x8000000000000000;
            __b[0] = v18;
          }
          else
          {
            HIBYTE(v37) = v17;
            unint64_t v18 = __b;
          }
          memset(v18, v11, v17);
          *((unsigned char *)v18 + v17) = 0;
          if (v37 >= 0) {
            long long v21 = __b;
          }
          else {
            long long v21 = (void **)__b[0];
          }
          uint64_t v22 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(void *)v9 + 96))(v9, v21, v17);
          if (SHIBYTE(v37) < 0) {
            operator delete(__b[0]);
          }
          if (v22 != v17) {
            goto LABEL_31;
          }
        }
        if (v34 - v13 < 1
          || (*(uint64_t (**)(uint64_t, char *, int64_t))(*(void *)v9 + 96))(v9, v13, v34 - v13) == v34 - v13)
        {
          *((void *)v8 + 3) = 0;
        }
        else
        {
LABEL_31:
          std::ios_base::clear((std::ios_base *)((char *)&v28[-1] + *(void *)(v27 - 24)), *(_DWORD *)((char *)&v28[3] + *(void *)(v27 - 24)) | 5);
        }
      }
      MEMORY[0x1A625DAE0](v34);
    }
    ++v7;
  }
  while (v7 != 8);
  std::stringbuf::str();
  v26[0] = *MEMORY[0x1E4FBA408];
  uint64_t v23 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v26 + *(void *)(v26[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  uint64_t v27 = v23;
  v28[0] = v25;
  if (SBYTE7(v30) < 0) {
    operator delete(__p[0]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x1A625DB90](v32);
}

void sub_1A4557ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __cxa_end_catch();
  sub_1A45589B4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A4557F30(uint64_t a1)
{
}

void CLConnection::handleInterruption(dispatch_queue_t *this)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(this[1]);
  long long v2 = _os_activity_create(&dword_1A4540000, "CL: CLConnection::handleInterruption", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v5);

  if (qword_1EB30CE90 != -1) {
    dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
  }
  uint64_t v3 = qword_1EB30CE88;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v7 = 0;
    __int16 v8 = 2082;
    uint64_t v9 = &unk_1A45670B7;
    __int16 v10 = 2082;
    int v11 = "activity";
    _os_log_impl(&dword_1A4540000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLConnection::handleInterruption\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  CLConnection::resetReplyHandlers((CLConnection *)this);
  dispatch_queue_t v4 = this[6];
  if (v4) {
    ((void (*)(void))v4[2].isa)();
  }
  os_activity_scope_leave(&v5);
}

void sub_1A4558080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

uint64_t CLConnectionMessage::isReplying(CLConnectionMessage *this)
{
  return *((unsigned __int8 *)this + 32);
}

uint64_t CLConnectionMessage::replyHandlerIdentifier(CLConnectionMessage *this)
{
  return *((void *)this + 3);
}

uint64_t CLConnection::setHandlerForMessage(uint64_t a1, uint64_t *a2, void *a3)
{
  if (*((char *)a2 + 23) < 0) {
    a2 = (uint64_t *)*a2;
  }
  uint64_t v5 = [NSString stringWithUTF8String:a2];
  return CLConnection::setHandlerForMessage(a1, v5, a3);
}

uint64_t CLConnectionMessage::getRawPayload(CLConnectionMessage *this)
{
  return *((void *)this + 7);
}

uint64_t CLConnectionMessage::getFileDescriptors(CLConnectionMessage *this)
{
  return *((void *)this + 8);
}

void sub_1A4558110(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(dispatch_queue_t **)(a1 + 32);
  long long v2 = _os_activity_create(&dword_1A4540000, "CL: CLConnection calling interruption handler in sendMessageSync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v4);

  if (qword_1EB30CE90 != -1) {
    dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
  }
  uint64_t v3 = qword_1EB30CE88;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v6 = 0;
    __int16 v7 = 2082;
    __int16 v8 = &unk_1A45670B7;
    __int16 v9 = 2082;
    __int16 v10 = "activity";
    _os_log_impl(&dword_1A4540000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLConnection calling interruption handler in sendMessageSync\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  CLConnection::handleInterruption(v1);
  os_activity_scope_leave(&v4);
}

void sub_1A455823C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1A4558250(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(dispatch_queue_t **)(a1 + 32);
  long long v2 = _os_activity_create(&dword_1A4540000, "CL: CLConnection calling disconnection handler in sendMessageSync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v4);

  if (qword_1EB30CE90 != -1) {
    dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
  }
  uint64_t v3 = qword_1EB30CE88;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v6 = 0;
    __int16 v7 = 2082;
    __int16 v8 = &unk_1A45670B7;
    __int16 v9 = 2082;
    __int16 v10 = "activity";
    _os_log_impl(&dword_1A4540000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLConnection calling disconnection handler in sendMessageSync\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  CLConnection::handleDisconnection(v1);
  os_activity_scope_leave(&v4);
}

void sub_1A455837C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void CLConnection::getUserName(dispatch_queue_t *this@<X0>, void *a2@<X8>)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(this[1]);
  os_activity_scope_state_s v4 = _os_activity_create(&dword_1A4540000, "CL: #MultiUser CLConnection::getUserName", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  if (qword_1EB30CE90 != -1) {
    dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
  }
  uint64_t v5 = qword_1EB30CE88;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v8 = 0;
    __int16 v9 = 2082;
    __int16 v10 = &unk_1A45670B7;
    __int16 v11 = 2082;
    uint64_t v12 = "activity";
    _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#MultiUser CLConnection::getUserName\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  dispatch_assert_queue_V2(this[1]);
  xpc_connection_get_audit_token();
  sub_1A454EA1C(a2, "mobile");
  os_activity_scope_leave(&state);
}

void sub_1A45584EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state)
{
}

uint64_t CLConnectionMessage::CLConnectionMessage(uint64_t a1, void *a2)
{
  v3[0] = 0;
  v3[1] = 0;
  return CLConnectionMessage::CLConnectionMessage(a1, a2, v3);
}

{
  void v3[2];

  v3[0] = 0;
  v3[1] = 0;
  return CLConnectionMessage::CLConnectionMessage(a1, a2, v3);
}

uint64_t CLConnectionMessage::getObjectOfClass(CLConnectionMessage *this, objc_class *a2)
{
  uint64_t v3 = (NSSet *)[MEMORY[0x1E4F1CAD0] setWithObject:a2];
  return CLConnectionMessage::getObjectOfClasses(this, v3);
}

void CLConnectionMessage::setFileDescriptor(id *this, int a2)
{
  int v2 = a2;
  CLConnectionMessage::setFileDescriptors(this, &v2, 1);
}

void CLConnectionMessage::setFileDescriptors(id *this, int *a2, int a3)
{
  LODWORD(v3) = a3;

  this[8] = xpc_array_create(0, 0);
  if ((int)v3 >= 1)
  {
    uint64_t v3 = v3;
    do
    {
      int v6 = *a2++;
      xpc_array_set_fd(this[8], 0xFFFFFFFFFFFFFFFFLL, v6);
      --v3;
    }
    while (v3);
  }
}

uint64_t CLConnectionMessage::copyFileDescriptor(CLConnectionMessage *this, size_t a2)
{
  int v2 = (void *)*((void *)this + 8);
  if (v2) {
    return xpc_array_dup_fd(v2, a2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

size_t CLConnectionMessage::getNumberOfFileDescriptors(xpc_object_t *this)
{
  return xpc_array_get_count(this[8]);
}

uint64_t CLConnectionMessage::sendReply(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v6 = *(void **)(a1 + 48);
  if (v6)
  {
    if (*(char *)(a2 + 23) >= 0) {
      __int16 v7 = (const char *)a2;
    }
    else {
      __int16 v7 = *(const char **)a2;
    }
    xpc_dictionary_set_string(v6, "kCLConnectionMessageNameKey", v7);
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 48), "kCLConnectionMessageInfoKey", a3);
    uint64_t v8 = 1;
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "kCLConnectionMessageIsReplyingKey", 1);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 48));
    xpc_release(*(xpc_object_t *)(a1 + 48));
    *(void *)(a1 + 48) = 0;
  }
  else
  {
    int64_t v9 = *(void *)(a1 + 24);
    if (v9)
    {
      if (*(char *)(a2 + 23) < 0)
      {
        sub_1A45472F4(__p, *(void **)a2, *(void *)(a2 + 8));
        int64_t v9 = *(void *)(a1 + 24);
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)a2;
        uint64_t v19 = *(void *)(a2 + 16);
      }
      uint64_t v16 = sub_1A4548364((const char *)__p, a3, *(void **)(a1 + 64), v9, 1);
      if (SHIBYTE(v19) < 0) {
        operator delete(__p[0]);
      }
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v16);
      xpc_release(v16);
      return 1;
    }
    else
    {
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
      }
      __int16 v10 = qword_1EB30CE88;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
      {
        __int16 v11 = *(char *)(a2 + 23) >= 0 ? (void *)a2 : *(void **)a2;
        uint64_t v12 = *(int *)(a1 + 24);
        *(_DWORD *)uint64_t buf = 68289538;
        int v21 = 0;
        __int16 v22 = 2082;
        uint64_t v23 = &unk_1A45670B7;
        __int16 v24 = 2082;
        uint64_t v25 = v11;
        __int16 v26 = 2050;
        uint64_t v27 = v12;
        _os_log_impl(&dword_1A4540000, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unable to send reply message with raw data\", \"MessageName\":%{public, location:escape_only}s, \"ReplyHanlderIdentifier\":%{public}ld}", buf, 0x26u);
        if (qword_1EB30CE90 != -1) {
          dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F40);
        }
      }
      uint64_t v13 = qword_1EB30CE88;
      if (os_signpost_enabled((os_log_t)qword_1EB30CE88))
      {
        if (*(char *)(a2 + 23) >= 0) {
          uint64_t v14 = (void *)a2;
        }
        else {
          uint64_t v14 = *(void **)a2;
        }
        uint64_t v15 = *(int *)(a1 + 24);
        *(_DWORD *)uint64_t buf = 68289538;
        int v21 = 0;
        __int16 v22 = 2082;
        uint64_t v23 = &unk_1A45670B7;
        __int16 v24 = 2082;
        uint64_t v25 = v14;
        __int16 v26 = 2050;
        uint64_t v27 = v15;
        _os_signpost_emit_with_name_impl(&dword_1A4540000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unable to send reply message with raw data", "{\"msg%{public}.0s\":\"Unable to send reply message with raw data\", \"MessageName\":%{public, location:escape_only}s, \"ReplyHanlderIdentifier\":%{public}ld}", buf, 0x26u);
      }
      return 0;
    }
  }
  return v8;
}

void sub_1A455890C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL CLConnectionMessage::isReply(CLConnectionMessage *this)
{
  return *((void *)this + 6) != 0;
}

void sub_1A4558940(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7F49D0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1A4558960(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7F49D0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A625DBC0);
}

uint64_t sub_1A45589B4(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA408];
  uint64_t v3 = *MEMORY[0x1E4FBA408];
  *(void *)a1 = *MEMORY[0x1E4FBA408];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1A625DB90](a1 + 128);
  return a1;
}

void sub_1A4558AEC(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7F4A40;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1A4558B0C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7F4A40;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A625DBC0);
}

id sub_1A4558D84()
{
  if (qword_1EB30CE70 != -1) {
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F60);
  }
  uint64_t v0 = (void *)qword_1EB30CE68;
  return v0;
}

uint64_t sub_1A455A938()
{
  qword_1EB30CE68 = (uint64_t)os_log_create("com.apple.LocationSupport", "Intersilo");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A455AAB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) refresh];
}

void sub_1A455AC38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (qword_1EB30CE90 != -1) {
    dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
  }
  uint64_t v5 = qword_1EB30CE88;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t buf = 138412290;
    uint64_t v16 = a3;
    _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_DEBUG, "received daemon start notification for service %@", buf, 0xCu);
  }
  uint64_t v6 = *(void *)(a2 + 8);
  __int16 v7 = *(std::__shared_weak_count **)(a2 + 16);
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = *(void *)(a2 + 24);
  int64_t v9 = *(std::__shared_weak_count **)(a2 + 32);
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  __int16 v10 = *(NSObject **)a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3321888768;
  v11[2] = sub_1A455BBD8;
  v11[3] = &unk_1EF7F4C50;
  v11[4] = v8;
  uint64_t v12 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = v6;
  uint64_t v14 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(v10, v11);
  if (v14) {
    sub_1A4547114(v14);
  }
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
  if (v9) {
    std::__shared_weak_count::__release_weak(v9);
  }
  if (v7) {
    sub_1A4547114(v7);
  }
}

void CLConnectionClient::pause(CLConnectionClient *this)
{
  uint64_t v3 = *((void *)this + 4);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = *((void *)this + 2);
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v4)
  {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_1A4547114(v4);
  }
  uint64_t v6 = *(NSObject **)this;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  v7[2] = sub_1A455AEF4;
  v7[3] = &unk_1EF7F4C50;
  void v7[4] = v5;
  uint64_t v8 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = v3;
  __int16 v10 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(v6, v7);
  if (v10) {
    sub_1A4547114(v10);
  }
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  if (v2) {
    sub_1A4547114(v2);
  }
}

void sub_1A455AEF4(void *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3321888768;
  uint64_t v4 = sub_1A455AFB8;
  uint64_t v5 = &unk_1EF7F4AD8;
  uint64_t v1 = (std::__shared_weak_count *)a1[7];
  uint64_t v6 = a1[6];
  __int16 v7 = v1;
  if (v1) {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v2 = a1[5];
  if (v2 && *(void *)(v2 + 8) != -1) {
    v4((uint64_t)v3);
  }
  if (v7) {
    sub_1A4547114(v7);
  }
}

void sub_1A455AFA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    sub_1A4547114(a14);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A455AFB8(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
  if (!*(unsigned char *)(v1 + 97))
  {
    if (qword_1EB30CE90 != -1) {
      dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
    }
    uint64_t v3 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      uint64_t v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      __int16 v11 = "assert";
      __int16 v12 = 2081;
      uint64_t v13 = "fPaused";
      _os_log_impl(&dword_1A4540000, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Cannot call pause() on a paused CLConnectionClient\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
      }
    }
    uint64_t v4 = qword_1EB30CE88;
    if (os_signpost_enabled((os_log_t)qword_1EB30CE88))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      uint64_t v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      __int16 v11 = "assert";
      __int16 v12 = 2081;
      uint64_t v13 = "fPaused";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Cannot call pause() on a paused CLConnectionClient", "{\"msg%{public}.0s\":\"Cannot call pause() on a paused CLConnectionClient\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB30CE90 != -1) {
        dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
      }
    }
    uint64_t v5 = qword_1EB30CE88;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      uint64_t v9 = &unk_1A45670B7;
      __int16 v10 = 2082;
      __int16 v11 = "assert";
      __int16 v12 = 2081;
      uint64_t v13 = "fPaused";
      _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Cannot call pause() on a paused CLConnectionClient\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
  }
  *(unsigned char *)(v1 + 97) = 1;
  uint64_t v2 = *(dispatch_queue_t **)v1;
  if (*(void *)v1)
  {
    CLConnection::pause(v2);
  }
}

uint64_t sub_1A455B27C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1A455B298(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    sub_1A4547114(v1);
  }
}

uint64_t sub_1A455B2A8(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 56);
  *(void *)(result + 48) = *(void *)(a2 + 48);
  *(void *)(result + 56) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1A455B2C4(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    sub_1A4547114(v1);
  }
}

uint64_t sub_1A455B2D4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1A455B2F0(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    sub_1A4547114(v1);
  }
}

void sub_1A455B300(void *a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3321888768;
  uint64_t v5 = sub_1A455B3D4;
  uint64_t v6 = &unk_1EF7F4C88;
  uint64_t v2 = a1[8];
  uint64_t v1 = (std::__shared_weak_count *)a1[9];
  uint64_t v7 = a1[4];
  uint64_t v9 = v2;
  __int16 v10 = v1;
  if (v1) {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = a1[5];
  uint64_t v3 = a1[7];
  if (v3 && *(void *)(v3 + 8) != -1) {
    v5((uint64_t)v4);
  }
  if (v10) {
    sub_1A4547114(v10);
  }
}

void sub_1A455B3BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1A4547114(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1A455B3D4(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 48);
  if (*(unsigned char *)(v2 + 40)) {
    sub_1A4549834(v2);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void CLConnectionClient::sendMessageWithCompletion(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_1A4540000, "CL: CLConnectionClient::sendMessageWithCompletion(reply) (Fallback)", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v6, &state);

  if (qword_1EB30CE90 != -1) {
    dispatch_once(&qword_1EB30CE90, &unk_1EF7F4F80);
  }
  uint64_t v7 = qword_1EB30CE88;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE88, OS_LOG_TYPE_DEBUG))
  {
    *(void *)uint64_t buf = 68289282;
    *(_WORD *)__int16 v22 = 2082;
    *(void *)&v22[2] = &unk_1A45670B7;
    *(_WORD *)&v22[10] = 2082;
    *(void *)&v22[12] = "activity";
    _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLConnectionClient::sendMessageWithCompletion(reply)\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v8 = *(std::__shared_weak_count **)(a1 + 24);
  if (v8)
  {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_1A4547114(v8);
  }
  *(void *)uint64_t buf = 0;
  *(void *)__int16 v22 = buf;
  *(void *)&v22[8] = 0x2020000000;
  v22[16] = 1;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3321888768;
  v18[2] = sub_1A455B700;
  v18[3] = &unk_1EF7F4BE8;
  void v18[6] = v9;
  uint64_t v19 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  void v18[4] = a3;
  v18[5] = buf;
  uint64_t v10 = *(void *)(a1 + 32);
  __int16 v11 = *(std::__shared_weak_count **)(a1 + 40);
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  __int16 v12 = *(NSObject **)a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = sub_1A455B894;
  block[3] = &unk_1EF7F4D88;
  void block[5] = v10;
  uint64_t v15 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = (std::__shared_weak_count *)a2[1];
  uint64_t v16 = *a2;
  uint64_t v17 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  block[4] = v18;
  dispatch_async(v12, block);
  if (v17) {
    sub_1A4547114(v17);
  }
  if (v15) {
    sub_1A4547114(v15);
  }
  if (v11) {
    sub_1A4547114(v11);
  }
  if (v19) {
    std::__shared_weak_count::__release_weak(v19);
  }
  _Block_object_dispose(buf, 8);
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  os_activity_scope_leave(&state);
}

void sub_1A455B6EC(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_1A455B700(void *a1, uint64_t *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  uint64_t v6 = sub_1A455B7D4;
  uint64_t v7 = &unk_1EF7F4C20;
  uint64_t v3 = *a2;
  uint64_t v2 = (std::__shared_weak_count *)a2[1];
  uint64_t v9 = a1[5];
  uint64_t v10 = v3;
  __int16 v11 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = a1[4];
  uint64_t v4 = a1[7];
  if (v4 && *(void *)(v4 + 8) != -1) {
    v6(v5);
  }
  if (v11) {
    sub_1A4547114(v11);
  }
}

void sub_1A455B7BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    sub_1A4547114(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A455B7D4(void *a1)
{
  uint64_t v1 = *(void *)(a1[5] + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    uint64_t v3 = a1[6];
    if (v3)
    {
      *(unsigned char *)(v1 + 24) = 0;
      uint64_t v4 = a1[4];
      uint64_t v5 = (std::__shared_weak_count *)a1[7];
      uint64_t v6 = v3;
      uint64_t v7 = v5;
      if (v5) {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      (*(void (**)(uint64_t, uint64_t *))(v4 + 16))(v4, &v6);
      if (v7) {
        sub_1A4547114(v7);
      }
    }
  }
}

void sub_1A455B850(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1A4547114(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1A455B868(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 56);
  *(void *)(result + 48) = *(void *)(a2 + 48);
  *(void *)(result + 56) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1A455B884(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_1A455B894(uint64_t a1)
{
  uint64_t v2 = *(uint64_t **)(a1 + 40);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 64);
  v4[0] = *(void *)(a1 + 56);
  v4[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1A454EB9C(v2, (uint64_t)v4, 1, *(void (***)(void, void))(a1 + 32));
  if (v3)
  {
    sub_1A4547114(v3);
  }
}

void sub_1A455B910(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_1A4547114(v1);
  }
  _Unwind_Resume(exception_object);
}

void CLConnectionClient::setRequireManualCachedMessageSend(CLConnectionClient *this, char a2)
{
  uint64_t v2 = *((void *)this + 4);
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(NSObject **)this;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = sub_1A455B9E0;
  block[3] = &unk_1EF7F4B08;
  block[4] = v2;
  uint64_t v6 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v7 = a2;
  dispatch_async(v4, block);
  if (v6) {
    sub_1A4547114(v6);
  }
  if (v3) {
    sub_1A4547114(v3);
  }
}

uint64_t sub_1A455B9E0(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 40) = *(unsigned char *)(result + 48) ^ 1;
  return result;
}

void CLConnectionClient::sendCachedMessages(CLConnectionClient *this)
{
  uint64_t v3 = *((void *)this + 4);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = *((void *)this + 2);
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v4)
  {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_1A4547114(v4);
  }
  uint64_t v6 = *(NSObject **)this;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  v7[2] = sub_1A455BB0C;
  v7[3] = &unk_1EF7F4C50;
  void v7[4] = v5;
  uint64_t v8 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = v3;
  uint64_t v10 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(v6, v7);
  if (v10) {
    sub_1A4547114(v10);
  }
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  if (v2) {
    sub_1A4547114(v2);
  }
}

void sub_1A455BB0C(void *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3321888768;
  uint64_t v4 = sub_1A455BBD0;
  uint64_t v5 = &unk_1EF7F4AD8;
  uint64_t v1 = (std::__shared_weak_count *)a1[7];
  uint64_t v6 = a1[6];
  char v7 = v1;
  if (v1) {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v2 = a1[5];
  if (v2 && *(void *)(v2 + 8) != -1) {
    v4((uint64_t)v3);
  }
  if (v7) {
    sub_1A4547114(v7);
  }
}

void sub_1A455BBB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    sub_1A4547114(a14);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A455BBD0(uint64_t a1)
{
}

void sub_1A455BBD8(void *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3321888768;
  uint64_t v4 = sub_1A455BC9C;
  uint64_t v5 = &unk_1EF7F4AD8;
  uint64_t v1 = (std::__shared_weak_count *)a1[7];
  uint64_t v6 = a1[6];
  char v7 = v1;
  if (v1) {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v2 = a1[5];
  if (v2 && *(void *)(v2 + 8) != -1) {
    v4((uint64_t)v3);
  }
  if (v7) {
    sub_1A4547114(v7);
  }
}

void sub_1A455BC84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    sub_1A4547114(a14);
  }
  _Unwind_Resume(exception_object);
}

os_unfair_lock_s *sub_1A455BC9C(uint64_t a1)
{
  uint64_t result = *(os_unfair_lock_s **)(a1 + 32);
  if (!*(void *)&result->_os_unfair_lock_opaque) {
    return sub_1A45495F4(result);
  }
  return result;
}

uint64_t sub_1A455BCB0(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    sub_1A4547114(v2);
  }
  return a1;
}

void sub_1A455BCEC()
{
}

uint64_t sub_1A455BD04(uint64_t a1, uint64_t a2, void *a3)
{
  return CLConnection::setHandlerForMessage(**(void **)(a1 + 32), a2, a3);
}

void sub_1A455BD10(uint64_t a1)
{
}

void sub_1A455BD18(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7F4A08;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1A455BD38(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7F4A08;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A625DBC0);
}

uint64_t CLWriteStackshot(uint64_t a1, int a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if (qword_1EB30D038) {
    goto LABEL_2;
  }
  uint64_t v13 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
  qword_1EB30D038 = (uint64_t)v13;
  if (v13)
  {
    off_1EB30D030 = (uint64_t (*)(void, void))dlsym(v13, "WriteStackshotReport");
    uint64_t v14 = dlsym((void *)qword_1EB30D038, "SimulateCrash");
    off_1EB30D028 = v14;
    if (off_1EB30D030)
    {
      if (v14) {
        goto LABEL_2;
      }
    }
    else
    {
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F4FA0);
      }
      uint64_t v20 = qword_1E964B6C0;
      if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)int v21 = 0;
        _os_log_impl(&dword_1A4540000, v20, OS_LOG_TYPE_FAULT, "CLWriteStackshotReport is NULL", v21, 2u);
      }
      if (off_1EB30D028) {
        goto LABEL_2;
      }
    }
    if (qword_1E964B6C8 != -1) {
      dispatch_once(&qword_1E964B6C8, &unk_1EF7F4FA0);
    }
    unint64_t v18 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v21 = 0;
      uint64_t v19 = "CLSimulateCrash is NULL";
      goto LABEL_53;
    }
  }
  else
  {
    if (qword_1E964B6C8 != -1) {
      dispatch_once(&qword_1E964B6C8, &unk_1EF7F4FA0);
    }
    unint64_t v18 = qword_1E964B6C0;
    if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v21 = 0;
      uint64_t v19 = "Unable to load CrashReporterSupport framework.";
LABEL_53:
      _os_log_impl(&dword_1A4540000, v18, OS_LOG_TYPE_FAULT, v19, v21, 2u);
    }
  }
LABEL_2:
  uint64_t v5 = objc_msgSend(NSString, "stringWithCString:encoding:", a1, 4, *(void *)v21);
  uint64_t v6 = v5;
  if (a2)
  {
    char v7 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))off_1EB30D028;
    if (off_1EB30D028)
    {
      uint64_t v8 = getpid();
      if (v7(v8, 3511749773, v6))
      {
        if (qword_1E964B6C8 != -1) {
          dispatch_once(&qword_1E964B6C8, &unk_1EF7F4FA0);
        }
        uint64_t v9 = qword_1E964B6C0;
        if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)int v21 = 0;
          uint64_t v10 = "Simulated a crash";
LABEL_15:
          __int16 v11 = v9;
          os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
LABEL_38:
          _os_log_impl(&dword_1A4540000, v11, v12, v10, v21, 2u);
          return objc_msgSend(v4, "drain", *(void *)v21);
        }
        return objc_msgSend(v4, "drain", *(void *)v21);
      }
      if (qword_1E964B6C8 != -1) {
        dispatch_once(&qword_1E964B6C8, &unk_1EF7F4FA0);
      }
      uint64_t v16 = qword_1E964B6C0;
      if (!os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(v4, "drain", *(void *)v21);
      }
      *(_WORD *)int v21 = 0;
      uint64_t v10 = "#Warning Failed to simulate a crash";
LABEL_37:
      __int16 v11 = v16;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_38;
    }
    if (qword_1E964B6C8 != -1) {
      dispatch_once(&qword_1E964B6C8, &unk_1EF7F4FA0);
    }
    uint64_t v15 = qword_1E964B6C0;
    if (!os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT)) {
      return objc_msgSend(v4, "drain", *(void *)v21);
    }
    *(_WORD *)int v21 = 0;
    uint64_t v10 = "CLSimulateCrash is NULL";
LABEL_28:
    __int16 v11 = v15;
    os_log_type_t v12 = OS_LOG_TYPE_FAULT;
    goto LABEL_38;
  }
  if (!off_1EB30D030)
  {
    if (qword_1E964B6C8 != -1) {
      dispatch_once(&qword_1E964B6C8, &unk_1EF7F4FA0);
    }
    uint64_t v15 = qword_1E964B6C0;
    if (!os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_FAULT)) {
      return objc_msgSend(v4, "drain", *(void *)v21);
    }
    *(_WORD *)int v21 = 0;
    uint64_t v10 = "CLWriteStackshotReport is NULL";
    goto LABEL_28;
  }
  if (!off_1EB30D030(v5, 3511749773))
  {
    if (qword_1E964B6C8 != -1) {
      dispatch_once(&qword_1E964B6C8, &unk_1EF7F4FA0);
    }
    uint64_t v16 = qword_1E964B6C0;
    if (!os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_DEFAULT)) {
      return objc_msgSend(v4, "drain", *(void *)v21);
    }
    *(_WORD *)int v21 = 0;
    uint64_t v10 = "#Warning Failed to write a stackshot";
    goto LABEL_37;
  }
  if (qword_1E964B6C8 != -1) {
    dispatch_once(&qword_1E964B6C8, &unk_1EF7F4FA0);
  }
  uint64_t v9 = qword_1E964B6C0;
  if (os_log_type_enabled((os_log_t)qword_1E964B6C0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v21 = 0;
    uint64_t v10 = "Wrote a stackshot";
    goto LABEL_15;
  }
  return objc_msgSend(v4, "drain", *(void *)v21);
}

os_log_t sub_1A455C1F0()
{
  os_log_t result = os_log_create("com.apple.locationd.Support", "Support");
  qword_1E964B6C0 = (uint64_t)result;
  return result;
}

uint64_t getActivityModelingZone()
{
  if (qword_1EB30D048 != -1) {
    dispatch_once(&qword_1EB30D048, &unk_1EF7F4FC0);
  }
  return qword_1EB30D040;
}

void sub_1A455C264()
{
  zone = malloc_create_zone(0, 0);
  qword_1EB30D040 = (uint64_t)zone;
  malloc_set_zone_name(zone, "ActivityModelingTokenZone");
}

unsigned char *placeActivityModelingToken(const char *a1, char a2)
{
  if (qword_1EB30D048 != -1) {
    dispatch_once(&qword_1EB30D048, &unk_1EF7F4FC0);
  }
  id v4 = malloc_type_zone_malloc((malloc_zone_t *)qword_1EB30D040, 0x10uLL, 0xA44C14F2uLL);
  unsigned char *v4 = a2;
  strncpy(v4 + 1, a1, 0xFuLL);
  v4[15] = 0;
  return v4;
}

void sub_1A455C38C(_Unwind_Exception *a1)
{
}

void sub_1A455C46C(_Unwind_Exception *a1)
{
}

uint64_t sub_1A455CFF0(uint64_t a1)
{
  uint64_t v1 = objc_msgSend([NSString alloc], "initWithString:", objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", @"syncget_addenda"));
  qword_1E964BBD0 = v1;
  return +[CLAutoCohortUtilities createDirectoryAtPath:v1];
}

uint64_t sub_1A455E31C()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  id v1 = +[CLAutoCohortUtilities getUnsafeEdges];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (!objc_msgSend(v0, "objectForKeyedSubscript:", objc_msgSend(v6, "objectAtIndexedSubscript:", 0))) {
          objc_msgSend(v0, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA80], "set"), objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
        }
        objc_msgSend((id)objc_msgSend(v0, "objectForKeyedSubscript:", objc_msgSend(v6, "objectAtIndexedSubscript:", 0)), "addObject:", objc_msgSend(v6, "objectAtIndexedSubscript:", 1));
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  uint64_t result = [v0 copy];
  qword_1EB30D050 = result;
  return result;
}

void sub_1A455EF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A455EF84(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1A455EF94(uint64_t a1)
{
}

void sub_1A455EF9C(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (!v3)
  {
    id v4 = [NSString stringWithFormat:@"Cohort:%@", *(void *)(a1 + 32)];
    uint64_t v3 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)[v4 UTF8String], 0, *(dispatch_queue_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));

    [v7 setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

id sub_1A455F068()
{
  if (qword_1EB30CE70 != -1) {
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F50E0);
  }
  uint64_t v0 = (void *)qword_1EB30CE68;
  return v0;
}

unsigned char *sub_1A455F6AC(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) ack];
  uint64_t result = *(unsigned char **)(a1 + 40);
  if (!result[16])
  {
    uint64_t result = (unsigned char *)[result shouldBeIdled];
    if (result)
    {
      *(unsigned char *)(*(void *)(a1 + 40) + 16) = 1;
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F50E0);
      }
      uint64_t v3 = qword_1EB30CE68;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
        int v5 = 138412290;
        uint64_t v6 = v4;
        _os_log_impl(&dword_1A4540000, v3, OS_LOG_TYPE_DEFAULT, "#Idleness, Silo is being idled: %@", (uint8_t *)&v5, 0xCu);
      }
      return (unsigned char *)[*(id *)(a1 + 40) runIdleHandlers];
    }
  }
  return result;
}

BOOL sub_1A455FB98(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 timer];
  [v3 nextFireDelayRaw];
  if (v3)
  {
    double v5 = v4;
    if (v4 != 1.79769313e308)
    {
      double v6 = *(double *)(a1 + 40);
      if (v6 >= v5)
      {
        [v3 fireInterval];
        long double v8 = v7;
        double v9 = 1.79769313e308;
        if (v8 != 1.79769313e308) {
          double v9 = v8 - fmod(*(double *)(a1 + 40) - v5, v8);
        }
        [v3 setNextFireDelay:v9];
        [*(id *)(a1 + 32) addObject:v3];
      }
      else
      {
        [v3 setNextFireDelay:v5 - v6];
      }
    }
  }

  return v3 != 0;
}

uint64_t sub_1A455FD40(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setHandler:0];
}

uint64_t sub_1A455FE34(uint64_t a1)
{
  return [*(id *)(a1 + 32) ack];
}

uint64_t sub_1A455FEDC()
{
  qword_1EB30CF18 = [MEMORY[0x1E4F1CA60] dictionary];
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1A455FF1C()
{
  qword_1EB30CE68 = (uint64_t)os_log_create("com.apple.LocationSupport", "Intersilo");
  return MEMORY[0x1F41817F8]();
}

id sub_1A455FF60()
{
  if (qword_1EB30CE70 != -1) {
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F5020);
  }
  uint64_t v0 = (void *)qword_1EB30CE68;
  return v0;
}

void sub_1A455FFFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4560230(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7F4A78;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1A4560250(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7F4A78;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A625DBC0);
}

void sub_1A4560504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1A4560528()
{
  if (qword_1EB30CE70 != -1) {
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
  }
  uint64_t v0 = (void *)qword_1EB30CE68;
  return v0;
}

void sub_1A45607BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4560854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A456090C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A456099C(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)qword_1EB30CED0 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 residentCount] - 1;
    [v3 setResidentCount:v4];
    if (!v4)
    {
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
      }
      double v5 = (id)qword_1EB30CE68;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        double v6 = [*(id *)(a1 + 32) identifier];
        v7[0] = 68289282;
        v7[1] = 0;
        __int16 v8 = 2082;
        double v9 = &unk_1A45670B7;
        __int16 v10 = 2114;
        long long v11 = v6;
        _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Heartbeat tracking terminated\", \"silo\":%{public, location:escape_only}@}", (uint8_t *)v7, 0x1Cu);
      }
      [(id)qword_1EB30CED0 removeObjectForKey:*(void *)(a1 + 32)];
    }
  }
}

void sub_1A4560AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1A4560B1C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1A4560B2C(uint64_t a1)
{
}

void sub_1A4560B34(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v6 synCount];
  int v8 = v7 - [v6 ackCount];
  if (v8 < 0)
  {
    uint64_t v19 = sub_1A4560528();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v29 = 0;
      __int16 v30 = 2082;
      int v31 = &unk_1A45670B7;
      __int16 v32 = 2082;
      char v33 = "assert";
      __int16 v34 = 2081;
      std::locale v35 = "0 <= dewrappedDeficit";
      _os_log_impl(&dword_1A4540000, v19, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Deltafied deficit should be non-negative\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    uint64_t v20 = sub_1A4560528();
    if (os_signpost_enabled(v20))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v29 = 0;
      __int16 v30 = 2082;
      int v31 = &unk_1A45670B7;
      __int16 v32 = 2082;
      char v33 = "assert";
      __int16 v34 = 2081;
      std::locale v35 = "0 <= dewrappedDeficit";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Deltafied deficit should be non-negative", "{\"msg%{public}.0s\":\"Deltafied deficit should be non-negative\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    int v21 = sub_1A4560528();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v29 = 0;
      __int16 v30 = 2082;
      int v31 = &unk_1A45670B7;
      __int16 v32 = 2082;
      char v33 = "assert";
      __int16 v34 = 2081;
      std::locale v35 = "0 <= dewrappedDeficit";
      _os_log_impl(&dword_1A4540000, v21, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Deltafied deficit should be non-negative\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    uint64_t v22 = 192;
LABEL_33:

    uint64_t v26 = v22;
    uint64_t v27 = "validateTrackedSilos_block_invoke";
    uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Shared/Intersilo/CLServiceVendor.mm";
    abort_report_np();
    __break(1u);
LABEL_34:
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
    goto LABEL_13;
  }
  if (v8 >= 3)
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
    }
    double v9 = (id)qword_1EB30CE68;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = [v5 identifier];
      *(_DWORD *)uint64_t buf = 68289282;
      int v29 = 0;
      __int16 v30 = 2082;
      int v31 = &unk_1A45670B7;
      __int16 v32 = 2114;
      char v33 = v10;
      _os_log_impl(&dword_1A4540000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning Heartbeat underflow; going to crash now!\", \"silo\":%{public, location:escape_only}@}",
        buf,
        0x1Cu);
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    if ([v6 svcClass])
    {
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "addObject:", objc_msgSend(v6, "svcClass"));
      goto LABEL_16;
    }
    uint64_t v23 = sub_1A4560528();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v29 = 0;
      __int16 v30 = 2082;
      int v31 = &unk_1A45670B7;
      __int16 v32 = 2082;
      char v33 = "assert";
      __int16 v34 = 2081;
      std::locale v35 = "record.svcClass";
      _os_log_impl(&dword_1A4540000, v23, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Only living, non-nil services should be heart-beaten\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    __int16 v24 = sub_1A4560528();
    if (os_signpost_enabled(v24))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v29 = 0;
      __int16 v30 = 2082;
      int v31 = &unk_1A45670B7;
      __int16 v32 = 2082;
      char v33 = "assert";
      __int16 v34 = 2081;
      std::locale v35 = "record.svcClass";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Only living, non-nil services should be heart-beaten", "{\"msg%{public}.0s\":\"Only living, non-nil services should be heart-beaten\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    int v21 = sub_1A4560528();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v29 = 0;
      __int16 v30 = 2082;
      int v31 = &unk_1A45670B7;
      __int16 v32 = 2082;
      char v33 = "assert";
      __int16 v34 = 2081;
      std::locale v35 = "record.svcClass";
      _os_log_impl(&dword_1A4540000, v21, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Only living, non-nil services should be heart-beaten\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    uint64_t v22 = 208;
    goto LABEL_33;
  }
  if (v8 != 2) {
    goto LABEL_16;
  }
  if (qword_1EB30CE70 != -1) {
    goto LABEL_34;
  }
LABEL_13:
  uint64_t v14 = (id)qword_1EB30CE68;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v5 identifier];
    *(_DWORD *)uint64_t buf = 68289538;
    int v29 = 0;
    __int16 v30 = 2082;
    int v31 = &unk_1A45670B7;
    __int16 v32 = 2114;
    char v33 = v15;
    __int16 v34 = 1026;
    LODWORD(v35) = 2;
    _os_log_impl(&dword_1A4540000, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning Heartbeat underflow\", \"silo\":%{public, location:escape_only}@, \"deficit\":%{public}d}", buf, 0x22u);
  }
LABEL_16:
  uint64_t v16 = objc_msgSend(v6, "silo", v25, v26, v27);
  char v17 = [v16 isSuspended];

  if ((v17 & 1) == 0)
  {
    [v6 syn];
    unint64_t v18 = [v6 silo];
    [v18 heartBeat:v6];
  }
}

void sub_1A4561174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1A45611BC(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 description];
  id v6 = [v4 description];
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

void sub_1A456122C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

BOOL sub_1A4561258(id *a1, void *a2, void *a3)
{
  id v5 = a3;
  *a1 = 0;
  *a2 = 0;
  Class Class = (Class)*a1;
  if (!*a1)
  {
    id v7 = v5;
    Class Class = objc_getClass((const char *)[v7 UTF8String]);
    *a1 = Class;
    if (!Class)
    {
      id v8 = [v7 stringByAppendingString:@"Adapter"];
      *a1 = objc_getClass((const char *)[v8 UTF8String]);

      Class Class = (Class)*a1;
      if (!*a1) {
        goto LABEL_8;
      }
    }
  }
  if ([(objc_class *)Class isSupported])
  {
    *a2 = [*a1 getSilo];
  }
  if (*a1) {
    BOOL v9 = *a2 != 0;
  }
  else {
LABEL_8:
  }
    BOOL v9 = 0;

  return v9;
}

void sub_1A456132C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4561348()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_1A4560B1C;
  BOOL v9 = sub_1A4560B2C;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = sub_1A4560B34;
  v4[3] = &unk_1E5B3EC38;
  v4[4] = &v5;
  [(id)qword_1EB30CED0 enumerateKeysAndObjectsUsingBlock:v4];
  uint64_t v0 = (void *)v6[5];
  if (v0)
  {
    if (byte_1EB30CE78)
    {
      CLWriteStackshot((uint64_t)"locationd: Heartbeat underflow", 0);
      uint64_t v0 = (void *)v6[5];
    }
    [v0 sortUsingComparator:&unk_1EF7F5220];
    [(id)v6[5] addObject:objc_opt_class()];
    if (byte_1EB30CEC1 == 1)
    {
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
      }
      id v1 = qword_1EB30CE68;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v2 = v6[5];
        uint64_t buf = 68289282;
        __int16 v12 = 2082;
        uint64_t v13 = &unk_1A45670B7;
        __int16 v14 = 2114;
        uint64_t v15 = v2;
        _os_log_impl(&dword_1A4540000, v1, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"locationd remains non-fatally blocked because internal install\", \"ImplicatedServicesCurrently\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      }
    }
    else
    {
      byte_1EB30CEC1 = 1;
      uint64_t v3 = [(id)v6[5] objectAtIndexedSubscript:0];
      [v3 becameFatallyBlocked:v6[5] index:0];
    }
  }
  _Block_object_dispose(&v5, 8);
}

void sub_1A4561580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  int v21 = v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1A45616D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4561700(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v1 = *(double *)&qword_1EB30CE80;
  byte_1EB30CE78 = *(unsigned char *)(a1 + 40);
  double v2 = *(double *)(a1 + 32);
  qword_1EB30CE80 = *(void *)&v2;
  byte_1EB30CEC0 = *(unsigned char *)(a1 + 41);
  if (*(unsigned char *)(a1 + 42))
  {
    if (v2 > 0.0)
    {
      uint64_t v3 = (uint64_t)(v2 * 1000000000.0);
      id v4 = qword_1EB30CED8;
      dispatch_time_t v5 = dispatch_time(0, v3);
      dispatch_source_set_timer(v4, v5, v3, v3);
      if (v1 <= 0.0)
      {
        if (qword_1EB30CE70 != -1) {
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
        }
        __int16 v12 = qword_1EB30CE68;
        if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEBUG))
        {
          int v13 = 68289282;
          int v14 = 0;
          __int16 v15 = 2082;
          uint64_t v16 = &unk_1A45670B7;
          __int16 v17 = 2050;
          uint64_t v18 = qword_1EB30CE80;
          _os_log_impl(&dword_1A4540000, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Heartbeat tracking resumed\", \"interval\":\"%{public}f\"}", (uint8_t *)&v13, 0x1Cu);
        }
        dispatch_resume((dispatch_object_t)qword_1EB30CED8);
      }
      else
      {
        if (qword_1EB30CE70 != -1) {
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
        }
        uint64_t v6 = qword_1EB30CE68;
        if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEBUG))
        {
          int v13 = 68289282;
          int v14 = 0;
          __int16 v15 = 2082;
          uint64_t v16 = &unk_1A45670B7;
          __int16 v17 = 2050;
          uint64_t v18 = qword_1EB30CE80;
          uint64_t v7 = "{\"msg%{public}.0s\":\"Heartbeat tracking already enabled\", \"interval\":\"%{public}f\"}";
          id v8 = v6;
          uint32_t v9 = 28;
LABEL_19:
          _os_log_impl(&dword_1A4540000, v8, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v13, v9);
          return;
        }
      }
      return;
    }
  }
  else
  {
    qword_1EB30CE80 = 0;
  }
  if (v1 <= 0.0)
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
    }
    uint64_t v11 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      uint64_t v16 = &unk_1A45670B7;
      uint64_t v7 = "{\"msg%{public}.0s\":\"Heartbeat tracking already disabled\"}";
      id v8 = v11;
      uint32_t v9 = 18;
      goto LABEL_19;
    }
  }
  else
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
    }
    id v10 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      uint64_t v16 = &unk_1A45670B7;
      _os_log_impl(&dword_1A4540000, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Heartbeat tracking suspended\"}", (uint8_t *)&v13, 0x12u);
    }
    dispatch_suspend((dispatch_object_t)qword_1EB30CED8);
  }
}

void sub_1A45620E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A45621D4(void *a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (!a1[4])
  {
    std::locale v35 = sub_1A4560528();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v47 = 0;
      __int16 v48 = 2082;
      uint64_t v49 = &unk_1A45670B7;
      __int16 v50 = 2082;
      uint64_t v51 = "assert";
      __int16 v52 = 2081;
      v53 = "remapping";
      _os_log_impl(&dword_1A4540000, v35, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Service replacement map must be non-nil if set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    uint64_t v36 = sub_1A4560528();
    if (os_signpost_enabled(v36))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v47 = 0;
      __int16 v48 = 2082;
      uint64_t v49 = &unk_1A45670B7;
      __int16 v50 = 2082;
      uint64_t v51 = "assert";
      __int16 v52 = 2081;
      v53 = "remapping";
      _os_signpost_emit_with_name_impl(&dword_1A4540000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Service replacement map must be non-nil if set", "{\"msg%{public}.0s\":\"Service replacement map must be non-nil if set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    int64_t v37 = sub_1A4560528();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289539;
      int v47 = 0;
      __int16 v48 = 2082;
      uint64_t v49 = &unk_1A45670B7;
      __int16 v50 = 2082;
      uint64_t v51 = "assert";
      __int16 v52 = 2081;
      v53 = "remapping";
      _os_log_impl(&dword_1A4540000, v37, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Service replacement map must be non-nil if set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    uint64_t v39 = 451;
    v40 = "-[CLServiceVendor setServiceReplacementMap:missBehavior:]_block_invoke";
    unint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Shared/Intersilo/CLServiceVendor.mm";
    abort_report_np();
    goto LABEL_67;
  }
  id v1 = a1;
  double v2 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v3 = [*(id *)(a1[5] + 8) allKeys];
  id v4 = [v2 setWithArray:v3];

  [v4 unionSet:*(void *)(*((void *)v1 + 5) + 24)];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v58 count:16];
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)v43;
  while (2)
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v43 != v6) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v42 + 1) + 8 * v7);
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
      }
      uint32_t v9 = (id)qword_1EB30CE68;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = [v8 UTF8String];
        int v11 = *((_DWORD *)v1 + 12);
        *(_DWORD *)uint64_t buf = 68289538;
        int v47 = 0;
        __int16 v48 = 2082;
        uint64_t v49 = &unk_1A45670B7;
        __int16 v50 = 2082;
        uint64_t v51 = (const char *)v10;
        __int16 v52 = 1026;
        LODWORD(v53) = v11;
        _os_log_impl(&dword_1A4540000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"service replacement mapping\", \"literalSvcName\":%{public, location:escape_only}s, \"MissBehavior\":%{public}d}", buf, 0x22u);
      }

      __int16 v12 = sub_1A4543D68(*((void **)v1 + 4), *((_DWORD *)v1 + 12), v8);
      int v13 = sub_1A4543D68(*(void **)(*((void *)v1 + 5) + 16), *(_DWORD *)(*((void *)v1 + 5) + 40), v8);
      int v14 = v13;
      if (!v12)
      {
        if (qword_1EB30CE70 != -1) {
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
        }
        int v21 = (id)qword_1EB30CE68;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)uint64_t buf = 68289539;
          int v47 = 0;
          __int16 v48 = 2082;
          uint64_t v49 = &unk_1A45670B7;
          __int16 v50 = 2082;
          uint64_t v51 = "assert";
          __int16 v52 = 2081;
          v53 = "newEffectiveSvcName";
          _os_log_impl(&dword_1A4540000, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Existing services must not fail to map under new mapping and behavior\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }

        if (qword_1EB30CE70 != -1) {
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
        }
        uint64_t v22 = (id)qword_1EB30CE68;
        if (os_signpost_enabled(v22))
        {
          *(_DWORD *)uint64_t buf = 68289539;
          int v47 = 0;
          __int16 v48 = 2082;
          uint64_t v49 = &unk_1A45670B7;
          __int16 v50 = 2082;
          uint64_t v51 = "assert";
          __int16 v52 = 2081;
          v53 = "newEffectiveSvcName";
          _os_signpost_emit_with_name_impl(&dword_1A4540000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Existing services must not fail to map under new mapping and behavior", "{\"msg%{public}.0s\":\"Existing services must not fail to map under new mapping and behavior\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }

        if (qword_1EB30CE70 != -1) {
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
        }
        id v1 = (id)qword_1EB30CE68;
        if (os_log_type_enabled((os_log_t)v1, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 68289539;
          int v47 = 0;
          __int16 v48 = 2082;
          uint64_t v49 = &unk_1A45670B7;
          __int16 v50 = 2082;
          uint64_t v51 = "assert";
          __int16 v52 = 2081;
          v53 = "newEffectiveSvcName";
          _os_log_impl(&dword_1A4540000, (os_log_t)v1, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Existing services must not fail to map under new mapping and behavior\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }
        uint64_t v23 = 464;
        goto LABEL_33;
      }
      if (!v13)
      {
        if (qword_1EB30CE70 != -1) {
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
        }
        __int16 v24 = (id)qword_1EB30CE68;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)uint64_t buf = 68289539;
          int v47 = 0;
          __int16 v48 = 2082;
          uint64_t v49 = &unk_1A45670B7;
          __int16 v50 = 2082;
          uint64_t v51 = "assert";
          __int16 v52 = 2081;
          v53 = "oldEffectiveSvcName";
          _os_log_impl(&dword_1A4540000, v24, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Should be impossible for an existing service to fail to map under existing mapping and behavior, and must be non-nil for next test\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }

        if (qword_1EB30CE70 != -1) {
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
        }
        uint64_t v25 = (id)qword_1EB30CE68;
        if (os_signpost_enabled(v25))
        {
          *(_DWORD *)uint64_t buf = 68289539;
          int v47 = 0;
          __int16 v48 = 2082;
          uint64_t v49 = &unk_1A45670B7;
          __int16 v50 = 2082;
          uint64_t v51 = "assert";
          __int16 v52 = 2081;
          v53 = "oldEffectiveSvcName";
          _os_signpost_emit_with_name_impl(&dword_1A4540000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Should be impossible for an existing service to fail to map under existing mapping and behavior, and must be non-nil for next test", "{\"msg%{public}.0s\":\"Should be impossible for an existing service to fail to map under existing mapping and behavior, and must be non-nil for next test\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }

        if (qword_1EB30CE70 != -1) {
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
        }
        uint64_t v26 = (id)qword_1EB30CE68;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 68289539;
          int v47 = 0;
          __int16 v48 = 2082;
          uint64_t v49 = &unk_1A45670B7;
          __int16 v50 = 2082;
          uint64_t v51 = "assert";
          __int16 v52 = 2081;
          v53 = "oldEffectiveSvcName";
          _os_log_impl(&dword_1A4540000, v26, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Should be impossible for an existing service to fail to map under existing mapping and behavior, and must be non-nil for next test\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        }

        uint64_t v39 = 465;
        v40 = "-[CLServiceVendor setServiceReplacementMap:missBehavior:]_block_invoke";
        unint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Shared/Intersilo/CLServiceVendor.mm";
        abort_report_np();
LABEL_67:
        __break(1u);
LABEL_68:
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
        goto LABEL_17;
      }
      if (([v13 isEqual:v12] & 1) == 0)
      {
        if (qword_1EB30CE70 != -1) {
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
        }
        uint64_t v27 = (id)qword_1EB30CE68;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          uint64_t v28 = [v14 UTF8String];
          uint64_t v29 = [v12 UTF8String];
          *(_DWORD *)uint64_t buf = 68290051;
          int v47 = 0;
          __int16 v48 = 2082;
          uint64_t v49 = &unk_1A45670B7;
          __int16 v50 = 2082;
          uint64_t v51 = (const char *)v28;
          __int16 v52 = 2082;
          v53 = (const char *)v29;
          __int16 v54 = 2082;
          __int16 v55 = "assert";
          __int16 v56 = 2081;
          __int16 v57 = "[oldEffectiveSvcName isEqual:newEffectiveSvcName]";
          _os_log_impl(&dword_1A4540000, v27, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Old and new mappings and behaviors must agree about any service which has started\", \"oldEffectiveSvcName\":%{public, location:escape_only}s, \"newEffectiveSvcName\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
        }

        if (qword_1EB30CE70 != -1) {
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
        }
        __int16 v30 = (id)qword_1EB30CE68;
        if (os_signpost_enabled(v30))
        {
          uint64_t v31 = [v14 UTF8String];
          uint64_t v32 = [v12 UTF8String];
          *(_DWORD *)uint64_t buf = 68290051;
          int v47 = 0;
          __int16 v48 = 2082;
          uint64_t v49 = &unk_1A45670B7;
          __int16 v50 = 2082;
          uint64_t v51 = (const char *)v31;
          __int16 v52 = 2082;
          v53 = (const char *)v32;
          __int16 v54 = 2082;
          __int16 v55 = "assert";
          __int16 v56 = 2081;
          __int16 v57 = "[oldEffectiveSvcName isEqual:newEffectiveSvcName]";
          _os_signpost_emit_with_name_impl(&dword_1A4540000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Old and new mappings and behaviors must agree about any service which has started", "{\"msg%{public}.0s\":\"Old and new mappings and behaviors must agree about any service which has started\", \"oldEffectiveSvcName\":%{public, location:escape_only}s, \"newEffectiveSvcName\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
        }

        if (qword_1EB30CE70 != -1) {
          dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
        }
        id v1 = (id)qword_1EB30CE68;
        if (os_log_type_enabled((os_log_t)v1, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = [v14 UTF8String];
          uint64_t v34 = [v12 UTF8String];
          *(_DWORD *)uint64_t buf = 68290051;
          int v47 = 0;
          __int16 v48 = 2082;
          uint64_t v49 = &unk_1A45670B7;
          __int16 v50 = 2082;
          uint64_t v51 = (const char *)v33;
          __int16 v52 = 2082;
          v53 = (const char *)v34;
          __int16 v54 = 2082;
          __int16 v55 = "assert";
          __int16 v56 = 2081;
          __int16 v57 = "[oldEffectiveSvcName isEqual:newEffectiveSvcName]";
          _os_log_impl(&dword_1A4540000, (os_log_t)v1, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Old and new mappings and behaviors must agree about any service which has started\", \"oldEffectiveSvcName\":%{public, location:escape_only}s, \"newEffectiveSvcName\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x3Au);
        }
        uint64_t v23 = 466;
LABEL_33:

        uint64_t v39 = v23;
        v40 = "-[CLServiceVendor setServiceReplacementMap:missBehavior:]_block_invoke";
        unint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationFramework/Shared/Intersilo/CLServiceVendor.mm";
        abort_report_np();
        goto LABEL_67;
      }

      ++v7;
    }
    while (v5 != v7);
    uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v58 count:16];
    if (v5) {
      continue;
    }
    break;
  }
LABEL_16:

  if (qword_1EB30CE70 != -1) {
    goto LABEL_68;
  }
LABEL_17:
  __int16 v15 = qword_1EB30CE68;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = (const char *)*((void *)v1 + 4);
    int v17 = *((_DWORD *)v1 + 12);
    *(_DWORD *)uint64_t buf = 68289538;
    int v47 = 0;
    __int16 v48 = 2082;
    uint64_t v49 = &unk_1A45670B7;
    __int16 v50 = 2114;
    uint64_t v51 = v16;
    __int16 v52 = 1026;
    LODWORD(v53) = v17;
    _os_log_impl(&dword_1A4540000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Configuring service replacement map\", \"ReplacementMap\":%{public, location:escape_only}@, \"MissBehavior\":%{public}d}", buf, 0x22u);
  }
  uint64_t v18 = objc_msgSend(*((id *)v1 + 4), "copy", v38, v39, v40);
  uint64_t v19 = *((void *)v1 + 5);
  uint64_t v20 = *(void **)(v19 + 16);
  *(void *)(v19 + 16) = v18;

  *(_DWORD *)(*((void *)v1 + 5) + 40) = *((_DWORD *)v1 + 12);
}

void sub_1A4562E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A4562EF8(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 80))
  {
    if ([*(id *)(*(void *)(a1 + 40) + 24) containsObject:*(void *)(a1 + 32)])
    {
      if (qword_1EB30CE70 != -1) {
        dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
      }
      double v2 = qword_1EB30CE68;
      if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v3 = *(const char **)(a1 + 32);
        uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 24);
        *(_DWORD *)uint64_t buf = 68289538;
        int v50 = 0;
        __int16 v51 = 2082;
        __int16 v52 = &unk_1A45670B7;
        __int16 v53 = 2114;
        __int16 v54 = v3;
        __int16 v55 = 2114;
        uint64_t v56 = v4;
        _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Trying to start an unavailable service\", \"RequestedServiceName\":%{public, location:escape_only}@, \"UnavailableServices\":%{public, location:escape_only}@}", buf, 0x26u);
      }
    }
    else
    {
      uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:*(void *)(a1 + 32)];
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v11 = *(id *)(*(void *)(a1 + 40) + 8);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v59 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v46;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v46 != v13) {
                objc_enumerationMutation(v11);
              }
              uint64_t v15 = *(void *)(*((void *)&v45 + 1) + 8 * i);
              uint64_t v16 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:v15];
              if ([*(id *)(a1 + 72) isEqual:objc_opt_class()])
              {
                objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v16);
                if (qword_1EB30CE70 != -1) {
                  dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
                }
                int v17 = qword_1EB30CE68;
                if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v18 = *(const char **)(a1 + 32);
                  uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
                  *(_DWORD *)uint64_t buf = 68289794;
                  int v50 = 0;
                  __int16 v51 = 2082;
                  __int16 v52 = &unk_1A45670B7;
                  __int16 v53 = 2114;
                  __int16 v54 = v18;
                  __int16 v55 = 2114;
                  uint64_t v56 = v19;
                  __int16 v57 = 2114;
                  uint64_t v58 = v15;
                  _os_log_impl(&dword_1A4540000, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Reusing replacement service under new name\", \"RequestedServiceName\":%{public, location:escape_only}@, \"EffectiveServiceName\":%{public, location:escape_only}@, \"ReusedFromServiceName\":%{public, location:escape_only}@}", buf, 0x30u);
                }

                goto LABEL_27;
              }
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v59 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_27:

        uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        if (v20)
        {
          [*(id *)(*(void *)(a1 + 40) + 8) setObject:v20 forKey:*(void *)(a1 + 32)];
        }
        else
        {
          int v21 = _os_activity_create(&dword_1A4540000, "CL: #Manufacturing service", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
          os_activity_scope_enter(v21, &state);
          if (qword_1EB30CE70 != -1) {
            dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
          }
          uint64_t v22 = qword_1EB30CE68;
          if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = *(void *)(a1 + 32);
            uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            *(_DWORD *)uint64_t buf = 68289794;
            int v50 = 0;
            __int16 v51 = 2082;
            __int16 v52 = &unk_1A45670B7;
            __int16 v53 = 2082;
            __int16 v54 = "activity";
            __int16 v55 = 2114;
            uint64_t v56 = v23;
            __int16 v57 = 2114;
            uint64_t v58 = v24;
            _os_log_impl(&dword_1A4540000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Manufacturing service\", \"event\":%{public, location:escape_only}s, \"RequestedServiceName\":%{public, location:escape_only}@, \"EffectiveServiceName\":%{public, location:escape_only}@}", buf, 0x30u);
          }
          id v25 = *(id *)(a1 + 48);
          if (*(void *)(*(void *)(a1 + 40) + 32))
          {
            uint64_t v26 = [*(id *)(a1 + 48) getTimeCoercibleVariantInstance];

            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = sub_1A45636C4;
            v41[3] = &unk_1E5B3EB70;
            id v25 = v26;
            uint64_t v27 = *(void *)(a1 + 40);
            id v42 = v25;
            uint64_t v43 = v27;
            [v25 async:v41];
            [*(id *)(*(void *)(a1 + 40) + 32) addObject:v25];
          }
          id v28 = objc_alloc_init(*(Class *)(a1 + 72));
          uint64_t v29 = *(void *)(*(void *)(a1 + 64) + 8);
          __int16 v30 = *(void **)(v29 + 40);
          *(void *)(v29 + 40) = v28;

          uint64_t v31 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          if (v31)
          {
            [v31 setSilo:v25];
            [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setVendor:*(void *)(a1 + 40)];
            v39[0] = MEMORY[0x1E4F143A8];
            v39[1] = 3221225472;
            v39[2] = sub_1A45636D4;
            v39[3] = &unk_1E5B3ECF0;
            int8x16_t v40 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
            [v25 async:v39];
            [*(id *)(*(void *)(a1 + 40) + 8) setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKey:*(void *)(a1 + 32)];
            uint64_t v32 = objc_opt_class();
            sub_1A454ED70(v32, *(void **)(a1 + 32));
          }
          else
          {
            uint64_t v33 = sub_1A4560528();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
            {
              uint64_t v34 = *(const char **)(a1 + 32);
              uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
              *(_DWORD *)uint64_t buf = 68289538;
              int v50 = 0;
              __int16 v51 = 2082;
              __int16 v52 = &unk_1A45670B7;
              __int16 v53 = 2114;
              __int16 v54 = v34;
              __int16 v55 = 2114;
              uint64_t v56 = v35;
              _os_log_impl(&dword_1A4540000, v33, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Failed to alloc and init key class for service\", \"RequestedServiceName\":%{public, location:escape_only}@, \"EffectiveServiceName\":%{public, location:escape_only}@}", buf, 0x26u);
            }

            uint64_t v36 = sub_1A4560528();
            if (os_signpost_enabled(v36))
            {
              int64_t v37 = *(const char **)(a1 + 32);
              uint64_t v38 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
              *(_DWORD *)uint64_t buf = 68289538;
              int v50 = 0;
              __int16 v51 = 2082;
              __int16 v52 = &unk_1A45670B7;
              __int16 v53 = 2114;
              __int16 v54 = v37;
              __int16 v55 = 2114;
              uint64_t v56 = v38;
              _os_signpost_emit_with_name_impl(&dword_1A4540000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to alloc and init key class for service", "{\"msg%{public}.0s\":\"Failed to alloc and init key class for service\", \"RequestedServiceName\":%{public, location:escape_only}@, \"EffectiveServiceName\":%{public, location:escape_only}@}", buf, 0x26u);
            }
          }
          os_activity_scope_leave(&state);
        }
      }
    }
  }
  else
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
    }
    uint64_t v5 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(const char **)(a1 + 32);
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)uint64_t buf = 68289538;
      int v50 = 0;
      __int16 v51 = 2082;
      __int16 v52 = &unk_1A45670B7;
      __int16 v53 = 2114;
      __int16 v54 = v6;
      __int16 v55 = 2114;
      uint64_t v56 = v7;
      _os_log_impl(&dword_1A4540000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Requested service not isSupported\", \"RequestedServiceName\":%{public, location:escape_only}@, \"EffectiveServiceName\":%{public, location:escape_only}@}", buf, 0x26u);
    }
    [*(id *)(*(void *)(a1 + 40) + 24) addObject:*(void *)(a1 + 32)];
  }
}

void sub_1A4563660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

uint64_t sub_1A45636C4(uint64_t a1)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel_setLatchedAbsoluteTimestamp_);
}

void sub_1A45636D4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setValid:1];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) beginService];
  if (qword_1EB30CE70 != -1) {
    dispatch_once(&qword_1EB30CE70, &unk_1EF7F5140);
  }
  double v2 = qword_1EB30CE68;
  if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v4[0] = 68289282;
    v4[1] = 0;
    __int16 v5 = 2082;
    uint64_t v6 = &unk_1A45670B7;
    __int16 v7 = 2114;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1A4540000, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Manufacturing service complete\", \"EffectiveServiceName\":%{public, location:escape_only}@}", (uint8_t *)v4, 0x1Cu);
  }
}

void sub_1A4563A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  id v28 = v27;

  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A4563A5C(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  __int16 v5 = objc_opt_class();
  if (v5)
  {
    uint64_t v6 = [v5 getSilo];
    __int16 v7 = qword_1EB30CEC8;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A456099C;
    block[3] = &unk_1E5B3EC10;
    id v13 = v6;
    id v8 = v6;
    dispatch_barrier_async(v7, block);
  }
  [*(id *)(a1[4] + 8) removeObjectForKey:a1[5]];
  uint64_t v9 = a1[5];
  uint64_t v10 = *(void **)(a1[4] + 24);
  return [v10 addObject:v9];
}

uint64_t sub_1A4563B60(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) endService];
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return [v2 setValid:0];
}

void sub_1A4563CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A4563D08(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = sub_1A4543D68(*(void **)(*(void *)(a1 + 32) + 16), *(_DWORD *)(*(void *)(a1 + 32) + 40), *(void **)(a1 + 40));
  return MEMORY[0x1F41817F8]();
}

void sub_1A4563E64(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1A456411C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1A4564158(uint64_t a1)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel_setLatchedAbsoluteTimestamp_);
}

uint64_t BSVersionedPIDForAuditToken()
{
  return MEMORY[0x1F410C6C0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1F40D7AB8](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1F40C9AB0](aBlock);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1F40D8BB0]();
}

void _Exit(int a1)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5D8](this, __s);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E8A0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
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

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return MEMORY[0x1F40D9630]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x1F40CCB20](start_size, *(void *)&flags);
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBC0](zone, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8C0](audittoken, buffer, *(void *)&buffersize);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1F4181B00](proto, outCount);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1F4181B10](p);
}

BOOL protocol_isEqual(Protocol *proto, Protocol *other)
{
  return MEMORY[0x1F4181B20](proto, other);
}

uint64_t pthread_dependency_init_np()
{
  return MEMORY[0x1F40CD9C8]();
}

uint64_t pthread_dependency_wait_np()
{
  return MEMORY[0x1F40CD9D0]();
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

int xpc_array_dup_fd(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1F40CEA40](xarray, index);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

void xpc_array_set_fd(xpc_object_t xarray, size_t index, int fd)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1F40CEC70]();
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

void xpc_connection_suspend(xpc_connection_t connection)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}