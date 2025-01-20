@interface SRSEnhancementFilter
@end

@implementation SRSEnhancementFilter

void __SRSEnhancementFilter_ProcessFrame_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (*(unsigned char *)(v2 + 32))
  {
    if (*(unsigned char *)(v2 + 33))
    {
      v3 = *(__CVBuffer **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      goto LABEL_10;
    }
    v3 = *(__CVBuffer **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    v4 = v3;
  }
  else
  {
    if (*(unsigned char *)(v2 + 33)) {
      goto LABEL_11;
    }
    v3 = 0;
    v4 = *(__CVBuffer **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  CVPixelBufferGetIOSurface(v4);
  uint64_t v5 = IOSurfaceAcceleratorTransformSurface();
  if (v5) {
    goto LABEL_41;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 32))
  {
    CVBufferPropagateAttachments(*(CVBufferRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v4);
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (*(unsigned char *)(v2 + 32))
    {
LABEL_10:
      uint64_t v5 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(v2 + 48), v3, *(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
      if (!v5) {
        goto LABEL_11;
      }
LABEL_41:
      uint64_t v26 = v5;
      CFDictionaryRef v22 = 0;
      CFMutableDictionaryRef v18 = 0;
      CFTypeRef v24 = 0;
      goto LABEL_28;
    }
  }
LABEL_11:
  if (!*(unsigned char *)(a1 + 96)) {
    goto LABEL_23;
  }
  v6 = (const void *)*MEMORY[0x1E4F24A78];
  CFTypeRef v7 = CVBufferCopyAttachment(*(CVBufferRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), (CFStringRef)*MEMORY[0x1E4F24A78], 0);
  if (!v7) {
    goto LABEL_23;
  }
  v8 = v7;
  v9 = *(_DWORD **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  int v11 = v9[2];
  int v10 = v9[3];
  int v12 = v9[6];
  int v13 = v9[7];
  LODWORD(v32) = 0;
  uint64_t v35 = 0;
  float v34 = 0.0;
  if (!FigCFDictionaryGetFloat32IfPresent()) {
    goto LABEL_22;
  }
  if (!FigCFDictionaryGetFloat32IfPresent()) {
    goto LABEL_22;
  }
  if (!FigCFDictionaryGetFloat32IfPresent()) {
    goto LABEL_22;
  }
  if (!FigCFDictionaryGetFloat32IfPresent()) {
    goto LABEL_22;
  }
  float v14 = (float)v12 / (float)v11;
  float v15 = (float)v13 / (float)v10;
  *(float *)&long long v32 = v14 * *(float *)&v32;
  *(float *)&uint64_t v35 = v14 * *(float *)&v35;
  *((float *)&v35 + 1) = v15 * *((float *)&v35 + 1);
  float v34 = v15 * v34;
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable)
  {
LABEL_22:
    CFRelease(v8);
LABEL_23:
    CVBufferPropagateAttachments(*(CVBufferRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(CVBufferRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    CFMutableDictionaryRef v18 = 0;
    goto LABEL_24;
  }
  CFMutableDictionaryRef v18 = Mutable;
  FigCFDictionarySetFloat32();
  FigCFDictionarySetFloat32();
  FigCFDictionarySetFloat32();
  FigCFDictionarySetFloat32();
  CFRelease(v8);
  CFDictionaryRef v19 = CVBufferCopyAttachments(*(CVBufferRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), kCVAttachmentMode_ShouldPropagate);
  if (v19)
  {
    CFDictionaryRef v20 = v19;
    MutableCopy = CFDictionaryCreateMutableCopy(v16, 0, v19);
    CFDictionaryRef v22 = MutableCopy;
    if (MutableCopy)
    {
      CFDictionarySetValue(MutableCopy, v6, v18);
      CVBufferSetAttachments(*(CVBufferRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v22, kCVAttachmentMode_ShouldPropagate);
    }
    CFRelease(v20);
    goto LABEL_25;
  }
LABEL_24:
  CFDictionaryRef v22 = 0;
LABEL_25:
  IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  CFTypeRef v24 = IOSurfaceCopyValue(IOSurface, @"DolbyVisionRPUData");
  if (v24)
  {
    v25 = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    IOSurfaceSetValue(v25, @"DolbyVisionRPUData", v24);
  }
  uint64_t v26 = 0;
LABEL_28:
  v27 = **(uint64_t ***)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v28 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  long long v32 = *(_OWORD *)(a1 + 72);
  uint64_t v33 = *(void *)(a1 + 88);
  VTTemporalFilterPluginSessionEmitOutputFrame(v27, v26, 0, &v32, v28);
  VTTemporalFilterPluginSessionConcludeInputFrame(**(uint64_t ***)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(const void **)(a1 + 64));
  if (v18) {
    CFRelease(v18);
  }
  if (v22) {
    CFRelease(v22);
  }
  v29 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v29) {
    CFRelease(v29);
  }
  v30 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v30) {
    CFRelease(v30);
  }
  v31 = *(const void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v31) {
    CFRelease(v31);
  }
  if (v24) {
    CFRelease(v24);
  }
}

@end