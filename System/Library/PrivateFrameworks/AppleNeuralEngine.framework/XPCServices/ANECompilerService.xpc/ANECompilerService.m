void sub_10000430C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100004CC0(id a1)
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.ane.programIOSurfacesMapper", v3);
  v2 = (void *)qword_100057D80;
  qword_100057D80 = (uint64_t)v1;
}

void sub_100004DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004EB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  v10 = v9;

  a9.super_class = (Class)_ANEProgramIOSurfacesMapper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100004F58(void *a1)
{
}

void sub_10000529C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_1000059A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000059B4(uint64_t a1)
{
}

void sub_1000059BC(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) controller];
  id v3 = [v2 device];
  if (v3 && *(void *)v3) {
    unsigned int v4 = (*(uint64_t (**)(id, void, BOOL))(*(void *)v3 + 56))(v3, *(void *)(a1 + 64), *(unsigned char *)(a1 + 80) != 0);
  }
  else {
    unsigned int v4 = 2;
  }

  v5 = +[_ANELog common];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = NSStringFromSelector(*(SEL *)(a1 + 72));
    int v12 = 138412546;
    v13 = v6;
    __int16 v14 = 1024;
    unsigned int v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "-----> %@: ANEProgramMemoryMapRequest() ret=0x%x ", (uint8_t *)&v12, 0x12u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4 == 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v8 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v9 = +[_ANEErrors programIOSurfacesMapErrorForMethod:v8 code:v4];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

LABEL_13:
    return;
  }
  int v7 = *(unsigned __int8 *)(a1 + 80);
  if (*(unsigned char *)(a1 + 80))
  {
    v8 = +[NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1 + 64) + 3088)];
  }
  else
  {
    v8 = 0;
  }
  [*(id *)(a1 + 40) setTransactionHandle:v8];
  if (v7) {
    goto LABEL_13;
  }
}

void sub_100005B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

void sub_100005F48(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) controller];
  id v3 = [v2 device];
  if (v3 && *(void *)v3) {
    unsigned int v4 = (*(uint64_t (**)(id, void))(*(void *)v3 + 64))(v3, *(void *)(a1 + 56));
  }
  else {
    unsigned int v4 = 2;
  }

  v5 = +[_ANELog common];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v11 = 138412546;
    int v12 = v6;
    __int16 v13 = 1024;
    unsigned int v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "-----> %@: ANEProgramMemoryUnMapRequest() ret=0x%x ", (uint8_t *)&v11, 0x12u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 == 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    int v7 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v8 = +[_ANEErrors programIOSurfacesUnmapErrorForMethod:v7 code:v4];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void sub_1000060C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000068B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006A6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006B04(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.ane.devicecontroller", v3);
  v2 = (void *)qword_100057D90;
  qword_100057D90 = (uint64_t)v1;
}

void sub_100006C5C(id a1)
{
  qword_100057DA8 = [[_ANEDeviceController alloc] initWithProgramHandle:0 priviledged:1];
  _objc_release_x1();
}

void sub_100006DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006EEC(uint64_t a1)
{
  v2 = +[_ANEVirtualClient sharedConnection];

  if (v2)
  {
    [*(id *)(a1 + 32) setDevice:0];
    id v3 = +[_ANELog common];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      objc_claimAutoreleasedReturnValue();
      sub_10002E5D8();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setUsecount:", (char *)objc_msgSend(*(id *)(a1 + 32), "usecount") + 1);
    unsigned int v4 = +[_ANELog common];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = [*(id *)(a1 + 32) usecount];
      id v12 = [*(id *)(a1 + 32) device];
      unsigned int v13 = [*(id *)(a1 + 32) isPrivileged];
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v12;
      __int16 v23 = 1024;
      unsigned int v24 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@: self.usecount=%lld : self.device=%p : self.isPrivileged=%d", buf, 0x26u);
    }
    if ([*(id *)(a1 + 32) usecount] == (id)1)
    {
      memset(buf, 0, sizeof(buf));
      if ([*(id *)(a1 + 32) isPrivileged])
      {
        id v5 = 0;
        int v6 = 2;
        *(_DWORD *)buf = 2;
      }
      else
      {
        *(_DWORD *)buf = 1;
        id v5 = [*(id *)(a1 + 32) programHandle];
        int v6 = 1;
      }
      *(void *)&buf[8] = v5;
      *(_DWORD *)&buf[16] = 10000;
      *(_DWORD *)&buf[24] = 10000;
      int v7 = +[_ANELog common];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v14 = NSStringFromSelector(*(SEL *)(a1 + 40));
        *(_DWORD *)v16 = 138412802;
        v17 = v14;
        __int16 v18 = 1024;
        int v19 = v6;
        __int16 v20 = 2048;
        id v21 = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@: Calling ANEDeviceOpen( deviceUsageType=%u : programHandle=%llu)", v16, 0x1Cu);
      }
      uint64_t v15 = 0;
      uint64_t v8 = *(void *)(a1 + 32);
      if (sub_100007780((uint64_t)&v15, (uint64_t)buf, v8)
        && sub_100007780((uint64_t)&v15, (uint64_t)buf, v8)
        || !v15)
      {
        uint64_t v9 = +[_ANELog common];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 40));
          objc_claimAutoreleasedReturnValue();
          sub_10002E584();
        }

        [*(id *)(a1 + 32) setDevice:0];
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "setDevice:");
      }
    }
  }
}

void sub_100007204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100007248(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  unsigned int v9 = *a4;
  id v10 = +[NSString stringWithFormat:@"%s: statusType=%d : pRefCon=%p : device=%p : programInstance=%p", "fDeviceCallback", *a4, a1, a2, a3];
  if ((v9 & 0xFFFFFFFE) == 0x16)
  {
    id v11 = +[_ANELog common];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
  }
  else if (v9 == 21 || v9 == 18)
  {
    id v11 = +[_ANELog common];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002E6A4((uint64_t)v10, v11);
    }
  }
  else
  {
    id v11 = +[_ANELog common];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10002E62C((uint64_t)v10, v11);
    }
  }

  unsigned int v14 = *a4;
  if (*a4 == 21)
  {
    +[_ANEDataReporter addValue:1 forScalarKey:@"ANEReset"];
    unsigned int v14 = *a4;
  }
  if (v14 <= 0x15 && ((1 << v14) & 0x260000) != 0) {
    +[_ANEDataReporter reportErrorMsg:status:](_ANEDataReporter, "reportErrorMsg:status:");
  }

  return 0;
}

void sub_100007420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000074BC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUsecount:", (char *)objc_msgSend(*(id *)(a1 + 32), "usecount") - 1);
  v2 = +[_ANELog common];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [*(id *)(a1 + 32) usecount];
    id v8 = [*(id *)(a1 + 32) device];
    *(_DWORD *)buf = 138412802;
    id v13 = v6;
    __int16 v14 = 2048;
    id v15 = v7;
    __int16 v16 = 2048;
    id v17 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%@: self.usecount=%lld : self.device=%p", buf, 0x20u);
  }
  if (![*(id *)(a1 + 32) usecount] && objc_msgSend(*(id *)(a1 + 32), "device"))
  {
    id v3 = [*(id *)(a1 + 32) device];
    if (!v3 || !*(void *)v3 || (*(unsigned int (**)(void))(*(void *)v3 + 8))())
    {
      unsigned int v4 = +[_ANELog common];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        objc_claimAutoreleasedReturnValue();
        sub_10002E71C();
      }
    }
    [*(id *)(a1 + 32) setDevice:0];
    id v5 = +[_ANELog common];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = [*(id *)(a1 + 32) usecount];
      id v11 = [*(id *)(a1 + 32) device];
      *(_DWORD *)buf = 138412802;
      id v13 = v9;
      __int16 v14 = 2048;
      id v15 = v10;
      __int16 v16 = 2048;
      id v17 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@: ANEDeviceClose() self.usecount=%lld : self.device=%p", buf, 0x20u);
    }
  }
}

void sub_100007700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100007780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_unfair_lock_lock_with_options();
  id v6 = (void *)qword_100057DB8;
  if (!qword_100057DB8)
  {
    id v7 = dlopen("/System/Library/PrivateFrameworks/ANEServices.framework/ANEServices", 4);
    qword_100057DB8 = (uint64_t)v7;
    id v8 = dlerror();
    if (!v7) {
      printf("dlopen error: %s\n", v8);
    }
    id v6 = (void *)qword_100057DB8;
    if (!qword_100057DB8)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_100057DB0);
      return 4;
    }
  }
  if (!off_100057DC8)
  {
    off_100057DC8 = dlsym(v6, "H11ANEDeviceOpen");
    id v9 = dlerror();
    if (v9) {
      printf("dlsym err: %s\n", v9);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100057DB0);
  id v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))off_100057DC8;
  if (!off_100057DC8) {
    return 4;
  }
  return v10(a1, a2, a3, sub_100007248);
}

uint64_t sub_1000078B0(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void sub_100007970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000079EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007ABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_ANEProgramForEvaluation;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100007C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  _Block_object_dispose(&STACK[0x1130], 8);
  _Block_object_dispose(&STACK[0x1150], 8);
  _Block_object_dispose(&STACK[0x1170], 8);

  _Unwind_Resume(a1);
}

uint64_t sub_10000903C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000904C(uint64_t a1)
{
}

void sub_100009054(uint64_t a1, unsigned int *a2)
{
  unsigned int v4 = +[_ANELog common];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v32 = NSStringFromSelector(*(SEL *)(a1 + 96));
    unsigned int v34 = *a2;
    unsigned int v33 = a2[1];
    int v35 = *(_DWORD *)(a1 + 112);
    *(_DWORD *)buf = 138413058;
    v37 = v32;
    __int16 v38 = 1024;
    unsigned int v39 = v33;
    __int16 v40 = 1024;
    unsigned int v41 = v34;
    __int16 v42 = 1024;
    int v43 = v35;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "-----> %@: ANEProgramProcessRequestDirect() status=0x%x : statusType=0x%x : qos=0x%x", buf, 0x1Eu);
  }
  unsigned int v5 = *a2;
  if (*a2 == 19)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id v6 = (unsigned int *)*((void *)a2 + 1);
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 96));
    id v8 = (void *)v7;
    if (v6)
    {
      id v9 = +[NSString stringWithFormat:@"%@: 0x%x", v7, *v6];

      uint64_t v10 = +[_ANEErrors programInferenceOverflowErrorForMethod:v9];
      uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      +[_ANEDataReporter addValue:1 forScalarKey:@"InferenceOverflowed"];
      return;
    }
    v22 = +[NSString stringWithFormat:@"%@: Expecting EventPayLoad 0x%x", v7, *a2];

    uint64_t v28 = +[_ANEErrors programInferenceOtherErrorForMethod:v22];
    uint64_t v29 = *(void *)(*(void *)(a1 + 72) + 8);
    v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;

    +[_ANEDataReporter addValue:1 forScalarKey:@"ModelFailsToRun"];
    v27 = +[_ANELog common];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 96));
      objc_claimAutoreleasedReturnValue();
      sub_10002E810();
    }
    goto LABEL_18;
  }
  if (v5 != 8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v23 = *(void *)(a1 + 32);
    unsigned int v24 = *(void **)(a1 + 40);
    v22 = NSStringFromSelector(*(SEL *)(a1 + 96));
    uint64_t v25 = [v24 programInferenceOtherErrorForMessage:a2 model:v23 methodName:v22];
    uint64_t v26 = *(void *)(*(void *)(a1 + 72) + 8);
    v27 = *(NSObject **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
LABEL_18:

    goto LABEL_19;
  }
  if (a2[1]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && !*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    __int16 v14 = *(void **)(a1 + 40);
    id v15 = NSStringFromSelector(*(SEL *)(a1 + 96));
    uint64_t v16 = [v14 programInferenceOtherErrorForMessage:a2 model:v13 methodName:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
    __int16 v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
    goto LABEL_20;
  }
  uint64_t v19 = +[_ANEPerformanceStats statsWithRequestPerformanceBuffer:a2 + 4 statsBufferSize:a2 + 12];
  [*(id *)(a1 + 48) setPerfStats:v19];

  __int16 v20 = [*(id *)(a1 + 48) perfStats];
  LOBYTE(v19) = v20 == 0;

  if (v19) {
    goto LABEL_20;
  }
  id v21 = [*(id *)(a1 + 48) perfStats];
  [v21 hwExecutionTime];

  v22 = [*(id *)(a1 + 48) perfStats];
  [v22 emitPerfcounterSignpostsWithModelStringID:*(void *)(a1 + 104)];
LABEL_19:

LABEL_20:
  kdebug_trace();
  if (*(unsigned char *)(a1 + 116))
  {
    kdebug_trace();
  }
  else
  {
    if (v5 != 19) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    kdebug_trace();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
    v31 = [*(id *)(a1 + 40) requestsInFlight];
    dispatch_semaphore_signal(v31);

    objc_msgSend(*(id *)(a1 + 40), "setCurrentAsyncRequestsInFlight:", (char *)objc_msgSend(*(id *)(a1 + 40), "currentAsyncRequestsInFlight") - 1);
  }
}

void sub_1000094DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100009570(uint64_t a1)
{
  for (uint64_t i = 4072; i != 2024; i -= 32)

  do
  {

    i -= 32;
  }
  while (i != -24);
  return a1;
}

void sub_100009838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100009EE4(uint64_t result, char a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = a2 & 1;
  return result;
}

void sub_100009F88(id a1)
{
  qword_100057DE0 = [[_ANEVirtualClient alloc] initWithSingletonAccess];
  _objc_release_x1();
}

void sub_10000A2C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A90C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10000B218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000BFB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_10000C268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
}

void sub_10000C394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  _Unwind_Resume(a1);
}

__IOSurface *sub_10000C3CC(uint64_t a1, uint64_t *a2)
{
  *(void *)(a1 + 8 * *(unsigned int *)(a1 + 32) + 40) = a2;
  result = *(__IOSurface **)(*(void *)(a1 + 16) + 8);
  if (result) {
    result = (__IOSurface *)IOSurfaceGetBaseAddress(result);
  }
  if (*(_DWORD *)a1) {
    unsigned int v5 = (char *)result + *(unsigned int *)(a1 + 4);
  }
  else {
    unsigned int v5 = 0;
  }
  int v6 = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a1 + 32) = v6 + 1;
  uint64_t v7 = &v5[12 * v6];
  uint64_t v8 = *a2;
  *((_DWORD *)v7 + 2) = *((_DWORD *)a2 + 2);
  *(void *)uint64_t v7 = v8;
  return result;
}

void sub_10000CD5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10000D3DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Block_object_dispose((const void *)(v17 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_10000D4B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) signaledValue];
  BOOL v5 = os_log_type_enabled((os_log_t)qword_100057DD0, OS_LOG_TYPE_DEBUG);
  if (v4 == (id)4097)
  {
    if (v5) {
      sub_10002F4C8();
    }
    int v6 = [*(id *)(a1 + 40) completionHandler];
    v6[2](v6, 1, 0);
    uint64_t v7 = v3;
  }
  else
  {
    if (v5) {
      sub_10002F538();
    }
    uint64_t v8 = +[_ANEStrings errorDomainVirtIO];
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Failed to match value in success handler";
    id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v7 = +[NSError errorWithDomain:v8 code:0 userInfo:v9];

    uint64_t v10 = [*(id *)(a1 + 40) completionHandler];
    ((void (**)(void, void, void *))v10)[2](v10, 0, v7);

    int v6 = (void (**)(void, void, void))v3;
  }
}

void sub_10000D64C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D6A4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  int v6 = (id)qword_100057DD0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [*(id *)(a1 + 32) signaledValue];
    *(_DWORD *)buf = 134218496;
    id v16 = v5;
    __int16 v17 = 2048;
    uint64_t v18 = a3;
    __int16 v19 = 2048;
    id v20 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "notifyListener failure. Sending error on completion handler: event:%p, value:%llx signaledValue %llx ", buf, 0x20u);
  }

  if ([*(id *)(a1 + 32) signaledValue] == (id)-536870186)
  {
    uint64_t v7 = +[NSString stringWithFormat:@"%x: Program Inference timeout", 3758097110];
    uint64_t v8 = +[_ANEErrors timeoutErrorForMethod:v7];
  }
  else
  {
    uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llx", [*(id *)(a1 + 32) signaledValue]);
    id v9 = +[_ANEStrings errorDomainVirtIO];
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    __int16 v14 = v7;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v8 = +[NSError errorWithDomain:v9 code:0 userInfo:v10];
  }
  NSErrorUserInfoKey v11 = [*(id *)(a1 + 40) completionHandler];
  ((void (**)(void, void, void *))v11)[2](v11, 0, v8);
}

void sub_10000D8B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D928(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(unsigned int *)(a1 + 80);
  id v10 = 0;
  unsigned __int8 v8 = [v2 doEvaluateWithModel:v3 options:v4 request:v5 qos:v7 completionEvent:v6 error:&v10];
  id v9 = v10;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v8;
}

id sub_10000D988(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) doEvaluateWithModel:*(void *)(a1 + 40) options:*(void *)(a1 + 48) request:*(void *)(a1 + 56) qos:*(unsigned int *)(a1 + 80) completionEvent:0 error:*(void *)(a1 + 72)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_1000102F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_100010C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000113D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011BF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1000126C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000129B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012DC4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v3 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_100012DE4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  id v9 = 0;
  unsigned __int8 v6 = [v2 doMapIOSurfacesWithModel:v3 request:v4 cacheInference:v5 error:&v9];
  id v7 = v9;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v6;
  unsigned __int8 v8 = [*(id *)(a1 + 48) completionHandler];
  ((void (**)(void, void, id))v8)[2](v8, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v7);
}

