void OALBuffer::OALBuffer(OALBuffer *this, int a2)
{
  CAGuard *v3;

  *(_DWORD *)this = a2;
  v3 = (OALBuffer *)((char *)this + 144);
  CAGuard::CAGuard((OALBuffer *)((char *)this + 8), "OALBuffer::SourceListGuard");
  CAGuard::CAGuard(v3, "OALBuffer::EditLock");
  *((_DWORD *)this + 70) = 0;
  *((void *)this + 36) = 0;
  *((unsigned char *)this + 296) = 0;
  *(_OWORD *)((char *)this + 300) = 0u;
  *(_OWORD *)((char *)this + 316) = 0u;
  *(_OWORD *)((char *)this + 332) = 0u;
  *(void *)((char *)this + 345) = 0;
  operator new();
}

void sub_221534B00(_Unwind_Exception *a1)
{
  CAGuard::~CAGuard(v1);
  _Unwind_Resume(a1);
}

void sub_221534B14(_Unwind_Exception *a1)
{
  CAGuard::~CAGuard(v2);
  CAGuard::~CAGuard(v1);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void OALBuffer::~OALBuffer(OALBuffer *this)
{
  if (!*((unsigned char *)this + 296))
  {
    v2 = (void *)*((void *)this + 36);
    if (v2) {
      free(v2);
    }
  }
  uint64_t v3 = *((void *)this + 43);
  if (v3)
  {
    v4 = *(void **)v3;
    if (*(void *)v3)
    {
      *(void *)(v3 + 8) = v4;
      operator delete(v4);
    }
    MEMORY[0x223C843A0](v3, 0x20C40960023A9);
    *((void *)this + 43) = 0;
  }
  CAGuard::~CAGuard((OALBuffer *)((char *)this + 144));
  CAGuard::~CAGuard((OALBuffer *)((char *)this + 8));
}

uint64_t OALBuffer::CanBeRemovedFromBufferMap(OALBuffer *this)
{
  unint64_t v1 = *(void *)(*((void *)this + 43) + 8) - **((void **)this + 43);
  if ((v1 & 0xFFFFFFFF0) == 0) {
    return 1;
  }
  uint64_t v3 = 0;
  uint64_t v4 = (v1 >> 4);
  while (1)
  {
    v5 = (void *)*((void *)this + 43);
    v6 = (OALSource **)v5[1];
    v7 = (OALSource **)(*v5 + (v3 >> 44));
    if (v7 != v6)
    {
      if (*v7)
      {
        uint64_t result = OALSource::IsSourceTransitioningToFlushQ(*v7);
        if (!result) {
          break;
        }
      }
    }
    v3 += 0x1000000000000;
    if (!--v4)
    {
      if (*((unsigned char *)this + 296)) {
        WaitOneRenderCycle();
      }
      return 1;
    }
  }
  return result;
}

BOOL OALBuffer::IsPurgable(OALBuffer *this)
{
  if (((*(void *)(*((void *)this + 43) + 8) - **((void **)this + 43)) & 0xFFFFFFFF0) != 0) {
    return 0;
  }
  BOOL result = CAMutex::IsFree((OALBuffer *)((char *)this + 144));
  if (result) {
    return *((int *)this + 70) <= 0 && *((unsigned char *)this + 352) == 0;
  }
  return result;
}

uint64_t OALBuffer::AddAudioDataStatic(OALBuffer *this, char *a2, int a3, unsigned int a4, unsigned int a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v10 = (void *)((char *)this + 144);
  int v11 = (*(uint64_t (**)(char *))(*((void *)this + 18) + 16))((char *)this + 144);
  if (((*(void *)(v10[25] + 8) - *(void *)v10[25]) & 0xFFFFFFFF0) != 0)
  {
    WaitOneRenderCycle();
    if (((*(void *)(*((void *)this + 43) + 8) - **((void **)this + 43)) & 0xFFFFFFFF0) != 0)
    {
      uint64_t v12 = 40964;
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_12;
      }
LABEL_11:
      uint64_t v14 = *(unsigned int *)this;
      *(_DWORD *)buf = 136315906;
      v17 = "oalBuffer.cpp";
      __int16 v18 = 1024;
      int v19 = 166;
      __int16 v20 = 2048;
      uint64_t v21 = v14;
      __int16 v22 = 1024;
      int v23 = v12;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d OALBuffer::AddAudioDataStatic Failed - OALBuffer = %ld, err = %d\n", buf, 0x22u);
      goto LABEL_12;
    }
  }
  if (!IsFormatSupported(a4))
  {
    uint64_t v12 = 40963;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!*((unsigned char *)this + 296))
  {
    v13 = (void *)*((void *)this + 36);
    if (v13)
    {
      free(v13);
      *((void *)this + 36) = 0;
      *((_DWORD *)this + 75) = 0;
    }
  }
  FillInASBD((uint64_t)this + 304, a4, a5);
  uint64_t v12 = 0;
  *((void *)this + 36) = a2;
  *((_DWORD *)this + 75) = a3;
  *((unsigned char *)this + 296) = 1;
LABEL_12:
  if (v11) {
    (*(void (**)(void *))(*v10 + 24))(v10);
  }
  return v12;
}

void sub_221534ED4(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void CAGuard::Locker::~Locker(CAGuard::Locker *this)
{
  if (*((unsigned char *)this + 8)) {
    (*(void (**)(void))(**(void **)this + 24))();
  }
}

uint64_t OALBuffer::AddAudioData(OALBuffer *this, char *a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v10 = (void *)((char *)this + 144);
  int v11 = (*(uint64_t (**)(char *))(*((void *)this + 18) + 16))((char *)this + 144);
  if (((*(void *)(v10[25] + 8) - *(void *)v10[25]) & 0xFFFFFFFF0) != 0)
  {
    WaitOneRenderCycle();
    if (((*(void *)(*((void *)this + 43) + 8) - **((void **)this + 43)) & 0xFFFFFFFF0) != 0) {
      goto LABEL_9;
    }
  }
  if (IsFormatSupported(a4))
  {
    if (*((unsigned char *)this + 296))
    {
      *((void *)this + 36) = 0;
      *((_DWORD *)this + 75) = 0;
      *((unsigned char *)this + 296) = 0;
    }
    else
    {
      v15 = (void *)*((void *)this + 36);
      if (v15)
      {
        if (*((_DWORD *)this + 75) == a3) {
          goto LABEL_8;
        }
        uint64_t v12 = malloc_type_realloc(v15, a3, 0x27DF818DuLL);
LABEL_7:
        *((void *)this + 36) = v12;
        if (v12)
        {
LABEL_8:
          FillInASBD((uint64_t)this + 304, a4, a5);
          *((_DWORD *)this + 75) = a3;
          memcpy(*((void **)this + 36), a2, a3);
          uint64_t v13 = 0;
          goto LABEL_11;
        }
LABEL_9:
        uint64_t v13 = 40964;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
    }
    uint64_t v12 = malloc_type_malloc(a3, 0xCC039032uLL);
    goto LABEL_7;
  }
  uint64_t v13 = 40963;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
LABEL_10:
    *(_DWORD *)buf = 136315650;
    v17 = "oalBuffer.cpp";
    __int16 v18 = 1024;
    int v19 = 232;
    __int16 v20 = 1024;
    int v21 = v13;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d OALBuffer::AddAudioData Failed - err = %d\n", buf, 0x18u);
  }
LABEL_11:
  if (v11) {
    (*(void (**)(void *))(*v10 + 24))(v10);
  }
  return v13;
}

void sub_221535178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t OALBuffer::GetFrameCount(OALBuffer *this)
{
  unsigned int v1 = *((_DWORD *)this + 80);
  if (v1) {
    unsigned int v1 = *((_DWORD *)this + 75) / v1;
  }
  return *((_DWORD *)this + 81) * v1;
}

uint64_t OALBuffer::UseThisBuffer(OALBuffer *this, OALSource *a2)
{
  uint64_t v4 = (OALBuffer *)((char *)this + 8);
  int v5 = CAMutex::Lock((OALBuffer *)((char *)this + 8));
  v6 = (char **)*((void *)this + 43);
  v7 = *v6;
  v8 = v6[1];
  if (*v6 == v8)
  {
LABEL_5:
    *(void *)&long long v11 = a2;
    DWORD2(v11) = 1;
    AttachedSourceList::Add(v6, &v11);
  }
  else
  {
    v9 = *v6;
    while (*(OALSource **)v9 != a2)
    {
      v9 += 16;
      if (v9 == v8) {
        goto LABEL_5;
      }
    }
    while (*(OALSource **)v7 != a2)
    {
      v7 += 16;
      if (v7 == v8) {
        goto LABEL_9;
      }
    }
    ++*((_DWORD *)v7 + 2);
  }
LABEL_9:
  if (v5) {
    CAMutex::Unlock(v4);
  }
  return 0;
}

void AttachedSourceList::Add(char **a1, _OWORD *a2)
{
  int v5 = a1[1];
  unint64_t v4 = (unint64_t)a1[2];
  if ((unint64_t)v5 < v4)
  {
    *(_OWORD *)int v5 = *a2;
    v6 = v5 + 16;
LABEL_3:
    a1[1] = v6;
    return;
  }
  v7 = *a1;
  uint64_t v8 = (v5 - *a1) >> 4;
  unint64_t v9 = v8 + 1;
  if ((unint64_t)(v8 + 1) >> 60) {
    std::vector<SourceAttachedInfo>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v10 = v4 - (void)v7;
  if (v10 >> 3 > v9) {
    unint64_t v9 = v10 >> 3;
  }
  if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v11 = v9;
  }
  if (v11)
  {
    if (v11 >> 60) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v12 = (char *)operator new(16 * v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = &v12[16 * v8];
  *(_OWORD *)uint64_t v13 = *a2;
  v6 = v13 + 16;
  if (v5 != v7)
  {
    do
    {
      *((_OWORD *)v13 - 1) = *((_OWORD *)v5 - 1);
      v13 -= 16;
      v5 -= 16;
    }
    while (v5 != v7);
    int v5 = *a1;
  }
  *a1 = v13;
  a1[1] = v6;
  a1[2] = &v12[16 * v11];
  if (!v5) {
    goto LABEL_3;
  }
  operator delete(v5);
  a1[1] = v6;
}

uint64_t OALBuffer::ReleaseBuffer(OALBuffer *this, OALSource *a2)
{
  unint64_t v4 = (OALBuffer *)((char *)this + 8);
  int v5 = CAMutex::Lock((OALBuffer *)((char *)this + 8));
  int v6 = v5;
  v7 = (OALSource ***)*((void *)this + 43);
  unint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  if (*v7 != v8)
  {
    uint64_t v10 = *v7;
    while (*v10 != a2)
    {
      v10 += 2;
      if (v10 == v8) {
        goto LABEL_11;
      }
    }
    unint64_t v11 = *v7;
    while (*v11 != a2)
    {
      v11 += 2;
      if (v11 == v8) {
        goto LABEL_14;
      }
    }
    int v12 = *((_DWORD *)v11 + 2) - 1;
    *((_DWORD *)v11 + 2) = v12;
    if (v12) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v15 = 0;
    while (v9[v15] != a2)
    {
      v15 += 2;
      if (&v9[v15] == v8)
      {
        uint64_t v13 = 1;
        if (!v5) {
          return v13;
        }
        goto LABEL_12;
      }
    }
    v16 = &v9[v15];
    v17 = &v9[v15 + 2];
    int64_t v18 = (char *)v8 - (char *)v17;
    if (v8 != v17) {
      memmove(&v9[v15], v17, (char *)v8 - (char *)v17);
    }
    v7[1] = (OALSource **)((char *)v16 + v18);
    uint64_t v13 = 1;
    if (!v6) {
      return v13;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v13 = 0;
  if (v5) {
LABEL_12:
  }
    CAMutex::Unlock(v4);
  return v13;
}

void std::vector<SourceAttachedInfo>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2645B7848, MEMORY[0x263F8C060]);
}

void sub_221535504(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  unsigned int v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void OALContext::OALContext(OALContext *this, uint64_t a2, OALDevice *a3, const int *a4, unsigned int *a5, double *a6)
{
  *(void *)this = a2;
  *((unsigned char *)this + 8) = 1;
  *((void *)this + 2) = a3;
  *((_DWORD *)this + 6) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  CAGuard::CAGuard((OALContext *)((char *)this + 48), "OALContext:SourceMapLock");
  *((void *)this + 23) = 0;
  CAGuard::CAGuard((OALContext *)((char *)this + 192), "OALContext:SourceMapLock");
  *((void *)this + 41) = 0x43ABA6660000D002;
  __asm { FMOV            V0.2S, #1.0 }
  *((void *)this + 42) = _D0;
  *((_DWORD *)this + 92) = 1065353216;
  *((_DWORD *)this + 99) = 0;
  *((void *)this + 50) = 0;
  *((unsigned char *)this + 408) = 1;
  *((void *)this + 52) = 0x3FF0000000000000;
  *((void *)this + 53) = 1919183983;
  uint64_t v15 = *a5;
  *((_DWORD *)this + 108) = v15;
  *((unsigned char *)this + 436) = 0;
  *((double *)this + 56) = *a6;
  *((void *)this + 57) = 0x47C350003F800000;
  *((unsigned char *)this + 464) = 0;
  *((void *)this + 60) = 0;
  *(void *)((char *)this + 492) = 0xFFFFFFFF00000000;
  *(_OWORD *)((char *)this + 500) = xmmword_22155CF90;
  *((void *)this + 65) = 0;
  *((void *)this + 59) = malloc_type_calloc(1uLL, 12 * v15, 0x1000040D836D830uLL);
  if (a4)
  {
    uint64_t v16 = 0;
    int v17 = 0;
    unsigned int v18 = 1;
    while (1)
    {
      while (1)
      {
        int v19 = a4[v16];
        if (v19 <= 4111) {
          break;
        }
        if (v19 == 4112)
        {
          *((unsigned char *)this + 464) = 1;
          goto LABEL_4;
        }
        if (v19 == 4113)
        {
          *((unsigned char *)this + 464) = 1;
          unsigned int v18 = a4[v16 + 1];
          v16 += 2;
        }
        else
        {
LABEL_4:
          v16 += 2;
        }
      }
      if (v19 != 4103)
      {
        if (!v19)
        {
          if (v17)
          {
            *((_DWORD *)this + 99) = v16 + 1;
            int v21 = malloc_type_calloc(1uLL, 4 * (v16 + 1), 0x100004052888210uLL);
            *((void *)this + 50) = v21;
            uint64_t v22 = v16;
          }
          else
          {
            *((_DWORD *)this + 99) = v16 + 3;
            int v21 = malloc_type_calloc(1uLL, 4 * (v16 + 3), 0x100004052888210uLL);
            *((void *)this + 50) = v21;
            uint64_t v22 = v16;
            v21[v16] = 4103;
            v21[(v16 + 1)] = (int)*((double *)this + 56);
            v21[(v16 + 2)] = 0;
          }
          memcpy(v21, a4, 4 * v22);
          goto LABEL_18;
        }
        goto LABEL_4;
      }
      int v20 = a4[v16 + 1];
      if (v20 < 8000) {
        goto LABEL_4;
      }
      *((double *)this + 56) = (double)v20;
      int v17 = 1;
      v16 += 2;
    }
  }
  unsigned int v18 = 1;
LABEL_18:
  *((void *)this + 43) = 0;
  *((void *)this + 44) = 0;
  *((void *)this + 45) = 0;
  *(_OWORD *)((char *)this + 372) = xmmword_22155CFA0;
  *(void *)((char *)this + 388) = 1065353216;
  int v23 = OALContext::InitializeMixer(this, v18);
  if (!v23) {
    operator new();
  }
  *((unsigned char *)this + 488) = v23 == 0;
}

void sub_221535874(_Unwind_Exception *a1)
{
  CAGuard::~CAGuard(v2);
  CAGuard::~CAGuard(v1);
  _Unwind_Resume(a1);
}

uint64_t OALContext::InitializeMixer(OALContext *this, unsigned int a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  LODWORD(ioDataSize) = 0;
  uint64_t v19 = 0;
  memset(inData, 0, sizeof(inData));
  inDescription.componentFlagsMask = 0;
  *(_OWORD *)&inDescription.componentType = xmmword_22155CFB0;
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  uint64_t Property = AUGraphAddNode(*(AUGraph *)(*((void *)this + 2) + 16), &inDescription, (AUNode *)this + 6);
  if (Property) {
    goto LABEL_27;
  }
  int v5 = (AudioUnit *)((char *)this + 32);
  uint64_t Property = AUGraphNodeInfo(*(AUGraph *)(*((void *)this + 2) + 16), *((_DWORD *)this + 6), 0, (AudioUnit *)this + 4);
  if (Property) {
    goto LABEL_27;
  }
  LODWORD(ioDataSize) = 12;
  if (!AudioUnitGetProperty(*v5, 0xBC2u, 1u, 1u, (char *)&ioDataSize + 4, (UInt32 *)&ioDataSize)) {
    *((void *)this + 57) = *(void *)((char *)&ioDataSize + 4);
  }
  AudioUnitGetProperty(*(AudioUnit *)(*((void *)this + 2) + 32), 8u, 2u, 0, inData, (UInt32 *)&ioDataSize);
  int DesiredRenderChannelCount = OALDevice::GetDesiredRenderChannelCount(*((OALDevice **)this + 2));
  *(_OWORD *)((char *)inData + 8) = xmmword_22155CFC0;
  DWORD2(inData[1]) = 4;
  HIDWORD(inData[1]) = DesiredRenderChannelCount;
  uint64_t v19 = 32;
  *(void *)&inData[0] = *((void *)this + 56);
  uint64_t Property = AudioUnitSetProperty(*((AudioUnit *)this + 4), 8u, 2u, 0, inData, 0x28u);
  if (Property) {
    goto LABEL_27;
  }
  UInt32 v13 = 4;
  unsigned int v14 = 0;
  AudioUnitGetProperty(*((AudioUnit *)this + 4), 0xEu, 0, 0, &v14, &v13);
  if (v14 < *(_DWORD *)(*((void *)this + 2) + 72))
  {
    unsigned int v14 = *(_DWORD *)(*((void *)this + 2) + 72);
    uint64_t Property = AudioUnitSetProperty(*v5, 0xEu, 0, 0, &v14, 4u);
    if (Property) {
      goto LABEL_27;
    }
  }
  *(void *)&long long ioDataSize = 4;
  uint64_t Property = AudioUnitGetProperty(*v5, 0xBu, 1u, 0, (char *)&ioDataSize + 4, (UInt32 *)&ioDataSize);
  if (!Property)
  {
    if (*((_DWORD *)this + 108) == DWORD1(ioDataSize))
    {
      uint64_t Property = 0;
    }
    else
    {
      uint64_t Property = AudioUnitSetProperty(*v5, 0xBu, 1u, 0, (char *)this + 432, ioDataSize);
      if (Property)
      {
        LODWORD(ioDataSize) = 4;
        AudioUnitGetProperty(*v5, 0xBu, 1u, 0, (char *)this + 432, (UInt32 *)&ioDataSize);
      }
    }
  }
  *(void *)&v15[0] = *((void *)this + 56);
  DWORD2(v15[1]) = 2;
  LODWORD(v16) = 16;
  *(_OWORD *)((char *)v15 + 8) = xmmword_22155CFD0;
  if (*((_DWORD *)this + 108))
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    while (1)
    {
      int v9 = v8 >= a2 ? 1 : 2;
      HIDWORD(v15[1]) = v9;
      if (AudioUnitSetProperty(*v5, 8u, 1u, v8, v15, 0x28u)) {
        break;
      }
      uint64_t v10 = *((void *)this + 59) + v7;
      *(_DWORD *)(v10 + 8) = HIDWORD(v15[1]);
      *(_DWORD *)uint64_t v10 = -1;
      *(unsigned char *)(v10 + 4) = 0;
      ++v8;
      v7 += 12;
      if (v8 >= *((unsigned int *)this + 108)) {
        goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:
    OALContext::InitRenderQualityOnBusses(this);
  }
  if (Property)
  {
LABEL_27:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)this;
      DWORD1(ioDataSize) = 136315906;
      *((void *)&ioDataSize + 1) = "oalContext.cpp";
      __int16 v21 = 1024;
      int v22 = 372;
      __int16 v23 = 2048;
      uint64_t v24 = v11;
      __int16 v25 = 2048;
      uint64_t v26 = (int)Property;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::InitializeMixer FAILED - OALContext = %ld : BOOL result = %ld", (uint8_t *)&ioDataSize + 4, 0x26u);
    }
  }
  return Property;
}

void OALContext::~OALContext(OALContext *this)
{
  uint64_t v2 = *((void *)this + 5);
  if (v2)
  {
    uint64_t v3 = (void *)(v2 + 16);
    if (*(_DWORD *)(v2 + 16))
    {
      unsigned int v4 = 0;
      do
      {
        int v6 = (uint64_t **)(v2 + 8);
        uint64_t v5 = *(void *)v2;
        if (*(void *)v2 != v2 + 8)
        {
          uint64_t v7 = *(OALSource **)(v5 + 40);
          if (v7)
          {
            unsigned int Token = OALSource::GetToken(*(OALSource **)(v5 + 40));
            int v9 = *v6;
            if (*v6)
            {
              uint64_t v10 = v2 + 8;
              uint64_t v11 = *v6;
              do
              {
                unsigned int v12 = *((_DWORD *)v11 + 8);
                BOOL v13 = v12 >= Token;
                if (v12 >= Token) {
                  unsigned int v14 = (uint64_t **)v11;
                }
                else {
                  unsigned int v14 = (uint64_t **)(v11 + 1);
                }
                if (v13) {
                  uint64_t v10 = (uint64_t)v11;
                }
                uint64_t v11 = *v14;
              }
              while (*v14);
              if ((uint64_t **)v10 != v6 && *(_DWORD *)(v10 + 32) <= Token)
              {
                uint64_t v15 = *(void **)(v10 + 8);
                uint64_t v16 = (void *)v10;
                if (v15)
                {
                  do
                  {
                    int v17 = v15;
                    uint64_t v15 = (void *)*v15;
                  }
                  while (v15);
                }
                else
                {
                  do
                  {
                    int v17 = (void *)v16[2];
                    BOOL v18 = *v17 == (void)v16;
                    uint64_t v16 = v17;
                  }
                  while (!v18);
                }
                if (*(void *)v2 == v10) {
                  *(void *)uint64_t v2 = v17;
                }
                --*v3;
                std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v9, (uint64_t *)v10);
                operator delete((void *)v10);
              }
            }
            OALSource::~OALSource(v7);
            MEMORY[0x223C843A0]();
            uint64_t v2 = *((void *)this + 5);
          }
        }
        ++v4;
        uint64_t v3 = (void *)(v2 + 16);
      }
      while (v4 < *(_DWORD *)(v2 + 16));
    }
    std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::destroy(v2, *(void **)(v2 + 8));
    MEMORY[0x223C843A0](v2, 0x1020C4062D53EE8);
    *((void *)this + 5) = 0;
  }
  if (*((void *)this + 23))
  {
    OALContext::CleanUpDeadSourceList((uint64_t)this);
    uint64_t v19 = *((void *)this + 23);
    if (v19)
    {
      std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::destroy(*((void *)this + 23), *(void **)(v19 + 8));
      MEMORY[0x223C843A0](v19, 0x1020C4062D53EE8);
    }
    *((void *)this + 23) = 0;
  }
  int v20 = (OALCaptureMixer *)*((void *)this + 65);
  if (v20)
  {
    OALCaptureMixer::~OALCaptureMixer(v20);
    MEMORY[0x223C843A0]();
    *((void *)this + 65) = 0;
  }
  OALDevice::RemoveContext(*((OALDevice **)this + 2), this);
  __int16 v21 = (void *)*((void *)this + 50);
  if (v21)
  {
    free(v21);
    *((void *)this + 50) = 0;
  }
  int v22 = (void *)*((void *)this + 59);
  if (v22)
  {
    free(v22);
    *((void *)this + 59) = 0;
  }
  CAGuard::~CAGuard((OALContext *)((char *)this + 192));
  CAGuard::~CAGuard((OALContext *)((char *)this + 48));
}

uint64_t OALContext::CleanUpDeadSourceList(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 184);
  if (v1 && *(_DWORD *)(v1 + 16))
  {
    uint64_t v2 = this;
    unsigned int v3 = 0;
    unsigned int v4 = 0;
    do
    {
      while (1)
      {
        uint64_t v5 = *(void **)v1;
        if (v4)
        {
          unsigned int v6 = 0;
          do
          {
            unint64_t v8 = (void *)(v1 + 8);
            unsigned int v7 = v4;
            if (v5 != (void *)(v1 + 8))
            {
              int v9 = (void *)v5[1];
              if (v9)
              {
                do
                {
                  unint64_t v8 = v9;
                  int v9 = (void *)*v9;
                }
                while (v9);
              }
              else
              {
                do
                {
                  uint64_t v10 = v5;
                  uint64_t v5 = (void *)v5[2];
                }
                while ((void *)*v5 != v10);
                unint64_t v8 = v5;
              }
              unsigned int v7 = v6;
            }
            unsigned int v6 = v7 + 1;
            uint64_t v5 = v8;
          }
          while (v7 + 1 < v4);
        }
        else
        {
          unint64_t v8 = *(void **)v1;
        }
        if (v8 != (void *)(v1 + 8))
        {
          uint64_t v11 = v8[5];
          if (v11)
          {
            if (*(unsigned char *)(v11 + 4))
            {
              if (!*(_DWORD *)(v11 + 72))
              {
                this = CAMutex::IsFree((CAMutex *)(v11 + 80));
                if (this) {
                  break;
                }
              }
            }
          }
        }
        ++v4;
        ++v3;
        uint64_t v1 = *(void *)(v2 + 184);
        if (v3 >= *(_DWORD *)(v1 + 16)) {
          return this;
        }
      }
      unsigned int v12 = *(void **)(v2 + 184);
      unsigned int Token = OALSource::GetToken((OALSource *)v11);
      unsigned int v14 = (uint64_t *)v12[1];
      if (v14)
      {
        uint64_t v15 = v12 + 1;
        uint64_t v16 = v12[1];
        do
        {
          unsigned int v17 = *(_DWORD *)(v16 + 32);
          BOOL v18 = v17 >= Token;
          if (v17 >= Token) {
            uint64_t v19 = (uint64_t *)v16;
          }
          else {
            uint64_t v19 = (uint64_t *)(v16 + 8);
          }
          if (v18) {
            uint64_t v15 = (void *)v16;
          }
          uint64_t v16 = *v19;
        }
        while (*v19);
        if (v15 != v12 + 1 && *((_DWORD *)v15 + 8) <= Token)
        {
          int v20 = (void *)v15[1];
          __int16 v21 = v15;
          if (v20)
          {
            do
            {
              int v22 = v20;
              int v20 = (void *)*v20;
            }
            while (v20);
          }
          else
          {
            do
            {
              int v22 = (void *)v21[2];
              BOOL v23 = *v22 == (void)v21;
              __int16 v21 = v22;
            }
            while (!v23);
          }
          if ((void *)*v12 == v15) {
            *unsigned int v12 = v22;
          }
          --v12[2];
          std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v14, v15);
          operator delete(v15);
        }
      }
      OALSource::~OALSource((OALSource *)v11);
      this = MEMORY[0x223C843A0]();
      ++v3;
      uint64_t v1 = *(void *)(v2 + 184);
    }
    while (v3 < *(_DWORD *)(v1 + 16));
  }
  return this;
}

uint64_t OALContext::InitRenderQualityOnBusses(OALContext *this)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  UInt32 ioDataSize = 0;
  uint64_t v11 = 0;
  long long outData = 0u;
  long long v10 = 0u;
  if (OALDevice::GetDesiredRenderChannelCount(*((OALDevice **)this + 2)) > 2)
  {
    *((_DWORD *)this + 107) = 3;
    if (!*((_DWORD *)this + 108)) {
      return 0;
    }
    goto LABEL_10;
  }
  int v2 = *((_DWORD *)this + 106);
  if (v2 == 1751412840)
  {
    *((_DWORD *)this + 107) = 1;
    if (*((_DWORD *)this + 108)) {
      goto LABEL_10;
    }
    return 0;
  }
  if (v2 == 1919183983)
  {
    *((_DWORD *)this + 107) = 0;
    if (*((_DWORD *)this + 108)) {
      goto LABEL_10;
    }
    return 0;
  }
  if (v2 != 1920034921)
  {
    uint64_t Property = 0xFFFFFFFFLL;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      return Property;
    }
LABEL_25:
    *(_DWORD *)buf = 136315650;
    unsigned int v14 = "oalContext.cpp";
    __int16 v15 = 1024;
    int v16 = 1004;
    __int16 v17 = 1024;
    int v18 = Property;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d OALContext::InitRenderQualityOnBusses() - Error setting kAudioUnitProperty_SpatializationAlgorithm: err= %d", buf, 0x18u);
    return Property;
  }
  *((_DWORD *)this + 107) = 2;
  if (!*((_DWORD *)this + 108)) {
    return 0;
  }
LABEL_10:
  AudioUnitElement v3 = 0;
  unsigned int v4 = &_os_log_internal;
  do
  {
    UInt32 ioDataSize = 40;
    uint64_t Property = AudioUnitGetProperty(*((AudioUnit *)this + 4), 8u, 1u, v3, &outData, &ioDataSize);
    if (!Property)
    {
      if (HIDWORD(v10) == 2) {
        int v6 = 5;
      }
      else {
        int v6 = *((_DWORD *)this + 107);
      }
      int inData = v6;
      uint64_t Property = AudioUnitSetProperty(*((AudioUnit *)this + 4), 0xBB8u, 1u, v3, &inData, 4u);
      if (Property && os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        unsigned int v14 = "oalContext.cpp";
        __int16 v15 = 1024;
        int v16 = 998;
        __int16 v17 = 1024;
        int v18 = v3;
        __int16 v19 = 1024;
        int v20 = Property;
        _os_log_impl(&dword_221534000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d OALContext::InitRenderQualityOnBusses() - Error setting kAudioUnitProperty_SpatializationAlgorithm: bus = %d, err= %d", buf, 0x1Eu);
      }
    }
    ++v3;
  }
  while (v3 < *((_DWORD *)this + 108));
  if (Property && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_25;
  }
  return Property;
}

uint64_t OALContext::ConfigureMixerFormat(AudioUnit *this)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  memset(outData, 0, sizeof(outData));
  UInt32 ioDataSize = 40;
  int v2 = this + 4;
  AudioUnitGetProperty(this[4], 8u, 2u, 0, outData, &ioDataSize);
  int DesiredRenderChannelCount = OALDevice::GetDesiredRenderChannelCount(this[2]);
  *(_OWORD *)((char *)outData + 8) = xmmword_22155CFC0;
  DWORD2(outData[1]) = 4;
  HIDWORD(outData[1]) = DesiredRenderChannelCount;
  uint64_t v9 = 32;
  *(void *)&outData[0] = this[56];
  uint64_t inited = AudioUnitSetProperty(*v2, 8u, 2u, 0, outData, 0x28u);
  if (inited || (uint64_t inited = OALContext::InitRenderQualityOnBusses((OALContext *)this), inited))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      AudioUnit v5 = *this;
      *(_DWORD *)buf = 136315906;
      uint64_t v11 = "oalContext.cpp";
      __int16 v12 = 1024;
      int v13 = 405;
      __int16 v14 = 2048;
      AudioUnit v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = (int)inited;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::ConfigureMixerFormat FAILED - OALContext = %ld : BOOL result = %ld", buf, 0x26u);
    }
  }
  return inited;
}

void *OALContext::CopyAttributeList(const void **this, void *__dst)
{
  return memcpy(__dst, this[50], 4 * *((unsigned int *)this + 99));
}

void OALContext::AddSource(OALContext *this)
{
}

void sub_221536618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  CAGuard::Locker::~Locker((CAGuard::Locker *)va);
  _Unwind_Resume(a1);
}

void sub_22153662C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_221536640(_Unwind_Exception *a1)
{
  MEMORY[0x223C843A0](v1, 0x10F0C40B3EFEE7ALL);
  _Unwind_Resume(a1);
}

uint64_t OALContext::ProtectSource(OALContext *this, unsigned int a2)
{
  AudioUnitElement v3 = (char *)this + 48;
  int v4 = (*(uint64_t (**)(char *))(*((void *)this + 6) + 16))((char *)this + 48);
  uint64_t v5 = *((void *)v3 - 1);
  uint64_t v8 = *(void *)(v5 + 8);
  uint64_t v6 = v5 + 8;
  uint64_t v7 = v8;
  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v9 = v6;
  do
  {
    unsigned int v10 = *(_DWORD *)(v7 + 32);
    BOOL v11 = v10 >= a2;
    if (v10 >= a2) {
      __int16 v12 = (uint64_t *)v7;
    }
    else {
      __int16 v12 = (uint64_t *)(v7 + 8);
    }
    if (v11) {
      uint64_t v9 = v7;
    }
    uint64_t v7 = *v12;
  }
  while (*v12);
  if (v9 != v6 && *(_DWORD *)(v9 + 32) <= a2)
  {
    uint64_t v13 = *(void *)(v9 + 40);
    if (v13) {
      atomic_fetch_add((atomic_uint *volatile)(v13 + 72), 1u);
    }
  }
  else
  {
LABEL_12:
    uint64_t v13 = 0;
  }
  if (v4) {
    (*(void (**)(char *))(*(void *)v3 + 24))(v3);
  }
  return v13;
}

void *OALContext::RemoveSource(void *this, unsigned int a2)
{
  uint64_t v2 = this[5];
  uint64_t v5 = *(void *)(v2 + 8);
  uint64_t v3 = v2 + 8;
  uint64_t v4 = v5;
  if (v5)
  {
    uint64_t v7 = this;
    uint64_t v8 = v3;
    do
    {
      unsigned int v9 = *(_DWORD *)(v4 + 32);
      BOOL v10 = v9 >= a2;
      if (v9 >= a2) {
        BOOL v11 = (uint64_t *)v4;
      }
      else {
        BOOL v11 = (uint64_t *)(v4 + 8);
      }
      if (v10) {
        uint64_t v8 = v4;
      }
      uint64_t v4 = *v11;
    }
    while (*v11);
    if (v8 != v3 && *(_DWORD *)(v8 + 32) <= a2)
    {
      uint64_t v12 = *(void *)(v8 + 40);
      if (v12)
      {
        OALSource::SetUpDeconstruction(*(OALSource **)(v8 + 40));
        int v13 = (*(uint64_t (**)(void *))(v7[6] + 16))(v7 + 6);
        __int16 v14 = (void *)v7[5];
        AudioUnit v15 = (uint64_t *)v14[1];
        if (v15)
        {
          __int16 v16 = v14 + 1;
          uint64_t v17 = v14[1];
          do
          {
            unsigned int v18 = *(_DWORD *)(v17 + 32);
            BOOL v19 = v18 >= a2;
            if (v18 >= a2) {
              int v20 = (uint64_t *)v17;
            }
            else {
              int v20 = (uint64_t *)(v17 + 8);
            }
            if (v19) {
              __int16 v16 = (void *)v17;
            }
            uint64_t v17 = *v20;
          }
          while (*v20);
          if (v16 != v14 + 1 && *((_DWORD *)v16 + 8) <= a2)
          {
            uint64_t v21 = (void *)v16[1];
            if (v21)
            {
              do
              {
                int v22 = v21;
                uint64_t v21 = (void *)*v21;
              }
              while (v21);
            }
            else
            {
              BOOL v23 = v16;
              do
              {
                int v22 = (void *)v23[2];
                BOOL v24 = *v22 == (void)v23;
                BOOL v23 = v22;
              }
              while (!v24);
            }
            if ((void *)*v14 == v16) {
              *__int16 v14 = v22;
            }
            --v14[2];
            std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v15, v16);
            operator delete(v16);
          }
        }
        if (v13) {
          (*(void (**)(void *))(v7[6] + 24))(v7 + 6);
        }
        int v25 = (*(uint64_t (**)(void *))(v7[24] + 16))(v7 + 24);
        uint64_t v26 = v7[23];
        uint64_t v27 = (uint64_t **)(v26 + 8);
        uint64_t v28 = *(void *)(v26 + 8);
        if (v28)
        {
          do
          {
            unsigned int v29 = *(_DWORD *)(v28 + 32);
            BOOL v30 = v29 > a2;
            if (v29 <= a2) {
              v31 = (uint64_t *)(v28 + 8);
            }
            else {
              v31 = (uint64_t *)v28;
            }
            if (v30) {
              uint64_t v27 = (uint64_t **)v28;
            }
            uint64_t v28 = *v31;
          }
          while (*v31);
        }
        LODWORD(v32) = a2;
        *((void *)&v32 + 1) = v12;
        std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::__emplace_hint_multi<std::pair<unsigned int const,OALSource *>>((uint64_t ***)v26, v27, &v32);
        this = (void *)OALContext::CleanUpDeadSourceList((uint64_t)v7);
        if (v25) {
          return (void *)(*(uint64_t (**)(void *))(v7[24] + 24))(v7 + 24);
        }
      }
    }
  }
  return this;
}

void sub_22153697C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t OALContext::ConnectMixerToDevice(OALDevice **this)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = OALDevice::ConnectContext(this[2], (OALContext *)this);
  if (v2
    || (uint64_t v2 = AUGraphAddRenderNotify(*((AUGraph *)this[2] + 2), (AURenderCallback)OALContext::ContextNotificationProc, this), v2))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *this;
      int v5 = 136315906;
      uint64_t v6 = "oalContext.cpp";
      __int16 v7 = 1024;
      int v8 = 573;
      __int16 v9 = 2048;
      BOOL v10 = v3;
      __int16 v11 = 2048;
      uint64_t v12 = (int)v2;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::ConnectMixerToDevice FAILED - OALContext = %ld : BOOL result = %ld", (uint8_t *)&v5, 0x26u);
    }
  }
  return v2;
}

uint64_t OALContext::ContextNotificationProc(OALContext *this, _DWORD *a2, unsigned int *a3, const AudioTimeStamp *a4, unsigned int a5, unsigned int a6, AudioBufferList *a7)
{
  if ((*a2 & 4) != 0)
  {
    *((void *)this + 60) = pthread_self();
    return 0;
  }
  else
  {
    if ((*a2 & 8) != 0) {
      OALContext::DoPostRender(this);
    }
    return 0;
  }
}

uint64_t OALContext::DisconnectMixerFromDevice(OALContext *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  OALDevice::DisconnectContext(*((void *)this + 2), this);
  uint64_t v2 = AUGraphRemoveRenderNotify(*(AUGraph *)(*((void *)this + 2) + 16), (AURenderCallback)OALContext::ContextNotificationProc, this);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315394;
    int v5 = "oalContext.cpp";
    __int16 v6 = 1024;
    int v7 = 584;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d OALContext::DisconnectMixerFromDevice : Disconnecting now", (uint8_t *)&v4, 0x12u);
  }
  return v2;
}

uint64_t OALContext::SetDistanceModel(uint64_t this, int a2)
{
  if (*(_DWORD *)(this + 328) != a2)
  {
    uint64_t v3 = this;
    int inData = 0;
    if ((a2 - 53249) > 5)
    {
      if (!a2) {
        *(unsigned char *)(this + 408) = 0;
      }
    }
    else
    {
      int v4 = 1 << (a2 - 1);
      if ((v4 & 3) != 0)
      {
        *(unsigned char *)(this + 408) = 1;
        int inData = 2;
        if (*(_DWORD *)(this + 432))
        {
          AudioUnitElement v6 = 0;
          do
            this = AudioUnitSetProperty(*(AudioUnit *)(v3 + 32), 0xBC5u, 1u, v6++, &inData, 4u);
          while (v6 < *(_DWORD *)(v3 + 432));
        }
      }
      else if ((v4 & 0xC) != 0)
      {
        *(unsigned char *)(this + 408) = 1;
        int inData = 3;
        if (*(_DWORD *)(this + 432))
        {
          AudioUnitElement v5 = 0;
          do
            this = AudioUnitSetProperty(*(AudioUnit *)(v3 + 32), 0xBC5u, 1u, v5++, &inData, 4u);
          while (v5 < *(_DWORD *)(v3 + 432));
        }
      }
      else
      {
        *(unsigned char *)(this + 408) = 1;
        int inData = 1;
        if (*(_DWORD *)(this + 432))
        {
          AudioUnitElement v7 = 0;
          do
            this = AudioUnitSetProperty(*(AudioUnit *)(v3 + 32), 0xBC5u, 1u, v7++, &inData, 4u);
          while (v7 < *(_DWORD *)(v3 + 432));
        }
      }
    }
    *(_DWORD *)(v3 + 328) = a2;
    if (*(void *)(v3 + 40))
    {
      uint64_t v9 = *(void *)(v3 + 48);
      uint64_t v8 = v3 + 48;
      this = (*(uint64_t (**)(uint64_t))(v9 + 16))(v8);
      int v10 = this;
      __int16 v11 = *(void **)(v8 - 8);
      __int16 v14 = (void *)*v11;
      uint64_t v12 = v11 + 1;
      uint64_t v13 = v14;
      if (v14 != v12)
      {
        do
        {
          this = OALSource::SetChannelParameters((OALSource *)v13[5]);
          AudioUnit v15 = (void *)v13[1];
          if (v15)
          {
            do
            {
              __int16 v16 = v15;
              AudioUnit v15 = (void *)*v15;
            }
            while (v15);
          }
          else
          {
            do
            {
              __int16 v16 = (void *)v13[2];
              BOOL v17 = *v16 == (void)v13;
              uint64_t v13 = v16;
            }
            while (!v17);
          }
          uint64_t v13 = v16;
        }
        while (v16 != v12);
      }
      if (v10) {
        return (*(uint64_t (**)(uint64_t))(*(void *)v8 + 24))(v8);
      }
    }
  }
  return this;
}

void sub_221536DFC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CAGuard::Locker::~Locker((CAGuard::Locker *)va);
  _Unwind_Resume(a1);
}

void *OALSourceMap::MarkAllSourcesForRecalculation(void *this)
{
  uint64_t v1 = this + 1;
  uint64_t v2 = (void *)*this;
  if ((void *)*this != this + 1)
  {
    do
    {
      this = (void *)OALSource::SetChannelParameters((OALSource *)v2[5]);
      uint64_t v3 = (void *)v2[1];
      if (v3)
      {
        do
        {
          int v4 = v3;
          uint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          int v4 = (void *)v2[2];
          BOOL v5 = *v4 == (void)v2;
          uint64_t v2 = v4;
        }
        while (!v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v1);
  }
  return this;
}

uint64_t OALContext::SetDopplerFactor(uint64_t this, float a2)
{
  if (*(float *)(this + 336) != a2)
  {
    *(float *)(this + 336) = a2;
    if (*(void *)(this + 40))
    {
      uint64_t v2 = this + 48;
      this = (*(uint64_t (**)(uint64_t))(*(void *)(this + 48) + 16))(this + 48);
      int v3 = this;
      int v4 = *(void **)(v2 - 8);
      AudioUnitElement v7 = (void *)*v4;
      BOOL v5 = v4 + 1;
      AudioUnitElement v6 = v7;
      if (v7 != v5)
      {
        do
        {
          this = OALSource::SetChannelParameters((OALSource *)v6[5]);
          uint64_t v8 = (void *)v6[1];
          if (v8)
          {
            do
            {
              uint64_t v9 = v8;
              uint64_t v8 = (void *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              uint64_t v9 = (void *)v6[2];
              BOOL v10 = *v9 == (void)v6;
              AudioUnitElement v6 = v9;
            }
            while (!v10);
          }
          AudioUnitElement v6 = v9;
        }
        while (v9 != v5);
      }
      if (v3) {
        return (*(uint64_t (**)(uint64_t))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return this;
}

void sub_221536F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t OALContext::SetDopplerVelocity(uint64_t this, float a2)
{
  if (*(float *)(this + 340) != a2) {
    *(float *)(this + 340) = a2;
  }
  return this;
}

uint64_t OALContext::SetSpeedOfSound(uint64_t this, float a2)
{
  if (*(float *)(this + 332) != a2)
  {
    *(float *)(this + 332) = a2;
    if (*(void *)(this + 40))
    {
      uint64_t v2 = this + 48;
      this = (*(uint64_t (**)(uint64_t))(*(void *)(this + 48) + 16))(this + 48);
      int v3 = this;
      int v4 = *(void **)(v2 - 8);
      AudioUnitElement v7 = (void *)*v4;
      BOOL v5 = v4 + 1;
      AudioUnitElement v6 = v7;
      if (v7 != v5)
      {
        do
        {
          this = OALSource::SetChannelParameters((OALSource *)v6[5]);
          uint64_t v8 = (void *)v6[1];
          if (v8)
          {
            do
            {
              uint64_t v9 = v8;
              uint64_t v8 = (void *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              uint64_t v9 = (void *)v6[2];
              BOOL v10 = *v9 == (void)v6;
              AudioUnitElement v6 = v9;
            }
            while (!v10);
          }
          AudioUnitElement v6 = v9;
        }
        while (v9 != v5);
      }
      if (v3) {
        return (*(uint64_t (**)(uint64_t))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return this;
}

void sub_2215370A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t OALContext::SetListenerGain(OALContext *this, float a2)
{
  if (*((float *)this + 92) != a2)
  {
    *((float *)this + 92) = a2;
    float v3 = log10f(a2);
    AudioUnitSetParameter(*((AudioUnit *)this + 4), 3u, 2u, 0, v3 * 20.0, 0);
  }
  return 0;
}

uint64_t OALContext::GetSourceCount(OALContext *this)
{
  if (!*((void *)this + 5)) {
    return 0;
  }
  uint64_t v1 = (char *)this + 48;
  int v2 = (*(uint64_t (**)(char *))(*((void *)this + 6) + 16))((char *)this + 48);
  uint64_t v3 = *(unsigned int *)(*((void *)v1 - 1) + 16);
  if (v2) {
    (*(void (**)(char *))(*(void *)v1 + 24))(v1);
  }
  return v3;
}

uint64_t OALContext::SetListenerPosition(OALContext *this, float a2, float a3, float a4)
{
  if (*((float *)this + 86) != a2 || *((float *)this + 87) != a3 || *((float *)this + 88) != a4)
  {
    *((float *)this + 86) = a2;
    *((float *)this + 87) = a3;
    *((float *)this + 88) = a4;
    if (*((void *)this + 5))
    {
      int v4 = (char *)this + 48;
      int v5 = (*(uint64_t (**)(char *))(*((void *)this + 6) + 16))((char *)this + 48);
      AudioUnitElement v6 = (void *)*((void *)v4 - 1);
      uint64_t v9 = (void *)*v6;
      AudioUnitElement v7 = v6 + 1;
      uint64_t v8 = v9;
      if (v9 != v7)
      {
        do
        {
          OALSource::SetChannelParameters((OALSource *)v8[5]);
          __int16 v11 = (void *)v8[1];
          if (v11)
          {
            do
            {
              uint64_t v12 = v11;
              __int16 v11 = (void *)*v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              uint64_t v12 = (void *)v8[2];
              BOOL v13 = *v12 == (void)v8;
              uint64_t v8 = v12;
            }
            while (!v13);
          }
          uint64_t v8 = v12;
        }
        while (v12 != v7);
      }
      if (v5) {
        (*(void (**)(char *))(*(void *)v4 + 24))(v4);
      }
    }
  }
  return 0;
}

void sub_2215372FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t OALContext::SetListenerVelocity(OALContext *this, float a2, float a3, float a4)
{
  *((float *)this + 89) = a2;
  *((float *)this + 90) = a3;
  *((float *)this + 91) = a4;
  if (*((void *)this + 5))
  {
    int v4 = (char *)this + 48;
    int v5 = (*(uint64_t (**)(char *))(*((void *)this + 6) + 16))((char *)this + 48);
    AudioUnitElement v6 = (void *)*((void *)v4 - 1);
    uint64_t v9 = (void *)*v6;
    AudioUnitElement v7 = v6 + 1;
    uint64_t v8 = v9;
    if (v9 != v7)
    {
      do
      {
        OALSource::SetChannelParameters((OALSource *)v8[5]);
        __int16 v11 = (void *)v8[1];
        if (v11)
        {
          do
          {
            uint64_t v12 = v11;
            __int16 v11 = (void *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            uint64_t v12 = (void *)v8[2];
            BOOL v13 = *v12 == (void)v8;
            uint64_t v8 = v12;
          }
          while (!v13);
        }
        uint64_t v8 = v12;
      }
      while (v12 != v7);
    }
    if (v5) {
      (*(void (**)(char *))(*(void *)v4 + 24))(v4);
    }
  }
  return 0;
}

void sub_221537410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t OALContext::SetListenerOrientation(OALContext *this, float a2, float a3, float a4, float a5, float a6, float a7)
{
  if (*((float *)this + 93) != a2
    || *((float *)this + 94) != a3
    || *((float *)this + 95) != a4
    || *((float *)this + 96) != a5
    || *((float *)this + 97) != a6
    || *((float *)this + 98) != a7)
  {
    *((float *)this + 93) = a2;
    *((float *)this + 94) = a3;
    *((float *)this + 95) = a4;
    *((float *)this + 96) = a5;
    *((float *)this + 97) = a6;
    *((float *)this + 98) = a7;
    if (*((void *)this + 5))
    {
      uint64_t v8 = *((void *)this + 6);
      AudioUnitElement v7 = (char *)this + 48;
      BOOL v10 = (char *)this + 48;
      char v11 = (*(uint64_t (**)(char *))(v8 + 16))((char *)this + 48);
      OALSourceMap::MarkAllSourcesForRecalculation(*((void **)v7 - 1));
      CAGuard::Locker::~Locker((CAGuard::Locker *)&v10);
    }
  }
  return 0;
}

void sub_22153751C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t OALContext::SetBusAzimuth(AudioUnit *this, AudioUnitElement inElement, AudioUnitParameterValue a3)
{
  return AudioUnitSetParameter(this[4], 0, 1u, inElement, a3, 0);
}

uint64_t OALContext::SetBusElevation(AudioUnit *this, AudioUnitElement inElement, AudioUnitParameterValue a3)
{
  return AudioUnitSetParameter(this[4], 1u, 1u, inElement, a3, 0);
}

uint64_t OALContext::SetBusDistance(AudioUnit *this, AudioUnitElement inElement, AudioUnitParameterValue a3)
{
  return AudioUnitSetParameter(this[4], 2u, 1u, inElement, a3, 0);
}

uint64_t OALContext::SetBusInputGain(AudioUnit *this, AudioUnitElement inElement, AudioUnitParameterValue a3)
{
  return AudioUnitSetParameter(this[4], 3u, 1u, inElement, a3, 0);
}

uint64_t OALContext::SetBusMinGain(AudioUnit *this, AudioUnitElement inElement, AudioUnitParameterValue a3)
{
  return AudioUnitSetParameter(this[4], 6u, 1u, inElement, a3, 0);
}

uint64_t OALContext::SetBusMaxGain(AudioUnit *this, AudioUnitElement inElement, AudioUnitParameterValue a3)
{
  return AudioUnitSetParameter(this[4], 7u, 1u, inElement, a3, 0);
}

uint64_t OALContext::SetBusPlaybackRate(AudioUnit *this, AudioUnitElement inElement, AudioUnitParameterValue a3)
{
  return AudioUnitSetParameter(this[4], 4u, 1u, inElement, a3, 0);
}

uint64_t OALContext::SetBusEnable(OALContext *this, AudioUnitElement inElement, int a3)
{
  float v3 = 0.0;
  if (a3) {
    float v3 = 1.0;
  }
  int v4 = (OpaqueAudioComponentInstance *)*((void *)this + 4);

  return AudioUnitSetParameter(v4, 5u, 1u, inElement, v3, 0);
}

uint64_t OALContext::SetBusDistanceParams(AudioUnit *this, AudioUnitElement inElement, const MixerDistanceParams *inData)
{
  return AudioUnitSetProperty(this[4], 0xBC2u, 1u, inElement, inData, 0xCu);
}

uint64_t OALContext::SetBusFormat(uint64_t a1, AudioUnitElement inElement, void *inData)
{
  return AudioUnitSetProperty(*(AudioUnit *)(a1 + 32), 8u, 1u, inElement, inData, 0x28u);
}

uint64_t OALContext::SetBusRenderProc(AudioUnit *this, AudioUnitElement inElement, const AURenderCallbackStruct *inData)
{
  return AudioUnitSetProperty(this[4], 0x17u, 1u, inElement, inData, 0x10u);
}

uint64_t OALContext::SetMixerOutputFormat(uint64_t a1, void *inData)
{
  return AudioUnitSetProperty(*(AudioUnit *)(a1 + 32), 8u, 2u, 0, inData, 0x28u);
}

uint64_t OALContext::GetBusDistanceParams(AudioUnit *this, AudioUnitElement inElement, MixerDistanceParams *outData)
{
  UInt32 ioDataSize = 12;
  return AudioUnitGetProperty(this[4], 0xBC2u, 1u, inElement, outData, &ioDataSize);
}

uint64_t OALContext::GetBusFormat(uint64_t a1, AudioUnitElement inElement, void *outData)
{
  UInt32 ioDataSize = 40;
  return AudioUnitGetProperty(*(AudioUnit *)(a1 + 32), 8u, 1u, inElement, outData, &ioDataSize);
}

uint64_t OALContext::InitRenderQualityOnSources(OALContext *this)
{
  uint64_t v1 = (_DWORD *)*((void *)this + 5);
  if (v1 && v1[4])
  {
    unsigned int v3 = 0;
    int v4 = (char *)this + 48;
    do
    {
      if (*(_DWORD **)v1 != v1 + 2)
      {
        int v5 = *(atomic_uint **)(*(void *)v1 + 40);
        if (v5)
        {
          unsigned int Token = OALSource::GetToken(*(OALSource **)(*(void *)v1 + 40));
          int v7 = (*(uint64_t (**)(char *))(*((void *)this + 6) + 16))(v4);
          uint64_t v8 = *((void *)this + 5);
          uint64_t v11 = *(void *)(v8 + 8);
          uint64_t v9 = v8 + 8;
          uint64_t v10 = v11;
          if (v11)
          {
            uint64_t v12 = v9;
            do
            {
              unsigned int v13 = *(_DWORD *)(v10 + 32);
              BOOL v14 = v13 >= Token;
              if (v13 >= Token) {
                AudioUnit v15 = (uint64_t *)v10;
              }
              else {
                AudioUnit v15 = (uint64_t *)(v10 + 8);
              }
              if (v14) {
                uint64_t v12 = v10;
              }
              uint64_t v10 = *v15;
            }
            while (*v15);
            if (v12 != v9 && *(_DWORD *)(v12 + 32) <= Token)
            {
              uint64_t v16 = *(void *)(v12 + 40);
              if (v16) {
                atomic_fetch_add((atomic_uint *volatile)(v16 + 72), 1u);
              }
            }
          }
          if (v7) {
            (*(void (**)(char *))(*(void *)v4 + 24))(v4);
          }
          OALSource::SetRenderQuality((OALSource *)v5, *((_DWORD *)this + 106));
          atomic_fetch_add(v5 + 18, 0xFFFFFFFF);
          uint64_t v1 = (_DWORD *)*((void *)this + 5);
        }
      }
      ++v3;
    }
    while (v3 < v1[4]);
  }
  return 0;
}

OALContext *OALContext::SetRenderQuality(OALContext *this, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*((_DWORD *)this + 106) != a2)
  {
    unsigned int v3 = this;
    if (!IsValidRenderQuality(a2))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v4 = *(void *)v3;
        int v6 = 136315906;
        int v7 = "oalContext.cpp";
        __int16 v8 = 1024;
        int v9 = 1040;
        __int16 v10 = 2048;
        uint64_t v11 = v4;
        __int16 v12 = 2048;
        uint64_t v13 = a2;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d OALContext::SetRenderQuality() - Error: Invalid Render Quality Requested - OALContext:inRenderQuality = %ld:%ld", (uint8_t *)&v6, 0x26u);
      }
      exception = __cxa_allocate_exception(4uLL);
      _DWORD *exception = 40963;
      __cxa_throw(exception, MEMORY[0x263F8C258], 0);
    }
    *((_DWORD *)v3 + 106) = a2;
    OALContext::InitRenderQualityOnBusses(v3);
    return (OALContext *)OALContext::InitRenderQualityOnSources(v3);
  }
  return this;
}

uint64_t OALContext::SetSourceDesiredRenderQualityOnBus(AudioUnit *this, int a2, AudioUnitElement a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (OALDevice::GetDesiredRenderChannelCount(this[2]) <= 2)
  {
    int inData = -1;
    uint64_t v14 = 0;
    long long outData = 0u;
    long long v13 = 0u;
    UInt32 ioDataSize = 40;
    if (IsValidRenderQuality(a2))
    {
      if (a2 == 1751412840)
      {
        int v9 = 1;
      }
      else
      {
        if (a2 != 1920034921)
        {
          if (a2 == 1919183983)
          {
            int inData = 0;
LABEL_14:
            OSStatus Property = AudioUnitGetProperty(this[4], 8u, 1u, a3, &outData, &ioDataSize);
            if (!Property)
            {
              if (HIDWORD(v13) != 1) {
                return 0;
              }
              OSStatus Property = AudioUnitSetProperty(this[4], 0xBB8u, 1u, a3, &inData, 4u);
              if (!Property) {
                return 0;
              }
            }
LABEL_15:
            for (i = &_os_log_internal;
                  ;
                  _os_log_impl(&dword_221534000, i, OS_LOG_TYPE_DEBUG, "%25s:%-5d OALContext::SetSourceDesiredRenderQualityOnBus() - Error setting kAudioUnitProperty_SpatializationAlgorithm: bus = %d, err = %d", buf, 0x1Eu))
            {
              while (!os_log_type_enabled(i, OS_LOG_TYPE_DEBUG))
                ;
              *(_DWORD *)buf = 136315906;
              BOOL v17 = "oalContext.cpp";
              __int16 v18 = 1024;
              int v19 = 1110;
              __int16 v20 = 1024;
              AudioUnitElement v21 = a3;
              __int16 v22 = 1024;
              OSStatus v23 = Property;
            }
          }
LABEL_10:
          OSStatus Property = -50;
          goto LABEL_15;
        }
        int v9 = 2;
      }
      int inData = v9;
      goto LABEL_14;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      AudioUnit v7 = *this;
      *(_DWORD *)buf = 136316162;
      BOOL v17 = "oalContext.cpp";
      __int16 v18 = 1024;
      int v19 = 1070;
      __int16 v20 = 1024;
      AudioUnitElement v21 = v7;
      __int16 v22 = 1024;
      OSStatus v23 = a2;
      __int16 v24 = 1024;
      AudioUnitElement v25 = a3;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d OALContext::SetSourceDesiredRenderQualityOnBus() - Error: Invalid Render Quality Requested - OALContext:inRenderQuality:inBus = %d:%d:%d", buf, 0x24u);
    }
    goto LABEL_10;
  }
  return 0;
}

uint64_t OALContext::GetAvailableMonoBus(OALContext *this, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((unsigned int *)this + 108);
  if (!v2) {
    goto LABEL_12;
  }
  uint64_t v5 = 0;
  int v6 = (_DWORD *)*((void *)this + 59);
  do
  {
    if (*v6 == -1 && v6[2] == 1)
    {
      _DWORD *v6 = a2;
LABEL_7:
      AudioUnitSetParameter(*((AudioUnit *)this + 4), 5u, 1u, v5, 1.0, 0);
      return v5;
    }
    ++v5;
    v6 += 3;
  }
  while (v2 != v5);
  if (*((unsigned char *)this + 464))
  {
LABEL_12:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "oalContext.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1220;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::GetAvailableMonoBus: COULD NOT GET A MONO BUS", buf, 0x12u);
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v5 = 0;
    while (*(_DWORD *)(*((void *)this + 59) + v7) != -1)
    {
      uint64_t v5 = (v5 + 1);
      v7 += 12;
      if (v2 == v5) {
        goto LABEL_12;
      }
    }
    uint64_t v13 = 0;
    *(void *)buf = *((void *)this + 56);
    *(_OWORD *)&buf[8] = xmmword_22155CFE0;
    uint64_t v12 = 0x100000002;
    LODWORD(v13) = 16;
    if (!AudioUnitSetProperty(*((AudioUnit *)this + 4), 8u, 1u, v5, buf, 0x28u))
    {
      int v9 = (_DWORD *)(*((void *)this + 59) + v7);
      _DWORD *v9 = a2;
      v9[2] = 1;
      AudioUnitSetProperty(*((AudioUnit *)this + 4), 0xBB8u, 1u, v5, (char *)this + 428, 4u);
      int inData = 4;
      AudioUnitSetProperty(*((AudioUnit *)this + 4), 0xBBBu, 1u, v5, &inData, 4u);
      goto LABEL_7;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t OALContext::GetAvailableStereoBus(OALContext *this, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((unsigned int *)this + 108);
  if (!v2) {
    goto LABEL_12;
  }
  uint64_t v5 = 0;
  int v6 = (_DWORD *)*((void *)this + 59);
  do
  {
    if (*v6 == -1 && v6[2] == 2)
    {
      _DWORD *v6 = a2;
LABEL_7:
      AudioUnitSetParameter(*((AudioUnit *)this + 4), 5u, 1u, v5, 1.0, 0);
      return v5;
    }
    ++v5;
    v6 += 3;
  }
  while (v2 != v5);
  if (*((unsigned char *)this + 464))
  {
LABEL_12:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "oalContext.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1291;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: GetAvailableStereoBus: COULD NOT GET A STEREO BUS", buf, 0x12u);
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v5 = 0;
    while (*(_DWORD *)(*((void *)this + 59) + v7) != -1)
    {
      uint64_t v5 = (v5 + 1);
      v7 += 12;
      if (v2 == v5) {
        goto LABEL_12;
      }
    }
    uint64_t v13 = 0;
    *(void *)buf = *((void *)this + 56);
    *(_OWORD *)&buf[8] = xmmword_22155CFD0;
    uint64_t v12 = 0x200000002;
    LODWORD(v13) = 16;
    if (!AudioUnitSetProperty(*((AudioUnit *)this + 4), 8u, 1u, v5, buf, 0x28u))
    {
      int v9 = (_DWORD *)(*((void *)this + 59) + v7);
      _DWORD *v9 = a2;
      v9[2] = 2;
      int inData = 5;
      AudioUnitSetProperty(*((AudioUnit *)this + 4), 0xBB8u, 1u, v5, &inData, 4u);
      goto LABEL_7;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t OALContext::SetBusAsAvailable(uint64_t this, unsigned int a2)
{
  uint64_t v2 = *(void *)(this + 472) + 12 * a2;
  *(_DWORD *)uint64_t v2 = -1;
  *(unsigned char *)(v2 + 4) = 0;
  return this;
}

uint64_t OALContext::SetBusNeedsPostRender(uint64_t this, unsigned int a2, int a3)
{
  if (*(_DWORD *)(this + 432) > a2)
  {
    *(unsigned char *)(*(void *)(this + 472) + 12 * a2 + 4) = a3;
    if (a3) {
      *(unsigned char *)(this + 436) = 1;
    }
  }
  return this;
}

uint64_t OALContext::DoPostRender(OALContext *this)
{
  if (!*((unsigned char *)this + 436)) {
    return 0;
  }
  *((unsigned char *)this + 436) = 0;
  unint64_t v2 = *((unsigned int *)this + 108);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = 0;
  uint64_t v4 = (char *)this + 48;
  while (1)
  {
    uint64_t v5 = *((void *)this + 59);
    if (!*(unsigned char *)(v5 + 12 * v3 + 4)) {
      goto LABEL_7;
    }
    unsigned int v6 = *(_DWORD *)(v5 + 12 * v3);
    __int16 v29 = 0;
    int v7 = (*(uint64_t (**)(char *, __int16 *))(*(void *)v4 + 32))((char *)this + 48, &v29);
    HIBYTE(v29) = v7;
    if (!v7) {
      goto LABEL_21;
    }
    uint64_t v8 = *((void *)this + 5);
    uint64_t v11 = *(void *)(v8 + 8);
    uint64_t v9 = v8 + 8;
    uint64_t v10 = v11;
    if (!v11) {
      goto LABEL_21;
    }
    uint64_t v12 = v9;
    do
    {
      unsigned int v13 = *(_DWORD *)(v10 + 32);
      BOOL v14 = v13 >= v6;
      if (v13 >= v6) {
        AudioUnit v15 = (uint64_t *)v10;
      }
      else {
        AudioUnit v15 = (uint64_t *)(v10 + 8);
      }
      if (v14) {
        uint64_t v12 = v10;
      }
      uint64_t v10 = *v15;
    }
    while (*v15);
    if (v12 != v9 && *(_DWORD *)(v12 + 32) <= v6)
    {
      uint64_t v16 = *(atomic_uint **)(v12 + 40);
      if (v16) {
        atomic_fetch_add(v16 + 18, 1u);
      }
    }
    else
    {
LABEL_21:
      uint64_t v16 = 0;
    }
    if ((_BYTE)v29) {
      (*(void (**)(char *))(*((void *)this + 6) + 24))((char *)this + 48);
    }
    if (!v16) {
      break;
    }
    OALSource::DoPostRender((OALSource *)v16);
    atomic_fetch_add(v16 + 18, 0xFFFFFFFF);
    unint64_t v2 = *((unsigned int *)this + 108);
LABEL_7:
    if (++v3 >= v2) {
      return 0;
    }
  }
  unsigned int v17 = *(_DWORD *)(*((void *)this + 59) + 12 * v3);
  __int16 v29 = 0;
  int v18 = (*(uint64_t (**)(char *, __int16 *))(*((void *)this + 24) + 32))((char *)this + 192, &v29);
  HIBYTE(v29) = v18;
  if (!v18) {
    goto LABEL_37;
  }
  uint64_t v19 = *((void *)this + 23);
  uint64_t v22 = *(void *)(v19 + 8);
  uint64_t v20 = v19 + 8;
  uint64_t v21 = v22;
  if (!v22) {
    goto LABEL_37;
  }
  uint64_t v23 = v20;
  do
  {
    unsigned int v24 = *(_DWORD *)(v21 + 32);
    BOOL v25 = v24 >= v17;
    if (v24 >= v17) {
      uint64_t v26 = (uint64_t *)v21;
    }
    else {
      uint64_t v26 = (uint64_t *)(v21 + 8);
    }
    if (v25) {
      uint64_t v23 = v21;
    }
    uint64_t v21 = *v26;
  }
  while (*v26);
  if (v23 != v20 && *(_DWORD *)(v23 + 32) <= v17)
  {
    uint64_t v27 = *(void *)(v23 + 40);
    if (v27) {
      atomic_fetch_add((atomic_uint *volatile)(v27 + 72), 1u);
    }
  }
  else
  {
LABEL_37:
    uint64_t v27 = 0;
  }
  if ((_BYTE)v29) {
    (*(void (**)(char *))(*((void *)this + 24) + 24))((char *)this + 192);
  }
  if (v27)
  {
    OALSource::ClearMessageQueue((void *)v27);
    OALSource::AddPlaybackMessage((OALSource *)v27, 9u, 0);
  }
  return 0;
}

uint64_t OALContext::SetReverbRoomType(uint64_t this, int a2)
{
  if (*(_DWORD *)(this + 496) != a2)
  {
    *(_DWORD *)(this + 496) = a2;
    this = AudioUnitSetProperty(*(AudioUnit *)(this + 32), 0xAu, 0, 0, (const void *)(this + 496), 4u);
    if (this)
    {
      int v2 = this;
      exception = __cxa_allocate_exception(4uLL);
      _DWORD *exception = v2;
      __cxa_throw(exception, MEMORY[0x263F8C258], 0);
    }
  }
  return this;
}

uint64_t OALContext::SetReverbLevel(uint64_t this, AudioUnitParameterValue a2)
{
  if (*(float *)(this + 500) != a2)
  {
    *(AudioUnitParameterValue *)(this + 500) = a2;
    this = AudioUnitSetParameter(*(AudioUnit *)(this + 32), 9u, 0, 0, a2, 0);
    if (this)
    {
      int v2 = this;
      exception = __cxa_allocate_exception(4uLL);
      _DWORD *exception = v2;
      __cxa_throw(exception, MEMORY[0x263F8C258], 0);
    }
  }
  return this;
}

void OALContext::SetReverbState(OALContext *this, int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*((_DWORD *)this + 123) != a2)
  {
    uint64_t v3 = (_DWORD *)((char *)this + 492);
    *((_DWORD *)this + 123) = a2;
    OSStatus v4 = AudioUnitSetProperty(*((AudioUnit *)this + 4), 0x3EDu, 0, 0, (char *)this + 492, 4u);
    if (v4)
    {
      OSStatus v7 = v4;
      exception = __cxa_allocate_exception(4uLL);
      _DWORD *exception = v7;
      __cxa_throw(exception, MEMORY[0x263F8C258], 0);
    }
    if (*v3 == 1)
    {
      int inData = 1;
      OSStatus v5 = AudioUnitSetProperty(*((AudioUnit *)this + 4), 0x11F8u, 0, 0, &inData, 4u);
      if (v5)
      {
        OSStatus v6 = v5;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v11 = "oalContext.cpp";
          __int16 v12 = 1024;
          int v13 = 1521;
          __int16 v14 = 1024;
          OSStatus v15 = v6;
          _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d Could not enable old 3D mixer reverb behavior, %d", buf, 0x18u);
        }
      }
    }
  }
}

uint64_t OALContext::SetReverbEQGain(uint64_t this, AudioUnitParameterValue a2)
{
  if (*(float *)(this + 504) != a2)
  {
    *(AudioUnitParameterValue *)(this + 504) = a2;
    this = AudioUnitSetParameter(*(AudioUnit *)(this + 32), 0x10u, 0, 0, a2, 0);
    if (this)
    {
      int v2 = this;
      exception = __cxa_allocate_exception(4uLL);
      _DWORD *exception = v2;
      __cxa_throw(exception, MEMORY[0x263F8C258], 0);
    }
  }
  return this;
}

uint64_t OALContext::SetReverbEQBandwidth(uint64_t this, AudioUnitParameterValue a2)
{
  if (*(float *)(this + 508) != a2)
  {
    *(AudioUnitParameterValue *)(this + 508) = a2;
    this = AudioUnitSetParameter(*(AudioUnit *)(this + 32), 0xFu, 0, 0, a2, 0);
    if (this)
    {
      int v2 = this;
      exception = __cxa_allocate_exception(4uLL);
      _DWORD *exception = v2;
      __cxa_throw(exception, MEMORY[0x263F8C258], 0);
    }
  }
  return this;
}

uint64_t OALContext::SetReverbEQFrequency(uint64_t this, AudioUnitParameterValue a2)
{
  if (*(float *)(this + 512) != a2)
  {
    *(AudioUnitParameterValue *)(this + 512) = a2;
    this = AudioUnitSetParameter(*(AudioUnit *)(this + 32), 0xEu, 0, 0, a2, 0);
    if (this)
    {
      int v2 = this;
      exception = __cxa_allocate_exception(4uLL);
      _DWORD *exception = v2;
      __cxa_throw(exception, MEMORY[0x263F8C258], 0);
    }
  }
  return this;
}

float OALContext::GetReverbEQGain(OALContext *this)
{
  uint64_t v1 = (char *)this + 504;
  OSStatus Parameter = AudioUnitGetParameter(*((AudioUnit *)this + 4), 0x10u, 0, 0, (AudioUnitParameterValue *)this + 126);
  float result = 0.0;
  if (!Parameter) {
    return *(float *)v1;
  }
  return result;
}

float OALContext::GetReverbEQBandwidth(OALContext *this)
{
  uint64_t v1 = (char *)this + 508;
  OSStatus Parameter = AudioUnitGetParameter(*((AudioUnit *)this + 4), 0xFu, 0, 0, (AudioUnitParameterValue *)this + 127);
  float result = 0.0;
  if (!Parameter) {
    return *(float *)v1;
  }
  return result;
}

float OALContext::GetReverbEQFrequency(OALContext *this)
{
  uint64_t v1 = (char *)this + 512;
  OSStatus Parameter = AudioUnitGetParameter(*((AudioUnit *)this + 4), 0xEu, 0, 0, (AudioUnitParameterValue *)this + 128);
  float result = 0.0;
  if (!Parameter) {
    return *(float *)v1;
  }
  return result;
}

void OALContext::OutputCapturerCreate(OALContext *this, double a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = (OALCaptureMixer *)*((void *)this + 65);
  if (v3)
  {
    if (!*((_DWORD *)v3 + 20))
    {
      OALCaptureMixer::~OALCaptureMixer(v3);
      MEMORY[0x223C843A0]();
      *((void *)this + 65) = 0;
      operator new();
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 136315394;
      OSStatus v6 = "oalContext.cpp";
      __int16 v7 = 1024;
      int v8 = 1672;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::OutputCapturerCreate FAILED - output capturer is currently capturing!", (uint8_t *)&v5, 0x12u);
    }
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = -1;
    __cxa_throw(exception, MEMORY[0x263F8C258], 0);
  }
  operator new();
}

void sub_221538904(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    MEMORY[0x223C843A0](v3, 0x1020C4037481C38);
    __cxa_begin_catch(exception_object);
    if (a2 == 2)
    {
      OSStatus v6 = *(OALCaptureMixer **)(v2 + 520);
      if (v6)
      {
        OALCaptureMixer::~OALCaptureMixer(v6);
        MEMORY[0x223C843A0]();
      }
    }
    else
    {
      __int16 v7 = *(OALCaptureMixer **)(v2 + 520);
      if (v7)
      {
        OALCaptureMixer::~OALCaptureMixer(v7);
        MEMORY[0x223C843A0]();
      }
    }
    *(void *)(v2 + 520) = 0;
    __cxa_end_catch();
    JUMPOUT(0x221538844);
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALContext::OutputCapturerStart(OALContext *this)
{
  uint64_t v1 = (OALCaptureMixer *)*((void *)this + 65);
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  OALCaptureMixer::StartCapture(v1);
  return 0;
}

uint64_t OALContext::OutputCapturerStop(OALContext *this)
{
  uint64_t v1 = (atomic_uint *)*((void *)this + 65);
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  OALCaptureMixer::StopCapture(v1);
  return 0;
}

uint64_t OALContext::OutputCapturerGetFrames(OALContext *this, unsigned int a2, unsigned __int8 *a3)
{
  uint64_t v3 = (OALCaptureMixer *)*((void *)this + 65);
  if (v3) {
    return OALCaptureMixer::GetFrames(v3, a2, a3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

OALCaptureMixer *OALContext::OutputCapturerAvailableFrames(OALContext *this)
{
  float result = (OALCaptureMixer *)*((void *)this + 65);
  if (result) {
    return (OALCaptureMixer *)OALCaptureMixer::AvailableFrames(result);
  }
  return result;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    OSStatus v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_10;
    }
    do
    {
      uint64_t v3 = v4;
      OSStatus v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (!v2)
  {
    int v5 = 1;
    OSStatus v6 = (uint64_t **)v3[2];
    __int16 v7 = *v6;
    if (*v6 == v3) {
      goto LABEL_6;
    }
LABEL_11:
    v6[1] = (uint64_t *)v2;
    int v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
LABEL_10:
  int v5 = 0;
  *(void *)(v2 + 16) = v3[2];
  OSStatus v6 = (uint64_t **)v3[2];
  __int16 v7 = *v6;
  if (*v6 != v3) {
    goto LABEL_11;
  }
LABEL_6:
  OALCaptureMixer *v6 = (uint64_t *)v2;
  if (v3 != result)
  {
    __int16 v7 = v6[1];
    int v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2) {
      goto LABEL_16;
    }
LABEL_12:
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *uint64_t v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      float result = v3;
    }
    goto LABEL_16;
  }
  __int16 v7 = 0;
  float result = (uint64_t *)v2;
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2) {
    goto LABEL_12;
  }
LABEL_16:
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
    __int16 v14 = (uint64_t **)v7[2];
    if (*v14 == v7) {
      break;
    }
    if (*((unsigned char *)v7 + 24))
    {
      OSStatus v15 = (void *)*v7;
      if (!*v7) {
        goto LABEL_38;
      }
    }
    else
    {
      *((unsigned char *)v7 + 24) = 1;
      *((unsigned char *)v14 + 24) = 0;
      unsigned int v17 = v14[1];
      int v18 = (uint64_t *)*v17;
      v14[1] = (uint64_t *)*v17;
      if (v18) {
        v18[2] = (uint64_t)v14;
      }
      v17[2] = (uint64_t)v14[2];
      v14[2][*v14[2] != (void)v14] = (uint64_t)v17;
      uint64_t *v17 = (uint64_t)v14;
      v14[2] = v17;
      if (result == (uint64_t *)*v7) {
        float result = v7;
      }
      __int16 v7 = *(uint64_t **)(*v7 + 8);
      OSStatus v15 = (void *)*v7;
      if (!*v7) {
        goto LABEL_38;
      }
    }
    if (!*((unsigned char *)v15 + 24))
    {
      uint64_t v19 = (uint64_t *)v7[1];
      if (!v19) {
        goto LABEL_64;
      }
LABEL_63:
      if (*((unsigned char *)v19 + 24))
      {
LABEL_64:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v23 = v15[1];
        uint64_t *v7 = v23;
        if (v23) {
          *(void *)(v23 + 16) = v7;
        }
        _OWORD v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        uint64_t v19 = v7;
      }
      else
      {
        OSStatus v15 = v7;
      }
      uint64_t v27 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v27 + 24);
      *(unsigned char *)(v27 + 24) = 1;
      *((unsigned char *)v19 + 24) = 1;
      uint64_t v28 = *(uint64_t **)(v27 + 8);
      uint64_t v29 = *v28;
      *(void *)(v27 + 8) = *v28;
      if (v29) {
        *(void *)(v29 + 16) = v27;
      }
      v28[2] = *(void *)(v27 + 16);
      *(void *)(*(void *)(v27 + 16) + 8 * (**(void **)(v27 + 16) != v27)) = v28;
      *uint64_t v28 = v27;
      *(void *)(v27 + 16) = v28;
      return result;
    }
LABEL_38:
    uint64_t v19 = (uint64_t *)v7[1];
    if (v19 && !*((unsigned char *)v19 + 24)) {
      goto LABEL_63;
    }
    *((unsigned char *)v7 + 24) = 0;
    __int16 v12 = (uint64_t *)v7[2];
    if (v12 == result)
    {
      __int16 v12 = result;
LABEL_61:
      *((unsigned char *)v12 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v12 + 24)) {
      goto LABEL_61;
    }
LABEL_24:
    __int16 v7 = *(uint64_t **)(v12[2] + 8 * (*(void *)v12[2] == (void)v12));
  }
  if (*((unsigned char *)v7 + 24))
  {
    uint64_t v16 = (void *)*v7;
    if (!*v7) {
      goto LABEL_49;
    }
LABEL_48:
    if (!*((unsigned char *)v16 + 24)) {
      goto LABEL_67;
    }
  }
  else
  {
    *((unsigned char *)v7 + 24) = 1;
    *((unsigned char *)v14 + 24) = 0;
    uint64_t v20 = (uint64_t *)v7[1];
    *__int16 v14 = v20;
    if (v20) {
      v20[2] = (uint64_t)v14;
    }
    v7[2] = (uint64_t)v14[2];
    v14[2][*v14[2] != (void)v14] = (uint64_t)v7;
    v7[1] = (uint64_t)v14;
    v14[2] = v7;
    if (result == (uint64_t *)v14) {
      float result = v7;
    }
    __int16 v7 = *v14;
    uint64_t v16 = (void *)**v14;
    if (v16) {
      goto LABEL_48;
    }
  }
LABEL_49:
  uint64_t v21 = (uint64_t *)v7[1];
  if (!v21 || *((unsigned char *)v21 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    __int16 v12 = (uint64_t *)v7[2];
    if (*((unsigned char *)v12 + 24)) {
      BOOL v13 = v12 == result;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13) {
      goto LABEL_61;
    }
    goto LABEL_24;
  }
  if (v16 && !*((unsigned char *)v16 + 24))
  {
LABEL_67:
    uint64_t v21 = v7;
  }
  else
  {
    *((unsigned char *)v21 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v22 = *v21;
    v7[1] = *v21;
    if (v22) {
      *(void *)(v22 + 16) = v7;
    }
    v21[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v21;
    *uint64_t v21 = (uint64_t)v7;
    v7[2] = (uint64_t)v21;
    uint64_t v16 = v7;
  }
  unsigned int v24 = (uint64_t *)v21[2];
  *((unsigned char *)v21 + 24) = *((unsigned char *)v24 + 24);
  *((unsigned char *)v24 + 24) = 1;
  *((unsigned char *)v16 + 24) = 1;
  uint64_t v25 = *v24;
  uint64_t v26 = *(void *)(*v24 + 8);
  *unsigned int v24 = v26;
  if (v26) {
    *(void *)(v26 + 16) = v24;
  }
  *(void *)(v25 + 16) = v24[2];
  *(void *)(v24[2] + 8 * (*(void *)v24[2] != (void)v24)) = v25;
  *(void *)(v25 + 8) = v24;
  v24[2] = v25;
  return result;
}

void std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

char *std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::__emplace_hint_multi<std::pair<unsigned int const,OALSource *>>(uint64_t ***a1, uint64_t **a2, _OWORD *a3)
{
  OSStatus v6 = (char *)operator new(0x30uLL);
  __int16 v7 = v6;
  int v8 = (unsigned int *)(v6 + 32);
  *((_OWORD *)v6 + 2) = *a3;
  uint64_t v9 = (uint64_t **)(a1 + 1);
  if (a1 + 1 != (uint64_t ***)a2)
  {
    unsigned int v10 = *v8;
    if (*((_DWORD *)a2 + 8) < *v8)
    {
      while (1)
      {
        uint64_t v11 = *v9;
        __int16 v12 = v9;
        if (!*v9) {
          goto LABEL_25;
        }
        while (1)
        {
          uint64_t v9 = (uint64_t **)v11;
          if (*((_DWORD *)v11 + 8) >= v10) {
            break;
          }
          uint64_t v11 = (uint64_t *)v11[1];
          if (!v11) {
            goto LABEL_19;
          }
        }
      }
    }
  }
  BOOL v13 = *a2;
  if (*a1 == a2)
  {
    OSStatus v15 = a2;
    goto LABEL_20;
  }
  if (v13)
  {
    __int16 v14 = *a2;
    do
    {
      OSStatus v15 = (uint64_t **)v14;
      __int16 v14 = (uint64_t *)v14[1];
    }
    while (v14);
  }
  else
  {
    uint64_t v16 = a2;
    do
    {
      OSStatus v15 = (uint64_t **)v16[2];
      BOOL v17 = *v15 == (uint64_t *)v16;
      uint64_t v16 = v15;
    }
    while (v17);
  }
  unsigned int v18 = *v8;
  if (*v8 >= *((_DWORD *)v15 + 8))
  {
LABEL_20:
    __int16 v12 = v15 + 1;
    if (v13) {
      uint64_t v9 = v15;
    }
    else {
      uint64_t v9 = a2;
    }
    if (!v13) {
      __int16 v12 = a2;
    }
    goto LABEL_25;
  }
  while (1)
  {
    uint64_t v19 = *v9;
    __int16 v12 = v9;
    if (!*v9) {
      break;
    }
    while (1)
    {
      uint64_t v9 = (uint64_t **)v19;
      if (v18 < *((_DWORD *)v19 + 8)) {
        break;
      }
      uint64_t v19 = (uint64_t *)v19[1];
      if (!v19)
      {
LABEL_19:
        __int16 v12 = v9 + 1;
        goto LABEL_25;
      }
    }
  }
LABEL_25:
  *(void *)OSStatus v6 = 0;
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = v9;
  *__int16 v12 = (uint64_t *)v6;
  uint64_t v20 = **a1;
  uint64_t v21 = (uint64_t *)v6;
  if (v20)
  {
    *a1 = (uint64_t **)v20;
    uint64_t v21 = *v12;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)a1[1], v21);
  a1[2] = (uint64_t **)((char *)a1[2] + 1);
  return v7;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 == result) {
    return result;
  }
  while (1)
  {
    uint64_t v2 = a2[2];
    if (*(unsigned char *)(v2 + 24)) {
      return result;
    }
    uint64_t v3 = *(uint64_t **)(v2 + 16);
    uint64_t v4 = *v3;
    if (*v3 != v2) {
      break;
    }
    uint64_t v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), int v5 = (unsigned char *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(unsigned char *)(v2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        *uint64_t v3 = v11;
        if (v11) {
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v9 = *(uint64_t **)(v2 + 8);
        uint64_t v10 = *v9;
        *(void *)(v2 + 8) = *v9;
        if (v10)
        {
          *(void *)(v10 + 16) = v2;
          uint64_t v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = v9;
        uint64_t *v9 = v2;
        *(void *)(v2 + 16) = v9;
        uint64_t v3 = (uint64_t *)v9[2];
        uint64_t v2 = *v3;
        *((unsigned char *)v9 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        *uint64_t v3 = v11;
        if (v11) {
LABEL_15:
        }
          *(void *)(v11 + 16) = v3;
      }
      *(void *)(v2 + 16) = v3[2];
      *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
      *(void *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(unsigned char *)(v2 + 24) = 1;
    a2 = v3;
    *((unsigned char *)v3 + 24) = v3 == result;
    unsigned char *v5 = 1;
    if (v3 == result) {
      return result;
    }
  }
  if (v4)
  {
    int v6 = *(unsigned __int8 *)(v4 + 24);
    int v5 = (unsigned char *)(v4 + 24);
    if (!v6) {
      goto LABEL_3;
    }
  }
  if (*(uint64_t **)v2 == a2)
  {
    uint64_t v12 = a2[1];
    *(void *)uint64_t v2 = v12;
    if (v12)
    {
      *(void *)(v12 + 16) = v2;
      uint64_t v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(void *)(v2 + 16) = a2;
    uint64_t v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((unsigned char *)a2 + 24) = 1;
  *((unsigned char *)v3 + 24) = 0;
  BOOL v13 = (uint64_t *)v3[1];
  uint64_t v14 = *v13;
  v3[1] = *v13;
  if (v14) {
    *(void *)(v14 + 16) = v3;
  }
  v13[2] = v3[2];
  *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v13;
  uint64_t *v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

uint64_t OALDevice::InitializeGraph(AUGraph *outGraph, const char *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = outGraph + 2;
  if (outGraph[2]) {
    return 1768843636;
  }
  uint64_t v11 = 0;
  memset(outData, 0, sizeof(outData));
  UInt32 ioDataSize = 40;
  uint64_t Property = NewAUGraph(outGraph + 2);
  if (Property) {
    goto LABEL_18;
  }
  v8.componentFlagsMask = 0;
  *(_OWORD *)&v8.componentType = xmmword_22155D000;
  uint64_t Property = AUGraphAddNode(outGraph[2], &v8, (AUNode *)outGraph + 6);
  if (Property) {
    goto LABEL_18;
  }
  uint64_t Property = AUGraphOpen(*v2);
  if (Property) {
    goto LABEL_18;
  }
  int v5 = outGraph + 4;
  uint64_t Property = AUGraphNodeInfo(outGraph[2], *((_DWORD *)outGraph + 6), 0, outGraph + 4);
  if (Property) {
    goto LABEL_18;
  }
  uint64_t Property = AudioUnitGetProperty(*v5, 8u, 2u, 0, outData, &ioDataSize);
  if (Property) {
    goto LABEL_18;
  }
  if (*(double *)outData == 0.0) {
    *(void *)&outData[0] = 0x40E5888000000000;
  }
  uint64_t Property = AudioUnitSetProperty(*v5, 8u, 1u, 0, outData, ioDataSize);
  if (Property
    || (uint64_t Property = AudioUnitInitialize(*v5), Property)
    || (uint64_t Property = AudioUnitAddPropertyListener(outGraph[4], 8u, (AudioUnitPropertyListenerProc)OALDevice::GraphFormatPropertyListener, outGraph), Property))
  {
LABEL_18:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = (uint64_t)*outGraph;
      *(_DWORD *)buf = 136315906;
      BOOL v13 = "oalDevice.cpp";
      __int16 v14 = 1024;
      int v15 = 338;
      __int16 v16 = 2048;
      uint64_t v17 = v6;
      __int16 v18 = 2048;
      uint64_t v19 = (int)Property;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALDevice::InitializeGraph FAILED - OALDevice = %ld : float result = %ld", buf, 0x26u);
    }
  }
  return Property;
}

void OALDevice::OALDevice(OALDevice *this, const char *a2, uint64_t a3)
{
  *(void *)this = a3;
  *((_DWORD *)this + 2) = 0;
  *((unsigned char *)this + 12) = 0;
  *((void *)this + 2) = 0;
  *((_DWORD *)this + 6) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0x40E5888000000000;
  *((void *)this + 8) = 0x72636D6300000002;
  *((void *)this + 9) = 512;
  *((unsigned char *)this + 80) = 0;
  CAGuard::CAGuard((OALDevice *)((char *)this + 88), "OALDevice:GraphLock");
  *((unsigned char *)this + 80) = OALDevice::InitializeGraph((AUGraph *)this, v4) == 0;
}

void sub_2215393FC(_Unwind_Exception *a1)
{
  CAGuard::~CAGuard(v1);
  _Unwind_Resume(a1);
}

void OALDevice::~OALDevice(OALDevice *this)
{
  uint64_t v2 = (OpaqueAUGraph *)*((void *)this + 2);
  if (v2)
  {
    AUGraphStop(v2);
    Boolean outIsRunning = 0;
    do
      AUGraphIsRunning(*((AUGraph *)this + 2), &outIsRunning);
    while (outIsRunning);
    DisposeAUGraph(*((AUGraph *)this + 2));
    *((void *)this + 2) = 0;
  }
  CAGuard::~CAGuard((OALDevice *)((char *)this + 88));
}

uint64_t OALDevice::SetError(uint64_t this, int a2)
{
  if (*(_DWORD *)(this + 8)) {
    *(_DWORD *)(this + 8) = a2;
  }
  return this;
}

uint64_t OALDevice::StopGraph(AUGraph *this)
{
  AUGraphStop(this[2]);
  Boolean outIsRunning = 0;
  do
    uint64_t result = AUGraphIsRunning(this[2], &outIsRunning);
  while (outIsRunning);
  return result;
}

uint64_t OALDevice::ResetRenderChannelSettings(OALDevice *this)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int DesiredRenderChannelCount = OALDevice::GetDesiredRenderChannelCount(this);
  if (*((_DWORD *)this + 16) == DesiredRenderChannelCount) {
    return 0;
  }
  *((_DWORD *)this + 16) = DesiredRenderChannelCount;
  uint64_t v4 = *((void *)this + 11);
  int v15 = (char *)this + 88;
  int v5 = (*(uint64_t (**)(char *))(v4 + 16))((char *)this + 88);
  char v16 = v5;
  outIsRunning[0] = 0;
  AUGraphIsRunning(*((AUGraph *)this + 2), outIsRunning);
  int v6 = outIsRunning[0];
  if (outIsRunning[0])
  {
    AUGraphStop(*((AUGraph *)this + 2));
    outIsRunning[0] = 0;
    do
      AUGraphIsRunning(*((AUGraph *)this + 2), outIsRunning);
    while (outIsRunning[0]);
  }
  if (!*((_DWORD *)this + 10)
    || (uint64_t Property = AUGraphDisconnectNodeInput(*((AUGraph *)this + 2), *((_DWORD *)this + 6), 0), !Property)
    && (uint64_t Property = AUGraphUpdate(*((AUGraph *)this + 2), 0), !Property))
  {
    memset(outIsRunning, 0, sizeof(outIsRunning));
    UInt32 ioDataSize = 40;
    uint64_t Property = AudioUnitGetProperty(*((AudioUnit *)this + 4), 8u, 1u, 0, outIsRunning, &ioDataSize);
    if (!Property)
    {
      int v7 = *((_DWORD *)this + 16);
      *(_OWORD *)&outIsRunning[8] = xmmword_22155CFC0;
      *(_DWORD *)&outIsRunning[24] = 4;
      *(_DWORD *)&outIsRunning[28] = v7;
      *(void *)&outIsRunning[32] = 32;
      uint64_t Property = AudioUnitSetProperty(*((AudioUnit *)this + 4), 8u, 1u, 0, outIsRunning, 0x28u);
      if (!Property)
      {
        if (*((_DWORD *)this + 16) < 3u
          || (int v10 = *((_DWORD *)this + 11),
              uint64_t v13 = 0,
              int inData = v10,
              uint64_t Property = AudioUnitSetProperty(*((AudioUnit *)this + 4), 0x13u, 1u, 0, &inData, 0x20u),
              !Property))
        {
          ReconfigureContextsOfThisDevice(*(void *)this);
          AUNode v11 = *((_DWORD *)this + 10);
          if (!v11) {
            goto LABEL_26;
          }
          if (*((unsigned char *)this + 12))
          {
            uint64_t Property = AUGraphUninitialize(*((AUGraph *)this + 2));
            if (Property) {
              goto LABEL_11;
            }
            *((unsigned char *)this + 12) = 0;
            AUNode v11 = *((_DWORD *)this + 10);
          }
          uint64_t Property = AUGraphConnectNodeInput(*((AUGraph *)this + 2), v11, 0, *((_DWORD *)this + 6), 0);
          if (Property) {
            goto LABEL_11;
          }
          uint64_t Property = AUGraphUpdate(*((AUGraph *)this + 2), 0);
          if (Property) {
            goto LABEL_11;
          }
          if (!*((unsigned char *)this + 12))
          {
            uint64_t Property = AUGraphInitialize(*((AUGraph *)this + 2));
            if (Property) {
              goto LABEL_11;
            }
            *((unsigned char *)this + 12) = 1;
            if (!v6) {
              goto LABEL_28;
            }
          }
          else
          {
LABEL_26:
            if (!v6)
            {
LABEL_28:
              uint64_t Property = 0;
              goto LABEL_11;
            }
          }
          uint64_t Property = AUGraphStart(*((AUGraph *)this + 2));
          if (!Property) {
            goto LABEL_28;
          }
        }
      }
    }
  }
LABEL_11:
  if (v5) {
    (*(void (**)(char *))(*((void *)this + 11) + 24))((char *)this + 88);
  }
  if (Property && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)this;
    *(_DWORD *)Boolean outIsRunning = 136315906;
    *(void *)&outIsRunning[4] = "oalDevice.cpp";
    *(_WORD *)&outIsRunning[12] = 1024;
    *(_DWORD *)&outIsRunning[14] = 224;
    *(_WORD *)&outIsRunning[18] = 2048;
    *(void *)&outIsRunning[20] = v8;
    *(_WORD *)&outIsRunning[28] = 1024;
    *(_DWORD *)&outIsRunning[30] = Property;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALDevice::ResetRenderChannelSettings FAILED - OALDevice = %lu : uint64_t result = %d", outIsRunning, 0x22u);
  }
  return Property;
}

void sub_221539808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  CAGuard::Locker::~Locker((CAGuard::Locker *)va);
  _Unwind_Resume(a1);
}

uint64_t OALDevice::GetDesiredRenderChannelCount(OALDevice *this)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  UInt32 outDataSize = 0;
  if (*((_DWORD *)this + 17) == 1919120244)
  {
    uint64_t v1 = 0;
    uint64_t v2 = 2;
    goto LABEL_7;
  }
  OSStatus PropertyInfo = AudioUnitGetPropertyInfo(*((AudioUnit *)this + 4), 0x13u, 2u, 0, &outDataSize, 0);
  if (PropertyInfo)
  {
    OSStatus v5 = PropertyInfo;
    uint64_t v2 = 2;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)this;
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = "oalDevice.cpp";
      __int16 v18 = 1024;
      int v19 = 434;
      __int16 v20 = 2048;
      uint64_t v21 = v6;
      __int16 v22 = 2048;
      uint64_t v23 = v5;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALDevice::GetDesiredRenderChannelCount: Cannot get audio channel layout -> defaulting to stereo: OALDevice = %ld : uint64_t result = %ld", buf, 0x26u);
    }
    uint64_t v1 = 0;
    goto LABEL_7;
  }
  uint64_t v1 = (AudioChannelLayout *)malloc_type_calloc(1uLL, outDataSize, 0xDF4BB07DuLL);
  if (!v1) {
    goto LABEL_37;
  }
  uint64_t v2 = 2;
  uint64_t Property = (OALDevice *)AudioUnitGetProperty(*((AudioUnit *)this + 4), 0x13u, 2u, 0, v1, &outDataSize);
  if (Property) {
    goto LABEL_7;
  }
  int mChannelLayoutTag = v1->mChannelLayoutTag;
  if (v1->mChannelLayoutTag)
  {
    *((_DWORD *)this + 11) = mChannelLayoutTag;
    if (mChannelLayoutTag <= 8192006)
    {
      if (mChannelLayoutTag > 7733252)
      {
        uint64_t v2 = 5;
        if (mChannelLayoutTag == 7733253 || mChannelLayoutTag == 7929862) {
          goto LABEL_7;
        }
      }
      else
      {
        if (mChannelLayoutTag == 7077892)
        {
          uint64_t v2 = 4;
          goto LABEL_7;
        }
        if (mChannelLayoutTag == 7274504)
        {
          uint64_t v2 = 8;
          goto LABEL_7;
        }
      }
    }
    else
    {
      if (mChannelLayoutTag > 9109509)
      {
        if (mChannelLayoutTag != 9699335 && mChannelLayoutTag != 9175047)
        {
          if (mChannelLayoutTag != 9109510) {
            goto LABEL_37;
          }
LABEL_38:
          uint64_t v2 = 6;
          goto LABEL_7;
        }
        goto LABEL_36;
      }
      if (mChannelLayoutTag == 8192007) {
        goto LABEL_38;
      }
      if (mChannelLayoutTag == 8388616)
      {
LABEL_36:
        uint64_t v2 = 7;
        goto LABEL_7;
      }
    }
LABEL_37:
    uint64_t v2 = 2;
    goto LABEL_7;
  }
  uint64_t mNumberChannelDescriptions = v1->mNumberChannelDescriptions;
  if (mNumberChannelDescriptions >= 3)
  {
    LODWORD(v2) = 0;
    mChannelDescriptions = v1->mChannelDescriptions;
    do
    {
      AudioChannelLabel mChannelLabel = mChannelDescriptions->mChannelLabel;
      ++mChannelDescriptions;
      AudioChannelLabel v12 = mChannelLabel;
      if (mChannelLabel == -1 || v12 == 4) {
        uint64_t v2 = v2;
      }
      else {
        uint64_t v2 = (v2 + 1);
      }
      --mNumberChannelDescriptions;
    }
    while (mNumberChannelDescriptions);
  }
  *((_DWORD *)this + 11) = OALDevice::GetLayoutTagForLayout(Property, v1, v2);
LABEL_7:
  free(v1);
  return v2;
}

OALDevice *OALDevice::GraphFormatPropertyListener(OALDevice *this, void *a2, OpaqueAudioComponentInstance *a3, int a4, int a5)
{
  if (a4 == 2 && !a5) {
    return (OALDevice *)OALDevice::ResetRenderChannelSettings(this);
  }
  return this;
}

void sub_221539B14(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

uint64_t OALDevice::SetRenderChannelSetting(OALDevice *this, int a2)
{
  if (a2 != 1919120244 && a2 != 1919118691) {
    return 40963;
  }
  if (*((_DWORD *)this + 17) != a2)
  {
    *((_DWORD *)this + 17) = a2;
    unsigned int v2 = *((_DWORD *)this + 16);
    if (a2 == 1919120244)
    {
      if (v2 == 2) {
        return 0;
      }
      goto LABEL_9;
    }
    if (v2 <= 2) {
LABEL_9:
    }
      OALDevice::ResetRenderChannelSettings(this);
  }
  return 0;
}

uint64_t OALDevice::GetLayoutTagForLayout(OALDevice *this, AudioChannelLayout *a2, int a3)
{
  uint64_t result = 7733253;
  switch(a3)
  {
    case 4:
      uint64_t result = 7077892;
      break;
    case 5:
      return result;
    case 6:
      uint64_t result = 9109510;
      break;
    case 7:
      uint64_t result = 9699335;
      uint64_t mNumberChannelDescriptions = a2->mNumberChannelDescriptions;
      if (mNumberChannelDescriptions)
      {
        mChannelDescriptions = a2->mChannelDescriptions;
        while (1)
        {
          AudioChannelLabel mChannelLabel = mChannelDescriptions->mChannelLabel;
          ++mChannelDescriptions;
          if (mChannelLabel - 33 < 2) {
            break;
          }
          if (!--mNumberChannelDescriptions) {
            return result;
          }
        }
        uint64_t result = 9175047;
      }
      break;
    case 8:
      uint64_t result = 7274504;
      break;
    default:
      uint64_t result = 6619138;
      break;
  }
  return result;
}

uint64_t OALDevice::ConnectContext(OALDevice *this, OALContext *a2)
{
  uint64_t Property = 0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!a2) {
    return Property;
  }
  OSStatus v5 = (OALContext *)*((void *)this + 6);
  if (v5 == a2) {
    return Property;
  }
  int DesiredRenderChannelCount = OALDevice::GetDesiredRenderChannelCount(this);
  int v7 = *((_DWORD *)this + 16);
  BOOL v8 = v7 != DesiredRenderChannelCount;
  if (v7 != DesiredRenderChannelCount) {
    *((_DWORD *)this + 16) = DesiredRenderChannelCount;
  }
  uint64_t v9 = *((void *)this + 11);
  uint64_t v21 = (char *)this + 88;
  int v10 = (*(uint64_t (**)(char *))(v9 + 16))((char *)this + 88);
  char v22 = v10;
  if (*((void *)this + 6) && *((_DWORD *)a2 + 6) != *((_DWORD *)this + 10))
  {
    uint64_t Property = AUGraphDisconnectNodeInput(*((AUGraph *)this + 2), *((_DWORD *)this + 6), 0);
    if (Property) {
      goto LABEL_12;
    }
    *((_DWORD *)this + 10) = 0;
    *((void *)this + 6) = 0;
    BOOL v8 = 1;
  }
  memset(outData, 0, sizeof(outData));
  UInt32 ioDataSize = 40;
  uint64_t Property = AudioUnitGetProperty(*((AudioUnit *)this + 4), 8u, 1u, 0, outData, &ioDataSize);
  if (Property) {
    goto LABEL_12;
  }
  int v11 = *((_DWORD *)this + 16);
  *(_OWORD *)&outData[8] = xmmword_22155CFC0;
  *(_DWORD *)&outData[24] = 4;
  *(_DWORD *)&outData[28] = v11;
  *(void *)&outData[32] = 32;
  *(void *)long long outData = *((void *)a2 + 56);
  uint64_t Property = AudioUnitSetProperty(*((AudioUnit *)this + 4), 8u, 1u, 0, outData, 0x28u);
  if (Property) {
    goto LABEL_12;
  }
  uint64_t Property = OALContext::SetMixerOutputFormat((uint64_t)a2, outData);
  if (Property) {
    goto LABEL_12;
  }
  if (*((_DWORD *)this + 16) >= 3u)
  {
    int v14 = *((_DWORD *)this + 11);
    uint64_t v19 = 0;
    int inData = v14;
    uint64_t Property = AudioUnitSetProperty(*((AudioUnit *)this + 4), 0x13u, 1u, 0, &inData, 0x20u);
    if (Property) {
      goto LABEL_12;
    }
  }
  if (*((unsigned char *)this + 12)) {
    BOOL v15 = v8;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    uint64_t Property = AUGraphUninitialize(*((AUGraph *)this + 2));
    if (Property) {
      goto LABEL_12;
    }
    *((unsigned char *)this + 12) = 0;
  }
  AUNode v16 = *((_DWORD *)a2 + 6);
  *((_DWORD *)this + 10) = v16;
  uint64_t Property = AUGraphConnectNodeInput(*((AUGraph *)this + 2), v16, 0, *((_DWORD *)this + 6), 0);
  if (!Property)
  {
    *((void *)this + 6) = a2;
    uint64_t v17 = (OpaqueAUGraph *)*((void *)this + 2);
    if (*((unsigned char *)this + 12))
    {
      uint64_t Property = AUGraphUpdate(v17, 0);
      if (!Property) {
        goto LABEL_32;
      }
    }
    else
    {
      uint64_t Property = AUGraphInitialize(v17);
      if (!Property)
      {
        *((unsigned char *)this + 12) = 1;
LABEL_32:
        outData[0] = 0;
        AUGraphIsRunning(*((AUGraph *)this + 2), outData);
        if (outData[0] || (uint64_t Property = AUGraphStart(*((AUGraph *)this + 2)), !Property)) {
          uint64_t Property = 0;
        }
      }
    }
  }
LABEL_12:
  if (v10) {
    (*(void (**)(char *))(*((void *)this + 11) + 24))((char *)this + 88);
  }
  if (Property)
  {
    *((void *)this + 6) = v5;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)this;
      *(_DWORD *)long long outData = 136315906;
      *(void *)&outData[4] = "oalDevice.cpp";
      *(_WORD *)&outData[12] = 1024;
      *(_DWORD *)&outData[14] = 564;
      *(_WORD *)&outData[18] = 2048;
      *(void *)&outData[20] = v12;
      *(_WORD *)&outData[28] = 2048;
      *(void *)&outData[30] = (int)Property;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALDevice::ConnectContext FAILED - OALDevice = %ld : uint64_t result = %ld", outData, 0x26u);
    }
  }
  return Property;
}

void sub_221539FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  CAGuard::Locker::~Locker((CAGuard::Locker *)va);
  _Unwind_Resume(a1);
}

uint64_t OALDevice::DisconnectContext(uint64_t this, OALContext *a2)
{
  if (a2)
  {
    uint64_t v2 = this;
    if (*(OALContext **)(this + 48) == a2)
    {
      *(void *)(this + 48) = 0;
      AUGraphDisconnectNodeInput(*(AUGraph *)(this + 16), *(_DWORD *)(this + 24), 0);
      Boolean outIsRunning = 0;
      AUGraphIsRunning(*(AUGraph *)(v2 + 16), &outIsRunning);
      if (outIsRunning) {
        AUGraphStop(*(AUGraph *)(v2 + 16));
      }
      return AUGraphUpdate(*(AUGraph *)(v2 + 16), 0);
    }
  }
  return this;
}

uint64_t OALDevice::RemoveContext(OALDevice *this, OALContext *a2)
{
  if (*((OALContext **)this + 6) == a2) {
    *((void *)this + 6) = 0;
  }
  AUGraphRemoveNode(*((AUGraph *)this + 2), *((_DWORD *)a2 + 6));
  uint64_t v3 = (OpaqueAUGraph *)*((void *)this + 2);

  return AUGraphUpdate(v3, 0);
}

uint64_t WaitOneRenderCycle(void)
{
  if (gOALContextMap)
  {
    v0 = *(void **)(gOALContextMap + 8);
    if (v0)
    {
      uint64_t v1 = gOALContextMap + 8;
      do
      {
        unint64_t v2 = v0[4];
        BOOL v3 = v2 >= gCurrentContext;
        if (v2 >= gCurrentContext) {
          uint64_t v4 = v0;
        }
        else {
          uint64_t v4 = v0 + 1;
        }
        if (v3) {
          uint64_t v1 = (uint64_t)v0;
        }
        v0 = (void *)*v4;
      }
      while (*v4);
      if (v1 != gOALContextMap + 8 && *(void *)(v1 + 32) <= (unint64_t)gCurrentContext)
      {
        uint64_t v5 = *(void *)(v1 + 40);
        if (v5) {
          return usleep(2* ((float)*(unsigned int *)(*(void *)(v5 + 16) + 72)/ (*(double *)(v5 + 448)/ 1000.0)* 1000.0));
        }
      }
    }
  }
  return result;
}

void ErrorKeyInitializer(void)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v0 = pthread_key_create((pthread_key_t *)&gALErrorKey, 0);
  if (v0)
  {
    int v1 = v0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 136315650;
      uint64_t v5 = "oalImp.cpp";
      __int16 v6 = 1024;
      int v7 = 240;
      __int16 v8 = 1024;
      int v9 = v1;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d pthread_key_create FAILED for gALErrorKey with result %d\n", (uint8_t *)&v4, 0x18u);
    }
  }
  int v2 = pthread_key_create((pthread_key_t *)&gALCErrorKey, 0);
  if (v2)
  {
    int v3 = v2;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 136315650;
      uint64_t v5 = "oalImp.cpp";
      __int16 v6 = 1024;
      int v7 = 244;
      __int16 v8 = 1024;
      int v9 = v3;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d pthread_key_create FAILED for gALCErrorKey with result %d\n", (uint8_t *)&v4, 0x18u);
    }
  }
}

void *alSetError(int a1)
{
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  uint64_t result = pthread_getspecific(gALErrorKey);
  if (!result)
  {
    pthread_key_t v3 = gALErrorKey;
    return (void *)pthread_setspecific(v3, (const void *)a1);
  }
  return result;
}

void CleanUpDeadBufferList(void)
{
  if (gDeadOALBufferMap)
  {
    int v0 = *(_DWORD *)(gDeadOALBufferMap + 16);
    if (v0)
    {
      int v1 = 0;
      unsigned int v2 = 0;
      do
      {
        while (1)
        {
          pthread_key_t v3 = *(void **)gDeadOALBufferMap;
          if (v2)
          {
            unsigned int v4 = 0;
            do
            {
              uint64_t v6 = gDeadOALBufferMap + 8;
              unsigned int v5 = v2;
              if (v3 != (void *)(gDeadOALBufferMap + 8))
              {
                int v7 = (void *)v3[1];
                if (v7)
                {
                  do
                  {
                    uint64_t v6 = (uint64_t)v7;
                    int v7 = (void *)*v7;
                  }
                  while (v7);
                }
                else
                {
                  do
                  {
                    __int16 v8 = v3;
                    pthread_key_t v3 = (void *)v3[2];
                  }
                  while ((void *)*v3 != v8);
                  uint64_t v6 = (uint64_t)v3;
                }
                unsigned int v5 = v4;
              }
              unsigned int v4 = v5 + 1;
              pthread_key_t v3 = (void *)v6;
            }
            while (v5 + 1 < v2);
          }
          else
          {
            uint64_t v6 = *(void *)gDeadOALBufferMap;
          }
          if (v6 != gDeadOALBufferMap + 8)
          {
            int v9 = *(OALBuffer **)(v6 + 40);
            if (v9)
            {
              if (OALBuffer::IsPurgable(*(OALBuffer **)(v6 + 40))) {
                break;
              }
            }
          }
          ++v2;
          if (++v1 == v0) {
            return;
          }
        }
        uint64_t v10 = gDeadOALBufferMap;
        int v11 = *(uint64_t **)(gDeadOALBufferMap + 8);
        if (v11)
        {
          unsigned int v12 = *(_DWORD *)v9;
          uint64_t v13 = gDeadOALBufferMap + 8;
          uint64_t v14 = *(void *)(gDeadOALBufferMap + 8);
          do
          {
            unsigned int v15 = *(_DWORD *)(v14 + 32);
            BOOL v16 = v15 >= v12;
            if (v15 >= v12) {
              uint64_t v17 = (uint64_t *)v14;
            }
            else {
              uint64_t v17 = (uint64_t *)(v14 + 8);
            }
            if (v16) {
              uint64_t v13 = v14;
            }
            uint64_t v14 = *v17;
          }
          while (*v17);
          if (v13 != gDeadOALBufferMap + 8 && *(_DWORD *)(v13 + 32) <= v12)
          {
            __int16 v18 = *(void **)(v13 + 8);
            uint64_t v19 = (void *)v13;
            if (v18)
            {
              do
              {
                __int16 v20 = v18;
                __int16 v18 = (void *)*v18;
              }
              while (v18);
            }
            else
            {
              do
              {
                __int16 v20 = (void *)v19[2];
                BOOL v21 = *v20 == (void)v19;
                uint64_t v19 = v20;
              }
              while (!v21);
            }
            if (*(void *)gDeadOALBufferMap == v13) {
              *(void *)gDeadOALBufferMap = v20;
            }
            --*(void *)(v10 + 16);
            std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v11, (uint64_t *)v13);
            operator delete((void *)v13);
          }
        }
        OALBuffer::~OALBuffer(v9);
        MEMORY[0x223C843A0]();
        ++v1;
      }
      while (v1 != v0);
    }
  }
}

uint64_t ProtectContextObject(unint64_t a1)
{
  if (!gOALContextMap) {
    return 0;
  }
  uint64_t v2 = gContextMapLock;
  int v3 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  unsigned int v4 = *(void **)(gOALContextMap + 8);
  if (!v4) {
    goto LABEL_13;
  }
  uint64_t v5 = gOALContextMap + 8;
  do
  {
    unint64_t v6 = v4[4];
    BOOL v7 = v6 >= a1;
    if (v6 >= a1) {
      __int16 v8 = v4;
    }
    else {
      __int16 v8 = v4 + 1;
    }
    if (v7) {
      uint64_t v5 = (uint64_t)v4;
    }
    unsigned int v4 = (void *)*v8;
  }
  while (*v8);
  if (v5 != gOALContextMap + 8 && *(void *)(v5 + 32) <= a1)
  {
    uint64_t v9 = *(void *)(v5 + 40);
    if (v9) {
      atomic_fetch_add((atomic_uint *volatile)(v9 + 440), 1u);
    }
  }
  else
  {
LABEL_13:
    uint64_t v9 = 0;
  }
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  return v9;
}

uint64_t ProtectSourceObjectInCurrentContext(unsigned int a1)
{
  if (!gOALContextMap) {
    return 0;
  }
  unint64_t v2 = gCurrentContext;
  uint64_t v3 = gContextMapLock;
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  uint64_t v5 = *(void **)(gOALContextMap + 8);
  if (!v5) {
    goto LABEL_13;
  }
  uint64_t v6 = gOALContextMap + 8;
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= v2;
    if (v7 >= v2) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = v5 + 1;
    }
    if (v8) {
      uint64_t v6 = (uint64_t)v5;
    }
    uint64_t v5 = (void *)*v9;
  }
  while (*v9);
  if (v6 != gOALContextMap + 8 && *(void *)(v6 + 32) <= v2)
  {
    uint64_t v10 = *(atomic_uint **)(v6 + 40);
    if (v10) {
      atomic_fetch_add(v10 + 110, 1u);
    }
  }
  else
  {
LABEL_13:
    uint64_t v10 = 0;
  }
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v3 + 24))(v3);
  }
  if (!v10) {
    return 0;
  }
  uint64_t result = OALContext::ProtectSource((OALContext *)v10, a1);
  atomic_fetch_add(v10 + 110, 0xFFFFFFFF);
  return result;
}

uint64_t InitializeBufferMap(void)
{
  if (!gOALBufferMap) {
    operator new();
  }
  return pthread_mutex_unlock(&InitializeBufferMap(void)::sInitLock);
}

void sub_22153A8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_22153A8C0(_Unwind_Exception *a1)
{
  MEMORY[0x223C843A0](v1, 0x10F0C403FF1FE8BLL);
  _Unwind_Resume(a1);
}

void sub_22153A8E4(_Unwind_Exception *a1)
{
  MEMORY[0x223C843A0](v1, 0x10F1C4021999281);
  _Unwind_Resume(a1);
}

uint64_t DeleteContextsOfThisDevice(uint64_t a1)
{
  uint64_t v24 = gContextMapLock;
  int v2 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  uint64_t v3 = (uint64_t **)gOALContextMap;
  if (!gOALContextMap) {
    goto LABEL_39;
  }
  if (*(_DWORD *)(gOALContextMap + 16))
  {
    unsigned int v4 = 0;
    while (1)
    {
      uint64_t v5 = *v3;
      if (v4)
      {
        uint64_t v6 = v4;
        do
        {
          BOOL v8 = (uint64_t *)v5[1];
          if (v8)
          {
            do
            {
              uint64_t v9 = v8;
              BOOL v8 = (uint64_t *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              uint64_t v9 = (uint64_t *)v5[2];
              BOOL v10 = *v9 == (void)v5;
              uint64_t v5 = v9;
            }
            while (!v10);
          }
          uint64_t v5 = v9;
        }
        while (v6-- > 1);
      }
      else
      {
        uint64_t v9 = *v3;
      }
      if (v9 == (uint64_t *)(v3 + 1)) {
        break;
      }
      int v11 = (OALContext *)v9[5];
      if (!v11) {
        break;
      }
      if (**((void **)v11 + 2) == a1)
      {
        unint64_t v12 = v9[4];
        if (v12 == gCurrentContext)
        {
          alcMakeContextCurrent(0);
          uint64_t v3 = (uint64_t **)gOALContextMap;
        }
        uint64_t v13 = v3[1];
        if (v13)
        {
          uint64_t v14 = (uint64_t *)(v3 + 1);
          unsigned int v15 = v3[1];
          do
          {
            unint64_t v16 = v15[4];
            BOOL v17 = v16 >= v12;
            if (v16 >= v12) {
              __int16 v18 = (uint64_t **)v15;
            }
            else {
              __int16 v18 = (uint64_t **)(v15 + 1);
            }
            if (v17) {
              uint64_t v14 = v15;
            }
            unsigned int v15 = *v18;
          }
          while (*v18);
          if (v14 != (uint64_t *)(v3 + 1) && v14[4] <= v12)
          {
            uint64_t v19 = (uint64_t *)v14[1];
            __int16 v20 = v14;
            if (v19)
            {
              do
              {
                BOOL v21 = v19;
                uint64_t v19 = (uint64_t *)*v19;
              }
              while (v19);
            }
            else
            {
              do
              {
                BOOL v21 = (uint64_t *)v20[2];
                BOOL v10 = *v21 == (void)v20;
                __int16 v20 = v21;
              }
              while (!v10);
            }
            if (*v3 == v14) {
              *uint64_t v3 = v21;
            }
            v3[2] = (uint64_t *)((char *)v3[2] - 1);
            std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v13, v14);
            operator delete(v14);
            OALContext::~OALContext(v11);
            MEMORY[0x223C843A0]();
            --v4;
            uint64_t v3 = (uint64_t **)gOALContextMap;
          }
        }
      }
      if (++v4 >= *((_DWORD *)v3 + 4)) {
        goto LABEL_41;
      }
    }
LABEL_39:
    uint64_t v22 = 40964;
    if (v2) {
      goto LABEL_42;
    }
    return v22;
  }
LABEL_41:
  uint64_t v22 = 0;
  if (v2) {
LABEL_42:
  }
    (*(void (**)(uint64_t))(*(void *)v24 + 24))(v24);
  return v22;
}

void sub_22153AB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

ALCBOOLean alcMakeContextCurrent(ALCcontext *context)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v32 = 136315650;
    v33 = "oalImp.cpp";
    __int16 v34 = 1024;
    int v35 = 840;
    __int16 v36 = 2048;
    v37 = context;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcMakeContextCurrent--> context = %ld", (uint8_t *)&v32, 0x1Cu);
  }
  unint64_t v2 = gCurrentContext;
  if ((ALCcontext *)gCurrentContext == context) {
    return 1;
  }
  if (gOALContextMap) {
    BOOL v4 = gOALDeviceMap == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    if (gCurrentContext)
    {
      uint64_t v6 = gContextMapLock;
      int v7 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
      BOOL v8 = *(void **)(gOALContextMap + 8);
      if (!v8) {
        goto LABEL_23;
      }
      uint64_t v9 = gOALContextMap + 8;
      do
      {
        unint64_t v10 = v8[4];
        BOOL v11 = v10 >= v2;
        if (v10 >= v2) {
          unint64_t v12 = v8;
        }
        else {
          unint64_t v12 = v8 + 1;
        }
        if (v11) {
          uint64_t v9 = (uint64_t)v8;
        }
        BOOL v8 = (void *)*v12;
      }
      while (*v12);
      if (v9 != gOALContextMap + 8 && *(void *)(v9 + 32) <= v2)
      {
        uint64_t v13 = *(atomic_uint **)(v9 + 40);
        if (v13) {
          atomic_fetch_add(v13 + 110, 1u);
        }
      }
      else
      {
LABEL_23:
        uint64_t v13 = 0;
      }
      if (v7) {
        (*(void (**)(uint64_t))(*(void *)v6 + 24))(v6);
      }
      if (!context)
      {
        gCurrentDevice = 0;
        gCurrentContext = 0;
        if (!v13) {
          return 1;
        }
        ALCenum v5 = OALContext::DisconnectMixerFromDevice((OALContext *)v13);
        uint64_t v14 = 0;
        goto LABEL_49;
      }
    }
    else
    {
      if (!context)
      {
        gCurrentDevice = 0;
        gCurrentContext = 0;
        return 1;
      }
      uint64_t v13 = 0;
    }
    uint64_t v15 = gContextMapLock;
    int v16 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
    uint64_t v17 = gOALContextMap + 8;
    __int16 v18 = *(void **)(gOALContextMap + 8);
    if (!v18) {
      goto LABEL_42;
    }
    uint64_t v19 = gOALContextMap + 8;
    __int16 v20 = *(void **)(gOALContextMap + 8);
    do
    {
      unint64_t v21 = v20[4];
      BOOL v22 = v21 >= (unint64_t)context;
      if (v21 >= (unint64_t)context) {
        uint64_t v23 = v20;
      }
      else {
        uint64_t v23 = v20 + 1;
      }
      if (v22) {
        uint64_t v19 = (uint64_t)v20;
      }
      __int16 v20 = (void *)*v23;
    }
    while (*v23);
    if (v19 != v17 && *(void *)(v19 + 32) <= (unint64_t)context)
    {
      uint64_t v14 = *(void *)(v19 + 40);
      if (v14)
      {
        uint64_t v27 = gOALContextMap + 8;
        do
        {
          unint64_t v28 = v18[4];
          BOOL v29 = v28 >= (unint64_t)context;
          if (v28 >= (unint64_t)context) {
            BOOL v30 = v18;
          }
          else {
            BOOL v30 = v18 + 1;
          }
          if (v29) {
            uint64_t v27 = (uint64_t)v18;
          }
          __int16 v18 = (void *)*v30;
        }
        while (*v30);
        if (v27 == v17 || *(void *)(v27 + 32) > (unint64_t)context || (uint64_t v31 = *(void *)(v27 + 40)) == 0)
        {
          char v25 = 0;
          ALCenum v5 = 0;
          uint64_t v24 = 0;
        }
        else
        {
          char v25 = 0;
          ALCenum v5 = 0;
          uint64_t v24 = **(void **)(v31 + 16);
        }
LABEL_44:
        if (v16) {
          (*(void (**)(uint64_t))(*(void *)v15 + 24))(v15);
        }
        if ((v25 & 1) == 0)
        {
          gCurrentDevice = v24;
          gCurrentContext = (uint64_t)context;
          ALCenum v5 = OALContext::ConnectMixerToDevice((OALDevice **)v14);
        }
        if (!v13)
        {
          if (!v14) {
            goto LABEL_53;
          }
          goto LABEL_52;
        }
LABEL_49:
        atomic_fetch_add(v13 + 110, 0xFFFFFFFF);
        if (!v14)
        {
LABEL_53:
          if (v5) {
            goto LABEL_54;
          }
          return 1;
        }
LABEL_52:
        atomic_fetch_add((atomic_uint *volatile)(v14 + 440), 0xFFFFFFFF);
        goto LABEL_53;
      }
    }
    else
    {
LABEL_42:
      uint64_t v14 = 0;
    }
    uint64_t v24 = 0;
    ALCenum v5 = 40962;
    char v25 = 1;
    goto LABEL_44;
  }
  ALCenum v5 = 40964;
LABEL_54:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    String = alcGetString(0, v5);
    int v32 = 136315650;
    v33 = "oalImp.cpp";
    __int16 v34 = 1024;
    int v35 = 894;
    __int16 v36 = 2080;
    v37 = (ALCcontext *)String;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcMakeContextCurrent FAILED = %s\n", (uint8_t *)&v32, 0x1Cu);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALCErrorKey)) {
    pthread_setspecific(gALCErrorKey, (const void *)v5);
  }
  return 0;
}

void sub_22153AF9C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t ReconfigureContextsOfThisDevice(uint64_t result)
{
  if (gOALContextMap)
  {
    uint64_t v1 = result;
    uint64_t v2 = gContextMapLock;
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
    int v3 = result;
    uint64_t v4 = gOALContextMap;
    if (*(_DWORD *)(gOALContextMap + 16))
    {
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = *(void **)v4;
        if (v5)
        {
          uint64_t v7 = v5;
          do
          {
            uint64_t v9 = (void *)v6[1];
            if (v9)
            {
              do
              {
                unint64_t v10 = v9;
                uint64_t v9 = (void *)*v9;
              }
              while (v9);
            }
            else
            {
              do
              {
                unint64_t v10 = (void *)v6[2];
                BOOL v11 = *v10 == (void)v6;
                uint64_t v6 = v10;
              }
              while (!v11);
            }
            uint64_t v6 = v10;
          }
          while (v7-- > 1);
        }
        else
        {
          unint64_t v10 = *(void **)v4;
        }
        if (v10 != (void *)(v4 + 8))
        {
          uint64_t result = v10[5];
          if (result)
          {
            if (**(void **)(result + 16) == v1)
            {
              uint64_t result = OALContext::ConfigureMixerFormat((AudioUnit *)result);
              uint64_t v4 = gOALContextMap;
            }
          }
        }
        ++v5;
      }
      while (v5 < *(unsigned int *)(v4 + 16));
    }
    if (v3) {
      return (*(uint64_t (**)(uint64_t))(*(void *)v2 + 24))(v2);
    }
  }
  return result;
}

void sub_22153B104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

ALCdevice *__cdecl alcCaptureOpenDevice(const ALCchar *devicename, ALCuint frequency, ALCenum format, ALCsizei buffersize)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if ((format - 4352) > 3) {
      uint64_t v7 = "UNKNOWN FORMAT";
    }
    else {
      uint64_t v7 = off_2645B7880[format - 4352];
    }
    buf[0] = 136316162;
    *(void *)&buf[1] = "oalImp.cpp";
    __int16 v11 = 1024;
    int v12 = 510;
    __int16 v13 = 2080;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = frequency;
    __int16 v17 = 2048;
    uint64_t v18 = buffersize;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcCaptureOpenDevice: format %s : sample rate = %ld : buffer size = %ld", (uint8_t *)buf, 0x30u);
  }
  if (format >> 2 == 1088)
  {
    pthread_mutex_lock(&stru_267F54208);
    if (!gOALCaptureDeviceMap) {
      operator new();
    }
    pthread_mutex_unlock(&stru_267F54208);
    ++_MergedGlobals;
    operator new();
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    String = alcGetString(0, 40963);
    buf[0] = 136315650;
    *(void *)&buf[1] = "oalImp.cpp";
    __int16 v11 = 1024;
    int v12 = 538;
    __int16 v13 = 2080;
    uint64_t v14 = String;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcCaptureOpenDevice FAILED = %s\n", (uint8_t *)buf, 0x1Cu);
  }
  return 0;
}

void sub_22153B43C(_Unwind_Exception *a1)
{
  MEMORY[0x223C843A0](v1, 0x10F1C4021999281);
  _Unwind_Resume(a1);
}

void sub_22153B460(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

BOOL IsFormatSupported(unsigned int a1)
{
  return a1 >> 2 == 1088;
}

const ALCchar *__cdecl alcGetString(ALCdevice *device, ALCenum param)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (param > 4100)
    {
      switch(param)
      {
        case 40961:
          uint64_t v4 = "ALC_INVALID_DEVICE";
          break;
        case 40962:
          uint64_t v4 = "ALC_INVALID_CONTEXT";
          break;
        case 40963:
          uint64_t v4 = "ALC_INVALID_ENUM";
          break;
        case 40964:
          uint64_t v4 = "ALC_INVALID_VALUE";
          break;
        default:
          if (param == 4102)
          {
            uint64_t v4 = "ALC_EXTENSIONS";
          }
          else
          {
            if (param != 4101) {
              goto LABEL_17;
            }
            uint64_t v4 = "ALC_DEVICE_SPECIFIER";
          }
          break;
      }
      goto LABEL_22;
    }
    if (param > 784)
    {
      if (param == 785)
      {
        uint64_t v4 = "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
      if (param == 4100)
      {
        uint64_t v4 = "ALC_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
    }
    else
    {
      if (!param)
      {
        uint64_t v4 = "ALC_NO_ERROR";
        goto LABEL_22;
      }
      if (param == 784)
      {
        uint64_t v4 = "ALC_CAPTURE_DEVICE_SPECIFIER";
LABEL_22:
        int v13 = 136315650;
        uint64_t v14 = "oalImp.cpp";
        __int16 v15 = 1024;
        int v16 = 1019;
        __int16 v17 = 2080;
        uint64_t v18 = v4;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcGetString-->  %s", (uint8_t *)&v13, 0x1Cu);
        goto LABEL_23;
      }
    }
LABEL_17:
    uint64_t v4 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
    goto LABEL_22;
  }
LABEL_23:
  unsigned int v5 = 40964;
  if (param <= 4100)
  {
    if (param <= 784)
    {
      if (!param) {
        return "No Error";
      }
      if (param == 784)
      {
        uint64_t v6 = (char *)&gDefaultInputDeviceName;
        strcpy((char *)&gDefaultInputDeviceName, "Default Audio Device");
        if (!device) {
LABEL_46:
        }
          v6[strlen(v6) + 1] = 0;
        return v6;
      }
LABEL_48:
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey)) {
        pthread_setspecific(gALErrorKey, (const void *)v5);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        if (param <= 4101)
        {
LABEL_56:
          unint64_t v10 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
        }
        else
        {
          switch(param)
          {
            case 40961:
              unint64_t v10 = "ALC_INVALID_DEVICE";
              break;
            case 40962:
              unint64_t v10 = "ALC_INVALID_CONTEXT";
              break;
            case 40963:
              unint64_t v10 = "ALC_INVALID_ENUM";
              break;
            case 40964:
              unint64_t v10 = "ALC_INVALID_VALUE";
              break;
            default:
              if (param != 4102) {
                goto LABEL_56;
              }
              unint64_t v10 = "ALC_EXTENSIONS";
              break;
          }
        }
        String = alcGetString(0, v5);
        int v13 = 136315906;
        uint64_t v14 = "oalImp.cpp";
        __int16 v15 = 1024;
        int v16 = 1097;
        __int16 v17 = 2080;
        uint64_t v18 = v10;
        __int16 v19 = 2080;
        __int16 v20 = String;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcGetString FAILED - attribute = %s error = %s\n", (uint8_t *)&v13, 0x26u);
      }
      return 0;
    }
    if (param == 785)
    {
      long long v7 = *(_OWORD *)"Default Audio Device";
      uint64_t v6 = (char *)&gDefaultInputDeviceName;
    }
    else
    {
      if (param != 4100) {
        goto LABEL_48;
      }
      long long v7 = *(_OWORD *)"Default Audio Device";
      uint64_t v6 = (char *)&gDefaultOutputDeviceName;
    }
    *(_OWORD *)uint64_t v6 = v7;
    strcpy(v6 + 13, " Device");
    return v6;
  }
  switch(param)
  {
    case 40961:
      uint64_t v6 = "ALC Invalid Device";
      break;
    case 40962:
      uint64_t v6 = "ALC Invalid Context";
      break;
    case 40963:
      uint64_t v6 = "Invalid Enum";
      break;
    case 40964:
      uint64_t v6 = "Invalid Value";
      break;
    default:
      if (param == 4101)
      {
        uint64_t v6 = (char *)&gDefaultOutputDeviceName;
        strcpy((char *)&gDefaultOutputDeviceName, "Default Audio Device");
        if (!device) {
          goto LABEL_46;
        }
      }
      else
      {
        if (param != 4102) {
          goto LABEL_48;
        }
        if (!device)
        {
          unsigned int v5 = 40961;
          goto LABEL_48;
        }
        uint64_t v6 = (char *)alcExtensions;
        if (!alcExtensions)
        {
          BOOL v8 = (char *)malloc_type_malloc(0x34uLL, 0x607E9530uLL);
          alcExtensions = (uint64_t)v8;
          strcpy(v8, "ALC_EXT_CAPTURE ALC_ENUMERATION_EXT ALC_EXT_MAC_OSX");
          size_t v9 = strlen(v8);
          uint64_t v6 = (char *)malloc_type_realloc(v8, v9 + 37, 0xAB49D99FuLL);
          alcExtensions = (uint64_t)v6;
          strcat(v6, " ALC_EXT_ASA");
          strcat(v6, " ALC_EXT_OUTPUT_CAPTURER");
        }
      }
      break;
  }
  return v6;
}

ALCBOOLean alcCaptureCloseDevice(ALCdevice *device)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v27 = 136315394;
    *(void *)&v27[4] = "oalImp.cpp";
    __int16 v28 = 1024;
    int v29 = 553;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcCaptureCloseDevice", v27, 0x12u);
  }
  if (!gOALCaptureDeviceMap || !*(void *)(gOALCaptureDeviceMap + 16))
  {
    ALCenum v13 = 40964;
    goto LABEL_22;
  }
  uint64_t v2 = gCaptureDeviceMapLock;
  *(void *)uint64_t v27 = gCaptureDeviceMapLock;
  int v3 = (*(uint64_t (**)(uint64_t))(*(void *)gCaptureDeviceMapLock + 16))(gCaptureDeviceMapLock);
  v27[8] = v3;
  uint64_t v4 = gOALCaptureDeviceMap;
  uint64_t v6 = gOALCaptureDeviceMap + 8;
  unsigned int v5 = *(uint64_t **)(gOALCaptureDeviceMap + 8);
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v7 = gOALCaptureDeviceMap + 8;
  BOOL v8 = *(void **)(gOALCaptureDeviceMap + 8);
  do
  {
    unint64_t v9 = v8[4];
    BOOL v10 = v9 >= (unint64_t)device;
    if (v9 >= (unint64_t)device) {
      __int16 v11 = v8;
    }
    else {
      __int16 v11 = v8 + 1;
    }
    if (v10) {
      uint64_t v7 = (uint64_t)v8;
    }
    BOOL v8 = (void *)*v11;
  }
  while (*v11);
  if (v7 == v6 || *(void *)(v7 + 32) > (unint64_t)device)
  {
LABEL_16:
    LOBYTE(v12) = 0;
    goto LABEL_17;
  }
  int v12 = *(OALCaptureDevice **)(v7 + 40);
  if (!v12)
  {
LABEL_17:
    ALCenum v13 = 40963;
    if (!v3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  int v16 = (uint64_t *)(gOALCaptureDeviceMap + 8);
  __int16 v17 = *(void **)(gOALCaptureDeviceMap + 8);
  do
  {
    unint64_t v18 = v17[4];
    BOOL v19 = v18 >= (unint64_t)device;
    if (v18 >= (unint64_t)device) {
      __int16 v20 = v17;
    }
    else {
      __int16 v20 = v17 + 1;
    }
    if (v19) {
      int v16 = v17;
    }
    __int16 v17 = (void *)*v20;
  }
  while (*v20);
  if (v16 != (uint64_t *)v6 && v16[4] <= (unint64_t)device)
  {
    uint64_t v21 = (uint64_t *)v16[1];
    if (v21)
    {
      do
      {
        BOOL v22 = v21;
        uint64_t v21 = (uint64_t *)*v21;
      }
      while (v21);
    }
    else
    {
      uint64_t v23 = v16;
      do
      {
        BOOL v22 = (uint64_t *)v23[2];
        BOOL v24 = *v22 == (void)v23;
        uint64_t v23 = v22;
      }
      while (!v24);
    }
    if (*(uint64_t **)gOALCaptureDeviceMap == v16) {
      *(void *)gOALCaptureDeviceMap = v22;
    }
    --*(void *)(v4 + 16);
    std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v5, v16);
    operator delete(v16);
  }
  while (*((_DWORD *)v12 + 30))
    usleep(0x2710u);
  OALCaptureDevice::~OALCaptureDevice(v12);
  MEMORY[0x223C843A0]();
  uint64_t v25 = gOALCaptureDeviceMap;
  if (*(void *)(gOALCaptureDeviceMap + 16))
  {
    ALCenum v13 = 0;
    LOBYTE(v12) = 1;
    if (v3) {
LABEL_18:
    }
      (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  else
  {
    std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::destroy(gOALCaptureDeviceMap, *(void **)(gOALCaptureDeviceMap + 8));
    MEMORY[0x223C843A0](v25, 0x1020C4062D53EE8);
    ALCenum v13 = 0;
    gOALCaptureDeviceMap = 0;
    LOBYTE(v12) = 1;
    if (v3) {
      goto LABEL_18;
    }
  }
LABEL_19:
  if (v12)
  {
    LOBYTE(v14) = 1;
    return v14;
  }
LABEL_22:
  BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    String = alcGetString(0, v13);
    *(_DWORD *)uint64_t v27 = 136315650;
    *(void *)&v27[4] = "oalImp.cpp";
    __int16 v28 = 1024;
    int v29 = 585;
    __int16 v30 = 2080;
    uint64_t v31 = String;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcCaptureCloseDevice FAILED = %s", v27, 0x1Cu);
    LOBYTE(v14) = 0;
  }
  return v14;
}

void sub_22153BD98(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_22153BDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void alcCaptureStart(ALCdevice *device)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315394;
    int v12 = "oalImp.cpp";
    __int16 v13 = 1024;
    int v14 = 599;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcCaptureStart", (uint8_t *)&v11, 0x12u);
  }
  if (!gOALCaptureDeviceMap) {
    goto LABEL_29;
  }
  uint64_t v2 = gCaptureDeviceMapLock;
  int v3 = (*(uint64_t (**)(uint64_t))(*(void *)gCaptureDeviceMapLock + 16))(gCaptureDeviceMapLock);
  uint64_t v4 = *(void **)(gOALCaptureDeviceMap + 8);
  if (!v4) {
    goto LABEL_15;
  }
  uint64_t v5 = gOALCaptureDeviceMap + 8;
  do
  {
    unint64_t v6 = v4[4];
    BOOL v7 = v6 >= (unint64_t)device;
    if (v6 >= (unint64_t)device) {
      BOOL v8 = v4;
    }
    else {
      BOOL v8 = v4 + 1;
    }
    if (v7) {
      uint64_t v5 = (uint64_t)v4;
    }
    uint64_t v4 = (void *)*v8;
  }
  while (*v8);
  if (v5 != gOALCaptureDeviceMap + 8 && *(void *)(v5 + 32) <= (unint64_t)device)
  {
    uint64_t v9 = *(void *)(v5 + 40);
    if (v9) {
      atomic_fetch_add((atomic_uint *volatile)(v9 + 120), 1u);
    }
  }
  else
  {
LABEL_15:
    uint64_t v9 = 0;
  }
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  if (v9)
  {
    OALCaptureDevice::StartCapture((AudioUnit *)v9);
    atomic_fetch_add((atomic_uint *volatile)(v9 + 120), 0xFFFFFFFF);
  }
  else
  {
LABEL_29:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      String = alcGetString(0, 40964);
      int v11 = 136315650;
      int v12 = "oalImp.cpp";
      __int16 v13 = 1024;
      int v14 = 611;
      __int16 v15 = 2080;
      int v16 = String;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcCaptureStart FAILED = %s", (uint8_t *)&v11, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey)) {
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    }
  }
}

void sub_22153C01C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alcCaptureStop(ALCdevice *device)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315394;
    int v12 = "oalImp.cpp";
    __int16 v13 = 1024;
    int v14 = 622;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcCaptureStop", (uint8_t *)&v11, 0x12u);
  }
  if (!gOALCaptureDeviceMap) {
    goto LABEL_29;
  }
  uint64_t v2 = gCaptureDeviceMapLock;
  int v3 = (*(uint64_t (**)(uint64_t))(*(void *)gCaptureDeviceMapLock + 16))(gCaptureDeviceMapLock);
  uint64_t v4 = *(void **)(gOALCaptureDeviceMap + 8);
  if (!v4) {
    goto LABEL_15;
  }
  uint64_t v5 = gOALCaptureDeviceMap + 8;
  do
  {
    unint64_t v6 = v4[4];
    BOOL v7 = v6 >= (unint64_t)device;
    if (v6 >= (unint64_t)device) {
      BOOL v8 = v4;
    }
    else {
      BOOL v8 = v4 + 1;
    }
    if (v7) {
      uint64_t v5 = (uint64_t)v4;
    }
    uint64_t v4 = (void *)*v8;
  }
  while (*v8);
  if (v5 != gOALCaptureDeviceMap + 8 && *(void *)(v5 + 32) <= (unint64_t)device)
  {
    uint64_t v9 = *(void *)(v5 + 40);
    if (v9) {
      atomic_fetch_add((atomic_uint *volatile)(v9 + 120), 1u);
    }
  }
  else
  {
LABEL_15:
    uint64_t v9 = 0;
  }
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  if (v9)
  {
    OALCaptureDevice::StopCapture((AudioUnit *)v9);
    atomic_fetch_add((atomic_uint *volatile)(v9 + 120), 0xFFFFFFFF);
  }
  else
  {
LABEL_29:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      String = alcGetString(0, 40964);
      int v11 = 136315650;
      int v12 = "oalImp.cpp";
      __int16 v13 = 1024;
      int v14 = 634;
      __int16 v15 = 2080;
      int v16 = String;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcCaptureStop FAILED = %s", (uint8_t *)&v11, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey)) {
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    }
  }
}

void sub_22153C27C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alcCaptureSamples(ALCdevice *device, ALCvoid *buffer, ALCsizei samples)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!gOALCaptureDeviceMap) {
    goto LABEL_27;
  }
  uint64_t v6 = gCaptureDeviceMapLock;
  int v7 = (*(uint64_t (**)(uint64_t))(*(void *)gCaptureDeviceMapLock + 16))(gCaptureDeviceMapLock);
  BOOL v10 = *(void **)(gOALCaptureDeviceMap + 8);
  if (!v10) {
    goto LABEL_13;
  }
  uint64_t v11 = gOALCaptureDeviceMap + 8;
  do
  {
    unint64_t v12 = v10[4];
    BOOL v13 = v12 >= (unint64_t)device;
    if (v12 >= (unint64_t)device) {
      int v14 = v10;
    }
    else {
      int v14 = v10 + 1;
    }
    if (v13) {
      uint64_t v11 = (uint64_t)v10;
    }
    BOOL v10 = (void *)*v14;
  }
  while (*v14);
  if (v11 != gOALCaptureDeviceMap + 8 && *(void *)(v11 + 32) <= (unint64_t)device)
  {
    __int16 v15 = *(atomic_uint **)(v11 + 40);
    if (v15) {
      atomic_fetch_add(v15 + 30, 1u);
    }
  }
  else
  {
LABEL_13:
    __int16 v15 = 0;
  }
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v6 + 24))(v6);
  }
  if (v15)
  {
    OALCaptureDevice::GetFrames((OALCaptureDevice *)v15, samples, (unsigned __int8 *)buffer, v8, v9);
    atomic_fetch_add(v15 + 30, 0xFFFFFFFF);
  }
  else
  {
LABEL_27:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 136315650;
      uint64_t v17 = "oalImp.cpp";
      __int16 v18 = 1024;
      int v19 = 657;
      __int16 v20 = 2080;
      String = alcGetString(0, 40964);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcCaptureSamples FAILED = %s\n", (uint8_t *)&v16, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey)) {
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    }
  }
}

void sub_22153C490(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

ALCdevice *__cdecl alcOpenDevice(const ALCchar *devicename)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    buf[0] = 136315394;
    *(void *)&buf[1] = "oalImp.cpp";
    __int16 v3 = 1024;
    int v4 = 674;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOpenDevice", (uint8_t *)buf, 0x12u);
  }
  pthread_mutex_lock(&stru_267F54248);
  if (!gOALDeviceMap) {
    operator new();
  }
  pthread_mutex_unlock(&stru_267F54248);
  if (!*(void *)(gOALDeviceMap + 16))
  {
    ++_MergedGlobals;
    operator new();
  }
  return 0;
}

void sub_22153C7A8(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

ALCBOOLean alcCloseDevice(ALCdevice *device)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)BOOL v24 = 136315394;
    *(void *)&v24[4] = "oalImp.cpp";
    __int16 v25 = 1024;
    int v26 = 712;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcCloseDevice", v24, 0x12u);
  }
  if (!gOALDeviceMap) {
    goto LABEL_30;
  }
  uint64_t v2 = *(void **)(gOALDeviceMap + 8);
  if (!v2) {
    goto LABEL_30;
  }
  uint64_t v3 = gOALDeviceMap + 8;
  do
  {
    unint64_t v4 = v2[4];
    BOOL v5 = v4 >= (unint64_t)device;
    if (v4 >= (unint64_t)device) {
      uint64_t v6 = v2;
    }
    else {
      uint64_t v6 = v2 + 1;
    }
    if (v5) {
      uint64_t v3 = (uint64_t)v2;
    }
    uint64_t v2 = (void *)*v6;
  }
  while (*v6);
  if (v3 != gOALDeviceMap + 8
    && *(void *)(v3 + 32) <= (unint64_t)device
    && (int v7 = *(OALDevice **)(v3 + 40)) != 0)
  {
    uint64_t v8 = gDeviceMapLock;
    *(void *)BOOL v24 = gDeviceMapLock;
    int v9 = (*(uint64_t (**)(uint64_t))(*(void *)gDeviceMapLock + 16))(gDeviceMapLock);
    v24[8] = v9;
    uint64_t v10 = gOALDeviceMap;
    uint64_t v11 = *(uint64_t **)(gOALDeviceMap + 8);
    if (v11)
    {
      unint64_t v12 = (uint64_t *)(gOALDeviceMap + 8);
      BOOL v13 = *(void **)(gOALDeviceMap + 8);
      do
      {
        unint64_t v14 = v13[4];
        BOOL v15 = v14 >= (unint64_t)device;
        if (v14 >= (unint64_t)device) {
          int v16 = v13;
        }
        else {
          int v16 = v13 + 1;
        }
        if (v15) {
          unint64_t v12 = v13;
        }
        BOOL v13 = (void *)*v16;
      }
      while (*v16);
      if (v12 != (uint64_t *)(gOALDeviceMap + 8) && v12[4] <= (unint64_t)device)
      {
        uint64_t v17 = (uint64_t *)v12[1];
        if (v17)
        {
          do
          {
            __int16 v18 = v17;
            uint64_t v17 = (uint64_t *)*v17;
          }
          while (v17);
        }
        else
        {
          uint64_t v22 = v12;
          do
          {
            __int16 v18 = (uint64_t *)v22[2];
            BOOL v23 = *v18 == (void)v22;
            uint64_t v22 = v18;
          }
          while (!v23);
        }
        if (*(uint64_t **)gOALDeviceMap == v12) {
          *(void *)gOALDeviceMap = v18;
        }
        --*(void *)(v10 + 16);
        std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v11, v12);
        operator delete(v12);
      }
    }
    ALCenum v19 = DeleteContextsOfThisDevice((uint64_t)device);
    if (!v19)
    {
      OALDevice::~OALDevice(v7);
      MEMORY[0x223C843A0]();
    }
    if (v9) {
      (*(void (**)(uint64_t))(*(void *)v8 + 24))(v8);
    }
    if (!v19) {
      return 1;
    }
  }
  else
  {
LABEL_30:
    ALCenum v19 = 40963;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    String = alcGetString(0, v19);
    *(_DWORD *)BOOL v24 = 136315650;
    *(void *)&v24[4] = "oalImp.cpp";
    __int16 v25 = 1024;
    int v26 = 738;
    __int16 v27 = 2080;
    __int16 v28 = String;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcCloseDevice FAILED = %s\n", v24, 0x1Cu);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALCErrorKey)) {
    pthread_setspecific(gALCErrorKey, (const void *)v19);
  }
  return 0;
}

void sub_22153CB50(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

ALCenum alcGetError(ALCdevice *device)
{
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  uint64_t v1 = pthread_getspecific(gALCErrorKey);
  if (v1) {
    pthread_setspecific(gALCErrorKey, 0);
  }
  return (int)v1;
}

ALCcontext *__cdecl alcCreateContext(ALCdevice *device, const ALCint *attrlist)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    buf[0] = 136315650;
    *(void *)&buf[1] = "oalImp.cpp";
    __int16 v17 = 1024;
    int v18 = 787;
    __int16 v19 = 2048;
    __int16 v20 = device;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcCreateContext--> device = %ld", (uint8_t *)buf, 0x1Cu);
  }
  pthread_mutex_lock(&stru_267F54288);
  if (!gOALContextMap) {
    operator new();
  }
  pthread_mutex_unlock(&stru_267F54288);
  ++_MergedGlobals;
  if (attrlist)
  {
    unint64_t v4 = attrlist + 1;
    ALCint v5 = *attrlist;
    if (*attrlist != 4112) {
      goto LABEL_8;
    }
    while (1)
    {
      do
      {
LABEL_7:
        v4 += 2;
        ALCint v5 = *(v4 - 1);
      }
      while (v5 == 4112);
      do
      {
LABEL_8:
        while (v5 == 4113)
        {
          v4 += 2;
          ALCint v5 = *(v4 - 1);
          if (v5 == 4112) {
            goto LABEL_7;
          }
        }
        if (!v5) {
          goto LABEL_14;
        }
        v4 += 2;
        ALCint v5 = *(v4 - 1);
      }
      while (v5 != 4112);
    }
  }
LABEL_14:
  if (gOALDeviceMap)
  {
    uint64_t v6 = gDeviceMapLock;
    int v7 = (*(uint64_t (**)(uint64_t))(*(void *)gDeviceMapLock + 16))(gDeviceMapLock);
    uint64_t v8 = *(void **)(gOALDeviceMap + 8);
    if (!v8) {
      goto LABEL_26;
    }
    uint64_t v9 = gOALDeviceMap + 8;
    do
    {
      unint64_t v10 = v8[4];
      BOOL v11 = v10 >= (unint64_t)device;
      if (v10 >= (unint64_t)device) {
        unint64_t v12 = v8;
      }
      else {
        unint64_t v12 = v8 + 1;
      }
      if (v11) {
        uint64_t v9 = (uint64_t)v8;
      }
      uint64_t v8 = (void *)*v12;
    }
    while (*v12);
    if (v9 != gOALDeviceMap + 8 && *(void *)(v9 + 32) <= (unint64_t)device)
    {
      uint64_t v13 = *(void *)(v9 + 40);
      if (v13) {
        atomic_fetch_add((atomic_uint *volatile)(v13 + 76), 1u);
      }
    }
    else
    {
LABEL_26:
      uint64_t v13 = 0;
    }
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v6 + 24))(v6);
    }
    if (v13) {
      operator new();
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    String = alcGetString(0, 40964);
    buf[0] = 136315650;
    *(void *)&buf[1] = "oalImp.cpp";
    __int16 v17 = 1024;
    int v18 = 828;
    __int16 v19 = 2080;
    __int16 v20 = (ALCdevice *)String;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcCreateContext FAILED = %s\n", (uint8_t *)buf, 0x1Cu);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALCErrorKey)) {
    pthread_setspecific(gALCErrorKey, (const void *)0xA004);
  }
  return 0;
}

void sub_22153D074(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void alcProcessContext(ALCcontext *context)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v2 = 136315650;
    uint64_t v3 = "oalImp.cpp";
    __int16 v4 = 1024;
    int v5 = 906;
    __int16 v6 = 2048;
    int v7 = context;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcProcessContext--> context = %ld", (uint8_t *)&v2, 0x1Cu);
  }
}

ALCcontext *alcGetCurrentContext(void)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v1 = 136315394;
    int v2 = "oalImp.cpp";
    __int16 v3 = 1024;
    int v4 = 914;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcGetCurrentContext", (uint8_t *)&v1, 0x12u);
  }
  return (ALCcontext *)gCurrentContext;
}

ALCdevice *__cdecl alcGetContextsDevice(ALCcontext *context)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315650;
    uint64_t v13 = "oalImp.cpp";
    __int16 v14 = 1024;
    int v15 = 923;
    __int16 v16 = 2048;
    __int16 v17 = context;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcGetContextsDevice--> context = %ld", (uint8_t *)&v12, 0x1Cu);
  }
  if (gOALContextMap)
  {
    uint64_t v2 = gContextMapLock;
    int v3 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
    int v4 = *(void **)(gOALContextMap + 8);
    if (v4)
    {
      uint64_t v5 = gOALContextMap + 8;
      do
      {
        unint64_t v6 = v4[4];
        BOOL v7 = v6 >= (unint64_t)context;
        if (v6 >= (unint64_t)context) {
          uint64_t v8 = v4;
        }
        else {
          uint64_t v8 = v4 + 1;
        }
        if (v7) {
          uint64_t v5 = (uint64_t)v4;
        }
        int v4 = (void *)*v8;
      }
      while (*v8);
      if (v5 != gOALContextMap + 8 && *(void *)(v5 + 32) <= (unint64_t)context)
      {
        uint64_t v9 = *(void *)(v5 + 40);
        if (v9)
        {
          unint64_t v10 = **(ALCdevice ***)(v9 + 16);
          if (!v3) {
            return v10;
          }
          goto LABEL_19;
        }
      }
    }
    unint64_t v10 = 0;
    if (v3) {
LABEL_19:
    }
      (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315394;
      uint64_t v13 = "oalImp.cpp";
      __int16 v14 = 1024;
      int v15 = 938;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcGetContextsDevice FAILED", (uint8_t *)&v12, 0x12u);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey)) {
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    }
    return 0;
  }
  return v10;
}

void sub_22153D4A0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alcSuspendContext(ALCcontext *context)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v2 = 136315650;
    int v3 = "oalImp.cpp";
    __int16 v4 = 1024;
    int v5 = 946;
    __int16 v6 = 2048;
    BOOL v7 = context;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcSuspendContext--> context = %ld", (uint8_t *)&v2, 0x1Cu);
  }
}

void alcDestroyContext(ALCcontext *context)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v44 = 136315650;
    v45 = "oalImp.cpp";
    __int16 v46 = 1024;
    int v47 = 954;
    __int16 v48 = 2048;
    v49 = context;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcDestroyContext--> context = %ld", (uint8_t *)&v44, 0x1Cu);
  }
  BOOL v2 = (ALCcontext *)gCurrentContext == context || gOALContextMap == 0;
  if (v2)
  {
    unsigned int v3 = 40964;
    goto LABEL_58;
  }
  uint64_t v4 = gContextMapLock;
  int v5 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  int v6 = v5;
  uint64_t v7 = gOALContextMap;
  uint64_t v9 = gOALContextMap + 8;
  uint64_t v8 = *(uint64_t **)(gOALContextMap + 8);
  if (!v8)
  {
    __int16 v16 = 0;
    int v17 = 0;
    BOOL v18 = 1;
    unsigned int v3 = 40962;
    if (!v6) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  unint64_t v10 = (uint64_t *)(gOALContextMap + 8);
  uint64_t v11 = gOALContextMap + 8;
  int v12 = *(void **)(gOALContextMap + 8);
  do
  {
    unint64_t v13 = v12[4];
    BOOL v14 = v13 >= (unint64_t)context;
    if (v13 >= (unint64_t)context) {
      int v15 = v12;
    }
    else {
      int v15 = v12 + 1;
    }
    if (v14) {
      uint64_t v11 = (uint64_t)v12;
    }
    int v12 = (void *)*v15;
  }
  while (*v15);
  if (v11 == v9 || *(void *)(v11 + 32) > (unint64_t)context) {
    __int16 v16 = 0;
  }
  else {
    __int16 v16 = *(OALContext **)(v11 + 40);
  }
  __int16 v19 = *(void **)(gOALContextMap + 8);
  do
  {
    unint64_t v20 = v19[4];
    BOOL v21 = v20 >= (unint64_t)context;
    if (v20 >= (unint64_t)context) {
      uint64_t v22 = v19;
    }
    else {
      uint64_t v22 = v19 + 1;
    }
    if (v21) {
      unint64_t v10 = v19;
    }
    __int16 v19 = (void *)*v22;
  }
  while (*v22);
  if (v10 == (uint64_t *)v9 || v10[4] > (unint64_t)context)
  {
    int v17 = 0;
    BOOL v18 = 1;
    unsigned int v3 = 40962;
    if (!v6) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  v33 = (uint64_t *)v10[1];
  if (v33)
  {
    do
    {
      __int16 v34 = v33;
      v33 = (uint64_t *)*v33;
    }
    while (v33);
  }
  else
  {
    int v35 = v10;
    do
    {
      __int16 v34 = (uint64_t *)v35[2];
      BOOL v2 = *v34 == (void)v35;
      int v35 = v34;
    }
    while (!v2);
  }
  if (*(uint64_t **)gOALContextMap == v10) {
    *(void *)gOALContextMap = v34;
  }
  --*(void *)(v7 + 16);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v8, v10);
  operator delete(v10);
  unint64_t v36 = *(unsigned int *)(gOALContextMap + 16);
  if (!*(_DWORD *)(gOALContextMap + 16))
  {
    unsigned int v3 = 0;
    BOOL v18 = 1;
    int v17 = 1;
    if (!v6) {
      goto LABEL_36;
    }
LABEL_35:
    (*(void (**)(uint64_t))(*(void *)v4 + 24))(v4);
    goto LABEL_36;
  }
  uint64_t v37 = 0;
  BOOL v18 = 0;
  do
  {
    uint64_t v38 = *(void **)gOALContextMap;
    if (v37)
    {
      uint64_t v39 = v37;
      v40 = *(void **)gOALContextMap;
      do
      {
        v42 = (void *)v40[1];
        if (v42)
        {
          do
          {
            uint64_t v38 = v42;
            v42 = (void *)*v42;
          }
          while (v42);
        }
        else
        {
          do
          {
            uint64_t v38 = (void *)v40[2];
            BOOL v2 = *v38 == (void)v40;
            v40 = v38;
          }
          while (!v2);
        }
        v40 = v38;
      }
      while (v39-- > 1);
    }
    if (v38 != (void *)(gOALContextMap + 8))
    {
      uint64_t v43 = v38[5];
      if (v43)
      {
        if (**(void **)(v43 + 16) == **((void **)v16 + 2)) {
          break;
        }
      }
    }
    BOOL v18 = ++v37 >= v36;
  }
  while (v37 != v36);
  unsigned int v3 = 0;
  int v17 = 1;
  if (v6) {
    goto LABEL_35;
  }
LABEL_36:
  if (v17)
  {
    if (v18)
    {
      if (!gOALDeviceMap)
      {
LABEL_56:
        OALContext::~OALContext(v16);
        MEMORY[0x223C843A0]();
        return;
      }
      unint64_t v23 = **((void **)v16 + 2);
      uint64_t v24 = gDeviceMapLock;
      int v25 = (*(uint64_t (**)(uint64_t))(*(void *)gDeviceMapLock + 16))(gDeviceMapLock);
      int v26 = *(void **)(gOALDeviceMap + 8);
      if (!v26) {
        goto LABEL_50;
      }
      uint64_t v27 = gOALDeviceMap + 8;
      do
      {
        unint64_t v28 = v26[4];
        BOOL v29 = v28 >= v23;
        if (v28 >= v23) {
          __int16 v30 = v26;
        }
        else {
          __int16 v30 = v26 + 1;
        }
        if (v29) {
          uint64_t v27 = (uint64_t)v26;
        }
        int v26 = (void *)*v30;
      }
      while (*v30);
      if (v27 != gOALDeviceMap + 8 && *(void *)(v27 + 32) <= v23)
      {
        uint64_t v31 = *(void *)(v27 + 40);
        if (v31) {
          atomic_fetch_add((atomic_uint *volatile)(v31 + 76), 1u);
        }
      }
      else
      {
LABEL_50:
        uint64_t v31 = 0;
      }
      if (v25) {
        (*(void (**)(uint64_t))(*(void *)v24 + 24))(v24);
      }
      if (v31)
      {
        OALDevice::StopGraph((AUGraph *)v31);
        atomic_fetch_add((atomic_uint *volatile)(v31 + 76), 0xFFFFFFFF);
      }
    }
    if (!v16) {
      return;
    }
    goto LABEL_56;
  }
LABEL_58:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    String = alcGetString(0, v3);
    int v44 = 136315650;
    v45 = "oalImp.cpp";
    __int16 v46 = 1024;
    int v47 = 1004;
    __int16 v48 = 2080;
    v49 = (ALCcontext *)String;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcDestroyContext FAILED = %s\n", (uint8_t *)&v44, 0x1Cu);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALCErrorKey)) {
    pthread_setspecific(gALCErrorKey, (const void *)v3);
  }
}

void sub_22153DA60(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

const char *GetALCAttributeString(int a1)
{
  if (a1 > 4100)
  {
    switch(a1)
    {
      case 40961:
        uint64_t result = "ALC_INVALID_DEVICE";
        break;
      case 40962:
        uint64_t result = "ALC_INVALID_CONTEXT";
        break;
      case 40963:
        uint64_t result = "ALC_INVALID_ENUM";
        break;
      case 40964:
        uint64_t result = "ALC_INVALID_VALUE";
        break;
      default:
        if (a1 == 4102)
        {
          uint64_t result = "ALC_EXTENSIONS";
        }
        else
        {
          if (a1 != 4101) {
            return "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
          }
          uint64_t result = "ALC_DEVICE_SPECIFIER";
        }
        break;
    }
  }
  else
  {
    if (a1 > 784)
    {
      if (a1 == 785) {
        return "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
      }
      if (a1 == 4100) {
        return "ALC_DEFAULT_DEVICE_SPECIFIER";
      }
    }
    else
    {
      if (!a1) {
        return "ALC_NO_ERROR";
      }
      if (a1 == 784) {
        return "ALC_CAPTURE_DEVICE_SPECIFIER";
      }
    }
    return "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
  }
  return result;
}

ALCBOOLean alcIsExtensionPresent(ALCdevice *device, const ALCchar *extname)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315650;
    unint64_t v13 = "oalImp.cpp";
    __int16 v14 = 1024;
    int v15 = 1106;
    __int16 v16 = 2080;
    int v17 = extname;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcIsExtensionPresent-->  extension = %s", (uint8_t *)&v12, 0x1Cu);
  }
  if (extname)
  {
    size_t v3 = strlen(extname);
    uint64_t v4 = (char *)malloc_type_calloc(1uLL, v3 + 1, 0x100004077774924uLL);
    if (*extname)
    {
      size_t v5 = 0;
      unsigned int v6 = 1;
      do
      {
        v4[v5] = __toupper(extname[v5]);
        size_t v5 = v6++;
      }
      while (strlen(extname) > v5);
    }
    uint64_t v7 = (char *)alcExtensions;
    if (!alcExtensions)
    {
      uint64_t v8 = (char *)malloc_type_malloc(0x34uLL, 0x607E9530uLL);
      alcExtensions = (uint64_t)v8;
      strcpy(v8, "ALC_EXT_CAPTURE ALC_ENUMERATION_EXT ALC_EXT_MAC_OSX");
      size_t v9 = strlen(v8);
      uint64_t v7 = (char *)malloc_type_realloc(v8, v9 + 37, 0xAB49D99FuLL);
      alcExtensions = (uint64_t)v7;
      strcat(v7, " ALC_EXT_ASA");
      strcat(v7, " ALC_EXT_OUTPUT_CAPTURER");
    }
    ALCBOOLean v10 = strstr(v7, v4) != 0;
    free(v4);
  }
  else
  {
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey)) {
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    }
    return 0;
  }
  return v10;
}

void *__cdecl alcGetProcAddress(ALCdevice *device, const ALCchar *funcname)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315650;
    size_t v5 = "oalImp.cpp";
    __int16 v6 = 1024;
    int v7 = 1135;
    __int16 v8 = 2080;
    size_t v9 = funcname;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcGetProcAddress--> function name = %s", (uint8_t *)&v4, 0x1Cu);
  }
  return alGetProcAddress(funcname);
}

void *__cdecl alGetProcAddress(const ALchar *fname)
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v121 = 136315650;
    v122 = "oalImp.cpp";
    __int16 v123 = 1024;
    int v124 = 3778;
    __int16 v125 = 2080;
    v126 = fname;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetProcAddress function name = %s", (uint8_t *)&v121, 0x1Cu);
  }
  if (!fname)
  {
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey)) {
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    }
    return 0;
  }
  int v2 = strcmp("alcOpenDevice", fname);
  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcOpenDevice;
  if (v2)
  {
    int v4 = strcmp("alcCloseDevice", fname);
    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcCloseDevice;
    if (v4)
    {
      int v5 = strcmp("alcGetError", fname);
      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcGetError;
      if (v5)
      {
        int v6 = strcmp("alcCreateContext", fname);
        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcCreateContext;
        if (v6)
        {
          int v7 = strcmp("alcMakeContextCurrent", fname);
          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcMakeContextCurrent;
          if (v7)
          {
            int v8 = strcmp("alcProcessContext", fname);
            size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcProcessContext;
            if (v8)
            {
              int v9 = strcmp("alcGetCurrentContext", fname);
              size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcGetCurrentContext;
              if (v9)
              {
                int v10 = strcmp("alcGetContextsDevice", fname);
                size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcGetContextsDevice;
                if (v10)
                {
                  int v11 = strcmp("alcSuspendContext", fname);
                  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcSuspendContext;
                  if (v11)
                  {
                    int v12 = strcmp("alcDestroyContext", fname);
                    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcDestroyContext;
                    if (v12)
                    {
                      int v13 = strcmp("alcGetString", fname);
                      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcGetString;
                      if (v13)
                      {
                        int v14 = strcmp("alcIsExtensionPresent", fname);
                        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcIsExtensionPresent;
                        if (v14)
                        {
                          int v15 = strcmp("alcGetProcAddress", fname);
                          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcGetProcAddress;
                          if (v15)
                          {
                            int v16 = strcmp("alcGetEnumValue", fname);
                            size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcGetEnumValue;
                            if (v16)
                            {
                              int v17 = strcmp("alcGetInteger", fname);
                              size_t v3 = alcGetInteger;
                              if (v17)
                              {
                                int v18 = strcmp("alcGetIntegerv", fname);
                                size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcGetIntegerv;
                                if (v18)
                                {
                                  int v19 = strcmp("alGetError", fname);
                                  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetError;
                                  if (v19)
                                  {
                                    int v20 = strcmp("alGenBuffers", fname);
                                    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGenBuffers;
                                    if (v20)
                                    {
                                      int v21 = strcmp("alDeleteBuffers", fname);
                                      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alDeleteBuffers;
                                      if (v21)
                                      {
                                        int v22 = strcmp("alIsBuffer", fname);
                                        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alIsBuffer;
                                        if (v22)
                                        {
                                          int v23 = strcmp("alBufferData", fname);
                                          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alBufferData;
                                          if (v23)
                                          {
                                            int v24 = strcmp("alBufferf", fname);
                                            size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alBufferf;
                                            if (v24)
                                            {
                                              int v25 = strcmp("alBuffer3f", fname);
                                              size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alBuffer3f;
                                              if (v25)
                                              {
                                                int v26 = strcmp("alBufferfv", fname);
                                                size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alBufferfv;
                                                if (v26)
                                                {
                                                  int v27 = strcmp("alBufferi", fname);
                                                  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alBufferi;
                                                  if (v27)
                                                  {
                                                    int v28 = strcmp("alBuffer3i", fname);
                                                    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alBuffer3i;
                                                    if (v28)
                                                    {
                                                      int v29 = strcmp("alBufferiv", fname);
                                                      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alBufferiv;
                                                      if (v29)
                                                      {
                                                        int v30 = strcmp("alGetBufferf", fname);
                                                        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetBufferf;
                                                        if (v30)
                                                        {
                                                          int v31 = strcmp("alGetBuffer3f", fname);
                                                          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetBuffer3f;
                                                          if (v31)
                                                          {
                                                            int v32 = strcmp("alGetBufferfv", fname);
                                                            size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetBufferfv;
                                                            if (v32)
                                                            {
                                                              int v33 = strcmp("alGetBufferi", fname);
                                                              size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetBufferi;
                                                              if (v33)
                                                              {
                                                                int v34 = strcmp("alGetBuffer3i", fname);
                                                                size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetBuffer3i;
                                                                if (v34)
                                                                {
                                                                  int v35 = strcmp("alGetBufferiv", fname);
                                                                  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetBufferiv;
                                                                  if (v35)
                                                                  {
                                                                    int v36 = strcmp("alGenSources", fname);
                                                                    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGenSources;
                                                                    if (v36)
                                                                    {
                                                                      int v37 = strcmp("alDeleteSources", fname);
                                                                      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alDeleteSources;
                                                                      if (v37)
                                                                      {
                                                                        int v38 = strcmp("alIsSource", fname);
                                                                        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alIsSource;
                                                                        if (v38)
                                                                        {
                                                                          int v39 = strcmp("alSourcef", fname);
                                                                          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourcef;
                                                                          if (v39)
                                                                          {
                                                                            int v40 = strcmp("alSourcefv", fname);
                                                                            size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourcefv;
                                                                            if (v40)
                                                                            {
                                                                              int v41 = strcmp("alSource3f", fname);
                                                                              size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSource3f;
                                                                              if (v41)
                                                                              {
                                                                                int v42 = strcmp("alSourcei", fname);
                                                                                size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourcei;
                                                                                if (v42)
                                                                                {
                                                                                  int v43 = strcmp("alSourceiv", fname);
                                                                                  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourceiv;
                                                                                  if (v43)
                                                                                  {
                                                                                    int v44 = strcmp("alSource3i", fname);
                                                                                    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSource3i;
                                                                                    if (v44)
                                                                                    {
                                                                                      int v45 = strcmp("alGetSourcef", fname);
                                                                                      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetSourcef;
                                                                                      if (v45)
                                                                                      {
                                                                                        int v46 = strcmp("alGetSourcefv", fname);
                                                                                        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetSourcefv;
                                                                                        if (v46)
                                                                                        {
                                                                                          int v47 = strcmp("alGetSource3f", fname);
                                                                                          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetSource3f;
                                                                                          if (v47)
                                                                                          {
                                                                                            int v48 = strcmp("alGetSourcei", fname);
                                                                                            size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetSourcei;
                                                                                            if (v48)
                                                                                            {
                                                                                              int v49 = strcmp("alGetSourceiv", fname);
                                                                                              size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetSourceiv;
                                                                                              if (v49)
                                                                                              {
                                                                                                int v50 = strcmp("alGetSource3i", fname);
                                                                                                size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetSource3i;
                                                                                                if (v50)
                                                                                                {
                                                                                                  int v51 = strcmp("alSourcePlay", fname);
                                                                                                  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourcePlay;
                                                                                                  if (v51)
                                                                                                  {
                                                                                                    int v52 = strcmp("alSourcePause", fname);
                                                                                                    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourcePause;
                                                                                                    if (v52)
                                                                                                    {
                                                                                                      int v53 = strcmp("alSourceStop", fname);
                                                                                                      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourceStop;
                                                                                                      if (v53)
                                                                                                      {
                                                                                                        int v54 = strcmp("alSourceRewind", fname);
                                                                                                        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourceRewind;
                                                                                                        if (v54)
                                                                                                        {
                                                                                                          int v55 = strcmp("alSourcePlayv", fname);
                                                                                                          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourcePlayv;
                                                                                                          if (v55)
                                                                                                          {
                                                                                                            int v56 = strcmp("alSourcePausev", fname);
                                                                                                            size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourcePausev;
                                                                                                            if (v56)
                                                                                                            {
                                                                                                              int v57 = strcmp("alSourceStopv", fname);
                                                                                                              size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourceStopv;
                                                                                                              if (v57)
                                                                                                              {
                                                                                                                int v58 = strcmp("alSourceRewindv", fname);
                                                                                                                size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourceRewindv;
                                                                                                                if (v58)
                                                                                                                {
                                                                                                                  int v59 = strcmp("alSourceQueueBuffers", fname);
                                                                                                                  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourceQueueBuffers;
                                                                                                                  if (v59)
                                                                                                                  {
                                                                                                                    int v60 = strcmp("alSourceUnqueueBuffers", fname);
                                                                                                                    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourceUnqueueBuffers;
                                                                                                                    if (v60)
                                                                                                                    {
                                                                                                                      int v61 = strcmp("alListenerf", fname);
                                                                                                                      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alListenerf;
                                                                                                                      if (v61)
                                                                                                                      {
                                                                                                                        int v62 = strcmp("alListenerfv", fname);
                                                                                                                        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alListenerfv;
                                                                                                                        if (v62)
                                                                                                                        {
                                                                                                                          int v63 = strcmp("alListener3f", fname);
                                                                                                                          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alListener3f;
                                                                                                                          if (v63)
                                                                                                                          {
                                                                                                                            int v64 = strcmp("alListeneri", fname);
                                                                                                                            size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alListeneri;
                                                                                                                            if (v64)
                                                                                                                            {
                                                                                                                              int v65 = strcmp("alListeneriv", fname);
                                                                                                                              size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alListeneriv;
                                                                                                                              if (v65)
                                                                                                                              {
                                                                                                                                int v66 = strcmp("alListener3i", fname);
                                                                                                                                size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alListener3i;
                                                                                                                                if (v66)
                                                                                                                                {
                                                                                                                                  int v67 = strcmp("alGetListenerf", fname);
                                                                                                                                  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetListenerf;
                                                                                                                                  if (v67)
                                                                                                                                  {
                                                                                                                                    int v68 = strcmp("alGetListenerfv", fname);
                                                                                                                                    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetListenerfv;
                                                                                                                                    if (v68)
                                                                                                                                    {
                                                                                                                                      int v69 = strcmp("alGetListener3f", fname);
                                                                                                                                      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetListener3f;
                                                                                                                                      if (v69)
                                                                                                                                      {
                                                                                                                                        int v70 = strcmp("alGetListeneri", fname);
                                                                                                                                        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetListeneri;
                                                                                                                                        if (v70)
                                                                                                                                        {
                                                                                                                                          int v71 = strcmp("alGetListeneriv", fname);
                                                                                                                                          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetListeneriv;
                                                                                                                                          if (v71)
                                                                                                                                          {
                                                                                                                                            int v72 = strcmp("alGetListener3i", fname);
                                                                                                                                            size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetListener3i;
                                                                                                                                            if (v72)
                                                                                                                                            {
                                                                                                                                              int v73 = strcmp("alDistanceModel", fname);
                                                                                                                                              size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alDistanceModel;
                                                                                                                                              if (v73)
                                                                                                                                              {
                                                                                                                                                int v74 = strcmp("alDopplerFactor", fname);
                                                                                                                                                size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alDopplerFactor;
                                                                                                                                                if (v74)
                                                                                                                                                {
                                                                                                                                                  int v75 = strcmp("alDopplerVelocity", fname);
                                                                                                                                                  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alDopplerVelocity;
                                                                                                                                                  if (v75)
                                                                                                                                                  {
                                                                                                                                                    int v76 = strcmp("alSpeedOfSound", fname);
                                                                                                                                                    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSpeedOfSound;
                                                                                                                                                    if (v76)
                                                                                                                                                    {
                                                                                                                                                      int v77 = strcmp("alGetString", fname);
                                                                                                                                                      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetString;
                                                                                                                                                      if (v77)
                                                                                                                                                      {
                                                                                                                                                        int v78 = strcmp("alGetEnumValue", fname);
                                                                                                                                                        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetEnumValue;
                                                                                                                                                        if (v78)
                                                                                                                                                        {
                                                                                                                                                          int v79 = strcmp("alGetBoolean", fname);
                                                                                                                                                          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetBoolean;
                                                                                                                                                          if (v79)
                                                                                                                                                          {
                                                                                                                                                            int v80 = strcmp("alGetBooleanv", fname);
                                                                                                                                                            size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetBooleanv;
                                                                                                                                                            if (v80)
                                                                                                                                                            {
                                                                                                                                                              int v81 = strcmp("alGetFloat", fname);
                                                                                                                                                              size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetFloat;
                                                                                                                                                              if (v81)
                                                                                                                                                              {
                                                                                                                                                                int v82 = strcmp("alGetFloatv", fname);
                                                                                                                                                                size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetFloatv;
                                                                                                                                                                if (v82)
                                                                                                                                                                {
                                                                                                                                                                  int v83 = strcmp("alGetDouble", fname);
                                                                                                                                                                  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetDouble;
                                                                                                                                                                  if (v83)
                                                                                                                                                                  {
                                                                                                                                                                    int v84 = strcmp("alGetDoublev", fname);
                                                                                                                                                                    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetDoublev;
                                                                                                                                                                    if (v84)
                                                                                                                                                                    {
                                                                                                                                                                      int v85 = strcmp("alGetInteger", fname);
                                                                                                                                                                      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetInteger;
                                                                                                                                                                      if (v85)
                                                                                                                                                                      {
                                                                                                                                                                        int v86 = strcmp("alGetIntegerv", fname);
                                                                                                                                                                        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetIntegerv;
                                                                                                                                                                        if (v86)
                                                                                                                                                                        {
                                                                                                                                                                          int v87 = strcmp("alGetProcAddress", fname);
                                                                                                                                                                          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alGetProcAddress;
                                                                                                                                                                          if (v87)
                                                                                                                                                                          {
                                                                                                                                                                            int v88 = strcmp("alIsExtensionPresent", fname);
                                                                                                                                                                            size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alIsExtensionPresent;
                                                                                                                                                                            if (v88)
                                                                                                                                                                            {
                                                                                                                                                                              int v89 = strcmp("alDisable", fname);
                                                                                                                                                                              size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alDisable;
                                                                                                                                                                              if (v89)
                                                                                                                                                                              {
                                                                                                                                                                                int v90 = strcmp("alEnable", fname);
                                                                                                                                                                                size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alEnable;
                                                                                                                                                                                if (v90)
                                                                                                                                                                                {
                                                                                                                                                                                  int v91 = strcmp("alIsEnabled", fname);
                                                                                                                                                                                  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alIsEnabled;
                                                                                                                                                                                  if (v91)
                                                                                                                                                                                  {
                                                                                                                                                                                    int v92 = strcmp("alcMacOSXRenderingQuality", fname);
                                                                                                                                                                                    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcMacOSXRenderingQuality;
                                                                                                                                                                                    if (v92)
                                                                                                                                                                                    {
                                                                                                                                                                                      int v93 = strcmp("alMacOSXRenderChannelCount", fname);
                                                                                                                                                                                      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alMacOSXRenderChannelCount;
                                                                                                                                                                                      if (v93)
                                                                                                                                                                                      {
                                                                                                                                                                                        int v94 = strcmp("alcMacOSXMixerMaxiumumBusses", fname);
                                                                                                                                                                                        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcMacOSXMixerMaxiumumBusses;
                                                                                                                                                                                        if (v94)
                                                                                                                                                                                        {
                                                                                                                                                                                          int v95 = strcmp("alcMacOSXMixerOutputRate", fname);
                                                                                                                                                                                          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcMacOSXMixerOutputRate;
                                                                                                                                                                                          if (v95)
                                                                                                                                                                                          {
                                                                                                                                                                                            int v96 = strcmp("alcMacOSXGetRenderingQuality", fname);
                                                                                                                                                                                            size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcMacOSXGetRenderingQuality;
                                                                                                                                                                                            if (v96)
                                                                                                                                                                                            {
                                                                                                                                                                                              int v97 = strcmp("alMacOSXGetRenderChannelCount", fname);
                                                                                                                                                                                              size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alMacOSXGetRenderChannelCount;
                                                                                                                                                                                              if (v97)
                                                                                                                                                                                              {
                                                                                                                                                                                                int v98 = strcmp("alcMacOSXGetMixerMaxiumumBusses", fname);
                                                                                                                                                                                                size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcMacOSXGetMixerMaxiumumBusses;
                                                                                                                                                                                                if (v98)
                                                                                                                                                                                                {
                                                                                                                                                                                                  int v99 = strcmp("alcMacOSXGetMixerOutputRate", fname);
                                                                                                                                                                                                  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcMacOSXGetMixerOutputRate;
                                                                                                                                                                                                  if (v99)
                                                                                                                                                                                                  {
                                                                                                                                                                                                    int v100 = strcmp("alcCaptureOpenDevice", fname);
                                                                                                                                                                                                    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcCaptureOpenDevice;
                                                                                                                                                                                                    if (v100)
                                                                                                                                                                                                    {
                                                                                                                                                                                                      int v101 = strcmp("alcCaptureCloseDevice", fname);
                                                                                                                                                                                                      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcCaptureCloseDevice;
                                                                                                                                                                                                      if (v101)
                                                                                                                                                                                                      {
                                                                                                                                                                                                        int v102 = strcmp("alcCaptureStart", fname);
                                                                                                                                                                                                        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcCaptureStart;
                                                                                                                                                                                                        if (v102)
                                                                                                                                                                                                        {
                                                                                                                                                                                                          int v103 = strcmp("alcCaptureStop", fname);
                                                                                                                                                                                                          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcCaptureStop;
                                                                                                                                                                                                          if (v103)
                                                                                                                                                                                                          {
                                                                                                                                                                                                            int v104 = strcmp("alcCaptureSamples", fname);
                                                                                                                                                                                                            size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcCaptureSamples;
                                                                                                                                                                                                            if (v104)
                                                                                                                                                                                                            {
                                                                                                                                                                                                              int v105 = strcmp("alBufferDataStatic", fname);
                                                                                                                                                                                                              size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alBufferDataStatic;
                                                                                                                                                                                                              if (v105)
                                                                                                                                                                                                              {
                                                                                                                                                                                                                int v106 = strcmp("alSourceSetRenderCallback", fname);
                                                                                                                                                                                                                size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourceSetRenderCallback;
                                                                                                                                                                                                                if (v106)
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  int v107 = strcmp("alSourceAddNotification", fname);
                                                                                                                                                                                                                  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourceAddNotification;
                                                                                                                                                                                                                  if (v107)
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    int v108 = strcmp("alSourceRemoveNotification", fname);
                                                                                                                                                                                                                    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourceRemoveNotification;
                                                                                                                                                                                                                    if (v108)
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      int v109 = strcmp("alcASASetListener", fname);
                                                                                                                                                                                                                      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcASASetListener;
                                                                                                                                                                                                                      if (v109)
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        int v110 = strcmp("alcASAGetListener", fname);
                                                                                                                                                                                                                        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcASAGetListener;
                                                                                                                                                                                                                        if (v110)
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          int v111 = strcmp("alcASASetSource", fname);
                                                                                                                                                                                                                          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcASASetSource;
                                                                                                                                                                                                                          if (v111)
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            int v112 = strcmp("alcASAGetSource", fname);
                                                                                                                                                                                                                            size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcASAGetSource;
                                                                                                                                                                                                                            if (v112)
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              int v113 = strcmp("alSourceRenderingQuality", fname);
                                                                                                                                                                                                                              size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourceRenderingQuality;
                                                                                                                                                                                                                              if (v113)
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                int v114 = strcmp("alSourceGetRenderingQuality", fname);
                                                                                                                                                                                                                                size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alSourceGetRenderingQuality;
                                                                                                                                                                                                                                if (v114)
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  int v115 = strcmp("alcOutputCapturerPrepare", fname);
                                                                                                                                                                                                                                  size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcOutputCapturerPrepare;
                                                                                                                                                                                                                                  if (v115)
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    int v116 = strcmp("alcOutputCapturerStart", fname);
                                                                                                                                                                                                                                    size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcOutputCapturerStart;
                                                                                                                                                                                                                                    if (v116)
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      int v117 = strcmp("alcOutputCapturerStop", fname);
                                                                                                                                                                                                                                      size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcOutputCapturerStop;
                                                                                                                                                                                                                                      if (v117)
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        int v118 = strcmp("alcOutputCapturerAvailableSamples", fname);
                                                                                                                                                                                                                                        size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcOutputCapturerAvailableSamples;
                                                                                                                                                                                                                                        if (v118)
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          int v119 = strcmp("alcOutputCapturerSamples", fname);
                                                                                                                                                                                                                                          size_t v3 = (uint64_t (*)(ALCdevice_struct *, int))alcOutputCapturerSamples;
                                                                                                                                                                                                                                          if (v119) {
                                                                                                                                                                                                                                            return 0;
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                }
                                                                                                                                                                                                              }
                                                                                                                                                                                                            }
                                                                                                                                                                                                          }
                                                                                                                                                                                                        }
                                                                                                                                                                                                      }
                                                                                                                                                                                                    }
                                                                                                                                                                                                  }
                                                                                                                                                                                                }
                                                                                                                                                                                              }
                                                                                                                                                                                            }
                                                                                                                                                                                          }
                                                                                                                                                                                        }
                                                                                                                                                                                      }
                                                                                                                                                                                    }
                                                                                                                                                                                  }
                                                                                                                                                                                }
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

ALCenum alcGetEnumValue(ALCdevice *device, const ALCchar *enumname)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315650;
    int v5 = "oalImp.cpp";
    __int16 v6 = 1024;
    int v7 = 1143;
    __int16 v8 = 2080;
    int v9 = enumname;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcGetEnumValue--> enum name = %s", (uint8_t *)&v4, 0x1Cu);
  }
  return alGetEnumValue(enumname);
}

ALenum alGetEnumValue(const ALchar *ename)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315650;
    int v4 = "oalImp.cpp";
    __int16 v5 = 1024;
    int v6 = 3433;
    __int16 v7 = 2080;
    __int16 v8 = ename;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetEnumValue: %s", (uint8_t *)&v3, 0x1Cu);
  }
  if (!strcmp("AL_INVALID", ename)) {
    return -1;
  }
  ALenum result = strcmp("AL_NONE", ename);
  if (result)
  {
    ALenum result = strcmp("AL_FALSE", ename);
    if (result)
    {
      if (!strcmp("AL_TRUE", ename)) {
        return 1;
      }
      if (!strcmp("AL_SOURCE_RELATIVE", ename)) {
        return 514;
      }
      if (!strcmp("AL_CONE_INNER_ANGLE", ename)) {
        return 4097;
      }
      if (!strcmp("AL_CONE_OUTER_ANGLE", ename)) {
        return 4098;
      }
      if (!strcmp("AL_CONE_OUTER_GAIN", ename)) {
        return 4130;
      }
      if (!strcmp("AL_PITCH", ename)) {
        return 4099;
      }
      if (!strcmp("AL_POSITION", ename)) {
        return 4100;
      }
      if (!strcmp("AL_DIRECTION", ename)) {
        return 4101;
      }
      if (!strcmp("AL_VELOCITY", ename)) {
        return 4102;
      }
      if (!strcmp("AL_LOOPING", ename)) {
        return 4103;
      }
      if (!strcmp("AL_BUFFER", ename)) {
        return 4105;
      }
      if (!strcmp("AL_GAIN", ename)) {
        return 4106;
      }
      if (!strcmp("AL_MIN_GAIN", ename)) {
        return 4109;
      }
      if (!strcmp("AL_MAX_GAIN", ename)) {
        return 4110;
      }
      if (!strcmp("AL_ORIENTATION", ename)) {
        return 4111;
      }
      if (!strcmp("AL_REFERENCE_DISTANCE", ename)) {
        return 4128;
      }
      if (!strcmp("AL_ROLLOFF_FACTOR", ename)) {
        return 4129;
      }
      if (!strcmp("AL_MAX_DISTANCE", ename)) {
        return 4131;
      }
      if (!strcmp("AL_SOURCE_STATE", ename)) {
        return 4112;
      }
      if (!strcmp("AL_INITIAL", ename)) {
        return 4113;
      }
      if (!strcmp("AL_PLAYING", ename)) {
        return 4114;
      }
      if (!strcmp("AL_PAUSED", ename)) {
        return 4115;
      }
      if (!strcmp("AL_STOPPED", ename)) {
        return 4116;
      }
      if (!strcmp("AL_BUFFERS_QUEUED", ename)) {
        return 4117;
      }
      if (!strcmp("AL_BUFFERS_PROCESSED", ename)) {
        return 4118;
      }
      if (!strcmp("AL_FORMAT_MONO8", ename)) {
        return 4352;
      }
      if (!strcmp("AL_FORMAT_MONO16", ename)) {
        return 4353;
      }
      if (!strcmp("AL_FORMAT_STEREO8", ename)) {
        return 4354;
      }
      if (!strcmp("AL_FORMAT_STEREO16", ename)) {
        return 4355;
      }
      if (!strcmp("AL_FREQUENCY", ename)) {
        return 8193;
      }
      if (!strcmp("AL_SIZE", ename)) {
        return 8196;
      }
      if (!strcmp("AL_UNUSED", ename)) {
        return 8208;
      }
      if (!strcmp("AL_PENDING", ename)) {
        return 8209;
      }
      if (!strcmp("AL_PROCESSED", ename)) {
        return 8210;
      }
      ALenum result = strcmp("AL_NO_ERROR", ename);
      if (result)
      {
        if (!strcmp("AL_INVALID_NAME", ename)) {
          return 40961;
        }
        if (!strcmp("AL_INVALID_ENUM", ename)) {
          return 40962;
        }
        if (!strcmp("AL_INVALID_VALUE", ename)) {
          return 40963;
        }
        if (!strcmp("AL_INVALID_OPERATION", ename)) {
          return 40964;
        }
        if (!strcmp("AL_OUT_OF_MEMORY", ename)) {
          return 40965;
        }
        if (!strcmp("AL_VENDOR", ename)) {
          return 45057;
        }
        if (!strcmp("AL_VERSION", ename)) {
          return 45058;
        }
        if (!strcmp("AL_RENDERER", ename)) {
          return 45059;
        }
        if (!strcmp("AL_EXTENSIONS", ename)) {
          return 45060;
        }
        if (!strcmp("AL_DOPPLER_FACTOR", ename)) {
          return 49152;
        }
        if (!strcmp("AL_DOPPLER_VELOCITY", ename)) {
          return 49153;
        }
        if (!strcmp("AL_DISTANCE_MODEL", ename)) {
          return 53248;
        }
        if (!strcmp("AL_INVERSE_DISTANCE", ename)) {
          return 53249;
        }
        if (!strcmp("AL_INVERSE_DISTANCE_CLAMPED", ename)) {
          return 53250;
        }
        if (!strcmp("AL_LINEAR_DISTANCE", ename)) {
          return 53251;
        }
        if (!strcmp("AL_LINEAR_DISTANCE_CLAMPED", ename)) {
          return 53252;
        }
        if (!strcmp("AL_EXPONENT_DISTANCE", ename)) {
          return 53253;
        }
        if (!strcmp("AL_EXPONENT_DISTANCE_CLAMPED", ename)) {
          return 53254;
        }
        if (!strcmp("AL_SPEED_OF_SOUND", ename)) {
          return 49155;
        }
        if (!strcmp("AL_SOURCE_TYPE", ename)) {
          return 4135;
        }
        ALenum result = strcmp("ALC_INVALID", ename);
        if (result)
        {
          ALenum result = strcmp("ALC_FALSE", ename);
          if (result)
          {
            if (strcmp("ALC_TRUE", ename))
            {
              if (!strcmp("ALC_MAJOR_VERSION", ename)) {
                return 4096;
              }
              if (strcmp("ALC_MINOR_VERSION", ename))
              {
                if (strcmp("ALC_ATTRIBUTES_SIZE", ename))
                {
                  if (strcmp("ALC_ALL_ATTRIBUTES", ename))
                  {
                    if (strcmp("ALC_DEFAULT_DEVICE_SPECIFIER", ename))
                    {
                      if (strcmp("ALC_DEVICE_SPECIFIER", ename))
                      {
                        if (strcmp("ALC_EXTENSIONS", ename))
                        {
                          if (strcmp("ALC_FREQUENCY", ename))
                          {
                            if (!strcmp("ALC_REFRESH", ename)) {
                              return 4104;
                            }
                            if (strcmp("ALC_SYNC", ename))
                            {
                              ALenum result = strcmp("ALC_NO_ERROR", ename);
                              if (!result) {
                                return result;
                              }
                              if (strcmp("ALC_INVALID_DEVICE", ename))
                              {
                                if (strcmp("ALC_INVALID_CONTEXT", ename))
                                {
                                  if (strcmp("ALC_INVALID_ENUM", ename))
                                  {
                                    if (strcmp("ALC_INVALID_VALUE", ename))
                                    {
                                      if (strcmp("ALC_OUT_OF_MEMORY", ename))
                                      {
                                        if (strcmp("ALC_MONO_SOURCES", ename))
                                        {
                                          if (strcmp("ALC_STEREO_SOURCES", ename))
                                          {
                                            if (!strcmp("AL_SEC_OFFSET", ename)) {
                                              return 4132;
                                            }
                                            if (!strcmp("AL_SAMPLE_OFFSET", ename)) {
                                              return 4133;
                                            }
                                            if (!strcmp("AL_BYTE_OFFSET", ename)) {
                                              return 4134;
                                            }
                                            if (!strcmp("ALC_CAPTURE_DEVICE_SPECIFIER", ename)) {
                                              return 784;
                                            }
                                            if (!strcmp("ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER", ename)) {
                                              return 785;
                                            }
                                            if (!strcmp("ALC_CAPTURE_SAMPLES", ename)) {
                                              return 786;
                                            }
                                            if (!strcmp("ALC_SPATIAL_RENDERING_QUALITY", ename)) {
                                              return 61442;
                                            }
                                            if (!strcmp("ALC_MIXER_OUTPUT_RATE", ename)) {
                                              return 61443;
                                            }
                                            if (!strcmp("ALC_MIXER_MAXIMUM_BUSSES", ename)) {
                                              return 61444;
                                            }
                                            if (!strcmp("ALC_RENDER_CHANNEL_COUNT", ename)) {
                                              return 61445;
                                            }
                                            if (!strcmp("ALC_MAC_OSX_SPATIAL_RENDERING_QUALITY_HIGH", ename)) {
                                              return 1920034921;
                                            }
                                            if (!strcmp("ALC_MAC_OSX_SPATIAL_RENDERING_QUALITY_LOW", ename)) {
                                              return 1919183983;
                                            }
                                            if (!strcmp("ALC_IPHONE_SPATIAL_RENDERING_QUALITY_HEADPHONES", ename)) {
                                              return 1751412840;
                                            }
                                            if (!strcmp("ALC_MAC_OSX_RENDER_CHANNEL_COUNT_STEREO", ename)) {
                                              return 1919120244;
                                            }
                                            if (!strcmp("ALC_MAC_OSX_RENDER_CHANNEL_COUNT_MULTICHANNEL", ename)) {
                                              return 1919118691;
                                            }
                                            if (!strcmp("AL_GAMEKIT", ename)) {
                                              return 1735095154;
                                            }
                                            if (!strcmp("ALC_ASA_REVERB_ON", ename)) {
                                              return 1920364398;
                                            }
                                            if (!strcmp("ALC_ASA_REVERB_EQ_GAIN", ename)) {
                                              return 1920361831;
                                            }
                                            if (!strcmp("ALC_ASA_REVERB_EQ_BANDWITH", ename)) {
                                              return 1920361826;
                                            }
                                            if (!strcmp("ALC_ASA_REVERB_EQ_FREQ", ename)) {
                                              return 1920361830;
                                            }
                                            if (!strcmp("ALC_ASA_REVERB_ROOM_TYPE", ename)) {
                                              return 1920365172;
                                            }
                                            if (!strcmp("ALC_ASA_REVERB_SEND_LEVEL", ename)) {
                                              return 1920365420;
                                            }
                                            if (!strcmp("ALC_ASA_REVERB_GLOBAL_LEVEL", ename)) {
                                              return 1920362348;
                                            }
                                            if (!strcmp("ALC_ASA_OCCLUSION", ename)) {
                                              return 1868784492;
                                            }
                                            if (!strcmp("ALC_ASA_OBSTRUCTION", ename)) {
                                              return 1868723060;
                                            }
                                            return -1;
                                          }
                                          return 4113;
                                        }
                                        return 4112;
                                      }
                                      return 40965;
                                    }
                                    return 40964;
                                  }
                                  return 40963;
                                }
                                return 40962;
                              }
                              return 40961;
                            }
                            return 4105;
                          }
                          return 4103;
                        }
                        return 4102;
                      }
                      return 4101;
                    }
                    return 4100;
                  }
                  return 4099;
                }
                return 4098;
              }
              return 4097;
            }
            return 1;
          }
        }
      }
    }
  }
  return result;
}

uint64_t alcGetInteger(ALCdevice_struct *a1, int a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (a2 > 4100)
    {
      switch(a2)
      {
        case 40961:
          int v6 = "ALC_INVALID_DEVICE";
          break;
        case 40962:
          int v6 = "ALC_INVALID_CONTEXT";
          break;
        case 40963:
          int v6 = "ALC_INVALID_ENUM";
          break;
        case 40964:
          int v6 = "ALC_INVALID_VALUE";
          break;
        default:
          if (a2 == 4102)
          {
            int v6 = "ALC_EXTENSIONS";
          }
          else
          {
            if (a2 != 4101) {
              goto LABEL_17;
            }
            int v6 = "ALC_DEVICE_SPECIFIER";
          }
          break;
      }
      goto LABEL_22;
    }
    if (a2 > 784)
    {
      if (a2 == 785)
      {
        int v6 = "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
      if (a2 == 4100)
      {
        int v6 = "ALC_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
    }
    else
    {
      if (!a2)
      {
        int v6 = "ALC_NO_ERROR";
        goto LABEL_22;
      }
      if (a2 == 784)
      {
        int v6 = "ALC_CAPTURE_DEVICE_SPECIFIER";
LABEL_22:
        int v36 = 136315906;
        int v37 = "oalImp.cpp";
        __int16 v38 = 1024;
        int v39 = 1151;
        __int16 v40 = 2048;
        int v41 = a1;
        __int16 v42 = 2080;
        int v43 = v6;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcGetInteger--> device = %ld attribute name = %s", (uint8_t *)&v36, 0x26u);
        goto LABEL_23;
      }
    }
LABEL_17:
    int v6 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
    goto LABEL_22;
  }
LABEL_23:
  uint64_t v7 = 0;
  if (!a1)
  {
    __int16 v8 = 0;
    if ((a2 - 4096) >= 2) {
      goto LABEL_57;
    }
LABEL_64:
    uint64_t v24 = 0;
    uint64_t result = 1;
    if (!v7) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
  __int16 v8 = 0;
  if (gOALDeviceMap)
  {
    uint64_t v9 = gDeviceMapLock;
    int v10 = (*(uint64_t (**)(uint64_t))(*(void *)gDeviceMapLock + 16))(gDeviceMapLock);
    int v11 = *(void **)(gOALDeviceMap + 8);
    if (!v11) {
      goto LABEL_36;
    }
    uint64_t v12 = gOALDeviceMap + 8;
    do
    {
      unint64_t v13 = v11[4];
      BOOL v14 = v13 >= (unint64_t)a1;
      if (v13 >= (unint64_t)a1) {
        int v15 = v11;
      }
      else {
        int v15 = v11 + 1;
      }
      if (v14) {
        uint64_t v12 = (uint64_t)v11;
      }
      int v11 = (void *)*v15;
    }
    while (*v15);
    if (v12 != gOALDeviceMap + 8 && *(void *)(v12 + 32) <= (unint64_t)a1)
    {
      uint64_t v7 = *(void *)(v12 + 40);
      if (v7) {
        atomic_fetch_add((atomic_uint *volatile)(v7 + 76), 1u);
      }
    }
    else
    {
LABEL_36:
      uint64_t v7 = 0;
    }
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
    }
    __int16 v8 = 0;
    if (!v7 && gOALCaptureDeviceMap)
    {
      uint64_t v16 = gCaptureDeviceMapLock;
      int v17 = (*(uint64_t (**)(uint64_t))(*(void *)gCaptureDeviceMapLock + 16))(gCaptureDeviceMapLock);
      int v18 = *(void **)(gOALCaptureDeviceMap + 8);
      if (!v18) {
        goto LABEL_52;
      }
      uint64_t v19 = gOALCaptureDeviceMap + 8;
      do
      {
        unint64_t v20 = v18[4];
        BOOL v21 = v20 >= (unint64_t)a1;
        if (v20 >= (unint64_t)a1) {
          int v22 = v18;
        }
        else {
          int v22 = v18 + 1;
        }
        if (v21) {
          uint64_t v19 = (uint64_t)v18;
        }
        int v18 = (void *)*v22;
      }
      while (*v22);
      if (v19 != gOALCaptureDeviceMap + 8 && *(void *)(v19 + 32) <= (unint64_t)a1)
      {
        __int16 v8 = *(atomic_uint **)(v19 + 40);
        if (v8) {
          atomic_fetch_add(v8 + 30, 1u);
        }
      }
      else
      {
LABEL_52:
        __int16 v8 = 0;
      }
      if (v17) {
        (*(void (**)(uint64_t))(*(void *)v16 + 24))(v16);
      }
      uint64_t v7 = 0;
    }
  }
  if ((a2 - 4096) < 2) {
    goto LABEL_64;
  }
LABEL_57:
  if (a2 == 786)
  {
    if (v8)
    {
      uint64_t result = OALCaptureDevice::AvailableFrames((OALCaptureDevice *)v8, v4, v5);
      goto LABEL_82;
    }
    unsigned int v23 = 40961;
    if (v7) {
      goto LABEL_75;
    }
  }
  else
  {
    if (a2 == 4098)
    {
      unsigned int v23 = 40961;
      if (a1 && v7)
      {
        if (alcGetContextsDevice((ALCcontext *)gCurrentContext) == a1)
        {
          if (gOALContextMap)
          {
            unint64_t v27 = gCurrentContext;
            uint64_t v28 = gContextMapLock;
            int v29 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
            int v30 = *(void **)(gOALContextMap + 8);
            if (!v30) {
              goto LABEL_110;
            }
            uint64_t v31 = gOALContextMap + 8;
            do
            {
              unint64_t v32 = v30[4];
              BOOL v33 = v32 >= v27;
              if (v32 >= v27) {
                int v34 = v30;
              }
              else {
                int v34 = v30 + 1;
              }
              if (v33) {
                uint64_t v31 = (uint64_t)v30;
              }
              int v30 = (void *)*v34;
            }
            while (*v34);
            if (v31 != gOALContextMap + 8 && *(void *)(v31 + 32) <= v27)
            {
              uint64_t v24 = *(void *)(v31 + 40);
              if (v24) {
                atomic_fetch_add((atomic_uint *volatile)(v24 + 440), 1u);
              }
            }
            else
            {
LABEL_110:
              uint64_t v24 = 0;
            }
            if (v29) {
              (*(void (**)(uint64_t))(*(void *)v28 + 24))(v28);
            }
            if (v24)
            {
              uint64_t result = *(unsigned int *)(v24 + 396);
              goto LABEL_65;
            }
            unsigned int v23 = 40964;
          }
          else
          {
            unsigned int v23 = 40964;
          }
        }
        else
        {
          unsigned int v23 = 40961;
        }
        goto LABEL_75;
      }
    }
    else
    {
      unsigned int v23 = 40963;
    }
    if (v7)
    {
LABEL_75:
      OALDevice::SetError(v7, v23);
      goto LABEL_76;
    }
    if (v8)
    {
      OALDevice::SetError((uint64_t)v8, v23);
      goto LABEL_76;
    }
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)v23);
  }
LABEL_76:
  uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (!result)
  {
LABEL_82:
    uint64_t v24 = 0;
    if (!v7) {
      goto LABEL_66;
    }
LABEL_65:
    atomic_fetch_add((atomic_uint *volatile)(v7 + 76), 0xFFFFFFFF);
    goto LABEL_66;
  }
  if (a2 > 4100)
  {
    switch(a2)
    {
      case 40961:
        int v26 = "ALC_INVALID_DEVICE";
        break;
      case 40962:
        int v26 = "ALC_INVALID_CONTEXT";
        break;
      case 40963:
        int v26 = "ALC_INVALID_ENUM";
        break;
      case 40964:
        int v26 = "ALC_INVALID_VALUE";
        break;
      default:
        if (a2 == 4102)
        {
          int v26 = "ALC_EXTENSIONS";
        }
        else
        {
          if (a2 != 4101) {
            goto LABEL_117;
          }
          int v26 = "ALC_DEVICE_SPECIFIER";
        }
        break;
    }
  }
  else
  {
    if (a2 > 784)
    {
      if (a2 == 785)
      {
        int v26 = "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_122;
      }
      if (a2 == 4100)
      {
        int v26 = "ALC_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_122;
      }
    }
    else
    {
      if (!a2)
      {
        int v26 = "ALC_NO_ERROR";
        goto LABEL_122;
      }
      if (a2 == 784)
      {
        int v26 = "ALC_CAPTURE_DEVICE_SPECIFIER";
        goto LABEL_122;
      }
    }
LABEL_117:
    int v26 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
  }
LABEL_122:
  String = alcGetString(0, v23);
  int v36 = 136316162;
  int v37 = "oalImp.cpp";
  __int16 v38 = 1024;
  int v39 = 1221;
  __int16 v40 = 2048;
  int v41 = a1;
  __int16 v42 = 2080;
  int v43 = v26;
  __int16 v44 = 2080;
  int v45 = String;
  _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcGetInteger FAILED: device = %ld attribute name = %s error = %s", (uint8_t *)&v36, 0x30u);
  uint64_t v24 = 0;
  uint64_t result = 0;
  if (v7) {
    goto LABEL_65;
  }
LABEL_66:
  if (v8) {
    atomic_fetch_add(v8 + 30, 0xFFFFFFFF);
  }
  if (v24) {
    atomic_fetch_add((atomic_uint *volatile)(v24 + 440), 0xFFFFFFFF);
  }
  return result;
}

void sub_221540204(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alcGetIntegerv(ALCdevice *device, ALCenum param, ALCsizei size, ALCint *data)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (param > 4100)
    {
      switch(param)
      {
        case 40961:
          int v10 = "ALC_INVALID_DEVICE";
          break;
        case 40962:
          int v10 = "ALC_INVALID_CONTEXT";
          break;
        case 40963:
          int v10 = "ALC_INVALID_ENUM";
          break;
        case 40964:
          int v10 = "ALC_INVALID_VALUE";
          break;
        default:
          if (param == 4102)
          {
            int v10 = "ALC_EXTENSIONS";
          }
          else
          {
            if (param != 4101) {
              goto LABEL_17;
            }
            int v10 = "ALC_DEVICE_SPECIFIER";
          }
          break;
      }
      goto LABEL_22;
    }
    if (param > 784)
    {
      if (param == 785)
      {
        int v10 = "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
      if (param == 4100)
      {
        int v10 = "ALC_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
    }
    else
    {
      if (!param)
      {
        int v10 = "ALC_NO_ERROR";
        goto LABEL_22;
      }
      if (param == 784)
      {
        int v10 = "ALC_CAPTURE_DEVICE_SPECIFIER";
LABEL_22:
        int v34 = 136315906;
        int v35 = "oalImp.cpp";
        __int16 v36 = 1024;
        int v37 = 1234;
        __int16 v38 = 2048;
        int v39 = device;
        __int16 v40 = 2080;
        int v41 = v10;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcGetIntegerv--> device = %ld attribute name = %s", (uint8_t *)&v34, 0x26u);
        goto LABEL_23;
      }
    }
LABEL_17:
    int v10 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
    goto LABEL_22;
  }
LABEL_23:
  if (!gOALDeviceMap)
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
LABEL_41:
    if (gOALCaptureDeviceMap)
    {
      uint64_t v20 = gCaptureDeviceMapLock;
      int v21 = (*(uint64_t (**)(uint64_t))(*(void *)gCaptureDeviceMapLock + 16))(gCaptureDeviceMapLock);
      int v22 = *(void **)(gOALCaptureDeviceMap + 8);
      if (!v22) {
        goto LABEL_53;
      }
      uint64_t v23 = gOALCaptureDeviceMap + 8;
      do
      {
        unint64_t v24 = v22[4];
        BOOL v25 = v24 >= (unint64_t)device;
        if (v24 >= (unint64_t)device) {
          int v26 = v22;
        }
        else {
          int v26 = v22 + 1;
        }
        if (v25) {
          uint64_t v23 = (uint64_t)v22;
        }
        int v22 = (void *)*v26;
      }
      while (*v26);
      if (v23 != gOALCaptureDeviceMap + 8 && *(void *)(v23 + 32) <= (unint64_t)device)
      {
        uint64_t v19 = *(atomic_uint **)(v23 + 40);
        if (v19) {
          atomic_fetch_add(v19 + 30, 1u);
        }
      }
      else
      {
LABEL_53:
        uint64_t v19 = 0;
      }
      if (v21) {
        (*(void (**)(uint64_t))(*(void *)v20 + 24))(v20);
      }
    }
    goto LABEL_56;
  }
  uint64_t v11 = gDeviceMapLock;
  int v12 = (*(uint64_t (**)(uint64_t))(*(void *)gDeviceMapLock + 16))(gDeviceMapLock);
  unint64_t v13 = *(void **)(gOALDeviceMap + 8);
  if (!v13) {
    goto LABEL_35;
  }
  uint64_t v14 = gOALDeviceMap + 8;
  do
  {
    unint64_t v15 = v13[4];
    BOOL v16 = v15 >= (unint64_t)device;
    if (v15 >= (unint64_t)device) {
      int v17 = v13;
    }
    else {
      int v17 = v13 + 1;
    }
    if (v16) {
      uint64_t v14 = (uint64_t)v13;
    }
    unint64_t v13 = (void *)*v17;
  }
  while (*v17);
  if (v14 != gOALDeviceMap + 8 && *(void *)(v14 + 32) <= (unint64_t)device)
  {
    uint64_t v18 = *(void *)(v14 + 40);
    if (v18) {
      atomic_fetch_add((atomic_uint *volatile)(v18 + 76), 1u);
    }
  }
  else
  {
LABEL_35:
    uint64_t v18 = 0;
  }
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v11 + 24))(v11);
  }
  uint64_t v19 = 0;
  if (!v18) {
    goto LABEL_41;
  }
LABEL_56:
  unsigned int v27 = 40964;
  if (size && data)
  {
    switch(param)
    {
      case 4096:
      case 4097:
        *data = 1;
        goto LABEL_106;
      case 4098:
        unsigned int v27 = 40961;
        if (!device || !v18) {
          break;
        }
        if (alcGetContextsDevice((ALCcontext *)gCurrentContext) != device) {
          goto LABEL_78;
        }
        uint64_t v28 = ProtectContextObject(gCurrentContext);
        if (!v28) {
          goto LABEL_115;
        }
        *data = *(_DWORD *)(v28 + 396);
        goto LABEL_107;
      case 4099:
        unsigned int v27 = 40961;
        if (!device || !v18) {
          break;
        }
        if (alcGetContextsDevice((ALCcontext *)gCurrentContext) != device)
        {
          unsigned int v27 = 40961;
          goto LABEL_78;
        }
        uint64_t v32 = ProtectContextObject(gCurrentContext);
        uint64_t v33 = v32;
        if (!v32 || *(_DWORD *)(v32 + 396) > size)
        {
LABEL_115:
          unsigned int v27 = 40964;
          goto LABEL_78;
        }
        OALContext::CopyAttributeList((const void **)v32, data);
        uint64_t v28 = 0;
        atomic_fetch_add((atomic_uint *volatile)(v33 + 440), 0xFFFFFFFF);
        goto LABEL_107;
      default:
        if (param != 786)
        {
          unsigned int v27 = 40963;
          break;
        }
        if (v19)
        {
          *data = OALCaptureDevice::AvailableFrames((OALCaptureDevice *)v19, v8, v9);
          goto LABEL_106;
        }
        if (!v18) {
          goto LABEL_82;
        }
        goto LABEL_78;
    }
  }
  if (v18)
  {
LABEL_78:
    OALDevice::SetError(v18, v27);
  }
  else if (v19)
  {
    OALDevice::SetError((uint64_t)v19, v27);
  }
  else
  {
LABEL_82:
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)v27);
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (param > 4100)
    {
      switch(param)
      {
        case 40961:
          int v29 = "ALC_INVALID_DEVICE";
          break;
        case 40962:
          int v29 = "ALC_INVALID_CONTEXT";
          break;
        case 40963:
          int v29 = "ALC_INVALID_ENUM";
          break;
        case 40964:
          int v29 = "ALC_INVALID_VALUE";
          break;
        default:
          if (param == 4102)
          {
            int v29 = "ALC_EXTENSIONS";
          }
          else
          {
            if (param != 4101) {
              goto LABEL_100;
            }
            int v29 = "ALC_DEVICE_SPECIFIER";
          }
          break;
      }
      goto LABEL_105;
    }
    if (param > 784)
    {
      if (param == 785)
      {
        int v29 = "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_105;
      }
      if (param == 4100)
      {
        int v29 = "ALC_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_105;
      }
    }
    else
    {
      if (!param)
      {
        int v29 = "ALC_NO_ERROR";
        goto LABEL_105;
      }
      if (param == 784)
      {
        int v29 = "ALC_CAPTURE_DEVICE_SPECIFIER";
LABEL_105:
        String = alcGetString(0, v27);
        int v34 = 136316162;
        int v35 = "oalImp.cpp";
        __int16 v36 = 1024;
        int v37 = 1301;
        __int16 v38 = 2048;
        int v39 = device;
        __int16 v40 = 2080;
        int v41 = v29;
        __int16 v42 = 2080;
        int v43 = String;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcGetInteger FAILED: device = %ld attribute name = %s error = %s", (uint8_t *)&v34, 0x30u);
        goto LABEL_106;
      }
    }
LABEL_100:
    int v29 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
    goto LABEL_105;
  }
LABEL_106:
  uint64_t v28 = 0;
  uint64_t v31 = 0;
  if (v18)
  {
LABEL_107:
    atomic_fetch_add((atomic_uint *volatile)(v18 + 76), 0xFFFFFFFF);
    uint64_t v31 = v28;
  }
  if (v19) {
    atomic_fetch_add(v19 + 30, 0xFFFFFFFF);
  }
  if (v31) {
    atomic_fetch_add((atomic_uint *volatile)(v31 + 440), 0xFFFFFFFF);
  }
}

void sub_2215408FC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

ALenum alGetError(void)
{
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  int v0 = pthread_getspecific(gALErrorKey);
  if (v0) {
    pthread_setspecific(gALErrorKey, 0);
  }
  return (int)v0;
}

void alGenBuffers(ALsizei n, ALuint *buffers)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    double v9 = "oalImp.cpp";
    __int16 v10 = 1024;
    int v11 = 1348;
    __int16 v12 = 2048;
    *(void *)unint64_t v13 = n;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGenBuffers--> requested buffers = %ld", buf, 0x1Cu);
  }
  if (n < 0)
  {
    unsigned int v6 = 40963;
    goto LABEL_17;
  }
  InitializeBufferMap();
  if (!gOALBufferMap)
  {
    unsigned int v6 = 40964;
    goto LABEL_17;
  }
  uint64_t v3 = gBufferMapLock;
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)gBufferMapLock + 16))(gBufferMapLock);
  CleanUpDeadBufferList();
  int v5 = *(_DWORD *)(gOALBufferMap + 16);
  if (n <= 0x400 && (v5 + n) <= 0x400)
  {
    if (n)
    {
      ++GetNewToken(void)::currentToken;
      operator new();
    }
    unsigned int v6 = 0;
    if (!v4) {
      goto LABEL_17;
    }
LABEL_16:
    (*(void (**)(uint64_t))(*(void *)v3 + 24))(v3);
    goto LABEL_17;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    double v9 = "oalImp.cpp";
    __int16 v10 = 1024;
    int v11 = 1363;
    __int16 v12 = 1024;
    *(_DWORD *)unint64_t v13 = n;
    *(_WORD *)&v13[4] = 1024;
    *(_DWORD *)&v13[6] = v5;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGenBuffers ERROR --> requested buffers:gOALBufferMap->Size() = %d:%d", buf, 0x1Eu);
  }
  unsigned int v6 = 40963;
  if (v4) {
    goto LABEL_16;
  }
LABEL_17:
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(v6);
      *(_DWORD *)buf = 136315906;
      double v9 = "oalImp.cpp";
      __int16 v10 = 1024;
      int v11 = 1383;
      __int16 v12 = 2048;
      *(void *)unint64_t v13 = n;
      *(_WORD *)&v13[8] = 2080;
      uint64_t v14 = String;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGenBuffers FAILED: requested buffers = %ld error %s", buf, 0x26u);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)v6);
    }
  }
}

void sub_221540D1C(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_221540D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  MEMORY[0x223C843A0](v9, 0x10F0C403FF1FE8BLL);
  CAGuard::Locker::~Locker((CAGuard::Locker *)&a9);
  _Unwind_Resume(a1);
}

void sub_221540D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const ALchar *__cdecl alGetString(ALenum param)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315650;
    int v4 = "oalImp.cpp";
    __int16 v5 = 1024;
    int v6 = 3397;
    __int16 v7 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetString = %s", (uint8_t *)&v3, 0x1Cu);
  }
  if (param > 45056)
  {
    uint64_t result = "Apple Inc.";
    switch(param)
    {
      case 45057:
        return result;
      case 45058:
        uint64_t result = "1.1";
        break;
      case 45059:
        uint64_t result = "Software";
        break;
      case 45060:
        uint64_t result = (const ALchar *)alExtensions;
        if (!alExtensions)
        {
          uint64_t result = (const ALchar *)malloc_type_malloc(0x8CuLL, 0x1C4BE439uLL);
          alExtensions = (uint64_t)result;
          strcpy((char *)result, "AL_EXT_OFFSET AL_EXT_LINEAR_DISTANCE AL_EXT_EXPONENT_DISTANCE AL_EXT_STATIC_BUFFER AL_EXT_SOURCE_NOTIFICATIONS AL_EXT_SOURCE_SPATIALIZATION");
        }
        break;
      default:
LABEL_19:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey)) {
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
        uint64_t result = 0;
        break;
    }
  }
  else
  {
    switch(param)
    {
      case 40961:
        uint64_t result = "Invalid Name";
        break;
      case 40962:
        uint64_t result = "Invalid Enum";
        break;
      case 40963:
        uint64_t result = "Invalid Value";
        break;
      case 40964:
        uint64_t result = "Invalid Operation";
        break;
      case 40965:
        uint64_t result = "Out of Memory";
        break;
      default:
        if (param == -1)
        {
          uint64_t result = "Unknown Internal Error";
        }
        else
        {
          if (param) {
            goto LABEL_19;
          }
          uint64_t result = "No Error";
        }
        break;
    }
  }
  return result;
}

void alDeleteBuffers(ALsizei n, const ALuint *buffers)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  if (!n) {
    return;
  }
  unsigned int v4 = 40963;
  if (n < 0 || !gOALBufferMap) {
    goto LABEL_98;
  }
  uint64_t v5 = gBufferMapLock;
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)gBufferMapLock + 16))(gBufferMapLock);
  CleanUpDeadBufferList();
  uint64_t v7 = 0;
  BOOL v8 = 1;
  while (1)
  {
    uint64_t v9 = (const ALchar *)buffers[v7];
    if (!v9) {
      goto LABEL_5;
    }
    uint64_t v10 = *(void *)(gOALBufferMap + 8);
    if (!v10) {
      break;
    }
    uint64_t v11 = gOALBufferMap + 8;
    do
    {
      unsigned int v12 = *(_DWORD *)(v10 + 32);
      BOOL v13 = v12 >= v9;
      if (v12 >= v9) {
        uint64_t v14 = (uint64_t *)v10;
      }
      else {
        uint64_t v14 = (uint64_t *)(v10 + 8);
      }
      if (v13) {
        uint64_t v11 = v10;
      }
      uint64_t v10 = *v14;
    }
    while (*v14);
    if (v11 == gOALBufferMap + 8) {
      break;
    }
    if (*(_DWORD *)(v11 + 32) > v9) {
      break;
    }
    uint64_t v15 = *(OALBuffer **)(v11 + 40);
    if (!v15) {
      break;
    }
    if ((OALBuffer::CanBeRemovedFromBufferMap(v15) & 1) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        BOOL v16 = (const ALchar *)buffers[v7];
        *(_DWORD *)buf = 136315650;
        *(void *)int v58 = "oalImp.cpp";
        *(_WORD *)&v58[8] = 1024;
        *(_DWORD *)&v58[10] = 1436;
        __int16 v59 = 2048;
        int v60 = v16;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alDeleteBuffers: oalBuffer cannot currently be removed, a source is still attached, bid = %ld", buf, 0x1Cu);
        unsigned int v4 = 40964;
        if (!v8) {
          goto LABEL_30;
        }
      }
      else
      {
        unsigned int v4 = 40964;
        if (!v8) {
          goto LABEL_30;
        }
      }
      goto LABEL_27;
    }
LABEL_5:
    BOOL v8 = ++v7 < (unint64_t)n;
    if (v7 == n)
    {
      unsigned int v4 = 0;
      goto LABEL_30;
    }
  }
  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v4 = 40961;
    if (!v8) {
      goto LABEL_30;
    }
LABEL_27:
    if (!v6) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }
  *(_DWORD *)buf = 136315650;
  *(void *)int v58 = "oalImp.cpp";
  *(_WORD *)&v58[8] = 1024;
  *(_DWORD *)&v58[10] = 1431;
  __int16 v59 = 2048;
  int v60 = v9;
  _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alDeleteBuffers: oalBuffer == NULL, bid = %ld", buf, 0x1Cu);
  unsigned int v4 = 40961;
  if (v8) {
    goto LABEL_27;
  }
LABEL_30:
  int v56 = v6;
  uint64_t v17 = 0;
  if (n <= 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = n;
  }
  do
  {
    ALuint v19 = buffers[v17];
    if (v19)
    {
      uint64_t v20 = *(void *)(gOALBufferMap + 8);
      if (!v20) {
        goto LABEL_47;
      }
      uint64_t v21 = gOALBufferMap + 8;
      do
      {
        ALuint v22 = *(_DWORD *)(v20 + 32);
        BOOL v23 = v22 >= v19;
        if (v22 >= v19) {
          unint64_t v24 = (uint64_t *)v20;
        }
        else {
          unint64_t v24 = (uint64_t *)(v20 + 8);
        }
        if (v23) {
          uint64_t v21 = v20;
        }
        uint64_t v20 = *v24;
      }
      while (*v24);
      if (v21 != gOALBufferMap + 8 && *(_DWORD *)(v21 + 32) <= v19) {
        BOOL v25 = *(OALBuffer **)(v21 + 40);
      }
      else {
LABEL_47:
      }
        BOOL v25 = 0;
      if (OALBuffer::IsPurgable(v25))
      {
        uint64_t v26 = gOALBufferMap;
        unsigned int v27 = *(uint64_t **)(gOALBufferMap + 8);
        if (v27)
        {
          ALuint v28 = buffers[v17];
          uint64_t v29 = gOALBufferMap + 8;
          uint64_t v30 = *(void *)(gOALBufferMap + 8);
          do
          {
            ALuint v31 = *(_DWORD *)(v30 + 32);
            BOOL v32 = v31 >= v28;
            if (v31 >= v28) {
              uint64_t v33 = (uint64_t *)v30;
            }
            else {
              uint64_t v33 = (uint64_t *)(v30 + 8);
            }
            if (v32) {
              uint64_t v29 = v30;
            }
            uint64_t v30 = *v33;
          }
          while (*v33);
          if (v29 != gOALBufferMap + 8 && *(_DWORD *)(v29 + 32) <= v28)
          {
            int v34 = *(void **)(v29 + 8);
            int v35 = (void *)v29;
            if (v34)
            {
              do
              {
                __int16 v36 = v34;
                int v34 = (void *)*v34;
              }
              while (v34);
            }
            else
            {
              do
              {
                __int16 v36 = (void *)v35[2];
                BOOL v37 = *v36 == (void)v35;
                int v35 = v36;
              }
              while (!v37);
            }
            if (*(void *)gOALBufferMap == v29) {
              *(void *)gOALBufferMap = v36;
            }
            --*(void *)(v26 + 16);
            std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v27, (uint64_t *)v29);
            operator delete((void *)v29);
          }
        }
        if (v25)
        {
          OALBuffer::~OALBuffer(v25);
          MEMORY[0x223C843A0]();
        }
      }
      else
      {
        unsigned int v38 = *(_DWORD *)v25;
        int v39 = (uint64_t **)(gDeadOALBufferMap + 8);
        uint64_t v40 = *(void *)(gDeadOALBufferMap + 8);
        if (v40)
        {
          do
          {
            unsigned int v41 = *(_DWORD *)(v40 + 32);
            BOOL v42 = v41 > v38;
            if (v41 <= v38) {
              int v43 = (uint64_t *)(v40 + 8);
            }
            else {
              int v43 = (uint64_t *)v40;
            }
            if (v42) {
              int v39 = (uint64_t **)v40;
            }
            uint64_t v40 = *v43;
          }
          while (*v43);
        }
        *(_DWORD *)buf = *(_DWORD *)v25;
        *(void *)&v58[4] = v25;
        std::__tree<std::__value_type<unsigned int,OALSource *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,OALSource *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,OALSource *>>>::__emplace_hint_multi<std::pair<unsigned int const,OALSource *>>((uint64_t ***)gDeadOALBufferMap, v39, buf);
        uint64_t v44 = gOALBufferMap;
        int v45 = *(uint64_t **)(gOALBufferMap + 8);
        if (v45)
        {
          ALuint v46 = buffers[v17];
          uint64_t v47 = gOALBufferMap + 8;
          uint64_t v48 = *(void *)(gOALBufferMap + 8);
          do
          {
            ALuint v49 = *(_DWORD *)(v48 + 32);
            BOOL v50 = v49 >= v46;
            if (v49 >= v46) {
              int v51 = (uint64_t *)v48;
            }
            else {
              int v51 = (uint64_t *)(v48 + 8);
            }
            if (v50) {
              uint64_t v47 = v48;
            }
            uint64_t v48 = *v51;
          }
          while (*v51);
          if (v47 != gOALBufferMap + 8 && *(_DWORD *)(v47 + 32) <= v46)
          {
            int v52 = *(void **)(v47 + 8);
            int v53 = (void *)v47;
            if (v52)
            {
              do
              {
                int v54 = v52;
                int v52 = (void *)*v52;
              }
              while (v52);
            }
            else
            {
              do
              {
                int v54 = (void *)v53[2];
                BOOL v37 = *v54 == (void)v53;
                int v53 = v54;
              }
              while (!v37);
            }
            if (*(void *)gOALBufferMap == v47) {
              *(void *)gOALBufferMap = v54;
            }
            --*(void *)(v44 + 16);
            std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v45, (uint64_t *)v47);
            operator delete((void *)v47);
          }
        }
      }
    }
    ++v17;
  }
  while (v17 != v18);
  if (v56) {
LABEL_97:
  }
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
LABEL_98:
  if (v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(v4);
      *(_DWORD *)buf = 136315650;
      *(void *)int v58 = "oalImp.cpp";
      *(_WORD *)&v58[8] = 1024;
      *(_DWORD *)&v58[10] = 1472;
      __int16 v59 = 2080;
      int v60 = String;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alDeleteBuffers FAILED = %s", buf, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)v4);
    }
  }
}

void sub_221541588(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_2215415CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  CAGuard::Locker::~Locker((CAGuard::Locker *)va);
  _Unwind_Resume(a1);
}

ALBOOLean alIsBuffer(ALuint bid)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)unsigned int v12 = 136315650;
    *(void *)&v12[4] = "oalImp.cpp";
    __int16 v13 = 1024;
    int v14 = 1480;
    __int16 v15 = 2048;
    uint64_t v16 = bid;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alIsBuffer--> buffer %ld", v12, 0x1Cu);
  }
  if (!bid) {
    return 1;
  }
  if (gOALBufferMap)
  {
    uint64_t v2 = gBufferMapLock;
    *(void *)unsigned int v12 = gBufferMapLock;
    int v3 = (*(uint64_t (**)(uint64_t))(*(void *)gBufferMapLock + 16))(gBufferMapLock);
    v12[8] = v3;
    CleanUpDeadBufferList();
    uint64_t v4 = *(void *)(gOALBufferMap + 8);
    if (!v4) {
      goto LABEL_16;
    }
    uint64_t v5 = gOALBufferMap + 8;
    do
    {
      ALuint v6 = *(_DWORD *)(v4 + 32);
      BOOL v7 = v6 >= bid;
      if (v6 >= bid) {
        BOOL v8 = (uint64_t *)v4;
      }
      else {
        BOOL v8 = (uint64_t *)(v4 + 8);
      }
      if (v7) {
        uint64_t v5 = v4;
      }
      uint64_t v4 = *v8;
    }
    while (*v8);
    if (v5 != gOALBufferMap + 8 && *(_DWORD *)(v5 + 32) <= bid)
    {
      uint64_t v9 = *(void *)(v5 + 40);
      if (!v3) {
        return v9 != 0;
      }
    }
    else
    {
LABEL_16:
      uint64_t v9 = 0;
      if (!v3) {
        return v9 != 0;
      }
    }
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
    return v9 != 0;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    String = alGetString(40964);
    *(_DWORD *)unsigned int v12 = 136315906;
    *(void *)&v12[4] = "oalImp.cpp";
    __int16 v13 = 1024;
    int v14 = 1504;
    __int16 v15 = 2048;
    uint64_t v16 = bid;
    __int16 v17 = 2080;
    uint64_t v18 = String;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alIsBuffer FAILED: buffer = %ld error = %s", v12, 0x26u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA004);
  }
  return 0;
}

void sub_221541884(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void alBufferData(ALuint bid, ALenum format, const ALvoid *data, ALsizei size, ALsizei freq)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (gOALBufferMap)
  {
    CleanUpDeadBufferList();
    uint64_t v10 = *(void *)(gOALBufferMap + 8);
    if (v10)
    {
      uint64_t v11 = gOALBufferMap + 8;
      do
      {
        ALuint v12 = *(_DWORD *)(v10 + 32);
        BOOL v13 = v12 >= bid;
        if (v12 >= bid) {
          int v14 = (uint64_t *)v10;
        }
        else {
          int v14 = (uint64_t *)(v10 + 8);
        }
        if (v13) {
          uint64_t v11 = v10;
        }
        uint64_t v10 = *v14;
      }
      while (*v14);
      if (v11 != gOALBufferMap + 8 && *(_DWORD *)(v11 + 32) <= bid)
      {
        uint64_t v16 = *(void *)(v11 + 40);
        if (data && size >= 1 && v16)
        {
          ALenum v15 = OALBuffer::AddAudioData(*(OALBuffer **)(v11 + 40), (char *)data, size, format, freq);
          atomic_fetch_add((atomic_uint *volatile)(v16 + 280), 0xFFFFFFFF);
          if (!v15) {
            return;
          }
        }
        else
        {
          if (!v16) {
            goto LABEL_13;
          }
          atomic_fetch_add((atomic_uint *volatile)(v16 + 280), 0xFFFFFFFF);
          ALenum v15 = 40963;
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_27;
        }
LABEL_23:
        if ((format - 4352) > 3) {
          __int16 v17 = "UNKNOWN FORMAT";
        }
        else {
          __int16 v17 = off_2645B7880[format - 4352];
        }
        int v18 = 136316674;
        uint64_t v19 = "oalImp.cpp";
        __int16 v20 = 1024;
        int v21 = 1540;
        __int16 v22 = 2048;
        uint64_t v23 = bid;
        __int16 v24 = 2080;
        BOOL v25 = v17;
        __int16 v26 = 2048;
        uint64_t v27 = size;
        __int16 v28 = 2048;
        uint64_t v29 = freq;
        __int16 v30 = 2080;
        String = alGetString(v15);
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alBufferData FAILED: buffer %ld : %s : %ld bytes : %ldHz error = %s", (uint8_t *)&v18, 0x44u);
        goto LABEL_27;
      }
    }
  }
LABEL_13:
  ALenum v15 = 40963;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_23;
  }
LABEL_27:
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)v15);
  }
}

void alBufferf(ALuint bid, ALenum param, ALfloat value)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315394;
    uint64_t v4 = "oalImp.cpp";
    __int16 v5 = 1024;
    int v6 = 1548;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alBufferf--> there are currently no valid enums for this API", (uint8_t *)&v3, 0x12u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
  }
}

void alBuffer3f(ALuint bid, ALenum param, ALfloat value1, ALfloat value2, ALfloat value3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    int v6 = "oalImp.cpp";
    __int16 v7 = 1024;
    int v8 = 1557;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alBuffer3f--> there are currently no valid enums for this API", (uint8_t *)&v5, 0x12u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
  }
}

void alBufferfv(ALuint bid, ALenum param, const ALfloat *values)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315394;
    uint64_t v4 = "oalImp.cpp";
    __int16 v5 = 1024;
    int v6 = 1566;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alBufferfv--> there are currently no valid enums for this API", (uint8_t *)&v3, 0x12u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
  }
}

void alBufferi(ALuint bid, ALenum param, ALint value)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315394;
    uint64_t v4 = "oalImp.cpp";
    __int16 v5 = 1024;
    int v6 = 1575;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alBufferi--> there are currently no valid enums for this API", (uint8_t *)&v3, 0x12u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
  }
}

void alBuffer3i(ALuint bid, ALenum param, ALint value1, ALint value2, ALint value3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    int v6 = "oalImp.cpp";
    __int16 v7 = 1024;
    int v8 = 1584;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alBuffer3i--> there are currently no valid enums for this API", (uint8_t *)&v5, 0x12u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
  }
}

void alBufferiv(ALuint bid, ALenum param, const ALint *values)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315394;
    uint64_t v4 = "oalImp.cpp";
    __int16 v5 = 1024;
    int v6 = 1593;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alBufferiv--> there are currently no valid enums for this API", (uint8_t *)&v3, 0x12u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
  }
}

void alGetBufferf(ALuint bid, ALenum param, ALfloat *value)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315906;
    int v18 = "oalImp.cpp";
    __int16 v19 = 1024;
    int v20 = 1602;
    __int16 v21 = 2048;
    uint64_t v22 = bid;
    __int16 v23 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetBufferf--> buffer %ld : property = %s", (uint8_t *)&v17, 0x26u);
  }
  if (gOALBufferMap)
  {
    CleanUpDeadBufferList();
    uint64_t v6 = *(void *)(gOALBufferMap + 8);
    if (!v6)
    {
      uint64_t v11 = 0;
      if (param == 8193) {
        goto LABEL_17;
      }
LABEL_20:
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (pthread_getspecific(gALErrorKey))
      {
        int v14 = 0;
        unsigned int v13 = 0;
        if (v11) {
          goto LABEL_22;
        }
LABEL_26:
        if (!v14) {
          return;
        }
        goto LABEL_27;
      }
      pthread_setspecific(gALErrorKey, (const void *)0xA002);
      int v14 = 0;
      unsigned int v13 = 0;
      if (!v11) {
        goto LABEL_26;
      }
LABEL_22:
      atomic_fetch_add((atomic_uint *volatile)(v11 + 280), 0xFFFFFFFF);
      if ((v14 & 1) == 0) {
        return;
      }
      goto LABEL_27;
    }
    uint64_t v7 = gOALBufferMap + 8;
    do
    {
      ALuint v8 = *(_DWORD *)(v6 + 32);
      BOOL v9 = v8 >= bid;
      if (v8 >= bid) {
        uint64_t v10 = (uint64_t *)v6;
      }
      else {
        uint64_t v10 = (uint64_t *)(v6 + 8);
      }
      if (v9) {
        uint64_t v7 = v6;
      }
      uint64_t v6 = *v10;
    }
    while (*v10);
    if (v7 == gOALBufferMap + 8 || *(_DWORD *)(v7 + 32) > bid)
    {
      uint64_t v11 = 0;
      if (gOALBufferMap) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v11 = *(void *)(v7 + 40);
      if (gOALBufferMap)
      {
LABEL_16:
        if (param == 8193)
        {
LABEL_17:
          ALfloat v12 = *(double *)(v11 + 304);
          *value = v12;
          atomic_fetch_add((atomic_uint *volatile)(v11 + 280), 0xFFFFFFFF);
          return;
        }
        goto LABEL_20;
      }
    }
    unsigned int v13 = 40963;
    int v14 = 1;
    if (!v11) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  unsigned int v13 = 40963;
LABEL_27:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    ALenum v15 = GetALAttributeString(param);
    String = alGetString(v13);
    int v17 = 136316162;
    int v18 = "oalImp.cpp";
    __int16 v19 = 1024;
    int v20 = 1624;
    __int16 v21 = 2048;
    uint64_t v22 = bid;
    __int16 v23 = 2080;
    ALAttributeString = v15;
    __int16 v25 = 2080;
    __int16 v26 = String;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetBufferf FAILED: buffer %ld : property = %s error = %s", (uint8_t *)&v17, 0x30u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)v13);
  }
}

const char *GetALAttributeString(int a1)
{
  if (a1 > 40960)
  {
    switch(a1)
    {
      case 53249:
        uint64_t result = "AL_INVERSE_DISTANCE";
        break;
      case 53250:
        uint64_t result = "AL_INVERSE_DISTANCE_CLAMPED";
        break;
      case 53251:
        uint64_t result = "AL_LINEAR_DISTANCE";
        break;
      case 53252:
        uint64_t result = "AL_LINEAR_DISTANCE_CLAMPED";
        break;
      case 53253:
        uint64_t result = "AL_EXPONENT_DISTANCE";
        break;
      case 53254:
        uint64_t result = "AL_EXPONENT_DISTANCE_CLAMPED";
        break;
      default:
        if (a1 == 40961) {
          uint64_t result = "AL_INVALID_NAME";
        }
        else {
LABEL_11:
        }
          uint64_t result = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 4097:
        return "AL_CONE_INNER_ANGLE";
      case 4098:
        return "AL_CONE_OUTER_ANGLE";
      case 4099:
        return "AL_PITCH";
      case 4100:
        return "AL_POSITION";
      case 4101:
        return "AL_DIRECTION";
      case 4102:
        return "AL_VELOCITY";
      case 4103:
        return "AL_LOOPING";
      case 4104:
      case 4107:
      case 4108:
      case 4113:
      case 4114:
      case 4115:
      case 4116:
      case 4119:
      case 4120:
      case 4121:
      case 4122:
      case 4123:
      case 4124:
      case 4125:
      case 4126:
      case 4127:
        goto LABEL_11;
      case 4105:
        return "AL_BUFFER";
      case 4106:
        return "AL_GAIN";
      case 4109:
        return "AL_MIN_GAIN";
      case 4110:
        return "AL_MAX_GAIN";
      case 4111:
        return "AL_ORIENTATION";
      case 4112:
        return "AL_SOURCE_STATE";
      case 4117:
        return "AL_BUFFERS_QUEUED";
      case 4118:
        return "AL_BUFFERS_PROCESSED";
      case 4128:
        return "AL_REFERENCE_DISTANCE";
      case 4129:
        return "AL_ROLLOFF_FACTOR";
      case 4130:
        return "AL_CONE_OUTER_GAIN";
      case 4131:
        return "AL_MAX_DISTANCE";
      case 4132:
        return "AL_SEC_OFFSET";
      case 4133:
        return "AL_SAMPLE_OFFSET";
      case 4134:
        return "AL_BYTE_OFFSET";
      case 4135:
        return "AL_SOURCE_TYPE";
      default:
        if (a1)
        {
          if (a1 != 514) {
            goto LABEL_11;
          }
          uint64_t result = "AL_SOURCE_RELATIVE";
        }
        else
        {
          uint64_t result = "AL_NONE";
        }
        break;
    }
  }
  return result;
}

void alGetBuffer3f(ALuint bid, ALenum param, ALfloat *value1, ALfloat *value2, ALfloat *value3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315906;
    ALuint v8 = "oalImp.cpp";
    __int16 v9 = 1024;
    int v10 = 1632;
    __int16 v11 = 2048;
    uint64_t v12 = bid;
    __int16 v13 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetBuffer3f--> buffer %ld : property = %s", (uint8_t *)&v7, 0x26u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
  }
}

void alGetBufferfv(ALuint bid, ALenum param, ALfloat *values)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315906;
    uint64_t v6 = "oalImp.cpp";
    __int16 v7 = 1024;
    int v8 = 1641;
    __int16 v9 = 2048;
    uint64_t v10 = bid;
    __int16 v11 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetBufferfv--> buffer %ld : property = %s", (uint8_t *)&v5, 0x26u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
  }
}

void alGetBufferi(ALuint bid, ALenum param, ALint *value)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315906;
    uint64_t v15 = "oalImp.cpp";
    __int16 v16 = 1024;
    int v17 = 1650;
    __int16 v18 = 2048;
    uint64_t v19 = bid;
    __int16 v20 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetBufferi--> buffer %ld : property = %s", (uint8_t *)&v14, 0x26u);
  }
  if (!gOALBufferMap) {
    goto LABEL_31;
  }
  CleanUpDeadBufferList();
  uint64_t v6 = *(void *)(gOALBufferMap + 8);
  if (!v6) {
    goto LABEL_31;
  }
  uint64_t v7 = gOALBufferMap + 8;
  do
  {
    ALuint v8 = *(_DWORD *)(v6 + 32);
    BOOL v9 = v8 >= bid;
    if (v8 >= bid) {
      uint64_t v10 = (uint64_t *)v6;
    }
    else {
      uint64_t v10 = (uint64_t *)(v6 + 8);
    }
    if (v9) {
      uint64_t v7 = v6;
    }
    uint64_t v6 = *v10;
  }
  while (*v10);
  if (v7 != gOALBufferMap + 8 && *(_DWORD *)(v7 + 32) <= bid && (uint64_t v11 = *(void *)(v7 + 40)) != 0)
  {
    switch(param)
    {
      case 8193:
        *value = *(double *)(v11 + 304);
        break;
      case 8194:
        *value = *(_DWORD *)(v11 + 336);
        break;
      case 8195:
        *value = *(_DWORD *)(v11 + 332);
        break;
      case 8196:
        *value = *(_DWORD *)(v11 + 300);
        break;
      default:
        *value = 0;
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey)) {
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
        break;
    }
    atomic_fetch_add((atomic_uint *volatile)(v11 + 280), 0xFFFFFFFF);
  }
  else
  {
LABEL_31:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = GetALAttributeString(param);
      String = alGetString(40963);
      int v14 = 136316162;
      uint64_t v15 = "oalImp.cpp";
      __int16 v16 = 1024;
      int v17 = 1682;
      __int16 v18 = 2048;
      uint64_t v19 = bid;
      __int16 v20 = 2080;
      ALAttributeString = v12;
      __int16 v22 = 2080;
      __int16 v23 = String;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetBufferi FAILED: buffer = %ld property = %s error = %s", (uint8_t *)&v14, 0x30u);
    }
    *value = 0;
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
  }
}

void alGetBuffer3i(ALuint bid, ALenum param, ALint *value1, ALint *value2, ALint *value3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315906;
    ALuint v8 = "oalImp.cpp";
    __int16 v9 = 1024;
    int v10 = 1691;
    __int16 v11 = 2048;
    uint64_t v12 = bid;
    __int16 v13 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetBuffer3i--> buffer %ld : property = %s", (uint8_t *)&v7, 0x26u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
  }
}

void alGetBufferiv(ALuint bid, ALenum param, ALint *values)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315906;
    uint64_t v15 = "oalImp.cpp";
    __int16 v16 = 1024;
    int v17 = 1700;
    __int16 v18 = 2048;
    uint64_t v19 = bid;
    __int16 v20 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetBufferi--> buffer %ld : property = %s", (uint8_t *)&v14, 0x26u);
  }
  if (!gOALBufferMap) {
    goto LABEL_31;
  }
  CleanUpDeadBufferList();
  uint64_t v6 = *(void *)(gOALBufferMap + 8);
  if (!v6) {
    goto LABEL_31;
  }
  uint64_t v7 = gOALBufferMap + 8;
  do
  {
    ALuint v8 = *(_DWORD *)(v6 + 32);
    BOOL v9 = v8 >= bid;
    if (v8 >= bid) {
      int v10 = (uint64_t *)v6;
    }
    else {
      int v10 = (uint64_t *)(v6 + 8);
    }
    if (v9) {
      uint64_t v7 = v6;
    }
    uint64_t v6 = *v10;
  }
  while (*v10);
  if (v7 != gOALBufferMap + 8 && *(_DWORD *)(v7 + 32) <= bid && (uint64_t v11 = *(void *)(v7 + 40)) != 0)
  {
    switch(param)
    {
      case 8193:
        *values = *(double *)(v11 + 304);
        break;
      case 8194:
        *values = *(_DWORD *)(v11 + 336);
        break;
      case 8195:
        *values = *(_DWORD *)(v11 + 332);
        break;
      case 8196:
        *values = *(_DWORD *)(v11 + 300);
        break;
      default:
        *values = 0;
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey)) {
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
        break;
    }
    atomic_fetch_add((atomic_uint *volatile)(v11 + 280), 0xFFFFFFFF);
  }
  else
  {
LABEL_31:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = GetALAttributeString(param);
      String = alGetString(40963);
      int v14 = 136316162;
      uint64_t v15 = "oalImp.cpp";
      __int16 v16 = 1024;
      int v17 = 1731;
      __int16 v18 = 2048;
      uint64_t v19 = bid;
      __int16 v20 = 2080;
      ALAttributeString = v12;
      __int16 v22 = 2080;
      __int16 v23 = String;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetBufferiv FAILED: buffer = %ld property = %s error = %s", (uint8_t *)&v14, 0x30u);
    }
    *values = 0;
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
  }
}

void alGenSources(ALsizei n, ALuint *sources)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315650;
    __int16 v16 = "oalImp.cpp";
    __int16 v17 = 1024;
    int v18 = 1747;
    __int16 v19 = 2048;
    uint64_t v20 = n;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGenSources--> requested sources = %ld", (uint8_t *)&v15, 0x1Cu);
  }
  if (n)
  {
    unsigned int v4 = 40963;
    if (n <= 0x100 && sources)
    {
      if (gOALContextMap)
      {
        unint64_t v5 = gCurrentContext;
        uint64_t v6 = gContextMapLock;
        int v7 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
        ALuint v8 = *(void **)(gOALContextMap + 8);
        if (!v8) {
          goto LABEL_18;
        }
        uint64_t v9 = gOALContextMap + 8;
        do
        {
          unint64_t v10 = v8[4];
          BOOL v11 = v10 >= v5;
          if (v10 >= v5) {
            uint64_t v12 = v8;
          }
          else {
            uint64_t v12 = v8 + 1;
          }
          if (v11) {
            uint64_t v9 = (uint64_t)v8;
          }
          ALuint v8 = (void *)*v12;
        }
        while (*v12);
        if (v9 != gOALContextMap + 8 && *(void *)(v9 + 32) <= v5)
        {
          __int16 v13 = *(atomic_uint **)(v9 + 40);
          if (v13) {
            atomic_fetch_add(v13 + 110, 1u);
          }
        }
        else
        {
LABEL_18:
          __int16 v13 = 0;
        }
        if (v7) {
          (*(void (**)(uint64_t))(*(void *)v6 + 24))(v6);
        }
        if (v13)
        {
          ++GetNewToken(void)::currentToken;
          OALContext::AddSource((OALContext *)v13);
        }
      }
      unsigned int v4 = 40964;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(v4);
      int v15 = 136315906;
      __int16 v16 = "oalImp.cpp";
      __int16 v17 = 1024;
      int v18 = 1778;
      __int16 v19 = 2048;
      uint64_t v20 = n;
      __int16 v21 = 2080;
      __int16 v22 = String;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGenSources FAILED: source count = %ld error = %s", (uint8_t *)&v15, 0x26u);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)v4);
    }
    alDeleteSources(0, sources);
  }
}

void sub_221543264(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alDeleteSources(ALsizei n, const ALuint *sources)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136315650;
    uint64_t v20 = "oalImp.cpp";
    __int16 v21 = 1024;
    int v22 = 1790;
    __int16 v23 = 2048;
    uint64_t v24 = n;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alDeleteSources: count = %ld", (uint8_t *)&v19, 0x1Cu);
  }
  if (n)
  {
    if (!gOALContextMap) {
      goto LABEL_33;
    }
    unint64_t v4 = gCurrentContext;
    uint64_t v5 = gContextMapLock;
    int v6 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
    int v7 = *(void **)(gOALContextMap + 8);
    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v8 = gOALContextMap + 8;
    do
    {
      unint64_t v9 = v7[4];
      BOOL v10 = v9 >= v4;
      if (v9 >= v4) {
        BOOL v11 = v7;
      }
      else {
        BOOL v11 = v7 + 1;
      }
      if (v10) {
        uint64_t v8 = (uint64_t)v7;
      }
      int v7 = (void *)*v11;
    }
    while (*v11);
    if (v8 != gOALContextMap + 8 && *(void *)(v8 + 32) <= v4)
    {
      uint64_t v12 = *(atomic_uint **)(v8 + 40);
      if (v12) {
        atomic_fetch_add(v12 + 110, 1u);
      }
    }
    else
    {
LABEL_16:
      uint64_t v12 = 0;
    }
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
    }
    if (v12)
    {
      unsigned int SourceCount = OALContext::GetSourceCount((OALContext *)v12);
      BOOL v15 = n >= 0 && SourceCount >= n;
      if (v15)
      {
        if (n <= 1) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = n;
        }
        __int16 v17 = (ALuint *)sources;
        do
        {
          alSourceStop(*v17);
          OALContext::RemoveSource(v12, *v17++);
          --v16;
        }
        while (v16);
      }
      else
      {
        LODWORD(v16) = 40963;
      }
      atomic_fetch_add(v12 + 110, 0xFFFFFFFF);
    }
    else
    {
LABEL_33:
      LOBYTE(v15) = 0;
      LODWORD(v16) = 40964;
    }
    if (!v15)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        String = alGetString(v16);
        int v19 = 136315906;
        uint64_t v20 = "oalImp.cpp";
        __int16 v21 = 1024;
        int v22 = 1825;
        __int16 v23 = 2048;
        uint64_t v24 = n;
        __int16 v25 = 2080;
        __int16 v26 = String;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alDeleteSources FAILED: source count = %ld error = %s", (uint8_t *)&v19, 0x26u);
      }
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey)) {
        pthread_setspecific(gALErrorKey, (const void *)v16);
      }
    }
  }
}

void sub_22154355C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alSourceStop(ALuint sid)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315650;
    int v6 = "oalImp.cpp";
    __int16 v7 = 1024;
    int v8 = 2684;
    __int16 v9 = 2048;
    BOOL v10 = (const ALchar *)sid;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceStop--> source %ld", (uint8_t *)&v5, 0x1Cu);
  }
  uint64_t v2 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  int v3 = v2;
  if (v2)
  {
    OALSource::Stop(v2);
    atomic_fetch_add((atomic_uint *volatile)v3 + 18, 0xFFFFFFFF);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(40963);
      int v5 = 136315650;
      int v6 = "oalImp.cpp";
      __int16 v7 = 1024;
      int v8 = 2698;
      __int16 v9 = 2080;
      BOOL v10 = String;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceStop FAILED = %s\n", (uint8_t *)&v5, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
  }
}

ALBOOLean alIsSource(ALuint sid)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315650;
    int v5 = "oalImp.cpp";
    __int16 v6 = 1024;
    int v7 = 1833;
    __int16 v8 = 2048;
    uint64_t v9 = sid;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alIsSource--> source %ld", (uint8_t *)&v4, 0x1Cu);
  }
  uint64_t v2 = ProtectSourceObjectInCurrentContext(sid);
  if (v2)
  {
    atomic_fetch_add((atomic_uint *volatile)(v2 + 72), 0xFFFFFFFF);
    LOBYTE(v2) = 1;
  }
  return v2;
}

void alSourcef(ALuint sid, ALenum param, ALfloat value)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  __int16 v6 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  if (v6)
  {
    int v7 = v6;
    int v8 = 1;
    switch(param)
    {
      case 4097:
        ALenum v9 = OALSource::SetConeInnerAngle(v6, value);
        goto LABEL_21;
      case 4098:
        ALenum v9 = OALSource::SetConeOuterAngle(v6, value);
        goto LABEL_21;
      case 4099:
        ALenum v9 = OALSource::SetPitch(v6, value);
        goto LABEL_21;
      case 4106:
        ALenum v9 = OALSource::SetGain(v6, value);
        goto LABEL_21;
      case 4109:
        ALenum v9 = OALSource::SetMinGain(v6, value);
        goto LABEL_21;
      case 4110:
        ALenum v9 = OALSource::SetMaxGain(v6, value);
        goto LABEL_21;
      case 4128:
        ALenum v9 = OALSource::SetReferenceDistance(v6, value);
        goto LABEL_21;
      case 4129:
        ALenum v9 = OALSource::SetRollOffFactor(v6, value);
        goto LABEL_21;
      case 4130:
        ALenum v9 = OALSource::SetConeOuterGain(v6, value);
        goto LABEL_21;
      case 4131:
        ALenum v9 = OALSource::SetMaxDistance(v6, value);
        goto LABEL_21;
      case 4132:
        goto LABEL_20;
      case 4133:
        int v8 = 2;
        goto LABEL_20;
      case 4134:
        int v8 = 3;
LABEL_20:
        ALenum v9 = OALSource::SetQueueOffset(v6, v8, value);
LABEL_21:
        ALenum v10 = v9;
        atomic_fetch_add((atomic_uint *volatile)v7 + 18, 0xFFFFFFFF);
        if (!v9) {
          return;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_23;
        }
        goto LABEL_24;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey)) {
          pthread_setspecific(gALErrorKey, (const void *)0xA004);
        }
        atomic_fetch_add((atomic_uint *volatile)v7 + 18, 0xFFFFFFFF);
        return;
    }
  }
  ALenum v10 = 40963;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
LABEL_23:
    int v11 = 136316418;
    uint64_t v12 = "oalImp.cpp";
    __int16 v13 = 1024;
    int v14 = 1920;
    __int16 v15 = 2048;
    uint64_t v16 = sid;
    __int16 v17 = 2080;
    ALAttributeString = GetALAttributeString(param);
    __int16 v19 = 2048;
    double v20 = value;
    __int16 v21 = 2080;
    String = alGetString(v10);
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR alSourcef FAILED: source %ld : property = %s : value = %.f2 : error = %s", (uint8_t *)&v11, 0x3Au);
  }
LABEL_24:
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)v10);
  }
}

void sub_221543AD8(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    int v4 = (int *)__cxa_begin_catch(a1);
    if (a2 == 2)
    {
      int v5 = *v4;
      __cxa_end_catch();
      atomic_fetch_add((atomic_uint *volatile)(v2 + 72), 0xFFFFFFFF);
      if (!v5) {
        JUMPOUT(0x221543AA4);
      }
      JUMPOUT(0x2215439C4);
    }
    __cxa_end_catch();
    atomic_fetch_add((atomic_uint *volatile)(v2 + 72), 0xFFFFFFFF);
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      JUMPOUT(0x221543A6CLL);
    }
    JUMPOUT(0x2215439D8);
  }
  _Unwind_Resume(a1);
}

void alSourcefv(ALuint sid, ALenum param, const ALfloat *values)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  __int16 v6 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  if (v6)
  {
    int v7 = v6;
    switch(param)
    {
      case 4097:
        ALenum v8 = OALSource::SetConeInnerAngle(v6, *values);
        goto LABEL_24;
      case 4098:
        ALenum v8 = OALSource::SetConeOuterAngle(v6, *values);
        goto LABEL_24;
      case 4099:
        ALenum v8 = OALSource::SetPitch(v6, *values);
        goto LABEL_24;
      case 4100:
        ALenum v8 = OALSource::SetPosition(v6, *values, values[1], values[2]);
        goto LABEL_24;
      case 4101:
        ALenum v8 = OALSource::SetDirection(v6, *values, values[1], values[2]);
        goto LABEL_24;
      case 4102:
        ALenum v8 = OALSource::SetVelocity(v6, *values, values[1], values[2]);
        goto LABEL_24;
      case 4106:
        ALenum v8 = OALSource::SetGain(v6, *values);
        goto LABEL_24;
      case 4109:
        ALenum v8 = OALSource::SetMinGain(v6, *values);
        goto LABEL_24;
      case 4110:
        ALenum v8 = OALSource::SetMaxGain(v6, *values);
        goto LABEL_24;
      case 4128:
        ALenum v8 = OALSource::SetReferenceDistance(v6, *values);
        goto LABEL_24;
      case 4129:
        ALenum v8 = OALSource::SetRollOffFactor(v6, *values);
        goto LABEL_24;
      case 4130:
        ALenum v8 = OALSource::SetConeOuterGain(v6, *values);
        goto LABEL_24;
      case 4131:
        ALenum v8 = OALSource::SetMaxDistance(v6, *values);
        goto LABEL_24;
      case 4132:
        float v10 = *values;
        int v11 = 1;
        goto LABEL_23;
      case 4133:
        float v10 = *values;
        int v11 = 2;
        goto LABEL_23;
      case 4134:
        float v10 = *values;
        int v11 = 3;
LABEL_23:
        ALenum v8 = OALSource::SetQueueOffset(v6, v11, v10);
LABEL_24:
        ALenum v9 = v8;
        atomic_fetch_add((atomic_uint *volatile)v7 + 18, 0xFFFFFFFF);
        if (v8) {
          goto LABEL_25;
        }
        return;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey)) {
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
        atomic_fetch_add((atomic_uint *volatile)v7 + 18, 0xFFFFFFFF);
        return;
    }
  }
  ALenum v9 = 40963;
LABEL_25:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136316162;
    __int16 v13 = "oalImp.cpp";
    __int16 v14 = 1024;
    int v15 = 1997;
    __int16 v16 = 2048;
    uint64_t v17 = sid;
    __int16 v18 = 2080;
    ALAttributeString = GetALAttributeString(param);
    __int16 v20 = 2080;
    String = alGetString(v9);
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR alSourcefv FAILED: source = %ld property = %s uint64_t result = %s\n", (uint8_t *)&v12, 0x30u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)v9);
  }
}

void alSource3f(ALuint sid, ALenum param, ALfloat value1, ALfloat value2, ALfloat value3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  float v10 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  if (!v10)
  {
    ALenum v12 = 40963;
LABEL_11:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136316930;
      __int16 v14 = "oalImp.cpp";
      __int16 v15 = 1024;
      int v16 = 2036;
      __int16 v17 = 2048;
      uint64_t v18 = sid;
      __int16 v19 = 2080;
      ALAttributeString = GetALAttributeString(param);
      __int16 v21 = 2048;
      double v22 = value1;
      __int16 v23 = 2048;
      double v24 = value2;
      __int16 v25 = 2048;
      double v26 = value3;
      __int16 v27 = 2080;
      String = alGetString(v12);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSource3f FAILED: source %ld : %s : values = %.f2:%.f2:%.f2 error = %s", (uint8_t *)&v13, 0x4Eu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)v12);
    }
    return;
  }
  int v11 = v10;
  switch(param)
  {
    case 4100:
      ALenum v12 = OALSource::SetPosition(v10, value1, value2, value3);
      atomic_fetch_add((atomic_uint *volatile)v11 + 18, 0xFFFFFFFF);
      if (!v12) {
        return;
      }
      goto LABEL_11;
    case 4102:
      ALenum v12 = OALSource::SetVelocity(v10, value1, value2, value3);
      atomic_fetch_add((atomic_uint *volatile)v11 + 18, 0xFFFFFFFF);
      if (!v12) {
        return;
      }
      goto LABEL_11;
    case 4101:
      ALenum v12 = OALSource::SetDirection(v10, value1, value2, value3);
      atomic_fetch_add((atomic_uint *volatile)v11 + 18, 0xFFFFFFFF);
      if (!v12) {
        return;
      }
      goto LABEL_11;
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
  }
  atomic_fetch_add((atomic_uint *volatile)v11 + 18, 0xFFFFFFFF);
}

void alSourcei(ALuint sid, ALenum param, ALint value)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  __int16 v6 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  if (v6)
  {
    int v7 = (atomic_uint *)v6;
    switch(param)
    {
      case 4097:
        ALenum v8 = OALSource::SetConeInnerAngle(v6, (float)value);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (v8) {
          goto LABEL_48;
        }
        return;
      case 4098:
        ALenum v8 = OALSource::SetConeOuterAngle(v6, (float)value);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (v8) {
          goto LABEL_48;
        }
        return;
      case 4099:
      case 4100:
      case 4101:
      case 4102:
      case 4104:
      case 4106:
      case 4107:
      case 4108:
      case 4109:
      case 4110:
      case 4111:
      case 4112:
      case 4113:
      case 4114:
      case 4115:
      case 4116:
      case 4117:
      case 4118:
      case 4119:
      case 4120:
      case 4121:
      case 4122:
      case 4123:
      case 4124:
      case 4125:
      case 4126:
      case 4127:
        goto LABEL_10;
      case 4103:
        ALenum v8 = OALSource::SetLooping(v6, value);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_48;
      case 4105:
        int SourceType = OALSource::GetSourceType(v6);
        if (value && SourceType == 4137 || !alIsBuffer(value))
        {
          atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
          ALenum v8 = 40964;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_49;
          }
          goto LABEL_50;
        }
        if (!gOALBufferMap) {
          goto LABEL_34;
        }
        *(void *)uint64_t v18 = gBufferMapLock;
        v18[8] = (*(uint64_t (**)(uint64_t))(*(void *)gBufferMapLock + 16))(gBufferMapLock);
        uint64_t v10 = *(void *)(gOALBufferMap + 8);
        if (!v10) {
          goto LABEL_31;
        }
        uint64_t v11 = gOALBufferMap + 8;
        do
        {
          unsigned int v12 = *(_DWORD *)(v10 + 32);
          BOOL v13 = v12 >= value;
          if (v12 >= value) {
            __int16 v14 = (uint64_t *)v10;
          }
          else {
            __int16 v14 = (uint64_t *)(v10 + 8);
          }
          if (v13) {
            uint64_t v11 = v10;
          }
          uint64_t v10 = *v14;
        }
        while (*v14);
        if (v11 != gOALBufferMap + 8 && *(_DWORD *)(v11 + 32) <= value) {
          __int16 v15 = *(OALBuffer **)(v11 + 40);
        }
        else {
LABEL_31:
        }
          __int16 v15 = 0;
        ALenum v8 = OALSource::SetBuffer((OALSource *)v7, value, v15);
        CAGuard::Locker::~Locker((CAGuard::Locker *)v18);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (v8) {
          goto LABEL_48;
        }
        return;
      case 4128:
        ALenum v8 = OALSource::SetReferenceDistance(v6, (float)value);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_48;
      case 4129:
        ALenum v8 = OALSource::SetRollOffFactor(v6, (float)value);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_48;
      case 4130:
        ALenum v8 = OALSource::SetConeOuterGain(v6, (float)value);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_48;
      case 4131:
        ALenum v8 = OALSource::SetMaxDistance(v6, (float)value);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_48;
      case 4132:
        ALenum v8 = OALSource::SetQueueOffset(v6, 1, (float)value);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_48;
      case 4133:
        ALenum v8 = OALSource::SetQueueOffset(v6, 2, (float)value);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_48;
      case 4134:
        ALenum v8 = OALSource::SetQueueOffset(v6, 3, (float)value);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (v8) {
          goto LABEL_48;
        }
        return;
      default:
        if (param != 514)
        {
LABEL_10:
          pthread_once(&gErrorOnce, ErrorKeyInitializer);
          if (!pthread_getspecific(gALErrorKey)) {
            pthread_setspecific(gALErrorKey, (const void *)0xA002);
          }
LABEL_34:
          atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
          return;
        }
        ALenum v8 = OALSource::SetSourceRelative(v6, value);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
LABEL_48:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_49;
        }
        goto LABEL_50;
    }
  }
  ALenum v8 = 40963;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
LABEL_49:
    ALAttributeString = GetALAttributeString(param);
    String = alGetString(v8);
    *(_DWORD *)uint64_t v18 = 136316418;
    *(void *)&v18[4] = "oalImp.cpp";
    __int16 v19 = 1024;
    int v20 = 2114;
    __int16 v21 = 2048;
    uint64_t v22 = sid;
    __int16 v23 = 2080;
    double v24 = ALAttributeString;
    __int16 v25 = 2048;
    uint64_t v26 = value;
    __int16 v27 = 2080;
    __int16 v28 = String;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourcei FAILED - sid:pname:value:result %ld:%s:%ld:%s", v18, 0x3Au);
  }
LABEL_50:
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)v8);
  }
}

void sub_221544664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void alSourceiv(ALuint sid, ALenum param, const ALint *values)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  __int16 v6 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  if (v6)
  {
    int v7 = (atomic_uint *)v6;
    switch(param)
    {
      case 4097:
        ALenum v8 = OALSource::SetConeInnerAngle(v6, (float)*values);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (v8) {
          goto LABEL_52;
        }
        return;
      case 4098:
        ALenum v8 = OALSource::SetConeOuterAngle(v6, (float)*values);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (v8) {
          goto LABEL_52;
        }
        return;
      case 4099:
      case 4104:
      case 4106:
      case 4107:
      case 4108:
      case 4109:
      case 4110:
      case 4111:
      case 4112:
      case 4113:
      case 4114:
      case 4115:
      case 4116:
      case 4117:
      case 4118:
      case 4119:
      case 4120:
      case 4121:
      case 4122:
      case 4123:
      case 4124:
      case 4125:
      case 4126:
      case 4127:
      case 4130:
        goto LABEL_11;
      case 4100:
        ALenum v8 = OALSource::SetPosition(v6, (float)*values, (float)values[1], (float)values[2]);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_52;
      case 4101:
        ALenum v8 = OALSource::SetDirection(v6, (float)*values, (float)values[1], (float)values[2]);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_52;
      case 4102:
        ALenum v8 = OALSource::SetVelocity(v6, (float)*values, (float)values[1], (float)values[2]);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_52;
      case 4103:
        ALenum v8 = OALSource::SetLooping(v6, *values);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_52;
      case 4105:
        if (OALSource::GetSourceType(v6) == 4137 || !alIsBuffer(*values))
        {
          ALenum v8 = 40964;
          goto LABEL_59;
        }
        if (!gOALBufferMap) {
          goto LABEL_46;
        }
        *(void *)uint64_t v18 = gBufferMapLock;
        v18[8] = (*(uint64_t (**)(uint64_t))(*(void *)gBufferMapLock + 16))(gBufferMapLock);
        unsigned int v9 = *values;
        uint64_t v10 = *(void *)(gOALBufferMap + 8);
        if (!v10) {
          goto LABEL_43;
        }
        uint64_t v11 = gOALBufferMap + 8;
        do
        {
          unsigned int v12 = *(_DWORD *)(v10 + 32);
          BOOL v13 = v12 >= v9;
          if (v12 >= v9) {
            __int16 v14 = (uint64_t *)v10;
          }
          else {
            __int16 v14 = (uint64_t *)(v10 + 8);
          }
          if (v13) {
            uint64_t v11 = v10;
          }
          uint64_t v10 = *v14;
        }
        while (*v14);
        if (v11 != gOALBufferMap + 8 && *(_DWORD *)(v11 + 32) <= v9) {
          __int16 v15 = *(OALBuffer **)(v11 + 40);
        }
        else {
LABEL_43:
        }
          __int16 v15 = 0;
        ALenum v8 = OALSource::SetBuffer((OALSource *)v7, v9, v15);
        CAGuard::Locker::~Locker((CAGuard::Locker *)v18);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_52;
      case 4128:
        ALenum v8 = OALSource::SetReferenceDistance(v6, (float)*values);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_52;
      case 4129:
        ALenum v8 = OALSource::SetRollOffFactor(v6, (float)*values);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_52;
      case 4131:
        ALenum v8 = OALSource::SetMaxDistance(v6, (float)*values);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (v8) {
          goto LABEL_52;
        }
        return;
      case 4132:
        ALenum v8 = OALSource::SetQueueOffset(v6, 1, (float)*values);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_52;
      case 4133:
        ALenum v8 = OALSource::SetQueueOffset(v6, 2, (float)*values);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_52;
      case 4134:
        ALenum v8 = OALSource::SetQueueOffset(v6, 3, (float)*values);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
        goto LABEL_52;
      default:
        if (param != 514)
        {
LABEL_11:
          pthread_once(&gErrorOnce, ErrorKeyInitializer);
          if (!pthread_getspecific(gALErrorKey)) {
            pthread_setspecific(gALErrorKey, (const void *)0xA002);
          }
LABEL_46:
          atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
          return;
        }
        if (*values > 1u)
        {
          ALenum v8 = 40963;
LABEL_59:
          atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_53;
          }
          goto LABEL_54;
        }
        ALenum v8 = OALSource::SetSourceRelative(v6, *values);
        atomic_fetch_add(v7 + 18, 0xFFFFFFFF);
        if (!v8) {
          return;
        }
LABEL_52:
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_54;
        }
        break;
    }
    goto LABEL_53;
  }
  ALenum v8 = 40963;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
LABEL_53:
    ALAttributeString = GetALAttributeString(param);
    String = alGetString(v8);
    *(_DWORD *)uint64_t v18 = 136316162;
    *(void *)&v18[4] = "oalImp.cpp";
    __int16 v19 = 1024;
    int v20 = 2204;
    __int16 v21 = 2048;
    uint64_t v22 = sid;
    __int16 v23 = 2080;
    double v24 = ALAttributeString;
    __int16 v25 = 2080;
    uint64_t v26 = String;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourcei FAILED: source %ld : %s error = %s", v18, 0x30u);
  }
LABEL_54:
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)v8);
  }
}

void sub_221544C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void alSource3i(ALuint sid, ALenum param, ALint value1, ALint value2, ALint value3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v10 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  if (!v10)
  {
    ALenum v12 = 40963;
LABEL_11:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136316930;
      __int16 v14 = "oalImp.cpp";
      __int16 v15 = 1024;
      int v16 = 2243;
      __int16 v17 = 2048;
      uint64_t v18 = sid;
      __int16 v19 = 2080;
      ALAttributeString = GetALAttributeString(param);
      __int16 v21 = 2048;
      uint64_t v22 = value1;
      __int16 v23 = 2048;
      uint64_t v24 = value2;
      __int16 v25 = 2048;
      uint64_t v26 = value3;
      __int16 v27 = 2080;
      String = alGetString(v12);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSource3f FAILED: source %ld : %s : values = %ld:%ld:%ld error = %s", (uint8_t *)&v13, 0x4Eu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)v12);
    }
    return;
  }
  uint64_t v11 = v10;
  switch(param)
  {
    case 4100:
      ALenum v12 = OALSource::SetPosition(v10, (float)value1, (float)value2, (float)value3);
      atomic_fetch_add((atomic_uint *volatile)v11 + 18, 0xFFFFFFFF);
      if (!v12) {
        return;
      }
      goto LABEL_11;
    case 4102:
      ALenum v12 = OALSource::SetVelocity(v10, (float)value1, (float)value2, (float)value3);
      atomic_fetch_add((atomic_uint *volatile)v11 + 18, 0xFFFFFFFF);
      if (!v12) {
        return;
      }
      goto LABEL_11;
    case 4101:
      ALenum v12 = OALSource::SetDirection(v10, (float)value1, (float)value2, (float)value3);
      atomic_fetch_add((atomic_uint *volatile)v11 + 18, 0xFFFFFFFF);
      if (!v12) {
        return;
      }
      goto LABEL_11;
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA002);
  }
  atomic_fetch_add((atomic_uint *volatile)v11 + 18, 0xFFFFFFFF);
}

void alGetSourcef(ALuint sid, ALenum param, ALfloat *value)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v5 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  if (v5)
  {
    __int16 v6 = v5;
    switch(param)
    {
      case 4097:
        float ConeInnerAngle = OALSource::GetConeInnerAngle(v5);
        goto LABEL_23;
      case 4098:
        float ConeInnerAngle = OALSource::GetConeOuterAngle(v5);
        goto LABEL_23;
      case 4099:
        float ConeInnerAngle = OALSource::GetPitch(v5);
        goto LABEL_23;
      case 4106:
        float ConeInnerAngle = OALSource::GetGain(v5);
        goto LABEL_23;
      case 4109:
        float ConeInnerAngle = OALSource::GetMinGain(v5);
        goto LABEL_23;
      case 4110:
        float ConeInnerAngle = OALSource::GetMaxGain(v5);
        goto LABEL_23;
      case 4128:
        float ConeInnerAngle = OALSource::GetReferenceDistance(v5);
        goto LABEL_23;
      case 4129:
        float ConeInnerAngle = OALSource::GetRollOffFactor(v5);
        goto LABEL_23;
      case 4130:
        float ConeInnerAngle = OALSource::GetConeOuterGain(v5);
        goto LABEL_23;
      case 4131:
        float ConeInnerAngle = OALSource::GetMaxDistance(v5);
        goto LABEL_23;
      case 4132:
        float ConeInnerAngle = OALSource::GetQueueOffsetSecondsFloat(v5);
        goto LABEL_23;
      case 4133:
        int v8 = 2;
        goto LABEL_22;
      case 4134:
        int v8 = 3;
LABEL_22:
        float ConeInnerAngle = (float)OALSource::GetQueueOffset(v5, v8);
LABEL_23:
        *value = ConeInnerAngle;
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey)) {
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
        break;
    }
    atomic_fetch_add((atomic_uint *volatile)v6 + 18, 0xFFFFFFFF);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315650;
      uint64_t v10 = "oalImp.cpp";
      __int16 v11 = 1024;
      int v12 = 2313;
      __int16 v13 = 2080;
      String = alGetString(40963);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetSourcef FAILED = %s\n", (uint8_t *)&v9, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
  }
}

void alGetSourcefv(ALuint sid, ALenum param, ALfloat *values)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v5 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  if (v5)
  {
    __int16 v6 = v5;
    switch(param)
    {
      case 4097:
        float ConeInnerAngle = OALSource::GetConeInnerAngle(v5);
        goto LABEL_26;
      case 4098:
        float ConeInnerAngle = OALSource::GetConeOuterAngle(v5);
        goto LABEL_26;
      case 4099:
        float ConeInnerAngle = OALSource::GetPitch(v5);
        goto LABEL_26;
      case 4100:
        OALSource::GetPosition(v5, values, values + 1, values + 2);
        break;
      case 4101:
        OALSource::GetDirection(v5, values, values + 1, values + 2);
        break;
      case 4102:
        OALSource::GetVelocity(v5, values, values + 1, values + 2);
        break;
      case 4106:
        float ConeInnerAngle = OALSource::GetGain(v5);
        goto LABEL_26;
      case 4109:
        float ConeInnerAngle = OALSource::GetMinGain(v5);
        goto LABEL_26;
      case 4110:
        float ConeInnerAngle = OALSource::GetMaxGain(v5);
        goto LABEL_26;
      case 4128:
        float ConeInnerAngle = OALSource::GetReferenceDistance(v5);
        goto LABEL_26;
      case 4129:
        float ConeInnerAngle = OALSource::GetRollOffFactor(v5);
        goto LABEL_26;
      case 4130:
        float ConeInnerAngle = OALSource::GetConeOuterGain(v5);
        goto LABEL_26;
      case 4131:
        float ConeInnerAngle = OALSource::GetMaxDistance(v5);
        goto LABEL_26;
      case 4132:
        float ConeInnerAngle = OALSource::GetQueueOffsetSecondsFloat(v5);
        goto LABEL_26;
      case 4133:
        int v8 = 2;
        goto LABEL_25;
      case 4134:
        int v8 = 3;
LABEL_25:
        float ConeInnerAngle = (float)OALSource::GetQueueOffset(v5, v8);
LABEL_26:
        *values = ConeInnerAngle;
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey)) {
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
        break;
    }
    atomic_fetch_add((atomic_uint *volatile)v6 + 18, 0xFFFFFFFF);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315650;
      uint64_t v10 = "oalImp.cpp";
      __int16 v11 = 1024;
      int v12 = 2392;
      __int16 v13 = 2080;
      String = alGetString(40963);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetSourcefv FAILED = %s\n", (uint8_t *)&v9, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
  }
}

void alGetSource3f(ALuint sid, ALenum param, ALfloat *value1, ALfloat *value2, ALfloat *value3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v9 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  if (v9)
  {
    uint64_t v10 = v9;
    switch(param)
    {
      case 4100:
        OALSource::GetPosition(v9, value1, value2, value3);
        break;
      case 4102:
        OALSource::GetVelocity(v9, value1, value2, value3);
        break;
      case 4101:
        OALSource::GetDirection(v9, value1, value2, value3);
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey)) {
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
        break;
    }
    atomic_fetch_add((atomic_uint *volatile)v10 + 18, 0xFFFFFFFF);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315650;
      int v12 = "oalImp.cpp";
      __int16 v13 = 1024;
      int v14 = 2431;
      __int16 v15 = 2080;
      String = alGetString(40963);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetSource3f FAILED = %s\n", (uint8_t *)&v11, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
  }
}

void alGetSourcei(ALuint sid, ALenum param, ALint *value)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v5 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  if (v5)
  {
    __int16 v6 = v5;
    switch(param)
    {
      case 4097:
        float ConeInnerAngle = OALSource::GetConeInnerAngle(v5);
        goto LABEL_21;
      case 4098:
        float ConeInnerAngle = OALSource::GetConeOuterAngle(v5);
        goto LABEL_21;
      case 4099:
      case 4100:
      case 4101:
      case 4102:
      case 4104:
      case 4106:
      case 4107:
      case 4108:
      case 4109:
      case 4110:
      case 4111:
      case 4113:
      case 4114:
      case 4115:
      case 4116:
      case 4119:
      case 4120:
      case 4121:
      case 4122:
      case 4123:
      case 4124:
      case 4125:
      case 4126:
      case 4127:
        goto LABEL_10;
      case 4103:
        ALint Looping = OALSource::GetLooping(v5);
        goto LABEL_29;
      case 4105:
        ALint Looping = OALSource::GetBuffer(v5);
        goto LABEL_29;
      case 4112:
        ALint Looping = OALSource::GetState(v5);
        goto LABEL_29;
      case 4117:
        ALint Looping = OALSource::GetQLength(v5);
        goto LABEL_29;
      case 4118:
        ALint Looping = OALSource::GetBuffersProcessed(v5);
        goto LABEL_29;
      case 4128:
        float ReferenceDistance = OALSource::GetReferenceDistance(v5);
        goto LABEL_23;
      case 4129:
        float ReferenceDistance = OALSource::GetRollOffFactor(v5);
        goto LABEL_23;
      case 4130:
        float ConeInnerAngle = OALSource::GetConeOuterGain(v5);
LABEL_21:
        *value = ConeInnerAngle;
        goto LABEL_30;
      case 4131:
        float ReferenceDistance = OALSource::GetMaxDistance(v5);
LABEL_23:
        *value = (int)ReferenceDistance;
        goto LABEL_30;
      case 4132:
        int v10 = 1;
        goto LABEL_27;
      case 4133:
        int v10 = 2;
        goto LABEL_27;
      case 4134:
        int v10 = 3;
LABEL_27:
        ALint Looping = OALSource::GetQueueOffset(v5, v10);
        goto LABEL_29;
      case 4135:
        ALint Looping = OALSource::GetSourceType(v5);
        goto LABEL_29;
      default:
        if (param == 514)
        {
          ALint Looping = OALSource::GetSourceRelative(v5);
LABEL_29:
          *value = Looping;
        }
        else
        {
LABEL_10:
          pthread_once(&gErrorOnce, ErrorKeyInitializer);
          if (!pthread_getspecific(gALErrorKey)) {
            pthread_setspecific(gALErrorKey, (const void *)0xA002);
          }
        }
LABEL_30:
        atomic_fetch_add((atomic_uint *volatile)v6 + 18, 0xFFFFFFFF);
        break;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315650;
      int v12 = "oalImp.cpp";
      __int16 v13 = 1024;
      int v14 = 2508;
      __int16 v15 = 2080;
      String = alGetString(40963);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetSourcei FAILED = %s\n", (uint8_t *)&v11, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
  }
}

void alGetSourceiv(ALuint sid, ALenum param, ALint *values)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v5 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  if (v5)
  {
    __int16 v6 = v5;
    switch(param)
    {
      case 4097:
        float ConeInnerAngle = OALSource::GetConeInnerAngle(v5);
        goto LABEL_13;
      case 4098:
        float ConeInnerAngle = OALSource::GetConeOuterAngle(v5);
LABEL_13:
        *values = ConeInnerAngle;
        goto LABEL_32;
      case 4099:
      case 4104:
      case 4106:
      case 4107:
      case 4108:
      case 4109:
      case 4110:
      case 4111:
      case 4113:
      case 4114:
      case 4115:
      case 4116:
      case 4119:
      case 4120:
      case 4121:
      case 4122:
      case 4123:
      case 4124:
      case 4125:
      case 4126:
      case 4127:
      case 4130:
        goto LABEL_10;
      case 4100:
        OALSource::GetPosition(v5, (float *)values, (float *)values + 1, (float *)values + 2);
        goto LABEL_32;
      case 4101:
        OALSource::GetDirection(v5, (float *)values, (float *)values + 1, (float *)values + 2);
        goto LABEL_32;
      case 4102:
        OALSource::GetVelocity(v5, (float *)values, (float *)values + 1, (float *)values + 2);
        goto LABEL_32;
      case 4103:
        ALint Looping = OALSource::GetLooping(v5);
        goto LABEL_31;
      case 4105:
        ALint Looping = OALSource::GetBuffer(v5);
        goto LABEL_31;
      case 4112:
        ALint Looping = OALSource::GetState(v5);
        goto LABEL_31;
      case 4117:
        ALint Looping = OALSource::GetQLength(v5);
        goto LABEL_31;
      case 4118:
        ALint Looping = OALSource::GetBuffersProcessed(v5);
        goto LABEL_31;
      case 4128:
        float ReferenceDistance = OALSource::GetReferenceDistance(v5);
        goto LABEL_25;
      case 4129:
        float ReferenceDistance = OALSource::GetRollOffFactor(v5);
        goto LABEL_25;
      case 4131:
        float ReferenceDistance = OALSource::GetMaxDistance(v5);
LABEL_25:
        *values = (int)ReferenceDistance;
        goto LABEL_32;
      case 4132:
        int v10 = 1;
        goto LABEL_29;
      case 4133:
        int v10 = 2;
        goto LABEL_29;
      case 4134:
        int v10 = 3;
LABEL_29:
        ALint Looping = OALSource::GetQueueOffset(v5, v10);
        goto LABEL_31;
      case 4135:
        ALint Looping = OALSource::GetSourceType(v5);
        goto LABEL_31;
      default:
        if (param == 514)
        {
          ALint Looping = OALSource::GetSourceRelative(v5);
LABEL_31:
          *values = Looping;
        }
        else
        {
LABEL_10:
          pthread_once(&gErrorOnce, ErrorKeyInitializer);
          if (!pthread_getspecific(gALErrorKey)) {
            pthread_setspecific(gALErrorKey, (const void *)0xA002);
          }
        }
LABEL_32:
        atomic_fetch_add((atomic_uint *volatile)v6 + 18, 0xFFFFFFFF);
        break;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315650;
      int v12 = "oalImp.cpp";
      __int16 v13 = 1024;
      int v14 = 2592;
      __int16 v15 = 2080;
      String = alGetString(40963);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetSourcefv FAILED = %s\n", (uint8_t *)&v11, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
  }
}

void alGetSource3i(ALuint sid, ALenum param, ALint *value1, ALint *value2, ALint *value3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v9 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  if (v9)
  {
    int v10 = v9;
    switch(param)
    {
      case 4100:
        OALSource::GetPosition(v9, (float *)value1, (float *)value2, (float *)value3);
        break;
      case 4102:
        OALSource::GetVelocity(v9, (float *)value1, (float *)value2, (float *)value3);
        break;
      case 4101:
        OALSource::GetDirection(v9, (float *)value1, (float *)value2, (float *)value3);
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey)) {
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
        break;
    }
    atomic_fetch_add((atomic_uint *volatile)v10 + 18, 0xFFFFFFFF);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315650;
      int v12 = "oalImp.cpp";
      __int16 v13 = 1024;
      int v14 = 2631;
      __int16 v15 = 2080;
      String = alGetString(40963);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetSource3f FAILED = %s\n", (uint8_t *)&v11, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
  }
}

void alSourcePlay(ALuint sid)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315650;
    int v7 = "oalImp.cpp";
    __int16 v8 = 1024;
    int v9 = 2639;
    __int16 v10 = 2048;
    int v11 = (const ALchar *)sid;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourcePlay--> source %ld", (uint8_t *)&v6, 0x1Cu);
  }
  uint64_t v2 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  if (v2)
  {
    int v3 = v2;
    ALenum v4 = OALSource::Play(v2);
    atomic_fetch_add((atomic_uint *volatile)v3 + 18, 0xFFFFFFFF);
    if (!v4) {
      return;
    }
  }
  else
  {
    ALenum v4 = 40963;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    String = alGetString(v4);
    int v6 = 136315650;
    int v7 = "oalImp.cpp";
    __int16 v8 = 1024;
    int v9 = 2653;
    __int16 v10 = 2080;
    int v11 = String;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourcePlay FAILED = %s\n", (uint8_t *)&v6, 0x1Cu);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)v4);
  }
}

void alSourcePause(ALuint sid)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315650;
    int v6 = "oalImp.cpp";
    __int16 v7 = 1024;
    int v8 = 2661;
    __int16 v9 = 2048;
    __int16 v10 = (const ALchar *)sid;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourcePause--> source %ld", (uint8_t *)&v5, 0x1Cu);
  }
  uint64_t v2 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  int v3 = v2;
  if (v2)
  {
    OALSource::Pause(v2);
    atomic_fetch_add((atomic_uint *volatile)v3 + 18, 0xFFFFFFFF);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(40963);
      int v5 = 136315650;
      int v6 = "oalImp.cpp";
      __int16 v7 = 1024;
      int v8 = 2676;
      __int16 v9 = 2080;
      __int16 v10 = String;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourcePause FAILED = %s\n", (uint8_t *)&v5, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
  }
}

void alSourceRewind(ALuint sid)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315650;
    int v6 = "oalImp.cpp";
    __int16 v7 = 1024;
    int v8 = 2706;
    __int16 v9 = 2048;
    __int16 v10 = (const ALchar *)sid;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceRewind--> source %ld", (uint8_t *)&v5, 0x1Cu);
  }
  uint64_t v2 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  int v3 = v2;
  if (v2)
  {
    OALSource::Rewind(v2);
    atomic_fetch_add((atomic_uint *volatile)v3 + 18, 0xFFFFFFFF);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(40963);
      int v5 = 136315650;
      int v6 = "oalImp.cpp";
      __int16 v7 = 1024;
      int v8 = 2720;
      __int16 v9 = 2080;
      __int16 v10 = String;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceRewind FAILED = %s\n", (uint8_t *)&v5, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
  }
}

void alSourcePlayv(ALsizei ns, const ALuint *sids)
{
  LODWORD(v3) = ns;
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    int v6 = "oalImp.cpp";
    __int16 v7 = 1024;
    int v8 = 2728;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourcePlayv", (uint8_t *)&v5, 0x12u);
  }
  if (v3)
  {
    uint64_t v3 = v3;
    do
    {
      ALuint v4 = *sids++;
      alSourcePlay(v4);
      --v3;
    }
    while (v3);
  }
}

void alSourcePausev(ALsizei ns, const ALuint *sids)
{
  LODWORD(v3) = ns;
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    int v6 = "oalImp.cpp";
    __int16 v7 = 1024;
    int v8 = 2744;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourcePausev", (uint8_t *)&v5, 0x12u);
  }
  if (v3)
  {
    uint64_t v3 = v3;
    do
    {
      ALuint v4 = *sids++;
      alSourcePause(v4);
      --v3;
    }
    while (v3);
  }
}

void alSourceStopv(ALsizei ns, const ALuint *sids)
{
  LODWORD(v3) = ns;
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    int v6 = "oalImp.cpp";
    __int16 v7 = 1024;
    int v8 = 2760;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceStopv", (uint8_t *)&v5, 0x12u);
  }
  if (v3)
  {
    uint64_t v3 = v3;
    do
    {
      ALuint v4 = *sids++;
      alSourceStop(v4);
      --v3;
    }
    while (v3);
  }
}

void alSourceRewindv(ALsizei ns, const ALuint *sids)
{
  LODWORD(v3) = ns;
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    int v6 = "oalImp.cpp";
    __int16 v7 = 1024;
    int v8 = 2776;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceRewindv", (uint8_t *)&v5, 0x12u);
  }
  if (v3)
  {
    uint64_t v3 = v3;
    do
    {
      ALuint v4 = *sids++;
      alSourceRewind(v4);
      --v3;
    }
    while (v3);
  }
}

void alSourceQueueBuffers(ALuint sid, ALsizei numEntries, const ALuint *bids)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (!numEntries) {
    return;
  }
  if (!gOALBufferMap)
  {
LABEL_25:
    ALenum v18 = 40964;
    goto LABEL_85;
  }
  LODWORD(v4) = numEntries;
  int v5 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
  if (v5)
  {
    int v6 = (atomic_uint *)v5;
    if (OALSource::IsSourceTransitioningToFlushQ(v5))
    {
      uint64_t v7 = gBufferMapLock;
      *(void *)uint64_t v44 = gBufferMapLock;
      int v8 = (*(uint64_t (**)(uint64_t))(*(void *)gBufferMapLock + 16))(gBufferMapLock);
      unint64_t v9 = 0;
      v44[8] = v8;
      __int16 v10 = (uint64_t *)(gOALBufferMap + 8);
      BOOL v11 = 1;
      do
      {
        ALuint v12 = bids[v9];
        if (v12)
        {
          uint64_t v13 = *v10;
          if (!*v10)
          {
            ALenum v18 = 40963;
            goto LABEL_59;
          }
          uint64_t v14 = gOALBufferMap + 8;
          do
          {
            ALuint v15 = *(_DWORD *)(v13 + 32);
            BOOL v16 = v15 >= v12;
            if (v15 >= v12) {
              uint64_t v17 = (uint64_t *)v13;
            }
            else {
              uint64_t v17 = (uint64_t *)(v13 + 8);
            }
            if (v16) {
              uint64_t v14 = v13;
            }
            uint64_t v13 = *v17;
          }
          while (*v17);
          if ((uint64_t *)v14 == v10 || *(_DWORD *)(v14 + 32) > v12 || !*(void *)(v14 + 40))
          {
            ALenum v18 = 40963;
            if (!v11) {
              goto LABEL_44;
            }
            goto LABEL_59;
          }
        }
        BOOL v11 = ++v9 < v4;
      }
      while (v9 != v4);
      ALenum v18 = 0;
      if (v9 >= v4)
      {
LABEL_44:
        ALuint v29 = *bids;
        uint64_t v30 = *(void *)(gOALBufferMap + 8);
        if (!v30) {
          goto LABEL_55;
        }
        uint64_t v31 = gOALBufferMap + 8;
        do
        {
          ALuint v32 = *(_DWORD *)(v30 + 32);
          BOOL v33 = v32 >= v29;
          if (v32 >= v29) {
            int v34 = (uint64_t *)v30;
          }
          else {
            int v34 = (uint64_t *)(v30 + 8);
          }
          if (v33) {
            uint64_t v31 = v30;
          }
          uint64_t v30 = *v34;
        }
        while (*v34);
        if (v31 != gOALBufferMap + 8 && *(_DWORD *)(v31 + 32) <= v29) {
          int v35 = *(OALBuffer **)(v31 + 40);
        }
        else {
LABEL_55:
        }
          int v35 = 0;
        OALSource::AddToTempQueue((OALSource *)v6, v29, v35);
      }
LABEL_59:
      if (v8) {
LABEL_83:
      }
        (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
LABEL_84:
      atomic_fetch_add(v6 + 18, 0xFFFFFFFF);
      if (!v18) {
        return;
      }
      goto LABEL_85;
    }
    if (OALSource::GetSourceType((OALSource *)v6) != 4136)
    {
      uint64_t v7 = gBufferMapLock;
      *(void *)uint64_t v44 = gBufferMapLock;
      int v19 = (*(uint64_t (**)(uint64_t))(*(void *)gBufferMapLock + 16))(gBufferMapLock);
      unint64_t v20 = 0;
      v44[8] = v19;
      __int16 v21 = (uint64_t *)(gOALBufferMap + 8);
      BOOL v22 = 1;
      do
      {
        ALuint v23 = bids[v20];
        if (v23)
        {
          uint64_t v24 = *v21;
          if (!*v21)
          {
            ALenum v18 = 40963;
            goto LABEL_82;
          }
          uint64_t v25 = gOALBufferMap + 8;
          do
          {
            ALuint v26 = *(_DWORD *)(v24 + 32);
            BOOL v27 = v26 >= v23;
            if (v26 >= v23) {
              __int16 v28 = (uint64_t *)v24;
            }
            else {
              __int16 v28 = (uint64_t *)(v24 + 8);
            }
            if (v27) {
              uint64_t v25 = v24;
            }
            uint64_t v24 = *v28;
          }
          while (*v28);
          if ((uint64_t *)v25 == v21 || *(_DWORD *)(v25 + 32) > v23 || !*(void *)(v25 + 40))
          {
            ALenum v18 = 40963;
            if (v22) {
              goto LABEL_82;
            }
            goto LABEL_62;
          }
        }
        BOOL v22 = ++v20 < v4;
      }
      while (v20 != v4);
      ALenum v18 = 0;
      if (v20 < v4) {
        goto LABEL_82;
      }
LABEL_62:
      uint64_t v36 = 0;
      if (v4 <= 1) {
        uint64_t v4 = 1;
      }
      else {
        uint64_t v4 = v4;
      }
      while (1)
      {
        unsigned int v37 = bids[v36];
        uint64_t v38 = *(void *)(gOALBufferMap + 8);
        if (!v38) {
          goto LABEL_76;
        }
        uint64_t v39 = gOALBufferMap + 8;
        do
        {
          unsigned int v40 = *(_DWORD *)(v38 + 32);
          BOOL v41 = v40 >= v37;
          if (v40 >= v37) {
            BOOL v42 = (uint64_t *)v38;
          }
          else {
            BOOL v42 = (uint64_t *)(v38 + 8);
          }
          if (v41) {
            uint64_t v39 = v38;
          }
          uint64_t v38 = *v42;
        }
        while (*v42);
        if (v39 != gOALBufferMap + 8 && *(_DWORD *)(v39 + 32) <= v37) {
          int v43 = *(OALBuffer **)(v39 + 40);
        }
        else {
LABEL_76:
        }
          int v43 = 0;
        ALenum v18 = OALSource::AddToQueue((OALSource *)v6, v37, v43);
        if (v18) {
          break;
        }
        if (++v36 == v4)
        {
          ALenum v18 = 0;
          break;
        }
      }
LABEL_82:
      if (v19) {
        goto LABEL_83;
      }
      goto LABEL_84;
    }
    atomic_fetch_add(v6 + 18, 0xFFFFFFFF);
    goto LABEL_25;
  }
  ALenum v18 = 40963;
LABEL_85:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v44 = 136315650;
    *(void *)&v44[4] = "oalImp.cpp";
    __int16 v45 = 1024;
    int v46 = 2867;
    __int16 v47 = 2080;
    String = alGetString(v18);
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceQueueBuffers FAILED = %s\n", v44, 0x1Cu);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)v18);
  }
}

void sub_221546CA4(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_221546CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void alSourceUnqueueBuffers(ALuint sid, ALsizei numEntries, ALuint *bids)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!numEntries) {
    return;
  }
  if (bids)
  {
    if (!gOALBufferMap)
    {
      ALenum v7 = 40964;
      goto LABEL_10;
    }
    int v5 = (OALSource *)ProtectSourceObjectInCurrentContext(sid);
    if (v5)
    {
      int v6 = (atomic_uint *)v5;
      if (OALSource::GetQLength(v5) >= numEntries)
      {
        ALenum v7 = OALSource::RemoveBuffersFromQueue((OALSource *)v6, numEntries, bids);
        atomic_fetch_add(v6 + 18, 0xFFFFFFFF);
        if (!v7) {
          return;
        }
        goto LABEL_10;
      }
      atomic_fetch_add(v6 + 18, 0xFFFFFFFF);
    }
  }
  ALenum v7 = 40963;
LABEL_10:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315650;
    unint64_t v9 = "oalImp.cpp";
    __int16 v10 = 1024;
    int v11 = 2898;
    __int16 v12 = 2080;
    String = alGetString(v7);
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceUnqueueBuffers FAILED = %s\n", (uint8_t *)&v8, 0x1Cu);
  }
  if (bids) {
    bzero(bids, 4 * numEntries);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)v7);
  }
}

void alListenerf(ALenum param, ALfloat value)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!gOALContextMap) {
    goto LABEL_31;
  }
  unint64_t v4 = gCurrentContext;
  uint64_t v5 = gContextMapLock;
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  ALenum v7 = *(void **)(gOALContextMap + 8);
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v8 = gOALContextMap + 8;
  do
  {
    unint64_t v9 = v7[4];
    BOOL v10 = v9 >= v4;
    if (v9 >= v4) {
      int v11 = v7;
    }
    else {
      int v11 = v7 + 1;
    }
    if (v10) {
      uint64_t v8 = (uint64_t)v7;
    }
    ALenum v7 = (void *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(void *)(v8 + 32) <= v4)
  {
    __int16 v12 = *(atomic_uint **)(v8 + 40);
    if (v12) {
      atomic_fetch_add(v12 + 110, 1u);
    }
  }
  else
  {
LABEL_13:
    __int16 v12 = 0;
  }
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
  if (v12)
  {
    if (param == 4106)
    {
      OALContext::SetListenerGain((OALContext *)v12, value);
    }
    else
    {
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey)) {
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
      }
    }
    atomic_fetch_add(v12 + 110, 0xFFFFFFFF);
  }
  else
  {
LABEL_31:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315650;
      uint64_t v14 = "oalImp.cpp";
      __int16 v15 = 1024;
      int v16 = 2948;
      __int16 v17 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alListenerf FAILED = %s\n", (uint8_t *)&v13, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
    }
  }
}

void sub_2215470C4(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alListenerfv(ALenum param, const ALfloat *values)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!gOALContextMap) {
    goto LABEL_20;
  }
  unint64_t v4 = gCurrentContext;
  uint64_t v5 = gContextMapLock;
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  ALenum v7 = *(void **)(gOALContextMap + 8);
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v8 = gOALContextMap + 8;
  do
  {
    unint64_t v9 = v7[4];
    BOOL v10 = v9 >= v4;
    if (v9 >= v4) {
      int v11 = v7;
    }
    else {
      int v11 = v7 + 1;
    }
    if (v10) {
      uint64_t v8 = (uint64_t)v7;
    }
    ALenum v7 = (void *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(void *)(v8 + 32) <= v4)
  {
    __int16 v12 = *(atomic_uint **)(v8 + 40);
    if (v12) {
      atomic_fetch_add(v12 + 110, 1u);
    }
  }
  else
  {
LABEL_13:
    __int16 v12 = 0;
  }
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
  if (v12)
  {
    switch(param)
    {
      case 4100:
        ALenum v13 = OALContext::SetListenerPosition((OALContext *)v12, *values, values[1], values[2]);
        atomic_fetch_add(v12 + 110, 0xFFFFFFFF);
        if (v13) {
          goto LABEL_21;
        }
        break;
      case 4102:
        ALenum v13 = OALContext::SetListenerVelocity((OALContext *)v12, *values, values[1], values[2]);
        atomic_fetch_add(v12 + 110, 0xFFFFFFFF);
        if (v13) {
          goto LABEL_21;
        }
        break;
      case 4106:
        ALenum v13 = OALContext::SetListenerGain((OALContext *)v12, *values);
        atomic_fetch_add(v12 + 110, 0xFFFFFFFF);
        if (v13) {
          goto LABEL_21;
        }
        break;
      case 4111:
        ALenum v13 = OALContext::SetListenerOrientation((OALContext *)v12, *values, values[1], values[2], values[3], values[4], values[5]);
        atomic_fetch_add(v12 + 110, 0xFFFFFFFF);
        if (v13) {
          goto LABEL_21;
        }
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey)) {
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
        atomic_fetch_add(v12 + 110, 0xFFFFFFFF);
        break;
    }
  }
  else
  {
LABEL_20:
    ALenum v13 = 40964;
LABEL_21:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315650;
      __int16 v15 = "oalImp.cpp";
      __int16 v16 = 1024;
      int v17 = 2987;
      __int16 v18 = 2080;
      String = alGetString(v13);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alListenerfv FAILED = %s\n", (uint8_t *)&v14, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)v13);
    }
  }
}

void sub_2215473D4(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alListener3f(ALenum param, ALfloat value1, ALfloat value2, ALfloat value3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!gOALContextMap) {
    goto LABEL_33;
  }
  unint64_t v8 = gCurrentContext;
  uint64_t v9 = gContextMapLock;
  int v10 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  int v11 = *(void **)(gOALContextMap + 8);
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t v12 = gOALContextMap + 8;
  do
  {
    unint64_t v13 = v11[4];
    BOOL v14 = v13 >= v8;
    if (v13 >= v8) {
      __int16 v15 = v11;
    }
    else {
      __int16 v15 = v11 + 1;
    }
    if (v14) {
      uint64_t v12 = (uint64_t)v11;
    }
    int v11 = (void *)*v15;
  }
  while (*v15);
  if (v12 != gOALContextMap + 8 && *(void *)(v12 + 32) <= v8)
  {
    __int16 v16 = *(atomic_uint **)(v12 + 40);
    if (v16) {
      atomic_fetch_add(v16 + 110, 1u);
    }
  }
  else
  {
LABEL_13:
    __int16 v16 = 0;
  }
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
  }
  if (v16)
  {
    if (param == 4102)
    {
      OALContext::SetListenerVelocity((OALContext *)v16, value1, value2, value3);
    }
    else if (param == 4100)
    {
      OALContext::SetListenerPosition((OALContext *)v16, value1, value2, value3);
    }
    else
    {
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey)) {
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
      }
    }
    atomic_fetch_add(v16 + 110, 0xFFFFFFFF);
  }
  else
  {
LABEL_33:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315650;
      __int16 v18 = "oalImp.cpp";
      __int16 v19 = 1024;
      int v20 = 3019;
      __int16 v21 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alListener3f FAILED = %s\n", (uint8_t *)&v17, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
    }
  }
}

void sub_221547698(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alListeneri(ALenum param, ALint value)
{
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
  {
    pthread_key_t v2 = gALErrorKey;
    pthread_setspecific(v2, (const void *)0xA002);
  }
}

void alListeneriv(ALenum param, const ALint *values)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!gOALContextMap) {
    goto LABEL_34;
  }
  unint64_t v4 = gCurrentContext;
  uint64_t v5 = gContextMapLock;
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  ALenum v7 = *(void **)(gOALContextMap + 8);
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v8 = gOALContextMap + 8;
  do
  {
    unint64_t v9 = v7[4];
    BOOL v10 = v9 >= v4;
    if (v9 >= v4) {
      int v11 = v7;
    }
    else {
      int v11 = v7 + 1;
    }
    if (v10) {
      uint64_t v8 = (uint64_t)v7;
    }
    ALenum v7 = (void *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(void *)(v8 + 32) <= v4)
  {
    uint64_t v12 = *(atomic_uint **)(v8 + 40);
    if (v12) {
      atomic_fetch_add(v12 + 110, 1u);
    }
  }
  else
  {
LABEL_13:
    uint64_t v12 = 0;
  }
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
  if (v12)
  {
    switch(param)
    {
      case 4111:
        OALContext::SetListenerOrientation((OALContext *)v12, (float)*values, (float)values[1], (float)values[2], (float)values[3], (float)values[4], (float)values[5]);
        break;
      case 4102:
        OALContext::SetListenerVelocity((OALContext *)v12, (float)*values, (float)values[1], (float)values[2]);
        break;
      case 4100:
        OALContext::SetListenerPosition((OALContext *)v12, (float)*values, (float)values[1], (float)values[2]);
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey)) {
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
        break;
    }
    atomic_fetch_add(v12 + 110, 0xFFFFFFFF);
  }
  else
  {
LABEL_34:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315650;
      BOOL v14 = "oalImp.cpp";
      __int16 v15 = 1024;
      int v16 = 3063;
      __int16 v17 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alListeneriv FAILED = %s\n", (uint8_t *)&v13, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
    }
  }
}

void sub_2215479D4(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alListener3i(ALenum param, ALint value1, ALint value2, ALint value3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!gOALContextMap) {
    goto LABEL_33;
  }
  unint64_t v8 = gCurrentContext;
  uint64_t v9 = gContextMapLock;
  int v10 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  int v11 = *(void **)(gOALContextMap + 8);
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t v12 = gOALContextMap + 8;
  do
  {
    unint64_t v13 = v11[4];
    BOOL v14 = v13 >= v8;
    if (v13 >= v8) {
      __int16 v15 = v11;
    }
    else {
      __int16 v15 = v11 + 1;
    }
    if (v14) {
      uint64_t v12 = (uint64_t)v11;
    }
    int v11 = (void *)*v15;
  }
  while (*v15);
  if (v12 != gOALContextMap + 8 && *(void *)(v12 + 32) <= v8)
  {
    int v16 = *(atomic_uint **)(v12 + 40);
    if (v16) {
      atomic_fetch_add(v16 + 110, 1u);
    }
  }
  else
  {
LABEL_13:
    int v16 = 0;
  }
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
  }
  if (v16)
  {
    if (param == 4102)
    {
      OALContext::SetListenerVelocity((OALContext *)v16, (float)value1, (float)value2, (float)value3);
    }
    else if (param == 4100)
    {
      OALContext::SetListenerPosition((OALContext *)v16, (float)value1, (float)value2, (float)value3);
    }
    else
    {
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey)) {
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
      }
    }
    atomic_fetch_add(v16 + 110, 0xFFFFFFFF);
  }
  else
  {
LABEL_33:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315650;
      __int16 v18 = "oalImp.cpp";
      __int16 v19 = 1024;
      int v20 = 3095;
      __int16 v21 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alListener3f FAILED = %s\n", (uint8_t *)&v17, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
    }
  }
}

void sub_221547C68(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alGetListenerf(ALenum param, ALfloat *value)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!gOALContextMap) {
    goto LABEL_31;
  }
  unint64_t v4 = gCurrentContext;
  uint64_t v5 = gContextMapLock;
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  ALenum v7 = *(void **)(gOALContextMap + 8);
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v8 = gOALContextMap + 8;
  do
  {
    unint64_t v9 = v7[4];
    BOOL v10 = v9 >= v4;
    if (v9 >= v4) {
      int v11 = v7;
    }
    else {
      int v11 = v7 + 1;
    }
    if (v10) {
      uint64_t v8 = (uint64_t)v7;
    }
    ALenum v7 = (void *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(void *)(v8 + 32) <= v4)
  {
    uint64_t v12 = *(void *)(v8 + 40);
    if (v12) {
      atomic_fetch_add((atomic_uint *volatile)(v12 + 440), 1u);
    }
  }
  else
  {
LABEL_13:
    uint64_t v12 = 0;
  }
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
  if (v12)
  {
    if (param == 4106)
    {
      *value = *(ALfloat *)(v12 + 368);
    }
    else
    {
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey)) {
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
      }
    }
    atomic_fetch_add((atomic_uint *volatile)(v12 + 440), 0xFFFFFFFF);
  }
  else
  {
LABEL_31:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315650;
      BOOL v14 = "oalImp.cpp";
      __int16 v15 = 1024;
      int v16 = 3124;
      __int16 v17 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetListenerf FAILED = %s\n", (uint8_t *)&v13, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
    }
  }
}

void sub_221547EBC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alGetListenerfv(ALenum param, ALfloat *values)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!gOALContextMap) {
    goto LABEL_33;
  }
  unint64_t v4 = gCurrentContext;
  uint64_t v5 = gContextMapLock;
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  ALenum v7 = *(void **)(gOALContextMap + 8);
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v8 = gOALContextMap + 8;
  do
  {
    unint64_t v9 = v7[4];
    BOOL v10 = v9 >= v4;
    if (v9 >= v4) {
      int v11 = v7;
    }
    else {
      int v11 = v7 + 1;
    }
    if (v10) {
      uint64_t v8 = (uint64_t)v7;
    }
    ALenum v7 = (void *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(void *)(v8 + 32) <= v4)
  {
    uint64_t v12 = *(void *)(v8 + 40);
    if (v12) {
      atomic_fetch_add((atomic_uint *volatile)(v12 + 440), 1u);
    }
  }
  else
  {
LABEL_13:
    uint64_t v12 = 0;
  }
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
  if (v12)
  {
    switch(param)
    {
      case 4100:
        *values = *(ALfloat *)(v12 + 344);
        values[1] = *(ALfloat *)(v12 + 348);
        values[2] = *(ALfloat *)(v12 + 352);
        break;
      case 4102:
        *values = *(ALfloat *)(v12 + 356);
        values[1] = *(ALfloat *)(v12 + 360);
        values[2] = *(ALfloat *)(v12 + 364);
        break;
      case 4106:
        *values = *(ALfloat *)(v12 + 368);
        break;
      case 4111:
        *values = *(ALfloat *)(v12 + 372);
        values[1] = *(ALfloat *)(v12 + 376);
        values[2] = *(ALfloat *)(v12 + 380);
        values[3] = *(ALfloat *)(v12 + 384);
        values[4] = *(ALfloat *)(v12 + 388);
        values[5] = *(ALfloat *)(v12 + 392);
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey)) {
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
        break;
    }
    atomic_fetch_add((atomic_uint *volatile)(v12 + 440), 0xFFFFFFFF);
  }
  else
  {
LABEL_33:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315650;
      BOOL v14 = "oalImp.cpp";
      __int16 v15 = 1024;
      int v16 = 3163;
      __int16 v17 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetListenerfv FAILED = %s\n", (uint8_t *)&v13, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
    }
  }
}

void sub_2215481A0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alGetListener3f(ALenum param, ALfloat *value1, ALfloat *value2, ALfloat *value3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!gOALContextMap) {
    goto LABEL_33;
  }
  unint64_t v8 = gCurrentContext;
  uint64_t v9 = gContextMapLock;
  int v10 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  int v11 = *(void **)(gOALContextMap + 8);
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t v12 = gOALContextMap + 8;
  do
  {
    unint64_t v13 = v11[4];
    BOOL v14 = v13 >= v8;
    if (v13 >= v8) {
      __int16 v15 = v11;
    }
    else {
      __int16 v15 = v11 + 1;
    }
    if (v14) {
      uint64_t v12 = (uint64_t)v11;
    }
    int v11 = (void *)*v15;
  }
  while (*v15);
  if (v12 != gOALContextMap + 8 && *(void *)(v12 + 32) <= v8)
  {
    uint64_t v16 = *(void *)(v12 + 40);
    if (v16) {
      atomic_fetch_add((atomic_uint *volatile)(v16 + 440), 1u);
    }
  }
  else
  {
LABEL_13:
    uint64_t v16 = 0;
  }
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
  }
  if (v16)
  {
    if (param == 4102)
    {
      *value1 = *(ALfloat *)(v16 + 356);
      *value2 = *(ALfloat *)(v16 + 360);
      *value3 = *(ALfloat *)(v16 + 364);
    }
    else if (param == 4100)
    {
      *value1 = *(ALfloat *)(v16 + 344);
      *value2 = *(ALfloat *)(v16 + 348);
      *value3 = *(ALfloat *)(v16 + 352);
    }
    else
    {
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey)) {
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
      }
    }
    atomic_fetch_add((atomic_uint *volatile)(v16 + 440), 0xFFFFFFFF);
  }
  else
  {
LABEL_33:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315650;
      __int16 v18 = "oalImp.cpp";
      __int16 v19 = 1024;
      int v20 = 3195;
      __int16 v21 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetListener3f FAILED = %s\n", (uint8_t *)&v17, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
    }
  }
}

void sub_22154846C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alGetListeneri(ALenum param, ALint *value)
{
  *value = 0;
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
  {
    pthread_key_t v2 = gALErrorKey;
    pthread_setspecific(v2, (const void *)0xA003);
  }
}

void alGetListeneriv(ALenum param, ALint *values)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!gOALContextMap) {
    goto LABEL_34;
  }
  unint64_t v4 = gCurrentContext;
  uint64_t v5 = gContextMapLock;
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  ALenum v7 = *(void **)(gOALContextMap + 8);
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v8 = gOALContextMap + 8;
  do
  {
    unint64_t v9 = v7[4];
    BOOL v10 = v9 >= v4;
    if (v9 >= v4) {
      int v11 = v7;
    }
    else {
      int v11 = v7 + 1;
    }
    if (v10) {
      uint64_t v8 = (uint64_t)v7;
    }
    ALenum v7 = (void *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(void *)(v8 + 32) <= v4)
  {
    uint64_t v12 = *(ALint **)(v8 + 40);
    if (v12) {
      atomic_fetch_add(v12 + 110, 1u);
    }
  }
  else
  {
LABEL_13:
    uint64_t v12 = 0;
  }
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
  if (v12)
  {
    switch(param)
    {
      case 4111:
        *values = v12[93];
        values[1] = v12[94];
        values[2] = v12[95];
        values[3] = v12[96];
        values[4] = v12[97];
        values[5] = v12[98];
        break;
      case 4102:
        *values = v12[89];
        values[1] = v12[90];
        values[2] = v12[91];
        break;
      case 4100:
        *values = v12[86];
        values[1] = v12[87];
        values[2] = v12[88];
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey)) {
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
        break;
    }
    atomic_fetch_add(v12 + 110, 0xFFFFFFFF);
  }
  else
  {
LABEL_34:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315650;
      BOOL v14 = "oalImp.cpp";
      __int16 v15 = 1024;
      int v16 = 3246;
      __int16 v17 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetListenerfv FAILED = %s\n", (uint8_t *)&v13, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
    }
  }
}

void sub_2215487A8(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alGetListener3i(ALenum param, ALint *value1, ALint *value2, ALint *value3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!gOALContextMap) {
    goto LABEL_33;
  }
  unint64_t v8 = gCurrentContext;
  uint64_t v9 = gContextMapLock;
  int v10 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  int v11 = *(void **)(gOALContextMap + 8);
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t v12 = gOALContextMap + 8;
  do
  {
    unint64_t v13 = v11[4];
    BOOL v14 = v13 >= v8;
    if (v13 >= v8) {
      __int16 v15 = v11;
    }
    else {
      __int16 v15 = v11 + 1;
    }
    if (v14) {
      uint64_t v12 = (uint64_t)v11;
    }
    int v11 = (void *)*v15;
  }
  while (*v15);
  if (v12 != gOALContextMap + 8 && *(void *)(v12 + 32) <= v8)
  {
    int v16 = *(ALint **)(v12 + 40);
    if (v16) {
      atomic_fetch_add(v16 + 110, 1u);
    }
  }
  else
  {
LABEL_13:
    int v16 = 0;
  }
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
  }
  if (v16)
  {
    if (param == 4102)
    {
      *value1 = v16[89];
      *value2 = v16[90];
      *value3 = v16[91];
    }
    else if (param == 4100)
    {
      *value1 = v16[86];
      *value2 = v16[87];
      *value3 = v16[88];
    }
    else
    {
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey)) {
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
      }
    }
    atomic_fetch_add(v16 + 110, 0xFFFFFFFF);
  }
  else
  {
LABEL_33:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315650;
      __int16 v18 = "oalImp.cpp";
      __int16 v19 = 1024;
      int v20 = 3278;
      __int16 v21 = 2080;
      String = alGetString(40964);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetListener3f FAILED = %s\n", (uint8_t *)&v17, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
    }
  }
}

void sub_221548A44(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alDistanceModel(ALenum distanceModel)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315650;
    unint64_t v13 = "oalImp.cpp";
    __int16 v14 = 1024;
    int v15 = 3288;
    __int16 v16 = 2080;
    ALAttributeString = GetALAttributeString(distanceModel);
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alDistanceModel--> model = %s", (uint8_t *)&v12, 0x1Cu);
  }
  if ((distanceModel - 53249) >= 6 && distanceModel)
  {
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
  }
  else
  {
    if (!gOALContextMap) {
      goto LABEL_33;
    }
    unint64_t v2 = gCurrentContext;
    uint64_t v3 = gContextMapLock;
    int v4 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
    uint64_t v5 = *(void **)(gOALContextMap + 8);
    if (!v5) {
      goto LABEL_16;
    }
    uint64_t v6 = gOALContextMap + 8;
    do
    {
      unint64_t v7 = v5[4];
      BOOL v8 = v7 >= v2;
      if (v7 >= v2) {
        uint64_t v9 = v5;
      }
      else {
        uint64_t v9 = v5 + 1;
      }
      if (v8) {
        uint64_t v6 = (uint64_t)v5;
      }
      uint64_t v5 = (void *)*v9;
    }
    while (*v9);
    if (v6 != gOALContextMap + 8 && *(void *)(v6 + 32) <= v2)
    {
      uint64_t v10 = *(void *)(v6 + 40);
      if (v10) {
        atomic_fetch_add((atomic_uint *volatile)(v10 + 440), 1u);
      }
    }
    else
    {
LABEL_16:
      uint64_t v10 = 0;
    }
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v3 + 24))(v3);
    }
    if (v10)
    {
      OALContext::SetDistanceModel(v10, distanceModel);
      atomic_fetch_add((atomic_uint *volatile)(v10 + 440), 0xFFFFFFFF);
    }
    else
    {
LABEL_33:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        String = alGetString(40964);
        int v12 = 136315650;
        unint64_t v13 = "oalImp.cpp";
        __int16 v14 = 1024;
        int v15 = 3316;
        __int16 v16 = 2080;
        ALAttributeString = String;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alDistanceModel FAILED = %s\n", (uint8_t *)&v12, 0x1Cu);
      }
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey)) {
        pthread_setspecific(gALErrorKey, (const void *)0xA004);
      }
    }
  }
}

void sub_221548D10(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alDopplerFactor(ALfloat value)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315650;
    __int16 v14 = "oalImp.cpp";
    __int16 v15 = 1024;
    int v16 = 3324;
    __int16 v17 = 2048;
    double v18 = value;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alDopplerFactor---> setting = %.f2", (uint8_t *)&v13, 0x1Cu);
  }
  if (value < 0.0)
  {
    unsigned int v2 = 40963;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
LABEL_24:
    String = alGetString(v2);
    int v13 = 136315650;
    __int16 v14 = "oalImp.cpp";
    __int16 v15 = 1024;
    int v16 = 3340;
    __int16 v17 = 2080;
    double v18 = *(double *)&String;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alDopplerFactor FAILED = %s\n", (uint8_t *)&v13, 0x1Cu);
    goto LABEL_25;
  }
  if (gOALContextMap)
  {
    unint64_t v3 = gCurrentContext;
    uint64_t v4 = gContextMapLock;
    int v5 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
    uint64_t v6 = *(void **)(gOALContextMap + 8);
    if (!v6) {
      goto LABEL_18;
    }
    uint64_t v7 = gOALContextMap + 8;
    do
    {
      unint64_t v8 = v6[4];
      BOOL v9 = v8 >= v3;
      if (v8 >= v3) {
        uint64_t v10 = v6;
      }
      else {
        uint64_t v10 = v6 + 1;
      }
      if (v9) {
        uint64_t v7 = (uint64_t)v6;
      }
      uint64_t v6 = (void *)*v10;
    }
    while (*v10);
    if (v7 != gOALContextMap + 8 && *(void *)(v7 + 32) <= v3)
    {
      uint64_t v11 = *(void *)(v7 + 40);
      if (v11) {
        atomic_fetch_add((atomic_uint *volatile)(v11 + 440), 1u);
      }
    }
    else
    {
LABEL_18:
      uint64_t v11 = 0;
    }
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v4 + 24))(v4);
    }
    if (v11)
    {
      OALContext::SetDopplerFactor(v11, value);
      atomic_fetch_add((atomic_uint *volatile)(v11 + 440), 0xFFFFFFFF);
      return;
    }
  }
  unsigned int v2 = 40964;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_24;
  }
LABEL_25:
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)v2);
  }
}

void sub_221548FB8(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alDopplerVelocity(ALfloat value)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315650;
    __int16 v14 = "oalImp.cpp";
    __int16 v15 = 1024;
    int v16 = 3348;
    __int16 v17 = 2048;
    double v18 = value;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alDopplerVelocity---> setting = %.f2", (uint8_t *)&v13, 0x1Cu);
  }
  if (value <= 0.0)
  {
    unsigned int v11 = 40963;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
LABEL_24:
      String = alGetString(v11);
      int v13 = 136315650;
      __int16 v14 = "oalImp.cpp";
      __int16 v15 = 1024;
      int v16 = 3365;
      __int16 v17 = 2080;
      double v18 = *(double *)&String;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alDopplerVelocity FAILED = %s\n", (uint8_t *)&v13, 0x1Cu);
    }
  }
  else
  {
    if (gOALContextMap)
    {
      unint64_t v2 = gCurrentContext;
      uint64_t v3 = gContextMapLock;
      int v4 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
      int v5 = *(void **)(gOALContextMap + 8);
      if (!v5) {
        goto LABEL_16;
      }
      uint64_t v6 = gOALContextMap + 8;
      do
      {
        unint64_t v7 = v5[4];
        BOOL v8 = v7 >= v2;
        if (v7 >= v2) {
          BOOL v9 = v5;
        }
        else {
          BOOL v9 = v5 + 1;
        }
        if (v8) {
          uint64_t v6 = (uint64_t)v5;
        }
        int v5 = (void *)*v9;
      }
      while (*v9);
      if (v6 != gOALContextMap + 8 && *(void *)(v6 + 32) <= v2)
      {
        uint64_t v10 = *(void *)(v6 + 40);
        if (v10) {
          atomic_fetch_add((atomic_uint *volatile)(v10 + 440), 1u);
        }
      }
      else
      {
LABEL_16:
        uint64_t v10 = 0;
      }
      if (v4) {
        (*(void (**)(uint64_t))(*(void *)v3 + 24))(v3);
      }
      if (v10)
      {
        OALContext::SetDopplerVelocity(v10, value);
        atomic_fetch_add((atomic_uint *volatile)(v10 + 440), 0xFFFFFFFF);
        return;
      }
    }
    unsigned int v11 = 40964;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_24;
    }
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)v11);
  }
}

void sub_221549260(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alSpeedOfSound(ALfloat value)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315650;
    int v13 = "oalImp.cpp";
    __int16 v14 = 1024;
    int v15 = 3373;
    __int16 v16 = 2048;
    double v17 = value;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alSpeedOfSound---> setting = %.f2", (uint8_t *)&v12, 0x1Cu);
  }
  if (value <= 0.0 || !gOALContextMap) {
    goto LABEL_30;
  }
  unint64_t v2 = gCurrentContext;
  uint64_t v3 = gContextMapLock;
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  int v5 = *(void **)(gOALContextMap + 8);
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = gOALContextMap + 8;
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= v2;
    if (v7 >= v2) {
      BOOL v9 = v5;
    }
    else {
      BOOL v9 = v5 + 1;
    }
    if (v8) {
      uint64_t v6 = (uint64_t)v5;
    }
    int v5 = (void *)*v9;
  }
  while (*v9);
  if (v6 != gOALContextMap + 8 && *(void *)(v6 + 32) <= v2)
  {
    uint64_t v10 = *(void *)(v6 + 40);
    if (v10) {
      atomic_fetch_add((atomic_uint *volatile)(v10 + 440), 1u);
    }
  }
  else
  {
LABEL_16:
    uint64_t v10 = 0;
  }
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v3 + 24))(v3);
  }
  if (v10)
  {
    OALContext::SetSpeedOfSound(v10, value);
    atomic_fetch_add((atomic_uint *volatile)(v10 + 440), 0xFFFFFFFF);
  }
  else
  {
LABEL_30:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(40964);
      int v12 = 136315650;
      int v13 = "oalImp.cpp";
      __int16 v14 = 1024;
      int v15 = 3389;
      __int16 v16 = 2080;
      double v17 = *(double *)&String;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSpeedOfSound FAILED = %s\n", (uint8_t *)&v12, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
    }
  }
}

void sub_2215494E8(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

ALBOOLean alGetBoolean(ALenum param)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v2 = 136315394;
    uint64_t v3 = "oalImp.cpp";
    __int16 v4 = 1024;
    int v5 = 3551;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ***** alGetBoolean", (uint8_t *)&v2, 0x12u);
  }
  return 0;
}

void alGetBooleanv(ALenum param, ALBOOLean *data)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v2 = 136315394;
    uint64_t v3 = "oalImp.cpp";
    __int16 v4 = 1024;
    int v5 = 3559;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ***** alGetBooleanv", (uint8_t *)&v2, 0x12u);
  }
}

ALfloat alGetFloat(ALenum param)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315650;
    int v15 = "oalImp.cpp";
    __int16 v16 = 1024;
    int v17 = 3567;
    __int16 v18 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetFloat ---> attribute = %s", (uint8_t *)&v14, 0x1Cu);
  }
  if (!gOALContextMap) {
    goto LABEL_35;
  }
  unint64_t v2 = gCurrentContext;
  uint64_t v3 = gContextMapLock;
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  int v5 = *(void **)(gOALContextMap + 8);
  if (!v5) {
    goto LABEL_15;
  }
  uint64_t v6 = gOALContextMap + 8;
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= v2;
    if (v7 >= v2) {
      BOOL v9 = v5;
    }
    else {
      BOOL v9 = v5 + 1;
    }
    if (v8) {
      uint64_t v6 = (uint64_t)v5;
    }
    int v5 = (void *)*v9;
  }
  while (*v9);
  if (v6 != gOALContextMap + 8 && *(void *)(v6 + 32) <= v2)
  {
    uint64_t v10 = *(_DWORD **)(v6 + 40);
    if (v10) {
      atomic_fetch_add(v10 + 110, 1u);
    }
  }
  else
  {
LABEL_15:
    uint64_t v10 = 0;
  }
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v3 + 24))(v3);
  }
  if (v10)
  {
    if (param == 49152)
    {
      float v11 = *((float *)v10 + 84);
    }
    else if (param == 49153)
    {
      float v11 = *((float *)v10 + 85);
    }
    else
    {
      float v11 = 0.0;
      if (param == 49155) {
        float v11 = *((float *)v10 + 83);
      }
    }
    atomic_fetch_add(v10 + 110, 0xFFFFFFFF);
  }
  else
  {
LABEL_35:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(40964);
      int v14 = 136315650;
      int v15 = "oalImp.cpp";
      __int16 v16 = 1024;
      int v17 = 3592;
      __int16 v18 = 2080;
      ALAttributeString = String;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetFloat FAILED = %s\n", (uint8_t *)&v14, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    float v11 = 0.0;
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
    }
  }
  return v11;
}

void sub_2215498FC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alGetFloatv(ALenum param, ALfloat *data)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315650;
    int v15 = "oalImp.cpp";
    __int16 v16 = 1024;
    int v17 = 3602;
    __int16 v18 = 2080;
    ALAttributeString = GetALAttributeString(param);
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetFloatv ---> attribute = %s", (uint8_t *)&v14, 0x1Cu);
  }
  if (!gOALContextMap) {
    goto LABEL_36;
  }
  unint64_t v4 = gCurrentContext;
  uint64_t v5 = gContextMapLock;
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  unint64_t v7 = *(void **)(gOALContextMap + 8);
  if (!v7) {
    goto LABEL_15;
  }
  uint64_t v8 = gOALContextMap + 8;
  do
  {
    unint64_t v9 = v7[4];
    BOOL v10 = v9 >= v4;
    if (v9 >= v4) {
      float v11 = v7;
    }
    else {
      float v11 = v7 + 1;
    }
    if (v10) {
      uint64_t v8 = (uint64_t)v7;
    }
    unint64_t v7 = (void *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(void *)(v8 + 32) <= v4)
  {
    uint64_t v12 = *(void *)(v8 + 40);
    if (v12) {
      atomic_fetch_add((atomic_uint *volatile)(v12 + 440), 1u);
    }
  }
  else
  {
LABEL_15:
    uint64_t v12 = 0;
  }
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
  if (v12)
  {
    switch(param)
    {
      case 49152:
        *data = *(ALfloat *)(v12 + 336);
        break;
      case 49153:
        *data = *(ALfloat *)(v12 + 340);
        break;
      case 49155:
        *data = *(ALfloat *)(v12 + 332);
        break;
      default:
        pthread_once(&gErrorOnce, ErrorKeyInitializer);
        if (!pthread_getspecific(gALErrorKey)) {
          pthread_setspecific(gALErrorKey, (const void *)0xA002);
        }
        break;
    }
    atomic_fetch_add((atomic_uint *volatile)(v12 + 440), 0xFFFFFFFF);
  }
  else
  {
LABEL_36:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      String = alGetString(40964);
      int v14 = 136315650;
      int v15 = "oalImp.cpp";
      __int16 v16 = 1024;
      int v17 = 3628;
      __int16 v18 = 2080;
      ALAttributeString = String;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetFloatv FAILED = %s\n", (uint8_t *)&v14, 0x1Cu);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA004);
    }
  }
}

void sub_221549BF4(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

ALdouble alGetDouble(ALenum param)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (param > 4100)
    {
      switch(param)
      {
        case 40961:
          unint64_t v2 = "ALC_INVALID_DEVICE";
          break;
        case 40962:
          unint64_t v2 = "ALC_INVALID_CONTEXT";
          break;
        case 40963:
          unint64_t v2 = "ALC_INVALID_ENUM";
          break;
        case 40964:
          unint64_t v2 = "ALC_INVALID_VALUE";
          break;
        default:
          if (param == 4102)
          {
            unint64_t v2 = "ALC_EXTENSIONS";
          }
          else
          {
            if (param != 4101) {
              goto LABEL_17;
            }
            unint64_t v2 = "ALC_DEVICE_SPECIFIER";
          }
          break;
      }
      goto LABEL_22;
    }
    if (param > 784)
    {
      if (param == 785)
      {
        unint64_t v2 = "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
      if (param == 4100)
      {
        unint64_t v2 = "ALC_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
    }
    else
    {
      if (!param)
      {
        unint64_t v2 = "ALC_NO_ERROR";
        goto LABEL_22;
      }
      if (param == 784)
      {
        unint64_t v2 = "ALC_CAPTURE_DEVICE_SPECIFIER";
LABEL_22:
        int v11 = 136315650;
        uint64_t v12 = "oalImp.cpp";
        __int16 v13 = 1024;
        int v14 = 3636;
        __int16 v15 = 2080;
        __int16 v16 = v2;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetDouble ---> attribute = %s", (uint8_t *)&v11, 0x1Cu);
        goto LABEL_23;
      }
    }
LABEL_17:
    unint64_t v2 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
    goto LABEL_22;
  }
LABEL_23:
  if (param == 61443)
  {
    double v3 = *(double *)&gUsersMixerOutputRate;
    if (*(double *)&gUsersMixerOutputRate <= 0.0)
    {
      double v3 = 0.0;
      if (gOALDeviceMap)
      {
        unint64_t v4 = *(void **)(gOALDeviceMap + 8);
        if (v4)
        {
          uint64_t v5 = gOALDeviceMap + 8;
          do
          {
            unint64_t v6 = v4[4];
            BOOL v7 = v6 >= gCurrentDevice;
            if (v6 >= gCurrentDevice) {
              uint64_t v8 = v4;
            }
            else {
              uint64_t v8 = v4 + 1;
            }
            if (v7) {
              uint64_t v5 = (uint64_t)v4;
            }
            unint64_t v4 = (void *)*v8;
          }
          while (*v8);
          if (v5 != gOALDeviceMap + 8 && *(void *)(v5 + 32) <= (unint64_t)gCurrentDevice)
          {
            uint64_t v9 = *(void *)(v5 + 40);
            if (v9) {
              return *(double *)(v9 + 56);
            }
          }
        }
      }
    }
  }
  else
  {
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    double v3 = 0.0;
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
  }
  return v3;
}

void alGetDoublev(ALenum param, ALdouble *data)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    if (param > 4100)
    {
      switch(param)
      {
        case 40961:
          unint64_t v4 = "ALC_INVALID_DEVICE";
          break;
        case 40962:
          unint64_t v4 = "ALC_INVALID_CONTEXT";
          break;
        case 40963:
          unint64_t v4 = "ALC_INVALID_ENUM";
          break;
        case 40964:
          unint64_t v4 = "ALC_INVALID_VALUE";
          break;
        default:
          if (param == 4102)
          {
            unint64_t v4 = "ALC_EXTENSIONS";
          }
          else
          {
            if (param != 4101) {
              goto LABEL_17;
            }
            unint64_t v4 = "ALC_DEVICE_SPECIFIER";
          }
          break;
      }
      goto LABEL_22;
    }
    if (param > 784)
    {
      if (param == 785)
      {
        unint64_t v4 = "ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
      if (param == 4100)
      {
        unint64_t v4 = "ALC_DEFAULT_DEVICE_SPECIFIER";
        goto LABEL_22;
      }
    }
    else
    {
      if (!param)
      {
        unint64_t v4 = "ALC_NO_ERROR";
        goto LABEL_22;
      }
      if (param == 784)
      {
        unint64_t v4 = "ALC_CAPTURE_DEVICE_SPECIFIER";
LABEL_22:
        int v12 = 136315650;
        __int16 v13 = "oalImp.cpp";
        __int16 v14 = 1024;
        int v15 = 3657;
        __int16 v16 = 2080;
        uint64_t v17 = v4;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetDoublev ---> attribute = %s", (uint8_t *)&v12, 0x1Cu);
        goto LABEL_23;
      }
    }
LABEL_17:
    unint64_t v4 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
    goto LABEL_22;
  }
LABEL_23:
  if (param == 61443)
  {
    uint64_t v5 = gUsersMixerOutputRate;
    if (*(double *)&gUsersMixerOutputRate <= 0.0)
    {
      uint64_t v5 = 0;
      if (gOALDeviceMap)
      {
        unint64_t v6 = *(void **)(gOALDeviceMap + 8);
        if (v6)
        {
          uint64_t v7 = gOALDeviceMap + 8;
          do
          {
            unint64_t v8 = v6[4];
            BOOL v9 = v8 >= gCurrentDevice;
            if (v8 >= gCurrentDevice) {
              BOOL v10 = v6;
            }
            else {
              BOOL v10 = v6 + 1;
            }
            if (v9) {
              uint64_t v7 = (uint64_t)v6;
            }
            unint64_t v6 = (void *)*v10;
          }
          while (*v10);
          if (v7 != gOALDeviceMap + 8 && *(void *)(v7 + 32) <= (unint64_t)gCurrentDevice)
          {
            uint64_t v11 = *(void *)(v7 + 40);
            if (v11) {
              uint64_t v5 = *(void *)(v11 + 56);
            }
          }
        }
      }
    }
    *(void *)data = v5;
  }
  else
  {
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
  }
}

ALint alGetInteger(ALenum param)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v40 = 136315650;
    BOOL v41 = "oalImp.cpp";
    __int16 v42 = 1024;
    int v43 = 3674;
    __int16 v44 = 1024;
    LODWORD(v45) = param;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetInteger ---> attribute = 0x%X", (uint8_t *)&v40, 0x18u);
  }
  if (param <= 61443)
  {
    if (param == 53248)
    {
      if (gOALContextMap)
      {
        unint64_t v23 = gCurrentContext;
        uint64_t v24 = gContextMapLock;
        int v25 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
        ALuint v26 = *(void **)(gOALContextMap + 8);
        if (!v26) {
          goto LABEL_54;
        }
        uint64_t v27 = gOALContextMap + 8;
        do
        {
          unint64_t v28 = v26[4];
          BOOL v29 = v28 >= v23;
          if (v28 >= v23) {
            uint64_t v30 = v26;
          }
          else {
            uint64_t v30 = v26 + 1;
          }
          if (v29) {
            uint64_t v27 = (uint64_t)v26;
          }
          ALuint v26 = (void *)*v30;
        }
        while (*v30);
        if (v27 != gOALContextMap + 8 && *(void *)(v27 + 32) <= v23)
        {
          BOOL v10 = *(ALint **)(v27 + 40);
          if (v10) {
            atomic_fetch_add(v10 + 110, 1u);
          }
        }
        else
        {
LABEL_54:
          BOOL v10 = 0;
        }
        if (v25) {
          (*(void (**)(uint64_t))(*(void *)v24 + 24))(v24);
        }
        if (v10)
        {
          uint64_t v11 = v10 + 82;
          goto LABEL_78;
        }
      }
      goto LABEL_59;
    }
    if (param == 61442)
    {
      if (gOALContextMap)
      {
        unint64_t v2 = gCurrentContext;
        uint64_t v3 = gContextMapLock;
        int v4 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
        uint64_t v5 = *(void **)(gOALContextMap + 8);
        if (!v5) {
          goto LABEL_18;
        }
        uint64_t v6 = gOALContextMap + 8;
        do
        {
          unint64_t v7 = v5[4];
          BOOL v8 = v7 >= v2;
          if (v7 >= v2) {
            BOOL v9 = v5;
          }
          else {
            BOOL v9 = v5 + 1;
          }
          if (v8) {
            uint64_t v6 = (uint64_t)v5;
          }
          uint64_t v5 = (void *)*v9;
        }
        while (*v9);
        if (v6 != gOALContextMap + 8 && *(void *)(v6 + 32) <= v2)
        {
          BOOL v10 = *(ALint **)(v6 + 40);
          if (v10) {
            atomic_fetch_add(v10 + 110, 1u);
          }
        }
        else
        {
LABEL_18:
          BOOL v10 = 0;
        }
        if (v4) {
          (*(void (**)(uint64_t))(*(void *)v3 + 24))(v3);
        }
        if (v10)
        {
          uint64_t v11 = v10 + 106;
LABEL_78:
          ALint result = *v11;
          BOOL v22 = v10 + 110;
          goto LABEL_79;
        }
      }
      goto LABEL_59;
    }
LABEL_81:
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALErrorKey)) {
      pthread_setspecific(gALErrorKey, (const void *)0xA003);
    }
    return 0;
  }
  if (param == 61444)
  {
    if (!gOALContextMap) {
      return gMaximumMixerBusCount;
    }
    unint64_t v32 = gCurrentContext;
    uint64_t v33 = gContextMapLock;
    int v34 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
    int v35 = *(void **)(gOALContextMap + 8);
    if (!v35) {
      goto LABEL_73;
    }
    uint64_t v36 = gOALContextMap + 8;
    do
    {
      unint64_t v37 = v35[4];
      BOOL v38 = v37 >= v32;
      if (v37 >= v32) {
        uint64_t v39 = v35;
      }
      else {
        uint64_t v39 = v35 + 1;
      }
      if (v38) {
        uint64_t v36 = (uint64_t)v35;
      }
      int v35 = (void *)*v39;
    }
    while (*v39);
    if (v36 != gOALContextMap + 8 && *(void *)(v36 + 32) <= v32)
    {
      BOOL v10 = *(ALint **)(v36 + 40);
      if (v10) {
        atomic_fetch_add(v10 + 110, 1u);
      }
    }
    else
    {
LABEL_73:
      BOOL v10 = 0;
    }
    if (v34) {
      (*(void (**)(uint64_t))(*(void *)v33 + 24))(v33);
    }
    if (!v10) {
      return gMaximumMixerBusCount;
    }
    uint64_t v11 = v10 + 108;
    goto LABEL_78;
  }
  if (param != 61445) {
    goto LABEL_81;
  }
  if (!gOALDeviceMap) {
    goto LABEL_59;
  }
  unint64_t v12 = gCurrentDevice;
  uint64_t v13 = gDeviceMapLock;
  int v14 = (*(uint64_t (**)(uint64_t))(*(void *)gDeviceMapLock + 16))(gDeviceMapLock);
  int v15 = *(void **)(gOALDeviceMap + 8);
  if (!v15) {
    goto LABEL_37;
  }
  uint64_t v16 = gOALDeviceMap + 8;
  do
  {
    unint64_t v17 = v15[4];
    BOOL v18 = v17 >= v12;
    if (v17 >= v12) {
      uint64_t v19 = v15;
    }
    else {
      uint64_t v19 = v15 + 1;
    }
    if (v18) {
      uint64_t v16 = (uint64_t)v15;
    }
    int v15 = (void *)*v19;
  }
  while (*v19);
  if (v16 != gOALDeviceMap + 8 && *(void *)(v16 + 32) <= v12)
  {
    uint64_t v20 = *(void *)(v16 + 40);
    if (v20) {
      atomic_fetch_add((atomic_uint *volatile)(v20 + 76), 1u);
    }
  }
  else
  {
LABEL_37:
    uint64_t v20 = 0;
  }
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v13 + 24))(v13);
  }
  if (!v20)
  {
LABEL_59:
    ALint result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    String = alGetString(40964);
    int v40 = 136315650;
    BOOL v41 = "oalImp.cpp";
    __int16 v42 = 1024;
    int v43 = 3719;
    __int16 v44 = 2080;
    __int16 v45 = String;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetInteger FAILED = %s\n", (uint8_t *)&v40, 0x1Cu);
    return 0;
  }
  ALint result = *(_DWORD *)(v20 + 68);
  BOOL v22 = (atomic_uint *)(v20 + 76);
LABEL_79:
  atomic_fetch_add(v22, 0xFFFFFFFF);
  return result;
}

void sub_22154A684(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alGetIntegerv(ALenum param, ALint *data)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v41 = 136315650;
    __int16 v42 = "oalImp.cpp";
    __int16 v43 = 1024;
    int v44 = 3728;
    __int16 v45 = 1024;
    LODWORD(v46) = param;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetIntegerv ---> attribute = 0x%X", (uint8_t *)&v41, 0x18u);
  }
  if (param > 61443)
  {
    if (param == 61444)
    {
      if (!gOALContextMap) {
        goto LABEL_81;
      }
      unint64_t v33 = gCurrentContext;
      uint64_t v34 = gContextMapLock;
      int v35 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
      uint64_t v36 = *(void **)(gOALContextMap + 8);
      if (!v36) {
        goto LABEL_74;
      }
      uint64_t v37 = gOALContextMap + 8;
      do
      {
        unint64_t v38 = v36[4];
        BOOL v39 = v38 >= v33;
        if (v38 >= v33) {
          int v40 = v36;
        }
        else {
          int v40 = v36 + 1;
        }
        if (v39) {
          uint64_t v37 = (uint64_t)v36;
        }
        uint64_t v36 = (void *)*v40;
      }
      while (*v40);
      if (v37 != gOALContextMap + 8 && *(void *)(v37 + 32) <= v33)
      {
        uint64_t v12 = *(void *)(v37 + 40);
        if (v12) {
          atomic_fetch_add((atomic_uint *volatile)(v12 + 440), 1u);
        }
      }
      else
      {
LABEL_74:
        uint64_t v12 = 0;
      }
      if (v35) {
        (*(void (**)(uint64_t))(*(void *)v34 + 24))(v34);
      }
      if (!v12)
      {
LABEL_81:
        *data = gMaximumMixerBusCount;
        return;
      }
      uint64_t v13 = v12 + 432;
      goto LABEL_83;
    }
    if (param != 61445)
    {
LABEL_79:
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey)) {
        pthread_setspecific(gALErrorKey, (const void *)0xA002);
      }
      return;
    }
    if (gOALDeviceMap)
    {
      unint64_t v14 = gCurrentDevice;
      uint64_t v15 = gDeviceMapLock;
      int v16 = (*(uint64_t (**)(uint64_t))(*(void *)gDeviceMapLock + 16))(gDeviceMapLock);
      unint64_t v17 = *(void **)(gOALDeviceMap + 8);
      if (!v17) {
        goto LABEL_36;
      }
      uint64_t v18 = gOALDeviceMap + 8;
      do
      {
        unint64_t v19 = v17[4];
        BOOL v20 = v19 >= v14;
        if (v19 >= v14) {
          __int16 v21 = v17;
        }
        else {
          __int16 v21 = v17 + 1;
        }
        if (v20) {
          uint64_t v18 = (uint64_t)v17;
        }
        unint64_t v17 = (void *)*v21;
      }
      while (*v21);
      if (v18 != gOALDeviceMap + 8 && *(void *)(v18 + 32) <= v14)
      {
        uint64_t v22 = *(void *)(v18 + 40);
        if (v22) {
          atomic_fetch_add((atomic_uint *volatile)(v22 + 76), 1u);
        }
      }
      else
      {
LABEL_36:
        uint64_t v22 = 0;
      }
      if (v16) {
        (*(void (**)(uint64_t))(*(void *)v15 + 24))(v15);
      }
      if (v22)
      {
        *data = *(_DWORD *)(v22 + 68);
        unint64_t v23 = (atomic_uint *)(v22 + 76);
LABEL_84:
        atomic_fetch_add(v23, 0xFFFFFFFF);
        return;
      }
    }
  }
  else
  {
    if (param != 53248)
    {
      if (param == 61442)
      {
        if (gOALContextMap)
        {
          unint64_t v4 = gCurrentContext;
          uint64_t v5 = gContextMapLock;
          int v6 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
          unint64_t v7 = *(void **)(gOALContextMap + 8);
          if (!v7) {
            goto LABEL_18;
          }
          uint64_t v8 = gOALContextMap + 8;
          do
          {
            unint64_t v9 = v7[4];
            BOOL v10 = v9 >= v4;
            if (v9 >= v4) {
              uint64_t v11 = v7;
            }
            else {
              uint64_t v11 = v7 + 1;
            }
            if (v10) {
              uint64_t v8 = (uint64_t)v7;
            }
            unint64_t v7 = (void *)*v11;
          }
          while (*v11);
          if (v8 != gOALContextMap + 8 && *(void *)(v8 + 32) <= v4)
          {
            uint64_t v12 = *(void *)(v8 + 40);
            if (v12) {
              atomic_fetch_add((atomic_uint *volatile)(v12 + 440), 1u);
            }
          }
          else
          {
LABEL_18:
            uint64_t v12 = 0;
          }
          if (v6) {
            (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
          }
          uint64_t v13 = v12 + 424;
        }
        else
        {
          uint64_t v12 = 0;
          uint64_t v13 = 424;
        }
        goto LABEL_83;
      }
      goto LABEL_79;
    }
    if (gOALContextMap)
    {
      unint64_t v24 = gCurrentContext;
      uint64_t v25 = gContextMapLock;
      int v26 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
      uint64_t v27 = *(void **)(gOALContextMap + 8);
      if (!v27) {
        goto LABEL_53;
      }
      uint64_t v28 = gOALContextMap + 8;
      do
      {
        unint64_t v29 = v27[4];
        BOOL v30 = v29 >= v24;
        if (v29 >= v24) {
          uint64_t v31 = v27;
        }
        else {
          uint64_t v31 = v27 + 1;
        }
        if (v30) {
          uint64_t v28 = (uint64_t)v27;
        }
        uint64_t v27 = (void *)*v31;
      }
      while (*v31);
      if (v28 != gOALContextMap + 8 && *(void *)(v28 + 32) <= v24)
      {
        uint64_t v12 = *(void *)(v28 + 40);
        if (v12) {
          atomic_fetch_add((atomic_uint *volatile)(v12 + 440), 1u);
        }
      }
      else
      {
LABEL_53:
        uint64_t v12 = 0;
      }
      if (v26) {
        (*(void (**)(uint64_t))(*(void *)v25 + 24))(v25);
      }
      if (v12)
      {
        uint64_t v13 = v12 + 328;
LABEL_83:
        *data = *(_DWORD *)v13;
        unint64_t v23 = (atomic_uint *)(v12 + 440);
        goto LABEL_84;
      }
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    String = alGetString(40964);
    int v41 = 136315650;
    __int16 v42 = "oalImp.cpp";
    __int16 v43 = 1024;
    int v44 = 3770;
    __int16 v45 = 2080;
    uint64_t v46 = String;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alGetIntegerv FAILED = %s\n", (uint8_t *)&v41, 0x1Cu);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA004);
  }
}

void sub_22154AC40(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

ALBOOLean alIsExtensionPresent(const ALchar *extname)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    BOOL v10 = "oalImp.cpp";
    __int16 v11 = 1024;
    int v12 = 3933;
    __int16 v13 = 2080;
    unint64_t v14 = extname;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alIsExtensionPresent function name = %s", (uint8_t *)&v9, 0x1Cu);
  }
  if (extname)
  {
    size_t v2 = strlen(extname);
    uint64_t v3 = (char *)malloc_type_calloc(1uLL, v2 + 1, 0x100004077774924uLL);
    if (*extname)
    {
      size_t v4 = 0;
      unsigned int v5 = 1;
      do
      {
        v3[v4] = __toupper(extname[v4]);
        size_t v4 = v5++;
      }
      while (strlen(extname) > v4);
    }
    int v6 = (char *)alExtensions;
    if (!alExtensions)
    {
      int v6 = (char *)malloc_type_malloc(0x8CuLL, 0x1C4BE439uLL);
      alExtensions = (uint64_t)v6;
      strcpy(v6, "AL_EXT_OFFSET AL_EXT_LINEAR_DISTANCE AL_EXT_EXPONENT_DISTANCE AL_EXT_STATIC_BUFFER AL_EXT_SOURCE_NOTIFICATIONS AL_EXT_SOURCE_SPATIALIZATION");
    }
    ALBOOLean v7 = strstr(v6, v3) != 0;
    free(v3);
  }
  else
  {
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey)) {
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    }
    return 0;
  }
  return v7;
}

void alDisable(ALenum capability)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v2 = 136315650;
    uint64_t v3 = "oalImp.cpp";
    __int16 v4 = 1024;
    int v5 = 3957;
    __int16 v6 = 1024;
    ALenum v7 = capability;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alDisable--> capability = 0x%X", (uint8_t *)&v2, 0x18u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA003);
  }
}

void alEnable(ALenum capability)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v2 = 136315650;
    uint64_t v3 = "oalImp.cpp";
    __int16 v4 = 1024;
    int v5 = 3970;
    __int16 v6 = 1024;
    ALenum v7 = capability;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alEnable--> capability = 0x%X", (uint8_t *)&v2, 0x18u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey)) {
    pthread_setspecific(gALErrorKey, (const void *)0xA003);
  }
}

ALBOOLean alIsEnabled(ALenum capability)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315650;
    __int16 v4 = "oalImp.cpp";
    __int16 v5 = 1024;
    int v6 = 3983;
    __int16 v7 = 1024;
    ALenum v8 = capability;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alIsEnabled--> capability = 0x%X", (uint8_t *)&v3, 0x18u);
  }
  return 0;
}

void alcMacOSXRenderingQuality(signed int a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v2 = 136315650;
    int v3 = "oalImp.cpp";
    __int16 v4 = 1024;
    int v5 = 3999;
    __int16 v6 = 2048;
    uint64_t v7 = a1;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOSXRenderingQuality--> value = %ld", (uint8_t *)&v2, 0x1Cu);
  }
  alSetInteger(61442, a1);
}

void alMacOSXRenderChannelCount(signed int a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v2 = 136315650;
    int v3 = "oalImp.cpp";
    __int16 v4 = 1024;
    int v5 = 4007;
    __int16 v6 = 2048;
    uint64_t v7 = a1;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alOSXRenderChannelCount--> value = %ld", (uint8_t *)&v2, 0x1Cu);
  }
  alSetInteger(61445, a1);
}

void alcMacOSXMixerMaxiumumBusses(int a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v2 = 136315650;
    int v3 = "oalImp.cpp";
    __int16 v4 = 1024;
    int v5 = 4015;
    __int16 v6 = 2048;
    uint64_t v7 = a1;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOSXMixerMaxiumumBusses--> value = %ld", (uint8_t *)&v2, 0x1Cu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v2 = 136315394;
    int v3 = "oalImp.cpp";
    __int16 v4 = 1024;
    int v5 = 4232;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ***** alSetIntegeri", (uint8_t *)&v2, 0x12u);
  }
  gMaximumMixerBusCount = a1;
}

void alcMacOSXMixerOutputRate(double a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v2 = 136315650;
    int v3 = "oalImp.cpp";
    __int16 v4 = 1024;
    int v5 = 4023;
    __int16 v6 = 2048;
    double v7 = a1;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOSXMixerOutputRate--> value = %.f2", (uint8_t *)&v2, 0x1Cu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v2 = 136315394;
    int v3 = "oalImp.cpp";
    __int16 v4 = 1024;
    int v5 = 4302;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ***** alSetDouble", (uint8_t *)&v2, 0x12u);
  }
  gUsersMixerOutputRate = *(void *)&a1;
}

uint64_t alcMacOSXGetRenderingQuality()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v1 = 136315394;
    int v2 = "oalImp.cpp";
    __int16 v3 = 1024;
    int v4 = 4031;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOSXGetRenderingQuality-->", (uint8_t *)&v1, 0x12u);
  }
  return alGetInteger(61442);
}

uint64_t alMacOSXGetRenderChannelCount()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v1 = 136315394;
    int v2 = "oalImp.cpp";
    __int16 v3 = 1024;
    int v4 = 4039;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alOSXGetRenderChannelCount-->", (uint8_t *)&v1, 0x12u);
  }
  return alGetInteger(61445);
}

uint64_t alcMacOSXGetMixerMaxiumumBusses()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v1 = 136315394;
    int v2 = "oalImp.cpp";
    __int16 v3 = 1024;
    int v4 = 4047;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOSXGetMixerMaxiumumBusses-->", (uint8_t *)&v1, 0x12u);
  }
  return alGetInteger(61444);
}

ALdouble alcMacOSXGetMixerOutputRate()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v1 = 136315394;
    int v2 = "oalImp.cpp";
    __int16 v3 = 1024;
    int v4 = 4055;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcMacOSXGetMixerOutputRate-->", (uint8_t *)&v1, 0x12u);
  }
  return alGetDouble(61443);
}

uint64_t alBufferDataStatic(unsigned int a1, unsigned int a2, char *a3, int a4, signed int a5)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (!gOALBufferMap) {
    goto LABEL_18;
  }
  CleanUpDeadBufferList();
  uint64_t v10 = *(void *)(gOALBufferMap + 8);
  if (!v10)
  {
    ALenum v15 = 40963;
    goto LABEL_21;
  }
  uint64_t v11 = gOALBufferMap + 8;
  do
  {
    unsigned int v12 = *(_DWORD *)(v10 + 32);
    BOOL v13 = v12 >= a1;
    if (v12 >= a1) {
      unint64_t v14 = (uint64_t *)v10;
    }
    else {
      unint64_t v14 = (uint64_t *)(v10 + 8);
    }
    if (v13) {
      uint64_t v11 = v10;
    }
    uint64_t v10 = *v14;
  }
  while (*v14);
  if (v11 == gOALBufferMap + 8)
  {
LABEL_18:
    ALenum v15 = 40963;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
LABEL_22:
      if (a2 - 4352 > 3) {
        uint64_t v18 = "UNKNOWN FORMAT";
      }
      else {
        uint64_t v18 = off_2645B7880[a2 - 4352];
      }
      int v19 = 136316674;
      BOOL v20 = "oalImp.cpp";
      __int16 v21 = 1024;
      int v22 = 4081;
      __int16 v23 = 2048;
      uint64_t v24 = (int)a1;
      __int16 v25 = 2080;
      int v26 = v18;
      __int16 v27 = 2048;
      uint64_t v28 = a4;
      __int16 v29 = 2048;
      uint64_t v30 = a5;
      __int16 v31 = 2080;
      String = alGetString(v15);
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alBufferDataStatic FAILED: buffer %ld : %s : %ld bytes : %ldHz error = %s", (uint8_t *)&v19, 0x44u);
    }
LABEL_26:
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    uint64_t result = (uint64_t)pthread_getspecific(gALErrorKey);
    if (!result) {
      return pthread_setspecific(gALErrorKey, (const void *)v15);
    }
    return result;
  }
  ALenum v15 = 40963;
  if (*(_DWORD *)(v11 + 32) > a1
    || a4 < 1
    || !a3
    || (uint64_t v16 = *(void *)(v11 + 40)) == 0
    || (uint64_t result = OALBuffer::AddAudioDataStatic(*(OALBuffer **)(v11 + 40), a3, a4, a2, a5),
        ALenum v15 = result,
        atomic_fetch_add((atomic_uint *volatile)(v16 + 280), 0xFFFFFFFF),
        result))
  {
LABEL_21:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_22;
    }
    goto LABEL_26;
  }
  return result;
}

uint64_t alSourceSetRenderCallback(unsigned int a1, int (*a2)(unsigned int, int, char **, int *, void *), int a3, signed int a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315394;
    unint64_t v17 = "oalImp.cpp";
    __int16 v18 = 1024;
    int v19 = 4203;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceSetRenderCallback-->", (uint8_t *)&v16, 0x12u);
  }
  if (!a2)
  {
    uint64_t v12 = 40963;
    goto LABEL_8;
  }
  uint64_t v10 = (OALSource *)ProtectSourceObjectInCurrentContext(a1);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = OALSource::SetRenderCallback(v10, a2, a3, a4, a5);
    atomic_fetch_add((atomic_uint *volatile)v11 + 18, 0xFFFFFFFF);
    if (!v12) {
      goto LABEL_16;
    }
LABEL_8:
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  uint64_t v12 = 40963;
  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_15;
  }
LABEL_11:
  if ((a3 - 4352) > 3) {
    BOOL v13 = "UNKNOWN FORMAT";
  }
  else {
    BOOL v13 = off_2645B7880[a3 - 4352];
  }
  String = alGetString(v12);
  int v16 = 136316418;
  unint64_t v17 = "oalImp.cpp";
  __int16 v18 = 1024;
  int v19 = 4218;
  __int16 v20 = 2048;
  uint64_t v21 = a1;
  __int16 v22 = 2080;
  __int16 v23 = v13;
  __int16 v24 = 2048;
  uint64_t v25 = a4;
  __int16 v26 = 2080;
  __int16 v27 = String;
  _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceSetRenderCallback FAILED: source: %ld : %s : %ldHz error = %s", (uint8_t *)&v16, 0x3Au);
LABEL_15:
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  if (!pthread_getspecific(gALErrorKey))
  {
    pthread_setspecific(gALErrorKey, (const void *)(int)v12);
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      return v12;
    }
    goto LABEL_17;
  }
LABEL_16:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
LABEL_17:
    int v16 = 136315394;
    unint64_t v17 = "oalImp.cpp";
    __int16 v18 = 1024;
    int v19 = 4222;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d <--alSourceSetRenderCallback", (uint8_t *)&v16, 0x12u);
  }
  return v12;
}

uint64_t alSourceAddNotification(unsigned int a1, int a2, void (*a3)(unsigned int, unsigned int, void *), void *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v23 = "oalImp.cpp";
    __int16 v24 = 1024;
    int v25 = 4136;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceAddNotification-->", buf, 0x12u);
  }
  if (!a3) {
    return 40963;
  }
  if (!gOALContextMap) {
    goto LABEL_24;
  }
  unint64_t v8 = gCurrentContext;
  uint64_t v9 = gContextMapLock;
  int v10 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  uint64_t v11 = *(void **)(gOALContextMap + 8);
  if (!v11) {
    goto LABEL_16;
  }
  uint64_t v12 = gOALContextMap + 8;
  do
  {
    unint64_t v13 = v11[4];
    BOOL v14 = v13 >= v8;
    if (v13 >= v8) {
      ALenum v15 = v11;
    }
    else {
      ALenum v15 = v11 + 1;
    }
    if (v14) {
      uint64_t v12 = (uint64_t)v11;
    }
    uint64_t v11 = (void *)*v15;
  }
  while (*v15);
  if (v12 != gOALContextMap + 8 && *(void *)(v12 + 32) <= v8)
  {
    int v16 = *(atomic_uint **)(v12 + 40);
    if (v16) {
      atomic_fetch_add(v16 + 110, 1u);
    }
  }
  else
  {
LABEL_16:
    int v16 = 0;
  }
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
  }
  if (!v16
    || (unint64_t v17 = (OALSource *)OALContext::ProtectSource((OALContext *)v16, a1),
        __int16 v18 = v17,
        atomic_fetch_add(v16 + 110, 0xFFFFFFFF),
        !v17))
  {
LABEL_24:
    __int16 v20 = 0;
    uint64_t v19 = 40963;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  uint64_t v19 = OALSource::AddNotification(v17, a2, a3, a4);
  if (!v19)
  {
LABEL_27:
    atomic_fetch_add((atomic_uint *volatile)v18 + 18, 0xFFFFFFFF);
    return v19;
  }
  __int16 v20 = v18;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
LABEL_25:
    *(_DWORD *)buf = 136316162;
    __int16 v23 = "oalImp.cpp";
    __int16 v24 = 1024;
    int v25 = 4154;
    __int16 v26 = 2048;
    uint64_t v27 = a1;
    __int16 v28 = 2048;
    __int16 v29 = a3;
    __int16 v30 = 2048;
    __int16 v31 = a4;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceAddNotification FAILED: source: %ld : proc: %p : userData: %p", buf, 0x30u);
  }
LABEL_26:
  __int16 v18 = v20;
  if (v20) {
    goto LABEL_27;
  }
  return v19;
}

void sub_22154BF90(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void sub_22154BFA8(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, long long a10, long long buf, long long a12)
{
  if (a2)
  {
    unint64_t v13 = (int *)__cxa_begin_catch(a1);
    if (a2 == 2)
    {
      int v14 = *v13;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          if (v14 > 40960)
          {
            switch(v14)
            {
              case 53249:
                ALenum v15 = "AL_INVERSE_DISTANCE";
                break;
              case 53250:
                ALenum v15 = "AL_INVERSE_DISTANCE_CLAMPED";
                break;
              case 53251:
                ALenum v15 = "AL_LINEAR_DISTANCE";
                break;
              case 53252:
                ALenum v15 = "AL_LINEAR_DISTANCE_CLAMPED";
                break;
              case 53253:
                ALenum v15 = "AL_EXPONENT_DISTANCE";
                break;
              case 53254:
                ALenum v15 = "AL_EXPONENT_DISTANCE_CLAMPED";
                break;
              default:
                if (v14 != 40961) {
                  goto LABEL_16;
                }
                ALenum v15 = "AL_INVALID_NAME";
                break;
            }
          }
          else
          {
            switch(v14)
            {
              case 4097:
                ALenum v15 = "AL_CONE_INNER_ANGLE";
                break;
              case 4098:
                ALenum v15 = "AL_CONE_OUTER_ANGLE";
                break;
              case 4099:
                ALenum v15 = "AL_PITCH";
                break;
              case 4100:
                ALenum v15 = "AL_POSITION";
                break;
              case 4101:
                ALenum v15 = "AL_DIRECTION";
                break;
              case 4102:
                ALenum v15 = "AL_VELOCITY";
                break;
              case 4103:
                ALenum v15 = "AL_LOOPING";
                break;
              case 4104:
              case 4107:
              case 4108:
              case 4113:
              case 4114:
              case 4115:
              case 4116:
              case 4119:
              case 4120:
              case 4121:
              case 4122:
              case 4123:
              case 4124:
              case 4125:
              case 4126:
              case 4127:
                goto LABEL_16;
              case 4105:
                ALenum v15 = "AL_BUFFER";
                break;
              case 4106:
                ALenum v15 = "AL_GAIN";
                break;
              case 4109:
                ALenum v15 = "AL_MIN_GAIN";
                break;
              case 4110:
                ALenum v15 = "AL_MAX_GAIN";
                break;
              case 4111:
                ALenum v15 = "AL_ORIENTATION";
                break;
              case 4112:
                ALenum v15 = "AL_SOURCE_STATE";
                break;
              case 4117:
                ALenum v15 = "AL_BUFFERS_QUEUED";
                break;
              case 4118:
                ALenum v15 = "AL_BUFFERS_PROCESSED";
                break;
              case 4128:
                ALenum v15 = "AL_REFERENCE_DISTANCE";
                break;
              case 4129:
                ALenum v15 = "AL_ROLLOFF_FACTOR";
                break;
              case 4130:
                ALenum v15 = "AL_CONE_OUTER_GAIN";
                break;
              case 4131:
                ALenum v15 = "AL_MAX_DISTANCE";
                break;
              case 4132:
                ALenum v15 = "AL_SEC_OFFSET";
                break;
              case 4133:
                ALenum v15 = "AL_SAMPLE_OFFSET";
                break;
              case 4134:
                ALenum v15 = "AL_BYTE_OFFSET";
                break;
              case 4135:
                ALenum v15 = "AL_SOURCE_TYPE";
                break;
              default:
                if (v14)
                {
                  if (v14 == 514) {
                    ALenum v15 = "AL_SOURCE_RELATIVE";
                  }
                  else {
LABEL_16:
                  }
                    ALenum v15 = "UNKNOWN ATTRIBUTE - WARNING WARNING WARNING";
                }
                else
                {
                  ALenum v15 = "AL_NONE";
                }
                break;
            }
          }
          LODWORD(buf) = 136315650;
          *(void *)((char *)&buf + 4) = "oalImp.cpp";
          WORD6(buf) = 1024;
          *(_DWORD *)((char *)&buf + 14) = 3397;
          WORD1(a12) = 2080;
          *(void *)((char *)&a12 + 4) = v15;
          _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alGetString = %s", (uint8_t *)&buf, 0x1Cu);
        }
        if (v14 > 45056)
        {
          int v16 = "Apple Inc.";
          switch(v14)
          {
            case 45057:
              goto LABEL_65;
            case 45058:
              int v16 = "1.1";
              goto LABEL_65;
            case 45059:
              int v16 = "Software";
              goto LABEL_65;
            case 45060:
              int v16 = (char *)alExtensions;
              if (!alExtensions)
              {
                int v16 = (char *)malloc_type_malloc(0x8CuLL, 0x1C4BE439uLL);
                alExtensions = (uint64_t)v16;
                strcpy(v16, "AL_EXT_OFFSET AL_EXT_LINEAR_DISTANCE AL_EXT_EXPONENT_DISTANCE AL_EXT_STATIC_BUFFER AL_EXT_SOURCE_NOTIFICATIONS AL_EXT_SOURCE_SPATIALIZATION");
              }
              goto LABEL_65;
            default:
              goto LABEL_62;
          }
        }
        switch(v14)
        {
          case 40961:
            int v16 = "Invalid Name";
            goto LABEL_65;
          case 40962:
            int v16 = "Invalid Enum";
            goto LABEL_65;
          case 40963:
            int v16 = "Invalid Value";
            goto LABEL_65;
          case 40964:
            int v16 = "Invalid Operation";
            goto LABEL_65;
          case 40965:
            int v16 = "Out of Memory";
            goto LABEL_65;
          default:
            if (v14 == -1)
            {
              int v16 = "Unknown Internal Error";
            }
            else if (v14)
            {
LABEL_62:
              pthread_once(&gErrorOnce, ErrorKeyInitializer);
              if (!pthread_getspecific(gALErrorKey)) {
                pthread_setspecific(gALErrorKey, (const void *)0xA002);
              }
              int v16 = 0;
            }
            else
            {
              int v16 = "No Error";
            }
LABEL_65:
            LODWORD(a9) = 136315650;
            *(void *)((char *)&a9 + 4) = "oalImp.cpp";
            WORD6(a9) = 1024;
            *(_DWORD *)((char *)&a9 + 14) = 4158;
            WORD1(a10) = 2080;
            *(void *)((char *)&a10 + 4) = v16;
            _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceAddNotification FAILED = %s\n", (uint8_t *)&a9, 0x1Cu);
            break;
        }
      }
      __cxa_end_catch();
    }
    else
    {
      alSourceAddNotification_cold_1();
    }
    JUMPOUT(0x22154BF0CLL);
  }
  JUMPOUT(0x22154BF98);
}

void sub_22154C434(_Unwind_Exception *a1)
{
}

void alSourceRemoveNotification(unsigned int a1, int a2, void (*a3)(unsigned int, unsigned int, void *), void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136315394;
    __int16 v20 = "oalImp.cpp";
    __int16 v21 = 1024;
    int v22 = 4173;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceRemoveNotification-->", (uint8_t *)&v19, 0x12u);
  }
  if (a3 && gOALContextMap)
  {
    unint64_t v8 = gCurrentContext;
    uint64_t v9 = gContextMapLock;
    int v10 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
    uint64_t v11 = *(void **)(gOALContextMap + 8);
    if (!v11) {
      goto LABEL_16;
    }
    uint64_t v12 = gOALContextMap + 8;
    do
    {
      unint64_t v13 = v11[4];
      BOOL v14 = v13 >= v8;
      if (v13 >= v8) {
        ALenum v15 = v11;
      }
      else {
        ALenum v15 = v11 + 1;
      }
      if (v14) {
        uint64_t v12 = (uint64_t)v11;
      }
      uint64_t v11 = (void *)*v15;
    }
    while (*v15);
    if (v12 != gOALContextMap + 8 && *(void *)(v12 + 32) <= v8)
    {
      int v16 = *(atomic_uint **)(v12 + 40);
      if (v16) {
        atomic_fetch_add(v16 + 110, 1u);
      }
    }
    else
    {
LABEL_16:
      int v16 = 0;
    }
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
    }
    if (v16)
    {
      unint64_t v17 = (atomic_uint *)OALContext::ProtectSource((OALContext *)v16, a1);
      atomic_fetch_add(v16 + 110, 0xFFFFFFFF);
      if (v17)
      {
        __int16 v18 = v17;
        OALSource::RemoveNotification(v17, a2, a3, a4);
        atomic_fetch_add(v18 + 18, 0xFFFFFFFF);
      }
    }
  }
}

void sub_22154C714(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void sub_22154C72C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, long long a10)
{
  if (a2)
  {
    uint64_t v12 = (ALenum *)__cxa_begin_catch(a1);
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (a2 == 2)
    {
      if (v13)
      {
        String = alGetString(*v12);
        LODWORD(a9) = 136315650;
        *(void *)((char *)&a9 + 4) = "oalImp.cpp";
        WORD6(a9) = 1024;
        *(_DWORD *)((char *)&a9 + 14) = 4186;
        WORD1(a10) = 2080;
        *(void *)((char *)&a10 + 4) = String;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceRemoveNotification FAILED = %s\n", (uint8_t *)&a9, 0x1Cu);
      }
      __cxa_end_catch();
    }
    else
    {
      alSourceRemoveNotification_cold_1(v13);
    }
    if (!v10) {
      JUMPOUT(0x22154C6C4);
    }
    JUMPOUT(0x22154C6B8);
  }
  JUMPOUT(0x22154C71CLL);
}

void sub_22154C7D8(_Unwind_Exception *a1)
{
}

uint64_t alcASASetListener(int a1, AudioUnitParameterValue *a2, unsigned int a3)
{
  if (!a2) {
    return 40963;
  }
  if (gOALContextMap)
  {
    unint64_t v6 = gCurrentContext;
    uint64_t v7 = gContextMapLock;
    int v8 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
    uint64_t v9 = *(void **)(gOALContextMap + 8);
    if (!v9) {
      goto LABEL_14;
    }
    uint64_t v10 = gOALContextMap + 8;
    do
    {
      unint64_t v11 = v9[4];
      BOOL v12 = v11 >= v6;
      if (v11 >= v6) {
        BOOL v13 = v9;
      }
      else {
        BOOL v13 = v9 + 1;
      }
      if (v12) {
        uint64_t v10 = (uint64_t)v9;
      }
      uint64_t v9 = (void *)*v13;
    }
    while (*v13);
    if (v10 != gOALContextMap + 8 && *(void *)(v10 + 32) <= v6)
    {
      BOOL v14 = *(atomic_uint **)(v10 + 40);
      if (v14) {
        atomic_fetch_add(v14 + 110, 1u);
      }
    }
    else
    {
LABEL_14:
      BOOL v14 = 0;
    }
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
    }
    uint64_t result = 40961;
    if (a1 <= 1920362347)
    {
LABEL_18:
      switch(a1)
      {
        case 1920361826:
          float v18 = *a2;
          if (*a2 < 0.5 || v18 > 4.0)
          {
            exception = __cxa_allocate_exception(4uLL);
            _DWORD *exception = 40963;
            __cxa_throw(exception, MEMORY[0x263F8C258], 0);
          }
          OALContext::SetReverbEQBandwidth((uint64_t)v14, v18);
          break;
        case 1920361830:
          float v20 = *a2;
          if (*a2 < 10.0 || v20 > 20000.0)
          {
            int v25 = __cxa_allocate_exception(4uLL);
            *int v25 = 40963;
            __cxa_throw(v25, MEMORY[0x263F8C258], 0);
          }
          OALContext::SetReverbEQFrequency((uint64_t)v14, v20);
          break;
        case 1920361831:
          float v16 = *a2;
          if (*a2 < -18.0 || v16 > 18.0)
          {
            __int16 v24 = __cxa_allocate_exception(4uLL);
            *__int16 v24 = 40963;
            __cxa_throw(v24, MEMORY[0x263F8C258], 0);
          }
          OALContext::SetReverbEQGain((uint64_t)v14, v16);
          break;
        default:
          goto LABEL_51;
      }
      goto LABEL_50;
    }
  }
  else
  {
    BOOL v14 = 0;
    uint64_t result = 40961;
    if (a1 <= 1920362347) {
      goto LABEL_18;
    }
  }
  if (a1 == 1920362348)
  {
    if (a3 > 3)
    {
      OALContext::SetReverbLevel((uint64_t)v14, *a2);
      goto LABEL_50;
    }
LABEL_56:
    int v22 = __cxa_allocate_exception(4uLL);
    *int v22 = 40964;
    __cxa_throw(v22, MEMORY[0x263F8C258], 0);
  }
  if (a1 == 1920364398)
  {
    if (a3 >= 4)
    {
      OALContext::SetReverbState((OALContext *)v14, *(_DWORD *)a2);
      goto LABEL_50;
    }
    goto LABEL_56;
  }
  if (a1 != 1920365172) {
    goto LABEL_51;
  }
  if (a3 < 4) {
    goto LABEL_56;
  }
  OALContext::SetReverbRoomType((uint64_t)v14, *(_DWORD *)a2);
LABEL_50:
  uint64_t result = 0;
LABEL_51:
  if (v14) {
    atomic_fetch_add(v14 + 110, 0xFFFFFFFF);
  }
  return result;
}

void sub_22154CB24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, long long a10)
{
  if (a2)
  {
    BOOL v12 = (ALenum *)__cxa_begin_catch(exception_object);
    if (a2 == 2)
    {
      ALenum v13 = *v12;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        String = alGetString(v13);
        ALCAttributeString = GetALCAttributeString(v10);
        LODWORD(a9) = 136315906;
        *(void *)((char *)&a9 + 4) = "oalImp.cpp";
        WORD6(a9) = 1024;
        *(_DWORD *)((char *)&a9 + 14) = 4884;
        WORD1(a10) = 2080;
        *(void *)((char *)&a10 + 4) = ALCAttributeString;
        WORD6(a10) = 2080;
        *(void *)((char *)&a10 + 14) = String;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR ASAGetListener FAILED--> property %s : error = %s", (uint8_t *)&a9, 0x26u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      float v16 = alGetString(-1);
      unint64_t v17 = GetALCAttributeString(v10);
      LODWORD(a9) = 136315906;
      *(void *)((char *)&a9 + 4) = "oalImp.cpp";
      WORD6(a9) = 1024;
      *(_DWORD *)((char *)&a9 + 14) = 4888;
      WORD1(a10) = 2080;
      *(void *)((char *)&a10 + 4) = v17;
      WORD6(a10) = 2080;
      *(void *)((char *)&a10 + 14) = v16;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR ASAGetListener FAILED--> property %s : error = %s", (uint8_t *)&a9, 0x26u);
    }
    __cxa_end_catch();
    JUMPOUT(0x22154CA34);
  }
  _Unwind_Resume(exception_object);
}

void sub_22154CCA0()
{
}

void sub_22154CCAC(uint64_t a1, int a2)
{
  if (a2) {
    JUMPOUT(0x22154CCB4);
  }
  JUMPOUT(0x22154CB48);
}

void sub_22154CCBC(_Unwind_Exception *a1)
{
}

uint64_t alcASAGetListener(int a1, float *a2, _DWORD *a3)
{
  if (gOALContextMap)
  {
    unint64_t v6 = gCurrentContext;
    uint64_t v7 = gContextMapLock;
    int v8 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
    uint64_t v9 = *(void **)(gOALContextMap + 8);
    if (!v9) {
      goto LABEL_13;
    }
    uint64_t v10 = gOALContextMap + 8;
    do
    {
      unint64_t v11 = v9[4];
      BOOL v12 = v11 >= v6;
      if (v11 >= v6) {
        ALenum v13 = v9;
      }
      else {
        ALenum v13 = v9 + 1;
      }
      if (v12) {
        uint64_t v10 = (uint64_t)v9;
      }
      uint64_t v9 = (void *)*v13;
    }
    while (*v13);
    if (v10 != gOALContextMap + 8 && *(void *)(v10 + 32) <= v6)
    {
      BOOL v14 = *(atomic_uint **)(v10 + 40);
      if (v14) {
        atomic_fetch_add(v14 + 110, 1u);
      }
    }
    else
    {
LABEL_13:
      BOOL v14 = 0;
    }
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
    }
    uint64_t result = 40961;
    if (a1 <= 1920362347)
    {
LABEL_17:
      switch(a1)
      {
        case 1920361826:
          if (*a3 >= 4u)
          {
            *a3 = 4;
            float ReverbEQBandwidth = OALContext::GetReverbEQBandwidth((OALContext *)v14);
            goto LABEL_33;
          }
          break;
        case 1920361830:
          if (*a3 > 3u)
          {
            *a3 = 4;
            float ReverbEQBandwidth = OALContext::GetReverbEQFrequency((OALContext *)v14);
            goto LABEL_33;
          }
          break;
        case 1920361831:
          if (*a3 >= 4u)
          {
            *a3 = 4;
            float ReverbEQBandwidth = OALContext::GetReverbEQGain((OALContext *)v14);
LABEL_33:
            uint64_t result = 0;
            *a2 = ReverbEQBandwidth;
            goto LABEL_34;
          }
          break;
        default:
          goto LABEL_34;
      }
LABEL_43:
      exception = __cxa_allocate_exception(4uLL);
      _DWORD *exception = 40964;
      __cxa_throw(exception, MEMORY[0x263F8C258], 0);
    }
  }
  else
  {
    BOOL v14 = 0;
    uint64_t result = 40961;
    if (a1 <= 1920362347) {
      goto LABEL_17;
    }
  }
  switch(a1)
  {
    case 1920362348:
      if (*a3 >= 4u)
      {
        uint64_t result = 0;
        *a3 = 4;
        *(_DWORD *)a2 = v14[125];
LABEL_40:
        atomic_fetch_add(v14 + 110, 0xFFFFFFFF);
        return result;
      }
      goto LABEL_43;
    case 1920364398:
      if (*a3 < 4u) {
        goto LABEL_43;
      }
      *a3 = 4;
      *(_DWORD *)a2 = v14[123];
      goto LABEL_38;
    case 1920365172:
LABEL_38:
      if (*a3 >= 4u)
      {
        uint64_t result = 0;
        *a3 = 4;
        *(_DWORD *)a2 = v14[124];
        goto LABEL_40;
      }
      goto LABEL_43;
  }
LABEL_34:
  if (v14) {
    goto LABEL_40;
  }
  return result;
}

void sub_22154CFA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, uint64_t a10, __int16 a11, int a12, __int16 a13, uint64_t a14, __int16 a15, uint64_t a16)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void sub_22154D11C(_Unwind_Exception *a1)
{
}

uint64_t alcASASetSource(int a1, unsigned int a2, AudioUnitParameterValue *a3, unsigned int a4)
{
  uint64_t v7 = (OALSource *)ProtectSourceObjectInCurrentContext(a2);
  int v8 = v7;
  switch(a1)
  {
    case 1868723060:
      if (a4 > 3)
      {
        OALSource::SetObstruction(v7, *a3);
        goto LABEL_10;
      }
      goto LABEL_15;
    case 1868784492:
      if (a4 >= 4)
      {
        OALSource::SetOcclusion((uint64_t)v7, *a3);
        goto LABEL_10;
      }
LABEL_15:
      exception = __cxa_allocate_exception(4uLL);
      _DWORD *exception = 40964;
      __cxa_throw(exception, MEMORY[0x263F8C258], 0);
    case 1920365420:
      if (a4 >= 4)
      {
        OALSource::SetReverbSendLevel(v7, *a3);
LABEL_10:
        uint64_t result = 0;
        goto LABEL_12;
      }
      goto LABEL_15;
  }
  uint64_t result = 40961;
LABEL_12:
  if (v8) {
    atomic_fetch_add((atomic_uint *volatile)v8 + 18, 0xFFFFFFFF);
  }
  return result;
}

void sub_22154D264(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, long long a12, int a13, __int16 a14, __int16 a15, const ALchar *a16)
{
  if (a2)
  {
    int v19 = (ALenum *)__cxa_begin_catch(a1);
    if (a2 == 2)
    {
      ALenum param = *v19;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        String = alGetString(param);
        ALCAttributeString = GetALCAttributeString(v17);
        LODWORD(buf) = 136316162;
        *(void *)((char *)&buf + 4) = "oalImp.cpp";
        WORD6(buf) = 1024;
        *(_DWORD *)((char *)&buf + 14) = 4697;
        WORD1(a12) = 2048;
        *(void *)((char *)&a12 + 4) = v16;
        WORD6(a12) = 2080;
        *(void *)((char *)&a12 + 14) = ALCAttributeString;
        a15 = 2080;
        a16 = String;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR ASASetSource FAILED--> source %ld : property %s : error = %s", (uint8_t *)&buf, 0x30u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v22 = alGetString(-1);
      uint64_t v23 = GetALCAttributeString(v17);
      LODWORD(buf) = 136316162;
      *(void *)((char *)&buf + 4) = "oalImp.cpp";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 4701;
      WORD1(a12) = 2048;
      *(void *)((char *)&a12 + 4) = v16;
      WORD6(a12) = 2080;
      *(void *)((char *)&a12 + 14) = v23;
      a15 = 2080;
      a16 = v22;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR ASASetSource FAILED--> source %ld : property %s : error = %s", (uint8_t *)&buf, 0x30u);
    }
    __cxa_end_catch();
    JUMPOUT(0x22154D1FCLL);
  }
  _Unwind_Resume(a1);
}

uint64_t alcASAGetSource(int a1, unsigned int a2, _DWORD *a3, _DWORD *a4)
{
  if (gOALContextMap)
  {
    unint64_t v8 = gCurrentContext;
    uint64_t v9 = gContextMapLock;
    int v10 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
    unint64_t v11 = *(void **)(gOALContextMap + 8);
    if (!v11) {
      goto LABEL_13;
    }
    uint64_t v12 = gOALContextMap + 8;
    do
    {
      unint64_t v13 = v11[4];
      BOOL v14 = v13 >= v8;
      if (v13 >= v8) {
        ALenum v15 = v11;
      }
      else {
        ALenum v15 = v11 + 1;
      }
      if (v14) {
        uint64_t v12 = (uint64_t)v11;
      }
      unint64_t v11 = (void *)*v15;
    }
    while (*v15);
    if (v12 != gOALContextMap + 8 && *(void *)(v12 + 32) <= v8)
    {
      unsigned int v16 = *(atomic_uint **)(v12 + 40);
      if (v16) {
        atomic_fetch_add(v16 + 110, 1u);
      }
    }
    else
    {
LABEL_13:
      unsigned int v16 = 0;
    }
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
    }
    if (v16)
    {
      uint64_t v17 = OALContext::ProtectSource((OALContext *)v16, a2);
      atomic_fetch_add(v16 + 110, 0xFFFFFFFF);
      float v18 = (atomic_uint *)v17;
      if (a1 == 1868723060) {
        goto LABEL_18;
      }
LABEL_21:
      if (a1 == 1868784492)
      {
        if (*a4 >= 4u)
        {
          *a4 = 4;
          int v19 = v18 + 109;
          goto LABEL_27;
        }
      }
      else
      {
        if (a1 != 1920365420)
        {
          uint64_t v20 = 40961;
          if (!v18) {
            return v20;
          }
          goto LABEL_28;
        }
        if (*a4 >= 4u)
        {
          *a4 = 4;
          int v19 = v18 + 108;
          goto LABEL_27;
        }
      }
LABEL_34:
      exception = __cxa_allocate_exception(4uLL);
      _DWORD *exception = 40964;
      __cxa_throw(exception, MEMORY[0x263F8C258], 0);
    }
  }
  float v18 = 0;
  if (a1 != 1868723060) {
    goto LABEL_21;
  }
LABEL_18:
  if (*a4 <= 3u) {
    goto LABEL_34;
  }
  *a4 = 4;
  int v19 = v18 + 110;
LABEL_27:
  uint64_t v20 = 0;
  *a3 = *v19;
LABEL_28:
  atomic_fetch_add(v18 + 18, 0xFFFFFFFF);
  return v20;
}

void sub_22154D65C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, uint64_t a10, __int16 a11, int a12, __int16 a13, uint64_t a14, __int16 a15, uint64_t a16, __int16 a17, uint64_t a18)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void sub_22154D7FC(_Unwind_Exception *a1)
{
}

void alSourceRenderingQuality(unsigned int a1, int a2)
{
  *(void *)&v11[5] = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315650;
    uint64_t v7 = "oalImp.cpp";
    __int16 v8 = 1024;
    int v9 = 4092;
    __int16 v10 = 2048;
    *(void *)unint64_t v11 = a2;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceRenderingQuality--> value = %ld", (uint8_t *)&v6, 0x1Cu);
  }
  int v4 = (OALSource *)ProtectSourceObjectInCurrentContext(a1);
  uint64_t v5 = v4;
  if (v4 && !OALSource::SetRenderQuality(v4, a2)) {
    goto LABEL_8;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315906;
    uint64_t v7 = "oalImp.cpp";
    __int16 v8 = 1024;
    int v9 = 4105;
    __int16 v10 = 1024;
    v11[0] = a1;
    LOWORD(v11[1]) = 2048;
    *(void *)((char *)&v11[1] + 2) = a2;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceRenderingQuality FAILED: source: %d : value: %ld", (uint8_t *)&v6, 0x22u);
  }
  if (v5) {
LABEL_8:
  }
    atomic_fetch_add((atomic_uint *volatile)v5 + 18, 0xFFFFFFFF);
}

uint64_t alSourceGetRenderingQuality(unsigned int a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    int v6 = "oalImp.cpp";
    __int16 v7 = 1024;
    int v8 = 4114;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alSourceGetRenderingQuality-->", (uint8_t *)&v5, 0x12u);
  }
  int v2 = (OALSource *)ProtectSourceObjectInCurrentContext(a1);
  if (v2)
  {
    __int16 v3 = v2;
    uint64_t result = OALSource::GetRenderQuality(v2);
    atomic_fetch_add((atomic_uint *volatile)v3 + 18, 0xFFFFFFFF);
  }
  else
  {
    uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (result)
    {
      int v5 = 136315650;
      int v6 = "oalImp.cpp";
      __int16 v7 = 1024;
      int v8 = 4123;
      __int16 v9 = 1024;
      unsigned int v10 = a1;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alSourceGetRenderingQuality FAILED: source: %d", (uint8_t *)&v5, 0x18u);
      return 0;
    }
  }
  return result;
}

void *alcOutputCapturerPrepare(unsigned int a1, int a2, int a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136316418;
    uint64_t v17 = "oalImp.cpp";
    __int16 v18 = 1024;
    int v19 = 4904;
    __int16 v20 = 1024;
    int v21 = gCurrentContext;
    __int16 v22 = 1024;
    unsigned int v23 = a1;
    __int16 v24 = 1024;
    int v25 = a2;
    __int16 v26 = 1024;
    int v27 = a3;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOutputCapturerPrepare--> context = %u, frequency = %u, format = %d, buffersize = %d", (uint8_t *)&v16, 0x2Au);
  }
  if (gOALContextMap)
  {
    unint64_t v6 = gCurrentContext;
    uint64_t v7 = gContextMapLock;
    int v8 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
    __int16 v9 = *(void **)(gOALContextMap + 8);
    if (!v9) {
      goto LABEL_15;
    }
    uint64_t v10 = gOALContextMap + 8;
    do
    {
      unint64_t v11 = v9[4];
      BOOL v12 = v11 >= v6;
      if (v11 >= v6) {
        unint64_t v13 = v9;
      }
      else {
        unint64_t v13 = v9 + 1;
      }
      if (v12) {
        uint64_t v10 = (uint64_t)v9;
      }
      __int16 v9 = (void *)*v13;
    }
    while (*v13);
    if (v10 != gOALContextMap + 8 && *(void *)(v10 + 32) <= v6)
    {
      BOOL v14 = *(atomic_uint **)(v10 + 40);
      if (v14) {
        atomic_fetch_add(v14 + 110, 1u);
      }
    }
    else
    {
LABEL_15:
      BOOL v14 = 0;
    }
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
    }
    if (v14) {
      OALContext::OutputCapturerCreate((OALContext *)v14, (double)a1);
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315394;
    uint64_t v17 = "oalImp.cpp";
    __int16 v18 = 1024;
    int v19 = 4926;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcOutputCapturerPrepare FAILED", (uint8_t *)&v16, 0x12u);
  }
  pthread_once(&gErrorOnce, ErrorKeyInitializer);
  uint64_t result = pthread_getspecific(gALCErrorKey);
  if (!result) {
    return (void *)pthread_setspecific(gALCErrorKey, (const void *)0xA004);
  }
  return result;
}

void sub_22154DD60(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void *alcOutputCapturerStart()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315650;
    unint64_t v11 = "oalImp.cpp";
    __int16 v12 = 1024;
    int v13 = 4933;
    __int16 v14 = 2048;
    uint64_t v15 = gCurrentContext;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOutputCapturerStart--> context = %ld", (uint8_t *)&v10, 0x1Cu);
  }
  if (!gOALContextMap) {
    goto LABEL_29;
  }
  unint64_t v0 = gCurrentContext;
  uint64_t v1 = gContextMapLock;
  int v2 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  __int16 v3 = *(void **)(gOALContextMap + 8);
  if (!v3) {
    goto LABEL_15;
  }
  uint64_t v4 = gOALContextMap + 8;
  do
  {
    unint64_t v5 = v3[4];
    BOOL v6 = v5 >= v0;
    if (v5 >= v0) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = v3 + 1;
    }
    if (v6) {
      uint64_t v4 = (uint64_t)v3;
    }
    __int16 v3 = (void *)*v7;
  }
  while (*v7);
  if (v4 != gOALContextMap + 8 && *(void *)(v4 + 32) <= v0)
  {
    int v8 = *(atomic_uint **)(v4 + 40);
    if (v8) {
      atomic_fetch_add(v8 + 110, 1u);
    }
  }
  else
  {
LABEL_15:
    int v8 = 0;
  }
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  }
  if (!v8
    || (uint64_t result = (void *)OALContext::OutputCapturerStart((OALContext *)v8),
        atomic_fetch_add(v8 + 110, 0xFFFFFFFF),
        result))
  {
LABEL_29:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315394;
      unint64_t v11 = "oalImp.cpp";
      __int16 v12 = 1024;
      int v13 = 4955;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcOutputCapturerStart FAILED", (uint8_t *)&v10, 0x12u);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    uint64_t result = pthread_getspecific(gALCErrorKey);
    if (!result) {
      return (void *)pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    }
  }
  return result;
}

void sub_22154DFBC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void *alcOutputCapturerStop()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315650;
    unint64_t v11 = "oalImp.cpp";
    __int16 v12 = 1024;
    int v13 = 4962;
    __int16 v14 = 2048;
    uint64_t v15 = gCurrentContext;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOutputCapturerStop--> context = %ld", (uint8_t *)&v10, 0x1Cu);
  }
  if (!gOALContextMap) {
    goto LABEL_29;
  }
  unint64_t v0 = gCurrentContext;
  uint64_t v1 = gContextMapLock;
  int v2 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  __int16 v3 = *(void **)(gOALContextMap + 8);
  if (!v3) {
    goto LABEL_15;
  }
  uint64_t v4 = gOALContextMap + 8;
  do
  {
    unint64_t v5 = v3[4];
    BOOL v6 = v5 >= v0;
    if (v5 >= v0) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = v3 + 1;
    }
    if (v6) {
      uint64_t v4 = (uint64_t)v3;
    }
    __int16 v3 = (void *)*v7;
  }
  while (*v7);
  if (v4 != gOALContextMap + 8 && *(void *)(v4 + 32) <= v0)
  {
    int v8 = *(atomic_uint **)(v4 + 40);
    if (v8) {
      atomic_fetch_add(v8 + 110, 1u);
    }
  }
  else
  {
LABEL_15:
    int v8 = 0;
  }
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  }
  if (!v8
    || (uint64_t result = (void *)OALContext::OutputCapturerStop((OALContext *)v8),
        atomic_fetch_add(v8 + 110, 0xFFFFFFFF),
        result))
  {
LABEL_29:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315394;
      unint64_t v11 = "oalImp.cpp";
      __int16 v12 = 1024;
      int v13 = 4984;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcOutputCapturerStop FAILED", (uint8_t *)&v10, 0x12u);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    uint64_t result = pthread_getspecific(gALCErrorKey);
    if (!result) {
      return (void *)pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    }
  }
  return result;
}

void sub_22154E218(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

OALCaptureMixer *alcOutputCapturerAvailableSamples()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315650;
    unint64_t v11 = "oalImp.cpp";
    __int16 v12 = 1024;
    int v13 = 4991;
    __int16 v14 = 2048;
    uint64_t v15 = gCurrentContext;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOutputCapturerAvailableSamples--> context = %ld", (uint8_t *)&v10, 0x1Cu);
  }
  if (!gOALContextMap) {
    goto LABEL_30;
  }
  unint64_t v0 = gCurrentContext;
  uint64_t v1 = gContextMapLock;
  int v2 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  __int16 v3 = *(void **)(gOALContextMap + 8);
  if (!v3) {
    goto LABEL_15;
  }
  uint64_t v4 = gOALContextMap + 8;
  do
  {
    unint64_t v5 = v3[4];
    BOOL v6 = v5 >= v0;
    if (v5 >= v0) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = v3 + 1;
    }
    if (v6) {
      uint64_t v4 = (uint64_t)v3;
    }
    __int16 v3 = (void *)*v7;
  }
  while (*v7);
  if (v4 != gOALContextMap + 8 && *(void *)(v4 + 32) <= v0)
  {
    int v8 = *(atomic_uint **)(v4 + 40);
    if (v8) {
      atomic_fetch_add(v8 + 110, 1u);
    }
  }
  else
  {
LABEL_15:
    int v8 = 0;
  }
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  }
  if (v8)
  {
    uint64_t result = OALContext::OutputCapturerAvailableFrames((OALContext *)v8);
    atomic_fetch_add(v8 + 110, 0xFFFFFFFF);
  }
  else
  {
LABEL_30:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315394;
      unint64_t v11 = "oalImp.cpp";
      __int16 v12 = 1024;
      int v13 = 5015;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcOutputCapturerAvailableSamples FAILED", (uint8_t *)&v10, 0x12u);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    if (!pthread_getspecific(gALCErrorKey)) {
      pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    }
    return 0;
  }
  return result;
}

void sub_22154E478(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void *alcOutputCapturerSamples(unsigned __int8 *a1, unsigned int a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136316162;
    uint64_t v15 = "oalImp.cpp";
    __int16 v16 = 1024;
    int v17 = 5023;
    __int16 v18 = 2048;
    uint64_t v19 = gCurrentContext;
    __int16 v20 = 2048;
    int v21 = a1;
    __int16 v22 = 1024;
    unsigned int v23 = a2;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d alcOutputCapturerSamples--> context = %ld, buffer = %p, samples = %d", (uint8_t *)&v14, 0x2Cu);
  }
  if (!gOALContextMap) {
    goto LABEL_29;
  }
  unint64_t v4 = gCurrentContext;
  uint64_t v5 = gContextMapLock;
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
  uint64_t v7 = *(void **)(gOALContextMap + 8);
  if (!v7) {
    goto LABEL_15;
  }
  uint64_t v8 = gOALContextMap + 8;
  do
  {
    unint64_t v9 = v7[4];
    BOOL v10 = v9 >= v4;
    if (v9 >= v4) {
      unint64_t v11 = v7;
    }
    else {
      unint64_t v11 = v7 + 1;
    }
    if (v10) {
      uint64_t v8 = (uint64_t)v7;
    }
    uint64_t v7 = (void *)*v11;
  }
  while (*v11);
  if (v8 != gOALContextMap + 8 && *(void *)(v8 + 32) <= v4)
  {
    __int16 v12 = *(atomic_uint **)(v8 + 40);
    if (v12) {
      atomic_fetch_add(v12 + 110, 1u);
    }
  }
  else
  {
LABEL_15:
    __int16 v12 = 0;
  }
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
  if (!v12
    || (uint64_t result = (void *)OALContext::OutputCapturerGetFrames((OALContext *)v12, a2, a1),
        atomic_fetch_add(v12 + 110, 0xFFFFFFFF),
        result))
  {
LABEL_29:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      uint64_t v15 = "oalImp.cpp";
      __int16 v16 = 1024;
      int v17 = 5045;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: alcOutputCapturerSamples FAILED", (uint8_t *)&v14, 0x12u);
    }
    pthread_once(&gErrorOnce, ErrorKeyInitializer);
    uint64_t result = pthread_getspecific(gALCErrorKey);
    if (!result) {
      return (void *)pthread_setspecific(gALCErrorKey, (const void *)0xA004);
    }
  }
  return result;
}

void sub_22154E6FC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void alSetInteger(int a1, unsigned int a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int v25 = 136315394;
    *(void *)&v25[4] = "oalImp.cpp";
    __int16 v26 = 1024;
    int v27 = 4232;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ***** alSetIntegeri", v25, 0x12u);
  }
  switch(a1)
  {
    case 61445:
      if (gRenderChannelSetting == a2) {
        goto LABEL_50;
      }
      if (!gOALDeviceMap)
      {
        exception = __cxa_allocate_exception(4uLL);
        _DWORD *exception = 40964;
        __cxa_throw(exception, MEMORY[0x263F8C258], 0);
      }
      gRenderChannelSetting = a2;
      *(void *)int v25 = gDeviceMapLock;
      int v13 = (*(uint64_t (**)(uint64_t))(*(void *)gDeviceMapLock + 16))(gDeviceMapLock);
      v25[8] = v13;
      uint64_t v14 = gOALDeviceMap;
      if (!*(_DWORD *)(gOALDeviceMap + 16))
      {
LABEL_48:
        if (v13) {
          (*(void (**)(void))(**(void **)v25 + 24))(*(void *)v25);
        }
        goto LABEL_50;
      }
      uint64_t v15 = 0;
      while (1)
      {
        int v17 = *(void **)v14;
        if (v15)
        {
          uint64_t v18 = v15;
          do
          {
            __int16 v20 = (void *)v17[1];
            if (v20)
            {
              do
              {
                int v21 = v20;
                __int16 v20 = (void *)*v20;
              }
              while (v20);
            }
            else
            {
              do
              {
                int v21 = (void *)v17[2];
                BOOL v22 = *v21 == (void)v17;
                int v17 = v21;
              }
              while (!v22);
            }
            int v17 = v21;
          }
          while (v18-- > 1);
        }
        else
        {
          int v21 = *(void **)v14;
        }
        if (v21 == (void *)(v14 + 8))
        {
          unsigned int v23 = 0;
          if (MEMORY[0x44] == gRenderChannelSetting) {
            goto LABEL_29;
          }
        }
        else
        {
          unsigned int v23 = (atomic_uint *)v21[5];
          if (v23[17] == gRenderChannelSetting) {
            goto LABEL_29;
          }
        }
        __int16 v16 = v23 + 19;
        atomic_fetch_add(v23 + 19, 1u);
        OALDevice::SetRenderChannelSetting((OALDevice *)v23, gRenderChannelSetting);
        atomic_fetch_add(v16, 0xFFFFFFFF);
        uint64_t v14 = gOALDeviceMap;
LABEL_29:
        if (++v15 >= (unint64_t)*(unsigned int *)(v14 + 16))
        {
          int v13 = v25[8];
          goto LABEL_48;
        }
      }
    case 61444:
LABEL_50:
      gMaximumMixerBusCount = a2;
      return;
    case 61442:
      if (a2 == 1751412840 || a2 == 1920034921 || a2 == 1919183983)
      {
        if (gOALContextMap)
        {
          unint64_t v4 = gCurrentContext;
          uint64_t v5 = gContextMapLock;
          int v6 = (*(uint64_t (**)(uint64_t))(*(void *)gContextMapLock + 16))(gContextMapLock);
          uint64_t v7 = *(void **)(gOALContextMap + 8);
          if (!v7) {
            goto LABEL_21;
          }
          uint64_t v8 = gOALContextMap + 8;
          do
          {
            unint64_t v9 = v7[4];
            BOOL v10 = v9 >= v4;
            if (v9 >= v4) {
              unint64_t v11 = v7;
            }
            else {
              unint64_t v11 = v7 + 1;
            }
            if (v10) {
              uint64_t v8 = (uint64_t)v7;
            }
            uint64_t v7 = (void *)*v11;
          }
          while (*v11);
          if (v8 != gOALContextMap + 8 && *(void *)(v8 + 32) <= v4)
          {
            __int16 v12 = *(atomic_uint **)(v8 + 40);
            if (v12) {
              atomic_fetch_add(v12 + 110, 1u);
            }
          }
          else
          {
LABEL_21:
            __int16 v12 = 0;
          }
          if (v6) {
            (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
          }
        }
        else
        {
          __int16 v12 = 0;
        }
        OALContext::SetRenderQuality((OALContext *)v12, a2);
        if (v12) {
          atomic_fetch_add(v12 + 110, 0xFFFFFFFF);
        }
      }
      break;
    default:
      pthread_once(&gErrorOnce, ErrorKeyInitializer);
      if (!pthread_getspecific(gALErrorKey)) {
        pthread_setspecific(gALErrorKey, (const void *)0xA003);
      }
      break;
  }
}

void sub_22154EAF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, uint64_t a10, __int16 a11, int a12, __int16 a13, uint64_t a14)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void sub_22154EC88(_Unwind_Exception *a1)
{
}

BOOL IsValidRenderQuality(int a1)
{
  BOOL v1 = a1 == 1919183983 || a1 == 1920034921;
  return a1 == 1751412840 || v1;
}

uint64_t FillInASBD(uint64_t a1, int a2, unsigned int a3)
{
  if ((a2 - 4352) > 3) {
    return 40963;
  }
  uint64_t result = 0;
  uint64_t v5 = 4 * (a2 - 4352);
  int v6 = *(_DWORD *)((char *)&unk_22155D030 + v5);
  int v7 = *(_DWORD *)((char *)&unk_22155D040 + v5);
  unsigned int v8 = *(_DWORD *)((char *)&unk_22155D050 + v5);
  LODWORD(v5) = *(_DWORD *)((char *)&unk_22155D060 + v5);
  *(double *)a1 = (double)a3;
  *(_DWORD *)(a1 + 8) = 1819304813;
  *(_DWORD *)(a1 + 12) = v6;
  *(_DWORD *)(a1 + 16) = v7;
  *(_DWORD *)(a1 + 20) = 1;
  *(_DWORD *)(a1 + 24) = v7;
  *(_DWORD *)(a1 + 28) = v5;
  *(void *)(a1 + 32) = v8;
  return result;
}

char *std::__tree<std::__value_type<unsigned long,OALCaptureDevice *>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,OALCaptureDevice *>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,OALCaptureDevice *>>>::__emplace_hint_multi<std::pair<unsigned long const,OALCaptureDevice *>>(uint64_t ***a1, uint64_t **a2, _OWORD *a3)
{
  int v6 = (char *)operator new(0x30uLL);
  int v7 = v6;
  unsigned int v8 = (unint64_t *)(v6 + 32);
  *((_OWORD *)v6 + 2) = *a3;
  unint64_t v9 = (uint64_t **)(a1 + 1);
  if (a1 + 1 != (uint64_t ***)a2)
  {
    unint64_t v10 = *v8;
    if ((unint64_t)a2[4] < *v8)
    {
      while (1)
      {
        unint64_t v11 = *v9;
        __int16 v12 = v9;
        if (!*v9) {
          goto LABEL_25;
        }
        while (1)
        {
          unint64_t v9 = (uint64_t **)v11;
          if (v11[4] >= v10) {
            break;
          }
          unint64_t v11 = (uint64_t *)v11[1];
          if (!v11) {
            goto LABEL_19;
          }
        }
      }
    }
  }
  int v13 = *a2;
  if (*a1 == a2)
  {
    uint64_t v15 = a2;
    goto LABEL_20;
  }
  if (v13)
  {
    uint64_t v14 = *a2;
    do
    {
      uint64_t v15 = (uint64_t **)v14;
      uint64_t v14 = (uint64_t *)v14[1];
    }
    while (v14);
  }
  else
  {
    __int16 v16 = a2;
    do
    {
      uint64_t v15 = (uint64_t **)v16[2];
      BOOL v17 = *v15 == (uint64_t *)v16;
      __int16 v16 = v15;
    }
    while (v17);
  }
  unint64_t v18 = *v8;
  if (*v8 >= (unint64_t)v15[4])
  {
LABEL_20:
    __int16 v12 = v15 + 1;
    if (v13) {
      unint64_t v9 = v15;
    }
    else {
      unint64_t v9 = a2;
    }
    if (!v13) {
      __int16 v12 = a2;
    }
    goto LABEL_25;
  }
  while (1)
  {
    uint64_t v19 = *v9;
    __int16 v12 = v9;
    if (!*v9) {
      break;
    }
    while (1)
    {
      unint64_t v9 = (uint64_t **)v19;
      if (v18 < v19[4]) {
        break;
      }
      uint64_t v19 = (uint64_t *)v19[1];
      if (!v19)
      {
LABEL_19:
        __int16 v12 = v9 + 1;
        goto LABEL_25;
      }
    }
  }
LABEL_25:
  *(void *)int v6 = 0;
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = v9;
  *__int16 v12 = (uint64_t *)v6;
  __int16 v20 = **a1;
  int v21 = (uint64_t *)v6;
  if (v20)
  {
    *a1 = (uint64_t **)v20;
    int v21 = *v12;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)a1[1], v21);
  a1[2] = (uint64_t **)((char *)a1[2] + 1);
  return v7;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OALSource::OALSource(OALSource *this, int a2, OALContext *a3)
{
  *(_DWORD *)this = a2;
  *((unsigned char *)this + 4) = 0;
  unint64_t v4 = (_OWORD *)((char *)this + 308);
  *((void *)this + 1) = a3;
  *((_DWORD *)this + 4) = 65792;
  *((unsigned char *)this + 20) = 1;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((_DWORD *)this + 12) = 0;
  *((_DWORD *)this + 13) = 0;
  *((_DWORD *)this + 14) = 0;
  *((unsigned char *)this + 60) = 1;
  *((void *)this + 8) = 0;
  *((_DWORD *)this + 18) = 0;
  CAGuard::CAGuard((OALSource *)((char *)this + 80), "OAL:SourceLock");
  *((_DWORD *)this + 58) = -1;
  *((_WORD *)this + 118) = 0;
  *((void *)this + 35) = 0x103000000000;
  *((_OWORD *)this + 18) = xmmword_22155D0B0;
  *((_DWORD *)this + 76) = 4113;
  __asm { FMOV            V0.4S, #1.0 }
  _OWORD *v4 = _Q0;
  v4[1] = xmmword_22155D0C0;
  *(void *)((char *)this + 340) = 0;
  *(void *)((char *)this + 345) = 0;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 392) = 0u;
  *(_OWORD *)((char *)this + 408) = 0u;
  *(_OWORD *)((char *)this + 424) = 0u;
  *((void *)this + 55) = 0x72646C6F00000000;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((void *)this + 34) = 0;
  operator new();
}

void sub_22154F0AC(_Unwind_Exception *a1)
{
  CAGuard::~CAGuard(v1);
  _Unwind_Resume(a1);
}

void OALSource::~OALSource(OALSource *this)
{
  AudioUnitElement v2 = *((_DWORD *)this + 58);
  if (v2 != -1)
  {
    *((void *)this + 27) = 0;
    *((void *)this + 28) = 0;
    if (!OALContext::SetBusRenderProc(*((AudioUnit **)this + 1), v2, (const AURenderCallbackStruct *)((char *)this + 216)))AUGraphUpdate(*(AUGraph *)(*(void *)(*((void *)this + 1) + 16) + 16), 0); {
    OALContext::SetBusEnable(*((OALContext **)this + 1), *((_DWORD *)this + 58), 1);
    }
    *((unsigned char *)this + 236) = 0;
    unsigned int v3 = *((_DWORD *)this + 58);
    if (v3 != -1)
    {
      OALContext::SetBusAsAvailable(*((void *)this + 1), v3);
      *((_DWORD *)this + 58) = -1;
    }
  }
  OALSource::FlushBufferQueue(this);
  uint64_t v4 = *((void *)this + 4);
  if (v4)
  {
    uint64_t v5 = *(void **)v4;
    if (*(void *)v4)
    {
      *(void *)(v4 + 8) = v5;
      operator delete(v5);
    }
    MEMORY[0x223C843A0](v4, 0x1020C4055CCDE27);
  }
  uint64_t v6 = *((void *)this + 3);
  if (v6)
  {
    int v7 = *(void **)v6;
    if (*(void *)v6)
    {
      *(void *)(v6 + 8) = v7;
      operator delete(v7);
    }
    MEMORY[0x223C843A0](v6, 0x1020C4055CCDE27);
  }
  uint64_t v8 = *((void *)this + 5);
  if (v8)
  {
    uint64_t v9 = *(void **)v8;
    if (*(void *)v8)
    {
      *(void *)(v8 + 8) = v9;
      operator delete(v9);
    }
    MEMORY[0x223C843A0](v8, 0x1020C4055CCDE27);
  }
  uint64_t v10 = *((void *)this + 52);
  if (v10)
  {
    uint64_t v11 = *(void *)(v10 + 24);
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
    }
    __int16 v12 = *(void **)v10;
    if (*(void *)v10)
    {
      *(void *)(v10 + 8) = v12;
      operator delete(v12);
    }
    MEMORY[0x223C843A0](v10, 0x1020C401C8C6399);
  }
  CAGuard::~CAGuard((OALSource *)((char *)this + 80));
}

uint64_t OALSource::StopRenderingToBus(uint64_t this)
{
  AudioUnitElement v1 = *(_DWORD *)(this + 232);
  if (v1 != -1)
  {
    uint64_t v2 = this;
    *(void *)(this + 216) = 0;
    *(void *)(this + 224) = 0;
    if (!OALContext::SetBusRenderProc(*(AudioUnit **)(this + 8), v1, (const AURenderCallbackStruct *)(this + 216)))AUGraphUpdate(*(AUGraph *)(*(void *)(*(void *)(v2 + 8) + 16) + 16), 0); {
    this = OALContext::SetBusEnable(*(OALContext **)(v2 + 8), *(_DWORD *)(v2 + 232), 1);
    }
    *(unsigned char *)(v2 + 236) = 0;
    unsigned int v3 = *(_DWORD *)(v2 + 232);
    if (v3 != -1)
    {
      this = OALContext::SetBusAsAvailable(*(void *)(v2 + 8), v3);
      *(_DWORD *)(v2 + 232) = -1;
    }
  }
  return this;
}

void *OALSource::FlushBufferQueue(void *this)
{
  uint64_t v1 = (uint64_t)this;
  uint64_t v2 = this[4];
  int v3 = *(_DWORD *)(v2 + 24);
  if (v3)
  {
    if (*(void *)v2 == *(void *)(v2 + 8))
    {
      do
      {
        *(_DWORD *)(v2 + 24) = 0;
        --v3;
      }
      while (v3);
    }
    else
    {
      do
      {
        while (1)
        {
          uint64_t v4 = *(void *)(v1 + 32);
          uint64_t v5 = *(OALBuffer ***)v4;
          if (*(void *)v4 != *(void *)(v4 + 8)) {
            break;
          }
          *(_DWORD *)(v4 + 24) = 0;
          if (!--v3) {
            goto LABEL_10;
          }
        }
        this = (void *)OALBuffer::ReleaseBuffer(v5[1], (OALSource *)v1);
        uint64_t v6 = *(OALBuffer ***)(v4 + 8);
        int64_t v7 = (char *)v6 - (char *)(v5 + 4);
        if (v6 != v5 + 4) {
          this = memmove(v5, v5 + 4, (char *)v6 - (char *)(v5 + 4));
        }
        uint64_t v8 = *(OALBuffer ***)v4;
        *(void *)(v4 + 8) = (char *)v5 + v7;
        *(_DWORD *)(v4 + 24) = (unint64_t)((char *)v5 + v7 - (char *)v8) >> 5;
        --v3;
      }
      while (v3);
    }
  }
LABEL_10:
  uint64_t v9 = *(void *)(v1 + 24);
  int v10 = *(_DWORD *)(v9 + 24);
  if (v10)
  {
    if (*(void *)v9 == *(void *)(v9 + 8))
    {
      do
      {
        *(_DWORD *)(v9 + 24) = 0;
        --v10;
      }
      while (v10);
    }
    else
    {
      do
      {
        while (1)
        {
          uint64_t v11 = *(void *)(v1 + 24);
          __int16 v12 = *(OALBuffer ***)v11;
          if (*(void *)v11 != *(void *)(v11 + 8)) {
            break;
          }
          *(_DWORD *)(v11 + 24) = 0;
          if (!--v10) {
            goto LABEL_19;
          }
        }
        this = (void *)OALBuffer::ReleaseBuffer(v12[1], (OALSource *)v1);
        int v13 = *(OALBuffer ***)(v11 + 8);
        int64_t v14 = (char *)v13 - (char *)(v12 + 4);
        if (v13 != v12 + 4) {
          this = memmove(v12, v12 + 4, (char *)v13 - (char *)(v12 + 4));
        }
        uint64_t v15 = *(OALBuffer ***)v11;
        *(void *)(v11 + 8) = (char *)v12 + v14;
        *(_DWORD *)(v11 + 24) = (unint64_t)((char *)v12 + v14 - (char *)v15) >> 5;
        --v10;
      }
      while (v10);
LABEL_19:
      uint64_t v9 = *(void *)(v1 + 24);
    }
  }
  *(_DWORD *)(v1 + 48) = *(_DWORD *)(*(void *)(v1 + 32) + 24) + *(_DWORD *)(v9 + 24);
  return this;
}

uint64_t OALSource::SetUpDeconstruction(OALSource *this)
{
  uint64_t v2 = *((void *)this + 1);
  pthread_t v3 = pthread_self();
  uint64_t v4 = *(_opaque_pthread_t **)(v2 + 480);
  if (v3 != v4)
  {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  int v5 = (*(uint64_t (**)(void))(*((void *)this + 10) + 16))();
  int v6 = *((_DWORD *)this + 76);
  if ((v6 - 56577) < 6 || v6 == 4114) {
    operator new();
  }
  *((unsigned char *)this + 4) = 1;
  *((_DWORD *)this + 76) = 56577;
  *((unsigned char *)this + 352) = 1;
  if (v5) {
    (*(void (**)(char *))(*((void *)this + 10) + 24))((char *)this + 80);
  }
  if (v3 != v4) {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 0xFFFFFFFF);
  }
  return 0;
}

void sub_22154F5DC(_Unwind_Exception *exception_object)
{
  if (v2 != v3) {
    atomic_fetch_add((atomic_uint *volatile)(v1 + 64), 0xFFFFFFFF);
  }
  _Unwind_Resume(exception_object);
}

void OALSource::AddPlaybackMessage(OALSource *this, unsigned int a2, OALBuffer *a3)
{
}

uint64_t OALSource::SetPitch(OALSource *this, float a2)
{
  if (a2 < 0.0) {
    return 40963;
  }
  if (*((float *)this + 78) != a2 || *((unsigned char *)this + 20))
  {
    int v5 = (char *)this + 80;
    int v6 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
    int v7 = v6;
    *((float *)this + 78) = a2;
    AudioUnitElement v8 = *((_DWORD *)this + 58);
    if (v8 != -1)
    {
      uint64_t v9 = (uint64_t *)*((void *)this + 3);
      uint64_t v11 = *v9;
      uint64_t v10 = v9[1];
      if (v11) {
        BOOL v12 = v11 + ((uint64_t)((unint64_t)*((unsigned int *)this + 14) << 48) >> 43) == v10;
      }
      else {
        BOOL v12 = 1;
      }
      if (!v12) {
        OALContext::SetBusPlaybackRate(*((AudioUnit **)this + 1), v8, *((float *)this + 79) * a2);
      }
      *((unsigned char *)this + 20) = 0;
      if (!v7) {
        return 0;
      }
      goto LABEL_14;
    }
    *((unsigned char *)this + 20) = 1;
    if (v6) {
LABEL_14:
    }
      (*(void (**)(char *))(*(void *)v5 + 24))((char *)this + 80);
  }
  return 0;
}

void sub_22154F7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t OALSource::SetGain(OALSource *this, float a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a2 < 0.0) {
    return 40963;
  }
  int v5 = (float *)((char *)this + 80);
  int v6 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  int v7 = v6;
  if (v5[57] == a2)
  {
    uint64_t updated = 0;
    if (!v6) {
      return updated;
    }
LABEL_10:
    (*(void (**)(float *))(*(void *)v5 + 24))(v5);
    return updated;
  }
  *((float *)this + 77) = a2;
  uint64_t updated = OALSource::UpdateBusGain(this);
  if (updated && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(unsigned int *)this;
    *(_DWORD *)buf = 136315906;
    uint64_t v11 = "oalSource.cpp";
    __int16 v12 = 1024;
    int v13 = 279;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = (int)updated;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::SetGain FAILED - OALSource = %ld : uint64_t result = %ld", buf, 0x26u);
  }
  if (v7) {
    goto LABEL_10;
  }
  return updated;
}

void sub_22154F974(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::UpdateBusGain(OALSource *this)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  AudioUnitElement v1 = *((_DWORD *)this + 58);
  if (v1 == -1) {
    return 0;
  }
  float v3 = *((float *)this + 77) * *((float *)this + 75);
  if (v3 > 1.0)
  {
    *((unsigned char *)this + 237) = 0;
    float v3 = 1.0;
    goto LABEL_4;
  }
  if (v3 < 0.0)
  {
    uint64_t v5 = 0;
    *((unsigned char *)this + 237) = 1;
    return v5;
  }
  *((unsigned char *)this + 237) = v3 <= 0.0;
  if (v3 <= 0.0) {
    return 0;
  }
LABEL_4:
  float v4 = log10f(v3) * 20.0;
  if (v4 < -120.0) {
    float v4 = -120.0;
  }
  uint64_t v5 = OALContext::SetBusInputGain(*((AudioUnit **)this + 1), v1, v4);
  if (v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(unsigned int *)this;
    int v8 = 136315906;
    uint64_t v9 = "oalSource.cpp";
    __int16 v10 = 1024;
    int v11 = 2466;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = (int)v5;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::UpdateBusGain FAILED - OALSource = %ld : uint64_t result = %ld", (uint8_t *)&v8, 0x26u);
  }
  return v5;
}

uint64_t OALSource::SetMinGain(OALSource *this, AudioUnitParameterValue a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a2 < 0.0 || a2 > 1.0) {
    return 40963;
  }
  uint64_t v6 = (float *)((char *)this + 80);
  int v7 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  if (v6[63] != a2)
  {
    *((AudioUnitParameterValue *)this + 83) = a2;
    AudioUnitElement v8 = *((_DWORD *)this + 58);
    if (v8 != -1)
    {
      int v9 = OALContext::SetBusMinGain(*((AudioUnit **)this + 1), v8, a2);
      if (v9)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v10 = *(unsigned int *)this;
          *(_DWORD *)buf = 136315906;
          __int16 v12 = "oalSource.cpp";
          __int16 v13 = 1024;
          int v14 = 2483;
          __int16 v15 = 2048;
          uint64_t v16 = v10;
          __int16 v17 = 2048;
          uint64_t v18 = v9;
          _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::UpdateMinBusGain FAILED - OALSource = %ld : uint64_t result = %ld", buf, 0x26u);
        }
      }
    }
  }
  if (v7) {
    (*(void (**)(float *))(*(void *)v6 + 24))(v6);
  }
  return 0;
}

void sub_22154FC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_22154FCA4(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t OALSource::SetMaxGain(OALSource *this, AudioUnitParameterValue a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a2 < 0.0 || a2 > 1.0) {
    return 40963;
  }
  uint64_t v6 = (float *)((char *)this + 80);
  int v7 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  if (v6[64] != a2)
  {
    *((AudioUnitParameterValue *)this + 84) = a2;
    AudioUnitElement v8 = *((_DWORD *)this + 58);
    if (v8 != -1)
    {
      int v9 = OALContext::SetBusMaxGain(*((AudioUnit **)this + 1), v8, a2);
      if (v9)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v10 = *(unsigned int *)this;
          *(_DWORD *)buf = 136315906;
          __int16 v12 = "oalSource.cpp";
          __int16 v13 = 1024;
          int v14 = 2500;
          __int16 v15 = 2048;
          uint64_t v16 = v10;
          __int16 v17 = 2048;
          uint64_t v18 = v9;
          _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::UpdateMaxBusGain FAILED - OALSource = %ld : uint64_t result = %ld", buf, 0x26u);
        }
      }
    }
  }
  if (v7) {
    (*(void (**)(float *))(*(void *)v6 + 24))(v6);
  }
  return 0;
}

void sub_22154FE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_22154FE68(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t OALSource::UpdateMaxBusGain(OALSource *this)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  AudioUnitElement v1 = *((_DWORD *)this + 58);
  if (v1 == -1) {
    return 0;
  }
  uint64_t v3 = OALContext::SetBusMaxGain(*((AudioUnit **)this + 1), v1, *((AudioUnitParameterValue *)this + 84));
  if (v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(unsigned int *)this;
    int v6 = 136315906;
    int v7 = "oalSource.cpp";
    __int16 v8 = 1024;
    int v9 = 2500;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = (int)v3;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::UpdateMaxBusGain FAILED - OALSource = %ld : uint64_t result = %ld", (uint8_t *)&v6, 0x26u);
  }
  return v3;
}

uint64_t OALSource::SetDistanceParams(OALSource *this, int a2, int a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v7 = (AudioUnitElement *)((char *)this + 80);
  uint64_t v6 = *((void *)this + 10);
  uint64_t v16 = (char *)this + 80;
  int v8 = (*(uint64_t (**)(char *))(v6 + 16))((char *)this + 80);
  char v17 = v8;
  uint64_t BusDistanceParams = OALContext::GetBusDistanceParams(*((AudioUnit **)v7 - 9), v7[38], &inData);
  if (BusDistanceParams) {
    goto LABEL_16;
  }
  float v10 = *((float *)this + 80);
  if (a2)
  {
    inData.mfloat ReferenceDistance = *((Float32 *)this + 81);
  }
  else if (a3)
  {
    inData.mMaxDistance = *((Float32 *)this + 82);
  }
  float v11 = log10f(inData.mReferenceDistance/ (float)(inData.mReferenceDistance + (float)(v10 * (float)(inData.mMaxDistance - inData.mReferenceDistance))))* 20.0;
  float v12 = -v11;
  if (v11 >= 0.0) {
    float v12 = 0.0;
  }
  inData.mMaxAttenuation = v12;
  uint64_t BusDistanceParams = OALContext::SetBusDistanceParams(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), &inData);
  if (BusDistanceParams)
  {
LABEL_16:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = *(unsigned int *)this;
      *(_DWORD *)buf = 136315906;
      uint64_t v19 = "oalSource.cpp";
      __int16 v20 = 1024;
      int v21 = 361;
      __int16 v22 = 2048;
      uint64_t v23 = v13;
      __int16 v24 = 2048;
      uint64_t v25 = (int)BusDistanceParams;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::SetDistanceParams FAILED - OALSource = %ld : uint64_t result = %ld", buf, 0x26u);
    }
  }
  if (v8) {
    (*(void (**)(AudioUnitElement *))(*(void *)v7 + 24))(v7);
  }
  return BusDistanceParams;
}

void sub_221550154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  CAGuard::Locker::~Locker((CAGuard::Locker *)va);
  _Unwind_Resume(a1);
}

uint64_t OALSource::SetReferenceDistance(OALSource *this, float a2)
{
  if (a2 < 0.0) {
    return 40963;
  }
  uint64_t v5 = (float *)((char *)this + 80);
  int v6 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  if (v5[61] != a2)
  {
    *((float *)this + 81) = a2;
    if (*(unsigned char *)(*((void *)this + 1) + 408))
    {
      if (*((_DWORD *)this + 58) != -1) {
        OALSource::SetDistanceParams(this, 1, 0);
      }
    }
  }
  if (v6) {
    (*(void (**)(float *))(*(void *)v5 + 24))(v5);
  }
  return 0;
}

void sub_221550280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t OALSource::SetMaxDistance(OALSource *this, float a2)
{
  if (a2 <= 0.0) {
    return 40963;
  }
  if (*((float *)this + 82) != a2)
  {
    uint64_t v4 = (char *)this + 80;
    int v5 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
    *((float *)this + 82) = a2;
    if (*(unsigned char *)(*((void *)this + 1) + 408) && *((_DWORD *)this + 58) != -1) {
      OALSource::SetDistanceParams(this, 0, 1);
    }
    if (v5) {
      (*(void (**)(char *))(*(void *)v4 + 24))((char *)this + 80);
    }
  }
  return 0;
}

void sub_221550398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t OALSource::SetRollOffFactor(OALSource *this, float a2)
{
  if (a2 < 0.0) {
    return 40963;
  }
  int v5 = (float *)((char *)this + 80);
  int v6 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  if (v5[60] != a2)
  {
    *((float *)this + 80) = a2;
    if (*(unsigned char *)(*((void *)this + 1) + 408))
    {
      if (*((_DWORD *)this + 58) != -1) {
        OALSource::SetDistanceParams(this, 0, 0);
      }
    }
  }
  if (v6) {
    (*(void (**)(float *))(*(void *)v5 + 24))(v5);
  }
  return 0;
}

void sub_2215504B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t OALSource::SetLooping(OALSource *this, int a2)
{
  uint64_t v3 = (_DWORD *)((char *)this + 80);
  int v4 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  v3[49] = a2;
  if (v4) {
    (*(void (**)(_DWORD *))(*(void *)v3 + 24))(v3);
  }
  return 0;
}

uint64_t OALSource::SetPosition(OALSource *this, float a2, float a3, float a4)
{
  int v7 = (float *)((char *)this + 80);
  uint64_t result = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  v7[40] = a2;
  v7[41] = a3;
  v7[42] = a4;
  *((unsigned char *)v7 - 63) = 1;
  if (result)
  {
    (*(void (**)(float *))(*(void *)v7 + 24))(v7);
    return 0;
  }
  return result;
}

uint64_t OALSource::SetVelocity(OALSource *this, float a2, float a3, float a4)
{
  int v7 = (float *)((char *)this + 80);
  uint64_t result = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  v7[43] = a2;
  v7[44] = a3;
  v7[45] = a4;
  *((unsigned char *)v7 - 63) = 1;
  if (result)
  {
    (*(void (**)(float *))(*(void *)v7 + 24))(v7);
    return 0;
  }
  return result;
}

uint64_t OALSource::SetDirection(OALSource *this, float a2, float a3, float a4)
{
  int v7 = (float *)((char *)this + 80);
  uint64_t result = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  v7[46] = a2;
  v7[47] = a3;
  v7[48] = a4;
  *((unsigned char *)v7 - 63) = 1;
  if (result)
  {
    (*(void (**)(float *))(*(void *)v7 + 24))(v7);
    return 0;
  }
  return result;
}

uint64_t OALSource::SetSourceRelative(OALSource *this, unsigned int a2)
{
  if (a2 > 1) {
    return 40963;
  }
  int v4 = (_DWORD *)((char *)this + 80);
  uint64_t result = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  v4[50] = a2;
  *((unsigned char *)v4 - 63) = 1;
  if (result)
  {
    (*(void (**)(_DWORD *))(*(void *)v4 + 24))(v4);
    return 0;
  }
  return result;
}

uint64_t OALSource::SetChannelParameters(OALSource *this)
{
  float v2 = *((float *)this + 81);
  if (v2 >= 0.0)
  {
    uint64_t v3 = (char *)this + 80;
    int v4 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
    if (*((float *)this + 81) != v2)
    {
      *((float *)this + 81) = v2;
      if (*(unsigned char *)(*((void *)this + 1) + 408))
      {
        if (*((_DWORD *)this + 58) != -1) {
          OALSource::SetDistanceParams(this, 1, 0);
        }
      }
    }
    if (v4) {
      (*(void (**)(char *))(*(void *)v3 + 24))((char *)this + 80);
    }
  }
  float v5 = *((float *)this + 80);
  if (v5 >= 0.0)
  {
    int v6 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
    if (*((float *)this + 80) != v5)
    {
      *((float *)this + 80) = v5;
      if (*(unsigned char *)(*((void *)this + 1) + 408))
      {
        if (*((_DWORD *)this + 58) != -1) {
          OALSource::SetDistanceParams(this, 0, 0);
        }
      }
    }
    if (v6) {
      (*(void (**)(char *))(*((void *)this + 10) + 24))((char *)this + 80);
    }
  }
  *((unsigned char *)this + 17) = 1;
  return 0;
}

void sub_221550A74(_Unwind_Exception *exception_object)
{
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::SetConeInnerAngle(OALSource *this, float a2)
{
  int v4 = (float *)((char *)this + 80);
  int v5 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  if (v4[52] != a2)
  {
    *((float *)this + 72) = a2;
    *((unsigned char *)this + 17) = 1;
  }
  if (v5) {
    (*(void (**)(float *))(*(void *)v4 + 24))(v4);
  }
  return 0;
}

uint64_t OALSource::SetConeOuterAngle(OALSource *this, float a2)
{
  int v4 = (float *)((char *)this + 80);
  int v5 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  if (v4[53] != a2)
  {
    *((float *)this + 73) = a2;
    *((unsigned char *)this + 17) = 1;
  }
  if (v5) {
    (*(void (**)(float *))(*(void *)v4 + 24))(v4);
  }
  return 0;
}

uint64_t OALSource::SetConeOuterGain(OALSource *this, float a2)
{
  if (a2 <= 0.0) {
    return 40963;
  }
  if (a2 < 0.0 || a2 > 1.0) {
    return 0;
  }
  int v5 = (float *)((char *)this + 80);
  uint64_t result = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  if (v5[54] != a2)
  {
    *((float *)this + 74) = a2;
    *((unsigned char *)this + 17) = 1;
  }
  if (result)
  {
    (*(void (**)(float *))(*(void *)v5 + 24))(v5);
    return 0;
  }
  return result;
}

float OALSource::GetPitch(OALSource *this)
{
  return *((float *)this + 78);
}

float OALSource::GetGain(OALSource *this)
{
  return *((float *)this + 77);
}

float OALSource::GetMinGain(OALSource *this)
{
  return *((float *)this + 83);
}

float OALSource::GetMaxGain(OALSource *this)
{
  return *((float *)this + 84);
}

float OALSource::GetReferenceDistance(OALSource *this)
{
  return *((float *)this + 81);
}

float OALSource::GetMaxDistance(OALSource *this)
{
  return *((float *)this + 82);
}

float OALSource::GetRollOffFactor(OALSource *this)
{
  return *((float *)this + 80);
}

uint64_t OALSource::GetLooping(OALSource *this)
{
  return *((unsigned int *)this + 69);
}

float OALSource::GetPosition(OALSource *this, float *a2, float *a3, float *a4)
{
  *a2 = *((float *)this + 60);
  *a3 = *((float *)this + 61);
  float result = *((float *)this + 62);
  *a4 = result;
  return result;
}

float OALSource::GetVelocity(OALSource *this, float *a2, float *a3, float *a4)
{
  *a2 = *((float *)this + 63);
  *a3 = *((float *)this + 64);
  float result = *((float *)this + 65);
  *a4 = result;
  return result;
}

float OALSource::GetDirection(OALSource *this, float *a2, float *a3, float *a4)
{
  *a2 = *((float *)this + 66);
  *a3 = *((float *)this + 67);
  float result = *((float *)this + 68);
  *a4 = result;
  return result;
}

uint64_t OALSource::GetSourceRelative(OALSource *this)
{
  return *((unsigned int *)this + 70);
}

uint64_t OALSource::GetSourceType(OALSource *this)
{
  return *((unsigned int *)this + 71);
}

float OALSource::GetConeInnerAngle(OALSource *this)
{
  return *((float *)this + 72);
}

float OALSource::GetConeOuterAngle(OALSource *this)
{
  return *((float *)this + 73);
}

float OALSource::GetConeOuterGain(OALSource *this)
{
  return *((float *)this + 74);
}

uint64_t OALSource::GetState(OALSource *this)
{
  uint64_t result = *((unsigned int *)this + 76);
  if ((result - 56577) <= 5) {
    return dword_22155D0E8[(int)result - 56577];
  }
  return result;
}

uint64_t OALSource::GetToken(OALSource *this)
{
  return *(unsigned int *)this;
}

uint64_t OALSource::GetQLength(OALSource *this)
{
  uint64_t v1 = 52;
  if (!*((unsigned char *)this + 352)) {
    uint64_t v1 = 48;
  }
  return *(unsigned int *)((char *)this + v1);
}

uint64_t OALSource::IsSourceTransitioningToFlushQ(OALSource *this)
{
  return *((unsigned __int8 *)this + 352);
}

uint64_t OALSource::GetBuffersProcessed(OALSource *this)
{
  int v1 = *((_DWORD *)this + 76);
  if (v1 == 4113 || v1 == 56580) {
    return 0;
  }
  if (*((_DWORD *)this + 71) == 1735095154) {
    return 0;
  }
  if (*((unsigned char *)this + 352)) {
    return 0;
  }
  if (v1 == 56577 || v1 == 4116) {
    return *((unsigned int *)this + 12);
  }
  if (*((unsigned char *)this + 60))
  {
    uint64_t v6 = *((void *)this + 1);
    pthread_t v7 = pthread_self();
    int v8 = *(_opaque_pthread_t **)(v6 + 480);
    if (v7 != v8)
    {
      atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
      while (*((_DWORD *)this + 17))
        usleep(0x1F4u);
    }
    uint64_t v9 = *((void *)this + 10);
    float v11 = (char *)this + 80;
    char v12 = (*(uint64_t (**)(char *))(v9 + 16))((char *)this + 80);
    OALSource::ClearActiveQueue(this, v10);
    CAGuard::Locker::~Locker((CAGuard::Locker *)&v11);
    if (v7 != v8) {
      atomic_fetch_add((atomic_uint *volatile)this + 16, 0xFFFFFFFF);
    }
  }
  return *(unsigned int *)(*((void *)this + 4) + 24);
}

void sub_221550FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CAGuard::Locker::~Locker((CAGuard::Locker *)&a9);
  if (v10 != v11) {
    atomic_fetch_add((atomic_uint *volatile)(v9 + 64), 0xFFFFFFFF);
  }
  _Unwind_Resume(a1);
}

void OALSource::ClearActiveQueue(OALSource *this, OALSource *a2)
{
  for (i = (uint64_t *)*((void *)this + 3);
        *((_DWORD *)i + 6);
        *((_DWORD *)this + 12) = *(_DWORD *)(*((void *)this + 4) + 24) + *((_DWORD *)i + 6))
  {
    uint64_t v6 = *i;
    uint64_t v5 = i[1];
    BOOL v7 = v6 == v5;
    if (v6 == v5) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v6;
    }
    if (!v7) {
      *(_DWORD *)(v6 + 20) = 2;
    }
    BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), a2, *(_DWORD *)v8, *(OALBuffer **)(v8 + 8), *(_DWORD *)(v8 + 24));
    uint64_t v9 = (char **)*((void *)this + 3);
    uint64_t v11 = *v9;
    uint64_t v10 = v9[1];
    if (*v9 == v10)
    {
      int v4 = *v9;
    }
    else
    {
      a2 = (OALSource *)(v11 + 32);
      int64_t v12 = v10 - (v11 + 32);
      if (v10 != v11 + 32) {
        memmove(*v9, a2, v10 - (v11 + 32));
      }
      uint64_t v13 = *v9;
      int v4 = &v11[v12];
      v9[1] = &v11[v12];
      uint64_t v11 = v13;
    }
    *((_DWORD *)v9 + 6) = (unint64_t)(v4 - v11) >> 5;
    i = (uint64_t *)*((void *)this + 3);
  }
  *((_DWORD *)this + 14) = 0;
  *((unsigned char *)this + 60) = 0;
}

uint64_t OALSource::SetBuffer(OALSource *this, int a2, OALBuffer *a3)
{
  uint64_t v3 = (uint64_t)a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!a3) {
    return v3;
  }
  uint64_t v6 = *((void *)this + 1);
  pthread_t v7 = pthread_self();
  uint64_t v8 = *(_opaque_pthread_t **)(v6 + 480);
  if (v7 != v8)
  {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  int v9 = (*(uint64_t (**)(void))(*((void *)this + 10) + 16))();
  int v10 = *((_DWORD *)this + 76);
  if ((v10 - 56577) > 5)
  {
    if ((v10 - 4114) >= 2)
    {
      OALSource::FlushBufferQueue(this);
      if (a2)
      {
        uint64_t v14 = (BufferQueue *)*((void *)this + 3);
        if (*(void *)v14 == *((void *)v14 + 1))
        {
          *((_DWORD *)this + 14) = 0;
          *((unsigned char *)this + 60) = 0;
        }
        BufferQueue::AppendBuffer(v14, v13, a2, (OALBuffer *)v3, 0);
        *((_DWORD *)this + 12) = *(_DWORD *)(*((void *)this + 4) + 24) + *(_DWORD *)(*((void *)this + 3) + 24);
        OALBuffer::UseThisBuffer((OALBuffer *)v3, this);
        uint64_t v3 = 0;
        *((_DWORD *)this + 71) = 4136;
      }
      else
      {
        uint64_t v3 = 0;
        *((_DWORD *)this + 71) = 4144;
      }
      goto LABEL_13;
    }
  }
  else if (((1 << (v10 - 1)) & 0x36) == 0)
  {
    if (!a2)
    {
      *((_DWORD *)this + 71) = 4144;
      *((unsigned char *)this + 352) = 1;
      *((_DWORD *)this + 13) = 0;
      int v15 = *(_DWORD *)(*((void *)this + 5) + 24);
      if (v15)
      {
        uint64_t v16 = *((void *)this + 4);
        if (*(void *)v16 == *(void *)(v16 + 8))
        {
          do
          {
            *(_DWORD *)(v16 + 24) = 0;
            --v15;
          }
          while (v15);
        }
        else
        {
          do
          {
            while (1)
            {
              char v17 = (char **)*((void *)this + 4);
              uint64_t v19 = *v17;
              uint64_t v18 = v17[1];
              if (*v17 != v18) {
                break;
              }
              *((_DWORD *)v17 + 6) = 0;
              if (!--v15) {
                goto LABEL_8;
              }
            }
            int64_t v20 = v18 - (v19 + 32);
            if (v18 != v19 + 32) {
              memmove(*v17, v19 + 32, v18 - (v19 + 32));
            }
            int v21 = *v17;
            v17[1] = &v19[v20];
            *((_DWORD *)v17 + 6) = (unint64_t)(&v19[v20] - v21) >> 5;
            --v15;
          }
          while (v15);
        }
      }
    }
LABEL_8:
    *(unsigned char *)(v3 + 352) = 1;
    operator new();
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(unsigned int *)this;
    *(_DWORD *)buf = 136315906;
    uint64_t v23 = "oalSource.cpp";
    __int16 v24 = 1024;
    int v25 = 885;
    __int16 v26 = 2048;
    uint64_t v27 = v11;
    __int16 v28 = 2048;
    uint64_t v3 = 40964;
    uint64_t v29 = 40964;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::SetBuffer FAILED - OALSource = %ld : uint64_t result = %ld", buf, 0x26u);
  }
  else
  {
    uint64_t v3 = 40964;
  }
LABEL_13:
  if (v9) {
    (*(void (**)(char *))(*((void *)this + 10) + 24))((char *)this + 80);
  }
  if (v7 != v8) {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 0xFFFFFFFF);
  }
  return v3;
}

void sub_221551454(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::GetBuffer(OALSource *this)
{
  if (*((_DWORD *)this + 71) != 4136) {
    return 0;
  }
  int v1 = (uint64_t *)*((void *)this + 3);
  if (!*((_DWORD *)v1 + 6))
  {
    uint64_t v3 = (uint64_t *)*((void *)this + 4);
    if (!*((_DWORD *)v3 + 6)) {
      return 0;
    }
    uint64_t v2 = *v3;
    if (*v3 == v3[1]) {
      return 0;
    }
    return **(unsigned int **)(v2 + 8);
  }
  uint64_t v2 = *v1;
  if (*v1 != v1[1]) {
    return **(unsigned int **)(v2 + 8);
  }
  return 0;
}

uint64_t OALSource::AddToQueue(OALSource *this, int a2, OALBuffer *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v6 = *((void *)this + 1);
  pthread_t v7 = pthread_self();
  uint64_t v8 = *(_opaque_pthread_t **)(v6 + 480);
  if (v7 != v8)
  {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  int v10 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  int v11 = *((_DWORD *)this + 71);
  switch(v11)
  {
    case 4136:
LABEL_7:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(unsigned int *)this;
        *(_DWORD *)buf = 136315906;
        char v17 = "oalSource.cpp";
        __int16 v18 = 1024;
        int v19 = 960;
        __int16 v20 = 2048;
        uint64_t v21 = v12;
        __int16 v22 = 2048;
        uint64_t v13 = 40964;
        uint64_t v23 = 40964;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::AddToQueue FAILED - OALSource = %ld : uint64_t result = %ld", buf, 0x26u);
        if (!v10) {
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v13 = 40964;
        if (!v10) {
          goto LABEL_17;
        }
      }
LABEL_16:
      (*(void (**)(char *))(*((void *)this + 10) + 24))((char *)this + 80);
      goto LABEL_17;
    case 4144:
      *((_DWORD *)this + 71) = 4137;
      break;
    case 1735095154:
      goto LABEL_7;
  }
  uint64_t v14 = (BufferQueue *)*((void *)this + 3);
  if (*(void *)v14 == *((void *)v14 + 1))
  {
    *((_DWORD *)this + 14) = 0;
    *((unsigned char *)this + 60) = 0;
  }
  BufferQueue::AppendBuffer(v14, v9, a2, a3, 0);
  *((_DWORD *)this + 12) = *(_DWORD *)(*((void *)this + 4) + 24) + *(_DWORD *)(*((void *)this + 3) + 24);
  OALBuffer::UseThisBuffer(a3, this);
  uint64_t v13 = 0;
  if (v10) {
    goto LABEL_16;
  }
LABEL_17:
  if (v7 != v8) {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 0xFFFFFFFF);
  }
  return v13;
}

void sub_22155172C(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void OALSource::AddToTempQueue(OALSource *this, int a2, OALBuffer *a3)
{
  uint64_t v6 = *((void *)this + 1);
  if (pthread_self() != *(pthread_t *)(v6 + 480))
  {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  (*(void (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  BufferQueue::AppendBuffer(*((BufferQueue **)this + 5), v7, a2, a3, 0);
  OALBuffer::UseThisBuffer(a3, this);
  ++*((_DWORD *)this + 13);
  operator new();
}

void sub_2215518E4(_Unwind_Exception *exception_object)
{
  if (v2 != v3) {
    atomic_fetch_add((atomic_uint *volatile)(v1 + 64), 0xFFFFFFFF);
  }
  _Unwind_Resume(exception_object);
}

void BufferQueue::AppendBuffer(BufferQueue *this, OALSource *a2, int a3, OALBuffer *a4, int a5)
{
  int v10 = (_DWORD *)*((void *)this + 1);
  unint64_t v9 = *((void *)this + 2);
  if ((unint64_t)v10 >= v9)
  {
    uint64_t v12 = *(_DWORD **)this;
    uint64_t v13 = ((uint64_t)v10 - *(void *)this) >> 5;
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 59) {
      std::vector<SourceAttachedInfo>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = v9 - (void)v12;
    if (v15 >> 4 > v14) {
      unint64_t v14 = v15 >> 4;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v16 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16)
    {
      if (v16 >> 59) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      char v17 = (char *)operator new(32 * v16);
    }
    else
    {
      char v17 = 0;
    }
    __int16 v18 = &v17[32 * v13];
    *(_DWORD *)__int16 v18 = a3;
    *((void *)v18 + 1) = a4;
    *((void *)v18 + 2) = 0;
    *((_DWORD *)v18 + 6) = a5;
    int v11 = v18 + 32;
    if (v10 != v12)
    {
      do
      {
        long long v19 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v18 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v18 - 1) = v19;
        v18 -= 32;
        v10 -= 8;
      }
      while (v10 != v12);
      int v10 = *(_DWORD **)this;
    }
    *(void *)this = v18;
    *((void *)this + 1) = v11;
    *((void *)this + 2) = &v17[32 * v16];
    if (v10) {
      operator delete(v10);
    }
  }
  else
  {
    _DWORD *v10 = a3;
    *((void *)v10 + 1) = a4;
    *((void *)v10 + 2) = 0;
    int v11 = v10 + 8;
    v10[6] = a5;
  }
  *((void *)this + 1) = v11;
  *((_DWORD *)this + 6) = ((unint64_t)v11 - *(void *)this) >> 5;
}

uint64_t OALSource::RemoveBuffersFromQueue(OALSource *this, unsigned int a2, unsigned int *a3)
{
  uint64_t v3 = 0;
  uint64_t v66 = *MEMORY[0x263EF8340];
  if (!a2) {
    return v3;
  }
  int v4 = a3;
  if (!a3) {
    return v3;
  }
  uint64_t v7 = *((void *)this + 1);
  pthread_t v8 = pthread_self();
  unint64_t v9 = *(_opaque_pthread_t **)(v7 + 480);
  if (v8 != v9)
  {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  char v55 = (*(uint64_t (**)(void))(*((void *)this + 10) + 16))();
  uint64_t v11 = 52;
  if (!*((unsigned char *)this + 352)) {
    uint64_t v11 = 48;
  }
  if (*(_DWORD *)((char *)this + v11) < a2)
  {
LABEL_9:
    uint64_t v3 = 40964;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v12 = *(_DWORD *)this;
      *(_DWORD *)buf = 136316162;
      int v57 = "oalSource.cpp";
      __int16 v58 = 1024;
      int v59 = 1102;
      __int16 v60 = 1024;
      int v61 = v12;
      __int16 v62 = 1024;
      unsigned int v63 = a2;
      __int16 v64 = 1024;
      int v65 = 40964;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::RemoveBuffersFromQueue FAILED - OALSource = %d : count = %d : uint64_t result = %d", buf, 0x24u);
    }
    if (!v55) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
  if (*((unsigned char *)this + 352)) {
    operator new();
  }
  int v18 = *((_DWORD *)this + 76);
  if (v18 > 4115)
  {
    if (v18 != 4116)
    {
      if (v18 == 56577 || v18 == 56580) {
        operator new();
      }
      goto LABEL_15;
    }
    goto LABEL_61;
  }
  if ((v18 - 4114) >= 2)
  {
    if (v18 != 4113) {
      goto LABEL_15;
    }
LABEL_61:
    int v41 = (uint64_t *)*((void *)this + 3);
    if (*((_DWORD *)v41 + 6))
    {
      do
      {
        uint64_t v45 = *v41;
        uint64_t v44 = v41[1];
        BOOL v46 = v45 == v44;
        if (v45 == v44) {
          uint64_t v47 = 0;
        }
        else {
          uint64_t v47 = v45;
        }
        if (!v46) {
          *(_DWORD *)(v45 + 20) = 2;
        }
        BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), v10, *(_DWORD *)v47, *(OALBuffer **)(v47 + 8), *(_DWORD *)(v47 + 24));
        uint64_t v48 = (char **)*((void *)this + 3);
        BOOL v50 = *v48;
        uint64_t v49 = v48[1];
        if (*v48 == v49)
        {
          __int16 v42 = *v48;
        }
        else
        {
          int v10 = (OALSource *)(v50 + 32);
          int64_t v51 = v49 - (v50 + 32);
          if (v49 != v50 + 32) {
            memmove(*v48, v10, v49 - (v50 + 32));
          }
          int v52 = *v48;
          __int16 v42 = &v50[v51];
          v48[1] = &v50[v51];
          BOOL v50 = v52;
        }
        *((_DWORD *)v48 + 6) = (unint64_t)(v42 - v50) >> 5;
        int v41 = (uint64_t *)*((void *)this + 3);
        uint64_t v43 = *((void *)this + 4);
        *((_DWORD *)this + 12) = *(_DWORD *)(v43 + 24) + *((_DWORD *)v41 + 6);
      }
      while (*((_DWORD *)v41 + 6));
    }
    else
    {
      uint64_t v43 = *((void *)this + 4);
    }
    *((_DWORD *)this + 14) = 0;
    *((unsigned char *)this + 60) = 0;
    unsigned int v19 = *(_DWORD *)(v43 + 24);
    goto LABEL_76;
  }
  if (*((_DWORD *)this + 69) == 1) {
    goto LABEL_9;
  }
  unsigned int v19 = *(_DWORD *)(*((void *)this + 4) + 24);
LABEL_76:
  if (v19 < a2) {
    goto LABEL_9;
  }
LABEL_15:
  int v53 = v9;
  int v54 = v8;
  uint64_t v13 = a2;
  if (*((unsigned char *)this + 352))
  {
    unint64_t v14 = (uint64_t *)*((void *)this + 5);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    do
    {
      if (v15 == v16) {
        unsigned int v17 = 0;
      }
      else {
        unsigned int v17 = **(_DWORD **)(v15 + 8);
      }
      *v4++ = v17;
      --*((_DWORD *)this + 13);
      v15 += 32;
      --v13;
    }
    while (v13);
    goto LABEL_48;
  }
  uint64_t v20 = 0;
  unint64_t v21 = 0;
  uint64_t v22 = a2 - 1;
LABEL_32:
  int v27 = *((_DWORD *)this + 76);
  if (v27 == 56580 || v27 == 56577)
  {
    uint64_t v29 = *((void *)this + 4);
    if (v21 >= *(unsigned int *)(v29 + 24))
    {
      BOOL v39 = (void *)*((void *)this + 3);
      uint64_t v31 = *v39 + 32 * (v21 - *(_DWORD *)(v29 + 24));
      if (v31 == v39[1]) {
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v30 = *(void *)(v29 + 8);
      uint64_t v31 = *(void *)v29 + v20;
      if (v31 == v30)
      {
LABEL_39:
        v4[v21] = 0;
        goto LABEL_30;
      }
    }
    v4[v21] = **(_DWORD **)(v31 + 8);
    goto LABEL_30;
  }
  uint64_t v32 = (uint64_t *)*((void *)this + 4);
  uint64_t v33 = *v32;
  if (*v32 == v32[1])
  {
    unsigned int v34 = 0;
    uint64_t v38 = *v32;
  }
  else
  {
    unsigned int v34 = *(_DWORD *)v33;
    OALBuffer::ReleaseBuffer(*(OALBuffer **)(v33 + 8), this);
    uint64_t v35 = v32[1];
    uint64_t v36 = v35 - (v33 + 32);
    if (v35 != v33 + 32) {
      memmove((void *)v33, (const void *)(v33 + 32), v35 - (v33 + 32));
    }
    uint64_t v37 = *v32;
    uint64_t v38 = v33 + v36;
    v32[1] = v33 + v36;
    uint64_t v33 = v37;
  }
  *((_DWORD *)v32 + 6) = (unint64_t)(v38 - v33) >> 5;
  *((_DWORD *)this + 12) = *(_DWORD *)(*((void *)this + 4) + 24) + *(_DWORD *)(*((void *)this + 3) + 24);
  v4[v21] = v34;
LABEL_30:
  while (v22 != v21)
  {
    v20 += 32;
    ++v21;
    if (!*((unsigned char *)this + 352)) {
      goto LABEL_32;
    }
    uint64_t v23 = (void *)*((void *)this + 5);
    uint64_t v24 = v23[1];
    uint64_t v25 = *v23 + v20;
    if (v25 == v24) {
      unsigned int v26 = 0;
    }
    else {
      unsigned int v26 = **(_DWORD **)(v25 + 8);
    }
    v4[v21] = v26;
    --*((_DWORD *)this + 13);
  }
LABEL_48:
  if (!*((_DWORD *)this + 12))
  {
    uint64_t v3 = 0;
    *((_DWORD *)this + 71) = 4144;
    unint64_t v9 = v53;
    pthread_t v8 = v54;
    if (!v55) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
  uint64_t v3 = 0;
  unint64_t v9 = v53;
  pthread_t v8 = v54;
  if (v55) {
LABEL_52:
  }
    (*(void (**)(char *))(*((void *)this + 10) + 24))((char *)this + 80);
LABEL_53:
  if (v8 != v9) {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 0xFFFFFFFF);
  }
  return v3;
}

void sub_221551FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  CAGuard::Locker::~Locker((CAGuard::Locker *)va);
  if (a3 != a2) {
    atomic_fetch_add((atomic_uint *volatile)(v3 + 64), 0xFFFFFFFF);
  }
  _Unwind_Resume(a1);
}

uint64_t OALSource::PostRenderRemoveBuffersFromQueue(OALSource *this, OALSource *a2)
{
  unsigned int v2 = a2;
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v4 = (uint64_t *)*((void *)this + 3);
  if (*((_DWORD *)v4 + 6))
  {
    do
    {
      uint64_t v8 = *v4;
      uint64_t v7 = v4[1];
      BOOL v9 = v8 == v7;
      if (v8 == v7) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = v8;
      }
      if (!v9) {
        *(_DWORD *)(v8 + 20) = 2;
      }
      BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), a2, *(_DWORD *)v10, *(OALBuffer **)(v10 + 8), *(_DWORD *)(v10 + 24));
      uint64_t v11 = (char **)*((void *)this + 3);
      uint64_t v13 = *v11;
      int v12 = v11[1];
      if (*v11 == v12)
      {
        uint64_t v5 = *v11;
      }
      else
      {
        a2 = (OALSource *)(v13 + 32);
        int64_t v14 = v12 - (v13 + 32);
        if (v12 != v13 + 32) {
          memmove(*v11, a2, v12 - (v13 + 32));
        }
        uint64_t v15 = *v11;
        uint64_t v5 = &v13[v14];
        v11[1] = &v13[v14];
        uint64_t v13 = v15;
      }
      *((_DWORD *)v11 + 6) = (unint64_t)(v5 - v13) >> 5;
      int v4 = (uint64_t *)*((void *)this + 3);
      uint64_t v6 = *((void *)this + 4);
      *((_DWORD *)this + 12) = *(_DWORD *)(v6 + 24) + *((_DWORD *)v4 + 6);
    }
    while (*((_DWORD *)v4 + 6));
  }
  else
  {
    uint64_t v6 = *((void *)this + 4);
  }
  *((_DWORD *)this + 14) = 0;
  *((unsigned char *)this + 60) = 0;
  if (*(_DWORD *)(v6 + 24) >= v2)
  {
    if (v2)
    {
      if (*(void *)v6 == *(void *)(v6 + 8))
      {
        do
        {
          *(_DWORD *)(v6 + 24) = 0;
          *((_DWORD *)this + 12) = *(_DWORD *)(v6 + 24) + *((_DWORD *)v4 + 6);
          --v2;
        }
        while (v2);
      }
      else
      {
        do
        {
          unsigned int v19 = *(OALBuffer ***)v6;
          if (*(void *)v6 == *(void *)(v6 + 8))
          {
            int v18 = *(OALBuffer ***)v6;
          }
          else
          {
            OALBuffer::ReleaseBuffer(v19[1], this);
            uint64_t v20 = *(OALBuffer ***)(v6 + 8);
            int64_t v21 = (char *)v20 - (char *)(v19 + 4);
            if (v20 != v19 + 4) {
              memmove(v19, v19 + 4, (char *)v20 - (char *)(v19 + 4));
            }
            uint64_t v22 = *(OALBuffer ***)v6;
            int v18 = (OALBuffer **)((char *)v19 + v21);
            *(void *)(v6 + 8) = (char *)v19 + v21;
            unsigned int v19 = v22;
          }
          *(_DWORD *)(v6 + 24) = (unint64_t)((char *)v18 - (char *)v19) >> 5;
          uint64_t v6 = *((void *)this + 4);
          *((_DWORD *)this + 12) = *(_DWORD *)(v6 + 24) + *(_DWORD *)(*((void *)this + 3) + 24);
          --v2;
        }
        while (v2);
      }
    }
    uint64_t v17 = 0;
    if (!*((_DWORD *)this + 12)) {
      *((_DWORD *)this + 71) = 4144;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = *(unsigned int *)this;
    int v24 = 136316162;
    uint64_t v25 = "oalSource.cpp";
    __int16 v26 = 1024;
    int v27 = 1139;
    __int16 v28 = 2048;
    uint64_t v29 = v16;
    __int16 v30 = 2048;
    uint64_t v31 = v2;
    __int16 v32 = 2048;
    uint64_t v17 = 40964;
    uint64_t v33 = 40964;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::RemoveBuffersFromQueue FAILED - OALSource = %ld : count = %ld : uint64_t result = %ld", (uint8_t *)&v24, 0x30u);
  }
  else
  {
    return 40964;
  }
  return v17;
}

uint64_t OALSource::PostRenderAddBuffersToQueue(OALSource *this, OALSource *a2)
{
  uint64_t v2 = (uint64_t)a2;
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v4 = *((_DWORD *)this + 71);
  if (v4 == 4136 || v4 == 1735095154)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(unsigned int *)this;
      int v18 = 136316162;
      unsigned int v19 = "oalSource.cpp";
      __int16 v20 = 1024;
      int v21 = 1169;
      __int16 v22 = 2048;
      uint64_t v23 = v6;
      __int16 v24 = 2048;
      uint64_t v25 = v2;
      __int16 v26 = 2048;
      uint64_t v2 = 40964;
      uint64_t v27 = 40964;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::RemoveBuffersFromQueue FAILED - OALSource = %ld : count = %ld : uint64_t result = %ld", (uint8_t *)&v18, 0x30u);
    }
    else
    {
      return 40964;
    }
  }
  else
  {
    if (v4 == 4144) {
      *((_DWORD *)this + 71) = 4137;
    }
    if (a2)
    {
      do
      {
        while (1)
        {
          uint64_t v7 = (uint64_t *)*((void *)this + 5);
          if (*v7 == v7[1]) {
            uint64_t v8 = 0;
          }
          else {
            uint64_t v8 = *v7;
          }
          int v9 = *(_DWORD *)v8;
          uint64_t v10 = *(OALBuffer **)(v8 + 8);
          uint64_t v11 = (BufferQueue *)*((void *)this + 3);
          if (*(void *)v11 == *((void *)v11 + 1))
          {
            *((_DWORD *)this + 14) = 0;
            *((unsigned char *)this + 60) = 0;
          }
          BufferQueue::AppendBuffer(v11, a2, v9, v10, 0);
          *((_DWORD *)this + 12) = *(_DWORD *)(*((void *)this + 4) + 24) + *(_DWORD *)(*((void *)this + 3) + 24);
          OALBuffer::UseThisBuffer(v10, this);
          uint64_t v12 = *((void *)this + 5);
          uint64_t v13 = *(OALBuffer ***)v12;
          if (*(void *)v12 != *(void *)(v12 + 8)) {
            break;
          }
          *(_DWORD *)(v12 + 24) = 0;
          uint64_t v2 = (v2 - 1);
          if (!v2) {
            return v2;
          }
        }
        OALBuffer::ReleaseBuffer(v13[1], this);
        int64_t v14 = *(OALBuffer ***)(v12 + 8);
        a2 = (OALSource *)(v13 + 4);
        int64_t v15 = (char *)v14 - (char *)(v13 + 4);
        if (v14 != v13 + 4) {
          memmove(v13, a2, (char *)v14 - (char *)(v13 + 4));
        }
        uint64_t v16 = *(OALBuffer ***)v12;
        *(void *)(v12 + 8) = (char *)v13 + v15;
        *(_DWORD *)(v12 + 24) = (unint64_t)((char *)v13 + v15 - (char *)v16) >> 5;
        uint64_t v2 = (v2 - 1);
      }
      while (v2);
    }
  }
  return v2;
}

uint64_t OALSource::SetupMixerBus(OALSource *this, CAStreamBasicDescription *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  if (*((_DWORD *)this + 58) != -1) {
    goto LABEL_2;
  }
  int v8 = *((_DWORD *)a2 + 7);
  int v9 = (OALContext *)*((void *)this + 1);
  int v10 = *(_DWORD *)this;
  if (v8 == 1)
  {
    AudioUnitElement AvailableMonoBus = OALContext::GetAvailableMonoBus(v9, v10);
    *((_DWORD *)this + 58) = AvailableMonoBus;
    if (AvailableMonoBus != -1) {
      goto LABEL_11;
    }
LABEL_27:
    uint64_t updated = 0xFFFFFFFFLL;
    goto LABEL_28;
  }
  AudioUnitElement AvailableMonoBus = OALContext::GetAvailableStereoBus(v9, v10);
  *((_DWORD *)this + 58) = AvailableMonoBus;
  if (AvailableMonoBus == -1) {
    goto LABEL_27;
  }
LABEL_11:
  OALContext::GetBusFormat(*((void *)this + 1), AvailableMonoBus, &v21);
  if (*(double *)&v21 != *(double *)a2 || v23 != *((_DWORD *)a2 + 8) || HIDWORD(v22) >= 2) {
    *((unsigned char *)this + 18) = 1;
  }
  float v12 = *((float *)this + 81);
  float v13 = *((float *)this + 82);
  float v14 = log10f(v12 / (float)(v12 + (float)(*((float *)this + 80) * (float)(v13 - v12)))) * 20.0;
  if (v14 >= 0.0) {
    float v15 = 0.0;
  }
  else {
    float v15 = -v14;
  }
  if (!OALContext::GetBusDistanceParams(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), &buf)
    && (buf.mReferenceDistance != v12 || buf.mMaxDistance != v13 || buf.mMaxAttenuation != v15))
  {
    buf.mMaxAttenuation = v15;
    *(void *)&buf.mfloat ReferenceDistance = *(void *)((char *)this + 324);
    OALContext::SetBusDistanceParams(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), &buf);
  }
  AudioUnitElement v16 = *((_DWORD *)this + 58);
  if (v16 != -1)
  {
    uint64_t v17 = *((void *)this + 1);
    if (!*(_DWORD *)(v17 + 492)
      || (AudioUnitSetParameter(*(AudioUnit *)(v17 + 32), 8u, 1u, v16, *((float *)this + 108) * 100.0, 0),
          AudioUnitElement v16 = *((_DWORD *)this + 58),
          v16 != -1))
    {
      AudioUnitSetParameter(*(AudioUnit *)(*((void *)this + 1) + 32), 0xAu, 1u, v16, *((AudioUnitParameterValue *)this + 109), 0);
      AudioUnitElement v18 = *((_DWORD *)this + 58);
      if (v18 != -1) {
        AudioUnitSetParameter(*(AudioUnit *)(*((void *)this + 1) + 32), 0xBu, 1u, v18, *((AudioUnitParameterValue *)this + 110), 0);
      }
    }
  }
LABEL_2:
  *((unsigned char *)this + 20) = 1;
  uint64_t updated = OALSource::SetPitch(this, *((float *)this + 78));
  if (!updated)
  {
    *((unsigned char *)this + 17) = 1;
    uint64_t updated = OALSource::ChangeChannelSettings(this);
    if (!updated)
    {
      uint64_t updated = OALSource::UpdateBusGain(this);
      if (!updated)
      {
        AudioUnitElement v4 = *((_DWORD *)this + 58);
        if (v4 == -1
          || (uint64_t v5 = OALContext::SetBusMinGain(*((AudioUnit **)this + 1), v4, *((AudioUnitParameterValue *)this + 83)),
              !v5))
        {
          uint64_t updated = OALSource::UpdateMaxBusGain(this);
          if (!updated)
          {
            uint64_t updated = OALSource::UpdateBusRenderQuality(this);
            if (!updated) {
              return updated;
            }
          }
        }
        else
        {
          uint64_t updated = v5;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v6 = *(unsigned int *)this;
            buf.mfloat ReferenceDistance = 4.8153e-34;
            *(void *)&buf.mMaxDistance = "oalSource.cpp";
            __int16 v25 = 1024;
            int v26 = 2483;
            __int16 v27 = 2048;
            uint64_t v28 = v6;
            __int16 v29 = 2048;
            uint64_t v30 = (int)updated;
            _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::UpdateMinBusGain FAILED - OALSource = %ld : uint64_t result = %ld", (uint8_t *)&buf, 0x26u);
          }
        }
      }
    }
  }
LABEL_28:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = *(unsigned int *)this;
    buf.mfloat ReferenceDistance = 4.8153e-34;
    *(void *)&buf.mMaxDistance = "oalSource.cpp";
    __int16 v25 = 1024;
    int v26 = 1266;
    __int16 v27 = 2048;
    uint64_t v28 = v19;
    __int16 v29 = 2048;
    uint64_t v30 = (int)updated;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::SetupMixerBus FAILED - OALSource = %ld : uint64_t result = %ld", (uint8_t *)&buf, 0x26u);
  }
  return updated;
}

uint64_t OALSource::ChangeChannelSettings(OALSource *this)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 17))
  {
    if (*((_DWORD *)this + 71) == 1735095154)
    {
      if (*((_DWORD *)this + 101) != 1)
      {
LABEL_18:
        *((unsigned char *)this + 17) = 0;
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v2 = (uint64_t *)*((void *)this + 3);
      int v3 = *((_DWORD *)this + 14);
      uint64_t v4 = *v2;
      uint64_t v5 = v2[1];
      if (v4) {
        BOOL v6 = v4 + 32 * (__int16)v3 == v5;
      }
      else {
        BOOL v6 = 1;
      }
      if (v6 || *(_DWORD *)(*(void *)(v4 + 32 * (__int16)v3 + 8) + 332) != 1) {
        goto LABEL_18;
      }
    }
    *(_DWORD *)MixerDistanceParams buf = 0;
    uint64_t v15 = 0;
    float v14 = 0.0;
    OALSource::CalculateDistanceAndAzimuth(this, (float *)&v15 + 1, (float *)buf, (float *)&v15, &v14);
    float v7 = v14;
    if (v14 != *((float *)this + 79))
    {
      *((float *)this + 79) = v14;
      OALContext::SetBusPlaybackRate(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), v7 * *((float *)this + 78));
    }
    OALContext::SetBusAzimuth(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), *(AudioUnitParameterValue *)buf);
    OALContext::SetBusElevation(*((AudioUnit **)this + 1), *((_DWORD *)this + 58), *(AudioUnitParameterValue *)&v15);
    uint64_t v8 = *((void *)this + 1);
    if (*(unsigned char *)(v8 + 408)) {
      int v9 = (AudioUnitParameterValue *)&v15 + 1;
    }
    else {
      int v9 = (AudioUnitParameterValue *)((char *)this + 324);
    }
    OALContext::SetBusDistance((AudioUnit *)v8, *((_DWORD *)this + 58), *v9);
    if (OALSource::ConeAttenuation(this))
    {
      uint64_t updated = OALSource::UpdateBusGain(this);
      if (updated)
      {
        uint64_t v11 = updated;
LABEL_21:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v12 = *(unsigned int *)this;
          *(_DWORD *)MixerDistanceParams buf = 136315906;
          uint64_t v17 = "oalSource.cpp";
          __int16 v18 = 1024;
          int v19 = 2430;
          __int16 v20 = 2048;
          uint64_t v21 = v12;
          __int16 v22 = 2048;
          uint64_t v23 = (int)v11;
          _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::ChangeChannelSettings FAILED - OALSource = %ld : uint64_t result = %ld", buf, 0x26u);
        }
        return v11;
      }
    }
    goto LABEL_18;
  }
LABEL_19:
  if (!*((unsigned char *)this + 18)) {
    return 0;
  }
  uint64_t v11 = OALSource::UpdateBusFormat(this);
  if (v11) {
    goto LABEL_21;
  }
  return v11;
}

uint64_t OALSource::UpdateBusRenderQuality(OALSource *this)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  AudioUnitElement v1 = *((_DWORD *)this + 58);
  if (v1 == -1) {
    return 0;
  }
  uint64_t v3 = OALContext::SetSourceDesiredRenderQualityOnBus(*((AudioUnit **)this + 1), *((_DWORD *)this + 111), v1);
  if (v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(unsigned int *)this;
    int v6 = 136315906;
    float v7 = "oalSource.cpp";
    __int16 v8 = 1024;
    int v9 = 2551;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = (int)v3;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::UpdateBusRenderQuality FAILED - OALSource = %ld : uint64_t result = %ld", (uint8_t *)&v6, 0x26u);
  }
  return v3;
}

uint64_t OALSource::PrepBufferQueueForPlayback(OALSource *this, OALSource *a2)
{
  OALSource::JoinBufferLists(this, a2);
  unsigned int v3 = *((_DWORD *)this + 85);
  if (v3) {
    OALSource::AdvanceQueueToFrameIndex(this, v3);
  }
  uint64_t v4 = (uint64_t *)*((void *)this + 3);
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  if (v5 == v6) {
    return 0;
  }
  int v7 = *((_DWORD *)this + 14);
  uint64_t v8 = v5 + 32 * (__int16)v7;
  if (!v5 || v8 == v6) {
    return 0;
  }
  uint64_t v11 = (__int16)v7;
  int v12 = v7 + 1;
  while (!*(_DWORD *)v8 || !*(void *)(*(void *)(v5 + 32 * v11 + 8) + 288))
  {
    *(_DWORD *)(v5 + 32 * v11 + 20) = 2;
    *((_DWORD *)this + 14) = v12;
    uint64_t v11 = (__int16)v12;
    uint64_t v8 = v5 + 32 * (__int16)v12++;
    if (v8 == v6) {
      return 0;
    }
  }
  uint64_t v13 = *(void *)(v8 + 8);
  uint64_t v14 = *(_DWORD *)(v13 + 300) & 0xFFFFFFFC;
  if (v14)
  {
    unint64_t v15 = *(void *)(v13 + 288);
    unint64_t v16 = v15 + v14;
    do
      v15 += 4096;
    while (v15 < v16);
  }
  return 1;
}

void OALSource::JoinBufferLists(OALSource *this, OALSource *a2)
{
  unsigned int v3 = (uint64_t *)*((void *)this + 3);
  if (*((_DWORD *)v3 + 6))
  {
    do
    {
      uint64_t v6 = v3[1];
      BOOL v7 = *v3 == v6;
      if (*v3 == v6) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = *v3;
      }
      if (!v7) {
        *(_DWORD *)(*v3 + 20) = 2;
      }
      BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), a2, *(_DWORD *)v8, *(OALBuffer **)(v8 + 8), *(_DWORD *)(v8 + 24));
      int v9 = (char **)*((void *)this + 3);
      uint64_t v11 = *v9;
      __int16 v10 = v9[1];
      if (*v9 == v10)
      {
        uint64_t v4 = *v9;
      }
      else
      {
        a2 = (OALSource *)(v11 + 32);
        int64_t v12 = v10 - (v11 + 32);
        if (v10 != v11 + 32) {
          memmove(*v9, a2, v10 - (v11 + 32));
        }
        uint64_t v13 = *v9;
        uint64_t v4 = &v11[v12];
        v9[1] = &v11[v12];
        uint64_t v11 = v13;
      }
      *((_DWORD *)v9 + 6) = (unint64_t)(v4 - v11) >> 5;
      unsigned int v3 = (uint64_t *)*((void *)this + 3);
      uint64_t v5 = (uint64_t *)*((void *)this + 4);
      *((_DWORD *)this + 12) = *((_DWORD *)v5 + 6) + *((_DWORD *)v3 + 6);
    }
    while (*((_DWORD *)v3 + 6));
  }
  else
  {
    uint64_t v5 = (uint64_t *)*((void *)this + 4);
  }
  *((void *)this + 3) = v5;
  *((void *)this + 4) = v3;
  uint64_t v15 = *v5;
  uint64_t v14 = v5[1];
  unint64_t v16 = v3[1] - *v3;
  unint64_t v17 = v14 - *v5;
  BOOL v7 = v14 == *v5;
  *((_DWORD *)v5 + 6) = v17 >> 5;
  *((_DWORD *)v3 + 6) = v16 >> 5;
  *((_DWORD *)this + 12) = *((_DWORD *)v3 + 6) + *((_DWORD *)v5 + 6);
  if (!v7)
  {
    uint64_t v18 = v15;
    if (v17 - 32 < 0x20) {
      goto LABEL_24;
    }
    unint64_t v19 = ((v17 - 32) >> 5) + 1;
    uint64_t v18 = v15 + 32 * (v19 & 0xFFFFFFFFFFFFFFELL);
    __int16 v20 = (void *)(v15 + 48);
    uint64_t v21 = v19 & 0xFFFFFFFFFFFFFFELL;
    do
    {
      *(v20 - 4) = 0;
      *__int16 v20 = 0;
      v20 += 8;
      v21 -= 2;
    }
    while (v21);
    if (v19 != (v19 & 0xFFFFFFFFFFFFFFELL))
    {
LABEL_24:
      do
      {
        *(void *)(v18 + 16) = 0;
        v18 += 32;
      }
      while (v18 != v14);
    }
  }
  *((_DWORD *)this + 14) = 0;
  *((unsigned char *)this + 60) = 0;
}

uint64_t OALSource::AdvanceQueueToFrameIndex(OALSource *this, unsigned int a2)
{
  uint64_t v4 = (_DWORD *)((char *)this + 80);
  int v5 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  v4[65] = 0;
  uint64_t v6 = (uint64_t *)*((void *)v4 - 7);
  uint64_t v7 = *v6;
  if (*v6 == v6[1])
  {
    if (a2) {
      goto LABEL_5;
    }
  }
  else
  {
    unsigned int v8 = 0;
    do
    {
      v8 += OALBuffer::GetFrameCount(*(OALBuffer **)(v7 + 8));
      v7 += 32;
    }
    while (v7 != v6[1]);
    if (v8 < a2)
    {
LABEL_5:
      uint64_t v9 = 40963;
      if (!v5) {
        return v9;
      }
      goto LABEL_27;
    }
  }
  int v10 = *(_DWORD *)(*((void *)this + 3) + 24);
  if (v10)
  {
    unsigned int v11 = 0;
    while (1)
    {
      int64_t v12 = (void *)*((void *)this + 3);
      uint64_t v13 = *v12 == v12[1] ? 0 : *v12;
      unsigned int v15 = OALBuffer::GetFrameCount(*(OALBuffer **)(v13 + 8)) + v11;
      unint64_t v16 = (uint64_t *)*((void *)this + 3);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      if (v15 > a2) {
        break;
      }
      if (v18 == v17)
      {
        uint64_t v21 = *v16;
      }
      else
      {
        *(_DWORD *)(v18 + 20) = 2;
        uint64_t v14 = (void *)(v18 + 32);
        uint64_t v19 = v17 - (v18 + 32);
        if (v17 == v18 + 32)
        {
          uint64_t v20 = v18;
        }
        else
        {
          memmove((void *)v18, v14, v17 - (v18 + 32));
          uint64_t v20 = *v16;
        }
        uint64_t v21 = v18 + v19;
        v16[1] = v18 + v19;
        uint64_t v18 = v20;
      }
      *((_DWORD *)v16 + 6) = (unint64_t)(v21 - v18) >> 5;
      BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), (OALSource *)v14, *(_DWORD *)v13, *(OALBuffer **)(v13 + 8), *(_DWORD *)(v13 + 24));
      *((_DWORD *)this + 12) = *(_DWORD *)(*((void *)this + 4) + 24) + *(_DWORD *)(*((void *)this + 3) + 24);
      __int16 v22 = (SourceNotifications *)*((void *)this + 52);
      if (v22) {
        SourceNotifications::CallSourceNotifications(v22, 4118);
      }
      unsigned int v11 = v15;
      if (!--v10) {
        goto LABEL_26;
      }
    }
    if (v18 != v17)
    {
      uint64_t v9 = 0;
      *(_DWORD *)(v18 + 16) = *(_DWORD *)(*(void *)(v18 + 8) + 320) * (a2 - v11);
      if (!v5) {
        return v9;
      }
      goto LABEL_27;
    }
  }
LABEL_26:
  uint64_t v9 = 0;
  if (v5) {
LABEL_27:
  }
    (*(void (**)(_DWORD *))(*(void *)v4 + 24))(v4);
  return v9;
}

void sub_221553038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_22155304C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t OALSource::StartRenderer(OALSource *this)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 1);
  pthread_t v3 = pthread_self();
  uint64_t v4 = *(_opaque_pthread_t **)(v2 + 480);
  if (v3 != v4)
  {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  int v5 = (*(uint64_t (**)(void))(*((void *)this + 10) + 16))();
  char v11 = v5;
  if (!*((void *)this + 45))
  {
    uint64_t v6 = 0;
    if (!v5) {
      goto LABEL_22;
    }
LABEL_21:
    (*(void (**)(char *))(*((void *)this + 10) + 24))((char *)this + 80);
    goto LABEL_22;
  }
  uint64_t v6 = 0;
  int v7 = *((_DWORD *)this + 76);
  char v8 = v7 - 1;
  if ((v7 - 56577) <= 5)
  {
    if (((1 << v8) & 0x32) == 0)
    {
      if (((1 << v8) & 9) != 0) {
        operator new();
      }
      operator new();
    }
    goto LABEL_20;
  }
  if (v7 == 4114) {
    goto LABEL_20;
  }
  if (v7 == 4115)
  {
    uint64_t v6 = OALSource::Resume(this);
    if (!v6) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  uint64_t v6 = OALSource::SetupMixerBus(this, (OALSource *)((char *)this + 376));
  if (v6 || (uint64_t v6 = OALSource::AddRenderProc(this), v6))
  {
LABEL_18:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(unsigned int *)this;
      *(_DWORD *)MixerDistanceParams buf = 136315906;
      uint64_t v13 = "oalSource.cpp";
      __int16 v14 = 1024;
      int v15 = 1391;
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      __int16 v18 = 2048;
      uint64_t v19 = (int)v6;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::StartRenderer FAILED - OALSource = %ld : uint64_t result = %ld", buf, 0x26u);
    }
LABEL_20:
    if (!v11) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  *((_DWORD *)this + 76) = 4114;
  *((unsigned char *)this + 60) = 0;
  if (v11) {
    goto LABEL_21;
  }
LABEL_22:
  if (v3 != v4) {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 0xFFFFFFFF);
  }
  return v6;
}

void sub_22155337C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CAGuard::Locker::~Locker((CAGuard::Locker *)&a9);
  if (v10 != v11) {
    atomic_fetch_add((atomic_uint *volatile)(v9 + 64), 0xFFFFFFFF);
  }
  _Unwind_Resume(a1);
}

uint64_t OALSource::Resume(OALSource *this)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 1);
  pthread_t v3 = pthread_self();
  uint64_t v4 = *(_opaque_pthread_t **)(v2 + 480);
  if (v3 != v4)
  {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  int v5 = (*(uint64_t (**)(void))(*((void *)this + 10) + 16))();
  int v6 = *((_DWORD *)this + 76);
  if (v6 != 4115)
  {
    if (v6 == 56579) {
      operator new();
    }
LABEL_12:
    uint64_t v7 = 0;
    goto LABEL_13;
  }
  *((_DWORD *)this + 86) = 1;
  uint64_t v7 = OALSource::AddRenderProc(this);
  if (!v7)
  {
    *((_DWORD *)this + 76) = 4114;
    uint64_t v9 = (SourceNotifications *)*((void *)this + 52);
    if (v9) {
      SourceNotifications::CallSourceNotifications(v9, 4112);
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(unsigned int *)this;
    *(_DWORD *)MixerDistanceParams buf = 136315906;
    int64_t v12 = "oalSource.cpp";
    __int16 v13 = 1024;
    int v14 = 1634;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = (int)v7;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::Resume FAILED - OALSource = %ld : uint64_t result = %ld", buf, 0x26u);
  }
LABEL_13:
  if (v5) {
    (*(void (**)(char *))(*((void *)this + 10) + 24))((char *)this + 80);
  }
  if (v3 != v4) {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 0xFFFFFFFF);
  }
  return v7;
}

void sub_221553610(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::AddRenderProc(OALSource *this)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 236)) {
    return 0;
  }
  AudioUnitElement v4 = *((_DWORD *)this + 58);
  if (v4 == -1) {
    return 0xFFFFFFFFLL;
  }
  *((void *)this + 27) = OALSource::SourceInputProc;
  *((void *)this + 28) = this;
  uint64_t v1 = OALContext::SetBusRenderProc(*((AudioUnit **)this + 1), v4, (const AURenderCallbackStruct *)((char *)this + 216));
  if (v1
    || (uint64_t v1 = AUGraphUpdate(*(AUGraph *)(*(void *)(*((void *)this + 1) + 16) + 16), 0), v1)
    || (uint64_t v1 = OALContext::SetBusEnable(*((OALContext **)this + 1), *((_DWORD *)this + 58), 1), v1))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(unsigned int *)this;
      int v6 = 136315906;
      uint64_t v7 = "oalSource.cpp";
      __int16 v8 = 1024;
      int v9 = 2594;
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      __int16 v12 = 2048;
      uint64_t v13 = (int)v1;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::AddRenderProc FAILED - OALSource = %ld : uint64_t result = %ld", (uint8_t *)&v6, 0x26u);
    }
  }
  else
  {
    *((unsigned char *)this + 236) = 1;
  }
  return v1;
}

uint64_t OALSource::Play(OALSource *this)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 1);
  pthread_t v3 = pthread_self();
  AudioUnitElement v4 = *(_opaque_pthread_t **)(v2 + 480);
  if (v3 != v4)
  {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  char v16 = (*(uint64_t (**)(void))(*((void *)this + 10) + 16))();
  if (*((_DWORD *)this + 71) == 1735095154)
  {
    uint64_t started = OALSource::StartRenderer(this);
    goto LABEL_6;
  }
  if (*((_DWORD *)this + 12))
  {
    int v9 = *((_DWORD *)this + 76);
    char v10 = v9 - 1;
    if ((v9 - 56577) <= 5)
    {
      if (((1 << v10) & 0x32) == 0)
      {
        if (((1 << v10) & 9) != 0) {
          operator new();
        }
        operator new();
      }
LABEL_20:
      operator new();
    }
    if (v9 == 4115)
    {
      uint64_t started = OALSource::Resume(this);
LABEL_6:
      uint64_t v7 = started;
      if (!started) {
        goto LABEL_21;
      }
      goto LABEL_7;
    }
    if (v9 == 4114)
    {
      *((_DWORD *)this + 86) = -1;
      goto LABEL_20;
    }
    OALSource::PrepBufferQueueForPlayback(this, v5);
    __int16 v12 = (uint64_t *)*((void *)this + 3);
    uint64_t v13 = *v12;
    uint64_t v7 = 0xFFFFFFFFLL;
    if (!*v12
      || (int v14 = *((_DWORD *)this + 14), v13 + 32 * (__int16)v14 == v12[1])
      || (uint64_t v7 = OALSource::SetupMixerBus(this, (CAStreamBasicDescription *)(*(void *)(v13 + 32 * (__int16)v14 + 8) + 304)), v7)|| (uint64_t v7 = OALSource::AddRenderProc(this), v7))
    {
LABEL_7:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(unsigned int *)this;
        *(_DWORD *)MixerDistanceParams buf = 136315906;
        uint64_t v18 = "oalSource.cpp";
        __int16 v19 = 1024;
        int v20 = 1481;
        __int16 v21 = 2048;
        uint64_t v22 = v8;
        __int16 v23 = 2048;
        uint64_t v24 = (int)v7;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::Play FAILED - OALSource = %ld : uint64_t result = %ld", buf, 0x26u);
        if (!v16) {
          goto LABEL_23;
        }
LABEL_22:
        (*(void (**)(char *))(*((void *)this + 10) + 24))((char *)this + 80);
        goto LABEL_23;
      }
LABEL_21:
      if (!v16) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    *((unsigned char *)this + 19) = 1;
    *((_DWORD *)this + 76) = 4114;
    __int16 v15 = (SourceNotifications *)*((void *)this + 52);
    if (v15) {
      SourceNotifications::CallSourceNotifications(v15, 4112);
    }
    uint64_t v7 = 0;
    *((_DWORD *)this + 86) = 1;
    *((unsigned char *)this + 60) = 0;
    if (v16) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_23:
  if (v3 != v4) {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 0xFFFFFFFF);
  }
  return v7;
}

void sub_221553BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CAGuard::Locker::~Locker((CAGuard::Locker *)&a9);
  if (v10 != v11) {
    atomic_fetch_add((atomic_uint *volatile)(v9 + 64), 0xFFFFFFFF);
  }
  _Unwind_Resume(a1);
}

uint64_t OALSource::Rewind(OALSource *this)
{
  uint64_t v2 = *((void *)this + 1);
  pthread_t v3 = pthread_self();
  AudioUnitElement v4 = *(_opaque_pthread_t **)(v2 + 480);
  if (v3 != v4)
  {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  uint64_t result = (*(uint64_t (**)(void))(*((void *)this + 10) + 16))();
  unsigned __int8 v11 = result;
  *((_DWORD *)this + 85) = 0;
  int v7 = *((_DWORD *)this + 76);
  if (v7 <= 56576)
  {
    switch(v7)
    {
      case 4114:
        *((_DWORD *)this + 76) = 56580;
        *((_DWORD *)this + 86) = -1;
        operator new();
      case 4115:
        int v6 = (OALSource *)*((unsigned int *)this + 58);
        if (v6 != -1)
        {
          OALContext::SetBusAsAvailable(*((void *)this + 1), v6);
          *((_DWORD *)this + 58) = -1;
        }
        break;
      case 4116:
        break;
      default:
        goto LABEL_11;
    }
    OALSource::JoinBufferLists(this, v6);
    *((_DWORD *)this + 76) = 4113;
    uint64_t v10 = (SourceNotifications *)*((void *)this + 52);
    if (v10) {
      SourceNotifications::CallSourceNotifications(v10, 4112);
    }
    uint64_t result = v11;
  }
  else
  {
    unsigned int v8 = v7 - 56577;
    if (v8 <= 5 && v8 != 3)
    {
      *((_DWORD *)this + 76) = 56580;
      operator new();
    }
  }
LABEL_11:
  if (result) {
    uint64_t result = (*(uint64_t (**)(char *))(*((void *)this + 10) + 24))((char *)this + 80);
  }
  if (v3 != v4) {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 0xFFFFFFFF);
  }
  return result;
}

void sub_221553E28(_Unwind_Exception *exception_object)
{
  if (v2 != v3) {
    atomic_fetch_add((atomic_uint *volatile)(v1 + 64), 0xFFFFFFFF);
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::Pause(OALSource *this)
{
  uint64_t v2 = *((void *)this + 1);
  pthread_t v3 = pthread_self();
  AudioUnitElement v4 = *(_opaque_pthread_t **)(v2 + 480);
  if (v3 != v4)
  {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  uint64_t result = (*(uint64_t (**)(void))(*((void *)this + 10) + 16))();
  int v6 = *((_DWORD *)this + 76);
  if ((v6 - 56578) <= 4 && ((1 << (v6 - 2)) & 0x19) != 0) {
    operator new();
  }
  if (v6 == 4114)
  {
    *((_DWORD *)this + 86) = -1;
    operator new();
  }
  if (result) {
    uint64_t result = (*(uint64_t (**)(char *))(*((void *)this + 10) + 24))((char *)this + 80);
  }
  if (v3 != v4) {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 0xFFFFFFFF);
  }
  return result;
}

void sub_22155401C(_Unwind_Exception *exception_object)
{
  if (v2 != v3) {
    atomic_fetch_add((atomic_uint *volatile)(v1 + 64), 0xFFFFFFFF);
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::Stop(OALSource *this)
{
  uint64_t v2 = *((void *)this + 1);
  pthread_t v3 = pthread_self();
  AudioUnitElement v4 = *(_opaque_pthread_t **)(v2 + 480);
  if (v3 != v4)
  {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  uint64_t result = (*(uint64_t (**)(void))(*((void *)this + 10) + 16))();
  unsigned __int8 v11 = result;
  *((_DWORD *)this + 85) = 0;
  int v6 = *((_DWORD *)this + 76);
  if ((v6 - 56578) <= 4 && v6 != 56580) {
    operator new();
  }
  if (v6 == 4114)
  {
    *((_DWORD *)this + 76) = 56577;
    *((_DWORD *)this + 86) = -1;
    operator new();
  }
  if (v6 == 4115)
  {
    unsigned int v8 = *((_DWORD *)this + 58);
    if (v8 != -1)
    {
      OALContext::SetBusAsAvailable(*((void *)this + 1), v8);
      *((_DWORD *)this + 58) = -1;
      *((_DWORD *)this + 76) = 4116;
      uint64_t v9 = (SourceNotifications *)*((void *)this + 52);
      if (v9) {
        SourceNotifications::CallSourceNotifications(v9, 4112);
      }
      if (*(_DWORD *)(*((void *)this + 3) + 24))
      {
        uint64_t v10 = (SourceNotifications *)*((void *)this + 52);
        if (v10) {
          SourceNotifications::CallSourceNotifications(v10, 4118);
        }
      }
    }
    uint64_t result = v11;
  }
  if (result) {
    uint64_t result = (*(uint64_t (**)(char *))(*((void *)this + 10) + 24))((char *)this + 80);
  }
  if (v3 != v4) {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 0xFFFFFFFF);
  }
  return result;
}

void sub_22155427C(_Unwind_Exception *exception_object)
{
  if (v2 != v3) {
    atomic_fetch_add((atomic_uint *volatile)(v1 + 64), 0xFFFFFFFF);
  }
  _Unwind_Resume(exception_object);
}

void SourceNotifications::CallSourceNotifications(SourceNotifications *this, int a2)
{
  uint64_t v2 = *((void *)this + 3);
  if (v2)
  {
    int v5 = (*(uint64_t (**)(void))(*(void *)v2 + 16))(*((void *)this + 3));
    uint64_t v7 = *(void *)this;
    int v6 = (_DWORD *)*((void *)this + 1);
    if (*(_DWORD **)this != v6)
    {
      unsigned int v8 = *(_DWORD **)this;
      do
      {
        if (*v8 == a2)
        {
          global_queue = dispatch_get_global_queue(0, 0);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 0x40000000;
          block[2] = ___ZN19SourceNotifications26CallSourceNotificationsImpEj_block_invoke;
          block[3] = &__block_descriptor_tmp;
          block[4] = this;
          block[5] = v7;
          int v11 = a2;
          dispatch_async(global_queue, block);
          int v6 = (_DWORD *)*((void *)this + 1);
        }
        v8 += 6;
        v7 += 24;
      }
      while (v8 != v6);
    }
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
    }
  }
}

uint64_t OALSource::GetQueueOffset(OALSource *this, int a2)
{
  uint64_t v4 = *((void *)this + 1);
  pthread_t v5 = pthread_self();
  int v6 = *(_opaque_pthread_t **)(v4 + 480);
  if (v5 != v6)
  {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  int v7 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  if (a2 == 1)
  {
    uint64_t v22 = (uint64_t *)*((void *)this + 4);
    uint64_t v23 = *v22;
    if (*v22 == v22[1])
    {
      int v24 = 0;
      unint64_t v25 = *((unsigned int *)this + 14);
      if (v25)
      {
LABEL_22:
        unint64_t v26 = 0;
        int v27 = 0;
        uint64_t v28 = 8;
        do
        {
          while (1)
          {
            __int16 v29 = (void *)*((void *)this + 3);
            if (*v29 + v28 - 8 != v29[1]) {
              break;
            }
            ++v26;
            v28 += 32;
            if (v26 >= v25) {
              goto LABEL_26;
            }
          }
          int FrameCount = OALBuffer::GetFrameCount(*(OALBuffer **)(*v29 + v28));
          unint64_t v25 = *((unsigned int *)this + 14);
          v27 += FrameCount;
          ++v26;
          v28 += 32;
        }
        while (v26 < v25);
LABEL_26:
        uint64_t v31 = (uint64_t *)*((void *)this + 3);
        uint64_t v32 = *v31;
        uint64_t v33 = v31[1];
        uint64_t v34 = *v31 + 32 * v25;
        if (v34 != v33)
        {
LABEL_27:
          unsigned int v35 = *(_DWORD *)(*(void *)(v34 + 8) + 320);
          if (v35) {
            unsigned int v35 = *(_DWORD *)(v32 + 32 * v25 + 16) / v35;
          }
          if (*((_DWORD *)this + 71) == 1735095154) {
            goto LABEL_30;
          }
          goto LABEL_62;
        }
LABEL_61:
        unsigned int v35 = 0;
        if (*((_DWORD *)this + 71) == 1735095154)
        {
LABEL_30:
          uint64_t v36 = (double *)((char *)this + 376);
          goto LABEL_70;
        }
LABEL_62:
        uint64_t v59 = v32 + 32 * (__int16)v25;
        if (v32) {
          BOOL v60 = v59 == v33;
        }
        else {
          BOOL v60 = 1;
        }
        if (v60)
        {
          uint64_t v52 = 0;
          int v61 = (uint64_t *)*((void *)this + 4);
          uint64_t v59 = *v61;
          if (!*v61 || v59 == v61[1]) {
            goto LABEL_78;
          }
        }
        uint64_t v36 = (double *)(*(void *)(v59 + 8) + 304);
LABEL_70:
        uint64_t v52 = ((double)(v27 + v24 + v35) / *v36);
        if (v7) {
          goto LABEL_79;
        }
        goto LABEL_80;
      }
    }
    else
    {
      int v24 = 0;
      do
      {
        v24 += OALBuffer::GetFrameCount(*(OALBuffer **)(v23 + 8));
        v23 += 32;
      }
      while (v23 != v22[1]);
      unint64_t v25 = *((unsigned int *)this + 14);
      if (v25) {
        goto LABEL_22;
      }
    }
    unint64_t v25 = 0;
    int v27 = 0;
    __int16 v58 = (uint64_t *)*((void *)this + 3);
    uint64_t v32 = *v58;
    uint64_t v33 = v58[1];
    uint64_t v34 = *v58;
    if (v34 != v33) {
      goto LABEL_27;
    }
    goto LABEL_61;
  }
  if (a2 == 2)
  {
    uint64_t v37 = (uint64_t *)*((void *)this + 4);
    uint64_t v38 = *v37;
    if (*v37 == v37[1])
    {
      int v39 = 0;
      unint64_t v40 = *((unsigned int *)this + 14);
      if (v40)
      {
LABEL_35:
        unint64_t v41 = 0;
        int v42 = 0;
        uint64_t v43 = 8;
        do
        {
          while (1)
          {
            uint64_t v44 = (void *)*((void *)this + 3);
            if (*v44 + v43 - 8 != v44[1]) {
              break;
            }
            ++v41;
            v43 += 32;
            if (v41 >= v40) {
              goto LABEL_39;
            }
          }
          int v45 = OALBuffer::GetFrameCount(*(OALBuffer **)(*v44 + v43));
          unint64_t v40 = *((unsigned int *)this + 14);
          v42 += v45;
          ++v41;
          v43 += 32;
        }
        while (v41 < v40);
LABEL_39:
        BOOL v46 = (uint64_t *)*((void *)this + 3);
        uint64_t v47 = *v46;
        uint64_t v48 = v46[1];
        uint64_t v49 = *v46 + 32 * v40;
        if (v49 == v48) {
          goto LABEL_76;
        }
LABEL_74:
        unsigned int v64 = *(_DWORD *)(*(void *)(v49 + 8) + 320);
        if (v64)
        {
          int v65 = *(_DWORD *)(v47 + 32 * v40 + 16) / v64;
LABEL_77:
          uint64_t v52 = (v42 + v39 + v65);
          goto LABEL_78;
        }
LABEL_76:
        int v65 = 0;
        goto LABEL_77;
      }
    }
    else
    {
      int v39 = 0;
      do
      {
        v39 += OALBuffer::GetFrameCount(*(OALBuffer **)(v38 + 8));
        v38 += 32;
      }
      while (v38 != v37[1]);
      unint64_t v40 = *((unsigned int *)this + 14);
      if (v40) {
        goto LABEL_35;
      }
    }
    int v42 = 0;
    unint64_t v40 = 0;
    __int16 v62 = (uint64_t *)*((void *)this + 3);
    uint64_t v47 = *v62;
    uint64_t v63 = v62[1];
    uint64_t v49 = *v62;
    if (v49 == v63) {
      goto LABEL_76;
    }
    goto LABEL_74;
  }
  if (a2 != 3) {
    goto LABEL_57;
  }
  unsigned int v8 = (uint64_t *)*((void *)this + 4);
  uint64_t v9 = *v8;
  if (*v8 == v8[1])
  {
    int v10 = 0;
    unint64_t v11 = *((unsigned int *)this + 14);
    if (v11)
    {
LABEL_11:
      unint64_t v12 = 0;
      int v13 = 0;
      uint64_t v14 = 8;
      do
      {
        while (1)
        {
          __int16 v15 = (void *)*((void *)this + 3);
          if (*v15 + v14 - 8 != v15[1]) {
            break;
          }
          ++v12;
          v14 += 32;
          if (v12 >= v11) {
            goto LABEL_15;
          }
        }
        int v16 = OALBuffer::GetFrameCount(*(OALBuffer **)(*v15 + v14));
        unint64_t v11 = *((unsigned int *)this + 14);
        v13 += v16;
        ++v12;
        v14 += 32;
      }
      while (v12 < v11);
LABEL_15:
      __int16 v17 = (uint64_t *)*((void *)this + 3);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      uint64_t v20 = *v17 + 32 * v11;
      if (v20 != v19) {
        goto LABEL_16;
      }
LABEL_43:
      unsigned int v21 = 0;
      goto LABEL_44;
    }
  }
  else
  {
    int v10 = 0;
    do
    {
      v10 += OALBuffer::GetFrameCount(*(OALBuffer **)(v9 + 8));
      v9 += 32;
    }
    while (v9 != v8[1]);
    unint64_t v11 = *((unsigned int *)this + 14);
    if (v11) {
      goto LABEL_11;
    }
  }
  unint64_t v11 = 0;
  int v13 = 0;
  BOOL v50 = (uint64_t *)*((void *)this + 3);
  uint64_t v18 = *v50;
  uint64_t v19 = v50[1];
  uint64_t v20 = *v50;
  if (v20 == v19) {
    goto LABEL_43;
  }
LABEL_16:
  unsigned int v21 = *(_DWORD *)(*(void *)(v20 + 8) + 320);
  if (v21) {
    unsigned int v21 = *(_DWORD *)(v18 + 32 * v11 + 16) / v21;
  }
LABEL_44:
  unsigned int v51 = v13 + v10 + v21;
  if (*((_DWORD *)this + 71) == 1735095154)
  {
    uint64_t v52 = *((_DWORD *)this + 100) * v51;
    if (!v7) {
      goto LABEL_80;
    }
LABEL_79:
    (*(void (**)(char *))(*((void *)this + 10) + 24))((char *)this + 80);
    goto LABEL_80;
  }
  uint64_t v53 = v18 + 32 * (__int16)v11;
  if (v18) {
    BOOL v54 = v53 == v19;
  }
  else {
    BOOL v54 = 1;
  }
  if (v54)
  {
    uint64_t v52 = 0;
    char v55 = (uint64_t *)*((void *)this + 4);
    uint64_t v53 = *v55;
    if (!*v55 || v53 == v55[1])
    {
LABEL_78:
      if (!v7) {
        goto LABEL_80;
      }
      goto LABEL_79;
    }
  }
  uint64_t v56 = *(void *)(v53 + 8);
  unsigned int v57 = *(_DWORD *)(v56 + 324);
  if (!v57)
  {
LABEL_57:
    uint64_t v52 = 0;
    if (v7) {
      goto LABEL_79;
    }
    goto LABEL_80;
  }
  uint64_t v52 = *(_DWORD *)(v56 + 320) * (v51 / v57);
  if (v7) {
    goto LABEL_79;
  }
LABEL_80:
  if (v5 != v6) {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 0xFFFFFFFF);
  }
  return v52;
}

void sub_221554918(_Unwind_Exception *exception_object)
{
  if (v2 != v3) {
    atomic_fetch_add((atomic_uint *volatile)(v1 + 64), 0xFFFFFFFF);
  }
  _Unwind_Resume(exception_object);
}

float OALSource::GetQueueOffsetSecondsFloat(OALSource *this)
{
  uint64_t v2 = (char *)this + 80;
  int v3 = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  uint64_t v4 = (uint64_t *)*((void *)v2 - 6);
  uint64_t v5 = *v4;
  if (*v4 != v4[1])
  {
    int v6 = 0;
    do
    {
      v6 += OALBuffer::GetFrameCount(*(OALBuffer **)(v5 + 8));
      v5 += 32;
    }
    while (v5 != v4[1]);
    unint64_t v7 = *((unsigned int *)this + 14);
    if (v7) {
      goto LABEL_5;
    }
LABEL_15:
    unint64_t v7 = 0;
    int v9 = 0;
    uint64_t v19 = (uint64_t *)*((void *)this + 3);
    uint64_t v14 = *v19;
    uint64_t v15 = v19[1];
    uint64_t v16 = *v19;
    if (v16 != v15) {
      goto LABEL_10;
    }
    goto LABEL_16;
  }
  int v6 = 0;
  unint64_t v7 = *((unsigned int *)this + 14);
  if (!v7) {
    goto LABEL_15;
  }
LABEL_5:
  unint64_t v8 = 0;
  int v9 = 0;
  uint64_t v10 = 8;
  do
  {
    while (1)
    {
      unint64_t v11 = (void *)*((void *)this + 3);
      if (*v11 + v10 - 8 != v11[1]) {
        break;
      }
      ++v8;
      v10 += 32;
      if (v8 >= v7) {
        goto LABEL_9;
      }
    }
    int FrameCount = OALBuffer::GetFrameCount(*(OALBuffer **)(*v11 + v10));
    unint64_t v7 = *((unsigned int *)this + 14);
    v9 += FrameCount;
    ++v8;
    v10 += 32;
  }
  while (v8 < v7);
LABEL_9:
  int v13 = (uint64_t *)*((void *)this + 3);
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  uint64_t v16 = *v13 + 32 * v7;
  if (v16 != v15)
  {
LABEL_10:
    unsigned int v17 = *(_DWORD *)(*(void *)(v16 + 8) + 320);
    if (v17) {
      unsigned int v17 = *(_DWORD *)(v14 + 32 * v7 + 16) / v17;
    }
    if (*((_DWORD *)this + 71) == 1735095154) {
      goto LABEL_13;
    }
    goto LABEL_17;
  }
LABEL_16:
  unsigned int v17 = 0;
  if (*((_DWORD *)this + 71) == 1735095154)
  {
LABEL_13:
    uint64_t v18 = (double *)((char *)this + 376);
    goto LABEL_25;
  }
LABEL_17:
  uint64_t v20 = v14 + 32 * (__int16)v7;
  if (v14) {
    BOOL v21 = v20 == v15;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21)
  {
    uint64_t v22 = (uint64_t *)*((void *)this + 4);
    uint64_t v20 = *v22;
    float v23 = 0.0;
    if (!*v22 || v20 == v22[1]) {
      goto LABEL_26;
    }
  }
  uint64_t v18 = (double *)(*(void *)(v20 + 8) + 304);
LABEL_25:
  float v23 = (double)(v9 + v6 + v17) / *v18;
LABEL_26:
  if (v3) {
    (*(void (**)(char *))(*(void *)v2 + 24))(v2);
  }
  return v23;
}

void sub_221554B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_221554B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t OALSource::SetQueueOffset(OALSource *this, int a2, float a3)
{
  if (a3 < 0.0) {
    goto LABEL_55;
  }
  if (a2 != 3)
  {
    if (a2 == 2)
    {
      unsigned int v5 = a3;
      uint64_t v9 = *((void *)this + 1);
      pthread_t v7 = pthread_self();
      unint64_t v8 = *(_opaque_pthread_t **)(v9 + 480);
      if (v7 == v8) {
        goto LABEL_31;
      }
      goto LABEL_29;
    }
    if (a2 != 1) {
      return 40963;
    }
    if (*((_DWORD *)this + 71) == 1735095154)
    {
      uint64_t v4 = (double *)((char *)this + 376);
    }
    else
    {
      unint64_t v11 = (uint64_t *)*((void *)this + 3);
      int v12 = *((_DWORD *)this + 14);
      uint64_t v13 = *v11;
      uint64_t v14 = v11[1];
      if (v13) {
        BOOL v15 = v13 + 32 * (__int16)v12 == v14;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15)
      {
        unsigned int v5 = 0;
        goto LABEL_27;
      }
      uint64_t v4 = (double *)(*(void *)(v13 + 32 * (__int16)v12 + 8) + 304);
    }
    unsigned int v5 = (*v4 * a3);
LABEL_27:
    if ((int)v5 >= (int)a3)
    {
      uint64_t v22 = *((void *)this + 1);
      pthread_t v7 = pthread_self();
      unint64_t v8 = *(_opaque_pthread_t **)(v22 + 480);
      if (v7 == v8) {
        goto LABEL_31;
      }
      goto LABEL_29;
    }
LABEL_55:
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 40963;
    __cxa_throw(exception, MEMORY[0x263F8C258], 0);
  }
  if (*((_DWORD *)this + 71) == 1735095154)
  {
    unsigned int v5 = a3 / *((_DWORD *)this + 100);
    uint64_t v6 = *((void *)this + 1);
    pthread_t v7 = pthread_self();
    unint64_t v8 = *(_opaque_pthread_t **)(v6 + 480);
    if (v7 == v8) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v16 = (uint64_t *)*((void *)this + 3);
    int v17 = *((_DWORD *)this + 14);
    uint64_t v18 = *v16;
    uint64_t v19 = v16[1];
    if (v18) {
      BOOL v20 = v18 + 32 * (__int16)v17 == v19;
    }
    else {
      BOOL v20 = 1;
    }
    if (v20)
    {
      unsigned int v5 = 0;
      uint64_t v21 = *((void *)this + 1);
      pthread_t v7 = pthread_self();
      unint64_t v8 = *(_opaque_pthread_t **)(v21 + 480);
      if (v7 == v8) {
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v30 = *(void *)(v18 + 32 * (__int16)v17 + 8);
      unsigned int v5 = *(_DWORD *)(v30 + 324) * (float)(a3 / (float)*(unsigned int *)(v30 + 320));
      uint64_t v31 = *((void *)this + 1);
      pthread_t v32 = pthread_self();
      pthread_t v7 = v32;
      unint64_t v8 = *(_opaque_pthread_t **)(v31 + 480);
      if (v32 == v8) {
        goto LABEL_31;
      }
    }
  }
LABEL_29:
  atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
  while (*((_DWORD *)this + 17))
    usleep(0x1F4u);
LABEL_31:
  int v23 = (*(uint64_t (**)(void))(*((void *)this + 10) + 16))();
  uint64_t v10 = 0;
  int v24 = *((_DWORD *)this + 76);
  if (v24 <= 56576)
  {
    if ((v24 - 4115) < 2 || v24 == 4113)
    {
      uint64_t v10 = 0;
      *((_DWORD *)this + 85) = v5;
      goto LABEL_46;
    }
    if (v24 != 4114) {
      goto LABEL_46;
    }
LABEL_33:
    unint64_t v25 = (uint64_t *)*((void *)this + 3);
    uint64_t v26 = *v25;
    if (*v25 == v25[1])
    {
      if (v5)
      {
LABEL_37:
        uint64_t v10 = 40963;
        goto LABEL_46;
      }
    }
    else
    {
      unsigned int v27 = 0;
      do
      {
        v27 += OALBuffer::GetFrameCount(*(OALBuffer **)(v26 + 8));
        v26 += 32;
      }
      while (v26 != v25[1]);
      if (v5 > v27) {
        goto LABEL_37;
      }
    }
    *((_DWORD *)this + 86) = -1;
    *((_DWORD *)this + 89) = v5;
    operator new();
  }
  if ((v24 - 56577) < 6) {
    goto LABEL_33;
  }
LABEL_46:
  if (v23) {
    (*(void (**)(char *))(*((void *)this + 10) + 24))((char *)this + 80);
  }
  if (v7 != v8) {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 0xFFFFFFFF);
  }
  return v10;
}

void sub_221554F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CAGuard::Locker::~Locker((CAGuard::Locker *)&a9);
  if (v10 != v11) {
    atomic_fetch_add((atomic_uint *volatile)(v9 + 64), 0xFFFFFFFF);
  }
  _Unwind_Resume(a1);
}

uint64_t OALSource::SetRenderCallback(OALSource *this, int (*a2)(unsigned int, int, char **, int *, void *), int a3, unsigned int a4, void *a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v10 = *((void *)this + 1);
  pthread_t v11 = pthread_self();
  int v12 = *(_opaque_pthread_t **)(v10 + 480);
  if (v11 != v12)
  {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 1u);
    while (*((_DWORD *)this + 17))
      usleep(0x1F4u);
  }
  int v13 = (*(uint64_t (**)(void))(*((void *)this + 10) + 16))();
  int v14 = *((_DWORD *)this + 76);
  if ((v14 - 56577) <= 5)
  {
    if (((1 << (v14 - 1)) & 0x36) == 0)
    {
      if (!a2)
      {
        *((_DWORD *)this + 71) = 4144;
        *((void *)this + 45) = 0;
      }
      operator new();
    }
    goto LABEL_10;
  }
  if ((v14 - 4114) < 2)
  {
LABEL_10:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(unsigned int *)this;
      *(_DWORD *)MixerDistanceParams buf = 136315906;
      uint64_t v19 = "oalSource.cpp";
      __int16 v20 = 1024;
      int v21 = 2084;
      __int16 v22 = 2048;
      uint64_t v23 = v15;
      __int16 v24 = 2048;
      uint64_t v16 = 40964;
      uint64_t v25 = 40964;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::SetRenderCallback FAILED - OALSource = %ld : uint64_t result = %ld", buf, 0x26u);
    }
    else
    {
      uint64_t v16 = 40964;
    }
    goto LABEL_13;
  }
  OALSource::FlushBufferQueue(this);
  if (a2)
  {
    *((void *)this + 45) = a2;
    *((void *)this + 46) = a5;
    FillInASBD((uint64_t)this + 376, a3, a4);
    *((_DWORD *)this + 71) = 1735095154;
    CAStreamBasicDescription::Print((OALSource *)((char *)this + 376), (__sFILE *)*MEMORY[0x263EF8358]);
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    *((_DWORD *)this + 71) = 4144;
    *((void *)this + 45) = 0;
  }
LABEL_13:
  if (v13) {
    (*(void (**)(char *))(*((void *)this + 10) + 24))((char *)this + 80);
  }
  if (v11 != v12) {
    atomic_fetch_add((atomic_uint *volatile)this + 16, 0xFFFFFFFF);
  }
  return v16;
}

void sub_221555234(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALSource::AddNotification(OALSource *this, int a2, void (*a3)(unsigned int, unsigned int, void *), void *a4)
{
  pthread_t v7 = (SourceNotifications *)*((void *)this + 52);
  if (!v7) {
    operator new();
  }
  uint64_t v8 = *((void *)v7 + 3);
  int v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 16))(v8);
  uint64_t v10 = SourceNotifications::AddSourceNotificationImp(v7, a2, a3, a4);
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v8 + 24))(v8);
  }
  return v10;
}

void sub_2215553A0(_Unwind_Exception *a1)
{
  MEMORY[0x223C843A0](v2, 0x10F1C40976EDA9DLL);
  uint64_t v4 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v4;
    operator delete(v4);
  }
  MEMORY[0x223C843A0](v1, 0x1020C401C8C6399);
  _Unwind_Resume(a1);
}

void sub_2215553F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *OALSource::RemoveNotification(void *this, int a2, void (*a3)(unsigned int, unsigned int, void *), void *a4)
{
  uint64_t v4 = (uint64_t *)this[52];
  if (v4)
  {
    uint64_t v8 = v4[3];
    this = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v8 + 16))(v8);
    int v9 = (int)this;
    uint64_t v11 = *v4;
    uint64_t v10 = v4[1];
    if (*v4 != v10)
    {
      while (*(_DWORD *)v11 != a2
           || *(void (**)(unsigned int, unsigned int, void *))(v11 + 8) != a3
           || *(void **)(v11 + 16) != a4)
      {
        v11 += 24;
        if (v11 == v10) {
          goto LABEL_12;
        }
      }
    }
    if (v11 != v10)
    {
      uint64_t v12 = v10 - (v11 + 24);
      if (v10 != v11 + 24) {
        this = memmove((void *)v11, (const void *)(v11 + 24), v10 - (v11 + 24));
      }
      v4[1] = v11 + v12;
    }
LABEL_12:
    if (v9) {
      return (void *)(*(uint64_t (**)(uint64_t))(*(void *)v8 + 24))(v8);
    }
  }
  return this;
}

uint64_t OALSource::SetRenderQuality(OALSource *this, int a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (IsValidRenderQuality(a2))
  {
    *((_DWORD *)this + 111) = a2;
    AudioUnitElement v4 = *((_DWORD *)this + 58);
    if (v4 == -1)
    {
      return 0;
    }
    else
    {
      uint64_t v5 = OALContext::SetSourceDesiredRenderQualityOnBus(*((AudioUnit **)this + 1), a2, v4);
      if (v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = *(unsigned int *)this;
        int v9 = 136315906;
        uint64_t v10 = "oalSource.cpp";
        __int16 v11 = 1024;
        int v12 = 2551;
        __int16 v13 = 2048;
        uint64_t v14 = v6;
        __int16 v15 = 2048;
        uint64_t v16 = (int)v5;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::UpdateBusRenderQuality FAILED - OALSource = %ld : uint64_t result = %ld", (uint8_t *)&v9, 0x26u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(unsigned int *)this;
      int v9 = 136315650;
      uint64_t v10 = "oalSource.cpp";
      __int16 v11 = 1024;
      int v12 = 2157;
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d OALSource::SetRenderQuality called - OALSource = %ld: Invalid Render Quality", (uint8_t *)&v9, 0x1Cu);
    }
    return 4294967246;
  }
  return v5;
}

uint64_t OALSource::GetRenderQuality(OALSource *this)
{
  return *((unsigned int *)this + 111);
}

void *OALSource::ClearMessageQueue(void *this)
{
  while (1)
  {
    uint64_t v1 = (void *)this[53];
    if (!v1) {
      break;
    }
    uint64_t v2 = (void *)this[53];
    atomic_compare_exchange_strong(this + 53, (unint64_t *)&v2, 0);
    if (v2 == v1)
    {
      this = 0;
      do
      {
        int v3 = this;
        this = v1;
        uint64_t v1 = (void *)*v1;
        *this = v3;
      }
      while (v1);
      do
      {
        AudioUnitElement v4 = (void *)*this;
        MEMORY[0x223C843A0]();
        this = v4;
      }
      while (v4);
      return this;
    }
  }
  return this;
}

void OALSource::LoopToBeginning(OALSource *this, OALSource *a2)
{
  int v3 = (uint64_t *)*((void *)this + 3);
  if (*((_DWORD *)v3 + 6))
  {
    do
    {
      uint64_t v6 = v3[1];
      BOOL v7 = *v3 == v6;
      if (*v3 == v6) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = *v3;
      }
      if (!v7) {
        *(_DWORD *)(*v3 + 20) = 2;
      }
      BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), a2, *(_DWORD *)v8, *(OALBuffer **)(v8 + 8), *(_DWORD *)(v8 + 24));
      int v9 = (char **)*((void *)this + 3);
      __int16 v11 = *v9;
      uint64_t v10 = v9[1];
      if (*v9 == v10)
      {
        AudioUnitElement v4 = *v9;
      }
      else
      {
        a2 = (OALSource *)(v11 + 32);
        int64_t v12 = v10 - (v11 + 32);
        if (v10 != v11 + 32) {
          memmove(*v9, a2, v10 - (v11 + 32));
        }
        __int16 v13 = *v9;
        AudioUnitElement v4 = &v11[v12];
        v9[1] = &v11[v12];
        __int16 v11 = v13;
      }
      *((_DWORD *)v9 + 6) = (unint64_t)(v4 - v11) >> 5;
      int v3 = (uint64_t *)*((void *)this + 3);
      uint64_t v5 = (uint64_t *)*((void *)this + 4);
      *((_DWORD *)this + 12) = *((_DWORD *)v5 + 6) + *((_DWORD *)v3 + 6);
    }
    while (*((_DWORD *)v3 + 6));
  }
  else
  {
    uint64_t v5 = (uint64_t *)*((void *)this + 4);
  }
  *((void *)this + 3) = v5;
  *((void *)this + 4) = v3;
  uint64_t v15 = *v5;
  uint64_t v14 = v5[1];
  unint64_t v16 = v3[1] - *v3;
  unint64_t v17 = v14 - *v5;
  BOOL v7 = v14 == *v5;
  *((_DWORD *)v5 + 6) = v17 >> 5;
  *((_DWORD *)v3 + 6) = v16 >> 5;
  *((_DWORD *)this + 12) = *((_DWORD *)v3 + 6) + *((_DWORD *)v5 + 6);
  if (!v7)
  {
    uint64_t v18 = v15;
    if (v17 - 32 < 0x20) {
      goto LABEL_28;
    }
    unint64_t v19 = ((v17 - 32) >> 5) + 1;
    uint64_t v18 = v15 + 32 * (v19 & 0xFFFFFFFFFFFFFFELL);
    __int16 v20 = (void *)(v15 + 48);
    uint64_t v21 = v19 & 0xFFFFFFFFFFFFFFELL;
    do
    {
      *(v20 - 4) = 0;
      *__int16 v20 = 0;
      v20 += 8;
      v21 -= 2;
    }
    while (v21);
    if (v19 != (v19 & 0xFFFFFFFFFFFFFFELL))
    {
LABEL_28:
      do
      {
        *(void *)(v18 + 16) = 0;
        v18 += 32;
      }
      while (v18 != v14);
    }
  }
  *((_DWORD *)this + 14) = 0;
  *((unsigned char *)this + 60) = 0;
  __int16 v22 = (SourceNotifications *)*((void *)this + 52);
  if (v22 && *((_DWORD *)this + 69))
  {
    SourceNotifications::CallSourceNotifications(v22, 36864);
  }
}

void OALSource::UpdateQueue(OALSource *this, OALSource *a2)
{
  if (*((_DWORD *)this + 14))
  {
    unsigned int v3 = 0;
    do
    {
      AudioUnitElement v4 = (uint64_t *)*((void *)this + 3);
      uint64_t v5 = *v4;
      uint64_t v6 = v4[1];
      if (v5) {
        BOOL v7 = v5 == v6;
      }
      else {
        BOOL v7 = 1;
      }
      if (!v7)
      {
        BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), a2, *(_DWORD *)v5, *(OALBuffer **)(v5 + 8), *(_DWORD *)(v5 + 24));
        uint64_t v8 = (char **)*((void *)this + 3);
        uint64_t v10 = *v8;
        int v9 = v8[1];
        if (*v8 == v9)
        {
          __int16 v13 = *v8;
        }
        else
        {
          a2 = (OALSource *)(v10 + 32);
          int64_t v11 = v9 - (v10 + 32);
          if (v9 != v10 + 32) {
            memmove(*v8, a2, v9 - (v10 + 32));
          }
          int64_t v12 = *v8;
          __int16 v13 = &v10[v11];
          v8[1] = &v10[v11];
          uint64_t v10 = v12;
        }
        *((_DWORD *)v8 + 6) = (unint64_t)(v13 - v10) >> 5;
        *((_DWORD *)this + 12) = *(_DWORD *)(*((void *)this + 4) + 24) + *(_DWORD *)(*((void *)this + 3) + 24);
        uint64_t v14 = (SourceNotifications *)*((void *)this + 52);
        if (v14) {
          SourceNotifications::CallSourceNotifications(v14, 4118);
        }
      }
      ++v3;
    }
    while (v3 < *((_DWORD *)this + 14));
    *((_DWORD *)this + 14) = 0;
  }
}

void OALSource::CalculateDistanceAndAzimuth(OALSource *this, float *a2, float *a3, float *a4, float *a5)
{
  *a5 = 1.0;
  uint64_t v10 = (float *)*((void *)this + 1);
  float v11 = v10[89];
  float v12 = v10[90];
  float v13 = v10[91];
  float v14 = v10[93];
  float v15 = v10[94];
  float v16 = v10[95];
  float v17 = v10[96];
  float v18 = v10[97];
  float v19 = v10[98];
  if (*((_DWORD *)this + 71) != 1735095154)
  {
    uint64_t v23 = (uint64_t *)*((void *)this + 3);
    uint64_t v24 = *v23;
    float v20 = 0.0;
    if (*v23)
    {
      int v25 = *((_DWORD *)this + 14);
      float v21 = 0.0;
      float v22 = 0.0;
      if (v24 + 32 * (__int16)v25 == v23[1]) {
        goto LABEL_70;
      }
      float v20 = 0.0;
      float v21 = 0.0;
      float v22 = 0.0;
      if (*(_DWORD *)(*(void *)(v24 + 32 * (__int16)v25 + 8) + 332) != 1) {
        goto LABEL_70;
      }
      goto LABEL_8;
    }
LABEL_24:
    float v21 = 0.0;
    float v22 = 0.0;
    goto LABEL_70;
  }
  if (!*((void *)this + 45))
  {
    float v20 = 0.0;
    goto LABEL_24;
  }
  float v20 = 0.0;
  float v21 = 0.0;
  float v22 = 0.0;
  if (*((_DWORD *)this + 101) != 1) {
    goto LABEL_70;
  }
LABEL_8:
  int v26 = *((_DWORD *)this + 70);
  float v27 = 0.0;
  if (v26) {
    float v28 = 0.0;
  }
  else {
    float v28 = v10[88];
  }
  if (v26) {
    float v29 = 0.0;
  }
  else {
    float v29 = v10[87];
  }
  if (!v26) {
    float v27 = v10[86];
  }
  float v30 = (float)(v15 * v19) - (float)(v16 * v18);
  float v31 = (float)(v16 * v17) - (float)(v14 * v19);
  float v32 = (float)(v14 * v18) - (float)(v15 * v17);
  float v33 = sqrtf((float)((float)(v31 * v31) + (float)(v30 * v30)) + (float)(v32 * v32));
  if (v33 != 0.0)
  {
    float v34 = 1.0 / v33;
    float v30 = v30 * v34;
    float v31 = v31 * v34;
    float v32 = v32 * v34;
  }
  float v35 = *((float *)this + 62) - v28;
  float v36 = *((float *)this + 61) - v29;
  float v37 = *((float *)this + 60) - v27;
  float v38 = sqrtf((float)((float)(v15 * v15) + (float)(v14 * v14)) + (float)(v16 * v16));
  if (v38 != 0.0)
  {
    float v39 = 1.0 / v38;
    float v14 = v14 * v39;
    float v15 = v15 * v39;
    float v16 = v16 * v39;
  }
  float v20 = sqrtf((float)((float)(v36 * v36) + (float)(v37 * v37)) + (float)(v35 * v35));
  float v40 = 0.0;
  float v41 = 0.0;
  float v42 = 0.0;
  float v43 = 0.0;
  float v44 = 0.0;
  float v45 = 0.0;
  if (v20 > 0.0)
  {
    float v81 = v10[89];
    float v82 = v10[91];
    if (v20 == 0.0)
    {
      float v46 = v37;
    }
    else
    {
      float v46 = v37 * (float)(1.0 / v20);
      float v36 = v36 * (float)(1.0 / v20);
      float v35 = v35 * (float)(1.0 / v20);
    }
    float v47 = (float)(v31 * v16) - (float)(v32 * v15);
    float v48 = (float)(v32 * v14) - (float)(v30 * v16);
    float v49 = (float)(v30 * v15) - (float)(v31 * v14);
    float v50 = (float)((float)(v48 * v36) + (float)(v46 * v47)) + (float)(v35 * v49);
    float v51 = v46 - (float)(v50 * v47);
    float v52 = v36 - (float)(v50 * v48);
    float v53 = v35 - (float)(v50 * v49);
    float v54 = sqrtf((float)((float)(v52 * v52) + (float)(v51 * v51)) + (float)(v53 * v53));
    float v79 = v36;
    float v80 = v10[90];
    float v83 = v46;
    float v77 = v47;
    float v78 = v35;
    float v75 = v48;
    float v76 = v49;
    if (v54 != 0.0)
    {
      float v55 = 1.0 / v54;
      float v51 = v51 * v55;
      float v52 = v52 * v55;
      float v53 = v53 * v55;
    }
    float v56 = acosf((float)((float)(v31 * v52) + (float)(v51 * v30)) + (float)(v53 * v32)) * 180.0 / 3.14159265;
    double v57 = fabsf(v56);
    if (v57 >= 1.0e15 || v57 <= 1.0e-15) {
      float v56 = 0.0;
    }
    if ((float)((float)((float)(v15 * v52) + (float)(v51 * v14)) + (float)(v53 * v16)) < 0.0) {
      float v56 = 360.0 - v56;
    }
    if (v56 < 0.0 || v56 > 270.0) {
      float v60 = 450.0;
    }
    else {
      float v60 = 90.0;
    }
    float v21 = v60 - v56;
    float v11 = v81;
    float v13 = v82;
    float v40 = v79;
    float v12 = v80;
    float v41 = v83;
    float v44 = v77;
    float v45 = v78;
    float v43 = v75;
    float v42 = v76;
  }
  if (v41 != 0.0 || v40 != 0.0 || v45 != 0.0)
  {
    float v61 = v12;
    float v62 = v40;
    float v84 = v41;
    float v63 = v45;
    float v64 = acosf((float)((float)(v40 * v43) + (float)(v41 * v44)) + (float)(v45 * v42)) * -180.0 / 3.14159274 + 90.0;
    double v65 = fabsf(v64);
    if (v65 >= 1.0e15 || v65 <= 1.0e-15) {
      float v64 = 0.0;
    }
    if (v64 <= 90.0) {
      float v22 = v64;
    }
    else {
      float v22 = 180.0 - v64;
    }
    if (v22 < -90.0) {
      float v22 = -180.0 - v22;
    }
    float v12 = v61;
    float v40 = v62;
    float v41 = v84;
    float v45 = v63;
  }
  float v67 = v10[84];
  if (v67 > 0.0)
  {
    float v68 = *((float *)this + 63);
    float v69 = *((float *)this + 64);
    float v70 = *((float *)this + 65);
    if (v11 != 0.0 || v12 != 0.0 || v13 != 0.0 || v68 != 0.0 || v69 != 0.0 || v70 != 0.0)
    {
      float v71 = sqrtf((float)((float)(v40 * v40) + (float)(v41 * v41)) + (float)(v45 * v45));
      float v72 = (float)(v10[83]
                  - (float)(v67
                          * fminf((float)-(float)((float)((float)(v12 * v40) + (float)(v41 * v11)) + (float)(v45 * v13))/ v71, v10[83] / v67)))/ (float)(v10[83]- (float)(v67* fminf((float)-(float)((float)((float)(v40 * v69) + (float)(v41 * v68)) + (float)(v45 * v70))/ v71, v10[83] / v67)));
      float v73 = 1.0;
      if (v72 != 0.0)
      {
        double v74 = fabsf(v72);
        float v73 = 16.0;
        if (v74 <= 1.0e15)
        {
          float v73 = 0.125;
          if (v74 >= 1.0e-15)
          {
            float v73 = 16.0;
            if (v72 <= 16.0)
            {
              float v73 = v72;
              if (v72 < 0.125) {
                float v73 = 0.125;
              }
            }
          }
        }
      }
      *a5 = v73;
    }
  }
LABEL_70:
  *a2 = v20;
  *a3 = v21;
  *a4 = v22;
}

uint64_t OALSource::ConeAttenuation(OALSource *this)
{
  float v2 = *((float *)this + 66);
  if (v2 == 0.0 && *((float *)this + 67) == 0.0 && *((float *)this + 68) == 0.0
    || (float v3 = *((float *)this + 72), v3 == 360.0) && *((float *)this + 73) == 360.0)
  {
    if (*((float *)this + 75) != 1.0)
    {
      *((_DWORD *)this + 75) = 1065353216;
      return 1;
    }
    return 0;
  }
  uint64_t v5 = (float *)*((void *)this + 1);
  float v6 = v5[86] - *((float *)this + 60);
  float v7 = v5[87] - *((float *)this + 61);
  float v8 = v5[88] - *((float *)this + 62);
  float v9 = sqrtf((float)((float)(v7 * v7) + (float)(v6 * v6)) + (float)(v8 * v8));
  if (v9 != 0.0)
  {
    float v10 = 1.0 / v9;
    float v6 = v6 * v10;
    float v7 = v7 * v10;
    float v8 = v8 * v10;
  }
  float v11 = *((float *)this + 67);
  float v12 = *((float *)this + 68);
  float v13 = sqrtf((float)((float)(v11 * v11) + (float)(v2 * v2)) + (float)(v12 * v12));
  if (v13 != 0.0)
  {
    float v14 = 1.0 / v13;
    float v2 = v2 * v14;
    float v11 = v11 * v14;
    float v12 = v12 * v14;
  }
  float v15 = acosf((float)((float)(v7 * v11) + (float)(v6 * v2)) + (float)(v8 * v12)) * 180.0 / 3.14159265;
  float v16 = fabsf(v15);
  float v17 = fabsf(v3) * 0.5;
  float v18 = 1.0;
  if (v16 > v17)
  {
    float v19 = fabsf(*((float *)this + 73)) * 0.5;
    if (v16 >= v19)
    {
      float v18 = *((float *)this + 74);
      if (v18 != *((float *)this + 75)) {
        goto LABEL_16;
      }
      return 0;
    }
    float v18 = 1.0
        - (float)((float)(v16 - v17) / (float)(v19 - v17))
        + (float)((float)((float)(v16 - v17) / (float)(v19 - v17)) * *((float *)this + 74));
  }
  if (v18 != *((float *)this + 75))
  {
LABEL_16:
    *((float *)this + 75) = v18;
    return 1;
  }
  return 0;
}

uint64_t OALSource::UpdateBusFormat(OALSource *this)
{
  if (*((_DWORD *)this + 71) == 1735095154)
  {
    float v2 = (char *)this + 376;
    AudioUnitElement v3 = *((_DWORD *)this + 58);
    if (v3 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = (uint64_t *)*((void *)this + 3);
    int v6 = *((_DWORD *)this + 14);
    uint64_t v7 = *v5;
    uint64_t v8 = v5[1];
    if (v7) {
      BOOL v9 = v7 + 32 * (__int16)v6 == v8;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      return 0;
    }
    float v2 = (char *)(*(void *)(v7 + 32 * (__int16)v6 + 8) + 304);
    AudioUnitElement v3 = *((_DWORD *)this + 58);
    if (v3 == -1)
    {
LABEL_3:
      uint64_t result = OALContext::SetBusFormat(*((void *)this + 1), v3, v2);
      if (result) {
        return result;
      }
      goto LABEL_15;
    }
  }
  *((void *)this + 27) = 0;
  *((void *)this + 28) = 0;
  if (!OALContext::SetBusRenderProc(*((AudioUnit **)this + 1), v3, (const AURenderCallbackStruct *)((char *)this + 216)))AUGraphUpdate(*(AUGraph *)(*(void *)(*((void *)this + 1) + 16) + 16), 0); {
  OALContext::SetBusEnable(*((OALContext **)this + 1), *((_DWORD *)this + 58), 1);
  }
  *((unsigned char *)this + 236) = 0;
  uint64_t result = OALContext::SetBusFormat(*((void *)this + 1), *((_DWORD *)this + 58), v2);
  if (!result)
  {
LABEL_15:
    uint64_t result = OALSource::AddRenderProc(this);
    if (!result) {
      *((unsigned char *)this + 18) = 0;
    }
  }
  return result;
}

uint64_t OALSource::SourceInputProc(OALSource *this, void *a2, unsigned int *a3, const AudioTimeStamp *a4, unsigned int a5, AudioBufferList *a6, AudioBufferList *a7)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v7 = OALSource::DoRender(this, a6, a5);
  if (v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    float v10 = "oalSource.cpp";
    __int16 v11 = 1024;
    int v12 = 2649;
    __int16 v13 = 2048;
    uint64_t v14 = (int)v7;
    _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: SourceInputProc FAILED - uint64_t result = %ld", (uint8_t *)&v9, 0x1Cu);
  }
  return v7;
}

uint64_t OALSource::DoRender(OALSource *this, AudioBufferList *a2, unsigned int a3)
{
  uint64_t v140 = *MEMORY[0x263EF8340];
  if (*((_DWORD *)this + 71) == 1735095154)
  {
    uint64_t v6 = *((_DWORD *)this + 100) * a3;
    uint64_t v7 = (int *)((char *)this + 408);
    goto LABEL_53;
  }
  uint64_t v8 = (uint64_t *)*((void *)this + 3);
  int v9 = *((_DWORD *)this + 14);
  uint64_t v10 = *v8;
  uint64_t v11 = v8[1];
  uint64_t v12 = v10 + 32 * (__int16)v9;
  if (v10) {
    BOOL v13 = v12 == v11;
  }
  else {
    BOOL v13 = 1;
  }
  char v14 = v13;
  if (v13)
  {
    uint64_t v15 = (uint64_t *)*((void *)this + 4);
    uint64_t v12 = *v15;
    uint64_t v16 = v15[1];
    if (!v12 || v12 == v16)
    {
      uint64_t v6 = 0;
      goto LABEL_19;
    }
  }
  uint64_t v18 = *(void *)(v12 + 8);
  unsigned int v19 = *(_DWORD *)(v18 + 324);
  if (v19)
  {
    uint64_t v6 = *(_DWORD *)(v18 + 320) * (a3 / v19);
    if (v14) {
      goto LABEL_19;
    }
LABEL_52:
    uint64_t v7 = (int *)(*(void *)(v10 + 32 * (__int16)v9 + 8) + 336);
LABEL_53:
    int v20 = *v7;
    mData = a2->mBuffers[0].mData;
    atomic_fetch_add((atomic_uint *volatile)this + 17, 1u);
    if (*((_DWORD *)this + 16)) {
      goto LABEL_54;
    }
    goto LABEL_20;
  }
  uint64_t v6 = 0;
  if ((v14 & 1) == 0) {
    goto LABEL_52;
  }
LABEL_19:
  int v20 = 0;
  mData = a2->mBuffers[0].mData;
  atomic_fetch_add((atomic_uint *volatile)this + 17, 1u);
  if (*((_DWORD *)this + 16))
  {
LABEL_54:
    if (a2->mNumberBuffers)
    {
      unint64_t v48 = 0;
      p_mData = &a2->mBuffers[0].mData;
      do
      {
        bzero(*p_mData, *((unsigned int *)p_mData - 1));
        ++v48;
        p_mData += 2;
      }
      while (v48 < a2->mNumberBuffers);
    }
    uint64_t result = 0;
    goto LABEL_170;
  }
LABEL_20:
  if (*((unsigned char *)this + 19))
  {
    AudioUnitElement v22 = *((_DWORD *)this + 58);
    if (v22 != -1)
    {
      OSStatus v23 = AudioUnitReset(*(AudioUnit *)(*((void *)this + 1) + 32), 1u, v22);
      if (v23)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v24 = *(unsigned int *)this;
          *(_DWORD *)MixerDistanceParams buf = 136315906;
          *(void *)&uint8_t buf[4] = "oalSource.cpp";
          __int16 v134 = 1024;
          int v135 = 1290;
          __int16 v136 = 2048;
          uint64_t v137 = v24;
          __int16 v138 = 2048;
          uint64_t v139 = v23;
          _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::ResetMixerBus FAILED - OALSource = %ld : uint64_t result = %ld", buf, 0x26u);
        }
      }
    }
    *((unsigned char *)this + 19) = 0;
  }
  if (*((_DWORD *)this + 71) != 1735095154)
  {
    OALSource::UpdateQueue(this, (OALSource *)a2);
    float v29 = (uint64_t *)*((void *)this + 3);
    uint64_t v30 = *v29;
    uint64_t v31 = v29[1];
    int v32 = *((_DWORD *)this + 14);
    uint64_t v33 = *v29 + 32 * (__int16)v32;
    if (*v29) {
      BOOL v34 = v33 == v31;
    }
    else {
      BOOL v34 = 1;
    }
    if (!v34)
    {
      uint64_t v50 = (__int16)v32;
      int v51 = v32 + 1;
      while (!*(_DWORD *)v33 || !*(void *)(*(void *)(v30 + 32 * v50 + 8) + 288))
      {
        *(_DWORD *)(v30 + 32 * v50 + 20) = 2;
        *((_DWORD *)this + 14) = v51;
        uint64_t v50 = (__int16)v51;
        uint64_t v33 = v30 + 32 * (__int16)v51++;
        if (v33 == v31) {
          goto LABEL_37;
        }
      }
LABEL_61:
      if (*((_DWORD *)this + 71) == 1735095154)
      {
        float v52 = (_DWORD *)((char *)this + 400);
        BOOL v53 = 1;
      }
      else
      {
        float v55 = (uint64_t *)*((void *)this + 3);
        uint64_t v56 = *v55;
        uint64_t v57 = v55[1];
        uint64_t v58 = *v55 + ((uint64_t)((unint64_t)*((unsigned int *)this + 14) << 48) >> 43);
        if (v56) {
          BOOL v59 = v58 == v57;
        }
        else {
          BOOL v59 = 1;
        }
        if (v59
          && ((v60 = (uint64_t *)*((void *)this + 4), uint64_t v58 = *v60, v61 = v60[1], v58) ? (v62 = v58 == v61) : (v62 = 1),
              v62)
          || (uint64_t v63 = *(void *)(v58 + 8), (v64 = *(_DWORD *)(v63 + 324)) == 0))
        {
          int v54 = 0;
LABEL_85:
          OALSource::ChangeChannelSettings(this);
          uint64_t v70 = *(void *)(v33 + 8);
          uint64_t v71 = *(unsigned int *)(v33 + 16);
          if (*(_DWORD *)(v70 + 300) - (int)v71 >= v6)
          {
            if (!*((unsigned char *)this + 237))
            {
              int v118 = *((_DWORD *)this + 86);
              if (v118 == -1 || v118 == 1)
              {
                memcpy(mData, (const void *)(*(void *)(v70 + 288) + v71), v6);
                LODWORD(v71) = *(_DWORD *)(v33 + 16);
              }
              else
              {
                a2->mBuffers[0].mData = (void *)(*(void *)(v70 + 288) + v71);
              }
            }
            *(_DWORD *)(v33 + 16) = v71 + v6;
            float v119 = (float)v6;
            if (*((_DWORD *)this + 71) == 1735095154)
            {
              unsigned int v28 = v119 / *((_DWORD *)this + 100);
            }
            else
            {
              unsigned int v28 = 0;
              v120 = (uint64_t *)*((void *)this + 3);
              uint64_t v121 = *v120;
              if (*v120)
              {
                int v122 = *((_DWORD *)this + 14);
                if (v121 + 32 * (__int16)v122 != v120[1])
                {
                  uint64_t v123 = *(void *)(v121 + 32 * (__int16)v122 + 8);
                  unsigned int v28 = *(_DWORD *)(v123 + 324) * (float)(v119 / (float)*(unsigned int *)(v123 + 320));
                }
              }
            }
          }
          else
          {
            unsigned int v28 = 0;
            if (a3)
            {
              v131 = (_DWORD *)((char *)this + 400);
              do
              {
                if (*((unsigned char *)this + 60)) {
                  break;
                }
                float v72 = (uint64_t *)*((void *)this + 3);
                uint64_t v73 = *v72;
                uint64_t v74 = v72[1];
                LODWORD(v75) = *((_DWORD *)this + 14);
                uint64_t v76 = *v72 + 32 * (__int16)v75;
                if (*v72) {
                  BOOL v77 = v76 == v74;
                }
                else {
                  BOOL v77 = 1;
                }
                if (v77)
                {
LABEL_147:
                  *((unsigned char *)this + 60) = 1;
                  OALContext::SetBusNeedsPostRender(*((void *)this + 1), *((_DWORD *)this + 58), 1);
                  break;
                }
                uint64_t v78 = (__int16)v75;
                while (!*(_DWORD *)v76 || !*(void *)(*(void *)(v73 + 32 * v78 + 8) + 288))
                {
                  *(_DWORD *)(v73 + 32 * v78 + 20) = 2;
                  LODWORD(v75) = v75 + 1;
                  *((_DWORD *)this + 14) = v75;
                  uint64_t v78 = (__int16)v75;
                  uint64_t v76 = v73 + 32 * (__int16)v75;
                  if (v76 == v74) {
                    goto LABEL_147;
                  }
                }
                *(_DWORD *)(v76 + 20) = 1;
                int v79 = *((_DWORD *)this + 71);
                float v80 = (_DWORD *)((char *)this + 400);
                int v81 = v28;
                if (v79 != 1735095154)
                {
                  uint64_t v82 = v73 + 32 * (__int16)v75;
                  if (v82 == v74
                    && ((v83 = (uint64_t *)*((void *)this + 4), uint64_t v82 = *v83, v84 = v83[1], v82)
                      ? (BOOL v85 = v82 == v84)
                      : (BOOL v85 = 1),
                        v85)
                    || (uint64_t v86 = *(void *)(v82 + 8), (v87 = *(_DWORD *)(v86 + 324)) == 0))
                  {
                    uint64_t v75 = (__int16)v75;
                    int v88 = (char *)a2->mBuffers[0].mData;
                    uint64_t v97 = *(void *)(v76 + 8);
                    uint64_t v90 = v76 + 8;
                    uint64_t v89 = v97;
                    int v93 = (unsigned int *)(v90 + 8);
                    unsigned int v92 = *(_DWORD *)(v90 + 8);
                    float v94 = (float)(*(_DWORD *)(v97 + 300) - v92);
                    goto LABEL_111;
                  }
                  float v80 = (_DWORD *)(v86 + 320);
                  int v81 = v28 / v87;
                }
                int v88 = (char *)a2->mBuffers[0].mData + (*v80 * v81);
                uint64_t v91 = *(void *)(v76 + 8);
                uint64_t v90 = v76 + 8;
                uint64_t v89 = v91;
                int v93 = (unsigned int *)(v90 + 8);
                unsigned int v92 = *(_DWORD *)(v90 + 8);
                float v94 = (float)(*(_DWORD *)(v91 + 300) - v92);
                if (v79 == 1735095154)
                {
                  unsigned int v95 = v94 / *v131;
                  if (v95 >= a3 - v28) {
                    unsigned int v95 = a3 - v28;
                  }
                  unsigned int v130 = v95;
                  unsigned int v96 = *v131 * v95;
                  goto LABEL_120;
                }
                uint64_t v75 = (__int16)v75;
LABEL_111:
                uint64_t v98 = v73 + 32 * v75;
                if (v98 == v74)
                {
                  unsigned int v130 = 0;
                  int v100 = (uint64_t *)*((void *)this + 4);
                  uint64_t v98 = *v100;
                  if (!*v100 || v98 == v100[1])
                  {
                    unsigned int v96 = 0;
                    goto LABEL_120;
                  }
                }
                else
                {
                  unsigned int v99 = *(_DWORD *)(*(void *)(v98 + 8) + 324)
                      * (float)(v94 / (float)*(unsigned int *)(*(void *)(v98 + 8) + 320));
                  if (v99 >= a3 - v28) {
                    unsigned int v99 = a3 - v28;
                  }
                  unsigned int v130 = v99;
                }
                uint64_t v101 = *(void *)(v98 + 8);
                unsigned int v96 = *(_DWORD *)(v101 + 324);
                if (v96) {
                  unsigned int v96 = *(_DWORD *)(v101 + 320) * (v130 / v96);
                }
LABEL_120:
                if (!*((unsigned char *)this + 237))
                {
                  v129 = v93;
                  unsigned int v128 = v96;
                  memcpy(v88, (const void *)(*(void *)(v89 + 288) + v92), v96);
                  unsigned int v96 = v128;
                  int v93 = v129;
                  unsigned int v92 = *v129;
                  uint64_t v89 = *(void *)v90;
                  int v79 = *((_DWORD *)this + 71);
                }
                unsigned int v102 = v92 + v96;
                *int v93 = v102;
                int v103 = *(_DWORD *)(v89 + 300);
                if (v79 == 1735095154)
                {
                  BOOL v104 = 1;
                  int v105 = (_DWORD *)((char *)this + 400);
                  goto LABEL_130;
                }
                int v106 = (void *)*((void *)this + 3);
                if (*v106
                  && (uint64_t v107 = *v106 + ((uint64_t)((unint64_t)*((unsigned int *)this + 14) << 48) >> 43),
                      v107 != v106[1])
                  || (v108 = (uint64_t *)*((void *)this + 4), (uint64_t v107 = *v108) != 0) && v107 != v108[1])
                {
                  uint64_t v109 = *(void *)(v107 + 8);
                  int v110 = *(_DWORD *)(v109 + 324);
                  if (v110)
                  {
                    BOOL v104 = v110 == 1;
                    int v105 = (_DWORD *)(v109 + 320);
LABEL_130:
                    if (v103 - v102 < *v105 * v104)
                    {
                      int v111 = *((_DWORD *)this + 14);
                      LOWORD(v112) = v111 + 1;
                      *((_DWORD *)this + 14) = v111 + 1;
                      int v113 = (uint64_t *)*((void *)this + 3);
                      uint64_t v114 = *v113;
                      if (!*v113
                        || (int v115 = (_DWORD *)v113[1], v116 = (_DWORD *)(v114 + 32 * (__int16)v112), v116 == v115))
                      {
LABEL_138:
                        if (*((_DWORD *)this + 69) == 1)
                        {
                          OALSource::LoopToBeginning(this, v69);
                        }
                        else
                        {
                          *((unsigned char *)this + 60) = 1;
                          OALContext::SetBusNeedsPostRender(*((void *)this + 1), *((_DWORD *)this + 58), 1);
                        }
                      }
                      else
                      {
                        uint64_t v112 = (__int16)v112;
                        int v117 = v111 + 2;
                        while (!*v116 || !*(void *)(*(void *)(v114 + 32 * v112 + 8) + 288))
                        {
                          *(_DWORD *)(v114 + 32 * v112 + 20) = 2;
                          *((_DWORD *)this + 14) = v117;
                          uint64_t v112 = (__int16)v117;
                          int v116 = (_DWORD *)(v114 + 32 * (__int16)v117++);
                          if (v116 == v115) {
                            goto LABEL_138;
                          }
                        }
                      }
                    }
                  }
                }
                v28 += v130;
              }
              while (v28 < a3);
            }
          }
LABEL_154:
          if (*((unsigned char *)this + 237)) {
            BOOL v124 = 1;
          }
          else {
            BOOL v124 = v28 >= a3;
          }
          if (!v124)
          {
            if (v20 == 8) {
              int v125 = -128;
            }
            else {
              int v125 = 0;
            }
            memset((char *)a2->mBuffers[0].mData + v28 * v54, v125, v6 - v28 * v54);
          }
          int v126 = *((_DWORD *)this + 86);
          if (v126 == -1)
          {
            int v127 = 1;
          }
          else
          {
            if (v126 != 1) {
              goto LABEL_167;
            }
            int v127 = 0;
          }
          OALSource::Ramp((uint64_t)this, a2, v127);
          *((_DWORD *)this + 86) = -2;
LABEL_167:
          if (*((unsigned char *)this + 237)) {
            uint64_t result = 1397312581;
          }
          else {
            uint64_t result = 0;
          }
          goto LABEL_170;
        }
        BOOL v53 = v64 == 1;
        float v52 = (_DWORD *)(v63 + 320);
      }
      int v54 = *v52 * v53;
      goto LABEL_85;
    }
LABEL_37:
    if (*((_DWORD *)this + 69))
    {
      uint64_t v35 = *((void *)this + 4);
      *((void *)this + 3) = v35;
      *((void *)this + 4) = v29;
      uint64_t v37 = *(void *)v35;
      uint64_t v36 = *(void *)(v35 + 8);
      unint64_t v38 = v31 - v30;
      unint64_t v39 = v36 - *(void *)v35;
      BOOL v13 = v36 == *(void *)v35;
      *(_DWORD *)(v35 + 24) = v39 >> 5;
      *((_DWORD *)v29 + 6) = v38 >> 5;
      *((_DWORD *)this + 12) = *((_DWORD *)v29 + 6) + *(_DWORD *)(v35 + 24);
      if (v13)
      {
        int v54 = 0;
        unsigned int v28 = 0;
        *((_DWORD *)this + 14) = 0;
        *((unsigned char *)this + 60) = 0;
        goto LABEL_154;
      }
      unint64_t v40 = v39 - 32;
      uint64_t v41 = v37;
      if (v40 < 0x20) {
        goto LABEL_173;
      }
      uint64_t v42 = (v40 >> 5) + 1;
      uint64_t v41 = v37 + 32 * (v42 & 0xFFFFFFFFFFFFFFELL);
      float v43 = (void *)(v37 + 48);
      uint64_t v44 = v42 & 0xFFFFFFFFFFFFFFELL;
      do
      {
        *(v43 - 4) = 0;
        *float v43 = 0;
        v43 += 8;
        v44 -= 2;
      }
      while (v44);
      if (v42 != (v42 & 0xFFFFFFFFFFFFFFELL))
      {
LABEL_173:
        do
        {
          *(void *)(v41 + 16) = 0;
          v41 += 32;
        }
        while (v41 != v36);
      }
      *((_DWORD *)this + 14) = 0;
      *((unsigned char *)this + 60) = 0;
      if (v37)
      {
        uint64_t v45 = 0;
        int v46 = 1;
        uint64_t v33 = v37;
        while (!*(_DWORD *)v33 || !*(void *)(*(void *)(v37 + 32 * v45 + 8) + 288))
        {
          *(_DWORD *)(v37 + 32 * v45 + 20) = 2;
          *((_DWORD *)this + 14) = v46;
          uint64_t v45 = (__int16)v46;
          uint64_t v33 = v37 + 32 * (__int16)v46++;
          if (v33 == v36) {
            goto LABEL_65;
          }
        }
        float v47 = (SourceNotifications *)*((void *)this + 52);
        if (v47) {
          SourceNotifications::CallSourceNotifications(v47, 36864);
        }
        goto LABEL_61;
      }
    }
    else
    {
      *((unsigned char *)this + 60) = 1;
      OALContext::SetBusNeedsPostRender(*((void *)this + 1), *((_DWORD *)this + 58), 1);
    }
LABEL_65:
    int v54 = 0;
    unsigned int v28 = 0;
    goto LABEL_154;
  }
  int v25 = (uint64_t (*)(void, uint64_t, unsigned char *, int *, void))*((void *)this + 45);
  if (!v25)
  {
    uint64_t result = 1397312581;
    goto LABEL_170;
  }
  *(void *)MixerDistanceParams buf = mData;
  int v132 = v6;
  uint64_t result = v25(*(unsigned int *)this, v6, buf, &v132, *((void *)this + 46));
  if (!result)
  {
    float v27 = (float)v132;
    if (*((_DWORD *)this + 71) == 1735095154)
    {
      unsigned int v28 = v27 / *((_DWORD *)this + 100);
      if (v28 <= a3)
      {
LABEL_83:
        OALSource::ChangeChannelSettings(this);
        int v54 = 0;
        goto LABEL_154;
      }
    }
    else
    {
      unsigned int v28 = 0;
      double v65 = (uint64_t *)*((void *)this + 3);
      uint64_t v66 = *v65;
      if (!*v65) {
        goto LABEL_83;
      }
      int v67 = *((_DWORD *)this + 14);
      if (v66 + 32 * (__int16)v67 == v65[1]) {
        goto LABEL_83;
      }
      uint64_t v68 = *(void *)(v66 + 32 * (__int16)v67 + 8);
      unsigned int v28 = *(_DWORD *)(v68 + 324) * (float)(v27 / (float)*(unsigned int *)(v68 + 320));
      if (v28 <= a3) {
        goto LABEL_83;
      }
    }
    uint64_t result = 4294967246;
  }
LABEL_170:
  atomic_fetch_add((atomic_uint *volatile)this + 17, 0xFFFFFFFF);
  return result;
}

void sub_221556D38(_Unwind_Exception *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 68), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

void sub_221556D48(_Unwind_Exception *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 68), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

void sub_221556D58(_Unwind_Exception *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 68), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

void sub_221556D68(_Unwind_Exception *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 68), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

void sub_221556D78(_Unwind_Exception *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 68), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

uint64_t OALSource::Ramp(uint64_t this, AudioBufferList *a2, int a3)
{
  int v3 = *(_DWORD *)(this + 284);
  if (v3 == 1735095154)
  {
    int v4 = *(_DWORD *)(this + 408);
    if (v4 != 8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(uint64_t **)(this + 24);
    int v9 = *(_DWORD *)(this + 56);
    uint64_t v10 = *v8;
    uint64_t v11 = v8[1];
    if (v10) {
      BOOL v12 = v10 + 32 * (__int16)v9 == v11;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12) {
      return this;
    }
    int v4 = *(_DWORD *)(*(void *)(v10 + 32 * (__int16)v9 + 8) + 336);
    if (v4 != 8)
    {
LABEL_3:
      if (v4 != 16) {
        return this;
      }
      uint64_t mNumberChannels = a2->mBuffers[0].mNumberChannels;
      UInt32 v6 = a2->mBuffers[0].mDataByteSize >> 1;
      if (v3 == 1735095154)
      {
        uint64_t v7 = (double *)(this + 376);
      }
      else
      {
        float v17 = *(uint64_t **)(this + 24);
        uint64_t v18 = *v17;
        double v19 = 0.0;
        if (!*v17) {
          goto LABEL_17;
        }
        int v20 = *(_DWORD *)(this + 56);
        if (v18 + 32 * (__int16)v20 == v17[1]) {
          goto LABEL_17;
        }
        uint64_t v7 = (double *)(*(void *)(v18 + 32 * (__int16)v20 + 8) + 304);
      }
      double v19 = *v7 * 0.00579999993;
LABEL_17:
      unsigned int v21 = vcvtmd_u64_f64(v19);
      if (v6 / mNumberChannels < v21) {
        unsigned int v21 = v6 / mNumberChannels;
      }
      float v22 = 1.0;
      if (a3) {
        float v22 = -1.0;
      }
      if (v21) {
        BOOL v23 = mNumberChannels == 0;
      }
      else {
        BOOL v23 = 1;
      }
      if (!v23)
      {
        __int16 v24 = vcvtd_n_s64_f64((float)(v22 / (float)v21), 0xFuLL);
        uint64_t v25 = v6 - v21 * mNumberChannels;
        if (!a3) {
          uint64_t v25 = 0;
        }
        int v26 = (int16x4_t *)((char *)a2->mBuffers[0].mData + 2 * v25);
        if (mNumberChannels >= 0x10)
        {
          int v43 = 0;
          __int16 v44 = 0;
          do
          {
            uint64_t v45 = v26 + 2;
            int v26 = (int16x4_t *)((char *)v26 + 2 * (mNumberChannels & 0xFFFFFFF0));
            this = mNumberChannels & 0xFFFFFFF0;
            do
            {
              int16x8_t v46 = vdupq_n_s16(v44);
              int16x8_t v47 = vshrn_high_n_s32(vshrn_n_s32(vmull_s16(*(int16x4_t *)v46.i8, *v45), 0xFuLL), vmull_high_s16(v46, *(int16x8_t *)v45->i8), 0xFuLL);
              *(int16x8_t *)v45[-2].i8 = vshrn_high_n_s32(vshrn_n_s32(vmull_s16(*(int16x4_t *)v46.i8, v45[-2]), 0xFuLL), vmull_high_s16(v46, *(int16x8_t *)v45[-2].i8), 0xFuLL);
              *(int16x8_t *)v45->i8 = v47;
              v45 += 4;
              this -= 16;
            }
            while (this);
            if ((mNumberChannels & 0xFFFFFFF0) != mNumberChannels)
            {
              int v48 = mNumberChannels - (mNumberChannels & 0xFFFFFFF0);
              do
              {
                this = (v26->i16[0] * v44) >> 15;
                v26->i16[0] = this;
                int v26 = (int16x4_t *)((char *)v26 + 2);
                --v48;
              }
              while (v48);
            }
            v44 += v24;
            ++v43;
          }
          while (v43 != v21);
        }
        else
        {
          int v27 = 0;
          __int16 v28 = 0;
          do
          {
            int v29 = mNumberChannels;
            do
            {
              v26->i16[0] = (v26->i16[0] * v28) >> 15;
              int v26 = (int16x4_t *)((char *)v26 + 2);
              --v29;
            }
            while (v29);
            v28 += v24;
            ++v27;
          }
          while (v27 != v21);
        }
      }
      return this;
    }
  }
  uint64_t v14 = a2->mBuffers[0].mNumberChannels;
  UInt32 mDataByteSize = a2->mBuffers[0].mDataByteSize;
  unsigned int v15 = mDataByteSize / v14;
  if (v3 == 1735095154)
  {
    uint64_t v16 = (double *)(this + 376);
  }
  else
  {
    uint64_t v30 = *(uint64_t **)(this + 24);
    uint64_t v31 = *v30;
    double v32 = 0.0;
    if (!*v30) {
      goto LABEL_37;
    }
    int v33 = *(_DWORD *)(this + 56);
    if (v31 + 32 * (__int16)v33 == v30[1]) {
      goto LABEL_37;
    }
    uint64_t v16 = (double *)(*(void *)(v31 + 32 * (__int16)v33 + 8) + 304);
  }
  double v32 = *v16 * 0.00579999993;
LABEL_37:
  unsigned int v34 = vcvtmd_u64_f64(v32);
  if (v15 >= v34) {
    unsigned int v15 = v34;
  }
  float v35 = 1.0;
  if (a3) {
    float v35 = -1.0;
  }
  if (v15) {
    BOOL v36 = v14 == 0;
  }
  else {
    BOOL v36 = 1;
  }
  if (!v36)
  {
    __int16 v37 = vcvtd_n_s64_f64((float)(v35 / (float)v15), 0xFuLL);
    uint64_t v38 = mDataByteSize - v15 * v14;
    if (!a3) {
      uint64_t v38 = 0;
    }
    unint64_t v39 = (int8x16_t *)((char *)a2->mBuffers[0].mData + v38);
    if (v14 > 0xF)
    {
      uint64_t v49 = v14 & 0xFFFFFFF0;
      if (v49 == v14)
      {
        int v50 = 0;
        __int16 v51 = 0;
        v52.i64[0] = 0x8080808080808080;
        v52.i64[1] = 0x8080808080808080;
        do
        {
          unint64_t v53 = 0;
          do
          {
            int8x16_t v54 = veorq_s8(v39[v53 / 0x10], v52);
            int16x8_t v55 = vmovl_high_s8(v54);
            int16x8_t v56 = vmovl_s8(*(int8x8_t *)v54.i8);
            int16x8_t v57 = vdupq_n_s16(v51);
            v69.val[3] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_high_s16(v57, v55), 0xFuLL);
            v69.val[2] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_s16(*(int16x4_t *)v57.i8, *(int16x4_t *)v55.i8), 0xFuLL);
            v69.val[1] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_high_s16(v57, v56), 0xFuLL);
            v69.val[0] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_s16(*(int16x4_t *)v57.i8, *(int16x4_t *)v56.i8), 0xFuLL);
            v39[v53 / 0x10] = veorq_s8(vqtbl4q_s8(v69, (int8x16_t)xmmword_22155D0D0), v52);
            v53 += 16;
          }
          while (v49 != v53);
          v51 += v37;
          ++v50;
          unint64_t v39 = (int8x16_t *)((char *)v39 + v49);
        }
        while (v50 != v15);
      }
      else
      {
        int v58 = 0;
        __int16 v59 = 0;
        int v60 = v14 - v49;
        v61.i64[0] = 0x8080808080808080;
        v61.i64[1] = 0x8080808080808080;
        do
        {
          BOOL v62 = v39;
          unint64_t v39 = (int8x16_t *)((char *)v39 + v49);
          uint64_t v63 = v49;
          do
          {
            int8x16_t v64 = veorq_s8(*v62, v61);
            int16x8_t v65 = vmovl_high_s8(v64);
            int16x8_t v66 = vmovl_s8(*(int8x8_t *)v64.i8);
            int16x8_t v67 = vdupq_n_s16(v59);
            v70.val[3] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_high_s16(v67, v65), 0xFuLL);
            v70.val[2] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_s16(*(int16x4_t *)v67.i8, *(int16x4_t *)v65.i8), 0xFuLL);
            v70.val[1] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_high_s16(v67, v66), 0xFuLL);
            v70.val[0] = (int8x16_t)vshrq_n_u32((uint32x4_t)vmull_s16(*(int16x4_t *)v67.i8, *(int16x4_t *)v66.i8), 0xFuLL);
            *v62++ = veorq_s8(vqtbl4q_s8(v70, (int8x16_t)xmmword_22155D0D0), v61);
            v63 -= 16;
          }
          while (v63);
          int v68 = v60;
          do
          {
            v39->i8[0] = (((v39->i8[0] ^ 0x7FFF80u) * v59) >> 15) ^ 0x80;
            unint64_t v39 = (int8x16_t *)((char *)v39 + 1);
            --v68;
          }
          while (v68);
          v59 += v37;
          ++v58;
        }
        while (v58 != v15);
      }
    }
    else
    {
      int v40 = 0;
      __int16 v41 = 0;
      do
      {
        int v42 = v14;
        do
        {
          v39->i8[0] = (((v39->i8[0] ^ 0x7FFF80u) * v41) >> 15) ^ 0x80;
          unint64_t v39 = (int8x16_t *)((char *)v39 + 1);
          --v42;
        }
        while (v42);
        v41 += v37;
        ++v40;
      }
      while (v40 != v15);
    }
  }
  return this;
}

uint64_t OALSource::DoPostRender(OALSource *this)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  float v2 = (OALSource *)*((unsigned int *)this + 58);
  atomic_fetch_add((atomic_uint *volatile)this + 17, 1u);
  if (*((_DWORD *)this + 16))
  {
    uint64_t v3 = 0;
    goto LABEL_108;
  }
  if (*((_DWORD *)this + 86) != -2)
  {
LABEL_81:
    if (*((unsigned char *)this + 60))
    {
      __int16 v41 = (OALSource *)*((unsigned int *)this + 58);
      if (v41 != -1)
      {
        *((void *)this + 27) = 0;
        *((void *)this + 28) = 0;
        if (!OALContext::SetBusRenderProc(*((AudioUnit **)this + 1), (AudioUnitElement)v41, (const AURenderCallbackStruct *)((char *)this + 216)))AUGraphUpdate(*(AUGraph *)(*(void *)(*((void *)this + 1) + 16) + 16), 0); {
        OALContext::SetBusEnable(*((OALContext **)this + 1), *((_DWORD *)this + 58), 1);
        }
        *((unsigned char *)this + 236) = 0;
        __int16 v41 = (OALSource *)*((unsigned int *)this + 58);
        if (v41 != -1)
        {
          OALContext::SetBusAsAvailable(*((void *)this + 1), v41);
          *((_DWORD *)this + 58) = -1;
        }
      }
      *((_DWORD *)this + 76) = 4116;
      int v42 = (SourceNotifications *)*((void *)this + 52);
      if (v42) {
        SourceNotifications::CallSourceNotifications(v42, 4112);
      }
      int v43 = (uint64_t *)*((void *)this + 3);
      int v44 = *((_DWORD *)v43 + 6);
      if (v44)
      {
        do
        {
          uint64_t v47 = *v43;
          uint64_t v46 = v43[1];
          BOOL v48 = v47 == v46;
          if (v47 == v46) {
            uint64_t v49 = 0;
          }
          else {
            uint64_t v49 = v47;
          }
          if (!v48) {
            *(_DWORD *)(v47 + 20) = 2;
          }
          BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), v41, *(_DWORD *)v49, *(OALBuffer **)(v49 + 8), *(_DWORD *)(v49 + 24));
          int v50 = (char **)*((void *)this + 3);
          int8x16_t v52 = *v50;
          __int16 v51 = v50[1];
          if (*v50 == v51)
          {
            uint64_t v45 = *v50;
          }
          else
          {
            __int16 v41 = (OALSource *)(v52 + 32);
            int64_t v53 = v51 - (v52 + 32);
            if (v51 != v52 + 32) {
              memmove(*v50, v41, v51 - (v52 + 32));
            }
            int8x16_t v54 = *v50;
            uint64_t v45 = &v52[v53];
            v50[1] = &v52[v53];
            int8x16_t v52 = v54;
          }
          *((_DWORD *)v50 + 6) = (unint64_t)(v45 - v52) >> 5;
          int v43 = (uint64_t *)*((void *)this + 3);
          *((_DWORD *)this + 12) = *(_DWORD *)(*((void *)this + 4) + 24) + *((_DWORD *)v43 + 6);
        }
        while (*((_DWORD *)v43 + 6));
      }
      *((_DWORD *)this + 14) = 0;
      *((unsigned char *)this + 60) = 0;
      if (v44)
      {
        int16x8_t v55 = (SourceNotifications *)*((void *)this + 52);
        if (v55) {
          SourceNotifications::CallSourceNotifications(v55, 4118);
        }
      }
    }
    if (!*((void *)this + 53)) {
      OALContext::SetBusNeedsPostRender(*((void *)this + 1), *((_DWORD *)this + 58), 0);
    }
    uint64_t v3 = 0;
    goto LABEL_108;
  }
  do
  {
    int v4 = (void *)*((void *)this + 53);
    if (!v4) {
      goto LABEL_81;
    }
    uint64_t v5 = (void *)*((void *)this + 53);
    atomic_compare_exchange_strong((atomic_ullong *volatile)this + 53, (unint64_t *)&v5, 0);
  }
  while (v5 != v4);
  UInt32 v6 = 0;
  do
  {
    uint64_t v7 = v6;
    UInt32 v6 = v4;
    int v4 = (void *)*v4;
    void *v6 = v7;
  }
  while (v4);
  char v8 = 0;
  int v9 = (void *)((char *)this + 216);
  while (2)
  {
    switch(*((_DWORD *)v6 + 2))
    {
      case 1:
        if (*((_DWORD *)this + 76) != 4116)
        {
          uint64_t v11 = (OALSource *)*((unsigned int *)this + 58);
          if (v11 != -1)
          {
            void *v9 = 0;
            *((void *)this + 28) = 0;
            if (!OALContext::SetBusRenderProc(*((AudioUnit **)this + 1), (AudioUnitElement)v11, (const AURenderCallbackStruct *)((char *)this + 216)))AUGraphUpdate(*(AUGraph *)(*(void *)(*((void *)this + 1) + 16) + 16), 0); {
            OALContext::SetBusEnable(*((OALContext **)this + 1), *((_DWORD *)this + 58), 1);
            }
            *((unsigned char *)this + 236) = 0;
            uint64_t v11 = (OALSource *)*((unsigned int *)this + 58);
            if (v11 != -1)
            {
              OALContext::SetBusAsAvailable(*((void *)this + 1), v11);
              *((_DWORD *)this + 58) = -1;
            }
          }
          *((_DWORD *)this + 76) = 4116;
          BOOL v12 = (SourceNotifications *)*((void *)this + 52);
          if (v12) {
            SourceNotifications::CallSourceNotifications(v12, 4112);
          }
          BOOL v13 = (uint64_t *)*((void *)this + 3);
          int v14 = *((_DWORD *)v13 + 6);
          while (*((_DWORD *)v13 + 6))
          {
            uint64_t v17 = *v13;
            uint64_t v16 = v13[1];
            BOOL v18 = v17 == v16;
            if (v17 == v16) {
              uint64_t v19 = 0;
            }
            else {
              uint64_t v19 = v17;
            }
            if (!v18) {
              *(_DWORD *)(v17 + 20) = 2;
            }
            BufferQueue::AppendBuffer(*((BufferQueue **)this + 4), v11, *(_DWORD *)v19, *(OALBuffer **)(v19 + 8), *(_DWORD *)(v19 + 24));
            int v20 = (char **)*((void *)this + 3);
            float v22 = *v20;
            unsigned int v21 = v20[1];
            if (*v20 == v21)
            {
              unsigned int v15 = *v20;
            }
            else
            {
              uint64_t v11 = (OALSource *)(v22 + 32);
              int64_t v23 = v21 - (v22 + 32);
              if (v21 != v22 + 32) {
                memmove(*v20, v11, v21 - (v22 + 32));
              }
              __int16 v24 = *v20;
              unsigned int v15 = &v22[v23];
              v20[1] = &v22[v23];
              float v22 = v24;
            }
            *((_DWORD *)v20 + 6) = (unint64_t)(v15 - v22) >> 5;
            BOOL v13 = (uint64_t *)*((void *)this + 3);
            *((_DWORD *)this + 12) = *(_DWORD *)(*((void *)this + 4) + 24) + *((_DWORD *)v13 + 6);
          }
          *((_DWORD *)this + 14) = 0;
          *((unsigned char *)this + 60) = 0;
          if (v14)
          {
            uint64_t v38 = (SourceNotifications *)*((void *)this + 52);
            if (v38) {
              SourceNotifications::CallSourceNotifications(v38, 4118);
            }
          }
        }
        goto LABEL_10;
      case 2:
        if (*((_DWORD *)this + 76) != 4113)
        {
          AudioUnitElement v25 = *((_DWORD *)this + 58);
          if (v25 != -1)
          {
            void *v9 = 0;
            *((void *)this + 28) = 0;
            if (!OALContext::SetBusRenderProc(*((AudioUnit **)this + 1), v25, (const AURenderCallbackStruct *)((char *)this + 216)))AUGraphUpdate(*(AUGraph *)(*(void *)(*((void *)this + 1) + 16) + 16), 0); {
            OALContext::SetBusEnable(*((OALContext **)this + 1), *((_DWORD *)this + 58), 1);
            }
            *((unsigned char *)this + 236) = 0;
            unsigned int v26 = *((_DWORD *)this + 58);
            if (v26 != -1)
            {
              OALContext::SetBusAsAvailable(*((void *)this + 1), v26);
              *((_DWORD *)this + 58) = -1;
            }
          }
          *((_DWORD *)this + 76) = 4113;
          int v27 = (SourceNotifications *)*((void *)this + 52);
          if (v27) {
            SourceNotifications::CallSourceNotifications(v27, 4112);
          }
          *((unsigned char *)this + 60) = 0;
        }
        goto LABEL_10;
      case 3:
        __int16 v28 = (OALBuffer *)v6[2];
        int v29 = *(_DWORD *)v28;
        OALSource::FlushBufferQueue(this);
        if (!v29)
        {
          *((_DWORD *)this + 71) = 4144;
          *((unsigned char *)this + 352) = 0;
          *(unsigned char *)(v6[2] + 352) = 0;
          *((_DWORD *)this + 76) = 4116;
          double v32 = (SourceNotifications *)*((void *)this + 52);
          if (!v32) {
            goto LABEL_10;
          }
LABEL_75:
          SourceNotifications::CallSourceNotifications(v32, 4112);
          goto LABEL_10;
        }
        uint64_t v31 = (BufferQueue *)*((void *)this + 3);
        if (*(void *)v31 == *((void *)v31 + 1))
        {
          *((_DWORD *)this + 14) = 0;
          *((unsigned char *)this + 60) = 0;
        }
        BufferQueue::AppendBuffer(v31, v30, v29, v28, 0);
        *((_DWORD *)this + 12) = *(_DWORD *)(*((void *)this + 4) + 24) + *(_DWORD *)(*((void *)this + 3) + 24);
        OALBuffer::UseThisBuffer(v28, this);
        *((_DWORD *)this + 71) = 4136;
        *(unsigned char *)(v6[2] + 352) = 0;
        *((_DWORD *)this + 76) = 4116;
        double v32 = (SourceNotifications *)*((void *)this + 52);
        if (v32) {
          goto LABEL_75;
        }
LABEL_10:
        *((_DWORD *)this + 86) = 0;
        goto LABEL_11;
      case 4:
        *((_DWORD *)this + 86) = 0;
        uint64_t v3 = OALSource::Play(this);
        if (v3) {
          goto LABEL_76;
        }
        goto LABEL_11;
      case 5:
        *((_DWORD *)this + 76) = 4115;
        unsigned int v34 = (SourceNotifications *)*((void *)this + 52);
        if (v34) {
          SourceNotifications::CallSourceNotifications(v34, 4112);
        }
        AudioUnitElement v35 = *((_DWORD *)this + 58);
        if (v35 != -1)
        {
          void *v9 = 0;
          *((void *)this + 28) = 0;
          if (!OALContext::SetBusRenderProc(*((AudioUnit **)this + 1), v35, (const AURenderCallbackStruct *)((char *)this + 216)))AUGraphUpdate(*(AUGraph *)(*(void *)(*((void *)this + 1) + 16) + 16), 0); {
          OALContext::SetBusEnable(*((OALContext **)this + 1), *((_DWORD *)this + 58), 1);
          }
          *((unsigned char *)this + 236) = 0;
        }
        *((_DWORD *)this + 86) = 0;
        char v8 = 1;
        goto LABEL_11;
      case 6:
        *((_DWORD *)this + 86) = 1;
        uint64_t v3 = OALSource::AddRenderProc(this);
        if (v3) {
          goto LABEL_76;
        }
        *((_DWORD *)this + 76) = 4114;
        int v33 = (SourceNotifications *)*((void *)this + 52);
        if (v33) {
          SourceNotifications::CallSourceNotifications(v33, 4112);
        }
        goto LABEL_11;
      case 7:
        OALSource::LoopToBeginning(this, v2);
        uint64_t v3 = OALSource::AdvanceQueueToFrameIndex(this, *((_DWORD *)this + 89));
        if (!v3)
        {
          OALContext::SetBusEnable(*((OALContext **)this + 1), *((_DWORD *)this + 58), 1);
          *((_DWORD *)this + 89) = 0;
          *((_DWORD *)this + 86) = 1;
LABEL_11:
          uint64_t v10 = (void *)*v6;
          MEMORY[0x223C843A0](v6, 0x1020C40CC5CF236);
          UInt32 v6 = v10;
          if (!v10) {
            goto LABEL_81;
          }
          continue;
        }
LABEL_76:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v39 = *(unsigned int *)this;
          *(_DWORD *)MixerDistanceParams buf = 136315906;
          int v58 = "oalSource.cpp";
          __int16 v59 = 1024;
          int v60 = 3108;
          __int16 v61 = 2048;
          uint64_t v62 = v39;
          __int16 v63 = 2048;
          uint64_t v64 = (int)v3;
          _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALSource::DoPostRender FAILED - OALSource = %ld : uint64_t result = %ld", buf, 0x26u);
        }
LABEL_108:
        atomic_fetch_add((atomic_uint *volatile)this + 17, 0xFFFFFFFF);
        return v3;
      case 8:
        OALSource::PostRenderRemoveBuffersFromQueue(this, (OALSource *)*((unsigned int *)v6 + 6));
        goto LABEL_10;
      case 9:
        OALSource::StopRenderingToBus((uint64_t)this);
        *((_DWORD *)this + 76) = 4116;
        int v40 = (SourceNotifications *)*((void *)this + 52);
        if (v40) {
          SourceNotifications::CallSourceNotifications(v40, 4112);
        }
        OALSource::FlushBufferQueue(this);
        *((unsigned char *)this + 4) = 1;
        OALSource::ClearMessageQueue(this);
        *((_DWORD *)this + 86) = 0;
        goto LABEL_81;
      case 0xB:
        OALSource::LoopToBeginning(this, v2);
        OALContext::SetBusEnable(*((OALContext **)this + 1), *((_DWORD *)this + 58), 1);
        if ((v8 & 1) != 0 && OALSource::AddRenderProc(this))
        {
          char v8 = 1;
        }
        else
        {
          *((_DWORD *)this + 76) = 4114;
          __int16 v37 = (SourceNotifications *)*((void *)this + 52);
          if (v37) {
            SourceNotifications::CallSourceNotifications(v37, 4112);
          }
          char v8 = 0;
          *((_DWORD *)this + 86) = 1;
        }
        goto LABEL_11;
      case 0xC:
        OALSource::PostRenderAddBuffersToQueue(this, (OALSource *)*((unsigned int *)v6 + 6));
        goto LABEL_10;
      default:
        BOOL v36 = &_os_log_internal;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)MixerDistanceParams buf = 136315394;
          int v58 = "oalSource.cpp";
          __int16 v59 = 1024;
          int v60 = 3070;
          _os_log_impl(&dword_221534000, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d      MQ:WARNING - UNIMPLEMENTED MESSAGE...", buf, 0x12u);
        }
        goto LABEL_11;
    }
  }
}

void sub_2215579C0(_Unwind_Exception *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 68), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

void sub_2215579D0(_Unwind_Exception *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 68), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

void sub_2215579E0(_Unwind_Exception *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 68), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

void sub_2215579F0(_Unwind_Exception *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 68), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

void sub_221557A00(_Unwind_Exception *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 68), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

void sub_221557A10(_Unwind_Exception *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 68), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

void sub_221557A20(_Unwind_Exception *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 68), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

void sub_221557A30(_Unwind_Exception *a1)
{
  atomic_fetch_add((atomic_uint *volatile)(v1 + 68), 0xFFFFFFFF);
  _Unwind_Resume(a1);
}

uint64_t OALSource::SetReverbSendLevel(OALSource *this, float a2)
{
  if (a2 < 0.0 || a2 > 1.0)
  {
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 40963;
    __cxa_throw(exception, MEMORY[0x263F8C258], 0);
  }
  uint64_t v5 = (float *)((char *)this + 80);
  uint64_t result = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  int v7 = result;
  if (v5[88] != a2)
  {
    *((float *)this + 108) = a2;
    AudioUnitElement v8 = *((_DWORD *)this + 58);
    if (v8 != -1)
    {
      uint64_t v9 = *((void *)this + 1);
      if (*(_DWORD *)(v9 + 492)) {
        uint64_t result = AudioUnitSetParameter(*(AudioUnit *)(v9 + 32), 8u, 1u, v8, a2 * 100.0, 0);
      }
    }
  }
  if (v7) {
    return (*(uint64_t (**)(float *))(*(void *)v5 + 24))(v5);
  }
  return result;
}

void sub_221557B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t OALSource::SetOcclusion(uint64_t this, AudioUnitParameterValue a2)
{
  if (a2 < -100.0 || a2 > 0.0)
  {
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 40963;
    __cxa_throw(exception, MEMORY[0x263F8C258], 0);
  }
  if (*(float *)(this + 436) != a2)
  {
    *(AudioUnitParameterValue *)(this + 436) = a2;
    AudioUnitElement v2 = *(_DWORD *)(this + 232);
    if (v2 != -1)
    {
      uint64_t v3 = *(OpaqueAudioComponentInstance **)(*(void *)(this + 8) + 32);
      return AudioUnitSetParameter(v3, 0xAu, 1u, v2, a2, 0);
    }
  }
  return this;
}

uint64_t OALSource::SetObstruction(OALSource *this, AudioUnitParameterValue a2)
{
  if (a2 < -100.0 || a2 > 0.0)
  {
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 40963;
    __cxa_throw(exception, MEMORY[0x263F8C258], 0);
  }
  int v4 = (float *)((char *)this + 80);
  uint64_t result = (*(uint64_t (**)(char *))(*((void *)this + 10) + 16))((char *)this + 80);
  int v6 = result;
  if (v4[90] != a2)
  {
    *((AudioUnitParameterValue *)this + 110) = a2;
    AudioUnitElement v7 = *((_DWORD *)this + 58);
    if (v7 != -1) {
      uint64_t result = AudioUnitSetParameter(*(AudioUnit *)(*((void *)this + 1) + 32), 0xBu, 1u, v7, a2, 0);
    }
  }
  if (v6) {
    return (*(uint64_t (**)(float *))(*(void *)v4 + 24))(v4);
  }
  return result;
}

void sub_221557D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void CAMutex::Locker::~Locker(CAMutex::Locker *this)
{
  if (*((unsigned char *)this + 8)) {
    (*(void (**)(void))(**(void **)this + 24))();
  }
}

uint64_t ___ZN19SourceNotifications26CallSourceNotificationsImpEj_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 8))(*(unsigned int *)(*(void *)(a1 + 32) + 32), *(unsigned int *)(a1 + 48), *(void *)(*(void *)(a1 + 40) + 16));
}

uint64_t CAStreamBasicDescription::Print(CAStreamBasicDescription *this, __sFILE *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  *(_OWORD *)__dst = 0u;
  CA::StreamDescription::AsString(this, (uint64_t)__p);
  if (v6 >= 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  strlcpy(__dst, (const char *)v3, 0x100uLL);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  return fprintf(a2, "%s%s %s\n", "", "AudioStreamBasicDescription:", __dst);
}

void sub_221557EBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void CA::StreamDescription::AsString(CA::StreamDescription *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  unsigned int v4 = *((_DWORD *)this + 2);
  if (v4 == 1718773105)
  {
    caulk::make_string((caulk *)"%2u ch, %6.0f Hz, 'freq'", a2, *((unsigned int *)this + 7), *(void *)this);
    return;
  }
  if (v4 == 1819304813 && *((_DWORD *)this + 5) == 1)
  {
    unsigned int v5 = *((_DWORD *)this + 6);
    if (v5 == *((_DWORD *)this + 4))
    {
      unsigned int v6 = *((_DWORD *)this + 8);
      if (v5 >= v6 >> 3)
      {
        unsigned int v7 = *((_DWORD *)this + 7);
        if (v7)
        {
          unsigned int v8 = *((_DWORD *)this + 3);
          if ((v8 & 0x20) == 0)
          {
            if (v5 % v7) {
              goto LABEL_36;
            }
            v5 /= v7;
          }
          if ((v8 & 2) != 0 || 8 * v5 != v6) {
            goto LABEL_36;
          }
          if (v8)
          {
            if ((v8 & 0x1F84) != 0) {
              goto LABEL_36;
            }
            if (v5 == 4) {
              unsigned int v10 = 1;
            }
            else {
              unsigned int v10 = 4 * (v5 == 8);
            }
          }
          else
          {
            if ((v8 & 4) == 0) {
              goto LABEL_36;
            }
            int v9 = (v8 >> 7) & 0x3F;
            if (v9 == 24 && v5 == 4)
            {
              unsigned int v10 = 3;
            }
            else if (v9 || v5 != 4)
            {
              if (v5 == 2 && v9 == 0) {
                unsigned int v10 = 2;
              }
              else {
                unsigned int v10 = 0;
              }
            }
            else
            {
              unsigned int v10 = 5;
            }
          }
          if (v10)
          {
            uint64_t v12 = *((unsigned int *)this + 7);
            if (v12 < 2)
            {
              long long v13 = "";
            }
            else if ((*((unsigned char *)this + 12) & 0x20) != 0)
            {
              long long v13 = ", deinterleaved";
            }
            else
            {
              long long v13 = ", interleaved";
            }
            caulk::make_string((caulk *)"%2u ch, %6.0f Hz, %s%s", a2, v12, *(void *)this, *((void *)&off_2645B78C0 + v10), v13);
            return;
          }
        }
      }
    }
  }
LABEL_36:
  uint64_t v14 = *((unsigned int *)this + 7);
  double v15 = *(double *)this;
  if (v14) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v4 == 0;
  }
  if (v16 && v15 == 0.0)
  {
    caulk::make_string((caulk *)"%2u ch, %6.0f Hz", a2, 0, *(void *)this);
    return;
  }
  int v17 = bswap32(v4);
  unsigned int v18 = v17 & 0xFF000000;
  unsigned int v19 = (char)v17 - 32;
  int v20 = v17;
  unsigned int v21 = ((__int16)v17 >> 8) - 32;
  *((unsigned char *)&v61.__r_.__value_.__s + 23) = 4;
  if (((v17 >> 24) - 32) >= 0x5F) {
    unsigned int v18 = 771751936;
  }
  if (((v17 << 8 >> 24) - 32) >= 0x5F) {
    int v22 = 3014656;
  }
  else {
    int v22 = v17 & 0xFF0000;
  }
  int v23 = v22 | v18;
  int v24 = v17 & 0xFF00;
  if (v21 >= 0x5F) {
    int v24 = 11776;
  }
  if (v19 >= 0x5F) {
    int v25 = 46;
  }
  else {
    int v25 = v20;
  }
  LODWORD(v61.__r_.__value_.__l.__data_) = v23 | v24 | v25;
  v61.__r_.__value_.__s.__data_[4] = 0;
  caulk::make_string((caulk *)"%2u ch, %6.0f Hz, %s (0x%08X) ", (uint64_t)&v59, v14, *(void *)&v15, &v61, *((unsigned int *)this + 3));
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v61.__r_.__value_.__l.__data_);
    int v26 = *((_DWORD *)this + 2);
    if (v26 <= 1819304812) {
      goto LABEL_52;
    }
  }
  else
  {
    int v26 = *((_DWORD *)this + 2);
    if (v26 <= 1819304812)
    {
LABEL_52:
      if (v26 != 1634492771 && v26 != 1634497332 && v26 != 1718378851)
      {
LABEL_96:
        caulk::make_string((caulk *)"%u bits/channel, %u bytes/packet, %u frames/packet, %u bytes/frame", (uint64_t)&v61, *((unsigned int *)this + 8), *((unsigned int *)this + 4), *((unsigned int *)this + 5), *((unsigned int *)this + 6));
        if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          __int16 v37 = &v59;
        }
        else {
          __int16 v37 = (std::string *)v59.__r_.__value_.__r.__words[0];
        }
        if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v59.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v59.__r_.__value_.__l.__size_;
        }
LABEL_88:
        uint64_t v39 = std::string::insert(&v61, 0, (const std::string::value_type *)v37, size);
        long long v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
        *(void *)(a2 + 16) = *((void *)&v39->__r_.__value_.__l + 2);
        *(_OWORD *)a2 = v40;
        v39->__r_.__value_.__l.__size_ = 0;
        v39->__r_.__value_.__r.__words[2] = 0;
        v39->__r_.__value_.__r.__words[0] = 0;
        if ((SHIBYTE(v61.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_91;
        }
        __int16 v41 = (void *)v61.__r_.__value_.__r.__words[0];
        goto LABEL_90;
      }
LABEL_71:
      uint64_t v34 = *((unsigned int *)this + 3);
      if ((v34 - 1) < 4 || !v34 && (v26 == 1634497332 || v26 == 1936487278 || v26 == 1936487267))
      {
        caulk::make_string((caulk *)"from %u-bit source, ", (uint64_t)&v61, CA::StreamDescription::AsString(void)const::kSourceBits[v34]);
        if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          AudioUnitElement v35 = &v61;
        }
        else {
          AudioUnitElement v35 = (std::string *)v61.__r_.__value_.__r.__words[0];
        }
        if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v36 = HIBYTE(v61.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v36 = v61.__r_.__value_.__l.__size_;
        }
        std::string::append(&v59, (const std::string::value_type *)v35, v36);
        if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v61.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        std::string::append(&v59, "from UNKNOWN source bit depth, ", 0x1FuLL);
      }
      caulk::make_string((caulk *)"%u frames/packet", (uint64_t)&v61, *((unsigned int *)this + 5));
      if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        __int16 v37 = &v59;
      }
      else {
        __int16 v37 = (std::string *)v59.__r_.__value_.__r.__words[0];
      }
      if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v59.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v59.__r_.__value_.__l.__size_;
      }
      goto LABEL_88;
    }
  }
  if (v26 == 1936487278 || v26 == 1936487267) {
    goto LABEL_71;
  }
  if (v26 != 1819304813) {
    goto LABEL_96;
  }
  unsigned int v27 = *((_DWORD *)this + 3);
  unsigned int v28 = *((_DWORD *)this + 6);
  int v29 = "";
  if (!v28) {
    goto LABEL_63;
  }
  if ((v27 & 0x20) != 0)
  {
    unsigned int v30 = 1;
  }
  else
  {
    unsigned int v30 = *((_DWORD *)this + 7);
    if (!v30)
    {
LABEL_63:
      uint64_t v31 = " signed";
      if ((v27 & 4) == 0) {
        uint64_t v31 = " unsigned";
      }
      if (v27) {
        double v32 = "float";
      }
      else {
        double v32 = "integer";
      }
      if (v27) {
        int v33 = "";
      }
      else {
        int v33 = v31;
      }
LABEL_128:
      v61.__r_.__value_.__s.__data_[0] = 0;
      if ((v27 & 0x20) != 0) {
        uint64_t v46 = ", deinterleaved";
      }
      else {
        uint64_t v46 = "";
      }
      int v43 = "";
      uint64_t v47 = "";
      goto LABEL_132;
    }
  }
  int v42 = v28 / v30;
  if (v28 / v30 < 2)
  {
    uint64_t v45 = " signed";
    if ((v27 & 4) == 0) {
      uint64_t v45 = " unsigned";
    }
    if (v27) {
      double v32 = "float";
    }
    else {
      double v32 = "integer";
    }
    if (v27) {
      int v33 = "";
    }
    else {
      int v33 = v45;
    }
    if (v30 > v28) {
      goto LABEL_128;
    }
    int v42 = 1;
    int v43 = "";
  }
  else
  {
    if ((v27 & 2) != 0) {
      int v43 = " big-endian";
    }
    else {
      int v43 = " little-endian";
    }
    int v44 = " unsigned";
    if ((v27 & 4) != 0) {
      int v44 = " signed";
    }
    if (v27) {
      double v32 = "float";
    }
    else {
      double v32 = "integer";
    }
    if (v27) {
      int v33 = "";
    }
    else {
      int v33 = v44;
    }
  }
  unsigned int v48 = *((_DWORD *)this + 7);
  if ((v27 & 0x20) != 0) {
    unsigned int v48 = 1;
  }
  if (v48) {
    unsigned int v48 = 8 * (v28 / v48);
  }
  if (v48 == *((_DWORD *)this + 8))
  {
    v61.__r_.__value_.__s.__data_[0] = 0;
  }
  else
  {
    if ((v27 & 8) != 0) {
      uint64_t v49 = "";
    }
    else {
      uint64_t v49 = "un";
    }
    snprintf((char *)&v61, 0x20uLL, "%spacked in %u bytes", v49, v42);
    unsigned int v28 = *((_DWORD *)this + 6);
    unsigned int v27 = *((_DWORD *)this + 3);
    if (!v28) {
      goto LABEL_152;
    }
  }
  unsigned int v50 = *((_DWORD *)this + 7);
  if ((v27 & 0x20) != 0) {
    unsigned int v50 = 1;
  }
  if (v50) {
    unsigned int v28 = 8 * (v28 / v50);
  }
  else {
    unsigned int v28 = 0;
  }
LABEL_152:
  int v51 = *((_DWORD *)this + 8);
  int8x16_t v52 = " high-aligned";
  if ((v27 & 0x10) == 0) {
    int8x16_t v52 = " low-aligned";
  }
  if ((v51 & 7) == 0 && v28 == v51) {
    uint64_t v47 = "";
  }
  else {
    uint64_t v47 = v52;
  }
  if ((v27 & 0x20) != 0) {
    uint64_t v46 = ", deinterleaved";
  }
  else {
    uint64_t v46 = "";
  }
  if (!v61.__r_.__value_.__s.__data_[0])
  {
LABEL_132:
    if (*v47) {
      int v29 = ", ";
    }
    if (((v27 >> 7) & 0x3F) != 0) {
      goto LABEL_135;
    }
    goto LABEL_165;
  }
  int v29 = ", ";
  if (((v27 >> 7) & 0x3F) != 0)
  {
LABEL_135:
    snprintf(__str, 0x14uLL, "%u.%u");
    goto LABEL_166;
  }
LABEL_165:
  snprintf(__str, 0x14uLL, "%u");
LABEL_166:
  caulk::make_string((caulk *)"%s-bit%s%s %s%s%s%s%s", (uint64_t)&v58, __str, v43, v33, v32, v29, &v61, v47, v46);
  if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int8x16_t v54 = &v59;
  }
  else {
    int8x16_t v54 = (std::string *)v59.__r_.__value_.__r.__words[0];
  }
  if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v55 = HIBYTE(v59.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v55 = v59.__r_.__value_.__l.__size_;
  }
  int16x8_t v56 = std::string::insert(&v58, 0, (const std::string::value_type *)v54, v55);
  long long v57 = *(_OWORD *)&v56->__r_.__value_.__l.__data_;
  *(void *)(a2 + 16) = *((void *)&v56->__r_.__value_.__l + 2);
  *(_OWORD *)a2 = v57;
  v56->__r_.__value_.__l.__size_ = 0;
  v56->__r_.__value_.__r.__words[2] = 0;
  v56->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
  {
    __int16 v41 = (void *)v58.__r_.__value_.__r.__words[0];
LABEL_90:
    operator delete(v41);
  }
LABEL_91:
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v59.__r_.__value_.__l.__data_);
  }
}

void sub_221558658(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

std::string *caulk::make_string@<X0>(caulk *this@<X0>, uint64_t a2@<X8>, ...)
{
  va_start(va, a2);
  uint64_t result = (std::string *)vsnprintf(0, 0, (const char *)this, va);
  if ((int)result <= 0)
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    return result;
  }
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  std::string::append((std::string *)a2, (result + 1), 0);
  int v6 = *(char *)(a2 + 23);
  if (v6 >= 0) {
    unsigned int v7 = (char *)a2;
  }
  else {
    unsigned int v7 = *(char **)a2;
  }
  if (v6 >= 0) {
    size_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v8 = *(void *)(a2 + 8);
  }
  uint64_t result = (std::string *)vsnprintf(v7, v8, (const char *)this, va);
  if ((*(char *)(a2 + 23) & 0x80000000) == 0)
  {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
    if (v9 >= (int)result)
    {
      *(unsigned char *)(a2 + 23) = result & 0x7F;
      *(unsigned char *)(a2 + (int)result) = 0;
      return result;
    }
    return std::string::append((std::string *)a2, (int)result - v9, 0);
  }
  unint64_t v9 = *(void *)(a2 + 8);
  if (v9 < (int)result) {
    return std::string::append((std::string *)a2, (int)result - v9, 0);
  }
  *(void *)(a2 + 8) = (int)result;
  *(unsigned char *)(*(void *)a2 + (int)result) = 0;
  return result;
}

uint64_t SourceNotifications::AddSourceNotificationImp(SourceNotifications *this, int a2, void (*a3)(unsigned int, unsigned int, void *), void *a4)
{
  size_t v8 = *(char **)this;
  unint64_t v9 = (char *)*((void *)this + 1);
  unsigned int v10 = *(char **)this;
  if (*(char **)this != v9)
  {
    unsigned int v10 = *(char **)this;
    while (*(_DWORD *)v10 != a2
         || *((void (**)(unsigned int, unsigned int, void *))v10 + 1) != a3
         || *((void **)v10 + 2) != a4)
    {
      v10 += 24;
      if (v10 == v9) {
        goto LABEL_9;
      }
    }
  }
  if (v10 != v9) {
    return 4294967246;
  }
LABEL_9:
  unint64_t v12 = *((void *)this + 2);
  if ((unint64_t)v9 >= v12)
  {
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v8) >> 3) + 1;
    if (v14 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<SourceAttachedInfo>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - (void)v8) >> 3);
    if (2 * v15 > v14) {
      unint64_t v14 = 2 * v15;
    }
    if (v15 >= 0x555555555555555) {
      unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16)
    {
      if (v16 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      int v17 = (char *)operator new(24 * v16);
    }
    else
    {
      int v17 = 0;
    }
    unsigned int v18 = &v17[8 * ((v9 - v8) >> 3)];
    *(_DWORD *)unsigned int v18 = a2;
    *((void *)v18 + 1) = a3;
    *((void *)v18 + 2) = a4;
    long long v13 = v18 + 24;
    if (v8 != v9)
    {
      do
      {
        long long v19 = *(_OWORD *)(v9 - 24);
        *((void *)v18 - 1) = *((void *)v9 - 1);
        *(_OWORD *)(v18 - 24) = v19;
        v18 -= 24;
        v9 -= 24;
      }
      while (v9 != v8);
      size_t v8 = *(char **)this;
    }
    *(void *)this = v18;
    *((void *)this + 1) = v13;
    *((void *)this + 2) = &v17[24 * v16];
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *(_DWORD *)unint64_t v9 = a2;
    long long v13 = v9 + 24;
    *((void *)v9 + 1) = a3;
    *((void *)v9 + 2) = a4;
  }
  uint64_t result = 0;
  *((void *)this + 1) = v13;
  return result;
}

void CAMutex::CAMutex(CAMutex *this, const char *a2)
{
  *(void *)this = &unk_26D39BDC8;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = 0;
  int v2 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 24), 0);
  if (v2)
  {
    int v3 = v2;
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26D39BE60;
    exception[2] = v3;
  }
}

void CAMutex::~CAMutex(CAMutex *this)
{
  *(void *)this = &unk_26D39BDC8;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
}

{
  *(void *)this = &unk_26D39BDC8;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
}

{
  uint64_t vars8;

  *(void *)this = &unk_26D39BDC8;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));

  JUMPOUT(0x223C843A0);
}

uint64_t CAMutex::Lock(CAMutex *this)
{
  int v2 = pthread_self();
  if (pthread_equal(v2, *((pthread_t *)this + 2))) {
    return 0;
  }
  int v4 = pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
  if (v4)
  {
    int v5 = v4;
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26D39BE60;
    exception[2] = v5;
  }
  *((void *)this + 2) = v2;
  return 1;
}

uint64_t CAMutex::Unlock(CAMutex *this)
{
  int v2 = pthread_self();
  uint64_t result = pthread_equal(v2, *((pthread_t *)this + 2));
  if (result)
  {
    *((void *)this + 2) = 0;
    uint64_t result = pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 24));
    if (result)
    {
      int v4 = result;
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26D39BE60;
      exception[2] = v4;
    }
  }
  return result;
}

uint64_t CAMutex::Try(CAMutex *this, BOOL *a2)
{
  *a2 = 0;
  int v4 = pthread_self();
  if (pthread_equal(v4, *((pthread_t *)this + 2)))
  {
    uint64_t result = 1;
    *a2 = 0;
  }
  else
  {
    int v6 = pthread_mutex_trylock((pthread_mutex_t *)((char *)this + 24));
    if (v6 == 16)
    {
      uint64_t result = 0;
      *a2 = 0;
    }
    else
    {
      if (v6)
      {
        int v7 = v6;
        exception = __cxa_allocate_exception(0x10uLL);
        *(void *)exception = &unk_26D39BE60;
        exception[2] = v7;
      }
      *((void *)this + 2) = v4;
      uint64_t result = 1;
      *a2 = 1;
    }
  }
  return result;
}

BOOL CAMutex::IsFree(CAMutex *this)
{
  return *((void *)this + 2) == 0;
}

BOOL CAMutex::IsOwnedByCurrentThread(pthread_t *this)
{
  int v2 = pthread_self();
  return pthread_equal(v2, this[2]) != 0;
}

void CAException::~CAException(std::exception *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x223C843A0);
}

const char *CAException::what(CAException *this)
{
  return "CAException";
}

double CAHostTimeBase::Initialize(CAHostTimeBase *this)
{
  mach_timebase_info(&info);
  CAHostTimeBase::sMinDelta = 1;
  CAHostTimeBase::sToNanosNumerator = info.numer;
  CAHostTimeBase::sToNanosDenominator = info.denom;
  *(double *)&CAHostTimeBase::sFrequency = (double)info.denom / (double)info.numer * 1000000000.0;
  double result = 1.0 / *(double *)&CAHostTimeBase::sFrequency;
  *(double *)&CAHostTimeBase::sInverseFrequency = 1.0 / *(double *)&CAHostTimeBase::sFrequency;
  return result;
}

void CAGuard::CAGuard(CAGuard *this, const char *a2)
{
  CAMutex::CAMutex(this, a2);
  *(void *)uint64_t v2 = &unk_26D39BE88;
  int v3 = pthread_cond_init((pthread_cond_t *)(v2 + 88), 0);
  if (v3)
  {
    int v4 = v3;
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26D39BE60;
    exception[2] = v4;
  }
}

void sub_221558E74(_Unwind_Exception *a1)
{
  CAMutex::~CAMutex(v1);
  _Unwind_Resume(a1);
}

void CAGuard::~CAGuard(CAGuard *this)
{
  *(void *)this = &unk_26D39BE88;
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 88));

  CAMutex::~CAMutex(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26D39BE88;
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 88));
  CAMutex::~CAMutex(this);

  JUMPOUT(0x223C843A0);
}

pthread_t CAGuard::Wait(CAGuard *this)
{
  uint64_t v2 = pthread_self();
  if (!pthread_equal(v2, *((pthread_t *)this + 2)))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26D39BE60;
    exception[2] = 1;
  }
  *((void *)this + 2) = 0;
  int v3 = pthread_cond_wait((pthread_cond_t *)((char *)this + 88), (pthread_mutex_t *)((char *)this + 24));
  if (v3)
  {
    int v6 = v3;
    int v7 = __cxa_allocate_exception(0x10uLL);
    *(void *)int v7 = &unk_26D39BE60;
    v7[2] = v6;
  }
  pthread_t result = pthread_self();
  *((void *)this + 2) = result;
  return result;
}

BOOL CAGuard::WaitFor(CAGuard *this, unint64_t a2)
{
  int v4 = pthread_self();
  if (!pthread_equal(v4, *((pthread_t *)this + 2)))
  {
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26D39BE60;
    exception[2] = 1;
  }
  if (a2 <= 0x3B9AC9FF)
  {
    __darwin_time_t v5 = 0;
  }
  else
  {
    __darwin_time_t v5 = a2 / 0x3B9ACA00;
    a2 %= 0x3B9ACA00uLL;
  }
  v11.tv_sec = v5;
  v11.tv_nsec = a2;
  *((void *)this + 2) = 0;
  int v6 = pthread_cond_timedwait_relative_np((pthread_cond_t *)((char *)this + 88), (pthread_mutex_t *)((char *)this + 24), &v11);
  int v7 = v6;
  if (v6 && v6 != 60)
  {
    unsigned int v10 = __cxa_allocate_exception(0x10uLL);
    *(void *)unsigned int v10 = &unk_26D39BE60;
    v10[2] = v7;
  }
  *((void *)this + 2) = pthread_self();
  return v7 == 60;
}

uint64_t CAGuard::WaitUntil(CAGuard *this, uint64_t a2)
{
  uint64_t v4 = mach_absolute_time();
  pthread_once(&CAHostTimeBase::sIsInited, (void (*)(void))CAHostTimeBase::Initialize);
  if (CAHostTimeBase::sToNanosNumerator != CAHostTimeBase::sToNanosDenominator) {
    uint64_t v4 = __udivti3();
  }
  if (a2 <= v4) {
    return 1;
  }
  __darwin_time_t v5 = *(uint64_t (**)(CAGuard *, uint64_t))(*(void *)this + 64);

  return v5(this, a2 - v4);
}

uint64_t CAGuard::Notify(CAGuard *this)
{
  uint64_t result = pthread_cond_signal((pthread_cond_t *)((char *)this + 88));
  if (result)
  {
    int v2 = result;
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26D39BE60;
    exception[2] = v2;
  }
  return result;
}

uint64_t CAGuard::NotifyAll(CAGuard *this)
{
  uint64_t result = pthread_cond_broadcast((pthread_cond_t *)((char *)this + 88));
  if (result)
  {
    int v2 = result;
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26D39BE60;
    exception[2] = v2;
  }
  return result;
}

void OALCaptureDevice::OALCaptureDevice(OALCaptureDevice *this, const char *a2, uint64_t a3, unsigned int a4, int a5, unsigned int a6)
{
  *(void *)this = a3;
  *((_DWORD *)this + 2) = 0;
  *((unsigned char *)this + 12) = 0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((void *)this + 12) = 0x3FF0000000000000;
  *((_DWORD *)this + 26) = a6;
  *((void *)this + 14) = 0;
  *((_DWORD *)this + 30) = 0;
  FillInASBD((uint64_t)this + 40, a5, a4);
  if (*((_DWORD *)this + 14) > a6)
  {
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 40963;
    __cxa_throw(exception, MEMORY[0x263F8C258], 0);
  }
  int v9 = OALCaptureDevice::InitializeAU(this, v8);
  if (v9)
  {
    long long v19 = __cxa_allocate_exception(4uLL);
    *long long v19 = v9;
    __cxa_throw(v19, MEMORY[0x263F8C258], 0);
  }
  int v10 = *((_DWORD *)this + 13);
  if ((v10 & 0x20) != 0) {
    uint64_t v11 = *((unsigned int *)this + 17);
  }
  else {
    uint64_t v11 = 1;
  }
  if ((v10 & 0x20) != 0) {
    int v12 = 1;
  }
  else {
    int v12 = *((_DWORD *)this + 17);
  }
  long long v13 = operator new(16 * ((int)v11 - 1) + 48);
  void *v13 = "WriteBufferList";
  v13[1] = 0;
  *((_DWORD *)v13 + 4) = 0;
  *((_DWORD *)v13 + 6) = v11;
  if (v11)
  {
    unint64_t v14 = (char *)(v13 + 4);
    if (v11 == 1)
    {
      int v15 = 1;
      do
      {
LABEL_15:
        *(_DWORD *)unint64_t v14 = v12;
        *((_DWORD *)v14 + 1) = 0;
        *((void *)v14 + 1) = 0;
        v14 += 16;
        --v15;
      }
      while (v15);
      goto LABEL_16;
    }
    int v15 = v11 - (v11 & 0xFFFFFFFE);
    v14 += 16 * (v11 & 0xFFFFFFFE);
    unint64_t v16 = v13 + 7;
    uint64_t v17 = v11 & 0xFFFFFFFE;
    do
    {
      *((_DWORD *)v16 - 6) = v12;
      *((_DWORD *)v16 - 5) = 0;
      *((_DWORD *)v16 - 2) = v12;
      *((_DWORD *)v16 - 1) = 0;
      *(v16 - 2) = 0;
      *unint64_t v16 = 0;
      v16 += 4;
      v17 -= 2;
    }
    while (v17);
    if ((v11 & 0xFFFFFFFE) != v11) {
      goto LABEL_15;
    }
  }
LABEL_16:
  *((void *)this + 14) = v13;
  operator new();
}

void sub_2215594B0(void *a1, int a2)
{
  uint64_t v4 = v3;
  MEMORY[0x223C843A0](v4, 0x1010C40829CE571);
  int v7 = (int *)__cxa_begin_catch(a1);
  if (a2 == 2)
  {
    int v8 = *v7;
    int v9 = (OALRingBuffer *)v2[10];
    if (v9)
    {
      OALRingBuffer::~OALRingBuffer(v9);
      MEMORY[0x223C843A0]();
      uint64_t v10 = v2[11];
      if (!v10)
      {
LABEL_4:
        uint64_t v11 = v2[14];
        if (!v11) {
          goto LABEL_15;
        }
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v10 = v2[11];
      if (!v10) {
        goto LABEL_4;
      }
    }
    MEMORY[0x223C843A0](v10, 0x1000C4077774924);
    uint64_t v11 = v2[14];
    if (!v11) {
      goto LABEL_15;
    }
LABEL_12:
    uint64_t v15 = *(void *)(v11 + 8);
    if (v15) {
      MEMORY[0x223C84380](v15, 0x1000C8077774924);
    }
    MEMORY[0x223C843A0](v11, 0x10D0C40C0CFF4BFLL);
LABEL_15:
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = v8;
    __cxa_throw(exception, MEMORY[0x263F8C258], 0);
  }
  int v12 = (OALRingBuffer *)v2[10];
  if (v12)
  {
    OALRingBuffer::~OALRingBuffer(v12);
    MEMORY[0x223C843A0]();
    uint64_t v13 = v2[11];
    if (!v13)
    {
LABEL_8:
      uint64_t v14 = v2[14];
      if (!v14) {
        goto LABEL_21;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v13 = v2[11];
    if (!v13) {
      goto LABEL_8;
    }
  }
  MEMORY[0x223C843A0](v13, 0x1000C4077774924);
  uint64_t v14 = v2[14];
  if (!v14) {
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v17 = *(void *)(v14 + 8);
  if (v17) {
    MEMORY[0x223C84380](v17, 0x1000C8077774924);
  }
  MEMORY[0x223C843A0](v14, 0x10D0C40C0CFF4BFLL);
LABEL_21:
  unsigned int v18 = __cxa_allocate_exception(4uLL);
  *unsigned int v18 = -1;
  __cxa_throw(v18, MEMORY[0x263F8C258], 0);
}

void sub_221559654(_Unwind_Exception *a1)
{
}

uint64_t OALCaptureDevice::InitializeAU(OALCaptureDevice *this, const char *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int inData = 0;
  v9.componentFlagsMask = 0;
  *(_OWORD *)&v9.componentType = xmmword_22155D000;
  Next = AudioComponentFindNext(0, &v9);
  if (!Next) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = (AudioUnit *)((char *)this + 32);
  uint64_t v5 = AudioComponentInstanceNew(Next, (AudioComponentInstance *)this + 4);
  if (v5) {
    goto LABEL_16;
  }
  int inData = 0;
  uint64_t v5 = AudioUnitSetProperty(*v4, 0x7D3u, 2u, 0, &inData, 4u);
  if (v5) {
    goto LABEL_16;
  }
  int inData = 1;
  uint64_t v5 = AudioUnitSetProperty(*v4, 0x7D3u, 1u, 1u, &inData, 4u);
  if (v5) {
    goto LABEL_16;
  }
  long long v6 = *(_OWORD *)((char *)this + 56);
  v11[0] = *(_OWORD *)((char *)this + 40);
  v11[1] = v6;
  uint64_t v12 = *((void *)this + 9);
  uint64_t v5 = AudioUnitSetProperty(*((AudioUnit *)this + 4), 8u, 2u, 1u, v11, 0x28u);
  if (v5
    || (v10[0] = OALCaptureDevice::InputProc,
        v10[1] = this,
        uint64_t v5 = AudioUnitSetProperty(*((AudioUnit *)this + 4), 0x7D5u, 0, 0, v10, 0x10u),
        v5)
    || (uint64_t v5 = AudioUnitInitialize(*v4), v5))
  {
LABEL_16:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      AudioComponentInstance v7 = *(AudioComponentInstance *)this;
      *(_DWORD *)MixerDistanceParams buf = 136315906;
      uint64_t v15 = "oalCaptureDevice.cpp";
      __int16 v16 = 1024;
      int v17 = 172;
      __int16 v18 = 2048;
      AudioComponentInstance v19 = v7;
      __int16 v20 = 2048;
      uint64_t v21 = (int)v5;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::InitializeAU FAILED - OALContext = %ld : uint64_t result = %ld", buf, 0x26u);
    }
    if (*v4)
    {
      AudioComponentInstanceDispose(*v4);
      AudioUnit *v4 = 0;
    }
  }
  return v5;
}

void OALCaptureDevice::~OALCaptureDevice(OALCaptureDevice *this)
{
  int v2 = (OpaqueAudioComponentInstance *)*((void *)this + 4);
  if (v2) {
    AudioComponentInstanceDispose(v2);
  }
  uint64_t v3 = *((void *)this + 11);
  if (v3) {
    MEMORY[0x223C843A0](v3, 0x1000C4077774924);
  }
  uint64_t v4 = (OALRingBuffer *)*((void *)this + 10);
  if (v4)
  {
    OALRingBuffer::~OALRingBuffer(v4);
    MEMORY[0x223C843A0]();
  }
  uint64_t v5 = *((void *)this + 14);
  if (v5)
  {
    uint64_t v6 = *(void *)(v5 + 8);
    if (v6) {
      MEMORY[0x223C84380](v6, 0x1000C8077774924);
    }
    MEMORY[0x223C843A0](v5, 0x10D0C40C0CFF4BFLL);
  }
}

uint64_t OALCaptureDevice::InputProc(OALCaptureDevice *this, void *a2, const AudioTimeStamp *a3, const AudioTimeStamp *a4, UInt32 inNumberFrames, unsigned int a6, AudioBufferList *a7)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  AudioUnitRenderActionFlags ioActionFlags = 0;
  uint64_t v9 = *((void *)this + 14);
  uint64_t v10 = *(unsigned int *)(v9 + 24);
  if (*(_DWORD *)(v9 + 24))
  {
    if (v10 == 1)
    {
      uint64_t v11 = 0;
LABEL_7:
      uint64_t v14 = (void *)(v9 + 16 * v11 + 40);
      uint64_t v15 = v10 - v11;
      do
      {
        *uint64_t v14 = 0;
        v14 += 2;
        --v15;
      }
      while (v15);
      goto LABEL_9;
    }
    uint64_t v11 = v10 & 0xFFFFFFFE;
    uint64_t v12 = (void *)(v9 + 56);
    uint64_t v13 = v11;
    do
    {
      *(v12 - 2) = 0;
      *uint64_t v12 = 0;
      v12 += 4;
      v13 -= 2;
    }
    while (v13);
    if (v11 != v10) {
      goto LABEL_7;
    }
  }
LABEL_9:
  uint64_t v16 = AudioUnitRender(*((AudioUnit *)this + 4), &ioActionFlags, a3, 1u, inNumberFrames, (AudioBufferList *)(v9 + 24));
  if (v16)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = *(void *)this;
      *(_DWORD *)MixerDistanceParams buf = 136315906;
      uint64_t v21 = "oalCaptureDevice.cpp";
      __int16 v22 = 1024;
      int v23 = 200;
      __int16 v24 = 2048;
      uint64_t v25 = v17;
      __int16 v26 = 2048;
      uint64_t v27 = (int)v16;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::InputProc FAILED - OALContext = %ld : uint64_t result = %ld", buf, 0x26u);
    }
  }
  else if (OALRingBuffer::Store(*((OALRingBuffer **)this + 10), *(const unsigned __int8 **)(v9 + 40), inNumberFrames, *((void *)this + 2)))
  {
    *((void *)this + 2) += inNumberFrames;
  }
  return v16;
}

void OALCaptureDevice::StartCapture(AudioUnit *this)
{
  AudioOutputUnitStart(this[4]);
  *((unsigned char *)this + 12) = 1;
  int v2 = this[10];

  OALRingBuffer::Clear(v2);
}

void OALCaptureDevice::StopCapture(AudioUnit *this)
{
  AudioOutputUnitStop(this[4]);
  *((unsigned char *)this + 12) = 0;
  int v2 = this[10];

  OALRingBuffer::Clear(v2);
}

uint64_t OALCaptureDevice::GetFrames(OALCaptureDevice *this, unsigned int a2, unsigned __int8 *__dst, double a4, double a5)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)this + 12))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = *(void *)this;
      int v20 = 136315906;
      uint64_t v21 = "oalCaptureDevice.cpp";
      __int16 v22 = 1024;
      int v23 = 241;
      __int16 v24 = 2048;
      uint64_t v25 = v18;
      __int16 v26 = 2048;
      uint64_t v27 = 40964;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::GetFrames FAILED, device not currently capturing - OALContext = %ld : uint64_t result = %ld", (uint8_t *)&v20, 0x26u);
    }
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 40964;
    __cxa_throw(exception, MEMORY[0x263F8C258], 0);
  }
  AudioComponentInstance v7 = (OALRingBuffer *)*((void *)this + 10);
  uint64_t v9 = *((void *)v7 + 3);
  uint64_t v8 = *((void *)v7 + 4);
  uint64_t v10 = *((void *)this + 3);
  if (v10 < v9)
  {
    *((void *)this + 3) = v9;
    uint64_t v10 = v9;
  }
  unsigned int v11 = v8 - v10;
  LODWORD(a5) = *((_DWORD *)this + 26);
  double v12 = *((double *)this + 12);
  double v13 = v12 * (double)*(unint64_t *)&a5;
  if (v13 < (double)v11) {
    unsigned int v11 = v13;
  }
  if (((double)v11 / v12) >= a2)
  {
    uint64_t v15 = OALRingBuffer::Fetch(v7, __dst, a2, v10);
    if (v15)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = *(void *)this;
        int v20 = 136315906;
        uint64_t v21 = "oalCaptureDevice.cpp";
        __int16 v22 = 1024;
        int v23 = 255;
        __int16 v24 = 2048;
        uint64_t v25 = v16;
        __int16 v26 = 2048;
        uint64_t v27 = -1;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::GetFrames FAILED, err returned from mRingBuffer->Fetch - OALContext = %ld : uint64_t result = %ld", (uint8_t *)&v20, 0x26u);
      }
    }
    else
    {
      *((void *)this + 3) += a2;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)this;
      int v20 = 136315906;
      uint64_t v21 = "oalCaptureDevice.cpp";
      __int16 v22 = 1024;
      int v23 = 247;
      __int16 v24 = 2048;
      uint64_t v25 = v14;
      __int16 v26 = 2048;
      uint64_t v27 = -1;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALContext::GetFrames FAILED, not enough captured frames - OALContext = %ld : uint64_t result = %ld", (uint8_t *)&v20, 0x26u);
    }
    return 0xFFFFFFFFLL;
  }
  return v15;
}

uint64_t OALCaptureDevice::AvailableFrames(OALCaptureDevice *this, double a2, double a3)
{
  uint64_t v3 = *((void *)this + 10);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v4 = *(void *)(v3 + 32);
  uint64_t v6 = *((void *)this + 3);
  if (v6 < v5)
  {
    *((void *)this + 3) = v5;
    LODWORD(v6) = v5;
  }
  unsigned int v7 = v4 - v6;
  LODWORD(a3) = *((_DWORD *)this + 26);
  double v8 = *((double *)this + 12);
  double v9 = v8 * (double)*(unint64_t *)&a3;
  if (v9 < (double)v7) {
    unsigned int v7 = v9;
  }
  return ((double)v7 / v8);
}

void OALRingBuffer::OALRingBuffer(OALRingBuffer *this)
{
  *(void *)this = 0;
  *((_DWORD *)this + 3) = 0;
  *((_DWORD *)this + 4) = 0;
}

void OALRingBuffer::Allocate(OALRingBuffer *this, int a2, int a3)
{
  uint64_t v6 = *(void **)this;
  if (v6)
  {
    free(v6);
    *(void *)this = 0;
  }
  *(void *)((char *)this + 20) = 0;
  *(void *)((char *)this + 28) = 0;
  *((_DWORD *)this + 9) = 0;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = a3;
  size_t v7 = (a3 * a2);
  *((_DWORD *)this + 4) = v7;
  double v8 = malloc_type_malloc(v7, 0x961D322DuLL);
  *(void *)this = v8;
  if (v8) {
    bzero(v8, *((unsigned int *)this + 4));
  }
  *(void *)((char *)this + 20) = 0;
  *(void *)((char *)this + 28) = 0;
  *((_DWORD *)this + 9) = 0;
}

void OALRingBuffer::~OALRingBuffer(OALRingBuffer *this)
{
  int v2 = *(void **)this;
  if (v2)
  {
    free(v2);
    *(void *)this = 0;
  }
  *(void *)((char *)this + 20) = 0;
  *(void *)((char *)this + 12) = 0;
  *((_DWORD *)this + 9) = 0;
  *(void *)((char *)this + 28) = 0;
}

void OALRingBuffer::Clear(OALRingBuffer *this)
{
  int v2 = *(void **)this;
  if (v2) {
    bzero(v2, *((unsigned int *)this + 4));
  }
  *(void *)((char *)this + 28) = 0;
  *(void *)((char *)this + 20) = 0;
  *((_DWORD *)this + 9) = 0;
}

BOOL OALRingBuffer::Store(OALRingBuffer *this, const unsigned __int8 *__src, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *((unsigned int *)this + 3);
  if (v5 >= a3)
  {
    uint64_t v9 = a4 + a3;
    uint64_t v10 = *((void *)this + 4);
    if (v10 + v5 <= a4)
    {
      AudioComponentInstance v19 = *(void **)this;
      if (*(void *)this) {
        bzero(v19, *((unsigned int *)this + 4));
      }
      *((void *)this + 3) = 0;
    }
    else
    {
      uint64_t v11 = *((void *)this + 3);
      if (v11)
      {
        if (v9 > v10)
        {
          if (v10 < a4)
          {
            int v12 = *((_DWORD *)this + 2);
            unsigned int v13 = *((_DWORD *)this + 4);
            int v14 = *((_DWORD *)this + 5);
            unsigned int v15 = (v14 + v12 * ((int)v10 - (int)v11)) % v13;
            unsigned int v16 = (v14 + v12 * ((int)a4 - (int)v11)) % v13;
            unsigned int v17 = v16 - v15;
            if (v16 <= v15)
            {
              bzero((void *)(*(void *)this + v15), v13 - v15);
              uint64_t v18 = *(void **)this;
              unsigned int v17 = v16;
            }
            else
            {
              uint64_t v18 = (void *)(*(void *)this + v15);
            }
            bzero(v18, v17);
          }
          *((void *)this + 4) = v9;
          uint64_t v24 = v9 - *((unsigned int *)this + 3);
          uint64_t v11 = *((void *)this + 3);
          if (v24 > v11)
          {
            *((_DWORD *)this + 5) = (*((unsigned int *)this + 5) + (v24 - v11) * *((unsigned int *)this + 2))
                                  % *((unsigned int *)this + 4);
            *((void *)this + 3) = v24;
            LODWORD(v11) = v24;
          }
        }
        int v25 = *((_DWORD *)this + 2);
        unsigned int v26 = *((_DWORD *)this + 4);
        int v27 = *((_DWORD *)this + 5);
        unsigned int v28 = (v27 + v25 * ((int)a4 - (int)v11)) % v26;
        size_t v29 = (v27 + v25 * ((int)v9 - (int)v11)) % v26;
        size_t v21 = v29 - v28;
        if (v29 <= v28)
        {
          size_t v30 = v26 - v28;
          memcpy((void *)(*(void *)this + v28), __src, v30);
          int v20 = *(void **)this;
          __int16 v22 = &__src[v30];
          size_t v21 = v29;
          goto LABEL_13;
        }
        int v20 = (void *)(*(void *)this + v28);
LABEL_12:
        __int16 v22 = __src;
LABEL_13:
        memcpy(v20, v22, v21);
        return v5 >= a3;
      }
    }
    *((_DWORD *)this + 5) = 0;
    *((void *)this + 3) = a4;
    *((void *)this + 4) = v9;
    int v20 = *(void **)this;
    size_t v21 = *((_DWORD *)this + 2) * a3;
    goto LABEL_12;
  }
  return v5 >= a3;
}

uint64_t OALRingBuffer::Fetch(OALRingBuffer *this, unsigned __int8 *__dst, unsigned int a3, uint64_t a4)
{
  uint64_t v4 = *((void *)this + 3);
  if (a4 < v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = a4 + a3;
  if (v7 > *((void *)this + 4)) {
    return 0xFFFFFFFFLL;
  }
  int v9 = *((_DWORD *)this + 2);
  unsigned int v10 = *((_DWORD *)this + 4);
  int v11 = *((_DWORD *)this + 5);
  unsigned int v12 = (v11 + v9 * ((int)a4 - (int)v4)) % v10;
  size_t v13 = (v11 + v9 * ((int)v7 - (int)v4)) % v10;
  if (v13 <= v12)
  {
    size_t v14 = v10 - v12;
    memcpy(__dst, (const void *)(*(void *)this + v12), v14);
    memcpy(&__dst[v14], *(const void **)this, v13);
  }
  else
  {
    memcpy(__dst, (const void *)(*(void *)this + v12), v13 - v12);
  }
  return 0;
}

void OALCaptureMixer::OALCaptureMixer(OALCaptureMixer *this, OpaqueAudioComponentInstance *a2, double a3, int a4, unsigned int a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *(void *)this = a2;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_DWORD *)this + 14) = a5;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((_DWORD *)this + 20) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  FillInASBD((uint64_t)this + 8, a4, a3);
  if (*((_DWORD *)this + 6) <= a5)
  {
    uint64_t v13 = 0;
    memset(outData, 0, sizeof(outData));
    UInt32 ioDataSize = 40;
    OSStatus Property = AudioUnitGetProperty(*(AudioUnit *)this, 8u, 0, 0, outData, &ioDataSize);
    if (!Property) {
      operator new();
    }
    int v9 = Property;
    exception = (CAXException *)__cxa_allocate_exception(0x104uLL);
    CAXException::CAXException(exception, "AudioUnitGetProperty(mMixerUnit, kAudioUnitProperty_StreamFormat, 0, 0, &mixerOutFormat, &propSize)", v9);
  }
  double v8 = __cxa_allocate_exception(4uLL);
  _DWORD *v8 = 40963;
  __cxa_throw(v8, MEMORY[0x263F8C258], 0);
}

void sub_22155A470(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, __int16 a12, __int16 a13, int a14)
{
  if (a2)
  {
    __cxa_free_exception(v15);
    uint64_t v18 = (int *)__cxa_begin_catch(a1);
    if (a2 == 2)
    {
      int v19 = *v18;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 136315650;
        *(void *)((char *)&buf + 4) = "oalCaptureMixer.cpp";
        WORD6(buf) = 1024;
        *(_DWORD *)((char *)&buf + 14) = 62;
        a13 = 1024;
        a14 = v19;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALCaptureMixer::OALCaptureMixer FAILED - uint64_t result = %d", (uint8_t *)&buf, 0x18u);
      }
      int v20 = *(OALRingBuffer **)(v14 + 48);
      if (v20)
      {
        OALRingBuffer::~OALRingBuffer(v20);
        MEMORY[0x223C843A0]();
        *(void *)(v14 + 48) = 0;
      }
      exception = __cxa_allocate_exception(4uLL);
      _DWORD *exception = v19;
      __cxa_throw(exception, MEMORY[0x263F8C258], 0);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "oalCaptureMixer.cpp";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 70;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALCaptureMixer::OALCaptureMixer FAILED - Unknown error", (uint8_t *)&buf, 0x12u);
    }
    __int16 v22 = *(OALRingBuffer **)(v14 + 48);
    if (v22)
    {
      OALRingBuffer::~OALRingBuffer(v22);
      MEMORY[0x223C843A0]();
      *(void *)(v14 + 48) = 0;
    }
    int v23 = __cxa_allocate_exception(4uLL);
    *int v23 = -1;
    __cxa_throw(v23, MEMORY[0x263F8C258], 0);
  }
  _Unwind_Resume(a1);
}

void sub_22155A648(_Unwind_Exception *a1)
{
}

void sub_22155A654(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void sub_22155A664()
{
}

void CAXException::CAXException(CAXException *this, const char *__s, int a3)
{
  *((_DWORD *)this + 64) = a3;
  if (__s)
  {
    if (strlen(__s) < 0x100)
    {
      strlcpy((char *)this, __s, 0x100uLL);
    }
    else
    {
      long long v5 = *(_OWORD *)__s;
      long long v6 = *((_OWORD *)__s + 1);
      long long v7 = *((_OWORD *)__s + 3);
      *((_OWORD *)this + 2) = *((_OWORD *)__s + 2);
      *((_OWORD *)this + 3) = v7;
      *(_OWORD *)this = v5;
      *((_OWORD *)this + 1) = v6;
      long long v8 = *((_OWORD *)__s + 4);
      long long v9 = *((_OWORD *)__s + 5);
      long long v10 = *((_OWORD *)__s + 7);
      *((_OWORD *)this + 6) = *((_OWORD *)__s + 6);
      *((_OWORD *)this + 7) = v10;
      *((_OWORD *)this + 4) = v8;
      *((_OWORD *)this + 5) = v9;
      long long v11 = *((_OWORD *)__s + 8);
      long long v12 = *((_OWORD *)__s + 9);
      long long v13 = *((_OWORD *)__s + 11);
      *((_OWORD *)this + 10) = *((_OWORD *)__s + 10);
      *((_OWORD *)this + 11) = v13;
      *((_OWORD *)this + 8) = v11;
      *((_OWORD *)this + 9) = v12;
      long long v14 = *((_OWORD *)__s + 12);
      long long v15 = *((_OWORD *)__s + 13);
      long long v16 = *((_OWORD *)__s + 14);
      *(_OWORD *)((char *)this + 239) = *(_OWORD *)(__s + 239);
      *((_OWORD *)this + 13) = v15;
      *((_OWORD *)this + 14) = v16;
      *((_OWORD *)this + 12) = v14;
      *((unsigned char *)this + 255) = 0;
    }
  }
  else
  {
    *(unsigned char *)this = 0;
  }
}

void OALCaptureMixer::~OALCaptureMixer(OALCaptureMixer *this)
{
  if (*((_DWORD *)this + 20))
  {
    int v2 = 1;
    atomic_compare_exchange_strong((atomic_uint *volatile)this + 20, (unsigned int *)&v2, 0);
    AudioUnitRemoveRenderNotify(*(AudioUnit *)this, (AURenderCallback)OALCaptureMixer::RenderCallback, this);
    OALRingBuffer::Clear(*((OALRingBuffer **)this + 6));
  }
  uint64_t v3 = (OALRingBuffer *)*((void *)this + 6);
  if (v3)
  {
    OALRingBuffer::~OALRingBuffer(v3);
    MEMORY[0x223C843A0]();
    *((void *)this + 6) = 0;
  }
  uint64_t v4 = *((void *)this + 12);
  if (v4)
  {
    uint64_t v5 = *(void *)(v4 + 8);
    if (v5) {
      MEMORY[0x223C84380](v5, 0x1000C8077774924);
    }
    MEMORY[0x223C843A0](v4, 0x10D0C40C0CFF4BFLL);
    *((void *)this + 12) = 0;
  }
  long long v6 = (OpaqueAudioConverter *)*((void *)this + 11);
  if (v6)
  {
    AudioConverterDispose(v6);
    *((void *)this + 11) = 0;
  }
}

void OALCaptureMixer::StopCapture(atomic_uint *this)
{
  if (this[20])
  {
    int v2 = 1;
    atomic_compare_exchange_strong(this + 20, (unsigned int *)&v2, 0);
    AudioUnitRemoveRenderNotify(*(AudioUnit *)this, (AURenderCallback)OALCaptureMixer::RenderCallback, this);
    uint64_t v3 = (OALRingBuffer *)*((void *)this + 6);
    OALRingBuffer::Clear(v3);
  }
}

void OALCaptureMixer::StartCapture(OALCaptureMixer *this)
{
  int v1 = *((_DWORD *)this + 20);
  if (!v1)
  {
    atomic_compare_exchange_strong((atomic_uint *volatile)this + 20, (unsigned int *)&v1, 1u);
    AudioUnitAddRenderNotify(*(AudioUnit *)this, (AURenderCallback)OALCaptureMixer::RenderCallback, this);
    uint64_t v3 = (OALRingBuffer *)*((void *)this + 6);
    OALRingBuffer::Clear(v3);
  }
}

uint64_t OALCaptureMixer::RenderCallback(OALCaptureMixer *this, _DWORD *a2, unsigned int *a3, const AudioTimeStamp *a4, unsigned int a5, void *inInputDataProcUserData, AudioBufferList *a7)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!*((_DWORD *)this + 20)) {
    return 0;
  }
  uint64_t result = 0;
  if (!a4 && (*a2 & 0x108) == 8)
  {
    v14[0] = a5;
    uint64_t v10 = *((void *)this + 12);
    OSStatus v11 = AudioConverterFillComplexBuffer(*((AudioConverterRef *)this + 11), (AudioConverterComplexInputDataProc)OALCaptureMixer::ConverterProc, inInputDataProcUserData, v14, (AudioBufferList *)(v10 + 24), 0);
    if (v11)
    {
      OSStatus v12 = v11;
      exception = (char *)__cxa_allocate_exception(0x104uLL);
      *((_DWORD *)exception + 64) = v12;
      strlcpy(exception, "AudioConverterFillComplexBuffer(THIS->mAudioConverter, ConverterProc, ioData, &packetCount, abl, NULL)", 0x100uLL);
    }
    if (OALRingBuffer::Store(*((OALRingBuffer **)this + 6), *(const unsigned __int8 **)(v10 + 40), a5, *((void *)this + 8)))
    {
      *((void *)this + 8) += a5;
    }
    return 0;
  }
  return result;
}

void sub_22155AA10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, __int16 a10, __int16 a11, int a12)
{
  if (a2)
  {
    __cxa_free_exception(v12);
    uint64_t v15 = (int *)__cxa_begin_catch(exception_object);
    if (a2 == 2)
    {
      int v16 = *v15;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(a9) = 136315650;
        *(void *)((char *)&a9 + 4) = "oalCaptureMixer.cpp";
        WORD6(a9) = 1024;
        *(_DWORD *)((char *)&a9 + 14) = 157;
        a11 = 1024;
        a12 = v16;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALCaptureMixer::RenderCallback FAILED - uint64_t result = %d", (uint8_t *)&a9, 0x18u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(a9) = 136315394;
      *(void *)((char *)&a9 + 4) = "oalCaptureMixer.cpp";
      WORD6(a9) = 1024;
      *(_DWORD *)((char *)&a9 + 14) = 161;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALCaptureMixer::RenderCallback FAILED - Unknown error", (uint8_t *)&a9, 0x12u);
    }
    __cxa_end_catch();
    JUMPOUT(0x22155A9A4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t OALCaptureMixer::ConverterProc(OALCaptureMixer *this, OpaqueAudioConverter *a2, unsigned int *a3, AudioBufferList *a4, AudioStreamPacketDescription **a5, void *a6)
{
  uint64_t v6 = *(unsigned int *)a5;
  if (v6)
  {
    long long v7 = a5 + 2;
    long long v8 = a3 + 4;
    do
    {
      *(void *)long long v8 = *v7;
      *(v8 - 1) = *((_DWORD *)v7 - 1);
      v7 += 2;
      v8 += 4;
      --v6;
    }
    while (v6);
  }
  return 0;
}

uint64_t OALCaptureMixer::GetFrames(OALCaptureMixer *this, unsigned int a2, unsigned __int8 *__dst)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!*((_DWORD *)this + 20))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315650;
      long long v14 = "oalCaptureMixer.cpp";
      __int16 v15 = 1024;
      int v16 = 196;
      __int16 v17 = 2048;
      uint64_t v18 = 40964;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALCaptureMixer::GetFrames FAILED, device not currently capturing - uint64_t result = %ld", (uint8_t *)&v13, 0x1Cu);
    }
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 40964;
    __cxa_throw(exception, MEMORY[0x263F8C258], 0);
  }
  uint64_t v5 = (OALRingBuffer *)*((void *)this + 6);
  uint64_t v7 = *((void *)v5 + 3);
  uint64_t v6 = *((void *)v5 + 4);
  uint64_t v8 = *((void *)this + 9);
  if (v8 < v7)
  {
    *((void *)this + 9) = v7;
    uint64_t v8 = v7;
  }
  unsigned int v9 = v6 - v8;
  if (*((_DWORD *)this + 14) < v9) {
    unsigned int v9 = *((_DWORD *)this + 14);
  }
  if (v9 >= a2)
  {
    uint64_t v10 = OALRingBuffer::Fetch(v5, __dst, a2, v8);
    if (v10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 136315650;
        long long v14 = "oalCaptureMixer.cpp";
        __int16 v15 = 1024;
        int v16 = 210;
        __int16 v17 = 2048;
        uint64_t v18 = -1;
        _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALCaptureMixer::GetFrames FAILED, err returned from mRingBuffer->Fetch - uint64_t result = %ld", (uint8_t *)&v13, 0x1Cu);
      }
    }
    else
    {
      *((void *)this + 9) += a2;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315650;
      long long v14 = "oalCaptureMixer.cpp";
      __int16 v15 = 1024;
      int v16 = 202;
      __int16 v17 = 2048;
      uint64_t v18 = -1;
      _os_log_impl(&dword_221534000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%25s:%-5d ERROR: OALCaptureMixer::GetFrames FAILED, not enough captured frames - uint64_t result = %ld", (uint8_t *)&v13, 0x1Cu);
    }
    return 0xFFFFFFFFLL;
  }
  return v10;
}

uint64_t OALCaptureMixer::AvailableFrames(OALCaptureMixer *this)
{
  uint64_t v1 = *((void *)this + 6);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v2 = *(void *)(v1 + 32);
  uint64_t v4 = *((void *)this + 9);
  if (v4 < v3)
  {
    *((void *)this + 9) = v3;
    LODWORD(v4) = v3;
  }
  unsigned int v5 = v2 - v4;
  unsigned int v6 = *((_DWORD *)this + 14);
  if (v6 >= v5) {
    return v5;
  }
  else {
    return v6;
  }
}

uint64_t CABufferList::AllocateBuffers(uint64_t this, unsigned int a2)
{
  if (*(_DWORD *)(this + 36) < a2) {
    operator new[]();
  }
  return this;
}

void alSourceAddNotification_cold_1()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_221534000, &_os_log_internal, v0, "%25s:%-5d ERROR: alSourceAddNotification FAILED", v1, v2, v3, v4, v5);
  }
  __cxa_end_catch();
}

void alSourceRemoveNotification_cold_1(char a1)
{
  if (a1)
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_221534000, &_os_log_internal, v1, "%25s:%-5d ERROR: alSourceRemoveNotification FAILED", v2, v3, v4, v5, v6);
  }
  __cxa_end_catch();
}

OSStatus AUGraphAddNode(AUGraph inGraph, const AudioComponentDescription *inDescription, AUNode *outNode)
{
  return MEMORY[0x270EE1F50](inGraph, inDescription, outNode);
}

OSStatus AUGraphAddRenderNotify(AUGraph inGraph, AURenderCallback inCallback, void *inRefCon)
{
  return MEMORY[0x270EE1F58](inGraph, inCallback, inRefCon);
}

OSStatus AUGraphConnectNodeInput(AUGraph inGraph, AUNode inSourceNode, UInt32 inSourceOutputNumber, AUNode inDestNode, UInt32 inDestInputNumber)
{
  return MEMORY[0x270EE1F68](inGraph, *(void *)&inSourceNode, *(void *)&inSourceOutputNumber, *(void *)&inDestNode, *(void *)&inDestInputNumber);
}

OSStatus AUGraphDisconnectNodeInput(AUGraph inGraph, AUNode inDestNode, UInt32 inDestInputNumber)
{
  return MEMORY[0x270EE1F70](inGraph, *(void *)&inDestNode, *(void *)&inDestInputNumber);
}

OSStatus AUGraphInitialize(AUGraph inGraph)
{
  return MEMORY[0x270EE1F88](inGraph);
}

OSStatus AUGraphIsRunning(AUGraph inGraph, Boolean *outIsRunning)
{
  return MEMORY[0x270EE1FA0](inGraph, outIsRunning);
}

OSStatus AUGraphNodeInfo(AUGraph inGraph, AUNode inNode, AudioComponentDescription *outDescription, AudioUnit *outAudioUnit)
{
  return MEMORY[0x270EE1FA8](inGraph, *(void *)&inNode, outDescription, outAudioUnit);
}

OSStatus AUGraphOpen(AUGraph inGraph)
{
  return MEMORY[0x270EE1FB0](inGraph);
}

OSStatus AUGraphRemoveNode(AUGraph inGraph, AUNode inNode)
{
  return MEMORY[0x270EE1FB8](inGraph, *(void *)&inNode);
}

OSStatus AUGraphRemoveRenderNotify(AUGraph inGraph, AURenderCallback inCallback, void *inRefCon)
{
  return MEMORY[0x270EE1FC0](inGraph, inCallback, inRefCon);
}

OSStatus AUGraphStart(AUGraph inGraph)
{
  return MEMORY[0x270EE1FD0](inGraph);
}

OSStatus AUGraphStop(AUGraph inGraph)
{
  return MEMORY[0x270EE1FD8](inGraph);
}

OSStatus AUGraphUninitialize(AUGraph inGraph)
{
  return MEMORY[0x270EE1FE0](inGraph);
}

OSStatus AUGraphUpdate(AUGraph inGraph, Boolean *outIsUpdated)
{
  return MEMORY[0x270EE1FE8](inGraph, outIsUpdated);
}

AudioComponent AudioComponentFindNext(AudioComponent inComponent, const AudioComponentDescription *inDesc)
{
  return (AudioComponent)MEMORY[0x270EE2048](inComponent, inDesc);
}

OSStatus AudioComponentInstanceDispose(AudioComponentInstance inInstance)
{
  return MEMORY[0x270EE2058](inInstance);
}

OSStatus AudioComponentInstanceNew(AudioComponent inComponent, AudioComponentInstance *outInstance)
{
  return MEMORY[0x270EE2068](inComponent, outInstance);
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x270EE2090](inAudioConverter);
}

OSStatus AudioConverterFillComplexBuffer(AudioConverterRef inAudioConverter, AudioConverterComplexInputDataProc inInputDataProc, void *inInputDataProcUserData, UInt32 *ioOutputDataPacketSize, AudioBufferList *outOutputData, AudioStreamPacketDescription *outPacketDescription)
{
  return MEMORY[0x270EE2098](inAudioConverter, inInputDataProc, inInputDataProcUserData, ioOutputDataPacketSize, outOutputData, outPacketDescription);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x270EE20B8](inSourceFormat, inDestinationFormat, outAudioConverter);
}

OSStatus AudioOutputUnitStart(AudioUnit ci)
{
  return MEMORY[0x270EE2158](ci);
}

OSStatus AudioOutputUnitStop(AudioUnit ci)
{
  return MEMORY[0x270EE2160](ci);
}

OSStatus AudioUnitAddPropertyListener(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitPropertyListenerProc inProc, void *inProcUserData)
{
  return MEMORY[0x270EE2290](inUnit, *(void *)&inID, inProc, inProcUserData);
}

OSStatus AudioUnitAddRenderNotify(AudioUnit inUnit, AURenderCallback inProc, void *inProcUserData)
{
  return MEMORY[0x270EE2298](inUnit, inProc, inProcUserData);
}

OSStatus AudioUnitGetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue *outValue)
{
  return MEMORY[0x270EE22A0](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, outValue);
}

OSStatus AudioUnitGetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x270EE22A8](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, outData, ioDataSize);
}

OSStatus AudioUnitGetPropertyInfo(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, UInt32 *outDataSize, Boolean *outWritable)
{
  return MEMORY[0x270EE22B0](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, outDataSize, outWritable);
}

OSStatus AudioUnitInitialize(AudioUnit inUnit)
{
  return MEMORY[0x270EE22B8](inUnit);
}

OSStatus AudioUnitRemoveRenderNotify(AudioUnit inUnit, AURenderCallback inProc, void *inProcUserData)
{
  return MEMORY[0x270EE22C8](inUnit, inProc, inProcUserData);
}

OSStatus AudioUnitRender(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inOutputBusNumber, UInt32 inNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x270EE22D0](inUnit, ioActionFlags, inTimeStamp, *(void *)&inOutputBusNumber, *(void *)&inNumberFrames, ioData);
}

OSStatus AudioUnitReset(AudioUnit inUnit, AudioUnitScope inScope, AudioUnitElement inElement)
{
  return MEMORY[0x270EE22D8](inUnit, *(void *)&inScope, *(void *)&inElement);
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x270EE22E0](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, *(void *)&inBufferOffsetInFrames, inValue);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x270EE22E8](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, inData, *(void *)&inDataSize);
}

OSStatus DisposeAUGraph(AUGraph inGraph)
{
  return MEMORY[0x270EE2348](inGraph);
}

OSStatus NewAUGraph(AUGraph *outGraph)
{
  return MEMORY[0x270EE2460](outGraph);
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::exception::~exception(std::exception *this)
{
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

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

uint64_t __udivti3()
{
  return MEMORY[0x270ED7F10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

float log10f(float a1)
{
  MEMORY[0x270EDA0B8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE80](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x270EDAEB0](a1, a2);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
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

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF68](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}