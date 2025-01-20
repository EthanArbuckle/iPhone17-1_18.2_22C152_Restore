float CalcRotationMatrix(double a1, double a2, double a3, simd_float4x3 *a4)
{
  __double2 v7;
  __double2 v8;
  float64x2_t v9;
  float sinval;
  __double2 v11;
  uint64_t v12;
  float v13;
  float v14;
  uint64_t v15;
  float v16;
  float result;

  v7 = __sincos_stret(a2);
  v8 = __sincos_stret(a3);
  v9.f64[0] = v8.__cosval;
  v9.f64[1] = v8.__sinval;
  sinval = v7.__sinval;
  a4->columns[0].f32[2] = -sinval;
  *(float32x2_t *)a4->columns[0].f32 = vcvt_f32_f64(vmulq_n_f64(v9, v7.__cosval));
  v11 = __sincos_stret(a1);
  *(float *)&v12 = v11.__sinval * v8.__cosval * v7.__sinval - v11.__cosval * v8.__sinval;
  v13 = v11.__sinval * v7.__sinval * v8.__sinval + v11.__cosval * v8.__cosval;
  v14 = v11.__sinval * v7.__cosval;
  *((float *)&v12 + 1) = v13;
  a4->columns[1].f32[2] = v14;
  a4->columns[1].i64[0] = v12;
  *(float *)&v15 = v11.__cosval * v7.__sinval * v8.__cosval + v11.__sinval * v8.__sinval;
  v16 = v11.__cosval * v7.__sinval * v8.__sinval - v11.__sinval * v8.__cosval;
  *((float *)&v15 + 1) = v16;
  result = v11.__cosval * v7.__cosval;
  a4->columns[2].f32[2] = result;
  a4->columns[2].i64[0] = v15;
  return result;
}

float CalcRotationAngleFromMatrix(uint64_t a1, long long *a2)
{
  float v4 = atan2f(*(float *)(a1 + 24), *(float *)(a1 + 40));
  long long v8 = *a2;
  float v9 = v4 * 1000.0;
  *(float *)a2 = v4 * 1000.0;
  float v5 = atan2f(-*(float *)(a1 + 8), sqrtf((float)(*(float *)(a1 + 40) * *(float *)(a1 + 40)) + (float)(*(float *)(a1 + 24) * *(float *)(a1 + 24))));
  *(float *)&uint64_t v6 = v9;
  *((float *)&v6 + 1) = v5 * 1000.0;
  uint64_t v10 = v6;
  *((_DWORD *)a2 + 2) = DWORD2(v8);
  *(void *)a2 = v6;
  float result = atan2f(COERCE_FLOAT(HIDWORD(*(void *)a1)), COERCE_FLOAT(*(_OWORD *)a1)) * 1000.0;
  *(void *)a2 = v10;
  *((float *)a2 + 2) = result;
  return result;
}

float Simd4x3ToMatrix(simd_float4x3 *a1, float (*a2)[3], float *a3)
{
  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v4 = 0;
    float v5 = a2;
    do
      *(_DWORD *)v5++ = a1->columns[i].i32[v4++ & 3];
    while (v4 != 3);
    a2 = (float (*)[3])((char *)a2 + 4);
  }
  *(void *)a3 = a1->columns[3].i64[0];
  float result = a1->columns[3].f32[2];
  a3[2] = result;
  return result;
}

__CFString *ConvertDataToHexString(const __CFData *a1)
{
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  CFAllocatorRef Default = CFAllocatorGetDefault();
  for (uint64_t i = CFStringCreateMutable(Default, 0); Length; --Length)
  {
    unsigned int v6 = *BytePtr++;
    CFStringAppendFormat(i, 0, @"%02X", v6);
  }
  return i;
}

uint64_t HxISPCaptureDeviceController::FindGroup(HxISPCaptureDeviceController *this, unsigned int a2)
{
  if (!*((_DWORD *)this + 536)) {
    return 0;
  }
  unint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
  unsigned int v6 = (const void **)((char *)this + 8 * a2 + 16);
  v7 = (char *)this + 2080;
  do
  {
    CFArrayRef theArray = 0;
    uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    v11 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(v10 + 48);
    if (!v11 || v11(FigBaseObject, v5, kCFAllocatorDefault, &theArray)) {
      break;
    }
    CFArrayRef v12 = theArray;
    v15.length = CFArrayGetCount(theArray);
    v15.location = 0;
    if (CFArrayContainsValue(v12, v15, *v6)) {
      uint64_t v4 = *(void *)&v7[8 * v3];
    }
    CFRelease(theArray);
    ++v3;
  }
  while (v3 < *((unsigned int *)this + 536));
  return v4;
}

void HxISPCaptureDeviceController::HxISPCaptureDeviceController(HxISPCaptureDeviceController *this)
{
  for (uint64_t i = 296; i != 2280; i += 248)
    *((unsigned char *)this + i) = 0;
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  *((_DWORD *)this + 538) = -1;
  *((void *)this + 259) = 0;
  *((_DWORD *)this + 536) = 0;
  *((unsigned char *)this + 2148) = 0;
  *((_DWORD *)this + 516) = 0;
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  do
  {
    uint64_t v5 = (char *)this + 8 * v4;
    *((void *)v5 + 2) = 0;
    *((void *)v5 + 260) = 0;
    unsigned int v6 = (char *)this + v3;
    pthread_mutex_init((pthread_mutex_t *)((char *)this + v3 + 96), 0);
    pthread_cond_init((pthread_cond_t *)((char *)this + v3 + 160), 0);
    *((_WORD *)v6 + 136) = 0;
    *((void *)v6 + 33) = 0;
    *((_DWORD *)v6 + 52) = 0;
    *(_OWORD *)(v6 + 216) = 0u;
    *(_OWORD *)(v6 + 232) = 0u;
    *(_OWORD *)(v6 + 241) = 0u;
    *((void *)v6 + 10) = this;
    *((_DWORD *)v6 + 22) = v4;
    *(void *)(v6 + 276) = 0xFFFFLL;
    *((void *)v6 + 36) = 0;
    ++v4;
    v3 += 248;
    *((_WORD *)v6 + 142) = 0;
  }
  while (v3 != 1984);
}

void HxISPCaptureDeviceController::~HxISPCaptureDeviceController(HxISPCaptureDeviceController *this)
{
  uint64_t v2 = 0;
  uint64_t v3 = 256;
  do
  {
    if (*((unsigned char *)this + v3)) {
      HxISPCaptureDeviceController::stopReceive(this, v2);
    }
    ++v2;
    v3 += 248;
  }
  while (v2 != 8);
  if (*((unsigned char *)this + 2148)) {
    HxISPCaptureDeviceController::deactivate(this);
  }
  uint64_t v4 = -1984;
  do
  {
    pthread_cond_destroy((pthread_cond_t *)((char *)this + v4 + 2144));
    pthread_mutex_destroy((pthread_mutex_t *)((char *)this + v4 + 2080));
    v4 += 248;
  }
  while (v4);
}

uint64_t HxISPCaptureDeviceController::stopReceive(HxISPCaptureDeviceController *this, unsigned int a2)
{
  if (*((unsigned char *)this + 248 * a2 + 256))
  {
    if (*((_DWORD *)this + 516) <= a2)
    {
      uint64_t v7 = 3758097084;
      printf("Error: HxISPCaptureDeviceController::stopReceive - Invalid streamIndex %d\n", a2);
    }
    else
    {
      *((unsigned char *)this + 248 * a2 + 272) = 1;
      uint64_t v4 = *((void *)this + a2 + 2);
      uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
      long long v8 = *(uint64_t (**)(uint64_t))(v6 + 16);
      if (v8) {
        uint64_t v7 = v8(v4);
      }
      else {
        uint64_t v7 = 4294954514;
      }
      uint64_t v9 = (char *)this + 248 * a2;
      CFArrayRef v12 = (opaqueCMBufferQueue *)*((void *)v9 + 27);
      v11 = (CMBufferQueueRef *)(v9 + 216);
      uint64_t v10 = v12;
      if (v12)
      {
        CMBufferQueueRemoveTrigger(v10, *((CMBufferQueueTriggerToken *)this + 31 * a2 + 28));
        while (1)
        {
          CMBufferRef v13 = CMBufferQueueDequeueAndRetain(*v11);
          if (!v13) {
            break;
          }
          CFRelease(v13);
        }
        v14 = (char *)this + 248 * a2;
        v17 = (opaqueCMBufferQueue *)*((void *)v14 + 29);
        v16 = (opaqueCMBufferQueue **)(v14 + 232);
        for (uint64_t i = v17; ; uint64_t i = *v16)
        {
          CMBufferRef v18 = CMBufferQueueDequeueAndRetain(i);
          if (!v18) {
            break;
          }
          CFRelease(v18);
        }
      }
      v19 = (char *)this + 248 * a2;
      if (*((void *)v19 + 33))
      {
        v20 = (pthread_t *)(v19 + 264);
        v21 = (char *)this + 248 * a2;
        v22 = (pthread_mutex_t *)(v21 + 96);
        pthread_mutex_lock((pthread_mutex_t *)(v21 + 96));
        int v25 = *((_DWORD *)v21 + 52);
        v24 = (int *)(v21 + 208);
        for (int j = v25; j == 1; int j = *v24)
        {
          pthread_mutex_unlock(v22);
          usleep(0x2710u);
          pthread_mutex_lock(v22);
        }
        v28 = 0;
        int *v24 = 2;
        pthread_cond_signal((pthread_cond_t *)((char *)this + 248 * a2 + 160));
        pthread_mutex_unlock(v22);
        pthread_join(*v20, &v28);
        pthread_t *v20 = 0;
      }
      v26 = (char *)this + 248 * a2;
      *((void *)v26 + 30) = 0;
      *((void *)v26 + 31) = 0;
      v26[256] = 0;
    }
  }
  else
  {
    uint64_t v7 = 3758097084;
    puts("Error: HxISPCaptureDeviceController::startReceive - not already streaming");
  }
  return v7;
}

void sub_100005474(void *a1)
{
}

uint64_t HxISPCaptureDeviceController::deactivate(HxISPCaptureDeviceController *this)
{
  if (*((unsigned char *)this + 2148))
  {
    for (uint64_t i = 16; i != 80; i += 8)
    {
      if (*(void *)((char *)this + i))
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterRemoveListener();
      }
    }
    for (uint64_t j = 0; j != 1984; j += 248)
    {
      uint64_t v4 = *(const void **)((char *)this + j + 216);
      if (v4) {
        CFRelease(v4);
      }
      uint64_t v5 = *(const void **)((char *)this + j + 232);
      if (v5) {
        CFRelease(v5);
      }
    }
    uint64_t v6 = 0;
    uint64_t v7 = -1984;
    do
    {
      long long v8 = (char *)this + v6;
      *((void *)v8 + 2) = 0;
      *((void *)v8 + 260) = 0;
      uint64_t v9 = (char *)this + v7;
      pthread_mutex_init((pthread_mutex_t *)((char *)this + v7 + 2080), 0);
      pthread_cond_init((pthread_cond_t *)((char *)this + v7 + 2144), 0);
      *((_WORD *)v9 + 1128) = 0;
      *((void *)v9 + 281) = 0;
      *((_DWORD *)v9 + 548) = 0;
      *(_OWORD *)(v9 + 2200) = 0u;
      *(_OWORD *)(v9 + 2216) = 0u;
      *(_OWORD *)(v9 + 2225) = 0u;
      *((void *)v9 + 258) = this;
      v6 += 8;
      *((_DWORD *)v9 + 518) = 0;
      v7 += 248;
    }
    while (v7);
    uint64_t v10 = (const void *)*((void *)this + 259);
    if (v10) {
      CFRelease(v10);
    }
    v11 = (const void *)*((void *)this + 1);
    if (v11) {
      CFRelease(v11);
    }
    if (*(void *)this)
    {
      uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
      if (FigBaseObject)
      {
        uint64_t v13 = FigBaseObject;
        uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v14) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 0;
        }
        v16 = *(void (**)(uint64_t))(v15 + 24);
        if (v16) {
          v16(v13);
        }
      }
      CFRelease(*(CFTypeRef *)this);
    }
    *((unsigned char *)this + 2148) = 0;
    *((_DWORD *)this + 516) = 0;
    *(void *)this = 0;
    *((void *)this + 1) = 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t HxISPCaptureDeviceController::activate(HxISPCaptureDeviceController *this)
{
  uint64_t v1 = 0xFFFFFFFFLL;
  if (*((unsigned char *)this + 2148)) {
    return v1;
  }
  *((_DWORD *)this + 538) = -1;
  int v25 = 0;
  uint64_t v1 = sub_100007AD8("/System/Library/MediaCapture/VirtualCameraDevice.mediacapture", "FigVirtualCameraDeviceCreate", (uint64_t)&v25);
  if (v25)
  {
    fprintf(__stderrp, "+++ Found and loaded %s\n", "/System/Library/MediaCapture/VirtualCameraDevice.mediacapture");
    uint64_t v3 = v25;
    if (v25)
    {
LABEL_13:
      *(void *)this = v3;
      goto LABEL_14;
    }
  }
  uint64_t v4 = &dword_100018A70;
  unint64_t v5 = 1;
  do
  {
    CFDictionaryRef v6 = IOServiceMatching(*((const char **)v4 - 3));
    if (IOServiceGetMatchingService(kIOMainPortDefault, v6))
    {
      uint64_t v7 = (const char *)*((void *)v4 - 2);
      uint64_t v1 = sub_100007AD8(v7, *((const char **)v4 - 1), (uint64_t)&v25);
      if (!v25)
      {
        uint64_t v3 = 0;
        goto LABEL_10;
      }
      fprintf(__stderrp, "+++ Found and loaded  %s\n", v7);
      *((_DWORD *)this + 538) = *v4;
    }
    uint64_t v3 = v25;
LABEL_10:
    if (v5 > 4) {
      break;
    }
    ++v5;
    v4 += 8;
  }
  while (!v3);
  if (this) {
    goto LABEL_13;
  }
  if (v3) {
    CFRelease(v3);
  }
LABEL_14:
  if (v1 || !*(void *)this)
  {
    puts("HxISPCaptureDeviceController::activate - Error: Could not create CaptureDevice");
  }
  else
  {
    uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    CFArrayRef v12 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, char *))(v11 + 48);
    if (!v12) {
      return 4294954514;
    }
    uint64_t v1 = v12(FigBaseObject, kFigCaptureDeviceProperty_StreamArray, kCFAllocatorDefault, (char *)this + 8);
    if (v1) {
      return v1;
    }
    unsigned int Count = CFArrayGetCount(*((CFArrayRef *)this + 1));
    if (Count >= 8) {
      int v14 = 8;
    }
    else {
      int v14 = Count;
    }
    *((_DWORD *)this + 516) = v14;
    if (v14)
    {
      unint64_t v15 = 0;
      do
      {
        *((void *)this + v15 + 2) = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 1), v15);
        ++v15;
        unint64_t v16 = *((unsigned int *)this + 516);
      }
      while (v15 < v16);
      if (v16)
      {
        unint64_t v17 = 0;
        do
        {
          if (*((void *)this + v17 + 2))
          {
            CMNotificationCenterGetDefaultLocalCenter();
            CMNotificationCenterAddListener();
          }
          else
          {
            printf("HxISPCaptureDeviceController::activate - CaptureStream %d not found\n", v17);
          }
          ++v17;
        }
        while (v17 < *((unsigned int *)this + 516));
      }
    }
    uint64_t v18 = FigCaptureDeviceGetFigBaseObject();
    uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v20 = v19 ? v19 : 0;
    v21 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, char *))(v20 + 48);
    if (!v21) {
      return 4294954514;
    }
    uint64_t v1 = v21(v18, kFigCaptureDeviceProperty_SupportedSynchronizedStreamsGroups, kCFAllocatorDefault, (char *)this + 2072);
    if (!v1)
    {
      unsigned int v22 = CFArrayGetCount(*((CFArrayRef *)this + 259));
      if (v22 >= 8) {
        int v23 = 8;
      }
      else {
        int v23 = v22;
      }
      *((_DWORD *)this + 536) = v23;
      if (v23)
      {
        unint64_t v24 = 0;
        do
        {
          *((void *)this + v24 + 260) = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 259), v24);
          ++v24;
        }
        while (v24 < *((unsigned int *)this + 536));
      }
      uint64_t v1 = 0;
      *((unsigned char *)this + 2148) = 1;
    }
  }
  return v1;
}

size_t sub_1000059E8(int a1, uint64_t a2, const __CFString *a3, CFTypeRef cf1)
{
  if (a2 && cf1)
  {
    if (*(_DWORD *)(a2 + 2064))
    {
      unint64_t v7 = 0;
      do
      {
        if (CFEqual(cf1, *(CFTypeRef *)(a2 + 16 + 8 * v7))) {
          break;
        }
        ++v7;
      }
      while (v7 < *(unsigned int *)(a2 + 2064));
      unsigned int v8 = v7;
    }
    else
    {
      unsigned int v8 = 0;
    }
    uint64_t v11 = __stdoutp;
    CStringPtr = CFStringGetCStringPtr(a3, 0);
    fprintf(v11, "HxISPCaptureDeviceController::handleStreamNotification: %s (streamIndex %d)\n", CStringPtr, v8);
    fflush(__stdoutp);
    size_t result = CFEqual(a3, kFigCaptureStreamNotification_StreamControlTakenByAnotherClient);
    if (result && *(unsigned char *)(a2 + 248 * v8 + 256))
    {
      return HxISPCaptureDeviceController::stopReceive((HxISPCaptureDeviceController *)a2, v8);
    }
  }
  else
  {
    uint64_t v9 = __stdoutp;
    return fwrite("Diagnostic_FW Device controller recievd null notification info objects\n", 0x47uLL, 1uLL, v9);
  }
  return result;
}

