@interface OutputCustomFrame
@end

@implementation OutputCustomFrame

void __customVideoCompositor_OutputCustomFrame_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 64);
  v3 = *(void **)(a1 + 40);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (v3)
  {
    uint64_t v5 = DerivedStorage;
    CFTypeID TypeID = CVPixelBufferGetTypeID();
    if (TypeID == CFGetTypeID(v3)
      && CVPixelBufferGetIOSurface((CVPixelBufferRef)v3)
      && IOSurfaceNeedsBindAccel())
    {
      uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
      IOSurfaceBindAccel();
      uint64_t v8 = FigGetUpTimeNanoseconds();
      uint64_t v9 = (v8 - UpTimeNanoseconds) / 1000;
      ++*(_DWORD *)(v5 + 416);
      uint64_t v10 = *(void *)(v5 + 400);
      *(void *)(v5 + 408) += v9;
      uint64_t v11 = *(void *)(v5 + 392);
      if (v11 >= v9) {
        uint64_t v11 = (v8 - UpTimeNanoseconds) / 1000;
      }
      if (v10 > v9) {
        uint64_t v9 = v10;
      }
      *(void *)(v5 + 392) = v11;
      *(void *)(v5 + 400) = v9;
    }
  }
  MEMORY[0x19970E910](*(void *)(*(void *)(a1 + 48) + 296));
  CFSetRemoveValue(*(CFMutableSetRef *)(*(void *)(a1 + 48) + 304), *(const void **)(a1 + 56));
  MEMORY[0x19970E930](*(void *)(*(void *)(a1 + 48) + 296));
  FigSemaphoreSignal();
  uint64_t v12 = *(void *)(a1 + 48);
  v13 = *(void (**)(void, void, uint64_t, void))(v12 + 176);
  if (v13) {
    v13(*(void *)(v12 + 184), *(void *)(a1 + 56), v2, *(void *)(a1 + 40));
  }
  v14 = *(const void **)(a1 + 32);
  if (v14) {
    CFRelease(v14);
  }
  v15 = *(const void **)(a1 + 40);
  if (v15)
  {
    CFRelease(v15);
  }
}

@end