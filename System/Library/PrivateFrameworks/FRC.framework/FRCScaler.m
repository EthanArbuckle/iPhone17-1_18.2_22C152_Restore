@interface FRCScaler
- (FRCScaler)init;
- (void)dealloc;
- (void)downScaleFrameSource:(__CVBuffer *)a3 destination:(__CVBuffer *)a4 rotate:(int64_t)a5 waitForCompletion:(BOOL)a6;
- (void)scaleFrameSource:(__CVBuffer *)a3 destination:(__CVBuffer *)a4 cropRectangles:(id *)a5 upscale:(BOOL)a6 rotate:(int64_t)a7 waitForCompletion:(BOOL)a8;
- (void)upScaleAndCropFrameSource:(__CVBuffer *)a3 destination:(__CVBuffer *)a4 upscale:(BOOL)a5 rotate:(int64_t)a6 waitForCompletion:(BOOL)a7;
@end

@implementation FRCScaler

- (FRCScaler)init
{
  v5.receiver = self;
  v5.super_class = (Class)FRCScaler;
  v2 = [(FRCScaler *)&v5 init];
  if (v2 && (IOSurfaceAcceleratorCreate(), !v2->_scaler))
  {
    NSLog(&cfstr_FailedToCreate_1.isa);
    v3 = 0;
  }
  else
  {
    v3 = v2;
  }

  return v3;
}

- (void)scaleFrameSource:(__CVBuffer *)a3 destination:(__CVBuffer *)a4 cropRectangles:(id *)a5 upscale:(BOOL)a6 rotate:(int64_t)a7 waitForCompletion:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v15 = Mutable;
  if (v8)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6ED60], (const void *)*MEMORY[0x1E4F1CFD0]);
    if (v10)
    {
LABEL_3:
      v16 = (const void *)*MEMORY[0x1E4F1CFD0];
      CFDictionarySetValue(v15, (const void *)*MEMORY[0x1E4F6EC58], (const void *)*MEMORY[0x1E4F1CFD0]);
      CFDictionarySetValue(v15, (const void *)*MEMORY[0x1E4F6ECC8], v16);
      if (!a7) {
        goto LABEL_4;
      }
LABEL_8:
      switch(a7)
      {
        case 3:
          int v17 = 3;
          break;
        case 2:
          int v17 = 7;
          break;
        case 1:
          int v17 = 4;
          break;
        default:
          LODWORD(valuePtr) = 0;
LABEL_16:
          CFNumberRef v18 = CFNumberCreate(v13, kCFNumberIntType, &valuePtr);
          CFDictionarySetValue(v15, (const void *)*MEMORY[0x1E4F6ED68], v18);
          CFRelease(v18);
          if (v8) {
            goto LABEL_5;
          }
          goto LABEL_17;
      }
      LODWORD(valuePtr) = v17;
      goto LABEL_16;
    }
  }
  if (a7) {
    goto LABEL_8;
  }
LABEL_4:
  if (v8)
  {
LABEL_5:
    CVPixelBufferGetIOSurface(a3);
    CVPixelBufferGetIOSurface(a4);
    goto LABEL_18;
  }
LABEL_17:
  long long valuePtr = xmmword_1F37CFB50;
  uint64_t v26 = qword_1F37CFB60;
  CVPixelBufferGetIOSurface(a3);
  CVPixelBufferGetIOSurface(a4);
LABEL_18:
  if (IOSurfaceAcceleratorTransformSurface())
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    size_t v22 = CVPixelBufferGetWidth(a4);
    size_t v23 = CVPixelBufferGetHeight(a4);
    uint64_t v24 = CVPixelBufferGetPixelFormatType(a4);
    NSLog(&cfstr_ScalerErrorFai.isa, Width, Height, PixelFormatType, v22, v23, v24);
  }
  CFRelease(v15);
}

- (void)downScaleFrameSource:(__CVBuffer *)a3 destination:(__CVBuffer *)a4 rotate:(int64_t)a5 waitForCompletion:(BOOL)a6
{
  BOOL v6 = a6;
  kdebug_trace();
  long long v14 = 0u;
  long long v11 = 0u;
  size_t v12 = CVPixelBufferGetWidth(a3) << 16;
  size_t v13 = CVPixelBufferGetHeight(a3) << 16;
  [(FRCScaler *)self scaleFrameSource:a3 destination:a4 cropRectangles:&v11 upscale:0 rotate:a5 waitForCompletion:v6];
  kdebug_trace();
}

- (void)upScaleAndCropFrameSource:(__CVBuffer *)a3 destination:(__CVBuffer *)a4 upscale:(BOOL)a5 rotate:(int64_t)a6 waitForCompletion:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  kdebug_trace();
  size_t Width = CVPixelBufferGetWidth(a4);
  int v14 = Width;
  size_t v23 = Width;
  size_t Height = CVPixelBufferGetHeight(a4);
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  int v20 = v14;
  int v21 = Height;
  if ((unint64_t)(a6 - 1) <= 1) {
    swapWidthAndHeight((uint64_t *)&v23, (uint64_t *)&Height);
  }
  if (v9)
  {
    unint64_t v15 = (v23 << 15) & 0xFFFFFFFFFFFF0000;
    unint64_t v16 = (Height << 15) & 0xFFFFFFFFFFFF0000;
  }
  else
  {
    unint64_t v15 = v23 << 16;
    unint64_t v16 = Height << 16;
  }
  *(void *)&long long v18 = v15;
  *((void *)&v18 + 1) = v16;
  [(FRCScaler *)self scaleFrameSource:a3 destination:a4 cropRectangles:&v17 upscale:v9 rotate:a6 waitForCompletion:v7];
  kdebug_trace();
}

- (void)dealloc
{
  scaler = self->_scaler;
  if (scaler) {
    CFRelease(scaler);
  }
  v4.receiver = self;
  v4.super_class = (Class)FRCScaler;
  [(FRCScaler *)&v4 dealloc];
}

@end