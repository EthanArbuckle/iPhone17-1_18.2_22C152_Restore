id AppleTimeSyncAudioClockFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3;
  void *v4;
  id v5;
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleTimeSyncAudioClockFactory factory for AudioServerPlugin\n", buf, 2u);
  }
  v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x44u, 0x3Au, 0xBAu, 0xB8u, 0xE7u, 0xB3u, 0x49u, 0x1Au, 0xB9u, 0x85u, 0xBEu, 0xB9u, 0x18u, 0x70u, 0x30u, 0xDBu);
  if (!CFEqual(a2, v3)) {
    return 0;
  }
  v4 = +[ATSACCAPlugin sharedPlugin];
  v5 = [v4 driverRef];

  return v5;
}

void sub_3110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_31C0()
{
  _sharedPlugin = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_337C(uint64_t a1)
{
  [*(id *)(a1 + 32) setupIOKitMatching];
  v3 = +[TSClockManager sharedClockManager];
  [v3 addClient:*(void *)(a1 + 32)];
}

void sub_36A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_36D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_37A0;
  v6[3] = &unk_C3B0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void sub_37A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v6 = 136316418;
    id v7 = "strongSelf != nil";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    v13 = &unk_A2DD;
    __int16 v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/AppleTimeSyncAudioClock/ATSACCAPlugin.m";
    __int16 v16 = 1024;
    int v17 = 100;
LABEL_12:
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v6 = 136316418;
    id v7 = "[object isKindOfClass:[IOKRegistryEntry class]]";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    v13 = &unk_A2DD;
    __int16 v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/AppleTimeSyncAudioClock/ATSACCAPlugin.m";
    __int16 v16 = 1024;
    int v17 = 101;
    goto LABEL_12;
  }
  v4 = [*(id *)(a1 + 32) propertyForKey:@"ClockIdentifier"];
  if (!v4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v6 = 136316418;
    id v7 = "clockIdenfierObj != nil";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    v13 = &unk_A2DD;
    __int16 v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/AppleTimeSyncAudioClock/ATSACCAPlugin.m";
    __int16 v16 = 1024;
    int v17 = 104;
    goto LABEL_12;
  }
  id v5 = v4;
  objc_msgSend(WeakRetained, "addClockWithIdentifier:", objc_msgSend(v4, "unsignedLongLongValue"));

LABEL_5:
}

void sub_3A30(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3AF8;
  v6[3] = &unk_C3B0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void sub_3AF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v6 = 136316418;
    id v7 = "strongSelf != nil";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    v13 = &unk_A2DD;
    __int16 v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/AppleTimeSyncAudioClock/ATSACCAPlugin.m";
    __int16 v16 = 1024;
    int v17 = 123;
LABEL_12:
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v6 = 136316418;
    id v7 = "[object isKindOfClass:[IOKRegistryEntry class]]";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    v13 = &unk_A2DD;
    __int16 v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/AppleTimeSyncAudioClock/ATSACCAPlugin.m";
    __int16 v16 = 1024;
    int v17 = 124;
    goto LABEL_12;
  }
  v4 = [*(id *)(a1 + 32) propertyForKey:@"ClockIdentifier"];
  if (!v4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v6 = 136316418;
    id v7 = "clockIdenfierObj != nil";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    v13 = &unk_A2DD;
    __int16 v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/AppleTimeSyncAudioClock/ATSACCAPlugin.m";
    __int16 v16 = 1024;
    int v17 = 127;
    goto LABEL_12;
  }
  id v5 = v4;
  objc_msgSend(WeakRetained, "removeClockWithIdentifier:force:", objc_msgSend(v4, "unsignedLongLongValue"), 1);

LABEL_5:
}

void sub_3D8C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) primeNotification];
  [*(id *)(*(void *)(a1 + 32) + 40) primeNotification];
}