void sub_100012E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100012E9C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) doMapIOSurfacesWithModel:*(void *)(a1 + 40) request:*(void *)(a1 + 48) cacheInference:*(unsigned __int8 *)(a1 + 72) error:*(void *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_100013AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100014BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,uint64_t a26,void *a27,uint64_t a28,void *a29,void *a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,void *a42,uint64_t a43,void *a44)
{
  _Unwind_Resume(a1);
}

void sub_100015664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, void *a19, void *a20,uint64_t a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_100016388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,void *a37,void *a38,uint64_t a39,void *a40)
{
  _Unwind_Resume(a1);
}

void sub_100016C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100016EA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000170A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000173B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000174A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000175F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001780C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000181A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018EF4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete();
  }
  _Unwind_Resume(exception_object);
}

void sub_1000190CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000191E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019488()
{
  operator delete();
}

void sub_10001960C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100019C60(uint64_t a1, unsigned int a2)
{
  *(_DWORD *)a1 = a2;
  uint64_t v3 = sub_100019CF0(a2);
  uint64_t v4 = operator new(0x28uLL);
  v4[1] = 0;
  v4[2] = 0;
  void *v4 = off_10004CB70;
  v4[4] = v3;
  *(void *)(a1 + 16) = v4;
  *((unsigned char *)v4 + 24) = 0;
  *(void *)(a1 + 8) = v4 + 3;
  *(_DWORD *)(a1 + 4) = IOSurfaceGetID(v3);
  return a1;
}

void sub_100019CD8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3) {
    sub_100019F18(v3);
  }
  _Unwind_Resume(exception_object);
}

IOSurfaceRef sub_100019CF0(unsigned int a1)
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  sub_100019E50(Mutable, kIOSurfaceCacheMode, 0);
  sub_100019EB4(Mutable, kIOSurfaceAllocSize, a1);
  IOSurfaceRef v3 = IOSurfaceCreate(Mutable);
  CFRelease(Mutable);
  return v3;
}

void sub_100019D7C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10004CB70;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_100019D9C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10004CB70;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_100019DF0(uint64_t a1)
{
  return sub_100019DFC(a1 + 24);
}

uint64_t sub_100019DFC(uint64_t a1)
{
  v2 = *(__IOSurface **)(a1 + 8);
  if (v2)
  {
    if (*(unsigned char *)a1)
    {
      IOSurfaceUnlock(v2, 0, 0);
      *(unsigned char *)a1 = 0;
      v2 = *(__IOSurface **)(a1 + 8);
    }
    CFRelease(v2);
    *(void *)(a1 + 8) = 0;
  }
  return a1;
}

void sub_100019E50(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void sub_100019EB4(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void sub_100019F18(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t sub_100019F8C(uint64_t a1, const void *a2, int a3, int a4)
{
  *(_DWORD *)a1 = a4;
  *(_DWORD *)(a1 + 4) = a3 + 1;
  unsigned __int8 v6 = sub_100019CF0(a3 + 1 + 12 * a4);
  id v7 = operator new(0x28uLL);
  v7[1] = 0;
  v7[2] = 0;
  void *v7 = off_10004CB70;
  v7[4] = v6;
  *(void *)(a1 + 24) = v7;
  *((unsigned char *)v7 + 24) = 0;
  *(void *)(a1 + 16) = v7 + 3;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 8) = IOSurfaceGetID(v6);
  BaseAddress = *(__IOSurface **)(*(void *)(a1 + 16) + 8);
  if (BaseAddress) {
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  }
  if (!*(_DWORD *)(a1 + 4)) {
    BaseAddress = 0;
  }
  memcpy(BaseAddress, a2, *(unsigned int *)(a1 + 4));
  return a1;
}

void sub_10001A040(_Unwind_Exception *exception_object)
{
  IOSurfaceRef v3 = *(std::__shared_weak_count **)(v1 + 24);
  if (v3) {
    sub_100019F18(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10001A058(uint64_t a1, const void *a2, int a3, int a4)
{
  *(_DWORD *)a1 = a4;
  *(_DWORD *)(a1 + 4) = a3 + 1;
  unsigned __int8 v6 = sub_100019CF0(a3 + 113);
  id v7 = operator new(0x28uLL);
  v7[1] = 0;
  v7[2] = 0;
  void *v7 = off_10004CB70;
  v7[4] = v6;
  *(void *)(a1 + 24) = v7;
  *((unsigned char *)v7 + 24) = 0;
  *(void *)(a1 + 16) = v7 + 3;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 8) = IOSurfaceGetID(v6);
  BaseAddress = *(__IOSurface **)(*(void *)(a1 + 16) + 8);
  if (BaseAddress) {
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  }
  if (!*(_DWORD *)(a1 + 4)) {
    BaseAddress = 0;
  }
  memcpy(BaseAddress, a2, *(unsigned int *)(a1 + 4));
  return a1;
}

void sub_10001A108(_Unwind_Exception *exception_object)
{
  IOSurfaceRef v3 = *(std::__shared_weak_count **)(v1 + 24);
  if (v3) {
    sub_100019F18(v3);
  }
  _Unwind_Resume(exception_object);
}

unsigned int *sub_10001A120(unsigned int *a1, const void *a2, int a3, const void *a4, int a5, const void *a6, unsigned int a7, const void *a8, unsigned int a9, const void *a10, int a11, void *a12)
{
  id v39 = a12;
  *a1 = a3 + 1;
  a1[1] = a5 + 1;
  a1[2] = a9;
  a1[3] = a11 + 1;
  a1[5] = a7;
  IOSurfaceRef v20 = sub_100019CF0(a5 + 1 + a3 + 1 + a9 + a11 + 1);
  id v21 = operator new(0x28uLL);
  v21[1] = 0;
  v21[2] = 0;
  *id v21 = off_10004CB70;
  *((unsigned char *)v21 + 24) = 0;
  v21[4] = v20;
  *((void *)a1 + 4) = v21 + 3;
  *((void *)a1 + 5) = v21;
  IOSurfaceRef v22 = sub_100019CF0(a7);
  uint64_t v23 = operator new(0x28uLL);
  v23[1] = 0;
  v23[2] = 0;
  *((unsigned char *)v23 + 24) = 0;
  *uint64_t v23 = off_10004CB70;
  v23[4] = v22;
  *((void *)a1 + 6) = v23 + 3;
  *((void *)a1 + 7) = v23;
  BaseAddress = *(__IOSurface **)(*((void *)a1 + 4) + 8);
  if (BaseAddress) {
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  }
  if (!*a1) {
    BaseAddress = 0;
  }
  memcpy(BaseAddress, a2, *a1);
  uint64_t v25 = *(__IOSurface **)(*((void *)a1 + 4) + 8);
  if (v25) {
    uint64_t v25 = (__IOSurface *)IOSurfaceGetBaseAddress(v25);
  }
  size_t v26 = a1[1];
  if (v26) {
    v27 = (char *)v25 + *a1;
  }
  else {
    v27 = 0;
  }
  memcpy(v27, a4, v26);
  if (a8)
  {
    uint64_t v28 = sub_10001A448((uint64_t)a1);
    memcpy(v28, a8, a1[2]);
  }
  if (a10)
  {
    uint64_t v29 = sub_10001A494((uint64_t)a1);
    memcpy(v29, a10, a1[3]);
  }
  a1[4] = IOSurfaceGetID(*(IOSurfaceRef *)(*((void *)a1 + 4) + 8));
  v30 = v39;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    int v33 = *a1;
    unsigned int v34 = *(__IOSurface **)(*((void *)a1 + 4) + 8);
    if (v34)
    {
      int v35 = IOSurfaceGetBaseAddress(v34);
      int v36 = *a1;
      unsigned int v34 = *(__IOSurface **)(*((void *)a1 + 4) + 8);
      if (v34) {
        unsigned int v34 = (__IOSurface *)IOSurfaceGetBaseAddress(v34);
      }
    }
    else
    {
      int v35 = 0;
      int v36 = *a1;
    }
    if (a1[1]) {
      v37 = (char *)v34 + *a1;
    }
    else {
      v37 = 0;
    }
    if (v36) {
      __int16 v38 = v35;
    }
    else {
      __int16 v38 = 0;
    }
    *(_DWORD *)buf = 67109634;
    int v41 = v33;
    __int16 v42 = 2080;
    int v43 = v38;
    __int16 v44 = 2080;
    v45 = v37;
    _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "_ANEWeightSerializerDeserializer weightSymbolSize:%u weightsymbol:%s weightsymbolURL:%s\n", buf, 0x1Cu);
  }

  v31 = *(__IOSurface **)(*((void *)a1 + 6) + 8);
  if (v31) {
    v31 = (__IOSurface *)IOSurfaceGetBaseAddress(v31);
  }
  memcpy(v31, a6, a1[5]);
  a1[6] = IOSurfaceGetID(*(IOSurfaceRef *)(*((void *)a1 + 6) + 8));

  return a1;
}

void sub_10001A3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  NSErrorUserInfoKey v13 = *(std::__shared_weak_count **)(v10 + 56);
  if (v13) {
    sub_100019F18(v13);
  }
  __int16 v14 = *(std::__shared_weak_count **)(v10 + 40);
  if (v14) {
    sub_100019F18(v14);
  }

  _Unwind_Resume(a1);
}

char *sub_10001A448(uint64_t a1)
{
  BaseAddress = *(__IOSurface **)(*(void *)(a1 + 32) + 8);
  if (BaseAddress) {
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  }
  if (*(_DWORD *)(a1 + 8)) {
    return (char *)BaseAddress + (*(_DWORD *)(a1 + 4) + *(_DWORD *)a1);
  }
  else {
    return 0;
  }
}

char *sub_10001A494(uint64_t a1)
{
  BaseAddress = *(__IOSurface **)(*(void *)(a1 + 32) + 8);
  if (BaseAddress) {
    BaseAddress = (__IOSurface *)IOSurfaceGetBaseAddress(BaseAddress);
  }
  if (*(_DWORD *)(a1 + 12)) {
    return (char *)BaseAddress + (*(_DWORD *)(a1 + 4) + *(_DWORD *)a1 + *(_DWORD *)(a1 + 8));
  }
  else {
    return 0;
  }
}

uint64_t sub_10001A4E8(uint64_t a1)
{
  unint64_t v2 = *(unsigned int *)(a1 + 32);
  if (v2)
  {
    unint64_t v3 = 0;
    uint64_t v4 = a1 + 40;
    do
    {
      uint64_t v5 = *(void *)(v4 + 8 * v3);
      if (v5)
      {
        sub_10001A564(v5);
        operator delete();
      }
      ++v3;
    }
    while (v3 < v2);
  }
  unsigned __int8 v6 = *(std::__shared_weak_count **)(a1 + 24);
  if (v6) {
    sub_100019F18(v6);
  }
  return a1;
}

uint64_t sub_10001A564(uint64_t a1)
{
  unint64_t v2 = *(unsigned int *)(a1 + 32);
  if (v2)
  {
    for (unint64_t i = 0; i < v2; ++i)
    {
      uint64_t v4 = *(void *)(a1 + 40 + 8 * i);
      if (v4)
      {
        uint64_t v5 = *(std::__shared_weak_count **)(v4 + 56);
        if (v5) {
          sub_100019F18(v5);
        }
        unsigned __int8 v6 = *(std::__shared_weak_count **)(v4 + 40);
        if (v6) {
          sub_100019F18(v6);
        }
        operator delete();
      }
    }
  }
  id v7 = *(std::__shared_weak_count **)(a1 + 24);
  if (v7) {
    sub_100019F18(v7);
  }
  return a1;
}

uint64_t sub_10001A5F8(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_10001A610(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void sub_10001A62C(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t sub_10001A648(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void sub_10001A654(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10001A670(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10001A698(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_10001A6B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t sub_10001A6C8(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2048;
  *(void *)(a4 + 14) = v4;
  return result;
}

void sub_10001A6E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10001A6FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_10001A714(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 1024;
  *(_DWORD *)(a4 + 14) = v4;
  return result;
}

void sub_10001A740(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

uint64_t sub_10001A770(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 2048;
  *(void *)(a2 + 14) = a3;
  return result;
}

void sub_10001A788(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0x12u);
}

void sub_10001A7B4(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x12u);
}

uint64_t sub_10001A7D0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
  *(float *)uint64_t v3 = a3;
  *(void *)(v3 + 4) = result;
  *(_WORD *)(v3 + 12) = 2048;
  *(void *)(v3 + 14) = a2;
  return result;
}

id sub_10001A7E8(id a1)
{
  return a1;
}

void sub_10001A804(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0x16u);
}

void sub_10001A824(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_10001A83C(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  return result;
}

uint64_t sub_10001A850(uint64_t result, float a2)
{
  *(float *)uint64_t v2 = a2;
  *(void *)(v2 + 4) = result;
  *(_WORD *)(v2 + 12) = 1024;
  *(_DWORD *)(v2 + 14) = 1;
  return result;
}

void sub_10001A86C(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x18u);
}

void sub_10001A888(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x12u);
}

uint64_t sub_10001A8A4@<X0>(uint64_t result@<X0>, int a2@<W8>, float a3@<S0>)
{
  *(float *)uint64_t v3 = a3;
  *(void *)(v3 + 4) = result;
  *(_WORD *)(v3 + 12) = 1024;
  *(_DWORD *)(v3 + 14) = a2;
  return result;
}

void sub_10001A8BC(uint64_t a1, uint64_t a2, int a3)
{
  *(_DWORD *)(a2 + 14) = v4;
  *(_WORD *)(a2 + 18) = v3;
  *(_DWORD *)(a2 + 20) = a3;
}

uint64_t sub_10001A90C(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 2112;
  return result;
}

void sub_10001B3B4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t sub_10001B3D4()
{
  return v0;
}

void sub_10001B424(id a1)
{
  byte_100057DE8 = MGGetBoolAnswer();
}

void sub_10001B490(id a1)
{
  int v2 = 0;
  size_t v1 = 4;
  if (!sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0)) {
    byte_100057DF8 = v2 != 0;
  }
}

void sub_10001B5A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B5B8(id a1)
{
  byte_100057E08 = 0;
}

void sub_10001B5C4(id a1)
{
  byte_100057E08 = MGGetBoolAnswer();
}

void sub_10001B6B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B6C4(id a1)
{
  id v5 = +[_ANEDeviceInfo aneSubType];
  size_t v1 = +[_ANEDeviceInfo aneSubTypeVariant];
  int v2 = +[_ANEDeviceInfo aneSubTypeProductVariant];
  uint64_t v3 = +[NSString stringWithFormat:@"%@%@%@", v5, v1, v2];
  int v4 = (void *)qword_100057E18;
  qword_100057E18 = v3;
}

void sub_10001B778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_10001B84C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B85C(id a1)
{
  qword_100057E28 = MGGetSInt64Answer();
}

void sub_10001BA10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BA24(uint64_t a1, uint64_t a2)
{
  if (a2 <= 159)
  {
    if (a2 <= 63)
    {
      switch(a2)
      {
        case 1:
        case 4:
          uint64_t v3 = (void *)qword_100057E38;
          CFStringRef v4 = @"h11";
          goto LABEL_35;
        case 2:
          uint64_t v3 = (void *)qword_100057E38;
          CFStringRef v4 = @"m9";
          goto LABEL_35;
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_38;
        case 8:
          uint64_t v3 = (void *)qword_100057E38;
          CFStringRef v4 = @"h12";
          goto LABEL_35;
        default:
          if (a2 == 32) {
            goto LABEL_32;
          }
          goto LABEL_38;
      }
    }
    if (a2 > 111)
    {
      if (a2 != 112 && a2 != 128)
      {
        if (a2 != 144) {
          goto LABEL_38;
        }
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    if (a2 != 64 && a2 != 96) {
      goto LABEL_38;
    }
LABEL_32:
    uint64_t v3 = (void *)qword_100057E38;
    CFStringRef v4 = @"h13";
LABEL_35:
    qword_100057E38 = (uint64_t)v4;

    return;
  }
  if (a2 <= 223)
  {
    if (a2 > 191)
    {
      if (a2 != 192)
      {
        if (a2 != 208) {
          goto LABEL_38;
        }
LABEL_29:
        uint64_t v3 = (void *)qword_100057E38;
        CFStringRef v4 = @"h16";
        goto LABEL_35;
      }
    }
    else
    {
      if (a2 == 160)
      {
LABEL_20:
        uint64_t v3 = (void *)qword_100057E38;
        CFStringRef v4 = @"h14";
        goto LABEL_35;
      }
      if (a2 != 176) {
        goto LABEL_38;
      }
    }
LABEL_30:
    uint64_t v3 = (void *)qword_100057E38;
    CFStringRef v4 = @"h15";
    goto LABEL_35;
  }
  if (a2 <= 255)
  {
    if (a2 != 224)
    {
      if (a2 == 240)
      {
        uint64_t v3 = (void *)qword_100057E38;
        CFStringRef v4 = @"m11";
        goto LABEL_35;
      }
      goto LABEL_38;
    }
    goto LABEL_30;
  }
  if (a2 == 256 || a2 == 272) {
    goto LABEL_29;
  }
  if (a2 == 512)
  {
    uint64_t v3 = (void *)qword_100057E38;
    CFStringRef v4 = @"h17";
    goto LABEL_35;
  }
LABEL_38:
  id v5 = (void *)qword_100057E38;
  qword_100057E38 = @"h15";

  uint64_t v6 = +[_ANELog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    objc_claimAutoreleasedReturnValue();
    sub_100031A74();
  }
}

void sub_10001BCAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001BCE4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_10001BE64(id a1, int64_t a2)
{
  *((void *)&v3 + 1) = a2;
  *(void *)&long long v3 = a2 - 64;
  unint64_t v2 = v3 >> 4;
  if (v2 > 0xD) {
    CFStringRef v4 = &stru_10004D218;
  }
  else {
    CFStringRef v4 = off_10004CDB8[v2];
  }
  id v5 = (void *)qword_100057E48;
  qword_100057E48 = (uint64_t)v4;
}

uint64_t sub_10001BE9C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_10001BFDC(id a1, int64_t a2)
{
  unint64_t v2 = (void *)qword_100057E58;
  qword_100057E58 = (uint64_t)&stru_10004D218;
}

uint64_t sub_10001BFF4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_10001C05C(id a1)
{
  qword_100057E68 = MGGetStringAnswer();
  _objc_release_x1();
}

void sub_10001C0F0(id a1)
{
  qword_100057E78 = MGGetStringAnswer();
  _objc_release_x1();
}

void sub_10001C28C(_Unwind_Exception *a1)
{
  CFStringRef v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10001C33C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ANEGetValidateNetworkSupportedVersion()
{
  uint64_t v0 = +[_ANEVirtualClient sharedConnection];

  if (v0)
  {
    size_t v1 = +[_ANEVirtualClient sharedConnection];
    id v2 = [v1 getValidateNetworkVersion];
  }
  else if (+[_ANEDeviceInfo isVirtualMachine])
  {
    long long v3 = +[_ANELog framework];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100031C34(v3);
    }

    id v2 = 0;
  }
  else
  {
    id v2 = (id)ANECGetValidateNetworkSupportedVersion();
  }
  CFStringRef v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100031BB4();
  }

  return v2;
}

void sub_10001C914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ANEValidateNetworkCreate(uint64_t a1, void *a2)
{
  CFStringRef v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    [a2 debugDescription];
    objc_claimAutoreleasedReturnValue();
    sub_100031E70();
  }

  id v5 = +[_ANEStrings vm_forceValidationOnGuestBootArg];
  unsigned int v6 = +[_ANEDeviceInfo isBoolBootArgSetTrue:v5];

  if (v6)
  {
    id v7 = +[_ANELog framework];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      +[_ANEStrings vm_forceValidationOnGuestBootArg];
      objc_claimAutoreleasedReturnValue();
      sub_100031E20();
    }
  }
  unsigned __int8 v8 = +[_ANEVirtualClient sharedConnection];
  if (v8) {
    char v9 = v6;
  }
  else {
    char v9 = 1;
  }

  if (v9)
  {
    if (ANECGetValidateNetworkSupportedVersion() != a1)
    {
      uint64_t v10 = +[_ANELog framework];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100031D08();
      }
    }
    NSErrorUserInfoKey v11 = +[_ANEDeviceInfo aneSubType];
    id v12 = +[_ANEDeviceInfo aneSubTypeVariant];
    NSErrorUserInfoKey v13 = +[_ANEDeviceInfo aneSubTypeProductVariant];
    __int16 v14 = +[NSString stringWithFormat:@"%@%@%@", v11, v12, v13];

    CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a2, @"architecture");
    CFStringRef v16 = Value;
    if (Value && CFStringCompare(Value, v14, 0))
    {
      MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, (CFDictionaryRef)a2);
      CFDictionaryReplaceValue(MutableCopy, @"architecture", v14);
      uint64_t v18 = MutableCopy;
      __int16 v19 = +[_ANELog framework];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v54 = [(__CFDictionary *)v18 debugDescription];
        *(_DWORD *)buffer = 136315906;
        *(void *)&buffer[4] = "ANEValidateNetworkCreate";
        __int16 v67 = 2112;
        CFStringRef v68 = v16;
        __int16 v69 = 2112;
        v70 = v14;
        __int16 v71 = 2112;
        v72 = v54;
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s: updating architecture from %@ to %@, inValidationParams: %@", buffer, 0x2Au);
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
    CFRelease(@"architecture");
    id Mutable = (id)ANECValidateNetworkCreate();
    if (v18) {
      CFRelease(v18);
    }

    goto LABEL_42;
  }
  *(void *)buffer = 0;
  CFDataRef v20 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a2, @"MIL");
  v73.length = CFDataGetLength(v20);
  v73.location = 0;
  CFDataGetBytes(v20, v73, buffer);
  id v21 = +[NSUUID UUID];
  IOSurfaceRef v22 = [v21 UUIDString];

  uint64_t v23 = +[_ANEStrings vm_tmpBaseDirectory];
  unsigned int v24 = +[NSString stringWithFormat:@"%@%@", v23, v22];

  uint64_t v25 = +[_ANEStrings defaultMILFileName];
  id v56 = +[NSString stringWithFormat:@"%@/%@", v24, v25];

  size_t v26 = +[_ANEStrings defaultWeightFileName];
  id v55 = +[NSString stringWithFormat:@"%@/%@", v24, v26];

  char v65 = 0;
  v27 = +[NSFileManager defaultManager];
  uint64_t v28 = (MIL::Text::SerializerOptions *)[v27 fileExistsAtPath:v24 isDirectory:&v65];
  if (v28) {
    goto LABEL_23;
  }
  id v64 = 0;
  unsigned __int8 v29 = [v27 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:0 error:&v64];
  id v30 = v64;
  v31 = v30;
  if (v29)
  {

LABEL_23:
    MIL::Text::SerializerOptions::Make(&v63, v28);
    uint64_t v32 = v63;
    sub_10001D8BC(__p, (char *)[v56 cStringUsingEncoding:4]);
    (*(void (**)(uint64_t, void **))(*(void *)v32 + 24))(v32, __p);
    if (v62 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v33 = v63;
    sub_10001D8BC(v59, (char *)[v55 cStringUsingEncoding:4]);
    (*(void (**)(uint64_t, void **))(*(void *)v33 + 128))(v33, v59);
    if (v60 < 0) {
      operator delete(v59[0]);
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)v63 + 112))(v63, 4);
    uint64_t v34 = v63;
    id v35 = v24;
    sub_10001D8BC(v57, (char *)[v35 cStringUsingEncoding:4]);
    (*(void (**)(uint64_t, void **))(*(void *)v34 + 56))(v34, v57);
    if (v58 < 0) {
      operator delete(v57[0]);
    }
    MIL::Text::SerializeToFile();
    int v36 = (id)CFDictionaryGetValue((CFDictionaryRef)a2, @"function");
    CFDictionaryRef v37 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a2, @"parameters");
    __int16 v38 = (id)CFDictionaryGetValue(v37, @"scratchPadPath");
    id v39 = +[_ANEVirtualClient sharedConnection];
    id Mutable = [v39 validateNetworkCreate:a1 uuid:v22 function:v36 directoryPath:v35 scratchPadPath:v38];

    int v41 = +[NSFileManager defaultManager];
    unsigned int v42 = [v41 fileExistsAtPath:v35];

    if (v42)
    {
      int v43 = +[NSFileManager defaultManager];
      [v43 removeItemAtPath:v35 error:0];
    }
    uint64_t v44 = v63;
    uint64_t v63 = 0;
    if (v44) {
      (*(void (**)(uint64_t))(*(void *)v44 + 8))(v44);
    }
    char v45 = 1;
    goto LABEL_41;
  }
  v46 = +[_ANELog framework];
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
    sub_100031D94((uint64_t)v31, v46);
  }

  char v45 = 0;
  id Mutable = 0;
