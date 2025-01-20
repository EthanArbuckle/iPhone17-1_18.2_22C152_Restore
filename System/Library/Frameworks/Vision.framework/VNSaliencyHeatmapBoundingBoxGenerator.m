@interface VNSaliencyHeatmapBoundingBoxGenerator
+ (id)calculateSaliencyBoundingBoxesForDetectorType:(id)a3 pixelBuffer:(__CVBuffer *)a4 configurationOptions:(id)a5 originatingRequestSpecifier:(id)a6 regionOfInterest:(CGRect)a7 qosClass:(unsigned int)a8 warningRecorder:(id)a9 error:(id *)a10;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3;
+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3;
+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (__CVBuffer)_createPixelBufferOfWidth:(unint64_t)a3 height:(unint64_t)a4 fromImageBuffer:(id)a5 options:(id)a6 error:(id *)a7;
- (id)_observationsForOneComponent32FloatPixelBuffer:(__CVBuffer *)a3 options:(id)a4 regionOfInterest:(CGRect)a5 error:(id *)a6;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNSaliencyHeatmapBoundingBoxGenerator

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1278226534;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return @"mask";
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__VNSaliencyHeatmapBoundingBoxGenerator_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNSaliencyHeatmapBoundingBoxGenerator configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNSaliencyHeatmapBoundingBoxGenerator configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNSaliencyHeatmapBoundingBoxGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __78__VNSaliencyHeatmapBoundingBoxGenerator_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNSaliencyHeatmapBoundingBoxGenerator;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 removeObject:@"VNDetectorOption_OriginatingRequestSpecifier"];
  [v2 removeObject:@"VNDetectorOption_PreferBackgroundProcessing"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNSaliencyHeatmapBoundingBoxGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNSaliencyHeatmapBoundingBoxGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v4 = a3;
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___VNSaliencyHeatmapBoundingBoxGenerator;
  objc_msgSendSuper2(&v5, sel_recordDefaultConfigurationOptionsInDictionary_, v4);
  [v4 setObject:&unk_1EF7A7F40 forKeyedSubscript:@"VNEspressoModelFileBasedDetectorOption_InputBlobNames"];
  [v4 setObject:&unk_1EF7A7F58 forKeyedSubscript:@"VNEspressoModelFileBasedDetectorOption_OutputBlobNames"];
}

