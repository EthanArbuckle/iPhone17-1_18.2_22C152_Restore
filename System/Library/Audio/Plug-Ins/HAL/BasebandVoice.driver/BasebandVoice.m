BOOL sub_3858(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  BOOL result;

  v2 = 0;
  v3 = qword_14218 == -1;
  do
  {
    if (!v3) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    result = os_signpost_enabled((os_log_t)qword_14220[v2]);
    *(unsigned char *)(a1 + v2++) = result;
    v3 = 1;
  }
  while (v2 != 4);
  return result;
}

_UNKNOWN **BV_Create(uint64_t a1, const void *a2)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  v3 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    *(_DWORD *)buf = 138412290;
    v9 = a2;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Create", "uuid %@", buf, 0xCu);
  }
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes(0, 0x44u, 0x3Au, 0xBAu, 0xB8u, 0xE7u, 0xB3u, 0x49u, 0x1Au, 0xB9u, 0x85u, 0xBEu, 0xB9u, 0x18u, 0x70u, 0x30u, 0xDBu);
  int v5 = CFEqual(a2, v4);
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  v6 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v9) = v5 != 0;
    _os_signpost_emit_with_name_impl(&dword_0, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Create", "success %{BOOL}d", buf, 8u);
  }
  if (v5) {
    return &off_14000;
  }
  else {
    return 0;
  }
}

void sub_3AAC()
{
}

void sub_3B3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_D484(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_3B78(os_unfair_lock_s *a1)
{
  v2 = a1 + 34;
  os_unfair_lock_lock(a1 + 34);
  os_unfair_lock_lock(a1 + 35);
  if (sub_40EC((uint64_t)a1))
  {
    sub_435C((uint64_t)a1);
    if (sub_4464((uint64_t)a1)) {
      sub_4740((uint64_t)a1);
    }
  }
  os_unfair_lock_unlock(a1 + 35);
  os_unfair_lock_unlock(v2);
  return 0;
}

void sub_3C0C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

char *sub_3C28(char *a1, long long *a2, uint64_t a3, dispatch_queue_s *a4)
{
  *(void *)a1 = 0;
  *((void *)a1 + 1) = 0;
  long long v5 = *a2;
  long long v6 = a2[2];
  *((_OWORD *)a1 + 2) = a2[1];
  *((_OWORD *)a1 + 3) = v6;
  *((_OWORD *)a1 + 1) = v5;
  long long v7 = a2[3];
  long long v8 = a2[4];
  long long v9 = a2[5];
  *((void *)a1 + 14) = *((void *)a2 + 12);
  *((_OWORD *)a1 + 5) = v8;
  *((_OWORD *)a1 + 6) = v9;
  *((_OWORD *)a1 + 4) = v7;
  v10 = *(NSObject **)a2;
  *((void *)a1 + 15) = *(void *)a2;
  if (v10)
  {
    dispatch_retain(v10);
    uint64_t v11 = *((void *)a1 + 15);
  }
  else
  {
    LODWORD(v11) = 0;
  }
  waipc::util::createSerialQueueWithQosAndTarget((waipc::util *)"com.apple.WirelessIPC.audio.BasebandVoice.AudioSession", (const char *)&dword_14 + 1, (qos_class_t)v11, a4);
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  a1[184] = 0;
  *((_OWORD *)a1 + 16) = 0u;
  *((_OWORD *)a1 + 17) = 0u;
  *((_OWORD *)a1 + 18) = 0u;
  *((_OWORD *)a1 + 20) = 0u;
  *((_OWORD *)a1 + 21) = 0u;
  *((_OWORD *)a1 + 22) = 0u;
  *((_OWORD *)a1 + 23) = 0u;
  *((_OWORD *)a1 + 24) = 0u;
  *((_OWORD *)a1 + 25) = 0u;
  *((_OWORD *)a1 + 26) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *((_OWORD *)a1 + 28) = 0u;
  *((_OWORD *)a1 + 29) = 0u;
  *((_OWORD *)a1 + 30) = 0u;
  *((_OWORD *)a1 + 31) = 0u;
  *((_OWORD *)a1 + 32) = 0u;
  *((_OWORD *)a1 + 33) = 0u;
  *((_OWORD *)a1 + 34) = 0u;
  *((_OWORD *)a1 + 35) = 0u;
  *((_OWORD *)a1 + 36) = 0u;
  *((_OWORD *)a1 + 37) = 0u;
  *((_OWORD *)a1 + 38) = 0u;
  *((_OWORD *)a1 + 39) = 0u;
  *((_OWORD *)a1 + 40) = 0u;
  *((_OWORD *)a1 + 41) = 0u;
  *((_OWORD *)a1 + 42) = 0u;
  *((_OWORD *)a1 + 43) = 0u;
  *((_OWORD *)a1 + 44) = 0u;
  *((_OWORD *)a1 + 45) = 0u;
  *((_OWORD *)a1 + 46) = 0u;
  *((_OWORD *)a1 + 47) = 0u;
  *((_OWORD *)a1 + 48) = 0u;
  *((_OWORD *)a1 + 49) = 0u;
  *((_OWORD *)a1 + 50) = 0u;
  *((_OWORD *)a1 + 51) = 0u;
  v12 = a1 + 440;
  uint64_t v13 = 808;
  *((_OWORD *)a1 + 27) = 0u;
  do
  {
    *(void *)&a1[v13] = v12;
    v12 += 120;
    v13 += 8;
  }
  while (v13 != 832);
  *((void *)a1 + 108) = 0;
  *((_OWORD *)a1 + 52) = 0u;
  *((_OWORD *)a1 + 53) = 0u;
  *((void *)a1 + 109) = mach_continuous_time();
  *((void *)a1 + 110) = 0;
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  v14 = qword_14238;
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer((os_log_t)qword_14238, a1);
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

void sub_3EF0(_Unwind_Exception *a1)
{
  sub_D438((const void **)(v1 + 864));
  sub_D86C((waipc::PCIeAudioLink **)(v1 + 856), 0);
  sub_D7D4(v6);
  sub_D784(v5, 0);
  sub_D438(v4);
  sub_D438(v3);
  long long v8 = *(std::__shared_weak_count **)(v1 + 152);
  if (v8) {
    sub_D484(v8);
  }
  if (*v2) {
    dispatch_release(*v2);
  }
  long long v9 = *(NSObject **)(v1 + 120);
  if (v9) {
    dispatch_release(v9);
  }
  v10 = *(std::__shared_weak_count **)(v1 + 8);
  if (v10) {
    std::__shared_weak_count::__release_weak(v10);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_3F70(uint64_t a1)
{
  v2 = (os_unfair_lock_s *)(a1 + 136);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 140));
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  v3 = qword_14238;
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer((os_log_t)qword_14238, (const void *)a1);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_END, v5, "AudioSession", "", v11, 2u);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 140));
  os_unfair_lock_unlock(v2);
  sub_D8BC((waipc::util::NonblockingEventSource **)(a1 + 880), 0);
  sub_D438((const void **)(a1 + 864));
  sub_D86C((waipc::PCIeAudioLink **)(a1 + 856), 0);
  sub_D7D4(a1 + 432);
  sub_D784((waipc::util::GroupErrorTimer **)(a1 + 176), 0);
  sub_D438((const void **)(a1 + 168));
  sub_D438((const void **)(a1 + 160));
  uint64_t v6 = *(std::__shared_weak_count **)(a1 + 152);
  if (v6) {
    sub_D484(v6);
  }
  long long v7 = *(NSObject **)(a1 + 128);
  if (v7) {
    dispatch_release(v7);
  }
  long long v8 = *(NSObject **)(a1 + 120);
  if (v8) {
    dispatch_release(v8);
  }
  long long v9 = *(std::__shared_weak_count **)(a1 + 8);
  if (v9) {
    std::__shared_weak_count::__release_weak(v9);
  }
  return a1;
}

void sub_40D4(void *a1)
{
}

uint64_t sub_40EC(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 136));
  if (*(void *)(a1 + 144)) {
    sub_DDF4();
  }
  BasebandVoice_getTimesyncOverride();
  long long v2 = v9;
  long long v9 = 0uLL;
  v3 = *(std::__shared_weak_count **)(a1 + 152);
  *(_OWORD *)(a1 + 144) = v2;
  if (v3)
  {
    sub_D484(v3);
    v3 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1)) {
      sub_D484(*((std::__shared_weak_count **)&v9 + 1));
    }
    if (*(void *)(a1 + 144)) {
      goto LABEL_12;
    }
  }
  else if ((void)v2)
  {
    goto LABEL_12;
  }
  waipc::timesync::BasebandConfig::getDefault((uint64_t *)&v9, (waipc::timesync::BasebandConfig *)v3);
  char v14 = *(unsigned char *)(a1 + 112);
  waipc::timesync::BasebandService::create();
  long long v4 = v8;
  long long v8 = 0uLL;
  os_signpost_id_t v5 = *(std::__shared_weak_count **)(a1 + 152);
  *(_OWORD *)(a1 + 144) = v4;
  if (v5)
  {
    sub_D484(v5);
    if (*((void *)&v8 + 1)) {
      sub_D484(*((std::__shared_weak_count **)&v8 + 1));
    }
    if (*(void *)(a1 + 144)) {
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
  uint64_t v11 = sub_4AA4;
  v12 = sub_4AC0;
  sub_D90C(&v8, (void *)a1);
  uint64_t v6 = (std::__shared_weak_count *)*((void *)&v8 + 1);
  long long v13 = v8;
  if (*((void *)&v8 + 1))
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v8 + 1) + 16), 1uLL, memory_order_relaxed);
    sub_D484(v6);
  }
  waipc::timesync::BasebandService::addConnectionObserver();
  sub_4DC0((void (***)(void))(a1 + 160), (const void **)&v8);
  sub_D438((const void **)&v8);
  waipc::timesync::BasebandService::addTimesyncObserver();
  sub_4DC0((void (***)(void))(a1 + 168), (const void **)&v8);
  sub_D438((const void **)&v8);
  _Block_object_dispose(&v9, 8);
  if (*((void *)&v13 + 1)) {
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v13 + 1));
  }
  return 1;
}

void sub_4320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,const void *a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,std::__shared_weak_count *a29)
{
  if (a29) {
    std::__shared_weak_count::__release_weak(a29);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_435C(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 136));
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 140));
  uint64_t v2 = *(void *)(a1 + 144);
  mach_continuous_time();
  waipc::timesync::KalmanEstimator::fixed();
  *(_OWORD *)(a1 + 248) = v12;
  *(_OWORD *)(a1 + 264) = v13;
  *(_OWORD *)(a1 + 280) = v14;
  *(void *)(a1 + 296) = v15;
  *(_OWORD *)(a1 + 200) = v9;
  *(_OWORD *)(a1 + 216) = v10;
  *(_OWORD *)(a1 + 232) = v11;
  *(unsigned char *)(a1 + 304) = 0;
  long long v3 = *(_OWORD *)(a1 + 248);
  long long v4 = *(_OWORD *)(a1 + 280);
  *(_OWORD *)(a1 + 384) = *(_OWORD *)(a1 + 264);
  *(_OWORD *)(a1 + 400) = v4;
  *(void *)(a1 + 416) = v15;
  long long v5 = *(_OWORD *)(a1 + 216);
  *(_OWORD *)(a1 + 320) = *(_OWORD *)(a1 + 200);
  *(_OWORD *)(a1 + 336) = v5;
  *(_OWORD *)(a1 + 352) = *(_OWORD *)(a1 + 232);
  *(_OWORD *)(a1 + 368) = v3;
  *(unsigned char *)(a1 + 424) = 0;
  *(void *)&long long v5 = *(void *)(a1 + 56);
  double v6 = *(double *)(v2 + 136);
  double v7 = *(double *)(a1 + 48) * 1000000000.0 / v6 * 0.5;
  *(double *)(a1 + 832) = v7 * v7;
  *(void *)(a1 + 840) = (unint64_t)(*(double *)&v5 * 1000000000.0 / v6);
  return 1;
}

uint64_t sub_4464(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 136));
  memset(&v13[4], 0, 32);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 24);
  long long v12 = *(_OWORD *)(a1 + 68);
  uint64_t v14 = 0;
  int v11 = *(_DWORD *)(a1 + 64);
  *(void *)long long v13 = v2;
  *(_OWORD *)&v13[12] = *(_OWORD *)(a1 + 88);
  *(void *)&v13[28] = *(void *)(a1 + 104);
  BYTE1(v14) = *(unsigned char *)(a1 + 112);
  long long v15 = *(_OWORD *)(*(void *)(a1 + 144) + 128);
  *(void *)buf = waipc::PCIeAudioLink::computeBufferLength();
  sub_D9D8(&v8);
  long long v3 = *(void **)(v8 + 16);
  if (v3) {
    size_t v4 = *(void *)(v8 + 8);
  }
  else {
    size_t v4 = 0;
  }
  bzero(v3, v4);
  uint64_t v5 = *(void *)(v8 + 16);
  if (v5)
  {
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    double v6 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "rawBuffer addr: %p", buf, 0xCu);
    }
    operator new();
  }
  if (v9) {
    sub_D484(v9);
  }
  return 0;
}

void sub_46CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  sub_D438((const void **)(v12 - 80));
  if (a10) {
    sub_D484(a10);
  }
  if (a12) {
    sub_D484(a12);
  }
  _Unwind_Resume(a1);
}

void sub_4740(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 136));
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3802000000;
  v5[3] = sub_4AA4;
  v5[4] = sub_4AC0;
  sub_D90C(&v3, (void *)a1);
  uint64_t v2 = v4;
  v5[5] = v3;
  v5[6] = v4;
  if (v4)
  {
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_D484(v2);
  }
  operator new();
}

void sub_4894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24)
{
  if (a24) {
    std::__shared_weak_count::__release_weak(a24);
  }
  _Unwind_Resume(a1);
}

void sub_48DC(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 136));
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3802000000;
  v6[3] = sub_4AA4;
  v6[4] = sub_4AC0;
  sub_D90C(&v4, (void *)a1);
  uint64_t v2 = v5;
  v6[5] = v4;
  v6[6] = v5;
  if (v5)
  {
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_D484(v2);
  }
  uint64_t v3 = *(void *)(a1 + 144);
  if (*(void *)(v3 + 416)) {
    dispatch_retain(*(dispatch_object_t *)(v3 + 416));
  }
  operator new();
}

void sub_4A54(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24)
{
}

uint64_t sub_4AA4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_4AC0(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_4AD0(uint64_t a1, int a2, const __CFString *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v3 + 48))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    double v7 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(v3 + 48));
    if (v7)
    {
      uint64_t v8 = v7;
      if (*(void *)(v3 + 40))
      {
        if (qword_14218 != -1) {
          dispatch_once(&qword_14218, &stru_10470);
        }
        long long v9 = qword_14228;
        if (os_signpost_enabled((os_log_t)qword_14228))
        {
          v11[0] = 67109378;
          v11[1] = a2;
          __int16 v12 = 2112;
          CFStringRef v13 = a3;
          _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AudioSession_ConnectCB", "connected %{BOOL}d, reason %@", (uint8_t *)v11, 0x12u);
        }
        os_unfair_lock_lock((os_unfair_lock_t)(v6 + 136));
        if (a2)
        {
          *(unsigned char *)(v6 + 184) = 0;
        }
        else
        {
          *(unsigned char *)(v6 + 304) = 0;
          sub_4CD8((os_unfair_lock_t)(v6 + 432), v6 + 192);
          if (!*(unsigned char *)(v6 + 184))
          {
            if (qword_14218 != -1) {
              dispatch_once(&qword_14218, &stru_10470);
            }
            uint64_t v10 = qword_14230;
            if (os_signpost_enabled((os_log_t)qword_14230))
            {
              LOWORD(v11[0]) = 0;
              _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AudioSession_ErrorTimerStart", "", (uint8_t *)v11, 2u);
            }
            *(unsigned char *)(v6 + 184) = 1;
            waipc::util::GroupErrorTimer::start(*(waipc::util::GroupErrorTimer **)(v6 + 176), a3);
          }
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 136));
      }
      sub_D484(v8);
    }
  }
}