void sub_3E80(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ATSAC interruption cleanup", buf, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 56);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_401C;
  block[3] = &unk_C388;
  block[4] = v3;
  dispatch_sync(v4, block);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  __int16 v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  __int16 v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 64));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_42A8;
  v11[3] = &unk_C388;
  v11[4] = *(void *)(a1 + 32);
  +[TSClockManager notifyWhenClockManagerIsAvailable:v11];
}

void sub_401C(uint64_t a1)
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  int v17 = sub_4214;
  v18 = sub_4224;
  id v19 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_422C;
  block[3] = &unk_C400;
  block[4] = v3;
  void block[5] = &v14;
  dispatch_sync(v4, block);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = (id)v15[5];
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      __int16 v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(a1 + 32), "removeClockWithIdentifier:force:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "unsignedLongLongValue", (void)v9), 1);
        __int16 v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v14, 8);
}

void sub_41EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_4214(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4224(uint64_t a1)
{
}

void sub_422C(uint64_t a1)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) allKeys];
  id v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_42A8(uint64_t a1)
{
  [*(id *)(a1 + 32) setupIOKitMatching];
  uint64_t v3 = +[TSClockManager sharedClockManager];
  [v3 addClient:*(void *)(a1 + 32)];
}

void sub_4390(uint64_t a1)
{
  uint64_t v3 = +[NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v3];
  if (!v4)
  {
    id v4 = [[ATSACCAClockDevice alloc] initWithClockIdentifier:*(void *)(a1 + 40) withPlugin:*(void *)(a1 + 32)];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = [(ATSACCAClockDevice *)v4 objectID];
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138412802;
      long long v9 = v4;
      __int16 v10 = 1024;
      unsigned int v11 = v5;
      __int16 v12 = 2048;
      uint64_t v13 = v6;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Creating device %@ (%u) for clock identifier 0x%016llx", (uint8_t *)&v8, 0x1Cu);
    }
    if (v4)
    {
      [*(id *)(*(void *)(a1 + 32) + 16) setObject:v4 forKeyedSubscript:v3];
      [*(id *)(a1 + 32) addClockDevice:v4];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(ATSACCAClockDevice **)(a1 + 40);
        int v8 = 134217984;
        long long v9 = v7;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not create clock device for clock identifier 0x%016llx\n", (uint8_t *)&v8, 0xCu);
      }
      id v4 = 0;
    }
  }
  [(ATSACCAClockDevice *)v4 setReferenceCount:(char *)[(ATSACCAClockDevice *)v4 referenceCount] + 1];
}

void sub_45E0(uint64_t a1)
{
  uint64_t v3 = +[NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v3];
  unsigned int v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setReferenceCount:", (char *)objc_msgSend(v4, "referenceCount") - 1);
    if (![v5 referenceCount] || *(unsigned char *)(a1 + 48))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v6 = [v5 objectID];
        uint64_t v7 = *(void *)(a1 + 40);
        int v8 = 138412802;
        id v9 = v5;
        __int16 v10 = 1024;
        unsigned int v11 = v6;
        __int16 v12 = 2048;
        uint64_t v13 = v7;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Destroying device %@ (%u) for clock identifier 0x%016llx", (uint8_t *)&v8, 0x1Cu);
      }
      [*(id *)(a1 + 32) removeClockDevice:v5];
      [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v3];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    id v9 = [v3 unsignedLongLongValue];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Clock Device does not exist for clock identifier 0x%016llx\n", (uint8_t *)&v8, 0xCu);
  }
}

void sub_48DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t sub_4FC8(uint64_t a1, double *a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = atomic_load((unint64_t *)(v4 + 32));
  unsigned int v6 = (unint64_t *)(*(void *)(v4 + 8) + 24 * v5);
  unint64_t v7 = v6[1];
  unint64_t v8 = v6[2];
  *a2 = (double)*v6;
  *a3 = v7;
  *a4 = v8;
  return 0;
}

