@interface JFXRGBDMatte
+ (BOOL)_defaultMatteGeneratorPrefersDepth;
+ (CGSize)mattingDepthInputSize;
- (BOOL)isValidForCameraFrameSet:(id)a3;
- (__CVBuffer)createInvertedMatte:(vImage_Buffer *)a3;
- (__CVBuffer)createTemporalFilteredMatte:(__CVBuffer *)a3;
- (__CVBuffer)localMattingHalfRGBD:(DepthProcessingDataRGBD *)a3 colorBuffer:(__CVBuffer *)a4;
- (__CVBuffer)processAlphaMapUsingDepthAndColor:(__CVBuffer *)a3 colorBuffer:(__CVBuffer *)a4;
- (char)localDepthBuffer;
- (char)localDepthBufferBig;
- (char)localDepthBufferSmall;
- (char)localDepthBufferTemp;
- (char)makeTrimap:(DepthProcessingDataRGBD *)a3;
- (id)initForFrameSet:(id)a3;
- (vImage_Buffer)featherMatte:(SEL)a3;
- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)depthToAlphaMap:(DepthProcessingDataRGBD *)a3;
- (void)erodeAndDilateMatte:(DepthProcessingDataRGBD *)a3;
- (void)expansionOfKnownRegionsRGBD:(__CVBuffer *)a3 processingData:(DepthProcessingDataRGBD *)a4 regionWin:(CGRect)a5 centerOfRow:(int)a6;
- (void)findDepthForFace:(DepthProcessingDataRGBD *)a3;
- (void)findLocalMattingRect:(int *)a3 processingData:(DepthProcessingDataRGBD *)a4 mattingRect:(CGRect *)a5;
- (void)findRectOrientationRightLeft:(int *)a3 numContourPixels:(int)a4 winHeight:(int)a5 halfHeight:(int)a6 originY:(int *)a7 sizeHeight:(int *)a8 isRight:(BOOL)a9;
- (void)getDepthData:(__CVBuffer *)a3 processData:(DepthProcessingDataRGBD *)a4;
- (void)grabCutWithTrimap:(char *)a3 color:(__CVBuffer *)a4 processWin:(CGRect)a5;
- (void)innerOuterFusion:(DepthProcessingDataRGBD *)a3 processWin:(CGRect)a4;
- (void)mattingGrabCut:(char *)a3 depthMap:(char *)a4 colorBuffer:(__CVBuffer *)a5 processWin:(CGRect)a6;
- (void)moveLocalDepthBufferToDepthOuter:(DepthProcessingDataRGBD *)a3;
- (void)postProcessing:(const char *)a3 depthDataSmall:(const char *)a4 depthData:(const char *)a5 RGBDMatte:(char *)a6 halfHeight:(int)a7 halfWidth:(int)a8;
- (void)requestMattingStatus;
@end

@implementation JFXRGBDMatte

+ (BOOL)_defaultMatteGeneratorPrefersDepth
{
  return 1;
}

- (id)initForFrameSet:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)JFXRGBDMatte;
  v5 = [(JFXMatting *)&v22 initForFrameSet:v4];
  if (v5)
  {
    v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v5[789] = [v6 BOOLForKey:@"JFXVisualizeFaceRect"];

    id v7 = [v4 depthData];
    v8 = (__CVBuffer *)[v7 depthDataMap];

    size_t Width = CVPixelBufferGetWidth(v8);
    size_t Height = CVPixelBufferGetHeight(v8);
    *((double *)v5 + 8) = (double)Width;
    *((double *)v5 + 9) = (double)Height;
    *((double *)v5 + 10) = (double)Height;
    *((double *)v5 + 11) = (double)Width;
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.JFXRGBDMatting.submissionQ", 0);
    v12 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.JFXRGBDMatting.processQ", MEMORY[0x263EF83A8]);
    v14 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v13;

    dispatch_semaphore_t v15 = dispatch_semaphore_create(1);
    v16 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v15;

    id v17 = objc_alloc_init(MEMORY[0x263F61238]);
    v18 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v17;

    id v19 = objc_alloc_init(MEMORY[0x263F61238]);
    v20 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v19;

    *((_DWORD *)v5 + 14) = 0;
    *((void *)v5 + 81) = 0;
    *((void *)v5 + 82) = 0;
    *((void *)v5 + 83) = 0;
    operator new[]();
  }

  return 0;
}

- (void)dealloc
{
  matteRotator = self->_matteRotator;
  self->_matteRotator = 0;

  colorRotator = self->_colorRotator;
  self->_colorRotator = 0;

  imageScaler = self->_imageScaler;
  self->_imageScaler = 0;

  CVPixelBufferPoolRelease(self->_scaledSourcePool);
  CVPixelBufferPoolRelease(self->_scaledDestinationPool);
  CVPixelBufferPoolRelease(self->_processedMattePool);
  CVPixelBufferPoolRelease(self->_rotatedMattePool);
  for (uint64_t i = 0; i != 4; ++i)
  {
    id v7 = self->_depthBufferHalf[i];
    if (v7) {
      MEMORY[0x237DD0F10](v7, 0x1000C8077774924);
    }
  }
  depthBufferFull = self->_depthBufferFull;
  if (depthBufferFull)
  {
    MEMORY[0x237DD0F10](depthBufferFull, 0x1000C8077774924);
    self->_depthBufferFull = 0;
  }
  vImageTempBuffer = self->_vImageTempBuffer;
  if (vImageTempBuffer)
  {
    MEMORY[0x237DD0F10](vImageTempBuffer, 0x1000C8077774924);
    self->_vImageTempBuffer = 0;
  }
  CVPixelBufferRelease(self->_alphaMatteHistory);
  depthProcessingData = self->_depthProcessingData;
  if (depthProcessingData)
  {
    DepthProcessingDataRGBD::~DepthProcessingDataRGBD(depthProcessingData);
    MEMORY[0x237DD0F30]();
  }
  contourMemoryPool = self->_contourMemoryPool;
  if (contourMemoryPool)
  {
    ContourMemoryPool::~ContourMemoryPool(contourMemoryPool);
    MEMORY[0x237DD0F30]();
  }
  v12.receiver = self;
  v12.super_class = (Class)JFXRGBDMatte;
  [(JFXRGBDMatte *)&v12 dealloc];
}

- (void)requestMattingStatus
{
  submissionQ = self->_submissionQ;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__JFXRGBDMatte_requestMattingStatus__block_invoke;
  block[3] = &unk_264C0CC20;
  block[4] = self;
  dispatch_async(submissionQ, block);
}

void __36__JFXRGBDMatte_requestMattingStatus__block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 120), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 112);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__JFXRGBDMatte_requestMattingStatus__block_invoke_2;
  block[3] = &unk_264C0CC20;
  block[4] = v2;
  dispatch_async(v3, block);
}

intptr_t __36__JFXRGBDMatte_requestMattingStatus__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 656) = 0x40000000;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 120));
}

- (void)alphaMatteForFrameSet:(id)a3 mattingPerfState:(id)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = JFXLog_DebugMatting();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = [v8 metadataDict];
    *(_DWORD *)buf = 138412290;
    objc_super v22 = v12;
    _os_log_impl(&dword_234C41000, v11, OS_LOG_TYPE_DEFAULT, "metadata=%@", buf, 0xCu);
  }
  submissionQ = self->_submissionQ;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__JFXRGBDMatte_alphaMatteForFrameSet_mattingPerfState_completionHandler___block_invoke;
  v17[3] = &unk_264C0CC70;
  v17[4] = self;
  id v18 = v9;
  id v19 = v8;
  id v20 = v10;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  dispatch_async(submissionQ, v17);
}

