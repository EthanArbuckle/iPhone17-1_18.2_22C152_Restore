@interface CIBurstYUVImage
- (CIBurstYUVImage)initWithCGImage:(CGImage *)a3 maxDimension:(int)a4;
- (CIBurstYUVImage)initWithCIImage:(id)a3 ctx:(id)a4 maxDimension:(int)a5;
- (CIBurstYUVImage)initWithIOSurface:(__IOSurface *)a3 maxDimension:(int)a4;
- (__CVBuffer)pixelBuffer;
- (char)Cbuffer;
- (char)Ybuffer;
- (int)bytesPerRow;
- (int)height;
- (int)width;
- (void)convertRGBAToYUV420:(char *)a3 rgbaBytesPerRow:(int)a4;
- (void)dealloc;
- (void)setBytesPerRow:(int)a3;
- (void)setCbuffer:(char *)a3;
- (void)setHeight:(int)a3;
- (void)setWidth:(int)a3;
- (void)setYbuffer:(char *)a3;
@end

@implementation CIBurstYUVImage

- (void)convertRGBAToYUV420:(char *)a3 rgbaBytesPerRow:(int)a4
{
  v7 = (char *)malloc_type_malloc((self->height + (self->height >> 1)) * self->bytesPerRow, 0x9A227F9uLL);
  int height = self->height;
  int bytesPerRow = self->bytesPerRow;
  v10 = &v7[height * bytesPerRow];
  self->Ybuffer = v7;
  self->Cbuffer = v10;
  if (height >= 1)
  {
    int v11 = 0;
    uint64_t v12 = a4;
    uint64_t v13 = a4 + 1;
    uint64_t v14 = a4 + 5;
    uint64_t v15 = a4 + 2;
    uint64_t v16 = a4 + 6;
    uint64_t v46 = 2 * a4;
    int width = self->width;
    v18 = a3 + 4;
    v19.i64[0] = 0xFF000000FFLL;
    v19.i64[1] = 0xFF000000FFLL;
    do
    {
      if (width >= 1)
      {
        int v47 = v11;
        uint64_t v20 = 0;
        v21 = v18;
        do
        {
          int v22 = *(v21 - 4);
          int v23 = *v21;
          int v24 = *(v21 - 3);
          int v25 = v21[1];
          int v26 = v21[v12 - 4];
          int v27 = v21[v13 - 4];
          int v28 = *(v21 - 2);
          int v29 = v21[2];
          v30.i32[0] = (301 * v24 + 153 * v22 + 58 * v28 + 256) >> 9;
          int v31 = v21[v15 - 4];
          v30.i32[1] = (301 * v25 + 153 * v23 + 58 * v29 + 256) >> 9;
          v32.i32[0] = ((-170 * v24 - 86 * v22 + (v28 << 8) + 256) >> 9) + 128;
          v32.i32[1] = ((-170 * v25 - 86 * v23 + (v29 << 8) + 256) >> 9) + 128;
          v32.i32[2] = ((-170 * v27 - 86 * v26 + (v31 << 8) + 256) >> 9) + 128;
          int v33 = -214 * v24 + (v22 << 8) - 42 * v28;
          int v34 = v21[v12];
          int v35 = v21[v14 - 4];
          v30.i32[2] = (301 * v27 + 153 * v26 + 58 * v31 + 256) >> 9;
          v36.i32[0] = ((v33 + 256) >> 9) + 128;
          int v37 = v21[v16 - 4];
          v32.i32[3] = ((-170 * v35 - 86 * v34 + (v37 << 8) + 256) >> 9) + 128;
          v36.i32[1] = ((-214 * v25 + (v23 << 8) - 42 * v29 + 256) >> 9) + 128;
          v30.i32[3] = (301 * v35 + 153 * v34 + 58 * v37 + 256) >> 9;
          v36.i32[2] = ((-214 * v27 + (v26 << 8) - 42 * v31 + 256) >> 9) + 128;
          v36.i32[3] = ((-214 * v35 + (v34 << 8) - 42 * v37 + 256) >> 9) + 128;
          int32x4_t v38 = vminq_s32(v30, v19);
          int32x4_t v39 = vminq_s32(vmaxq_s32(v32, (int32x4_t)0), v19);
          v7[v20] = v38.i8[0];
          v7[v20 + 1] = v38.i8[4];
          v7[v20 + self->bytesPerRow] = v38.i8[8];
          __int32 v40 = v39.i32[2];
          __int32 v41 = v39.i32[0] + v39.i32[1];
          __int32 v42 = v39.i32[3];
          int32x4_t v43 = vminq_s32(vmaxq_s32(v36, (int32x4_t)0), v19);
          __int32 v44 = v40 + v42;
          v45 = &v10[v20];
          v7[v20 + 1 + self->bytesPerRow] = v38.i8[12];
          char *v45 = (v41 + v44 + 2) >> 2;
          v45[1] = (v43.i32[0] + v43.i32[1] + v43.i32[2] + v43.i32[3] + 2) >> 2;
          int width = self->width;
          v20 += 2;
          v21 += 8;
        }
        while ((int)v20 < width);
        int height = self->height;
        int bytesPerRow = self->bytesPerRow;
        int v11 = v47;
      }
      v11 += 2;
      v7 += 2 * bytesPerRow;
      v10 += bytesPerRow;
      v18 += v46;
    }
    while (v11 < height);
  }
}