uint64_t HxISPCaptureDeviceController::RequestStreams(HxISPCaptureDeviceController *this, const __CFArray *a2, const __CFDictionary *a3)
{
  if (!a2) {
    return 4294954516;
  }
  uint64_t v5 = *(void *)this;
  CFDictionaryRef v6 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = 0;
  }
  if (*v7 < 2uLL) {
    return 4294954514;
  }
  uint64_t v9 = (uint64_t (*)(uint64_t, const __CFArray *, const __CFDictionary *))v7[2];
  if (!v9) {
    return 4294954514;
  }

  return v9(v5, a2, a3);
}

uint64_t HxISPCaptureDeviceController::RelinquishStreams(HxISPCaptureDeviceController *this, const __CFArray *a2)
{
  if (!a2) {
    return 4294954516;
  }
  uint64_t v3 = *(void *)this;
  uint64_t v4 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (*v5 < 2uLL) {
    return 4294954514;
  }
  unint64_t v7 = (uint64_t (*)(uint64_t, const __CFArray *, void))v5[3];
  if (!v7) {
    return 4294954514;
  }

  return v7(v3, a2, 0);
}

uint64_t HxISPCaptureDeviceController::startReceive(HxISPCaptureDeviceController *this, unsigned int a2, void (*a3)(opaqueCMSampleBuffer *, unsigned int, void *), void *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    printf("Error: HxISPCaptureDeviceController::startReceive - Invalid streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = (char *)this + 248 * a2;
  if (v5[256])
  {
    printf("Error: HxISPCaptureDeviceController::startReceive - already streaming on streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = (char *)this + 248 * a2;
  *((void *)v9 + 30) = a3;
  *((void *)v9 + 31) = a4;
  obuint64_t j = 0;
  uint64_t v10 = (uint64_t *)((char *)this + 8 * a2 + 16);
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  int v14 = *(unsigned int (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(v13 + 48);
  if (v14 && !v14(FigBaseObject, kFigCaptureStreamProperty_FormatDescription, kCFAllocatorDefault, &obj))
  {
    CFShow(obj);
    CFRelease(obj);
    obuint64_t j = 0;
  }
  unint64_t v15 = (char *)this + 248 * a2;
  uint64_t v17 = *((void *)v15 + 27);
  unint64_t v16 = (CMBufferQueueRef *)(v15 + 216);
  if (!v17)
  {
    uint64_t v22 = FigCaptureStreamGetFigBaseObject();
    uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v23) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 0;
    }
    v34 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CMBufferQueueRef *))(v24 + 48);
    if (!v34) {
      return 4294954514;
    }
    uint64_t v6 = v34(v22, kFigCaptureStreamProperty_BufferQueue, kCFAllocatorDefault, v16);
    if (v6) {
      return v6;
    }
  }
  uint64_t v18 = (char *)this + 248 * a2;
  uint64_t v20 = *((void *)v18 + 29);
  uint64_t v19 = v18 + 232;
  if (!v20)
  {
    uint64_t v25 = FigCaptureStreamGetFigBaseObject();
    uint64_t v26 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v26) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
    v35 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, char *))(v27 + 48);
    if (v35)
    {
      uint64_t v6 = v35(v25, kFigCaptureStreamProperty_StillImageBufferQueue, kCFAllocatorDefault, v19);
      if (v6) {
        return v6;
      }
      goto LABEL_17;
    }
    return 4294954514;
  }
LABEL_17:
  v21 = *v16;
  CMTime time = kCMTimeZero;
  if (CMBufferQueueInstallTrigger(v21, (CMBufferQueueTriggerCallback)sub_100006204, v5 + 80, 7, &time, (CMBufferQueueTriggerToken *)this + 31 * a2 + 28))
  {
    return 3758097084;
  }
  v28 = (char *)this + 248 * a2;
  v29 = (pthread_mutex_t *)(v28 + 96);
  pthread_mutex_lock((pthread_mutex_t *)(v28 + 96));
  *((_DWORD *)v28 + 52) = 0;
  v30 = v28 + 208;
  v30[64] = 0;
  pthread_attr_init(&v40);
  pthread_attr_setdetachstate(&v40, 1);
  pthread_create((pthread_t *)v30 + 7, &v40, (void *(__cdecl *)(void *))sub_100006274, v5 + 80);
  pthread_attr_destroy(&v40);
  pthread_mutex_unlock(v29);
  uint64_t v31 = *v10;
  uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v32) {
    uint64_t v33 = v32;
  }
  else {
    uint64_t v33 = 0;
  }
  v36 = v5 + 256;
  v37 = *(uint64_t (**)(uint64_t))(v33 + 8);
  if (v37)
  {
    uint64_t v6 = v37(v31);
    if (!v6)
    {
      uint64_t v6 = 0;
      unsigned char *v36 = 1;
      return v6;
    }
  }
  else
  {
    uint64_t v6 = 4294954514;
  }
  CMBufferQueueRemoveTrigger(*v16, *((CMBufferQueueTriggerToken *)this + 31 * a2 + 28));
  while (1)
  {
    usleep(0x2710u);
    v40.__sig = 0;
    pthread_mutex_lock(v29);
    if (*(_DWORD *)v30 != 1) {
      break;
    }
    pthread_mutex_unlock(v29);
  }
  *(_DWORD *)v30 = 2;
  pthread_cond_signal((pthread_cond_t *)((char *)this + 248 * a2 + 160));
  pthread_mutex_unlock(v29);
  pthread_join(*((pthread_t *)v30 + 7), (void **)&v40);
  unsigned char *v36 = 0;
  return v6;
}

uint64_t sub_100006204(uint64_t result)
{
  if (!*(unsigned char *)(result + 192))
  {
    uint64_t v1 = result;
    if (*(_DWORD *)(result + 128) != 1)
    {
      pthread_mutex_lock((pthread_mutex_t *)(result + 16));
      *(_DWORD *)(v1 + 128) = 1;
      pthread_cond_signal((pthread_cond_t *)(v1 + 80));
      return pthread_mutex_unlock((pthread_mutex_t *)(v1 + 16));
    }
  }
  return result;
}

uint64_t sub_100006274(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8)) {
    uint64_t v2 = "HxISPCaptureDeviceStreamFrameReceiveThread1";
  }
  else {
    uint64_t v2 = "HxISPCaptureDeviceStreamFrameReceiveThread0";
  }
  pthread_setname_np(v2);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  while (1)
  {
    pthread_cond_wait((pthread_cond_t *)(a1 + 80), (pthread_mutex_t *)(a1 + 16));
    if (*(_DWORD *)(a1 + 128) == 2) {
      break;
    }
    CMBufferRef v3 = CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(a1 + 136));
    if (v3)
    {
      CMBufferRef v4 = v3;
      do
      {
        uint64_t v5 = *(void (**)(CMBufferRef, void, void))(a1 + 160);
        if (v5) {
          v5(v4, *(unsigned int *)(a1 + 8), *(void *)(a1 + 168));
        }
        CFRelease(v4);
        CMBufferRef v4 = CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(a1 + 136));
      }
      while (v4);
    }
    *(_DWORD *)(a1 + 128) = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return 0;
}

uint64_t HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(HxISPCaptureDeviceController *this, unsigned int a2, void (*a3)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a4, void (*a5)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a6, void (*a7)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a8, void (*a9)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a10, void (*a11)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a12, void (*a13)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a14, void (*a15)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a16, void (*a17)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a18, void (*a19)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a20,void (*a21)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *),void *a22)
{
  if (!*((unsigned char *)this + 2148))
  {
    puts("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - Invalid streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  if (*((unsigned char *)this + 248 * a2 + 256))
  {
    printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - already streaming on streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  v65 = (char *)this + 248 * a2;
  uint64_t v31 = a2;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    uint64_t v33 = Mutable;
    v34 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v34)
    {
      v35 = v34;
      value[0] = _NSConcreteStackBlock;
      value[1] = 0x40000000;
      value[2] = sub_100006D30;
      value[3] = &unk_100018678;
      unsigned int v86 = a2;
      value[4] = a3;
      value[5] = a4;
      CFDictionarySetValue(v34, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, value);
      CFDictionarySetValue(v35, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_1000186B8);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_PrimaryScaler, v35);
      CFRelease(v35);
    }
    v36 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v36)
    {
      v37 = v36;
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 0x40000000;
      v83[2] = sub_100006DA8;
      v83[3] = &unk_1000186D8;
      unsigned int v84 = a2;
      v83[4] = a5;
      v83[5] = a6;
      CFDictionarySetValue(v36, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v83);
      CFDictionarySetValue(v37, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100018718);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_SecondaryScaler, v37);
      CFRelease(v37);
    }
    v38 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v38)
    {
      v39 = v38;
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 0x40000000;
      v81[2] = sub_100006E20;
      v81[3] = &unk_100018738;
      unsigned int v82 = a2;
      v81[4] = a7;
      v81[5] = a8;
      CFDictionarySetValue(v38, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v81);
      CFDictionarySetValue(v39, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100018778);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_IntermediateTap, v39);
      CFRelease(v39);
    }
    if (a9)
    {
      pthread_attr_t v40 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v40)
      {
        v41 = v40;
        v79[0] = _NSConcreteStackBlock;
        v79[1] = 0x40000000;
        v79[2] = sub_100006E98;
        v79[3] = &unk_100018798;
        unsigned int v80 = a2;
        v79[4] = a9;
        v79[5] = a10;
        CFDictionarySetValue(v40, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v79);
        CFDictionarySetValue(v41, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_1000187D8);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImage, v41);
        CFRelease(v41);
      }
    }
    if (a11)
    {
      v42 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v42)
      {
        v43 = v42;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 0x40000000;
        v77[2] = sub_100006F10;
        v77[3] = &unk_1000187F8;
        unsigned int v78 = a2;
        v77[4] = a11;
        v77[5] = a12;
        CFDictionarySetValue(v42, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v77);
        CFDictionarySetValue(v43, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100018838);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImageIntermediateTap, v43);
        CFRelease(v43);
      }
    }
    if (a13)
    {
      v44 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v44)
      {
        v45 = v44;
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 0x40000000;
        v75[2] = sub_100006F88;
        v75[3] = &unk_100018858;
        unsigned int v76 = a2;
        v75[4] = a13;
        v75[5] = a14;
        CFDictionarySetValue(v44, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v75);
        CFDictionarySetValue(v45, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100018898);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_Depth, v45);
        CFRelease(v45);
      }
    }
    if (a15)
    {
      v46 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v46)
      {
        v47 = v46;
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 0x40000000;
        v73[2] = sub_100007000;
        v73[3] = &unk_1000188B8;
        unsigned int v74 = a2;
        v73[4] = a15;
        v73[5] = a16;
        CFDictionarySetValue(v46, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v73);
        CFDictionarySetValue(v47, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_1000188F8);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_Raw, v47);
        CFRelease(v47);
      }
    }
    if (a17)
    {
      v48 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v48)
      {
        v49 = v48;
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 0x40000000;
        v71[2] = sub_100007078;
        v71[3] = &unk_100018918;
        unsigned int v72 = a2;
        v71[4] = a17;
        v71[5] = a18;
        CFDictionarySetValue(v48, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v71);
        CFDictionarySetValue(v49, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100018958);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImageRaw, v49);
        CFRelease(v49);
      }
    }
    if (a19)
    {
      v50 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v50)
      {
        v51 = v50;
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 0x40000000;
        v69[2] = sub_1000070F0;
        v69[3] = &unk_100018978;
        unsigned int v70 = a2;
        v69[4] = a19;
        v69[5] = a20;
        CFDictionarySetValue(v50, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v69);
        CFDictionarySetValue(v51, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_1000189B8);
        CFDictionarySetValue(v33, @"VisPipe", v51);
        CFRelease(v51);
      }
    }
    if (a21)
    {
      v52 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v52)
      {
        v53 = v52;
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 0x40000000;
        v67[2] = sub_100007168;
        v67[3] = &unk_1000189D8;
        unsigned int v68 = a2;
        v67[4] = a21;
        v67[5] = a22;
        CFDictionarySetValue(v52, kFigCaptureStreamVideoOutputHandlerKey_DataBufferHandler, v67);
        CFDictionarySetValue(v53, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100018A18);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_PointCloud, v53);
        CFRelease(v53);
      }
    }
    int v54 = HxISPCaptureDeviceController::SetStreamProperty(this, a2, kFigCaptureStreamProperty_VideoOutputHandlers, v33);
    if (v54) {
      printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - error setting VideoOutputHandlers: %d\n", v54);
    }
    CFRelease(v33);
    uint64_t v31 = a2;
  }
  v55 = (char *)this + 248 * v31;
  *((void *)v55 + 30) = 0;
  *((void *)v55 + 31) = 0;
  obuint64_t j = 0;
  v56 = (uint64_t *)((char *)this + 8 * v31 + 16);
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  uint64_t v58 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v58) {
    uint64_t v59 = v58;
  }
  else {
    uint64_t v59 = 0;
  }
  v60 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(v59 + 48);
  if (!v60) {
    return 4294954514;
  }
  uint64_t result = v60(FigBaseObject, kFigCaptureStreamProperty_FormatDescription, kCFAllocatorDefault, &obj);
  if (result) {
    return result;
  }
  CFShow(obj);
  CFRelease(obj);
  obuint64_t j = 0;
  uint64_t v61 = *v56;
  uint64_t v62 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v63 = v62 ? v62 : 0;
  v64 = *(uint64_t (**)(uint64_t))(v63 + 8);
  if (!v64) {
    return 4294954514;
  }
  uint64_t result = v64(v61);
  if (!result) {
    v65[256] = 1;
  }
  return result;
}

