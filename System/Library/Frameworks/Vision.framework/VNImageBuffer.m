@interface VNImageBuffer
+ (CGRect)computeCenterCropRectFromCropRect:(CGRect)result inImageSize:(CGSize)a4 calculatedScaleX:(double *)a5 calculatedScaleY:(double *)a6;
+ (const)mapOrientationToRotationDegrees;
+ (uint64_t)_VNVTPixelTransferImageForSource:(CGFloat)a3 destinationBuffer:(CGFloat)a4 cropRect:(uint64_t)a5 performCrop:(__CVBuffer *)a6 vtSessionManager:(__CVBuffer *)a7 error:(int)a8;
- ($80F79C819FA5274A6E5B9E041FED86F1)timingInfo;
- (BOOL)getCameraIntrinsicsAvailable:(id *)a3;
- (BOOL)getCameraOpticalCenterIfAvailable:(CGPoint *)a3;
- (BOOL)getPixelFocalLengthIfAvailable:(float *)a3;
- (BOOL)wantsSequencedRequestObservationsRecording;
- (CGAffineTransform)_calculateTranslationTransformForOrientedCropWithOrientation:(double)a3 unorientedSubsampledFullImageRect:(double)a4 unorientedSubsampledOriginalCrop:(double)a5;
- (CGImage)originalCGImage;
- (CGRect)fullImageBufferRect;
- (CGRect)makeClippedRectAgainstImageExtentUsingOriginalRect:(CGRect)a3;
- (CVPixelBufferPoolRef)_createPotentiallyPooledIOSurfaceBackedPixelBufferWithWith:(size_t)a3 height:(uint64_t)a4 format:(void *)a5 options:(unsigned char *)a6 outPooled:(void *)a7 error:;
- (NSNumber)sceneStabilityMetric;
- (VNImageBuffer)bufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 options:(id)a6 error:(id *)a7;
- (VNImageBuffer)bufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 options:(id)a6 error:(id *)a7 pixelBufferRepsCacheKey:(id *)a8;
- (VNImageBuffer)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 options:(id)a5;
- (VNImageBuffer)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6;
- (VNImageBuffer)initWithCIImage:(id)a3 orientation:(unsigned int)a4 options:(id)a5;
- (VNImageBuffer)initWithCIImage:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6;
- (VNImageBuffer)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6;
- (VNImageBuffer)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6 session:(id)a7;
- (VNImageBuffer)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5;
- (VNImageBuffer)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6;
- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6;
- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6 session:(id)a7;
- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 options:(id)a4;
- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5;
- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6;
- (VNImageBuffer)initWithData:(id)a3 orientation:(unsigned int)a4 options:(id)a5;
- (VNImageBuffer)initWithData:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6;
- (VNImageBuffer)initWithURL:(id)a3 options:(id)a4;
- (VNImageBuffer)initWithURL:(id)a3 orientation:(unsigned int)a4 options:(id)a5;
- (VNImageBuffer)initWithURL:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6;
- (VNSession)session;
- (__CVBuffer)cachedPixelBufferRepresentationForKey:(id)a3;
- (__CVBuffer)createBufferWithMaxSideLengthOf:(unint64_t)a3 pixelFormat:(unsigned int)a4 options:(id)a5 error:(id *)a6;
- (__CVBuffer)createCroppedBufferWithMaxSideLengthOf:(unint64_t)a3 cropRect:(CGRect)a4 pixelFormat:(unsigned int)a5 options:(id)a6 error:(id *)a7 pixelBufferRepsCacheKey:(id *)a8;
- (__CVBuffer)cropAndScaleBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 cropRect:(CGRect)a5 format:(unsigned int)a6 imageCropAndScaleOption:(unint64_t)a7 options:(id)a8 error:(id *)a9 calculatedNormalizedOriginOffset:(CGPoint *)a10 calculatedScaleX:(double *)a11 calculatedScaleY:(double *)a12;
- (__CVBuffer)cropAndScaleBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 cropRect:(CGRect)a5 format:(unsigned int)a6 imageCropAndScaleOption:(unint64_t)a7 options:(id)a8 error:(id *)a9 calculatedNormalizedOriginOffset:(CGPoint *)a10 calculatedScaleX:(double *)a11 calculatedScaleY:(double *)a12 pixelBufferRepsCacheKey:(id *)a13;
- (__CVBuffer)croppedBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 cropRect:(CGRect)a6 options:(id)a7 error:(id *)a8;
- (__CVBuffer)croppedBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 cropRect:(CGRect)a6 options:(id)a7 error:(id *)a8 pixelBufferRepsCacheKey:(id *)a9;
- (__CVBuffer)originalPixelBuffer;
- (id)_optionsWithOverridingOptions:(uint64_t)a1;
- (id)augmentedBuffersWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 options:(id)a6 augmentationOptions:(id)a7 error:(id *)a8;
- (id)augmentedCroppedBuffersWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 cropRect:(CGRect)a6 options:(id)a7 augmentationOptions:(id)a8 error:(id *)a9;
- (id)debugQuickLookObject;
- (id)fileURL;
- (id)imageProperties;
- (id)initWithOptions:(int)a3 orientation:(void *)a4 session:;
- (id)sequencedRequestPreviousObservationsKey;
- (int)aspect;
- (int)aspectForRegionOfInterest:(CGRect)a3;
- (int)orientation;
- (uint64_t)_cropCIImage:(CVPixelBufferRef *)a3 outBuffer:(unint64_t)a4 width:(unint64_t)a5 height:(int)a6 format:(int)a7 cropRect:(void *)a8 performCrop:(double)a9 options:(double)a10 rotate90CCW:(double)a11 error:(double)a12;
- (uint64_t)_cropCVPixelBuffer:(CVPixelBufferRef *)a3 outBuffer:(unint64_t)a4 width:(unint64_t)a5 height:(int)a6 format:(int)a7 cropRect:(void *)a8 performCrop:(CGFloat)a9 options:(CGFloat)a10 rotate90CCW:(CGFloat)a11 error:(CGFloat)a12;
- (uint64_t)_cropImageSourceManager:(CVPixelBufferRef *)a3 outBuffer:(unint64_t)a4 width:(unint64_t)a5 height:(int)a6 format:(int)a7 cropRect:(void *)a8 performCrop:(double)a9 options:(double)a10 rotate90CCW:(double)a11 error:(double)a12;
- (uint64_t)_croppedBufferWithWidth:(uint64_t)a3 height:(uint64_t)a4 format:(void *)a5 cropRect:(void *)a6 options:(void *)a7 error:(char)a8 pixelBufferRepsCacheKey:(double)a9 rotate90CCW:(double)a10;
- (uint64_t)calculateOrientationCorrectedImageDimensions;
- (unint64_t)height;
- (unint64_t)width;
- (void)_baseCIImage;
- (void)_isRectOutOfBounds:(CGFloat)a3;
- (void)dealloc;
- (void)purgeCachedRepresentations;
@end

