@interface JFXDisparityAsMatte
+ (BOOL)_defaultMatteGeneratorPrefersDepth;
+ (CGSize)mattingDepthInputSize;
- (id)initForFrameSet:(id)a3;
- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5;
@end

@implementation JFXDisparityAsMatte

+ (BOOL)_defaultMatteGeneratorPrefersDepth
{
  return 0;
}

- (id)initForFrameSet:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)JFXDisparityAsMatte;
  v5 = [(JFXMatting *)&v12 initForFrameSet:v4];
  if (v5)
  {
    id v6 = [v4 depthData];
    v7 = (__CVBuffer *)[v6 depthDataMap];

    double Width = (double)CVPixelBufferGetWidth(v7);
    uint64_t Height = (unint64_t)(double)CVPixelBufferGetHeight(v7);
    JFXCreatePixelBufferPool((unint64_t)Width, Height, 825306677, v5 + 5);
    JFXCreatePixelBufferPool(Height, (unint64_t)Width, 825306677, v5 + 6);
    JFXCreatePixelBufferPool((unint64_t)*((double *)v5 + 1), (unint64_t)*((double *)v5 + 2), 825306677, v5 + 7);
    JFXCreatePixelBufferPool((unint64_t)*((double *)v5 + 1), (unint64_t)*((double *)v5 + 2), 1751411059, v5 + 8);
    v11.receiver = v5;
    v11.super_class = (Class)JFXDisparityAsMatte;
    [(JFXMatting *)&v11 setReady:1];
  }

  return v5;
}

- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  CVPixelBufferRef v28 = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferRef v26 = 0;
  CVPixelBufferRef v27 = 0;
  CVPixelBufferRef v25 = 0;
  fixedPointBufferPool = self->_fixedPointBufferPool;
  v9 = (void (**)(id, void *))a5;
  CVPixelBufferPoolCreatePixelBuffer(0, fixedPointBufferPool, &pixelBufferOut);
  CVPixelBufferPoolCreatePixelBuffer(0, self->_rotatedFPBufferPool, &v28);
  CVPixelBufferPoolCreatePixelBuffer(0, self->_scaledUpFPBufferPool, &v27);
  if (self->super._cameraLocation == 2) {
    CVPixelBufferPoolCreatePixelBuffer(0, self->_scaledUpFPBufferPool, &v26);
  }
  CVPixelBufferPoolCreatePixelBuffer(0, self->_alphaMattePool, &v25);
  v10 = [v7 depthData];
  int v11 = [v10 depthDataType];
  objc_super v12 = [v7 depthData];
  v13 = v12;
  if (v11 == 1751411059)
  {
    v14 = (__CVBuffer *)[v12 depthDataMap];
  }
  else
  {
    id v15 = [v12 depthDataByConvertingToDepthDataType:1751411059];
    v14 = (__CVBuffer *)[v15 depthDataMap];
  }
  CVPixelBufferLockBaseAddress(v14, 1uLL);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  CVPixelBufferLockBaseAddress(v28, 0);
  CVPixelBufferLockBaseAddress(v27, 0);
  if (v26) {
    CVPixelBufferLockBaseAddress(v26, 0);
  }
  CVPixelBufferLockBaseAddress(v25, 0);
  v16 = [v7 depthData];

  if (v16)
  {
    memset(&src, 0, sizeof(src));
    JFXToVImage(v14, (uint64_t)&src);
    memset(&dest, 0, sizeof(dest));
    JFXToVImage(pixelBufferOut, (uint64_t)&dest);
    memset(&v22, 0, sizeof(v22));
    JFXToVImage(v28, (uint64_t)&v22);
    memset(&v21, 0, sizeof(v21));
    JFXToVImage(v27, (uint64_t)&v21);
    memset(&v20, 0, sizeof(v20));
    JFXToVImage(v25, (uint64_t)&v20);
    if (!vImageConvert_16Fto16U(&src, &dest, 0)
      && !vImageRotate90_Planar16U(&dest, &v22, 3u, 0, 0)
      && !vImageScale_Planar16U(&v22, &v21, 0, 0))
    {
      if (v26)
      {
        memset(&v19, 0, sizeof(v19));
        JFXToVImage(v26, (uint64_t)&v19);
        if (vImageHorizontalReflect_Planar16U(&v21, &v19, 0)) {
          goto LABEL_19;
        }
        vImage_Buffer v21 = v19;
      }
      vImageConvert_16Uto16F(&v21, &v20, 0);
    }
  }
  else
  {
    v17 = JFXLog_matting();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(src.data) = 0;
      _os_log_impl(&dword_234C41000, v17, OS_LOG_TYPE_DEFAULT, "alphaMatteForFrameSet no depthData, move along...", (uint8_t *)&src, 2u);
    }
  }
LABEL_19:
  CVPixelBufferUnlockBaseAddress(v14, 1uLL);
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  CVPixelBufferUnlockBaseAddress(v28, 0);
  CVPixelBufferUnlockBaseAddress(v27, 0);
  if (v26) {
    CVPixelBufferUnlockBaseAddress(v26, 0);
  }
  CVPixelBufferUnlockBaseAddress(v25, 0);
  CVPixelBufferRelease(pixelBufferOut);
  CVPixelBufferRelease(v28);
  CVPixelBufferRelease(v27);
  if (v26) {
    CVPixelBufferRelease(v26);
  }
  v18 = [MEMORY[0x263F61268] imageWithCVPixelBuffer:v25];
  CVPixelBufferRelease(v25);
  v9[2](v9, v18);
}

+ (CGSize)mattingDepthInputSize
{
  double v2 = 640.0;
  double v3 = 360.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end