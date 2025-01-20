void sub_1A2C417C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A2C419C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C41B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C41BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C41E74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C41F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *NIAcwgSessionTriggerReasonToString(uint64_t a1)
{
  v1 = @"DeviceCloserIntent";
  v2 = @"DeviceFallbackWalletInteractionIntent";
  v3 = @"LockSelfInitiated";
  if (a1 != 200) {
    v3 = @"DeviceCloserIntent";
  }
  if (a1 != 103) {
    v2 = v3;
  }
  if (a1 == 102) {
    v1 = @"DeviceFallbackGeofenceEntryIntent";
  }
  if (a1 == 101) {
    v1 = @"DeviceFallbackWristRaiseIntent";
  }
  if (a1 <= 102) {
    return v1;
  }
  else {
    return v2;
  }
}

__CFString *NIAcwgSuspendTriggerReasonToString(uint64_t a1)
{
  switch(a1)
  {
    case 'e':
      result = @"DeviceReceivedUnlockNotification";
      break;
    case 'f':
      result = @"DeviceStationary";
      break;
    case 'g':
      result = @"DeviceNITimeout";
      break;
    case 'h':
      result = @"DeviceNIInterrupted";
      break;
    case 'i':
      result = @"DeviceNIInvalidated";
      break;
    case 'j':
      result = @"DeviceNIError";
      break;
    case 'k':
      result = @"DeviceClientPause";
      break;
    default:
      v2 = @"DeviceFarther";
      if (a1 == 201) {
        v2 = @"LockUnilaterallySuspended";
      }
      if (a1 == 200) {
        result = @"LockSelfInitiatedRequest";
      }
      else {
        result = v2;
      }
      break;
  }
  return result;
}

void sub_1A2C42138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4226C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C42308(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

void nsNumberArrayToStdVector<unsigned short>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  __p[0] = 0;
  __p[1] = 0;
  v26 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
  uint64_t v20 = a2;
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(id *)(*((void *)&v21 + 1) + 8 * i);
        __int16 v8 = [v7 longLongValue];
        __int16 v9 = v8;
        v10 = (char *)__p[1];
        if (__p[1] >= v26)
        {
          v12 = (char *)__p[0];
          int64_t v13 = (char *)__p[1] - (char *)__p[0];
          if ((char *)__p[1] - (char *)__p[0] <= -3) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v14 = v13 >> 1;
          if (v26 - (char *)__p[0] <= (unint64_t)((v13 >> 1) + 1)) {
            uint64_t v15 = v14 + 1;
          }
          else {
            uint64_t v15 = v26 - (char *)__p[0];
          }
          if ((unint64_t)(v26 - (char *)__p[0]) >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v16 = v15;
          }
          if (v16)
          {
            v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&v26, v16);
            v12 = (char *)__p[0];
            v10 = (char *)__p[1];
          }
          else
          {
            v17 = 0;
          }
          v18 = &v17[2 * v14];
          *(_WORD *)v18 = v9;
          v11 = v18 + 2;
          while (v10 != v12)
          {
            __int16 v19 = *((_WORD *)v10 - 1);
            v10 -= 2;
            *((_WORD *)v18 - 1) = v19;
            v18 -= 2;
          }
          __p[0] = v18;
          __p[1] = v11;
          v26 = &v17[2 * v16];
          if (v12) {
            operator delete(v12);
          }
        }
        else
        {
          *(_WORD *)__p[1] = v8;
          v11 = v10 + 2;
        }
        __p[1] = v11;
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v4);
  }

  *(_OWORD *)uint64_t v20 = *(_OWORD *)__p;
  *(void *)(v20 + 16) = v26;
}

void sub_1A2C42524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void nsNumberArrayToStdVector<unsigned char>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  v29 = 0;
  v30 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v31 count:16];
  long long v23 = a2;
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v24 + 1) + 8 * i);
        char v9 = [v8 longLongValue];
        char v10 = v9;
        if (v5 >= v30)
        {
          uint64_t v11 = v28;
          v12 = &v5[-v28];
          uint64_t v13 = (uint64_t)&v5[-v28 + 1];
          if (v13 < 0) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v14 = (unint64_t)&v30[-v28];
          if (2 * (uint64_t)&v30[-v28] > (unint64_t)v13) {
            uint64_t v13 = 2 * v14;
          }
          if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
            size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            size_t v15 = v13;
          }
          if (v15) {
            uint64_t v16 = (char *)operator new(v15);
          }
          else {
            uint64_t v16 = 0;
          }
          v17 = &v12[(void)v16];
          v18 = &v12[(void)v16];
          char *v18 = v10;
          __int16 v19 = v18 + 1;
          if (v5 != (char *)v11)
          {
            uint64_t v20 = &v5[~v11];
            do
            {
              char v21 = *--v5;
              (v20--)[(void)v16] = v21;
            }
            while (v5 != (char *)v11);
            uint64_t v5 = (char *)v28;
            v17 = v16;
          }
          uint64_t v28 = (uint64_t)v17;
          v29 = v19;
          v30 = &v16[v15];
          if (v5) {
            operator delete(v5);
          }
          uint64_t v5 = v19;
        }
        else
        {
          *v5++ = v9;
        }
        v29 = v5;
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v4);
    uint64_t v4 = v28;
    long long v22 = v30;
  }
  else
  {
    long long v22 = 0;
    uint64_t v5 = 0;
  }

  *long long v23 = v4;
  v23[1] = (uint64_t)v5;
  v23[2] = (uint64_t)v22;
}

void sub_1A2C42768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1A2C428A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C42990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C42C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C42E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C42F04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C43108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4326C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C43348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C434D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C43640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C436E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C43814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4392C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C439A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<unsigned short>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5AC2350, MEMORY[0x1E4FBA1C8]);
}

void sub_1A2C43A28(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

uint64_t rose::alisha::AcwgM1MsgStruct::AcwgM1MsgStruct(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5, char a6)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>((void *)a1, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 1);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>((void *)(a1 + 24), *(const void **)a3, *(void *)(a3 + 8), *(void *)(a3 + 8) - *(void *)a3);
  *(unsigned char *)(a1 + 48) = a4;
  *(_DWORD *)(a1 + 52) = a5;
  *(unsigned char *)(a1 + 56) = a6;
  return a1;
}

