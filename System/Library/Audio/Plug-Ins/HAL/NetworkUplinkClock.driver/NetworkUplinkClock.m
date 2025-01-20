BOOL sub_40C4(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  BOOL result;

  v2 = 0;
  v3 = qword_14148 == -1;
  do
  {
    if (!v3) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    result = os_signpost_enabled((os_log_t)qword_14150[v2]);
    *(unsigned char *)(a1 + v2++) = result;
    v3 = 1;
  }
  while (v2 != 4);
  return result;
}

_UNKNOWN **NUC_Create(uint64_t a1, const void *a2)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  v3 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    *(_DWORD *)buf = 138412290;
    v9 = a2;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Create", "uuid %@", buf, 0xCu);
  }
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes(0, 0x44u, 0x3Au, 0xBAu, 0xB8u, 0xE7u, 0xB3u, 0x49u, 0x1Au, 0xB9u, 0x85u, 0xBEu, 0xB9u, 0x18u, 0x70u, 0x30u, 0xDBu);
  int v5 = CFEqual(a2, v4);
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  v6 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v9) = v5 != 0;
    _os_signpost_emit_with_name_impl(&dword_0, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Create", "success %{BOOL}d", buf, 8u);
  }
  return &off_14088;
}

void sub_4310()
{
}

void sub_43A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_D528(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_43DC(os_unfair_lock_s *a1)
{
  v2 = a1 + 24;
  os_unfair_lock_lock(a1 + 24);
  os_unfair_lock_lock(a1 + 25);
  if (sub_49A4((uint64_t)a1))
  {
    sub_4CA4((uint64_t)a1);
    sub_4DEC((uint64_t)a1);
  }
  sub_514C((uint64_t)a1);
  os_unfair_lock_unlock(a1 + 25);
  os_unfair_lock_unlock(v2);
  return 0;
}

void sub_446C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

char *sub_4488(char *a1, long long *a2, uint64_t a3, dispatch_queue_s *a4)
{
  *(void *)a1 = 0;
  *((void *)a1 + 1) = 0;
  long long v6 = *a2;
  long long v7 = a2[1];
  long long v8 = a2[2];
  a1[64] = *((unsigned char *)a2 + 48);
  *((_OWORD *)a1 + 2) = v7;
  *((_OWORD *)a1 + 3) = v8;
  *((_OWORD *)a1 + 1) = v6;
  v9 = (void *)*((void *)a2 + 7);
  if (v9) {
    v9 = _Block_copy(v9);
  }
  v10 = *(NSObject **)a2;
  *((void *)a1 + 9) = v9;
  *((void *)a1 + 10) = v10;
  if (v10)
  {
    dispatch_retain(v10);
    uint64_t v11 = *((void *)a1 + 10);
  }
  else
  {
    LODWORD(v11) = 0;
  }
  waipc::util::createSerialQueueWithQosAndTarget((waipc::util *)"com.apple.WirelessIPC.audio.NetworkUplinkClock.AudioSession", (const char *)&dword_14 + 1, (qos_class_t)v11, a4);
  *((_OWORD *)a1 + 8) = 0u;
  *((void *)a1 + 40) = 0;
  *((_OWORD *)a1 + 18) = 0u;
  *((_OWORD *)a1 + 19) = 0u;
  *((_OWORD *)a1 + 16) = 0u;
  *((_OWORD *)a1 + 17) = 0u;
  *((_OWORD *)a1 + 14) = 0u;
  *((_OWORD *)a1 + 15) = 0u;
  *((_OWORD *)a1 + 13) = 0u;
  *((_OWORD *)a1 + 10) = 0u;
  *((_OWORD *)a1 + 11) = 0u;
  *((_OWORD *)a1 + 12) = 0u;
  *((_OWORD *)a1 + 6) = 0u;
  *((_OWORD *)a1 + 7) = 0u;
  *(_OWORD *)(a1 + 137) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *((void *)a1 + 61) = 0;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  bzero(a1 + 496, 0x220uLL);
  v12 = a1 + 504;
  for (uint64_t i = 1016; i != 1040; i += 8)
  {
    *(void *)&a1[i] = v12;
    v12 += 168;
  }
  a1[1104] = 0;
  *((_OWORD *)a1 + 68) = 0u;
  *((_OWORD *)a1 + 67) = 0u;
  *((_OWORD *)a1 + 66) = 0u;
  *((_OWORD *)a1 + 65) = 0u;
  *(_OWORD *)(a1 + 1112) = 0u;
  *(_OWORD *)(a1 + 1128) = 0u;
  a1[1144] = 1;
  *((void *)a1 + 144) = 0;
  *((void *)a1 + 145) = mach_continuous_time();
  *((void *)a1 + 146) = 0;
  if (*((unsigned char *)a2 + 48)) {
    operator new();
  }
  *((void *)a1 + 147) = 0;
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  v14 = qword_14168;
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer((os_log_t)qword_14168, a1);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)v18 = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "AudioSession", "", v18, 2u);
    }
  }
  return a1;
}

void sub_474C(_Unwind_Exception *a1)
{
  v9 = v3;
  sub_DAD8(v9, 0);
  sub_DA38(v8);
  sub_D9E8(v7, 0);
  sub_D4DC(v6);
  sub_D4DC(v4);
  sub_D4DC(v5);
  uint64_t v11 = (std::__shared_weak_count *)v1[14];
  if (v11) {
    sub_D528(v11);
  }
  if (*v2) {
    dispatch_release(*v2);
  }
  v12 = v1[10];
  if (v12) {
    dispatch_release(v12);
  }
  sub_47E4((uint64_t)(v1 + 2));
  v13 = (std::__shared_weak_count *)v1[1];
  if (v13) {
    std::__shared_weak_count::__release_weak(v13);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_47E4(uint64_t a1)
{
  v2 = *(const void **)(a1 + 56);
  if (v2) {
    _Block_release(v2);
  }
  return a1;
}

uint64_t sub_4818(uint64_t a1)
{
  v2 = (os_unfair_lock_s *)(a1 + 96);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 100));
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  v3 = qword_14168;
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer((os_log_t)qword_14168, (const void *)a1);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_END, v5, "AudioSession", "", v12, 2u);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 100));
  os_unfair_lock_unlock(v2);
  sub_D8E8((uint64_t *)(a1 + 1176), 0);
  sub_DAD8((waipc::util::NonblockingEventSource **)(a1 + 1168), 0);
  sub_DA38(a1 + 496);
  sub_D9E8((waipc::util::GroupErrorTimer **)(a1 + 144), 0);
  sub_D4DC((const void **)(a1 + 136));
  sub_D4DC((const void **)(a1 + 128));
  sub_D4DC((const void **)(a1 + 120));
  long long v6 = *(std::__shared_weak_count **)(a1 + 112);
  if (v6) {
    sub_D528(v6);
  }
  long long v7 = *(NSObject **)(a1 + 88);
  if (v7) {
    dispatch_release(v7);
  }
  uint64_t v8 = *(NSObject **)(a1 + 80);
  if (v8) {
    dispatch_release(v8);
  }
  v9 = *(const void **)(a1 + 72);
  if (v9) {
    _Block_release(v9);
  }
  v10 = *(std::__shared_weak_count **)(a1 + 8);
  if (v10) {
    std::__shared_weak_count::__release_weak(v10);
  }
  return a1;
}

void sub_498C(void *a1)
{
}

uint64_t sub_49A4(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 96));
  if (*(void *)(a1 + 104)) {
    sub_DE70();
  }
  NetworkUplinkClock_getTimesyncOverride();
  long long v2 = v9;
  long long v9 = 0uLL;
  v3 = *(std::__shared_weak_count **)(a1 + 112);
  *(_OWORD *)(a1 + 104) = v2;
  if (v3)
  {
    sub_D528(v3);
    v3 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1)) {
      sub_D528(*((std::__shared_weak_count **)&v9 + 1));
    }
    if (*(void *)(a1 + 104)) {
      goto LABEL_12;
    }
  }
  else if ((void)v2)
  {
    goto LABEL_12;
  }
  waipc::timesync::BasebandConfig::getDefault((uint64_t *)&v9, (waipc::timesync::BasebandConfig *)v3);
  char v14 = *(unsigned char *)(a1 + 64);
  waipc::timesync::BasebandService::create();
  long long v4 = v8;
  long long v8 = 0uLL;
  os_signpost_id_t v5 = *(std::__shared_weak_count **)(a1 + 112);
  *(_OWORD *)(a1 + 104) = v4;
  if (v5)
  {
    sub_D528(v5);
    if (*((void *)&v8 + 1)) {
      sub_D528(*((std::__shared_weak_count **)&v8 + 1));
    }
    if (*(void *)(a1 + 104)) {
      goto LABEL_12;
    }
    return 0;
  }
  if (!(void)v4) {
    return 0;
  }
LABEL_12:
  *(void *)&long long v9 = 0;
  *((void *)&v9 + 1) = &v9;
  uint64_t v10 = 0x3802000000;
  uint64_t v11 = sub_51C0;
  v12 = sub_51DC;
  sub_DB28(&v8, (void *)a1);
  long long v6 = (std::__shared_weak_count *)*((void *)&v8 + 1);
  long long v13 = v8;
  if (*((void *)&v8 + 1))
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v8 + 1) + 16), 1uLL, memory_order_relaxed);
    sub_D528(v6);
  }
  waipc::timesync::BasebandService::addConnectionObserver();
  sub_53F4((void (***)(void))(a1 + 120), (const void **)&v8);
  sub_D4DC((const void **)&v8);
  waipc::timesync::BasebandService::addTimesyncObserver();
  sub_53F4((void (***)(void))(a1 + 128), (const void **)&v8);
  sub_D4DC((const void **)&v8);
  waipc::timesync::BasebandService::addTimestampObserver();
  sub_53F4((void (***)(void))(a1 + 136), (const void **)&v8);
  sub_D4DC((const void **)&v8);
  waipc::timesync::BasebandService::setTimestampRequiredForReady();
  _Block_object_dispose(&v9, 8);
  if (*((void *)&v13 + 1)) {
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v13 + 1));
  }
  return 1;
}

void sub_4C5C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  v3 = *(std::__shared_weak_count **)(v1 - 80);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_4CA4(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 96));
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 100));
  mach_continuous_time();
  waipc::SampleTimeline::SampleTimeline();
  *(_OWORD *)(a1 + 160) = v8;
  *(_OWORD *)(a1 + 176) = v9;
  *(_OWORD *)(a1 + 248) = v13;
  *(_OWORD *)(a1 + 264) = v14;
  *(_OWORD *)(a1 + 280) = v15;
  *(_OWORD *)(a1 + 200) = v10;
  *(_OWORD *)(a1 + 216) = v11;
  *(_OWORD *)(a1 + 232) = v12;
  *(_OWORD *)(a1 + 304) = v17;
  long long v2 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a1 + 328) = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(a1 + 344) = v2;
  long long v3 = *(_OWORD *)(a1 + 248);
  long long v4 = *(_OWORD *)(a1 + 280);
  *(_OWORD *)(a1 + 432) = *(_OWORD *)(a1 + 264);
  *(_OWORD *)(a1 + 448) = v4;
  long long v5 = *(_OWORD *)(a1 + 216);
  *(_OWORD *)(a1 + 368) = *(_OWORD *)(a1 + 200);
  *(_OWORD *)(a1 + 384) = v5;
  *(_OWORD *)(a1 + 400) = *(_OWORD *)(a1 + 232);
  *(_OWORD *)(a1 + 416) = v3;
  *(_OWORD *)(a1 + 472) = *(_OWORD *)(a1 + 304);
  *(void *)&long long v5 = *(void *)(a1 + 56);
  double v6 = *(double *)(a1 + 184);
  *(double *)&long long v2 = *(double *)(a1 + 48) * 1000000000.0 / v6 * 0.5;
  *(void *)(a1 + 296) = v16;
  *(void *)(a1 + 320) = v18;
  *(void *)(a1 + 464) = *(void *)(a1 + 296);
  *(void *)(a1 + 488) = *(void *)(a1 + 320);
  *(double *)(a1 + 1128) = *(double *)&v2 * *(double *)&v2;
  *(void *)(a1 + 1136) = (unint64_t)(*(double *)&v5 * 1000000000.0 / v6);
  return 1;
}

void sub_4DEC(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 96));
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3802000000;
  v5[3] = sub_51C0;
  v5[4] = sub_51DC;
  sub_DB28(&v3, (void *)a1);
  long long v2 = v4;
  v5[5] = v3;
  v5[6] = v4;
  if (v4)
  {
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_D528(v2);
  }
  operator new();
}

void sub_4F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24)
{
  if (a24) {
    std::__shared_weak_count::__release_weak(a24);
  }
  _Unwind_Resume(a1);
}

void sub_4F88(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 96));
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3802000000;
  v6[3] = sub_51C0;
  v6[4] = sub_51DC;
  sub_DB28(&v4, (void *)a1);
  long long v2 = v5;
  v6[5] = v4;
  v6[6] = v5;
  if (v5)
  {
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_D528(v2);
  }
  uint64_t v3 = *(void *)(a1 + 104);
  if (*(void *)(v3 + 416)) {
    dispatch_retain(*(dispatch_object_t *)(v3 + 416));
  }
  operator new();
}

void sub_50FC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24)
{
}

void sub_514C(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 100));
  uint64_t v2 = *(void *)(a1 + 1176);
  if (v2)
  {
    long long v3 = *(_OWORD *)(a1 + 1088);
    *(_OWORD *)uint64_t v2 = *(_OWORD *)(a1 + 1072);
    *(_OWORD *)(v2 + 16) = v3;
    long long v4 = *(_OWORD *)(a1 + 1056);
    *(_OWORD *)(v2 + 32) = *(_OWORD *)(a1 + 1040);
    *(_OWORD *)(v2 + 48) = v4;
    *(void *)(v2 + 64) = *(void *)(a1 + 1152);
    long long v5 = *(os_unfair_lock_s **)(a1 + 1176);
    sub_6184(v5 + 36, (uint64_t)v5);
  }
}