void sub_5518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_5580(uint64_t a1)
{
  uint64_t v3 = mach_absolute_time();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v3 - v5 <= *(void *)(a1 + 48))
  {
    uint64_t v10 = *(void *)(v4 + 32);
    v55 = v2;
    uint64_t v56 = *(void *)(v4 + 56);
    int v11 = *(unsigned __int8 *)(v4 + 88);
    *(void *)(v4 + 32) = *(void *)(a1 + 56) + v10;
    __int16 v12 = &OBJC_IVAR___ATSACCAClockDevice__clockIdentifier;
    if (v11)
    {
      uint64_t v13 = v10;
      *(void *)(*(void *)(a1 + 32) + 24) += *(void *)(*(void *)(a1 + 32) + 80);
      uint64_t v14 = *(void **)(a1 + 32);
      id v54 = (id)(v14[10] + v14[3] + *(void *)(a1 + 64));
      [v14 clockIdentifier];
      kdebug_trace();
LABEL_29:
      v35 = *(void **)(a1 + 32);
      uint64_t v36 = v35[5];
      v35[5] = v36 + objc_msgSend(v35, "timestampPeriod", v15, v16);
      *(void *)(*(void *)(a1 + 32) + 56) = [*(id *)(*(void *)(a1 + 32) + 136) addTimestamp:*(void *)(*(void *)(a1 + 32) + 24)];
      *(void *)(*(void *)(a1 + 32) + 72) = *(void *)(*(void *)(a1 + 32) + 56) - v56;
      v37 = *(void **)(a1 + 32);
      uint64_t v38 = v37[5];
      uint64_t v39 = v37[7];
      uint64_t v40 = v37[6];
      v37 += 19;
      v41 = v37 + 4;
      unint64_t v42 = atomic_load(v37 + 4);
      unint64_t v43 = (v42 + 1) % *v37;
      v44 = (void *)(v37[1] + 24 * v43);
      void *v44 = v38;
      v44[1] = v39;
      v44[2] = v40;
      atomic_store(v43, v41);
      uint64_t v45 = *(void *)(a1 + 32);
      uint64_t v46 = *(void *)(v45 + v12[14]);
      LOWORD(v38) = *(_WORD *)(v45 + 16);
      uint64_t v47 = *(void *)(v45 + 24);
      uint64_t v48 = *(void *)(v45 + 32);
      uint64_t v49 = *(void *)(v45 + 40);
      uint64_t v50 = *(void *)(v45 + 56);
      char v51 = *(unsigned char *)(v45 + 88);
      v52 = *(NSObject **)(v45 + 104);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_6394;
      v57[3] = &unk_C538;
      v57[4] = v45;
      v57[5] = v49;
      v57[6] = v50;
      v57[7] = v46;
      __int16 v58 = v38;
      v57[8] = v48;
      v57[9] = v47;
      v57[10] = v13;
      v57[11] = v5;
      char v59 = v51;
      dispatch_async(v52, v57);
      [*(id *)(a1 + 32) clockIdentifier];
      kdebug_trace();
      *(void *)(*(void *)(a1 + 32) + 144) = v54;
      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 144), 0xFFFFFFFFFFFFFFFFLL, 0);
      v2 = v55;
      goto LABEL_30;
    }
    uint64_t v53 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v13 = v10;
      *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32)];
      id v54 = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) + *(void *)(a1 + 56) + 30000000];
      [*(id *)(a1 + 32) clockIdentifier];
      kdebug_trace();
      __int16 v12 = &OBJC_IVAR___ATSACCAClockDevice__clockIdentifier;