void sub_1A2C43B5C(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>(void *result, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    result = std::vector<unsigned short>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A2C43BD8(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned short>::__vallocate[abi:ne180100](void *a1, uint64_t a2)
{
  if (a2 < 0) {
    std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A2C43C94(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

double combinedQuaternionFromAoA(float a1, float a2)
{
  __float2 v3 = __sincosf_stret(a1 * 0.5);
  float32x4_t v10 = vmulq_n_f32((float32x4_t)xmmword_1A2C7A9D0, v3.__sinval);
  __float2 v4 = __sincosf_stret(a2 * 0.5);
  float32x4_t v5 = vmulq_n_f32((float32x4_t)xmmword_1A2C7A9E0, v4.__sinval);
  v6.i32[0] = LODWORD(v4.__cosval);
  v6.f32[1] = -v5.f32[2];
  v6.i32[2] = v5.i32[1];
  *(float32x2_t *)v7.f32 = vneg_f32(*(float32x2_t *)v5.f32);
  v6.i32[3] = v7.i32[0];
  v8.i32[0] = vdupq_laneq_s32((int32x4_t)v5, 2).u32[0];
  v8.i32[1] = LODWORD(v4.__cosval);
  v8.i64[1] = v7.i64[0];
  v7.i32[0] = vdup_lane_s32(*(int32x2_t *)v7.f32, 1).u32[0];
  v7.i32[1] = v5.i32[0];
  v7.i32[2] = LODWORD(v4.__cosval);
  v7.f32[3] = -v5.f32[2];
  v5.i32[3] = LODWORD(v4.__cosval);
  *(void *)&double result = vmlaq_n_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v6, v10.f32[0]), v8, *(float32x2_t *)v10.f32, 1), v7, v10, 2), v5, v3.__cosval).u64[0];
  return result;
}

__n64 unitVectorForAoAInNearbydCoordinates(float *a1)
{
  __float2 v2 = __sincosf_stret(*a1);
  float cosval = __sincosf_stret(a1[4]).__cosval;
  result.n64_u32[0] = LODWORD(v2.__sinval);
  result.n64_f32[1] = v2.__cosval * cosval;
  return result;
}

double unitVectorForAoAInSpatialCoordinates(float *a1)
{
  __float2 v2 = __sincosf_stret(*a1);
  return COERCE_DOUBLE(__PAIR64__(v2.__cosval * __sincosf_stret(a1[1]).__sinval, LODWORD(v2.__sinval)));
}

float convertAoAFromNearbydCoordinatesToSpatialCoordinates(float *a1)
{
  float v2 = *a1;
  float v3 = cosf(*a1);
  __float2 v4 = __sincosf_stret(a1[1]);
  atan2f(v3 * v4.__cosval, -(float)(v3 * v4.__sinval));
  return v2;
}

float calculateAoAFromUnitVectorInSpatialCoordinates(float a1, float a2, float a3)
{
  float v3 = a3;
  float v4 = a2;
  float v5 = sqrtf((float)((float)(a2 * a2) + (float)(a1 * a1)) + (float)(a3 * a3));
  if (v5 >= 0.000001)
  {
    a1 = a1 / v5;
    float v4 = v4 / v5;
    float v3 = a3 / v5;
  }
  float v6 = asinf(a1);
  atan2f(v4, -v3);
  return v6;
}

void sub_1A2C448C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1A2C44970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C449CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C44A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C44AAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C44C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1A2C44F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C45074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C45200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C45388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C454FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C45650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C458C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C45D2C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);

  _Unwind_Resume(a1);
}