uint64_t sub_51C0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_51DC(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_51EC(uint64_t a1, int a2, const __CFString *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v3 + 48))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    long long v7 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(v3 + 48));
    if (v7)
    {
      long long v8 = v7;
      if (*(void *)(v3 + 40))
      {
        if (qword_14148 != -1) {
          dispatch_once(&qword_14148, &stru_10420);
        }
        long long v9 = qword_14158;
        if (os_signpost_enabled((os_log_t)qword_14158))
        {
          v11[0] = 67109378;
          v11[1] = a2;
          __int16 v12 = 2112;
          CFStringRef v13 = a3;
          _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AudioSession_ConnectCB", "connected %{BOOL}d, reason %@", (uint8_t *)v11, 0x12u);
        }
        os_unfair_lock_lock((os_unfair_lock_t)(v6 + 96));
        if (a2)
        {
          *(unsigned char *)(v6 + 152) = 0;
        }
        else
        {
          *(unsigned char *)(v6 + 1104) = 0;
          atomic_store(1u, (unsigned __int8 *)(v6 + 1144));
          if (!*(unsigned char *)(v6 + 152))
          {
            if (qword_14148 != -1) {
              dispatch_once(&qword_14148, &stru_10420);
            }
            long long v10 = qword_14160;
            if (os_signpost_enabled((os_log_t)qword_14160))
            {
              LOWORD(v11[0]) = 0;
              _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AudioSession_ErrorTimerStart", "", (uint8_t *)v11, 2u);
            }
            *(unsigned char *)(v6 + 152) = 1;
            waipc::util::GroupErrorTimer::start(*(waipc::util::GroupErrorTimer **)(v6 + 144), a3);
          }
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 96));
      }
      sub_D528(v8);
    }
  }
}

void sub_53D8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  sub_D528(v1);
  _Unwind_Resume(a1);
}

void (***sub_53F4(void (***a1)(void), const void **a2))(void)
{
  long long v4 = *a1;
  if (v4) {
    v4[2]();
  }
  long long v5 = (void (**)(void))*a2;
  *a2 = 0;
  uint64_t v6 = *a1;
  *a1 = v5;
  if (v6) {
    _Block_release(v6);
  }
  long long v7 = *a2;
  *a2 = 0;
  if (v7) {
    _Block_release(v7);
  }
  return a1;
}

void sub_5460(uint64_t a1, waipc::timesync::KalmanEstimator *a2, BOOL a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v3 + 48))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    long long v7 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(v3 + 48));
    if (v7)
    {
      long long v8 = v7;
      if (*(void *)(v3 + 40))
      {
        if (qword_14148 != -1) {
          dispatch_once(&qword_14148, &stru_10420);
        }
        long long v9 = qword_14160;
        if (os_signpost_enabled((os_log_t)qword_14160))
        {
          long long v10 = (const void *)waipc::timesync::KalmanEstimator::dumpState(a2);
          LODWORD(v14[0]) = 138412546;
          *(void *)((char *)v14 + 4) = v10;
          WORD6(v14[0]) = 1024;
          *(_DWORD *)((char *)v14 + 14) = a3;
          _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AudioSession_TimesyncCB", "estimator %@, reset %{BOOL}d", (uint8_t *)v14, 0x12u);
          if (v10) {
            CFRelease(v10);
          }
        }
        os_unfair_lock_lock((os_unfair_lock_t)(v6 + 96));
        waipc::SampleTimeline::updateTimesync((waipc::SampleTimeline *)(v6 + 160), a2, a3);
        if (a3) {
          atomic_store(0, (unsigned __int8 *)(v6 + 1144));
        }
        sub_56A4((os_unfair_lock_t)(v6 + 496), v6 + 160);
        if (a3) {
          a3 = *(unsigned char *)(v6 + 1104) != 0;
        }
        memset(v14, 0, sizeof(v14));
        waipc::SampleTimeline::timestampFromDevice((waipc::SampleTimeline *)(v6 + 160));
        unint64_t v11 = *(void *)(v6 + 1120);
        double v12 = *(double *)(v6 + 176);
        os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 96));
        if (a3)
        {
          uint64_t v13 = *(void *)(v6 + 72);
          if (v13) {
            (*(void (**)(uint64_t, _OWORD *, double))(v13 + 16))(v13, v14, v12 * (double)v11);
          }
        }
      }
      sub_D528(v8);
    }
  }
}

void sub_5640(_Unwind_Exception *a1)
{
  sub_D528(v1);
  _Unwind_Resume(a1);
}

const void **sub_5670(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_56A4(os_unfair_lock_t lock, uint64_t a2)
{
  if (lock) {
    os_unfair_lock_lock(lock);
  }
  unint64_t v4 = sub_DBB8((uint64_t)lock);
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v4 = *(_OWORD *)a2;
  *(_OWORD *)(v4 + 16) = v5;
  long long v6 = *(_OWORD *)(a2 + 40);
  long long v7 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(v4 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(v4 + 56) = v7;
  *(_OWORD *)(v4 + 40) = v6;
  long long v8 = *(_OWORD *)(a2 + 88);
  long long v9 = *(_OWORD *)(a2 + 104);
  long long v10 = *(_OWORD *)(a2 + 120);
  *(void *)(v4 + 136) = *(void *)(a2 + 136);
  *(_OWORD *)(v4 + 120) = v10;
  *(_OWORD *)(v4 + 104) = v9;
  *(_OWORD *)(v4 + 88) = v8;
  long long v11 = *(_OWORD *)(a2 + 144);
  *(void *)(v4 + 160) = *(void *)(a2 + 160);
  *(_OWORD *)(v4 + 144) = v11;
  unint64_t v12 = atomic_exchange((atomic_ullong *volatile)&lock[128], v4);
  if (v12) {
    sub_DA74((uint64_t)lock, v12);
  }
  if (lock)
  {
    os_unfair_lock_unlock(lock);
  }
}

void sub_5784(_Unwind_Exception *exception_object)
{
  if (v1) {
    os_unfair_lock_unlock(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_57A0(uint64_t a1, unint64_t a2, uint64_t a3, double a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v4 + 48))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    long long v9 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(v4 + 48));
    if (v9)
    {
      long long v10 = v9;
      if (*(void *)(v4 + 40))
      {
        if (qword_14148 != -1) {
          dispatch_once(&qword_14148, &stru_10420);
        }
        long long v11 = qword_14160;
        if (os_signpost_enabled((os_log_t)qword_14160))
        {
          *(_DWORD *)buf = 134218496;
          *(void *)&uint8_t buf[4] = a2;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = a4;
          *(_WORD *)&buf[22] = 2048;
          *(void *)&buf[24] = a3;
          _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AudioSession_TimestampCB", "timestamp %llu, granularity %lf, interval %llu", buf, 0x20u);
        }
        os_unfair_lock_lock((os_unfair_lock_t)(v8 + 96));
        double v12 = a4 / *(double *)(v8 + 176);
        if (v12 == 1.0) {
          unint64_t v13 = a2;
        }
        else {
          unint64_t v13 = (unint64_t)(v12 * (double)a2);
        }
        if (!*(unsigned char *)(v8 + 1104) || (unsigned __int8 v14 = atomic_load((unsigned __int8 *)(v8 + 1144)), (v14 & 1) != 0))
        {
          unsigned __int8 v15 = atomic_load((unsigned __int8 *)(v8 + 1144));
          *(unsigned char *)(v8 + 1104) = 1;
          *(void *)(v8 + 1112) = v13;
          *(void *)(v8 + 1120) = a3;
          if ((v15 & 1) == 0)
          {
            waipc::SampleTimeline::timestampFromDevice((waipc::SampleTimeline *)(v8 + 160));
            *(_OWORD *)buf = v19;
            *(_OWORD *)&buf[16] = v20;
            unint64_t v16 = *(void *)(v8 + 1120);
            double v17 = *(double *)(v8 + 176);
            os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 96));
            uint64_t v18 = *(void *)(v8 + 72);
            if (v18) {
              (*(void (**)(uint64_t, unsigned char *, double))(v18 + 16))(v18, buf, v17 * (double)v16);
            }
            goto LABEL_18;
          }
        }
        else
        {
          *(unsigned char *)(v8 + 1104) = 1;
          *(void *)(v8 + 1112) = v13;
          *(void *)(v8 + 1120) = a3;
          atomic_store(1u, (unsigned __int8 *)(v8 + 1144));
          waipc::timesync::BasebandService::triggerReset(*(waipc::timesync::BasebandService **)(v8 + 104));
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 96));
      }
LABEL_18:
      sub_D528(v10);
    }
  }
}

void sub_59AC(_Unwind_Exception *a1)
{
  sub_D528(v1);
  _Unwind_Resume(a1);
}

void sub_59C8(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(std::__shared_weak_count **)(v3 + 48);
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    long long v7 = std::__shared_weak_count::lock(v4);
    if (v7)
    {
      uint64_t v8 = v7;
      if (*(void *)(v3 + 40))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v6 + 96));
        if (a2) {
          waipc::timesync::BasebandService::triggerMeasurement(*(waipc::timesync::BasebandService **)(v6 + 104));
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 96));
      }
      sub_D528(v8);
    }
  }
}

void sub_5A60(_Unwind_Exception *a1)
{
  sub_D528(v1);
  _Unwind_Resume(a1);
}

void sub_5A74(uint64_t a1, const __CFString *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(std::__shared_weak_count **)(v3 + 48);
  if (v4)
  {
    uint64_t v6 = *(os_unfair_lock_s **)(a1 + 40);
    long long v7 = std::__shared_weak_count::lock(v4);
    if (v7)
    {
      uint64_t v8 = v7;
      if (*(void *)(v3 + 40))
      {
        long long v9 = v6 + 24;
        os_unfair_lock_lock(v6 + 24);
        if (qword_14148 != -1) {
          dispatch_once(&qword_14148, &stru_10420);
        }
        long long v10 = qword_14160;
        if (os_signpost_enabled((os_log_t)qword_14160))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AudioSession_ErrorTimerExpiry", "", buf, 2u);
        }
        if (!a2 || !CFStringGetLength(a2)) {
          a2 = @"unknown error";
        }
        long long v11 = (const void *)_CTServerConnectionCreateOnTargetQueue();
        *(void *)buf = v11;
        if (v11)
        {
          if (qword_14148 != -1) {
            dispatch_once(&qword_14148, &stru_10420);
          }
          double v12 = qword_14158;
          if (os_signpost_enabled((os_log_t)qword_14158))
          {
            *(_WORD *)unsigned __int8 v15 = 0;
            _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AudioSession_ResetModem", "", v15, 2u);
          }
          MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, @"PCIe audio error: ");
          *(void *)unsigned __int8 v15 = MutableCopy;
          CFStringAppend(MutableCopy, a2);
          _CTServerConnectionResetModemWithCrashLogs();
          if (MutableCopy) {
            CFRelease(MutableCopy);
          }
          CFRelease(v11);
        }
        else
        {
          if (qword_14148 != -1) {
            dispatch_once(&qword_14148, &stru_10420);
          }
          unsigned __int8 v14 = qword_14150[0];
          if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)unsigned __int8 v15 = 0;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "failed to open CTServer connection", v15, 2u);
          }
        }
        os_unfair_lock_unlock(v9);
      }
      sub_D528(v8);
    }
  }
}

void sub_5CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_5D54((const void **)va);
  os_unfair_lock_unlock(v4);
  sub_D528(v3);
  _Unwind_Resume(a1);
}

const void **sub_5D20(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_5D54(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

BOOL sub_5D88(uint64_t a1, BOOL a2)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v4 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    int v11 = 67109120;
    BOOL v12 = a2;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AudioSession_WaitUntilReady", "timeout %u", (uint8_t *)&v11, 8u);
  }
  uint64_t v5 = *(void *)(a1 + 104);
  uint64_t v6 = *(NSObject **)(v5 + 416);
  if (v6) {
    dispatch_retain(*(dispatch_object_t *)(v5 + 416));
  }
  dispatch_time_t v7 = dispatch_time(0, 1000000 * a2);
  intptr_t v8 = dispatch_group_wait(v6, v7);
  if (v6) {
    dispatch_release(v6);
  }
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  long long v9 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    int v11 = 67109120;
    BOOL v12 = v8 != 0;
    _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AudioSession_WaitUntilReady", "timed out %{BOOL}d", (uint8_t *)&v11, 8u);
  }
  return v8 == 0;
}

void sub_5F40(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 100);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 100));
  uint64_t v5 = mach_continuous_time();
  sub_60B8(a1 + 496, a1 + 328);
  waipc::SampleTimeline::currentTimestamp((waipc::SampleTimeline *)(a1 + 328));
  *(_OWORD *)(a1 + 1040) = v11;
  *(_OWORD *)(a1 + 1056) = v12;
  waipc::SampleTimeline::nextHostVariance((waipc::SampleTimeline *)(a1 + 328));
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)(a1 + 1144));
  if (((v7 & 1) != 0 || v6 >= *(double *)(a1 + 1128)) && v5 >= *(void *)(a1 + 1136) + *(void *)(a1 + 1152))
  {
    waipc::util::NonblockingEventSource::trigger(*(waipc::util::NonblockingEventSource **)(a1 + 1168), 1u);
    *(void *)(a1 + 1152) = v5;
  }
  BOOL v8 = *(double *)(a1 + 1040) <= *(double *)(a1 + 1072) && *(void *)(a1 + 1064) == *(void *)(a1 + 1096);
  if (*(void *)(a1 + 1048) < v5 && !v8)
  {
    long long v9 = *(_OWORD *)(a1 + 1056);
    *(_OWORD *)(a1 + 1072) = *(_OWORD *)(a1 + 1040);
    *(_OWORD *)(a1 + 1088) = v9;
  }
  sub_514C(a1);
  mach_get_times();
  *a2 = *(void *)(a1 + 1072);
  uint64_t v10 = *(void *)(a1 + 1096);
  a2[1] = *(void *)(a1 + 1080);
  a2[2] = v10;
  os_unfair_lock_unlock(v4);
}

void sub_6090(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL sub_60B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 4));
  unint64_t v5 = atomic_exchange((atomic_ullong *volatile)(a1 + 512), 0);
  if (v5)
  {
    if (a2)
    {
      long long v6 = *(_OWORD *)(v5 + 16);
      *(_OWORD *)a2 = *(_OWORD *)v5;
      *(_OWORD *)(a2 + 16) = v6;
      long long v7 = *(_OWORD *)(v5 + 104);
      long long v8 = *(_OWORD *)(v5 + 120);
      uint64_t v9 = *(void *)(v5 + 136);
      *(_OWORD *)(a2 + 88) = *(_OWORD *)(v5 + 88);
      *(void *)(a2 + 136) = v9;
      *(_OWORD *)(a2 + 120) = v8;
      *(_OWORD *)(a2 + 104) = v7;
      long long v10 = *(_OWORD *)(v5 + 40);
      long long v11 = *(_OWORD *)(v5 + 56);
      *(_OWORD *)(a2 + 72) = *(_OWORD *)(v5 + 72);
      *(_OWORD *)(a2 + 56) = v11;
      *(_OWORD *)(a2 + 40) = v10;
      long long v12 = *(_OWORD *)(v5 + 144);
      *(void *)(a2 + 160) = *(void *)(v5 + 160);
      *(_OWORD *)(a2 + 144) = v12;
    }
    sub_DA74(a1, v5);
  }
  os_unfair_lock_unlock(v4);
  return v5 != 0;
}