LABEL_28:
      uint64_t v5 = v53;
      *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(*(void *)(a1 + 32) + 24) - v53;
      uint64_t v34 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(v34 + 24);
      uint64_t v16 = *(void *)(v34 + 80);
      goto LABEL_29;
    }
    uint64_t v17 = TSNullgPTPClockIdentity;
    uint64_t v76 = TSNullgPTPClockIdentity;
    uint64_t v77 = TSNullgPTPClockIdentity;
    unsigned __int16 v75 = -1;
    __int16 v74 = -1;
    *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) grandmasterUsed:&v77 portNumber:&v75];
    id v18 = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) + *(void *)(a1 + 56) + 30000000 grandmasterUsed:&v76 portNumber:&v74];
    uint64_t v19 = v77;
    if (v77 == v76 && v75 == (unsigned __int16)v74)
    {
      id v20 = v18;
    }
    else
    {
      v21 = *(NSObject **)(*(void *)(a1 + 32) + 104);
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_5FAC;
      v71[3] = &unk_C4B0;
      unsigned __int16 v72 = v75;
      v71[4] = v77;
      v71[5] = v76;
      __int16 v73 = v74;
      dispatch_async(v21, v71);
      *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) grandmasterUsed:&v77 portNumber:&v75];
      id v20 = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) + *(void *)(a1 + 56) + 30000000 grandmasterUsed:&v76 portNumber:&v74];
      uint64_t v19 = v77;
      if (v77 != v76 || v75 != (unsigned __int16)v74)
      {
        v22 = *(NSObject **)(*(void *)(a1 + 32) + 104);
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = sub_6078;
        v68[3] = &unk_C4B0;
        unsigned __int16 v69 = v75;
        v68[4] = v77;
        v68[5] = v76;
        __int16 v70 = v74;
        dispatch_async(v22, v68);
        uint64_t v19 = v77;
      }
    }
    if (v17 == v19)
    {
      *(void *)(*(void *)(a1 + 32) + 32) = *(void *)(a1 + 56) + v10;
      *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(*(void *)(a1 + 32) + 80) + v53;
      v23 = *(void **)(a1 + 32);
      id v20 = (id)(v23[10] + v23[3] + *(void *)(a1 + 64));
      v24 = v23[13];
      v25 = &stru_C4F0;
    }
    else
    {
      uint64_t v26 = *(void *)(a1 + 32);
      if (*(void *)(v26 + 8) == v19 && *(unsigned __int16 *)(v26 + 16) == v75) {
        goto LABEL_27;
      }
      uint64_t v67 = v17;
      __int16 v66 = -1;
      v27 = (char *)[*(id *)(v26 + 120) convertFromMachAbsoluteToDomainTime:v53 grandmasterUsed:&v67 portNumber:&v66];
      if (v17 != v67)
      {
        *(void *)(*(void *)(a1 + 32) + 32) = &v27[*(void *)(a1 + 56)];
        *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) grandmasterUsed:&v77 portNumber:&v75];
        id v29 = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) + *(void *)(a1 + 56) + 30000000 grandmasterUsed:&v76 portNumber:&v74];
        uint64_t v30 = v77;
        unsigned __int16 v31 = v75;
        if (v77 == v76 && v75 == (unsigned __int16)v74)
        {
          id v20 = v29;
        }
        else
        {
          v32 = *(NSObject **)(*(void *)(a1 + 32) + 104);
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472;
          v63[2] = sub_61FC;
          v63[3] = &unk_C4B0;
          unsigned __int16 v64 = v75;
          v63[4] = v77;
          v63[5] = v76;
          __int16 v65 = v74;
          dispatch_async(v32, v63);
          *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) grandmasterUsed:&v77 portNumber:&v75];
          id v20 = [*(id *)(*(void *)(a1 + 32) + 120) convertFromDomainToMachAbsoluteTime:*(void *)(*(void *)(a1 + 32) + 32) + *(void *)(a1 + 56) + 30000000 grandmasterUsed:&v76 portNumber:&v74];
          uint64_t v30 = v77;
          unsigned __int16 v31 = v75;
          if (v77 != v76 || v75 != (unsigned __int16)v74)
          {
            v33 = *(NSObject **)(*(void *)(a1 + 32) + 104);
            v60[0] = _NSConcreteStackBlock;
            v60[1] = 3221225472;
            v60[2] = sub_62C8;
            v60[3] = &unk_C4B0;
            unsigned __int16 v61 = v75;
            v60[4] = v77;
            v60[5] = v76;
            __int16 v62 = v74;
            dispatch_async(v33, v60);
            uint64_t v30 = v77;
            unsigned __int16 v31 = v75;
          }
        }
        *(void *)(*(void *)(a1 + 32) + 8) = v30;
        *(_WORD *)(*(void *)(a1 + 32) + 16) = v31;
        goto LABEL_27;
      }
      *(void *)(*(void *)(a1 + 32) + 32) = *(void *)(a1 + 56) + v10;
      *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(*(void *)(a1 + 32) + 80) + v53;
      v28 = *(void **)(a1 + 32);
      id v20 = (id)(v28[10] + v28[3] + *(void *)(a1 + 64));
      v24 = v28[13];
      v25 = &stru_C510;
    }
    dispatch_async(v24, v25);