LABEL_41:

  if ((v45 & 1) == 0) {
    return 0;
  }
LABEL_42:
  if (!Mutable)
  {
    id v47 = ANEGetValidateNetworkSupportedVersion();
    id Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v48 = +[NSNumber numberWithLongLong:v47];
    [Mutable setValue:v48 forKey:@"resultsVersion"];

    v49 = objc_opt_new();
    [v49 setValue:&__kCFBooleanFalse forKey:@"support"];
    v50 = +[_ANEVirtualClient sharedConnection];
    if (!v50) {
      unsigned int v6 = 1;
    }

    if (v6) {
      CFStringRef v51 = @"Unable to get validationResult";
    }
    else {
      CFStringRef v51 = @"Unable to get validationResult (host might be too old)";
    }
    [v49 setValue:v51 forKey:@"errorMsg"];
    [Mutable setValue:v49 forKey:@"-1"];
  }
  v52 = +[_ANELog framework];
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
  {
    [Mutable debugDescription];
    objc_claimAutoreleasedReturnValue();
    sub_100031CB8();
  }

  return Mutable;
}

void sub_10001D168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33)
{
  _Unwind_Resume(a1);
}

id ANEValidateNetworkCreateVMHost(uint64_t a1, const void *a2, void *a3, const void *a4)
{
  id v7 = a3;
  MIL::Text::SerializerOptions::Make(&v31, v7);
  unsigned __int8 v8 = (MIL::Opsets::Common *)(*(uint64_t (**)(uint64_t))(*(void *)v31 + 104))(v31);
  char v9 = (MIL::ParserOptions *)MIL::Opsets::Common::CreateMILContext(&v30, v8);
  MIL::ParserOptions::Make(&v29, v9);
  uint64_t v10 = v29;
  NSErrorUserInfoKey v11 = v7;
  sub_10001D8BC(__p, (char *)[(MIL::Text::SerializerOptions *)v11 cStringUsingEncoding:4]);
  (*(void (**)(uint64_t, void **, uint64_t))(*(void *)v10 + 32))(v10, __p, 1);
  if (v28 < 0) {
    operator delete(__p[0]);
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)v29 + 64))(v29, 1);
  (*(void (**)(uint64_t, MIL::Opsets::Common *))(*(void *)v29 + 96))(v29, v8);
  v25[1] = v30;
  if (v30) {
    operator new();
  }
  v25[2] = 0;
  uint64_t v30 = 0;
  MIL::Text::ParseProgramFromFile();
  id Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  NSErrorUserInfoKey v13 = +[_ANEDeviceInfo aneSubType];
  __int16 v14 = +[_ANEDeviceInfo aneSubTypeVariant];
  id v15 = +[_ANEDeviceInfo aneSubTypeProductVariant];
  CFStringRef v16 = +[NSString stringWithFormat:@"%@%@%@", v13, v14, v15];

  CFDictionarySetValue(Mutable, @"architecture", v16);
  CFDictionarySetValue(Mutable, @"function", a2);
  v25[0] = v26;
  __int16 v17 = +[NSData dataWithBytes:v25 length:8];
  CFDictionarySetValue(Mutable, @"MIL", v17);
  uint64_t v18 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v18, @"scratchPadPath", a4);
  CFDictionarySetValue(Mutable, @"parameters", v18);
  id v19 = ANEValidateNetworkCreate(a1, Mutable);
  CFRelease(Mutable);
  CFRelease(v18);

  uint64_t v20 = v26;
  uint64_t v26 = 0;
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
  uint64_t v21 = v29;
  uint64_t v29 = 0;
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
  }
  uint64_t v22 = v30;
  uint64_t v30 = 0;
  if (v22) {
    (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
  }
  uint64_t v23 = v31;
  uint64_t v31 = 0;
  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
  }

  return v19;
}

void sub_10001D738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24)
{
  if (a23) {
    (*(void (**)(uint64_t))(*(void *)a23 + 8))(a23);
  }
  if (a24) {
    (*(void (**)(uint64_t))(*(void *)a24 + 8))(a24);
  }
  uint64_t v27 = *(void *)(v25 - 88);
  *(void *)(v25 - 88) = 0;
  if (v27) {
    (*(void (**)(uint64_t))(*(void *)v27 + 8))(v27);
  }

  _Unwind_Resume(a1);
}

void sub_10001D8A8(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

void *sub_10001D8BC(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_10001D970();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unsigned int v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unsigned int v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_10001D970()
{
}

void sub_10001D988(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10001D9E4(exception, a1);
}

void sub_10001D9D0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10001D9E4(std::logic_error *a1, const char *a2)
{
  id result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_10001DA1C(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_10001DA54(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_10001DA84(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
    return 0;
  }
}

BOOL sub_10001DAC8(uint64_t a1, uint64_t a2)
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

uint64_t sub_10001DB18@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  return result;
}

void sub_10001DB2C(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id sub_10001DC48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v2 = +[NSNumber numberWithLongLong:v1];
  unsigned int v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

void sub_10001E0B4(id a1)
{
  uint64_t v1 = +[NSMutableDictionary dictionary];
  uint64_t v2 = (void *)qword_100057E88;
  qword_100057E88 = v1;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = +[_ANEStrings ppsCategoryForANE];
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v19;
    *(void *)&long long v5 = 138412290;
    long long v16 = v5;
    do
    {
      for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend((id)qword_100057E88, "objectForKey:", v9, v16);
        NSErrorUserInfoKey v11 = +[_ANELog common];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v16;
          uint64_t v23 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Telemetry: add identifier %@.", buf, 0xCu);
        }

        uint64_t v17 = 0;
        id v12 = +[_ANEStrings ppsSubsystemForANE];
        uint64_t v13 = PPSCreateTelemetryIdentifier();

        uint64_t v17 = v13;
        if (v13)
        {
          uint64_t v14 = +[NSValue value:&v17 withObjCType:"^{PPSTelemetryIdentifier=}"];

          [(id)qword_100057E88 setObject:v14 forKeyedSubscript:v9];
          uint64_t v10 = (void *)v14;
        }
        else
        {
          id v15 = +[_ANELog common];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            uint64_t v23 = v9;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Telemetry: could not create ppsId for %@!", buf, 0xCu);
          }
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v6);
  }
}

void sub_10001E4EC(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) modelDataVaultDirectory];
  uint64_t v1 = +[_ANEDeviceInfo buildVersion];
  uint64_t v2 = [v4 stringByAppendingPathComponent:v1];
  uint64_t v3 = (void *)qword_100057EA0;
  qword_100057EA0 = v2;
}

void sub_10001E60C(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) userModelDataVaultDirectory];
  uint64_t v1 = +[_ANEDeviceInfo buildVersion];
  uint64_t v2 = [v4 stringByAppendingPathComponent:v1];
  uint64_t v3 = (void *)qword_100057EB0;
  qword_100057EB0 = v2;
}

void sub_10001E744(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) modelDataVaultDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"tmp"];
  uint64_t v2 = (void *)qword_100057EC0;
  qword_100057EC0 = v1;
}

void sub_10001E844(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) modelDataVaultDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"clones"];
  uint64_t v2 = (void *)qword_100057ED0;
  qword_100057ED0 = v1;
}

void sub_10001E944(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) userModelDataVaultDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"tmp"];
  uint64_t v2 = (void *)qword_100057EE0;
  qword_100057EE0 = v1;
}

void sub_10001EA44(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) userModelDataVaultDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"clones"];
  uint64_t v2 = (void *)qword_100057EF0;
  qword_100057EF0 = v1;
}

void sub_10001F240(id a1)
{
  uint64_t v1 = (void *)qword_100057EF8;
  qword_100057EF8 = @"zeroModel";
}

void sub_10001F2AC(id a1)
{
  uint64_t v1 = (void *)qword_100057F08;
  qword_100057F08 = @"threeSixtyModel";
}

void sub_10001F318(id a1)
{
  uint64_t v1 = (void *)qword_100057F18;
  qword_100057F18 = (uint64_t)&off_1000504D8;
}

void sub_10001F384(id a1)
{
  uint64_t v1 = (void *)qword_100057F28;
  qword_100057F28 = (uint64_t)&off_1000504F0;
}

void sub_10001F408(id a1)
{
  uint64_t v1 = (void *)qword_100057F38;
  qword_100057F38 = @"/System/Library/PrivateFrameworks/VideoProcessing.framework/cnn_frame_enhancer_96p.H16.espresso.hwx";
}

void sub_10001FB48(id a1)
{
  off_100057B58 = os_log_create("com.apple.ane", "aned");
  _objc_release_x1();
}

void sub_10001FBE0(id a1)
{
  off_100057B60 = os_log_create("com.apple.ane", "client");
  _objc_release_x1();
}

void sub_10001FC78(id a1)
{
  off_100057B68 = os_log_create("com.apple.ane", "compiler");
  _objc_release_x1();
}

void sub_10001FD10(id a1)
{
  off_100057B70 = os_log_create("com.apple.ane", "maintenance");
  _objc_release_x1();
}

void sub_10001FDA8(id a1)
{
  off_100057B78 = os_log_create("com.apple.ane", "anetool");
  _objc_release_x1();
}

void sub_10001FE40(id a1)
{
  off_100057B80 = os_log_create("com.apple.ane", "common");
  _objc_release_x1();
}

void sub_10001FED8(id a1)
{
  off_100057B88 = os_log_create("com.apple.ane", "tests");
  _objc_release_x1();
}

void sub_100020CBC(id a1)
{
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.aned.modelCacheAsyncIO", v1);
  id v3 = (void *)qword_100057F88;
  qword_100057F88 = (uint64_t)v2;

  qword_100057F90 = +[_ANELog daemon];
  _objc_release_x1();
}

void sub_10002142C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_100021460(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100021470(uint64_t a1)
{
}

void sub_100021478(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = [v5 copy];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  NSErrorUserInfoKey v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void sub_1000225F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)qword_100057F90;
  if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_ERROR)) {
    sub_10003227C(a1, v4, (uint64_t)v3);
  }
}