+ (id)calculateSaliencyBoundingBoxesForDetectorType:(id)a3 pixelBuffer:(__CVBuffer *)a4 configurationOptions:(id)a5 originatingRequestSpecifier:(id)a6 regionOfInterest:(CGRect)a7 qosClass:(unsigned int)a8 warningRecorder:(id)a9 error:(id *)a10
{
  uint64_t v11 = *(void *)&a8;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  v31[1] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a5;
  id v21 = a6;
  id v22 = a9;
  v23 = +[VNValidationUtilities requiredSessionInOptions:v20 error:a10];
  v24 = v23;
  if (!v23)
  {
    v29 = 0;
    goto LABEL_10;
  }
  v25 = [v23 detectorOfType:v19 configuredWithOptions:v20 error:a10];
  if (!v25) {
    goto LABEL_8;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a10)
    {
      +[VNError errorForInvalidArgument:v19 named:@"detectorType"];
      v29 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v29 = 0;
    goto LABEL_9;
  }
  v26 = [VNImageBuffer alloc];
  v27 = [(VNImageBuffer *)v26 initWithCVPixelBuffer:a4 orientation:1 options:MEMORY[0x1E4F1CC08] session:v24];
  v31[0] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  [v20 setObject:v28 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

  [v20 setObject:v21 forKeyedSubscript:@"VNDetectorOption_OriginatingRequestSpecifier"];
  v29 = objc_msgSend(v25, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v11, v20, v22, a10, 0, x, y, width, height);

LABEL_9:
LABEL_10:

  return v29;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  v9 = -[VNSaliencyHeatmapBoundingBoxGenerator _observationsForOneComponent32FloatPixelBuffer:options:regionOfInterest:error:](self, "_observationsForOneComponent32FloatPixelBuffer:options:regionOfInterest:error:", a4, a5, a8, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return v9;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v13 = a4;
  id v14 = a6;
  v15 = [(VNDetector *)self validatedImageBufferFromOptions:v13 error:a8];
  if (v15)
  {
    unint64_t v16 = [(VNEspressoModelFileBasedDetector *)self networkRequiredInputImageWidth];
    unint64_t v17 = [(VNEspressoModelFileBasedDetector *)self networkRequiredInputImageHeight];
    if ([v15 width] < v16 || objc_msgSend(v15, "height") < v17) {
      [v14 recordWarning:@"VNRequestWarningImageTooSmall" value:MEMORY[0x1E4F1CC38]];
    }
    v18 = [(VNSaliencyHeatmapBoundingBoxGenerator *)self _createPixelBufferOfWidth:v16 height:v17 fromImageBuffer:v15 options:v13 error:a8];
    *a7 = v18;
    BOOL v19 = v18 != 0;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)VNSaliencyHeatmapBoundingBoxGenerator;
  if ([(VNDetector *)&v21 warmUpSession:v8 withOptions:v9 error:a5])
  {
    unint64_t v10 = [(VNEspressoModelFileBasedDetector *)self networkRequiredInputImageWidth];
    unint64_t v11 = [(VNEspressoModelFileBasedDetector *)self networkRequiredInputImageHeight];
    uint64_t v12 = [(id)objc_opt_class() networkRequiredInputImagePixelFormatForConfigurationOptions:v9];
    id v13 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, 8 * v10, 8 * v11, v12, a5);
    if (v13)
    {
      id v14 = [[VNImageBuffer alloc] initWithCVPixelBuffer:v13 orientation:1 options:0 session:v8];
      v15 = (void *)[v9 mutableCopy];
      v22[0] = v14;
      unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      [v15 setObject:v16 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      uint64_t v17 = qos_class_self();
      v18 = objc_alloc_init(VNWarningRecorder);
      BOOL v19 = -[VNDetector processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](self, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v17, v15, v18, a5, 0, 0.0, 0.0, 1.0, 1.0);

      CVPixelBufferRelease(v13);
      LOBYTE(v13) = v19 != 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return (char)v13;
}

- (__CVBuffer)_createPixelBufferOfWidth:(unint64_t)a3 height:(unint64_t)a4 fromImageBuffer:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(id)objc_opt_class() networkRequiredInputImagePixelFormatForConfigurationOptions:v12];
  id v22 = 0;
  id v14 = (__CVBuffer *)[v11 bufferWithWidth:a3 height:a4 format:v13 options:v12 error:&v22];
  id v15 = v22;
  if (!v14)
  {
    uint64_t v16 = [v11 originalPixelBuffer];
    if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v16];
      v18 = +[VNValidationUtilities requiredSessionInOptions:v12 error:a7];
      if (v18)
      {
        objc_super v21 = v17;
        BOOL v19 = [[VNImageBuffer alloc] initWithCIImage:v17 orientation:1 options:v12 session:v18];
        id v14 = [(VNImageBuffer *)v19 bufferWithWidth:a3 height:a4 format:v13 options:0 error:a7];

        uint64_t v17 = v21;
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
      if (a7) {
        *a7 = v15;
      }
    }
  }

  return v14;
}

- (id)_observationsForOneComponent32FloatPixelBuffer:(__CVBuffer *)a3 options:(id)a4 regionOfInterest:(CGRect)a5 error:(id *)a6
{
  id v8 = a4;
  uint64_t v13 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v8 error:a6];
  if (v13)
  {
    uint64_t v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    if (!v9)
    {
      uint64_t v28 = 0;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      size_t Width = CVPixelBufferGetWidth(a3);
      CVPixelBufferGetHeight(a3);
      CVPixelBufferGetBytesPerRow(a3);
      float __C = 1.0;
      float __B = 0.0;
      float v15 = 255.0;
      id v11 = malloc_type_malloc(4 * Width, 0x100004052888210uLL);
      std::shared_ptr<float>::shared_ptr[abi:ne180100]<float,void (*)(void *),void>(&__D, (uint64_t)v11);
    }
    if (a6)
    {
      *a6 = +[VNError errorForCVReturnCode:v9 localizedDescription:@"unable to lock base address of pixelBuffer"];
    }
  }

  return 0;
}

@end