@interface _MLVNFrameworkHandle
+ (id)addOrientation:(unsigned int)a3 toOptions:(id)a4;
+ (id)sharedHandle;
- (BOOL)isValid;
- (Class)VNImageBufferClass;
- (_MLVNFrameworkHandle)init;
- (__CVBuffer)createPixelBufferFromCGImage:(CGImage *)a3 constraint:(id)a4 cropRect:(CGRect)a5 cropAndScaleOption:(unint64_t)a6 options:(id)a7 error:(id *)a8;
- (__CVBuffer)createPixelBufferFromImageAtURL:(id)a3 constraint:(id)a4 cropRect:(CGRect)a5 cropAndScaleOption:(unint64_t)a6 options:(id)a7 error:(id *)a8;
- (__CVBuffer)createPixelBufferFromVNImageBuffer:(id)a3 constraint:(id)a4 cropRect:(CGRect)a5 cropAndScaleOption:(unint64_t)a6 options:(id)a7 error:(id *)a8;
- (id)detectionPrintShapes:(unint64_t)a3;
- (id)detectionPrintSupportedRevisions;
- (id)detectionPrintsFromPixelBuffers:(__CVBuffer *)a3 version:(unint64_t)a4 augmentationOptions:(id)a5 useCPUOnly:(BOOL)a6 error:(id *)a7;
- (id)scenePrintsFromPixelBuffers:(__CVBuffer *)a3 version:(unint64_t)a4 augmentationOptions:(id)a5 useCPUOnly:(BOOL)a6 error:(id *)a7;
- (unint64_t)elementCountForScenePrintRequestRevision:(unint64_t)a3;
- (unint64_t)lengthInBytesForScenePrintRequestRevision:(unint64_t)a3;
- (void)detectionPrintShapesImpl;
- (void)detectionPrintSupportedRevisionsImpl;
- (void)detectionPrintsFromPixelBuffersImpl;
- (void)detectionPrintsFromPixelBuffersUsesCPUOnlyImpl;
- (void)scenePrintElementCountImpl;
- (void)scenePrintLengthImpl;
- (void)scenePrintsFromPixelBuffersImpl;
- (void)scenePrintsFromPixelBuffersUsesCPUOnlyImpl;
@end

@implementation _MLVNFrameworkHandle

- (void).cxx_destruct
{
}

- (void)detectionPrintSupportedRevisionsImpl
{
  return self->_detectionPrintSupportedRevisionsImpl;
}

- (void)detectionPrintShapesImpl
{
  return self->_detectionPrintShapesImpl;
}

- (void)detectionPrintsFromPixelBuffersUsesCPUOnlyImpl
{
  return self->_detectionPrintsFromPixelBuffersUsesCPUOnlyImpl;
}

- (void)detectionPrintsFromPixelBuffersImpl
{
  return self->_detectionPrintsFromPixelBuffersImpl;
}

- (Class)VNImageBufferClass
{
  return self->_VNImageBufferClass;
}

- (void)scenePrintLengthImpl
{
  return self->_scenePrintLengthImpl;
}

- (void)scenePrintElementCountImpl
{
  return self->_scenePrintElementCountImpl;
}

- (void)scenePrintsFromPixelBuffersUsesCPUOnlyImpl
{
  return self->_scenePrintsFromPixelBuffersUsesCPUOnlyImpl;
}

- (void)scenePrintsFromPixelBuffersImpl
{
  return self->_scenePrintsFromPixelBuffersImpl;
}

- (BOOL)isValid
{
  return self->_validForSceneprint;
}

- (id)detectionPrintSupportedRevisions
{
  v2 = (void *)((uint64_t (*)(_MLVNFrameworkHandle *, SEL))self->_detectionPrintSupportedRevisionsImpl)(self, a2);

  return v2;
}

- (id)detectionPrintShapes:(unint64_t)a3
{
  v3 = (void *)((uint64_t (*)(unint64_t, SEL))self->_detectionPrintShapesImpl)(a3, a2);

  return v3;
}

- (id)detectionPrintsFromPixelBuffers:(__CVBuffer *)a3 version:(unint64_t)a4 augmentationOptions:(id)a5 useCPUOnly:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  CFTypeRef cf = 0;
  if (v8)
  {
LABEL_5:
    v13 = (void *)((uint64_t (*)(__CVBuffer *, unint64_t, id, CFTypeRef *))self->_detectionPrintsFromPixelBuffersUsesCPUOnlyImpl)(a3, a4, v12, &cf);
    goto LABEL_6;
  }
  v13 = (void *)((uint64_t (*)(__CVBuffer *, unint64_t, id, CFTypeRef *))self->_detectionPrintsFromPixelBuffersImpl)(a3, a4, v12, &cf);
  if (!v13)
  {
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    goto LABEL_5;
  }
LABEL_6:
  if (a7 && cf) {
    *a7 = (id)(id)cf;
  }

  return v13;
}