uint64_t sub_100006D30(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100006D7C(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (primaryScaler), event=%d\n", a2);
}

uint64_t sub_100006DA8(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100006DF4(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (secondaryScaler), event=%d\n", a2);
}

uint64_t sub_100006E20(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100006E6C(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (intermediateTap), event=%d\n", a2);
}

uint64_t sub_100006E98(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100006EE4(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImage), event=%d\n", a2);
}

uint64_t sub_100006F10(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100006F5C(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImageIntermediateTap), event=%d\n", a2);
}

uint64_t sub_100006F88(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100006FD4(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (depth), event=%d\n", a2);
}

uint64_t sub_100007000(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_10000704C(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (raw), event=%d\n", a2);
}

uint64_t sub_100007078(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_1000070C4(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImageRaw), event=%d\n", a2);
}

uint64_t sub_1000070F0(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_10000713C(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (visPipe), event=%d\n", a2);
}

uint64_t sub_100007168(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_1000071B4(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (data), event=%d\n", a2);
}

uint64_t HxISPCaptureDeviceController::SetStreamProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, const __CFBoolean *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    uint64_t v11 = "Error: HxISPCaptureDeviceController::startReceive - No CM plug-in";
LABEL_7:
    puts(v11);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    uint64_t v11 = "Error: HxISPCaptureDeviceController::SetStreamProperty - Invalid stream index";
    goto LABEL_7;
  }
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v13 = *(uint64_t (**)(uint64_t, const __CFString *, const __CFBoolean *))(v10 + 56);
  if (!v13) {
    return 4294954514;
  }
  uint64_t result = v13(FigBaseObject, a3, a4);
  if (!result)
  {
    uint64_t result = CFEqual(a3, kFigCaptureStreamProperty_MultipleOutputSupportEnabled);
    if (result)
    {
      uint64_t result = CFBooleanGetValue(a4);
      int v14 = (char *)this + 248 * a2 + 273;
      if (result)
      {
        uint64_t result = 0;
        unsigned char *v14 = 1;
      }
      else
      {
        unsigned char *v14 = 0;
      }
    }
  }
  return result;
}

uint64_t HxISPCaptureDeviceController::SetDeviceProperty(HxISPCaptureDeviceController *this, const __CFString *a2, const void *a3)
{
  if (*((unsigned char *)this + 2148))
  {
    uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v9 = *(uint64_t (**)(uint64_t, const __CFString *, const void *))(v7 + 56);
    if (v9)
    {
      return v9(FigBaseObject, a2, a3);
    }
    else
    {
      return 4294954514;
    }
  }
  else
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
}

uint64_t HxISPCaptureDeviceController::CopyDeviceProperty(HxISPCaptureDeviceController *this, const __CFString *a2, void *a3)
{
  if (*((unsigned char *)this + 2148))
  {
    uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v9 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(v7 + 48);
    if (v9)
    {
      return v9(FigBaseObject, a2, kCFAllocatorDefault, a3);
    }
    else
    {
      return 4294954514;
    }
  }
  else
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
}

uint64_t HxISPCaptureDeviceController::CopyStreamProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, void *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    uint64_t v9 = "Error: HxISPCaptureDeviceController::startReceive - No CM plug-in";
LABEL_7:
    puts(v9);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    uint64_t v9 = "Error: HxISPCaptureDeviceController::CopyStreamProperty - Invalid stream index";
    goto LABEL_7;
  }
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v11 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(v8 + 48);
  if (!v11) {
    return 4294954514;
  }

  return v11(FigBaseObject, a3, kCFAllocatorDefault, a4);
}

uint64_t HxISPCaptureDeviceController::SetGroupProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, const void *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    unint64_t v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - No CM plug-in";
LABEL_15:
    puts(v15);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    unint64_t v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - Invalid stream index";
    goto LABEL_15;
  }
  if (*((_DWORD *)this + 536))
  {
    uint64_t v7 = 0;
    uint64_t v8 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
    uint64_t v9 = (const void **)((char *)this + 8 * a2 + 16);
    while (1)
    {
      CFArrayRef theArray = 0;
      uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v12 = v11 ? v11 : 0;
      uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(v12 + 48);
      if (!v13 || v13(FigBaseObject, v8, kCFAllocatorDefault, &theArray)) {
        break;
      }
      CFArrayRef v14 = theArray;
      v22.length = CFArrayGetCount(theArray);
      v22.location = 0;
      CFArrayContainsValue(v14, v22, *v9);
      CFRelease(theArray);
      if (++v7 >= (unint64_t)*((unsigned int *)this + 536)) {
        goto LABEL_16;
      }
    }
    unint64_t v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - Unable to locate synchronized stream group for stream";
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v17 = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
  uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = *(uint64_t (**)(uint64_t, const __CFString *, const void *))(v19 + 56);
  if (v20) {
    return v20(v17, a3, a4);
  }
  else {
    return 4294954514;
  }
}

uint64_t HxISPCaptureDeviceController::CopyGroupProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, void *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    unint64_t v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - No CM plug-in";
LABEL_15:
    puts(v15);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    unint64_t v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - Invalid stream index";
    goto LABEL_15;
  }
  if (*((_DWORD *)this + 536))
  {
    uint64_t v7 = 0;
    uint64_t v8 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
    uint64_t v9 = (const void **)((char *)this + 8 * a2 + 16);
    while (1)
    {
      CFArrayRef theArray = 0;
      uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v12 = v11 ? v11 : 0;
      uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(v12 + 48);
      if (!v13 || v13(FigBaseObject, v8, kCFAllocatorDefault, &theArray)) {
        break;
      }
      CFArrayRef v14 = theArray;
      v22.length = CFArrayGetCount(theArray);
      v22.location = 0;
      CFArrayContainsValue(v14, v22, *v9);
      CFRelease(theArray);
      if (++v7 >= (unint64_t)*((unsigned int *)this + 536)) {
        goto LABEL_16;
      }
    }
    unint64_t v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - Unable to locate synchronized stream group for stream";
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v17 = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
  uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(v19 + 48);
  if (v20) {
    return v20(v17, a3, kCFAllocatorDefault, a4);
  }
  else {
    return 4294954514;
  }
}

uint64_t sub_100007AD8(const char *a1, const char *a2, uint64_t a3)
{
  uint64_t v5 = dlopen(a1, 4);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (uint64_t (*)(const CFAllocatorRef, void, uint64_t))dlsym(v5, a2);
  if (!v6) {
    return 0;
  }

  return v6(kCFAllocatorDefault, 0, a3);
}

void DeviceCMInterface::DeviceCMInterface(DeviceCMInterface *this)
{
  this->var4.var5 = 0;
  this->var0 = -1;
  *(_WORD *)&this->var4.var0 = 0;
  this->var4.var2 = 0;
  this->var4.var3 = 0;
  this->var4.var4 = 0;
  this->var5.var0 = 1;
  *(_DWORD *)&this->var5.var1 = 0;
  *(void *)&this->var5.var4 = 0xFFFFFFFF00000000;
  *(void *)&this->var3.var0 = -1;
  *(void *)&this->var3.var2 = -1;
  *(void *)&this->var3.var4 = -1;
  *(_WORD *)&this->var7 = 0;
  this->var1 = 0;
  this->var2 = 0;
}

{
  this->var4.var5 = 0;
  this->var0 = -1;
  *(_WORD *)&this->var4.var0 = 0;
  this->var4.var2 = 0;
  this->var4.var3 = 0;
  this->var4.var4 = 0;
  this->var5.var0 = 1;
  *(_DWORD *)&this->var5.var1 = 0;
  *(void *)&this->var5.var4 = 0xFFFFFFFF00000000;
  *(void *)&this->var3.var0 = -1;
  *(void *)&this->var3.var2 = -1;
  *(void *)&this->var3.var4 = -1;
  *(_WORD *)&this->var7 = 0;
  this->var1 = 0;
  this->var2 = 0;
}

DeviceCMInterface *DeviceCMInterface::resetMembers(DeviceCMInterface *this)
{
  this->var0 = -1;
  *(_WORD *)&this->var4.var0 = 0;
  this->var4.var2 = 0;
  this->var4.var3 = 0;
  this->var4.var4 = 0;
  this->var5.var0 = 1;
  *(_DWORD *)&this->var5.var1 = 0;
  *(void *)&this->var5.var4 = 0xFFFFFFFF00000000;
  *(void *)&this->var3.var0 = -1;
  *(void *)&this->var3.var2 = -1;
  *(void *)&this->var3.var4 = -1;
  *(_WORD *)&this->var7 = 0;
  this->var1 = 0;
  this->var2 = 0;
  return this;
}

HxISPCaptureDeviceController *DeviceCMInterface::releaseInterface(DeviceCMInterface *this)
{
  uint64_t result = this->var2;
  if (result)
  {
    HxISPCaptureDeviceController::deactivate(result);
    uint64_t result = this->var2;
    if (result)
    {
      HxISPCaptureDeviceController::~HxISPCaptureDeviceController(result);
      operator delete();
    }
  }
  this->var0 = -1;
  *(_WORD *)&this->var4.var0 = 0;
  this->var4.var2 = 0;
  this->var4.var3 = 0;
  this->var4.var4 = 0;
  this->var5.var0 = 1;
  *(_DWORD *)&this->var5.var1 = 0;
  *(void *)&this->var5.var4 = 0xFFFFFFFF00000000;
  *(void *)&this->var3.var0 = -1;
  *(void *)&this->var3.var2 = -1;
  *(void *)&this->var3.var4 = -1;
  *(_WORD *)&this->var7 = 0;
  this->var1 = 0;
  this->var2 = 0;
  return result;
}

void DeviceCMInterface::~DeviceCMInterface(DeviceCMInterface *this)
{
}

void DeviceCMInterface::initAndActivateCaptureDeviceController(DeviceCMInterface *this)
{
}

void sub_100007DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setSWConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 40), a2);
}

uint64_t DeviceCMInterface::setRgbConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a2 & 0x80000000) != 0 || (CMBufferRef v3 = *(HxISPCaptureDeviceController **)(a1 + 16)) == 0)
  {
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v13 = [v12 lastPathComponent];
    CFArrayRef v14 = +[NSString stringWithFormat:@"error bad streamID of %d ", a2];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v13, 164, v14);

    return 3758097084;
  }
  uint64_t v5 = *(unsigned int *)(a3 + 44);
  if (v5 == -1)
  {
    id v78 = 0;
    uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(v3, a2, kFigCaptureStreamProperty_SupportedFormatsArray, &v78);
    if (v7)
    {
      id obja = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      unint64_t v15 = [obja lastPathComponent];
      unint64_t v16 = DeviceCMInterface::getErrorInformationString(v7);
      uint64_t v17 = +[NSString stringWithFormat:@"error %d failed to get sw stream supported formats %@", v7, v16];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v15, 175, v17);

      return (uint64_t)v7;
    }
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    obuint64_t j = v78;
    id v31 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
    if (v31)
    {
      int v32 = -1;
      uint64_t v72 = *(void *)v75;
      while (2)
      {
        uint64_t v33 = 0;
        int v67 = v32 + v31;
        int v68 = v32;
        do
        {
          if (*(void *)v75 != v72) {
            objc_enumerationMutation(obj);
          }
          v34 = *(void **)(*((void *)&v74 + 1) + 8 * (void)v33);
          v35 = [v34 valueForKey:@"VideoIsBinned"];
          unsigned int v36 = [v35 BOOLValue];

          v37 = [v34 valueForKey:@"SensorWidth"];
          unsigned int v38 = [v37 integerValue];

          v39 = [v34 valueForKey:@"SensorHeight"];
          unsigned int v40 = [v39 integerValue];

          v41 = [v34 valueForKey:@"SupportedOutputs"];
          v42 = [v41 valueForKey:@"PrimaryScaler"];
          v43 = [v42 valueForKey:@"DefaultCropRect"];
          v44 = [v43 valueForKey:@"X"];
          [v44 floatValue];
          float v46 = v45;

          v47 = [v43 valueForKey:@"Y"];
          [v47 floatValue];
          float v49 = v48;

          v50 = [v43 valueForKey:@"Width"];
          [v50 floatValue];
          float v52 = v51;

          v53 = [v43 valueForKey:@"Height"];
          [v53 floatValue];
          float v55 = v54;

          BOOL v58 = *(unsigned __int8 *)(a3 + 40) != v36 || *(_DWORD *)a3 != v38 || *(_DWORD *)(a3 + 4) != v40;
          if (*(double *)(a3 + 8) != v46) {
            BOOL v58 = 1;
          }
          if (*(double *)(a3 + 16) != v49) {
            BOOL v58 = 1;
          }
          if (*(double *)(a3 + 24) != v52) {
            BOOL v58 = 1;
          }
          char v59 = *(double *)(a3 + 32) != v55 || v58;

          if ((v59 & 1) == 0)
          {
            uint64_t v5 = (v68 + v33 + 1);
            goto LABEL_47;
          }
          uint64_t v33 = (char *)v33 + 1;
        }
        while (v31 != v33);
        id v31 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
        int v32 = v67;
        if (v31) {
          continue;
        }
        break;
      }
      uint64_t v5 = 0xFFFFFFFFLL;
LABEL_47:

      if (v5 != -1)
      {
        CMBufferRef v3 = *(HxISPCaptureDeviceController **)(a1 + 16);
        goto LABEL_4;
      }
    }
    else
    {
    }
    v60 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v61 = [v60 lastPathComponent];
    uint64_t v62 = DeviceCMInterface::getErrorInformationString(0);
    uint64_t v63 = +[NSString stringWithFormat:@"error %d failed to find cam required format, %@", 0, v62];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v61, 216, v63);

    return 0;
  }
LABEL_4:
  uint64_t v6 = +[NSNumber numberWithInt:v5];
  uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(v3, a2, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)v6);
  if (!v7)
  {
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    if (*(_DWORD *)(a3 + 52))
    {
      uint64_t v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [v18 setValue:v19 forKey:kFigCaptureStreamVideoOutputConfigurationKey_Height];
    }
    if (*(_DWORD *)(a3 + 48))
    {
      uint64_t v20 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [v18 setValue:v20 forKey:kFigCaptureStreamVideoOutputConfigurationKey_Width];
    }
    double v21 = *(double *)(a3 + 80);
    if (v21 != 0.0)
    {
      uint64_t v22 = *(void *)(a3 + 56);
      uint64_t v23 = *(void *)(a3 + 64);
      uint64_t v24 = *(void *)(a3 + 72);
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(&v21 - 3));
      [v18 setValue:DictionaryRepresentation forKey:kFigCaptureStreamVideoOutputConfigurationKey_CropRect];
    }
    if ([v18 count])
    {
      uint64_t v79 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
      id v80 = v18;
      CFBooleanRef v26 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
      uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_VideoOutputConfigurations, v26);
      if (v7)
      {
        uint64_t v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v28 = [v27 lastPathComponent];
        v29 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = +[NSString stringWithFormat:@"error %d failed to video configuration, %@", v7, v29];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v28, 243, v30);
        goto LABEL_18;
      }
    }
    if (*(_DWORD *)(a3 + 100))
    {
      uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_ContinuousAutoFocusNow, 0);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        v29 = +[NSString stringWithFormat:@"error %d failed to set auto focus, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 251, v29);
        goto LABEL_66;
      }
      uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_AutoFocusPositionSensorMode, (const __CFBoolean *)&off_10001ABC8);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        v29 = +[NSString stringWithFormat:@"error %d failed to set auto focus pos, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 257, v29);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 92))
    {
      v64 = *(HxISPCaptureDeviceController **)(a1 + 16);
      v65 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(v64, a2, kFigCaptureStreamProperty_MaxIntegrationTime, (const __CFBoolean *)v65);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        v29 = +[NSString stringWithFormat:@"error %d failed to set max integrtion time, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 265, v29);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 104))
    {
      uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_UnlockAENow, (const __CFBoolean *)&__kCFBooleanTrue);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        v29 = +[NSString stringWithFormat:@"error %d failed to set unlock auto expsosure now, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 274, v29);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 96))
    {
      uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_SphereMode, kFigCaptureStreamSphereMode_Lock);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        v29 = +[NSString stringWithFormat:@"error %d failed to set SphereMode, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 283, v29);
        goto LABEL_66;
      }
    }
    if (!*(_DWORD *)(a3 + 88))
    {
      uint64_t v7 = 0;
      goto LABEL_68;
    }
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    CFBooleanRef v26 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_MaximumFrameRate, v26);
    if (!v7)
    {
LABEL_67:

LABEL_68:
      return (uint64_t)v7;
    }
    uint64_t v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v28 = [v27 lastPathComponent];
    v29 = DeviceCMInterface::getErrorInformationString(v7);
    v30 = +[NSString stringWithFormat:@"error %d failed to set auto focus, %@", v7, v29];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v28, 292, v30);
LABEL_18:

LABEL_66:
    goto LABEL_67;
  }
  uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v9 = [v8 lastPathComponent];
  uint64_t v10 = DeviceCMInterface::getErrorInformationString(v7);
  uint64_t v11 = +[NSString stringWithFormat:@"error %d failed to set sw format index, %@", v7, v10];
  NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 222, v11);

  return (uint64_t)v7;
}

void sub_1000089FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setWConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 28), a2);
}

uint64_t DeviceCMInterface::setFrontConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 32), a2);
}

const __CFString *DeviceCMInterface::getErrorInformationString(DeviceCMInterface *this)
{
  if ((int)this > -12789)
  {
    switch(this)
    {
      case 0xFFFFCE0C:
        CFStringRef result = @"base object error unsupported protocol";
        break;
      case 0xFFFFCE0D:
        CFStringRef result = @"base object error property not supported";
        break;
      case 0xFFFFCE0E:
        CFStringRef result = @"base object error allocation failed";
        break;
      case 0xFFFFCE0F:
        CFStringRef result = @"base object error invalidated";
        break;
      case 0xFFFFCE10:
        CFStringRef result = @"base object error property not found";
        break;
      case 0xFFFFCE11:
        CFStringRef result = @"base object error value not available";
        break;
      case 0xFFFFCE12:
        CFStringRef result = @"base object error unsupported operation";
        break;
      case 0xFFFFCE13:
        CFStringRef result = @"base object error unsupported version";
        break;
      case 0xFFFFCE14:
        CFStringRef result = @"base object error parameter error";
        break;
      default:
        if (this) {
LABEL_10:
        }
          CFStringRef result = @"Unknown error information";
        else {
          CFStringRef result = @"OK";
        }
        break;
    }
  }
  else
  {
    switch(this)
    {
      case 0xE00002BC:
        CFStringRef result = @"general error";
        break;
      case 0xE00002BD:
        CFStringRef result = @"can't allocate memory";
        break;
      case 0xE00002BE:
        CFStringRef result = @"resource shortage";
        break;
      case 0xE00002BF:
        CFStringRef result = @"error during IPC";
        break;
      case 0xE00002C0:
        CFStringRef result = @"no such device";
        break;
      case 0xE00002C1:
        CFStringRef result = @"privilege violation";
        break;
      case 0xE00002C2:
        CFStringRef result = @"invalid argument";
        break;
      case 0xE00002C3:
        CFStringRef result = @"device read locked";
        break;
      case 0xE00002C4:
        CFStringRef result = @"device write locked";
        break;
      case 0xE00002C5:
        CFStringRef result = @"exclusive access and";
        break;
      case 0xE00002C6:
        CFStringRef result = @"sent/received messages";
        break;
      case 0xE00002C7:
        CFStringRef result = @"unsupported function";
        break;
      case 0xE00002C8:
        CFStringRef result = @"misc. VM failure";
        break;
      case 0xE00002C9:
        CFStringRef result = @"internal error";
        break;
      case 0xE00002CA:
        CFStringRef result = @"General I/O error";
        break;
      case 0xE00002CB:
      case 0xE00002DC:
        goto LABEL_10;
      case 0xE00002CC:
        CFStringRef result = @"can't acquire lock";
        break;
      case 0xE00002CD:
        CFStringRef result = @"device not open";
        break;
      case 0xE00002CE:
        CFStringRef result = @"read not supported";
        break;
      case 0xE00002CF:
        CFStringRef result = @"write not supported";
        break;
      case 0xE00002D0:
        CFStringRef result = @"alignment error";
        break;
      case 0xE00002D1:
        CFStringRef result = @"Media Error";
        break;
      case 0xE00002D2:
        CFStringRef result = @"device(s) still open";
        break;
      case 0xE00002D3:
        CFStringRef result = @"rld failure";
        break;
      case 0xE00002D4:
        CFStringRef result = @"DMA failure";
        break;
      case 0xE00002D5:
        CFStringRef result = @"Device Busy";
        break;
      case 0xE00002D6:
        CFStringRef result = @"I/O Timeout";
        break;
      case 0xE00002D7:
        CFStringRef result = @"device offline";
        break;
      case 0xE00002D8:
        CFStringRef result = @"not ready";
        break;
      case 0xE00002D9:
        CFStringRef result = @"device not attached";
        break;
      case 0xE00002DA:
        CFStringRef result = @"no DMA channels left";
        break;
      case 0xE00002DB:
        CFStringRef result = @"no space for data";
        break;
      case 0xE00002DD:
        CFStringRef result = @"port already exists";
        break;
      case 0xE00002DE:
        CFStringRef result = @"can't wire down";
        break;
      case 0xE00002DF:
        CFStringRef result = @"no interrupt attached";
        break;
      case 0xE00002E0:
        CFStringRef result = @"no DMA frames enqueued";
        break;
      case 0xE00002E1:
        CFStringRef result = @"oversized msg received";
        break;
      case 0xE00002E2:
        CFStringRef result = @"not permitted";
        break;
      case 0xE00002E3:
        CFStringRef result = @"no power to device";
        break;
      case 0xE00002E4:
        CFStringRef result = @"media not present";
        break;
      case 0xE00002E5:
        CFStringRef result = @"media not formatted";
        break;
      case 0xE00002E6:
        CFStringRef result = @"no such mode";
        break;
      case 0xE00002E7:
        CFStringRef result = @"data underrun";
        break;
      case 0xE00002E8:
        CFStringRef result = @"data overrun";
        break;
      case 0xE00002E9:
        CFStringRef result = @"the device is not working properly!";
        break;
      case 0xE00002EA:
        CFStringRef result = @"a completion routine is required";
        break;
      case 0xE00002EB:
        CFStringRef result = @"operation aborted";
        break;
      case 0xE00002EC:
        CFStringRef result = @"bus bandwidth would be exceeded";
        break;
      case 0xE00002ED:
        CFStringRef result = @"device not responding";
        break;
      case 0xE00002EE:
        CFStringRef result = @"isochronous I/O request for distant past!";
        break;
      case 0xE00002EF:
        CFStringRef result = @"isochronous I/O request for distant future";
        break;
      case 0xE00002F0:
        CFStringRef result = @"data was not found";
        break;
      default:
        if (this != -536870911) {
          goto LABEL_10;
        }
        CFStringRef result = @"should never be seen";
        break;
    }
  }
  return result;
}

