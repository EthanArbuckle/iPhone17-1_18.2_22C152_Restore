@interface RenderFrame
@end

@implementation RenderFrame

uint64_t __basicVideoCompositor_RenderFrame_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 48) + 336) = FigGetUpTimeNanoseconds();
  CFAllocatorRef v2 = CFGetAllocator(*(CFTypeRef *)(a1 + 56));
  uint64_t v3 = *(void *)(a1 + 64);
  int v4 = *(_DWORD *)(v3 + 168);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(v5 + 16);
  uint64_t v7 = *(void *)(v3 + 184);
  v8 = *(char **)(v3 + 192);
  uint64_t v10 = *(void *)(v3 + 200);
  uint64_t v9 = *(void *)(v3 + 208);
  uint64_t v12 = *(void *)(v3 + 232);
  uint64_t v11 = *(void *)(v3 + 240);
  uint64_t v14 = *(void *)(v3 + 216);
  uint64_t v13 = *(void *)(v3 + 224);
  v15 = *(__CVBuffer **)v5;
  int v16 = *(_DWORD *)(v5 + 176);
  int v94 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double v17 = *(double *)(v5 + 296);
  double v18 = *(double *)(v5 + 304);
  double v19 = *(double *)(v5 + 312);
  double v20 = *(double *)(v5 + 320);
  uint64_t v21 = *(void *)(v5 + 160);
  uint64_t v93 = *(void *)(v5 + 168);
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferRef v97 = 0;
  CFAllocatorRef allocator = v2;
  if (!v2)
  {
    int v35 = FigSignalErrorAt();
    CFTypeRef v24 = 0;
    CFDictionaryRef DictionaryRepresentation = 0;
    v8 = 0;
    goto LABEL_142;
  }
  if (!v7) {
    goto LABEL_49;
  }
  if (!v8)
  {
    int v35 = FigSignalErrorAt();
    goto LABEL_50;
  }
  if (!v12 || !v11 || !v14 || !v13 || !v10 || !v9)
  {
LABEL_49:
    int v35 = FigSignalErrorAt();
    v8 = 0;
LABEL_50:
    CFDictionaryRef DictionaryRepresentation = 0;
    CFTypeRef v24 = 0;
    goto LABEL_140;
  }
  if (v16 > 179)
  {
    if (v16 != 180 && v16 != 270) {
      goto LABEL_49;
    }
  }
  else if (v16 && v16 != 90)
  {
    goto LABEL_49;
  }
  if (!v15)
  {
    v8 = 0;
    CFDictionaryRef DictionaryRepresentation = 0;
    CFTypeRef v24 = 0;
    int v35 = 0;
    *(void *)uint64_t v5 = 0;
    goto LABEL_140;
  }
  uint64_t v81 = v9;
  uint64_t v82 = v10;
  uint64_t v83 = v7;
  uint64_t v89 = v11;
  uint64_t v90 = v12;
  int v92 = v16;
  uint64_t v88 = v14;
  v84 = (CGRect *)(v13 + 32 * v6);
  size_t Width = CVPixelBufferGetWidth(v15);
  size_t Height = CVPixelBufferGetHeight(v15);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v15);
  CFStringRef key = (const __CFString *)*MEMORY[0x1E4F24C18];
  CFTypeRef v24 = CVBufferCopyAttachment(v15, (CFStringRef)*MEMORY[0x1E4F24C18], 0);
  uint64_t v86 = v6;
  if (!v24)
  {
    v25 = (CGColorSpace *)CVBufferCopyAttachment(v15, (CFStringRef)*MEMORY[0x1E4F24A00], 0);
    CGColorSpaceGetName(v25);
    v26 = (const void *)VTGetDefaultYCbCrMatrixWithColorSpaceNameAndDimensionHints();
    if (v26)
    {
      CFTypeRef v27 = CFRetain(v26);
      if (!v25)
      {
LABEL_21:
        CFTypeRef v24 = v27;
        uint64_t v6 = v86;
        goto LABEL_22;
      }
    }
    else
    {
      CFTypeRef v27 = 0;
      if (!v25) {
        goto LABEL_21;
      }
    }
    CFRelease(v25);
    goto LABEL_21;
  }
