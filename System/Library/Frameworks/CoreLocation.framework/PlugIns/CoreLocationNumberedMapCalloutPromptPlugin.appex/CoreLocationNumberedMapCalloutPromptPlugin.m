void sub_100004888(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000524C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000053F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_100005604(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000056DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000058B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1000062F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000065F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000672C(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t Callout::to_string@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  switch((int)result)
  {
    case 0:
      *(unsigned char *)(a2 + 23) = 2;
      *(_WORD *)a2 = 28789;
      break;
    case 1:
      *(unsigned char *)(a2 + 23) = 4;
      *(_DWORD *)a2 = 1952867692;
      break;
    case 2:
      *(unsigned char *)(a2 + 23) = 5;
      *(_DWORD *)a2 = 1751607666;
      *(unsigned char *)(a2 + 4) = 116;
      break;
    case 3:
      *(unsigned char *)(a2 + 23) = 6;
      *(_DWORD *)a2 = 1953787746;
      *(_WORD *)(a2 + 4) = 28015;
      break;
    default:
      return result;
  }
  return result;
}

void sub_100006C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006CDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (qword_100015CC8 != -1) {
      dispatch_once(&qword_100015CC8, &stru_1000103B8);
    }
    v4 = (id)qword_100015CD0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = &unk_10000D8BD;
      *(_WORD *)&buf[18] = 1026;
      *(_DWORD *)&buf[20] = [v3 authorizationDenied];
      *(_WORD *)&buf[24] = 1026;
      *(_DWORD *)&buf[26] = [v3 locationUnavailable];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"received valid update\", \"authorizationDenied\":%{public}hhd, \"locationUnavailable\":%{public}hhd}", buf, 0x1Eu);
    }

    if (qword_100015CC8 != -1) {
      dispatch_once(&qword_100015CC8, &stru_1000103B8);
    }
    v5 = (id)qword_100015CD0;
    if (os_signpost_enabled(v5))
    {
      unsigned int v6 = [v3 authorizationDenied];
      unsigned int v7 = [v3 locationUnavailable];
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = &unk_10000D8BD;
      *(_WORD *)&buf[18] = 1026;
      *(_DWORD *)&buf[20] = v6;
      *(_WORD *)&buf[24] = 1026;
      *(_DWORD *)&buf[26] = v7;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "received valid update", "{\"msg%{public}.0s\":\"received valid update\", \"authorizationDenied\":%{public}hhd, \"locationUnavailable\":%{public}hhd}", buf, 0x1Eu);
    }

    if (([v3 authorizationDenied] & 1) == 0
      && ([v3 locationUnavailable] & 1) == 0)
    {
      v8 = [v3 location];
      BOOL v9 = v8 == 0;

      if (!v9)
      {
        v10 = [v3 location];
        [*(id *)(a1 + 32) setCurrentLocation:v10];

        long long v38 = 0u;
        memset(v39, 0, sizeof(v39));
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v33 = 0u;
        memset(buf, 0, sizeof(buf));
        v11 = [*(id *)(a1 + 32) currentLocation];
        v12 = v11;
        if (v11)
        {
          [v11 clientLocation];
        }
        else
        {
          long long v38 = 0u;
          memset(v39, 0, sizeof(v39));
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v33 = 0u;
          memset(buf, 0, sizeof(buf));
        }

        if (qword_100015CC8 != -1) {
          dispatch_once(&qword_100015CC8, &stru_1000103B8);
        }
        v15 = qword_100015CD0;
        if (os_log_type_enabled((os_log_t)qword_100015CD0, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 68289539;
          int v25 = 0;
          __int16 v26 = 2082;
          v27 = &unk_10000D8BD;
          __int16 v28 = 1040;
          int v29 = 156;
          __int16 v30 = 2097;
          v31 = buf;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"received valid update with valid clientLocation\", \"location\":%{private, location:CLClientLocation}.*P}", (uint8_t *)&v24, 0x22u);
        }
        if (qword_100015CC8 != -1) {
          dispatch_once(&qword_100015CC8, &stru_1000103B8);
        }
        v16 = qword_100015CD0;
        if (os_signpost_enabled((os_log_t)qword_100015CD0))
        {
          int v24 = 68289539;
          int v25 = 0;
          __int16 v26 = 2082;
          v27 = &unk_10000D8BD;
          __int16 v28 = 1040;
          int v29 = 156;
          __int16 v30 = 2097;
          v31 = buf;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "received valid update with valid clientLocation", "{\"msg%{public}.0s\":\"received valid update with valid clientLocation\", \"location\":%{private, location:CLClientLocation}.*P}", (uint8_t *)&v24, 0x22u);
        }
        v17 = [*(id *)(a1 + 32) currentLocation];
        [v17 horizontalAccuracy];
        [*(id *)(a1 + 32) setShowMapView:v18 <= 100.0];

        if ([*(id *)(a1 + 32) showMapView])
        {
          v19 = [*(id *)(a1 + 32) currentLocation];
          [v19 horizontalAccuracy];
          BOOL v21 = v20 > 100.0;

          if (!v21)
          {
            if (qword_100015CC8 != -1) {
              dispatch_once(&qword_100015CC8, &stru_1000103B8);
            }
            v22 = qword_100015CD0;
            if (os_log_type_enabled((os_log_t)qword_100015CD0, OS_LOG_TYPE_DEFAULT))
            {
              int v24 = 68289026;
              int v25 = 0;
              __int16 v26 = 2082;
              v27 = &unk_10000D8BD;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"showing map\"}", (uint8_t *)&v24, 0x12u);
            }
            if (qword_100015CC8 != -1) {
              dispatch_once(&qword_100015CC8, &stru_1000103B8);
            }
            v23 = qword_100015CD0;
            if (os_signpost_enabled((os_log_t)qword_100015CD0))
            {
              int v24 = 68289026;
              int v25 = 0;
              __int16 v26 = 2082;
              v27 = &unk_10000D8BD;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "showing map", "{\"msg%{public}.0s\":\"showing map\"}", (uint8_t *)&v24, 0x12u);
            }
            [*(id *)(a1 + 32) updateMapLayout];
            [*(id *)(a1 + 32) configureMapSubLabels];
          }
        }
      }
    }
  }
  else
  {
    if (qword_100015CC8 != -1) {
      dispatch_once(&qword_100015CC8, &stru_1000103B8);
    }
    v13 = qword_100015CD0;
    if (os_log_type_enabled((os_log_t)qword_100015CD0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = &unk_10000D8BD;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"received invalid update, skipping\"}", buf, 0x12u);
    }
    if (qword_100015CC8 != -1) {
      dispatch_once(&qword_100015CC8, &stru_1000103B8);
    }
    v14 = qword_100015CD0;
    if (os_signpost_enabled((os_log_t)qword_100015CD0))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)&buf[8] = 2082;
      *(void *)&buf[10] = &unk_10000D8BD;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "received invalid update, skipping", "{\"msg%{public}.0s\":\"received invalid update, skipping\"}", buf, 0x12u);
    }
  }
}

