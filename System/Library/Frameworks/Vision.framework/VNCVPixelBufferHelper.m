@interface VNCVPixelBufferHelper
+ (BOOL)lockPixelBuffer:(CVPixelBufferLockFlags)a3 lockFlags:(void *)a4 error:;
+ (BOOL)unlockPixelBuffer:(CVPixelBufferLockFlags)a3 lockFlags:(void *)a4 error:;
+ (CVPixelBufferRef)createPixelBufferUsingIOSurfaceWithWidth:(size_t)a3 height:(uint64_t)a4 pixelFormatType:(void *)a5 error:;
+ (uint64_t)_validatePixelBuffer:(void *)a3 error:;
+ (uint64_t)renderRawDataBufferWithWidth:(uint64_t)a1 height:(uint64_t)a2 pixelFormatType:(uint64_t)a3 rowBytes:(uint64_t)a4 dataBytes:(int *)a5 intoCVPixelBuffer:(__CVBuffer *)a6 error:(void *)a7;
@end

@implementation VNCVPixelBufferHelper

+ (CVPixelBufferRef)createPixelBufferUsingIOSurfaceWithWidth:(size_t)a3 height:(uint64_t)a4 pixelFormatType:(void *)a5 error:
{
  self;
  self;
  CVPixelBufferRef texture = 0;
  uint64_t v9 = VNCVPixelBufferCreateUsingIOSurface(a2, a3, a4, 0, &texture);
  if (v9)
  {
    if (a5)
    {
      id v10 = +[VNError errorForCVReturnCode:v9 width:a2 height:a3 pixelFormat:a4 localizedDescription:@"Failed to create CVPixelBuffer"];
      CVPixelBufferRef result = 0;
      *a5 = v10;
      return result;
    }
  }
  else
  {
    char v12 = +[VNCVPixelBufferHelper _validatePixelBuffer:error:]((uint64_t)VNCVPixelBufferHelper, texture, a5);
    CVPixelBufferRef result = texture;
    if (v12) {
      return result;
    }
    CVPixelBufferRelease(texture);
  }
  return 0;
}

+ (uint64_t)_validatePixelBuffer:(void *)a3 error:
{
  self;
  if (!a2)
  {
    VNValidatedLog(4, @"VNCVPixelBufferHelper: Pixel buffer is null", v5, v6, v7, v8, v9, v10, v27);
    if (!a3) {
      return 0;
    }
    v25 = @"Pixel buffer is null";
LABEL_11:
    id v26 = +[VNError errorForInternalErrorWithLocalizedDescription:v25];
    uint64_t result = 0;
    *a3 = v26;
    return result;
  }
  IOSurface = CVPixelBufferGetIOSurface(a2);
  if (!IOSurface)
  {
    VNValidatedLog(4, @"VNCVPixelBufferHelper: Pixel buffer is missing an IOSurface", v12, v13, v14, v15, v16, v17, v27);
    if (!a3) {
      return 0;
    }
    v25 = @"Pixel buffer is missing an IOSurface";
    goto LABEL_11;
  }
  if (IOSurfaceGetBaseAddress(IOSurface)) {
    return 1;
  }
  VNValidatedLog(4, @"VNCVPixelBufferHelper: IOSurface is not valid", v18, v19, v20, v21, v22, v23, v27);
  if (a3)
  {
    v25 = @"IOSurface is not valid";
    goto LABEL_11;
  }
  return 0;
}

+ (uint64_t)renderRawDataBufferWithWidth:(uint64_t)a1 height:(uint64_t)a2 pixelFormatType:(uint64_t)a3 rowBytes:(uint64_t)a4 dataBytes:(int *)a5 intoCVPixelBuffer:(__CVBuffer *)a6 error:(void *)a7
{
  self;
  size_t Width = CVPixelBufferGetWidth(a6);
  size_t Height = CVPixelBufferGetHeight(a6);
  if (Width != a2 || Height != a3)
  {
    if (a7)
    {
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"inference buffer image with dimensions %ld x %ld cannot be rendered into a pixel buffer with dimensions %ld x %ld", a2, a3, Width, Height);
      *a7 = +[VNError errorForInvalidOperationWithLocalizedDescription:v17];
    }
    return 0;
  }
  uint64_t v15 = CVPixelBufferLockBaseAddress(a6, 0);
  if (!v15)
  {
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a6);
    BaseAddress = CVPixelBufferGetBaseAddress(a6);
    if (a4 == 1278226534)
    {
      if (4 * a2 <= BytesPerRow)
      {
        for (uint64_t i = a3 * a2; i; --i)
        {
          int v31 = *a5++;
          *BaseAddress++ = v31;
        }
        goto LABEL_23;
      }
      if (a7)
      {
        v28 = objc_msgSend(NSString, "stringWithFormat:", @"inference buffer image with row bytes size of %ld cannot be rendered into a pixel buffer with %lu bytes per row", 4 * a2, BytesPerRow);
        v29 = +[VNError errorForInvalidOperationWithLocalizedDescription:v28];
LABEL_19:
        *a7 = v29;

        uint64_t v16 = 0;
LABEL_24:
        CVPixelBufferUnlockBaseAddress(a6, 0);
        return v16;
      }
    }
    else
    {
      if (a4 == 1278226536)
      {
        for (uint64_t j = a3 * a2; j; --j)
        {
          __int16 v21 = *(_WORD *)a5;
          a5 = (int *)((char *)a5 + 2);
          _H0 = v21;
          __asm { FCVT            S0, H0 }
          *BaseAddress++ = _S0;
        }
LABEL_23:
        uint64_t v16 = 1;
        goto LABEL_24;
      }
      if (a7)
      {
        v28 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported pixel format type (%u)", a4);
        v29 = +[VNError errorForUnimplementedFunctionWithLocalizedDescription:v28];
        goto LABEL_19;
      }
    }
    uint64_t v16 = 0;
    goto LABEL_24;
  }
  if (!a7) {
    return 0;
  }
  +[VNError errorForCVReturnCode:v15 localizedDescription:@"could not lock pixel buffer"];
  uint64_t v16 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
  return v16;
}

+ (BOOL)lockPixelBuffer:(CVPixelBufferLockFlags)a3 lockFlags:(void *)a4 error:
{
  self;
  uint64_t v13 = CVPixelBufferLockBaseAddress(a2, a3);
  if (v13)
  {
    VNValidatedLog(4, @"VNCVPixelBufferHelper: Failed to lock pixel buffer (%p): %d", v7, v8, v9, v10, v11, v12, (uint64_t)a2);
    if (a4)
    {
      *a4 = +[VNError errorForCVReturnCode:v13 localizedDescription:@"Failed to lock pixel buffer"];
    }
  }
  return v13 == 0;
}

+ (BOOL)unlockPixelBuffer:(CVPixelBufferLockFlags)a3 lockFlags:(void *)a4 error:
{
  self;
  uint64_t v13 = CVPixelBufferUnlockBaseAddress(a2, a3);
  if (v13)
  {
    VNValidatedLog(4, @"VNCVPixelBufferHelper: Failed to unlock buffer (%p): %d", v7, v8, v9, v10, v11, v12, (uint64_t)a2);
    if (a4)
    {
      *a4 = +[VNError errorForCVReturnCode:v13 localizedDescription:@"Failed to unlock pixel buffer"];
    }
  }
  return v13 == 0;
}

@end