void sub_4CBC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  sub_D484(v1);
  _Unwind_Resume(a1);
}

void sub_4CD8(os_unfair_lock_t lock, uint64_t a2)
{
  if (lock) {
    os_unfair_lock_lock(lock);
  }
  unint64_t v4 = sub_D99C((uint64_t)lock);
  long long v5 = *(_OWORD *)(a2 + 8);
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(v4 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(v4 + 24) = v6;
  *(_OWORD *)(v4 + 8) = v5;
  long long v7 = *(_OWORD *)(a2 + 56);
  long long v8 = *(_OWORD *)(a2 + 72);
  long long v9 = *(_OWORD *)(a2 + 88);
  *(void *)(v4 + 104) = *(void *)(a2 + 104);
  *(_OWORD *)(v4 + 88) = v9;
  *(_OWORD *)(v4 + 72) = v8;
  *(_OWORD *)(v4 + 56) = v7;
  *(unsigned char *)(v4 + 112) = *(unsigned char *)(a2 + 112);
  unint64_t v10 = atomic_exchange((atomic_ullong *volatile)&lock[92], v4);
  if (v10) {
    sub_D810((uint64_t)lock, v10);
  }
  if (lock)
  {
    os_unfair_lock_unlock(lock);
  }
}

void sub_4DA4(_Unwind_Exception *exception_object)
{
  if (v1) {
    os_unfair_lock_unlock(v1);
  }
  _Unwind_Resume(exception_object);
}

void (***sub_4DC0(void (***a1)(void), const void **a2))(void)
{
  unint64_t v4 = *a1;
  if (v4) {
    v4[2]();
  }
  long long v5 = (void (**)(void))*a2;
  *a2 = 0;
  long long v6 = *a1;
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

void sub_4E2C(uint64_t a1, waipc::timesync::KalmanEstimator *a2, int a3)
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
        if (qword_14218 != -1) {
          dispatch_once(&qword_14218, &stru_10470);
        }
        long long v9 = qword_14230;
        if (os_signpost_enabled((os_log_t)qword_14230))
        {
          unint64_t v10 = (const void *)waipc::timesync::KalmanEstimator::dumpState(a2);
          int v13 = 138412546;
          uint64_t v14 = v10;
          __int16 v15 = 1024;
          int v16 = a3;
          _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AudioSession_TimesyncCB", "estimator %@, reset %{BOOL}d", (uint8_t *)&v13, 0x12u);
          if (v10) {
            CFRelease(v10);
          }
        }
        os_unfair_lock_lock((os_unfair_lock_t)(v6 + 136));
        int v11 = (char *)a2 + 8;
        BOOL v12 = (a3 & 1) != 0 || *(unsigned char *)(v6 + 304) != 0;
        memmove((void *)(v6 + 200), v11, 0x68uLL);
        *(unsigned char *)(v6 + 304) = v12;
        sub_4CD8((os_unfair_lock_t)(v6 + 432), v6 + 192);
        os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 136));
      }
      sub_D484(v8);
    }
  }
}

void sub_4FC0(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    sub_40D4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

const void **sub_4FE8(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_501C(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v4 = *(std::__shared_weak_count **)(v3 + 48);
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    long long v7 = std::__shared_weak_count::lock(v4);
    if (v7)
    {
      long long v8 = v7;
      if (*(void *)(v3 + 40))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(v6 + 136));
        if (a2) {
          waipc::timesync::BasebandService::triggerMeasurement(*(waipc::timesync::BasebandService **)(v6 + 144));
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 136));
      }
      sub_D484(v8);
    }
  }
}

void sub_50B4(_Unwind_Exception *a1)
{
  sub_D484(v1);
  _Unwind_Resume(a1);
}

void sub_50C8(uint64_t a1, const __CFString *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v4 = *(std::__shared_weak_count **)(v3 + 48);
  if (v4)
  {
    uint64_t v6 = *(os_unfair_lock_s **)(a1 + 40);
    long long v7 = std::__shared_weak_count::lock(v4);
    if (v7)
    {
      long long v8 = v7;
      if (*(void *)(v3 + 40))
      {
        long long v9 = v6 + 34;
        os_unfair_lock_lock(v6 + 34);
        if (qword_14218 != -1) {
          dispatch_once(&qword_14218, &stru_10470);
        }
        unint64_t v10 = qword_14230;
        if (os_signpost_enabled((os_log_t)qword_14230))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AudioSession_ErrorTimerExpiry", "", buf, 2u);
        }
        if (!a2 || !CFStringGetLength(a2)) {
          a2 = @"unknown error";
        }
        int v11 = (const void *)_CTServerConnectionCreateOnTargetQueue();
        *(void *)buf = v11;
        if (v11)
        {
          if (qword_14218 != -1) {
            dispatch_once(&qword_14218, &stru_10470);
          }
          BOOL v12 = qword_14228;
          if (os_signpost_enabled((os_log_t)qword_14228))
          {
            *(_WORD *)__int16 v15 = 0;
            _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AudioSession_ResetModem", "", v15, 2u);
          }
          MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, @"PCIe audio error: ");
          *(void *)__int16 v15 = MutableCopy;
          CFStringAppend(MutableCopy, a2);
          _CTServerConnectionResetModemWithCrashLogs();
          if (MutableCopy) {
            CFRelease(MutableCopy);
          }
          CFRelease(v11);
        }
        else
        {
          if (qword_14218 != -1) {
            dispatch_once(&qword_14218, &stru_10470);
          }
          uint64_t v14 = qword_14220[0];
          if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)__int16 v15 = 0;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "failed to open CTServer connection", v15, 2u);
          }
        }
        os_unfair_lock_unlock(v9);
      }
      sub_D484(v8);
    }
  }
}

void sub_5334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_53A8((const void **)va);
  os_unfair_lock_unlock(v4);
  sub_D484(v3);
  _Unwind_Resume(a1);
}

const void **sub_5374(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_53A8(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_53DC(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 840) + *(void *)(a1 + 848) <= a2)
  {
    waipc::util::NonblockingEventSource::trigger(*(waipc::util::NonblockingEventSource **)(a1 + 880), 1u);
    *(void *)(a1 + 848) = a2;
  }
}

uint64_t sub_542C(uint64_t a1, unsigned int a2)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  unint64_t v4 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    int v21 = 67109120;
    int v22 = a2;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AudioSession_WaitUntilReady", "timeout %u", (uint8_t *)&v21, 8u);
  }
  uint64_t v5 = *(void *)(a1 + 144);
  uint64_t v6 = *(NSObject **)(v5 + 416);
  if (v6) {
    dispatch_retain(*(dispatch_object_t *)(v5 + 416));
  }
  dispatch_time_t v7 = dispatch_time(0, 1000000 * a2);
  intptr_t v8 = dispatch_group_wait(v6, v7);
  if (v6) {
    dispatch_release(v6);
  }
  if (v8)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    long long v9 = qword_14230;
    if (os_signpost_enabled((os_log_t)qword_14230))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AudioSession_WaitUntilReady", "connection timed out", (uint8_t *)&v21, 2u);
    }
    return 0;
  }
  else
  {
    if (waipc::PCIeAudioLink::isPeripheralActive(*(waipc::PCIeAudioLink **)(a1 + 856)))
    {
      uint64_t v10 = 1;
    }
    else
    {
      LOWORD(v11) = *(_WORD *)(a1 + 64);
      useconds_t v12 = ((double)v11 / *(double *)(a1 + 24) * 1000000.0);
      int v13 = 1000 * a2 - 1;
      BOOL v14 = __CFADD__(v13, v12);
      useconds_t v15 = v13 + v12;
      if (v14)
      {
        uint64_t v10 = 0;
      }
      else
      {
        int v16 = v15 / v12;
        do
        {
          usleep(v12);
          uint64_t isPeripheralActive = waipc::PCIeAudioLink::isPeripheralActive(*(waipc::PCIeAudioLink **)(a1 + 856));
          uint64_t v10 = isPeripheralActive;
          if (--v16) {
            int v18 = isPeripheralActive;
          }
          else {
            int v18 = 1;
          }
        }
        while (v18 != 1);
      }
    }
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    v19 = qword_14230;
    if (os_signpost_enabled((os_log_t)qword_14230))
    {
      int v21 = 67109120;
      int v22 = v10;
      _os_signpost_emit_with_name_impl(&dword_0, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AudioSession_WaitUntilReady", "peripheral active %{BOOL}d", (uint8_t *)&v21, 8u);
    }
  }
  return v10;
}

void sub_56D4(uint64_t a1@<X0>, void *a2@<X8>)
{
  unint64_t v4 = (os_unfair_lock_s *)(a1 + 140);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 140));
  uint64_t v5 = mach_continuous_time();
  sub_5824(a1, v5);
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  waipc::PCIeAudioLink::getZeroTimestamp(&v8, *(waipc::PCIeAudioLink **)(a1 + 856), v5);
  waipc::timesync::KalmanEstimator::hostToDevice();
  waipc::timesync::KalmanEstimator::deviceToHostVariance();
  if (!*(unsigned char *)(a1 + 424) || v6 >= *(double *)(a1 + 832)) {
    sub_53DC(a1, v5);
  }
  mach_get_times();
  *a2 = v8;
  uint64_t v7 = v10;
  a2[1] = v9;
  a2[2] = v7;
  os_unfair_lock_unlock(v4);
}

void sub_5800(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_5824(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 140));
  uint64_t result = sub_589C(a1 + 432, a1 + 312);
  if (*(unsigned char *)(a1 + 424))
  {
    uint64_t v5 = *(void *)(a1 + 856);
    return waipc::PCIeAudioLink::sync(v5, a1 + 312, a2);
  }
  return result;
}

BOOL sub_589C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (os_unfair_lock_s *)(a1 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 4));
  unint64_t v5 = atomic_exchange((atomic_ullong *volatile)(a1 + 368), 0);
  if (v5)
  {
    if (a2)
    {
      long long v6 = *(_OWORD *)(v5 + 8);
      long long v7 = *(_OWORD *)(v5 + 24);
      *(_OWORD *)(a2 + 40) = *(_OWORD *)(v5 + 40);
      *(_OWORD *)(a2 + 24) = v7;
      *(_OWORD *)(a2 + 8) = v6;
      long long v8 = *(_OWORD *)(v5 + 56);
      long long v9 = *(_OWORD *)(v5 + 72);
      long long v10 = *(_OWORD *)(v5 + 88);
      *(void *)(a2 + 104) = *(void *)(v5 + 104);
      *(_OWORD *)(a2 + 88) = v10;
      *(_OWORD *)(a2 + 72) = v9;
      *(_OWORD *)(a2 + 56) = v8;
      *(unsigned char *)(a2 + 112) = *(unsigned char *)(v5 + 112);
    }
    sub_D810(a1, v5);
  }
  os_unfair_lock_unlock(v4);
  return v5 != 0;
}

void sub_5944(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_5958(uint64_t a1, void *a2, unsigned int a3, double a4)
{
  long long v8 = (os_unfair_lock_s *)(a1 + 140);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 140));
  uint64_t v9 = mach_continuous_time();
  sub_5824(a1, v9);
  if (a2) {
    waipc::PCIeAudioLink::readInput(*(waipc::PCIeAudioLink **)(a1 + 856), (unint64_t)a4, a2, a3);
  }

  os_unfair_lock_unlock(v8);
}

void sub_59DC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_59F0(uint64_t a1, const void *a2, unsigned int a3, unsigned int a4, double a5)
{
  long long v10 = (os_unfair_lock_s *)(a1 + 140);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 140));
  if (a2) {
    waipc::PCIeAudioLink::writeMix(*(waipc::PCIeAudioLink **)(a1 + 856), (unint64_t)a5, a2, a3, a4);
  }
  uint64_t v11 = mach_continuous_time();
  sub_5824(a1, v11);

  os_unfair_lock_unlock(v10);
}

void sub_5A84(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

double sub_5A98(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 140);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 140));
  waipc::PCIeAudioLink::getDLAlignmentAnchor(*(waipc::PCIeAudioLink **)(a1 + 856));
  double v4 = v3;
  os_unfair_lock_unlock(v2);
  return v4;
}

void sub_5AE4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

double sub_5AF8(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 140);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 140));
  waipc::PCIeAudioLink::getULAlignmentAnchor(*(waipc::PCIeAudioLink **)(a1 + 856));
  double v4 = v3;
  os_unfair_lock_unlock(v2);
  return v4;
}

void sub_5B44(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_5B58(uint64_t a1)
{
  mach_timebase_info(&info);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  uint64_t v2 = mach_continuous_time();
  uint64_t v3 = *(void *)(a1 + 872);
  uint64_t numer = info.numer;
  unint64_t denom = info.denom;
  sub_DB20(v20, @"Error Timeout", (uint64_t *)(a1 + 40));
  sub_DB20(&v21, @"Error Threshold", (uint64_t *)(a1 + 48));
  sub_DB20(v22, @"Measurement Moderation", (uint64_t *)(a1 + 56));
  long long v6 = *(waipc::timesync::BasebandService **)(a1 + 144);
  if (v6) {
    long long v6 = (waipc::timesync::BasebandService *)waipc::timesync::BasebandService::dumpState(v6);
  }
  v22[2] = @"Timesync";
  v22[3] = v6;
  v17[4] = 0;
  if (waipc::util::GroupErrorTimer::isRunning(*(waipc::util::GroupErrorTimer **)(a1 + 176))) {
    CFBooleanRef v7 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v7 = kCFBooleanFalse;
  }
  v22[4] = @"Error Timer Running";
  v22[5] = v7;
  uint64_t v8 = waipc::util::GroupErrorTimer::copyReason(*(waipc::util::GroupErrorTimer **)(a1 + 176));
  v22[6] = @"Error Reason";
  v22[7] = v8;
  v17[3] = 0;
  if (*(unsigned char *)(a1 + 184)) {
    CFBooleanRef v9 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v9 = kCFBooleanFalse;
  }
  v22[8] = @"Error Timer Started for Connection";
  v22[9] = v9;
  uint64_t v10 = waipc::timesync::KalmanEstimator::dumpState((waipc::timesync::KalmanEstimator *)(a1 + 192));
  v22[10] = @"Timeline Estimator";
  v22[11] = v10;
  v17[2] = 0;
  if (*(unsigned char *)(a1 + 304)) {
    CFBooleanRef v11 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v11 = kCFBooleanFalse;
  }
  v22[12] = @"Timeline Ready";
  v22[13] = v11;
  sub_DBE0(v23, @"Last Measurement Time", (uint64_t *)(a1 + 848));
  useconds_t v12 = *(waipc::PCIeAudioLink **)(a1 + 856);
  if (v12) {
    useconds_t v12 = (waipc::PCIeAudioLink *)waipc::PCIeAudioLink::dumpState(v12);
  }
  v23[2] = @"PCIe Link";
  v23[3] = v12;
  v17[1] = 0;
  sub_DBE0(&v24, @"Start Time", (uint64_t *)(a1 + 872));
  *(double *)v17 = (double)((v2 - v3) * numer / denom) / 1000000000.0;
  sub_DCA0(&v25, @"Duration", v17);
  sub_5EBC((uint64_t)v20, &v18);
  for (uint64_t i = 25; i != -1; i -= 2)
  {
    BOOL v14 = (const void *)v20[i];
    if (v14) {
      CFRelease(v14);
    }
  }
  uint64_t v15 = v18;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  return v15;
}

void sub_5DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, const void *a12, const void *a13, const void *a14, uint64_t a15, uint64_t a16, char a17)
{
  sub_4FE8(&a12);
  sub_4FE8(&a13);
  sub_4FE8(&a14);
  while (v18 != &a17)
  {
    v18 -= 16;
    sub_5FA4((uint64_t)v18);
  }
  os_unfair_lock_unlock(v17);
  _Unwind_Resume(a1);
}