DeviceCMInterface *DeviceCMInterface::enableJasperRgbVideo(DeviceCMInterface *this)
{
  if (this->var5.var2)
  {
    uint64_t v2 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->var3.var1);
    if (v2)
    {
      CMBufferRef v3 = (DeviceCMInterface *)v2;
      long long v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      uint64_t v6 = DeviceCMInterface::getErrorInformationString(v3);
      uint64_t v7 = +[NSString stringWithFormat:@"enable wide stream failed with %d, %@", v3, v6];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 306, v7);
LABEL_7:

LABEL_10:
      return v3;
    }
  }
  if (this->var5.var1)
  {
    uint64_t v8 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->var3.var4);
    if (v8)
    {
      CMBufferRef v3 = (DeviceCMInterface *)v8;
      long long v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      uint64_t v6 = DeviceCMInterface::getErrorInformationString(v3);
      uint64_t v7 = +[NSString stringWithFormat:@"enable wide stream failed with %d, %@", v3, v6];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 315, v7);
      goto LABEL_7;
    }
  }
  CMBufferRef v3 = (DeviceCMInterface *)DeviceCMInterface::enableJasperPointCloudOutput(this);
  if (v3)
  {
    long long v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v5 = [v4 lastPathComponent];
    uint64_t v6 = +[NSString stringWithFormat:@"failed to enable outputs"];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 323, v6);
    goto LABEL_10;
  }
  return v3;
}

void sub_100009330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableRGBOutputForStreamId(DeviceCMInterface *this, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0 || !this->var2)
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t v9 = +[NSString stringWithFormat:@"enableRGBOutputForStreamId failed, stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 885, v9);
    uint64_t v6 = 3758097129;

    return v6;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 0;
  }
  uint64_t v5 = Mutable;
  CFDictionarySetValue(Mutable, kFigCaptureStreamVideoOutputID_PrimaryScaler, kCFBooleanTrue);
  if (!HxISPCaptureDeviceController::SetStreamProperty(this->var2, a2, kFigCaptureStreamProperty_VideoOutputsEnabled, v5))
  {
    CFRelease(v5);
    return 0;
  }
  return 3758097129;
}

void sub_1000094B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableJasperPointCloudOutput(DeviceCMInterface *this)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFBooleanRef v3 = Mutable;
    CFDictionarySetValue(Mutable, kFigCaptureStreamVideoOutputID_PointCloud, kCFBooleanTrue);
    uint64_t v4 = HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, kFigCaptureStreamProperty_VideoOutputsEnabled, v3);
    if (v4)
    {
      uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v6 = [v5 lastPathComponent];
      uint64_t v7 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v4);
      uint64_t v8 = +[NSString stringWithFormat:@"enableJasperOutput failed with OSStatus 0x%x, %@", v4, v7];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 945, v8);

      return 3758097129;
    }
    else
    {
      CFRelease(v3);
    }
  }
  else
  {
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v10 = [v9 lastPathComponent];
    uint64_t v11 = +[NSString stringWithFormat:@"fail to create output enable dictionary for pointcloud output"];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v10, 954, v11);
    uint64_t v4 = 3758097084;
  }
  return v4;
}

void sub_10000969C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::configJasperRgbMultiStream(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  uint64_t v2 = 3758097126;
  if (!a2->var3 && a2->var0)
  {
    if (this->var3.var5 == -1)
    {
      unint64_t v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      unint64_t v16 = [v15 lastPathComponent];
      uint64_t v17 = +[NSString stringWithFormat:@"no jasper id detected"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 339, v17);

      return 3758097088;
    }
    int var4 = a2->var4;
    if (var4 == 16 || var4 == 8)
    {
      uint64_t v35 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      unsigned int v36 = &off_10001ABE0;
      CFBooleanRef v8 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      uint64_t v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, kFigCaptureStreamProperty_TimeOfFlightConfiguration, v8);
      if (v9)
      {
        uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v11 = [v10 lastPathComponent];
        uint64_t var5 = this->var3.var5;
        uint64_t v13 = DeviceCMInterface::getErrorInformationString(v9);
        CFArrayRef v14 = +[NSString stringWithFormat:@"setting property kFigCaptureStreamProperty_TimeOfFlightConfiguration failed with OSStatus 0x%x for stream id %d (%@)", v9, var5, v13];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 356, v14);

LABEL_13:
        uint64_t v2 = (uint64_t)v9;
LABEL_14:

        return v2;
      }
      this->var10 = 1;
      this->var5.var0 = 1;
      BOOL var2 = a2->var2;
      if (!a2->var1 && !a2->var2) {
        goto LABEL_14;
      }
      if (a2->var1)
      {
        uint64_t v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->var3.var4, 1);
        if (v9)
        {
          uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
          uint64_t v11 = [v10 lastPathComponent];
          uint64_t v20 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb sw failed"];
          NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 369, v20);

          goto LABEL_13;
        }
        BOOL var2 = a2->var2;
      }
      if (var2
        && (uint64_t v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->var3.var1, 1), v9))
      {
        uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v11 = [v10 lastPathComponent];
        double v21 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb w failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 378, v21);
      }
      else
      {
        uint64_t v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->var3.var5, 1);
        if (v9)
        {
          uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
          uint64_t v11 = [v10 lastPathComponent];
          uint64_t v22 = +[NSString stringWithFormat:@"faile to enable jasper multi output mode"];
          NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 387, v22);
        }
        else
        {
          uint64_t v23 = (char *)this->var2 + 16;
          uint64_t v24 = *(void *)&v23[8 * this->var3.var4];
          uint64_t v25 = *(void *)&v23[8 * this->var3.var1];
          uint64_t v26 = *(void *)&v23[8 * this->var3.var5];
          id v27 = objc_alloc_init((Class)NSMutableArray);
          uint64_t v11 = v27;
          if (a2->var2) {
            [v27 addObject:v25];
          }
          if (a2->var1) {
            [v11 addObject:v24];
          }
          if (a2->var0) {
            [v11 addObject:v26];
          }
          uint64_t v33 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveUnsynchronizedStreams;
          v34 = v11;
          uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
          uint64_t v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->var2, kFigCaptureDeviceProperty_MultiCamConfiguration, v10);
          if (v9)
          {
            v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
            v29 = [v28 lastPathComponent];
            uint64_t v30 = this->var3.var5;
            id v31 = DeviceCMInterface::getErrorInformationString(v9);
            int v32 = +[NSString stringWithFormat:@"enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)", v9, v30, v31];
            NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v29, 408, v32);
          }
          else
          {
            this->uint64_t var5 = *a2;
          }
        }
      }
      goto LABEL_13;
    }
  }
  return v2;
}

void sub_100009BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setJasperRGBSuperWideMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->var3.var4, 1);
}

uint64_t DeviceCMInterface::setJasperRGBWideMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->var3.var1, 1);
}

uint64_t DeviceCMInterface::setJasperMultiOutModeByStreamId(DeviceCMInterface *this, uint64_t a2, int a3)
{
  BOOL var2 = this->var2;
  if (!var2)
  {
    CFBooleanRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    uint64_t v10 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 774, v10);
    uint64_t v7 = 3758097084;
    goto LABEL_10;
  }
  if (this->var3.var5 != a2 && this->var3.var4 != a2 && this->var3.var1 != a2)
  {
    CFBooleanRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    uint64_t v10 = +[NSString stringWithFormat:@"stream id %d is invalid (should be %d or %d or %d for jasper)", a2, this->var3.var5, this->var3.var4, this->var3.var1];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 780, v10);
    uint64_t v7 = 3758097090;
    goto LABEL_10;
  }
  uint64_t v6 = (const __CFBoolean **)&kCFBooleanTrue;
  if (!a3) {
    uint64_t v6 = (const __CFBoolean **)&kCFBooleanFalse;
  }
  uint64_t v7 = HxISPCaptureDeviceController::SetStreamProperty(var2, a2, kFigCaptureStreamProperty_MultipleOutputSupportEnabled, *v6);
  if (v7)
  {
    CFBooleanRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    uint64_t v10 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    uint64_t v11 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId failed, OSStatus error 0x%x (%@)", v7, v10];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 790, v11);

    uint64_t v7 = 3758097129;
LABEL_10:
  }
  return v7;
}

void sub_100009F70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setCurrentJasperConfiguration(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  this->uint64_t var5 = *a2;
  return this;
}

uint64_t DeviceCMInterface::configJasperDevice(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  *(_WORD *)&this->var9 = 0;
  this->var5.var0 = 1;
  *(_DWORD *)&this->var5.var1 = 0;
  this->var5.uint64_t var4 = 0;
  unsigned int var5 = this->var3.var5;
  if (var5 == -1)
  {
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v13 = [v12 lastPathComponent];
    CFArrayRef v14 = +[NSString stringWithFormat:@"no jasper id detected"];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v13, 424, v14);

    return 3758097088;
  }
  if (a2->var0)
  {
    CFArrayRef theArray = 0;
    uint64_t v5 = HxISPCaptureDeviceController::CopyStreamProperty(this->var2, var5, kFigCaptureStreamProperty_SupportedTimeOfFlightProjectorModes, &theArray);
    CFArrayRef v6 = theArray;
    CFArrayRef theArray = 0;
    if (v5)
    {
      uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      CFBooleanRef v8 = [v7 lastPathComponent];
      uint64_t v9 = this->var3.var5;
      uint64_t v10 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v5);
      uint64_t v11 = +[NSString stringWithFormat:@"setting property kFigCaptureStreamProperty_SupportedTimeOfFlightProjectorModes failed with OSStatus 0x%x for stream id %d (%@)", v5, v9, v10];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 441, v11);

      return v5;
    }
    unsigned int v15 = [(__CFArray *)v6 containsObject:&off_10001ABF8];
    unsigned int v16 = [(__CFArray *)v6 containsObject:&off_10001ABE0];
    if (v15)
    {
      uint64_t v76 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      long long v77 = &off_10001ABF8;
      CFBooleanRef v17 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      id v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v19 = [v18 lastPathComponent];
      uint64_t v20 = +[NSString stringWithFormat:@"NormalShortHybridMode detected"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v19, 456, v20);
    }
    else
    {
      if (!v16)
      {
        id v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v22 = [v27 lastPathComponent];
        uint64_t v23 = +[NSString stringWithFormat:@"cannot resolve projector mode"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v22, 467, v23);
        uint64_t v5 = 3758097084;
        goto LABEL_37;
      }
      uint64_t v74 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      long long v75 = &off_10001ABE0;
      CFBooleanRef v17 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      id v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v19 = [v18 lastPathComponent];
      uint64_t v20 = +[NSString stringWithFormat:@"NormalMode detected"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v19, 463, v20);
    }
    CFBooleanRef v21 = v17;

    uint64_t v5 = HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, kFigCaptureStreamProperty_TimeOfFlightConfiguration, v17);
    if (v5)
    {
      uint64_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v23 = [v22 lastPathComponent];
      uint64_t v24 = this->var3.var5;
      uint64_t v25 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v5);
      uint64_t v26 = +[NSString stringWithFormat:@"setting property kFigCaptureStreamProperty_TimeOfFlightConfiguration failed with OSStatus 0x%x for stream id %d (%@)", v5, v24, v25];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v23, 474, v26);

      id v27 = v21;
LABEL_37:

      return v5;
    }
    this->var10 = 1;
    this->var5.var0 = 1;
  }
  if (a2->var1)
  {
    uint64_t var4 = this->var3.var4;
    if (var4 == -1)
    {
      DeviceCMInterface::enumerateStreamsIndices(this);
      uint64_t var4 = this->var3.var4;
      if (var4 == -1)
      {
        float v45 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        float v46 = [v45 lastPathComponent];
        v47 = +[NSString stringWithFormat:@"no available RGB super wide stream index"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v46, 485, v47);

        return 3758097136;
      }
    }
    uint64_t v5 = DeviceCMInterface::setJasperMultiOutModeByStreamId(this, var4, 1);
    if (v5)
    {
      v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v30 = [v29 lastPathComponent];
      id v31 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb failed"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v30, 493, v31);

      return v5;
    }
    this->var9 = 1;
    if (a2->var0 && a2->var1)
    {
      BOOL var2 = this->var2;
      if (a2->var3)
      {
        if (*((_DWORD *)var2 + 536))
        {
          uint64_t v33 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
          uint64_t v34 = 260;
          do
          {
            CFArrayRef theArray = 0;
            uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
            uint64_t v36 = *(void *)(CMBaseObjectGetVTable() + 8);
            uint64_t v37 = v36 ? v36 : 0;
            unsigned int v38 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(v37 + 48);
            if (!v38 || v38(FigBaseObject, v33, kCFAllocatorDefault, &theArray)) {
              break;
            }
            CFArrayRef v39 = theArray;
            v78.length = CFArrayGetCount(theArray);
            v78.location = 0;
            if (CFArrayContainsValue(v39, v78, *((const void **)this->var2 + this->var3.var5 + 2))
              && (CFArrayRef v40 = theArray,
                  v79.length = CFArrayGetCount(theArray),
                  v79.location = 0,
                  CFArrayContainsValue(v40, v79, *((const void **)this->var2 + this->var3.var4 + 2))))
            {
              uint64_t v41 = *((void *)this->var2 + v34);
            }
            else
            {
              uint64_t v41 = 0;
            }
            CFRelease(theArray);
            if (v41) {
              goto LABEL_35;
            }
            unint64_t v42 = v34 - 259;
            ++v34;
          }
          while (v42 < *((unsigned int *)this->var2 + 536));
        }
        uint64_t v41 = 0;
LABEL_35:
        uint64_t v71 = v41;
        uint64_t v72 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveSynchronizedStreamsGroups;
        v43 = +[NSArray arrayWithObjects:&v71 count:1];
        v73 = v43;
        uint64_t v44 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      }
      else
      {
        float v48 = (char *)var2 + 16;
        uint64_t v49 = *(void *)&v48[8 * this->var3.var5];
        v68[1] = *(void *)&v48[8 * this->var3.var4];
        uint64_t v69 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveUnsynchronizedStreams;
        v68[0] = v49;
        v43 = +[NSArray arrayWithObjects:v68 count:2];
        unsigned int v70 = v43;
        uint64_t v44 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      }
      v50 = (void *)v44;

      float v51 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->var2, kFigCaptureDeviceProperty_MultiCamConfiguration, v50);
      if (v51)
      {
        float v52 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v53 = [v52 lastPathComponent];
        uint64_t v54 = this->var3.var5;
        float v55 = DeviceCMInterface::getErrorInformationString(v51);
        v56 = +[NSString stringWithFormat:@"enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)", v51, v54, v55];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v53, 542, v56);
      }
      uint64_t v5 = DeviceCMInterface::enableSWRGBOutput(this);
      if (v5)
      {
        v57 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        BOOL v58 = [v57 lastPathComponent];
        char v59 = +[NSString stringWithFormat:@"Configure the primary output to multioutput + enable failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v58, 549, v59);

        return v5;
      }
    }
  }
  uint64_t v5 = DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->var3.var5, 1);
  if (v5)
  {
    v60 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v61 = [v60 lastPathComponent];
    uint64_t v62 = +[NSString stringWithFormat:@"faile to enable jasper multi output mode"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v61, 560, v62);
  }
  else
  {
    uint64_t v5 = DeviceCMInterface::enableJasperPointCloudOutput(this);
    if (v5)
    {
      uint64_t v63 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      v64 = [v63 lastPathComponent];
      v65 = +[NSString stringWithFormat:@"failed to enable outputs"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v64, 568, v65);
    }
    else
    {
      this->unsigned int var5 = *a2;
    }
  }
  return v5;
}