@implementation VNImageBuffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthRepresentation, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_passedInCIContext, 0);
  objc_storeStrong((id *)&self->_pixelBufferRepsCache, 0);
  objc_storeStrong((id *)&self->_imageSourceManager, 0);
  objc_storeStrong((id *)&self->_origCIImage, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (id)augmentedCroppedBuffersWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 cropRect:(CGRect)a6 options:(id)a7 augmentationOptions:(id)a8 error:(id *)a9
{
  double width = a6.size.width;
  double rect = a6.size.height;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  v287[9] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  id v214 = a8;
  id v206 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v212 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v12 = [(VNImageBuffer *)self width];
  unint64_t v13 = [(VNImageBuffer *)self height];
  v289.origin.CGFloat x = x;
  v289.origin.CGFloat y = y;
  v289.size.double width = width;
  v289.size.height = rect;
  double v14 = (double)v12;
  double v15 = (double)v13;
  if (CGRectIsInfinite(v289))
  {
    BOOL v204 = 0;
  }
  else
  {
    v290.origin.CGFloat x = 0.0;
    v290.origin.CGFloat y = 0.0;
    v290.size.double width = (double)v12;
    v290.size.height = (double)v13;
    v291.origin.CGFloat x = x;
    v291.origin.CGFloat y = y;
    v291.size.double width = width;
    v291.size.height = rect;
    BOOL v204 = !CGRectEqualToRect(v290, v291);
  }
  v287[0] = @"VNImageBufferAugmentationApplePipeline";
  v287[1] = @"VNImageBufferAugmentationBlur";
  v287[2] = @"VNImageBufferAugmentationNoise";
  v287[3] = @"VNImageBufferAugmentationRotation";
  v287[4] = @"VNImageBufferAugmentationFlipHorizontal";
  v287[5] = @"VNImageBufferAugmentationFlipVertical";
  v287[6] = @"VNImageBufferAugmentationShear";
  v287[7] = @"VNImageBufferAugmentationExposure";
  v287[8] = @"VNImageBufferAugmentationRandomCrop";
  v205 = [MEMORY[0x1E4F1C978] arrayWithObjects:v287 count:9];
  v210 = -[VNImageBuffer _optionsWithOverridingOptions:]((uint64_t)self, v11);

  v16 = [v214 allKeys];
  v17 = [v16 firstObjectCommonWithArray:v205];
  BOOL v18 = v17 == 0;

  if (!v18)
  {
    v220 = [v214 objectForKey:@"VNImageBufferAugmentationApplePipeline"];
    if (v220)
    {
      CVPixelBufferRef texture = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a3, a4, a5, a9);
      if (!texture) {
        goto LABEL_221;
      }
      id v19 = v210;
      v20 = v19;
      if (!self)
      {

        goto LABEL_221;
      }
      origPixelBuffer = self->_origPixelBuffer;
      if (origPixelBuffer)
      {
        v22 = (void *)CFAutorelease(origPixelBuffer);
      }
      else
      {
        v24 = -[VNImageBuffer _baseCIImage](self);
        v22 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, [(VNImageBuffer *)self width], [(VNImageBuffer *)self height], 875704422, a9);
        if (v22)
        {
          v25 = self->_passedInCIContext;
          v26 = [(VNImageBuffer *)self session];
          v27 = [v26 vnciContextManager];

          if (v25)
          {
            v28 = 0;
          }
          else
          {
            uint64_t v29 = -[VNCIContextManager waitAndGetAvailableContextFromOptions:error:](v27, MEMORY[0x1E4F1CC08], 0);
            v30 = (void *)v29;
            if (v29) {
              v31 = *(void **)(v29 + 8);
            }
            else {
              v31 = 0;
            }
            v25 = v31;
            v28 = v30;
          }
          [(CIContext *)v25 render:v24 toCVPixelBuffer:v22];
          v22 = (void *)CFAutorelease(v22);
          -[VNCIContextManager releaseContext:]((uint64_t)v27, v28);
        }
      }

      if (!v22) {
        goto LABEL_221;
      }
      if (!-[VNImageBuffer _cropCVPixelBuffer:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:](self, (__CVBuffer *)v22, &texture, a3, a4, a5, v204, v20, x, y, width, rect, 0, a9))goto LABEL_221; {
      [v206 addObject:texture];
      }
      CVPixelBufferRelease(texture);
      CVPixelBufferRef texture = 0;
      CVPixelBufferRef texture = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a3, a4, a5, a9);
      if (!texture) {
        goto LABEL_221;
      }
      v32 = -[VNImageBuffer _baseCIImage](self);
      char v33 = -[VNImageBuffer _cropCIImage:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((id *)&self->super.isa, v32, &texture, a3, a4, a5, v204, v20, x, y, width, rect, 0, a9);

      if ((v33 & 1) == 0) {
        goto LABEL_221;
      }
      [v206 addObject:texture];
      CVPixelBufferRelease(texture);
      CVPixelBufferRef texture = 0;
      if (self->_imageSourceManager)
      {
        CVPixelBufferRef texture = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a3, a4, a5, a9);
        if (!texture
          || !-[VNImageBuffer _cropImageSourceManager:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((uint64_t)self, self->_imageSourceManager, &texture, a3, a4, a5, v204, v20, x, y, width, rect, 0, a9))
        {
          goto LABEL_221;
        }
        [v206 addObject:texture];
        CVPixelBufferRelease(texture);
      }
    }
    v34 = -[VNImageBuffer _baseCIImage](self);
    [v212 addObject:v34];

    v35 = [v214 objectForKey:@"VNImageBufferAugmentationBlur"];

    v221 = v35;
    if (v35)
    {
      id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v37 = [v35 objectForKey:@"VNImageBufferAugmentationOptionMaxRange"];
      v38 = v37;
      if (v37)
      {
        [v37 floatValue];
        float v40 = v39;
      }
      else
      {
        float v40 = 32.0;
      }
      v41 = [v221 objectForKey:@"VNImageBufferAugmentationOptionMinRange"];

      v42 = v41;
      if (v41)
      {
        [v41 floatValue];
        float v44 = v43;
      }
      else
      {
        float v44 = 1.0;
      }
      v45 = [v221 objectForKey:@"VNImageBufferAugmentationOptionNumberOfBuffers"];

      if (v45) {
        unsigned int v242 = [v45 intValue];
      }
      else {
        unsigned int v242 = 10;
      }
      v46 = [v221 objectForKey:@"VNImageBufferAugmentationOptionRandomSeed"];

      if (v46)
      {
        srand([v46 intValue]);
        float v47 = (float)(v40 - v44) * 4.6566e-10;
      }
      else
      {
        float v47 = (float)(v40 - v44) / (float)v242;
      }
      v48 = [MEMORY[0x1E4F1E040] filterWithName:@"CIDiscBlur"];
      long long v277 = 0u;
      long long v278 = 0u;
      long long v275 = 0u;
      long long v276 = 0u;
      obuint64_t j = v212;
      uint64_t v49 = [obj countByEnumeratingWithState:&v275 objects:v286 count:16];
      if (v49)
      {
        id v228 = (id)*MEMORY[0x1E4F1E480];
        id v232 = *(id *)v276;
        uint64_t v50 = *MEMORY[0x1E4F1E4E0];
        do
        {
          uint64_t v51 = 0;
          uint64_t v237 = v49;
          do
          {
            if (*(id *)v276 != v232) {
              objc_enumerationMutation(obj);
            }
            v52 = *(void **)(*((void *)&v275 + 1) + 8 * v51);
            v53 = [v52 imageByClampingToExtent];
            [v48 setValue:v53 forKey:v228];

            unsigned int v55 = v242;
            for (float i = v44; v55; --v55)
            {
              *(float *)&double v54 = i;
              v57 = [NSNumber numberWithFloat:v54];
              [v48 setValue:v57 forKey:v50];

              v58 = [v48 outputImage];
              [v52 extent];
              v59 = objc_msgSend(v58, "imageByCroppingToRect:");

              [v36 addObject:v59];
              if (v46) {
                float i = v44 + (float)((float)random() * v47);
              }
              else {
                float i = v47 + i;
              }
            }
            ++v51;
          }
          while (v51 != v237);
          uint64_t v49 = [obj countByEnumeratingWithState:&v275 objects:v286 count:16];
        }
        while (v49);
      }

      id v212 = v36;
    }
    v60 = [v214 objectForKey:@"VNImageBufferAugmentationExposure"];

    v222 = v60;
    if (v60)
    {
      id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v62 = [v60 objectForKey:@"VNImageBufferAugmentationOptionMaxRange"];
      v63 = v62;
      if (v62)
      {
        [v62 floatValue];
        float v65 = v64;
      }
      else
      {
        float v65 = 2.0;
      }
      v66 = [v60 objectForKey:@"VNImageBufferAugmentationOptionMinRange"];

      v67 = v66;
      if (v66)
      {
        [v66 floatValue];
        float v69 = v68;
      }
      else
      {
        float v69 = -2.0;
      }
      v70 = [v222 objectForKey:@"VNImageBufferAugmentationOptionNumberOfBuffers"];

      if (v70) {
        unsigned int v243 = [v70 intValue];
      }
      else {
        unsigned int v243 = 10;
      }
      v71 = [v222 objectForKey:@"VNImageBufferAugmentationOptionRandomSeed"];

      if (v71)
      {
        srand([v71 intValue]);
        float v72 = (float)(v65 - v69) * 4.6566e-10;
      }
      else
      {
        float v72 = (float)(v65 - v69) / (float)v243;
      }
      v73 = [MEMORY[0x1E4F1E040] filterWithName:@"CIExposureAdjust"];
      long long v273 = 0u;
      long long v274 = 0u;
      long long v271 = 0u;
      long long v272 = 0u;
      id v229 = v212;
      uint64_t v74 = [v229 countByEnumeratingWithState:&v271 objects:v285 count:16];
      if (v74)
      {
        id v233 = (id)*MEMORY[0x1E4F1E480];
        uint64_t v238 = *(void *)v272;
        uint64_t v75 = *MEMORY[0x1E4F1E470];
        do
        {
          for (uint64_t j = 0; j != v74; ++j)
          {
            if (*(void *)v272 != v238) {
              objc_enumerationMutation(v229);
            }
            [v73 setValue:*(void *)(*((void *)&v271 + 1) + 8 * j) forKey:v233];
            unsigned int v78 = v243;
            for (float k = v69; v78; --v78)
            {
              *(float *)&double v77 = k;
              v80 = [NSNumber numberWithFloat:v77];
              [v73 setValue:v80 forKey:v75];

              v81 = [v73 outputImage];
              [v61 addObject:v81];

              if (v71) {
                float k = v69 + (float)((float)random() * v72);
              }
              else {
                float k = v72 + k;
              }
            }
          }
          uint64_t v74 = [v229 countByEnumeratingWithState:&v271 objects:v285 count:16];
        }
        while (v74);
      }

      id v212 = v61;
    }
    v82 = [v214 objectForKey:@"VNImageBufferAugmentationShear"];

    v223 = v82;
    if (v82)
    {
      id v83 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v84 = [v82 objectForKey:@"VNImageBufferAugmentationOptionMaxRange"];
      v85 = v84;
      if (v84)
      {
        [v84 floatValue];
        float v87 = v86;
      }
      else
      {
        float v87 = 10.0;
      }
      v88 = [v82 objectForKey:@"VNImageBufferAugmentationOptionMinRange"];

      v89 = v88;
      if (v88)
      {
        [v88 floatValue];
        float v91 = v90;
      }
      else
      {
        float v91 = -10.0;
      }
      v92 = [v223 objectForKey:@"VNImageBufferAugmentationOptionNumberOfBuffers"];

      if (v92) {
        unsigned int v244 = [v92 intValue];
      }
      else {
        unsigned int v244 = 10;
      }
      v93 = [v223 objectForKey:@"VNImageBufferAugmentationOptionRandomSeed"];

      if (v93)
      {
        srand([v93 intValue]);
        float v94 = (float)(v87 - v91) * 4.6566e-10;
      }
      else
      {
        float v94 = (float)(v87 - v91) / (float)v244;
      }
      long long v269 = 0u;
      long long v270 = 0u;
      long long v267 = 0u;
      long long v268 = 0u;
      id v234 = v212;
      uint64_t v95 = [v234 countByEnumeratingWithState:&v267 objects:v284 count:16];
      if (v95)
      {
        uint64_t v239 = *(void *)v268;
        v96 = (uint64_t *)MEMORY[0x1E4F1DAB8];
        do
        {
          for (uint64_t m = 0; m != v95; ++m)
          {
            if (*(void *)v268 != v239) {
              objc_enumerationMutation(v234);
            }
            if (v244)
            {
              v98 = *(void **)(*((void *)&v267 + 1) + 8 * m);
              unsigned int v99 = v244;
              float v100 = v91;
              do
              {
                uint64_t v101 = *v96;
                long long v265 = *(_OWORD *)(v96 + 3);
                uint64_t v266 = v96[5];
                v264[0] = v101;
                v264[1] = 0;
                *(double *)&v264[2] = v100 * 3.14159265 / -180.0;
                v102 = [v98 imageByApplyingTransform:v264];
                [v83 addObject:v102];

                if (v93) {
                  float v100 = v91 + (float)((float)random() * v94);
                }
                else {
                  float v100 = v94 + v100;
                }
                --v99;
              }
              while (v99);
            }
          }
          uint64_t v95 = [v234 countByEnumeratingWithState:&v267 objects:v284 count:16];
        }
        while (v95);
      }

      id v212 = v83;
    }
    v103 = [v214 objectForKey:@"VNImageBufferAugmentationRotation"];

    v224 = v103;
    if (v103)
    {
      id v104 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v105 = [v103 objectForKey:@"VNImageBufferAugmentationOptionMaxRange"];
      v106 = v105;
      if (v105)
      {
        [v105 floatValue];
        float v108 = v107;
      }
      else
      {
        float v108 = 10.0;
      }
      v109 = [v224 objectForKey:@"VNImageBufferAugmentationOptionMinRange"];

      v110 = v109;
      if (v109)
      {
        [v109 floatValue];
        float v112 = v111;
      }
      else
      {
        float v112 = -10.0;
      }
      v113 = [v224 objectForKey:@"VNImageBufferAugmentationOptionNumberOfBuffers"];

      if (v113) {
        unsigned int v245 = [v113 intValue];
      }
      else {
        unsigned int v245 = 10;
      }
      v114 = [v224 objectForKey:@"VNImageBufferAugmentationOptionRandomSeed"];

      if (v114)
      {
        srand([v114 intValue]);
        float v115 = (float)(v108 - v112) * 4.6566e-10;
      }
      else
      {
        float v115 = (float)(v108 - v112) / (float)v245;
      }
      v116 = [MEMORY[0x1E4F1E040] filterWithName:@"CIStraightenFilter"];
      long long v262 = 0u;
      long long v263 = 0u;
      long long v260 = 0u;
      long long v261 = 0u;
      id v230 = v212;
      uint64_t v117 = [v230 countByEnumeratingWithState:&v260 objects:v283 count:16];
      if (v117)
      {
        uint64_t v240 = *(void *)v261;
        id v235 = (id)*MEMORY[0x1E4F1E480];
        uint64_t v118 = *MEMORY[0x1E4F1E408];
        do
        {
          for (uint64_t n = 0; n != v117; ++n)
          {
            if (*(void *)v261 != v240) {
              objc_enumerationMutation(v230);
            }
            [v116 setValue:*(void *)(*((void *)&v260 + 1) + 8 * n) forKey:v235];
            unsigned int v120 = v245;
            for (ifloat i = v112; v120; --v120)
            {
              v122 = [NSNumber numberWithDouble:ii * 3.14159265 / 180.0];
              [v116 setValue:v122 forKey:v118];

              v123 = [v116 outputImage];
              [v104 addObject:v123];

              if (v114) {
                ifloat i = v112 + (float)((float)random() * v115);
              }
              else {
                ifloat i = v115 + ii;
              }
            }
          }
          uint64_t v117 = [v230 countByEnumeratingWithState:&v260 objects:v283 count:16];
        }
        while (v117);
      }

      id v212 = v104;
    }
    v203 = [v214 objectForKey:@"VNImageBufferAugmentationNoise"];

    if (v203)
    {
      id v246 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v124 = [v203 objectForKey:@"VNImageBufferAugmentationOptionMaxRange"];
      v125 = v124;
      if (v124)
      {
        [v124 floatValue];
        float v127 = v126;
      }
      else
      {
        float v127 = 0.0;
      }
      v128 = [v203 objectForKey:@"VNImageBufferAugmentationOptionMinRange"];

      v129 = v128;
      if (v128)
      {
        [v128 floatValue];
        float v131 = v130;
      }
      else
      {
        float v131 = 1.0;
      }
      v132 = [v203 objectForKey:@"VNImageBufferAugmentationOptionNumberOfBuffers"];

      v133 = v132;
      if (v132) {
        unsigned int v241 = [v132 intValue];
      }
      else {
        unsigned int v241 = 10;
      }
      v134 = [v203 objectForKey:@"VNImageBufferAugmentationOptionRandomSeed"];

      if (v134)
      {
        srand([v134 intValue]);
        float v135 = (float)(v127 - v131) * 4.6566e-10;
      }
      else
      {
        float v135 = (float)(v127 - v131) / (float)v241;
      }
      id v231 = [MEMORY[0x1E4F1E040] filterWithName:@"CIRandomGenerator"];
      v136 = [MEMORY[0x1E4F1E040] filterWithName:@"CIColorMonochrome"];
      v137 = [MEMORY[0x1E4F1E040] filterWithName:@"CIMultiplyBlendMode"];
      long long v258 = 0u;
      long long v259 = 0u;
      long long v256 = 0u;
      long long v257 = 0u;
      id v215 = v212;
      uint64_t v138 = [v215 countByEnumeratingWithState:&v256 objects:v282 count:16];
      if (v138)
      {
        id obja = *(id *)v257;
        uint64_t v139 = *MEMORY[0x1E4F1E480];
        uint64_t v225 = *MEMORY[0x1E4F1E448];
        uint64_t v219 = *MEMORY[0x1E4F1E418];
        uint64_t v140 = *MEMORY[0x1E4F1E488];
        do
        {
          id v236 = (id)v138;
          for (juint64_t j = 0; jj != v236; juint64_t j = (char *)jj + 1)
          {
            if (*(id *)v257 != obja) {
              objc_enumerationMutation(v215);
            }
            v142 = *(void **)(*((void *)&v256 + 1) + 8 * (void)jj);
            v143 = [v231 outputImage];
            [v136 setValue:v143 forKey:v139];

            v144 = [MEMORY[0x1E4F1E008] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
            [v136 setValue:v144 forKey:v225];

            v145 = [v142 imageByClampingToExtent];
            [v137 setValue:v145 forKey:v219];

            unsigned int v147 = v241;
            for (kfloat k = v131; v147; --v147)
            {
              *(float *)&double v146 = kk;
              v149 = [NSNumber numberWithFloat:v146];
              [v136 setValue:v149 forKey:v140];

              v150 = [v136 outputImage];
              [v137 setValue:v150 forKey:v139];

              v151 = [v137 outputImage];
              [v246 addObject:v151];

              if (v134) {
                kfloat k = v131 + (float)((float)random() * v135);
              }
              else {
                kfloat k = v135 + kk;
              }
            }
          }
          uint64_t v138 = [v215 countByEnumeratingWithState:&v256 objects:v282 count:16];
        }
        while (v138);
      }

      id v212 = v246;
    }
    v152 = [v214 objectForKey:@"VNImageBufferAugmentationFlipHorizontal"];

    v153 = [v214 objectForKey:@"VNImageBufferAugmentationFlipVertical"];

    if (v152 != 0 || v153 != 0)
    {
      id v154 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v254 = 0u;
      long long v255 = 0u;
      long long v252 = 0u;
      long long v253 = 0u;
      id v247 = v212;
      uint64_t v155 = [v247 countByEnumeratingWithState:&v252 objects:v281 count:16];
      if (v155)
      {
        uint64_t v156 = *(void *)v253;
        do
        {
          for (muint64_t m = 0; mm != v155; ++mm)
          {
            if (*(void *)v253 != v156) {
              objc_enumerationMutation(v247);
            }
            v158 = *(void **)(*((void *)&v252 + 1) + 8 * mm);
            v159 = objc_msgSend(v158, "imageByCroppingToRect:", 0.0, 0.0, v14, v15);
            v160 = [v159 imageByApplyingCGOrientation:2];

            v161 = objc_msgSend(v158, "imageByCroppingToRect:", x, y, width, rect);
            v162 = [v161 imageByApplyingCGOrientation:4];

            [v154 addObject:v158];
            if (v152) {
              [v154 addObject:v160];
            }
            if (v153) {
              [v154 addObject:v162];
            }
          }
          uint64_t v155 = [v247 countByEnumeratingWithState:&v252 objects:v281 count:16];
        }
        while (v155);
      }

      id v212 = v154;
    }
    v220 = [v214 objectForKey:@"VNImageBufferAugmentationRandomCrop"];

    if (v220)
    {
      v163 = [v220 objectForKey:@"VNImageBufferAugmentationOptionMaxRange"];
      v164 = v163;
      if (v163)
      {
        [v163 floatValue];
        float v166 = v165;
      }
      else
      {
        float v166 = 0.1;
      }
      v170 = [v220 objectForKey:@"VNImageBufferAugmentationOptionMinRange"];

      v171 = v170;
      if (v170)
      {
        [v170 floatValue];
        float v169 = v172;
      }
      else
      {
        float v169 = 0.1;
      }
      v173 = [v220 objectForKey:@"VNImageBufferAugmentationOptionNumberOfBuffers"];

      v174 = v173;
      if (v173) {
        unsigned int v167 = [v173 intValue];
      }
      else {
        unsigned int v167 = 10;
      }
      v175 = [v220 objectForKey:@"VNImageBufferAugmentationOptionRandomSeed"];

      if (v175) {
        unsigned int v176 = [v175 intValue];
      }
      else {
        unsigned int v176 = 0;
      }
      srand(v176);

      float v168 = fmaxf((float)(v169 - v166) / (float)v167, 0.001);
    }
    else
    {
      unsigned int v167 = 10;
      float v168 = 0.001;
      float v166 = 0.1;
      float v169 = 0.1;
    }
    CVPixelBufferRef texture = 0;
    unint64_t v177 = [v212 count];
    if (v220 || v177 >= 2)
    {
      long long v250 = 0u;
      long long v251 = 0u;
      long long v248 = 0u;
      long long v249 = 0u;
      id v178 = v212;
      uint64_t v179 = [v178 countByEnumeratingWithState:&v248 objects:v280 count:16];
      if (v179)
      {
        uint64_t v180 = *(void *)v249;
        v181 = (CGFloat *)MEMORY[0x1E4F1DAD8];
        while (2)
        {
          for (nuint64_t n = 0; nn != v179; ++nn)
          {
            if (*(void *)v249 != v180) {
              objc_enumerationMutation(v178);
            }
            v183 = *(void **)(*((void *)&v248 + 1) + 8 * nn);
            if (v220)
            {
              float v184 = v166;
              if (v166 <= v169)
              {
                while (1)
                {
                  unint64_t v187 = [(VNImageBuffer *)self height];
                  unint64_t v188 = [(VNImageBuffer *)self width];
                  double v189 = 1.0 - v184;
                  float v190 = width * v189;
                  float v191 = ceilf(v190);
                  double v185 = v191;
                  *(float *)&double v189 = rect * v189;
                  *(float *)&double v189 = ceilf(*(float *)&v189);
                  double v186 = *(float *)&v189;
                  BOOL v192 = v191 < 1.0;
                  if (*(float *)&v189 < 1.0) {
                    BOOL v192 = 1;
                  }
                  if (a9 && v192)
                  {
                    v201 = objc_msgSend([NSString alloc], "initWithFormat:", @"RandomCrop produced an invalid crop for width %f height %f", *(void *)&v185, *(void *)&v186);
                    *a9 = +[VNError errorWithCode:14 message:v201];

                    goto LABEL_220;
                  }
                  if (v167) {
                    break;
                  }
LABEL_208:
                  float v184 = v168 + v184;
                  if (v184 > v169) {
                    goto LABEL_198;
                  }
                }
                double v193 = (double)v187 - v186;
                double v194 = (double)v188 - v185;
                unsigned int v195 = v167;
                while (1)
                {
                  uint64_t v196 = random();
                  CVPixelBufferRef texture = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a3, a4, a5, a9);
                  if (!texture) {
                    break;
                  }
                  double v197 = (float)((float)v196 * 4.6566e-10);
                  float v198 = v194 * v197;
                  *(float *)&double v197 = v193 * v197;
                  if (!-[VNImageBuffer _cropCIImage:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((id *)&self->super.isa, v183, &texture, a3, a4, a5, v204, v210, ceilf(v198), ceilf(*(float *)&v197), v185, v186, 0, a9))break; {
                  [v206 addObject:texture];
                  }
                  CVPixelBufferRelease(texture);
                  CVPixelBufferRef texture = 0;
                  if (!--v195) {
                    goto LABEL_208;
                  }
                }
LABEL_220:

                goto LABEL_221;
              }
              double v185 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
              double v186 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_198:
              CGFloat x = *v181;
              CGFloat y = v181[1];
              double width = v185;
              double rect = v186;
            }
            else
            {
              CVPixelBufferRef texture = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a3, a4, a5, a9);
              if (!texture
                || !-[VNImageBuffer _cropCIImage:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((id *)&self->super.isa, v183, &texture, a3, a4, a5, v204, v210, x, y, width, rect, 0, a9))
              {
                goto LABEL_220;
              }
              [v206 addObject:texture];
              CVPixelBufferRelease(texture);
              CVPixelBufferRef texture = 0;
            }
          }
          uint64_t v179 = [v178 countByEnumeratingWithState:&v248 objects:v280 count:16];
          if (v179) {
            continue;
          }
          break;
        }
      }
    }
    CVPixelBufferRef texture = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a3, a4, a5, a9);
    if (texture)
    {
      v199 = -[VNImageBuffer _baseCIImage](self);
      char v200 = -[VNImageBuffer _cropCIImage:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((id *)&self->super.isa, v199, &texture, a3, a4, a5, v204, v210, x, y, width, rect, 0, a9);

      if (v200)
      {
        [v206 addObject:texture];
        CVPixelBufferRelease(texture);
        id v23 = v206;
LABEL_222:

        goto LABEL_223;
      }
    }
LABEL_221:
    id v23 = 0;
    goto LABEL_222;
  }
  if (a9)
  {
    +[VNError errorWithCode:14 message:@"The augmentationOptions do not conatain any of the VNImageBufferAugmentation keys"];
    id v23 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = 0;
  }
LABEL_223:

  return v23;
}