LABEL_22:
  if (v94 == 1)
  {
    double v28 = (double)v21;
    unint64_t v29 = v93;
    double v30 = (double)v93;
    if (v19 != (double)v21 || v20 != v30)
    {
      OSType v32 = PixelFormatType;
      int v33 = v92;
LABEL_62:
      int v87 = v32;
      goto LABEL_63;
    }
    v101.size.width = (double)Width;
    v101.size.height = (double)Height;
    v101.origin.x = 0.0;
    v101.origin.y = 0.0;
    v98.origin.x = v17;
    v98.origin.y = v18;
    v98.size.width = v19;
    v98.size.height = v20;
    BOOL v41 = CGRectContainsRect(v98, v101);
    int v33 = v92;
    if (v92)
    {
      OSType v32 = PixelFormatType;
      goto LABEL_62;
    }
    int v87 = PixelFormatType;
    if (v41)
    {
LABEL_53:
      v42 = *(const void **)(v89 + 8 * v6);
      if (v42)
      {
        CFRelease(v42);
        *(void *)(v89 + 8 * v6) = 0;
      }
      v43 = *(const void **)(v90 + 8 * v6);
      if (v43)
      {
        CFRelease(v43);
        v8 = 0;
        CFDictionaryRef DictionaryRepresentation = 0;
        *(void *)(v90 + 8 * v6) = 0;
      }
      else
      {
        v8 = 0;
        CFDictionaryRef DictionaryRepresentation = 0;
      }
      int v35 = -16210;
      CVPixelBufferRef v44 = v15;
      goto LABEL_139;
    }
  }
  else
  {
    int v33 = v92;
    if (PixelFormatType == 875704422 && v4 == 875704438) {
      int v37 = 875704438;
    }
    else {
      int v37 = PixelFormatType;
    }
    double v28 = (double)v21;
    unint64_t v29 = v93;
    double v30 = (double)v93;
    BOOL v39 = v19 == (double)v21 && v20 == v30 && v92 == 0;
    int v87 = v37;
    if (v39 && v37 == PixelFormatType)
    {
      if (((CVPixelBufferGetPixelFormatType(v15) - 875704422) & 0xFFFFFFEF) != 0) {
        goto LABEL_53;
      }
      int v87 = PixelFormatType;
      if (FigCFEqual()) {
        goto LABEL_53;
      }
    }
  }
LABEL_63:
  if (*(__CVBuffer **)(v90 + 8 * v6) == v15
    && CVPixelBufferGetWidth(*(CVPixelBufferRef *)(v89 + 8 * v6)) == v21
    && CVPixelBufferGetHeight(*(CVPixelBufferRef *)(v89 + 8 * v6)) == v29
    && CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(v89 + 8 * v6)) == v87)
  {
    v102.origin.x = v17;
    v102.origin.y = v18;
    v102.size.width = v19;
    v102.size.height = v20;
    if (CGRectEqualToRect(*v84, v102) && *(_DWORD *)(v88 + 4 * v6) == v33)
    {
      CVPixelBufferRef v44 = *(CVPixelBufferRef *)(v89 + 8 * v6);
      if (v44)
      {
        v8 = 0;
        CFDictionaryRef DictionaryRepresentation = 0;
        int v35 = 0;
LABEL_139:
        *(_DWORD *)(v88 + 4 * v6) = v33;
        v84->origin.x = v17;
        v84->origin.y = v18;
        v84->size.width = v19;
        v84->size.height = v20;
        *(void *)uint64_t v5 = v44;
        goto LABEL_140;
      }
    }
  }
  CFTypeRef cf = v24;
  double v78 = v18;
  double v79 = v17;
  double v77 = v19;
  if (v33)
  {
    unint64_t v45 = (unint64_t)v20;
    if (v33 == 270 || v33 == 90)
    {
      unint64_t v46 = (unint64_t)v19;
    }
    else
    {
      unint64_t v46 = (unint64_t)v20;
      unint64_t v45 = (unint64_t)v19;
    }
    if (v21 <= 4 * v45)
    {
      unint64_t v53 = v21;
      if (v45 > 4 * v21) {
        unint64_t v53 = (v45 + 3) >> 2;
      }
    }
    else
    {
      unint64_t v53 = 4 * v45;
    }
    v54 = (__CVPixelBufferPool **)&v8[8 * v6];
    if (v29 <= 4 * v46)
    {
      unint64_t v55 = v29;
      if (v46 > 4 * v29) {
        unint64_t v55 = (v46 + 3) >> 2;
      }
    }
    else
    {
      unint64_t v55 = 4 * v46;
    }
    if (v94 != 1 && ((CVPixelBufferGetPixelFormatType(v15) - 875704422) & 0xFFFFFFEF) == 0)
    {
      int v56 = FigCFEqual();
      int v57 = PixelFormatType;
      if (!v56) {
        int v57 = 1111970369;
      }
      OSType PixelFormatType = v57;
    }
    unsigned int v58 = bvc_isPixelBufferPoolCompatibleWithDimensionsAndPixelFormat(*v54, v53, v55, PixelFormatType);
    v59 = *v54;
    if (v58)
    {
      if (v59) {
        goto LABEL_96;
      }
    }
    else if (v59)
    {
      CFRelease(v59);
      *v54 = 0;
    }
    int PixelBufferPoolForPreProcessing = bvc_createPixelBufferPoolForPreProcessing(v53, v55, PixelFormatType, v54);
    if (PixelBufferPoolForPreProcessing) {
      goto LABEL_160;
    }
LABEL_96:
    v61 = (CFTypeRef *)(v81 + 8 * v6);
    if (*v61)
    {
      if (*(_DWORD *)(v88 + 4 * v6) == v92)
      {
LABEL_101:
        int PixelBufferPoolForPreProcessing = CVPixelBufferPoolCreatePixelBuffer(allocator, *v54, &pixelBufferOut);
        if (!PixelBufferPoolForPreProcessing)
        {
          double v50 = (double)v53;
          double v52 = (double)v55;
          CVBufferPropagateAttachments(v15, pixelBufferOut);
          CVBufferRemoveAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24A78]);
          CVBufferRemoveAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24B98]);
          int PixelBufferPoolForPreProcessing = MEMORY[0x199710560](*v61, v15, pixelBufferOut, v17, v18, v19, v20, 0.0, 0.0, (double)v53, (double)v55);
          if (!PixelBufferPoolForPreProcessing)
          {
            v8 = (char *)CVBufferCopyAttachment(pixelBufferOut, key, 0);
            CVPixelBufferRef v44 = pixelBufferOut;
            CVPixelBufferRef pixelBufferOut = 0;
            v47 = v44;
            double v49 = 0.0;
            CGFloat v62 = 0.0;
            unint64_t v29 = v93;
            CGFloat v51 = 0.0;
            if (v8) {
              goto LABEL_108;
            }
            goto LABEL_104;
          }
        }