void sub_1A2C45DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C45E5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C45F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C46280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C463E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C46664(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C466F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4687C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C46960(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
}

void __clang_call_terminate(void *a1)
{
}

void sub_1A2C46AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C46C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__791(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  long long v4 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v4;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_1A2C46E5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C46EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C47108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1A2C471DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C473F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C47584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4782C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1A2C478BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C47928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C479E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C47C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2C47CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C47D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C47E04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C480E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C48228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C485B0(_Unwind_Exception *exception_object)
{
}

void sub_1A2C486B4(_Unwind_Exception *a1)
{
  long long v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A2C48730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4879C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C488EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4895C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C48A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A2C48AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C48BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2C48C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C48E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A2C48EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C48FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C490C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4917C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2C491E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C492C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C493B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4942C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C49514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A2C49590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C49678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A2C496F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C497DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C498BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4999C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C49A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A2C49AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C49C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A2C49CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C49E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2C49E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C49FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4A060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4A324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4A41C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4A494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__CFString *NIAlgorithmConvergenceStatusReasonDescription_Private(void *a1)
{
  uint64_t v1 = a1;
  float v2 = v1;
  if (v1 == @"insufficientSignalStrength")
  {
    long long v4 = @"NIALGORITHMCONVERGENCESTATUSREASON_INSUFFICIENTSIGNALSTRENGTH";
  }
  else if (v1 == @"insufficientHorizontalSweep")
  {
    long long v4 = @"NIALGORITHMCONVERGENCESTATUSREASON_INSUFFICIENTHORIZONTALSWEEP";
  }
  else if (v1 == @"insufficientVerticalSweep")
  {
    long long v4 = @"NIALGORITHMCONVERGENCESTATUSREASON_INSUFFICIENTVERTICALSWEEP";
  }
  else if (v1 == @"insufficientMovement")
  {
    long long v4 = @"NIALGORITHMCONVERGENCESTATUSREASON_INSUFFICIENTMOVEMENT";
  }
  else
  {
    if (v1 != @"insufficientLighting")
    {
      long long v3 = v1;
      goto LABEL_13;
    }
    long long v4 = @"NIALGORITHMCONVERGENCESTATUSREASON_INSUFFICIENTLIGHTING";
  }
  long long v3 = +[NILocalization _niLocalizedStringFromFrameworkBundleWithKey:v4];
LABEL_13:
  float v5 = v3;

  return v5;
}

void sub_1A2C4A588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl NIAlgorithmConvergenceStatusReasonDescription(const NIAlgorithmConvergenceStatusReason reason)
{
  uint64_t v1 = NIAlgorithmConvergenceStatusReasonDescription_Private(reason);

  return (NSString *)v1;
}

void sub_1A2C4AA50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4AC98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4AD90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4AE40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4AEE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4B06C(_Unwind_Exception *a1)
{
  long long v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A2C4B370(_Unwind_Exception *a1)
{
  long long v3 = v1;

  _Unwind_Resume(a1);
}

void sub_1A2C4B46C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4B930(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4BA14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4BAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4BB50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4BBC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4BC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4BE64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4BECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4C254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4C3D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4C51C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4C6CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4C73C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4C870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4C9BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4CA90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4CC0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4CD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4CDE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4CEAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4D138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4D1C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4D244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4D3C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4D4DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4D568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4D73C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4D88C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4D92C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4D9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4DA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4DB64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4DC04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4DCC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4DD34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4DDBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4DE44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4DFCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4E048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4E198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4E214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4E338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4E420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4E4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4E520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4E6D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4E774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4E930(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4E9D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4EB8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4EC2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4EDE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4EE88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4F018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4F0AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4F23C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4F2D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4F4C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4F5C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4F6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4F93C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4FB24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4FBD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4FD2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4FDA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C4FF9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C50024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C500D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C50194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5031C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C50380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C50488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C504EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C505D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C506B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C50794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C50874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5099C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C50AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C50B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C50C58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C50CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C50F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C50FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C513B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C514B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C517F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C518EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C51AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C51B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C51D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C51E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C52090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C52140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C521C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C52238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C523C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C52440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C525F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C52694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C52880(_Unwind_Exception *a1)
{
  long long v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A2C52930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void NINotifySystemShutdownWithReason(uint64_t a1, void *a2)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  long long v3 = a2;
  long long v4 = +[NIServerConnection createOneShotConnectionAndResume:1];
  float v5 = [v4 remoteObjectProxy];
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy_;
  long long v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  size_t v15 = __NINotifySystemShutdownWithReason_block_invoke;
  uint64_t v16 = &unk_1E5AC2C00;
  v18 = &v26;
  __int16 v19 = &v20;
  float32x4_t v7 = v6;
  v17 = v7;
  [v5 notifySystemShutdownWithReason:a1 reply:&v13];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(*(double *)&kNISystemShutdownCompletionTimeoutSeconds * 1000000000.0));
  dispatch_semaphore_wait(v7, v8);
  objc_msgSend(v4, "invalidate", v13, v14, v15, v16);
  if (*((unsigned char *)v27 + 24))
  {
    char v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v31[0] = @"Shutdown notification timed out.";
    float32x4_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v11 = [v9 errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v10];
    v12 = (void *)v21[5];
    v21[5] = v11;
  }
  v3[2](v3, v21[5]);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
}

void sub_1A2C52C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  uint64_t v20 = va_arg(va1, void);
  id v21 = va_arg(va1, id);
  uint64_t v13 = v12;

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);

  _Unwind_Resume(a1);
}

void __NINotifySystemShutdownWithReason_block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<UWBSessionInterruptionBookkeeping>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1A2C52FA0(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A2C531C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C53588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C53A0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C53D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C54000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C543E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5484C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C549AC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A2C54AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C54BAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C54CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C54DA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C54EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C54FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5514C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A2C55224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C55320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C55444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C554FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C555E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C55700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C55790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C55814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5590C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C55A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C55D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C55F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C560C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C56214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5650C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C566E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C567E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C56958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C56A6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C56CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C56E30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C56F24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C56FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C57214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C573D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C57518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C57734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C57904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1A2C57A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C57B10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C57BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C57C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C57D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C57E3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C57F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_1A2C5807C(_Unwind_Exception *a1)
{
  long long v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A2C581C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C582AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C583CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C584FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C585A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C58654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5870C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5887C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C58964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C58ABC(_Unwind_Exception *a1)
{
  operator delete(v4);
  operator delete(v3);

  _Unwind_Resume(a1);
}

void sub_1A2C58C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C58DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C58EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5911C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1A2C591C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C593AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5952C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C596DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C59BAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  _Unwind_Resume(a1);
}

void sub_1A2C59D44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C59F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5A060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5A190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5A29C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5A554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5A7B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5A92C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5AA9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5ACA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5ADA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5AE5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5B098(_Unwind_Exception *a1)
{
  float32x4_t v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1A2C5B210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5B330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5B434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    dispatch_semaphore_t v6 = result;
    __n128 result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A2C5B554(_Unwind_Exception *exception_object)
{
  long long v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A2C5B7DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5B930(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5BAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5BC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5BD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5BEF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5C294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1A2C5C6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  v37 = v36;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

void sub_1A2C5CB20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5CFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  uint64_t v34 = v32;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A2C5D464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  uint64_t v34 = v32;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A2C5D904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  uint64_t v34 = v32;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A2C5DC04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5DCC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5DEC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5E02C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5E154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5E34C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5E560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5E6FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5E8A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5EC48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5EFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5F008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5F378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5F8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,void *a28,void *a29,void *a30,void *a31)
{
  _Unwind_Resume(a1);
}

void sub_1A2C5F9D8()
{
}

void sub_1A2C60088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C60168()
{
  *(void *)(v1 - 160) = v0;
  JUMPOUT(0x1A2C60158);
}

void sub_1A2C606E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13)
{
  if (v16 != v19) {
  if (v15 != v18)
  }

  if (v14 != v17) {
  _Unwind_Resume(a1);
  }
}

void sub_1A2C607F8()
{
}

void sub_1A2C60800()
{
}

void sub_1A2C60808()
{
}

void sub_1A2C60810()
{
}

void sub_1A2C60818()
{
}

void sub_1A2C60820()
{
}

void sub_1A2C60828()
{
}

void sub_1A2C60830()
{
}

void sub_1A2C60838()
{
}

void sub_1A2C60840()
{
}

void sub_1A2C60848()
{
}

void sub_1A2C60850()
{
}

void sub_1A2C60858()
{
}

uint64_t extractHashFromSimdFloat3(__n128 a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithFloat:");
  uint64_t v2 = [v1 hash];
  HIDWORD(v3) = a1.n128_u32[1];
  LODWORD(v3) = a1.n128_u32[1];
  id v4 = [NSNumber numberWithFloat:v3];
  uint64_t v5 = [v4 hash];
  dispatch_semaphore_t v6 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  uint64_t v7 = v5 ^ v2 ^ [v6 hash];

  return v7;
}

void sub_1A2C60908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C60B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C610A8(_Unwind_Exception *a1)
{
  if (v3 != v4) {

  }
  _Unwind_Resume(a1);
}

void sub_1A2C611DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6155C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C61670(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A2C61720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6182C(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A2C61A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C61B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C61CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C61E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C61E8C()
{
}

void sub_1A2C61F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C620C8(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A2C623A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C624EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C62774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C62A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C62C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C62D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6389C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C63914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C639E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C63BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A2C63C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C63D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C63E44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C640D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6431C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C64408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6454C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C64850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C64974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C64A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C64B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C64B70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C64C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C64D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C64E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C65068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C651E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C65314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id NIErrorWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = a1 + 5889;
  if ((unint64_t)(a1 + 5889) <= 9)
  {
    uint64_t v6 = *((void *)&off_1E5AC2E80 + v5);
    uint64_t v7 = *((void *)&off_1E5AC2ED0 + v5);
    size_t v8 = +[NILocalization _niLocalizedStringFromFrameworkBundleWithKey:*((void *)&off_1E5AC2E30 + v5)];
    [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28568]];

    uint64_t v9 = +[NILocalization _niLocalizedStringFromFrameworkBundleWithKey:v6];
    [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28588]];

    float32x4_t v10 = +[NILocalization _niLocalizedStringFromFrameworkBundleWithKey:v7];
    [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F285A0]];
  }
  if (v3) {
    [v4 addEntriesFromDictionary:v3];
  }
  uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.NearbyInteraction" code:a1 userInfo:v4];

  return v11;
}

id NIInternalErrorWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = v4;
  if (!v7 & v6)
  {
    size_t v8 = @"Check Bluetooth settings, status and configuration.";
    uint64_t v9 = @"Bluetooth is currently unavailable.";
    switch(a1)
    {
      case -10017:
        goto LABEL_26;
      case -10016:
        uint64_t v9 = @"Failed to produce a Discovery Token.";
        goto LABEL_26;
      case -10015:
      case -10009:
        break;
      case -10014:
        size_t v8 = @"Monitor session suspension callbacks. Try again when suspension ends.";
        uint64_t v9 = @"Usage while suspended.";
        goto LABEL_26;
      case -10013:
        size_t v8 = @"Ensure region predicates are using NIDevicePresencePreset. Use NIRegionPredicate initWithName:devicePresencePreset: initializer. Ensure the smaller region predicate is specified as the inner boundary.";
        uint64_t v9 = @"Region predicate verification failed.";
        goto LABEL_26;
      case -10012:
        size_t v8 = @"Ensure peer discovery token was generated correctly.";
        uint64_t v9 = @"Peer discovery token was either invalid or did not contain required information for specialized session.";
        goto LABEL_26;
      case -10011:
        size_t v8 = @"Try running the session again at a later time. Implement throttling if necessary.";
        uint64_t v9 = @"Activation reply not received. The server may be unavailable right now.";
        goto LABEL_26;
      case -10010:
        size_t v8 = @"Check the errors and run the session again.";
        uint64_t v9 = @"Camera Assistance ARSession failed.";
        goto LABEL_26;
      case -10008:
        size_t v8 = @"No action needed as the session completed successfully";
        uint64_t v9 = @"The session completed successfully";
        goto LABEL_26;
      default:
        switch(a1)
        {
          case -19703:
            size_t v8 = @"Wrong UWB session ID possibly";
            uint64_t v9 = @"Indicates URSK corresponding to the UWB Session Identifier is not found.";
            goto LABEL_26;
          case -19702:
            size_t v8 = @"Rework the message parameters or fix the order";
            uint64_t v9 = @"Indicates use of unsupported message or message format.";
            goto LABEL_26;
          case -19701:
            size_t v8 = @"Try again later";
            uint64_t v9 = @"Indicates internal resource unavailability.";
            goto LABEL_26;
          case -19700:
            size_t v8 = @"Check the logs for specific internal error";
            uint64_t v9 = @"No specific reason for failure is indicated.";
            goto LABEL_26;
          default:
            goto LABEL_27;
        }
    }
  }
  else
  {
    switch(a1)
    {
      case -19889:
        size_t v8 = @"Check the message from the vehicle for format violation";
        uint64_t v9 = @"The session was given an invalid or unexpected DCK message.";
        break;
      case -19888:
        size_t v8 = @"Try again or check the vehicle";
        uint64_t v9 = @"The session was expecting a response from the vehicle and did not receive it for over the allowed time.";
        break;
      case -19887:
        size_t v8 = @"Event from bluetooth is corrupted";
        uint64_t v9 = @"The bluetooth event provided to the session was of an invalid type or contained invalid values.";
        break;
      case -19886:
        size_t v8 = @"Check the logs for specific internal error";
        uint64_t v9 = @"The given debug key was invalid or the system was not able to set it. Inspect error message.";
        break;
      case -19885:
        size_t v8 = @"Vehicle possibly changed its ranging capabilities";
        uint64_t v9 = @"The capabilities specified in a DCK message are not supported. An action should be taken to indicate this to the vehicle.";
        break;
      case -19884:
        size_t v8 = @"Try again at a later time";
        uint64_t v9 = @"A DCK request to recover a suspended ranging session has been received, but recovery has failed. An action should be taken to indicate this to the vehicle.";
        break;
      case -19883:
        size_t v8 = @"Most likely an internal error, try again.";
        uint64_t v9 = @"URSKs could not be deleted";
        break;
      case -19882:
        size_t v8 = @"Pick one of the supported policies";
        uint64_t v9 = @"The priority provided to the session was of an invalid type or contained invalid values";
        break;
      case -19881:
        size_t v8 = @"Check the event notification parameters or format";
        uint64_t v9 = @"The session was notified of a Car Key event, but the event or its parameters were invalid";
        break;
      default:
        JUMPOUT(0);
    }
LABEL_26:
    [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28588]];
    [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F285A0]];
  }
LABEL_27:
  if (v3) {
    [v5 addEntriesFromDictionary:v3];
  }
  float32x4_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.NearbyInteraction" code:a1 userInfo:v5];

  return v10;
}

void sub_1A2C65B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C65D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C65F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C661F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C664C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1A2C66540()
{
}

void sub_1A2C66548()
{
}

void sub_1A2C66550()
{
}

void sub_1A2C66558()
{
}

void sub_1A2C66560()
{
}

void sub_1A2C66568()
{
}

void sub_1A2C66570()
{
}

void sub_1A2C66578()
{
}

void sub_1A2C66618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C66938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_1A2C669E8()
{
}

void sub_1A2C669FC()
{
}

void sub_1A2C66A0C()
{
}

void sub_1A2C66A1C()
{
}

void sub_1A2C66A2C()
{
}

void sub_1A2C66A3C()
{
}

void sub_1A2C66A48()
{
}

void sub_1A2C66A50()
{
}

void sub_1A2C66C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C66D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C66E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C66F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C67060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C67120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C67238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6735C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C674B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6758C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C676CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C67840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C67904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C679AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C67C44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C67CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C67DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C67E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C67F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C67FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C68098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C68154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C682B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C68438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6856C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C68688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *NIRegionSizeCategoryToString(uint64_t a1)
{
  if (!a1) {
    return @"Default";
  }
  if (a1 != 10) {
    -[NIRegionPredicate descriptionInternal]();
  }
  return @"Large";
}

double PRCommonConvertTicksToSeconds(unint64_t a1)
{
  double v2 = *(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds;
  if (*(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds == 0.0)
  {
    if (mach_timebase_info(&info)) {
      PRCommonConvertTicksToSeconds();
    }
    if (info.denom)
    {
      uint32_t denom = info.denom;
      uint32_t numer = info.numer;
      do
      {
        uint32_t v5 = denom;
        uint32_t denom = numer % denom;
        uint32_t numer = v5;
      }
      while (denom);
    }
    else
    {
      uint32_t v5 = info.numer;
    }
    unsigned int v6 = 1000000000;
    uint32_t v7 = info.numer / v5;
    do
    {
      uint32_t v8 = v7;
      uint32_t v7 = v6;
      unsigned int v6 = v8 % v6;
    }
    while (v6);
    double v2 = (double)(info.numer / v5 / v7) / (double)(0x3B9ACA00 / v7 * (unint64_t)(info.denom / v5));
    *(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds = v2;
  }
  return v2 * (double)a1;
}

double PRCommonGetMachTimeSeconds(void)
{
  uint64_t v0 = mach_absolute_time();

  return PRCommonConvertTicksToSeconds(v0);
}

double PRCommonGetMachContinuousTimeSeconds(void)
{
  uint64_t v0 = mach_continuous_time();

  return PRCommonConvertTicksToSeconds(v0);
}

BOOL PRCommonGetAllTimes(double *a1, double *a2, double *a3)
{
  int times = mach_get_times();
  if (!times)
  {
    if (a1) {
      *a1 = (double)v9 / 1000000000.0 + (double)v8 - *MEMORY[0x1E4F1CF78];
    }
    if (a2) {
      *a2 = PRCommonConvertTicksToSeconds(0);
    }
    if (a3) {
      *a3 = PRCommonConvertTicksToSeconds(0);
    }
  }
  return times == 0;
}

id PRCommonConvertNSDataToHexNSString(NSData *a1, int a2)
{
  id v3 = a1;
  memset(&v16, 0, sizeof(v16));
  std::vector<unsigned char>::vector(&v14, [(NSData *)v3 length]);
  [(NSData *)v3 getBytes:v14 length:[(NSData *)v3 length]];
  double v4 = (unsigned __int8 *)v14;
  uint32_t v5 = v15;
  if (v14 == v15)
  {
    uint64_t v9 = &v16;
  }
  else
  {
    do
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%02X", *v4);
      id v6 = objc_claimAutoreleasedReturnValue();
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);

      if ((v13 & 0x80u) == 0) {
        uint32_t v7 = __p;
      }
      else {
        uint32_t v7 = (void **)__p[0];
      }
      if ((v13 & 0x80u) == 0) {
        std::string::size_type v8 = v13;
      }
      else {
        std::string::size_type v8 = (std::string::size_type)__p[1];
      }
      if (a2) {
        std::string::insert(&v16, 0, (const std::string::value_type *)v7, v8);
      }
      else {
        std::string::append(&v16, (const std::string::value_type *)v7, v8);
      }
      if ((char)v13 < 0) {
        operator delete(__p[0]);
      }
      ++v4;
    }
    while (v4 != v5);
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v9 = &v16;
    }
    else {
      uint64_t v9 = (std::string *)v16.__r_.__value_.__r.__words[0];
    }
  }
  float32x4_t v10 = [NSString stringWithUTF8String:v9];
  if (v14)
  {
    double v15 = (unsigned __int8 *)v14;
    operator delete(v14);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }

  return v10;
}

void sub_1A2C68C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

id PRCommonConvertHexNSStringToNSData(NSString *a1)
{
  uint64_t v1 = a1;
  if ([(NSString *)v1 length])
  {
    double v2 = 0;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[(NSString *)v1 UTF8String]);
    double v2 = objc_opt_new();
    __int16 v11 = 0;
    BOOL v3 = (v14 & 0x80u) != 0;
    unint64_t v4 = v14;
    if ((v14 & 0x80u) != 0) {
      unint64_t v4 = v13;
    }
    if (v4 >= 2)
    {
      uint64_t v5 = 0;
      do
      {
        if (v3) {
          p_p = (char *)__p;
        }
        else {
          p_p = (char *)&__p;
        }
        *(_WORD *)__str = *(_WORD *)&p_p[v5];
        HIBYTE(v11) = strtol(__str, 0, 16);
        [v2 appendBytes:(char *)&v11 + 1 length:1];
        unint64_t v7 = v5 + 3;
        v5 += 2;
        BOOL v3 = (v14 & 0x80u) != 0;
        unint64_t v8 = v14;
        if ((v14 & 0x80u) != 0) {
          unint64_t v8 = v13;
        }
      }
      while (v8 > v7);
    }
    if ((char)v14 < 0) {
      operator delete(__p);
    }
  }

  return v2;
}

