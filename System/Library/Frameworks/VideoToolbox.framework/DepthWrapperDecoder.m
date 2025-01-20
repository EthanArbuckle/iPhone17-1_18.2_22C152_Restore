@interface DepthWrapperDecoder
@end

@implementation DepthWrapperDecoder

void __DepthWrapperDecoder_DecodeFrame_block_invoke(uint64_t a1, uint64_t a2, int a3, __CVBuffer *a4)
{
  uint64_t v4 = a2;
  v6 = 0;
  if (a2) {
    a4 = 0;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v8 = a3 & 0xFFFFFFFE | (*(unsigned char *)(a1 + 56) != 0);
  if (!a2 && a4)
  {
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    PixelBufferPool = (__CVPixelBufferPool *)VTDecoderSessionGetPixelBufferPool(*(uint64_t **)(*(void *)(a1 + 32) + 8));
    uint64_t v11 = CVPixelBufferPoolCreatePixelBuffer(v9, PixelBufferPool, &pixelBufferOut);
    v6 = pixelBufferOut;
    if (v11)
    {
      uint64_t v4 = v11;
    }
    else
    {
      VTVideoDecoderGetCMBaseObject(*(void *)(a1 + 40));
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      size_t Width = CVPixelBufferGetWidth(a4);
      size_t Height = CVPixelBufferGetHeight(a4);
      CVPixelBufferLockBaseAddress(a4, 1uLL);
      CVPixelBufferLockBaseAddress(v6, 0);
      BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a4);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      v17 = (char *)CVPixelBufferGetBaseAddress(v6);
      size_t v18 = CVPixelBufferGetBytesPerRow(v6);
      if (Height)
      {
        uint64_t v19 = 0;
        uint64_t v20 = *(void *)(DerivedStorage + 72);
        do
        {
          if (Width)
          {
            for (uint64_t i = 0; i != Width; ++i)
              *(_WORD *)&v17[2 * i] = *(_WORD *)(v20 + (((unint64_t)BaseAddress[i] >> 5) & 0x7FE));
          }
          BaseAddress = (unsigned __int16 *)((char *)BaseAddress + BytesPerRow);
          v17 += v18;
          ++v19;
        }
        while (v19 != Height);
      }
      CVPixelBufferUnlockBaseAddress(a4, 1uLL);
      CVPixelBufferUnlockBaseAddress(v6, 0);
      uint64_t v4 = 0;
      v6 = pixelBufferOut;
    }
  }
  depthdecoder_emitDecodedFrame(*(void *)(a1 + 40), *(const void **)(a1 + 48), v4, v8, v6);
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
}

@end