- (CIBurstYUVImage)initWithCGImage:(CGImage *)a3 maxDimension:(int)a4
{
  self->dataPtr = 0;
  self->pixelBuffer = 0;
  self->ioSurf = 0;
  int Width = CGImageGetWidth(a3);
  int Height = CGImageGetHeight(a3);
  BurstLoggingMessage("initWithCGImage: %dx%d\n", Width, Height);
  if (Width > a4 || Height > a4)
  {
    float v15 = (float)a4;
    if (Width <= Height)
    {
      float v11 = v15 / (float)Height;
      int v12 = (int)(float)(v11 * (float)Width);
      uint64_t v9 = 28;
      uint64_t v10 = 24;
      int v13 = a4;
      int v14 = v12;
    }
    else
    {
      float v11 = v15 / (float)Width;
      int v12 = (int)(float)(v11 * (float)Height);
      uint64_t v9 = 24;
      uint64_t v10 = 28;
      int v13 = v12;
      int v14 = a4;
    }
  }
  else
  {
    uint64_t v9 = 28;
    uint64_t v10 = 24;
    float v11 = 1.0;
    int v12 = Width;
    a4 = Height;
    int v13 = Height;
    int v14 = Width;
  }
  *(_DWORD *)((char *)&self->super.isa + v10) = v12;
  *(_DWORD *)((char *)&self->super.isa + v9) = a4;
  unsigned int v16 = (v14 + 3) & 0xFFFFFFFC;
  self->int bytesPerRow = v16;
  v17 = malloc_type_malloc((int)(4 * v13 * v16), 0x83D4F016uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  int32x4_t v19 = CGBitmapContextCreate(v17, self->width, self->height, 8uLL, 4 * self->bytesPerRow, DeviceRGB, 5u);
  if (v19)
  {
    uint64_t v20 = v19;
    CGContextScaleCTM(v19, v11, v11);
    v22.size.int width = (double)Width;
    v22.size.int height = (double)Height;
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    CGContextDrawImage(v20, v22, a3);
    CGContextRelease(v20);
  }
  CGColorSpaceRelease(DeviceRGB);
  [(CIBurstYUVImage *)self convertRGBAToYUV420:v17 rgbaBytesPerRow:(4 * self->bytesPerRow)];
  free(v17);
  return self;
}

- (CIBurstYUVImage)initWithCIImage:(id)a3 ctx:(id)a4 maxDimension:(int)a5
{
  [a3 extent];
  double v10 = v9;
  double v12 = v11;
  double v13 = v7;
  double v14 = v8;
  int v15 = (int)v7;
  int v16 = (int)v8;
  uint64_t v17 = 24;
  int v18 = (int)(float)((float)((float)a5 / (float)(int)v8) * (float)(int)v7);
  uint64_t v19 = 28;
  uint64_t v20 = 24;
  if ((int)v7 > (int)v8) {
    uint64_t v20 = 28;
  }
  if (v15 > v16)
  {
    int v18 = (int)(float)((float)((float)a5 / (float)(int)v7) * (float)(int)v8);
    uint64_t v19 = 24;
  }
  BOOL v21 = v15 <= a5 && v16 <= a5;
  if (!v21)
  {
    uint64_t v17 = v20;
    int v15 = v18;
  }
  *(_DWORD *)((char *)&self->super.isa + v17) = v15;
  uint64_t v22 = 28;
  if (!v21)
  {
    uint64_t v22 = v19;
    int v16 = a5;
  }
  *(_DWORD *)((char *)&self->super.isa + v22) = v16;
  self->pixelBuffer = 0;
  self->ioSurf = 0;
  self->dataPtr = 0;
  int v23 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  int v24 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  int v26 = CFDictionaryCreateMutable(0, 0, v23, v24);
  int v27 = CFDictionaryCreateMutable(0, 0, v23, v24);
  int valuePtr = 875704422;
  int v28 = self->width >> 1;
  int v45 = self->height >> 1;
  int v46 = v28;
  int v44 = 2;
  CFNumberRef v29 = CFNumberCreate(0, kCFNumberIntType, &self->width);
  CFNumberRef v30 = CFNumberCreate(0, kCFNumberIntType, &self->height);
  CFNumberRef v31 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFNumberRef v32 = CFNumberCreate(0, kCFNumberIntType, &v46);
  CFNumberRef v33 = CFNumberCreate(0, kCFNumberIntType, &v45);
  CFNumberRef v34 = CFNumberCreate(0, kCFNumberIntType, &v44);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F2F2C0], v29);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F2F0E8], v30);
  CFNumberRef v43 = v31;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F2F150], v31);
  int v35 = (const void *)*MEMORY[0x1E4F2F258];
  CFNumberRef cf = v29;
  CFDictionaryAddValue(v26, (const void *)*MEMORY[0x1E4F2F258], v29);
  int32x4_t v36 = (const void *)*MEMORY[0x1E4F2F220];
  CFDictionaryAddValue(v26, (const void *)*MEMORY[0x1E4F2F220], v30);
  CFDictionaryAddValue(v27, v35, v32);
  CFDictionaryAddValue(v27, v36, v33);
  CFDictionaryAddValue(v27, (const void *)*MEMORY[0x1E4F2F170], v34);
  int v37 = CFArrayCreateMutable(0, 2, MEMORY[0x1E4F1D510]);
  CFArrayAppendValue(v37, v26);
  CFArrayAppendValue(v37, v27);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F2F238], v37);
  int32x4_t v38 = IOSurfaceCreate(Mutable);
  self->ioSurf = v38;
  if (v38)
  {
    objc_msgSend(a4, "render:toIOSurface:bounds:colorSpace:", a3, v38, 0, v10, v12, v13, v14);
    IOSurfaceLock(self->ioSurf, 0, 0);
    self->int width = IOSurfaceGetWidth(self->ioSurf);
    self->int height = IOSurfaceGetHeight(self->ioSurf);
    self->int bytesPerRow = IOSurfaceGetBytesPerRow(self->ioSurf);
    self->Ybuffer = (char *)IOSurfaceGetBaseAddressOfPlane(self->ioSurf, 0);
    self->Cbuffer = (char *)IOSurfaceGetBaseAddressOfPlane(self->ioSurf, 1uLL);
  }
  CFRelease(cf);
  CFRelease(v30);
  CFRelease(v43);
  CFRelease(v32);
  CFRelease(v33);
  CFRelease(v34);
  CFRelease(Mutable);
  CFRelease(v26);
  CFRelease(v27);
  CFRelease(v37);
  return self;
}

