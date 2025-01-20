uint64_t VTCreateVImageConverter(int a1, CGColorSpace *a2, int a3, CGColorSpace *a4, vImageConverterRef *a5)
{
  uint64_t v5;
  CGBitmapInfo v9;
  uint64_t v10;
  CGBitmapInfo v11;
  uint64_t v12;
  __CFDictionary *Mutable;
  const CGColorConversionInfo *v14;
  const CGColorConversionInfo *v15;
  vImageConverterRef v16;
  uint64_t v17;
  vImage_Error error;
  vImage_CGImageFormat dFormat;
  vImage_CGImageFormat sFormat;

  if (a5)
  {
    v9 = 0;
    *(void *)&sFormat.renderingIntent = 0;
    *(void *)&dFormat.renderingIntent = 0;
    error = 0;
    v10 = 0;
    if (a1 <= 1380410944)
    {
      if (a1 == 32)
      {
        v10 = 0x2000000008;
        v9 = 4;
      }
      else if (a1 == 1111970369)
      {
        v10 = 0x2000000008;
        v9 = 8196;
      }
    }
    else
    {
      switch(a1)
      {
        case 1380410945:
          v10 = 0x8000000020;
          v9 = 8451;
          break;
        case 1380411457:
          v10 = 0x4000000010;
          v9 = 4355;
          break;
        case 1815491698:
          v10 = 0x4000000010;
          v9 = 4099;
          break;
      }
    }
    v11 = 0;
    sFormat.bitmapInfo = v9;
    *(void *)&sFormat.bitsPerComponent = v10;
    sFormat.colorSpace = a2;
    v12 = 0;
    *(_OWORD *)&sFormat.version = 0uLL;
    if (a3 <= 1380410944)
    {
      if (a3 == 32)
      {
        v12 = 0x2000000008;
        v11 = 4;
      }
      else if (a3 == 1111970369)
      {
        v12 = 0x2000000008;
        v11 = 8196;
      }
    }
    else
    {
      switch(a3)
      {
        case 1380410945:
          v12 = 0x8000000020;
          v11 = 8451;
          break;
        case 1380411457:
          v12 = 0x4000000010;
          v11 = 4355;
          break;
        case 1815491698:
          v12 = 0x4000000010;
          v11 = 4099;
          break;
      }
    }
    dFormat.bitmapInfo = v11;
    *(void *)&dFormat.bitsPerComponent = v12;
    dFormat.colorSpace = a4;
    *(_OWORD *)&dFormat.version = 0uLL;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F1DE90], (const void *)*MEMORY[0x1E4F1CFD0]);
    v14 = CGColorConversionInfoCreateFromList(Mutable, a2, kCGColorConversionTransformFromSpace, kCGRenderingIntentDefault, a4, 1, 0, 0);
    v15 = v14;
    if (v14)
    {
      v16 = vImageConverter_CreateWithCGColorConversionInfo(v14, &sFormat, &dFormat, 0, 0, &error);
      if (v16) {
        goto LABEL_26;
      }
    }
    else
    {
      v16 = vImageConverter_CreateWithCGImageFormat(&sFormat, &dFormat, 0, 0, &error);
      if (v16)
      {
LABEL_26:
        v17 = 0;
        *a5 = v16;
        if (!Mutable)
        {
LABEL_28:
          if (v15) {
            CFRelease(v15);
          }
          return v17;
        }
LABEL_27:
        CFRelease(Mutable);
        goto LABEL_28;
      }
    }
    v17 = 4294955084;
    if (!Mutable) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  return FigSignalErrorAt();
}

BOOL VTIsBufferTaggedWithColorProperties(const void *a1)
{
  return CMGetAttachment(a1, (CFStringRef)*MEMORY[0x1E4F24A90], 0)
      || CMGetAttachment(a1, (CFStringRef)*MEMORY[0x1E4F24BC8], 0)
      || CMGetAttachment(a1, (CFStringRef)*MEMORY[0x1E4F24C18], 0)
      || CMGetAttachment(a1, (CFStringRef)*MEMORY[0x1E4F24A00], 0)
      || CMGetAttachment(a1, (CFStringRef)*MEMORY[0x1E4F24B70], 0) != 0;
}

uint64_t VTIsPixelBufferCompatibleWithColorProperties(void *a1, const void *a2, const void *a3, const void *a4, const void *a5, CGColorSpaceRef *a6)
{
  if (checkTransferServiceTrace_onceToken == -1)
  {
    if (a2) {
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once_f(&checkTransferServiceTrace_onceToken, 0, (dispatch_function_t)initTransferServiceTrace);
    if (a2) {
      goto LABEL_6;
    }
  }
  if (!a3 && !a4 && !a5) {
    return 1;
  }
LABEL_6:
  if (!VTIsBufferTaggedWithColorProperties(a1)) {
    return 1;
  }
  uint64_t Value = 1;
  CFDictionaryRef v13 = CVBufferCopyAttachments((CVBufferRef)a1, kCVAttachmentMode_ShouldPropagate);
  CFDictionaryRef v14 = v13;
  if (a2)
  {
    if (v13) {
      CFDictionaryGetValue(v13, (const void *)*MEMORY[0x1E4F24A90]);
    }
    uint64_t Value = FigCFEqual() != 0;
  }
  if (a3 && Value)
  {
    if (v14) {
      CFDictionaryGetValue(v14, (const void *)*MEMORY[0x1E4F24BC8]);
    }
    if (FigCFEqual()) {
      uint64_t Value = Value;
    }
    else {
      uint64_t Value = 0;
    }
  }
  if (a4 && Value)
  {
    if (v14) {
      CFDictionaryGetValue(v14, (const void *)*MEMORY[0x1E4F24C18]);
    }
    if (FigCFEqual()) {
      uint64_t Value = Value;
    }
    else {
      uint64_t Value = 0;
    }
  }
  if (a5 && Value)
  {
    if (v14) {
      CFDictionaryGetValue(v14, (const void *)*MEMORY[0x1E4F24B70]);
    }
    if (FigCFEqual()) {
      uint64_t Value = Value;
    }
    else {
      uint64_t Value = 0;
    }
  }
  if (!a6 || Value)
  {
    if (!v14) {
      return Value;
    }
    goto LABEL_54;
  }
  if (v14)
  {
    uint64_t Value = (uint64_t)CFDictionaryGetValue(v14, (const void *)*MEMORY[0x1E4F24A00]);
    if (!Value)
    {
LABEL_54:
      CFRelease(v14);
      return Value;
    }
    if (*a6)
    {
LABEL_53:
      uint64_t Value = FigCFEqual();
      goto LABEL_54;
    }
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v16 = Mutable;
    if (a5)
    {
      v17 = (const void **)MEMORY[0x1E4F24B70];
    }
    else
    {
      if (a2) {
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F24A90], a2);
      }
      if (a3) {
        CFDictionaryAddValue(v16, (const void *)*MEMORY[0x1E4F24BC8], a3);
      }
      if (!a4) {
        goto LABEL_50;
      }
      v17 = (const void **)MEMORY[0x1E4F24C18];
      a5 = a4;
    }
    CFDictionaryAddValue(v16, *v17, a5);
LABEL_50:
    CGColorSpaceRef ColorSpaceFromAttachments = CVImageBufferCreateColorSpaceFromAttachments(v16);
    if (v16) {
      CFRelease(v16);
    }
    *a6 = ColorSpaceFromAttachments;
    goto LABEL_53;
  }
  return 0;
}

CFTypeID VTFrameSiloGetTypeID(void)
{
  return sVTFrameSiloID;
}

uint64_t RegisterVTFrameSilo()
{
  uint64_t result = _CFRuntimeRegisterClass();
  sVTFrameSiloID = result;
  return result;
}

OSStatus VTFrameSiloCreate(CFAllocatorRef allocator, CFURLRef fileURL, CMTimeRange *timeRange, CFDictionaryRef options, VTFrameSiloRef *frameSiloOut)
{
  if (!frameSiloOut) {
    return -12902;
  }
  MEMORY[0x199705810](&VTFrameSiloGetTypeID_sRegisterVTFrameSiloOnce, RegisterVTFrameSilo, timeRange, options);
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance) {
    return -12904;
  }
  uint64_t v10 = Instance;
  memset(&callBacks, 0, sizeof(callBacks));
  uint64_t v11 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)(Instance + 32) = *MEMORY[0x1E4F1F9F8];
  uint64_t v12 = *(void *)(v11 + 16);
  *(unsigned char *)(Instance + 72) = 1;
  *(void *)(Instance + 48) = v12;
  *(void *)(Instance + 56) = 1;
  long long v13 = *(_OWORD *)&timeRange->start.epoch;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&timeRange->start.value;
  *(_OWORD *)&range1.start.epoch = v13;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v24 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&range2.start.value = *MEMORY[0x1E4F1FA20];
  long long v22 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  long long v23 = v14;
  *(_OWORD *)&range2.start.epoch = v14;
  *(_OWORD *)&range2.duration.timescale = v22;
  if (!CMTimeRangeEqual(&range1, &range2)
    && ((timeRange->start.flags & 1) == 0
     || (timeRange->duration.flags & 1) == 0
     || timeRange->duration.epoch
     || timeRange->duration.value < 0))
  {
    OSStatus v18 = FigSignalErrorAt();
    goto LABEL_17;
  }
  v15 = malloc_type_malloc(0x30uLL, 0x1000040EED21634uLL);
  *(void *)(v10 + 64) = v15;
  long long v17 = *(_OWORD *)&timeRange->start.epoch;
  long long v16 = *(_OWORD *)&timeRange->duration.timescale;
  _OWORD *v15 = *(_OWORD *)&timeRange->start.value;
  v15[1] = v17;
  v15[2] = v16;
  callBacks.version = 0;
  callBacks.retain = (CFArrayRetainCallBack)vtFrameSiloFormatDescriptionRetain;
  callBacks.release = (CFArrayReleaseCallBack)vtFrameSiloFormatDescriptionRelease;
  callBacks.copyDescription = (CFArrayCopyDescriptionCallBack)vtFrameSiloFormatDescriptionCopyDescription;
  callBacks.equal = (CFArrayEqualCallBack)vtFrameSiloFormatDescriptionEqual;
  *(void *)(v10 + 80) = CFArrayCreateMutable(allocator, 0, &callBacks);
  *(_OWORD *)&range1.start.value = v24;
  *(_OWORD *)&range1.start.epoch = v23;
  *(_OWORD *)&range1.duration.timescale = v22;
  OSStatus v18 = VTMultiPassStorageCreate(allocator, fileURL, &range1, 0, (VTMultiPassStorageRef *)(v10 + 24));
  if (v18)
  {
LABEL_17:
    OSStatus v20 = v18;
LABEL_18:
    CFRelease((CFTypeRef)v10);
    return v20;
  }
  CFStringRef v19 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"VTFrameSilo-%d", 1);
  OSStatus v20 = VTMultiPassStorageSetIdentifier(*(void *)(v10 + 24), v19);
  if (!v20)
  {
    *frameSiloOut = (VTFrameSiloRef)v10;
    uint64_t v10 = 0;
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v10) {
    goto LABEL_18;
  }
  return v20;
}

uint64_t vtFrameSiloFormatDescriptionRetain(uint64_t a1, uint64_t a2)
{
  return a2;
}

void vtFrameSiloFormatDescriptionRelease(int a1, void *a2)
{
  v3 = (const void *)a2[6];
  if (v3) {
    CFRelease(v3);
  }

  free(a2);
}

__CFString *vtFrameSiloFormatDescriptionCopyDescription(uint64_t a1)
{
  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, 0, @"<VTFrameSiloFormatDescription>{formatDescription:%p, timeRange:[%lld/%d,%lld/%d]}", *(void *)(a1 + 48), *(void *)a1, *(unsigned int *)(a1 + 8), *(void *)(a1 + 24), *(unsigned int *)(a1 + 32));
  return Mutable;
}

uint64_t vtFrameSiloFormatDescriptionEqual()
{
  return FigCFEqual();
}

uint64_t VTFrameSiloInvalidate(uint64_t a1)
{
  if (a1 && !*(unsigned char *)(a1 + 16))
  {
    *(unsigned char *)(a1 + 16) = 1;
    v2 = *(void **)(a1 + 64);
    if (v2)
    {
      free(v2);
      *(void *)(a1 + 64) = 0;
    }
    v3 = *(const void **)(a1 + 80);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 80) = 0;
    }
    VTMultiPassStorageClose(*(VTMultiPassStorageRef *)(a1 + 24));
    v4 = *(const void **)(a1 + 24);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 24) = 0;
    }
  }
  return 0;
}

OSStatus VTFrameSiloAddSampleBuffer(VTFrameSiloRef silo, CMSampleBufferRef sampleBuffer)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (!silo || *((unsigned char *)silo + 16) || !sampleBuffer || !CMSampleBufferIsValid(sampleBuffer))
  {
    return FigSignalErrorAt();
  }
  CMSampleBufferGetDecodeTimeStamp(&time1.duration, sampleBuffer);
  CMTimeValue value = time1.duration.value;
  CMTimeFlags flags = time1.duration.flags;
  CMTimeScale timescale = time1.duration.timescale;
  CMTimeEpoch epoch = time1.duration.epoch;
  CMSampleBufferGetPresentationTimeStamp(&time1.duration, sampleBuffer);
  CMTimeValue v65 = time1.duration.value;
  CMTimeScale v66 = time1.duration.timescale;
  if ((flags & 1) == 0) {
    return FigSignalErrorAt();
  }
  v7 = (_OWORD *)((char *)silo + 32);
  if (*((unsigned char *)silo + 44))
  {
    time1.duration.CMTimeValue value = value;
    time1.duration.CMTimeScale timescale = timescale;
    time1.duration.CMTimeFlags flags = flags;
    time1.duration.CMTimeEpoch epoch = epoch;
    *(_OWORD *)&time2.start.CMTimeValue value = *v7;
    time2.start.CMTimeEpoch epoch = *((void *)silo + 6);
    if (CMTimeCompare(&time1.duration, &time2.start) <= 0) {
      return FigSignalErrorAt();
    }
  }
  else
  {
    *(void *)v7 = value;
    *((_DWORD *)silo + 10) = timescale;
    *((_DWORD *)silo + 11) = flags;
    *((void *)silo + 6) = epoch;
  }
  if (!*((unsigned char *)silo + 72)
    || (uint64_t v8 = *((void *)silo + 8), (*(unsigned char *)(v8 + 12) & 1) != 0)
    && (*(unsigned char *)(v8 + 36) & 1) != 0
    && !*(void *)(v8 + 40)
    && (*(void *)(v8 + 24) & 0x8000000000000000) == 0)
  {
    if (*((uint64_t *)silo + 7) >= 1)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      do
      {
        uint64_t v11 = (_OWORD *)(*((void *)silo + 8) + v9);
        *(_OWORD *)&time1.duration.CMTimeValue value = *v11;
        *(_OWORD *)&time1.duration.CMTimeEpoch epoch = v11[1];
        *(_OWORD *)&time1.presentationTimeStamp.CMTimeScale timescale = v11[2];
        *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&time1.duration.value;
        *(_OWORD *)&time2.start.CMTimeEpoch epoch = *(_OWORD *)&time1.duration.epoch;
        *(_OWORD *)&time2.duration.CMTimeScale timescale = *(_OWORD *)&time1.presentationTimeStamp.timescale;
        time.CMTimeValue value = value;
        time.CMTimeScale timescale = timescale;
        time.CMTimeFlags flags = flags;
        time.CMTimeEpoch epoch = epoch;
        if (CMTimeRangeContainsTime(&time2, &time)) {
          goto LABEL_22;
        }
        uint64_t v12 = *((void *)silo + 7);
        ++v10;
        v9 += 48;
      }
      while (v10 < v12);
      if (v12 >= 1) {
        return FigSignalErrorAt();
      }
    }
  }
LABEL_22:
  CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(sampleBuffer);
  if (!FormatDescription)
  {
    OSStatus TimeStamp = FigSignalErrorAt();
    goto LABEL_106;
  }
  CMFormatDescriptionRef v14 = FormatDescription;
  CMSampleBufferGetDecodeTimeStamp(&time1.duration, sampleBuffer);
  *(void *)bytes = time1.duration.value;
  CMTimeFlags v15 = time1.duration.flags;
  CMTimeScale v72 = time1.duration.timescale;
  CMTimeEpoch v16 = time1.duration.epoch;
  CMSampleBufferGetPresentationTimeStamp(&time1.duration, sampleBuffer);
  CMTimeValue v69 = time1.duration.value;
  CMTimeScale v70 = time1.duration.timescale;
  CMSampleBufferGetOutputPresentationTimeStamp(&time2.start, sampleBuffer);
  CMSampleBufferGetPresentationTimeStamp(&time, sampleBuffer);
  CMTimeCompare(&time2.start, &time);
  if (*((unsigned char *)silo + 72))
  {
    if (CFArrayGetCount(*((CFArrayRef *)silo + 10)) < 1
      || (CFArrayRef v17 = (const __CFArray *)*((void *)silo + 10),
          CFIndex Count = CFArrayGetCount(v17),
          ValueAtIndex = (long long *)CFArrayGetValueAtIndex(v17, Count - 1),
          !FigCFEqual()))
    {
      OSStatus v20 = (char *)malloc_type_malloc(0x38uLL, 0x106004046CD1912uLL);
      *(void *)OSStatus v20 = *(void *)bytes;
      *((_DWORD *)v20 + 2) = v72;
      *((_DWORD *)v20 + 3) = v15;
      *((void *)v20 + 2) = v16;
      *((void *)v20 + 5) = v16;
      *(_OWORD *)(v20 + 24) = *(_OWORD *)v20;
      *((void *)v20 + 6) = CFRetain(v14);
      CFArrayAppendValue(*((CFMutableArrayRef *)silo + 10), v20);
      goto LABEL_72;
    }
    *((void *)ValueAtIndex + 3) = *(void *)bytes;
    *((_DWORD *)ValueAtIndex + 8) = v72;
LABEL_42:
    *((_DWORD *)ValueAtIndex + 9) = v15;
    *((void *)ValueAtIndex + 5) = v16;
    goto LABEL_72;
  }
  CFIndex v21 = *((void *)silo + 11);
  if (v21 >= CFArrayGetCount(*((CFArrayRef *)silo + 10)))
  {
    CFIndex v22 = CFArrayGetCount(*((CFArrayRef *)silo + 10)) - 1;
    *((void *)silo + 11) = v22;
  }
  else
  {
    CFIndex v22 = *((void *)silo + 11);
  }
  if (v22 >= CFArrayGetCount(*((CFArrayRef *)silo + 10)))
  {
    ValueAtIndex = 0;
  }
  else
  {
    do
    {
      ValueAtIndex = (long long *)CFArrayGetValueAtIndex(*((CFArrayRef *)silo + 10), *((void *)silo + 11));
      time1.duration.CMTimeValue value = *(void *)bytes;
      time1.duration.CMTimeScale timescale = v72;
      time1.duration.CMTimeFlags flags = v15;
      time1.duration.CMTimeEpoch epoch = v16;
      long long v23 = *ValueAtIndex;
      duration.CMTimeEpoch epoch = *((void *)ValueAtIndex + 2);
      *(_OWORD *)&duration.CMTimeValue value = v23;
      if ((CMTimeCompare(&time1.duration, &duration) & 0x80000000) == 0)
      {
        time1.duration.CMTimeValue value = *(void *)bytes;
        time1.duration.CMTimeScale timescale = v72;
        time1.duration.CMTimeFlags flags = v15;
        time1.duration.CMTimeEpoch epoch = v16;
        CMTime duration = *(CMTime *)((unsigned char *)ValueAtIndex + 1);
        if (CMTimeCompare(&time1.duration, &duration) < 1) {
          break;
        }
      }
      CFIndex v24 = *((void *)silo + 11) + 1;
      if (v24 >= CFArrayGetCount(*((CFArrayRef *)silo + 10))) {
        break;
      }
      v25 = CFArrayGetValueAtIndex(*((CFArrayRef *)silo + 10), *((void *)silo + 11) + 1);
      time1.duration.CMTimeValue value = *(void *)bytes;
      time1.duration.CMTimeScale timescale = v72;
      time1.duration.CMTimeFlags flags = v15;
      time1.duration.CMTimeEpoch epoch = v16;
      long long v26 = *(_OWORD *)v25;
      duration.CMTimeEpoch epoch = v25[2];
      *(_OWORD *)&duration.CMTimeValue value = v26;
      if (CMTimeCompare(&time1.duration, &duration) < 0) {
        break;
      }
      CFArrayRef v27 = (const __CFArray *)*((void *)silo + 10);
      CFIndex v28 = *((void *)silo + 11) + 1;
      *((void *)silo + 11) = v28;
    }
    while (v28 < CFArrayGetCount(v27));
  }
  if (FigCFEqual())
  {
    time1.duration.CMTimeValue value = *(void *)bytes;
    time1.duration.CMTimeScale timescale = v72;
    time1.duration.CMTimeFlags flags = v15;
    time1.duration.CMTimeEpoch epoch = v16;
    CMTime duration = *(CMTime *)((unsigned char *)ValueAtIndex + 1);
    if (CMTimeCompare(&time1.duration, &duration) < 1) {
      goto LABEL_72;
    }
    *((void *)ValueAtIndex + 3) = *(void *)bytes;
    *((_DWORD *)ValueAtIndex + 8) = v72;
    goto LABEL_42;
  }
  *(_OWORD *)&time1.duration.CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  time1.duration.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  CMTime duration = time1.duration;
  uint64_t v29 = *((void *)silo + 3);
  v61.CMTimeValue value = *(void *)bytes;
  v61.CMTimeScale timescale = v72;
  v61.CMTimeFlags flags = v15;
  v61.CMTimeEpoch epoch = v16;
  OSStatus TimeStamp = VTMultiPassStorageGetTimeStamp(v29, (long long *)&v61.value, @"GetPreviousTimeStamp", (uint64_t)&time1);
  if (TimeStamp
    || (uint64_t v31 = *((void *)silo + 3),
        v61.CMTimeValue value = *(void *)bytes,
        v61.CMTimeScale timescale = v72,
        v61.CMTimeFlags flags = v15,
        v61.CMTimeEpoch epoch = v16,
        (OSStatus TimeStamp = VTMultiPassStorageGetTimeStamp(v31, (long long *)&v61.value, @"GetNextTimeStamp", (uint64_t)&duration)) != 0))
  {
LABEL_106:
    OSStatus Code = TimeStamp;
    if (!TimeStamp) {
      goto LABEL_72;
    }
    return Code;
  }
  if (CFArrayGetCount(*((CFArrayRef *)silo + 10)) < 1)
  {
    CFIndex v32 = 0;
    goto LABEL_71;
  }
  CFIndex v32 = 0;
  v58 = v14;
  while (1)
  {
    v33 = (CMTime *)CFArrayGetValueAtIndex(*((CFArrayRef *)silo + 10), v32);
    v34 = v33;
    if ((time1.duration.flags & 0x1D) == 1)
    {
      CMTime v61 = v33[1];
      CMTime v60 = time1.duration;
      if (CMTimeCompare(&v61, &v60) >= 1)
      {
        long long v35 = *(_OWORD *)&v34->value;
        v61.CMTimeEpoch epoch = v34->epoch;
        *(_OWORD *)&v61.CMTimeValue value = v35;
        CMTime v60 = time1.duration;
        BOOL v36 = CMTimeCompare(&v61, &v60) > 0;
        char v37 = 1;
        goto LABEL_53;
      }
      char v37 = 0;
    }
    else
    {
      char v37 = 1;
    }
    BOOL v36 = 1;
LABEL_53:
    if ((duration.flags & 0x1D) == 1)
    {
      CMTime v61 = duration;
      long long v38 = *(_OWORD *)&v34->value;
      v60.CMTimeEpoch epoch = v34->epoch;
      *(_OWORD *)&v60.CMTimeValue value = v38;
      if (CMTimeCompare(&v61, &v60) < 1)
      {
        CMFormatDescriptionRef v14 = v58;
        goto LABEL_71;
      }
      CMTime v61 = duration;
      CMTime v60 = v34[1];
      BOOL v39 = CMTimeCompare(&v61, &v60) > 0;
    }
    else
    {
      BOOL v39 = 1;
    }
    if ((v37 & 1) == 0)
    {
      CMFormatDescriptionRef v14 = v58;
      if (!v39) {
        goto LABEL_71;
      }
      goto LABEL_67;
    }
    if (!v36) {
      break;
    }
    CMFormatDescriptionRef v14 = v58;
    if (!v39)
    {
      long long v40 = *(_OWORD *)&duration.value;
      v34->CMTimeEpoch epoch = duration.epoch;
      *(_OWORD *)&v34->CMTimeValue value = v40;
      goto LABEL_71;
    }
    CFArrayRemoveValueAtIndex(*((CFMutableArrayRef *)silo + 10), v32);
LABEL_61:
    if (v32 >= CFArrayGetCount(*((CFArrayRef *)silo + 10))) {
      goto LABEL_71;
    }
  }
  CMFormatDescriptionRef v14 = v58;
  if (v39)
  {
    *(_OWORD *)&v34[1].CMTimeValue value = *(_OWORD *)&time1.duration.value;
    v34[1].CMTimeEpoch epoch = time1.duration.epoch;
LABEL_67:
    ++v32;
    goto LABEL_61;
  }
  v56 = (char *)malloc_type_malloc(0x38uLL, 0x106004046CD1912uLL);
  *(CMTime *)v56 = duration;
  CMTimeEpoch v57 = v34[1].epoch;
  *(_OWORD *)(v56 + 24) = *(_OWORD *)&v34[1].value;
  *((void *)v56 + 5) = v57;
  *((void *)v56 + 6) = CFRetain((CFTypeRef)v34[2].value);
  CFArrayInsertValueAtIndex(*((CFMutableArrayRef *)silo + 10), ++v32, v56);
  *(_OWORD *)&v34[1].CMTimeValue value = *(_OWORD *)&time1.duration.value;
  v34[1].CMTimeEpoch epoch = time1.duration.epoch;
LABEL_71:
  v41 = malloc_type_malloc(0x38uLL, 0x106004046CD1912uLL);
  CMTimeValue v42 = *(void *)bytes;
  *(void *)v41 = *(void *)bytes;
  CMTimeScale v43 = v72;
  v41[2] = v72;
  v41[3] = v15;
  *((void *)v41 + 2) = v16;
  *((void *)v41 + 3) = v42;
  v41[8] = v43;
  v41[9] = v15;
  *((void *)v41 + 5) = v16;
  *((void *)v41 + 6) = CFRetain(v14);
  CFArrayInsertValueAtIndex(*((CFMutableArrayRef *)silo + 10), v32, v41);
LABEL_72:
  memset(&time1, 0, sizeof(time1));
  time2.start.CMTimeValue value = 0;
  time.CMTimeValue value = 0;
  duration.CMTimeValue value = 0;
  v61.CMTimeValue value = 0;
  *(_DWORD *)bytes = 0;
  v60.CMTimeValue value = 0;
  CFAllocatorRef v44 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  OSStatus SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(sampleBuffer, 0, 0, &v61.value);
  if (SampleTimingInfoArray) {
    goto LABEL_109;
  }
  if (v61.value != 1)
  {
    OSStatus SampleTimingInfoArray = FigSignalErrorAt();
    goto LABEL_109;
  }
  OSStatus SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(sampleBuffer, 1, &time1, 0);
  if (SampleTimingInfoArray)
  {
LABEL_109:
    OSStatus Code = SampleTimingInfoArray;
    CFDataRef Data = 0;
    goto LABEL_103;
  }
  CFDataAppendBytes(Mutable, (const UInt8 *)&time1, 72);
  CFArrayRef SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(sampleBuffer, 1u);
  CFDataRef Data = CFPropertyListCreateData(v44, SampleAttachmentsArray, kCFPropertyListBinaryFormat_v1_0, 0, (CFErrorRef *)&v60);
  if (!Data) {
    goto LABEL_101;
  }
  if (v60.value)
  {
    DataBuffer = (OpaqueCMBlockBuffer *)CFErrorCopyFailureReason((CFErrorRef)v60.value);
    OSStatus Code = CFErrorGetCode((CFErrorRef)v60.value);
    goto LABEL_78;
  }
  CFIndex Length = CFDataGetLength(Data);
  if (Length >= 0x80000000 || (*(_DWORD *)bytes = Length, (int)Length <= 0))
  {
LABEL_101:
    OSStatus DataPointer = FigSignalErrorAt();
    goto LABEL_102;
  }
  CFDataAppendBytes(Mutable, bytes, 4);
  BytePtr = CFDataGetBytePtr(Data);
  CFDataAppendBytes(Mutable, BytePtr, *(int *)bytes);
  DataBuffer = CMSampleBufferGetDataBuffer(sampleBuffer);
  if (DataBuffer)
  {
    size_t v53 = 0;
    while (1)
    {
      OSStatus DataPointer = CMBlockBufferGetDataPointer(DataBuffer, v53, (size_t *)&time, (size_t *)&time2, (char **)&duration);
      if (DataPointer) {
        break;
      }
      CFDataAppendBytes(Mutable, (const UInt8 *)duration.value, time.value);
      v53 += time.value;
      if (v53 >= time2.start.value)
      {
        DataBuffer = 0;
        OSStatus Code = 0;
        goto LABEL_87;
      }
    }
LABEL_102:
    OSStatus Code = DataPointer;
LABEL_103:
    DataBuffer = 0;
  }
  else
  {
    OSStatus Code = FigSignalErrorAt();
  }
LABEL_78:
  if (Mutable)
  {
    CFRelease(Mutable);
    Mutable = 0;
  }
LABEL_87:
  if (v60.value) {
    CFRelease((CFTypeRef)v60.value);
  }
  if (Data) {
    CFRelease(Data);
  }
  if (DataBuffer) {
    CFRelease(DataBuffer);
  }
  if (!Code)
  {
    uint64_t v55 = *((void *)silo + 3);
    time1.duration.CMTimeValue value = value;
    time1.duration.CMTimeScale timescale = timescale;
    time1.duration.CMTimeFlags flags = flags;
    time1.duration.CMTimeEpoch epoch = epoch;
    OSStatus Code = VTMultiPassStorageSetDataAtTimeStamp(v55, (long long *)&time1.duration.value, 0, Mutable);
    if (!Code)
    {
      *((void *)silo + 4) = value;
      *((_DWORD *)silo + 10) = timescale;
      *((_DWORD *)silo + 11) = flags;
      *((void *)silo + 6) = epoch;
    }
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Code;
}

OSStatus VTFrameSiloSetTimeRangesForNextPass(VTFrameSiloRef silo, CMItemCount timeRangeCount, const CMTimeRange *timeRangeArray)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  CMTimeValue v43 = *MEMORY[0x1E4F1FA20];
  CMTimeScale v44 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 8);
  if (!silo || *((unsigned char *)silo + 16) || timeRangeCount <= 0 || !timeRangeArray)
  {
    return FigSignalErrorAt();
  }
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 12);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA20] + 16);
  CMTimeValue v8 = *(void *)(MEMORY[0x1E4F1FA20] + 24);
  CMTimeScale v10 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 32);
  CMTimeFlags v11 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 36);
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1FA20] + 40);
  *((unsigned char *)silo + 72) = 0;
  *((void *)silo + 7) = 0;
  long long v13 = (void *)*((void *)silo + 8);
  if (v13)
  {
    CMTimeValue v14 = v8;
    CMTimeEpoch v15 = epoch;
    CMTimeScale v16 = v10;
    free(v13);
    CMTimeScale v10 = v16;
    CMTimeEpoch epoch = v15;
    CMTimeValue v8 = v14;
    *((void *)silo + 8) = 0;
  }
  VTFrameSiloRef v34 = silo;
  __src = timeRangeArray;
  unint64_t v33 = timeRangeCount;
  p_CMTime duration = &timeRangeArray->duration;
  CMItemCount v18 = timeRangeCount;
  do
  {
    CMTimeFlags v19 = flags;
    CMTimeValue value = p_duration[-1].value;
    CMTimeFlags flags = p_duration[-1].flags;
    CMTimeScale timescale = p_duration[-1].timescale;
    if ((flags & 1) == 0) {
      return FigSignalErrorAt();
    }
    CMTimeFlags v20 = v11;
    CMTimeFlags v11 = p_duration->flags;
    if ((v11 & 1) == 0) {
      return FigSignalErrorAt();
    }
    if (p_duration->epoch) {
      return FigSignalErrorAt();
    }
    CMTimeValue v21 = v8;
    CMTimeValue v8 = p_duration->value;
    if (p_duration->value < 0 || (flags & 0x1D) != 1 || (p_duration->flags & 0x1D) != 1) {
      return FigSignalErrorAt();
    }
    CMTimeEpoch v22 = epoch;
    CMTimeScale v23 = v10;
    CMTimeEpoch epoch = p_duration[-1].epoch;
    CMTimeScale v10 = p_duration->timescale;
    if ((v19 & 1) != 0 && (v20 & 1) != 0 && !v12 && (v21 & 0x8000000000000000) == 0)
    {
      memset(&v40, 0, sizeof(v40));
      range.start.CMTimeValue value = p_duration[-1].value;
      range.start.CMTimeScale timescale = p_duration[-1].timescale;
      range.start.CMTimeFlags flags = flags;
      CMTimeEpoch v24 = epoch;
      range.start.CMTimeEpoch epoch = epoch;
      range.duration.CMTimeValue value = v8;
      CMTimeValue v36 = v8;
      CMTimeScale v35 = v10;
      range.duration.CMTimeScale timescale = v10;
      range.duration.CMTimeFlags flags = v11;
      range.duration.CMTimeEpoch epoch = 0;
      otherRange.start.CMTimeValue value = v43;
      otherRange.start.CMTimeScale timescale = v44;
      otherRange.start.CMTimeFlags flags = v19;
      otherRange.start.CMTimeEpoch epoch = v22;
      otherRange.duration.CMTimeValue value = v21;
      otherRange.duration.CMTimeScale timescale = v23;
      otherRange.duration.CMTimeFlags flags = v20;
      otherRange.duration.CMTimeEpoch epoch = 0;
      CMTimeRangeGetIntersection(&v40, &range, &otherRange);
      memset(&otherRange, 0, 24);
      range.start.CMTimeValue value = v43;
      range.start.CMTimeScale timescale = v44;
      range.start.CMTimeFlags flags = v19;
      range.start.CMTimeEpoch epoch = v22;
      range.duration.CMTimeValue value = v21;
      range.duration.CMTimeScale timescale = v23;
      range.duration.CMTimeFlags flags = v20;
      range.duration.CMTimeEpoch epoch = 0;
      CMTimeRangeGetEnd(&otherRange.start, &range);
      if ((v40.start.flags & 1) == 0) {
        return FigSignalErrorAt();
      }
      if ((v40.duration.flags & 1) == 0) {
        return FigSignalErrorAt();
      }
      if (v40.duration.epoch) {
        return FigSignalErrorAt();
      }
      if (v40.duration.value < 0) {
        return FigSignalErrorAt();
      }
      range.start = v40.duration;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if (CMTimeCompare(&range.start, &time2)) {
        return FigSignalErrorAt();
      }
      *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&otherRange.start.value;
      range.start.CMTimeEpoch epoch = otherRange.start.epoch;
      time2.CMTimeValue value = value;
      time2.CMTimeScale timescale = timescale;
      time2.CMTimeFlags flags = flags;
      time2.CMTimeEpoch epoch = v24;
      if (CMTimeCompare(&range.start, &time2) >= 1) {
        return FigSignalErrorAt();
      }
      CMTimeValue v8 = v36;
      CMTimeEpoch epoch = v24;
      CMTimeScale v10 = v35;
    }
    uint64_t v12 = 0;
    CMTimeValue v43 = value;
    CMTimeScale v44 = timescale;
    p_duration += 2;
    --v18;
  }
  while (v18);
  *((void *)v34 + 7) = v33;
  if (v33 > 0x555555555555555 || !(48 * v33))
  {
    *((void *)v34 + 8) = 0;
    return -12904;
  }
  v25 = malloc_type_malloc(48 * v33, 0x5CC9CBA6uLL);
  *((void *)v34 + 8) = v25;
  if (!v25) {
    return -12904;
  }
  memcpy(v25, __src, 48 * *((void *)v34 + 7));
  uint64_t v26 = MEMORY[0x1E4F1F9F8];
  if (*((uint64_t *)v34 + 7) >= 1)
  {
    uint64_t v27 = 0;
    do
    {
      CFIndex v28 = (CMTimeRange *)(*((void *)v34 + 8) + 48 * v27);
      CMTimeRange v40 = *v28;
      *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&v28->start.value;
      CMTimeEpoch v29 = v28->start.epoch;
      otherRange.start.CMTimeEpoch epoch = v29;
      CMTimeRange range = v40;
      for (*(_OWORD *)&time2.CMTimeValue value = *(_OWORD *)&otherRange.start.value;
            ;
            *(_OWORD *)&time2.CMTimeValue value = *(_OWORD *)&otherRange.start.value)
      {
        time2.CMTimeEpoch epoch = v29;
        if (!CMTimeRangeContainsTime(&range, &time2)) {
          break;
        }
        *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)v26;
        range.start.CMTimeEpoch epoch = *(void *)(v26 + 16);
        uint64_t v30 = *((void *)v34 + 3);
        CMTime time2 = otherRange.start;
        OSStatus result = VTMultiPassStorageSetDataAtTimeStamp(v30, (long long *)&time2.value, 0, 0);
        if (result) {
          return result;
        }
        uint64_t v31 = *((void *)v34 + 3);
        CMTime time2 = otherRange.start;
        OSStatus result = VTMultiPassStorageGetTimeStamp(v31, (long long *)&time2.value, @"GetNextTimeStamp", (uint64_t)&range);
        if (result) {
          return result;
        }
        if ((range.start.flags & 1) == 0) {
          break;
        }
        *(_OWORD *)&otherRange.start.CMTimeValue value = *(_OWORD *)&range.start.value;
        CMTimeEpoch v29 = range.start.epoch;
        otherRange.start.CMTimeEpoch epoch = range.start.epoch;
        CMTimeRange range = v40;
      }
      ++v27;
    }
    while (v27 < *((void *)v34 + 7));
  }
  OSStatus result = 0;
  *((void *)v34 + 11) = 0;
  *((_OWORD *)v34 + 2) = *(_OWORD *)v26;
  *((void *)v34 + 6) = *(void *)(v26 + 16);
  return result;
}

OSStatus VTFrameSiloGetProgressOfCurrentPass(VTFrameSiloRef silo, Float32 *progressOut)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&v25.CMTimeValue value = *MEMORY[0x1E4F1FA48];
  CMTimeEpoch v2 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  v25.CMTimeEpoch epoch = v2;
  long long v19 = *(_OWORD *)&v25.value;
  *(_OWORD *)&v24.CMTimeValue value = *(_OWORD *)&v25.value;
  v24.CMTimeEpoch epoch = v2;
  if (silo && progressOut && !*((unsigned char *)silo + 16))
  {
    CMTimeEpoch v17 = v2;
    if (*((uint64_t *)silo + 7) < 1)
    {
LABEL_24:
      lhs.CMTime start = v24;
      *(_OWORD *)&rhs.CMTimeValue value = v19;
      rhs.CMTimeEpoch epoch = v17;
      if (CMTimeCompare(&lhs.start, &rhs) < 1)
      {
        float v16 = 0.0;
      }
      else
      {
        lhs.CMTime start = v25;
        double Seconds = CMTimeGetSeconds(&lhs.start);
        lhs.CMTime start = v24;
        float v16 = Seconds / CMTimeGetSeconds(&lhs.start);
      }
      OSStatus result = 0;
      *progressOut = v16;
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      v7 = (_OWORD *)((char *)silo + 32);
      while (1)
      {
        uint64_t v8 = *((void *)silo + 8) + v5;
        CMTimeValue v26 = *(void *)v8;
        CMTimeFlags v9 = *(_DWORD *)(v8 + 12);
        CMTimeScale v27 = *(_DWORD *)(v8 + 8);
        if ((v9 & 1) == 0) {
          break;
        }
        CMTimeFlags v10 = *(_DWORD *)(v8 + 36);
        if ((v10 & 1) == 0) {
          break;
        }
        if (*(void *)(v8 + 40)) {
          break;
        }
        CMTimeValue v11 = *(void *)(v8 + 24);
        if (v11 < 0) {
          break;
        }
        if ((v9 & 0x1D) != 1 || (*(_DWORD *)(v8 + 36) & 0x1D) != 1) {
          break;
        }
        CMTimeEpoch v13 = *(void *)(v8 + 16);
        CMTimeScale v14 = *(_DWORD *)(v8 + 32);
        lhs.CMTime start = v24;
        rhs.CMTimeValue value = v11;
        rhs.CMTimeScale timescale = v14;
        rhs.CMTimeFlags flags = v10;
        rhs.CMTimeEpoch epoch = 0;
        CMTimeAdd(&v24, &lhs.start, &rhs);
        if ((*((unsigned char *)silo + 44) & 1) == 0) {
          goto LABEL_21;
        }
        lhs.start.CMTimeValue value = v26;
        lhs.start.CMTimeScale timescale = v27;
        lhs.start.CMTimeFlags flags = v9;
        lhs.start.CMTimeEpoch epoch = v13;
        lhs.duration.CMTimeValue value = v11;
        lhs.duration.CMTimeScale timescale = v14;
        lhs.duration.CMTimeFlags flags = v10;
        lhs.duration.CMTimeEpoch epoch = 0;
        CMTimeRangeGetEnd(&time2, &lhs);
        *(_OWORD *)&lhs.start.CMTimeValue value = *v7;
        lhs.start.CMTimeEpoch epoch = *((void *)silo + 6);
        if (CMTimeCompare(&lhs.start, &time2) >= 1)
        {
          CMTime v25 = v24;
        }
        else
        {
LABEL_21:
          lhs.start.CMTimeValue value = v26;
          lhs.start.CMTimeScale timescale = v27;
          lhs.start.CMTimeFlags flags = v9;
          lhs.start.CMTimeEpoch epoch = v13;
          lhs.duration.CMTimeValue value = v11;
          lhs.duration.CMTimeScale timescale = v14;
          lhs.duration.CMTimeFlags flags = v10;
          lhs.duration.CMTimeEpoch epoch = 0;
          *(_OWORD *)&rhs.CMTimeValue value = *v7;
          rhs.CMTimeEpoch epoch = *((void *)silo + 6);
          if (CMTimeRangeContainsTime(&lhs, &rhs))
          {
            memset(&lhs, 0, 24);
            *(_OWORD *)&rhs.CMTimeValue value = *v7;
            rhs.CMTimeEpoch epoch = *((void *)silo + 6);
            start.CMTimeValue value = v26;
            start.CMTimeScale timescale = v27;
            start.CMTimeFlags flags = v9;
            start.CMTimeEpoch epoch = v13;
            CMTimeSubtract(&lhs.start, &rhs, &start);
            CMTime rhs = v25;
            CMTime start = lhs.start;
            CMTimeAdd(&v25, &rhs, &start);
          }
        }
        ++v6;
        v5 += 48;
        if (v6 >= *((void *)silo + 7)) {
          goto LABEL_24;
        }
      }
      return FigSignalErrorAt();
    }
  }
  else
  {
    return FigSignalErrorAt();
  }
  return result;
}

OSStatus VTFrameSiloCallFunctionForEachSampleBuffer(VTFrameSiloRef silo, CMTimeRange *timeRange, void *refcon, OSStatus (__cdecl *callback)(void *, CMSampleBufferRef))
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  CMTimeEpoch epoch = 0;
  theCFDataRef Data = 0;
  long long v57 = 0uLL;
  if (!silo || !callback)
  {
LABEL_75:
    OSStatus TimeStamp = FigSignalErrorAt();
    goto LABEL_76;
  }
  if (*((unsigned char *)silo + 16))
  {
    return FigSignalErrorAt();
  }
  v7 = timeRange;
  uint64_t v8 = (long long *)MEMORY[0x1E4F1F9F8];
  if ((timeRange->start.flags & 1) != 0
    && (timeRange->duration.flags & 1) != 0
    && !timeRange->duration.epoch
    && (timeRange->duration.value & 0x8000000000000000) == 0)
  {
    goto LABEL_12;
  }
  *(_OWORD *)&time.version = *MEMORY[0x1E4F1F9F8];
  *(void (__cdecl **)(void *, void *, size_t))((char *)&time.FreeBlock + 4) = *(void (__cdecl **)(void *, void *, size_t))(MEMORY[0x1E4F1F9F8] + 16);
  uint64_t v9 = *((void *)silo + 3);
  *(_OWORD *)&range.duration.CMTimeValue value = *(_OWORD *)&time.version;
  range.duration.CMTimeEpoch epoch = *(CMTimeEpoch *)((char *)&time.FreeBlock + 4);
  OSStatus TimeStamp = VTMultiPassStorageGetTimeStamp(v9, (long long *)&range.duration.value, @"GetFirstTimeStamp", (uint64_t)&time);
  if (TimeStamp)
  {
LABEL_76:
    OSStatus Code = TimeStamp;
    CMSampleBufferRef v32 = 0;
    goto LABEL_67;
  }
  *(_OWORD *)&start.CMTimeValue value = *(_OWORD *)&time.version;
  start.CMTimeEpoch epoch = *(CMTimeEpoch *)((char *)&time.FreeBlock + 4);
  CMTime end = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  CMTimeRangeFromTimeToTime((CMTimeRange *)&range, &start, &end);
  long long v11 = *(_OWORD *)&range.duration.epoch;
  *(_OWORD *)&v7->start.CMTimeValue value = *(_OWORD *)&range.duration.value;
  *(_OWORD *)&v7->start.CMTimeEpoch epoch = v11;
  *(_OWORD *)&v7->duration.CMTimeScale timescale = *(_OWORD *)&range.presentationTimeStamp.timescale;
LABEL_12:
  long long v12 = *(_OWORD *)&v7->start.epoch;
  long long v57 = *(_OWORD *)&v7->start.value;
  CMTimeEpoch epoch = (void (__cdecl *)(void *, void *, size_t))v7->start.epoch;
  *(_OWORD *)&range.duration.CMTimeValue value = *(_OWORD *)&v7->start.value;
  *(_OWORD *)&range.duration.CMTimeEpoch epoch = v12;
  *(_OWORD *)&range.presentationTimeStamp.CMTimeScale timescale = *(_OWORD *)&v7->duration.timescale;
  *(_OWORD *)&time.version = *(_OWORD *)&v7->start.value;
  *(void (__cdecl **)(void *, void *, size_t))((char *)&time.FreeBlock + 4) = (void (__cdecl *)(void *, void *, size_t))v7->start.epoch;
  if (CMTimeRangeContainsTime((CMTimeRange *)&range, (CMTime *)&time))
  {
    char v13 = 0;
    CFIndex v14 = 0;
    CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    long long v53 = *v8;
    v52 = (void (__cdecl *)(void *, void *, size_t))*((void *)v8 + 2);
    CFAllocatorRef blockAllocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v49 = callback;
    do
    {
      long long v55 = v53;
      v56 = v52;
      uint64_t v16 = *((void *)silo + 3);
      *(_OWORD *)&range.duration.CMTimeValue value = v57;
      range.duration.CMTimeEpoch epoch = (CMTimeEpoch)epoch;
      OSStatus TimeStamp = VTMultiPassStorageCopyDataAtTimeStamp(v16, (long long *)&range.duration.value, 0, &theData);
      if (TimeStamp) {
        goto LABEL_76;
      }
      CFDataRef v17 = theData;
      if ((v13 & (theData == 0)) == 1) {
        goto LABEL_75;
      }
      if (!theData)
      {
        CMSampleBufferRef v32 = 0;
        goto LABEL_52;
      }
      CMSampleBufferRef sampleBufferOut = 0;
      CMBlockBufferRef blockBufferOut = 0;
      size_t sampleSizeArray = 0;
      memset(&range, 0, sizeof(range));
      memset(&time, 0, sizeof(time));
      CFErrorRef error = 0;
      CFPropertyListFormat format = kCFPropertyListBinaryFormat_v1_0;
      size_t Length = CFDataGetLength(theData);
      BytePtr = (UInt8 *)CFDataGetBytePtr(v17);
      CFRetain(v17);
      long long v21 = *((_OWORD *)BytePtr + 1);
      long long v20 = *((_OWORD *)BytePtr + 2);
      long long v22 = *((_OWORD *)BytePtr + 3);
      range.decodeTimeStamp.CMTimeEpoch epoch = *((void *)BytePtr + 8);
      *(_OWORD *)&range.decodeTimeStamp.CMTimeValue value = v22;
      *(_OWORD *)&range.duration.CMTimeValue value = *(_OWORD *)BytePtr;
      *(_OWORD *)&range.duration.CMTimeEpoch epoch = v21;
      *(_OWORD *)&range.presentationTimeStamp.CMTimeScale timescale = v20;
      CMTimeValue value = v22;
      CMTimeScale timescale = DWORD2(v22);
      CMTimeFlags flags = HIDWORD(v22);
      CMTimeEpoch v24 = range.decodeTimeStamp.epoch;
      if (BYTE12(v22) & 1) == 0 && (range.presentationTimeStamp.flags)
      {
        CMTimeValue value = range.presentationTimeStamp.value;
        CMTimeScale timescale = range.presentationTimeStamp.timescale;
        CMTimeEpoch v24 = range.presentationTimeStamp.epoch;
        CMTimeFlags flags = range.presentationTimeStamp.flags;
      }
      int v25 = *((_DWORD *)BytePtr + 18);
      if (v25 > 0 && (CFDataRef v26 = CFDataCreate(v15, BytePtr + 76, *((unsigned int *)BytePtr + 18))) != 0)
      {
        CFAllocatorRef v27 = v15;
        uint64_t v28 = v7;
        CFDataRef cf = v26;
        CFArrayRef v29 = (const __CFArray *)CFPropertyListCreateWithData(v27, v26, 0, &format, &error);
        if (error)
        {
          CFStringRef v30 = CFErrorCopyFailureReason(error);
          OSStatus Code = CFErrorGetCode(error);
          CMSampleBufferRef v32 = 0;
          unint64_t v33 = v49;
          CFArrayRef v34 = v29;
LABEL_24:
          v7 = v28;
LABEL_25:
          CFDataRef v35 = cf;
          goto LABEL_38;
        }
        CFArrayRef v48 = v29;
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v29, 0);
        if (!ValueAtIndex)
        {
          OSStatus Code = FigSignalErrorAt();
          CMSampleBufferRef v32 = 0;
          CFStringRef v30 = 0;
          CFArrayRef v34 = v29;
          unint64_t v33 = v49;
          goto LABEL_24;
        }
        CFDictionaryRef theDict = ValueAtIndex;
        size_t v37 = (v25 + 76);
        size_t sampleSizeArray = Length - v37;
        time.version = 0;
        time.AllocateBlock = 0;
        time.FreeBlock = (void (__cdecl *)(void *, void *, size_t))vtFrameSiloFreeBlockCFData;
        time.refCon = v17;
        OSStatus v38 = CMBlockBufferCreateWithMemoryBlock(blockAllocator, BytePtr, Length, blockAllocator, &time, v37, Length - v37, 0, &blockBufferOut);
        v7 = v28;
        if (v38)
        {
          OSStatus Code = v38;
          CMSampleBufferRef v32 = 0;
          CFStringRef v30 = 0;
          CFArrayRef v34 = v48;
          unint64_t v33 = v49;
          goto LABEL_25;
        }
        CFDataRef v35 = cf;
        while (1)
        {
          BOOL v39 = (CMTime *)CFArrayGetValueAtIndex(*((CFArrayRef *)silo + 10), v14);
          CMTime start = v39[1];
          end.CMTimeValue value = value;
          end.CMTimeScale timescale = timescale;
          end.CMTimeFlags flags = flags;
          end.CMTimeEpoch epoch = v24;
          if ((CMTimeCompare(&start, &end) & 0x80000000) == 0) {
            break;
          }
          if (++v14 >= CFArrayGetCount(*((CFArrayRef *)silo + 10)))
          {
            CMSampleBufferRef v32 = 0;
            CFStringRef v30 = 0;
            OSStatus Code = -12902;
            CFArrayRef v34 = v48;
            unint64_t v33 = v49;
            goto LABEL_38;
          }
        }
        CMTimeRange v40 = (const opaqueCMFormatDescription *)v39[2].value;
        CFArrayRef v34 = v48;
        unint64_t v33 = v49;
        if (v40)
        {
          OSStatus v41 = CMSampleBufferCreate(blockAllocator, blockBufferOut, 1u, 0, 0, v40, 1, 1, &range, 1, &sampleSizeArray, &sampleBufferOut);
          if (!v41)
          {
            CFArrayRef SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(sampleBufferOut, 1u);
            CMTimeValue v43 = (void *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
            if (v43)
            {
              CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)vtFrameSiloMergeDictionary, v43);
              OSStatus Code = 0;
              CFStringRef v30 = 0;
              CMSampleBufferRef v32 = sampleBufferOut;
              CMSampleBufferRef sampleBufferOut = 0;
              goto LABEL_38;
            }
            OSStatus v41 = FigSignalErrorAt();
          }
          OSStatus Code = v41;
          CMSampleBufferRef v32 = 0;
          CFStringRef v30 = 0;
        }
        else
        {
          CMSampleBufferRef v32 = 0;
          CFStringRef v30 = 0;
          OSStatus Code = -12902;
        }
      }
      else
      {
        OSStatus Code = FigSignalErrorAt();
        CMSampleBufferRef v32 = 0;
        CFArrayRef v34 = 0;
        CFDataRef v35 = 0;
        CFStringRef v30 = 0;
        unint64_t v33 = v49;
      }
LABEL_38:
      if (blockBufferOut) {
        CFRelease(blockBufferOut);
      }
      if (sampleBufferOut) {
        CFRelease(sampleBufferOut);
      }
      if (v34) {
        CFRelease(v34);
      }
      if (v35) {
        CFRelease(v35);
      }
      if (error) {
        CFRelease(error);
      }
      CFAllocatorRef v15 = blockAllocator;
      if (v30) {
        CFRelease(v30);
      }
      if (Code) {
        goto LABEL_67;
      }
      OSStatus v44 = ((uint64_t (*)(void *, CMSampleBufferRef))v33)(refcon, v32);
      if (v44)
      {
LABEL_74:
        OSStatus Code = v44;
        goto LABEL_67;
      }
LABEL_52:
      uint64_t v45 = *((void *)silo + 3);
      *(_OWORD *)&range.duration.CMTimeValue value = v57;
      range.duration.CMTimeEpoch epoch = (CMTimeEpoch)epoch;
      OSStatus v44 = VTMultiPassStorageGetTimeStamp(v45, (long long *)&range.duration.value, @"GetNextTimeStamp", (uint64_t)&v55);
      if (v44) {
        goto LABEL_74;
      }
      if ((BYTE12(v55) & 1) == 0) {
        goto LABEL_66;
      }
      long long v57 = v55;
      CMTimeEpoch epoch = v56;
      if (theData)
      {
        CFRelease(theData);
        theCFDataRef Data = 0;
      }
      if (v32) {
        CFRelease(v32);
      }
      long long v46 = *(_OWORD *)&v7->start.epoch;
      *(_OWORD *)&range.duration.CMTimeValue value = *(_OWORD *)&v7->start.value;
      *(_OWORD *)&range.duration.CMTimeEpoch epoch = v46;
      *(_OWORD *)&range.presentationTimeStamp.CMTimeScale timescale = *(_OWORD *)&v7->duration.timescale;
      *(_OWORD *)&time.version = v57;
      *(void (__cdecl **)(void *, void *, size_t))((char *)&time.FreeBlock + 4) = epoch;
      char v13 = 1;
    }
    while (CMTimeRangeContainsTime((CMTimeRange *)&range, (CMTime *)&time));
  }
  CMSampleBufferRef v32 = 0;
LABEL_66:
  OSStatus Code = 0;
LABEL_67:
  if (theData) {
    CFRelease(theData);
  }
  if (v32) {
    CFRelease(v32);
  }
  return Code;
}

OSStatus VTFrameSiloCallBlockForEachSampleBuffer(VTFrameSiloRef silo, CMTimeRange *timeRange, void *handler)
{
  long long v3 = *(_OWORD *)&timeRange->start.epoch;
  *(_OWORD *)&v5.start.CMTimeValue value = *(_OWORD *)&timeRange->start.value;
  *(_OWORD *)&v5.start.CMTimeEpoch epoch = v3;
  *(_OWORD *)&v5.duration.CMTimeScale timescale = *(_OWORD *)&timeRange->duration.timescale;
  return VTFrameSiloCallFunctionForEachSampleBuffer(silo, &v5, handler, (OSStatus (__cdecl *)(void *, CMSampleBufferRef))vtFrameSiloBlockFunctionCallback);
}

uint64_t vtFrameSiloBlockFunctionCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

double vtFrameSiloInit(_OWORD *a1)
{
  double result = 0.0;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  a1[1] = 0u;
  return result;
}

CFTypeRef vtFrameSiloCopyFormattingDesc()
{
  return CFRetain(@"[VTFrameSilo]");
}

__CFString *vtFrameSiloCopyDebugDesc(const void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFAllocatorRef v4 = CFGetAllocator(a1);
  CFStringAppendFormat(Mutable, 0, @"<VTFrameSilo %p [%p]>{}", a1, v4);
  return Mutable;
}

void vtFrameSiloFreeBlockCFData(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void vtFrameSiloMergeDictionary(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_420vf(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v11 = a2[3];
  uint64_t v12 = a2[5];
  uint64_t v13 = *a6;
  uint64_t v14 = a6[1];
  uint64_t v16 = a6[2];
  uint64_t v15 = a6[3];
  uint64_t v17 = a6[4];
  uint64_t v18 = a6[5];
  if (v18)
  {
    ++v18;
    ++v12;
    if (v15)
    {
      --v15;
      --v11;
    }
    else
    {
      v15 -= 2;
      v11 -= 2;
    }
  }
  uint64_t v19 = a2[2];
  uint64_t v20 = a2[4];
  if (v17)
  {
    ++v17;
    ++v20;
    if (v16)
    {
      --v16;
      --v19;
    }
    else
    {
      v16 -= 2;
      v19 -= 2;
    }
  }
  memset(v27, 0, 32);
  if (v20 + v19 <= v9) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v9 - v20;
  }
  memset(&v27[32], 0, 24);
  if (v17 + v16 > v13) {
    uint64_t v16 = v13 - v17;
  }
  size_t v22 = *(unsigned __int8 *)(a1 + 162);
  v27[0] = *(unsigned char *)(a1 + 162);
  if (v12 + v11 > v10) {
    uint64_t v11 = v10 - v12;
  }
  *(void *)&v27[4] = v9;
  *(void *)&v27[12] = v10;
  if (v18 + v15 <= v14) {
    uint64_t v23 = v15;
  }
  else {
    uint64_t v23 = v14 - v18;
  }
  if (v21 >= v16) {
    uint64_t v24 = v16;
  }
  else {
    uint64_t v24 = v21;
  }
  *(void *)&v27[20] = v24;
  if (v11 < v23) {
    uint64_t v23 = v11;
  }
  *(void *)&v27[28] = v23;
  *(void *)&v27[36] = v20;
  *(void *)&v27[44] = v12;
  uint64_t v31 = v13;
  uint64_t v32 = v14;
  uint64_t v33 = v24;
  uint64_t v34 = v23;
  uint64_t v35 = v17;
  uint64_t v36 = v18;
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v39 = a9;
  uint64_t v40 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v22, global_queue, v27, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_420vf_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_420vf_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, double a6, float a7, float a8)
{
  uint64_t v8 = *(void *)(result + 28);
  unint64_t v9 = 2 * *result;
  unint64_t v10 = v8 * a2 / v9;
  unint64_t v11 = (v8 + v8 * a2) / v9;
  if (2 * v11 != 2 * v10)
  {
    unint64_t v12 = 0;
    unint64_t v13 = *(void *)(result + 20);
    unint64_t v159 = 2 * v11 - 2 * v10;
    uint64_t v14 = *((void *)result + 19);
    uint64_t v15 = (uint64_t *)*((void *)result + 17);
    uint64_t v16 = **((void **)result + 8);
    uint64_t v17 = *v15;
    uint64_t v18 = v15[2];
    float v19 = 8191.0 / (float)*(unsigned int *)(v14 + 128);
    LOWORD(a5) = *(_WORD *)(v14 + 140);
    *(float *)&a6 = (float)LODWORD(a5);
    LOWORD(a5) = *(_WORD *)(v14 + 144);
    float v20 = (float)LODWORD(a5);
    LOWORD(a7) = *(_WORD *)(v14 + 146);
    float v21 = (float)LODWORD(a7);
    LOWORD(a7) = *(_WORD *)(v14 + 148);
    float v22 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v14 + 150);
    *(float *)&unsigned int v23 = (float)LODWORD(a8);
    float v183 = v21;
    float v184 = *(float *)&v23;
    LOWORD(v23) = *(_WORD *)(v14 + 152);
    float v181 = *(float *)(v14 + 36);
    float v182 = (float)v23;
    float v179 = *(float *)(v14 + 44);
    float v180 = *(float *)(v14 + 40);
    float v178 = *(float *)(v14 + 48) * 0.25;
    float v177 = *(float *)(v14 + 52) * 0.25;
    float v176 = *(float *)(v14 + 56) * 0.25;
    float v175 = *(float *)(v14 + 60) * 0.25;
    float v174 = *(float *)(v14 + 64) * 0.25;
    float v172 = *(float *)(v14 + 68) * 0.25;
    float v173 = *(float *)(v14 + 72);
    float v170 = *(float *)(v14 + 80);
    float v171 = *(float *)(v14 + 76);
    float v168 = *(float *)(v14 + 88);
    float v169 = *(float *)(v14 + 84);
    float v166 = *(float *)(v14 + 96);
    float v167 = *(float *)(v14 + 92);
    float v24 = *(float *)(v14 + 108);
    float v164 = *(float *)(v14 + 104);
    float v165 = *(float *)(v14 + 100);
    uint64_t v25 = v14 + 164;
    uint64_t v26 = v14 + 16548;
    uint64_t v27 = v14 + 32932;
    float v28 = *(float *)(v14 + 112);
    float v29 = *(float *)(v14 + 116);
    float v30 = *(float *)(v14 + 120);
    uint64_t v31 = *((void *)result + 14);
    unint64_t v32 = *((void *)result + 13) * a2 / v9;
    uint64_t v33 = (void *)*((void *)result + 16);
    uint64_t v34 = *((void *)result + 15) + 2 * v32;
    double result = (unsigned __int8 *)(**((void **)result + 7)
                               + v16 * (*(void *)(result + 44) + 2 * v10)
                               + 4 * *(void *)(result + 36));
    uint64_t v35 = v33[1];
    uint64_t v36 = (unsigned char *)(*v33 + v34 * *v15 + v31);
    uint64_t v37 = v33[2];
    if (v37) {
      uint64_t v38 = (unsigned char *)(v37 + v34 * v18 + v31);
    }
    else {
      uint64_t v38 = 0;
    }
    if (v34 >= 0) {
      uint64_t v39 = v34;
    }
    else {
      uint64_t v39 = v34 + 1;
    }
    uint64_t v157 = v15[2];
    uint64_t v158 = v15[1];
    uint64_t v40 = v35 + (v39 >> 1) * v158 + v31;
    float32x2_t v41 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a6, 0);
    float v162 = v28;
    float v163 = v24;
    float v160 = v30;
    float v161 = v29;
    do
    {
      CMTimeValue v42 = &v38[v18];
      CMTimeValue v43 = &v36[v17];
      OSStatus v44 = &result[v16];
      if (v13)
      {
        unint64_t v45 = 0;
        long long v46 = &v38[v18];
        v47 = &v36[v17];
        CFArrayRef v48 = (unsigned int *)&result[v16];
        do
        {
          unsigned int v49 = *((_DWORD *)result + 1);
          float32x2_t v50 = (float32x2_t)vdup_n_s32(0x45FFF800u);
          _D3 = (int8x8_t)vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*(_DWORD *)result), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v41), v19), 0), v50)));
          _D3.i16[0] = *(_WORD *)(v25 + 2 * _D3.u32[0]);
          __asm { FCVT            S19, H3 }
          _D3.i16[0] = *(_WORD *)(v25 + 2 * _D3.u32[1]);
          __asm { FCVT            S20, H3 }
          _D3.i32[0] = *(_DWORD *)result;
          _D3.i32[1] = v49 >> 20;
          int32x2_t v58 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D3, (int8x8_t)0x300000003)), v41), v19), 0), v50)));
          _H5 = *(_WORD *)(v25 + 2 * v58.u32[0]);
          __asm { FCVT            S21, H5 }
          float v61 = fmaxf(_S19, fmaxf(_S20, _S21));
          float v62 = (float)((float)((float)(v28 * _S20) + (float)(v24 * _S19)) + (float)(v29 * _S21)) + (float)(v30 * v61);
          float v63 = 8191.0;
          if (v62 <= 8191.0)
          {
            float v63 = (float)((float)((float)(v28 * _S20) + (float)(v24 * _S19)) + (float)(v29 * _S21)) + (float)(v30 * v61);
            if (v62 < 0.0) {
              float v63 = 0.0;
            }
          }
          _H3 = *(_WORD *)(v25 + 2 * v58.u32[1]);
          __asm { FCVT            S24, H3 }
          v66.i32[0] = v49 >> 10;
          v66.i32[1] = *((_DWORD *)result + 1);
          _D3 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v66, (int8x8_t)0x300000003)), v41), v19), 0), v50)));
          _D3.i16[0] = *(_WORD *)(v25 + 2 * _D3.u32[0]);
          __asm { FCVT            S5, H3 }
          _D3.i16[0] = *(_WORD *)(v25 + 2 * _D3.u32[1]);
          __asm { FCVT            S3, H3 }
          float v70 = fmaxf(_S24, fmaxf(_S5, _S3));
          float v71 = (float)((float)((float)(v28 * _S5) + (float)(v24 * _S24)) + (float)(v29 * _S3)) + (float)(v30 * v70);
          float v72 = 8191.0;
          if (v71 <= 8191.0)
          {
            float v72 = (float)((float)((float)(v28 * _S5) + (float)(v24 * _S24)) + (float)(v29 * _S3)) + (float)(v30 * v70);
            if (v71 < 0.0) {
              float v72 = 0.0;
            }
          }
          unsigned int v73 = v48[1];
          _D6 = (int8x8_t)vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v48), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v41), v19), 0), v50)));
          _D6.i16[0] = *(_WORD *)(v25 + 2 * _D6.u32[0]);
          __asm { FCVT            S7, H6 }
          _D6.i16[0] = *(_WORD *)(v25 + 2 * _D6.u32[1]);
          __asm { FCVT            S16, H6 }
          _D6.i32[0] = *v48;
          _D6.i32[1] = v73 >> 20;
          int32x2_t v77 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D6, (int8x8_t)0x300000003)), v41), v19), 0), v50)));
          _D6.i16[0] = *(_WORD *)(v25 + 2 * v77.u32[0]);
          __asm { FCVT            S17, H6 }
          float v79 = (float)((float)((float)(v28 * _S16) + (float)(v24 * _S7)) + (float)(v29 * _S17))
              + (float)(v30 * fmaxf(_S7, fmaxf(_S16, _S17)));
          float v80 = 8191.0;
          if (v79 <= 8191.0)
          {
            float v80 = v79;
            if (v79 < 0.0) {
              float v80 = 0.0;
            }
          }
          _H23 = *(_WORD *)(v25 + 2 * v77.u32[1]);
          __asm { FCVT            S23, H23 }
          v83.i32[0] = v73 >> 10;
          v83.i32[1] = v48[1];
          _D25 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v83, (int8x8_t)0x300000003)), v41), v19), 0), v50)));
          _D25.i16[0] = *(_WORD *)(v25 + 2 * _D25.u32[0]);
          __asm { FCVT            S14, H25 }
          _D25.i16[0] = *(_WORD *)(v25 + 2 * _D25.u32[1]);
          __asm { FCVT            S25, H25 }
          float v87 = (float)((float)((float)(v28 * _S14) + (float)(v24 * _S23)) + (float)(v29 * _S25))
              + (float)(v30 * fmaxf(_S23, fmaxf(_S14, _S25)));
          float v88 = 8191.0;
          if (v87 <= 8191.0)
          {
            float v88 = v87;
            if (v87 < 0.0) {
              float v88 = 0.0;
            }
          }
          if (v38)
          {
            unsigned int v89 = v49 >> 30;
            int v90 = 85 * (*(_DWORD *)result >> 30);
            char v91 = 85 * v89;
            char v92 = 85 * (*v48 >> 30);
            char v93 = 85 * (v73 >> 30);
          }
          else
          {
            char v92 = 0;
            LOBYTE(v90) = 0;
            char v91 = 0;
            char v93 = 0;
          }
          _H22 = *(_WORD *)(v26 + 2 * llroundf(v63));
          __asm { FCVT            S22, H22 }
          float v96 = _S19 * _S22;
          float v97 = _S20 * _S22;
          float v98 = _S21 * _S22;
          LOWORD(_S22) = *(_WORD *)(v26 + 2 * llroundf(v72));
          __asm { FCVT            S22, H22 }
          float v100 = _S24 * _S22;
          _S5 = _S5 * _S22;
          _S3 = _S3 * _S22;
          _H6 = *(_WORD *)(v26 + 2 * llroundf(v80));
          __asm { FCVT            S6, H6 }
          _S7 = _S7 * _S6;
          _S16 = _S16 * _S6;
          float v107 = _S17 * _S6;
          _H17 = *(_WORD *)(v26 + 2 * llroundf(v88));
          __asm { FCVT            S17, H17 }
          float v110 = _S23 * _S17;
          _S23 = _S14 * _S17;
          float v112 = _S25 * _S17;
          float v113 = (float)((float)(v171 * v97) + (float)(v96 * v173)) + (float)(v98 * v170);
          float v114 = (float)((float)(v168 * v97) + (float)(v96 * v169)) + (float)(v98 * v167);
          _S19 = (float)((float)(v165 * v97) + (float)(v96 * v166)) + (float)(v98 * v164);
          _S20 = (float)((float)(v171 * _S5) + (float)(v100 * v173)) + (float)(_S3 * v170);
          float v117 = (float)((float)(v168 * _S5) + (float)(v100 * v169)) + (float)(_S3 * v167);
          _S24 = (float)((float)(v165 * _S5) + (float)(v100 * v166)) + (float)(_S3 * v164);
          float v119 = (float)((float)(v171 * _S16) + (float)(_S7 * v173)) + (float)(v107 * v170);
          float v120 = (float)((float)(v168 * _S16) + (float)(_S7 * v169)) + (float)(v107 * v167);
          float v121 = (float)((float)(v165 * _S16) + (float)(_S7 * v166)) + (float)(v107 * v164);
          float v122 = (float)((float)(v171 * _S23) + (float)(v110 * v173)) + (float)(v112 * v170);
          float v123 = (float)((float)(v168 * _S23) + (float)(v110 * v169)) + (float)(v112 * v167);
          _S22 = (float)((float)(v165 * _S23) + (float)(v110 * v166)) + (float)(v112 * v164);
          LOWORD(_S3) = *(_WORD *)(v27 + 2 * llroundf(fminf(fmaxf(v113, 0.0), 8191.0)));
          __asm { FCVT            S6, H3 }
          LOWORD(_S3) = *(_WORD *)(v27 + 2 * llroundf(fminf(fmaxf(v114, 0.0), 8191.0)));
          __asm { FCVT            S3, H3 }
          LOWORD(_S5) = *(_WORD *)(v27 + 2 * llroundf(fminf(fmaxf(_S19, 0.0), 8191.0)));
          __asm { FCVT            S5, H5 }
          LOWORD(_S7) = *(_WORD *)(v27 + 2 * llroundf(fminf(fmaxf(_S20, 0.0), 8191.0)));
          __asm { FCVT            S7, H7 }
          LOWORD(_S16) = *(_WORD *)(v27 + 2 * llroundf(fminf(fmaxf(v117, 0.0), 8191.0)));
          LOWORD(_S19) = *(_WORD *)(v27 + 2 * llroundf(fminf(fmaxf(_S24, 0.0), 8191.0)));
          __asm
          {
            FCVT            S17, H16
            FCVT            S16, H19
          }
          LOWORD(_S19) = *(_WORD *)(v27 + 2 * llroundf(fminf(fmaxf(v119, 0.0), 8191.0)));
          __asm { FCVT            S21, H19 }
          LOWORD(_S19) = *(_WORD *)(v27 + 2 * llroundf(fminf(fmaxf(v120, 0.0), 8191.0)));
          __asm { FCVT            S19, H19 }
          LOWORD(_S20) = *(_WORD *)(v27 + 2 * llroundf(fminf(fmaxf(v121, 0.0), 8191.0)));
          __asm { FCVT            S20, H20 }
          LOWORD(_S23) = *(_WORD *)(v27 + 2 * llroundf(fminf(fmaxf(v122, 0.0), 8191.0)));
          __asm { FCVT            S23, H23 }
          LOWORD(_S24) = *(_WORD *)(v27 + 2 * llroundf(fminf(fmaxf(v123, 0.0), 8191.0)));
          LOWORD(_S22) = *(_WORD *)(v27 + 2 * llroundf(fminf(fmaxf(_S22, 0.0), 8191.0)));
          __asm
          {
            FCVT            S24, H24
            FCVT            S22, H22
          }
          float v137 = (float)((float)((float)(v180 * _S3) + (float)(v181 * _S6)) + (float)(v179 * _S5)) + v20;
          if (v137 < v20) {
            float v138 = v20;
          }
          else {
            float v138 = (float)((float)((float)(v180 * _S3) + (float)(v181 * _S6)) + (float)(v179 * _S5)) + v20;
          }
          BOOL v139 = v137 <= v22;
          float v140 = (float)((float)((float)(v180 * _S17) + (float)(v181 * _S7)) + (float)(v179 * _S16)) + v20;
          if (!v139) {
            float v138 = v22;
          }
          char v141 = llroundf(v138);
          if (v140 < v20) {
            float v142 = v20;
          }
          else {
            float v142 = (float)((float)((float)(v180 * _S17) + (float)(v181 * _S7)) + (float)(v179 * _S16)) + v20;
          }
          BOOL v139 = v140 <= v22;
          float v143 = (float)((float)((float)(v180 * _S19) + (float)(v181 * _S21)) + (float)(v179 * _S20)) + v20;
          if (!v139) {
            float v142 = v22;
          }
          char v144 = llroundf(v142);
          if (v143 < v20) {
            float v145 = v20;
          }
          else {
            float v145 = (float)((float)((float)(v180 * _S19) + (float)(v181 * _S21)) + (float)(v179 * _S20)) + v20;
          }
          BOOL v139 = v143 <= v22;
          float v146 = (float)((float)((float)(v180 * _S24) + (float)(v181 * _S23)) + (float)(v179 * _S22)) + v20;
          if (!v139) {
            float v145 = v22;
          }
          char v147 = llroundf(v145);
          if (v146 < v20) {
            float v148 = v20;
          }
          else {
            float v148 = (float)((float)((float)(v180 * _S24) + (float)(v181 * _S23)) + (float)(v179 * _S22)) + v20;
          }
          if (v146 <= v22) {
            float v149 = v148;
          }
          else {
            float v149 = v22;
          }
          float v150 = (float)((float)(_S6 + _S7) + _S21) + _S23;
          float v151 = (float)((float)(_S3 + _S17) + _S19) + _S24;
          *uint64_t v36 = v141;
          v36[1] = v144;
          unsigned char *v47 = v147;
          v47[1] = llroundf(v149);
          float v152 = (float)((float)(_S5 + _S16) + _S20) + _S22;
          float v153 = (float)((float)(v183 + (float)(v150 * v178)) + (float)(v151 * v177)) + (float)(v152 * v176);
          float v154 = v182;
          if (v153 <= v182)
          {
            float v154 = (float)((float)(v183 + (float)(v150 * v178)) + (float)(v151 * v177)) + (float)(v152 * v176);
            if (v153 < v184) {
              float v154 = v184;
            }
          }
          float v155 = (float)((float)(v183 + (float)(v150 * v175)) + (float)(v151 * v174)) + (float)(v152 * v172);
          *(unsigned char *)(v40 + v45) = llroundf(v154);
          float v156 = v182;
          if (v155 <= v182)
          {
            float v156 = v155;
            if (v155 < v184) {
              float v156 = v184;
            }
          }
          *(unsigned char *)(v40 + v45 + 1) = llroundf(v156);
          float v28 = v162;
          float v24 = v163;
          float v30 = v160;
          float v29 = v161;
          if (v38)
          {
            *uint64_t v38 = v90;
            v38[1] = v91;
            v38 += 2;
            *long long v46 = v92;
            v46[1] = v93;
            v46 += 2;
          }
          result += 8;
          v48 += 2;
          v36 += 2;
          v47 += 2;
          v45 += 2;
        }
        while (v13 > v45);
      }
      double result = &v44[v16];
      uint64_t v36 = &v43[v17];
      uint64_t v18 = v157;
      v40 += v158;
      uint64_t v38 = &v42[v157];
      v12 += 2;
    }
    while (v159 > v12);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_420vf(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v11 = a2[3];
  uint64_t v12 = a2[5];
  uint64_t v13 = *a6;
  uint64_t v14 = a6[1];
  uint64_t v16 = a6[2];
  uint64_t v15 = a6[3];
  uint64_t v17 = a6[4];
  uint64_t v18 = a6[5];
  if (v18)
  {
    ++v18;
    ++v12;
    if (v15)
    {
      --v15;
      --v11;
    }
    else
    {
      v15 -= 2;
      v11 -= 2;
    }
  }
  uint64_t v19 = a2[2];
  uint64_t v20 = a2[4];
  if (v17)
  {
    ++v17;
    ++v20;
    if (v16)
    {
      --v16;
      --v19;
    }
    else
    {
      v16 -= 2;
      v19 -= 2;
    }
  }
  memset(v27, 0, 32);
  if (v20 + v19 <= v9) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v9 - v20;
  }
  memset(&v27[32], 0, 24);
  if (v17 + v16 > v13) {
    uint64_t v16 = v13 - v17;
  }
  size_t v22 = *(unsigned __int8 *)(a1 + 162);
  v27[0] = *(unsigned char *)(a1 + 162);
  if (v12 + v11 > v10) {
    uint64_t v11 = v10 - v12;
  }
  *(void *)&v27[4] = v9;
  *(void *)&v27[12] = v10;
  if (v18 + v15 <= v14) {
    uint64_t v23 = v15;
  }
  else {
    uint64_t v23 = v14 - v18;
  }
  if (v21 >= v16) {
    uint64_t v24 = v16;
  }
  else {
    uint64_t v24 = v21;
  }
  *(void *)&v27[20] = v24;
  if (v11 < v23) {
    uint64_t v23 = v11;
  }
  *(void *)&v27[28] = v23;
  *(void *)&v27[36] = v20;
  *(void *)&v27[44] = v12;
  uint64_t v31 = v13;
  uint64_t v32 = v14;
  uint64_t v33 = v24;
  uint64_t v34 = v23;
  uint64_t v35 = v17;
  uint64_t v36 = v18;
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v39 = a9;
  uint64_t v40 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v22, global_queue, v27, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_420vf_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Mat_TRC_420vf_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, double a8, float a9)
{
  uint64_t v9 = *(void *)(result + 28);
  unint64_t v10 = 2 * *result;
  unint64_t v11 = v9 * a2 / v10;
  unint64_t v12 = (v9 + v9 * a2) / v10;
  if (2 * v12 != 2 * v11)
  {
    unint64_t v13 = 0;
    unint64_t v14 = *(void *)(result + 20);
    uint64_t v15 = *(void *)(result + 44) + 2 * v11;
    unint64_t v115 = 2 * v12 - 2 * v11;
    uint64_t v16 = *((void *)result + 19);
    uint64_t v17 = (uint64_t *)*((void *)result + 17);
    uint64_t v18 = **((void **)result + 8);
    uint64_t v19 = *v17;
    uint64_t v20 = v17[1];
    uint64_t v21 = v17[2];
    float v22 = 8191.0 / (float)*(unsigned int *)(v16 + 128);
    LOWORD(a5) = *(_WORD *)(v16 + 140);
    *(float *)&a8 = (float)LODWORD(a5);
    LOWORD(a5) = *(_WORD *)(v16 + 144);
    float v23 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v16 + 146);
    LOWORD(a7) = *(_WORD *)(v16 + 148);
    float v24 = (float)LODWORD(a7);
    LOWORD(a9) = *(_WORD *)(v16 + 150);
    float v136 = (float)LODWORD(a6);
    float v137 = (float)LODWORD(a9);
    LOWORD(a9) = *(_WORD *)(v16 + 152);
    float v134 = *(float *)(v16 + 36);
    float v135 = (float)LODWORD(a9);
    float v132 = *(float *)(v16 + 44);
    float v133 = *(float *)(v16 + 40);
    float v130 = *(float *)(v16 + 52) * 0.25;
    float v131 = *(float *)(v16 + 48) * 0.25;
    float v128 = *(float *)(v16 + 60) * 0.25;
    float v129 = *(float *)(v16 + 56) * 0.25;
    float v126 = *(float *)(v16 + 72);
    float v127 = *(float *)(v16 + 64) * 0.25;
    float v124 = *(float *)(v16 + 76);
    float v125 = *(float *)(v16 + 68) * 0.25;
    float v122 = *(float *)(v16 + 84);
    float v123 = *(float *)(v16 + 80);
    float v120 = *(float *)(v16 + 92);
    float v121 = *(float *)(v16 + 88);
    float v118 = *(float *)(v16 + 100);
    float v119 = *(float *)(v16 + 96);
    float v117 = *(float *)(v16 + 104);
    uint64_t v25 = v16 + 164;
    uint64_t v26 = v16 + 16548;
    uint64_t v27 = *((void *)result + 14);
    unint64_t v28 = *((void *)result + 13) * a2 / v10;
    uint64_t v29 = (void *)*((void *)result + 16);
    uint64_t v30 = *((void *)result + 15) + 2 * v28;
    uint64_t v31 = (unsigned int *)(**((void **)result + 7) + v18 * v15 + 4 * *(void *)(result + 36));
    double result = (unsigned __int8 *)(*v29 + v30 * v19 + v27);
    uint64_t v32 = v29[2];
    if (v32) {
      uint64_t v33 = (unsigned char *)(v32 + v30 * v21 + v27);
    }
    else {
      uint64_t v33 = 0;
    }
    uint64_t v34 = v29[1] + v30 / 2 * v20 + v27;
    float32x2_t v116 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a8, 0);
    float32x2_t v35 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    uint64_t v113 = v19;
    uint64_t v114 = v18;
    uint64_t v112 = v21;
    do
    {
      uint64_t v36 = &v33[v21];
      uint64_t v37 = &result[v19];
      uint64_t v38 = (char *)v31 + v18;
      if (v14)
      {
        unint64_t v39 = 0;
        uint64_t v40 = v36;
        float32x2_t v41 = &result[v19];
        CMTimeValue v42 = (unsigned int *)((char *)v31 + v18);
        do
        {
          unsigned int v43 = *v31;
          unsigned int v44 = v31[1];
          unsigned int v46 = *v42;
          unsigned int v45 = v42[1];
          if (v33)
          {
            int v47 = 85 * (v43 >> 30);
            int v48 = 85 * (v44 >> 30);
            int v49 = 85 * (v46 >> 30);
            int v50 = 85 * (v45 >> 30);
          }
          else
          {
            LOBYTE(v49) = 0;
            LOBYTE(v47) = 0;
            LOBYTE(v48) = 0;
            LOBYTE(v50) = 0;
          }
          _D5 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v43), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v116), v22), 0), v35)));
          _D5.i16[0] = *(_WORD *)(v25 + 2 * _D5.u32[0]);
          __asm { FCVT            S15, H5 }
          _D5.i16[0] = *(_WORD *)(v25 + 2 * _D5.u32[1]);
          _D19.i32[0] = *v31;
          _D19.i32[1] = v44 >> 20;
          __asm { FCVT            S18, H5 }
          _D5 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D19, (int8x8_t)0x300000003)), v116), v22), 0), v35)));
          _D5.i16[0] = *(_WORD *)(v25 + 2 * _D5.u32[0]);
          __asm { FCVT            S19, H5 }
          _D5.i16[0] = *(_WORD *)(v25 + 2 * _D5.u32[1]);
          _D20.i32[0] = v44 >> 10;
          _D20.i32[1] = v31[1];
          _D21 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D20, (int8x8_t)0x300000003)), v116), v22), 0), v35)));
          __asm { FCVT            S20, H5 }
          _D5.i16[0] = *(_WORD *)(v25 + 2 * _D21.u32[0]);
          _D21.i16[0] = *(_WORD *)(v25 + 2 * _D21.u32[1]);
          __asm
          {
            FCVT            S22, H5
            FCVT            S21, H21
          }
          _D5 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v46), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v116), v22), 0), v35)));
          _D5.i16[0] = *(_WORD *)(v25 + 2 * _D5.u32[0]);
          __asm { FCVT            S24, H5 }
          _D5.i16[0] = *(_WORD *)(v25 + 2 * _D5.u32[1]);
          v65.i32[0] = *v42;
          v65.i32[1] = v45 >> 20;
          __asm { FCVT            S5, H5 }
          _D3 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v65, (int8x8_t)0x300000003)), v116), v22), 0), v35)));
          _D3.i16[0] = *(_WORD *)(v25 + 2 * _D3.u32[0]);
          __asm { FCVT            S3, H3 }
          _H10 = *(_WORD *)(v25 + 2 * _D3.u32[1]);
          v68.i32[0] = v45 >> 10;
          v68.i32[1] = v42[1];
          _D11 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v68, (int8x8_t)0x300000003)), v116), v22), 0), v35)));
          __asm { FCVT            S10, H10 }
          _D11.i16[0] = *(_WORD *)(v25 + 2 * _D11.u32[0]);
          _H12 = *(_WORD *)(v25 + 2 * _D11.u32[1]);
          __asm
          {
            FCVT            S11, H11
            FCVT            S12, H12
          }
          _S7 = (float)((float)(v124 * _S18) + (float)(_S15 * v126)) + (float)(*(float *)_D19.i32 * v123);
          _S16 = (float)((float)(v121 * _S18) + (float)(_S15 * v122)) + (float)(*(float *)_D19.i32 * v120);
          float v75 = (float)((float)(v118 * _S18) + (float)(_S15 * v119)) + (float)(*(float *)_D19.i32 * v117);
          float v76 = (float)((float)(v124 * _S22) + (float)(*(float *)_D20.i32 * v126)) + (float)(*(float *)_D21.i32 * v123);
          _S6 = (float)((float)(v121 * _S22) + (float)(*(float *)_D20.i32 * v122)) + (float)(*(float *)_D21.i32 * v120);
          *(float *)_D21.i32 = (float)((float)(v118 * _S22) + (float)(*(float *)_D20.i32 * v119))
                             + (float)(*(float *)_D21.i32 * v117);
          float v78 = (float)((float)(v124 * *(float *)_D5.i32) + (float)(_S24 * v126)) + (float)(*(float *)_D3.i32 * v123);
          float v79 = (float)((float)(v121 * *(float *)_D5.i32) + (float)(_S24 * v122)) + (float)(*(float *)_D3.i32 * v120);
          *(float *)_D3.i32 = (float)((float)(v118 * *(float *)_D5.i32) + (float)(_S24 * v119))
                            + (float)(*(float *)_D3.i32 * v117);
          _D5.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(_S7, 0.0), 8191.0)));
          __asm { FCVT            S19, H5 }
          _D5.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(_S16, 0.0), 8191.0)));
          __asm { FCVT            S18, H5 }
          _D5.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(v75, 0.0), 8191.0)));
          __asm { FCVT            S15, H5 }
          _D5.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(v76, 0.0), 8191.0)));
          __asm { FCVT            S20, H5 }
          _D5.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(_S6, 0.0), 8191.0)));
          LOWORD(_S6) = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(*(float *)_D21.i32, 0.0), 8191.0)));
          __asm
          {
            FCVT            S22, H5
            FCVT            S21, H6
          }
          _D5.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(v78, 0.0), 8191.0)));
          __asm { FCVT            S6, H5 }
          _D5.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(v79, 0.0), 8191.0)));
          __asm { FCVT            S24, H5 }
          _D3.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(*(float *)_D3.i32, 0.0), 8191.0)));
          __asm { FCVT            S5, H3 }
          _D3.i16[0] = *(_WORD *)(v26
                                + 2
                                * llroundf(fminf(fmaxf((float)((float)(v124 * *(float *)_D11.i32) + (float)(_S10 * v126))+ (float)(_S12 * v123), 0.0), 8191.0)));
          __asm { FCVT            S3, H3 }
          LOWORD(_S7) = *(_WORD *)(v26
                                 + 2
                                 * llroundf(fminf(fmaxf((float)((float)(v121 * *(float *)_D11.i32) + (float)(_S10 * v122))+ (float)(_S12 * v120), 0.0), 8191.0)));
          LOWORD(_S16) = *(_WORD *)(v26
                                  + 2
                                  * llroundf(fminf(fmaxf((float)((float)(v118 * *(float *)_D11.i32) + (float)(_S10 * v119))+ (float)(_S12 * v117), 0.0), 8191.0)));
          __asm
          {
            FCVT            S7, H7
            FCVT            S16, H16
          }
          float v92 = (float)((float)((float)(v133 * _S18) + (float)(v134 * _S19)) + (float)(v132 * _S15)) + v23;
          if (v92 < v23) {
            float v93 = v23;
          }
          else {
            float v93 = (float)((float)((float)(v133 * _S18) + (float)(v134 * _S19)) + (float)(v132 * _S15)) + v23;
          }
          BOOL v94 = v92 <= v24;
          float v95 = (float)((float)((float)(v133 * _S22) + (float)(v134 * _S20)) + (float)(v132 * _S21)) + v23;
          if (!v94) {
            float v93 = v24;
          }
          unsigned __int8 v96 = llroundf(v93);
          if (v95 < v23) {
            float v97 = v23;
          }
          else {
            float v97 = (float)((float)((float)(v133 * _S22) + (float)(v134 * _S20)) + (float)(v132 * _S21)) + v23;
          }
          BOOL v94 = v95 <= v24;
          float v98 = (float)((float)((float)(v133 * _S24) + (float)(v134 * _S6)) + (float)(v132 * _S5)) + v23;
          if (!v94) {
            float v97 = v24;
          }
          unsigned __int8 v99 = llroundf(v97);
          if (v98 < v23) {
            float v100 = v23;
          }
          else {
            float v100 = (float)((float)((float)(v133 * _S24) + (float)(v134 * _S6)) + (float)(v132 * _S5)) + v23;
          }
          BOOL v94 = v98 <= v24;
          float v101 = (float)((float)((float)(v133 * _S7) + (float)(v134 * _S3)) + (float)(v132 * _S16)) + v23;
          if (!v94) {
            float v100 = v24;
          }
          unsigned __int8 v102 = llroundf(v100);
          if (v101 < v23) {
            float v103 = v23;
          }
          else {
            float v103 = (float)((float)((float)(v133 * _S7) + (float)(v134 * _S3)) + (float)(v132 * _S16)) + v23;
          }
          if (v101 <= v24) {
            float v104 = v103;
          }
          else {
            float v104 = v24;
          }
          float v105 = (float)((float)(_S19 + _S20) + _S6) + _S3;
          float v106 = (float)((float)(_S18 + _S22) + _S24) + _S7;
          *double result = v96;
          result[1] = v99;
          unsigned __int8 *v41 = v102;
          v41[1] = llroundf(v104);
          float v107 = (float)((float)(_S15 + _S21) + _S5) + _S16;
          float v108 = (float)((float)(v136 + (float)(v105 * v131)) + (float)(v106 * v130)) + (float)(v107 * v129);
          float v109 = v135;
          if (v108 <= v135)
          {
            float v109 = (float)((float)(v136 + (float)(v105 * v131)) + (float)(v106 * v130)) + (float)(v107 * v129);
            if (v108 < v137) {
              float v109 = v137;
            }
          }
          float v110 = (float)((float)(v136 + (float)(v105 * v128)) + (float)(v106 * v127)) + (float)(v107 * v125);
          *(unsigned char *)(v34 + v39) = llroundf(v109);
          float v111 = v135;
          if (v110 <= v135)
          {
            float v111 = v110;
            if (v110 < v137) {
              float v111 = v137;
            }
          }
          *(unsigned char *)(v34 + v39 + 1) = llroundf(v111);
          if (v33)
          {
            unsigned char *v33 = v47;
            v33[1] = v48;
            v33 += 2;
            *uint64_t v40 = v49;
            v40[1] = v50;
            v40 += 2;
          }
          v31 += 2;
          v42 += 2;
          result += 2;
          v41 += 2;
          v39 += 2;
        }
        while (v14 > v39);
      }
      uint64_t v19 = v113;
      uint64_t v18 = v114;
      uint64_t v31 = (unsigned int *)&v38[v114];
      double result = &v37[v113];
      uint64_t v21 = v112;
      v34 += v20;
      uint64_t v33 = &v36[v112];
      v13 += 2;
    }
    while (v115 > v13);
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_420vf(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v11 = a2[3];
  uint64_t v12 = a2[5];
  uint64_t v13 = *a6;
  uint64_t v14 = a6[1];
  uint64_t v16 = a6[2];
  uint64_t v15 = a6[3];
  uint64_t v17 = a6[4];
  uint64_t v18 = a6[5];
  if (v18)
  {
    ++v18;
    ++v12;
    if (v15)
    {
      --v15;
      --v11;
    }
    else
    {
      v15 -= 2;
      v11 -= 2;
    }
  }
  uint64_t v19 = a2[2];
  uint64_t v20 = a2[4];
  if (v17)
  {
    ++v17;
    ++v20;
    if (v16)
    {
      --v16;
      --v19;
    }
    else
    {
      v16 -= 2;
      v19 -= 2;
    }
  }
  memset(v27, 0, 32);
  if (v20 + v19 <= v9) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v9 - v20;
  }
  memset(&v27[32], 0, 24);
  if (v17 + v16 > v13) {
    uint64_t v16 = v13 - v17;
  }
  size_t v22 = *(unsigned __int8 *)(a1 + 162);
  v27[0] = *(unsigned char *)(a1 + 162);
  if (v12 + v11 > v10) {
    uint64_t v11 = v10 - v12;
  }
  *(void *)&v27[4] = v9;
  *(void *)&v27[12] = v10;
  if (v18 + v15 <= v14) {
    uint64_t v23 = v15;
  }
  else {
    uint64_t v23 = v14 - v18;
  }
  if (v21 >= v16) {
    uint64_t v24 = v16;
  }
  else {
    uint64_t v24 = v21;
  }
  *(void *)&v27[20] = v24;
  if (v11 < v23) {
    uint64_t v23 = v11;
  }
  *(void *)&v27[28] = v23;
  *(void *)&v27[36] = v20;
  *(void *)&v27[44] = v12;
  uint64_t v31 = v13;
  uint64_t v32 = v14;
  uint64_t v33 = v24;
  uint64_t v34 = v23;
  uint64_t v35 = v17;
  uint64_t v36 = v18;
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v39 = a9;
  uint64_t v40 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v22, global_queue, v27, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_420vf_GCD);
  return 0;
}

uint64_t vt_Copy_l10r_rgb_420vf_GCD(uint64_t result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, float a8, float a9)
{
  uint64_t v9 = *(void *)(result + 28);
  unint64_t v10 = 2 * *(unsigned __int8 *)result;
  unint64_t v11 = v9 * a2 / v10;
  unint64_t v12 = (v9 + v9 * a2) / v10;
  if (2 * v12 != 2 * v11)
  {
    unint64_t v13 = 0;
    unint64_t v14 = *(void *)(result + 20);
    uint64_t v15 = *(void *)(result + 44) + 2 * v11;
    unint64_t v16 = 2 * v12 - 2 * v11;
    uint64_t v17 = *(void *)(result + 152);
    uint64_t v18 = *(uint64_t **)(result + 136);
    uint64_t v19 = **(void **)(result + 64);
    uint64_t v20 = *v18;
    uint64_t v21 = v18[1];
    uint64_t v22 = v18[2];
    *(float *)&unsigned int v23 = (float)*(unsigned int *)(v17 + 136);
    float v24 = *(float *)&v23 / (float)*(unsigned int *)(v17 + 128);
    LOWORD(v23) = *(_WORD *)(v17 + 140);
    float v25 = (float)v23;
    LOWORD(a5) = *(_WORD *)(v17 + 144);
    float v26 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v17 + 146);
    float v27 = (float)LODWORD(a6);
    LOWORD(a7) = *(_WORD *)(v17 + 148);
    float v28 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v17 + 150);
    float v29 = (float)LODWORD(a8);
    LOWORD(a9) = *(_WORD *)(v17 + 152);
    float v30 = (float)LODWORD(a9);
    float v31 = *(float *)(v17 + 36);
    float v32 = *(float *)(v17 + 40);
    float v33 = *(float *)(v17 + 44);
    float v92 = *(float *)(v17 + 48) * 0.25;
    float v34 = *(float *)(v17 + 52) * 0.25;
    float v35 = *(float *)(v17 + 56) * 0.25;
    float v36 = *(float *)(v17 + 60) * 0.25;
    float v37 = *(float *)(v17 + 64) * 0.25;
    float v38 = *(float *)(v17 + 68) * 0.25;
    uint64_t v39 = *(void *)(result + 112);
    uint64_t v40 = *(void **)(result + 128);
    uint64_t v41 = *(void *)(result + 120) + 2 * (*(void *)(result + 104) * a2 / v10);
    CMTimeValue v42 = (char *)(**(void **)(result + 56) + v19 * v15 + 4 * *(void *)(result + 36));
    uint64_t v43 = v40[1];
    unsigned int v44 = (unsigned char *)(*v40 + v41 * v20 + v39);
    uint64_t v45 = v40[2];
    unsigned int v46 = (unsigned char *)(v45 + v41 * v22 + v39);
    if (!v45) {
      unsigned int v46 = 0;
    }
    if (v41 >= 0) {
      uint64_t v47 = v41;
    }
    else {
      uint64_t v47 = v41 + 1;
    }
    uint64_t v48 = v43 + (v47 >> 1) * v21 + v39;
    double result = 85;
    do
    {
      int v49 = &v46[v22];
      int v50 = &v44[v20];
      v51 = &v42[v19];
      if (v14)
      {
        unint64_t v52 = 0;
        long long v53 = &v46[v22];
        v54 = &v44[v20];
        long long v55 = &v42[v19];
        do
        {
          unsigned int v57 = *(_DWORD *)v42;
          unsigned int v56 = *((_DWORD *)v42 + 1);
          unsigned int v59 = *(_DWORD *)v55;
          unsigned int v58 = *((_DWORD *)v55 + 1);
          if (v46)
          {
            int v60 = 85 * (v57 >> 30);
            int v61 = 85 * (v56 >> 30);
            int v62 = 85 * (v59 >> 30);
            int v63 = 85 * (v58 >> 30);
          }
          else
          {
            LOBYTE(v62) = 0;
            LOBYTE(v60) = 0;
            LOBYTE(v61) = 0;
            LOBYTE(v63) = 0;
          }
          float v64 = v24 * (float)((float)(*(_DWORD *)v42 & 0x3FF) - v25);
          float v65 = v24 * (float)((float)((v57 >> 10) & 0x3FF) - v25);
          float v66 = v24 * (float)((float)((v57 >> 20) & 0x3FF) - v25);
          float v67 = v24 * (float)((float)(*((_DWORD *)v42 + 1) & 0x3FF) - v25);
          float v68 = v24 * (float)((float)((v56 >> 10) & 0x3FF) - v25);
          float v69 = v24 * (float)((float)((v56 >> 20) & 0x3FF) - v25);
          float v70 = v24 * (float)((float)(*(_DWORD *)v55 & 0x3FF) - v25);
          float v71 = v24 * (float)((float)((v59 >> 10) & 0x3FF) - v25);
          float v72 = v24 * (float)((float)((v59 >> 20) & 0x3FF) - v25);
          float v73 = v24 * (float)((float)(*((_DWORD *)v55 + 1) & 0x3FF) - v25);
          float v74 = v24 * (float)((float)((v58 >> 10) & 0x3FF) - v25);
          float v75 = v24 * (float)((float)((v58 >> 20) & 0x3FF) - v25);
          float v76 = (float)((float)((float)(v32 * v65) + (float)(v31 * v66)) + (float)(v33 * v64)) + v26;
          float v77 = (float)((float)((float)(v32 * v68) + (float)(v31 * v69)) + (float)(v33 * v67)) + v26;
          float v78 = (float)((float)((float)(v32 * v71) + (float)(v31 * v72)) + (float)(v33 * v70)) + v26;
          float v79 = (float)((float)((float)(v32 * v74) + (float)(v31 * v75)) + (float)(v33 * v73)) + v26;
          if (v76 < v26) {
            float v80 = v26;
          }
          else {
            float v80 = (float)((float)((float)(v32 * v65) + (float)(v31 * v66)) + (float)(v33 * v64)) + v26;
          }
          if (v76 > v28) {
            float v80 = v28;
          }
          char v81 = llroundf(v80);
          if (v77 < v26) {
            float v82 = v26;
          }
          else {
            float v82 = (float)((float)((float)(v32 * v68) + (float)(v31 * v69)) + (float)(v33 * v67)) + v26;
          }
          if (v77 > v28) {
            float v82 = v28;
          }
          *unsigned int v44 = v81;
          v44[1] = llroundf(v82);
          if (v78 < v26) {
            float v83 = v26;
          }
          else {
            float v83 = (float)((float)((float)(v32 * v71) + (float)(v31 * v72)) + (float)(v33 * v70)) + v26;
          }
          if (v78 > v28) {
            float v83 = v28;
          }
          unsigned char *v54 = llroundf(v83);
          if (v79 < v26) {
            float v84 = v26;
          }
          else {
            float v84 = (float)((float)((float)(v32 * v74) + (float)(v31 * v75)) + (float)(v33 * v73)) + v26;
          }
          if (v79 > v28) {
            float v84 = v28;
          }
          v54[1] = llroundf(v84);
          float v85 = (float)((float)(v66 + v69) + v72) + v75;
          float v86 = (float)((float)(v65 + v68) + v71) + v74;
          float v87 = (float)((float)(v64 + v67) + v70) + v73;
          float v88 = (float)((float)(v27 + (float)(v85 * v92)) + (float)(v86 * v34)) + (float)(v87 * v35);
          float v89 = v30;
          if (v88 <= v30)
          {
            float v89 = (float)((float)(v27 + (float)(v85 * v92)) + (float)(v86 * v34)) + (float)(v87 * v35);
            if (v88 < v29) {
              float v89 = v29;
            }
          }
          float v90 = (float)((float)(v27 + (float)(v85 * v36)) + (float)(v86 * v37)) + (float)(v87 * v38);
          *(unsigned char *)(v48 + v52) = llroundf(v89);
          float v91 = v30;
          if (v90 <= v30)
          {
            float v91 = v90;
            if (v90 < v29) {
              float v91 = v29;
            }
          }
          *(unsigned char *)(v48 + v52 + 1) = llroundf(v91);
          if (v46)
          {
            *unsigned int v46 = v60;
            v46[1] = v61;
            v46 += 2;
            *long long v53 = v62;
            v53[1] = v63;
            v53 += 2;
          }
          v42 += 8;
          v55 += 8;
          v44 += 2;
          v54 += 2;
          v52 += 2;
        }
        while (v14 > v52);
      }
      CMTimeValue v42 = &v51[v19];
      unsigned int v44 = &v50[v20];
      v48 += v21;
      unsigned int v46 = &v49[v22];
      v13 += 2;
    }
    while (v16 > v13);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_xf420(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v11 = a2[3];
  uint64_t v12 = a2[5];
  uint64_t v13 = *a6;
  uint64_t v14 = a6[1];
  uint64_t v16 = a6[2];
  uint64_t v15 = a6[3];
  uint64_t v17 = a6[4];
  uint64_t v18 = a6[5];
  if (v18)
  {
    ++v18;
    ++v12;
    if (v15)
    {
      --v15;
      --v11;
    }
    else
    {
      v15 -= 2;
      v11 -= 2;
    }
  }
  uint64_t v19 = a2[2];
  uint64_t v20 = a2[4];
  if (v17)
  {
    ++v17;
    ++v20;
    if (v16)
    {
      --v16;
      --v19;
    }
    else
    {
      v16 -= 2;
      v19 -= 2;
    }
  }
  memset(v27, 0, 32);
  if (v20 + v19 <= v9) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v9 - v20;
  }
  memset(&v27[32], 0, 24);
  if (v17 + v16 > v13) {
    uint64_t v16 = v13 - v17;
  }
  size_t v22 = *(unsigned __int8 *)(a1 + 162);
  v27[0] = *(unsigned char *)(a1 + 162);
  if (v12 + v11 > v10) {
    uint64_t v11 = v10 - v12;
  }
  *(void *)&v27[4] = v9;
  *(void *)&v27[12] = v10;
  if (v18 + v15 <= v14) {
    uint64_t v23 = v15;
  }
  else {
    uint64_t v23 = v14 - v18;
  }
  if (v21 >= v16) {
    uint64_t v24 = v16;
  }
  else {
    uint64_t v24 = v21;
  }
  *(void *)&v27[20] = v24;
  if (v11 < v23) {
    uint64_t v23 = v11;
  }
  *(void *)&v27[28] = v23;
  *(void *)&v27[36] = v20;
  *(void *)&v27[44] = v12;
  uint64_t v31 = v13;
  uint64_t v32 = v14;
  uint64_t v33 = v24;
  uint64_t v34 = v23;
  uint64_t v35 = v17;
  uint64_t v36 = v18;
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v39 = a9;
  uint64_t v40 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v22, global_queue, v27, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_xf420_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_xf420_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, float a6)
{
  uint64_t v6 = *(void *)(result + 28);
  unint64_t v7 = 2 * *result;
  unint64_t v8 = v6 * a2 / v7;
  unint64_t v9 = (v6 + v6 * a2) / v7;
  if (2 * v9 != 2 * v8)
  {
    unint64_t v10 = 0;
    unint64_t v11 = *(void *)(result + 20);
    uint64_t v12 = *(void *)(result + 44) + 2 * v8;
    unint64_t v13 = 2 * v9 - 2 * v8;
    uint64_t v14 = *((void *)result + 19);
    uint64_t v15 = (uint64_t *)*((void *)result + 17);
    uint64_t v16 = **((void **)result + 8);
    uint64_t v17 = *v15;
    uint64_t v18 = v15[1];
    *(float *)&unsigned int v19 = (float)*(unsigned int *)(v14 + 128);
    float v20 = 8191.0 / *(float *)&v19;
    LOWORD(v19) = *(_WORD *)(v14 + 140);
    *(float *)&a3 = (float)v19;
    LOWORD(a5) = *(_WORD *)(v14 + 144);
    float v21 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v14 + 146);
    float v22 = (float)LODWORD(a6);
    LOWORD(a6) = *(_WORD *)(v14 + 148);
    float v23 = (float)LODWORD(a6);
    LOWORD(a6) = *(_WORD *)(v14 + 150);
    float v24 = (float)LODWORD(a6);
    float v179 = v24;
    LOWORD(v24) = *(_WORD *)(v14 + 152);
    float v175 = *(float *)(v14 + 40);
    float v176 = *(float *)(v14 + 36);
    float v173 = *(float *)(v14 + 48) * 0.25;
    float v174 = *(float *)(v14 + 44);
    float v171 = *(float *)(v14 + 56) * 0.25;
    float v172 = *(float *)(v14 + 52) * 0.25;
    float v169 = *(float *)(v14 + 64) * 0.25;
    float v170 = *(float *)(v14 + 60) * 0.25;
    float v167 = *(float *)(v14 + 68) * 0.25;
    float v168 = *(float *)(v14 + 72);
    float v165 = *(float *)(v14 + 80);
    float v166 = *(float *)(v14 + 76);
    float v163 = *(float *)(v14 + 88);
    float v164 = *(float *)(v14 + 84);
    float v161 = *(float *)(v14 + 96);
    float v162 = *(float *)(v14 + 92);
    float v25 = *(float *)(v14 + 108);
    float v159 = *(float *)(v14 + 104);
    float v160 = *(float *)(v14 + 100);
    uint64_t v26 = v14 + 164;
    uint64_t v27 = v14 + 16548;
    uint64_t v28 = v14 + 32932;
    float v29 = *(float *)(v14 + 112);
    float v30 = *(float *)(v14 + 116);
    float v31 = *(float *)(v14 + 120);
    uint64_t v32 = *((void *)result + 14);
    unint64_t v33 = *((void *)result + 13) * a2 / v7;
    uint64_t v34 = (uint64_t *)*((void *)result + 16);
    uint64_t v35 = *((void *)result + 15) + 2 * v33;
    uint64_t v36 = (unsigned int *)(**((void **)result + 7) + v16 * v12 + 4 * *(void *)(result + 36));
    uint64_t v37 = *v34;
    uint64_t v38 = v34[1];
    double result = (unsigned __int8 *)(v37 + v35 * v17 + 2 * v32);
    unsigned int v39 = *(unsigned __int8 *)(v14 + 132);
    if (v39 >= 0x11) {
      char v40 = 0;
    }
    else {
      char v40 = 16 - v39;
    }
    if (v35 >= 0) {
      uint64_t v41 = v35;
    }
    else {
      uint64_t v41 = v35 + 1;
    }
    uint64_t v42 = v38 + (v41 >> 1) * v18 + 2 * v32;
    float32x2_t v43 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a3, 0);
    float v177 = (float)LODWORD(v24);
    float v178 = v22;
    float v157 = v29;
    float v158 = v25;
    float v155 = v31;
    float v156 = v30;
    do
    {
      unsigned int v44 = &result[v17];
      uint64_t v45 = (char *)v36 + v16;
      if (v11)
      {
        unint64_t v46 = 0;
        uint64_t v47 = &result[v17];
        uint64_t v48 = (unsigned int *)((char *)v36 + v16);
        do
        {
          unsigned int v49 = v36[1];
          float32x2_t v50 = (float32x2_t)vdup_n_s32(0x45FFF800u);
          _D0 = (int8x8_t)vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v36), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v43), v20), 0), v50)));
          _D0.i16[0] = *(_WORD *)(v26 + 2 * _D0.u32[0]);
          __asm { FCVT            S19, H0 }
          _D0.i16[0] = *(_WORD *)(v26 + 2 * _D0.u32[1]);
          __asm { FCVT            S20, H0 }
          _D0.i32[0] = *v36;
          _D0.i32[1] = v49 >> 20;
          int32x2_t v58 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D0, (int8x8_t)0x300000003)), v43), v20), 0), v50)));
          _H3 = *(_WORD *)(v26 + 2 * v58.u32[0]);
          __asm { FCVT            S22, H3 }
          float v61 = fmaxf(_S19, fmaxf(_S20, _S22));
          float v62 = (float)((float)((float)(v29 * _S20) + (float)(v25 * _S19)) + (float)(v30 * _S22)) + (float)(v31 * v61);
          float v63 = 8191.0;
          if (v62 <= 8191.0)
          {
            float v63 = (float)((float)((float)(v29 * _S20) + (float)(v25 * _S19)) + (float)(v30 * _S22)) + (float)(v31 * v61);
            if (v62 < 0.0) {
              float v63 = 0.0;
            }
          }
          _H0 = *(_WORD *)(v26 + 2 * v58.u32[1]);
          __asm { FCVT            S5, H0 }
          v66.i32[0] = v49 >> 10;
          v66.i32[1] = v36[1];
          _D0 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v66, (int8x8_t)0x300000003)), v43), v20), 0), v50)));
          _D0.i16[0] = *(_WORD *)(v26 + 2 * _D0.u32[0]);
          __asm { FCVT            S3, H0 }
          _D0.i16[0] = *(_WORD *)(v26 + 2 * _D0.u32[1]);
          __asm { FCVT            S14, H0 }
          float v70 = fmaxf(_S5, fmaxf(_S3, _S14));
          float v71 = (float)((float)((float)(v29 * _S3) + (float)(v25 * _S5)) + (float)(v30 * _S14)) + (float)(v31 * v70);
          float v72 = 8191.0;
          if (v71 <= 8191.0)
          {
            float v72 = (float)((float)((float)(v29 * _S3) + (float)(v25 * _S5)) + (float)(v30 * _S14)) + (float)(v31 * v70);
            if (v71 < 0.0) {
              float v72 = 0.0;
            }
          }
          unsigned int v73 = v48[1];
          _D0 = (int8x8_t)vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v48), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v43), v20), 0), v50)));
          _D0.i16[0] = *(_WORD *)(v26 + 2 * _D0.u32[0]);
          __asm { FCVT            S15, H0 }
          _D0.i16[0] = *(_WORD *)(v26 + 2 * _D0.u32[1]);
          __asm { FCVT            S16, H0 }
          _D0.i32[0] = *v48;
          _D0.i32[1] = v73 >> 20;
          int32x2_t v77 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D0, (int8x8_t)0x300000003)), v43), v20), 0), v50)));
          _D0.i16[0] = *(_WORD *)(v26 + 2 * v77.u32[0]);
          __asm { FCVT            S17, H0 }
          float v79 = (float)((float)((float)(v29 * _S16) + (float)(v25 * _S15)) + (float)(v30 * _S17))
              + (float)(v31 * fmaxf(_S15, fmaxf(_S16, _S17)));
          float v80 = 8191.0;
          if (v79 <= 8191.0)
          {
            float v80 = v79;
            if (v79 < 0.0) {
              float v80 = 0.0;
            }
          }
          _H6 = *(_WORD *)(v26 + 2 * v77.u32[1]);
          __asm { FCVT            S6, H6 }
          v83.i32[0] = v73 >> 10;
          v83.i32[1] = v48[1];
          _D21 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v83, (int8x8_t)0x300000003)), v43), v20), 0), v50)));
          _D21.i16[0] = *(_WORD *)(v26 + 2 * _D21.u32[0]);
          __asm { FCVT            S26, H21 }
          _D21.i16[0] = *(_WORD *)(v26 + 2 * _D21.u32[1]);
          __asm { FCVT            S27, H21 }
          _D21.i16[0] = *(_WORD *)(v27 + 2 * llroundf(v63));
          __asm { FCVT            S21, H21 }
          float v87 = _S19 * *(float *)_D21.i32;
          float v88 = _S20 * *(float *)_D21.i32;
          float v89 = _S22 * *(float *)_D21.i32;
          _H7 = *(_WORD *)(v27 + 2 * llroundf(v72));
          __asm { FCVT            S7, H7 }
          float v92 = _S5 * _S7;
          float v93 = _S3 * _S7;
          float v94 = _S14 * _S7;
          _H0 = *(_WORD *)(v27 + 2 * llroundf(v80));
          __asm { FCVT            S0, H0 }
          float v97 = _S15 * _S0;
          float v98 = _S16 * _S0;
          float v99 = _S17 * _S0;
          float v100 = (float)((float)((float)(v29 * _S26) + (float)(v25 * _S6)) + (float)(v30 * _S27))
               + (float)(v31 * fmaxf(_S6, fmaxf(_S26, _S27)));
          float v101 = 8191.0;
          if (v100 <= 8191.0)
          {
            float v101 = v100;
            if (v100 < 0.0) {
              float v101 = 0.0;
            }
          }
          _H0 = *(_WORD *)(v27 + 2 * llroundf(v101));
          __asm { FCVT            S0, H0 }
          _S6 = _S6 * _S0;
          _S16 = _S26 * _S0;
          float v106 = _S27 * _S0;
          _S17 = (float)((float)(v166 * v88) + (float)(v87 * v168)) + (float)(v89 * v165);
          float v108 = (float)((float)(v163 * v88) + (float)(v87 * v164)) + (float)(v89 * v162);
          float v109 = (float)((float)(v160 * v88) + (float)(v87 * v161)) + (float)(v89 * v159);
          float v110 = (float)((float)(v166 * v93) + (float)(v92 * v168)) + (float)(v94 * v165);
          float v111 = (float)((float)(v163 * v93) + (float)(v92 * v164)) + (float)(v94 * v162);
          float v112 = (float)((float)(v160 * v93) + (float)(v92 * v161)) + (float)(v94 * v159);
          float v113 = (float)((float)(v166 * v98) + (float)(v97 * v168)) + (float)(v99 * v165);
          float v114 = (float)((float)(v163 * v98) + (float)(v97 * v164)) + (float)(v99 * v162);
          float v115 = (float)((float)(v160 * v98) + (float)(v97 * v161)) + (float)(v99 * v159);
          float v116 = (float)((float)(v166 * _S16) + (float)(_S6 * v168)) + (float)(v106 * v165);
          float v117 = (float)((float)(v163 * _S16) + (float)(_S6 * v164)) + (float)(v106 * v162);
          _S0 = (float)((float)(v160 * _S16) + (float)(_S6 * v161)) + (float)(v106 * v159);
          _H3 = *(_WORD *)(v28 + 2 * llroundf(fminf(fmaxf(_S17, 0.0), 8191.0)));
          __asm { FCVT            S3, H3 }
          _H5 = *(_WORD *)(v28 + 2 * llroundf(fminf(fmaxf(v108, 0.0), 8191.0)));
          __asm { FCVT            S5, H5 }
          LOWORD(_S6) = *(_WORD *)(v28 + 2 * llroundf(fminf(fmaxf(v109, 0.0), 8191.0)));
          LOWORD(_S16) = *(_WORD *)(v28 + 2 * llroundf(fminf(fmaxf(v110, 0.0), 8191.0)));
          __asm
          {
            FCVT            S7, H6
            FCVT            S19, H16
          }
          LOWORD(_S6) = *(_WORD *)(v28 + 2 * llroundf(fminf(fmaxf(v111, 0.0), 8191.0)));
          __asm { FCVT            S21, H6 }
          LOWORD(_S6) = *(_WORD *)(v28 + 2 * llroundf(fminf(fmaxf(v112, 0.0), 8191.0)));
          __asm { FCVT            S20, H6 }
          LOWORD(_S6) = *(_WORD *)(v28 + 2 * llroundf(fminf(fmaxf(v113, 0.0), 8191.0)));
          __asm { FCVT            S16, H6 }
          LOWORD(_S6) = *(_WORD *)(v28 + 2 * llroundf(fminf(fmaxf(v114, 0.0), 8191.0)));
          __asm { FCVT            S22, H6 }
          LOWORD(_S6) = *(_WORD *)(v28 + 2 * llroundf(fminf(fmaxf(v115, 0.0), 8191.0)));
          LOWORD(_S17) = *(_WORD *)(v28 + 2 * llroundf(fminf(fmaxf(v116, 0.0), 8191.0)));
          __asm
          {
            FCVT            S24, H6
            FCVT            S6, H17
          }
          LOWORD(_S17) = *(_WORD *)(v28 + 2 * llroundf(fminf(fmaxf(v117, 0.0), 8191.0)));
          __asm { FCVT            S17, H17 }
          LOWORD(_S0) = *(_WORD *)(v28 + 2 * llroundf(fminf(fmaxf(_S0, 0.0), 8191.0)));
          __asm { FCVT            S23, H0 }
          float v133 = (float)((float)((float)(v175 * _S5) + (float)(v176 * _S3)) + (float)(v174 * _S7)) + v21;
          if (v133 < v21) {
            float v134 = v21;
          }
          else {
            float v134 = (float)((float)((float)(v175 * _S5) + (float)(v176 * _S3)) + (float)(v174 * _S7)) + v21;
          }
          BOOL v135 = v133 <= v23;
          float v136 = (float)((float)((float)(v175 * _S21) + (float)(v176 * _S19)) + (float)(v174 * _S20)) + v21;
          if (!v135) {
            float v134 = v23;
          }
          unsigned int v137 = llroundf(v134);
          if (v136 < v21) {
            float v138 = v21;
          }
          else {
            float v138 = (float)((float)((float)(v175 * _S21) + (float)(v176 * _S19)) + (float)(v174 * _S20)) + v21;
          }
          BOOL v135 = v136 <= v23;
          float v139 = (float)((float)((float)(v175 * _S22) + (float)(v176 * _S16)) + (float)(v174 * _S24)) + v21;
          if (!v135) {
            float v138 = v23;
          }
          unsigned int v140 = llroundf(v138);
          if (v139 < v21) {
            float v141 = v21;
          }
          else {
            float v141 = (float)((float)((float)(v175 * _S22) + (float)(v176 * _S16)) + (float)(v174 * _S24)) + v21;
          }
          BOOL v135 = v139 <= v23;
          float v142 = (float)((float)((float)(v175 * _S17) + (float)(v176 * _S6)) + (float)(v174 * _S23)) + v21;
          if (!v135) {
            float v141 = v23;
          }
          unsigned int v143 = llroundf(v141);
          if (v142 < v21) {
            float v144 = v21;
          }
          else {
            float v144 = (float)((float)((float)(v175 * _S17) + (float)(v176 * _S6)) + (float)(v174 * _S23)) + v21;
          }
          if (v142 <= v23) {
            float v145 = v144;
          }
          else {
            float v145 = v23;
          }
          unsigned int v146 = llroundf(v145);
          float v147 = (float)((float)(_S3 + _S19) + _S16) + _S6;
          float v148 = (float)((float)(_S5 + _S21) + _S22) + _S17;
          *(_WORD *)double result = v137 << v40;
          *((_WORD *)result + 1) = v140 << v40;
          *(_WORD *)uint64_t v47 = v143 << v40;
          *((_WORD *)v47 + 1) = v146 << v40;
          float v149 = (float)((float)(_S7 + _S20) + _S24) + _S23;
          float v150 = (float)((float)(v178 + (float)(v147 * v173)) + (float)(v148 * v172)) + (float)(v149 * v171);
          float v151 = v177;
          if (v150 <= v177)
          {
            float v151 = (float)((float)(v178 + (float)(v147 * v173)) + (float)(v148 * v172)) + (float)(v149 * v171);
            if (v150 < v179) {
              float v151 = v179;
            }
          }
          float v152 = (_WORD *)(v42 + 2 * v46);
          float v153 = (float)((float)(v178 + (float)(v147 * v170)) + (float)(v148 * v169)) + (float)(v149 * v167);
          *float v152 = llroundf(v151) << v40;
          float v154 = v177;
          if (v153 <= v177)
          {
            float v154 = v153;
            if (v153 < v179) {
              float v154 = v179;
            }
          }
          v36 += 2;
          v48 += 2;
          result += 4;
          v47 += 4;
          v152[1] = llroundf(v154) << v40;
          v46 += 2;
          float v29 = v157;
          float v25 = v158;
          float v31 = v155;
          float v30 = v156;
        }
        while (v11 > v46);
      }
      uint64_t v36 = (unsigned int *)&v45[v16];
      double result = &v44[v17];
      v42 += v18;
      v10 += 2;
    }
    while (v13 > v10);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_xf420(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v11 = a2[3];
  uint64_t v12 = a2[5];
  uint64_t v13 = *a6;
  uint64_t v14 = a6[1];
  uint64_t v16 = a6[2];
  uint64_t v15 = a6[3];
  uint64_t v17 = a6[4];
  uint64_t v18 = a6[5];
  if (v18)
  {
    ++v18;
    ++v12;
    if (v15)
    {
      --v15;
      --v11;
    }
    else
    {
      v15 -= 2;
      v11 -= 2;
    }
  }
  uint64_t v19 = a2[2];
  uint64_t v20 = a2[4];
  if (v17)
  {
    ++v17;
    ++v20;
    if (v16)
    {
      --v16;
      --v19;
    }
    else
    {
      v16 -= 2;
      v19 -= 2;
    }
  }
  memset(v27, 0, 32);
  if (v20 + v19 <= v9) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v9 - v20;
  }
  memset(&v27[32], 0, 24);
  if (v17 + v16 > v13) {
    uint64_t v16 = v13 - v17;
  }
  size_t v22 = *(unsigned __int8 *)(a1 + 162);
  v27[0] = *(unsigned char *)(a1 + 162);
  if (v12 + v11 > v10) {
    uint64_t v11 = v10 - v12;
  }
  *(void *)&v27[4] = v9;
  *(void *)&v27[12] = v10;
  if (v18 + v15 <= v14) {
    uint64_t v23 = v15;
  }
  else {
    uint64_t v23 = v14 - v18;
  }
  if (v21 >= v16) {
    uint64_t v24 = v16;
  }
  else {
    uint64_t v24 = v21;
  }
  *(void *)&v27[20] = v24;
  if (v11 < v23) {
    uint64_t v23 = v11;
  }
  *(void *)&v27[28] = v23;
  *(void *)&v27[36] = v20;
  *(void *)&v27[44] = v12;
  uint64_t v31 = v13;
  uint64_t v32 = v14;
  uint64_t v33 = v24;
  uint64_t v34 = v23;
  uint64_t v35 = v17;
  uint64_t v36 = v18;
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v39 = a9;
  uint64_t v40 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v22, global_queue, v27, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_xf420_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Mat_TRC_xf420_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, double a6, float a7, float a8)
{
  uint64_t v8 = *(void *)(result + 28);
  unint64_t v9 = 2 * *result;
  unint64_t v10 = v8 * a2 / v9;
  unint64_t v11 = (v8 + v8 * a2) / v9;
  if (2 * v11 != 2 * v10)
  {
    unint64_t v12 = 0;
    unint64_t v13 = *(void *)(result + 20);
    uint64_t v14 = *(void *)(result + 44) + 2 * v10;
    unint64_t v15 = 2 * v11 - 2 * v10;
    uint64_t v16 = *((void *)result + 19);
    uint64_t v17 = (uint64_t *)*((void *)result + 17);
    uint64_t v18 = **((void **)result + 8);
    uint64_t v19 = *v17;
    uint64_t v20 = v17[1];
    float v110 = 8191.0 / (float)*(unsigned int *)(v16 + 128);
    LOWORD(a5) = *(_WORD *)(v16 + 140);
    *(float *)&a6 = (float)LODWORD(a5);
    LOWORD(a5) = *(_WORD *)(v16 + 144);
    float v21 = (float)LODWORD(a5);
    LOWORD(a7) = *(_WORD *)(v16 + 146);
    float v22 = (float)LODWORD(a7);
    LOWORD(a7) = *(_WORD *)(v16 + 148);
    float v23 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v16 + 150);
    float v24 = (float)LODWORD(a8);
    LOWORD(a8) = *(_WORD *)(v16 + 152);
    float v130 = (float)LODWORD(a8);
    float v128 = *(float *)(v16 + 36);
    float v129 = v24;
    float v126 = *(float *)(v16 + 44);
    float v127 = *(float *)(v16 + 40);
    float v124 = *(float *)(v16 + 52) * 0.25;
    float v125 = *(float *)(v16 + 48) * 0.25;
    float v122 = *(float *)(v16 + 60) * 0.25;
    float v123 = *(float *)(v16 + 56) * 0.25;
    float v120 = *(float *)(v16 + 72);
    float v121 = *(float *)(v16 + 64) * 0.25;
    float v118 = *(float *)(v16 + 76);
    float v119 = *(float *)(v16 + 68) * 0.25;
    float v116 = *(float *)(v16 + 84);
    float v117 = *(float *)(v16 + 80);
    float v114 = *(float *)(v16 + 92);
    float v115 = *(float *)(v16 + 88);
    float v112 = *(float *)(v16 + 100);
    float v113 = *(float *)(v16 + 96);
    float v111 = *(float *)(v16 + 104);
    uint64_t v25 = v16 + 164;
    uint64_t v26 = v16 + 16548;
    uint64_t v27 = *((void *)result + 14);
    unint64_t v28 = *((void *)result + 13) * a2 / v9;
    uint64_t v29 = (void *)*((void *)result + 16);
    uint64_t v30 = *((void *)result + 15) + 2 * v28;
    uint64_t v31 = (unsigned int *)(**((void **)result + 7) + v18 * v14 + 4 * *(void *)(result + 36));
    uint64_t v32 = v29[1];
    uint64_t v33 = (char *)(*v29 + v30 * v19 + 2 * v27);
    unsigned int v34 = *(unsigned __int8 *)(v16 + 132);
    if (v34 >= 0x11) {
      char v35 = 0;
    }
    else {
      char v35 = 16 - v34;
    }
    if (v30 >= 0) {
      uint64_t v36 = v30;
    }
    else {
      uint64_t v36 = v30 + 1;
    }
    double result = (unsigned __int8 *)(v32 + (v36 >> 1) * v20 + 2 * v27);
    float32x2_t v37 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a6, 0);
    float32x2_t v38 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      uint64_t v39 = &v33[v19];
      uint64_t v40 = (char *)v31 + v18;
      if (v13)
      {
        unint64_t v41 = 0;
        uint64_t v42 = (unsigned int *)((char *)v31 + v18);
        float32x2_t v43 = &v33[v19];
        do
        {
          unsigned __int32 v44 = v31[1];
          unsigned __int32 v45 = v42[1];
          _D3 = (int8x8_t)vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v31), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v37), v110), 0), v38)));
          _D3.i16[0] = *(_WORD *)(v25 + 2 * _D3.u32[0]);
          __asm { FCVT            S15, H3 }
          _D3.i16[0] = *(_WORD *)(v25 + 2 * _D3.u32[1]);
          v52.i32[0] = *v31;
          v52.i32[1] = v44 >> 20;
          _D5 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v52, (int8x8_t)0x300000003)), v37), v110), 0), v38)));
          __asm { FCVT            S19, H3 }
          _D3.i16[0] = *(_WORD *)(v25 + 2 * _D5.u32[0]);
          _D5.i16[0] = *(_WORD *)(v25 + 2 * _D5.u32[1]);
          __asm
          {
            FCVT            S20, H3
            FCVT            S18, H5
          }
          _D3.i32[0] = v44 >> 10;
          _D3.i32[1] = v44;
          _D3 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D3, (int8x8_t)0x300000003)), v37), v110), 0), v38)));
          _D3.i16[0] = *(_WORD *)(v25 + 2 * _D3.u32[0]);
          __asm { FCVT            S22, H3 }
          _D3.i16[0] = *(_WORD *)(v25 + 2 * _D3.u32[1]);
          __asm { FCVT            S21, H3 }
          _D3 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v42), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v37), v110), 0), v38)));
          _D3.i16[0] = *(_WORD *)(v25 + 2 * _D3.u32[0]);
          __asm { FCVT            S3, H3 }
          _D5.i16[0] = *(_WORD *)(v25 + 2 * _D3.u32[1]);
          v61.i32[0] = *v42;
          v61.i32[1] = v45 >> 20;
          _D24 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v61, (int8x8_t)0x300000003)), v37), v110), 0), v38)));
          __asm { FCVT            S5, H5 }
          _D24.i16[0] = *(_WORD *)(v25 + 2 * _D24.u32[0]);
          _H10 = *(_WORD *)(v25 + 2 * _D24.u32[1]);
          __asm
          {
            FCVT            S24, H24
            FCVT            S10, H10
          }
          v65.i32[0] = v45 >> 10;
          v65.i32[1] = v45;
          _D11 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v65, (int8x8_t)0x300000003)), v37), v110), 0), v38)));
          _D11.i16[0] = *(_WORD *)(v25 + 2 * _D11.u32[0]);
          __asm { FCVT            S11, H11 }
          _H12 = *(_WORD *)(v25 + 2 * _D11.u32[1]);
          __asm { FCVT            S12, H12 }
          _S7 = (float)((float)(v118 * _S19) + (float)(_S15 * v120)) + (float)(_S20 * v117);
          _S16 = (float)((float)(v115 * _S19) + (float)(_S15 * v116)) + (float)(_S20 * v114);
          float v71 = (float)((float)(v112 * _S19) + (float)(_S15 * v113)) + (float)(_S20 * v111);
          float v72 = (float)((float)(v118 * _S22) + (float)(_S18 * v120)) + (float)(_S21 * v117);
          float v73 = (float)((float)(v115 * _S22) + (float)(_S18 * v116)) + (float)(_S21 * v114);
          float v74 = (float)((float)(v112 * _S22) + (float)(_S18 * v113)) + (float)(_S21 * v111);
          _S6 = (float)((float)(v118 * *(float *)_D5.i32) + (float)(*(float *)_D3.i32 * v120))
              + (float)(*(float *)_D24.i32 * v117);
          float v76 = (float)((float)(v115 * *(float *)_D5.i32) + (float)(*(float *)_D3.i32 * v116))
              + (float)(*(float *)_D24.i32 * v114);
          *(float *)_D3.i32 = (float)((float)(v112 * *(float *)_D5.i32) + (float)(*(float *)_D3.i32 * v113))
                            + (float)(*(float *)_D24.i32 * v111);
          _D5.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(_S7, 0.0), 8191.0)));
          __asm { FCVT            S15, H5 }
          _D5.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(_S16, 0.0), 8191.0)));
          __asm { FCVT            S18, H5 }
          _D5.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(v71, 0.0), 8191.0)));
          LOWORD(_S7) = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(v72, 0.0), 8191.0)));
          __asm
          {
            FCVT            S19, H5
            FCVT            S20, H7
          }
          _D5.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(v73, 0.0), 8191.0)));
          __asm { FCVT            S22, H5 }
          _D5.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(v74, 0.0), 8191.0)));
          __asm { FCVT            S21, H5 }
          _D5.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(_S6, 0.0), 8191.0)));
          __asm { FCVT            S24, H5 }
          _D5.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(v76, 0.0), 8191.0)));
          __asm { FCVT            S5, H5 }
          _D3.i16[0] = *(_WORD *)(v26 + 2 * llroundf(fminf(fmaxf(*(float *)_D3.i32, 0.0), 8191.0)));
          LOWORD(_S6) = *(_WORD *)(v26
                                 + 2
                                 * llroundf(fminf(fmaxf((float)((float)(v118 * *(float *)_D11.i32) + (float)(_S10 * v120))+ (float)(_S12 * v117), 0.0), 8191.0)));
          __asm
          {
            FCVT            S3, H3
            FCVT            S6, H6
          }
          LOWORD(_S7) = *(_WORD *)(v26
                                 + 2
                                 * llroundf(fminf(fmaxf((float)((float)(v115 * *(float *)_D11.i32) + (float)(_S10 * v116))+ (float)(_S12 * v114), 0.0), 8191.0)));
          __asm { FCVT            S7, H7 }
          LOWORD(_S16) = *(_WORD *)(v26
                                  + 2
                                  * llroundf(fminf(fmaxf((float)((float)(v112 * *(float *)_D11.i32) + (float)(_S10 * v113))+ (float)(_S12 * v111), 0.0), 8191.0)));
          __asm { FCVT            S16, H16 }
          float v89 = (float)((float)((float)(v127 * _S18) + (float)(v128 * _S15)) + (float)(v126 * _S19)) + v21;
          if (v89 < v21) {
            float v90 = v21;
          }
          else {
            float v90 = (float)((float)((float)(v127 * _S18) + (float)(v128 * _S15)) + (float)(v126 * _S19)) + v21;
          }
          BOOL v91 = v89 <= v23;
          float v92 = (float)((float)((float)(v127 * _S22) + (float)(v128 * _S20)) + (float)(v126 * _S21)) + v21;
          if (!v91) {
            float v90 = v23;
          }
          unsigned int v93 = llroundf(v90);
          if (v92 < v21) {
            float v94 = v21;
          }
          else {
            float v94 = (float)((float)((float)(v127 * _S22) + (float)(v128 * _S20)) + (float)(v126 * _S21)) + v21;
          }
          BOOL v91 = v92 <= v23;
          float v95 = (float)((float)((float)(v127 * _S5) + (float)(v128 * _S24)) + (float)(v126 * _S3)) + v21;
          if (!v91) {
            float v94 = v23;
          }
          unsigned int v96 = llroundf(v94);
          if (v95 < v21) {
            float v97 = v21;
          }
          else {
            float v97 = (float)((float)((float)(v127 * _S5) + (float)(v128 * _S24)) + (float)(v126 * _S3)) + v21;
          }
          BOOL v91 = v95 <= v23;
          float v98 = (float)((float)((float)(v127 * _S7) + (float)(v128 * _S6)) + (float)(v126 * _S16)) + v21;
          if (!v91) {
            float v97 = v23;
          }
          unsigned int v99 = llroundf(v97);
          if (v98 < v21) {
            float v100 = v21;
          }
          else {
            float v100 = (float)((float)((float)(v127 * _S7) + (float)(v128 * _S6)) + (float)(v126 * _S16)) + v21;
          }
          if (v98 <= v23) {
            float v101 = v100;
          }
          else {
            float v101 = v23;
          }
          float v102 = (float)((float)(_S15 + _S20) + _S24) + _S6;
          float v103 = (float)((float)(_S18 + _S22) + _S5) + _S7;
          *(_WORD *)uint64_t v33 = v93 << v35;
          *((_WORD *)v33 + 1) = v96 << v35;
          *(_WORD *)float32x2_t v43 = v99 << v35;
          *((_WORD *)v43 + 1) = llroundf(v101) << v35;
          float v104 = v130;
          float v105 = (float)((float)(_S19 + _S21) + _S3) + _S16;
          float v106 = (float)((float)(v22 + (float)(v102 * v125)) + (float)(v103 * v124)) + (float)(v105 * v123);
          if (v106 <= v130)
          {
            float v104 = (float)((float)(v22 + (float)(v102 * v125)) + (float)(v103 * v124)) + (float)(v105 * v123);
            if (v106 < v129) {
              float v104 = v129;
            }
          }
          float v107 = &result[2 * v41];
          float v108 = (float)((float)(v22 + (float)(v102 * v122)) + (float)(v103 * v121)) + (float)(v105 * v119);
          *(_WORD *)float v107 = llroundf(v104) << v35;
          float v109 = v130;
          if (v108 <= v130)
          {
            float v109 = v108;
            if (v108 < v129) {
              float v109 = v129;
            }
          }
          v31 += 2;
          v42 += 2;
          v33 += 4;
          v43 += 4;
          *((_WORD *)v107 + 1) = llroundf(v109) << v35;
          v41 += 2;
        }
        while (v13 > v41);
      }
      uint64_t v31 = (unsigned int *)&v40[v18];
      uint64_t v33 = &v39[v19];
      result += v20;
      v12 += 2;
    }
    while (v15 > v12);
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_xf420(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v11 = a2[3];
  uint64_t v12 = a2[5];
  uint64_t v13 = *a6;
  uint64_t v14 = a6[1];
  uint64_t v16 = a6[2];
  uint64_t v15 = a6[3];
  uint64_t v17 = a6[4];
  uint64_t v18 = a6[5];
  if (v18)
  {
    ++v18;
    ++v12;
    if (v15)
    {
      --v15;
      --v11;
    }
    else
    {
      v15 -= 2;
      v11 -= 2;
    }
  }
  uint64_t v19 = a2[2];
  uint64_t v20 = a2[4];
  if (v17)
  {
    ++v17;
    ++v20;
    if (v16)
    {
      --v16;
      --v19;
    }
    else
    {
      v16 -= 2;
      v19 -= 2;
    }
  }
  memset(v27, 0, 32);
  if (v20 + v19 <= v9) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v9 - v20;
  }
  memset(&v27[32], 0, 24);
  if (v17 + v16 > v13) {
    uint64_t v16 = v13 - v17;
  }
  size_t v22 = *(unsigned __int8 *)(a1 + 162);
  v27[0] = *(unsigned char *)(a1 + 162);
  if (v12 + v11 > v10) {
    uint64_t v11 = v10 - v12;
  }
  *(void *)&v27[4] = v9;
  *(void *)&v27[12] = v10;
  if (v18 + v15 <= v14) {
    uint64_t v23 = v15;
  }
  else {
    uint64_t v23 = v14 - v18;
  }
  if (v21 >= v16) {
    uint64_t v24 = v16;
  }
  else {
    uint64_t v24 = v21;
  }
  *(void *)&v27[20] = v24;
  if (v11 < v23) {
    uint64_t v23 = v11;
  }
  *(void *)&v27[28] = v23;
  *(void *)&v27[36] = v20;
  *(void *)&v27[44] = v12;
  uint64_t v31 = v13;
  uint64_t v32 = v14;
  uint64_t v33 = v24;
  uint64_t v34 = v23;
  uint64_t v35 = v17;
  uint64_t v36 = v18;
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v39 = a9;
  uint64_t v40 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v22, global_queue, v27, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_xf420_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_rgb_xf420_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, float a8, float a9)
{
  uint64_t v9 = *(void *)(result + 28);
  unint64_t v10 = 2 * *result;
  unint64_t v11 = v9 * a2 / v10;
  unint64_t v12 = (v9 + v9 * a2) / v10;
  if (2 * v12 != 2 * v11)
  {
    unint64_t v13 = 0;
    unint64_t v14 = *(void *)(result + 20);
    uint64_t v15 = *(void *)(result + 44) + 2 * v11;
    unint64_t v16 = 2 * v12 - 2 * v11;
    uint64_t v17 = *((void *)result + 19);
    uint64_t v18 = (uint64_t *)*((void *)result + 17);
    uint64_t v19 = **((void **)result + 8);
    uint64_t v20 = *v18;
    uint64_t v21 = v18[1];
    *(float *)&unsigned int v22 = (float)*(unsigned int *)(v17 + 136);
    float v23 = *(float *)&v22 / (float)*(unsigned int *)(v17 + 128);
    LOWORD(v22) = *(_WORD *)(v17 + 140);
    float v24 = (float)v22;
    LOWORD(a5) = *(_WORD *)(v17 + 144);
    float v25 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v17 + 146);
    float v26 = (float)LODWORD(a6);
    LOWORD(a7) = *(_WORD *)(v17 + 148);
    float v27 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v17 + 150);
    float v28 = (float)LODWORD(a8);
    LOWORD(a9) = *(_WORD *)(v17 + 152);
    float v29 = (float)LODWORD(a9);
    float v30 = *(float *)(v17 + 36);
    float v31 = *(float *)(v17 + 40);
    float v32 = *(float *)(v17 + 44);
    float v84 = *(float *)(v17 + 48) * 0.25;
    float v33 = *(float *)(v17 + 52) * 0.25;
    float v34 = *(float *)(v17 + 56) * 0.25;
    float v35 = *(float *)(v17 + 60) * 0.25;
    float v36 = *(float *)(v17 + 64) * 0.25;
    float v37 = *(float *)(v17 + 68) * 0.25;
    uint64_t v38 = *((void *)result + 14);
    unint64_t v39 = *((void *)result + 13) * a2 / v10;
    uint64_t v40 = (void *)*((void *)result + 16);
    uint64_t v41 = *((void *)result + 15) + 2 * v39;
    uint64_t v42 = (char *)(**((void **)result + 7) + v19 * v15 + 4 * *(void *)(result + 36));
    float32x2_t v43 = (unsigned __int8 *)(*v40 + v41 * v20 + 2 * v38);
    LODWORD(v17) = *(unsigned __int8 *)(v17 + 132);
    char v44 = 16 - v17;
    if (v17 >= 0x11) {
      char v44 = 0;
    }
    if (v41 >= 0) {
      uint64_t v45 = v41;
    }
    else {
      uint64_t v45 = v41 + 1;
    }
    uint64_t v46 = v40[1] + (v45 >> 1) * v21 + 2 * v38;
    char v47 = v44;
    do
    {
      double result = &v43[v20];
      uint64_t v48 = &v42[v19];
      if (v14)
      {
        unint64_t v49 = 0;
        float32x2_t v50 = &v42[v19];
        v51 = &v43[v20];
        do
        {
          unsigned int v52 = *((_DWORD *)v42 + 1);
          float v53 = (float)((v52 >> 10) & 0x3FF);
          float v54 = (float)((v52 >> 20) & 0x3FF);
          unsigned int v55 = *((_DWORD *)v50 + 1);
          float v56 = v23 * (float)((float)(*(_DWORD *)v42 & 0x3FF) - v24);
          float v57 = v23 * (float)((float)((*(_DWORD *)v42 >> 10) & 0x3FF) - v24);
          float v58 = v23 * (float)((float)((*(_DWORD *)v42 >> 20) & 0x3FF) - v24);
          float v59 = v23 * (float)((float)(*((_DWORD *)v42 + 1) & 0x3FF) - v24);
          float v60 = v23 * (float)(v53 - v24);
          float v61 = v23 * (float)(v54 - v24);
          float v62 = v23 * (float)((float)(*(_DWORD *)v50 & 0x3FF) - v24);
          float v63 = v23 * (float)((float)((*(_DWORD *)v50 >> 10) & 0x3FF) - v24);
          float v64 = v23 * (float)((float)((*(_DWORD *)v50 >> 20) & 0x3FF) - v24);
          float v65 = v23 * (float)((float)(v55 & 0x3FF) - v24);
          float v66 = v23 * (float)((float)((v55 >> 10) & 0x3FF) - v24);
          float v67 = v23 * (float)((float)((v55 >> 20) & 0x3FF) - v24);
          float v68 = (float)((float)((float)(v31 * v57) + (float)(v30 * v58)) + (float)(v32 * v56)) + v25;
          float v69 = (float)((float)((float)(v31 * v60) + (float)(v30 * v61)) + (float)(v32 * v59)) + v25;
          float v70 = (float)((float)((float)(v31 * v63) + (float)(v30 * v64)) + (float)(v32 * v62)) + v25;
          float v71 = (float)((float)((float)(v31 * v66) + (float)(v30 * v67)) + (float)(v32 * v65)) + v25;
          if (v68 < v25) {
            float v72 = v25;
          }
          else {
            float v72 = (float)((float)((float)(v31 * v57) + (float)(v30 * v58)) + (float)(v32 * v56)) + v25;
          }
          if (v68 > v27) {
            float v72 = v27;
          }
          *(_WORD *)float32x2_t v43 = llroundf(v72) << v47;
          if (v69 < v25) {
            float v73 = v25;
          }
          else {
            float v73 = (float)((float)((float)(v31 * v60) + (float)(v30 * v61)) + (float)(v32 * v59)) + v25;
          }
          if (v69 > v27) {
            float v73 = v27;
          }
          *((_WORD *)v43 + 1) = llroundf(v73) << v47;
          if (v70 < v25) {
            float v74 = v25;
          }
          else {
            float v74 = (float)((float)((float)(v31 * v63) + (float)(v30 * v64)) + (float)(v32 * v62)) + v25;
          }
          if (v70 > v27) {
            float v74 = v27;
          }
          *(_WORD *)v51 = llroundf(v74) << v47;
          if (v71 < v25) {
            float v75 = v25;
          }
          else {
            float v75 = (float)((float)((float)(v31 * v66) + (float)(v30 * v67)) + (float)(v32 * v65)) + v25;
          }
          if (v71 > v27) {
            float v75 = v27;
          }
          *((_WORD *)v51 + 1) = llroundf(v75) << v47;
          float v76 = (float)((float)(v58 + v61) + v64) + v67;
          float v77 = (float)((float)(v57 + v60) + v63) + v66;
          float v78 = (float)((float)(v56 + v59) + v62) + v65;
          float v79 = (float)((float)(v26 + (float)(v76 * v84)) + (float)(v77 * v33)) + (float)(v78 * v34);
          float v80 = v29;
          if (v79 <= v29)
          {
            float v80 = (float)((float)(v26 + (float)(v76 * v84)) + (float)(v77 * v33)) + (float)(v78 * v34);
            if (v79 < v28) {
              float v80 = v28;
            }
          }
          char v81 = (_WORD *)(v46 + 2 * v49);
          float v82 = (float)((float)(v26 + (float)(v76 * v35)) + (float)(v77 * v36)) + (float)(v78 * v37);
          *char v81 = llroundf(v80) << v47;
          float v83 = v29;
          if (v82 <= v29)
          {
            float v83 = v82;
            if (v82 < v28) {
              float v83 = v28;
            }
          }
          v42 += 8;
          v50 += 8;
          v43 += 4;
          v51 += 4;
          v81[1] = llroundf(v83) << v47;
          v49 += 2;
        }
        while (v14 > v49);
      }
      uint64_t v42 = &v48[v19];
      float32x2_t v43 = &result[v20];
      v46 += v21;
      v13 += 2;
    }
    while (v16 > v13);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_422vf(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v12 = a2[2];
  uint64_t v11 = a2[3];
  uint64_t v13 = a2[4];
  uint64_t v14 = a2[5];
  uint64_t v15 = *a6;
  uint64_t v16 = a6[1];
  uint64_t v18 = a6[2];
  uint64_t v17 = a6[3];
  uint64_t v20 = a6[4];
  uint64_t v19 = a6[5];
  if (v20)
  {
    ++v20;
    ++v13;
    if (v18)
    {
      --v18;
      --v12;
    }
    else
    {
      v18 -= 2;
      v12 -= 2;
    }
  }
  memset(v27, 0, 32);
  if (v13 + v12 <= v9) {
    uint64_t v21 = v12;
  }
  else {
    uint64_t v21 = v9 - v13;
  }
  memset(&v27[32], 0, 24);
  if (v20 + v18 > v15) {
    uint64_t v18 = v15 - v20;
  }
  size_t v22 = *(unsigned __int8 *)(a1 + 162);
  v27[0] = *(unsigned char *)(a1 + 162);
  if (v14 + v11 > v10) {
    uint64_t v11 = v10 - v14;
  }
  *(void *)&v27[4] = v9;
  *(void *)&v27[12] = v10;
  if (v19 + v17 <= v16) {
    uint64_t v23 = v17;
  }
  else {
    uint64_t v23 = v16 - v19;
  }
  if (v21 >= v18) {
    uint64_t v24 = v18;
  }
  else {
    uint64_t v24 = v21;
  }
  *(void *)&v27[20] = v24;
  if (v11 < v23) {
    uint64_t v23 = v11;
  }
  *(void *)&v27[28] = v23;
  *(void *)&v27[36] = v13;
  *(void *)&v27[44] = v14;
  uint64_t v31 = v15;
  uint64_t v32 = v16;
  uint64_t v33 = v24;
  uint64_t v34 = v23;
  uint64_t v35 = v20;
  uint64_t v36 = v19;
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v39 = a9;
  uint64_t v40 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v22, global_queue, v27, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_422vf_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_422vf_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, double a6, float a7, float a8)
{
  uint64_t v8 = *(void *)(result + 28);
  unint64_t v9 = *result;
  unint64_t v10 = v8 * a2 / v9;
  unint64_t v11 = (v8 + v8 * a2) / v9;
  if (v11 != v10)
  {
    uint64_t v12 = 0;
    unint64_t v13 = *(void *)(result + 20);
    unint64_t v14 = v10 + *(void *)(result + 44);
    unint64_t v15 = v11 - v10;
    uint64_t v16 = *((void *)result + 19);
    uint64_t v17 = (uint64_t *)*((void *)result + 17);
    uint64_t v18 = (void *)*((void *)result + 7);
    uint64_t v19 = **((void **)result + 8);
    uint64_t v20 = *v17;
    uint64_t v21 = v17[1];
    uint64_t v22 = v17[2];
    *(float *)&unsigned int v23 = (float)*(unsigned int *)(v16 + 128);
    float v24 = 8191.0 / *(float *)&v23;
    LOWORD(v23) = *(_WORD *)(v16 + 140);
    *(float *)&a3 = (float)v23;
    LOWORD(a5) = *(_WORD *)(v16 + 144);
    float v25 = (float)LODWORD(a5);
    LOWORD(a7) = *(_WORD *)(v16 + 146);
    float v26 = (float)LODWORD(a7);
    LOWORD(a7) = *(_WORD *)(v16 + 148);
    float v27 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v16 + 150);
    *(float *)&unsigned int v28 = (float)LODWORD(a8);
    float v128 = *(float *)&v28;
    LOWORD(v28) = *(_WORD *)(v16 + 152);
    float v29 = (float)v28;
    float v30 = *(float *)(v16 + 40);
    float v127 = *(float *)(v16 + 36);
    float v31 = *(float *)(v16 + 44);
    float v126 = *(float *)(v16 + 48) * 0.5;
    float v125 = *(float *)(v16 + 52) * 0.5;
    float v124 = *(float *)(v16 + 56) * 0.5;
    float v123 = *(float *)(v16 + 60) * 0.5;
    float v122 = *(float *)(v16 + 64) * 0.5;
    float v32 = *(float *)(v16 + 72);
    float v121 = *(float *)(v16 + 68) * 0.5;
    float v33 = *(float *)(v16 + 76);
    float v34 = *(float *)(v16 + 80);
    float v35 = *(float *)(v16 + 84);
    float v36 = *(float *)(v16 + 88);
    float v37 = *(float *)(v16 + 92);
    float v38 = *(float *)(v16 + 96);
    float v40 = *(float *)(v16 + 100);
    float v39 = *(float *)(v16 + 104);
    uint64_t v41 = v16 + 164;
    uint64_t v42 = v16 + 16548;
    uint64_t v43 = v16 + 32932;
    float v44 = *(float *)(v16 + 108);
    float v45 = *(float *)(v16 + 112);
    float v46 = *(float *)(v16 + 116);
    float v47 = *(float *)(v16 + 120);
    uint64_t v48 = *((void *)result + 14);
    unint64_t v49 = (void *)*((void *)result + 16);
    unint64_t v50 = *((void *)result + 13) * a2 / v9 + *((void *)result + 15);
    uint64_t v51 = *(void *)(result + 36);
    uint64_t v52 = v49[2];
    if (v52) {
      double result = (unsigned __int8 *)(v52 + v50 * v22 + v48);
    }
    else {
      double result = 0;
    }
    unsigned int v55 = v49;
    uint64_t v54 = *v49;
    uint64_t v53 = v55[1];
    _ZF = v53 == 0;
    uint64_t v57 = v53 + v50 * v21 + v48;
    if (_ZF) {
      uint64_t v57 = 0;
    }
    float v58 = (unsigned char *)(v54 + v50 * v20 + v48);
    uint64_t v59 = *v18 + v19 * v14 + 4 * v51;
    float32x2_t v60 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a3, 0);
    do
    {
      if (v13)
      {
        unint64_t v61 = 0;
        float v62 = result;
        float v63 = v58;
        float v64 = (unsigned int *)v59;
        do
        {
          unsigned int v65 = *v64;
          unsigned int v66 = v64[1];
          float32x2_t v67 = (float32x2_t)vdup_n_s32(0x45FFF800u);
          _D0 = (int8x8_t)vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v64), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v60), v24), 0), v67)));
          _D0.i16[0] = *(_WORD *)(v41 + 2 * _D0.u32[0]);
          __asm { FCVT            S19, H0 }
          _D0.i16[0] = *(_WORD *)(v41 + 2 * _D0.u32[1]);
          __asm { FCVT            S20, H0 }
          _D0.i32[0] = *v64;
          _D0.i32[1] = v66 >> 20;
          int32x2_t v74 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D0, (int8x8_t)0x300000003)), v60), v24), 0), v67)));
          _D0.i16[0] = *(_WORD *)(v41 + 2 * v74.u32[0]);
          __asm { FCVT            S21, H0 }
          float v76 = (float)((float)((float)(v45 * _S20) + (float)(v44 * _S19)) + (float)(v46 * _S21))
              + (float)(v47 * fmaxf(_S19, fmaxf(_S20, _S21)));
          float v77 = 8191.0;
          if (v76 <= 8191.0)
          {
            float v77 = v76;
            if (v76 < 0.0) {
              float v77 = 0.0;
            }
          }
          _H5 = *(_WORD *)(v41 + 2 * v74.u32[1]);
          __asm { FCVT            S5, H5 }
          _D24.i32[0] = v66 >> 10;
          _D24.i32[1] = v64[1];
          _D22 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D24, (int8x8_t)0x300000003)), v60), v24), 0), v67)));
          _D22.i16[0] = *(_WORD *)(v41 + 2 * _D22.u32[0]);
          __asm { FCVT            S22, H22 }
          _D24.i16[0] = *(_WORD *)(v41 + 2 * _D22.u32[1]);
          __asm { FCVT            S14, H24 }
          float v84 = (float)((float)((float)(v45 * _S22) + (float)(v44 * _S5)) + (float)(v46 * _S14))
              + (float)(v47 * fmaxf(_S5, fmaxf(_S22, _S14)));
          float v85 = 8191.0;
          if (v84 <= 8191.0)
          {
            float v85 = v84;
            if (v84 < 0.0) {
              float v85 = 0.0;
            }
          }
          _H0 = *(_WORD *)(v42 + 2 * llroundf(v77));
          __asm { FCVT            S0, H0 }
          float v88 = _S19 * _S0;
          float v89 = _S20 * _S0;
          float v90 = _S21 * _S0;
          _H21 = *(_WORD *)(v42 + 2 * llroundf(v85));
          __asm { FCVT            S21, H21 }
          float v93 = _S5 * _S21;
          _S22 = _S22 * _S21;
          _S21 = _S14 * _S21;
          float v96 = (float)((float)(v33 * v89) + (float)(v88 * v32)) + (float)(v90 * v34);
          float v97 = (float)((float)(v36 * v89) + (float)(v88 * v35)) + (float)(v90 * v37);
          _S0 = (float)((float)(v40 * v89) + (float)(v88 * v38)) + (float)(v90 * v39);
          float v99 = (float)((float)(v33 * _S22) + (float)(v93 * v32)) + (float)(_S21 * v34);
          _S20 = (float)((float)(v36 * _S22) + (float)(v93 * v35)) + (float)(_S21 * v37);
          _S5 = (float)((float)(v40 * _S22) + (float)(v93 * v38)) + (float)(_S21 * v39);
          LOWORD(_S21) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(v96, 0.0), 8191.0)));
          LOWORD(_S22) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(v97, 0.0), 8191.0)));
          __asm
          {
            FCVT            S21, H21
            FCVT            S22, H22
          }
          LOWORD(_S0) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(_S0, 0.0), 8191.0)));
          unsigned int v104 = llroundf(fminf(fmaxf(v99, 0.0), 8191.0));
          __asm { FCVT            S19, H0 }
          LOWORD(_S0) = *(_WORD *)(v43 + 2 * v104);
          __asm { FCVT            S0, H0 }
          LOWORD(_S20) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(_S20, 0.0), 8191.0)));
          __asm { FCVT            S20, H20 }
          LOWORD(_S5) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(_S5, 0.0), 8191.0)));
          __asm { FCVT            S24, H5 }
          float v109 = (float)((float)((float)(v30 * _S22) + (float)(v127 * _S21)) + (float)(v31 * _S19)) + v25;
          float v110 = (float)((float)((float)(v30 * _S20) + (float)(v127 * _S0)) + (float)(v31 * _S24)) + v25;
          if (v109 < v25) {
            float v111 = v25;
          }
          else {
            float v111 = (float)((float)((float)(v30 * _S22) + (float)(v127 * _S21)) + (float)(v31 * _S19)) + v25;
          }
          if (v109 <= v27) {
            float v112 = v111;
          }
          else {
            float v112 = v27;
          }
          *float v63 = llroundf(v112);
          if (v110 < v25) {
            float v113 = v25;
          }
          else {
            float v113 = (float)((float)((float)(v30 * _S20) + (float)(v127 * _S0)) + (float)(v31 * _S24)) + v25;
          }
          if (v110 > v27) {
            float v113 = v27;
          }
          v63[1] = llroundf(v113);
          float v114 = _S21 + _S0;
          float v115 = _S22 + _S20;
          float v116 = _S19 + _S24;
          float v117 = (float)((float)(v26 + (float)(v114 * v126)) + (float)((float)(_S22 + _S20) * v125))
               + (float)(v116 * v124);
          float v118 = v29;
          if (v117 <= v29)
          {
            float v118 = v117;
            if (v117 < v128) {
              float v118 = v128;
            }
          }
          float v119 = (float)((float)(v26 + (float)(v114 * v123)) + (float)(v115 * v122)) + (float)(v116 * v121);
          *(unsigned char *)(v57 + v61) = llroundf(v118);
          float v120 = v29;
          if (v119 <= v29)
          {
            float v120 = v119;
            if (v119 < v128) {
              float v120 = v128;
            }
          }
          *(unsigned char *)(v57 + v61 + 1) = llroundf(v120);
          if (v62)
          {
            *float v62 = 85 * (v65 >> 30);
            v62[1] = 85 * (v66 >> 30);
            v62 += 2;
          }
          v61 += 2;
          v64 += 2;
          v63 += 2;
        }
        while (v13 > v61);
      }
      v59 += v19;
      v58 += v20;
      v57 += v21;
      result += v22;
      ++v12;
    }
    while (v12 != v15);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_422vf(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v12 = a2[2];
  uint64_t v11 = a2[3];
  uint64_t v13 = a2[4];
  uint64_t v14 = a2[5];
  uint64_t v15 = *a6;
  uint64_t v16 = a6[1];
  uint64_t v18 = a6[2];
  uint64_t v17 = a6[3];
  uint64_t v20 = a6[4];
  uint64_t v19 = a6[5];
  if (v20)
  {
    ++v20;
    ++v13;
    if (v18)
    {
      --v18;
      --v12;
    }
    else
    {
      v18 -= 2;
      v12 -= 2;
    }
  }
  memset(v27, 0, 32);
  if (v13 + v12 <= v9) {
    uint64_t v21 = v12;
  }
  else {
    uint64_t v21 = v9 - v13;
  }
  memset(&v27[32], 0, 24);
  if (v20 + v18 > v15) {
    uint64_t v18 = v15 - v20;
  }
  size_t v22 = *(unsigned __int8 *)(a1 + 162);
  v27[0] = *(unsigned char *)(a1 + 162);
  if (v14 + v11 > v10) {
    uint64_t v11 = v10 - v14;
  }
  *(void *)&v27[4] = v9;
  *(void *)&v27[12] = v10;
  if (v19 + v17 <= v16) {
    uint64_t v23 = v17;
  }
  else {
    uint64_t v23 = v16 - v19;
  }
  if (v21 >= v18) {
    uint64_t v24 = v18;
  }
  else {
    uint64_t v24 = v21;
  }
  *(void *)&v27[20] = v24;
  if (v11 < v23) {
    uint64_t v23 = v11;
  }
  *(void *)&v27[28] = v23;
  *(void *)&v27[36] = v13;
  *(void *)&v27[44] = v14;
  uint64_t v31 = v15;
  uint64_t v32 = v16;
  uint64_t v33 = v24;
  uint64_t v34 = v23;
  uint64_t v35 = v20;
  uint64_t v36 = v19;
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v39 = a9;
  uint64_t v40 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v22, global_queue, v27, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_422vf_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Mat_TRC_422vf_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, float a8, double a9, float a10)
{
  uint64_t v10 = *(void *)(result + 28);
  unint64_t v11 = *result;
  unint64_t v12 = v10 * a2 / v11;
  unint64_t v13 = (v10 + v10 * a2) / v11;
  if (v13 != v12)
  {
    uint64_t v14 = 0;
    unint64_t v15 = *(void *)(result + 20);
    unint64_t v16 = v12 + *(void *)(result + 44);
    unint64_t v17 = v13 - v12;
    uint64_t v18 = *((void *)result + 19);
    uint64_t v19 = (uint64_t *)*((void *)result + 17);
    uint64_t v20 = (void *)*((void *)result + 7);
    uint64_t v21 = **((void **)result + 8);
    uint64_t v22 = *v19;
    uint64_t v23 = v19[1];
    uint64_t v24 = v19[2];
    float v25 = 8191.0 / (float)*(unsigned int *)(v18 + 128);
    LOWORD(a5) = *(_WORD *)(v18 + 140);
    *(float *)&a9 = (float)LODWORD(a5);
    LOWORD(a5) = *(_WORD *)(v18 + 144);
    float v26 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v18 + 146);
    float v27 = (float)LODWORD(a6);
    LOWORD(a7) = *(_WORD *)(v18 + 148);
    float v28 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v18 + 150);
    float v29 = (float)LODWORD(a8);
    LOWORD(a10) = *(_WORD *)(v18 + 152);
    float v30 = (float)LODWORD(a10);
    float v31 = *(float *)(v18 + 36);
    float v32 = *(float *)(v18 + 40);
    float v33 = *(float *)(v18 + 44);
    float v107 = *(float *)(v18 + 52) * 0.5;
    float v108 = *(float *)(v18 + 48) * 0.5;
    float v105 = *(float *)(v18 + 60) * 0.5;
    float v106 = *(float *)(v18 + 56) * 0.5;
    float v34 = *(float *)(v18 + 72);
    float v103 = *(float *)(v18 + 68) * 0.5;
    float v104 = *(float *)(v18 + 64) * 0.5;
    float v35 = *(float *)(v18 + 76);
    float v36 = *(float *)(v18 + 80);
    float v37 = *(float *)(v18 + 84);
    float v38 = *(float *)(v18 + 88);
    float v39 = *(float *)(v18 + 92);
    float v40 = *(float *)(v18 + 96);
    float v42 = *(float *)(v18 + 100);
    float v41 = *(float *)(v18 + 104);
    uint64_t v43 = v18 + 164;
    uint64_t v44 = v18 + 16548;
    uint64_t v45 = *((void *)result + 14);
    float v46 = (uint64_t *)*((void *)result + 16);
    unint64_t v47 = *((void *)result + 13) * a2 / v11 + *((void *)result + 15);
    uint64_t v48 = *(void *)(result + 36);
    uint64_t v49 = v46[2];
    if (v49) {
      unint64_t v50 = (unsigned char *)(v49 + v47 * v24 + v45);
    }
    else {
      unint64_t v50 = 0;
    }
    uint64_t v52 = *v46;
    uint64_t v51 = *(void *)(*((void *)result + 16) + 8);
    _ZF = v51 == 0;
    double result = (unsigned __int8 *)(v51 + v47 * v23 + v45);
    if (_ZF) {
      double result = 0;
    }
    uint64_t v54 = (unsigned char *)(v52 + v47 * v22 + v45);
    uint64_t v55 = *v20 + v21 * v16 + 4 * v48;
    float32x2_t v56 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a9, 0);
    float32x2_t v57 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v15)
      {
        unint64_t v58 = 0;
        uint64_t v59 = (unsigned int *)v55;
        float32x2_t v60 = v50;
        unint64_t v61 = v54;
        do
        {
          unsigned int v62 = *v59;
          unsigned __int32 v63 = v59[1];
          _D6 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v59), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v56), v25), 0), v57)));
          _D6.i16[0] = *(_WORD *)(v43 + 2 * _D6.u32[0]);
          _H18 = *(_WORD *)(v43 + 2 * _D6.u32[1]);
          __asm
          {
            FCVT            S6, H6
            FCVT            S18, H18
          }
          v70.i32[0] = *v59;
          v70.i32[1] = v63 >> 20;
          _D19 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v70, (int8x8_t)0x300000003)), v56), v25), 0), v57)));
          _D19.i16[0] = *(_WORD *)(v43 + 2 * _D19.u32[0]);
          __asm { FCVT            S19, H19 }
          _H20 = *(_WORD *)(v43 + 2 * _D19.u32[1]);
          v73.i32[0] = v63 >> 10;
          v73.i32[1] = v63;
          __asm { FCVT            S20, H20 }
          _D15 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v73, (int8x8_t)0x300000003)), v56), v25), 0), v57)));
          _D15.i16[0] = *(_WORD *)(v43 + 2 * _D15.u32[0]);
          __asm { FCVT            S15, H15 }
          _H22 = *(_WORD *)(v43 + 2 * _D15.u32[1]);
          __asm { FCVT            S22, H22 }
          _S24 = (float)((float)(v35 * _S18) + (float)(*(float *)_D6.i32 * v34)) + (float)(*(float *)_D19.i32 * v36);
          float v79 = (float)((float)(v38 * _S18) + (float)(*(float *)_D6.i32 * v37)) + (float)(*(float *)_D19.i32 * v39);
          *(float *)_D6.i32 = (float)((float)(v42 * _S18) + (float)(*(float *)_D6.i32 * v40))
                            + (float)(*(float *)_D19.i32 * v41);
          _S18 = (float)((float)(v35 * *(float *)_D15.i32) + (float)(_S20 * v34)) + (float)(_S22 * v36);
          *(float *)_D19.i32 = (float)((float)(v38 * *(float *)_D15.i32) + (float)(_S20 * v37)) + (float)(_S22 * v39);
          _S20 = (float)((float)(v42 * *(float *)_D15.i32) + (float)(_S20 * v40)) + (float)(_S22 * v41);
          LOWORD(_S22) = *(_WORD *)(v44 + 2 * llroundf(fminf(fmaxf(_S24, 0.0), 8191.0)));
          LOWORD(_S24) = *(_WORD *)(v44 + 2 * llroundf(fminf(fmaxf(v79, 0.0), 8191.0)));
          __asm
          {
            FCVT            S22, H22
            FCVT            S24, H24
          }
          _D6.i16[0] = *(_WORD *)(v44 + 2 * llroundf(fminf(fmaxf(*(float *)_D6.i32, 0.0), 8191.0)));
          __asm { FCVT            S6, H6 }
          LOWORD(_S18) = *(_WORD *)(v44 + 2 * llroundf(fminf(fmaxf(_S18, 0.0), 8191.0)));
          __asm { FCVT            S18, H18 }
          _D19.i16[0] = *(_WORD *)(v44 + 2 * llroundf(fminf(fmaxf(*(float *)_D19.i32, 0.0), 8191.0)));
          __asm { FCVT            S19, H19 }
          LOWORD(_S20) = *(_WORD *)(v44 + 2 * llroundf(fminf(fmaxf(_S20, 0.0), 8191.0)));
          __asm { FCVT            S20, H20 }
          float v88 = (float)((float)((float)(v32 * _S24) + (float)(v31 * _S22)) + (float)(v33 * _S6)) + v26;
          if (v88 < v26) {
            float v89 = v26;
          }
          else {
            float v89 = (float)((float)((float)(v32 * _S24) + (float)(v31 * _S22)) + (float)(v33 * _S6)) + v26;
          }
          BOOL v90 = v88 <= v28;
          float v91 = (float)((float)((float)(v32 * _S19) + (float)(v31 * _S18)) + (float)(v33 * _S20)) + v26;
          if (!v90) {
            float v89 = v28;
          }
          char v92 = llroundf(v89);
          if (v91 < v26) {
            float v93 = v26;
          }
          else {
            float v93 = (float)((float)((float)(v32 * _S19) + (float)(v31 * _S18)) + (float)(v33 * _S20)) + v26;
          }
          if (v91 <= v28) {
            float v94 = v93;
          }
          else {
            float v94 = v28;
          }
          float v95 = _S22 + _S18;
          *unint64_t v61 = v92;
          v61[1] = llroundf(v94);
          float v96 = _S24 + _S19;
          float v97 = (float)(v27 + (float)(v95 * v108)) + (float)((float)(_S24 + _S19) * v107);
          float v98 = _S6 + _S20;
          float v99 = v97 + (float)((float)(_S6 + _S20) * v106);
          float v100 = v30;
          if (v99 <= v30)
          {
            float v100 = v99;
            if (v99 < v29) {
              float v100 = v29;
            }
          }
          float v101 = (float)((float)(v27 + (float)(v95 * v105)) + (float)(v96 * v104)) + (float)(v98 * v103);
          result[v58] = llroundf(v100);
          float v102 = v30;
          if (v101 <= v30)
          {
            float v102 = v101;
            if (v101 < v29) {
              float v102 = v29;
            }
          }
          result[v58 + 1] = llroundf(v102);
          if (v60)
          {
            *float32x2_t v60 = 85 * (v62 >> 30);
            v60[1] = 85 * (v63 >> 30);
            v60 += 2;
          }
          v58 += 2;
          v59 += 2;
          v61 += 2;
        }
        while (v15 > v58);
      }
      v55 += v21;
      v54 += v22;
      result += v23;
      v50 += v24;
      ++v14;
    }
    while (v14 != v17);
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_422vf(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v12 = a2[2];
  uint64_t v11 = a2[3];
  uint64_t v13 = a2[4];
  uint64_t v14 = a2[5];
  uint64_t v15 = *a6;
  uint64_t v16 = a6[1];
  uint64_t v18 = a6[2];
  uint64_t v17 = a6[3];
  uint64_t v20 = a6[4];
  uint64_t v19 = a6[5];
  if (v20)
  {
    ++v20;
    ++v13;
    if (v18)
    {
      --v18;
      --v12;
    }
    else
    {
      v18 -= 2;
      v12 -= 2;
    }
  }
  memset(v27, 0, 32);
  if (v13 + v12 <= v9) {
    uint64_t v21 = v12;
  }
  else {
    uint64_t v21 = v9 - v13;
  }
  memset(&v27[32], 0, 24);
  if (v20 + v18 > v15) {
    uint64_t v18 = v15 - v20;
  }
  size_t v22 = *(unsigned __int8 *)(a1 + 162);
  v27[0] = *(unsigned char *)(a1 + 162);
  if (v14 + v11 > v10) {
    uint64_t v11 = v10 - v14;
  }
  *(void *)&v27[4] = v9;
  *(void *)&v27[12] = v10;
  if (v19 + v17 <= v16) {
    uint64_t v23 = v17;
  }
  else {
    uint64_t v23 = v16 - v19;
  }
  if (v21 >= v18) {
    uint64_t v24 = v18;
  }
  else {
    uint64_t v24 = v21;
  }
  *(void *)&v27[20] = v24;
  if (v11 < v23) {
    uint64_t v23 = v11;
  }
  *(void *)&v27[28] = v23;
  *(void *)&v27[36] = v13;
  *(void *)&v27[44] = v14;
  uint64_t v31 = v15;
  uint64_t v32 = v16;
  uint64_t v33 = v24;
  uint64_t v34 = v23;
  uint64_t v35 = v20;
  uint64_t v36 = v19;
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v39 = a9;
  uint64_t v40 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v22, global_queue, v27, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_422vf_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_rgb_422vf_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, float a8, float a9)
{
  uint64_t v9 = *(void *)(result + 28);
  unint64_t v10 = *result;
  unint64_t v11 = v9 * a2 / v10;
  unint64_t v12 = (v9 + v9 * a2) / v10;
  if (v12 != v11)
  {
    uint64_t v13 = 0;
    unint64_t v14 = *(void *)(result + 20);
    unint64_t v15 = v11 + *(void *)(result + 44);
    unint64_t v16 = v12 - v11;
    uint64_t v17 = *((void *)result + 19);
    uint64_t v18 = (uint64_t *)*((void *)result + 17);
    uint64_t v19 = (void *)*((void *)result + 7);
    uint64_t v20 = **((void **)result + 8);
    uint64_t v21 = *v18;
    uint64_t v22 = v18[1];
    uint64_t v23 = v18[2];
    *(float *)&unsigned int v24 = (float)*(unsigned int *)(v17 + 136);
    float v25 = *(float *)&v24 / (float)*(unsigned int *)(v17 + 128);
    LOWORD(v24) = *(_WORD *)(v17 + 140);
    float v26 = (float)v24;
    LOWORD(a5) = *(_WORD *)(v17 + 144);
    float v27 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v17 + 146);
    float v28 = (float)LODWORD(a6);
    LOWORD(a7) = *(_WORD *)(v17 + 148);
    float v29 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v17 + 150);
    float v30 = (float)LODWORD(a8);
    LOWORD(a9) = *(_WORD *)(v17 + 152);
    float v31 = (float)LODWORD(a9);
    float v32 = *(float *)(v17 + 36);
    float v33 = *(float *)(v17 + 40);
    float v34 = *(float *)(v17 + 44);
    float v35 = *(float *)(v17 + 48) * 0.5;
    float v36 = *(float *)(v17 + 52) * 0.5;
    float v37 = *(float *)(v17 + 56) * 0.5;
    float v38 = *(float *)(v17 + 60) * 0.5;
    float v39 = *(float *)(v17 + 64) * 0.5;
    float v40 = *(float *)(v17 + 68) * 0.5;
    uint64_t v41 = *((void *)result + 14);
    unint64_t v42 = *((void *)result + 13) * a2;
    uint64_t v43 = (void *)*((void *)result + 16);
    unint64_t v44 = v42 / v10 + *((void *)result + 15);
    uint64_t v45 = *(void *)(result + 36);
    uint64_t v46 = v43[2];
    if (v46) {
      unint64_t v47 = (unsigned char *)(v46 + v44 * v23 + v41);
    }
    else {
      unint64_t v47 = 0;
    }
    unint64_t v50 = v43;
    uint64_t v48 = *v43;
    uint64_t v49 = v50[1];
    BOOL v51 = v49 == 0;
    uint64_t v52 = v49 + v44 * v22 + v41;
    if (v51) {
      uint64_t v52 = 0;
    }
    uint64_t v53 = (unsigned char *)(v48 + v44 * v21 + v41);
    double result = (unsigned __int8 *)(*v19 + v20 * v15 + 4 * v45);
    do
    {
      if (v14)
      {
        unint64_t v54 = 0;
        uint64_t v55 = (unsigned int *)result;
        float32x2_t v56 = v47;
        float32x2_t v57 = v53;
        do
        {
          unsigned int v58 = *v55;
          unsigned int v59 = v55[1];
          float v60 = v25 * (float)((float)(*v55 & 0x3FF) - v26);
          float v61 = v25 * (float)((float)((*v55 >> 10) & 0x3FF) - v26);
          float v62 = v25 * (float)((float)((*v55 >> 20) & 0x3FF) - v26);
          float v63 = v25 * (float)((float)(v59 & 0x3FF) - v26);
          float v64 = v25 * (float)((float)((v59 >> 10) & 0x3FF) - v26);
          float v65 = v25 * (float)((float)((v59 >> 20) & 0x3FF) - v26);
          float v66 = (float)((float)((float)(v33 * v61) + (float)(v32 * v62)) + (float)(v34 * v60)) + v27;
          float v67 = (float)((float)((float)(v33 * v64) + (float)(v32 * v65)) + (float)(v34 * v63)) + v27;
          if (v66 < v27) {
            float v68 = v27;
          }
          else {
            float v68 = (float)((float)((float)(v33 * v61) + (float)(v32 * v62)) + (float)(v34 * v60)) + v27;
          }
          if (v66 <= v29) {
            float v69 = v68;
          }
          else {
            float v69 = v29;
          }
          *float32x2_t v57 = llroundf(v69);
          if (v67 < v27) {
            float v70 = v27;
          }
          else {
            float v70 = (float)((float)((float)(v33 * v64) + (float)(v32 * v65)) + (float)(v34 * v63)) + v27;
          }
          if (v67 > v29) {
            float v70 = v29;
          }
          v57[1] = llroundf(v70);
          float v71 = v62 + v65;
          float v72 = v61 + v64;
          float v73 = v60 + v63;
          float v74 = (float)((float)(v28 + (float)(v71 * v35)) + (float)(v72 * v36)) + (float)(v73 * v37);
          float v75 = v31;
          if (v74 <= v31)
          {
            float v75 = (float)((float)(v28 + (float)(v71 * v35)) + (float)(v72 * v36)) + (float)(v73 * v37);
            if (v74 < v30) {
              float v75 = v30;
            }
          }
          float v76 = (float)((float)(v28 + (float)(v71 * v38)) + (float)(v72 * v39)) + (float)(v73 * v40);
          *(unsigned char *)(v52 + v54) = llroundf(v75);
          float v77 = v31;
          if (v76 <= v31)
          {
            float v77 = v76;
            if (v76 < v30) {
              float v77 = v30;
            }
          }
          *(unsigned char *)(v52 + v54 + 1) = llroundf(v77);
          if (v56)
          {
            unsigned char *v56 = 85 * (v58 >> 30);
            v56[1] = 85 * (v59 >> 30);
            v56 += 2;
          }
          v54 += 2;
          v55 += 2;
          v57 += 2;
        }
        while (v14 > v54);
      }
      result += v20;
      v53 += v21;
      v52 += v22;
      v47 += v23;
      ++v13;
    }
    while (v13 != v16);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_2vuyf(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_2vuyf_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_2vuyf_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, double a6, float a7, float a8, float a9, float a10)
{
  uint64_t v11 = *(void *)(result + 28);
  unint64_t v12 = *result;
  unint64_t v13 = v11 * a2 / v12;
  uint64_t v14 = *((void *)result + 14);
  unint64_t v15 = (void *)*((void *)result + 16);
  unint64_t v16 = *((void *)result + 13) * a2 / v12 + *((void *)result + 15);
  uint64_t v17 = (uint64_t *)*((void *)result + 17);
  unint64_t v18 = (v11 + v11 * a2) / v12;
  uint64_t v19 = (unsigned char *)v15[1];
  if (v19) {
    v19 += v17[1] * v16 + v14;
  }
  if (v18 != v13)
  {
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)(result + 44);
    uint64_t v22 = v13 + v21;
    uint64_t v23 = **((void **)result + 8);
    uint64_t v24 = *v17;
    uint64_t v25 = *((void *)result + 19);
    uint64_t v26 = *v15 + v24 * v16;
    uint64_t v27 = v18 + v21;
    uint64_t v28 = **((void **)result + 7) + v23 * v22 + 4 * *(void *)(result + 36);
    float v29 = (unsigned char *)(v26 + v14);
    uint64_t v30 = v27 - v22;
    LOWORD(a5) = *(_WORD *)(v25 + 140);
    LOWORD(a7) = *(_WORD *)(v25 + 144);
    LOWORD(a8) = *(_WORD *)(v25 + 146);
    LOWORD(a9) = *(_WORD *)(v25 + 148);
    LOWORD(a10) = *(_WORD *)(v25 + 150);
    LOWORD(v10) = *(_WORD *)(v25 + 152);
    float v31 = 8191.0 / (float)*(unsigned int *)(v25 + 128);
    *(float *)&a3 = (float)LODWORD(a5);
    float v32 = (float)LODWORD(a7);
    float v133 = (float)LODWORD(a8);
    float v33 = (float)LODWORD(a9);
    float v34 = (float)LODWORD(a10);
    float v35 = (float)v10;
    float v36 = *(float *)(v25 + 40);
    float v134 = *(float *)(v25 + 36);
    float v37 = *(float *)(v25 + 44);
    float v131 = *(float *)(v25 + 52) * 0.5;
    float v132 = *(float *)(v25 + 48) * 0.5;
    float v130 = *(float *)(v25 + 56) * 0.5;
    float v129 = *(float *)(v25 + 60) * 0.5;
    float v128 = *(float *)(v25 + 64) * 0.5;
    float v126 = *(float *)(v25 + 72);
    float v127 = *(float *)(v25 + 68) * 0.5;
    float v38 = *(float *)(v25 + 76);
    float v39 = *(float *)(v25 + 80);
    float v40 = *(float *)(v25 + 84);
    float v41 = *(float *)(v25 + 88);
    float v42 = *(float *)(v25 + 92);
    float v43 = *(float *)(v25 + 96);
    float v45 = *(float *)(v25 + 100);
    float v44 = *(float *)(v25 + 104);
    uint64_t v46 = v25 + 164;
    uint64_t v47 = v25 + 16548;
    uint64_t v48 = v25 + 32932;
    float v49 = *(float *)(v25 + 108);
    float v50 = *(float *)(v25 + 112);
    float v51 = *(float *)(v25 + 116);
    float v52 = *(float *)(v25 + 120);
    double result = *(unsigned __int8 **)(result + 20);
    float32x2_t v53 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a3, 0);
    do
    {
      if (result)
      {
        unint64_t v54 = 0;
        uint64_t v55 = v19;
        float32x2_t v56 = v29;
        float32x2_t v57 = (unsigned int *)v28;
        do
        {
          unsigned int v58 = *v57;
          unsigned int v59 = v57[1];
          float32x2_t v60 = (float32x2_t)vdup_n_s32(0x45FFF800u);
          _D0 = (int8x8_t)vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v57), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v53), v31), 0), v60)));
          _D0.i16[0] = *(_WORD *)(v46 + 2 * _D0.u32[0]);
          __asm { FCVT            S19, H0 }
          _D0.i16[0] = *(_WORD *)(v46 + 2 * _D0.u32[1]);
          __asm { FCVT            S20, H0 }
          _D0.i32[0] = *v57;
          _D0.i32[1] = v59 >> 20;
          int32x2_t v68 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D0, (int8x8_t)0x300000003)), v53), v31), 0), v60)));
          _D0.i16[0] = *(_WORD *)(v46 + 2 * v68.u32[0]);
          __asm { FCVT            S22, H0 }
          float v70 = fmaxf(_S19, fmaxf(_S20, _S22));
          float v71 = (float)((float)((float)(v50 * _S20) + (float)(v49 * _S19)) + (float)(v51 * _S22)) + (float)(v52 * v70);
          float v72 = 8191.0;
          if (v71 <= 8191.0)
          {
            float v72 = (float)((float)((float)(v50 * _S20) + (float)(v49 * _S19)) + (float)(v51 * _S22)) + (float)(v52 * v70);
            if (v71 < 0.0) {
              float v72 = 0.0;
            }
          }
          _H24 = *(_WORD *)(v46 + 2 * v68.u32[1]);
          v74.i32[0] = v59 >> 10;
          v74.i32[1] = v57[1];
          _D13 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v74, (int8x8_t)0x300000003)), v53), v31), 0), v60)));
          __asm { FCVT            S21, H24 }
          _H24 = *(_WORD *)(v46 + 2 * _D13.u32[0]);
          _D13.i16[0] = *(_WORD *)(v46 + 2 * _D13.u32[1]);
          __asm
          {
            FCVT            S14, H24
            FCVT            S13, H13
          }
          _H0 = *(_WORD *)(v47 + 2 * llroundf(v72));
          __asm { FCVT            S24, H0 }
          float v82 = _S19 * _S24;
          float v83 = _S20 * _S24;
          float v84 = _S22 * _S24;
          float v85 = (float)((float)((float)(v50 * _S14) + (float)(v49 * _S21)) + (float)(v51 * _S13))
              + (float)(v52 * fmaxf(_S21, fmaxf(_S14, _S13)));
          float v86 = 8191.0;
          if (v85 <= 8191.0)
          {
            float v86 = v85;
            if (v85 < 0.0) {
              float v86 = 0.0;
            }
          }
          _H22 = *(_WORD *)(v47 + 2 * llroundf(v86));
          __asm { FCVT            S22, H22 }
          float v89 = _S21 * _S22;
          _S24 = _S14 * _S22;
          float v91 = _S13 * _S22;
          float v92 = (float)((float)(v38 * v83) + (float)(v82 * v126)) + (float)(v84 * v39);
          float v93 = (float)((float)(v41 * v83) + (float)(v82 * v40)) + (float)(v84 * v42);
          float v94 = (float)((float)(v45 * v83) + (float)(v82 * v43)) + (float)(v84 * v44);
          float v95 = (float)(v38 * _S24) + (float)(v89 * v126);
          float v96 = (float)(v41 * _S24) + (float)(v89 * v40);
          float v97 = (float)(v45 * _S24) + (float)(v89 * v43);
          _S19 = v95 + (float)(v91 * v39);
          _S20 = v96 + (float)(v91 * v42);
          LOWORD(_S24) = *(_WORD *)(v48 + 2 * llroundf(fminf(fmaxf(v92, 0.0), 8191.0)));
          float v100 = v97 + (float)(v91 * v44);
          __asm { FCVT            S22, H24 }
          LOWORD(_S24) = *(_WORD *)(v48 + 2 * llroundf(fminf(fmaxf(v93, 0.0), 8191.0)));
          unsigned int v102 = llroundf(fminf(fmaxf(v94, 0.0), 8191.0));
          __asm { FCVT            S0, H24 }
          LOWORD(_S24) = *(_WORD *)(v48 + 2 * v102);
          __asm { FCVT            S24, H24 }
          LOWORD(_S19) = *(_WORD *)(v48 + 2 * llroundf(fminf(fmaxf(_S19, 0.0), 8191.0)));
          __asm { FCVT            S19, H19 }
          LOWORD(_S20) = *(_WORD *)(v48 + 2 * llroundf(fminf(fmaxf(_S20, 0.0), 8191.0)));
          __asm { FCVT            S20, H20 }
          unsigned int v107 = llroundf(fminf(fmaxf(v100, 0.0), 8191.0));
          float v108 = (float)(v36 * _S0) + (float)(v134 * _S22);
          float v109 = _S22 + _S19;
          _S0 = _S0 + _S20;
          float v111 = (float)(v133 + (float)(v109 * v132)) + (float)(_S0 * v131);
          float v112 = (float)(v133 + (float)(v109 * v129)) + (float)(_S0 * v128);
          LOWORD(_S0) = *(_WORD *)(v48 + 2 * v107);
          __asm { FCVT            S0, H0 }
          float v114 = v108 + (float)(v37 * _S24);
          float v115 = _S24 + _S0;
          float v116 = v111 + (float)((float)(_S24 + _S0) * v130);
          float v117 = v112 + (float)(v115 * v127);
          if (v116 < v34) {
            float v118 = (float)LODWORD(a10);
          }
          else {
            float v118 = v116;
          }
          BOOL v119 = v116 <= v35;
          float v120 = v114 + v32;
          if (!v119) {
            float v118 = (float)v10;
          }
          char v121 = llroundf(v118);
          if (v120 < v32) {
            float v122 = v32;
          }
          else {
            float v122 = v114 + v32;
          }
          unsigned char *v56 = v121;
          if (v120 > v33) {
            float v122 = v33;
          }
          v56[1] = llroundf(v122);
          float v123 = (float)v10;
          if (v117 <= v35)
          {
            float v123 = v117;
            if (v117 < v34) {
              float v123 = (float)LODWORD(a10);
            }
          }
          float v124 = (float)((float)((float)(v36 * _S20) + (float)(v134 * _S19)) + (float)(v37 * _S0)) + v32;
          v56[2] = llroundf(v123);
          float v125 = v33;
          if (v124 <= v33)
          {
            float v125 = v124;
            if (v124 < v32) {
              float v125 = v32;
            }
          }
          v56[3] = llroundf(v125);
          if (v55)
          {
            *uint64_t v55 = 85 * (v58 >> 30);
            v55[1] = 85 * (v59 >> 30);
            v55 += 2;
          }
          v54 += 2;
          v57 += 2;
          v56 += 4;
        }
        while ((unint64_t)result > v54);
      }
      v28 += v23;
      v29 += v24;
      ++v20;
    }
    while (v20 != v30);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_2vuyf(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_2vuyf_GCD);
  return 0;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_2vuyf_GCD(uint64_t result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, float a8, float a9)
{
  uint64_t v10 = *(void *)(result + 28);
  unint64_t v11 = *(unsigned __int8 *)result;
  unint64_t v12 = v10 * a2 / v11;
  uint64_t v13 = *(void *)(result + 112);
  uint64_t v14 = *(void **)(result + 128);
  unint64_t v15 = *(void *)(result + 104) * a2 / v11 + *(void *)(result + 120);
  unint64_t v16 = *(uint64_t **)(result + 136);
  unint64_t v17 = (v10 + v10 * a2) / v11;
  uint64_t v18 = (unsigned char *)v14[1];
  if (v18) {
    v18 += v16[1] * v15 + v13;
  }
  if (v17 != v12)
  {
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)(result + 44);
    uint64_t v21 = v12 + v20;
    uint64_t v22 = **(void **)(result + 64);
    uint64_t v23 = *v16;
    uint64_t v24 = *v14 + v23 * v15;
    uint64_t v25 = *(void *)(result + 152);
    unint64_t v26 = *(void *)(result + 20);
    uint64_t v27 = v17 + v20;
    uint64_t v28 = **(void **)(result + 56) + v22 * v21 + 4 * *(void *)(result + 36);
    float v29 = (unsigned char *)(v24 + v13);
    uint64_t v30 = v27 - v21;
    LOWORD(a5) = *(_WORD *)(v25 + 140);
    LOWORD(a6) = *(_WORD *)(v25 + 144);
    LOWORD(a7) = *(_WORD *)(v25 + 146);
    LOWORD(a8) = *(_WORD *)(v25 + 148);
    LOWORD(a9) = *(_WORD *)(v25 + 150);
    float v31 = 8191.0 / (float)*(unsigned int *)(v25 + 128);
    *(float *)v9.i32 = (float)LODWORD(a5);
    float v32 = (float)LODWORD(a6);
    float v33 = (float)LODWORD(a7);
    float v34 = (float)LODWORD(a8);
    float v35 = (float)LODWORD(a9);
    LOWORD(a9) = *(_WORD *)(v25 + 152);
    float v36 = (float)LODWORD(a9);
    float v37 = *(float *)(v25 + 36);
    float v38 = *(float *)(v25 + 40);
    float v39 = *(float *)(v25 + 44);
    float v102 = *(float *)(v25 + 48) * 0.5;
    float v101 = *(float *)(v25 + 52) * 0.5;
    float v100 = *(float *)(v25 + 56) * 0.5;
    float v99 = *(float *)(v25 + 60) * 0.5;
    float v98 = *(float *)(v25 + 64) * 0.5;
    float v40 = *(float *)(v25 + 72);
    float v97 = *(float *)(v25 + 68) * 0.5;
    float v41 = *(float *)(v25 + 76);
    float v42 = *(float *)(v25 + 80);
    float v43 = *(float *)(v25 + 84);
    float v44 = *(float *)(v25 + 88);
    float v45 = *(float *)(v25 + 92);
    float v46 = *(float *)(v25 + 96);
    uint64_t v47 = v25 + 164;
    uint64_t v48 = v25 + 16548;
    float v50 = *(float *)(v25 + 100);
    float v49 = *(float *)(v25 + 104);
    float32x2_t v51 = (float32x2_t)vdup_lane_s32(v9, 0);
    double result = 85;
    float32x2_t v52 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v26)
      {
        unint64_t v53 = 0;
        unint64_t v54 = (unsigned int *)v28;
        uint64_t v55 = v18;
        float32x2_t v56 = v29;
        do
        {
          unsigned int v57 = *v54;
          unsigned __int32 v58 = v54[1];
          _D6 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v54), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v51), v31), 0), v52)));
          _D6.i16[0] = *(_WORD *)(v47 + 2 * _D6.u32[0]);
          __asm { FCVT            S6, H6 }
          _H18 = *(_WORD *)(v47 + 2 * _D6.u32[1]);
          v65.i32[0] = *v54;
          v65.i32[1] = v58 >> 20;
          _D19 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v65, (int8x8_t)0x300000003)), v51), v31), 0), v52)));
          _D19.i16[0] = *(_WORD *)(v47 + 2 * _D19.u32[0]);
          __asm
          {
            FCVT            S18, H18
            FCVT            S19, H19
          }
          _H20 = *(_WORD *)(v47 + 2 * _D19.u32[1]);
          __asm { FCVT            S20, H20 }
          v70.i32[0] = v58 >> 10;
          v70.i32[1] = v58;
          _D15 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v70, (int8x8_t)0x300000003)), v51), v31), 0), v52)));
          _D15.i16[0] = *(_WORD *)(v47 + 2 * _D15.u32[0]);
          __asm { FCVT            S15, H15 }
          _S22 = (float)((float)(v41 * _S18) + (float)(*(float *)_D6.i32 * v40)) + (float)(*(float *)_D19.i32 * v42);
          _S24 = (float)((float)(v44 * _S18) + (float)(*(float *)_D6.i32 * v43)) + (float)(*(float *)_D19.i32 * v45);
          *(float *)_D6.i32 = (float)((float)(v50 * _S18) + (float)(*(float *)_D6.i32 * v46))
                            + (float)(*(float *)_D19.i32 * v49);
          _S18 = (float)(v41 * *(float *)_D15.i32) + (float)(_S20 * v40);
          *(float *)_D19.i32 = (float)(v44 * *(float *)_D15.i32) + (float)(_S20 * v43);
          float v75 = (float)(v50 * *(float *)_D15.i32) + (float)(_S20 * v46);
          _D15.i16[0] = *(_WORD *)(v47 + 2 * _D15.u32[1]);
          __asm { FCVT            S15, H15 }
          *(float *)_D19.i32 = *(float *)_D19.i32 + (float)(*(float *)_D15.i32 * v45);
          LOWORD(_S22) = *(_WORD *)(v48 + 2 * llroundf(fminf(fmaxf(_S22, 0.0), 8191.0)));
          float v76 = v75 + (float)(*(float *)_D15.i32 * v49);
          __asm { FCVT            S22, H22 }
          LOWORD(_S24) = *(_WORD *)(v48 + 2 * llroundf(fminf(fmaxf(_S24, 0.0), 8191.0)));
          unsigned int v78 = llroundf(fminf(fmaxf(*(float *)_D6.i32, 0.0), 8191.0));
          __asm { FCVT            S6, H24 }
          LOWORD(_S24) = *(_WORD *)(v48 + 2 * v78);
          __asm { FCVT            S24, H24 }
          LOWORD(_S18) = *(_WORD *)(v48
                                  + 2 * llroundf(fminf(fmaxf(_S18 + (float)(*(float *)_D15.i32 * v42), 0.0), 8191.0)));
          __asm { FCVT            S15, H18 }
          LOWORD(_S18) = *(_WORD *)(v48 + 2 * llroundf(fminf(fmaxf(*(float *)_D19.i32, 0.0), 8191.0)));
          __asm { FCVT            S18, H18 }
          unsigned int v82 = llroundf(fminf(fmaxf(v76, 0.0), 8191.0));
          float v83 = (float)(v38 * *(float *)_D6.i32) + (float)(v37 * _S22);
          *(float *)_D19.i32 = _S22 + _S15;
          *(float *)_D6.i32 = *(float *)_D6.i32 + _S18;
          float v84 = (float)(v33 + (float)((float)(_S22 + _S15) * v102)) + (float)(*(float *)_D6.i32 * v101);
          *(float *)_D6.i32 = (float)(v33 + (float)(*(float *)_D19.i32 * v99)) + (float)(*(float *)_D6.i32 * v98);
          _D19.i16[0] = *(_WORD *)(v48 + 2 * v82);
          __asm { FCVT            S19, H19 }
          float v86 = v83 + (float)(v39 * _S24);
          float v87 = v84 + (float)((float)(_S24 + _S19) * v100);
          float v88 = *(float *)_D6.i32 + (float)((float)(_S24 + _S19) * v97);
          if (v87 < v35) {
            float v89 = v35;
          }
          else {
            float v89 = v87;
          }
          BOOL v90 = v87 <= v36;
          float v91 = v86 + v32;
          if (!v90) {
            float v89 = v36;
          }
          char v92 = llroundf(v89);
          if (v91 < v32) {
            float v93 = v32;
          }
          else {
            float v93 = v86 + v32;
          }
          unsigned char *v56 = v92;
          if (v91 > v34) {
            float v93 = v34;
          }
          v56[1] = llroundf(v93);
          float v94 = v36;
          if (v88 <= v36)
          {
            float v94 = v88;
            if (v88 < v35) {
              float v94 = v35;
            }
          }
          float v95 = (float)((float)((float)(v38 * _S18) + (float)(v37 * _S15)) + (float)(v39 * _S19)) + v32;
          v56[2] = llroundf(v94);
          float v96 = v34;
          if (v95 <= v34)
          {
            float v96 = v95;
            if (v95 < v32) {
              float v96 = v32;
            }
          }
          v56[3] = llroundf(v96);
          if (v55)
          {
            *uint64_t v55 = 85 * (v57 >> 30);
            v55[1] = 85 * (v58 >> 30);
            v55 += 2;
          }
          v53 += 2;
          v54 += 2;
          v56 += 4;
        }
        while (v26 > v53);
      }
      v28 += v22;
      v29 += v23;
      ++v19;
    }
    while (v19 != v30);
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_2vuyf(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_2vuyf_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_rgb_2vuyf_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, float a8, float a9)
{
  uint64_t v9 = *(void *)(result + 28);
  unint64_t v10 = *result;
  unint64_t v11 = v9 * a2 / v10;
  uint64_t v12 = *((void *)result + 14);
  int64x2_t v13 = (void *)*((void *)result + 16);
  unint64_t v14 = *((void *)result + 13) * a2 / v10 + *((void *)result + 15);
  unint64_t v15 = (uint64_t *)*((void *)result + 17);
  unint64_t v16 = (v9 + v9 * a2) / v10;
  uint64_t v17 = (unsigned char *)v13[1];
  if (v17) {
    v17 += v15[1] * v14 + v12;
  }
  if (v16 != v11)
  {
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)(result + 44);
    uint64_t v20 = v11 + v19;
    uint64_t v21 = **((void **)result + 8);
    uint64_t v22 = *v15;
    uint64_t v23 = *v13 + v22 * v14;
    uint64_t v24 = *((void *)result + 19);
    unint64_t v25 = *(void *)(result + 20);
    uint64_t v26 = v16 + v19;
    uint64_t v27 = **((void **)result + 7) + v21 * v20 + 4 * *(void *)(result + 36);
    uint64_t v28 = (unsigned char *)(v23 + v12);
    uint64_t v29 = v26 - v20;
    *(float *)&unsigned int v30 = (float)*(unsigned int *)(v24 + 136);
    float v31 = *(float *)&v30 / (float)*(unsigned int *)(v24 + 128);
    LOWORD(v30) = *(_WORD *)(v24 + 140);
    float v32 = (float)v30;
    LOWORD(a5) = *(_WORD *)(v24 + 144);
    float v33 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v24 + 146);
    float v34 = (float)LODWORD(a6);
    LOWORD(a7) = *(_WORD *)(v24 + 148);
    float v35 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v24 + 150);
    float v36 = (float)LODWORD(a8);
    LOWORD(a9) = *(_WORD *)(v24 + 152);
    float v37 = (float)LODWORD(a9);
    float v38 = *(float *)(v24 + 36);
    float v39 = *(float *)(v24 + 40);
    float v40 = *(float *)(v24 + 44);
    float v41 = *(float *)(v24 + 48) * 0.5;
    float v42 = *(float *)(v24 + 52) * 0.5;
    float v43 = *(float *)(v24 + 56) * 0.5;
    float v44 = *(float *)(v24 + 60) * 0.5;
    float v45 = *(float *)(v24 + 64) * 0.5;
    float v46 = *(float *)(v24 + 68) * 0.5;
    do
    {
      if (v25)
      {
        unint64_t v47 = 0;
        double result = (unsigned __int8 *)v27;
        uint64_t v48 = v17;
        float v49 = v28;
        do
        {
          unsigned int v50 = *(_DWORD *)result;
          unsigned int v51 = *((_DWORD *)result + 1);
          float v52 = v31 * (float)((float)(*(_DWORD *)result & 0x3FF) - v32);
          float v53 = v31 * (float)((float)((*(_DWORD *)result >> 10) & 0x3FF) - v32);
          float v54 = v31 * (float)((float)((*(_DWORD *)result >> 20) & 0x3FF) - v32);
          float v55 = v31 * (float)((float)(v51 & 0x3FF) - v32);
          float v56 = v31 * (float)((float)((v51 >> 10) & 0x3FF) - v32);
          float v57 = v31 * (float)((float)((v51 >> 20) & 0x3FF) - v32);
          float v58 = (float)((float)((float)(v39 * v53) + (float)(v38 * v54)) + (float)(v40 * v52)) + v33;
          float v59 = v54 + v57;
          float v60 = v53 + v56;
          float v61 = v52 + v55;
          float v62 = (float)((float)(v34 + (float)(v59 * v41)) + (float)(v60 * v42)) + (float)(v61 * v43);
          float v63 = (float)((float)(v34 + (float)(v59 * v44)) + (float)(v60 * v45)) + (float)(v61 * v46);
          if (v62 < v36) {
            float v64 = v36;
          }
          else {
            float v64 = v62;
          }
          if (v62 > v37) {
            float v64 = v37;
          }
          *float v49 = llroundf(v64);
          if (v58 < v33) {
            float v65 = v33;
          }
          else {
            float v65 = v58;
          }
          if (v58 > v35) {
            float v65 = v35;
          }
          v49[1] = llroundf(v65);
          float v66 = v37;
          if (v63 <= v37)
          {
            float v66 = v63;
            if (v63 < v36) {
              float v66 = v36;
            }
          }
          float v67 = (float)((float)((float)(v39 * v56) + (float)(v38 * v57)) + (float)(v40 * v55)) + v33;
          v49[2] = llroundf(v66);
          float v68 = v35;
          if (v67 <= v35)
          {
            float v68 = v67;
            if (v67 < v33) {
              float v68 = v33;
            }
          }
          v49[3] = llroundf(v68);
          if (v48)
          {
            *uint64_t v48 = 85 * (v50 >> 30);
            v48[1] = 85 * (v51 >> 30);
            v48 += 2;
          }
          v47 += 2;
          result += 8;
          v49 += 4;
        }
        while (v25 > v47);
      }
      v27 += v21;
      v28 += v22;
      ++v18;
    }
    while (v18 != v29);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_yuvsf(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_yuvsf_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_yuvsf_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, double a6, float a7, float a8, float a9, float a10)
{
  uint64_t v11 = *(void *)(result + 28);
  unint64_t v12 = *result;
  unint64_t v13 = v11 * a2 / v12;
  uint64_t v14 = *((void *)result + 14);
  unint64_t v15 = (void *)*((void *)result + 16);
  unint64_t v16 = *((void *)result + 13) * a2 / v12 + *((void *)result + 15);
  uint64_t v17 = (uint64_t *)*((void *)result + 17);
  unint64_t v18 = (v11 + v11 * a2) / v12;
  uint64_t v19 = (unsigned char *)v15[1];
  if (v19) {
    v19 += v17[1] * v16 + v14;
  }
  if (v18 != v13)
  {
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)(result + 44);
    uint64_t v22 = v13 + v21;
    uint64_t v23 = **((void **)result + 8);
    uint64_t v24 = *v17;
    uint64_t v25 = *((void *)result + 19);
    uint64_t v26 = *v15 + v24 * v16;
    uint64_t v27 = v18 + v21;
    uint64_t v28 = **((void **)result + 7) + v23 * v22 + 4 * *(void *)(result + 36);
    uint64_t v29 = (unsigned char *)(v26 + v14);
    uint64_t v30 = v27 - v22;
    LOWORD(a5) = *(_WORD *)(v25 + 140);
    LOWORD(a7) = *(_WORD *)(v25 + 144);
    LOWORD(a8) = *(_WORD *)(v25 + 146);
    LOWORD(a9) = *(_WORD *)(v25 + 148);
    LOWORD(a10) = *(_WORD *)(v25 + 150);
    LOWORD(v10) = *(_WORD *)(v25 + 152);
    float v31 = 8191.0 / (float)*(unsigned int *)(v25 + 128);
    *(float *)&a3 = (float)LODWORD(a5);
    float v32 = (float)LODWORD(a7);
    float v123 = (float)LODWORD(a8);
    float v33 = (float)LODWORD(a9);
    float v122 = (float)LODWORD(a10);
    float v34 = (float)v10;
    float v35 = *(float *)(v25 + 36);
    float v36 = *(float *)(v25 + 40);
    float v37 = *(float *)(v25 + 44);
    float v121 = *(float *)(v25 + 48) * 0.5;
    float v120 = *(float *)(v25 + 52) * 0.5;
    float v119 = *(float *)(v25 + 56) * 0.5;
    float v118 = *(float *)(v25 + 60) * 0.5;
    float v117 = *(float *)(v25 + 64) * 0.5;
    float v38 = *(float *)(v25 + 72);
    float v116 = *(float *)(v25 + 68) * 0.5;
    float v39 = *(float *)(v25 + 76);
    float v40 = *(float *)(v25 + 80);
    float v41 = *(float *)(v25 + 84);
    float v42 = *(float *)(v25 + 88);
    float v43 = *(float *)(v25 + 92);
    float v44 = *(float *)(v25 + 96);
    float v46 = *(float *)(v25 + 100);
    float v45 = *(float *)(v25 + 104);
    uint64_t v47 = v25 + 164;
    uint64_t v48 = v25 + 16548;
    uint64_t v49 = v25 + 32932;
    float v50 = *(float *)(v25 + 108);
    float v51 = *(float *)(v25 + 112);
    float v52 = *(float *)(v25 + 116);
    float v53 = *(float *)(v25 + 120);
    double result = *(unsigned __int8 **)(result + 20);
    float32x2_t v54 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a3, 0);
    do
    {
      if (result)
      {
        unint64_t v55 = 0;
        float v56 = v19;
        float v57 = v29;
        float v58 = (unsigned int *)v28;
        do
        {
          unsigned int v59 = *v58;
          unsigned int v60 = v58[1];
          float32x2_t v61 = (float32x2_t)vdup_n_s32(0x45FFF800u);
          _D0 = (int8x8_t)vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v58), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v54), v31), 0), v61)));
          _D0.i16[0] = *(_WORD *)(v47 + 2 * _D0.u32[0]);
          __asm { FCVT            S19, H0 }
          _D0.i16[0] = *(_WORD *)(v47 + 2 * _D0.u32[1]);
          __asm { FCVT            S20, H0 }
          _D0.i32[0] = *v58;
          _D0.i32[1] = v60 >> 20;
          int32x2_t v69 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D0, (int8x8_t)0x300000003)), v54), v31), 0), v61)));
          _D0.i16[0] = *(_WORD *)(v47 + 2 * v69.u32[0]);
          __asm { FCVT            S21, H0 }
          float v71 = (float)((float)((float)(v51 * _S20) + (float)(v50 * _S19)) + (float)(v52 * _S21))
              + (float)(v53 * fmaxf(_S19, fmaxf(_S20, _S21)));
          float v72 = 8191.0;
          if (v71 <= 8191.0)
          {
            float v72 = v71;
            if (v71 < 0.0) {
              float v72 = 0.0;
            }
          }
          _H5 = *(_WORD *)(v47 + 2 * v69.u32[1]);
          __asm { FCVT            S5, H5 }
          _D24.i32[0] = v60 >> 10;
          _D24.i32[1] = v58[1];
          _D22 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D24, (int8x8_t)0x300000003)), v54), v31), 0), v61)));
          _D22.i16[0] = *(_WORD *)(v47 + 2 * _D22.u32[0]);
          __asm { FCVT            S22, H22 }
          _D24.i16[0] = *(_WORD *)(v47 + 2 * _D22.u32[1]);
          __asm { FCVT            S13, H24 }
          float v79 = (float)((float)((float)(v51 * _S22) + (float)(v50 * _S5)) + (float)(v52 * _S13))
              + (float)(v53 * fmaxf(_S5, fmaxf(_S22, _S13)));
          float v80 = 8191.0;
          if (v79 <= 8191.0)
          {
            float v80 = v79;
            if (v79 < 0.0) {
              float v80 = 0.0;
            }
          }
          _H0 = *(_WORD *)(v48 + 2 * llroundf(v72));
          __asm { FCVT            S0, H0 }
          float v83 = _S19 * _S0;
          float v84 = _S20 * _S0;
          _H24 = *(_WORD *)(v48 + 2 * llroundf(v80));
          float v86 = _S21 * _S0;
          __asm { FCVT            S21, H24 }
          _S5 = _S5 * _S21;
          float v89 = _S22 * _S21;
          float v90 = _S13 * _S21;
          float v91 = (float)((float)(v39 * v84) + (float)(v83 * v38)) + (float)(v86 * v40);
          float v92 = (float)((float)(v42 * v84) + (float)(v83 * v41)) + (float)(v86 * v43);
          _S0 = (float)((float)(v46 * v84) + (float)(v83 * v44)) + (float)(v86 * v45);
          _S19 = (float)((float)(v39 * v89) + (float)(_S5 * v38)) + (float)(v90 * v40);
          float v95 = (float)((float)(v42 * v89) + (float)(_S5 * v41)) + (float)(v90 * v43);
          float v96 = (float)((float)(v46 * v89) + (float)(_S5 * v44)) + (float)(v90 * v45);
          LOWORD(_S5) = *(_WORD *)(v49 + 2 * llroundf(fminf(fmaxf(v91, 0.0), 8191.0)));
          __asm { FCVT            S22, H5 }
          LOWORD(_S5) = *(_WORD *)(v49 + 2 * llroundf(fminf(fmaxf(v92, 0.0), 8191.0)));
          LOWORD(_S0) = *(_WORD *)(v49 + 2 * llroundf(fminf(fmaxf(_S0, 0.0), 8191.0)));
          __asm
          {
            FCVT            S24, H5
            FCVT            S13, H0
          }
          LOWORD(_S0) = *(_WORD *)(v49 + 2 * llroundf(fminf(fmaxf(_S19, 0.0), 8191.0)));
          __asm { FCVT            S0, H0 }
          LOWORD(_S5) = *(_WORD *)(v49 + 2 * llroundf(fminf(fmaxf(v95, 0.0), 8191.0)));
          __asm { FCVT            S5, H5 }
          LOWORD(_S19) = *(_WORD *)(v49 + 2 * llroundf(fminf(fmaxf(v96, 0.0), 8191.0)));
          __asm { FCVT            S19, H19 }
          float v103 = (float)((float)((float)(v36 * _S24) + (float)(v35 * _S22)) + (float)(v37 * _S13)) + v32;
          float v104 = _S22 + _S0;
          float v105 = _S24 + _S5;
          float v106 = (float)(v123 + (float)((float)(_S22 + _S0) * v121)) + (float)((float)(_S24 + _S5) * v120);
          float v107 = _S13 + _S19;
          float v108 = v106 + (float)((float)(_S13 + _S19) * v119);
          if (v103 < v32) {
            float v109 = v32;
          }
          else {
            float v109 = v103;
          }
          if (v103 > v33) {
            float v109 = v33;
          }
          *float v57 = llroundf(v109);
          float v110 = v34;
          if (v108 <= v34)
          {
            float v110 = v108;
            if (v108 < v122) {
              float v110 = v122;
            }
          }
          float v111 = (float)((float)((float)(v36 * _S5) + (float)(v35 * _S0)) + (float)(v37 * _S19)) + v32;
          float v112 = (float)((float)(v123 + (float)(v104 * v118)) + (float)(v105 * v117)) + (float)(v107 * v116);
          v57[1] = llroundf(v110);
          if (v111 < v32) {
            float v113 = v32;
          }
          else {
            float v113 = v111;
          }
          if (v111 <= v33) {
            float v114 = v113;
          }
          else {
            float v114 = v33;
          }
          v57[2] = llroundf(v114);
          float v115 = v34;
          if (v112 <= v34)
          {
            float v115 = (float)((float)(v123 + (float)(v104 * v118)) + (float)(v105 * v117)) + (float)(v107 * v116);
            if (v112 < v122) {
              float v115 = v122;
            }
          }
          v57[3] = llroundf(v115);
          if (v56)
          {
            unsigned char *v56 = 85 * (v59 >> 30);
            v56[1] = 85 * (v60 >> 30);
            v56 += 2;
          }
          v55 += 2;
          v58 += 2;
          v57 += 4;
        }
        while ((unint64_t)result > v55);
      }
      v28 += v23;
      v29 += v24;
      ++v20;
    }
    while (v20 != v30);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_yuvsf(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_yuvsf_GCD);
  return 0;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_yuvsf_GCD(uint64_t result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, float a8, float a9)
{
  uint64_t v10 = *(void *)(result + 28);
  unint64_t v11 = *(unsigned __int8 *)result;
  unint64_t v12 = v10 * a2 / v11;
  uint64_t v13 = *(void *)(result + 112);
  uint64_t v14 = *(void **)(result + 128);
  unint64_t v15 = *(void *)(result + 104) * a2 / v11 + *(void *)(result + 120);
  unint64_t v16 = *(uint64_t **)(result + 136);
  unint64_t v17 = (v10 + v10 * a2) / v11;
  uint64_t v18 = (unsigned char *)v14[1];
  if (v18) {
    v18 += v16[1] * v15 + v13;
  }
  if (v17 != v12)
  {
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)(result + 44);
    uint64_t v21 = v12 + v20;
    uint64_t v22 = **(void **)(result + 64);
    uint64_t v23 = *v16;
    uint64_t v24 = *v14 + v23 * v15;
    uint64_t v25 = *(void *)(result + 152);
    unint64_t v26 = *(void *)(result + 20);
    uint64_t v27 = v17 + v20;
    uint64_t v28 = **(void **)(result + 56) + v22 * v21 + 4 * *(void *)(result + 36);
    uint64_t v29 = (unsigned char *)(v24 + v13);
    uint64_t v30 = v27 - v21;
    LOWORD(a5) = *(_WORD *)(v25 + 140);
    LOWORD(a6) = *(_WORD *)(v25 + 144);
    LOWORD(a7) = *(_WORD *)(v25 + 146);
    LOWORD(a8) = *(_WORD *)(v25 + 148);
    LOWORD(a9) = *(_WORD *)(v25 + 150);
    float v31 = 8191.0 / (float)*(unsigned int *)(v25 + 128);
    *(float *)v9.i32 = (float)LODWORD(a5);
    float v32 = (float)LODWORD(a6);
    float v33 = (float)LODWORD(a7);
    float v34 = (float)LODWORD(a8);
    float v103 = (float)LODWORD(a9);
    LOWORD(a9) = *(_WORD *)(v25 + 152);
    float v35 = (float)LODWORD(a9);
    float v36 = *(float *)(v25 + 36);
    float v37 = *(float *)(v25 + 40);
    float v38 = *(float *)(v25 + 44);
    float v102 = *(float *)(v25 + 48) * 0.5;
    float v101 = *(float *)(v25 + 52) * 0.5;
    float v100 = *(float *)(v25 + 56) * 0.5;
    float v99 = *(float *)(v25 + 60) * 0.5;
    float v98 = *(float *)(v25 + 64) * 0.5;
    float v39 = *(float *)(v25 + 72);
    float v97 = *(float *)(v25 + 68) * 0.5;
    float v40 = *(float *)(v25 + 76);
    float v41 = *(float *)(v25 + 80);
    float v42 = *(float *)(v25 + 84);
    float v43 = *(float *)(v25 + 88);
    float v44 = *(float *)(v25 + 92);
    float v45 = *(float *)(v25 + 96);
    uint64_t v46 = v25 + 164;
    uint64_t v47 = v25 + 16548;
    float v49 = *(float *)(v25 + 100);
    float v48 = *(float *)(v25 + 104);
    float32x2_t v50 = (float32x2_t)vdup_lane_s32(v9, 0);
    double result = 85;
    float32x2_t v51 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v26)
      {
        unint64_t v52 = 0;
        float v53 = (unsigned int *)v28;
        float32x2_t v54 = v18;
        unint64_t v55 = v29;
        do
        {
          unsigned int v56 = *v53;
          unsigned __int32 v57 = v53[1];
          _D6 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v53), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v50), v31), 0), v51)));
          _D6.i16[0] = *(_WORD *)(v46 + 2 * _D6.u32[0]);
          __asm { FCVT            S6, H6 }
          _H18 = *(_WORD *)(v46 + 2 * _D6.u32[1]);
          __asm { FCVT            S18, H18 }
          v65.i32[0] = *v53;
          v65.i32[1] = v57 >> 20;
          _D19 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v65, (int8x8_t)0x300000003)), v50), v31), 0), v51)));
          _D19.i16[0] = *(_WORD *)(v46 + 2 * _D19.u32[0]);
          __asm { FCVT            S19, H19 }
          _H20 = *(_WORD *)(v46 + 2 * _D19.u32[1]);
          v68.i32[0] = v57 >> 10;
          v68.i32[1] = v57;
          _D21 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v68, (int8x8_t)0x300000003)), v50), v31), 0), v51)));
          _D21.i16[0] = *(_WORD *)(v46 + 2 * _D21.u32[0]);
          __asm
          {
            FCVT            S20, H20
            FCVT            S21, H21
          }
          _H22 = *(_WORD *)(v46 + 2 * _D21.u32[1]);
          __asm { FCVT            S22, H22 }
          float v73 = (float)((float)(v40 * _S18) + (float)(*(float *)_D6.i32 * v39)) + (float)(*(float *)_D19.i32 * v41);
          float v74 = (float)((float)(v43 * _S18) + (float)(*(float *)_D6.i32 * v42)) + (float)(*(float *)_D19.i32 * v44);
          *(float *)_D6.i32 = (float)((float)(v49 * _S18) + (float)(*(float *)_D6.i32 * v45))
                            + (float)(*(float *)_D19.i32 * v48);
          _S18 = (float)((float)(v40 * *(float *)_D21.i32) + (float)(_S20 * v39)) + (float)(_S22 * v41);
          *(float *)_D19.i32 = (float)((float)(v43 * *(float *)_D21.i32) + (float)(_S20 * v42)) + (float)(_S22 * v44);
          float v76 = (float)((float)(v49 * *(float *)_D21.i32) + (float)(_S20 * v45)) + (float)(_S22 * v48);
          _D21.i16[0] = *(_WORD *)(v47 + 2 * llroundf(fminf(fmaxf(v73, 0.0), 8191.0)));
          __asm { FCVT            S21, H21 }
          LOWORD(_S22) = *(_WORD *)(v47 + 2 * llroundf(fminf(fmaxf(v74, 0.0), 8191.0)));
          _D6.i16[0] = *(_WORD *)(v47 + 2 * llroundf(fminf(fmaxf(*(float *)_D6.i32, 0.0), 8191.0)));
          __asm
          {
            FCVT            S22, H22
            FCVT            S6, H6
          }
          LOWORD(_S18) = *(_WORD *)(v47 + 2 * llroundf(fminf(fmaxf(_S18, 0.0), 8191.0)));
          __asm { FCVT            S15, H18 }
          LOWORD(_S18) = *(_WORD *)(v47 + 2 * llroundf(fminf(fmaxf(*(float *)_D19.i32, 0.0), 8191.0)));
          __asm { FCVT            S18, H18 }
          _D19.i16[0] = *(_WORD *)(v47 + 2 * llroundf(fminf(fmaxf(v76, 0.0), 8191.0)));
          __asm { FCVT            S19, H19 }
          float v83 = (float)((float)((float)(v37 * _S22) + (float)(v36 * _S21)) + (float)(v38 * _S6)) + v32;
          float v84 = _S21 + _S15;
          if (v83 < v32) {
            float v85 = v32;
          }
          else {
            float v85 = (float)((float)((float)(v37 * _S22) + (float)(v36 * _S21)) + (float)(v38 * _S6)) + v32;
          }
          BOOL v86 = v83 <= v34;
          float v87 = _S22 + _S18;
          float v88 = (float)(v33 + (float)(v84 * v102)) + (float)((float)(_S22 + _S18) * v101);
          float v89 = _S6 + _S19;
          float v90 = v88 + (float)((float)(_S6 + _S19) * v100);
          if (!v86) {
            float v85 = v34;
          }
          *unint64_t v55 = llroundf(v85);
          float v91 = v35;
          if (v90 <= v35)
          {
            float v91 = v90;
            if (v90 < v103) {
              float v91 = v103;
            }
          }
          float v92 = (float)((float)((float)(v37 * _S18) + (float)(v36 * _S15)) + (float)(v38 * _S19)) + v32;
          float v93 = (float)((float)(v33 + (float)(v84 * v99)) + (float)(v87 * v98)) + (float)(v89 * v97);
          v55[1] = llroundf(v91);
          if (v92 < v32) {
            float v94 = v32;
          }
          else {
            float v94 = v92;
          }
          if (v92 <= v34) {
            float v95 = v94;
          }
          else {
            float v95 = v34;
          }
          v55[2] = llroundf(v95);
          float v96 = v35;
          if (v93 <= v35)
          {
            float v96 = (float)((float)(v33 + (float)(v84 * v99)) + (float)(v87 * v98)) + (float)(v89 * v97);
            if (v93 < v103) {
              float v96 = v103;
            }
          }
          v55[3] = llroundf(v96);
          if (v54)
          {
            unsigned char *v54 = 85 * (v56 >> 30);
            v54[1] = 85 * (v57 >> 30);
            v54 += 2;
          }
          v52 += 2;
          v53 += 2;
          v55 += 4;
        }
        while (v26 > v52);
      }
      v28 += v22;
      v29 += v23;
      ++v19;
    }
    while (v19 != v30);
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_yuvsf(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_yuvsf_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_rgb_yuvsf_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, float a8, float a9)
{
  uint64_t v9 = *(void *)(result + 28);
  unint64_t v10 = *result;
  unint64_t v11 = v9 * a2 / v10;
  uint64_t v12 = *((void *)result + 14);
  int64x2_t v13 = (void *)*((void *)result + 16);
  unint64_t v14 = *((void *)result + 13) * a2 / v10 + *((void *)result + 15);
  unint64_t v15 = (uint64_t *)*((void *)result + 17);
  unint64_t v16 = (v9 + v9 * a2) / v10;
  uint64_t v17 = (unsigned char *)v13[1];
  if (v17) {
    v17 += v15[1] * v14 + v12;
  }
  if (v16 != v11)
  {
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)(result + 44);
    uint64_t v20 = v11 + v19;
    uint64_t v21 = **((void **)result + 8);
    uint64_t v22 = *v15;
    uint64_t v23 = *v13 + v22 * v14;
    uint64_t v24 = *((void *)result + 19);
    unint64_t v25 = *(void *)(result + 20);
    uint64_t v26 = v16 + v19;
    uint64_t v27 = **((void **)result + 7) + v21 * v20 + 4 * *(void *)(result + 36);
    uint64_t v28 = (unsigned char *)(v23 + v12);
    uint64_t v29 = v26 - v20;
    *(float *)&unsigned int v30 = (float)*(unsigned int *)(v24 + 136);
    float v31 = *(float *)&v30 / (float)*(unsigned int *)(v24 + 128);
    LOWORD(v30) = *(_WORD *)(v24 + 140);
    float v32 = (float)v30;
    LOWORD(a5) = *(_WORD *)(v24 + 144);
    float v33 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v24 + 146);
    float v34 = (float)LODWORD(a6);
    LOWORD(a7) = *(_WORD *)(v24 + 148);
    float v35 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v24 + 150);
    float v36 = (float)LODWORD(a8);
    LOWORD(a9) = *(_WORD *)(v24 + 152);
    float v37 = (float)LODWORD(a9);
    float v38 = *(float *)(v24 + 36);
    float v39 = *(float *)(v24 + 40);
    float v40 = *(float *)(v24 + 44);
    float v41 = *(float *)(v24 + 48) * 0.5;
    float v42 = *(float *)(v24 + 52) * 0.5;
    float v43 = *(float *)(v24 + 56) * 0.5;
    float v44 = *(float *)(v24 + 60) * 0.5;
    float v45 = *(float *)(v24 + 64) * 0.5;
    float v46 = *(float *)(v24 + 68) * 0.5;
    do
    {
      if (v25)
      {
        unint64_t v47 = 0;
        double result = (unsigned __int8 *)v27;
        float v48 = v17;
        float v49 = v28;
        do
        {
          unsigned int v50 = *(_DWORD *)result;
          unsigned int v51 = *((_DWORD *)result + 1);
          float v52 = v31 * (float)((float)(*(_DWORD *)result & 0x3FF) - v32);
          float v53 = v31 * (float)((float)((*(_DWORD *)result >> 10) & 0x3FF) - v32);
          float v54 = v31 * (float)((float)((*(_DWORD *)result >> 20) & 0x3FF) - v32);
          float v55 = v31 * (float)((float)(v51 & 0x3FF) - v32);
          float v56 = v31 * (float)((float)((v51 >> 10) & 0x3FF) - v32);
          float v57 = v31 * (float)((float)((v51 >> 20) & 0x3FF) - v32);
          float v58 = (float)((float)((float)(v39 * v53) + (float)(v38 * v54)) + (float)(v40 * v52)) + v33;
          float v59 = (float)((float)((float)(v39 * v56) + (float)(v38 * v57)) + (float)(v40 * v55)) + v33;
          float v60 = v54 + v57;
          float v61 = v53 + v56;
          float v62 = v52 + v55;
          float v63 = (float)((float)(v34 + (float)(v60 * v41)) + (float)(v61 * v42)) + (float)(v62 * v43);
          float v64 = (float)(v34 + (float)(v60 * v44)) + (float)(v61 * v45);
          if (v58 < v33) {
            float v65 = v33;
          }
          else {
            float v65 = v58;
          }
          if (v58 > v35) {
            float v65 = v35;
          }
          float v66 = v64 + (float)(v62 * v46);
          *float v49 = llroundf(v65);
          if (v63 < v36) {
            float v67 = v36;
          }
          else {
            float v67 = v63;
          }
          if (v63 > v37) {
            float v67 = v37;
          }
          v49[1] = llroundf(v67);
          if (v59 < v33) {
            float v68 = v33;
          }
          else {
            float v68 = v59;
          }
          if (v59 > v35) {
            float v68 = v35;
          }
          v49[2] = llroundf(v68);
          float v69 = v37;
          if (v66 <= v37)
          {
            float v69 = v66;
            if (v66 < v36) {
              float v69 = v36;
            }
          }
          v49[3] = llroundf(v69);
          if (v48)
          {
            *float v48 = 85 * (v50 >> 30);
            v48[1] = 85 * (v51 >> 30);
            v48 += 2;
          }
          v47 += 2;
          result += 8;
          v49 += 4;
        }
        while (v25 > v47);
      }
      v27 += v21;
      v28 += v22;
      ++v18;
    }
    while (v18 != v29);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_xf422(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v12 = a2[2];
  uint64_t v11 = a2[3];
  uint64_t v13 = a2[4];
  uint64_t v14 = a2[5];
  uint64_t v15 = *a6;
  uint64_t v16 = a6[1];
  uint64_t v18 = a6[2];
  uint64_t v17 = a6[3];
  uint64_t v20 = a6[4];
  uint64_t v19 = a6[5];
  if (v20)
  {
    ++v20;
    ++v13;
    if (v18)
    {
      --v18;
      --v12;
    }
    else
    {
      v18 -= 2;
      v12 -= 2;
    }
  }
  memset(v27, 0, 32);
  if (v13 + v12 <= v9) {
    uint64_t v21 = v12;
  }
  else {
    uint64_t v21 = v9 - v13;
  }
  memset(&v27[32], 0, 24);
  if (v20 + v18 > v15) {
    uint64_t v18 = v15 - v20;
  }
  size_t v22 = *(unsigned __int8 *)(a1 + 162);
  v27[0] = *(unsigned char *)(a1 + 162);
  if (v14 + v11 > v10) {
    uint64_t v11 = v10 - v14;
  }
  *(void *)&v27[4] = v9;
  *(void *)&v27[12] = v10;
  if (v19 + v17 <= v16) {
    uint64_t v23 = v17;
  }
  else {
    uint64_t v23 = v16 - v19;
  }
  if (v21 >= v18) {
    uint64_t v24 = v18;
  }
  else {
    uint64_t v24 = v21;
  }
  *(void *)&v27[20] = v24;
  if (v11 < v23) {
    uint64_t v23 = v11;
  }
  *(void *)&v27[28] = v23;
  *(void *)&v27[36] = v13;
  *(void *)&v27[44] = v14;
  uint64_t v31 = v15;
  uint64_t v32 = v16;
  uint64_t v33 = v24;
  uint64_t v34 = v23;
  uint64_t v35 = v20;
  uint64_t v36 = v19;
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v39 = a9;
  uint64_t v40 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v22, global_queue, v27, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_xf422_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_xf422_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, double a6, float a7, float a8)
{
  uint64_t v8 = *(void *)(result + 28);
  unint64_t v9 = *result;
  unint64_t v10 = v8 * a2 / v9;
  unint64_t v11 = (v8 + v8 * a2) / v9;
  if (v11 != v10)
  {
    uint64_t v12 = 0;
    unint64_t v13 = *(void *)(result + 20);
    unint64_t v14 = v10 + *(void *)(result + 44);
    unint64_t v15 = v11 - v10;
    uint64_t v16 = *((void *)result + 19);
    uint64_t v17 = (uint64_t *)*((void *)result + 17);
    uint64_t v18 = (void *)*((void *)result + 7);
    uint64_t v19 = **((void **)result + 8);
    uint64_t v20 = *v17;
    uint64_t v21 = v17[1];
    uint64_t v22 = v17[2];
    *(float *)&unsigned int v23 = (float)*(unsigned int *)(v16 + 128);
    float v24 = 8191.0 / *(float *)&v23;
    LOWORD(v23) = *(_WORD *)(v16 + 140);
    *(float *)&a3 = (float)v23;
    LOWORD(a5) = *(_WORD *)(v16 + 144);
    float v25 = (float)LODWORD(a5);
    LOWORD(a7) = *(_WORD *)(v16 + 146);
    float v26 = (float)LODWORD(a7);
    LOWORD(a7) = *(_WORD *)(v16 + 148);
    float v27 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v16 + 150);
    *(float *)&unsigned int v28 = (float)LODWORD(a8);
    float v131 = *(float *)&v28;
    LOWORD(v28) = *(_WORD *)(v16 + 152);
    float v29 = (float)v28;
    float v30 = *(float *)(v16 + 40);
    float v130 = *(float *)(v16 + 36);
    float v31 = *(float *)(v16 + 44);
    float v129 = *(float *)(v16 + 48) * 0.5;
    float v128 = *(float *)(v16 + 52) * 0.5;
    float v127 = *(float *)(v16 + 56) * 0.5;
    float v126 = *(float *)(v16 + 60) * 0.5;
    float v125 = *(float *)(v16 + 64) * 0.5;
    float v32 = *(float *)(v16 + 72);
    float v124 = *(float *)(v16 + 68) * 0.5;
    float v33 = *(float *)(v16 + 76);
    float v34 = *(float *)(v16 + 80);
    float v35 = *(float *)(v16 + 84);
    float v36 = *(float *)(v16 + 88);
    float v37 = *(float *)(v16 + 92);
    float v38 = *(float *)(v16 + 96);
    float v40 = *(float *)(v16 + 100);
    float v39 = *(float *)(v16 + 104);
    uint64_t v41 = v16 + 164;
    uint64_t v42 = v16 + 16548;
    uint64_t v43 = v16 + 32932;
    float v44 = *(float *)(v16 + 108);
    float v45 = *(float *)(v16 + 112);
    float v46 = *(float *)(v16 + 116);
    float v47 = *(float *)(v16 + 120);
    uint64_t v48 = *((void *)result + 14);
    float v49 = (void *)*((void *)result + 16);
    unint64_t v50 = *((void *)result + 13) * a2 / v9 + *((void *)result + 15);
    uint64_t v51 = *(void *)(result + 36);
    unsigned int v52 = *(unsigned __int8 *)(v16 + 132);
    if (v52 >= 0x11) {
      char v53 = 0;
    }
    else {
      char v53 = 16 - v52;
    }
    uint64_t v54 = v49[2];
    if (v54) {
      double result = (unsigned __int8 *)(v54 + v50 * v22 + 2 * v48);
    }
    else {
      double result = 0;
    }
    float v57 = v49;
    uint64_t v56 = *v49;
    uint64_t v55 = v57[1];
    _ZF = v55 == 0;
    uint64_t v59 = v55 + v50 * v21 + 2 * v48;
    if (_ZF) {
      uint64_t v59 = 0;
    }
    uint64_t v60 = v56 + v50 * v20 + 2 * v48;
    uint64_t v61 = *v18 + v19 * v14 + 4 * v51;
    float32x2_t v62 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a3, 0);
    do
    {
      if (v13)
      {
        unint64_t v63 = 0;
        float v64 = result;
        float v65 = (_WORD *)v60;
        float v66 = (unsigned int *)v61;
        do
        {
          unsigned int v67 = *v66;
          unsigned int v68 = v66[1];
          float32x2_t v69 = (float32x2_t)vdup_n_s32(0x45FFF800u);
          _D0 = (int8x8_t)vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v66), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v62), v24), 0), v69)));
          _D0.i16[0] = *(_WORD *)(v41 + 2 * _D0.u32[0]);
          __asm { FCVT            S19, H0 }
          _D0.i16[0] = *(_WORD *)(v41 + 2 * _D0.u32[1]);
          __asm { FCVT            S20, H0 }
          _D0.i32[0] = *v66;
          _D0.i32[1] = v68 >> 20;
          int32x2_t v76 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D0, (int8x8_t)0x300000003)), v62), v24), 0), v69)));
          _D0.i16[0] = *(_WORD *)(v41 + 2 * v76.u32[0]);
          __asm { FCVT            S21, H0 }
          float v78 = (float)((float)((float)(v45 * _S20) + (float)(v44 * _S19)) + (float)(v46 * _S21))
              + (float)(v47 * fmaxf(_S19, fmaxf(_S20, _S21)));
          float v79 = 8191.0;
          if (v78 <= 8191.0)
          {
            float v79 = v78;
            if (v78 < 0.0) {
              float v79 = 0.0;
            }
          }
          _H5 = *(_WORD *)(v41 + 2 * v76.u32[1]);
          __asm { FCVT            S5, H5 }
          _D24.i32[0] = v68 >> 10;
          _D24.i32[1] = v66[1];
          _D22 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D24, (int8x8_t)0x300000003)), v62), v24), 0), v69)));
          _D22.i16[0] = *(_WORD *)(v41 + 2 * _D22.u32[0]);
          __asm { FCVT            S22, H22 }
          _D24.i16[0] = *(_WORD *)(v41 + 2 * _D22.u32[1]);
          __asm { FCVT            S14, H24 }
          float v86 = (float)((float)((float)(v45 * _S22) + (float)(v44 * _S5)) + (float)(v46 * _S14))
              + (float)(v47 * fmaxf(_S5, fmaxf(_S22, _S14)));
          float v87 = 8191.0;
          if (v86 <= 8191.0)
          {
            float v87 = v86;
            if (v86 < 0.0) {
              float v87 = 0.0;
            }
          }
          _H0 = *(_WORD *)(v42 + 2 * llroundf(v79));
          __asm { FCVT            S0, H0 }
          float v90 = _S19 * _S0;
          float v91 = _S20 * _S0;
          float v92 = _S21 * _S0;
          _H21 = *(_WORD *)(v42 + 2 * llroundf(v87));
          __asm { FCVT            S21, H21 }
          float v95 = _S5 * _S21;
          _S22 = _S22 * _S21;
          _S21 = _S14 * _S21;
          float v98 = (float)((float)(v33 * v91) + (float)(v90 * v32)) + (float)(v92 * v34);
          float v99 = (float)((float)(v36 * v91) + (float)(v90 * v35)) + (float)(v92 * v37);
          _S0 = (float)((float)(v40 * v91) + (float)(v90 * v38)) + (float)(v92 * v39);
          _S19 = (float)((float)(v33 * _S22) + (float)(v95 * v32)) + (float)(_S21 * v34);
          float v102 = (float)((float)(v36 * _S22) + (float)(v95 * v35)) + (float)(_S21 * v37);
          float v103 = (float)((float)(v40 * _S22) + (float)(v95 * v38)) + (float)(_S21 * v39);
          LOWORD(_S21) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(v98, 0.0), 8191.0)));
          __asm { FCVT            S21, H21 }
          LOWORD(_S22) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(v99, 0.0), 8191.0)));
          __asm { FCVT            S22, H22 }
          LOWORD(_S0) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(_S0, 0.0), 8191.0)));
          LOWORD(_S19) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(_S19, 0.0), 8191.0)));
          __asm
          {
            FCVT            S24, H0
            FCVT            S0, H19
          }
          LOWORD(_S19) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(v102, 0.0), 8191.0)));
          unsigned int v108 = llroundf(fminf(fmaxf(v103, 0.0), 8191.0));
          __asm { FCVT            S5, H19 }
          LOWORD(_S19) = *(_WORD *)(v43 + 2 * v108);
          __asm { FCVT            S19, H19 }
          float v111 = (float)((float)((float)(v30 * _S22) + (float)(v130 * _S21)) + (float)(v31 * _S24)) + v25;
          float v112 = (float)((float)((float)(v30 * _S5) + (float)(v130 * _S0)) + (float)(v31 * _S19)) + v25;
          if (v111 < v25) {
            float v113 = v25;
          }
          else {
            float v113 = (float)((float)((float)(v30 * _S22) + (float)(v130 * _S21)) + (float)(v31 * _S24)) + v25;
          }
          if (v111 <= v27) {
            float v114 = v113;
          }
          else {
            float v114 = v27;
          }
          *float v65 = llroundf(v114) << v53;
          if (v112 < v25) {
            float v115 = v25;
          }
          else {
            float v115 = (float)((float)((float)(v30 * _S5) + (float)(v130 * _S0)) + (float)(v31 * _S19)) + v25;
          }
          if (v112 > v27) {
            float v115 = v27;
          }
          v65[1] = llroundf(v115) << v53;
          float v116 = _S21 + _S0;
          float v117 = _S22 + _S5;
          float v118 = _S24 + _S19;
          float v119 = (float)((float)(v26 + (float)(v116 * v129)) + (float)(v117 * v128)) + (float)(v118 * v127);
          float v120 = v29;
          if (v119 <= v29)
          {
            float v120 = (float)((float)(v26 + (float)(v116 * v129)) + (float)(v117 * v128)) + (float)(v118 * v127);
            if (v119 < v131) {
              float v120 = v131;
            }
          }
          float v121 = (_WORD *)(v59 + 2 * v63);
          float v122 = (float)((float)(v26 + (float)(v116 * v126)) + (float)(v117 * v125)) + (float)(v118 * v124);
          *float v121 = llroundf(v120) << v53;
          float v123 = v29;
          if (v122 <= v29)
          {
            float v123 = v122;
            if (v122 < v131) {
              float v123 = v131;
            }
          }
          v121[1] = llroundf(v123) << v53;
          if (v64)
          {
            *float v64 = 21845 * (v67 >> 30);
            v64[1] = 21845 * (v68 >> 30);
            v64 += 2;
          }
          v63 += 2;
          v66 += 2;
          v65 += 2;
        }
        while (v13 > v63);
      }
      v61 += v19;
      v60 += v20;
      v59 += v21;
      result += v22;
      ++v12;
    }
    while (v12 != v15);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_xf422(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v12 = a2[2];
  uint64_t v11 = a2[3];
  uint64_t v13 = a2[4];
  uint64_t v14 = a2[5];
  uint64_t v15 = *a6;
  uint64_t v16 = a6[1];
  uint64_t v18 = a6[2];
  uint64_t v17 = a6[3];
  uint64_t v20 = a6[4];
  uint64_t v19 = a6[5];
  if (v20)
  {
    ++v20;
    ++v13;
    if (v18)
    {
      --v18;
      --v12;
    }
    else
    {
      v18 -= 2;
      v12 -= 2;
    }
  }
  memset(v27, 0, 32);
  if (v13 + v12 <= v9) {
    uint64_t v21 = v12;
  }
  else {
    uint64_t v21 = v9 - v13;
  }
  memset(&v27[32], 0, 24);
  if (v20 + v18 > v15) {
    uint64_t v18 = v15 - v20;
  }
  size_t v22 = *(unsigned __int8 *)(a1 + 162);
  v27[0] = *(unsigned char *)(a1 + 162);
  if (v14 + v11 > v10) {
    uint64_t v11 = v10 - v14;
  }
  *(void *)&v27[4] = v9;
  *(void *)&v27[12] = v10;
  if (v19 + v17 <= v16) {
    uint64_t v23 = v17;
  }
  else {
    uint64_t v23 = v16 - v19;
  }
  if (v21 >= v18) {
    uint64_t v24 = v18;
  }
  else {
    uint64_t v24 = v21;
  }
  *(void *)&v27[20] = v24;
  if (v11 < v23) {
    uint64_t v23 = v11;
  }
  *(void *)&v27[28] = v23;
  *(void *)&v27[36] = v13;
  *(void *)&v27[44] = v14;
  uint64_t v31 = v15;
  uint64_t v32 = v16;
  uint64_t v33 = v24;
  uint64_t v34 = v23;
  uint64_t v35 = v20;
  uint64_t v36 = v19;
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v39 = a9;
  uint64_t v40 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v22, global_queue, v27, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_xf422_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Mat_TRC_xf422_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, float a8, double a9, float a10)
{
  uint64_t v10 = *(void *)(result + 28);
  unint64_t v11 = *result;
  unint64_t v12 = v10 * a2 / v11;
  unint64_t v13 = (v10 + v10 * a2) / v11;
  if (v13 != v12)
  {
    uint64_t v14 = 0;
    unint64_t v15 = *(void *)(result + 20);
    unint64_t v16 = v12 + *(void *)(result + 44);
    unint64_t v17 = v13 - v12;
    uint64_t v18 = *((void *)result + 19);
    uint64_t v19 = (uint64_t *)*((void *)result + 17);
    uint64_t v20 = (void *)*((void *)result + 7);
    uint64_t v21 = **((void **)result + 8);
    uint64_t v22 = *v19;
    uint64_t v23 = v19[1];
    uint64_t v24 = v19[2];
    float v25 = 8191.0 / (float)*(unsigned int *)(v18 + 128);
    LOWORD(a5) = *(_WORD *)(v18 + 140);
    *(float *)&a9 = (float)LODWORD(a5);
    LOWORD(a5) = *(_WORD *)(v18 + 144);
    float v26 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v18 + 146);
    float v27 = (float)LODWORD(a6);
    LOWORD(a7) = *(_WORD *)(v18 + 148);
    float v28 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v18 + 150);
    float v29 = (float)LODWORD(a8);
    LOWORD(a10) = *(_WORD *)(v18 + 152);
    float v30 = (float)LODWORD(a10);
    float v31 = *(float *)(v18 + 36);
    float v32 = *(float *)(v18 + 40);
    float v33 = *(float *)(v18 + 44);
    float v110 = *(float *)(v18 + 52) * 0.5;
    float v111 = *(float *)(v18 + 48) * 0.5;
    float v108 = *(float *)(v18 + 60) * 0.5;
    float v109 = *(float *)(v18 + 56) * 0.5;
    float v34 = *(float *)(v18 + 72);
    float v106 = *(float *)(v18 + 68) * 0.5;
    float v107 = *(float *)(v18 + 64) * 0.5;
    float v35 = *(float *)(v18 + 76);
    float v36 = *(float *)(v18 + 80);
    float v37 = *(float *)(v18 + 84);
    float v38 = *(float *)(v18 + 88);
    float v39 = *(float *)(v18 + 92);
    float v40 = *(float *)(v18 + 96);
    float v42 = *(float *)(v18 + 100);
    float v41 = *(float *)(v18 + 104);
    uint64_t v43 = v18 + 164;
    uint64_t v44 = v18 + 16548;
    uint64_t v45 = *((void *)result + 14);
    float v46 = (uint64_t *)*((void *)result + 16);
    unint64_t v47 = *((void *)result + 13) * a2 / v11 + *((void *)result + 15);
    uint64_t v48 = *(void *)(result + 36);
    unsigned int v49 = *(unsigned __int8 *)(v18 + 132);
    if (v49 >= 0x11) {
      char v50 = 0;
    }
    else {
      char v50 = 16 - v49;
    }
    uint64_t v51 = v46[2];
    if (v51) {
      uint64_t v52 = v51 + v47 * v24 + 2 * v45;
    }
    else {
      uint64_t v52 = 0;
    }
    uint64_t v54 = *v46;
    uint64_t v53 = *(void *)(*((void *)result + 16) + 8);
    _ZF = v53 == 0;
    double result = (unsigned __int8 *)(v53 + v47 * v23 + 2 * v45);
    if (_ZF) {
      double result = 0;
    }
    uint64_t v56 = v54 + v47 * v22 + 2 * v45;
    uint64_t v57 = *v20 + v21 * v16 + 4 * v48;
    float32x2_t v58 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a9, 0);
    float32x2_t v59 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v15)
      {
        unint64_t v60 = 0;
        uint64_t v61 = (unsigned int *)v57;
        float32x2_t v62 = (_WORD *)v52;
        unint64_t v63 = (_WORD *)v56;
        do
        {
          unsigned int v64 = *v61;
          unsigned __int32 v65 = v61[1];
          _D6 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v61), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v58), v25), 0), v59)));
          _D6.i16[0] = *(_WORD *)(v43 + 2 * _D6.u32[0]);
          __asm { FCVT            S6, H6 }
          _H18 = *(_WORD *)(v43 + 2 * _D6.u32[1]);
          v71.i32[0] = *v61;
          v71.i32[1] = v65 >> 20;
          _D19 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v71, (int8x8_t)0x300000003)), v58), v25), 0), v59)));
          __asm { FCVT            S18, H18 }
          _D19.i16[0] = *(_WORD *)(v43 + 2 * _D19.u32[0]);
          _H20 = *(_WORD *)(v43 + 2 * _D19.u32[1]);
          __asm
          {
            FCVT            S19, H19
            FCVT            S20, H20
          }
          v76.i32[0] = v65 >> 10;
          v76.i32[1] = v65;
          _D15 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v76, (int8x8_t)0x300000003)), v58), v25), 0), v59)));
          _D15.i16[0] = *(_WORD *)(v43 + 2 * _D15.u32[0]);
          __asm { FCVT            S15, H15 }
          _H22 = *(_WORD *)(v43 + 2 * _D15.u32[1]);
          __asm { FCVT            S22, H22 }
          _S24 = (float)((float)(v35 * _S18) + (float)(*(float *)_D6.i32 * v34)) + (float)(*(float *)_D19.i32 * v36);
          float v81 = (float)((float)(v38 * _S18) + (float)(*(float *)_D6.i32 * v37)) + (float)(*(float *)_D19.i32 * v39);
          *(float *)_D6.i32 = (float)((float)(v42 * _S18) + (float)(*(float *)_D6.i32 * v40))
                            + (float)(*(float *)_D19.i32 * v41);
          _S18 = (float)((float)(v35 * *(float *)_D15.i32) + (float)(_S20 * v34)) + (float)(_S22 * v36);
          *(float *)_D19.i32 = (float)((float)(v38 * *(float *)_D15.i32) + (float)(_S20 * v37)) + (float)(_S22 * v39);
          _S20 = (float)((float)(v42 * *(float *)_D15.i32) + (float)(_S20 * v40)) + (float)(_S22 * v41);
          LOWORD(_S22) = *(_WORD *)(v44 + 2 * llroundf(fminf(fmaxf(_S24, 0.0), 8191.0)));
          __asm { FCVT            S22, H22 }
          LOWORD(_S24) = *(_WORD *)(v44 + 2 * llroundf(fminf(fmaxf(v81, 0.0), 8191.0)));
          __asm { FCVT            S24, H24 }
          _D6.i16[0] = *(_WORD *)(v44 + 2 * llroundf(fminf(fmaxf(*(float *)_D6.i32, 0.0), 8191.0)));
          LOWORD(_S18) = *(_WORD *)(v44 + 2 * llroundf(fminf(fmaxf(_S18, 0.0), 8191.0)));
          __asm
          {
            FCVT            S6, H6
            FCVT            S18, H18
          }
          _D19.i16[0] = *(_WORD *)(v44 + 2 * llroundf(fminf(fmaxf(*(float *)_D19.i32, 0.0), 8191.0)));
          __asm { FCVT            S19, H19 }
          LOWORD(_S20) = *(_WORD *)(v44 + 2 * llroundf(fminf(fmaxf(_S20, 0.0), 8191.0)));
          __asm { FCVT            S20, H20 }
          float v90 = (float)((float)((float)(v32 * _S24) + (float)(v31 * _S22)) + (float)(v33 * _S6)) + v26;
          if (v90 < v26) {
            float v91 = v26;
          }
          else {
            float v91 = (float)((float)((float)(v32 * _S24) + (float)(v31 * _S22)) + (float)(v33 * _S6)) + v26;
          }
          BOOL v92 = v90 <= v28;
          float v93 = (float)((float)((float)(v32 * _S19) + (float)(v31 * _S18)) + (float)(v33 * _S20)) + v26;
          if (!v92) {
            float v91 = v28;
          }
          unsigned int v94 = llroundf(v91);
          if (v93 < v26) {
            float v95 = v26;
          }
          else {
            float v95 = (float)((float)((float)(v32 * _S19) + (float)(v31 * _S18)) + (float)(v33 * _S20)) + v26;
          }
          if (v93 <= v28) {
            float v96 = v95;
          }
          else {
            float v96 = v28;
          }
          float v97 = _S22 + _S18;
          *unint64_t v63 = v94 << v50;
          v63[1] = llroundf(v96) << v50;
          float v98 = _S24 + _S19;
          float v99 = (float)(v27 + (float)(v97 * v111)) + (float)((float)(_S24 + _S19) * v110);
          float v100 = _S6 + _S20;
          float v101 = v99 + (float)((float)(_S6 + _S20) * v109);
          float v102 = v30;
          if (v101 <= v30)
          {
            float v102 = v101;
            if (v101 < v29) {
              float v102 = v29;
            }
          }
          float v103 = &result[2 * v60];
          float v104 = (float)((float)(v27 + (float)(v97 * v108)) + (float)(v98 * v107)) + (float)(v100 * v106);
          *(_WORD *)float v103 = llroundf(v102) << v50;
          float v105 = v30;
          if (v104 <= v30)
          {
            float v105 = v104;
            if (v104 < v29) {
              float v105 = v29;
            }
          }
          *((_WORD *)v103 + 1) = llroundf(v105) << v50;
          if (v62)
          {
            *float32x2_t v62 = 21845 * (v64 >> 30);
            v62[1] = 21845 * (v65 >> 30);
            v62 += 2;
          }
          v60 += 2;
          v61 += 2;
          v63 += 2;
        }
        while (v15 > v60);
      }
      v57 += v21;
      v56 += v22;
      result += v23;
      v52 += v24;
      ++v14;
    }
    while (v14 != v17);
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_xf422(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v12 = a2[2];
  uint64_t v11 = a2[3];
  uint64_t v13 = a2[4];
  uint64_t v14 = a2[5];
  uint64_t v15 = *a6;
  uint64_t v16 = a6[1];
  uint64_t v18 = a6[2];
  uint64_t v17 = a6[3];
  uint64_t v20 = a6[4];
  uint64_t v19 = a6[5];
  if (v20)
  {
    ++v20;
    ++v13;
    if (v18)
    {
      --v18;
      --v12;
    }
    else
    {
      v18 -= 2;
      v12 -= 2;
    }
  }
  memset(v27, 0, 32);
  if (v13 + v12 <= v9) {
    uint64_t v21 = v12;
  }
  else {
    uint64_t v21 = v9 - v13;
  }
  memset(&v27[32], 0, 24);
  if (v20 + v18 > v15) {
    uint64_t v18 = v15 - v20;
  }
  size_t v22 = *(unsigned __int8 *)(a1 + 162);
  v27[0] = *(unsigned char *)(a1 + 162);
  if (v14 + v11 > v10) {
    uint64_t v11 = v10 - v14;
  }
  *(void *)&v27[4] = v9;
  *(void *)&v27[12] = v10;
  if (v19 + v17 <= v16) {
    uint64_t v23 = v17;
  }
  else {
    uint64_t v23 = v16 - v19;
  }
  if (v21 >= v18) {
    uint64_t v24 = v18;
  }
  else {
    uint64_t v24 = v21;
  }
  *(void *)&v27[20] = v24;
  if (v11 < v23) {
    uint64_t v23 = v11;
  }
  *(void *)&v27[28] = v23;
  *(void *)&v27[36] = v13;
  *(void *)&v27[44] = v14;
  uint64_t v31 = v15;
  uint64_t v32 = v16;
  uint64_t v33 = v24;
  uint64_t v34 = v23;
  uint64_t v35 = v20;
  uint64_t v36 = v19;
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a5;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v39 = a9;
  uint64_t v40 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v22, global_queue, v27, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_xf422_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_rgb_xf422_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, float a8, float a9)
{
  uint64_t v9 = *(void *)(result + 28);
  unint64_t v10 = *result;
  unint64_t v11 = v9 * a2 / v10;
  unint64_t v12 = (v9 + v9 * a2) / v10;
  if (v12 != v11)
  {
    uint64_t v13 = 0;
    unint64_t v14 = *(void *)(result + 20);
    unint64_t v15 = v11 + *(void *)(result + 44);
    unint64_t v16 = v12 - v11;
    uint64_t v17 = *((void *)result + 19);
    uint64_t v18 = (uint64_t *)*((void *)result + 17);
    uint64_t v19 = (void *)*((void *)result + 7);
    uint64_t v20 = **((void **)result + 8);
    uint64_t v21 = *v18;
    uint64_t v22 = v18[1];
    uint64_t v23 = v18[2];
    *(float *)&unsigned int v24 = (float)*(unsigned int *)(v17 + 136);
    float v25 = *(float *)&v24 / (float)*(unsigned int *)(v17 + 128);
    LOWORD(v24) = *(_WORD *)(v17 + 140);
    float v26 = (float)v24;
    LOWORD(a5) = *(_WORD *)(v17 + 144);
    float v27 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v17 + 146);
    float v28 = (float)LODWORD(a6);
    LOWORD(a7) = *(_WORD *)(v17 + 148);
    float v29 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v17 + 150);
    float v30 = (float)LODWORD(a8);
    LOWORD(a9) = *(_WORD *)(v17 + 152);
    float v31 = (float)LODWORD(a9);
    float v32 = *(float *)(v17 + 36);
    float v33 = *(float *)(v17 + 40);
    float v34 = *(float *)(v17 + 44);
    float v35 = *(float *)(v17 + 48) * 0.5;
    float v36 = *(float *)(v17 + 52) * 0.5;
    float v37 = *(float *)(v17 + 56) * 0.5;
    float v38 = *(float *)(v17 + 60) * 0.5;
    float v39 = *(float *)(v17 + 64) * 0.5;
    float v40 = *(float *)(v17 + 68) * 0.5;
    uint64_t v41 = *((void *)result + 14);
    unint64_t v42 = *((void *)result + 13) * a2;
    uint64_t v43 = (void *)*((void *)result + 16);
    unint64_t v44 = v42 / v10 + *((void *)result + 15);
    uint64_t v45 = *(void *)(result + 36);
    unsigned int v46 = *(unsigned __int8 *)(v17 + 132);
    if (v46 >= 0x11) {
      char v47 = 0;
    }
    else {
      char v47 = 16 - v46;
    }
    uint64_t v48 = v43[2];
    if (v48) {
      uint64_t v49 = v48 + v44 * v23 + 2 * v41;
    }
    else {
      uint64_t v49 = 0;
    }
    uint64_t v52 = v43;
    uint64_t v50 = *v43;
    uint64_t v51 = v52[1];
    BOOL v53 = v51 == 0;
    uint64_t v54 = v51 + v44 * v22 + 2 * v41;
    if (v53) {
      uint64_t v54 = 0;
    }
    uint64_t v55 = v50 + v44 * v21 + 2 * v41;
    double result = (unsigned __int8 *)(*v19 + v20 * v15 + 4 * v45);
    char v56 = v47;
    do
    {
      if (v14)
      {
        unint64_t v57 = 0;
        float32x2_t v58 = (unsigned int *)result;
        float32x2_t v59 = (_WORD *)v49;
        unint64_t v60 = (_WORD *)v55;
        do
        {
          unsigned int v61 = *v58;
          float v62 = v25 * (float)((float)(*v58 & 0x3FF) - v26);
          float v63 = v25 * (float)((float)((*v58 >> 10) & 0x3FF) - v26);
          float v64 = v25 * (float)((float)((*v58 >> 20) & 0x3FF) - v26);
          float v65 = (float)((float)((float)(v33 * v63) + (float)(v32 * v64)) + (float)(v34 * v62)) + v27;
          float v66 = v29;
          if (v65 <= v29)
          {
            float v66 = (float)((float)((float)(v33 * v63) + (float)(v32 * v64)) + (float)(v34 * v62)) + v27;
            if (v65 < v27) {
              float v66 = v27;
            }
          }
          unsigned int v67 = v58[1];
          float v68 = v25 * (float)((float)(v67 & 0x3FF) - v26);
          float v69 = v25 * (float)((float)((v67 >> 10) & 0x3FF) - v26);
          float v70 = v25 * (float)((float)((v67 >> 20) & 0x3FF) - v26);
          float v71 = (float)((float)((float)(v33 * v69) + (float)(v32 * v70)) + (float)(v34 * v68)) + v27;
          *unint64_t v60 = llroundf(v66) << v56;
          float v72 = v29;
          if (v71 <= v29)
          {
            float v72 = (float)((float)((float)(v33 * v69) + (float)(v32 * v70)) + (float)(v34 * v68)) + v27;
            if (v71 < v27) {
              float v72 = v27;
            }
          }
          v60[1] = llroundf(v72) << v56;
          float v73 = v64 + v70;
          float v74 = v63 + v69;
          float v75 = v62 + v68;
          float v76 = (float)((float)(v28 + (float)(v73 * v35)) + (float)(v74 * v36)) + (float)(v75 * v37);
          float v77 = v31;
          if (v76 <= v31)
          {
            float v77 = (float)((float)(v28 + (float)(v73 * v35)) + (float)(v74 * v36)) + (float)(v75 * v37);
            if (v76 < v30) {
              float v77 = v30;
            }
          }
          float v78 = (_WORD *)(v54 + 2 * v57);
          float v79 = (float)((float)(v28 + (float)(v73 * v38)) + (float)(v74 * v39)) + (float)(v75 * v40);
          *float v78 = llroundf(v77) << v56;
          float v80 = v31;
          if (v79 <= v31)
          {
            float v80 = v79;
            if (v79 < v30) {
              float v80 = v30;
            }
          }
          v78[1] = llroundf(v80) << v56;
          if (v59)
          {
            *float32x2_t v59 = 21845 * (v61 >> 30);
            v59[1] = 21845 * (v67 >> 30);
            v59 += 2;
          }
          v57 += 2;
          v58 += 2;
          v60 += 2;
        }
        while (v14 > v57);
      }
      result += v20;
      v55 += v21;
      v54 += v22;
      v49 += v23;
      ++v13;
    }
    while (v13 != v16);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_v216(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_v216_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_v216_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, double a6, float a7, float a8, float a9, float a10)
{
  uint64_t v11 = *(void *)(result + 28);
  unint64_t v12 = *result;
  unint64_t v13 = v11 * a2 / v12;
  uint64_t v14 = *((void *)result + 14);
  unint64_t v15 = (void *)*((void *)result + 16);
  unint64_t v16 = *((void *)result + 13) * a2 / v12 + *((void *)result + 15);
  uint64_t v17 = (uint64_t *)*((void *)result + 17);
  unint64_t v18 = (v11 + v11 * a2) / v12;
  uint64_t v19 = (_WORD *)v15[1];
  if (v19) {
    uint64_t v19 = (_WORD *)((char *)v19 + 2 * v14 + v17[1] * v16);
  }
  if (v18 != v13)
  {
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)(result + 44);
    uint64_t v22 = v13 + v21;
    uint64_t v23 = **((void **)result + 8);
    uint64_t v24 = *v17;
    uint64_t v25 = *((void *)result + 19);
    uint64_t v26 = *v15 + v24 * v16;
    uint64_t v27 = v18 + v21;
    uint64_t v28 = **((void **)result + 7) + v23 * v22 + 4 * *(void *)(result + 36);
    float v29 = (_WORD *)(v26 + 2 * v14);
    uint64_t v30 = v27 - v22;
    LOWORD(a5) = *(_WORD *)(v25 + 140);
    LOWORD(a7) = *(_WORD *)(v25 + 144);
    LOWORD(a8) = *(_WORD *)(v25 + 146);
    LOWORD(a9) = *(_WORD *)(v25 + 148);
    LOWORD(a10) = *(_WORD *)(v25 + 150);
    LOWORD(v10) = *(_WORD *)(v25 + 152);
    float v31 = 8191.0 / (float)*(unsigned int *)(v25 + 128);
    *(float *)&a3 = (float)LODWORD(a5);
    float v32 = (float)LODWORD(a7);
    float v133 = (float)LODWORD(a8);
    float v33 = (float)LODWORD(a9);
    float v34 = (float)LODWORD(a10);
    float v35 = (float)v10;
    float v36 = *(float *)(v25 + 40);
    float v134 = *(float *)(v25 + 36);
    float v37 = *(float *)(v25 + 44);
    float v131 = *(float *)(v25 + 52) * 0.5;
    float v132 = *(float *)(v25 + 48) * 0.5;
    float v130 = *(float *)(v25 + 56) * 0.5;
    float v129 = *(float *)(v25 + 60) * 0.5;
    float v128 = *(float *)(v25 + 64) * 0.5;
    float v126 = *(float *)(v25 + 72);
    float v127 = *(float *)(v25 + 68) * 0.5;
    float v38 = *(float *)(v25 + 76);
    float v39 = *(float *)(v25 + 80);
    float v40 = *(float *)(v25 + 84);
    float v41 = *(float *)(v25 + 88);
    float v42 = *(float *)(v25 + 92);
    float v43 = *(float *)(v25 + 96);
    float v45 = *(float *)(v25 + 100);
    float v44 = *(float *)(v25 + 104);
    uint64_t v46 = v25 + 164;
    uint64_t v47 = v25 + 16548;
    uint64_t v48 = v25 + 32932;
    float v49 = *(float *)(v25 + 108);
    float v50 = *(float *)(v25 + 112);
    float v51 = *(float *)(v25 + 116);
    float v52 = *(float *)(v25 + 120);
    double result = *(unsigned __int8 **)(result + 20);
    float32x2_t v53 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a3, 0);
    do
    {
      if (result)
      {
        unint64_t v54 = 0;
        uint64_t v55 = v19;
        char v56 = v29;
        unint64_t v57 = (unsigned int *)v28;
        do
        {
          unsigned int v58 = *v57;
          unsigned int v59 = v57[1];
          float32x2_t v60 = (float32x2_t)vdup_n_s32(0x45FFF800u);
          _D0 = (int8x8_t)vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v57), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v53), v31), 0), v60)));
          _D0.i16[0] = *(_WORD *)(v46 + 2 * _D0.u32[0]);
          __asm { FCVT            S19, H0 }
          _D0.i16[0] = *(_WORD *)(v46 + 2 * _D0.u32[1]);
          __asm { FCVT            S20, H0 }
          _D0.i32[0] = *v57;
          _D0.i32[1] = v59 >> 20;
          int32x2_t v68 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(_D0, (int8x8_t)0x300000003)), v53), v31), 0), v60)));
          _D0.i16[0] = *(_WORD *)(v46 + 2 * v68.u32[0]);
          __asm { FCVT            S22, H0 }
          float v70 = fmaxf(_S19, fmaxf(_S20, _S22));
          float v71 = (float)((float)((float)(v50 * _S20) + (float)(v49 * _S19)) + (float)(v51 * _S22)) + (float)(v52 * v70);
          float v72 = 8191.0;
          if (v71 <= 8191.0)
          {
            float v72 = (float)((float)((float)(v50 * _S20) + (float)(v49 * _S19)) + (float)(v51 * _S22)) + (float)(v52 * v70);
            if (v71 < 0.0) {
              float v72 = 0.0;
            }
          }
          _H24 = *(_WORD *)(v46 + 2 * v68.u32[1]);
          v74.i32[0] = v59 >> 10;
          v74.i32[1] = v57[1];
          _D13 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v74, (int8x8_t)0x300000003)), v53), v31), 0), v60)));
          __asm { FCVT            S21, H24 }
          _H24 = *(_WORD *)(v46 + 2 * _D13.u32[0]);
          _D13.i16[0] = *(_WORD *)(v46 + 2 * _D13.u32[1]);
          __asm
          {
            FCVT            S14, H24
            FCVT            S13, H13
          }
          _H0 = *(_WORD *)(v47 + 2 * llroundf(v72));
          __asm { FCVT            S24, H0 }
          float v82 = _S19 * _S24;
          float v83 = _S20 * _S24;
          float v84 = _S22 * _S24;
          float v85 = (float)((float)((float)(v50 * _S14) + (float)(v49 * _S21)) + (float)(v51 * _S13))
              + (float)(v52 * fmaxf(_S21, fmaxf(_S14, _S13)));
          float v86 = 8191.0;
          if (v85 <= 8191.0)
          {
            float v86 = v85;
            if (v85 < 0.0) {
              float v86 = 0.0;
            }
          }
          _H22 = *(_WORD *)(v47 + 2 * llroundf(v86));
          __asm { FCVT            S22, H22 }
          float v89 = _S21 * _S22;
          _S24 = _S14 * _S22;
          float v91 = _S13 * _S22;
          float v92 = (float)((float)(v38 * v83) + (float)(v82 * v126)) + (float)(v84 * v39);
          float v93 = (float)((float)(v41 * v83) + (float)(v82 * v40)) + (float)(v84 * v42);
          float v94 = (float)((float)(v45 * v83) + (float)(v82 * v43)) + (float)(v84 * v44);
          float v95 = (float)(v38 * _S24) + (float)(v89 * v126);
          float v96 = (float)(v41 * _S24) + (float)(v89 * v40);
          float v97 = (float)(v45 * _S24) + (float)(v89 * v43);
          _S19 = v95 + (float)(v91 * v39);
          _S20 = v96 + (float)(v91 * v42);
          LOWORD(_S24) = *(_WORD *)(v48 + 2 * llroundf(fminf(fmaxf(v92, 0.0), 8191.0)));
          float v100 = v97 + (float)(v91 * v44);
          __asm { FCVT            S22, H24 }
          LOWORD(_S24) = *(_WORD *)(v48 + 2 * llroundf(fminf(fmaxf(v93, 0.0), 8191.0)));
          unsigned int v102 = llroundf(fminf(fmaxf(v94, 0.0), 8191.0));
          __asm { FCVT            S0, H24 }
          LOWORD(_S24) = *(_WORD *)(v48 + 2 * v102);
          __asm { FCVT            S24, H24 }
          LOWORD(_S19) = *(_WORD *)(v48 + 2 * llroundf(fminf(fmaxf(_S19, 0.0), 8191.0)));
          __asm { FCVT            S19, H19 }
          LOWORD(_S20) = *(_WORD *)(v48 + 2 * llroundf(fminf(fmaxf(_S20, 0.0), 8191.0)));
          __asm { FCVT            S20, H20 }
          unsigned int v107 = llroundf(fminf(fmaxf(v100, 0.0), 8191.0));
          float v108 = (float)(v36 * _S0) + (float)(v134 * _S22);
          float v109 = _S22 + _S19;
          _S0 = _S0 + _S20;
          float v111 = (float)(v133 + (float)(v109 * v132)) + (float)(_S0 * v131);
          float v112 = (float)(v133 + (float)(v109 * v129)) + (float)(_S0 * v128);
          LOWORD(_S0) = *(_WORD *)(v48 + 2 * v107);
          __asm { FCVT            S0, H0 }
          float v114 = v108 + (float)(v37 * _S24);
          float v115 = _S24 + _S0;
          float v116 = v111 + (float)((float)(_S24 + _S0) * v130);
          float v117 = v112 + (float)(v115 * v127);
          if (v116 < v32) {
            float v118 = v32;
          }
          else {
            float v118 = v116;
          }
          BOOL v119 = v116 <= v33;
          float v120 = v114 + v32;
          if (!v119) {
            float v118 = v33;
          }
          __int16 v121 = llroundf(v118);
          if (v120 < v34) {
            float v122 = (float)LODWORD(a10);
          }
          else {
            float v122 = v114 + v32;
          }
          _WORD *v56 = v121;
          if (v120 > v35) {
            float v122 = (float)v10;
          }
          v56[1] = llroundf(v122);
          float v123 = v33;
          if (v117 <= v33)
          {
            float v123 = v117;
            if (v117 < v32) {
              float v123 = v32;
            }
          }
          float v124 = (float)((float)((float)(v36 * _S20) + (float)(v134 * _S19)) + (float)(v37 * _S0)) + v32;
          v56[2] = llroundf(v123);
          float v125 = (float)v10;
          if (v124 <= v35)
          {
            float v125 = v124;
            if (v124 < v34) {
              float v125 = (float)LODWORD(a10);
            }
          }
          v56[3] = llroundf(v125);
          if (v55)
          {
            *uint64_t v55 = 21845 * (v58 >> 30);
            v55[1] = 21845 * (v59 >> 30);
            v55 += 2;
          }
          v54 += 2;
          v57 += 2;
          v56 += 4;
        }
        while ((unint64_t)result > v54);
      }
      v28 += v23;
      float v29 = (_WORD *)((char *)v29 + v24);
      ++v20;
    }
    while (v20 != v30);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_v216(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_v216_GCD);
  return 0;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_v216_GCD(uint64_t result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, float a8, float a9)
{
  uint64_t v10 = *(void *)(result + 28);
  unint64_t v11 = *(unsigned __int8 *)result;
  unint64_t v12 = v10 * a2 / v11;
  uint64_t v13 = *(void *)(result + 112);
  uint64_t v14 = *(void **)(result + 128);
  unint64_t v15 = *(void *)(result + 104) * a2 / v11 + *(void *)(result + 120);
  unint64_t v16 = *(uint64_t **)(result + 136);
  unint64_t v17 = (v10 + v10 * a2) / v11;
  uint64_t v18 = (_WORD *)v14[1];
  if (v18) {
    uint64_t v18 = (_WORD *)((char *)v18 + 2 * v13 + v16[1] * v15);
  }
  if (v17 != v12)
  {
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)(result + 44);
    uint64_t v21 = v12 + v20;
    uint64_t v22 = **(void **)(result + 64);
    uint64_t v23 = *v16;
    uint64_t v24 = *v14 + v23 * v15;
    uint64_t v25 = *(void *)(result + 152);
    unint64_t v26 = *(void *)(result + 20);
    uint64_t v27 = v17 + v20;
    uint64_t v28 = **(void **)(result + 56) + v22 * v21 + 4 * *(void *)(result + 36);
    float v29 = (_WORD *)(v24 + 2 * v13);
    uint64_t v30 = v27 - v21;
    LOWORD(a5) = *(_WORD *)(v25 + 140);
    LOWORD(a6) = *(_WORD *)(v25 + 144);
    LOWORD(a7) = *(_WORD *)(v25 + 146);
    LOWORD(a8) = *(_WORD *)(v25 + 148);
    LOWORD(a9) = *(_WORD *)(v25 + 150);
    float v31 = 8191.0 / (float)*(unsigned int *)(v25 + 128);
    *(float *)v9.i32 = (float)LODWORD(a5);
    float v32 = (float)LODWORD(a6);
    float v33 = (float)LODWORD(a7);
    float v34 = (float)LODWORD(a8);
    float v35 = (float)LODWORD(a9);
    LOWORD(a7) = *(_WORD *)(v25 + 152);
    float v36 = (float)LODWORD(a7);
    float v37 = *(float *)(v25 + 36);
    float v38 = *(float *)(v25 + 40);
    float v39 = *(float *)(v25 + 44);
    float v102 = *(float *)(v25 + 48) * 0.5;
    float v101 = *(float *)(v25 + 52) * 0.5;
    float v100 = *(float *)(v25 + 56) * 0.5;
    float v99 = *(float *)(v25 + 60) * 0.5;
    float v98 = *(float *)(v25 + 64) * 0.5;
    float v40 = *(float *)(v25 + 72);
    float v97 = *(float *)(v25 + 68) * 0.5;
    float v41 = *(float *)(v25 + 76);
    float v42 = *(float *)(v25 + 80);
    float v43 = *(float *)(v25 + 84);
    float v44 = *(float *)(v25 + 88);
    float v45 = *(float *)(v25 + 92);
    float v46 = *(float *)(v25 + 96);
    uint64_t v47 = v25 + 164;
    uint64_t v48 = v25 + 16548;
    float v50 = *(float *)(v25 + 100);
    float v49 = *(float *)(v25 + 104);
    float32x2_t v51 = (float32x2_t)vdup_lane_s32(v9, 0);
    double result = 21845;
    float32x2_t v52 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v26)
      {
        unint64_t v53 = 0;
        unint64_t v54 = (unsigned int *)v28;
        uint64_t v55 = v18;
        char v56 = v29;
        do
        {
          unsigned int v57 = *v54;
          unsigned __int32 v58 = v54[1];
          _D4 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*v54), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v51), v31), 0), v52)));
          _D4.i16[0] = *(_WORD *)(v47 + 2 * _D4.u32[0]);
          __asm { FCVT            S4, H4 }
          _H18 = *(_WORD *)(v47 + 2 * _D4.u32[1]);
          v65.i32[0] = *v54;
          v65.i32[1] = v58 >> 20;
          _D19 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v65, (int8x8_t)0x300000003)), v51), v31), 0), v52)));
          _D19.i16[0] = *(_WORD *)(v47 + 2 * _D19.u32[0]);
          __asm
          {
            FCVT            S18, H18
            FCVT            S19, H19
          }
          _H20 = *(_WORD *)(v47 + 2 * _D19.u32[1]);
          __asm { FCVT            S20, H20 }
          v70.i32[0] = v58 >> 10;
          v70.i32[1] = v58;
          _D15 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v70, (int8x8_t)0x300000003)), v51), v31), 0), v52)));
          _D15.i16[0] = *(_WORD *)(v47 + 2 * _D15.u32[0]);
          __asm { FCVT            S15, H15 }
          _S22 = (float)((float)(v41 * _S18) + (float)(*(float *)_D4.i32 * v40)) + (float)(*(float *)_D19.i32 * v42);
          _S24 = (float)((float)(v44 * _S18) + (float)(*(float *)_D4.i32 * v43)) + (float)(*(float *)_D19.i32 * v45);
          *(float *)_D4.i32 = (float)((float)(v50 * _S18) + (float)(*(float *)_D4.i32 * v46))
                            + (float)(*(float *)_D19.i32 * v49);
          _S18 = (float)(v41 * *(float *)_D15.i32) + (float)(_S20 * v40);
          *(float *)_D19.i32 = (float)(v44 * *(float *)_D15.i32) + (float)(_S20 * v43);
          float v75 = (float)(v50 * *(float *)_D15.i32) + (float)(_S20 * v46);
          _D15.i16[0] = *(_WORD *)(v47 + 2 * _D15.u32[1]);
          __asm { FCVT            S15, H15 }
          *(float *)_D19.i32 = *(float *)_D19.i32 + (float)(*(float *)_D15.i32 * v45);
          LOWORD(_S22) = *(_WORD *)(v48 + 2 * llroundf(fminf(fmaxf(_S22, 0.0), 8191.0)));
          float v76 = v75 + (float)(*(float *)_D15.i32 * v49);
          __asm { FCVT            S22, H22 }
          LOWORD(_S24) = *(_WORD *)(v48 + 2 * llroundf(fminf(fmaxf(_S24, 0.0), 8191.0)));
          unsigned int v78 = llroundf(fminf(fmaxf(*(float *)_D4.i32, 0.0), 8191.0));
          __asm { FCVT            S4, H24 }
          LOWORD(_S24) = *(_WORD *)(v48 + 2 * v78);
          __asm { FCVT            S24, H24 }
          LOWORD(_S18) = *(_WORD *)(v48
                                  + 2 * llroundf(fminf(fmaxf(_S18 + (float)(*(float *)_D15.i32 * v42), 0.0), 8191.0)));
          __asm { FCVT            S15, H18 }
          LOWORD(_S18) = *(_WORD *)(v48 + 2 * llroundf(fminf(fmaxf(*(float *)_D19.i32, 0.0), 8191.0)));
          __asm { FCVT            S18, H18 }
          unsigned int v82 = llroundf(fminf(fmaxf(v76, 0.0), 8191.0));
          float v83 = (float)(v38 * *(float *)_D4.i32) + (float)(v37 * _S22);
          *(float *)_D19.i32 = _S22 + _S15;
          *(float *)_D4.i32 = *(float *)_D4.i32 + _S18;
          float v84 = (float)(v33 + (float)((float)(_S22 + _S15) * v102)) + (float)(*(float *)_D4.i32 * v101);
          *(float *)_D4.i32 = (float)(v33 + (float)(*(float *)_D19.i32 * v99)) + (float)(*(float *)_D4.i32 * v98);
          _D19.i16[0] = *(_WORD *)(v48 + 2 * v82);
          __asm { FCVT            S19, H19 }
          float v86 = v83 + (float)(v39 * _S24);
          float v87 = v84 + (float)((float)(_S24 + _S19) * v100);
          float v88 = *(float *)_D4.i32 + (float)((float)(_S24 + _S19) * v97);
          if (v87 < v32) {
            float v89 = v32;
          }
          else {
            float v89 = v87;
          }
          BOOL v90 = v87 <= v34;
          float v91 = v86 + v32;
          if (!v90) {
            float v89 = v34;
          }
          __int16 v92 = llroundf(v89);
          if (v91 < v35) {
            float v93 = v35;
          }
          else {
            float v93 = v86 + v32;
          }
          _WORD *v56 = v92;
          if (v91 > v36) {
            float v93 = v36;
          }
          v56[1] = llroundf(v93);
          float v94 = v34;
          if (v88 <= v34)
          {
            float v94 = v88;
            if (v88 < v32) {
              float v94 = v32;
            }
          }
          float v95 = (float)((float)((float)(v38 * _S18) + (float)(v37 * _S15)) + (float)(v39 * _S19)) + v32;
          v56[2] = llroundf(v94);
          float v96 = v36;
          if (v95 <= v36)
          {
            float v96 = v95;
            if (v95 < v35) {
              float v96 = v35;
            }
          }
          v56[3] = llroundf(v96);
          if (v55)
          {
            *uint64_t v55 = 21845 * (v57 >> 30);
            v55[1] = 21845 * (v58 >> 30);
            v55 += 2;
          }
          v53 += 2;
          v54 += 2;
          v56 += 4;
        }
        while (v26 > v53);
      }
      v28 += v22;
      float v29 = (_WORD *)((char *)v29 + v23);
      ++v19;
    }
    while (v19 != v30);
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_v216(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_v216_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_rgb_v216_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, float a8, float a9)
{
  uint64_t v9 = *(void *)(result + 28);
  unint64_t v10 = *result;
  unint64_t v11 = v9 * a2 / v10;
  uint64_t v12 = *((void *)result + 14);
  int64x2_t v13 = (void *)*((void *)result + 16);
  unint64_t v14 = *((void *)result + 13) * a2 / v10 + *((void *)result + 15);
  unint64_t v15 = (uint64_t *)*((void *)result + 17);
  unint64_t v16 = (v9 + v9 * a2) / v10;
  uint64_t v17 = (_WORD *)v13[1];
  if (v17) {
    uint64_t v17 = (_WORD *)((char *)v17 + 2 * v12 + v15[1] * v14);
  }
  if (v16 != v11)
  {
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)(result + 44);
    uint64_t v20 = v11 + v19;
    uint64_t v21 = **((void **)result + 8);
    uint64_t v22 = *v15;
    uint64_t v23 = *v13 + v22 * v14;
    uint64_t v24 = *((void *)result + 19);
    unint64_t v25 = *(void *)(result + 20);
    uint64_t v26 = v16 + v19;
    uint64_t v27 = **((void **)result + 7) + v21 * v20 + 4 * *(void *)(result + 36);
    uint64_t v28 = (_WORD *)(v23 + 2 * v12);
    uint64_t v29 = v26 - v20;
    *(float *)&unsigned int v30 = (float)*(unsigned int *)(v24 + 136);
    float v31 = *(float *)&v30 / (float)*(unsigned int *)(v24 + 128);
    LOWORD(v30) = *(_WORD *)(v24 + 140);
    float v32 = (float)v30;
    LOWORD(a5) = *(_WORD *)(v24 + 144);
    float v33 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v24 + 146);
    float v34 = (float)LODWORD(a6);
    LOWORD(a7) = *(_WORD *)(v24 + 148);
    float v35 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v24 + 150);
    float v36 = (float)LODWORD(a8);
    LOWORD(a9) = *(_WORD *)(v24 + 152);
    float v37 = (float)LODWORD(a9);
    float v38 = *(float *)(v24 + 36);
    float v39 = *(float *)(v24 + 40);
    float v40 = *(float *)(v24 + 44);
    float v41 = *(float *)(v24 + 48) * 0.5;
    float v42 = *(float *)(v24 + 52) * 0.5;
    float v43 = *(float *)(v24 + 56) * 0.5;
    float v44 = *(float *)(v24 + 60) * 0.5;
    float v45 = *(float *)(v24 + 64) * 0.5;
    float v46 = *(float *)(v24 + 68) * 0.5;
    do
    {
      if (v25)
      {
        unint64_t v47 = 0;
        double result = (unsigned __int8 *)v27;
        uint64_t v48 = v17;
        float v49 = v28;
        do
        {
          unsigned int v50 = *(_DWORD *)result;
          unsigned int v51 = *((_DWORD *)result + 1);
          float v52 = v31 * (float)((float)(*(_DWORD *)result & 0x3FF) - v32);
          float v53 = v31 * (float)((float)((*(_DWORD *)result >> 10) & 0x3FF) - v32);
          float v54 = v31 * (float)((float)((*(_DWORD *)result >> 20) & 0x3FF) - v32);
          float v55 = v31 * (float)((float)(v51 & 0x3FF) - v32);
          float v56 = v31 * (float)((float)((v51 >> 10) & 0x3FF) - v32);
          float v57 = v31 * (float)((float)((v51 >> 20) & 0x3FF) - v32);
          float v58 = (float)((float)((float)(v39 * v53) + (float)(v38 * v54)) + (float)(v40 * v52)) + v33;
          float v59 = v54 + v57;
          float v60 = v53 + v56;
          float v61 = v52 + v55;
          float v62 = (float)((float)(v34 + (float)(v59 * v41)) + (float)(v60 * v42)) + (float)(v61 * v43);
          float v63 = (float)((float)(v34 + (float)(v59 * v44)) + (float)(v60 * v45)) + (float)(v61 * v46);
          if (v62 < v33) {
            float v64 = v33;
          }
          else {
            float v64 = v62;
          }
          if (v62 > v35) {
            float v64 = v35;
          }
          *float v49 = llroundf(v64);
          if (v58 < v36) {
            float v65 = v36;
          }
          else {
            float v65 = v58;
          }
          if (v58 > v37) {
            float v65 = v37;
          }
          v49[1] = llroundf(v65);
          float v66 = v35;
          if (v63 <= v35)
          {
            float v66 = v63;
            if (v63 < v33) {
              float v66 = v33;
            }
          }
          float v67 = (float)((float)((float)(v39 * v56) + (float)(v38 * v57)) + (float)(v40 * v55)) + v33;
          v49[2] = llroundf(v66);
          float v68 = v37;
          if (v67 <= v37)
          {
            float v68 = v67;
            if (v67 < v36) {
              float v68 = v36;
            }
          }
          v49[3] = llroundf(v68);
          if (v48)
          {
            *uint64_t v48 = 21845 * (v50 >> 30);
            v48[1] = 21845 * (v51 >> 30);
            v48 += 2;
          }
          v47 += 2;
          result += 8;
          v49 += 4;
        }
        while (v25 > v47);
      }
      v27 += v21;
      uint64_t v28 = (_WORD *)((char *)v28 + v22);
      ++v18;
    }
    while (v18 != v29);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_444vf(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_444vf_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_444vf_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(void *)(result + 28);
  unint64_t v6 = *result;
  unint64_t v7 = v5 * a2 / v6;
  unint64_t v8 = (v5 + v5 * a2) / v6;
  if (v8 != v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)(result + 20);
    unint64_t v11 = v7 + *(void *)(result + 44);
    unint64_t v12 = v8 - v7;
    uint64_t v13 = *((void *)result + 19);
    unint64_t v14 = (uint64_t *)*((void *)result + 17);
    unint64_t v15 = (void *)*((void *)result + 7);
    uint64_t v16 = **((void **)result + 8);
    uint64_t v17 = *v14;
    uint64_t v18 = v14[1];
    uint64_t v19 = v14[2];
    *(float *)&unsigned int v20 = (float)*(unsigned int *)(v13 + 128);
    float v21 = 8191.0 / *(float *)&v20;
    LOWORD(v20) = *(_WORD *)(v13 + 140);
    *(float *)&a5 = (float)v20;
    LOWORD(v20) = *(_WORD *)(v13 + 144);
    float v22 = (float)v20;
    LOWORD(v20) = *(_WORD *)(v13 + 146);
    float v23 = (float)v20;
    LOWORD(v20) = *(_WORD *)(v13 + 148);
    float v24 = (float)v20;
    LOWORD(v20) = *(_WORD *)(v13 + 150);
    float v25 = (float)v20;
    LOWORD(v20) = *(_WORD *)(v13 + 152);
    float v26 = (float)v20;
    float v27 = *(float *)(v13 + 36);
    float v28 = *(float *)(v13 + 40);
    float v29 = *(float *)(v13 + 44);
    float v98 = *(float *)(v13 + 52);
    float v99 = *(float *)(v13 + 48);
    float v96 = *(float *)(v13 + 60);
    float v97 = *(float *)(v13 + 56);
    float v30 = *(float *)(v13 + 68);
    float v95 = *(float *)(v13 + 64);
    float v31 = *(float *)(v13 + 72);
    float v32 = *(float *)(v13 + 76);
    float v33 = *(float *)(v13 + 80);
    float v34 = *(float *)(v13 + 84);
    float v35 = *(float *)(v13 + 88);
    float v36 = *(float *)(v13 + 92);
    float v38 = *(float *)(v13 + 96);
    float v37 = *(float *)(v13 + 100);
    float v39 = *(float *)(v13 + 104);
    float v40 = *(float *)(v13 + 108);
    uint64_t v41 = v13 + 164;
    uint64_t v42 = v13 + 16548;
    uint64_t v43 = v13 + 32932;
    float v44 = *(float *)(v13 + 112);
    float v45 = *(float *)(v13 + 116);
    float v46 = *(float *)(v13 + 120);
    uint64_t v47 = *((void *)result + 14);
    uint64_t v48 = (void *)*((void *)result + 16);
    unint64_t v49 = *((void *)result + 13) * a2 / v6 + *((void *)result + 15);
    uint64_t v50 = *(void *)(result + 36);
    uint64_t v51 = v48[2];
    if (v51) {
      double result = (unsigned __int8 *)(v51 + v49 * v19 + v47);
    }
    else {
      double result = 0;
    }
    float v54 = v48;
    uint64_t v53 = *v48;
    uint64_t v52 = v54[1];
    _ZF = v52 == 0;
    float v56 = (unsigned char *)(v52 + v49 * v18 + v47);
    if (_ZF) {
      float v56 = 0;
    }
    float v57 = (unsigned char *)(v53 + v49 * v17 + v47);
    uint64_t v58 = *v15 + v16 * v11 + 4 * v50;
    float32x2_t v59 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    do
    {
      if (v10)
      {
        uint64_t v60 = v10;
        float v61 = result;
        float v62 = v56;
        float v63 = v57;
        float v64 = (unsigned int *)v58;
        do
        {
          unsigned int v66 = *v64++;
          unsigned int v65 = v66;
          _D7 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v66), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v59), v21), 0), (float32x2_t)vdup_n_s32(0x45FFF800u))));
          _D7.i16[0] = *(_WORD *)(v41 + 2 * _D7.u32[0]);
          __asm { FCVT            S19, H7 }
          _D7.i16[0] = *(_WORD *)(v41 + 2 * _D7.u32[1]);
          __asm { FCVT            S20, H7 }
          _H0 = *(_WORD *)(v41
                         + 2
                         * llroundf(fminf(fmaxf(v21 * (float)((float)(v66 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
          __asm { FCVT            S21, H0 }
          float v75 = (float)((float)((float)(v44 * _S20) + (float)(v40 * _S19)) + (float)(v45 * _S21))
              + (float)(v46 * fmaxf(_S19, fmaxf(_S20, _S21)));
          float v76 = 8191.0;
          if (v75 <= 8191.0)
          {
            float v76 = v75;
            if (v75 < 0.0) {
              float v76 = 0.0;
            }
          }
          _H0 = *(_WORD *)(v42 + 2 * llroundf(v76));
          __asm { FCVT            S0, H0 }
          _S7 = _S19 * _S0;
          float v80 = _S20 * _S0;
          float v81 = _S21 * _S0;
          float v82 = (float)((float)(v32 * v80) + (float)(_S7 * v31)) + (float)(v81 * v33);
          float v83 = (float)((float)(v35 * v80) + (float)(_S7 * v34)) + (float)(v81 * v36);
          _S0 = (float)((float)(v37 * v80) + (float)(_S7 * v38)) + (float)(v81 * v39);
          LOWORD(_S7) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(v82, 0.0), 8191.0)));
          __asm { FCVT            S19, H7 }
          LOWORD(_S7) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(v83, 0.0), 8191.0)));
          __asm { FCVT            S20, H7 }
          LOWORD(_S0) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(_S0, 0.0), 8191.0)));
          __asm { FCVT            S21, H0 }
          float v88 = (float)((float)((float)(v28 * _S20) + (float)(v27 * _S19)) + (float)(v29 * _S21)) + v22;
          float v89 = v24;
          if (v88 <= v24)
          {
            float v89 = (float)((float)((float)(v28 * _S20) + (float)(v27 * _S19)) + (float)(v29 * _S21)) + v22;
            if (v88 < v22) {
              float v89 = v22;
            }
          }
          *v63++ = llroundf(v89);
          if (v62)
          {
            float v90 = (float)((float)(v23 + (float)(_S19 * v99)) + (float)(_S20 * v98)) + (float)(_S21 * v97);
            float v91 = v26;
            if (v90 <= v26)
            {
              float v91 = (float)((float)(v23 + (float)(_S19 * v99)) + (float)(_S20 * v98)) + (float)(_S21 * v97);
              if (v90 < v25) {
                float v91 = v25;
              }
            }
            float v92 = (float)(v23 + (float)(_S19 * v96)) + (float)(_S20 * v95);
            float v93 = v92 + (float)(_S21 * v30);
            *float v62 = llroundf(v91);
            float v94 = v26;
            if (v93 <= v26)
            {
              float v94 = v92 + (float)(_S21 * v30);
              if (v93 < v25) {
                float v94 = v25;
              }
            }
            v62[1] = llroundf(v94);
            v62 += 2;
          }
          if (v61) {
            *v61++ = 85 * (v65 >> 30);
          }
          --v60;
        }
        while (v60);
      }
      v58 += v16;
      v57 += v17;
      v56 += v18;
      result += v19;
      ++v9;
    }
    while (v9 != v12);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_444vf(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_444vf_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Mat_TRC_444vf_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5, float a6, float a7, float a8)
{
  uint64_t v8 = *(void *)(result + 28);
  unint64_t v9 = *result;
  unint64_t v10 = v8 * a2 / v9;
  unint64_t v11 = (v8 + v8 * a2) / v9;
  if (v11 != v10)
  {
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)(result + 20);
    unint64_t v14 = v10 + *(void *)(result + 44);
    unint64_t v15 = v11 - v10;
    uint64_t v16 = *((void *)result + 19);
    uint64_t v17 = (uint64_t *)*((void *)result + 17);
    uint64_t v18 = (void *)*((void *)result + 7);
    uint64_t v19 = **((void **)result + 8);
    uint64_t v20 = *v17;
    uint64_t v21 = v17[1];
    uint64_t v22 = v17[2];
    float v23 = 8191.0 / (float)*(unsigned int *)(v16 + 128);
    LOWORD(a5) = *(_WORD *)(v16 + 140);
    *(float *)&a5 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v16 + 144);
    float v24 = (float)LODWORD(a6);
    LOWORD(a7) = *(_WORD *)(v16 + 146);
    float v25 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v16 + 148);
    float v26 = (float)LODWORD(a8);
    LOWORD(a8) = *(_WORD *)(v16 + 150);
    float v27 = (float)LODWORD(a8);
    LOWORD(a8) = *(_WORD *)(v16 + 152);
    float v28 = (float)LODWORD(a8);
    float v29 = *(float *)(v16 + 36);
    float v30 = *(float *)(v16 + 40);
    float v31 = *(float *)(v16 + 44);
    float v86 = *(float *)(v16 + 52);
    float v87 = *(float *)(v16 + 48);
    float v32 = *(float *)(v16 + 60);
    float v85 = *(float *)(v16 + 56);
    float v33 = *(float *)(v16 + 64);
    float v34 = *(float *)(v16 + 68);
    float v35 = *(float *)(v16 + 72);
    float v36 = *(float *)(v16 + 76);
    float v37 = *(float *)(v16 + 80);
    float v38 = *(float *)(v16 + 84);
    float v39 = *(float *)(v16 + 88);
    float v40 = *(float *)(v16 + 92);
    float v42 = *(float *)(v16 + 96);
    float v41 = *(float *)(v16 + 100);
    float v43 = *(float *)(v16 + 104);
    uint64_t v44 = v16 + 164;
    uint64_t v45 = v16 + 16548;
    uint64_t v46 = *((void *)result + 14);
    uint64_t v47 = (uint64_t *)*((void *)result + 16);
    unint64_t v48 = *((void *)result + 13) * a2 / v9 + *((void *)result + 15);
    uint64_t v49 = *(void *)(result + 36);
    uint64_t v50 = v47[2];
    if (v50) {
      uint64_t v51 = (unsigned char *)(v50 + v48 * v22 + v46);
    }
    else {
      uint64_t v51 = 0;
    }
    uint64_t v53 = *v47;
    uint64_t v52 = *(void *)(*((void *)result + 16) + 8);
    _ZF = v52 == 0;
    double result = (unsigned __int8 *)(v52 + v48 * v21 + v46);
    if (_ZF) {
      double result = 0;
    }
    float v55 = (unsigned char *)(v53 + v48 * v20 + v46);
    uint64_t v56 = *v18 + v19 * v14 + 4 * v49;
    float32x2_t v57 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    do
    {
      if (v13)
      {
        uint64_t v58 = v13;
        float32x2_t v59 = (unsigned int *)v56;
        uint64_t v60 = v51;
        float v61 = result;
        float v62 = v55;
        do
        {
          unsigned int v64 = *v59++;
          unsigned int v63 = v64;
          _D7 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v64), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v57), v23), 0), (float32x2_t)vdup_n_s32(0x45FFF800u))));
          _D7.i16[0] = *(_WORD *)(v44 + 2 * _D7.u32[0]);
          __asm { FCVT            S7, H7 }
          _H12 = *(_WORD *)(v44 + 2 * _D7.u32[1]);
          __asm { FCVT            S12, H12 }
          _H5 = *(_WORD *)(v44
                         + 2
                         * llroundf(fminf(fmaxf(v23 * (float)((float)(v64 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
          __asm { FCVT            S5, H5 }
          float v73 = (float)((float)(v36 * _S12) + (float)(*(float *)_D7.i32 * v35)) + (float)(_S5 * v37);
          float v74 = (float)((float)(v39 * _S12) + (float)(*(float *)_D7.i32 * v38)) + (float)(_S5 * v40);
          _S5 = (float)((float)(v41 * _S12) + (float)(*(float *)_D7.i32 * v42)) + (float)(_S5 * v43);
          _D7.i16[0] = *(_WORD *)(v45 + 2 * llroundf(fminf(fmaxf(v73, 0.0), 8191.0)));
          __asm { FCVT            S15, H7 }
          _D7.i16[0] = *(_WORD *)(v45 + 2 * llroundf(fminf(fmaxf(v74, 0.0), 8191.0)));
          __asm { FCVT            S12, H7 }
          LOWORD(_S5) = *(_WORD *)(v45 + 2 * llroundf(fminf(fmaxf(_S5, 0.0), 8191.0)));
          __asm { FCVT            S13, H5 }
          float v79 = (float)((float)((float)(v30 * _S12) + (float)(v29 * _S15)) + (float)(v31 * _S13)) + v24;
          float v80 = v26;
          if (v79 <= v26)
          {
            float v80 = (float)((float)((float)(v30 * _S12) + (float)(v29 * _S15)) + (float)(v31 * _S13)) + v24;
            if (v79 < v24) {
              float v80 = v24;
            }
          }
          *v62++ = llroundf(v80);
          if (v61)
          {
            float v81 = (float)((float)(v25 + (float)(_S15 * v87)) + (float)(_S12 * v86)) + (float)(_S13 * v85);
            float v82 = v28;
            if (v81 <= v28)
            {
              float v82 = (float)((float)(v25 + (float)(_S15 * v87)) + (float)(_S12 * v86)) + (float)(_S13 * v85);
              if (v81 < v27) {
                float v82 = v27;
              }
            }
            float v83 = (float)((float)(v25 + (float)(_S15 * v32)) + (float)(_S12 * v33)) + (float)(_S13 * v34);
            *float v61 = llroundf(v82);
            float v84 = v28;
            if (v83 <= v28)
            {
              float v84 = v83;
              if (v83 < v27) {
                float v84 = v27;
              }
            }
            v61[1] = llroundf(v84);
            v61 += 2;
          }
          if (v60) {
            *v60++ = 85 * (v63 >> 30);
          }
          --v58;
        }
        while (v58);
      }
      v56 += v19;
      v55 += v20;
      result += v21;
      v51 += v22;
      ++v12;
    }
    while (v12 != v15);
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_444vf(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_444vf_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_rgb_444vf_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, float a8, float a9)
{
  uint64_t v9 = *(void *)(result + 28);
  unint64_t v10 = *result;
  unint64_t v11 = v9 * a2 / v10;
  unint64_t v12 = (v9 + v9 * a2) / v10;
  if (v12 != v11)
  {
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)(result + 20);
    unint64_t v15 = v11 + *(void *)(result + 44);
    unint64_t v16 = v12 - v11;
    uint64_t v17 = *((void *)result + 19);
    uint64_t v18 = (uint64_t *)*((void *)result + 17);
    uint64_t v19 = (void *)*((void *)result + 7);
    uint64_t v20 = **((void **)result + 8);
    uint64_t v21 = *v18;
    uint64_t v22 = v18[1];
    uint64_t v23 = v18[2];
    *(float *)&unsigned int v24 = (float)*(unsigned int *)(v17 + 136);
    float v25 = *(float *)&v24 / (float)*(unsigned int *)(v17 + 128);
    LOWORD(v24) = *(_WORD *)(v17 + 140);
    float v26 = (float)v24;
    LOWORD(a5) = *(_WORD *)(v17 + 144);
    float v27 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v17 + 146);
    float v28 = (float)LODWORD(a6);
    LOWORD(a7) = *(_WORD *)(v17 + 148);
    float v29 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v17 + 150);
    float v30 = (float)LODWORD(a8);
    LOWORD(a9) = *(_WORD *)(v17 + 152);
    float v31 = (float)LODWORD(a9);
    float v32 = *(float *)(v17 + 36);
    float v33 = *(float *)(v17 + 40);
    float v34 = *(float *)(v17 + 44);
    float v35 = *(float *)(v17 + 48);
    float v36 = *(float *)(v17 + 52);
    float v37 = *(float *)(v17 + 56);
    float v38 = *(float *)(v17 + 60);
    float v39 = *(float *)(v17 + 64);
    float v40 = *(float *)(v17 + 68);
    uint64_t v41 = *((void *)result + 14);
    unint64_t v42 = *((void *)result + 13) * a2;
    float v43 = (void *)*((void *)result + 16);
    unint64_t v44 = v42 / v10 + *((void *)result + 15);
    uint64_t v45 = *(void *)(result + 36);
    uint64_t v46 = v43[2];
    if (v46) {
      uint64_t v47 = (unsigned char *)(v46 + v44 * v23 + v41);
    }
    else {
      uint64_t v47 = 0;
    }
    uint64_t v50 = v43;
    uint64_t v48 = *v43;
    uint64_t v49 = v50[1];
    BOOL v51 = v49 == 0;
    uint64_t v52 = (unsigned char *)(v49 + v44 * v22 + v41);
    if (v51) {
      uint64_t v52 = 0;
    }
    uint64_t v53 = (unsigned char *)(v48 + v44 * v21 + v41);
    double result = (unsigned __int8 *)(*v19 + v20 * v15 + 4 * v45);
    do
    {
      if (v14)
      {
        uint64_t v54 = v14;
        float v55 = (unsigned int *)result;
        uint64_t v56 = v47;
        float32x2_t v57 = v52;
        uint64_t v58 = v53;
        do
        {
          unsigned int v60 = *v55++;
          unsigned int v59 = v60;
          float v61 = v25 * (float)((float)(v60 & 0x3FF) - v26);
          float v62 = v25 * (float)((float)((v60 >> 10) & 0x3FF) - v26);
          float v63 = v25 * (float)((float)((v60 >> 20) & 0x3FF) - v26);
          float v64 = (float)((float)((float)(v33 * v62) + (float)(v32 * v63)) + (float)(v34 * v61)) + v27;
          float v65 = v29;
          if (v64 <= v29)
          {
            float v65 = (float)((float)((float)(v33 * v62) + (float)(v32 * v63)) + (float)(v34 * v61)) + v27;
            if (v64 < v27) {
              float v65 = v27;
            }
          }
          *v58++ = llroundf(v65);
          if (v57)
          {
            float v66 = (float)((float)(v28 + (float)(v63 * v35)) + (float)(v62 * v36)) + (float)(v61 * v37);
            float v67 = v31;
            if (v66 <= v31)
            {
              float v67 = (float)((float)(v28 + (float)(v63 * v35)) + (float)(v62 * v36)) + (float)(v61 * v37);
              if (v66 < v30) {
                float v67 = v30;
              }
            }
            float v68 = (float)((float)(v28 + (float)(v63 * v38)) + (float)(v62 * v39)) + (float)(v61 * v40);
            *float32x2_t v57 = llroundf(v67);
            float v69 = v31;
            if (v68 <= v31)
            {
              float v69 = v68;
              if (v68 < v30) {
                float v69 = v30;
              }
            }
            v57[1] = llroundf(v69);
            v57 += 2;
          }
          if (v56) {
            *v56++ = 85 * (v59 >> 30);
          }
          --v54;
        }
        while (v54);
      }
      result += v20;
      v53 += v21;
      v52 += v22;
      v47 += v23;
      ++v13;
    }
    while (v13 != v16);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_xf444(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_xf444_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_xf444_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(void *)(result + 28);
  unint64_t v6 = *result;
  unint64_t v7 = v5 * a2 / v6;
  unint64_t v8 = (v5 + v5 * a2) / v6;
  if (v8 != v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)(result + 20);
    unint64_t v11 = v7 + *(void *)(result + 44);
    unint64_t v12 = v8 - v7;
    uint64_t v13 = *((void *)result + 19);
    uint64_t v14 = (uint64_t *)*((void *)result + 17);
    unint64_t v15 = (void *)*((void *)result + 7);
    uint64_t v16 = **((void **)result + 8);
    uint64_t v17 = *v14;
    uint64_t v18 = v14[1];
    uint64_t v19 = v14[2];
    *(float *)&unsigned int v20 = (float)*(unsigned int *)(v13 + 128);
    float v21 = 8191.0 / *(float *)&v20;
    LOWORD(v20) = *(_WORD *)(v13 + 140);
    *(float *)&a5 = (float)v20;
    LOWORD(v20) = *(_WORD *)(v13 + 144);
    float v22 = (float)v20;
    LOWORD(v20) = *(_WORD *)(v13 + 146);
    float v23 = (float)v20;
    LOWORD(v20) = *(_WORD *)(v13 + 148);
    float v24 = (float)v20;
    LOWORD(v20) = *(_WORD *)(v13 + 150);
    float v25 = (float)v20;
    LOWORD(v20) = *(_WORD *)(v13 + 152);
    float v26 = (float)v20;
    float v27 = *(float *)(v13 + 36);
    float v28 = *(float *)(v13 + 40);
    float v29 = *(float *)(v13 + 44);
    float v100 = *(float *)(v13 + 52);
    float v101 = *(float *)(v13 + 48);
    float v98 = *(float *)(v13 + 60);
    float v99 = *(float *)(v13 + 56);
    float v30 = *(float *)(v13 + 68);
    float v97 = *(float *)(v13 + 64);
    float v31 = *(float *)(v13 + 72);
    float v32 = *(float *)(v13 + 76);
    float v33 = *(float *)(v13 + 80);
    float v34 = *(float *)(v13 + 84);
    float v35 = *(float *)(v13 + 88);
    float v36 = *(float *)(v13 + 92);
    float v38 = *(float *)(v13 + 96);
    float v37 = *(float *)(v13 + 100);
    float v39 = *(float *)(v13 + 104);
    float v40 = *(float *)(v13 + 108);
    uint64_t v41 = v13 + 164;
    uint64_t v42 = v13 + 16548;
    uint64_t v43 = v13 + 32932;
    float v44 = *(float *)(v13 + 112);
    float v45 = *(float *)(v13 + 116);
    float v46 = *(float *)(v13 + 120);
    uint64_t v47 = *((void *)result + 14);
    uint64_t v48 = (void *)*((void *)result + 16);
    unint64_t v49 = *((void *)result + 13) * a2 / v6 + *((void *)result + 15);
    uint64_t v50 = *(void *)(result + 36);
    unsigned int v51 = *(unsigned __int8 *)(v13 + 132);
    if (v51 >= 0x11) {
      char v52 = 0;
    }
    else {
      char v52 = 16 - v51;
    }
    uint64_t v53 = v48[2];
    if (v53) {
      double result = (unsigned __int8 *)(v53 + v49 * v19 + 2 * v47);
    }
    else {
      double result = 0;
    }
    uint64_t v56 = v48;
    uint64_t v55 = *v48;
    uint64_t v54 = v56[1];
    _ZF = v54 == 0;
    uint64_t v58 = v54 + v49 * v18 + 2 * v47;
    if (_ZF) {
      uint64_t v58 = 0;
    }
    uint64_t v59 = v55 + v49 * v17 + 2 * v47;
    uint64_t v60 = *v15 + v16 * v11 + 4 * v50;
    float32x2_t v61 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    do
    {
      if (v10)
      {
        uint64_t v62 = v10;
        float v63 = result;
        float v64 = (_WORD *)v58;
        float v65 = (_WORD *)v59;
        float v66 = (unsigned int *)v60;
        do
        {
          unsigned int v68 = *v66++;
          unsigned int v67 = v68;
          _D7 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v68), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v61), v21), 0), (float32x2_t)vdup_n_s32(0x45FFF800u))));
          _D7.i16[0] = *(_WORD *)(v41 + 2 * _D7.u32[0]);
          __asm { FCVT            S19, H7 }
          _D7.i16[0] = *(_WORD *)(v41 + 2 * _D7.u32[1]);
          __asm { FCVT            S20, H7 }
          _H0 = *(_WORD *)(v41
                         + 2
                         * llroundf(fminf(fmaxf(v21 * (float)((float)(v68 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
          __asm { FCVT            S21, H0 }
          float v77 = (float)((float)((float)(v44 * _S20) + (float)(v40 * _S19)) + (float)(v45 * _S21))
              + (float)(v46 * fmaxf(_S19, fmaxf(_S20, _S21)));
          float v78 = 8191.0;
          if (v77 <= 8191.0)
          {
            float v78 = v77;
            if (v77 < 0.0) {
              float v78 = 0.0;
            }
          }
          _H0 = *(_WORD *)(v42 + 2 * llroundf(v78));
          __asm { FCVT            S0, H0 }
          _S7 = _S19 * _S0;
          float v82 = _S20 * _S0;
          float v83 = _S21 * _S0;
          float v84 = (float)((float)(v32 * v82) + (float)(_S7 * v31)) + (float)(v83 * v33);
          float v85 = (float)((float)(v35 * v82) + (float)(_S7 * v34)) + (float)(v83 * v36);
          _S0 = (float)((float)(v37 * v82) + (float)(_S7 * v38)) + (float)(v83 * v39);
          LOWORD(_S7) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(v84, 0.0), 8191.0)));
          __asm { FCVT            S19, H7 }
          LOWORD(_S7) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(v85, 0.0), 8191.0)));
          __asm { FCVT            S20, H7 }
          LOWORD(_S0) = *(_WORD *)(v43 + 2 * llroundf(fminf(fmaxf(_S0, 0.0), 8191.0)));
          __asm { FCVT            S21, H0 }
          float v90 = (float)((float)((float)(v28 * _S20) + (float)(v27 * _S19)) + (float)(v29 * _S21)) + v22;
          float v91 = v24;
          if (v90 <= v24)
          {
            float v91 = (float)((float)((float)(v28 * _S20) + (float)(v27 * _S19)) + (float)(v29 * _S21)) + v22;
            if (v90 < v22) {
              float v91 = v22;
            }
          }
          *v65++ = llroundf(v91) << v52;
          if (v64)
          {
            float v92 = (float)((float)(v23 + (float)(_S19 * v101)) + (float)(_S20 * v100)) + (float)(_S21 * v99);
            float v93 = v26;
            if (v92 <= v26)
            {
              float v93 = (float)((float)(v23 + (float)(_S19 * v101)) + (float)(_S20 * v100)) + (float)(_S21 * v99);
              if (v92 < v25) {
                float v93 = v25;
              }
            }
            float v94 = (float)(v23 + (float)(_S19 * v98)) + (float)(_S20 * v97);
            float v95 = v94 + (float)(_S21 * v30);
            *float v64 = llroundf(v93) << v52;
            float v96 = v26;
            if (v95 <= v26)
            {
              float v96 = v94 + (float)(_S21 * v30);
              if (v95 < v25) {
                float v96 = v25;
              }
            }
            v64[1] = llroundf(v96) << v52;
            v64 += 2;
          }
          if (v63) {
            *v63++ = 21845 * (v67 >> 30);
          }
          --v62;
        }
        while (v62);
      }
      v60 += v16;
      v59 += v17;
      v58 += v18;
      result += v19;
      ++v9;
    }
    while (v9 != v12);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_xf444(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_xf444_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Mat_TRC_xf444_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5, float a6, float a7, float a8)
{
  uint64_t v8 = *(void *)(result + 28);
  unint64_t v9 = *result;
  unint64_t v10 = v8 * a2 / v9;
  unint64_t v11 = (v8 + v8 * a2) / v9;
  if (v11 != v10)
  {
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)(result + 20);
    unint64_t v14 = v10 + *(void *)(result + 44);
    unint64_t v15 = v11 - v10;
    uint64_t v16 = *((void *)result + 19);
    uint64_t v17 = (uint64_t *)*((void *)result + 17);
    uint64_t v18 = (void *)*((void *)result + 7);
    uint64_t v19 = **((void **)result + 8);
    uint64_t v20 = *v17;
    uint64_t v21 = v17[1];
    uint64_t v22 = v17[2];
    float v23 = 8191.0 / (float)*(unsigned int *)(v16 + 128);
    LOWORD(a5) = *(_WORD *)(v16 + 140);
    *(float *)&a5 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v16 + 144);
    float v24 = (float)LODWORD(a6);
    LOWORD(a7) = *(_WORD *)(v16 + 146);
    float v25 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v16 + 148);
    float v26 = (float)LODWORD(a8);
    LOWORD(a8) = *(_WORD *)(v16 + 150);
    float v27 = (float)LODWORD(a8);
    LOWORD(a8) = *(_WORD *)(v16 + 152);
    float v28 = (float)LODWORD(a8);
    float v29 = *(float *)(v16 + 36);
    float v30 = *(float *)(v16 + 40);
    float v31 = *(float *)(v16 + 44);
    float v88 = *(float *)(v16 + 52);
    float v89 = *(float *)(v16 + 48);
    float v32 = *(float *)(v16 + 60);
    float v87 = *(float *)(v16 + 56);
    float v33 = *(float *)(v16 + 64);
    float v34 = *(float *)(v16 + 68);
    float v35 = *(float *)(v16 + 72);
    float v36 = *(float *)(v16 + 76);
    float v37 = *(float *)(v16 + 80);
    float v38 = *(float *)(v16 + 84);
    float v39 = *(float *)(v16 + 88);
    float v40 = *(float *)(v16 + 92);
    float v42 = *(float *)(v16 + 96);
    float v41 = *(float *)(v16 + 100);
    float v43 = *(float *)(v16 + 104);
    uint64_t v44 = v16 + 164;
    uint64_t v45 = v16 + 16548;
    uint64_t v46 = *((void *)result + 14);
    uint64_t v47 = (uint64_t *)*((void *)result + 16);
    unint64_t v48 = *((void *)result + 13) * a2 / v9 + *((void *)result + 15);
    uint64_t v49 = *(void *)(result + 36);
    unsigned int v50 = *(unsigned __int8 *)(v16 + 132);
    if (v50 >= 0x11) {
      char v51 = 0;
    }
    else {
      char v51 = 16 - v50;
    }
    uint64_t v52 = v47[2];
    if (v52) {
      uint64_t v53 = v52 + v48 * v22 + 2 * v46;
    }
    else {
      uint64_t v53 = 0;
    }
    uint64_t v55 = *v47;
    uint64_t v54 = *(void *)(*((void *)result + 16) + 8);
    _ZF = v54 == 0;
    double result = (unsigned __int8 *)(v54 + v48 * v21 + 2 * v46);
    if (_ZF) {
      double result = 0;
    }
    uint64_t v57 = v55 + v48 * v20 + 2 * v46;
    uint64_t v58 = *v18 + v19 * v14 + 4 * v49;
    float32x2_t v59 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    do
    {
      if (v13)
      {
        uint64_t v60 = v13;
        float32x2_t v61 = (unsigned int *)v58;
        uint64_t v62 = (_WORD *)v53;
        float v63 = result;
        float v64 = (_WORD *)v57;
        do
        {
          unsigned int v66 = *v61++;
          unsigned int v65 = v66;
          _D7 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v66), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v59), v23), 0), (float32x2_t)vdup_n_s32(0x45FFF800u))));
          _D7.i16[0] = *(_WORD *)(v44 + 2 * _D7.u32[0]);
          __asm { FCVT            S7, H7 }
          _H12 = *(_WORD *)(v44 + 2 * _D7.u32[1]);
          __asm { FCVT            S12, H12 }
          _H5 = *(_WORD *)(v44
                         + 2
                         * llroundf(fminf(fmaxf(v23 * (float)((float)(v66 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
          __asm { FCVT            S5, H5 }
          float v75 = (float)((float)(v36 * _S12) + (float)(*(float *)_D7.i32 * v35)) + (float)(_S5 * v37);
          float v76 = (float)((float)(v39 * _S12) + (float)(*(float *)_D7.i32 * v38)) + (float)(_S5 * v40);
          _S5 = (float)((float)(v41 * _S12) + (float)(*(float *)_D7.i32 * v42)) + (float)(_S5 * v43);
          _D7.i16[0] = *(_WORD *)(v45 + 2 * llroundf(fminf(fmaxf(v75, 0.0), 8191.0)));
          __asm { FCVT            S15, H7 }
          _D7.i16[0] = *(_WORD *)(v45 + 2 * llroundf(fminf(fmaxf(v76, 0.0), 8191.0)));
          __asm { FCVT            S12, H7 }
          LOWORD(_S5) = *(_WORD *)(v45 + 2 * llroundf(fminf(fmaxf(_S5, 0.0), 8191.0)));
          __asm { FCVT            S13, H5 }
          float v81 = (float)((float)((float)(v30 * _S12) + (float)(v29 * _S15)) + (float)(v31 * _S13)) + v24;
          float v82 = v26;
          if (v81 <= v26)
          {
            float v82 = (float)((float)((float)(v30 * _S12) + (float)(v29 * _S15)) + (float)(v31 * _S13)) + v24;
            if (v81 < v24) {
              float v82 = v24;
            }
          }
          *v64++ = llroundf(v82) << v51;
          if (v63)
          {
            float v83 = (float)((float)(v25 + (float)(_S15 * v89)) + (float)(_S12 * v88)) + (float)(_S13 * v87);
            float v84 = v28;
            if (v83 <= v28)
            {
              float v84 = (float)((float)(v25 + (float)(_S15 * v89)) + (float)(_S12 * v88)) + (float)(_S13 * v87);
              if (v83 < v27) {
                float v84 = v27;
              }
            }
            float v85 = (float)((float)(v25 + (float)(_S15 * v32)) + (float)(_S12 * v33)) + (float)(_S13 * v34);
            *float v63 = llroundf(v84) << v51;
            float v86 = v28;
            if (v85 <= v28)
            {
              float v86 = v85;
              if (v85 < v27) {
                float v86 = v27;
              }
            }
            v63[1] = llroundf(v86) << v51;
            v63 += 2;
          }
          if (v62) {
            *v62++ = 21845 * (v65 >> 30);
          }
          --v60;
        }
        while (v60);
      }
      v58 += v19;
      v57 += v20;
      result += v21;
      v53 += v22;
      ++v12;
    }
    while (v12 != v15);
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_xf444(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_xf444_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_rgb_xf444_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, float a5, float a6, float a7, float a8, float a9)
{
  uint64_t v9 = *(void *)(result + 28);
  unint64_t v10 = *result;
  unint64_t v11 = v9 * a2 / v10;
  unint64_t v12 = (v9 + v9 * a2) / v10;
  if (v12 != v11)
  {
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)(result + 20);
    unint64_t v15 = v11 + *(void *)(result + 44);
    unint64_t v16 = v12 - v11;
    uint64_t v17 = *((void *)result + 19);
    uint64_t v18 = (uint64_t *)*((void *)result + 17);
    uint64_t v19 = (void *)*((void *)result + 7);
    uint64_t v20 = **((void **)result + 8);
    uint64_t v21 = *v18;
    uint64_t v22 = v18[1];
    uint64_t v23 = v18[2];
    *(float *)&unsigned int v24 = (float)*(unsigned int *)(v17 + 136);
    float v25 = *(float *)&v24 / (float)*(unsigned int *)(v17 + 128);
    LOWORD(v24) = *(_WORD *)(v17 + 140);
    float v26 = (float)v24;
    LOWORD(a5) = *(_WORD *)(v17 + 144);
    float v27 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v17 + 146);
    float v28 = (float)LODWORD(a6);
    LOWORD(a7) = *(_WORD *)(v17 + 148);
    float v29 = (float)LODWORD(a7);
    LOWORD(a8) = *(_WORD *)(v17 + 150);
    float v30 = (float)LODWORD(a8);
    LOWORD(a9) = *(_WORD *)(v17 + 152);
    float v31 = (float)LODWORD(a9);
    float v32 = *(float *)(v17 + 36);
    float v33 = *(float *)(v17 + 40);
    float v34 = *(float *)(v17 + 44);
    float v35 = *(float *)(v17 + 48);
    float v36 = *(float *)(v17 + 52);
    float v37 = *(float *)(v17 + 56);
    float v38 = *(float *)(v17 + 60);
    float v39 = *(float *)(v17 + 64);
    float v40 = *(float *)(v17 + 68);
    uint64_t v41 = *((void *)result + 14);
    unint64_t v42 = *((void *)result + 13) * a2;
    float v43 = (void *)*((void *)result + 16);
    unint64_t v44 = v42 / v10 + *((void *)result + 15);
    uint64_t v45 = *(void *)(result + 36);
    unsigned int v46 = *(unsigned __int8 *)(v17 + 132);
    if (v46 >= 0x11) {
      char v47 = 0;
    }
    else {
      char v47 = 16 - v46;
    }
    uint64_t v48 = v43[2];
    if (v48) {
      uint64_t v49 = v48 + v44 * v23 + 2 * v41;
    }
    else {
      uint64_t v49 = 0;
    }
    uint64_t v52 = v43;
    uint64_t v50 = *v43;
    uint64_t v51 = v52[1];
    BOOL v53 = v51 == 0;
    uint64_t v54 = v51 + v44 * v22 + 2 * v41;
    if (v53) {
      uint64_t v54 = 0;
    }
    uint64_t v55 = v50 + v44 * v21 + 2 * v41;
    double result = (unsigned __int8 *)(*v19 + v20 * v15 + 4 * v45);
    char v56 = v47;
    do
    {
      if (v14)
      {
        uint64_t v57 = v14;
        uint64_t v58 = (unsigned int *)result;
        float32x2_t v59 = (_WORD *)v49;
        uint64_t v60 = (_WORD *)v54;
        float32x2_t v61 = (_WORD *)v55;
        do
        {
          unsigned int v63 = *v58++;
          unsigned int v62 = v63;
          float v64 = v25 * (float)((float)(v63 & 0x3FF) - v26);
          float v65 = v25 * (float)((float)((v63 >> 10) & 0x3FF) - v26);
          float v66 = v25 * (float)((float)((v63 >> 20) & 0x3FF) - v26);
          float v67 = (float)((float)((float)(v33 * v65) + (float)(v32 * v66)) + (float)(v34 * v64)) + v27;
          float v68 = v29;
          if (v67 <= v29)
          {
            float v68 = (float)((float)((float)(v33 * v65) + (float)(v32 * v66)) + (float)(v34 * v64)) + v27;
            if (v67 < v27) {
              float v68 = v27;
            }
          }
          *v61++ = llroundf(v68) << v56;
          if (v60)
          {
            float v69 = (float)((float)(v28 + (float)(v66 * v35)) + (float)(v65 * v36)) + (float)(v64 * v37);
            float v70 = v31;
            if (v69 <= v31)
            {
              float v70 = (float)((float)(v28 + (float)(v66 * v35)) + (float)(v65 * v36)) + (float)(v64 * v37);
              if (v69 < v30) {
                float v70 = v30;
              }
            }
            float v71 = (float)((float)(v28 + (float)(v66 * v38)) + (float)(v65 * v39)) + (float)(v64 * v40);
            *uint64_t v60 = llroundf(v70) << v56;
            float v72 = v31;
            if (v71 <= v31)
            {
              float v72 = v71;
              if (v71 < v30) {
                float v72 = v30;
              }
            }
            v60[1] = llroundf(v72) << v56;
            v60 += 2;
          }
          if (v59) {
            *v59++ = 21845 * (v62 >> 30);
          }
          --v57;
        }
        while (v57);
      }
      result += v20;
      v55 += v21;
      v54 += v22;
      v49 += v23;
      ++v13;
    }
    while (v13 != v16);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_BGRA(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_BGRA_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_BGRA_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(void *)(result + 28);
  unint64_t v6 = *result;
  unint64_t v7 = v5 * a2 / v6;
  unint64_t v8 = (v5 + v5 * a2) / v6;
  if (v8 != v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)(result + 20);
    unint64_t v11 = v7 + *(void *)(result + 44);
    unint64_t v12 = v8 - v7;
    uint64_t v13 = *((void *)result + 19);
    uint64_t v14 = (uint64_t *)*((void *)result + 7);
    unint64_t v15 = (uint64_t *)*((void *)result + 8);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = **((void **)result + 17);
    float v19 = 8191.0 / (float)*(unsigned int *)(v13 + 128);
    LOWORD(a5) = *(_WORD *)(v13 + 140);
    *(float *)&a5 = (float)LODWORD(a5);
    float v20 = *(float *)(v13 + 72);
    float v21 = *(float *)(v13 + 76);
    float v22 = *(float *)(v13 + 80);
    float v23 = *(float *)(v13 + 84);
    float v24 = *(float *)(v13 + 88);
    float v25 = *(float *)(v13 + 92);
    float v26 = *(float *)(v13 + 96);
    float v27 = *(float *)(v13 + 100);
    uint64_t v28 = v13 + 164;
    uint64_t v29 = v13 + 16548;
    uint64_t v30 = v13 + 32932;
    float v31 = *(float *)(v13 + 104);
    float v32 = *(float *)(v13 + 108);
    float v33 = *(float *)(v13 + 112);
    float v34 = *(float *)(v13 + 116);
    float v35 = *(float *)(v13 + 120);
    uint64_t v36 = *((void *)result + 14);
    float v37 = (void *)*((void *)result + 16);
    unint64_t v38 = *((void *)result + 13) * a2 / v6 + *((void *)result + 15);
    uint64_t v39 = *(void *)(result + 36);
    uint64_t v40 = *(unsigned __int8 *)(v13 + 161);
    double result = (unsigned __int8 *)*(unsigned __int8 *)(v13 + 160);
    uint64_t v41 = *v37 + v38 * v18;
    uint64_t v42 = *(unsigned __int8 *)(v13 + 159);
    uint64_t v43 = *(unsigned __int8 *)(v13 + 158);
    uint64_t v44 = v41 + v36;
    uint64_t v46 = *v14;
    uint64_t v45 = v14[1];
    uint64_t v47 = v45 + v17 * v11 + 4 * v39;
    if (!v45) {
      uint64_t v47 = 0;
    }
    float32x2_t v48 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    uint64_t v49 = v46 + v16 * v11 + 4 * v39;
    float32x2_t v50 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v10)
      {
        uint64_t v51 = v10;
        uint64_t v52 = (unsigned int *)v49;
        uint64_t v53 = v44;
        uint64_t v54 = (char *)v47;
        do
        {
          unsigned int v56 = *v52++;
          unsigned int v55 = v56;
          if (v54)
          {
            char v58 = *v54++;
            LOBYTE(v57) = v58;
          }
          else
          {
            unsigned int v57 = v55 >> 30;
          }
          _D31 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v55), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v48), v19), 0), v50)));
          _D31.i16[0] = *(_WORD *)(v28 + 2 * _D31.u32[0]);
          __asm { FCVT            S31, H31 }
          _H9 = *(_WORD *)(v28 + 2 * _D31.u32[1]);
          __asm { FCVT            S8, H9 }
          _H9 = *(_WORD *)(v28
                         + 2
                         * llroundf(fminf(fmaxf(v19 * (float)((float)(v55 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
          __asm { FCVT            S10, H9 }
          float v69 = (float)((float)((float)(v33 * _S8) + (float)(v32 * _S31)) + (float)(v34 * _S10))
              + (float)(v35 * fmaxf(_S31, fmaxf(_S8, _S10)));
          float v70 = 8191.0;
          if (v69 <= 8191.0)
          {
            float v70 = v69;
            if (v69 < 0.0) {
              float v70 = 0.0;
            }
          }
          _H9 = *(_WORD *)(v29 + 2 * llroundf(v70));
          __asm { FCVT            S11, H9 }
          float v73 = _S31 * _S11;
          float v74 = _S8 * _S11;
          float v75 = _S10 * _S11;
          if (*(short float *)(v30
                              + 2
                              * llroundf(fminf(fmaxf((float)((float)(v21 * v74) + (float)(v73 * v20))+ (float)((float)(_S10 * _S11) * v22), 0.0), 8191.0))) <= COERCE_SHORT_FLOAT(23544))
          {
            __asm { FCMP            H10, #0 }
            if (_NF) {
              _S10 = 0.0;
            }
            else {
              __asm { FCVT            S10, H10 }
            }
          }
          else
          {
            _S10 = 255.0;
          }
          float v78 = (float)((float)(v24 * v74) + (float)(v73 * v23)) + (float)(v75 * v25);
          float v79 = (float)((float)(v27 * v74) + (float)(v73 * v26)) + (float)(v75 * v31);
          short float v80 = *(short float *)(v30 + 2 * llroundf(fminf(fmaxf(v78, 0.0), 8191.0)));
          short float v81 = *(short float *)(v30 + 2 * llroundf(fminf(fmaxf(v79, 0.0), 8191.0)));
          *(unsigned char *)(v53 + v43) = llroundf(_S10);
          if (v80 <= COERCE_SHORT_FLOAT(23544))
          {
            __asm { FCMP            H8, #0 }
            if (_NF) {
              _S8 = 0.0;
            }
            else {
              __asm { FCVT            S8, H8 }
            }
          }
          else
          {
            _S8 = 255.0;
          }
          *(unsigned char *)(v53 + v42) = llroundf(_S8);
          if (v81 <= COERCE_SHORT_FLOAT(23544))
          {
            __asm { FCMP            H31, #0 }
            if (_NF) {
              _S31 = 0.0;
            }
            else {
              __asm { FCVT            S31, H31 }
            }
          }
          else
          {
            _S31 = 255.0;
          }
          result[v53] = llroundf(_S31);
          *(unsigned char *)(v53 + v40) = 85 * v57;
          v53 += 4;
          --v51;
        }
        while (v51);
      }
      v49 += v16;
      v47 += v17;
      v44 += v18;
      ++v9;
    }
    while (v9 != v12);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_BGRA(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_BGRA_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Mat_TRC_BGRA_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(void *)(result + 28);
  unint64_t v6 = *result;
  unint64_t v7 = v5 * a2 / v6;
  unint64_t v8 = (v5 + v5 * a2) / v6;
  if (v8 != v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)(result + 20);
    unint64_t v11 = v7 + *(void *)(result + 44);
    unint64_t v12 = v8 - v7;
    uint64_t v13 = *((void *)result + 19);
    uint64_t v14 = (uint64_t *)*((void *)result + 7);
    unint64_t v15 = (uint64_t *)*((void *)result + 8);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = **((void **)result + 17);
    float v19 = 8191.0 / (float)*(unsigned int *)(v13 + 128);
    LOWORD(a5) = *(_WORD *)(v13 + 140);
    *(float *)&a5 = (float)LODWORD(a5);
    float v20 = *(float *)(v13 + 72);
    float v21 = *(float *)(v13 + 76);
    float v22 = *(float *)(v13 + 80);
    float v23 = *(float *)(v13 + 84);
    float v24 = *(float *)(v13 + 88);
    float v25 = *(float *)(v13 + 92);
    float v26 = *(float *)(v13 + 96);
    float v27 = *(float *)(v13 + 100);
    float v28 = *(float *)(v13 + 104);
    uint64_t v29 = v13 + 164;
    uint64_t v30 = v13 + 16548;
    uint64_t v31 = *((void *)result + 14);
    unint64_t v32 = *((void *)result + 13) * a2 / v6 + *((void *)result + 15);
    uint64_t v33 = *(void *)(result + 36);
    uint64_t v34 = *(unsigned __int8 *)(v13 + 161);
    uint64_t v35 = *(unsigned __int8 *)(v13 + 160);
    uint64_t v36 = **((void **)result + 16) + v32 * v18;
    double result = (unsigned __int8 *)*(unsigned __int8 *)(v13 + 159);
    uint64_t v37 = *(unsigned __int8 *)(v13 + 158);
    uint64_t v38 = v36 + v31;
    uint64_t v40 = *v14;
    uint64_t v39 = v14[1];
    uint64_t v41 = v39 + v17 * v11 + 4 * v33;
    if (!v39) {
      uint64_t v41 = 0;
    }
    float32x2_t v42 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    uint64_t v43 = v40 + v16 * v11 + 4 * v33;
    float32x2_t v44 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v10)
      {
        uint64_t v45 = v10;
        uint64_t v46 = (unsigned int *)v43;
        uint64_t v47 = v38;
        float32x2_t v48 = (char *)v41;
        do
        {
          unsigned int v50 = *v46++;
          unsigned int v49 = v50;
          if (v48)
          {
            char v52 = *v48++;
            LOBYTE(v51) = v52;
          }
          else
          {
            unsigned int v51 = v49 >> 30;
          }
          _D27 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v49), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v42), v19), 0), v44)));
          _D27.i16[0] = *(_WORD *)(v29 + 2 * _D27.u32[0]);
          __asm { FCVT            S27, H27 }
          _H28 = *(_WORD *)(v29 + 2 * _D27.u32[1]);
          _H30 = *(_WORD *)(v29
                          + 2
                          * llroundf(fminf(fmaxf(v19 * (float)((float)(v49 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
          __asm
          {
            FCVT            S29, H28
            FCVT            S28, H30
          }
          if (*(short float *)(v30
                              + 2
                              * llroundf(fminf(fmaxf((float)((float)(v21 * _S29) + (float)(_S27 * v20)) + (float)(_S28 * v22), 0.0), 8191.0))) <= COERCE_SHORT_FLOAT(23544))
          {
            __asm { FCMP            H30, #0 }
            if (_NF) {
              _S30 = 0.0;
            }
            else {
              __asm { FCVT            S30, H30 }
            }
          }
          else
          {
            _S30 = 255.0;
          }
          float v65 = (float)((float)(v24 * _S29) + (float)(_S27 * v23)) + (float)(_S28 * v25);
          float v66 = (float)((float)(v27 * _S29) + (float)(_S27 * v26)) + (float)(_S28 * v28);
          short float v67 = *(short float *)(v30 + 2 * llroundf(fminf(fmaxf(v65, 0.0), 8191.0)));
          short float v68 = *(short float *)(v30 + 2 * llroundf(fminf(fmaxf(v66, 0.0), 8191.0)));
          *(unsigned char *)(v47 + v37) = llroundf(_S30);
          if (v67 <= COERCE_SHORT_FLOAT(23544))
          {
            __asm { FCMP            H28, #0 }
            if (_NF) {
              _S28 = 0.0;
            }
            else {
              __asm { FCVT            S28, H28 }
            }
          }
          else
          {
            _S28 = 255.0;
          }
          result[v47] = llroundf(_S28);
          if (v68 <= COERCE_SHORT_FLOAT(23544))
          {
            __asm { FCMP            H27, #0 }
            if (_NF) {
              _S27 = 0.0;
            }
            else {
              __asm { FCVT            S27, H27 }
            }
          }
          else
          {
            _S27 = 255.0;
          }
          *(unsigned char *)(v47 + v35) = llroundf(_S27);
          *(unsigned char *)(v47 + v34) = 85 * v51;
          v47 += 4;
          --v45;
        }
        while (v45);
      }
      v43 += v16;
      v41 += v17;
      v38 += v18;
      ++v9;
    }
    while (v9 != v12);
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_BGRA(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_BGRA_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_rgb_BGRA_GCD(unsigned __int8 *result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 28);
  unint64_t v3 = *result;
  unint64_t v4 = v2 * a2 / v3;
  unint64_t v5 = (v2 + v2 * a2) / v3;
  if (v5 != v4)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)(result + 20);
    unint64_t v8 = v4 + *(void *)(result + 44);
    unint64_t v9 = v5 - v4;
    uint64_t v10 = *((void *)result + 19);
    int64x2_t v11 = (void *)*((void *)result + 7);
    int64x2_t v12 = (uint64_t *)*((void *)result + 8);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    uint64_t v15 = **((void **)result + 17);
    *(float *)&unsigned int v16 = (float)*(unsigned int *)(v10 + 136);
    float v17 = *(float *)&v16 / (float)*(unsigned int *)(v10 + 128);
    LOWORD(v16) = *(_WORD *)(v10 + 140);
    float v18 = (float)v16;
    unint64_t v19 = *((void *)result + 13) * a2 / v3 + *((void *)result + 15);
    uint64_t v20 = *(void *)(result + 36);
    uint64_t v21 = *(unsigned __int8 *)(v10 + 161);
    uint64_t v22 = *(unsigned __int8 *)(v10 + 160);
    uint64_t v23 = *(unsigned __int8 *)(v10 + 159);
    uint64_t v24 = *(unsigned __int8 *)(v10 + 158);
    double result = (unsigned __int8 *)(**((void **)result + 16) + v19 * v15 + *((void *)result + 14));
    float v27 = v11;
    uint64_t v26 = *v11;
    uint64_t v25 = v27[1];
    BOOL v28 = v25 == 0;
    uint64_t v29 = v25 + v14 * v8 + 4 * v20;
    if (v28) {
      uint64_t v29 = 0;
    }
    uint64_t v30 = v26 + v13 * v8 + 4 * v20;
    do
    {
      if (v7)
      {
        uint64_t v31 = v7;
        unint64_t v32 = (unsigned int *)v30;
        uint64_t v33 = result;
        uint64_t v34 = (char *)v29;
        do
        {
          unsigned int v36 = *v32++;
          unsigned int v35 = v36;
          if (v34)
          {
            char v38 = *v34++;
            LOBYTE(v37) = v38;
          }
          else
          {
            unsigned int v37 = v35 >> 30;
          }
          float v39 = v17 * (float)((float)((v35 >> 20) & 0x3FF) - v18);
          float v40 = 255.0;
          if (v39 <= 255.0)
          {
            float v40 = v17 * (float)((float)((v35 >> 20) & 0x3FF) - v18);
            if (v39 < 0.0) {
              float v40 = 0.0;
            }
          }
          float v41 = v17 * (float)((float)((v35 >> 10) & 0x3FF) - v18);
          v33[v24] = llroundf(v40);
          float v42 = 255.0;
          if (v41 <= 255.0)
          {
            float v42 = v17 * (float)((float)((v35 >> 10) & 0x3FF) - v18);
            if (v41 < 0.0) {
              float v42 = 0.0;
            }
          }
          float v43 = v17 * (float)((float)(v35 & 0x3FF) - v18);
          v33[v23] = llroundf(v42);
          float v44 = 255.0;
          if (v43 <= 255.0)
          {
            float v44 = v17 * (float)((float)(v35 & 0x3FF) - v18);
            if (v43 < 0.0) {
              float v44 = 0.0;
            }
          }
          v33[v22] = llroundf(v44);
          v33[v21] = 85 * v37;
          v33 += 4;
          --v31;
        }
        while (v31);
      }
      v30 += v13;
      v29 += v14;
      result += v15;
      ++v6;
    }
    while (v6 != v9);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_l10r(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_l10r_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_l10r_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5, float a6)
{
  uint64_t v6 = *(void *)(result + 28);
  unint64_t v7 = *result;
  unint64_t v8 = v6 * a2 / v7;
  unint64_t v9 = (v6 + v6 * a2) / v7;
  if (v9 != v8)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)(result + 20);
    unint64_t v12 = v8 + *(void *)(result + 44);
    unint64_t v13 = v9 - v8;
    uint64_t v14 = *((void *)result + 19);
    uint64_t v15 = (uint64_t *)*((void *)result + 17);
    unsigned int v16 = (void *)*((void *)result + 7);
    uint64_t v17 = (uint64_t *)*((void *)result + 8);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    uint64_t v20 = *v15;
    uint64_t v21 = v15[1];
    float v22 = 8191.0 / (float)*(unsigned int *)(v14 + 128);
    LOWORD(a5) = *(_WORD *)(v14 + 140);
    *(float *)&a5 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v14 + 144);
    float v23 = (float)LODWORD(a6);
    float v24 = *(float *)(v14 + 72);
    float v25 = *(float *)(v14 + 76);
    float v26 = *(float *)(v14 + 80);
    float v27 = *(float *)(v14 + 84);
    float v28 = *(float *)(v14 + 88);
    float v29 = *(float *)(v14 + 92);
    float v30 = *(float *)(v14 + 96);
    float v31 = *(float *)(v14 + 100);
    uint64_t v32 = v14 + 164;
    uint64_t v33 = v14 + 16548;
    uint64_t v34 = v14 + 32932;
    float v35 = *(float *)(v14 + 104);
    float v36 = *(float *)(v14 + 108);
    float v37 = *(float *)(v14 + 112);
    float v38 = *(float *)(v14 + 116);
    float v39 = *(float *)(v14 + 120);
    uint64_t v40 = *((void *)result + 14);
    unint64_t v41 = *((void *)result + 13) * a2 / v7 + *((void *)result + 15);
    uint64_t v42 = *(void *)(result + 36);
    uint64_t v44 = **((void **)result + 16);
    uint64_t v43 = *(void *)(*((void *)result + 16) + 8);
    _ZF = v43 == 0;
    double result = (unsigned __int8 *)(v43 + v41 * v21 + 4 * v40);
    if (_ZF) {
      double result = 0;
    }
    uint64_t v46 = v44 + v41 * v20 + 4 * v40;
    unsigned int v49 = v16;
    uint64_t v48 = *v16;
    uint64_t v47 = v49[1];
    if (v47) {
      uint64_t v50 = v47 + v19 * v12 + 4 * v42;
    }
    else {
      uint64_t v50 = 0;
    }
    uint64_t v51 = v48 + v18 * v12 + 4 * v42;
    float32x2_t v52 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    float32x2_t v53 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    while (!v11)
    {
LABEL_39:
      v51 += v18;
      v50 += v19;
      v46 += v20;
      result += v21;
      if (++v10 == v13) {
        return result;
      }
    }
    uint64_t v54 = v11;
    unsigned int v55 = result;
    unsigned int v56 = (unsigned int *)v46;
    unsigned int v57 = (unsigned __int8 *)v50;
    char v58 = (unsigned int *)v51;
    while (1)
    {
      unsigned int v60 = *v58++;
      unsigned int v59 = v60;
      if (v57)
      {
        unsigned int v62 = *v57++;
        unsigned int v61 = v62;
      }
      else
      {
        unsigned int v61 = v59 >> 30;
      }
      _D11 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v59), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v52), v22), 0), v53)));
      _D11.i16[0] = *(_WORD *)(v32 + 2 * _D11.u32[0]);
      __asm { FCVT            S11, H11 }
      _H12 = *(_WORD *)(v32 + 2 * _D11.u32[1]);
      __asm { FCVT            S12, H12 }
      _H31 = *(_WORD *)(v32
                      + 2 * llroundf(fminf(fmaxf(v22 * (float)((float)(v59 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
      __asm { FCVT            S13, H31 }
      float v72 = (float)((float)((float)(v37 * _S12) + (float)(v36 * _S11)) + (float)(v38 * _S13))
          + (float)(v39 * fmaxf(_S11, fmaxf(_S12, _S13)));
      float v73 = 8191.0;
      if (v72 <= 8191.0)
      {
        float v73 = v72;
        if (v72 < 0.0) {
          float v73 = 0.0;
        }
      }
      if (v55 && v57) {
        goto LABEL_23;
      }
      if (v57)
      {
        double v74 = (double)v61 * 3.0 / 255.0;
      }
      else
      {
        if (!v55) {
          goto LABEL_23;
        }
        double v74 = (double)v61 * 255.0 / 3.0;
      }
      float v75 = v74;
      unsigned int v61 = llroundf(v75);
LABEL_23:
      _H31 = *(_WORD *)(v33 + 2 * llroundf(v73));
      __asm { FCVT            S31, H31 }
      float v78 = _S11 * _S31;
      float v79 = _S12 * _S31;
      float v80 = _S13 * _S31;
      LOWORD(_S31) = *(_WORD *)(v34
                              + 2
                              * llroundf(fminf(fmaxf((float)((float)(v31 * v79) + (float)((float)(_S11 * _S31) * v30))+ (float)((float)(_S13 * _S31) * v35), 0.0), 8191.0)));
      __asm { FCVT            S31, H31 }
      float v82 = 1023.0;
      if ((float)(v23 + _S31) <= 1023.0)
      {
        float v82 = v23 + _S31;
        if ((float)(v23 + _S31) < 0.0) {
          float v82 = 0.0;
        }
      }
      _H31 = *(_WORD *)(v34
                      + 2
                      * llroundf(fminf(fmaxf((float)((float)(v28 * v79) + (float)(v78 * v27)) + (float)(v80 * v29), 0.0), 8191.0)));
      __asm { FCVT            S31, H31 }
      float v85 = v23 + _S31;
      BOOL v86 = (float)(v23 + _S31) <= 1023.0;
      float v87 = 1023.0;
      if (v86)
      {
        float v87 = v85;
        if (v85 < 0.0) {
          float v87 = 0.0;
        }
      }
      _H12 = *(_WORD *)(v34
                      + 2
                      * llroundf(fminf(fmaxf((float)((float)(v25 * v79) + (float)(v78 * v24)) + (float)(v80 * v26), 0.0), 8191.0)));
      __asm { FCVT            S12, H12 }
      float v90 = v23 + _S12;
      BOOL v86 = (float)(v23 + _S12) <= 1023.0;
      float v91 = 1023.0;
      if (v86)
      {
        float v91 = v90;
        if (v90 < 0.0) {
          float v91 = 0.0;
        }
      }
      unsigned int v92 = llroundf(v82);
      unsigned int v93 = llroundf(v87);
      unsigned int v94 = llroundf(v91);
      float v95 = (float)v61;
      if ((float)v61 > 3.0) {
        float v95 = 3.0;
      }
      *v56++ = (v93 << 10) | v92 | (llroundf(v95) << 30) | (v94 << 20);
      if (v55) {
        *v55++ = v61;
      }
      if (!--v54) {
        goto LABEL_39;
      }
    }
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_l10r(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_l10r_GCD);
  return 0;
}

void *vt_Copy_l10r_TRC_Mat_TRC_l10r_GCD(void *result, uint64_t a2, double a3, double a4, double a5, float a6)
{
  uint64_t v6 = *(void *)((char *)result + 28);
  unint64_t v7 = *(unsigned __int8 *)result;
  unint64_t v8 = v6 * a2 / v7;
  unint64_t v9 = (v6 + v6 * a2) / v7;
  if (v9 != v8)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)((char *)result + 20);
    unint64_t v12 = v8 + *(void *)((char *)result + 44);
    unint64_t v13 = v9 - v8;
    uint64_t v14 = result[19];
    uint64_t v15 = (uint64_t *)result[17];
    unsigned int v16 = (void *)result[7];
    uint64_t v17 = (uint64_t *)result[8];
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    uint64_t v20 = *v15;
    uint64_t v21 = v15[1];
    float v22 = 8191.0 / (float)*(unsigned int *)(v14 + 128);
    LOWORD(a5) = *(_WORD *)(v14 + 140);
    *(float *)&a5 = (float)LODWORD(a5);
    LOWORD(a6) = *(_WORD *)(v14 + 144);
    float v23 = (float)LODWORD(a6);
    float v24 = *(float *)(v14 + 72);
    float v25 = *(float *)(v14 + 76);
    float v26 = *(float *)(v14 + 80);
    float v27 = *(float *)(v14 + 84);
    float v28 = *(float *)(v14 + 88);
    float v29 = *(float *)(v14 + 92);
    float v30 = *(float *)(v14 + 96);
    float v31 = *(float *)(v14 + 100);
    float v32 = *(float *)(v14 + 104);
    uint64_t v33 = v14 + 164;
    uint64_t v34 = v14 + 16548;
    uint64_t v35 = result[14];
    unint64_t v36 = result[13] * a2 / v7;
    float v37 = (void *)result[16];
    unint64_t v38 = v36 + result[15];
    uint64_t v39 = *(void *)((char *)result + 36);
    uint64_t v40 = v37[1];
    _ZF = v40 == 0;
    uint64_t v42 = v40 + v38 * v21 + 4 * v35;
    if (_ZF) {
      uint64_t v42 = 0;
    }
    double result = (void *)(*v37 + v38 * v20 + 4 * v35);
    uint64_t v45 = v16;
    uint64_t v44 = *v16;
    uint64_t v43 = v45[1];
    if (v43) {
      uint64_t v46 = v43 + v19 * v12 + 4 * v39;
    }
    else {
      uint64_t v46 = 0;
    }
    uint64_t v47 = v44 + v18 * v12 + 4 * v39;
    float32x2_t v48 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    float32x2_t v49 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    while (!v11)
    {
LABEL_37:
      v47 += v18;
      v46 += v19;
      double result = (void *)((char *)result + v20);
      v42 += v21;
      if (++v10 == v13) {
        return result;
      }
    }
    uint64_t v50 = v11;
    uint64_t v51 = (unsigned char *)v42;
    float32x2_t v52 = (unsigned int *)result;
    float32x2_t v53 = (unsigned __int8 *)v46;
    uint64_t v54 = (unsigned int *)v47;
    while (1)
    {
      unsigned int v56 = *v54++;
      unsigned int v55 = v56;
      if (v53)
      {
        unsigned int v58 = *v53++;
        unsigned int v57 = v58;
        if (!v51) {
          goto LABEL_15;
        }
      }
      else
      {
        unsigned int v57 = v55 >> 30;
        if (!v51) {
          goto LABEL_15;
        }
      }
      if (v53) {
        goto LABEL_20;
      }
LABEL_15:
      if (v53)
      {
        double v59 = (double)v57 * 3.0 / 255.0;
      }
      else
      {
        if (!v51) {
          goto LABEL_20;
        }
        double v59 = (double)v57 * 255.0 / 3.0;
      }
      float v60 = v59;
      unsigned int v57 = llroundf(v60);
LABEL_20:
      _D8 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v55), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v48), v22), 0), v49)));
      _D8.i16[0] = *(_WORD *)(v33 + 2 * _D8.u32[0]);
      __asm { FCVT            S8, H8 }
      _H9 = *(_WORD *)(v33 + 2 * _D8.u32[1]);
      __asm { FCVT            S9, H9 }
      _H31 = *(_WORD *)(v33
                      + 2 * llroundf(fminf(fmaxf(v22 * (float)((float)(v55 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
      __asm { FCVT            S10, H31 }
      _H31 = *(_WORD *)(v34
                      + 2
                      * llroundf(fminf(fmaxf((float)((float)(v31 * _S9) + (float)(_S8 * v30)) + (float)(_S10 * v32), 0.0), 8191.0)));
      __asm { FCVT            S31, H31 }
      float v72 = v23 + _S31;
      BOOL v73 = (float)(v23 + _S31) <= 1023.0;
      float v74 = 1023.0;
      if (v73)
      {
        float v74 = v72;
        if (v72 < 0.0) {
          float v74 = 0.0;
        }
      }
      _H11 = *(_WORD *)(v34
                      + 2
                      * llroundf(fminf(fmaxf((float)((float)(v28 * _S9) + (float)(_S8 * v27)) + (float)(_S10 * v29), 0.0), 8191.0)));
      __asm { FCVT            S11, H11 }
      float v77 = v23 + _S11;
      BOOL v73 = (float)(v23 + _S11) <= 1023.0;
      float v78 = 1023.0;
      if (v73)
      {
        float v78 = v77;
        if (v77 < 0.0) {
          float v78 = 0.0;
        }
      }
      _H8 = *(_WORD *)(v34
                     + 2
                     * llroundf(fminf(fmaxf((float)((float)(v25 * _S9) + (float)(_S8 * v24)) + (float)(_S10 * v26), 0.0), 8191.0)));
      __asm { FCVT            S8, H8 }
      float v81 = v23 + _S8;
      BOOL v73 = (float)(v23 + _S8) <= 1023.0;
      float v82 = 1023.0;
      if (v73)
      {
        float v82 = v81;
        if (v81 < 0.0) {
          float v82 = 0.0;
        }
      }
      unsigned int v83 = llroundf(v74);
      unsigned int v84 = llroundf(v78);
      unsigned int v85 = llroundf(v82);
      float v86 = (float)v57;
      if ((float)v57 > 3.0) {
        float v86 = 3.0;
      }
      *v52++ = (v84 << 10) | v83 | (llroundf(v86) << 30) | (v85 << 20);
      if (v51) {
        *v51++ = v57;
      }
      if (!--v50) {
        goto LABEL_37;
      }
    }
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_l10r(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_l10r_GCD);
  return 0;
}

void *vt_Copy_l10r_rgb_l10r_GCD(void *result, uint64_t a2, double a3, double a4, float a5)
{
  uint64_t v5 = *(void *)((char *)result + 28);
  unint64_t v6 = *(unsigned __int8 *)result;
  unint64_t v7 = v5 * a2 / v6;
  unint64_t v8 = (v5 + v5 * a2) / v6;
  if (v8 != v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)((char *)result + 20);
    unint64_t v11 = v7 + *(void *)((char *)result + 44);
    unint64_t v12 = v8 - v7;
    uint64_t v13 = result[19];
    uint64_t v14 = (uint64_t *)result[17];
    unsigned int v16 = (uint64_t *)result[7];
    uint64_t v15 = (uint64_t *)result[8];
    uint64_t v17 = *v15;
    uint64_t v18 = v15[1];
    uint64_t v19 = *v14;
    uint64_t v20 = v14[1];
    *(float *)&unsigned int v21 = (float)*(unsigned int *)(v13 + 136);
    float v22 = *(float *)&v21 / (float)*(unsigned int *)(v13 + 128);
    LOWORD(v21) = *(_WORD *)(v13 + 140);
    float v23 = (float)v21;
    LOWORD(a5) = *(_WORD *)(v13 + 144);
    float v24 = (float)LODWORD(a5);
    uint64_t v25 = result[14];
    uint64_t v26 = (void *)result[16];
    unint64_t v27 = result[13] * a2 / v6 + result[15];
    uint64_t v28 = *(void *)((char *)result + 36);
    float v31 = v26;
    uint64_t v30 = *v26;
    uint64_t v29 = v31[1];
    BOOL v32 = v29 == 0;
    uint64_t v33 = v29 + v27 * v20 + 4 * v25;
    if (v32) {
      uint64_t v33 = 0;
    }
    uint64_t v34 = v30 + v27 * v19 + 4 * v25;
    uint64_t v36 = *v16;
    uint64_t v35 = v16[1];
    uint64_t v37 = v35 + v18 * v11 + 4 * v28;
    if (!v35) {
      uint64_t v37 = 0;
    }
    double result = (void *)(v36 + v17 * v11 + 4 * v28);
    while (!v10)
    {
LABEL_29:
      double result = (void *)((char *)result + v17);
      v37 += v18;
      v34 += v19;
      v33 += v20;
      if (++v9 == v12) {
        return result;
      }
    }
    uint64_t v38 = v10;
    uint64_t v39 = (unsigned char *)v33;
    uint64_t v40 = (unsigned int *)v34;
    unint64_t v41 = (unsigned __int8 *)v37;
    uint64_t v42 = (unsigned int *)result;
    while (1)
    {
      unsigned int v44 = *v42++;
      unsigned int v43 = v44;
      if (v41)
      {
        unsigned int v46 = *v41++;
        unsigned int v45 = v46;
        if (v39) {
          goto LABEL_15;
        }
        double v47 = (double)v45 * 3.0 / 255.0;
      }
      else
      {
        unsigned int v45 = v43 >> 30;
        unint64_t v41 = 0;
        if (!v39) {
          goto LABEL_15;
        }
        double v47 = (double)v45 * 255.0 / 3.0;
      }
      float v48 = v47;
      unsigned int v45 = llroundf(v48);
LABEL_15:
      float v49 = (float)(v22 * (float)((float)(v43 & 0x3FF) - v23)) + v24;
      float v50 = 1023.0;
      if (v49 <= 1023.0)
      {
        float v50 = (float)(v22 * (float)((float)(v43 & 0x3FF) - v23)) + v24;
        if (v49 < 0.0) {
          float v50 = 0.0;
        }
      }
      float v51 = (float)(v22 * (float)((float)((v43 >> 10) & 0x3FF) - v23)) + v24;
      float v52 = 1023.0;
      if (v51 <= 1023.0)
      {
        float v52 = (float)(v22 * (float)((float)((v43 >> 10) & 0x3FF) - v23)) + v24;
        if (v51 < 0.0) {
          float v52 = 0.0;
        }
      }
      float v53 = (float)(v22 * (float)((float)((v43 >> 20) & 0x3FF) - v23)) + v24;
      float v54 = 1023.0;
      if (v53 <= 1023.0)
      {
        float v54 = (float)(v22 * (float)((float)((v43 >> 20) & 0x3FF) - v23)) + v24;
        if (v53 < 0.0) {
          float v54 = 0.0;
        }
      }
      unsigned int v55 = llroundf(v50);
      unsigned int v56 = llroundf(v52);
      unsigned int v57 = llroundf(v54);
      float v58 = (float)v45;
      if ((float)v45 > 3.0) {
        float v58 = 3.0;
      }
      *v40++ = (v56 << 10) | v55 | (llroundf(v58) << 30) | (v57 << 20);
      if (v39) {
        *v39++ = v45;
      }
      if (!--v38) {
        goto LABEL_29;
      }
    }
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_l64r(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_l64r_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_l64r_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(void *)(result + 28);
  unint64_t v6 = *result;
  unint64_t v7 = v5 * a2 / v6;
  unint64_t v8 = (v5 + v5 * a2) / v6;
  if (v8 != v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)(result + 20);
    unint64_t v11 = v7 + *(void *)(result + 44);
    unint64_t v12 = v8 - v7;
    uint64_t v13 = *((void *)result + 19);
    uint64_t v14 = (void *)*((void *)result + 7);
    uint64_t v15 = (uint64_t *)*((void *)result + 8);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = **((void **)result + 17);
    float v19 = 8191.0 / (float)*(unsigned int *)(v13 + 128);
    LOWORD(a5) = *(_WORD *)(v13 + 140);
    *(float *)&a5 = (float)LODWORD(a5);
    float v20 = *(float *)(v13 + 72);
    float v21 = *(float *)(v13 + 76);
    float v22 = *(float *)(v13 + 80);
    float v23 = *(float *)(v13 + 84);
    float v24 = *(float *)(v13 + 88);
    float v25 = *(float *)(v13 + 92);
    float v26 = *(float *)(v13 + 96);
    float v27 = *(float *)(v13 + 100);
    uint64_t v28 = v13 + 164;
    uint64_t v29 = v13 + 16548;
    uint64_t v30 = v13 + 32932;
    float v31 = *(float *)(v13 + 104);
    float v32 = *(float *)(v13 + 108);
    float v33 = *(float *)(v13 + 112);
    float v34 = *(float *)(v13 + 116);
    float v35 = *(float *)(v13 + 120);
    uint64_t v36 = *(void *)(result + 36);
    uint64_t v37 = **((void **)result + 16)
        + (*((void *)result + 13) * a2 / v6 + *((void *)result + 15)) * v18
        + 2 * *((void *)result + 14);
    uint64_t v38 = v14[1];
    if (v38) {
      double result = (unsigned __int8 *)(v38 + v17 * v11 + 4 * v36);
    }
    else {
      double result = 0;
    }
    float32x2_t v39 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    uint64_t v40 = *v14 + v16 * v11 + 4 * v36;
    float32x2_t v41 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v10)
      {
        uint64_t v42 = v10;
        unsigned int v43 = (unsigned int *)v40;
        unsigned int v44 = (_WORD *)v37;
        unsigned int v45 = result;
        do
        {
          unsigned int v47 = *v43++;
          unsigned int v46 = v47;
          if (v45)
          {
            __int16 v49 = *v45++;
            LOWORD(v48) = v49;
          }
          else
          {
            unsigned int v48 = v46 >> 30;
          }
          _D31 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v46), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v39), v19), 0), v41)));
          _D31.i16[0] = *(_WORD *)(v28 + 2 * _D31.u32[0]);
          __asm { FCVT            S31, H31 }
          _H9 = *(_WORD *)(v28 + 2 * _D31.u32[1]);
          __asm { FCVT            S8, H9 }
          _H9 = *(_WORD *)(v28
                         + 2
                         * llroundf(fminf(fmaxf(v19 * (float)((float)(v46 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
          __asm { FCVT            S10, H9 }
          float v60 = (float)((float)((float)(v33 * _S8) + (float)(v32 * _S31)) + (float)(v34 * _S10))
              + (float)(v35 * fmaxf(_S31, fmaxf(_S8, _S10)));
          float v61 = 8191.0;
          if (v60 <= 8191.0)
          {
            float v61 = v60;
            if (v60 < 0.0) {
              float v61 = 0.0;
            }
          }
          _H9 = *(_WORD *)(v29 + 2 * llroundf(v61));
          __asm { FCVT            S11, H9 }
          float v64 = _S31 * _S11;
          float v65 = _S8 * _S11;
          float v66 = _S10 * _S11;
          LOWORD(_S11) = *(_WORD *)(v30
                                  + 2
                                  * llroundf(fminf(fmaxf((float)((float)(v21 * v65) + (float)(v64 * v20))+ (float)((float)(_S10 * _S11) * v22), 0.0), 8191.0)));
          __asm { FCVT            S12, H11 }
          float v68 = 65535.0;
          if (_S12 <= 65535.0)
          {
            __asm { FCMP            H11, #0 }
            float v68 = _S12;
            if (_NF) {
              float v68 = 0.0;
            }
          }
          float v70 = (float)((float)(v24 * v65) + (float)(v64 * v23)) + (float)(v66 * v25);
          float v71 = (float)((float)(v27 * v65) + (float)(v64 * v26)) + (float)(v66 * v31);
          _H8 = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(v70, 0.0), 8191.0)));
          _H31 = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(v71, 0.0), 8191.0)));
          __asm { FCVT            S11, H8 }
          *unsigned int v44 = llroundf(v68);
          float v75 = 65535.0;
          if (_S11 <= 65535.0)
          {
            __asm { FCMP            H8, #0 }
            float v75 = _S11;
            if (_NF) {
              float v75 = 0.0;
            }
          }
          __asm { FCVT            S10, H31 }
          v44[1] = llroundf(v75);
          float v78 = 65535.0;
          if (_S10 <= 65535.0)
          {
            __asm { FCMP            H31, #0 }
            float v78 = _S10;
            if (_NF) {
              float v78 = 0.0;
            }
          }
          v44[2] = llroundf(v78);
          v44[3] = 21845 * v48;
          v44 += 4;
          --v42;
        }
        while (v42);
      }
      v40 += v16;
      result += v17;
      v37 += v18;
      ++v9;
    }
    while (v9 != v12);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_l64r(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_l64r_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Mat_TRC_l64r_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(void *)(result + 28);
  unint64_t v6 = *result;
  unint64_t v7 = v5 * a2 / v6;
  unint64_t v8 = (v5 + v5 * a2) / v6;
  if (v8 != v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)(result + 20);
    unint64_t v11 = v7 + *(void *)(result + 44);
    unint64_t v12 = v8 - v7;
    uint64_t v13 = *((void *)result + 19);
    uint64_t v15 = (uint64_t *)*((void *)result + 7);
    uint64_t v14 = (uint64_t *)*((void *)result + 8);
    uint64_t v16 = *v14;
    uint64_t v17 = v14[1];
    uint64_t v18 = **((void **)result + 17);
    float v19 = 8191.0 / (float)*(unsigned int *)(v13 + 128);
    LOWORD(a5) = *(_WORD *)(v13 + 140);
    *(float *)&a5 = (float)LODWORD(a5);
    float v20 = *(float *)(v13 + 72);
    float v21 = *(float *)(v13 + 76);
    float v22 = *(float *)(v13 + 80);
    float v23 = *(float *)(v13 + 84);
    float v24 = *(float *)(v13 + 88);
    float v25 = *(float *)(v13 + 92);
    float v26 = *(float *)(v13 + 96);
    float v27 = *(float *)(v13 + 100);
    float v28 = *(float *)(v13 + 104);
    uint64_t v29 = v13 + 164;
    uint64_t v30 = v13 + 16548;
    uint64_t v31 = *((void *)result + 14);
    unint64_t v32 = *((void *)result + 13) * a2 / v6;
    float v33 = (void *)*((void *)result + 16);
    unint64_t v34 = v32 + *((void *)result + 15);
    uint64_t v35 = *(void *)(result + 36);
    uint64_t v36 = *v33 + v34 * v18 + 2 * v31;
    uint64_t v38 = *v15;
    uint64_t v37 = v15[1];
    uint64_t v39 = v37 + v17 * v11 + 4 * v35;
    if (!v37) {
      uint64_t v39 = 0;
    }
    float32x2_t v40 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    double result = (unsigned __int8 *)(v38 + v16 * v11 + 4 * v35);
    float32x2_t v41 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v10)
      {
        uint64_t v42 = v10;
        unsigned int v43 = (unsigned int *)result;
        unsigned int v44 = (_WORD *)v36;
        unsigned int v45 = (unsigned __int8 *)v39;
        do
        {
          unsigned int v47 = *v43++;
          unsigned int v46 = v47;
          if (v45)
          {
            __int16 v49 = *v45++;
            LOWORD(v48) = v49;
          }
          else
          {
            unsigned int v48 = v46 >> 30;
          }
          _D27 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v46), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v40), v19), 0), v41)));
          _D27.i16[0] = *(_WORD *)(v29 + 2 * _D27.u32[0]);
          __asm { FCVT            S27, H27 }
          _H28 = *(_WORD *)(v29 + 2 * _D27.u32[1]);
          __asm { FCVT            S28, H28 }
          _H29 = *(_WORD *)(v29
                          + 2
                          * llroundf(fminf(fmaxf(v19 * (float)((float)(v46 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
          __asm { FCVT            S29, H29 }
          _H31 = *(_WORD *)(v30
                          + 2
                          * llroundf(fminf(fmaxf((float)((float)(v21 * _S28) + (float)(_S27 * v20)) + (float)(_S29 * v22), 0.0), 8191.0)));
          __asm { FCVT            S8, H31 }
          float v62 = 65535.0;
          if (_S8 <= 65535.0)
          {
            __asm { FCMP            H31, #0 }
            float v62 = _S8;
            if (_NF) {
              float v62 = 0.0;
            }
          }
          float v64 = (float)((float)(v24 * _S28) + (float)(_S27 * v23)) + (float)(_S29 * v25);
          float v65 = (float)((float)(v27 * _S28) + (float)(_S27 * v26)) + (float)(_S29 * v28);
          _H28 = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(v64, 0.0), 8191.0)));
          _H27 = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(v65, 0.0), 8191.0)));
          __asm { FCVT            S31, H28 }
          *unsigned int v44 = llroundf(v62);
          float v69 = 65535.0;
          if (_S31 <= 65535.0)
          {
            __asm { FCMP            H28, #0 }
            float v69 = _S31;
            if (_NF) {
              float v69 = 0.0;
            }
          }
          __asm { FCVT            S30, H27 }
          v44[1] = llroundf(v69);
          float v72 = 65535.0;
          if (_S30 <= 65535.0)
          {
            __asm { FCMP            H27, #0 }
            float v72 = _S30;
            if (_NF) {
              float v72 = 0.0;
            }
          }
          v44[2] = llroundf(v72);
          v44[3] = 21845 * v48;
          v44 += 4;
          --v42;
        }
        while (v42);
      }
      result += v16;
      v39 += v17;
      v36 += v18;
      ++v9;
    }
    while (v9 != v12);
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_l64r(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_l64r_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_rgb_l64r_GCD(unsigned __int8 *result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 28);
  unint64_t v3 = *result;
  unint64_t v4 = v2 * a2 / v3;
  unint64_t v5 = (v2 + v2 * a2) / v3;
  if (v5 != v4)
  {
    uint64_t v6 = 0;
    unint64_t v7 = *(unsigned __int8 **)(result + 20);
    unint64_t v8 = v4 + *(void *)(result + 44);
    unint64_t v9 = v5 - v4;
    uint64_t v10 = *((void *)result + 19);
    int64x2_t v12 = (void *)*((void *)result + 7);
    int64x2_t v11 = (uint64_t *)*((void *)result + 8);
    uint64_t v13 = *v11;
    uint64_t v14 = v11[1];
    uint64_t v15 = **((void **)result + 17);
    *(float *)&unsigned int v16 = (float)*(unsigned int *)(v10 + 136);
    float v17 = *(float *)&v16 / (float)*(unsigned int *)(v10 + 128);
    LOWORD(v16) = *(_WORD *)(v10 + 140);
    float v18 = (float)v16;
    uint64_t v19 = *((void *)result + 14);
    int64x2_t v20 = (void *)*((void *)result + 16);
    unint64_t v21 = *((void *)result + 13) * a2 / v3 + *((void *)result + 15);
    uint64_t v22 = *(void *)(result + 36);
    uint64_t v23 = *v20 + v21 * v15 + 2 * v19;
    uint64_t v26 = v12;
    uint64_t v25 = *v12;
    uint64_t v24 = v26[1];
    if (v24) {
      uint64_t v27 = v24 + v14 * v8 + 4 * v22;
    }
    else {
      uint64_t v27 = 0;
    }
    uint64_t v28 = v25 + v13 * v8 + 4 * v22;
    double result = (unsigned __int8 *)&unk_193E7D000;
    do
    {
      if (v7)
      {
        double result = v7;
        uint64_t v29 = (unsigned int *)v28;
        uint64_t v30 = (_WORD *)v23;
        uint64_t v31 = (unsigned __int8 *)v27;
        do
        {
          unsigned int v33 = *v29++;
          unsigned int v32 = v33;
          if (v31)
          {
            __int16 v35 = *v31++;
            LOWORD(v34) = v35;
          }
          else
          {
            unsigned int v34 = v32 >> 30;
          }
          float v36 = v17 * (float)((float)((v32 >> 20) & 0x3FF) - v18);
          float v37 = 65535.0;
          if (v36 <= 65535.0)
          {
            float v37 = v17 * (float)((float)((v32 >> 20) & 0x3FF) - v18);
            if (v36 < 0.0) {
              float v37 = 0.0;
            }
          }
          float v38 = v17 * (float)((float)((v32 >> 10) & 0x3FF) - v18);
          *uint64_t v30 = llroundf(v37);
          float v39 = 65535.0;
          if (v38 <= 65535.0)
          {
            float v39 = v17 * (float)((float)((v32 >> 10) & 0x3FF) - v18);
            if (v38 < 0.0) {
              float v39 = 0.0;
            }
          }
          float v40 = v17 * (float)((float)(v32 & 0x3FF) - v18);
          v30[1] = llroundf(v39);
          float v41 = 65535.0;
          if (v40 <= 65535.0)
          {
            float v41 = v17 * (float)((float)(v32 & 0x3FF) - v18);
            if (v40 < 0.0) {
              float v41 = 0.0;
            }
          }
          v30[2] = llroundf(v41);
          v30[3] = 21845 * v34;
          v30 += 4;
          --result;
        }
        while (result);
      }
      v28 += v13;
      v27 += v14;
      v23 += v15;
      ++v6;
    }
    while (v6 != v9);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_b64a(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_b64a_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_b64a_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(void *)(result + 28);
  unint64_t v6 = *result;
  unint64_t v7 = v5 * a2 / v6;
  unint64_t v8 = (v5 + v5 * a2) / v6;
  if (v8 != v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)(result + 20);
    unint64_t v11 = v7 + *(void *)(result + 44);
    unint64_t v12 = v8 - v7;
    uint64_t v13 = *((void *)result + 19);
    uint64_t v14 = (void *)*((void *)result + 7);
    uint64_t v15 = (uint64_t *)*((void *)result + 8);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = **((void **)result + 17);
    float v19 = 8191.0 / (float)*(unsigned int *)(v13 + 128);
    LOWORD(a5) = *(_WORD *)(v13 + 140);
    *(float *)&a5 = (float)LODWORD(a5);
    float v20 = *(float *)(v13 + 72);
    float v21 = *(float *)(v13 + 76);
    float v22 = *(float *)(v13 + 80);
    float v23 = *(float *)(v13 + 84);
    float v24 = *(float *)(v13 + 88);
    float v25 = *(float *)(v13 + 92);
    float v26 = *(float *)(v13 + 96);
    float v27 = *(float *)(v13 + 100);
    uint64_t v28 = v13 + 164;
    uint64_t v29 = v13 + 16548;
    uint64_t v30 = v13 + 32932;
    float v31 = *(float *)(v13 + 104);
    float v32 = *(float *)(v13 + 108);
    float v33 = *(float *)(v13 + 112);
    float v34 = *(float *)(v13 + 116);
    float v35 = *(float *)(v13 + 120);
    uint64_t v36 = *(void *)(result + 36);
    uint64_t v37 = **((void **)result + 16)
        + (*((void *)result + 13) * a2 / v6 + *((void *)result + 15)) * v18
        + 2 * *((void *)result + 14);
    uint64_t v38 = v14[1];
    if (v38) {
      double result = (unsigned __int8 *)(v38 + v17 * v11 + 4 * v36);
    }
    else {
      double result = 0;
    }
    float32x2_t v39 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    uint64_t v40 = *v14 + v16 * v11 + 4 * v36;
    float32x2_t v41 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v10)
      {
        uint64_t v42 = v10;
        unsigned int v43 = (unsigned int *)v40;
        unsigned int v44 = (_WORD *)v37;
        unsigned int v45 = result;
        do
        {
          unsigned int v47 = *v43++;
          unsigned int v46 = v47;
          if (v45)
          {
            unsigned int v49 = *v45++;
            unsigned int v48 = v49;
          }
          else
          {
            unsigned int v48 = v46 >> 30;
          }
          _D31 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v46), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v39), v19), 0), v41)));
          _D31.i16[0] = *(_WORD *)(v28 + 2 * _D31.u32[0]);
          __asm { FCVT            S31, H31 }
          _H9 = *(_WORD *)(v28 + 2 * _D31.u32[1]);
          __asm { FCVT            S9, H9 }
          _H8 = *(_WORD *)(v28
                         + 2
                         * llroundf(fminf(fmaxf(v19 * (float)((float)(v46 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
          __asm { FCVT            S11, H8 }
          float v60 = (float)((float)((float)(v33 * _S9) + (float)(v32 * _S31)) + (float)(v34 * _S11))
              + (float)(v35 * fmaxf(_S31, fmaxf(_S9, _S11)));
          float v61 = 8191.0;
          if (v60 <= 8191.0)
          {
            float v61 = v60;
            if (v60 < 0.0) {
              float v61 = 0.0;
            }
          }
          _H8 = *(_WORD *)(v29 + 2 * llroundf(v61));
          __asm { FCVT            S12, H8 }
          float v64 = _S31 * _S12;
          float v65 = _S9 * _S12;
          float v66 = _S11 * _S12;
          _H11 = *(_WORD *)(v30
                          + 2
                          * llroundf(fminf(fmaxf((float)((float)(v21 * v65) + (float)((float)(_S31 * _S12) * v20))+ (float)((float)(_S11 * _S12) * v22), 0.0), 8191.0)));
          __asm { FCVT            S12, H11 }
          float v69 = 65535.0;
          if (_S12 <= 65535.0)
          {
            __asm { FCMP            H11, #0 }
            float v69 = _S12;
            if (_NF) {
              float v69 = 0.0;
            }
          }
          _H12 = *(_WORD *)(v30
                          + 2
                          * llroundf(fminf(fmaxf((float)((float)(v24 * v65) + (float)(v64 * v23)) + (float)(v66 * v25), 0.0), 8191.0)));
          __asm { FCVT            S13, H12 }
          float v73 = 65535.0;
          if (_S13 <= 65535.0)
          {
            __asm { FCMP            H12, #0 }
            float v73 = _S13;
            if (_NF) {
              float v73 = 0.0;
            }
          }
          _H9 = *(_WORD *)(v30
                         + 2
                         * llroundf(fminf(fmaxf((float)((float)(v27 * v65) + (float)(v64 * v26)) + (float)(v66 * v31), 0.0), 8191.0)));
          __asm { FCVT            S10, H9 }
          float v77 = 65535.0;
          if (_S10 <= 65535.0)
          {
            __asm { FCMP            H9, #0 }
            float v77 = _S10;
            if (_NF) {
              float v77 = 0.0;
            }
          }
          *unsigned int v44 = bswap32(21845 * v48) >> 16;
          v44[1] = __rev16(llroundf(v69));
          v44[2] = __rev16(llroundf(v73));
          v44[3] = __rev16(llroundf(v77));
          v44 += 4;
          --v42;
        }
        while (v42);
      }
      v40 += v16;
      result += v17;
      v37 += v18;
      ++v9;
    }
    while (v9 != v12);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_b64a(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_b64a_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Mat_TRC_b64a_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(void *)(result + 28);
  unint64_t v6 = *result;
  unint64_t v7 = v5 * a2 / v6;
  unint64_t v8 = (v5 + v5 * a2) / v6;
  if (v8 != v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)(result + 20);
    unint64_t v11 = v7 + *(void *)(result + 44);
    unint64_t v12 = v8 - v7;
    uint64_t v13 = *((void *)result + 19);
    uint64_t v15 = (uint64_t *)*((void *)result + 7);
    uint64_t v14 = (uint64_t *)*((void *)result + 8);
    uint64_t v16 = *v14;
    uint64_t v17 = v14[1];
    uint64_t v18 = **((void **)result + 17);
    float v19 = 8191.0 / (float)*(unsigned int *)(v13 + 128);
    LOWORD(a5) = *(_WORD *)(v13 + 140);
    *(float *)&a5 = (float)LODWORD(a5);
    float v20 = *(float *)(v13 + 72);
    float v21 = *(float *)(v13 + 76);
    float v22 = *(float *)(v13 + 80);
    float v23 = *(float *)(v13 + 84);
    float v24 = *(float *)(v13 + 88);
    float v25 = *(float *)(v13 + 92);
    float v26 = *(float *)(v13 + 96);
    float v27 = *(float *)(v13 + 100);
    float v28 = *(float *)(v13 + 104);
    uint64_t v29 = v13 + 164;
    uint64_t v30 = v13 + 16548;
    uint64_t v31 = *((void *)result + 14);
    unint64_t v32 = *((void *)result + 13) * a2 / v6;
    float v33 = (void *)*((void *)result + 16);
    unint64_t v34 = v32 + *((void *)result + 15);
    uint64_t v35 = *(void *)(result + 36);
    uint64_t v36 = *v33 + v34 * v18 + 2 * v31;
    uint64_t v38 = *v15;
    uint64_t v37 = v15[1];
    uint64_t v39 = v37 + v17 * v11 + 4 * v35;
    if (!v37) {
      uint64_t v39 = 0;
    }
    float32x2_t v40 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    double result = (unsigned __int8 *)(v38 + v16 * v11 + 4 * v35);
    float32x2_t v41 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v10)
      {
        uint64_t v42 = v10;
        unsigned int v43 = (unsigned int *)result;
        unsigned int v44 = (_WORD *)v36;
        unsigned int v45 = (unsigned __int8 *)v39;
        do
        {
          unsigned int v47 = *v43++;
          unsigned int v46 = v47;
          if (v45)
          {
            unsigned int v49 = *v45++;
            unsigned int v48 = v49;
          }
          else
          {
            unsigned int v48 = v46 >> 30;
          }
          _D28 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v46), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v40), v19), 0), v41)));
          _D28.i16[0] = *(_WORD *)(v29 + 2 * _D28.u32[0]);
          __asm { FCVT            S28, H28 }
          _H29 = *(_WORD *)(v29 + 2 * _D28.u32[1]);
          __asm { FCVT            S29, H29 }
          _H27 = *(_WORD *)(v29
                          + 2
                          * llroundf(fminf(fmaxf(v19 * (float)((float)(v46 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
          __asm { FCVT            S30, H27 }
          _H31 = *(_WORD *)(v30
                          + 2
                          * llroundf(fminf(fmaxf((float)((float)(v21 * _S29) + (float)(_S28 * v20)) + (float)(_S30 * v22), 0.0), 8191.0)));
          __asm { FCVT            S8, H31 }
          float v62 = 65535.0;
          if (_S8 <= 65535.0)
          {
            __asm { FCMP            H31, #0 }
            float v62 = _S8;
            if (_NF) {
              float v62 = 0.0;
            }
          }
          _H8 = *(_WORD *)(v30
                         + 2
                         * llroundf(fminf(fmaxf((float)((float)(v24 * _S29) + (float)(_S28 * v23)) + (float)(_S30 * v25), 0.0), 8191.0)));
          __asm { FCVT            S9, H8 }
          float v66 = 65535.0;
          if (_S9 <= 65535.0)
          {
            __asm { FCMP            H8, #0 }
            float v66 = _S9;
            if (_NF) {
              float v66 = 0.0;
            }
          }
          _H29 = *(_WORD *)(v30
                          + 2
                          * llroundf(fminf(fmaxf((float)((float)(v27 * _S29) + (float)(_S28 * v26)) + (float)(_S30 * v28), 0.0), 8191.0)));
          __asm { FCVT            S30, H29 }
          float v70 = 65535.0;
          if (_S30 <= 65535.0)
          {
            __asm { FCMP            H29, #0 }
            float v70 = _S30;
            if (_NF) {
              float v70 = 0.0;
            }
          }
          *unsigned int v44 = bswap32(21845 * v48) >> 16;
          v44[1] = __rev16(llroundf(v62));
          v44[2] = __rev16(llroundf(v66));
          v44[3] = __rev16(llroundf(v70));
          v44 += 4;
          --v42;
        }
        while (v42);
      }
      result += v16;
      v39 += v17;
      v36 += v18;
      ++v9;
    }
    while (v9 != v12);
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_b64a(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_b64a_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_rgb_b64a_GCD(unsigned __int8 *result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 28);
  unint64_t v3 = *result;
  unint64_t v4 = v2 * a2 / v3;
  unint64_t v5 = (v2 + v2 * a2) / v3;
  if (v5 != v4)
  {
    uint64_t v6 = 0;
    unint64_t v7 = *(unsigned __int8 **)(result + 20);
    unint64_t v8 = v4 + *(void *)(result + 44);
    unint64_t v9 = v5 - v4;
    uint64_t v10 = *((void *)result + 19);
    int64x2_t v12 = (void *)*((void *)result + 7);
    int64x2_t v11 = (uint64_t *)*((void *)result + 8);
    uint64_t v13 = *v11;
    uint64_t v14 = v11[1];
    uint64_t v15 = **((void **)result + 17);
    *(float *)&unsigned int v16 = (float)*(unsigned int *)(v10 + 136);
    float v17 = *(float *)&v16 / (float)*(unsigned int *)(v10 + 128);
    LOWORD(v16) = *(_WORD *)(v10 + 140);
    float v18 = (float)v16;
    uint64_t v19 = *((void *)result + 14);
    int64x2_t v20 = (void *)*((void *)result + 16);
    unint64_t v21 = *((void *)result + 13) * a2 / v3 + *((void *)result + 15);
    uint64_t v22 = *(void *)(result + 36);
    uint64_t v23 = *v20 + v21 * v15 + 2 * v19;
    uint64_t v26 = v12;
    uint64_t v25 = *v12;
    uint64_t v24 = v26[1];
    if (v24) {
      uint64_t v27 = v24 + v14 * v8 + 4 * v22;
    }
    else {
      uint64_t v27 = 0;
    }
    uint64_t v28 = v25 + v13 * v8 + 4 * v22;
    double result = (unsigned __int8 *)&unk_193E7D000;
    do
    {
      if (v7)
      {
        double result = v7;
        uint64_t v29 = (unsigned int *)v28;
        uint64_t v30 = (_WORD *)v23;
        uint64_t v31 = (unsigned __int8 *)v27;
        do
        {
          unsigned int v33 = *v29++;
          unsigned int v32 = v33;
          if (v31)
          {
            unsigned int v35 = *v31++;
            unsigned int v34 = v35;
          }
          else
          {
            unsigned int v34 = v32 >> 30;
          }
          float v36 = v17 * (float)((float)((v32 >> 20) & 0x3FF) - v18);
          float v37 = 65535.0;
          if (v36 <= 65535.0)
          {
            float v37 = v17 * (float)((float)((v32 >> 20) & 0x3FF) - v18);
            if (v36 < 0.0) {
              float v37 = 0.0;
            }
          }
          float v38 = v17 * (float)((float)((v32 >> 10) & 0x3FF) - v18);
          float v39 = 65535.0;
          if (v38 <= 65535.0)
          {
            float v39 = v17 * (float)((float)((v32 >> 10) & 0x3FF) - v18);
            if (v38 < 0.0) {
              float v39 = 0.0;
            }
          }
          float v40 = v17 * (float)((float)(v32 & 0x3FF) - v18);
          float v41 = 65535.0;
          if (v40 <= 65535.0)
          {
            float v41 = v17 * (float)((float)(v32 & 0x3FF) - v18);
            if (v40 < 0.0) {
              float v41 = 0.0;
            }
          }
          *uint64_t v30 = bswap32(21845 * v34) >> 16;
          v30[1] = __rev16(llroundf(v37));
          v30[2] = __rev16(llroundf(v39));
          v30[3] = __rev16(llroundf(v41));
          v30 += 4;
          --result;
        }
        while (result);
      }
      v28 += v13;
      v27 += v14;
      v23 += v15;
      ++v6;
    }
    while (v6 != v9);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_RGhA(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_RGhA_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_RGhA_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(void *)(result + 28);
  unint64_t v6 = *result;
  unint64_t v7 = v5 * a2 / v6;
  unint64_t v8 = (v5 + v5 * a2) / v6;
  if (v8 != v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)(result + 20);
    unint64_t v11 = v7 + *(void *)(result + 44);
    unint64_t v12 = v8 - v7;
    uint64_t v13 = *((void *)result + 19);
    uint64_t v14 = (void *)*((void *)result + 7);
    uint64_t v15 = (uint64_t *)*((void *)result + 8);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = **((void **)result + 17);
    float v19 = 8191.0 / (float)*(unsigned int *)(v13 + 128);
    LOWORD(a5) = *(_WORD *)(v13 + 140);
    *(float *)&a5 = (float)LODWORD(a5);
    float v20 = *(float *)(v13 + 72);
    float v21 = *(float *)(v13 + 76);
    float v22 = *(float *)(v13 + 80);
    float v23 = *(float *)(v13 + 84);
    float v24 = *(float *)(v13 + 88);
    float v25 = *(float *)(v13 + 92);
    float v26 = *(float *)(v13 + 96);
    float v27 = *(float *)(v13 + 100);
    uint64_t v28 = v13 + 164;
    uint64_t v29 = v13 + 16548;
    uint64_t v30 = v13 + 32932;
    float v31 = *(float *)(v13 + 104);
    float v32 = *(float *)(v13 + 108);
    float v33 = *(float *)(v13 + 112);
    float v34 = *(float *)(v13 + 116);
    float v35 = *(float *)(v13 + 120);
    uint64_t v36 = *(void *)(result + 36);
    uint64_t v37 = **((void **)result + 16)
        + (*((void *)result + 13) * a2 / v6 + *((void *)result + 15)) * v18
        + 2 * *((void *)result + 14);
    uint64_t v38 = v14[1];
    if (v38) {
      double result = (unsigned __int8 *)(v38 + v17 * v11 + 4 * v36);
    }
    else {
      double result = 0;
    }
    uint64_t v39 = *v14 + v16 * v11 + 4 * v36;
    float32x2_t v40 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    float32x2_t v41 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v10)
      {
        uint64_t v42 = v10;
        unsigned int v43 = (unsigned int *)v39;
        unsigned int v44 = (_WORD *)v37;
        unsigned int v45 = result;
        do
        {
          unsigned int v47 = *v43++;
          unsigned int v46 = v47;
          if (v45)
          {
            unsigned int v49 = *v45++;
            unsigned int v48 = v49;
          }
          else
          {
            unsigned int v48 = v46 >> 30;
          }
          _D31 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v46), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v40), v19), 0), v41)));
          _D31.i16[0] = *(_WORD *)(v28 + 2 * _D31.u32[0]);
          __asm { FCVT            S31, H31 }
          _H9 = *(_WORD *)(v28 + 2 * _D31.u32[1]);
          __asm { FCVT            S8, H9 }
          _H9 = *(_WORD *)(v28
                         + 2
                         * llroundf(fminf(fmaxf(v19 * (float)((float)(v46 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
          __asm { FCVT            S9, H9 }
          float v60 = (float)((float)((float)(v33 * _S8) + (float)(v32 * _S31)) + (float)(v34 * _S9))
              + (float)(v35 * fmaxf(_S31, fmaxf(_S8, _S9)));
          float v61 = 8191.0;
          if (v60 <= 8191.0)
          {
            float v61 = v60;
            if (v60 < 0.0) {
              float v61 = 0.0;
            }
          }
          _H10 = *(_WORD *)(v29 + 2 * llroundf(v61));
          __asm { FCVT            S10, H10 }
          float v64 = _S31 * _S10;
          float v65 = _S8 * _S10;
          float v66 = _S9 * _S10;
          float v67 = (float)((float)(v21 * v65) + (float)(v64 * v20)) + (float)(v66 * v22);
          float v68 = (float)((float)(v24 * v65) + (float)(v64 * v23)) + (float)(v66 * v25);
          _S31 = (float)((float)(v27 * v65) + (float)(v64 * v26)) + (float)(v66 * v31);
          LOWORD(v65) = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(v67, 0.0), 8191.0)));
          LOWORD(v66) = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(v68, 0.0), 8191.0)));
          LOWORD(_S31) = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(_S31, 0.0), 8191.0)));
          _S10 = (float)v48 * 0.33333;
          *unsigned int v44 = LOWORD(v65);
          v44[1] = LOWORD(v66);
          v44[2] = LOWORD(_S31);
          __asm { FCVT            H31, S10 }
          v44[3] = LOWORD(_S31);
          v44 += 4;
          --v42;
        }
        while (v42);
      }
      v39 += v16;
      result += v17;
      v37 += v18;
      ++v9;
    }
    while (v9 != v12);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_RGhA(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_RGhA_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Mat_TRC_RGhA_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(void *)(result + 28);
  unint64_t v6 = *result;
  unint64_t v7 = v5 * a2 / v6;
  unint64_t v8 = (v5 + v5 * a2) / v6;
  if (v8 != v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)(result + 20);
    unint64_t v11 = v7 + *(void *)(result + 44);
    unint64_t v12 = v8 - v7;
    uint64_t v13 = *((void *)result + 19);
    uint64_t v15 = (uint64_t *)*((void *)result + 7);
    uint64_t v14 = (uint64_t *)*((void *)result + 8);
    uint64_t v16 = *v14;
    uint64_t v17 = v14[1];
    uint64_t v18 = **((void **)result + 17);
    float v19 = 8191.0 / (float)*(unsigned int *)(v13 + 128);
    LOWORD(a5) = *(_WORD *)(v13 + 140);
    *(float *)&a5 = (float)LODWORD(a5);
    float v20 = *(float *)(v13 + 72);
    float v21 = *(float *)(v13 + 76);
    float v22 = *(float *)(v13 + 80);
    float v23 = *(float *)(v13 + 84);
    float v24 = *(float *)(v13 + 88);
    float v25 = *(float *)(v13 + 92);
    float v26 = *(float *)(v13 + 96);
    float v27 = *(float *)(v13 + 100);
    float v28 = *(float *)(v13 + 104);
    uint64_t v29 = v13 + 164;
    uint64_t v30 = v13 + 16548;
    uint64_t v31 = *((void *)result + 14);
    unint64_t v32 = *((void *)result + 13) * a2 / v6;
    float v33 = (void *)*((void *)result + 16);
    unint64_t v34 = v32 + *((void *)result + 15);
    uint64_t v35 = *(void *)(result + 36);
    uint64_t v36 = *v33 + v34 * v18 + 2 * v31;
    uint64_t v38 = *v15;
    uint64_t v37 = v15[1];
    uint64_t v39 = v37 + v17 * v11 + 4 * v35;
    if (!v37) {
      uint64_t v39 = 0;
    }
    double result = (unsigned __int8 *)(v38 + v16 * v11 + 4 * v35);
    float32x2_t v40 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    float32x2_t v41 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v10)
      {
        uint64_t v42 = v10;
        unsigned int v43 = (unsigned int *)result;
        unsigned int v44 = (_WORD *)v36;
        unsigned int v45 = (unsigned __int8 *)v39;
        do
        {
          unsigned int v47 = *v43++;
          unsigned int v46 = v47;
          if (v45)
          {
            unsigned int v49 = *v45++;
            unsigned int v48 = v49;
          }
          else
          {
            unsigned int v48 = v46 >> 30;
          }
          _D28 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v46), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v40), v19), 0), v41)));
          _D28.i16[0] = *(_WORD *)(v29 + 2 * _D28.u32[0]);
          __asm { FCVT            S28, H28 }
          _H29 = *(_WORD *)(v29 + 2 * _D28.u32[1]);
          __asm { FCVT            S29, H29 }
          _H27 = *(_WORD *)(v29
                          + 2
                          * llroundf(fminf(fmaxf(v19 * (float)((float)(v46 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
          __asm { FCVT            S27, H27 }
          float v59 = (float)((float)(v21 * _S29) + (float)(*(float *)_D28.i32 * v20)) + (float)(_S27 * v22);
          float v60 = (float)((float)(v24 * _S29) + (float)(*(float *)_D28.i32 * v23)) + (float)(_S27 * v25);
          _S27 = (float)((float)(v27 * _S29) + (float)(*(float *)_D28.i32 * v26)) + (float)(_S27 * v28);
          _D28.i16[0] = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(v59, 0.0), 8191.0)));
          LOWORD(_S29) = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(v60, 0.0), 8191.0)));
          LOWORD(_S27) = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(_S27, 0.0), 8191.0)));
          _S30 = (float)v48 * 0.33333;
          *unsigned int v44 = _D28.i16[0];
          v44[1] = LOWORD(_S29);
          v44[2] = LOWORD(_S27);
          __asm { FCVT            H27, S30 }
          v44[3] = LOWORD(_S27);
          v44 += 4;
          --v42;
        }
        while (v42);
      }
      result += v16;
      v39 += v17;
      v36 += v18;
      ++v9;
    }
    while (v9 != v12);
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_RGhA(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_RGhA_GCD);
  return 0;
}

uint64_t vt_Copy_l10r_rgb_RGhA_GCD(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 28);
  unint64_t v3 = *(unsigned __int8 *)result;
  unint64_t v4 = v2 * a2 / v3;
  unint64_t v5 = (v2 + v2 * a2) / v3;
  if (v5 != v4)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)(result + 20);
    unint64_t v8 = v4 + *(void *)(result + 44);
    unint64_t v9 = v5 - v4;
    uint64_t v10 = *(void *)(result + 152);
    int64x2_t v12 = *(void **)(result + 56);
    int64x2_t v11 = *(uint64_t **)(result + 64);
    uint64_t v13 = *v11;
    uint64_t v14 = v11[1];
    uint64_t v15 = **(void **)(result + 136);
    unsigned int v16 = 1.0;
    float v17 = 1.0 / (float)*(unsigned int *)(v10 + 128);
    LOWORD(v16) = *(_WORD *)(v10 + 140);
    float v18 = (float)v16;
    uint64_t v19 = *(void *)(result + 112);
    int64x2_t v20 = *(void **)(result + 128);
    unint64_t v21 = *(void *)(result + 104) * a2 / v3 + *(void *)(result + 120);
    double result = *(void *)(result + 36);
    uint64_t v22 = *v20 + v21 * v15 + 2 * v19;
    uint64_t v25 = v12;
    uint64_t v24 = *v12;
    uint64_t v23 = v25[1];
    if (v23) {
      uint64_t v26 = v23 + v14 * v8 + 4 * result;
    }
    else {
      uint64_t v26 = 0;
    }
    uint64_t v27 = v24 + v13 * v8 + 4 * result;
    do
    {
      if (v7)
      {
        uint64_t v28 = v7;
        double result = v27;
        uint64_t v29 = (_WORD *)v22;
        uint64_t v30 = (unsigned __int8 *)v26;
        do
        {
          unsigned int v32 = *(_DWORD *)result;
          result += 4;
          unsigned int v31 = v32;
          if (v30)
          {
            unsigned int v34 = *v30++;
            unsigned int v33 = v34;
          }
          else
          {
            unsigned int v33 = v31 >> 30;
          }
          _S3 = v17 * (float)((float)(v31 & 0x3FF) - v18);
          _S4 = v17 * (float)((float)((v31 >> 10) & 0x3FF) - v18);
          _S5 = v17 * (float)((float)((v31 >> 20) & 0x3FF) - v18);
          _S6 = (float)v33 * 0.33333;
          __asm { FCVT            H5, S5 }
          *uint64_t v29 = LOWORD(_S5);
          __asm { FCVT            H4, S4 }
          v29[1] = LOWORD(_S4);
          __asm { FCVT            H3, S3 }
          v29[2] = LOWORD(_S3);
          __asm { FCVT            H3, S6 }
          v29[3] = LOWORD(_S3);
          v29 += 4;
          --v28;
        }
        while (v28);
      }
      v27 += v13;
      v26 += v14;
      v22 += v15;
      ++v6;
    }
    while (v6 != v9);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Tone_Mat_TRC_RGfA(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Tone_Mat_TRC_RGfA_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Tone_Mat_TRC_RGfA_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(void *)(result + 28);
  unint64_t v6 = *result;
  unint64_t v7 = v5 * a2 / v6;
  unint64_t v8 = (v5 + v5 * a2) / v6;
  if (v8 != v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)(result + 20);
    unint64_t v11 = v7 + *(void *)(result + 44);
    unint64_t v12 = v8 - v7;
    uint64_t v13 = *((void *)result + 19);
    uint64_t v14 = (void *)*((void *)result + 7);
    uint64_t v15 = (uint64_t *)*((void *)result + 8);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = **((void **)result + 17);
    float v19 = 8191.0 / (float)*(unsigned int *)(v13 + 128);
    LOWORD(a5) = *(_WORD *)(v13 + 140);
    *(float *)&a5 = (float)LODWORD(a5);
    float v20 = *(float *)(v13 + 72);
    float v21 = *(float *)(v13 + 76);
    float v22 = *(float *)(v13 + 80);
    float v23 = *(float *)(v13 + 84);
    float v24 = *(float *)(v13 + 88);
    float v25 = *(float *)(v13 + 92);
    float v26 = *(float *)(v13 + 96);
    float v27 = *(float *)(v13 + 100);
    uint64_t v28 = v13 + 164;
    uint64_t v29 = v13 + 16548;
    uint64_t v30 = v13 + 32932;
    float v31 = *(float *)(v13 + 104);
    float v32 = *(float *)(v13 + 108);
    float v33 = *(float *)(v13 + 112);
    float v34 = *(float *)(v13 + 116);
    float v35 = *(float *)(v13 + 120);
    uint64_t v36 = *(void *)(result + 36);
    uint64_t v37 = **((void **)result + 16)
        + (*((void *)result + 13) * a2 / v6 + *((void *)result + 15)) * v18
        + 4 * *((void *)result + 14);
    uint64_t v38 = v14[1];
    if (v38) {
      double result = (unsigned __int8 *)(v38 + v17 * v11 + 4 * v36);
    }
    else {
      double result = 0;
    }
    uint64_t v39 = *v14 + v16 * v11 + 4 * v36;
    float32x2_t v40 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    float32x2_t v41 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v10)
      {
        uint64_t v42 = v10;
        unsigned int v43 = (unsigned int *)v39;
        uint64_t v44 = v37;
        unsigned int v45 = result;
        do
        {
          unsigned int v47 = *v43++;
          unsigned int v46 = v47;
          if (v45)
          {
            unsigned int v49 = *v45++;
            unsigned int v48 = v49;
          }
          else
          {
            unsigned int v48 = v46 >> 30;
          }
          _D31 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v46), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v40), v19), 0), v41)));
          _D31.i16[0] = *(_WORD *)(v28 + 2 * _D31.u32[0]);
          __asm { FCVT            S31, H31 }
          _H9 = *(_WORD *)(v28 + 2 * _D31.u32[1]);
          __asm { FCVT            S8, H9 }
          _H9 = *(_WORD *)(v28
                         + 2
                         * llroundf(fminf(fmaxf(v19 * (float)((float)(v46 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
          __asm { FCVT            S9, H9 }
          float v60 = (float)((float)((float)(v33 * _S8) + (float)(v32 * _S31)) + (float)(v34 * _S9))
              + (float)(v35 * fmaxf(_S31, fmaxf(_S8, _S9)));
          float v61 = 8191.0;
          if (v60 <= 8191.0)
          {
            float v61 = v60;
            if (v60 < 0.0) {
              float v61 = 0.0;
            }
          }
          _H10 = *(_WORD *)(v29 + 2 * llroundf(v61));
          __asm { FCVT            S10, H10 }
          float v64 = _S31 * _S10;
          _S8 = _S8 * _S10;
          _S9 = _S9 * _S10;
          float v67 = (float)((float)(v21 * _S8) + (float)(v64 * v20)) + (float)(_S9 * v22);
          float v68 = (float)((float)(v24 * _S8) + (float)(v64 * v23)) + (float)(_S9 * v25);
          _S31 = (float)((float)(v27 * _S8) + (float)(v64 * v26)) + (float)(_S9 * v31);
          LOWORD(_S8) = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(v67, 0.0), 8191.0)));
          LOWORD(_S9) = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(v68, 0.0), 8191.0)));
          __asm
          {
            FCVT            S8, H8
            FCVT            S9, H9
          }
          LOWORD(_S31) = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(_S31, 0.0), 8191.0)));
          __asm { FCVT            S31, H31 }
          *(_DWORD *)uint64_t v44 = _S8;
          *(_DWORD *)(v44 + 4) = _S9;
          *(_DWORD *)(v44 + 8) = _S31;
          *(float *)(v44 + 12) = (float)v48 * 0.33333;
          v44 += 16;
          --v42;
        }
        while (v42);
      }
      v39 += v16;
      result += v17;
      v37 += v18;
      ++v9;
    }
    while (v9 != v12);
  }
  return result;
}

uint64_t vt_Copy_l10r_TRC_Mat_TRC_RGfA(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_TRC_Mat_TRC_RGfA_GCD);
  return 0;
}

unsigned __int8 *vt_Copy_l10r_TRC_Mat_TRC_RGfA_GCD(unsigned __int8 *result, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(void *)(result + 28);
  unint64_t v6 = *result;
  unint64_t v7 = v5 * a2 / v6;
  unint64_t v8 = (v5 + v5 * a2) / v6;
  if (v8 != v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)(result + 20);
    unint64_t v11 = v7 + *(void *)(result + 44);
    unint64_t v12 = v8 - v7;
    uint64_t v13 = *((void *)result + 19);
    uint64_t v15 = (uint64_t *)*((void *)result + 7);
    uint64_t v14 = (uint64_t *)*((void *)result + 8);
    uint64_t v16 = *v14;
    uint64_t v17 = v14[1];
    uint64_t v18 = **((void **)result + 17);
    float v19 = 8191.0 / (float)*(unsigned int *)(v13 + 128);
    LOWORD(a5) = *(_WORD *)(v13 + 140);
    *(float *)&a5 = (float)LODWORD(a5);
    float v20 = *(float *)(v13 + 72);
    float v21 = *(float *)(v13 + 76);
    float v22 = *(float *)(v13 + 80);
    float v23 = *(float *)(v13 + 84);
    float v24 = *(float *)(v13 + 88);
    float v25 = *(float *)(v13 + 92);
    float v26 = *(float *)(v13 + 96);
    float v27 = *(float *)(v13 + 100);
    float v28 = *(float *)(v13 + 104);
    uint64_t v29 = v13 + 164;
    uint64_t v30 = v13 + 16548;
    uint64_t v31 = *((void *)result + 14);
    unint64_t v32 = *((void *)result + 13) * a2 / v6;
    float v33 = (void *)*((void *)result + 16);
    unint64_t v34 = v32 + *((void *)result + 15);
    uint64_t v35 = *(void *)(result + 36);
    uint64_t v36 = *v33 + v34 * v18 + 4 * v31;
    uint64_t v38 = *v15;
    uint64_t v37 = v15[1];
    uint64_t v39 = v37 + v17 * v11 + 4 * v35;
    if (!v37) {
      uint64_t v39 = 0;
    }
    double result = (unsigned __int8 *)(v38 + v16 * v11 + 4 * v35);
    float32x2_t v40 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    float32x2_t v41 = (float32x2_t)vdup_n_s32(0x45FFF800u);
    do
    {
      if (v10)
      {
        uint64_t v42 = v10;
        unsigned int v43 = (unsigned int *)result;
        uint64_t v44 = v36;
        unsigned int v45 = (unsigned __int8 *)v39;
        do
        {
          unsigned int v47 = *v43++;
          unsigned int v46 = v47;
          if (v45)
          {
            unsigned int v49 = *v45++;
            unsigned int v48 = v49;
          }
          else
          {
            unsigned int v48 = v46 >> 30;
          }
          _D28 = vcvt_s32_f32(vrnda_f32(vminnm_f32(vmaxnm_f32(vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v46), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v40), v19), 0), v41)));
          _D28.i16[0] = *(_WORD *)(v29 + 2 * _D28.u32[0]);
          _H29 = *(_WORD *)(v29 + 2 * _D28.u32[1]);
          __asm
          {
            FCVT            S28, H28
            FCVT            S29, H29
          }
          _H27 = *(_WORD *)(v29
                          + 2
                          * llroundf(fminf(fmaxf(v19 * (float)((float)(v46 & 0x3FF) - *(float *)&a5), 0.0), 8191.0)));
          __asm { FCVT            S27, H27 }
          float v59 = (float)((float)(v21 * _S29) + (float)(*(float *)_D28.i32 * v20)) + (float)(_S27 * v22);
          float v60 = (float)((float)(v24 * _S29) + (float)(*(float *)_D28.i32 * v23)) + (float)(_S27 * v25);
          _S27 = (float)((float)(v27 * _S29) + (float)(*(float *)_D28.i32 * v26)) + (float)(_S27 * v28);
          _D28.i16[0] = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(v59, 0.0), 8191.0)));
          LOWORD(_S29) = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(v60, 0.0), 8191.0)));
          __asm
          {
            FCVT            S28, H28
            FCVT            S29, H29
          }
          LOWORD(_S27) = *(_WORD *)(v30 + 2 * llroundf(fminf(fmaxf(_S27, 0.0), 8191.0)));
          __asm { FCVT            S27, H27 }
          *(_DWORD *)uint64_t v44 = _D28.i32[0];
          *(_DWORD *)(v44 + 4) = _S29;
          *(_DWORD *)(v44 + 8) = _S27;
          *(float *)(v44 + 12) = (float)v48 * 0.33333;
          v44 += 16;
          --v42;
        }
        while (v42);
      }
      result += v16;
      v39 += v17;
      v36 += v18;
      ++v9;
    }
    while (v9 != v12);
  }
  return result;
}

uint64_t vt_Copy_l10r_rgb_RGfA(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, int64x2_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  memset(v16, 0, sizeof(v16));
  v16[0] = *(unsigned char *)(a1 + 162);
  int64x2_t v9 = a2[2];
  int64x2_t v10 = *a6;
  int64x2_t v11 = a6[2];
  int64x2_t v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v9, a2[1]), *a2), (int8x16_t)vsubq_s64(*a2, v9), (int8x16_t)a2[1]);
  int64x2_t v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(vaddq_s64(v11, a6[1]), *a6), (int8x16_t)vsubq_s64(*a6, v11), (int8x16_t)a6[1]);
  *(int64x2_t *)&v16[4] = *a2;
  *(int8x16_t *)&v16[20] = vbslq_s8((int8x16_t)vcgtq_s64(v13, v12), (int8x16_t)v12, (int8x16_t)v13);
  *(int64x2_t *)&v16[36] = v9;
  int64x2_t v20 = v10;
  long long v21 = *(_OWORD *)&v16[20];
  int64x2_t v22 = v11;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a9;
  uint64_t v26 = a1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_apply_f(v16[0], global_queue, v16, (void (__cdecl *)(void *, size_t))vt_Copy_l10r_rgb_RGfA_GCD);
  return 0;
}

uint64_t vt_Copy_l10r_rgb_RGfA_GCD(uint64_t result, uint64_t a2, double a3, double a4)
{
  uint64_t v4 = *(void *)(result + 28);
  unint64_t v5 = *(unsigned __int8 *)result;
  unint64_t v6 = v4 * a2 / v5;
  unint64_t v7 = (v4 + v4 * a2) / v5;
  if (v7 != v6)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)(result + 20);
    unint64_t v10 = v6 + *(void *)(result + 44);
    unint64_t v11 = v7 - v6;
    uint64_t v12 = *(void *)(result + 152);
    uint64_t v14 = *(void **)(result + 56);
    int64x2_t v13 = *(uint64_t **)(result + 64);
    uint64_t v15 = *v13;
    uint64_t v16 = v13[1];
    uint64_t v17 = **(void **)(result + 136);
    unsigned int v18 = 1.0;
    float v19 = 1.0 / (float)*(unsigned int *)(v12 + 128);
    LOWORD(v18) = *(_WORD *)(v12 + 140);
    *(float *)&a4 = (float)v18;
    uint64_t v20 = *(void *)(result + 112);
    long long v21 = *(void **)(result + 128);
    unint64_t v22 = *(void *)(result + 104) * a2 / v5 + *(void *)(result + 120);
    double result = *(void *)(result + 36);
    uint64_t v23 = *v21 + v22 * v17 + 4 * v20;
    uint64_t v26 = v14;
    uint64_t v25 = *v14;
    uint64_t v24 = v26[1];
    if (v24) {
      uint64_t v27 = v24 + v16 * v10 + 4 * result;
    }
    else {
      uint64_t v27 = 0;
    }
    float32x2_t v28 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a4, 0);
    uint64_t v29 = v25 + v15 * v10 + 4 * result;
    do
    {
      if (v9)
      {
        uint64_t v30 = v9;
        double result = v29;
        uint64_t v31 = (float32x2_t *)v23;
        unint64_t v32 = (unsigned __int8 *)v27;
        do
        {
          unsigned int v34 = *(_DWORD *)result;
          result += 4;
          unsigned int v33 = v34;
          if (v32)
          {
            unsigned int v36 = *v32++;
            unsigned int v35 = v36;
          }
          else
          {
            unsigned int v35 = v33 >> 30;
          }
          *uint64_t v31 = vmul_n_f32(vsub_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v33), (uint32x2_t)0xFFFFFFF6FFFFFFECLL), (int8x8_t)0x300000003)), v28), v19);
          v31[1].f32[0] = v19 * (float)((float)(v33 & 0x3FF) - *(float *)&a4);
          v31[1].f32[1] = (float)v35 * 0.33333;
          v31 += 2;
          --v30;
        }
        while (v30);
      }
      v29 += v15;
      v27 += v16;
      v23 += v17;
      ++v8;
    }
    while (v8 != v11);
  }
  return result;
}

uint64_t VTPreprocessingSessionGetTypeID()
{
  return sVTPreprocessingSessionID;
}

void RegisterVTPreprocessingSession()
{
  v0 = (const void *)_CFRuntimeRegisterClass();
  sVTPreprocessingSessionID = (uint64_t)v0;
  sVTProcessingSessionPropertyCallbacks = 0;
  *(void *)algn_1E9334A18 = VTPreprocessingSessionCopySupportedPropertyDictionary;
  qword_1E9334A20 = (uint64_t)VTPreprocessingSessionSetProperty;
  qword_1E9334A28 = (uint64_t)VTPreprocessingSessionCopyProperty;
  qword_1E9334A30 = (uint64_t)VTPreprocessingSessionSetProperties;
  qword_1E9334A38 = (uint64_t)VTPreprocessingSessionCopySerializableProperties;

  VTSessionRegisterCallbacksForTypeID(&sVTProcessingSessionPropertyCallbacks, v0);
}

uint64_t VTPreprocessingSessionCopySupportedPropertyDictionary(uint64_t a1, CFTypeRef *a2)
{
  if (a2 && (*a2 = 0, a1) && !*(unsigned char *)(a1 + 16)) {
    return vtPreprocessingSessionCopyProperties(a2);
  }
  else {
    return FigSignalErrorAt();
  }
}

uint64_t vtPreprocessingSessionCopyProperties(CFTypeRef *a1)
{
  MEMORY[0x199705810](&sVTCreatePropertiesHandledByPreprocessingSessionOnce, vtPreprocessingSessionCreateProperties);
  if (a1 && sVTPreprocessingSessionProperties)
  {
    *a1 = CFRetain((CFTypeRef)sVTPreprocessingSessionProperties);
    return 0;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

uint64_t VTPreprocessingSessionSetProperty(uint64_t a1, const void *a2)
{
  if (!a1
    || *(unsigned char *)(a1 + 16)
    || !vtPreprocessingSessionIsPropertyHandledByVideoToolbox(a2)
    || (uint64_t result = CFEqual(@"SourcePixelBufferAttributes", a2), result))
  {
    return FigSignalErrorAt();
  }
  return result;
}

BOOL vtPreprocessingSessionIsPropertyHandledByVideoToolbox(const void *a1)
{
  CFDictionaryRef theDict = 0;
  vtPreprocessingSessionCopyProperties((CFTypeRef *)&theDict);
  if (!theDict) {
    return 0;
  }
  BOOL v2 = CFDictionaryContainsKey(theDict, a1) != 0;
  if (theDict) {
    CFRelease(theDict);
  }
  return v2;
}

uint64_t VTPreprocessingSessionCopyProperty(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  *a4 = 0;
  if (*(unsigned char *)(a1 + 16) || !vtPreprocessingSessionIsPropertyHandledByVideoToolbox(a2))
  {
    return FigSignalErrorAt();
  }
  else
  {
    if (CFEqual(@"SourcePixelBufferAttributes", a2))
    {
      CFTypeRef v8 = *(CFTypeRef *)(a1 + 40);
      if (v8) {
        CFTypeRef v8 = CFRetain(v8);
      }
      *a4 = v8;
    }
    return 0;
  }
}

uint64_t VTPreprocessingSessionSetProperties(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v3 = a1;
  if (a1 && !*(unsigned char *)(a1 + 16))
  {
    if (theDict)
    {
      uint64_t v4 = 0;
      CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)vtCompressionSessionSetOneProperty_0, &v3);
      return v4;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return FigSignalErrorAt();
  }
}

uint64_t vtCompressionSessionSetOneProperty_0(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = VTPreprocessingSessionSetProperty(*(void *)a3, a1);
  if (!*(_DWORD *)(a3 + 8)) {
    *(_DWORD *)(a3 + 8) = result;
  }
  return result;
}

uint64_t VTPreprocessingSessionCopySerializableProperties(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = 0;
  if (a1 && !*(unsigned char *)(a1 + 16)) {
    return 0;
  }
  else {
    return FigSignalErrorAt();
  }
}

uint64_t VTPreprocessingSessionCreate(const __CFAllocator *a1, int a2, int a3, const void *a4, void *a5)
{
  if (a5)
  {
    if (a4)
    {
      if (a2 > 0 && a3 > 0)
      {
        MEMORY[0x199705810](&VTPreprocessingSessionGetTypeID_sRegisterVTPreprocessingSessionOnce, RegisterVTPreprocessingSession);
        uint64_t Instance = _CFRuntimeCreateInstance();
        if (Instance)
        {
          unint64_t v11 = (void *)Instance;
          *(_DWORD *)(Instance + 20) = a2;
          *(_DWORD *)(Instance + 24) = a3;
          *(void *)(Instance + 72) = Instance;
          *(void *)(Instance + 88) = 0;
          *(void *)(Instance + 96) = 0;
          VTCreateVideoEncoderInstanceFromEncoderID(a4, *MEMORY[0x1E4F1CF80], (CFTypeRef *)(Instance + 64));
          uint64_t v12 = v11[8];
          uint64_t v13 = *(void *)((char *)v11 + 20);
          uint64_t v14 = *(void **)(CMBaseObjectGetVTable() + 16);
          if (v14) {
            uint64_t v15 = v14;
          }
          else {
            uint64_t v15 = 0;
          }
          if (*v15 >= 2uLL && (uint64_t v16 = (uint64_t (*)(uint64_t, void *, uint64_t))v15[10]) != 0)
          {
            uint64_t v17 = v16(v12, v11 + 9, v13);
            if (!v17)
            {
              callBacks.version = 0;
              callBacks.retain = 0;
              callBacks.copyDescription = 0;
              callBacks.equal = 0;
              callBacks.release = (CFArrayReleaseCallBack)vtPreprocessingSessionResolutionReleaseCallBack;
              v11[10] = CFArrayCreateMutable(a1, 0, &callBacks);
              *a5 = v11;
              return v17;
            }
          }
          else
          {
            uint64_t v17 = 4294954514;
          }
          CFRelease(v11);
          return v17;
        }
      }
    }
  }

  return FigSignalErrorAt();
}

void vtPreprocessingSessionResolutionReleaseCallBack(int a1, void *a2)
{
  uint64_t v3 = (const void *)a2[1];
  if (v3)
  {
    CFRelease(v3);
    a2[1] = 0;
  }
  uint64_t v4 = (const void *)a2[4];
  if (v4)
  {
    CFRelease(v4);
    a2[4] = 0;
  }
  unint64_t v5 = (const void *)a2[5];
  if (v5)
  {
    CFRelease(v5);
    a2[5] = 0;
  }
  unint64_t v6 = (const void *)a2[6];
  if (v6)
  {
    CFRelease(v6);
    a2[6] = 0;
  }
  unint64_t v7 = (const void *)a2[3];
  if (v7)
  {
    CFRelease(v7);
    a2[3] = 0;
  }
  CFTypeRef v8 = (const void *)a2[2];
  if (v8) {
    CFRelease(v8);
  }

  free(a2);
}

uint64_t VTPreprocessingSessionAddResolution(uint64_t a1, int a2, int a3, const void *a4, const void *a5, uint64_t a6, uint64_t a7)
{
  if (!a1 || *(unsigned char *)(a1 + 16) || a2 <= 0 || a3 <= 0)
  {
    return FigSignalErrorAt();
  }
  else
  {
    uint64_t v14 = malloc_type_calloc(1uLL, 0x48uLL, 0x10E00409425AC4EuLL);
    *uint64_t v14 = a2;
    v14[1] = a3;
    if (a4) {
      CFTypeRef v15 = CFRetain(a4);
    }
    else {
      CFTypeRef v15 = 0;
    }
    *((void *)v14 + 1) = v15;
    *((void *)v14 + 7) = a6;
    *((void *)v14 + 8) = a7;
    if (a5) {
      CFTypeRef v16 = CFRetain(a5);
    }
    else {
      CFTypeRef v16 = 0;
    }
    *((void *)v14 + 4) = v16;
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 80), v14);
    uint64_t v17 = *(void *)(a1 + 64);
    uint64_t v18 = *(void *)v14;
    float v19 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v19) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    if (*v20 >= 2uLL && (long long v21 = (uint64_t (*)(uint64_t, _DWORD *, uint64_t))v20[11]) != 0)
    {
      return v21(v17, v14, v18);
    }
    else
    {
      return 4294954514;
    }
  }
}

uint64_t VTPreprocessingSessionPreprocessFrame(uint64_t a1, __CVBuffer *cf, long long *a3, long long *a4, const __CFDictionary *a5, uint64_t a6)
{
  CVPixelBufferRef pixelBufferOut = 0;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 16) || !cf || (*((_DWORD *)a3 + 3) & 0x1D) != 1)
    {
      uint64_t v14 = FigSignalErrorAt();
      goto LABEL_28;
    }
    if (*(void *)(a1 + 40) && !CVPixelBufferIsCompatibleWithAttributes())
    {
      uint64_t v12 = (__CVPixelBufferPool **)(a1 + 48);
      CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (*(void *)(a1 + 48)) {
        goto LABEL_11;
      }
      uint64_t v14 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, *(CFDictionaryRef *)(a1 + 40), (CVPixelBufferPoolRef *)(a1 + 48));
      if (v14) {
        goto LABEL_28;
      }
      if (*v12)
      {
LABEL_11:
        uint64_t v14 = VTPixelTransferSessionCreate(v13, (VTPixelTransferSessionRef *)(a1 + 56));
        if (v14) {
          goto LABEL_28;
        }
        CFTypeRef v15 = *v12;
      }
      else
      {
        CFTypeRef v15 = 0;
      }
      uint64_t v14 = CVPixelBufferPoolCreatePixelBuffer(v13, v15, &pixelBufferOut);
      if (v14) {
        goto LABEL_28;
      }
      uint64_t v14 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 56), cf, pixelBufferOut);
      if (v14) {
        goto LABEL_28;
      }
    }
    else
    {
      CVPixelBufferRef pixelBufferOut = (CVPixelBufferRef)CFRetain(cf);
    }
    if (a5)
    {
      CFTypeRef v16 = (const void *)*MEMORY[0x1E4F1CFD0];
      BOOL v17 = v16 == CFDictionaryGetValue(a5, @"OnlyForLookBehind");
      BOOL v18 = v16 == CFDictionaryGetValue(a5, @"OnlyForLookAhead");
    }
    else
    {
      BOOL v17 = 0;
      BOOL v18 = 0;
    }
    long long v41 = *a3;
    uint64_t v42 = *((void *)a3 + 2);
    long long v39 = *a4;
    uint64_t v40 = *((void *)a4 + 2);
    if (*(void *)(a1 + 88)
      || (CFAllocatorRef v19 = CFGetAllocator((CFTypeRef)a1),
          CFMutableDictionaryRef v20 = CFDictionaryCreateMutable(v19, 0, 0, 0),
          (*(void *)(a1 + 88) = v20) != 0))
    {
      long long v21 = *(char **)(a1 + 96);
      *(void *)(a1 + 96) = v21 + 1;
      if (!v18 && !v17)
      {
        unint64_t v22 = (char *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A00408211C625uLL);
        *(_OWORD *)unint64_t v22 = v41;
        *((void *)v22 + 2) = v42;
        *(_OWORD *)(v22 + 24) = v39;
        *((void *)v22 + 5) = v40;
        *((void *)v22 + 7) = a6;
        CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 80));
        Mutable = CFArrayCreateMutable(v23, Count, 0);
        *((void *)v22 + 6) = Mutable;
        CFArrayRef v26 = *(const __CFArray **)(a1 + 80);
        v44.length = CFArrayGetCount(v26);
        v44.location = 0;
        CFArrayAppendArray(Mutable, v26, v44);
        CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 88), v21, v22);
      }
    }
    else
    {
      uint64_t v32 = FigSignalErrorAt();
      if (v32) {
        goto LABEL_30;
      }
      long long v21 = 0;
    }
    uint64_t v27 = *(void *)(a1 + 64);
    CVPixelBufferRef v28 = pixelBufferOut;
    long long v36 = *a3;
    uint64_t v37 = *((void *)a3 + 2);
    long long v34 = *a4;
    uint64_t v35 = *((void *)a4 + 2);
    uint64_t v29 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v29) {
      uint64_t v30 = v29;
    }
    else {
      uint64_t v30 = 0;
    }
    if (*v30 < 2uLL
      || (uint64_t v31 = (uint64_t (*)(uint64_t, char *, CVPixelBufferRef, long long *, long long *, const __CFDictionary *))v30[12]) == 0)
    {
      uint64_t v32 = 4294954514;
      goto LABEL_30;
    }
    long long v41 = v36;
    uint64_t v42 = v37;
    long long v39 = v34;
    uint64_t v40 = v35;
    uint64_t v14 = v31(v27, v21, v28, &v41, &v39, a5);
LABEL_28:
    uint64_t v32 = v14;
LABEL_30:
    if (pixelBufferOut) {
      CFRelease(pixelBufferOut);
    }
    return v32;
  }

  return FigSignalErrorAt();
}

uint64_t VTPreprocessingSessionCompleteFrames(uint64_t a1)
{
  if (!a1 || *(unsigned char *)(a1 + 16))
  {
LABEL_11:
    return FigSignalErrorAt();
  }
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  if (*v4 < 2uLL) {
    return 4294954514;
  }
  unint64_t v5 = (uint64_t (*)(uint64_t))v4[13];
  if (!v5) {
    return 4294954514;
  }
  uint64_t result = v5(v2);
  if (!result)
  {
    uint64_t result = *(void *)(a1 + 88);
    if (result)
    {
      if (CFDictionaryGetCount((CFDictionaryRef)result) < 1) {
        return 0;
      }
      goto LABEL_11;
    }
  }
  return result;
}

void VTPreprocessingSessionInvalidate(uint64_t a1)
{
  if (a1 && !*(unsigned char *)(a1 + 16))
  {
    *(unsigned char *)(a1 + 16) = 1;
    uint64_t v2 = *(const void **)(a1 + 64);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 64) = 0;
    }
    uint64_t v3 = *(const void **)(a1 + 80);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 80) = 0;
    }
    uint64_t v4 = *(const void **)(a1 + 88);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 88) = 0;
    }
    unint64_t v5 = *(const void **)(a1 + 48);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a1 + 48) = 0;
    }
    unint64_t v6 = *(const void **)(a1 + 56);
    if (v6)
    {
      CFRelease(v6);
      *(void *)(a1 + 56) = 0;
    }
    unint64_t v7 = *(const void **)(a1 + 32);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(a1 + 32) = 0;
    }
  }
}

uint64_t VTEncoderPreprocessingSessionSetSourcePixelBufferAttributes(void *a1, CFTypeRef cf)
{
  if (a1 && (uint64_t v2 = (void *)*a1) != 0)
  {
    uint64_t v3 = (const void *)v2[5];
    v2[5] = cf;
    if (cf) {
      CFRetain(cf);
    }
    if (v3) {
      CFRelease(v3);
    }
    uint64_t v4 = (const void *)v2[6];
    if (v4)
    {
      CFRelease(v4);
      v2[6] = 0;
    }
    unint64_t v5 = (const void *)v2[7];
    if (v5)
    {
      CFRelease(v5);
      v2[7] = 0;
    }
    return 0;
  }
  else
  {
    return FigSignalErrorAt();
  }
}

uint64_t VTEncoderPreprocessingSessionSetResolutionOutputPixelBufferAttributes(uint64_t a1, void *a2, const void *a3)
{
  uint64_t IsPartOfSession = vtPreprocessingSessionEnsureResolutionIsPartOfSession(a1, a2);
  if (!IsPartOfSession)
  {
    unint64_t v6 = (const void *)a2[2];
    a2[2] = a3;
    if (a3) {
      CFRetain(a3);
    }
    if (v6) {
      CFRelease(v6);
    }
    unint64_t v7 = (const void *)a2[3];
    if (v7)
    {
      CFRelease(v7);
      a2[3] = 0;
    }
    CFTypeRef v8 = (const void *)a2[5];
    if (v8)
    {
      CFRelease(v8);
      a2[5] = 0;
    }
    uint64_t v9 = (const void *)a2[6];
    if (v9)
    {
      CFRelease(v9);
      a2[6] = 0;
    }
  }
  return IsPartOfSession;
}

uint64_t vtPreprocessingSessionEnsureResolutionIsPartOfSession(uint64_t a1, const void *a2)
{
  if (a1)
  {
    if (*(void *)a1)
    {
      CFArrayRef v3 = *(const __CFArray **)(*(void *)a1 + 80);
      v6.length = CFArrayGetCount(v3);
      v6.location = 0;
      if (CFArrayContainsValue(v3, v6, a2)) {
        return 0;
      }
    }
  }

  return FigSignalErrorAt();
}

CFDictionaryRef VTEncoderPreprocessingSessionGetResolutionOutputPixelBufferPool(uint64_t a1, const __CFDictionary **a2)
{
  if (vtPreprocessingSessionEnsureResolutionIsPartOfSession(a1, a2)) {
    return 0;
  }
  if (!a2[3]
    && ((CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80],
         VTBuildPixelBufferPools((const __CFAllocator *)*MEMORY[0x1E4F1CF80], a2[2], a2[4], (uint64_t)*a2, a2 + 3, a2 + 5))|| a2[5] && VTPixelTransferSessionCreate(v3, a2 + 6)))
  {
    return 0;
  }
  else
  {
    return a2[3];
  }
}

uint64_t VTEncoderPreprocessingSessionEmitPreprocessedFrame(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, void *a5)
{
  CVPixelBufferRef pixelBufferOut = 0;
  long long v31 = *MEMORY[0x1E4F1F9F8];
  uint64_t v32 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  long long v29 = v31;
  uint64_t v30 = v32;
  uint64_t IsPartOfSession = vtPreprocessingSessionEnsureResolutionIsPartOfSession(a1, (const void *)a2);
  if (IsPartOfSession) {
    return IsPartOfSession;
  }
  uint64_t v11 = *(void *)a1;
  uint64_t Value = (char *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)a1 + 88), a3);
  if (!Value)
  {
    uint64_t v17 = FigSignalErrorAt();
    uint64_t v15 = 0;
    if (v17) {
      return v17;
    }
LABEL_11:
    if (a4)
    {
      CFAllocatorRef v19 = 0;
      uint64_t v17 = 0;
      goto LABEL_21;
    }
    if (a5)
    {
      CFMutableDictionaryRef v20 = *(__CVPixelBufferPool **)(a2 + 40);
      if (!v20)
      {
        CFAllocatorRef v19 = (__CVBuffer *)CFRetain(a5);
        a4 = 0;
        uint64_t v17 = 0;
        CVPixelBufferRef pixelBufferOut = v19;
LABEL_21:
        CFAllocatorRef v23 = *(void (**)(uint64_t, uint64_t, uint64_t, long long *, long long *, __CVBuffer *))(a2 + 56);
        uint64_t v22 = *(void *)(a2 + 64);
        long long v27 = v31;
        uint64_t v28 = v32;
        long long v25 = v29;
        uint64_t v26 = v30;
        v23(v22, v15, a4, &v27, &v25, v19);
        if (pixelBufferOut) {
          CFRelease(pixelBufferOut);
        }
        return v17;
      }
      uint64_t v21 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v20, &pixelBufferOut);
      if (pixelBufferOut)
      {
        uint64_t v21 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a2 + 48), (CVPixelBufferRef)a5, pixelBufferOut);
        a4 = v21;
        CFAllocatorRef v19 = pixelBufferOut;
LABEL_19:
        uint64_t v17 = v21;
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v21 = FigSignalErrorAt();
    }
    a4 = v21;
    CFAllocatorRef v19 = 0;
    goto LABEL_19;
  }
  CFAllocatorRef v13 = (CFMutableArrayRef *)Value;
  long long v31 = *(_OWORD *)Value;
  uint64_t v32 = *((void *)Value + 2);
  long long v29 = *(_OWORD *)(Value + 24);
  CFArrayRef v14 = (const __CFArray *)*((void *)Value + 6);
  uint64_t v30 = *((void *)Value + 5);
  uint64_t v15 = *((void *)Value + 7);
  v34.length = CFArrayGetCount(v14);
  v34.location = 0;
  FirstIndexOfuint64_t Value = CFArrayGetFirstIndexOfValue(v14, v34, (const void *)a2);
  if (FirstIndexOfValue == -1)
  {
    uint64_t v17 = FigSignalErrorAt();
  }
  else
  {
    CFArrayRemoveValueAtIndex(v13[6], FirstIndexOfValue);
    uint64_t v17 = 0;
  }
  if (!CFArrayGetCount(v13[6]))
  {
    CFMutableArrayRef v18 = v13[6];
    if (v18) {
      CFRelease(v18);
    }
    free(v13);
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v11 + 88), a3);
  }
  if (!v17) {
    goto LABEL_11;
  }
  return v17;
}

uint64_t VTDistributedPreprocessingGetOverlap(const void *a1, uint64_t a2, uint64_t a3)
{
  CFTypeRef cf = 0;
  if (a2)
  {
    if (a3)
    {
      uint64_t v5 = VTCreateVideoEncoderInstanceFromEncoderID(a1, *MEMORY[0x1E4F1CF80], &cf);
      if (!v5)
      {
        CFTypeRef v6 = cf;
        unint64_t v7 = *(void **)(CMBaseObjectGetVTable() + 16);
        if (v7) {
          CFTypeRef v8 = v7;
        }
        else {
          CFTypeRef v8 = 0;
        }
        if (*v8 < 2uLL || (uint64_t v9 = (uint64_t (*)(CFTypeRef, uint64_t, uint64_t))v8[14]) == 0)
        {
          uint64_t v10 = 4294954514;
          goto LABEL_12;
        }
        uint64_t v5 = v9(v6, a2, a3);
      }
    }
    else
    {
      uint64_t v5 = FigSignalErrorAt();
    }
    uint64_t v10 = v5;
LABEL_12:
    if (cf) {
      CFRelease(cf);
    }
    return v10;
  }

  return FigSignalErrorAt();
}

double vtPreprocessingSessionInit(uint64_t a1)
{
  *(void *)(a1 + 96) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

CFTypeRef vtPreprocessingSessionCopyFormattingDesc()
{
  return CFRetain(@"[VTPreprocessingSession]");
}

__CFString *vtPreprocessingSessionCopyDebugDesc(const void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFAllocatorRef v4 = CFGetAllocator(a1);
  CFStringAppendFormat(Mutable, 0, @"<VTPreprocessingSession %p [%p]>{}", a1, v4);
  return Mutable;
}

void vtPreprocessingSessionCreateProperties()
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v1 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (v1)
  {
    CFDictionaryRef v2 = v1;
    values = v1;
    keys[0] = @"SourcePixelBufferAttributes";
    sVTPreprocessingSessionProperties = (uint64_t)CFDictionaryCreate(v0, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (!sVTPreprocessingSessionProperties) {
      FigSignalErrorAt();
    }
    CFRelease(v2);
  }
  else
  {
    FigSignalErrorAt();
  }
}

uint64_t VTSelectAndCreateRAWProcessorInstance()
{
  return 0;
}

uint64_t VTCopyRAWProcessorExtensionProperties()
{
  return 4294947786;
}

CFTypeID VTMultiPassStorageGetTypeID(void)
{
  return sVTMultiPassStorageID;
}

uint64_t RegisterVTMultiPassStorage()
{
  uint64_t result = _CFRuntimeRegisterClass();
  sVTMultiPassStorageID = result;
  return result;
}

OSStatus VTMultiPassStorageCreate(CFAllocatorRef allocator, CFURLRef fileURL, CMTimeRange *timeRange, CFDictionaryRef options, VTMultiPassStorageRef *multiPassStorageOut)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  CMTimeValue value = 0;
  if (!multiPassStorageOut) {
    return -12902;
  }
  MEMORY[0x199705810](&VTMultiPassStorageGetTypeID_sRegisterVTMultiPassStorageOnce, RegisterVTMultiPassStorage);
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance) {
    return -12904;
  }
  uint64_t v11 = Instance;
  memset(&callBacks, 0, sizeof(callBacks));
  if (!FigServer_IsServerProcess())
  {
    long long v27 = *(_OWORD *)&timeRange->start.epoch;
    *(_OWORD *)&range1.start.CMTimeValue value = *(_OWORD *)&timeRange->start.value;
    *(_OWORD *)&range1.start.CMTimeEpoch epoch = v27;
    *(_OWORD *)&range1.duration.CMTimeScale timescale = *(_OWORD *)&timeRange->duration.timescale;
    OSStatus EmptyTable = VTMultiPassStorageRemote_Create(v11, (uint64_t)allocator, fileURL, (uint64_t)&range1, (uint64_t)options, (void *)(v11 + 16));
    if (!EmptyTable) {
      goto LABEL_76;
    }
    goto LABEL_24;
  }
  *(unsigned char *)(v11 + 48) = 1;
  if (options && CFDictionaryGetValueIfPresent(options, @"DoNotDelete", (const void **)&value)) {
    *(unsigned char *)(v11 + 48) = value != (void *)*MEMORY[0x1E4F1CFD0];
  }
  callBacks.version = 0;
  callBacks.retain = (CFArrayRetainCallBack)vtMultiPassStorageLocationRetain;
  callBacks.release = (CFArrayReleaseCallBack)vtMultiPassStorageLocationRelease;
  callBacks.copyDescription = (CFArrayCopyDescriptionCallBack)vtMultiPassStorageLocationCopyDescription;
  callBacks.equal = (CFArrayEqualCallBack)vtMultiPassStorageLocationEqual;
  CFAllocatorRef v12 = CFGetAllocator((CFTypeRef)v11);
  *(void *)(v11 + 152) = CFArrayCreateMutable(v12, 0, &callBacks);
  CFAllocatorRef v13 = CFGetAllocator((CFTypeRef)v11);
  *(void *)(v11 + 160) = CFArrayCreateMutable(v13, 0, &callBacks);
  long long v14 = *(_OWORD *)&timeRange->start.epoch;
  *(_OWORD *)&range1.start.CMTimeValue value = *(_OWORD *)&timeRange->start.value;
  *(_OWORD *)&range1.start.CMTimeEpoch epoch = v14;
  *(_OWORD *)&range1.duration.CMTimeScale timescale = *(_OWORD *)&timeRange->duration.timescale;
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&range2.start.CMTimeValue value = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&range2.start.CMTimeEpoch epoch = v15;
  *(_OWORD *)&range2.duration.CMTimeScale timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  if (!CMTimeRangeEqual(&range1, &range2)
    && ((timeRange->start.flags & 1) == 0
     || (timeRange->duration.flags & 1) == 0
     || timeRange->duration.epoch
     || timeRange->duration.value < 0))
  {
    OSStatus EmptyTable = FigSignalErrorAt();
    goto LABEL_24;
  }
  long long v16 = *(_OWORD *)&timeRange->start.value;
  long long v17 = *(_OWORD *)&timeRange->start.epoch;
  *(_OWORD *)(v11 + 136) = *(_OWORD *)&timeRange->duration.timescale;
  *(_OWORD *)(v11 + 120) = v17;
  *(_OWORD *)(v11 + 104) = v16;
  *(void *)(v11 + 32) = FigReentrantMutexCreate();
  if (!fileURL)
  {
    range1.start.CMTimeValue value = 0;
    uint64_t v28 = FigCFURLCreateFromTemporaryFileWithDirectory();
    if (v28)
    {
      long long v29 = (const void *)v28;
      OSStatus v30 = FigFileForkOpenMainByCFURL();
      if (v30)
      {
        OSStatus v23 = v30;
        if (range1.start.value) {
          FigFileForkClose();
        }
        CFRelease(v29);
        goto LABEL_25;
      }
      CMTimeValue v31 = range1.start.value;
      *(void *)(v11 + 56) = v29;
      *(void *)(v11 + 64) = v31;
    }
    else
    {
      OSStatus EmptyTable = FigSignalErrorAt();
      if (EmptyTable) {
        goto LABEL_24;
      }
    }
    goto LABEL_30;
  }
  *(void *)(v11 + 56) = CFRetain(fileURL);
  uint64_t v18 = v11 + 64;
  if (!FigFileDoesFileExist())
  {
    OSStatus EmptyTable = FigFileForkOpenMainByCFURL();
    if (EmptyTable) {
      goto LABEL_24;
    }
LABEL_30:
    OSStatus EmptyTable = vtMultiPassStorageCreateEmptyTable(v11);
    if (!EmptyTable) {
      goto LABEL_76;
    }
    goto LABEL_24;
  }
  OSStatus EmptyTable = FigFileForkOpenMainByCFURL();
  if (EmptyTable)
  {
LABEL_24:
    OSStatus v23 = EmptyTable;
    goto LABEL_25;
  }
  memset(&range1, 0, 40);
  MEMORY[0x199705420](*(void *)(v11 + 32));
  OSStatus FileInfo = FigFileGetFileInfo();
  if (FileInfo || (unint64_t v21 = range1.start.value, (FileInfo = FigFileForkRead()) != 0))
  {
LABEL_15:
    OSStatus v23 = FileInfo;
    uint64_t v24 = 0;
    CFDataRef v25 = 0;
    CFStringRef v26 = 0;
    goto LABEL_71;
  }
  unint64_t v22 = bswap32(v77);
  if (v22 < 0x14
    || (uint64_t)v21 < v22
    || v78 != 1887007846
    || v79 != 1936747894
    || v80 != 0x1000000)
  {
    OSStatus FileInfo = FigSignalErrorAt();
    goto LABEL_15;
  }
  CFDataRef v25 = 0;
  CFStringRef v67 = 0;
  CFAllocatorRef allocatora = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  while (1)
  {
    OSStatus v32 = FigFileForkRead();
    if (v32) {
      goto LABEL_69;
    }
    if (v74 == 0x1000000)
    {
      OSStatus v32 = FigFileForkRead();
      if (v32) {
        goto LABEL_69;
      }
      unint64_t v33 = bswap64(v76);
      uint64_t v34 = 16;
    }
    else
    {
      unint64_t v33 = bswap32(v74);
      uint64_t v34 = 12;
    }
    unint64_t v35 = v33 + v22;
    BOOL v36 = v33 < 8 || v35 > v21;
    if (v36) {
      goto LABEL_68;
    }
    if (v75 == 1768975734) {
      break;
    }
    if (v75 == 1936747894)
    {
      *(_OWORD *)&range2.start.CMTimeValue value = *MEMORY[0x1E4F1FA48];
      range2.start.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      unint64_t v44 = v33 - v34;
      unint64_t v45 = (v33 - v34) / 0x24;
      if ((v33 - v34) % 0x24)
      {
LABEL_68:
        OSStatus v32 = FigSignalErrorAt();
LABEL_69:
        OSStatus v23 = v32;
        uint64_t v24 = 0;
        goto LABEL_70;
      }
      uint64_t v47 = 512;
      if (v45 < 0x200) {
        uint64_t v47 = v45;
      }
      unint64_t v64 = v47;
      CFDataRef v63 = v25;
      if (v47)
      {
        size_t v48 = 36 * v47;
        malloc_type_id_t v49 = 1556728742;
      }
      else
      {
        size_t v48 = 0;
        malloc_type_id_t v49 = 1270757447;
      }
      uint64_t v24 = (UInt8 *)malloc_type_malloc(v48, v49);
      if (!v24)
      {
        OSStatus v23 = -12904;
        goto LABEL_109;
      }
      if (v44 < 0x24)
      {
LABEL_85:
        OSStatus v23 = 0;
        *(void *)(v11 + 72) = v21;
        *(void *)(v11 + 80) = 0;
LABEL_109:
        CFDataRef v25 = v63;
LABEL_70:
        CFStringRef v26 = v67;
        goto LABEL_71;
      }
      int allocatorb = 0;
      uint64_t v50 = 0;
      unint64_t v51 = v34 + v22;
      while (1)
      {
        if (v45 - v50 >= v64) {
          unint64_t v52 = v64;
        }
        else {
          unint64_t v52 = v45 - v50;
        }
        OSStatus v53 = FigFileForkRead();
        if (v53)
        {
LABEL_108:
          OSStatus v23 = v53;
          goto LABEL_109;
        }
        if (v52) {
          break;
        }
LABEL_105:
        v51 += 36 * v52;
        if (v50 >= (uint64_t)v45) {
          goto LABEL_85;
        }
      }
      unint64_t v62 = v51;
      uint64_t v54 = 0;
      uint64_t v61 = v52 + v50;
      while (1)
      {
        unsigned int v55 = malloc_type_malloc(0x30uLL, 0x10000400B536EFBuLL);
        *(void *)unsigned int v55 = *(void *)&v24[v54];
        *((_DWORD *)v55 + 2) = *(_DWORD *)&v24[v54 + 8];
        int v56 = *(_DWORD *)&v24[v54 + 12];
        *((_DWORD *)v55 + 3) = v56;
        *((void *)v55 + 2) = 0;
        *((_DWORD *)v55 + 6) = *(_DWORD *)&v24[v54 + 16];
        *((void *)v55 + 4) = *(void *)&v24[v54 + 20];
        *((void *)v55 + 5) = *(void *)&v24[v54 + 28];
        BOOL v57 = (v56 & 0x1D) == 1;
        float v58 = (CFMutableArrayRef *)(v11 + 152);
        if (!v57) {
          float v58 = (CFMutableArrayRef *)(v11 + 160);
        }
        CFArrayAppendValue(*v58, v55);
        if (v50 <= 0) {
          break;
        }
        CMTime time1 = *(CMTime *)v55;
        CMTime time2 = range2.start;
        if (CMTimeCompare(&time1, &time2) < 0) {
          goto LABEL_107;
        }
        CMTime time1 = *(CMTime *)v55;
        CMTime time2 = range2.start;
        int32_t v59 = CMTimeCompare(&time1, &time2);
        int v60 = *((_DWORD *)v55 + 6);
        if (v59) {
          goto LABEL_102;
        }
        BOOL v36 = v60 < allocatorb;
        int allocatorb = *((_DWORD *)v55 + 6);
        if (v36)
        {
LABEL_107:
          OSStatus v53 = FigSignalErrorAt();
          goto LABEL_108;
        }
LABEL_103:
        *(_OWORD *)&range2.start.CMTimeValue value = *(_OWORD *)v55;
        range2.start.CMTimeEpoch epoch = *((void *)v55 + 2);
        ++v50;
        v54 += 36;
        if (36 * v52 == v54)
        {
          uint64_t v50 = v61;
          unint64_t v51 = v62;
          goto LABEL_105;
        }
      }
      int v60 = *((_DWORD *)v55 + 6);
LABEL_102:
      int allocatorb = v60;
      goto LABEL_103;
    }
LABEL_63:
    unint64_t v22 = v35;
    if (v35 >= v21) {
      goto LABEL_68;
    }
  }
  if (v76) {
    goto LABEL_68;
  }
  uint64_t v37 = v18;
  unint64_t v38 = v21;
  CFDataRef v39 = v25;
  CFIndex v40 = v33 - v34;
  if (v33 == v34)
  {
    CFDataRef v25 = v39;
    unint64_t v21 = v38;
    uint64_t v18 = v37;
    goto LABEL_63;
  }
  long long v41 = (UInt8 *)malloc_type_malloc(v33 - v34, 0x643782D5uLL);
  if (!v41)
  {
    uint64_t v24 = 0;
    OSStatus v23 = -12904;
LABEL_117:
    CFStringRef v26 = v67;
    CFDataRef v25 = v39;
    goto LABEL_71;
  }
  uint64_t v24 = v41;
  OSStatus v42 = FigFileForkRead();
  if (v42)
  {
    OSStatus v23 = v42;
    goto LABEL_117;
  }
  if (v39) {
    CFRelease(v39);
  }
  CFDataRef v25 = CFDataCreate(allocatora, v24, v40);
  unint64_t v21 = v38;
  if (!v25)
  {
    uint64_t v18 = v37;
    goto LABEL_62;
  }
  if (v67) {
    CFRelease(v67);
  }
  CFStringRef v26 = CFStringCreateFromExternalRepresentation(allocatora, v25, 0x8000100u);
  OSStatus v43 = VTMultiPassStorageSetIdentifier(v11, v26);
  if (!v43)
  {
    uint64_t v18 = v37;
    CFStringRef v67 = v26;
LABEL_62:
    free(v24);
    goto LABEL_63;
  }
  OSStatus v23 = v43;
LABEL_71:
  MEMORY[0x199705430](*(void *)(v11 + 32));
  free(v24);
  if (v25) {
    CFRelease(v25);
  }
  if (v26) {
    CFRelease(v26);
  }
  if (!v23)
  {
LABEL_76:
    OSStatus v23 = 0;
    *multiPassStorageOut = (VTMultiPassStorageRef)v11;
    return v23;
  }
LABEL_25:
  CFRelease((CFTypeRef)v11);
  return v23;
}

uint64_t vtMultiPassStorageLocationRetain(uint64_t a1, uint64_t a2)
{
  return a2;
}

void vtMultiPassStorageLocationRelease(int a1, void *a2)
{
}

__CFString *vtMultiPassStorageLocationCopyDescription(uint64_t a1)
{
  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, 0, @"<vtMultiPassStorageLocation>{time:%lld/%d, index:%d, dataOffset:%lld, dataSize:%lld}", *(void *)a1, *(unsigned int *)(a1 + 8), *(unsigned int *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40));
  return Mutable;
}

BOOL vtMultiPassStorageLocationEqual(uint64_t a1, uint64_t a2)
{
  CMTime time1 = *(CMTime *)a1;
  CMTime v5 = *(CMTime *)a2;
  return !CMTimeCompare(&time1, &v5) && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

uint64_t vtMultiPassStorageCreateEmptyTable(uint64_t a1)
{
  MEMORY[0x199705420](*(void *)(a1 + 32));
  uint64_t v2 = FigFileForkWrite();
  if (!v2) {
    uint64_t v2 = FigSignalErrorAt();
  }
  uint64_t v4 = v2;
  MEMORY[0x199705430](*(void *)(a1 + 32));
  return v4;
}

uint64_t VTMultiPassStorageInvalidate(uint64_t a1)
{
  if (a1 && !*(unsigned char *)(a1 + 24))
  {
    *(unsigned char *)(a1 + 24) = 1;
    uint64_t v2 = *(void **)(a1 + 16);
    if (v2)
    {
      VTMultiPassStorageRemote_Invalidate(v2);
    }
    else
    {
      if (*(void *)(a1 + 32)) {
        MEMORY[0x199705420]();
      }
      FigFileForkClose();
      if (*(void *)(a1 + 56)) {
        FigFileDeleteFile();
      }
      *(void *)(a1 + 64) = 0;
      CFAllocatorRef v3 = *(const void **)(a1 + 152);
      if (v3)
      {
        CFRelease(v3);
        *(void *)(a1 + 152) = 0;
      }
      uint64_t v4 = *(const void **)(a1 + 160);
      if (v4)
      {
        CFRelease(v4);
        *(void *)(a1 + 160) = 0;
      }
      CMTime v5 = *(const void **)(a1 + 56);
      if (v5)
      {
        CFRelease(v5);
        *(void *)(a1 + 56) = 0;
      }
      CFTypeRef v6 = *(const void **)(a1 + 40);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(a1 + 40) = 0;
      }
      if (*(void *)(a1 + 32))
      {
        MEMORY[0x199705430]();
        FigSimpleMutexDestroy();
      }
    }
  }
  return 0;
}

uint64_t VTMultiPassStorageSetIdentifier(uint64_t a1, const void *a2)
{
  if (!a1 || *(unsigned char *)(a1 + 24)) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    return VTMultiPassStorageRemote_SetIdentifier(v4);
  }
  if (a2)
  {
    MEMORY[0x199705420](*(void *)(a1 + 32));
    CFTypeRef v6 = *(const void **)(a1 + 40);
    if (v6)
    {
      if (CFEqual(v6, a2)) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = 4294955083;
      }
    }
    else
    {
      CFTypeRef v8 = CFRetain(a2);
      uint64_t v7 = 0;
      *(void *)(a1 + 40) = v8;
    }
    MEMORY[0x199705430](*(void *)(a1 + 32));
    return v7;
  }
  else
  {
LABEL_14:
    return FigSignalErrorAt();
  }
}

CFStringRef VTMultiPassStorageCopyIdentifier(uint64_t a1)
{
  if (!a1 || *(unsigned char *)(a1 + 24))
  {
    FigSignalErrorAt();
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    MEMORY[0x199705420](*(void *)(a1 + 32));
    CFStringRef v4 = *(const __CFString **)(a1 + 40);
    if (v4) {
      CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4);
    }
    else {
      CFStringRef Copy = 0;
    }
    MEMORY[0x199705430](*(void *)(a1 + 32));
    return Copy;
  }

  return VTMultiPassStorageRemote_CopyIdentifier(v2);
}

uint64_t VTMultiPassStorageSetDataAtTimeStamp(uint64_t a1, long long *a2, int a3, CFDataRef theData)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1 && !*(unsigned char *)(a1 + 24))
  {
    int v8 = *((_DWORD *)a2 + 3);
    if ((v8 & 0x1D) == 1)
    {
      if ((v8 & 1) != 0 && *((void *)a2 + 2)) {
        goto LABEL_42;
      }
    }
    else if (v8)
    {
      goto LABEL_42;
    }
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v9 = *(void *)(a1 + 16);
    if (v9)
    {
      *(_OWORD *)&range.start.long long value = *a2;
      range.start.CMTimeEpoch epoch = *((void *)a2 + 2);
      return VTMultiPassStorageRemote_SetDataAtTimeStamp(v9, (uint64_t)&range, a3, theData);
    }
    if ((*(unsigned char *)(a1 + 116) & 1) != 0
      && (*(unsigned char *)(a1 + 140) & 1) != 0
      && !*(void *)(a1 + 144)
      && (v8 & 1) != 0
      && (*(void *)(a1 + 128) & 0x8000000000000000) == 0)
    {
      long long v12 = *(_OWORD *)(a1 + 120);
      *(_OWORD *)&range.start.long long value = *(_OWORD *)(a1 + 104);
      *(_OWORD *)&range.start.CMTimeEpoch epoch = v12;
      *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)(a1 + 136);
      CMTime time = *(CMTime *)a2;
      if (!CMTimeRangeContainsTime(&range, &time)) {
        return FigSignalErrorAt();
      }
    }
    MEMORY[0x199705420](*(void *)(a1 + 32));
    uint64_t v13 = 152;
    if ((*((_DWORD *)a2 + 3) & 1) == 0) {
      uint64_t v13 = 160;
    }
    CFArrayRef v14 = *(const __CFArray **)(a1 + v13);
    long long value = *a2;
    uint64_t v31 = *((void *)a2 + 2);
    LODWORD(v32) = a3;
    CFIndex Count = CFArrayGetCount(v14);
    v38.location = 0;
    v38.length = Count;
    CFIndex v16 = CFArrayBSearchValues(v14, v38, &value, (CFComparatorFunction)vtMultiPassLocationCompareTimeStampAndIndex, 0);
    if (v16 >= Count)
    {
      CFDictionaryRef ValueAtIndex = 0;
      CFIndex v17 = Count;
      if (theData)
      {
LABEL_24:
        CFIndex Length = CFDataGetLength(theData);
        CFIndex v21 = Length;
        CFIndex idx = v17;
        if (ValueAtIndex && ValueAtIndex[5] >= Length)
        {
          uint64_t v23 = ValueAtIndex[4];
          CFIndex v24 = *(void *)(a1 + 72);
        }
        else
        {
          if (!*(void *)(a1 + 80))
          {
            MEMORY[0x199705420](*(void *)(a1 + 32));
            *(_OWORD *)&range.start.long long value = xmmword_193E80AC0;
            *(void *)(a1 + 80) = *(void *)(a1 + 72);
            uint64_t v22 = FigFileForkWrite();
            if (v22)
            {
              uint64_t v11 = v22;
              MEMORY[0x199705430](*(void *)(a1 + 32));
              goto LABEL_40;
            }
            *(void *)(a1 + 72) += 16;
            MEMORY[0x199705430](*(void *)(a1 + 32));
          }
          uint64_t v23 = *(void *)(a1 + 72);
          CFIndex v24 = v23 + v21;
        }
        CFDataGetBytePtr(theData);
        uint64_t v25 = FigFileForkWrite();
        if (v25)
        {
          uint64_t v11 = v25;
          goto LABEL_40;
        }
        *(void *)(a1 + 72) = v24;
        if (ValueAtIndex)
        {
          uint64_t v11 = 0;
          ValueAtIndex[4] = v23;
          ValueAtIndex[5] = v21;
LABEL_40:
          MEMORY[0x199705430](*(void *)(a1 + 32));
          return v11;
        }
        CFStringRef v26 = malloc_type_malloc(0x30uLL, 0x10000400B536EFBuLL);
        if (!v26)
        {
          uint64_t v11 = 4294954392;
          goto LABEL_40;
        }
        *CFStringRef v26 = *(void *)a2;
        v26[2] = 0;
        v26[1] = *((void *)a2 + 1);
        *((_DWORD *)v26 + 6) = a3;
        v26[4] = v23;
        v26[5] = v21;
        CFArrayInsertValueAtIndex(v14, idx, v26);
LABEL_39:
        uint64_t v11 = 0;
        goto LABEL_40;
      }
    }
    else
    {
      CFIndex v17 = v16;
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v14, v16);
      long long v19 = *(_OWORD *)ValueAtIndex;
      range.start.CMTimeEpoch epoch = ValueAtIndex[2];
      *(_OWORD *)&range.start.long long value = v19;
      CMTime time = *(CMTime *)a2;
      if (CMTimeCompare(&range.start, &time) || *((_DWORD *)ValueAtIndex + 6) != a3) {
        CFDictionaryRef ValueAtIndex = 0;
      }
      if (theData) {
        goto LABEL_24;
      }
    }
    if (ValueAtIndex) {
      CFArrayRemoveValueAtIndex(v14, v17);
    }
    goto LABEL_39;
  }
LABEL_42:

  return FigSignalErrorAt();
}

uint64_t vtMultiPassLocationCompareTimeStampAndIndex(uint64_t a1, uint64_t a2)
{
  CMTime time1 = *(CMTime *)a1;
  CMTime v9 = *(CMTime *)a2;
  LODWORD(result) = CMTimeCompare(&time1, &v9);
  if (result) {
    return (int)result;
  }
  int v5 = *(_DWORD *)(a1 + 24);
  int v6 = *(_DWORD *)(a2 + 24);
  BOOL v7 = v5 < v6;
  BOOL v8 = v5 > v6;
  if (v7) {
    return -1;
  }
  else {
    return v8;
  }
}

uint64_t VTMultiPassStorageGetTimeStamp(uint64_t a1, long long *a2, const void *a3, uint64_t a4)
{
  if (a1 && a3 && a4 && !*(unsigned char *)(a1 + 24))
  {
    int v8 = *((_DWORD *)a2 + 3);
    if ((v8 & 0x1D) == 1)
    {
      if ((v8 & 1) != 0 && *((void *)a2 + 2)) {
        goto LABEL_53;
      }
    }
    else if (v8)
    {
      goto LABEL_53;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long value = 0u;
    uint64_t v9 = *(void *)(a1 + 16);
    if (v9)
    {
      *(_OWORD *)&range.start.long long value = *a2;
      range.start.CMTimeEpoch epoch = *((void *)a2 + 2);
      return VTMultiPassStorageRemote_GetTimeStamp(v9, (long long *)&range.start.value, (uint64_t)a3, a4);
    }
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 152));
    if ((*(unsigned char *)(a1 + 116) & 1) != 0
      && (*(unsigned char *)(a1 + 140) & 1) != 0
      && !*(void *)(a1 + 144)
      && (*(void *)(a1 + 128) & 0x8000000000000000) == 0
      && (*((unsigned char *)a2 + 12) & 1) != 0)
    {
      long long v20 = *(_OWORD *)(a1 + 120);
      *(_OWORD *)&range.start.long long value = *(_OWORD *)(a1 + 104);
      *(_OWORD *)&range.start.CMTimeEpoch epoch = v20;
      *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)(a1 + 136);
      CMTime v29 = *(CMTime *)a2;
      if (!CMTimeRangeContainsTime(&range, &v29)) {
        return FigSignalErrorAt();
      }
    }
    if (!Count)
    {
      uint64_t v11 = 0;
      uint64_t v15 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)a4 = *MEMORY[0x1E4F1F9F8];
      *(void *)(a4 + 16) = *(void *)(v15 + 16);
      return v11;
    }
    MEMORY[0x199705420](*(void *)(a1 + 32));
    if (CFEqual(a3, @"GetCurrentTimeStamp"))
    {
      uint64_t v11 = 0;
      long long v13 = *a2;
      uint64_t v14 = *((void *)a2 + 2);
LABEL_19:
      *(void *)(a4 + 16) = v14;
      *(_OWORD *)a4 = v13;
LABEL_28:
      MEMORY[0x199705430](*(void *)(a1 + 32));
      return v11;
    }
    if (CFEqual(a3, @"GetFirstTimeStamp") || CFEqual(a3, @"GetLastTimeStamp"))
    {
      if (CFEqual(a3, @"GetFirstTimeStamp")) {
        CFIndex v16 = 0;
      }
      else {
        CFIndex v16 = Count - 1;
      }
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 152), v16);
      uint64_t v11 = 0;
      uint64_t v18 = ValueAtIndex[2];
      *(_OWORD *)a4 = *(_OWORD *)ValueAtIndex;
      goto LABEL_27;
    }
    if (!CFEqual(a3, @"GetPreviousTimeStamp") && !CFEqual(a3, @"GetNextTimeStamp"))
    {
      uint64_t v11 = FigSignalErrorAt();
      goto LABEL_28;
    }
    long long value = *a2;
    *(void *)&long long v32 = *((void *)a2 + 2);
    v35.location = 0;
    v35.length = Count;
    CFIndex v21 = CFArrayBSearchValues(*(CFArrayRef *)(a1 + 152), v35, &value, (CFComparatorFunction)vtMultiPassLocationCompareTimeStampOnly, 0);
    if (v21 == CFArrayGetCount(*(CFArrayRef *)(a1 + 152))) {
      CFIndex v21 = CFArrayGetCount(*(CFArrayRef *)(a1 + 152)) - 1;
    }
    if (CFEqual(a3, @"GetPreviousTimeStamp"))
    {
      if ((v21 & 0x8000000000000000) == 0)
      {
        while (1)
        {
          uint64_t v22 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 152), v21);
          long long v23 = *(_OWORD *)v22;
          range.start.CMTimeEpoch epoch = v22[2];
          *(_OWORD *)&range.start.long long value = v23;
          CMTime v29 = *(CMTime *)a2;
          if (CMTimeCompare(&range.start, &v29) < 0) {
            break;
          }
          if (v21-- < 1) {
            goto LABEL_50;
          }
        }
LABEL_51:
        uint64_t v11 = 0;
        long long v13 = *(_OWORD *)v22;
        uint64_t v14 = v22[2];
        goto LABEL_19;
      }
    }
    else
    {
      CFIndex v25 = CFArrayGetCount(*(CFArrayRef *)(a1 + 152));
      if (Count >= v25) {
        CFIndex v26 = v25;
      }
      else {
        CFIndex v26 = Count;
      }
      if (v21 < v26)
      {
        do
        {
          uint64_t v22 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 152), v21);
          long long v27 = *(_OWORD *)v22;
          range.start.CMTimeEpoch epoch = v22[2];
          *(_OWORD *)&range.start.long long value = v27;
          CMTime v29 = *(CMTime *)a2;
          if (CMTimeCompare(&range.start, &v29) >= 1) {
            goto LABEL_51;
          }
        }
        while (v26 != ++v21);
      }
    }
LABEL_50:
    uint64_t v11 = 0;
    uint64_t v28 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)a4 = *MEMORY[0x1E4F1F9F8];
    uint64_t v18 = *(void *)(v28 + 16);
LABEL_27:
    *(void *)(a4 + 16) = v18;
    goto LABEL_28;
  }
LABEL_53:

  return FigSignalErrorAt();
}

uint64_t vtMultiPassLocationCompareTimeStampOnly(CMTime *a1, CMTime *a2)
{
  CMTime time1 = *a1;
  CMTime v3 = *a2;
  return CMTimeCompare(&time1, &v3);
}

uint64_t VTMultiPassStorageGetTimeStampAndDuration(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    *(_OWORD *)&range.start.long long value = *(_OWORD *)a2;
    range.start.CMTimeEpoch epoch = *(void *)(a2 + 16);
    return VTMultiPassStorageRemote_GetTimeStampAndDuration(v8, (long long *)&range.start.value, (uint64_t)a3, a4, a5);
  }
  *(_OWORD *)&range.start.long long value = *(_OWORD *)a2;
  range.start.CMTimeEpoch epoch = *(void *)(a2 + 16);
  uint64_t TimeStamp = VTMultiPassStorageGetTimeStamp(a1, (long long *)&range.start.value, a3, a4);
  uint64_t v9 = TimeStamp;
  if (a5 && !TimeStamp)
  {
    if ((*(unsigned char *)(a4 + 12) & 1) == 0)
    {
      uint64_t v9 = 0;
      uint64_t v12 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)a5 = *MEMORY[0x1E4F1F9F8];
      CMTimeEpoch epoch = *(void *)(v12 + 16);
      goto LABEL_18;
    }
    long long v19 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v26.long long value = *MEMORY[0x1E4F1F9F8];
    CMTimeEpoch v14 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    v26.CMTimeEpoch epoch = v14;
    *(_OWORD *)&range.start.long long value = *(_OWORD *)a4;
    range.start.CMTimeEpoch epoch = *(void *)(a4 + 16);
    if (VTMultiPassStorageGetTimeStamp(a1, (long long *)&range.start.value, @"GetNextTimeStamp", (uint64_t)&v26))
    {
LABEL_9:
      *(_OWORD *)&range.start.long long value = v19;
      range.start.CMTimeEpoch epoch = v14;
      CMTime lhs = *(CMTime *)a4;
      uint64_t v9 = VTMultiPassStorageGetTimeStamp(a1, (long long *)&lhs.value, @"GetPreviousTimeStamp", (uint64_t)&range);
      if (v9 || (range.start.flags & 1) == 0)
      {
        *(_OWORD *)a5 = v19;
        *(void *)(a5 + 16) = v14;
        return v9;
      }
      CMTime rhs = *(CMTime *)a4;
      CMTime start = range.start;
      CMTimeSubtract(&lhs, &rhs, &start);
      *(_OWORD *)a5 = *(_OWORD *)&lhs.value;
      CMTimeEpoch epoch = lhs.epoch;
LABEL_18:
      *(void *)(a5 + 16) = epoch;
      return v9;
    }
    if (v26.flags)
    {
      CMTime lhs = v26;
      CMTime rhs = *(CMTime *)a4;
      p_CMTime lhs = &lhs;
      p_CMTime rhs = &rhs;
    }
    else
    {
      long long v15 = *(_OWORD *)(a1 + 120);
      *(_OWORD *)&range.start.long long value = *(_OWORD *)(a1 + 104);
      *(_OWORD *)&range.start.CMTimeEpoch epoch = v15;
      *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)(a1 + 136);
      CMTimeRangeGetEnd(&v23, &range);
      if ((v23.flags & 0x1D) != 1) {
        goto LABEL_9;
      }
      long long v16 = *(_OWORD *)(a1 + 120);
      *(_OWORD *)&range.start.long long value = *(_OWORD *)(a1 + 104);
      *(_OWORD *)&range.start.CMTimeEpoch epoch = v16;
      *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)(a1 + 136);
      CMTimeRangeGetEnd(&v21, &range);
      CMTime lhs = *(CMTime *)a4;
      p_CMTime lhs = &v21;
      p_CMTime rhs = &lhs;
    }
    CMTimeSubtract(&range.start, p_lhs, p_rhs);
    uint64_t v9 = 0;
    *(_OWORD *)a5 = *(_OWORD *)&range.start.value;
    CMTimeEpoch epoch = range.start.epoch;
    goto LABEL_18;
  }
  return v9;
}

uint64_t VTMultiPassStorageCopyDataAtTimeStamp(uint64_t a1, long long *a2, int a3, __CFData **a4)
{
  if (a1 && !*(unsigned char *)(a1 + 24))
  {
    int v8 = *((_DWORD *)a2 + 3);
    if ((v8 & 0x1D) == 1)
    {
      if ((v8 & 1) != 0 && *((void *)a2 + 2)) {
        goto LABEL_30;
      }
    }
    else if (v8)
    {
      goto LABEL_30;
    }
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v9 = *(void *)(a1 + 16);
    if (v9)
    {
      *(_OWORD *)&range.start.long long value = *a2;
      range.start.CMTimeEpoch epoch = *((void *)a2 + 2);
      return VTMultiPassStorageRemote_CopyDataAtTimeStamp(v9, (long long *)&range.start.value, a3, a4);
    }
    if ((*(unsigned char *)(a1 + 116) & 1) != 0
      && (*(unsigned char *)(a1 + 140) & 1) != 0
      && !*(void *)(a1 + 144)
      && (v8 & 1) != 0
      && (*(void *)(a1 + 128) & 0x8000000000000000) == 0)
    {
      long long v12 = *(_OWORD *)(a1 + 120);
      *(_OWORD *)&range.start.long long value = *(_OWORD *)(a1 + 104);
      *(_OWORD *)&range.start.CMTimeEpoch epoch = v12;
      *(_OWORD *)&range.duration.CMTimeScale timescale = *(_OWORD *)(a1 + 136);
      CMTime v24 = *(CMTime *)a2;
      if (!CMTimeRangeContainsTime(&range, &v24)) {
        return FigSignalErrorAt();
      }
    }
    MEMORY[0x199705420](*(void *)(a1 + 32));
    uint64_t v13 = 152;
    if ((*((_DWORD *)a2 + 3) & 1) == 0) {
      uint64_t v13 = 160;
    }
    CFArrayRef v14 = *(const __CFArray **)(a1 + v13);
    long long value = *a2;
    uint64_t v27 = *((void *)a2 + 2);
    LODWORD(v28) = a3;
    CFIndex Count = CFArrayGetCount(v14);
    v32.location = 0;
    v32.length = Count;
    CFIndex v16 = CFArrayBSearchValues(v14, v32, &value, (CFComparatorFunction)vtMultiPassLocationCompareTimeStampAndIndex, 0);
    CFIndex v17 = 0;
    if (v16 < Count)
    {
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v14, v16);
      long long v19 = *(_OWORD *)ValueAtIndex;
      range.start.CMTimeEpoch epoch = ValueAtIndex[2];
      *(_OWORD *)&range.start.long long value = v19;
      CMTime v24 = *(CMTime *)a2;
      if (CMTimeCompare(&range.start, &v24) || *((_DWORD *)ValueAtIndex + 6) != a3)
      {
        CFIndex v17 = 0;
      }
      else
      {
        CFAllocatorRef v20 = CFGetAllocator((CFTypeRef)a1);
        Mutable = CFDataCreateMutable(v20, ValueAtIndex[5]);
        if (!Mutable)
        {
          uint64_t v11 = 4294954392;
          goto LABEL_27;
        }
        CFIndex v17 = Mutable;
        CFDataSetLength(Mutable, ValueAtIndex[5]);
        CFDataGetMutableBytePtr(v17);
        uint64_t v22 = FigFileForkRead();
        if (v22)
        {
          uint64_t v11 = v22;
          MEMORY[0x199705430](*(void *)(a1 + 32));
          CFRelease(v17);
          return v11;
        }
      }
    }
    uint64_t v11 = 0;
    *a4 = v17;
LABEL_27:
    MEMORY[0x199705430](*(void *)(a1 + 32));
    return v11;
  }
LABEL_30:

  return FigSignalErrorAt();
}

OSStatus VTMultiPassStorageClose(VTMultiPassStorageRef multiPassStorage)
{
  if (multiPassStorage)
  {
    if (*((unsigned char *)multiPassStorage + 24)) {
      return -12214;
    }
    uint64_t v2 = *((void *)multiPassStorage + 8);
    if (*((unsigned char *)multiPassStorage + 48))
    {
      FigFileForkClose();
      FigFileDeleteFile();
LABEL_46:
      *((void *)multiPassStorage + 8) = 0;
      CMTime v21 = (const void *)*((void *)multiPassStorage + 7);
      if (v21)
      {
        CFRelease(v21);
        *((void *)multiPassStorage + 7) = 0;
      }
      VTMultiPassStorageInvalidate((uint64_t)multiPassStorage);
      return 0;
    }
    if (!v2)
    {
LABEL_45:
      FigFileForkClose();
      goto LABEL_46;
    }
    MEMORY[0x199705420](*((void *)multiPassStorage + 4));
    if (*((void *)multiPassStorage + 10) && FigFileForkWrite())
    {
      MEMORY[0x199705430](*((void *)multiPassStorage + 4));
      CMTime v3 = 0;
LABEL_44:
      free(v3);
      goto LABEL_45;
    }
    *((void *)multiPassStorage + 10) = 0;
    if (*((void *)multiPassStorage + 5))
    {
      CFAllocatorRef v4 = CFGetAllocator(multiPassStorage);
      CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(v4, *((CFStringRef *)multiPassStorage + 5), 0x8000100u, 0);
      CFIndex Length = CFDataGetLength(ExternalRepresentation);
    }
    else
    {
      CFDataRef ExternalRepresentation = 0;
      CFIndex Length = 0;
    }
    if (FigFileForkWrite()) {
      goto LABEL_54;
    }
    uint64_t v7 = *((void *)multiPassStorage + 9);
    *((void *)multiPassStorage + 12) = v7;
    *((void *)multiPassStorage + 9) = v7 + 12;
    if (ExternalRepresentation)
    {
      CFDataGetBytePtr(ExternalRepresentation);
      if (FigFileForkWrite()) {
        goto LABEL_54;
      }
      *((void *)multiPassStorage + 9) += Length;
    }
    CFIndex Count = CFArrayGetCount(*((CFArrayRef *)multiPassStorage + 19));
    uint64_t v9 = CFArrayGetCount(*((CFArrayRef *)multiPassStorage + 20)) + Count;
    if (!FigFileForkWrite())
    {
      uint64_t v23 = *((void *)multiPassStorage + 9);
      *((void *)multiPassStorage + 9) = v23 + 16;
      if ((unint64_t)v9 >= 0x200) {
        unint64_t v10 = 512;
      }
      else {
        unint64_t v10 = v9;
      }
      if (v10)
      {
        size_t v11 = 36 * v10;
        malloc_type_id_t v12 = 1556728742;
      }
      else
      {
        size_t v11 = 0;
        malloc_type_id_t v12 = 1270757447;
      }
      CMTime v3 = (char *)malloc_type_malloc(v11, v12);
      CFDataRef v24 = ExternalRepresentation;
      if (v3)
      {
        if (v9 < 1)
        {
LABEL_38:
          if (!*((void *)multiPassStorage + 11) || !FigFileForkWrite()) {
            *((void *)multiPassStorage + 11) = v23;
          }
        }
        else
        {
          CFIndex v13 = 0;
          CFArrayRef v14 = (const __CFArray *)*((void *)multiPassStorage + 19);
          while (1)
          {
            if (v9 - v13 >= v10) {
              unint64_t v15 = v10;
            }
            else {
              unint64_t v15 = v9 - v13;
            }
            if (v15)
            {
              CFIndex v16 = v15 + v13;
              unint64_t v17 = v15;
              uint64_t v18 = v3;
              do
              {
                if (v13 >= CFArrayGetCount(*((CFArrayRef *)multiPassStorage + 19)))
                {
                  CFIndex v19 = CFArrayGetCount(*((CFArrayRef *)multiPassStorage + 19));
                  CFArrayRef v14 = (const __CFArray *)*((void *)multiPassStorage + 20);
                }
                else
                {
                  CFIndex v19 = 0;
                }
                CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v14, v13 - v19);
                *(void *)uint64_t v18 = *(void *)ValueAtIndex;
                *((_DWORD *)v18 + 2) = ValueAtIndex[2];
                *((_DWORD *)v18 + 3) = ValueAtIndex[3];
                *((_DWORD *)v18 + 4) = ValueAtIndex[6];
                *(void *)(v18 + 20) = *((void *)ValueAtIndex + 4);
                *(void *)(v18 + 28) = *((void *)ValueAtIndex + 5);
                ++v13;
                v18 += 36;
                --v17;
              }
              while (v17);
              CFIndex v13 = v16;
            }
            if (FigFileForkWrite()) {
              break;
            }
            *((void *)multiPassStorage + 9) += 36 * v15;
            if (v13 >= v9) {
              goto LABEL_38;
            }
          }
        }
      }
      CFDataRef ExternalRepresentation = v24;
      goto LABEL_42;
    }
LABEL_54:
    CMTime v3 = 0;
LABEL_42:
    MEMORY[0x199705430](*((void *)multiPassStorage + 4));
    if (ExternalRepresentation) {
      CFRelease(ExternalRepresentation);
    }
    goto LABEL_44;
  }

  return FigSignalErrorAt();
}

uint64_t VTMultiPassStorageWriteSegment(const __CFURL *a1, uint64_t a2, const __CFURL *a3, uint64_t a4, uint64_t a5)
{
  VTMultiPassStorageRef multiPassStorageOut = 0;
  CFTypeRef cf = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  if (a1
    && (*(unsigned char *)(a2 + 12) & 1) != 0
    && (*(unsigned char *)(a2 + 36) & 1) != 0
    && !*(void *)(a2 + 40)
    && (*(void *)(a2 + 24) & 0x8000000000000000) == 0)
  {
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(Mutable, @"DoNotDelete", (const void *)*MEMORY[0x1E4F1CFD0]);
    long long v14 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&v19.start.long long value = *(_OWORD *)a2;
    *(_OWORD *)&v19.start.CMTimeEpoch epoch = v14;
    *(_OWORD *)&v19.duration.CMTimeScale timescale = *(_OWORD *)(a2 + 32);
    uint64_t v15 = VTMultiPassStorageCreate(v12, a1, &v19, Mutable, &multiPassStorageOut);
    if (!v15)
    {
      long long v16 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)&v19.start.long long value = *(_OWORD *)a2;
      *(_OWORD *)&v19.start.CMTimeEpoch epoch = v16;
      *(_OWORD *)&v19.duration.CMTimeScale timescale = *(_OWORD *)(a2 + 32);
      uint64_t v15 = VTMultiPassStorageCreate(v12, a3, &v19, Mutable, (VTMultiPassStorageRef *)&cf);
      if (!v15)
      {
        *(void *)&long long v21 = a4;
        *((void *)&v21 + 1) = a5;
        unint64_t v17 = a5 ? &v20 : 0;
        long long v18 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)&v19.start.long long value = *(_OWORD *)a2;
        *(_OWORD *)&v19.start.CMTimeEpoch epoch = v18;
        *(_OWORD *)&v19.duration.CMTimeScale timescale = *(_OWORD *)(a2 + 32);
        long long v20 = xmmword_193E80AD0;
        uint64_t v15 = vtMultiPassStorageCopyStorageToMultiPassStorage((uint64_t)multiPassStorageOut, (uint64_t)cf, (uint64_t)&v19, (uint64_t)v17);
        if (!v15)
        {
          uint64_t v15 = VTMultiPassStorageClose((VTMultiPassStorageRef)cf);
          if (!v15) {
            uint64_t v15 = VTMultiPassStorageClose(multiPassStorageOut);
          }
        }
      }
    }
    uint64_t v6 = v15;
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    uint64_t v6 = FigSignalErrorAt();
  }
  if (multiPassStorageOut) {
    CFRelease(multiPassStorageOut);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v6;
}

uint64_t vtMultiPassStorageCopyStorageToMultiPassStorage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (!a1 || !a2 || *(unsigned char *)(a1 + 24) || *(unsigned char *)(a2 + 24))
  {
    return FigSignalErrorAt();
  }
  else
  {
    CFStringRef v8 = VTMultiPassStorageCopyIdentifier(a1);
    uint64_t v9 = VTMultiPassStorageSetIdentifier(a2, v8);
    if (v8) {
      CFRelease(v8);
    }
    if (!v9)
    {
      range.start.long long value = *(void *)a3;
      CMTimeScale v10 = *(_DWORD *)(a3 + 8);
      CMTimeFlags v11 = *(_DWORD *)(a3 + 12);
      CMTimeValue v53 = *(void *)a3;
      CMTimeScale v54 = *(_DWORD *)(a3 + 8);
      CMTimeEpoch v12 = *(void *)(a3 + 16);
      memset(&v52, 0, sizeof(v52));
      range.start.CMTimeScale timescale = v10;
      range.start.CMTimeFlags flags = v11;
      range.start.CMTimeEpoch epoch = v12;
      long long v13 = *(_OWORD *)(a3 + 24);
      range.duration.CMTimeEpoch epoch = *(void *)(a3 + 40);
      *(_OWORD *)&range.duration.long long value = v13;
      CMTimeRangeGetEnd(&v52, &range);
      CMTime v50 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
      memset(&range.duration, 0, sizeof(range.duration));
      CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 152));
      CFTypeRef cf = 0;
      uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
      CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 152), 0);
      CMTimeValue v55 = *(void *)ValueAtIndex;
      CMTimeFlags v17 = ValueAtIndex[3];
      CMTimeScale v56 = ValueAtIndex[2];
      CMTimeEpoch v18 = *((void *)ValueAtIndex + 2);
      CMTimeRange v19 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 152), Count - 1);
      if ((v11 & 1) == 0)
      {
        CMTimeValue v53 = v55;
        CMTimeScale v54 = v56;
        CMTimeFlags v11 = v17;
        CMTimeEpoch v12 = v18;
      }
      if ((v52.flags & 1) == 0)
      {
        long long v20 = *(_OWORD *)v19;
        v52.CMTimeEpoch epoch = v19[2];
        *(_OWORD *)&v52.long long value = v20;
      }
      CMTime lhs = v52;
      rhs.long long value = v53;
      rhs.CMTimeScale timescale = v54;
      rhs.CMTimeFlags flags = v11;
      rhs.CMTimeEpoch epoch = v12;
      CMTimeSubtract(&v50, &lhs, &rhs);
      range.start.long long value = v53;
      range.start.CMTimeScale timescale = v54;
      range.start.CMTimeFlags flags = v11;
      range.start.CMTimeEpoch epoch = v12;
      v59.location = 0;
      v59.length = Count;
      CFIndex v21 = CFArrayBSearchValues(*(CFArrayRef *)(a1 + 152), v59, &range, (CFComparatorFunction)vtMultiPassLocationCompareTimeStampOnly, 0);
      uint64_t v22 = (long long *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 152), v21);
      long long v23 = *v22;
      lhs.CMTimeEpoch epoch = *((void *)v22 + 2);
      *(_OWORD *)&lhs.long long value = v23;
      CMTime rhs = v52;
      if (CMTimeCompare(&lhs, &rhs) <= 0 && v21 < Count)
      {
        CFIndex v24 = v21 + 1;
        do
        {
          memset(&lhs, 0, sizeof(lhs));
          long long v25 = *v22;
          lhs.CMTimeEpoch epoch = *((void *)v22 + 2);
          *(_OWORD *)&lhs.long long value = v25;
          int v26 = *((_DWORD *)v22 + 6);
          *(_OWORD *)&rhs.long long value = v25;
          rhs.CMTimeEpoch epoch = lhs.epoch;
          if (VTMultiPassStorageCopyDataAtTimeStamp(a1, (long long *)&rhs.value, v26, (__CFData **)&cf)) {
            break;
          }
          CMTime rhs = lhs;
          if (VTMultiPassStorageSetDataAtTimeStamp(a2, (long long *)&rhs.value, v26, (CFDataRef)cf)) {
            break;
          }
          if (v24 < Count) {
            uint64_t v22 = (long long *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 152), v24);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          if (a4)
          {
            uint64_t v27 = FigGetUpTimeNanoseconds();
            if ((unint64_t)(v27 - UpTimeNanoseconds) >= 0x3B9ACA01)
            {
              uint64_t v28 = v27;
              CMTime rhs = lhs;
              v45.long long value = v53;
              v45.CMTimeScale timescale = v54;
              v45.CMTimeFlags flags = v11;
              v45.CMTimeEpoch epoch = v12;
              CMTimeSubtract(&time, &rhs, &v45);
              double Seconds = CMTimeGetSeconds(&time);
              CMTime rhs = v50;
              float v30 = (Seconds / CMTimeGetSeconds(&rhs) + (double)*(uint64_t *)a4) / (double)*(uint64_t *)(a4 + 8);
              uint64_t UpTimeNanoseconds = v28;
              if ((*(unsigned int (**)(void, float))(a4 + 24))(*(void *)(a4 + 16), v30)) {
                break;
              }
            }
          }
          long long v31 = *v22;
          lhs.CMTimeEpoch epoch = *((void *)v22 + 2);
          *(_OWORD *)&lhs.long long value = v31;
          CMTime rhs = v52;
          if (CMTimeCompare(&lhs, &rhs) > 0) {
            break;
          }
        }
        while (v24++ < Count);
      }
      if (cf) {
        CFRelease(cf);
      }
      CFIndex v33 = CFArrayGetCount(*(CFArrayRef *)(a1 + 160));
      v52.long long value = 0;
      if (v33 >= 1)
      {
        CFIndex v34 = v33;
        CFIndex v35 = 0;
        while (1)
        {
          uint64_t v36 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 160), v35);
          int v37 = *((_DWORD *)v36 + 6);
          *(_OWORD *)&range.start.long long value = *(_OWORD *)v36;
          range.start.CMTimeEpoch epoch = *((void *)v36 + 2);
          int v38 = VTMultiPassStorageCopyDataAtTimeStamp(a1, (long long *)&range.start.value, v37, (__CFData **)&v52);
          long long value = (const void *)v52.value;
          if (v38) {
            break;
          }
          int v40 = *((_DWORD *)v36 + 6);
          *(_OWORD *)&range.start.long long value = *(_OWORD *)v36;
          range.start.CMTimeEpoch epoch = *((void *)v36 + 2);
          int v41 = VTMultiPassStorageSetDataAtTimeStamp(a2, (long long *)&range.start.value, v40, (CFDataRef)v52.value);
          long long value = (const void *)v52.value;
          if (v41) {
            break;
          }
          if (v52.value)
          {
            CFRelease((CFTypeRef)v52.value);
            v52.long long value = 0;
          }
          if (v34 == ++v35) {
            goto LABEL_35;
          }
        }
        if (value) {
          CFRelease(value);
        }
      }
LABEL_35:
      if (a4)
      {
        uint64_t v42 = *(void *)a4 + 1;
        *(void *)a4 = v42;
        float v43 = (double)v42 / (double)*(uint64_t *)(a4 + 8);
        return (*(uint64_t (**)(void, float))(a4 + 24))(*(void *)(a4 + 16), v43);
      }
      else
      {
        return 0;
      }
    }
    return v9;
  }
}

uint64_t VTMultiPassStorageWriteMerged(const __CFArray *a1, const __CFURL *a2, uint64_t a3, uint64_t a4)
{
  VTMultiPassStorageRef multiPassStorageOut = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  if (a1)
  {
    CFIndex Count = CFArrayGetCount(a1);
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(Mutable, @"DoNotDelete", (const void *)*MEMORY[0x1E4F1CFD0]);
    uint64_t v11 = VTMultiPassStorageCreate(v9, a2, MEMORY[0x1E4F1FA20], Mutable, &multiPassStorageOut);
    if (!v11)
    {
      *(void *)&long long v19 = 0;
      *((void *)&v19 + 1) = Count;
      *(void *)&long long v20 = a3;
      *((void *)&v20 + 1) = a4;
      if (Count < 1)
      {
LABEL_13:
        VTMultiPassStorageClose(multiPassStorageOut);
        uint64_t v16 = 0;
        goto LABEL_14;
      }
      CFIndex v12 = 0;
      if (a4) {
        long long v13 = &v19;
      }
      else {
        long long v13 = 0;
      }
      long long v14 = (CMTimeRange *)MEMORY[0x1E4F1FA20];
      while (1)
      {
        VTMultiPassStorageRef multiPassStorage = 0;
        CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(a1, v12);
        uint64_t v11 = VTMultiPassStorageCreate(v9, ValueAtIndex, v14, Mutable, &multiPassStorage);
        if (v11) {
          break;
        }
        uint64_t v16 = vtMultiPassStorageCopyStorageToMultiPassStorage((uint64_t)multiPassStorage, (uint64_t)multiPassStorageOut, (uint64_t)v14, (uint64_t)v13);
        VTMultiPassStorageClose(multiPassStorage);
        if (multiPassStorage) {
          CFRelease(multiPassStorage);
        }
        if (v16) {
          goto LABEL_14;
        }
        if (Count == ++v12) {
          goto LABEL_13;
        }
      }
    }
    uint64_t v16 = v11;
  }
  else
  {
    uint64_t v16 = FigSignalErrorAt();
    Mutable = 0;
  }
LABEL_14:
  if (multiPassStorageOut) {
    CFRelease(multiPassStorageOut);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v16;
}

double vtMultiPassStorageInit(uint64_t a1)
{
  *(void *)(a1 + 160) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

void vtMultiPassStorageFinalize(OpaqueVTMultiPassStorage *a1)
{
  VTMultiPassStorageClose(a1);
  uint64_t v2 = (const void *)*((void *)a1 + 2);
  if (v2)
  {
    CFRelease(v2);
    *((void *)a1 + 2) = 0;
  }
}

CFTypeRef vtMultiPassStorageCopyFormattingDesc()
{
  return CFRetain(@"[VTMultiPassStorage]");
}

__CFString *vtMultiPassStorageCopyDebugDesc(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  Mutable = CFStringCreateMutable(v2, 0);
  CFAllocatorRef v4 = CFGetAllocator((CFTypeRef)a1);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 24);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 152);
  if (v8) {
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 152));
  }
  else {
    CFIndex Count = 0;
  }
  uint64_t v10 = *(void *)(a1 + 160);
  if (v10) {
    CFIndex v11 = CFArrayGetCount(*(CFArrayRef *)(a1 + 160));
  }
  else {
    CFIndex v11 = 0;
  }
  CFStringAppendFormat(Mutable, 0, @"<VTMultiPassStorage %p [%p]>{invalid:%d, delete:%d, url:%@, locations:%p (%ld)globals:%p (%ld)remote:%p}", a1, v4, v5, v6, v7, v8, Count, v10, v11, *(void *)(a1 + 16));
  return Mutable;
}

uint64_t VTDecompressionSessionRemoteClient_Create(mach_port_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, uint64_t a8, int a9, char *src, _DWORD *a11, void *a12, void *a13, int *a14)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  memset(v36, 0, 400);
  uint64_t v34 = 0;
  uint64_t v25 = 0x13000000000000;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v23 = 4;
  int v24 = a2;
  uint64_t v26 = a4;
  LODWORD(v27) = 16777472;
  HIDWORD(v27) = a5;
  uint64_t v28 = a6;
  int v29 = 16777472;
  unsigned int v30 = a7;
  uint64_t v31 = a8;
  int v32 = 16777472;
  int v33 = a9;
  uint64_t v34 = *MEMORY[0x1E4F14068];
  *(void *)&long long v35 = a3;
  *((void *)&v35 + 1) = __PAIR64__(a7, a5);
  LODWORD(v36[0]) = a9;
  if (MEMORY[0x1E4F149B0]) {
    int v15 = mig_strncpy_zerofill((char *)v36 + 12, src, 512);
  }
  else {
    int v15 = mig_strncpy((char *)v36 + 12, src, 512);
  }
  DWORD1(v36[0]) = 0;
  DWORD2(v36[0]) = v15;
  mach_msg_size_t v16 = ((v15 + 3) & 0xFFFFFFFC) + 124;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x471800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v18 = mach_msg(&rcv_name, 3162387, v16, 0x4Cu, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v19 = v18;
  if ((v18 - 268435458) > 0xE || ((1 << (v18 - 2)) & 0x4003) == 0)
  {
    if (!v18)
    {
      if (rcv_name.msgh_id == 71)
      {
        uint64_t v19 = 4294966988;
      }
      else if (rcv_name.msgh_id == 18300)
      {
        if ((rcv_name.msgh_bits & 0x80000000) == 0)
        {
          if (rcv_name.msgh_size == 36)
          {
            uint64_t v19 = 4294966996;
            if (v25)
            {
              if (rcv_name.msgh_remote_port) {
                uint64_t v19 = 4294966996;
              }
              else {
                uint64_t v19 = v25;
              }
            }
          }
          else
          {
            uint64_t v19 = 4294966996;
          }
          goto LABEL_29;
        }
        uint64_t v19 = 4294966996;
        if (v23 == 1 && rcv_name.msgh_size == 68 && !rcv_name.msgh_remote_port && HIWORD(v25) << 16 == 1114112)
        {
          uint64_t v19 = 0;
          *a11 = v24;
          uint64_t v20 = v28;
          *a12 = v27;
          *a13 = v20;
          *a14 = v29;
          return v19;
        }
      }
      else
      {
        uint64_t v19 = 4294966995;
      }
LABEL_29:
      mach_msg_destroy(&rcv_name);
      return v19;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v19 - 268435459) <= 1)
  {
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
    goto LABEL_29;
  }
  return v19;
}

uint64_t VTDecompressionSessionRemoteClient_Invalidate(int a1)
{
  uint64_t v8 = 0;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x471900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x2Cu, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (!v3)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v4 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18301)
      {
        uint64_t v4 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          uint64_t v4 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32]) {
            return v4;
          }
        }
      }
      else
      {
        uint64_t v4 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v4;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v4 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_22;
  }
  return v4;
}

uint64_t VTDecompressionSessionRemoteClient_Destroy(int a1)
{
  uint64_t v8 = 0;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x471A00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x2Cu, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (!v3)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v4 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18302)
      {
        uint64_t v4 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          uint64_t v4 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32]) {
            return v4;
          }
        }
      }
      else
      {
        uint64_t v4 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v4;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v4 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_22;
  }
  return v4;
}

uint64_t VTDecompressionSessionRemoteClient_CopySupportedPropertyDictionary(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v15 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x471B00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x44u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18303)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v10 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v10 = 4294966996;
              }
              else {
                uint64_t v10 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v10 = 4294966996;
          }
          goto LABEL_30;
        }
        uint64_t v10 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v15) == 1)
        {
          int v12 = DWORD1(v15);
          if (DWORD1(v15) == v16)
          {
            uint64_t v10 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v12;
            *a4 = DWORD1(v16);
            return v10;
          }
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v10 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_30;
  }
  return v10;
}

uint64_t VTDecompressionSessionRemoteClient_CopySerializableProperties(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v15 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x471C00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x44u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18304)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v10 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v10 = 4294966996;
              }
              else {
                uint64_t v10 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v10 = 4294966996;
          }
          goto LABEL_30;
        }
        uint64_t v10 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v15) == 1)
        {
          int v12 = DWORD1(v15);
          if (DWORD1(v15) == v16)
          {
            uint64_t v10 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v12;
            *a4 = DWORD1(v16);
            return v10;
          }
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v10 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_30;
  }
  return v10;
}

uint64_t VTDecompressionSessionRemoteClient_CopyProperty(mach_port_name_t a1, const char *a2, void *a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  *(_OWORD *)mach_msg_header_t rcv_name = 0u;
  memset(v17, 0, sizeof(v17));
  *((void *)&v17[0] + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v9 = mig_strncpy_zerofill((char *)&v17[1] + 8, a2, 512);
  }
  else {
    int v9 = mig_strncpy((char *)&v17[1] + 8, a2, 512);
  }
  LODWORD(v17[1]) = 0;
  DWORD1(v17[1]) = v9;
  mach_msg_size_t v10 = ((v9 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&v17[0] = 0x471D00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v12 = mach_msg((mach_msg_header_t *)rcv_name, 3162387, v10, 0x44u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!v12)
    {
      if (DWORD1(v17[0]) == 71)
      {
        uint64_t v13 = 4294966988;
      }
      else if (DWORD1(v17[0]) == 18305)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            uint64_t v13 = 4294966996;
            if (LODWORD(v17[1]))
            {
              if (rcv_name[2]) {
                uint64_t v13 = 4294966996;
              }
              else {
                uint64_t v13 = LODWORD(v17[1]);
              }
            }
          }
          else
          {
            uint64_t v13 = 4294966996;
          }
          goto LABEL_30;
        }
        uint64_t v13 = 4294966996;
        if (DWORD2(v17[0]) == 1 && rcv_name[1] == 60 && !rcv_name[2] && BYTE7(v17[1]) == 1)
        {
          int v14 = DWORD2(v17[1]);
          if (DWORD2(v17[1]) == DWORD1(v18))
          {
            uint64_t v13 = 0;
            *a3 = *(void *)((char *)v17 + 12);
            *a4 = v14;
            *a5 = DWORD2(v18);
            return v13;
          }
        }
      }
      else
      {
        uint64_t v13 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_30;
  }
  return v13;
}

uint64_t VTDecompressionSessionRemoteClient_SetProperty(mach_port_t a1, const char *a2, uint64_t a3, unsigned int a4, int *a5)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  *(_OWORD *)&v20[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v17 = 1;
  uint64_t v18 = a3;
  int v19 = 16777472;
  *(void *)long long v20 = a4;
  *(void *)&v20[4] = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v8 = mig_strncpy_zerofill(&v20[20], a2, 512);
  }
  else {
    int v8 = mig_strncpy(&v20[20], a2, 512);
  }
  *(_DWORD *)&v20[12] = 0;
  *(_DWORD *)&v20[16] = v8;
  uint64_t v9 = (v8 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v10 = v9 + 64;
  *(_DWORD *)&v20[v9 + 20] = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x471E00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v12 = mach_msg(&rcv_name, 3162387, v10, 0x30u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!v12)
    {
      if (rcv_name.msgh_id == 71)
      {
        uint64_t v13 = 4294966988;
      }
      else if (rcv_name.msgh_id == 18306)
      {
        if ((rcv_name.msgh_bits & 0x80000000) == 0)
        {
          if (rcv_name.msgh_size == 40)
          {
            if (!rcv_name.msgh_remote_port)
            {
              uint64_t v13 = HIDWORD(v18);
              if (!HIDWORD(v18))
              {
                *a5 = v19;
                return v13;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name.msgh_size == 36)
          {
            if (rcv_name.msgh_remote_port) {
              BOOL v14 = 1;
            }
            else {
              BOOL v14 = HIDWORD(v18) == 0;
            }
            if (v14) {
              uint64_t v13 = 4294966996;
            }
            else {
              uint64_t v13 = HIDWORD(v18);
            }
            goto LABEL_28;
          }
        }
        uint64_t v13 = 4294966996;
      }
      else
      {
        uint64_t v13 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy(&rcv_name);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
    goto LABEL_28;
  }
  return v13;
}

uint64_t VTDecompressionSessionRemoteClient_SetProperties(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 16777472;
  int v16 = a3;
  uint64_t v17 = *MEMORY[0x1E4F14068];
  int v18 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v12.msgh_bits = 2147489043;
  v12.msgh_remote_port = a1;
  v12.msgh_local_port = special_reply_port;
  *(void *)&v12.msgh_voucher_port = 0x471F00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v12);
    mach_port_t special_reply_port = v12.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v12, 3162387, 0x38u, 0x30u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v12.msgh_id == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (v12.msgh_id == 18307)
      {
        if ((v12.msgh_bits & 0x80000000) == 0)
        {
          if (v12.msgh_size == 40)
          {
            if (!v12.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a4 = v15;
                return v8;
              }
              goto LABEL_28;
            }
          }
          else if (v12.msgh_size == 36)
          {
            if (v12.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = HIDWORD(v14) == 0;
            }
            if (v10) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = HIDWORD(v14);
            }
            goto LABEL_28;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy(&v12);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((v12.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v12.msgh_local_port);
    }
    goto LABEL_28;
  }
  return v8;
}

uint64_t VTDecompressionSessionRemoteClient_DecodeFrame(int a1, int a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9)
{
  *(_OWORD *)&msg[20] = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_DWORD *)&msg[28] = a2;
  int v12 = 1245184;
  uint64_t v13 = a3;
  int v14 = 16777472;
  int v15 = a4;
  uint64_t v16 = a6;
  int v17 = 16777472;
  int v18 = a7;
  uint64_t v19 = *MEMORY[0x1E4F14068];
  int v20 = a4;
  int v21 = a5;
  int v22 = a7;
  uint64_t v23 = a8;
  int v24 = a9;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(void *)&msg[20] = 0x300004720;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 2097169, 0x68u, 0, 0, *MEMORY[0x1E4F1EB98], 0);
  if ((v9 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v9;
}

uint64_t VTDecompressionSessionRemoteClient_DequeueNextPendingFrame(int a1, _DWORD *a2, void *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, void *a7, _DWORD *a8, _DWORD *a9, void *a10, _DWORD *a11, void *a12, _DWORD *a13, _DWORD *a14, void *a15, _DWORD *a16, void *a17, _DWORD *a18, _DWORD *a19, void *a20,_DWORD *a21,void *a22,_DWORD *a23,_DWORD *a24,void *a25,_DWORD *a26,void *a27,_DWORD *a28,_DWORD *a29,void *a30,_DWORD *a31,void *a32,_DWORD *a33,uint64_t a34,uint64_t a35,_DWORD *a36,_DWORD *a37)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  uint64_t v84 = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  memset(v81, 0, sizeof(v81));
  long long v79 = 0u;
  long long v80 = 0u;
  memset(v78, 0, sizeof(v78));
  long long v77 = 0u;
  long long v76 = 0u;
  long long v75 = 0u;
  long long v74 = 0u;
  long long v73 = 0u;
  long long v72 = 0u;
  long long v71 = 0u;
  long long v70 = 0u;
  memset(v69, 0, sizeof(v69));
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  *(_DWORD *)&msg[4] = 0;
  *(_OWORD *)&msg[20] = 0u;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x472100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v46 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x19Cu, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v47 = v46;
  if ((v46 - 268435458) > 0xE || ((1 << (v46 - 2)) & 0x4003) == 0)
  {
    if (!v46)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v47 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18309)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v47 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v47 = 4294966996;
              }
              else {
                uint64_t v47 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v47 = 4294966996;
          }
          goto LABEL_53;
        }
        uint64_t v47 = 4294966996;
        if (*(_DWORD *)&msg[24] == 17
          && *(_DWORD *)&msg[4] == 404
          && !*(_DWORD *)&msg[8]
          && WORD1(v65) << 16 == 1114112
          && HIBYTE(v65) == 1
          && HIWORD(v66) << 16 == 1114112
          && BYTE11(v67) == 1
          && BYTE11(v68) == 1
          && WORD5(v69[0]) << 16 == 1114112
          && BYTE7(v69[1]) == 1
          && BYTE7(v69[2]) == 1
          && WORD3(v70) << 16 == 1114112
          && BYTE3(v71) == 1
          && BYTE3(v72) == 1
          && WORD1(v73) << 16 == 1114112
          && HIBYTE(v73) == 1
          && HIBYTE(v74) == 1
          && HIWORD(v75) << 16 == 1114112
          && BYTE11(v76) == 1
          && BYTE11(v77) == 1)
        {
          int v48 = v66;
          if (v66 == v78[7])
          {
            int v49 = HIDWORD(v67);
            if (HIDWORD(v67) == v79)
            {
              int v50 = HIDWORD(v68);
              if (HIDWORD(v68) == DWORD1(v79))
              {
                int v51 = DWORD2(v69[1]);
                if (DWORD2(v69[1]) == DWORD2(v79))
                {
                  int v52 = DWORD2(v69[2]);
                  if (DWORD2(v69[2]) == HIDWORD(v79))
                  {
                    int v53 = DWORD1(v71);
                    if (DWORD1(v71) == v80)
                    {
                      int v54 = DWORD1(v72);
                      if (DWORD1(v72) == DWORD1(v80))
                      {
                        int v55 = v74;
                        if (v74 == DWORD2(v80))
                        {
                          int v56 = v75;
                          if (v75 == HIDWORD(v80))
                          {
                            int v57 = HIDWORD(v76);
                            if (HIDWORD(v76) == LODWORD(v81[0]))
                            {
                              int v58 = HIDWORD(v77);
                              if (HIDWORD(v77) == HIDWORD(v81[0]))
                              {
                                uint64_t v47 = 0;
                                int v59 = DWORD1(v75);
                                *a2 = v78[2];
                                *a3 = *(void *)&v78[3];
                                *a4 = v78[5];
                                *a5 = v78[6];
                                *a6 = *(_DWORD *)&msg[28];
                                *a7 = *(void *)((char *)&v65 + 4);
                                *a8 = v48;
                                *a9 = DWORD1(v66);
                                *a10 = v67;
                                *a11 = v49;
                                *a12 = v68;
                                *a13 = v50;
                                *a14 = v69[0];
                                uint64_t v60 = *(void *)((char *)&v69[1] + 12);
                                *a15 = *(void *)((char *)v69 + 12);
                                *a16 = v51;
                                *a17 = v60;
                                *a18 = v52;
                                int v61 = DWORD2(v72);
                                *a19 = HIDWORD(v69[2]);
                                *a20 = *((void *)&v70 + 1);
                                *a21 = v53;
                                *a22 = *((void *)&v71 + 1);
                                *a23 = v54;
                                *a24 = v61;
                                uint64_t v62 = *(void *)((char *)&v74 + 4);
                                *a25 = *(void *)((char *)&v73 + 4);
                                *a26 = v55;
                                *a27 = v62;
                                *a28 = v56;
                                *a29 = v59;
                                *a30 = v76;
                                *a31 = v57;
                                *a32 = v77;
                                *a33 = v58;
                                *(_OWORD *)a34 = *(_OWORD *)&v81[1];
                                *(void *)(a34 + 16) = v81[3];
                                *(_OWORD *)a35 = v82;
                                *(void *)(a35 + 16) = v83;
                                *a36 = DWORD2(v83);
                                *a37 = HIDWORD(v83);
                                return v47;
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
      else
      {
        uint64_t v47 = 4294966995;
      }
LABEL_53:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v47;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v47 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_53;
  }
  return v47;
}

uint64_t VTDecompressionSessionRemoteClient_FinishDelayedFrames(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x472200000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 2097169, 0x18u, 0, 0, *MEMORY[0x1E4F1EB98], 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t VTDecompressionSessionRemoteClient_CanAcceptFormatDescription(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 16777472;
  int v16 = a3;
  uint64_t v17 = *MEMORY[0x1E4F14068];
  int v18 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v12.msgh_bits = 2147489043;
  v12.msgh_remote_port = a1;
  v12.msgh_local_port = special_reply_port;
  *(void *)&v12.msgh_voucher_port = 0x472300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v12);
    mach_port_t special_reply_port = v12.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v12, 3162387, 0x38u, 0x30u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v12.msgh_id == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (v12.msgh_id == 18311)
      {
        if ((v12.msgh_bits & 0x80000000) == 0)
        {
          if (v12.msgh_size == 40)
          {
            if (!v12.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a4 = v15;
                return v8;
              }
              goto LABEL_28;
            }
          }
          else if (v12.msgh_size == 36)
          {
            if (v12.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = HIDWORD(v14) == 0;
            }
            if (v10) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = HIDWORD(v14);
            }
            goto LABEL_28;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy(&v12);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((v12.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v12.msgh_local_port);
    }
    goto LABEL_28;
  }
  return v8;
}

uint64_t VTDecompressionSessionRemoteClient_CopyBlackPixelBuffer(int a1, _DWORD *a2, void *a3, _DWORD *a4, _DWORD *a5)
{
  memset(v22, 0, sizeof(v22));
  long long v21 = 0u;
  *(_OWORD *)&rcv_name_12[4] = 0u;
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v16 = 5395;
  *(void *)rcv_name_12 = 0x472400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v16);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v11 = mach_msg((mach_msg_header_t *)&v16, 3162387, 0x18u, 0x50u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 18312)
      {
        if ((v16 & 0x80000000) == 0)
        {
          if (rcv_name == 36)
          {
            uint64_t v12 = 4294966996;
            if (*(_DWORD *)&rcv_name_12[16])
            {
              if (rcv_name_4) {
                uint64_t v12 = 4294966996;
              }
              else {
                uint64_t v12 = *(unsigned int *)&rcv_name_12[16];
              }
            }
          }
          else
          {
            uint64_t v12 = 4294966996;
          }
          goto LABEL_31;
        }
        uint64_t v12 = 4294966996;
        if (*(_DWORD *)&rcv_name_12[8] == 2
          && rcv_name == 72
          && !rcv_name_4
          && WORD1(v21) << 16 == 1114112
          && HIBYTE(v21) == 1)
        {
          int v14 = v22[0];
          if (v22[0] == v22[3])
          {
            uint64_t v12 = 0;
            *a2 = *(_DWORD *)&rcv_name_12[12];
            *a3 = *(void *)((char *)&v21 + 4);
            *a4 = v14;
            *a5 = v22[4];
            return v12;
          }
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_31:
      mach_msg_destroy((mach_msg_header_t *)&v16);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v12 - 268435459) <= 1)
  {
    if ((v16 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_31;
  }
  return v12;
}

uint64_t VTDecompressionSessionRemoteClient_GetMinOutputPresentationTimeStampOfFramesBeingDecoded(int a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v11 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x472500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x44u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18313)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 60)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v6 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *(_OWORD *)a2 = v11;
                *(void *)(a2 + 16) = v12;
                return v6;
              }
              goto LABEL_28;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&msg[32] == 0;
            }
            if (v8) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&msg[32];
            }
            goto LABEL_28;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_28;
  }
  return v6;
}

uint64_t VTDecompressionSessionRemoteClient_GetMinAndMaxOutputPresentationTimeStampOfFramesBeingDecoded(int a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  memset(v16, 0, sizeof(v16));
  long long v15 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x472600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x60u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18314)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 88)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v10 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *(_OWORD *)a2 = v15;
                *(void *)(a2 + 16) = *(void *)v16;
                *(_OWORD *)a3 = *(_OWORD *)&v16[8];
                *(void *)(a3 + 16) = *(void *)&v16[24];
                *a4 = *(_DWORD *)&v16[32];
                return v10;
              }
              goto LABEL_28;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = *(_DWORD *)&msg[32] == 0;
            }
            if (v12) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg[32];
            }
            goto LABEL_28;
          }
        }
        uint64_t v10 = 4294966996;
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v10 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_28;
  }
  return v10;
}

uint64_t VTDecompressionSessionRemoteClient_GetNextPendingNotification(int a1, _DWORD *a2, void *a3, char *a4, void *a5, _DWORD *a6)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  memset(v22, 0, 444);
  long long v21 = 0u;
  long long v20 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x472700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v13 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x254u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!v13)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18315)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v14 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v14 = 4294966996;
              }
              else {
                uint64_t v14 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v14 = 4294966996;
          }
          goto LABEL_31;
        }
        uint64_t v14 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1
          && *(_DWORD *)&msg[4] >= 0x4Cu
          && *(_DWORD *)&msg[4] <= 0x24Cu
          && !*(_DWORD *)&msg[8]
          && BYTE3(v20) == 1
          && LODWORD(v22[0]) <= 0x200
          && (*(_DWORD *)&msg[4] - 76) >= LODWORD(v22[0]))
        {
          unsigned int v15 = (LODWORD(v22[0]) + 3) & 0xFFFFFFFC;
          if (*(_DWORD *)&msg[4] == v15 + 76)
          {
            int v16 = &msg[v15];
            if (DWORD1(v20) == *((_DWORD *)v16 + 18))
            {
              uint64_t v17 = v16 - 512;
              *a2 = v21;
              *a3 = *(void *)((char *)&v21 + 4);
              mig_strncpy(a4, (const char *)v22 + 4, 512);
              uint64_t v14 = 0;
              *a5 = *(void *)&msg[28];
              *a6 = *((_DWORD *)v17 + 146);
              return v14;
            }
          }
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
LABEL_31:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v14 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_31;
  }
  return v14;
}

uint64_t VTDecompressionSessionRemoteClient_TileCreate(mach_port_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, char *src, _DWORD *a9, void *a10, void *a11, int *a12)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  memset(v31, 0, 416);
  uint64_t v29 = 0;
  long long v30 = 0u;
  uint64_t v23 = 0x13000000000000;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v21 = 3;
  int v22 = a2;
  uint64_t v24 = a4;
  LODWORD(v25) = 16777472;
  HIDWORD(v25) = a5;
  uint64_t v26 = a6;
  int v27 = 16777472;
  unsigned int v28 = a7;
  uint64_t v29 = *MEMORY[0x1E4F14068];
  *(void *)&long long v30 = a3;
  *((void *)&v30 + 1) = __PAIR64__(a7, a5);
  if (MEMORY[0x1E4F149B0]) {
    int v13 = mig_strncpy_zerofill((char *)v31 + 8, src, 512);
  }
  else {
    int v13 = mig_strncpy((char *)v31 + 8, src, 512);
  }
  LODWORD(v31[0]) = 0;
  DWORD1(v31[0]) = v13;
  mach_msg_size_t v14 = ((v13 + 3) & 0xFFFFFFFC) + 104;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x472800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v16 = mach_msg(&rcv_name, 3162387, v14, 0x4Cu, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v17 = v16;
  if ((v16 - 268435458) > 0xE || ((1 << (v16 - 2)) & 0x4003) == 0)
  {
    if (!v16)
    {
      if (rcv_name.msgh_id == 71)
      {
        uint64_t v17 = 4294966988;
      }
      else if (rcv_name.msgh_id == 18316)
      {
        if ((rcv_name.msgh_bits & 0x80000000) == 0)
        {
          if (rcv_name.msgh_size == 36)
          {
            uint64_t v17 = 4294966996;
            if (v23)
            {
              if (rcv_name.msgh_remote_port) {
                uint64_t v17 = 4294966996;
              }
              else {
                uint64_t v17 = v23;
              }
            }
          }
          else
          {
            uint64_t v17 = 4294966996;
          }
          goto LABEL_29;
        }
        uint64_t v17 = 4294966996;
        if (v21 == 1 && rcv_name.msgh_size == 68 && !rcv_name.msgh_remote_port && HIWORD(v23) << 16 == 1114112)
        {
          uint64_t v17 = 0;
          *a9 = v22;
          uint64_t v18 = v26;
          *a10 = v25;
          *a11 = v18;
          *a12 = v27;
          return v17;
        }
      }
      else
      {
        uint64_t v17 = 4294966995;
      }
LABEL_29:
      mach_msg_destroy(&rcv_name);
      return v17;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v17 - 268435459) <= 1)
  {
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
    goto LABEL_29;
  }
  return v17;
}

uint64_t VTDecompressionSessionRemoteClient_DecodeTile(int a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, int a9, uint64_t a10, int a11, uint64_t a12)
{
  *(_OWORD *)&msg[20] = 0u;
  int v20 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_DWORD *)&msg[28] = a2;
  int v15 = 1245184;
  uint64_t v16 = a3;
  int v17 = 16777472;
  int v18 = a4;
  int v19 = a7;
  int v21 = 1245184;
  uint64_t v22 = a8;
  int v23 = 16777472;
  int v24 = a9;
  uint64_t v25 = *MEMORY[0x1E4F14068];
  int v26 = a4;
  uint64_t v27 = a5;
  uint64_t v28 = a6;
  int v29 = a9;
  uint64_t v30 = a10;
  int v31 = a11;
  uint64_t v32 = a12;
  *(_DWORD *)mach_msg_header_t msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(void *)&msg[20] = 0x400004729;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v12 = mach_msg((mach_msg_header_t *)msg, 2097169, 0x88u, 0, 0, *MEMORY[0x1E4F1EB98], 0);
  if ((v12 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v12;
}

uint64_t VTDecompressionSessionRemoteClient_FinishDelayedTiles(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x472A00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 2097169, 0x18u, 0, 0, *MEMORY[0x1E4F1EB98], 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t VTDecompressionSessionRemoteClient_EnableMIO(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x472B00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 2097169, 0x18u, 0, 0, *MEMORY[0x1E4F1EB98], 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t (*vtdecompressionsession_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 18220) >= 0xFFFFFFEC) {
    return VTDecompressionSessionRemoteServer_vtdecompressionsession_subsystem[5 * (v1 - 18200) + 5];
  }
  else {
    return 0;
  }
}

uint64_t _XCreate(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v4 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 4) {
    goto LABEL_21;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x7C || v5 > 0x27C) {
    goto LABEL_21;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112
    || *(unsigned char *)(result + 51) != 1
    || *(unsigned char *)(result + 67) != 1
    || *(unsigned char *)(result + 83) != 1)
  {
    goto LABEL_20;
  }
  unsigned int v6 = *(_DWORD *)(result + 120);
  int v3 = -304;
  if (v6 > 0x200 || (int)v5 - 124 < v6) {
    goto LABEL_21;
  }
  if (v5 != ((v6 + 3) & 0xFFFFFFFC) + 124) {
    goto LABEL_2;
  }
  if (*(_DWORD *)(result + 52) != *(_DWORD *)(result + 104)
    || *(_DWORD *)(result + 68) != *(_DWORD *)(result + 108)
    || *(_DWORD *)(result + 84) != *(_DWORD *)(result + 112))
  {
LABEL_20:
    int v3 = -300;
    goto LABEL_21;
  }
  double result = (uint64_t)memchr((void *)(result + 124), 0, v5 - 124);
  if (!result)
  {
LABEL_2:
    int v3 = -304;
LABEL_21:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_22;
  }
  uint64_t v7 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
  if (*(_DWORD *)v7 || *(_DWORD *)(v7 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_21;
  }
  *(void *)(a2 + 32) = 0x14000000000000;
  uint64_t v8 = *(unsigned int *)(v4 + 12);
  int v9 = *(_DWORD *)(v4 + 28);
  uint64_t v10 = *(void *)(v4 + 96);
  uint64_t v11 = *(void *)(v4 + 40);
  unsigned int v12 = *(_DWORD *)(v4 + 52);
  uint64_t v13 = *(void *)(v4 + 56);
  unsigned int v14 = *(_DWORD *)(v4 + 68);
  uint64_t v15 = *(void *)(v4 + 72);
  unsigned int v16 = *(_DWORD *)(v4 + 84);
  long long v17 = *(_OWORD *)(v7 + 36);
  v18[0] = *(_OWORD *)(v7 + 20);
  v18[1] = v17;
  double result = VTDecompressionSessionRemoteServer_Create(v8, v9, v18, v10, v11, v12, v13, v14, v15, v16, (const char *)(v4 + 124), (_DWORD *)(a2 + 28), (void *)(a2 + 48), (uint64_t *)(a2 + 56), (int *)(a2 + 64));
  if (!result)
  {
    *(void *)(a2 + 40) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 68;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_22:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XInvalidate(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    double result = (_DWORD *)VTDecompressionSessionRemoteServer_Invalidate(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XDestroy(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    double result = (_DWORD *)VTDecompressionSessionRemoteServer_Destroy(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XCopySupportedPropertyDictionary(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (_DWORD *)VTDecompressionSessionRemoteServer_CopySupportedPropertyDictionary(result[3], (void *)(a2 + 28), (_DWORD *)(a2 + 52), (kern_return_t *)(a2 + 56));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *_XCopySerializableProperties(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (_DWORD *)VTDecompressionSessionRemoteServer_CopySerializableProperties(result[3], (void *)(a2 + 28), (_DWORD *)(a2 + 52), (kern_return_t *)(a2 + 56));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

const char *_XCopyProperty(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (int v3 = result, v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x228
    || ((unsigned int v5 = *((_DWORD *)result + 9), v5 <= 0x200) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = v4 == v7) : (BOOL v8 = 0),
        !v8 || (double result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    *(_DWORD *)(a2 + 32) = -304;
LABEL_12:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (const char *)VTDecompressionSessionRemoteServer_CopyProperty(*((unsigned int *)v3 + 3), v3 + 40, (void *)(a2 + 28), (_DWORD *)(a2 + 52), (kern_return_t *)(a2 + 56));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
    goto LABEL_12;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _XSetProperty(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v5 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  unsigned int v6 = *(_DWORD *)(result + 4);
  if (v6 < 0x40 || v6 > 0x240) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(result + 39) != 1) {
    goto LABEL_18;
  }
  unsigned int v7 = *(_DWORD *)(result + 56);
  if (v7 > 0x200)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
LABEL_4:
    *(void *)(a2 + 24) = v4;
    return result;
  }
  int v3 = -304;
  if (v6 - 64 < v7) {
    goto LABEL_3;
  }
  unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
  if (v6 != v8 + 64) {
    goto LABEL_3;
  }
  unsigned int v9 = *(_DWORD *)(result + 40);
  if (v9 != *(_DWORD *)(result + v8 + 60))
  {
LABEL_18:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v10 = 572;
  if (*(unsigned int *)(result + 4) < 0x23CuLL) {
    uint64_t v10 = *(unsigned int *)(result + 4);
  }
  double result = (uint64_t)memchr((void *)(result + 60), 0, v10 - 60);
  if (!result) {
    goto LABEL_2;
  }
  double result = VTDecompressionSessionRemoteServer_SetProperty(*(unsigned int *)(v5 + 12), (const char *)(v5 + 60), *(void *)(v5 + 28), v9, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (result) {
    goto LABEL_4;
  }
  *(void *)(a2 + 24) = v4;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

uint64_t _XSetProperties(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }
  double result = VTDecompressionSessionRemoteServer_SetProperties(*(unsigned int *)(result + 12), *(void *)(result + 28), v3, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(void *)(a2 + 24) = v4;
  return result;
}

uint64_t _XDecodeFrame(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 3 && *(_DWORD *)(result + 4) == 104)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112
      && *(unsigned char *)(result + 51) == 1
      && *(unsigned char *)(result + 67) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 52);
      if (v3 == *(_DWORD *)(result + 80))
      {
        unsigned int v4 = *(_DWORD *)(result + 68);
        if (v4 == *(_DWORD *)(result + 88))
        {
          double result = VTDecompressionSessionRemoteServer_DecodeFrame(*(unsigned int *)(result + 12), *(_DWORD *)(result + 28), *(void *)(result + 40), v3, *(_DWORD *)(result + 84), *(void *)(result + 56), v4, *(void *)(result + 92), *(_DWORD *)(result + 100));
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }
    int v5 = -300;
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XDequeueNextPendingFrame(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(void *)(a2 + 32) = 0x11000000000000;
  *(_DWORD *)(a2 + 48) = 16777473;
  *(void *)(a2 + 60) = 0x11000000000000;
  *(_DWORD *)(a2 + 76) = 16777473;
  *(_DWORD *)(a2 + 92) = 16777473;
  *(void *)(a2 + 104) = 0x11000000000000;
  *(_DWORD *)(a2 + 120) = 16777473;
  *(_DWORD *)(a2 + 136) = 16777473;
  *(void *)(a2 + 148) = 0x11000000000000;
  *(_DWORD *)(a2 + 164) = 16777473;
  *(_DWORD *)(a2 + 180) = 16777473;
  *(_DWORD *)(a2 + 208) = 16777473;
  *(_DWORD *)(a2 + 224) = 16777473;
  *(_DWORD *)(a2 + 252) = 16777473;
  *(_DWORD *)(a2 + 268) = 16777473;
  *(void *)(a2 + 192) = 0x11000000000000;
  *(void *)(a2 + 236) = 0x11000000000000;
  *((void *)&v14 + 1) = a2 + 260;
  *((void *)&v13 + 1) = a2 + 244;
  *(void *)&long long v14 = a2 + 340;
  *((void *)&v12 + 1) = a2 + 336;
  *(void *)&long long v13 = a2 + 232;
  *((void *)&v11 + 1) = a2 + 332;
  *(void *)&long long v12 = a2 + 216;
  *((void *)&v10 + 1) = a2 + 188;
  *(void *)&long long v11 = a2 + 200;
  *((void *)&v9 + 1) = a2 + 172;
  *(void *)&long long v10 = a2 + 328;
  *((void *)&v8 + 1) = a2 + 156;
  *(void *)&long long v9 = a2 + 324;
  *((void *)&v7 + 1) = a2 + 320;
  *(void *)&long long v8 = a2 + 144;
  *((void *)&v6 + 1) = a2 + 316;
  *(void *)&long long v7 = a2 + 128;
  *(void *)&long long v6 = a2 + 112;
  *(void *)&long long v5 = a2 + 312;
  *((void *)&v5 + 1) = a2 + 100;
  *(void *)&long long v4 = a2 + 308;
  *((void *)&v4 + 1) = a2 + 84;
  *((void *)&v3 + 1) = a2 + 68;
  *(void *)&long long v3 = a2 + 56;
  double result = (_DWORD *)VTDecompressionSessionRemoteServer_DequeueNextPendingFrame(result[3], (_DWORD *)(a2 + 284), (void *)(a2 + 288), (_DWORD *)(a2 + 296), (_DWORD *)(a2 + 300), (_DWORD *)(a2 + 28), (void *)(a2 + 40), (_DWORD *)(a2 + 304), v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13,
                       v14,
                       a2 + 344,
                       (void *)(a2 + 348),
                       (void *)(a2 + 372),
                       (_DWORD *)(a2 + 396),
                       (_DWORD *)(a2 + 400));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 52) = *(_DWORD *)(a2 + 304);
  *(_DWORD *)(a2 + 80) = *(_DWORD *)(a2 + 308);
  *(_DWORD *)(a2 + 96) = *(_DWORD *)(a2 + 312);
  *(_DWORD *)(a2 + 124) = *(_DWORD *)(a2 + 316);
  *(_DWORD *)(a2 + 140) = *(_DWORD *)(a2 + 320);
  *(_DWORD *)(a2 + 168) = *(_DWORD *)(a2 + 324);
  *(_DWORD *)(a2 + 184) = *(_DWORD *)(a2 + 328);
  *(_DWORD *)(a2 + 212) = *(_DWORD *)(a2 + 332);
  *(_DWORD *)(a2 + 228) = *(_DWORD *)(a2 + 336);
  *(_DWORD *)(a2 + 256) = *(_DWORD *)(a2 + 340);
  *(_DWORD *)(a2 + 272) = *(_DWORD *)(a2 + 344);
  *(void *)(a2 + 276) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 404;
  *(_DWORD *)(a2 + 24) = 17;
  return result;
}

_DWORD *_XFinishDelayedFrames(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = (_DWORD *)VTDecompressionSessionRemoteServer_FinishDelayedFrames(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t _XCanAcceptFormatDescription(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }
  double result = VTDecompressionSessionRemoteServer_CanAcceptFormatDescription(*(unsigned int *)(result + 12), *(void *)(result + 28), v3, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(void *)(a2 + 24) = v4;
  return result;
}

_DWORD *_XCopyBlackPixelBuffer(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(void *)(a2 + 32) = 0x11000000000000;
  *(_DWORD *)(a2 + 48) = 16777473;
  double result = (_DWORD *)VTDecompressionSessionRemoteServer_CopyBlackPixelBuffer(result[3], (_DWORD *)(a2 + 28), (void *)(a2 + 40), (_DWORD *)(a2 + 64), (_DWORD *)(a2 + 68));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 52) = *(_DWORD *)(a2 + 64);
  *(void *)(a2 + 56) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 72;
  *(_DWORD *)(a2 + 24) = 2;
  return result;
}

_DWORD *_XGetMinOutputPresentationTimeStampOfFramesBeingDecoded(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v3 = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = (_DWORD *)VTDecompressionSessionRemoteServer_GetMinOutputPresentationTimeStampOfFramesBeingDecoded(result[3], (void *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = result;
    uint64_t v3 = *MEMORY[0x1E4F14068];
    if (!result)
    {
      *(void *)(a2 + 24) = v3;
      *(_DWORD *)(a2 + 4) = 60;
      return result;
    }
  }
  *(void *)(a2 + 24) = v3;
  return result;
}

_DWORD *_XGetMinAndMaxOutputPresentationTimeStampOfFramesBeingDecoded(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v3 = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = (_DWORD *)VTDecompressionSessionRemoteServer_GetMinAndMaxOutputPresentationTimeStampOfFramesBeingDecoded(result[3], (void *)(a2 + 36), (void *)(a2 + 60), (_DWORD *)(a2 + 84));
    *(_DWORD *)(a2 + 32) = result;
    uint64_t v3 = *MEMORY[0x1E4F14068];
    if (!result)
    {
      *(void *)(a2 + 24) = v3;
      *(_DWORD *)(a2 + 4) = 88;
      return result;
    }
  }
  *(void *)(a2 + 24) = v3;
  return result;
}

_DWORD *_XGetNextPendingNotification(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  unsigned int v6 = 0;
  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (_DWORD *)VTDecompressionSessionRemoteServer_GetNextPendingNotification(result[3], (_DWORD *)(a2 + 52), (void *)(a2 + 56), (char *)(a2 + 72), (vm_address_t *)(a2 + 28), &v6);
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  unsigned int v3 = v6;
  *(_DWORD *)(a2 + 40) = v6;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
  double result = (_DWORD *)strlen((const char *)(a2 + 72));
  if (((unint64_t)result + 1) >> 32)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = v4;
  }
  else
  {
    *(_DWORD *)(a2 + 64) = 0;
    *(_DWORD *)(a2 + 68) = result + 1;
    uint64_t v5 = (result + 4) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + v5 + 72) = v3;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = v5 + 76;
    *(_DWORD *)(a2 + 24) = 1;
  }
  return result;
}

uint64_t _XTileCreate(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v4 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 3) {
    goto LABEL_19;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x68 || v5 > 0x268) {
    goto LABEL_19;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112
    || *(unsigned char *)(result + 51) != 1
    || *(unsigned char *)(result + 67) != 1)
  {
    goto LABEL_18;
  }
  unsigned int v6 = *(_DWORD *)(result + 100);
  int v3 = -304;
  if (v6 > 0x200 || (int)v5 - 104 < v6) {
    goto LABEL_19;
  }
  if (v5 != ((v6 + 3) & 0xFFFFFFFC) + 104) {
    goto LABEL_2;
  }
  if (*(_DWORD *)(result + 52) != *(_DWORD *)(result + 88) || *(_DWORD *)(result + 68) != *(_DWORD *)(result + 92))
  {
LABEL_18:
    int v3 = -300;
    goto LABEL_19;
  }
  double result = (uint64_t)memchr((void *)(result + 104), 0, v5 - 104);
  if (!result)
  {
LABEL_2:
    int v3 = -304;
LABEL_19:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_20;
  }
  uint64_t v7 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
  if (*(_DWORD *)v7 || *(_DWORD *)(v7 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_19;
  }
  *(void *)(a2 + 32) = 0x14000000000000;
  uint64_t v8 = *(unsigned int *)(v4 + 12);
  int v9 = *(_DWORD *)(v4 + 28);
  uint64_t v10 = *(void *)(v4 + 80);
  uint64_t v11 = *(void *)(v4 + 40);
  unsigned int v12 = *(_DWORD *)(v4 + 52);
  uint64_t v13 = *(void *)(v4 + 56);
  unsigned int v14 = *(_DWORD *)(v4 + 68);
  long long v15 = *(_OWORD *)(v7 + 36);
  v16[0] = *(_OWORD *)(v7 + 20);
  v16[1] = v15;
  double result = VTDecompressionSessionRemoteServer_TileCreate(v8, v9, v16, v10, v11, v12, v13, v14, (const char *)(v4 + 104), (_DWORD *)(a2 + 28), (void *)(a2 + 48), (uint64_t *)(a2 + 56), (int *)(a2 + 64));
  if (!result)
  {
    *(void *)(a2 + 40) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 68;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_20:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XDecodeTile(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 4 && *(_DWORD *)(result + 4) == 136)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112
      && *(unsigned char *)(result + 51) == 1
      && *(unsigned __int16 *)(result + 66) << 16 == 1114112
      && *(unsigned char *)(result + 79) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 52);
      if (v3 == *(_DWORD *)(result + 92))
      {
        unsigned int v4 = *(_DWORD *)(result + 80);
        if (v4 == *(_DWORD *)(result + 112))
        {
          double result = VTDecompressionSessionRemoteServer_DecodeTile(*(unsigned int *)(result + 12), *(_DWORD *)(result + 28), *(void *)(result + 40), v3, *(void *)(result + 96), *(void *)(result + 104), *(_DWORD *)(result + 56), *(void *)(result + 68), v4, *(void *)(result + 116), *(_DWORD *)(result + 124), *(void *)(result + 128));
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }
    int v5 = -300;
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XFinishDelayedTiles(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = (_DWORD *)VTDecompressionSessionRemoteServer_FinishDelayedTiles(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

_DWORD *_XEnableMIO(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = (_DWORD *)VTDecompressionSessionRemoteServer_EnableMIO(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t VTCompressionSessionRemoteClient_Create(mach_port_t a1, int a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned int a10, uint64_t a11, unsigned int a12, char *src, _DWORD *a14, void *a15, uint64_t *a16, int *a17)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  memset(v40, 0, 384);
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v37 = 0;
  uint64_t v28 = 0x13000000000000;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v26 = 4;
  int v27 = a2;
  uint64_t v29 = a7;
  LODWORD(v30) = 16777472;
  HIDWORD(v30) = a8;
  uint64_t v31 = a9;
  int v32 = 16777472;
  unsigned int v33 = a10;
  uint64_t v34 = a11;
  int v35 = 16777472;
  unsigned int v36 = a12;
  uint64_t v37 = *MEMORY[0x1E4F14068];
  *(void *)&long long v38 = a3;
  *((void *)&v38 + 1) = __PAIR64__(a5, a4);
  *(void *)&long long v39 = __PAIR64__(a8, a6);
  *((void *)&v39 + 1) = __PAIR64__(a12, a10);
  if (MEMORY[0x1E4F149B0]) {
    int v18 = mig_strncpy_zerofill((char *)v40 + 8, src, 512);
  }
  else {
    int v18 = mig_strncpy((char *)v40 + 8, src, 512);
  }
  LODWORD(v40[0]) = 0;
  DWORD1(v40[0]) = v18;
  mach_msg_size_t v19 = ((v18 + 3) & 0xFFFFFFFC) + 136;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x477C00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v21 = mach_msg(&rcv_name, 3162387, v19, 0x4Cu, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v22 = v21;
  if ((v21 - 268435458) > 0xE || ((1 << (v21 - 2)) & 0x4003) == 0)
  {
    if (!v21)
    {
      if (rcv_name.msgh_id == 71)
      {
        uint64_t v22 = 4294966988;
      }
      else if (rcv_name.msgh_id == 18400)
      {
        if ((rcv_name.msgh_bits & 0x80000000) == 0)
        {
          if (rcv_name.msgh_size == 36)
          {
            uint64_t v22 = 4294966996;
            if (v28)
            {
              if (rcv_name.msgh_remote_port) {
                uint64_t v22 = 4294966996;
              }
              else {
                uint64_t v22 = v28;
              }
            }
          }
          else
          {
            uint64_t v22 = 4294966996;
          }
          goto LABEL_29;
        }
        uint64_t v22 = 4294966996;
        if (v26 == 1 && rcv_name.msgh_size == 68 && !rcv_name.msgh_remote_port && HIWORD(v28) << 16 == 1114112)
        {
          uint64_t v22 = 0;
          *a14 = v27;
          uint64_t v23 = v31;
          *a15 = v30;
          *a16 = v23;
          *a17 = v32;
          return v22;
        }
      }
      else
      {
        uint64_t v22 = 4294966995;
      }
LABEL_29:
      mach_msg_destroy(&rcv_name);
      return v22;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v22 - 268435459) <= 1)
  {
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
    goto LABEL_29;
  }
  return v22;
}

uint64_t VTCompressionSessionRemoteClient_Destroy(int a1)
{
  uint64_t v8 = 0;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x477D00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x2Cu, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (!v3)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v4 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18401)
      {
        uint64_t v4 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          uint64_t v4 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32]) {
            return v4;
          }
        }
      }
      else
      {
        uint64_t v4 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v4;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v4 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_22;
  }
  return v4;
}

uint64_t VTCompressionSessionRemoteClient_CopySupportedPropertyDictionary(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v15 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x477E00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x44u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18402)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v10 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v10 = 4294966996;
              }
              else {
                uint64_t v10 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v10 = 4294966996;
          }
          goto LABEL_30;
        }
        uint64_t v10 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v15) == 1)
        {
          int v12 = DWORD1(v15);
          if (DWORD1(v15) == v16)
          {
            uint64_t v10 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v12;
            *a4 = DWORD1(v16);
            return v10;
          }
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v10 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_30;
  }
  return v10;
}

uint64_t VTCompressionSessionRemoteClient_CopySerializableProperties(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v15 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x477F00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x44u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18403)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v10 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v10 = 4294966996;
              }
              else {
                uint64_t v10 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v10 = 4294966996;
          }
          goto LABEL_30;
        }
        uint64_t v10 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v15) == 1)
        {
          int v12 = DWORD1(v15);
          if (DWORD1(v15) == v16)
          {
            uint64_t v10 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v12;
            *a4 = DWORD1(v16);
            return v10;
          }
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v10 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_30;
  }
  return v10;
}

uint64_t VTCompressionSessionRemoteClient_CopyProperty(mach_port_name_t a1, const char *a2, void *a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  *(_OWORD *)mach_msg_header_t rcv_name = 0u;
  memset(v17, 0, sizeof(v17));
  *((void *)&v17[0] + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v9 = mig_strncpy_zerofill((char *)&v17[1] + 8, a2, 512);
  }
  else {
    int v9 = mig_strncpy((char *)&v17[1] + 8, a2, 512);
  }
  LODWORD(v17[1]) = 0;
  DWORD1(v17[1]) = v9;
  mach_msg_size_t v10 = ((v9 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&v17[0] = 0x478000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v12 = mach_msg((mach_msg_header_t *)rcv_name, 3162387, v10, 0x44u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!v12)
    {
      if (DWORD1(v17[0]) == 71)
      {
        uint64_t v13 = 4294966988;
      }
      else if (DWORD1(v17[0]) == 18404)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            uint64_t v13 = 4294966996;
            if (LODWORD(v17[1]))
            {
              if (rcv_name[2]) {
                uint64_t v13 = 4294966996;
              }
              else {
                uint64_t v13 = LODWORD(v17[1]);
              }
            }
          }
          else
          {
            uint64_t v13 = 4294966996;
          }
          goto LABEL_30;
        }
        uint64_t v13 = 4294966996;
        if (DWORD2(v17[0]) == 1 && rcv_name[1] == 60 && !rcv_name[2] && BYTE7(v17[1]) == 1)
        {
          int v14 = DWORD2(v17[1]);
          if (DWORD2(v17[1]) == DWORD1(v18))
          {
            uint64_t v13 = 0;
            *a3 = *(void *)((char *)v17 + 12);
            *a4 = v14;
            *a5 = DWORD2(v18);
            return v13;
          }
        }
      }
      else
      {
        uint64_t v13 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_30;
  }
  return v13;
}

uint64_t VTCompressionSessionRemoteClient_SetProperty(mach_port_t a1, const char *a2, uint64_t a3, unsigned int a4, int *a5)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  *(_OWORD *)&v20[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v17 = 1;
  uint64_t v18 = a3;
  int v19 = 16777472;
  *(void *)long long v20 = a4;
  *(void *)&v20[4] = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v8 = mig_strncpy_zerofill(&v20[20], a2, 512);
  }
  else {
    int v8 = mig_strncpy(&v20[20], a2, 512);
  }
  *(_DWORD *)&v20[12] = 0;
  *(_DWORD *)&v20[16] = v8;
  uint64_t v9 = (v8 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v10 = v9 + 64;
  *(_DWORD *)&v20[v9 + 20] = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x478100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v12 = mach_msg(&rcv_name, 3162387, v10, 0x30u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!v12)
    {
      if (rcv_name.msgh_id == 71)
      {
        uint64_t v13 = 4294966988;
      }
      else if (rcv_name.msgh_id == 18405)
      {
        if ((rcv_name.msgh_bits & 0x80000000) == 0)
        {
          if (rcv_name.msgh_size == 40)
          {
            if (!rcv_name.msgh_remote_port)
            {
              uint64_t v13 = HIDWORD(v18);
              if (!HIDWORD(v18))
              {
                *a5 = v19;
                return v13;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name.msgh_size == 36)
          {
            if (rcv_name.msgh_remote_port) {
              BOOL v14 = 1;
            }
            else {
              BOOL v14 = HIDWORD(v18) == 0;
            }
            if (v14) {
              uint64_t v13 = 4294966996;
            }
            else {
              uint64_t v13 = HIDWORD(v18);
            }
            goto LABEL_28;
          }
        }
        uint64_t v13 = 4294966996;
      }
      else
      {
        uint64_t v13 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy(&rcv_name);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
    goto LABEL_28;
  }
  return v13;
}

uint64_t VTCompressionSessionRemoteClient_SetMultiPassStorage(mach_port_t a1, int a2, _DWORD *a3)
{
  int v12 = 1;
  long long v14 = 0u;
  v11.msgh_size = 0;
  int v13 = a2;
  DWORD1(v14) = 1245184;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  v11.msgh_bits = -2147478253;
  *(void *)&v11.msgh_voucher_port = 0x478200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }
  uint64_t v6 = mach_msg(&v11, 3162387, 0x28u, 0x30u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (v11.msgh_id == 18406)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v7 = v14;
              if (!v14)
              {
                *a3 = DWORD1(v14);
                return v7;
              }
              goto LABEL_28;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = v14 == 0;
            }
            if (v9) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = v14;
            }
            goto LABEL_28;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy(&v11);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v7 - 268435459) <= 1)
  {
    if ((v11.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v11.msgh_local_port);
    }
    goto LABEL_28;
  }
  return v7;
}

uint64_t VTCompressionSessionRemoteClient_SetProperties(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 16777472;
  int v16 = a3;
  uint64_t v17 = *MEMORY[0x1E4F14068];
  int v18 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v12.msgh_bits = 2147489043;
  v12.msgh_remote_port = a1;
  v12.msgh_local_port = special_reply_port;
  *(void *)&v12.msgh_voucher_port = 0x478300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v12);
    mach_port_t special_reply_port = v12.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v12, 3162387, 0x38u, 0x30u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v12.msgh_id == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (v12.msgh_id == 18407)
      {
        if ((v12.msgh_bits & 0x80000000) == 0)
        {
          if (v12.msgh_size == 40)
          {
            if (!v12.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a4 = v15;
                return v8;
              }
              goto LABEL_28;
            }
          }
          else if (v12.msgh_size == 36)
          {
            if (v12.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = HIDWORD(v14) == 0;
            }
            if (v10) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = HIDWORD(v14);
            }
            goto LABEL_28;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy(&v12);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((v12.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v12.msgh_local_port);
    }
    goto LABEL_28;
  }
  return v8;
}

uint64_t VTCompressionSessionRemoteClient_PrepareToEncodeFrames(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x478400000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 2097169, 0x18u, 0, 0, *MEMORY[0x1E4F1EB98], 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t VTCompressionSessionRemoteClient_EncodeFrame(mach_port_name_t a1, int a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned int a11, unint64_t a12, uint64_t a13, uint64_t a14, unsigned int a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned int a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned int a23,uint64_t a24,unsigned int a25,uint64_t a26,long long *a27,uint64_t a28,int a29,uint64_t a30)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)&v56[16] = 0;
  long long v30 = *a27;
  long long v55 = 0u;
  *(_OWORD *)int v56 = 0u;
  memset(v54, 0, sizeof(v54));
  *(_OWORD *)((char *)v54 + 8) = *(_OWORD *)a26;
  long long v34 = 0u;
  HIDWORD(v34) = a2;
  uint64_t v35 = 0;
  long long v37 = 0u;
  uint64_t v36 = a3;
  long long v38 = 0u;
  long long v39 = 0u;
  *(void *)((char *)&v38 + 4) = a6;
  *(void *)((char *)&v39 + 4) = a8;
  long long v40 = 0u;
  long long v41 = 0u;
  *(void *)&long long v41 = a10;
  memset(&v42[16], 0, 48);
  *(_OWORD *)long long v42 = a12;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v45 = 0;
  long long v47 = 0u;
  uint64_t v43 = 0;
  *(void *)&v42[28] = a14;
  *(void *)&v42[44] = a16;
  uint64_t v44 = a18;
  uint64_t v46 = a20;
  *(void *)((char *)&v48 + 4) = a22;
  *(void *)((char *)&v49 + 4) = a24;
  *(void *)((char *)&v50 + 4) = a28;
  *(void *)((char *)&v51 + 4) = *MEMORY[0x1E4F14068];
  *(void *)&v56[12] = a30;
  HIDWORD(v35) = 1245184;
  LODWORD(v37) = 16777472;
  LODWORD(v38) = 1245184;
  HIDWORD(v38) = 16777472;
  HIDWORD(v39) = 16777472;
  HIDWORD(v40) = 1245184;
  DWORD2(v41) = 16777472;
  *(_DWORD *)&v42[8] = 16777472;
  *(_DWORD *)&v42[24] = 1245184;
  *(_DWORD *)&v42[36] = 16777472;
  *(_DWORD *)&v42[52] = 16777472;
  HIDWORD(v43) = 1245184;
  LODWORD(v45) = 16777472;
  LODWORD(v47) = 16777472;
  LODWORD(v48) = 1245184;
  HIDWORD(v48) = 16777472;
  HIDWORD(v49) = 16777472;
  HIDWORD(v50) = 16777472;
  *(void *)((char *)&v37 + 4) = __PAIR64__(a5, a4);
  HIDWORD(v51) = a4;
  LODWORD(v39) = a7;
  *(void *)&long long v52 = __PAIR64__(a9, a7);
  *(void *)&long long v40 = a9;
  HIDWORD(v41) = a11;
  *((void *)&v52 + 1) = __PAIR64__(a13, a11);
  *(void *)&v42[12] = a13;
  *(_DWORD *)&v42[40] = a15;
  *(void *)&long long v53 = __PAIR64__(a17, a15);
  *(void *)&v42[56] = a17;
  HIDWORD(v45) = a19;
  *((void *)&v53 + 1) = __PAIR64__(a21, a19);
  *(void *)((char *)&v47 + 4) = a21;
  LODWORD(v49) = a23;
  *(void *)&v54[0] = __PAIR64__(a25, a23);
  LODWORD(v50) = a25;
  *((void *)&v54[1] + 1) = *(void *)(a26 + 16);
  *(_OWORD *)name = 0u;
  *(void *)int v56 = *((void *)a27 + 2);
  LODWORD(v51) = a29;
  *(_DWORD *)&v56[8] = a29;
  name[0] = -2147483629;
  long long v55 = v30;
  name[2] = a1;
  *(void *)((char *)&v34 + 4) = 0x1200004785;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v31 = mach_msg((mach_msg_header_t *)name, 2097169, 0x194u, 0, 0, *MEMORY[0x1E4F1EB98], 0);
  if ((v31 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v31;
}

uint64_t VTCompressionSessionRemoteClient_DequeueNextPendingEncodedFrame(int a1, _DWORD *a2, void *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, void *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, void *a11, _DWORD *a12, _DWORD *a13)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  memset(v36, 0, sizeof(v36));
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x478600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v22 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x80u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v23 = v22;
  if ((v22 - 268435458) > 0xE || ((1 << (v22 - 2)) & 0x4003) == 0)
  {
    if (!v22)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v23 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18410)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v23 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v23 = 4294966996;
              }
              else {
                uint64_t v23 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v23 = 4294966996;
          }
          goto LABEL_33;
        }
        uint64_t v23 = 4294966996;
        if (*(_DWORD *)&msg[24] == 3
          && *(_DWORD *)&msg[4] == 120
          && !*(_DWORD *)&msg[8]
          && WORD1(v32) << 16 == 1114112
          && HIBYTE(v32) == 1
          && HIBYTE(v33) == 1)
        {
          int v25 = v33;
          if (v33 == v36[0])
          {
            int v26 = v34;
            if (v34 == v36[3])
            {
              uint64_t v23 = 0;
              *a2 = HIDWORD(v34);
              *a3 = v35;
              int v27 = HIDWORD(v35);
              *a4 = DWORD2(v35);
              *a5 = v27;
              *a6 = *(_DWORD *)&msg[28];
              uint64_t v28 = *(void *)((char *)&v33 + 4);
              *a7 = *(void *)((char *)&v32 + 4);
              *a8 = v25;
              int v29 = v36[2];
              *a9 = v36[1];
              *a10 = v29;
              *a11 = v28;
              *a12 = v26;
              *a13 = v36[4];
              return v23;
            }
          }
        }
      }
      else
      {
        uint64_t v23 = 4294966995;
      }
LABEL_33:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v23;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v23 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_33;
  }
  return v23;
}

uint64_t VTCompressionSessionRemoteClient_CompleteFrames(mach_port_t a1, long long *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F14068];
  long long v6 = *a2;
  uint64_t v7 = *((void *)a2 + 2);
  *(void *)&v4.msgh_bits = 19;
  v4.msgh_voucher_port = 0;
  v4.msgh_id = 18311;
  v4.msgh_remote_port = a1;
  v4.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&v4);
  }
  uint64_t v2 = mach_msg(&v4, 2097169, 0x38u, 0, 0, *MEMORY[0x1E4F1EB98], 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((v4.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v4.msgh_local_port);
    }
    mach_msg_destroy(&v4);
  }
  return v2;
}

uint64_t VTCompressionSessionRemoteClient_BeginPass(int a1, int a2, _DWORD *a3, _DWORD *a4)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v15 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x478800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x24u, 0x34u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18412)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v9 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                int v13 = DWORD1(v15);
                *a3 = v15;
                *a4 = v13;
                return v9;
              }
              goto LABEL_28;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = *(_DWORD *)&msg[32] == 0;
            }
            if (v11) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = *(unsigned int *)&msg[32];
            }
            goto LABEL_28;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_28;
  }
  return v9;
}

uint64_t VTCompressionSessionRemoteClient_EndPass(int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  int v17 = 0;
  long long v16 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x478900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x38u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18413)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 48)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v10 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                int v14 = DWORD1(v16);
                *a2 = v16;
                *a3 = v14;
                *a4 = DWORD2(v16);
                return v10;
              }
              goto LABEL_28;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = *(_DWORD *)&msg[32] == 0;
            }
            if (v12) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg[32];
            }
            goto LABEL_28;
          }
        }
        uint64_t v10 = 4294966996;
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v10 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_28;
  }
  return v10;
}

uint64_t VTCompressionSessionRemoteClient_GetTimeRangesForNextPass(int a1, void *a2, void *a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  *(_DWORD *)&msg[4] = 0;
  *(_OWORD *)&msg[20] = 0u;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x478A00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v11 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x4Cu, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18414)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v12 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v12 = 4294966996;
              }
              else {
                uint64_t v12 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v12 = 4294966996;
          }
          goto LABEL_30;
        }
        uint64_t v12 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 68 && !*(_DWORD *)&msg[8] && BYTE3(v17) == 1)
        {
          int v14 = DWORD1(v17);
          if (DWORD1(v17) == DWORD2(v18))
          {
            uint64_t v12 = 0;
            *a2 = v18;
            *a3 = *(void *)&msg[28];
            *a4 = v14;
            *a5 = HIDWORD(v18);
            return v12;
          }
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v12 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_30;
  }
  return v12;
}

uint64_t VTCompressionSessionRemoteClient_MultiPassStorageCreate(mach_port_name_t a1, int a2, uint64_t a3, uint64_t a4, int a5, _OWORD *a6, uint64_t a7, int a8, char *src, _DWORD *a10, void *a11, void *a12, _DWORD *a13)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  memset(&v27[1], 0, 416);
  long long v26 = 0u;
  v27[0] = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  *(_OWORD *)mach_msg_header_t rcv_name = 0u;
  long long v23 = 0u;
  long long v14 = a6[1];
  *(_OWORD *)((char *)v27 + 12) = *a6;
  DWORD2(v23) = 3;
  HIDWORD(v23) = a2;
  DWORD1(v24) = 1245184;
  *((void *)&v24 + 1) = a4;
  LODWORD(v25) = 16777472;
  DWORD1(v25) = a5;
  *((void *)&v25 + 1) = a7;
  LODWORD(v26) = 16777472;
  DWORD1(v26) = a8;
  *((void *)&v26 + 1) = *MEMORY[0x1E4F14068];
  *(void *)&v27[0] = a3;
  DWORD2(v27[0]) = a5;
  *(_OWORD *)((char *)&v27[1] + 12) = v14;
  *(_OWORD *)((char *)&v27[2] + 12) = a6[2];
  HIDWORD(v27[3]) = a8;
  if (MEMORY[0x1E4F149B0]) {
    int v15 = mig_strncpy_zerofill((char *)&v27[4] + 8, src, 512);
  }
  else {
    int v15 = mig_strncpy((char *)&v27[4] + 8, src, 512);
  }
  LODWORD(v27[4]) = 0;
  DWORD1(v27[4]) = v15;
  mach_msg_size_t v16 = ((v15 + 3) & 0xFFFFFFFC) + 152;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = -2147478253;
  *(void *)&long long v23 = 0x478B00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v18 = mach_msg((mach_msg_header_t *)rcv_name, 3162387, v16, 0x4Cu, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v19 = v18;
  if ((v18 - 268435458) > 0xE || ((1 << (v18 - 2)) & 0x4003) == 0)
  {
    if (!v18)
    {
      if (DWORD1(v23) == 71)
      {
        uint64_t v19 = 4294966988;
      }
      else if (DWORD1(v23) == 18415)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            uint64_t v19 = 4294966996;
            if (v24)
            {
              if (rcv_name[2]) {
                uint64_t v19 = 4294966996;
              }
              else {
                uint64_t v19 = v24;
              }
            }
          }
          else
          {
            uint64_t v19 = 4294966996;
          }
          goto LABEL_29;
        }
        uint64_t v19 = 4294966996;
        if (DWORD2(v23) == 1 && rcv_name[1] == 68 && !rcv_name[2] && WORD3(v24) << 16 == 1114112)
        {
          uint64_t v19 = 0;
          *a10 = HIDWORD(v23);
          uint64_t v20 = *((void *)&v25 + 1);
          *a11 = v25;
          *a12 = v20;
          *a13 = v26;
          return v19;
        }
      }
      else
      {
        uint64_t v19 = 4294966995;
      }
LABEL_29:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v19;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v19 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_29;
  }
  return v19;
}

uint64_t VTCompressionSessionRemoteClient_MultiPassStorageDestroy(int a1)
{
  uint64_t v8 = 0;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x478C00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x2Cu, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (!v3)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v4 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18416)
      {
        uint64_t v4 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          uint64_t v4 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32]) {
            return v4;
          }
        }
      }
      else
      {
        uint64_t v4 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v4;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v4 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_22;
  }
  return v4;
}

uint64_t VTCompressionSessionRemoteClient_MultiPassStorageSetIdentifier(mach_port_name_t a1, const char *a2, _DWORD *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(v14, 0, 480);
  *(_OWORD *)mach_msg_header_t rcv_name = 0u;
  long long v13 = 0u;
  *((void *)&v13 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v14 + 8, a2, 512);
  }
  else {
    int v5 = mig_strncpy((char *)v14 + 8, a2, 512);
  }
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v13 = 0x478D00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162387, v6, 0x30u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (DWORD1(v13) == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (DWORD1(v13) == 18417)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              uint64_t v9 = LODWORD(v14[0]);
              if (!LODWORD(v14[0]))
              {
                *a3 = DWORD1(v14[0]);
                return v9;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = LODWORD(v14[0]) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = LODWORD(v14[0]);
            }
            goto LABEL_28;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_28;
  }
  return v9;
}

uint64_t VTCompressionSessionRemoteClient_MultiPassStorageCopyIdentifier(mach_port_t a1, char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  memset(&msg[20].msgh_size, 0, 28);
  memset(&msg[1].msgh_local_port, 0, 448);
  *(_OWORD *)&msg[0].msgh_id = 0u;
  msg[0].msgh_size = 0;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg[0].uint64_t msgh_remote_port = a1;
  msg[0].msgh_local_port = special_reply_port;
  msg[0].msgh_bits = 5395;
  *(void *)&msg[0].msgh_voucher_port = 0x478E00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(msg);
    mach_port_t special_reply_port = msg[0].msgh_local_port;
  }
  uint64_t v5 = mach_msg(msg, 3162387, 0x18u, 0x234u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t msgh_remote_port = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (msg[0].msgh_id == 71)
      {
        uint64_t msgh_remote_port = 4294966988;
      }
      else if (msg[0].msgh_id == 18418)
      {
        if ((msg[0].msgh_bits & 0x80000000) == 0)
        {
          if (msg[0].msgh_size - 557 <= 0xFFFFFDFE)
          {
            if (msg[0].msgh_remote_port) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = msg[1].msgh_remote_port == 0;
            }
            if (!v7 && msg[0].msgh_size == 36) {
              uint64_t msgh_remote_port = msg[1].msgh_remote_port;
            }
            else {
              uint64_t msgh_remote_port = 4294966996;
            }
            goto LABEL_27;
          }
          if (!msg[0].msgh_remote_port)
          {
            uint64_t msgh_remote_port = msg[1].msgh_remote_port;
            if (!msg[1].msgh_remote_port)
            {
              uint64_t msgh_remote_port = 4294966996;
              if (msg[1].msgh_voucher_port <= 0x200
                && msg[0].msgh_size - 44 >= msg[1].msgh_voucher_port
                && msg[0].msgh_size == ((msg[1].msgh_voucher_port + 3) & 0xFFFFFFFC) + 44)
              {
                mig_strncpy(a2, (const char *)&msg[1].msgh_id, 512);
                return 0;
              }
            }
            goto LABEL_27;
          }
        }
        uint64_t msgh_remote_port = 4294966996;
      }
      else
      {
        uint64_t msgh_remote_port = 4294966995;
      }
LABEL_27:
      mach_msg_destroy(msg);
      return msgh_remote_port;
    }
    mig_dealloc_special_reply_port();
  }
  if ((msgh_remote_port - 268435459) <= 1)
  {
    if ((msg[0].msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg[0].msgh_local_port);
    }
    goto LABEL_27;
  }
  return msgh_remote_port;
}

uint64_t VTCompressionSessionRemoteClient_MultiPassStorageSetDataAtTimeStamp(mach_port_t a1, long long *a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v15 = 1;
  uint64_t v16 = a4;
  int v17 = 16777472;
  int v18 = a5;
  uint64_t v19 = *MEMORY[0x1E4F14068];
  long long v20 = *a2;
  uint64_t v21 = *((void *)a2 + 2);
  int v22 = a3;
  int v23 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v14.msgh_bits = 2147489043;
  v14.uint64_t msgh_remote_port = a1;
  v14.msgh_local_port = special_reply_port;
  *(void *)&v14.msgh_voucher_port = 0x478F00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v14);
    mach_port_t special_reply_port = v14.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&v14, 3162387, 0x54u, 0x30u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (v14.msgh_id == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (v14.msgh_id == 18419)
      {
        if ((v14.msgh_bits & 0x80000000) == 0)
        {
          if (v14.msgh_size == 40)
          {
            if (!v14.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a6 = v17;
                return v10;
              }
              goto LABEL_28;
            }
          }
          else if (v14.msgh_size == 36)
          {
            if (v14.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = HIDWORD(v16);
            }
            goto LABEL_28;
          }
        }
        uint64_t v10 = 4294966996;
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy(&v14);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v10 - 268435459) <= 1)
  {
    if ((v14.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v14.msgh_local_port);
    }
    goto LABEL_28;
  }
  return v10;
}

uint64_t VTCompressionSessionRemoteClient_MultiPassStorageGetTimeStamp(mach_port_name_t a1, uint64_t a2, char *src, uint64_t a4, _DWORD *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(v18, 0, 448);
  memset(v17, 0, sizeof(v17));
  *(_OWORD *)mach_msg_header_t rcv_name = 0u;
  long long v16 = 0u;
  *((void *)&v16 + 1) = *MEMORY[0x1E4F14068];
  v17[0] = *(_OWORD *)a2;
  *(void *)&v17[1] = *(void *)(a2 + 16);
  if (MEMORY[0x1E4F149B0]) {
    int v8 = mig_strncpy_zerofill((char *)v18, src, 512);
  }
  else {
    int v8 = mig_strncpy((char *)v18, src, 512);
  }
  DWORD2(v17[1]) = 0;
  HIDWORD(v17[1]) = v8;
  mach_msg_size_t v9 = ((v8 + 3) & 0xFFFFFFFC) + 64;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v16 = 0x479000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v11 = mach_msg((mach_msg_header_t *)rcv_name, 3162387, v9, 0x48u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (DWORD1(v16) == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (DWORD1(v16) == 18420)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 64)
          {
            if (!rcv_name[2])
            {
              uint64_t v12 = LODWORD(v17[0]);
              if (!LODWORD(v17[0]))
              {
                *(_OWORD *)a4 = *(_OWORD *)((char *)v17 + 4);
                *(void *)(a4 + 16) = *(void *)((char *)&v17[1] + 4);
                *a5 = HIDWORD(v17[1]);
                return v12;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = LODWORD(v17[0]) == 0;
            }
            if (v13) {
              uint64_t v12 = 4294966996;
            }
            else {
              uint64_t v12 = LODWORD(v17[0]);
            }
            goto LABEL_28;
          }
        }
        uint64_t v12 = 4294966996;
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v12 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_28;
  }
  return v12;
}

uint64_t VTCompressionSessionRemoteClient_MultiPassStorageGetTimeStampAndDuration(mach_port_name_t a1, uint64_t a2, char *src, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  memset(v19, 0, 480);
  *(_OWORD *)mach_msg_header_t rcv_name = 0u;
  long long v18 = 0u;
  *((void *)&v18 + 1) = *MEMORY[0x1E4F14068];
  v19[0] = *(_OWORD *)a2;
  *(void *)&v19[1] = *(void *)(a2 + 16);
  if (MEMORY[0x1E4F149B0]) {
    int v10 = mig_strncpy_zerofill((char *)&v19[2], src, 512);
  }
  else {
    int v10 = mig_strncpy((char *)&v19[2], src, 512);
  }
  DWORD2(v19[1]) = 0;
  HIDWORD(v19[1]) = v10;
  mach_msg_size_t v11 = ((v10 + 3) & 0xFFFFFFFC) + 64;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v18 = 0x479100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v13 = mach_msg((mach_msg_header_t *)rcv_name, 3162387, v11, 0x60u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!v13)
    {
      if (DWORD1(v18) == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (DWORD1(v18) == 18421)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 88)
          {
            if (!rcv_name[2])
            {
              uint64_t v14 = LODWORD(v19[0]);
              if (!LODWORD(v19[0]))
              {
                *(_OWORD *)a4 = *(_OWORD *)((char *)v19 + 4);
                *(void *)(a4 + 16) = *(void *)((char *)&v19[1] + 4);
                *(_OWORD *)a5 = *(_OWORD *)((char *)&v19[1] + 12);
                *(void *)(a5 + 16) = *(void *)((char *)&v19[2] + 12);
                *a6 = DWORD1(v19[3]);
                return v14;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v15 = 1;
            }
            else {
              BOOL v15 = LODWORD(v19[0]) == 0;
            }
            if (v15) {
              uint64_t v14 = 4294966996;
            }
            else {
              uint64_t v14 = LODWORD(v19[0]);
            }
            goto LABEL_28;
          }
        }
        uint64_t v14 = 4294966996;
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v14 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_28;
  }
  return v14;
}

uint64_t VTCompressionSessionRemoteClient_MultiPassStorageCopyDataAtTimeStamp(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  memset(&msg_4[16], 0, 48);
  *(_OWORD *)msg_4 = 0u;
  *(void *)&msg_4[20] = *MEMORY[0x1E4F14068];
  *(_OWORD *)&msg_4[28] = *(_OWORD *)a2;
  *(void *)&msg_4[44] = *(void *)(a2 + 16);
  *(_DWORD *)&msg_4[52] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  int msg = 5395;
  *(void *)&msg_4[12] = 0x479200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg_4[8];
  }
  uint64_t v11 = mach_msg((mach_msg_header_t *)&msg, 3162387, 0x3Cu, 0x44u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 18422)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 36)
          {
            uint64_t v12 = 4294966996;
            if (*(_DWORD *)&msg_4[28])
            {
              if (*(_DWORD *)&msg_4[4]) {
                uint64_t v12 = 4294966996;
              }
              else {
                uint64_t v12 = *(unsigned int *)&msg_4[28];
              }
            }
          }
          else
          {
            uint64_t v12 = 4294966996;
          }
          goto LABEL_30;
        }
        uint64_t v12 = 4294966996;
        if (*(_DWORD *)&msg_4[20] == 1 && *(_DWORD *)msg_4 == 60 && !*(_DWORD *)&msg_4[4] && msg_4[35] == 1)
        {
          int v14 = *(_DWORD *)&msg_4[36];
          if (*(_DWORD *)&msg_4[36] == *(_DWORD *)&msg_4[48])
          {
            uint64_t v12 = 0;
            *a4 = *(void *)&msg_4[24];
            *a5 = v14;
            *a6 = *(_DWORD *)&msg_4[52];
            return v12;
          }
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v12 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg_4[8]);
    }
    goto LABEL_30;
  }
  return v12;
}

uint64_t VTCompressionSessionRemoteClient_GetNextPendingNotification(int a1, _DWORD *a2, void *a3, char *a4, void *a5, _DWORD *a6)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  memset(v22, 0, 444);
  long long v21 = 0u;
  long long v20 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)int msg = 5395;
  *(void *)&msg[16] = 0x479300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v13 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x254u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!v13)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18423)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v14 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v14 = 4294966996;
              }
              else {
                uint64_t v14 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v14 = 4294966996;
          }
          goto LABEL_31;
        }
        uint64_t v14 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1
          && *(_DWORD *)&msg[4] >= 0x4Cu
          && *(_DWORD *)&msg[4] <= 0x24Cu
          && !*(_DWORD *)&msg[8]
          && BYTE3(v20) == 1
          && LODWORD(v22[0]) <= 0x200
          && (*(_DWORD *)&msg[4] - 76) >= LODWORD(v22[0]))
        {
          unsigned int v15 = (LODWORD(v22[0]) + 3) & 0xFFFFFFFC;
          if (*(_DWORD *)&msg[4] == v15 + 76)
          {
            long long v16 = &msg[v15];
            if (DWORD1(v20) == *((_DWORD *)v16 + 18))
            {
              int v17 = v16 - 512;
              *a2 = v21;
              *a3 = *(void *)((char *)&v21 + 4);
              mig_strncpy(a4, (const char *)v22 + 4, 512);
              uint64_t v14 = 0;
              *a5 = *(void *)&msg[28];
              *a6 = *((_DWORD *)v17 + 146);
              return v14;
            }
          }
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
LABEL_31:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v14 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_31;
  }
  return v14;
}

uint64_t VTCompressionSessionRemoteClient_TileCreate(mach_port_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, uint64_t a8, int a9, char *src, _DWORD *a11, void *a12, void *a13, int *a14)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  memset(v34, 0, 400);
  uint64_t v31 = 0;
  long long v32 = 0u;
  uint64_t v25 = 0x13000000000000;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v23 = 3;
  int v24 = a2;
  uint64_t v26 = a6;
  LODWORD(v27) = 16777472;
  HIDWORD(v27) = a7;
  uint64_t v28 = a8;
  int v29 = 16777472;
  int v30 = a9;
  uint64_t v31 = *MEMORY[0x1E4F14068];
  *(void *)&long long v32 = a3;
  *((void *)&v32 + 1) = a4;
  *(void *)&long long v33 = __PAIR64__(a7, a5);
  DWORD2(v33) = a9;
  if (MEMORY[0x1E4F149B0]) {
    int v15 = mig_strncpy_zerofill((char *)v34 + 4, src, 512);
  }
  else {
    int v15 = mig_strncpy((char *)v34 + 4, src, 512);
  }
  HIDWORD(v33) = 0;
  LODWORD(v34[0]) = v15;
  mach_msg_size_t v16 = ((v15 + 3) & 0xFFFFFFFC) + 116;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.uint64_t msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x479400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v18 = mach_msg(&rcv_name, 3162387, v16, 0x4Cu, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v19 = v18;
  if ((v18 - 268435458) > 0xE || ((1 << (v18 - 2)) & 0x4003) == 0)
  {
    if (!v18)
    {
      if (rcv_name.msgh_id == 71)
      {
        uint64_t v19 = 4294966988;
      }
      else if (rcv_name.msgh_id == 18424)
      {
        if ((rcv_name.msgh_bits & 0x80000000) == 0)
        {
          if (rcv_name.msgh_size == 36)
          {
            uint64_t v19 = 4294966996;
            if (v25)
            {
              if (rcv_name.msgh_remote_port) {
                uint64_t v19 = 4294966996;
              }
              else {
                uint64_t v19 = v25;
              }
            }
          }
          else
          {
            uint64_t v19 = 4294966996;
          }
          goto LABEL_29;
        }
        uint64_t v19 = 4294966996;
        if (v23 == 1 && rcv_name.msgh_size == 68 && !rcv_name.msgh_remote_port && HIWORD(v25) << 16 == 1114112)
        {
          uint64_t v19 = 0;
          *a11 = v24;
          uint64_t v20 = v28;
          *a12 = v27;
          *a13 = v20;
          *a14 = v29;
          return v19;
        }
      }
      else
      {
        uint64_t v19 = 4294966995;
      }
LABEL_29:
      mach_msg_destroy(&rcv_name);
      return v19;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v19 - 268435459) <= 1)
  {
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
    goto LABEL_29;
  }
  return v19;
}

uint64_t VTCompressionSessionRemoteClient_PrepareToEncodeTiles(mach_port_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  int v6 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 18325;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 2097169, 0x24u, 0, 0, *MEMORY[0x1E4F1EB98], 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t VTCompressionSessionRemoteClient_EncodeTile(mach_port_name_t a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9)
{
  long long v13 = 0u;
  *(_OWORD *)name = 0u;
  DWORD2(v13) = a2;
  int v14 = 1245184;
  uint64_t v15 = a3;
  int v16 = 16777472;
  int v17 = a4;
  uint64_t v18 = a7;
  int v19 = 16777472;
  int v20 = a8;
  uint64_t v21 = *MEMORY[0x1E4F14068];
  int v22 = a4;
  uint64_t v23 = a5;
  uint64_t v24 = a6;
  int v25 = a8;
  uint64_t v26 = a9;
  int v11 = -2147483629;
  name[1] = a1;
  *(void *)&long long v13 = 0x300004796;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v11);
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)&v11, 2097169, 0x70u, 0, 0, *MEMORY[0x1E4F1EB98], 0);
  if ((v9 - 268435459) <= 1)
  {
    if ((v11 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[2]);
    }
    mach_msg_destroy((mach_msg_header_t *)&v11);
  }
  return v9;
}

uint64_t VTCompressionSessionRemoteClient_CompleteTiles(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x479700000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 2097169, 0x18u, 0, 0, *MEMORY[0x1E4F1EB98], 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t VTCompressionSessionRemoteClient_MotionEstimationCreate(mach_port_t a1, int a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, int a7, char *src, _DWORD *a9, void *a10, void *a11, _DWORD *a12)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  memset(v28, 0, 432);
  uint64_t v23 = 0x13000000000000;
  uint64_t v26 = 0;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v21 = 2;
  int v22 = a2;
  uint64_t v24 = a6;
  LODWORD(v25) = 16777472;
  HIDWORD(v25) = a7;
  uint64_t v26 = *MEMORY[0x1E4F14068];
  *(void *)&long long v27 = a3;
  *((void *)&v27 + 1) = __PAIR64__(a5, a4);
  LODWORD(v28[0]) = a7;
  if (MEMORY[0x1E4F149B0]) {
    int v13 = mig_strncpy_zerofill((char *)v28 + 12, src, 512);
  }
  else {
    int v13 = mig_strncpy((char *)v28 + 12, src, 512);
  }
  DWORD1(v28[0]) = 0;
  DWORD2(v28[0]) = v13;
  mach_msg_size_t v14 = ((v13 + 3) & 0xFFFFFFFC) + 92;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  rcv_name.uint64_t msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(void *)&rcv_name.msgh_voucher_port = 0x479800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t special_reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v16 = mach_msg(&rcv_name, 3162387, v14, 0x4Cu, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v17 = v16;
  if ((v16 - 268435458) > 0xE || ((1 << (v16 - 2)) & 0x4003) == 0)
  {
    if (!v16)
    {
      if (rcv_name.msgh_id == 71)
      {
        uint64_t v17 = 4294966988;
      }
      else if (rcv_name.msgh_id == 18428)
      {
        if ((rcv_name.msgh_bits & 0x80000000) == 0)
        {
          if (rcv_name.msgh_size == 36)
          {
            uint64_t v17 = 4294966996;
            if (v23)
            {
              if (rcv_name.msgh_remote_port) {
                uint64_t v17 = 4294966996;
              }
              else {
                uint64_t v17 = v23;
              }
            }
          }
          else
          {
            uint64_t v17 = 4294966996;
          }
          goto LABEL_29;
        }
        uint64_t v17 = 4294966996;
        if (v21 == 1 && rcv_name.msgh_size == 68 && !rcv_name.msgh_remote_port && HIWORD(v23) << 16 == 1114112)
        {
          uint64_t v17 = 0;
          *a9 = v22;
          uint64_t v18 = v26;
          *a10 = v25;
          *a11 = v18;
          *a12 = v27;
          return v17;
        }
      }
      else
      {
        uint64_t v17 = 4294966995;
      }
LABEL_29:
      mach_msg_destroy(&rcv_name);
      return v17;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v17 - 268435459) <= 1)
  {
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
    goto LABEL_29;
  }
  return v17;
}

uint64_t VTCompressionSessionRemoteClient_MotionEstimationCopySourcePixelBufferAttributes(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v15 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x479900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3162387, 0x18u, 0x44u, special_reply_port, *MEMORY[0x1E4F1EB98], 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18429)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v10 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v10 = 4294966996;
              }
              else {
                uint64_t v10 = *(unsigned int *)&msg[32];
              }
            }
          }
          else
          {
            uint64_t v10 = 4294966996;
          }
          goto LABEL_30;
        }
        uint64_t v10 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v15) == 1)
        {
          int v12 = DWORD1(v15);
          if (DWORD1(v15) == v16)
          {
            uint64_t v10 = 0;
            *a2 = *(void *)&msg[28];
            *a3 = v12;
            *a4 = DWORD1(v16);
            return v10;
          }
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v10 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_30;
  }
  return v10;
}

uint64_t VTCompressionSessionRemoteClient_EstimateMotion(int a1, int a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7, uint64_t a8)
{
  *(_OWORD *)&msg[20] = 0u;
  int v16 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_DWORD *)&msg[28] = a2;
  int v11 = 1245184;
  uint64_t v12 = a3;
  int v13 = 16777472;
  int v14 = a4;
  int v15 = a5;
  int v17 = 1245184;
  uint64_t v18 = a6;
  int v19 = 16777472;
  int v20 = a7;
  uint64_t v21 = *MEMORY[0x1E4F14068];
  int v22 = a4;
  int v23 = a7;
  uint64_t v24 = a8;
  *(_DWORD *)mach_msg_header_t msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(void *)&msg[20] = 0x40000479ALL;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 2097169, 0x6Cu, 0, 0, *MEMORY[0x1E4F1EB98], 0);
  if ((v8 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v8;
}

uint64_t VTCompressionSessionRemoteClient_CompleteMotionEstimation(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x479B00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 2097169, 0x18u, 0, 0, *MEMORY[0x1E4F1EB98], 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t (*vtcompressionsession_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 18332) >= 0xFFFFFFE0) {
    return VTCompressionSessionRemoteServer_vtcompressionsession_subsystem[5 * (v1 - 18300) + 5];
  }
  else {
    return 0;
  }
}

uint64_t _XCreate_0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v4 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 4) {
    goto LABEL_21;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x88 || v5 > 0x288) {
    goto LABEL_21;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112
    || *(unsigned char *)(result + 51) != 1
    || *(unsigned char *)(result + 67) != 1
    || *(unsigned char *)(result + 83) != 1)
  {
    goto LABEL_20;
  }
  unsigned int v6 = *(_DWORD *)(result + 132);
  int v3 = -304;
  if (v6 > 0x200 || (int)v5 - 136 < v6) {
    goto LABEL_21;
  }
  if (v5 != ((v6 + 3) & 0xFFFFFFFC) + 136) {
    goto LABEL_2;
  }
  if (*(_DWORD *)(result + 52) != *(_DWORD *)(result + 116)
    || *(_DWORD *)(result + 68) != *(_DWORD *)(result + 120)
    || *(_DWORD *)(result + 84) != *(_DWORD *)(result + 124))
  {
LABEL_20:
    int v3 = -300;
    goto LABEL_21;
  }
  double result = (uint64_t)memchr((void *)(result + 136), 0, v5 - 136);
  if (!result)
  {
LABEL_2:
    int v3 = -304;
LABEL_21:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_22;
  }
  uint64_t v7 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
  if (*(_DWORD *)v7 || *(_DWORD *)(v7 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_21;
  }
  *(void *)(a2 + 32) = 0x14000000000000;
  uint64_t v8 = *(unsigned int *)(v4 + 12);
  int v9 = *(_DWORD *)(v4 + 28);
  uint64_t v10 = *(void *)(v4 + 96);
  unsigned int v11 = *(_DWORD *)(v4 + 104);
  unsigned int v12 = *(_DWORD *)(v4 + 108);
  unsigned int v13 = *(_DWORD *)(v4 + 112);
  uint64_t v14 = *(void *)(v4 + 40);
  int v15 = *(_DWORD *)(v4 + 52);
  uint64_t v16 = *(void *)(v4 + 56);
  unsigned int v17 = *(_DWORD *)(v4 + 68);
  CFDictionaryRef v18 = *(const __CFDictionary **)(v4 + 72);
  unsigned int v19 = *(_DWORD *)(v4 + 84);
  long long v20 = *(_OWORD *)(v7 + 36);
  v21[0] = *(_OWORD *)(v7 + 20);
  v21[1] = v20;
  double result = VTCompressionSessionRemoteServer_Create(v8, v9, v21, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, (const char *)(v4 + 136), (_DWORD *)(a2 + 28), (void *)(a2 + 48), (uint64_t *)(a2 + 56), (_DWORD *)(a2 + 64));
  if (!result)
  {
    *(void *)(a2 + 40) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 68;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_22:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XDestroy_0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    double result = (_DWORD *)VTCompressionSessionRemoteServer_Destroy(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XCopySupportedPropertyDictionary_0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (_DWORD *)VTCompressionSessionRemoteServer_CopySupportedPropertyDictionary(result[3], (void *)(a2 + 28), (_DWORD *)(a2 + 52), (kern_return_t *)(a2 + 56));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *_XCopySerializableProperties_0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (_DWORD *)VTCompressionSessionRemoteServer_CopySerializableProperties(result[3], (void *)(a2 + 28), (_DWORD *)(a2 + 52), (kern_return_t *)(a2 + 56));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

const char *_XCopyProperty_0(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (int v3 = result, v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x228
    || ((unsigned int v5 = *((_DWORD *)result + 9), v5 <= 0x200) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = v4 == v7) : (BOOL v8 = 0),
        !v8 || (double result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    *(_DWORD *)(a2 + 32) = -304;
LABEL_12:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (const char *)VTCompressionSessionRemoteServer_CopyProperty(*((unsigned int *)v3 + 3), v3 + 40, (void *)(a2 + 28), (_DWORD *)(a2 + 52), (kern_return_t *)(a2 + 56));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
    goto LABEL_12;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _XSetProperty_0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v5 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  unsigned int v6 = *(_DWORD *)(result + 4);
  if (v6 < 0x40 || v6 > 0x240) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(result + 39) != 1) {
    goto LABEL_18;
  }
  unsigned int v7 = *(_DWORD *)(result + 56);
  if (v7 > 0x200)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
LABEL_4:
    *(void *)(a2 + 24) = v4;
    return result;
  }
  int v3 = -304;
  if (v6 - 64 < v7) {
    goto LABEL_3;
  }
  unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
  if (v6 != v8 + 64) {
    goto LABEL_3;
  }
  unsigned int v9 = *(_DWORD *)(result + 40);
  if (v9 != *(_DWORD *)(result + v8 + 60))
  {
LABEL_18:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v10 = 572;
  if (*(unsigned int *)(result + 4) < 0x23CuLL) {
    uint64_t v10 = *(unsigned int *)(result + 4);
  }
  double result = (uint64_t)memchr((void *)(result + 60), 0, v10 - 60);
  if (!result) {
    goto LABEL_2;
  }
  double result = VTCompressionSessionRemoteServer_SetProperty(*(unsigned int *)(v5 + 12), (const char *)(v5 + 60), *(void *)(v5 + 28), v9, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (result) {
    goto LABEL_4;
  }
  *(void *)(a2 + 24) = v4;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

uint64_t _XSetMultiPassStorage(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 40)
  {
    int v4 = -304;
LABEL_8:
    *(_DWORD *)(a2 + 32) = v4;
    uint64_t v3 = *MEMORY[0x1E4F14068];
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v4 = -300;
    goto LABEL_8;
  }
  double result = VTCompressionSessionRemoteServer_SetMultiPassStorage(*(unsigned int *)(result + 12), *(unsigned int *)(result + 28), (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v3 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v3;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_9:
  *(void *)(a2 + 24) = v3;
  return result;
}

uint64_t _XSetProperties_0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }
  double result = VTCompressionSessionRemoteServer_SetProperties(*(unsigned int *)(result + 12), *(void *)(result + 28), v3, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(void *)(a2 + 24) = v4;
  return result;
}

_DWORD *_XPrepareToEncodeFrames(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = (_DWORD *)VTCompressionSessionRemoteServer_PrepareToEncodeFrames(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t _XEncodeFrame(uint64_t result, uint64_t a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 18 && *(_DWORD *)(result + 4) == 404)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112
      && *(unsigned char *)(result + 51) == 1
      && *(unsigned __int16 *)(result + 66) << 16 == 1114112
      && *(unsigned char *)(result + 79) == 1
      && *(unsigned char *)(result + 95) == 1
      && *(unsigned __int16 *)(result + 110) << 16 == 1114112
      && *(unsigned char *)(result + 123) == 1
      && *(unsigned char *)(result + 139) == 1
      && *(unsigned __int16 *)(result + 154) << 16 == 1114112
      && *(unsigned char *)(result + 167) == 1
      && *(unsigned char *)(result + 183) == 1)
    {
      if (*(unsigned __int16 *)(result + 198) << 16 == 1114112
        && *(unsigned char *)(result + 211) == 1
        && *(unsigned char *)(result + 227) == 1
        && *(unsigned __int16 *)(result + 242) << 16 == 1114112
        && *(unsigned char *)(result + 255) == 1
        && *(unsigned char *)(result + 271) == 1
        && *(unsigned char *)(result + 287) == 1)
      {
        int v2 = *(_DWORD *)(result + 52);
        if (v2 == *(_DWORD *)(result + 300))
        {
          int v3 = *(_DWORD *)(result + 80);
          if (v3 == *(_DWORD *)(result + 304))
          {
            int v4 = *(_DWORD *)(result + 96);
            if (v4 == *(_DWORD *)(result + 308))
            {
              int v5 = *(_DWORD *)(result + 124);
              if (v5 == *(_DWORD *)(result + 312))
              {
                int v6 = *(_DWORD *)(result + 140);
                if (v6 == *(_DWORD *)(result + 316))
                {
                  int v7 = *(_DWORD *)(result + 168);
                  if (v7 == *(_DWORD *)(result + 320))
                  {
                    int v8 = *(_DWORD *)(result + 184);
                    if (v8 == *(_DWORD *)(result + 324))
                    {
                      int v9 = *(_DWORD *)(result + 212);
                      if (v9 == *(_DWORD *)(result + 328))
                      {
                        int v10 = *(_DWORD *)(result + 228);
                        if (v10 == *(_DWORD *)(result + 332))
                        {
                          int v11 = *(_DWORD *)(result + 256);
                          if (v11 == *(_DWORD *)(result + 336))
                          {
                            unsigned int v12 = *(_DWORD *)(result + 272);
                            if (v12 == *(_DWORD *)(result + 340))
                            {
                              int v13 = *(_DWORD *)(result + 288);
                              if (v13 == *(_DWORD *)(result + 392))
                              {
                                unsigned int v31 = *(_DWORD *)(result + 12);
                                int v30 = *(_DWORD *)(result + 28);
                                uint64_t v14 = *(void *)(result + 40);
                                int v33 = *(_DWORD *)(result + 56);
                                uint64_t v32 = *(void *)(result + 68);
                                uint64_t v34 = *(void *)(result + 84);
                                int v15 = *(_DWORD *)(result + 100);
                                uint64_t v16 = *(void *)(result + 112);
                                uint64_t v17 = *(void *)(result + 128);
                                int v18 = *(_DWORD *)(result + 144);
                                uint64_t v19 = *(void *)(result + 156);
                                uint64_t v20 = *(void *)(result + 172);
                                int v21 = *(_DWORD *)(result + 188);
                                uint64_t v22 = *(void *)(result + 200);
                                uint64_t v23 = *(void *)(result + 216);
                                int v24 = *(_DWORD *)(result + 232);
                                uint64_t v25 = *(void *)(result + 244);
                                uint64_t v26 = *(void *)(result + 260);
                                uint64_t v27 = *(void *)(result + 276);
                                uint64_t v28 = *(void *)(result + 396);
                                long long v38 = *(_OWORD *)(result + 344);
                                uint64_t v39 = *(void *)(result + 360);
                                long long v36 = *(_OWORD *)(result + 368);
                                uint64_t v37 = *(void *)(result + 384);
                                double result = VTCompressionSessionRemoteServer_EncodeFrame(v31, v30, v14, v2, v33, v32, v3, v34, v4, v15, v16, v5, v17, v6, v18, v19, v7, v20, v8,
                                           v21,
                                           v22,
                                           v9,
                                           v23,
                                           v10,
                                           v24,
                                           v25,
                                           v11,
                                           v26,
                                           v12,
                                           &v38,
                                           &v36,
                                           v27,
                                           v13,
                                           v28);
                                *(_DWORD *)(a2 + 32) = result;
                                return result;
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
      int v29 = -300;
    }
    else
    {
      int v29 = -300;
    }
  }
  else
  {
    int v29 = -304;
  }
  *(_DWORD *)(a2 + 32) = v29;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XDequeueNextPendingEncodedFrame(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(void *)(a2 + 32) = 0x11000000000000;
  *(_DWORD *)(a2 + 48) = 16777473;
  *(_DWORD *)(a2 + 64) = 16777472;
  double result = (_DWORD *)VTCompressionSessionRemoteServer_DequeueNextPendingEncodedFrame(result[3], (_DWORD *)(a2 + 80), (void *)(a2 + 84), (_DWORD *)(a2 + 92), (_DWORD *)(a2 + 96), (_DWORD *)(a2 + 28), (void *)(a2 + 40), (_DWORD *)(a2 + 100), (_DWORD *)(a2 + 104), (int *)(a2 + 108), (vm_address_t *)(a2 + 56), (_DWORD *)(a2 + 112), (_DWORD *)(a2 + 116));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 52) = *(_DWORD *)(a2 + 100);
  *(_DWORD *)(a2 + 68) = *(_DWORD *)(a2 + 112);
  *(void *)(a2 + 72) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 120;
  *(_DWORD *)(a2 + 24) = 3;
  return result;
}

uint64_t _XCompleteFrames(uint64_t result, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 56)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t v3 = *(unsigned int *)(result + 12);
    long long v4 = *(_OWORD *)(result + 32);
    uint64_t v5 = *(void *)(result + 48);
    double result = VTCompressionSessionRemoteServer_CompleteFrames(v3, &v4);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

_DWORD *_XBeginPass(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v3 = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = (_DWORD *)VTCompressionSessionRemoteServer_BeginPass(result[3], result[8], (uint32_t *)(a2 + 36), (_DWORD *)(a2 + 40));
    *(_DWORD *)(a2 + 32) = result;
    uint64_t v3 = *MEMORY[0x1E4F14068];
    if (!result)
    {
      *(void *)(a2 + 24) = v3;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }
  *(void *)(a2 + 24) = v3;
  return result;
}

_DWORD *_XEndPass(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v3 = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = (_DWORD *)VTCompressionSessionRemoteServer_EndPass(result[3], (_DWORD *)(a2 + 36), (uint32_t *)(a2 + 40), (_DWORD *)(a2 + 44));
    *(_DWORD *)(a2 + 32) = result;
    uint64_t v3 = *MEMORY[0x1E4F14068];
    if (!result)
    {
      *(void *)(a2 + 24) = v3;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }
  }
  *(void *)(a2 + 24) = v3;
  return result;
}

_DWORD *_XGetTimeRangesForNextPass(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (_DWORD *)VTCompressionSessionRemoteServer_GetTimeRangesForNextPass(result[3], (CMItemCount *)(a2 + 52), (void *)(a2 + 28), (_DWORD *)(a2 + 60), (_DWORD *)(a2 + 64));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 60);
  *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 68;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _XMultiPassStorageCreate(uint64_t result, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v4 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 3) {
    goto LABEL_19;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x98 || v5 > 0x298) {
    goto LABEL_19;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112
    || *(unsigned char *)(result + 51) != 1
    || *(unsigned char *)(result + 67) != 1)
  {
    goto LABEL_18;
  }
  unsigned int v6 = *(_DWORD *)(result + 148);
  int v3 = -304;
  if (v6 > 0x200 || (int)v5 - 152 < v6) {
    goto LABEL_19;
  }
  if (v5 != ((v6 + 3) & 0xFFFFFFFC) + 152) {
    goto LABEL_2;
  }
  if (*(_DWORD *)(result + 52) != *(_DWORD *)(result + 88) || *(_DWORD *)(result + 68) != *(_DWORD *)(result + 140))
  {
LABEL_18:
    int v3 = -300;
    goto LABEL_19;
  }
  double result = (uint64_t)memchr((void *)(result + 152), 0, v5 - 152);
  if (!result)
  {
LABEL_2:
    int v3 = -304;
LABEL_19:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_20;
  }
  uint64_t v7 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
  if (*(_DWORD *)v7 || *(_DWORD *)(v7 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_19;
  }
  *(void *)(a2 + 32) = 0x14000000000000;
  uint64_t v8 = *(unsigned int *)(v4 + 12);
  int v9 = *(_DWORD *)(v4 + 28);
  uint64_t v10 = *(void *)(v4 + 80);
  int v11 = *(const char **)(v4 + 40);
  unsigned int v12 = *(_DWORD *)(v4 + 52);
  uint64_t v13 = *(void *)(v4 + 56);
  unsigned int v14 = *(_DWORD *)(v4 + 68);
  long long v15 = *(_OWORD *)(v7 + 36);
  v17[0] = *(_OWORD *)(v7 + 20);
  v17[1] = v15;
  long long v16 = *(_OWORD *)(v4 + 108);
  v18[0] = *(_OWORD *)(v4 + 92);
  v18[1] = v16;
  _OWORD v18[2] = *(_OWORD *)(v4 + 124);
  double result = VTCompressionSessionRemoteServer_MultiPassStorageCreate(v8, v9, v17, v10, v11, v12, v18, v13, v14, (const char *)(v4 + 152), (_DWORD *)(a2 + 28), (void *)(a2 + 48), (uint64_t *)(a2 + 56), (_DWORD *)(a2 + 64));
  if (!result)
  {
    *(void *)(a2 + 40) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 68;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_20:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XMultiPassStorageDestroy(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    double result = (_DWORD *)VTCompressionSessionRemoteServer_MultiPassStorageDestroy(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

const char *_XMultiPassStorageSetIdentifier(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0
    || (int v3 = result, v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x228
    || ((unsigned int v5 = *((_DWORD *)result + 9), v5 <= 0x200) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (BOOL v8 = v4 == v7) : (BOOL v8 = 0),
        !v8 || (double result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v9 = *MEMORY[0x1E4F14068];
LABEL_12:
    *(void *)(a2 + 24) = v9;
    return result;
  }
  double result = (const char *)VTCompressionSessionRemoteServer_MultiPassStorageSetIdentifier(*((unsigned int *)v3 + 3), v3 + 40, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  if (result) {
    goto LABEL_12;
  }
  *(void *)(a2 + 24) = v9;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

_DWORD *_XMultiPassStorageCopyIdentifier(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = (_DWORD *)VTCompressionSessionRemoteServer_MultiPassStorageCopyIdentifier(result[3], (char *)(a2 + 44));
    *(_DWORD *)(a2 + 32) = result;
    uint64_t v3 = *MEMORY[0x1E4F14068];
    if (!result)
    {
      *(void *)(a2 + 24) = v3;
      double result = (_DWORD *)strlen((const char *)(a2 + 44));
      if (!(((unint64_t)result + 1) >> 32))
      {
        *(_DWORD *)(a2 + 36) = 0;
        *(_DWORD *)(a2 + 40) = result + 1;
        *(_DWORD *)(a2 + 4) = ((result + 4) & 0xFFFFFFFC) + 44;
        return result;
      }
      *(_DWORD *)(a2 + 32) = -304;
    }
    *(void *)(a2 + 24) = v3;
  }
  return result;
}

uint64_t _XMultiPassStorageSetDataAtTimeStamp(uint64_t result, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 84)
  {
    int v8 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v8;
    uint64_t v7 = *MEMORY[0x1E4F14068];
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 80)))
  {
    int v8 = -300;
    goto LABEL_9;
  }
  uint64_t v4 = *(unsigned int *)(result + 12);
  int v5 = *(_DWORD *)(result + 76);
  BOOL v6 = *(const UInt8 **)(result + 28);
  long long v9 = *(_OWORD *)(result + 52);
  uint64_t v10 = *(void *)(result + 68);
  double result = VTCompressionSessionRemoteServer_MultiPassStorageSetDataAtTimeStamp(v4, (uint64_t)&v9, v5, v6, v3, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v7 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + 24) = v7;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(void *)(a2 + 24) = v7;
  return result;
}

_DWORD *_XMultiPassStorageGetTimeStamp(_DWORD *result, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((*result & 0x80000000) == 0
    && (unsigned int v3 = result, v4 = result[1], v4 >= 0x40)
    && v4 <= 0x240
    && ((unsigned int v5 = result[15], v5 <= 0x200) ? (v6 = (int)v4 - 64 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 64, v6) ? (BOOL v8 = v4 == v7) : (BOOL v8 = 0),
        v8 && (double result = memchr(result + 16, 0, v4 - 64)) != 0))
  {
    uint64_t v10 = v3[3];
    long long v11 = *((_OWORD *)v3 + 2);
    uint64_t v12 = *((void *)v3 + 6);
    double result = (_DWORD *)VTCompressionSessionRemoteServer_MultiPassStorageGetTimeStamp(v10, (uint64_t)&v11, (const char *)v3 + 64, (void *)(a2 + 36), (_DWORD *)(a2 + 60));
    *(_DWORD *)(a2 + 32) = result;
    uint64_t v9 = *MEMORY[0x1E4F14068];
    if (!result)
    {
      *(void *)(a2 + 24) = v9;
      *(_DWORD *)(a2 + 4) = 64;
      return result;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v9 = *MEMORY[0x1E4F14068];
  }
  *(void *)(a2 + 24) = v9;
  return result;
}

_DWORD *_XMultiPassStorageGetTimeStampAndDuration(_DWORD *result, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((*result & 0x80000000) == 0
    && (unsigned int v3 = result, v4 = result[1], v4 >= 0x40)
    && v4 <= 0x240
    && ((unsigned int v5 = result[15], v5 <= 0x200) ? (v6 = (int)v4 - 64 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 64, v6) ? (BOOL v8 = v4 == v7) : (BOOL v8 = 0),
        v8 && (double result = memchr(result + 16, 0, v4 - 64)) != 0))
  {
    uint64_t v10 = v3[3];
    long long v11 = *((_OWORD *)v3 + 2);
    uint64_t v12 = *((void *)v3 + 6);
    double result = (_DWORD *)VTCompressionSessionRemoteServer_MultiPassStorageGetTimeStampAndDuration(v10, &v11, (const char *)v3 + 64, (void *)(a2 + 36), (void *)(a2 + 60), (_DWORD *)(a2 + 84));
    *(_DWORD *)(a2 + 32) = result;
    uint64_t v9 = *MEMORY[0x1E4F14068];
    if (!result)
    {
      *(void *)(a2 + 24) = v9;
      *(_DWORD *)(a2 + 4) = 88;
      return result;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v9 = *MEMORY[0x1E4F14068];
  }
  *(void *)(a2 + 24) = v9;
  return result;
}

uint64_t _XMultiPassStorageCopyDataAtTimeStamp(uint64_t result, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 60)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    uint64_t v3 = *(unsigned int *)(result + 12);
    int v4 = *(_DWORD *)(result + 56);
    long long v5 = *(_OWORD *)(result + 32);
    uint64_t v6 = *(void *)(result + 48);
    double result = VTCompressionSessionRemoteServer_MultiPassStorageCopyDataAtTimeStamp(v3, (uint64_t)&v5, v4, (void *)(a2 + 28), (_DWORD *)(a2 + 52), (_DWORD *)(a2 + 56));
    if (!result)
    {
      *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
      *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
      *(_DWORD *)a2 |= 0x80000000;
      *(_DWORD *)(a2 + 4) = 60;
      *(_DWORD *)(a2 + 24) = 1;
      return result;
    }
    *(_DWORD *)(a2 + 32) = result;
  }
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XGetNextPendingNotification_0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  unsigned int v6 = 0;
  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (_DWORD *)VTCompressionSessionRemoteServer_GetNextPendingNotification(result[3], (_DWORD *)(a2 + 52), (void *)(a2 + 56), (char *)(a2 + 72), (vm_address_t *)(a2 + 28), &v6);
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  unsigned int v3 = v6;
  *(_DWORD *)(a2 + 40) = v6;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
  double result = (_DWORD *)strlen((const char *)(a2 + 72));
  if (((unint64_t)result + 1) >> 32)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = v4;
  }
  else
  {
    *(_DWORD *)(a2 + 64) = 0;
    *(_DWORD *)(a2 + 68) = result + 1;
    uint64_t v5 = (result + 4) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + v5 + 72) = v3;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = v5 + 76;
    *(_DWORD *)(a2 + 24) = 1;
  }
  return result;
}

uint64_t _XTileCreate_0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v4 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 3) {
    goto LABEL_19;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x74 || v5 > 0x274) {
    goto LABEL_19;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112
    || *(unsigned char *)(result + 51) != 1
    || *(unsigned char *)(result + 67) != 1)
  {
    goto LABEL_18;
  }
  unsigned int v6 = *(_DWORD *)(result + 112);
  int v3 = -304;
  if (v6 > 0x200 || (int)v5 - 116 < v6) {
    goto LABEL_19;
  }
  if (v5 != ((v6 + 3) & 0xFFFFFFFC) + 116) {
    goto LABEL_2;
  }
  if (*(_DWORD *)(result + 52) != *(_DWORD *)(result + 100) || *(_DWORD *)(result + 68) != *(_DWORD *)(result + 104))
  {
LABEL_18:
    int v3 = -300;
    goto LABEL_19;
  }
  double result = (uint64_t)memchr((void *)(result + 116), 0, v5 - 116);
  if (!result)
  {
LABEL_2:
    int v3 = -304;
LABEL_19:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_20;
  }
  uint64_t v7 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
  if (*(_DWORD *)v7 || *(_DWORD *)(v7 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_19;
  }
  *(void *)(a2 + 32) = 0x14000000000000;
  uint64_t v8 = *(unsigned int *)(v4 + 12);
  int v9 = *(_DWORD *)(v4 + 28);
  uint64_t v10 = *(unsigned int *)(v4 + 96);
  uint64_t v11 = *(void *)(v4 + 40);
  unsigned int v12 = *(_DWORD *)(v4 + 52);
  uint64_t v13 = *(void *)(v4 + 56);
  unsigned int v14 = *(_DWORD *)(v4 + 68);
  long long v15 = *(_OWORD *)(v7 + 36);
  v16[0] = *(_OWORD *)(v7 + 20);
  v16[1] = v15;
  double result = VTCompressionSessionRemoteServer_TileCreate(v8, v9, v16, *(void *)(v4 + 80), *(void *)(v4 + 88), v10, v11, v12, v13, v14, (const char *)(v4 + 116), (_DWORD *)(a2 + 28), (void *)(a2 + 48), (uint64_t *)(a2 + 56), (_DWORD *)(a2 + 64));
  if (!result)
  {
    *(void *)(a2 + 40) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 68;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_20:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XPrepareToEncodeTiles(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = (_DWORD *)VTCompressionSessionRemoteServer_PrepareToEncodeTiles(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t _XEncodeTile(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 3 && *(_DWORD *)(result + 4) == 112)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112
      && *(unsigned char *)(result + 51) == 1
      && *(unsigned char *)(result + 67) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 52);
      if (v3 == *(_DWORD *)(result + 80))
      {
        unsigned int v4 = *(_DWORD *)(result + 68);
        if (v4 == *(_DWORD *)(result + 100))
        {
          double result = VTCompressionSessionRemoteServer_EncodeTile(*(unsigned int *)(result + 12), *(_DWORD *)(result + 28), *(void *)(result + 40), v3, *(void *)(result + 84), *(void *)(result + 92), *(void *)(result + 56), v4, *(void *)(result + 104));
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }
    int v5 = -300;
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XCompleteTiles(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = (_DWORD *)VTCompressionSessionRemoteServer_CompleteTiles(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t _XMotionEstimationCreate(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v4 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 2) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x5C || v5 > 0x25C) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned char *)(result + 51) != 1) {
    goto LABEL_19;
  }
  unsigned int v6 = *(_DWORD *)(result + 88);
  int v3 = -304;
  if (v6 > 0x200 || (int)v5 - 92 < v6) {
    goto LABEL_3;
  }
  if (v5 != ((v6 + 3) & 0xFFFFFFFC) + 92) {
    goto LABEL_2;
  }
  if (*(_DWORD *)(result + 52) != *(_DWORD *)(result + 80))
  {
LABEL_19:
    int v3 = -300;
    goto LABEL_3;
  }
  double result = (uint64_t)memchr((void *)(result + 92), 0, v5 - 92);
  if (!result)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_4;
  }
  uint64_t v7 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
  if (*(_DWORD *)v7 || *(_DWORD *)(v7 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  *(void *)(a2 + 32) = 0x14000000000000;
  uint64_t v8 = *(unsigned int *)(v4 + 12);
  int v9 = *(_DWORD *)(v4 + 28);
  uint64_t v10 = *(void *)(v4 + 64);
  uint64_t v11 = *(unsigned int *)(v4 + 72);
  uint64_t v12 = *(unsigned int *)(v4 + 76);
  uint64_t v13 = *(void *)(v4 + 40);
  unsigned int v14 = *(_DWORD *)(v4 + 52);
  long long v15 = *(_OWORD *)(v7 + 36);
  v16[0] = *(_OWORD *)(v7 + 20);
  v16[1] = v15;
  double result = VTCompressionSessionRemoteServer_MotionEstimationCreate(v8, v9, v16, v10, v11, v12, v13, v14, (const char *)(v4 + 92), (_DWORD *)(a2 + 28), (void *)(a2 + 48), (uint64_t *)(a2 + 56), (_DWORD *)(a2 + 64));
  if (!result)
  {
    *(void *)(a2 + 40) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 68;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_4:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XMotionEstimationCopySourcePixelBufferAttributes(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (_DWORD *)VTCompressionSessionRemoteServer_MotionEstimationCopySourcePixelBufferAttributes(result[3], (void *)(a2 + 28), (_DWORD *)(a2 + 52), (kern_return_t *)(a2 + 56));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _XEstimateMotion(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 4 && *(_DWORD *)(result + 4) == 108)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112
      && *(unsigned char *)(result + 51) == 1
      && *(unsigned __int16 *)(result + 66) << 16 == 1114112
      && *(unsigned char *)(result + 79) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 52);
      if (v3 == *(_DWORD *)(result + 92))
      {
        unsigned int v4 = *(_DWORD *)(result + 80);
        if (v4 == *(_DWORD *)(result + 96))
        {
          double result = VTCompressionSessionRemoteServer_EstimateMotion(*(unsigned int *)(result + 12), *(_DWORD *)(result + 28), *(void *)(result + 40), v3, *(_DWORD *)(result + 56), *(void *)(result + 68), v4);
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }
    int v5 = -300;
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

_DWORD *_XCompleteMotionEstimation(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = (_DWORD *)VTCompressionSessionRemoteServer_CompleteMotionEstimation(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t VTCompressionSessionRemoteCallbackClient_FrameIsPending(mach_port_t a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  uint64_t v5 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 18351;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x28u, 0, 0, 0, 0);
}

uint64_t VTCompressionSessionRemoteCallbackClient_EncodeReturn(mach_port_t a1, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v8 = a2;
  uint64_t v7 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  int v10 = a4;
  int v11 = a5;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 18352;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x34u, 0, 0, 0, 0);
}

uint64_t VTCompressionSessionRemoteCallbackClient_CompleteFramesReturn(mach_port_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  uint64_t v6 = a2;
  int v7 = a3;
  *(void *)&v4.msgh_bits = 19;
  v4.msgh_voucher_port = 0;
  v4.msgh_id = 18353;
  v4.uint64_t msgh_remote_port = a1;
  v4.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&v4);
  }
  return mach_msg(&v4, 1, 0x2Cu, 0, 0, 0, 0);
}

uint64_t VTCompressionSessionRemoteCallbackClient_PrepareToEncodeFramesReturn(mach_port_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  uint64_t v6 = a2;
  int v7 = a3;
  *(void *)&v4.msgh_bits = 19;
  v4.msgh_voucher_port = 0;
  v4.msgh_id = 18354;
  v4.uint64_t msgh_remote_port = a1;
  v4.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&v4);
  }
  return mach_msg(&v4, 1, 0x2Cu, 0, 0, 0, 0);
}

uint64_t VTCompressionSessionRemoteCallbackClient_PrepareToEncodeTilesReturn(mach_port_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6 = *MEMORY[0x1E4F14068];
  uint64_t v7 = a2;
  uint64_t v8 = a3;
  int v9 = a4;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 18355;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, 0x34u, 0, 0, 0, 0);
}

uint64_t (*vtcompressionsessioncallback_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 18356) >= 0xFFFFFFFA) {
    return VTCompressionSessionRemoteCallbackServer_vtcompressionsessioncallback_subsystem[5
  }
                                                                                         * (v1 - 18350)
                                                                                         + 5];
  else {
    return 0;
  }
}

_DWORD *_XNotificationIsPending(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = (_DWORD *)VTCompressionSessionRemoteCallbackServer_NotificationIsPending();
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

_DWORD *_XFrameIsPending(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = (_DWORD *)VTCompressionSessionRemoteCallbackServer_FrameIsPending();
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t _XEncodeReturn(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 52)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = VTCompressionSessionRemoteCallbackServer_EncodeReturn(*(unsigned int *)(result + 12), *(void *)(result + 32), *(_DWORD *)(result + 40), *(_DWORD *)(result + 44), *(_DWORD *)(result + 48));
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t _XCompleteFramesReturn(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = VTCompressionSessionRemoteCallbackServer_CompleteFramesReturn(*(unsigned int *)(result + 12), *(void *)(result + 32), *(_DWORD *)(result + 40));
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t _XPrepareToEncodeFramesReturn(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = VTCompressionSessionRemoteCallbackServer_PrepareToEncodeFramesReturn(*(unsigned int *)(result + 12), *(void *)(result + 32), *(_DWORD *)(result + 40));
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t _XPrepareToEncodeTilesReturn(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 52)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    double result = VTCompressionSessionRemoteCallbackServer_PrepareToEncodeTilesReturn(*(unsigned int *)(result + 12), *(void *)(result + 32), *(void *)(result + 40), *(_DWORD *)(result + 48));
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t vtcompressionsessioncallback_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 18356) >= 0xFFFFFFFA
    && (uint64_t v5 = (void (*)(void))VTCompressionSessionRemoteCallbackServer_vtcompressionsessioncallback_subsystem[5 * (v4 - 18350) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t VTDecompressionSessionRemoteCallbackClient_FrameIsPending(mach_port_t a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x1E4F14068];
  uint64_t v5 = a2;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 18251;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t VTDecompressionSessionRemoteCallbackClient_DecodeFrameReturn(mach_port_t a1, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v8 = a2;
  uint64_t v7 = *MEMORY[0x1E4F14068];
  int v9 = a3;
  int v10 = a4;
  int v11 = a5;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 18252;
  msg.uint64_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x34u, 0, 0, 0, 0);
}

uint64_t VTDecompressionSessionRemoteCallbackClient_FinishDelayedFramesReturn(mach_port_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  uint64_t v6 = a2;
  int v7 = a3;
  *(void *)&v4.msgh_bits = 19;
  v4.msgh_voucher_port = 0;
  v4.msgh_id = 18253;
  v4.uint64_t msgh_remote_port = a1;
  v4.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&v4);
  }
  return mach_msg(&v4, 2097153, 0x2Cu, 0, 0, 0, 0);
}

uint64_t (*vtdecompressionsessioncallback_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 18254) >= 0xFFFFFFFC) {
    return VTDecompressionSessionRemoteCallbackServer_vtdecompressionsessioncallback_subsystem[5
  }
                                                                                             * (v1 - 18250)
                                                                                             + 5];
  else {
    return 0;
  }
}

_DWORD *_XNotificationIsPending_0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = (_DWORD *)VTDecompressionSessionRemoteCallbackServer_NotificationIsPending();
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

_DWORD *_XFrameIsPending_0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = (_DWORD *)VTDecompressionSessionRemoteCallbackServer_FrameIsPending();
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t _XDecodeFrameReturn(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 52)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = VTDecompressionSessionRemoteCallbackServer_DecodeFrameReturn(*(unsigned int *)(result + 12), *(void *)(result + 32), *(_DWORD *)(result + 40), *(_DWORD *)(result + 44), *(_DWORD *)(result + 48));
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t _XFinishDelayedFramesReturn(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = VTDecompressionSessionRemoteCallbackServer_FinishDelayedFramesReturn(*(unsigned int *)(result + 12), *(void *)(result + 32), *(_DWORD *)(result + 40));
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t vtdecompressionsessioncallback_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 18254) >= 0xFFFFFFFC
    && (uint64_t v5 = (void (*)(void))VTDecompressionSessionRemoteCallbackServer_vtdecompressionsessioncallback_subsystem[5 * (v4 - 18250) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void VTParavirtualizationCreateSampleBufferFromSerializedAtomDataBlockBuffer_cold_1()
{
  dlerror();
  CFAllocatorRef v0 = (unsigned __int8 *)abort_report_np();
  CC_SHA256_Final(v0, v1);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1F40D7158](theArray, range.location, range.length, value, comparator, context);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7450](bundle);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7810](allocator, capacity, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7938]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

CFIndex CFDictionaryGetCountOfKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D79C8](theDict, key);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFStringRef CFErrorCopyFailureReason(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1F40D7A88](err);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B68](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1F40D7D68]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1F40D83F8](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8400](alloc, data, *(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1F40D8478](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8558](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1F40D85A0](string);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1F40D85E0]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1F40D8740](relativeURL);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1F40D8770](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8790](anURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88C0](allocator, URLString, baseURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1F40D8928]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1F40D89A0](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x1F40D89D8]();
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1F40D89E8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

CGColorConversionInfoRef CGColorConversionInfoCreateFromList(CFDictionaryRef options, CGColorSpaceRef a2, CGColorConversionInfoTransformType a3, CGColorRenderingIntent a4, ...)
{
  return (CGColorConversionInfoRef)MEMORY[0x1F40D9948](options, a2, *(void *)&a3, *(void *)&a4);
}

uint64_t CGColorConversionInfoIterateFunctionsWithCallbacks()
{
  return MEMORY[0x1F40D9968]();
}

uint64_t CGColorFunctionGetInputRange()
{
  return MEMORY[0x1F40D99D8]();
}

uint64_t CGColorFunctionGetOutputRange()
{
  return MEMORY[0x1F40D99E0]();
}

uint64_t CGColorMatrixGetMatrix()
{
  return MEMORY[0x1F40D9A38]();
}

uint64_t CGColorNxMTransformGetTransform()
{
  return MEMORY[0x1F40D9A48]();
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1F40D9AC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPlatformColorSpace(const void *ref)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B68](ref);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B70](plist);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9BE8](space);
}

CFTypeID CGColorSpaceGetTypeID(void)
{
  return MEMORY[0x1F40D9C10]();
}

BOOL CGColorSpaceIsHDR(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C18](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C68](a1);
}

uint64_t CGColorTRCGetFunction()
{
  return MEMORY[0x1F40D9C70]();
}

CGDataProviderRef CGDataProviderCreateDirect(void *info, off_t size, const CGDataProviderDirectCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA2F0](info, size, callbacks);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

void CGImageRelease(CGImageRef image)
{
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1F40DAAB0]();
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x1F40DB300]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB4C8]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1F40DB4E0](dict, size);
}

uint64_t CMBaseClassGetCFTypeID()
{
  return MEMORY[0x1F40DB8F8]();
}

uint64_t CMBaseGetClassID()
{
  return MEMORY[0x1F40DB900]();
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x1F40DB910]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1F40DB920]();
}

OSStatus CMBlockBufferAppendBufferReference(CMBlockBufferRef theBuffer, CMBlockBufferRef targetBBuf, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1F40DB950](theBuffer, targetBBuf, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferAppendMemoryBlock(CMBlockBufferRef theBuffer, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1F40DB958](theBuffer, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x1F40DB968](theSourceBuffer, offsetToData, dataLength, destination);
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB970](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateEmpty(CFAllocatorRef structureAllocator, uint32_t subBlockCapacity, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB978](structureAllocator, *(void *)&subBlockCapacity, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithBufferReference(CFAllocatorRef structureAllocator, CMBlockBufferRef bufferReference, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB980](structureAllocator, bufferReference, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB988](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1F40DB998](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1F40DB9A0](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

Boolean CMBlockBufferIsRangeContiguous(CMBlockBufferRef theBuffer, size_t offset, size_t length)
{
  return MEMORY[0x1F40DB9C0](theBuffer, offset, length);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x1F40DB9C8](sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

uint64_t CMByteStreamCreateWritableForBlockBuffer()
{
  return MEMORY[0x1F40DBB00]();
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBB70](allocator, target, *(void *)&attachmentMode);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x1F40DBB80]();
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x1F40DBBB8](desc, extensionKey);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBBC0](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBC8](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBD0](desc);
}

CFTypeID CMFormatDescriptionGetTypeID(void)
{
  return MEMORY[0x1F40DBBD8]();
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1F40DBBF0](target, key, attachmentModeOut);
}

CMMemoryPoolRef CMMemoryPoolCreate(CFDictionaryRef options)
{
  return (CMMemoryPoolRef)MEMORY[0x1F40DBC08](options);
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x1F40DBCA8]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x1F40DBCB8]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x1F40DBCC0]();
}

uint64_t CMNotificationCenterRegisterForBarrierSupport()
{
  return MEMORY[0x1F40DBCC8]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x1F40DBCD8]();
}

void CMPropagateAttachments(CMAttachmentBearerRef source, CMAttachmentBearerRef destination)
{
}

OSStatus CMSampleBufferCallForEachSample(CMSampleBufferRef sbuf, OSStatus (__cdecl *callback)(CMSampleBufferRef, CMItemCount, void *), void *refcon)
{
  return MEMORY[0x1F40DBD18](sbuf, callback, refcon);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD30](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateReady(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD60](allocator, dataBuffer, formatDescription, numSamples, numSampleTimingEntries, sampleTimingArray, numSampleSizeEntries, sampleSizeArray);
}

Boolean CMSampleBufferDataIsReady(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBD80](sbuf);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1F40DBDA0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetDecodeTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDB0](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1F40DBDC0](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBDD0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDE0](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDE8](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDF8](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x1F40DBE00](sbuf, createIfNecessary);
}

size_t CMSampleBufferGetSampleSize(CMSampleBufferRef sbuf, CMItemIndex sampleIndex)
{
  return MEMORY[0x1F40DBE08](sbuf, sampleIndex);
}

OSStatus CMSampleBufferGetSampleSizeArray(CMSampleBufferRef sbuf, CMItemCount sizeArrayEntries, size_t *sizeArrayOut, CMItemCount *sizeArrayEntriesNeededOut)
{
  return MEMORY[0x1F40DBE10](sbuf, sizeArrayEntries, sizeArrayOut, sizeArrayEntriesNeededOut);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x1F40DBE18](sbuf, sampleIndex, timingInfoOut);
}

OSStatus CMSampleBufferGetSampleTimingInfoArray(CMSampleBufferRef sbuf, CMItemCount numSampleTimingEntries, CMSampleTimingInfo *timingArrayOut, CMItemCount *timingArrayEntriesNeededOut)
{
  return MEMORY[0x1F40DBE20](sbuf, numSampleTimingEntries, timingArrayOut, timingArrayEntriesNeededOut);
}

Boolean CMSampleBufferIsValid(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBE50](sbuf);
}

OSStatus CMSampleBufferSetDataBuffer(CMSampleBufferRef sbuf, CMBlockBufferRef dataBuffer)
{
  return MEMORY[0x1F40DBE60](sbuf, dataBuffer);
}

OSStatus CMSampleBufferSetDataReady(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBE78](sbuf);
}

OSStatus CMSampleBufferSetOutputPresentationTimeStamp(CMSampleBufferRef sbuf, CMTime *outputPresentationTimeStamp)
{
  return MEMORY[0x1F40DBE98](sbuf, outputPresentationTimeStamp);
}

uint64_t CMSessionCreate()
{
  return MEMORY[0x1F412C9B0]();
}

void CMSetAttachments(CMAttachmentBearerRef target, CFDictionaryRef theAttachments, CMAttachmentMode attachmentMode)
{
}

OSStatus CMTagCollectionCreate(CFAllocatorRef allocator, const CMTag *tags, CMItemCount tagCount, CMTagCollectionRef *newCollectionOut)
{
  return MEMORY[0x1F40DBF68](allocator, tags, tagCount, newCollectionOut);
}

OSStatus CMTagCollectionGetTagsWithCategory(CMTagCollectionRef tagCollection, CMTagCategory category, CMTag *tagBuffer, CMItemCount tagBufferCount, CMItemCount *numberOfTagsCopied)
{
  return MEMORY[0x1F40DBF90](tagCollection, *(void *)&category, tagBuffer, tagBufferCount, numberOfTagsCopied);
}

int64_t CMTagGetSInt64Value(CMTag tag)
{
  return MEMORY[0x1F40DBFD8](*(void *)&tag.category, tag.value);
}

CMTag CMTagMakeWithSInt64Value(CMTagCategory category, int64_t value)
{
  uint64_t v2 = MEMORY[0x1F40DC000](*(void *)&category, value);
  result.long long value = v3;
  result.category = v2;
  result.dataType = HIDWORD(v2);
  return result;
}

OSStatus CMTaggedBufferGroupCreate(CFAllocatorRef allocator, CFArrayRef tagCollections, CFArrayRef buffers, CMTaggedBufferGroupRef *groupOut)
{
  return MEMORY[0x1F40DC008](allocator, tagCollections, buffers, groupOut);
}

CVPixelBufferRef CMTaggedBufferGroupGetCVPixelBufferAtIndex(CMTaggedBufferGroupRef group, CFIndex index)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DC028](group, index);
}

CMItemCount CMTaggedBufferGroupGetCount(CMTaggedBufferGroupRef group)
{
  return MEMORY[0x1F40DC038](group);
}

CMTagCollectionRef CMTaggedBufferGroupGetTagCollectionAtIndex(CMTaggedBufferGroupRef group, CFIndex index)
{
  return (CMTagCollectionRef)MEMORY[0x1F40DC040](group, index);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC0E0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1F40DC0E8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC160](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC168](retstr, time1, time2);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1F40DC190](range, time);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1F40DC1B0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1B8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1C8](retstr, range, otherRange);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCopyAsBigEndianImageDescriptionBlockBuffer(CFAllocatorRef allocator, CMVideoFormatDescriptionRef videoFormatDescription, CFStringEncoding stringEncoding, CMImageDescriptionFlavor flavor, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DC2F0](allocator, videoFormatDescription, *(void *)&stringEncoding, flavor, blockBufferOut);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC300](allocator, *(void *)&codecType, *(void *)&width, *(void *)&height, extensions, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateFromBigEndianImageDescriptionBlockBuffer(CFAllocatorRef allocator, CMBlockBufferRef imageDescriptionBlockBuffer, CFStringEncoding stringEncoding, CMImageDescriptionFlavor flavor, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC310](allocator, imageDescriptionBlockBuffer, *(void *)&stringEncoding, flavor, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateFromHEVCParameterSets(CFAllocatorRef allocator, size_t parameterSetCount, const uint8_t *const *parameterSetPointers, const size_t *parameterSetSizes, int NALUnitHeaderLength, CFDictionaryRef extensions, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC328](allocator, parameterSetCount, parameterSetPointers, parameterSetSizes, *(void *)&NALUnitHeaderLength, extensions, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1F40DC338](videoDesc);
}

uint64_t CMVideoFormatDescriptionGetVideoDynamicRange()
{
  return MEMORY[0x1F40DC368]();
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1F40DFB48](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFB50](buffer, *(void *)&attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

void CVBufferRemoveAllAttachments(CVBufferRef buffer)
{
}

void CVBufferRemoveAttachment(CVBufferRef buffer, CFStringRef key)
{
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
}

int CVColorPrimariesGetIntegerCodePointForString(CFStringRef colorPrimariesString)
{
  return MEMORY[0x1F40DFBA8](colorPrimariesString);
}

CGColorSpaceRef CVImageBufferCreateColorSpaceFromAttachments(CFDictionaryRef attachments)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DFC18](attachments);
}

CGColorSpaceRef CVImageBufferGetColorSpace(CVImageBufferRef imageBuffer)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DFC28](imageBuffer);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1F40DFC78](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1F40DFC80](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1F40DFC98](image);
}

CFDictionaryRef CVPixelBufferCopyCreationAttributes(CVPixelBufferRef pixelBuffer)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFCD8](pixelBuffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateResolvedAttributesDictionary(CFAllocatorRef allocator, CFArrayRef attributes, CFDictionaryRef *resolvedDictionaryOut)
{
  return MEMORY[0x1F40DFCF0](allocator, attributes, resolvedDictionaryOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x1F40DFD20]();
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40DFD30](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD48](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD50](pixelBuffer);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD70](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD88](pixelBuffer);
}

CFTypeID CVPixelBufferGetTypeID(void)
{
  return MEMORY[0x1F40DFD90]();
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFDA0](pixelBuffer, planeIndex);
}

uint64_t CVPixelBufferIsCompatibleWithAttributes()
{
  return MEMORY[0x1F40DFDA8]();
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFDB0](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1F40DFDC0](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFDC8](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolFlush(CVPixelBufferPoolRef pool, CVPixelBufferPoolFlushFlags options)
{
}

uint64_t CVPixelBufferPoolGetMaxBufferAge()
{
  return MEMORY[0x1F40DFDE8]();
}

CFDictionaryRef CVPixelBufferPoolGetPixelBufferAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFDF0](pool);
}

CFTypeID CVPixelBufferPoolGetTypeID(void)
{
  return MEMORY[0x1F40DFDF8]();
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

CVPixelBufferPoolRef CVPixelBufferPoolRetain(CVPixelBufferPoolRef pixelBufferPool)
{
  return (CVPixelBufferPoolRef)MEMORY[0x1F40DFE18](pixelBufferPool);
}

uint64_t CVPixelBufferPoolSetMaxBufferAge()
{
  return MEMORY[0x1F40DFE28]();
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFE50](allocator, *(void *)&pixelFormat);
}

uint64_t CVPixelFormatDescriptionGetDescriptionWithPixelFormatType()
{
  return MEMORY[0x1F40DFE58]();
}

void CVPixelFormatDescriptionRegisterDescriptionWithPixelFormatType(CFDictionaryRef description, OSType pixelFormat)
{
}

int CVTransferFunctionGetIntegerCodePointForString(CFStringRef transferFunctionString)
{
  return MEMORY[0x1F40DFE78](transferFunctionString);
}

int CVYCbCrMatrixGetIntegerCodePointForString(CFStringRef yCbCrMatrixString)
{
  return MEMORY[0x1F40DFE88](yCbCrMatrixString);
}

CFStringRef CVYCbCrMatrixGetStringForIntegerCodePoint(int yCbCrMatrixCodePoint)
{
  return (CFStringRef)MEMORY[0x1F40DFE90](*(void *)&yCbCrMatrixCodePoint);
}

uint64_t CelestialShouldAllowHTPCIOSurfacesForHDRPlaybackToCA()
{
  return MEMORY[0x1F40DC3E8]();
}

uint64_t CelestialShouldSupportHDR10Plus()
{
  return MEMORY[0x1F40DC420]();
}

uint64_t CelestialShouldSupportHDRCodecs()
{
  return MEMORY[0x1F40DC428]();
}

uint64_t ColorSyncMakeProfile()
{
  return MEMORY[0x1F40D6550]();
}

CFDataRef ColorSyncProfileCopyHeader(ColorSyncProfileRef prof)
{
  return (CFDataRef)MEMORY[0x1F40D6568](prof);
}

ColorSyncMutableProfileRef ColorSyncProfileCreateMutableCopy(ColorSyncProfileRef prof)
{
  return (ColorSyncMutableProfileRef)MEMORY[0x1F40D6588](prof);
}

void ColorSyncProfileSetHeader(ColorSyncMutableProfileRef prof, CFDataRef header)
{
}

uint64_t FigAV1Bridge_CopyITU_T_T35MetadataDolbyVisionRPURawByteSequence()
{
  return MEMORY[0x1F40DC438]();
}

uint64_t FigAV1Bridge_CopyITU_T_T35MetadataHDR10PlusMetadata()
{
  return MEMORY[0x1F40DC440]();
}

uint64_t FigAtomStreamAdvanceToNextAtom()
{
  return MEMORY[0x1F40DC478]();
}

uint64_t FigAtomStreamGetCurrentAtomDataGlobalOffset()
{
  return MEMORY[0x1F40DC488]();
}

uint64_t FigAtomStreamGetCurrentAtomTypeAndDataLength()
{
  return MEMORY[0x1F40DC4A8]();
}

uint64_t FigAtomStreamInitWithBBuf()
{
  return MEMORY[0x1F40DC4C0]();
}

uint64_t FigAtomStreamInitWithParent()
{
  return MEMORY[0x1F40DC4E0]();
}

uint64_t FigAtomStreamReadCurrentAtomData()
{
  return MEMORY[0x1F40DC500]();
}

uint64_t FigAtomStreamReadCurrentAtomDataAndCreateBBuf()
{
  return MEMORY[0x1F40DC508]();
}

uint64_t FigAtomWriterAppendBlockBufferData()
{
  return MEMORY[0x1F40DC518]();
}

uint64_t FigAtomWriterAppendData()
{
  return MEMORY[0x1F40DC520]();
}

uint64_t FigAtomWriterBeginAtom()
{
  return MEMORY[0x1F40DC530]();
}

uint64_t FigAtomWriterEndAtom()
{
  return MEMORY[0x1F40DC540]();
}

uint64_t FigAtomWriterInitWithBlockBuffer()
{
  return MEMORY[0x1F40DC560]();
}

uint64_t FigAtomWriterInitWithByteStream()
{
  return MEMORY[0x1F40DC568]();
}

uint64_t FigAtomWriterInitWithParent()
{
  return MEMORY[0x1F40DC570]();
}

uint64_t FigAtomicCompareAndSwap32()
{
  return MEMORY[0x1F40DC590]();
}

uint64_t FigAtomicDecrement32()
{
  return MEMORY[0x1F40DC5A0]();
}

uint64_t FigAtomicIncrement32()
{
  return MEMORY[0x1F40DC5A8]();
}

uint64_t FigBaseClassRegisterClass()
{
  return MEMORY[0x1F40DC658]();
}

uint64_t FigCFArrayAppendDouble()
{
  return MEMORY[0x1F40DC7F8]();
}

uint64_t FigCFArrayAppendInt()
{
  return MEMORY[0x1F40DC808]();
}

uint64_t FigCFArrayAppendInt32()
{
  return MEMORY[0x1F40DC810]();
}

uint64_t FigCFArrayAppendInt64()
{
  return MEMORY[0x1F40DC818]();
}

uint64_t FigCFArrayContainsInt()
{
  return MEMORY[0x1F40DC830]();
}

uint64_t FigCFArrayContainsValue()
{
  return MEMORY[0x1F40DC848]();
}

uint64_t FigCFArrayCreateMutableCopy()
{
  return MEMORY[0x1F40DC870]();
}

uint64_t FigCFArrayGetFirstValue()
{
  return MEMORY[0x1F40DC8B0]();
}

uint64_t FigCFArrayGetInt16AtIndex()
{
  return MEMORY[0x1F40DC8C8]();
}

uint64_t FigCFArrayGetInt32AtIndex()
{
  return MEMORY[0x1F40DC8D0]();
}

uint64_t FigCFArrayGetInt64AtIndex()
{
  return MEMORY[0x1F40DC8D8]();
}

uint64_t FigCFArrayGetIntAtIndex()
{
  return MEMORY[0x1F40DC8E0]();
}

uint64_t FigCFArrayGetValueAtIndex()
{
  return MEMORY[0x1F40DC8F0]();
}

uint64_t FigCFCopyCompactDescription()
{
  return MEMORY[0x1F40DC918]();
}

uint64_t FigCFCreateCombinedDictionary()
{
  return MEMORY[0x1F40DC928]();
}

uint64_t FigCFDictionaryCopyArrayOfKeys()
{
  return MEMORY[0x1F40DC950]();
}

uint64_t FigCFDictionaryCreateCopyRemovingKeys()
{
  return MEMORY[0x1F40DC960]();
}

uint64_t FigCFDictionaryCreateMutableCopy()
{
  return MEMORY[0x1F40DC970]();
}

uint64_t FigCFDictionaryCreateMutableCopyWithCFTypeCallbacks()
{
  return MEMORY[0x1F40DC978]();
}

uint64_t FigCFDictionaryGetArrayValue()
{
  return MEMORY[0x1F40DC980]();
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return MEMORY[0x1F40DC988]();
}

uint64_t FigCFDictionaryGetBooleanValue()
{
  return MEMORY[0x1F40DC990]();
}

uint64_t FigCFDictionaryGetCGFloatIfPresent()
{
  return MEMORY[0x1F40DC9A0]();
}

uint64_t FigCFDictionaryGetCount()
{
  return MEMORY[0x1F40DC9C8]();
}

uint64_t FigCFDictionaryGetFloat32IfPresent()
{
  return MEMORY[0x1F40DC9E8]();
}

uint64_t FigCFDictionaryGetFloatIfPresent()
{
  return MEMORY[0x1F40DC9F0]();
}

uint64_t FigCFDictionaryGetInt16IfPresent()
{
  return MEMORY[0x1F40DC9F8]();
}

uint64_t FigCFDictionaryGetInt32IfPresent()
{
  return MEMORY[0x1F40DCA00]();
}

uint64_t FigCFDictionaryGetInt64IfPresent()
{
  return MEMORY[0x1F40DCA08]();
}

uint64_t FigCFDictionaryGetIntIfPresent()
{
  return MEMORY[0x1F40DCA10]();
}

uint64_t FigCFDictionaryGetStringValue()
{
  return MEMORY[0x1F40DCA28]();
}

uint64_t FigCFDictionaryGetValue()
{
  return MEMORY[0x1F40DCA38]();
}

uint64_t FigCFDictionaryGetValueForCaseInsensitiveKeyIfPresent()
{
  return MEMORY[0x1F40DCA40]();
}

uint64_t FigCFDictionaryGetValueIfPresent()
{
  return MEMORY[0x1F40DCA48]();
}

uint64_t FigCFDictionarySetBoolean()
{
  return MEMORY[0x1F40DCA60]();
}

uint64_t FigCFDictionarySetCFIndex()
{
  return MEMORY[0x1F40DCA68]();
}

uint64_t FigCFDictionarySetCGFloat()
{
  return MEMORY[0x1F40DCA70]();
}

uint64_t FigCFDictionarySetDouble()
{
  return MEMORY[0x1F40DCA98]();
}

uint64_t FigCFDictionarySetFloat()
{
  return MEMORY[0x1F40DCAA0]();
}

uint64_t FigCFDictionarySetFloat32()
{
  return MEMORY[0x1F40DCAA8]();
}

uint64_t FigCFDictionarySetInt()
{
  return MEMORY[0x1F40DCAB0]();
}

uint64_t FigCFDictionarySetInt32()
{
  return MEMORY[0x1F40DCAC0]();
}

uint64_t FigCFDictionarySetInt64()
{
  return MEMORY[0x1F40DCAC8]();
}

uint64_t FigCFDictionarySetValue()
{
  return MEMORY[0x1F40DCAE8]();
}

uint64_t FigCFDictionarySetValueFromKeyInDict()
{
  return MEMORY[0x1F40DCAF0]();
}

uint64_t FigCFEqual()
{
  return MEMORY[0x1F40DCAF8]();
}

uint64_t FigCFNumberCreateFloat32()
{
  return MEMORY[0x1F40DCB18]();
}

uint64_t FigCFNumberCreateFloat64()
{
  return MEMORY[0x1F40DCB20]();
}

uint64_t FigCFNumberCreateSInt32()
{
  return MEMORY[0x1F40DCB30]();
}

uint64_t FigCFNumberCreateSInt64()
{
  return MEMORY[0x1F40DCB38]();
}

uint64_t FigCFNumberCreateUInt32()
{
  return MEMORY[0x1F40DCB50]();
}

uint64_t FigCFNumberCreateUInt64()
{
  return MEMORY[0x1F40DCB58]();
}

uint64_t FigCFNumberGetFloat32()
{
  return MEMORY[0x1F40DCB68]();
}

uint64_t FigCFNumberGetSInt32()
{
  return MEMORY[0x1F40DCB78]();
}

uint64_t FigCFNumberGetUInt32()
{
  return MEMORY[0x1F40DCB90]();
}

uint64_t FigCFNumberGetUInt64()
{
  return MEMORY[0x1F40DCB98]();
}

uint64_t FigCFStringGetCStringPtrAndBufferToFree()
{
  return MEMORY[0x1F40DCC20]();
}

uint64_t FigCFURLCreateFromTemporaryFileWithDirectory()
{
  return MEMORY[0x1F40DCC60]();
}

uint64_t FigCFWeakReferenceDestroy()
{
  return MEMORY[0x1F40DCC98]();
}

uint64_t FigCFWeakReferenceHolderCopyReferencedObject()
{
  return MEMORY[0x1F40DCCA0]();
}

uint64_t FigCFWeakReferenceHolderCreateWithReferencedObject()
{
  return MEMORY[0x1F40DCCA8]();
}

uint64_t FigCFWeakReferenceInit()
{
  return MEMORY[0x1F40DCCB8]();
}

uint64_t FigCFWeakReferenceLoadAndRetain()
{
  return MEMORY[0x1F40DCCC0]();
}

uint64_t FigCFWeakReferenceStore()
{
  return MEMORY[0x1F40DCCC8]();
}

uint64_t FigCFWeakReferenceTableRemoveValue()
{
  return MEMORY[0x1F40DCD00]();
}

uint64_t FigCopyCommonMemoryPool()
{
  return MEMORY[0x1F40DCFB0]();
}

uint64_t FigCreateBytesFromCFString()
{
  return MEMORY[0x1F40DD018]();
}

uint64_t FigCreateCFDataFromCFPropertyList()
{
  return MEMORY[0x1F40DD038]();
}

uint64_t FigCreateCFPropertyListFromData()
{
  return MEMORY[0x1F40DD048]();
}

uint64_t FigCreateModelSpecificPropertyList()
{
  return MEMORY[0x1F40DD068]();
}

uint64_t FigDebugIsInternalBuild()
{
  return MEMORY[0x1F40DD2D8]();
}

uint64_t FigDispatchAsyncPostNotification()
{
  return MEMORY[0x1F40DD370]();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return MEMORY[0x1F40DD3A8]();
}

uint64_t FigDispatchQueueCreateWithPriorityAndClientPID()
{
  return MEMORY[0x1F40DD3B0]();
}

uint64_t FigDispatchQueueSetPriorityAndClientPID()
{
  return MEMORY[0x1F40DD3D0]();
}

uint64_t FigFileDeleteFile()
{
  return MEMORY[0x1F40DD648]();
}

uint64_t FigFileDoesFileExist()
{
  return MEMORY[0x1F40DD658]();
}

uint64_t FigFileForkClose()
{
  return MEMORY[0x1F40DD660]();
}

uint64_t FigFileForkOpenMainByCFURL()
{
  return MEMORY[0x1F40DD670]();
}

uint64_t FigFileForkRead()
{
  return MEMORY[0x1F40DD678]();
}

uint64_t FigFileForkWrite()
{
  return MEMORY[0x1F40DD688]();
}

uint64_t FigFileGetFileInfo()
{
  return MEMORY[0x1F40DD6A0]();
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x1F40DD700]();
}

uint64_t FigFormatDescriptionRetain()
{
  return MEMORY[0x1F40DD708]();
}

uint64_t FigGetAllocatorForPermanentAllocations()
{
  return MEMORY[0x1F40DD828]();
}

uint64_t FigGetCFPreferenceBooleanWithDefault()
{
  return MEMORY[0x1F40DD840]();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return MEMORY[0x1F40DD858]();
}

uint64_t FigGetUpTimeNanoseconds()
{
  return MEMORY[0x1F40DD8D0]();
}

uint64_t FigH264Bridge_CopyDataWithEmulationPreventionBytesRemoved()
{
  return MEMORY[0x1F40DD908]();
}

uint64_t FigHEVCBridge_AllocThreeDimensionalReferenceDisplaysInfo()
{
  return MEMORY[0x1F40DDA10]();
}

uint64_t FigHEVCBridge_CreateAlphaInfoSEI()
{
  return MEMORY[0x1F40DDA18]();
}

uint64_t FigHEVCBridge_CreateAmbientViewingEnvironmentSEINAL()
{
  return MEMORY[0x1F40DDA20]();
}

uint64_t FigHEVCBridge_CreateFormatDescriptionWithSelectedLayersFromMultiviewMuxedAlphaFormatDescription()
{
  return MEMORY[0x1F40DDA30]();
}

uint64_t FigHEVCBridge_CreateMultiviewMuxedAlphaDataBuffer()
{
  return MEMORY[0x1F40DDA40]();
}

uint64_t FigHEVCBridge_CreateMultiviewMuxedAlphaFormatDescription()
{
  return MEMORY[0x1F40DDA48]();
}

uint64_t FigHEVCBridge_CreateMuxedAlphaDataBuffer()
{
  return MEMORY[0x1F40DDA50]();
}

uint64_t FigHEVCBridge_CreateMuxedAlphaFormatDescription()
{
  return MEMORY[0x1F40DDA58]();
}

uint64_t FigHEVCBridge_CreateSelectedLayerFormatDescriptionFromMuxedAlphaFormatDescription()
{
  return MEMORY[0x1F40DDA60]();
}

uint64_t FigHEVCBridge_CreateThreeDimensionalReferenceDisplaysInfoSEI()
{
  return MEMORY[0x1F40DDA68]();
}

uint64_t FigHEVCBridge_GetHEVCParameterSetAtIndex()
{
  return MEMORY[0x1F40DDA70]();
}

uint64_t FigHEVCBridge_GetSPSChromaFormatAndBitDepths()
{
  return MEMORY[0x1F40DDA80]();
}

uint64_t FigHEVCBridge_GetSPSProfileTierLevel()
{
  return MEMORY[0x1F40DDA88]();
}

uint64_t FigHEVCBridge_GetVPSAlphaChannelNuhLayerId()
{
  return MEMORY[0x1F40DDAA0]();
}

uint64_t FigHEVCBridge_ParseMuxedAlphaFrameAndWriteSelectedLayerIDsNALUnitsToBuffer()
{
  return MEMORY[0x1F40DDAA8]();
}

uint64_t FigHEVCBridge_WritePaddingNALU()
{
  return MEMORY[0x1F40DDAB0]();
}

uint64_t FigInMemoryDeserializerCopyCFDictionary()
{
  return MEMORY[0x1F40DDAC0]();
}

uint64_t FigInMemoryDeserializerCopyCMSampleBuffer()
{
  return MEMORY[0x1F40DDAE8]();
}

uint64_t FigInMemorySerializerAppendCFDictionary()
{
  return MEMORY[0x1F40DDAF0]();
}

uint64_t FigInMemorySerializerAppendCMSampleBuffer()
{
  return MEMORY[0x1F40DDB18]();
}

uint64_t FigIsHDRAllowedOnDevice()
{
  return MEMORY[0x1F40DDB38]();
}

uint64_t FigIsSecTaskGPUExtensionOfBrowserEngine()
{
  return MEMORY[0x1F40DDB60]();
}

uint64_t FigKTraceInit()
{
  return MEMORY[0x1F40DDB70]();
}

uint64_t FigMachPortReleaseSendRight_()
{
  return MEMORY[0x1F40DDB88]();
}

uint64_t FigMemoryBarrier()
{
  return MEMORY[0x1F40DDBB0]();
}

uint64_t FigMemoryOriginUpdateRecipientStateFromIPCMessageData()
{
  return MEMORY[0x1F40DDBD0]();
}

uint64_t FigMemoryOriginUpdateRecipientStateFromXPCMessage()
{
  return MEMORY[0x1F40DDBD8]();
}

uint64_t FigMemoryPoolCreateBlockBufferWithOptions()
{
  return MEMORY[0x1F40DDBF8]();
}

uint64_t FigMemoryRecipientAppendRecipientStateUpdateToIPCMessageData()
{
  return MEMORY[0x1F40DDC10]();
}

uint64_t FigMemoryRecipientAppendRecipientStateUpdateToXPCMessage()
{
  return MEMORY[0x1F40DDC18]();
}

uint64_t FigNote_AllowInternalDefaultLogs()
{
  return MEMORY[0x1F40DDD50]();
}

uint64_t FigNotificationCenterAddWeakListener()
{
  return MEMORY[0x1F40DDD90]();
}

uint64_t FigNotificationCenterRemoveWeakListener()
{
  return MEMORY[0x1F40DDDB0]();
}

uint64_t FigOSEventLinkRemoteFillMessageBufferThenSendItAndHandleReply()
{
  return MEMORY[0x1F40DDDC0]();
}

uint64_t FigOSEventLinkRemoteInvalidate()
{
  return MEMORY[0x1F40DDDC8]();
}

uint64_t FigOSEventLinkRemoteSetMessageHandlingThreadFigThreadPriority()
{
  return MEMORY[0x1F40DDDD0]();
}

uint64_t FigOSEventLinkRemoteSetMessageHandlingThreadMachThreadPriority()
{
  return MEMORY[0x1F40DDDD8]();
}

uint64_t FigOSEventLinkServerGetAssociatedFigXPCServerXPCConnection()
{
  return MEMORY[0x1F40DDDE0]();
}

uint64_t FigOSEventLinkServerSetCallbacks()
{
  return MEMORY[0x1F40DDDE8]();
}

uint64_t FigOSTransactionCreate()
{
  return MEMORY[0x1F40DDDF8]();
}

uint64_t FigOSTransactionCreateWithProcessName()
{
  return MEMORY[0x1F40DDE00]();
}

uint64_t FigPixelBufferOriginAppendPixelBufferToIPCMessageData()
{
  return MEMORY[0x1F40DDE10]();
}

uint64_t FigPixelBufferOriginBeginEstablishingPixelBufferRecipientByFillingInXPCMessage1()
{
  return MEMORY[0x1F40DDE18]();
}

uint64_t FigPixelBufferOriginCompleteEstablishingPixelBufferRecipientUsingXPCMessage2()
{
  return MEMORY[0x1F40DDE20]();
}

uint64_t FigPixelBufferOriginGetObjectID()
{
  return MEMORY[0x1F40DDE28]();
}

uint64_t FigPixelBufferOriginSetPixelBufferInXPCMessage()
{
  return MEMORY[0x1F40DDE38]();
}

uint64_t FigPixelBufferRecipientCopyPixelBufferFromIPCMessageData()
{
  return MEMORY[0x1F40DDE48]();
}

uint64_t FigPixelBufferRecipientCopyPixelBufferFromXPCMessage()
{
  return MEMORY[0x1F40DDE50]();
}

uint64_t FigPixelBufferRecipientCreateWithXPCMessage1AndUpdateXPCMessage2()
{
  return MEMORY[0x1F40DDE60]();
}

uint64_t FigPlaybackLogPowerEvent()
{
  return MEMORY[0x1F40DDE70]();
}

uint64_t FigPowerReduceUtilitySFI()
{
  return MEMORY[0x1F40DDE80]();
}

uint64_t FigPriorityQueueCreate()
{
  return MEMORY[0x1F40DDE98]();
}

uint64_t FigPriorityQueueGetItem()
{
  return MEMORY[0x1F40DDEA0]();
}

uint64_t FigPriorityQueueInsertItemAndCreateUpdateToken()
{
  return MEMORY[0x1F40DDEA8]();
}

uint64_t FigPriorityQueueRemoveItem()
{
  return MEMORY[0x1F40DDEB0]();
}

uint64_t FigPriorityQueueTokenUpdatePriority()
{
  return MEMORY[0x1F40DDEB8]();
}

uint64_t FigProcessInfoCreateWithDetails()
{
  return MEMORY[0x1F40DDEC0]();
}

uint64_t FigRPCCreateClientConnection()
{
  return MEMORY[0x1F40DDEF0]();
}

uint64_t FigRPCCreateRemoteClient()
{
  return MEMORY[0x1F40DDF00]();
}

uint64_t FigRPCCreateServerConnectionForObject()
{
  return MEMORY[0x1F40DDF08]();
}

uint64_t FigRPCCreateServerConnectionForObjectUsingMachChannel()
{
  return MEMORY[0x1F40DDF10]();
}

uint64_t FigRPCDisposeClientConnection()
{
  return MEMORY[0x1F40DDF18]();
}

uint64_t FigRPCDisposeServerConnection()
{
  return MEMORY[0x1F40DDF20]();
}

uint64_t FigRPCExecuteByServerAsync()
{
  return MEMORY[0x1F40DDF28]();
}

uint64_t FigRPCFetchNextPendingNotification()
{
  return MEMORY[0x1F40DDF30]();
}

uint64_t FigRPCGetConnectionInfo()
{
  return MEMORY[0x1F40DDF38]();
}

uint64_t FigRPCGetServerConnectionInfo()
{
  return MEMORY[0x1F40DDF40]();
}

uint64_t FigRPCKillServerOnTimeout()
{
  return MEMORY[0x1F40DDF48]();
}

uint64_t FigRPCLookupClientConnection()
{
  return MEMORY[0x1F40DDF50]();
}

uint64_t FigReadWriteLockCreate()
{
  return MEMORY[0x1F40DDF70]();
}

uint64_t FigReadWriteLockDestroy()
{
  return MEMORY[0x1F40DDF78]();
}

uint64_t FigReadWriteLockLockForRead()
{
  return MEMORY[0x1F40DDF80]();
}

uint64_t FigReadWriteLockLockForWrite()
{
  return MEMORY[0x1F40DDF88]();
}

uint64_t FigReadWriteLockUnlockForRead()
{
  return MEMORY[0x1F40DDF90]();
}

uint64_t FigReadWriteLockUnlockForWrite()
{
  return MEMORY[0x1F40DDF98]();
}

uint64_t FigReentrantMutexCreate()
{
  return MEMORY[0x1F40DDFA0]();
}

uint64_t FigReentrantMutexDestroy()
{
  return MEMORY[0x1F40DDFA8]();
}

uint64_t FigReentrantMutexLock()
{
  return MEMORY[0x1F40DDFB0]();
}

uint64_t FigReentrantMutexUnlock()
{
  return MEMORY[0x1F40DDFC0]();
}

uint64_t FigRegistryAddItem()
{
  return MEMORY[0x1F40DDFC8]();
}

uint64_t FigRegistryAddSearchPathWithOptions()
{
  return MEMORY[0x1F40DDFD0]();
}

uint64_t FigRegistryCopyFilteredItemList()
{
  return MEMORY[0x1F40DDFD8]();
}

uint64_t FigRegistryCopyItemList()
{
  return MEMORY[0x1F40DDFE0]();
}

uint64_t FigRegistryCreate()
{
  return MEMORY[0x1F40DDFE8]();
}

uint64_t FigRegistryItemCopyBundle()
{
  return MEMORY[0x1F40DDFF0]();
}

uint64_t FigRegistryItemCopyDescription()
{
  return MEMORY[0x1F40DDFF8]();
}

uint64_t FigRegistryItemCopyMatchingInfo()
{
  return MEMORY[0x1F40DE000]();
}

uint64_t FigRegistryItemCreateCopy2()
{
  return MEMORY[0x1F40DE008]();
}

uint64_t FigRegistryItemGetFactory()
{
  return MEMORY[0x1F40DE010]();
}

uint64_t FigRegistryRemoveItem()
{
  return MEMORY[0x1F40DE018]();
}

uint64_t FigRegistryRescan()
{
  return MEMORY[0x1F40DE020]();
}

uint64_t FigRemote_CreateBinaryPListData()
{
  return MEMORY[0x1F40DE028]();
}

uint64_t FigRemote_CreateFormatDescriptionArrayFromSerializedAtomData()
{
  return MEMORY[0x1F40DE038]();
}

uint64_t FigRemote_CreatePixelBufferFromSerializedAtomData()
{
  return MEMORY[0x1F40DE068]();
}

uint64_t FigRemote_CreatePropertyListFromBinaryPListData()
{
  return MEMORY[0x1F40DE078]();
}

uint64_t FigRemote_CreateSampleBufferFromSerializedAtomData()
{
  return MEMORY[0x1F40DE090]();
}

uint64_t FigRemote_CreateSerializedAtomDataForFormatDescriptions()
{
  return MEMORY[0x1F40DE0F0]();
}

uint64_t FigRemote_CreateSerializedAtomDataForPixelBuffer()
{
  return MEMORY[0x1F40DE0F8]();
}

uint64_t FigRemote_CreateSerializedAtomDataForSampleBuffer()
{
  return MEMORY[0x1F40DE100]();
}

uint64_t FigRemote_CreateSerializedAtomDataForSampleBufferWithOptions()
{
  return MEMORY[0x1F40DE108]();
}

uint64_t FigRemote_GetServerTimeoutToken()
{
  return MEMORY[0x1F40DE120]();
}

uint64_t FigSampleBufferCreateCopyWithNewFormatDescription()
{
  return MEMORY[0x1F40DE1E0]();
}

uint64_t FigSampleBufferCreateCopyWithNewSizesAndDataBuffer()
{
  return MEMORY[0x1F40DE1E8]();
}

uint64_t FigSampleBufferGetDecryptor()
{
  return MEMORY[0x1F40DE210]();
}

uint64_t FigSampleBufferSetDecryptor()
{
  return MEMORY[0x1F40DE230]();
}

uint64_t FigSemaphoreCreate()
{
  return MEMORY[0x1F40DE298]();
}

uint64_t FigSemaphoreDestroy()
{
  return MEMORY[0x1F40DE2A0]();
}

uint64_t FigSemaphoreSignal()
{
  return MEMORY[0x1F40DE2A8]();
}

uint64_t FigSemaphoreWaitRelative()
{
  return MEMORY[0x1F40DE2B0]();
}

uint64_t FigServer_GetClientPIDFromAuditToken()
{
  return MEMORY[0x1F40DE2C0]();
}

uint64_t FigServer_IsMediaplaybackd()
{
  return MEMORY[0x1F40DE2E8]();
}

uint64_t FigServer_IsServerProcess()
{
  return MEMORY[0x1F40DE2F8]();
}

uint64_t FigServer_IsVideoDecodeService()
{
  return MEMORY[0x1F40DE300]();
}

uint64_t FigServer_IsVideocodecd()
{
  return MEMORY[0x1F40DE308]();
}

uint64_t FigServer_RememberProcessInfoForAFewSeconds()
{
  return MEMORY[0x1F40DE318]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x1F40DE320]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x1F40DE340]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x1F40DE348]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x1F40DE350]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x1F40DE360]();
}

uint64_t FigStartForwardingMediaServicesProcessDeathNotification()
{
  return MEMORY[0x1F40DE388]();
}

uint64_t FigStartMonitoringMediaServicesProcessDeath()
{
  return MEMORY[0x1F40DE390]();
}

uint64_t FigStopForwardingMediaServicesProcessDeathNotification()
{
  return MEMORY[0x1F40DE398]();
}

uint64_t FigStopMonitoringMediaServicesProcessDeath()
{
  return MEMORY[0x1F40DE3A0]();
}

uint64_t FigTagCollectionCopyAsData()
{
  return MEMORY[0x1F40DE3F0]();
}

uint64_t FigTagCollectionCreate()
{
  return MEMORY[0x1F40DE410]();
}

uint64_t FigTagCollectionCreateFromData()
{
  return MEMORY[0x1F40DE420]();
}

uint64_t FigTagCollectionGetTagsWithCategory()
{
  return MEMORY[0x1F40DE458]();
}

uint64_t FigTagCollectionGetTypeID()
{
  return MEMORY[0x1F40DE460]();
}

uint64_t FigTagGetSInt64Value()
{
  return MEMORY[0x1F40DE498]();
}

uint64_t FigTagMakeWithSInt64Value()
{
  return MEMORY[0x1F40DE4B0]();
}

uint64_t FigTaggedBufferGroupCreate()
{
  return MEMORY[0x1F40DE4B8]();
}

uint64_t FigTaggedBufferGroupGetCMSampleBufferAtIndex()
{
  return MEMORY[0x1F40DE4C0]();
}

uint64_t FigTaggedBufferGroupGetCVPixelBufferAtIndex()
{
  return MEMORY[0x1F40DE4C8]();
}

uint64_t FigTaggedBufferGroupGetCount()
{
  return MEMORY[0x1F40DE4D8]();
}

uint64_t FigTaggedBufferGroupGetTagCollectionAtIndex()
{
  return MEMORY[0x1F40DE4E0]();
}

uint64_t FigThreadCreate()
{
  return MEMORY[0x1F40DE598]();
}

uint64_t FigThreadGetCurrent()
{
  return MEMORY[0x1F40DE5A0]();
}

uint64_t FigThreadGetMaxLogicalCoreCount()
{
  return MEMORY[0x1F40DE5C8]();
}

uint64_t FigThreadJoin()
{
  return MEMORY[0x1F40DE5D8]();
}

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x1F40DE5F0]();
}

uint64_t FigThreadSetProperty()
{
  return MEMORY[0x1F40DE5F8]();
}

uint64_t FigUSleep()
{
  return MEMORY[0x1F40DE7C0]();
}

uint64_t FigVideoFormatDescriptionConformsToDolbyVisionProfile10p0()
{
  return MEMORY[0x1F40DE7F8]();
}

uint64_t FigVideoFormatDescriptionConformsToDolbyVisionProfile10p4()
{
  return MEMORY[0x1F40DE800]();
}

uint64_t FigVideoFormatDescriptionConformsToDolbyVisionProfile81()
{
  return MEMORY[0x1F40DE808]();
}

uint64_t FigVideoFormatDescriptionConformsToDolbyVisionProfile84()
{
  return MEMORY[0x1F40DE810]();
}

uint64_t FigVideoFormatDescriptionContainsAlphaChannel()
{
  return MEMORY[0x1F40DE818]();
}

uint64_t FigVideoFormatDescriptionContainsHDR()
{
  return MEMORY[0x1F40DE820]();
}

uint64_t FigVideoFormatDescriptionContainsStereoMultiviewVideo()
{
  return MEMORY[0x1F40DE828]();
}

uint64_t FigVideoFormatDescriptionCopyFigTagCollectionArrayWithExtraChannels()
{
  return MEMORY[0x1F40DE838]();
}

uint64_t FigVideoFormatDescriptionCreateUpdatedHVCCWithAdditionalHEVCParameterSets()
{
  return MEMORY[0x1F40DE848]();
}

uint64_t FigVideoFormatDescriptionDetermineCompatibilityWithCoreMediaRequirementsForHEVCWithAlpha()
{
  return MEMORY[0x1F40DE858]();
}

uint64_t FigXPCConnectionCreateAssociatedEventLink()
{
  return MEMORY[0x1F40DE8F8]();
}

uint64_t FigXPCCreateBasicMessage()
{
  return MEMORY[0x1F40DE950]();
}

uint64_t FigXPCMessageAddCMSampleBufferForPID()
{
  return MEMORY[0x1F40DE990]();
}

uint64_t FigXPCMessageCopyCFData()
{
  return MEMORY[0x1F40DE9B8]();
}

uint64_t FigXPCMessageCopyCFDictionary()
{
  return MEMORY[0x1F40DE9C8]();
}

uint64_t FigXPCMessageCopyCFObject()
{
  return MEMORY[0x1F40DE9E0]();
}

uint64_t FigXPCMessageCopyCFString()
{
  return MEMORY[0x1F40DE9E8]();
}

uint64_t FigXPCMessageCopyCMSampleBufferWithLastCryptor()
{
  return MEMORY[0x1F40DEA00]();
}

uint64_t FigXPCMessageCopyFormatDescription()
{
  return MEMORY[0x1F40DEA20]();
}

uint64_t FigXPCMessageGetCMTime()
{
  return MEMORY[0x1F40DEA68]();
}

uint64_t FigXPCMessageGetOpCode()
{
  return MEMORY[0x1F40DEA90]();
}

uint64_t FigXPCMessageSetCFData()
{
  return MEMORY[0x1F40DEAC8]();
}

uint64_t FigXPCMessageSetCFDictionary()
{
  return MEMORY[0x1F40DEAD8]();
}

uint64_t FigXPCMessageSetCFObject()
{
  return MEMORY[0x1F40DEAF0]();
}

uint64_t FigXPCMessageSetCFString()
{
  return MEMORY[0x1F40DEAF8]();
}

uint64_t FigXPCMessageSetCMTime()
{
  return MEMORY[0x1F40DEB08]();
}

uint64_t FigXPCMessageSetFormatDescription()
{
  return MEMORY[0x1F40DEB30]();
}

uint64_t FigXPCMessageSetInt32()
{
  return MEMORY[0x1F40DEB40]();
}

uint64_t FigXPCRelease()
{
  return MEMORY[0x1F40DEB78]();
}

uint64_t FigXPCRemoteClientAssociateObject()
{
  return MEMORY[0x1F40DEB80]();
}

uint64_t FigXPCRemoteClientCopyMemoryOrigin()
{
  return MEMORY[0x1F40DEB88]();
}

uint64_t FigXPCRemoteClientCopyMemoryRecipient()
{
  return MEMORY[0x1F40DEB90]();
}

uint64_t FigXPCRemoteClientCopyPrimaryConnection()
{
  return MEMORY[0x1F40DEB98]();
}

uint64_t FigXPCRemoteClientCreate()
{
  return MEMORY[0x1F40DEBA0]();
}

uint64_t FigXPCRemoteClientDisassociateObject()
{
  return MEMORY[0x1F40DEBB8]();
}

uint64_t FigXPCRemoteClientGetServerPID()
{
  return MEMORY[0x1F40DEBC8]();
}

uint64_t FigXPCRemoteClientLookupAndRetainAssociatedObject()
{
  return MEMORY[0x1F40DEBD8]();
}

uint64_t FigXPCRemoteClientSendAsyncMessage()
{
  return MEMORY[0x1F40DEBE8]();
}

uint64_t FigXPCRemoteClientSendSyncMessage()
{
  return MEMORY[0x1F40DEBF0]();
}

uint64_t FigXPCRemoteClientSendSyncMessageCreatingReply()
{
  return MEMORY[0x1F40DEBF8]();
}

uint64_t FigXPCRetain()
{
  return MEMORY[0x1F40DEC08]();
}

uint64_t FigXPCServerAssociateObjectWithConnection()
{
  return MEMORY[0x1F40DEC40]();
}

uint64_t FigXPCServerCopyMemoryOrigin()
{
  return MEMORY[0x1F40DEC60]();
}

uint64_t FigXPCServerCopyMemoryRecipient()
{
  return MEMORY[0x1F40DEC68]();
}

uint64_t FigXPCServerCreateAssociatedEventLinkForConnection()
{
  return MEMORY[0x1F40DEC78]();
}

uint64_t FigXPCServerDisassociateObjectWithConnection()
{
  return MEMORY[0x1F40DEC80]();
}

uint64_t FigXPCServerGetConnectionRefcon()
{
  return MEMORY[0x1F40DEC98]();
}

uint64_t FigXPCServerLookupAndRetainAssociatedObject()
{
  return MEMORY[0x1F40DECA0]();
}

uint64_t FigXPCServerLookupAndRetainAssociatedObjectAndCFTypeRefcon()
{
  return MEMORY[0x1F40DECA8]();
}

uint64_t FigXPCServerSetConnectionRefcon()
{
  return MEMORY[0x1F40DECC0]();
}

uint64_t FigXPCServerStart()
{
  return MEMORY[0x1F40DECC8]();
}

uint64_t FigXPCServerStartWithClientXPCConnection()
{
  return MEMORY[0x1F40DECD0]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntryGetProperty(io_registry_entry_t entry, const io_name_t propertyName, io_struct_inband_t buffer, uint32_t *size)
{
  return MEMORY[0x1F40E91E8](*(void *)&entry, propertyName, buffer, size);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9278](name);
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1F4124C48]();
}

uint64_t IOSurfaceAcceleratorGetHistogram()
{
  return MEMORY[0x1F4124C50]();
}

uint64_t IOSurfaceAcceleratorSetCustomFilter()
{
  return MEMORY[0x1F4124C68]();
}

uint64_t IOSurfaceAcceleratorTransferSurface()
{
  return MEMORY[0x1F4124C70]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x1F4124C78]();
}

uint64_t IOSurfaceBindAccel()
{
  return MEMORY[0x1F40E92E8]();
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E9300](buffer, key);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1F40E9328](aSurface);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane()
{
  return MEMORY[0x1F40E9360]();
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane()
{
  return MEMORY[0x1F40E9370]();
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x1F40E9388]();
}

size_t IOSurfaceGetBytesPerElementOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E93A0](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E93A8](buffer);
}

uint64_t IOSurfaceGetBytesPerRowOfCompressedTileHeaderGroupsOfPlane()
{
  return MEMORY[0x1F40E93B0]();
}

uint64_t IOSurfaceGetBytesPerRowOfTileDataOfPlane()
{
  return MEMORY[0x1F40E93C0]();
}

uint64_t IOSurfaceGetCompressedTileHeightOfPlane()
{
  return MEMORY[0x1F40E93E0]();
}

uint64_t IOSurfaceGetCompressedTileWidthOfPlane()
{
  return MEMORY[0x1F40E93E8]();
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return MEMORY[0x1F40E93F0]();
}

uint64_t IOSurfaceGetDataProperty()
{
  return MEMORY[0x1F40E93F8]();
}

uint64_t IOSurfaceGetHTPCVerticalHeaderGroupingModeOfPlane()
{
  return MEMORY[0x1F40E9438]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

uint64_t IOSurfaceGetHeightInCompressedTilesOfPlane()
{
  return MEMORY[0x1F40E9448]();
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9460](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9480](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9488](buffer);
}

uint64_t IOSurfaceGetProhibitUseCount()
{
  return MEMORY[0x1F40E9490]();
}

uint64_t IOSurfaceGetProtectionOptions()
{
  return MEMORY[0x1F40E94A8]();
}

uint64_t IOSurfaceGetSizeOfPlane()
{
  return MEMORY[0x1F40E94C8]();
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

uint64_t IOSurfaceGetWidthInCompressedTilesOfPlane()
{
  return MEMORY[0x1F40E9500]();
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9560](xobj);
}

uint64_t IOSurfaceNeedsBindAccel()
{
  return MEMORY[0x1F40E9568]();
}

uint64_t IOSurfaceSetBulkAttachments2()
{
  return MEMORY[0x1F40E95A0]();
}

uint64_t IOSurfaceSetDataProperty()
{
  return MEMORY[0x1F40E95B0]();
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

uint64_t IOSurfaceSupportsProtectionOptions()
{
  return MEMORY[0x1F40E9628]();
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x1F40EDE38]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t VTParavirtualizationGuestSupportDeregisterGuestUUID()
{
  return MEMORY[0x1F41678E8]();
}

uint64_t VTParavirtualizationGuestSupportRegisterGuestUUID()
{
  return MEMORY[0x1F41678F0]();
}

uint64_t VTParavirtualizationGuestSupportSendRawMessageToHost()
{
  return MEMORY[0x1F41678F8]();
}

uint64_t VTParavirtualizationGuestSupportSetUpWithHandlers()
{
  return MEMORY[0x1F4167900]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1F40C9CA0](a1, *(void *)&a2, a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x1F41138D8]();
}

uint64_t applejpeg_decode_create()
{
  return MEMORY[0x1F410A1B8]();
}

uint64_t applejpeg_decode_destroy()
{
  return MEMORY[0x1F410A1C0]();
}

uint64_t applejpeg_decode_get_image_info()
{
  return MEMORY[0x1F410A1D8]();
}

uint64_t applejpeg_decode_image_all()
{
  return MEMORY[0x1F410A218]();
}

uint64_t applejpeg_decode_open_jpeg_dib()
{
  return MEMORY[0x1F410A228]();
}

uint64_t applejpeg_decode_options_init()
{
  return MEMORY[0x1F410A238]();
}

uint64_t applejpeg_decode_set_options()
{
  return MEMORY[0x1F410A298]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply_f(size_t iterations, dispatch_queue_t queue, void *context, void (__cdecl *work)(void *, size_t))
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA0](attr);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
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

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return MEMORY[0x1F40DED58]();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return MEMORY[0x1F40DED60]();
}

uint64_t fig_note_initialize_category_with_default_work_cf()
{
  return MEMORY[0x1F40DED80]();
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

void memset_pattern8(void *__b, const void *__pattern8, size_t __len)
{
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1F40CCD60]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1F40CCD78]();
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1F40CCD90](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1F40CCD98](dest, src, *(void *)&len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_release(void *object)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1F40CD660]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

uint64_t proc_can_use_foreground_hw()
{
  return MEMORY[0x1F40CD840]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x1F40CE060](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

vImage_Error vImageConvert_16Fto16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D23A0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_16Q12to16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D23A8](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_16UToPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D23B8](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_16Uto16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D23C0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_16Uto16Q12(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D23C8](src, dest, *(void *)&flags);
}

uint64_t vImageConvert_420Yp10_CbCr10ToXRGB2101010W()
{
  return MEMORY[0x1F40D23D0]();
}

vImage_Error vImageConvert_420Yp8_Cb8_Cr8ToARGB8888(const vImage_Buffer *srcYp, const vImage_Buffer *srcCb, const vImage_Buffer *srcCr, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x1F40D23D8](srcYp, srcCb, srcCr, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_420Yp8_CbCr8ToARGB8888(const vImage_Buffer *srcYp, const vImage_Buffer *srcCbCr, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x1F40D23E8](srcYp, srcCbCr, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_422CbYpCrYp16ToARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint16_t alpha, vImage_Flags flags)
{
  return MEMORY[0x1F40D23F0](src, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_422CbYpCrYp16ToARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x1F40D23F8](src, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_422CbYpCrYp8ToARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x1F40D2400](src, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_422CrYpCbYpCbYpCbYpCrYpCrYp10ToARGB16Q12(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const Pixel_16Q12 alpha, vImage_Flags flags)
{
  return MEMORY[0x1F40D2408](src, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_422CrYpCbYpCbYpCbYpCrYpCrYp10ToARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x1F40D2410](src, dest, info, permuteMap, alpha, *(void *)&flags);
}

uint64_t vImageConvert_422Yp10_CbCr10ToXRGB2101010W()
{
  return MEMORY[0x1F40D2418]();
}

vImage_Error vImageConvert_422YpCbYpCr8ToARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x1F40D2420](src, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_444AYpCbCr16ToARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2428](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_444AYpCbCr16ToARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2430](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_444AYpCbCr8ToARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2438](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_444CrYpCb10ToARGB16Q12(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const Pixel_16Q12 alpha, vImage_Flags flags)
{
  return MEMORY[0x1F40D2440](src, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_444CrYpCb10ToARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x1F40D2448](src, dest, info, permuteMap, alpha, *(void *)&flags);
}

uint64_t vImageConvert_444Yp10_CbCr10ToXRGB2101010W()
{
  return MEMORY[0x1F40D2458]();
}

vImage_Error vImageConvert_ARGB16Q12To422CrYpCbYpCbYpCbYpCrYpCrYp10(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2460](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB16Q12To444CrYpCb10(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2468](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB16UTo422CbYpCrYp16(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2470](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB16UTo444AYpCbCr16(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2478](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB16UToARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], uint8_t copyMask, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2480](src, dest, permuteMap, copyMask, backgroundColor, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB16UToRGBA1010102(const vImage_Buffer *src, const vImage_Buffer *dest, int32_t RGB101010RangeMin, int32_t RGB101010RangeMax, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2488](src, dest, *(void *)&RGB101010RangeMin, *(void *)&RGB101010RangeMax, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888To420Yp8_Cb8_Cr8(const vImage_Buffer *src, const vImage_Buffer *destYp, const vImage_Buffer *destCb, const vImage_Buffer *destCr, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D24B8](src, destYp, destCb, destCr, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888To420Yp8_CbCr8(const vImage_Buffer *src, const vImage_Buffer *destYp, const vImage_Buffer *destCbCr, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D24C0](src, destYp, destCbCr, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888To422CbYpCrYp16(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D24C8](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888To422CbYpCrYp8(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D24D0](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888To422CrYpCbYpCbYpCbYpCrYpCrYp10(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D24D8](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888To422YpCbYpCr8(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D24E0](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888To444AYpCbCr16(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D24E8](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888To444AYpCbCr8(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D24F0](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888To444CrYpCb10(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D24F8](src, dest, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888ToARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], uint8_t copyMask, const Pixel_ARGB_16U backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2508](src, dest, permuteMap, copyMask, backgroundColor, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888ToARGB2101010(const vImage_Buffer *src, const vImage_Buffer *dest, int32_t RGB101010RangeMin, int32_t RGB101010RangeMax, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2510](src, dest, *(void *)&RGB101010RangeMin, *(void *)&RGB101010RangeMax, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888ToRGBA1010102(const vImage_Buffer *src, const vImage_Buffer *dest, int32_t RGB101010RangeMin, int32_t RGB101010RangeMax, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2518](src, dest, *(void *)&RGB101010RangeMin, *(void *)&RGB101010RangeMax, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGBFFFFtoARGB8888_dithered(const vImage_Buffer *src, const vImage_Buffer *dest, const Pixel_FFFF maxFloat, const Pixel_FFFF minFloat, int dither, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2548](src, dest, maxFloat, minFloat, *(void *)&dither, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGBToYpCbCr_GenerateConversion(const vImage_ARGBToYpCbCrMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_ARGBToYpCbCr *outInfo, vImageARGBType inARGBType, vImageYpCbCrType outYpCbCrType, vImage_Flags flags)
{
  return MEMORY[0x1F40D2570](matrix, pixelRange, outInfo, *(void *)&inARGBType, *(void *)&outYpCbCrType, *(void *)&flags);
}

vImage_Error vImageConvert_AnyToAny(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2578](converter, srcs, dests, tempBuffer, *(void *)&flags);
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D25B0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_Planar8To16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D25E8](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_Planar8toARGB8888(const vImage_Buffer *srcA, const vImage_Buffer *srcR, const vImage_Buffer *srcG, const vImage_Buffer *srcB, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2600](srcA, srcR, srcG, srcB, dest, *(void *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2648](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_RGB565toARGB1555(const vImage_Buffer *src, const vImage_Buffer *dest, int dither, vImage_Flags flags)
{
  return MEMORY[0x1F40D2680](src, dest, *(void *)&dither, *(void *)&flags);
}

vImage_Error vImageConvert_RGB565toARGB8888(Pixel_8 alpha, const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2688](alpha, src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_RGB565toBGRA8888(Pixel_8 alpha, const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2690](alpha, src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_RGB565toRGBA5551(const vImage_Buffer *src, const vImage_Buffer *dest, int dither, vImage_Flags flags)
{
  return MEMORY[0x1F40D26A0](src, dest, *(void *)&dither, *(void *)&flags);
}

vImage_Error vImageConvert_RGBA1010102ToARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, int32_t RGB101010RangeMin, int32_t RGB101010RangeMax, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D26D8](src, dest, *(void *)&RGB101010RangeMin, *(void *)&RGB101010RangeMax, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_RGBA1010102ToARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, int32_t RGB101010RangeMin, int32_t RGB101010RangeMax, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D26E0](src, dest, *(void *)&RGB101010RangeMin, *(void *)&RGB101010RangeMax, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_XRGB2101010ToARGB8888(const vImage_Buffer *src, Pixel_8 alpha, const vImage_Buffer *dest, int32_t RGB101010RangeMin, int32_t RGB101010RangeMax, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2740](src, alpha, dest, *(void *)&RGB101010RangeMin, *(void *)&RGB101010RangeMax, permuteMap, *(void *)&flags);
}

uint64_t vImageConvert_XRGB2101010WTo420Yp10_CbCr10()
{
  return MEMORY[0x1F40D2748]();
}

uint64_t vImageConvert_XRGB2101010WTo422Yp10_CbCr10()
{
  return MEMORY[0x1F40D2750]();
}

uint64_t vImageConvert_XRGB2101010WTo444Yp10_CbCr10()
{
  return MEMORY[0x1F40D2758]();
}

vImage_Error vImageConvert_YpCbCrToARGB_GenerateConversion(const vImage_YpCbCrToARGBMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_YpCbCrToARGB *outInfo, vImageYpCbCrType inYpCbCrType, vImageARGBType outARGBType, vImage_Flags flags)
{
  return MEMORY[0x1F40D2780](matrix, pixelRange, outInfo, *(void *)&inYpCbCrType, *(void *)&outARGBType, *(void *)&flags);
}

vImageConverterRef vImageConverter_CreateWithCGColorConversionInfo(CGColorConversionInfoRef colorConversionInfoRef, const vImage_CGImageFormat *sFormat, const vImage_CGImageFormat *dFormat, const CGFloat *bg, vImage_Flags flags, vImage_Error *error)
{
  return (vImageConverterRef)MEMORY[0x1F40D27A0](colorConversionInfoRef, sFormat, dFormat, bg, *(void *)&flags, error);
}

vImageConverterRef vImageConverter_CreateWithCGImageFormat(const vImage_CGImageFormat *srcFormat, const vImage_CGImageFormat *destFormat, const CGFloat *backgroundColor, vImage_Flags flags, vImage_Error *error)
{
  return (vImageConverterRef)MEMORY[0x1F40D27A8](srcFormat, destFormat, backgroundColor, *(void *)&flags, error);
}

vImage_Error vImageExtractChannel_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, uint64_t channelIndex, vImage_Flags flags)
{
  return MEMORY[0x1F40D28E0](src, dest, channelIndex, *(void *)&flags);
}

vImage_Error vImageOverwriteChannelsWithScalar_ARGB8888(Pixel_8 scalar, const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x1F40D2AF8](scalar, src, dest, copyMask, *(void *)&flags);
}

vImage_Error vImagePermuteChannels_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2B60](src, dest, permuteMap, *(void *)&flags);
}

vImage_Error vImageRotate90_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_ARGB_16U backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C40](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageRotate90_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C48](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageRotate90_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_16U backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C70](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageRotate90_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C78](src, dest, rotationConstant, backColor, *(void *)&flags);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40CE6A8](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}