void *sub_5EBC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = 0;
  CFIndex v4 = 0;
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  *(_OWORD *)keys = 0u;
  long long v12 = 0u;
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
  while (v3 != 208);
  CFDictionaryRef v7 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)v9, v4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  return sub_CBD4(a2, v7);
}

uint64_t sub_5FA4(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_5FD8(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_600C(id a1)
{
  for (uint64_t i = 0; i != 4; ++i)
    qword_14220[i] = (uint64_t)os_log_create("com.apple.WirelessIPC.audio.BasebandVoice", (&off_10490)[i]);
}

uint64_t sub_6068(_UNKNOWN **a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v8 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "QueryInterface", "", buf, 2u);
  }
  if (a1 == &off_14000)
  {
    if (a4)
    {
      *(void *)&v20.byte0 = a2;
      *(void *)&v20.byte8 = a3;
      CFUUIDRef v12 = CFUUIDCreateFromUUIDBytes(0, v20);
      if (v12)
      {
        if (qword_14218 != -1) {
          dispatch_once(&qword_14218, &stru_10470);
        }
        long long v13 = qword_14230;
        if (os_signpost_enabled((os_log_t)qword_14230))
        {
          *(_DWORD *)buf = 138412290;
          CFUUIDRef v19 = v12;
          _os_signpost_emit_with_name_impl(&dword_0, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "QueryInterface", "uuid %@", buf, 0xCu);
        }
        CFUUIDRef v14 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
        if (CFEqual(v12, v14)
          || (CFUUIDRef v15 = CFUUIDGetConstantUUIDWithBytes(0, 0xEEu, 0xA5u, 0x77u, 0x3Du, 0xCCu, 0x43u, 0x49u, 0xF1u, 0x8Eu, 0, 0x8Fu, 0x96u, 0xE7u, 0xD2u, 0x3Bu, 0x17u), CFEqual(v12, v15)))
        {
          sub_64A8(&off_14000);
          uint64_t v9 = 0;
          *a4 = &off_14000;
        }
        else
        {
          uint64_t v9 = 2147483652;
        }
        goto LABEL_20;
      }
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      uint64_t v9 = 1852797029;
      uint64_t v10 = qword_14220[0];
      if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        CFBooleanRef v11 = "failed to create CFUUID";
        goto LABEL_10;
      }
    }
    else
    {
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      uint64_t v9 = 1852797029;
      uint64_t v10 = qword_14220[0];
      if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        CFBooleanRef v11 = "nowhere to store returned interface";
        goto LABEL_10;
      }
    }
LABEL_30:
    CFUUIDRef v12 = 0;
    goto LABEL_31;
  }
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v9 = 560947818;
  uint64_t v10 = qword_14220[0];
  if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
    goto LABEL_30;
  }
  *(_WORD *)buf = 0;
  CFBooleanRef v11 = "bad driver reference";
LABEL_10:
  _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, v11, buf, 2u);
  CFUUIDRef v12 = 0;
LABEL_20:
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
LABEL_31:
  long long v16 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
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

void sub_647C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_C1E4((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_64A8(_UNKNOWN **a1)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v2 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    LOWORD(v7[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AddRef", "", (uint8_t *)v7, 2u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
  if (a1 == &off_14000)
  {
    if (dword_140E8 != -1)
    {
      uint64_t v4 = ++dword_140E8;
      goto LABEL_13;
    }
  }
  else
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v3 = qword_14220[0];
    if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = 0;
      goto LABEL_16;
    }
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "bad driver reference", (uint8_t *)v7, 2u);
  }
  uint64_t v4 = 0;
LABEL_13:
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
LABEL_16:
  unint64_t v5 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_signpost_emit_with_name_impl(&dword_0, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AddRef", "result %u", (uint8_t *)v7, 8u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_140C8);
  return v4;
}

uint64_t sub_66B0(_UNKNOWN **a1)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v2 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    LOWORD(v7[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Release", "", (uint8_t *)v7, 2u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
  if (a1 == &off_14000)
  {
    if (dword_140E8)
    {
      uint64_t v4 = --dword_140E8;
      goto LABEL_13;
    }
  }
  else
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v3 = qword_14220[0];
    if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = 0;
      goto LABEL_16;
    }
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "bad driver reference", (uint8_t *)v7, 2u);
  }
  uint64_t v4 = 0;
LABEL_13:
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
LABEL_16:
  unint64_t v5 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_signpost_emit_with_name_impl(&dword_0, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Release", "result %u", (uint8_t *)v7, 8u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_140C8);
  return v4;
}

uint64_t sub_68B4(_UNKNOWN **a1, uint64_t a2)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v4 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    LOWORD(v12[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Initialize", "", (uint8_t *)v12, 2u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
  if (a1 == &off_14000)
  {
    qword_140C0[0] = a2;
    uint64_t v8 = dispatch_workloop_create("com.apple.WirelessIPC.audio.BasebandVoice");
    *(void *)&xmmword_140D0 = v8;
    uint64_t v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    *((void *)&xmmword_140D0 + 1) = dispatch_queue_create_with_target_V2("com.apple.WirelessIPC.audio.BasebandVoice.PlugIn", v9, v8);
    os_unfair_lock_assert_owner((const os_unfair_lock *)&dword_140C8);
    if (!os_variant_has_internal_diagnostics() || (qword_140E0 = os_state_add_handler()) != 0)
    {
      uint64_t v5 = 0;
LABEL_14:
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      goto LABEL_16;
    }
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v5 = 2003329396;
    uint64_t v6 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v12[0]) = 0;
      CFDictionaryRef v7 = "failed to add state handler";
      goto LABEL_10;
    }
  }
  else
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v12[0]) = 0;
      CFDictionaryRef v7 = "bad driver reference";
LABEL_10:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)v12, 2u);
      goto LABEL_14;
    }
  }
LABEL_16:
  uint64_t v10 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    v12[0] = 67109120;
    v12[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Initialize", "result %{waipc:4cc}u", (uint8_t *)v12, 8u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_140C8);
  return v5;
}

void sub_6B8C(_Unwind_Exception *a1)
{
}

uint64_t sub_6BA4(_UNKNOWN **a1)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v2 = qword_14230;
  if (!os_signpost_enabled((os_log_t)qword_14230))
  {
    if (a1 == &off_14000)
    {
      uint64_t v4 = 1970171760;
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  LOWORD(v8[0]) = 0;
  _os_signpost_emit_with_name_impl(&dword_0, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CreateDevice", "", (uint8_t *)v8, 2u);
  uint64_t v3 = qword_14218;
  if (a1 != &off_14000)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
LABEL_8:
    uint64_t v4 = 560947818;
    uint64_t v5 = qword_14220[0];
    if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "bad driver reference", (uint8_t *)v8, 2u);
    uint64_t v3 = qword_14218;
    goto LABEL_11;
  }
  uint64_t v4 = 1970171760;
LABEL_11:
  if (v3 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
LABEL_14:
  uint64_t v6 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_signpost_emit_with_name_impl(&dword_0, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CreateDevice", "result %{waipc:4cc}u", (uint8_t *)v8, 8u);
  }
  return v4;
}

uint64_t sub_6D98(_UNKNOWN **a1)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v2 = qword_14230;
  if (!os_signpost_enabled((os_log_t)qword_14230))
  {
    if (a1 == &off_14000)
    {
      uint64_t v4 = 1970171760;
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  LOWORD(v8[0]) = 0;
  _os_signpost_emit_with_name_impl(&dword_0, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DestroyDevice", "", (uint8_t *)v8, 2u);
  uint64_t v3 = qword_14218;
  if (a1 != &off_14000)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
LABEL_8:
    uint64_t v4 = 560947818;
    uint64_t v5 = qword_14220[0];
    if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "bad driver reference", (uint8_t *)v8, 2u);
    uint64_t v3 = qword_14218;
    goto LABEL_11;
  }
  uint64_t v4 = 1970171760;
LABEL_11:
  if (v3 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
LABEL_14:
  uint64_t v6 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_signpost_emit_with_name_impl(&dword_0, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DestroyDevice", "result %{waipc:4cc}u", (uint8_t *)v8, 8u);
  }
  return v4;
}

uint64_t sub_6F8C(_UNKNOWN **a1, int a2)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v4 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    LOWORD(v10[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AddDeviceClient", "", (uint8_t *)v10, 2u);
  }
  if (a1 == &off_14000)
  {
    if (a2 == 2)
    {
      uint64_t v5 = 0;
      goto LABEL_17;
    }
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      CFDictionaryRef v7 = "bad device ID";
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      CFDictionaryRef v7 = "bad driver reference";
LABEL_16:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)v10, 2u);
LABEL_17:
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
    }
  }
  uint64_t v8 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    v10[0] = 67109120;
    v10[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AddDeviceClient", "result %{waipc:4cc}u", (uint8_t *)v10, 8u);
  }
  return v5;
}

uint64_t sub_71D4(_UNKNOWN **a1, int a2)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v4 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    LOWORD(v10[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RemoveDeviceClient", "", (uint8_t *)v10, 2u);
  }
  if (a1 == &off_14000)
  {
    if (a2 == 2)
    {
      uint64_t v5 = 0;
      goto LABEL_17;
    }
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      CFDictionaryRef v7 = "bad device ID";
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      CFDictionaryRef v7 = "bad driver reference";
LABEL_16:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)v10, 2u);
LABEL_17:
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
    }
  }
  uint64_t v8 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    v10[0] = 67109120;
    v10[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RemoveDeviceClient", "result %{waipc:4cc}u", (uint8_t *)v10, 8u);
  }
  return v5;
}

uint64_t sub_741C(_UNKNOWN **a1, int a2, uint64_t a3, void (**a4)(void, void))
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v8 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    LOWORD(v20[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PerformDeviceConfigurationChange", "", (uint8_t *)v20, 2u);
  }
  if (a1 == &off_14000)
  {
    if (a2 == 2)
    {
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      CFUUIDRef v12 = qword_14238;
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer((os_log_t)qword_14238, a4);
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
        sub_DE4C();
      }
      if (!a4) {
        sub_DE20();
      }
      a4[2](a4, 1);
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      CFUUIDRef v15 = qword_14238;
      os_signpost_id_t v16 = os_signpost_id_make_with_pointer((os_log_t)qword_14238, a4);
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
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v9 = 560947818;
    uint64_t v10 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v20[0]) = 0;
      CFBooleanRef v11 = "bad device ID";
      goto LABEL_28;
    }
  }
  else
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v9 = 560947818;
    uint64_t v10 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v20[0]) = 0;
      CFBooleanRef v11 = "bad driver reference";
LABEL_28:
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)v20, 2u);
LABEL_29:
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
    }
  }
  uint64_t v18 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    v20[0] = 67109120;
    v20[1] = v9;
    _os_signpost_emit_with_name_impl(&dword_0, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PerformDeviceConfigurationChange", "result %{waipc:4cc}u", (uint8_t *)v20, 8u);
  }
  return v9;
}

uint64_t sub_77A8(_UNKNOWN **a1, int a2, uint64_t a3, void (**a4)(void, void))
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v8 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    LOWORD(v20[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AbortDeviceConfigurationChange", "", (uint8_t *)v20, 2u);
  }
  if (a1 == &off_14000)
  {
    if (a2 == 2)
    {
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      CFUUIDRef v12 = qword_14238;
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer((os_log_t)qword_14238, a4);
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
        sub_DEA4();
      }
      if (!a4) {
        sub_DE78();
      }
      a4[2](a4, 0);
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      CFUUIDRef v15 = qword_14238;
      os_signpost_id_t v16 = os_signpost_id_make_with_pointer((os_log_t)qword_14238, a4);
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
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v9 = 560947818;
    uint64_t v10 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v20[0]) = 0;
      CFBooleanRef v11 = "bad device ID";
      goto LABEL_28;
    }
  }
  else
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v9 = 560947818;
    uint64_t v10 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v20[0]) = 0;
      CFBooleanRef v11 = "bad driver reference";
LABEL_28:
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)v20, 2u);
LABEL_29:
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
    }
  }
  uint64_t v18 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    v20[0] = 67109120;
    v20[1] = v9;
    _os_signpost_emit_with_name_impl(&dword_0, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AbortDeviceConfigurationChange", "result %{waipc:4cc}u", (uint8_t *)v20, 8u);
  }
  return v9;
}

BOOL sub_7B34(_UNKNOWN **a1, int a2, uint64_t a3, int *a4)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  CFDictionaryRef v7 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    int v8 = *a4;
    int v9 = a4[1];
    int v10 = a4[2];
    int v23 = 67109888;
    BOOL v24 = a2;
    __int16 v25 = 1024;
    int v26 = v8;
    __int16 v27 = 1024;
    int v28 = v9;
    __int16 v29 = 1024;
    int v30 = v10;
    _os_signpost_emit_with_name_impl(&dword_0, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "HasProperty", "object %u, selector %{waipc:4cc}u, scope %{waipc:4cc}u, element %u", (uint8_t *)&v23, 0x1Au);
  }
  if (a1 != &off_14000)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    CFBooleanRef v11 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      CFUUIDRef v12 = "bad driver reference";
LABEL_10:
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v23, 2u);
LABEL_11:
      BOOL v13 = 0;
      goto LABEL_93;
    }
    goto LABEL_24;
  }
  if (!a4)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    CFBooleanRef v11 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      CFUUIDRef v12 = "no address";
      goto LABEL_10;
    }