void sub_10000AA18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isJasperSuperWideExist(DeviceCMInterface *this)
{
  int var4 = this->var3.var4;
  if (var4 == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    int var4 = this->var3.var4;
  }
  return var4 != -1;
}

uint64_t DeviceCMInterface::enableSWRGBOutput(DeviceCMInterface *this)
{
  uint64_t v1 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->var3.var4);
  if (v1)
  {
    uint64_t v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFBooleanRef v3 = [v2 lastPathComponent];
    uint64_t v4 = +[NSString stringWithFormat:@"enableRGBOutput failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 926, v4);
  }
  return v1;
}

void sub_10000AD28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::requestControlOfStreams(DeviceCMInterface *this, int a2, useconds_t a3)
{
  if (this->var2)
  {
    if (a2)
    {
      uint64_t v30 = kFigCaptureDeviceRequestControlOfStreamsOptionsKey_ClientPriority;
      id v31 = &off_10001ABF8;
      uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      CFArrayRef v6 = [v5 lastPathComponent];
      uint64_t v7 = +[NSString stringWithFormat:@"request control on high priority"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 592, v7);

      v29 = (__CFDictionary *)v4;
    }
    else
    {
      v29 = 0;
    }
    uint64_t v12 = 1;
    while (1)
    {
      uint64_t v13 = HxISPCaptureDeviceController::RequestStreams(this->var2, *((const __CFArray **)this->var2 + 1), v29);
      CFArrayRef v14 = (DeviceCMInterface *)v13;
      if (v13 != -12681) {
        break;
      }
      unsigned int v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      unsigned int v16 = [v15 lastPathComponent];
      CFBooleanRef v17 = +[NSString stringWithFormat:@"requestControlOfStreamscontrol - controlled by another client. %d/%d", v12, 10];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 600, v17);

      usleep(0x7A120u);
      uint64_t v12 = (v12 + 1);
      if (v12 == 11) {
        goto LABEL_17;
      }
    }
    if (v13 != -12782 && v13 != 0)
    {
LABEL_17:
      uint64_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v23 = [v22 lastPathComponent];
      uint64_t v24 = DeviceCMInterface::getErrorInformationString(v14);
      uint64_t v25 = +[NSString stringWithFormat:@"requestControlOfStreamscontrol failed, OSStatus error 0x%x, %@", v14, v24];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v23, 614, v25);

      uint64_t v11 = 3758097129;
      goto LABEL_18;
    }
    if (a2)
    {
      uint64_t v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v20 = [v19 lastPathComponent];
      CFBooleanRef v21 = +[NSString stringWithFormat:@"waiting for preempted client to terminate for %.2f sec...", (double)a3 / 1000000.0];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v20, 621, v21);

      usleep(a3);
      uint64_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v23 = [v22 lastPathComponent];
      uint64_t v24 = +[NSString stringWithFormat:@"done waiting"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v23, 623, v24);
      uint64_t v11 = 0;
LABEL_18:

      goto LABEL_20;
    }
    uint64_t v11 = 0;
LABEL_20:
  }
  else
  {
    CFBooleanRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    uint64_t v10 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 584, v10);
    uint64_t v11 = 3758097084;
  }
  return v11;
}

void sub_10000B190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::releaseControlOfStreams(DeviceCMInterface *this)
{
  BOOL var2 = this->var2;
  if (!var2)
  {
    CFBooleanRef v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v4 = [v3 lastPathComponent];
    uint64_t v5 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 635, v5);
    uint64_t v2 = 3758097084;
    goto LABEL_5;
  }
  uint64_t v2 = HxISPCaptureDeviceController::RelinquishStreams(var2, *((const __CFArray **)var2 + 1));
  if (v2)
  {
    CFBooleanRef v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v4 = [v3 lastPathComponent];
    uint64_t v5 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v2);
    CFArrayRef v6 = +[NSString stringWithFormat:@"fail during releaseControlOfStreams, OSStatus error 0x%x (%@)", v2, v5];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 642, v6);

LABEL_5:
  }
  return v2;
}

void sub_10000B3D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enumerateStreamsIndices(DeviceCMInterface *this)
{
  unsigned int v2 = 0;
  *(void *)&this->var3.var0 = -1;
  *(void *)&this->var3.BOOL var2 = -1;
  *(void *)&this->var3.int var4 = -1;
  p_var3 = &this->var3;
  CFStringRef v3 = (const __CFString *)kFigCaptureStreamProperty_PortType;
  CFStringRef v4 = (const __CFString *)kFigCapturePortType_FrontFacingInfraredCamera;
  CFStringRef v5 = (const __CFString *)kFigCapturePortType_FrontFacingCamera;
  CFStringRef v6 = (const __CFString *)kFigCapturePortType_FrontFacingSuperWideCamera;
  CFStringRef v7 = (const __CFString *)kFigCapturePortType_BackFacingSuperWideCamera;
  CFStringRef v8 = (const __CFString *)kFigCapturePortType_BackFacingCamera;
  CFStringRef v9 = (const __CFString *)kFigCapturePortType_BackFacingTelephotoCamera;
  CFStringRef v10 = (const __CFString *)kFigCapturePortType_BackFacingSparseTimeOfFlightCamera;
  do
  {
    CFStringRef theString1 = 0;
    if (HxISPCaptureDeviceController::CopyStreamProperty(this->var2, v2, v3, &theString1)) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = theString1 == 0;
    }
    if (!v11)
    {
      if (CFEqual(theString1, v4)) {
        this->var3.var3 = v2;
      }
      if (CFEqual(theString1, v5)
        || CFEqual(theString1, v6))
      {
        this->var3.BOOL var2 = v2;
      }
      if (CFEqual(theString1, v7)) {
        this->var3.int var4 = v2;
      }
      if (CFEqual(theString1, v8)) {
        this->var3.var1 = v2;
      }
      if (CFEqual(theString1, v9)) {
        p_var3->var0 = v2;
      }
      if (CFEqual(theString1, v10)) {
        this->var3.unsigned int var5 = v2;
      }
      CFRelease(theString1);
    }
    ++v2;
  }
  while (v2 != 8);
  if (!this->var2 || this->var3.var3 < 0)
  {
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFArrayRef v14 = [v13 lastPathComponent];
    unsigned int v15 = +[NSString stringWithFormat:@"IR Stream id not found"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 703, v15);
    uint64_t v12 = 3758097084;
LABEL_26:

    return v12;
  }
  if (this->var3.var2 < 0)
  {
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFArrayRef v14 = [v13 lastPathComponent];
    unsigned int v15 = +[NSString stringWithFormat:@"RGB Stream id not found"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 709, v15);
    uint64_t v12 = 0;
    goto LABEL_26;
  }
  return 0;
}

void sub_10000B6B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isActivated(DeviceCMInterface *this)
{
  return this->var2 != 0;
}

uint64_t DeviceCMInterface::setPearlIRMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setPearlMultiOutModeByStreamId(this, this->var3.var3, 1);
}

uint64_t DeviceCMInterface::setPearlMultiOutModeByStreamId(DeviceCMInterface *this, uint64_t a2, int a3)
{
  BOOL var2 = this->var2;
  if (!var2)
  {
    CFStringRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v9 = [v8 lastPathComponent];
    CFStringRef v10 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 802, v10);
    uint64_t v7 = 3758097084;
    goto LABEL_10;
  }
  if (this->var3.var2 != a2 && this->var3.var3 != a2)
  {
    CFStringRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v9 = [v8 lastPathComponent];
    CFStringRef v10 = +[NSString stringWithFormat:@"stream id %d is invalid (should be %d for rgb or %d for ir)", a2, this->var3.var2, this->var3.var3];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 808, v10);
    uint64_t v7 = 3758097090;
    goto LABEL_10;
  }
  CFStringRef v6 = (const __CFBoolean **)&kCFBooleanTrue;
  if (!a3) {
    CFStringRef v6 = (const __CFBoolean **)&kCFBooleanFalse;
  }
  uint64_t v7 = HxISPCaptureDeviceController::SetStreamProperty(var2, a2, kFigCaptureStreamProperty_MultipleOutputSupportEnabled, *v6);
  if (v7)
  {
    CFStringRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v9 = [v8 lastPathComponent];
    CFStringRef v10 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    BOOL v11 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId failed, OSStatus error 0x%x (%@)", v7, v10];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 819, v11);

    uint64_t v7 = 3758097129;
LABEL_10:
  }
  return v7;
}

void sub_10000B91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isPearlIrExist(DeviceCMInterface *this)
{
  int var3 = this->var3.var3;
  if (var3 == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    int var3 = this->var3.var3;
  }
  return var3 != -1;
}

BOOL DeviceCMInterface::isPearlRgbExist(DeviceCMInterface *this)
{
  int var2 = this->var3.var2;
  if (var2 == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    int var2 = this->var3.var2;
  }
  return var2 != -1;
}

BOOL DeviceCMInterface::isJasperExist(DeviceCMInterface *this)
{
  int var5 = this->var3.var5;
  if (var5 == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    int var5 = this->var3.var5;
  }
  return var5 != -1;
}

uint64_t DeviceCMInterface::setPearlRGBMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setPearlMultiOutModeByStreamId(this, this->var3.var2, 1);
}

uint64_t DeviceCMInterface::setStreamProperty(DeviceCMInterface *this, uint64_t a2, const __CFString *a3, NSDictionary *a4)
{
  uint64_t v7 = a4;
  int var2 = this->var2;
  if (var2)
  {
    CFStringRef v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(var2, a2, a3, (const __CFBoolean *)v7);
    if (!v9)
    {
      uint64_t v14 = 0;
      goto LABEL_7;
    }
    CFStringRef v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v11 = [v10 lastPathComponent];
    uint64_t v12 = DeviceCMInterface::getErrorInformationString(v9);
    uint64_t v13 = +[NSString stringWithFormat:@"SetStreamProperty %@ for stream id %d failed with OSStatus 0x%x (%@)", a3, a2, v9, v12];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 839, v13);

    uint64_t v14 = 3758097129;
  }
  else
  {
    CFStringRef v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v11 = [v10 lastPathComponent];
    uint64_t v12 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 831, v12);
    uint64_t v14 = 3758097084;
  }

LABEL_7:
  return v14;
}

void sub_10000BBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enablePearlIROutput(DeviceCMInterface *this)
{
  unsigned int v2 = (const void *)kFigCaptureStreamVideoOutputID_PrimaryScaler;
  uint64_t v16 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
  uint64_t v14 = kFigCaptureStreamVideoOutputConfigurationKey_AttachRaw;
  unsigned int v15 = &__kCFBooleanTrue;
  CFStringRef v3 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  CFBooleanRef v17 = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  uint64_t v5 = DeviceCMInterface::setStreamProperty(this, this->var3.var3, kFigCaptureStreamProperty_VideoOutputConfigurations, v4);
  if (!v5)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFBooleanRef v10 = Mutable;
    if (Mutable)
    {
      CFDictionarySetValue(Mutable, v2, kCFBooleanTrue);
      BOOL v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var3, kFigCaptureStreamProperty_VideoOutputsEnabled, v10);
      if (v11)
      {
        CFStringRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v7 = [v6 lastPathComponent];
        CFStringRef v8 = DeviceCMInterface::getErrorInformationString(v11);
        uint64_t v12 = +[NSString stringWithFormat:@"enableIROutput failed with OSStatus 0x%x (%@)", v11, v8];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 870, v12);

        uint64_t v5 = 3758097129;
        goto LABEL_3;
      }
      CFRelease(v10);
    }
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  CFStringRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v7 = [v6 lastPathComponent];
  CFStringRef v8 = +[NSString stringWithFormat:@"Configure the primary output failed"];
  NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 855, v8);
LABEL_3:

LABEL_9:
  return v5;
}

void sub_10000BE60(_Unwind_Exception *a1)
{
  CFStringRef v6 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enablePearlRGBOutput(DeviceCMInterface *this)
{
  uint64_t v1 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->var3.var2);
  if (v1)
  {
    unsigned int v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v3 = [v2 lastPathComponent];
    CFStringRef v4 = +[NSString stringWithFormat:@"enableRGBOutput failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 914, v4);
  }
  return v1;
}

void sub_10000BF8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlIrCofiguration(DeviceCMInterface *this, int a2)
{
  switch(a2)
  {
    case 0:
      CFStringRef v24 = @"EnableIRProjector";
      uint64_t v25 = &__kCFBooleanFalse;
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"None"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 972, v6);
      goto LABEL_10;
    case 1:
      v22[0] = @"EnableIRProjector";
      v22[1] = @"ProjectorType";
      v23[0] = &__kCFBooleanTrue;
      v23[1] = @"Flood";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"Flood"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 981, v6);
      goto LABEL_10;
    case 2:
      v20[0] = @"EnableIRProjector";
      v20[1] = @"ProjectorType";
      v21[0] = &__kCFBooleanTrue;
      v21[1] = @"SparseLowPower";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"SparseLowPower"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 989, v6);
      goto LABEL_10;
    case 3:
      v18[0] = @"EnableIRProjector";
      v18[1] = @"ProjectorType";
      v19[0] = &__kCFBooleanTrue;
      v19[1] = @"Sparse";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"Sparse"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 997, v6);
      goto LABEL_10;
    case 4:
      v14[0] = @"EnableIRProjector";
      v14[1] = @"ProjectorType";
      v15[0] = &__kCFBooleanTrue;
      v15[1] = @"Dense";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"Dense"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1014, v6);
      goto LABEL_10;
    case 5:
      v16[0] = @"EnableIRProjector";
      v16[1] = @"ProjectorType";
      v17[0] = &__kCFBooleanTrue;
      v17[1] = @"DenseProbeAB";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"DenseProbeAB"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1005, v6);
      goto LABEL_10;
    case 6:
      v12[0] = @"EnableIRProjector";
      v12[1] = @"ProjectorType";
      v13[0] = &__kCFBooleanTrue;
      v13[1] = @"SparseProbeAB";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"SparseProbeAB"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1023, v6);
LABEL_10:

      break;
    default:
      CFStringRef v3 = 0;
      break;
  }
  uint64_t v7 = DeviceCMInterface::setStreamProperty(this, this->var3.var3, @"IRProjectorParams", v3);
  if (v7)
  {
    CFStringRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v9 = [v8 lastPathComponent];
    CFBooleanRef v10 = +[NSString stringWithFormat:@"setProjectorMode failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1031, v10);
  }
  return v7;
}

void sub_10000C5F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlDepthConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v23 = a3;
  uint64_t valuePtr = a2;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v20 = [v19 lastPathComponent];
    CFBooleanRef v21 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v20, 1042, v21, v23, valuePtr);
    uint64_t v14 = 3758097084;

    return v14;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v23);
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_OutputWidth, v9);
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_OutputHeight, v10);
  CFRelease(v9);
  CFRelease(v10);
  BOOL v11 = (const void **)&kFigCapturePortType_FrontFacingCamera;
  if (!a4) {
    BOOL v11 = (const void **)&kFigCapturePortType_FrontFacingInfraredCamera;
  }
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_DepthPerspectivePortType, *v11);
  uint64_t v12 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  uint64_t v13 = v12;
  if (a5)
  {
    CFArrayAppendValue(v12, kFigCaptureStreamDepthData_DX);
    if ((a5 & 0x10000) == 0)
    {
LABEL_6:
      if ((a5 & 0x1000000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_16;
    }
  }
  else if ((a5 & 0x10000) == 0)
  {
    goto LABEL_6;
  }
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_DY);
  if ((a5 & 0x1000000) == 0)
  {
LABEL_7:
    if ((a5 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_DepthImage);
  if ((a5 & 0x100) == 0)
  {
LABEL_8:
    if ((a5 & 0x100000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_NormalizedDX);
  if ((a5 & 0x100000000) != 0) {
LABEL_9:
  }
    CFArrayAppendValue(v13, kFigCaptureStreamDepthData_GMS);
LABEL_10:
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_EnabledOutputs, v13);
  uint64_t v14 = HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), *(_DWORD *)(a1 + 36), kFigCaptureStreamProperty_DepthEngineConfiguration, Mutable);
  CFRelease(v13);
  if (v14)
  {
    unsigned int v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v16 = [v15 lastPathComponent];
    CFBooleanRef v17 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v14);
    id v18 = +[NSString stringWithFormat:@"setDepthCofiguration failed with OSStatus 0x%x (%@)", v14, v17];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 1092, v18, v23, valuePtr);

    return 3758097129;
  }
  return v14;
}

void sub_10000CA60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startRgbSuperWideRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->var3.var4);
}