void sub_1A2C68DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

char *PRCommonSerializePrintableState(void *a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void *)MEMORY[0x1A623D8C0]();
  id v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:0];
  if ((unint64_t)[v6 length] > 0x8000)
  {
    unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"WARNING: statedump too big (%d > %d)", objc_msgSend(v6, "length"), 0x8000);
    unint64_t v8 = (void *)MEMORY[0x1E4F28F98];
    id v15 = v3;
    v16[0] = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v10 = [v8 dataWithPropertyList:v9 format:200 options:0 error:0];

    id v6 = (void *)v10;
  }
  __int16 v11 = (char *)malloc_type_calloc(1uLL, [v6 length] + 200, 0x7E1CA1B2uLL);
  *(_DWORD *)__int16 v11 = 1;
  *((_DWORD *)v11 + 1) = [v6 length];
  id v12 = [NSString stringWithFormat:@"[nearbyd] %@", v3];
  strlcpy(v11 + 136, (const char *)[v12 UTF8String], 0x40uLL);

  id v13 = v6;
  memcpy(v11 + 200, (const void *)[v13 bytes], objc_msgSend(v13, "length"));

  return v11;
}

{
  id v3;
  id v4;
  void *v5;
  char *v6;
  id v8;
  void v9[2];

  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  unint64_t v8 = v3;
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = PRCommonSerializePrintableState(v3, v5);

  return v6;
}