LABEL_24:
    BOOL v13 = 0;
    goto LABEL_95;
  }
  if ((a2 - 3) < 2)
  {
    BOOL v13 = 0;
    int v14 = *a4;
    if (*a4 > 1935762291)
    {
      if (v14 > 1936092512)
      {
        if (v14 == 1936092513 || v14 == 1937007734) {
          goto LABEL_92;
        }
        int v16 = 1936092532;
      }
      else
      {
        if (v14 == 1935762292 || v14 == 1935894638) {
          goto LABEL_92;
        }
        int v16 = 1935960434;
      }
    }
    else
    {
      if (v14 <= 1870098019)
      {
        if (v14 != 1650682995 && v14 != 1668047219)
        {
          int v16 = 1819569763;
          goto LABEL_91;
        }
        goto LABEL_92;
      }
      if (v14 == 1870098020 || v14 == 1885762592) {
        goto LABEL_92;
      }
      int v16 = 1885762657;
    }
    goto LABEL_91;
  }
  if (a2 != 2)
  {
    if (a2 != 1) {
      goto LABEL_11;
    }
    BOOL v13 = 0;
    int v14 = *a4;
    if (*a4 > 1819173228)
    {
      if (v14 > 1937007733)
      {
        if ((v14 - 1969841250) >= 3)
        {
          unsigned __int16 v15 = 25718;
LABEL_36:
          int v16 = v15 | 0x73740000;
          goto LABEL_91;
        }
        goto LABEL_92;
      }
      if (v14 == 1819173229 || v14 == 1870098020) {
        goto LABEL_92;
      }
      int v16 = 1920168547;
      goto LABEL_91;
    }
    if (v14 > 1668049698)
    {
      if (v14 == 1668049699 || v14 == 1684370979) {
        goto LABEL_92;
      }
      int v16 = 1819107691;
      goto LABEL_91;
    }
    if (v14 == 1650682995) {
      goto LABEL_92;
    }
    int v17 = 1651472419;
LABEL_54:
    if (v14 == v17) {
      goto LABEL_92;
    }
    int v16 = 1668047219;
    goto LABEL_91;
  }
  BOOL v13 = 0;
  int v14 = *a4;
  if (*a4 <= 1819107690)
  {
    if (v14 <= 1668575851)
    {
      if (v14 > 1668049763)
      {
        if (v14 == 1668049764 || v14 == 1668050795) {
          goto LABEL_92;
        }
        int v16 = 1668510818;
        goto LABEL_91;
      }
      if (v14 == 1634429294) {
        goto LABEL_92;
      }
      int v17 = 1650682995;
      goto LABEL_54;
    }
    if (v14 > 1735354733)
    {
      if (v14 == 1735354734 || v14 == 1751737454) {
        goto LABEL_92;
      }
      int v16 = 1818850926;
      goto LABEL_91;
    }
    if (v14 == 1668575852) {
      goto LABEL_92;
    }
    if (v14 != 1684434036)
    {
      int v16 = 1718843939;
      goto LABEL_91;
    }
  }
  else
  {
    if (v14 <= 1919512166)
    {
      if (v14 > 1853059618)
      {
        if (v14 == 1853059619 || v14 == 1853059700) {
          goto LABEL_92;
        }
        int v16 = 1870098020;
        goto LABEL_91;
      }
      if (v14 == 1819107691 || v14 == 1819173229) {
        goto LABEL_92;
      }
      int v18 = 1819569763;
      goto LABEL_73;
    }
    if (v14 > 1937007733)
    {
      if (v14 <= 1953653101)
      {
        if (v14 != 1937007734)
        {
          unsigned __int16 v15 = 27939;
          goto LABEL_36;
        }
LABEL_92:
        BOOL v13 = 1;
        goto LABEL_93;
      }
      if (v14 == 1969841184) {
        goto LABEL_92;
      }
      int v16 = 1953653102;
LABEL_91:
      if (v14 != v16) {
        goto LABEL_93;
      }
      goto LABEL_92;
    }
    if (v14 == 1919512167) {
      goto LABEL_92;
    }
    if (v14 != 1935763060)
    {
      int v18 = 1936092276;
LABEL_73:
      if (v14 != v18) {
        goto LABEL_93;
      }
    }
  }
  int v19 = a4[1];
  BOOL v13 = v19 == 1768845428 || v19 == 1869968496;
LABEL_93:
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
LABEL_95:
  uint64_t v21 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    int v23 = 67109120;
    BOOL v24 = v13;
    _os_signpost_emit_with_name_impl(&dword_0, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "HasProperty", "result %{BOOL}d", (uint8_t *)&v23, 8u);
  }
  return v13;
}

uint64_t sub_8190(_UNKNOWN **a1, int a2, uint64_t a3, int *a4, char *a5)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  int v9 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    int v10 = *a4;
    int v11 = a4[1];
    int v12 = a4[2];
    int v25 = 67109888;
    int v26 = a2;
    __int16 v27 = 1024;
    int v28 = v10;
    __int16 v29 = 1024;
    int v30 = v11;
    __int16 v31 = 1024;
    int v32 = v12;
    _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IsPropertySettable", "object %u, selector %{waipc:4cc}u, scope %{waipc:4cc}u, element %u", (uint8_t *)&v25, 0x1Au);
  }
  if (a1 != &off_14000)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v13 = 560947818;
    int v14 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      unsigned __int16 v15 = "bad driver reference";
LABEL_10:
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v25, 2u);
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if (a4)
  {
    if (!a5)
    {
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      uint64_t v13 = 1852797029;
      int v14 = qword_14220[0];
      if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        unsigned __int16 v15 = "nowhere to store result";
        goto LABEL_10;
      }
      goto LABEL_13;
    }
    if ((a2 - 3) < 2)
    {
      char v21 = 0;
      uint64_t v13 = 2003332927;
      int v22 = *a4;
      if (*a4 > 1935762291)
      {
        if (v22 > 1936092512)
        {
          if (v22 == 1936092513 || v22 == 1937007734) {
            goto LABEL_96;
          }
          if (v22 != 1936092532)
          {
LABEL_11:
            if (qword_14218 != -1) {
              dispatch_once(&qword_14218, &stru_10470);
            }
            goto LABEL_13;
          }
        }
        else if (v22 != 1935762292)
        {
          if (v22 == 1935894638) {
            goto LABEL_96;
          }
          int v24 = 1935960434;
          goto LABEL_56;
        }
      }
      else
      {
        if (v22 <= 1870098019)
        {
          if (v22 == 1650682995) {
            goto LABEL_96;
          }
          int v23 = 1668047219;
          goto LABEL_40;
        }
        if (v22 == 1870098020) {
          goto LABEL_96;
        }
        if (v22 != 1885762592)
        {
          int v24 = 1885762657;
          goto LABEL_56;
        }
      }
    }
    else
    {
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
              goto LABEL_85;
            }
            int v19 = 1819107691;
          }
          else
          {
            if (v18 == 1650682995 || v18 == 1651472419) {
              goto LABEL_85;
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
              goto LABEL_84;
            }
LABEL_85:
            uint64_t v13 = 0;
            *a5 = 0;
            goto LABEL_11;
          }
          if (v18 == 1819173229 || v18 == 1870098020) {
            goto LABEL_85;
          }
          int v19 = 1920168547;
        }
LABEL_84:
        if (v18 != v19) {
          goto LABEL_11;
        }
        goto LABEL_85;
      }
      char v21 = 0;
      uint64_t v13 = 2003332927;
      int v22 = *a4;
      if (*a4 <= 1819107690)
      {
        if (v22 > 1668575851)
        {
          if (v22 > 1735354733)
          {
            if (v22 == 1735354734 || v22 == 1751737454) {
              goto LABEL_96;
            }
            int v24 = 1818850926;
          }
          else
          {
            if (v22 == 1668575852 || v22 == 1684434036) {
              goto LABEL_96;
            }
            int v24 = 1718843939;
          }
        }
        else if (v22 > 1668049763)
        {
          if (v22 == 1668049764 || v22 == 1668050795) {
            goto LABEL_96;
          }
          int v24 = 1668510818;
        }
        else
        {
          if (v22 == 1634429294 || v22 == 1650682995) {
            goto LABEL_96;
          }
          int v24 = 1668047219;
        }
        goto LABEL_56;
      }
      if (v22 > 1919512166)
      {
        if (v22 <= 1937007733)
        {
          if (v22 == 1919512167 || v22 == 1935763060) {
            goto LABEL_96;
          }
          int v24 = 1936092276;
        }
        else if (v22 > 1953653101)
        {
          if (v22 == 1953653102) {
            goto LABEL_96;
          }
          int v24 = 1969841184;
        }
        else
        {
          if (v22 == 1937007734) {
            goto LABEL_96;
          }
          int v24 = 1937009955;
        }
        goto LABEL_56;
      }
      if (v22 <= 1853059618)
      {
        if (v22 == 1819107691) {
          goto LABEL_96;
        }
        int v23 = 1819173229;
LABEL_40:
        if (v22 == v23) {
          goto LABEL_96;
        }
        int v24 = 1819569763;
        goto LABEL_56;
      }
      if (v22 == 1853059619) {
        goto LABEL_96;
      }
      if (v22 != 1853059700)
      {
        int v24 = 1870098020;
LABEL_56:
        if (v22 != v24) {
          goto LABEL_11;
        }
LABEL_96:
        uint64_t v13 = 0;
        *a5 = v21;
        goto LABEL_11;
      }
    }
    char v21 = 1;
    goto LABEL_96;
  }
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v13 = 1852797029;
  int v14 = qword_14220[0];
  if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
  {
    LOWORD(v25) = 0;
    unsigned __int16 v15 = "no address";
    goto LABEL_10;
  }
LABEL_13:
  int v16 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    if (a5) {
      int v17 = *a5;
    }
    else {
      int v17 = 0;
    }
    int v25 = 67109376;
    int v26 = v13;
    __int16 v27 = 1024;
    int v28 = v17;
    _os_signpost_emit_with_name_impl(&dword_0, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IsPropertySettable", "result %{waipc:4cc}u, isSettable %{BOOL}d", (uint8_t *)&v25, 0xEu);
  }
  return v13;
}

uint64_t sub_8898(_UNKNOWN **a1, int a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, int *a7)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  int v11 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    int v12 = *a4;
    int v13 = a4[1];
    int v14 = a4[2];
    int v27 = 67109888;
    int v28 = a2;
    __int16 v29 = 1024;
    int v30 = v12;
    __int16 v31 = 1024;
    int v32 = v13;
    __int16 v33 = 1024;
    int v34 = v14;
    _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GetPropertyDataSize", "object %u, selector %{waipc:4cc}u, scope %{waipc:4cc}u, element %u", (uint8_t *)&v27, 0x1Au);
  }
  if (a1 != &off_14000)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v15 = 560947818;
    int v16 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v27) = 0;
      int v17 = "bad driver reference";
LABEL_10:
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v27, 2u);
      goto LABEL_109;
    }
    goto LABEL_111;
  }
  if (a4)
  {
    if (!a7)
    {
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      uint64_t v15 = 1852797029;
      int v16 = qword_14220[0];
      if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        int v17 = "nowhere to store result";
        goto LABEL_10;
      }
      goto LABEL_111;
    }
    if ((a2 - 3) >= 2)
    {
      if (a2 != 2)
      {
        if (a2 != 1)
        {
          uint64_t v15 = 560947818;
          goto LABEL_109;
        }
        uint64_t v15 = 2003332927;
        int v18 = *a4;
        int v19 = 4;
        if (*a4 > 1819173228)
        {
          if (v18 > 1937007733)
          {
            if ((v18 - 1969841250) < 3) {
              goto LABEL_108;
            }
            goto LABEL_50;
          }
          if (v18 != 1819173229)
          {
            if (v18 != 1870098020)
            {
              int v22 = 1920168547;
              goto LABEL_99;
            }
            if (qword_14240 == -1) {
              goto LABEL_105;
            }
            goto LABEL_117;
          }
LABEL_100:
          int v19 = 8;
          goto LABEL_108;
        }
        if (v18 > 1668049698)
        {
          if (v18 != 1668049699)
          {
            if (v18 != 1684370979)
            {
              int v22 = 1819107691;
LABEL_99:
              if (v18 != v22) {
                goto LABEL_109;
              }
              goto LABEL_100;
            }
            if (qword_14240 == -1)
            {
LABEL_105:
              if (byte_14248) {
                int v19 = 4;
              }
              else {
                int v19 = 0;
              }
              goto LABEL_108;
            }
LABEL_117:
            dispatch_once(&qword_14240, &stru_10510);
            goto LABEL_105;
          }
        }
        else
        {
          if (v18 == 1650682995) {
            goto LABEL_108;
          }
          if (v18 != 1651472419)
          {
LABEL_59:
            int v20 = 1668047219;
LABEL_95:
            if (v18 != v20)
            {
LABEL_109:
              if (qword_14218 != -1) {
                dispatch_once(&qword_14218, &stru_10470);
              }
              goto LABEL_111;
            }
LABEL_108:
            uint64_t v15 = 0;
            *a7 = v19;
            goto LABEL_109;
          }
        }
        goto LABEL_91;
      }
      uint64_t v15 = 2003332927;
      int v18 = *a4;
      int v19 = 4;
      if (*a4 <= 1819107690)
      {
        if (v18 <= 1668575851)
        {
          if (v18 > 1668049763)
          {
            if (v18 == 1668049764 || v18 == 1668050795) {
              goto LABEL_108;
            }
            int v20 = 1668510818;
            goto LABEL_95;
          }
          if (v18 == 1634429294 || v18 == 1650682995) {
            goto LABEL_108;
          }
          goto LABEL_59;
        }
        if (v18 > 1735354733)
        {
          if (v18 == 1735354734 || v18 == 1751737454) {
            goto LABEL_108;
          }
          int v20 = 1818850926;
          goto LABEL_95;
        }
        if (v18 == 1668575852)
        {
LABEL_91:
          int v19 = 0;
          goto LABEL_108;
        }
        if (v18 == 1684434036) {
          goto LABEL_108;
        }
        if (v18 != 1718843939) {
          goto LABEL_109;
        }
      }
      else
      {
        if (v18 > 1919512166)
        {
          if (v18 <= 1937007733)
          {
            if (v18 == 1919512167 || v18 == 1935763060) {
              goto LABEL_108;
            }
            int v20 = 1936092276;
            goto LABEL_95;
          }
          if (v18 > 1953653101)
          {
            if (v18 == 1953653102) {
              goto LABEL_108;
            }
            int v22 = 1969841184;
            goto LABEL_99;
          }
          if (v18 == 1937007734) {
            goto LABEL_108;
          }
          int v21 = 1937009955;
LABEL_86:
          if (v18 != v21) {
            goto LABEL_109;
          }
          int v23 = a4[1];
          if (v23 == 1735159650) {
            goto LABEL_100;
          }
          if (v23 == 1869968496 || v23 == 1768845428)
          {
            int v19 = 4;
            goto LABEL_108;
          }
          goto LABEL_91;
        }
        if (v18 <= 1853059618)
        {
          if (v18 == 1819107691 || v18 == 1819173229) {
            goto LABEL_100;
          }
LABEL_32:
          int v20 = 1819569763;
          goto LABEL_95;
        }
        if (v18 != 1853059619)
        {
          if (v18 == 1853059700) {
            goto LABEL_100;
          }
          int v21 = 1870098020;
          goto LABEL_86;
        }
      }
      int v19 = 16;
      goto LABEL_108;
    }
    uint64_t v15 = 2003332927;
    int v18 = *a4;
    int v19 = 4;
    if (*a4 > 1935762291)
    {
      if (v18 <= 1936092512)
      {
        if (v18 == 1935762292 || v18 == 1935894638) {
          goto LABEL_108;
        }
        int v20 = 1935960434;
        goto LABEL_95;
      }
      if (v18 == 1936092513)
      {
LABEL_60:
        int v19 = 56;
        goto LABEL_108;
      }
      if (v18 != 1936092532)
      {
LABEL_50:
        int v20 = 1937007734;
        goto LABEL_95;
      }
    }
    else
    {
      if (v18 <= 1870098019)
      {
        if (v18 == 1650682995 || v18 == 1668047219) {
          goto LABEL_108;
        }
        goto LABEL_32;
      }
      if (v18 == 1870098020) {
        goto LABEL_91;
      }
      if (v18 != 1885762592)
      {
        if (v18 != 1885762657) {
          goto LABEL_109;
        }
        goto LABEL_60;
      }
    }
    int v19 = 40;
    goto LABEL_108;
  }
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v15 = 1852797029;
  int v16 = qword_14220[0];
  if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
  {
    LOWORD(v27) = 0;
    int v17 = "no address";
    goto LABEL_10;
  }
