@interface JFXDepthAsMatte
+ (BOOL)_defaultMatteGeneratorPrefersDepth;
+ (CGSize)mattingDepthInputSize;
- (id)initForFrameSet:(id)a3;
- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
@end

@implementation JFXDepthAsMatte

+ (BOOL)_defaultMatteGeneratorPrefersDepth
{
  return 1;
}

- (id)initForFrameSet:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)JFXDepthAsMatte;
  v5 = [(JFXMatting *)&v12 initForFrameSet:v4];
  if (v5)
  {
    id v6 = [v4 depthData];
    v7 = (__CVBuffer *)[v6 depthDataMap];

    double Width = (double)CVPixelBufferGetWidth(v7);
    size_t Height = CVPixelBufferGetHeight(v7);
    JFXCreatePixelBufferPool((unint64_t)(double)Height, (unint64_t)Width, 1278226534, v5 + 5);
    JFXCreatePixelBufferPool((unint64_t)*((double *)v5 + 1), (unint64_t)*((double *)v5 + 2), 1278226534, v5 + 6);
    JFXCreatePixelBufferPool((unint64_t)*((double *)v5 + 1), (unint64_t)*((double *)v5 + 2), 1278226488, v5 + 7);
    v11.receiver = v5;
    v11.super_class = (Class)JFXDepthAsMatte;
    [(JFXMatting *)&v11 setReady:1];
  }

  return v5;
}

- (void)dealloc
{
  CVPixelBufferPoolRelease(self->_rotatedFBufferPool);
  self->_rotatedFBufferPool = 0;
  CVPixelBufferPoolRelease(self->_scaledUpFBufferPool);
  self->_scaledUpFBufferPool = 0;
  CVPixelBufferPoolRelease(self->_alphaPool);
  self->_alphaPool = 0;
  v3.receiver = self;
  v3.super_class = (Class)JFXDepthAsMatte;
  [(JFXDepthAsMatte *)&v3 dealloc];
}

- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  objc_super v11 = [v9 signpostToken];
  [v11 tokenId];
  kdebug_trace();

  objc_super v12 = objc_alloc_init(JFXPerfTimer);
  CVPixelBufferRef v47 = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferRef v45 = 0;
  CVPixelBufferRef v46 = 0;
  CVPixelBufferRef v44 = 0;
  CVPixelBufferPoolCreatePixelBuffer(0, self->_rotatedFBufferPool, &pixelBufferOut);
  CVPixelBufferPoolCreatePixelBuffer(0, self->_scaledUpFBufferPool, &v47);
  if (self->super._cameraLocation == 2) {
    CVPixelBufferPoolCreatePixelBuffer(0, self->_scaledUpFBufferPool, &v46);
  }
  CVPixelBufferPoolCreatePixelBuffer(0, self->_alphaPool, &v44);
  CVPixelBufferPoolCreatePixelBuffer(0, self->_alphaPool, &v45);
  v13 = [v8 depthData];
  int v14 = [v13 depthDataType];
  v15 = [v8 depthData];
  v16 = v15;
  if (v14 == 1717856627)
  {
    v17 = (__CVBuffer *)[v15 depthDataMap];
  }
  else
  {
    id v18 = [v15 depthDataByConvertingToDepthDataType:1717855600];
    v17 = (__CVBuffer *)[v18 depthDataMap];
  }
  CVPixelBufferLockBaseAddress(v17, 1uLL);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  CVPixelBufferLockBaseAddress(v47, 0);
  if (v46) {
    CVPixelBufferLockBaseAddress(v46, 0);
  }
  CVPixelBufferLockBaseAddress(v45, 0);
  CVPixelBufferLockBaseAddress(v44, 0);
  memset(&src, 0, sizeof(src));
  JFXToVImage(v17, (uint64_t)&src);
  memset(&dest, 0, sizeof(dest));
  JFXToVImage(pixelBufferOut, (uint64_t)&dest);
  memset(&v41, 0, sizeof(v41));
  JFXToVImage(v47, (uint64_t)&v41);
  memset(&v40, 0, sizeof(v40));
  JFXToVImage(v44, (uint64_t)&v40);
  long long v38 = 0u;
  long long v39 = 0u;
  JFXToVImage(v45, (uint64_t)&v38);
  if (!vImageRotate90_PlanarF(&src, &dest, 3u, 0.0, 0))
  {
    vImagePixelCount height = dest.height;
    if (dest.height)
    {
      vImagePixelCount v20 = 0;
      vImagePixelCount width = dest.width;
      do
      {
        if (width >= 4)
        {
          vImagePixelCount v22 = 0;
          v23 = (char *)dest.data + dest.rowBytes * v20;
          do
          {
            *(float32x4_t *)&v23[16 * v22] = vmaxnmq_f32(*(float32x4_t *)&v23[16 * v22], (float32x4_t)0);
            ++v22;
            vImagePixelCount width = dest.width;
          }
          while (v22 < dest.width >> 2);
          vImagePixelCount height = dest.height;
        }
        ++v20;
      }
      while (height > v20);
    }
    if (!vImageScale_PlanarF(&dest, &v41, 0, 0))
    {
      if (v46)
      {
        memset(&v37, 0, sizeof(v37));
        JFXToVImage(v46, (uint64_t)&v37);
        if (vImageHorizontalReflect_PlanarF(&v41, &v37, 0)) {
          goto LABEL_17;
        }
        vImage_Buffer v41 = v37;
      }
      if (!vImageConvert_PlanarFtoPlanar8(&v41, &v40, 2.0, 0.2, 0))
      {
        vImagePixelCount v29 = v41.height;
        if (v41.height)
        {
          uint64_t v30 = 0;
          vImagePixelCount v31 = v41.width;
          vImagePixelCount v32 = v41.width >> 3;
          if (v41.width >> 3 <= 1) {
            vImagePixelCount v32 = 1;
          }
          do
          {
            if (v31 >= 8)
            {
              v33 = (int8x8_t *)(v38 + *((void *)&v39 + 1) * v30);
              v34 = (int8x8_t *)((char *)v40.data + v40.rowBytes * v30);
              vImagePixelCount v35 = v32;
              do
              {
                int8x8_t v36 = *v34++;
                *v33++ = vorr_s8(vand_s8(vceqz_s8(v36), (int8x8_t)0x80C080C080C080C0), v36);
                --v35;
              }
              while (v35);
            }
            ++v30;
          }
          while (v30 != v29);
        }
      }
    }
  }
LABEL_17:
  CVPixelBufferUnlockBaseAddress(v17, 1uLL);
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  CVPixelBufferUnlockBaseAddress(v47, 0);
  if (v46) {
    CVPixelBufferUnlockBaseAddress(v46, 0);
  }
  CVPixelBufferUnlockBaseAddress(v45, 0);
  CVPixelBufferUnlockBaseAddress(v44, 0);
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v47);
  if (v46) {
    CVPixelBufferRelease(v46);
  }
  CVPixelBufferRelease(v44);
  v24 = [MEMORY[0x263F61268] imageWithCVPixelBuffer:v45];
  CVPixelBufferRelease(v45);
  if (v9)
  {
    [(JFXPerfTimer *)v12 end];
    uint64_t v26 = v25;
    v27 = [v9 captureFrameStats];
    *(void *)([v27 times] + 16) = v26;
  }
  v28 = [v9 signpostToken];
  [v28 tokenId];
  kdebug_trace();

  v10[2](v10, v24);
}

+ (CGSize)mattingDepthInputSize
{
  double v2 = 640.0;
  double v3 = 360.0;
  result.vImagePixelCount height = v3;
  result.vImagePixelCount width = v2;
  return result;
}

@end