void sub_10000735C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_100007F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_100008B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100008E28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000090C4()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_1000090F8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.corelocation.CoreLocationNumberedMapCalloutPromptPlugin", "Prompt");
  v2 = (void *)qword_100015CD0;
  qword_100015CD0 = (uint64_t)v1;
}

double sub_10000913C(unsigned int a1)
{
  unsigned int v2 = a1;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100015E20, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100015E20))
  {
    v3[0] = xmmword_10000C580;
    v3[1] = xmmword_10000C590;
    sub_100009260((uint64_t)&unk_100015DF8, (unsigned int *)v3, 4);
    __cxa_atexit((void (*)(void *))sub_10000925C, &unk_100015DF8, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_100015E20);
  }
  *(void *)&v3[0] = &v2;
  return (double)*((int *)sub_100009790((uint64_t)&unk_100015DF8, &v2, (uint64_t)&std::piecewise_construct, (_DWORD **)v3)
                 + 5);
}

void sub_10000923C(_Unwind_Exception *a1)
{
}

uint64_t sub_100009260(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 8 * a3;
    do
    {
      sub_1000092D8(a1, a2, a2);
      a2 += 2;
      v5 -= 8;
    }
    while (v5);
  }
  return a1;
}

void sub_1000092C4(_Unwind_Exception *a1)
{
  sub_100009744(v1);
  _Unwind_Resume(a1);
}

void *sub_1000092D8(uint64_t a1, unsigned int *a2, void *a3)
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
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    BOOL v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
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
          v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x18uLL);
  void *v10 = 0;
  v10[1] = v6;
  v10[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_1000094F8(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
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
  uint64_t v18 = *(void *)a1;
  v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *v10 = *v19;
LABEL_38:
    void *v19 = v10;
    goto LABEL_39;
  }
  void *v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_1000094E4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1000094F8(uint64_t a1, size_t __n)
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
      sub_1000095E8(a1, prime);
    }
  }
}

