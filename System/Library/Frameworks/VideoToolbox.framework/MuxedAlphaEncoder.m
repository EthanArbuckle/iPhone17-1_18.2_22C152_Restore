@interface MuxedAlphaEncoder
@end

@implementation MuxedAlphaEncoder

void __MuxedAlphaEncoder_EncodeFrame_block_invoke(uint64_t a1, int a2, int a3, CFTypeRef cf)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 44) = a3;
  if (cf) {
    CFTypeRef v5 = CFRetain(cf);
  }
  else {
    CFTypeRef v5 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = v5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  v6 = *(NSObject **)(a1 + 40);
  if (v6) {
    dispatch_release(v6);
  }
  v7 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v7)
  {
    CFRelease(v7);
  }
}

void __MuxedAlphaEncoder_EncodeFrame_block_invoke_2(uint64_t a1, int a2, int a3, CFTypeRef cf)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 44) = a3;
  if (cf) {
    CFTypeRef v5 = CFRetain(cf);
  }
  else {
    CFTypeRef v5 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = v5;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2000000000;
  v16[3] = 0;
  dispatch_retain(*(dispatch_object_t *)(a1 + 56));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 0x40000000;
  long long v6 = *(_OWORD *)(a1 + 48);
  int8x16_t v11 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  long long v14 = *(_OWORD *)(a1 + 64);
  v10[2] = __MuxedAlphaEncoder_EncodeFrame_block_invoke_3;
  v10[3] = &unk_1E5785CF8;
  v12 = v16;
  v7 = *(NSObject **)(v14 + 152);
  uint64_t v15 = *(void *)(a1 + 80);
  long long v13 = v6;
  dispatch_async(v7, v10);
  v8 = *(NSObject **)(a1 + 56);
  if (v8) {
    dispatch_release(v8);
  }
  v9 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v9) {
    CFRelease(v9);
  }
  _Block_object_dispose(v16, 8);
}