LABEL_27:
    id v54 = v20;
    uint64_t v13 = v10;
    [*(id *)(a1 + 32) clockIdentifier];
    __int16 v12 = &OBJC_IVAR___ATSACCAClockDevice__clockIdentifier;
    kdebug_trace();
    goto LABEL_28;
  }
  uint64_t v6 = v3;
  ++*(void *)(v4 + 48);
  [*(id *)(*(void *)(a1 + 32) + 120) updateCoreAudioReanchors:1];
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 24);
  id v9 = *(NSObject **)(v7 + 104);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5EEC;
  block[3] = &unk_C490;
  block[4] = v6;
  void block[5] = v8;
  dispatch_async(v9, block);
  [*(id *)(a1 + 32) initializeFirstTimestamp:*(void *)(a1 + 40)];
LABEL_30:
}

void sub_5EEC(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 134218496;
    uint64_t v5 = v2;
    __int16 v6 = 2048;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = 2600000000;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Excedded reset limit %llu - %llu > %llu\n", (uint8_t *)&v4, 0x20u);
  }
}

void sub_5FAC(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu\n", (uint8_t *)&v6, 0x22u);
  }
}

void sub_6078(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu after retry\n", (uint8_t *)&v6, 0x22u);
  }
}

void sub_6144(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "gPTP timestamp conversion failed\n", v1, 2u);
  }
}

void sub_61A0(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "gPTP timestamp conversion failed\n", v1, 2u);
  }
}

void sub_61FC(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu\n", (uint8_t *)&v6, 0x22u);
  }
}

void sub_62C8(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu after retry\n", (uint8_t *)&v6, 0x22u);
  }
}

void sub_6394(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [*(id *)(a1 + 32) clockIdentifier];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = *(unsigned __int16 *)(a1 + 96);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = v7 - *(void *)(a1 + 80);
    uint64_t v10 = v8 - *(void *)(a1 + 88);
    uint64_t v11 = "YES";
    if (!*(unsigned char *)(a1 + 98)) {
      uint64_t v11 = "NO";
    }
    int v12 = 134220290;
    id v13 = v2;
    __int16 v14 = 2048;
    uint64_t v15 = v3;
    __int16 v16 = 2048;
    uint64_t v17 = v4;
    __int16 v18 = 2048;
    uint64_t v19 = v6;
    __int16 v20 = 1024;
    int v21 = v5;
    __int16 v22 = 2048;
    uint64_t v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = v8;
    __int16 v26 = 2048;
    uint64_t v27 = v9;
    __int16 v28 = 2048;
    uint64_t v29 = v10;
    __int16 v30 = 2080;
    unsigned __int16 v31 = v11;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: added audio timestamps (%llu, %llu) from 0x%016llx.%hu using time pair (%llu, %llu). {%lld, %lld} holdover %s\n", (uint8_t *)&v12, 0x62u);
  }
}

