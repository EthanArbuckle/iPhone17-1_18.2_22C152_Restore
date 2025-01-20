@interface AXShotflowHelpers
+ (id)resizeImage:(id)a3 byX:(float)a4 andY:(float)a5;
+ (id)resizeImage:(id)a3 to:(CGSize)a4;
+ (id)resizeImage:(id)a3 toWidth:(unint64_t)a4 andHeight:(unint64_t)a5;
+ (id)setCIContext;
+ (id)setCIContext:(id)a3;
+ (shared_ptr<CGImage>)getCGImageFromCIImage:(id)a3;
+ (vImage_Buffer)createVImageBuffer:(id)a3;
@end

@implementation AXShotflowHelpers

+ (vImage_Buffer)createVImageBuffer:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CVPixelBufferRef pixelBufferOut = (CVPixelBufferRef)[v3 pixelBuffer];
  if (!pixelBufferOut)
  {
    uint64_t v4 = *MEMORY[0x1E4F1CFD0];
    uint64_t v5 = *MEMORY[0x1E4F24CA0];
    v27[0] = *MEMORY[0x1E4F24CA8];
    v27[1] = v5;
    v28[0] = v4;
    v28[1] = v4;
    CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
    [v3 extent];
    double v8 = v7;
    [v3 extent];
    CVReturn v10 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (unint64_t)v8, (unint64_t)v9, 0x42475241u, v6, &pixelBufferOut);
    v11 = AXLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      CVReturn v22 = v10;
      _os_log_impl(&dword_1B57D5000, v11, OS_LOG_TYPE_INFO, "Pixel create: %d", buf, 8u);
    }

    v12 = [MEMORY[0x1E4F1E018] context];
    [v12 render:v3 toCVPixelBuffer:pixelBufferOut];
  }
  v13 = [(id)CVPixelBufferGetAttributes() objectForKey:*MEMORY[0x1E4F24D68]];
  MEMORY[0x1BA9A1820](1111970369, 0, 0, [v3 colorSpace], 0);
  v14 = [v13 objectForKey:@"BitsPerComponent"];
  int v15 = [v14 intValue];

  v16 = [v13 objectForKey:@"CGBitmapInfo"];
  LODWORD(v14) = [v16 intValue];

  v17 = [v13 objectForKey:@"BitsPerBlock"];
  CVReturn v18 = [v17 intValue];

  *(void *)&v26[4] = 0;
  *(_DWORD *)buf = v15;
  CVReturn v22 = v18;
  uint64_t v23 = [v3 colorSpace];
  int v24 = (int)v14;
  *(void *)v26 = 0;
  uint64_t v25 = 0;
  operator new();
}

+ (id)setCIContext
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1E018]);

  return v2;
}

+ (id)setCIContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    if (+[AXShotflowHelpers setCIContext:]::ctx) {
      goto LABEL_5;
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4F1E018]);
  }
  CFDictionaryRef v6 = (void *)+[AXShotflowHelpers setCIContext:]::ctx;
  +[AXShotflowHelpers setCIContext:]::ctx = (uint64_t)v5;

LABEL_5:
  id v7 = (id)+[AXShotflowHelpers setCIContext:]::ctx;

  return v7;
}

+ (shared_ptr<CGImage>)getCGImageFromCIImage:(id)a3
{
  id v5 = v3;
  id v7 = a3;
  CFDictionaryRef v6 = [a1 setCIContext];
  [v7 extent];
  std::shared_ptr<CGImage>::shared_ptr[abi:ne180100]<CGImage,void (*)(CGImage*),void>(v5, objc_msgSend(v6, "createCGImage:fromRect:", v7));
}

+ (id)resizeImage:(id)a3 byX:(float)a4 andY:(float)a5
{
  id v7 = a3;
  CGAffineTransformMakeScale(&v10, a4, a5);
  double v8 = [v7 imageByApplyingTransform:&v10];

  return v8;
}

+ (id)resizeImage:(id)a3 to:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  [v7 extent];
  float v9 = v8;
  *(float *)&double v8 = v10;
  *(float *)&double v10 = height;
  float v11 = width;
  *(float *)&double v12 = v11 / fmaxf(v9, 1.0);
  *(float *)&double v13 = *(float *)&v10 / fmaxf(*(float *)&v8, 1.0);
  v14 = [a1 resizeImage:v7 byX:v12 andY:v13];

  return v14;
}

+ (id)resizeImage:(id)a3 toWidth:(unint64_t)a4 andHeight:(unint64_t)a5
{
  id v5 = objc_msgSend(a1, "resizeImage:to:", a3, (double)a4, (double)a5);

  return v5;
}

+ (void)createVImageBuffer:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Could not creat pixel buffer: %d", (uint8_t *)v2, 8u);
}

@end