LABEL_111:
  int v24 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    if (a7) {
      int v25 = *a7;
    }
    else {
      int v25 = 0;
    }
    int v27 = 67109376;
    int v28 = v15;
    __int16 v29 = 1024;
    int v30 = v25;
    _os_signpost_emit_with_name_impl(&dword_0, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GetPropertyDataSize", "result %{waipc:4cc}u, dataSize %u", (uint8_t *)&v27, 0xEu);
  }
  return v15;
}

uint64_t sub_904C(_UNKNOWN **a1, unsigned int a2, int a3, int *a4, unsigned int a5, CFStringRef *a6, unsigned int a7, int *a8, char *__dst)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  int v16 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    int v17 = *a4;
    int v18 = a4[1];
    int v19 = a4[2];
    *(void *)&long long v48 = __PAIR64__(a2, 67109888);
    WORD4(v48) = 1024;
    *(_DWORD *)((char *)&v48 + 10) = v17;
    HIWORD(v48) = 1024;
    LODWORD(v49) = v18;
    WORD2(v49) = 1024;
    *(_DWORD *)((char *)&v49 + 6) = v19;
    _os_signpost_emit_with_name_impl(&dword_0, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GetPropertyData", "object %u, selector %{waipc:4cc}u, scope %{waipc:4cc}u, element %u", (uint8_t *)&v48, 0x1Au);
  }
  if (a1 != &off_14000)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v20 = 560947818;
    int v21 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v48) = 0;
      int v22 = "bad driver reference";
LABEL_10:
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v48, 2u);
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if (a4)
  {
    if (!a8)
    {
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      uint64_t v20 = 1852797029;
      int v21 = qword_14220[0];
      if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
      {
        LOWORD(v48) = 0;
        int v22 = "nowhere to store result size";
        goto LABEL_10;
      }
      goto LABEL_13;
    }
    if (!__dst)
    {
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      uint64_t v20 = 1852797029;
      int v21 = qword_14220[0];
      if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
      {
        LOWORD(v48) = 0;
        int v22 = "nowhere to store result";
        goto LABEL_10;
      }
      goto LABEL_13;
    }
    if (a2 - 3 >= 2)
    {
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
                goto LABEL_156;
              }
              int v26 = 1969841250;
              goto LABEL_47;
            }
            if (v25 == 1969841251) {
              goto LABEL_156;
            }
            if (v25 == 1969841252)
            {
              uint64_t v20 = 561211770;
              if (a5 >= 8)
              {
                if (!a6)
                {
                  uint64_t v20 = 1852797029;
                  goto LABEL_11;
                }
                if (qword_14218 != -1) {
                  dispatch_once(&qword_14218, &stru_10470);
                }
                v36 = qword_14230;
                if (os_signpost_enabled((os_log_t)qword_14230))
                {
                  CFStringRef v37 = *a6;
                  LODWORD(v48) = 138412290;
                  *(void *)((char *)&v48 + 4) = v37;
                  _os_signpost_emit_with_name_impl(&dword_0, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetPropertyData", "uid %@", (uint8_t *)&v48, 0xCu);
                }
                if (qword_14240 != -1) {
                  dispatch_once(&qword_14240, &stru_10510);
                }
                if (byte_14248 == 1 && CFEqual(*a6, @"Baseband Voice")) {
                  int v29 = 2;
                }
                else {
                  int v29 = 0;
                }
                if (a7 < 4) {
                  goto LABEL_11;
                }
                uint64_t v20 = 0;
                goto LABEL_155;
              }
            }
LABEL_11:
            if (qword_14218 != -1) {
              dispatch_once(&qword_14218, &stru_10470);
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
                goto LABEL_194;
              }
              uint64_t v20 = 0;
              CFStringRef v35 = &stru_10A48;
              goto LABEL_164;
            }
            if (qword_14240 == -1)
            {
LABEL_174:
              if (byte_14248 == 1)
              {
                int v42 = 2;
                goto LABEL_197;
              }
LABEL_176:
              uint64_t v20 = 0;
              *a8 = 0;
              goto LABEL_11;
            }
LABEL_210:
            dispatch_once(&qword_14240, &stru_10510);
            goto LABEL_174;
          }
          goto LABEL_162;
        }
        if (v25 <= 1668049698)
        {
          if (v25 != 1650682995)
          {
            if (v25 == 1651472419) {
              goto LABEL_176;
            }
            if (v25 != 1668047219) {
              goto LABEL_11;
            }
            if (a7 < 4) {
              goto LABEL_194;
            }
            uint64_t v20 = 0;
            int v29 = 1634757735;
LABEL_155:
            *(_DWORD *)__dst = v29;
LABEL_158:
            int v31 = 4;
            goto LABEL_159;
          }
LABEL_87:
          if (a7 < 4) {
            goto LABEL_194;
          }
          uint64_t v20 = 0;
          int v29 = 1634689642;
          goto LABEL_155;
        }
        if (v25 == 1668049699) {
          goto LABEL_176;
        }
        if (v25 == 1684370979)
        {
          if (qword_14240 == -1) {
            goto LABEL_174;
          }
          goto LABEL_210;
        }
        if (v25 != 1819107691) {
          goto LABEL_11;
        }
LABEL_107:
        if (a7 < 8) {
          goto LABEL_194;
        }
        uint64_t v20 = 0;
        CFStringRef v35 = @"Apple Inc.";
LABEL_164:
        *(void *)__dst = v35;
        int v31 = 8;
        goto LABEL_159;
      }
      uint64_t v20 = 2003332927;
      int v25 = *a4;
      if (*a4 > 1819107690)
      {
        if (v25 > 1919512166)
        {
          if (v25 > 1937007733)
          {
            if (v25 <= 1953653101)
            {
              if (v25 != 1937007734)
              {
                int v28 = 1937009955;
                goto LABEL_141;
              }
LABEL_153:
              if (a7 < 4) {
                goto LABEL_194;
              }
              uint64_t v20 = 0;
              int v29 = 1;
              goto LABEL_155;
            }
            if (v25 == 1953653102)
            {
              if (a7 < 4) {
                goto LABEL_194;
              }
              uint64_t v20 = 0;
              int v29 = 1885563168;
              goto LABEL_155;
            }
            if (v25 != 1969841184) {
              goto LABEL_11;
            }
LABEL_162:
            if (a7 < 8) {
              goto LABEL_194;
            }
            uint64_t v20 = 0;
            CFStringRef v35 = @"Baseband Voice";
            goto LABEL_164;
          }
          if (v25 != 1919512167)
          {
            if (v25 != 1935763060)
            {
              int v26 = 1936092276;
              goto LABEL_47;
            }
            os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
            int v43 = a4[1];
            if (v43 == 1869968496)
            {
              if (a7 >= 4)
              {
                double v44 = 0.0001;
                goto LABEL_208;
              }
            }
            else
            {
              if (v43 != 1768845428) {
                goto LABEL_170;
              }
              if (a7 >= 4)
              {
                double v44 = 0.001;
LABEL_208:
                uint64_t v20 = 0;
                unsigned int v41 = vcvtpd_u64_f64(v44 * *(double *)&qword_140F0);
                goto LABEL_168;
              }
            }
LABEL_114:
            uint64_t v20 = 561211770;
LABEL_170:
            os_unfair_lock_unlock((os_unfair_lock_t)&dword_140C8);
            goto LABEL_11;
          }
          os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
          if (a7 < 4) {
            goto LABEL_114;
          }
          uint64_t v20 = 0;
          unsigned int v41 = llround(*(double *)&qword_140F0 * 0.02) * llround(15.0);
LABEL_168:
          *(_DWORD *)__dst = v41;
          int v34 = 4;
          goto LABEL_169;
        }
        if (v25 > 1853059618)
        {
          if (v25 == 1853059619)
          {
            int v45 = a7 >> 4;
            if (a7 >= 0x10) {
              int v45 = 1;
            }
            if (v45)
            {
              size_t v46 = (16 * v45);
              v47 = &xmmword_E6C0;
LABEL_201:
              memcpy(__dst, v47, v46);
LABEL_203:
              uint64_t v20 = 0;
              *a8 = v46;
              goto LABEL_11;
            }
            goto LABEL_202;
          }
          if (v25 != 1853059700)
          {
            int v28 = 1870098020;
LABEL_141:
            if (v25 != v28) {
              goto LABEL_11;
            }
            int v38 = a4[1];
            switch(v38)
            {
              case 1869968496:
                int v42 = 4;
                break;
              case 1768845428:
                int v42 = 3;
                break;
              case 1735159650:
                *(void *)&long long v48 = 0x400000003;
                int v39 = a7 >> 2;
                if (a7 >> 2 >= 2) {
                  int v39 = 2;
                }
                if (v39) {
                  goto LABEL_200;
                }
                goto LABEL_202;
              default:
                goto LABEL_176;
            }
LABEL_197:
            LODWORD(v48) = v42;
            int v39 = a7 >> 2;
            if (a7 >= 4) {
              int v39 = 1;
            }
            if (v39)
            {
LABEL_200:
              size_t v46 = (4 * v39);
              v47 = &v48;
              goto LABEL_201;
            }
LABEL_202:
            LODWORD(v46) = 0;
            goto LABEL_203;
          }
          os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
          if (a7 >= 8)
          {
            uint64_t v20 = 0;
            *(void *)__dst = qword_140F0;
            int v34 = 8;
            goto LABEL_169;
          }
          goto LABEL_114;
        }
        if (v25 == 1819107691) {
          goto LABEL_107;
        }
        if (v25 == 1819173229) {
          goto LABEL_162;
        }
        int v32 = 1819569763;
        goto LABEL_152;
      }
      if (v25 > 1668575851)
      {
        if (v25 <= 1735354733)
        {
          if (v25 == 1668575852) {
            goto LABEL_176;
          }
          if (v25 == 1684434036) {
            goto LABEL_156;
          }
          if (v25 != 1718843939) {
            goto LABEL_11;
          }
          os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
          if (a7 >= 0x10)
          {
            uint64_t v20 = 0;
            double v33 = round(*(double *)&qword_140F0 * 0.02);
            *(void *)__dst = 0;
            *((double *)__dst + 1) = v33;
            int v34 = 16;
LABEL_169:
            *a8 = v34;
            goto LABEL_170;
          }
          goto LABEL_114;
        }
        if (v25 == 1735354734)
        {
          os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
          if (a7 < 4) {
            goto LABEL_114;
          }
          uint64_t v20 = 0;
          unsigned int v41 = dword_140EC != 0;
          goto LABEL_168;
        }
        if (v25 == 1751737454) {
          goto LABEL_156;
        }
        int v32 = 1818850926;
LABEL_152:
        if (v25 != v32) {
          goto LABEL_11;
        }
        goto LABEL_153;
      }
      if (v25 > 1668049763)
      {
        if (v25 == 1668049764) {
          goto LABEL_156;
        }
        if (v25 == 1668050795)
        {
          if (a7 < 4) {
            goto LABEL_194;
          }
          uint64_t v20 = 0;
          int v29 = 1835103847;
          goto LABEL_155;
        }
        int v32 = 1668510818;
        goto LABEL_152;
      }
      if (v25 != 1634429294)
      {
        if (v25 != 1650682995)
        {
          if (v25 != 1668047219) {
            goto LABEL_11;
          }
          if (a7 < 4) {
            goto LABEL_194;
          }
          uint64_t v20 = 0;
          int v29 = 1633969526;
          goto LABEL_155;
        }
        goto LABEL_87;
      }
LABEL_109:
      if (a7 < 4) {
        goto LABEL_194;
      }
      uint64_t v20 = 0;
      int v29 = 2;
      goto LABEL_155;
    }
    uint64_t v20 = 0;
    int v25 = *a4;
    if (*a4 > 1935762291)
    {
      if (v25 <= 1936092512)
      {
        if (v25 != 1935762292)
        {
          if (v25 != 1935894638)
          {
            if (v25 != 1935960434) {
              goto LABEL_11;
            }
            if (a7 < 4) {
              goto LABEL_194;
            }
            uint64_t v20 = 0;
            int v29 = a2 == 3;
            goto LABEL_155;
          }
          goto LABEL_153;
        }
        os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
        if (a7 >= 4)
        {
          uint64_t v20 = 0;
          v40 = &word_14100;
          if (a2 != 3) {
            v40 = (__int16 *)((char *)&word_14100 + 1);
          }
          unsigned int v41 = *(unsigned __int8 *)v40;
          goto LABEL_168;
        }
        goto LABEL_114;
      }
      if (v25 == 1936092513)
      {
LABEL_83:
        long long v48 = xmmword_E6D8;
        long long v49 = unk_E6E8;
        long long v50 = xmmword_E6C0;
        if (a7 < 0x38)
        {
          int v31 = 0;
        }
        else
        {
          *(void *)__dst = 0x40DF400000000000;
          long long v30 = v49;
          *(_OWORD *)(__dst + 8) = v48;
          *(_OWORD *)(__dst + 24) = v30;
          *(_OWORD *)(__dst + 40) = v50;
          int v31 = 56;
        }
        uint64_t v20 = 0;
        goto LABEL_159;
      }
      if (v25 != 1936092532)
      {
        if (v25 != 1937007734) {
          goto LABEL_11;
        }
        goto LABEL_109;
      }
    }
    else
    {
      if (v25 <= 1870098019)
      {
        if (v25 == 1650682995) {
          goto LABEL_87;
        }
        if (v25 == 1668047219)
        {
          if (a7 < 4) {
            goto LABEL_194;
          }
          uint64_t v20 = 0;
          int v29 = 1634956402;
          goto LABEL_155;
        }
        int v26 = 1819569763;
LABEL_47:
        if (v25 != v26) {
          goto LABEL_11;
        }
LABEL_156:
        if (a7 >= 4)
        {
          uint64_t v20 = 0;
          *(_DWORD *)__dst = 0;
          goto LABEL_158;
        }
LABEL_194:
        uint64_t v20 = 561211770;
        goto LABEL_11;
      }
      if (v25 == 1870098020) {
        goto LABEL_176;
      }
      if (v25 != 1885762592)
      {
        if (v25 != 1885762657) {
          goto LABEL_11;
        }
        goto LABEL_83;
      }
    }
    if (a7 >= 0x28)
    {
      uint64_t v20 = 0;
      *(void *)__dst = qword_140F0;
      *(_OWORD *)(__dst + 8) = xmmword_E6D8;
      *(_OWORD *)(__dst + 24) = unk_E6E8;
      int v31 = 40;
LABEL_159:
      *a8 = v31;
      goto LABEL_11;
    }
    goto LABEL_194;
  }
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v20 = 1852797029;
  int v21 = qword_14220[0];
  if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
  {
    LOWORD(v48) = 0;
    int v22 = "no address";
    goto LABEL_10;
  }
