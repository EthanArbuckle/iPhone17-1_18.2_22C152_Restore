uint64_t MyH11ANEDeviceMessageNotification(H11ANE::H11ANEDevice *a1, int a2, void *a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void, uint64_t *);
  uint64_t v28;
  uint64_t v30[8];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v31 = v8;
  v32 = v7;
  v33 = v4;
  v34 = v5;
  v35 = v6;
  switch(a2)
  {
    case -469794815:
      v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      v18 = 0x1000000015;
      if (!v10) {
        goto LABEL_12;
      }
      MyH11ANEDeviceMessageNotification(v10, v11, v12, v13, v14, v15, v16, v17);
      if (a4) {
        goto LABEL_13;
      }
      return 0;
    case -469794814:
      v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      v18 = 0x1100000015;
      if (!v19) {
        goto LABEL_12;
      }
      MyH11ANEDeviceMessageNotification(v19, v20, v21, v22, v23, v24, v25, v26);
      if (a4) {
        goto LABEL_13;
      }
      return 0;
    case -469794813:
      v18 = 22;
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_12;
      }
      MyH11ANEDeviceMessageNotification();
      if (a4) {
        goto LABEL_13;
      }
      return 0;
    case -469794812:
      v18 = 23;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        MyH11ANEDeviceMessageNotification();
        if (!a4) {
          return 0;
        }
      }
      else
      {
LABEL_12:
        if (!a4) {
          return 0;
        }
      }
LABEL_13:
      v27 = (void (*)(uint64_t, void *, void, uint64_t *))a4[3];
      if (v27)
      {
        v28 = a4[2];
        v30[0] = v18;
        v27(v28, a4 + 8, 0, v30);
      }
      return 0;
    default:
      return 0;
  }
}

uint64_t MyH11ANEDeviceMessageNotification()
{
  return 0;
}

uint64_t H11ANEProgramPrepare(uint64_t a1, int *a2, char a3)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  uint64_t v3 = 2;
  if (!a1 || !a2) {
    return v3;
  }
  if (a3)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    if (v6)
    {
      uint64_t v7 = *(void *)(*(void *)v6 + 16);
      uint64_t v8 = *(void *)(v7 + 8);
      if (v8)
      {
        if (*(_DWORD *)(v7 + 32) == 1)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            H11ANEProgramPrepare_cold_3();
          }
          return 20;
        }
        os_signpost_id_t v33 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2410);
        v34 = +[ANEServicesLog handle];
        if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v35 = v34;
          if (os_signpost_enabled(v34))
          {
            uint64_t v36 = *(void *)(a1 + 112);
            int v37 = *a2;
            *(_DWORD *)v56 = 134218240;
            *(void *)&v56[4] = v36;
            __int16 v57 = 1024;
            *(_DWORD *)v58 = v37;
            _os_signpost_emit_with_name_impl(&dword_21209C000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "ServicesProgramPrepare", "progHandle=%llx priority=%x", v56, 0x12u);
          }
        }
        int v38 = *a2;
        *(unsigned char *)(v6 + 3552) = *a2;
        if ((v38 & 0xFE) != 0)
        {
          if (v38 < 8u)
          {
LABEL_29:
            int v48 = a2[2];
            *(_DWORD *)(v6 + 3556) = v48;
            *(void *)v56 = *(void *)(v6 + 3496);
            v56[8] = *((unsigned char *)a2 + 12);
            int v60 = v48;
            int v62 = *(_DWORD *)(a1 + 168);
            v56[9] = (a2[1] & 4) != 0;
            *(void *)&v58[2] = *((void *)a2 + 2);
            v56[10] = 1;
            char v61 = *((unsigned char *)a2 + 24);
            uint64_t v3 = H11ANE::H11ANEDevice::ANE_ProgramPrepare(v8, (uint64_t *)v56);
            if (v3)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                H11ANEProgramPrepare_cold_4();
              }
              if ((int)v3 > -536870185)
              {
                int v55 = v3 + 536870176;
                uint64_t v3 = 4;
                switch(v55)
                {
                  case 0:
                    uint64_t v3 = 26;
                    break;
                  case 2:
                    uint64_t v3 = 23;
                    break;
                  case 3:
                    uint64_t v3 = 10;
                    break;
                  case 7:
                    uint64_t v3 = 29;
                    break;
                  case 11:
                    uint64_t v3 = 21;
                    break;
                  case 13:
                    uint64_t v3 = 27;
                    break;
                  case 14:
                    uint64_t v3 = 28;
                    break;
                  case 16:
                    break;
                  default:
LABEL_49:
                    uint64_t v3 = 18;
                    break;
                }
              }
              else
              {
                switch(v3)
                {
                  case 0xE00002BD:
                    uint64_t v3 = 1;
                    break;
                  case 0xE00002BE:
                    uint64_t v3 = 5;
                    break;
                  case 0xE00002BF:
                  case 0xE00002C0:
                  case 0xE00002C3:
                  case 0xE00002C4:
                  case 0xE00002C5:
                  case 0xE00002C6:
                    goto LABEL_49;
                  case 0xE00002C1:
                    uint64_t v3 = 20;
                    break;
                  case 0xE00002C2:
                    uint64_t v3 = 2;
                    break;
                  case 0xE00002C7:
                    uint64_t v3 = 24;
                    break;
                  default:
                    if (v3 == -536870191)
                    {
                      uint64_t v3 = 19;
                    }
                    else
                    {
                      if (v3 != -536870186) {
                        goto LABEL_49;
                      }
                      uint64_t v3 = 15;
                    }
                    break;
                }
              }
            }
            else
            {
              *(void *)(a1 + 152) = v59;
              *(void *)(v6 + 3480) = 0;
              long long v49 = *((_OWORD *)a2 + 1);
              *(_OWORD *)(v6 + 3448) = *(_OWORD *)a2;
              *(_OWORD *)(v6 + 3464) = v49;
            }
            v50 = +[ANEServicesLog handle];
            if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v51 = v50;
              if (os_signpost_enabled(v50))
              {
                uint64_t v52 = *(void *)(a1 + 112);
                int v53 = *a2;
                *(_DWORD *)v56 = 134218240;
                *(void *)&v56[4] = v52;
                __int16 v57 = 1024;
                *(_DWORD *)v58 = v53;
                _os_signpost_emit_with_name_impl(&dword_21209C000, v51, OS_SIGNPOST_INTERVAL_END, v33, "ServicesProgramPrepare", "progHandle=%llx priority=%x", v56, 0x12u);
              }
            }
            return v3;
          }
          char v39 = 7;
        }
        else
        {
          BOOL v40 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v40) {
            H11ANEProgramPrepare_cold_5(v40, v41, v42, v43, v44, v45, v46, v47);
          }
          char v39 = 2;
        }
        *(unsigned char *)(v6 + 3552) = v39;
        goto LABEL_29;
      }
      BOOL v25 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v25) {
        H11ANEProgramPrepare_cold_2(v25, v26, v27, v28, v29, v30, v31, v32);
      }
      return 8;
    }
    else
    {
      BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v17) {
        H11ANEProgramPrepare_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
      }
      return 1;
    }
  }
  else
  {
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v9) {
      H11ANEProgramPrepare_cold_6(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    return 3;
  }
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramPrepare(uint64_t a1, uint64_t *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097089;
  if (!*(_DWORD *)(a1 + 64)) {
    return 3758097101;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2018);
    uint64_t v6 = +[ANEServicesLog handle];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v7 = v6;
      if (os_signpost_enabled(v6))
      {
        uint64_t v8 = *a2;
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v8;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "H11ANEDeviceProgramPrepare", "progHandle=%llx", buf, 0xCu);
      }
    }
    size_t outputStructCnt = 56;
    uint64_t v2 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 64), 4u, a2, 0x38uLL, a2, &outputStructCnt);
    BOOL v9 = +[ANEServicesLog handle];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v10 = v9;
      if (os_signpost_enabled(v9))
      {
        uint64_t v11 = *a2;
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v11;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v10, OS_SIGNPOST_INTERVAL_END, v5, "H11ANEDeviceProgramPrepare", "progHandle=%llx", buf, 0xCu);
      }
    }
  }
  return v2;
}

uint64_t H11ANEDeviceOpen(uint64_t a1, int *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1)
  {
    os_signpost_id_t v3 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2400);
    v4 = +[ANEServicesLog handle];
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v5 = v4;
      if (os_signpost_enabled(v4))
      {
        int v6 = *a2;
        *(_DWORD *)buf = 67109120;
        int v9 = v6;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "ServicesDeviceOpen", "UsageType=%d", buf, 8u);
      }
    }
    operator new();
  }
  return 2;
}

uint64_t H11ANE::H11ANEFrameReceiver::registerH11ANEDevice(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 352) = a2;
  return 0;
}

uint64_t H11ANE::H11ANEFrameReceiver::startReceive(H11ANE::H11ANEFrameReceiver *this)
{
  os_signpost_id_t v2 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2200);
  os_signpost_id_t v3 = +[ANEServicesLog handle];
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "H11ANEFrameReceiverStart", (const char *)&unk_2120C54A2, buf, 2u);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 112));
  if (*(_DWORD *)this == 1)
  {
    uint64_t v5 = 3758097122;
  }
  else
  {
    uint64_t v5 = 0;
    *((unsigned char *)this + 408) = 0;
    *(_DWORD *)this = 1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 112));
  int v6 = +[ANEServicesLog handle];
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v7 = v6;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)int v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v7, OS_SIGNPOST_INTERVAL_END, v2, "H11ANEFrameReceiverStart", (const char *)&unk_2120C54A2, v9, 2u);
    }
  }
  return v5;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramCreate(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = 3758097090;
  if (!*(_DWORD *)(a1 + 64)) {
    return 3758097101;
  }
  if (a3)
  {
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2010);
    uint64_t v8 = +[ANEServicesLog handle];
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      int v9 = v8;
      if (os_signpost_enabled(v8))
      {
        uint64_t v10 = *a2;
        int v16 = 134217984;
        uint64_t v17 = v10;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "H11ANEDeviceProgramCreate", "prodAddr=%llx", (uint8_t *)&v16, 0xCu);
      }
    }
    a2[2] = (uint64_t)a3;
    a2[3] = 730936;
    if (*(unsigned char *)(a1 + 24)) {
      uint64_t v3 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 64), 3u, a2, 0xD98uLL, 0, 0);
    }
    else {
      uint64_t v3 = 0;
    }
    uint64_t v11 = +[ANEServicesLog handle];
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v12 = v11;
      if (os_signpost_enabled(v11))
      {
        uint64_t v13 = *a2;
        uint64_t v14 = *a3;
        int v16 = 134218240;
        uint64_t v17 = v13;
        __int16 v18 = 2048;
        uint64_t v19 = v14;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v12, OS_SIGNPOST_INTERVAL_END, v7, "H11ANEDeviceProgramCreate", "prodAddr=%llx progHandle=%llx", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  return v3;
}

void *AllocateStatsBufferPool(void *result, unsigned int a2, int a3, unint64_t a4, H11ANE::H11ANEDevice *a5)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (result)
  {
    if (a3) {
      operator new();
    }
    *result = 0;
  }
  return result;
}

void sub_21209F338(_Unwind_Exception *a1)
{
  MEMORY[0x21667E660](v1, 0x1030C4081A5006CLL);
  _Unwind_Resume(a1);
}

uint64_t IOReturnToANEReturn(int a1)
{
  if (a1 <= -536870185)
  {
    switch(a1)
    {
      case -536870211:
        uint64_t result = 1;
        break;
      case -536870210:
        uint64_t result = 5;
        break;
      case -536870209:
      case -536870208:
      case -536870205:
      case -536870204:
      case -536870203:
      case -536870202:
        goto LABEL_13;
      case -536870207:
        uint64_t result = 20;
        break;
      case -536870206:
        uint64_t result = 2;
        break;
      case -536870201:
        uint64_t result = 24;
        break;
      default:
        if (a1 == -536870191)
        {
          uint64_t result = 19;
        }
        else if (a1 == -536870186)
        {
          uint64_t result = 15;
        }
        else
        {
LABEL_13:
          uint64_t result = 18;
        }
        break;
    }
  }
  else
  {
    int v1 = a1 + 536870176;
    uint64_t result = 4;
    switch(v1)
    {
      case 0:
        uint64_t result = 26;
        break;
      case 2:
        uint64_t result = 23;
        break;
      case 3:
        uint64_t result = 10;
        break;
      case 7:
        uint64_t result = 29;
        break;
      case 11:
        uint64_t result = 21;
        break;
      case 13:
        uint64_t result = 27;
        break;
      case 14:
        uint64_t result = 28;
        break;
      case 16:
        return result;
      default:
        goto LABEL_13;
    }
  }
  return result;
}

uint64_t H11ANE::CreateH11ANEDeviceController(H11ANE *this, H11ANE::H11ANEDeviceController **a2, int (*a3)(H11ANE::H11ANEDeviceController *, void *, H11ANE::H11ANEDevice *), void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  pthread_t v14 = 0;
  H11ANE::H11ANEThreadReadySyncer::H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)&v16);
  v15[0] = 0;
  v15[1] = a2;
  v15[2] = a3;
  v15[3] = &v16;
  int v7 = pthread_attr_init(&v17);
  if (v7)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "pthread_attr_init() failed. Error: %d\n", v7);
    goto LABEL_12;
  }
  sched_param v13 = (sched_param)58;
  if (pthread_attr_setschedparam(&v17, &v13))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "pthread_attr_setschedparam() failed. Error: %d\n");
LABEL_9:
    int v8 = 0;
    goto LABEL_10;
  }
  if (pthread_attr_setdetachstate(&v17, 1))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "pthread_attr_setdetachstate() failed. Error: %d\n");
    goto LABEL_9;
  }
  if (pthread_create(&v14, &v17, (void *(__cdecl *)(void *))H11ANE::H11ANEServicesThreadStart, v15))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "pthread_create() failed. Error: %d\n");
    goto LABEL_9;
  }
  int v8 = 1;
LABEL_10:
  pthread_attr_destroy(&v17);
  if (v8)
  {
    H11ANE::H11ANEThreadReadySyncer::wait(&v16);
    int v9 = 0;
    goto LABEL_13;
  }
LABEL_12:
  int v9 = 1;
LABEL_13:
  uint64_t v10 = v15[0];
  *(void *)this = v15[0];
  if (!v10) {
    int v9 = 1;
  }
  if (v9) {
    uint64_t v11 = 3758097084;
  }
  else {
    uint64_t v11 = 0;
  }
  H11ANE::H11ANEThreadReadySyncer::~H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)&v16);
  return v11;
}

void sub_21209F640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  H11ANE::H11ANEThreadReadySyncer::~H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)va);
  _Unwind_Resume(a1);
}

void H11ANE::CreateH11ANEFrameReceiver()
{
}

void sub_21209F6FC(_Unwind_Exception *a1)
{
  MEMORY[0x21667E660](v1, 0x10A0C4085C1416BLL);
  _Unwind_Resume(a1);
}

void H11ANE::H11ANEThreadReadySyncer::~H11ANEThreadReadySyncer(H11ANE::H11ANEThreadReadySyncer *this)
{
}

H11ANE::H11ANEThreadReadySyncer *H11ANE::H11ANEThreadReadySyncer::H11ANEThreadReadySyncer(H11ANE::H11ANEThreadReadySyncer *this)
{
  return this;
}

H11ANE::H11ANEFrameReceiver *H11ANE::H11ANEFrameReceiver::H11ANEFrameReceiver(H11ANE::H11ANEFrameReceiver *this, H11ANE::H11ANEDevice *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *(_DWORD *)this = 0;
  *((unsigned char *)this + 248) = 0;
  *((void *)this + 41) = 0;
  *((_DWORD *)this + 84) = 0;
  *((void *)this + 43) = 0;
  *((void *)this + 44) = a2;
  *(_OWORD *)((char *)this + 36pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 392) = 0u;
  *((void *)this + 3) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 112), 0);
  pthread_mutex_init((pthread_mutex_t *)this + 4, 0);
  *((_DWORD *)this + 14) = 0;
  pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0);
  *((void *)this + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  *((void *)this + 52) = 0;
  pthread_mutexattr_init(&v4);
  pthread_mutexattr_settype(&v4, 2);
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 176), &v4);
  pthread_mutexattr_destroy(&v4);
  *((void *)this + 3pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = dispatch_semaphore_create(0);
  return this;
}

void sub_21209F888(_Unwind_Exception *a1)
{
  std::deque<H11ANE::H11ANEFrameReceiverRequest *>::~deque[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t H11ANE::H11ANEFrameReceiver::addIODispatcherToRunLoop(H11ANE::H11ANEFrameReceiver *this)
{
  uint64_t v2 = IOCreateReceivePort(0x39u, (mach_port_t *)this + 84);
  if (!v2)
  {
    uint64_t v2 = 3758097085;
    Boolean shouldFreeInfo = 0;
    context.version = 1;
    context.info = this;
    memset(&context.retain, 0, 24);
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    pthread_mutexattr_t v4 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x263EFFB08], *((_DWORD *)this + 84), MEMORY[0x263F0EBE0], &context, &shouldFreeInfo);
    *((void *)this + 41) = v4;
    if (v4)
    {
      RunLoopSource = CFMachPortCreateRunLoopSource(v3, v4, 0);
      *((void *)this + 43) = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopAddSource(*((CFRunLoopRef *)this + 1), RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
        return 0;
      }
    }
  }
  return v2;
}

uint64_t H11ANEHandleDeviceOpen(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 8pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(void *)a2 = *(void *)(a3 + 8);
  *(_DWORD *)(a2 + 24) = *(_DWORD *)(a3 + 24);
  *(void *)(a2 + 8) = H11ANE::H11ANEFrameReceiver::FrameDone;
  *(void *)(a2 + 16) = a5;
  int v7 = H11ANE::H11ANEDevice::H11ANEDeviceOpen(a1, (uint64_t)MyH11ANEDeviceMessageNotification, a4, *(_DWORD *)a3, (long long *)a2);
  if (*(_DWORD *)(a1 + 136) == 1)
  {
    if (v7 == -536870174)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 67109120;
        int v16 = -536870174;
        _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not open LB (possible missing entitlement) - status=0x%x", (uint8_t *)&v15, 8u);
      }
      return 23;
    }
    else if (v7)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        H11ANEHandleDeviceOpen_cold_1();
      }
      if (v7 <= -536870185)
      {
        switch(v7)
        {
          case -536870211:
            return 1;
          case -536870210:
            return 5;
          case -536870209:
          case -536870208:
          case -536870205:
          case -536870204:
          case -536870203:
          case -536870202:
            goto LABEL_42;
          case -536870207:
            return 20;
          case -536870206:
            return 2;
          case -536870201:
            return 24;
          default:
            goto LABEL_26;
        }
      }
      uint64_t result = 4;
      switch(v7)
      {
        case -536870176:
          return 26;
        case -536870175:
        case -536870174:
        case -536870172:
        case -536870171:
        case -536870170:
        case -536870168:
        case -536870167:
        case -536870166:
        case -536870164:
        case -536870161:
          goto LABEL_42;
        case -536870173:
          return 10;
        case -536870169:
          return 29;
        case -536870165:
          return 21;
        case -536870163:
          return 27;
        case -536870162:
          return 28;
        case -536870160:
          return result;
        default:
          if (v7 != -536870184) {
            goto LABEL_42;
          }
          goto LABEL_43;
      }
    }
    else
    {
      BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      uint64_t result = 0;
      if (v8)
      {
        uint32_t v10 = *(_DWORD *)a3;
        int v15 = 67109120;
        int v16 = v10;
        uint64_t v11 = &_os_log_internal;
        uint64_t v12 = "LB Device Open succeeded with usage type: %d\n";
LABEL_13:
        _os_log_impl(&dword_21209C000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, 8u);
        return 0;
      }
    }
  }
  else if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      H11ANEHandleDeviceOpen_cold_2();
    }
    if (v7 > -536870185)
    {
      uint64_t result = 4;
      switch(v7)
      {
        case -536870176:
          return 26;
        case -536870175:
        case -536870172:
        case -536870171:
        case -536870170:
        case -536870168:
        case -536870167:
        case -536870166:
        case -536870164:
        case -536870161:
          goto LABEL_42;
        case -536870174:
          return 23;
        case -536870173:
          return 10;
        case -536870169:
          return 29;
        case -536870165:
          return 21;
        case -536870163:
          return 27;
        case -536870162:
          return 28;
        case -536870160:
          return result;
        default:
          if (v7 == -536870184) {
LABEL_43:
          }
            uint64_t result = 22;
          else {
LABEL_42:
          }
            uint64_t result = 18;
          break;
      }
    }
    else
    {
      switch(v7)
      {
        case -536870211:
          return 1;
        case -536870210:
          return 5;
        case -536870209:
        case -536870208:
        case -536870205:
        case -536870204:
        case -536870203:
        case -536870202:
          goto LABEL_42;
        case -536870207:
          return 20;
        case -536870206:
          return 2;
        case -536870201:
          return 24;
        default:
LABEL_26:
          if (v7 == -536870191)
          {
            uint64_t result = 19;
          }
          else
          {
            if (v7 != -536870186) {
              goto LABEL_42;
            }
            uint64_t result = 15;
          }
          break;
      }
    }
  }
  else
  {
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (v13)
    {
      uint32_t v14 = *(_DWORD *)a3;
      int v15 = 67109120;
      int v16 = v14;
      uint64_t v11 = &_os_log_internal;
      uint64_t v12 = "H11ANE Device Open succeeded with usage type: %d\n";
      goto LABEL_13;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::H11ANEDeviceOpen(uint64_t a1, uint64_t a2, uint64_t a3, uint32_t a4, long long *a5)
{
  uint64_t v5 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!a5)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = &v16;
    DWORD2(v17) = -1;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    uint32_t v23 = a4;
    _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "H11ANEDevice::H11ANEDeviceOpen, usage type: %d\n", buf, 8u);
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 72));
  if (*(_DWORD *)(a1 + 64))
  {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 72));
    return 3758097093;
  }
  else
  {
    uint64_t v10 = IOServiceOpen(*(_DWORD *)(a1 + 56), *MEMORY[0x263EF8960], a4, (io_connect_t *)(a1 + 64));
    mach_port_t v11 = *(_DWORD *)(a1 + 64);
    if (!v11 || v10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        H11ANE::H11ANEDevice::H11ANEDeviceOpen(v10);
      }
    }
    else
    {
      size_t outputStructCnt = 96;
      uint64_t v10 = IOConnectCallStructMethod(v11, 0, v5, 0x60uLL, v5, &outputStructCnt);
      if (v10)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          H11ANE::H11ANEDevice::H11ANEDeviceOpen(v10);
        }
      }
      else
      {
        int v13 = *((unsigned __int8 *)v5 + 28);
        *(unsigned char *)(a1 + 24) = v13;
        *(void *)a1 = a2;
        *(void *)(a1 + 8) = a3;
        if (*(_DWORD *)(a1 + 136) != 1)
        {
          uint32_t v14 = (_DWORD *)(a1 + 28);
          if (v13)
          {
            H11ANE::H11ANEDevice::ANE_GetVersion(a1, v14);
            H11ANE::H11ANEDevice::ANE_GetStatus(a1, buf);
            *(_DWORD *)(a1 + 32) = v24;
          }
          else
          {
            *(void *)uint32_t v14 = *(void *)((char *)v5 + 76);
          }
        }
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 72));
  }
  return v10;
}

uint64_t H11ANE::H11ANEThreadReadySyncer::wait(pthread_mutex_t *this)
{
  return pthread_cond_wait((pthread_cond_t *)&this[1], this);
}

uint64_t H11ANE::DestroyH11ANEFrameReceiver(H11ANE *this, H11ANE::H11ANEFrameReceiver *a2)
{
  if (this)
  {
    H11ANE::H11ANEFrameReceiver::completeAllRequests(this);
    CFAllocatorRef v3 = (const void *)*((void *)this + 1);
    H11ANE::H11ANEFrameReceiver::~H11ANEFrameReceiver(this);
    MEMORY[0x21667E660]();
    CFRelease(v3);
  }
  return 0;
}

void H11ANE::H11ANEFrameReceiver::~H11ANEFrameReceiver(H11ANE::H11ANEFrameReceiver *this)
{
  if (*((void *)this + 44))
  {
    if (*(_DWORD *)this) {
      H11ANE::H11ANEFrameReceiver::stopReceive(this);
    }
    if (*((void *)this + 43)) {
      H11ANE::H11ANEFrameReceiver::removeIODispatcherFromRunLoop(this);
    }
    pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 112));
    pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 176));
    pthread_mutex_destroy((pthread_mutex_t *)this + 4);
    uint64_t v2 = *((void *)this + 30);
    if (v2)
    {
      dispatch_release(v2);
      *((void *)this + 3pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
    }
  }
  std::deque<H11ANE::H11ANEFrameReceiverRequest *>::~deque[abi:ne180100]((void *)this + 45);
}

uint64_t std::deque<H11ANE::H11ANEFrameReceiverRequest *>::~deque[abi:ne180100](void *a1)
{
  uint64_t v2 = (void **)a1[1];
  CFAllocatorRef v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      CFAllocatorRef v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 256;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 512;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    int v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

void H11ANE::H11ANEFrameReceiver::removeIODispatcherFromRunLoop(H11ANE::H11ANEFrameReceiver *this)
{
  uint64_t v2 = (__CFRunLoopSource *)*((void *)this + 43);
  if (v2)
  {
    CFRunLoopRemoveSource(*((CFRunLoopRef *)this + 1), v2, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    CFRelease(*((CFTypeRef *)this + 43));
    *((void *)this + 43) = 0;
  }
  uint64_t v3 = (__CFMachPort *)*((void *)this + 41);
  if (v3)
  {
    CFMachPortInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 41));
    *((void *)this + 41) = 0;
  }
  mach_port_name_t v4 = *((_DWORD *)this + 84);
  if (v4)
  {
    mach_port_mod_refs(*MEMORY[0x263EF8960], v4, 1u, -1);
    *((_DWORD *)this + 84) = 0;
  }
}

uint64_t H11ANE::H11ANEFrameReceiver::completeAllRequests(H11ANE::H11ANEFrameReceiver *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 112);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 112));
  if (!*(_DWORD *)this)
  {
    pthread_mutex_unlock(v2);
    return 3758097122;
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 176));
  if (!*((void *)this + 50))
  {
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 176));
    goto LABEL_8;
  }
  *((unsigned char *)this + 248) = 1;
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 176));
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  if (!dispatch_semaphore_wait(*((dispatch_semaphore_t *)this + 30), v3))
  {
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_18;
  }
  printf("DEBUG:H11ANEFrameReceiver: Did not get all pending requests back from kernel. remaining: %d.\n", *((void *)this + 50));
  uint64_t v4 = *((void *)this + 46);
  uint64_t v5 = *((void *)this + 47);
  uint64_t v6 = (void *)(v4 + 8 * (*((void *)this + 49) >> 9));
  if (v5 == v4) {
    int v7 = 0;
  }
  else {
    int v7 = (const void **)(*v6 + 8 * (*((void *)this + 49) & 0x1FFLL));
  }
  while (1)
  {
    if (v5 == v4)
    {
      uint64_t v10 = 0;
    }
    else
    {
      unint64_t v9 = *((void *)this + 50) + *((void *)this + 49);
      uint64_t v10 = *(void *)(v4 + ((v9 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v9 & 0x1FF);
    }
    if (v7 == (const void **)v10) {
      break;
    }
    mach_port_t v11 = *v7++;
    printf("H11ANEFrameReceiver: Request not returned 0x%p\n", v11);
    if ((const void **)((char *)v7 - *v6) == (const void **)4096)
    {
      uint64_t v12 = (const void **)v6[1];
      ++v6;
      int v7 = v12;
    }
    uint64_t v4 = *((void *)this + 46);
    uint64_t v5 = *((void *)this + 47);
  }
  uint64_t v8 = 3758097110;
LABEL_18:
  if (*((_DWORD *)this + 14))
  {
    gettimeofday(&v15, 0);
    unsigned int v13 = 1000 * v15.tv_usec + 1000000 * *((_DWORD *)this + 4);
    v16.tv_sec = v15.tv_sec + v13 / 0x3B9ACA00uLL;
    v16.tv_nsec = v13 % 0x3B9ACA00;
    if (pthread_cond_timedwait((pthread_cond_t *)((char *)this + 64), v2, &v16) == 60
      && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      H11ANE::H11ANEFrameReceiver::stopReceive();
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 176));
  *((unsigned char *)this + 248) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 176));
  pthread_mutex_unlock(v2);
  return v8;
}

uint64_t H11ANE::H11ANEDevice::ANE_GetVersion(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 3758097089;
  mach_port_t v4 = *(_DWORD *)(a1 + 64);
  if (!v4) {
    return 3758097101;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    if (*(_DWORD *)(a1 + 136) == 1)
    {
      return 3758097095;
    }
    else
    {
      uint64_t output = 0;
      uint32_t outputCnt = 1;
      uint64_t result = IOConnectCallScalarMethod(v4, 0x1Eu, 0, 0, &output, &outputCnt);
      if (!result) {
        *a2 = output;
      }
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_GetStatus(uint64_t a1, void *outputStruct)
{
  uint64_t result = 3758097089;
  size_t outputStructCnt = 32;
  mach_port_t v4 = *(_DWORD *)(a1 + 64);
  if (!v4) {
    return 3758097101;
  }
  if (*(unsigned char *)(a1 + 24)) {
    return IOConnectCallStructMethod(v4, 7u, 0, 0, outputStruct, &outputStructCnt);
  }
  return result;
}

void H11ANE::H11ANEServicesThreadStart(uint64_t a1)
{
}

void sub_2120A0540(_Unwind_Exception *a1)
{
  MEMORY[0x21667E660](v1, 0x10A0C40EB27483ALL);
  _Unwind_Resume(a1);
}

uint64_t H11ANE::H11ANEThreadReadySyncer::signalAndUnlock(H11ANE::H11ANEThreadReadySyncer *this)
{
  pthread_cond_signal((pthread_cond_t *)((char *)this + 64));
  return pthread_mutex_unlock((pthread_mutex_t *)this);
}

void *H11ANE::H11ANEDeviceController::H11ANEDeviceController(void *a1, uint64_t a2, uint64_t a3)
{
  a1[7] = 0;
  a1[2] = 0;
  a1[3] = 0;
  a1[4] = a2;
  a1[5] = a3;
  a1[8] = pthread_self();
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  a1[6] = CFRetain(Current);
  return a1;
}

uint64_t H11ANE::H11ANEDeviceController::SetupDeviceController(H11ANE::H11ANEDeviceController *this)
{
  callBacks.version = 0;
  callBacks.retain = 0;
  callBacks.copyDescription = 0;
  callBacks.equal = 0;
  callBacks.release = (CFArrayReleaseCallBack)H11ANE::cfArrayReleaseH11ANEUnitObject;
  CFMutableArrayRef v2 = CFArrayCreateMutable(0, 0, &callBacks);
  *(void *)this = v2;
  if (!v2) {
    return 3758097085;
  }
  uint64_t result = MEMORY[0x21667E2D0](*MEMORY[0x263EF87F0], (char *)this + 8);
  if (!result)
  {
    CFDictionaryRef v4 = IOServiceMatching("H1xANELoadBalancer");
    uint64_t v5 = IONotificationPortCreate(*((_DWORD *)this + 2));
    *((void *)this + 2) = v5;
    RunLoopSource = IONotificationPortGetRunLoopSource(v5);
    *((void *)this + 3) = RunLoopSource;
    if (RunLoopSource)
    {
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 6), RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      if (!IOServiceAddMatchingNotification(*((IONotificationPortRef *)this + 2), "IOServiceMatched", v4, (IOServiceMatchingCallback)H11ANE::LoadBalancerArrivedCallback, this, (io_iterator_t *)this + 14))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v8 = 0;
          _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Found matching service: H1xANELoadBalancer\n", v8, 2u);
        }
        H11ANE::LoadBalancerArrivedCallback(this, *((_DWORD *)this + 14));
      }
      CFDictionaryRef v7 = IOServiceMatching("H11ANEIn");
      uint64_t result = IOServiceAddMatchingNotification(*((IONotificationPortRef *)this + 2), "IOServiceMatched", v7, (IOServiceMatchingCallback)H11ANE::deviceArrivedCallback, this, (io_iterator_t *)this + 15);
      if (!result)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v8 = 0;
          _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Found matching service: H11ANEIn\n", v8, 2u);
        }
        H11ANE::deviceArrivedCallback(this, *((_DWORD *)this + 15));
        return 0;
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        H11ANE::H11ANEDeviceController::SetupDeviceController();
      }
      return 3758097084;
    }
  }
  return result;
}

uint64_t H11ANE::LoadBalancerArrivedCallback(H11ANE *this, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result) {
    operator new();
  }
  return result;
}

void sub_2120A0924(_Unwind_Exception *a1)
{
  MEMORY[0x21667E660](v1, 0x10A0C4068EC5594);
  _Unwind_Resume(a1);
}

uint64_t H11ANE::deviceArrivedCallback(H11ANE *this, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result) {
    operator new();
  }
  return result;
}

void sub_2120A0A94(_Unwind_Exception *a1)
{
  MEMORY[0x21667E660](v1, 0x10A0C4068EC5594);
  _Unwind_Resume(a1);
}

H11ANE::H11ANEDevice *H11ANE::H11ANEDevice::H11ANEDevice(H11ANE::H11ANEDevice *this, H11ANE::H11ANEDeviceController *a2, int a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *((void *)this + 1) = 0;
  *((void *)this + 2) = a2;
  *((void *)this + 6) = 0;
  *((_DWORD *)this + 15) = 0;
  *((_DWORD *)this + 16) = 0;
  *((_DWORD *)this + 14) = a3;
  *(void *)this = 0;
  pthread_mutexattr_init(&v5);
  pthread_mutexattr_settype(&v5, 2);
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 72), &v5);
  pthread_mutexattr_destroy(&v5);
  H11ANE::H11ANEDevice::EnableDeviceMessages((uint64_t)this);
  return this;
}

uint64_t H11ANE::H11ANEDevice::EnableDeviceMessages(uint64_t this)
{
  if (!*(_DWORD *)(this + 60)) {
    return IOServiceAddInterestNotification(*(IONotificationPortRef *)(*(void *)(this + 16) + 16), *(_DWORD *)(this + 56), "IOGeneralInterest", (IOServiceInterestCallback)H11ANE::H11ANEDeviceServiceInterestCallback, (void *)this, (io_object_t *)(this + 60));
  }
  return this;
}

uint64_t MyH11ANEDeviceControllerNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    BOOL v3 = a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 3758097084;
  }
  else {
    return 0;
  }
}

{
  BOOL v3;

  if (a3) {
    BOOL v3 = a1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 3758097084;
  }
  else {
    return 0;
  }
}

uint64_t H11ANEProgramCreate(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = 2;
  if (a2 && a1 && a3)
  {
    if (*(void *)(*(void *)(a1 + 16) + 8))
    {
      os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2408);
      uint64_t v6 = +[ANEServicesLog handle];
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        CFDictionaryRef v7 = v6;
        if (os_signpost_enabled(v6))
        {
          uint64_t v8 = *a2;
          int v9 = *((_DWORD *)a2 + 21);
          buf[0] = 134218240;
          *(void *)&buf[1] = v8;
          __int16 v20 = 1024;
          LODWORD(v21) = v9;
          _os_signpost_emit_with_name_impl(&dword_21209C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ServicesProgramCreate", "progContent=%llx statsMask=%x", (uint8_t *)buf, 0x12u);
        }
      }
      operator new();
    }
    BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v10) {
      H11ANEProgramCreate_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    return 8;
  }
  return v3;
}

uint64_t H11ANE::H11ANEDeviceServiceInterestCallback(uint64_t this, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (*(void *)this) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))this)(this, a3, a4, *(void *)(this + 8));
  }
  return this;
}

void H11ANE::H11ANEDevice::~H11ANEDevice(H11ANE::H11ANEDevice *this)
{
  if (*((_DWORD *)this + 16)) {
    H11ANE::H11ANEDevice::H11ANEDeviceClose(this);
  }
  io_object_t v2 = *((_DWORD *)this + 15);
  if (v2)
  {
    IOObjectRelease(v2);
    *((_DWORD *)this + 15) = 0;
  }
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 72));
}

uint64_t H11ANE::H11ANEDevice::H11ANEDeviceClose(H11ANE::H11ANEDevice *this)
{
  io_object_t v2 = (pthread_mutex_t *)((char *)this + 72);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 72));
  uint64_t v3 = IOConnectCallScalarMethod(*((_DWORD *)this + 16), 1u, 0, 0, 0, 0);
  io_connect_t v4 = *((_DWORD *)this + 16);
  if (v4)
  {
    IOServiceClose(v4);
    *((_DWORD *)this + 16) = 0;
    *(void *)this = 0;
    *((void *)this + 1) = 0;
  }
  else
  {
    uint64_t v3 = 3758097101;
  }
  pthread_mutex_unlock(v2);
  return v3;
}

void __clang_call_terminate(void *a1)
{
}

uint64_t H11ANE::H11ANEDevice::DisableDeviceMessages(H11ANE::H11ANEDevice *this)
{
  uint64_t result = *((unsigned int *)this + 15);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 15) = 0;
  }
  return result;
}

void *H11ANE::H11ANEDevice::RegisterDeviceMessageNotificationProc(void *this, int (*a2)(H11ANE::H11ANEDevice *, unsigned int, void *, void *), void *a3)
{
  *this = a2;
  this[1] = a3;
  return this;
}

uint64_t H11ANE::H11ANEDevice::ANE_ForgetFirmware(H11ANE::H11ANEDevice *this)
{
  uint64_t result = 3758097084;
  mach_port_t v3 = *((_DWORD *)this + 16);
  if (v3)
  {
    if (*((unsigned char *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1) {
        return 3758097095;
      }
      else {
        return IOConnectCallScalarMethod(v3, 0xDu, 0, 0, 0, 0);
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ReadANERegister(H11ANE::H11ANEDevice *this, unsigned int a2, unsigned int *a3)
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v5 = *((_DWORD *)this + 16);
  if (!v5) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      uint64_t output = 0;
      input[0] = a2;
      uint32_t outputCnt = 1;
      uint64_t result = IOConnectCallScalarMethod(v5, 0x24u, input, 1u, &output, &outputCnt);
      if (!result) {
        *a3 = output;
      }
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_WriteANERegister(H11ANE::H11ANEDevice *this, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v5 = *((_DWORD *)this + 16);
  if (!v5) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      input[0] = a2;
      input[1] = a3;
      return IOConnectCallScalarMethod(v5, 0x25u, input, 2u, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_SendCommand(H11ANE::H11ANEDevice *this, unsigned __int8 *a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  v18[5] = *MEMORY[0x263EF8340];
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2008);
  uint64_t v11 = +[ANEServicesLog handle];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v12 = v11;
    if (os_signpost_enabled(v11))
    {
      LOWORD(v18[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "H11ANEDeviceSendCommand", (const char *)&unk_2120C54A2, (uint8_t *)v18, 2u);
    }
  }
  uint64_t v13 = 3758097089;
  mach_port_t v14 = *((_DWORD *)this + 16);
  if (v14)
  {
    if (*((unsigned char *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        uint64_t v13 = 3758097095;
      }
      else
      {
        v18[0] = (uint64_t)a2;
        v18[1] = a3;
        v18[2] = a4;
        v18[3] = a5;
        uint64_t v13 = IOConnectCallScalarMethod(v14, 0xEu, v18, 4u, 0, 0);
      }
    }
  }
  else
  {
    uint64_t v13 = 3758097101;
  }
  uint64_t v15 = +[ANEServicesLog handle];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v16 = v15;
    if (os_signpost_enabled(v15))
    {
      LOWORD(v18[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v16, OS_SIGNPOST_INTERVAL_END, v10, "H11ANEDeviceSendCommand", (const char *)&unk_2120C54A2, (uint8_t *)v18, 2u);
    }
  }
  return v13;
}

uint64_t H11ANE::H11ANEDevice::WritePropertyValue(H11ANE::H11ANEDevice *this, int a2, int a3, unsigned int a4)
{
  *(void *)mach_port_t v5 = 0x1F00000000;
  int v6 = 0;
  int v7 = a2;
  int v8 = a3;
  return H11ANE::H11ANEDevice::ANE_SendCommand(this, v5, 0x14u, 0, a4);
}

uint64_t H11ANE::H11ANEDevice::ReadPropertyValue(H11ANE::H11ANEDevice *this, int a2, unsigned int *a3, unsigned int a4)
{
  *(void *)int v6 = 0x2000000000;
  int v7 = 0;
  int v8 = a2;
  unsigned int v9 = 0;
  uint64_t result = H11ANE::H11ANEDevice::ANE_SendCommand(this, v6, 0x14u, 0, a4);
  if (!result) {
    *a3 = v9;
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_FlushInactiveDARTMappings(H11ANE::H11ANEDevice *this)
{
  uint64_t result = 3758097089;
  mach_port_t v3 = *((_DWORD *)this + 16);
  if (!v3) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1) {
      return 3758097095;
    }
    else {
      return IOConnectCallScalarMethod(v3, 0x1Du, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_LoadFirmware(H11ANE::H11ANEDevice *this)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  uint64_t v1 = 3758097089;
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1) {
      return 3758097095;
    }
    memset(outputStruct, 0, sizeof(outputStruct));
    H11ANE::H11ANEDevice::ANE_GetStatus((uint64_t)this, outputStruct);
    if (BYTE12(outputStruct[0])) {
      return 0;
    }
    int v3 = *((_DWORD *)this + 7);
    io_connect_t v4 = "/usr/local/share/firmware/ane/ane.bin";
    if (v3 > 127)
    {
      if (v3 <= 175)
      {
        if (v3 != 128)
        {
          if (v3 != 144 && v3 != 160) {
            goto LABEL_23;
          }
          goto LABEL_29;
        }
      }
      else if (v3 > 207)
      {
        if (v3 != 208)
        {
          if (v3 != 224)
          {
LABEL_23:
            printf("ERROR:No matching firmware found, aneVersion: %x!\n", *((_DWORD *)this + 7));
            return 3758097105;
          }
LABEL_29:
          int v7 = fopen(v4, "rb");
          if (v7)
          {
            int v8 = v7;
            puts("Using ANECPU firmware override file");
            fseeko(v8, 0, 2);
            ftello(v8);
            fseeko(v8, 0, 0);
            operator new[]();
          }
          perror("error loading ANECPU firmware ");
          memset(input, 0, 24);
          uint64_t v9 = IOConnectCallScalarMethod(*((_DWORD *)this + 16), 0xCu, input, 3u, 0, 0);
          uint64_t v1 = v9;
          if (v9)
          {
            printf("error: LoadFirmware returned 0x%08x \n", v9);
            if ((int)v1 <= -536870182)
            {
              if (v1 == -536870211)
              {
                os_signpost_id_t v10 = "LoadFirmware: Run out of memory!";
              }
              else
              {
                if (v1 != -536870207) {
                  return v1;
                }
                os_signpost_id_t v10 = "LoadFirmware: Privilege violation,  add boot-args amfi_allow_any_signature=1 for loading customer FW";
              }
            }
            else
            {
              switch(v1)
              {
                case 0xE00002DB:
                  os_signpost_id_t v10 = "LoadFirmware: Firmware is too big!";
                  break;
                case 0xE00002EB:
                  os_signpost_id_t v10 = "LoadFirmware: Firmware is already loaded!";
                  break;
                case 0xE00002E2:
                  os_signpost_id_t v10 = "LoadFirmware: No firmware changes while the ANE is powered up!";
                  break;
                default:
                  return v1;
              }
            }
          }
          else
          {
            os_signpost_id_t v10 = "Firmware is loaded";
          }
          puts(v10);
          return v1;
        }
      }
      else if (v3 != 176)
      {
        if (v3 != 192) {
          goto LABEL_23;
        }
        goto LABEL_29;
      }
      int v5 = *((_DWORD *)this + 8);
      int v6 = "/usr/local/share/firmware/ane/ane1.bin";
      if (v5 != 1) {
        int v6 = 0;
      }
      if (v5) {
        io_connect_t v4 = v6;
      }
    }
    else
    {
      if ((v3 - 16) <= 0x30 && ((1 << (v3 - 16)) & 0x1000100010007) != 0) {
        goto LABEL_29;
      }
      if (v3 != 96)
      {
        if (v3 != 112) {
          goto LABEL_23;
        }
        goto LABEL_29;
      }
      uint64_t v12 = *((int *)this + 8);
      if (v12 >= 4)
      {
        printf("Couldn't load firmware for unknow subtype(%d\n", *((_DWORD *)this + 8));
        io_connect_t v4 = 0;
      }
      else
      {
        io_connect_t v4 = off_26418E240[v12];
      }
    }
    printf("overrideFirmwareFileName: %s\n", v4);
    goto LABEL_29;
  }
  return v1;
}

uint64_t H11ANE::H11ANEDevice::ANE_PowerOn(H11ANE::H11ANEDevice *this)
{
  os_signpost_id_t v2 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2000);
  int v3 = +[ANEServicesLog handle];
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    io_connect_t v4 = v3;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "H11ANEDevicePowerOn", (const char *)&unk_2120C54A2, buf, 2u);
    }
  }
  mach_port_t v5 = *((_DWORD *)this + 16);
  if (v5)
  {
    if (*((unsigned char *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        uint64_t v6 = 3758097095;
      }
      else
      {
        uint64_t v6 = IOConnectCallScalarMethod(v5, 9u, 0, 0, 0, 0);
        if (v6 == -536870172)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)mach_port_t v14 = 0;
            _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ANE_PowerOn: Attempting to load firmware\n", v14, 2u);
          }
          H11ANE::H11ANEDevice::ANE_LoadFirmware(this);
          uint64_t v6 = IOConnectCallScalarMethod(*((_DWORD *)this + 16), 9u, 0, 0, 0, 0);
        }
        if (!v6)
        {
          if (H11ANE::H11ANEDevice::ANE_IsPowered(this))
          {
            printf("Power on wait count: %u on connection: 0x%x\n", 0, *((_DWORD *)this + 16));
            uint64_t v6 = 0;
          }
          else
          {
            unsigned int v7 = 0;
            do
            {
              usleep(0x3E8u);
              unsigned int v8 = v7 + 1;
              if (H11ANE::H11ANEDevice::ANE_IsPowered(this)) {
                break;
              }
            }
            while (v7++ < 0xBB7);
            printf("Power on wait count: %u on connection: 0x%x\n", v8, *((_DWORD *)this + 16));
            if (v8 == 3000) {
              uint64_t v6 = 3758097110;
            }
            else {
              uint64_t v6 = 0;
            }
          }
        }
      }
    }
    else
    {
      uint64_t v6 = 3758097089;
    }
  }
  else
  {
    uint64_t v6 = 3758097101;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ANE_PowerOn: No connection present!\n", v15, 2u);
    }
  }
  os_signpost_id_t v10 = +[ANEServicesLog handle];
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v11 = v10;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v11, OS_SIGNPOST_INTERVAL_END, v2, "H11ANEDevicePowerOn", (const char *)&unk_2120C54A2, v13, 2u);
    }
  }
  return v6;
}

uint64_t H11ANE::H11ANEDevice::ANE_IsPowered(H11ANE::H11ANEDevice *this)
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t result = *((unsigned int *)this + 16);
  if (result)
  {
    if (*((unsigned char *)this + 24) && *((_DWORD *)this + 34) != 1) {
      return !IOConnectCallScalarMethod(result, 0xBu, 0, 0, &output, &outputCnt) && output == 1;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_PowerOff(H11ANE::H11ANEDevice *this)
{
  os_signpost_id_t v2 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2004);
  int v3 = +[ANEServicesLog handle];
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    io_connect_t v4 = v3;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "H11ANEDevicePowerOff", (const char *)&unk_2120C54A2, buf, 2u);
    }
  }
  uint64_t v5 = 3758097089;
  mach_port_t v6 = *((_DWORD *)this + 16);
  if (v6)
  {
    if (*((unsigned char *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1) {
        uint64_t v5 = 3758097095;
      }
      else {
        uint64_t v5 = IOConnectCallScalarMethod(v6, 0xAu, 0, 0, 0, 0);
      }
    }
  }
  else
  {
    uint64_t v5 = 3758097101;
  }
  unsigned int v7 = +[ANEServicesLog handle];
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unsigned int v8 = v7;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)os_signpost_id_t v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v8, OS_SIGNPOST_INTERVAL_END, v2, "H11ANEDevicePowerOff", (const char *)&unk_2120C54A2, v10, 2u);
    }
  }
  return v5;
}

uint64_t H11ANE::H11ANEDevice::ANE_SetPowerManagement(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v4 = *((_DWORD *)this + 16);
  if (!v4) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      v5[0] = a2;
      return IOConnectCallScalarMethod(v4, 0xFu, v5, 1u, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_SetDynamicPowerGating(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v4 = *((_DWORD *)this + 16);
  if (!v4) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      v5[0] = a2;
      return IOConnectCallScalarMethod(v4, 0x10u, v5, 1u, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_SetPowerGatingHysteresisTime(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v4 = *((_DWORD *)this + 16);
  if (!v4) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      v5[0] = a2;
      return IOConnectCallScalarMethod(v4, 0x11u, v5, 1u, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_GetTime(uint64_t a1, void *outputStruct)
{
  uint64_t result = 3758097089;
  size_t outputStructCnt = 24;
  mach_port_t v4 = *(_DWORD *)(a1 + 64);
  if (!v4) {
    return 3758097101;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    if (*(_DWORD *)(a1 + 136) == 1) {
      return 3758097095;
    }
    else {
      return IOConnectCallStructMethod(v4, 0x12u, 0, 0, outputStruct, &outputStructCnt);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_SetDriverLoggingFlags(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v4 = *((_DWORD *)this + 16);
  if (!v4) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    v5[0] = a2;
    return IOConnectCallScalarMethod(v4, 0x13u, v5, 1u, 0, 0);
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_GetDriverLoggingFlags(H11ANE::H11ANEDevice *this, unsigned int *a2)
{
  uint64_t result = 3758097089;
  mach_port_t v4 = *((_DWORD *)this + 16);
  if (!v4) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    uint64_t output = 0;
    uint32_t outputCnt = 1;
    uint64_t result = IOConnectCallScalarMethod(v4, 0x1Cu, 0, 0, &output, &outputCnt);
    if (!result) {
      *a2 = output;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_CreateClientLoggingSession(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097084;
  mach_port_t v4 = *((_DWORD *)this + 16);
  if (v4)
  {
    if (*((unsigned char *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        return 3758097095;
      }
      else
      {
        v5[0] = a2;
        return IOConnectCallScalarMethod(v4, 0x1Au, v5, 1u, 0, 0);
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_TerminateClientLoggingSession(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097084;
  mach_port_t v4 = *((_DWORD *)this + 16);
  if (v4)
  {
    if (*((unsigned char *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        return 3758097095;
      }
      else
      {
        v5[0] = a2;
        return IOConnectCallScalarMethod(v4, 0x1Bu, v5, 1u, 0, 0);
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_AddPersistentClient(H11ANE::H11ANEDevice *this)
{
  uint64_t result = 3758097089;
  mach_port_t v3 = *((_DWORD *)this + 16);
  if (!v3) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1) {
      return 3758097095;
    }
    else {
      return IOConnectCallScalarMethod(v3, 0x18u, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_RemovePersistentClient(H11ANE::H11ANEDevice *this)
{
  uint64_t result = 3758097089;
  mach_port_t v3 = *((_DWORD *)this + 16);
  if (!v3) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1) {
      return 3758097095;
    }
    else {
      return IOConnectCallScalarMethod(v3, 0x19u, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ShowSharedMemoryAllocations(H11ANE::H11ANEDevice *this)
{
  uint64_t result = 3758097089;
  mach_port_t v3 = *((_DWORD *)this + 16);
  if (!v3) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1) {
      return 3758097095;
    }
    else {
      return IOConnectCallScalarMethod(v3, 0x14u, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::SetClientPrivateData(uint64_t this, void *a2)
{
  *(void *)(this + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = a2;
  return this;
}

uint64_t H11ANE::H11ANEDevice::GetClientPrivateData(H11ANE::H11ANEDevice *this)
{
  return *((void *)this + 5);
}

uint64_t H11ANE::H11ANEDevice::ANE_SetDARTCacheTTL(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v4 = *((_DWORD *)this + 16);
  if (!v4) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      v5[0] = a2;
      return IOConnectCallScalarMethod(v4, 0x15u, v5, 1u, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_SetThrottlingPercentage(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v4 = *((_DWORD *)this + 16);
  if (!v4) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    input[0] = a2;
    return IOConnectCallScalarMethod(v4, 0x17u, input, 1u, 0, 0);
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_SetFirmwareBootArg(H11ANE::H11ANEDevice *this, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v5 = *((_DWORD *)this + 16);
  if (!v5) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    input[0] = a2;
    input[1] = a3;
    return IOConnectCallScalarMethod(v5, 0x16u, input, 2u, 0, 0);
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_RegisterFirmwareWorkProcessor(uint64_t a1, _DWORD *inputStruct)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v4 = *(_DWORD *)(a1 + 64);
  if (!v4) {
    return 3758097101;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    if (*(_DWORD *)(a1 + 136) == 1)
    {
      return 3758097095;
    }
    else
    {
      long long v6 = 0u;
      return IOConnectCallAsyncMethod(v4, 0x1Fu, inputStruct[4], &reference, 8u, 0, 0, inputStruct, 0x18uLL, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_UnregisterFirmwareWorkProcessor(H11ANE::H11ANEDevice *this, mach_port_t wake_port)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v4 = *((_DWORD *)this + 16);
  if (!v4) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      long long v6 = 0u;
      return IOConnectCallAsyncMethod(v4, 0x20u, wake_port, &reference, 8u, 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_GetFirmwareWorkProcessorItem(uint64_t a1, mach_port_t wake_port, uint64_t a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v5 = *(_DWORD *)(a1 + 64);
  if (!v5) {
    return 3758097101;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    if (*(_DWORD *)(a1 + 136) == 1)
    {
      return 3758097095;
    }
    else
    {
      input[0] = a3;
      input[1] = 3080;
      long long v7 = 0u;
      return IOConnectCallAsyncMethod(v5, 0x21u, wake_port, &reference, 8u, input, 2u, 0, 0, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_CompleteFirmwareWorkProcessorItem(uint64_t a1, mach_port_t wake_port, uint64_t a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v5 = *(_DWORD *)(a1 + 64);
  if (!v5) {
    return 3758097101;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    if (*(_DWORD *)(a1 + 136) == 1)
    {
      return 3758097095;
    }
    else
    {
      input[0] = a3;
      input[1] = 3080;
      long long v7 = 0u;
      return IOConnectCallAsyncMethod(v5, 0x22u, wake_port, &reference, 8u, input, 2u, 0, 0, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ReleaseFirmwareWorkProcessorBuffers(H11ANE::H11ANEDevice *this, mach_port_t wake_port)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v4 = *((_DWORD *)this + 16);
  if (!v4) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      long long v6 = 0u;
      return IOConnectCallAsyncMethod(v4, 0x23u, wake_port, &reference, 8u, 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramCreateInstance(uint64_t a1, const char **a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = 3758097089;
  if (!*(_DWORD *)(a1 + 64)) {
    return 3758097101;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = 3758097090;
    if (a2)
    {
      if (a3)
      {
        os_signpost_id_t v7 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2014);
        unsigned int v8 = +[ANEServicesLog handle];
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          uint64_t v9 = v8;
          if (os_signpost_enabled(v8))
          {
            os_signpost_id_t v10 = *a2;
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v10;
            _os_signpost_emit_with_name_impl(&dword_21209C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "H11ANEDeviceProgramCreateInstance", "progHandle=%llx", (uint8_t *)&buf, 0xCu);
          }
        }
        *(void *)&long long buf = a2;
        *((void *)&buf + 1) = 110488;
        uint64_t v21 = a3;
        uint64_t v22 = 730936;
        uint64_t v3 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 64), 8u, &buf, 0x20uLL, 0, 0);
        if (v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315394;
          uint64_t v17 = "ANE_ProgramCreateInstance";
          __int16 v18 = 1024;
          LODWORD(v19) = v3;
          _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: ERROR status=%x\n", (uint8_t *)&v16, 0x12u);
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *a3;
          int v16 = 136315394;
          uint64_t v17 = "ANE_ProgramCreateInstance";
          __int16 v18 = 2048;
          uint64_t v19 = v11;
          _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: programInstance with programHandle: 0x%llx\n", (uint8_t *)&v16, 0x16u);
        }
        uint64_t v12 = +[ANEServicesLog handle];
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          uint64_t v13 = v12;
          if (os_signpost_enabled(v12))
          {
            mach_port_t v14 = *a2;
            int v16 = 134217984;
            uint64_t v17 = v14;
            _os_signpost_emit_with_name_impl(&dword_21209C000, v13, OS_SIGNPOST_INTERVAL_END, v7, "H11ANEDeviceProgramCreateInstance", "progHandle=%llx", (uint8_t *)&v16, 0xCu);
          }
        }
      }
    }
  }
  return v3;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramChainingPrepare(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = 3758097089;
  if (!*(_DWORD *)(a1 + 64)) {
    return 3758097101;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    inputStruct[0] = a2;
    inputStruct[1] = 44584;
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2018);
    unsigned int v8 = +[ANEServicesLog handle];
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v9 = v8;
      if (os_signpost_enabled(v8))
      {
        uint64_t v10 = *(void *)(a2 + 16);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v18 = v10;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "H11ANEDeviceProgramPrepare", "progHandle=%llx", buf, 0xCu);
      }
    }
    size_t outputStructCnt = 16;
    uint64_t v3 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 64), 0x28u, inputStruct, 0x10uLL, a3, &outputStructCnt);
    uint64_t v11 = +[ANEServicesLog handle];
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v12 = v11;
      if (os_signpost_enabled(v11))
      {
        uint64_t v13 = *(void *)(a2 + 16);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v18 = v13;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v12, OS_SIGNPOST_INTERVAL_END, v7, "H11ANEDeviceProgramPrepare", "progHandle=%llx", buf, 0xCu);
      }
    }
  }
  return v3;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramOutputSetEnqueue(uint64_t a1, void *inputStruct)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 64);
  if (v2) {
    return IOConnectCallStructMethod(v2, 3u, inputStruct, 0x28uLL, 0, 0);
  }
  else {
    return 3758097101;
  }
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramInputsReady(uint64_t a1, void *inputStruct)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 64);
  if (v2) {
    return IOConnectCallStructMethod(v2, 4u, inputStruct, 0xC18uLL, 0, 0);
  }
  else {
    return 3758097101;
  }
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramUnprepare(uint64_t a1, uint64_t *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097089;
  if (!*(_DWORD *)(a1 + 64)) {
    return 3758097101;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B201C);
    long long v6 = +[ANEServicesLog handle];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v6))
      {
        uint64_t v8 = *a2;
        int v13 = 134217984;
        uint64_t v14 = v8;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "H11ANEDeviceProgramUnprepare", "progHandle=%llx", (uint8_t *)&v13, 0xCu);
      }
    }
    uint64_t v2 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 64), 5u, a2, 0x38uLL, 0, 0);
    uint64_t v9 = +[ANEServicesLog handle];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v10 = v9;
      if (os_signpost_enabled(v9))
      {
        uint64_t v11 = *a2;
        int v13 = 134217984;
        uint64_t v14 = v11;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v10, OS_SIGNPOST_INTERVAL_END, v5, "H11ANEDeviceProgramUnprepare", "progHandle=%llx", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  return v2;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramDestroy(uint64_t a1, uint64_t *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097089;
  if (!*(_DWORD *)(a1 + 64)) {
    return 3758097101;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2020);
    long long v6 = +[ANEServicesLog handle];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v6))
      {
        uint64_t v8 = *a2;
        int v13 = 134217984;
        uint64_t v14 = v8;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "H11ANEDeviceProgramDestroy", "progHandle=%llx", (uint8_t *)&v13, 0xCu);
      }
    }
    uint64_t v2 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 64), 6u, a2, 0x10uLL, 0, 0);
    uint64_t v9 = +[ANEServicesLog handle];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v10 = v9;
      if (os_signpost_enabled(v9))
      {
        uint64_t v11 = *a2;
        int v13 = 134217984;
        uint64_t v14 = v11;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v10, OS_SIGNPOST_INTERVAL_END, v5, "H11ANEDeviceProgramDestroy", "progHandle=%llx", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  return v2;
}

uint64_t H11ANE::H11ANEDevice::ANE_CancelAllRequests(H11ANE::H11ANEDevice *this)
{
  return 0;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramSendRequest(uint64_t a1, _DWORD *a2, mach_port_t a3, unsigned int a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v18 = a2[6];
  uint64_t v10 = *(void *)a2;
  uint64_t v19 = *((void *)a2 + 1);
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B200C);
  uint64_t v12 = +[ANEServicesLog handle];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int v13 = v12;
    if (os_signpost_enabled(v12))
    {
      *(_DWORD *)long long buf = 134218496;
      uint64_t v23 = v10;
      __int16 v24 = 1024;
      int v25 = v18;
      __int16 v26 = 2048;
      uint64_t v27 = v19;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "H11ANEDeviceSendRequest", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
    }
  }
  size_t v20 = 40;
  uint64_t input = a4;
  uint64_t v14 = IOConnectCallAsyncMethod(*(_DWORD *)(a1 + 64), 2u, a3, 0, 0, &input, 1u, a2, 0x948uLL, 0, 0, a5, &v20);
  if (v14 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    H11ANE::H11ANEDevice::ANE_ProgramSendRequest(v14);
  }
  uint64_t v15 = +[ANEServicesLog handle];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int v16 = v15;
    if (os_signpost_enabled(v15))
    {
      *(_DWORD *)long long buf = 134218496;
      uint64_t v23 = v10;
      __int16 v24 = 1024;
      int v25 = v18;
      __int16 v26 = 2048;
      uint64_t v27 = v19;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v16, OS_SIGNPOST_INTERVAL_END, v11, "H11ANEDeviceSendRequest", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
    }
  }
  return v14;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramMemoryMapRequest(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!*(_DWORD *)(a1 + 64)) {
    return 3758097101;
  }
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog verbose], (const void *)0x61B0104);
  os_signpost_id_t v7 = +[ANEServicesLog verbose];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v8 = v7;
    if (os_signpost_enabled(v7))
    {
      uint64_t v9 = a2[257];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v19 = v9;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ANEDeviceMemoryMapRequest", "progHandle=%llx ", buf, 0xCu);
    }
  }
  uint64_t output = 0;
  uint64_t input = a3;
  uint32_t outputCnt = 1;
  uint64_t v10 = IOConnectCallMethod(*(_DWORD *)(a1 + 64), 5u, &input, 1u, a2, 0x828uLL, &output, &outputCnt, 0, 0);
  if (!v10 && a3) {
    a2[259] = output;
  }
  os_signpost_id_t v11 = +[ANEServicesLog verbose];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v12 = v11;
    if (os_signpost_enabled(v11))
    {
      uint64_t v13 = a2[257];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v19 = v13;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v12, OS_SIGNPOST_INTERVAL_END, v6, "ANEDeviceMemoryMapRequest", "progHandle=%llx ", buf, 0xCu);
    }
  }
  return v10;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramMemoryUnMapRequest(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!*(_DWORD *)(a1 + 64)) {
    return 3758097101;
  }
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog verbose], (const void *)0x61B0108);
  os_signpost_id_t v5 = +[ANEServicesLog verbose];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v5))
    {
      uint64_t v7 = a2[257];
      int v13 = 134217984;
      uint64_t v14 = v7;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ANEDeviceMemoryUnMapRequest)", "progHandle=%llx ", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t v8 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 64), 6u, a2, 0x828uLL, 0, 0);
  uint64_t v9 = +[ANEServicesLog verbose];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v10 = v9;
    if (os_signpost_enabled(v9))
    {
      uint64_t v11 = a2[257];
      int v13 = 134217984;
      uint64_t v14 = v11;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v10, OS_SIGNPOST_INTERVAL_END, v4, "ANEDeviceMemoryUnMapRequest)", "progHandle=%llx ", (uint8_t *)&v13, 0xCu);
    }
  }
  return v8;
}

uint64_t H11ANE::H11ANEDevice::ANE_MPMMemoryMapRequest(H11ANE::H11ANEDevice *this, uint64_t a2, uint64_t a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  mach_port_t v3 = *((_DWORD *)this + 16);
  if (!v3) {
    return 3758097101;
  }
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(v3, 0x29u, input, 2u, 0, 0);
}

uint64_t H11ANE::H11ANEDevice::ANE_MPMMemoryUnmapRequest(H11ANE::H11ANEDevice *this, uint64_t a2)
{
  v4[1] = *MEMORY[0x263EF8340];
  mach_port_t v2 = *((_DWORD *)this + 16);
  if (!v2) {
    return 3758097084;
  }
  v4[0] = a2;
  return IOConnectCallScalarMethod(v2, 0x2Au, v4, 1u, 0, 0);
}

uint64_t H11ANE::H11ANEDevice::ANE_FWSharedEventDoorbellRing(H11ANE::H11ANEDevice *this)
{
  uint64_t result = 3758097089;
  mach_port_t v3 = *((_DWORD *)this + 16);
  if (!v3) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1) {
      return 3758097095;
    }
    else {
      return IOConnectCallScalarMethod(v3, 0x26u, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_UnmapDartBuffers(H11ANE::H11ANEDevice *this, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097089;
  mach_port_t v5 = *((_DWORD *)this + 16);
  if (!v5) {
    return 3758097101;
  }
  if (*((unsigned char *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      input[0] = a2;
      input[1] = a3;
      return IOConnectCallScalarMethod(v5, 0x27u, input, 2u, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ExclaveCycle(H11ANE::H11ANEDevice *this)
{
  uint64_t result = 3758097084;
  mach_port_t v3 = *((_DWORD *)this + 16);
  if (v3)
  {
    if (*((unsigned char *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1) {
        return 3758097095;
      }
      else {
        return IOConnectCallScalarMethod(v3, 0x2Bu, 0, 0, 0, 0);
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ExclaveLoad(H11ANE::H11ANEDevice *this, unsigned int a2, unint64_t *a3)
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097084;
  mach_port_t v5 = *((_DWORD *)this + 16);
  if (v5)
  {
    if (*((unsigned char *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        return 3758097095;
      }
      else
      {
        uint64_t output = 0;
        input[0] = a2;
        uint32_t outputCnt = 1;
        uint64_t result = IOConnectCallScalarMethod(v5, 0x2Cu, input, 1u, &output, &outputCnt);
        if (!result) {
          *a3 = output;
        }
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ExclaveEvaluate(H11ANE::H11ANEDevice *this, uint64_t a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097084;
  mach_port_t v4 = *((_DWORD *)this + 16);
  if (v4)
  {
    if (*((unsigned char *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        return 3758097095;
      }
      else
      {
        v5[0] = a2;
        return IOConnectCallScalarMethod(v4, 0x2Du, v5, 1u, 0, 0);
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ExclaveUnload(H11ANE::H11ANEDevice *this, uint64_t a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097084;
  mach_port_t v4 = *((_DWORD *)this + 16);
  if (v4)
  {
    if (*((unsigned char *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        return 3758097095;
      }
      else
      {
        v5[0] = a2;
        return IOConnectCallScalarMethod(v4, 0x2Eu, v5, 1u, 0, 0);
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ExclaveReadPropertyValue(H11ANE::H11ANEDevice *this, unsigned int a2, unsigned int *a3)
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097084;
  mach_port_t v5 = *((_DWORD *)this + 16);
  if (v5)
  {
    if (*((unsigned char *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        return 3758097095;
      }
      else
      {
        uint64_t output = 0;
        input[0] = a2;
        uint32_t outputCnt = 1;
        uint64_t result = IOConnectCallScalarMethod(v5, 0x2Fu, input, 1u, &output, &outputCnt);
        if (!result) {
          *a3 = output;
        }
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ExclaveWritePropertyValue(H11ANE::H11ANEDevice *this, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097084;
  mach_port_t v5 = *((_DWORD *)this + 16);
  if (v5)
  {
    if (*((unsigned char *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        return 3758097095;
      }
      else
      {
        input[0] = a2;
        input[1] = a3;
        return IOConnectCallScalarMethod(v5, 0x30u, input, 2u, 0, 0);
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

void H11ANE::H11ANEDeviceController::~H11ANEDeviceController(CFArrayRef *this)
{
  for (unint64_t i = 0; i < CFArrayGetCount(*this); ++i)
  {
    ValueAtIndex = (H11ANE::H11ANEDevice *)CFArrayGetValueAtIndex(*this, i);
    H11ANE::H11ANEDevice::DisableDeviceMessages(ValueAtIndex);
  }
  io_object_t v4 = *((_DWORD *)this + 14);
  if (v4) {
    IOObjectRelease(v4);
  }
  io_object_t v5 = *((_DWORD *)this + 15);
  if (v5) {
    IOObjectRelease(v5);
  }
  if (*this) {
    CFRelease(*this);
  }
  os_signpost_id_t v6 = this[2];
  if (v6)
  {
    uint64_t v7 = this[3];
    if (v7)
    {
      CFRunLoopRemoveSource(this[6], v7, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      this[3] = 0;
      os_signpost_id_t v6 = this[2];
    }
    IONotificationPortDestroy(v6);
  }
  CFArrayRef v8 = this[6];
  if (v8)
  {
    CFRelease(v8);
    this[6] = 0;
  }
}

void H11ANE::cfArrayReleaseH11ANEUnitObject(H11ANE *this, const __CFAllocator *a2, const void *a3)
{
  if (a2)
  {
    H11ANE::H11ANEDevice::~H11ANEDevice(a2);
    JUMPOUT(0x21667E660);
  }
}

H11ANE::H11ANEFirmwareLogger *H11ANE::H11ANEFirmwareLogger::H11ANEFirmwareLogger(H11ANE::H11ANEFirmwareLogger *this, H11ANE::H11ANEDevice *a2, void (*a3)(void *, const char *), void *a4, int a5, int a6)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *((void *)this + 1) = a3;
  uint64_t v7 = (_OWORD *)((char *)this + 8);
  *(void *)this = a2;
  *((void *)this + 2) = a4;
  *((_DWORD *)this + 6) = a5;
  CFArrayRef v8 = (_DWORD *)((char *)this + 24);
  *((_DWORD *)this + 7) = a6;
  H11ANE::H11ANEThreadReadySyncer::H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)&v15);
  *((void *)this + 11) = 0;
  *((unsigned char *)this + 56) = 0;
  uint64_t v9 = *(void *)this;
  *((void *)this + 5) = &v15;
  *((void *)this + 6) = v9;
  *((_OWORD *)this + 4) = *v7;
  *((_DWORD *)this + 2pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *v8;
  *((void *)this + 4) = this;
  int v10 = pthread_attr_init(&v14);
  if (v10)
  {
    printf("pthread_attr_init() failed. Error: %d\n", v10);
    goto LABEL_13;
  }
  if (*((_DWORD *)this + 7))
  {
    v13.sched_priority = *((_DWORD *)this + 7);
    *(_DWORD *)v13.__opaque = 0;
    if (pthread_attr_setschedparam(&v14, &v13))
    {
      printf("pthread_attr_setschedparam() failed. Error: %d\n");
LABEL_10:
      int v11 = 0;
      goto LABEL_11;
    }
  }
  if (pthread_attr_setdetachstate(&v14, 1))
  {
    printf("pthread_attr_setdetachstate() failed. Error: %d\n");
    goto LABEL_10;
  }
  if (pthread_create((pthread_t *)this + 11, &v14, (void *(__cdecl *)(void *))H11ANE::H11ANEFirmwareLoggerThreadStart, (char *)this + 32))
  {
    printf("pthread_create() failed. Error: %d\n");
    goto LABEL_10;
  }
  int v11 = 1;
LABEL_11:
  pthread_attr_destroy(&v14);
  if (v11) {
    H11ANE::H11ANEThreadReadySyncer::wait(&v15);
  }
LABEL_13:
  H11ANE::H11ANEThreadReadySyncer::~H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)&v15);
  return this;
}

void sub_2120A4570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  H11ANE::H11ANEThreadReadySyncer::~H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)va);
  _Unwind_Resume(a1);
}

uint64_t H11ANE::H11ANEFirmwareLoggerThreadStart(uint64_t a1)
{
  pthread_setname_np("H11ANEFirmwareLoggerThread");
  H11ANE::H11ANEThreadReadySyncer::lock(*(pthread_mutex_t **)(a1 + 8));
  uint64_t v2 = *(void *)(a1 + 16);
  H11ANE::H11ANEThreadReadySyncer::signalAndUnlock(*(H11ANE::H11ANEThreadReadySyncer **)(a1 + 8));
  if (!v2) {
    return 0;
  }
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    printf("%s: Unable to allocate CFDictionary for IOSurface properties \n", "void *H11ANE::H11ANEFirmwareLoggerThreadStart(H11ANEFirmwareLoggerThreadParams *)");
    goto LABEL_24;
  }
  io_object_t v5 = Mutable;
  size_t valuePtr = 0x10000;
  CFNumberRef v6 = CFNumberCreate(v3, kCFNumberLongType, &valuePtr);
  CFDictionaryAddValue(v5, (const void *)*MEMORY[0x263F0ED30], v6);
  CFRelease(v6);
  uint64_t v7 = IOSurfaceCreate(v5);
  if (!v7)
  {
    printf("%s: Unable to create IOSurface for client logging buffer \n", "void *H11ANE::H11ANEFirmwareLoggerThreadStart(H11ANEFirmwareLoggerThreadParams *)");
    CFRelease(v5);
    goto LABEL_24;
  }
  CFArrayRef v8 = v7;
  uint32_t seed = 0;
  IOSurfaceLock(v7, 0, &seed);
  IOSurfaceID ID = IOSurfaceGetID(v8);
  BaseAddress = IOSurfaceGetBaseAddress(v8);
  if (BaseAddress)
  {
    bzero(BaseAddress, valuePtr);
    int ClientLoggingSession = H11ANE::H11ANEDevice::ANE_CreateClientLoggingSession(*(H11ANE::H11ANEDevice **)(a1 + 16), ID);
    int v12 = ClientLoggingSession;
    if (ClientLoggingSession)
    {
      printf("%s: ANE_CreateClientLoggingSession returned 0x%08x \n", "void *H11ANE::H11ANEFirmwareLoggerThreadStart(H11ANEFirmwareLoggerThreadParams *)", ClientLoggingSession);
      CFRelease(v8);
      IOSurfaceID ID = 0;
      CFArrayRef v8 = 0;
    }
  }
  else
  {
    int v12 = -536870212;
  }
  IOSurfaceUnlock(v8, 0, &seed);
  CFRelease(v5);
  if (!v8)
  {
    if (v12 == -536870201) {
      return 0;
    }
LABEL_24:
    (*(void (**)(void, const char *))(a1 + 32))(*(void *)(a1 + 40), "Firmware logging aborted \n");
    return 0;
  }
  while (!*(unsigned char *)(a1 + 24))
  {
    IOSurfaceLock(v8, 0, 0);
    size_t AllocSize = IOSurfaceGetAllocSize(v8);
    pthread_attr_t v14 = (char *)IOSurfaceGetBaseAddress(v8);
    int v16 = *(_DWORD *)v14;
    LODWORD(v15) = *((_DWORD *)v14 + 1);
    if (v15 != *(_DWORD *)v14)
    {
      uint64_t v17 = v14;
      do
      {
        int v18 = *(void (**)(void, char *))(a1 + 32);
        if (v18)
        {
          v18(*(void *)(a1 + 40), &v17[v15]);
          int v16 = *(_DWORD *)v17;
          LODWORD(v15) = *((_DWORD *)v17 + 1);
        }
        size_t v15 = (v15 + 128);
        if (AllocSize <= v15) {
          LODWORD(v15) = 128;
        }
        *((_DWORD *)v17 + 1) = v15;
      }
      while (v15 != v16);
    }
    IOSurfaceUnlock(v8, 0, 0);
    usleep(1000 * *(_DWORD *)(a1 + 48));
  }
  int v19 = H11ANE::H11ANEDevice::ANE_TerminateClientLoggingSession(*(H11ANE::H11ANEDevice **)(a1 + 16), ID);
  if (v19) {
    printf("%s: ANE_TerminateClientLoggingSession returned 0x%08x \n", "void *H11ANE::H11ANEFirmwareLoggerThreadStart(H11ANEFirmwareLoggerThreadParams *)", v19);
  }
  CFRelease(v8);
  return 0;
}

void H11ANE::H11ANEFirmwareLogger::~H11ANEFirmwareLogger(pthread_t *this)
{
  uint64_t v2 = 0;
  H11ANE::H11ANEFirmwareLogger::SetFirmwareLoggerThreadPriority((H11ANE::H11ANEFirmwareLogger *)this, 47);
  *((unsigned char *)this + 56) = 1;
  pthread_join(this[11], &v2);
  this[11] = 0;
}

uint64_t H11ANE::H11ANEFirmwareLogger::SetFirmwareLoggerThreadPriority(H11ANE::H11ANEFirmwareLogger *this, int a2)
{
  uint64_t v2 = (_opaque_pthread_t *)*((void *)this + 11);
  if (!v2) {
    return 3758097086;
  }
  io_object_t v4 = (H11ANE *)pthread_mach_thread_np(v2);
  H11ANE::H11ANESetMachThreadPriority(v4, a2);
  return 0;
}

uint64_t H11ANE::H11ANEFrameReceiver::stopReceive(H11ANE::H11ANEFrameReceiver *this)
{
  os_signpost_id_t v2 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2204);
  CFAllocatorRef v3 = +[ANEServicesLog handle];
  unint64_t v4 = v2 - 1;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    io_object_t v5 = v3;
    if (os_signpost_enabled(v3))
    {
      LOWORD(buf.tv_sec) = 0;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v2, "H11ANEFrameReceiverStop", (const char *)&unk_2120C54A2, (uint8_t *)&buf, 2u);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 112));
  if (*(_DWORD *)this)
  {
    H11ANE::H11ANEFrameReceiver::stopNoDataTimer(this);
    pthread_mutex_lock((pthread_mutex_t *)((char *)this + 176));
    *((unsigned char *)this + 408) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 176));
    pthread_mutex_lock((pthread_mutex_t *)((char *)this + 176));
    if (*((void *)this + 50))
    {
      int v6 = 2001;
      while (1)
      {
        usleep(0x3E8u);
        if (!--v6) {
          break;
        }
        pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 176));
        pthread_mutex_lock((pthread_mutex_t *)((char *)this + 176));
        if (!*((void *)this + 50)) {
          goto LABEL_9;
        }
      }
      printf("H11ANEFrameReceiver: Did not get all pending requests back from kernel. remaining: %d.\n", *((void *)this + 50));
      int v10 = (void **)*((void *)this + 46);
      int v11 = (void **)*((void *)this + 47);
      int v12 = &v10[*((void *)this + 49) >> 9];
      if (v11 == v10) {
        sched_param v13 = 0;
      }
      else {
        sched_param v13 = (const void **)((char *)*v12 + 8 * (*((void *)this + 49) & 0x1FFLL));
      }
      while (1)
      {
        unint64_t v14 = (char *)v11 - (char *)v10;
        if (v14)
        {
          unint64_t v15 = *((void *)this + 50) + *((void *)this + 49);
          uint64_t v16 = *(uint64_t *)((char *)v10 + ((v15 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v15 & 0x1FF);
        }
        else
        {
          uint64_t v16 = 0;
        }
        if (v13 == (const void **)v16) {
          break;
        }
        uint64_t v17 = (H11ANE::H11ANEFrameReceiverRequest *)*v13;
        printf("H11ANEFrameReceiver: Request not returned 0x%p\n", *v13);
        if (v17)
        {
          H11ANE::H11ANEFrameReceiverRequest::~H11ANEFrameReceiverRequest(v17);
          MEMORY[0x21667E660]();
        }
        if ((char *)++v13 - (unsigned char *)*v12 == 4096)
        {
          int v18 = (const void **)v12[1];
          ++v12;
          sched_param v13 = v18;
        }
        int v10 = (void **)*((void *)this + 46);
        int v11 = (void **)*((void *)this + 47);
      }
      *((void *)this + 5pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
      if (v14 >= 0x11)
      {
        do
        {
          operator delete(*v10);
          uint64_t v19 = *((void *)this + 47);
          int v10 = (void **)(*((void *)this + 46) + 8);
          *((void *)this + 46) = v10;
          unint64_t v14 = v19 - (void)v10;
        }
        while (v14 > 0x10);
      }
      uint64_t v7 = 3758097110;
      if (v14 >> 3 == 1)
      {
        uint64_t v20 = 256;
        goto LABEL_31;
      }
      if (v14 >> 3 == 2)
      {
        uint64_t v20 = 512;
LABEL_31:
        *((void *)this + 49) = v20;
      }
    }
    else
    {
LABEL_9:
      uint64_t v7 = 0;
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 176));
    if (*((_DWORD *)this + 14))
    {
      gettimeofday(&v24, 0);
      unsigned int v21 = 1000 * v24.tv_usec + 1000000 * *((_DWORD *)this + 4);
      buf.tv_sec = v24.tv_sec + v21 / 0x3B9ACA00uLL;
      buf.tv_nsec = v21 % 0x3B9ACA00;
      if (pthread_cond_timedwait((pthread_cond_t *)((char *)this + 64), (pthread_mutex_t *)((char *)this + 112), &buf) == 60
        && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        H11ANE::H11ANEFrameReceiver::stopReceive();
      }
    }
    *((unsigned char *)this + 408) = 0;
    *(_DWORD *)this = 0;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 112));
    uint64_t v22 = +[ANEServicesLog handle];
    if (v4 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v9 = v22;
      if (os_signpost_enabled(v22))
      {
        LOWORD(buf.tv_sec) = 0;
        goto LABEL_39;
      }
    }
    return v7;
  }
  uint64_t v7 = 3758097122;
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 112));
  CFArrayRef v8 = +[ANEServicesLog handle];
  if (v4 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v9 = v8;
    if (os_signpost_enabled(v8))
    {
      LOWORD(buf.tv_sec) = 0;
LABEL_39:
      _os_signpost_emit_with_name_impl(&dword_21209C000, v9, OS_SIGNPOST_INTERVAL_END, v2, "H11ANEFrameReceiverStop", (const char *)&unk_2120C54A2, (uint8_t *)&buf, 2u);
    }
  }
  return v7;
}

uint64_t H11ANE::H11ANEFrameReceiver::setupFrameReceiver(CFTypeRef *this)
{
  CFRetain(this[1]);
  return H11ANE::H11ANEFrameReceiver::addIODispatcherToRunLoop((H11ANE::H11ANEFrameReceiver *)this);
}

uint64_t H11ANE::H11ANEFrameReceiver::registerMessageCallback(H11ANE::H11ANEFrameReceiver *this, void (*a2)(unsigned int, unsigned int, unsigned int, void *, void *, void *), void *a3)
{
  *((void *)this + 5) = a2;
  *((void *)this + 6) = a3;
  return 0;
}

uint64_t H11ANE::H11ANEFrameReceiver::stopNoDataTimer(H11ANE::H11ANEFrameReceiver *this)
{
  os_signpost_id_t v2 = (pthread_mutex_t *)((char *)this + 256);
  pthread_mutex_lock((pthread_mutex_t *)this + 4);
  CFAllocatorRef v3 = (__CFRunLoopTimer *)*((void *)this + 40);
  if (v3)
  {
    CFRunLoopTimerInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 40));
    *((void *)this + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  }
  return pthread_mutex_unlock(v2);
}

uint64_t H11ANE::H11ANEFrameReceiver::registerFrameReceiveCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 24) = a3;
  *(void *)(a1 + 32) = a2;
  return 0;
}

void H11ANE::H11ANEFrameReceiver::releaseRequestBuffers(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unint64_t v3 = *(unsigned int *)(a2 + 4080);
    if (v3)
    {
      for (unint64_t i = 0; i < v3; ++i)
      {
        io_object_t v5 = *(const void **)(a2 + 8 * i);
        if (v5)
        {
          CFRelease(v5);
          unint64_t v3 = *(unsigned int *)(a2 + 4080);
        }
      }
    }
    *(_DWORD *)(a2 + 408pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
    unsigned int v6 = *(_DWORD *)(a2 + 8168);
    if (v6)
    {
      for (unsigned __int8 j = 0; j < v6; ++j)
      {
        CFArrayRef v8 = *(const void **)(a2 + 8 * j + 4088);
        if (v8)
        {
          CFRelease(v8);
          unsigned int v6 = *(_DWORD *)(a2 + 8168);
        }
      }
    }
    *(_DWORD *)(a2 + 8168) = 0;
    unsigned int v9 = *(_DWORD *)(a2 + 0x2000);
    if (v9)
    {
      for (unsigned __int8 k = 0; k < v9; ++k)
      {
        int v11 = *(const void **)(a2 + 8 * k + 8176);
        if (v11)
        {
          CFRelease(v11);
          unsigned int v9 = *(_DWORD *)(a2 + 0x2000);
        }
      }
    }
    *(_DWORD *)(a2 + 0x200pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
    int v12 = *(__CVBuffer **)(a2 + 8200);
    if (v12) {
      CVPixelBufferRelease(v12);
    }
    sched_param v13 = *(const void **)(a2 + 8208);
    if (v13) {
      CFRelease(v13);
    }
    unint64_t v14 = *(const void **)(a2 + 8216);
    if (v14)
    {
      CFRelease(v14);
    }
  }
}

uint64_t H11ANE::H11ANEFrameReceiver::ProgramProcessRequest(uint64_t a1, uint64_t a2, unsigned int *a3, int a4)
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  uint64_t v7 = *(void *)(a2 + 8232);
  int v8 = *(_DWORD *)(a2 + 8240);
  uint64_t v9 = *(void *)(a2 + 8256);
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2208);
  int v11 = +[ANEServicesLog handle];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int v12 = v11;
    if (os_signpost_enabled(v11))
    {
      *(_DWORD *)timespec buf = 134218496;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v8;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v9;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "H11ANEFrameReceiverProcessRequest", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
    }
  }
  uint64_t v83 = v7;
  int v84 = v8;
  uint64_t v85 = v9;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 112));
  if (*(unsigned char *)(a1 + 408) || *(_DWORD *)a1 != 1)
  {
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v15) {
      H11ANE::H11ANEFrameReceiver::ProgramProcessRequest(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    uint64_t v14 = 3758097122;
  }
  else
  {
    uint64_t v13 = *(unsigned int *)(a2 + 4080);
    if ((v13 - 256) > 0xFFFFFF00)
    {
      uint64_t v26 = *(unsigned int *)(a2 + 8168);
      if ((v26 - 256) > 0xFFFFFF00)
      {
        uint64_t v34 = (v26 + v13);
        if (v34 <= 0xFF)
        {
          uint64_t v42 = 0;
          uint64_t v43 = 8 * v13;
          do
          {
            if (!*(void *)(a2 + v42))
            {
              uint64_t v14 = 3758097090;
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                H11ANE::H11ANEFrameReceiver::ProgramProcessRequest();
              }
              goto LABEL_13;
            }
            v42 += 8;
          }
          while (v43 != v42);
          if (v26)
          {
            uint64_t v44 = (void *)(a2 + 4088);
            while (*v44)
            {
              ++v44;
              if (!--v26) {
                goto LABEL_30;
              }
            }
            uint64_t v14 = 3758097090;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              H11ANE::H11ANEFrameReceiver::ProgramProcessRequest();
            }
          }
          else
          {
LABEL_30:
            uint64_t v45 = *(unsigned int *)(a2 + 0x2000);
            if (v45)
            {
              uint64_t v46 = (void *)(a2 + 8176);
              while (*v46)
              {
                ++v46;
                if (!--v45) {
                  goto LABEL_34;
                }
              }
              uint64_t v14 = 3758097090;
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                H11ANE::H11ANEFrameReceiver::ProgramProcessRequest();
              }
            }
            else
            {
LABEL_34:
              uint64_t v47 = *(__CVBuffer **)(a2 + 8200);
              if (v47)
              {
                CVPixelBufferRetain(v47);
                IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(a2 + 8200));
                LODWORD(v47) = IOSurfaceGetID(IOSurface);
              }
              v95[322] = v47;
              long long v49 = *(const void **)(a2 + 8216);
              if (v49) {
                CFRetain(v49);
              }
              v50 = *(const void **)(a2 + 8208);
              if (v50)
              {
                CFRetain(v50);
                LODWORD(v5pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = IOSurfaceGetID(*(IOSurfaceRef *)(a2 + 8208));
              }
              int v99 = (int)v50;
              LODWORD(v51) = *(_DWORD *)(a2 + 4080);
              if (v51)
              {
                unint64_t v52 = 0;
                uint64_t v53 = 2040;
                do
                {
                  v54 = (CFTypeRef *)(a2 + 8 * v52);
                  CFRetain(*v54);
                  v95[v52] = IOSurfaceGetID((IOSurfaceRef)*v54);
                  *((unsigned char *)&v95[255] + v52) = *(_DWORD *)(a2 + v53);
                  *(_DWORD *)&buf[v53 - 716] = *(_DWORD *)(a2 + v53 + 1020);
                  ++v52;
                  v51 = (unsigned char *)*(unsigned int *)(a2 + 4080);
                  v53 += 4;
                }
                while (v52 < (unint64_t)v51);
              }
              int v55 = *(_DWORD *)(a2 + 8168);
              if (v51 < v55 + (int)v51)
              {
                unint64_t v56 = v51;
                __int16 v57 = (CFTypeRef *)(a2 + 4088);
                v58 = (_DWORD *)(a2 + 6128);
                do
                {
                  CFRetain(*v57);
                  IOSurfaceID ID = IOSurfaceGetID((IOSurfaceRef)*v57);
                  v51 = &buf[4 * v56];
                  *((_DWORD *)v51 + 8) = ID;
                  *((unsigned char *)&v95[255] + v56) = *v58;
                  *((_DWORD *)v51 + 331) = v58[255];
                  ++v56;
                  LODWORD(v51) = *(_DWORD *)(a2 + 4080);
                  int v55 = *(_DWORD *)(a2 + 8168);
                  ++v57;
                  ++v58;
                }
                while (v56 < (v55 + v51));
              }
              LODWORD(v6pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *(_DWORD *)(a2 + 0x2000);
              if (v60)
              {
                unint64_t v61 = 0;
                do
                {
                  int v62 = (CFTypeRef *)(a2 + 8176 + 8 * v61);
                  CFRetain(*v62);
                  v95[v61++ + 321] = IOSurfaceGetID((IOSurfaceRef)*v62);
                  unint64_t v60 = *(unsigned int *)(a2 + 0x2000);
                }
                while (v61 < v60);
                LODWORD(v51) = *(_DWORD *)(a2 + 4080);
                int v55 = *(_DWORD *)(a2 + 8168);
              }
              __int16 v98 = *(_WORD *)(a2 + 8401);
              v95[319] = v55;
              v95[320] = v60;
              uint64_t v63 = *(void *)(a2 + 8232);
              *(_DWORD *)&buf[24] = *(_DWORD *)(a2 + 8240);
              int v94 = (int)v51;
              uint64_t v64 = *(void *)(a2 + 8256);
              *(void *)timespec buf = v63;
              *(void *)&buf[8] = v64;
              *(void *)&uint8_t buf[16] = *(void *)(a2 + 8244);
              LODWORD(v64) = *(_DWORD *)(a1 + 16);
              BOOL v96 = v64 == 0;
              v100 = a3;
              int v101 = v64;
              if (a3 && (uint64_t v65 = *a3, v65))
              {
                char v66 = 0;
                v67 = (int *)(a3 + 3);
                do
                {
                  int v68 = *v67;
                  v67 += 12;
                  if (v68 == 2) {
                    char v66 = 1;
                  }
                  --v65;
                }
                while (v65);
                int v69 = v66 & 1;
              }
              else
              {
                int v69 = 0;
              }
              if (a4)
              {
                ++*(_DWORD *)(a1 + 56);
                pthread_mutex_unlock((pthread_mutex_t *)(a1 + 112));
                uint64_t v70 = H11ANE::H11ANEDevice::ANE_ProgramSendRequest(*(void *)(a1 + 352), buf, *(_DWORD *)(a1 + 336), 1u, v87);
                uint64_t v14 = v70;
                if (!v70) {
                  H11ANE::H11ANEFrameReceiver::syncFrameDone(a1, a2, v87);
                }
                H11ANE::H11ANEFrameReceiver::releaseRequestBuffers(v70, a2);
                H11ANE::H11ANEFrameReceiverRequest::~H11ANEFrameReceiverRequest((H11ANE::H11ANEFrameReceiverRequest *)a2);
                MEMORY[0x21667E660]();
                pthread_mutex_lock((pthread_mutex_t *)(a1 + 112));
                int v71 = *(_DWORD *)(a1 + 56) - 1;
                *(_DWORD *)(a1 + 56) = v71;
                if (!v71) {
                  pthread_cond_signal((pthread_cond_t *)(a1 + 64));
                }
              }
              else
              {
                v86 = (H11ANE::H11ANEFrameReceiverRequest *)a2;
                char v97 = *(unsigned char *)(a2 + 8400);
                pthread_mutex_lock((pthread_mutex_t *)(a1 + 176));
                std::deque<H11ANE::H11ANEFrameReceiverRequest *>::push_back((void *)(a1 + 360), &v86);
                pthread_mutex_unlock((pthread_mutex_t *)(a1 + 176));
                uint64_t v14 = H11ANE::H11ANEDevice::ANE_ProgramSendRequest(*(void *)(a1 + 352), buf, *(_DWORD *)(a1 + 336), 0, v87);
                if (v14)
                {
                  pthread_mutex_lock((pthread_mutex_t *)(a1 + 176));
                  unint64_t v72 = *(void *)(a1 + 392);
                  uint64_t v73 = *(void *)(a1 + 368);
                  uint64_t v74 = *(void *)(a1 + 376);
                  v75 = (char *)(v73 + 8 * (v72 >> 9));
                  if (v74 == v73) {
                    v76 = 0;
                  }
                  else {
                    v76 = (char *)(*(void *)v75 + 8 * (*(void *)(a1 + 392) & 0x1FFLL));
                  }
LABEL_75:
                  v77 = v76;
                  while (1)
                  {
                    if (v74 == v73) {
                      uint64_t v78 = 0;
                    }
                    else {
                      uint64_t v78 = *(void *)(v73 + (((*(void *)(a1 + 400) + v72) >> 6) & 0x3FFFFFFFFFFFFF8))
                    }
                          + 8 * ((*(void *)(a1 + 400) + v72) & 0x1FF);
                    if (v77 == (char *)v78)
                    {
                      uint64_t v80 = pthread_mutex_unlock((pthread_mutex_t *)(a1 + 176));
                      H11ANE::H11ANEFrameReceiver::releaseRequestBuffers(v80, a2);
                      goto LABEL_13;
                    }
                    if (*(void *)v77 && *(void *)(*(void *)v77 + 8256) == *((void *)v86 + 1032)) {
                      break;
                    }
                    v77 += 8;
                    v76 += 8;
                    if ((char *)(*(void *)v75 + 4096) == v76)
                    {
                      v79 = (char *)*((void *)v75 + 1);
                      v75 += 8;
                      v76 = v79;
                      goto LABEL_75;
                    }
                  }
                  std::deque<H11ANE::H11ANEFrameReceiverRequest *>::erase((int64x2_t *)(a1 + 360), v75, v76);
                  uint64_t v81 = pthread_mutex_unlock((pthread_mutex_t *)(a1 + 176));
                  H11ANE::H11ANEFrameReceiver::releaseRequestBuffers(v81, a2);
                  if (v86)
                  {
                    H11ANE::H11ANEFrameReceiverRequest::~H11ANEFrameReceiverRequest(v86);
                    MEMORY[0x21667E660]();
                  }
                  v86 = 0;
                }
                else if (v69)
                {
                  H11ANE::H11ANEFrameReceiver::stopNoDataTimer((H11ANE::H11ANEFrameReceiver *)a1);
                }
                else if (*(void *)(a1 + 400) == 1)
                {
                  H11ANE::H11ANEFrameReceiver::startNoDataTimer((H11ANE::H11ANEFrameReceiver *)a1);
                }
              }
            }
          }
        }
        else
        {
          uint64_t v14 = 3758097090;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            H11ANE::H11ANEFrameReceiver::ProgramProcessRequest(v34, v35, v36, v37, v38, v39, v40, v41);
          }
        }
      }
      else
      {
        uint64_t v14 = 3758097090;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          H11ANE::H11ANEFrameReceiver::ProgramProcessRequest(v26, v27, v28, v29, v30, v31, v32, v33);
        }
      }
    }
    else
    {
      uint64_t v14 = 3758097090;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        H11ANE::H11ANEFrameReceiver::ProgramProcessRequest();
      }
    }
  }
LABEL_13:
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 112));
  uint64_t v23 = +[ANEServicesLog handle];
  if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL)
  {
    timeval v24 = v23;
    if (os_signpost_enabled(v23))
    {
      *(_DWORD *)v87 = 134218496;
      uint64_t v88 = v83;
      __int16 v89 = 1024;
      int v90 = v84;
      __int16 v91 = 2048;
      uint64_t v92 = v85;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v24, OS_SIGNPOST_INTERVAL_END, v10, "H11ANEFrameReceiverProcessRequest", "progHandle=%llx procid=%x transid=%llx", v87, 0x1Cu);
    }
  }
  return v14;
}

void H11ANE::H11ANEFrameReceiver::syncFrameDone(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unsigned int v6 = (void *)(a2 + 8232);
  int v20 = *(_DWORD *)(a2 + 8240);
  uint64_t v7 = (void *)(a2 + 8256);
  uint64_t v18 = *(void *)(a2 + 8256);
  uint64_t v19 = *(void *)(a2 + 8232);
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B220C);
  uint64_t v9 = +[ANEServicesLog handle];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v9))
    {
      *(_DWORD *)timespec buf = 134218752;
      uint64_t v22 = v19;
      __int16 v23 = 1024;
      int v24 = v20;
      __int16 v25 = 2048;
      uint64_t v26 = v18;
      __int16 v27 = 2048;
      uint64_t v28 = a3;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "H11ANEFrameReceiverFrameDone", "progHandle=%llx procid=%x transid=%llx reqcallBackData=%llx", buf, 0x26u);
    }
  }
  if (*v7 != *a3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    H11ANE::H11ANEFrameReceiver::syncFrameDone();
  }
  if (*v6 != a3[1] && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    H11ANE::H11ANEFrameReceiver::syncFrameDone();
  }
  *(unsigned char *)(a2 + 8288) = a3[2];
  int v11 = *(void (**)(void, uint64_t))(a1 + 32);
  if (v11)
  {
    uint64_t v12 = a3[3];
    if (v12)
    {
      *(_DWORD *)(a2 + 8224) = 0;
      *(void *)(a2 + 8264) = v12 | 0x1000;
      v11(*(void *)(a1 + 24), a2);
    }
    *(void *)(a2 + 8264) = 0;
    if (debugFwStatsData)
    {
      uint64_t v13 = *(__CVBuffer **)(a2 + 8200);
      if (v13)
      {
        if ((*(unsigned char *)(a2 + 8196) & 0xB) != 0)
        {
          CVPixelBufferLockBaseAddress(v13, 0);
          BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a2 + 8200));
          H11ANE::dumpFwStatsData(BaseAddress);
          CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a2 + 8200), 0);
        }
      }
    }
    if (a3[4] == 1) {
      int v15 = 0;
    }
    else {
      int v15 = -536870165;
    }
    *(_DWORD *)(a2 + 8224) = v15;
    (*(void (**)(void, uint64_t))(a1 + 32))(*(void *)(a1 + 24), a2);
  }
  uint64_t v16 = +[ANEServicesLog handle];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v17 = v16;
    if (os_signpost_enabled(v16))
    {
      *(_DWORD *)timespec buf = 134218752;
      uint64_t v22 = v19;
      __int16 v23 = 1024;
      int v24 = v20;
      __int16 v25 = 2048;
      uint64_t v26 = v18;
      __int16 v27 = 2048;
      uint64_t v28 = a3;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v17, OS_SIGNPOST_INTERVAL_END, v8, "H11ANEFrameReceiverFrameDone", "progHandle=%llx procid=%x transid=%llx reqCb->programHandle=0x%llx", buf, 0x26u);
    }
  }
}

void std::deque<H11ANE::H11ANEFrameReceiverRequest *>::push_back(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 6) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    std::deque<H11ANE::H11ANEFrameReceiverRequest *>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }
  *(void *)(*(void *)(v5 + ((v8 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v8 & 0x1FF)) = *a2;
  a1[5] = v7 + 1;
}

uint64_t H11ANE::H11ANEFrameReceiver::startNoDataTimer(H11ANE::H11ANEFrameReceiver *this)
{
  os_signpost_id_t v2 = (pthread_mutex_t *)((char *)this + 256);
  pthread_mutex_lock((pthread_mutex_t *)this + 4);
  unint64_t v3 = (__CFRunLoopTimer *)*((void *)this + 40);
  if (v3)
  {
    CFRunLoopTimerInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 40));
    *((void *)this + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  }
  context.version = 0;
  context.info = this;
  memset(&context.retain, 0, 24);
  if (*((_DWORD *)this + 4))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    LODWORD(v5) = *((_DWORD *)this + 4);
    uint64_t v6 = CFRunLoopTimerCreate(0, Current + (double)v5 / 1000.0 + 30.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)H11ANE::H11ANEFrameReceiver::NoDataTimeout, &context);
    *((void *)this + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v6;
    if (v6) {
      CFRunLoopAddTimer(*((CFRunLoopRef *)this + 1), v6, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    }
  }
  return pthread_mutex_unlock(v2);
}

void *std::deque<H11ANE::H11ANEFrameReceiverRequest *>::erase(int64x2_t *a1, char *a2, char *a3)
{
  uint64_t v4 = a1->i64[1];
  unint64_t v5 = (char *)(v4 + 8 * ((unint64_t)a1[2].i64[0] >> 9));
  if (a1[1].i64[0] == v4) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = (char *)(*(void *)v5 + 8 * (a1[2].i64[0] & 0x1FF));
  }
  uint64_t v32 = (char **)(v4 + 8 * ((unint64_t)a1[2].i64[0] >> 9));
  uint64_t v33 = v6;
  if (v6 == a3) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = ((uint64_t)&a3[-*(void *)a2] >> 3) + ((a2 - v5) << 6) - ((uint64_t)&v6[-*(void *)v5] >> 3);
  }
  unint64_t v8 = (char **)std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>::operator+[abi:ne180100]((uint64_t)&v32, v7);
  unint64_t v10 = (unint64_t)v8;
  unint64_t v11 = (unint64_t)v9;
  uint64_t v12 = a1[2].i64[1];
  if (v7 <= (unint64_t)(v12 - 1) >> 1)
  {
    uint64_t v18 = v9 - *v8;
    uint64_t v19 = v18 >> 3;
    if (v18 < -7)
    {
      unint64_t v28 = 510 - v19;
      uint64_t v21 = &v8[-(v28 >> 9)];
      uint64_t v22 = &(*v21)[8 * (~(_WORD)v28 & 0x1FF)];
    }
    else
    {
      unint64_t v20 = v19 + 1;
      uint64_t v21 = &v8[v20 >> 9];
      uint64_t v22 = &(*v21)[8 * (v20 & 0x1FF)];
    }
    std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>(v32, v33, v8, v9, v21, v22, v34);
    a1[2] = vaddq_s64(a1[2], (int64x2_t)xmmword_2120C2600);
    std::deque<H11ANE::H11ANEFrameReceiverRequest *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)a1, 1);
  }
  else
  {
    uint64_t v13 = v9 - *v8;
    uint64_t v14 = v13 >> 3;
    if (v13 < -7)
    {
      unint64_t v23 = 510 - v14;
      uint64_t v16 = &v8[-(v23 >> 9)];
      uint64_t v17 = &(*v16)[8 * (~(_WORD)v23 & 0x1FF)];
    }
    else
    {
      unint64_t v15 = v14 + 1;
      uint64_t v16 = &v8[v15 >> 9];
      uint64_t v17 = &(*v16)[8 * (v15 & 0x1FF)];
    }
    unint64_t v24 = a1[2].i64[0] + v12;
    uint64_t v25 = a1->i64[1];
    uint64_t v26 = (char **)(v25 + 8 * (v24 >> 9));
    if (a1[1].i64[0] == v25) {
      __int16 v27 = 0;
    }
    else {
      __int16 v27 = &(*v26)[8 * (v24 & 0x1FF)];
    }
    v34[0].n128_u64[0] = v10;
    v34[0].n128_u64[1] = v11;
    std::__for_each_segment[abi:ne180100]<std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,std::__move_loop<std::_ClassicAlgPolicy>::_MoveSegment<std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>>>(v16, v17, v26, v27, (uint64_t)v34);
    --a1[2].i64[1];
    std::deque<H11ANE::H11ANEFrameReceiverRequest *>::__maybe_remove_back_spare[abi:ne180100](a1, 1);
  }
  uint64_t v29 = a1->i64[1];
  if (a1[1].i64[0] == v29) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = *(void *)(v29 + 8 * ((unint64_t)a1[2].i64[0] >> 9)) + 8 * (a1[2].i64[0] & 0x1FF);
  }
  v34[0].n128_u64[0] = v29 + 8 * ((unint64_t)a1[2].i64[0] >> 9);
  v34[0].n128_u64[1] = v30;
  return std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>::operator+[abi:ne180100]((uint64_t)v34, v7);
}

unsigned __int16 *H11ANE::dumpFwStatsData(unsigned __int16 *result)
{
  if (result)
  {
    uint64_t v1 = result;
    printf("%s Stats Buffer content:\n", "dumpFwStatsData");
    printf("%s   Version: %d\n", "dumpFwStatsData", *v1);
    printf("%s   programId: %d\n", "dumpFwStatsData", *((_DWORD *)v1 + 1));
    printf("%s   processId:%d\n", "dumpFwStatsData", *((_DWORD *)v1 + 2));
    printf("%s   procedureId:%d\n", "dumpFwStatsData", *((_DWORD *)v1 + 3));
    printf("%s   uuid:0x%llx\n", "dumpFwStatsData", *((void *)v1 + 2));
    printf("%s   priority:%d\n", "dumpFwStatsData", *((_DWORD *)v1 + 6));
    uint64_t result = (unsigned __int16 *)printf("%s   totDescriptors:%d\n", "dumpFwStatsData", *((_DWORD *)v1 + 7));
    if (*((_DWORD *)v1 + 7))
    {
      uint64_t v2 = 0;
      uint64_t v17 = v1 + 12;
      uint64_t v18 = v1 + 76;
      uint64_t v19 = v1;
      do
      {
        unint64_t v3 = &v1[4 * v2];
        int v4 = *((_DWORD *)v3 + 8);
        int v5 = *((_DWORD *)v3 + 9);
        uint64_t v6 = (unsigned int *)(v3 + 16);
        uint64_t v20 = v2;
        printf("%s descr%d: offset: %x, size: %x\n", "dumpFwStatsData", v2, v4, v5);
        int v7 = *v1;
        if (v7 == 513)
        {
          uint64_t v13 = *v6;
          uint64_t v14 = (_DWORD *)((char *)v1 + v13);
          printf("%s totalEventsSpace: %x \n", "dumpFwDramLogStatsData", *v14);
          printf("%s totEventsReceived: %d \n", "dumpFwDramLogStatsData", v14[1]);
          uint64_t result = (unsigned __int16 *)printf("%s totEventsRecorded: %d \n", "dumpFwDramLogStatsData", v14[1]);
          if (v14[1])
          {
            unint64_t v15 = 0;
            uint64_t v16 = (unsigned __int16 *)((char *)v18 + v13);
            do
            {
              printf("%s tid: %d \n", "dumpFwDramLogStatsData", *v16);
              printf("%s nid: %d \n", "dumpFwDramLogStatsData", *v16);
              printf("%s event: %x \n", "dumpFwDramLogStatsData", *((unsigned __int8 *)v16 + 3));
              printf("%s aux: %x \n", "dumpFwDramLogStatsData", *((_DWORD *)v16 + 1) & 0x1F);
              uint64_t result = (unsigned __int16 *)printf("%s timeStamp: %llx \n", "dumpFwDramLogStatsData", *((void *)v16 + 1));
              ++v15;
              v16 += 8;
            }
            while (v15 < v14[1]);
          }
        }
        else if (v7 == 257)
        {
          uint64_t v8 = *v6;
          uint64_t v9 = (_DWORD *)((char *)v1 + v8);
          printf("%s totalEventsSpace: %x \n", "dumpFwDebugLogStatsData", *v9);
          printf("%s totEventsReceived: %d \n", "dumpFwDebugLogStatsData", v9[1]);
          uint64_t result = (unsigned __int16 *)printf("%s totEventsRecorded: %d \n", "dumpFwDebugLogStatsData", v9[2]);
          if (v9[2])
          {
            unint64_t v10 = 0;
            unint64_t v11 = (void *)((char *)v17 + v8);
            do
            {
              printf("%s tid: %d \n", "dumpFwDebugLogStatsData", *((_DWORD *)v11 - 3));
              printf("%s nid: %d \n", "dumpFwDebugLogStatsData", *((_DWORD *)v11 - 2));
              printf("%s event: %x \n", "dumpFwDebugLogStatsData", *((unsigned __int16 *)v11 - 2));
              printf("%s aux: %x \n", "dumpFwDebugLogStatsData", *((unsigned __int8 *)v11 - 2));
              uint64_t v12 = *v11;
              unint64_t v11 = (void *)((char *)v11 + 20);
              uint64_t result = (unsigned __int16 *)printf("%s timeStamp: %llx \n", "dumpFwDebugLogStatsData", v12);
              ++v10;
            }
            while (v10 < v9[2]);
          }
        }
        else
        {
          uint64_t result = (unsigned __int16 *)printf("%s ERROR: Invalid stats version %u\n", "dumpFwStatsData", *v1);
        }
        uint64_t v1 = v19;
        uint64_t v2 = v20 + 1;
      }
      while (v20 + 1 < (unint64_t)*((unsigned int *)v19 + 7));
    }
  }
  return result;
}

void *H11ANE::H11ANEFrameReceiver::FrameDone(void *this, void *a2, void *a3, unint64_t *a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (!this) {
    return this;
  }
  if (a4 != 8) {
    return (void *)printf("H11ANEFrameReceiver::FrameDone, numArgs=%d doesn't match kernel side size: %d, No action\n", a4, 8);
  }
  int v5 = (int)a2;
  uint64_t v6 = (uint64_t)this;
  uint64_t v7 = a3[4] | (a3[3] << 32);
  uint64_t v8 = a3[1] | (a3[2] << 32);
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B220C);
  unint64_t v10 = +[ANEServicesLog handle];
  os_signpost_id_t spid = v9;
  unint64_t v30 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v11 = v10;
    if (os_signpost_enabled(v10))
    {
      *(_DWORD *)timespec buf = 134218752;
      uint64_t v32 = v7;
      __int16 v33 = 1024;
      *(_DWORD *)uint64_t v34 = 0;
      *(_WORD *)&v34[4] = 2048;
      *(void *)&v34[6] = v8;
      *(_WORD *)&v34[14] = 2048;
      *(void *)&v34[16] = a3;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "H11ANEFrameReceiverFrameDone", "progHandle=%llx procid=%x transid=%llx args=%llx", buf, 0x26u);
    }
  }
  uint64_t v12 = (__CVBuffer *)pthread_mutex_lock((pthread_mutex_t *)(v6 + 176));
  uint64_t v13 = *(void *)(v6 + 368);
  uint64_t v14 = *(void *)(v6 + 376);
  uint64_t v15 = v13 + 8 * (*(void *)(v6 + 392) >> 9);
  if (v14 == v13) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = (char *)(*(void *)v15 + 8 * (*(void *)(v6 + 392) & 0x1FFLL));
  }
  uint64_t v17 = &_os_log_internal;
  while (1)
  {
    if (v14 == v13)
    {
      uint64_t v19 = 0;
    }
    else
    {
      unint64_t v18 = *(void *)(v6 + 400) + *(void *)(v6 + 392);
      uint64_t v19 = *(void *)(v13 + ((v18 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v18 & 0x1FF);
    }
    if (v16 == (char *)v19)
    {
      int v23 = 0;
      goto LABEL_24;
    }
    uint64_t v20 = *(void *)v16;
    if (*(void *)v16)
    {
      if (*(void *)(v20 + 8256) == v8) {
        break;
      }
    }
LABEL_20:
    v16 += 8;
    if (&v16[-*(void *)v15] == (char *)4096)
    {
      uint64_t v22 = *(char **)(v15 + 8);
      v15 += 8;
      uint64_t v16 = v22;
    }
    uint64_t v13 = *(void *)(v6 + 368);
    uint64_t v14 = *(void *)(v6 + 376);
  }
  uint64_t v21 = *(void *)(v20 + 8232);
  if (v21 != v7)
  {
    uint64_t v12 = (__CVBuffer *)os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      *(_DWORD *)timespec buf = 134218496;
      uint64_t v32 = v8;
      __int16 v33 = 2048;
      *(void *)uint64_t v34 = v21;
      *(_WORD *)&v34[8] = 2048;
      *(void *)&v34[10] = v7;
      _os_log_error_impl(&dword_21209C000, v17, OS_LOG_TYPE_ERROR, "Request received for different program!! transactionId=0x%llx, req->programHandle=0x%llx, programHandle=0x%llx\n", buf, 0x20u);
    }
    goto LABEL_20;
  }
  *(unsigned char *)(v20 + 8288) = a3[6];
  if (*a3 == 768 && (unint64_t)(a3[7] - 1) <= 1) {
    uint64_t v12 = (__CVBuffer *)std::deque<H11ANE::H11ANEFrameReceiverRequest *>::erase((int64x2_t *)(v6 + 360), (char *)v15, v16);
  }
  uint64_t v7 = *(void *)(v20 + 8232);
  int v23 = *(_DWORD *)(v20 + 8240);
  uint64_t v8 = *(void *)(v20 + 8256);
  *(_DWORD *)(v20 + 8224) = v5;
  if (*(void *)(v6 + 32))
  {
    if (*a3 == 770)
    {
      *(void *)(v20 + 8264) = a3[7] | 0x1000;
    }
    else
    {
      *(void *)(v20 + 8264) = 0;
      if (debugFwStatsData)
      {
        uint64_t v12 = *(__CVBuffer **)(v20 + 8200);
        if (v12)
        {
          if ((*(unsigned char *)(v20 + 8196) & 0xB) != 0)
          {
            CVPixelBufferLockBaseAddress(v12, 0);
            BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(v20 + 8200));
            H11ANE::dumpFwStatsData(BaseAddress);
            uint64_t v12 = (__CVBuffer *)CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(v20 + 8200), 0);
          }
        }
      }
    }
    __int16 v27 = (void *)MEMORY[0x21667E960](v12);
    (*(void (**)(void, uint64_t))(v6 + 32))(*(void *)(v6 + 24), v20);
    if (*a3 == 768 && a3[7] == 1)
    {
      H11ANE::H11ANEFrameReceiver::releaseRequestBuffers(v28, v20);
      H11ANE::H11ANEFrameReceiverRequest::~H11ANEFrameReceiverRequest((H11ANE::H11ANEFrameReceiverRequest *)v20);
      MEMORY[0x21667E660]();
    }
  }
LABEL_24:
  if (*(void *)(v6 + 400)) {
    H11ANE::H11ANEFrameReceiver::tickleNoDataTimer((pthread_mutex_t *)v6);
  }
  else {
    H11ANE::H11ANEFrameReceiver::stopNoDataTimer((H11ANE::H11ANEFrameReceiver *)v6);
  }
  if (*(unsigned char *)(v6 + 248) && !*(void *)(v6 + 400)) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v6 + 240));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v6 + 176));
  unint64_t v24 = +[ANEServicesLog handle];
  if (v30 < 0xFFFFFFFFFFFFFFFELL)
  {
    uint64_t v25 = v24;
    unint64_t v24 = os_signpost_enabled(v24);
    if (v24)
    {
      *(_DWORD *)timespec buf = 134218752;
      uint64_t v32 = v7;
      __int16 v33 = 1024;
      *(_DWORD *)uint64_t v34 = v23;
      *(_WORD *)&v34[4] = 2048;
      *(void *)&v34[6] = v8;
      *(_WORD *)&v34[14] = 2048;
      *(void *)&v34[16] = a3;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v25, OS_SIGNPOST_INTERVAL_END, spid, "H11ANEFrameReceiverFrameDone", "progHandle=%llx procid=%x transid=%llx args=%llx", buf, 0x26u);
    }
  }
  return H11ANE::H11ANECheckForPendingClose((H11ANE *)v24);
}

uint64_t H11ANE::H11ANEFrameReceiver::tickleNoDataTimer(pthread_mutex_t *this)
{
  uint64_t v2 = this + 4;
  pthread_mutex_lock(this + 4);
  sig = (__CFRunLoopTimer *)this[5].__sig;
  if (sig)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    LODWORD(v5) = *(_DWORD *)&this->__opaque[8];
    CFRunLoopTimerSetNextFireDate(sig, Current + (double)v5 / 1000.0 + 30.0);
  }
  return pthread_mutex_unlock(v2);
}

uint64_t H11ANE::H11ANEFrameReceiver::NoDataTimeout(H11ANE::H11ANEFrameReceiver *this, __CFRunLoopTimer *a2, void *a3)
{
  int v4 = (pthread_mutex_t *)((char *)a2 + 176);
  pthread_mutex_lock((pthread_mutex_t *)((char *)a2 + 176));
  unint64_t v5 = (void **)*((void *)a2 + 46);
  uint64_t v6 = (void **)*((void *)a2 + 47);
  uint64_t v7 = &v5[*((void *)a2 + 49) >> 9];
  if (v6 == v5) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = (uint64_t *)((char *)*v7 + 8 * (*((void *)a2 + 49) & 0x1FFLL));
  }
  while (1)
  {
    if (v6 == v5)
    {
      uint64_t v10 = 0;
    }
    else
    {
      unint64_t v9 = *((void *)a2 + 50) + *((void *)a2 + 49);
      uint64_t v10 = *(uint64_t *)((char *)v5 + ((v9 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v9 & 0x1FF);
    }
    if (v8 == (uint64_t *)v10) {
      break;
    }
    uint64_t v11 = *v8;
    if (*v8)
    {
      *(_DWORD *)(v11 + 8224) = -536870186;
      *(void *)(v11 + 8264) = 0;
      (*((void (**)(void, uint64_t))a2 + 4))(*((void *)a2 + 3), v11);
      unsigned int v12 = *(_DWORD *)(v11 + 4080);
      if (v12)
      {
        for (unsigned __int8 i = 0; i < v12; ++i)
        {
          uint64_t v14 = *(const void **)(v11 + 8 * i);
          if (v14)
          {
            CFRelease(v14);
            unsigned int v12 = *(_DWORD *)(v11 + 4080);
          }
        }
      }
      *(_DWORD *)(v11 + 408pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
      unsigned int v15 = *(_DWORD *)(v11 + 8168);
      if (v15)
      {
        for (unsigned __int8 j = 0; j < v15; ++j)
        {
          uint64_t v17 = *(const void **)(v11 + 8 * j + 4088);
          if (v17)
          {
            CFRelease(v17);
            unsigned int v15 = *(_DWORD *)(v11 + 8168);
          }
        }
      }
      *(_DWORD *)(v11 + 8168) = 0;
      unsigned int v18 = *(_DWORD *)(v11 + 0x2000);
      if (v18)
      {
        for (unsigned __int8 k = 0; k < v18; ++k)
        {
          uint64_t v20 = *(const void **)(v11 + 8 * k + 8176);
          if (v20)
          {
            CFRelease(v20);
            unsigned int v18 = *(_DWORD *)(v11 + 0x2000);
          }
        }
      }
      *(_DWORD *)(v11 + 0x200pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
      uint64_t v21 = *(__CVBuffer **)(v11 + 8200);
      if (v21) {
        CVPixelBufferRelease(v21);
      }
      uint64_t v22 = *(const void **)(v11 + 8216);
      if (v22) {
        CFRelease(v22);
      }
      *(_DWORD *)(v11 + 8196) = 0;
      int v23 = *(const void **)(v11 + 8208);
      if (v23) {
        CFRelease(v23);
      }
      H11ANE::H11ANEFrameReceiverRequest::~H11ANEFrameReceiverRequest((H11ANE::H11ANEFrameReceiverRequest *)v11);
      MEMORY[0x21667E660]();
    }
    if ((char *)++v8 - (unsigned char *)*v7 == 4096)
    {
      unint64_t v24 = (uint64_t *)v7[1];
      ++v7;
      uint64_t v8 = v24;
    }
    unint64_t v5 = (void **)*((void *)a2 + 46);
    uint64_t v6 = (void **)*((void *)a2 + 47);
  }
  uint64_t v25 = (void (*)(void, void, void, void, void, void))*((void *)a2 + 5);
  if (v25)
  {
    v25(0, 0, 0, 0, 0, *((void *)a2 + 6));
    unint64_t v5 = (void **)*((void *)a2 + 46);
    uint64_t v6 = (void **)*((void *)a2 + 47);
  }
  *((void *)a2 + 5pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  unint64_t v26 = (char *)v6 - (char *)v5;
  if (v26 >= 0x11)
  {
    do
    {
      operator delete(*v5);
      uint64_t v27 = *((void *)a2 + 47);
      unint64_t v5 = (void **)(*((void *)a2 + 46) + 8);
      *((void *)a2 + 46) = v5;
      unint64_t v26 = v27 - (void)v5;
    }
    while (v26 > 0x10);
  }
  if (v26 >> 3 == 1)
  {
    uint64_t v28 = 256;
  }
  else
  {
    if (v26 >> 3 != 2) {
      goto LABEL_43;
    }
    uint64_t v28 = 512;
  }
  *((void *)a2 + 49) = v28;
LABEL_43:
  return pthread_mutex_unlock(v4);
}

void H11ANE::H11ANEFrameReceiverRequest::~H11ANEFrameReceiverRequest(H11ANE::H11ANEFrameReceiverRequest *this)
{
  uint64_t v1 = (const void *)*((void *)this + 1035);
  if (v1) {
    _Block_release(v1);
  }
}

void std::deque<H11ANE::H11ANEFrameReceiverRequest *>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    unint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)uint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      uint64_t v38 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        uint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        uint64_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)uint64_t v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      unint64_t v9 = (char *)a1[1];
    }
    uint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::push_front((uint64_t)a1, &v54);
    uint64_t v44 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    unint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>((uint64_t)(a1 + 3), v46);
      uint64_t v35 = &v34[8 * (v46 >> 2)];
      uint64_t v37 = &v34[8 * v47];
      int v48 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        uint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      uint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        uint64_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  unint64_t v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  uint64_t v53 = operator new(0x1000uLL);
  std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::push_back(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::push_front((uint64_t)&v54, v27);
  }
  uint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_2120A691C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::push_back(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      uint64_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        int64_t v16 = 1;
      }
      else {
        int64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      uint64_t v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        BOOL v10 = v9;
      }
      else {
        BOOL v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      uint64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

{
  char *v4;
  char *v5;
  unsigned char *v6;
  unsigned char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = (v7 - v4) >> 2;
      }
      unint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      int64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        int64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void *std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>::operator+[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)a1;
  if (a2)
  {
    uint64_t v4 = a2 + ((uint64_t)(*(void *)(a1 + 8) - *result) >> 3);
    if (v4 < 1) {
      result -= (unint64_t)(511 - v4) >> 9;
    }
    else {
      result += (unint64_t)v4 >> 9;
    }
  }
  return result;
}

uint64_t std::deque<H11ANE::H11ANEFrameReceiverRequest *>::__maybe_remove_front_spare[abi:ne180100](uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x200) {
    a2 = 1;
  }
  if (v2 < 0x400) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 512;
  }
  return v4 ^ 1u;
}

uint64_t std::deque<H11ANE::H11ANEFrameReceiverRequest *>::__maybe_remove_back_spare[abi:ne180100](void *a1, int a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  if (v2 == v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = ((v2 - v3) << 6) - 1;
  }
  unint64_t v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x200) {
    a2 = 1;
  }
  if (v5 < 0x400) {
    int v7 = a2;
  }
  else {
    int v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

__n128 std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>@<Q0>(char **a1@<X1>, char *a2@<X2>, char **a3@<X3>, char *a4@<X4>, void *a5@<X5>, char *a6@<X6>, __n128 *a7@<X8>)
{
  if (a1 == a3)
  {
    uint64_t v19 = a2;
    uint64_t v18 = a4;
    uint64_t v15 = a5;
    int64_t v16 = a6;
  }
  else
  {
    uint64_t v13 = a3 - 1;
    unint64_t v12 = *a3;
    uint64_t v14 = a4;
    uint64_t v15 = a5;
    int64_t v16 = a6;
    while (1)
    {
      std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<H11ANE::H11ANEFrameReceiverRequest **,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>(v12, v14, v15, v16, &v21);
      int64_t v16 = (char *)v22.n128_u64[1];
      uint64_t v15 = (void *)v22.n128_u64[0];
      if (v13 == a1) {
        break;
      }
      uint64_t v17 = *v13--;
      unint64_t v12 = v17;
      uint64_t v14 = v17 + 4096;
    }
    uint64_t v18 = *a1 + 4096;
    uint64_t v19 = a2;
  }
  std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<H11ANE::H11ANEFrameReceiverRequest **,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>(v19, v18, v15, v16, &v21);
  __n128 result = v22;
  a7->n128_u64[0] = (unint64_t)a3;
  a7->n128_u64[1] = (unint64_t)a4;
  a7[1] = result;
  return result;
}

void *std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<H11ANE::H11ANEFrameReceiverRequest **,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>@<X0>(char *a1@<X1>, char *a2@<X2>, void *a3@<X3>, char *a4@<X4>, void *a5@<X8>)
{
  uint64_t v6 = a3;
  if (a1 == a2)
  {
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v9 = a2;
    uint64_t v10 = *a3;
    uint64_t v11 = a2;
    while (1)
    {
      uint64_t v12 = (uint64_t)&a4[-v10];
      if ((v11 - a1) >> 3 >= v12 >> 3) {
        uint64_t v13 = v12 >> 3;
      }
      else {
        uint64_t v13 = (v11 - a1) >> 3;
      }
      v11 -= 8 * v13;
      a4 -= 8 * v13;
      if (v13) {
        __n128 result = memmove(a4, v11, 8 * v13);
      }
      if (v11 == a1) {
        break;
      }
      uint64_t v15 = *--v6;
      uint64_t v10 = v15;
      a4 = (char *)(v15 + 4096);
    }
    if ((char *)(*v6 + 4096) == a4)
    {
      int64_t v16 = (char *)v6[1];
      ++v6;
      a4 = v16;
    }
  }
  *a5 = v9;
  a5[1] = v6;
  a5[2] = a4;
  return result;
}

double std::__for_each_segment[abi:ne180100]<std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,std::__move_loop<std::_ClassicAlgPolicy>::_MoveSegment<std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>>>(char **a1, char *__src, char **a3, char *a4, uint64_t a5)
{
  if (a1 == a3)
  {
    uint64_t v11 = *(void ***)a5;
    uint64_t v12 = *(char **)(a5 + 8);
    uint64_t v10 = __src;
  }
  else
  {
    uint64_t v8 = a1 + 1;
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest **,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>(__src, *(char **)(a5 + 8), *a1 + 4096, *(void ***)a5, &v14);
    for (*(_OWORD *)a5 = v15; v8 != a3; *(_OWORD *)a5 = v15)
    {
      uint64_t v9 = *v8++;
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest **,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>(v9, *(char **)(a5 + 8), v9 + 4096, *(void ***)a5, &v14);
    }
    uint64_t v10 = *a3;
    uint64_t v11 = *(void ***)a5;
    uint64_t v12 = *(char **)(a5 + 8);
  }
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest **,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>(v10, v12, a4, v11, &v14);
  double result = *(double *)&v15;
  *(_OWORD *)a5 = v15;
  return result;
}

char *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest **,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>@<X0>(char *__src@<X0>, char *__dst@<X3>, char *a3@<X1>, void **a4@<X2>, char **a5@<X8>)
{
  uint64_t v6 = a4;
  if (__src != a3)
  {
    uint64_t v9 = __src;
    uint64_t v6 = a4 + 1;
    uint64_t v10 = (char *)*a4;
    while (1)
    {
      uint64_t v11 = v10 - __dst + 4096;
      uint64_t v12 = (a3 - v9) >> 3 >= v11 >> 3 ? v11 >> 3 : (a3 - v9) >> 3;
      if (v12) {
        __src = (char *)memmove(__dst, v9, 8 * v12);
      }
      v9 += 8 * v12;
      if (v9 == a3) {
        break;
      }
      uint64_t v13 = (char *)*v6++;
      uint64_t v10 = v13;
      __dst = v13;
    }
    __dst += 8 * v12;
    if ((char *)*(v6 - 1) + 4096 == __dst) {
      __dst = (char *)*v6;
    }
    else {
      --v6;
    }
  }
  *a5 = a3;
  a5[1] = (char *)v6;
  a5[2] = __dst;
  return __src;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void H11ANE::H11ANEFrameReceiverBufferPool::H11ANEFrameReceiverBufferPool(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char a9, int a10, int a11, int a12, uint64_t a13, int a14)
{
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(_DWORD *)(a1 + 8) = a4;
  *(_DWORD *)(a1 + 12) = a5;
  *(_DWORD *)(a1 + 16) = a6;
  *(_DWORD *)(a1 + 2pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = a7;
  *(_DWORD *)(a1 + 24) = a8;
  *(unsigned char *)(a1 + 28) = a9;
  *(_DWORD *)(a1 + 32) = a10;
  *(_DWORD *)(a1 + 36) = a11;
  *(_DWORD *)(a1 + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = a12;
  long long v15 = (const void *)(a1 + 40);
  *(void *)(a1 + 44) = a13;
  *(_DWORD *)(a1 + 52) = a14;
  *(_DWORD *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)(a1 + 72) = Mutable;
  if (Mutable)
  {
    CFNumberRef v18 = CFNumberCreate(v16, kCFNumberSInt32Type, v15);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 72), (const void *)*MEMORY[0x263F041A0], v18);
    CFRelease(v18);
  }
  operator new[]();
}

{
  H11ANE::H11ANEFrameReceiverBufferPool::H11ANEFrameReceiverBufferPool(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

void H11ANE::H11ANEFrameReceiverBufferPool::~H11ANEFrameReceiverBufferPool(H11ANE::H11ANEFrameReceiverBufferPool *this)
{
  uint64_t v2 = (__CVPixelBufferPool *)*((void *)this + 8);
  if (v2) {
    CVPixelBufferPoolRelease(v2);
  }
  uint64_t v3 = (const void *)*((void *)this + 9);
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = *((void *)this + 10);
  if (v4) {
    MEMORY[0x21667E640](v4, 0x1000C8052888210);
  }
}

uint64_t H11ANE::H11ANEFrameReceiverBufferPool::activatePool(H11ANE::H11ANEFrameReceiverBufferPool *this)
{
  uint64_t v1 = 3758097084;
  if (*((void *)this + 8)) {
    return 3758097122;
  }
  CFMutableDictionaryRef v3 = H11ANE::H11ANECreateCVBufferPool(*((_DWORD *)this + 2), *((_DWORD *)this + 3), *((_DWORD *)this + 4), *((_DWORD *)this + 5), *((_DWORD *)this + 6), *((unsigned int *)this + 10), *((unsigned __int8 *)this + 28), *((_DWORD *)this + 8), *((_DWORD *)this + 9), *((_DWORD *)this + 11), *(_DWORD *)this < 2u, v5, *((_DWORD *)this + 13));
  *((void *)this + 8) = v3;
  if (v3)
  {
    CVPixelBufferPoolScanIOSurfaces();
    CVPixelBufferPoolPreAllocate();
    return 0;
  }
  return v1;
}

uint64_t H11ANE::MyCVPixelBufferPoolScanIOSurfacesCallback(H11ANE *this, __IOSurface *a2, H11ANE::H11ANEFrameReceiverBufferPool *a3)
{
  if (this && a2)
  {
    if (*((_DWORD *)a2 + 22) >= *((_DWORD *)a2 + 10)) {
      printf("%s: ERROR: all surfaceIds are populated\n", "void *H11ANE::MyCVPixelBufferPoolScanIOSurfacesCallback(IOSurfaceRef, H11ANEFrameReceiverBufferPool *)");
    }
    else {
      *(_DWORD *)(*((void *)a2 + 10) + 4 * (*((_DWORD *)a2 + 22))++) = IOSurfaceGetID(this);
    }
  }
  return 0;
}

uint64_t H11ANE::H11ANEFrameReceiverBufferPool::deactivatePool(H11ANE::H11ANEFrameReceiverBufferPool *this)
{
  uint64_t v2 = (__CVPixelBufferPool *)*((void *)this + 8);
  if (!v2) {
    return 3758097122;
  }
  CVPixelBufferPoolRelease(v2);
  uint64_t result = 0;
  *((void *)this + 8) = 0;
  return result;
}

uint64_t H11ANE::H11ANEFrameReceiverBufferPool::allocateBuffer(H11ANE::H11ANEFrameReceiverBufferPool *this, __CVBuffer **a2)
{
  uint64_t v2 = 3758097085;
  if (!a2) {
    return 3758097090;
  }
  *a2 = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  __int16 v5 = (__CVPixelBufferPool *)*((void *)this + 8);
  if (!v5) {
    return 3758097086;
  }
  uint64_t v6 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (*((unsigned char *)this + 60))
  {
    if (*((void *)this + 9))
    {
      CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, (char *)this + 40);
      CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 9), (const void *)*MEMORY[0x263F041A0], v7);
      CFRelease(v7);
      __int16 v5 = (__CVPixelBufferPool *)*((void *)this + 8);
    }
    *((unsigned char *)this + 6pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  }
  CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(*v6, v5, *((CFDictionaryRef *)this + 9), &pixelBufferOut);
  if (pixelBufferOut)
  {
    uint64_t v2 = 0;
    *a2 = pixelBufferOut;
  }
  return v2;
}

uint64_t H11ANE::H11ANEFrameReceiverBufferPool::ModifyBufferCount(H11ANE::H11ANEFrameReceiverBufferPool *this, int a2)
{
  uint64_t v3 = 3758097085;
  if (!*((void *)this + 8)) {
    return 3758097086;
  }
  if (!a2) {
    return 0;
  }
  int v4 = *((_DWORD *)this + 10) + a2;
  if (!v4) {
    return 3758097090;
  }
  if (!CVPixelBufferPoolSetMinBufferCount())
  {
    uint64_t v3 = 0;
    *((_DWORD *)this + 1pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v4;
    *((unsigned char *)this + 6pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 1;
  }
  return v3;
}

uint64_t ZinIrCompilerParamsUtils::PerfTracerCategoryToString@<X0>(int a1@<W0>, std::string *a2@<X8>)
{
  GetStringToPerfTracerCategoryMap((uint64_t)v9);
  int v4 = v10;
  if (v10)
  {
    while (1)
    {
      if (*((char *)v4 + 39) < 0) {
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v4[2], v4[3]);
      }
      else {
        std::string __p = *(std::string *)(v4 + 2);
      }
      int v8 = *((_DWORD *)v4 + 10);
      if (v8 == a1) {
        break;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      int v4 = (uint64_t *)*v4;
      if (!v4) {
        goto LABEL_9;
      }
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(a2, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      int v5 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
      a2[1].__r_.__value_.__s.__data_[0] = 1;
      if (v5 < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      *a2 = __p;
      a2[1].__r_.__value_.__s.__data_[0] = 1;
    }
  }
  else
  {
LABEL_9:
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2[1].__r_.__value_.__s.__data_[0] = 0;
  }
  return std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v9);
}

void sub_2120A7838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void GetStringToPerfTracerCategoryMap(uint64_t a1@<X8>)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(v3, "none");
  int v4 = 0;
  std::string::basic_string[abi:ne180100]<0>(v5, "l2");
  int v6 = 1;
  std::string::basic_string[abi:ne180100]<0>(v7, "dma_read");
  int v8 = 2;
  std::string::basic_string[abi:ne180100]<0>(v9, "dma_write");
  int v10 = 3;
  std::string::basic_string[abi:ne180100]<0>(v11, "kernel_read");
  int v12 = 4;
  std::string::basic_string[abi:ne180100]<0>(v13, "pe");
  int v14 = 5;
  std::string::basic_string[abi:ne180100]<0>(v15, "ne_all");
  int v16 = 6;
  std::string::basic_string[abi:ne180100]<0>(v17, "ne_0");
  int v18 = 7;
  std::string::basic_string[abi:ne180100]<0>(v19, "ne_1");
  int v20 = 8;
  std::string::basic_string[abi:ne180100]<0>(v21, "ne_2");
  int v22 = 9;
  std::string::basic_string[abi:ne180100]<0>(v23, "ne_3");
  int v24 = 10;
  std::string::basic_string[abi:ne180100]<0>(v25, "ne_4");
  int v26 = 11;
  std::string::basic_string[abi:ne180100]<0>(v27, "ne_5");
  int v28 = 12;
  std::string::basic_string[abi:ne180100]<0>(v29, "ne_6");
  int v30 = 13;
  std::string::basic_string[abi:ne180100]<0>(v31, "ne_7");
  int v32 = 14;
  std::string::basic_string[abi:ne180100]<0>(v33, "ne_8");
  int v34 = 15;
  std::string::basic_string[abi:ne180100]<0>(v35, "ne_9");
  int v36 = 16;
  std::string::basic_string[abi:ne180100]<0>(v37, "ne_10");
  int v38 = 17;
  std::string::basic_string[abi:ne180100]<0>(v39, "ne_11");
  int v40 = 18;
  std::string::basic_string[abi:ne180100]<0>(v41, "ne_12");
  int v42 = 19;
  std::string::basic_string[abi:ne180100]<0>(v43, "ne_13");
  int v44 = 20;
  std::string::basic_string[abi:ne180100]<0>(v45, "ne_14");
  int v46 = 21;
  std::string::basic_string[abi:ne180100]<0>(v47, "ne_15");
  int v48 = 22;
  std::unordered_map<std::string,PerfTracerCategory>::unordered_map(a1, v3, 23);
  uint64_t v2 = 736;
  do
  {
    if ((char)v3[v2 - 9] < 0) {
      operator delete(*(void **)&v3[v2 - 32]);
    }
    v2 -= 32;
  }
  while (v2);
}

void sub_2120A7BA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v12 = 736;
  while (1)
  {
    if (*(char *)(v10 + v12 - 9) < 0) {
      operator delete(*(void **)(v10 + v12 - 32));
    }
    v12 -= 32;
    if (!v12) {
      _Unwind_Resume(exception_object);
    }
  }
}

void sub_2120A7C48()
{
}

uint64_t ZinIrCompilerParamsUtils::PerfTracerMetricToString@<X0>(int a1@<W0>, std::string *a2@<X8>)
{
  GetStringToPerfTracerMetricMap((uint64_t)v9);
  int v4 = v10;
  if (v10)
  {
    while (1)
    {
      if (*((char *)v4 + 39) < 0) {
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v4[2], v4[3]);
      }
      else {
        std::string __p = *(std::string *)(v4 + 2);
      }
      int v8 = *((_DWORD *)v4 + 10);
      if (v8 == a1) {
        break;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      int v4 = (uint64_t *)*v4;
      if (!v4) {
        goto LABEL_9;
      }
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(a2, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      int v5 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
      a2[1].__r_.__value_.__s.__data_[0] = 1;
      if (v5 < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      *a2 = __p;
      a2[1].__r_.__value_.__s.__data_[0] = 1;
    }
  }
  else
  {
LABEL_9:
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2[1].__r_.__value_.__s.__data_[0] = 0;
  }
  return std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v9);
}

void sub_2120A7D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void GetStringToPerfTracerMetricMap(uint64_t a1@<X8>)
{
  uint64_t v139 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(v3, "none");
  int v4 = 0;
  std::string::basic_string[abi:ne180100]<0>(v5, "l2_cycle");
  int v6 = 1;
  std::string::basic_string[abi:ne180100]<0>(v7, "l2_src1_read_active_cycle");
  int v8 = 2;
  std::string::basic_string[abi:ne180100]<0>(v9, "l2_src1_read_idle_cycle");
  int v10 = 3;
  std::string::basic_string[abi:ne180100]<0>(v11, "l2_src2_read_active_cycle");
  int v12 = 4;
  std::string::basic_string[abi:ne180100]<0>(v13, "l2_src2_read_idle_cycle");
  int v14 = 5;
  std::string::basic_string[abi:ne180100]<0>(v15, "l2_write_active_cycle");
  int v16 = 6;
  std::string::basic_string[abi:ne180100]<0>(v17, "l2_write_idle_cycle");
  int v18 = 7;
  std::string::basic_string[abi:ne180100]<0>(v19, "l2_read_conflict_cycle");
  int v20 = 8;
  std::string::basic_string[abi:ne180100]<0>(v21, "l2_read_intra_conflict_cycle");
  int v22 = 9;
  std::string::basic_string[abi:ne180100]<0>(v23, "l2_read_conflict_count");
  int v24 = 10;
  std::string::basic_string[abi:ne180100]<0>(v25, "l2_read_intra_conflict_count");
  int v26 = 11;
  std::string::basic_string[abi:ne180100]<0>(v27, "l2_write_conflict_cycle");
  int v28 = 12;
  std::string::basic_string[abi:ne180100]<0>(v29, "l2_write_intra_conflict_cycle");
  int v30 = 13;
  std::string::basic_string[abi:ne180100]<0>(v31, "l2_write_conflict_count");
  int v32 = 14;
  std::string::basic_string[abi:ne180100]<0>(v33, "l2_write_intra_conflict_count");
  int v34 = 15;
  std::string::basic_string[abi:ne180100]<0>(v35, "dma_src1_read_active_cycle");
  int v36 = 16;
  std::string::basic_string[abi:ne180100]<0>(v37, "dma_src1_read_idle_cycle");
  int v38 = 17;
  std::string::basic_string[abi:ne180100]<0>(v39, "dma_src1_read_conflict_cycle");
  int v40 = 18;
  std::string::basic_string[abi:ne180100]<0>(v41, "dma_src1_read_intra_conflict_cycle");
  int v42 = 19;
  std::string::basic_string[abi:ne180100]<0>(v43, "dma_src1_read_conflict_count");
  int v44 = 20;
  std::string::basic_string[abi:ne180100]<0>(v45, "dma_src1_read_intra_conflict_count");
  int v46 = 21;
  std::string::basic_string[abi:ne180100]<0>(v47, "dma_src2_read_active_cycle");
  int v48 = 22;
  std::string::basic_string[abi:ne180100]<0>(v49, "dma_src2_read_idle_cycle");
  int v50 = 23;
  std::string::basic_string[abi:ne180100]<0>(v51, "dma_src2_read_conflict_cycle");
  int v52 = 24;
  std::string::basic_string[abi:ne180100]<0>(v53, "dma_src2_read_intra_conflict_cycle");
  int v54 = 25;
  std::string::basic_string[abi:ne180100]<0>(v55, "dma_src2_read_conflict_count");
  int v56 = 26;
  std::string::basic_string[abi:ne180100]<0>(v57, "dma_src2_read_intra_conflict_count");
  int v58 = 27;
  std::string::basic_string[abi:ne180100]<0>(v59, "dma_write_active_cycle");
  int v60 = 28;
  std::string::basic_string[abi:ne180100]<0>(v61, "dma_write_idle_cycle");
  int v62 = 29;
  std::string::basic_string[abi:ne180100]<0>(v63, "dma_write_conflict_cycle");
  int v64 = 30;
  std::string::basic_string[abi:ne180100]<0>(v65, "dma_write_intra_conflict_cycle");
  int v66 = 31;
  std::string::basic_string[abi:ne180100]<0>(v67, "dma_write_conflict_count");
  int v68 = 32;
  std::string::basic_string[abi:ne180100]<0>(v69, "dma_write_intra_conflict_count");
  int v70 = 33;
  std::string::basic_string[abi:ne180100]<0>(v71, "idle_cycle");
  int v72 = 34;
  std::string::basic_string[abi:ne180100]<0>(v73, "active_cycle");
  int v74 = 35;
  std::string::basic_string[abi:ne180100]<0>(v75, "beat_count_in_64B");
  int v76 = 36;
  std::string::basic_string[abi:ne180100]<0>(v77, "transaction_count");
  int v78 = 37;
  std::string::basic_string[abi:ne180100]<0>(v79, "latency_product");
  int v80 = 38;
  std::string::basic_string[abi:ne180100]<0>(v81, "latency_threshold");
  int v82 = 39;
  std::string::basic_string[abi:ne180100]<0>(v83, "fabric_stall");
  int v84 = 40;
  std::string::basic_string[abi:ne180100]<0>(v85, "mcache_hit_no_dealloc");
  int v86 = 41;
  std::string::basic_string[abi:ne180100]<0>(v87, "mcache_non_coh_agent");
  int v88 = 43;
  std::string::basic_string[abi:ne180100]<0>(v89, "mcache_coh_agent");
  int v90 = 44;
  std::string::basic_string[abi:ne180100]<0>(v91, "mcache_miss_alloc");
  int v92 = 42;
  std::string::basic_string[abi:ne180100]<0>(v93, "mcache_miss_no_alloc");
  int v94 = 45;
  std::string::basic_string[abi:ne180100]<0>(v95, "mcache_hit_depri");
  int v96 = 46;
  std::string::basic_string[abi:ne180100]<0>(v97, "mcache_hit_drop");
  int v98 = 47;
  std::string::basic_string[abi:ne180100]<0>(v99, "mcache_hit_no_alloc");
  int v100 = 48;
  std::string::basic_string[abi:ne180100]<0>(v101, "l2_stall");
  int v102 = 49;
  std::string::basic_string[abi:ne180100]<0>(v103, "tex_filter_cache_miss");
  int v104 = 50;
  std::string::basic_string[abi:ne180100]<0>(v105, "tex_filter_cache_total");
  int v106 = 51;
  std::string::basic_string[abi:ne180100]<0>(v107, "tex_index_cache_miss");
  int v108 = 52;
  std::string::basic_string[abi:ne180100]<0>(v109, "tex_index_cache_total");
  int v110 = 53;
  std::string::basic_string[abi:ne180100]<0>(v111, "decomp_metadata_cache_miss");
  int v112 = 54;
  std::string::basic_string[abi:ne180100]<0>(v113, "decomp_metadata_cache_hit");
  int v114 = 55;
  std::string::basic_string[abi:ne180100]<0>(v115, "decomp_data_cache_miss");
  int v116 = 56;
  std::string::basic_string[abi:ne180100]<0>(v117, "decomp_data_cache_hit");
  int v118 = 57;
  std::string::basic_string[abi:ne180100]<0>(v119, "ne_stall");
  int v120 = 58;
  std::string::basic_string[abi:ne180100]<0>(v121, "kernel_cache_miss");
  int v122 = 59;
  std::string::basic_string[abi:ne180100]<0>(v123, "ne_cycle");
  int v124 = 60;
  std::string::basic_string[abi:ne180100]<0>(v125, "mac_cycle");
  int v126 = 61;
  std::string::basic_string[abi:ne180100]<0>(v127, "nz_count");
  int v128 = 62;
  std::string::basic_string[abi:ne180100]<0>(v129, "kernel_stall");
  int v130 = 63;
  std::string::basic_string[abi:ne180100]<0>(v131, "acc_stall");
  int v132 = 64;
  std::string::basic_string[abi:ne180100]<0>(v133, "pe_cycle");
  int v134 = 65;
  std::string::basic_string[abi:ne180100]<0>(v135, "read_stall");
  int v136 = 66;
  std::string::basic_string[abi:ne180100]<0>(v137, "write_stall");
  int v138 = 67;
  std::unordered_map<std::string,PerfTracerMetric>::unordered_map(a1, v3, 68);
  uint64_t v2 = 2176;
  do
  {
    if ((char)v3[v2 - 9] < 0) {
      operator delete(*(void **)&v3[v2 - 32]);
    }
    v2 -= 32;
  }
  while (v2);
}

void sub_2120A85EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v12 = 2176;
  while (1)
  {
    if (*(char *)(v10 + v12 - 9) < 0) {
      operator delete(*(void **)(v10 + v12 - 32));
    }
    v12 -= 32;
    if (!v12) {
      _Unwind_Resume(exception_object);
    }
  }
}

void sub_2120A8748()
{
}

uint64_t ZinIrCompilerParamsUtils::StringToPerfTracerConfig(uint64_t a1, _DWORD *a2)
{
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__str, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __str = *(std::string *)a1;
  }
  char v3 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int64_t size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  }
  else {
    int64_t size = __str.__r_.__value_.__l.__size_;
  }
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_str = &__str;
  }
  else {
    p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
  }
  if (size >= 1)
  {
    int v6 = (char *)p_str + size;
    CFNumberRef v7 = p_str;
    while (1)
    {
      int v8 = memchr(v7, 58, size);
      if (!v8) {
        goto LABEL_15;
      }
      if (*v8 == 58) {
        break;
      }
      CFNumberRef v7 = (std::string *)(v8 + 1);
      int64_t size = v6 - (unsigned char *)v7;
      if (v6 - (unsigned char *)v7 < 1) {
        goto LABEL_15;
      }
    }
    uint64_t v9 = 0;
    if (v8 == v6) {
      goto LABEL_16;
    }
    std::string::size_type v11 = v8 - (unsigned char *)p_str;
    if (v11 == -1) {
      goto LABEL_16;
    }
    std::string::basic_string(&v48, &__str, 0, v11, (std::allocator<char> *)&__p);
    std::string::basic_string(&__p, &__str, 0, v11, (std::allocator<char> *)&v50);
    uint64_t v9 = StringToPerfTracerCategory((unsigned __int8 *)&__p) & 0xFF00000000;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v9)
    {
      uint64_t v12 = StringToPerfTracerCategory((unsigned __int8 *)&v48);
      if ((v12 & 0xFF00000000) != 0)
      {
        *a2 = v12;
        std::string::size_type v13 = v11 + 1;
        int v14 = &__str;
        std::string::erase(&__str, 0, v13);
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          int64_t v15 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        }
        else {
          int64_t v15 = __str.__r_.__value_.__l.__size_;
        }
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          int v14 = (std::string *)__str.__r_.__value_.__r.__words[0];
        }
        if (v15 >= 1)
        {
          int v16 = (char *)v14 + v15;
          uint64_t v17 = v14;
          do
          {
            int v18 = memchr(v17, 58, v15);
            if (!v18) {
              break;
            }
            if (*v18 == 58)
            {
              if (v18 == v16) {
                break;
              }
              std::string::size_type v27 = v18 - (unsigned char *)v14;
              if (v27 == -1) {
                break;
              }
              std::string::basic_string(&__p, &__str, 0, v27, (std::allocator<char> *)&v50);
              uint64_t v28 = StringToPerfTracerMetric((unsigned __int8 *)&__p);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
              if ((v28 & 0xFF00000000) != 0)
              {
                a2[1] = v28;
                std::string::erase(&__str, 0, v27 + 1);
                uint64_t v29 = StringToPerfTracerMetric((unsigned __int8 *)&__str);
                if ((v29 & 0xFF00000000) != 0)
                {
                  a2[2] = v29;
                  goto LABEL_47;
                }
                BOOL v39 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (v39) {
                  ZinIrCompilerParamsUtils::StringToPerfTracerConfig(v39, v40, v41, v42, v43, v44, v45, v46);
                }
                goto LABEL_50;
              }
              BOOL v31 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              if (!v31) {
                goto LABEL_50;
              }
              goto LABEL_49;
            }
            uint64_t v17 = (std::string *)(v18 + 1);
            int64_t v15 = v16 - (unsigned char *)v17;
          }
          while (v16 - (unsigned char *)v17 >= 1);
        }
        uint64_t v30 = StringToPerfTracerMetric((unsigned __int8 *)&__str);
        if ((v30 & 0xFF00000000) != 0)
        {
          a2[1] = v30;
          a2[2] = 0;
LABEL_47:
          uint64_t v9 = 1;
          goto LABEL_51;
        }
        BOOL v31 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v31) {
LABEL_49:
        }
          ZinIrCompilerParamsUtils::StringToPerfTracerConfig(v31, v32, v33, v34, v35, v36, v37, v38);
      }
      else
      {
        BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v19) {
          ZinIrCompilerParamsUtils::StringToPerfTracerConfig(v19, v20, v21, v22, v23, v24, v25, v26);
        }
      }
LABEL_50:
      uint64_t v9 = 0;
    }
LABEL_51:
    if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v48.__r_.__value_.__l.__data_);
    }
    char v3 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v9 = 0;
LABEL_16:
  if (v3 < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  return v9;
}

void sub_2120A8A20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  _Unwind_Resume(exception_object);
}

uint64_t StringToPerfTracerCategory(unsigned __int8 *a1)
{
  GetStringToPerfTracerCategoryMap((uint64_t)v7);
  uint64_t v2 = std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::find<std::string>(v7, a1);
  if (v2)
  {
    unsigned int v3 = *((_DWORD *)v2 + 10) & 0xFFFFFF00;
    int v4 = *((_DWORD *)v2 + 10);
    uint64_t v5 = 0x100000000;
  }
  else
  {
    uint64_t v5 = 0;
    int v4 = 0;
    unsigned int v3 = 0;
  }
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v7);
  return v5 | v3 | v4;
}

void sub_2120A8AFC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t StringToPerfTracerMetric(unsigned __int8 *a1)
{
  GetStringToPerfTracerMetricMap((uint64_t)v7);
  uint64_t v2 = std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::find<std::string>(v7, a1);
  if (v2)
  {
    unsigned int v3 = *((_DWORD *)v2 + 10) & 0xFFFFFF00;
    int v4 = *((_DWORD *)v2 + 10);
    uint64_t v5 = 0x100000000;
  }
  else
  {
    uint64_t v5 = 0;
    int v4 = 0;
    unsigned int v3 = 0;
  }
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v7);
  return v5 | v3 | v4;
}

void sub_2120A8B88(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void ZinIrCompilerParamsUtils::PerfTracerConfigToString(int *a1@<X0>, std::string *a2@<X8>)
{
  std::string::basic_string[abi:ne180100]<0>(a2, (char *)&unk_2120C31C7);
  ZinIrCompilerParamsUtils::PerfTracerCategoryToString(*a1, &v14);
  ZinIrCompilerParamsUtils::PerfTracerMetricToString(a1[1], &v12);
  ZinIrCompilerParamsUtils::PerfTracerMetricToString(a1[2], &__p);
  if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v4 = &v14;
  }
  else {
    int v4 = (std::string *)v14.__r_.__value_.__r.__words[0];
  }
  if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v14.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v14.__r_.__value_.__l.__size_;
  }
  std::string::append(a2, (const std::string::value_type *)v4, size);
  std::string::append(a2, ":", 1uLL);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v6 = &v12;
  }
  else {
    int v6 = (std::string *)v12.__r_.__value_.__r.__words[0];
  }
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v7 = HIBYTE(v12.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v7 = v12.__r_.__value_.__l.__size_;
  }
  std::string::append(a2, (const std::string::value_type *)v6, v7);
  std::string::append(a2, ":", 1uLL);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v9 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v9 = __p.__r_.__value_.__l.__size_;
  }
  std::string::append(a2, (const std::string::value_type *)p_p, v9);
  if (v11 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v13 && SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  if (v15)
  {
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v14.__r_.__value_.__l.__data_);
    }
  }
}

void sub_2120A8CD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  if (a22 && a21 < 0) {
    operator delete(__p);
  }
  if (*(unsigned char *)(v23 - 24) && *(char *)(v23 - 25) < 0) {
    operator delete(*(void **)(v23 - 48));
  }
  if (*(char *)(v22 + 23) < 0) {
    operator delete(*(void **)v22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ZinIrCompilerParamsUtils::HasValidPerfTracerConfigs(int *a1, int *a2)
{
  uint64_t result = IsValidPerfTracerConfig(a1);
  if (result)
  {
    uint64_t result = IsValidPerfTracerConfig(a2);
    if (result)
    {
      if (*a1) {
        BOOL v5 = *a1 == *a2;
      }
      else {
        BOOL v5 = 0;
      }
      return !v5;
    }
  }
  return result;
}

uint64_t IsValidPerfTracerConfig(int *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v1 = *a1;
  if (!*a1) {
    return 1;
  }
  int v3 = a1[1];
  if (v3) {
    BOOL v4 = v3 == a1[2];
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    return 0;
  }
  std::string::size_type v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  switch(v1)
  {
    case 1:
      uint64_t v19 = 0x2100000020;
      long long v16 = xmmword_2120C2660;
      long long v17 = unk_2120C2670;
      v18[0] = xmmword_2120C2680;
      v18[1] = unk_2120C2690;
      long long __src = xmmword_2120C2620;
      long long v13 = unk_2120C2630;
      long long v14 = xmmword_2120C2640;
      long long v15 = unk_2120C2650;
      std::vector<PerfTracerMetric>::__assign_with_size[abi:ne180100]<PerfTracerMetric const*,PerfTracerMetric const*>((char *)&v9, (char *)&__src, (uint64_t)&v20, 0x22uLL);
      break;
    case 2:
      LODWORD(v18[0]) = 57;
      long long v14 = xmmword_2120C26C8;
      long long v15 = unk_2120C26D8;
      long long v16 = xmmword_2120C26E8;
      long long v17 = unk_2120C26F8;
      long long __src = xmmword_2120C26A8;
      long long v13 = unk_2120C26B8;
      std::vector<PerfTracerMetric>::__assign_with_size[abi:ne180100]<PerfTracerMetric const*,PerfTracerMetric const*>((char *)&v9, (char *)&__src, (uint64_t)v18 + 4, 0x19uLL);
      break;
    case 3:
      LODWORD(v16) = 49;
      long long __src = xmmword_2120C270C;
      long long v13 = unk_2120C271C;
      long long v14 = xmmword_2120C272C;
      long long v15 = unk_2120C273C;
      std::vector<PerfTracerMetric>::__assign_with_size[abi:ne180100]<PerfTracerMetric const*,PerfTracerMetric const*>((char *)&v9, (char *)&__src, (uint64_t)&v16 + 4, 0x11uLL);
      break;
    case 4:
      *(void *)&long long v16 = 0x3B0000003ALL;
      long long __src = xmmword_2120C2750;
      long long v13 = unk_2120C2760;
      long long v14 = xmmword_2120C2770;
      long long v15 = unk_2120C2780;
      std::vector<PerfTracerMetric>::__assign_with_size[abi:ne180100]<PerfTracerMetric const*,PerfTracerMetric const*>((char *)&v9, (char *)&__src, (uint64_t)&v16 + 8, 0x12uLL);
      break;
    case 5:
      long long __src = xmmword_2120C2610;
      std::vector<PerfTracerMetric>::__assign_with_size[abi:ne180100]<PerfTracerMetric const*,PerfTracerMetric const*>((char *)&v9, (char *)&__src, (uint64_t)&v13, 4uLL);
      break;
    default:
      long long __src = xmmword_2120C2798;
      long long v13 = unk_2120C27A8;
      std::vector<PerfTracerMetric>::__assign_with_size[abi:ne180100]<PerfTracerMetric const*,PerfTracerMetric const*>((char *)&v9, (char *)&__src, (uint64_t)&v14, 8uLL);
      break;
  }
  if (v9 == v10) {
    goto LABEL_27;
  }
  int v6 = v9;
  while (*v6 != a1[1])
  {
    if (++v6 == v10)
    {
      int v6 = v10;
      break;
    }
  }
  if (v6 == v10)
  {
LABEL_27:
    BOOL v5 = 0;
    if (!v9) {
      return v5;
    }
LABEL_28:
    uint64_t v10 = v9;
    operator delete(v9);
    return v5;
  }
  std::string::size_type v7 = v9;
  while (*v7 != a1[2])
  {
    if (++v7 == v10)
    {
      std::string::size_type v7 = v10;
      break;
    }
  }
  BOOL v5 = v7 != v10;
  if (v9) {
    goto LABEL_28;
  }
  return v5;
}

void sub_2120A9030(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::unordered_map<std::string,PerfTracerCategory>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,PerfTracerCategory> const&>(a1, a2, (uint64_t)a2);
      a2 += 32;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_2120A90D8(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,PerfTracerCategory> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  std::string::size_type v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    long long v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (unsigned __int8 i = *v13; i; unsigned __int8 i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__construct_node_hash<std::pair<std::string const,PerfTracerCategory> const&>(a1, v9, a3, (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  uint64_t v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    *uint64_t v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  unsigned __int8 i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_2120A9348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PerfTracerCategory>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__construct_node_hash<std::pair<std::string const,PerfTracerCategory> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x30uLL);
  *(void *)(a4 + 8) = v7;
  *(void *)a4 = v8;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((void *)v8 + 4) = *(void *)(a3 + 16);
  }
  *((_DWORD *)v8 + 1pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *(_DWORD *)(a3 + 24);
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_2120A93FC(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PerfTracerCategory>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      uint64_t v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
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
      int v11 = (void *)*v7;
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
            *uint64_t v7 = *v11;
            *int v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    int v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PerfTracerCategory>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::unordered_map<std::string,PerfTracerMetric>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,PerfTracerCategory> const&>(a1, a2, (uint64_t)a2);
      a2 += 32;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_2120A9D04(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    unint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26418E090, MEMORY[0x263F8C060]);
}

void sub_2120A9E18(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::find<std::string>(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  int v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  int v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v6 == v13)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      int v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

char *std::vector<PerfTracerMetric>::__assign_with_size[abi:ne180100]<PerfTracerMetric const*,PerfTracerMetric const*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  unint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62) {
      std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = std::vector<PerfTracerMetric>::__vallocate[abi:ne180100](v7, v11);
    unint64_t v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    unint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      uint64_t v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v12 = (void **)(result + 8);
  BOOL v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  unint64_t v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    unint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    uint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *uint64_t v12 = &v9[v17];
  return result;
}

char *std::vector<PerfTracerMetric>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PerfTracerMetric>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<PerfTracerMetric>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t H11ANEFirmwareWork::RPCFileInfo(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 1 && *(void *)(a2 + 8) == 140) {
    operator new[]();
  }
  return 3;
}

uint64_t H11ANEFirmwareWork::RPCFileRead(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (a3 == 2 && *(void *)(a2 + 8) == 140) {
    operator new[]();
  }
  return 3;
}

uint64_t H11ANEFirmwareWork::RPCFileWrite(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    uint64_t v3 = *(void *)(a2 + 8);
    if (v3 == 140) {
      operator new[]();
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = "RPCFileWrite";
      __int16 v11 = 2048;
      uint64_t v12 = 140;
      __int16 v13 = 2048;
      uint64_t v14 = v3;
      size_t v5 = &_os_log_internal;
      unint64_t v6 = "H11ANE %s: Buffer size does not match expected value (expected %ld, recv %lld)\n";
      uint32_t v7 = 32;
      goto LABEL_8;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "RPCFileWrite";
    __int16 v11 = 1024;
    LODWORD(v12) = a3;
    size_t v5 = &_os_log_internal;
    unint64_t v6 = "H11ANE %s: Number of buffers is not 2 (%d)\n";
    uint32_t v7 = 18;
LABEL_8:
    _os_log_impl(&dword_21209C000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v7);
  }
  return 3;
}

uint64_t H11ANEFirmwareWork::FirmwareRPC(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 32))
  {
    uint64_t v3 = a1;
    unint64_t v4 = 0;
    size_t v5 = (int *)(a2 + 96);
    uint64_t v6 = a2 + 680;
    do
    {
      int v7 = *(v5 - 15);
      switch(v7)
      {
        case 6:
          a1 = H11ANEFirmwareWork::RPCFileWrite(a1, v6, *v5);
          break;
        case 5:
          a1 = H11ANEFirmwareWork::RPCFileRead(a1, v6, *v5);
          break;
        case 4:
          a1 = H11ANEFirmwareWork::RPCFileInfo(a1, v6, *v5);
          break;
        default:
          a1 = 5;
          break;
      }
      *(v5 - 12) = a1;
      ++*(_DWORD *)(v3 + 56);
      ++v4;
      v5 += 16;
      v6 += 240;
    }
    while (v4 < *(unsigned int *)(a2 + 32));
  }
  return 0;
}

void H11ANEFirmwareWork::H11ANEFirmwareWork(H11ANEFirmwareWork *this)
{
  *((_DWORD *)this + 14) = 0;
}

{
  *((_DWORD *)this + 14) = 0;
}

void H11ANE::H11ANEFirmwareWorkProcessor::H11ANEFirmwareWorkProcessor(H11ANE::H11ANEFirmwareWorkProcessor *this, H11ANE::H11ANEDevice *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  *(_DWORD *)this = 0;
  *((void *)this + 27) = 0;
  *((_DWORD *)this + 56) = 0;
  *((void *)this + 29) = 0;
  *((void *)this + 3pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = a2;
  *((void *)this + 33) = 0;
  *((void *)this + 34) = 0x4000000000000000;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 144), 0);
  *((void *)this + 26) = 0;
  pthread_mutexattr_init(&v3);
  pthread_mutexattr_settype(&v3, 2);
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 80), &v3);
  pthread_mutexattr_destroy(&v3);
  mach_timebase_info((mach_timebase_info_t)((char *)this + 252));
  operator new();
}

void sub_2120AA9AC(_Unwind_Exception *a1)
{
  MEMORY[0x21667E660](v1, 0x1020C4077668FA2);
  _Unwind_Resume(a1);
}

void H11ANE::H11ANEFirmwareWorkProcessor::~H11ANEFirmwareWorkProcessor(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  if (*(_DWORD *)this) {
    H11ANE::H11ANEFirmwareWorkProcessor::stopReceive(this);
  }
  if (*((void *)this + 29)) {
    H11ANE::H11ANEFirmwareWorkProcessor::removeIODispatcherFromRunLoop(this);
  }
  uint64_t v2 = (H11ANE::H11ANECFLocalMessagePort *)*((void *)this + 33);
  if (v2)
  {
    pthread_mutexattr_t v3 = (__CFRunLoop *)*((void *)this + 1);
    RunLoopSource = H11ANE::H11ANECFLocalMessagePort::GetRunLoopSource(v2);
    CFRunLoopRemoveSource(v3, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    uint64_t v5 = *((void *)this + 33);
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
    }
    *((void *)this + 33) = 0;
  }
  uint64_t v6 = (H11ANEFirmwareWork *)*((void *)this + 35);
  if (v6)
  {
    H11ANEFirmwareWork::~H11ANEFirmwareWork(v6);
    MEMORY[0x21667E660]();
  }
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 16));
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 80));
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 144));
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::stopReceive(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*(_DWORD *)this)
  {
    H11ANE::H11ANEFirmwareWorkProcessor::stopNoDataTimer(this);
    pthread_mutex_lock((pthread_mutex_t *)((char *)this + 80));
    *((unsigned char *)this + 248) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 80));
    uint64_t v3 = H11ANE::H11ANEDevice::ANE_UnregisterFirmwareWorkProcessor(*((H11ANE::H11ANEDevice **)this + 30), *((_DWORD *)this + 56));
    *((unsigned char *)this + 248) = 0;
    *(_DWORD *)this = 0;
  }
  else
  {
    uint64_t v3 = 3758097122;
  }
  pthread_mutex_unlock(v2);
  return v3;
}

void H11ANE::H11ANEFirmwareWorkProcessor::removeIODispatcherFromRunLoop(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  uint64_t v2 = (__CFRunLoopSource *)*((void *)this + 29);
  if (v2)
  {
    CFRunLoopRemoveSource(*((CFRunLoopRef *)this + 1), v2, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    CFRelease(*((CFTypeRef *)this + 29));
    *((void *)this + 29) = 0;
  }
  uint64_t v3 = (__CFMachPort *)*((void *)this + 27);
  if (v3)
  {
    CFMachPortInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 27));
    *((void *)this + 27) = 0;
  }
  mach_port_name_t v4 = *((_DWORD *)this + 56);
  if (v4)
  {
    mach_port_mod_refs(*MEMORY[0x263EF8960], v4, 1u, -1);
    *((_DWORD *)this + 56) = 0;
  }
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::setupWorkProcessor(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  *((void *)this + 1) = CFRunLoopGetCurrent();
  return H11ANE::H11ANEFirmwareWorkProcessor::addIODispatcherToRunLoop(this);
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::addIODispatcherToRunLoop(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  uint64_t v2 = IOCreateReceivePort(0x39u, (mach_port_t *)this + 56);
  if (!v2)
  {
    uint64_t v2 = 3758097085;
    Boolean shouldFreeInfo = 0;
    context.version = 1;
    context.info = this;
    memset(&context.retain, 0, 24);
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    mach_port_name_t v4 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x263EFFB08], *((_DWORD *)this + 56), MEMORY[0x263F0EBE0], &context, &shouldFreeInfo);
    *((void *)this + 27) = v4;
    if (v4)
    {
      RunLoopSource = CFMachPortCreateRunLoopSource(v3, v4, 0);
      *((void *)this + 29) = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopAddSource(*((CFRunLoopRef *)this + 1), RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
        return 0;
      }
    }
  }
  return v2;
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::startReceive(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  puts("H11ANEFirmwareWorkProcessor::startReceive");
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*(_DWORD *)this == 1)
  {
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
    return 3758097122;
  }
  else
  {
    *((unsigned char *)this + 248) = 0;
    *(_DWORD *)this = 1;
    inputStruct[0] = H11ANE::H11ANEFirmwareWorkProcessor::WorkReady;
    inputStruct[1] = this;
    int v6 = *((_DWORD *)this + 56);
    uint64_t v3 = H11ANE::H11ANEDevice::ANE_RegisterFirmwareWorkProcessor(*((void *)this + 30), inputStruct);
    pthread_mutex_unlock(v2);
  }
  return v3;
}

void H11ANE::H11ANEFirmwareWorkProcessor::WorkReady(H11ANE::H11ANEFirmwareWorkProcessor *this, void *a2, int a3, unint64_t *a4)
{
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::stopNoDataTimer(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 144);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 144));
  uint64_t v3 = (__CFRunLoopTimer *)*((void *)this + 26);
  if (v3)
  {
    CFRunLoopTimerInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 26));
    *((void *)this + 26) = 0;
  }
  return pthread_mutex_unlock(v2);
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::tickleNoDataTimer(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 144);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 144));
  uint64_t v3 = (__CFRunLoopTimer *)*((void *)this + 26);
  if (v3)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(v3, Current + *((double *)this + 34));
  }
  return pthread_mutex_unlock(v2);
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::startNoDataTimer(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 144);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 144));
  uint64_t v3 = (__CFRunLoopTimer *)*((void *)this + 26);
  if (v3)
  {
    CFRunLoopTimerInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 26));
    *((void *)this + 26) = 0;
  }
  context.version = 0;
  context.info = this;
  memset(&context.retain, 0, 24);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v5 = CFRunLoopTimerCreate(0, Current + *((double *)this + 34), 0.0, 0, 0, (CFRunLoopTimerCallBack)H11ANE::H11ANEFirmwareWorkProcessor::NoDataTimeout, &context);
  *((void *)this + 26) = v5;
  if (v5) {
    CFRunLoopAddTimer(*((CFRunLoopRef *)this + 1), v5, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  }
  return pthread_mutex_unlock(v2);
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::SetFrameDoneTimeoutDuration(H11ANE::H11ANEFirmwareWorkProcessor *this, double a2)
{
  if (a2 < 2.0) {
    a2 = 2.0;
  }
  *((double *)this + 34) = a2;
  H11ANE::H11ANEFirmwareWorkProcessor::tickleNoDataTimer(this);
  return 0;
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::FlushSurfaceCache(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  H11ANE::H11ANEDevice::ANE_ReleaseFirmwareWorkProcessorBuffers(*((H11ANE::H11ANEDevice **)this + 30), *((_DWORD *)this + 56));
  pthread_mutex_unlock(v2);
  return 0;
}

uint64_t H11ANE::CreateH11ANEFirmwareWorkProcessor(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  pthread_t v9 = 0;
  H11ANE::H11ANEThreadReadySyncer::H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)&v11);
  uint64_t v2 = *(void *)(a1 + 8);
  v10[0] = 0;
  v10[1] = v2;
  v10[2] = &v11;
  int v3 = pthread_attr_init(&v12);
  if (v3)
  {
    printf("pthread_attr_init() failed. Error: %d\n", v3);
    goto LABEL_12;
  }
  sched_param v8 = (sched_param)47;
  if (pthread_attr_setschedparam(&v12, &v8))
  {
    printf("pthread_attr_setschedparam() failed. Error: %d\n");
LABEL_9:
    int v4 = 0;
    goto LABEL_10;
  }
  if (pthread_attr_setdetachstate(&v12, 2))
  {
    printf("pthread_attr_setdetachstate() failed. Error: %d\n");
    goto LABEL_9;
  }
  if (pthread_create(&v9, &v12, (void *(__cdecl *)(void *))H11ANE::H11ANEFirmwareWorkProcessorThreadStart, v10))
  {
    printf("pthread_create() failed. Error: %d\n");
    goto LABEL_9;
  }
  int v4 = 1;
LABEL_10:
  pthread_attr_destroy(&v12);
  if (v4)
  {
    H11ANE::H11ANEThreadReadySyncer::wait(&v11);
    char v5 = 1;
    goto LABEL_13;
  }
LABEL_12:
  char v5 = 0;
LABEL_13:
  **(void **)a1 = v10[0];
  if ((v5 & (v10[0] != 0)) != 0) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 3758097084;
  }
  H11ANE::H11ANEThreadReadySyncer::~H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)&v11);
  return v6;
}

void sub_2120AB1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  H11ANE::H11ANEThreadReadySyncer::~H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)va);
  _Unwind_Resume(a1);
}

void H11ANE::H11ANEFirmwareWorkProcessorThreadStart(uint64_t a1)
{
}

void sub_2120AB28C(_Unwind_Exception *a1)
{
  MEMORY[0x21667E660](v1, 0x1020C40093FD29CLL);
  _Unwind_Resume(a1);
}

uint64_t H11ANE::DestroyH11ANEFirmwareWorkProcessor(H11ANE *this, H11ANE::H11ANEFirmwareWorkProcessor *a2)
{
  int v3 = (void *)*((void *)this + 1);
  CFRetain(v3);
  H11ANE::H11ANEFirmwareWorkProcessor::~H11ANEFirmwareWorkProcessor(this);
  MEMORY[0x21667E660]();
  CFRunLoopStop((CFRunLoopRef)v3);
  CFRelease(v3);
  return 0;
}

double H11ANEMetrics::AddSample(H11ANEMetrics *this, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = *(void *)this;
  double result = 0.0;
  if (a2 - 1 < a3 && v3 != 0)
  {
    uint64_t v6 = *((unsigned int *)this + 4);
    *(void *)(v3 + 8 * v6) = a3 - a2;
    unsigned int v8 = *((_DWORD *)this + 2);
    unsigned int v7 = *((_DWORD *)this + 3);
    *((_DWORD *)this + 4) = ((int)v6 + 1) % v8;
    if (v7 < v8) {
      *((_DWORD *)this + 3) = v7 + 1;
    }
    return (double)((a3 - a2) * *((unsigned int *)this + 8) / *((unsigned int *)this + 9)) / 1000000.0;
  }
  return result;
}

void *H11ANEMetrics::StartTimer(void *this)
{
  if (*this)
  {
    uint64_t v1 = this;
    if (!this[3])
    {
      this = (void *)mach_absolute_time();
      v1[3] = this;
    }
  }
  return this;
}

double H11ANEMetrics::StopTimer(H11ANEMetrics *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (!v1) {
    return 0.0;
  }
  uint64_t v3 = mach_absolute_time();
  double result = H11ANEMetrics::AddSample(this, v1, v3);
  *((void *)this + 3) = 0;
  return result;
}

double H11ANEMetrics::GetMetricsSummary(_DWORD *a1, uint64_t a2)
{
  if (a2)
  {
    *(void *)(a2 + 48) = 0;
    double result = 0.0;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
    int v4 = a1[2];
    int v3 = a1[3];
    *(_DWORD *)a2 = v3;
    *(_DWORD *)(a2 + 4) = v4;
    *(_DWORD *)(a2 + 8) = a1[4];
    if (v3) {
      operator new[]();
    }
  }
  return result;
}

void H11ANEMetrics::PrintMetricsSummary(H11ANEMetrics *this)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  H11ANEMetrics::GetMetricsSummary(this, (uint64_t)v1);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timespec buf = 67109120;
    LODWORD(v8) = v1[0];
    _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " Number of samples: %d", buf, 8u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timespec buf = 67109120;
    LODWORD(v8) = v1[1];
    _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " Maximum samples:   %d", buf, 8u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timespec buf = 134217984;
    uint64_t v8 = v2;
    _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " Minimum time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timespec buf = 134217984;
    uint64_t v8 = v3;
    _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " Maximum time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timespec buf = 134217984;
    uint64_t v8 = v4;
    _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " Average time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timespec buf = 134217984;
    uint64_t v8 = v5;
    _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " Median time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timespec buf = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " Standard deviation (ms): %.3f", buf, 0xCu);
  }
}

uint64_t H11ANEMetrics::ClearSamples(uint64_t this)
{
  *(_DWORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

void H11ANEMetrics::H11ANEMetrics(H11ANEMetrics *this, int a2)
{
  *((_DWORD *)this + 3) = 0;
  *((_DWORD *)this + 4) = 0;
  *((_DWORD *)this + 2) = a2;
  *((void *)this + 3) = 0;
  operator new[]();
}

{
  *((_DWORD *)this + 3) = 0;
  *((_DWORD *)this + 4) = 0;
  *((_DWORD *)this + 2) = a2;
  *((void *)this + 3) = 0;
  operator new[]();
}

void H11ANEMetrics::~H11ANEMetrics(H11ANEMetrics *this)
{
  uint64_t v1 = *(void *)this;
  if (v1) {
    MEMORY[0x21667E640](v1, 0x1000C8000313F17);
  }
}

{
  uint64_t v1;

  uint64_t v1 = *(void *)this;
  if (v1) {
    MEMORY[0x21667E640](v1, 0x1000C8000313F17);
  }
}

uint64_t H11ANEDeviceUpdateParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v12) {
      H11ANEDeviceUpdateParameters_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    return 2;
  }
  if (*(_DWORD *)(v2 + 32) != 1)
  {
    if (!a2) {
      return 0;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      H11ANEDeviceUpdateParameters_cold_3();
    }
    return 2;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    H11ANEDeviceUpdateParameters_cold_2(a2, v4, v5, v6, v7, v8, v9, v10);
  }
  return 20;
}

uint64_t H11ANEDeviceClose(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v19) {
      H11ANEDeviceClose_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    return 8;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    BOOL v27 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v27) {
      H11ANEDeviceClose_cold_2(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    return 2;
  }
  uint64_t v3 = *(H11ANE::H11ANEDevice **)(v2 + 8);
  if (!v3)
  {
    BOOL v35 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v35) {
      H11ANEDeviceClose_cold_3(v35, v36, v37, v38, v39, v40, v41, v42);
    }
    return 8;
  }
  uint64_t v4 = *(pthread_t **)v2;
  if (*(void *)v2)
  {
    uint64_t v5 = *(H11ANE::H11ANEFrameReceiver **)(v2 + 96);
    uint64_t v6 = pthread_self();
    uint64_t v7 = (H11ANE *)pthread_equal(v6, v4[8]);
    if (v7)
    {
      uint64_t v8 = (H11ANE *)H11ANE::H11ANEIsDelayedCloseFlagSet(v7);
      LOBYTE(v51) = (_BYTE)v8;
      if (!(_BYTE)v8)
      {
        H11ANE::H11ANESetCurrentThreadAsTerminating(a1);
        return 0;
      }
      H11ANE::H11ANEAckCloseRequest(v8);
    }
    if (*(_DWORD *)(v2 + 32) == 1 && v5 == 0) {
      return 11;
    }
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2404);
    pthread_mutex_t v11 = +[ANEServicesLog handle];
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      BOOL v12 = v11;
      if (os_signpost_enabled(v11))
      {
        int v51 = 134217984;
        uint64_t v52 = a1;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ServicesDeviceClose", "deviceID=%llx", (uint8_t *)&v51, 0xCu);
      }
    }
    if (*(_DWORD *)(v2 + 32) == 1)
    {
      H11ANE::H11ANEFrameReceiver::completeAllRequests(v5);
      H11ANE::DestroyH11ANEFrameReceiver(v5, v13);
      *(void *)(v2 + 96) = 0;
      uint64_t v14 = *(H11ANE::H11ANEFrameReceiverBufferPool **)(v2 + 112);
      if (v14)
      {
        H11ANE::H11ANEFrameReceiverBufferPool::~H11ANEFrameReceiverBufferPool(v14);
        MEMORY[0x21667E660]();
      }
    }
    H11ANE::H11ANEDevice::H11ANEDeviceClose(v3);
    H11ANE::DestroyH11ANEDeviceController((H11ANE *)v4, v15);
    MEMORY[0x21667E660](v2, 0x10E0C40B462FC6BLL);
    uint64_t v16 = +[ANEServicesLog handle];
    if (v10 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      return 0;
    }
    uint64_t v17 = v16;
    uint64_t result = os_signpost_enabled(v16);
    if (result)
    {
      int v51 = 134217984;
      uint64_t v52 = a1;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v17, OS_SIGNPOST_INTERVAL_END, v10, "ServicesDeviceClose", "deviceID=%llx", (uint8_t *)&v51, 0xCu);
      return 0;
    }
  }
  else
  {
    BOOL v43 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v43) {
      H11ANEDeviceClose_cold_4(v43, v44, v45, v46, v47, v48, v49, v50);
    }
    return 7;
  }
  return result;
}

uint64_t H11ANEProgramChainingPrepare()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v2 = 2;
  if (!v0) {
    return v2;
  }
  uint64_t v3 = v1;
  if (!v1) {
    return v2;
  }
  uint64_t v4 = v0;
  uint64_t v5 = *(_DWORD **)(v0 + 8);
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)v5 + 16);
    uint64_t v7 = *(void *)(v6 + 8);
    if (v7)
    {
      if (*(_DWORD *)(v6 + 32) == 1)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)timespec buf = 136315394;
          uint64_t v45 = "H11ANEProgramChainingPrepare";
          __int16 v46 = 1024;
          *(_DWORD *)uint64_t v47 = 1;
          _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR: %s: Cannot call this API with deviceUsageType=%d\n", buf, 0x12u);
        }
        return 20;
      }
      int v8 = *(_DWORD *)(v1 + 44);
      if (v8 >= 8)
      {
        int v8 = 7;
        *(_DWORD *)(v1 + 44) = 7;
      }
      if (*(void *)v1)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)timespec buf = 136315138;
          uint64_t v45 = "H11ANEProgramChainingPrepare";
          _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR: %s: cacheHandle is not 0\n", buf, 0xCu);
        }
        goto LABEL_27;
      }
      unsigned int v9 = *(_DWORD *)(v1 + 48);
      if (v9 > 0x100 || *(_DWORD *)(v1 + 8248) > 0xFFu || *(_DWORD *)(v1 + 14376) >= 0xDu)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
LABEL_26:
          uint64_t v2 = 2;
LABEL_27:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)timespec buf = 136315138;
            uint64_t v45 = "H11ANEProgramChainingPrepare";
            _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s failed\n", buf, 0xCu);
          }
          return v2;
        }
        int v10 = *(_DWORD *)(v3 + 8248);
        int v11 = *(_DWORD *)(v3 + 14376);
        *(_DWORD *)timespec buf = 136315906;
        uint64_t v45 = "H11ANEProgramChainingPrepare";
        __int16 v46 = 1024;
        *(_DWORD *)uint64_t v47 = v9;
        *(_WORD *)&v47[4] = 1024;
        *(_DWORD *)&v47[6] = v10;
        LOWORD(v48[0]) = 1024;
        *(_DWORD *)((char *)v48 + 2) = v11;
        BOOL v12 = &_os_log_internal;
        uint64_t v13 = "ERROR: %s: exceed max limit: %d, %d, %d \n";
        uint64_t v14 = buf;
        uint32_t v15 = 30;
LABEL_25:
        _os_log_impl(&dword_21209C000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, v15);
        goto LABEL_26;
      }
      bzero(buf, 0xAE28uLL);
      *(void *)&v47[2] = *(void *)(v3 + 16);
      v48[0] = *(_DWORD *)(v3 + 24);
      int v50 = v8;
      uint64_t v49 = *(void *)(v3 + 32);
      *(void *)&v58[28596] = *(void *)(v4 + 160);
      int v59 = *(_DWORD *)(v4 + 168);
      if (!v9) {
        goto LABEL_58;
      }
      unint64_t v17 = 0;
      int v18 = 0;
      id v19 = 0;
      int v20 = 0;
      uint64_t v21 = v3 + 56;
      do
      {
        int v22 = *(_DWORD *)(v21 + 16);
        if (v22 == 5)
        {
          int v23 = [*(id *)v21 eventPort];
          uint64_t v24 = &buf[48 * v20];
          *((_DWORD *)v24 + 16) = v23;
          *((void *)v24 + 11) = *(void *)v21;
          *((_DWORD *)v24 + 2pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *(_DWORD *)(v21 + 20);
          ++v20;
        }
        else if (v22 == 4 && v19 == 0)
        {
          id v19 = *(id *)v21;
          int v18 = [*(id *)v21 eventPort];
        }
        ++v17;
        v21 += 32;
      }
      while (v17 < *(unsigned int *)(v3 + 48));
      id v54 = v19;
      v53[576] = v18;
      int v51 = v20;
      if (!v19)
      {
LABEL_58:
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        *(_DWORD *)BOOL v43 = 136315138;
        *(void *)&v43[4] = "H11ANEProgramChainingPrepare";
        BOOL v12 = &_os_log_internal;
        uint64_t v13 = "ERROR: %s: no output set free event in the chaing prepare\n";
        uint64_t v14 = v43;
        uint32_t v15 = 12;
        goto LABEL_25;
      }
      if (*(_DWORD *)(v3 + 8248))
      {
        unint64_t v26 = 0;
        BOOL v27 = (_DWORD *)(v3 + 8268);
        uint64_t v28 = v53;
        do
        {
          *uint64_t v28 = *v27;
          v28[320] = IOSurfaceGetID(*(IOSurfaceRef *)(v27 - 3));
          *((unsigned char *)&v53[256] + v26++) = *(v27 - 1);
          v27 += 6;
          ++v28;
        }
        while (v26 < *(unsigned int *)(v3 + 8248));
      }
      if (*(_DWORD *)(v3 + 14376))
      {
        unint64_t v29 = 0;
        uint64_t v30 = (IOSurfaceRef *)(v3 + 14408);
        uint64_t v31 = v58;
        uint64_t v32 = &v57;
        while (1)
        {
          uint64_t v33 = v3 + 6160 * v29;
          *(_DWORD *)&v56[2320 * v29 + 8] = *(_DWORD *)(v33 + 14392);
          uint64_t v34 = *(__IOSurface **)(v33 + 14384);
          if (v34) {
            *(_DWORD *)&v56[2320 * v29] = IOSurfaceGetID(v34);
          }
          if (v5[879])
          {
            int v35 = v5[878];
            if (v35) {
              *(_DWORD *)&v56[2320 * v29 + 4] = v35;
            }
          }
          uint64_t v36 = (unsigned int *)(v33 + 14392);
          int v37 = *v36;
          if (*v36 > 0x100) {
            break;
          }
          if (v37)
          {
            unint64_t v38 = 0;
            uint64_t v39 = v30;
            do
            {
              *(_DWORD *)&v31[4 * v38] = IOSurfaceGetID(*(v39 - 1));
              int v40 = *(_DWORD *)v39;
              v39 += 3;
              *((unsigned char *)v32 + v38++) = v40;
            }
            while (v38 < *v36);
          }
          ++v29;
          v30 += 770;
          v31 += 2320;
          v32 += 580;
          if (v29 >= *(unsigned int *)(v3 + 14376)) {
            goto LABEL_57;
          }
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)BOOL v43 = 136315394;
          *(void *)&v43[4] = "H11ANEProgramChainingPrepare";
          *(_WORD *)&v43[12] = 1024;
          *(_DWORD *)&v43[14] = v37;
          _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR: %s: exceed max outputs/set limit: %d\n", v43, 0x12u);
        }
        uint64_t v2 = 2;
      }
      else
      {
LABEL_57:
        uint64_t v2 = 0;
      }
      int v41 = H11ANE::H11ANEDevice::ANE_ProgramChainingPrepare(v7, (uint64_t)buf, v43);
      if (v41)
      {
        int v42 = v41;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          H11ANEProgramPrepare_cold_4();
        }
        uint64_t v2 = IOReturnToANEReturn(v42);
      }
      else
      {
        *(_OWORD *)uint64_t v3 = *(_OWORD *)v43;
      }
      if (v2) {
        goto LABEL_27;
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)timespec buf = 136315138;
        uint64_t v45 = "H11ANEProgramChainingPrepare";
        _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR: %s: pH11ANEDevice is NULL\n", buf, 0xCu);
      }
      return 8;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)timespec buf = 136315138;
      uint64_t v45 = "H11ANEProgramChainingPrepare";
      _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR: %s: pANEProgramInstancePriv is NULL\n", buf, 0xCu);
    }
    return 1;
  }
  return v2;
}

uint64_t H11ANEProgramOutputSetEnqueue(uint64_t a1, uint64_t *a2)
{
  if (a1 && a2)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 16) + 8);
    if (v2)
    {
      uint64_t v15 = *a2;
      uint64_t v16 = a2[1];
      uint64_t v17 = a2[2];
      __int16 v18 = *((_WORD *)a2 + 12);
      int v3 = H11ANE::H11ANEDevice::ANE_ProgramOutputSetEnqueue(v2, inputStruct);
      if (v3 <= -536870185)
      {
        switch(v3)
        {
          case -536870211:
            return 1;
          case -536870210:
            return 5;
          case -536870209:
          case -536870208:
          case -536870205:
          case -536870204:
          case -536870203:
          case -536870202:
            goto LABEL_19;
          case -536870207:
            return 20;
          case -536870206:
            return 2;
          case -536870201:
            return 24;
          default:
            if (v3 == -536870191)
            {
              uint64_t result = 19;
            }
            else if (v3 == -536870186)
            {
              uint64_t result = 15;
            }
            else
            {
LABEL_19:
              uint64_t result = 18;
            }
            break;
        }
      }
      else
      {
        int v4 = v3 + 536870176;
        uint64_t result = 4;
        switch(v4)
        {
          case 0:
            uint64_t result = 26;
            break;
          case 2:
            uint64_t result = 23;
            break;
          case 3:
            uint64_t result = 10;
            break;
          case 7:
            uint64_t result = 29;
            break;
          case 11:
            uint64_t result = 21;
            break;
          case 13:
            uint64_t result = 27;
            break;
          case 14:
            uint64_t result = 28;
            break;
          case 16:
            return result;
          default:
            goto LABEL_19;
        }
      }
    }
    else
    {
      BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v6) {
        H11ANEProgramOutputSetEnqueue_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
      }
      return 8;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      H11ANEProgramOutputSetEnqueue_cold_2();
    }
    return 2;
  }
  return result;
}

uint64_t H11ANEProgramInputsReady(uint64_t a1, uint64_t *a2)
{
  if (a1 && a2)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 16) + 8);
    if (v2)
    {
      uint64_t v17 = *a2;
      uint64_t v3 = *((unsigned int *)a2 + 3);
      int v18 = *((_DWORD *)a2 + 2);
      int v19 = v3;
      uint64_t v21 = a2[385];
      if (v3)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          v20[i] = *((_DWORD *)a2 + i + 4);
          *(void *)&v20[2 * i + 256] = a2[i + 130];
        }
      }
      int v5 = H11ANE::H11ANEDevice::ANE_ProgramInputsReady(v2, inputStruct);
      if (v5 <= -536870185)
      {
        switch(v5)
        {
          case -536870211:
            return 1;
          case -536870210:
            return 5;
          case -536870209:
          case -536870208:
          case -536870205:
          case -536870204:
          case -536870203:
          case -536870202:
            goto LABEL_22;
          case -536870207:
            return 20;
          case -536870206:
            return 2;
          case -536870201:
            return 24;
          default:
            if (v5 == -536870191)
            {
              uint64_t result = 19;
            }
            else if (v5 == -536870186)
            {
              uint64_t result = 15;
            }
            else
            {
LABEL_22:
              uint64_t result = 18;
            }
            break;
        }
      }
      else
      {
        int v6 = v5 + 536870176;
        uint64_t result = 4;
        switch(v6)
        {
          case 0:
            uint64_t result = 26;
            break;
          case 2:
            uint64_t result = 23;
            break;
          case 3:
            uint64_t result = 10;
            break;
          case 7:
            uint64_t result = 29;
            break;
          case 11:
            uint64_t result = 21;
            break;
          case 13:
            uint64_t result = 27;
            break;
          case 14:
            uint64_t result = 28;
            break;
          case 16:
            return result;
          default:
            goto LABEL_22;
        }
      }
    }
    else
    {
      BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v8) {
        H11ANEProgramInputsReady_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      }
      return 8;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      H11ANEProgramInputsReady_cold_2();
    }
    return 2;
  }
  return result;
}

uint64_t H11ANEProgramStop(void *a1, int a2, int a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (a1) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 2;
  }
  if (a1 && a2)
  {
    int v5 = (void *)a1[1];
    uint64_t v6 = *(void *)(*v5 + 16);
    uint64_t v7 = *(void *)(v6 + 8);
    if (v7)
    {
      if (*(_DWORD *)(v6 + 32) == 1)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          H11ANEProgramStop_cold_2();
        }
        return 20;
      }
      else
      {
        os_signpost_id_t v17 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2424);
        int v18 = +[ANEServicesLog handle];
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          int v19 = v18;
          if (os_signpost_enabled(v18))
          {
            uint64_t v20 = a1[14];
            *(_DWORD *)timespec buf = 134218496;
            *(void *)&uint8_t buf[4] = v20;
            __int16 v33 = 1024;
            int v34 = 1;
            __int16 v35 = 1024;
            int v36 = a3;
            _os_signpost_emit_with_name_impl(&dword_21209C000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "ServicesProgramStop", "progHandle=%llx blocking=%d forceStop=%d", buf, 0x18u);
          }
        }
        *(void *)timespec buf = v5[437];
        buf[11] = a3;
        int v21 = H11ANE::H11ANEDevice::ANE_ProgramUnprepare(v7, (uint64_t *)buf);
        if (v21 <= -536870185)
        {
          switch(v21)
          {
            case -536870211:
              uint64_t v3 = 1;
              break;
            case -536870210:
              uint64_t v3 = 5;
              break;
            case -536870209:
            case -536870208:
            case -536870205:
            case -536870204:
            case -536870203:
            case -536870202:
              goto LABEL_32;
            case -536870207:
              uint64_t v3 = 20;
              break;
            case -536870206:
              uint64_t v3 = 2;
              break;
            case -536870201:
              uint64_t v3 = 24;
              break;
            default:
              if (v21 == -536870191)
              {
                uint64_t v3 = 19;
              }
              else if (v21 == -536870186)
              {
                uint64_t v3 = 15;
              }
              else
              {
LABEL_32:
                uint64_t v3 = 18;
              }
              break;
          }
LABEL_41:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            H11ANEProgramStop_cold_3();
          }
        }
        else
        {
          uint64_t v3 = 4;
          switch(v21)
          {
            case -536870176:
              uint64_t v3 = 26;
              goto LABEL_41;
            case -536870175:
            case -536870172:
            case -536870171:
            case -536870170:
            case -536870168:
            case -536870167:
            case -536870166:
            case -536870164:
            case -536870161:
              goto LABEL_32;
            case -536870174:
              uint64_t v3 = 23;
              goto LABEL_41;
            case -536870173:
              uint64_t v3 = 10;
              goto LABEL_41;
            case -536870169:
              uint64_t v3 = 29;
              goto LABEL_41;
            case -536870165:
              uint64_t v3 = 21;
              goto LABEL_41;
            case -536870163:
              uint64_t v3 = 27;
              goto LABEL_41;
            case -536870162:
              uint64_t v3 = 28;
              goto LABEL_41;
            case -536870160:
              goto LABEL_41;
            default:
              if (v21 == -536870184)
              {
                uint64_t v3 = 22;
                goto LABEL_41;
              }
              if (v21) {
                goto LABEL_32;
              }
              uint64_t v3 = 0;
              a1[19] = 0;
              break;
          }
        }
        int v22 = +[ANEServicesLog handle];
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          int v23 = v22;
          if (os_signpost_enabled(v22))
          {
            uint64_t v24 = a1[14];
            int v26 = 134218496;
            uint64_t v27 = v24;
            __int16 v28 = 1024;
            int v29 = 1;
            __int16 v30 = 1024;
            int v31 = a3;
            _os_signpost_emit_with_name_impl(&dword_21209C000, v23, OS_SIGNPOST_INTERVAL_END, v17, "ServicesProgramStop", "progHandle=%llx blocking=%d forceStop=%d", (uint8_t *)&v26, 0x18u);
          }
        }
      }
    }
    else
    {
      BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v8) {
        H11ANEProgramStop_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      }
      return 8;
    }
  }
  return v3;
}

uint64_t H11ANEProgramDestroy(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 2;
  }
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void *)(*v2 + 16);
  uint64_t v4 = *(void *)(v3 + 8);
  if (v4)
  {
    if (*(_DWORD *)(v3 + 32) == 1)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        H11ANEProgramDestroy_cold_2();
      }
      return 20;
    }
    if (v2[435])
    {
      BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v14) {
        H11ANEProgramDestroy_cold_3(v14, v15, v16, v17, v18, v19, v20, v21);
      }
      return 2;
    }
    os_signpost_id_t v23 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2428);
    uint64_t v24 = +[ANEServicesLog handle];
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v25 = v24;
      if (os_signpost_enabled(v24))
      {
        uint64_t v26 = *(void *)(a1 + 112);
        *(_DWORD *)timespec buf = 134217984;
        *(void *)&uint8_t buf[4] = v26;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "ServicesProgramDestroy", "progHandle=%llx", buf, 0xCu);
      }
    }
    *(void *)timespec buf = v2[437];
    int v27 = H11ANE::H11ANEDevice::ANE_ProgramDestroy(v4, (uint64_t *)buf);
    if (v27 <= -536870185)
    {
      switch(v27)
      {
        case -536870211:
          uint64_t v5 = 1;
          break;
        case -536870210:
          uint64_t v5 = 5;
          break;
        case -536870209:
        case -536870208:
        case -536870205:
        case -536870204:
        case -536870203:
        case -536870202:
          goto LABEL_33;
        case -536870207:
          uint64_t v5 = 20;
          break;
        case -536870206:
          uint64_t v5 = 2;
          break;
        case -536870201:
          uint64_t v5 = 24;
          break;
        default:
          if (v27 == -536870191)
          {
            uint64_t v5 = 19;
          }
          else if (v27 == -536870186)
          {
            uint64_t v5 = 15;
          }
          else
          {
LABEL_33:
            uint64_t v5 = 18;
          }
          break;
      }
    }
    else
    {
      uint64_t v5 = 4;
      switch(v27)
      {
        case -536870176:
          uint64_t v5 = 26;
          break;
        case -536870175:
        case -536870172:
        case -536870171:
        case -536870170:
        case -536870168:
        case -536870167:
        case -536870166:
        case -536870164:
        case -536870161:
          goto LABEL_33;
        case -536870174:
          uint64_t v5 = 23;
          break;
        case -536870173:
          uint64_t v5 = 10;
          break;
        case -536870169:
          uint64_t v5 = 29;
          break;
        case -536870165:
          uint64_t v5 = 21;
          break;
        case -536870163:
          uint64_t v5 = 27;
          break;
        case -536870162:
          uint64_t v5 = 28;
          break;
        case -536870160:
          break;
        default:
          if (v27 == -536870184)
          {
            uint64_t v5 = 22;
          }
          else
          {
            if (v27) {
              goto LABEL_33;
            }
            uint64_t v5 = 0;
          }
          break;
      }
    }
    MEMORY[0x21667E660](v2, 0x10A0C404DBAFFD9);
    *(unsigned char *)(a1 + 72) = 0;
    *(unsigned char *)(a1 + 32) = 0;
    *(unsigned char *)(a1 + 96) = 0;
    *(unsigned char *)(a1 + 144) = 0;
    uint64_t v28 = *(void *)(a1 + 40);
    if (v28) {
      MEMORY[0x21667E640](v28, 0x1000C8077774924);
    }
    uint64_t v29 = *(void *)(a1 + 48);
    if (v29) {
      MEMORY[0x21667E640](v29, 0x1000C8000313F17);
    }
    uint64_t v30 = *(void *)(a1 + 80);
    if (v30) {
      MEMORY[0x21667E640](v30, 0x1000C8077774924);
    }
    uint64_t v31 = *(void *)(a1 + 88);
    if (v31) {
      MEMORY[0x21667E640](v31, 0x1000C8000313F17);
    }
    uint64_t v32 = *(void *)(a1 + 104);
    if (v32) {
      MEMORY[0x21667E640](v32, 0x1000C80669DE214);
    }
    uint64_t v33 = *(void *)(a1 + 56);
    if (v33) {
      MEMORY[0x21667E640](v33, 0x1000C802D139ED7);
    }
    uint64_t v34 = *(void *)(a1 + 64);
    if (v34) {
      MEMORY[0x21667E640](v34, 0x1000C802D139ED7);
    }
    __int16 v35 = +[ANEServicesLog handle];
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      int v36 = v35;
      if (os_signpost_enabled(v35))
      {
        uint64_t v37 = *(void *)(a1 + 112);
        int v38 = 134217984;
        uint64_t v39 = v37;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v36, OS_SIGNPOST_INTERVAL_END, v23, "ServicesProgramDestroy", "progHandle=%llx", (uint8_t *)&v38, 0xCu);
      }
    }
    MEMORY[0x21667E660](a1, 0x10F0C40E57AA126);
  }
  else
  {
    BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v6) {
      H11ANEProgramDestroy_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    return 8;
  }
  return v5;
}

uint64_t H11ANEProgramProcessRequestDirect(uint64_t a1, int *a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (!a1 || !a2 || !a3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      H11ANEProgramProcessRequestDirect_cold_7();
    }
    return 2;
  }
  uint64_t v5 = *(void *)(a1 + 16);
  if (*(void *)(v5 + 8))
  {
    uint64_t v6 = *(void *)(v5 + 96);
    if (v6)
    {
      if (a2[1] <= 0xFF && a2[1532] < 0x100)
      {
        if (!a4 || *a4 <= 0x40u && a4[1] < 0x41u)
        {
          unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(v6 + 416), 1uLL);
          os_signpost_id_t v25 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2414);
          uint64_t v26 = +[ANEServicesLog handle];
          if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            int v27 = v26;
            if (os_signpost_enabled(v26))
            {
              uint64_t v28 = *((void *)a2 + 1536);
              int v29 = *a2;
              *(_DWORD *)timespec buf = 134218496;
              uint64_t v32 = v28;
              __int16 v33 = 1024;
              int v34 = v29;
              __int16 v35 = 2048;
              unint64_t v36 = add;
              _os_signpost_emit_with_name_impl(&dword_21209C000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "ServicesProcessRequestDirect", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
            }
          }
          operator new();
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          H11ANEProgramProcessRequestDirect_cold_6();
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        H11ANEProgramProcessRequestDirect_cold_3();
      }
      return 2;
    }
    BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v16) {
      H11ANEProgramProcessRequestDirect_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    return 11;
  }
  else
  {
    BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v8) {
      H11ANEProgramProcessRequestDirect_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    return 8;
  }
}

uint64_t H11ANEProgramCompleteAllRequests()
{
  return 24;
}

uint64_t H11ANEProgramCancelAllRequests(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 2;
  }
  uint64_t v2 = *(void **)(a1 + 8);
  if (!v2[435]) {
    return 11;
  }
  uint64_t v3 = *(H11ANE::H11ANEDevice **)(*(void *)(*v2 + 16) + 8);
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2430);
  uint64_t v5 = +[ANEServicesLog handle];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v6 = v5;
    if (os_signpost_enabled(v5))
    {
      uint64_t v7 = *(void *)(a1 + 112);
      int v13 = 134217984;
      uint64_t v14 = v7;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ServicesProgramCancelAllRequests", "progHandle=%llx", (uint8_t *)&v13, 0xCu);
    }
  }
  int v8 = H11ANE::H11ANEDevice::ANE_CancelAllRequests(v3);
  uint64_t v9 = +[ANEServicesLog handle];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v10 = v9;
    if (os_signpost_enabled(v9))
    {
      uint64_t v11 = *(void *)(a1 + 112);
      int v13 = 134217984;
      uint64_t v14 = v11;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v10, OS_SIGNPOST_INTERVAL_END, v4, "ServicesProgramCancelAllRequests", "progHandle=%llx", (uint8_t *)&v13, 0xCu);
    }
  }
  if (v8 <= -536870185)
  {
    switch(v8)
    {
      case -536870211:
        return 1;
      case -536870210:
        return 5;
      case -536870209:
      case -536870208:
      case -536870205:
      case -536870204:
      case -536870203:
      case -536870202:
        goto LABEL_26;
      case -536870207:
        return 20;
      case -536870206:
        return 2;
      case -536870201:
        return 24;
      default:
        if (v8 == -536870191)
        {
          uint64_t result = 19;
        }
        else if (v8 == -536870186)
        {
          uint64_t result = 15;
        }
        else
        {
LABEL_26:
          uint64_t result = 18;
        }
        break;
    }
  }
  else
  {
    uint64_t result = 4;
    switch(v8)
    {
      case -536870176:
        return 26;
      case -536870175:
      case -536870172:
      case -536870171:
      case -536870170:
      case -536870168:
      case -536870167:
      case -536870166:
      case -536870164:
      case -536870161:
        goto LABEL_26;
      case -536870174:
        return 23;
      case -536870173:
        return 10;
      case -536870169:
        return 29;
      case -536870165:
        return 21;
      case -536870163:
        return 27;
      case -536870162:
        return 28;
      case -536870160:
        return result;
      default:
        if (v8 == -536870184)
        {
          uint64_t result = 22;
        }
        else
        {
          if (v8) {
            goto LABEL_26;
          }
          uint64_t result = 0;
        }
        break;
    }
  }
  return result;
}

uint64_t H11ANEProgramMemoryMapRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (!a1 || !a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      H11ANEProgramMemoryMapRequest_cold_5();
    }
    return 2;
  }
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(v4 + 8);
  if (v5)
  {
    uint64_t v6 = *(void *)(v4 + 96);
    if (v6)
    {
      unsigned int v7 = *(_DWORD *)(a2 + 3080);
      if (v7 >= 0x81)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          H11ANEProgramMemoryMapRequest_cold_3();
        }
        return 2;
      }
      if (a3)
      {
        unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(v6 + 416), 1uLL);
        unsigned int v7 = *(_DWORD *)(a2 + 3080);
      }
      else
      {
        unint64_t add = 0;
      }
      bzero(v34, 0x828uLL);
      if (v7)
      {
        unint64_t v27 = 0;
        uint64_t v28 = (IOSurfaceRef *)(a2 + 16);
        int v29 = v34;
        do
        {
          *(_DWORD *)int v29 = IOSurfaceGetID(*(v28 - 2));
          *(void *)((char *)v29 + 4) = *(v28 - 1);
          int v30 = *(_DWORD *)v28;
          v28 += 3;
          *((_DWORD *)v29 + 3) = v30;
          ++v27;
          unint64_t v31 = *(unsigned int *)(a2 + 3080);
          v29 += 2;
        }
        while (v27 < v31);
      }
      else
      {
        LODWORD(v31) = 0;
      }
      v34[257] = *(void *)(a2 + 3072);
      int v35 = v31;
      int v36 = *(_DWORD *)(a2 + 3084);
      unint64_t v37 = add;
      __int16 v38 = 1;
      char v39 = 0;
      int v32 = H11ANE::H11ANEDevice::ANE_ProgramMemoryMapRequest(v5, v34, a3);
      if (v32)
      {
        int v33 = v32;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          H11ANEProgramMemoryMapRequest_cold_4();
        }
        if (v33 > -536870185)
        {
          uint64_t result = 4;
          switch(v33)
          {
            case -536870176:
              uint64_t result = 26;
              break;
            case -536870175:
            case -536870172:
            case -536870171:
            case -536870170:
            case -536870168:
            case -536870167:
            case -536870166:
            case -536870164:
            case -536870161:
              goto LABEL_46;
            case -536870174:
              uint64_t result = 23;
              break;
            case -536870173:
              uint64_t result = 10;
              break;
            case -536870169:
              uint64_t result = 29;
              break;
            case -536870165:
              uint64_t result = 21;
              break;
            case -536870163:
              uint64_t result = 27;
              break;
            case -536870162:
              uint64_t result = 28;
              break;
            case -536870160:
              return result;
            default:
              if (v33 == -536870184) {
                uint64_t result = 22;
              }
              else {
LABEL_46:
              }
                uint64_t result = 18;
              break;
          }
        }
        else
        {
          switch(v33)
          {
            case -536870211:
              return 1;
            case -536870210:
              return 5;
            case -536870209:
            case -536870208:
            case -536870205:
            case -536870204:
            case -536870203:
            case -536870202:
              goto LABEL_46;
            case -536870207:
              return 20;
            case -536870206:
              return 2;
            case -536870201:
              return 24;
            default:
              if (v33 == -536870191)
              {
                uint64_t result = 19;
              }
              else
              {
                if (v33 != -536870186) {
                  goto LABEL_46;
                }
                uint64_t result = 15;
              }
              break;
          }
        }
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)timespec buf = 136315138;
          uint64_t v41 = "H11ANEProgramMemoryMapRequest";
          _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: pH11ANEDevice->ANE_ProgramMemoryMapRequest success\n", buf, 0xCu);
        }
        uint64_t result = 0;
        if (a3) {
          *(void *)(a2 + 3088) = v37;
        }
      }
    }
    else
    {
      BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v17) {
        H11ANEProgramMemoryMapRequest_cold_2(v17, v18, v19, v20, v21, v22, v23, v24);
      }
      return 11;
    }
  }
  else
  {
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v9) {
      H11ANEProgramMemoryMapRequest_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    return 8;
  }
  return result;
}

uint64_t H11ANEProgramMemoryUnmapRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a1 && a2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 16) + 8);
    if (v3)
    {
      bzero(v21, 0x828uLL);
      LODWORD(v4) = *(_DWORD *)(a2 + 3080);
      if (v4)
      {
        unint64_t v5 = 0;
        uint64_t v6 = (IOSurfaceRef *)(a2 + 16);
        unsigned int v7 = v21;
        do
        {
          *(_DWORD *)unsigned int v7 = IOSurfaceGetID(*(v6 - 2));
          *(void *)((char *)v7 + 4) = *(v6 - 1);
          int v8 = *(_DWORD *)v6;
          v6 += 3;
          *((_DWORD *)v7 + 3) = v8;
          ++v5;
          unint64_t v4 = *(unsigned int *)(a2 + 3080);
          v7 += 2;
        }
        while (v5 < v4);
      }
      v21[257] = *(void *)(a2 + 3072);
      int v22 = v4;
      int v23 = *(_DWORD *)(a2 + 3084);
      uint64_t v24 = *(void *)(a2 + 3088);
      __int16 v25 = 1;
      char v26 = 0;
      int v9 = H11ANE::H11ANEDevice::ANE_ProgramMemoryUnMapRequest(v3, v21);
      if (v9)
      {
        int v10 = v9;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          H11ANEProgramMemoryUnmapRequest_cold_2();
        }
        if (v10 > -536870185)
        {
          uint64_t result = 4;
          switch(v10)
          {
            case -536870176:
              uint64_t result = 26;
              break;
            case -536870175:
            case -536870172:
            case -536870171:
            case -536870170:
            case -536870168:
            case -536870167:
            case -536870166:
            case -536870164:
            case -536870161:
              goto LABEL_32;
            case -536870174:
              uint64_t result = 23;
              break;
            case -536870173:
              uint64_t result = 10;
              break;
            case -536870169:
              uint64_t result = 29;
              break;
            case -536870165:
              uint64_t result = 21;
              break;
            case -536870163:
              uint64_t result = 27;
              break;
            case -536870162:
              uint64_t result = 28;
              break;
            case -536870160:
              return result;
            default:
              if (v10 == -536870184) {
                uint64_t result = 22;
              }
              else {
LABEL_32:
              }
                uint64_t result = 18;
              break;
          }
        }
        else
        {
          switch(v10)
          {
            case -536870211:
              return 1;
            case -536870210:
              return 5;
            case -536870209:
            case -536870208:
            case -536870205:
            case -536870204:
            case -536870203:
            case -536870202:
              goto LABEL_32;
            case -536870207:
              return 20;
            case -536870206:
              return 2;
            case -536870201:
              return 24;
            default:
              if (v10 == -536870191)
              {
                uint64_t result = 19;
              }
              else
              {
                if (v10 != -536870186) {
                  goto LABEL_32;
                }
                uint64_t result = 15;
              }
              break;
          }
        }
      }
      else
      {
        BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
        uint64_t result = 0;
        if (v20)
        {
          *(_DWORD *)timespec buf = 136315138;
          uint64_t v28 = "H11ANEProgramMemoryUnmapRequest";
          _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: pH11ANEDevice->ANE_ProgramMemoryUnMapRequest success\n", buf, 0xCu);
          return 0;
        }
      }
    }
    else
    {
      BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v12) {
        H11ANEProgramMemoryUnmapRequest_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
      }
      return 8;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      H11ANEProgramMemoryUnmapRequest_cold_3();
    }
    return 2;
  }
  return result;
}

uint64_t H11ANEProgramCreateNewInstance(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = 2;
  if (a1 && a2 && a3 && (*a2 || *((unsigned char *)a2 + 12)))
  {
    uint64_t v5 = *(void *)(a1 + 16);
    if (*(void *)(v5 + 8))
    {
      if (*(_DWORD *)(v5 + 32) == 1)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          H11ANEProgramCreateNewInstance_cold_2();
        }
        return 20;
      }
      else
      {
        if (*((_DWORD *)a2 + 67) < 0x11u)
        {
          os_signpost_id_t v14 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B240C);
          uint64_t v15 = +[ANEServicesLog handle];
          if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            uint64_t v16 = v15;
            if (os_signpost_enabled(v15))
            {
              uint64_t v17 = *a2;
              *(_DWORD *)timespec buf = 134217984;
              uint64_t v20 = v17;
              _os_signpost_emit_with_name_impl(&dword_21209C000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "ServicesProgramCreateNewInstance", "progHandle=%llx", buf, 0xCu);
            }
          }
          operator new();
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          H11ANEProgramCreateNewInstance_cold_3();
        }
        return 2;
      }
    }
    else
    {
      BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v6) {
        H11ANEProgramCreateNewInstance_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
      }
      return 8;
    }
  }
  return v3;
}

uint64_t H11ANELocateAndOpenHintedDevice(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, CFArrayRef *a5, uint64_t a6, int a7, _DWORD *a8)
{
  uint64_t v9 = a5;
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (!*a8) {
    *a8 = 1;
  }
  if (a7 < 1) {
    return 18;
  }
  CFIndex v14 = 0;
  uint64_t v15 = a7;
  uint64_t v16 = 18;
  uint64_t v17 = &_os_log_internal;
  uint64_t v27 = a7;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*v9, v14);
    *a1 = (uint64_t)ValueAtIndex;
    if (ValueAtIndex[34] != 1) {
      break;
    }
LABEL_20:
    if (++v14 == v15) {
      return v16;
    }
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timespec buf = 67109120;
    int v30 = v14;
    _os_log_impl(&dword_21209C000, v17, OS_LOG_TYPE_DEFAULT, "(Possible Multi-ANE System) Opening H11ANE device at index %d\n", buf, 8u);
  }
  int v19 = 0;
  while (1)
  {
    uint64_t v20 = H11ANEHandleDeviceOpen(*a1, a2, a3, a4, a6);
    uint64_t v21 = (H11ANE::H11ANEDevice *)*a1;
    if (!v20) {
      break;
    }
    uint64_t v16 = v20;
    H11ANE::H11ANEDevice::H11ANEDeviceClose((H11ANE::H11ANEDevice *)*a1);
    if (v16 == 10)
    {
      ++v19;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)timespec buf = 67109376;
        int v30 = v19;
        __int16 v31 = 1024;
        int v32 = 10;
        _os_log_impl(&dword_21209C000, v17, OS_LOG_TYPE_DEFAULT, "(Possible Multi-ANE System) H11ANE device not powered, retry %d out of %d\n", buf, 0xEu);
      }
      usleep(1u);
      if (v19 != 10) {
        continue;
      }
    }
    uint64_t v15 = v27;
    uint64_t v9 = a5;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)timespec buf = 67109120;
      int v30 = v14;
      _os_log_impl(&dword_21209C000, v17, OS_LOG_TYPE_DEFAULT, "(Possible Multi-ANE System) Could not opening H11ANE device at index %d. Skipping device...\n", buf, 8u);
    }
    goto LABEL_20;
  }
  int v22 = *((_DWORD *)v21 + 8);
  int v23 = *a8 - 1;
  BOOL v24 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v22 != v23)
  {
    if (v24)
    {
      *(_DWORD *)timespec buf = 67109120;
      int v30 = v14;
      _os_log_impl(&dword_21209C000, v17, OS_LOG_TYPE_DEFAULT, "(Possible Multi-ANE System) Skipping H11ANE device at index %d\n", buf, 8u);
      uint64_t v21 = (H11ANE::H11ANEDevice *)*a1;
    }
    H11ANE::H11ANEDevice::H11ANEDeviceClose(v21);
    uint64_t v16 = 0;
    uint64_t v15 = v27;
    uint64_t v9 = a5;
    goto LABEL_20;
  }
  if (v24)
  {
    *(_DWORD *)timespec buf = 67109120;
    int v30 = v14;
    _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "(Possible Multi-ANE System) Selected H11ANE device at index %d\n", buf, 8u);
  }
  return 0;
}

uint64_t H11ANECheckPrivilegedVMAccess()
{
  kern_return_t v0;
  kern_return_t v1;
  NSObject *v2;
  const char *v3;
  uint32_t v4;
  CFDictionaryRef v5;
  kern_return_t MatchingServices;
  uint64_t result;
  io_object_t v8;
  io_service_t v9;
  task_port_t *v10;
  NSObject *v11;
  BOOL v12;
  io_connect_t connect;
  io_iterator_t existing;
  mach_port_t mainPort;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  io_service_t v21;
  __int16 v22;
  int v23;
  char name[24];
  uint64_t v25;

  __int16 v25 = *MEMORY[0x263EF8340];
  mainPort = 0;
  uint64_t v0 = MEMORY[0x21667E2D0](*MEMORY[0x263EF87F0], &mainPort);
  if (v0)
  {
    uint64_t v1 = v0;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)timespec buf = 136315394;
    uint64_t v17 = "ANEReturn H11ANECheckPrivilegedVMAccess()";
    uint64_t v18 = 1024;
    LODWORD(v19) = v1;
    uint64_t v2 = &_os_log_internal;
    uint64_t v3 = "%s: Couldn't create a mach port: result=0x%x";
    unint64_t v4 = 18;
    goto LABEL_9;
  }
  existing = 0;
  strcpy(name, "ANEPrivilegedVMAccess");
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timespec buf = 136315394;
    uint64_t v17 = "ANEReturn H11ANECheckPrivilegedVMAccess()";
    uint64_t v18 = 2080;
    int v19 = name;
    _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: probing for %s", buf, 0x16u);
  }
  uint64_t v5 = IOServiceMatching(name);
  MatchingServices = IOServiceGetMatchingServices(mainPort, v5, &existing);
  if (MatchingServices)
  {
    uint64_t v1 = MatchingServices;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)timespec buf = 136315650;
    uint64_t v17 = "ANEReturn H11ANECheckPrivilegedVMAccess()";
    uint64_t v18 = 2080;
    int v19 = name;
    uint64_t v20 = 1024;
    uint64_t v21 = v1;
    uint64_t v2 = &_os_log_internal;
    uint64_t v3 = "%s: Couldn't get matching services for %s: result=0x%x";
    unint64_t v4 = 28;
    goto LABEL_9;
  }
  if (existing)
  {
    uint64_t v8 = IOIteratorNext(existing);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = (task_port_t *)MEMORY[0x263EF8960];
      uint64_t v11 = &_os_log_internal;
      do
      {
        connect = 0;
        uint64_t v1 = IOServiceOpen(v9, *v10, 3u, &connect);
        uint64_t v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (v1)
        {
          if (v12)
          {
            *(_DWORD *)timespec buf = 136315650;
            uint64_t v17 = "ANEReturn H11ANECheckPrivilegedVMAccess()";
            uint64_t v18 = 2080;
            int v19 = name;
            uint64_t v20 = 1024;
            uint64_t v21 = v1;
            _os_log_impl(&dword_21209C000, v11, OS_LOG_TYPE_DEFAULT, "%s:Client does NOT have privileged VM access to %s result=0x%x", buf, 0x1Cu);
          }
        }
        else
        {
          if (v12)
          {
            *(_DWORD *)timespec buf = 136315906;
            uint64_t v17 = "ANEReturn H11ANECheckPrivilegedVMAccess()";
            uint64_t v18 = 2080;
            int v19 = name;
            uint64_t v20 = 1024;
            uint64_t v21 = v9;
            int v22 = 1024;
            int v23 = 0;
            _os_log_impl(&dword_21209C000, v11, OS_LOG_TYPE_DEFAULT, "%s:Client has privileged VM access to %s at port %u result=0x%x", buf, 0x22u);
          }
          IOServiceClose(connect);
          connect = 0;
        }
        IOObjectRelease(v9);
        uint64_t v9 = IOIteratorNext(existing);
      }
      while (v9);
    }
    else
    {
      uint64_t v1 = 0;
    }
    IOObjectRelease(existing);
  }
  else
  {
    uint64_t v1 = -536870207;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)timespec buf = 136315138;
      uint64_t v17 = "ANEReturn H11ANECheckPrivilegedVMAccess()";
      uint64_t v2 = &_os_log_internal;
      uint64_t v3 = "%s:IOService ANEPrivilegedVMAccess not found.";
      unint64_t v4 = 12;
LABEL_9:
      _os_log_impl(&dword_21209C000, v2, OS_LOG_TYPE_DEFAULT, v3, buf, v4);
    }
  }
LABEL_10:
  if (v1 <= -536870185)
  {
    switch(v1)
    {
      case -536870211:
        uint64_t result = 1;
        break;
      case -536870210:
        uint64_t result = 5;
        break;
      case -536870209:
      case -536870208:
      case -536870205:
      case -536870204:
      case -536870203:
      case -536870202:
        goto LABEL_36;
      case -536870207:
        uint64_t result = 20;
        break;
      case -536870206:
        uint64_t result = 2;
        break;
      case -536870201:
        uint64_t result = 24;
        break;
      default:
        if (v1 == -536870191)
        {
          uint64_t result = 19;
        }
        else if (v1 == -536870186)
        {
          uint64_t result = 15;
        }
        else
        {
LABEL_36:
          uint64_t result = 18;
        }
        break;
    }
  }
  else
  {
    uint64_t result = 4;
    switch(v1)
    {
      case -536870176:
        return 26;
      case -536870175:
      case -536870172:
      case -536870171:
      case -536870170:
      case -536870168:
      case -536870167:
      case -536870166:
      case -536870164:
      case -536870161:
        goto LABEL_36;
      case -536870174:
        return 23;
      case -536870173:
        return 10;
      case -536870169:
        return 29;
      case -536870165:
        return 21;
      case -536870163:
        return 27;
      case -536870162:
        return 28;
      case -536870160:
        return result;
      default:
        if (v1 == -536870184)
        {
          uint64_t result = 22;
        }
        else
        {
          if (v1) {
            goto LABEL_36;
          }
          uint64_t result = 0;
        }
        break;
    }
  }
  return result;
}

void H11ANEFrameProcDirect(void *a1, H11ANE::H11ANEFrameReceiverRequest *a2)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t v3 = *((void *)a2 + 1035);
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B241C);
  uint64_t v5 = +[ANEServicesLog handle];
  os_signpost_id_t spid = v4;
  unint64_t v6 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v7 = v5;
    if (os_signpost_enabled(v5))
    {
      uint64_t v8 = (const char *)*((void *)a2 + 1029);
      int v9 = *((_DWORD *)a2 + 2060);
      uint64_t v10 = *((void *)a2 + 1032);
      *(_DWORD *)timespec buf = 134218496;
      int v66 = v8;
      __int16 v67 = 1024;
      *(_DWORD *)int v68 = v9;
      *(_WORD *)&v68[4] = 2048;
      *(void *)&v68[6] = v10;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ServicesFrameProcDirect", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
    }
  }
  os_signpost_id_t v47 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle], (const void *)0x61B2434);
  if (*((void *)a2 + 1033))
  {
    int v11 = *((_DWORD *)a2 + 2056);
    if (v11 <= -536870185)
    {
      switch(v11)
      {
        case -536870211:
          int v13 = 1;
          break;
        case -536870210:
          int v13 = 5;
          break;
        case -536870209:
        case -536870208:
        case -536870205:
        case -536870204:
        case -536870203:
        case -536870202:
          goto LABEL_25;
        case -536870207:
          int v13 = 20;
          break;
        case -536870206:
          int v13 = 2;
          break;
        case -536870201:
          int v13 = 24;
          break;
        default:
          if (v11 == -536870191)
          {
            int v13 = 19;
          }
          else if (v11 == -536870186)
          {
            int v13 = 15;
          }
          else
          {
LABEL_25:
            int v13 = 18;
          }
          break;
      }
    }
    else
    {
      int v12 = v11 + 536870176;
      int v13 = 4;
      switch(v12)
      {
        case 0:
          int v13 = 26;
          break;
        case 2:
          int v13 = 23;
          break;
        case 3:
          int v13 = 10;
          break;
        case 7:
          int v13 = 29;
          break;
        case 11:
          int v13 = 21;
          break;
        case 13:
          int v13 = 27;
          break;
        case 14:
          int v13 = 28;
          break;
        case 16:
          break;
        default:
          goto LABEL_25;
      }
    }
    LODWORD(v59) = *((void *)a2 + 1033);
    if (v3)
    {
      v60[0] = 19;
      v60[1] = v13;
      unint64_t v61 = &v59;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      (*(void (**)(uint64_t, _DWORD *))(v3 + 16))(v3, v60);
    }
    uint64_t v28 = +[ANEServicesLog handle];
    if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v29 = v28;
      if (os_signpost_enabled(v28))
      {
        int v30 = (const char *)*((void *)a2 + 1029);
        int v31 = *((_DWORD *)a2 + 2060);
        uint64_t v32 = *((void *)a2 + 1032);
        *(_DWORD *)timespec buf = 134218496;
        int v66 = v30;
        __int16 v67 = 1024;
        *(_DWORD *)int v68 = v31;
        *(_WORD *)&v68[4] = 2048;
        *(void *)&v68[6] = v32;
        _os_signpost_emit_with_name_impl(&dword_21209C000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v47, "ServicesClientCallback", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
      }
    }
    goto LABEL_85;
  }
  int v59 = 0;
  if (*((unsigned char *)a2 + 8196))
  {
    CFIndex v14 = (__CVBuffer *)*((void *)a2 + 1025);
    if (v14)
    {
      CVPixelBufferLockBaseAddress(v14, 0);
      BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(*((CVPixelBufferRef *)a2 + 1025));
      if (!*((_DWORD *)BaseAddress + 7)) {
        goto LABEL_26;
      }
      int v16 = *BaseAddress;
      if (v16 == 513 || v16 == 257)
      {
        int v17 = 0;
        uint64_t v18 = BaseAddress + 4;
        if (v16 == 513) {
          uint64_t v18 = BaseAddress + 2;
        }
        int v19 = (unsigned int *)(BaseAddress + 16);
        uint64_t v20 = *((unsigned int *)BaseAddress + 7);
        do
        {
          unsigned int v21 = *v19;
          v19 += 2;
          v17 += *(_DWORD *)((char *)v18 + v21);
          --v20;
        }
        while (v20);
LABEL_26:
        operator new();
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)timespec buf = 136315394;
        int v66 = "H11ANEFrameProcDirect";
        __int16 v67 = 1024;
        *(_DWORD *)int v68 = v16;
        int v22 = &_os_log_internal;
        int v23 = "ERROR %s: Invalid stats version %u\n";
        uint32_t v24 = 18;
        goto LABEL_40;
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)timespec buf = 136315138;
      int v66 = "H11ANEFrameProcDirect";
      int v22 = &_os_log_internal;
      int v23 = "ERROR %s: Stats CV Pixel Buffer is not allocated\n";
      uint32_t v24 = 12;
LABEL_40:
      _os_log_impl(&dword_21209C000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
    }
  }
  int v25 = *((_DWORD *)a2 + 2056);
  if (v25 == -536870186) {
    int v26 = 17;
  }
  else {
    int v26 = 8;
  }
  char v58 = *((unsigned char *)a2 + 8288);
  if (v25 <= -536870185)
  {
    switch(v25)
    {
      case -536870211:
        int v27 = 1;
        goto LABEL_74;
      case -536870210:
        int v27 = 5;
        goto LABEL_74;
      case -536870209:
      case -536870208:
      case -536870205:
      case -536870204:
      case -536870203:
      case -536870202:
        goto LABEL_64;
      case -536870207:
        int v27 = 20;
        goto LABEL_74;
      case -536870206:
        int v27 = 2;
        goto LABEL_74;
      case -536870201:
        int v27 = 24;
        goto LABEL_74;
      default:
        if (v25 == -536870191)
        {
          int v27 = 19;
        }
        else if (v25 == -536870186)
        {
          int v27 = 15;
        }
        else
        {
LABEL_64:
          int v27 = 18;
          if (!v25) {
            break;
          }
        }
LABEL_74:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = *((void *)a2 + 1029);
          uint64_t v34 = *((void *)a2 + 1032);
          *(_DWORD *)timespec buf = 136316162;
          int v66 = "void H11ANEFrameProcDirect(void *, H11ANEFrameReceiverRequest *)";
          __int16 v67 = 2048;
          *(void *)int v68 = v33;
          *(_WORD *)&v68[8] = 2048;
          *(void *)&v68[10] = v34;
          __int16 v69 = 1024;
          int v70 = v26;
          __int16 v71 = 1024;
          int v72 = v27;
          _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ANEInferface: H11ANEIn:%s programHanlde:0x%llx, transactionId:%llx, statusType: 0x%x, status: 0x%x\n", buf, 0x2Cu);
        }
        break;
    }
  }
  else
  {
    int v27 = 4;
    switch(v25)
    {
      case -536870176:
        int v27 = 26;
        goto LABEL_74;
      case -536870175:
      case -536870172:
      case -536870171:
      case -536870170:
      case -536870168:
      case -536870167:
      case -536870166:
      case -536870164:
      case -536870161:
        goto LABEL_64;
      case -536870174:
        int v27 = 23;
        goto LABEL_74;
      case -536870173:
        int v27 = 10;
        goto LABEL_74;
      case -536870169:
        int v27 = 29;
        goto LABEL_74;
      case -536870165:
        int v27 = 21;
        goto LABEL_74;
      case -536870163:
        int v27 = 27;
        goto LABEL_74;
      case -536870162:
        int v27 = 28;
        goto LABEL_74;
      case -536870160:
        goto LABEL_74;
      default:
        if (v25 == -536870184)
        {
          int v27 = 22;
          goto LABEL_74;
        }
        if (v25) {
          goto LABEL_64;
        }
        int v27 = 0;
        break;
    }
  }
  if (v3)
  {
    v48[0] = v26;
    v48[1] = v27;
    uint64_t v49 = &v58;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    int v54 = 0;
    int v55 = 0;
    int v56 = 0;
    int v57 = 0;
    (*(void (**)(uint64_t, _DWORD *))(v3 + 16))(v3, v48);
  }
  int v35 = +[ANEServicesLog handle];
  if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int v36 = v35;
    if (os_signpost_enabled(v35))
    {
      unint64_t v37 = (const char *)*((void *)a2 + 1029);
      int v38 = *((_DWORD *)a2 + 2060);
      uint64_t v39 = *((void *)a2 + 1032);
      *(_DWORD *)timespec buf = 134218496;
      int v66 = v37;
      __int16 v67 = 1024;
      *(_DWORD *)int v68 = v38;
      *(_WORD *)&v68[4] = 2048;
      *(void *)&v68[6] = v39;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v36, OS_SIGNPOST_INTERVAL_END, v47, "ServicesClientCallback", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
    }
  }
  if (v59)
  {
    CVPixelBufferUnlockBaseAddress(v59, 0);
    CVPixelBufferRelease(v59);
  }
  int v40 = (__CVBuffer *)*((void *)a2 + 1025);
  if (v40)
  {
    CVPixelBufferUnlockBaseAddress(v40, 0);
    CVPixelBufferRelease(*((CVPixelBufferRef *)a2 + 1025));
  }
LABEL_85:
  uint64_t v41 = +[ANEServicesLog handle];
  if (v6 < 0xFFFFFFFFFFFFFFFELL)
  {
    uint64_t v42 = v41;
    if (os_signpost_enabled(v41))
    {
      BOOL v43 = (const char *)*((void *)a2 + 1029);
      int v44 = *((_DWORD *)a2 + 2060);
      uint64_t v45 = *((void *)a2 + 1032);
      *(_DWORD *)timespec buf = 134218496;
      int v66 = v43;
      __int16 v67 = 1024;
      *(_DWORD *)int v68 = v44;
      *(_WORD *)&v68[4] = 2048;
      *(void *)&v68[6] = v45;
      _os_signpost_emit_with_name_impl(&dword_21209C000, v42, OS_SIGNPOST_INTERVAL_END, spid, "ServicesFrameProcDirect", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
    }
  }
}

void sub_2120B0E90(_Unwind_Exception *a1)
{
  MEMORY[0x21667E660](v1, 0x1030C4081A5006CLL);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

uint64_t H11InitializePlatformServices()
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v22 = 0;
  int v23 = 0;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    H11InitializePlatformServices_cold_7();
  }
  int H11ANEDeviceController = H11ANE::CreateH11ANEDeviceController((H11ANE *)&v23, (H11ANE::H11ANEDeviceController **)MyH11ANEDeviceControllerNotification, 0, v0);
  if (!v23)
  {
    BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v10) {
      H11InitializePlatformServices_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    return 18;
  }
  int Firmware = H11ANEDeviceController;
  if (!CFArrayGetCount(*v23))
  {
LABEL_11:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      H11InitializePlatformServices_cold_2();
    }
    unint64_t v6 = 0;
    goto LABEL_14;
  }
  CFIndex v3 = 0;
  os_signpost_id_t v4 = &_os_log_internal;
  while (1)
  {
    ValueAtIndex = (H11ANE::H11ANEDevice *)CFArrayGetValueAtIndex(*v23, v3);
    if (*((_DWORD *)ValueAtIndex + 34) == 1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        H11InitializePlatformServices_cold_3(buf, Firmware, &v25);
      }
      goto LABEL_10;
    }
    unint64_t v6 = ValueAtIndex;
    int Firmware = H11ANE::H11ANEDevice::H11ANEDeviceOpen((uint64_t)ValueAtIndex, (uint64_t)MyH11ANEDeviceMessageNotification, 0, 2u, 0);
    if (!Firmware) {
      break;
    }
LABEL_10:
    if (++v3 >= (unint64_t)CFArrayGetCount(*v23)) {
      goto LABEL_11;
    }
  }
  memset(outputStruct, 0, sizeof(outputStruct));
  H11ANE::H11ANEDevice::ANE_GetStatus((uint64_t)v6, outputStruct);
  if (BYTE8(outputStruct[0]))
  {
    v20[0] = &v22;
    v20[1] = v6;
    int H11ANEFirmwareWorkProcessor = H11ANE::CreateH11ANEFirmwareWorkProcessor((uint64_t)v20);
    if (H11ANEFirmwareWorkProcessor)
    {
      int Firmware = H11ANEFirmwareWorkProcessor;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        H11InitializePlatformServices_cold_6();
      }
    }
    else
    {
      int started = H11ANE::H11ANEFirmwareWorkProcessor::startReceive(v22);
      if (started)
      {
        int Firmware = started;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          H11InitializePlatformServices_cold_5();
        }
      }
      else
      {
        int Firmware = H11ANE::H11ANEDevice::ANE_LoadFirmware(v6);
        if (Firmware)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            H11InitializePlatformServices_cold_4();
          }
          int Firmware = 0;
        }
      }
    }
  }
  else
  {
    int Firmware = -536870170;
  }
LABEL_14:
  if (!Firmware) {
    return 0;
  }
  if (v22)
  {
    H11ANE::H11ANEFirmwareWorkProcessor::stopReceive(v22);
    H11ANE::DestroyH11ANEFirmwareWorkProcessor(v22, v7);
    int v22 = 0;
  }
  if (v6) {
    H11ANE::H11ANEDevice::H11ANEDeviceClose(v6);
  }
  if (Firmware == -536870210) {
    unsigned int v8 = 5;
  }
  else {
    unsigned int v8 = 18;
  }
  if (Firmware == -536870170) {
    return 0;
  }
  else {
    return v8;
  }
}

uint64_t H11ANE::DestroyH11ANEDeviceController(H11ANE *this, H11ANE::H11ANEDeviceController *a2)
{
  CFIndex v3 = (__CFRunLoop *)CFRetain(*((CFTypeRef *)this + 6));
  CFRunLoopStop(v3);
  os_signpost_id_t v4 = pthread_self();
  if (!pthread_equal(v4, *((pthread_t *)this + 8)))
  {
    unint64_t v6 = 0;
    pthread_join(*((pthread_t *)this + 8), &v6);
  }
  H11ANE::H11ANEDeviceController::~H11ANEDeviceController(this);
  MEMORY[0x21667E660]();
  CFRelease(v3);
  return 0;
}

uint64_t H11ANE::H11ANESetCurrentThreadAsTerminating(uint64_t a1)
{
  pthread_once(&H11ANE::threadTerminationKeyInitialized, (void (*)(void))H11ANE::H11ANECreateKey);
  uint64_t v2 = pthread_getspecific(H11ANE::threadTerminationKey);
  if (!v2) {
    uint64_t v2 = malloc_type_malloc(0x10uLL, 0x10200408CB94CA5uLL);
  }
  *(unsigned char *)uint64_t v2 = 1;
  v2[1] = a1;
  pthread_key_t v3 = H11ANE::threadTerminationKey;
  return pthread_setspecific(v3, v2);
}

uint64_t H11ANE::H11ANECreateKey(H11ANE *this)
{
  return pthread_key_create((pthread_key_t *)&H11ANE::threadTerminationKey, (void (__cdecl *)(void *))H11ANE::H11ANECleanupKey);
}

void *H11ANE::H11ANECheckForPendingClose(H11ANE *this)
{
  pthread_once(&H11ANE::threadTerminationKeyInitialized, (void (*)(void))H11ANE::H11ANECreateKey);
  uint64_t result = pthread_getspecific(H11ANE::threadTerminationKey);
  if (result && *(unsigned char *)result)
  {
    uint64_t result = (void *)result[1];
    if (result) {
      return (void *)H11ANEDeviceClose((uint64_t)result);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEIsDelayedCloseFlagSet(H11ANE *this)
{
  pthread_once(&H11ANE::threadTerminationKeyInitialized, (void (*)(void))H11ANE::H11ANECreateKey);
  uint64_t v1 = (unsigned __int8 *)pthread_getspecific(H11ANE::threadTerminationKey);
  unsigned __int8 v3 = 0;
  if (v1) {
    return *v1;
  }
  return v3;
}

void *H11ANE::H11ANEAckCloseRequest(H11ANE *this)
{
  uint64_t result = pthread_getspecific(H11ANE::threadTerminationKey);
  if (result)
  {
    *(unsigned char *)uint64_t result = 0;
    result[1] = 0;
  }
  return result;
}

CFMutableDictionaryRef H11ANE::H11ANECreateCVBuffer(unsigned int a1, unsigned int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, char a10, __int16 a11, __int16 a12)
{
  unsigned int v38 = a2;
  unsigned int valuePtr = a1;
  int v36 = a4;
  int v37 = a3;
  CVPixelBufferRef pixelBufferOut = 0;
  if (a5)
  {
    if (a5 == 4)
    {
      OSType v17 = 1278226488;
    }
    else if (a5 == 2)
    {
      HIDWORD(v16) = a12 & 0xFF0;
      LODWORD(v16) = HIDWORD(v16) - 64;
      switch((v16 >> 6))
      {
        case 0u:
          OSType v17 = 1735549492;
          break;
        case 1u:
          OSType v17 = 1919379252;
          break;
        case 7u:
          OSType v17 = 1734505012;
          break;
        default:
          OSType v17 = 1650943796;
          break;
      }
    }
    else
    {
      OSType v17 = 2037741158;
      if (!a6) {
        OSType v17 = 2037741171;
      }
    }
  }
  else
  {
    OSType v17 = 875704422;
    if (!a6) {
      OSType v17 = 875704438;
    }
  }
  OSType pixelFormatType = v17;
  CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (result)
  {
    uint64_t v20 = result;
    CFNumberRef v21 = CFNumberCreate(v18, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(v20, (const void *)*MEMORY[0x263F04248], v21);
    CFRelease(v21);
    int v33 = a7;
    CFNumberRef v22 = CFNumberCreate(v18, kCFNumberIntType, &v33);
    CFDictionarySetValue(v20, (const void *)*MEMORY[0x263F04080], v22);
    CFRelease(v22);
    CFNumberRef v23 = CFNumberCreate(v18, kCFNumberIntType, &v38);
    CFDictionarySetValue(v20, (const void *)*MEMORY[0x263F04120], v23);
    CFRelease(v23);
    if (a3)
    {
      CFNumberRef v24 = CFNumberCreate(v18, kCFNumberIntType, &v37);
      CFDictionarySetValue(v20, (const void *)*MEMORY[0x263F040D0], v24);
      CFRelease(v24);
    }
    if (a4)
    {
      CFNumberRef v25 = CFNumberCreate(v18, kCFNumberIntType, &v36);
      CFDictionarySetValue(v20, (const void *)*MEMORY[0x263F040F0], v25);
      CFRelease(v25);
    }
    CFNumberRef v26 = CFNumberCreate(v18, kCFNumberIntType, &pixelFormatType);
    CFDictionarySetValue(v20, (const void *)*MEMORY[0x263F04188], v26);
    CFRelease(v26);
    int v32 = a8;
    CFNumberRef v27 = CFNumberCreate(v18, kCFNumberIntType, &v32);
    CFDictionarySetValue(v20, (const void *)*MEMORY[0x263F04190], v27);
    CFRelease(v27);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (Mutable)
    {
      uint64_t v29 = Mutable;
      if (a10) {
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EF30], (const void *)*MEMORY[0x263EFFB38]);
      }
      if ((a12 & 0x400) != 0) {
        CFDictionarySetValue(v29, (const void *)*MEMORY[0x263F0EF48], (const void *)*MEMORY[0x263EFFB40]);
      }
      int v31 = a9;
      CFNumberRef v30 = CFNumberCreate(0, kCFNumberIntType, &v31);
      CFDictionarySetValue(v29, (const void *)*MEMORY[0x263F0ED58], v30);
      CFRelease(v30);
      CFDictionaryAddValue(v20, (const void *)*MEMORY[0x263F04138], v29);
      CFRelease(v29);
      CVPixelBufferCreate(v18, valuePtr, v38, pixelFormatType, v20, &pixelBufferOut);
      CFRelease(v20);
      return pixelBufferOut;
    }
    else
    {
      CFRelease(v20);
      return 0;
    }
  }
  return result;
}

CFMutableDictionaryRef H11ANE::H11ANECreateCVBufferPool(int a1, int a2, int a3, int a4, int a5, uint64_t a6, int a7, int a8, int a9, int a10, char a11, __int16 a12, __int16 a13)
{
  int v47 = a2;
  int valuePtr = a1;
  int v45 = a4;
  int v46 = a3;
  CVPixelBufferPoolRef poolOut = 0;
  uint64_t v44 = a6;
  if (a5)
  {
    if (a5 == 4)
    {
      int v18 = 1278226488;
    }
    else if (a5 == 2)
    {
      HIDWORD(v17) = a13 & 0xFF0;
      LODWORD(v17) = HIDWORD(v17) - 64;
      switch((v17 >> 6))
      {
        case 0u:
          int v18 = 1735549492;
          break;
        case 1u:
          int v18 = 1919379252;
          break;
        case 7u:
          int v18 = 1734505012;
          break;
        default:
          int v18 = 1650943796;
          break;
      }
    }
    else
    {
      int v18 = 2037741158;
      if (!a7) {
        int v18 = 2037741171;
      }
    }
  }
  else
  {
    int v18 = 875704422;
    if (!a7) {
      int v18 = 875704438;
    }
  }
  int v42 = v18;
  CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (result)
  {
    CFNumberRef v21 = result;
    CFNumberRef v22 = CFNumberCreate(v19, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(v21, (const void *)*MEMORY[0x263F04248], v22);
    CFRelease(v22);
    int v41 = a8;
    CFNumberRef v23 = CFNumberCreate(v19, kCFNumberIntType, &v41);
    CFDictionarySetValue(v21, (const void *)*MEMORY[0x263F04080], v23);
    CFRelease(v23);
    CFNumberRef v24 = CFNumberCreate(v19, kCFNumberIntType, &v47);
    CFDictionarySetValue(v21, (const void *)*MEMORY[0x263F04120], v24);
    CFRelease(v24);
    if (a3)
    {
      CFNumberRef v25 = CFNumberCreate(v19, kCFNumberIntType, &v46);
      CFDictionarySetValue(v21, (const void *)*MEMORY[0x263F040D0], v25);
      CFRelease(v25);
    }
    if (a4)
    {
      CFNumberRef v26 = CFNumberCreate(v19, kCFNumberIntType, &v45);
      CFDictionarySetValue(v21, (const void *)*MEMORY[0x263F040F0], v26);
      CFRelease(v26);
    }
    CFNumberRef v27 = CFNumberCreate(v19, kCFNumberIntType, &v42);
    CFDictionarySetValue(v21, (const void *)*MEMORY[0x263F04188], v27);
    CFRelease(v27);
    int v40 = a9;
    CFNumberRef v28 = CFNumberCreate(v19, kCFNumberIntType, &v40);
    CFDictionarySetValue(v21, (const void *)*MEMORY[0x263F04190], v28);
    CFRelease(v28);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFNumberRef v30 = Mutable;
    if (a11) {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EF30], (const void *)*MEMORY[0x263EFFB38]);
    }
    if ((a13 & 0x400) != 0) {
      CFDictionarySetValue(v30, (const void *)*MEMORY[0x263F0EF48], (const void *)*MEMORY[0x263EFFB40]);
    }
    int v39 = a10;
    CFNumberRef v31 = CFNumberCreate(0, kCFNumberIntType, &v39);
    CFDictionarySetValue(v30, (const void *)*MEMORY[0x263F0ED58], v31);
    CFRelease(v31);
    CFDictionaryAddValue(v21, (const void *)*MEMORY[0x263F04138], v30);
    CFRelease(v30);
    if (v47 == 8 || (a13 & 0x30) == 0 && !a7) {
      goto LABEL_40;
    }
    int v32 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (!v32) {
      goto LABEL_40;
    }
    int v33 = v32;
    if (a7)
    {
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F03E50], (const void *)*MEMORY[0x263F03E78]);
      if ((a13 & 0x10) != 0) {
        uint64_t v34 = (const void **)MEMORY[0x263F03F18];
      }
      else {
        uint64_t v34 = (const void **)MEMORY[0x263F03EF8];
      }
      if ((a13 & 0x30) == 0) {
        goto LABEL_39;
      }
      int v35 = (const void **)MEMORY[0x263F04040];
    }
    else
    {
      if ((a13 & 0x10) != 0) {
        uint64_t v34 = (const void **)MEMORY[0x263F03F18];
      }
      else {
        uint64_t v34 = (const void **)MEMORY[0x263F03EF8];
      }
      if ((a13 & 0x30) == 0) {
        goto LABEL_39;
      }
      int v35 = (const void **)MEMORY[0x263F04048];
    }
    CFDictionarySetValue(v33, (const void *)*MEMORY[0x263F04018], *v35);
    CFDictionarySetValue(v33, (const void *)*MEMORY[0x263F03EE0], *v34);
    CFDictionarySetValue(v33, (const void *)*MEMORY[0x263F03FB8], (const void *)*MEMORY[0x263F03FE0]);
LABEL_39:
    CFDictionaryAddValue(v21, (const void *)*MEMORY[0x263F03DF0], v33);
    CFRelease(v33);
LABEL_40:
    CFMutableDictionaryRef v36 = CFDictionaryCreateMutable(v19, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (v36)
    {
      int v37 = v36;
      CFNumberRef v38 = CFNumberCreate(0, kCFNumberCFIndexType, &v44);
      CFDictionaryAddValue(v37, (const void *)*MEMORY[0x263F041C8], v38);
      CFRelease(v38);
      CVPixelBufferPoolCreate(v19, v37, v21, &poolOut);
      CFRelease(v37);
      if (poolOut) {
        CVPixelBufferPoolPreAllocate();
      }
    }
    CFRelease(v21);
    return poolOut;
  }
  return result;
}

const __CFString *H11ANE::H11ANEGetCFPreferenceNumber(const __CFString *this, const __CFString *a2, const __CFString *a3)
{
  CFStringRef v4 = (const __CFString *)CFPreferencesCopyValue(this, a2, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  if (v4)
  {
    CFStringRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFStringGetTypeID())
    {
      uint64_t IntValue = CFStringGetIntValue(v5);
      if ((int)IntValue <= 0)
      {
        uint64_t IntValue = 1;
        if (CFStringCompare(v5, @"true", 1uLL))
        {
          uint64_t IntValue = 1;
          if (CFStringCompare(v5, @"yes", 1uLL))
          {
            if (CFStringCompare(v5, @"false", 1uLL) == kCFCompareEqualTo
              || CFStringCompare(v5, @"no", 1uLL) == kCFCompareEqualTo
              || (uint64_t IntValue = (uint64_t)a3, CFStringCompare(v5, @"0", 1uLL) == kCFCompareEqualTo))
            {
              uint64_t IntValue = 0;
            }
          }
        }
      }
    }
    else
    {
      CFTypeID v8 = CFGetTypeID(v5);
      if (v8 == CFNumberGetTypeID())
      {
        unsigned int valuePtr = 0;
        if (CFNumberGetValue((CFNumberRef)v5, kCFNumberIntType, &valuePtr)) {
          uint64_t IntValue = valuePtr;
        }
        else {
          uint64_t IntValue = a3;
        }
      }
      else
      {
        CFTypeID v9 = CFGetTypeID(v5);
        uint64_t IntValue = (uint64_t)a3;
        if (v9 == CFBooleanGetTypeID()) {
          uint64_t IntValue = CFEqual(v5, (CFTypeRef)*MEMORY[0x263EFFB40]);
        }
      }
    }
    CFRelease(v5);
    return (const __CFString *)IntValue;
  }
  return a3;
}

H11ANE::H11ANECFLocalMessagePort *H11ANE::H11ANECFLocalMessagePort::H11ANECFLocalMessagePort(H11ANE::H11ANECFLocalMessagePort *this, const __CFString *a2, CFDataRef (__cdecl *a3)(CFMessagePortRef, SInt32, CFDataRef, void *), void (__cdecl *a4)(CFMessagePortRef, void *), void *a5)
{
  *(void *)this = &unk_26C395BE0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  context.version = 0;
  context.info = a5;
  memset(&context.retain, 0, 24);
  uint64_t v7 = CFMessagePortCreateLocal(0, a2, a3, &context, 0);
  *((void *)this + 1) = v7;
  if (a4 && v7) {
    CFMessagePortSetInvalidationCallBack(v7, a4);
  }
  return this;
}

void H11ANE::H11ANECFLocalMessagePort::~H11ANECFLocalMessagePort(H11ANE::H11ANECFLocalMessagePort *this)
{
  *(void *)this = &unk_26C395BE0;
  uint64_t v2 = (const void *)*((void *)this + 2);
  if (v2) {
    CFRelease(v2);
  }
  unsigned __int8 v3 = (__CFMessagePort *)*((void *)this + 1);
  if (v3)
  {
    CFMessagePortInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 1));
  }
}

{
  uint64_t vars8;

  H11ANE::H11ANECFLocalMessagePort::~H11ANECFLocalMessagePort(this);
  JUMPOUT(0x21667E660);
}

CFRunLoopSourceRef H11ANE::H11ANECFLocalMessagePort::GetRunLoopSource(H11ANE::H11ANECFLocalMessagePort *this)
{
  CFRunLoopSourceRef result = (CFRunLoopSourceRef)*((void *)this + 2);
  if (!result)
  {
    CFRunLoopSourceRef result = CFMessagePortCreateRunLoopSource(0, *((CFMessagePortRef *)this + 1), 0);
    *((void *)this + 2) = result;
  }
  return result;
}

void H11ANE::H11ANECFLocalMessagePort::SetDispatchQueue(uint64_t a1, NSObject *a2)
{
  *(void *)(a1 + 24) = a2;
  CFMessagePortSetDispatchQueue(*(CFMessagePortRef *)(a1 + 8), a2);
}

H11ANE::H11ANECFRemoteMessagePort *H11ANE::H11ANECFRemoteMessagePort::H11ANECFRemoteMessagePort(H11ANE::H11ANECFRemoteMessagePort *this, const __CFString *a2, void (__cdecl *a3)(CFMessagePortRef, void *))
{
  *(void *)this = &unk_26C395C00;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  Remote = CFMessagePortCreateRemote(0, a2);
  *((void *)this + 1) = Remote;
  if (a3 && Remote) {
    CFMessagePortSetInvalidationCallBack(Remote, a3);
  }
  return this;
}

void H11ANE::H11ANECFRemoteMessagePort::~H11ANECFRemoteMessagePort(H11ANE::H11ANECFRemoteMessagePort *this)
{
  *(void *)this = &unk_26C395C00;
  uint64_t v2 = (const void *)*((void *)this + 2);
  if (v2) {
    CFRelease(v2);
  }
  unsigned __int8 v3 = (const void *)*((void *)this + 1);
  if (v3) {
    CFRelease(v3);
  }
}

{
  uint64_t vars8;

  H11ANE::H11ANECFRemoteMessagePort::~H11ANECFRemoteMessagePort(this);
  JUMPOUT(0x21667E660);
}

CFRunLoopSourceRef H11ANE::H11ANECFRemoteMessagePort::GetRunLoopSource(H11ANE::H11ANECFRemoteMessagePort *this)
{
  CFRunLoopSourceRef result = (CFRunLoopSourceRef)*((void *)this + 2);
  if (!result)
  {
    CFRunLoopSourceRef result = CFMessagePortCreateRunLoopSource(0, *((CFMessagePortRef *)this + 1), 0);
    *((void *)this + 2) = result;
  }
  return result;
}

void H11ANE::H11ANECFRemoteMessagePort::SetDispatchQueue(uint64_t a1, NSObject *a2)
{
  *(void *)(a1 + 24) = a2;
  CFMessagePortSetDispatchQueue(*(CFMessagePortRef *)(a1 + 8), a2);
}

uint64_t H11ANE::H11ANEGetMachThreadPriority(H11ANE *this, integer_t *a2, int *a3)
{
  if (!a2) {
    return 3758097090;
  }
  thread_inspect_t v4 = this;
  mach_msg_type_number_t thread_info_outCnt = 10;
  uint64_t v5 = thread_info((thread_inspect_t)this, 3u, thread_info_out, &thread_info_outCnt);
  if (!v5)
  {
    switch(v17)
    {
      case 4:
        mach_msg_type_number_t thread_info_outCnt = 4;
        uint64_t v6 = thread_info(v4, 0xCu, v14, &thread_info_outCnt);
        if (v6)
        {
          uint64_t v7 = (FILE *)*MEMORY[0x263EF8348];
          CFTypeID v8 = "thread_info() for THREAD_SCHED_FIFO_INFO failed";
          size_t v9 = 47;
          goto LABEL_4;
        }
        integer_t v11 = v14[1];
        break;
      case 2:
        mach_msg_type_number_t thread_info_outCnt = 5;
        uint64_t v6 = thread_info(v4, 0xBu, v13, &thread_info_outCnt);
        if (v6)
        {
          uint64_t v7 = (FILE *)*MEMORY[0x263EF8348];
          CFTypeID v8 = "thread_info() for THREAD_SCHED_RR_INFO failed\n";
          size_t v9 = 46;
          goto LABEL_4;
        }
        integer_t v11 = v13[1];
        break;
      case 1:
        mach_msg_type_number_t thread_info_outCnt = 5;
        uint64_t v6 = thread_info(v4, 0xAu, v12, &thread_info_outCnt);
        if (v6)
        {
          uint64_t v7 = (FILE *)*MEMORY[0x263EF8348];
          CFTypeID v8 = "thread_info() for THREAD_SCHED_TIMESHARE_INFO failed\n";
          size_t v9 = 53;
          goto LABEL_4;
        }
        integer_t v11 = v12[1];
        break;
      default:
        fwrite("Unknown mach thread policy\n", 0x1BuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
        return 0;
    }
    *a2 = v11;
    return v6;
  }
  uint64_t v6 = v5;
  uint64_t v7 = (FILE *)*MEMORY[0x263EF8348];
  CFTypeID v8 = "thread_info() for THREAD_BASIC_INFO failed\n";
  size_t v9 = 43;
LABEL_4:
  fwrite(v8, v9, 1uLL, v7);
  return v6;
}

uint64_t H11ANE::H11ANESetMachThreadPriority(H11ANE *this, int a2)
{
  thread_act_t v3 = this;
  uint64_t v12 = *MEMORY[0x263EF8340];
  integer_t v8 = 0;
  pid_t v4 = getpid();
  if (proc_pidinfo(v4, 2, 0, buffer, 232) <= 0)
  {
    fwrite("H11ANESetMachThreadPriority - proc_pidinfo() failed\n", 0x34uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    return 0xFFFFFFFFLL;
  }
  else
  {
    integer_t policy_info = a2 - v11;
    uint64_t v5 = thread_policy_set(v3, 3u, &policy_info, 1u);
    if (v5)
    {
      uint64_t v6 = v5;
      fprintf((FILE *)*MEMORY[0x263EF8348], "H11ANESetMachThreadPriority - thread_policy_set(...,THREAD_PRECEDENCE_POLICY,...) failed, err=%d\n", v5);
    }
    else
    {
      uint64_t v6 = thread_policy_set(v3, 1u, &v8, 1u);
      if (v6) {
        fprintf((FILE *)*MEMORY[0x263EF8348], "H11ANESetMachThreadPriority - thread_policy_set(...,THREAD_EXTENDED_POLICY,...) failed, err=%d\n", v6);
      }
    }
  }
  return v6;
}

uint64_t H11ANE::H11ANEVerifyFirmwareDigest(H11ANE *this, unint64_t a2, void *a3, unsigned __int8 *a4)
{
  CC_LONG v4 = a2;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2 >> 25)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Computing signature for buffer %p whose size 0x%08zx is too large.  Failing. \n", this, a2);
    return 3758097090;
  }
  else
  {
    CC_SHA256_Init(&c);
    CC_SHA256_Update(&c, this, v4);
    CC_SHA256_Final(md, &c);
    return *a3 != *(void *)md || a3[1] != v13 || a3[2] != v14 || a3[3] != v15;
  }
}

uint64_t H11ANE::H11ANEInflateFirmwareBuffer(H11ANE *this, unint64_t a2, unint64_t a3, unsigned __int8 **a4, unint64_t *a5)
{
  memset(&strm.zalloc, 0, 24);
  strm.avail_in = a2;
  strm.next_in = 0;
  if (HIDWORD(a2))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Cannot initialize decompression.  Compressed buffer size %zd too large. \n", a2);
    return 4294967292;
  }
  else
  {
    uint64_t v8 = inflateInit2_(&strm, 47, "1.2.12", 112);
    if (v8)
    {
      uint64_t v9 = v8;
      fwrite("Cannot initialize decompression.  Invalid input. \n", 0x32uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }
    else
    {
      int v11 = (unsigned __int8 *)*(unsigned int *)((char *)this + a2 - 4);
      *a4 = v11;
      if (!(v11 >> 25)) {
        operator new[]();
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "Expected size for decompressed firmware 0x%08x is larger than 0x%08x.  Failing. \n", v11, 0x2000000);
      return 4294967293;
    }
  }
  return v9;
}

uint64_t H11ANE::getFrameFormat(H11ANE *this)
{
  if ((int)this > 1650943795)
  {
    if (this == 2037741171 || this == 2037741158)
    {
      return 1;
    }
    else if (this == 1650943796)
    {
      return 2;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  else if (this == 875704422 || this == 875704438)
  {
    return 0;
  }
  else if (this == 1278226488)
  {
    return 4;
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

void H11ANE::H11ANECleanupKey(void *this, void *a2)
{
  if (this) {
    free(this);
  }
}

uint64_t ZinCreateAnalytics(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, unsigned int a5, unint64_t a6, unint64_t a7)
{
  uint64_t v330 = *MEMORY[0x263EF8340];
  if ((a1 & 0x80000000) == 0 && a4 && a5 && a6 && a7)
  {
    v287[0] = a6;
    v287[1] = a6;
    v287[2] = a7;
    char v288 = 1;
    ANEDebugInfo::DebugInfoParser::DebugInfoParser((ANEDebugInfo::DebugInfoParser *)v283, a4, a5);
    if (ANEDebugInfo::DebugInfoParser::Parse((ANEDebugInfo::DebugInfoParser *)v283))
    {
      ANEDebugInfo::DebugInfoParser::GetCompilationUnit((ANEDebugInfo::DebugInfoParser *)v283, a1, (uint64_t)&v274);
      if (!(_BYTE)v274)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ZinCreateAnalytics(a1, v30, v31, v32, v33, v34, v35, v36);
        }
        goto LABEL_242;
      }
      BOOL v10 = MemPool::alloc<_AnalyticsProcedureInfo>((uint64_t)v287, 1);
      int v11 = v10;
      if (!v10)
      {
        BOOL v37 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v37) {
          ZinCreateAnalytics(v37, v38, v39, v40, v41, v42, v43, v44);
        }
        goto LABEL_240;
      }
      *BOOL v10 = 0x400000001;
      if (a3) {
        int v12 = 2 * (*(_DWORD *)a3 == 2);
      }
      else {
        int v12 = 0;
      }
      Mode = (unsigned char *)ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v275);
      int v46 = v12 | Mode[1];
      if (*Mode) {
        int v47 = v46 + 5;
      }
      else {
        int v47 = v46 + 1;
      }
      *((_DWORD *)v11 + 8) = v47;
      uint64_t v48 = MemPool::alloc<unsigned long long>((uint64_t)v287, v47);
      if (!v48)
      {
        BOOL v63 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v63) {
          ZinCreateAnalytics(v63, v64, v65, v66, v67, v68, v69, v70);
        }
        goto LABEL_238;
      }
      v11[5] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v48);
      if (a3 && *(_DWORD *)a3 == 2)
      {
        uint64_t v49 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
        if (!v49)
        {
          BOOL v95 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v95) {
            ZinCreateAnalytics(v95, v96, v97, v98, v99, v100, v101, v102);
          }
          goto LABEL_238;
        }
        *uint64_t v48 = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v49);
        *uint64_t v49 = 3;
        *((void *)v49 + 1) = *(void *)(a3 + 144);
        uint64_t v50 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
        if (!v50)
        {
          BOOL v111 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v111) {
            ZinCreateAnalytics(v111, v112, v113, v114, v115, v116, v117, v118);
          }
          goto LABEL_238;
        }
        v48[1] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v50);
        _DWORD *v50 = 4;
        *((void *)v50 + 1) = *(void *)(a3 + 40);
        unsigned int v51 = 2;
      }
      else
      {
        unsigned int v51 = 0;
      }
      if (!*(unsigned char *)ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v275)) {
        goto LABEL_38;
      }
      uint64_t v52 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
      if (v52)
      {
        v48[v51] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v52);
        *uint64_t v52 = 9;
        *((void *)v52 + 1) = v278;
        uint64_t v53 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
        if (v53)
        {
          v48[v51 | 1] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v53);
          *uint64_t v53 = 12;
          *((void *)v53 + 1) = (unint64_t)v275[0];
          int v54 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
          if (v54)
          {
            v48[v51 + 2] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v54);
            _DWORD *v54 = 13;
            *((void *)v54 + 1) = (unint64_t)v275[1];
            int v55 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
            if (v55)
            {
              v48[v51 + 3] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v55);
              *int v55 = 14;
              *((void *)v55 + 1) = (unint64_t)v275[3];
              v51 |= 4u;
LABEL_38:
              ANEDebugInfo::DebugInfoInMem::GetString((ANEDebugInfo::DebugInfoInMem *)v275, v280, (std::string *)__p);
              int v56 = BYTE7(v290);
              if (SBYTE7(v290) < 0) {
                int v56 = (int)__p[1];
              }
              int v57 = MemPool::alloc<signed char>((uint64_t)v287, v56 + 8);
              if (v57)
              {
                v48[v51] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v57);
                *int v57 = 15;
                int v58 = BYTE7(v290);
                if (SBYTE7(v290) < 0) {
                  int v58 = (int)__p[1];
                }
                v57[1] = v58;
                if ((SBYTE7(v290) & 0x80u) == 0) {
                  int v59 = __p;
                }
                else {
                  int v59 = (void **)__p[0];
                }
                if ((SBYTE7(v290) & 0x80u) == 0) {
                  size_t v60 = BYTE7(v290);
                }
                else {
                  size_t v60 = (size_t)__p[1];
                }
                memcpy(v57 + 2, v59, v60);
                if (!*(unsigned char *)(ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v275) + 1)) {
                  goto LABEL_52;
                }
                unint64_t v61 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
                if (v61)
                {
                  v48[v51 + 1] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v61);
                  *unint64_t v61 = 16;
                  *((void *)v61 + 1) = v279;
LABEL_52:
                  char v62 = 1;
                  goto LABEL_70;
                }
                BOOL v119 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (v119) {
                  ZinCreateAnalytics(v119, v120, v121, v122, v123, v124, v125, v126);
                }
              }
              else
              {
                BOOL v79 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (v79) {
                  ZinCreateAnalytics(v79, v80, v81, v82, v83, v84, v85, v86);
                }
              }
              char v62 = 0;
LABEL_70:
              if (SBYTE7(v290) < 0) {
                operator delete(__p[0]);
              }
              if (v62)
              {
                if (a2)
                {
                  unsigned int v127 = *(_DWORD *)(a2 + 556);
                  int v128 = *(_DWORD *)(a2 + 12);
                }
                else
                {
                  unsigned int v127 = 0;
                  int v128 = 0;
                }
                int v129 = -1431655765 * ((unint64_t)(v277 - v276) >> 4);
                int v130 = MemPool::alloc<unsigned long long>((uint64_t)v287, v129);
                *((_DWORD *)v11 + 3) = v128;
                *((_DWORD *)v11 + 4) = v129;
                if (v130)
                {
                  v263 = v130;
                  void v11[3] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v130);
                  uint64_t v131 = v276;
                  uint64_t v264 = v277;
                  if (v276 == v277)
                  {
                    uint64_t v21 = 1;
                    goto LABEL_243;
                  }
                  int v132 = 0;
                  BOOL v133 = a2 != 0;
                  if (a2) {
                    uint64_t v134 = a2 + 560;
                  }
                  else {
                    uint64_t v134 = 0;
                  }
                  if (!v127) {
                    BOOL v133 = 0;
                  }
                  BOOL v270 = v133;
                  uint64_t v135 = v127;
                  uint64_t v273 = v134;
                  while (1)
                  {
                    v297 = 0;
                    v296 = 0;
                    uint64_t v298 = 0;
                    uint64_t v136 = v131;
                    std::vector<ANEDebugInfo::DebugInfoInMem::Layer>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Layer*,ANEDebugInfo::DebugInfoInMem::Layer*>(&v296, *(const void **)v131, *(void *)(v131 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v131 + 8) - *(void *)v131) >> 2));
                    v299 = 0;
                    v300 = 0;
                    uint64_t v301 = 0;
                    uint64_t v269 = v136;
                    std::vector<ANEDebugInfo::DebugInfoInMem::TD>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::TD*,ANEDebugInfo::DebugInfoInMem::TD*>(&v299, *(const void **)(v136 + 24), *(void *)(v136 + 32), 0x8E38E38E38E38E39 * ((uint64_t)(*(void *)(v136 + 32) - *(void *)(v136 + 24)) >> 3));
                    v137 = MemPool::alloc<_AnalyticsGroupInfo>((uint64_t)v287, 1);
                    if (!v137)
                    {
                      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                      {
                        char v188 = 0;
                        goto LABEL_223;
                      }
                      ZinCreateAnalytics(v312, v313, v219);
                      char v188 = 0;
                      goto LABEL_220;
                    }
                    int v138 = v297;
                    uint64_t v139 = v296;
                    v271 = v300;
                    v267 = v299;
                    int v266 = v132 + 1;
                    v263[v132] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v137);
                    if (v137 <= v263)
                    {
                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                      {
                        ZinCreateAnalytics(&buf, v295);
                        goto LABEL_219;
                      }
                      goto LABEL_221;
                    }
                    int v140 = -1431655765 * ((unint64_t)(v138 - v139) >> 2);
                    *(_DWORD *)v137 = v140;
                    v141 = MemPool::alloc<unsigned long long>((uint64_t)v287, v140);
                    if (!v141)
                    {
                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                      {
                        ZinCreateAnalytics(v310, v311, v220);
                        goto LABEL_219;
                      }
                      goto LABEL_221;
                    }
                    v137[1] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v141);
                    v142 = (unsigned int *)v296;
                    v143 = (unsigned int *)v297;
                    if (v296 != v297)
                    {
                      int v144 = 0;
                      do
                      {
                        unsigned int v145 = *v142;
                        unsigned int v146 = v142[1];
                        unsigned int v147 = v142[2];
                        v148 = (char *)MemPool::alloc<_AnalyticsLayerInfo>((uint64_t)v287, 1);
                        ANEDebugInfo::DebugInfoInMem::GetString((ANEDebugInfo::DebugInfoInMem *)v275, v145, (std::string *)__p);
                        v149 = (void *)BYTE7(v290);
                        if ((SBYTE7(v290) & 0x80u) == 0) {
                          v150 = __p;
                        }
                        else {
                          v150 = (void **)__p[0];
                        }
                        if (SBYTE7(v290) < 0) {
                          v149 = __p[1];
                        }
                        strncpy(v148, (const char *)v150, (size_t)v149 + 1);
                        ANEDebugInfo::DebugInfoInMem::GetString((ANEDebugInfo::DebugInfoInMem *)v275, v146, &v293);
                        std::string::size_type size = HIBYTE(v293.__r_.__value_.__r.__words[2]);
                        if ((v293.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                          v152 = &v293;
                        }
                        else {
                          v152 = (std::string *)v293.__r_.__value_.__r.__words[0];
                        }
                        if ((v293.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                          std::string::size_type size = v293.__r_.__value_.__l.__size_;
                        }
                        strncpy(v148 + 64, (const char *)v152, size + 1);
                        *((_DWORD *)v148 + 32) = v147;
                        v141[v144] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v148);
                        uint64_t v134 = v273;
                        if (SHIBYTE(v293.__r_.__value_.__r.__words[2]) < 0) {
                          operator delete(v293.__r_.__value_.__l.__data_);
                        }
                        if (SBYTE7(v290) < 0) {
                          operator delete(__p[0]);
                        }
                        v142 += 3;
                        ++v144;
                      }
                      while (v142 != v143);
                    }
                    int v153 = 954437177 * ((unint64_t)(v271 - v267) >> 3);
                    *((_DWORD *)v137 + 4) = v153;
                    v154 = MemPool::alloc<unsigned long long>((uint64_t)v287, v153);
                    if (!v154)
                    {
                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                      {
                        ZinCreateAnalytics(v308, v309, v221);
LABEL_219:
                        char v188 = 0;
                        int v132 = v266;
LABEL_220:
                        uint64_t v134 = v273;
                        goto LABEL_223;
                      }
LABEL_221:
                      char v188 = 0;
                      goto LABEL_222;
                    }
                    void v137[3] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v154);
                    v155 = v299;
                    v272 = v300;
                    if (v299 == v300)
                    {
                      char v188 = 1;
                      int v132 = v266;
                      if (v299) {
                        goto LABEL_224;
                      }
                      goto LABEL_225;
                    }
                    v268 = v154;
                    uint64_t v156 = 0;
                    do
                    {
                      uint64_t v157 = v156;
                      *(_OWORD *)std::string __p = *v155;
                      long long v290 = v155[1];
                      v291[0] = v155[2];
                      v291[1] = v155[3];
                      uint64_t v292 = *((void *)v155 + 8);
                      int v158 = (int)__p[0];
                      memset(&v293, 0, sizeof(v293));
                      if (v270)
                      {
                        v159 = 0;
                        uint64_t v160 = 0;
                        do
                        {
                          v161 = (_OWORD *)(v134 + 16 * v160);
                          if (*(_DWORD *)v161 == v158)
                          {
                            if ((unint64_t)v159 >= v293.__r_.__value_.__r.__words[2])
                            {
                              uint64_t v162 = (uint64_t)((uint64_t)v159 - v293.__r_.__value_.__r.__words[0]) >> 4;
                              if ((unint64_t)(v162 + 1) >> 60) {
                                std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
                              }
                              unint64_t v163 = (uint64_t)(v293.__r_.__value_.__r.__words[2] - v293.__r_.__value_.__r.__words[0]) >> 3;
                              if (v163 <= v162 + 1) {
                                unint64_t v163 = v162 + 1;
                              }
                              if (v293.__r_.__value_.__r.__words[2] - v293.__r_.__value_.__r.__words[0] >= 0x7FFFFFFFFFFFFFF0) {
                                unint64_t v164 = 0xFFFFFFFFFFFFFFFLL;
                              }
                              else {
                                unint64_t v164 = v163;
                              }
                              if (v164) {
                                v165 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEHwDebugEventStruct>>((uint64_t)&v293.__r_.__value_.__r.__words[2], v164);
                              }
                              else {
                                v165 = 0;
                              }
                              v166 = &v165[16 * v162];
                              *(_OWORD *)v166 = *v161;
                              v167 = (char *)v293.__r_.__value_.__l.__size_;
                              std::string::size_type v168 = v293.__r_.__value_.__r.__words[0];
                              std::string::size_type v169 = (std::string::size_type)v166;
                              if (v293.__r_.__value_.__l.__size_ != v293.__r_.__value_.__r.__words[0])
                              {
                                do
                                {
                                  *(_OWORD *)(v169 - 16) = *((_OWORD *)v167 - 1);
                                  v169 -= 16;
                                  v167 -= 16;
                                }
                                while (v167 != (char *)v168);
                                v167 = (char *)v293.__r_.__value_.__r.__words[0];
                              }
                              v159 = v166 + 16;
                              v293.__r_.__value_.__r.__words[0] = v169;
                              v293.__r_.__value_.__l.__size_ = (std::string::size_type)(v166 + 16);
                              v293.__r_.__value_.__r.__words[2] = (std::string::size_type)&v165[16 * v164];
                              if (v167) {
                                operator delete(v167);
                              }
                            }
                            else
                            {
                              *v159++ = *v161;
                            }
                            v293.__r_.__value_.__l.__size_ = (std::string::size_type)v159;
                          }
                          ++v160;
                        }
                        while (v160 != v135);
                      }
                      v170 = (unsigned char *)ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v275);
                      std::string::size_type v171 = v293.__r_.__value_.__r.__words[0];
                      for (int i = 0; v171 != v293.__r_.__value_.__l.__size_; v171 += 16)
                      {
                        unsigned int v173 = *(unsigned __int16 *)(v171 + 4);
                        BOOL v174 = v173 > 0x1D;
                        int v175 = (1 << v173) & 0x20000028;
                        if (!v174 && v175 != 0) {
                          ++i;
                        }
                      }
                      int v177 = v170[1];
                      if (*v170) {
                        int v178 = v177 + 5;
                      }
                      else {
                        int v178 = v177 + 1;
                      }
                      if (v170[2]) {
                        int v179 = v178 | 8;
                      }
                      else {
                        int v179 = v178;
                      }
                      v180 = MemPool::alloc<_AnalyticsTaskInfo>((uint64_t)v287, 1);
                      if (!v180)
                      {
                        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                        {
                          char v188 = 0;
                          uint64_t v156 = v157;
                          goto LABEL_202;
                        }
                        ZinCreateAnalytics(v306, v307, v186);
                        uint64_t v156 = v157;
                        goto LABEL_199;
                      }
                      int v181 = v179 + i;
                      int v182 = v157;
                      v268[v157] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v180);
                      *(_DWORD *)v180 = v181;
                      v183 = MemPool::alloc<unsigned long long>((uint64_t)v287, v181);
                      uint64_t v156 = (v182 + 1);
                      if (!v183)
                      {
                        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                          ZinCreateAnalytics(v304, v305, v187);
                        }
LABEL_199:
                        char v188 = 0;
                        goto LABEL_202;
                      }
                      v180[1] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v183);
                      v184 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
                      if (v184)
                      {
                        void *v183 = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v184);
                        _DWORD *v184 = 10;
                        v184[2] = __p[0];
                        unsigned int v185 = 1;
                      }
                      else
                      {
                        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                          ZinCreateAnalytics(v314, v315, v189);
                        }
                        unsigned int v185 = 0;
                      }
                      if (*(unsigned char *)(ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v275) + 1))
                      {
                        v190 = MemPool::alloc<_AnalyticsData,unsigned char>((uint64_t)v287);
                        if (v190)
                        {
                          v183[v185] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v190);
                          _DWORD *v190 = 11;
                          *((unsigned char *)v190 + 8) = BYTE4(__p[0]);
                          ++v185;
                        }
                        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                        {
                          ZinCreateAnalytics(v316, v317, v191);
                        }
                      }
                      if (!*(unsigned char *)ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v275)) {
                        goto LABEL_173;
                      }
                      v192 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
                      if (v192)
                      {
                        v183[v185] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v192);
                        _DWORD *v192 = 5;
                        *((void **)v192 + 1) = __p[1];
                        v193 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
                        unsigned int v194 = v185 + 1;
                        if (v193)
                        {
                          v183[v194] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v193);
                          _DWORD *v193 = 6;
                          *((void *)v193 + 1) = v290;
                          v195 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
                          unsigned int v194 = v185 + 2;
                          if (v195)
                          {
                            v183[v194] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v195);
                            _DWORD *v195 = 7;
                            *((void *)v195 + 1) = *((void *)&v290 + 1);
                            v196 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
                            unsigned int v194 = v185 + 3;
                            if (v196)
                            {
                              v183[v194] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v196);
                              _DWORD *v196 = 8;
                              *((void *)v196 + 1) = *(void *)&v291[0];
                              v185 |= 4u;
                              goto LABEL_173;
                            }
                            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                              ZinCreateAnalytics(v318, v319, v200);
                            }
                          }
                          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                          {
                            ZinCreateAnalytics(v320, v321, v199);
                          }
                        }
                        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                        {
                          ZinCreateAnalytics(v322, v323, v198);
                        }
                        unsigned int v185 = v194;
                      }
                      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                      {
                        ZinCreateAnalytics(v324, v325, v197);
                      }
LABEL_173:
                      if (!*(unsigned char *)(ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v275) + 2)) {
                        goto LABEL_184;
                      }
                      unsigned int v265 = v156;
                      uint64_t v201 = 0;
                      unsigned int v202 = v185;
                      v203 = &v183[v185 + 1];
                      v204 = (int *)v291 + 3;
                      while (1)
                      {
                        v205 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
                        if (!v205)
                        {
                          unsigned int v185 = v202 + v201;
                          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                          {
                            ZinCreateAnalytics(v328, v329, v208);
                            uint64_t v156 = v265;
                            goto LABEL_184;
                          }
                          goto LABEL_183;
                        }
                        *(v203 - 1) = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v205);
                        _DWORD *v205 = 17;
                        v205[2] = *(v204 - 1);
                        v206 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
                        if (!v206) {
                          break;
                        }
                        unint64_t *v203 = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v206);
                        v203 += 2;
                        _DWORD *v206 = 18;
                        int v207 = *v204;
                        v204 += 2;
                        v206[2] = v207;
                        v201 += 2;
                        if (v201 == 8)
                        {
                          unsigned int v185 = v202 + 8;
                          goto LABEL_183;
                        }
                      }
                      unsigned int v185 = v202 + v201 + 1;
                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                      {
                        ZinCreateAnalytics(v326, v327, v209);
                        uint64_t v156 = v265;
                        goto LABEL_184;
                      }
LABEL_183:
                      uint64_t v156 = v265;
LABEL_184:
                      std::string::size_type v210 = v293.__r_.__value_.__l.__size_;
                      std::string::size_type v211 = v293.__r_.__value_.__r.__words[0];
                      if (v293.__r_.__value_.__r.__words[0] == v293.__r_.__value_.__l.__size_)
                      {
                        char v188 = 1;
                        goto LABEL_203;
                      }
                      uint64_t v212 = v156;
                      while (1)
                      {
                        int v213 = *(unsigned __int16 *)(v211 + 4);
                        uint64_t v214 = *(void *)(v211 + 8);
                        if (v213 == 3) {
                          break;
                        }
                        if (v213 == 29)
                        {
                          int v215 = 19;
                          goto LABEL_192;
                        }
                        if (v213 == 5)
                        {
                          int v215 = 2;
                          goto LABEL_192;
                        }
LABEL_194:
                        v211 += 16;
                        if (v211 == v210)
                        {
                          char v188 = 1;
                          goto LABEL_201;
                        }
                      }
                      int v215 = 1;
LABEL_192:
                      v216 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v287);
                      if (v216)
                      {
                        v183[v185] = MemPool::get_offset<unsigned long long>(v287, (unint64_t)v216);
                        _DWORD *v216 = v215;
                        *((void *)v216 + 1) = v214;
                        ++v185;
                        goto LABEL_194;
                      }
                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                      {
                        ZinCreateAnalytics(v302, v303, v217);
                        uint64_t v156 = v212;
                        goto LABEL_199;
                      }
                      char v188 = 0;
LABEL_201:
                      uint64_t v156 = v212;
LABEL_202:
                      std::string::size_type v211 = v293.__r_.__value_.__r.__words[0];
LABEL_203:
                      if (v211)
                      {
                        v293.__r_.__value_.__l.__size_ = v211;
                        operator delete((void *)v211);
                      }
                      v155 = (_OWORD *)((char *)v155 + 72);
                      if (v155 == v272) {
                        char v218 = 0;
                      }
                      else {
                        char v218 = v188;
                      }
                      uint64_t v134 = v273;
                    }
                    while ((v218 & 1) != 0);
LABEL_222:
                    int v132 = v266;
LABEL_223:
                    v155 = v299;
                    if (v299)
                    {
LABEL_224:
                      v300 = v155;
                      operator delete(v155);
                    }
LABEL_225:
                    if (v296)
                    {
                      v297 = v296;
                      operator delete(v296);
                    }
                    if ((v188 & 1) == 0) {
                      goto LABEL_234;
                    }
                    uint64_t v131 = v269 + 48;
                    uint64_t v21 = 1;
                    if (v269 + 48 == v264)
                    {
LABEL_243:
                      __p[0] = &v282;
                      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
                      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v281);
                      __p[0] = &v276;
                      std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
                      goto LABEL_244;
                    }
                  }
                }
                BOOL v222 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (v222) {
                  ZinCreateAnalytics(v222, v223, v224, v225, v226, v227, v228, v229);
                }
LABEL_234:
                BOOL v230 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (v230) {
                  ZinCreateAnalytics(v230, v231, v232, v233, v234, v235, v236, v237);
                }
                goto LABEL_240;
              }
              goto LABEL_238;
            }
            BOOL v238 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v238) {
              ZinCreateAnalytics(v238, v239, v240, v241, v242, v243, v244, v245);
            }
          }
          else
          {
            BOOL v103 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v103) {
              ZinCreateAnalytics(v103, v104, v105, v106, v107, v108, v109, v110);
            }
          }
        }
        else
        {
          BOOL v87 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v87) {
            ZinCreateAnalytics(v87, v88, v89, v90, v91, v92, v93, v94);
          }
        }
      }
      else
      {
        BOOL v71 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v71) {
          ZinCreateAnalytics(v71, v72, v73, v74, v75, v76, v77, v78);
        }
      }
LABEL_238:
      BOOL v246 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v246) {
        ZinCreateAnalytics(v246, v247, v248, v249, v250, v251, v252, v253);
      }
LABEL_240:
      BOOL v254 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v254) {
        ZinCreateAnalytics(v254, v255, v256, v257, v258, v259, v260, v261);
      }
LABEL_242:
      uint64_t v21 = 0;
      goto LABEL_243;
    }
    BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v22) {
      ZinCreateAnalytics(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    uint64_t v21 = 0;
LABEL_244:
    v274 = (void **)&v286;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v274);
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v285);
    v274 = (void **)&v284;
    std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v274);
    v274 = (void **)v283;
    std::vector<ANEDebugInfo::DebugInfoInMem>::__destroy_vector::operator()[abi:ne180100](&v274);
  }
  else
  {
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v13) {
      ZinCreateAnalytics(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    return 0;
  }
  return v21;
}

void sub_2120B3A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,void *a59)
{
  if (SLOBYTE(STACK[0x2A7]) < 0) {
    operator delete((void *)STACK[0x290]);
  }
  std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::~pair((uint64_t)&a37);
  ANEDebugInfo::DebugInfoParser::~DebugInfoParser(&a59);
  _Unwind_Resume(a1);
}

void sub_2120B3B18()
{
}

uint64_t std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::~pair(uint64_t a1)
{
  thread_act_t v3 = (void **)(a1 + 144);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(a1 + 104);
  thread_act_t v3 = (void **)(a1 + 48);
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v3);
  return a1;
}

void ANEDebugInfo::DebugInfoParser::~DebugInfoParser(void **this)
{
  uint64_t v2 = this + 20;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)(this + 15));
  uint64_t v2 = this + 8;
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v2);
  uint64_t v2 = this;
  std::vector<ANEDebugInfo::DebugInfoInMem>::__destroy_vector::operator()[abi:ne180100](&v2);
}

BOOL ZinDumpAnalytics(const void *a1, uint64_t a2)
{
  uint64_t v179 = *MEMORY[0x263EF8340];
  v176[0] = a1;
  v176[1] = a2;
  if (ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(v176, 0, &v171))
  {
    uint64_t v2 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"== Network Analytics ==", 23);
    std::ios_base::getloc((const std::ios_base *)((char *)v2 + *(void *)(*v2 - 24)));
    thread_act_t v3 = std::locale::use_facet((const std::locale *)&v177, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10);
    std::locale::~locale((std::locale *)&v177);
    std::ostream::put();
    std::ostream::flush();
    if (v174)
    {
      uint64_t v4 = 0;
      uint64_t v5 = v176[0] + v175;
      uint64_t v6 = (void *)MEMORY[0x263F8C100];
      uint64_t v7 = (std::locale::id *)MEMORY[0x263F8C108];
      while (ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsData>(v176, *(void *)(v5 + 8 * v4), &v163))
      {
        unsigned int data = v163.__r_.__value_.__l.__data_;
        if (ANEAnalytics::IsVariableLengthString((int)v163.__r_.__value_.__l.__data_))
        {
          std::vector<signed char>::vector(&v177, HIDWORD(v163.__r_.__value_.__r.__words[0]));
          memcpy(v177.__r_.__value_.__l.__data_, (const void *)(*(void *)(v5 + 8 * v4) + v176[0] + 8), HIDWORD(v163.__r_.__value_.__r.__words[0]));
          std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<signed char *>,std::__wrap_iter<signed char *>>(&__p, v177.__r_.__value_.__l.__data_, (char *)v177.__r_.__value_.__l.__size_, v177.__r_.__value_.__l.__size_ - v177.__r_.__value_.__r.__words[0]);
          uint64_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"\t", 1);
          BOOL v10 = FieldKindToString(data);
          size_t v11 = strlen(v10);
          int v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)v10, v11);
          BOOL v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)":  ", 3);
          if ((v169 & 0x80u) == 0) {
            p_p = &__p;
          }
          else {
            p_p = (long long *)__p;
          }
          if ((v169 & 0x80u) == 0) {
            uint64_t v15 = v169;
          }
          else {
            uint64_t v15 = *((void *)&__p + 1);
          }
          uint64_t v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)p_p, v15);
          std::ios_base::getloc((const std::ios_base *)((char *)v16 + *(void *)(*v16 - 24)));
          uint64_t v17 = std::locale::use_facet((const std::locale *)&v164, v7);
          ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
          std::locale::~locale((std::locale *)&v164);
          std::ostream::put();
          std::ostream::flush();
          if ((char)v169 < 0) {
            operator delete((void *)__p);
          }
          if (v177.__r_.__value_.__r.__words[0])
          {
            v177.__r_.__value_.__l.__size_ = v177.__r_.__value_.__r.__words[0];
            operator delete(v177.__r_.__value_.__l.__data_);
          }
        }
        else
        {
          uint64_t v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"\t", 1);
          uint64_t v19 = FieldKindToString(data);
          size_t v20 = strlen(v19);
          uint64_t v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v19, v20);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)":  ", 3);
          BOOL v22 = (void *)std::ostream::operator<<();
          std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(void *)(*v22 - 24)));
          uint64_t v23 = std::locale::use_facet((const std::locale *)&v177, v7);
          ((void (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)(v23, 10);
          std::locale::~locale((std::locale *)&v177);
          std::ostream::put();
          std::ostream::flush();
        }
        if (++v4 >= (unint64_t)v174) {
          goto LABEL_18;
        }
      }
      BOOL v119 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v119) {
        ZinDumpAnalytics(v119, v120, v121, v122, v123, v124, v125, v126);
      }
    }
    else
    {
LABEL_18:
      std::ios_base::getloc((const std::ios_base *)(MEMORY[0x263F8C100] + *(void *)(*MEMORY[0x263F8C100] - 24)));
      uint64_t v24 = std::locale::use_facet((const std::locale *)&v177, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
      std::locale::~locale((std::locale *)&v177);
      std::ostream::put();
      std::ostream::flush();
      uint64_t v25 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"== Layer Analytics ==", 21);
      std::ios_base::getloc((const std::ios_base *)((char *)v25 + *(void *)(*v25 - 24)));
      uint64_t v26 = std::locale::use_facet((const std::locale *)&v177, MEMORY[0x263F8C108]);
      ((void (*)(const std::locale::facet *, uint64_t))v26->__vftable[2].~facet_0)(v26, 10);
      std::locale::~locale((std::locale *)&v177);
      std::ostream::put();
      std::ostream::flush();
      if (!v172) {
        return 1;
      }
      uint64_t v161 = 0;
      uint64_t v27 = (void *)MEMORY[0x263F8C100];
      uint64_t v160 = v176[0] + v173;
      uint64_t v28 = (std::locale::id *)MEMORY[0x263F8C108];
      while (1)
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"Group # ", 8);
        uint64_t v29 = (void *)std::ostream::operator<<();
        std::ios_base::getloc((const std::ios_base *)((char *)v29 + *(void *)(*v29 - 24)));
        uint64_t v30 = std::locale::use_facet((const std::locale *)&v177, v28);
        ((void (*)(const std::locale::facet *, uint64_t))v30->__vftable[2].~facet_0)(v30, 10);
        std::locale::~locale((std::locale *)&v177);
        std::ostream::put();
        std::ostream::flush();
        if (!ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsGroupInfo>(v176, *(void *)(v160 + 8 * v161), &__p))
        {
          BOOL v151 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v151) {
            ZinDumpAnalytics(v151, v152, v153, v154, v155, v156, v157, v158);
          }
          return 0;
        }
        uint64_t v31 = v176[0];
        if (__p) {
          break;
        }
LABEL_26:
        if (v168)
        {
          unint64_t v39 = 0;
          uint64_t v40 = v31 + v170;
          uint64_t v159 = v31 + v170;
          while (1)
          {
            if (!ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsTaskInfo>(v176, *(void *)(v40 + 8 * v39), &v166))
            {
              BOOL v143 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              if (v143) {
                ZinDumpAnalytics(v143, v144, v145, v146, v147, v148, v149, v150);
              }
              return 0;
            }
            uint64_t v41 = *((void *)&v166 + 1);
            uint64_t v42 = v176[0];
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"  Task ", 7);
            uint64_t v43 = (void *)std::ostream::operator<<();
            std::ios_base::getloc((const std::ios_base *)((char *)v43 + *(void *)(*v43 - 24)));
            uint64_t v44 = std::locale::use_facet((const std::locale *)&v177, v28);
            ((void (*)(const std::locale::facet *, uint64_t))v44->__vftable[2].~facet_0)(v44, 10);
            std::locale::~locale((std::locale *)&v177);
            std::ostream::put();
            std::ostream::flush();
            if (v166) {
              break;
            }
LABEL_122:
            ++v39;
            uint64_t v40 = v159;
            if (v39 >= v168) {
              goto LABEL_123;
            }
          }
          uint64_t v45 = 0;
          int v46 = 0;
          int v47 = 0;
          uint64_t v48 = v42 + v41;
          while (ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsData>(v176, *(void *)(v48 + 8 * v45), &v165))
          {
            switch((int)v165)
            {
              case 11:
                uint64_t v49 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"\t", 1);
                uint64_t v50 = FieldKindToString(v165);
                size_t v51 = strlen(v50);
                uint64_t v52 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v49, (uint64_t)v50, v51);
                uint64_t v53 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v52, (uint64_t)":  ", 3);
                if (*(unsigned char *)(v176[0] + *(void *)(v48 + 8 * v45) + 8)) {
                  int v54 = "true";
                }
                else {
                  int v54 = "false";
                }
                if (*(unsigned char *)(v176[0] + *(void *)(v48 + 8 * v45) + 8)) {
                  uint64_t v55 = 4;
                }
                else {
                  uint64_t v55 = 5;
                }
                int v56 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v53, (uint64_t)v54, v55);
                std::ios_base::getloc((const std::ios_base *)((char *)v56 + *(void *)(*v56 - 24)));
                int v57 = std::locale::use_facet((const std::locale *)&v177, v28);
                ((void (*)(const std::locale::facet *, uint64_t))v57->__vftable[2].~facet_0)(v57, 10);
                std::locale::~locale((std::locale *)&v177);
                std::ostream::put();
                std::ostream::flush();
                break;
              case 17:
                std::to_string(&v177, v47);
                uint64_t v75 = std::string::insert(&v177, 0, "_Counter", 8uLL);
                long long v76 = *(_OWORD *)&v75->__r_.__value_.__l.__data_;
                v164.__r_.__value_.__r.__words[2] = v75->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v164.__r_.__value_.__l.__data_ = v76;
                v75->__r_.__value_.__l.__size_ = 0;
                v75->__r_.__value_.__r.__words[2] = 0;
                v75->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v177.__r_.__value_.__l.__data_);
                }
                uint64_t v77 = *(void *)(v176[0] + *(void *)(v48 + 8 * v45) + 8);
                uint64_t v78 = (char *)FieldKindToString(v165);
                std::string::basic_string[abi:ne180100]<0>(&v177, v78);
                if ((v164.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  BOOL v79 = &v164;
                }
                else {
                  BOOL v79 = (std::string *)v164.__r_.__value_.__r.__words[0];
                }
                if ((v164.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  std::string::size_type size = HIBYTE(v164.__r_.__value_.__r.__words[2]);
                }
                else {
                  std::string::size_type size = v164.__r_.__value_.__l.__size_;
                }
                uint64_t v81 = std::string::append(&v177, (const std::string::value_type *)v79, size);
                long long v82 = *(_OWORD *)&v81->__r_.__value_.__l.__data_;
                v163.__r_.__value_.__r.__words[2] = v81->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v163.__r_.__value_.__l.__data_ = v82;
                v81->__r_.__value_.__l.__size_ = 0;
                v81->__r_.__value_.__r.__words[2] = 0;
                v81->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v177.__r_.__value_.__l.__data_);
                }
                ZinIrCompilerParamsUtils::PerfTracerCategoryToString(v77, &v177);
                if (!v178) {
                  std::__throw_bad_optional_access[abi:ne180100]();
                }
                std::string v162 = v177;
                uint64_t v83 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"\t", 1);
                if ((v163.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  uint64_t v84 = &v163;
                }
                else {
                  uint64_t v84 = (std::string *)v163.__r_.__value_.__r.__words[0];
                }
                if ((v163.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  std::string::size_type v85 = HIBYTE(v163.__r_.__value_.__r.__words[2]);
                }
                else {
                  std::string::size_type v85 = v163.__r_.__value_.__l.__size_;
                }
                uint64_t v86 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v83, (uint64_t)v84, v85);
                BOOL v87 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v86, (uint64_t)": ", 2);
                if ((v162.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  uint64_t v88 = &v162;
                }
                else {
                  uint64_t v88 = (std::string *)v162.__r_.__value_.__r.__words[0];
                }
                if ((v162.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  std::string::size_type v89 = HIBYTE(v162.__r_.__value_.__r.__words[2]);
                }
                else {
                  std::string::size_type v89 = v162.__r_.__value_.__l.__size_;
                }
                uint64_t v90 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v87, (uint64_t)v88, v89);
                std::ios_base::getloc((const std::ios_base *)((char *)v90 + *(void *)(*v90 - 24)));
                uint64_t v91 = std::locale::use_facet((const std::locale *)&v177, v28);
                ((void (*)(const std::locale::facet *, uint64_t))v91->__vftable[2].~facet_0)(v91, 10);
                std::locale::~locale((std::locale *)&v177);
                std::ostream::put();
                std::ostream::flush();
                if (SHIBYTE(v162.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v162.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v163.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v163.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v164.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v164.__r_.__value_.__l.__data_);
                }
                break;
              case 18:
                std::to_string(&v177, v47);
                int v58 = std::string::insert(&v177, 0, "_Counter", 8uLL);
                long long v59 = *(_OWORD *)&v58->__r_.__value_.__l.__data_;
                v164.__r_.__value_.__r.__words[2] = v58->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v164.__r_.__value_.__l.__data_ = v59;
                v58->__r_.__value_.__l.__size_ = 0;
                v58->__r_.__value_.__r.__words[2] = 0;
                v58->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v177.__r_.__value_.__l.__data_);
                }
                uint64_t v60 = *(void *)(v176[0] + *(void *)(v48 + 8 * v45) + 8);
                unint64_t v61 = (char *)FieldKindToString(v165);
                std::string::basic_string[abi:ne180100]<0>(&v177, v61);
                if ((v164.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  char v62 = &v164;
                }
                else {
                  char v62 = (std::string *)v164.__r_.__value_.__r.__words[0];
                }
                if ((v164.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  std::string::size_type v63 = HIBYTE(v164.__r_.__value_.__r.__words[2]);
                }
                else {
                  std::string::size_type v63 = v164.__r_.__value_.__l.__size_;
                }
                uint64_t v64 = std::string::append(&v177, (const std::string::value_type *)v62, v63);
                long long v65 = *(_OWORD *)&v64->__r_.__value_.__l.__data_;
                v163.__r_.__value_.__r.__words[2] = v64->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v163.__r_.__value_.__l.__data_ = v65;
                v64->__r_.__value_.__l.__size_ = 0;
                v64->__r_.__value_.__r.__words[2] = 0;
                v64->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v177.__r_.__value_.__l.__data_);
                }
                ZinIrCompilerParamsUtils::PerfTracerMetricToString(v60, &v177);
                if (!v178) {
                  std::__throw_bad_optional_access[abi:ne180100]();
                }
                std::string v162 = v177;
                uint64_t v66 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"\t", 1);
                if ((v163.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  uint64_t v67 = &v163;
                }
                else {
                  uint64_t v67 = (std::string *)v163.__r_.__value_.__r.__words[0];
                }
                if ((v163.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  std::string::size_type v68 = HIBYTE(v163.__r_.__value_.__r.__words[2]);
                }
                else {
                  std::string::size_type v68 = v163.__r_.__value_.__l.__size_;
                }
                uint64_t v69 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v66, (uint64_t)v67, v68);
                uint64_t v70 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v69, (uint64_t)": ", 2);
                if ((v162.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  BOOL v71 = &v162;
                }
                else {
                  BOOL v71 = (std::string *)v162.__r_.__value_.__r.__words[0];
                }
                if ((v162.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  std::string::size_type v72 = HIBYTE(v162.__r_.__value_.__r.__words[2]);
                }
                else {
                  std::string::size_type v72 = v162.__r_.__value_.__l.__size_;
                }
                uint64_t v73 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v70, (uint64_t)v71, v72);
                std::ios_base::getloc((const std::ios_base *)((char *)v73 + *(void *)(*v73 - 24)));
                uint64_t v74 = std::locale::use_facet((const std::locale *)&v177, v28);
                ((void (*)(const std::locale::facet *, uint64_t))v74->__vftable[2].~facet_0)(v74, 10);
                std::locale::~locale((std::locale *)&v177);
                std::ostream::put();
                std::ostream::flush();
                if (SHIBYTE(v162.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v162.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v163.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v163.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v164.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v164.__r_.__value_.__l.__data_);
                }
                ++v47;
                break;
              case 19:
                std::to_string(&v164, v46);
                uint64_t v92 = std::string::insert(&v164, 0, "_Counter", 8uLL);
                long long v93 = *(_OWORD *)&v92->__r_.__value_.__l.__data_;
                v177.__r_.__value_.__r.__words[2] = v92->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v177.__r_.__value_.__l.__data_ = v93;
                v92->__r_.__value_.__l.__size_ = 0;
                v92->__r_.__value_.__r.__words[2] = 0;
                v92->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(v164.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v164.__r_.__value_.__l.__data_);
                }
                uint64_t v94 = (char *)FieldKindToString(v165);
                std::string::basic_string[abi:ne180100]<0>(&v163, v94);
                if ((v177.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  BOOL v95 = &v177;
                }
                else {
                  BOOL v95 = (std::string *)v177.__r_.__value_.__r.__words[0];
                }
                if ((v177.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  std::string::size_type v96 = HIBYTE(v177.__r_.__value_.__r.__words[2]);
                }
                else {
                  std::string::size_type v96 = v177.__r_.__value_.__l.__size_;
                }
                uint64_t v97 = std::string::append(&v163, (const std::string::value_type *)v95, v96);
                long long v98 = *(_OWORD *)&v97->__r_.__value_.__l.__data_;
                v164.__r_.__value_.__r.__words[2] = v97->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v164.__r_.__value_.__l.__data_ = v98;
                v97->__r_.__value_.__l.__size_ = 0;
                v97->__r_.__value_.__r.__words[2] = 0;
                v97->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(v163.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v163.__r_.__value_.__l.__data_);
                }
                uint64_t v99 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"\t", 1);
                if ((v164.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  uint64_t v100 = &v164;
                }
                else {
                  uint64_t v100 = (std::string *)v164.__r_.__value_.__r.__words[0];
                }
                if ((v164.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  std::string::size_type v101 = HIBYTE(v164.__r_.__value_.__r.__words[2]);
                }
                else {
                  std::string::size_type v101 = v164.__r_.__value_.__l.__size_;
                }
                uint64_t v102 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v99, (uint64_t)v100, v101);
                std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v102, (uint64_t)": ", 2);
                BOOL v103 = (void *)std::ostream::operator<<();
                std::ios_base::getloc((const std::ios_base *)((char *)v103 + *(void *)(*v103 - 24)));
                uint64_t v104 = std::locale::use_facet((const std::locale *)&v163, v28);
                ((void (*)(const std::locale::facet *, uint64_t))v104->__vftable[2].~facet_0)(v104, 10);
                std::locale::~locale((std::locale *)&v163);
                std::ostream::put();
                std::ostream::flush();
                if (SHIBYTE(v164.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v164.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v177.__r_.__value_.__l.__data_);
                }
                ++v46;
                break;
              default:
                uint64_t v105 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"\t", 1);
                uint64_t v106 = FieldKindToString(v165);
                size_t v107 = strlen(v106);
                uint64_t v108 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v105, (uint64_t)v106, v107);
                std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v108, (uint64_t)":  ", 3);
                uint64_t v109 = (void *)std::ostream::operator<<();
                std::ios_base::getloc((const std::ios_base *)((char *)v109 + *(void *)(*v109 - 24)));
                uint64_t v110 = std::locale::use_facet((const std::locale *)&v177, v28);
                ((void (*)(const std::locale::facet *, uint64_t))v110->__vftable[2].~facet_0)(v110, 10);
                std::locale::~locale((std::locale *)&v177);
                std::ostream::put();
                std::ostream::flush();
                break;
            }
            if (++v45 >= (unint64_t)v166) {
              goto LABEL_122;
            }
          }
          BOOL v127 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v127) {
            ZinDumpAnalytics(v127, v128, v129, v130, v131, v132, v133, v134);
          }
          return 0;
        }
LABEL_123:
        BOOL result = 1;
        if (++v161 >= (unint64_t)v172) {
          return result;
        }
      }
      uint64_t v32 = 0;
      uint64_t v33 = v176[0] + *((void *)&__p + 1);
      while (ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsLayerInfo>(v176, *(void *)(v33 + 8 * v32), (uint64_t)&v177))
      {
        uint64_t v34 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"  Layer Name: ", 14);
        size_t v35 = strlen((const char *)&v177);
        uint64_t v36 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v34, (uint64_t)&v177, v35);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)"\t", 1);
        BOOL v37 = (void *)std::ostream::operator<<();
        std::ios_base::getloc((const std::ios_base *)((char *)v37 + *(void *)(*v37 - 24)));
        uint64_t v38 = std::locale::use_facet((const std::locale *)&v164, v28);
        ((void (*)(const std::locale::facet *, uint64_t))v38->__vftable[2].~facet_0)(v38, 10);
        std::locale::~locale((std::locale *)&v164);
        std::ostream::put();
        std::ostream::flush();
        if (++v32 >= (unint64_t)__p)
        {
          uint64_t v31 = v176[0];
          goto LABEL_26;
        }
      }
      BOOL v135 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v135) {
        ZinDumpAnalytics(v135, v136, v137, v138, v139, v140, v141, v142);
      }
    }
  }
  else
  {
    BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    ZinDumpAnalytics(result, v112, v113, v114, v115, v116, v117, v118);
  }
  return 0;
}

void sub_2120B4BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,std::locale a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,std::locale a51,uint64_t a52,int a53,__int16 a54,char a55,char a56,char a57)
{
}

BOOL ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(void *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v3 = a2 + 48;
  unint64_t v4 = a1[1];
  if (a2 + 48 > v4)
  {
    BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v8) {
      ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    uint64_t v5 = (long long *)(*a1 + a2);
    long long v6 = *v5;
    long long v7 = v5[2];
    a3[1] = v5[1];
    a3[2] = v7;
    *a3 = v6;
  }
  return v3 <= v4;
}

BOOL ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsData>(void *a1, uint64_t a2, void *a3)
{
  unint64_t v3 = a2 + 8;
  unint64_t v4 = a1[1];
  if (a2 + 8 > v4)
  {
    BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v5) {
      ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    *a3 = *(void *)(*a1 + a2);
  }
  return v3 <= v4;
}

const char *FieldKindToString(unsigned int a1)
{
  if (a1 > 0x13) {
    return "Invalid";
  }
  else {
    return off_26418E538[a1];
  }
}

BOOL ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsGroupInfo>(void *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v3 = a2 + 32;
  unint64_t v4 = a1[1];
  if (a2 + 32 > v4)
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    BOOL v5 = (_OWORD *)(*a1 + a2);
    long long v6 = v5[1];
    *a3 = *v5;
    a3[1] = v6;
  }
  return v3 <= v4;
}

BOOL ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsLayerInfo>(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a2 + 132;
  unint64_t v4 = a1[1];
  if (a2 + 132 > v4)
  {
    BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v12) {
      ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  else
  {
    uint64_t v5 = *a1 + a2;
    *(_OWORD *)a3 = *(_OWORD *)v5;
    long long v6 = *(_OWORD *)(v5 + 16);
    long long v7 = *(_OWORD *)(v5 + 32);
    long long v8 = *(_OWORD *)(v5 + 64);
    *(_OWORD *)(a3 + 48) = *(_OWORD *)(v5 + 48);
    *(_OWORD *)(a3 + 64) = v8;
    *(_OWORD *)(a3 + 16) = v6;
    *(_OWORD *)(a3 + 32) = v7;
    long long v9 = *(_OWORD *)(v5 + 80);
    long long v10 = *(_OWORD *)(v5 + 96);
    long long v11 = *(_OWORD *)(v5 + 112);
    *(_DWORD *)(a3 + 128) = *(_DWORD *)(v5 + 128);
    *(_OWORD *)(a3 + 96) = v10;
    *(_OWORD *)(a3 + 112) = v11;
    *(_OWORD *)(a3 + 8pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v9;
  }
  return v3 <= v4;
}

BOOL ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsTaskInfo>(void *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v3 = a2 + 16;
  unint64_t v4 = a1[1];
  if (a2 + 16 > v4)
  {
    BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v5) {
      ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    *a3 = *(_OWORD *)(*a1 + a2);
  }
  return v3 <= v4;
}

uint64_t ZinDumpAnalyticsInJSON(const void *a1, uint64_t a2, const char *a3)
{
  v175[19] = *MEMORY[0x263EF8340];
  BOOL v5 = v175;
  uint64_t v6 = MEMORY[0x263F8C310] + 64;
  v175[0] = MEMORY[0x263F8C310] + 64;
  uint64_t v7 = (uint64_t *)MEMORY[0x263F8C2B0];
  uint64_t v8 = *(void *)(MEMORY[0x263F8C2B0] + 16);
  uint64_t v173 = *(void *)(MEMORY[0x263F8C2B0] + 8);
  *(void *)&v174[*(void *)(v173 - 24) - 8] = v8;
  uint64_t v9 = (std::ios_base *)&v174[*(void *)(v173 - 24) - 8];
  std::ios_base::init(v9, v174);
  uint64_t v10 = MEMORY[0x263F8C310] + 24;
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  uint64_t v173 = v10;
  v175[0] = v6;
  MEMORY[0x21667E4B0](v174);
  std::ofstream::open();
  v161[0] = 0;
  int v162 = 0;
  std::string v163 = &v173;
  uint64_t v164 = 0;
  LOBYTE(v165) = 1;
  *((void *)&v165 + 1) = 4;
  LOBYTE(v166) = 0;
  v160[0] = a1;
  v160[1] = a2;
  if (!ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(v160, 0, &v155))
  {
    BOOL v58 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v58) {
      ZinDumpAnalyticsInJSON(v58, v59, v60, v61, v62, v63, v64, v65);
    }
LABEL_101:
    uint64_t v57 = 0;
    goto LABEL_102;
  }
  minijson::writer::write_helper<unsigned int,minijson::default_value_writer<unsigned int,void>>((uint64_t)v161, "MajorVersion");
  minijson::writer::write_helper<unsigned int,minijson::default_value_writer<unsigned int,void>>((uint64_t)v161, "MinorVersion");
  minijson::writer::write_helper<unsigned int,minijson::default_value_writer<unsigned int,void>>((uint64_t)v161, "CpuType");
  minijson::writer::write_helper<unsigned int,minijson::default_value_writer<unsigned int,void>>((uint64_t)v161, "ProcId");
  minijson::writer::next_field((minijson::writer *)v161);
  minijson::writer::write_field_name((minijson::writer *)v161, "NetworkAnalytics");
  long long v153 = v165;
  uint64_t v154 = v166;
  v149[0] = 0;
  int v150 = 0;
  BOOL v151 = v163;
  uint64_t v152 = v164 + 1;
  if (v158)
  {
    uint64_t v11 = 0;
    uint64_t v12 = v160[0] + v159;
    while (1)
    {
      uint64_t v13 = *(void *)(v12 + 8 * v11);
      if (!ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsData>(v160, v13, &v139)) {
        break;
      }
      unsigned int v14 = v139;
      if (ANEAnalytics::IsVariableLengthString(v139))
      {
        std::vector<signed char>::vector(&__dst, HIDWORD(v139));
        memcpy(__dst, (const void *)(v13 + v160[0] + 8), HIDWORD(v139));
        std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<signed char *>,std::__wrap_iter<signed char *>>(&__p, (char *)__dst, v168, v168 - (unsigned char *)__dst);
        uint64_t v15 = (char *)FieldKindToString(v14);
        minijson::writer::write_helper<std::string,minijson::default_value_writer<std::string,void>>((uint64_t)v149, v15, (uint64_t)&__p);
        if (SHIBYTE(v146) < 0) {
          operator delete(__p);
        }
        if (__dst)
        {
          unsigned int v168 = (char *)__dst;
          operator delete(__dst);
        }
      }
      else
      {
        uint64_t v16 = (char *)FieldKindToString(v14);
        __dst = *(void **)(v160[0] + v13 + 8);
        minijson::writer::write_helper<unsigned long long,minijson::default_value_writer<unsigned long long,void>>((uint64_t)v149, v16);
      }
      if (++v11 >= (unint64_t)v158) {
        goto LABEL_12;
      }
    }
    BOOL v66 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v66) {
      ZinDumpAnalyticsInJSON(v66, v67, v68, v69, v70, v71, v72, v73);
    }
    goto LABEL_101;
  }
LABEL_12:
  minijson::writer::close((minijson::writer *)v149);
  minijson::writer::next_field((minijson::writer *)v161);
  minijson::writer::write_field_name((minijson::writer *)v161, "LayerAnalytics");
  long long v147 = v165;
  uint64_t v148 = v166;
  LOBYTE(__p) = 0;
  HIDWORD(__p) = 0;
  uint64_t v145 = v163;
  uint64_t v146 = v164 + 1;
  minijson::writer::next_field((minijson::writer *)&__p);
  minijson::writer::write_field_name((minijson::writer *)&__p, "Groups");
  long long v142 = v147;
  uint64_t v143 = v148;
  LOBYTE(v139) = 1;
  HIDWORD(v139) = 0;
  __n_4 = v145;
  uint64_t v141 = v146 + 1;
  if (v156)
  {
    uint64_t v17 = 0;
    uint64_t v110 = v160[0] + v157;
    while (1)
    {
      minijson::writer::next_field((minijson::writer *)&v139);
      long long v137 = v142;
      uint64_t v138 = v143;
      v133[0] = 0;
      int v134 = 0;
      BOOL v135 = __n_4;
      uint64_t v136 = v141 + 1;
      if (!ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsGroupInfo>(v160, *(void *)(v110 + 8 * v17), &v130))
      {
        BOOL v99 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v99) {
          ZinDumpAnalyticsInJSON(v99, v100, v101, v102, v103, v104, v105, v106);
        }
        goto LABEL_101;
      }
      uint64_t v108 = v17;
      uint64_t v18 = *((void *)&v130 + 1);
      uint64_t v19 = v160[0];
      minijson::writer::next_field((minijson::writer *)v133);
      minijson::writer::write_field_name((minijson::writer *)v133, "Layers");
      long long v128 = v137;
      uint64_t v129 = v138;
      v124[0] = 1;
      int v125 = 0;
      uint64_t v126 = v135;
      uint64_t v127 = v136 + 1;
      if (v130) {
        break;
      }
LABEL_19:
      minijson::writer::close((minijson::writer *)v124);
      minijson::writer::next_field((minijson::writer *)v133);
      minijson::writer::write_field_name((minijson::writer *)v133, "Tasks");
      long long v170 = v137;
      uint64_t v171 = v138;
      LOBYTE(__dst) = 1;
      HIDWORD(__dst) = 0;
      unsigned int v168 = (char *)v135;
      uint64_t v169 = v136 + 1;
      if (v131)
      {
        unint64_t v22 = 0;
        uint64_t v23 = v160[0] + v132;
        uint64_t v109 = v5;
        uint64_t v107 = v160[0] + v132;
        while (1)
        {
          if (!ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsTaskInfo>(v160, *(void *)(v23 + 8 * v22), &v117))
          {
            BOOL v91 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v91) {
              ZinDumpAnalyticsInJSON(v91, v92, v93, v94, v95, v96, v97, v98);
            }
            goto LABEL_101;
          }
          uint64_t v24 = *((void *)&v117 + 1);
          uint64_t v25 = v160[0];
          minijson::writer::next_field((minijson::writer *)&__dst);
          long long v122 = v170;
          uint64_t v123 = v171;
          v118[0] = 0;
          int v119 = 0;
          uint64_t v120 = v168;
          uint64_t v121 = v169 + 1;
          if (v117) {
            break;
          }
LABEL_88:
          minijson::writer::close((minijson::writer *)v118);
          ++v22;
          BOOL v5 = v109;
          uint64_t v7 = (uint64_t *)MEMORY[0x263F8C2B0];
          uint64_t v23 = v107;
          if (v22 >= v131) {
            goto LABEL_89;
          }
        }
        uint64_t v26 = 0;
        int v27 = 0;
        int v28 = 0;
        uint64_t v29 = v25 + v24;
        while (ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsData>(v160, *(void *)(v29 + 8 * v26), &v116))
        {
          switch((int)v116)
          {
            case 11:
              v115.__r_.__value_.__s.__data_[0] = *(unsigned char *)(v160[0] + *(void *)(v29 + 8 * v26) + 8) & 1;
              minijson::writer::write_helper<BOOL,minijson::default_value_writer<BOOL,void>>((minijson::writer *)v118, "ViolatesMaxLatency", (unsigned __int8 *)&v115);
              break;
            case 17:
              uint64_t v39 = *(void *)(v160[0] + *(void *)(v29 + 8 * v26) + 8);
              uint64_t v40 = (char *)FieldKindToString(0x11u);
              std::string::basic_string[abi:ne180100]<0>(&v114, v40);
              uint64_t v41 = std::string::append(&v114, "_Counter", 8uLL);
              long long v42 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
              v111.__r_.__value_.__r.__words[2] = v41->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v111.__r_.__value_.__l.__data_ = v42;
              v41->__r_.__value_.__l.__size_ = 0;
              v41->__r_.__value_.__r.__words[2] = 0;
              v41->__r_.__value_.__r.__words[0] = 0;
              std::to_string(&v113, v28);
              if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                uint64_t v43 = &v113;
              }
              else {
                uint64_t v43 = (std::string *)v113.__r_.__value_.__r.__words[0];
              }
              if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type size = HIBYTE(v113.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type size = v113.__r_.__value_.__l.__size_;
              }
              uint64_t v45 = std::string::append(&v111, (const std::string::value_type *)v43, size);
              long long v46 = *(_OWORD *)&v45->__r_.__value_.__l.__data_;
              v115.__r_.__value_.__r.__words[2] = v45->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v115.__r_.__value_.__l.__data_ = v46;
              v45->__r_.__value_.__l.__size_ = 0;
              v45->__r_.__value_.__r.__words[2] = 0;
              v45->__r_.__value_.__r.__words[0] = 0;
              if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v113.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v111.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v114.__r_.__value_.__l.__data_);
              }
              ZinIrCompilerParamsUtils::PerfTracerCategoryToString(v39, &v111);
              if (!v112) {
                std::__throw_bad_optional_access[abi:ne180100]();
              }
              std::string v114 = v111;
              if ((v115.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                int v47 = &v115;
              }
              else {
                int v47 = (std::string *)v115.__r_.__value_.__r.__words[0];
              }
              minijson::writer::write_helper<std::string,minijson::default_value_writer<std::string,void>>((uint64_t)v118, (char *)v47, (uint64_t)&v114);
              if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v114.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v115.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v115.__r_.__value_.__l.__data_);
              }
              break;
            case 18:
              uint64_t v30 = *(void *)(v160[0] + *(void *)(v29 + 8 * v26) + 8);
              uint64_t v31 = (char *)FieldKindToString(0x12u);
              std::string::basic_string[abi:ne180100]<0>(&v114, v31);
              uint64_t v32 = std::string::append(&v114, "_Counter", 8uLL);
              long long v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
              v111.__r_.__value_.__r.__words[2] = v32->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v111.__r_.__value_.__l.__data_ = v33;
              v32->__r_.__value_.__l.__size_ = 0;
              v32->__r_.__value_.__r.__words[2] = 0;
              v32->__r_.__value_.__r.__words[0] = 0;
              std::to_string(&v113, v28);
              if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                uint64_t v34 = &v113;
              }
              else {
                uint64_t v34 = (std::string *)v113.__r_.__value_.__r.__words[0];
              }
              if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type v35 = HIBYTE(v113.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type v35 = v113.__r_.__value_.__l.__size_;
              }
              uint64_t v36 = std::string::append(&v111, (const std::string::value_type *)v34, v35);
              long long v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
              v115.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v115.__r_.__value_.__l.__data_ = v37;
              v36->__r_.__value_.__l.__size_ = 0;
              v36->__r_.__value_.__r.__words[2] = 0;
              v36->__r_.__value_.__r.__words[0] = 0;
              if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v113.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v111.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v114.__r_.__value_.__l.__data_);
              }
              ZinIrCompilerParamsUtils::PerfTracerMetricToString(v30, &v111);
              if (!v112) {
                std::__throw_bad_optional_access[abi:ne180100]();
              }
              std::string v114 = v111;
              if ((v115.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                uint64_t v38 = &v115;
              }
              else {
                uint64_t v38 = (std::string *)v115.__r_.__value_.__r.__words[0];
              }
              minijson::writer::write_helper<std::string,minijson::default_value_writer<std::string,void>>((uint64_t)v118, (char *)v38, (uint64_t)&v114);
              if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v114.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v115.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v115.__r_.__value_.__l.__data_);
              }
              ++v28;
              break;
            case 19:
              uint64_t v48 = (char *)FieldKindToString(0x13u);
              std::string::basic_string[abi:ne180100]<0>(&v114, v48);
              uint64_t v49 = std::string::append(&v114, "_Counter", 8uLL);
              long long v50 = *(_OWORD *)&v49->__r_.__value_.__l.__data_;
              v115.__r_.__value_.__r.__words[2] = v49->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v115.__r_.__value_.__l.__data_ = v50;
              v49->__r_.__value_.__l.__size_ = 0;
              v49->__r_.__value_.__r.__words[2] = 0;
              v49->__r_.__value_.__r.__words[0] = 0;
              std::to_string(&v113, v27);
              if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                size_t v51 = &v113;
              }
              else {
                size_t v51 = (std::string *)v113.__r_.__value_.__r.__words[0];
              }
              if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type v52 = HIBYTE(v113.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type v52 = v113.__r_.__value_.__l.__size_;
              }
              uint64_t v53 = std::string::append(&v115, (const std::string::value_type *)v51, v52);
              long long v54 = *(_OWORD *)&v53->__r_.__value_.__l.__data_;
              v111.__r_.__value_.__r.__words[2] = v53->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v111.__r_.__value_.__l.__data_ = v54;
              v53->__r_.__value_.__l.__size_ = 0;
              v53->__r_.__value_.__r.__words[2] = 0;
              v53->__r_.__value_.__r.__words[0] = 0;
              if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v113.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v115.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v115.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v114.__r_.__value_.__l.__data_);
              }
              if ((v111.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                uint64_t v55 = &v111;
              }
              else {
                uint64_t v55 = (std::string *)v111.__r_.__value_.__r.__words[0];
              }
              minijson::writer::write_helper<unsigned long long,minijson::default_value_writer<unsigned long long,void>>((uint64_t)v118, (char *)v55);
              if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v111.__r_.__value_.__l.__data_);
              }
              ++v27;
              break;
            default:
              int v56 = (char *)FieldKindToString(v116);
              v111.__r_.__value_.__r.__words[0] = *(void *)(v160[0] + *(void *)(v29 + 8 * v26) + 8);
              minijson::writer::write_helper<unsigned long long,minijson::default_value_writer<unsigned long long,void>>((uint64_t)v118, v56);
              break;
          }
          if (++v26 >= (unint64_t)v117) {
            goto LABEL_88;
          }
        }
        BOOL v74 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        BOOL v5 = v109;
        uint64_t v7 = (uint64_t *)MEMORY[0x263F8C2B0];
        if (v74) {
          ZinDumpAnalyticsInJSON(v74, v75, v76, v77, v78, v79, v80, v81);
        }
        goto LABEL_101;
      }
LABEL_89:
      minijson::writer::close((minijson::writer *)&__dst);
      minijson::writer::close((minijson::writer *)v133);
      uint64_t v17 = v108 + 1;
      if (v108 + 1 >= (unint64_t)v156) {
        goto LABEL_90;
      }
    }
    uint64_t v20 = 0;
    uint64_t v21 = v19 + v18;
    while (ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsLayerInfo>(v160, *(void *)(v21 + 8 * v20), (uint64_t)&__dst))
    {
      minijson::writer::next_field((minijson::writer *)v124);
      long long v122 = v128;
      uint64_t v123 = v129;
      v118[0] = 0;
      int v119 = 0;
      uint64_t v120 = (char *)v126;
      uint64_t v121 = v127 + 1;
      minijson::writer::write_helper<char [64],minijson::default_value_writer<char [64],void>>((uint64_t)v118, "Name", (unsigned __int8 *)&__dst);
      minijson::writer::write_helper<float,minijson::default_value_writer<float,void>>((minijson::writer *)v118, "Weight", &v172);
      minijson::writer::close((minijson::writer *)v118);
      if (++v20 >= (unint64_t)v130) {
        goto LABEL_19;
      }
    }
    BOOL v82 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v82) {
      ZinDumpAnalyticsInJSON(v82, v83, v84, v85, v86, v87, v88, v89);
    }
    goto LABEL_101;
  }
LABEL_90:
  minijson::writer::close((minijson::writer *)&v139);
  minijson::writer::close((minijson::writer *)&__p);
  minijson::writer::close((minijson::writer *)v161);
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)&v174[*(void *)(v173 - 24) - 8], *(_DWORD *)&v174[*(void *)(v173 - 24) + 24] | 4);
  }
  uint64_t v57 = 1;
LABEL_102:
  uint64_t v173 = *v7;
  *(void *)&v174[*(void *)(v173 - 24) - 8] = v7[3];
  MEMORY[0x21667E4C0](v174);
  std::ostream::~ostream();
  MEMORY[0x21667E610](v5);
  return v57;
}

void sub_2120B5C88(_Unwind_Exception *a1)
{
}

minijson::writer *minijson::writer::close(minijson::writer *this)
{
  if (*((_DWORD *)this + 1) != 2)
  {
    uint64_t v1 = this;
    if (!*((_DWORD *)v1 + 1)) {
      minijson::writer::write_opening_bracket(v1);
    }
    this = (minijson::writer *)minijson::writer::write_closing_bracket(v1);
    *((_DWORD *)v1 + 1) = 2;
  }
  return this;
}

void *std::ofstream::~ofstream(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B0];
  uint64_t v3 = *MEMORY[0x263F8C2B0];
  *a1 = *MEMORY[0x263F8C2B0];
  *(void *)((char *)a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  MEMORY[0x21667E4C0](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x21667E610](a1 + 52);
  return a1;
}

uint64_t ZinComputeAnalyticsBufferSize(uint64_t a1, const unsigned __int8 *a2, unsigned int a3, int a4, uint64_t a5)
{
  if ((a1 & 0x80000000) == 0 && a2 && a3)
  {
    ANEDebugInfo::DebugInfoParser::DebugInfoParser((ANEDebugInfo::DebugInfoParser *)v44, a2, a3);
    ANEDebugInfo::DebugInfoParser::Parse((ANEDebugInfo::DebugInfoParser *)v44);
    ANEDebugInfo::DebugInfoParser::GetCompilationUnit((ANEDebugInfo::DebugInfoParser *)v44, a1, (uint64_t)&v37);
    if ((_BYTE)v37)
    {
      Mode = (unsigned char *)ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v38);
      int v9 = Mode[1] + a4;
      if (*Mode) {
        int v10 = v9 + 5;
      }
      else {
        int v10 = v9 + 1;
      }
      ANEDebugInfo::DebugInfoInMem::GetString((ANEDebugInfo::DebugInfoInMem *)v38, v41, &v36);
      if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
      {
        int v11 = v36.__r_.__value_.__r.__words[1];
        operator delete(v36.__r_.__value_.__l.__data_);
      }
      else
      {
        int v11 = HIBYTE(v36.__r_.__value_.__r.__words[2]);
      }
      int v28 = (unsigned char *)ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v38);
      LODWORD(v29) = ((v11 + 7) & 0xFFFFFFF8) + 16 * v10 + 48;
      uint64_t v30 = v28[1];
      if (*v28) {
        uint64_t v31 = v30 + 5;
      }
      else {
        uint64_t v31 = v30 + 1;
      }
      uint64_t v32 = v31 | 8;
      if (!v28[2]) {
        uint64_t v32 = v31;
      }
      long long v33 = v39;
      if (v39 != v40)
      {
        uint64_t v34 = 24 * (v32 + a5) + 24;
        do
        {
          uint64_t v29 = v29
              + 48 * ((v33[1] - *v33) >> 2)
              + 40
              - 0x71C71C71C71C71C7 * ((uint64_t)(v33[4] - v33[3]) >> 3) * v34;
          v33 += 6;
        }
        while (v33 != v40);
      }
      uint64_t v20 = v29;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ZinCreateAnalytics(a1, v21, v22, v23, v24, v25, v26, v27);
      }
      uint64_t v20 = 0;
    }
    v36.__r_.__value_.__r.__words[0] = (std::string::size_type)&v43;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v36);
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v42);
    v36.__r_.__value_.__r.__words[0] = (std::string::size_type)&v39;
    std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)&v36);
    long long v37 = (void **)&v47;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v37);
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v46);
    long long v37 = (void **)&v45;
    std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v37);
    long long v37 = (void **)v44;
    std::vector<ANEDebugInfo::DebugInfoInMem>::__destroy_vector::operator()[abi:ne180100](&v37);
  }
  else
  {
    BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v12) {
      ZinComputeAnalyticsBufferSize(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    return 0;
  }
  return v20;
}

void sub_2120B6194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35)
{
}

uint64_t ZinAnalyticsGetPerfCounterInfo(const unsigned __int8 *a1, unsigned int a2, char (*a3)[128])
{
  *(_OWORD *)&(*a3)[480] = 0u;
  *(_OWORD *)&(*a3)[496] = 0u;
  *(_OWORD *)&(*a3)[448] = 0u;
  *(_OWORD *)&(*a3)[464] = 0u;
  *(_OWORD *)&(*a3)[416] = 0u;
  *(_OWORD *)&(*a3)[432] = 0u;
  *(_OWORD *)&(*a3)[384] = 0u;
  *(_OWORD *)&(*a3)[400] = 0u;
  *(_OWORD *)&(*a3)[352] = 0u;
  *(_OWORD *)&(*a3)[368] = 0u;
  *(_OWORD *)&(*a3)[320] = 0u;
  *(_OWORD *)&(*a3)[336] = 0u;
  *(_OWORD *)&(*a3)[288] = 0u;
  *(_OWORD *)&(*a3)[304] = 0u;
  *(_OWORD *)&(*a3)[256] = 0u;
  *(_OWORD *)&(*a3)[272] = 0u;
  *(_OWORD *)&(*a3)[224] = 0u;
  *(_OWORD *)&(*a3)[240] = 0u;
  *(_OWORD *)&(*a3)[192] = 0u;
  *(_OWORD *)&(*a3)[208] = 0u;
  *(_OWORD *)&(*a3)[160] = 0u;
  *(_OWORD *)&(*a3)[176] = 0u;
  *(_OWORD *)&(*a3)[128] = 0u;
  *(_OWORD *)&(*a3)[144] = 0u;
  *(_OWORD *)&(*a3)[96] = 0u;
  *(_OWORD *)&(*a3)[112] = 0u;
  *(_OWORD *)&(*a3)[64] = 0u;
  *(_OWORD *)&(*a3)[80] = 0u;
  *(_OWORD *)&(*a3)[32] = 0u;
  *(_OWORD *)&(*a3)[48] = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)&(*a3)[16] = 0u;
  ANEDebugInfo::DebugInfoParser::DebugInfoParser((ANEDebugInfo::DebugInfoParser *)v53, a1, a2);
  if (ANEDebugInfo::DebugInfoParser::Parse((ANEDebugInfo::DebugInfoParser *)v53))
  {
    unint64_t v4 = 0;
    BOOL v5 = 0;
    while (1)
    {
      ANEDebugInfo::DebugInfoParser::GetCompilationUnit((ANEDebugInfo::DebugInfoParser *)v53, v4, (uint64_t)&v36);
      int v6 = v36;
      *(void *)&v23[0] = &v49;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v23);
      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v44);
      *(void *)&v23[0] = &v40;
      std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)v23);
      if (!v6) {
        break;
      }
      ANEDebugInfo::DebugInfoParser::GetCompilationUnit((ANEDebugInfo::DebugInfoParser *)v53, v4, (uint64_t)&v36);
      v23[0] = v37;
      v23[1] = v38;
      uint64_t v24 = v39;
      long long v25 = v40;
      uint64_t v7 = v41;
      uint64_t v8 = v44;
      uint64_t v41 = 0;
      long long v40 = 0uLL;
      long long v27 = v42;
      long long v28 = v43;
      uint64_t v26 = v7;
      unint64_t v9 = v45;
      uint64_t v44 = 0;
      unint64_t v45 = 0;
      v29[0] = v8;
      v29[1] = v9;
      v30[0] = v46;
      v30[1] = v47;
      int v31 = v48;
      if (v47)
      {
        unint64_t v10 = *(void *)(v46 + 8);
        if ((v9 & (v9 - 1)) != 0)
        {
          if (v10 >= v9) {
            v10 %= v9;
          }
        }
        else
        {
          v10 &= v9 - 1;
        }
        *(void *)(v8 + 8 * v1pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v30;
        uint64_t v46 = 0;
        uint64_t v47 = 0;
      }
      long long v32 = v49;
      uint64_t v33 = v50;
      uint64_t v50 = 0;
      long long v49 = 0uLL;
      __int16 v34 = v51;
      char v35 = v52;
      v57[0] = (void **)&v49;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v57);
      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v44);
      v57[0] = (void **)&v40;
      std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](v57);
      uint64_t v11 = *((void *)&v25 + 1);
      for (uint64_t i = v25; ; i += 48)
      {
        if (i == v11)
        {
          unsigned int v20 = 1;
          goto LABEL_29;
        }
        uint64_t v13 = *(void *)(i + 24);
        if (*(void *)(i + 32) != v13)
        {
          uint64_t v14 = 0;
          uint64_t v15 = (int *)(v13 + 44);
          do
          {
            uint64_t v16 = (const char *)*(&PerfTracerCategoryToString(int)::perf_tracer_category_to_string + *(v15 - 1));
            if (*v16)
            {
              uint64_t v17 = (const char *)*(&PerfTracerMetricToString(int)::perf_tracer_metric_to_string + *v15);
              if (*v17)
              {
                if (strlcat(&(*a3)[v14], v16, 0x80uLL) > 0x7F
                  || strlcat(&(*a3)[v14], ":", 0x80uLL) > 0x7F
                  || strlcat(&(*a3)[v14], v17, 0x80uLL) > 0x7F)
                {
                  unsigned int v20 = 0;
                  char v22 = 0;
                  goto LABEL_29;
                }
              }
            }
            v15 += 2;
            v14 += 128;
          }
          while (v14 != 512);
          for (uint64_t j = 0; j != 4; ++j)
          {
            while (v5)
            {
              ++j;
              BOOL v5 = 1;
              if (j == 4)
              {
                unsigned int v20 = 0;
                char v22 = 1;
                goto LABEL_29;
              }
            }
            int v19 = (*a3)[128 * j];
            BOOL v5 = (*a3)[128 * j] != 0;
          }
          BOOL v5 = 0;
          if (v19) {
            break;
          }
        }
      }
      char v22 = 1;
      unsigned int v20 = 0;
      BOOL v5 = 1;
LABEL_29:
      v4 += v20;
      std::string v36 = (void **)&v32;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v36);
      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v29);
      std::string v36 = (void **)&v25;
      std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v36);
      if ((v20 & 1) == 0) {
        goto LABEL_33;
      }
    }
  }
  char v22 = 0;
LABEL_33:
  std::string v36 = (void **)&v56;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v36);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v55);
  std::string v36 = (void **)&v54;
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v36);
  std::string v36 = (void **)v53;
  std::vector<ANEDebugInfo::DebugInfoInMem>::__destroy_vector::operator()[abi:ne180100](&v36);
  return v22 & 1;
}

void sub_2120B65C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  ANEDebugInfo::DebugInfoParser::~DebugInfoParser(&a66);
  _Unwind_Resume(a1);
}

void ANEDebugInfo::DebugInfoInMem::~DebugInfoInMem(ANEDebugInfo::DebugInfoInMem *this)
{
  uint64_t v2 = (void **)((char *)this + 136);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)this + 96);
  uint64_t v2 = (void **)((char *)this + 40);
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v2);
}

void *MemPool::alloc<_AnalyticsProcedureInfo>(uint64_t a1, int a2)
{
  size_t v2 = (48 * a2);
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  size_t v5 = *(void *)a1 + v2;
  *(void *)a1 = v5;
  if (v5 <= v4 + *(void *)(a1 + 16))
  {
    if (*(unsigned char *)(a1 + 24)) {
      bzero(v3, v2);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      MemPool::alloc<_AnalyticsProcedureInfo>();
    }
    return 0;
  }
  return v3;
}

void *MemPool::alloc<unsigned long long>(uint64_t a1, int a2)
{
  size_t v2 = (8 * a2);
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  size_t v5 = *(void *)a1 + v2;
  *(void *)a1 = v5;
  if (v5 <= v4 + *(void *)(a1 + 16))
  {
    if (*(unsigned char *)(a1 + 24)) {
      bzero(v3, v2);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      MemPool::alloc<_AnalyticsProcedureInfo>();
    }
    return 0;
  }
  return v3;
}

unint64_t MemPool::get_offset<unsigned long long>(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = a1[1];
  if (v2 <= a2 && *a1 >= a2) {
    return a2 - v2;
  }
  BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v3) {
    MemPool::get_offset<unsigned long long>(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  return 0;
}

_DWORD *MemPool::alloc<_AnalyticsData,unsigned long long>(uint64_t a1)
{
  BOOL result = MemPool::alloc<unsigned long long>(a1, 1);
  if (result)
  {
    BOOL v3 = result;
    result[1] = 8;
    if (MemPool::alloc<signed char>(a1, 8)) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

void *MemPool::alloc<signed char>(uint64_t a1, int a2)
{
  size_t v2 = (a2 + 7) & 0xFFFFFFF8;
  BOOL v3 = *(void **)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  size_t v5 = *(void *)a1 + v2;
  *(void *)a1 = v5;
  if (v5 <= v4 + *(void *)(a1 + 16))
  {
    if (*(unsigned char *)(a1 + 24)) {
      bzero(v3, v2);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      MemPool::alloc<_AnalyticsProcedureInfo>();
    }
    return 0;
  }
  return v3;
}

void ANEDebugInfo::DebugInfoInMem::Group::~Group(ANEDebugInfo::DebugInfoInMem::Group *this)
{
  size_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    *((void *)this + 4) = v2;
    operator delete(v2);
  }
  BOOL v3 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v3;
    operator delete(v3);
  }
}

void *std::vector<ANEDebugInfo::DebugInfoInMem::Layer>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Layer*,ANEDebugInfo::DebugInfoInMem::Layer*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    BOOL result = std::vector<ANEDebugInfo::DebugInfoInMem::Layer>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2120B691C(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<ANEDebugInfo::DebugInfoInMem::Layer>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556) {
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  }
  BOOL result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Layer>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[12 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Layer>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(12 * a2);
}

void *std::vector<ANEDebugInfo::DebugInfoInMem::TD>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::TD*,ANEDebugInfo::DebugInfoInMem::TD*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    BOOL result = std::vector<ANEDebugInfo::DebugInfoInMem::TD>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2120B6A34(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<ANEDebugInfo::DebugInfoInMem::TD>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL) {
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  }
  BOOL result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::TD>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[72 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::TD>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(72 * a2);
}

void *MemPool::alloc<_AnalyticsGroupInfo>(uint64_t a1, int a2)
{
  size_t v2 = (32 * a2);
  BOOL v3 = *(void **)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  size_t v5 = *(void *)a1 + v2;
  *(void *)a1 = v5;
  if (v5 <= v4 + *(void *)(a1 + 16))
  {
    if (*(unsigned char *)(a1 + 24)) {
      bzero(v3, v2);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      MemPool::alloc<_AnalyticsProcedureInfo>();
    }
    return 0;
  }
  return v3;
}

void *MemPool::alloc<_AnalyticsLayerInfo>(uint64_t a1, int a2)
{
  size_t v2 = (132 * a2 + 7) & 0xFFFFFFF8;
  BOOL v3 = *(void **)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  size_t v5 = *(void *)a1 + v2;
  *(void *)a1 = v5;
  if (v5 <= v4 + *(void *)(a1 + 16))
  {
    if (*(unsigned char *)(a1 + 24)) {
      bzero(v3, v2);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      MemPool::alloc<_AnalyticsProcedureInfo>();
    }
    return 0;
  }
  return v3;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ANEHwDebugEventStruct>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void *MemPool::alloc<_AnalyticsTaskInfo>(uint64_t a1, int a2)
{
  size_t v2 = (16 * a2);
  BOOL v3 = *(void **)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  size_t v5 = *(void *)a1 + v2;
  *(void *)a1 = v5;
  if (v5 <= v4 + *(void *)(a1 + 16))
  {
    if (*(unsigned char *)(a1 + 24)) {
      bzero(v3, v2);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      MemPool::alloc<_AnalyticsProcedureInfo>();
    }
    return 0;
  }
  return v3;
}

_DWORD *MemPool::alloc<_AnalyticsData,unsigned char>(uint64_t a1)
{
  BOOL result = MemPool::alloc<unsigned long long>(a1, 1);
  if (result)
  {
    BOOL v3 = result;
    result[1] = 1;
    if (MemPool::alloc<signed char>(a1, 1)) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

void std::vector<ANEDebugInfo::DebugInfoInMem>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  size_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    size_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 168;
        std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,0>(v4);
      }
      while ((void *)v4 != v2);
      size_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,0>(uint64_t a1)
{
  size_t v2 = (void **)(a1 + 136);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(a1 + 96);
  size_t v2 = (void **)(a1 + 40);
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v2);
}

void *std::vector<signed char>::vector(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<signed char>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    size_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_2120B6E44(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<signed char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  }
  BOOL result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void *std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<signed char *>,std::__wrap_iter<signed char *>>(void *result, char *a2, char *a3, unint64_t a4)
{
  uint64_t v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    BOOL result = operator new(v8 + 1);
    v4[1] = a4;
    uint64_t v4[2] = v9 | 0x8000000000000000;
    void *v4 = result;
    uint64_t v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)uint64_t v4 = v10;
    uint64_t v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)uint64_t v4 = 0;
  return result;
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

void minijson::detail::anonymous namespace'::adjust_stream_settings(uint64_t *a1)
{
  size_t v2 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  BOOL v3 = std::locale::classic();
  std::ios_base::getloc(v2);
  std::ios_base::imbue(v2, v3);
  std::locale::~locale(&v9);
  rduint8_t buf = (std::locale *)v2->__rdbuf_;
  if (rdbuf)
  {
    (*((void (**)(std::locale *, const std::locale *))rdbuf->__locale_ + 2))(rdbuf, v3);
    size_t v5 = rdbuf + 1;
    std::locale::locale(&v8, v5);
    std::locale::operator=(v5, v3);
    std::locale::~locale(&v8);
  }
  std::locale::~locale(&v7);
  uint64_t v6 = *a1;
  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 8) &= 0xFFFFF3FF;
  *(_DWORD *)((char *)a1 + *(void *)(v6 - 24) + 8) = *(_DWORD *)((unsigned char *)a1 + *(void *)(v6 - 24) + 8) & 0xFFFFFFB5 | 2;
  *(uint64_t *)((char *)a1 + *(void *)(v6 - 24) + 24) = 0;
}

void sub_2120B70E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

uint64_t minijson::writer::next_field(minijson::writer *this)
{
  int v2 = *((_DWORD *)this + 1);
  if (v2 == 1)
  {
    BOOL v3 = (void *)*((void *)this + 1);
    char v5 = 44;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)&v5, 1);
  }
  else if (!v2)
  {
    minijson::writer::write_opening_bracket(this);
  }
  uint64_t result = minijson::writer::write_pretty_print_token((uint64_t)this, 0);
  *((_DWORD *)this + 1) = 1;
  return result;
}

uint64_t minijson::writer::write_field_name(minijson::writer *this, char *a2)
{
  BOOL v3 = (void *)*((void *)this + 1);
  char v5 = 58;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)&v5, 1);
  return minijson::writer::write_pretty_print_token((uint64_t)this, 1);
}

void *minijson::writer::write_opening_bracket(minijson::writer *this)
{
  int v1 = *(unsigned __int8 *)this;
  int v2 = (void *)*((void *)this + 1);
  if (v1)
  {
    char v5 = 91;
    BOOL v3 = &v5;
  }
  else
  {
    char v6 = 123;
    BOOL v3 = &v6;
  }
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)v3, 1);
}

uint64_t minijson::writer::write_pretty_print_token(uint64_t result, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(result + 24))
  {
    uint64_t v2 = result;
    uint64_t v7 = *(void *)(result + 8);
    uint64_t v9 = 0;
    if (a2)
    {
      if (a2 == 1)
      {
        uint64_t v9 = 1;
        char v8 = 32;
      }
      else if (a2 == 2 && *(_DWORD *)(result + 4))
      {
        goto LABEL_6;
      }
      return std::ostream::write();
    }
LABEL_6:
    uint64_t v3 = *(void *)(result + 16);
    if (!a2) {
      ++v3;
    }
    if (!*(unsigned char *)(result + 40)) {
      v3 *= *(void *)(result + 32);
    }
    uint64_t v9 = 1;
    char v8 = 10;
    if (v3)
    {
      uint64_t v4 = v3 - 1;
      uint64_t v5 = 1;
      while (1)
      {
        char v6 = *(unsigned char *)(v2 + 40) ? 9 : 32;
        if (v5 == 16)
        {
          std::ostream::write();
          uint64_t v5 = 0;
        }
        uint64_t v9 = v5 + 1;
        *((unsigned char *)&v7 + v5 + 8) = v6;
        if (!v4) {
          break;
        }
        uint64_t v5 = v9;
        --v4;
      }
    }
    return std::ostream::write();
  }
  return result;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x21667E500](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x21667E510](v13);
  return a1;
}

void sub_2120B74A0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x21667E510](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2120B7480);
}

void sub_2120B74F4(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_2120B7674(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

uint64_t minijson::detail::anonymous namespace'::write_quoted_string(void *a1, unsigned __int8 *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 8) = *(_DWORD *)((unsigned char *)a1 + *(void *)(*a1 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)a1 + *(void *)(v4 - 24) + 8) = *(_DWORD *)((unsigned char *)a1 + *(void *)(v4 - 24) + 8) & 0xFFFFFF4F | 0x80;
  LOBYTE(v12) = 48;
  std::operator<<[abi:ne180100]<std::char_traits<char>>(a1, (char *)&v12);
  int64_t v12 = a1;
  uint64_t v5 = 1;
  uint64_t v14 = 1;
  char v13 = 34;
  unsigned __int8 v6 = *a2;
  if (!*a2) {
    goto LABEL_25;
  }
  size_t v7 = a2 + 1;
  do
  {
    if ((char)v6 <= 12)
    {
      if (v6 == 9)
      {
        size_t v8 = "\\t";
        goto LABEL_14;
      }
      if (v6 == 10)
      {
        size_t v8 = "\\n";
        goto LABEL_14;
      }
    }
    else
    {
      switch(v6)
      {
        case 0xDu:
          size_t v8 = "\\r";
          goto LABEL_14;
        case 0x5Cu:
          size_t v8 = "\\\\"";
          goto LABEL_14;
        case 0x22u:
          size_t v8 = "\\\"";
LABEL_14:
          minijson::detail::buffered_writer<128ul>::operator<<<3ul>((uint64_t)&v12, (uint64_t)v8);
          goto LABEL_15;
      }
    }
    if (v6 < 0x20u || v6 == 127)
    {
      minijson::detail::buffered_writer<128ul>::operator<<<3ul>((uint64_t)&v12, (uint64_t)"\\u");
      std::ostream::write();
      uint64_t v14 = 0;
      *(void *)((char *)a1 + *(void *)(*a1 - 24) + 24) = 4;
      std::ostream::operator<<();
    }
    else
    {
      uint64_t v10 = v14;
      if (v14 == 128)
      {
        std::ostream::write();
        uint64_t v10 = 0;
      }
      uint64_t v14 = v10 + 1;
      *((unsigned char *)&v12 + v10 + 8) = v6;
    }
LABEL_15:
    int v9 = *v7++;
    unsigned __int8 v6 = v9;
  }
  while (v9);
  uint64_t v5 = v14;
  if (v14 == 128)
  {
    std::ostream::write();
    uint64_t v5 = 0;
  }
LABEL_25:
  uint64_t v14 = v5 + 1;
  *((unsigned char *)&v12 + v5 + 8) = 34;
  uint64_t result = std::ostream::write();
  uint64_t v14 = 0;
  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 8) = *(_DWORD *)((unsigned char *)a1 + *(void *)(*a1 - 24) + 8) & 0xFFFFFFB5 | 2;
  return result;
}

void *std::operator<<[abi:ne180100]<std::char_traits<char>>(void *a1, char *a2)
{
  uint64_t v3 = (char *)a1 + *(void *)(*a1 - 24);
  int v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    uint64_t v5 = std::locale::use_facet(&v8, MEMORY[0x263F8C108]);
    int v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v8);
    *((_DWORD *)v3 + 36) = v6;
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void sub_2120B7ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

uint64_t minijson::detail::buffered_writer<128ul>::operator<<<3ul>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    char v7 = *(unsigned char *)(a2 + v4);
    uint64_t v8 = *(void *)(a1 + 136);
    if (v8 == 128)
    {
      std::ostream::write();
      uint64_t v8 = 0;
    }
    char v5 = 0;
    *(void *)(a1 + 136) = v8 + 1;
    *(unsigned char *)(a1 + v8 + 8) = v7;
    uint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
  return a1;
}

void *minijson::writer::write_closing_bracket(minijson::writer *this)
{
  minijson::writer::write_pretty_print_token((uint64_t)this, 2);
  uint64_t v2 = (void *)*((void *)this + 1);
  if (*(unsigned char *)this)
  {
    char v5 = 93;
    uint64_t v3 = &v5;
  }
  else
  {
    char v6 = 125;
    uint64_t v3 = &v6;
  }
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)v3, 1);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  int v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    char v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,0>(v4);
      }
      while ((void *)v4 != v2);
      char v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,0>(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v3;
    operator delete(v3);
  }
}

uint64_t minijson::writer::write_helper<unsigned int,minijson::default_value_writer<unsigned int,void>>(uint64_t result, char *a2)
{
  if (*(_DWORD *)(result + 4) != 2)
  {
    uint64_t v3 = (minijson::writer *)result;
    minijson::writer::next_field(v3);
    if (a2) {
      minijson::writer::write_field_name(v3, a2);
    }
    return std::ostream::operator<<();
  }
  return result;
}

uint64_t minijson::writer::write_helper<unsigned long long,minijson::default_value_writer<unsigned long long,void>>(uint64_t result, char *a2)
{
  if (*(_DWORD *)(result + 4) != 2)
  {
    uint64_t v3 = (minijson::writer *)result;
    minijson::writer::next_field(v3);
    if (a2) {
      minijson::writer::write_field_name(v3, a2);
    }
    return std::ostream::operator<<();
  }
  return result;
}

uint64_t minijson::writer::write_helper<std::string,minijson::default_value_writer<std::string,void>>(uint64_t result, char *a2, uint64_t a3)
{
  if (*(_DWORD *)(result + 4) != 2)
  {
    char v5 = (minijson::writer *)result;
    minijson::writer::next_field(v5);
    if (a2) {
      minijson::writer::write_field_name(v5, a2);
    }
    char v6 = (void *)*((void *)v5 + 1);
    if (*(char *)(a3 + 23) >= 0) {
      char v7 = (unsigned __int8 *)a3;
    }
    else {
      char v7 = *(unsigned __int8 **)a3;
    }
  }
  return result;
}

uint64_t minijson::writer::write_helper<char [64],minijson::default_value_writer<char [64],void>>(uint64_t result, char *a2, unsigned __int8 *a3)
{
  if (*(_DWORD *)(result + 4) != 2)
  {
    char v5 = (minijson::writer *)result;
    minijson::writer::next_field(v5);
    if (a2) {
      minijson::writer::write_field_name(v5, a2);
    }
    char v6 = (void *)*((void *)v5 + 1);
  }
  return result;
}

minijson::writer *minijson::writer::write_helper<float,minijson::default_value_writer<float,void>>(minijson::writer *result, char *a2, float *a3)
{
  if (*((_DWORD *)result + 1) != 2)
  {
    char v5 = result;
    minijson::writer::next_field(v5);
    if (a2) {
      minijson::writer::write_field_name(v5, a2);
    }
    return (minijson::writer *)minijson::default_value_writer<float,void>::operator()(*a3, (uint64_t)&v6, *((void **)v5 + 1));
  }
  return result;
}

void *minijson::default_value_writer<float,void>::operator()(float a1, uint64_t a2, void *a3)
{
  if ((LODWORD(a1) & 0x7FFFFFFFu) >= 0x7F800000) {
    return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a3, (uint64_t)"null", 4);
  }
  else {
    return (void *)std::ostream::operator<<();
  }
}

minijson::writer *minijson::writer::write_helper<BOOL,minijson::default_value_writer<BOOL,void>>(minijson::writer *result, char *a2, unsigned __int8 *a3)
{
  if (*((_DWORD *)result + 1) != 2)
  {
    char v5 = result;
    minijson::writer::next_field(v5);
    if (a2) {
      minijson::writer::write_field_name(v5, a2);
    }
    return (minijson::writer *)minijson::default_value_writer<BOOL,void>::operator()((uint64_t)&v6, *((void **)v5 + 1), *a3);
  }
  return result;
}

void *minijson::default_value_writer<BOOL,void>::operator()(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    uint64_t v4 = "true";
    uint64_t v5 = 4;
  }
  else
  {
    uint64_t v4 = "false";
    uint64_t v5 = 5;
  }
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)v4, v5);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

BOOL ANEAnalytics::IsVariableLengthString(int a1)
{
  return a1 == 15;
}

double ANEDebugInfo::DebugInfoInMem::DebugInfoInMem(ANEDebugInfo::DebugInfoInMem *this)
{
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 1pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 92) = 0u;
  *(_OWORD *)((char *)this + 108) = 0u;
  *(void *)((char *)this + 124) = 0x3F80000000000000;
  *((void *)this + 18) = 0;
  *((void *)this + 19) = 0;
  *((void *)this + 17) = 0;
  *(_DWORD *)((char *)this + 159) = 0;
  return result;
}

{
  double result;

  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 1pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 92) = 0u;
  *(_OWORD *)((char *)this + 108) = 0u;
  *(void *)((char *)this + 124) = 0x3F80000000000000;
  *((void *)this + 18) = 0;
  *((void *)this + 19) = 0;
  *((void *)this + 17) = 0;
  *(_DWORD *)((char *)this + 159) = 0;
  return result;
}

uint64_t ANEDebugInfo::DebugInfoInMem::DebugInfoInMem(uint64_t a1, uint64_t a2, uint64_t a3, __int16 *a4)
{
  *(void *)(a1 + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 8pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  *(_OWORD *)(a1 + 92) = 0u;
  *(_OWORD *)(a1 + 108) = 0u;
  *(void *)(a1 + 124) = 0x3F80000000000000;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  *(_DWORD *)(a1 + 159) = 0;
  *(_DWORD *)(a1 + 64) = ANEDebugInfo::DebugInfoInMem::EncodeString(a1, a2);
  *(_DWORD *)(a1 + 68) = ANEDebugInfo::DebugInfoInMem::EncodeString(a1, a3);
  __int16 v7 = *a4;
  *(unsigned char *)(a1 + 162) = *((unsigned char *)a4 + 2);
  *(_WORD *)(a1 + 16pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v7;
  return a1;
}

void sub_2120B81D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(v2 + 96);
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t ANEDebugInfo::DebugInfoInMem::EncodeString(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 96;
  uint64_t v5 = std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::find<std::string>((void *)(a1 + 96), (unsigned __int8 *)a2);
  if (v5) {
    return *((unsigned int *)v5 + 10);
  }
  unint64_t v8 = *(void *)(a1 + 144);
  __int16 v7 = (uint64_t *)(a1 + 136);
  uint64_t v6 = -1431655765 * ((v8 - *(void *)(a1 + 136)) >> 3);
  if (v8 >= *(void *)(a1 + 152))
  {
    uint64_t v9 = std::vector<std::string>::__push_back_slow_path<std::string const&>(v7, (long long *)a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v7, (long long *)a2);
    uint64_t v9 = v8 + 24;
  }
  *(void *)(a1 + 144) = v9;
  int64_t v12 = (long long *)a2;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (unsigned __int8 *)a2, (uint64_t)&std::piecewise_construct, &v12)+ 1pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v6;
  int v10 = *(unsigned __int8 *)(a2 + 23);
  if ((v10 & 0x80u) != 0) {
    int v10 = *(_DWORD *)(a2 + 8);
  }
  *(_DWORD *)(a1 + 92) += v10 + 1;
  return v6;
}

void ANEDebugInfo::DebugInfoInMem::GetString(ANEDebugInfo::DebugInfoInMem *this@<X0>, unsigned int a2@<W1>, std::string *a3@<X8>)
{
  uint64_t v3 = *((void *)this + 17);
  if (0xAAAAAAAAAAAAAAABLL * ((*((void *)this + 18) - v3) >> 3) <= a2)
  {
    std::string::basic_string[abi:ne180100]<0>(a3, "STR_TBL_OUT_OF_BOUND!");
  }
  else
  {
    uint64_t v4 = (long long *)(v3 + 24 * a2);
    if (*((char *)v4 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)v4, *((void *)v4 + 1));
    }
    else
    {
      long long v5 = *v4;
      a3->__r_.__value_.__r.__words[2] = *((void *)v4 + 2);
      *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v5;
    }
  }
}

uint64_t ANEDebugInfo::DebugInfoInMem::GetStringTable(ANEDebugInfo::DebugInfoInMem *this)
{
  return (uint64_t)this + 136;
}

uint64_t ANEDebugInfo::DebugInfoInMem::AddString(uint64_t *a1, long long *a2)
{
  uint64_t v3 = a1 + 17;
  unint64_t v4 = a1[18];
  if (v4 >= a1[19])
  {
    uint64_t result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    uint64_t result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

uint64_t ANEDebugInfo::DebugInfoInMem::Dump(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"CU: ", 4);
  uint64_t v5 = *(void *)(a1 + 136) + 24 * *(unsigned int *)(a1 + 64);
  int v6 = *(char *)(v5 + 23);
  if (v6 >= 0) {
    uint64_t v7 = *(void *)(a1 + 136) + 24 * *(unsigned int *)(a1 + 64);
  }
  else {
    uint64_t v7 = *(void *)v5;
  }
  if (v6 >= 0) {
    uint64_t v8 = *(unsigned __int8 *)(v5 + 23);
  }
  else {
    uint64_t v8 = *(void *)(v5 + 8);
  }
  uint64_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, v7, v8);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
  int v10 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
  std::locale::~locale((std::locale *)&v171);
  std::ostream::put();
  std::ostream::flush();
  uint64_t v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"Ident string: \n", 15);
  uint64_t v12 = *(void *)(a1 + 136) + 24 * *(unsigned int *)(a1 + 88);
  int v13 = *(char *)(v12 + 23);
  if (v13 >= 0) {
    uint64_t v14 = *(void *)(a1 + 136) + 24 * *(unsigned int *)(a1 + 88);
  }
  else {
    uint64_t v14 = *(void *)v12;
  }
  if (v13 >= 0) {
    uint64_t v15 = *(unsigned __int8 *)(v12 + 23);
  }
  else {
    uint64_t v15 = *(void *)(v12 + 8);
  }
  uint64_t v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, v14, v15);
  std::ios_base::getloc((const std::ios_base *)((char *)v16 + *(void *)(*v16 - 24)));
  uint64_t v17 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
  std::locale::~locale((std::locale *)&v171);
  std::ostream::put();
  std::ostream::flush();
  char v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"  Proc: ", 8);
  uint64_t v19 = *(void *)(a1 + 136) + 24 * *(unsigned int *)(a1 + 68);
  int v20 = *(char *)(v19 + 23);
  if (v20 >= 0) {
    uint64_t v21 = *(void *)(a1 + 136) + 24 * *(unsigned int *)(a1 + 68);
  }
  else {
    uint64_t v21 = *(void *)v19;
  }
  if (v20 >= 0) {
    uint64_t v22 = *(unsigned __int8 *)(v19 + 23);
  }
  else {
    uint64_t v22 = *(void *)(v19 + 8);
  }
  uint64_t v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, v21, v22);
  std::ios_base::getloc((const std::ios_base *)((char *)v23 + *(void *)(*v23 - 24)));
  uint64_t v24 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
  std::locale::~locale((std::locale *)&v171);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"  StringTable: [ # ", 19);
  long long v25 = (void *)std::ostream::operator<<();
  uint64_t v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"]", 1);
  std::ios_base::getloc((const std::ios_base *)((char *)v26 + *(void *)(*v26 - 24)));
  long long v27 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v27->__vftable[2].~facet_0)(v27, 10);
  std::locale::~locale((std::locale *)&v171);
  std::ostream::put();
  std::ostream::flush();
  uint64_t v28 = *(void *)(a1 + 136);
  uint64_t v29 = *(void *)(a1 + 144);
  uint64_t v168 = a1;
  if (v28 != v29)
  {
    uint64_t v30 = (std::locale::id *)MEMORY[0x263F8C108];
    do
    {
      int v31 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"     ", 5);
      int v32 = *(char *)(v28 + 23);
      if (v32 >= 0) {
        uint64_t v33 = v28;
      }
      else {
        uint64_t v33 = *(void *)v28;
      }
      if (v32 >= 0) {
        uint64_t v34 = *(unsigned __int8 *)(v28 + 23);
      }
      else {
        uint64_t v34 = *(void *)(v28 + 8);
      }
      char v35 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, v33, v34);
      std::ios_base::getloc((const std::ios_base *)((char *)v35 + *(void *)(*v35 - 24)));
      std::string v36 = std::locale::use_facet((const std::locale *)&v171, v30);
      ((void (*)(const std::locale::facet *, uint64_t))v36->__vftable[2].~facet_0)(v36, 10);
      std::locale::~locale((std::locale *)&v171);
      std::ostream::put();
      std::ostream::flush();
      v28 += 24;
    }
    while (v28 != v29);
  }
  std::ios_base::getloc((const std::ios_base *)((char *)a2 + *(void *)(*a2 - 24)));
  long long v37 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v37->__vftable[2].~facet_0)(v37, 10);
  std::locale::~locale((std::locale *)&v171);
  std::ostream::put();
  uint64_t result = std::ostream::flush();
  if (*(unsigned char *)(a1 + 161))
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"  MaxTDLatency: ", 16);
    uint64_t v39 = (void *)std::ostream::operator<<();
    long long v40 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v39, (uint64_t)" us", 3);
    std::ios_base::getloc((const std::ios_base *)((char *)v40 + *(void *)(*v40 - 24)));
    uint64_t v41 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v41->__vftable[2].~facet_0)(v41, 10);
    std::locale::~locale((std::locale *)&v171);
    std::ostream::put();
    uint64_t result = std::ostream::flush();
  }
  if (*(unsigned char *)(a1 + 160))
  {
    *(uint64_t *)((char *)a2 + *(void *)(*a2 - 24) + 24) = 20;
    long long v42 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
    *(void *)((char *)v42 + *(void *)(*v42 - 24) + 24) = 30;
    long long v43 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v42, (uint64_t)"Procedure Latency: ", 19);
    uint64_t v44 = *v43;
    *(_DWORD *)((char *)v43 + *(void *)(*v43 - 24) + 8) = *(_DWORD *)((unsigned char *)v43 + *(void *)(*v43 - 24) + 8) & 0xFFFFFF4F | 0x80;
    *(uint64_t *)((char *)v43 + *(void *)(v44 - 24) + 24) = 10;
    unint64_t v45 = (void *)std::ostream::operator<<();
    uint64_t v46 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)" ns", 3);
    std::ios_base::getloc((const std::ios_base *)((char *)v46 + *(void *)(*v46 - 24)));
    uint64_t v47 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v47->__vftable[2].~facet_0)(v47, 10);
    std::locale::~locale((std::locale *)&v171);
    std::ostream::put();
    std::ostream::flush();
    *(uint64_t *)((char *)a2 + *(void *)(*a2 - 24) + 24) = 20;
    int v48 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
    *(void *)((char *)v48 + *(void *)(*v48 - 24) + 24) = 30;
    long long v49 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v48, (uint64_t)"NE Domain Frequency: ", 21);
    uint64_t v50 = *v49;
    *(_DWORD *)((char *)v49 + *(void *)(*v49 - 24) + 8) = *(_DWORD *)((unsigned char *)v49 + *(void *)(*v49 - 24) + 8) & 0xFFFFFF4F | 0x80;
    *(uint64_t *)((char *)v49 + *(void *)(v50 - 24) + 24) = 10;
    __int16 v51 = (void *)std::ostream::operator<<();
    char v52 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)" GHz", 4);
    std::ios_base::getloc((const std::ios_base *)((char *)v52 + *(void *)(*v52 - 24)));
    uint64_t v53 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v53->__vftable[2].~facet_0)(v53, 10);
    std::locale::~locale((std::locale *)&v171);
    std::ostream::put();
    std::ostream::flush();
    *(uint64_t *)((char *)a2 + *(void *)(*a2 - 24) + 24) = 20;
    uint64_t v54 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
    *(void *)((char *)v54 + *(void *)(*v54 - 24) + 24) = 30;
    uint64_t v55 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v54, (uint64_t)"L2 Domain Frequency: ", 21);
    uint64_t v56 = *v55;
    *(_DWORD *)((char *)v55 + *(void *)(*v55 - 24) + 8) = *(_DWORD *)((unsigned char *)v55 + *(void *)(*v55 - 24) + 8) & 0xFFFFFF4F | 0x80;
    *(uint64_t *)((char *)v55 + *(void *)(v56 - 24) + 24) = 10;
    uint64_t v57 = (void *)std::ostream::operator<<();
    BOOL v58 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v57, (uint64_t)" GHz", 4);
    std::ios_base::getloc((const std::ios_base *)((char *)v58 + *(void *)(*v58 - 24)));
    uint64_t v59 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v59->__vftable[2].~facet_0)(v59, 10);
    std::locale::~locale((std::locale *)&v171);
    std::ostream::put();
    std::ostream::flush();
    *(uint64_t *)((char *)a2 + *(void *)(*a2 - 24) + 24) = 20;
    uint64_t v60 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
    *(void *)((char *)v60 + *(void *)(*v60 - 24) + 24) = 30;
    uint64_t v61 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v60, (uint64_t)"DRAM Bandwidth: ", 16);
    uint64_t v62 = *v61;
    *(_DWORD *)((char *)v61 + *(void *)(*v61 - 24) + 8) = *(_DWORD *)((unsigned char *)v61 + *(void *)(*v61 - 24) + 8) & 0xFFFFFF4F | 0x80;
    *(uint64_t *)((char *)v61 + *(void *)(v62 - 24) + 24) = 10;
    uint64_t v63 = (void *)std::ostream::operator<<();
    uint64_t v64 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v63, (uint64_t)" GB/s", 5);
    std::ios_base::getloc((const std::ios_base *)((char *)v64 + *(void *)(*v64 - 24)));
    uint64_t v65 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v65->__vftable[2].~facet_0)(v65, 10);
    std::locale::~locale((std::locale *)&v171);
    std::ostream::put();
    std::ostream::flush();
    *(uint64_t *)((char *)a2 + *(void *)(*a2 - 24) + 24) = 20;
    BOOL v66 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
    uint64_t v67 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v66, (uint64_t)"============== time are in nanoseconds ==============", 53);
    std::ios_base::getloc((const std::ios_base *)((char *)v67 + *(void *)(*v67 - 24)));
    uint64_t v68 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v68->__vftable[2].~facet_0)(v68, 10);
    std::locale::~locale((std::locale *)&v171);
    std::ostream::put();
    uint64_t result = std::ostream::flush();
  }
  uint64_t v69 = *(unsigned int ***)(a1 + 40);
  std::string v163 = *(unsigned int ***)(a1 + 48);
  if (v69 != v163)
  {
    uint64_t v70 = a2 + 3;
    long long v165 = a2 + 1;
    uint64_t v71 = (std::locale::id *)MEMORY[0x263F8C108];
    do
    {
      uint64_t v72 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"Source Layers: {", 16);
      std::ios_base::getloc((const std::ios_base *)((char *)v72 + *(void *)(*v72 - 24)));
      uint64_t v73 = std::locale::use_facet((const std::locale *)&v171, v71);
      ((void (*)(const std::locale::facet *, uint64_t))v73->__vftable[2].~facet_0)(v73, 10);
      std::locale::~locale((std::locale *)&v171);
      std::ostream::put();
      uint64_t result = std::ostream::flush();
      BOOL v74 = *v69;
      uint64_t v75 = v69[1];
      while (v74 != v75)
      {
        uint64_t v76 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"  ", 2);
        uint64_t v77 = *(void *)(v168 + 136) + 24 * *v74;
        int v78 = *(char *)(v77 + 23);
        if (v78 >= 0) {
          uint64_t v79 = *(void *)(v168 + 136) + 24 * *v74;
        }
        else {
          uint64_t v79 = *(void *)v77;
        }
        if (v78 >= 0) {
          uint64_t v80 = *(unsigned __int8 *)(v77 + 23);
        }
        else {
          uint64_t v80 = *(void *)(v77 + 8);
        }
        uint64_t v81 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v76, v79, v80);
        BOOL v82 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v81, (uint64_t)"\t[ x ", 5);
        uint64_t v83 = *v82;
        *(_DWORD *)((char *)v82 + *(void *)(*v82 - 24) + 8) = *(_DWORD *)((unsigned char *)v82 + *(void *)(*v82 - 24) + 8) & 0xFFFFFEFB | 4;
        *(_DWORD *)((char *)v82 + *(void *)(v83 - 24) + 8) = *(_DWORD *)((unsigned char *)v82 + *(void *)(v83 - 24) + 8) & 0xFFFFFF4F | 0x20;
        *(uint64_t *)((char *)v82 + *(void *)(v83 - 24) + 24) = 2;
        uint64_t v84 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v84, (uint64_t)" ]\t", 3);
        uint64_t v85 = *(void *)(v168 + 136) + 24 * v74[1];
        uint64_t v86 = *(unsigned __int8 *)(v85 + 23);
        int v87 = (char)v86;
        if ((v86 & 0x80u) != 0) {
          uint64_t v86 = *(void *)(v85 + 8);
        }
        if (v86 != 1) {
          goto LABEL_48;
        }
        if (v87 < 0) {
          uint64_t v85 = *(void *)v85;
        }
        if (*(unsigned char *)v85 != 32)
        {
LABEL_48:
          uint64_t v88 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"OP: ", 4);
          uint64_t v89 = *(void *)(v168 + 136) + 24 * v74[1];
          int v90 = *(char *)(v89 + 23);
          if (v90 >= 0) {
            uint64_t v91 = *(void *)(v168 + 136) + 24 * v74[1];
          }
          else {
            uint64_t v91 = *(void *)v89;
          }
          if (v90 >= 0) {
            uint64_t v92 = *(unsigned __int8 *)(v89 + 23);
          }
          else {
            uint64_t v92 = *(void *)(v89 + 8);
          }
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v88, v91, v92);
        }
        std::ios_base::getloc((const std::ios_base *)((char *)a2 + *(void *)(*a2 - 24)));
        uint64_t v93 = std::locale::use_facet((const std::locale *)&v171, v71);
        ((void (*)(const std::locale::facet *, uint64_t))v93->__vftable[2].~facet_0)(v93, 10);
        std::locale::~locale((std::locale *)&v171);
        std::ostream::put();
        uint64_t result = std::ostream::flush();
        v74 += 3;
      }
      if (*(unsigned char *)(v168 + 160))
      {
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 20;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        uint64_t v94 = *a2;
        *(_DWORD *)((char *)v165 + *(void *)(*a2 - 24)) = *(_DWORD *)((unsigned char *)v165 + *(void *)(*a2 - 24)) & 0xFFFFFEFB | 4;
        *(_DWORD *)((char *)v165 + *(void *)(v94 - 24)) = *(_DWORD *)((unsigned char *)v165 + *(void *)(v94 - 24)) & 0xFFFFFF4F | 0x80;
        *(void *)((char *)v70 + *(void *)(v94 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"ne time", 7);
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"l2 time", 7);
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"dram time", 9);
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
        uint64_t v95 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"total time", 10);
        std::ios_base::getloc((const std::ios_base *)((char *)v95 + *(void *)(*v95 - 24)));
        uint64_t v96 = std::locale::use_facet((const std::locale *)&v171, v71);
        ((void (*)(const std::locale::facet *, uint64_t))v96->__vftable[2].~facet_0)(v96, 10);
        std::locale::~locale((std::locale *)&v171);
        std::ostream::put();
        std::ostream::flush();
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 20;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"---------", 9);
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"---------", 9);
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"---------", 9);
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
        uint64_t v97 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"---------", 9);
        std::ios_base::getloc((const std::ios_base *)((char *)v97 + *(void *)(*v97 - 24)));
        uint64_t v98 = std::locale::use_facet((const std::locale *)&v171, v71);
        ((void (*)(const std::locale::facet *, uint64_t))v98->__vftable[2].~facet_0)(v98, 10);
        std::locale::~locale((std::locale *)&v171);
        std::ostream::put();
        uint64_t result = std::ostream::flush();
      }
      BOOL v99 = v69;
      uint64_t v100 = v69[3];
      uint64_t v164 = v99;
      uint64_t v166 = v99[4];
      if (v100 != v166)
      {
        v167 = (int *)(v100 + 11);
        do
        {
          uint64_t v101 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"  TD: ", 6);
          uint64_t v102 = *v101;
          *(_DWORD *)((char *)v101 + *(void *)(*v101 - 24) + 8) = *(_DWORD *)((unsigned char *)v101
                                                                              + *(void *)(*v101 - 24)
                                                                              + 8) & 0xFFFFFEFB | 4;
          *(_DWORD *)((char *)v101 + *(void *)(v102 - 24) + 8) = *(_DWORD *)((unsigned char *)v101 + *(void *)(v102 - 24)
                                                                                             + 8) & 0xFFFFFF4F | 0x80;
          *(uint64_t *)((char *)v101 + *(void *)(v102 - 24) + 24) = 5;
          uint64_t v103 = (void *)std::ostream::operator<<();
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v103, (uint64_t)"\t", 1);
          if (*(unsigned char *)(v168 + 160))
          {
            unint64_t v104 = *((void *)v100 + 1);
            unint64_t v105 = *((void *)v100 + 2);
            unint64_t v106 = *((void *)v100 + 3);
            if (v104 <= v105) {
              unint64_t v107 = *((void *)v100 + 2);
            }
            else {
              unint64_t v107 = *((void *)v100 + 1);
            }
            if (v107 <= v106) {
              unint64_t v108 = *((void *)v100 + 3);
            }
            else {
              unint64_t v108 = v107;
            }
            *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 4;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
            if (v108 == v104) {
              uint64_t v109 = "\x1B[7;31;40m";
            }
            else {
              uint64_t v109 = (const char *)&unk_2120C31C7;
            }
            if (v108 == v104) {
              uint64_t v110 = 10;
            }
            else {
              uint64_t v110 = 0;
            }
            std::string v111 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)v109, v110);
            uint64_t v112 = *v111;
            *(_DWORD *)((char *)v111 + *(void *)(*v111 - 24) + 8) = *(_DWORD *)((unsigned char *)v111
                                                                                + *(void *)(*v111 - 24)
                                                                                + 8) & 0xFFFFFEFB | 4;
            *(_DWORD *)((char *)v111 + *(void *)(v112 - 24) + 8) = *(_DWORD *)((unsigned char *)v111
                                                                               + *(void *)(v112 - 24)
                                                                               + 8) & 0xFFFFFF4F | 0x80;
            *(uint64_t *)((char *)v111 + *(void *)(v112 - 24) + 24) = 10;
            std::string v113 = (void *)std::ostream::operator<<();
            std::string v114 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v113, (uint64_t)"\x1B[0m", 4);
            *(void *)((char *)v114 + *(void *)(*v114 - 24) + 24) = 10;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v114, (uint64_t)" ", 1);
            if (v108 == v105) {
              std::string v115 = "\x1B[7;31;40m";
            }
            else {
              std::string v115 = (const char *)&unk_2120C31C7;
            }
            if (v108 == v105) {
              uint64_t v116 = 10;
            }
            else {
              uint64_t v116 = 0;
            }
            long long v117 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)v115, v116);
            uint64_t v118 = *v117;
            *(_DWORD *)((char *)v117 + *(void *)(*v117 - 24) + 8) = *(_DWORD *)((unsigned char *)v117
                                                                                + *(void *)(*v117 - 24)
                                                                                + 8) & 0xFFFFFEFB | 4;
            *(_DWORD *)((char *)v117 + *(void *)(v118 - 24) + 8) = *(_DWORD *)((unsigned char *)v117
                                                                               + *(void *)(v118 - 24)
                                                                               + 8) & 0xFFFFFF4F | 0x80;
            *(uint64_t *)((char *)v117 + *(void *)(v118 - 24) + 24) = 10;
            int v119 = (void *)std::ostream::operator<<();
            uint64_t v120 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v119, (uint64_t)"\x1B[0m", 4);
            *(void *)((char *)v120 + *(void *)(*v120 - 24) + 24) = 10;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v120, (uint64_t)" ", 1);
            if (v106 >= v107) {
              uint64_t v121 = "\x1B[7;31;40m";
            }
            else {
              uint64_t v121 = (const char *)&unk_2120C31C7;
            }
            if (v106 >= v107) {
              uint64_t v122 = 10;
            }
            else {
              uint64_t v122 = 0;
            }
            uint64_t v123 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)v121, v122);
            uint64_t v124 = *v123;
            *(_DWORD *)((char *)v123 + *(void *)(*v123 - 24) + 8) = *(_DWORD *)((unsigned char *)v123
                                                                                + *(void *)(*v123 - 24)
                                                                                + 8) & 0xFFFFFEFB | 4;
            *(_DWORD *)((char *)v123 + *(void *)(v124 - 24) + 8) = *(_DWORD *)((unsigned char *)v123
                                                                               + *(void *)(v124 - 24)
                                                                               + 8) & 0xFFFFFF4F | 0x80;
            *(uint64_t *)((char *)v123 + *(void *)(v124 - 24) + 24) = 10;
            int v125 = (void *)std::ostream::operator<<();
            uint64_t v126 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v125, (uint64_t)"\x1B[0m", 4);
            *(void *)((char *)v126 + *(void *)(*v126 - 24) + 24) = 10;
            uint64_t v71 = (std::locale::id *)MEMORY[0x263F8C108];
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v126, (uint64_t)" ", 1);
            uint64_t v127 = *a2;
            *(_DWORD *)((char *)v165 + *(void *)(*a2 - 24)) = *(_DWORD *)((unsigned char *)v165 + *(void *)(*a2 - 24)) & 0xFFFFFEFB | 4;
            *(_DWORD *)((char *)v165 + *(void *)(v127 - 24)) = *(_DWORD *)((unsigned char *)v165 + *(void *)(v127 - 24)) & 0xFFFFFF4F | 0x80;
            *(void *)((char *)v70 + *(void *)(v127 - 24)) = 10;
            std::ostream::operator<<();
          }
          if (*(unsigned char *)(v168 + 162))
          {
            std::ios_base::getloc((const std::ios_base *)((char *)a2 + *(void *)(*a2 - 24)));
            long long v128 = std::locale::use_facet((const std::locale *)&v171, v71);
            ((void (*)(const std::locale::facet *, uint64_t))v128->__vftable[2].~facet_0)(v128, 10);
            std::locale::~locale((std::locale *)&v171);
            std::ostream::put();
            std::ostream::flush();
            std::ios_base::getloc((const std::ios_base *)((char *)a2 + *(void *)(*a2 - 24)));
            uint64_t v129 = std::locale::use_facet((const std::locale *)&v171, v71);
            ((void (*)(const std::locale::facet *, uint64_t))v129->__vftable[2].~facet_0)(v129, 10);
            std::locale::~locale((std::locale *)&v171);
            std::ostream::put();
            std::ostream::flush();
            long long v130 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"Perf tracer Info: {", 19);
            std::ios_base::getloc((const std::ios_base *)((char *)v130 + *(void *)(*v130 - 24)));
            unsigned int v131 = std::locale::use_facet((const std::locale *)&v171, v71);
            ((void (*)(const std::locale::facet *, uint64_t))v131->__vftable[2].~facet_0)(v131, 10);
            std::locale::~locale((std::locale *)&v171);
            std::ostream::put();
            std::ostream::flush();
            uint64_t v132 = 0;
            uint64_t v133 = v167;
            while (1)
            {
              ZinIrCompilerParamsUtils::PerfTracerCategoryToString(*(v133 - 1), &v171);
              ZinIrCompilerParamsUtils::PerfTracerMetricToString(*v133, &__p);
              int v134 = v172;
              if (!v172 || v170 == 0) {
                break;
              }
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"Counter", 7);
              uint64_t v136 = (void *)std::ostream::operator<<();
              long long v137 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v136, (uint64_t)":", 1);
              std::ios_base::getloc((const std::ios_base *)((char *)v137 + *(void *)(*v137 - 24)));
              uint64_t v138 = std::locale::use_facet(&v173, v71);
              ((void (*)(const std::locale::facet *, uint64_t))v138->__vftable[2].~facet_0)(v138, 10);
              std::locale::~locale(&v173);
              std::ostream::put();
              std::ostream::flush();
              *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
              uint64_t v139 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
              uint64_t v140 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v139, (uint64_t)"Category: ", 10);
              if (!v172) {
                std::__throw_bad_optional_access[abi:ne180100]();
              }
              if ((v171.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                uint64_t v141 = &v171;
              }
              else {
                uint64_t v141 = (std::string *)v171.__r_.__value_.__r.__words[0];
              }
              if ((v171.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type size = HIBYTE(v171.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type size = v171.__r_.__value_.__l.__size_;
              }
              uint64_t v143 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v140, (uint64_t)v141, size);
              uint64_t v144 = *v143;
              *(_DWORD *)((char *)v143 + *(void *)(*v143 - 24) + 8) = *(_DWORD *)((unsigned char *)v143
                                                                                  + *(void *)(*v143 - 24)
                                                                                  + 8) & 0xFFFFFF4F | 0x80;
              std::ios_base::getloc((const std::ios_base *)((char *)v143 + *(void *)(v144 - 24)));
              uint64_t v145 = std::locale::use_facet(&v173, v71);
              ((void (*)(const std::locale::facet *, uint64_t))v145->__vftable[2].~facet_0)(v145, 10);
              std::locale::~locale(&v173);
              std::ostream::put();
              std::ostream::flush();
              *(void *)((char *)v70 + *(void *)(*a2 - 24)) = 10;
              uint64_t v146 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
              long long v147 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v146, (uint64_t)"Metric: ", 8);
              if (!v170) {
                std::__throw_bad_optional_access[abi:ne180100]();
              }
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                p_p = &__p;
              }
              else {
                p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
              }
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type v149 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type v149 = __p.__r_.__value_.__l.__size_;
              }
              int v150 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v147, (uint64_t)p_p, v149);
              uint64_t v151 = *v150;
              *(_DWORD *)((char *)v150 + *(void *)(*v150 - 24) + 8) = *(_DWORD *)((unsigned char *)v150
                                                                                  + *(void *)(*v150 - 24)
                                                                                  + 8) & 0xFFFFFF4F | 0x80;
              std::ios_base::getloc((const std::ios_base *)((char *)v150 + *(void *)(v151 - 24)));
              uint64_t v152 = std::locale::use_facet(&v173, v71);
              ((void (*)(const std::locale::facet *, uint64_t))v152->__vftable[2].~facet_0)(v152, 10);
              std::locale::~locale(&v173);
              std::ostream::put();
              std::ostream::flush();
              if (v170 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
              if (v172 && SHIBYTE(v171.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v171.__r_.__value_.__l.__data_);
              }
              v133 += 2;
              if (++v132 == 4)
              {
                long long v153 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"}", 1);
                std::ios_base::getloc((const std::ios_base *)((char *)v153 + *(void *)(*v153 - 24)));
                uint64_t v154 = std::locale::use_facet((const std::locale *)&v171, v71);
                ((void (*)(const std::locale::facet *, uint64_t))v154->__vftable[2].~facet_0)(v154, 10);
                std::locale::~locale((std::locale *)&v171);
                std::ostream::put();
                std::ostream::flush();
                goto LABEL_120;
              }
            }
            if (v170 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            {
              operator delete(__p.__r_.__value_.__l.__data_);
              int v134 = v172;
            }
            if (v134 && SHIBYTE(v171.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v171.__r_.__value_.__l.__data_);
            }
          }
LABEL_120:
          std::ios_base::getloc((const std::ios_base *)((char *)a2 + *(void *)(*a2 - 24)));
          long long v155 = std::locale::use_facet((const std::locale *)&v171, v71);
          ((void (*)(const std::locale::facet *, uint64_t))v155->__vftable[2].~facet_0)(v155, 10);
          std::locale::~locale((std::locale *)&v171);
          std::ostream::put();
          uint64_t result = std::ostream::flush();
          if (*(unsigned char *)(v168 + 161))
          {
            unsigned int v156 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"    Violates Max Latency: ", 26);
            uint64_t v157 = *v156;
            *(_DWORD *)((char *)v156 + *(void *)(*v156 - 24) + 8) = *(_DWORD *)((unsigned char *)v156
                                                                                + *(void *)(*v156 - 24)
                                                                                + 8) & 0xFFFFFEFB | 4;
            *(_DWORD *)((char *)v156 + *(void *)(v157 - 24) + 8) = *(_DWORD *)((unsigned char *)v156
                                                                               + *(void *)(v157 - 24)
                                                                               + 8) & 0xFFFFFF4F | 0x80;
            *(uint64_t *)((char *)v156 + *(void *)(v157 - 24) + 24) = 5;
            if (*((unsigned char *)v100 + 4)) {
              unsigned int v158 = "true";
            }
            else {
              unsigned int v158 = "false";
            }
            if (*((unsigned char *)v100 + 4)) {
              uint64_t v159 = 4;
            }
            else {
              uint64_t v159 = 5;
            }
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v156, (uint64_t)v158, v159);
            std::ios_base::getloc((const std::ios_base *)((char *)a2 + *(void *)(*a2 - 24)));
            uint64_t v160 = std::locale::use_facet((const std::locale *)&v171, v71);
            ((void (*)(const std::locale::facet *, uint64_t))v160->__vftable[2].~facet_0)(v160, 10);
            std::locale::~locale((std::locale *)&v171);
            std::ostream::put();
            uint64_t result = std::ostream::flush();
          }
          v100 += 18;
          v167 += 18;
        }
        while (v100 != v166);
      }
      if (*(unsigned char *)(v168 + 160))
      {
        uint64_t v161 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"}", 1);
        std::ios_base::getloc((const std::ios_base *)((char *)v161 + *(void *)(*v161 - 24)));
        int v162 = std::locale::use_facet((const std::locale *)&v171, v71);
        ((void (*)(const std::locale::facet *, uint64_t))v162->__vftable[2].~facet_0)(v162, 10);
        std::locale::~locale((std::locale *)&v171);
        std::ostream::put();
        uint64_t result = std::ostream::flush();
      }
      uint64_t v69 = v164 + 6;
    }
    while (v164 + 6 != v163);
  }
  return result;
}

void sub_2120BA238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,std::locale a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,char a29)
{
}

uint64_t ANEDebugInfo::DebugInfoInMem::GetMode(ANEDebugInfo::DebugInfoInMem *this)
{
  return (uint64_t)this + 160;
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, long long *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }
  *(void *)(a1 + 8) = v3 + 24;
}

void sub_2120BA36C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    int v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    int v10 = 0;
  }
  std::__split_buffer<std::string>::pointer end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    std::__split_buffer<std::string>::pointer end = __v.__end_;
  }
  else
  {
    long long v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_2120BA484(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::find<std::string>(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  long long v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      uint64_t v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    long long v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__rehash<true>(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  uint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *uint64_t v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_2120BAA80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PerfTracerCategory>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x30uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    *((void *)v8 + 4) = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  *((_DWORD *)v8 + 1pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_2120BAB34(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PerfTracerCategory>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

ANEDebugInfo::DebugInfoParser *ANEDebugInfo::DebugInfoParser::DebugInfoParser(ANEDebugInfo::DebugInfoParser *this, const unsigned __int8 *a2, int a3)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  ANEDebugInfo::DebugInfoInMem::DebugInfoInMem((ANEDebugInfo::DebugInfoParser *)((char *)this + 24));
  *((void *)this + 24) = a2;
  *((_DWORD *)this + 5pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = a3;
  *((void *)this + 26) = a2;
  *((void *)this + 27) = &a2[a3];
  return this;
}

void sub_2120BABAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<ANEDebugInfo::DebugInfoInMem>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

BOOL ANEDebugInfo::DebugInfoParser::Parse(ANEDebugInfo::DebugInfoParser *this)
{
  BOOL v2 = ANEDebugInfo::DebugInfoParser::ParseCU(this);
  if (v2)
  {
    while (ANEDebugInfo::DebugInfoParser::ParseCU(this))
      ;
  }
  return v2;
}

BOOL ANEDebugInfo::DebugInfoParser::ParseCU(ANEDebugInfo::DebugInfoParser *this)
{
  uint64_t v1 = (_DWORD *)*((void *)this + 24);
  if ((unint64_t)v1 >= *((void *)this + 27) || *v1) {
    return 0;
  }
  *((void *)this + 24) = v1 + 2;
  if (!ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2061)) {
    goto LABEL_11;
  }
  *(void *)&v13[0] = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
  *((void *)&v13[0] + 1) = v4;
  if (!HIDWORD(*(void *)&v13[0])) {
    goto LABEL_11;
  }
  Scalar = (uint64_t *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)v13);
  if (!Scalar)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ANEDebugInfo::DebugInfoParser::ParseCU();
    }
    return 0;
  }
  uint64_t v6 = *Scalar;
  if ((unint64_t)*Scalar >= 2)
  {
    BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (result)
    {
      ANEDebugInfo::DebugInfoParser::ParseCU(v6);
      return 0;
    }
  }
  else
  {
LABEL_11:
    if (ANEDebugInfo::DebugInfoParser::ParseStringTable(this))
    {
      if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2049))
      {
        *(void *)&v13[0] = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
        *((void *)&v13[0] + 1) = v7;
        if (HIDWORD(*(void *)&v13[0]))
        {
          unint64_t v8 = (_DWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)v13);
          if (!v8)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ANEDebugInfo::DebugInfoParser::ParseCU();
            }
            return 0;
          }
          *((_DWORD *)this + 22) = *v8;
        }
      }
      if (ANEDebugInfo::DebugInfoParser::ParseProc(this))
      {
        ANEDebugInfo::DebugInfoParser::ParseHwConfigs(this);
        if (ANEDebugInfo::DebugInfoParser::ParseIdentString(this))
        {
          ANEDebugInfo::DebugInfoParser::ParseMaxContextLatencyThreshold(this);
          unint64_t v9 = *((void *)this + 1);
          if (v9 >= *((void *)this + 2))
          {
            uint64_t v10 = std::vector<ANEDebugInfo::DebugInfoInMem>::__push_back_slow_path<ANEDebugInfo::DebugInfoInMem const&>((uint64_t *)this, (long long *)((char *)this + 24));
          }
          else
          {
            std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,ANEDebugInfo::DebugInfoInMem const&,ANEDebugInfo::DebugInfoInMem*>(*((void *)this + 1), (long long *)((char *)this + 24));
            uint64_t v10 = v9 + 168;
            *((void *)this + 1) = v9 + 168;
          }
          *((void *)this + 1) = v10;
          ANEDebugInfo::DebugInfoInMem::DebugInfoInMem((ANEDebugInfo::DebugInfoInMem *)v13);
          long long v11 = v13[1];
          *(_OWORD *)((char *)this + 24) = v13[0];
          *(_OWORD *)((char *)this + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v11;
          *((void *)this + 7) = v14;
          std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__vdeallocate((void **)this + 8);
          *((_OWORD *)this + 4) = v15;
          *((void *)this + 1pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v16;
          uint64_t v16 = 0;
          long long v15 = 0uLL;
          long long v12 = v18;
          *(_OWORD *)((char *)this + 88) = v17;
          *(_OWORD *)((char *)this + 104) = v12;
          std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__move_assign((uint64_t)this + 120, v19);
          std::vector<std::string>::__vdeallocate((std::vector<std::string> *)((char *)this + 160));
          *((_OWORD *)this + 1pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v20;
          *((void *)this + 22) = v21;
          uint64_t v21 = 0;
          long long v20 = 0uLL;
          *((_WORD *)this + 92) = v22;
          *((unsigned char *)this + 186) = v23;
          unint64_t v24 = (void **)&v20;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v24);
          std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v19);
          unint64_t v24 = (void **)&v15;
          std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v24);
          return 1;
        }
        else
        {
          BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (result)
          {
            ANEDebugInfo::DebugInfoParser::ParseCU();
            return 0;
          }
        }
      }
      else
      {
        BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (result)
        {
          ANEDebugInfo::DebugInfoParser::ParseCU();
          return 0;
        }
      }
    }
    else
    {
      BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (result)
      {
        ANEDebugInfo::DebugInfoParser::ParseCU();
        return 0;
      }
    }
  }
  return result;
}

void sub_2120BAE98(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void ANEDebugInfo::DebugInfoParser::GetCompilationUnit(ANEDebugInfo::DebugInfoParser *this@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)this;
  if (0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((void *)this + 1) - *(void *)this) >> 3) <= a2)
  {
    char v9 = 0;
    ANEDebugInfo::DebugInfoInMem::DebugInfoInMem((ANEDebugInfo::DebugInfoInMem *)v5);
    std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::pair[abi:ne180100]<BOOL,ANEDebugInfo::DebugInfoInMem,0>(a3, &v9, v5);
    uint64_t v10 = (void **)&v8;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v10);
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v7);
    uint64_t v10 = (void **)&v6;
    std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v10);
  }
  else
  {
    LOBYTE(v5[0]) = 1;
    std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::pair[abi:ne180100]<BOOL,ANEDebugInfo::DebugInfoInMem&,0>(a3, v5, (long long *)(v4 + 168 * a2));
  }
}

void ANEDebugInfo::DebugInfoParser::GetCompilationUnit(uint64_t *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v28 = a1[1];
  if (*a1 != v28)
  {
    while (1)
    {
      long long v7 = *(_OWORD *)v4;
      long long v8 = *(_OWORD *)(v4 + 16);
      uint64_t v32 = *(void *)(v4 + 32);
      v31[0] = v7;
      v31[1] = v8;
      memset(v33, 0, sizeof(v33));
      std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*>(v33, *(void *)(v4 + 40), *(void *)(v4 + 48), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v4 + 48) - *(void *)(v4 + 40)) >> 4));
      long long v9 = *(_OWORD *)(v4 + 80);
      long long v34 = *(_OWORD *)(v4 + 64);
      long long v35 = v9;
      std::unordered_map<std::string,unsigned int>::unordered_map((uint64_t)v36, v4 + 96);
      memset(&v37, 0, sizeof(v37));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v37, *(long long **)(v4 + 136), *(long long **)(v4 + 144), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v4 + 144) - *(void *)(v4 + 136)) >> 3));
      __int16 v10 = *(_WORD *)(v4 + 160);
      char v39 = *(unsigned char *)(v4 + 162);
      __int16 v38 = v10;
      uint64_t v11 = *(unsigned __int8 *)(a2 + 23);
      if ((v11 & 0x80u) != 0) {
        uint64_t v11 = *(void *)(a2 + 8);
      }
      if (v11) {
        goto LABEL_29;
      }
      ANEDebugInfo::DebugInfoInMem::GetString((ANEDebugInfo::DebugInfoInMem *)v31, DWORD1(v34), &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = __p.__r_.__value_.__l.__size_;
      }
      uint64_t v13 = a3[23];
      int v14 = (char)v13;
      if ((v13 & 0x80u) != 0) {
        uint64_t v13 = *((void *)a3 + 1);
      }
      if (size != v13) {
        break;
      }
      if (v14 >= 0) {
        long long v15 = a3;
      }
      else {
        long long v15 = *(unsigned __int8 **)a3;
      }
      if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
      {
        if (!*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
          goto LABEL_31;
        }
        uint64_t v16 = HIBYTE(__p.__r_.__value_.__r.__words[2]) - 1;
        p_p = &__p;
        do
        {
          int v19 = p_p->__r_.__value_.__s.__data_[0];
          p_p = (std::string *)((char *)p_p + 1);
          int v18 = v19;
          int v21 = *v15++;
          int v20 = v21;
          BOOL v23 = v16-- != 0;
          BOOL v24 = v18 == v20;
        }
        while (v18 == v20 && v23);
        if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
        {
LABEL_23:
          if (v24) {
            goto LABEL_31;
          }
          goto LABEL_29;
        }
        goto LABEL_26;
      }
      long long v25 = (void *)__p.__r_.__value_.__r.__words[0];
      int v26 = memcmp(__p.__r_.__value_.__l.__data_, v15, __p.__r_.__value_.__l.__size_);
      operator delete(v25);
      if (!v26)
      {
LABEL_31:
        __p.__r_.__value_.__s.__data_[0] = 1;
        std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::pair[abi:ne180100]<BOOL,ANEDebugInfo::DebugInfoInMem&,0>(a4, &__p, v31);
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v37;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v36);
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
        goto LABEL_32;
      }
LABEL_29:
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v37;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v36);
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
      std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      v4 += 168;
      if (v4 == v28) {
        goto LABEL_30;
      }
    }
    BOOL v24 = 0;
    if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) == 0) {
      goto LABEL_23;
    }
LABEL_26:
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v24) {
      goto LABEL_31;
    }
    goto LABEL_29;
  }
LABEL_30:
  char v29 = 0;
  ANEDebugInfo::DebugInfoInMem::DebugInfoInMem((ANEDebugInfo::DebugInfoInMem *)v31);
  std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::pair[abi:ne180100]<BOOL,ANEDebugInfo::DebugInfoInMem,0>(a4, &v29, v31);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v37;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v36);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
LABEL_32:
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
}

void sub_2120BB1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  ANEDebugInfo::DebugInfoInMem::~DebugInfoInMem((ANEDebugInfo::DebugInfoInMem *)va);
  _Unwind_Resume(a1);
}

BOOL ANEDebugInfo::DebugInfoParser::CheckToken(uint64_t a1, int a2)
{
  uint64_t v2 = *(_DWORD **)(a1 + 192);
  unint64_t v3 = *(void *)(a1 + 216);
  if ((unint64_t)v2 >= v3) {
    return 0;
  }
  if ((unint64_t)v2 + v2[1] > v3)
  {
    BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    *(_WORD *)int8x8_t v5 = 0;
    _os_log_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_INFO, "Record size is bigger than the buffer size. ", v5, 2u);
    return 0;
  }
  return *v2 == a2;
}

unint64_t ANEDebugInfo::DebugInfoParser::MatchRecord(ANEDebugInfo::DebugInfoParser *this)
{
  uint64_t v1 = (unsigned int *)*((void *)this + 24);
  uint64_t v2 = v1[1];
  *((void *)this + 24) = (char *)v1 + v2;
  if ((unint64_t)v1 + v2 <= *((void *)this + 27))
  {
    uint64_t v11 = *v1;
    unint64_t v12 = (unint64_t)(v2 - 8) << 32;
  }
  else
  {
    BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v3) {
      ANEDebugInfo::DebugInfoParser::MatchRecord(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    uint64_t v11 = 0;
    unint64_t v12 = 0;
  }
  return v12 | v11;
}

uint64_t *ANEDebugInfo::DebugInfoParser::Print(uint64_t *this)
{
  uint64_t v1 = *this;
  uint64_t v2 = this[1];
  if (*this != v2)
  {
    BOOL v3 = (uint64_t *)MEMORY[0x263F8C100];
    do
    {
      this = (uint64_t *)ANEDebugInfo::DebugInfoInMem::Dump(v1, v3);
      v1 += 168;
    }
    while (v1 != v2);
  }
  return this;
}

uint64_t ANEDebugInfo::DebugInfoParser::MatchTag(uint64_t a1, int a2)
{
  uint64_t v2 = *(_DWORD **)(a1 + 192);
  if ((unint64_t)v2 >= *(void *)(a1 + 216) || *v2 != a2) {
    return 0;
  }
  *(void *)(a1 + 192) = v2 + 2;
  return 1;
}

uint64_t ANEDebugInfo::Record::GetScalarVal<unsigned long long>(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (!v1)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      ANEDebugInfo::Record::GetScalarVal<unsigned long long>(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return v1;
}

BOOL ANEDebugInfo::DebugInfoParser::ParseStringTable(ANEDebugInfo::DebugInfoParser *this)
{
  uint64_t v1 = (_DWORD *)*((void *)this + 24);
  if ((unint64_t)v1 >= *((void *)this + 27) || *v1 != 8) {
    return 0;
  }
  *((void *)this + 24) = v1 + 2;
  BOOL result = ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2051);
  if (!result) {
    return result;
  }
  unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
  unint64_t v6 = HIDWORD(matched);
  if (!HIDWORD(matched)) {
    return 0;
  }
  uint64_t v7 = v5;
  unsigned int v8 = 0;
  uint64_t v9 = (uint64_t *)((char *)this + 24);
  do
  {
    size_t v10 = strlen(v7) + 1;
    if (v10 >= 2)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, v7);
      ANEDebugInfo::DebugInfoInMem::AddString(v9, (long long *)__p);
      if (v12 < 0) {
        operator delete(__p[0]);
      }
    }
    v8 += v10;
    v7 += v10;
  }
  while (v8 < v6);
  return 1;
}

void sub_2120BB4B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL ANEDebugInfo::DebugInfoParser::ParseProc(ANEDebugInfo::DebugInfoParser *this)
{
  uint64_t v1 = (_DWORD *)*((void *)this + 24);
  if ((unint64_t)v1 >= *((void *)this + 27) || *v1 != 1) {
    return 0;
  }
  *((void *)this + 24) = v1 + 2;
  if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2048))
  {
    unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    uint64_t v9 = v3;
    if (HIDWORD(matched))
    {
      Scalar = (_DWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
      if (!Scalar)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ANEDebugInfo::DebugInfoParser::ParseProc();
        }
        return 0;
      }
      *((_DWORD *)this + 23) = *Scalar;
    }
  }
  if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2056))
  {
    unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    uint64_t v9 = v5;
    if (HIDWORD(matched))
    {
      unint64_t v6 = (void *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
      if (v6)
      {
        *((void *)this + 12) = *v6;
        goto LABEL_11;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ANEDebugInfo::DebugInfoParser::ParseProc();
      }
      return 0;
    }
  }
LABEL_11:
  if (!ANEDebugInfo::DebugInfoParser::ParseGroup(this))
  {
    BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    ANEDebugInfo::DebugInfoParser::ParseProc();
    return 0;
  }
  while ((ANEDebugInfo::DebugInfoParser::ParseGroup(this) & 1) != 0)
    ;
  return 1;
}

uint64_t ANEDebugInfo::DebugInfoParser::ParseHwConfigs(ANEDebugInfo::DebugInfoParser *this)
{
  uint64_t v1 = (_DWORD *)*((void *)this + 24);
  if ((unint64_t)v1 >= *((void *)this + 27)) {
    return 0;
  }
  uint64_t result = 1;
  if (*v1 != 10) {
    return result;
  }
  *((void *)this + 24) = v1 + 2;
  *((unsigned char *)this + 184) = 1;
  if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2057))
  {
    unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    uint64_t v11 = v4;
    if (!HIDWORD(matched)) {
      return 0;
    }
    Scalar = (unint64_t *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
    if (!Scalar)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ANEDebugInfo::DebugInfoParser::ParseHwConfigs();
      }
      return 0;
    }
    *((double *)this + 3) = (double)*Scalar;
  }
  if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2058))
  {
    unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    uint64_t v11 = v6;
    if (!HIDWORD(matched)) {
      return 0;
    }
    uint64_t v7 = (unint64_t *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
    if (!v7)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ANEDebugInfo::DebugInfoParser::ParseHwConfigs();
      }
      return 0;
    }
    *((double *)this + 4) = (double)*v7;
  }
  if (!ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2059)) {
    return 1;
  }
  unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
  uint64_t v11 = v8;
  if (HIDWORD(matched))
  {
    uint64_t v9 = (unint64_t *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
    if (v9)
    {
      *((double *)this + 6) = (double)*v9;
      return 1;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ANEDebugInfo::DebugInfoParser::ParseHwConfigs();
    }
  }
  return 0;
}

uint64_t ANEDebugInfo::DebugInfoParser::ParseIdentString(ANEDebugInfo::DebugInfoParser *this)
{
  if (*((void *)this + 24) < *((void *)this + 27))
  {
    if (!ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2063)) {
      return 1;
    }
    v5[0] = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    v5[1] = v2;
    if (HIDWORD(v5[0]))
    {
      Scalar = (_DWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)v5);
      if (Scalar)
      {
        *((_DWORD *)this + 28) = *Scalar;
        return 1;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ANEDebugInfo::DebugInfoParser::ParseIdentString();
      }
    }
  }
  return 0;
}

uint64_t ANEDebugInfo::DebugInfoParser::ParseMaxContextLatencyThreshold(ANEDebugInfo::DebugInfoParser *this)
{
  if (*((void *)this + 24) < *((void *)this + 27))
  {
    BOOL v2 = ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2064);
    uint64_t result = 1;
    if (!v2) {
      return result;
    }
    *((unsigned char *)this + 185) = 1;
    v6[0] = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    v6[1] = v4;
    if (HIDWORD(v6[0]))
    {
      Scalar = (void *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)v6);
      if (Scalar)
      {
        *((void *)this + 13) = *Scalar;
        return 1;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ANEDebugInfo::DebugInfoParser::ParseMaxContextLatencyThreshold();
      }
    }
  }
  return 0;
}

uint64_t ANEDebugInfo::DebugInfoParser::ParseGroup(ANEDebugInfo::DebugInfoParser *this)
{
  uint64_t v1 = (_DWORD *)*((void *)this + 24);
  if ((unint64_t)v1 >= *((void *)this + 27) || *v1 != 9) {
    return 0;
  }
  *((void *)this + 24) = v1 + 2;
  *(_OWORD *)std::string __p = 0u;
  long long v9 = 0u;
  *(_OWORD *)uint64_t v7 = 0u;
  if (ANEDebugInfo::DebugInfoParser::ParseLayer(this, (ANEDebugInfo::DebugInfoInMem::Group *)v7))
  {
    while (ANEDebugInfo::DebugInfoParser::ParseLayer(this, (ANEDebugInfo::DebugInfoInMem::Group *)v7))
      ;
    if (ANEDebugInfo::DebugInfoParser::ParseTD(this, (ANEDebugInfo::DebugInfoInMem::Group *)v7))
    {
      while (ANEDebugInfo::DebugInfoParser::ParseTD(this, (ANEDebugInfo::DebugInfoInMem::Group *)v7))
        ;
      unint64_t v3 = *((void *)this + 9);
      if (v3 >= *((void *)this + 10))
      {
        uint64_t v4 = std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__push_back_slow_path<ANEDebugInfo::DebugInfoInMem::Group const&>((uint64_t *)this + 8, (uint64_t)v7);
      }
      else
      {
        std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,ANEDebugInfo::DebugInfoInMem::Group const&,ANEDebugInfo::DebugInfoInMem::Group*>(*((void **)this + 9), (uint64_t)v7);
        uint64_t v4 = v3 + 48;
        *((void *)this + 9) = v3 + 48;
      }
      *((void *)this + 9) = v4;
      uint64_t v5 = 1;
      goto LABEL_18;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ANEDebugInfo::DebugInfoParser::ParseGroup();
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    ANEDebugInfo::DebugInfoParser::ParseGroup();
  }
  uint64_t v5 = 0;
LABEL_18:
  if (__p[1])
  {
    *(void **)&long long v9 = __p[1];
    operator delete(__p[1]);
  }
  if (v7[0])
  {
    v7[1] = v7[0];
    operator delete(v7[0]);
  }
  return v5;
}

void sub_2120BB9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11 = v10;
  *(void *)(v9 + 72) = v11;
  ANEDebugInfo::DebugInfoInMem::Group::~Group((ANEDebugInfo::DebugInfoInMem::Group *)&a9);
  _Unwind_Resume(a1);
}

BOOL ANEDebugInfo::DebugInfoParser::ParseLayer(ANEDebugInfo::DebugInfoParser *this, ANEDebugInfo::DebugInfoInMem::Group *a2)
{
  BOOL v2 = (_DWORD *)*((void *)this + 24);
  if ((unint64_t)v2 >= *((void *)this + 27) || *v2 != 3) {
    return 0;
  }
  *((void *)this + 24) = v2 + 2;
  if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2048))
  {
    unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    uint64_t v25 = v5;
    if (HIDWORD(matched))
    {
      Scalar = (_DWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
      if (!Scalar)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ANEDebugInfo::DebugInfoParser::ParseLayer();
        }
        return 0;
      }
      LODWORD(v26) = *Scalar;
    }
  }
  if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2060))
  {
    unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    uint64_t v25 = v7;
    if (!HIDWORD(matched)) {
      goto LABEL_12;
    }
    uint64_t v8 = (int *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
    if (v8)
    {
      int v27 = *v8;
      goto LABEL_12;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ANEDebugInfo::DebugInfoParser::ParseLayer();
    }
    return 0;
  }
  int v27 = 1065353216;
LABEL_12:
  if (!ANEDebugInfo::DebugInfoParser::ParseOperation(this, (uint64_t)&v26))
  {
    BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    ANEDebugInfo::DebugInfoParser::ParseLayer();
    return 0;
  }
  unint64_t v9 = *((void *)a2 + 2);
  unint64_t v10 = *((void *)a2 + 1);
  if (v10 >= v9)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - *(void *)a2) >> 2);
    unint64_t v14 = v13 + 1;
    if (v13 + 1 > 0x1555555555555555) {
      std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - *(void *)a2) >> 2);
    if (2 * v15 > v14) {
      unint64_t v14 = 2 * v15;
    }
    if (v15 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v16 = 0x1555555555555555;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16) {
      long long v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Layer>>((uint64_t)a2 + 16, v16);
    }
    else {
      long long v17 = 0;
    }
    int v18 = &v17[12 * v13];
    int v19 = &v17[12 * v16];
    *(void *)int v18 = v26;
    *((_DWORD *)v18 + 2) = v27;
    uint64_t v11 = v18 + 12;
    int v21 = *(_DWORD **)a2;
    int v20 = (_DWORD *)*((void *)a2 + 1);
    if (v20 != *(_DWORD **)a2)
    {
      do
      {
        uint64_t v22 = *(void *)(v20 - 3);
        v20 -= 3;
        int v23 = v20[2];
        *(void *)(v18 - 12) = v22;
        v18 -= 12;
        *((_DWORD *)v18 + 2) = v23;
      }
      while (v20 != v21);
      int v20 = *(_DWORD **)a2;
    }
    *(void *)a2 = v18;
    *((void *)a2 + 1) = v11;
    *((void *)a2 + 2) = v19;
    if (v20) {
      operator delete(v20);
    }
  }
  else
  {
    *(void *)unint64_t v10 = v26;
    *(_DWORD *)(v10 + 8) = v27;
    uint64_t v11 = (char *)(v10 + 12);
  }
  *((void *)a2 + 1) = v11;
  return 1;
}

BOOL ANEDebugInfo::DebugInfoParser::ParseTD(ANEDebugInfo::DebugInfoParser *this, ANEDebugInfo::DebugInfoInMem::Group *a2)
{
  BOOL v2 = (_DWORD *)*((void *)this + 24);
  if ((unint64_t)v2 >= *((void *)this + 27) || *v2 != 5) {
    return 0;
  }
  *((void *)this + 24) = v2 + 2;
  v29[4] = 0;
  memset(&v29[8], 0, 64);
  if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2050))
  {
    v28[0] = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    v28[1] = v5;
    if (HIDWORD(v28[0]))
    {
      Scalar = (_DWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)v28);
      if (Scalar)
      {
        *(_DWORD *)char v29 = *Scalar;
        goto LABEL_7;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ANEDebugInfo::DebugInfoParser::ParseTD();
      }
      return 0;
    }
  }
LABEL_7:
  if ((ANEDebugInfo::DebugInfoParser::ParseViolateMaxContextLatencyFlag(this, (uint64_t)v29) & 1) == 0)
  {
    BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    ANEDebugInfo::DebugInfoParser::ParseTD();
    return 0;
  }
  ANEDebugInfo::DebugInfoParser::ParsePerfStats((uint64_t)this, v29);
  ANEDebugInfo::DebugInfoParser::ParsePerfTracerInfo((uint64_t)this, (uint64_t)v29);
  unint64_t v7 = *((void *)a2 + 5);
  unint64_t v8 = *((void *)a2 + 4);
  if (v8 >= v7)
  {
    uint64_t v13 = *((void *)a2 + 3);
    unint64_t v14 = 0x8E38E38E38E38E39 * ((uint64_t)(v8 - v13) >> 3);
    unint64_t v15 = v14 + 1;
    if (v14 + 1 > 0x38E38E38E38E38ELL) {
      std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v16 = 0x8E38E38E38E38E39 * ((uint64_t)(v7 - v13) >> 3);
    if (2 * v16 > v15) {
      unint64_t v15 = 2 * v16;
    }
    if (v16 >= 0x1C71C71C71C71C7) {
      unint64_t v17 = 0x38E38E38E38E38ELL;
    }
    else {
      unint64_t v17 = v15;
    }
    if (v17) {
      int v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::TD>>((uint64_t)a2 + 40, v17);
    }
    else {
      int v18 = 0;
    }
    int v19 = &v18[72 * v14];
    int v20 = &v18[72 * v17];
    *((void *)v19 + 8) = *(void *)&v29[64];
    long long v21 = *(_OWORD *)&v29[48];
    *((_OWORD *)v19 + 2) = *(_OWORD *)&v29[32];
    *((_OWORD *)v19 + 3) = v21;
    long long v22 = *(_OWORD *)&v29[16];
    *(_OWORD *)int v19 = *(_OWORD *)v29;
    *((_OWORD *)v19 + 1) = v22;
    uint64_t v11 = v19 + 72;
    BOOL v24 = (char *)*((void *)a2 + 3);
    int v23 = (char *)*((void *)a2 + 4);
    if (v23 != v24)
    {
      do
      {
        *(_OWORD *)(v19 - 72) = *(_OWORD *)(v23 - 72);
        long long v25 = *(_OWORD *)(v23 - 56);
        long long v26 = *(_OWORD *)(v23 - 40);
        long long v27 = *(_OWORD *)(v23 - 24);
        *((void *)v19 - 1) = *((void *)v23 - 1);
        *(_OWORD *)(v19 - 24) = v27;
        *(_OWORD *)(v19 - 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v26;
        *(_OWORD *)(v19 - 56) = v25;
        v19 -= 72;
        v23 -= 72;
      }
      while (v23 != v24);
      int v23 = (char *)*((void *)a2 + 3);
    }
    *((void *)a2 + 3) = v19;
    *((void *)a2 + 4) = v11;
    *((void *)a2 + 5) = v20;
    if (v23) {
      operator delete(v23);
    }
  }
  else
  {
    long long v9 = *(_OWORD *)&v29[48];
    *(_OWORD *)(v8 + 32) = *(_OWORD *)&v29[32];
    *(_OWORD *)(v8 + 48) = v9;
    *(void *)(v8 + 64) = *(void *)&v29[64];
    long long v10 = *(_OWORD *)&v29[16];
    *(_OWORD *)unint64_t v8 = *(_OWORD *)v29;
    *(_OWORD *)(v8 + 16) = v10;
    uint64_t v11 = (char *)(v8 + 72);
  }
  *((void *)a2 + 4) = v11;
  return 1;
}

BOOL ANEDebugInfo::DebugInfoParser::ParseOperation(ANEDebugInfo::DebugInfoParser *a1, uint64_t a2)
{
  BOOL v2 = (_DWORD *)*((void *)a1 + 24);
  if ((unint64_t)v2 >= *((void *)a1 + 27)) {
    return 0;
  }
  if (*v2 != 4) {
    return 0;
  }
  *((void *)a1 + 24) = v2 + 2;
  if (!ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)a1, 2048)) {
    return 0;
  }
  v9[0] = ANEDebugInfo::DebugInfoParser::MatchRecord(a1);
  v9[1] = v5;
  Scalar = (_DWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)v9);
  BOOL v7 = Scalar != 0;
  if (Scalar)
  {
    *(_DWORD *)(a2 + 4) = *Scalar;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    ANEDebugInfo::DebugInfoParser::ParseOperation();
  }
  return v7;
}

uint64_t ANEDebugInfo::DebugInfoParser::ParseViolateMaxContextLatencyFlag(ANEDebugInfo::DebugInfoParser *a1, uint64_t a2)
{
  if (*((void *)a1 + 24) < *((void *)a1 + 27))
  {
    if (!ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)a1, 2062)) {
      return 1;
    }
    v7[0] = ANEDebugInfo::DebugInfoParser::MatchRecord(a1);
    v7[1] = v4;
    if (HIDWORD(v7[0]))
    {
      Scalar = (unsigned char *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)v7);
      if (Scalar)
      {
        *(unsigned char *)(a2 + 4) = *Scalar;
        return 1;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ANEDebugInfo::DebugInfoParser::ParseViolateMaxContextLatencyFlag();
      }
    }
  }
  return 0;
}

BOOL ANEDebugInfo::DebugInfoParser::ParsePerfStats(uint64_t a1, void *a2)
{
  BOOL v2 = *(_DWORD **)(a1 + 192);
  if ((unint64_t)v2 >= *(void *)(a1 + 216) || *v2 != 6) {
    return 0;
  }
  *(void *)(a1 + 192) = v2 + 2;
  *(unsigned char *)(a1 + 184) = 1;
  if (ANEDebugInfo::DebugInfoParser::CheckToken(a1, 2052))
  {
    unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord((ANEDebugInfo::DebugInfoParser *)a1);
    uint64_t v15 = v5;
    if (!HIDWORD(matched)) {
      return 0;
    }
    Scalar = (void *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
    if (!Scalar)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ANEDebugInfo::DebugInfoParser::ParsePerfStats();
      }
      return 0;
    }
    a2[1] = *Scalar;
  }
  if (ANEDebugInfo::DebugInfoParser::CheckToken(a1, 2053))
  {
    unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord((ANEDebugInfo::DebugInfoParser *)a1);
    uint64_t v15 = v7;
    if (!HIDWORD(matched)) {
      return 0;
    }
    unint64_t v8 = (void *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
    if (!v8)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ANEDebugInfo::DebugInfoParser::ParsePerfStats();
      }
      return 0;
    }
    a2[2] = *v8;
  }
  if (!ANEDebugInfo::DebugInfoParser::CheckToken(a1, 2054)) {
    goto LABEL_15;
  }
  unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord((ANEDebugInfo::DebugInfoParser *)a1);
  uint64_t v15 = v9;
  if (!HIDWORD(matched)) {
    return 0;
  }
  long long v10 = (void *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
  if (!v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ANEDebugInfo::DebugInfoParser::ParsePerfStats();
    }
    return 0;
  }
  a2[3] = *v10;
LABEL_15:
  BOOL result = ANEDebugInfo::DebugInfoParser::CheckToken(a1, 2055);
  if (!result) {
    return result;
  }
  unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord((ANEDebugInfo::DebugInfoParser *)a1);
  uint64_t v15 = v12;
  if (!HIDWORD(matched)) {
    return 0;
  }
  uint64_t v13 = (void *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
  if (v13)
  {
    a2[4] = *v13;
    return 1;
  }
  BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ANEDebugInfo::DebugInfoParser::ParsePerfStats();
    return 0;
  }
  return result;
}

uint64_t ANEDebugInfo::DebugInfoParser::ParsePerfTracerInfo(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(_DWORD **)(a1 + 192);
  if ((unint64_t)v2 >= *(void *)(a1 + 216)) {
    return 0;
  }
  uint64_t result = 1;
  if (*v2 == 11)
  {
    uint64_t v6 = 0;
    *(void *)(a1 + 192) = v2 + 2;
    *(unsigned char *)(a1 + 186) = 1;
    while (1)
    {
      if (ANEDebugInfo::DebugInfoParser::CheckToken(a1, 2066))
      {
        unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord((ANEDebugInfo::DebugInfoParser *)a1);
        uint64_t v12 = v7;
        if (!HIDWORD(matched)) {
          return 0;
        }
        Scalar = (void *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
        if (!Scalar)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ANEDebugInfo::DebugInfoParser::ParsePerfTracerInfo();
          }
          return 0;
        }
        *(_DWORD *)(a2 + v6 + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *Scalar;
      }
      if (ANEDebugInfo::DebugInfoParser::CheckToken(a1, 2067))
      {
        unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord((ANEDebugInfo::DebugInfoParser *)a1);
        uint64_t v12 = v9;
        if (!HIDWORD(matched)) {
          return 0;
        }
        long long v10 = (void *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
        if (!v10)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ANEDebugInfo::DebugInfoParser::ParsePerfTracerInfo();
          }
          return 0;
        }
        *(_DWORD *)(a2 + v6 + 44) = *v10;
      }
      v6 += 8;
      if (v6 == 32) {
        return 1;
      }
    }
  }
  return result;
}

uint64_t ANEDebugInfo::DebugInfoParser::DebugPrint(ANEDebugInfo::DebugInfoParser *this)
{
  uint64_t v1 = (char *)*((void *)this + 26);
  uint64_t v2 = *((unsigned int *)this + 50);
  for (uint64_t i = &v1[v2]; *((void *)this + 24) < (unint64_t)&v1[v2]; uint64_t i = &v1[v2])
  {
    unint64_t matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    unint64_t v10 = matched;
    uint64_t v11 = v6;
    if (matched >= 0xFF) {
      unsigned int v7 = 255;
    }
    else {
      unsigned int v7 = matched;
    }
    if (v7 <= 9 && ((0x36Bu >> v7) & 1) != 0) {
      printf(off_26418E5D8[(char)v7]);
    }
    if (v10 <= 0xFF) {
      int v8 = 2065;
    }
    else {
      int v8 = v10;
    }
    switch(v8)
    {
      case 2048:
        printf("\tNAME");
        break;
      case 2049:
        printf("\tFILE_NAME");
        break;
      case 2050:
        if (ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&v10)) {
          printf("\tIOSurfaceID ID = %d");
        }
        break;
      case 2051:
        printf("\tDATA");
        break;
      default:
        if (v8 == 2062 && ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&v10)) {
          printf("\tViolatesMaxLatency = %s");
        }
        break;
    }
    printf("  [sz=%d p=%p]\n", HIDWORD(v10), v11);
    uint64_t v1 = (char *)*((void *)this + 26);
    uint64_t v2 = *((unsigned int *)this + 50);
  }
  return printf("buf=%p buf_sz=%d buf_tail=%p\n", v1, v2, i);
}

uint64_t std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::pair[abi:ne180100]<BOOL,ANEDebugInfo::DebugInfoInMem&,0>(uint64_t a1, unsigned char *a2, long long *a3)
{
  *(unsigned char *)a1 = *a2;
  long long v5 = *a3;
  long long v6 = a3[1];
  uint64_t v7 = *((void *)a3 + 4);
  *(void *)(a1 + 48) = 0;
  uint64_t v8 = a1 + 48;
  *(void *)(a1 + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v7;
  *(_OWORD *)(a1 + 24) = v6;
  *(_OWORD *)(a1 + 8) = v5;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*>((void *)(a1 + 48), *((void *)a3 + 5), *((void *)a3 + 6), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 6) - *((void *)a3 + 5)) >> 4));
  long long v9 = a3[4];
  *(_OWORD *)(v8 + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = a3[5];
  *(_OWORD *)(v8 + 24) = v9;
  std::unordered_map<std::string,unsigned int>::unordered_map(v8 + 56, (uint64_t)(a3 + 6));
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 16pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 144), *((long long **)a3 + 17), *((long long **)a3 + 18), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 18) - *((void *)a3 + 17)) >> 3));
  __int16 v10 = *((_WORD *)a3 + 80);
  *(unsigned char *)(a1 + 17pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((unsigned char *)a3 + 162);
  *(_WORD *)(a1 + 168) = v10;
  return a1;
}

void sub_2120BC540(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(v2);
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::pair[abi:ne180100]<BOOL,ANEDebugInfo::DebugInfoInMem,0>(uint64_t a1, unsigned char *a2, long long *a3)
{
  *(unsigned char *)a1 = *a2;
  long long v5 = *a3;
  uint64_t v6 = *((void *)a3 + 4);
  *(_OWORD *)(a1 + 24) = a3[1];
  *(_OWORD *)(a1 + 8) = v5;
  *(void *)(a1 + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v6;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 48) = *(long long *)((char *)a3 + 40);
  *(void *)(a1 + 64) = *((void *)a3 + 7);
  *((void *)a3 + 5) = 0;
  *((void *)a3 + 6) = 0;
  *((void *)a3 + 7) = 0;
  long long v7 = a3[4];
  *(_OWORD *)(a1 + 88) = a3[5];
  *(_OWORD *)(a1 + 72) = v7;
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__hash_table(a1 + 104, (uint64_t *)a3 + 12);
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 16pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  *(_OWORD *)(a1 + 144) = *(long long *)((char *)a3 + 136);
  *(void *)(a1 + 16pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((void *)a3 + 19);
  *((void *)a3 + 17) = 0;
  *((void *)a3 + 18) = 0;
  *((void *)a3 + 19) = 0;
  __int16 v8 = *((_WORD *)a3 + 80);
  *(unsigned char *)(a1 + 17pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *((unsigned char *)a3 + 162);
  *(_WORD *)(a1 + 168) = v8;
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__hash_table(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  *(void *)uint64_t result = v2;
  *(void *)(result + 8) = a2[1];
  a2[1] = 0;
  uint64_t v5 = a2[2];
  unint64_t v3 = a2 + 2;
  uint64_t v4 = v5;
  *(void *)(result + 16) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 24) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        v7 %= v8;
      }
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(void *)(v2 + 8 * v7) = result + 16;
    *unint64_t v3 = 0;
    v3[1] = 0;
  }
  return result;
}

void *std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Group>,ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_2120BC6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Group>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Group>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Group>,ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 != a3)
  {
    uint64_t v7 = 0;
    do
    {
      std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,ANEDebugInfo::DebugInfoInMem::Group&,ANEDebugInfo::DebugInfoInMem::Group*>((void *)(a4 + v7), a2 + v7);
      v7 += 48;
    }
    while (a2 + v7 != a3);
    a4 += v7;
  }
  return a4;
}

void sub_2120BC804(_Unwind_Exception *exception_object)
{
  if (v2)
  {
    uint64_t v4 = v1 - 48;
    do
    {
      std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,0>(v4 + v2);
      v2 -= 48;
    }
    while (v2);
  }
  _Unwind_Resume(exception_object);
}

void *std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,ANEDebugInfo::DebugInfoInMem::Group&,ANEDebugInfo::DebugInfoInMem::Group*>(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  std::vector<ANEDebugInfo::DebugInfoInMem::Layer>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Layer*,ANEDebugInfo::DebugInfoInMem::Layer*>(a1, *(const void **)a2, *(void *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2));
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  std::vector<ANEDebugInfo::DebugInfoInMem::TD>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::TD*,ANEDebugInfo::DebugInfoInMem::TD*>(a1 + 3, *(const void **)(a2 + 24), *(void *)(a2 + 32), 0x8E38E38E38E38E39 * ((uint64_t)(*(void *)(a2 + 32) - *(void *)(a2 + 24)) >> 3));
  return a1;
}

void sub_2120BC8A8(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::unordered_map<std::string,unsigned int>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(unsigned __int8 **)(a2 + 16); i; uint64_t i = *(unsigned __int8 **)i)
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,PerfTracerCategory> const&>(a1, i + 16, (uint64_t)(i + 16));
  return a1;
}

void sub_2120BC924(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_2120BC9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  uint64_t v11 = this;
  uint64_t v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  void v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      uint64_t v6 = (long long *)((char *)v6 + 24);
      uint64_t v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_2120BCAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

uint64_t std::vector<ANEDebugInfo::DebugInfoInMem>::__push_back_slow_path<ANEDebugInfo::DebugInfoInMem const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xCF3CF3CF3CF3CF3DLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x186186186186186) {
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xCF3CF3CF3CF3CF3DLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0xC30C30C30C30C3) {
    unint64_t v9 = 0x186186186186186;
  }
  else {
    unint64_t v9 = v5;
  }
  unint64_t v17 = a1 + 2;
  if (v9) {
    char v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem>>(v7, v9);
  }
  else {
    char v10 = 0;
  }
  uint64_t v13 = v10;
  unint64_t v14 = &v10[168 * v4];
  unint64_t v16 = &v10[168 * v9];
  std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,ANEDebugInfo::DebugInfoInMem const&,ANEDebugInfo::DebugInfoInMem*>((uint64_t)v14, a2);
  uint64_t v15 = v14 + 168;
  std::vector<ANEDebugInfo::DebugInfoInMem>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<ANEDebugInfo::DebugInfoInMem>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_2120BCC64(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<ANEDebugInfo::DebugInfoInMem>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,ANEDebugInfo::DebugInfoInMem const&,ANEDebugInfo::DebugInfoInMem*>(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  long long v5 = a2[1];
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(void *)(a1 + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*>((void *)(a1 + 40), *((void *)a2 + 5), *((void *)a2 + 6), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 6) - *((void *)a2 + 5)) >> 4));
  long long v6 = a2[5];
  *(_OWORD *)(a1 + 64) = a2[4];
  *(_OWORD *)(a1 + 8pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v6;
  std::unordered_map<std::string,unsigned int>::unordered_map(a1 + 96, (uint64_t)(a2 + 6));
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 136), *((long long **)a2 + 17), *((long long **)a2 + 18), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 18) - *((void *)a2 + 17)) >> 3));
  __int16 v7 = *((_WORD *)a2 + 80);
  *(unsigned char *)(a1 + 162) = *((unsigned char *)a2 + 162);
  *(_WORD *)(a1 + 16pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v7;
  return a1;
}

void sub_2120BCD40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(v2);
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t *std::vector<ANEDebugInfo::DebugInfoInMem>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v6 = a2[1];
  while (v4 != v5)
  {
    v6 -= 168;
    v4 -= 168;
    uint64_t result = (uint64_t *)std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,ANEDebugInfo::DebugInfoInMem,ANEDebugInfo::DebugInfoInMem*>(v6, v4);
  }
  a2[1] = v6;
  uint64_t v7 = *v3;
  *uint64_t v3 = v6;
  a2[1] = v7;
  uint64_t v8 = v3[1];
  v3[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = v3[2];
  v3[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x186186186186187) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(168 * a2);
}

uint64_t std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,ANEDebugInfo::DebugInfoInMem,ANEDebugInfo::DebugInfoInMem*>(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a2 + 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  long long v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 8pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v6;
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__hash_table(a1 + 96, (uint64_t *)(a2 + 96));
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a2 + 136) = 0;
  *(void *)(a2 + 144) = 0;
  *(void *)(a2 + 152) = 0;
  __int16 v7 = *(_WORD *)(a2 + 160);
  *(unsigned char *)(a1 + 162) = *(unsigned char *)(a2 + 162);
  *(_WORD *)(a1 + 16pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = v7;
  return a1;
}

uint64_t std::__split_buffer<ANEDebugInfo::DebugInfoInMem>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 168;
    std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,0>(i - 168);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__vdeallocate(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    long long v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 48;
        std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,0>(v3);
      }
      while ((void *)v3 != v1);
      long long v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__move_assign(uint64_t a1, uint64_t *a2)
{
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::clear(a1);
  uint64_t v4 = *a2;
  *a2 = 0;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v8 = a2[2];
  __int16 v7 = a2 + 2;
  uint64_t v6 = v8;
  uint64_t v9 = *(v7 - 1);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  uint64_t v10 = v7[1];
  *(void *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    unint64_t v11 = *(void *)(v6 + 8);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        v11 %= v12;
      }
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(void *)(*(void *)a1 + 8 * v11) = a1 + 16;
    *__int16 v7 = 0;
    v7[1] = 0;
  }
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
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

void std::vector<std::string>::__vdeallocate(std::vector<std::string> *this)
{
  if (this->__begin_)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this);
    operator delete(this->__begin_);
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
  }
}

uint64_t std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__push_back_slow_path<ANEDebugInfo::DebugInfoInMem::Group const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555) {
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v9 = 0x555555555555555;
  }
  else {
    unint64_t v9 = v5;
  }
  unint64_t v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Group>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v13 = v10;
  unint64_t v14 = &v10[48 * v4];
  unint64_t v16 = &v10[48 * v9];
  std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,ANEDebugInfo::DebugInfoInMem::Group const&,ANEDebugInfo::DebugInfoInMem::Group*>(v14, a2);
  uint64_t v15 = v14 + 48;
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<ANEDebugInfo::DebugInfoInMem::Group>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_2120BD1C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<ANEDebugInfo::DebugInfoInMem::Group>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,ANEDebugInfo::DebugInfoInMem::Group const&,ANEDebugInfo::DebugInfoInMem::Group*>(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  std::vector<ANEDebugInfo::DebugInfoInMem::Layer>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Layer*,ANEDebugInfo::DebugInfoInMem::Layer*>(a1, *(const void **)a2, *(void *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2));
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  std::vector<ANEDebugInfo::DebugInfoInMem::TD>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::TD*,ANEDebugInfo::DebugInfoInMem::TD*>(a1 + 3, *(const void **)(a2 + 24), *(void *)(a2 + 32), 0x8E38E38E38E38E39 * ((uint64_t)(*(void *)(a2 + 32) - *(void *)(a2 + 24)) >> 3));
  return a1;
}

void sub_2120BD258(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Group>,std::reverse_iterator<ANEDebugInfo::DebugInfoInMem::Group*>,std::reverse_iterator<ANEDebugInfo::DebugInfoInMem::Group*>,std::reverse_iterator<ANEDebugInfo::DebugInfoInMem::Group*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  uint64_t v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  uint64_t v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  uint64_t v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

__n128 std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Group>,std::reverse_iterator<ANEDebugInfo::DebugInfoInMem::Group*>,std::reverse_iterator<ANEDebugInfo::DebugInfoInMem::Group*>,std::reverse_iterator<ANEDebugInfo::DebugInfoInMem::Group*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 != a5)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = a7 + v7;
      uint64_t v9 = a3 + v7;
      *(void *)(v8 - 48) = 0;
      *(void *)(v8 - 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
      *(void *)(v8 - 32) = 0;
      *(_OWORD *)(v8 - 48) = *(_OWORD *)(a3 + v7 - 48);
      *(void *)(v8 - 32) = *(void *)(a3 + v7 - 32);
      *(void *)(v9 - 48) = 0;
      *(void *)(v9 - 4pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0) = 0;
      *(void *)(v9 - 32) = 0;
      *(void *)(v8 - 24) = 0;
      *(void *)(v8 - 16) = 0;
      *(void *)(v8 - 8) = 0;
      __n128 result = *(__n128 *)(a3 + v7 - 24);
      *(__n128 *)(v8 - 24) = result;
      *(void *)(v8 - 8) = *(void *)(a3 + v7 - 8);
      *(void *)(v9 - 24) = 0;
      *(void *)(v9 - 16) = 0;
      *(void *)(v9 - 8) = 0;
      v7 -= 48;
    }
    while (a3 + v7 != a5);
  }
  return result;
}

uint64_t std::__split_buffer<ANEDebugInfo::DebugInfoInMem::Group>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,0>(i - 48);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void H11ANE::H11ANEDevice::H11ANEDeviceOpen(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "H11ANEDevice::H11ANEDeviceOpen IOServiceOpen failed result= 0x%x\n", (uint8_t *)v1, 8u);
}

{
  _DWORD v1[2];
  uint64_t v2;

  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "H11ANEDevice::H11ANEDeviceOpen kH11ANEUserClientCommand_DeviceOpen call failed result=0x%x\n", (uint8_t *)v1, 8u);
}

void H11ANE::H11ANEDevice::ANE_ProgramSendRequest(int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = 136315650;
  uint64_t v2 = "ANE_ProgramSendRequest";
  __int16 v3 = 1024;
  int v4 = 1790;
  __int16 v5 = 1024;
  int v6 = a1;
  _os_log_error_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d status=%x\n", (uint8_t *)&v1, 0x18u);
}

void H11ANE::H11ANEDeviceController::SetupDeviceController()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  int v1 = "SetupDeviceController";
  _os_log_error_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR: %s:IONotificationPortGetRunLoopSource failed!\n", (uint8_t *)&v0, 0xCu);
}

void H11ANE::H11ANEFrameReceiver::stopReceive()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR: timedout waiting for the syncRequests to be completed\n", v0, 2u);
}

void H11ANE::H11ANEFrameReceiver::ProgramProcessRequest()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, v0, "ERROR: numInputBuffers = 0 or numInputBuffers > kANEMaxBuffers error = 0x%x\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, v0, "ERROR: inputBufferSurface is NULL error = 0x%x\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, v0, "ERROR: intermediateBufferSurface is NULL error = 0x%x\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, v0, "ERROR: outputBufferSurface is NULL error = 0x%x\n", v1, v2, v3, v4, v5);
}

void H11ANE::H11ANEFrameReceiver::ProgramProcessRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "ERROR: numOutputBuffers = 0 or numOutputBuffers > kANEMaxBuffers numOutputBuffers = %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "ERROR: numInputBuffers + numOutputBuffers = %d > kANEMaxBuffers\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "ERROR: ProgramProcessRequest failed with error = 0x%x\n", a5, a6, a7, a8, 0);
}

void H11ANE::H11ANEFrameReceiver::syncFrameDone()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "syncFrameDone: Request received for different program!! transactionId: 0x%llx, req->programHandle=0x%llx, reqCb->programHandle=0x%llx\n", v0, 0x20u);
}

{
  uint8_t v0[40];
  uint64_t v1;

  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "syncFrameDone: Request received for different program!! programHandle: 0x%llx, req->transactionID=0x%llx, reqCb->transactionID=0x%llx\n", v0, 0x20u);
}

void ZinIrCompilerParamsUtils::StringToPerfTracerConfig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0_0(&dword_21209C000, &_os_log_internal, a3, "Error: Invalid perf tracer metric1", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0_0(&dword_21209C000, &_os_log_internal, a3, "Error: Invalid perf tracer metric2", a5, a6, a7, a8, 0);
}

void H11ANEDeviceUpdateParameters_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEDeviceUpdateParameters_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, a3, "ERROR: %s: Cannot call this API with deviceUsageType=%d\n", a5, a6, a7, a8, 2u);
}

void H11ANEDeviceUpdateParameters_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: pANEDevice=%p or pANEDeviceParameters=%p is NULL\n", v1, v2, v3, v4, 2u);
}

void H11ANEDeviceClose_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEDeviceClose_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEDeviceClose_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEDeviceClose_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramPrepare_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramPrepare_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramPrepare_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: Cannot call this API with deviceUsageType=%d\n", v1, v2, v3, v4, v5);
}

void H11ANEProgramPrepare_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, v0, "pH11ANEDevice->ANE_ProgramPrepare failed with status=0x%x\n", v1, v2, v3, v4, v5);
}

void H11ANEProgramPrepare_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramPrepare_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramOutputSetEnqueue_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramOutputSetEnqueue_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: Bad arguments pANEDevice=0x%p outputSetEnqueueReqParams=%p\n", v1, v2, v3, v4, 2u);
}

void H11ANEProgramInputsReady_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramInputsReady_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: Bad arguments pANEDevice=0x%p outputSetEnqueueReqParams=%p\n", v1, v2, v3, v4, 2u);
}

void H11ANEProgramStop_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramStop_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: Cannot call this API with deviceUsageType=%d\n", v1, v2, v3, v4, v5);
}

void H11ANEProgramStop_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: ANE_ProgramUnprepare failed status=0x%x\n", v1, v2, v3, v4, 2u);
}

void H11ANEProgramDestroy_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramDestroy_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: Cannot call this API with deviceUsageType=%d\n", v1, v2, v3, v4, v5);
}

void H11ANEProgramDestroy_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramProcessRequestDirect_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramProcessRequestDirect_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramProcessRequestDirect_cold_3()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: Invalid arguments (programRequest->inputBuffersTot=%d programRequest->outputBuffersTot=%d\n", v1, v2, v3, v4, 2u);
}

void H11ANEProgramProcessRequestDirect_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: pH11ANEFrameReceiver->ProgramProcessRequest failed status=0x%x\n", v1, v2, v3, v4, 2u);
}

void H11ANEProgramProcessRequestDirect_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, v0, "WARN: Client sending down reserved priorities. Lowering priority to kANEProgramPriority2 0x%08X", v1, v2, v3, v4, v5);
}

void H11ANEProgramProcessRequestDirect_cold_6()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: Invalid arguments - sharedEvents->numWaitEvents:%u,  programRequest->numSignalEvents: %u\n", v1, v2, v3, v4, 2u);
}

void H11ANEProgramProcessRequestDirect_cold_7()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = v0;
  uint64_t v4 = v1;
  _os_log_error_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR: %s: Bad arguments pANEDevice=0x%p programRequest=%p requestCallback=%p \n", (uint8_t *)v2, 0x2Au);
}

void H11ANEProgramMemoryMapRequest_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramMemoryMapRequest_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramMemoryMapRequest_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: Invalid arguments - numMappings=%d maxAlloweMappings=%d\n", v1, v2, v3, v4, 2u);
}

void H11ANEProgramMemoryMapRequest_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: pH11ANEDevice->ANE_ProgramMemoryMapRequest failed status=0x%x\n", v1, v2, v3, v4, 2u);
}

void H11ANEProgramMemoryMapRequest_cold_5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: Bad arguments pANEDevice=0x%p memoryMappingParams=%p\n", v1, v2, v3, v4, 2u);
}

void H11ANEProgramMemoryUnmapRequest_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramMemoryUnmapRequest_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: pH11ANEDevice->ANE_ProgramMemoryMapRequest failed status=0x%x\n", v1, v2, v3, v4, 2u);
}

void H11ANEProgramMemoryUnmapRequest_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: Bad arguments pANEDevice=0x%p memoryMappingParams=%p\n", v1, v2, v3, v4, 2u);
}

void H11ANEProgramCreate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramCreateNewInstance_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEProgramCreateNewInstance_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "ERROR: %s: Cannot call this API with deviceUsageType=%d\n", v1, v2, v3, v4, v5);
}

void H11ANEProgramCreateNewInstance_cold_3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_11();
  int v1 = 16;
  _os_log_error_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR: numOfProcedures %u more than maxProcedures: %u\n", v0, 0xEu);
}

void H11ANEProgramCreateNewInstance_cold_4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_11();
  int v1 = 4;
  _os_log_error_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR: numWeightsBuffer %u more than maxBuffers: %u\n", v0, 0xEu);
}

void H11ANEHandleDeviceOpen_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, v0, "Error opening LB - status=0x%x\n", v1, v2, v3, v4, v5);
}

void H11ANEHandleDeviceOpen_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, v0, "Device Open failed - status=0x%x\n", v1, v2, v3, v4, v5);
}

void MyH11ANEDeviceMessageNotification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0_0(&dword_21209C000, &_os_log_internal, a3, "H11ANEDeviceMessageNotification: kH11ANEFirmwareFailure\n", a5, a6, a7, a8, 0);
}

void MyH11ANEDeviceMessageNotification()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "H11ANEDeviceMessageNotification: kH11ANEDeviceSleep\n", v0, 2u);
}

{
  uint8_t v0[16];

  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "H11ANEDeviceMessageNotification: kH11ANEDeviceWakeup\n", v0, 2u);
}

void H11ANEDeviceOpen_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, v0, "H11ANEDeviceOpen failed: 0x%x\n", v1, v2, v3, v4, v5);
}

void H11ANEDeviceOpen_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, v0, "ERROR: could not create H11ANEDeviceController object: 0x%08X", v1, v2, v3, v4, v5);
}

void H11ANEDeviceOpen_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEDeviceOpen_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEDeviceOpen_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11ANEFrameProcDirect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11InitializePlatformServices_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void H11InitializePlatformServices_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, v0, "Error opening H11ANEDevice: %08X\n", v1, v2, v3, v4, v5);
}

void H11InitializePlatformServices_cold_3(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)uint8_t buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Skipping LB: %08X\n", buf, 8u);
}

void H11InitializePlatformServices_cold_4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, v0, "Error loading firmware: %08X", v1, v2, v3, v4, v5);
}

void H11InitializePlatformServices_cold_5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, v0, "Failed to start work processor: %08X\n", v1, v2, v3, v4, v5);
}

void H11InitializePlatformServices_cold_6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, v0, "Failed to create work processor: %08X\n", v1, v2, v3, v4, v5);
}

void H11InitializePlatformServices_cold_7()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "H11InitializePlatformServices is called\n", v0, 2u);
}

void ZinCreateAnalytics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "Procedure not found for index %d", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

void ZinCreateAnalytics(uint8_t *a1, _DWORD *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 568;
  OUTLINED_FUNCTION_1_1(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 582;
  OUTLINED_FUNCTION_1_1(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 601;
  OUTLINED_FUNCTION_1_1(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 612;
  OUTLINED_FUNCTION_1_1(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 617;
  OUTLINED_FUNCTION_1_1(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 636;
  OUTLINED_FUNCTION_1_1(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 444;
  OUTLINED_FUNCTION_1_1(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 451;
  OUTLINED_FUNCTION_1_1(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 394;
  OUTLINED_FUNCTION_1_1(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 401;
  OUTLINED_FUNCTION_1_1(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 408;
  OUTLINED_FUNCTION_1_1(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 415;
  OUTLINED_FUNCTION_1_1(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 490;
  OUTLINED_FUNCTION_1_1(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 471;
  OUTLINED_FUNCTION_1_1(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a1);
}

void ZinCreateAnalytics(uint8_t *buf, unsigned char *a2)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[ANE Analytics] Group table must be stored prior to Group Info.", buf, 2u);
}

void ZinDumpAnalytics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

void ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ZinDumpAnalyticsInJSON(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_21209C000, &_os_log_internal, a3, "rc check failed at %d\n", a5, a6, a7, a8, 0);
}

void ZinComputeAnalyticsBufferSize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MemPool::alloc<_AnalyticsProcedureInfo>()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_21209C000, &_os_log_internal, v0, "Allocating more than what's available in the pool. Buf std::string::size_type size = %ld", v1, v2, v3, v4, v5);
}

void MemPool::get_offset<unsigned long long>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANEDebugInfo::DebugInfoParser::ParseCU()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

void ANEDebugInfo::DebugInfoParser::ParseCU(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_21209C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Parser does not support version %lld\n", (uint8_t *)&v1, 0xCu);
}

void ANEDebugInfo::DebugInfoParser::MatchRecord(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANEDebugInfo::Record::GetScalarVal<unsigned long long>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANEDebugInfo::DebugInfoParser::ParseProc()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

void ANEDebugInfo::DebugInfoParser::ParseHwConfigs()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

void ANEDebugInfo::DebugInfoParser::ParseIdentString()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

void ANEDebugInfo::DebugInfoParser::ParseMaxContextLatencyThreshold()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

void ANEDebugInfo::DebugInfoParser::ParseGroup()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

void ANEDebugInfo::DebugInfoParser::ParseLayer()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

void ANEDebugInfo::DebugInfoParser::ParseTD()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

void ANEDebugInfo::DebugInfoParser::ParseOperation()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

void ANEDebugInfo::DebugInfoParser::ParseViolateMaxContextLatencyFlag()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

void ANEDebugInfo::DebugInfoParser::ParsePerfStats()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

void ANEDebugInfo::DebugInfoParser::ParsePerfTracerInfo()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0(&dword_21209C000, &_os_log_internal, v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4AE8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x270EE4AF0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

CFMessagePortRef CFMessagePortCreateLocal(CFAllocatorRef allocator, CFStringRef name, CFMessagePortCallBack callout, CFMessagePortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMessagePortRef)MEMORY[0x270EE4B28](allocator, name, callout, context, shouldFreeInfo);
}

CFMessagePortRef CFMessagePortCreateRemote(CFAllocatorRef allocator, CFStringRef name)
{
  return (CFMessagePortRef)MEMORY[0x270EE4B30](allocator, name);
}

CFRunLoopSourceRef CFMessagePortCreateRunLoopSource(CFAllocatorRef allocator, CFMessagePortRef local, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4B38](allocator, local, order);
}

void CFMessagePortInvalidate(CFMessagePortRef ms)
{
}

void CFMessagePortSetDispatchQueue(CFMessagePortRef ms, dispatch_queue_t queue)
{
}

void CFMessagePortSetInvalidationCallBack(CFMessagePortRef ms, CFMessagePortInvalidationCallBack callout)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x270EE4F00](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA148](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA198](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA208](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA268](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA280](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CFDictionaryRef auxAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA2A0](allocator, pixelBufferPool, auxAttributes, pixelBufferOut);
}

uint64_t CVPixelBufferPoolPreAllocate()
{
  return MEMORY[0x270EEA2D0]();
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

uint64_t CVPixelBufferPoolScanIOSurfaces()
{
  return MEMORY[0x270EEA2F8]();
}

uint64_t CVPixelBufferPoolSetMinBufferCount()
{
  return MEMORY[0x270EEA300]();
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA328](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA338](pixelBuffer, unlockFlags);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F18](*(void *)&connection, *(void *)&selector, *(void *)&wake_port, reference, *(void *)&referenceCnt, input, *(void *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOCreateReceivePort(uint32_t msgType, mach_port_t *recvPort)
{
  return MEMORY[0x270EF3FD0](*(void *)&msgType, recvPort);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47A8](*(void *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4C50](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D68](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
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

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x270F98640]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x270F98750]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A0]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987E0]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x270F98878]();
}

const std::locale *std::locale::classic(void)
{
  return (const std::locale *)MEMORY[0x270F98C68]();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x270F98C70](this, a2);
}

void std::locale::~locale(std::locale *this)
{
}

const std::locale *__cdecl std::locale::operator=(std::locale *this, const std::locale *a2)
{
  return (const std::locale *)MEMORY[0x270F98C88](this, a2);
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

std::locale std::ios_base::imbue(std::ios_base *this, const std::locale *__loc)
{
  return (std::locale)MEMORY[0x270F98D58](this, __loc);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

char *__cdecl dirname(char *a1)
{
  return (char *)MEMORY[0x270ED9190](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x270ED9AC8](__stream, a2, *(void *)&__whence);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x270ED9B20](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x270F9C740](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x270EDA550](path, omode);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

void perror(const char *a1)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE20](a1, *(void *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x270EDAE30](a1, a2);
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

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x270EDAEB0](a1, a2);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
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

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF78](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x270EDB038](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x270EDB630](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x270EDB8F8](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x270EDB908](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}