void sub_100022654(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)qword_100057F90;
  if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_INFO))
  {
    id v5 = *(const char **)(a1 + 32);
    id v6 = v4;
    uint64_t v7 = NSStringFromSelector(v5);
    uint64_t v8 = +[NSNumber numberWithBool:a2];
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@: status=%@", (uint8_t *)&v9, 0x16u);
  }
}

void sub_100022824(uint64_t a1)
{
  [*(id *)(a1 + 32) UTF8String];
  id v3 = (id)os_transaction_create();
  [*(id *)(a1 + 40) startDanglingModelGC];
}

uint64_t sub_100023114(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)qword_100057F90;
  if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_ERROR))
  {
    int v9 = *(const char **)(a1 + 32);
    uint64_t v10 = v7;
    __int16 v11 = NSStringFromSelector(v9);
    int v12 = 138412802;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@: URL=%@ : error=%@", (uint8_t *)&v12, 0x20u);
  }
  return 0;
}

void sub_100023890(_Unwind_Exception *a1)
{
  sub_1000238C4(v1 - 192);
  _Unwind_Resume(a1);
}

void sub_1000238C4(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(a1 + 48);
}

void sub_100023950(id a1)
{
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.aned.storageAsyncIO", v1);
  id v3 = (void *)qword_100057FA0;
  qword_100057FA0 = (uint64_t)v2;

  qword_100057FA8 = +[_ANELog daemon];
  _objc_release_x1();
}

void sub_100024270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000242BC(uint64_t a1, void *a2, size_t a3)
{
  if (munmap(a2, a3) == -1)
  {
    id v6 = (void *)qword_100057FA8;
    if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(const char **)(a1 + 32);
      uint64_t v8 = v6;
      int v9 = NSStringFromSelector(v7);
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = *__error();
      int v12 = __error();
      uint64_t v13 = strerror(*v12);
      int v14 = 138413570;
      id v15 = v9;
      __int16 v16 = 2080;
      uint64_t v17 = v10;
      __int16 v18 = 2048;
      long long v19 = a2;
      __int16 v20 = 2048;
      size_t v21 = a3;
      __int16 v22 = 1024;
      int v23 = v11;
      __int16 v24 = 2080;
      uint64_t v25 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@: munmap(%s) failed. bytes=%p : len=%lu errno=%d : %s", (uint8_t *)&v14, 0x3Au);
    }
  }
}

uint64_t sub_1000243FC(uint64_t a1)
{
  return close(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

void sub_100024900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100024938(uint64_t a1, void *a2, size_t a3)
{
  if (munmap(a2, a3) == -1)
  {
    id v6 = (void *)qword_100057FA8;
    if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(const char **)(a1 + 32);
      uint64_t v8 = v6;
      int v9 = NSStringFromSelector(v7);
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = *__error();
      int v12 = __error();
      uint64_t v13 = strerror(*v12);
      int v14 = 138413570;
      id v15 = v9;
      __int16 v16 = 2080;
      uint64_t v17 = v10;
      __int16 v18 = 2048;
      long long v19 = a2;
      __int16 v20 = 2048;
      size_t v21 = a3;
      __int16 v22 = 1024;
      int v23 = v11;
      __int16 v24 = 2080;
      uint64_t v25 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@: munmap(%s) failed. bytes=%p : len=%lu errno=%d : %s", (uint8_t *)&v14, 0x3Au);
    }
  }
}

uint64_t sub_100024A78(uint64_t a1)
{
  return close(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

uint64_t sub_100025A14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)qword_100057FA8;
  if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_ERROR))
  {
    int v9 = *(const char **)(a1 + 32);
    uint64_t v10 = v7;
    int v11 = NSStringFromSelector(v9);
    int v12 = 138412802;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@: URL=%@ : error=%@", (uint8_t *)&v12, 0x20u);
  }
  return 1;
}

void sub_1000278D0(_Unwind_Exception *a1)
{
  sub_1000238C4(v1 - 192);
  _Unwind_Resume(a1);
}

void sub_1000291AC(uint64_t a1)
{
  [*(id *)(a1 + 32) UTF8String];
  id v3 = (id)os_transaction_create();
  [*(id *)(a1 + 40) removeStaleModels];
}

void sub_1000296A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state)
  {
    if (state == 2)
    {
      *(void *)&long long v24 = 0;
      *((void *)&v24 + 1) = &v24;
      uint64_t v25 = 0x2020000000;
      BOOL v26 = 0;
      BOOL v26 = xpc_activity_set_state(v3, 4);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100029988;
      v16[3] = &unk_10004D158;
      id v17 = *(id *)(a1 + 32);
      __int16 v18 = v3;
      long long v19 = &v24;
      id v5 = objc_retainBlock(v16);
      id v6 = +[_ANELog daemon];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = [*(id *)(a1 + 32) name];
        int v8 = *(unsigned __int8 *)(*((void *)&v24 + 1) + 24);
        *(_DWORD *)buf = 138412546;
        size_t v21 = v7;
        __int16 v22 = 1024;
        int v23 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Running activity %@, extended=%d", buf, 0x12u);
      }
      if (*(unsigned char *)(*((void *)&v24 + 1) + 24))
      {
        int v9 = [*(id *)(a1 + 32) queue];
        dispatch_async(v9, v5);
      }
      else
      {
        ((void (*)(void *))v5[2])(v5);
      }

      _Block_object_dispose(&v24, 8);
    }
  }
  else
  {
    uint64_t v10 = +[_ANELog daemon];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = [*(id *)(a1 + 32) name];
      LODWORD(v24) = 138412290;
      *(void *)((char *)&v24 + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Checking-in activity %@", (uint8_t *)&v24, 0xCu);
    }
    xpc_object_t v12 = xpc_activity_copy_criteria(v3);
    if (!v12
      || ([*(id *)(a1 + 32) executionCriteria],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          BOOL v14 = xpc_equal(v12, v13),
          v13,
          !v14))
    {
      id v15 = [*(id *)(a1 + 32) executionCriteria];
      xpc_activity_set_criteria(v3, v15);
    }
  }
}

void sub_100029960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100029988(uint64_t a1)
{
  getpid();
  proc_set_cpumon_params();
  id v2 = [*(id *)(a1 + 32) name];
  [v2 UTF8String];
  id v3 = (void *)os_transaction_create();

  id v5 = [*(id *)(a1 + 32) handler];
  v5[2]();

  getpid();
  proc_set_cpumon_defaults();
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5);
  id v6 = +[_ANELog daemon];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [*(id *)(a1 + 32) name];
    int v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Done running activity %@, extended=%d", (uint8_t *)&v9, 0x12u);
  }
}

void sub_100029C14(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100029D3C(_Unwind_Exception *a1)
{
  uint64_t v7 = v6;

  _Unwind_Resume(a1);
}

void sub_100029F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002ADEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,uint64_t a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v51 - 192), 8);

  _Unwind_Resume(a1);
}

uint64_t sub_10002B0C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002B0D4(uint64_t a1)
{
}

uint64_t sub_10002B0DC(uint64_t a1, int a2, CFTypeRef cf)
{
  CFRetain(cf);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = cf;

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return kdebug_trace();
}

void sub_10002C090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v49 - 192), 8);

  _Unwind_Resume(a1);
}

void sub_10002C3BC(uint64_t a1, int a2, CFTypeRef cf)
{
  CFRetain(cf);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = cf;

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

uint64_t sub_10002C414(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = 0;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  return result;
}

void sub_10002C434(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x20u);
}

void sub_10002C450(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

uint64_t sub_10002C46C(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2112;
  *(void *)(a4 + 14) = v4;
  return result;
}

void sub_10002D218(_Unwind_Exception *a1)
{
  sub_1000238C4(v1 - 208);
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    id v3 = +[_ANELog compiler];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100033090(v3);
    }
  }
  uint64_t v4 = objc_opt_new();
  id v5 = +[NSXPCListener serviceListener];
  [v5 setDelegate:v4];
  [v5 resume];

  return 0;
}

void sub_10002D778(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002D790(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002D7A0(uint64_t a1)
{
}

void sub_10002D7A8(uint64_t a1)
{
  id v2 = +[_ANELog compiler];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:kANEFModelTypeKey[0]];
  unsigned int v4 = [v3 isEqualToString:kANEFModelANECIRValue[0]];

  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:kANEFModelTypeKey[0]];
  unsigned int v6 = [v5 isEqualToString:kANEFModelMILValue[0]];

  if (v4) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v86 = [*(id *)(a1 + 32) objectForKeyedSubscript:kANEFNetPlistFilenameKey[0]];
    int v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:kANEFCompilerOptionsFilenameKey[0]];
    v84 = [*(id *)(a1 + 32) objectForKeyedSubscript:kANEFModelIsEncryptedKey[0]];
    id v9 = [v84 BOOLValue];
    uint64_t v10 = v2;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000332C8(a1, (char)v9, v10);
    }

    unsigned __int8 v91 = 0;
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = (uint64_t *)(a1 + 40);
    id v90 = 0;
    int64_t v14 = +[_ANESandboxingHelper consumeSandboxExtension:v11 forModel:v12 error:&v90];
    id v15 = v90;
    uint64_t v83 = v14;
    v85 = v15;
    if (v14 < 0 && v15)
    {
      uint64_t v16 = *(void *)(a1 + 96);
      id v17 = NSStringFromSelector(*(SEL *)(a1 + 112));
      +[_ANEErrors fileAccessErrorForMethod:v17];
      v19 = __int16 v18 = v8;
      __int16 v20 = &__NSDictionary0__struct;
      (*(void (**)(uint64_t, void, void *, void *))(v16 + 16))(v16, 0, &__NSDictionary0__struct, v19);

      int v8 = v18;
      objc_msgSend(*(id *)(a1 + 48), "string_id");
      kdebug_trace();
      size_t v21 = v84;
LABEL_50:

      goto LABEL_51;
    }
    long long v24 = +[_ANECloneHelper cloneIfWritable:*(void *)(a1 + 48) isEncryptedModel:v9 cloneDirectory:*(void *)(a1 + 56)];
    if (!v24) {
      (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    }
    objc_msgSend(*(id *)(a1 + 48), "string_id");
    if (v4)
    {
      kdebug_trace();
      uint64_t v25 = v10;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        id v55 = NSStringFromSelector(*(SEL *)(a1 + 112));
        v76 = *(void **)(a1 + 64);
        v72 = [*(id *)(a1 + 48) modelURL];
        v74 = [*(id *)(a1 + 48) sourceURL];
        uint64_t v56 = [*(id *)(a1 + 48) key];
        uint64_t v57 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 138413826;
        v93 = v55;
        __int16 v94 = 2112;
        v95 = v76;
        __int16 v96 = 2112;
        v97 = v72;
        __int16 v98 = 2112;
        v99 = v74;
        __int16 v100 = 2112;
        v101 = v24;
        __int16 v102 = 2112;
        uint64_t v103 = v56;
        char v58 = (void *)v56;
        __int16 v104 = 2112;
        uint64_t v105 = v57;
        _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%@: ANECIRModel : bundleId=%@ model.modelURL=%@ model.sourceURL=%@ modelURL=%@ key=%@ output=%@", buf, 0x48u);
      }
      BOOL v26 = [*(id *)(a1 + 48) sourceURL];
      uint64_t v27 = *(void **)(a1 + 48);
      if (v26) {
        [v27 sourceURL];
      }
      else {
      uint64_t v34 = [v27 modelURL];
      }

      uint64_t v35 = *(void *)(a1 + 64);
      uint64_t v36 = *(void *)(a1 + 72);
      uint64_t v37 = *(void *)(a1 + 80);
      uint64_t v38 = *(void *)(a1 + 32);
      uint64_t v39 = *(void *)(*(void *)(a1 + 104) + 8);
      id obj = *(id *)(v39 + 40);
      LOBYTE(v70) = (_BYTE)v9;
      __int16 v20 = +[_ANECVAIRCompiler compileModelAt:v24 csIdentity:v35 plistFilename:v86 optionsFilename:v8 outputURL:v36 saveSourceURL:v34 aotModelBinaryPath:v37 isEncryptedModel:v70 options:v38 ok:&v91 error:&obj];
      objc_storeStrong((id *)(v39 + 40), obj);
      objc_msgSend(*(id *)(a1 + 48), "string_id");
    }
    else
    {
      if ((v6 & 1) == 0)
      {
        kdebug_trace();
        uint64_t v31 = v10;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v66 = NSStringFromSelector(*(SEL *)(a1 + 112));
          v78 = *(void **)(a1 + 64);
          CFRange v73 = [*(id *)(a1 + 48) modelURL];
          v75 = [*(id *)(a1 + 48) sourceURL];
          uint64_t v67 = [*(id *)(a1 + 48) key];
          uint64_t v68 = *(void *)(a1 + 72);
          *(_DWORD *)buf = 138413826;
          v93 = v66;
          __int16 v94 = 2112;
          v95 = v78;
          __int16 v96 = 2112;
          v97 = v73;
          __int16 v98 = 2112;
          v99 = v75;
          __int16 v100 = 2112;
          v101 = v24;
          __int16 v102 = 2112;
          uint64_t v103 = v67;
          __int16 v69 = (void *)v67;
          __int16 v104 = 2112;
          uint64_t v105 = v68;
          _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%@: CoreMLModel: bundleId=%@ model.modelURL=%@ model.sourceURL=%@ modelURL=%@ key=%@ output=%@", buf, 0x48u);
        }
        uint64_t v32 = [*(id *)(a1 + 48) sourceURL];
        uint64_t v33 = *(void **)(a1 + 48);
        if (v32) {
          [v33 sourceURL];
        }
        else {
        uint64_t v34 = [v33 modelURL];
        }

        v79 = [v34 path];
        char v45 = [*(id *)(a1 + 48) key];
        uint64_t v46 = *(void *)(a1 + 80);
        uint64_t v47 = *(void *)(a1 + 32);
        uint64_t v48 = *(void *)(*(void *)(a1 + 104) + 8);
        id v88 = *(id *)(v48 + 40);
        LOBYTE(v71) = (_BYTE)v9;
        __int16 v20 = +[_ANECoreMLModelCompiler compileModelAt:csIdentity:key:optionsFilename:tempDirectory:outputURL:saveSourceModelPath:aotModelBinaryPath:isEncryptedModel:options:ok:error:](_ANECoreMLModelCompiler, "compileModelAt:csIdentity:key:optionsFilename:tempDirectory:outputURL:saveSourceModelPath:aotModelBinaryPath:isEncryptedModel:options:ok:error:", v79, v46, v71, v47, &v91, &v88);
        objc_storeStrong((id *)(v48 + 40), v88);

        objc_msgSend(*(id *)(a1 + 48), "string_id");
        kdebug_trace();

        goto LABEL_39;
      }
      kdebug_trace();
      char v28 = v10;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v80 = NSStringFromSelector(*(SEL *)(a1 + 112));
        v81 = v8;
        char v62 = *(void **)(a1 + 64);
        v77 = [*(id *)(a1 + 48) modelURL];
        uint64_t v63 = [*(id *)(a1 + 48) sourceURL];
        [*(id *)(a1 + 48) key];
        id v64 = v82 = v24;
        uint64_t v65 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 138413826;
        v93 = v80;
        __int16 v94 = 2112;
        v95 = v62;
        int v8 = v81;
        __int16 v96 = 2112;
        v97 = v77;
        __int16 v98 = 2112;
        v99 = v63;
        __int16 v100 = 2112;
        v101 = v82;
        __int16 v102 = 2112;
        uint64_t v103 = (uint64_t)v64;
        __int16 v104 = 2112;
        uint64_t v105 = v65;
        _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%@: MILModel : bundleId=%@ model.modelURL=%@ model.sourceURL=%@ modelURL=%@ key=%@ output=%@", buf, 0x48u);

        long long v24 = v82;
      }

      if (!v86)
      {
        v86 = +[_ANEStrings defaultMILFileName];
      }
      uint64_t v29 = [*(id *)(a1 + 48) sourceURL];
      uint64_t v30 = *(void **)(a1 + 48);
      if (v29) {
        [v30 sourceURL];
      }
      else {
      uint64_t v34 = [v30 modelURL];
      }

      uint64_t v40 = *(void *)(a1 + 64);
      uint64_t v41 = *(void *)(a1 + 72);
      uint64_t v42 = *(void *)(a1 + 80);
      uint64_t v43 = *(void *)(a1 + 32);
      uint64_t v44 = *(void *)(*(void *)(a1 + 104) + 8);
      id v87 = *(id *)(v44 + 40);
      LOBYTE(v70) = (_BYTE)v9;
      __int16 v20 = +[_ANEMILCompiler compileModelAt:v24 modelName:v86 csIdentity:v40 optionsFilename:v8 outputURL:v41 saveSourceURL:v34 aotModelBinaryPath:v42 isEncryptedModel:v70 options:v43 ok:&v91 error:&v87];
      objc_storeStrong((id *)(v44 + 40), v87);
      objc_msgSend(*(id *)(a1 + 48), "string_id");
    }
    kdebug_trace();