- (id)_optionsWithOverridingOptions:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = (void *)[*(id *)(a1 + 88) mutableCopy];
    [v4 addEntriesFromDictionary:v3];
    v5 = (void *)[v4 copy];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)_cropCVPixelBuffer:(CVPixelBufferRef *)a3 outBuffer:(unint64_t)a4 width:(unint64_t)a5 height:(int)a6 format:(int)a7 cropRect:(void *)a8 performCrop:(CGFloat)a9 options:(CGFloat)a10 rotate90CCW:(CGFloat)a11 error:(CGFloat)a12
{
  v134.double x = a9;
  v134.double y = a10;
  CGFloat v135 = a11;
  CGFloat v136 = a12;
  id v21 = a8;
  if (a1
    && +[VNValidationUtilities validateNonNilOptionsDictionary:v21 selector:sel__cropCVPixelBuffer_outBuffer_width_height_format_cropRect_performCrop_options_rotate90CCW_error_ error:a14])
  {
    +[VNError VNAssert:a3 != 0 log:@"Internal error: missing target buffer for crop operations"];
    [a1 fullImageBufferRect];
    v145.origin.double x = a9;
    v145.origin.double y = a10;
    v145.size.double width = a11;
    v145.size.double height = a12;
    CGRect v139 = CGRectIntersection(v138, v145);
    double width = v139.size.width;
    double height = v139.size.height;
    if (a10 >= 0.0) {
      double v24 = 0.0;
    }
    else {
      double v24 = -a10;
    }
    if (a9 >= 0.0) {
      double v25 = 0.0;
    }
    else {
      double v25 = -a9;
    }
    v132.f64[0] = v25;
    v132.f64[1] = v24;
    double rect = v24;
    *(double *)&long long v133 = width;
    *((void *)&v133 + 1) = *(void *)&v139.size.height;
    unsigned int v26 = -[VNImageBuffer _isRectOutOfBounds:](a1, a9, a10, a11, a12);
    if (v26)
    {
      double v27 = (double)a4 / a11;
      double v28 = (double)a5 / a12;
      double v25 = v25 * v27;
      double width = width * v27;
      v132.f64[0] = v25;
      v132.f64[1] = (a12 - (rect + height)) * v28;
      double rect = v132.f64[1];
      double height = height * v28;
      *(double *)&long long v133 = width;
      *((double *)&v133 + 1) = height;
    }
    VNAlignRectToSubsampledCVPixelBufferConstraint((float64x2_t *)&v134, a2);
    [a1 fullImageBufferRect];
    v146.origiuint64_t n = v134;
    v146.size.double width = v135;
    v146.size.double height = v136;
    CGRect v141 = CGRectIntersection(v140, v146);
    double x = v141.origin.x;
    double y = v141.origin.y;
    double v31 = v141.size.width;
    double v32 = v141.size.height;
    v134.double x = v141.origin.x;
    v134.double y = v141.origin.y;
    CGFloat v135 = v141.size.width;
    CGFloat v136 = v141.size.height;
    uint64_t v33 = [a1 orientation];
    size_t v34 = CVPixelBufferGetWidth(a2);
    size_t v35 = CVPixelBufferGetHeight(a2);
    self;
    double v42 = (double)v35;
    CGFloat v107 = v25;
    CGFloat v108 = width;
    double v43 = (double)v34;
    double v44 = x;
    double v45 = v31;
    switch((int)v33)
    {
      case 1:
        goto LABEL_23;
      case 2:
        double v44 = v43 - (x + v31);
        double y = v42 - (y + v32);
        goto LABEL_24;
      case 3:
        double v44 = v43 - (x + v31);
        goto LABEL_24;
      case 4:
        break;
      case 5:
        double v44 = v43 - (y + v32);
        goto LABEL_17;
      case 6:
        double v44 = v43 - (y + v32);
        double v47 = x + v31;
        goto LABEL_20;
      case 7:
        double v47 = x + v31;
        double v44 = y;
LABEL_20:
        double y = v42 - v47;
        goto LABEL_21;
      case 8:
        double v44 = y;
LABEL_17:
        double y = x;
LABEL_21:
        double v45 = v32;
        double v32 = v31;
        break;
      default:
        VNValidatedLog(4, @"VNImageBuffer - invalid rotation case", v36, v37, v38, v39, v40, v41, v102);
LABEL_23:
        double y = v42 - (y + v32);
        double v44 = x;
LABEL_24:
        double v45 = v31;
        break;
    }
    id v131 = 0;
    BOOL v48 = +[VNValidationUtilities getOptionalObject:&v131 ofClass:objc_opt_class() forKey:@"VNImageBufferOption_FeatureOrientationRelativeToUpRight" inOptions:v21 error:a14];
    id v49 = v131;
    if (!v48)
    {
      uint64_t v46 = 0;
LABEL_68:

      goto LABEL_69;
    }
    id v106 = v49;
    if (v49) {
      uint64_t v50 = [v49 integerValue];
    }
    else {
      uint64_t v50 = 1;
    }
    int v130 = -1;
    if ((VNCalculateFeatureCropOrientationFromSuperpositionOfFeatureWithImageOrientations(v33, v50, &v130, a13, a14) & 1) == 0)
    {
      uint64_t v46 = 0;
LABEL_67:
      id v49 = v106;
      goto LABEL_68;
    }
    uint64_t v51 = *a3;
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(*a3);
    size_t v52 = CVPixelBufferGetWidth(v51);
    cf = v51;
    size_t v53 = CVPixelBufferGetHeight(v51);
    double v54 = [a1 session];
    v105 = [v54 vnvtSessionManager];
    double v55 = (double)(int)v44;
    double v56 = (double)(int)y;
    double v57 = (double)(int)v45;
    double v58 = (double)(int)v32;
    double v59 = (double)v52;
    double v60 = (double)v53;

    if (v130 == 1)
    {
      if (v26)
      {
        v142.origin.double x = v107;
        v142.size.double width = v108;
        v142.origin.double y = rect;
        v142.size.double height = height;
        CGRect v143 = CGRectIntegral(v142);
        v147.origin.double x = 0.0;
        v147.origin.double y = 0.0;
        v147.size.double width = (double)v52;
        v147.size.double height = (double)v53;
        CGRect v144 = CGRectIntersection(v143, v147);
        v132.f64[0] = v144.origin.x;
        v132.f64[1] = v144.origin.y;
        *(CGFloat *)&long long v133 = v144.size.width;
        *((void *)&v133 + 1) = *(void *)&v144.size.height;
        VNAlignRectToSubsampledCVPixelBufferConstraint(&v132, cf);
        id v61 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)*(double *)&v133, (unint64_t)*((double *)&v133 + 1), PixelFormatType, a14);
        if (v61)
        {
          if (+[VNImageBuffer _VNVTPixelTransferImageForSource:destinationBuffer:cropRect:performCrop:vtSessionManager:error:](v55, v56, v57, v58, (uint64_t)VNImageBuffer, a2, v61, a7, v105, a14))
          {
            OSType v62 = CVPixelBufferGetPixelFormatType(v61);
            v63 = -[VNVTSessionManager waitAndGetAvailablePixelRotationSessionForInputPixelFormat:outputPixelFormat:rotation:flipHorizontal:flipVertical:error:]((uint64_t)v105, v62, PixelFormatType, 0, 0, 0, a14);
            if (v63)
            {
              uint64_t v64 = VTPixelRotationSessionRotateSubImage();
              if (!v64)
              {
                char v89 = 1;
LABEL_62:
                -[VNVTSessionManager releasePixelRotationSession:]((uint64_t)v105, v63);
                CVPixelBufferRelease(v61);

                if (v89)
                {
LABEL_63:
                  if (a6 == 1278226488)
                  {
                    *a3 = 0;
                    v114[0] = MEMORY[0x1E4F143A8];
                    v114[1] = 3221225472;
                    v114[2] = __113__VNImageBuffer__cropCVPixelBuffer_outBuffer_width_height_format_cropRect_performCrop_options_rotate90CCW_error___block_invoke_2;
                    v114[3] = &__block_descriptor_60_e25_B24__0____CVBuffer__8__16l;
                    v114[4] = a4;
                    v114[5] = a5;
                    int v115 = 1278226488;
                    v114[6] = a3;
                    VNExecuteBlockWithPixelBuffer(cf, 0, v114, a14);
                  }
                  unsigned __int8 v137 = 1;
                }
LABEL_66:

                uint64_t v46 = v137;
                goto LABEL_67;
              }
              if (a14)
              {
                id v65 = [NSString alloc];
                CFIndex v66 = CFGetRetainCount(v61);
                uint64_t v67 = CVPixelBufferGetPixelFormatType(v61);
                float v68 = (void *)[v65 initWithFormat:@"VNImageBuffer - Failed to transfer bufferForTransferSubImage                                                                                 (retain count = %ld, type = %u) to vtSessionDestBuffer                                                                                 (retain count = %ld, type = %u). Error %d", v66, v67, CFGetRetainCount(cf), PixelFormatType, v64];
                *a14 = +[VNError errorWithCode:3 message:v68];
              }
            }
          }
          else
          {
            v63 = 0;
          }
          char v89 = 0;
          unsigned __int8 v137 = 0;
          goto LABEL_62;
        }
      }
      else if (+[VNImageBuffer _VNVTPixelTransferImageForSource:destinationBuffer:cropRect:performCrop:vtSessionManager:error:](v55, v56, v57, v58, (uint64_t)VNImageBuffer, a2, cf, a7, v105, a14))
      {
        goto LABEL_63;
      }
    }
    else
    {
      if (v130 >= 9)
      {
        id v69 = [NSString alloc];
        v70 = objc_msgSend(v69, "initWithFormat:", @"VNImageBuffer - wrong crop orientation for rotation: %d", v130);
        if (a14)
        {
          *a14 = +[VNError errorForInternalErrorWithLocalizedDescription:v70];
        }
        id v71 = v70;
        uint64_t v72 = [v71 UTF8String];
        VNValidatedLog(4, @"%s", v73, v74, v75, v76, v77, v78, v72);
        unsigned __int8 v137 = 0;

        goto LABEL_66;
      }
      uint64_t v79 = [(id)objc_opt_class() mapOrientationToRotationDegrees];
      uint64_t v82 = *(void *)(v79 + 8);
      uint64_t v80 = v79 + 8;
      uint64_t v81 = v82;
      if (!v82) {
        goto LABEL_57;
      }
      uint64_t v83 = v80;
      do
      {
        int v84 = *(_DWORD *)(v81 + 28);
        BOOL v85 = v84 < v130;
        if (v84 >= v130) {
          float v86 = (uint64_t *)v81;
        }
        else {
          float v86 = (uint64_t *)(v81 + 8);
        }
        if (!v85) {
          uint64_t v83 = v81;
        }
        uint64_t v81 = *v86;
      }
      while (*v86);
      if (v83 != v80 && v130 >= *(_DWORD *)(v83 + 28))
      {
        int v91 = *(_DWORD *)(v83 + 32);
        BOOL v93 = v130 == 2 || v130 == 5;
        if (v130 <= 4) {
          size_t v94 = a4;
        }
        else {
          size_t v94 = a5;
        }
        if (v130 <= 4) {
          size_t v95 = a5;
        }
        else {
          size_t v95 = a4;
        }
        int v96 = v130 == 7 || v130 == 4;
        v97 = -[VNImageBuffer _createPotentiallyPooledIOSurfaceBackedPixelBufferWithWith:height:format:options:outPooled:error:]((CVPixelBufferPoolRef)a1, v94, v95, PixelFormatType, v21, 0, a14);
        if (v97)
        {
          if ((+[VNImageBuffer _VNVTPixelTransferImageForSource:destinationBuffer:cropRect:performCrop:vtSessionManager:error:](v55, v56, v57, v58, (uint64_t)VNImageBuffer, a2, v97, a7, v105, a14) & 1) != 0&& (OSType v98 = CVPixelBufferGetPixelFormatType(v97), -[VNVTSessionManager waitAndGetAvailablePixelRotationSessionForInputPixelFormat:outputPixelFormat:rotation:flipHorizontal:flipVertical:error:]((uint64_t)v105, v98, PixelFormatType, v91, v93, v96, a14),
                (unsigned int v99 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v116[0] = MEMORY[0x1E4F143A8];
            v116[1] = 3221225472;
            float64x2_t v118 = v132;
            v116[2] = __113__VNImageBuffer__cropCVPixelBuffer_outBuffer_width_height_format_cropRect_performCrop_options_rotate90CCW_error___block_invoke;
            v116[3] = &unk_1E5B1C510;
            char v129 = v26;
            long long v119 = v133;
            unsigned int v120 = cf;
            int v124 = v50;
            double v121 = v59;
            double v122 = v60;
            id v100 = v99;
            id v117 = v100;
            v123 = v97;
            OSType v125 = v98;
            int v126 = PixelFormatType;
            int v127 = v130;
            int v128 = v91;
            if (VNExecuteBlockWithPixelBuffer(a2, 1uLL, v116, a14))
            {
              int v101 = 0;
            }
            else
            {
              unsigned __int8 v137 = 0;
              int v101 = 1;
            }
          }
          else
          {
            id v100 = 0;
            unsigned __int8 v137 = 0;
            int v101 = 3;
          }
          CVPixelBufferRelease(v97);
          -[VNVTSessionManager releasePixelRotationSession:]((uint64_t)v105, v100);

          if (v101) {
            goto LABEL_66;
          }
          goto LABEL_63;
        }
      }
      else
      {
LABEL_57:
        if (a14)
        {
          id v87 = [NSString alloc];
          v88 = objc_msgSend(v87, "initWithFormat:", @"Invalid crop orientation: %d", v130);
          *a14 = +[VNError errorForInternalErrorWithLocalizedDescription:v88];
        }
      }
    }
    unsigned __int8 v137 = 0;
    goto LABEL_66;
  }
  uint64_t v46 = 0;
LABEL_69:

  return v46;
}

- (void)_baseCIImage
{
  v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[3];
    if (v2)
    {
      id v3 = v2;
LABEL_6:
      v1 = v3;
      goto LABEL_7;
    }
    if (a1[2])
    {
      id v3 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVImageBuffer:");
      goto LABEL_6;
    }
    uint64_t v5 = a1[5];
    if (v5)
    {
      id v6 = *(id *)(v5 + 64);
      if (v6)
      {
        v1 = [MEMORY[0x1E4F1E050] imageWithContentsOfURL:v6];
      }
      else
      {
        uint64_t v7 = v1[5];
        if (v7) {
          id v8 = *(id *)(v7 + 72);
        }
        else {
          id v8 = 0;
        }

        v1 = 0;
      }
    }
    else
    {
      v1 = 0;
    }
  }
LABEL_7:

  return v1;
}