LABEL_160:
        int v35 = PixelBufferPoolForPreProcessing;
        v8 = 0;
LABEL_164:
        CFDictionaryRef DictionaryRepresentation = 0;
        goto LABEL_165;
      }
      CFRelease(*v61);
      CFTypeRef *v61 = 0;
    }
    int PixelBufferPoolForPreProcessing = VTImageRotationSessionCreate();
    if (PixelBufferPoolForPreProcessing) {
      goto LABEL_160;
    }
    MEMORY[0x199710540](*v61, *MEMORY[0x1E4F44FF0], *MEMORY[0x1E4F1CFD0]);
    goto LABEL_101;
  }
  CVPixelBufferRef v44 = 0;
  v47 = v15;
  double v48 = v17;
  double v49 = v18;
  double v50 = v19;
  CGFloat v51 = v48;
  double v52 = v20;
LABEL_104:
  if (cf) {
    v8 = (char *)CFRetain(cf);
  }
  else {
    v8 = 0;
  }
  CGFloat v62 = v49;
LABEL_108:
  v103.origin.x = 0.0;
  v103.origin.y = 0.0;
  v99.origin.x = v51;
  v99.origin.y = v62;
  v99.size.width = v50;
  v99.size.height = v52;
  v103.size.width = v28;
  v103.size.height = v30;
  if (CGRectContainsRect(v99, v103)
    && CVPixelBufferGetWidth(v47) == v21
    && CVPixelBufferGetHeight(v47) == v29
    && CVPixelBufferGetPixelFormatType(v47) == v87
    && (v94 == 1 || ((CVPixelBufferGetPixelFormatType(v47) - 875704422) & 0xFFFFFFEF) != 0 || FigCFEqual()))
  {
    CFDictionaryRef DictionaryRepresentation = 0;
    CFTypeRef v24 = cf;
LABEL_134:
    double v18 = v78;
    double v17 = v79;
    double v19 = v77;
    v69 = *(const void **)(v90 + 8 * v6);
    *(void *)(v90 + 8 * v6) = v15;
    CFRetain(v15);
    if (v69) {
      CFRelease(v69);
    }
    v70 = *(const void **)(v89 + 8 * v6);
    if (v70) {
      CFRelease(v70);
    }
    int v35 = 0;
    *(void *)(v89 + 8 * v6) = v44;
    int v33 = v92;
    goto LABEL_139;
  }
  v63 = (__CVPixelBufferPool **)(v83 + 8 * v6);
  unsigned int v64 = bvc_isPixelBufferPoolCompatibleWithDimensionsAndPixelFormat(*v63, v21, v29, v87);
  v65 = *v63;
  if (v64)
  {
    if (v65) {
      goto LABEL_122;
    }
  }
  else if (v65)
  {
    CFRelease(v65);
    *v63 = 0;
  }
  int v66 = bvc_createPixelBufferPoolForPreProcessing(v21, v29, v87, v63);
  if (v66)
  {
LABEL_163:
    int v35 = v66;
    goto LABEL_164;
  }
LABEL_122:
  v67 = (VTPixelTransferSessionRef *)(v82 + 8 * v6);
  if (!*v67)
  {
    int v66 = VTPixelTransferSessionCreate(allocator, v67);
    if (!v66)
    {
      VTPixelTransferSessionSetProperty();
      goto LABEL_125;
    }
    goto LABEL_163;
  }
LABEL_125:
  v100.origin.x = v51;
  v100.origin.y = v62;
  v100.size.width = v50;
  v100.size.height = v52;
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v100);
  if (DictionaryRepresentation)
  {
    VTPixelTransferSessionSetProperty();
    int v68 = VTPixelTransferSessionSetProperty();
    if (!v68)
    {
      int v68 = VTPixelTransferSessionSetProperty();
      if (!v68)
      {
        int v68 = VTPixelTransferSessionSetProperty();
        if (!v68)
        {
          int v68 = CVPixelBufferPoolCreatePixelBuffer(allocator, *v63, &v97);
          if (!v68)
          {
            int v68 = VTPixelTransferSessionTransferImage(*v67, v47, v97);
            if (!v68)
            {
              CFTypeRef v24 = cf;
              if (v44) {
                CFRelease(v44);
              }
              CVPixelBufferRef v44 = v97;
              CVPixelBufferRef v97 = 0;
              uint64_t v6 = v86;
              goto LABEL_134;
            }
          }
        }
      }
    }
  }
  else
  {
    int v68 = FigSignalErrorAt();
  }
  int v35 = v68;
LABEL_165:
  CFTypeRef v24 = cf;