LABEL_13:
  int v23 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    if (a8) {
      int v24 = *a8;
    }
    else {
      int v24 = 0;
    }
    LODWORD(v48) = 67109376;
    DWORD1(v48) = v20;
    WORD4(v48) = 1024;
    *(_DWORD *)((char *)&v48 + 10) = v24;
    _os_signpost_emit_with_name_impl(&dword_0, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GetPropertyData", "result %{waipc:4cc}u, dataSize %u", (uint8_t *)&v48, 0xEu);
  }
  return v20;
}

uint64_t sub_9DAC(_UNKNOWN **a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t a8)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  int v13 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
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
  *(void *)&v56[12] = 0;
  *(_DWORD *)&v56[20] = 0;
  if (!qword_140C0[0]) {
    sub_DED0();
  }
  if (a1 != &off_14000)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    int v17 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "bad driver reference", buf, 2u);
    }
    goto LABEL_11;
  }
  if (!a4)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    int v22 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "no address", buf, 2u);
    }
    memset(&buf[4], 0, 20);
    int v18 = 1852797029;
    goto LABEL_12;
  }
  if ((a2 - 3) >= 2)
  {
    if (a2 != 2)
    {
      if (a2 != 1)
      {
LABEL_11:
        memset(&buf[4], 0, 20);
        int v18 = 560947818;
LABEL_12:
        unsigned int v55 = v18;
        *(_OWORD *)v56 = *(_OWORD *)buf;
        *(void *)&v56[16] = *(void *)&buf[16];
        goto LABEL_13;
      }
      *(_DWORD *)&v56[20] = 0;
      int v21 = 2003332927;
LABEL_90:
      unsigned int v55 = v21;
      *(void *)&v56[4] = 0;
      *(void *)&v56[12] = 0;
      goto LABEL_15;
    }
    if (*a4 == 1853059700)
    {
      if (a7 >= 8)
      {
        if (a8)
        {
          if (qword_14218 != -1) {
            dispatch_once(&qword_14218, &stru_10470);
          }
          int v39 = qword_14230;
          if (os_signpost_enabled((os_log_t)qword_14230))
          {
            double v40 = *(double *)a8;
            *(_DWORD *)buf = 134217984;
            *(double *)&uint8_t buf[4] = v40;
            _os_signpost_emit_with_name_impl(&dword_0, v39, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetPropertyData", "NominalSampleRate %lf", buf, 0xCu);
          }
          if (*(double *)a8 == 32000.0)
          {
            sub_CC8C(32000.0);
            int v21 = 0;
            goto LABEL_89;
          }
          if (qword_14218 != -1) {
            dispatch_once(&qword_14218, &stru_10470);
          }
          size_t v46 = qword_14220[0];
          if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
          {
            double v47 = *(double *)a8;
            *(_DWORD *)buf = 134217984;
            *(double *)&uint8_t buf[4] = v47;
            _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "unsupported sample rate %lf", buf, 0xCu);
          }
        }
        int v21 = 1852797029;
        goto LABEL_89;
      }
      int v21 = 561211770;
    }
    else
    {
      int v21 = 2003332927;
    }
LABEL_89:
    *(_DWORD *)&v56[20] = 0;
    goto LABEL_90;
  }
  int v23 = *a4;
  if (*a4 != 1885762592 && v23 != 1936092532)
  {
    if (v23 != 1935762292)
    {
      a8 = 0;
      uint64_t v28 = 0;
      int v29 = 2003332927;
      goto LABEL_118;
    }
    if (a7 >= 4)
    {
      if (a8)
      {
        if (qword_14218 != -1) {
          dispatch_once(&qword_14218, &stru_10470);
        }
        int v24 = qword_14230;
        if (os_signpost_enabled((os_log_t)qword_14230))
        {
          BOOL v25 = *(_DWORD *)a8 != 0;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v25;
          _os_signpost_emit_with_name_impl(&dword_0, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetPropertyData", "IsActive %{BOOL}d", buf, 8u);
        }
        int v26 = *(_DWORD *)a8 != 0;
        if (a2 == 3) {
          uint64_t v27 = 64;
        }
        else {
          uint64_t v27 = 65;
        }
        os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
        if (*((unsigned __int8 *)qword_140C0 + v27) == v26)
        {
          a8 = 0;
          uint64_t v54 = 0;
        }
        else
        {
          *((unsigned char *)qword_140C0 + v27) = v26;
          uint64_t v54 = 0x676C6F6273616374;
          a8 = 1;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_140C8);
        int v29 = 0;
        uint64_t v28 = v54;
        goto LABEL_118;
      }
      goto LABEL_77;
    }
    goto LABEL_48;
  }
  if (a7 >= 0x28)
  {
    if (a8)
    {
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      long long v30 = qword_14230;
      if (os_signpost_enabled((os_log_t)qword_14230))
      {
        double v31 = *(double *)a8;
        int v32 = *(_DWORD *)(a8 + 8);
        int v33 = *(_DWORD *)(a8 + 12);
        int v34 = *(_DWORD *)(a8 + 16);
        int v35 = *(_DWORD *)(a8 + 20);
        int v36 = *(_DWORD *)(a8 + 24);
        int v37 = *(_DWORD *)(a8 + 28);
        int v38 = *(_DWORD *)(a8 + 32);
        *(_DWORD *)buf = 134219776;
        *(double *)&uint8_t buf[4] = v31;
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = v32;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v33;
        *(_WORD *)&buf[24] = 1024;
        int v58 = v34;
        __int16 v59 = 1024;
        int v60 = v35;
        __int16 v61 = 1024;
        int v62 = v36;
        __int16 v63 = 1024;
        int v64 = v37;
        __int16 v65 = 1024;
        int v66 = v38;
        _os_signpost_emit_with_name_impl(&dword_0, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetPropertyData", "sampleRate %lf, formatID %{waipc:4cc}u, formatFlags 0x%08x, bytesPerPacket %u, framesPerPacket %u, bytesPerFrame %u, channelsPerFrame %u, bitsPerChannel %u", buf, 0x36u);
      }
      if (*(double *)a8 == 32000.0)
      {
        if (*(_DWORD *)(a8 + 8) == 1819304813)
        {
          if (*(_DWORD *)(a8 + 12) == 12)
          {
            if (*(_DWORD *)(a8 + 16) == 2)
            {
              if (*(_DWORD *)(a8 + 20) == 1)
              {
                if (*(_DWORD *)(a8 + 24) == 2)
                {
                  if (*(_DWORD *)(a8 + 28) == 1)
                  {
                    if (*(_DWORD *)(a8 + 32) == 16)
                    {
                      sub_CC8C(32000.0);
                      a8 = 0;
                      int v29 = 0;
                      uint64_t v28 = 0;
                      goto LABEL_118;
                    }
                    if (qword_14218 != -1) {
                      dispatch_once(&qword_14218, &stru_10470);
                    }
                    int v43 = qword_14220[0];
                    if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
                    {
LABEL_117:
                      a8 = 0;
                      uint64_t v28 = 0;
                      int v29 = 560226676;
                      goto LABEL_118;
                    }
                    int v53 = *(_DWORD *)(a8 + 32);
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)&uint8_t buf[4] = v53;
                    int v45 = "unsupported bits per channel %u";
                  }
                  else
                  {
                    if (qword_14218 != -1) {
                      dispatch_once(&qword_14218, &stru_10470);
                    }
                    int v43 = qword_14220[0];
                    if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
                      goto LABEL_117;
                    }
                    int v52 = *(_DWORD *)(a8 + 28);
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)&uint8_t buf[4] = v52;
                    int v45 = "unsupported channels per frame %u";
                  }
                }
                else
                {
                  if (qword_14218 != -1) {
                    dispatch_once(&qword_14218, &stru_10470);
                  }
                  int v43 = qword_14220[0];
                  if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
                    goto LABEL_117;
                  }
                  int v51 = *(_DWORD *)(a8 + 24);
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&uint8_t buf[4] = v51;
                  int v45 = "unsupported bytes per frame %u";
                }
              }
              else
              {
                if (qword_14218 != -1) {
                  dispatch_once(&qword_14218, &stru_10470);
                }
                int v43 = qword_14220[0];
                if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
                  goto LABEL_117;
                }
                int v50 = *(_DWORD *)(a8 + 20);
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v50;
                int v45 = "unsupported frames per packet %u";
              }
            }
            else
            {
              if (qword_14218 != -1) {
                dispatch_once(&qword_14218, &stru_10470);
              }
              int v43 = qword_14220[0];
              if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
                goto LABEL_117;
              }
              int v49 = *(_DWORD *)(a8 + 16);
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v49;
              int v45 = "unsupported bytes per packet %u";
            }
          }
          else
          {
            if (qword_14218 != -1) {
              dispatch_once(&qword_14218, &stru_10470);
            }
            int v43 = qword_14220[0];
            if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
              goto LABEL_117;
            }
            int v48 = *(_DWORD *)(a8 + 12);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v48;
            int v45 = "unsupported format flags 0x%08x";
          }
        }
        else
        {
          if (qword_14218 != -1) {
            dispatch_once(&qword_14218, &stru_10470);
          }
          int v43 = qword_14220[0];
          if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
            goto LABEL_117;
          }
          int v44 = *(_DWORD *)(a8 + 8);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v44;
          int v45 = "unsupported format ID %{waipc:4cc}u";
        }
        _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, v45, buf, 8u);
        goto LABEL_117;
      }
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      unsigned int v41 = qword_14220[0];
      if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
      {
        double v42 = *(double *)a8;
        *(_DWORD *)buf = 134217984;
        *(double *)&uint8_t buf[4] = v42;
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "unsupported sample rate %lf", buf, 0xCu);
      }
      a8 = 0;
    }
LABEL_77:
    uint64_t v28 = 0;
    int v29 = 1852797029;
    goto LABEL_118;
  }
LABEL_48:
  a8 = 0;
  uint64_t v28 = 0;
  int v29 = 561211770;
LABEL_118:
  unsigned int v55 = v29;
  *(void *)&v56[4] = a8;
  *(void *)&v56[12] = v28;
  *(_DWORD *)&v56[20] = 0;
LABEL_13:
  if (*(void *)&v56[4]) {
    (*(void (**)(uint64_t, uint64_t, void, unsigned char *))qword_140C0[0])(qword_140C0[0], a2, *(void *)&v56[4], &v56[12]);
  }
LABEL_15:
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  int v19 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v55;
    *(_WORD *)&buf[8] = 2048;
    *(void *)&buf[10] = *(void *)&v56[4];
    _os_signpost_emit_with_name_impl(&dword_0, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetPropertyData", "result %{waipc:4cc}u, changed %zu", buf, 0x12u);
  }
  return v55;
}

uint64_t sub_A880(_UNKNOWN **a1, int a2)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v4 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "StartIO", "", buf, 2u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
  if (a1 == &off_14000)
  {
    if (a2 == 2)
    {
      if (!dword_140EC)
      {
        unsigned __int16 v10 = llround(*(double *)&qword_140F0 * 0.02);
        *(void *)buf = xmmword_140D0;
        uint64_t v13 = qword_140F0;
        unsigned int v14 = v10 * llround(15.0);
        unsigned int v15 = vcvtpd_u64_f64(*(double *)&qword_140F0 * 0.0001);
        long long v16 = xmmword_E6B0;
        uint64_t v17 = 0x3FE0000000000000;
        unsigned __int16 v18 = v10;
        __int16 v19 = 2;
        uint64_t v20 = 0x400000004;
        int v21 = 2 * v10;
        unsigned int v22 = vcvtpd_u64_f64(*(double *)&qword_140F0 * 0.001) + 4 * v10;
        int64x2_t v23 = vdupq_n_s64(0x3F747AE147AE147BuLL);
        uint64_t v24 = 0x3F747AE147AE147BLL;
        BOOL v25 = qword_140E0 != 0;
        sub_3AAC();
      }
      if (dword_140EC != -1)
      {
        ++dword_140EC;
        if ((sub_542C(qword_14110, 0x32u) & 1) == 0)
        {
          if (qword_14218 != -1) {
            dispatch_once(&qword_14218, &stru_10470);
          }
          int v11 = qword_14220[0];
          uint64_t v5 = 0;
          if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_24;
          }
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "IO started but baseband audio seems inactive", buf, 2u);
        }
        uint64_t v5 = 0;
LABEL_22:
        if (qword_14218 != -1) {
          dispatch_once(&qword_14218, &stru_10470);
        }
        goto LABEL_24;
      }
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      uint64_t v5 = 1852797029;
      uint64_t v6 = qword_14220[0];
      if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        CFDictionaryRef v7 = "out of references";
        goto LABEL_21;
      }
    }
    else
    {
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      uint64_t v5 = 560947818;
      uint64_t v6 = qword_14220[0];
      if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        CFDictionaryRef v7 = "bad device ID";
        goto LABEL_21;
      }
    }
  }
  else
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      CFDictionaryRef v7 = "bad driver reference";
LABEL_21:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, v7, buf, 2u);
      goto LABEL_22;
    }
  }
LABEL_24:
  int v8 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "StartIO", "result %{waipc:4cc}u", buf, 8u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_140C8);
  return v5;
}

void sub_AE30(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    sub_40D4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_AE7C(_UNKNOWN **a1, int a2)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v4 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    LOWORD(v14[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "StopIO", "", (uint8_t *)v14, 2u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
  if (a1 == &off_14000)
  {
    if (a2 == 2)
    {
      if (dword_140EC)
      {
        if (dword_140EC == 1)
        {
          dword_140EC = 0;
          if (qword_140E0) {
            uint64_t v8 = sub_5B58(qword_14110);
          }
          else {
            uint64_t v8 = 0;
          }
          int v11 = (const void *)qword_140F8;
          qword_140F8 = v8;
          if (v11) {
            CFRelease(v11);
          }
          os_unfair_lock_lock((os_unfair_lock_t)&dword_14108);
          int v12 = (std::__shared_weak_count *)qword_14118;
          qword_14110 = 0;
          qword_14118 = 0;
          if (v12) {
            sub_D484(v12);
          }
          os_unfair_lock_unlock((os_unfair_lock_t)&dword_14108);
          if (qword_14218 != -1) {
            dispatch_once(&qword_14218, &stru_10470);
          }
          uint64_t v13 = qword_14228;
          if (!os_signpost_enabled((os_log_t)qword_14228))
          {
            uint64_t v5 = 0;
            goto LABEL_22;
          }
          LOWORD(v14[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_0, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOSession", "", (uint8_t *)v14, 2u);
          uint64_t v5 = 0;
        }
        else
        {
          uint64_t v5 = 0;
          --dword_140EC;
        }
      }
      else
      {
        uint64_t v5 = 1852797029;
      }
      goto LABEL_20;
    }
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v14[0]) = 0;
      CFDictionaryRef v7 = "bad device ID";
      goto LABEL_19;
    }
  }
  else
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v5 = 560947818;
    uint64_t v6 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v14[0]) = 0;
      CFDictionaryRef v7 = "bad driver reference";
LABEL_19:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)v14, 2u);
LABEL_20:
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
    }
  }
