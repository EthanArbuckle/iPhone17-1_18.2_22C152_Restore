@interface DepthWrapperEncoder
@end

@implementation DepthWrapperEncoder

void __DepthWrapperEncoder_EncodeFrame_block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, CMSampleBufferRef sbuf)
{
  uint64_t CopyWithNewFormatDescription = a2;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a2) {
    goto LABEL_22;
  }
  CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(void *)(v8 + 48))
  {
    if (FigCFEqual())
    {
LABEL_21:
      uint64_t CopyWithNewFormatDescription = FigSampleBufferCreateCopyWithNewFormatDescription();
      goto LABEL_22;
    }
    uint64_t v8 = *(void *)(a1 + 32);
  }
  v9 = *(const void **)(v8 + 64);
  *(void *)(v8 + 64) = FormatDescription;
  if (FormatDescription) {
    CFRetain(FormatDescription);
  }
  if (v9) {
    CFRelease(v9);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(const void **)(v10 + 48);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(*(void *)(a1 + 32) + 48) = 0;
    uint64_t v10 = *(void *)(a1 + 32);
  }
  v12 = *(const opaqueCMFormatDescription **)(v10 + 64);
  CMVideoCodecType v13 = *(_DWORD *)(v10 + 16);
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  float32x2_t v14 = *(float32x2_t *)(v10 + 40);
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v12);
  CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions(v12);
  if (Extensions)
  {
    CFDictionaryRef v17 = Extensions;
    unsigned int v28 = a3;
    v18 = (const void *)*MEMORY[0x1E4F1EE20];
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x1E4F1EE20]);
    if (Value)
    {
      CFDictionaryRef v20 = Value;
      *(_DWORD *)bytes = 0;
      char v31 = 1;
      int8x8_t v32 = vrev32_s8((int8x8_t)vmovn_s64((int64x2_t)vcvtq_n_u64_f64(vcvtq_f64_f32(v14), 0x10uLL)));
      CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFDataRef v22 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, 13);
      if (v22)
      {
        CFDataRef v23 = v22;
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v21, 0, v17);
        if (MutableCopy)
        {
          v25 = MutableCopy;
          v26 = CFDictionaryCreateMutableCopy(v21, 0, v20);
          if (v26)
          {
            v27 = v26;
            CFDictionarySetValue(v26, @"disc", v23);
            CFDictionarySetValue(v25, v18, v27);
            CFDictionaryRemoveValue(v25, (const void *)*MEMORY[0x1E4F1EE58]);
            CFDictionaryRemoveValue(v25, (const void *)*MEMORY[0x1E4F1EE50]);
            uint64_t CopyWithNewFormatDescription = CMVideoFormatDescriptionCreate(v21, v13, Dimensions.width, Dimensions.height, v25, &formatDescriptionOut);
            if (CopyWithNewFormatDescription)
            {
              a3 = v28;
              if (formatDescriptionOut) {
                CFRelease(formatDescriptionOut);
              }
            }
            else
            {
              *(void *)(v10 + 48) = formatDescriptionOut;
              CMVideoFormatDescriptionRef formatDescriptionOut = 0;
              a3 = v28;
            }
            CFRelease(v25);
            CFRelease(v27);
            goto LABEL_19;
          }
          uint64_t CopyWithNewFormatDescription = FigSignalErrorAt();
          CFRelease(v25);
        }
        else
        {
          uint64_t CopyWithNewFormatDescription = FigSignalErrorAt();
        }
        a3 = v28;
LABEL_19:
        CFRelease(v23);
        goto LABEL_20;
      }
      uint64_t CopyWithNewFormatDescription = FigSignalErrorAt();
    }
    else
    {
      uint64_t CopyWithNewFormatDescription = FigSignalErrorAt();
    }
    a3 = v28;
  }
  else
  {
    uint64_t CopyWithNewFormatDescription = FigSignalErrorAt();
  }
LABEL_20:
  if (!CopyWithNewFormatDescription) {
    goto LABEL_21;
  }
LABEL_22:
  depthencoder_emitEncodedFrame(*(void *)(a1 + 40), *(const void **)(a1 + 48), CopyWithNewFormatDescription, a3, 0);
}

@end