void __73__JFXRGBDMatte_alphaMatteForFrameSet_mattingPerfState_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 120), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 112);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __73__JFXRGBDMatte_alphaMatteForFrameSet_mattingPerfState_completionHandler___block_invoke_2;
  v4[3] = &unk_264C0CC48;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = v3;
  dispatch_async(v2, v4);
}

void __73__JFXRGBDMatte_alphaMatteForFrameSet_mattingPerfState_completionHandler___block_invoke_2(uint64_t a1)
{
  *(void *)&v52[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) signpostToken];
  [v2 tokenId];
  kdebug_trace();

  id v3 = objc_alloc_init(JFXPerfTimer);
  id v4 = [*(id *)(a1 + 40) depthData];
  int v5 = [v4 depthDataType];
  id v6 = *(void **)(a1 + 40);
  if (v5 == 1717855600)
  {
    id v7 = [v6 depthData];
    uint64_t v8 = [v7 depthDataMap];
  }
  else
  {
    id v7 = [v6 depthData];
    id v9 = [v7 depthDataByConvertingToDepthDataType:1717855600];
    uint64_t v8 = [v9 depthDataMap];
  }
  if (v8)
  {
    double LargestFaceRect = getLargestFaceRect(*(void **)(a1 + 40));
    uint64_t v11 = *(void *)(a1 + 48) + 152;
    *(double *)uint64_t v11 = LargestFaceRect;
    *(void *)(v11 + 8) = v12;
    *(void *)(v11 + 16) = v13;
    *(void *)(v11 + 24) = v14;
    id v15 = [*(id *)(a1 + 40) metadataObjectForKey:*MEMORY[0x263F61650]];
    *(void *)(*(void *)(a1 + 48) + 184) = [v15 interfaceOrientation];

    id v16 = JFXLog_DebugMatting();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 184);
      *(_DWORD *)buf = 134217984;
      *(void *)v52 = v17;
      _os_log_impl(&dword_234C41000, v16, OS_LOG_TYPE_DEFAULT, "interface orientation=%ld", buf, 0xCu);
    }

    id v18 = [*(id *)(a1 + 40) colorImageBuffer];
    uint64_t v19 = [v18 cvPixelBuffer];

    CVPixelBufferRef pixelBufferOut = 0;
    CVPixelBufferPoolCreatePixelBuffer(0, *(CVPixelBufferPoolRef *)(*(void *)(a1 + 48) + 680), &pixelBufferOut);
    [*(id *)(*(void *)(a1 + 48) + 720) scaleImage:v19 destinationImage:pixelBufferOut];
    id v20 = (__CVBuffer *)[*(id *)(*(void *)(a1 + 48) + 736) createRotatedPixelBuffer:pixelBufferOut];
    CVPixelBufferRelease(pixelBufferOut);
    v21 = (__CVBuffer *)[*(id *)(a1 + 48) processAlphaMapUsingDepthAndColor:v8 colorBuffer:v20];
    objc_super v22 = [*(id *)(a1 + 40) colorImageBuffer];
    uint64_t v23 = exifMetadataForCVPixelBuffer((const void *)[v22 cvPixelBuffer]);

    *(void *)(*(void *)(a1 + 48) + 664) = *(void *)(*(void *)(a1 + 48) + 664) & 0xFFFFFFFFFFFFFFFDLL | (2 * (exifBrightnessFromEXIFMetadata(v23) >= 6.5));
    uint64_t v25 = *(void *)(a1 + 48);
    uint64_t v26 = *(void *)(v25 + 664);
    if (v26 != *(void *)(v25 + 656))
    {
      +[JFXMatting postNotification:](JFXMatting, "postNotification:");
      uint64_t v25 = *(void *)(a1 + 48);
      uint64_t v26 = *(void *)(v25 + 664);
    }
    *(void *)(v25 + 656) = v26;
    uint64_t v27 = *(void *)(a1 + 48);
    float64x2_t v49 = *(float64x2_t *)(v27 + 752);
    v27 += 152;
    *(void *)&long long v24 = *(void *)(v27 + 8);
    long long v47 = v24;
    float64_t v48 = *(double *)v27;
    BOOL v28 = isFaceBoundingBoxValid(*(double *)v27, *(double *)&v24, *(double *)(v27 + 16), *(double *)(v27 + 24));
    v29.f64[0] = v48;
    *(void *)&v29.f64[1] = v47;
    float64x2_t v30 = vsubq_f64(v49, v29);
    double v31 = vaddvq_f64(vmulq_f64(v30, v30));
    BOOL v32 = v31 > 0.000004 && v28;
    v33 = JFXLog_DebugMatting();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v52[0] = v32;
      LOWORD(v52[1]) = 2048;
      *(double *)((char *)&v52[1] + 2) = v31;
      _os_log_impl(&dword_234C41000, v33, OS_LOG_TYPE_DEFAULT, "facemotion=%d movement_squared=%.7f", buf, 0x12u);
    }

    *(unsigned char *)(*(void *)(a1 + 48) + 788) = v32;
    v34 = *(_OWORD **)(a1 + 48);
    v35 = (_OWORD *)((char *)v34 + 152);
    v34 += 47;
    long long v36 = v35[1];
    _OWORD *v34 = *v35;
    v34[1] = v36;
    CVPixelBufferRelease(v20);

    int v37 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 792) + 112);
    v38 = JFXLog_DebugMatting();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v52[0] = v37;
      _os_log_impl(&dword_234C41000, v38, OS_LOG_TYPE_DEFAULT, "inside JFXRGBMatte averageDepth=%dmm", buf, 8u);
    }

    v39 = *(void **)(a1 + 40);
    v40 = [NSNumber numberWithDouble:JFXRemappedAverageDepth(v37)];
    [v39 setMetadataObject:v40 forKey:*MEMORY[0x263F61640]];

    v41 = [MEMORY[0x263F61268] imageWithCVPixelBuffer:v21];
    CVPixelBufferRelease(v21);
    if (*(void *)(a1 + 32))
    {
      [(JFXPerfTimer *)v3 end];
      uint64_t v43 = v42;
      v44 = [*(id *)(a1 + 32) captureFrameStats];
      *(void *)([v44 times] + 16) = v43;

      v45 = *(void **)(a1 + 32);
    }
    else
    {
      v45 = 0;
    }
    v46 = objc_msgSend(v45, "signpostToken", v47);
    [v46 tokenId];
    kdebug_trace();

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 48) + 120));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 48) + 120));
  }
}

- (__CVBuffer)processAlphaMapUsingDepthAndColor:(__CVBuffer *)a3 colorBuffer:(__CVBuffer *)a4
{
  [(JFXRGBDMatte *)self getDepthData:a3 processData:self->_depthProcessingData];
  [(JFXRGBDMatte *)self depthToAlphaMap:self->_depthProcessingData];
  depthProcessingData = self->_depthProcessingData;
  return [(JFXRGBDMatte *)self localMattingHalfRGBD:depthProcessingData colorBuffer:a4];
}

- (void)findDepthForFace:(DepthProcessingDataRGBD *)a3
{
}