LABEL_140:
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
LABEL_142:
  if (v97) {
    CFRelease(v97);
  }
  if (DictionaryRepresentation) {
    CFRelease(DictionaryRepresentation);
  }
  if (v24) {
    CFRelease(v24);
  }
  if (v8) {
    CFRelease(v8);
  }
  uint64_t result = FigGetUpTimeNanoseconds();
  uint64_t v72 = *(void *)(a1 + 48);
  *(void *)(v72 + 344) = result;
  if (v35)
  {
    v73 = *(void **)(a1 + 64);
    CFDictionaryRef v74 = (const __CFDictionary *)v73[20];
    unint64_t v75 = v73[2];
    unint64_t v76 = v73[3];
    uint64_t result = bvc_updateSourcebufferCharacteristics(v72);
    if (!result) {
      uint64_t result = bvc_computeScaledTransformAndTransformedRect(v75, v76, v74, v72);
    }
    if (v35 != -16210) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

void __basicVideoCompositor_RenderFrame_block_invoke_3(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void (**)(void, void, void, void))(v2 + 296);
  if (v3) {
    v3(*(void *)(v2 + 304), a1[5], 0, a1[6]);
  }
  int v4 = (const void *)a1[6];
  if (v4)
  {
    CFRelease(v4);
  }
}