- (__CVBuffer)createPixelBufferFromCGImage:(CGImage *)a3 constraint:(id)a4 cropRect:(CGRect)a5 cropAndScaleOption:(unint64_t)a6 options:(id)a7 error:(id *)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v17 = a4;
  id v18 = a7;
  uint64_t v19 = [v18 objectForKeyedSubscript:@"VNImageOptionImageOrientation"];
  if (v19) {
    v20 = (void *)v19;
  }
  else {
    v20 = &unk_1EF11A298;
  }
  v21 = objc_msgSend(objc_alloc(self->_VNImageBufferClass), "initWithCGImage:orientation:options:", a3, objc_msgSend(v20, "unsignedIntValue"), v18);
  v22 = v21;
  if (v21 && [v21 width] && objc_msgSend(v22, "height"))
  {
    v23 = -[_MLVNFrameworkHandle createPixelBufferFromVNImageBuffer:constraint:cropRect:cropAndScaleOption:options:error:](self, "createPixelBufferFromVNImageBuffer:constraint:cropRect:cropAndScaleOption:options:error:", v22, v17, a6, v18, a8, x, y, width, height);
  }
  else if (a8)
  {
    +[MLModelErrorUtils errorWithCode:3 underlyingError:0 format:@"Failed to form pixel buffer from CGImage"];
    v23 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (__CVBuffer)createPixelBufferFromImageAtURL:(id)a3 constraint:(id)a4 cropRect:(CGRect)a5 cropAndScaleOption:(unint64_t)a6 options:(id)a7 error:(id *)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v17 = a3;
  id v18 = a4;
  id v19 = a7;
  uint64_t v20 = [v19 objectForKeyedSubscript:@"VNImageOptionImageOrientation"];
  if (v20) {
    v21 = (void *)v20;
  }
  else {
    v21 = &unk_1EF11A298;
  }
  v22 = objc_msgSend(objc_alloc(self->_VNImageBufferClass), "initWithURL:orientation:options:", v17, objc_msgSend(v21, "unsignedIntValue"), v19);
  v23 = v22;
  if (v22 && [v22 width] && objc_msgSend(v23, "height"))
  {
    v24 = -[_MLVNFrameworkHandle createPixelBufferFromVNImageBuffer:constraint:cropRect:cropAndScaleOption:options:error:](self, "createPixelBufferFromVNImageBuffer:constraint:cropRect:cropAndScaleOption:options:error:", v23, v18, a6, v19, a8, x, y, width, height);
  }
  else if (a8)
  {
    +[MLModelErrorUtils errorWithCode:3, 0, @"Failed to form pixel buffer from %@", v17 underlyingError format];
    v24 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (__CVBuffer)createPixelBufferFromVNImageBuffer:(id)a3 constraint:(id)a4 cropRect:(CGRect)a5 cropAndScaleOption:(unint64_t)a6 options:(id)a7 error:(id *)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  uint64_t v19 = [v17 pixelsWide];
  uint64_t v20 = [v17 pixelsHigh];
  uint64_t v21 = [v17 pixelFormatType];
  if (width <= 1.0)
  {
    double x = x * (double)(unint64_t)[v16 width];
    double width = width * (double)(unint64_t)[v16 width];
    double y = y * (double)(unint64_t)[v16 height];
    double height = height * (double)(unint64_t)[v16 height];
  }
  v22 = [v17 sizeConstraint];

  if (v22)
  {
    v23 = [v17 sizeConstraint];
    v24 = objc_msgSend(v23, "allowedImageSizeClosestToPixelsWide:pixelsHigh:preferDownScaling:preferInputAspectRatio:", objc_msgSend(v16, "width"), objc_msgSend(v16, "height"), 1, 1);

    uint64_t v19 = [v24 pixelsWide];
    uint64_t v20 = [v24 pixelsHigh];
  }
  id v29 = 0;
  v25 = (__CVBuffer *)objc_msgSend(v16, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:", v19, v20, v21, a6, v18, &v29, x, y, width, height, 0, 0, 0);
  id v26 = v29;
  v27 = v26;
  if (a8 && !v25) {
    *a8 = v26;
  }

  return v25;
}

- (unint64_t)lengthInBytesForScenePrintRequestRevision:(unint64_t)a3
{
  return ((uint64_t (*)(unint64_t))self->_scenePrintLengthImpl)(a3);
}

- (unint64_t)elementCountForScenePrintRequestRevision:(unint64_t)a3
{
  if (a3 == 3737841671) {
    return 768;
  }
  else {
    return ((uint64_t (*)(unint64_t))self->_scenePrintElementCountImpl)(a3);
  }
}

- (id)scenePrintsFromPixelBuffers:(__CVBuffer *)a3 version:(unint64_t)a4 augmentationOptions:(id)a5 useCPUOnly:(BOOL)a6 error:(id *)a7
{
  id v12 = a5;
  CFTypeRef cf = 0;
  if (a4 == 3737841671) {
    a4 = 4294967289;
  }
  else {
    a4 = a4;
  }
  if (a6)
  {
LABEL_8:
    v13 = (void *)((uint64_t (*)(__CVBuffer *, unint64_t, id, CFTypeRef *))self->_scenePrintsFromPixelBuffersUsesCPUOnlyImpl)(a3, a4, v12, &cf);
    goto LABEL_9;
  }
  v13 = (void *)((uint64_t (*)(__CVBuffer *, unint64_t, id, CFTypeRef *))self->_scenePrintsFromPixelBuffersImpl)(a3, a4, v12, &cf);
  if (!v13)
  {
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    goto LABEL_8;
  }
LABEL_9:
  if (a7 && cf) {
    *a7 = (id)(id)cf;
  }

  return v13;
}

- (_MLVNFrameworkHandle)init
{
  v10.receiver = self;
  v10.super_class = (Class)_MLVNFrameworkHandle;
  v2 = [(_MLVNFrameworkHandle *)&v10 init];
  if (v2)
  {
    v3 = dlopen("/System/Library/Frameworks/Vision.framework/Vision", 4);
    if (v3)
    {
      v4 = v3;
      v2->_scenePrintsFromPixelBuffersImpl = dlsym(v3, "VNScenePrintsFromPixelBuffers");
      v2->_scenePrintsFromPixelBuffersUsesCPUOnlyImpl = dlsym(v4, "VNScenePrintsFromPixelBuffersUsesCPUOnly");
      v2->_scenePrintElementCountImpl = dlsym(v4, "VNElementCountForScenePrintRequestRevision");
      v2->_scenePrintLengthImpl = dlsym(v4, "VNLengthInBytesForScenePrintRequestRevision");
      uint64_t v5 = NSClassFromString(&cfstr_Vnimagebuffer.isa);
      Class VNImageBufferClass = v2->_VNImageBufferClass;
      v2->_Class VNImageBufferClass = (Class)v5;

      v2->_detectionPrintsFromPixelBuffersImpl = dlsym(v4, "VNDetectionPrintsFromPixelBuffers");
      v2->_detectionPrintsFromPixelBuffersUsesCPUOnlyImpl = dlsym(v4, "VNDetectionPrintsFromPixelBuffersUsesCPUOnly");
      v2->_detectionPrintShapesImpl = dlsym(v4, "VNDetectionPrintShapes");
      v2->_detectionPrintSupportedRevisionsImpl = dlsym(v4, "VNDetectionPrintSupportedRevisions");
    }
    scenePrintsFromPixelBuffersImpl = v2->_scenePrintsFromPixelBuffersImpl;
    if (scenePrintsFromPixelBuffersImpl)
    {
      scenePrintsFromPixelBuffersImpl = v2->_scenePrintsFromPixelBuffersUsesCPUOnlyImpl;
      if (scenePrintsFromPixelBuffersImpl)
      {
        scenePrintsFromPixelBuffersImpl = v2->_scenePrintElementCountImpl;
        if (scenePrintsFromPixelBuffersImpl) {
          LOBYTE(scenePrintsFromPixelBuffersImpl) = v2->_scenePrintLengthImpl != 0;
        }
      }
    }
    v2->_validForSceneprint = (char)scenePrintsFromPixelBuffersImpl;
    detectionPrintsFromPixelBuffersImpl = v2->_detectionPrintsFromPixelBuffersImpl;
    if (detectionPrintsFromPixelBuffersImpl)
    {
      detectionPrintsFromPixelBuffersImpl = v2->_detectionPrintsFromPixelBuffersUsesCPUOnlyImpl;
      if (detectionPrintsFromPixelBuffersImpl)
      {
        detectionPrintsFromPixelBuffersImpl = v2->_detectionPrintShapesImpl;
        if (detectionPrintsFromPixelBuffersImpl) {
          LOBYTE(detectionPrintsFromPixelBuffersImpl) = v2->_detectionPrintSupportedRevisionsImpl != 0;
        }
      }
    }
    v2->_validForObjectprint = (char)detectionPrintsFromPixelBuffersImpl;
  }
  return v2;
}

+ (id)addOrientation:(unsigned int)a3 toOptions:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = v6;
  if (v5) {
    [v6 addEntriesFromDictionary:v5];
  }
  v11 = @"VNImageOptionImageOrientation";
  BOOL v8 = [NSNumber numberWithUnsignedInt:v4];
  v12[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v7 addEntriesFromDictionary:v9];

  return v7;
}

+ (id)sharedHandle
{
  if (sharedHandle_onceToken_9641 != -1) {
    dispatch_once(&sharedHandle_onceToken_9641, &__block_literal_global_9642);
  }
  v2 = (void *)sharedHandle_singleton_9643;

  return v2;
}

@end