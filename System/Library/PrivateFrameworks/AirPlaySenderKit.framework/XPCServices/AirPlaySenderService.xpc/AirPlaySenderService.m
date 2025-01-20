CFTypeRef sub_100000FD8()
{
  uint64_t DerivedStorage;
  NSObject *v1;
  NSObject *v2;
  void handler[5];
  CFTypeRef v5;

  v5 = 0;
  FigVirtualDisplaySourceGetClassID();
  if (CMDerivedObjectCreate()) {
    goto LABEL_8;
  }
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(_DWORD *)(DerivedStorage + 112) = 0;
  *(void *)(DerivedStorage + 16) = CFStringCreateF();
  v1 = dispatch_queue_create("APMediaSenderFVDSourceQueue", 0);
  *(void *)(DerivedStorage + 8) = v1;
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, v1);
  *(void *)(DerivedStorage + 80) = v2;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_1000011B0;
  handler[3] = &unk_10000C738;
  handler[4] = DerivedStorage;
  dispatch_source_set_event_handler(v2, handler);
  dispatch_source_set_timer(*(dispatch_source_t *)(DerivedStorage + 80), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  dispatch_resume(*(dispatch_object_t *)(DerivedStorage + 80));
  *(unsigned char *)(DerivedStorage + 116) = 1;
  if (VTPixelTransferSessionCreate(kCFAllocatorDefault, (VTPixelTransferSessionRef *)(DerivedStorage + 24)))
  {
LABEL_8:
    APSLogErrorAt();
    if (v5)
    {
      CFRelease(v5);
      return 0;
    }
  }
  else if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v5;
}

uint64_t sub_1000011B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 88))
  {
    if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v2 = *(__CVBuffer **)(v1 + 96);
    uint64_t v3 = *(void *)(v1 + 104);
    return sub_100001678(v1, v2, v3);
  }
  else
  {
    return APSLogErrorAt();
  }
}

uint64_t sub_10000128C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 && a3)
  {
    v6 = *(NSObject **)(DerivedStorage + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100001344;
    block[3] = &unk_10000C760;
    block[4] = a3;
    block[5] = DerivedStorage;
    block[6] = a2;
    dispatch_sync(v6, block);
    return 0;
  }
  else
  {
    APSLogErrorAt();
    return 4294955226;
  }
}

void sub_100001344(void *a1)
{
  v2 = (const void *)a1[4];
  if (v2) {
    uint64_t v3 = _Block_copy(v2);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = a1[5];
  v5 = *(const void **)(v4 + 32);
  if (v5)
  {
    _Block_release(v5);
    uint64_t v4 = a1[5];
  }
  *(void *)(v4 + 32) = v3;
  if (a1[6]) {
    v6 = a1[6];
  }
  else {
    v6 = &_dispatch_main_q;
  }
  dispatch_retain(v6);
  uint64_t v7 = a1[5];
  v8 = *(NSObject **)(v7 + 40);
  if (v8)
  {
    dispatch_release(v8);
    uint64_t v7 = a1[5];
  }
  *(void *)(v7 + 40) = v6;
}

uint64_t sub_1000013C8(uint64_t a1, char a2)
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2000000000;
  int v12 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v4 = *(NSObject **)(DerivedStorage + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_1000014A8;
  block[3] = &unk_10000C788;
  char v8 = a2;
  block[4] = &v9;
  block[5] = DerivedStorage;
  dispatch_sync(v4, block);
  uint64_t v5 = 0;
  if (*((_DWORD *)v10 + 6))
  {
    APSLogErrorAt();
    uint64_t v5 = *((unsigned int *)v10 + 6);
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t sub_1000014A8(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(_DWORD *)(v1 + 112))
  {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = -12070;
  }
  else
  {
    *(unsigned char *)(v1 + 116) = *(unsigned char *)(result + 48);
    if (dword_100010248 <= 50)
    {
      if (dword_100010248 != -1) {
        return LogPrintF();
      }
      result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

uint64_t sub_10000157C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000;
  int v13 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  v6 = *(NSObject **)(DerivedStorage + 8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 0x40000000;
  v9[2] = sub_100001640;
  v9[3] = &unk_10000C7B0;
  v9[4] = &v10;
  v9[5] = DerivedStorage;
  v9[6] = a2;
  v9[7] = a3;
  dispatch_sync(v6, v9);
  uint64_t v7 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t sub_100001640(uint64_t a1)
{
  uint64_t result = sub_100001678(*(void *)(a1 + 40), *(CVPixelBufferRef *)(a1 + 48), *(void *)(a1 + 56));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100001678(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3)
{
  CVPixelBufferRef destinationBuffer = 0;
  int v6 = *(_DWORD *)(a1 + 112);
  if (v6 == 2)
  {
    if (pixelBuffer)
    {
      if (*(unsigned char *)(a1 + 116))
      {
        uint64_t v7 = *(void *)a1;
        size_t Width = CVPixelBufferGetWidth(pixelBuffer);
        size_t Height = CVPixelBufferGetHeight(pixelBuffer);
        uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v10) {
          uint64_t v11 = v10;
        }
        else {
          uint64_t v11 = 0;
        }
        v17 = *(uint64_t (**)(uint64_t, void, uint64_t, CVPixelBufferRef *, double, double))(v11 + 88);
        if (!v17)
        {
          unsigned int v30 = -12782;
          goto LABEL_28;
        }
        unsigned int v18 = v17(v7, 0, 1, &destinationBuffer, (double)Width, (double)Height);
        if (v18)
        {
          unsigned int v30 = v18;
          goto LABEL_28;
        }
        OSStatus v19 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 24), pixelBuffer, destinationBuffer);
        if (v19)
        {
          unsigned int v30 = v19;
          goto LABEL_28;
        }
        v16 = destinationBuffer;
      }
      else
      {
        v16 = (__CVBuffer *)CFRetain(pixelBuffer);
        CVPixelBufferRef destinationBuffer = v16;
      }
      double v20 = (double)CVPixelBufferGetWidth(v16);
      size_t v21 = CVPixelBufferGetHeight(destinationBuffer);
      double v22 = (double)v21;
      double v23 = *(double *)(a1 + 48);
      double v24 = *(double *)(a1 + 56);
      double v25 = v23 / v20;
      if (v23 / v20 >= v24 / (double)v21) {
        double v25 = v24 / (double)v21;
      }
      double v26 = (1.0 - *(double *)(a1 + 64)) * v25;
      double v14 = v26 * v20;
      double v15 = v26 * v22;
      double x = (v23 - v26 * v20) * 0.5;
      double y = (v24 - v26 * v22) * 0.5;
      double v27 = 0.0;
      CVPixelBufferRef v28 = destinationBuffer;
      double v29 = 0.0;
    }
    else
    {
      double x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double v14 = CGRectZero.size.width;
      double v15 = CGRectZero.size.height;
      if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize()))
      {
        double v41 = *(double *)(a1 + 16);
        LogPrintF();
      }
      CVPixelBufferRef v28 = 0;
      double v22 = v15;
      double v20 = v14;
      double v27 = y;
      double v29 = CGRectZero.origin.x;
    }
    uint64_t v31 = *(void *)a1;
    uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v32) {
      uint64_t v33 = v32;
    }
    else {
      uint64_t v33 = 0;
    }
    v34 = *(uint64_t (**)(uint64_t, CVPixelBufferRef, uint64_t, void, void, double, double, double, double, double, double, double, double, double))(v33 + 80);
    if (v34)
    {
      unsigned int v35 = v34(v31, v28, a3, 0, 0, v29, v27, v20, v22, x, y, v14, v15, v41);
      if (!v35)
      {
LABEL_26:
        sub_1000026F4(a1);
        uint64_t v36 = 0;
        goto LABEL_39;
      }
      unsigned int v30 = v35;
    }
    else
    {
      unsigned int v30 = -12782;
    }
  }
  else
  {
    if (!v6)
    {
      APSLogErrorAt();
      goto LABEL_26;
    }
    unsigned int v30 = -12072;
  }
LABEL_28:
  APSLogErrorAt();
  v37 = *(NSObject **)(a1 + 80);
  dispatch_time_t v38 = dispatch_time(0, 50000000);
  dispatch_source_set_timer(v37, v38, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  v39 = *(const void **)(a1 + 96);
  *(void *)(a1 + 96) = pixelBuffer;
  if (pixelBuffer) {
    CFRetain(pixelBuffer);
  }
  if (v39) {
    CFRelease(v39);
  }
  *(void *)(a1 + 104) = a3;
  *(unsigned char *)(a1 + 88) = 1;
  if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v30 == -12073) {
    uint64_t v36 = 0;
  }
  else {
    uint64_t v36 = v30;
  }
LABEL_39:
  if (destinationBuffer) {
    CFRelease(destinationBuffer);
  }
  return v36;
}

void sub_100001AE4()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(DerivedStorage + 112))
  {
    int v1 = dword_100010248;
    if (dword_100010248 <= 100) {
      int v1 = sub_100008EB4(dword_100010248);
    }
    goto LABEL_24;
  }
  int v1 = dword_100010248;
  if (*(void *)DerivedStorage)
  {
    while (v1 > 100)
LABEL_24:
      __break(1u);
    sub_100008E3C(v1);
    __break(1u);
  }
  else
  {
    if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v2 = *(NSObject **)(DerivedStorage + 80);
    if (v2)
    {
      dispatch_source_cancel(v2);
      dispatch_release(*(dispatch_object_t *)(DerivedStorage + 80));
      *(void *)(DerivedStorage + 80) = 0;
    }
    uint64_t v3 = *(const void **)(DerivedStorage + 32);
    if (v3)
    {
      _Block_release(v3);
      *(void *)(DerivedStorage + 32) = 0;
    }
    uint64_t v4 = *(const void **)(DerivedStorage + 96);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(DerivedStorage + 96) = 0;
    }
    uint64_t v5 = *(const void **)(DerivedStorage + 24);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(DerivedStorage + 24) = 0;
    }
    int v6 = *(const void **)(DerivedStorage + 16);
    if (v6)
    {
      CFRelease(v6);
      *(void *)(DerivedStorage + 16) = 0;
    }
    uint64_t v7 = *(NSObject **)(DerivedStorage + 40);
    if (v7)
    {
      dispatch_release(v7);
      *(void *)(DerivedStorage + 40) = 0;
    }
    char v8 = *(NSObject **)(DerivedStorage + 8);
    if (v8)
    {
      dispatch_release(v8);
      *(void *)(DerivedStorage + 8) = 0;
    }
  }
}