- (uint64_t)_cropCIImage:(CVPixelBufferRef *)a3 outBuffer:(unint64_t)a4 width:(unint64_t)a5 height:(int)a6 format:(int)a7 cropRect:(void *)a8 performCrop:(double)a9 options:(double)a10 rotate90CCW:(double)a11 error:(double)a12
{
  id v24 = a2;
  id v25 = a8;
  if (a1
    && +[VNValidationUtilities validateNonNilOptionsDictionary:v25 selector:sel__cropCIImage_outBuffer_width_height_format_cropRect_performCrop_options_rotate90CCW_error_ error:a14])
  {
    +[VNError VNAssert:a3 != 0 log:@"Internal error: missing target buffer for crop operations"];
    uint64_t v26 = [a1 orientation];
    memset(&v80, 0, sizeof(v80));
    if (v24) {
      [v24 imageTransformForCGOrientation:v26];
    }
    else {
      memset(&v79, 0, sizeof(v79));
    }
    CGAffineTransformInvert(&v80, &v79);
    CGAffineTransform v78 = v80;
    v82.origin.double x = (double)(int)a9;
    v82.origin.double y = (double)(int)a10;
    v82.size.double width = (double)(int)a11;
    v82.size.double height = (double)(int)a12;
    CGRect v83 = CGRectApplyAffineTransform(v82, &v78);
    double x = v83.origin.x;
    double y = v83.origin.y;
    double width = v83.size.width;
    double height = v83.size.height;
    id v77 = 0;
    BOOL v32 = +[VNValidationUtilities getOptionalObject:&v77 ofClass:objc_opt_class() forKey:@"VNImageBufferOption_FeatureOrientationRelativeToUpRight" inOptions:v25 error:a14];
    id v33 = v77;
    if (v32)
    {
      id v70 = v33;
      if (v33) {
        uint64_t v34 = [v33 integerValue];
      }
      else {
        uint64_t v34 = 1;
      }
      int v76 = -1;
      if (VNCalculateFeatureCropOrientationFromSuperpositionOfFeatureWithImageOrientations(v26, v34, &v76, a13, a14))
      {
        id v35 = a1[7];
        uint64_t v36 = [a1 session];
        id v69 = [v36 vnciContextManager];

        if (v35)
        {
          float v68 = 0;
        }
        else
        {
          uint64_t v37 = -[VNCIContextManager waitAndGetAvailableContextFromOptions:error:](v69, v25, a14);
          float v68 = (void *)v37;
          if (v37) {
            uint64_t v38 = *(void **)(v37 + 8);
          }
          else {
            uint64_t v38 = 0;
          }
          id v35 = v38;
        }
        id v39 = v24;
        if (a7)
        {
          id v67 = v35;
          uint64_t v40 = [MEMORY[0x1E4F1E050] clearImage];
          uint64_t v41 = [v39 imageByCompositingOverImage:v40];

          uint64_t v42 = objc_msgSend(v41, "imageByCroppingToRect:", x, y, width, height);

          id v39 = (id)v42;
          id v35 = v67;
        }
        if (v76 <= 4) {
          unint64_t v43 = a4;
        }
        else {
          unint64_t v43 = a5;
        }
        if (v76 <= 4) {
          unint64_t v44 = a5;
        }
        else {
          unint64_t v44 = a4;
        }
        double v45 = (double)v44;
        double v46 = (double)v43;
        if (width != (double)v43 || height != v45)
        {
          double v47 = v46 / width;
          double v48 = v45 / height;
          if (a7)
          {
            double v49 = *MEMORY[0x1E4F1DAD8];
            double v50 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          }
          else
          {
            double v49 = round(x * v47);
            double v50 = round(y * v48);
          }
          if (v49 > 0.0) {
            double v47 = v49 / x;
          }
          memset(&v75.c, 0, 32);
          if (v50 > 0.0) {
            double v48 = v50 / y;
          }
          *(_OWORD *)&v75.a = 0uLL;
          CGAffineTransformMakeScale(&v75, v47, v48);
          CGAffineTransform v74 = v75;
          uint64_t v51 = [v39 imageByApplyingTransform:&v74 highQualityDownsample:1];

          [v51 extent];
          double v53 = v52;
          [v51 extent];
          CGAffineTransformMakeTranslation(&v73, -v53, -v54);
          double v55 = [v51 imageByApplyingTransform:&v73 highQualityDownsample:1];

          objc_msgSend(v55, "imageByCroppingToRect:", v49, v50, v46, v45);
          id v39 = (id)objc_claimAutoreleasedReturnValue();
        }
        [v39 extent];
        double v57 = v56;
        [v39 extent];
        CGAffineTransformMakeTranslation(&v72, -v57, -v58);
        double v59 = [v39 imageByApplyingTransform:&v72 highQualityDownsample:1];

        double v60 = [v59 imageByApplyingOrientation:v76];

        if (v60)
        {
          id v61 = v68;
          OSType v62 = VNColorspaceForFormat(a6, 0);
          CVPixelBufferRef v63 = *a3;
          size_t v64 = CVPixelBufferGetWidth(*a3);
          objc_msgSend(v35, "render:toCVPixelBuffer:bounds:colorSpace:", v60, v63, v62, 0.0, 0.0, (double)v64, (double)CVPixelBufferGetHeight(*a3));
          CGColorSpaceRelease(v62);
          int v65 = 0;
        }
        else
        {
          if (a14)
          {
            *a14 = +[VNError errorWithCode:3 message:@"Extracting ROI from an image failed"];
          }
          unsigned __int8 v81 = 0;
          int v65 = 1;
          id v61 = v68;
        }

        -[VNCIContextManager releaseContext:]((uint64_t)v69, v61);
        if (!v65) {
          unsigned __int8 v81 = 1;
        }

        uint64_t v27 = v81;
      }
      else
      {
        uint64_t v27 = 0;
      }
      id v33 = v70;
    }
    else
    {
      uint64_t v27 = 0;
    }
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

- (uint64_t)_cropImageSourceManager:(CVPixelBufferRef *)a3 outBuffer:(unint64_t)a4 width:(unint64_t)a5 height:(int)a6 format:(int)a7 cropRect:(void *)a8 performCrop:(double)a9 options:(double)a10 rotate90CCW:(double)a11 error:(double)a12
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  float v111 = a2;
  id v25 = a8;
  if (!a1
    || !+[VNValidationUtilities validateNonNilOptionsDictionary:v25 selector:sel__cropImageSourceManager_outBuffer_width_height_format_cropRect_performCrop_options_rotate90CCW_error_ error:a14])
  {
    goto LABEL_9;
  }
  if (a3)
  {
    int v109 = [(id)a1 orientation];
    id v125 = 0;
    BOOL v26 = +[VNValidationUtilities getOptionalObject:&v125 ofClass:objc_opt_class() forKey:@"VNImageBufferOption_FeatureOrientationRelativeToUpRight" inOptions:v25 error:a14];
    id v27 = v125;
    v110 = v27;
    if (!v26
      || (!v27 ? (uint64_t v28 = 1) : (uint64_t v28 = [v27 integerValue]),
          int v124 = -1,
          (VNCalculateFeatureCropOrientationFromSuperpositionOfFeatureWithImageOrientations(v109, v28, &v124, a13, a14) & 1) == 0))
    {
      LOBYTE(v29) = 0;
LABEL_75:

      goto LABEL_76;
    }
    +[VNError VNAssert:1 log:@"Internal error: needToUpscale cannot be NULL"];
    if ((int)v28 <= 4) {
      unint64_t v30 = a4;
    }
    else {
      unint64_t v30 = a5;
    }
    double v31 = (double)v30;
    if ((int)v28 <= 4) {
      unint64_t v32 = a5;
    }
    else {
      unint64_t v32 = a4;
    }
    if (a13) {
      double v33 = a12;
    }
    else {
      double v33 = a11;
    }
    if (a13) {
      double v34 = a11;
    }
    else {
      double v34 = a12;
    }
    double v35 = v31 / v33;
    if (v35 >= (double)v32 / v34) {
      double v36 = v35;
    }
    else {
      double v36 = (double)v32 / v34;
    }
    int v105 = a6;
    unint64_t v103 = a4;
    unint64_t v104 = a5;
    if (v36 <= 0.125)
    {
      int v37 = 8;
    }
    else if (v36 <= 0.25)
    {
      int v37 = 4;
    }
    else if (v36 <= 0.5)
    {
      int v37 = 2;
    }
    else
    {
      int v37 = 1;
    }
    unsigned int options = v37;
    CGImageRef v29 = (CGImageRef)v25;
    uint64_t v38 = [(CGImage *)v29 objectForKeyedSubscript:@"VNImageBufferOption_DownscaleCGInterpolationQuality"];
    id v39 = v38;
    if (v38) {
      int v40 = [v38 intValue];
    }
    else {
      int v40 = 4;
    }
    uint64_t v41 = [(CGImage *)v29 objectForKeyedSubscript:@"VNImageBufferOption_UpscaleCGInterpolationQuality"];

    if (v41) {
      int v42 = [v41 intValue];
    }
    else {
      int v42 = 4;
    }

    if (v36 > 1.0) {
      CGInterpolationQuality v43 = v42;
    }
    else {
      CGInterpolationQuality v43 = v40;
    }
    qualitdouble y = v43;

    unint64_t v44 = [(CGImage *)v29 objectForKeyedSubscript:@"VNDetectorOption_PreferBackgroundProcessing"];
    CGFloat v108 = v44;
    if (v44) {
      int v45 = [v44 BOOLValue];
    }
    else {
      int v45 = 0;
    }
    double v46 = [(CGImage *)v29 objectForKeyedSubscript:@"VNImageBufferOption_RequiresDepth"];
    int v47 = [v46 BOOLValue];

    if (!v47 || (a7 & 1) != 0 || *(void *)(a1 + 96))
    {
      if ((v47 & a7) == 1)
      {
        if (a14)
        {
          +[VNError errorWithCode:3 message:@"Unable to load depth when crop is required"];
          LOBYTE(v29) = 0;
          *a14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_74:

          goto LABEL_75;
        }
        goto LABEL_73;
      }
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
      if (v111)
      {
        uint64_t v48 = [v111 _cgImageSourceAtAddress:v111 + 32 forSubSampleFactor:1 protectedWithUnfairLock:v111 + 12 operatingInLowPriority:0 error:0];
        if (v48)
        {
          uint64_t v49 = +[VNDepthRepresentation depthRepresentationForImageSource:orientation:](VNDepthRepresentation, "depthRepresentationForImageSource:orientation:", v48, [v111 exifOrientation]);
          double v50 = *(void **)(a1 + 96);
          *(void *)(a1 + 96) = v49;
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    }
    if (v105 > 1111970368)
    {
      if (v105 != 1111970369 && v105 != 1278226488)
      {
        int v51 = 1380401729;
LABEL_64:
        if (v105 != v51)
        {
          double v60 = -[VNImageSourceManager ciImageWithSubSampleFactor:useLowPriority:error:]((id *)v111, options, v45, a14);
          if (v60) {
            LOBYTE(v29) = -[VNImageBuffer _cropCIImage:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((id *)a1, v60, a3, v103, v104, v105, a7, v29, (double)(int)(a9 * (1.0 / (double)options)), (double)(int)(a10 * (1.0 / (double)options)), (double)(int)(a11 * (1.0 / (double)options)), (double)(int)(a12 * (1.0 / (double)options)), a13, a14);
          }
          else {
            LOBYTE(v29) = 0;
          }

          goto LABEL_74;
        }
      }
    }
    else if (v105 != 32 && v105 != 40)
    {
      int v51 = 1094862674;
      goto LABEL_64;
    }
    if (!v111) {
      goto LABEL_73;
    }
    uint64_t v52 = options - 1;
    if (((0x8Bu >> v52) & 1) == 0)
    {
      if (a14)
      {
        double v53 = [NSNumber numberWithUnsignedInt:options];
        *a14 = +[VNError errorForInvalidArgument:v53 named:@"subSampleFactor"];
      }
      goto LABEL_73;
    }
    double v54 = (CGImageSource *)[v111 _cgImageSourceAtAddress:&v111[qword_1A4125650[v52]] forSubSampleFactor:dword_1A41256D0[v52] protectedWithUnfairLock:&v111[qword_1A4125690[v52]] operatingInLowPriority:0 error:a14];
    if (!v54)
    {
LABEL_73:
      LOBYTE(v29) = 0;
      goto LABEL_74;
    }
    double v55 = (void *)*MEMORY[0x1E4F2FF08];
    *(void *)&v128.a = MEMORY[0x1E4F1CC28];
    double v56 = (void *)*MEMORY[0x1E4F2FF58];
    *(void *)&v127.a = v55;
    *(void *)&v127.b = v56;
    double v57 = [NSNumber numberWithUnsignedInt:options];
    *(void *)&v128.b = v57;
    CFDictionaryRef optionsa = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:2];

    ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(v54, 0, optionsa);
    CGImageRef v29 = ImageAtIndex;
    if (a14 && !ImageAtIndex)
    {
      *a14 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot obtain a CGImageRef from the image source"];

      goto LABEL_73;
    }

    if (!v29) {
      goto LABEL_74;
    }
    image = v29;
    size_t Width = CGImageGetWidth(v29);
    size_t Height = CGImageGetHeight(v29);
    if (v109 < 5) {
      unint64_t v63 = [(id)a1 width];
    }
    else {
      unint64_t v63 = [(id)a1 height];
    }
    double v64 = (double)Width;
    double v65 = 1.0 / round((double)v63 / (double)Width);
    CFIndex v66 = (_OWORD *)MEMORY[0x1E4F1DAB8];
    long long v67 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v128.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v128.c = v67;
    *(_OWORD *)&v128.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v127.a = *(_OWORD *)&v128.a;
    *(_OWORD *)&v127.c = v67;
    *(_OWORD *)&v127.tdouble x = *(_OWORD *)&v128.tx;
    if (a7)
    {
      double v68 = a11 * v65;
      double v69 = (double)(int)(a9 * v65);
      double v70 = (double)(int)(a10 * v65);
      double v71 = (double)(int)v68;
      double v72 = (double)(int)(a12 * v65);
      memset(&v123, 0, sizeof(v123));
      switch(v109)
      {
        case 2:
          v122.a = -1.0;
          v122.b = 0.0;
          v122.c = 0.0;
          v122.d = 1.0;
          v122.tdouble x = (double)Width;
          goto LABEL_101;
        case 3:
          v122.a = -1.0;
          v122.b = 0.0;
          v122.c = 0.0;
          v122.d = -1.0;
          v122.tdouble x = (double)Width;
          goto LABEL_97;
        case 4:
          v122.c = 0.0;
          v122.a = 1.0;
          v122.b = 0.0;
          *(_OWORD *)&v122.d = xmmword_1A410C170;
LABEL_97:
          v122.tdouble y = (double)Height;
          goto LABEL_102;
        case 5:
          *(_OWORD *)&v122.a = xmmword_1A410C160;
          *(_OWORD *)&v122.c = xmmword_1A410C170;
          v122.tdouble x = (double)Height;
          goto LABEL_94;
        case 6:
          *(_OWORD *)&v122.a = xmmword_1A410C160;
          v122.tdouble x = 0.0;
          v122.c = 1.0;
          v122.d = 0.0;
LABEL_94:
          v122.tdouble y = (double)Width;
          goto LABEL_102;
        case 7:
          *(_OWORD *)&v122.a = xmmword_1A410C150;
          v122.c = 1.0;
          v122.d = 0.0;
          goto LABEL_99;
        case 8:
          *(_OWORD *)&v122.a = xmmword_1A410C150;
          *(_OWORD *)&v122.c = xmmword_1A410C170;
          v122.tdouble x = (double)Height;
LABEL_101:
          v122.tdouble y = 0.0;
          goto LABEL_102;
        default:
          v122.a = 1.0;
          v122.b = 0.0;
          v122.c = 0.0;
          v122.d = 1.0;
LABEL_99:
          v122.tdouble y = 0.0;
          v122.tdouble x = 0.0;
LABEL_102:
          CGAffineTransformInvert(&v123, &v122);
          CGAffineTransform v121 = v123;
          v132.origin.double x = v69;
          v132.origin.double y = v70;
          v132.size.double width = v71;
          v132.size.double height = v72;
          CGRect v133 = CGRectApplyAffineTransform(v132, &v121);
          double x = v133.origin.x;
          double y = v133.origin.y;
          double v83 = v133.size.width;
          double v84 = v133.size.height;
          v133.origin.double y = (double)Height - v133.origin.y - v133.size.height;
          CGImageRef v85 = CGImageCreateWithImageInRect(image, v133);
          if (v85)
          {
            -[VNImageBuffer _calculateTranslationTransformForOrientedCropWithOrientation:unorientedSubsampledFullImageRect:unorientedSubsampledOriginalCrop:](&v127, v124, 0.0, 0.0, v64, (double)Height, x, y, v83, v84);
            CGImageRelease(image);
            if (v124 <= 4) {
              double v86 = v83;
            }
            else {
              double v86 = v84;
            }
            if (v124 <= 4) {
              double v87 = v84;
            }
            else {
              double v87 = v83;
            }
            CGAffineTransformMakeScale(&v128, (double)v103 / v86, (double)v104 / v87);
            image = v85;
            goto LABEL_110;
          }
          if (!a14) {
            goto LABEL_118;
          }
          id v99 = +[VNError errorWithCode:3 message:@"Unable to crop a region of interest from a source buffer"];
          break;
      }
    }
    else
    {
      [(id)a1 fullImageBufferRect];
      double v76 = v75 * v65;
      double v78 = v77 * v65;
      if (a13)
      {
        CGFloat v79 = v74 * v65;
        CGFloat v80 = v73 * v65;
        CGAffineTransformMakeRotation(&v120, 1.57079633);
        v130.origin.double x = v80;
        v130.origin.double y = v79;
        v130.size.double width = v76;
        v130.size.double height = v78;
        CGRect v131 = CGRectApplyAffineTransform(v130, &v120);
        double v76 = v131.size.width;
        double v78 = v131.size.height;
      }
      CGAffineTransformMakeScale(&v123, (double)v103 / v76, (double)v104 / v78);
      CGAffineTransform v128 = v123;
LABEL_110:
      v88 = *a3;
      LODWORD(v123.a) = 0;
      CVPixelBufferLockBaseAddress(v88, 0);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v88);
      BaseAddress = CVPixelBufferGetBaseAddress(v88);
      int v91 = VNColorspaceForFormat(v105, (int *)&v123);
      v92 = CGBitmapContextCreate(BaseAddress, v103, v104, 8uLL, BytesPerRow, v91, LODWORD(v123.a));
      CVPixelBufferUnlockBaseAddress(v88, 0);
      CGColorSpaceRelease(v91);
      if (v92)
      {
        CGContextSetInterpolationQuality(v92, quality);
        CGContextSetShouldAntialias(v92, 0);
        CGContextSetBlendMode(v92, kCGBlendModeCopy);
        size_t v93 = CGImageGetWidth(image);
        size_t v94 = CGImageGetHeight(image);
        long long v95 = v66[1];
        *(_OWORD *)&v123.a = *v66;
        *(_OWORD *)&v123.c = v95;
        *(_OWORD *)&v123.tdouble x = v66[2];
        *(_OWORD *)&t1.a = *(_OWORD *)&v123.a;
        *(_OWORD *)&t1.c = v95;
        *(_OWORD *)&t1.tdouble x = *(_OWORD *)&v123.tx;
        double v96 = (double)v93;
        double v97 = (double)v94;
        OSType v98 = image;
        switch(v124)
        {
          case 2:
            t2.a = -1.0;
            t2.b = 0.0;
            t2.c = 0.0;
            t2.d = 1.0;
            t2.tdouble x = v96;
            goto LABEL_126;
          case 3:
            t2.a = -1.0;
            t2.b = 0.0;
            t2.c = 0.0;
            t2.d = -1.0;
            t2.tdouble x = v96;
            t2.tdouble y = (double)v94;
            break;
          case 4:
            t2.b = 0.0;
            t2.c = 0.0;
            t2.a = 1.0;
            *(_OWORD *)&t2.d = xmmword_1A410C170;
            t2.tdouble y = (double)v94;
            break;
          case 5:
            *(_OWORD *)&t2.a = xmmword_1A410C160;
            *(_OWORD *)&t2.c = xmmword_1A410C170;
            t2.tdouble x = (double)v94;
            t2.tdouble y = v96;
            break;
          case 6:
            *(_OWORD *)&t2.a = xmmword_1A410C160;
            t2.d = 0.0;
            t2.tdouble x = 0.0;
            t2.c = 1.0;
            t2.tdouble y = v96;
            break;
          case 7:
            *(_OWORD *)&t2.a = xmmword_1A410C150;
            t2.c = 1.0;
            memset(&t2.d, 0, 24);
            break;
          case 8:
            *(_OWORD *)&t2.a = xmmword_1A410C150;
            *(_OWORD *)&t2.c = xmmword_1A410C170;
            t2.tdouble x = (double)v94;
LABEL_126:
            t2.tdouble y = 0.0;
            break;
          default:
            t2.a = 1.0;
            t2.b = 0.0;
            t2.c = 0.0;
            t2.d = 1.0;
            t2.tdouble x = 0.0;
            t2.tdouble y = 0.0;
            OSType v98 = image;
            break;
        }
        CGAffineTransformConcat(&v123, &t1, &t2);
        CGAffineTransform v116 = v123;
        CGAffineTransform v115 = v127;
        CGAffineTransformConcat(&v117, &v116, &v115);
        CGAffineTransform v123 = v117;
        CGAffineTransform v114 = v117;
        CGAffineTransform v113 = v128;
        CGAffineTransformConcat(&v117, &v114, &v113);
        CGAffineTransform v123 = v117;
        transforuint64_t m = v117;
        CGContextConcatCTM(v92, &transform);
        v134.origin.double x = 0.0;
        v134.origin.double y = 0.0;
        v134.size.double width = v96;
        v134.size.double height = v97;
        CGContextDrawImage(v92, v134, v98);
        CGContextRelease(v92);
        int v100 = 0;
        goto LABEL_128;
      }
      if (!a14)
      {
LABEL_118:
        char v126 = 0;
        int v100 = 1;
LABEL_128:
        CGImageRelease(image);
        LODWORD(v29) = ((v100 == 0) | v126);
        goto LABEL_74;
      }
      id v99 = +[VNError errorWithCode:3 message:@"Unable to create CGImage for scaling"];
    }
    *a14 = v99;
    goto LABEL_118;
  }
  if (a14)
  {
    +[VNError errorWithCode:3 message:@"Missing target buffer for crop operations"];
    LOBYTE(v29) = 0;
    *a14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    LOBYTE(v29) = 0;
  }
LABEL_76:

  return v29 & 1;
}

- (CGAffineTransform)_calculateTranslationTransformForOrientedCropWithOrientation:(double)a3 unorientedSubsampledFullImageRect:(double)a4 unorientedSubsampledOriginalCrop:(double)a5
{
  if (a7 >= 0.0) {
    double v10 = 0.0;
  }
  else {
    double v10 = -a7;
  }
  if (a8 >= 0.0) {
    double v11 = 0.0;
  }
  else {
    double v11 = -a8;
  }
  double v12 = a5 - a9;
  if (a2 > 4) {
    double v12 = a6;
  }
  double v13 = -v12;
  double v14 = a6 - a10;
  if (a2 <= 4) {
    a5 = v14;
  }
  if (v12 >= 0.0) {
    double v13 = 0.0;
  }
  if (a5 >= 0.0) {
    double v15 = 0.0;
  }
  else {
    double v15 = -a5;
  }
  uint64_t v16 = MEMORY[0x1E4F1DAB8];
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v17;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v16 + 32);
  switch(a2)
  {
    case 1:
      BOOL v18 = retstr;
      CGFloat v19 = v10;
      goto LABEL_22;
    case 2:
      BOOL v18 = retstr;
      CGFloat v19 = v13;
LABEL_22:
      double v10 = v11;
      goto LABEL_18;
    case 3:
      BOOL v18 = retstr;
      CGFloat v19 = v13;
      goto LABEL_25;
    case 4:
      BOOL v18 = retstr;
      CGFloat v19 = v10;
LABEL_25:
      double v10 = v15;
      goto LABEL_18;
    case 5:
    case 8:
      BOOL v18 = retstr;
      CGFloat v19 = v15;
      goto LABEL_18;
    case 6:
      return CGAffineTransformMakeTranslation(retstr, v11, v13);
    case 7:
      BOOL v18 = retstr;
      CGFloat v19 = v11;
LABEL_18:
      retstr = CGAffineTransformMakeTranslation(v18, v19, v10);
      break;
    default:
      return retstr;
  }
  return retstr;
}

- (void)_isRectOutOfBounds:(CGFloat)a3
{
  if (result)
  {
    [result fullImageBufferRect];
    v11.origin.double x = a2;
    v11.origin.double y = a3;
    v11.size.double width = a4;
    v11.size.double height = a5;
    CGRect v10 = CGRectIntersection(v9, v11);
    v12.origin.double x = a2;
    v12.origin.double y = a3;
    v12.size.double width = a4;
    v12.size.double height = a5;
    return (void *)!CGRectContainsRect(v10, v12);
  }
  return result;
}

+ (uint64_t)_VNVTPixelTransferImageForSource:(CGFloat)a3 destinationBuffer:(CGFloat)a4 cropRect:(uint64_t)a5 performCrop:(__CVBuffer *)a6 vtSessionManager:(__CVBuffer *)a7 error:(int)a8
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  double v54 = a9;
  self;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a6);
  OSType v16 = CVPixelBufferGetPixelFormatType(a7);
  sourceBuffer = a6;
  if (!v54)
  {
    uint64_t v28 = 0;
LABEL_40:
    uint64_t v39 = 0;
    goto LABEL_41;
  }
  OSType v17 = v16;
  uint64_t v18 = v54[1];
  id v19 = &__block_literal_global_17072;
  id v20 = &__block_literal_global_42_17073;
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v18 + 8), 0xFFFFFFFFFFFFFFFFLL);
  os_unfair_lock_lock((os_unfair_lock_t)(v18 + 16));
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v21 = *(id *)(v18 + 24);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v22)
  {
    uint64_t v23 = 0;
    uint64_t v24 = *(void *)v56;
    do
    {
      uint64_t v25 = 0;
      uint64_t v26 = v23 + v22;
      do
      {
        if (*(void *)v56 != v24) {
          objc_enumerationMutation(v21);
        }
        id v27 = *(id *)(*((void *)&v55 + 1) + 8 * v25);
        uint64_t v28 = v27;
        if (v27)
        {
          if (v27[2] == PixelFormatType && v27[3] == v17)
          {

            [*(id *)(v18 + 24) removeObjectAtIndex:v23 + v25];
            goto LABEL_21;
          }
        }
        else if (!(PixelFormatType | v17))
        {
          goto LABEL_15;
        }

        ++v25;
      }
      while (v22 != v25);
      uint64_t v29 = [v21 countByEnumeratingWithState:&v55 objects:v59 count:16];
      uint64_t v22 = v29;
      uint64_t v23 = v26;
    }
    while (v29);
  }