void sub_6170(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_6184(os_unfair_lock_t lock, uint64_t a2)
{
  if (lock) {
    os_unfair_lock_lock(lock);
  }
  unint64_t v4 = sub_DBF4((uint64_t)lock);
  *(_OWORD *)unint64_t v4 = *(_OWORD *)a2;
  long long v5 = *(_OWORD *)(a2 + 16);
  long long v6 = *(_OWORD *)(a2 + 32);
  long long v7 = *(_OWORD *)(a2 + 48);
  *(void *)(v4 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(v4 + 32) = v6;
  *(_OWORD *)(v4 + 48) = v7;
  *(_OWORD *)(v4 + 16) = v5;
  unint64_t v8 = atomic_exchange((atomic_ullong *volatile)&lock[56], v4);
  if (v8) {
    sub_D984((uint64_t)lock, v8);
  }
  if (lock)
  {
    os_unfair_lock_unlock(lock);
  }
}

void sub_6214(_Unwind_Exception *exception_object)
{
  if (v1) {
    os_unfair_lock_unlock(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_6230(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 96);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  uint64_t v3 = *(void *)(a1 + 1176);
  if (v3)
  {
    v23 = v2;
    sub_66F0(v3 + 144, v3 + 72);
    uint64_t v4 = *(void *)(a1 + 1176);
    mach_timebase_info(&info);
    uint64_t v5 = mach_continuous_time();
    uint64_t v6 = *(void *)(a1 + 1160);
    uint64_t numer = info.numer;
    unint64_t denom = info.denom;
    sub_DC30(v32, @"Sample Rate", (uint64_t *)(a1 + 24));
    sub_DCF0(&v33, @"Timestamp Period", (uint64_t *)(a1 + 32));
    sub_DDB0(&v34, @"Error Timeout", (int *)(a1 + 40));
    sub_DC30(&v35, @"Error Threshold", (uint64_t *)(a1 + 48));
    sub_DC30(v36, @"Measurement Moderation", (uint64_t *)(a1 + 56));
    uint64_t v9 = *(waipc::timesync::BasebandService **)(a1 + 104);
    if (v9) {
      uint64_t v9 = (waipc::timesync::BasebandService *)waipc::timesync::BasebandService::dumpState(v9);
    }
    v36[2] = @"Timesync";
    v36[3] = v9;
    CFTypeRef v29 = 0;
    if (waipc::util::GroupErrorTimer::isRunning(*(waipc::util::GroupErrorTimer **)(a1 + 144))) {
      CFBooleanRef v10 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v10 = kCFBooleanFalse;
    }
    v36[4] = @"Error Timer Running";
    v36[5] = v10;
    uint64_t v11 = waipc::util::GroupErrorTimer::copyReason(*(waipc::util::GroupErrorTimer **)(a1 + 144));
    v36[6] = @"Error Reason";
    v36[7] = v11;
    CFTypeRef v28 = 0;
    if (*(unsigned char *)(a1 + 152)) {
      CFBooleanRef v12 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v12 = kCFBooleanFalse;
    }
    v36[8] = @"Error Timer Started for Connection";
    v36[9] = v12;
    uint64_t v13 = waipc::SampleTimeline::dumpState((waipc::SampleTimeline *)(a1 + 160));
    v36[10] = @"Timeline";
    v36[11] = v13;
    CFTypeRef v27 = 0;
    sub_678C((uint64_t *)(v4 + 104), &cf);
    v36[12] = @"Current Timestamp";
    CFTypeRef v14 = cf;
    if (cf) {
      CFRetain(cf);
    }
    v36[13] = v14;
    sub_678C((uint64_t *)(v4 + 72), &v25);
    v36[14] = @"Last Timestamp";
    CFTypeRef v15 = v25;
    if (v25) {
      CFRetain(v25);
    }
    v36[15] = v15;
    v36[16] = @"Uplink Schedule Valid";
    if (*(unsigned char *)(a1 + 1104)) {
      CFBooleanRef v16 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v16 = kCFBooleanFalse;
    }
    v36[17] = v16;
    sub_DCF0(&v37, @"Uplink Schedule Basis", (uint64_t *)(a1 + 1112));
    sub_DCF0(v38, @"Uplink Schedule Interval", (uint64_t *)(a1 + 1120));
    unsigned __int8 v17 = atomic_load((unsigned __int8 *)(a1 + 1144));
    if (v17) {
      CFBooleanRef v18 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v18 = kCFBooleanFalse;
    }
    v38[2] = @"Timeline Reset Pending";
    v38[3] = v18;
    sub_DCF0(&v39, @"Last Measurement Time", (uint64_t *)(a1 + 1152));
    sub_DCF0(&v40, @"Start Time", (uint64_t *)(a1 + 1160));
    double v24 = (double)((v5 - v6) * numer / denom) / 1000000000.0;
    sub_D59C(&v41, @"Duration", (uint64_t *)&v24);
    uint64_t v2 = v23;
    sub_69E0((uint64_t)v32, &v30);
    for (uint64_t i = 37; i != -1; i -= 2)
    {
      long long v20 = (const void *)v32[i];
      if (v20) {
        CFRelease(v20);
      }
    }
    if (v25) {
      CFRelease(v25);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (v27) {
      CFRelease(v27);
    }
    if (v28) {
      CFRelease(v28);
    }
    if (v29) {
      CFRelease(v29);
    }
    uint64_t v21 = v30;
  }
  else
  {
    uint64_t v21 = 0;
  }
  os_unfair_lock_unlock(v2);
  return v21;
}

void sub_65D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock, uint64_t a11, char a12, int a13, __int16 a14, char a15, char a16, int a17, __int16 a18, char a19, char a20,int a21,__int16 a22,char a23,char a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,char a31)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_498C(exception_object);
}

BOOL sub_66F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 4));
  unint64_t v5 = atomic_exchange((atomic_ullong *volatile)(a1 + 224), 0);
  if (v5)
  {
    if (a2)
    {
      *(_OWORD *)a2 = *(_OWORD *)v5;
      long long v6 = *(_OWORD *)(v5 + 16);
      long long v7 = *(_OWORD *)(v5 + 32);
      long long v8 = *(_OWORD *)(v5 + 48);
      *(void *)(a2 + 64) = *(void *)(v5 + 64);
      *(_OWORD *)(a2 + 32) = v7;
      *(_OWORD *)(a2 + 48) = v8;
      *(_OWORD *)(a2 + 16) = v6;
    }
    sub_D984(a1, v5);
  }
  os_unfair_lock_unlock(v4);
  return v5 != 0;
}

void sub_6778(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_678C(uint64_t *a1@<X1>, void *a2@<X8>)
{
  sub_DC30(v6, @"Sample", a1);
  sub_DCF0(&v7, @"Host", a1 + 1);
  sub_DCF0(&v8, @"Device", a1 + 2);
  sub_DCF0(&v9, @"Seed", a1 + 3);
  sub_68DC((uint64_t)v6, a2);
  for (uint64_t i = 7; i != -1; i -= 2)
  {
    unint64_t v5 = (const void *)v6[i];
    if (v5) {
      CFRelease(v5);
    }
  }
}

void sub_687C(_Unwind_Exception *a1)
{
  for (uint64_t i = 48; i != -16; i -= 16)
    sub_69AC(v1 + i);
  _Unwind_Resume(a1);
}

void *sub_68DC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  *(_OWORD *)keys = 0u;
  long long v11 = 0u;
  memset(v9, 0, sizeof(v9));
  do
  {
    unint64_t v5 = *(void **)(a1 + v3);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((void *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 64);
  CFDictionaryRef v7 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)v9, v4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  return sub_C778(a2, v7);
}

uint64_t sub_69AC(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_69E0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  *(_OWORD *)keys = 0u;
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  do
  {
    unint64_t v5 = *(void **)(a1 + v3);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((void *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 304);
  CFDictionaryRef v7 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)v9, v4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  return sub_C778(a2, v7);
}

const void **sub_6AD8(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_6B0C(id a1)
{
  for (uint64_t i = 0; i != 4; ++i)
    qword_14150[i] = (uint64_t)os_log_create("com.apple.WirelessIPC.audio.NetworkUplinkClock", (&off_10440)[i]);
}

uint64_t sub_6B68(_UNKNOWN **a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v8 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "QueryInterface", "", buf, 2u);
  }
  if (a1 == &off_14088)
  {
    if (a4)
    {
      *(void *)&v20.byte0 = a2;
      *(void *)&v20.byte8 = a3;
      CFUUIDRef v12 = CFUUIDCreateFromUUIDBytes(0, v20);
      if (v12)
      {
        if (qword_14148 != -1) {
          dispatch_once(&qword_14148, &stru_10420);
        }
        long long v13 = qword_14160;
        if (os_signpost_enabled((os_log_t)qword_14160))
        {
          *(_DWORD *)buf = 138412290;
          CFUUIDRef v19 = v12;
          _os_signpost_emit_with_name_impl(&dword_0, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "QueryInterface", "uuid %@", buf, 0xCu);
        }
        CFUUIDRef v14 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
        if (CFEqual(v12, v14)
          || (CFUUIDRef v15 = CFUUIDGetConstantUUIDWithBytes(0, 0xEEu, 0xA5u, 0x77u, 0x3Du, 0xCCu, 0x43u, 0x49u, 0xF1u, 0x8Eu, 0, 0x8Fu, 0x96u, 0xE7u, 0xD2u, 0x3Bu, 0x17u), CFEqual(v12, v15)))
        {
          sub_6FA8(&off_14088);
          uint64_t v9 = 0;
          *a4 = &off_14088;
        }
        else
        {
          uint64_t v9 = 2147483652;
        }
        goto LABEL_20;
      }
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
      uint64_t v9 = 1852797029;
      uint64_t v10 = qword_14150[0];
      if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        long long v11 = "failed to create CFUUID";
        goto LABEL_10;
      }
    }
    else
    {
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
      uint64_t v9 = 1852797029;
      uint64_t v10 = qword_14150[0];
      if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        long long v11 = "nowhere to store returned interface";
        goto LABEL_10;
      }
    }
LABEL_30:
    CFUUIDRef v12 = 0;
    goto LABEL_31;
  }
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v9 = 560947818;
  uint64_t v10 = qword_14150[0];
  if (!os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO)) {
    goto LABEL_30;
  }
  *(_WORD *)buf = 0;
  long long v11 = "bad driver reference";
LABEL_10:
  _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, v11, buf, 2u);
  CFUUIDRef v12 = 0;
LABEL_20:
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
LABEL_31:
  long long v16 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = v9;
    _os_signpost_emit_with_name_impl(&dword_0, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "QueryInterface", "success %{waipc:4cc}u", buf, 8u);
  }
  if (v12) {
    CFRelease(v12);
  }
  return v9;
}

void sub_6F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_C238((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_6FA8(_UNKNOWN **a1)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v2 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    LOWORD(v7[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AddRef", "", (uint8_t *)v7, 2u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_14008);
  if (a1 == &off_14088)
  {
    if (dword_14028 != -1)
    {
      uint64_t v4 = ++dword_14028;
      goto LABEL_13;
    }
  }
  else
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v3 = qword_14150[0];
    if (!os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = 0;
      goto LABEL_16;
    }
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "bad driver reference", (uint8_t *)v7, 2u);
  }
  uint64_t v4 = 0;
LABEL_13:
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
LABEL_16:
  unint64_t v5 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_signpost_emit_with_name_impl(&dword_0, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AddRef", "result %u", (uint8_t *)v7, 8u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_14008);
  return v4;
}

uint64_t sub_71B0(_UNKNOWN **a1)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v2 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    LOWORD(v7[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Release", "", (uint8_t *)v7, 2u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_14008);
  if (a1 == &off_14088)
  {
    if (dword_14028)
    {
      uint64_t v4 = --dword_14028;
      goto LABEL_13;
    }
  }
  else
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v3 = qword_14150[0];
    if (!os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = 0;
      goto LABEL_16;
    }
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "bad driver reference", (uint8_t *)v7, 2u);
  }
  uint64_t v4 = 0;
LABEL_13:
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
LABEL_16:
  unint64_t v5 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_signpost_emit_with_name_impl(&dword_0, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Release", "result %u", (uint8_t *)v7, 8u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_14008);
  return v4;
}

uint64_t sub_73B4(_UNKNOWN **a1, int *a2)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v4 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    LOWORD(v12[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Initialize", "", (uint8_t *)v12, 2u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_14008);
  if (a1 == &off_14088)
  {
    off_14000[0] = a2;
    uint64_t v8 = dispatch_workloop_create("com.apple.WirelessIPC.audio.NetworkUplinkClock");
    qword_14010 = (uint64_t)v8;
    uint64_t v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    qword_14018 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.WirelessIPC.audio.NetworkUplinkClock.PlugIn", v9, v8);
    os_unfair_lock_assert_owner((const os_unfair_lock *)&unk_14008);
    if (!os_variant_has_internal_diagnostics() || (qword_14020 = os_state_add_handler()) != 0)
    {
      uint64_t v5 = 0;
LABEL_14:
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
      goto LABEL_16;
    }
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v5 = 2003329396;
    uint64_t v6 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v12[0]) = 0;
      CFDictionaryRef v7 = "failed to add state handler";
      goto LABEL_10;
    }
  }
  else
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v12[0]) = 0;
      CFDictionaryRef v7 = "bad driver reference";
LABEL_10:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)v12, 2u);
      goto LABEL_14;
    }
  }
LABEL_16:
  uint64_t v10 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    v12[0] = 67109120;
    v12[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Initialize", "result %{waipc:4cc}u", (uint8_t *)v12, 8u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_14008);
  return v5;
}

void sub_768C(_Unwind_Exception *a1)
{
}