LABEL_39:

    int v49 = v91;
    v50 = v10;
    uint64_t v51 = v50;
    if (v49)
    {
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v52 = NSStringFromSelector(*(SEL *)(a1 + 112));
        v53 = *(void **)(a1 + 72);
        *(_DWORD *)buf = 138413058;
        v93 = v52;
        __int16 v94 = 2112;
        v95 = v24;
        __int16 v96 = 2112;
        v97 = v53;
        __int16 v98 = 2112;
        v99 = v20;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%@: SUCCESS: model=%@ : output=%@ : lAttr=%@ : lErr=(nil)", buf, 0x2Au);
      }
    }
    else if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v59 = NSStringFromSelector(*(SEL *)(a1 + 112));
      char v60 = *(void **)(a1 + 72);
      v61 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
      *(_DWORD *)buf = 138413314;
      v93 = v59;
      __int16 v94 = 2112;
      v95 = v24;
      __int16 v96 = 2112;
      v97 = v60;
      __int16 v98 = 2112;
      v99 = v20;
      __int16 v100 = 2112;
      v101 = v61;
      _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%@: ERROR: model=%@ : output=%@ : lAttr=%@ : lErr=%@", buf, 0x34u);
    }
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    unsigned __int8 v91 = +[_ANESandboxingHelper releaseSandboxExtension:*v13 handle:v83];
    size_t v21 = v84;
    if ((v91 & 1) == 0)
    {
      v54 = v51;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        sub_100033210(v13, v83, v54);
      }
    }
    goto LABEL_50;
  }
  __int16 v22 = v2;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_100033148(a1, v22);
  }

  (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
LABEL_51:
}

void sub_10002E20C()
{
  sub_10000432C();
  uint64_t v1 = NSStringFromSelector(v0);
  sub_1000042F4();
  sub_10000430C((void *)&_mh_execute_header, v2, v3, "%@: client(%d) : SecTaskCreateWithAuditToken() failed", v4, v5, v6, v7, v8);
}

void sub_10002E298()
{
  sub_10000432C();
  uint64_t v1 = NSStringFromSelector(v0);
  sub_1000042F4();
  sub_10000430C((void *)&_mh_execute_header, v2, v3, "%@: client(%d) : missing signingIdentifier", v4, v5, v6, v7, v8);
}

void sub_10002E324()
{
  sub_10000432C();
  uint64_t v1 = NSStringFromSelector(v0);
  sub_1000042F4();
  sub_10000430C((void *)&_mh_execute_header, v2, v3, "%@: client(%d) : missing teamIdentity", v4, v5, v6, v7, v8);
}

void sub_10002E3B0(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412802;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 128;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@: [request ioSurfacesCount]=%lu is invalid. Expected: (1 - %d)", buf, 0x1Cu);
}

void sub_10002E428(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@: Virtual Machine environment detected but no virtualClient available.", buf, 0xCu);
}

void sub_10002E480(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@: Write ane stats raw data", buf, 0xCu);
}

void sub_10002E4D8(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@: Write perf counters", buf, 0xCu);
}

void sub_10002E530()
{
  sub_1000078C8();
  *(_DWORD *)uint64_t v1 = 138412290;
  *(void *)(v1 + 4) = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@: ANEDeviceController calling ANECheckPrivilegedVMAccess", v4, 0xCu);
}

void sub_10002E584()
{
  sub_1000078C8();
  sub_1000078B0(v1, v2, v3, 5.778e-34);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@: ANEDeviceOpen() failed : ret=%u :", v4, 0x12u);
}

void sub_10002E5D8()
{
  sub_1000078C8();
  *(_DWORD *)uint64_t v1 = 138412290;
  *(void *)(v1 + 4) = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@: ANEDeviceController not instantiated in VM", v4, 0xCu);
}

void sub_10002E62C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_10002E6A4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_10002E71C()
{
  sub_1000078C8();
  sub_1000078B0(v1, v2, v3, 5.778e-34);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@: ANEDeviceClose() failed : ret=%u :", v4, 0x12u);
}

void sub_10002E770()
{
  sub_100009F00();
  sub_100009EE4(v1, v2, v3, 5.778e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "-----> %@: ANEProgramProcessRequestDirect() enableFWToFWSignal option not nil value is %d ", v4, 0x12u);
}

void sub_10002E7C0()
{
  sub_100009F00();
  sub_100009EE4(v1, v2, v3, 5.778e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "-----> %@: ANEProgramProcessRequestDirect() disableIOFences option not nil value is %d ", v4, 0x12u);
}

void sub_10002E810()
{
  sub_100009F00();
  uint64_t v2 = *(void *)(v1 + 32);
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)(v3 + 4) = v4;
  *(_WORD *)(v3 + 12) = 2112;
  *(void *)(v3 + 14) = v2;
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@: Expecting EventPayLoad lModel=%@", v5, 0x16u);
}

void sub_10002E874()
{
  sub_10001A68C();
  sub_10001A6E0((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient Iterator was NULL not avpANE.\n", v2, v3, v4, v5, v6);
}

void sub_10002E8A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E918()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@: No Virtual Device available", v5);
}

void sub_10002E95C()
{
  sub_10001A68C();
  sub_10001A6E0((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient Calling functions from userspace to kernel space...\n\n", v2, v3, v4, v5, v6);
}

void sub_10002E990()
{
  sub_10001A68C();
  sub_10001A6E0((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient No matching drivers found.\n", v2, v3, v4, v5, v6);
}

void sub_10002E9C4()
{
  sub_10001A68C();
  sub_10001A6E0((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient FAILED IOSERVICE OPEN", v2, v3, v4, v5, v6);
}

void sub_10002E9F8(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Found a device of class AppleVirtIONeuralEngineDevice", buf, 2u);
}

void sub_10002EA38()
{
  sub_10001A920();
  sub_10001A740((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient IOServiceGetMatchingServices returned 0x%08x\n\n", v2, v3, v4, v5, v6);
}

void sub_10002EAA0()
{
  sub_10001A68C();
  sub_10001A6E0((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient sysctl kern.hv_vmm_present returned false", v2, v3, v4, v5, v6);
}

void sub_10002EAD4()
{
  sub_100009F00();
  sub_10001A5F8(v1, v2, v3, 5.778e-34);
  sub_10001A610((void *)&_mh_execute_header, "%@: ANEVirtualClient unarchive error %@ \n", v4, v5);
}

void sub_10002EB18()
{
  sub_100009F00();
  sub_10001A5F8(v1, v2, v3, 5.778e-34);
  sub_10001A610((void *)&_mh_execute_header, "%@: ANEVirtualClient CompileModel succeeded for MODEL: %@ \n", v4, v5);
}

void sub_10002EB5C()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient failed to call compileModel dictionary method", v2, v3, v4, v5, v6);
}

void sub_10002EB90()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient compileModel dictionary call succeeded", v5);
}

void sub_10002EBD4()
{
  sub_10001A68C();
  sub_10001A6E0((void *)&_mh_execute_header, v0, v1, "_ANEVirtualClient calling dictionary compileModel method", v2, v3, v4, v5, v6);
}

void sub_10002EC08()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@:ANEVirtualClient start\n", v5);
}

void sub_10002EC4C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  v5[1] = *(_DWORD *)a1;
  uint64_t v7 = v2;
  LODWORD(v2) = *(_DWORD *)(a1 + 20);
  int v9 = *(_DWORD *)(a1 + 16);
  int v11 = v2;
  int v3 = *(_DWORD *)(a1 + 28);
  int v13 = *(_DWORD *)(a1 + 24);
  int v39 = *(_DWORD *)(a1 + 876);
  uint64_t v43 = *(void *)(a1 + 888);
  int v47 = *(_DWORD *)(a1 + 900);
  uint64_t v49 = *(void *)(a1 + 904);
  int v51 = *(_DWORD *)(a1 + 912);
  uint64_t v53 = *(void *)(a1 + 920);
  int v55 = *(_DWORD *)(a1 + 1952);
  uint64_t v57 = *(void *)(a1 + 1960);
  uint64_t v59 = *(void *)(a1 + 1968);
  int v63 = *(_DWORD *)(a1 + 2492);
  int v67 = *(_DWORD *)(a1 + 2500);
  int v71 = *(_DWORD *)(a1 + 2508);
  int v15 = v3;
  uint64_t v73 = *(void *)(a1 + 2512);
  uint64_t v75 = *(void *)(a1 + 2520);
  int v79 = *(_DWORD *)(a1 + 2532);
  uint64_t v81 = *(void *)(a1 + 2536);
  int v83 = *(_DWORD *)(a1 + 2544);
  uint64_t v85 = *(void *)(a1 + 2552);
  int v87 = *(_DWORD *)(a1 + 2560);
  uint64_t v89 = *(void *)(a1 + 2568);
  int v91 = *(_DWORD *)(a1 + 2576);
  uint64_t v93 = *(void *)(a1 + 2584);
  int v95 = *(_DWORD *)(a1 + 2592);
  uint64_t v97 = *(void *)(a1 + 2600);
  int v99 = *(_DWORD *)(a1 + 2608);
  uint64_t v101 = *(void *)(a1 + 2616);
  int v103 = *(_DWORD *)(a1 + 2624);
  uint64_t v105 = *(void *)(a1 + 2632);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v19 = v4;
  uint64_t v21 = *(void *)(a1 + 48);
  uint64_t v23 = *(void *)(a1 + 832);
  uint64_t v25 = *(void *)(a1 + 840);
  uint64_t v27 = *(void *)(a1 + 848);
  int v29 = *(char *)(a1 + 856);
  int v31 = *(unsigned __int8 *)(a1 + 857);
  int v33 = *(_DWORD *)(a1 + 860);
  uint64_t v35 = *(void *)(a1 + 864);
  int v37 = *(_DWORD *)(a1 + 872);
  int v41 = *(_DWORD *)(a1 + 880);
  int v45 = *(_DWORD *)(a1 + 896);
  int v61 = *(_DWORD *)(a1 + 2488);
  int v65 = *(_DWORD *)(a1 + 2496);
  int v69 = *(_DWORD *)(a1 + 2504);
  int v77 = *(_DWORD *)(a1 + 2528);
  __int16 v8 = 1024;
  __int16 v10 = 1024;
  __int16 v12 = 1024;
  __int16 v14 = 1024;
  __int16 v28 = 1024;
  __int16 v30 = 1024;
  __int16 v32 = 1024;
  __int16 v36 = 1024;
  __int16 v38 = 1024;
  __int16 v40 = 1024;
  __int16 v44 = 1024;
  __int16 v46 = 1024;
  __int16 v50 = 1024;
  __int16 v54 = 1024;
  __int16 v60 = 1024;
  __int16 v62 = 1024;
  __int16 v64 = 1024;
  __int16 v66 = 1024;
  __int16 v68 = 1024;
  __int16 v70 = 1024;
  __int16 v76 = 1024;
  __int16 v78 = 1024;
  __int16 v82 = 1024;
  __int16 v86 = 1024;
  __int16 v90 = 1024;
  __int16 v94 = 1024;
  __int16 v98 = 1024;
  __int16 v102 = 1024;
  __int16 v6 = 2048;
  __int16 v16 = 2048;
  __int16 v18 = 2048;
  __int16 v20 = 2048;
  __int16 v22 = 2048;
  __int16 v24 = 2048;
  __int16 v26 = 2048;
  __int16 v34 = 2048;
  __int16 v42 = 2048;
  __int16 v48 = 2048;
  __int16 v52 = 2048;
  __int16 v56 = 2048;
  __int16 v58 = 2048;
  __int16 v72 = 2048;
  __int16 v74 = 2048;
  __int16 v80 = 2048;
  __int16 v84 = 2048;
  __int16 v88 = 2048;
  __int16 v92 = 2048;
  __int16 v96 = 2048;
  __int16 v100 = 2048;
  __int16 v104 = 2048;
  v5[0] = 67121920;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "ANEVirtualClient : virtANEModel->command=%u, virtANEModel->success=%lld, virtANEModel->ioSIDModelNet=%u, virtANEModel->ioSIDModelShape=%u, virtANEModel->ioSIDModelWeight=%u, virtANEModel->ioSIDKey=%u, virtANEModel->modelNetLength=%llu, virtANEModel->modelShapeLength=%llu, virtANEModel->modelWeightLength=%llu, virtANEModel->string_id=%llu, virtANEModel->programHandle=%llu, virtANEModel->intermediateBufferHandle=%llu, virtANEModel->queueDepth=%d, virtANEModel->flags=%d, virtANEModel->ioSIDModelAttributes=%u, virtANEModel->ModelAttributeLength=%llu, virtANEModel->perfStatsMask=%u, virtANEModel->qos=%u, virtANEModel->ioSIDOptions=%u, virtANEModel->optionsLength=%llu, virtANEModel->state=%u, virtANEModel->ioSIDCompilerOptionFile=%u, virtANEModel->compilerOptionFileLength=%llu, virtANEModel->ioSIDANECIRNetPlist=%u, virtANEModel->_ANECIRNetPlistLength=%llu, virtANEModel->ioSIDWeightsBuffer=%u, virtANEModel->procedureIndex=%llu, virtANEModel->transactionHandle=%llu, virtANEModel->perfStatsCount=%u, virtANEModel->inputArrayCount=%u, virtANEModel->inputIndexArrayCount=%u, virtANEModel->outputArrayCount=%u, virtANEModel->outputIndexArrayCount=%u, virtANEModel->ioSIDHashString=%u, virtANEModel->hashStringLength=%llu, virtANEModel->errorCode=%ld, virtANEModel->errorLength=%u, virtANEModel->ioSIDErrorValue=%u, virtANEModel->hwExecutionTime=%llu, virtANEModel->ioSIDPerformanceStats=%u, virtANEModel->performanceStatsLength=%llu, virtANEModel->ioSIDModelInputPath=%u, virtANEModel->modelInputPathLength=%llu, virtANEModel->ioSIDModelNetName=%u, virtANEModel->modelNetNameLength=%llu, virtANEModel->ioSIDModelShapeName=%u, virtANEModel->modelShapeNameLength=%llu, virtANEModel->ioSIDModelWeightName=%u, virtANEModel->modelWeightNameLength=%llu, virtANEModel->ioSIDModelHWX=%u, virtANEModel->modelHWXLength=%llu",
    (uint8_t *)v5,
    0x18Cu);
}

void sub_10002EF2C()
{
  sub_10001A8F8();
  sub_10001A6C8(v1, 5.778e-34, v2, v3);
  sub_10001A610((void *)&_mh_execute_header, "%@: ANEVirtualClient LoadModel no success %lld.\n", v4, v5);
}

void sub_10002EF70()
{
  sub_100009F00();
  sub_10001A5F8(v1, v2, v3, 5.778e-34);
  sub_10001A610((void *)&_mh_execute_header, "%@: ANEVirtualClient LoadModel success MODEL: %@ \n", v4, v5);
}

void sub_10002EFB4()
{
  sub_100009F00();
  sub_10001A5F8(v1, v2, v3, 5.778e-34);
  sub_10001A610((void *)&_mh_execute_header, "%@: ANEVirtualClient loadModel dictionary Model Cache URL from Host %@", v4, v5);
}

void sub_10002EFF8(uint64_t a1, int *a2, os_log_t log)
{
  int v3 = *(_DWORD *)(a1 + 648);
  int v4 = *(_DWORD *)(a1 + 652);
  int v5 = *(_DWORD *)(a1 + 656);
  int v6 = *(_DWORD *)(a1 + 660);
  uint64_t v7 = *(void *)(a1 + 1464);
  uint64_t v8 = *(void *)(a1 + 1472);
  uint64_t v9 = *(void *)(a1 + 1480);
  int v10 = *(char *)(a1 + 1488);
  int v11 = *(_DWORD *)(a1 + 1492);
  uint64_t v12 = *(void *)(a1 + 1496);
  int v13 = *(_DWORD *)(a1 + 1504);
  int v14 = *a2;
  int v15 = *(_DWORD *)(a1 + 1512);
  int v16 = *(_DWORD *)(a1 + 3164);
  v17[0] = 67112448;
  v17[1] = v3;
  __int16 v18 = 1024;
  int v19 = v4;
  __int16 v20 = 1024;
  int v21 = v5;
  __int16 v22 = 1024;
  int v23 = v6;
  __int16 v24 = 2048;
  uint64_t v25 = v7;
  __int16 v26 = 2048;
  uint64_t v27 = v8;
  __int16 v28 = 2048;
  uint64_t v29 = v9;
  __int16 v30 = 1024;
  int v31 = v10;
  __int16 v32 = 1024;
  int v33 = v11;
  __int16 v34 = 2048;
  uint64_t v35 = v12;
  __int16 v36 = 1024;
  int v37 = v13;
  __int16 v38 = 1024;
  int v39 = v14;
  __int16 v40 = 1024;
  int v41 = v15;
  __int16 v42 = 1024;
  int v43 = v16;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "ANEVirtualClient virtualANEModel.ioSIDModelNet=%u virtualANEModel.ioSIDModelShape=%u virtualANEModel.ioSIDModelWeight=%u virtualANEModel.ioSIDKey=%u virtualANEModel.string_id=%lld virtualANEModel.programHandle=%lld virtualANEModel.intermediateBufferHandle=%lld virtualANEModel.queueDepth=%d virtualANEModel.ioSIDModelAttributes=%u virtualANEModel.ModelAttributeLength=%llu virtualANEModel.perfStatsMask=%u virtualANEModel.qos=%u virtualANEModel.ioSIDOptions=%u virtualANEModel.ioSIDErrorValue=%u", (uint8_t *)v17, 0x66u);
}

void sub_10002F11C()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient failed to call loadModel dictionary method", v2, v3, v4, v5, v6);
}

void sub_10002F150()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient loadModel dictionary call succeeded", v5);
}

void sub_10002F194()
{
  sub_100009F00();
  int v2 = *v1;
  int v3 = v1[1];
  *(_DWORD *)uint64_t v4 = 138412802;
  *(void *)(v4 + 4) = v5;
  *(_WORD *)(v4 + 12) = 1024;
  *(_DWORD *)(v4 + 14) = v2;
  *(_WORD *)(v4 + 18) = 1024;
  *(_DWORD *)(v4 + 20) = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient loadModel dictionary Allocating IOSurface for Model Cache URL %u %u", v6, 0x18u);
}

void sub_10002F200()
{
  sub_100009F00();
  sub_10001A5F8(v1, v2, v3, 5.778e-34);
  sub_10001A610((void *)&_mh_execute_header, "%@: modelCacheURLIdentifierCFStringRef : %@", v4, v5);
}

void sub_10002F244()
{
  sub_10001A68C();
  sub_10001A6E0((void *)&_mh_execute_header, v0, v1, "_ANEVirtualClient calling dictionary loadModel method", v2, v3, v4, v5, v6);
}

void sub_10002F278()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@:ANEVirtualClient loadModelNewInstance API Not supported!!\n", v5);
}

void sub_10002F2BC()
{
  sub_10001A68C();
  sub_10001A6E0((void *)&_mh_execute_header, v0, v1, "_ANEVirtualClient calling dictionary loadModelNewInstance method", v2, v3, v4, v5, v6);
}

void sub_10002F2F0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A740((void *)&_mh_execute_header, a2, a3, "ANEVirtualClient unloadModel res=%u", a5, a6, a7, a8, 0);
}

void sub_10002F360()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient failed to call unloadModel dictionary method", v2, v3, v4, v5, v6);
}