void sub_64C8(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 92) = [*(id *)(*(void *)(a1 + 32) + 120) lockState];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v3 + 92) == 2)
  {
    *(unsigned char *)(v3 + 88) = 0;
    [*(id *)(a1 + 32) initializeFirstTimestamp:*(void *)(a1 + 40)];
  }
}

double sub_654C(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 48);
  [*(id *)(*(void *)(a1 + 32) + 120) updateCoreAudioReanchors:1];
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
  id v2 = (unint64_t *)(*(void *)(a1 + 32) + 152);

  return sub_65CC(v2);
}

double sub_65CC(unint64_t *a1)
{
  unint64_t v2 = *a1;
  long long v5 = 0uLL;
  uint64_t v6 = 0;
  sub_8488(&v7, v2, &v5);
  uint64_t v3 = (void *)a1[1];
  if (v3)
  {
    a1[2] = (unint64_t)v3;
    operator delete(v3);
  }
  double result = *(double *)&v7;
  *(_OWORD *)(a1 + 1) = v7;
  a1[3] = v8;
  atomic_store(0, a1 + 4);
  return result;
}

double sub_6828(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
  return sub_65CC((unint64_t *)(*(void *)(a1 + 32) + 152));
}

id sub_68DC(uint64_t a1)
{
  [*(id *)(a1 + 32) setSamplingRate:*(double *)(a1 + 40)];
  uint64_t v2 = (*(double *)(a1 + 40) * 260.0 / 1000.0);
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setTimestampPeriod:v2];
}

void sub_69EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_69FC(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6A94;
  block[3] = &unk_C5B0;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

void sub_6A94(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [*(id *)(a1 + 32) description];
    int v3 = 136315138;
    id v4 = [v2 UTF8String];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "didChangeClockMasterForClock:%s\n", (uint8_t *)&v3, 0xCu);
  }
}

void sub_6B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6C34(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  long long v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  long long v7 = sub_6D3C;
  unint64_t v8 = &unk_C620;
  int v10 = *(_DWORD *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  dispatch_async(v2, &v5);
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_DWORD *)(a1 + 48) == 2)
  {
    *(unsigned char *)(v3 + 88) = 0;
    uint64_t v4 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v4 + 64) && *(void *)(v4 + 128)) {
      objc_msgSend((id)v4, "initializeFirstTimestamp:", v5, v6, v7, v8);
    }
  }
  else
  {
    *(unsigned char *)(v3 + 88) = 1;
  }
}

void sub_6D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_6D3C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(_DWORD *)(a1 + 40);
    id v3 = [*(id *)(a1 + 32) description];
    v4[0] = 67109378;
    v4[1] = v2;
    __int16 v5 = 2080;
    id v6 = [v3 UTF8String];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "didChangeLockStateTo:%u forClock:%s\n", (uint8_t *)v4, 0x12u);
  }
}

void sub_6E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6EE0(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6F78;
  block[3] = &unk_C5B0;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

void sub_6F78(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [*(id *)(a1 + 32) description];
    int v3 = 136315138;
    id v4 = [v2 UTF8String];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "didBeginClockGrandmasterChangeForClock:%s\n", (uint8_t *)&v3, 0xCu);
  }
}

void sub_7034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_70FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_710C(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_71A4;
  block[3] = &unk_C5B0;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

void sub_71A4(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [*(id *)(a1 + 32) description];
    int v3 = 136315138;
    id v4 = [v2 UTF8String];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "didEndClockGrandmasterChangeForClock:%s\n", (uint8_t *)&v3, 0xCu);
  }
}

void sub_7260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_798C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu\n", (uint8_t *)&v6, 0x22u);
  }
}

void sub_7A58(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu after retry\n", (uint8_t *)&v6, 0x22u);
  }
}