LABEL_15:

  uint64_t v30 = [*(id *)(v18 + 24) count];
  uint64_t v31 = [*(id *)(v18 + 32) count];
  if (v30 && v31 + v30 == *(_DWORD *)v18) {
    [*(id *)(v18 + 24) removeLastObject];
  }
  uint64_t v32 = _block_invoke_2((uint64_t)&__block_literal_global_42_17073, a10);
  uint64_t v28 = (void *)v32;
  if (v32)
  {
    *(_DWORD *)(v32 + 8) = PixelFormatType;
    *(_DWORD *)(v32 + 12) = v17;
  }
LABEL_21:
  [*(id *)(v18 + 32) addObject:v28];
  os_unfair_lock_unlock((os_unfair_lock_t)(v18 + 16));

  if (!v28) {
    goto LABEL_40;
  }
  double v33 = (void *)v28[3];
  if (a8)
  {
    v61.origin.double x = a1;
    v61.origin.double y = a2;
    v61.size.double width = a3;
    v61.size.double height = a4;
    DictionaryRepresentatiouint64_t n = CGRectCreateDictionaryRepresentation(v61);
  }
  else
  {
    DictionaryRepresentatiouint64_t n = 0;
  }
  uint64_t v35 = VTSessionSetProperty(v33, (CFStringRef)*MEMORY[0x1E4F45170], DictionaryRepresentation);
  if (DictionaryRepresentation) {
    CFRelease(DictionaryRepresentation);
  }
  if (v35)
  {
    if (a10)
    {
      uint64_t v49 = v35;
      double v36 = (void *)[[NSString alloc] initWithFormat:@"Cannot set VTSession property, error: %d"];
      id v37 = +[VNError errorForInternalErrorWithLocalizedDescription:v36];
LABEL_33:
      *a10 = v37;
    }
  }
  else
  {
    uint64_t v38 = VTPixelTransferSessionTransferImage((VTPixelTransferSessionRef)v33, sourceBuffer, a7);
    if (!v38)
    {
      uint64_t v39 = 1;
      goto LABEL_35;
    }
    if (a10)
    {
      uint64_t v49 = v38;
      double v36 = (void *)[[NSString alloc] initWithFormat:@"Cannot transfer image using VTSession, error: %d"];
      id v37 = +[VNError errorForInternalErrorWithLocalizedDescription:v36];
      goto LABEL_33;
    }
  }
  uint64_t v39 = 0;
LABEL_35:
  int v40 = v28;
  uint64_t v41 = v54[1];
  uint64_t v28 = v40;
  os_unfair_lock_lock((os_unfair_lock_t)(v41 + 16));
  if (([*(id *)(v41 + 32) containsObject:v28] & 1) == 0) {
  [*(id *)(v41 + 24) addObject:v28];
  }
  [*(id *)(v41 + 32) removeObject:v28];
  os_unfair_lock_unlock((os_unfair_lock_t)(v41 + 16));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v41 + 8));

LABEL_41:
  return v39;
}

- (CVPixelBufferPoolRef)_createPotentiallyPooledIOSurfaceBackedPixelBufferWithWith:(size_t)a3 height:(uint64_t)a4 format:(void *)a5 options:(unsigned char *)a6 outPooled:(void *)a7 error:
{
  id v12 = a5;
  double v13 = v12;
  if (a1)
  {
    id v14 = v12;
    double v15 = [v14 valueForKey:@"VNImageBufferOption_CreateFromPixelBufferPool"];
    int v16 = [v15 BOOLValue];

    if (a6) {
      *a6 = v16;
    }
    if (v16)
    {
      double v76 = [(__CVPixelBufferPool *)a1 session];
      OSType v17 = [v76 vncvPixelBufferPoolManager];
      uint64_t v18 = v17;
      if (!v17)
      {
        a1 = 0;
        goto LABEL_118;
      }
      locfloat k = v17 + 2;
      os_unfair_lock_lock(v17 + 2);
      unint64_t v19 = a4 ^ __ROR8__(a3 ^ __ROR8__(a2, 51), 51);
      int8x8_t v20 = *(int8x8_t *)&v18[6]._os_unfair_lock_opaque;
      if (v20)
      {
        uint8x8_t v21 = (uint8x8_t)vcnt_s8(v20);
        v21.i16[0] = vaddlv_u8(v21);
        if (v21.u32[0] > 1uLL)
        {
          unint64_t v22 = v19;
          if (v19 >= *(void *)&v20) {
            unint64_t v22 = v19 % *(void *)&v20;
          }
        }
        else
        {
          unint64_t v22 = (*(void *)&v20 - 1) & v19;
        }
        uint64_t v23 = *(void ***)(*(void *)&v18[4]._os_unfair_lock_opaque + 8 * v22);
        if (v23)
        {
          for (float i = *v23; i; float i = *(void **)i)
          {
            unint64_t v25 = *((void *)i + 1);
            if (v25 == v19)
            {
              if (*((void *)i + 2) == a2 && *((void *)i + 3) == a3 && *((_DWORD *)i + 8) == a4) {
                goto LABEL_107;
              }
            }
            else
            {
              if (v21.u32[0] > 1uLL)
              {
                if (v25 >= *(void *)&v20) {
                  v25 %= *(void *)&v20;
                }
              }
              else
              {
                v25 &= *(void *)&v20 - 1;
              }
              if (v25 != v22) {
                break;
              }
            }
          }
        }
      }
      self;
      self;
      id v26 = objc_alloc(MEMORY[0x1E4F1CA60]);
      id v27 = [NSNumber numberWithUnsignedLong:a2];
      uint64_t v28 = [NSNumber numberWithUnsignedLong:a3];
      uint64_t v29 = [NSNumber numberWithUnsignedInt:a4];
      uint64_t v30 = objc_msgSend(v26, "initWithObjectsAndKeys:", v27, *MEMORY[0x1E4F24E10], v28, *MEMORY[0x1E4F24D08], v29, *MEMORY[0x1E4F24D70], 0);

      if (VNIOSurfaceBackedPixelBufferAttributes::onceToken != -1) {
        dispatch_once(&VNIOSurfaceBackedPixelBufferAttributes::onceToken, &__block_literal_global_30784);
      }
      [(id)v30 addEntriesFromDictionary:VNIOSurfaceBackedPixelBufferAttributes::pixelBufferAttributes];
      CVPixelBufferPoolRef poolOut = 0;
      uint64_t v31 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, (CFDictionaryRef)v30, &poolOut);
      if (v31)
      {

        if (a7)
        {
          +[VNError errorForCVReturnCode:v31 width:a2 height:a3 pixelFormat:a4 localizedDescription:@"Failed to create CVPixelBufferPool"];
          CVPixelBufferPoolRef v32 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          CVPixelBufferPoolRef v32 = 0;
        }
      }
      else
      {
        CVPixelBufferPoolRef v32 = poolOut;
      }
      unint64_t v33 = *(void *)&v18[6]._os_unfair_lock_opaque;
      if (v33)
      {
        uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)v33);
        v34.i16[0] = vaddlv_u8(v34);
        if (v34.u32[0] > 1uLL)
        {
          uint64_t v30 = v19;
          if (v19 >= v33) {
            uint64_t v30 = v19 % v33;
          }
        }
        else
        {
          uint64_t v30 = (v33 - 1) & v19;
        }
        uint64_t v35 = *(void ***)(*(void *)&v18[4]._os_unfair_lock_opaque + 8 * v30);
        if (v35)
        {
          for (float i = *v35; i; float i = *(void **)i)
          {
            unint64_t v36 = *((void *)i + 1);
            if (v36 == v19)
            {
              if (*((void *)i + 2) == a2 && *((void *)i + 3) == a3 && *((_DWORD *)i + 8) == a4) {
                goto LABEL_107;
              }
            }
            else
            {
              if (v34.u32[0] > 1uLL)
              {
                if (v36 >= v33) {
                  v36 %= v33;
                }
              }
              else
              {
                v36 &= v33 - 1;
              }
              if (v36 != v30) {
                break;
              }
            }
          }
        }
      }
      float i = operator new(0x30uLL);
      *(void *)float i = 0;
      *((void *)i + 1) = v19;
      *((void *)i + 2) = a2;
      *((void *)i + 3) = a3;
      *((_DWORD *)i + 8) = a4;
      *((void *)i + 5) = v32;
      float v37 = (float)(unint64_t)(*(void *)&v18[10]._os_unfair_lock_opaque + 1);
      float v38 = *(float *)&v18[12]._os_unfair_lock_opaque;
      if (v33 && (float)(v38 * (float)v33) >= v37)
      {
LABEL_97:
        uint64_t v55 = *(void *)&v18[4]._os_unfair_lock_opaque;
        long long v56 = *(void **)(v55 + 8 * v30);
        if (v56)
        {
          *(void *)float i = *v56;
        }
        else
        {
          *(void *)float i = *(void *)&v18[8]._os_unfair_lock_opaque;
          *(void *)&v18[8]._os_unfair_lock_opaque = i;
          *(void *)(v55 + 8 * v30) = v18 + 8;
          if (!*(void *)i)
          {
LABEL_106:
            ++*(void *)&v18[10]._os_unfair_lock_opaque;
LABEL_107:
            long long v58 = (__CVPixelBufferPool *)*((void *)i + 5);
            self;
            CVPixelBufferPoolRef poolOut = 0;
            uint64_t v65 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v58, &poolOut);
            if (v65) {
              BOOL v66 = 1;
            }
            else {
              BOOL v66 = poolOut == 0;
            }
            if (v66)
            {
              VNValidatedLog(4, @"VNCVPixelBufferHelper: Failed to create CVPixelBuffer from pool (%p): %d", v59, v60, v61, v62, v63, v64, (uint64_t)v58);
              if (a7)
              {
                long long v67 = CVPixelBufferPoolGetAttributes(v58);
                double v68 = [v67 objectForKeyedSubscript:*MEMORY[0x1E4F24E10]];
                uint64_t v69 = [v68 unsignedLongValue];
                double v70 = [v67 objectForKeyedSubscript:*MEMORY[0x1E4F24D08]];
                uint64_t v71 = [v70 unsignedLongValue];
                double v72 = [v67 objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
                +[VNError errorForCVReturnCode:width:height:pixelFormat:localizedDescription:](VNError, "errorForCVReturnCode:width:height:pixelFormat:localizedDescription:", v65, v69, v71, [v72 unsignedIntValue], @"Failed to create CVPixelBufferPool.");
                *a7 = (id)objc_claimAutoreleasedReturnValue();
              }
            }
            else
            {
              char v73 = +[VNCVPixelBufferHelper _validatePixelBuffer:error:]((uint64_t)VNCVPixelBufferHelper, poolOut, a7);
              a1 = poolOut;
              if (v73) {
                goto LABEL_117;
              }
              CVPixelBufferRelease(poolOut);
            }
            a1 = 0;
LABEL_117:
            os_unfair_lock_unlock(lock);
LABEL_118:

            goto LABEL_119;
          }
          unint64_t v57 = *(void *)(*(void *)i + 8);
          if ((v33 & (v33 - 1)) != 0)
          {
            if (v57 >= v33) {
              v57 %= v33;
            }
          }
          else
          {
            v57 &= v33 - 1;
          }
          long long v56 = (void *)(*(void *)&v18[4]._os_unfair_lock_opaque + 8 * v57);
        }
        *long long v56 = i;
        goto LABEL_106;
      }
      BOOL v39 = 1;
      if (v33 >= 3) {
        BOOL v39 = (v33 & (v33 - 1)) != 0;
      }
      unint64_t v40 = v39 | (2 * v33);
      unint64_t v41 = vcvtps_u32_f32(v37 / v38);
      if (v40 <= v41) {
        int8x8_t prime = (int8x8_t)v41;
      }
      else {
        int8x8_t prime = (int8x8_t)v40;
      }
      if (*(void *)&prime == 1)
      {
        int8x8_t prime = (int8x8_t)2;
      }
      else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
      {
        int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      }
      unint64_t v33 = *(void *)&v18[6]._os_unfair_lock_opaque;
      if (*(void *)&prime > v33) {
        goto LABEL_63;
      }
      if (*(void *)&prime < v33)
      {
        unint64_t v49 = vcvtps_u32_f32((float)*(unint64_t *)&v18[10]._os_unfair_lock_opaque / *(float *)&v18[12]._os_unfair_lock_opaque);
        if (v33 < 3 || (uint8x8_t v50 = (uint8x8_t)vcnt_s8((int8x8_t)v33), v50.i16[0] = vaddlv_u8(v50), v50.u32[0] > 1uLL))
        {
          unint64_t v49 = std::__next_prime(v49);
        }
        else
        {
          uint64_t v51 = 1 << -(char)__clz(v49 - 1);
          if (v49 >= 2) {
            unint64_t v49 = v51;
          }
        }
        if (*(void *)&prime <= v49) {
          int8x8_t prime = (int8x8_t)v49;
        }
        if (*(void *)&prime >= v33)
        {
          unint64_t v33 = *(void *)&v18[6]._os_unfair_lock_opaque;
        }
        else
        {
          if (prime)
          {
LABEL_63:
            if (*(void *)&prime >> 61) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            uint64_t v43 = operator new(8 * *(void *)&prime);
            uint64_t v44 = *(void **)&v18[4]._os_unfair_lock_opaque;
            *(void *)&v18[4]._os_unfair_lock_opaque = v43;
            if (v44) {
              operator delete(v44);
            }
            uint64_t v45 = 0;
            *(int8x8_t *)&v18[6]._os_unfair_lock_opaque = prime;
            do
              *(void *)(*(void *)&v18[4]._os_unfair_lock_opaque + 8 * v45++) = 0;
            while (*(void *)&prime != v45);
            uint64_t v46 = *(void **)&v18[8]._os_unfair_lock_opaque;
            if (v46)
            {
              unint64_t v47 = v46[1];
              uint8x8_t v48 = (uint8x8_t)vcnt_s8(prime);
              v48.i16[0] = vaddlv_u8(v48);
              if (v48.u32[0] > 1uLL)
              {
                if (v47 >= *(void *)&prime) {
                  v47 %= *(void *)&prime;
                }
              }
              else
              {
                v47 &= *(void *)&prime - 1;
              }
              *(void *)(*(void *)&v18[4]._os_unfair_lock_opaque + 8 * v47) = v18 + 8;
              uint64_t v52 = (void *)*v46;
              if (*v46)
              {
                do
                {
                  unint64_t v53 = v52[1];
                  if (v48.u32[0] > 1uLL)
                  {
                    if (v53 >= *(void *)&prime) {
                      v53 %= *(void *)&prime;
                    }
                  }
                  else
                  {
                    v53 &= *(void *)&prime - 1;
                  }
                  if (v53 != v47)
                  {
                    uint64_t v54 = *(void *)&v18[4]._os_unfair_lock_opaque;
                    if (!*(void *)(v54 + 8 * v53))
                    {
                      *(void *)(v54 + 8 * v53) = v46;
                      goto LABEL_88;
                    }
                    void *v46 = *v52;
                    void *v52 = **(void **)(*(void *)&v18[4]._os_unfair_lock_opaque + 8 * v53);
                    **(void **)(*(void *)&v18[4]._os_unfair_lock_opaque + 8 * v53) = v52;
                    uint64_t v52 = v46;
                  }
                  unint64_t v53 = v47;
LABEL_88:
                  uint64_t v46 = v52;
                  uint64_t v52 = (void *)*v52;
                  unint64_t v47 = v53;
                }
                while (v52);
              }
            }
            unint64_t v33 = (unint64_t)prime;
            goto LABEL_92;
          }
          double v75 = *(void **)&v18[4]._os_unfair_lock_opaque;
          *(void *)&v18[4]._os_unfair_lock_opaque = 0;
          if (v75) {
            operator delete(v75);
          }
          unint64_t v33 = 0;
          *(void *)&v18[6]._os_unfair_lock_opaque = 0;
        }
      }