void sub_10002F394()
{
  sub_10001A72C();
  sub_10001A6C8(v1, 5.778e-34, v2, v3);
  sub_10001A610((void *)&_mh_execute_header, "%@: ANEVirtualClient unloadModel success=%lld", v4, v5);
}

void sub_10002F3D8()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient unloadModel dictionary call succeeded", v5);
}

void sub_10002F41C()
{
  sub_10001A68C();
  sub_10001A6E0((void *)&_mh_execute_header, v0, v1, "_ANEVirtualClient calling dictionary unloadModel method", v2, v3, v4, v5, v6);
}

void sub_10002F450()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@: Empty dispatch queue\n", v5);
}

void sub_10002F494()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "Failed to initialize output event listner", v2, v3, v4, v5, v6);
}

void sub_10002F4C8()
{
  sub_10001A8CC();
  sub_10001A698((void *)&_mh_execute_header, v0, (uint64_t)v0, "notifyListener success completion event: event:%p, 0x%llx\n", v1);
}

void sub_10002F538()
{
  sub_10001A8CC();
  sub_10001A698((void *)&_mh_execute_header, v0, (uint64_t)v0, "Failed to match success completion signal value. Sending error on completion handler: event:%p, value: 0x%llx", v1);
}

void sub_10002F5A8()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient _ioSPerformanceStats pointer null\n", v5);
}

void sub_10002F5EC()
{
  sub_10001A68C();
  sub_10001A6E0((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient Connect to driver for kAppleVirtIONeuralEngineDeviceUserClientEvaluateWithModel.", v2, v3, v4, v5, v6);
}

void sub_10002F620()
{
  sub_10001A75C();
  sub_10001A714(v1, 5.778e-34, v2, v3);
  sub_10001A7B4((void *)&_mh_execute_header, "%@: ANEVirtualClient ioSurfaceRef ID=%u\n", v4, v5);
}

void sub_10002F664()
{
  sub_10001A920();
  sub_10001A740((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient Evaluate request5 ioSID: %u", v2, v3, v4, v5, v6);
}

void sub_10002F6CC(void *a1)
{
  id v1 = a1;
  sub_10001A850((uint64_t)v1, 5.778e-34);
  sub_10001A788((void *)&_mh_execute_header, v2, v3, "%@: ANEVirtualClient queued the evaluate request. res=%d");
}

void sub_10002F728(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_10001A6FC((void *)&_mh_execute_header, a2, a3, "ANEVirtualClient failed to call evaluateWithModel dictionary method with error:%@", (uint8_t *)&v4);
}

void sub_10002F79C(void *a1, char a2)
{
  id v3 = a1;
  sub_10001A8A4((uint64_t)v3, a2 & 1, 5.778e-34);
  sub_10001A788((void *)&_mh_execute_header, v4, v5, "%@: ANEVirtualClient 2 reqQueued=%d\n");
}

void sub_10002F800(void *a1)
{
  id v2 = sub_10001A7E8(a1);
  sub_10001A7D0((uint64_t)v2, *v1, 5.778e-34);
  sub_10001A804((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient evaluateWithModel success=%lld");
}

void sub_10002F858(void *a1, uint64_t a2, NSObject *a3)
{
  id v5 = a1;
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient evaluateWithModel dictionary call succeeded", (uint8_t *)a2, 0xCu);
}

void sub_10002F8C8(void *a1)
{
  id v2 = sub_10001A7E8(a1);
  sub_10001A7D0((uint64_t)v2, *v1, 5.778e-34);
  sub_10001A804((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient number of wait events=%llu\n");
}

void sub_10002F920(void *a1)
{
  id v1 = a1;
  sub_10001A850((uint64_t)v1, 5.778e-34);
  sub_10001A788((void *)&_mh_execute_header, v2, v3, "%@: ANEVirtualClient reqQueued=%d\n");
}

void sub_10002F97C()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "Invalid number of completion events", v2, v3, v4, v5, v6);
}

void sub_10002F9B0(void *a1)
{
  id v2 = sub_10001A7E8(a1);
  sub_10001A7D0((uint64_t)v2, *v1, 5.778e-34);
  sub_10001A804((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient number of signal shared events=%llu\n");
}

void sub_10002FA08(void *a1)
{
  id v2 = sub_10001A7E8(a1);
  sub_10001A8A4((uint64_t)v2, *v1, 5.778e-34);
  sub_10001A788((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient ioSurfaceRef ID=%u\n");
}

void sub_10002FA60(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002FAD0()
{
  sub_10001A68C();
  sub_10001A6E0((void *)&_mh_execute_header, v0, v1, "_ANEVirtualClient calling dictionary doEvaluateWithModel method", v2, v3, v4, v5, v6);
}

void sub_10002FB04()
{
  sub_10001A920();
  sub_10001A740((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient evaluateWithModel qos: %d\n", v2, v3, v4, v5, v6);
}

void sub_10002FB6C()
{
  sub_10001A7A8();
  sub_10001A6B0((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient evaluateWithModel request: %@\n", v2);
}

void sub_10002FBD8()
{
  sub_10001A7A8();
  sub_10001A6B0((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient evaluateWithmodel options: %@\n", v2);
}

void sub_10002FC44()
{
  sub_10001A7A8();
  sub_10001A6B0((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient evaluateWithModel model: %@\n", v2);
}

void sub_10002FCB0()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient failed to call compiledModelExistsFor dictionary method", v2, v3, v4, v5, v6);
}

void sub_10002FCE4()
{
  sub_10001A72C();
  sub_10001A6C8(v1, 5.778e-34, v2, v3);
  sub_10001A610((void *)&_mh_execute_header, "%@: ANEVirtualClient compiledModelExistsFor success=%lld", v4, v5);
}

void sub_10002FD28()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient compiledModelExistsFor dictionary call succeeded", v5);
}

void sub_10002FD6C()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient failed to call purgeCompiledModel dictionary method", v2, v3, v4, v5, v6);
}

void sub_10002FDA0()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient purgeCompiledModel dictionary call succeeded", v5);
}

void sub_10002FDE4()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient failed to call compiledModelExistsMatchingHash dictionary method", v2, v3, v4, v5, v6);
}

void sub_10002FE18()
{
  sub_10001A72C();
  sub_10001A6C8(v1, 5.778e-34, v2, v3);
  sub_10001A610((void *)&_mh_execute_header, "%@: ANEVirtualClient compiledModelExistsMatchingHash dictionary success=%lld", v4, v5);
}

void sub_10002FE5C()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@:ANEVirtualClient compiledModelExistsMatchingHash start\n", v5);
}

void sub_10002FEA0()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient failed to call purgeCompiledModelMatchingHash dictionary method", v2, v3, v4, v5, v6);
}

void sub_10002FED4()
{
  sub_10001A68C();
  sub_10001A6E0((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient successfully called purgeCompiledModelMatchingHash dictionary method", v2, v3, v4, v5, v6);
}

void sub_10002FF08()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient failed to call echo dictionary method", v2, v3, v4, v5, v6);
}

void sub_10002FF3C()
{
  sub_10001A72C();
  sub_10001A6C8(v1, 5.778e-34, v2, v3);
  sub_10001A610((void *)&_mh_execute_header, "%@: ANEVirtualClient echo dictionary success=%lld", v4, v5);
}

void sub_10002FF80()
{
  sub_1000078C8();
  uint64_t v3 = sub_10001A83C(v1, v2, 5.7781e-34);
  sub_10001A8BC(v3, v4, v5);
  sub_10001A86C((void *)&_mh_execute_header, "%@: Failed to call method %d with error %d", v6, v7);
}

void sub_10002FFD0()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient validateNetworkCreate failed to create outValidationDictIOSurfaceRef", v5);
}

void sub_100030014()
{
  sub_1000078C8();
  sub_1000078B0(v1, v2, v3, 5.778e-34);
  sub_10001A888((void *)&_mh_execute_header, "%@: ANEVirtualClient validateNetworkCreate failed to call IOConnectCallMethod with kernResult : 0x%x", v4, v5);
}

void sub_10003005C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  os_log_t v4 = "-[_ANEVirtualClient validateNetworkCreate:uuid:function:directoryPath:scratchPadPath:]";
  sub_10001A6FC((void *)&_mh_execute_header, a1, a3, "%s: FAILED copying files", (uint8_t *)&v3);
}

void sub_1000300D8()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.778e-34);
  *(_WORD *)(v3 + 12) = 1024;
  *(_DWORD *)(v3 + 14) = 14;
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient Successfully called method %d\n", v5, 0x12u);
}

void sub_100030138()
{
  sub_1000078C8();
  uint64_t v3 = sub_10001A83C(v1, v2, 5.7781e-34);
  sub_10001A8BC(v3, v4, v5);
  sub_10001A86C((void *)&_mh_execute_header, "%@: Failed to call method %d with error %d", v6, v7);
}

void sub_100030188()
{
  sub_100009F00();
  sub_10001A5F8(v1, v2, v3, 5.778e-34);
  sub_10001A610((void *)&_mh_execute_header, "%@: ANEVirtualClient buildVersion: %@\n", v4, v5);
}

void sub_1000301CC()
{
  sub_1000078C8();
  uint64_t v3 = sub_10001A83C(v1, v2, 5.7781e-34);
  sub_10001A8BC(v3, v4, v5);
  sub_10001A86C((void *)&_mh_execute_header, "%@: Failed to call method %d with error 0x%x", v6, v7);
}

void sub_10003021C()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@: ERROR buildVersion is emptyString or nil", v5);
}

void sub_100030260()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@: ERROR productName is emptyString or nil", v5);
}

void sub_1000302A4()
{
  sub_10001A7A8();
  sub_10001A6B0((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient mapIOSurfacesWithModel: %@\n", v2);
}

void sub_100030310()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient mapIOSurfacesWithModel _ioSPerformanceStats pointer null\n", v5);
}

void sub_100030354()
{
  sub_10001A68C();
  sub_10001A6E0((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient Connect to driver for kAppleVirtIONeuralEngineDeviceUserClientMapIOSurfacesWithModel.", v2, v3, v4, v5, v6);
}

void sub_100030388()
{
  sub_10001A75C();
  sub_10001A714(v1, 5.778e-34, v2, v3);
  sub_10001A7B4((void *)&_mh_execute_header, "%@: ANEVirtualClient mapIOSurfacesWithModel ioSurfaceRef ID=%u\n", v4, v5);
}

void sub_1000303CC()
{
  sub_10001A920();
  sub_10001A740((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient mapIOSurfacesWithModel request5 ioSID: %u", v2, v3, v4, v5, v6);
}

void sub_100030434(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000304A4()
{
  sub_10001A7A8();
  sub_10001A6B0((void *)&_mh_execute_header, v0, v1, "ANEVirtualClient doMapIOSurfacesWithModel: %@\n", v2);
}

void sub_100030510()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@: VirtualANEModel struct empty.", v5);
}

void sub_100030554()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient: weightname contained symlink", v5);
}

void sub_100030598()
{
  sub_100009F00();
  sub_10001A5F8(v1, v2, v3, 5.778e-34);
  sub_10001A610((void *)&_mh_execute_header, "%@: ANEVirtualClient: weightname=%@", v4, v5);
}

void sub_1000305DC()
{
  sub_1000078C8();
  sub_10001A90C(v1, v2, 5.778e-34);
  *(void *)(v3 + 14) = &stru_10004D218;
  sub_10001A698((void *)&_mh_execute_header, v4, (uint64_t)v4, "%@: ANEVirtualClient: fileHWX=%@", v5);
}

void sub_100030630()
{
  sub_1000078C8();
  sub_10001A90C(v1, v2, 5.778e-34);
  *(void *)(v3 + 14) = &stru_10004D218;
  sub_10001A698((void *)&_mh_execute_header, v4, (uint64_t)v4, "%@: ANEVirtualClient: var fileHWX=%@", v5);
}

void sub_100030684()
{
  sub_100009F00();
  sub_10001A5F8(v1, v2, v3, 5.778e-34);
  sub_10001A610((void *)&_mh_execute_header, "%@: ANEVirtualClient: hwx new filePath=%@", v4, v5);
}

void sub_1000306C8(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  os_log_t v4 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
  sub_10001A6FC((void *)&_mh_execute_header, a1, a3, "%s: passed in directory path is not a directory, copy FAILED", (uint8_t *)&v3);
}

void sub_100030744(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315394;
  *(void *)(a1 + 4) = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a2;
  sub_10001A698((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: Extracted %lu files to IOSurfaces", (uint8_t *)a1);
}

void sub_100030798()
{
  v2[0] = 136315394;
  sub_10001A8E4();
  sub_10001A824((void *)&_mh_execute_header, v0, v1, "%s: could not read directory, copy FAILED with error : %@", (uint8_t *)v2);
}

void sub_100030810()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "copyAllModelFiles invalid input arguments (one or more are nil)\n", v2, v3, v4, v5, v6);
}

void sub_100030844()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "copyAllModelFiles could not get fileNamePrefix\n", v2, v3, v4, v5, v6);
}

void sub_100030878()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "copyAllModelFiles ERROR: No model files to copy\n", v2, v3, v4, v5, v6);
}

void sub_1000308AC(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 32;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "copyAllModelFiles ERROR : Max file count reached %d", buf, 8u);
}

void sub_1000308F8(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "copyAllModelFiles No precompiled binary support, skipping HWX file", buf, 2u);
}

void sub_100030938()
{
  sub_10001A7A8();
  sub_10001A6FC((void *)&_mh_execute_header, v0, v1, "copyAllModelFiles ERROR : could not read directory, %@", v2);
}

void sub_1000309A4(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "copyAllModelFiles ERROR : hwxTransferSupported=%d and only HWX file passed\n", (uint8_t *)v1, 8u);
}

void sub_100030A20()
{
  sub_10001A7A8();
  sub_10001A6B0((void *)&_mh_execute_header, v0, v1, "copyAllModelFiles new directoryPath=%@\n", v2);
}

void sub_100030A8C()
{
  sub_10001A7A8();
  sub_10001A6B0((void *)&_mh_execute_header, v0, v1, "copyAllModelFiles fileNamePrefix=%@\n", v2);
}

void sub_100030AF8()
{
  sub_10001A68C();
  sub_10001A6E0((void *)&_mh_execute_header, v0, v1, "copyAllModelFiles dealing with /System path\n", v2, v3, v4, v5, v6);
}

void sub_100030B2C()
{
  sub_10001A7A8();
  sub_10001A6B0((void *)&_mh_execute_header, v0, v1, "copyAllModelFiles directoryPath=%@\n", v2);
}

void sub_100030B98()
{
  sub_10001A72C();
  sub_10001A6C8(v1, 5.778e-34, v2, v3);
  sub_10001A610((void *)&_mh_execute_header, "%@: sourceURLLength=%lld\n", v4, v5);
}

void sub_100030BDC(void *a1, void *a2, uint64_t a3)
{
  sub_10001A5F8((uint64_t)a1, (uint64_t)a2, a3, 5.778e-34);
  sub_10001A610((void *)&_mh_execute_header, "%@: model.sourceURL=%@\n", v5, v6);
}

void sub_100030C30()
{
  sub_100009F00();
  sub_10001A5F8(v1, v2, v3, 5.778e-34);
  sub_10001A610((void *)&_mh_execute_header, "%@: ANEVirtualClient Cannot read netfilename=%@\n", v4, v5);
}

void sub_100030C74()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient weightfilename is Not empty\n", v5);
}

void sub_100030CB8()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient could not parse Json.\n", v5);
}

void sub_100030CFC()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient weightfilename does not exists.\n", v5);
}

void sub_100030D40()
{
  sub_100009F00();
  sub_10001A5F8(v1, v2, v3, 5.778e-34);
  sub_10001A610((void *)&_mh_execute_header, "%@: ANEVirtualClient weightfilename=%@\n", v4, v5);
}

void sub_100030D84()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient no match for weightfilename.\n", v5);
}