void sub_7B24(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu\n", (uint8_t *)&v6, 0x22u);
  }
}

void sub_7BF0(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(unsigned __int16 *)(a1 + 50);
    int v6 = 134218752;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v2;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "mach and dispatch GM ID mismatch 0x%016llx.%hu != 0x%016llx.%hu after retry\n", (uint8_t *)&v6, 0x22u);
  }
}

void sub_7CBC(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [*(id *)(a1 + 32) clockIdentifier];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = *(unsigned __int16 *)(a1 + 80);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 72);
    int v9 = 134220290;
    id v10 = v2;
    __int16 v11 = 2048;
    uint64_t v12 = v3;
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    __int16 v17 = 1024;
    int v18 = v5;
    __int16 v19 = 2048;
    uint64_t v20 = v7;
    __int16 v21 = 2048;
    uint64_t v22 = v8;
    __int16 v23 = 2048;
    uint64_t v24 = 0;
    __int16 v25 = 2048;
    uint64_t v26 = 0;
    __int16 v27 = 2080;
    __int16 v28 = "NO";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: added audio timestamps (%llu, %llu) from 0x%016llx.%hu using time pair (%llu, %llu). {%llu, %llu} holdover %s\n", (uint8_t *)&v9, 0x62u);
  }
}

void sub_7DD0(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) clockIdentifier];
    *(_DWORD *)buf = 134217984;
    id v35 = v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: Failed to get the initial timestamp, returned TSInvalidTime.\n", buf, 0xCu);
  }
  unsigned int v4 = [*(id *)(a1 + 40) lockState];
  if (v4 > 2) {
    int v5 = @"Unknown";
  }
  else {
    int v5 = *(&off_C690 + (int)v4);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) clockIdentifier];
    id v7 = [(__CFString *)v5 UTF8String];
    *(_DWORD *)buf = 134218242;
    id v35 = v6;
    __int16 v36 = 2080;
    *(void *)v37 = v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: Clock lock state is %s\n", buf, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v29 = 0;
    unsigned __int16 v28 = 0;
    uint64_t v8 = *(void **)(a1 + 40);
    id v27 = 0;
    unsigned int v9 = [v8 getMachAbsoluteRateRatioNumerator:&v33 denominator:&v32 machAnchor:&v31 andDomainAnchor:&v30 forGrandmasterIdentity:&v29 portNumber:&v28 withError:&v27];
    id v10 = v27;
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        id v12 = [*(id *)(a1 + 32) clockIdentifier];
        *(_DWORD *)buf = 134219520;
        id v35 = v12;
        __int16 v36 = 2048;
        *(void *)v37 = v31;
        *(_WORD *)&v37[8] = 2048;
        *(void *)&v37[10] = v30;
        __int16 v38 = 2048;
        uint64_t v39 = v33;
        __int16 v40 = 2048;
        uint64_t v41 = v32;
        __int16 v42 = 2048;
        uint64_t v43 = v29;
        __int16 v44 = 1024;
        int v45 = v28;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: Mach anchor %llu domain anchor %llu numerator %llu denominator %llu grandmaster 0x%016llx.%hu\n", buf, 0x44u);
      }
    }
    else if (v11)
    {
      id v18 = [*(id *)(a1 + 32) clockIdentifier];
      unsigned int v19 = [v10 code];
      id v20 = [v10 description];
      id v21 = [v20 UTF8String];
      *(_DWORD *)buf = 134218498;
      id v35 = v18;
      __int16 v36 = 1024;
      *(_DWORD *)v37 = v19;
      *(_WORD *)&v37[4] = 2080;
      *(void *)&v37[6] = v21;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: Failed to get rate ratio and anchor with error 0x%08x \"%s\"\n", buf, 0x1Cu);
    }
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    __int16 v13 = *(void **)(a1 + 40);
    id v26 = 0;
    unsigned int v14 = [v13 getMachAbsoluteRateRatioNumerator:&v33 denominator:&v32 machAnchor:&v31 andDomainAnchor:&v30 withError:&v26];
    id v15 = v26;
    BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        id v17 = [*(id *)(a1 + 32) clockIdentifier];
        *(_DWORD *)buf = 134219008;
        id v35 = v17;
        __int16 v36 = 2048;
        *(void *)v37 = v31;
        *(_WORD *)&v37[8] = 2048;
        *(void *)&v37[10] = v30;
        __int16 v38 = 2048;
        uint64_t v39 = v33;
        __int16 v40 = 2048;
        uint64_t v41 = v32;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: Mach anchor %llu domain anchor %llu numerator %llu denominator %llu\n", buf, 0x34u);
      }
    }
    else if (v16)
    {
      id v22 = [*(id *)(a1 + 32) clockIdentifier];
      unsigned int v23 = [v15 code];
      id v24 = [v15 description];
      id v25 = [v24 UTF8String];
      *(_DWORD *)buf = 134218498;
      id v35 = v22;
      __int16 v36 = 1024;
      *(_DWORD *)v37 = v23;
      *(_WORD *)&v37[4] = 2080;
      *(void *)&v37[6] = v25;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: Failed to get rate ratio and anchor with error 0x%08x \"%s\"\n", buf, 0x1Cu);
    }
  }
}