uint64_t sub_100001C28(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  if (!CFEqual(kFigVirtualDisplaySourceProperty_Type, a2)) {
    return 4294954512;
  }
  CFTypeRef v5 = CFRetain(@"APMediaSenderFVDSource");
  uint64_t result = 0;
  *a4 = v5;
  return result;
}

uint64_t sub_100001C7C()
{
  return 4294954512;
}

uint64_t sub_100001C84(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  int v11 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    uint64_t v4 = *(NSObject **)(DerivedStorage + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100002158;
    block[3] = &unk_10000C870;
    block[5] = DerivedStorage;
    void block[6] = a2;
    block[4] = &v8;
    dispatch_sync(v4, block);
    if (*((_DWORD *)v9 + 6))
    {
      APSLogErrorAt();
      uint64_t v5 = *((unsigned int *)v9 + 6);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    APSLogErrorAt();
    uint64_t v5 = 4294955226;
    *((_DWORD *)v9 + 6) = -12070;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t sub_100001D90(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  int v11 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    uint64_t v4 = *(NSObject **)(DerivedStorage + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_1000021B0;
    block[3] = &unk_10000C898;
    block[5] = DerivedStorage;
    void block[6] = a2;
    block[4] = &v8;
    dispatch_sync(v4, block);
    if (*((_DWORD *)v9 + 6))
    {
      APSLogErrorAt();
      uint64_t v5 = *((unsigned int *)v9 + 6);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    APSLogErrorAt();
    uint64_t v5 = 4294955226;
    *((_DWORD *)v9 + 6) = -12070;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t sub_100001E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  int v11 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v4 = *(NSObject **)(DerivedStorage + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100002210;
  block[3] = &unk_10000C8C0;
  block[4] = &v8;
  block[5] = DerivedStorage;
  void block[6] = a2;
  dispatch_sync(v4, block);
  uint64_t v5 = 0;
  if (*((_DWORD *)v9 + 6))
  {
    APSLogErrorAt();
    uint64_t v5 = *((unsigned int *)v9 + 6);
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t sub_100001F7C()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v1 = *(NSObject **)(DerivedStorage + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10000264C;
  block[3] = &unk_10000C908;
  block[4] = DerivedStorage;
  dispatch_sync(v1, block);
  return 0;
}

uint64_t sub_100001FF8()
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2000000000;
  int v8 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v1 = *(NSObject **)(DerivedStorage + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000;
  v4[2] = sub_100002748;
  v4[3] = &unk_10000C930;
  v4[4] = &v5;
  v4[5] = DerivedStorage;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_1000020A8()
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2000000000;
  int v8 = 0;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v1 = *(NSObject **)(DerivedStorage + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000;
  v4[2] = sub_10000286C;
  v4[3] = &unk_10000C958;
  v4[4] = &v5;
  v4[5] = DerivedStorage;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

CFTypeRef *sub_100002158(CFTypeRef *result)
{
  int v1 = result;
  uint64_t v2 = result[5];
  if (v2[28] || *(void *)v2)
  {
    *(_DWORD *)(*((void *)result[4] + 1) + 24) = -12073;
  }
  else
  {
    uint64_t result = (CFTypeRef *)CFRetain(result[6]);
    *(void *)v1[5] = v1[6];
  }
  return result;
}

void sub_1000021B0(void *a1)
{
  uint64_t v2 = a1[5];
  if (!*(_DWORD *)(v2 + 112) && (uint64_t v3 = *(const void **)v2, *(void *)v2 == a1[6]))
  {
    if (v3)
    {
      CFRelease(v3);
      *(void *)a1[5] = 0;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -12070;
  }
}

void sub_100002210(uint64_t a1)
{
  uint64_t v2 = *(uint64_t **)(a1 + 40);
  if (*((_DWORD *)v2 + 28) || (uint64_t v3 = *v2) == 0)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -12070;
    return;
  }
  CFTypeRef v27 = 0;
  CFTypeRef v28 = 0;
  long long v25 = xmmword_100009DD0;
  int v24 = 60;
  char v23 = 0;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  unsigned int v26 = 0;
  int v6 = *(uint64_t (**)(uint64_t, CFTypeRef *, CFTypeRef *))(v5 + 56);
  if (v6)
  {
    int v7 = v6(v3, &v28, &v27);
    if (v7)
    {
      int v12 = v7;
    }
    else
    {
      int v8 = FigDisplayModes_LookupTimingModeIDByIndex();
      if (v8)
      {
        int v12 = v8;
      }
      else
      {
        uint64_t v9 = *v2;
        uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v10) {
          uint64_t v11 = v10;
        }
        else {
          uint64_t v11 = 0;
        }
        int v13 = *(uint64_t (**)(uint64_t, void, void))(v11 + 64);
        if (v13)
        {
          int v14 = v13(v9, v26, v26);
          if (v14)
          {
            int v12 = v14;
          }
          else
          {
            int DimensionsFromTimingMode = FigDisplayModes_ExtractDimensionsFromTimingMode();
            if (!DimensionsFromTimingMode)
            {
              FigDisplayModes_ExtractOverscanInfoFromTimingMode();
              FigDisplayModes_ExtractVSyncRateFromTimingMode();
              *((_OWORD *)v2 + 3) = v25;
              int v16 = v24;
              *((_DWORD *)v2 + 18) = v24;
              v2[8] = 0;
              uint64_t v17 = v2[4];
              if (v17)
              {
                unsigned int v18 = v2[5];
                block[0] = _NSConcreteStackBlock;
                block[1] = 0x40000000;
                block[2] = sub_100002628;
                block[3] = &unk_10000C8E8;
                block[4] = v17;
                long long v21 = v25;
                int v22 = v16;
                dispatch_async(v18, block);
              }
              if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              int v12 = 0;
              goto LABEL_25;
            }
            int v12 = DimensionsFromTimingMode;
          }
        }
        else
        {
          int v12 = -12782;
        }
      }
    }
  }
  else
  {
    int v12 = -12782;
  }
  APSLogErrorAt();
LABEL_25:
  if (v28) {
    CFRelease(v28);
  }
  if (v27) {
    CFRelease(v27);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v12;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    LOBYTE(block[0]) = 0;
    FigCFDictionaryGetBooleanIfPresent();
    if (LOBYTE(block[0])) {
      int v19 = 1;
    }
    else {
      int v19 = 2;
    }
    *(_DWORD *)(*(void *)(a1 + 40) + 112) = v19;
    if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

uint64_t sub_100002628(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), (int)*(double *)(a1 + 40), (int)*(double *)(a1 + 48), *(unsigned int *)(a1 + 56));
}

void sub_10000264C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 112))
  {
    sub_1000026F4(v2);
    *(_DWORD *)(*(void *)(a1 + 32) + 112) = 0;
    if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

void sub_1000026F4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 80), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    uint64_t v2 = *(const void **)(a1 + 96);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 96) = 0;
    }
    *(void *)(a1 + 104) = 0;
    *(unsigned char *)(a1 + 88) = 0;
  }
}

uint64_t sub_100002748(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  if (*(_DWORD *)(v2 + 112))
  {
    *(_DWORD *)(v2 + 112) = 1;
    if (dword_100010248 <= 50)
    {
      if (dword_100010248 != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  else
  {
    if (dword_100010248 <= 90)
    {
      if (dword_100010248 != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
        uint64_t result = LogPrintF();
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = -12070;
  }
  return result;
}

uint64_t sub_10000286C(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  if (*(_DWORD *)(v2 + 112) == 1)
  {
    *(_DWORD *)(v2 + 112) = 2;
    if (dword_100010248 <= 50)
    {
      if (dword_100010248 != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  else
  {
    if (dword_100010248 <= 90)
    {
      if (dword_100010248 != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
        uint64_t result = LogPrintF();
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = -12070;
  }
  return result;
}

void sub_1000032D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, id *a13, id *a14, id *a15)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak((id *)(v16 - 128));
  _Unwind_Resume(a1);
}

void sub_100003338(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleAuthRequired:a2];
}

void sub_100003388(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleStartCompletion:a2];
}

void sub_1000033D8(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleFailure:a2];
}

void sub_100003428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleUpdatedDisplayWidth:a2 height:a3 refreshRate:a4];
}

void sub_100003490(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [v3 userInfo];

  uint64_t v5 = [v4 objectForKeyedSubscript:@"APMediaSender_Status"];
  id v6 = [v5 intValue];

  [WeakRetained handleVideoStreamErrorNotification:v6];
}

uint64_t sub_100003F14(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t OpCode = FigXPCMessageGetOpCode();
  if (OpCode)
  {
    uint64_t v11 = OpCode;
    APSLogErrorAt();
  }
  else
  {
    xpc_dictionary_get_uint64(v6, kFigCommonXPCMsgParam_ObjectID);
    uint64_t v10 = FigXPCServerLookupAndRetainAssociatedObject();
    if (v10)
    {
      uint64_t v11 = v10;
      APSLogErrorAt();
    }
    else
    {
      if (dword_100010248 <= 90 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v11 = 4294960591;
    }
  }

  return v11;
}

uint64_t sub_1000041E0()
{
  if (qword_1000103C0 != -1) {
    dispatch_once(&qword_1000103C0, &stru_10000CA20);
  }
  return qword_1000103B8;
}

void sub_100004224(id a1)
{
  qword_100010358 = 0;
  unk_100010360 = "APMediaSender";
  qword_100010368 = 0;
  unk_100010370 = 0;
  qword_100010378 = (uint64_t)sub_100004280;
  unk_100010380 = 0;
  qword_100010388 = 0;
  unk_100010390 = 0;
  qword_100010398 = (uint64_t)sub_1000043F4;
  qword_1000103B8 = _CFRuntimeRegisterClass();
}

void sub_100004280(uint64_t a1)
{
  if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (*(unsigned char *)(a1 + 182))
  {
    if (dword_100010248 <= 100) {
      sub_100008F2C(dword_100010248);
    }
    __break(1u);
  }
  else
  {
    uint64_t v2 = *(const void **)(a1 + 120);
    if (v2)
    {
      _Block_release(v2);
      *(void *)(a1 + 120) = 0;
    }
    id v3 = *(const void **)(a1 + 128);
    if (v3)
    {
      _Block_release(v3);
      *(void *)(a1 + 128) = 0;
    }
    if (*(void *)(a1 + 136))
    {
      FigSimpleMutexDestroy();
      *(void *)(a1 + 136) = 0;
    }
    uint64_t v4 = *(const void **)(a1 + 40);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 40) = 0;
    }
    id v5 = *(const void **)(a1 + 32);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a1 + 32) = 0;
    }
    id v6 = *(const void **)(a1 + 48);
    if (v6)
    {
      CFRelease(v6);
      *(void *)(a1 + 48) = 0;
    }
    id v7 = *(const void **)(a1 + 56);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(a1 + 56) = 0;
    }
    int v8 = *(const void **)(a1 + 104);
    if (v8)
    {
      CFRelease(v8);
      *(void *)(a1 + 104) = 0;
    }
    uint64_t v9 = *(const void **)(a1 + 112);
    if (v9)
    {
      CFRelease(v9);
      *(void *)(a1 + 112) = 0;
    }
    uint64_t v10 = *(NSObject **)(a1 + 152);
    if (v10)
    {
      dispatch_release(v10);
      *(void *)(a1 + 152) = 0;
    }
    uint64_t v11 = *(NSObject **)(a1 + 144);
    if (v11)
    {
      dispatch_release(v11);
      *(void *)(a1 + 144) = 0;
    }
    int v12 = *(NSObject **)(a1 + 24);
    if (v12)
    {
      dispatch_release(v12);
      *(void *)(a1 + 24) = 0;
    }
    int v13 = *(NSObject **)(a1 + 16);
    if (v13)
    {
      dispatch_release(v13);
      *(void *)(a1 + 16) = 0;
    }
  }
}

CFStringRef sub_1000043F4(uint64_t a1)
{
  ASPrintF();
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  id v3 = "yes";
  if (!*(unsigned char *)(a1 + 182)) {
    id v3 = "no";
  }
  CFStringRef v4 = CFStringCreateWithFormat(v2, 0, @"<APMediaSender %p %s>{ active: %s, usage modes: 0x%x }", a1, 0, v3, *(unsigned int *)(a1 + 168));
  free(0);
  return v4;
}

void *sub_100004488()
{
  if (qword_1000103C0 != -1) {
    dispatch_once(&qword_1000103C0, &stru_10000CA20);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v1 = (void *)Instance;
  if (!Instance) {
    goto LABEL_11;
  }
  *(_OWORD *)(Instance + 32) = 0u;
  *(void *)(Instance + 176) = 0;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 160) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 16) = 0u;
  *(void *)(Instance + 16) = dispatch_queue_create("APMediaSenderQueue", 0);
  v1[3] = dispatch_queue_create("APMediaSenderCallbackQueue", 0);
  v1[19] = dispatch_semaphore_create(0);
  v1[17] = FigSimpleMutexCreate();
  if (APEndpointManagerCreate()) {
    goto LABEL_11;
  }
  CFTypeRef v2 = sub_100000FD8();
  v1[6] = v2;
  if (v2)
  {
    if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
LABEL_11:
    APSLogErrorAt();
    if (dword_100010248 <= 90 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v1)
    {
      CFRelease(v1);
      return 0;
    }
  }
  return v1;
}

uint64_t sub_1000046A8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  CFTypeRef v2 = *(NSObject **)(a1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100004758;
  block[3] = &unk_10000CA48;
  void block[5] = &v6;
  void block[6] = a1;
  block[4] = a2;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_100004758(void *a1)
{
  uint64_t v2 = a1[6];
  if (*(unsigned char *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = -6709;
    APSLogErrorAt();
  }
  else
  {
    uint64_t v3 = (const void *)a1[4];
    if (v3)
    {
      CFStringRef v4 = _Block_copy(v3);
      uint64_t v2 = a1[6];
    }
    else
    {
      CFStringRef v4 = 0;
    }
    id v5 = *(const void **)(v2 + 120);
    if (v5)
    {
      _Block_release(v5);
      uint64_t v2 = a1[6];
    }
    *(void *)(v2 + 120) = v4;
  }
}

uint64_t sub_1000047FC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  uint64_t v2 = *(NSObject **)(a1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_1000048AC;
  block[3] = &unk_10000CA70;
  void block[5] = &v6;
  void block[6] = a1;
  block[4] = a2;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_1000048AC(void *a1)
{
  uint64_t v2 = a1[6];
  if (*(unsigned char *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = -6709;
    APSLogErrorAt();
  }
  else
  {
    uint64_t v3 = (const void *)a1[4];
    if (v3)
    {
      CFStringRef v4 = _Block_copy(v3);
      uint64_t v2 = a1[6];
    }
    else
    {
      CFStringRef v4 = 0;
    }
    id v5 = *(const void **)(v2 + 128);
    if (v5)
    {
      _Block_release(v5);
      uint64_t v2 = a1[6];
    }
    *(void *)(v2 + 128) = v4;
  }
}

uint64_t sub_100004950(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  uint64_t v2 = *(NSObject **)(a1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100004A00;
  block[3] = &unk_10000CA98;
  void block[5] = &v6;
  void block[6] = a1;
  block[4] = a2;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t sub_100004A00(uint64_t *a1)
{
  uint64_t v2 = a1[6];
  if (*(unsigned char *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = -6709;
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = sub_10000128C(*(void *)(v2 + 48), *(void *)(v2 + 24), a1[4]);
    uint64_t result = *(unsigned int *)(*(void *)(a1[5] + 8) + 24);
    if (!result) {
      return result;
    }
  }
  return APSLogErrorAt();
}

uint64_t sub_100004AB4(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  int v8 = 0;
  uint64_t v1 = *(NSObject **)(a1 + 16);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000;
  v4[2] = sub_100004B60;
  v4[3] = &unk_10000CAC0;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_100004B60(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 182))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -6709;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sub_1000013C8(*(void *)(v2 + 48), 0);
    uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (!result)
    {
      if (dword_100010248 <= 50)
      {
        if (dword_100010248 != -1) {
          return LogPrintF();
        }
        uint64_t result = _LogCategory_Initialize();
        if (result) {
          return LogPrintF();
        }
      }
      return result;
    }
  }
  return APSLogErrorAt();
}

uint64_t sub_100004C7C(uint64_t a1, CFTypeRef cf)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000;
  int v12 = 0;
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFDictionaryGetTypeID())
    {
      if (IsAppleInternalBuild())
      {
        uint64_t v5 = *(NSObject **)(a1 + 16);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_100004D60;
        block[3] = &unk_10000CAE8;
        block[4] = &v9;
        void block[5] = a1;
        void block[6] = cf;
        dispatch_sync(v5, block);
      }
    }
  }
  uint64_t v6 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void sub_100004D60(void *a1)
{
  uint64_t v1 = a1[5];
  if (*(unsigned char *)(v1 + 182))
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -6709;
    APSLogErrorAt();
  }
  else
  {
    uint64_t v2 = *(const void **)(v1 + 104);
    uint64_t v3 = (const void *)a1[6];
    *(void *)(v1 + 104) = v3;
    if (v3) {
      CFRetain(v3);
    }
    if (v2) {
      CFRelease(v2);
    }
    if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

uint64_t sub_100004E60(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  int v11 = 0;
  if (a2)
  {
    uint64_t v3 = *(NSObject **)(a1 + 16);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000;
    v6[2] = sub_100004F20;
    v6[3] = &unk_10000CB10;
    v6[4] = &v8;
    v6[5] = a1;
    v6[6] = a2;
    char v7 = a3;
    dispatch_sync(v3, v6);
    uint64_t v4 = *((unsigned int *)v9 + 6);
  }
  else
  {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t sub_100004F20(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(unsigned char *)(v1 + 182))
  {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = -6709;
    return APSLogErrorAt();
  }
  else
  {
    uint64_t v2 = *(long long **)(result + 48);
    long long v3 = *v2;
    long long v4 = v2[1];
    *(void *)(v1 + 96) = *((void *)v2 + 4);
    *(_OWORD *)(v1 + 64) = v3;
    *(_OWORD *)(v1 + 80) = v4;
    *(unsigned char *)(*(void *)(result + 40) + 180) = *(unsigned char *)(result + 56);
    if (dword_100010248 <= 50)
    {
      if (dword_100010248 != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

uint64_t sub_100005028(uint64_t a1, const void *a2)
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2000000000;
  int v13 = 0;
  FigSimpleMutexLock();
  long long v4 = *(NSObject **)(a1 + 144);
  if (v4)
  {
    dispatch_retain(*(dispatch_object_t *)(a1 + 144));
    uint64_t v5 = *(const void **)(a1 + 112);
    *(void *)(a1 + 112) = a2;
    if (a2) {
      CFRetain(a2);
    }
    if (v5) {
      CFRelease(v5);
    }
    FigSimpleMutexUnlock();
    dispatch_semaphore_signal(v4);
    dispatch_release(v4);
  }
  else
  {
    FigSimpleMutexUnlock();
    uint64_t v6 = *(NSObject **)(a1 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100005168;
    block[3] = &unk_10000CB38;
    block[4] = &v10;
    void block[5] = a1;
    void block[6] = a2;
    dispatch_sync(v6, block);
  }
  if (*((_DWORD *)v11 + 6))
  {
    APSLogErrorAt();
    uint64_t v7 = *((unsigned int *)v11 + 6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

void sub_100005168(void *a1)
{
  uint64_t v1 = a1[5];
  if (*(unsigned char *)(v1 + 182))
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -6709;
  }
  else
  {
    uint64_t v2 = *(const void **)(v1 + 112);
    long long v3 = (const void *)a1[6];
    *(void *)(v1 + 112) = v3;
    if (v3) {
      CFRetain(v3);
    }
    if (v2)
    {
      CFRelease(v2);
    }
  }
}

void sub_1000051D8(uint64_t a1, CFTypeRef cf, int a3, int a4, int a5, uint64_t a6)
{
  if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (cf) {
    CFRetain(cf);
  }
  uint64_t v12 = *(NSObject **)(a1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_1000052EC;
  block[3] = &unk_10000CB88;
  int v14 = a4;
  int v15 = a5;
  void block[5] = a1;
  void block[6] = cf;
  int v16 = a3;
  block[4] = a6;
  dispatch_async(v12, block);
}

void sub_1000052EC(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  intptr_t v3 = *(void *)(a1 + 40);
  *(_DWORD *)(v3 + 168) = v2;
  int v4 = *(_DWORD *)(a1 + 60);
  if (!v4) {
    int v4 = 30;
  }
  *(_DWORD *)(v3 + 172) = v4;
  CFMutableDictionaryRef v5 = *(CFMutableDictionaryRef *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 64);
  CFTypeRef v55 = 0;
  CFTypeRef cf = 0;
  memset(v54, 0, sizeof(v54));
  if (!v5)
  {
    int v12 = -6705;
LABEL_104:
    APSLogErrorAt();
    goto LABEL_117;
  }
  if (*(unsigned char *)(v3 + 182))
  {
    int v12 = -6709;
LABEL_65:
    APSLogErrorAt();
    CFMutableDictionaryRef v5 = 0;
    goto LABEL_117;
  }
  if ((v2 & 3) == 0)
  {
    int v12 = -6705;
    goto LABEL_65;
  }
  switch(v6)
  {
    case 0:
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 != CFStringGetTypeID())
      {
        int v12 = -6705;
        goto LABEL_64;
      }
      if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v66 = 0;
      v67 = &v66;
      uint64_t v68 = 0x2000000000;
      int v69 = 0;
      CFTypeRef v64 = 0;
      v65 = 0;
      CFTypeRef v63 = 0;
      TestInfoDictionardouble y = (__CFDictionary *)APAdvertiserInfoCreateTestInfoDictionary();
      CFDictionarySetValue(TestInfoDictionary, kAPAdvertiserInfoProperty_DeviceName, v5);
      int v14 = (void *)CFDictionaryCopyCString();
      if (*((_DWORD *)v67 + 6))
      {
        APSLogErrorAt();
        Mutable = 0;
        CFMutableDictionaryRef v19 = 0;
        goto LABEL_75;
      }
      TextToHardwareAddressScalar();
      int v15 = APAdvertiserInfoCreate();
      *((_DWORD *)v67 + 6) = v15;
      if (v15)
      {
        APSLogErrorAt();
        Mutable = 0;
LABEL_163:
        CFMutableDictionaryRef v19 = 0;
        goto LABEL_75;
      }
      theArradouble y = (CFArrayRef)_NSConcreteStackBlock;
      uint64_t v58 = 0x40000000;
      v59 = sub_100007438;
      v60 = &unk_10000CC48;
      v61 = &v66;
      v62 = v65;
      CFDictionaryApplyBlock();
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetInt64();
      CFDictionarySetValue(Mutable, kAPBrowserEventInfoKey_DeviceInfo, v65);
      CFDictionarySetValue(Mutable, kAPBrowserEventInfoKey_IsLegacyPresent, kCFBooleanTrue);
      CFDictionarySetValue(Mutable, kAPBrowserEventInfoKey_IsModernPresent, kCFBooleanTrue);
      int v17 = APSNetworkAddressCreateWithString();
      *((_DWORD *)v67 + 6) = v17;
      if (v17 || (int v18 = APTransportDeviceCreateWithNetworkAddress(), (*((_DWORD *)v67 + 6) = v18) != 0))
      {
        APSLogErrorAt();
        goto LABEL_163;
      }
      CFMutableDictionaryRef v19 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      int v20 = APEndpointCreateWithTransportDevice();
      *((_DWORD *)v67 + 6) = v20;
      if (v20)
      {
        APSLogErrorAt();
      }
      else if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
LABEL_75:
      free(v14);
      if (TestInfoDictionary) {
        CFRelease(TestInfoDictionary);
      }
      if (Mutable) {
        CFRelease(Mutable);
      }
      if (v19) {
        CFRelease(v19);
      }
      if (v65) {
        CFRelease(v65);
      }
      if (v64) {
        CFRelease(v64);
      }
      if (v63) {
        CFRelease(v63);
      }
      int v12 = *((_DWORD *)v67 + 6);
      _Block_object_dispose(&v66, 8);
      if (v12) {
        goto LABEL_64;
      }
      CFMutableDictionaryRef v5 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v5, kAPEndpointActivationOptionKey_SkipAudioHALDeviceCreation, kCFBooleanTrue);
      if (*(unsigned char *)(v3 + 168))
      {
        CFDictionarySetValue(v5, kAPEndpointActivationOptionKey_ForceTCPScreenMirroring, kCFBooleanTrue);
        CFDictionarySetValue(v5, kFigEndpointActivateOptionKey_PrimaryUsage, kFigEndpointPrimaryUsage_Screen);
        CFDictionarySetValue(v5, kAPEndpointActivationOptionKey_ScreenSource, *(const void **)(v3 + 48));
        uint64_t v32 = *(const void **)(v3 + 104);
        if (v32) {
          CFDictionarySetValue(v5, kAPEndpointActivationOptionKey_ScreenOverrides, v32);
        }
      }
      if ((*(unsigned char *)(v3 + 168) & 2) != 0)
      {
        if (!*(_DWORD *)(v3 + 72))
        {
          int v12 = -6705;
          goto LABEL_104;
        }
        if (*(unsigned char *)(v3 + 180)) {
          CFDictionarySetValue(v5, kFigEndpointActivateOptionKey_PrimaryUsage, kFigEndpointPrimaryUsage_Screen);
        }
      }
      uint64_t v33 = *(void *)(v3 + 112);
      if (v33)
      {
        uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
        uint64_t v35 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v35) {
          uint64_t v36 = v35;
        }
        else {
          uint64_t v36 = 0;
        }
        v37 = *(uint64_t (**)(uint64_t, void, uint64_t))(v36 + 56);
        if (!v37)
        {
          int v12 = -12782;
          goto LABEL_104;
        }
        int v38 = v37(CMBaseObject, kFigEndpointProperty_Password, v33);
        if (v38)
        {
          int v12 = v38;
          goto LABEL_104;
        }
      }
      memset((char *)&v54[1] + 8, 0, 40);
      *(void *)&v54[0] = v3;
      *((void *)&v54[0] + 1) = sub_100006B4C;
      *(void *)&v54[1] = sub_100006CB0;
      uint64_t v39 = *(void *)(v3 + 40);
      uint64_t v40 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v40) {
        uint64_t v41 = v40;
      }
      else {
        uint64_t v41 = 0;
      }
      v42 = *(void (**)(uint64_t, _OWORD *))(v41 + 40);
      if (v42) {
        v42(v39, v54);
      }
      int v43 = FigEndpointActivateSync();
      if (v43)
      {
        int v12 = v43;
        goto LABEL_104;
      }
      int v44 = *(_DWORD *)(v3 + 168);
      if (v44)
      {
        int StreamOfType = FigEndpointCopyFirstStreamOfType();
        if (StreamOfType)
        {
          int v12 = StreamOfType;
          goto LABEL_104;
        }
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterAddListener();
        int v46 = FigEndpointStreamResume();
        if (v46)
        {
          int v12 = v46;
          goto LABEL_104;
        }
        int v44 = *(_DWORD *)(v3 + 168);
      }
      if ((v44 & 2) != 0)
      {
        int v47 = FigEndpointCopyFirstStreamOfType();
        if (v47)
        {
          int v12 = v47;
          goto LABEL_104;
        }
        int v48 = sub_100007950((uint64_t)v55, v3 + 64, 0, (uint64_t *)(v3 + 56));
        if (v48)
        {
          int v12 = v48;
          goto LABEL_104;
        }
      }
      int v12 = 0;
      *(unsigned char *)(v3 + 182) = 1;
LABEL_117:
      sub_100006F44(v3);
      if (cf) {
        CFRelease(cf);
      }
      if (v55) {
        CFRelease(v55);
      }
      if (v5) {
        CFRelease(v5);
      }
      if (v12)
      {
        if (dword_100010248 <= 90 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        sub_10000654C(v3, 0);
        APSLogErrorAt();
      }
      else if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 40) + 176) = v12;
      v49 = *(const void **)(a1 + 48);
      if (v49) {
        CFRelease(v49);
      }
      uint64_t v50 = *(void *)(a1 + 32);
      if (v50)
      {
        v51 = *(NSObject **)(*(void *)(a1 + 40) + 24);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_10000640C;
        block[3] = &unk_10000CB60;
        block[4] = v50;
        int v53 = v12;
        dispatch_async(v51, block);
      }
      return;
    case 1:
      CFTypeID v11 = CFGetTypeID(v5);
      if (v11 != CFStringGetTypeID())
      {
        int v12 = -6705;
        goto LABEL_64;
      }
      if (dword_100010248 > 50) {
        goto LABEL_25;
      }
      if (dword_100010248 != -1)
      {
        CFMutableDictionaryRef v9 = 0;
        goto LABEL_23;
      }
      CFMutableDictionaryRef v9 = 0;
      if (_LogCategory_Initialize()) {
        goto LABEL_23;
      }
      goto LABEL_41;
    case 2:
      CFTypeID v8 = CFGetTypeID(v5);
      if (v8 != CFStringGetTypeID())
      {
        int v12 = -6705;
        goto LABEL_64;
      }
      if (dword_100010248 > 50)
      {
LABEL_25:
        CFMutableDictionaryRef v9 = 0;
        goto LABEL_41;
      }
      if (dword_100010248 != -1)
      {
        CFMutableDictionaryRef v9 = 0;
        goto LABEL_23;
      }
      CFMutableDictionaryRef v9 = 0;
      if (_LogCategory_Initialize()) {
        goto LABEL_23;
      }
      goto LABEL_41;
    case 3:
      CFTypeID v10 = CFGetTypeID(v5);
      if (v10 != CFDictionaryGetTypeID())
      {
        int v12 = -6705;
        goto LABEL_64;
      }
      if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize()))
      {
        CFMutableDictionaryRef v9 = v5;
LABEL_23:
        LogPrintF();
      }
      else
      {
        CFMutableDictionaryRef v9 = v5;
      }
LABEL_41:
      if (qword_1000103D0 != -1) {
        dispatch_once(&qword_1000103D0, &stru_10000CC88);
      }
      unsigned int v21 = *(_DWORD *)(v3 + 172);
      if ((v21 & 0x80000000) != 0) {
        dispatch_time_t v22 = -1;
      }
      else {
        dispatch_time_t v22 = dispatch_time(0, 1000000000 * v21);
      }
      while (1)
      {
        char v23 = qword_1000103C8;
        dispatch_time_t v24 = dispatch_time(0, 1000000000);
        if (!dispatch_semaphore_wait(v23, v24)) {
          break;
        }
        if (v22 <= dispatch_time(0, 0))
        {
          int v12 = -6722;
          goto LABEL_63;
        }
        if (*(unsigned char *)(v3 + 181))
        {
          int v12 = -6723;
LABEL_63:
          APSLogErrorAt();
          goto LABEL_64;
        }
      }
      *(void *)(v3 + 160) = qword_1000103C8;
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterAddListener();
      if (v9)
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterPostNotification();
        if (dword_100010248 > 50 || dword_100010248 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_67;
        }
      }
      else
      {
        uint64_t v25 = *(void *)(v3 + 32);
        uint64_t v26 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v26) {
          uint64_t v27 = v26;
        }
        else {
          uint64_t v27 = 0;
        }
        CFTypeRef v28 = *(uint64_t (**)(uint64_t, void, void))(v27 + 8);
        if (!v28)
        {
          int v12 = -12782;
          goto LABEL_63;
        }
        int v29 = v28(v25, kFigEndpointManagerDiscoveryMode_DetailedDiscovery, 0);
        if (v29)
        {
          int v12 = v29;
          goto LABEL_63;
        }
        if (dword_100010248 > 50 || dword_100010248 == -1 && !_LogCategory_Initialize())
        {
LABEL_67:
          theArradouble y = 0;
          unsigned int v30 = *(_DWORD *)(v3 + 172);
          if ((v30 & 0x80000000) != 0) {
            dispatch_time_t v31 = -1;
          }
          else {
            dispatch_time_t v31 = dispatch_time(0, 1000000000 * v30);
          }
          while (1)
          {
            if (v31 <= dispatch_time(0, 0))
            {
              int v12 = -6722;
              goto LABEL_145;
            }
            if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v3 + 152), v31))
            {
              int v12 = -6722;
              goto LABEL_145;
            }
            if (*(unsigned char *)(v3 + 181)) {
              break;
            }
            FigEndpointManagerCopyEndpointsForType();
          }
          int v12 = -6723;
LABEL_145:
          APSLogErrorAt();
          CMNotificationCenterGetDefaultLocalCenter();
          CMNotificationCenterRemoveListener();
LABEL_64:
          APSLogErrorAt();
          goto LABEL_65;
        }
      }
      LogPrintF();
      goto LABEL_67;
    default:
      int v12 = -6705;
      goto LABEL_64;
  }
}

uint64_t sub_10000640C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void sub_100006424(uint64_t a1)
{
  if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  *(unsigned char *)(a1 + 181) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 152));
  FigSimpleMutexLock();
  int v2 = *(NSObject **)(a1 + 144);
  if (v2)
  {
    if (*(void *)(a1 + 112))
    {
      CFRelease(*(CFTypeRef *)(a1 + 112));
      *(void *)(a1 + 112) = 0;
      int v2 = *(NSObject **)(a1 + 144);
    }
    dispatch_semaphore_signal(v2);
  }
  FigSimpleMutexUnlock();
  intptr_t v3 = *(NSObject **)(a1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100006540;
  block[3] = &unk_10000CBA8;
  block[4] = a1;
  dispatch_sync(v3, block);
}

