@interface ADMetalUtils
+ (id)bindIOSurfaceToMTL2DTexture:(__IOSurface *)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 plane:(unint64_t)a7 metalDevice:(id)a8 error:(id *)a9;
+ (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 metalDevice:(id)a4;
+ (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 textureSize:(CGSize)a5 plane:(unint64_t)a6 metalDevice:(id)a7 error:(id *)a8;
+ (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 plane:(unint64_t)a4 metalDevice:(id)a5 error:(id *)a6;
+ (id)textureForSize:(CGSize)a3 pixelFormat:(unsigned int)a4 metalDevice:(id)a5;
+ (unint64_t)bytesPerPixelForTextureFormat:(unint64_t)a3;
+ (unint64_t)getMTLPixelFormat:(unsigned int)a3;
+ (void)dispatchCommandEncoder:(id)a3 pipeline:(id)a4 width:(unsigned int)a5 height:(unsigned int)a6;
@end

@implementation ADMetalUtils

+ (void)dispatchCommandEncoder:(id)a3 pipeline:(id)a4 width:(unsigned int)a5 height:(unsigned int)a6
{
  id v9 = a3;
  id v10 = a4;
  int v11 = [v10 threadExecutionWidth];
  int v12 = [v10 maxTotalThreadsPerThreadgroup];
  v14[0] = (int)((a5 + v11 - 1) / v11);
  v14[1] = (int)((a6 + v12 / v11 - 1) / (v12 / v11));
  v14[2] = 1;
  v13[0] = v11;
  v13[1] = v12 / v11;
  v13[2] = 1;
  [v9 dispatchThreadgroups:v14 threadsPerThreadgroup:v13];
}

+ (unint64_t)bytesPerPixelForTextureFormat:(unint64_t)a3
{
  unint64_t result = 1;
  switch(a3)
  {
    case 1uLL:
    case 0xAuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      return result;
    case 0x14uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1EuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
      unint64_t result = 2;
      break;
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x40uLL:
    case 0x41uLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x49uLL:
    case 0x4AuLL:
    case 0x50uLL:
    case 0x51uLL:
    case 0x5AuLL:
    case 0x5BuLL:
    case 0x5CuLL:
    case 0x5DuLL:
      unint64_t result = 4;
      break;
    case 0x67uLL:
    case 0x68uLL:
    case 0x69uLL:
    case 0x6EuLL:
    case 0x70uLL:
    case 0x71uLL:
    case 0x72uLL:
    case 0x73uLL:
      unint64_t result = 8;
      break;
    case 0x7BuLL:
    case 0x7CuLL:
    case 0x7DuLL:
      unint64_t result = 16;
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

+ (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 textureSize:(CGSize)a5 plane:(unint64_t)a6 metalDevice:(id)a7 error:(id *)a8
{
  double height = a5.height;
  double width = a5.width;
  id v14 = a7;
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
  {
    v16 = +[ADMetalUtils bindIOSurfaceToMTL2DTexture:IOSurface pixelFormat:a4 width:(unint64_t)width height:(unint64_t)height plane:a6 metalDevice:v14 error:a8];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 plane:(unint64_t)a4 metalDevice:(id)a5 error:(id *)a6
{
  id v9 = a5;
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
  {
    unint64_t v11 = +[ADMetalUtils getMTLPixelFormat:CVPixelBufferGetPixelFormatType(a3)];
    size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(IOSurface, a4);
    v13 = +[ADMetalUtils bindIOSurfaceToMTL2DTexture:IOSurface pixelFormat:v11 width:WidthOfPlane height:IOSurfaceGetHeightOfPlane(IOSurface, a4) plane:a4 metalDevice:v9 error:a6];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 metalDevice:(id)a4
{
  v4 = +[ADMetalUtils bindPixelBufferToMTL2DTexture:a3 plane:0 metalDevice:a4 error:0];
  return v4;
}

+ (id)bindIOSurfaceToMTL2DTexture:(__IOSurface *)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 plane:(unint64_t)a7 metalDevice:(id)a8 error:(id *)a9
{
  id v14 = a8;
  v15 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:a4 width:a5 height:a6 mipmapped:0];
  v16 = v15;
  if (v15)
  {
    [v15 setUsage:23];
    v17 = (void *)[v14 newTextureWithDescriptor:v16 iosurface:a3 plane:a7];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)textureForSize:(CGSize)a3 pixelFormat:(unsigned int)a4 metalDevice:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  double height = a3.height;
  double width = a3.width;
  id v8 = a5;
  id v9 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", +[ADMetalUtils getMTLPixelFormat:](ADMetalUtils, "getMTLPixelFormat:", v5), (unint64_t)width, (unint64_t)height, 0);
  [v9 setUsage:19];
  id v10 = (void *)[v8 newTextureWithDescriptor:v9];

  return v10;
}

+ (unint64_t)getMTLPixelFormat:(unsigned int)a3
{
  if ((int)a3 <= 1380401728)
  {
    if ((int)a3 <= 1111970368)
    {
      if (a3 == 825306677 || a3 == 825437747) {
        return 23;
      }
      if (a3 == 843264104) {
        return 65;
      }
      goto LABEL_32;
    }
    if ((int)a3 <= 1278226535)
    {
      if (a3 == 1111970369) {
        return 80;
      }
      int v6 = 1278226534;
      goto LABEL_14;
    }
    if (a3 != 1278226536)
    {
      int v7 = 1278226742;
      goto LABEL_24;
    }
    return 25;
  }
  if ((int)a3 > 1717855599)
  {
    if ((int)a3 <= 1751410031)
    {
      if (a3 == 1717855600) {
        return 55;
      }
      int v6 = 1717856627;
LABEL_14:
      if (a3 != v6) {
        goto LABEL_32;
      }
      return 55;
    }
    if (a3 != 1751410032 && a3 != 1751411059) {
      goto LABEL_32;
    }
    return 25;
  }
  if ((int)a3 <= 1380411456)
  {
    if (a3 == 1380401729) {
      return 70;
    }
    if (a3 == 1380410945) {
      return 125;
    }
    goto LABEL_32;
  }
  if (a3 == 1380411457) {
    return 115;
  }
  int v7 = 1647392359;
LABEL_24:
  if (a3 == v7) {
    return 23;
  }
LABEL_32:
  uint64_t v9 = v3;
  uint64_t v10 = v4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v8 = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "unsupported pixelformat", v8, 2u);
  }
  return 0;
}

@end