void sub_1000095E8(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_1000090C4();
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
      unint64_t v11 = (void *)*v7;
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
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t sub_100009744(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      unsigned int v2 = v3;
    }
    while (v3);
  }
  int8x8_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *sub_100009790(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
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
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
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
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  unint64_t v11 = operator new(0x18uLL);
  void *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((_DWORD *)v11 + 5) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    sub_1000094F8(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
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
  uint64_t v19 = *(void *)a1;
  unint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    void *v11 = *v20;
LABEL_38:
    void *v20 = v11;
    goto LABEL_39;
  }
  void *v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    unint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_1000099A0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_100009C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009D9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A1C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return _CGGradientCreateWithColors(space, colors, locations);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
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

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_allowedClassesForUnarchiving(void *a1, const char *a2, ...)
{
  return [a1 allowedClassesForUnarchiving];
}

id objc_msgSend_annotationDict(void *a1, const char *a2, ...)
{
  return [a1 annotationDict];
}

id objc_msgSend_annotationViews(void *a1, const char *a2, ...)
{
  return [a1 annotationViews];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authorizationDenied(void *a1, const char *a2, ...)
{
  return [a1 authorizationDenied];
}

id objc_msgSend_authorizationPromptMapDisplayEnabled(void *a1, const char *a2, ...)
{
  return [a1 authorizationPromptMapDisplayEnabled];
}

id objc_msgSend_backgroundPlatter1(void *a1, const char *a2, ...)
{
  return [a1 backgroundPlatter1];
}

id objc_msgSend_backgroundPlatter2(void *a1, const char *a2, ...)
{
  return [a1 backgroundPlatter2];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_calloutIconSize(void *a1, const char *a2, ...)
{
  return [a1 calloutIconSize];
}

id objc_msgSend_calloutImageView(void *a1, const char *a2, ...)
{
  return [a1 calloutImageView];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_cgColor(void *a1, const char *a2, ...)
{
  return [a1 cgColor];
}

id objc_msgSend_clientDict(void *a1, const char *a2, ...)
{
  return [a1 clientDict];
}

id objc_msgSend_clientLocation(void *a1, const char *a2, ...)
{
  return [a1 clientLocation];
}

id objc_msgSend_configureCallouts(void *a1, const char *a2, ...)
{
  return [a1 configureCallouts];
}

id objc_msgSend_configureMapSubLabels(void *a1, const char *a2, ...)
{
  return [a1 configureMapSubLabels];
}

id objc_msgSend_configureMapView(void *a1, const char *a2, ...)
{
  return [a1 configureMapView];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLocation(void *a1, const char *a2, ...)
{
  return [a1 currentLocation];
}

id objc_msgSend_demandCreateLocationManager(void *a1, const char *a2, ...)
{
  return [a1 demandCreateLocationManager];
}

id objc_msgSend_effectiveBundlePath(void *a1, const char *a2, ...)
{
  return [a1 effectiveBundlePath];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_extensionInputItems(void *a1, const char *a2, ...)
{
  return [a1 extensionInputItems];
}

id objc_msgSend_filterExcludingAllCategories(void *a1, const char *a2, ...)
{
  return [a1 filterExcludingAllCategories];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return [a1 horizontalAccuracy];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return [a1 keyWindow];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_locManager(void *a1, const char *a2, ...)
{
  return [a1 locManager];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationUnavailable(void *a1, const char *a2, ...)
{
  return [a1 locationUnavailable];
}

id objc_msgSend_mainPlatterView(void *a1, const char *a2, ...)
{
  return [a1 mainPlatterView];
}

id objc_msgSend_mapCountLabelString(void *a1, const char *a2, ...)
{
  return [a1 mapCountLabelString];
}

id objc_msgSend_mapCountSubLabel(void *a1, const char *a2, ...)
{
  return [a1 mapCountSubLabel];
}

id objc_msgSend_mapSubLabel(void *a1, const char *a2, ...)
{
  return [a1 mapSubLabel];
}

id objc_msgSend_mapSubMessageString(void *a1, const char *a2, ...)
{
  return [a1 mapSubMessageString];
}

id objc_msgSend_mapType(void *a1, const char *a2, ...)
{
  return [a1 mapType];
}

id objc_msgSend_mapView(void *a1, const char *a2, ...)
{
  return [a1 mapView];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_region(void *a1, const char *a2, ...)
{
  return [a1 region];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_secondSubtitleLabel(void *a1, const char *a2, ...)
{
  return [a1 secondSubtitleLabel];
}

id objc_msgSend_setupPlatters(void *a1, const char *a2, ...)
{
  return [a1 setupPlatters];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_showBackgroundPlatters(void *a1, const char *a2, ...)
{
  return [a1 showBackgroundPlatters];
}

id objc_msgSend_showMapView(void *a1, const char *a2, ...)
{
  return [a1 showMapView];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return [a1 subtitleLabel];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_updateMapLayout(void *a1, const char *a2, ...)
{
  return [a1 updateMapLayout];
}

id objc_msgSend_updater(void *a1, const char *a2, ...)
{
  return [a1 updater];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_visibleBounds(void *a1, const char *a2, ...)
{
  return [a1 visibleBounds];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}