- (void)findRectOrientationRightLeft:(int *)a3 numContourPixels:(int)a4 winHeight:(int)a5 halfHeight:(int)a6 originY:(int *)a7 sizeHeight:(int *)a8 isRight:(BOOL)a9
{
  if (a6 >= 0) {
    int v13 = a6;
  }
  else {
    int v13 = a6 + 1;
  }
  int v14 = v13 >> 1;
  if (a9)
  {
    if (a4 < 1) {
      goto LABEL_28;
    }
    uint64_t v15 = a4;
    id v16 = a3 + 1;
    int v17 = a6;
    do
    {
      if (*(v16 - 1) < v17)
      {
        int v14 = *v16;
        int v17 = *(v16 - 1);
      }
      v16 += 2;
      --v15;
    }
    while (v15);
  }
  else
  {
    if (a4 < 1) {
      goto LABEL_28;
    }
    int v17 = 0;
    uint64_t v18 = a4;
    uint64_t v19 = a3 + 1;
    do
    {
      if (*(v19 - 1) > v17)
      {
        int v14 = *v19;
        int v17 = *(v19 - 1);
      }
      v19 += 2;
      --v18;
    }
    while (v18);
  }
  if (a9)
  {
    int v20 = 0;
    int v21 = 0;
    int v22 = v17 + 20;
    uint64_t v23 = a3 + 1;
    uint64_t v24 = a4;
    do
    {
      if (*(v23 - 1) < v22)
      {
        v20 += *v23;
        ++v21;
      }
      v23 += 2;
      --v24;
    }
    while (v24);
  }
  else
  {
    int v20 = 0;
    int v21 = 0;
    int v25 = v17 - 20;
    uint64_t v26 = a3 + 1;
    uint64_t v27 = a4;
    do
    {
      if (*(v26 - 1) > v25)
      {
        v20 += *v26;
        ++v21;
      }
      v26 += 2;
      --v27;
    }
    while (v27);
  }
  if (v21 >= 1) {
    int v14 = v20 / v21;
  }
LABEL_28:
  if (a5 >= 0) {
    int v28 = a5;
  }
  else {
    int v28 = a5 + 1;
  }
  int v29 = (v14 - (v28 >> 1)) & ~((v14 - (v28 >> 1)) >> 31);
  *a7 = v29;
  int v30 = v29 + a5;
  if (a6 - 1 < v29 + a5) {
    int v30 = a6 - 1;
  }
  *a8 = v30 - v29;
  p_largestFaceRect = &self->_largestFaceRect;
  if (isFaceBoundingBoxValid(self->_largestFaceRect.origin.x, self->_largestFaceRect.origin.y, self->_largestFaceRect.size.width, self->_largestFaceRect.size.height))
  {
    int v32 = (int)(p_largestFaceRect->origin.x * (double)a6);
    int v33 = *a7;
    if (*a7 > v32)
    {
      *a7 = v32;
      int v33 = v32;
    }
    int v34 = (int)(p_largestFaceRect->size.width * (double)a6) + v32;
    if (v34 > v33 + a5) {
      *a8 = v34 - v33;
    }
  }
}

- (void)findLocalMattingRect:(int *)a3 processingData:(DepthProcessingDataRGBD *)a4 mattingRect:(CGRect *)a5
{
  uint64_t v8 = (int)(self->_depthSizeRotated.height * 0.5);
  uint64_t var13 = a4->var13;
  int var15 = a4->var15;
  if (var15 < 201) {
    int v11 = 250;
  }
  else {
    int v11 = (int)(((double)(var15 - 598) * -0.424 + 119.0) * 1.4);
  }
  double width = self->_depthSizeRotated.width;
  if (v11 <= 90) {
    int v11 = 90;
  }
  uint64_t v13 = v11 >> 1;
  uint64_t v45 = 0;
  int64_t interfaceOrientation = self->_interfaceOrientation;
  switch(interfaceOrientation)
  {
    case 4:
      LOBYTE(v44) = 1;
LABEL_17:
      [(JFXRGBDMatte *)self findRectOrientationRightLeft:a3 numContourPixels:var13 winHeight:v13 halfHeight:v8 originY:(char *)&v45 + 4 sizeHeight:&v45 isRight:v44];
      break;
    case 3:
      LOBYTE(v44) = 0;
      goto LABEL_17;
    case 2:
      if ((int)var13 < 1)
      {
        int v19 = 10;
      }
      else
      {
        int v15 = 0;
        id v16 = a3 + 1;
        do
        {
          int v18 = *v16;
          v16 += 2;
          int v17 = v18;
          if (v15 <= v18) {
            int v15 = v17;
          }
          --var13;
        }
        while (var13);
        int v19 = v15 + 10;
      }
      if (v19 >= (int)v8) {
        int v24 = v8 - 1;
      }
      else {
        int v24 = v19;
      }
      if (v24 - (int)v13 <= 10) {
        int v25 = v24 - 1;
      }
      else {
        int v25 = v13 + 10;
      }
      int v26 = v24 - v25;
      HIDWORD(v45) = v24 - v25;
      p_largestFaceRect = &self->_largestFaceRect;
      if (isFaceBoundingBoxValid(self->_largestFaceRect.origin.x, self->_largestFaceRect.origin.y, self->_largestFaceRect.size.width, self->_largestFaceRect.size.height))
      {
        int v28 = (int)(p_largestFaceRect->origin.x * (double)(int)v8);
        int v29 = v25 + v24 - v28;
        if (v25 + v24 + ~v28 >= 0) {
          int v29 = v25 + v24 + ~v28;
        }
        int v30 = v29 >> 1;
        int v31 = v26 + v28;
        if (v26 + v28 < 0 != __OFADD__(v26, v28)) {
          ++v31;
        }
        int v32 = v31 >> 1;
        if (v26 > v28)
        {
          int v25 = v24 + ~v28;
        }
        else
        {
          int v28 = v32;
          int v25 = v30;
        }
        HIDWORD(v45) = v28;
      }
      LODWORD(v45) = v25;
      break;
    default:
      if ((int)var13 < 1)
      {
        int v21 = v8;
      }
      else
      {
        int v20 = a3 + 1;
        int v21 = v8;
        do
        {
          int v23 = *v20;
          v20 += 2;
          int v22 = v23;
          if (v23 < v21) {
            int v21 = v22;
          }
          --var13;
        }
        while (var13);
      }
      if (v21 <= 10) {
        int v33 = 10;
      }
      else {
        int v33 = v21;
      }
      int v34 = v33 - 10;
      if (v33 + (int)v13 >= (int)v8) {
        int v35 = v8 - v33 + 9;
      }
      else {
        int v35 = v13 + 10;
      }
      HIDWORD(v45) = v33 - 10;
      if (isFaceBoundingBoxValid(self->_largestFaceRect.origin.x, self->_largestFaceRect.origin.y, self->_largestFaceRect.size.width, self->_largestFaceRect.size.height))
      {
        int v36 = (int)(self->_largestFaceRect.size.width * (double)(int)v8
                  + (double)(int)v8 * self->_largestFaceRect.origin.x);
        if (v35 + v34 <= v36)
        {
          int v37 = v35 - v33 + v36;
          int v38 = v37 + 9;
          int v39 = v37 + 10;
          if (v38 >= 0) {
            int v39 = v38;
          }
          int v35 = v39 >> 1;
        }
        else
        {
          int v35 = v36 - v33 + 9;
        }
      }
      if (v34 + v35 >= 310) {
        int v40 = v35;
      }
      else {
        int v40 = 320 - v33;
      }
      if (self->_usingLargerRect) {
        int v41 = v40;
      }
      else {
        int v41 = v35;
      }
      LODWORD(v45) = v41;
      break;
  }
  a5->origin.x = 0.0;
  int v42 = HIDWORD(v45);
  a5->origin.y = (double)SHIDWORD(v45);
  a5->size.double width = (double)(int)(width * 0.5);
  int v43 = v45;
  a5->size.height = (double)(int)v45;
  self->_heightOfMattingWin = v43;
  self->_topOfHeadHalf = v42;
}

- (char)makeTrimap:(DepthProcessingDataRGBD *)a3
{
  unint64_t v4 = (unint64_t)self->_depthSizeRotated.width >> 1;
  unint64_t v5 = (unint64_t)self->_depthSizeRotated.height >> 1;
  id v6 = [(JFXRGBDMatte *)self localDepthBufferBig];
  id v7 = [(JFXRGBDMatte *)self localDepthBufferSmall];
  unint64_t v8 = v5 * v4;
  if (v5 * v4)
  {
    id v9 = v6;
    do
    {
      char v10 = *v9;
      if (*v9)
      {
        if (*v7) {
          char v10 = -1;
        }
        else {
          char v10 = 0x80;
        }
      }
      *v9++ = v10;
      ++v7;
      --v8;
    }
    while (v8);
  }
  return v6;
}