- (CIBurstYUVImage)initWithIOSurface:(__IOSurface *)a3 maxDimension:(int)a4
{
  int Width = IOSurfaceGetWidth(a3);
  int Height = IOSurfaceGetHeight(a3);
  int v9 = Height;
  if (Width > a4 || Height > a4)
  {
    float v13 = (float)a4;
    if (Width <= Height)
    {
      int v12 = (int)(float)((float)(v13 / (float)Height) * (float)Width);
      uint64_t v10 = 28;
      uint64_t v11 = 24;
    }
    else
    {
      int v12 = (int)(float)((float)(v13 / (float)Width) * (float)Height);
      uint64_t v10 = 24;
      uint64_t v11 = 28;
    }
  }
  else
  {
    uint64_t v10 = 28;
    uint64_t v11 = 24;
    int v12 = Width;
    a4 = Height;
  }
  *(_DWORD *)((char *)&self->super.isa + v11) = v12;
  *(_DWORD *)((char *)&self->super.isa + v10) = a4;
  self->CVPixelBufferRef pixelBuffer = 0;
  self->ioSurf = 0;
  self->dataPtr = 0;
  OSType PixelFormat = IOSurfaceGetPixelFormat(a3);
  if (self->width == Width && self->height == v9 && PixelFormat == 875704422)
  {
    self->ioSurf = a3;
    CFRetain(a3);
    IOSurfaceLock(self->ioSurf, 1u, 0);
    self->int width = IOSurfaceGetWidth(self->ioSurf);
    self->int height = IOSurfaceGetHeight(self->ioSurf);
    self->int bytesPerRow = IOSurfaceGetBytesPerRowOfPlane(self->ioSurf, 0);
    self->Ybuffer = (char *)IOSurfaceGetBaseAddressOfPlane(self->ioSurf, 0);
    self->Cbuffer = (char *)IOSurfaceGetBaseAddressOfPlane(self->ioSurf, 1uLL);
  }
  else
  {
    CVPixelBufferRef pixelBufferOut = 0;
    CVPixelBufferCreateWithIOSurface(0, a3, 0, &pixelBufferOut);
    CVPixelBufferRef pixelBuffer = 0;
    int v15 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
    int v16 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    int v18 = CFDictionaryCreateMutable(0, 0, v15, v16);
    int valuePtr = 768;
    CFNumberRef v19 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(v18, (const void *)*MEMORY[0x1E4F2EFE8], v19);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F24D20], v18);
    CVPixelBufferCreate(0, self->width, self->height, 0x34323066u, Mutable, &pixelBuffer);
    CFRelease(Mutable);
    CFRelease(v18);
    CFRelease(v19);
    VTPixelTransferSessionRef pixelTransferSessionOut = 0;
    VTPixelTransferSessionCreate(0, &pixelTransferSessionOut);
    uint64_t v20 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, pixelBuffer);
    if (v20) {
      NSLog(&cfstr_ErrorWithVtpix.isa, v20);
    }
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    self->int width = CVPixelBufferGetWidth(pixelBuffer);
    self->int height = CVPixelBufferGetHeight(pixelBuffer);
    self->int bytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
    self->Ybuffer = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
    self->Cbuffer = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
    self->CVPixelBufferRef pixelBuffer = pixelBuffer;
    VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
    CFRelease(pixelTransferSessionOut);
    CFRelease(pixelBufferOut);
  }
  return self;
}