uint64_t DeviceCMInterface::startRgbStream(DeviceCMInterface *this, uint64_t a2)
{
  if (!this->var2)
  {
    BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v12 = [v11 lastPathComponent];
    uint64_t v13 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1289, v13);
    uint64_t started = 3758097084;
LABEL_13:

    return started;
  }
  if ((a2 & 0x80000000) != 0)
  {
    CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v5 = [v4 lastPathComponent];
    CFStringRef v6 = +[NSString stringWithFormat:@"stream id is invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1295, v6);
  }
  if (!this->var5.var4)
  {
    uint64_t v15 = HxISPCaptureDeviceController::SetStreamProperty(this->var2, a2, kFigCaptureStreamProperty_MinimumFrameRate, (const __CFBoolean *)&off_10001AC28);
    if (v15)
    {
      uint64_t v16 = (DeviceCMInterface *)v15;
      BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t v13 = DeviceCMInterface::getErrorInformationString(v16);
      uint64_t v14 = +[NSString stringWithFormat:@"set min fps 30 failed with OSStatus 0x%x (%@)", v16, v13];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1301, v14);
      goto LABEL_12;
    }
    uint64_t v17 = HxISPCaptureDeviceController::SetStreamProperty(this->var2, a2, kFigCaptureStreamProperty_MaximumFrameRate, (const __CFBoolean *)&off_10001AC28);
    if (v17)
    {
      id v18 = (DeviceCMInterface *)v17;
      BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t v13 = DeviceCMInterface::getErrorInformationString(v18);
      uint64_t v14 = +[NSString stringWithFormat:@"set max fps 30 failed with OSStatus 0x%x (%@)", v18, v13];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1307, v14);
      goto LABEL_12;
    }
  }
  uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  CFStringRef v8 = [v7 lastPathComponent];
  CFNumberRef v9 = +[NSString stringWithFormat:@"start receiving stream id: %d", a2];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1312, v9);

  uint64_t started = HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->var2, a2, (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_10000DBB8, this, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              0,
              0,
              0);
  if (started)
  {
    BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v12 = [v11 lastPathComponent];
    uint64_t v13 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)started);
    uint64_t v14 = +[NSString stringWithFormat:@"startRgbStream failed with OSStatus 0x%x (%@)", started, v13];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1321, v14);
LABEL_12:

    uint64_t started = 3758097129;
    goto LABEL_13;
  }
  return started;
}

void sub_10000CE3C(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startRgbWideRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->var3.var1);
}

uint64_t DeviceCMInterface::startJasperStream(DeviceCMInterface *this)
{
  int var2 = this->var2;
  if (!var2)
  {
    CFNumberRef v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v11 = [v10 lastPathComponent];
    uint64_t v12 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 1114, v12);

    return 3758097084;
  }
  CFBooleanRef v37 = 0;
  unsigned int valuePtr = 0x7FFFFFFF;
  id v35 = 0;
  uint64_t v3 = HxISPCaptureDeviceController::CopyStreamProperty(var2, this->var3.var5, kFigCaptureProperty_SupportedPropertiesDictionary, &v35);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v6 = [v5 lastPathComponent];
    uint64_t v7 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v4);
    CFStringRef v8 = +[NSString stringWithFormat:@"get SupportedPropertiesDictionary failed with OSStatus 0x%x (%@)", v4, v7];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1127, v8);
    goto LABEL_4;
  }
  id v14 = v35;
  uint64_t v5 = [v35 allKeys];

  id v35 = 0;
  CFStringRef v15 = (const __CFString *)kFigCaptureStreamProperty_MaximumAllowedFrameRate;
  if ([v5 containsObject:kFigCaptureStreamProperty_MaximumAllowedFrameRate])
  {
    uint64_t v16 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, v15, &v37);
    if (v16)
    {
      uint64_t v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      id v18 = [v17 lastPathComponent];
      uint64_t v19 = DeviceCMInterface::getErrorInformationString(v16);
      uint64_t v20 = +[NSString stringWithFormat:@"failed resolving maximum frame rate information OSStatus 0x%x (%@)", v16, v19];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v18, 1148, v20);
      uint64_t v9 = 3758097129;

      if (v37) {
        CFRelease(v37);
      }
      goto LABEL_5;
    }
    CFNumberRef v21 = v37;
    if (!v37)
    {
      CFStringRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v7 = [v6 lastPathComponent];
      CFStringRef v8 = +[NSString stringWithFormat:@"null maximum frame rate detected"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 1156, v8);
      uint64_t v4 = 3758097129;
      goto LABEL_4;
    }
  }
  else
  {
    CFNumberRef v21 = (const __CFNumber *)&off_10001AC10;
    CFBooleanRef v37 = (const __CFBoolean *)&off_10001AC10;
  }
  CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr);
  uint64_t v22 = valuePtr;
  uint64_t v23 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, kFigCaptureStreamProperty_MinimumFrameRate, v37);
  uint64_t v4 = 3758097129;
  if (v23)
  {
    CFStringRef v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v25 = [v24 lastPathComponent];
    uint64_t v26 = DeviceCMInterface::getErrorInformationString(v23);
    id v27 = +[NSString stringWithFormat:@"set min fps of %d failed with OSStatus 0x%x (%@)", v22, v23, v26];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v25, 1168, v27);
  }
  else
  {
    v28 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, kFigCaptureStreamProperty_MaximumFrameRate, v37);
    if (!v28)
    {
      uint64_t v9 = 0;
      int v29 = 1;
      goto LABEL_18;
    }
    CFStringRef v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v25 = [v24 lastPathComponent];
    uint64_t v26 = DeviceCMInterface::getErrorInformationString(v28);
    id v27 = +[NSString stringWithFormat:@"set max fps of %d failed with OSStatus 0x%x (%@)", v22, v28, v26];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v25, 1176, v27);
  }

  int v29 = 0;
  uint64_t v9 = 3758097129;
LABEL_18:
  CFRelease(v37);
  if (!v29) {
    goto LABEL_5;
  }
  uint64_t v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  id v31 = [v30 lastPathComponent];
  int v32 = +[NSString stringWithFormat:@"start receiving stream id: %d", this->var3.var5];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v31, 1187, v32);

  uint64_t started = (DeviceCMInterface *)HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->var2, this->var3.var5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                   0,
                                   (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_10000D560,
                                   this);
  if (!started)
  {
    uint64_t v9 = 0;
    goto LABEL_5;
  }
  CFStringRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v7 = [v6 lastPathComponent];
  CFStringRef v8 = DeviceCMInterface::getErrorInformationString(started);
  uint64_t v34 = +[NSString stringWithFormat:@"startJasperStream failed with OSStatus 0x%x (%@)", started, v8];
  NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 1201, v34);

LABEL_4:
  uint64_t v9 = v4;
LABEL_5:

  return v9;
}

void sub_10000D494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000D560(uint64_t result, long long *a2, int a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = result;
    CFStringRef result = *(void *)(a4 + 8);
    if (result)
    {
      if (*(_DWORD *)(a4 + 36) == a3)
      {
        uint64_t v5 = 1;
      }
      else
      {
        if (*(_DWORD *)(a4 + 40) == a3) {
          int v6 = 3;
        }
        else {
          int v6 = 0;
        }
        if (*(_DWORD *)(a4 + 32) == a3) {
          unsigned int v7 = 2;
        }
        else {
          unsigned int v7 = v6;
        }
        if (*(_DWORD *)(a4 + 44) == a3) {
          uint64_t v5 = 4;
        }
        else {
          uint64_t v5 = v7;
        }
      }
      long long v8 = *a2;
      uint64_t v9 = *((void *)a2 + 2);
      return (*(uint64_t (**)(uint64_t, uint64_t, long long *, uint64_t))(*(void *)result + 8))(result, v4, &v8, v5);
    }
  }
  return result;
}

uint64_t DeviceCMInterface::stopJasperStream(DeviceCMInterface *this)
{
  int var2 = this->var2;
  uint64_t v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v4 = v3;
  if (!var2)
  {
    long long v8 = [v3 lastPathComponent];
    uint64_t v9 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1212, v9);
    uint64_t v7 = 3758097084;
    goto LABEL_5;
  }
  uint64_t v5 = [v3 lastPathComponent];
  int v6 = +[NSString stringWithFormat:@"stop receiving stream id: %d", this->var3.var5];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1216, v6);

  uint64_t v7 = HxISPCaptureDeviceController::stopReceive(this->var2, this->var3.var5);
  if (v7)
  {
    uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    long long v8 = [v4 lastPathComponent];
    uint64_t v9 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    CFNumberRef v10 = +[NSString stringWithFormat:@"stopJasperStream failed with OSStatus 0x%x (%@)", v7, v9];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1220, v10);

    uint64_t v7 = 3758097129;
LABEL_5:
  }
  return v7;
}

void sub_10000D7B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startPearlIrStream(DeviceCMInterface *this)
{
  int var2 = this->var2;
  if (!var2)
  {
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    int v6 = [v5 lastPathComponent];
    uint64_t v7 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1232, v7);
    uint64_t started = 3758097084;
LABEL_10:

    return started;
  }
  uint64_t v3 = HxISPCaptureDeviceController::SetStreamProperty(var2, this->var3.var3, kFigCaptureStreamProperty_MinimumFrameRate, (const __CFBoolean *)&off_10001AC28);
  if (v3)
  {
    uint64_t v4 = (DeviceCMInterface *)v3;
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    int v6 = [v5 lastPathComponent];
    uint64_t v7 = DeviceCMInterface::getErrorInformationString(v4);
    long long v8 = +[NSString stringWithFormat:@"set min fps 30 failed with OSStatus 0x%x (%@)", v4, v7];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1239, v8);
LABEL_9:

    uint64_t started = 3758097129;
    goto LABEL_10;
  }
  CFNumberRef v10 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var3, kFigCaptureStreamProperty_MaximumFrameRate, (const __CFBoolean *)&off_10001AC28);
  BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v5 = v11;
  if (v10)
  {
    int v6 = [v11 lastPathComponent];
    uint64_t v7 = DeviceCMInterface::getErrorInformationString(v10);
    long long v8 = +[NSString stringWithFormat:@"set max fps 30 failed with OSStatus 0x%x (%@)", v10, v7];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1245, v8);
    goto LABEL_9;
  }
  uint64_t v12 = [v11 lastPathComponent];
  uint64_t v13 = +[NSString stringWithFormat:@"start receiving stream id: %d", this->var3.var3];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1250, v13);

  uint64_t started = HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->var2, this->var3.var3, (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_10000DBB8, this, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              0,
              0,
              0);
  if (started)
  {
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    int v6 = [v5 lastPathComponent];
    uint64_t v7 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)started);
    long long v8 = +[NSString stringWithFormat:@"startIrStream failed with OSStatus 0x%x (%@)", started, v7];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1259, v8);
    goto LABEL_9;
  }
  return started;
}

void sub_10000DB40(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t (***sub_10000DBB8(uint64_t (***result)(void, void, long long *, uint64_t), long long *a2, int a3, uint64_t a4))(void, void, long long *, uint64_t)
{
  if (a4)
  {
    uint64_t v4 = result;
    CFStringRef result = *(uint64_t (****)(void, void, long long *, uint64_t))(a4 + 8);
    if (result)
    {
      if (*(_DWORD *)(a4 + 36) == a3)
      {
        uint64_t v5 = 1;
      }
      else
      {
        if (*(_DWORD *)(a4 + 28) == a3) {
          unsigned int v6 = 5;
        }
        else {
          unsigned int v6 = 0;
        }
        if (*(_DWORD *)(a4 + 40) == a3) {
          unsigned int v6 = 3;
        }
        if (*(_DWORD *)(a4 + 32) == a3) {
          unsigned int v6 = 2;
        }
        if (*(_DWORD *)(a4 + 44) == a3) {
          uint64_t v5 = 4;
        }
        else {
          uint64_t v5 = v6;
        }
      }
      long long v7 = *a2;
      uint64_t v8 = *((void *)a2 + 2);
      return (uint64_t (***)(void, void, long long *, uint64_t))(**result)(result, v4, &v7, v5);
    }
  }
  return result;
}

uint64_t DeviceCMInterface::stopPearlIrStream(DeviceCMInterface *this)
{
  int var2 = this->var2;
  uint64_t v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v4 = v3;
  if (!var2)
  {
    uint64_t v8 = [v3 lastPathComponent];
    uint64_t v9 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1270, v9);
    uint64_t v7 = 3758097084;
    goto LABEL_5;
  }
  uint64_t v5 = [v3 lastPathComponent];
  unsigned int v6 = +[NSString stringWithFormat:@"stop receiving stream id: %d", this->var3.var3];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1274, v6);

  uint64_t v7 = HxISPCaptureDeviceController::stopReceive(this->var2, this->var3.var3);
  if (v7)
  {
    uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v4 lastPathComponent];
    uint64_t v9 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    CFNumberRef v10 = +[NSString stringWithFormat:@"stopIrStream failed with OSStatus 0x%x (%@)", v7, v9];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1278, v10);

    uint64_t v7 = 3758097129;
LABEL_5:
  }
  return v7;
}

void sub_10000DE1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startPearlRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->var3.var2);
}

uint64_t DeviceCMInterface::stopRgbStream(DeviceCMInterface *this, uint64_t a2)
{
  int var2 = this->var2;
  uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  unsigned int v6 = v5;
  if (!var2)
  {
    CFNumberRef v10 = [v5 lastPathComponent];
    BOOL v11 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v10, 1337, v11);
    uint64_t v9 = 3758097084;
    goto LABEL_5;
  }
  uint64_t v7 = [v5 lastPathComponent];
  uint64_t v8 = +[NSString stringWithFormat:@"stop receiving stream id: %d", a2];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 1341, v8);

  uint64_t v9 = HxISPCaptureDeviceController::stopReceive(this->var2, a2);
  if (v9)
  {
    unsigned int v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFNumberRef v10 = [v6 lastPathComponent];
    BOOL v11 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v9);
    uint64_t v12 = +[NSString stringWithFormat:@"stopRgbStream failed with OSStatus 0x%x (%@)", v9, v11];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v10, 1345, v12);

LABEL_5:
  }
  return v9;
}

void sub_10000E02C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::stopPearlRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->var3.var2);
}

uint64_t DeviceCMInterface::stopRgbSuperWideStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->var3.var4);
}

uint64_t DeviceCMInterface::stopRgbWideStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->var3.var1);
}

uint64_t DeviceCMInterface::validateJasperFwStatus(DeviceCMInterface *this, unsigned int *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0x7FFFFFFF;
  *a2 = 0x7FFFFFFF;
  uint64_t v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, @"ValidateComplianceWithDetails", &number);
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    uint64_t result = 0;
    *a2 = valuePtr;
  }
  else
  {
    unsigned int v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v7 = [v6 lastPathComponent];
    uint64_t var3 = this->var3.var3;
    uint64_t v9 = DeviceCMInterface::getErrorInformationString(v4);
    CFNumberRef v10 = +[NSString stringWithFormat:@"validateJasperFwStatus failed with OSStatus 0x%x for stream id %d (%@)", v4, var3, v9];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 1385, v10);

    return 3758097084;
  }
  return result;
}

void sub_10000E1CC(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::validateIrFwStatus(DeviceCMInterface *this, unsigned int *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0x7FFFFFFF;
  *a2 = 0x7FFFFFFF;
  int var2 = this->var2;
  if (var2 && *((unsigned char *)var2 + 2148) && (unsigned int v5 = this->var3.var3, (v5 & 0x80000000) == 0))
  {
    uint64_t v6 = HxISPCaptureDeviceController::CopyStreamProperty(var2, v5, @"ValidateComplianceWithDetails", &number);
    if (v6)
    {
      uint64_t v7 = (DeviceCMInterface *)v6;
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v9 = [v8 lastPathComponent];
      uint64_t var3 = this->var3.var3;
      BOOL v11 = DeviceCMInterface::getErrorInformationString(v7);
      uint64_t v12 = +[NSString stringWithFormat:@"validateIrFwStatus failed with OSStatus 0x%x for stream id %d (%@)", v7, var3, v11];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1407, v12);
      uint64_t v13 = 3758097084;
    }
    else
    {
      uint64_t v13 = 0;
    }
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
      return v13;
    }
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v15 = [v14 lastPathComponent];
    uint64_t v16 = +[NSString stringWithFormat:@"validateIrFwStatus failed as bit mask was NULL"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v15, 1419, v16);
  }
  else
  {
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v15 = [v14 lastPathComponent];
    uint64_t v16 = +[NSString stringWithFormat:@"device is not activated"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v15, 1400, v16);
  }
  uint64_t v13 = 3758097084;

  return v13;
}

void sub_10000E424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableDefaultDepthStream(DeviceCMInterface *this)
{
  uint64_t v1 = DeviceCMInterface::setPearlDepthConfiguration((uint64_t)this, 360, 640, 1, 0x1000000);
  if (v1)
  {
    unsigned int v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v3 = [v2 lastPathComponent];
    uint64_t v4 = +[NSString stringWithFormat:@"setDepthCofiguration failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 1435, v4);
  }
  return v1;
}

void sub_10000E524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setPearlMultiCam(DeviceCMInterface *this)
{
  unsigned int v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v3 = [v2 lastPathComponent];
  uint64_t v4 = +[NSString stringWithFormat:@"setting multicam..."];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 1443, v4);

  Group = (const void *)HxISPCaptureDeviceController::FindGroup(this->var2, this->var3.var3);
  uint64_t v6 = HxISPCaptureDeviceController::FindGroup(this->var2, this->var3.var2);
  if (Group && (uint64_t v7 = (const void *)v6, Group != (const void *)v6) && v6)
  {
    CFRelease(Group);
    CFRelease(v7);
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    CFNumberRef v10 = +[NSString stringWithFormat:@"cannot set multi cam if both rgb/ir groups not the same"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1452, v10);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
    uint64_t v13 = Mutable;
    if (Mutable) {
      CFArrayAppendValue(Mutable, Group);
    }
    uint64_t v24 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveSynchronizedStreamsGroups;
    uint64_t v25 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    BOOL v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->var2, kFigCaptureDeviceProperty_MultiCamConfiguration, v14);
    CFStringRef v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v16 = [v15 lastPathComponent];
    uint64_t v17 = +[NSString stringWithFormat:@"setting kFigCaptureDeviceProperty_MultiCamConfiguration return val is %d", v11];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 1469, v17);

    if (v13) {
      CFRelease(v13);
    }
    if (v11)
    {
      id v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v19 = [v18 lastPathComponent];
      uint64_t var3 = this->var3.var3;
      CFNumberRef v21 = DeviceCMInterface::getErrorInformationString(v11);
      uint64_t v22 = +[NSString stringWithFormat:@"kFigCaptureDeviceProperty_MultiCamConfiguration failed with OSStatus 0x%x for stream id %d (%@)", v11, var3, v21];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v19, 1476, v22);
    }
  }
  return v11;
}