LABEL_92:
      if ((v33 & (v33 - 1)) != 0)
      {
        if (v19 >= v33) {
          uint64_t v30 = v19 % v33;
        }
        else {
          uint64_t v30 = v19;
        }
      }
      else
      {
        uint64_t v30 = (v33 - 1) & v19;
      }
      goto LABEL_97;
    }
    a1 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a2, a3, a4, a7);
  }
LABEL_119:

  return a1;
}

BOOL __113__VNImageBuffer__cropCVPixelBuffer_outBuffer_width_height_format_cropRect_performCrop_options_rotate90CCW_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(unsigned char *)(a1 + 124))
  {
    CGRect v26 = CGRectIntegral(*(CGRect *)(a1 + 40));
    v23.double x = v26.origin.x;
    v23.double y = v26.origin.y;
    CGFloat width = v26.size.width;
    CGFloat height = v26.size.height;
    VNAlignRectToSubsampledCVPixelBufferConstraint((float64x2_t *)&v23, *(CVPixelBufferRef *)(a1 + 72));
    memset(&v22, 0, sizeof(v22));
    CGFloat v5 = *(double *)(a1 + 80);
    CGFloat v6 = *(double *)(a1 + 88);
    switch(*(_DWORD *)(a1 + 104))
    {
      case 2:
        v21.a = -1.0;
        v21.b = 0.0;
        v21.c = 0.0;
        v21.d = 1.0;
        v21.tdouble x = v5;
        goto LABEL_15;
      case 3:
        v21.a = -1.0;
        v21.b = 0.0;
        v21.c = 0.0;
        v21.d = -1.0;
        v21.tdouble x = v5;
        v21.tdouble y = v6;
        goto LABEL_16;
      case 4:
        v21.b = 0.0;
        v21.c = 0.0;
        v21.a = 1.0;
        *(_OWORD *)&v21.d = xmmword_1A410C170;
        v21.tdouble y = v6;
        goto LABEL_16;
      case 5:
        *(_OWORD *)&v21.a = xmmword_1A410C160;
        *(_OWORD *)&v21.c = xmmword_1A410C170;
        v21.tdouble x = v6;
        v21.tdouble y = v5;
        goto LABEL_16;
      case 6:
        *(_OWORD *)&v21.a = xmmword_1A410C160;
        v21.d = 0.0;
        v21.tdouble x = 0.0;
        v21.c = 1.0;
        v21.tdouble y = v5;
        goto LABEL_16;
      case 7:
        *(_OWORD *)&v21.a = xmmword_1A410C150;
        v21.c = 1.0;
        v21.d = 0.0;
        goto LABEL_13;
      case 8:
        *(_OWORD *)&v21.a = xmmword_1A410C150;
        *(_OWORD *)&v21.c = xmmword_1A410C170;
        v21.tdouble x = v6;
LABEL_15:
        v21.tdouble y = 0.0;
        goto LABEL_16;
      default:
        v21.a = 1.0;
        v21.b = 0.0;
        v21.c = 0.0;
        v21.d = 1.0;
LABEL_13:
        v21.tdouble x = 0.0;
        v21.tdouble y = 0.0;
LABEL_16:
        CGAffineTransformInvert(&v22, &v21);
        v27.origiuint64_t n = v23;
        v27.size.CGFloat width = width;
        v27.size.CGFloat height = height;
        CGAffineTransform v20 = v22;
        CGRect v28 = CGRectApplyAffineTransform(v27, &v20);
        v29.origin.double x = 0.0;
        v29.origin.double y = 0.0;
        v29.size.CGFloat width = v5;
        v29.size.CGFloat height = v6;
        CGRectIntersection(v28, v29);
        CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 96));
        CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 96));
        uint64_t v9 = VTPixelRotationSessionRotateSubImage();
        break;
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      id v8 = *(OpaqueVTPixelRotationSession **)(v7 + 32);
    }
    else {
      id v8 = 0;
    }
    uint64_t v9 = VTPixelRotationSessionRotateImage(v8, *(CVPixelBufferRef *)(a1 + 96), *(CVPixelBufferRef *)(a1 + 72));
  }
  uint64_t v10 = v9;
  if (a3 && v9)
  {
    id v11 = [NSString alloc];
    CFIndex v12 = CFGetRetainCount(*(CFTypeRef *)(a1 + 96));
    uint64_t v13 = *(unsigned int *)(a1 + 108);
    CFIndex v14 = CFGetRetainCount(*(CFTypeRef *)(a1 + 72));
    uint64_t v15 = *(unsigned int *)(a1 + 112);
    uint64_t v16 = *(unsigned int *)(a1 + 116);
    OSType v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 124)];
    uint64_t v18 = (void *)[v11 initWithFormat:@"VNImageBuffer - Failed to transfer inputBufferForRotation (retain count = %ld, type = %u) to vtSessionDestBuffer (retain count = %ld, type = %u). Orientation %d. Crop %@. Rotation %d. Error %d", v12, v13, v14, v15, v16, v17, *(unsigned int *)(a1 + 120), v10];

    *a3 = +[VNError errorWithCode:3 message:v18];
  }
  return v10 == 0;
}

BOOL __113__VNImageBuffer__cropCVPixelBuffer_outBuffer_width_height_format_cropRect_performCrop_options_rotate90CCW_error___block_invoke_2(uint64_t a1, CVPixelBufferRef pixelBuffer, void *a3)
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  size_t v7 = *(void *)(a1 + 32);
  size_t v8 = *(void *)(a1 + 40);
  OSType v9 = *(_DWORD *)(a1 + 56);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  if (VNIOSurfaceBackedPixelBufferAttributes::onceToken != -1) {
    dispatch_once(&VNIOSurfaceBackedPixelBufferAttributes::onceToken, &__block_literal_global_30784);
  }
  uint64_t v12 = CVPixelBufferCreateWithBytes(v6, v7, v8, v9, BaseAddressOfPlane, BytesPerRowOfPlane, (CVPixelBufferReleaseBytesCallback)CVPixelBufferReleaseReferencingPixelBufferCallback, pixelBuffer, (CFDictionaryRef)VNIOSurfaceBackedPixelBufferAttributes::pixelBufferAttributes, *(CVPixelBufferRef **)(a1 + 48));
  int v13 = v12;
  if (a3 && v12)
  {
    *a3 = +[VNError errorForCVReturnCode:v12 localizedDescription:@"unable to create the Y plane wrapper buffer"];
  }
  return v13 == 0;
}

- (id)augmentedBuffersWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 options:(id)a6 augmentationOptions:(id)a7 error:(id *)a8
{
  size_t v8 = -[VNImageBuffer augmentedCroppedBuffersWithWidth:height:format:cropRect:options:augmentationOptions:error:](self, "augmentedCroppedBuffersWithWidth:height:format:cropRect:options:augmentationOptions:error:", a3, a4, *(void *)&a5, a6, a7, a8, *MEMORY[0x1E4F1DB10], *(double *)(MEMORY[0x1E4F1DB10] + 8), *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));

  return v8;
}

- (id)debugQuickLookObject
{
  if (self->_origPixelBuffer)
  {
    objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:");
    v2 = (CIImage *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = v2;
    goto LABEL_6;
  }
  origCIImage = self->_origCIImage;
  if (origCIImage)
  {
    v2 = origCIImage;
    goto LABEL_5;
  }
  imageSourceManager = self->_imageSourceManager;
  if (!imageSourceManager)
  {
    v2 = [(VNImageBuffer *)self debugDescription];
    goto LABEL_5;
  }
  ImageAtIndedouble x = CGImageSourceCreateImageAtIndex([(VNImageSourceManager *)self->_imageSourceManager _cgImageSourceAtAddress:&imageSourceManager->_imageSourceSubsample1 forSubSampleFactor:1 protectedWithUnfairLock:&imageSourceManager->_loadSubSample1Lock operatingInLowPriority:0 error:0], 0, 0);
  v4 = VNDebugImageFromCGImage((uint64_t)ImageAtIndex);
  CGImageRelease(ImageAtIndex);
LABEL_6:

  return v4;
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  CGFloat v5 = NSStringFromClass(v4);
  CFAllocatorRef v6 = (void *)[v3 initWithFormat:@"%@;opt=%@", v5, self->_options];

  return v6;
}

- (BOOL)wantsSequencedRequestObservationsRecording
{
  return 1;
}

- (void)purgeCachedRepresentations
{
}

- (__CVBuffer)createCroppedBufferWithMaxSideLengthOf:(unint64_t)a3 cropRect:(CGRect)a4 pixelFormat:(unsigned int)a5 options:(id)a6 error:(id *)a7 pixelBufferRepsCacheKey:(id *)a8
{
  uint64_t v10 = *(void *)&a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v17 = a6;
  unint64_t v18 = (unint64_t)width;
  unint64_t v19 = (unint64_t)height;
  if (width <= height)
  {
    if (v19 > a3)
    {
      unint64_t v18 = (unint64_t)(width / height * (double)a3);
      unint64_t v19 = a3;
    }
  }
  else if (v18 > a3)
  {
    unint64_t v19 = (unint64_t)(height / width * (double)a3);
    unint64_t v18 = a3;
  }
  CGAffineTransform v20 = -[VNImageBuffer croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:](self, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", v18, v19, v10, v17, a7, a8, x, y, width, height);

  return v20;
}

- (__CVBuffer)createBufferWithMaxSideLengthOf:(unint64_t)a3 pixelFormat:(unsigned int)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  unint64_t v11 = [(VNImageBuffer *)self width];
  unint64_t v12 = [(VNImageBuffer *)self height];
  unint64_t v13 = v12;
  if (v11 <= v12)
  {
    if (v12 > a3)
    {
      unint64_t v11 = (unint64_t)(float)((float)((float)a3 * (float)v11) / (float)v12);
      unint64_t v13 = a3;
    }
  }
  else if (v11 > a3)
  {
    unint64_t v13 = (unint64_t)(float)((float)((float)a3 * (float)v12) / (float)v11);
    unint64_t v11 = a3;
  }
  CFIndex v14 = [(VNImageBuffer *)self bufferWithWidth:v11 height:v13 format:v7 options:v10 error:a6];

  return (__CVBuffer *)v14;
}

- (CGRect)makeClippedRectAgainstImageExtentUsingOriginalRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(VNImageBuffer *)self fullImageBufferRect];
  CGFloat v11 = x;
  CGFloat v12 = y;
  CGFloat v13 = width;
  CGFloat v14 = height;

  return CGRectIntersection(*(CGRect *)&v7, *(CGRect *)&v11);
}

- (id)fileURL
{
  imageSourceManager = self->_imageSourceManager;
  if (imageSourceManager) {
    id v3 = imageSourceManager->_imageURL;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)imageProperties
{
  return [(NSDictionary *)self->_options objectForKeyedSubscript:@"VNImageOptionProperties"];
}

- (BOOL)getCameraIntrinsicsAvailable:(id *)a3
{
  CFDataRef v4 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"VNImageOptionCameraIntrinsics"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7.locatiouint64_t n = 0;
    v7.length = 48;
    CFDataGetBytes(v4, v7, (UInt8 *)a3);
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)getCameraOpticalCenterIfAvailable:(CGPoint *)a3
{
  long long v10 = 0u;
  memset(v9, 0, sizeof(v9));
  BOOL v5 = [(VNImageBuffer *)self getCameraIntrinsicsAvailable:v9];
  if (v5)
  {
    float v6 = *(float *)&v10;
    a3->CGFloat x = (float)(v6 / (float)[(VNImageBuffer *)self width]);
    float v7 = *((float *)&v10 + 1);
    a3->CGFloat y = (float)(v7 / (float)[(VNImageBuffer *)self height]);
  }
  return v5;
}

- (BOOL)getPixelFocalLengthIfAvailable:(float *)a3
{
  memset(v6, 0, sizeof(v6));
  BOOL v4 = [(VNImageBuffer *)self getCameraIntrinsicsAvailable:v6];
  if (v4) {
    *a3 = *(float *)v6;
  }
  return v4;
}

- (int)aspectForRegionOfInterest:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  unint64_t v6 = [(VNImageBuffer *)self width];
  unint64_t v7 = [(VNImageBuffer *)self height];
  double v8 = width * (double)v6;
  double v9 = height * (double)v7;
  if (v8 < v9) {
    return 1;
  }
  else {
    return 2 * (v8 > v9);
  }
}