void sub_1A2C68FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C690D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::vector<unsigned char>::vector(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    id v4 = (char *)a1[1];
    uint64_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_1A2C69150(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
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
    id v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    id v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void sub_1A2C698C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6995C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C69A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C69AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C69BCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C69CC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C69DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C69E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C69F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C69FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6A0A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id UWBMakeSessionServerXPCInterface()
{
  v74[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF5E41E8];
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  v67 = objc_msgSend(v1, "initWithObjects:", v2, v3, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v66 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v65 = objc_msgSend(v8, "initWithObjects:", v9, v10, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  id v11 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v68 = objc_msgSend(v11, "initWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
  v74[0] = objc_opt_class();
  v74[1] = objc_opt_class();
  v74[2] = objc_opt_class();
  v74[3] = objc_opt_class();
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
  objc_msgSend(v68, "addObjectsFromArray:");
  v73[0] = objc_opt_class();
  v73[1] = objc_opt_class();
  v73[2] = objc_opt_class();
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
  objc_msgSend(v68, "addObjectsFromArray:");
  v72[0] = objc_opt_class();
  v72[1] = objc_opt_class();
  v72[2] = objc_opt_class();
  v72[3] = objc_opt_class();
  v72[4] = objc_opt_class();
  v72[5] = objc_opt_class();
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:6];
  objc_msgSend(v68, "addObjectsFromArray:");
  v71[0] = objc_opt_class();
  v71[1] = objc_opt_class();
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
  objc_msgSend(v68, "addObjectsFromArray:");
  uint64_t v70 = objc_opt_class();
  v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
  objc_msgSend(v68, "addObjectsFromArray:");
  v69[0] = objc_opt_class();
  v69[1] = objc_opt_class();
  v69[2] = objc_opt_class();
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];
  objc_msgSend(v68, "addObjectsFromArray:");
  id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v62 = objc_msgSend(v17, "initWithObjects:", v18, v19, objc_opt_class(), 0);
  uint64_t v20 = objc_msgSend(v68, "setByAddingObjectsFromSet:");
  [v0 setClasses:v20 forSelector:sel_runWithConfiguration_reply_ argumentIndex:0 ofReply:0];

  [v0 setClass:objc_opt_class() forSelector:sel__addObject_reply_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel__removeObject_reply_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_processDCKMessage_reply_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_processDCKMessage_reply_ argumentIndex:0 ofReply:1];
  [v0 setClass:objc_opt_class() forSelector:sel_processDCKMessage_reply_ argumentIndex:1 ofReply:1];
  [v0 setClass:objc_opt_class() forSelector:sel_processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter_reply_ argumentIndex:0 ofReply:1];
  [v0 setClass:objc_opt_class() forSelector:sel_isRangingLimitExceeded_ argumentIndex:1 ofReply:1];
  id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  v57 = objc_msgSend(v21, "initWithObjects:", v22, v23, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  [v0 setClass:objc_opt_class() forSelector:sel__processCarKeyEvent_reply_ argumentIndex:0 ofReply:1];
  [v0 setClass:objc_opt_class() forSelector:sel_processAcwgM1Msg_withSessionTriggerReason_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_processAcwgM3Msg_ argumentIndex:0 ofReply:0];
  id v24 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v25 = objc_opt_class();
  v55 = objc_msgSend(v24, "initWithObjects:", v25, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  v56 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  id v26 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  v54 = objc_msgSend(v26, "initWithObjects:", v27, v28, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  id v29 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v30 = objc_opt_class();
  v31 = objc_msgSend(v29, "initWithObjects:", v30, objc_opt_class(), 0);
  [v0 setClasses:v31 forSelector:sel_setLocalDeviceCanInteract_withDiscoveryTokens_reply_ argumentIndex:1 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_setLocalDeviceCanInteract_withDiscoveryTokens_reply_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v31 forSelector:sel_setLocalDeviceInteractableDiscoveryTokens_reply_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_setLocalDeviceInteractableDiscoveryTokens_reply_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v31 forSelector:sel_getInteractableDiscoveryTokens_ argumentIndex:0 ofReply:1];
  [v0 setClass:objc_opt_class() forSelector:sel_getInteractableDiscoveryTokens_ argumentIndex:1 ofReply:1];
  [v0 setClasses:v31 forSelector:sel_getActivelyInteractingDiscoveryTokens_ argumentIndex:0 ofReply:1];
  [v0 setClass:objc_opt_class() forSelector:sel_getActivelyInteractingDiscoveryTokens_ argumentIndex:1 ofReply:1];
  id v32 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  v53 = objc_msgSend(v32, "initWithObjects:", v33, v34, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:");
  [v0 setClass:objc_opt_class() forSelector:sel_getLocalDevicePrintableState_ argumentIndex:1 ofReply:1];
  id v35 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  v43 = objc_msgSend(v35, "initWithObjects:", v36, v37, v38, v39, v40, v41, v42, objc_opt_class(), 0);
  [v0 setClasses:v43 forSelector:sel__processFindingEvent_reply_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel__processFindingEvent_reply_ argumentIndex:0 ofReply:1];
  id v44 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  v47 = objc_msgSend(v44, "initWithObjects:", v45, v46, objc_opt_class(), 0);
  [v0 setClasses:v47 forSelector:sel_setLocalDeviceDebugParameters_reply_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_setLocalDeviceDebugParameters_reply_ argumentIndex:0 ofReply:1];
  id v48 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v49 = objc_opt_class();
  uint64_t v50 = objc_opt_class();
  v51 = objc_msgSend(v48, "initWithObjects:", v49, v50, objc_opt_class(), 0);
  [v0 setClasses:v51 forSelector:sel__processSystemEvent_reply_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel__processSystemEvent_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_1A2C6AD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33)
{
  _Unwind_Resume(a1);
}

id UWBMakeSessionDelegateXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF5DDCC0];
  [v0 setClass:objc_opt_class() forSelector:sel_didUpdateLocalDiscoveryToken_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_uwbSessionDidInvalidateWithError_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_uwbSessionDidFailWithError_ argumentIndex:0 ofReply:0];
  id v1 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v1, "initWithObjects:", v2, v3, v4, v5, v6, objc_opt_class(), 0);
  [v0 setClasses:v7 forSelector:sel_didUpdateNearbyObjects_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v7 forSelector:sel_didRemoveNearbyObjects_withReason_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_didDiscoverNearbyObject_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_object_didUpdateRegion_previousRegion_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_object_didUpdateRegion_previousRegion_ argumentIndex:1 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_object_didUpdateRegion_previousRegion_ argumentIndex:2 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_relayDCKMessage_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_didProcessAcwgM1MsgWithResponse_error_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_didProcessAcwgM3MsgWithResponse_error_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_didProcessAcwgRangingSessionResumeRequestMsgWithResponse_error_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_didReceiveRangingAuthRecommendation_forObject_ argumentIndex:1 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_didUpdateAlgorithmState_forObject_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_didUpdateAlgorithmState_forObject_ argumentIndex:1 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_systemDidUpdateState_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_systemDidUpdateResourceUsageLimitExceeded_forSessionConfigurationTypeWithName_ argumentIndex:1 ofReply:0];

  return v0;
}

void sub_1A2C6B290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *UWBSessionInterruptionReasonInternalToString(unint64_t a1)
{
  if (a1 > 7) {
    return @"AirplaneModeActive";
  }
  else {
    return off_1E5AC2F60[a1];
  }
}

__CFString *UWBTrackingStopReasonInternalToString(uint64_t a1)
{
  id v1 = @"Timeout";
  if (a1 == 1) {
    id v1 = @"PeerEnded";
  }
  if (a1 == 2) {
    return @"LocalForceRemoved";
  }
  else {
    return v1;
  }
}

void sub_1A2C6B470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6B570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6B644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6B7E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6B954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6BA98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6BB58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6BD2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6BE44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6BF64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6C0C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6C160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A2C6C304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t NINearbyObject.distance.getter()
{
  return sub_1A2C6C48C((SEL *)&selRef_distance, &NINearbyObjectDistanceNotAvailable_Private);
}

double NINearbyObject.direction.getter()
{
  objc_msgSend(v0, sel_direction);
  uint64_t v2 = 0;
  while (1)
  {
    long long v7 = v1;
    float v4 = *(float *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3)));
    long long v8 = NINearbyObjectDirectionNotAvailable_Private;
    float v5 = *(float *)((unint64_t)&v8 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3)));
    BOOL v3 = v4 == v5;
    if (v2 == 2) {
      break;
    }
    while (1)
    {
      ++v2;
      if (v3) {
        break;
      }
      if (v2 == 2) {
        goto LABEL_8;
      }
      BOOL v3 = 0;
    }
  }
  if (v4 != v5) {
LABEL_8:
  }
    objc_msgSend(v0, sel_direction, v7, v8);
  return *(double *)&v1;
}

unint64_t NINearbyObject.horizontalAngle.getter()
{
  return sub_1A2C6C48C((SEL *)&selRef_horizontalAngle, &NINearbyObjectAngleNotAvailable_Private);
}

unint64_t NINearbyObject.horizontalAngleAccuracy.getter()
{
  return sub_1A2C6C48C((SEL *)&selRef_horizontalAngleAccuracy, &NINearbyObjectAngleNotAvailable_Private);
}

unint64_t sub_1A2C6C48C(SEL *a1, float *a2)
{
  [v2 *a1];
  float v6 = v5;
  float v7 = *a2;
  if (v5 == *a2)
  {
    uint64_t v8 = 0;
  }
  else
  {
    [v2 *a1];
    uint64_t v8 = v9;
  }
  return v8 | ((unint64_t)(v6 == v7) << 32);
}

uint64_t sub_1A2C6C514(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = a2 + 32;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v7 = 0;
  uint64_t v8 = (uint64_t *)(a1 + 40);
  while (v7 == v3)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    unint64_t v7 = v3;
    if (!v4) {
      goto LABEL_19;
    }
LABEL_10:
    uint64_t v14 = *(v8 - 1);
    uint64_t v12 = *v8;
    swift_bridgeObjectRetain();
    if (!v10) {
      goto LABEL_19;
    }
    if (!v12) {
      goto LABEL_16;
    }
    if (v11 == v14 && v10 == v12)
    {
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      char v9 = sub_1A2C6DFE0();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v9 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
    }
    --v4;
    v8 += 2;
  }
  if (v7 >= v3)
  {
    __break(1u);
    return result;
  }
  uint64_t v13 = (uint64_t *)(v5 + 16 * v7);
  uint64_t v11 = *v13;
  uint64_t v10 = v13[1];
  swift_bridgeObjectRetain();
  if (v4)
  {
    ++v7;
    goto LABEL_10;
  }
  if (v10)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  uint64_t v12 = 0;
LABEL_19:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12)
  {
LABEL_20:
    swift_bridgeObjectRelease();
    return 0;
  }
  return 1;
}