void sub_100006540(uint64_t a1)
{
}

void sub_10000654C(intptr_t a1, int a2)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  sub_100006F44(a1);
  if (*(void *)(a1 + 40))
  {
    FigEndpointDeactivate();
    int v4 = *(const void **)(a1 + 40);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 40) = 0;
    }
  }
  CFMutableDictionaryRef v5 = *(const void **)(a1 + 56);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 56) = 0;
  }
  if (a2)
  {
    *(_WORD *)(a1 + 181) = 0;
    *(_DWORD *)(a1 + 176) = 0;
  }
}

uint64_t sub_1000065CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = 0;
  CFTypeID v8 = &v7;
  uint64_t v9 = 0x2000000000;
  int v10 = 0;
  intptr_t v3 = *(NSObject **)(a1 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000;
  v6[2] = sub_10000667C;
  v6[3] = &unk_10000CBD0;
  v6[4] = &v7;
  v6[5] = a1;
  v6[6] = a2;
  void v6[7] = a3;
  dispatch_sync(v3, v6);
  uint64_t v4 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t sub_10000667C(void *a1)
{
  uint64_t v2 = a1[5];
  if (*(unsigned char *)(v2 + 182))
  {
    if (*(unsigned char *)(v2 + 168))
    {
      int v3 = *(_DWORD *)(v2 + 176);
      if (v3)
      {
        *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v3;
      }
      else
      {
        *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = sub_10000157C(*(void *)(v2 + 48), a1[6], a1[7]);
        uint64_t result = *(unsigned int *)(*(void *)(a1[4] + 8) + 24);
        if (!result) {
          return result;
        }
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -6705;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -6709;
  }
  return APSLogErrorAt();
}

uint64_t sub_100006790(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  uint64_t v2 = *(NSObject **)(a1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100006840;
  block[3] = &unk_10000CBF8;
  block[4] = &v6;
  void block[5] = a1;
  void block[6] = a2;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t sub_100006840(void *a1)
{
  uint64_t v2 = a1[5];
  if (*(unsigned char *)(v2 + 182))
  {
    uint64_t v3 = *(void *)(v2 + 56);
    if (v3)
    {
      int v4 = *(_DWORD *)(v2 + 176);
      if (v4)
      {
        *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v4;
      }
      else
      {
        *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = sub_100007DC0(v3, a1[6]);
        uint64_t result = *(unsigned int *)(*(void *)(a1[4] + 8) + 24);
        if (!result) {
          return result;
        }
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -6705;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = -6709;
  }
  return APSLogErrorAt();
}

uint64_t sub_100006950(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, char a5)
{
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2000000000;
  int v15 = 0;
  CFMutableDictionaryRef v5 = *(NSObject **)(a1 + 16);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000;
  v8[2] = sub_100006A14;
  v8[3] = &unk_10000CC20;
  v8[4] = &v12;
  v8[5] = a1;
  long long v9 = *a3;
  uint64_t v10 = *((void *)a3 + 2);
  v8[6] = a2;
  v8[7] = a4;
  char v11 = a5;
  dispatch_sync(v5, v8);
  uint64_t v6 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t sub_100006A14(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 182))
  {
    uint64_t v3 = *(void *)(v2 + 56);
    if (v3)
    {
      int v4 = *(_DWORD *)(v2 + 176);
      if (!v4)
      {
        uint64_t v5 = *(void *)(a1 + 48);
        uint64_t v6 = *(void *)(a1 + 56);
        char v7 = *(unsigned char *)(a1 + 88);
        long long v9 = *(_OWORD *)(a1 + 64);
        uint64_t v10 = *(void *)(a1 + 80);
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sub_100008274(v3, v5, &v9, v6, v7);
        uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        if (result) {
          return APSLogErrorAt();
        }
        return result;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -6705;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -6709;
  }
  return APSLogErrorAt();
}

void sub_100006B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, CFTypeRef, uint64_t, uint64_t), uint64_t a7)
{
  FigCFEqual();
  if (!*(void *)(a4 + 120))
  {
    CFTypeRef v15 = 0;
    if (!a6) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  FigSimpleMutexLock();
  *(void *)(a4 + 144) = dispatch_semaphore_create(0);
  char v11 = *(const void **)(a4 + 112);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(a4 + 112) = 0;
  }
  FigSimpleMutexUnlock();
  (*(void (**)(void))(*(void *)(a4 + 120) + 16))();
  uint64_t v12 = *(NSObject **)(a4 + 144);
  unsigned int v13 = *(_DWORD *)(a4 + 172);
  if ((v13 & 0x80000000) != 0) {
    dispatch_time_t v14 = -1;
  }
  else {
    dispatch_time_t v14 = dispatch_time(0, 1000000000 * v13);
  }
  dispatch_semaphore_wait(v12, v14);
  FigSimpleMutexLock();
  int v16 = *(NSObject **)(a4 + 144);
  if (v16)
  {
    dispatch_release(v16);
    *(void *)(a4 + 144) = 0;
  }
  int v17 = *(const void **)(a4 + 112);
  if (v17) {
    CFTypeRef v15 = CFRetain(v17);
  }
  else {
    CFTypeRef v15 = 0;
  }
  FigSimpleMutexUnlock();
  if (a6)
  {
LABEL_15:
    if (v15) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = 4294950568;
    }
    a6(a1, v15, v18, a7);
  }
LABEL_19:
  if (v15)
  {
    CFRelease(v15);
  }
}

void sub_100006CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int Int64 = CFDictionaryGetInt64();
  if (dword_100010248 <= 100 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v6 = *(NSObject **)(a4 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100007530;
  block[3] = &unk_10000CCD0;
  if (Int64) {
    int v7 = Int64;
  }
  else {
    int v7 = -6762;
  }
  block[4] = a4;
  int v9 = v7;
  dispatch_sync(v6, block);
}

void sub_100006DC0(int a1, const void *a2, int a3, int a4, const __CFDictionary *cf)
{
  CFDictionaryRef Mutable = cf;
  if (cf)
  {
    CFTypeID v7 = CFGetTypeID(cf);
    if (v7 == CFDictionaryGetTypeID())
    {
      CFDictionaryGetInt64();
      CFDictionaryGetValue(Mutable, kFigEndpointStreamNotificationKey_Reason);
      CFDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      FigCFDictionarySetInt32();
    }
    else
    {
      CFDictionaryRef Mutable = 0;
    }
  }
  if (dword_100010248 <= 90 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"APMediaSender_VideoStreamFailed", a2, Mutable, 1u);
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

intptr_t sub_100006F44(intptr_t result)
{
  uint64_t v1 = *(NSObject **)(result + 160);
  if (v1)
  {
    intptr_t v2 = result;
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    uint64_t v3 = *(void *)(v2 + 32);
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void (**)(uint64_t, void, void))(v5 + 8);
    if (v6) {
      v6(v3, kFigEndpointManagerDiscoveryMode_None, 0);
    }
    if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    *(void *)(v2 + 160) = 0;
    return dispatch_semaphore_signal(v1);
  }
  return result;
}

uint64_t sub_1000070B8(const void *a1, const void *a2)
{
  CFTypeRef cf1 = 0;
  CFAllocatorRef v3 = CFGetAllocator(a1);
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFTypeID v7 = *(unsigned int (**)(uint64_t, void, CFAllocatorRef, CFTypeRef *))(v6 + 48);
  if (!v7 || v7(CMBaseObject, kFigEndpointProperty_Name, v3, &cf1))
  {
    APSLogErrorAt();
    uint64_t v8 = 0;
  }
  else
  {
    if (!cf1) {
      return 0;
    }
    uint64_t v8 = CFEqual(cf1, a2);
  }
  if (cf1) {
    CFRelease(cf1);
  }
  return v8;
}

BOOL sub_1000071E4(const void *a1, const __CFString *a2)
{
  CFStringRef theString1 = 0;
  CFAllocatorRef v3 = CFGetAllocator(a1);
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFTypeID v7 = *(unsigned int (**)(uint64_t, void, CFAllocatorRef, CFStringRef *))(v6 + 48);
  if (!v7 || v7(CMBaseObject, kFigEndpointProperty_ID, v3, &theString1))
  {
    APSLogErrorAt();
    BOOL v8 = 0;
  }
  else
  {
    if (!theString1) {
      return 0;
    }
    BOOL v8 = CFStringCompare(theString1, a2, 1uLL) == kCFCompareEqualTo;
  }
  if (theString1) {
    CFRelease(theString1);
  }
  return v8;
}

BOOL sub_100007318(const void *a1)
{
  CFTypeRef cf = 0;
  CFAllocatorRef v1 = CFGetAllocator(a1);
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(unsigned int (**)(uint64_t, void, CFAllocatorRef, CFTypeRef *))(v4 + 48);
  if (v5 && !v5(CMBaseObject, kFigEndpointProperty_AutoconnectEnabled, v1, &cf))
  {
    CFTypeRef v6 = cf;
    BOOL v7 = cf == kCFBooleanTrue;
    if (!cf) {
      return v7;
    }
    goto LABEL_9;
  }
  APSLogErrorAt();
  BOOL v7 = 0;
  CFTypeRef v6 = cf;
  if (cf) {
LABEL_9:
  }
    CFRelease(v6);
  return v7;
}

uint64_t sub_100007438(uint64_t a1)
{
  uint64_t result = APAdvertiserInfoSetProperty();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    if (dword_100010248 <= 90)
    {
      if (dword_100010248 != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  return result;
}

void sub_100007504(id a1)
{
  qword_1000103C8 = (uint64_t)dispatch_semaphore_create(1);
}

intptr_t sub_100007528(uint64_t a1, uint64_t a2)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a2 + 152));
}

void sub_100007530(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 128);
  if (*(_DWORD *)(v2 + 176)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (!v4)
  {
    uint64_t v5 = *(NSObject **)(v2 + 24);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000;
    v6[2] = sub_1000075D8;
    v6[3] = &unk_10000CCB0;
    v6[4] = v3;
    int v7 = *(_DWORD *)(a1 + 40);
    dispatch_async(v5, v6);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(_DWORD *)(v2 + 176) = *(_DWORD *)(a1 + 40);
}

uint64_t sub_1000075D8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

int main(int argc, const char **argv, const char **envp)
{
}

uint64_t sub_100007614()
{
  bzero(v2, 0x400uLL);
  _set_user_dir_suffix();
  uint64_t result = confstr(65537, v2, 0x400uLL);
  if (result)
  {
    if (dword_100010248 <= 50)
    {
      if (dword_100010248 != -1) {
        return LogPrintF();
      }
      uint64_t result = _LogCategory_Initialize();
      if (result) {
        return LogPrintF();
      }
    }
  }
  else if (dword_100010248 <= 90)
  {
    if (dword_100010248 != -1 || (uint64_t result = _LogCategory_Initialize(), result))
    {
      CFAllocatorRef v1 = __error();
      strerror(*v1);
      return LogPrintF();
    }
  }
  return result;
}

void sub_100007750(_xpc_connection_s *a1)
{
  if (qword_1000103D8 || FigXPCServerStartWithClientXPCConnection())
  {
    APSLogErrorAt();
    if (dword_100010248 <= 100 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    xpc_connection_cancel(a1);
  }
  else if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize()))
  {
    xpc_connection_get_pid(a1);
    LogPrintF();
  }
}

uint64_t sub_1000078D0()
{
  return 1;
}

uint64_t sub_1000078D8()
{
  if (qword_1000103E0 != -1) {
    dispatch_once_f(&qword_1000103E0, 0, (dispatch_function_t)sub_100007928);
  }
  return qword_1000103E8;
}

uint64_t sub_100007928()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_1000103E8 = result;
  return result;
}

uint64_t sub_100007950(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  if (qword_1000103E0 != -1) {
    dispatch_once_f(&qword_1000103E0, 0, (dispatch_function_t)sub_100007928);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    APSLogErrorAt();
    return 4294960568;
  }
  uint64_t v8 = Instance;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  int v9 = (AudioStreamBasicDescription *)(Instance + 32);
  *(void *)(Instance + 24) = CFStringCreateF();
  SNPrintF();
  *(void *)(v8 + 16) = dispatch_queue_create(label, 0);
  SNPrintF();
  dispatch_queue_t v10 = dispatch_queue_create(label, 0);
  *(_OWORD *)(v8 + 112) = *(_OWORD *)&kCMTimeZero.value;
  *(void *)(v8 + 128) = kCMTimeZero.epoch;
  *(void *)(v8 + 136) = v10;
  uint64_t v11 = *(void *)(a2 + 32);
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v9->mSampleRate = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 48) = v12;
  *(void *)(v8 + 64) = v11;
  *(void *)(v8 + 80) = FigCFWeakReferenceHolderCreateWithReferencedObject();
  if (a3 <= 0) {
    int v13 = 5;
  }
  else {
    int v13 = a3;
  }
  *(_DWORD *)(v8 + 148) = v13;
  uint64_t v14 = CMAudioFormatDescriptionCreate(kCFAllocatorDefault, v9, 0, 0, 0, 0, 0, (CMAudioFormatDescriptionRef *)(v8 + 72));
  if (v14)
  {
    uint64_t v22 = v14;
    goto LABEL_19;
  }
  uint64_t CMBaseObject = FigEndpointStreamGetCMBaseObject();
  uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, uint64_t))(v17 + 48);
  if (!v18)
  {
    uint64_t v22 = 4294954514;
LABEL_19:
    APSLogErrorAt();
    CFRelease((CFTypeRef)v8);
    return v22;
  }
  uint64_t v19 = v18(CMBaseObject, kFigEndpointStreamProperty_AudioEngineClone, kCFAllocatorDefault, v8 + 88);
  if (v19)
  {
    uint64_t v22 = v19;
    goto LABEL_19;
  }
  uint64_t v20 = FigEndpointAudioSourceBufferQueueCreate();
  if (v20)
  {
    uint64_t v22 = v20;
    goto LABEL_19;
  }
  uint64_t v21 = sub_100007CE0(*(void *)(v8 + 96), kFigEndpointAudioSourceBufferQueueProperty_BufferQueue, (uint64_t)kCFAllocatorDefault, v8 + 104);
  if (v21)
  {
    uint64_t v22 = v21;
    goto LABEL_19;
  }
  if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v22 = 0;
  *a4 = v8;
  return v22;
}

uint64_t sub_100007CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t CMBaseObject = FigEndpointAudioSourceGetCMBaseObject();
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  dispatch_queue_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10) {
    return 4294954514;
  }
  return v10(CMBaseObject, a2, a3, a4);
}

