@interface MuxedAlphaDecoder
@end

@implementation MuxedAlphaDecoder

void __MuxedAlphaDecoder_DecodeFrame_block_invoke(uint64_t a1, int a2, int a3, uint64_t a4, const void *a5)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 44) = a3;
  if (a2) {
    a5 = 0;
  }
  if (a5) {
    CFRetain(a5);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = a5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  v7 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = 0;
  }
}

void __MuxedAlphaDecoder_DecodeFrame_block_invoke_2(uint64_t a1, int a2, int a3, uint64_t a4, const void *a5)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 44) = a3;
  if (a2) {
    a5 = 0;
  }
  if (a5) {
    CFRetain(a5);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = a5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  v7 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = 0;
  }
}

void __MuxedAlphaDecoder_DecodeFrame_block_invoke_3(uint64_t a1, int a2, int a3, const void *a4)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 44) = a3;
  if (a2) {
    a4 = 0;
  }
  if (a4) {
    CFRetain(a4);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = a4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  v6 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = 0;
  }
}

void __MuxedAlphaDecoder_DecodeFrame_block_invoke_4(uint64_t a1, int a2, int a3, const void *a4)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 44) = a3;
  if (a2) {
    a4 = 0;
  }
  if (a4) {
    CFRetain(a4);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = a4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  v6 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = 0;
  }
}

void __MuxedAlphaDecoder_DecodeFrame_block_invoke_5(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!*(_DWORD *)(v2 + 24)) {
    *(_DWORD *)(v2 + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 44) | *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                              + 44);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24) & 0xFFFFFFFE | (*(unsigned char *)(a1 + 112) != 0);
  uint64_t v3 = *(void *)(a1 + 80);
  int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (*(unsigned char *)(v3 + 136))
  {
    if (!v4)
    {
      v21 = *(OpaqueCMTaggedBufferGroup **)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      if (v21)
      {
        if (!*(unsigned char *)(v3 + 124))
        {
          v22 = *(OpaqueCMTaggedBufferGroup **)(*(void *)(*(void *)(a1 + 40) + 8) + 56);
          v23 = *(OpaqueCMTaggedBufferGroup **)(*(void *)(*(void *)(a1 + 48) + 8) + 56);
          CMItemCount Count = CMTaggedBufferGroupGetCount(v22);
          if (Count == CMTaggedBufferGroupGetCount(v23))
          {
            if (CMTaggedBufferGroupGetCount(v22) < 1)
            {
LABEL_33:
              int v29 = 0;
            }
            else
            {
              CFIndex v25 = 0;
              while (1)
              {
                CVPixelBufferAtIndex = CMTaggedBufferGroupGetCVPixelBufferAtIndex(v22, v25);
                int v27 = CMTaggedBufferGroupGetCVPixelBufferAtIndex(v23, v25);
                v28 = CMTaggedBufferGroupGetCVPixelBufferAtIndex(v21, v25);
                int v29 = alphadecoder_mergeBaseAndAlpha(CVPixelBufferAtIndex, v27, v28);
                if (v29) {
                  break;
                }
                if (++v25 >= CMTaggedBufferGroupGetCount(v22)) {
                  goto LABEL_33;
                }
              }
            }
          }
          else
          {
            int v29 = FigSignalErrorAt();
          }
          *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v29;
        }
      }
    }
    v5 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 56);
    if (v5) {
      CFRelease(v5);
    }
    v6 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 56);
    if (v6) {
      CFRelease(v6);
    }
    v7 = *(const void **)(a1 + 96);
    uint64_t v8 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    uint64_t v9 = *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    v10 = *(OpaqueCMTaggedBufferGroup **)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    VTVideoDecoderGetCMBaseObject(*(void *)(a1 + 88));
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    VTDecoderSessionEmitDecodedMultiImageFrame(*(uint64_t **)(DerivedStorage + 8), v7, v8, v9, v10);
    --*(_DWORD *)(DerivedStorage + 120);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(DerivedStorage + 112));
    dispatch_group_leave(*(dispatch_group_t *)(DerivedStorage + 104));
    for (uint64_t i = 0; ; ++i)
    {
      CFArrayRef v13 = *(const __CFArray **)(*(void *)(a1 + 80) + 128);
      if (v13) {
        CFArrayRef v13 = (const __CFArray *)CFArrayGetCount(v13);
      }
      if (i >= (uint64_t)v13) {
        break;
      }
      uint64_t ValueAtIndex = FigCFArrayGetValueAtIndex();
      VTDecoderSessionForgetPixelBufferForFrame(*(uint64_t **)(*(void *)(a1 + 80) + 8), *(void *)(a1 + 96), ValueAtIndex);
    }
    uint64_t v15 = *(void *)(a1 + 64);
  }
  else
  {
    if (!v4)
    {
      v30 = *(__CVBuffer **)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      if (v30)
      {
        if (!*(unsigned char *)(v3 + 124)) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = alphadecoder_mergeBaseAndAlpha(*(__CVBuffer **)(*(void *)(*(void *)(a1 + 40) + 8)+ 48), *(void *)(*(void *)(*(void *)(a1 + 48)+ 8)+ 48), v30);
        }
      }
    }
    v16 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
    if (v16) {
      CFRelease(v16);
    }
    v17 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 48);
    if (v17) {
      CFRelease(v17);
    }
    alphadecoder_emitDecodedFrame(*(void *)(a1 + 88), *(const void **)(a1 + 96), *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(__CVBuffer **)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
    uint64_t FirstValue = FigCFArrayGetFirstValue();
    VTDecoderSessionForgetPixelBufferForFrame(*(uint64_t **)(*(void *)(a1 + 80) + 8), *(void *)(a1 + 96), FirstValue);
    uint64_t v15 = *(void *)(a1 + 72);
  }
  v19 = *(const void **)(*(void *)(v15 + 8) + 24);
  if (v19) {
    CFRelease(v19);
  }
  v20 = *(NSObject **)(a1 + 104);

  dispatch_release(v20);
}

@end