uint64_t sub_76A4(_UNKNOWN **a1)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v2 = qword_14160;
  if (!os_signpost_enabled((os_log_t)qword_14160))
  {
    if (a1 == &off_14088)
    {
      uint64_t v4 = 1970171760;
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  LOWORD(v8[0]) = 0;
  _os_signpost_emit_with_name_impl(&dword_0, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CreateDevice", "", (uint8_t *)v8, 2u);
  uint64_t v3 = qword_14148;
  if (a1 != &off_14088)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
LABEL_8:
    uint64_t v4 = 560947818;
    uint64_t v5 = qword_14150[0];
    if (!os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "bad driver reference", (uint8_t *)v8, 2u);
    uint64_t v3 = qword_14148;
    goto LABEL_11;
  }
  uint64_t v4 = 1970171760;
LABEL_11:
  if (v3 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
LABEL_14:
  uint64_t v6 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_signpost_emit_with_name_impl(&dword_0, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CreateDevice", "result %{waipc:4cc}u", (uint8_t *)v8, 8u);
  }
  return v4;
}

uint64_t sub_7898(_UNKNOWN **a1)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v2 = qword_14160;
  if (!os_signpost_enabled((os_log_t)qword_14160))
  {
    if (a1 == &off_14088)
    {
      uint64_t v4 = 1970171760;
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  LOWORD(v8[0]) = 0;
  _os_signpost_emit_with_name_impl(&dword_0, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DestroyDevice", "", (uint8_t *)v8, 2u);
  uint64_t v3 = qword_14148;
  if (a1 != &off_14088)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
LABEL_8:
    uint64_t v4 = 560947818;
    uint64_t v5 = qword_14150[0];
    if (!os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "bad driver reference", (uint8_t *)v8, 2u);
    uint64_t v3 = qword_14148;
    goto LABEL_11;
  }
  uint64_t v4 = 1970171760;
LABEL_11:
  if (v3 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
LABEL_14:
  uint64_t v6 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_signpost_emit_with_name_impl(&dword_0, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DestroyDevice", "result %{waipc:4cc}u", (uint8_t *)v8, 8u);
  }
  return v4;
}

uint64_t sub_7A8C(_UNKNOWN **a1, int a2)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v4 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    LOWORD(v10[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AddDeviceClient", "", (uint8_t *)v10, 2u);
  }
  if (a1 == &off_14088)
  {
    if (a2 == 2)
    {
      uint64_t v5 = 0;
      goto LABEL_17;
    }
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      CFDictionaryRef v7 = "bad device ID";
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      CFDictionaryRef v7 = "bad driver reference";
LABEL_16:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)v10, 2u);
LABEL_17:
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
    }
  }
  uint64_t v8 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    v10[0] = 67109120;
    v10[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AddDeviceClient", "result %{waipc:4cc}u", (uint8_t *)v10, 8u);
  }
  return v5;
}

uint64_t sub_7CD4(_UNKNOWN **a1, int a2)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v4 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    LOWORD(v10[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RemoveDeviceClient", "", (uint8_t *)v10, 2u);
  }
  if (a1 == &off_14088)
  {
    if (a2 == 2)
    {
      uint64_t v5 = 0;
      goto LABEL_17;
    }
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      CFDictionaryRef v7 = "bad device ID";
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      CFDictionaryRef v7 = "bad driver reference";
LABEL_16:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)v10, 2u);
LABEL_17:
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
    }
  }
  uint64_t v8 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    v10[0] = 67109120;
    v10[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RemoveDeviceClient", "result %{waipc:4cc}u", (uint8_t *)v10, 8u);
  }
  return v5;
}

uint64_t sub_7F1C(_UNKNOWN **a1, int a2, uint64_t a3, void (**a4)(void, void))
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v8 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    LOWORD(v20[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PerformDeviceConfigurationChange", "", (uint8_t *)v20, 2u);
  }
  if (a1 == &off_14088)
  {
    if (a2 == 2)
    {
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
      CFUUIDRef v12 = qword_14168;
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer((os_log_t)qword_14168, a4);
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v14 = v13;
        if (os_signpost_enabled(v12))
        {
          LOWORD(v20[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_EVENT, v14, "DeviceConfigurationChange", "perform", (uint8_t *)v20, 2u);
        }
      }
      if (a3) {
        sub_DEC8();
      }
      if (!a4) {
        sub_DE9C();
      }
      a4[2](a4, 1);
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
      CFUUIDRef v15 = qword_14168;
      os_signpost_id_t v16 = os_signpost_id_make_with_pointer((os_log_t)qword_14168, a4);
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v17 = v16;
        if (os_signpost_enabled(v15))
        {
          LOWORD(v20[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_0, v15, OS_SIGNPOST_INTERVAL_END, v17, "DeviceConfigurationChange", "done", (uint8_t *)v20, 2u);
        }
      }
      _Block_release(a4);
      uint64_t v9 = 0;
      goto LABEL_29;
    }
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v9 = 560947818;
    uint64_t v10 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v20[0]) = 0;
      long long v11 = "bad device ID";
      goto LABEL_28;
    }
  }
  else
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v9 = 560947818;
    uint64_t v10 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v20[0]) = 0;
      long long v11 = "bad driver reference";
LABEL_28:
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)v20, 2u);
LABEL_29:
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
    }
  }
  long long v18 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    v20[0] = 67109120;
    v20[1] = v9;
    _os_signpost_emit_with_name_impl(&dword_0, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PerformDeviceConfigurationChange", "result %{waipc:4cc}u", (uint8_t *)v20, 8u);
  }
  return v9;
}

uint64_t sub_82A8(_UNKNOWN **a1, int a2, uint64_t a3, void (**a4)(void, void))
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v8 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    LOWORD(v20[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AbortDeviceConfigurationChange", "", (uint8_t *)v20, 2u);
  }
  if (a1 == &off_14088)
  {
    if (a2 == 2)
    {
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
      CFUUIDRef v12 = qword_14168;
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer((os_log_t)qword_14168, a4);
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v14 = v13;
        if (os_signpost_enabled(v12))
        {
          LOWORD(v20[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_EVENT, v14, "DeviceConfigurationChange", "aborted", (uint8_t *)v20, 2u);
        }
      }
      if (a3) {
        sub_DF20();
      }
      if (!a4) {
        sub_DEF4();
      }
      a4[2](a4, 0);
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
      CFUUIDRef v15 = qword_14168;
      os_signpost_id_t v16 = os_signpost_id_make_with_pointer((os_log_t)qword_14168, a4);
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v17 = v16;
        if (os_signpost_enabled(v15))
        {
          LOWORD(v20[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_0, v15, OS_SIGNPOST_INTERVAL_END, v17, "DeviceConfigurationChange", "done", (uint8_t *)v20, 2u);
        }
      }
      _Block_release(a4);
      uint64_t v9 = 0;
      goto LABEL_29;
    }
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v9 = 560947818;
    uint64_t v10 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v20[0]) = 0;
      long long v11 = "bad device ID";
      goto LABEL_28;
    }
  }
  else
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v9 = 560947818;
    uint64_t v10 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v20[0]) = 0;
      long long v11 = "bad driver reference";
LABEL_28:
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)v20, 2u);
LABEL_29:
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
    }
  }
  long long v18 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    v20[0] = 67109120;
    v20[1] = v9;
    _os_signpost_emit_with_name_impl(&dword_0, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AbortDeviceConfigurationChange", "result %{waipc:4cc}u", (uint8_t *)v20, 8u);
  }
  return v9;
}

uint64_t sub_8634(_UNKNOWN **a1, int a2, uint64_t a3, int *a4)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  CFDictionaryRef v7 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    int v8 = *a4;
    int v9 = a4[1];
    int v10 = a4[2];
    int v20 = 67109888;
    int v21 = a2;
    __int16 v22 = 1024;
    int v23 = v8;
    __int16 v24 = 1024;
    int v25 = v9;
    __int16 v26 = 1024;
    int v27 = v10;
    _os_signpost_emit_with_name_impl(&dword_0, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HasProperty", "object %u, selector %{waipc:4cc}u, scope %{waipc:4cc}u, element %u", (uint8_t *)&v20, 0x1Au);
  }
  if (a1 != &off_14088)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    long long v11 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      CFUUIDRef v12 = "bad driver reference";
LABEL_10:
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v20, 2u);
LABEL_11:
      uint64_t v13 = 0;
      goto LABEL_64;
    }
    goto LABEL_23;
  }
  if (!a4)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    long long v11 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      CFUUIDRef v12 = "no address";
      goto LABEL_10;
    }
LABEL_23:
    uint64_t v13 = 0;
    goto LABEL_66;
  }
  if (a2 == 2)
  {
    uint64_t v13 = 0;
    int v14 = *a4;
    if (*a4 > 1818850925)
    {
      if (v14 <= 1853059699)
      {
        if (v14 > 1819173228)
        {
          if (v14 != 1819173229 && v14 != 1819569763)
          {
            int v16 = 1853059619;
            goto LABEL_62;
          }
          goto LABEL_63;
        }
        int v17 = 1818850926;
LABEL_56:
        if (v14 == v17) {
          goto LABEL_63;
        }
        int v16 = 1819107691;
        goto LABEL_62;
      }
      if (v14 > 1919512166)
      {
        if (v14 != 1919512167 && v14 != 1953653102) {
          goto LABEL_47;
        }
        goto LABEL_63;
      }
      if (v14 == 1853059700) {
        goto LABEL_63;
      }
      int v16 = 1870098020;
    }
    else if (v14 > 1668050794)
    {
      if (v14 > 1668639075)
      {
        if (v14 != 1668639076 && v14 != 1668641652)
        {
          int v16 = 1735354734;
          goto LABEL_62;
        }
        goto LABEL_63;
      }
      if (v14 == 1668050795) {
        goto LABEL_63;
      }
      int v16 = 1668510818;
    }
    else
    {
      if (v14 > 1650682994)
      {
        if (v14 == 1650682995 || v14 == 1668047219) {
          goto LABEL_63;
        }
        unsigned __int16 v15 = 27492;
        goto LABEL_39;
      }
      if (v14 == 1396918340) {
        goto LABEL_63;
      }
      int v16 = 1414746691;
    }
LABEL_62:
    if (v14 != v16) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
  if (a2 != 1) {
    goto LABEL_11;
  }
  uint64_t v13 = 0;
  int v14 = *a4;
  if (*a4 <= 1819173228)
  {
    if (v14 <= 1668049698)
    {
      if (v14 == 1650682995 || v14 == 1651472419) {
        goto LABEL_63;
      }
      unsigned __int16 v15 = 24947;
LABEL_39:
      int v16 = v15 | 0x636C0000;
      goto LABEL_62;
    }
    if (v14 == 1668049699) {
      goto LABEL_63;
    }
    int v17 = 1684370979;
    goto LABEL_56;
  }
  if (v14 <= 1937007733)
  {
    if (v14 == 1819173229 || v14 == 1870098020) {
      goto LABEL_63;
    }
    int v16 = 1920168547;
    goto LABEL_62;
  }
  if ((v14 - 1969841250) >= 3)
  {
LABEL_47:
    int v16 = 1937007734;
    goto LABEL_62;
  }
LABEL_63:
  uint64_t v13 = 1;
LABEL_64:
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
LABEL_66:
  long long v18 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    int v20 = 67109120;
    int v21 = v13;
    _os_signpost_emit_with_name_impl(&dword_0, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HasProperty", "result %{BOOL}d", (uint8_t *)&v20, 8u);
  }
  return v13;
}

uint64_t sub_8B10(_UNKNOWN **a1, int a2, uint64_t a3, int *a4, char *a5)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  int v9 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    int v10 = *a4;
    int v11 = a4[1];
    int v12 = a4[2];
    int v24 = 67109888;
    int v25 = a2;
    __int16 v26 = 1024;
    int v27 = v10;
    __int16 v28 = 1024;
    int v29 = v11;
    __int16 v30 = 1024;
    int v31 = v12;
    _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IsPropertySettable", "object %u, selector %{waipc:4cc}u, scope %{waipc:4cc}u, element %u", (uint8_t *)&v24, 0x1Au);
  }
  if (a1 != &off_14088)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v13 = 560947818;
    int v14 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      unsigned __int16 v15 = "bad driver reference";
LABEL_10:
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v24, 2u);
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if (a4)
  {
    if (!a5)
    {
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
      uint64_t v13 = 1852797029;
      int v14 = qword_14150[0];
      if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        unsigned __int16 v15 = "nowhere to store result";
        goto LABEL_10;
      }
      goto LABEL_13;
    }
    if (a2 != 2)
    {
      if (a2 != 1)
      {
        uint64_t v13 = 560947818;
        goto LABEL_11;
      }
      uint64_t v13 = 2003332927;
      int v18 = *a4;
      if (*a4 <= 1819173228)
      {
        if (v18 > 1668049698)
        {
          if (v18 == 1668049699 || v18 == 1684370979) {
            goto LABEL_66;
          }
          int v19 = 1819107691;
        }
        else
        {
          if (v18 == 1650682995 || v18 == 1651472419) {
            goto LABEL_66;
          }
          int v19 = 1668047219;
        }
      }
      else
      {
        if (v18 > 1937007733)
        {
          if ((v18 - 1969841250) >= 3)
          {
            int v19 = 1937007734;
            goto LABEL_65;
          }
LABEL_66:
          uint64_t v13 = 0;
          *a5 = 0;
          goto LABEL_11;
        }
        if (v18 == 1819173229 || v18 == 1870098020) {
          goto LABEL_66;
        }
        int v19 = 1920168547;
      }
LABEL_65:
      if (v18 != v19) {
        goto LABEL_11;
      }
      goto LABEL_66;
    }
    char v21 = 0;
    uint64_t v13 = 2003332927;
    int v22 = *a4;
    if (*a4 <= 1818850925)
    {
      if (v22 > 1668050794)
      {
        if (v22 <= 1668639075)
        {
          if (v22 == 1668050795) {
            goto LABEL_79;
          }
          int v23 = 1668510818;
        }
        else
        {
          if (v22 == 1668639076 || v22 == 1668641652) {
            goto LABEL_79;
          }
          int v23 = 1735354734;
        }
        goto LABEL_76;
      }
      if (v22 > 1650682994)
      {
        if (v22 == 1650682995 || v22 == 1668047219) {
          goto LABEL_79;
        }
        int v23 = 1668049764;
        goto LABEL_76;
      }
      if (v22 == 1396918340) {
        goto LABEL_79;
      }
      if (v22 != 1414746691) {
        goto LABEL_11;
      }
LABEL_78:
      char v21 = 1;
      goto LABEL_79;
    }
    if (v22 <= 1853059699)
    {
      if (v22 <= 1819173228)
      {
        if (v22 == 1818850926) {
          goto LABEL_79;
        }
        int v23 = 1819107691;
      }
      else
      {
        if (v22 == 1819173229 || v22 == 1819569763) {
          goto LABEL_79;
        }
        int v23 = 1853059619;
      }
      goto LABEL_76;
    }
    if (v22 <= 1919512166)
    {
      if (v22 == 1853059700) {
        goto LABEL_78;
      }
      int v23 = 1870098020;
    }
    else
    {
      if (v22 == 1919512167 || v22 == 1937007734) {
        goto LABEL_79;
      }
      int v23 = 1953653102;
    }
LABEL_76:
    if (v22 != v23)
    {
LABEL_11:
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
      goto LABEL_13;
    }
LABEL_79:
    uint64_t v13 = 0;
    *a5 = v21;
    goto LABEL_11;
  }
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v13 = 1852797029;
  int v14 = qword_14150[0];
  if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
  {
    LOWORD(v24) = 0;
    unsigned __int16 v15 = "no address";
    goto LABEL_10;
  }
LABEL_13:
  int v16 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    if (a5) {
      int v17 = *a5;
    }
    else {
      int v17 = 0;
    }
    int v24 = 67109376;
    int v25 = v13;
    __int16 v26 = 1024;
    int v27 = v17;
    _os_signpost_emit_with_name_impl(&dword_0, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IsPropertySettable", "result %{waipc:4cc}u, isSettable %{BOOL}d", (uint8_t *)&v24, 0xEu);
  }
  return v13;
}