void __MuxedAlphaEncoder_EncodeFrame_block_invoke_3(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 64), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t MuxedAlphaFormatDescription = *(unsigned int *)(v2 + 40);
  if (MuxedAlphaFormatDescription) {
    goto LABEL_37;
  }
  uint64_t MuxedAlphaFormatDescription = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (MuxedAlphaFormatDescription) {
    goto LABEL_37;
  }
  CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(v2 + 48));
  CMFormatDescriptionRef v5 = CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 48));
  uint64_t v6 = *(void *)(a1 + 72);
  if (*(void *)(v6 + 32))
  {
    int v7 = FigCFEqual();
    uint64_t v6 = *(void *)(a1 + 72);
    if (v7)
    {
      if (FigCFEqual()) {
        goto LABEL_20;
      }
      uint64_t v6 = *(void *)(a1 + 72);
    }
  }
  cf.value = 0;
  v8 = *(const void **)(v6 + 56);
  *(void *)(v6 + 56) = FormatDescription;
  if (FormatDescription) {
    CFRetain(FormatDescription);
  }
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v9 = *(void *)(a1 + 72);
  v10 = *(const void **)(v9 + 104);
  *(void *)(v9 + 104) = v5;
  if (v5) {
    CFRetain(v5);
  }
  if (v10) {
    CFRelease(v10);
  }
  int8x16_t v11 = *(const void **)(*(void *)(a1 + 72) + 32);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(*(void *)(a1 + 72) + 32) = 0;
  }
  FigHEVCBridge_CreateAlphaInfoSEI();
  uint64_t MuxedAlphaFormatDescription = FigHEVCBridge_CreateMuxedAlphaFormatDescription();
  if (cf.value) {
    CFRelease((CFTypeRef)cf.value);
  }
  if (!MuxedAlphaFormatDescription)
  {
LABEL_20:
    v12 = *(opaqueCMSampleBuffer **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
    long long v13 = *(opaqueCMSampleBuffer **)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
    long long v14 = *(const opaqueCMFormatDescription **)(*(void *)(a1 + 72) + 32);
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    CMSampleBufferRef v30 = 0;
    v31 = 0;
    values = 0;
    CMSampleBufferGetDecodeTimeStamp(&cf, v12);
    CMSampleBufferGetDecodeTimeStamp(&time2, v13);
    if (CMTimeCompare(&cf, &time2)) {
      goto LABEL_46;
    }
    CMSampleBufferGetPresentationTimeStamp(&time1, v12);
    CMSampleBufferGetPresentationTimeStamp(&v25, v13);
    if (CMTimeCompare(&time1, &v25)) {
      goto LABEL_46;
    }
    v16 = (const void *)*MEMORY[0x1E4F1F200];
    alphaencoder_getSampleBufferSampleAttachment(v12, (const void *)*MEMORY[0x1E4F1F200]);
    alphaencoder_getSampleBufferSampleAttachment(v12, v16);
    if (!FigCFEqual()) {
      goto LABEL_46;
    }
    v17 = (const void *)*MEMORY[0x1E4F1F1F8];
    alphaencoder_getSampleBufferSampleAttachment(v12, (const void *)*MEMORY[0x1E4F1F1F8]);
    alphaencoder_getSampleBufferSampleAttachment(v12, v17);
    if (FigCFEqual()
      && (CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80], (values = (void *)FigCFNumberCreateSInt32()) != 0))
    {
      CFArrayRef v19 = CFArrayCreate(v18, (const void **)&values, 1, 0);
      if (v19)
      {
        CMSampleBufferGetDataBuffer(v12);
        CMSampleBufferGetDataBuffer(v13);
        uint64_t MuxedAlphaDataBuffer = FigHEVCBridge_CreateMuxedAlphaDataBuffer();
        if (!MuxedAlphaDataBuffer)
        {
          uint64_t MuxedAlphaFormatDescription = alphaencoder_createDerivedSampleBuffer(v12, v13, v31, v14, &v30);
          if (!MuxedAlphaFormatDescription)
          {
            *(void *)(v15 + 24) = v30;
            CMSampleBufferRef v30 = 0;
          }
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t MuxedAlphaDataBuffer = FigSignalErrorAt();
      }
      uint64_t MuxedAlphaFormatDescription = MuxedAlphaDataBuffer;
    }
    else
    {
LABEL_46:
      uint64_t MuxedAlphaFormatDescription = FigSignalErrorAt();
      CFArrayRef v19 = 0;
    }
LABEL_29:
    if (values) {
      CFRelease(values);
    }
    if (v19) {
      CFRelease(v19);
    }
    if (v31) {
      CFRelease(v31);
    }
    if (v30) {
      CFRelease(v30);
    }
  }
LABEL_37:
  v21 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  if (v21)
  {
    CFRelease(v21);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = 0;
  }
  v22 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
  if (v22)
  {
    CFRelease(v22);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = 0;
  }
  alphaencoder_emitEncodedFrame(*(void *)(a1 + 80), *(const void **)(a1 + 88), MuxedAlphaFormatDescription, *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(opaqueCMSampleBuffer **)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  v23 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v23)
  {
    CFRelease(v23);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  v24 = *(NSObject **)(a1 + 64);
  if (v24) {
    dispatch_release(v24);
  }
}

void __MuxedAlphaEncoder_EncodeMultiImageFrame_block_invoke(uint64_t a1, int a2, int a3, CFTypeRef cf)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 44) = a3;
  if (cf) {
    CFTypeRef v5 = CFRetain(cf);
  }
  else {
    CFTypeRef v5 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = v5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  uint64_t v6 = *(NSObject **)(a1 + 40);
  if (v6) {
    dispatch_release(v6);
  }
  int v7 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v7)
  {
    CFRelease(v7);
  }
}