void sub_100030DC8()
{
  sub_1000078C8();
  sub_10001A770(v1, v2, v3, 5.778e-34);
  sub_10001A824((void *)&_mh_execute_header, v6, v4, "%@: Block size too big %lld ", v5);
}

void sub_100030E14()
{
  sub_100009F00();
  sub_10001A714(v1, 5.778e-34, v2, v3);
  sub_10001A888((void *)&_mh_execute_header, "%@: Invalid decompression algorithm %c ", v4, v5);
}

void sub_100030E5C()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient options empty\n", v5);
}

void sub_100030EA0()
{
  sub_1000078C8();
  sub_10001A770(v1, v2, v3, 5.778e-34);
  sub_10001A610((void *)&_mh_execute_header, "%@: FILEData wrote %lu\n", v4, v5);
}

void sub_100030EE8()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient ioSurfaceRef pointer null\n", v5);
}

void sub_100030F2C()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@: ERROR passed in ioSID pointer is NULL", v5);
}

void sub_100030F70()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@: ERROR passed in length=0", v5);
}

void sub_100030FB4()
{
  sub_1000078C8();
  sub_10001A770(v1, v2, v3, 5.778e-34);
  sub_10001A824((void *)&_mh_execute_header, v6, v4, "%@: FAILED to create IOSurface with length=%lu", v5);
}

void sub_100031000()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient ioSID pointer null\n", v5);
}

void sub_100031044()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A62C((void *)&_mh_execute_header, v3, v4, "%@: ANEVirtualClient length==0\n", v5);
}

void sub_100031088(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  os_log_t v4 = "+[_ANEVirtualClient printIOSurfaceDataInBytes:]";
  sub_10001A6FC((void *)&_mh_execute_header, a1, a3, "%s:ANEVirtualClient cannot getIOSurfaceObject", (uint8_t *)&v3);
}

void sub_100031104()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "getModelAttribute: IOSATTribute null", v2, v3, v4, v5, v6);
}

void sub_100031138()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "getModelAttribute: DataBaseAddress null", v2, v3, v4, v5, v6);
}

void sub_10003116C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[_ANEVirtualClient getObjectFromIOSurface:classType:length:]";
  sub_10001A6FC((void *)&_mh_execute_header, a1, a3, "%s:ANEVirtualClient cannot getIOSurfaceObject", (uint8_t *)&v3);
}

void sub_1000311E8(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[_ANEVirtualClient getObjectFromIOSurface:classType:length:]";
  sub_10001A6FC((void *)&_mh_execute_header, a1, a3, "%s:ANEVirtualClient cannot have nil data.", (uint8_t *)&v3);
}

void sub_100031264()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "_ANEVirtualClient getCFDictionaryFromIOSurface : ioSurfaceRef null", v2, v3, v4, v5, v6);
}

void sub_100031298(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 136315394;
  uint64_t v4 = "+[_ANEVirtualClient getCFDictionaryFromIOSurface:dataLength:]";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  sub_10001A824((void *)&_mh_execute_header, a2, a3, "%s : memory allocation failed, size requested:%llu", (uint8_t *)&v3);
}

void sub_10003131C()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "_ANEVirtualClient getCFDictionaryFromIOSurface : DataBaseAddress null", v2, v3, v4, v5, v6);
}

void sub_100031350()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "_ANEVirtualClient getCFDictionaryFromIOSurface : couldn't create CFDataRef object", v2, v3, v4, v5, v6);
}

void sub_100031384()
{
  sub_10001A68C();
  sub_10001A654((void *)&_mh_execute_header, v0, v1, "_ANEVirtualClient getCFDictionaryFromIOSurface : Couldn't create CFDictionaryRef object", v2, v3, v4, v5, v6);
}

void sub_1000313B8()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@: copyDictionaryDataToStruct input data NULL", v5);
}

void sub_1000313FC()
{
  v2[0] = 136315394;
  sub_10001A8E4();
  sub_10001A698((void *)&_mh_execute_header, v0, v1, "%s: csIdentity:%@", (uint8_t *)v2);
}

void sub_100031474(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  os_log_t v4 = "+[_ANEVirtualClient setCodeSigningIdentity:]";
  sub_10001A6FC((void *)&_mh_execute_header, a1, a3, "%s: nil csIdentity", (uint8_t *)&v3);
}

void sub_1000314F0()
{
  sub_10001A75C();
  sub_10001A714(v1, 5.778e-34, v2, v3);
  sub_10001A888((void *)&_mh_execute_header, "%@:ANEVirtualClient FAILED to serialize input dictionary for command=%d", v4, v5);
}

void sub_100031534(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315394;
  os_log_t v4 = "-[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:]";
  __int16 v5 = 2048;
  uint64_t v6 = 4096;
  sub_10001A824((void *)&_mh_execute_header, a1, a3, "%s : memory allocation failed, size requested:%zu", (uint8_t *)&v3);
}

void sub_1000315C0()
{
  sub_10001A72C();
  *(_DWORD *)uint64_t v1 = 138412546;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2112;
  *(void *)(v1 + 14) = v3;
  sub_10001A824((void *)&_mh_execute_header, v5, v1, "%@:ANEVirtualClient FAILED to unserialize dictionary=%@", v4);
}

void sub_100031618()
{
  sub_1000078C8();
  sub_1000078B0(v1, v2, v3, 5.778e-34);
  sub_10001A7B4((void *)&_mh_execute_header, "%@: ANEVirtualClient Successfully called method %d.\n", v4, v5);
}

void sub_100031660()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@: Failed with NULL databaseAddress", v5);
}

void sub_1000316A4()
{
  sub_10001A72C();
  sub_10001A6C8(v1, 5.778e-34, v2, v3);
  sub_10001A824((void *)&_mh_execute_header, v6, v4, "%@: No Data in performanceStats with length=%llu", v5);
}

void sub_1000316EC()
{
  sub_10000432C();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10001B3D4() modelURL];
  sub_10001B39C();
  sub_10001B3B4((void *)&_mh_execute_header, v3, v4, "%@: modelURL=%@ is encrypted. Skipping clone", v5, v6, v7, v8, v9);
}

void sub_100031788()
{
  sub_10000432C();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10001B3D4() modelURL];
  sub_10001B39C();
  sub_10001B3B4((void *)&_mh_execute_header, v3, v4, "%@: modelURL=%@ is on root filesystem. Skipping clone", v5, v6, v7, v8, v9);
}

void sub_100031824()
{
  sub_10000432C();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)sub_10001B3D4() modelURL];
  sub_10001B39C();
  sub_10001B3B4((void *)&_mh_execute_header, v3, v4, "%@: modelURL=%@ is on read-only filesystem. Skipping clone", v5, v6, v7, v8, v9);
}

void sub_1000318C0()
{
  sub_10000432C();
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)sub_10001B3D4() modelURL];
  sub_10001B39C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%@: modelURL=%@ does not exist", v4, 0x16u);
}

void sub_10003196C()
{
  sub_10000432C();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  SEL v2 = [(id)sub_10001B3D4() modelURL];
  sub_10001B39C();
  sub_10001B3B4((void *)&_mh_execute_header, v3, v4, "%@: modelURL=%@ is writable. Attempting copyfile()", v5, v6, v7, v8, v9);
}

void sub_100031A08(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031A74()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7781e-34);
  *(_WORD *)(v3 + 12) = 2048;
  *(void *)(v3 + 14) = v4;
  *(_WORD *)(v3 + 22) = 2112;
  *(void *)(v3 + 24) = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@: Unknown kMGQAppleNeuralEngineSubtype=0x%llx using (%@)", v6, 0x20u);
}

void sub_100031AE8()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@:  [_ANEDeviceInfo numANEs] Invalid numANEs value (0), default to 1 ANE", v5);
}

void sub_100031B2C()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@:  [_ANEDeviceInfo numANEs] Failed to get numANEs, default to 1 ANE", v5);
}

void sub_100031B70()
{
  sub_1000078C8();
  sub_10001A648(v1, v2, 5.7779e-34);
  sub_10001A670((void *)&_mh_execute_header, v3, v4, "%@: Unknown aneSubType", v5);
}

void sub_100031BB4()
{
  v1[0] = 136315394;
  sub_10001DB48();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: validateNetworkSupportedVersion=%llu", (uint8_t *)v1, 0x16u);
}

void sub_100031C34(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "uint64_t ANEGetValidateNetworkSupportedVersion()";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Virtual Machine environment detected but no virtualClient available.", (uint8_t *)&v1, 0xCu);
}

void sub_100031CB8()
{
  sub_1000078C8();
  *int v1 = 136315394;
  sub_10001DB18(v2, (uint64_t)v1, (uint64_t)"CFDictionaryRef ANEValidateNetworkCreate(uint64_t, CFDictionaryRef _Nonnull)");
  sub_10001DB2C((void *)&_mh_execute_header, v3, v4, "%s: outValidationParams=%@", v5);
}

void sub_100031D08()
{
  v3[0] = 136315650;
  sub_10001DB48();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: device_api_version=%llu mismatch with api_version=%llu", (uint8_t *)v3, 0x20u);
}

void sub_100031D94(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "CFDictionaryRef ANEValidateNetworkCreate(uint64_t, CFDictionaryRef _Nonnull)";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: ANEDeviceInfo Directory can't be created error %@", (uint8_t *)&v2, 0x16u);
}

void sub_100031E20()
{
  sub_1000078C8();
  *uint64_t v1 = 136315394;
  sub_10001DB18(v2, (uint64_t)v1, (uint64_t)"CFDictionaryRef ANEValidateNetworkCreate(uint64_t, CFDictionaryRef _Nonnull)");
  sub_10001DB2C((void *)&_mh_execute_header, v3, v4, "%s: boot-arg %@ set, performing validation on guest", v5);
}

void sub_100031E70()
{
  sub_1000078C8();
  *uint64_t v1 = 136315394;
  sub_10001DB18(v2, (uint64_t)v1, (uint64_t)"CFDictionaryRef ANEValidateNetworkCreate(uint64_t, CFDictionaryRef _Nonnull)");
  sub_10001DB2C((void *)&_mh_execute_header, v3, v4, "%s: inValidationParams: %@", v5);
}

void sub_100031EC0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "PerfPowerServices not supported.", v1, 2u);
}

void sub_100031F04(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Telemetry: invalid PPS category %@ specified!", (uint8_t *)&v2, 0xCu);
}

void sub_100031F7C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Telemetry: ppsId not available %@!", (uint8_t *)&v2, 0xCu);
}

void sub_100031FF4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Telemetry: report to category %@.", (uint8_t *)&v2, 0xCu);
}

void sub_10003206C(void *a1, const char *a2)
{
  uint64_t v3 = a1;
  os_log_t v4 = NSStringFromSelector(a2);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@: nil currentConnection", (uint8_t *)&v5, 0xCu);
}

void sub_100032118(void *a1, const char *a2, uint64_t a3)
{
  int v5 = a1;
  uint64_t v6 = NSStringFromSelector(a2);
  sub_10002322C();
  uint64_t v8 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@: FAILED creating %@", v7, 0x16u);
}

void sub_1000321CC(void *a1, const char *a2)
{
  uint64_t v3 = a1;
  os_log_t v4 = NSStringFromSelector(a2);
  sub_10002322C();
  CFStringRef v6 = @"com.apple.private.ANEStorageMaintainer";
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@: Could not create connection to %@", v5, 0x16u);
}

void sub_10003227C(uint64_t a1, void *a2, uint64_t a3)
{
  int v5 = *(const char **)(a1 + 40);
  CFStringRef v6 = a2;
  os_log_t v7 = NSStringFromSelector(v5);
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = 138412802;
  int v10 = v7;
  __int16 v11 = 2112;
  uint64_t v12 = v8;
  __int16 v13 = 2112;
  uint64_t v14 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@: Could not create connection to %@ : error=%@", (uint8_t *)&v9, 0x20u);
}

void sub_10003234C(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@: %@", buf, 0x16u);
}

void sub_1000323B4(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@: +updateAccessTimeForFilePath:%@ failed", buf, 0x16u);
}

void sub_10003241C(void *a1, const char *a2)
{
  uint64_t v3 = a1;
  os_log_t v4 = NSStringFromSelector(a2);
  sub_100026F5C();
  sub_10001A698((void *)&_mh_execute_header, v3, v5, "%@: modelFilePath=%@", v6);
}

void sub_1000324C8(void *a1, const char *a2)
{
  uint64_t v3 = a1;
  os_log_t v4 = NSStringFromSelector(a2);
  sub_100026F5C();
  sub_10001A698((void *)&_mh_execute_header, v3, v5, "%@: weightFilePath=%@", v6);
}

void sub_100032574(void *a1, const char *a2)
{
  uint64_t v3 = a1;
  os_log_t v4 = NSStringFromSelector(a2);
  int v5 = 138412290;
  CFStringRef v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@: +setAccessTime:forFilePath failed", (uint8_t *)&v5, 0xCu);
}

void sub_10003261C(void *a1, const char *a2)
{
  uint64_t v3 = a1;
  os_log_t v4 = NSStringFromSelector(a2);
  sub_100026F74();
  sub_10001A698((void *)&_mh_execute_header, v3, v5, "%@: Skipping update for filePath=%@", v6);
}

void sub_1000326C4(void *a1, const char *a2)
{
  uint64_t v3 = a1;
  os_log_t v4 = NSStringFromSelector(a2);
  sub_100026F74();
  sub_10001A698((void *)&_mh_execute_header, v3, v5, "%@: filePath=%@", v6);
}

void sub_10003276C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to remove %@ : error=%@", (uint8_t *)&v3, 0x16u);
}

void sub_1000327F4(uint64_t a1, void *a2)
{
  int v3 = a2;
  int v4 = *__error();
  int v5 = 136315394;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Fail to open %s %{darwin.errno}d", (uint8_t *)&v5, 0x12u);
}

void sub_10003289C(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3 = *a2;
  int v4 = 136315394;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  sub_10001A698((void *)&_mh_execute_header, a3, (uint64_t)a3, "Mark %s as purgeable (flags 0x%llx)", (uint8_t *)&v4);
}

void sub_100032920(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = NSStringFromSelector(a1);
  int v6 = *__error();
  int v7 = 138412802;
  int v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@: fail to stat (%@) with errno=%{darwin:errno}d", (uint8_t *)&v7, 0x1Cu);
}

void sub_1000329E4(void *a1, const char *a2)
{
  uint64_t v3 = a1;
  int v4 = NSStringFromSelector(a2);
  sub_100026F74();
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@: sandbox_extension_issue_file() returned NULL. path=%@", v5, 0x16u);
}

void sub_100032A94(void *a1, const char *a2)
{
  uint64_t v3 = a1;
  int v4 = NSStringFromSelector(a2);
  int v5 = 138412290;
  int v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@: Sandbox extension is nil/not valid", (uint8_t *)&v5, 0xCu);
}

void sub_100032B3C(void *a1, const char *a2)
{
  uint64_t v3 = a1;
  int v4 = NSStringFromSelector(a2);
  sub_100026F74();
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@: Sandbox extension(%@) consumed", v5, 0x16u);
}

void sub_100032BEC(const char *a1, uint64_t a2, NSObject *a3)
{
  int v5 = NSStringFromSelector(a1);
  int v6 = 138412546;
  int v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@: %@", (uint8_t *)&v6, 0x16u);
}

void sub_100032C9C()
{
  sub_100009F00();
  sub_10001A5F8(v1, v2, v3, 5.778e-34);
  sub_10002C450((void *)&_mh_execute_header, "%@: %@", v4, v5);
}

void sub_100032CE0()
{
  sub_10002C484();
  sub_10002C46C(v1, 5.778e-34, v2, v3);
  sub_10001A610((void *)&_mh_execute_header, "%@: lAttr=%@", v4, v5);
}

void sub_100032D24()
{
  sub_100009F00();
  sub_10002C414(v1, v2, v3, 5.7781e-34);
  sub_10002C434((void *)&_mh_execute_header, "%@: attributesOfItemAtPath:%@ returned nil : lErr=%@", v4, v5);
}

void sub_100032D68(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_10001A62C((void *)&_mh_execute_header, a2, a3, "%@: compiling encrypted model", (uint8_t *)a2);
}

void sub_100032DB4()
{
  sub_100009F00();
  sub_10001A5F8(v1, v2, v3, 5.778e-34);
  sub_10001A610((void *)&_mh_execute_header, "%@: targetArchitecture=%@", v4, v5);
}

void sub_100032DF8()
{
  sub_100009F00();
  sub_10001A5F8(v1, v2, v3, 5.778e-34);
  sub_10001A610((void *)&_mh_execute_header, "%@: Attempt to create %@", v4, v5);
}

void sub_100032E3C(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_10001A62C((void *)&_mh_execute_header, a2, a3, "%@: compileModel is JITModel", (uint8_t *)a2);
}

void sub_100032E88(void *a1, const char *a2, uint64_t a3)
{
  int v5 = a1;
  int v6 = NSStringFromSelector(a2);
  int v7 = 138412546;
  __int16 v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@: %@", (uint8_t *)&v7, 0x16u);
}

void sub_100032F48(void *a1, const char *a2)
{
  id v3 = a1;
  int v4 = NSStringFromSelector(a2);
  sub_100026F5C();
  sub_10001B3B4((void *)&_mh_execute_header, v5, v6, "%@: lAttr=%@", v7, v8, v9, v10, v11);
}