uint64_t sub_90D0(_UNKNOWN **a1, int a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, int *a7)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  int v11 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    int v12 = *a4;
    int v13 = a4[1];
    int v14 = a4[2];
    int v26 = 67109888;
    int v27 = a2;
    __int16 v28 = 1024;
    int v29 = v12;
    __int16 v30 = 1024;
    int v31 = v13;
    __int16 v32 = 1024;
    int v33 = v14;
    _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GetPropertyDataSize", "object %u, selector %{waipc:4cc}u, scope %{waipc:4cc}u, element %u", (uint8_t *)&v26, 0x1Au);
  }
  if (a1 != &off_14088)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v15 = 560947818;
    int v16 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      int v17 = "bad driver reference";
LABEL_10:
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v26, 2u);
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if (a4)
  {
    if (!a7)
    {
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
      uint64_t v15 = 1852797029;
      int v16 = qword_14150[0];
      if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        int v17 = "nowhere to store result";
        goto LABEL_10;
      }
      goto LABEL_13;
    }
    if (a2 == 2)
    {
      uint64_t v15 = 2003332927;
      int v20 = *a4;
      int v21 = 4;
      if (*a4 <= 1818850925)
      {
        if (v20 > 1668050794)
        {
          if (v20 <= 1668639075)
          {
            if (v20 == 1668050795) {
              goto LABEL_81;
            }
            int v22 = 1668510818;
            goto LABEL_75;
          }
          if (v20 != 1668639076)
          {
            if (v20 == 1668641652)
            {
              int v21 = 24;
              goto LABEL_81;
            }
            int v22 = 1735354734;
            goto LABEL_75;
          }
          goto LABEL_80;
        }
        if (v20 <= 1650682994)
        {
          if (v20 != 1396918340)
          {
            int v22 = 1414746691;
            goto LABEL_75;
          }
          goto LABEL_80;
        }
        if (v20 == 1650682995 || v20 == 1668047219) {
          goto LABEL_81;
        }
        unsigned __int16 v24 = 27492;
LABEL_52:
        int v22 = v24 | 0x636C0000;
        goto LABEL_75;
      }
      if (v20 > 1853059699)
      {
        if (v20 > 1919512166)
        {
          if (v20 == 1919512167 || v20 == 1937007734) {
            goto LABEL_81;
          }
          int v22 = 1953653102;
          goto LABEL_75;
        }
        if (v20 == 1853059700) {
          goto LABEL_80;
        }
        if (v20 != 1870098020) {
          goto LABEL_11;
        }
        goto LABEL_79;
      }
      if (v20 > 1819173228)
      {
        if (v20 != 1819173229)
        {
          if (v20 != 1819569763)
          {
            if (v20 != 1853059619) {
              goto LABEL_11;
            }
            int v21 = 16;
          }
          goto LABEL_81;
        }
        goto LABEL_80;
      }
      if (v20 == 1818850926) {
        goto LABEL_81;
      }
    }
    else
    {
      if (a2 != 1)
      {
        uint64_t v15 = 560947818;
        goto LABEL_11;
      }
      uint64_t v15 = 2003332927;
      int v20 = *a4;
      int v21 = 4;
      if (*a4 > 1819173228)
      {
        if (v20 > 1937007733)
        {
          if ((v20 - 1969841250) < 3) {
            goto LABEL_81;
          }
          int v22 = 1937007734;
LABEL_75:
          if (v20 != v22)
          {
LABEL_11:
            if (qword_14148 != -1) {
              dispatch_once(&qword_14148, &stru_10420);
            }
            goto LABEL_13;
          }
LABEL_81:
          uint64_t v15 = 0;
          *a7 = v21;
          goto LABEL_11;
        }
        if (v20 != 1819173229)
        {
          if (v20 == 1870098020) {
            goto LABEL_81;
          }
          int v25 = 1920168547;
          goto LABEL_71;
        }
LABEL_80:
        int v21 = 8;
        goto LABEL_81;
      }
      if (v20 <= 1668049698)
      {
        if (v20 == 1650682995) {
          goto LABEL_81;
        }
        if (v20 != 1651472419)
        {
          unsigned __int16 v24 = 24947;
          goto LABEL_52;
        }
LABEL_79:
        int v21 = 0;
        goto LABEL_81;
      }
      if (v20 == 1668049699) {
        goto LABEL_81;
      }
      if (v20 == 1684370979) {
        goto LABEL_79;
      }
    }
    int v25 = 1819107691;
LABEL_71:
    if (v20 != v25) {
      goto LABEL_11;
    }
    goto LABEL_80;
  }
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v15 = 1852797029;
  int v16 = qword_14150[0];
  if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
  {
    LOWORD(v26) = 0;
    int v17 = "no address";
    goto LABEL_10;
  }
LABEL_13:
  int v18 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    if (a7) {
      int v19 = *a7;
    }
    else {
      int v19 = 0;
    }
    int v26 = 67109376;
    int v27 = v15;
    __int16 v28 = 1024;
    int v29 = v19;
    _os_signpost_emit_with_name_impl(&dword_0, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GetPropertyDataSize", "result %{waipc:4cc}u, dataSize %u", (uint8_t *)&v26, 0xEu);
  }
  return v15;
}

uint64_t sub_9698(_UNKNOWN **a1, int a2, int a3, int *a4, unsigned int a5, CFStringRef *a6, unsigned int a7, int *a8, _DWORD *__dst)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  int v16 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    int v17 = *a4;
    int v18 = a4[1];
    int v19 = a4[2];
    int v44 = 67109888;
    *(_DWORD *)v45 = a2;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v17;
    __int16 v46 = 1024;
    int v47 = v18;
    __int16 v48 = 1024;
    int v49 = v19;
    _os_signpost_emit_with_name_impl(&dword_0, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GetPropertyData", "object %u, selector %{waipc:4cc}u, scope %{waipc:4cc}u, element %u", (uint8_t *)&v44, 0x1Au);
  }
  if (a1 != &off_14088)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v20 = 560947818;
    int v21 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v44) = 0;
      int v22 = "bad driver reference";
LABEL_10:
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v44, 2u);
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if (a4)
  {
    if (!a8)
    {
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
      uint64_t v20 = 1852797029;
      int v21 = qword_14150[0];
      if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
      {
        LOWORD(v44) = 0;
        int v22 = "nowhere to store result size";
        goto LABEL_10;
      }
      goto LABEL_13;
    }
    if (!__dst)
    {
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
      uint64_t v20 = 1852797029;
      int v21 = qword_14150[0];
      if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
      {
        LOWORD(v44) = 0;
        int v22 = "nowhere to store result";
        goto LABEL_10;
      }
      goto LABEL_13;
    }
    if (a2 != 2)
    {
      if (a2 != 1)
      {
        uint64_t v20 = 560947818;
        goto LABEL_11;
      }
      uint64_t v20 = 2003332927;
      int v25 = *a4;
      if (*a4 > 1819173228)
      {
        if (v25 > 1937007733)
        {
          if (v25 <= 1969841250)
          {
            if (v25 == 1937007734) {
              goto LABEL_87;
            }
            unsigned __int16 v26 = 25698;
            goto LABEL_85;
          }
          if (v25 != 1969841251)
          {
            unsigned __int16 v26 = 25700;
LABEL_85:
            int v28 = v26 | 0x75690000;
LABEL_86:
            if (v25 != v28) {
              goto LABEL_11;
            }
LABEL_87:
            if (a7 >= 4)
            {
              uint64_t v20 = 0;
              *__dst = 0;
LABEL_147:
              int v39 = 4;
              goto LABEL_148;
            }
LABEL_142:
            uint64_t v20 = 561211770;
            goto LABEL_11;
          }
          uint64_t v20 = 561211770;
          if (a5 < 8) {
            goto LABEL_11;
          }
          if (a6)
          {
            if (qword_14148 != -1) {
              dispatch_once(&qword_14148, &stru_10420);
            }
            v36 = qword_14160;
            if (os_signpost_enabled((os_log_t)qword_14160))
            {
              CFStringRef v37 = *a6;
              int v44 = 138412290;
              *(void *)v45 = v37;
              _os_signpost_emit_with_name_impl(&dword_0, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetPropertyData", "uid %@", (uint8_t *)&v44, 0xCu);
            }
            CFComparisonResult v38 = CFStringCompare(*a6, @"NetworkUplinkClock_UID", 0);
            if (a7 < 4) {
              goto LABEL_11;
            }
            uint64_t v20 = 0;
            int v32 = 2 * (v38 == kCFCompareEqualTo);
            goto LABEL_146;
          }
          uint64_t v20 = 1852797029;
LABEL_11:
          if (qword_14148 != -1) {
            dispatch_once(&qword_14148, &stru_10420);
          }
          goto LABEL_13;
        }
        if (v25 != 1819173229)
        {
          if (v25 != 1870098020)
          {
            if (v25 != 1920168547) {
              goto LABEL_11;
            }
            if (a7 < 8) {
              goto LABEL_142;
            }
            uint64_t v20 = 0;
            CFStringRef v34 = &stru_10A18;
            goto LABEL_126;
          }
LABEL_89:
          int v44 = 2;
          int v35 = a7 >> 2;
          if (a7 >= 4) {
            int v35 = 1;
          }
          if (v35)
          {
            size_t v30 = (4 * v35);
            int v31 = &v44;
            goto LABEL_131;
          }
          goto LABEL_132;
        }
        if (a7 < 8) {
          goto LABEL_142;
        }
        uint64_t v20 = 0;
        CFStringRef v34 = @"Network Uplink PlugIn";
LABEL_126:
        *(void *)__dst = v34;
        int v39 = 8;
LABEL_148:
        *a8 = v39;
        goto LABEL_11;
      }
      if (v25 <= 1668049698)
      {
        if (v25 != 1650682995)
        {
          if (v25 != 1651472419)
          {
            if (v25 != 1668047219) {
              goto LABEL_11;
            }
            if (a7 < 4) {
              goto LABEL_142;
            }
            uint64_t v20 = 0;
            int v32 = 1634757735;
            goto LABEL_146;
          }
LABEL_109:
          uint64_t v20 = 0;
          *a8 = 0;
          goto LABEL_11;
        }
        goto LABEL_93;
      }
      if (v25 == 1668049699) {
        goto LABEL_89;
      }
      if (v25 == 1684370979) {
        goto LABEL_109;
      }
LABEL_100:
      if (v25 != 1819107691) {
        goto LABEL_11;
      }
      if (a7 < 8) {
        goto LABEL_142;
      }
      uint64_t v20 = 0;
      CFStringRef v34 = @"Apple Inc.";
      goto LABEL_126;
    }
    uint64_t v20 = 2003332927;
    int v25 = *a4;
    if (*a4 > 1818850925)
    {
      if (v25 > 1853059699)
      {
        if (v25 <= 1919512166)
        {
          if (v25 != 1853059700)
          {
            if (v25 != 1870098020) {
              goto LABEL_11;
            }
            goto LABEL_109;
          }
          os_unfair_lock_lock((os_unfair_lock_t)&unk_14008);
          if (a7 >= 8)
          {
            uint64_t v20 = 0;
            *(void *)__dst = qword_14030;
            int v41 = 8;
            goto LABEL_150;
          }
          goto LABEL_144;
        }
        if (v25 == 1919512167)
        {
          os_unfair_lock_lock((os_unfair_lock_t)&unk_14008);
          if (a7 >= 4)
          {
            uint64_t v20 = 0;
            unsigned int v33 = vcvtad_u64_f64(*(double *)&qword_14030 * 0.3);
            goto LABEL_136;
          }
          goto LABEL_144;
        }
        if (v25 != 1937007734)
        {
          if (v25 != 1953653102) {
            goto LABEL_11;
          }
          if (a7 < 4) {
            goto LABEL_142;
          }
          uint64_t v20 = 0;
          int v32 = 1885563168;
          goto LABEL_146;
        }
      }
      else
      {
        if (v25 > 1819173228)
        {
          if (v25 != 1819173229)
          {
            if (v25 == 1819569763) {
              goto LABEL_87;
            }
            if (v25 != 1853059619) {
              goto LABEL_11;
            }
            int v29 = a7 >> 4;
            if (a7 >= 0x10) {
              int v29 = 1;
            }
            if (v29)
            {
              size_t v30 = (16 * v29);
              int v31 = (int *)&unk_E6B8;
LABEL_131:
              memcpy(__dst, v31, v30);
LABEL_133:
              uint64_t v20 = 0;
              *a8 = v30;
              goto LABEL_11;
            }
LABEL_132:
            LODWORD(v30) = 0;
            goto LABEL_133;
          }
          if (a7 < 8) {
            goto LABEL_142;
          }
          uint64_t v20 = 0;
          CFStringRef v34 = @"Network Uplink Clock Device";
          goto LABEL_126;
        }
        if (v25 != 1818850926) {
          goto LABEL_100;
        }
      }
    }
    else
    {
      if (v25 <= 1668050794)
      {
        if (v25 > 1650682994)
        {
          if (v25 != 1650682995)
          {
            if (v25 != 1668047219)
            {
              int v28 = 1668049764;
              goto LABEL_86;
            }
            if (a7 < 4) {
              goto LABEL_142;
            }
            uint64_t v20 = 0;
            int v32 = 1633905771;
LABEL_146:
            *__dst = v32;
            goto LABEL_147;
          }
LABEL_93:
          if (a7 < 4) {
            goto LABEL_142;
          }
          uint64_t v20 = 0;
          int v32 = 1634689642;
          goto LABEL_146;
        }
        if (v25 == 1396918340)
        {
          os_unfair_lock_lock((os_unfair_lock_t)&unk_14048);
          uint64_t v42 = qword_14050;
          if (qword_14050) {
            CFRetain((CFTypeRef)qword_14050);
          }
          if (a7 >= 8)
          {
            uint64_t v20 = 0;
            *(void *)__dst = v42;
            *a8 = 8;
          }
          else
          {
            uint64_t v20 = 561211770;
          }
          v43 = (os_unfair_lock_s *)&unk_14048;
          goto LABEL_152;
        }
        if (v25 != 1414746691) {
          goto LABEL_11;
        }
        os_unfair_lock_lock((os_unfair_lock_t)&unk_14008);
        if (a7 >= 4)
        {
          uint64_t v20 = 0;
          unsigned int v33 = *(_DWORD *)aLlec;
          goto LABEL_136;
        }
        goto LABEL_144;
      }
      if (v25 > 1668639075)
      {
        if (v25 == 1668639076)
        {
          if (a7 < 8) {
            goto LABEL_142;
          }
          uint64_t v20 = 0;
          CFStringRef v34 = @"NetworkUplinkClock_UID";
          goto LABEL_126;
        }
        if (v25 == 1668641652)
        {
          unsigned int v40 = a7 / 0xC;
          if (a7 / 0xC >= 2) {
            unsigned int v40 = 2;
          }
          if (v40)
          {
            size_t v30 = 12 * v40;
            int v31 = (int *)"DHCStslp";
            goto LABEL_131;
          }
          goto LABEL_132;
        }
        if (v25 != 1735354734) {
          goto LABEL_11;
        }
        os_unfair_lock_lock((os_unfair_lock_t)&unk_14008);
        if (a7 >= 4)
        {
          uint64_t v20 = 0;
          unsigned int v33 = dword_1402C != 0;
LABEL_136:
          *__dst = v33;
          int v41 = 4;
LABEL_150:
          *a8 = v41;
          goto LABEL_151;
        }
LABEL_144:
        uint64_t v20 = 561211770;
LABEL_151:
        v43 = (os_unfair_lock_s *)&unk_14008;
LABEL_152:
        os_unfair_lock_unlock(v43);
        goto LABEL_11;
      }
      if (v25 == 1668050795)
      {
        if (a7 < 4) {
          goto LABEL_142;
        }
        uint64_t v20 = 0;
        int v32 = 1835103847;
        goto LABEL_146;
      }
      if (v25 != 1668510818) {
        goto LABEL_11;
      }
    }
    if (a7 < 4) {
      goto LABEL_142;
    }
    uint64_t v20 = 0;
    int v32 = 1;
    goto LABEL_146;
  }
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v20 = 1852797029;
  int v21 = qword_14150[0];
  if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
  {
    LOWORD(v44) = 0;
    int v22 = "no address";
    goto LABEL_10;
  }
LABEL_13:
  int v23 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    if (a8) {
      int v24 = *a8;
    }
    else {
      int v24 = 0;
    }
    int v44 = 67109376;
    *(_DWORD *)v45 = v20;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v24;
    _os_signpost_emit_with_name_impl(&dword_0, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GetPropertyData", "result %{waipc:4cc}u, dataSize %u", (uint8_t *)&v44, 0xEu);
  }
  return v20;
}