void __MuxedAlphaEncoder_EncodeMultiImageFrame_block_invoke_2(uint64_t a1, int a2, int a3, CFTypeRef cf)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 44) = a3;
  if (cf) {
    CFTypeRef v5 = CFRetain(cf);
  }
  else {
    CFTypeRef v5 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = v5;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2000000000;
  v16[3] = 0;
  dispatch_retain(*(dispatch_object_t *)(a1 + 56));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 0x40000000;
  long long v6 = *(_OWORD *)(a1 + 48);
  int8x16_t v11 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  long long v14 = *(_OWORD *)(a1 + 64);
  v10[2] = __MuxedAlphaEncoder_EncodeMultiImageFrame_block_invoke_3;
  v10[3] = &unk_1E5785DB8;
  v12 = v16;
  int v7 = *(NSObject **)(v14 + 152);
  uint64_t v15 = *(void *)(a1 + 80);
  long long v13 = v6;
  dispatch_async(v7, v10);
  v8 = *(NSObject **)(a1 + 56);
  if (v8) {
    dispatch_release(v8);
  }
  uint64_t v9 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v9) {
    CFRelease(v9);
  }
  _Block_object_dispose(v16, 8);
}

void __MuxedAlphaEncoder_EncodeMultiImageFrame_block_invoke_3(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 64), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  Multiviewuint64_t MuxedAlphaFormatDescription = *(unsigned int *)(v2 + 40);
  if (MultiviewMuxedAlphaFormatDescription) {
    goto LABEL_42;
  }
  Multiviewuint64_t MuxedAlphaFormatDescription = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (MultiviewMuxedAlphaFormatDescription) {
    goto LABEL_42;
  }
  CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(v2 + 48));
  CMFormatDescriptionRef v5 = CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 48));
  uint64_t v6 = *(void *)(a1 + 72);
  if (*(void *)(v6 + 32))
  {
    int v7 = FigCFEqual();
    uint64_t v6 = *(void *)(a1 + 72);
    if (v7)
    {
      if (FigCFEqual()) {
        goto LABEL_30;
      }
      uint64_t v6 = *(void *)(a1 + 72);
    }
  }
  cf.value = 0;
  v29.value = 0;
  v8 = *(const void **)(v6 + 56);
  *(void *)(v6 + 56) = FormatDescription;
  if (FormatDescription) {
    CFRetain(FormatDescription);
  }
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v9 = *(void *)(a1 + 72);
  v10 = *(const void **)(v9 + 104);
  *(void *)(v9 + 104) = v5;
  if (v5) {
    CFRetain(v5);
  }
  if (v10) {
    CFRelease(v10);
  }
  int8x16_t v11 = *(const void **)(*(void *)(a1 + 72) + 32);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(*(void *)(a1 + 72) + 32) = 0;
  }
  FigHEVCBridge_CreateAlphaInfoSEI();
  uint64_t v12 = *(void *)(a1 + 72);
  LOWORD(time1.value) = 0;
  long long v13 = (_WORD *)FigHEVCBridge_AllocThreeDimensionalReferenceDisplaysInfo();
  *(unsigned char *)long long v13 = 31;
  if (*(void *)(v12 + 144) || *(void *)(v12 + 136)) {
    FigCFArrayGetInt16AtIndex();
  }
  else {
    LOWORD(time1.value) = 2;
  }
  v13[4] = time1.value;
  if (*(void *)(v12 + 144) || *(void *)(v12 + 136)) {
    FigCFArrayGetInt16AtIndex();
  }
  else {
    LOWORD(time1.value) = 3;
  }
  v13[5] = time1.value;
  FigHEVCBridge_CreateThreeDimensionalReferenceDisplaysInfoSEI();
  free(v13);
  Multiviewuint64_t MuxedAlphaFormatDescription = FigHEVCBridge_CreateMultiviewMuxedAlphaFormatDescription();
  if (!MultiviewMuxedAlphaFormatDescription)
  {
    LODWORD(time1.value) = 0;
    Multiviewuint64_t MuxedAlphaFormatDescription = FigVideoFormatDescriptionDetermineCompatibilityWithCoreMediaRequirementsForHEVCWithAlpha();
  }
  if (cf.value) {
    CFRelease((CFTypeRef)cf.value);
  }
  if (v29.value) {
    CFRelease((CFTypeRef)v29.value);
  }
  if (!MultiviewMuxedAlphaFormatDescription)
  {
LABEL_30:
    long long v14 = *(opaqueCMSampleBuffer **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
    uint64_t v15 = *(opaqueCMSampleBuffer **)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
    uint64_t v16 = *(void *)(a1 + 72);
    v17 = *(const opaqueCMFormatDescription **)(v16 + 32);
    uint64_t v18 = *(void *)(v16 + 128);
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    v32 = 0;
    CFTypeRef v31 = 0;
    CMSampleBufferGetDecodeTimeStamp(&cf, v14);
    CMSampleBufferGetDecodeTimeStamp(&v29, v15);
    if (CMTimeCompare(&cf, &v29)) {
      goto LABEL_53;
    }
    CMSampleBufferGetPresentationTimeStamp(&time1, v14);
    CMSampleBufferGetPresentationTimeStamp(&v27, v15);
    if (CMTimeCompare(&time1, &v27)
      || (v20 = (const void *)*MEMORY[0x1E4F1F200],
          alphaencoder_getSampleBufferSampleAttachment(v14, (const void *)*MEMORY[0x1E4F1F200]),
          alphaencoder_getSampleBufferSampleAttachment(v14, v20),
          !FigCFEqual())
      || (v21 = (const void *)*MEMORY[0x1E4F1F1F8],
          alphaencoder_getSampleBufferSampleAttachment(v14, (const void *)*MEMORY[0x1E4F1F1F8]),
          alphaencoder_getSampleBufferSampleAttachment(v14, v21),
          !FigCFEqual()))
    {
LABEL_53:
      Multiviewuint64_t MuxedAlphaDataBuffer = FigSignalErrorAt();
    }
    else
    {
      if (!v18)
      {
        FigSignalErrorAt();
        Multiviewuint64_t MuxedAlphaFormatDescription = 0;
        goto LABEL_38;
      }
      CMSampleBufferGetDataBuffer(v14);
      CMSampleBufferGetDataBuffer(v15);
      Multiviewuint64_t MuxedAlphaDataBuffer = FigHEVCBridge_CreateMultiviewMuxedAlphaDataBuffer();
      if (!MultiviewMuxedAlphaDataBuffer)
      {
        Multiviewuint64_t MuxedAlphaFormatDescription = alphaencoder_createDerivedSampleBuffer(v14, v15, v32, v17, (CMSampleBufferRef *)&v31);
        if (!MultiviewMuxedAlphaFormatDescription)
        {
          *(void *)(v19 + 24) = v31;
          CFTypeRef v31 = 0;
        }
        goto LABEL_38;
      }
    }
    Multiviewuint64_t MuxedAlphaFormatDescription = MultiviewMuxedAlphaDataBuffer;
LABEL_38:
    if (v32) {
      CFRelease(v32);
    }
    if (v31) {
      CFRelease(v31);
    }
  }
LABEL_42:
  v23 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  if (v23)
  {
    CFRelease(v23);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = 0;
  }
  v24 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
  if (v24)
  {
    CFRelease(v24);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = 0;
  }
  alphaencoder_emitEncodedFrame(*(void *)(a1 + 80), *(const void **)(a1 + 88), MultiviewMuxedAlphaFormatDescription, *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(opaqueCMSampleBuffer **)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  CMTime v25 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v25)
  {
    CFRelease(v25);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  v26 = *(NSObject **)(a1 + 64);
  if (v26) {
    dispatch_release(v26);
  }
}

@end