uint64_t NIAlgorithmConvergenceStatus.Reason.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NIAlgorithmConvergenceStatus.Reason.rawValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*NIAlgorithmConvergenceStatus.Reason.rawValue.modify())()
{
  return nullsub_1;
}

NearbyInteraction::NIAlgorithmConvergenceStatus::Reason __swiftcall NIAlgorithmConvergenceStatus.Reason.init(rawValue:)(NearbyInteraction::NIAlgorithmConvergenceStatus::Reason rawValue)
{
  NearbyInteraction::NIAlgorithmConvergenceStatus::Reason *v1 = rawValue;
  return rawValue;
}

uint64_t NIAlgorithmConvergenceStatus.Reason.localizedDescription.getter()
{
  uint64_t v0 = (void *)sub_1A2C6DF70();
  uint64_t v1 = NIAlgorithmConvergenceStatusReasonDescription_Private(v0);

  uint64_t v2 = sub_1A2C6DFA0();
  return v2;
}

uint64_t sub_1A2C6C790()
{
  return sub_1A2C6E000();
}

uint64_t sub_1A2C6C7EC()
{
  swift_bridgeObjectRetain();
  sub_1A2C6DFB0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2C6C844()
{
  return sub_1A2C6E000();
}

uint64_t sub_1A2C6C89C(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_1A2C6DFE0();
  }
}