void sub_10000E874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableSyncForEnumeratedStreams(DeviceCMInterface *this, int a2)
{
  if (!this->var2 || this->var3.var2 < 0 || this->var3.var3 < 0)
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    CFNumberRef v10 = +[NSString stringWithFormat:@"cannot enableSyncForEnumeratedStreams one or more stream ids is invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1486, v10);
    uint64_t v6 = 3758097084;
    goto LABEL_13;
  }
  unsigned int var3 = a2;
  this->var6 = a2;
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 2, &kCFTypeArrayCallBacks);
  unsigned int v5 = Mutable;
  if (Mutable)
  {
    CFArrayAppendValue(Mutable, *((const void **)this->var2 + this->var3.var2 + 2));
    CFArrayAppendValue(v5, *((const void **)this->var2 + this->var3.var3 + 2));
  }
  if (!var3) {
    unsigned int var3 = this->var3.var3;
  }
  uint64_t v6 = HxISPCaptureDeviceController::SetGroupProperty(this->var2, var3, kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams, v5);
  if (v5) {
    CFRelease(v5);
  }
  if (v6)
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t var2 = this->var3.var2;
    CFNumberRef v10 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v6);
    BOOL v11 = +[NSString stringWithFormat:@"enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)", v6, var2, v10];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1538, v11);

    uint64_t v6 = 3758097129;
LABEL_13:
  }
  return v6;
}

void sub_10000EAFC(_Unwind_Exception *a1)
{
  unsigned int v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlSyncSlave(DeviceCMInterface *this, uint64_t a2, int a3)
{
  int valuePtr = a3;
  if (this->var2)
  {
    if ((a2 & 0x80000000) == 0 || this->var3.var3 == a2 || this->var3.var2 == a2)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_StreamingOutputsEnabled, kCFBooleanTrue);
      CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_FrameSkippingEnabled, kCFBooleanFalse);
      if (a3)
      {
        CFNumberRef v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_MasterToSlaveFrameRateRatio, v7);
        CFRelease(v7);
      }
      uint64_t v8 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, a2, kFigCaptureStreamProperty_SynchronizedStreamsSlaveConfiguration, Mutable);
      CFRelease(Mutable);
      if (v8)
      {
        uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        CFNumberRef v10 = [v9 lastPathComponent];
        BOOL v11 = DeviceCMInterface::getErrorInformationString(v8);
        uint64_t v12 = +[NSString stringWithFormat:@"setSyncSlave failed with OSStatus 0x%x for stream id %d (%@)", v8, a2, v11];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v10, 1598, v12);
      }
    }
    else
    {
      uint64_t v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      id v18 = [v17 lastPathComponent];
      uint64_t v19 = +[NSString stringWithFormat:@"cannot set stream %d as master for sync, stream is invalid", a2];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v18, 1556, v19);

      return 3758096385;
    }
  }
  else
  {
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    id v14 = [v13 lastPathComponent];
    CFStringRef v15 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 1549, v15);

    return 3758097084;
  }
  return (uint64_t)v8;
}

void sub_10000EDF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlIRAsSyncSlave(DeviceCMInterface *this, int a2)
{
  return DeviceCMInterface::setPearlSyncSlave(this, this->var3.var3, a2);
}

uint64_t DeviceCMInterface::setPearlRgbAsSyncSlave(DeviceCMInterface *this, int a2)
{
  return DeviceCMInterface::setPearlSyncSlave(this, this->var3.var2, a2);
}

DeviceCMInterface *DeviceCMInterface::disablePearlSyncMode(DeviceCMInterface *this, unsigned int var3)
{
  int var6 = this->var6;
  if (var6 == -1)
  {
    uint64_t var2 = this->var2;
    if (!var3) {
      unsigned int var3 = this->var3.var3;
    }
    CFStringRef v5 = (const __CFString *)kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams;
  }
  else
  {
    uint64_t var2 = this->var2;
    CFStringRef v5 = (const __CFString *)kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams;
    unsigned int var3 = var6;
  }
  uint64_t v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetGroupProperty(var2, var3, v5, 0);
  if (v6)
  {
    CFNumberRef v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t v9 = DeviceCMInterface::getErrorInformationString(v6);
    CFNumberRef v10 = +[NSString stringWithFormat:@"disableSyncMode failed with OSStatus 0x%x for stream id (%@)", v6, v9];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1636, v10);
  }
  return v6;
}

void sub_10000EF70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlFormatIndex(DeviceCMInterface *this, unsigned int a2)
{
  uint64_t var2 = this->var2;
  CFStringRef v4 = (const __CFString *)kFigCaptureStreamProperty_FormatIndex;
  CFStringRef v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");

  return HxISPCaptureDeviceController::SetStreamProperty(var2, a2, v4, (const __CFBoolean *)v5);
}

uint64_t DeviceCMInterface::configPearlDevice(DeviceCMInterface *this, const PearlConfiguration *a2)
{
  *(_WORD *)&this->var7 = 0;
  *(_WORD *)&this->var4.BOOL var0 = 0;
  this->var4.uint64_t var2 = 0;
  this->var4.uint64_t var3 = 0;
  this->var4.int var4 = 0;
  if (a2->var2)
  {
    uint64_t var2 = this->var3.var2;
    if (var2 == -1)
    {
      DeviceCMInterface::enumerateStreamsIndices(this);
      uint64_t var2 = this->var3.var2;
      if (var2 == -1)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"no available RGB stream index"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1731, v10);
LABEL_32:
        uint64_t v11 = 3758097136;
        goto LABEL_40;
      }
      BOOL v5 = a2->var2;
    }
    else
    {
      BOOL v5 = 1;
    }
    if (a2->var0 && v5)
    {
      uint64_t v11 = DeviceCMInterface::enableSyncForEnumeratedStreams(this, var2);
      uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v13 = [v12 lastPathComponent];
      id v14 = +[NSString stringWithFormat:@"cmsync 2 3 (enableSyncForEnumeratedStreams) ret = %d", v11];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v13, 1740, v14);

      if (v11)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"enableSyncForEnumeratedStreams failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1744, v10);
        goto LABEL_40;
      }
      uint64_t v11 = (uint64_t)DeviceCMInterface::setPearlMultiCam(this);
      uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v17 = [v16 lastPathComponent];
      id v18 = +[NSString stringWithFormat:@"CMMULTICAMCREATE -s 2 3(setPearlMultiCam) ret = %d", v11];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v17, 1750, v18);

      if (v11)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1754, v10);
        goto LABEL_40;
      }
      uint64_t v11 = HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var2, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:0]);
      uint64_t v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      id v27 = [v26 lastPathComponent];
      v28 = +[NSString stringWithFormat:@"cmsetcurrentformat 2 0, setPearlFormatIndex(m_streamIdsInfo.rgbPearlStreamId, 0) ret = %d", this->var3.var2];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 1760, v28);

      if (v11)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1764, v10);
        goto LABEL_40;
      }
      uint64_t var2 = this->var3.var2;
    }
    uint64_t v7 = DeviceCMInterface::setPearlMultiOutModeByStreamId(this, var2, 1);
    if (v7)
    {
      uint64_t v11 = v7;
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v9 = [v8 lastPathComponent];
      CFNumberRef v10 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb failed"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1773, v10);
LABEL_40:

      return v11;
    }
    uint64_t v15 = DeviceCMInterface::enablePearlRGBOutput(this);
    if (v15)
    {
      uint64_t v11 = v15;
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v9 = [v8 lastPathComponent];
      CFNumberRef v10 = +[NSString stringWithFormat:@"Configure the primary output to multioutput + enable failed"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1781, v10);
      goto LABEL_40;
    }
    this->var7 = 1;
  }
  BOOL var0 = a2->var0;
  if (!a2->var0) {
    goto LABEL_49;
  }
  uint64_t var3 = this->var3.var3;
  if (var3 == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    uint64_t var3 = this->var3.var3;
    if (var3 == -1)
    {
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v9 = [v8 lastPathComponent];
      CFNumberRef v10 = +[NSString stringWithFormat:@"no available IR stream index"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1792, v10);
      goto LABEL_32;
    }
  }
  uint64_t v21 = DeviceCMInterface::setPearlMultiOutModeByStreamId(this, var3, 1);
  if (v21)
  {
    uint64_t v11 = v21;
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    CFNumberRef v10 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1800, v10);
    goto LABEL_40;
  }
  if (this->var0 < 11) {
    goto LABEL_35;
  }
  int v43 = 0;
  uint64_t PearlProjectorHWVersion = DeviceCMInterface::getPearlProjectorHWVersion(this, &v43);
  if (!PearlProjectorHWVersion)
  {
    if (v43 == 10)
    {
      int v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v30 = [v29 lastPathComponent];
      id v31 = +[NSString stringWithFormat:@"projector version %d", 10];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v30, 1816, v31);

      uint64_t v32 = 1;
LABEL_36:
      uint64_t v11 = HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var3, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:v32]);
      uint64_t v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v34 = [v33 lastPathComponent];
      id v35 = +[NSString stringWithFormat:@"cmsetcurrentformat 2 %d, setPearlFormatIndex(m_streamIdsInfo.rgbPearlStreamId, %d) ret = %d", this->var3.var2, v32, v11];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v34, 1826, v35);

      if (v11)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"setPearlFormatIndex failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1830, v10);
        goto LABEL_40;
      }
      uint64_t v36 = DeviceCMInterface::enablePearlIROutput(this);
      if (v36)
      {
        uint64_t v11 = v36;
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"Configure the primary output to multioutput + enable failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1838, v10);
        goto LABEL_40;
      }
      uint64_t v38 = DeviceCMInterface::setPearlIrCofiguration(this, a2->var3);
      if (v38)
      {
        uint64_t v11 = v38;
        CFArrayRef v39 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        CFArrayRef v40 = [v39 lastPathComponent];
        uint64_t v41 = +[NSString stringWithFormat:@"set projector mode to %u failed", a2->var3];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v40, 1846, v41);

        return v11;
      }
      if (a2->var1)
      {
        uint64_t v42 = DeviceCMInterface::enableDefaultDepthStream(this);
        if (v42)
        {
          uint64_t v11 = v42;
          uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
          uint64_t v9 = [v8 lastPathComponent];
          CFNumberRef v10 = +[NSString stringWithFormat:@"enableDefaultDepthStream failed"];
          NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1856, v10);
          goto LABEL_40;
        }
      }
      this->var8 = 1;
      BOOL var0 = a2->var0;
LABEL_49:
      uint64_t v11 = 0;
      this->var4.uint64_t var3 = a2->var3;
      this->var4.BOOL var0 = var0;
      *(_WORD *)&this->var4.var1 = *(_WORD *)&a2->var1;
      return v11;
    }
LABEL_35:
    uint64_t v32 = 0;
    goto LABEL_36;
  }
  uint64_t v11 = PearlProjectorHWVersion;
  uint64_t v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v24 = [v23 lastPathComponent];
  uint64_t v25 = +[NSString stringWithFormat:@"config pearl device failed to read projector version"];
  NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v24, 1821, v25);

  return v11;
}

void sub_10000F96C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlProjectorHWVersion(DeviceCMInterface *this, int *a2)
{
  CFTypeRef cf = 0;
  uint64_t var2 = this->var2;
  if (!var2 || (unsigned int var3 = this->var3.var3, (var3 & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t v9 = +[NSString stringWithFormat:@"getPearlProjectorVersion failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2398, v9);

    return 3758097084;
  }
  else
  {
    uint64_t v6 = HxISPCaptureDeviceController::CopyStreamProperty(var2, var3, @"ProjectorHWVersion", &cf);
    if (cf)
    {
      *a2 = FigCFNumberGetSInt32();
      CFRelease(cf);
    }
    else
    {
      uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t v13 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorHWVersion"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2410, v13);
    }
  }
  return v6;
}

void sub_10000FC00(_Unwind_Exception *a1)
{
  CFStringRef v4 = v2;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setCurrentPearlConfiguration(DeviceCMInterface *this, const PearlConfiguration *a2)
{
  this->var4.unsigned int var3 = a2->var3;
  this->var4.uint64_t var2 = a2->var2;
  *(_WORD *)&this->var4.BOOL var0 = *(_WORD *)&a2->var0;
  return this;
}

id DeviceCMInterface::getJasperConfigurationStringKey(DeviceCMInterface *this, JasperConfiguration *a2)
{
  p_int var5 = &this->var5;
  if (a2) {
    p_int var5 = a2;
  }
  JasperConfiguration v3 = *p_var5;
  CFStringRef v4 = +[NSMutableString string];
  [v4 appendString:@"DEVICE_CONFIG"];
  if (v3.var0) {
    [v4 appendString:@"_JASPER_DEPTH"];
  }
  if ((*(void *)&v3 & 0xFF0000) != 0) {
    [v4 appendString:@"_WIDE"];
  }
  if ((*(_WORD *)&v3.var0 & 0xFF00) != 0)
  {
    if ((*(_DWORD *)&v3.var0 & 0xFF000000) != 0) {
      CFStringRef v5 = @"_SUPER_WIDE_SYNCED";
    }
    else {
      CFStringRef v5 = @"_SUPER_WIDE_UNSYNCED";
    }
    [v4 appendString:v5];
  }
  uint64_t v6 = +[NSString stringWithString:v4];

  return v6;
}

void sub_10000FD40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id DeviceCMInterface::getPearlConfigurationStringKey(DeviceCMInterface *this, PearlConfiguration *a2)
{
  p_int var4 = &this->var4;
  p_var1 = &this->var4.var1;
  p_uint64_t var2 = &this->var4.var2;
  p_unsigned int var3 = &this->var4.var3;
  p_int var5 = &this->var4.var5;
  if (a2)
  {
    p_int var5 = &a2->var5;
    p_unsigned int var3 = &a2->var3;
    p_uint64_t var2 = &a2->var2;
    p_var1 = &a2->var1;
    p_int var4 = a2;
  }
  BOOL var0 = p_var4->var0;
  BOOL v8 = *p_var1;
  BOOL v9 = *p_var2;
  int v10 = *p_var3;
  id v11 = *p_var5;
  uint64_t v12 = +[NSMutableString string];
  [v12 appendString:@"DEVICE_CONFIG"];
  if (var0) {
    [v12 appendString:@"_IR"];
  }
  if (v8) {
    CFStringRef v13 = @"_DEPTH";
  }
  else {
    CFStringRef v13 = @"_NO_PCE";
  }
  [v12 appendString:v13];
  if (v9) {
    [v12 appendString:@"_RGB"];
  }
  CFStringRef v14 = @"_DENSE";
  switch(v10)
  {
    case 0:
      CFStringRef v14 = @"_IR_MODE_NONE";
      goto LABEL_17;
    case 1:
      CFStringRef v14 = @"_FLOOD";
      goto LABEL_17;
    case 2:
      CFStringRef v14 = @"_SPARSE_LOW_POWER";
      goto LABEL_17;
    case 3:
      CFStringRef v14 = @"_SPARSE";
      goto LABEL_17;
    case 4:
      goto LABEL_17;
    case 5:
      [v12 appendString:@"_DENSE_PROB_AB"];
      goto LABEL_16;
    case 6:
LABEL_16:
      CFStringRef v14 = @"_SPARSE_PROB_AB";
LABEL_17:
      [v12 appendString:v14];
      break;
    default:
      break;
  }
  uint64_t v15 = +[NSString stringWithString:v12];

  return v15;
}

void sub_10000FEF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::isPDECaliobrationValid(DeviceCMInterface *this, BOOL *a2)
{
  uint64_t var2 = this->var2;
  if (!var2)
  {
    CFStringRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v6 = [v5 lastPathComponent];
    uint64_t v7 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 2004, v7);
LABEL_6:
    uint64_t v4 = 3758097084;

    return v4;
  }
  CFTypeRef cf = 0;
  *a2 = HxISPCaptureDeviceController::CopyStreamProperty(var2, this->var3.var3, @"PCECalib", &cf) == 0;
  if (!cf)
  {
    CFStringRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v6 = [v5 lastPathComponent];
    uint64_t v7 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_PCECalib"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 2023, v7);
    goto LABEL_6;
  }
  CFRelease(cf);
  return 0;
}

void sub_100010078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperProjectorFault(uint64_t a1, void *a2, void *a3)
{
  if (*(int *)a1 <= 15)
  {
    unsigned int valuePtr = 0;
    CFNumberRef number = 0;
    CFStringRef v5 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), *(_DWORD *)(a1 + 44), @"ProjectorRikerFaultStatus", &number);
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    CFStringRef v6 = @"ProjectorRikerFaultStatus";
    if (!v5) {
      return v5;
    }
LABEL_9:
    BOOL v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v9 = [v8 lastPathComponent];
    uint64_t v10 = *(unsigned int *)(a1 + 44);
    id v11 = DeviceCMInterface::getErrorInformationString(v5);
    uint64_t v12 = +[NSString stringWithFormat:@"getJasperProjectorFault %@ failed with OSStatus 0x%x for stream id %d (%@) and property (%@)", v6, v5, v10, v11, v6];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 2063, v12);

    return v5;
  }
  CFNumberRef number = 0;
  CFStringRef v5 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), *(_DWORD *)(a1 + 44), @"ProjectorQuarkFaultStatus", &number);
  if (number)
  {
    *a3 = number;
    CFRelease(number);
  }
  CFStringRef v6 = @"ProjectorQuarkFaultStatus";
  if (v5) {
    goto LABEL_9;
  }
  return v5;
}