- (void)moveLocalDepthBufferToDepthOuter:(DepthProcessingDataRGBD *)a3
{
  size_t v4 = ((unint64_t)self->_depthSizeRotated.height >> 1) * ((unint64_t)self->_depthSizeRotated.width >> 1);
  unint64_t v5 = [(JFXRGBDMatte *)self localDepthBuffer];
  var11 = a3->var11;
  memcpy(v5, var11, v4);
}

- (char)localDepthBuffer
{
  return self->_depthBufferHalf[0];
}

- (char)localDepthBufferBig
{
  return self->_depthBufferHalf[1];
}

- (char)localDepthBufferSmall
{
  return self->_depthBufferHalf[2];
}

- (char)localDepthBufferTemp
{
  return self->_depthBufferHalf[3];
}

- (void)erodeAndDilateMatte:(DepthProcessingDataRGBD *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  *(void *)&long long v5 = -1;
  *((void *)&v5 + 1) = -1;
  long long v20 = v5;
  long long v21 = v5;
  long long v18 = v5;
  long long v19 = v5;
  *(_OWORD *)kernel = v5;
  *(CGFloat *)&long long v5 = self->_depthSizeRotated.width;
  double height = self->_depthSizeRotated.height;
  char v22 = -1;
  vImagePixelCount v7 = (unint64_t)*(double *)&v5 >> 1;
  vImagePixelCount v8 = (unint64_t)height >> 1;
  id v9 = [(JFXRGBDMatte *)self localDepthBufferSmall];
  char v10 = self->_depthBufferHalf[3];
  var11 = a3->var11;
  src.data = a3->var10;
  src.double height = v8;
  src.double width = v7;
  src.rowBytes = v7;
  dest.data = var11;
  dest.double height = v8;
  dest.double width = v7;
  dest.rowBytes = v7;
  v14.data = [(JFXRGBDMatte *)self localDepthBufferBig];
  v14.double height = v8;
  v14.double width = v7;
  v14.rowBytes = v7;
  v13.data = v9;
  v13.double height = v8;
  v13.double width = v7;
  v13.rowBytes = v7;
  v12.data = v10;
  v12.double height = v8;
  v12.double width = v7;
  v12.rowBytes = v7;
  vImageErode_Planar8(&src, &dest, 0, 0, kernel, 3uLL, 3uLL, 8u);
  vImageErode_Planar8(&src, &v13, 0, 0, kernel, 7uLL, 7uLL, 8u);
  vImageDilate_Planar8(&src, &v12, 0, 0, kernel, 7uLL, 7uLL, 8u);
  vImageDilate_Planar8(&v12, &v14, 0, 0, kernel, 3uLL, 3uLL, 8u);
}

- (vImage_Buffer)featherMatte:(SEL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(void *)&long long v5 = -1;
  *((void *)&v5 + 1) = -1;
  long long v13 = v5;
  long long v14 = v5;
  long long v11 = v5;
  long long v12 = v5;
  *(_OWORD *)kernel = v5;
  double width = self->_depthSizeRotated.width;
  *(CGFloat *)&long long v5 = self->_depthSizeRotated.height;
  char v15 = -1;
  var10 = a4->var10;
  dest.data = a4->var11;
  dest.double height = (unint64_t)*(double *)&v5;
  dest.double width = (unint64_t)width;
  dest.rowBytes = (unint64_t)width;
  retstr->data = var10;
  retstr->double height = (unint64_t)*(double *)&v5;
  retstr->double width = (unint64_t)width;
  retstr->rowBytes = (unint64_t)width;
  vImageBoxConvolve_Planar8(retstr, &dest, self->_vImageTempBuffer, 0, 0, 5u, 5u, 0, 8u);
  return (vImage_Buffer *)vImageErode_Planar8(&dest, retstr, 0, 0, kernel, 3uLL, 3uLL, 8u);
}

- (void)grabCutWithTrimap:(char *)a3 color:(__CVBuffer *)a4 processWin:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  long long v12 = [(JFXRGBDMatte *)self localDepthBuffer];
  -[JFXRGBDMatte mattingGrabCut:depthMap:colorBuffer:processWin:](self, "mattingGrabCut:depthMap:colorBuffer:processWin:", a3, v12, a4, x, y, width, height);
}