void sub_A0B0(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_498C(a1);
}

uint64_t sub_A0BC(_UNKNOWN **a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, unsigned int a7, double *a8)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  int v13 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    int v14 = *a4;
    int v15 = a4[1];
    int v16 = a4[2];
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&uint8_t buf[4] = a2;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v14;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&uint8_t buf[16] = v15;
    *(_WORD *)&buf[20] = 1024;
    *(_DWORD *)&buf[22] = v16;
    _os_signpost_emit_with_name_impl(&dword_0, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetPropertyData", "object %u, selector %{waipc:4cc}u, scope %{waipc:4cc}u, element %u", buf, 0x1Au);
  }
  memset(&v48[4], 0, 20);
  if (!off_14000[0]) {
    sub_DF4C();
  }
  if (a1 != &off_14088)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    int v17 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "bad driver reference", buf, 2u);
    }
    int v18 = 560947818;
LABEL_12:
    unsigned int v47 = v18;
    goto LABEL_13;
  }
  if (!a4)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    int v21 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "no address", buf, 2u);
    }
    int v18 = 1852797029;
    goto LABEL_12;
  }
  if (a2 != 2)
  {
    if (a2 == 1)
    {
      unsigned int v47 = 2003332927;
      memset(&v48[4], 0, 20);
    }
    else
    {
      memset(&buf[4], 0, 20);
      unsigned int v47 = 560947818;
      *(_OWORD *)__int16 v48 = *(unsigned int *)buf;
      *(void *)&v48[16] = 0;
    }
    goto LABEL_13;
  }
  if (*a4 != 1414746691)
  {
    if (*a4 != 1853059700)
    {
      a8 = 0;
      int v22 = 2003332927;
      goto LABEL_88;
    }
    if (a7 >= 8)
    {
      int v22 = 1852797029;
      if (a8)
      {
        if (qword_14148 != -1) {
          dispatch_once(&qword_14148, &stru_10420);
        }
        int v23 = qword_14160;
        if (os_signpost_enabled((os_log_t)qword_14160))
        {
          double v24 = *a8;
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = v24;
          _os_signpost_emit_with_name_impl(&dword_0, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetPropertyData", "NominalSampleRate %lf", buf, 0xCu);
        }
        double v25 = *a8;
        if (*a8 < 8000.0 || v25 > 48000.0)
        {
          if (qword_14148 != -1) {
            dispatch_once(&qword_14148, &stru_10420);
          }
          int v35 = qword_14150[0];
          if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
          {
            double v36 = *a8;
            *(_DWORD *)buf = 134217984;
            *(double *)&uint8_t buf[4] = v36;
            _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "unsupported sample rate %lf", buf, 0xCu);
          }
        }
        else
        {
          os_unfair_lock_lock((os_unfair_lock_t)&unk_14008);
          uint64_t v26 = qword_14030;
          if (*(double *)&qword_14030 != v25)
          {
            uint64_t v49 = 0;
            v50 = &v49;
            uint64_t v51 = 0x2000000000;
            uint64_t v52 = 0;
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 0x40000000;
            *(void *)&uint8_t buf[16] = sub_CA70;
            *(void *)&buf[24] = &unk_104A8;
            double v60 = v25;
            v59 = &v49;
            int v27 = _Block_copy(buf);
            v50[3] = (uint64_t)v27;
            if (qword_14148 != -1) {
              dispatch_once(&qword_14148, &stru_10420);
            }
            int v28 = qword_14158;
            os_signpost_id_t v29 = os_signpost_id_make_with_pointer((os_log_t)qword_14158, (const void *)v50[3]);
            if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v30 = v29;
              if (os_signpost_enabled(v28))
              {
                *(_DWORD *)aBlock = 134218240;
                *(void *)&aBlock[4] = v26;
                *(_WORD *)&aBlock[12] = 2048;
                *(double *)&aBlock[14] = v25;
                _os_signpost_emit_with_name_impl(&dword_0, v28, OS_SIGNPOST_INTERVAL_BEGIN, v30, "SampleRateChange", "oldRate %lf, newRate %lf", aBlock, 0x16u);
              }
            }
            if (qword_14148 != -1) {
              dispatch_once(&qword_14148, &stru_10420);
            }
            if (os_signpost_enabled((os_log_t)qword_14168))
            {
              *(void *)aBlock = _NSConcreteStackBlock;
              *(void *)&aBlock[8] = 0x40000000;
              *(void *)&aBlock[16] = sub_CB94;
              v62 = &unk_104D0;
              v63 = v27;
              int v31 = _Block_copy(aBlock);
            }
            else
            {
              int v31 = _Block_copy(v27);
            }
            int v39 = v31;
            if (qword_14148 != -1) {
              dispatch_once(&qword_14148, &stru_10420);
            }
            unsigned int v40 = qword_14168;
            os_signpost_id_t v41 = os_signpost_id_make_with_pointer((os_log_t)qword_14168, v39);
            if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              os_signpost_id_t v42 = v41;
              if (os_signpost_enabled(v40))
              {
                *(_WORD *)block = 0;
                _os_signpost_emit_with_name_impl(&dword_0, v40, OS_SIGNPOST_INTERVAL_BEGIN, v42, "DeviceConfigurationChange", "async", block, 2u);
              }
            }
            *(void *)block = _NSConcreteStackBlock;
            uint64_t v54 = 0x40000000;
            v55 = sub_CBA4;
            v56 = &unk_104F0;
            v57 = v39;
            dispatch_async((dispatch_queue_t)qword_14018, block);
            _Block_release(v27);
            _Block_object_dispose(&v49, 8);
          }
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_14008);
          int v22 = 0;
        }
        a8 = 0;
      }
      goto LABEL_88;
    }
LABEL_49:
    a8 = 0;
    int v22 = 561211770;
LABEL_88:
    uint64_t v43 = 0;
    goto LABEL_89;
  }
  if (a7 < 4) {
    goto LABEL_49;
  }
  int v22 = 1852797029;
  if (!a8) {
    goto LABEL_88;
  }
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  int v32 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    int v33 = *(_DWORD *)a8;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v33;
    _os_signpost_emit_with_name_impl(&dword_0, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetPropertyData", "TimeSource %{waipc:4cc}u", buf, 8u);
  }
  int v34 = *(_DWORD *)a8;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_14008);
  if (v34 != 1128614988 && v34 != 1280262988)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    CFComparisonResult v38 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v34;
      _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "unsupported time source %{waipc:4cc}u", buf, 8u);
    }
    a8 = 0;
    goto LABEL_78;
  }
  if (*(_DWORD *)aLlec != v34)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    CFStringRef v37 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      strcpy(&buf[4], "LLEC");
      buf[9] = 4;
      *(_DWORD *)&buf[10] = v34;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&uint8_t buf[16] = dword_1402C;
      _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "changing time source %{waipc:4cc}u -> %{waipc:4cc}u (running %u)", buf, 0x14u);
    }
    if (dword_1402C)
    {
      if (*(_DWORD *)aLlec == 1280262988)
      {
        if (v34 == 1128614988) {
          sub_CEF8();
        }
        int v44 = "newTimeSource == kNetworkUplinkClockTimeSourceCellular";
        int v45 = 1704;
        goto LABEL_101;
      }
      if (*(_DWORD *)aLlec != 1128614988)
      {
        int v44 = "false";
        int v45 = 1730;
        goto LABEL_101;
      }
      if (v34 != 1280262988)
      {
        int v44 = "newTimeSource == kNetworkUplinkClockTimeSourceLocal";
        int v45 = 1686;
        goto LABEL_101;
      }
      os_unfair_lock_lock(&stru_14060);
      qword_14078 = mach_absolute_time();
      *(_DWORD *)aLlec = 1280262988;
      os_unfair_lock_unlock(&stru_14060);
      sub_CDEC();
    }
    else
    {
      os_unfair_lock_lock(&stru_14060);
      *(_DWORD *)aLlec = v34;
      os_unfair_lock_unlock(&stru_14060);
    }
    if (*(_DWORD *)aLlec == v34)
    {
      int v22 = 0;
      uint64_t v46 = 0x676C6F6254535243;
      a8 = (double *)(&dword_0 + 1);
      goto LABEL_97;
    }
    int v44 = "gNUC_State.io.timeSource == newTimeSource";
    int v45 = 1733;
LABEL_101:
    __assert_rtn("NUCPerformTimeSourceChange", "PlugIn.cpp", v45, v44);
  }
  a8 = 0;
  int v22 = 0;
LABEL_78:
  uint64_t v46 = 0;
LABEL_97:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_14008);
  uint64_t v43 = v46;
LABEL_89:
  unsigned int v47 = v22;
  *(void *)&v48[4] = a8;
  *(void *)&v48[12] = v43;
  *(_DWORD *)&v48[20] = 0;
  if (a8) {
    (*(void (**)(int *, uint64_t, double *, unsigned char *))off_14000[0])(off_14000[0], a2, a8, &v48[12]);
  }
LABEL_13:
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  int v19 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v47;
    *(_WORD *)&buf[8] = 2048;
    *(void *)&buf[10] = *(void *)&v48[4];
    _os_signpost_emit_with_name_impl(&dword_0, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetPropertyData", "result %{waipc:4cc}u, changed %zu", buf, 0x12u);
  }
  return v47;
}

void sub_ABFC(_Unwind_Exception *a1)
{
}

uint64_t sub_AC48(_UNKNOWN **a1, int a2)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v4 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    LOWORD(v13[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "StartIO", "", (uint8_t *)v13, 2u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_14008);
  if (a1 != &off_14088)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      CFDictionaryRef v7 = "bad driver reference";
LABEL_21:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)v13, 2u);
LABEL_22:
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if (a2 != 2)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      CFDictionaryRef v7 = "bad device ID";
      goto LABEL_21;
    }
    goto LABEL_24;
  }
  if (!dword_1402C)
  {
    os_unfair_lock_lock(&stru_14060);
    sub_40C4((uint64_t)&unk_14080);
    os_unfair_lock_unlock(&stru_14060);
    if (*(_DWORD *)aLlec == 1128614988) {
      sub_CEF8();
    }
    if (*(_DWORD *)aLlec != 1280262988) {
      __assert_rtn("NUC_StartIO", "PlugIn.cpp", 1289, "false");
    }
    os_unfair_lock_lock(&stru_14060);
    qword_14078 = mach_absolute_time();
    os_unfair_lock_unlock(&stru_14060);
    dword_1402C = 1;
    uint64_t v10 = mach_absolute_time();
    int v11 = (const void *)qword_14040;
    qword_14038 = v10;
    qword_14040 = 0;
    if (v11) {
      CFRelease(v11);
    }
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    int v12 = qword_14158;
    if (os_signpost_enabled((os_log_t)qword_14158))
    {
      LOWORD(v13[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOSession", "", (uint8_t *)v13, 2u);
    }
    goto LABEL_38;
  }
  if (dword_1402C != -1)
  {
    ++dword_1402C;
LABEL_38:
    if (*(void *)&aLlec[4]) {
      sub_5D88(*(uint64_t *)&aLlec[4], 50);
    }
    uint64_t v5 = 0;
    goto LABEL_22;
  }
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v5 = 1852797029;
  uint64_t v6 = qword_14150[0];
  if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
  {
    LOWORD(v13[0]) = 0;
    CFDictionaryRef v7 = "out of references";
    goto LABEL_21;
  }
LABEL_24:
  int v8 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    v13[0] = 67109120;
    v13[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "StartIO", "result %{waipc:4cc}u", (uint8_t *)v13, 8u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_14008);
  return v5;
}

void sub_B0B8(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    sub_498C(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_B0F8(_UNKNOWN **a1, int a2)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v4 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    LOWORD(v11[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "StopIO", "", (uint8_t *)v11, 2u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_14008);
  if (a1 == &off_14088)
  {
    if (a2 == 2)
    {
      if (dword_1402C)
      {
        if (dword_1402C == 1)
        {
          dword_1402C = 0;
          sub_CDEC();
          if (qword_14148 != -1) {
            dispatch_once(&qword_14148, &stru_10420);
          }
          int v8 = qword_14158;
          if (!os_signpost_enabled((os_log_t)qword_14158))
          {
            uint64_t v5 = 0;
            goto LABEL_24;
          }
          LOWORD(v11[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOSession", "", (uint8_t *)v11, 2u);
          uint64_t v5 = 0;
        }
        else
        {
          uint64_t v5 = 0;
          --dword_1402C;
        }
      }
      else
      {
        uint64_t v5 = 1852797029;
      }
      goto LABEL_22;
    }
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v11[0]) = 0;
      CFDictionaryRef v7 = "bad device ID";
      goto LABEL_21;
    }
  }
  else
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v11[0]) = 0;
      CFDictionaryRef v7 = "bad driver reference";
LABEL_21:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)v11, 2u);
LABEL_22:
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
    }
  }