LABEL_22:
  int v9 = qword_14230;
  if (os_signpost_enabled((os_log_t)qword_14230))
  {
    v14[0] = 67109120;
    v14[1] = v5;
    _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "StopIO", "result %{waipc:4cc}u", (uint8_t *)v14, 8u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_140C8);
  return v5;
}

void sub_B1F0(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    sub_40D4(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_B218(_UNKNOWN **a1, int a2, uint64_t a3, unint64_t *a4, void *a5, void *a6)
{
  os_unfair_lock_lock((os_unfair_lock_t)&dword_14108);
  if (byte_14122)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    int v11 = qword_14230;
    if (os_signpost_enabled((os_log_t)qword_14230))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GetZeroTimeStamp", "", (uint8_t *)&v21, 2u);
    }
  }
  if (a1 != &off_14000)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v12 = 560947818;
    uint64_t v13 = qword_14220[0];
    if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    LOWORD(v21) = 0;
    unsigned int v14 = "bad driver reference";
LABEL_18:
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v21, 2u);
LABEL_19:
    unint64_t v18 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    goto LABEL_20;
  }
  if (a2 != 2)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v12 = 560947818;
    uint64_t v13 = qword_14220[0];
    if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    LOWORD(v21) = 0;
    unsigned int v14 = "bad device ID";
    goto LABEL_18;
  }
  if (!qword_14110) {
    __assert_rtn("BV_GetZeroTimeStamp", "PlugIn.cpp", 1871, "gBV_State.io.audioSession");
  }
  sub_56D4(qword_14110, &v21);
  uint64_t v12 = 0;
  unint64_t v15 = v21;
  uint64_t v16 = *(void *)v22;
  uint64_t v17 = *(void *)&v22[8];
  *a4 = v21;
  *a5 = v16;
  *a6 = v17;
  unint64_t v18 = v15;
LABEL_20:
  if (byte_14122)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    __int16 v19 = qword_14230;
    if (os_signpost_enabled((os_log_t)qword_14230))
    {
      unint64_t v21 = __PAIR64__(v12, 67109888);
      *(_WORD *)unsigned int v22 = 2048;
      *(void *)&v22[2] = v18;
      *(_WORD *)&v22[10] = 2048;
      *(void *)&v22[12] = v16;
      __int16 v23 = 2048;
      uint64_t v24 = v17;
      _os_signpost_emit_with_name_impl(&dword_0, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GetZeroTimeStamp", "result %{waipc:4cc}u, sampleTime %lf, hostTime %llu, seed %llu", (uint8_t *)&v21, 0x26u);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_14108);
  return v12;
}

void sub_B518(_Unwind_Exception *a1)
{
}

uint64_t sub_B534(_UNKNOWN **a1, int a2, uint64_t a3, int a4, unsigned char *a5, unsigned char *a6)
{
  os_unfair_lock_lock((os_unfair_lock_t)&dword_14108);
  if (byte_14122)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    int v11 = qword_14230;
    if (os_signpost_enabled((os_log_t)qword_14230))
    {
      int v19 = 67109120;
      int v20 = a4;
      _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WillDoIOOperation", "op %{waipc:4cc}u", (uint8_t *)&v19, 8u);
    }
  }
  if (a1 != &off_14000)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v12 = 560947818;
    uint64_t v13 = qword_14220[0];
    if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    LOWORD(v19) = 0;
    unsigned int v14 = "bad driver reference";
LABEL_23:
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v19, 2u);
LABEL_24:
    BOOL v15 = 0;
    int v16 = 0;
    goto LABEL_25;
  }
  if (a2 != 2)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v12 = 560947818;
    uint64_t v13 = qword_14220[0];
    if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    LOWORD(v19) = 0;
    unsigned int v14 = "bad device ID";
    goto LABEL_23;
  }
  BOOL v15 = 1;
  if (a4 != 1668899692 && a4 != 1919246692) {
    BOOL v15 = a4 == 1919513701;
  }
  if (a5) {
    *a5 = v15;
  }
  int v16 = 1;
  uint64_t v12 = 0;
  if (a6) {
    *a6 = 1;
  }
LABEL_25:
  if (byte_14122)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v17 = qword_14230;
    if (os_signpost_enabled((os_log_t)qword_14230))
    {
      int v19 = 67109632;
      int v20 = v12;
      __int16 v21 = 1024;
      BOOL v22 = v15;
      __int16 v23 = 1024;
      int v24 = v16;
      _os_signpost_emit_with_name_impl(&dword_0, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WillDoIOOperation", "result %{waipc:4cc}u, willDo %{BOOL}d, willDoInPlace %{BOOL}d", (uint8_t *)&v19, 0x14u);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_14108);
  return v12;
}

uint64_t sub_B834(_UNKNOWN **a1, int a2, uint64_t a3, int a4, int a5, double *a6)
{
  os_unfair_lock_lock((os_unfair_lock_t)&dword_14108);
  if (byte_14122)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    int v11 = qword_14230;
    if (os_signpost_enabled((os_log_t)qword_14230))
    {
      int v22 = 67109120;
      LODWORD(v23) = a4;
      _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BeginIOOperation", "op %{waipc:4cc}u", (uint8_t *)&v22, 8u);
    }
  }
  if (a1 != &off_14000)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v12 = 560947818;
    uint64_t v13 = qword_14220[0];
    if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    LOWORD(v22) = 0;
    unsigned int v14 = "bad driver reference";
LABEL_23:
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v22, 2u);
LABEL_24:
    int v15 = byte_14122;
    goto LABEL_25;
  }
  if (a2 != 2)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v12 = 560947818;
    uint64_t v13 = qword_14220[0];
    if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    LOWORD(v22) = 0;
    unsigned int v14 = "bad device ID";
    goto LABEL_23;
  }
  uint64_t v12 = 0;
  int v15 = byte_14122;
  if (a4 == 1668899692 && byte_14122)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    int v16 = qword_14230;
    if (os_signpost_enabled((os_log_t)qword_14230))
    {
      unint64_t v17 = (unint64_t)a6[2];
      unint64_t v18 = (unint64_t)a6[10];
      unint64_t v19 = (unint64_t)a6[18];
      int v22 = 134218752;
      unint64_t v23 = v17;
      __int16 v24 = 2048;
      unint64_t v25 = v18;
      __int16 v26 = 2048;
      unint64_t v27 = v19;
      __int16 v28 = 1024;
      int v29 = a5;
      _os_signpost_emit_with_name_impl(&dword_0, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BeginIOOperation_CycleInfo", "currentTime %llu, inputTime %llu, outputTime %llu, ioBufferFrameSize %u", (uint8_t *)&v22, 0x26u);
    }
    uint64_t v12 = 0;
    goto LABEL_24;
  }
LABEL_25:
  if (v15)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    int v20 = qword_14230;
    if (os_signpost_enabled((os_log_t)qword_14230))
    {
      int v22 = 67109120;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl(&dword_0, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "BeginIOOperation", "result %{waipc:4cc}u", (uint8_t *)&v22, 8u);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_14108);
  return v12;
}

uint64_t sub_BB9C(_UNKNOWN **a1, int a2, int a3, uint64_t a4, int a5, int a6, double *a7, void *a8)
{
  os_unfair_lock_lock((os_unfair_lock_t)&dword_14108);
  if (byte_14122)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    int v15 = qword_14230;
    if (os_signpost_enabled((os_log_t)qword_14230))
    {
      unint64_t v16 = (unint64_t)a7[2];
      int v22 = 67109888;
      int v23 = a5;
      __int16 v24 = 1024;
      int v25 = a3;
      __int16 v26 = 2048;
      unint64_t v27 = v16;
      __int16 v28 = 1024;
      int v29 = a6;
      _os_signpost_emit_with_name_impl(&dword_0, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DoIOOperation", "op %{waipc:4cc}u, stream %u, currentTime %llu, ioBufferFrameSize %u", (uint8_t *)&v22, 0x1Eu);
    }
  }
  if (a1 == &off_14000)
  {
    if (a2 == 2)
    {
      if (a5 == 1919513701)
      {
        if (!qword_14110) {
          __assert_rtn("BV_DoIOOperation", "PlugIn.cpp", 2097, "gBV_State.io.audioSession");
        }
        sub_59F0(qword_14110, a8, 2 * a6, dword_14148, (double)((unint64_t)a7[18] - dword_14148));
      }
      else
      {
        if (a5 != 1919246692)
        {
          uint64_t v17 = 1970171760;
          goto LABEL_25;
        }
        if (!qword_14110) {
          __assert_rtn("BV_DoIOOperation", "PlugIn.cpp", 2039, "gBV_State.io.audioSession");
        }
        sub_5958(qword_14110, a8, 2 * a6, (double)(dword_14138 + (unint64_t)a7[10]));
      }
      uint64_t v17 = 0;
      goto LABEL_25;
    }
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v17 = 560947818;
    unint64_t v18 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      unint64_t v19 = "bad device ID";
      goto LABEL_20;
    }
  }
  else
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v17 = 560947818;
    unint64_t v18 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      unint64_t v19 = "bad driver reference";
LABEL_20:
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v22, 2u);
    }
  }
LABEL_25:
  if (byte_14122)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    int v20 = qword_14230;
    if (os_signpost_enabled((os_log_t)qword_14230))
    {
      int v22 = 67109120;
      int v23 = v17;
      _os_signpost_emit_with_name_impl(&dword_0, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DoIOOperation", "result %{waipc:4cc}u", (uint8_t *)&v22, 8u);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_14108);
  return v17;
}

void sub_BF40(_Unwind_Exception *a1)
{
}

uint64_t sub_BF5C(_UNKNOWN **a1, int a2, uint64_t a3, int a4)
{
  os_unfair_lock_lock((os_unfair_lock_t)&dword_14108);
  if (byte_14122)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    CFDictionaryRef v7 = qword_14230;
    if (os_signpost_enabled((os_log_t)qword_14230))
    {
      int v13 = 67109120;
      int v14 = a4;
      _os_signpost_emit_with_name_impl(&dword_0, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EndIOOperation", "op %{waipc:4cc}u", (uint8_t *)&v13, 8u);
    }
  }
  if (a1 == &off_14000)
  {
    if (a2 == 2)
    {
      uint64_t v8 = 0;
      goto LABEL_18;
    }
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v8 = 560947818;
    int v9 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      unsigned __int16 v10 = "bad device ID";
      goto LABEL_17;
    }
  }
  else
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    uint64_t v8 = 560947818;
    int v9 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      unsigned __int16 v10 = "bad driver reference";
LABEL_17:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, 2u);
    }
  }
LABEL_18:
  if (byte_14122)
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    int v11 = qword_14230;
    if (os_signpost_enabled((os_log_t)qword_14230))
    {
      int v13 = 67109120;
      int v14 = v8;
      _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EndIOOperation", "result %{waipc:4cc}u", (uint8_t *)&v13, 8u);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_14108);
  return v8;
}

const void **sub_C1E4(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

os_state_data_s *__cdecl sub_C218(id a1, os_state_hints_s *a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
  sub_C6CC((uint64_t)&xmmword_14150, (uint64_t)&qword_141F0);
  sub_C7B4(buf, @"Refcount", &dword_140E8);
  sub_C7B4(&v18, @"IO Running", &dword_140EC);
  sub_C874(v19, @"Sample Rate", &qword_140F0);
  if ((_BYTE)word_14100) {
    CFBooleanRef v2 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v2 = kCFBooleanFalse;
  }
  v19[2] = @"Input Active";
  v19[3] = v2;
  if (HIBYTE(word_14100)) {
    CFBooleanRef v3 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v3 = kCFBooleanFalse;
  }
  v19[4] = @"Output Active";
  v19[5] = v3;
  if (qword_14110)
  {
    uint64_t v4 = sub_5B58(qword_14110);
  }
  else
  {
    uint64_t v4 = qword_140F8;
    if (qword_140F8) {
      CFRetain((CFTypeRef)qword_140F8);
    }
  }
  v19[6] = @"IO Session";
  v19[7] = v4;
  sub_C7B4(&v20, @"Alignment Buffer Frame Size", (int *)&qword_141F0);
  sub_C7B4(&v21, @"Max Alignment Adjustment", (int *)&qword_141F0 + 1);
  sub_C934(&v22, @"Input Alignment Anchor", &qword_141F8);
  sub_C7B4(&v23, @"Input Readahead", &dword_14200);
  sub_C934(&v24, @"Output Alignment Anchor", &qword_14208);
  sub_C7B4(v25, @"Output Writeahead", &dword_14210);
  if (qword_14240 != -1) {
    dispatch_once(&qword_14240, &stru_10510);
  }
  if (byte_14248) {
    CFBooleanRef v5 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v5 = kCFBooleanFalse;
  }
  v25[2] = @"Published";
  v25[3] = v5;
  sub_5EBC((uint64_t)buf, &cf);
  for (uint64_t i = 200; i != -8; i -= 16)
  {
    CFDictionaryRef v7 = *(const void **)&buf[i];
    if (v7) {
      CFRelease(v7);
    }
  }
  uint64_t v8 = (waipc::util *)cf;
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_140C8);
  if (v8)
  {
    CFTypeRef cf = 0;
    StateData = (os_state_data_s *)waipc::util::createStateData(v8, "BasebandVoice", (const char *)&cf, v9);
    CFTypeRef v11 = cf;
    if (!StateData)
    {
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      uint64_t v12 = qword_14220[0];
      if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFTypeRef v17 = v11;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "failed to serialze state %@", buf, 0xCu);
      }
    }
    if (v11) {
      CFRelease(v11);
    }
    CFRelease(v8);
  }
  else
  {
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    int v13 = qword_14220[0];
    if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "failed to dump state", buf, 2u);
    }
    return 0;
  }
  return StateData;
}

void sub_C5DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_40D4(exception_object);
}

const void **sub_C698(const void **a1)
{
  CFBooleanRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

BOOL sub_C6CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 4));
  unint64_t v5 = atomic_exchange((atomic_ullong *volatile)(a1 + 128), 0);
  if (v5)
  {
    if (a2)
    {
      long long v6 = *(_OWORD *)v5;
      long long v7 = *(_OWORD *)(v5 + 16);
      *(_DWORD *)(a2 + 32) = *(_DWORD *)(v5 + 32);
      *(_OWORD *)a2 = v6;
      *(_OWORD *)(a2 + 16) = v7;
    }
    sub_C758(a1, v5);
  }
  os_unfair_lock_unlock(v4);
  return v5 != 0;
}