void sub_100032FEC(void *a1, const char *a2)
{
  id v3 = a1;
  int v4 = NSStringFromSelector(a2);
  sub_100026F5C();
  sub_10001B3B4((void *)&_mh_execute_header, v5, v6, "%@: optionsFilePath=%@", v7, v8, v9, v10, v11);
}

void sub_100033090(NSObject *a1)
{
  int v2 = *__error();
  int v3 = 136315650;
  int v4 = "main";
  __int16 v5 = 2080;
  uint64_t v6 = "com.apple.aned";
  __int16 v7 = 1024;
  int v8 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "%s: _set_user_dir_suffix(\"%s\") FAILED. errno=%d", (uint8_t *)&v3, 0x1Cu);
}

void sub_100033148(uint64_t a1, NSObject *a2)
{
  int v3 = NSStringFromSelector(*(SEL *)(a1 + 112));
  int v4 = 138412802;
  __int16 v5 = v3;
  __int16 v6 = 2112;
  __int16 v7 = kANEFModelANECIRValue[0];
  __int16 v8 = 2112;
  uint64_t v9 = kANEFModelMILValue[0];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@: Can not specify both \"%@\" and \"%@\"", (uint8_t *)&v4, 0x20u);
}

void sub_100033210(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = *a1;
  int v6 = *__error();
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "releaseSandboxExtension:(%@) handle:(%lld) failed (%d)", (uint8_t *)&v7, 0x1Cu);
}

void sub_1000332C8(uint64_t a1, char a2, NSObject *a3)
{
  uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 112));
  int v6 = 138412546;
  int v7 = v5;
  __int16 v8 = 1024;
  int v9 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@: isEncryptedModel=%d", (uint8_t *)&v6, 0x12u);
}

uint64_t ANECCompile()
{
  return _ANECCompile();
}

uint64_t ANECCompileJIT()
{
  return _ANECCompileJIT();
}

uint64_t ANECCreateModelDictionary()
{
  return _ANECCreateModelDictionary();
}

uint64_t ANECGetValidateNetworkSupportedVersion()
{
  return _ANECGetValidateNetworkSupportedVersion();
}

uint64_t ANECValidateNetworkCreate()
{
  return _ANECValidateNetworkCreate();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return _IOCFSerialize(object, options);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return _IOCFUnserializeBinary(buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return _IOSurfaceCreate(properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return _IOSurfaceGetAllocSize(buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return _IOSurfaceGetBaseAddress(buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return _IOSurfaceGetID(buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceLock(buffer, options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceUnlock(buffer, options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetSInt64Answer()
{
  return _MGGetSInt64Answer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return _PPSCreateTelemetryIdentifier();
}

uint64_t PPSSendTelemetry()
{
  return _PPSSendTelemetry();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return _SecTaskCopyTeamIdentifier();
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t MIL::ParserOptions::Make(MIL::ParserOptions *this)
{
  return MIL::ParserOptions::Make(this);
}

uint64_t MIL::Text::SerializeToFile()
{
  return MIL::Text::SerializeToFile();
}

uint64_t MIL::Text::SerializerOptions::Make(MIL::Text::SerializerOptions *this)
{
  return MIL::Text::SerializerOptions::Make(this);
}

uint64_t MIL::Text::ParseProgramFromFile()
{
  return MIL::Text::ParseProgramFromFile();
}

uint64_t MIL::Opsets::Common::CreateMILContext(MIL::Opsets::Common *this)
{
  return MIL::Opsets::Common::CreateMILContext(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
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

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
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

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_decode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return _copyfile_state_alloc();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return _copyfile_state_free(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

uint64_t espresso_context_set_int_option()
{
  return _espresso_context_set_int_option();
}

uint64_t espresso_create_context()
{
  return _espresso_create_context();
}

uint64_t espresso_create_plan()
{
  return _espresso_create_plan();
}

uint64_t espresso_dump_ir()
{
  return _espresso_dump_ir();
}

uint64_t espresso_network_compiler_set_metadata_key()
{
  return _espresso_network_compiler_set_metadata_key();
}

uint64_t espresso_plan_add_network()
{
  return _espresso_plan_add_network();
}

uint64_t espresso_plan_build()
{
  return _espresso_plan_build();
}

uint64_t espresso_plan_destroy()
{
  return _espresso_plan_destroy();
}

uint64_t espresso_plan_get_error_info()
{
  return _espresso_plan_get_error_info();
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _ffsctl(a1, a2, a3, a4);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

uint64_t kdebug_is_enabled()
{
  return _kdebug_is_enabled();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

uint64_t proc_set_cpumon_defaults()
{
  return _proc_set_cpumon_defaults();
}

uint64_t proc_set_cpumon_params()
{
  return _proc_set_cpumon_params();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return _xpc_equal(object1, object2);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend_SHACode(void *a1, const char *a2, ...)
{
  return [a1 SHACode];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_agentMask(void *a1, const char *a2, ...)
{
  return [a1 agentMask];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_aneArchitectureTypeStr(void *a1, const char *a2, ...)
{
  return [a1 aneArchitectureTypeStr];
}

id objc_msgSend_aneBoardType(void *a1, const char *a2, ...)
{
  return [a1 aneBoardType];
}

id objc_msgSend_aneBoardtype(void *a1, const char *a2, ...)
{
  return [a1 aneBoardtype];
}

id objc_msgSend_aneSubType(void *a1, const char *a2, ...)
{
  return [a1 aneSubType];
}

id objc_msgSend_aneSubTypeProductVariant(void *a1, const char *a2, ...)
{
  return [a1 aneSubTypeProductVariant];
}

id objc_msgSend_aneSubTypeVariant(void *a1, const char *a2, ...)
{
  return [a1 aneSubTypeVariant];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bootArgs(void *a1, const char *a2, ...)
{
  return [a1 bootArgs];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return [a1 buildVersion];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheDir(void *a1, const char *a2, ...)
{
  return [a1 cacheDir];
}

id objc_msgSend_cacheURLIdentifier(void *a1, const char *a2, ...)
{
  return [a1 cacheURLIdentifier];
}

id objc_msgSend_common(void *a1, const char *a2, ...)
{
  return [a1 common];
}

id objc_msgSend_compiler(void *a1, const char *a2, ...)
{
  return [a1 compiler];
}

id objc_msgSend_compilerServiceAccessEntitlement(void *a1, const char *a2, ...)
{
  return [a1 compilerServiceAccessEntitlement];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return [a1 completionHandler];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return [a1 controller];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_coreAnalyticsANEUsageDefaultReportedClient(void *a1, const char *a2, ...)
{
  return [a1 coreAnalyticsANEUsageDefaultReportedClient];
}

id objc_msgSend_coreAnalyticsANEUsageKeyGroup(void *a1, const char *a2, ...)
{
  return [a1 coreAnalyticsANEUsageKeyGroup];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createModelCacheDictionary(void *a1, const char *a2, ...)
{
  return [a1 createModelCacheDictionary];
}

id objc_msgSend_currentAsyncRequestsInFlight(void *a1, const char *a2, ...)
{
  return [a1 currentAsyncRequestsInFlight];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return [a1 daemon];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultANECIRFileName(void *a1, const char *a2, ...)
{
  return [a1 defaultANECIRFileName];
}

id objc_msgSend_defaultCompilerOptionsFilename(void *a1, const char *a2, ...)
{
  return [a1 defaultCompilerOptionsFilename];
}

id objc_msgSend_defaultMILFileName(void *a1, const char *a2, ...)
{
  return [a1 defaultMILFileName];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWeightFileName(void *a1, const char *a2, ...)
{
  return [a1 defaultWeightFileName];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_enableApfsPurging(void *a1, const char *a2, ...)
{
  return [a1 enableApfsPurging];
}

id objc_msgSend_errorDomainCompiler(void *a1, const char *a2, ...)
{
  return [a1 errorDomainCompiler];
}

id objc_msgSend_errorDomainEspresso(void *a1, const char *a2, ...)
{
  return [a1 errorDomainEspresso];
}

id objc_msgSend_errorDomainGeneric(void *a1, const char *a2, ...)
{
  return [a1 errorDomainGeneric];
}

id objc_msgSend_errorDomainVirtIO(void *a1, const char *a2, ...)
{
  return [a1 errorDomainVirtIO];
}

id objc_msgSend_eventPort(void *a1, const char *a2, ...)
{
  return [a1 eventPort];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_exchangeBuildVersionInfo(void *a1, const char *a2, ...)
{
  return [a1 exchangeBuildVersionInfo];
}

id objc_msgSend_executionCriteria(void *a1, const char *a2, ...)
{
  return [a1 executionCriteria];
}

id objc_msgSend_executionDelay(void *a1, const char *a2, ...)
{
  return [a1 executionDelay];
}

id objc_msgSend_fileAttributes(void *a1, const char *a2, ...)
{
  return [a1 fileAttributes];
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return [a1 fileModificationDate];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return [a1 fileType];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_framework(void *a1, const char *a2, ...)
{
  return [a1 framework];
}

id objc_msgSend_getCacheURLIdentifier(void *a1, const char *a2, ...)
{
  return [a1 getCacheURLIdentifier];
}

id objc_msgSend_getDeviceInfo(void *a1, const char *a2, ...)
{
  return [a1 getDeviceInfo];
}

id objc_msgSend_getValidateNetworkVersion(void *a1, const char *a2, ...)
{
  return [a1 getValidateNetworkVersion];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_hasANE(void *a1, const char *a2, ...)
{
  return [a1 hasANE];
}

id objc_msgSend_hasDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 hasDirectoryPath];
}

id objc_msgSend_hwExecutionTime(void *a1, const char *a2, ...)
{
  return [a1 hwExecutionTime];
}

id objc_msgSend_identifierSource(void *a1, const char *a2, ...)
{
  return [a1 identifierSource];
}

id objc_msgSend_initWithSingletonAccess(void *a1, const char *a2, ...)
{
  return [a1 initWithSingletonAccess];
}

id objc_msgSend_inputArray(void *a1, const char *a2, ...)
{
  return [a1 inputArray];
}

id objc_msgSend_inputBufferInfoIndex(void *a1, const char *a2, ...)
{
  return [a1 inputBufferInfoIndex];
}

id objc_msgSend_inputFreeValue(void *a1, const char *a2, ...)
{
  return [a1 inputFreeValue];
}

id objc_msgSend_inputIndexArray(void *a1, const char *a2, ...)
{
  return [a1 inputIndexArray];
}

id objc_msgSend_instanceName(void *a1, const char *a2, ...)
{
  return [a1 instanceName];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_intermediateBufferHandle(void *a1, const char *a2, ...)
{
  return [a1 intermediateBufferHandle];
}

id objc_msgSend_internalLibraryPath(void *a1, const char *a2, ...)
{
  return [a1 internalLibraryPath];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_ioSurface(void *a1, const char *a2, ...)
{
  return [a1 ioSurface];
}

id objc_msgSend_ioSurfacesCount(void *a1, const char *a2, ...)
{
  return [a1 ioSurfacesCount];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isOpenLoop(void *a1, const char *a2, ...)
{
  return [a1 isOpenLoop];
}

id objc_msgSend_isPrivileged(void *a1, const char *a2, ...)
{
  return [a1 isPrivileged];
}

id objc_msgSend_isVirtualMachine(void *a1, const char *a2, ...)
{
  return [a1 isVirtualMachine];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_modelAttributes(void *a1, const char *a2, ...)
{
  return [a1 modelAttributes];
}

id objc_msgSend_modelBinaryName(void *a1, const char *a2, ...)
{
  return [a1 modelBinaryName];
}

id objc_msgSend_modelCacheRetainName(void *a1, const char *a2, ...)
{
  return [a1 modelCacheRetainName];
}

id objc_msgSend_modelDataVaultDirectory(void *a1, const char *a2, ...)
{
  return [a1 modelDataVaultDirectory];
}

id objc_msgSend_modelSourceStoreName(void *a1, const char *a2, ...)
{
  return [a1 modelSourceStoreName];
}

id objc_msgSend_modelURL(void *a1, const char *a2, ...)
{
  return [a1 modelURL];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_negotiatedCapabilityMask(void *a1, const char *a2, ...)
{
  return [a1 negotiatedCapabilityMask];
}

id objc_msgSend_negotiatedDataInterfaceVersion(void *a1, const char *a2, ...)
{
  return [a1 negotiatedDataInterfaceVersion];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_noSandboxExtension(void *a1, const char *a2, ...)
{
  return [a1 noSandboxExtension];
}

id objc_msgSend_notRecentlyUsedSecondsThreshold(void *a1, const char *a2, ...)
{
  return [a1 notRecentlyUsedSecondsThreshold];
}

id objc_msgSend_numANEs(void *a1, const char *a2, ...)
{
  return [a1 numANEs];
}

id objc_msgSend_outputArray(void *a1, const char *a2, ...)
{
  return [a1 outputArray];
}

id objc_msgSend_outputIndexArray(void *a1, const char *a2, ...)
{
  return [a1 outputIndexArray];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_perfCounterData(void *a1, const char *a2, ...)
{
  return [a1 perfCounterData];
}

id objc_msgSend_perfStats(void *a1, const char *a2, ...)
{
  return [a1 perfStats];
}

id objc_msgSend_perfStatsArray(void *a1, const char *a2, ...)
{
  return [a1 perfStatsArray];
}

id objc_msgSend_perfStatsMask(void *a1, const char *a2, ...)
{
  return [a1 perfStatsMask];
}

id objc_msgSend_performanceCounters(void *a1, const char *a2, ...)
{
  return [a1 performanceCounters];
}

id objc_msgSend_ppsCategoryForANE(void *a1, const char *a2, ...)
{
  return [a1 ppsCategoryForANE];
}

id objc_msgSend_ppsSubsystemForANE(void *a1, const char *a2, ...)
{
  return [a1 ppsSubsystemForANE];
}

id objc_msgSend_procedureArray(void *a1, const char *a2, ...)
{
  return [a1 procedureArray];
}

id objc_msgSend_procedureIndex(void *a1, const char *a2, ...)
{
  return [a1 procedureIndex];
}

id objc_msgSend_procedureSymbol(void *a1, const char *a2, ...)
{
  return [a1 procedureSymbol];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processModelShareAccessEntitlement(void *a1, const char *a2, ...)
{
  return [a1 processModelShareAccessEntitlement];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return [a1 productName];
}

id objc_msgSend_programHandle(void *a1, const char *a2, ...)
{
  return [a1 programHandle];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_queueDepth(void *a1, const char *a2, ...)
{
  return [a1 queueDepth];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_removeStaleModels(void *a1, const char *a2, ...)
{
  return [a1 removeStaleModels];
}

id objc_msgSend_requestsInFlight(void *a1, const char *a2, ...)
{
  return [a1 requestsInFlight];
}

id objc_msgSend_restrictedAccessEntitlement(void *a1, const char *a2, ...)
{
  return [a1 restrictedAccessEntitlement];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sandboxExtension(void *a1, const char *a2, ...)
{
  return [a1 sandboxExtension];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setIndex(void *a1, const char *a2, ...)
{
  return [a1 setIndex];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedEvent(void *a1, const char *a2, ...)
{
  return [a1 sharedEvent];
}

id objc_msgSend_sharedEvents(void *a1, const char *a2, ...)
{
  return [a1 sharedEvents];
}

id objc_msgSend_signalEvents(void *a1, const char *a2, ...)
{
  return [a1 signalEvents];
}

id objc_msgSend_signalNotRequired(void *a1, const char *a2, ...)
{
  return [a1 signalNotRequired];
}

id objc_msgSend_signalValue(void *a1, const char *a2, ...)
{
  return [a1 signalValue];
}

id objc_msgSend_signaledValue(void *a1, const char *a2, ...)
{
  return [a1 signaledValue];
}

id objc_msgSend_sourceURL(void *a1, const char *a2, ...)
{
  return [a1 sourceURL];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startDanglingModelGC(void *a1, const char *a2, ...)
{
  return [a1 startDanglingModelGC];
}

id objc_msgSend_startOffset(void *a1, const char *a2, ...)
{
  return [a1 startOffset];
}

id objc_msgSend_statType(void *a1, const char *a2, ...)
{
  return [a1 statType];
}

id objc_msgSend_stats(void *a1, const char *a2, ...)
{
  return [a1 stats];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_symbolIndex(void *a1, const char *a2, ...)
{
  return [a1 symbolIndex];
}

id objc_msgSend_systemLibraryPath(void *a1, const char *a2, ...)
{
  return [a1 systemLibraryPath];
}

id objc_msgSend_systemModelsCacheDirectory(void *a1, const char *a2, ...)
{
  return [a1 systemModelsCacheDirectory];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_transactionHandle(void *a1, const char *a2, ...)
{
  return [a1 transactionHandle];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_usecount(void *a1, const char *a2, ...)
{
  return [a1 usecount];
}

id objc_msgSend_userModelDataVaultDirectory(void *a1, const char *a2, ...)
{
  return [a1 userModelDataVaultDirectory];
}

id objc_msgSend_validate(void *a1, const char *a2, ...)
{
  return [a1 validate];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_waitEvents(void *a1, const char *a2, ...)
{
  return [a1 waitEvents];
}

id objc_msgSend_weightArray(void *a1, const char *a2, ...)
{
  return [a1 weightArray];
}

id objc_msgSend_weightSymbol(void *a1, const char *a2, ...)
{
  return [a1 weightSymbol];
}

id objc_msgSend_weightURL(void *a1, const char *a2, ...)
{
  return [a1 weightURL];
}

id objc_msgSend_weightsBuffer(void *a1, const char *a2, ...)
{
  return [a1 weightsBuffer];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}