void __basicVideoCompositor_RenderFrame_block_invoke_5(uint64_t a1)
{
  v182[5] = *MEMORY[0x1E4F143B8];
  CVPixelBufferRef pixelBufferOut = 0;
  CFAllocatorRef v2 = CFGetAllocator(*(CFTypeRef *)(a1 + 40));
  CVReturn v3 = CVPixelBufferPoolCreatePixelBuffer(v2, *(CVPixelBufferPoolRef *)(a1 + 48), &pixelBufferOut);
  if (v3)
  {
    int v58 = v3;
    goto LABEL_135;
  }
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 56);
  if (v4) {
    CVBufferSetAttachments(pixelBufferOut, v4, kCVAttachmentMode_ShouldPropagate);
  }
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F24A78];
  CVBufferRemoveAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24A78]);
  CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F24B98];
  CVBufferRemoveAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24B98]);
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F24C18];
  CVBufferRemoveAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24C18]);
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F24A90];
  CVBufferRemoveAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24A90]);
  CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F24BC8];
  CVBufferRemoveAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24BC8]);
  CVBufferSetAttachment(pixelBufferOut, v5, *(CFTypeRef *)(*(void *)(a1 + 64) + 160), kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(pixelBufferOut, v6, *(CFTypeRef *)(*(void *)(a1 + 64) + 32), kCVAttachmentMode_ShouldPropagate);
  CFStringRef key = v7;
  CVBufferSetAttachment(pixelBufferOut, v7, *(CFTypeRef *)(a1 + 72), kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(pixelBufferOut, v8, *(CFTypeRef *)(a1 + 80), kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(pixelBufferOut, v9, *(CFTypeRef *)(a1 + 88), kCVAttachmentMode_ShouldPropagate);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 2)
  {
    uint64_t v10 = *(uint64_t **)(a1 + 96);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
    uint64_t v14 = *(NSObject **)(*(void *)(a1 + 64) + 256);
    uint64_t v15 = *(void *)(a1 + 104);
    v11 *= 352;
    int v16 = *(__CVBuffer **)(v15 + v11);
    uint64_t v17 = 352 * v12;
    double v18 = *(__CVBuffer **)(v15 + 352 * v12);
    double v19 = pixelBufferOut;
    float v20 = *(float *)(v15 + v11 + 24);
    CGFloat Width = (double)CVPixelBufferGetWidth(v16);
    CGFloat Height = (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(*(void *)(a1 + 104) + v11));
    *(double *)&uint64_t v23 = (double)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(*(void *)(a1 + 104) + v17));
    *(double *)&uint64_t v24 = (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(*(void *)(a1 + 104) + v17));
    *(double *)&uint64_t v25 = (double)CVPixelBufferGetWidth(pixelBufferOut);
    size_t v26 = CVPixelBufferGetHeight(pixelBufferOut);
    int v31 = bvc_mixBuffers(v14, v16, v18, v19, v27, v28, v29, v30, v20, 0.0, 0.0, Width, Height, 0, 0, v23, v24, 0, 0,
            v25,
            COERCE__INT64((double)v26));
    uint64_t v32 = *(void *)(a1 + 64);
    uint64_t v33 = (FigGetUpTimeNanoseconds() - UpTimeNanoseconds) / 1000;
    ++*(_DWORD *)(v32 + 440);
    uint64_t v34 = *(void *)(v32 + 424);
    *(void *)(v32 + 432) += v33;
    uint64_t v35 = *(void *)(v32 + 416);
    if (v35 >= (int)v33) {
      uint64_t v35 = (int)v33;
    }
    if (v34 <= (int)v33) {
      uint64_t v33 = (int)v33;
    }
    else {
      uint64_t v33 = v34;
    }
    *(void *)(v32 + 416) = v35;
    *(void *)(v32 + 424) = v33;
    if (v31) {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 3;
    }
    else {
      ++*(_DWORD *)(*(void *)(a1 + 64) + 364);
    }
  }
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != 3)
  {
    int v58 = 0;
    goto LABEL_135;
  }
  ++*(_DWORD *)(*(void *)(a1 + 64) + 368);
  if (!*(unsigned char *)(a1 + 136))
  {
LABEL_43:
    int v58 = 0;
    uint64_t v61 = *(void *)(a1 + 112);
    CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x1E4F24C48];
    while (1)
    {
      while (1)
      {
        if (--v61 < 0) {
          goto LABEL_135;
        }
        uint64_t v62 = *(void *)(a1 + 104);
        uint64_t v63 = *(void *)(*(void *)(a1 + 96) + 8 * v61);
        uint64_t v64 = v62 + 352 * v63;
        uint64_t v65 = v64 + 80;
        double v66 = *(double *)(v64 + 80);
        if (fabs(v66) >= 0.000001)
        {
          double v89 = *(double *)(v64 + 88);
          double v88 = *(double *)(v64 + 96);
          double v90 = *(double *)(v64 + 104);
          if (fabs(v66 + -1.0) < 0.000001 || (fabs(v66 + 1.0) >= 0.000001 ? (BOOL v91 = v66 == 1.0) : (BOOL v91 = 0), v91))
          {
            if ((fabs(v89) < 0.000001 || fabs(v89 + -1.0) >= 0.000001 && fabs(v89 + 1.0) >= 0.000001 && v89 == 0.0)
              && (fabs(v88) < 0.000001 || fabs(v88 + -1.0) >= 0.000001 && fabs(v88 + 1.0) >= 0.000001 && v88 == 0.0)
              && fabs(v90) >= 0.000001)
            {
              if (fabs(v90 + -1.0) < 0.000001) {
                break;
              }
              if (fabs(v90 + 1.0) >= 0.000001 && v90 == 1.0) {
                break;
              }
            }
          }
        }
LABEL_46:
        ++*(_DWORD *)(*(void *)(a1 + 64) + 380);
        uint64_t v67 = FigGetUpTimeNanoseconds();
        queue = *(NSObject **)(*(void *)(a1 + 64) + 256);
        int v68 = *(__CVBuffer **)v64;
        v69 = pixelBufferOut;
        uint64_t v70 = v62 + 352 * v63;
        float v71 = *(float *)(v70 + 24);
        double v73 = *(double *)(v70 + 264);
        double v72 = *(double *)(v70 + 272);
        double v143 = *(double *)(v70 + 280);
        double v144 = *(double *)(v70 + 288);
        CGFloat v74 = *(double *)(v70 + 200);
        CGFloat v75 = *(double *)(v70 + 208);
        CGFloat v76 = *(double *)(v70 + 216);
        CGFloat v77 = *(double *)(v70 + 224);
        float32x4_t v154 = *(float32x4_t *)v65;
        long long v155 = *(_OWORD *)(v65 + 16);
        long long v156 = *(_OWORD *)(v65 + 32);
        uint64_t v150 = 0;
        v151 = &v150;
        uint64_t v152 = 0x2000000000;
        int v153 = 0;
        OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v68);
        OSType v79 = CVPixelBufferGetPixelFormatType(v69);
        CFTypeRef v80 = CVBufferCopyAttachment(v69, key, 0);
        memset(v182, 0, 32);
        memset(v181, 0, sizeof(v181));
        memset(v180, 0, sizeof(v180));
        memset(v179, 0, sizeof(v179));
        v183.origin.double x = v74;
        v183.origin.double y = v75;
        v183.size.width = v76;
        v183.size.height = v77;
        CGRect v184 = CGRectIntegral(v183);
        double x = v184.origin.x;
        double y = v184.origin.y;
        double v83 = v184.size.width;
        double v84 = v184.size.height;
        CVPixelBufferLockBaseAddress(v68, 1uLL);
        CVPixelBufferLockBaseAddress(v69, 0);
        if (v79 != 875704438)
        {
          v109 = v151;
          int v110 = -12503;
LABEL_122:
          *((_DWORD *)v109 + 6) = v110;
          goto LABEL_123;
        }
        switch(PixelFormatType)
        {
          case 0x20u:
            if (v80 && CFEqual(v80, cf2))
            {
              _ZF = v71 == 1.0;
              uint64_t v86 = bvc_FullComposition_ARGB_420v709;
              int v87 = (uint64_t (*)(double *, uint64_t *, uint64_t *, uint64_t *, void *, double, double, double, double, double, double, double, double, float))bvc_FullCompositionOpaque_ARGB_420v709;
            }
            else
            {
              _ZF = v71 == 1.0;
              uint64_t v86 = bvc_FullComposition_ARGB_420v601;
              int v87 = (uint64_t (*)(double *, uint64_t *, uint64_t *, uint64_t *, void *, double, double, double, double, double, double, double, double, float))bvc_FullCompositionOpaque_ARGB_420v601;
            }
            break;
          case 0x42475241u:
            if (v80 && CFEqual(v80, cf2))
            {
              _ZF = v71 == 1.0;
              uint64_t v86 = bvc_FullComposition_BGRA_420v709;
              int v87 = (uint64_t (*)(double *, uint64_t *, uint64_t *, uint64_t *, void *, double, double, double, double, double, double, double, double, float))bvc_FullCompositionOpaque_BGRA_420v709;
            }
            else
            {
              _ZF = v71 == 1.0;
              uint64_t v86 = bvc_FullComposition_BGRA_420v601;
              int v87 = (uint64_t (*)(double *, uint64_t *, uint64_t *, uint64_t *, void *, double, double, double, double, double, double, double, double, float))bvc_FullCompositionOpaque_BGRA_420v601;
            }
            break;
          case 0x34323076u:
            _ZF = v71 == 1.0;
            uint64_t v86 = bvc_FullComposition_420v_420v;
            int v87 = bvc_FullCompositionOpaque_420v_420v;
            break;
          default:
            goto LABEL_121;
        }
        if (_ZF) {
          v111 = v87;
        }
        else {
          v111 = v86;
        }
        v139 = (uint64_t (*)(float32x4_t *, void *, void *, void *, void *, double, double, double, double, double, double, double, double, double))v111;
        if (!CVPixelBufferIsPlanar(v68))
        {
          if (CVPixelBufferIsPlanar(v68))
          {
            uint64_t v113 = 1;
LABEL_100:
            for (size_t i = 0; i != v113; ++i)
            {
              v182[i] = CVPixelBufferGetBytesPerRowOfPlane(v68, i);
              v180[i] = CVPixelBufferGetBaseAddressOfPlane(v68, i);
            }
            goto LABEL_104;
          }
LABEL_103:
          v182[0] = CVPixelBufferGetBytesPerRow(v68);
          v180[0] = CVPixelBufferGetBaseAddress(v68);
          goto LABEL_104;
        }
        size_t PlaneCount = CVPixelBufferGetPlaneCount(v68);
        if (PlaneCount >= 5)
        {
LABEL_121:
          v109 = v151;
          int v110 = -12502;
          goto LABEL_122;
        }
        uint64_t v113 = PlaneCount;
        if (!CVPixelBufferIsPlanar(v68)) {
          goto LABEL_103;
        }
        if (v113) {
          goto LABEL_100;
        }
LABEL_104:
        if (!CVPixelBufferIsPlanar(v69))
        {
          if (CVPixelBufferIsPlanar(v69))
          {
            uint64_t v116 = 1;
LABEL_111:
            for (size_t j = 0; j != v116; ++j)
            {
              v181[j] = CVPixelBufferGetBytesPerRowOfPlane(v69, j);
              v179[j] = CVPixelBufferGetBaseAddressOfPlane(v69, j);
            }
LABEL_115:
            if (FigThreadGetMaxLogicalCoreCount() < 2)
            {
              float32x4_t v157 = v154;
              long long v158 = v155;
              long long v159 = v156;
              *(float *)&double v137 = v71;
              int v121 = v139(&v157, v182, v180, v181, v179, v73, v72, v143, v144, x, y, v83, v84, v137);
              *((_DWORD *)v151 + 6) = v121;
            }
            else
            {
              double v118 = v83 * v84 / 19200.0;
              if (v118 <= 1.0) {
                double v119 = 1.0;
              }
              else {
                double v119 = (double)(unint64_t)v118;
              }
              double v120 = fmax(v84 / v119, 1.0);
              *(void *)&block.a = MEMORY[0x1E4F143A8];
              *(void *)&block.b = 0x40000000;
              *(void *)&block.c = __bvc_blitLayer_block_invoke;
              *(void *)&block.d = &unk_1E57A23B0;
              block.tdouble y = x;
              double v161 = y;
              double v162 = v83;
              double v163 = v84;
              unint64_t v164 = ((unint64_t)v120 & 1) + (unint64_t)v120;
              size_t v165 = (unint64_t)fmax(v84 / (double)v164, 1.0);
              v166 = (uint64_t (*)(void, void, void, void, void, double, double, double, double, double, double, double, double, double))v139;
              double v167 = v73;
              double v168 = v72;
              double v169 = v143;
              double v170 = v144;
              long long v172 = v155;
              long long v173 = v156;
              float32x4_t v171 = v154;
              float v178 = v71;
              v174 = v182;
              v175 = v180;
              v176 = v181;
              v177 = v179;
              *(void *)&block.tdouble x = &v150;
              dispatch_apply(v165, queue, &block);
            }
            goto LABEL_123;
          }
LABEL_114:
          v181[0] = CVPixelBufferGetBytesPerRow(v69);
          v179[0] = CVPixelBufferGetBaseAddress(v69);
          goto LABEL_115;
        }
        size_t v115 = CVPixelBufferGetPlaneCount(v69);
        if (v115 < 5)
        {
          uint64_t v116 = v115;
          if (CVPixelBufferIsPlanar(v69))
          {
            if (!v116) {
              goto LABEL_115;
            }
            goto LABEL_111;
          }
          goto LABEL_114;
        }
        *((_DWORD *)v151 + 6) = -12503;
LABEL_123:
        CVPixelBufferUnlockBaseAddress(v68, 1uLL);
        CVPixelBufferUnlockBaseAddress(v69, 0);
        if (v80) {
          CFRelease(v80);
        }
        int v58 = *((_DWORD *)v151 + 6);
        _Block_object_dispose(&v150, 8);
        uint64_t v122 = *(void *)(a1 + 64);
        uint64_t v123 = (FigGetUpTimeNanoseconds() - v67) / 1000;
        ++*(_DWORD *)(v122 + 440);
        uint64_t v124 = *(void *)(v122 + 424);
        *(void *)(v122 + 432) += v123;
        uint64_t v125 = *(void *)(v122 + 416);
        if (v125 >= (int)v123) {
          uint64_t v125 = (int)v123;
        }
        if (v124 <= (int)v123) {
          uint64_t v123 = (int)v123;
        }
        else {
          uint64_t v123 = v124;
        }
        *(void *)(v122 + 416) = v125;
        *(void *)(v122 + 424) = v123;
        if (v58) {
          goto LABEL_135;
        }
      }
      uint64_t v93 = v62 + 352 * v63;
      float32x4_t v94 = *(float32x4_t *)v65;
      long long v95 = *(_OWORD *)(v64 + 112);
      *(_OWORD *)&block.c = *(_OWORD *)(v64 + 96);
      *(_OWORD *)&block.tdouble x = v95;
      *(float32x4_t *)&block.a = v94;
      CGAffineTransformInvert(&v148, &block);
      CGRect v185 = CGRectApplyAffineTransform(*(CGRect *)(v93 + 200), &v148);
      CGFloat v96 = v185.origin.x;
      CGFloat v97 = v185.origin.y;
      CGFloat v98 = v185.size.width;
      CGFloat v99 = v185.size.height;
      uint64_t v145 = FigGetUpTimeNanoseconds();
      int v104 = bvc_mixBuffers(*(NSObject **)(*(void *)(a1 + 64) + 256), *(CVPixelBufferRef *)v64, pixelBufferOut, pixelBufferOut, v100, v101, v102, v103, *(float *)(v93 + 24), v96, v97, v98, v99, *(void *)(v93 + 200), *(void *)(v93 + 208), *(void *)(v93 + 216), *(void *)(v93 + 224), *(void *)(v93 + 200), *(void *)(v93 + 208),
               *(void *)(v93 + 216),
               *(void *)(v93 + 224));
      uint64_t v105 = *(void *)(a1 + 64);
      uint64_t v106 = (FigGetUpTimeNanoseconds() - v145) / 1000;
      ++*(_DWORD *)(v105 + 440);
      uint64_t v107 = *(void *)(v105 + 424);
      *(void *)(v105 + 432) += v106;
      uint64_t v108 = *(void *)(v105 + 416);
      if (v108 >= (int)v106) {
        uint64_t v108 = (int)v106;
      }
      if (v107 <= (int)v106) {
        uint64_t v106 = (int)v106;
      }
      else {
        uint64_t v106 = v107;
      }
      *(void *)(v105 + 416) = v108;
      *(void *)(v105 + 424) = v106;
      if (v104)
      {
        if ((v104 + 12503) > 1)
        {
          int v58 = v104;
          goto LABEL_135;
        }
        goto LABEL_46;
      }
      ++*(_DWORD *)(*(void *)(a1 + 64) + 376);
    }
  }
  float32x4_t v154 = (float32x4_t)xmmword_194995D60;
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 120), @"BackgroundColorARGB");
  if (Value)
  {
    CFArrayRef v37 = Value;
    CFTypeID TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v37))
    {
      CFIndex v39 = 0;
      v40 = &v154;
      do
      {
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v37, v39);
        if (ValueAtIndex)
        {
          CFNumberRef v42 = ValueAtIndex;
          CFTypeID v43 = CFNumberGetTypeID();
          if (v43 == CFGetTypeID(v42)) {
            CFNumberGetValue(v42, kCFNumberFloat32Type, v40);
          }
        }
        ++v39;
        v40 = (float32x4_t *)((char *)v40 + 4);
      }
      while (v39 != 4);
    }
  }
  CVPixelBufferRef v44 = pixelBufferOut;
  LODWORD(v150) = 0;
  OSType v45 = CVPixelBufferGetPixelFormatType(pixelBufferOut);
  CFTypeRef v46 = CVBufferCopyAttachment(v44, key, 0);
  size_t v47 = CVPixelBufferGetWidth(v44);
  size_t v48 = CVPixelBufferGetHeight(v44);
  memset(&block, 0, 32);
  float32x4_t v157 = 0u;
  long long v158 = 0u;
  CVPixelBufferLockBaseAddress(v44, 0);
  int8x16_t v49 = (int8x16_t)vcgezq_f32(v154);
  __asm { FMOV            V2.4S, #1.0 }
  float32x4_t v54 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  int16x8_t v55 = (int16x8_t)vcvtq_s32_f32((float32x4_t)vandq_s8(vbslq_s8(vbicq_s8(v49, (int8x16_t)vcgtq_f32(v154, _Q2)), (int8x16_t)vmulq_f32(v154, v54), (int8x16_t)v54), v49));
  *(int16x4_t *)v55.i8 = vmovn_s32((int32x4_t)v55);
  LODWORD(v150) = vmovn_s16(v55).u32[0];
  if (v45 != 875704438)
  {
    int v58 = -12503;
    goto LABEL_40;
  }
  if (!v46 || (int v56 = CFEqual(v46, (CFTypeRef)*MEMORY[0x1E4F24C48]), v57 = bvc_Fill_32ARGB_420v709, !v56)) {
    int v57 = bvc_Fill_32ARGB_420v601;
  }
  v142 = v57;
  if (CVPixelBufferIsPlanar(v44))
  {
    size_t v59 = CVPixelBufferGetPlaneCount(v44);
    if (CVPixelBufferIsPlanar(v44))
    {
      if (!v59) {
        goto LABEL_39;
      }
LABEL_35:
      for (size_t k = 0; k != v59; ++k)
      {
        *((void *)&block.a + k) = CVPixelBufferGetBytesPerRowOfPlane(v44, k);
        v157.i64[k] = (uint64_t)CVPixelBufferGetBaseAddressOfPlane(v44, k);
      }
      goto LABEL_39;
    }
  }
  else if (CVPixelBufferIsPlanar(v44))
  {
    size_t v59 = 1;
    goto LABEL_35;
  }
  *(void *)&block.a = CVPixelBufferGetBytesPerRow(v44);
  v157.i64[0] = (uint64_t)CVPixelBufferGetBaseAddress(v44);
LABEL_39:
  v142(v47, v48, (unsigned __int8 *)&v150, (uint64_t *)&block, (char **)&v157);
  int v58 = 0;
LABEL_40:
  CVPixelBufferUnlockBaseAddress(v44, 0);
  if (v46) {
    CFRelease(v46);
  }
  if (v45 == 875704438) {
    goto LABEL_43;
  }
LABEL_135:
  dispatch_sync(*(dispatch_queue_t *)(*(void *)(a1 + 64) + 272), &__block_literal_global_31_1);
  uint64_t v126 = *(void *)(a1 + 64);
  v127 = *(NSObject **)(v126 + 272);
  v146[0] = MEMORY[0x1E4F143A8];
  v146[1] = 0x40000000;
  v146[2] = __basicVideoCompositor_RenderFrame_block_invoke_7;
  v146[3] = &__block_descriptor_tmp_32_0;
  uint64_t v128 = *(void *)(a1 + 128);
  v146[4] = v126;
  v146[5] = v128;
  int v147 = v58;
  v146[6] = pixelBufferOut;
  dispatch_async(v127, v146);
  unint64_t v129 = *(void *)(a1 + 112);
  if (v129)
  {
    for (unint64_t m = 0; m < v129; ++m)
    {
      v131 = *(const void **)(*(void *)(a1 + 104) + 352 * *(void *)(*(void *)(a1 + 96) + 8 * m));
      if (v131)
      {
        CFRelease(v131);
        unint64_t v129 = *(void *)(a1 + 112);
      }
    }
  }
  free(*(void **)(a1 + 104));
  free(*(void **)(a1 + 96));
  v132 = *(const void **)(a1 + 48);
  if (v132) {
    CFRelease(v132);
  }
  v133 = *(const void **)(a1 + 56);
  if (v133) {
    CFRelease(v133);
  }
  v134 = *(const void **)(a1 + 72);
  if (v134) {
    CFRelease(v134);
  }
  v135 = *(const void **)(a1 + 80);
  if (v135) {
    CFRelease(v135);
  }
  v136 = *(const void **)(a1 + 88);
  if (v136) {
    CFRelease(v136);
  }
}