void sub_C744(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_C758(uint64_t result, unint64_t a2)
{
  if (!a2) {
    sub_DEFC();
  }
  uint64_t v2 = a2 - result - 8;
  if (v2 < -39 || (unint64_t v3 = 0xCCCCCCCCCCCCCCCDLL * (v2 >> 3), v3 >= 3)) {
    sub_DF28();
  }
  if (atomic_exchange((atomic_ullong *volatile)(result + 8 * v3 + 136), a2)) {
    sub_DF54();
  }
  return result;
}

void *sub_C7B4(void *a1, uint64_t a2, int *a3)
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

void sub_C848(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_C874(void *a1, uint64_t a2, uint64_t *a3)
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

void sub_C908(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_C934(void *a1, uint64_t a2, uint64_t *a3)
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

void sub_C9C8(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_C9F4(id a1)
{
  if (capabilities::pci::supportsPCIAudio((capabilities::pci *)a1))
  {
    CFMutableDictionaryRef v1 = IOServiceNameMatching("Baseband Voice");
    sub_CBD4(&cf, v1);
    CFRetain(cf);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, (CFDictionaryRef)cf);
    io_service_t v3 = MatchingService;
    if (MatchingService)
    {
      IOObjectRelease(MatchingService);
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      CFNumberRef v4 = qword_14220[0];
      if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      __int16 v9 = 0;
      unint64_t v5 = "BVCanPublishBasebandVoice: NO (I2S device present)";
      long long v6 = (uint8_t *)&v9;
    }
    else
    {
      if (qword_14218 != -1) {
        dispatch_once(&qword_14218, &stru_10470);
      }
      CFNumberRef v4 = qword_14220[0];
      if (!os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      __int16 v8 = 0;
      unint64_t v5 = "BVCanPublishBasebandVoice: YES";
      long long v6 = (uint8_t *)&v8;
    }
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
LABEL_17:
    byte_14248 = v3 == 0;
    if (cf) {
      CFRelease(cf);
    }
    return;
  }
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  long long v7 = qword_14220[0];
  if (os_log_type_enabled((os_log_t)qword_14220[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "BVCanPublishBasebandVoice: NO (not supported)", buf, 2u);
  }
  byte_14248 = 0;
}

void sub_CBBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_5FD8((const void **)va);
  _Unwind_Resume(a1);
}

void *sub_CBD4(void *a1, CFTypeRef cf)
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

void sub_CC5C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

void sub_CC8C(double a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
  uint64_t v2 = qword_140F0;
  if (*(double *)&qword_140F0 != a1)
  {
    uint64_t v13 = 0;
    int v14 = &v13;
    uint64_t v15 = 0x2000000000;
    uint64_t v16 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 0x40000000;
    _DWORD v12[2] = sub_CFE4;
    v12[3] = &unk_10538;
    *(double *)&v12[5] = a1;
    v12[4] = &v13;
    CFTypeID v3 = _Block_copy(v12);
    v14[3] = (uint64_t)v3;
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    CFNumberRef v4 = qword_14228;
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)qword_14228, (const void *)v14[3]);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v2;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(double *)&buf[14] = a1;
        _os_signpost_emit_with_name_impl(&dword_0, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SampleRateChange", "oldRate %lf, newRate %lf", buf, 0x16u);
      }
    }
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    if (os_signpost_enabled((os_log_t)qword_14238))
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 0x40000000;
      *(void *)&uint8_t buf[16] = sub_D108;
      uint64_t v23 = &unk_10560;
      uint64_t v24 = v3;
      long long v7 = _Block_copy(buf);
    }
    else
    {
      long long v7 = _Block_copy(v3);
    }
    __int16 v8 = v7;
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    __int16 v9 = qword_14238;
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer((os_log_t)qword_14238, v8);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)block = 0;
        _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "DeviceConfigurationChange", "async", block, 2u);
      }
    }
    *(void *)block = _NSConcreteStackBlock;
    uint64_t v18 = 0x40000000;
    unint64_t v19 = sub_D118;
    uint64_t v20 = &unk_10580;
    uint64_t v21 = v8;
    dispatch_async(*((dispatch_queue_t *)&xmmword_140D0 + 1), block);
    _Block_release(v3);
    _Block_object_dispose(&v13, 8);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_140C8);
}

void sub_CFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_140C8);
  _Unwind_Resume(a1);
}

void sub_CFE4(uint64_t a1, int a2)
{
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&dword_140C8);
    qword_140F0 = *(void *)(a1 + 40);
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_140C8);
  }
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  CFNumberRef v4 = qword_14228;
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)qword_14228, *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
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

uint64_t sub_D108(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_D118(uint64_t a1)
{
  if (qword_14218 != -1) {
    dispatch_once(&qword_14218, &stru_10470);
  }
  uint64_t v2 = qword_14238;
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer((os_log_t)qword_14238, *(const void **)(a1 + 32));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      LOWORD(v14[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v2, OS_SIGNPOST_EVENT, v4, "DeviceConfigurationChange", "request", (uint8_t *)v14, 2u);
    }
  }
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t, void, void))(qword_140C0[0] + 32))(qword_140C0[0], 2, 0, *(void *)(a1 + 32));
  if (v5)
  {
    int v6 = v5;
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    long long v7 = qword_14238;
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer((os_log_t)qword_14238, *(const void **)(a1 + 32));
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
    os_signpost_id_t v10 = *(void (***)(void, void))(a1 + 32);
    v10[2](v10, 0);
    if (qword_14218 != -1) {
      dispatch_once(&qword_14218, &stru_10470);
    }
    os_signpost_id_t v11 = qword_14238;
    os_signpost_id_t v12 = os_signpost_id_make_with_pointer((os_log_t)qword_14238, *(const void **)(a1 + 32));
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

void sub_D360(os_unfair_lock_t lock, long long *a2)
{
  if (lock) {
    os_unfair_lock_lock(lock);
  }
  unint64_t v4 = sub_D3FC((uint64_t)lock);
  long long v5 = *a2;
  long long v6 = a2[1];
  *(void *)(v4 + 32) = *((void *)a2 + 4);
  *(_OWORD *)unint64_t v4 = v5;
  *(_OWORD *)(v4 + 16) = v6;
  unint64_t v7 = atomic_exchange((atomic_ullong *volatile)&lock[32], v4);
  if (v7) {
    sub_C758((uint64_t)lock, v7);
  }
  if (lock)
  {
    os_unfair_lock_unlock(lock);
  }
}

void sub_D3E0(_Unwind_Exception *exception_object)
{
  if (v1) {
    os_unfair_lock_unlock(v1);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_D3FC(uint64_t a1)
{
  unint64_t v1 = 0;
  uint64_t v2 = a1 + 136;
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
    sub_DF80();
  }
  return result;
}

const void **sub_D438(const void **a1)
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

void sub_D484(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_D4F8(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_D57C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_D734((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_D594(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    BOOL v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      long long v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        BOOL v4 = (std::__shared_weak_count *)a2[1];
      }
      *a2 = a3;
      a2[1] = v5;
      if (v4) {
        std::__shared_weak_count::__release_weak(v4);
      }
      if (v5)
      {
        sub_D484(v5);
      }
    }
  }
}

void sub_D620(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_D658(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    sub_3F70(result);
    operator delete();
  }
  return result;
}

uint64_t sub_D6A0(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL sub_D6E4(uint64_t a1, uint64_t a2)
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

uint64_t sub_D734(uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    sub_3F70(result);
    operator delete();
  }
  return result;
}

waipc::util::GroupErrorTimer *sub_D784(waipc::util::GroupErrorTimer **a1, waipc::util::GroupErrorTimer *a2)
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

uint64_t sub_D7D4(uint64_t a1)
{
  unint64_t v2 = atomic_exchange((atomic_ullong *volatile)(a1 + 368), 0);
  if (v2) {
    sub_D810(a1, v2);
  }
  return a1;
}

uint64_t sub_D810(uint64_t result, unint64_t a2)
{
  if (!a2) {
    sub_DEFC();
  }
  uint64_t v2 = a2 - result - 8;
  if (v2 < -119 || (unint64_t v3 = 0xEEEEEEEEEEEEEEEFLL * (v2 >> 3), v3 >= 3)) {
    sub_DF28();
  }
  if (atomic_exchange((atomic_ullong *volatile)(result + 8 * v3 + 376), a2)) {
    sub_DF54();
  }
  return result;
}

waipc::PCIeAudioLink *sub_D86C(waipc::PCIeAudioLink **a1, waipc::PCIeAudioLink *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    waipc::PCIeAudioLink::~PCIeAudioLink(result);
    operator delete();
  }
  return result;
}

waipc::util::NonblockingEventSource *sub_D8BC(waipc::util::NonblockingEventSource **a1, waipc::util::NonblockingEventSource *a2)
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

void *sub_D90C(void *a1, void *a2)
{
  unint64_t v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0;
LABEL_5:
    sub_D950();
  }
  BOOL v4 = std::__shared_weak_count::lock(v3);
  a1[1] = v4;
  if (!v4) {
    goto LABEL_5;
  }
  return a1;
}

void sub_D950()
{
  exception = __cxa_allocate_exception(8uLL);
}

unint64_t sub_D99C(uint64_t a1)
{
  unint64_t v1 = 0;
  uint64_t v2 = a1 + 376;
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
    sub_DF80();
  }
  return result;
}

void *sub_D9D8@<X0>(void *a1@<X8>)
{
  uint64_t v2 = operator new(0x30uLL);
  unint64_t result = sub_DA3C(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_DA28(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_DA3C(void *a1)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_10628;
  waipc::MappableBuffer::MappableBuffer();
  return a1;
}

void sub_DA8C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_DAA0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10628;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_DAC0(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10628;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_DB14(uint64_t a1)
{
}

void *sub_DB20(void *a1, uint64_t a2, uint64_t *a3)
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

void sub_DBB4(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_DBE0(void *a1, uint64_t a2, uint64_t *a3)
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

void sub_DC74(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_DCA0(void *a1, uint64_t a2, uint64_t *a3)
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

void sub_DD34(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_DD60()
{
  uint64_t v0 = 0;
  qword_140C0[0] = 0;
  dword_140C8 = 0;
  xmmword_140D0 = 0u;
  *(_OWORD *)&qword_140E0 = 0u;
  qword_140F0 = 0x40DF400000000000;
  qword_140F8 = 0;
  word_14100 = 257;
  dword_14108 = 0;
  qword_14110 = 0;
  qword_14118 = 0;
  qword_14140 = 0;
  dword_14148 = 0;
  qword_14128 = 0;
  unk_14130 = 0;
  dword_14138 = 0;
  xmmword_141D0 = 0u;
  unk_141E0 = 0u;
  xmmword_141B0 = 0u;
  unk_141C0 = 0u;
  xmmword_14190 = 0u;
  unk_141A0 = 0u;
  xmmword_14170 = 0u;
  unk_14180 = 0u;
  uint64_t v1 = (char *)&xmmword_14150 + 8;
  xmmword_14150 = 0u;
  unk_14160 = 0u;
  do
  {
    qword_140C0[v0 + 35] = (uint64_t)v1;
    ++v0;
    v1 += 40;
  }
  while (v0 != 3);
  qword_14208 = 0;
  dword_14210 = 0;
  qword_141F0 = 0;
  unk_141F8 = 0;
  dword_14200 = 0;
}

void sub_DDF4()
{
}

void sub_DE20()
{
  __assert_rtn("BV_PerformDeviceConfigurationChange", "PlugIn.cpp", 513, "inChangeInfo != nullptr");
}

void sub_DE4C()
{
  __assert_rtn("BV_PerformDeviceConfigurationChange", "PlugIn.cpp", 512, "inChangeAction == 0");
}

void sub_DE78()
{
  __assert_rtn("BV_AbortDeviceConfigurationChange", "PlugIn.cpp", 537, "inChangeInfo != nullptr");
}

void sub_DEA4()
{
  __assert_rtn("BV_AbortDeviceConfigurationChange", "PlugIn.cpp", 536, "inChangeAction == 0");
}

void sub_DED0()
{
  __assert_rtn("BV_SetPropertyData", "PlugIn.cpp", 693, "gBV_State.host != nullptr");
}

void sub_DEFC()
{
}

void sub_DF28()
{
  __assert_rtn("putIdle", "Util.h", 426, "i >= 0 && i < kStashCount");
}

void sub_DF54()
{
}

void sub_DF80()
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

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
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

uint64_t BasebandVoice_getTimesyncOverride(void)
{
  return BasebandVoice_getTimesyncOverride();
}

uint64_t capabilities::pci::supportsPCIAudio(capabilities::pci *this)
{
  return capabilities::pci::supportsPCIAudio(this);
}

uint64_t waipc::PCIeAudioLink::getZeroTimestamp(waipc::PCIeAudioLink *this, unint64_t a2)
{
  return waipc::PCIeAudioLink::getZeroTimestamp(this, a2);
}

uint64_t waipc::PCIeAudioLink::computeBufferLength()
{
  return waipc::PCIeAudioLink::computeBufferLength();
}

uint64_t waipc::PCIeAudioLink::writeMix(waipc::PCIeAudioLink *this, unint64_t a2, const void *a3, unsigned int a4, unsigned int a5)
{
  return waipc::PCIeAudioLink::writeMix(this, a2, a3, a4, a5);
}

uint64_t waipc::PCIeAudioLink::readInput(waipc::PCIeAudioLink *this, unint64_t a2, void *a3, unsigned int a4)
{
  return waipc::PCIeAudioLink::readInput(this, a2, a3, a4);
}

uint64_t waipc::PCIeAudioLink::PCIeAudioLink()
{
  return waipc::PCIeAudioLink::PCIeAudioLink();
}

void waipc::PCIeAudioLink::~PCIeAudioLink(waipc::PCIeAudioLink *this)
{
}

uint64_t waipc::MappableBuffer::MappableBuffer()
{
  return waipc::MappableBuffer::MappableBuffer();
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

uint64_t waipc::timesync::BasebandService::triggerMeasurement(waipc::timesync::BasebandService *this)
{
  return waipc::timesync::BasebandService::triggerMeasurement(this);
}

uint64_t waipc::timesync::BasebandService::addTimesyncObserver()
{
  return waipc::timesync::BasebandService::addTimesyncObserver();
}

uint64_t waipc::timesync::BasebandService::addConnectionObserver()
{
  return waipc::timesync::BasebandService::addConnectionObserver();
}

uint64_t waipc::timesync::BasebandService::create()
{
  return waipc::timesync::BasebandService::create();
}

uint64_t waipc::timesync::BasebandService::mapBuffer()
{
  return waipc::timesync::BasebandService::mapBuffer();
}

uint64_t waipc::timesync::KalmanEstimator::fixed()
{
  return waipc::timesync::KalmanEstimator::fixed();
}

uint64_t waipc::PCIeAudioLink::isPeripheralActive(waipc::PCIeAudioLink *this)
{
  return waipc::PCIeAudioLink::isPeripheralActive(this);
}

uint64_t waipc::PCIeAudioLink::getDLAlignmentAnchor(waipc::PCIeAudioLink *this)
{
  return waipc::PCIeAudioLink::getDLAlignmentAnchor(this);
}

uint64_t waipc::PCIeAudioLink::getULAlignmentAnchor(waipc::PCIeAudioLink *this)
{
  return waipc::PCIeAudioLink::getULAlignmentAnchor(this);
}

uint64_t waipc::PCIeAudioLink::dumpState(waipc::PCIeAudioLink *this)
{
  return waipc::PCIeAudioLink::dumpState(this);
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

uint64_t waipc::timesync::KalmanEstimator::hostToDevice()
{
  return waipc::timesync::KalmanEstimator::hostToDevice();
}

uint64_t waipc::timesync::KalmanEstimator::deviceToHostVariance()
{
  return waipc::timesync::KalmanEstimator::deviceToHostVariance();
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
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

int usleep(useconds_t a1)
{
  return _usleep(a1);
}