uint64_t sub_100007DC0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  uint64_t v2 = *(NSObject **)(a1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100007E70;
  block[3] = &unk_10000CD28;
  void block[5] = a2;
  void block[6] = a1;
  block[4] = &v6;
  dispatch_sync(v2, block);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t sub_100007E70(uint64_t a1)
{
  CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 48);
  CMTimeMake(&rhs, Length / *(unsigned int *)(v3 + 48), (int)*(double *)(v3 + 32));
  CMTime lhs = *(CMTime *)(v3 + 112);
  CMTimeAdd(&v11, &lhs, &rhs);
  *(CMTime *)(v3 + 112) = v11;
  memset(&v11, 0, sizeof(v11));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v11, HostTimeClock);
  CFDataRef v6 = *(const __CFData **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  CMTime lhs = v11;
  CMTime v8 = *(CMTime *)(v5 + 112);
  uint64_t result = sub_100007F3C(v5, v6, (long long *)&lhs.value, &v8);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100007F3C(uint64_t a1, CFDataRef theData, long long *a3, CMTime *a4)
{
  if (*(_DWORD *)(a1 + 40) != 1819304813)
  {
    uint64_t v5 = 4294960591;
    goto LABEL_22;
  }
  if (!theData)
  {
    if (!*(unsigned char *)(a1 + 152)) {
      return 0;
    }
    *(unsigned char *)(a1 + 152) = 0;
    *(_OWORD *)(a1 + 112) = *(_OWORD *)&kCMTimeZero.value;
    *(void *)(a1 + 128) = kCMTimeZero.epoch;
    CFTypeRef v15 = *(NSObject **)(a1 + 136);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 0x40000000;
    v18[2] = sub_1000087AC;
    v18[3] = &unk_10000CDF0;
    v18[4] = a1;
    dispatch_sync(v15, v18);
    CMBufferQueueReset(*(CMBufferQueueRef *)(a1 + 104));
    uint64_t v5 = 0;
    uint64_t v16 = atomic_load((unsigned int *)(a1 + 144));
    if (v16)
    {
      APSLogErrorAt();
      return v16;
    }
    return v5;
  }
  uint64_t v5 = atomic_load((unsigned int *)(a1 + 144));
  if (v5)
  {
LABEL_22:
    APSLogErrorAt();
    return v5;
  }
  CMTime v22 = *a4;
  dispatch_time_t v24 = 0;
  CMSampleBufferRef sampleBufferOut = 0;
  unint64_t Length = CFDataGetLength(theData);
  unint64_t v8 = *(unsigned int *)(a1 + 48);
  CMItemCount v9 = Length / v8;
  if (Length % v8)
  {
    uint64_t v5 = 4294960591;
LABEL_25:
    APSLogErrorAt();
    goto LABEL_28;
  }
  BlockBufferWithCFDataNoCopdouble y = FigCreateBlockBufferWithCFDataNoCopy();
  if (BlockBufferWithCFDataNoCopy)
  {
    uint64_t v5 = BlockBufferWithCFDataNoCopy;
    goto LABEL_25;
  }
  CMTime v11 = *(const opaqueCMFormatDescription **)(a1 + 72);
  CMTime presentationTimeStamp = v22;
  uint64_t v5 = CMAudioSampleBufferCreateReadyWithPacketDescriptions(kCFAllocatorDefault, v24, v11, v9, &presentationTimeStamp, 0, &sampleBufferOut);
  if (!v5)
  {
    CMSampleBufferRef v12 = sampleBufferOut;
    CMSampleBufferRef sampleBufferOut = 0;
    goto LABEL_8;
  }
  APSLogErrorAt();
  if (sampleBufferOut) {
    CFRelease(sampleBufferOut);
  }
LABEL_28:
  CMSampleBufferRef v12 = 0;
LABEL_8:
  if (v24) {
    CFRelease(v24);
  }
  if (v5)
  {
LABEL_31:
    APSLogErrorAt();
    if (!v12) {
      return v5;
    }
    goto LABEL_15;
  }
  uint64_t v13 = CMBufferQueueEnqueue(*(CMBufferQueueRef *)(a1 + 104), v12);
  if (v13)
  {
    uint64_t v5 = v13;
    goto LABEL_31;
  }
  if (!*(unsigned char *)(a1 + 152))
  {
    *(unsigned char *)(a1 + 152) = 1;
    CFRetain((CFTypeRef)a1);
    uint64_t v14 = *(NSObject **)(a1 + 136);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100008464;
    block[3] = &unk_10000CDD0;
    block[4] = a1;
    long long v20 = *a3;
    uint64_t v21 = *((void *)a3 + 2);
    dispatch_async(v14, block);
  }
  uint64_t v5 = 0;
  if (v12) {
LABEL_15:
  }
    CFRelease(v12);
  return v5;
}

uint64_t sub_100008274(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, char a5)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000;
  int v15 = 0;
  uint64_t v5 = *(NSObject **)(a1 + 16);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000;
  v8[2] = sub_100008338;
  v8[3] = &unk_10000CD50;
  v8[4] = &v12;
  v8[5] = a1;
  v8[6] = a4;
  v8[7] = a2;
  long long v9 = *a3;
  uint64_t v10 = *((void *)a3 + 2);
  char v11 = a5;
  dispatch_sync(v5, v8);
  uint64_t v6 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t sub_100008338(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  CMTimeMake(&v7, *(void *)(a1 + 48), (int)*(double *)(v2 + 32));
  *(CMTime *)(v2 + 112) = v7;
  uint64_t v3 = *(void *)(a1 + 40);
  CFDataRef v4 = *(const __CFData **)(a1 + 56);
  CMTime v7 = *(CMTime *)(a1 + 64);
  CMTime v6 = *(CMTime *)(v3 + 112);
  uint64_t result = sub_100007F3C(v3, v4, (long long *)&v7.value, &v6);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_1000083C4(void *a1)
{
  uint64_t v2 = (const void *)a1[3];
  if (v2)
  {
    CFRelease(v2);
    a1[3] = 0;
  }
  uint64_t v3 = (const void *)a1[9];
  if (v3)
  {
    CFRelease(v3);
    a1[9] = 0;
  }
  CFDataRef v4 = (const void *)a1[10];
  if (v4)
  {
    CFRelease(v4);
    a1[10] = 0;
  }
  uint64_t v5 = (const void *)a1[11];
  if (v5)
  {
    CFRelease(v5);
    a1[11] = 0;
  }
  CMTime v6 = (const void *)a1[12];
  if (v6)
  {
    CFRelease(v6);
    a1[12] = 0;
  }
  CMTime v7 = (const void *)a1[13];
  if (v7)
  {
    CFRelease(v7);
    a1[13] = 0;
  }
  unint64_t v8 = a1[17];
  if (v8)
  {
    dispatch_release(v8);
    a1[17] = 0;
  }
  long long v9 = a1[2];
  if (v9)
  {
    dispatch_release(v9);
    a1[2] = 0;
  }
}

void sub_100008464(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(_OWORD *)&v15.value = *(_OWORD *)(a1 + 40);
  v15.epoch = *(void *)(a1 + 56);
  uint64_t v3 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
  if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!v3)
  {
    unsigned int v14 = -6709;
    APSLogErrorAt();
    goto LABEL_25;
  }
  CFDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, kFigEndpointStreamAudioEngineResumeOption_AudioSource, *(const void **)(v2 + 96));
  CMTime time = v15;
  unsigned int v5 = FigCFDictionarySetCMTime();
  if (v5)
  {
    unsigned int v14 = v5;
LABEL_30:
    APSLogErrorAt();
    CFDictionaryRef v8 = 0;
    goto LABEL_21;
  }
  unsigned int v6 = FigEndpointStreamAudioEngineResumeSync();
  if (v6)
  {
    unsigned int v14 = v6;
    goto LABEL_30;
  }
  unsigned int v7 = FigEndpointStreamAudioEngineSetEndpointStreamSync();
  if (v7)
  {
    unsigned int v14 = v7;
    goto LABEL_30;
  }
  CMTime time = kCMTimeZero;
  CFDictionaryRef v8 = CMTimeCopyAsDictionary(&time, kCFAllocatorDefault);
  uint64_t CMBaseObject = FigEndpointStreamAudioEngineGetCMBaseObject();
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(uint64_t (**)(uint64_t, void, CFDictionaryRef))(v11 + 56);
  if (v12)
  {
    unsigned int v13 = v12(CMBaseObject, kAPAudioEngineProperty_AudioSourceFirstFrameAnchorTime, v8);
    if (!v13)
    {
      if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      unsigned int v14 = 0;
      goto LABEL_21;
    }
    unsigned int v14 = v13;
  }
  else
  {
    unsigned int v14 = -12782;
  }
  APSLogErrorAt();
LABEL_21:
  CFRelease(v3);
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v8) {
    CFRelease(v8);
  }