void sub_100010234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperProjectorWillFault(DeviceCMInterface *this, unint64_t *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0;
  uint64_t v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, @"ProjectorWillFaultStatus", &number);
  if (v4)
  {
    CFStringRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v6 = [v5 lastPathComponent];
    uint64_t var5 = this->var3.var5;
    BOOL v8 = DeviceCMInterface::getErrorInformationString(v4);
    BOOL v9 = +[NSString stringWithFormat:@"getJasperRikerProjectorWillFault failed with OSStatus 0x%x for stream id %d (%@)", v4, var5, v8];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 2080, v9);
  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    id v11 = [v10 lastPathComponent];
    uint64_t v12 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorWillFaultStatus"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 2092, v12);
  }
  return v4;
}

void sub_1000103F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperResistance(DeviceCMInterface *this, unint64_t *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0;
  uint64_t v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, @"RikerResistance", &number);
  if (v4)
  {
    CFStringRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v6 = [v5 lastPathComponent];
    uint64_t var5 = this->var3.var5;
    BOOL v8 = DeviceCMInterface::getErrorInformationString(v4);
    BOOL v9 = +[NSString stringWithFormat:@"getJasperRikerResistance failed with OSStatus 0x%x for stream id %d (%@)", v4, var5, v8];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 2107, v9);
  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    id v11 = [v10 lastPathComponent];
    uint64_t v12 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_RikerResistance"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 2119, v12);
  }
  return v4;
}

void sub_1000105D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getPearlFloodProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0;
  uint64_t var2 = this->var2;
  if (!var2 || (unsigned int v5 = this->var3.var3, (v5 & 0x80000000) != 0))
  {
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v13 = [v12 lastPathComponent];
    CFStringRef v14 = +[NSString stringWithFormat:@"getFloodProjectorFault failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v13, 2132, v14);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    CFStringRef v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(var2, v5, @"ProjectorRosalineFaultStatus", &number);
    if (v6)
    {
      uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      BOOL v8 = [v7 lastPathComponent];
      uint64_t var3 = this->var3.var3;
      uint64_t v10 = DeviceCMInterface::getErrorInformationString(v6);
      id v11 = +[NSString stringWithFormat:@"getFloodProjectorFault failed with OSStatus 0x%x for stream id %d (%@)", v6, var3, v10];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2139, v11);
    }
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    else
    {
      uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v17 = [v16 lastPathComponent];
      id v18 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorRosalineFaultStatus"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v17, 2151, v18);
    }
  }
  return v6;
}

void sub_10001082C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getStructuredProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  unint64_t valuePtr = 0;
  CFNumberRef number = 0;
  uint64_t var2 = this->var2;
  if (!var2 || (unsigned int v5 = this->var3.var3, (v5 & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v8 = [v7 lastPathComponent];
    BOOL v9 = +[NSString stringWithFormat:@"getStructuredProjectorFault failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2163, v9);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    CFStringRef v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(var2, v5, @"ProjectorFaultStatus", &number);
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    else
    {
      id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t var3 = this->var3.var3;
      CFStringRef v14 = DeviceCMInterface::getErrorInformationString(v6);
      uint64_t v15 = +[NSString stringWithFormat:@"getStructuredProjectorFault failed with OSStatus 0x%x for stream id %d (%@)", v6, var3, v14];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2176, v15);
    }
  }
  return v6;
}

void sub_100010A20(_Unwind_Exception *a1)
{
  unsigned int v5 = v3;

  _Unwind_Resume(a1);
}

HxISPCaptureDeviceController *DeviceCMInterface::releaseDevice(DeviceCMInterface *this)
{
  if (DeviceCMInterface::releaseControlOfStreams(this))
  {
    unsigned int v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    JasperConfiguration v3 = [v2 lastPathComponent];
    uint64_t v4 = +[NSString stringWithFormat:@"releaseControlOfStreams failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 2187, v4);
  }

  return DeviceCMInterface::releaseInterface(this);
}

void sub_100010B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 DeviceCMInterface::getStreamIdsInfo@<Q0>(DeviceCMInterface *this@<X0>, int a2@<W1>, __n128 *a3@<X8>)
{
  if (a2) {
    DeviceCMInterface::initAndActivateCaptureDeviceController(this);
  }
  __n128 result = *(__n128 *)&this->var3.var0;
  *a3 = result;
  a3[1].n128_u64[0] = *(void *)&this->var3.var4;
  return result;
}

DeviceCMInterface *DeviceCMInterface::getRgbjReport(DeviceCMInterface *this, int *a2, int *a3, int *a4, int *a5, int *a6)
{
  CFDictionaryRef theDict = 0;
  uint64_t v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, @"RgbjReport", &theDict);
  if (v12)
  {
    CFStringRef v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v14 = [v13 lastPathComponent];
    uint64_t var5 = this->var3.var5;
    uint64_t v16 = DeviceCMInterface::getErrorInformationString(v12);
    uint64_t v17 = +[NSString stringWithFormat:@"getRgbjReport: failed with OSStatus 0x%x for stream id %d (%@)", v12, var5, v16];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 2232, v17);
  }
  else
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportControllerReached");
    CFNumberGetValue(Value, kCFNumberIntType, a2);
    CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportControllerPassed");
    CFNumberGetValue(v19, kCFNumberIntType, a3);
    CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportIsfSuccess");
    CFNumberGetValue(v20, kCFNumberIntType, a4);
    CFNumberRef v21 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportIsfFailure");
    CFNumberGetValue(v21, kCFNumberIntType, a5);
    *a6 = 0;
    CFNumberRef v22 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportFailedToSave");
    if (v22)
    {
      CFNumberRef v23 = v22;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v23)) {
        CFNumberGetValue(v23, kCFNumberIntType, a6);
      }
      else {
        NSLog(@"The value for key %@ is not a number", @"RgbjReportFailedToSave");
      }
    }
    CFRelease(theDict);
  }
  return v12;
}

void sub_100010D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::forceSaveWideJasperCalib(DeviceCMInterface *this)
{
  unsigned int v2 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, @"RgbjForceSaveCalib", 0);
  if (v2)
  {
    JasperConfiguration v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v4 = [v3 lastPathComponent];
    uint64_t var5 = this->var3.var5;
    CFStringRef v6 = DeviceCMInterface::getErrorInformationString(v2);
    uint64_t v7 = +[NSString stringWithFormat:@"forceSaveWideJasperCalib: failed with OSStatus 0x%x for stream id %d (%@)", v2, var5, v6];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 2263, v7);
  }
  return v2;
}

void sub_100010EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setRgbjConfiguration(DeviceCMInterface *this, unsigned int a2, unsigned int a3, uint64_t a4)
{
  v16[0] = @"RgbjConfigurationFeatureVectorSize";
  CFStringRef v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
  v16[1] = @"RgbjConfigurationDilutionRate";
  v17[0] = v6;
  uint64_t v7 = +[NSNumber numberWithUnsignedInt:a4];
  v17[1] = v7;
  CFBooleanRef v8 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  BOOL v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, @"RgbjConfiguration", v8);
  if (v9)
  {
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    id v11 = [v10 lastPathComponent];
    uint64_t var5 = this->var3.var5;
    CFStringRef v13 = DeviceCMInterface::getErrorInformationString(v9);
    CFStringRef v14 = +[NSString stringWithFormat:@"setRgbjConfiguration: failed with OSStatus 0x%x for stream id %d (%@)", v9, var5, v13];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 2276, v14);
  }
  return v9;
}

void sub_100011070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setWideJasperExtrinsics(DeviceCMInterface *this, float a2, float a3, float a4, float a5, float a6, float a7)
{
  CFStringRef v13 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v32[0] = v13;
  *(float *)&double v14 = a3;
  uint64_t v15 = +[NSNumber numberWithFloat:v14];
  v32[1] = v15;
  *(float *)&double v16 = a4;
  uint64_t v17 = +[NSNumber numberWithFloat:v16];
  v32[2] = v17;
  *(float *)&double v18 = a5;
  CFNumberRef v19 = +[NSNumber numberWithFloat:v18];
  v32[3] = v19;
  *(float *)&double v20 = a6;
  CFNumberRef v21 = +[NSNumber numberWithFloat:v20];
  v32[4] = v21;
  *(float *)&double v22 = a7;
  CFNumberRef v23 = +[NSNumber numberWithFloat:v22];
  v32[5] = v23;
  CFBooleanRef v24 = +[NSArray arrayWithObjects:v32 count:6];

  uint64_t v25 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, @"OverrideJasperWideExtrinsics", v24);
  if (v25)
  {
    uint64_t v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    id v27 = [v26 lastPathComponent];
    uint64_t var5 = this->var3.var5;
    int v29 = DeviceCMInterface::getErrorInformationString(v25);
    uint64_t v30 = +[NSString stringWithFormat:@"setWideJasperExtrinsics: failed with OSStatus 0x%x for stream id %d (%@)", v25, var5, v29];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 2288, v30);
  }
  return v25;
}

void sub_1000112DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getJasperModuleInfo(DeviceCMInterface *this, const __CFDictionary **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, kFigCaptureStreamProperty_ModuleInfo, a2);
}

uint64_t DeviceCMInterface::getJasperCalib(DeviceCMInterface *this, const __CFData **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, @"JasperCalib", a2);
}

uint64_t DeviceCMInterface::getJasperCalibData(DeviceCMInterface *this, const __CFDictionary **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, @"JapserCalibData", a2);
}

uint64_t DeviceCMInterface::getPearlPleUUID(DeviceCMInterface *this, unsigned __int8 *a2)
{
  uint64_t var2 = this->var2;
  if (!var2 || (unsigned int var3 = this->var3.var3, (var3 & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFBooleanRef v8 = [v7 lastPathComponent];
    BOOL v9 = +[NSString stringWithFormat:@"getPearlPCECalib failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2320, v9);

    return 3758097084;
  }
  else
  {
    CFDataRef theData = 0;
    uint64_t v6 = HxISPCaptureDeviceController::CopyStreamProperty(var2, var3, @"PCECalib", &theData);
    if (theData)
    {
      *(_OWORD *)a2 = *(_OWORD *)(CFDataGetBytePtr(theData) + 8);
      CFRelease(theData);
    }
    else
    {
      id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      CFStringRef v13 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_PCECalib"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2336, v13);
    }
  }
  return v6;
}

void sub_100011520(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlRigelSerialNumber(uint64_t a1, void *a2)
{
  id v15 = 0;
  JasperConfiguration v3 = *(HxISPCaptureDeviceController **)(a1 + 16);
  if (!v3 || (unsigned int v5 = *(_DWORD *)(a1 + 36), (v5 & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFBooleanRef v8 = [v7 lastPathComponent];
    BOOL v9 = +[NSString stringWithFormat:@"getPearlRigelSerialNumber failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2349, v9);

    return 3758097084;
  }
  else
  {
    uint64_t v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(v3, v5, @"RigelSerialNumber", &v15);
    if (v15)
    {
      *a2 = v15;
    }
    else
    {
      id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      CFStringRef v13 = DeviceCMInterface::getErrorInformationString(v6);
      double v14 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_RigelSerialNumber, %@", v13];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2360, v14);
    }
  }
  return (uint64_t)v6;
}

void sub_1000116EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlRigelOtpVersion(DeviceCMInterface *this, int *a2)
{
  CFTypeRef cf = 0;
  uint64_t var2 = this->var2;
  if (!var2 || (unsigned int var3 = this->var3.var3, (var3 & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFBooleanRef v8 = [v7 lastPathComponent];
    BOOL v9 = +[NSString stringWithFormat:@"getPearlRigelOtpVersion failed, ir stream id invalid, %@", @"OK"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2373, v9);

    return 3758097084;
  }
  else
  {
    uint64_t v6 = HxISPCaptureDeviceController::CopyStreamProperty(var2, var3, @"ProjectorVersion", &cf);
    if (cf)
    {
      *a2 = FigCFNumberGetSInt32();
      CFRelease(cf);
    }
    else
    {
      id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      CFStringRef v13 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorVersion"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2385, v13);
    }
  }
  return v6;
}

void sub_100011894(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getGuadalupeValues(DeviceCMInterface *this, uint64_t *a2, uint64_t *a3, uint64_t *a4, int *a5, uint64_t *a6)
{
  CFTypeRef cf = 0;
  uint64_t v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var3, @"GuadRecordRegisters", &cf);
  if (!cf)
  {
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    double v16 = [v15 lastPathComponent];
    uint64_t v17 = DeviceCMInterface::getErrorInformationString(v12);
    double v18 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_GuadRecordRegisters, %@", v17];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 2428, v18);

LABEL_14:
    return v12;
  }
  *a6 = (int)FigCFNumberGetSInt32();
  CFRelease(cf);
  CFTypeRef cf = 0;
  uint64_t v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var3, @"GuadLastResistance", &cf);
  if (!cf)
  {
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    double v16 = [v15 lastPathComponent];
    uint64_t v17 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_GuadLastResistance"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 2443, v17);
    goto LABEL_14;
  }
  *a5 = FigCFNumberGetSInt32();
  CFRelease(cf);
  CFTypeRef cf = 0;
  uint64_t v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var3, @"BaneState", &cf);
  if (!cf)
  {
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    double v16 = [v15 lastPathComponent];
    uint64_t v17 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorBaneState"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 2457, v17);
    goto LABEL_14;
  }
  *a2 = (int)FigCFNumberGetSInt32();
  CFRelease(cf);
  CFTypeRef cf = 0;
  uint64_t v13 = HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var3, @"ProjectorRosalineFaultStatus", &cf);
  if (cf)
  {
    *a3 = (int)FigCFNumberGetSInt32();
    CFRelease(cf);
    CFTypeRef cf = 0;
    uint64_t v14 = HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var3, @"BaneResistance", &cf);
    if (cf)
    {
      if (!v12) {
        LODWORD(v12) = v13;
      }
      *a4 = (int)FigCFNumberGetSInt32();
      CFRelease(cf);
      if (v12) {
        return (DeviceCMInterface *)v12;
      }
      else {
        return (DeviceCMInterface *)v14;
      }
    }
    else
    {
      CFNumberRef v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      CFBooleanRef v24 = [v23 lastPathComponent];
      uint64_t v25 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorBaneResistance"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v24, 2490, v25);

      return (DeviceCMInterface *)v14;
    }
  }
  else
  {
    double v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFNumberRef v21 = [v20 lastPathComponent];
    double v22 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorRosalineFaultStatus"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v21, 2473, v22);

    return (DeviceCMInterface *)v13;
  }
}

void sub_100011CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012200(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  operator delete[]();
}

void sub_100012518(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100012694(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000126C4(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100012778();
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

void sub_100012778()
{
}

void sub_100012790(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000127EC(exception, a1);
}

void sub_1000127D8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1000127EC(std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  return result;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return _CFAllocatorGetDefault();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
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

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CFShow(CFTypeRef obj)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return _CGRectCreateDictionaryRepresentation(a1);
}

uint64_t CMBaseObjectGetVTable()
{
  return _CMBaseObjectGetVTable();
}

CMBufferRef CMBufferQueueDequeueAndRetain(CMBufferQueueRef queue)
{
  return _CMBufferQueueDequeueAndRetain(queue);
}

OSStatus CMBufferQueueInstallTrigger(CMBufferQueueRef queue, CMBufferQueueTriggerCallback callback, void *refcon, CMBufferQueueTriggerCondition condition, CMTime *time, CMBufferQueueTriggerToken *triggerTokenOut)
{
  return _CMBufferQueueInstallTrigger(queue, callback, refcon, condition, time, triggerTokenOut);
}

OSStatus CMBufferQueueRemoveTrigger(CMBufferQueueRef queue, CMBufferQueueTriggerToken triggerToken)
{
  return _CMBufferQueueRemoveTrigger(queue, triggerToken);
}

uint64_t CMNotificationCenterAddListener()
{
  return _CMNotificationCenterAddListener();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return _CMNotificationCenterGetDefaultLocalCenter();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return _CMNotificationCenterRemoveListener();
}

uint64_t FigCFNumberGetSInt32()
{
  return _FigCFNumberGetSInt32();
}

uint64_t FigCaptureDeviceGetFigBaseObject()
{
  return _FigCaptureDeviceGetFigBaseObject();
}

uint64_t FigCaptureStreamGetFigBaseObject()
{
  return _FigCaptureStreamGetFigBaseObject();
}

uint64_t FigCaptureSynchronizedStreamsGroupGetFigBaseObject()
{
  return _FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t JDJasperCalibCreateWithBinaryRepresentation()
{
  return _JDJasperCalibCreateWithBinaryRepresentation();
}

uint64_t JDJasperCalibGetFactoryWideToJasperTransform()
{
  return _JDJasperCalibGetFactoryWideToJasperTransform();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

uint64_t PDPeridotCalibCreateWithBinaryRepresentation()
{
  return _PDPeridotCalibCreateWithBinaryRepresentation();
}

uint64_t PDPeridotCalibGetOperationalWideToPeridotTransform()
{
  return _PDPeridotCalibGetOperationalWideToPeridotTransform();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return std::to_string(retstr, __val);
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

float atan2f(float a1, float a2)
{
  return _atan2f(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return _pthread_cond_destroy(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return _pthread_cond_signal(a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_initDevice(void *a1, const char *a2, ...)
{
  return [a1 initDevice];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}