- (void)dealloc
{
  dataPtr = self->dataPtr;
  if (dataPtr) {
    CFRelease(dataPtr);
  }
  CVPixelBufferRef pixelBuffer = self->pixelBuffer;
  if (pixelBuffer)
  {
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    CVPixelBufferRelease(self->pixelBuffer);
    self->Ybuffer = 0;
  }
  ioSurf = self->ioSurf;
  if (ioSurf)
  {
    IOSurfaceUnlock(ioSurf, 1u, 0);
    CFRelease(self->ioSurf);
    self->Ybuffer = 0;
  }
  else
  {
    Ybuffer = self->Ybuffer;
    if (Ybuffer) {
      free(Ybuffer);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)CIBurstYUVImage;
  [(CIBurstYUVImage *)&v7 dealloc];
}

- (__CVBuffer)pixelBuffer
{
  result = self->pixelBuffer;
  if (!result)
  {
    if (self->ioSurf)
    {
      CVPixelBufferRef pixelBufferOut = 0;
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F24ED8], (const void *)*MEMORY[0x1E4F1CFD0]);
      CVPixelBufferCreateWithIOSurface(0, self->ioSurf, Mutable, &pixelBufferOut);
      if (Mutable) {
        CFRelease(Mutable);
      }
      return pixelBufferOut;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int)width
{
  return self->width;
}

- (void)setWidth:(int)a3
{
  self->int width = a3;
}

- (int)height
{
  return self->height;
}

- (void)setHeight:(int)a3
{
  self->int height = a3;
}

- (char)Ybuffer
{
  return self->Ybuffer;
}

- (void)setYbuffer:(char *)a3
{
  self->Ybuffer = a3;
}

- (char)Cbuffer
{
  return self->Cbuffer;
}

- (void)setCbuffer:(char *)a3
{
  self->Cbuffer = a3;
}

- (int)bytesPerRow
{
  return self->bytesPerRow;
}

- (void)setBytesPerRow:(int)a3
{
  self->int bytesPerRow = a3;
}

@end