- (__CVBuffer)createInvertedMatte:(vImage_Buffer *)a3
{
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferPoolCreatePixelBuffer(0, self->_processedMattePool, &pixelBufferOut);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  long long v13 = 0u;
  long long v14 = 0u;
  JFXToVImage(pixelBufferOut, (uint64_t)&v13);
  unint64_t v4 = *((void *)&v13 + 1);
  if (*((void *)&v13 + 1))
  {
    unint64_t v5 = 0;
    unint64_t v6 = *((void *)&v14 + 1);
    uint64_t v7 = *((void *)&v14 + 1) >> 4;
    if (*((void *)&v14 + 1) >> 4 <= 1uLL) {
      uint64_t v7 = 1;
    }
    do
    {
      if (v6 >= 0x10)
      {
        vImagePixelCount v8 = (int8x16_t *)(v13 + *((void *)&v14 + 1) * v5);
        id v9 = (int8x16_t *)((char *)a3->data + a3->rowBytes * v5);
        uint64_t v10 = v7;
        do
        {
          int8x16_t v11 = *v9++;
          *v8++ = vmvnq_s8(v11);
          --v10;
        }
        while (v10);
        unint64_t v4 = *((void *)&v13 + 1);
      }
      ++v5;
    }
    while (v5 < v4);
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  return pixelBufferOut;
}

- (__CVBuffer)localMattingHalfRGBD:(DepthProcessingDataRGBD *)a3 colorBuffer:(__CVBuffer *)a4
{
  p_depthSizeRotated = &self->_depthSizeRotated;
  double height = self->_depthSizeRotated.height;
  CGFloat v9 = self->_depthSizeRotated.width * 0.5;
  uint64_t v10 = (int)v9;
  uint64_t v11 = (int)(height * 0.5);
  int v47 = (int)(height * 0.5);
  ContourProcessing::ContourProcessing((ContourProcessing *)v46, (unsigned __int8 *)a3->var10, v47, (int)v9, self->_contourMemoryPool, 0);
  ContourProcessing::contourExtractionProcessing((ContourProcessing *)v46, &a3->var13, &v47);
  self->_heightOfMattingWin = -1;
  self->_topOfHeadHalf = -1;
  int v12 = v47;
  int v13 = v11 - 1;
  if ((int)v11 - 1 >= v47 + 20) {
    int v13 = v47 + 20;
  }
  int var13 = a3->var13;
  if (var13 >= 1)
  {
    int v15 = 0;
    uint64_t v16 = self->_contourMemoryPool->var2 + 1;
    uint64_t v17 = a3->var13;
    do
    {
      int v18 = *v16;
      v16 += 2;
      if (v18 < v13) {
        ++v15;
      }
      --v17;
    }
    while (v17);
    if ((int)v10 >= 0) {
      int v19 = v10;
    }
    else {
      int v19 = v10 + 1;
    }
    uint64_t v20 = (v19 >> 1);
    if (v15) {
      uint64_t v20 = ((int)v20 / v15);
    }
    if (var13 >= 21)
    {
      int var15 = a3->var15;
      if (var15 < 201) {
        int v22 = 250;
      }
      else {
        int v22 = (int)(((double)(var15 - 598) * -0.424 + 119.0) * 2.8);
      }
      if (v22 <= 90) {
        int v22 = 90;
      }
      if (v47 <= 10) {
        int v12 = 10;
      }
      int v23 = v12 - 10;
      int v47 = v12 - 10;
      unsigned int v24 = v22 >> 1;
      int v25 = v12 + (v22 >> 1);
      unsigned int v26 = v24 + 10;
      signed int v27 = v11 - v12 + 9;
      if (v25 < (int)v11) {
        signed int v27 = v26;
      }
      int v28 = v27 / 2;
      self->_heightOfMattingWin = v28;
      self->_topOfHeadHalf = v23;
      double v29 = (double)v23;
      double v30 = (double)(int)v10;
      double v31 = (double)v28;
      *(void *)&long long v44 = 0;
      *((double *)&v44 + 1) = (double)v23;
      *(double *)&long long v45 = (double)(int)v10;
      *((double *)&v45 + 1) = (double)v28;
      if (self->_usingFaceRect)
      {
        [(JFXRGBDMatte *)self findLocalMattingRect:self->_contourMemoryPool->var2 processingData:a3 mattingRect:&v44];
        double v29 = *((double *)&v44 + 1);
        double v32 = *(double *)&v44;
        double v31 = *((double *)&v45 + 1);
        double v30 = *(double *)&v45;
      }
      else
      {
        double v32 = 0.0;
      }
      -[JFXRGBDMatte expansionOfKnownRegionsRGBD:processingData:regionWin:centerOfRow:](self, "expansionOfKnownRegionsRGBD:processingData:regionWin:centerOfRow:", a4, a3, v20, v32, v29, v30, v31);
      -[JFXRGBDMatte innerOuterFusion:processWin:](self, "innerOuterFusion:processWin:", a3, v44, v45);
      [(JFXRGBDMatte *)self erodeAndDilateMatte:a3];
      int v33 = [(JFXRGBDMatte *)self makeTrimap:a3];
      [(JFXRGBDMatte *)self moveLocalDepthBufferToDepthOuter:a3];
      -[JFXRGBDMatte grabCutWithTrimap:color:processWin:](self, "grabCutWithTrimap:color:processWin:", v33, a4, v44, v45);
      int v34 = [(JFXRGBDMatte *)self localDepthBuffer];
      [(JFXRGBDMatte *)self postProcessing:[(JFXRGBDMatte *)self localDepthBufferTemp] depthDataSmall:[(JFXRGBDMatte *)self localDepthBufferSmall] depthData:a3->var11 RGBDMatte:v34 halfHeight:v11 halfWidth:v10];
      src.data = v34;
      src.double height = (int)v11;
      src.double width = (int)v10;
      src.rowBytes = (int)v10;
      dest.data = a3->var10;
      int8x16_t v35 = (int8x16_t)vcvtq_u64_f64(*(float64x2_t *)p_depthSizeRotated);
      *(int8x16_t *)&dest.double height = vextq_s8(v35, v35, 8uLL);
      dest.rowBytes = v35.i64[0];
      vImageScale_Planar8(&src, &dest, self->_vImageTempBuffer, 0x20u);
    }
  }
  long long v44 = 0u;
  long long v45 = 0u;
  [(JFXRGBDMatte *)self featherMatte:a3];
  v41[0] = v44;
  v41[1] = v45;
  int v36 = [(JFXRGBDMatte *)self createInvertedMatte:v41];
  int v37 = v36;
  if (self->_visualizeFaceRect) {
    drawFaceRectOnAlphaMap(v36, self->_largestFaceRect.origin.x, self->_largestFaceRect.origin.y, self->_largestFaceRect.size.width, self->_largestFaceRect.size.height);
  }
  int v38 = [(JFXPixelRotationSession *)self->_matteRotator createRotatedPixelBuffer:v37];
  int v39 = [(JFXRGBDMatte *)self createTemporalFilteredMatte:v38];
  CVPixelBufferRelease(v38);
  CVPixelBufferRelease(v37);
  ContourProcessing::~ContourProcessing((ContourProcessing *)v46);
  return v39;
}

- (__CVBuffer)createTemporalFilteredMatte:(__CVBuffer *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_alloc_init(JFXPerfTimer);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferPoolCreatePixelBuffer(0, self->_scaledDestinationPool, &pixelBufferOut);
  CVPixelBufferRef pixelBuffer = 0;
  CVPixelBufferPoolCreatePixelBuffer(0, self->_rotatedMattePool, &pixelBuffer);
  if (self->_motionDetected || (alphaMatteHistordouble y = self->_alphaMatteHistory) == 0)
  {
    CVPixelBufferRef pixelBuffer = CVPixelBufferRetain(a3);
  }
  else
  {
    CVPixelBufferLockBaseAddress(alphaMatteHistory, 1uLL);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    int v28 = v5;
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(self->_alphaMatteHistory);
    size_t v10 = CVPixelBufferGetBytesPerRow(a3);
    size_t v11 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    BaseAddress = (uint8x8_t *)CVPixelBufferGetBaseAddress(pixelBuffer);
    int v13 = (uint8x8_t *)CVPixelBufferGetBaseAddress(self->_alphaMatteHistory);
    long long v14 = (uint8x8_t *)CVPixelBufferGetBaseAddress(a3);
    if (Height)
    {
      uint64_t v15 = 0;
      uint64_t v16 = Width >> 3;
      if (Width >> 3 <= 1) {
        uint64_t v16 = 1;
      }
      do
      {
        uint64_t v17 = v13;
        int v18 = v14;
        int v19 = BaseAddress;
        uint64_t v20 = v16;
        if (Width >= 8)
        {
          do
          {
            uint8x8_t v21 = *v17++;
            uint8x8_t v22 = v21;
            uint8x8_t v23 = *v18++;
            *v19++ = vqmovn_u16(vmovl_u8(vhadd_u8(v23, v22)));
            --v20;
          }
          while (v20);
        }
        ++v15;
        BaseAddress = (uint8x8_t *)((char *)BaseAddress + v11);
        long long v14 = (uint8x8_t *)((char *)v14 + v10);
        int v13 = (uint8x8_t *)((char *)v13 + BytesPerRow);
      }
      while (v15 != Height);
    }
    unint64_t v5 = v28;
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    CVPixelBufferUnlockBaseAddress(self->_alphaMatteHistory, 1uLL);
  }
  CVPixelBufferRelease(self->_alphaMatteHistory);
  self->_alphaMatteHistordouble y = CVPixelBufferRetain(a3);
  [(JFXImageScaler *)self->_imageScaler scaleImage:pixelBuffer destinationImage:pixelBufferOut];
  CVPixelBufferRelease(pixelBuffer);
  unsigned int v24 = JFXLog_DebugMatting();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    [(JFXPerfTimer *)v5 end];
    *(_DWORD *)buf = 134217984;
    uint64_t v32 = v25;
    _os_log_impl(&dword_234C41000, v24, OS_LOG_TYPE_DEFAULT, "temporal filter %.1fms", buf, 0xCu);
  }

  unsigned int v26 = pixelBufferOut;
  return v26;
}