- (int)aspect
{
  double v3 = (double)[(VNImageBuffer *)self width];
  unint64_t v4 = [(VNImageBuffer *)self height];
  if (v3 < (double)v4) {
    return 1;
  }
  else {
    return 2 * (v3 > (double)v4);
  }
}

- (unint64_t)height
{
  unint64_t result = self->_origImageHeight;
  if (!result)
  {
    -[VNImageBuffer calculateOrientationCorrectedImageDimensions]((uint64_t)self);
    return self->_origImageHeight;
  }
  return result;
}

- (uint64_t)calculateOrientationCorrectedImageDimensions
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = *(__CVBuffer **)(result + 16);
    if (v2)
    {
      size_t Width = CVPixelBufferGetWidth(v2);
      size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(v1 + 16));
    }
    else
    {
      BOOL v5 = *(void **)(v1 + 24);
      if (v5)
      {
        [v5 extent];
        size_t Width = (unint64_t)v6;
        [*(id *)(v1 + 24) extent];
        size_t Height = (unint64_t)v7;
      }
      else
      {
        double v8 = *(char **)(v1 + 40);
        if (v8
          && (double v9 = (CGImageSource *)[v8 _cgImageSourceAtAddress:v8 + 32 forSubSampleFactor:1 protectedWithUnfairLock:v8 + 12 operatingInLowPriority:0 error:0]) != 0)
        {
          CFDictionaryRef v10 = CGImageSourceCopyPropertiesAtIndex(v9, 0, 0);
          CGFloat v11 = [(__CFDictionary *)v10 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
          LODWORD(Width) = [v11 intValue];

          CGFloat v12 = [(__CFDictionary *)v10 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
          size_t Width = (int)Width;
          size_t Height = (int)[v12 intValue];
        }
        else
        {
          size_t Height = 0;
          size_t Width = 0;
        }
      }
    }
    unint64_t result = [(id)v1 orientation];
    if ((int)result <= 4) {
      size_t v13 = Width;
    }
    else {
      size_t v13 = Height;
    }
    if ((int)result <= 4) {
      size_t v14 = Height;
    }
    else {
      size_t v14 = Width;
    }
    *(void *)(v1 + 72) = v13;
    *(void *)(v1 + 80) = v14;
  }
  return result;
}

- (unint64_t)width
{
  unint64_t result = self->_origImageWidth;
  if (!result)
  {
    -[VNImageBuffer calculateOrientationCorrectedImageDimensions]((uint64_t)self);
    return self->_origImageWidth;
  }
  return result;
}

- (NSNumber)sceneStabilityMetric
{
  id origSampleBuffer = self->_origSampleBuffer;
  if (origSampleBuffer)
  {
    id origSampleBuffer = (id)CMGetAttachment(origSampleBuffer, @"SceneStabilityMetric", 0);
    if (origSampleBuffer) {
      id origSampleBuffer = origSampleBuffer;
    }
  }

  return (NSNumber *)origSampleBuffer;
}

- ($80F79C819FA5274A6E5B9E041FED86F1)timingInfo
{
  uint64_t v3 = MEMORY[0x1E4F1FA70];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
  *(_OWORD *)&retstr->var2.var0 = v4;
  retstr->var2.var3 = *(void *)(v3 + 64);
  long long v5 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)v3;
  *(_OWORD *)&retstr->var0.var3 = v5;
  unint64_t result = ($80F79C819FA5274A6E5B9E041FED86F1 *)self->_origSampleBuffer;
  if (result) {
    return ($80F79C819FA5274A6E5B9E041FED86F1 *)CMSampleBufferGetSampleTimingInfo((CMSampleBufferRef)result, 0, (CMSampleTimingInfo *)retstr);
  }
  return result;
}

- (int)orientation
{
  return self->_orientation;
}

- (__CVBuffer)cropAndScaleBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 cropRect:(CGRect)a5 format:(unsigned int)a6 imageCropAndScaleOption:(unint64_t)a7 options:(id)a8 error:(id *)a9 calculatedNormalizedOriginOffset:(CGPoint *)a10 calculatedScaleX:(double *)a11 calculatedScaleY:(double *)a12 pixelBufferRepsCacheKey:(id *)a13
{
  uint64_t v15 = *(void *)&a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v23 = a8;
  unint64_t v24 = 0;
  char v25 = 0;
  double v26 = *MEMORY[0x1E4F1DAD8];
  double v27 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v56 = 1.0;
  double v55 = 1.0;
  if ((uint64_t)a7 <= 1)
  {
    if (!a7)
    {
      +[VNImageBuffer computeCenterCropRectFromCropRect:inImageSize:calculatedScaleX:calculatedScaleY:](VNImageBuffer, "computeCenterCropRectFromCropRect:inImageSize:calculatedScaleX:calculatedScaleY:", &v56, &v55, x, y, width, height, (double)a3, (double)a4);
      double x = v33;
      double y = v34;
      char v25 = 0;
      double v26 = v33 / width;
      unint64_t v24 = a4;
      unint64_t v32 = a3;
      double width = v35;
      double v27 = v34 / height;
      double height = v36;
      goto LABEL_20;
    }
    if (a7 != 1) {
      goto LABEL_16;
    }
    double v28 = (double)a3 / width;
    double v56 = v28;
    double v29 = (double)a4 / height;
    double v55 = v29;
    char v25 = 0;
    if (v28 < v29)
    {
      unint64_t v24 = (unint64_t)(height * v28);
      double v55 = (double)a3 / width;
LABEL_14:
      unint64_t v32 = a3;
      goto LABEL_20;
    }
    unint64_t v32 = (unint64_t)(width * v29);
    double v56 = (double)a4 / height;
  }
  else
  {
    if (a7 == 2)
    {
      char v25 = 0;
      goto LABEL_11;
    }
    if (a7 != 257)
    {
      if (a7 == 258)
      {
        double v56 = (double)a3 / height;
        double v55 = (double)a4 / width;
        char v25 = 1;
LABEL_11:
        unint64_t v24 = a4;
        goto LABEL_14;
      }
LABEL_16:
      unint64_t v32 = 0;
      goto LABEL_20;
    }
    double v30 = (double)a3 / height;
    double v56 = v30;
    double v31 = (double)a4 / width;
    double v55 = v31;
    if (v30 < v31)
    {
      unint64_t v24 = (unint64_t)(width * v30);
      double v55 = (double)a3 / height;
      char v25 = 1;
      goto LABEL_14;
    }
    unint64_t v32 = (unint64_t)(height * v31);
    double v56 = (double)a4 / width;
    char v25 = 1;
  }
  unint64_t v24 = a4;
LABEL_20:
  uint64_t v37 = -[VNImageBuffer _croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:rotate90CCW:]((uint64_t)self, v32, v24, v15, v23, a9, a13, v25, x, y, width, height);
  float v38 = (__CVBuffer *)v37;
  if (!v37)
  {
LABEL_35:
    unint64_t v40 = 0;
    goto LABEL_36;
  }
  if (a7 - 257 >= 2 && a7 != 1)
  {
    unint64_t v40 = (__CVBuffer *)v37;
    goto LABEL_28;
  }
  char v54 = 0;
  BOOL v39 = -[VNImageBuffer _createPotentiallyPooledIOSurfaceBackedPixelBufferWithWith:height:format:options:outPooled:error:]((CVPixelBufferPoolRef)self, a3, a4, v15, v23, &v54, a9);
  unint64_t v40 = v39;
  if (!v39)
  {
    CVPixelBufferRelease(v38);
    goto LABEL_35;
  }
  uint64_t v46 = 0;
  unint64_t v47 = (double *)&v46;
  uint64_t v48 = 0x4012000000;
  unint64_t v49 = __Block_byref_object_copy__4772;
  uint8x8_t v50 = __Block_byref_object_dispose__4773;
  uint64_t v51 = "";
  double v52 = v26;
  double v53 = v27;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __197__VNImageBuffer_cropAndScaleBufferWithWidth_height_cropRect_format_imageCropAndScaleOption_options_error_calculatedNormalizedOriginOffset_calculatedScaleX_calculatedScaleY_pixelBufferRepsCacheKey___block_invoke;
  v43[3] = &unk_1E5B1C580;
  int v44 = v15;
  char v45 = v54;
  v43[6] = a4;
  v43[7] = v38;
  v43[4] = &v46;
  v43[5] = a3;
  int v41 = VNExecuteBlockWithPixelBuffer(v39, 0, v43, a9);
  double v26 = v47[6];
  double v27 = v47[7];
  CVPixelBufferRelease(v38);
  if (!v41)
  {
    CVPixelBufferRelease(v40);
    _Block_object_dispose(&v46, 8);
    goto LABEL_35;
  }
  _Block_object_dispose(&v46, 8);
LABEL_28:
  if (a10)
  {
    a10->double x = v26;
    a10->double y = v27;
  }
  if (a11) {
    *a11 = v56;
  }
  if (a12) {
    *a12 = v55;
  }
LABEL_36:

  return v40;
}

- (uint64_t)_croppedBufferWithWidth:(uint64_t)a3 height:(uint64_t)a4 format:(void *)a5 cropRect:(void *)a6 options:(void *)a7 error:(char)a8 pixelBufferRepsCacheKey:(double)a9 rotate90CCW:(double)a10
{
  id v36 = a5;
  if (!a1)
  {
    uint64_t v33 = 0;
    goto LABEL_24;
  }
  CGAffineTransform v22 = *(__CVBuffer **)(a1 + 16);
  if (!v22) {
    goto LABEL_9;
  }
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(v22);
  uint64_t v24 = PixelFormatType;
  if ((int)PixelFormatType > 792872768)
  {
    if (PixelFormatType == 792872769) {
      goto LABEL_10;
    }
    int v25 = 2084718401;
  }
  else
  {
    if (PixelFormatType == 641877825) {
      goto LABEL_10;
    }
    int v25 = 759318337;
  }
  if (PixelFormatType != v25) {
LABEL_9:
  }
    uint64_t v24 = a4;
LABEL_10:
  double v26 = +[VNImageBufferCache cacheKeyWithBufferFormat:width:height:cropRect:](VNImageBufferCache, "cacheKeyWithBufferFormat:width:height:cropRect:", v24, a2, a3, a9, a10, a11, a12);
  uint64_t v27 = [v26 hash];
  if (a3 && a2 && a11 >= 1.0 && a12 >= 1.0)
  {
    uint64_t v28 = v27;
    unint64_t v29 = v24 | ((unint64_t)((unsigned __int16)a3 | ((unsigned __int16)a2 << 16)) << 32);
    uint64_t v52 = 0;
    double v53 = &v52;
    uint64_t v54 = 0x2020000000;
    uint64_t v55 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __114__VNImageBuffer__croppedBufferWithWidth_height_format_cropRect_options_error_pixelBufferRepsCacheKey_rotate90CCW___block_invoke;
    aBlock[3] = &unk_1E5B1C558;
    uint64_t v41 = a2;
    uint64_t v42 = a3;
    unint64_t v40 = &v52;
    aBlock[4] = a1;
    id v30 = v26;
    id v38 = v30;
    uint64_t v43 = v28;
    unint64_t v44 = (int)a12 | ((((unint64_t)(int)a10 << 16) | ((unint64_t)(int)a9 << 32) | (int)a11) << 16);
    unint64_t v45 = v29;
    double v46 = a9;
    double v47 = a10;
    double v48 = a11;
    double v49 = a12;
    id v39 = v36;
    int v50 = v24;
    char v51 = a8;
    double v31 = _Block_copy(aBlock);
    kdebug_trace();
    char v32 = VNExecuteBlock(v31, (uint64_t)a6);
    kdebug_trace();
    if (v32)
    {
      if (a7) {
        *a7 = v30;
      }
      uint64_t v33 = v53[3];
    }
    else
    {
      uint64_t v33 = 0;
    }

    _Block_object_dispose(&v52, 8);
  }
  else if (a6)
  {
    +[VNError errorWithCode:3 message:@"Operation failed due to attempt to crop zero or near zero dimensioned area"];
    uint64_t v33 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v33 = 0;
  }

LABEL_24:
  return v33;
}

uint64_t __197__VNImageBuffer_cropAndScaleBufferWithWidth_height_cropRect_format_imageCropAndScaleOption_options_error_calculatedNormalizedOriginOffset_calculatedScaleX_calculatedScaleY_pixelBufferRepsCacheKey___block_invoke(uint64_t a1, CVPixelBufferRef pixelBuffer, void *a3)
{
  uint32_t bitmapInfo = 0;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBuffer);
  double v8 = VNColorspaceForFormat(*(_DWORD *)(a1 + 64), (int *)&bitmapInfo);
  double v9 = CGBitmapContextCreate(BaseAddress, *(void *)(a1 + 40), *(void *)(a1 + 48), 8uLL, BytesPerRow, v8, bitmapInfo);
  if (*(unsigned char *)(a1 + 68)) {
    bzero(BaseAddress, *(void *)(a1 + 48) * BytesPerRow);
  }
  CGImageRef image = 0;
  uint64_t v10 = VTCreateCGImageFromCVPixelBuffer(*(CVPixelBufferRef *)(a1 + 56), 0, &image);
  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = image == 0;
  }
  uint64_t v12 = !v11;
  if (v11)
  {
    if (a3)
    {
      *a3 = +[VNError errorForOSStatus:v10 localizedDescription:@"Failed to create CGImage from CVPixelBuffer"];
    }
  }
  else
  {
    CGFloat Width = (double)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 56));
    v19.size.double height = (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 56));
    CGFloat v14 = ((double)*(unint64_t *)(a1 + 40) - Width) * 0.5;
    CGFloat v15 = ((double)*(unint64_t *)(a1 + 48) - v19.size.height) * 0.5;
    v19.origin.double x = v14;
    v19.origin.double y = v15;
    v19.size.double width = Width;
    CGContextDrawImage(v9, v19, image);
    *(CGFloat *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = v14 / (double)*(unint64_t *)(a1 + 40);
    *(CGFloat *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = v15 / (double)*(unint64_t *)(a1 + 48);
    CGImageRelease(image);
    CGImageRef image = 0;
  }
  CGColorSpaceRelease(v8);
  CGContextRelease(v9);
  return v12;
}

uint64_t __114__VNImageBuffer__croppedBufferWithWidth_height_format_cropRect_options_error_pixelBufferRepsCacheKey_rotate90CCW___block_invoke(uint64_t a1, void *a2)
{
  size_t v5 = *(void *)(a1 + 64);
  size_t v4 = *(void *)(a1 + 72);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 48) cachedBufferWithKey:*(void *)(a1 + 40)];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    kdebug_trace();
    return 1;
  }
  [*(id *)(a1 + 32) fullImageBufferRect];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  if (CGRectIsInfinite(*(CGRect *)(a1 + 104))
    || (v61.origin.double x = v8,
        v61.origin.double y = v10,
        v61.size.double width = v12,
        v61.size.double height = v14,
        CGRectEqualToRect(v61, *(CGRect *)(a1 + 104))))
  {
    int v15 = 0;
  }
  else
  {
    CGFloat v8 = *(double *)(a1 + 104);
    CGFloat v10 = *(double *)(a1 + 112);
    int v15 = 1;
    CGFloat v12 = *(double *)(a1 + 120);
    CGFloat v14 = *(double *)(a1 + 128);
  }
  uint64_t v16 = -[VNImageBuffer _isRectOutOfBounds:](*(void **)(a1 + 32), v8, v10, v12, v14);
  uint64_t v17 = MEMORY[0x1A6257080](v16);
  unint64_t v18 = -[VNImageBuffer _optionsWithOverridingOptions:](*(void *)(a1 + 32), *(void **)(a1 + 48));
  id v60 = 0;
  id v59 = 0;
  BOOL v19 = +[VNValidationUtilities getOptionalObject:&v60 ofClass:objc_opt_class() forKey:@"VNImageBufferOption_FeatureOrientationRelativeToUpRight" inOptions:v18 error:&v59];
  id v20 = v60;
  id v21 = v59;
  if (!v19)
  {
    double v26 = (void *)v17;
    goto LABEL_40;
  }
  if (v20)
  {
    int v22 = [v20 integerValue];
    if (v22 <= 4) {
      size_t v23 = v5;
    }
    else {
      size_t v23 = v4;
    }
    if (v22 > 4) {
      size_t v4 = v5;
    }
    size_t v5 = v23;
  }
  uint64_t v24 = *(unsigned int *)(a1 + 136);
  int v25 = *(__CVPixelBufferPool **)(a1 + 32);
  int v52 = v15;
  double v26 = (void *)v17;
  if (v24 == 1278226488)
  {
    if (*((void *)v25 + 2))
    {
      size_t v5 = (v5 + 1) & 0xFFFFFFFFFFFFFFFELL;
      size_t v4 = (v4 + 1) & 0xFFFFFFFFFFFFFFFELL;
      uint64_t v24 = 875704422;
    }
    else
    {
      uint64_t v24 = 1278226488;
    }
  }
  id v58 = v21;
  CVPixelBufferPoolRef v27 = -[VNImageBuffer _createPotentiallyPooledIOSurfaceBackedPixelBufferWithWith:height:format:options:outPooled:error:](v25, v5, v4, v24, v18, 0, &v58);
  id v28 = v58;

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v27;
  uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v31 = *(void *)(v29 + 24);
  id v30 = (CVPixelBufferRef *)(v29 + 24);
  if (v31)
  {
    char v32 = *(void **)(a1 + 32);
    uint64_t v33 = (__CVBuffer *)v32[2];
    if (v33)
    {
      int v34 = *(_DWORD *)(a1 + 136);
      unsigned __int8 v35 = *(unsigned char *)(a1 + 140);
      id v57 = v28;
      char v36 = -[VNImageBuffer _cropCVPixelBuffer:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:](v32, v33, v30, v5, v4, v34, v52, v18, v8, v10, v12, v14, v35, &v57);
      uint64_t v37 = v57;
    }
    else
    {
      id v39 = (void *)v32[3];
      int v40 = v52;
      if (!v39)
      {
        double v47 = (void *)v32[5];
        if (!v47)
        {
LABEL_28:
          char v54 = 0;
          id v53 = v28;
          BOOL v43 = +[VNValidationUtilities getBOOLValue:&v54 forKey:@"VNImageBufferOption_DoNotCacheRepresentations" inOptions:v18 withDefaultValue:0 error:&v53];
          id v21 = v53;

          if (v43)
          {
            uint64_t v44 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
            if (v44 && !v54)
            {
              objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "cacheBuffer:forCacheKey:");
              uint64_t v44 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
            }
            if (v44)
            {
              unint64_t v45 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"VNImageBufferOption_RequiresDepth"];
              if ((v40 | [v45 BOOLValue] ^ 1) != 1)
              {
                uint64_t v46 = *(void *)(*(void *)(a1 + 32) + 96);

                if (v46)
                {
                  CVBufferSetAttachment(*(CVBufferRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), @"VNDepthRepresentationAttachment", *(CFTypeRef *)(*(void *)(a1 + 32) + 96), kCVAttachmentMode_ShouldNotPropagate);
                  LODWORD(v46) = 0;
                }
                goto LABEL_37;
              }
            }
            LODWORD(v46) = 0;
          }
          else
          {
            LODWORD(v46) = 1;
          }
LABEL_37:
          int v38 = !v43;
          goto LABEL_42;
        }
        int v48 = *(_DWORD *)(a1 + 136);
        unsigned __int8 v49 = *(unsigned char *)(a1 + 140);
        id v55 = v28;
        int v50 = -[VNImageBuffer _cropImageSourceManager:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((uint64_t)v32, v47, v30, v5, v4, v48, v52, v18, v8, v10, v12, v14, v49, &v55);
        id v21 = v55;

        if (v50)
        {
LABEL_27:
          id v28 = v21;
          int v40 = v52;
          goto LABEL_28;
        }
        goto LABEL_40;
      }
      int v41 = *(_DWORD *)(a1 + 136);
      unsigned __int8 v42 = *(unsigned char *)(a1 + 140);
      id v56 = v28;
      char v36 = -[VNImageBuffer _cropCIImage:outBuffer:width:height:format:cropRect:performCrop:options:rotate90CCW:error:]((id *)v32, v39, v30, v5, v4, v41, v52, v18, v8, v10, v12, v14, v42, &v56);
      uint64_t v37 = v56;
    }
    id v21 = v37;

    if (v36) {
      goto LABEL_27;
    }