LABEL_24:
  int v9 = qword_14160;
  if (os_signpost_enabled((os_log_t)qword_14160))
  {
    v11[0] = 67109120;
    v11[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "StopIO", "result %{waipc:4cc}u", (uint8_t *)v11, 8u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_14008);
  return v5;
}

void sub_B408(_Unwind_Exception *a1)
{
}

uint64_t sub_B420(_UNKNOWN **a1, int a2, uint64_t a3, double *a4, NSObject **a5, void *a6)
{
  int v12 = &stru_14060;
  os_unfair_lock_lock(&stru_14060);
  if (byte_14082)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    int v12 = qword_14160;
    if (os_signpost_enabled((os_log_t)qword_14160))
    {
      LOWORD(v22) = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GetZeroTimeStamp", "", (uint8_t *)&v22, 2u);
    }
  }
  if (a1 != &off_14088)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v13 = 560947818;
    int v14 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      int v15 = "bad driver reference";
LABEL_20:
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v22, 2u);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (a2 == 2)
  {
    if (*(_DWORD *)aLlec != 1280262988)
    {
      if (*(_DWORD *)aLlec == 1128614988)
      {
        if (*(void *)&aLlec[4])
        {
          sub_5F40(*(uint64_t *)&aLlec[4], &v22);
          double v6 = v22;
          int v12 = *(NSObject **)v23;
          a1 = *(_UNKNOWN ***)&v23[8];
LABEL_28:
          uint64_t v13 = 0;
          *a4 = v6;
          *a5 = v12;
          *a6 = a1;
          goto LABEL_21;
        }
        uint64_t v20 = "gNUC_State.io.audioSession";
        int v21 = 1373;
      }
      else
      {
        uint64_t v20 = "false";
        int v21 = 1395;
      }
      __assert_rtn("NUC_GetZeroTimeStamp", "PlugIn.cpp", v21, v20);
    }
    mach_timebase_info((mach_timebase_info_t)&v22);
    uint64_t v18 = mach_absolute_time();
    a1 = (_UNKNOWN **)qword_14078;
    double v19 = round(*(double *)&qword_14030 * 0.3);
    double v6 = v19
       * floor(*(double *)&qword_14030 * ((double)((v18 - qword_14078) * LODWORD(v22) / HIDWORD(v22)) / 1000000000.0) / v19);
    int v12 = (qword_14078
                     + vcvtmd_u64_f64(v6 / *(double *)&qword_14030 * 1000000000.0 * (double)HIDWORD(v22) / (double)LODWORD(v22)));
    goto LABEL_28;
  }
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v13 = 560947818;
  int v14 = qword_14150[0];
  if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    int v15 = "bad device ID";
    goto LABEL_20;
  }
LABEL_21:
  if (byte_14082)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    int v16 = qword_14160;
    if (os_signpost_enabled((os_log_t)qword_14160))
    {
      LODWORD(v22) = 67109888;
      HIDWORD(v22) = v13;
      *(_WORD *)int v23 = 2048;
      *(double *)&v23[2] = v6;
      *(_WORD *)&v23[10] = 2048;
      *(void *)&v23[12] = v12;
      __int16 v24 = 2048;
      double v25 = a1;
      _os_signpost_emit_with_name_impl(&dword_0, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GetZeroTimeStamp", "result %{waipc:4cc}u, sampleTime %lf, hostTime %llu, seed %llu", (uint8_t *)&v22, 0x26u);
    }
  }
  os_unfair_lock_unlock(&stru_14060);
  return v13;
}

void sub_B7D0(_Unwind_Exception *a1)
{
}

uint64_t sub_B7F4(_UNKNOWN **a1, int a2, uint64_t a3, int a4, unsigned char *a5, unsigned char *a6)
{
  os_unfair_lock_lock(&stru_14060);
  if (byte_14082)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    int v11 = qword_14160;
    if (os_signpost_enabled((os_log_t)qword_14160))
    {
      int v17 = 67109120;
      int v18 = a4;
      _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WillDoIOOperation", "op %{waipc:4cc}u", (uint8_t *)&v17, 8u);
    }
  }
  if (a1 == &off_14088)
  {
    if (a2 == 2)
    {
      uint64_t v12 = 0;
      *a5 = 0;
      *a6 = 0;
      goto LABEL_18;
    }
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v12 = 560947818;
    uint64_t v13 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      int v14 = "bad device ID";
      goto LABEL_17;
    }
  }
  else
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v12 = 560947818;
    uint64_t v13 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      int v14 = "bad driver reference";
LABEL_17:
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v17, 2u);
    }
  }
LABEL_18:
  if (byte_14082)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    int v15 = qword_14160;
    if (os_signpost_enabled((os_log_t)qword_14160))
    {
      int v17 = 67109120;
      int v18 = v12;
      _os_signpost_emit_with_name_impl(&dword_0, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WillDoIOOperation", "result %{waipc:4cc}u", (uint8_t *)&v17, 8u);
    }
  }
  os_unfair_lock_unlock(&stru_14060);
  return v12;
}

uint64_t sub_BA94(_UNKNOWN **a1, int a2, uint64_t a3, int a4)
{
  os_unfair_lock_lock(&stru_14060);
  if (byte_14082)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    CFDictionaryRef v7 = qword_14160;
    if (os_signpost_enabled((os_log_t)qword_14160))
    {
      int v13 = 67109120;
      int v14 = a4;
      _os_signpost_emit_with_name_impl(&dword_0, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BeginIOOperation", "op %{waipc:4cc}u", (uint8_t *)&v13, 8u);
    }
  }
  if (a1 == &off_14088)
  {
    if (a2 == 2)
    {
      uint64_t v8 = 1970171760;
      goto LABEL_18;
    }
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v8 = 560947818;
    int v9 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      uint64_t v10 = "bad device ID";
      goto LABEL_17;
    }
  }
  else
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v8 = 560947818;
    int v9 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      uint64_t v10 = "bad driver reference";
LABEL_17:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, 2u);
    }
  }
LABEL_18:
  if (byte_14082)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    int v11 = qword_14160;
    if (os_signpost_enabled((os_log_t)qword_14160))
    {
      int v13 = 67109120;
      int v14 = v8;
      _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "BeginIOOperation", "result %{waipc:4cc}u", (uint8_t *)&v13, 8u);
    }
  }
  os_unfair_lock_unlock(&stru_14060);
  return v8;
}

uint64_t sub_BD20(_UNKNOWN **a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  os_unfair_lock_lock(&stru_14060);
  if (byte_14082)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v8 = qword_14160;
    if (os_signpost_enabled((os_log_t)qword_14160))
    {
      int v14 = 67109120;
      int v15 = a5;
      _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DoIOOperation", "op %{waipc:4cc}u", (uint8_t *)&v14, 8u);
    }
  }
  if (a1 == &off_14088)
  {
    if (a2 == 2)
    {
      uint64_t v9 = 1970171760;
      goto LABEL_18;
    }
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v9 = 560947818;
    uint64_t v10 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      int v11 = "bad device ID";
      goto LABEL_17;
    }
  }
  else
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v9 = 560947818;
    uint64_t v10 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      int v11 = "bad driver reference";
LABEL_17:
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v14, 2u);
    }
  }
LABEL_18:
  if (byte_14082)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v12 = qword_14160;
    if (os_signpost_enabled((os_log_t)qword_14160))
    {
      int v14 = 67109120;
      int v15 = v9;
      _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DoIOOperation", "result %{waipc:4cc}u", (uint8_t *)&v14, 8u);
    }
  }
  os_unfair_lock_unlock(&stru_14060);
  return v9;
}

uint64_t sub_BFAC(_UNKNOWN **a1, int a2, uint64_t a3, int a4)
{
  os_unfair_lock_lock(&stru_14060);
  if (byte_14082)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    CFDictionaryRef v7 = qword_14160;
    if (os_signpost_enabled((os_log_t)qword_14160))
    {
      int v13 = 67109120;
      int v14 = a4;
      _os_signpost_emit_with_name_impl(&dword_0, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EndIOOperation", "op %{waipc:4cc}u", (uint8_t *)&v13, 8u);
    }
  }
  if (a1 == &off_14088)
  {
    if (a2 == 2)
    {
      uint64_t v8 = 1970171760;
      goto LABEL_18;
    }
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v8 = 560947818;
    uint64_t v9 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      uint64_t v10 = "bad device ID";
      goto LABEL_17;
    }
  }
  else
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    uint64_t v8 = 560947818;
    uint64_t v9 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      uint64_t v10 = "bad driver reference";
LABEL_17:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, 2u);
    }
  }
LABEL_18:
  if (byte_14082)
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    int v11 = qword_14160;
    if (os_signpost_enabled((os_log_t)qword_14160))
    {
      int v13 = 67109120;
      int v14 = v8;
      _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EndIOOperation", "result %{waipc:4cc}u", (uint8_t *)&v13, 8u);
    }
  }
  os_unfair_lock_unlock(&stru_14060);
  return v8;
}

const void **sub_C238(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

os_state_data_s *__cdecl sub_C26C(id a1, os_state_hints_s *a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_14008);
  mach_timebase_info(&info);
  uint64_t v2 = mach_absolute_time();
  uint64_t v3 = qword_14038;
  uint64_t numer = info.numer;
  unint64_t denom = info.denom;
  os_unfair_lock_lock(&stru_14060);
  uint64_t v18 = qword_14078;
  os_unfair_lock_unlock(&stru_14060);
  sub_C830(buf, @"Refcount", &dword_14028);
  sub_C830(&v22, @"IO Running", &dword_1402C);
  sub_C8F0(&v23, @"Sample Rate", &qword_14030);
  sub_C830(v24, @"Time Source", (int *)aLlec);
  if (*(void *)&aLlec[4])
  {
    uint64_t v6 = sub_6230(*(uint64_t *)&aLlec[4]);
  }
  else
  {
    uint64_t v6 = qword_14040;
    if (qword_14040) {
      CFRetain((CFTypeRef)qword_14040);
    }
  }
  v24[2] = @"IO Session";
  v24[3] = v6;
  v16[1] = 0;
  sub_C9B0(&v25, @"Local Base Time (Absolute)", &v18);
  sub_C9B0(&v26, @"Start Time (Absolute)", &qword_14038);
  *(double *)int v16 = (double)((v2 - v3) * numer / denom) / 1000000000.0;
  sub_D59C(v27, @"Duration", v16);
  sub_C6A0((uint64_t)buf, &v17);
  for (uint64_t i = 120; i != -8; i -= 16)
  {
    uint64_t v8 = *(const void **)&buf[i];
    if (v8) {
      CFRelease(v8);
    }
  }
  uint64_t v9 = v17;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_14008);
  if (v9)
  {
    mach_timebase_info info = 0;
    StateData = (os_state_data_s *)waipc::util::createStateData(v9, "NetworkUplinkClock", (const char *)&info, v10);
    uint64_t v12 = (const void *)info;
    if (!StateData)
    {
      if (qword_14148 != -1) {
        dispatch_once(&qword_14148, &stru_10420);
      }
      int v13 = qword_14150[0];
      if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        int v21 = v12;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "failed to serialze state %@", buf, 0xCu);
      }
    }
    if (v12) {
      CFRelease(v12);
    }
    CFRelease(v9);
  }
  else
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    int v14 = qword_14150[0];
    if (os_log_type_enabled((os_log_t)qword_14150[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "failed to dump state", buf, 2u);
    }
    return 0;
  }
  return StateData;
}

void sub_C5A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_498C(exception_object);
}

const void **sub_C66C(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_C6A0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  *(_OWORD *)keys = 0u;
  long long v11 = 0u;
  memset(v9, 0, sizeof(v9));
  do
  {
    uint64_t v5 = *(void **)(a1 + v3);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        *((void *)v9 + v4++) = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 128);
  CFDictionaryRef v7 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)v9, v4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  return sub_C778(a2, v7);
}

void *sub_C778(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFDictionaryGetTypeID())
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not construct");
    }
  }
  return a1;
}

void sub_C800(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

void *sub_C830(void *a1, uint64_t a2, int *a3)
{
  *a1 = a2;
  int valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  return a1;
}

void sub_C8C4(_Unwind_Exception *exception_object)
{
  CFTypeID v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_C8F0(void *a1, uint64_t a2, uint64_t *a3)
{
  *a1 = a2;
  uint64_t valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  return a1;
}

void sub_C984(_Unwind_Exception *exception_object)
{
  CFTypeID v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_C9B0(void *a1, uint64_t a2, uint64_t *a3)
{
  *a1 = a2;
  uint64_t valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  return a1;
}

void sub_CA44(_Unwind_Exception *exception_object)
{
  CFTypeID v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_CA70(uint64_t a1, int a2)
{
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_14008);
    qword_14030 = *(void *)(a1 + 40);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_14008);
  }
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  CFNumberRef v4 = qword_14158;
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)qword_14158, *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      v7[0] = 67109120;
      v7[1] = a2;
      _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_END, v6, "SampleRateChange", "allowed %{BOOL}d", (uint8_t *)v7, 8u);
    }
  }
}

uint64_t sub_CB94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_CBA4(uint64_t a1)
{
  if (qword_14148 != -1) {
    dispatch_once(&qword_14148, &stru_10420);
  }
  uint64_t v2 = qword_14168;
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer((os_log_t)qword_14168, *(const void **)(a1 + 32));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      LOWORD(v14[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v2, OS_SIGNPOST_EVENT, v4, "DeviceConfigurationChange", "request", (uint8_t *)v14, 2u);
    }
  }
  int v5 = (*(uint64_t (**)(void))((char *)off_14000[0] + (unint64_t)&stru_20))();
  if (v5)
  {
    int v6 = v5;
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    CFDictionaryRef v7 = qword_14168;
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer((os_log_t)qword_14168, *(const void **)(a1 + 32));
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        v14[0] = 67109120;
        v14[1] = v6;
        _os_signpost_emit_with_name_impl(&dword_0, v7, OS_SIGNPOST_EVENT, v9, "DeviceConfigurationChange", "failed %{waipc:4cc}u", (uint8_t *)v14, 8u);
      }
    }
    uint64_t v10 = *(void (***)(void, void))(a1 + 32);
    v10[2](v10, 0);
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    long long v11 = qword_14168;
    os_signpost_id_t v12 = os_signpost_id_make_with_pointer((os_log_t)qword_14168, *(const void **)(a1 + 32));
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v13 = v12;
      if (os_signpost_enabled(v11))
      {
        LOWORD(v14[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_END, v13, "DeviceConfigurationChange", "done", (uint8_t *)v14, 2u);
      }
    }
    _Block_release(v10);
  }
}