- (void)innerOuterFusion:(DepthProcessingDataRGBD *)a3 processWin:(CGRect)a4
{
  double height = a4.size.height;
  double y = a4.origin.y;
  uint64_t v31 = *MEMORY[0x263EF8340];
  vImagePixelCount v8 = objc_alloc_init(JFXPerfTimer);
  *(void *)&long long v9 = -1;
  *((void *)&v9 + 1) = -1;
  kernel[3] = v9;
  kernel[4] = v9;
  kernel[1] = v9;
  kernel[2] = v9;
  kernel[0] = v9;
  double width = self->_depthSizeRotated.width;
  double v10 = self->_depthSizeRotated.height;
  char v30 = -1;
  depthBufferFull = self->_depthBufferFull;
  int v13 = (int)(width * 0.5);
  src.data = a3->var11;
  src.double height = (unint64_t)v10;
  src.double width = (unint64_t)width;
  src.rowBytes = (unint64_t)width;
  vImagePixelCount v14 = (int)(v10 * 0.5);
  dest.data = depthBufferFull;
  dest.double height = v14;
  vImagePixelCount v15 = v13;
  dest.double width = v13;
  dest.rowBytes = v13;
  vImageScale_Planar8(&src, &dest, self->_vImageTempBuffer, 0x20u);
  uint64_t v16 = self->_depthBufferHalf[0];
  v26.data = a3->var10;
  v26.double height = v14;
  v26.double width = v15;
  v26.rowBytes = v15;
  v25.data = v16;
  v25.double height = v14;
  v25.double width = v15;
  v25.rowBytes = v15;
  vImageDilate_Planar8(&v26, &v25, 0, 0, (const unsigned __int8 *)kernel, 7uLL, 7uLL, 8u);
  bzero(a3->var11, (int)v15 * (int)v14);
  int v17 = (int)y;
  double v18 = y + height;
  if (v18 > (double)(int)y)
  {
    uint64_t v19 = v17;
    uint64_t v20 = (int)v15 * (uint64_t)v17;
    do
    {
      uint64_t v21 = v15;
      uint64_t v22 = v20;
      if ((int)v15 >= 1)
      {
        do
        {
          if (depthBufferFull[v22] <= 0x63u) {
            char v23 = 0;
          }
          else {
            char v23 = -1;
          }
          a3->var11[v22++] = v23;
          --v21;
        }
        while (v21);
      }
      ++v19;
      v20 += v15;
    }
    while (v18 > (double)(int)v19);
  }
  v24.data = a3->var11;
  v24.double height = v14;
  v24.double width = v15;
  v24.rowBytes = v15;
  vImageErode_Planar8(&v24, &dest, 0, 0, (const unsigned __int8 *)kernel, 5uLL, 5uLL, 8u);
  vImageErode_Planar8(&dest, &v24, 0, 0, (const unsigned __int8 *)kernel, 5uLL, 5uLL, 8u);
  vImageDilate_Planar8(&v24, &dest, 0, 0, (const unsigned __int8 *)kernel, 5uLL, 5uLL, 8u);
  vImageDilate_Planar8(&dest, &v24, 0, 0, (const unsigned __int8 *)kernel, 5uLL, 5uLL, 8u);
  operator new[]();
}

- (void)expansionOfKnownRegionsRGBD:(__CVBuffer *)a3 processingData:(DepthProcessingDataRGBD *)a4 regionWin:(CGRect)a5 centerOfRow:(int)a6
{
  double y = a5.origin.y;
  uint64_t v66 = *MEMORY[0x263EF8340];
  v55 = objc_alloc_init(JFXPerfTimer);
  char v65 = -1;
  *(void *)&long long v11 = -1;
  *((void *)&v11 + 1) = -1;
  long long v63 = v11;
  long long v64 = v11;
  long long v61 = v11;
  long long v62 = v11;
  *(_OWORD *)kernel = v11;
  depthBufferFull = self->_depthBufferFull;
  double width = self->_depthSizeRotated.width;
  double height = self->_depthSizeRotated.height;
  BOOL v15 = isFaceBoundingBoxValid(self->_largestFaceRect.origin.x, self->_largestFaceRect.origin.y, self->_largestFaceRect.size.width, self->_largestFaceRect.size.height);
  int v16 = (int)(height * 0.5);
  int v17 = (int)(width * 0.5);
  if (v15)
  {
    int v18 = (int)(self->_largestFaceRect.origin.x * (double)v16);
    int v19 = (int)(self->_largestFaceRect.size.width * (double)v16);
  }
  else
  {
    int v18 = (int)y + 20;
    int v20 = v16 - v18;
    if (v16 - v18 <= 20) {
      int v20 = 20;
    }
    int v19 = v20 - 20;
  }
  int v21 = v19 + v18;
  if (v16 - 1 >= v18) {
    int v22 = v18;
  }
  else {
    int v22 = v16 - 1;
  }
  src.data = a4->var10;
  src.double height = v16;
  if (v21 >= v16) {
    int v23 = (int)(height * 0.5);
  }
  else {
    int v23 = v21;
  }
  uint64_t v24 = v17;
  src.double width = v17;
  src.rowBytes = v17;
  dest.data = depthBufferFull;
  dest.double height = v16;
  dest.double width = v17;
  dest.rowBytes = v17;
  vImageDilate_Planar8(&src, &dest, 0, 0, kernel, 5uLL, 5uLL, 8u);
  unsigned int v25 = CVPixelBufferGetWidth(a3);
  unsigned int v26 = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  uint64_t v31 = v22 & ~(v22 >> 31);
  uint64_t v32 = v23 & ~(v23 >> 31);
  if (v31 < v32)
  {
    v54 = a3;
    uint64_t v33 = v31 - 2;
    int8x16_t v34 = (int8x16_t)vdupq_n_s32(0x4B400000u);
    float32x4_t v35 = (float32x4_t)vdupq_n_s32(0xCB400000);
    uint64_t v36 = v22 & ~(v22 >> 31);
    do
    {
      if (v25 > a6)
      {
        uint64_t v37 = a6;
        int v38 = a6 - 2;
        do
        {
          if (a4->var10[v37 + v36 * v24] >= 0x81u)
          {
            v29.i32[0] = *(_DWORD *)&BaseAddress[4 * (int)v37 + v36 * BytesPerRow];
            float32x4_t v29 = vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v29.f32)), v34), v35);
            uint64_t v39 = v33;
            do
            {
              uint64_t v40 = v39 * v24;
              uint64_t v41 = v38;
              do
              {
                if ((v41 & 0x8000000000000000) == 0
                  && (v39 & 0x8000000000000000) == 0
                  && v41 < v25
                  && v39 < v26)
                {
                  uint64_t v42 = v41 + v40;
                  var10 = a4->var10;
                  if (!var10[v41 + v40])
                  {
                    if (depthBufferFull[v42])
                    {
                      if (((v36 - v39) * (v36 - v39) + (v37 - v41) * (v37 - v41)) <= 4)
                      {
                        v30.i32[0] = *(_DWORD *)&BaseAddress[4 * (int)v41 + v39 * BytesPerRow];
                        float32x4_t v45 = vsubq_f32(vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v30)), v34), v35), v29);
                        float32x4_t v46 = vsubq_f32(v45, v45);
                        float32x4_t v47 = vmulq_f32(v46, v46);
                        uint8x8_t v30 = (uint8x8_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v47, 2), vaddq_f32(v47, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v47.f32, 1))).u64[0];
                        if (*(float *)v30.i32 <= 100.0) {
                          var10[v42] = 0x80;
                        }
                      }
                    }
                  }
                }
                BOOL v44 = v41++ < v37 + 2;
              }
              while (v44);
              BOOL v44 = v39++ < v36 + 2;
            }
            while (v44);
          }
          ++v37;
          ++v38;
        }
        while (v37 < v25);
      }
      ++v36;
      ++v33;
    }
    while (v36 != v32);
    uint64_t v48 = a6 + v24 * v31;
    a3 = v54;
    do
    {
      unsigned int v49 = a6;
      for (uint64_t i = v48; v49 < v25; ++v49)
      {
        v51 = a4->var10;
        if (v51[i] == 128) {
          v51[i] = -1;
        }
        ++i;
      }
      ++v31;
      v48 += v24;
    }
    while (v31 != v32);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  v52 = JFXLog_DebugMatting();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    [(JFXPerfTimer *)v55 end];
    *(_DWORD *)buf = 134217984;
    uint64_t v59 = v53;
    _os_log_impl(&dword_234C41000, v52, OS_LOG_TYPE_DEFAULT, "expansion %.1fms", buf, 0xCu);
  }
}