void *sub_1A2C6C8CC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_1A2C6C8D8@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A2C6C8E4()
{
  uint64_t result = sub_1A2C6DFA0();
  qword_1E959D7A8 = result;
  unk_1E959D7B0 = v1;
  return result;
}

uint64_t *sub_1A2C6C914()
{
  if (qword_1E959D7A0 != -1) {
    swift_once();
  }
  return &qword_1E959D7A8;
}

uint64_t static NIAlgorithmConvergenceStatus.Reason.insufficientSignalStrength.getter@<X0>(void *a1@<X8>)
{
  return sub_1A2C6CC18(&qword_1E959D7A0, &qword_1E959D7A8, &qword_1E959D7B0, a1);
}

uint64_t sub_1A2C6C988()
{
  uint64_t result = sub_1A2C6DFA0();
  qword_1E959D7C0 = result;
  *(void *)algn_1E959D7C8 = v1;
  return result;
}

uint64_t *sub_1A2C6C9B8()
{
  if (qword_1E959D7B8 != -1) {
    swift_once();
  }
  return &qword_1E959D7C0;
}

uint64_t static NIAlgorithmConvergenceStatus.Reason.insufficientHorizontalSweep.getter@<X0>(void *a1@<X8>)
{
  return sub_1A2C6CC18(&qword_1E959D7B8, &qword_1E959D7C0, (uint64_t *)algn_1E959D7C8, a1);
}

uint64_t sub_1A2C6CA2C()
{
  uint64_t result = sub_1A2C6DFA0();
  qword_1E959D7D8 = result;
  unk_1E959D7E0 = v1;
  return result;
}

uint64_t *sub_1A2C6CA5C()
{
  if (qword_1E959D7D0 != -1) {
    swift_once();
  }
  return &qword_1E959D7D8;
}

uint64_t static NIAlgorithmConvergenceStatus.Reason.insufficientVerticalSweep.getter@<X0>(void *a1@<X8>)
{
  return sub_1A2C6CC18(&qword_1E959D7D0, &qword_1E959D7D8, &qword_1E959D7E0, a1);
}

uint64_t sub_1A2C6CAD0()
{
  uint64_t result = sub_1A2C6DFA0();
  qword_1E959D7F0 = result;
  *(void *)algn_1E959D7F8 = v1;
  return result;
}

uint64_t *sub_1A2C6CB00()
{
  if (qword_1E959D7E8 != -1) {
    swift_once();
  }
  return &qword_1E959D7F0;
}

uint64_t static NIAlgorithmConvergenceStatus.Reason.insufficientMovement.getter@<X0>(void *a1@<X8>)
{
  return sub_1A2C6CC18(&qword_1E959D7E8, &qword_1E959D7F0, (uint64_t *)algn_1E959D7F8, a1);
}

uint64_t sub_1A2C6CB74()
{
  uint64_t result = sub_1A2C6DFA0();
  qword_1E959D808 = result;
  unk_1E959D810 = v1;
  return result;
}

uint64_t *sub_1A2C6CBA4()
{
  if (qword_1E959D800 != -1) {
    swift_once();
  }
  return &qword_1E959D808;
}

uint64_t static NIAlgorithmConvergenceStatus.Reason.insufficientLighting.getter@<X0>(void *a1@<X8>)
{
  return sub_1A2C6CC18(&qword_1E959D800, &qword_1E959D808, qword_1E959D810, a1);
}

uint64_t sub_1A2C6CC18@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;

  return swift_bridgeObjectRetain();
}

id NIAlgorithmConvergence.status.getter@<X0>(uint64_t *a1@<X8>)
{
  id result = objc_msgSend(v1, sel_status);
  if (!result) {
    goto LABEL_10;
  }
  if (result == (id)2)
  {
    uint64_t v8 = 1;
    goto LABEL_13;
  }
  if (result == (id)1)
  {
    id v4 = objc_msgSend(v1, sel_reasonsPrivate);
    type metadata accessor for Reason(0);
    uint64_t v5 = sub_1A2C6DFC0();

    int64_t v6 = *(void *)(v5 + 16);
    if (v6)
    {
      uint64_t v15 = MEMORY[0x1E4FBC860];
      sub_1A2C6D284(0, v6, 0);
      uint64_t v7 = 0;
      uint64_t v8 = v15;
      do
      {
        uint64_t v9 = sub_1A2C6DFA0();
        uint64_t v11 = v10;
        unint64_t v13 = *(void *)(v15 + 16);
        unint64_t v12 = *(void *)(v15 + 24);
        if (v13 >= v12 >> 1) {
          sub_1A2C6D284((char *)(v12 > 1), v13 + 1, 1);
        }
        ++v7;
        *(void *)(v15 + 16) = v13 + 1;
        unint64_t v14 = v15 + 16 * v13;
        *(void *)(v14 + 32) = v9;
        *(void *)(v14 + 40) = v11;
      }
      while (v6 != v7);
      id result = (id)swift_bridgeObjectRelease();
    }
    else
    {
      id result = (id)swift_bridgeObjectRelease();
      uint64_t v8 = MEMORY[0x1E4FBC860];
    }
  }
  else
  {
LABEL_10:
    uint64_t v8 = 0;
  }
LABEL_13:
  *a1 = v8;
  return result;
}