LABEL_40:
    int v38 = 1;
    goto LABEL_41;
  }
  int v38 = 1;
  id v21 = v28;
LABEL_41:
  LODWORD(v46) = 1;
LABEL_42:

  if (v38)
  {
    CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    if (a2) {
      *a2 = v21;
    }
  }
  BOOL v6 = v46 == 0;

  return v6;
}

- (__CVBuffer)cropAndScaleBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 cropRect:(CGRect)a5 format:(unsigned int)a6 imageCropAndScaleOption:(unint64_t)a7 options:(id)a8 error:(id *)a9 calculatedNormalizedOriginOffset:(CGPoint *)a10 calculatedScaleX:(double *)a11 calculatedScaleY:(double *)a12
{
  return -[VNImageBuffer cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:](self, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", a3, a4, *(void *)&a6, a7, a8, a9, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a10, a11, a12, 0);
}

- (__CVBuffer)croppedBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 cropRect:(CGRect)a6 options:(id)a7 error:(id *)a8 pixelBufferRepsCacheKey:(id *)a9
{
  return (__CVBuffer *)-[VNImageBuffer _croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:rotate90CCW:]((uint64_t)self, a3, a4, *(uint64_t *)&a5, a7, a8, a9, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (__CVBuffer)croppedBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 cropRect:(CGRect)a6 options:(id)a7 error:(id *)a8
{
  return (__CVBuffer *)-[VNImageBuffer _croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:rotate90CCW:]((uint64_t)self, a3, a4, *(uint64_t *)&a5, a7, a8, 0, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (VNImageBuffer)bufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 options:(id)a6 error:(id *)a7 pixelBufferRepsCacheKey:(id *)a8
{
  uint64_t v10 = *(void *)&a5;
  id v14 = a6;
  if (*(_OWORD *)&self->_origPixelBuffer == 0 && !self->_imageSourceManager)
  {
    if (a7)
    {
      uint64_t v16 = (void *)[[NSString alloc] initWithFormat:@"Failed to create image for processing"];
      *a7 = +[VNError errorWithCode:3 message:v16];

      a7 = 0;
    }
  }
  else
  {
    [(VNImageBuffer *)self fullImageBufferRect];
    a7 = -[VNImageBuffer croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:](self, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", a3, a4, v10, v14, a7, a8);
  }

  return (VNImageBuffer *)a7;
}

- (VNImageBuffer)bufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 options:(id)a6 error:(id *)a7
{
  return [(VNImageBuffer *)self bufferWithWidth:a3 height:a4 format:*(void *)&a5 options:a6 error:a7 pixelBufferRepsCacheKey:0];
}

- (CGImage)originalCGImage
{
  return [self->_origCIImage CGImage];
}

- (__CVBuffer)originalPixelBuffer
{
  return self->_origPixelBuffer;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_origPixelBuffer);
  self->_origPixelBuffer = 0;
  id origSampleBuffer = self->_origSampleBuffer;
  if (origSampleBuffer)
  {
    CFRelease(origSampleBuffer);
    self->_id origSampleBuffer = 0;
  }
  sessiouint64_t n = self->_session;
  self->_sessiouint64_t n = 0;

  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)VNImageBuffer;
  [(VNImageBuffer *)&v5 dealloc];
}

- (VNImageBuffer)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6 session:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v11 = a4;
  id v12 = a6;
  double v13 = [(VNImageBuffer *)self initWithCMSampleBuffer:a3 orientation:v8 options:v12];
  if (v13)
  {
    uint64_t v14 = +[VNDepthRepresentation depthRepresentationForDepthData:v11 orientation:v8];
    depthRepresentatiouint64_t n = v13->_depthRepresentation;
    v13->_depthRepresentatiouint64_t n = (VNDepthRepresentation *)v14;

    uint64_t v16 = v13;
  }

  return v13;
}

- (VNImageBuffer)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = objc_alloc_init(VNSession);
  double v13 = [(VNImageBuffer *)self initWithCMSampleBuffer:a3 depthData:v10 orientation:v7 options:v11 session:v12];

  return v13;
}

- (VNImageBuffer)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  unsigned int valuePtr = a4;
  id v10 = a5;
  id v11 = a6;
  if (!CMSampleBufferIsValid(a3) || !CMSampleBufferDataIsReady(a3)) {
    goto LABEL_10;
  }
  if (!a4)
  {
    CFNumberRef v12 = (const __CFNumber *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F2FCA0], 0);
    if (v12) {
      CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
    }
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer) {
    goto LABEL_10;
  }
  uint64_t v14 = [(VNImageBuffer *)self initWithCVPixelBuffer:ImageBuffer orientation:valuePtr options:v10 session:v11];
  if (!v14)
  {
    self = 0;
LABEL_10:
    int v15 = 0;
    goto LABEL_11;
  }
  CFRetain(a3);
  v14->_id origSampleBuffer = a3;
  self = v14;
  int v15 = self;
LABEL_11:

  return v15;
}

- (VNImageBuffer)initWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  double v9 = objc_alloc_init(VNSession);
  id v10 = [(VNImageBuffer *)self initWithCMSampleBuffer:a3 orientation:v5 options:v8 session:v9];

  return v10;
}

- (VNImageBuffer)initWithURL:(id)a3 options:(id)a4
{
  return [(VNImageBuffer *)self initWithURL:a3 orientation:0 options:a4];
}

- (VNImageBuffer)initWithURL:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  double v13 = [[VNImageSourceManager alloc] initWithImageURL:v10];
  uint64_t v14 = v13;
  if (!v13) {
    goto LABEL_7;
  }
  if (!a4) {
    a4 = [(VNImageSourceManager *)v13 exifOrientation];
  }
  int v15 = -[VNImageBuffer initWithOptions:orientation:session:]((id *)&self->super.isa, v11, a4, v12);
  uint64_t v16 = v15;
  if (!v15)
  {
    self = 0;
LABEL_7:
    uint64_t v17 = 0;
    goto LABEL_8;
  }
  objc_storeStrong(v15 + 5, v14);
  kdebug_trace();
  self = v16;
  uint64_t v17 = self;
LABEL_8:

  return v17;
}

- (id)initWithOptions:(int)a3 orientation:(void *)a4 session:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)VNImageBuffer;
    double v9 = (id *)objc_msgSendSuper2(&v23, sel_init);
    a1 = v9;
    if (v9)
    {
      objc_storeStrong(v9 + 1, a4);
      if (v7)
      {
        uint64_t v10 = [v7 copy];
        id v11 = a1[11];
        a1[11] = (id)v10;
      }
      else
      {
        id v11 = a1[11];
        a1[11] = (id)MEMORY[0x1E4F1CC08];
      }

      id v12 = objc_alloc_init(VNImageBufferCache);
      id v13 = a1[6];
      a1[6] = v12;

      uint64_t v14 = [v7 objectForKeyedSubscript:@"VNImageOptionCIContext"];
      id v15 = a1[7];
      a1[7] = (id)v14;

      id v16 = v7;
      self;
      if (!a3)
      {
        uint64_t v17 = [v16 objectForKeyedSubscript:@"VNImageOptionProperties"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v18 = *MEMORY[0x1E4F2FCA0];
          BOOL v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];

          if (v19
            && ([v17 objectForKeyedSubscript:v18],
                id v20 = objc_claimAutoreleasedReturnValue(),
                (BOOL v19 = v20) != 0))
          {
            a3 = [v20 intValue];
          }
          else
          {
            a3 = 1;
          }
        }
        else
        {
          a3 = 0;
        }
      }
      if ((a3 - 1) >= 8) {
        int v21 = 1;
      }
      else {
        int v21 = a3;
      }
      *((_DWORD *)a1 + 16) = v21;
      *((_DWORD *)a1 + 26) = 0;
    }
  }

  return a1;
}

- (VNImageBuffer)initWithURL:(id)a3 orientation:(unsigned int)a4 options:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(VNSession);
  id v11 = [(VNImageBuffer *)self initWithURL:v8 orientation:v6 options:v9 session:v10];

  return v11;
}

- (VNImageBuffer)initWithData:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [[VNImageSourceManager alloc] initWithImageData:v10];
  uint64_t v14 = v13;
  if (!v13) {
    goto LABEL_7;
  }
  if (!a4) {
    a4 = [(VNImageSourceManager *)v13 exifOrientation];
  }
  id v15 = -[VNImageBuffer initWithOptions:orientation:session:]((id *)&self->super.isa, v11, a4, v12);
  id v16 = v15;
  if (!v15)
  {
    self = 0;
LABEL_7:
    uint64_t v17 = 0;
    goto LABEL_8;
  }
  objc_storeStrong(v15 + 5, v14);
  kdebug_trace();
  self = v16;
  uint64_t v17 = self;
LABEL_8:

  return v17;
}

- (VNImageBuffer)initWithData:(id)a3 orientation:(unsigned int)a4 options:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(VNSession);
  id v11 = [(VNImageBuffer *)self initWithData:v8 orientation:v6 options:v9 session:v10];

  return v11;
}

- (VNImageBuffer)initWithCIImage:(id)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = -[VNImageBuffer initWithOptions:orientation:session:]((id *)&self->super.isa, v12, a4, v13);
  id v15 = (VNImageBuffer *)v14;
  if (v14)
  {
    objc_storeStrong(v14 + 3, a3);
    kdebug_trace();
    id v16 = v15;
  }

  return v15;
}

- (VNImageBuffer)initWithCIImage:(id)a3 orientation:(unsigned int)a4 options:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(VNSession);
  id v11 = [(VNImageBuffer *)self initWithCIImage:v8 orientation:v6 options:v9 session:v10];

  return v11;
}

- (VNImageBuffer)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = (VNImageBuffer *)-[VNImageBuffer initWithOptions:orientation:session:]((id *)&self->super.isa, v10, a4, v11);
  if (v12)
  {
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1E050]) initWithCGImage:a3];
    origCIImage = v12->_origCIImage;
    v12->_origCIImage = (CIImage *)v13;

    kdebug_trace();
    id v15 = v12;
  }

  return v12;
}

- (VNImageBuffer)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = objc_alloc_init(VNSession);
  id v10 = [(VNImageBuffer *)self initWithCGImage:a3 orientation:v5 options:v8 session:v9];

  return v10;
}

- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6 session:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(VNImageBuffer *)self initWithCVPixelBuffer:a3 orientation:v9 options:v13 session:v14];
  if (v15)
  {
    uint64_t v16 = +[VNDepthRepresentation depthRepresentationForDepthData:v12 orientation:v9];
    depthRepresentatiouint64_t n = v15->_depthRepresentation;
    v15->_depthRepresentatiouint64_t n = (VNDepthRepresentation *)v16;

    uint64_t v18 = v15;
  }

  return v15;
}

- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 depthData:(id)a4 orientation:(unsigned int)a5 options:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = objc_alloc_init(VNSession);
  id v13 = [(VNImageBuffer *)self initWithCVPixelBuffer:a3 depthData:v10 orientation:v7 options:v11 session:v12];

  return v13;
}

- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5 session:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (a3
    && (self = (VNImageBuffer *)-[VNImageBuffer initWithOptions:orientation:session:]((id *)&self->super.isa, v10, a4, v11)) != 0)
  {
    id v12 = CVPixelBufferRetain(a3);
    self->_origPixelBuffer = v12;
    size_t Width = CVPixelBufferGetWidth(v12);
    size_t Height = CVPixelBufferGetHeight(self->_origPixelBuffer);
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(self->_origPixelBuffer);
    if ([(VNImageBuffer *)self orientation] == 1)
    {
      uint64_t v16 = +[VNImageBufferCache cacheKeyWithBufferFormat:PixelFormatType width:Width height:Height];
      [(VNImageBufferCache *)self->_pixelBufferRepsCache cacheBuffer:self->_origPixelBuffer forCacheKey:v16];
    }
    kdebug_trace();
    self = self;
    uint64_t v17 = self;
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  uint64_t v9 = objc_alloc_init(VNSession);
  id v10 = [(VNImageBuffer *)self initWithCVPixelBuffer:a3 orientation:v5 options:v8 session:v9];

  return v10;
}

- (VNImageBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3 options:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(VNSession);
  id v8 = [(VNImageBuffer *)self initWithCVPixelBuffer:a3 orientation:0 options:v6 session:v7];

  return v8;
}

- (VNSession)session
{
  return self->_session;
}

- (__CVBuffer)cachedPixelBufferRepresentationForKey:(id)a3
{
  return [(VNImageBufferCache *)self->_pixelBufferRepsCache cachedBufferWithKey:a3];
}

- (CGRect)fullImageBufferRect
{
  double v3 = (double)[(VNImageBuffer *)self width];
  double v4 = (double)[(VNImageBuffer *)self height];
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = v3;
  result.size.double height = v4;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

+ (CGRect)computeCenterCropRectFromCropRect:(CGRect)result inImageSize:(CGSize)a4 calculatedScaleX:(double *)a5 calculatedScaleY:(double *)a6
{
  if (result.size.width == 0.0 || result.size.height == 0.0)
  {
    return *(CGRect *)*(void *)&MEMORY[0x1E4F1DB20];
  }
  else
  {
    CGFloat v6 = a4.width / result.size.width;
    CGFloat v7 = a4.height / result.size.height;
    BOOL v8 = a4.width / result.size.width < a4.height / result.size.height;
    double v9 = a4.height / (a4.width / result.size.width);
    double v10 = a4.width / v7;
    if (v8) {
      result.origin.double x = result.origin.x + (result.size.width - v10) * 0.5;
    }
    if (v8) {
      result.size.double width = v10;
    }
    else {
      result.origin.double y = result.origin.y + (result.size.height - v9) * 0.5;
    }
    if (!v8) {
      result.size.double height = v9;
    }
    if (a5) {
      *a5 = v6;
    }
    if (a6) {
      *a6 = v7;
    }
  }
  return result;
}

+ (const)mapOrientationToRotationDegrees
{
  if (+[VNImageBuffer mapOrientationToRotationDegrees]::onceToken != -1) {
    dispatch_once(&+[VNImageBuffer mapOrientationToRotationDegrees]::onceToken, &__block_literal_global_4785);
  }
  return (const void *)+[VNImageBuffer mapOrientationToRotationDegrees]::mapOrientationToRotationDegrees;
}

void __48__VNImageBuffer_mapOrientationToRotationDegrees__block_invoke()
{
}

@end