- (void)mattingGrabCut:(char *)a3 depthMap:(char *)a4 colorBuffer:(__CVBuffer *)a5 processWin:(CGRect)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  CGRect v19 = a6;
  if (a6.size.width > 0.0 && a6.size.height > 20.0)
  {
    long long v11 = objc_alloc_init(JFXPerfTimer);
    self->_grabCutCounter = (self->_grabCutCounter + 1) % 0xA;
    int v12 = dispatch_get_global_queue(0, 0);
    group = dispatch_group_create();
    CVPixelBufferLockBaseAddress(a5, 1uLL);
    BaseAddress = CVPixelBufferGetBaseAddress(a5);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a5);
    if (self->_disableMattingMultithreading)
    {
      *(void *)&long long context = self->_grabCutModules[0];
      *((void *)&context + 1) = a3;
      int v21 = a4;
      int v22 = BaseAddress;
      int v23 = &v19;
      int v24 = BytesPerRow;
      uint64_t v25 = 0x100000000;
      dispatch_group_async_f(group, v12, &context, (dispatch_function_t)DispatchContextRGBDSensoGrabCut);
      dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      if (!self->_grabCutCounter) {
        [(PVComputeGrabCut *)self->_grabCutModules[0] reset];
      }
    }
    else
    {
      *(void *)&long long context = self->_grabCutModules[0];
      *((void *)&context + 1) = a3;
      int v21 = a4;
      int v22 = BaseAddress;
      int v23 = &v19;
      int v24 = BytesPerRow;
      uint64_t v25 = 0x200000000;
      v26[0] = self->_grabCutModules[1];
      v26[1] = a3;
      v26[2] = a4;
      v26[3] = BaseAddress;
      v26[4] = &v19;
      int v27 = BytesPerRow;
      uint64_t v28 = 0x200000001;
      dispatch_group_async_f(group, v12, &context, (dispatch_function_t)DispatchContextRGBDSensoGrabCut);
      dispatch_group_async_f(group, v12, v26, (dispatch_function_t)DispatchContextRGBDSensoGrabCut);
      dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      if (!self->_grabCutCounter)
      {
        [(PVComputeGrabCut *)self->_grabCutModules[0] reset];
        [(PVComputeGrabCut *)self->_grabCutModules[1] reset];
      }
      for (uint64_t i = 56; i != -56; i -= 56)
    }
    CVPixelBufferUnlockBaseAddress(a5, 1uLL);
    int v16 = JFXLog_DebugMatting();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      [(JFXPerfTimer *)v11 end];
      LODWORD(context) = 134217984;
      *(void *)((char *)&context + 4) = v17;
      _os_log_impl(&dword_234C41000, v16, OS_LOG_TYPE_DEFAULT, "grabcut %.1fms", (uint8_t *)&context, 0xCu);
    }
  }
}

- (void)getDepthData:(__CVBuffer *)a3 processData:(DepthProcessingDataRGBD *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v7 = objc_alloc_init(JFXPerfTimer);
    JFXConvertFloatDepthImageToFixedPointAndTranspose(a3, (int32x4_t *)a4->var2);
    DepthProcessingDataRGBD::depthHistogram(a4, self->_depthHist);
    DepthProcessingDataRGBD::fillHolesInSource(a4, self->_largestFaceRect, (UIInterfaceOrientation)self->_interfaceOrientation);
    vImagePixelCount v8 = JFXLog_DebugMatting();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [(JFXPerfTimer *)v7 end];
      int v18 = 134217984;
      uint64_t v19 = v9;
      _os_log_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEFAULT, "RGBD preproc_histogram %.1fms", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    double v10 = JFXLog_matting();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEFAULT, "Error: depthPixelBuffer=NULL.", (uint8_t *)&v18, 2u);
    }
  }
  self->_faceRectDepth = -1;
  if (isFaceBoundingBoxValid(self->_largestFaceRect.origin.x, self->_largestFaceRect.origin.y, self->_largestFaceRect.size.width, self->_largestFaceRect.size.height))
  {
    [(JFXRGBDMatte *)self findDepthForFace:a4];
  }
  uint64_t minObjectDistance = self->_minObjectDistance;
  if ((int)minObjectDistance < 3) {
    goto LABEL_16;
  }
  int v12 = 0;
  int v13 = &self->_depthHist[2];
  uint64_t v14 = minObjectDistance - 2;
  do
  {
    int v15 = *v13++;
    v12 += v15;
    --v14;
  }
  while (v14);
  if (v12 <= 2000)
  {
LABEL_16:
    self->_numFramesWithVeryClosePixels = 0;
    goto LABEL_17;
  }
  unint64_t v16 = self->_numFramesWithVeryClosePixels + 1;
  self->_numFramesWithVeryClosePixels = v16;
  if (v16 <= 3)
  {
LABEL_17:
    unint64_t v17 = 0;
    goto LABEL_18;
  }
  unint64_t v17 = 1;
LABEL_18:
  self->_currentMattingStatus = v17;
}