void __swiftcall NISession.worldTransform(for:)(simd_float4x4_optional *__return_ptr retstr, NINearbyObject *a2)
{
  objc_msgSend(v2, sel_worldTransformForObject_, a2);
  int v8 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v5, *(float32x4_t *)algn_1E959DD70), (int8x16_t)vceqq_f32(v4, (float32x4_t)NINearbyObjectWorldTransformNotAvailable_Private)), vandq_s8((int8x16_t)vceqq_f32(v6, (float32x4_t)xmmword_1E959DD80), (int8x16_t)vceqq_f32(v7, unk_1E959DD90))));
  if (v8 < 0)
  {
    float32x4_t v4 = 0uLL;
    float32x4_t v5 = 0uLL;
    float32x4_t v6 = 0uLL;
    float32x4_t v7 = 0uLL;
  }
  retstr->value.columns[0] = (simd_float4)v4;
  retstr->value.columns[1] = (simd_float4)v5;
  retstr->value.columns[2] = (simd_float4)v6;
  retstr->value.columns[3] = (simd_float4)v7;
  retstr->is_nil = v8 < 0;
}

uint64_t sub_1A2C6CE74(uint64_t a1, uint64_t a2)
{
  return sub_1A2C6D0EC(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1A2C6CE8C(uint64_t a1, id *a2)
{
  uint64_t result = sub_1A2C6DF80();
  *a2 = 0;
  return result;
}

uint64_t sub_1A2C6CF04(uint64_t a1, id *a2)
{
  char v3 = sub_1A2C6DF90();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1A2C6CF84@<X0>(uint64_t *a1@<X8>)
{
  sub_1A2C6DFA0();
  uint64_t v2 = sub_1A2C6DF70();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1A2C6CFC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1A2C6DF70();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1A2C6D010@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1A2C6DFA0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A2C6D03C(uint64_t a1)
{
  uint64_t v2 = sub_1A2C6D8E8(&qword_1E959D750);
  uint64_t v3 = sub_1A2C6D8E8(&qword_1E959D758);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1A2C6D0D4(uint64_t a1, uint64_t a2)
{
  return sub_1A2C6D0EC(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1A2C6D0EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1A2C6DFA0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1A2C6D130()
{
  sub_1A2C6DFA0();
  sub_1A2C6DFB0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A2C6D184()
{
  sub_1A2C6DFA0();
  sub_1A2C6DFF0();
  sub_1A2C6DFB0();
  uint64_t v0 = sub_1A2C6E000();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A2C6D1F8()
{
  uint64_t v0 = sub_1A2C6DFA0();
  uint64_t v2 = v1;
  if (v0 == sub_1A2C6DFA0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1A2C6DFE0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

char *sub_1A2C6D284(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1A2C6D2A4(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_1A2C6D2A4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E959D760);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t _s17NearbyInteraction28NIAlgorithmConvergenceStatusO2eeoiySbAC_ACtFZ_0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = *a2;
  if (!*a1)
  {
    if (!v3)
    {
      unint64_t v4 = 0;
      char v5 = 1;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (v2 != 1)
  {
    if (v3 >= 2)
    {
      sub_1A2C6D9A8(*a2);
      sub_1A2C6D9A8(v2);
      sub_1A2C6D9A8(v2);
      sub_1A2C6D9A8(v3);
      char v5 = sub_1A2C6C514(v3, v2);
      sub_1A2C6D9B8(v2);
      sub_1A2C6D9B8(v3);
      unint64_t v4 = v3;
      unint64_t v3 = v2;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (v3 != 1)
  {
LABEL_8:
    sub_1A2C6D9A8(*a1);
    sub_1A2C6D9A8(v3);
    char v5 = 0;
    unint64_t v4 = v2;
    goto LABEL_10;
  }
  unint64_t v4 = 1;
  char v5 = 1;
LABEL_10:
  sub_1A2C6D9B8(v4);
  sub_1A2C6D9B8(v3);
  return v5 & 1;
}

void type metadata accessor for Reason(uint64_t a1)
{
}

unint64_t sub_1A2C6D498()
{
  unint64_t result = qword_1E959D728;
  if (!qword_1E959D728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E959D728);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for NIAlgorithmConvergenceStatus(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_bridgeObjectRetain();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for NIAlgorithmConvergenceStatus(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t *assignWithCopy for NIAlgorithmConvergenceStatus(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_bridgeObjectRetain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  char *result = *a2;
  return result;
}

unint64_t *assignWithTake for NIAlgorithmConvergenceStatus(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NIAlgorithmConvergenceStatus(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for NIAlgorithmConvergenceStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_1A2C6D6E8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1A2C6D700(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  char *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for NIAlgorithmConvergenceStatus()
{
  return &type metadata for NIAlgorithmConvergenceStatus;
}

void *initializeBufferWithCopyOfBuffer for NIAlgorithmConvergenceStatus.Reason(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for NIAlgorithmConvergenceStatus.Reason()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for NIAlgorithmConvergenceStatus.Reason(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for NIAlgorithmConvergenceStatus.Reason(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NIAlgorithmConvergenceStatus.Reason(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NIAlgorithmConvergenceStatus.Reason(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NIAlgorithmConvergenceStatus.Reason()
{
  return &type metadata for NIAlgorithmConvergenceStatus.Reason;
}

uint64_t sub_1A2C6D880()
{
  return sub_1A2C6D8E8(&qword_1E959D738);
}

uint64_t sub_1A2C6D8B4()
{
  return sub_1A2C6D8E8(&qword_1E959D740);
}

uint64_t sub_1A2C6D8E8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Reason(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A2C6D92C()
{
  return sub_1A2C6D8E8(&qword_1E959D748);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1A2C6D9A8(unint64_t result)
{
  if (result >= 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_1A2C6D9B8(unint64_t result)
{
  if (result >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void type metadata accessor for __NIAlgorithmConvergenceStatus(uint64_t a1)
{
}

void sub_1A2C6D9DC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void PRCommonConvertTicksToSeconds()
{
  __assert_rtn("PRCommonConvertTicksToSeconds", "PRCommon.mm", 43, "timebaseResult == KERN_SUCCESS");
}

uint64_t sub_1A2C6DF70()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A2C6DF80()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1A2C6DF90()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1A2C6DFA0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A2C6DFB0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A2C6DFC0()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1A2C6DFE0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A2C6DFF0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A2C6E000()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSRandomData()
{
  return MEMORY[0x1F41167D0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x1F41168C0]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x1F41168D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__float cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

float asinf(float a1)
{
  MEMORY[0x1F40CA3D8](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

float cosf(float a1)
{
  MEMORY[0x1F40CB8B0](a1);
  return result;
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}