LABEL_25:
  atomic_store(v14, (unsigned int *)(v2 + 144));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t sub_1000087AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (dword_100010248 <= 50 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t result = FigEndpointStreamAudioEngineSuspendSync();
  unsigned int v3 = result;
  if (result)
  {
    uint64_t result = APSLogErrorAt();
  }
  else if (dword_100010248 <= 50)
  {
    if (dword_100010248 != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF();
    }
  }
  atomic_store(v3, (unsigned int *)(v1 + 144));
  return result;
}

uint64_t sub_1000088DC(__CVBuffer *a1, uint64_t a2, void *a3)
{
  long long v14 = 0u;
  long long v15 = 0u;
  emptdouble y = xpc_dictionary_create_empty();
  unsigned int v7 = empty;
  uint64_t bytes = a2;
  if (!a1)
  {
    xpc_dictionary_set_data(empty, "data", &bytes, 0x28uLL);
    goto LABEL_9;
  }
  IOSurface = CVPixelBufferGetIOSurface(a1);
  if (IOSurface)
  {
    xpc_object_t XPCObject = IOSurfaceCreateXPCObject(IOSurface);
    if (XPCObject)
    {
      xpc_dictionary_set_value(v7, "surface", XPCObject);
      CVPixelBufferGetExtendedPixels(a1, (size_t *)&v14, (size_t *)&v14 + 1, (size_t *)&v15, (size_t *)&v15 + 1);
      CFDictionaryRef v10 = CVBufferCopyAttachments(a1, kCVAttachmentMode_ShouldPropagate);
      xpc_dictionary_set_data(v7, "data", &bytes, 0x28uLL);
      if (v10)
      {
        uint64_t v11 = FigXPCMessageSetCFDictionary();
        if (v11) {
          APSLogErrorAt();
        }
        else {
          *a3 = v7;
        }
        CFRelease(v10);
        goto LABEL_10;
      }
LABEL_9:
      uint64_t v11 = 0;
      *a3 = v7;
      goto LABEL_10;
    }
    if (dword_100010248 <= 90 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v11 = 4294960534;
  }
  else
  {
    if (dword_100010248 <= 90 && (dword_100010248 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v11 = 4294960591;
  }
LABEL_10:
  FigXPCRelease();
  FigXPCRelease();
  return v11;
}

uint64_t sub_100008AF8(void *a1, CVPixelBufferRef *a2, void *a3)
{
  size_t length = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  data = xpc_dictionary_get_data(a1, "data", &length);
  if (!data)
  {
    if (dword_100010248 > 90 || dword_100010248 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_36;
    }
LABEL_35:
    LogPrintF();
LABEL_36:
    CFDictionaryRef Mutable = 0;
    uint64_t v15 = 4294960591;
    goto LABEL_23;
  }
  if (length != 40)
  {
    if (dword_100010248 > 90 || dword_100010248 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  unsigned int v7 = data;
  xpc_object_t value = xpc_dictionary_get_value(a1, "surface");
  if (!value)
  {
    uint64_t v15 = 0;
    CFDictionaryRef Mutable = 0;
    *a3 = *v7;
    *a2 = 0;
    CVPixelBufferRef pixelBufferOut = 0;
    goto LABEL_23;
  }
  IOSurfaceRef v9 = IOSurfaceLookupFromXPCObject(value);
  if (!v9)
  {
    if (dword_100010248 > 90 || dword_100010248 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  CFDictionaryRef v10 = v9;
  uint64_t v11 = FigXPCMessageCopyCFDictionary();
  if (v11)
  {
    uint64_t v15 = v11;
    APSLogErrorAt();
    CFDictionaryRef Mutable = 0;
  }
  else
  {
    if (v7[1] || v7[2] || v7[3] || v7[4])
    {
      CFAllocatorRef v12 = kCFAllocatorDefault;
      CFDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v7[1]) {
        FigCFDictionarySetInt64();
      }
      if (v7[2]) {
        FigCFDictionarySetInt64();
      }
      if (v7[3]) {
        FigCFDictionarySetInt64();
      }
      if (v7[4]) {
        FigCFDictionarySetInt64();
      }
    }
    else
    {
      CFDictionaryRef Mutable = 0;
      CFAllocatorRef v12 = kCFAllocatorDefault;
    }
    uint64_t v14 = CVPixelBufferCreateWithIOSurface(v12, v10, Mutable, &pixelBufferOut);
    if (v14)
    {
      uint64_t v15 = v14;
      APSLogErrorAt();
    }
    else
    {
      uint64_t v15 = 0;
      *a3 = *v7;
      *a2 = pixelBufferOut;
      CVPixelBufferRef pixelBufferOut = 0;
    }
  }
  CFRelease(v10);
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
LABEL_23:
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v15;
}

uint64_t sub_100008E3C(int a1)
{
  if (a1 != -1) {
    return LogPrintF();
  }
  uint64_t result = _LogCategory_Initialize();
  if (result) {
    return LogPrintF();
  }
  return result;
}

uint64_t sub_100008EB4(int a1)
{
  if (a1 != -1) {
    return LogPrintF();
  }
  uint64_t result = _LogCategory_Initialize();
  if (result) {
    return LogPrintF();
  }
  return result;
}

uint64_t sub_100008F2C(int a1)
{
  if (a1 != -1) {
    return LogPrintF();
  }
  uint64_t result = _LogCategory_Initialize();
  if (result) {
    return LogPrintF();
  }
  return result;
}

uint64_t APAdvertiserInfoCreate()
{
  return _APAdvertiserInfoCreate();
}

uint64_t APAdvertiserInfoCreateTestInfoDictionary()
{
  return _APAdvertiserInfoCreateTestInfoDictionary();
}

uint64_t APAdvertiserInfoSetProperty()
{
  return _APAdvertiserInfoSetProperty();
}

uint64_t APEndpointCreateWithTransportDevice()
{
  return _APEndpointCreateWithTransportDevice();
}

uint64_t APEndpointManagerCreate()
{
  return _APEndpointManagerCreate();
}

uint64_t APSLogErrorAt()
{
  return _APSLogErrorAt();
}

uint64_t APSNetworkAddressCreateWithString()
{
  return _APSNetworkAddressCreateWithString();
}

uint64_t APTransportDeviceCreateWithNetworkAddress()
{
  return _APTransportDeviceCreateWithNetworkAddress();
}

uint64_t ASPrintF()
{
  return _ASPrintF();
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

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

uint64_t CFDictionaryApplyBlock()
{
  return _CFDictionaryApplyBlock();
}

uint64_t CFDictionaryCopyCString()
{
  return _CFDictionaryCopyCString();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

uint64_t CFDictionaryGetInt64()
{
  return _CFDictionaryGetInt64();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

uint64_t CFDictionarySetInt64()
{
  return _CFDictionarySetInt64();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return _CFGetAllocator(cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
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

uint64_t CFStringCreateF()
{
  return _CFStringCreateF();
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return _CMAudioFormatDescriptionCreate(allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

OSStatus CMAudioSampleBufferCreateReadyWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return _CMAudioSampleBufferCreateReadyWithPacketDescriptions(allocator, dataBuffer, formatDescription, numSamples, presentationTimeStamp, packetDescriptions, sampleBufferOut);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return _CMBaseObjectGetDerivedStorage();
}

uint64_t CMBaseObjectGetVTable()
{
  return _CMBaseObjectGetVTable();
}

OSStatus CMBufferQueueEnqueue(CMBufferQueueRef queue, CMBufferRef buf)
{
  return _CMBufferQueueEnqueue(queue, buf);
}

OSStatus CMBufferQueueReset(CMBufferQueueRef queue)
{
  return _CMBufferQueueReset(queue);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return _CMClockGetHostTimeClock();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return _CMClockGetTime(retstr, clock);
}

uint64_t CMDerivedObjectCreate()
{
  return _CMDerivedObjectCreate();
}

uint64_t CMNotificationCenterAddListener()
{
  return _CMNotificationCenterAddListener();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return _CMNotificationCenterGetDefaultLocalCenter();
}

uint64_t CMNotificationCenterPostNotification()
{
  return _CMNotificationCenterPostNotification();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return _CMNotificationCenterRemoveListener();
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return _CMTimeAdd(retstr, lhs, rhs);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return _CMTimeCopyAsDictionary(time, allocator);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return _CVBufferCopyAttachments(buffer, attachmentMode);
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferCreateWithIOSurface(allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetIOSurface(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return _FigCFDictionaryGetBooleanIfPresent();
}

uint64_t FigCFDictionarySetCMTime()
{
  return _FigCFDictionarySetCMTime();
}

uint64_t FigCFDictionarySetInt32()
{
  return _FigCFDictionarySetInt32();
}

uint64_t FigCFDictionarySetInt64()
{
  return _FigCFDictionarySetInt64();
}

uint64_t FigCFEqual()
{
  return _FigCFEqual();
}

uint64_t FigCFWeakReferenceHolderCopyReferencedObject()
{
  return _FigCFWeakReferenceHolderCopyReferencedObject();
}

uint64_t FigCFWeakReferenceHolderCreateWithReferencedObject()
{
  return _FigCFWeakReferenceHolderCreateWithReferencedObject();
}

uint64_t FigCreateBlockBufferWithCFDataNoCopy()
{
  return _FigCreateBlockBufferWithCFDataNoCopy();
}

uint64_t FigDisplayModes_ExtractDimensionsFromTimingMode()
{
  return _FigDisplayModes_ExtractDimensionsFromTimingMode();
}

uint64_t FigDisplayModes_ExtractOverscanInfoFromTimingMode()
{
  return _FigDisplayModes_ExtractOverscanInfoFromTimingMode();
}

uint64_t FigDisplayModes_ExtractVSyncRateFromTimingMode()
{
  return _FigDisplayModes_ExtractVSyncRateFromTimingMode();
}

uint64_t FigDisplayModes_LookupTimingModeIDByIndex()
{
  return _FigDisplayModes_LookupTimingModeIDByIndex();
}

uint64_t FigEndpointActivateSync()
{
  return _FigEndpointActivateSync();
}

uint64_t FigEndpointAudioSourceBufferQueueCreate()
{
  return _FigEndpointAudioSourceBufferQueueCreate();
}

uint64_t FigEndpointAudioSourceGetCMBaseObject()
{
  return _FigEndpointAudioSourceGetCMBaseObject();
}

uint64_t FigEndpointCopyFirstStreamOfType()
{
  return _FigEndpointCopyFirstStreamOfType();
}

uint64_t FigEndpointDeactivate()
{
  return _FigEndpointDeactivate();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return _FigEndpointGetCMBaseObject();
}

uint64_t FigEndpointManagerCopyEndpointsForType()
{
  return _FigEndpointManagerCopyEndpointsForType();
}

uint64_t FigEndpointStreamAudioEngineGetCMBaseObject()
{
  return _FigEndpointStreamAudioEngineGetCMBaseObject();
}

uint64_t FigEndpointStreamAudioEngineResumeSync()
{
  return _FigEndpointStreamAudioEngineResumeSync();
}

uint64_t FigEndpointStreamAudioEngineSetEndpointStreamSync()
{
  return _FigEndpointStreamAudioEngineSetEndpointStreamSync();
}

uint64_t FigEndpointStreamAudioEngineSuspendSync()
{
  return _FigEndpointStreamAudioEngineSuspendSync();
}

uint64_t FigEndpointStreamGetCMBaseObject()
{
  return _FigEndpointStreamGetCMBaseObject();
}

uint64_t FigEndpointStreamResume()
{
  return _FigEndpointStreamResume();
}

uint64_t FigSimpleMutexCreate()
{
  return _FigSimpleMutexCreate();
}

uint64_t FigSimpleMutexDestroy()
{
  return _FigSimpleMutexDestroy();
}

uint64_t FigSimpleMutexLock()
{
  return _FigSimpleMutexLock();
}

uint64_t FigSimpleMutexUnlock()
{
  return _FigSimpleMutexUnlock();
}

uint64_t FigVirtualDisplaySourceGetClassID()
{
  return _FigVirtualDisplaySourceGetClassID();
}

uint64_t FigXPCCreateBasicMessage()
{
  return _FigXPCCreateBasicMessage();
}

uint64_t FigXPCMessageCopyCFDictionary()
{
  return _FigXPCMessageCopyCFDictionary();
}

uint64_t FigXPCMessageCopyCFObject()
{
  return _FigXPCMessageCopyCFObject();
}

uint64_t FigXPCMessageGetCMTime()
{
  return _FigXPCMessageGetCMTime();
}

uint64_t FigXPCMessageGetOpCode()
{
  return _FigXPCMessageGetOpCode();
}

uint64_t FigXPCMessageSetCFDictionary()
{
  return _FigXPCMessageSetCFDictionary();
}

uint64_t FigXPCRelease()
{
  return _FigXPCRelease();
}

uint64_t FigXPCServerAssociateObjectWithConnection()
{
  return _FigXPCServerAssociateObjectWithConnection();
}

uint64_t FigXPCServerDisassociateObjectWithConnection()
{
  return _FigXPCServerDisassociateObjectWithConnection();
}

uint64_t FigXPCServerLookupAndRetainAssociatedObject()
{
  return _FigXPCServerLookupAndRetainAssociatedObject();
}

uint64_t FigXPCServerStartWithClientXPCConnection()
{
  return _FigXPCServerStartWithClientXPCConnection();
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return _IOSurfaceCreateXPCObject(aSurface);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return _IOSurfaceLookupFromXPCObject(xobj);
}

uint64_t IsAppleInternalBuild()
{
  return _IsAppleInternalBuild();
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

uint64_t SNPrintF()
{
  return _SNPrintF();
}

uint64_t TextToHardwareAddressScalar()
{
  return _TextToHardwareAddressScalar();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return _VTPixelTransferSessionCreate(allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return _VTPixelTransferSessionTransferImage(session, sourceBuffer, destinationBuffer);
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

uint64_t _CFRuntimeCreateInstance()
{
  return __CFRuntimeCreateInstance();
}

uint64_t _CFRuntimeRegisterClass()
{
  return __CFRuntimeRegisterClass();
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void free(void *a1)
{
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

void xpc_main(xpc_connection_handler_t handler)
{
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}