void sub_CDEC()
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&unk_14008);
  if (qword_14020)
  {
    if (*(void *)&aLlec[4])
    {
      uint64_t v0 = sub_6230(*(uint64_t *)&aLlec[4]);
      uint64_t v1 = (const void *)qword_14040;
      qword_14040 = v0;
      if (v1) {
        CFRelease(v1);
      }
    }
  }
  os_unfair_lock_lock(&stru_14060);
  uint64_t v2 = (std::__shared_weak_count *)qword_14070;
  *(void *)&aLlec[4] = 0;
  qword_14070 = 0;
  os_unfair_lock_unlock(&stru_14060);
  if (v2) {
    sub_D528(v2);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_14048);
  os_signpost_id_t v3 = (const void *)qword_14050;
  qword_14050 = 0;
  if (v3) {
    CFRelease(v3);
  }
  if (off_14058[0])
  {
    (*(void (**)(void))((char *)off_14058[0] + (unint64_t)&dword_10))();
    os_signpost_id_t v4 = off_14058[0];
    off_14058[0] = 0;
    if (v4) {
      _Block_release(v4);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_14048);
}

void sub_CEDC(_Unwind_Exception *a1)
{
}

void sub_CEF8()
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&unk_14008);
  if (!*(void *)&aLlec[4])
  {
    v1[0] = 0;
    v1[1] = v1;
    v1[2] = 0x2000000000;
    char v2 = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 0x40000000;
    aBlock[2] = sub_D14C;
    aBlock[3] = &unk_10518;
    aBlock[5] = qword_14030;
    aBlock[4] = v1;
    _Block_copy(aBlock);
    sub_4310();
  }
  sub_DF78();
}

void sub_D128(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_47E4((uint64_t)va);
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_D14C(uint64_t a1, uint64_t *a2, double a3)
{
  uint64_t v12 = *a2;
  sub_D59C(buf, @"basis", &v12);
  double v11 = *(double *)(a1 + 40) * a3 / 1000000000.0;
  sub_D59C((double *)((char *)&v16 + 2), @"interval", (uint64_t *)&v11);
  sub_D3C8((uint64_t)buf, &cf);
  for (uint64_t i = 24; i != -8; i -= 16)
  {
    CFDictionaryRef v7 = *(const void **)&buf[i];
    if (v7) {
      CFRelease(v7);
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_14048);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_14048);
  }
  else
  {
    if (qword_14148 != -1) {
      dispatch_once(&qword_14148, &stru_10420);
    }
    os_signpost_id_t v8 = qword_14158;
    if (os_signpost_enabled((os_log_t)qword_14158))
    {
      uint64_t v9 = *a2;
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v9;
      __int16 v15 = 2048;
      double v16 = a3;
      _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UplinkScheduleChange", "sample %lf, interval %lf", buf, 0x16u);
    }
    uint64_t v10 = (const void *)qword_14050;
    qword_14050 = (uint64_t)cf;
    if (cf) {
      CFRetain(cf);
    }
    if (v10) {
      CFRelease(v10);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_14048);
    strcpy((char *)buf, "DHCSbolg");
    buf[9] = 0;
    *(_WORD *)&buf[10] = 0;
    (*(void (**)(int *, uint64_t, uint64_t, uint8_t *))off_14000[0])(off_14000[0], 2, 1, buf);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void sub_D35C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, int a13, __int16 a14, char a15, char a16)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_498C(exception_object);
}

void *sub_D3C8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  keys[0] = 0;
  keys[1] = 0;
  values[0] = 0;
  values[1] = 0;
  do
  {
    int v5 = *(void **)(a1 + v3);
    if (v5)
    {
      int v6 = *(void **)(a1 + v3 + 8);
      if (v6)
      {
        keys[v4] = v5;
        values[v4++] = v6;
      }
    }
    v3 += 16;
  }
  while (v3 != 32);
  CFDictionaryRef v7 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, v4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  return sub_C778(a2, v7);
}

void sub_D494(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&unk_14048);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    sub_DFA4();
  }
  *(unsigned char *)(v2 + 24) = 1;
}

const void **sub_D4DC(const void **a1)
{
  uint64_t v2 = (void (**)(void))*a1;
  if (v2)
  {
    v2[2]();
    if (*a1) {
      _Block_release(*a1);
    }
  }
  return a1;
}

void sub_D528(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void *sub_D59C(void *a1, uint64_t a2, uint64_t *a3)
{
  *a1 = a2;
  uint64_t valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  return a1;
}

void sub_D630(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_D65C(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_D6E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_D898((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_D6F8(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    CFNumberRef v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      int v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        CFNumberRef v4 = (std::__shared_weak_count *)a2[1];
      }
      *a2 = a3;
      a2[1] = v5;
      if (v4) {
        std::__shared_weak_count::__release_weak(v4);
      }
      if (v5)
      {
        sub_D528(v5);
      }
    }
  }
}

void sub_D784(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_D7BC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    sub_4818(result);
    operator delete();
  }
  return result;
}

uint64_t sub_D804(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL sub_D848(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

uint64_t sub_D898(uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    sub_4818(result);
    operator delete();
  }
  return result;
}

uint64_t *sub_D8E8(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    sub_D948(v2 + 144);
    operator delete();
  }
  return result;
}

uint64_t sub_D948(uint64_t a1)
{
  unint64_t v2 = atomic_exchange((atomic_ullong *volatile)(a1 + 224), 0);
  if (v2) {
    sub_D984(a1, v2);
  }
  return a1;
}

uint64_t sub_D984(uint64_t result, unint64_t a2)
{
  if (!a2) {
    sub_DFD0();
  }
  uint64_t v2 = a2 - result - 8;
  if (v2 < -71 || (unint64_t v3 = 0x8E38E38E38E38E39 * (v2 >> 3), v3 >= 3)) {
    sub_DFFC();
  }
  if (atomic_exchange((atomic_ullong *volatile)(result + 8 * v3 + 232), a2)) {
    sub_E028();
  }
  return result;
}

waipc::util::GroupErrorTimer *sub_D9E8(waipc::util::GroupErrorTimer **a1, waipc::util::GroupErrorTimer *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    waipc::util::GroupErrorTimer::~GroupErrorTimer(result);
    operator delete();
  }
  return result;
}

uint64_t sub_DA38(uint64_t a1)
{
  unint64_t v2 = atomic_exchange((atomic_ullong *volatile)(a1 + 512), 0);
  if (v2) {
    sub_DA74(a1, v2);
  }
  return a1;
}

uint64_t sub_DA74(uint64_t result, unint64_t a2)
{
  if (!a2) {
    sub_DFD0();
  }
  uint64_t v2 = a2 - result - 8;
  if (v2 < -167 || (unint64_t v3 = 0xCF3CF3CF3CF3CF3DLL * (v2 >> 3), v3 >= 3)) {
    sub_DFFC();
  }
  if (atomic_exchange((atomic_ullong *volatile)(result + 8 * v3 + 520), a2)) {
    sub_E028();
  }
  return result;
}

waipc::util::NonblockingEventSource *sub_DAD8(waipc::util::NonblockingEventSource **a1, waipc::util::NonblockingEventSource *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    waipc::util::NonblockingEventSource::~NonblockingEventSource(result);
    operator delete();
  }
  return result;
}

void *sub_DB28(void *a1, void *a2)
{
  unint64_t v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0;
LABEL_5:
    sub_DB6C();
  }
  CFNumberRef v4 = std::__shared_weak_count::lock(v3);
  a1[1] = v4;
  if (!v4) {
    goto LABEL_5;
  }
  return a1;
}

void sub_DB6C()
{
  exception = __cxa_allocate_exception(8uLL);
}

unint64_t sub_DBB8(uint64_t a1)
{
  unint64_t v1 = 0;
  uint64_t v2 = a1 + 520;
  do
  {
    unint64_t result = atomic_exchange((atomic_ullong *volatile)(v2 + 8 * v1), 0);
    if (result) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = v1 >= 2;
    }
    ++v1;
  }
  while (!v4);
  if (!result) {
    sub_E054();
  }
  return result;
}

unint64_t sub_DBF4(uint64_t a1)
{
  unint64_t v1 = 0;
  uint64_t v2 = a1 + 232;
  do
  {
    unint64_t result = atomic_exchange((atomic_ullong *volatile)(v2 + 8 * v1), 0);
    if (result) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = v1 >= 2;
    }
    ++v1;
  }
  while (!v4);
  if (!result) {
    sub_E054();
  }
  return result;
}

void *sub_DC30(void *a1, uint64_t a2, uint64_t *a3)
{
  *a1 = a2;
  uint64_t valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  return a1;
}

void sub_DCC4(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_DCF0(void *a1, uint64_t a2, uint64_t *a3)
{
  *a1 = a2;
  uint64_t valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  return a1;
}

void sub_DD84(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_DDB0(void *a1, uint64_t a2, int *a3)
{
  *a1 = a2;
  int valuePtr = *a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  a1[1] = v4;
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  return a1;
}

void sub_DE44(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_DE70()
{
}

void sub_DE9C()
{
  __assert_rtn("NUC_PerformDeviceConfigurationChange", "PlugIn.cpp", 479, "inChangeInfo != nullptr");
}

void sub_DEC8()
{
  __assert_rtn("NUC_PerformDeviceConfigurationChange", "PlugIn.cpp", 478, "inChangeAction == 0");
}

void sub_DEF4()
{
  __assert_rtn("NUC_AbortDeviceConfigurationChange", "PlugIn.cpp", 503, "inChangeInfo != nullptr");
}

void sub_DF20()
{
  __assert_rtn("NUC_AbortDeviceConfigurationChange", "PlugIn.cpp", 502, "inChangeAction == 0");
}

void sub_DF4C()
{
  __assert_rtn("NUC_SetPropertyData", "PlugIn.cpp", 639, "gNUC_State.host != nullptr");
}

void sub_DF78()
{
}

void sub_DFA4()
{
}

void sub_DFD0()
{
}

void sub_DFFC()
{
  __assert_rtn("putIdle", "Util.h", 426, "i >= 0 && i < kStashCount");
}

void sub_E028()
{
}

void sub_E054()
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return _CFUUIDCreateFromUUIDBytes(alloc, bytes);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return __CTServerConnectionCreateOnTargetQueue();
}

uint64_t _CTServerConnectionResetModemWithCrashLogs()
{
  return __CTServerConnectionResetModemWithCrashLogs();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t NetworkUplinkClock_getTimesyncOverride(void)
{
  return NetworkUplinkClock_getTimesyncOverride();
}

uint64_t waipc::SampleTimeline::updateTimesync(waipc::SampleTimeline *a1, const waipc::timesync::KalmanEstimator *a2, BOOL a3)
{
  return waipc::SampleTimeline::updateTimesync(a1, a2, a3);
}

uint64_t waipc::SampleTimeline::SampleTimeline()
{
  return waipc::SampleTimeline::SampleTimeline();
}

uint64_t waipc::util::GroupErrorTimer::start(waipc::util::GroupErrorTimer *this, const __CFString *a2)
{
  return waipc::util::GroupErrorTimer::start(this, a2);
}

uint64_t waipc::util::GroupErrorTimer::GroupErrorTimer()
{
  return waipc::util::GroupErrorTimer::GroupErrorTimer();
}

void waipc::util::GroupErrorTimer::~GroupErrorTimer(waipc::util::GroupErrorTimer *this)
{
}

uint64_t waipc::util::createStateData(waipc::util *this, const void *a2, const char *a3, __CFError **a4)
{
  return waipc::util::createStateData(this, a2, a3, a4);
}

uint64_t waipc::util::NonblockingEventSource::trigger(waipc::util::NonblockingEventSource *this, unsigned int a2)
{
  return waipc::util::NonblockingEventSource::trigger(this, a2);
}

uint64_t waipc::util::NonblockingEventSource::NonblockingEventSource()
{
  return waipc::util::NonblockingEventSource::NonblockingEventSource();
}

void waipc::util::NonblockingEventSource::~NonblockingEventSource(waipc::util::NonblockingEventSource *this)
{
}

uint64_t waipc::util::NonblockingEventSource::operator BOOL()
{
  return waipc::util::NonblockingEventSource::operator BOOL();
}

uint64_t waipc::util::createSerialQueueWithQosAndTarget(waipc::util *this, const char *a2, qos_class_t a3, dispatch_queue_s *a4)
{
  return waipc::util::createSerialQueueWithQosAndTarget(this, a2, a3, a4);
}

uint64_t waipc::timesync::BasebandConfig::getDefault(waipc::timesync::BasebandConfig *this)
{
  return waipc::timesync::BasebandConfig::getDefault(this);
}

uint64_t waipc::timesync::BasebandService::triggerReset(waipc::timesync::BasebandService *this)
{
  return waipc::timesync::BasebandService::triggerReset(this);
}

uint64_t waipc::timesync::BasebandService::triggerMeasurement(waipc::timesync::BasebandService *this)
{
  return waipc::timesync::BasebandService::triggerMeasurement(this);
}

uint64_t waipc::timesync::BasebandService::addTimesyncObserver()
{
  return waipc::timesync::BasebandService::addTimesyncObserver();
}

uint64_t waipc::timesync::BasebandService::addTimestampObserver()
{
  return waipc::timesync::BasebandService::addTimestampObserver();
}

uint64_t waipc::timesync::BasebandService::addConnectionObserver()
{
  return waipc::timesync::BasebandService::addConnectionObserver();
}

uint64_t waipc::timesync::BasebandService::setTimestampRequiredForReady()
{
  return waipc::timesync::BasebandService::setTimestampRequiredForReady();
}

uint64_t waipc::timesync::BasebandService::create()
{
  return waipc::timesync::BasebandService::create();
}

uint64_t waipc::SampleTimeline::currentTimestamp(waipc::SampleTimeline *this)
{
  return waipc::SampleTimeline::currentTimestamp(this);
}

uint64_t waipc::SampleTimeline::nextHostVariance(waipc::SampleTimeline *this)
{
  return waipc::SampleTimeline::nextHostVariance(this);
}

uint64_t waipc::SampleTimeline::timestampFromDevice(waipc::SampleTimeline *this)
{
  return waipc::SampleTimeline::timestampFromDevice(this);
}

uint64_t waipc::SampleTimeline::dumpState(waipc::SampleTimeline *this)
{
  return waipc::SampleTimeline::dumpState(this);
}

uint64_t waipc::util::GroupErrorTimer::copyReason(waipc::util::GroupErrorTimer *this)
{
  return waipc::util::GroupErrorTimer::copyReason(this);
}

uint64_t waipc::util::GroupErrorTimer::isRunning(waipc::util::GroupErrorTimer *this)
{
  return waipc::util::GroupErrorTimer::isRunning(this);
}

uint64_t waipc::timesync::BasebandService::dumpState(waipc::timesync::BasebandService *this)
{
  return waipc::timesync::BasebandService::dumpState(this);
}

uint64_t waipc::timesync::KalmanEstimator::dumpState(waipc::timesync::KalmanEstimator *this)
{
  return waipc::timesync::KalmanEstimator::dumpState(this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return std::__shared_weak_count::lock(this);
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
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return _dispatch_workloop_create(label);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}