- (void)depthToAlphaMap:(DepthProcessingDataRGBD *)a3
{
  int v5 = 0;
  uint64_t v53 = *MEMORY[0x263EF8340];
  p_depthSizeRotated = &self->_depthSizeRotated;
  double v7 = self->_depthSizeRotated.height * self->_depthSizeRotated.width;
  depthHist = self->_depthHist;
  int v9 = 1;
  do
  {
    uint64_t v10 = v9;
    if (v9 <= 99) {
      int v11 = 99;
    }
    else {
      int v11 = v9;
    }
    int v12 = v11 + 1;
    while (depthHist[v10] <= 20)
    {
      ++v10;
      ++v9;
      if (v12 == v10) {
        goto LABEL_15;
      }
    }
    v50[3 * v5 + 8] = v10;
    uint64_t v13 = 3 * v5;
    v50[v13 + 9] = 0;
    if ((int)v10 <= 99)
    {
      int v14 = 0;
      while (1)
      {
        int v15 = depthHist[v10];
        if (v15 < 21) {
          break;
        }
        v14 += v15;
        v50[v13 + 9] = v14;
        BOOL v24 = v10++ < 99;
        if (!v24)
        {
          LODWORD(v10) = 100;
          break;
        }
      }
    }
    int v12 = v10 - 1;
    v52[v13] = v10 - 1;
    ++v5;
LABEL_15:
    int v9 = v12 + 1;
  }
  while (v12 < 99);
  if (!v5)
  {
    LODWORD(v17) = 5;
    goto LABEL_47;
  }
  int v16 = v5 - 1;
  if (v5 == 1)
  {
    uint64_t v17 = v52[0];
    if (v52[0] <= 99)
    {
      while (depthHist[v17] >= 1)
      {
        if (++v17 == 100) {
          goto LABEL_43;
        }
      }
      goto LABEL_47;
    }
LABEL_43:
    LODWORD(v17) = 99;
    goto LABEL_47;
  }
  if (v5 < 1)
  {
    LODWORD(v19) = 0;
  }
  else
  {
    uint64_t v18 = 0;
    LODWORD(v19) = 0;
    int v20 = 0;
    int v21 = (int *)v51;
    do
    {
      int v23 = *v21;
      v21 += 3;
      int v22 = v23;
      if (v23 <= v20)
      {
        uint64_t v19 = v19;
      }
      else
      {
        int v20 = v22;
        uint64_t v19 = v18;
      }
      ++v18;
    }
    while (v5 != v18);
    BOOL v24 = !self->_usingforegroundSegBooster || (int)v19 <= 0;
    if (!v24)
    {
      uint64_t v25 = 0;
      unsigned int v26 = (int *)v51;
      while (1)
      {
        int v27 = *v26;
        v26 += 3;
        if (v27 > (int)v7 / 3) {
          break;
        }
        if (v19 == ++v25) {
          goto LABEL_39;
        }
      }
      LODWORD(v19) = v25;
    }
  }
LABEL_39:
  uint64_t v17 = (int)v52[3 * (int)v19];
  if (v19 != v16)
  {
    int v28 = v50[3 * (int)v19 + 11];
    BOOL v29 = __OFADD__(v28, v17);
    int v30 = v28 + v17;
    if (v30 < 0 != v29) {
      ++v30;
    }
    LODWORD(v17) = v30 >> 1;
    goto LABEL_47;
  }
  if ((int)v17 > 99) {
    goto LABEL_43;
  }
  while (depthHist[v17] >= 1)
  {
    if (++v17 == 100) {
      goto LABEL_43;
    }
  }
LABEL_47:
  int v31 = 10 * v17;
  int faceRectDepth = self->_faceRectDepth;
  if (faceRectDepth >= 1)
  {
    if (v31 >= faceRectDepth || faceRectDepth > 0x3E7)
    {
      if (v31 > faceRectDepth && faceRectDepth <= 0x12B)
      {
        uint64_t v36 = &self->_depthHist[45];
        uint64_t v37 = -550;
        while (1)
        {
          int v38 = *v36++;
          if (v38 < 21) {
            break;
          }
          v37 += 10;
          if (!v37)
          {
            int v31 = 1000;
            goto LABEL_66;
          }
        }
        int v31 = v37 + 1000;
      }
    }
    else
    {
      uint64_t v33 = (unsigned __int16)self->_faceRectDepth / 0xAu;
      if (v33 <= 0x63) {
        unsigned int v34 = 99;
      }
      else {
        unsigned int v34 = (unsigned __int16)self->_faceRectDepth / 0xAu;
      }
      uint64_t v35 = v34 + 1;
      while (depthHist[v33] >= 21)
      {
        if (v35 == ++v33) {
          goto LABEL_64;
        }
      }
      LODWORD(v35) = v33;
LABEL_64:
      int v31 = 10 * v35;
    }
  }
LABEL_66:
  depthBufferFull = self->_depthBufferFull;
  DepthProcessingDataRGBD::setAverageDepthAndSegment(a3, v31);
  double width = p_depthSizeRotated->width;
  double height = p_depthSizeRotated->height;
  int v42 = (int)(height * 0.5);
  memset(v47, 255, 25);
  int v43 = (int)(width * 0.5);
  *(void *)v50 = a3->var10;
  *(void *)&v50[2] = (unint64_t)height;
  *(void *)&v50[4] = (unint64_t)width;
  *(void *)&v50[6] = (unint64_t)width;
  v49.data = depthBufferFull;
  v49.double height = v42;
  v49.double width = v43;
  v49.rowBytes = v43;
  vImageScale_Planar8((const vImage_Buffer *)v50, &v49, self->_vImageTempBuffer, 0x20u);
  uint64_t v44 = (v43 * v42);
  if ((int)v44 >= 1)
  {
    for (uint64_t i = 0; i != v44; ++i)
    {
      if (depthBufferFull[i] <= 0x63u) {
        char v46 = 0;
      }
      else {
        char v46 = -1;
      }
      a3->var10[i] = v46;
    }
  }
  v48.data = a3->var10;
  v48.double height = v42;
  v48.double width = v43;
  v48.rowBytes = v43;
  vImageDilate_Planar8(&v48, &v49, 0, 0, v47, 3uLL, 3uLL, 8u);
  vImageDilate_Planar8(&v49, &v48, 0, 0, v47, 3uLL, 3uLL, 8u);
  vImageErode_Planar8(&v48, &v49, 0, 0, v47, 3uLL, 3uLL, 8u);
  vImageErode_Planar8(&v49, &v48, 0, 0, v47, 3uLL, 3uLL, 8u);
}

- (void)postProcessing:(const char *)a3 depthDataSmall:(const char *)a4 depthData:(const char *)a5 RGBDMatte:(char *)a6 halfHeight:(int)a7 halfWidth:(int)a8
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v33 = objc_alloc_init(JFXPerfTimer);
  int v14 = self->_heightOfMattingWin + self->_topOfHeadHalf;
  if (v14 <= 20) {
    int v15 = 20;
  }
  else {
    int v15 = self->_heightOfMattingWin + self->_topOfHeadHalf;
  }
  if (a7 - 1 >= v14) {
    int v16 = self->_heightOfMattingWin + self->_topOfHeadHalf;
  }
  else {
    int v16 = a7 - 1;
  }
  memcpy(&a6[v16 * a8], &a5[v16 * a8], (a7 - v16) * a8);
  if (v16 <= 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = v16;
  }
  uint64_t v19 = (v15 - 19);
  if (v18 > v19)
  {
    uint64_t v20 = (v18 - 1) * a8;
    int v21 = &a6[v20];
    int v22 = &a5[v20];
    float v23 = 0.0499;
    do
    {
      if (a8 >= 1)
      {
        uint64_t v24 = a8;
        uint64_t v25 = v22;
        unsigned int v26 = v21;
        do
        {
          LOBYTE(v17) = *v26;
          unsigned int v27 = *(unsigned __int8 *)v25++;
          float v17 = (float)((float)(1.0 - v23) * (float)v27) + (float)((float)LODWORD(v17) * v23);
          *v26++ = (int)v17;
          --v24;
        }
        while (v24);
      }
      --v18;
      float v23 = v23 + 0.0499;
      v21 -= a8;
      v22 -= a8;
    }
    while (v18 > v19);
  }
  int v35 = 0;
  ContourProcessing::ContourProcessing((ContourProcessing *)v34, (unsigned __int8 *)a6, a7, a8, self->_contourMemoryPool, 0);
  ContourProcessing::contourExtraction((ContourProcessing *)v34, &v35);
  if (v35 >= 21 && self->_topOfHeadHalf >= 1) {
    JFXDistanceTransformEuclidean((uint64_t)a4, (uint64_t)self->_depthBufferFull, a7, a8);
  }
  uint64_t v28 = (a8 * a7);
  if ((int)v28 >= 1)
  {
    do
    {
      unsigned int v29 = *(unsigned __int8 *)a3++;
      if (v29 <= 0x63) {
        *a6 = 0;
      }
      ++a6;
      --v28;
    }
    while (v28);
  }
  int v30 = JFXLog_DebugMatting();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    [(JFXPerfTimer *)v33 end];
    *(_DWORD *)buf = 134217984;
    uint64_t v37 = v31;
    _os_log_impl(&dword_234C41000, v30, OS_LOG_TYPE_DEFAULT, "postproc %.1fms", buf, 0xCu);
  }

  ContourProcessing::~ContourProcessing((ContourProcessing *)v34);
}

- (BOOL)isValidForCameraFrameSet:(id)a3
{
  id v4 = a3;
  id v5 = [v4 depthData];
  unint64_t v6 = (__CVBuffer *)[v5 depthDataMap];

  size_t Width = CVPixelBufferGetWidth(v6);
  size_t Height = CVPixelBufferGetHeight(v6);
  v11.receiver = self;
  v11.super_class = (Class)JFXRGBDMatte;
  if ([(JFXMatting *)&v11 isValidForCameraFrameSet:v4]) {
    BOOL v9 = self->_depthSize.height == (double)Height && self->_depthSize.width == (double)Width;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

+ (CGSize)mattingDepthInputSize
{
  double v2 = 640.0;
  double v3 = 360.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorRotator, 0);
  objc_storeStrong((id *)&self->_matteRotator, 0);
  objc_storeStrong((id *)&self->_imageScaler, 0);
  objc_storeStrong((id *)&self->_processThrottle, 0);
  objc_storeStrong((id *)&self->_processQ, 0);
  objc_storeStrong((id *)&self->_submissionQ, 0);
  grabCutModules = self->_grabCutModules;
  for (uint64_t i = 1; i != -1; --i)
    objc_storeStrong((id *)&grabCutModules[i], 0);
}

@end