void sub_8218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_82EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)ATSACCAClockDevice;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_8328(void *a1)
{
}

void *sub_8488(void *a1, unint64_t a2, long long *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_8518(a1, a2);
    uint64_t v6 = a1[1];
    uint64_t v7 = v6 + 24 * a2;
    uint64_t v8 = 24 * a2;
    do
    {
      long long v9 = *a3;
      *(void *)(v6 + 16) = *((void *)a3 + 2);
      *(_OWORD *)uint64_t v6 = v9;
      v6 += 24;
      v8 -= 24;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_84FC(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_8518(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_856C();
  }
  double result = (char *)sub_8584((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void sub_856C()
{
}

void *sub_8584(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_865C();
  }
  return operator new(24 * a2);
}

void sub_85CC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_8628(exception, a1);
}

void sub_8614(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_8628(std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_865C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
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

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return _dispatch_queue_attr_make_initially_inactive(attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return _dispatch_workloop_set_scheduler_priority();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return _os_parse_boot_arg_int();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_clockDomain(void *a1, const char *a2, ...)
{
  return [a1 clockDomain];
}

id objc_msgSend_clockIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clockIdentifier];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceUID(void *a1, const char *a2, ...)
{
  return [a1 deviceUID];
}

id objc_msgSend_driverRef(void *a1, const char *a2, ...)
{
  return [a1 driverRef];
}

id objc_msgSend_lockState(void *a1, const char *a2, ...)
{
  return [a1 lockState];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_primeNotification(void *a1, const char *a2, ...)
{
  return [a1 primeNotification];
}

id objc_msgSend_referenceCount(void *a1, const char *a2, ...)
{
  return [a1 referenceCount];
}

id objc_msgSend_samplingRate(void *a1, const char *a2, ...)
{
  return [a1 samplingRate];
}

id objc_msgSend_setupIOKitMatching(void *a1, const char *a2, ...)
{
  return [a1 setupIOKitMatching];
}

id objc_msgSend_sharedClockManager(void *a1, const char *a2, ...)
{
  return [a1 sharedClockManager];
}

id objc_msgSend_sharedPlugin(void *a1, const char *a2, ...)
{
  return [a1 sharedPlugin];
}

id objc_msgSend_timeSyncClock(void *a1, const char *a2, ...)
{
  return [a1 timeSyncClock];
}

id objc_msgSend_timestampPeriod(void *a1, const char *a2, ...)
{
  return [a1 timestampPeriod];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateCoreAudioReanchors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCoreAudioReanchors:");
}