void __basicVideoCompositor_RenderFrame_block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CVReturn v3 = *(void (**)(void, void, void, void))(v2 + 296);
  if (v3) {
    v3(*(void *)(v2 + 304), *(void *)(a1 + 40), *(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
  }
  CFDictionaryRef v4 = *(const void **)(a1 + 48);
  if (v4)
  {
    CFRelease(v4);
  }
}

uint64_t __openglVideoCompositor_RenderFrame_block_invoke(uint64_t result)
{
  if (!*(void *)(*(void *)(result + 40) + 648))
  {
    uint64_t v1 = result;
    uint64_t result = FigSignalErrorAt();
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t __openglVideoCompositor_RenderFrame_block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t result = FigGetUpTimeNanoseconds();
  uint64_t v5 = (result - v3) / 1000;
  ++*(_DWORD *)(v2 + 816);
  *(void *)(v2 + 808) += v5;
  uint64_t v6 = *(void *)(v2 + 792);
  if (v6 >= v5) {
    uint64_t v6 = (result - v3) / 1000;
  }
  *(void *)(v2 + 792) = v6;
  if (*(void *)(v2 + 800) > v5) {
    uint64_t v5 = *(void *)(v2 + 800);
  }
  *(void *)(v2 + 800) = v5;
  uint64_t v7 = a1[4];
  CFStringRef v8 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v7 + 648);
  if (v8)
  {
    uint64_t v9 = *(void *)(v7 + 656);
    uint64_t v10 = a1[6];
    uint64_t v11 = a1[7];
    return v8(v9, v10, 0, v11);
  }
  return result;
}

void __mvc_RenderFrame_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void (**)(void, void, void, void))(v2 + 24);
  if (v3) {
    v3(*(void *)(v2 + 32), a1[6], 0, *(void *)(*(void *)(a1[4] + 8) + 24));
  }
  CFDictionaryRef v4 = (const void *)a1[7];
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = *(const void **)(*(void *)(a1[4] + 8) + 24);
  if (v5)
  {
    CFRelease(v5);
  }
}

@end