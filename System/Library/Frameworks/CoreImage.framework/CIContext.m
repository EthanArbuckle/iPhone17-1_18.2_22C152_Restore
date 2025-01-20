@interface CIContext
+ (BOOL)loadArchive:(id)a3;
+ (BOOL)loadArchiveWithName:(id)a3 fromURL:(id)a4;
+ (BOOL)loadArchiveWithURL:(id)a3;
+ (CGColorSpace)defaultGrayColorSpace;
+ (CGColorSpace)defaultRGBColorSpace;
+ (CGColorSpace)defaultWorkingColorSpace;
+ (CIContext)context;
+ (CIContext)contextWithCGContext:(CGContextRef)cgctx options:(NSDictionary *)options;
+ (CIContext)contextWithEAGLContext:(EAGLContext *)eaglContext;
+ (CIContext)contextWithEAGLContext:(EAGLContext *)eaglContext options:(NSDictionary *)options;
+ (CIContext)contextWithMTLCommandQueue:(id)commandQueue;
+ (CIContext)contextWithMTLCommandQueue:(id)commandQueue options:(NSDictionary *)options;
+ (CIContext)contextWithMTLDevice:(id)device;
+ (CIContext)contextWithMTLDevice:(id)device options:(NSDictionary *)options;
+ (CIContext)contextWithOptions:(NSDictionary *)options;
+ (id)_cachedContext:(id)a3 options:(id)a4;
+ (id)_namedCache;
+ (id)_singletonContext;
+ (int)_crashed_because_nonaddressable_memory_was_passed_to_render:(id)a3 toBitmap:(void *)a4 rowBytes:(int64_t)a5 bounds:(CGRect)a6 format:(int)a7 colorSpace:(CGColorSpace *)a8;
+ (void)clearArchives;
+ (void)internalCLContextWithOptions:(id)a3;
+ (void)internalCLContextWithOptions:(id)a3 glContext:(void *)a4;
+ (void)internalContextWithEAGLContext:(id)a3 options:(id)a4;
+ (void)internalContextWithMTLCommandQueue:(id)a3 options:(id)a4;
+ (void)internalContextWithMTLDevice:(id)a3 options:(id)a4;
+ (void)internalGLContextWithOptions:(id)a3;
+ (void)internalSWContextWithOptions:(id)a3;
+ (void)purgeArchive:(id)a3;
- (BOOL)_isCGBackedContext;
- (BOOL)_isGLBackedContext;
- (BOOL)isMetalBased;
- (BOOL)isOpenCLBased;
- (BOOL)isOpenGLBased;
- (BOOL)loadArchive:(id)a3;
- (BOOL)loadArchiveWithName:(id)a3 fromURL:(id)a4;
- (BOOL)loadArchiveWithURL:(id)a3;
- (BOOL)measureRequirementsOf:(id)a3 query:(int)a4 :(id *)a5 results:(CGRect *)a6;
- (BOOL)prepareRender:(CIImage *)image fromRect:(CGRect)fromRect toDestination:(CIRenderDestination *)destination atPoint:(CGPoint)atPoint error:(NSError *)error;
- (BOOL)testArchive:(id)a3;
- (BOOL)writeHEIF10RepresentationOfImage:(CIImage *)image toURL:(NSURL *)url colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr;
- (BOOL)writeHEIFRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr;
- (BOOL)writeJPEGRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr;
- (BOOL)writeOpenEXRRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)errorPtr;
- (BOOL)writePNGRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr;
- (BOOL)writeTIFFRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr;
- (CGAffineTransform)CTM;
- (CGColorSpace)_outputColorSpace;
- (CGColorSpaceRef)workingColorSpace;
- (CGImage)_createCGImage:(id)a3 fromRect:(CGRect)a4 format:(int)a5 premultiplied:(BOOL)a6 colorSpace:(CGColorSpace *)a7 deferred:(Trilean)a8 renderCallback:(id)a9;
- (CGImage)createCGImage:(id)a3 fromRect:(CGRect)a4 format:(int)a5;
- (CGImage)createCGImage:(id)a3 fromRect:(CGRect)a4 format:(int)a5 premultiplied:(BOOL)a6 colorSpace:(CGColorSpace *)a7 deferred:(BOOL)a8 renderCallback:(id)a9;
- (CGImageRef)createCGImage:(CIImage *)image fromRect:(CGRect)fromRect;
- (CGImageRef)createCGImage:(CIImage *)image fromRect:(CGRect)fromRect format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace;
- (CGImageRef)createCGImage:(CIImage *)image fromRect:(CGRect)fromRect format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace deferred:(BOOL)deferred;
- (CGLayerRef)createCGLayerWithSize:(CGSize)size info:(CFDictionaryRef)info;
- (CGRect)bounds;
- (CGSize)inputImageMaximumSize;
- (CGSize)outputImageMaximumSize;
- (CIContext)init;
- (CIContext)initWithCGContext:(CGContext *)a3 options:(id)a4;
- (CIContext)initWithEAGLContext:(id)a3;
- (CIContext)initWithEAGLContext:(id)a3 options:(id)a4;
- (CIContext)initWithMTLCommandQueue:(id)a3 options:(id)a4;
- (CIContext)initWithMTLDevice:(id)a3 options:(id)a4;
- (CIContext)initWithOptions:(NSDictionary *)options;
- (CIFilter)depthBlurEffectFilterForImage:(CIImage *)image disparityImage:(CIImage *)disparityImage portraitEffectsMatte:(CIImage *)portraitEffectsMatte hairSemanticSegmentation:(CIImage *)hairSemanticSegmentation glassesMatte:(CIImage *)glassesMatte gainMap:(CIImage *)gainMap orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (CIFilter)depthBlurEffectFilterForImage:(CIImage *)image disparityImage:(CIImage *)disparityImage portraitEffectsMatte:(CIImage *)portraitEffectsMatte hairSemanticSegmentation:(CIImage *)hairSemanticSegmentation orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (CIFilter)depthBlurEffectFilterForImage:(CIImage *)image disparityImage:(CIImage *)disparityImage portraitEffectsMatte:(CIImage *)portraitEffectsMatte orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options;
- (CIFilter)depthBlurEffectFilterForImageData:(NSData *)data options:(NSDictionary *)options;
- (CIFilter)depthBlurEffectFilterForImageURL:(NSURL *)url options:(NSDictionary *)options;
- (CIFormat)workingFormat;
- (CIRenderTask)startTaskToClear:(CIRenderDestination *)destination error:(NSError *)error;
- (CIRenderTask)startTaskToRender:(CIImage *)image fromRect:(CGRect)fromRect toDestination:(CIRenderDestination *)destination atPoint:(CGPoint)atPoint error:(NSError *)error;
- (CIRenderTask)startTaskToRender:(CIImage *)image toDestination:(CIRenderDestination *)destination error:(NSError *)error;
- (NSData)HEIF10RepresentationOfImage:(CIImage *)image colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr;
- (NSData)HEIFRepresentationOfImage:(CIImage *)image format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options;
- (NSData)JPEGRepresentationOfImage:(CIImage *)image colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options;
- (NSData)OpenEXRRepresentationOfImage:(CIImage *)image options:(NSDictionary *)options error:(NSError *)errorPtr;
- (NSData)PNGRepresentationOfImage:(CIImage *)image format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options;
- (NSData)TIFFRepresentationOfImage:(CIImage *)image format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options;
- (__IOSurface)createIOSurface:(id)a3;
- (__IOSurface)createIOSurface:(id)a3 fromRect:(CGRect)a4;
- (id)_CPUShadow;
- (id)_HEIFRepresentationOfImage:(id)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5 options:(id)a6 error:(id *)a7;
- (id)_JPEGRepresentationOfImage:(id)a3 colorSpace:(CGColorSpace *)a4 options:(id)a5 error:(id *)a6;
- (id)_PNGRepresentationOfImage:(id)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5 options:(id)a6 error:(id *)a7;
- (id)_TIFFRepresentationOfImage:(id)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5 options:(id)a6 error:(id *)a7;
- (id)_createClone;
- (id)_dataRepresentationOfImage:(id)a3 UTIType:(id)a4 format:(int)a5 premultiplied:(BOOL)a6 colorSpace:(CGColorSpace *)a7 options:(id)a8 addAuxData:(BOOL)a9 keysToMerge:(id)a10 error:(id *)a11;
- (id)_initWithInternalRepresentation:(void *)a3;
- (id)_pdfDataRepresentation;
- (id)_startTaskToRender:(id)a3 toDestination:(id)a4 forPrepareRender:(BOOL)a5 forClear:(BOOL)a6 error:(id *)a7;
- (id)addAuxOptionsForSDR:(id)a3 HDR:(id)a4 colorSpace:(CGColorSpace *)a5 rgbGainmap:(BOOL)a6;
- (id)clientCommandQueue;
- (id)createColorCubeDataForFilters:(id)a3 dimension:(int)a4;
- (id)createColorCubeDataForFilters:(id)a3 dimension:(int)a4 colorSpace:(CGColorSpace *)a5;
- (id)description;
- (id)device;
- (id)flatten:(id)a3 fromRect:(CGRect)a4 format:(int)a5 colorSpace:(CGColorSpace *)a6;
- (id)internalCommandQueue;
- (id)objectForKey:(id)a3;
- (unint64_t)identifier;
- (unint64_t)maximumInputImageSize;
- (unint64_t)maximumOutputImageSize;
- (void)_insertEventMarker:(const char *)a3;
- (void)_internalContext;
- (void)_performFaceDetection:(id)a3 image:(id)a4 orientation:(int)a5 filter:(id)a6;
- (void)abort;
- (void)clearCaches;
- (void)dealloc;
- (void)drawImage:(CIImage *)image atPoint:(CGPoint)atPoint fromRect:(CGRect)fromRect;
- (void)drawImage:(CIImage *)image inRect:(CGRect)inRect fromRect:(CGRect)fromRect;
- (void)lock;
- (void)render:(CIImage *)image toBitmap:(void *)data rowBytes:(ptrdiff_t)rowBytes bounds:(CGRect)bounds format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace;
- (void)render:(CIImage *)image toCVPixelBuffer:(CVPixelBufferRef)buffer;
- (void)render:(CIImage *)image toCVPixelBuffer:(CVPixelBufferRef)buffer bounds:(CGRect)bounds colorSpace:(CGColorSpaceRef)colorSpace;
- (void)render:(CIImage *)image toIOSurface:(IOSurfaceRef)surface bounds:(CGRect)bounds colorSpace:(CGColorSpaceRef)colorSpace;
- (void)render:(CIImage *)image toMTLTexture:(id)texture commandBuffer:(id)commandBuffer bounds:(CGRect)bounds colorSpace:(CGColorSpaceRef)colorSpace;
- (void)render:(id)a3;
- (void)render:(id)a3 toTexture:(unsigned int)a4 bounds:(CGRect)a5 colorSpace:(CGColorSpace *)a6;
- (void)render:(id)a3 toTexture:(unsigned int)a4 target:(unsigned int)a5 bounds:(CGRect)a6 colorSpace:(CGColorSpace *)a7;
- (void)setBounds:(CGRect)a3;
- (void)setCTM:(CGAffineTransform *)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)unlock;
@end

@implementation CIContext

- (id)_startTaskToRender:(id)a3 toDestination:(id)a4 forPrepareRender:(BOOL)a5 forClear:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  v134[3] = *MEMORY[0x1E4F143B8];
  [(CIContext *)self _gpuContextCheck];
  v13 = [(CIContext *)self _internalContext];
  if (!v13)
  {
    if (a7) {
      *a7 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIContextStartTask" code:1 userInfo:&unk_1EE4AB270];
    }
    v32 = ci_logger_api();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[CIContext(CIRenderDestination) _startTaskToRender:toDestination:forPrepareRender:forClear:error:](v32, v33, v34, v35, v36, v37, v38, v39);
    }
    return 0;
  }
  if (!a4)
  {
    if (a7) {
      *a7 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIContextStartTask" code:2 userInfo:&unk_1EE4AB298];
    }
    v48 = ci_logger_api();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      -[CIContext(CIRenderDestination) _startTaskToRender:toDestination:forPrepareRender:forClear:error:](v48, v49, v50, v51, v52, v53, v54, v55);
    }
    return 0;
  }
  v14 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![a4 _internalRepresentation])
  {
    if (a7) {
      *a7 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIContextStartTask" code:3 userInfo:&unk_1EE4AB2C0];
    }
    v40 = ci_logger_api();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[CIContext(CIRenderDestination) _startTaskToRender:toDestination:forPrepareRender:forClear:error:](v40, v41, v42, v43, v44, v45, v46, v47);
    }
    return 0;
  }
  [a3 extent];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v23 = (double)(unint64_t)[a4 width];
  v138.size.height = (double)(unint64_t)[a4 height];
  v138.origin.x = 0.0;
  v138.origin.y = 0.0;
  v135.origin.x = v16;
  v135.origin.y = v18;
  v135.size.width = v20;
  v135.size.height = v22;
  v138.size.width = v23;
  CGRect v136 = CGRectIntersection(v135, v138);
  if (CGRectIsEmpty(v136))
  {
    if (a7) {
      *a7 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIContextStartTask" code:4 userInfo:&unk_1EE4AB2E8];
    }
    v24 = ci_logger_api();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[CIContext(CIRenderDestination) _startTaskToRender:toDestination:forPrepareRender:forClear:error:].cold.4(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    return 0;
  }
  int v57 = [a4 format];
  v58 = [(CIContext *)self _internalContext];
  if ((*(unsigned int (**)(void *))(*(void *)v58 + 16))(v58) == 76
    && CI::format_is_not_supported_as_destination_on_gles(v57))
  {
    if (a7) {
      *a7 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIContextStartTask" code:5 userInfo:&unk_1EE4AB310];
    }
    v59 = ci_logger_api();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      -[CIContext(CIRenderDestination) _startTaskToRender:toDestination:forPrepareRender:forClear:error:].cold.5(v57);
    }
    return 0;
  }
  v60 = (CGColorSpace *)[a4 colorSpace];
  uint64_t v61 = [a4 alphaMode];
  int v125 = [a4 isClamped];
  int v62 = [a4 format];
  if (!CI_NO_CM() && CI::format_only_alpha(v62)) {
    v60 = 0;
  }
  if ([a3 isOpaque]) {
    uint64_t v63 = 1;
  }
  else {
    uint64_t v63 = v61;
  }
  uint64_t v126 = v63;
  context = (void *)MEMORY[0x199702DB0]();
  if (!CI_NO_CM())
  {
    v67 = (CGColorSpace *)objc_msgSend(a3, "baseColorSpace", context);
    if (CI::ColorSpace_is_HDR(v67, v68))
    {
      if (v60 && (CI::ColorSpace_is_HDR(v60, v69) & 1) == 0 && !CGColorSpaceUsesExtendedRange(v60)) {
        a3 = (id)objc_msgSend((id)objc_msgSend(a3, "imageByColorMatchingWorkingSpaceToColorSpace:", v67), "imageByToneMappingColorSpaceToWorkingSpace:", v67);
      }
    }
  }
  if (objc_msgSend(a4, "blendKernel", context))
  {
    uint64_t v64 = [a4 imageRepresentation];
    if (v64)
    {
      v65 = (void *)v64;
      if (objc_msgSend((id)objc_msgSend(a4, "blendKernel"), "isBackIfForeIsClear"))
      {
        [a3 extent];
        v65 = objc_msgSend(v65, "imageByCroppingToRect:");
      }
      if ((*(unsigned int (**)(void *))(*(void *)v14 + 16))(v14) == 76
        || [a4 isCompressed])
      {
        v65 = (void *)[v65 imageByInsertingIntermediate:0];
      }
      if ([a4 blendsInDestinationColorSpace])
      {
        if (v60 && !CI_NO_CM())
        {
          a3 = (id)[a3 imageByColorMatchingWorkingSpaceToRGBorGrayColorSpace:v60];
          v65 = (void *)[v65 imageByColorMatchingWorkingSpaceToRGBorGrayColorSpace:v60];
        }
        v66 = objc_msgSend((id)objc_msgSend(a4, "blendKernel"), "applyWithForeground:background:", a3, v65);
        goto LABEL_57;
      }
      a3 = (id)objc_msgSend((id)objc_msgSend(a4, "blendKernel"), "applyWithForeground:background:", a3, v65);
    }
  }
  if (v60 && !CI_NO_CM())
  {
    v66 = (void *)[a3 imageByColorMatchingWorkingSpaceToRGBorGrayColorSpace:v60];
LABEL_57:
    a3 = v66;
  }
  v70 = (CIImage *)objc_msgSend(a3, "imageByCroppingToRect:", 0.0, 0.0, (double)(unint64_t)objc_msgSend(a4, "width"), (double)(unint64_t)objc_msgSend(a4, "height"));
  v71 = v70;
  if (!v126)
  {
    [(CIImage *)v70 extent];
    v71 = -[CIImage imageBySettingAlphaOneInExtent:](v71, "imageBySettingAlphaOneInExtent:");
  }
  if (v125) {
    v71 = [(CIImage *)v71 _imageByClampingAlpha];
  }
  uint64_t v72 = [a4 _internalRepresentation];
  if (*(_DWORD *)(v72 + 28))
  {
    double v73 = *(double *)(v72 + 32);
    double v74 = *(double *)(v72 + 40);
    double v75 = *(double *)(v72 + 48);
    double v76 = *(double *)(v72 + 56);
    double v77 = *(double *)(v72 + 64);
    double v78 = *(double *)(v72 + 72);
    double v79 = *(double *)(v72 + 80);
    double v80 = *(double *)(v72 + 88);
    double v81 = *(double *)(v72 + 96);
    double v82 = *(double *)(v72 + 104);
    double v83 = *(double *)(v72 + 112);
    v132[0] = @"inputRVector";
    v133[0] = +[CIVector vectorWithX:v73 Y:v74 Z:v75];
    v132[1] = @"inputGVector";
    v133[1] = +[CIVector vectorWithX:v76 Y:v77 Z:v78];
    v132[2] = @"inputBVector";
    v133[2] = +[CIVector vectorWithX:v79 Y:v80 Z:v81];
    v132[3] = @"inputBiasVector";
    v133[3] = +[CIVector vectorWithX:v82 Y:v83 Z:v83];
    v71 = -[CIImage imageByApplyingFilter:withInputParameters:](v71, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v133 forKeys:v132 count:4]);
  }
  if ([a4 isDithered])
  {
    int v84 = [a4 ditherDepth];
    uint64_t v85 = [a4 colorSpace];
    v86 = +[CIKernel kernelWithInternalRepresentation:&CI::_destDither];
    double v87 = ldexp(1.0, -v84);
    if (v87 > 0.0009765625)
    {
      if (v85) {
        v71 = [(CIImage *)v71 imageByColorMatchingWorkingSpaceToColorSpace:v85];
      }
      v88 = [(CIImage *)v71 imageByUnpremultiplyingAlpha];
      v89 = [+[CIFilter filterWithName:@"CIRandomGenerator"] outputImage];
      [(CIImage *)v88 extent];
      double v91 = v90;
      double v93 = v92;
      double v95 = v94;
      double v97 = v96;
      v134[0] = v88;
      v134[1] = v89;
      v134[2] = [NSNumber numberWithDouble:v87];
      v98 = -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v86, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:3], v91, v93, v95, v97), "imageByPremultiplyingAlpha");
      v71 = v98;
      if (v85) {
        v71 = [(CIImage *)v98 imageByColorMatchingColorSpaceToWorkingSpace:v85];
      }
    }
  }
  if (v126 == 2) {
    v71 = [(CIImage *)v71 imageByUnpremultiplyingAlpha];
  }
  if ([a4 isFlipped])
  {
    v127[1] = 0;
    v127[2] = 0;
    v127[0] = 0x3FF0000000000000;
    long long v128 = xmmword_193951E50;
    double v129 = (double)(unint64_t)[a4 height];
    v71 = [(CIImage *)v71 imageByApplyingTransform:v127];
  }
  [(CIContext *)self lock];
  uint64_t v99 = [(CIImage *)v71 _internalRepresentation];
  v100 = [(CIContext *)self _internalContext];
  [(CIImage *)v71 extent];
  CGFloat v102 = v101;
  CGFloat v104 = v103;
  double v106 = v105;
  double v108 = v107;
  BOOL v109 = (*(unsigned int (**)(void *))(*v100 + 16))(v100) == 75 && *(unsigned char *)(v99 + 96) == 0;
  if ((*(unsigned int (**)(void *))(*v100 + 16))(v100) != 75)
  {
    BOOL v111 = 0;
LABEL_81:
    if (!v109 && !v111) {
      goto LABEL_83;
    }
    goto LABEL_82;
  }
  v137.origin.x = v102;
  v137.origin.y = v104;
  v137.size.width = v106;
  v137.size.height = v108;
  if (!CGRectIsInfinite(v137))
  {
    int v110 = CI_MAX_CPU_RENDER_SIZE();
    BOOL v111 = v106 * v108 > (double)(int)(CI_MAX_CPU_RENDER_SIZE() * v110);
    goto LABEL_81;
  }
LABEL_82:
  v100 = (void *)(*(uint64_t (**)(void *))(*v100 + 120))(v100);
LABEL_83:
  [(CIImage *)v71 extent];
  ++v100[19];
  v100[24] = 0;
  v100[20] = v112;
  v100[21] = v113;
  v100[22] = v114;
  v100[23] = v115;
  (*(void (**)(void *, void))(*v100 + 240))(v100, 0);
  if (v9) {
    *((_DWORD *)v100 + 86) = 1;
  }
  if ([a4 blendKernel] || v8)
  {
    int v117 = (*(uint64_t (**)(void *))(*v100 + 288))(v100);
    (*(void (**)(void *, void))(*v100 + 280))(v100, 0);
    v116 = (CI::Object *)[a4 _render:v99 withContext:v100];
    if (v117) {
      (*(void (**)(void *, uint64_t))(*v100 + 280))(v100, 1);
    }
  }
  else
  {
    v116 = (CI::Object *)[a4 _render:v99 withContext:v100];
  }
  if (v9) {
    *((_DWORD *)v100 + 86) = 0;
  }
  if (![(CIContext *)self clientCommandQueue]) {
    CI::RenderTask::waitUntilScheduled((intptr_t)v116);
  }
  [(CIContext *)self unlock];
  v118 = (const void *)*((void *)v116 + 16);
  if (v118)
  {
    CFStringRef v119 = (const __CFString *)CFRetain(v118);
    if (v119)
    {
      CI::Object::unref(v116);
      v120 = ci_logger_api();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
        -[CIContext(CIRenderDestination) _startTaskToRender:toDestination:forPrepareRender:forClear:error:].cold.6(v119);
      }
      if (a7)
      {
        v130 = @"CINonLocalizedDescriptionKey";
        CFStringRef v131 = v119;
        *a7 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CIContextRenderDestination", 5, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1));
      }
      else
      {
        CI::Context::AbortIfUnhandledError(v119, v121);
      }
      CFRelease(v119);
      return 0;
    }
  }
  v122 = [[CIRenderTask alloc] initWithInternalTask:v116];
  CI::Object::unref(v116);
  return v122;
}

- (void)_internalContext
{
  priv = (void **)self->_priv;
  if (priv) {
    return *priv;
  }
  else {
    return 0;
  }
}

- (id)clientCommandQueue
{
  if (*((unsigned char *)self->_priv + 72)) {
    return [(CIContext *)self internalCommandQueue];
  }
  else {
    return 0;
  }
}

- (id)internalCommandQueue
{
  v2 = [(CIContext *)self _internalContext];
  if ((*(unsigned int (**)(CI::MetalContext *))(*(void *)v2 + 16))(v2) != 77) {
    return 0;
  }

  return (id)CI::MetalContext::queue(v2);
}

- (void)unlock
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(CIContext *)self _internalContext];
  if (CI_KDEBUG())
  {
    (*(void (**)(void *))(*v3 + 272))(v3);
    kdebug_trace();
  }
  v4 = ci_signpost_log_render();
  os_signpost_id_t v5 = (*(uint64_t (**)(void *))(*v3 + 272))(v3) << 32;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v6 = v3[19];
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_signpost_emit_with_name_impl(&dword_193671000, v4, OS_SIGNPOST_INTERVAL_END, v5, "render_lock", "frame %lu", (uint8_t *)&v7, 0xCu);
  }
  CI::Context::endFrame((CI::Context *)v3);
  if (CI_ENABLE_METAL_CAPTURE()) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F351E0], "sharedCaptureManager"), "defaultCaptureScope"), "endScope");
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)self->_priv + 8));
}

- (void)lock
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)((char *)self->_priv + 8));
  v3 = [(CIContext *)self _internalContext];
  uint64_t v4 = v3[19] + 1;
  if (CI_KDEBUG())
  {
    (*(void (**)(void *))(*v3 + 272))(v3);
    kdebug_trace();
  }
  os_signpost_id_t v5 = ci_signpost_log_render();
  os_signpost_id_t v6 = (*(uint64_t (**)(void *))(*v3 + 272))(v3) << 32;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v7 = 134217984;
    uint64_t v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_193671000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "render_lock", "frame %lu", (uint8_t *)&v7, 0xCu);
  }
  if ((int)CI_PRINT_TIME() >= 2)
  {
    v3[41] = 0;
    *((CFAbsoluteTime *)v3 + 42) = CFAbsoluteTimeGetCurrent();
  }
  if (CI_ENABLE_METAL_CAPTURE()) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F351E0], "sharedCaptureManager"), "defaultCaptureScope"), "beginScope");
  }
}

- (CIRenderTask)startTaskToRender:(CIImage *)image fromRect:(CGRect)fromRect toDestination:(CIRenderDestination *)destination atPoint:(CGPoint)atPoint error:(NSError *)error
{
  double y = atPoint.y;
  double x = atPoint.x;
  double v11 = fromRect.origin.y;
  double v12 = fromRect.origin.x;
  v14 = -[CIImage imageByCroppingToRect:](image, "imageByCroppingToRect:", fromRect.origin.x, fromRect.origin.y, fromRect.size.width, fromRect.size.height);
  CGAffineTransformMakeTranslation(&v16, x - v12, y - v11);
  return [(CIContext *)self startTaskToRender:[(CIImage *)v14 imageByApplyingTransform:&v16] toDestination:destination error:error];
}

- (CIRenderTask)startTaskToRender:(CIImage *)image toDestination:(CIRenderDestination *)destination error:(NSError *)error
{
  return (CIRenderTask *)[(CIContext *)self _startTaskToRender:image toDestination:destination forPrepareRender:0 forClear:0 error:error];
}

- (CGImageRef)createCGImage:(CIImage *)image fromRect:(CGRect)fromRect
{
  double height = fromRect.size.height;
  double width = fromRect.size.width;
  double y = fromRect.origin.y;
  double x = fromRect.origin.x;
  v10 = CGColorSpaceRetain([(CIContext *)self _outputColorSpace]);
  double v11 = v10;
  if (!v10) {
    goto LABEL_5;
  }
  CGColorSpaceModel Model = CGColorSpaceGetModel(v10);
  if (Model != kCGColorSpaceModelRGB)
  {
    if (Model == kCGColorSpaceModelMonochrome)
    {
      v13 = &kCIFormatLA8;
      goto LABEL_9;
    }
LABEL_5:
    CGColorSpaceRelease(v11);
    double v11 = +[CIContext defaultRGBColorSpace];
    v13 = &kCIFormatRGBA8;
    goto LABEL_9;
  }
  BOOL v14 = CGColorSpaceUsesExtendedRange(v11);
  if (CGColorSpaceUsesITUR_2100TF(v11) || v14) {
    v13 = &kCIFormatRGBAh;
  }
  else {
    v13 = &kCIFormatRGBA8;
  }
LABEL_9:
  double v15 = -[CIContext createCGImage:fromRect:format:colorSpace:](self, "createCGImage:fromRect:format:colorSpace:", image, *v13, v11, x, y, width, height);
  CGColorSpaceRelease(v11);
  return v15;
}

- (CGImageRef)createCGImage:(CIImage *)image fromRect:(CGRect)fromRect format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace
{
  double height = fromRect.size.height;
  double width = fromRect.size.width;
  double y = fromRect.origin.y;
  double x = fromRect.origin.x;
  uint64_t v13 = CI::format_modernize(*(uint64_t *)&format, (CI *)"-[CIContext(createCGImage) createCGImage:fromRect:format:colorSpace:]", (const char *)image);
  uint64_t v14 = *(unsigned __int8 *)([(CIContext *)self _internalContext] + 40);

  return -[CIContext _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:](self, "_createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:", image, v13, v14, colorSpace, 0, 0, x, y, width, height);
}

- (CGImage)_createCGImage:(id)a3 fromRect:(CGRect)a4 format:(int)a5 premultiplied:(BOOL)a6 colorSpace:(CGColorSpace *)a7 deferred:(Trilean)a8 renderCallback:(id)a9
{
  BOOL v12 = a6;
  uint64_t v13 = *(void *)&a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v185 = *MEMORY[0x1E4F143B8];
  CGFloat v20 = (void *)MEMORY[0x199702DB0](self, a2);
  id v21 = a3;
  id v22 = a3;
  [(CIContext *)self _gpuContextCheck];
  v186.origin.CGFloat x = x;
  v186.origin.CGFloat y = y;
  v186.size.CGFloat width = width;
  v186.size.CGFloat height = height;
  CGRect v187 = CGRectStandardize(v186);
  if (!a3) {
    goto LABEL_4;
  }
  double v23 = v187.origin.x;
  double v24 = v187.origin.y;
  double v25 = v187.size.width;
  double v26 = v187.size.height;
  if (CGRectIsInfinite(v187)) {
    goto LABEL_4;
  }
  [a3 extent];
  v199.origin.CGFloat x = v27;
  v199.origin.CGFloat y = v28;
  v199.size.CGFloat width = v29;
  v199.size.CGFloat height = v30;
  v188.origin.CGFloat x = v23;
  v188.origin.CGFloat y = v24;
  v188.size.CGFloat width = v25;
  v188.size.CGFloat height = v26;
  CGRect v189 = CGRectIntersection(v188, v199);
  if (CGRectIsEmpty(v189))
  {
LABEL_4:
    v32 = 0;
    goto LABEL_5;
  }
  uint64_t v34 = CI::format_modernize(v13, (CI *)"-[CIContext(_createCGImageInternal) _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:]", v31);
  if (CI::format_CGBitmapInfo(v34, 1) == -1)
  {
    uint64_t v35 = ci_logger_api();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[CIContext(_createCGImageInternal) _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:](v34);
    }
    goto LABEL_4;
  }
  uint64_t v36 = [(CIContext *)self _internalContext];
  if ((*(unsigned int (**)(void *))(*(void *)v36 + 16))(v36) == 76
    && CI::format_is_not_supported_as_destination_on_gles(v34))
  {
    uint64_t v37 = ci_logger_api();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[CIContext(_createCGImageInternal) _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:](v34);
    }
    goto LABEL_4;
  }
  if (!a7) {
    goto LABEL_21;
  }
  uint64_t v38 = v34;
  CFTypeID TypeID = CGColorSpaceGetTypeID();
  if (TypeID != CFGetTypeID(a7) || !CGColorSpaceSupportsOutput(a7))
  {
LABEL_18:
    uint64_t v42 = ci_logger_api();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[CIContext(_createCGImageInternal) _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:].cold.5(v42, v43, v44, v45, v46, v47, v48, v49);
    }
    goto LABEL_4;
  }
  int is_luminance = CI::format_is_luminance(v38);
  CGColorSpaceModel Model = CGColorSpaceGetModel(a7);
  if (!is_luminance)
  {
    uint64_t v34 = v38;
    if (Model == kCGColorSpaceModelRGB) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  uint64_t v34 = v38;
  if (Model) {
    goto LABEL_18;
  }
LABEL_21:
  v190.origin.CGFloat x = v23;
  v190.origin.CGFloat y = v24;
  v190.size.CGFloat width = v25;
  v190.size.CGFloat height = v26;
  CGFloat MidY = CGRectGetMidY(v190);
  v160[1] = 0;
  v160[2] = 0;
  v160[0] = 0x3FF0000000000000;
  long long v161 = xmmword_193951E50;
  double v162 = MidY + MidY;
  v159 = (void *)[a3 imageByApplyingTransform:v160];
  uint64_t v51 = [(CIContext *)self _internalContext];
  uint64_t v52 = v51;
  id v53 = &__block_literal_global_12;
  if (a9) {
    id v53 = a9;
  }
  v155 = v53;
  if ((*(unsigned int (**)(uint64_t *))(*v51 + 552))(v51)) {
    char var0 = a8.var0;
  }
  else {
    char var0 = -1;
  }
  if (v34 == 784 || v34 == 785) {
    char v56 = -1;
  }
  else {
    char v56 = var0;
  }
  uint64_t v180 = 0;
  v181 = &v180;
  uint64_t v182 = 0x2020000000;
  uint64_t v183 = 0;
  uint64_t v57 = [v159 _internalRepresentation];
  if ([v159 isOpaque])
  {
    [v159 extent];
    v200.origin.CGFloat x = v23;
    v200.origin.CGFloat y = v24;
    v200.size.CGFloat width = v25;
    v200.size.CGFloat height = v26;
    if (CGRectContainsRect(v191, v200))
    {
      if (v34 == 264) {
        unsigned int v58 = 268;
      }
      else {
        unsigned int v58 = v34;
      }
      if (v58 == 266) {
        unsigned int v58 = 270;
      }
      if (v58 == 265) {
        unsigned int v58 = 269;
      }
      if (v58 == 267) {
        unsigned int v58 = 271;
      }
      if (v58 == 784) {
        unsigned int v58 = 775;
      }
      if (v58 == 1800) {
        unsigned int v58 = 1804;
      }
      if (v58 == 2056) {
        unsigned int v58 = 2060;
      }
      if (v58 == 2312) {
        unsigned int v58 = 2316;
      }
      if (v58 == 260) {
        unsigned int v58 = 259;
      }
      if (v58 == 1796) {
        unsigned int v58 = 1795;
      }
      if (v58 == 2052) {
        unsigned int v58 = 2051;
      }
      if (v58 == 2308) {
        uint64_t v34 = 2307;
      }
      else {
        uint64_t v34 = v58;
      }
    }
  }
  if (v12) {
    uint64_t v59 = 1;
  }
  else {
    uint64_t v59 = 2;
  }
  if (CI::format_has_unpremul_alpha(v34))
  {
    uint64_t v60 = 2;
  }
  else if (CI::format_has_alpha(v34))
  {
    uint64_t v60 = v59;
  }
  else
  {
    uint64_t v60 = 0;
  }
  uint64_t v156 = v60;
  CI::Context::swizzler_for_output((uint64_t)v52, v34, 0, v179);
  unint64_t v157 = vcvtpd_u64_f64(v26);
  unint64_t v158 = vcvtpd_u64_f64(v25);
  v178[0] = 0x3FF0000000000000;
  v178[1] = 0;
  v178[2] = 0;
  v178[3] = 0x3FF0000000000000;
  *(double *)&v178[4] = -v23;
  *(double *)&v178[5] = -v24;
  __int32 v176 = v179[0].i32[0];
  __int16 v177 = 0;
  int v61 = strcmp((const char *)v52 + 236, "CoreUI");
  if (*(unsigned char *)(v57 + 97))
  {
    int v62 = v61;
    [(CIContext *)self lock];
    ++v52[19];
    v52[24] = 0;
    *((double *)v52 + 20) = v23;
    *((double *)v52 + 21) = v24;
    *((double *)v52 + 22) = v25;
    *((double *)v52 + 23) = v26;
    (*(void (**)(uint64_t *, void))(*v52 + 240))(v52, 0);
    v192.origin.CGFloat x = (*(double (**)(uint64_t))(*(void *)v57 + 88))(v57);
    CGRect v193 = CGRectIntegral(v192);
    v201.origin.CGFloat x = v23;
    v201.origin.CGFloat y = v24;
    v201.size.CGFloat width = v25;
    v201.size.CGFloat height = v26;
    if (!CGRectContainsRect(v193, v201))
    {
LABEL_81:
      [(CIContext *)self unlock];
      goto LABEL_82;
    }
    uint64_t v63 = ci_signpost_log_render();
    unsigned int v153 = v34;
    os_signpost_id_t v64 = (*(uint64_t (**)(uint64_t *))(*v52 + 272))(v52) << 32;
    if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v63, OS_SIGNPOST_INTERVAL_BEGIN, v64, "create_cgimage_check", "", buf, 2u);
    }
    uint64_t v65 = (*(uint64_t (**)(uint64_t *))(*v52 + 272))(v52);
    TimerBase::TimerBase((uint64_t)v184, v65, 0, (uint64_t)"create_cgimage_check", 0);
    v194.origin.CGFloat x = v23;
    v194.origin.CGFloat y = v24;
    v194.size.CGFloat width = (double)v158;
    v194.size.CGFloat height = (double)v157;
    double v66 = CI::Affine::applyToRect((CI::Affine *)v178, v194);
    CGFloat v151 = v67;
    CGFloat v152 = v68;
    CGFloat v69 = v66;
    CGFloat v71 = v70;
    v175[0] = v179[0];
    v175[1] = v179[1];
    v175[2] = v179[2];
    uint64_t v72 = CI::prepare_initial_graph(v52, "create_cgimage_check", (unsigned int *)v57, 0, a7, v153, (uint64_t)v175, (char *)v178, v23, v24, (double)v158, (double)v157, 1u, (uint64_t)&v176);
    double v74 = (double *)v72;
    if (!v62 && v56 == -1)
    {
LABEL_75:
      double v75 = (CGImage *)v181[3];
      if (v75)
      {
        CGImageGetColorSpace(v75);
        if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
        {
          CFAutorelease((CFTypeRef)v181[3]);
          CGImageRef CopyWithColorSpace = CGImageCreateCopyWithColorSpace((CGImageRef)v181[3], a7);
          v181[3] = (uint64_t)CopyWithColorSpace;
        }
      }
      CI::traverse_releasing_resources((CI *)v74, v73);
      if (v74) {
        CI::Object::unref((CI::Object *)v74);
      }
      CI::create_cgimage(CIContext *,CIImage *,CGRect,CGColorSpace *,int,BOOL,CI::Trilean,void({block_pointer})(CGRect,NSError *))::SignpostTimer::~SignpostTimer((TimerBase *)v184);
      uint64_t v34 = v153;
      goto LABEL_81;
    }
    if ((*(unsigned int (**)(const CI::Context *))(*(void *)v72 + 16))(v72) == 28)
    {
      if (v74[7] != 1.0
        || v74[8] != 0.0
        || v74[9] != 0.0
        || v74[10] != 1.0
        || vabdd_f64(v74[11], round(v74[11])) >= 1.0e-10
        || vabdd_f64(v74[12], round(v74[12])) >= 1.0e-10)
      {
        goto LABEL_75;
      }
      CI::Affine::inverse((CI::Affine *)(v74 + 7), (double *)buf);
      v195.origin.CGFloat x = v69;
      v195.origin.CGFloat y = v71;
      v195.size.CGFloat width = v151;
      v195.size.CGFloat height = v152;
      double v85 = CI::Affine::applyToRect((CI::Affine *)buf, v195);
      CGFloat v151 = v86;
      CGFloat v152 = v87;
      CGFloat v69 = v85;
      CGFloat v71 = v88;
      v89 = (double *)(*(uint64_t (**)(double *, void))(*(void *)v74 + 48))(v74, 0);
    }
    else
    {
      v89 = v74;
    }
    if ((*(unsigned int (**)(double *))(*(void *)v89 + 16))(v89) == 31
      || (*(unsigned int (**)(double *))(*(void *)v89 + 16))(v89) == 32)
    {
      v89 = (double *)(*(uint64_t (**)(double *, void))(*(void *)v89 + 48))(v89, 0);
    }
    if ((*(unsigned int (**)(double *))(*(void *)v89 + 16))(v89) == 47)
    {
      unsigned int v90 = (*(uint64_t (**)(double *))(*(void *)v89 + 408))(v89);
      if (v90 > 0xF || ((1 << v90) & 0xFC2B) == 0) {
        goto LABEL_75;
      }
      v89 = (double *)(*(uint64_t (**)(double *, void))(*(void *)v89 + 48))(v89, 0);
    }
    if ((*(unsigned int (**)(double *))(*(void *)v89 + 16))(v89) == 29)
    {
      double v91 = (CGImage *)*((void *)v89 + 13);
      CGFloat v92 = (*(double (**)(double *))(*(void *)v89 + 168))(v89);
      v147 = v94;
      CGFloat v149 = v93;
      CGFloat v95 = v92;
      CGFloat v97 = v96;
      int v99 = CI::format_from_CGImage((uint64_t)v91, v98);
      if (CI::format_has_alpha(v99)) {
        int has_alpha = CI::format_has_alpha(v153);
      }
      else {
        int has_alpha = 1;
      }
      if CI::format_is_rgb(v99) && (CI::format_is_rgb(v153))
      {
        int v146 = 1;
      }
      else if (CI::format_is_luminance(v99))
      {
        int v146 = CI::format_is_luminance(v153);
      }
      else
      {
        int v146 = 0;
      }
      int v113 = CI::format_bits_per_component(v99);
      int v114 = CI::format_bits_per_component(v153);
      if (CGImageGetProperty() != *MEMORY[0x1E4F1CFD0] || v56 != -1)
      {
        v196.origin.CGFloat x = v95;
        v196.origin.CGFloat y = v97;
        *(void *)&v196.size.CGFloat height = v147;
        v196.size.CGFloat width = v149;
        v202.origin.CGFloat x = v69;
        v202.origin.CGFloat y = v71;
        v202.size.CGFloat width = v151;
        v202.size.CGFloat height = v152;
        if ((CGRectContainsRect(v196, v202) & has_alpha & v146) == 1 && v113 == v114)
        {
          v197.origin.CGFloat x = v69;
          v197.origin.CGFloat y = v71;
          v197.size.CGFloat width = v151;
          v197.size.CGFloat height = v152;
          CGImageRef v115 = CGImageCreateWithImageInRect(v91, v197);
          v181[3] = (uint64_t)v115;
        }
      }
    }
    else if ((*(unsigned int (**)(double *))(*(void *)v89 + 16))(v89) == 46)
    {
      v148 = (CI *)*((void *)v89 + 7);
      CGFloat v104 = (*(double (**)(double *))(*(void *)v89 + 168))(v89);
      CGFloat v144 = v106;
      CGFloat v145 = v105;
      CGFloat v107 = v104;
      CGFloat v109 = v108;
      BOOL v139 = (*(uint64_t (**)(double *))(*(void *)v89 + 416))(v89) != 2;
      int v111 = CI::format_from_IOSurface(v148, v110);
      int v140 = CI::format_CGBitmapInfo(v111, v139);
      int v150 = v111;
      int v112 = CI::format_has_alpha(v111) ? CI::format_has_alpha(v153) : 1;
      int v143 = v112;
      if CI::format_is_rgb(v150) && (CI::format_is_rgb(v153)) {
        int v142 = 1;
      }
      else {
        int v142 = CI::format_is_luminance(v150) ? CI::format_is_luminance(v153) : 0;
      }
      int v141 = CI::format_bits_per_component(v150);
      int v128 = CI::format_bits_per_component(v153);
      v198.origin.CGFloat x = v107;
      v198.origin.CGFloat y = v109;
      v198.size.CGFloat height = v144;
      v198.size.CGFloat width = v145;
      v203.origin.CGFloat x = v69;
      v203.origin.CGFloat y = v71;
      v203.size.CGFloat width = v151;
      v203.size.CGFloat height = v152;
      if ((CGRectEqualToRect(v198, v203) & v143 & v142) == 1 && v141 == v128 && v140 != -1)
      {
        if (((*(unsigned int (**)(double *))(*(void *)v89 + 416))(v89)
           || (CI::format_has_alpha(v153) & 1) == 0)
          && (CI::format_has_alpha(v150) & 1) != 0
          || (uint64_t v129 = CGImageCreateFromIOSurface(), (v181[3] = v129) == 0))
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          uint64_t v165 = 3221225472;
          v166 = ___ZN2CIL14create_cgimageEP9CIContextP7CIImage6CGRectP12CGColorSpaceibNS_7TrileanEU13block_pointerFvS4_P7NSErrorE_block_invoke;
          v167 = &unk_1E5771398;
          int v172 = v150;
          unsigned int v173 = v153;
          BOOL v174 = v139;
          v170 = v52;
          v171 = a7;
          v168 = &v180;
          v169 = v89;
          if (SurfaceApplyPlaneReadOnlyBlock(v148, (uint64_t)buf))
          {
            v130 = ci_logger_render();
            if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
              -[CIContext(_createCGImageInternal) _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:].cold.4(v130, (uint64_t)v73, v131, v132, v133, v134, v135, v136);
            }
          }
        }
      }
    }
    goto LABEL_75;
  }
LABEL_82:
  if (v56 != 1)
  {
    unint64_t v77 = v157;
    if (v158 > v157) {
      unint64_t v77 = v158;
    }
    if (v56 == -1 || v77 <= 0x1000)
    {
      if (v181[3])
      {
        if (!CGImageGetImageProvider()) {
          goto LABEL_190;
        }
        CGImageRelease((CGImageRef)v181[3]);
      }
      uint64_t valuePtr = 0;
      double v81 = [(CIContext *)self _internalContext];
      int v82 = CI_IOSURFACE_WRAPPING(2u);
      uint64_t v83 = *v81;
      if (v82) {
        int v84 = (void (**)(void *, uint64_t))(v83 + 544);
      }
      else {
        int v84 = (void (**)(void *, uint64_t))(v83 + 528);
      }
      (*v84)(v81, v34);
      CI::format_bytes_per_pixel(v34);
      double v101 = ci_signpost_log_render();
      os_signpost_id_t v102 = (*(uint64_t (**)(uint64_t *))(*v81 + 272))(v81) << 32;
      if (v102 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
      {
        *(_DWORD *)v184 = 134218240;
        *(void *)&v184[4] = v158;
        *(_WORD *)&v184[12] = 2048;
        *(void *)&v184[14] = v157;
        _os_signpost_emit_with_name_impl(&dword_193671000, v101, OS_SIGNPOST_INTERVAL_BEGIN, v102, "new_bitmap", "[%zu %zu]", v184, 0x16u);
      }
      uint64_t v103 = (*(uint64_t (**)(uint64_t *))(*v81 + 272))(v81);
      TimerBase::TimerBase((uint64_t)v184, v103, 0, (uint64_t)"new_bitmap", 0);
      operator new();
    }
  }
  if (v181[3]) {
    goto LABEL_190;
  }
  id v78 = [(CIContext *)self _createClone];
  uint64_t v154 = [v78 _internalContext];
  char v79 = 0;
  if ((int)v34 > 1794)
  {
    if ((int)v34 <= 2306)
    {
      int v80 = v34;
      switch((int)v34)
      {
        case 1795:
          goto LABEL_158;
        case 1796:
        case 1800:
        case 1804:
          goto LABEL_162;
        case 1797:
        case 1798:
        case 1802:
        case 1803:
          goto LABEL_208;
        case 1799:
          char v79 = 0;
          int v80 = 1804;
          goto LABEL_162;
        case 1801:
          char v79 = 0;
          int v80 = 1800;
          goto LABEL_162;
        default:
          int v80 = v34;
          switch((int)v34)
          {
            case 2051:
              goto LABEL_127;
            case 2052:
            case 2056:
            case 2060:
              goto LABEL_162;
            case 2055:
              char v79 = 0;
              int v80 = 2060;
              goto LABEL_162;
            default:
              goto LABEL_208;
          }
      }
    }
    int v80 = v34;
    switch((int)v34)
    {
      case 2307:
        goto LABEL_127;
      case 2308:
      case 2312:
      case 2316:
        goto LABEL_162;
      case 2309:
      case 2310:
      case 2314:
      case 2315:
        goto LABEL_208;
      case 2311:
        char v79 = 0;
        int v80 = 2316;
        goto LABEL_162;
      case 2313:
        char v79 = 0;
        int v80 = 2312;
        goto LABEL_162;
      default:
        if (v34 == 3331) {
          goto LABEL_158;
        }
        goto LABEL_208;
    }
  }
  if ((int)v34 <= 770)
  {
    int v80 = v34;
    switch((int)v34)
    {
      case 259:
LABEL_127:
        char v79 = 1;
        int v80 = v34;
        goto LABEL_162;
      case 260:
      case 264:
      case 268:
        goto LABEL_162;
      case 263:
      case 269:
      case 270:
      case 271:
        char v79 = 0;
        int v80 = 268;
        goto LABEL_162;
      case 265:
      case 266:
      case 267:
        char v79 = 0;
        int v80 = 264;
        goto LABEL_162;
      default:
        goto LABEL_208;
    }
  }
  if ((int)v34 > 783)
  {
    int v80 = v34;
    if (v34 != 784)
    {
      if (v34 != 785) {
        goto LABEL_208;
      }
      char v79 = 0;
      int v80 = 784;
    }
  }
  else if (v34 == 771)
  {
LABEL_158:
    char v79 = 1;
    int v80 = 1795;
  }
  else
  {
    int v80 = v34;
    if (v34 != 775)
    {
LABEL_208:
      CGRect v137 = ci_logger_render();
      if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
      {
        CGRect v138 = CI::name_for_format(v34);
        -[CIContext(_createCGImageInternal) _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:]((uint64_t)v138, v184, v137);
      }
      goto LABEL_188;
    }
  }
LABEL_162:
  if ((CI::format_is_half_float(v34) & 1) == 0 && (CI::format_is_full_float(v34) & 1) == 0 && v80 != 775 && v80 != 784) {
    CI::format_is_deep(v34);
  }
  Mutable = CFDictionaryCreateMutable(0, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (CI::format_has_alpha(v34))
  {
    if (v156 == 1)
    {
      v118 = (__CFDictionary **)MEMORY[0x1E4F1DD78];
      goto LABEL_174;
    }
    if (v156 == 2)
    {
      v118 = (__CFDictionary **)MEMORY[0x1E4F1DD68];
LABEL_174:
      __CFDictionary::setValue(Mutable, *v118, (const __CFString *)1, v117);
    }
  }
  else if ((v79 & 1) == 0)
  {
    v118 = (__CFDictionary **)MEMORY[0x1E4F1DD70];
    goto LABEL_174;
  }
  *(_OWORD *)v184 = xmmword_1EE461CB8;
  *(_OWORD *)&v184[16] = *(_OWORD *)&off_1EE461CC8;
  CFStringRef v119 = malloc_type_calloc(1uLL, 0x50uLL, 0x108004010BCB57AuLL);
  *CFStringRef v119 = v78;
  v119[1] = v159;
  *((_DWORD *)v119 + 4) = v80;
  v119[3] = v156;
  *((double *)v119 + 4) = v23;
  *((double *)v119 + 5) = v24;
  *((double *)v119 + 6) = v25;
  *((double *)v119 + 7) = v26;
  v119[9] = _Block_copy(v155);
  v120 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v119[8] = dispatch_queue_create("CI_CGImageProviderCallbackQueue", v120);
  if (CGImageProviderCreate())
  {
    CGImageProviderSetProperty();
    unint64_t v122 = CI::format_bytes_per_row(v34, v158);
    if (v122)
    {
      unint64_t v123 = (*(uint64_t (**)(uint64_t))(*(void *)v154 + 488))(v154) / (2 * v122);
      if ((int)v123 >= (int)(0x4000000 / v122)) {
        LODWORD(v123) = 0x4000000 / v122;
      }
      if ((int)v123 >= (int)v157) {
        LODWORD(v123) = v157;
      }
      LODWORD(valuePtr) = v123;
      CFNumberRef v124 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CGImageProviderSetProperty();
      if (v124) {
        CFRelease(v124);
      }
    }
    uint64_t v125 = CGImageCreateWithImageProvider();
    CGImageProviderRelease();
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v125) {
      CGImageSetProperty();
    }
    goto LABEL_189;
  }
  CI::_providerInfoReleaseCallback((CI *)v119, v121);
LABEL_188:
  uint64_t v125 = 0;
LABEL_189:
  v181[3] = v125;

LABEL_190:
  [v159 contentHeadroom];
  float v127 = v126;
  if (!CGColorSpaceIsPQBased(a7) && !CGColorSpaceUsesITUR_2100TF(a7) && CGColorSpaceUsesExtendedRange(a7)) {
    CI::format_is_float(v34);
  }
  if (v127 >= 1.0) {
    CGImageSetHeadroom();
  }
  v32 = (CGImage *)v181[3];
  _Block_object_dispose(&v180, 8);
LABEL_5:
  return v32;
}

- (CGColorSpace)_outputColorSpace
{
  result = [(CIContext *)self _internalContext];
  if (result) {
    return (CGColorSpace *)*((void *)result + 2);
  }
  return result;
}

- (CIContext)initWithOptions:(NSDictionary *)options
{
  os_signpost_id_t v5 = (void *)MEMORY[0x199702DB0](self, a2);
  v34.receiver = self;
  v34.super_class = (Class)CIContext;
  os_signpost_id_t v6 = [(CIContext *)&v34 init];
  if (!v6) {
    goto LABEL_53;
  }
  int v7 = objc_msgSend(-[NSDictionary valueForKey:](options, "valueForKey:", @"CoreUI"), "BOOLValue");
  if (can_use_metal()) {
    BOOL v8 = objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", @"software_renderer"), "intValue") == 2;
  }
  else {
    BOOL v8 = 0;
  }
  if ((isWidget() & 1) == 0 && !v8)
  {
    if (!v7) {
      goto LABEL_14;
    }
    if (isSWAllowList(void)::onceToken != -1) {
      dispatch_once(&isSWAllowList(void)::onceToken, &__block_literal_global_356);
    }
    if (isSWAllowList(void)::allowed != 1)
    {
LABEL_14:
      if (can_use_metal() & 1) != 0 || (CIGLIsUsable())
      {
        if (options) {
          id v11 = [(NSDictionary *)options objectForKey:@"software_renderer"];
        }
        else {
          id v11 = 0;
        }
        id v12 = (id)MEMORY[0x1E4F1CC38];
        uint64_t v13 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:options];
        [v13 removeObjectForKey:@"software_renderer"];
        if (v11 == v12 || v11 == &unk_1EE4AA5F8) {
          [v13 setValue:MEMORY[0x1E4F1CC38] forKey:@"priority_request_low"];
        }
        id v14 = [(NSDictionary *)options objectForKeyedSubscript:@"kCIContextUseMetalRenderer"];
        if (v14)
        {
          int v15 = [v14 BOOLValue] ^ 1;
          char v16 = v15;
        }
        else
        {
          LOBYTE(v15) = 0;
          char v16 = 1;
        }
        int v17 = CI_ENABLE_METAL_GPU();
        CGFloat v18 = 0;
        if ((v15 & 1) == 0 && v17)
        {
          if (options) {
            [(NSDictionary *)options objectForKey:@"kCIContextAllowLowPower"];
          }
          id v27 = CIMetalCopyDefaultDevice();
          if (v27)
          {
            CGFloat v29 = v27;
            if (CIMetalDeviceIsSupported(v27, v28)) {
              CGFloat v18 = +[CIContext internalContextWithMTLDevice:v29 options:v13];
            }
            else {
              CGFloat v18 = 0;
            }
            CFRelease(v29);
          }
          else
          {
            CGFloat v18 = 0;
          }
        }
        if (v18) {
          char v30 = 1;
        }
        else {
          char v30 = v16;
        }
        if ((v30 & 1) != 0
          && (v18
           || (CGFloat v18 = +[CIContext internalGLContextWithOptions:v13]) != 0))
        {
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __29__CIContext_initWithOptions___block_invoke;
          v33[3] = &__block_descriptor_40_e8_v12__0B8l;
          v33[4] = v18;
          OptionIsTrueOrFalse(options, @"kCIContextEnableBlending", (uint64_t)v33);
          os_signpost_id_t v6 = [(CIContext *)v6 _initWithInternalRepresentation:v18];
          if (CI_ENABLE_METAL_GPU()) {
            char v31 = v15;
          }
          else {
            char v31 = 1;
          }
          if ((v31 & 1) == 0
            && objc_msgSend(-[NSDictionary valueForKey:](options, "valueForKey:", @"CoreUI"), "BOOLValue"))
          {
            [(CIContext *)v6 loadArchive:@"coreui_archive"];
          }
          v10 = v18;
          goto LABEL_49;
        }
      }
      else
      {
        double v19 = ci_logger_api();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[CIContext initWithOptions:](v19, v20, v21, v22, v23, v24, v25, v26);
        }
      }

      os_signpost_id_t v6 = 0;
      goto LABEL_53;
    }
  }
  uint64_t v9 = +[CIContext internalSWContextWithOptions:options];
  os_signpost_id_t v6 = [(CIContext *)v6 _initWithInternalRepresentation:v9];
  if (!v9) {
    goto LABEL_50;
  }
  v10 = v9;
LABEL_49:
  CI::Object::unref(v10);
LABEL_50:
  if (v6) {
    CoreAnalytics(&cfstr_Initwithoption.isa, v6);
  }
LABEL_53:
  return v6;
}

+ (void)internalContextWithMTLCommandQueue:(id)a3 options:(id)a4
{
  if (a3)
  {
    v26[0] = 0;
    GetOutputColorSpaceFromOptions((NSDictionary *)a4, v26);
    if (v26[0])
    {
      GetWorkingColorSpaceFromOptions((NSDictionary *)a4, v26);
      if (v26[0])
      {
        os_signpost_id_t v5 = (void *)[a4 valueForKey:@"working_format"];
        int v7 = v5;
        if (v5) {
          uint64_t v8 = [v5 intValue];
        }
        else {
          uint64_t v8 = 0;
        }
        int v9 = CI::format_modernize(v8, (CI *)"+[CIContext(Internal) internalContextWithMTLCommandQueue:options:]", v6);
        if (v7)
        {
          BOOL v10 = v9 == 266 || v9 == 264;
          BOOL v11 = v10 || v9 == 2056;
          if (!v11 && v9 != 2312)
          {
            uint64_t v13 = CI::name_for_format(v9);
            id v14 = ci_logger_api();
            BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
            if (v13)
            {
              if (v15) {
                +[CIContext(Internal) internalContextWithMTLCommandQueue:options:]();
              }
            }
            else if (v15)
            {
              +[CIContext(Internal) internalContextWithMTLCommandQueue:options:](v14, v16, v17, v18, v19, v20, v21, v22);
            }
          }
        }
        if (a4)
        {
          [a4 objectForKey:@"output_premultiplied"];
          [a4 objectForKey:@"kCIContextAllowHalfPrecision"];
        }
        uint64_t v23 = (void *)[a4 objectForKey:@"kCIContextIntermediateMemoryTarget"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v23 intValue];
        }
        else if (defaultIntermediateMemoryTarget(void)::onceToken != -1)
        {
          dispatch_once(&defaultIntermediateMemoryTarget(void)::onceToken, &__block_literal_global_402);
        }
        uint64_t v24 = (void *)[a4 objectForKey:@"kCIContextMemoryLimit"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v24 intValue];
        }
        objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"kCIContextIOSurfaceMemoryPoolID"), "unsignedIntValue");
        operator new();
      }
    }
  }
  return 0;
}

- (id)_initWithInternalRepresentation:(void *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v25.receiver = self;
    v25.super_class = (Class)CIContext;
    uint64_t v4 = [(CIContext *)&v25 init];
    if (v4)
    {
      if ((v4->_priv = malloc_type_calloc(1uLL, 0x58uLL, 0x1020040347FB3B5uLL),
            *(void *)v4->_priv = CI::Object::ref((uint64_t)a3),
            pthread_mutex_init((pthread_mutex_t *)((char *)v4->_priv + 8), 0),
            CI_PRINT_TREE())
        && (int v5 = (*(uint64_t (**)(void *))(*(void *)a3 + 272))(a3),
            CI_PRINT_TREE_context(v5, (char *)a3 + 236))
        || CI_PRINT_TIME()
        && (int v6 = (*(uint64_t (**)(void *))(*(void *)a3 + 272))(a3),
            CI_PRINT_TIME_context(v6, (char *)a3 + 236)))
      {
        {
          log_context_creation(CI::Context *)::isInternalBuild = os_variant_has_internal_content();
        }
        if (log_context_creation(CI::Context *)::isInternalBuild)
        {
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v28 = 0u;
          memset(buf, 0, sizeof(buf));
          int v7 = backtrace((void **)buf, 32);
          if (dladdr(*(const void **)buf, &v26)) {
            dli_fbase = v26.dli_fbase;
          }
          else {
            dli_fbase = 0;
          }
          if (v7 >= 2)
          {
            int v9 = (char *)(v7 - 1);
            BOOL v10 = (const void **)&buf[8];
            while (dladdr(*v10, &v26))
            {
              if (v26.dli_fbase != dli_fbase)
              {
                if (v26.dli_fname) {
                  int v9 = strrchr((char *)v26.dli_fname, 47);
                }
                else {
                  int v9 = 0;
                }
                int v11 = 1;
                goto LABEL_20;
              }
              ++v10;
              if (!--v9)
              {
                int v11 = 0;
                goto LABEL_20;
              }
            }
          }
          int v11 = 0;
          int v9 = 0;
LABEL_20:
          if ((v11 & (v26.dli_sname != 0)) != 0) {
            dli_sname = v26.dli_sname;
          }
          else {
            dli_sname = "";
          }
        }
        else
        {
          int v11 = 0;
          int v9 = 0;
          dli_sname = "";
        }
        uint64_t v13 = ci_logger_api();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = (*(uint64_t (**)(void *))(*(void *)a3 + 304))(a3);
          int v15 = (*(uint64_t (**)(void *))(*(void *)a3 + 272))(a3);
          int v17 = *((unsigned __int8 *)a3 + 236);
          uint64_t v16 = (char *)a3 + 236;
          BOOL v18 = v17 == 0;
          *(_DWORD *)buf = 136447746;
          if (v17) {
            uint64_t v19 = ":";
          }
          else {
            uint64_t v19 = "";
          }
          if (v18) {
            uint64_t v20 = "";
          }
          else {
            uint64_t v20 = v16;
          }
          *(void *)&buf[4] = v14;
          *(_WORD *)&buf[12] = 1026;
          uint64_t v21 = "from";
          *(_DWORD *)&buf[14] = v15;
          if (!v11) {
            uint64_t v21 = "";
          }
          *(_WORD *)&buf[18] = 2082;
          if (v9) {
            uint64_t v22 = v9 + 1;
          }
          else {
            uint64_t v22 = "";
          }
          *(void *)&buf[20] = v19;
          if (dli_sname) {
            uint64_t v23 = dli_sname;
          }
          else {
            uint64_t v23 = "";
          }
          *(_WORD *)&buf[28] = 2082;
          *(void *)&buf[30] = v20;
          *(_WORD *)&buf[38] = 2082;
          *(void *)&buf[40] = v21;
          *(_WORD *)&buf[48] = 2082;
          *(void *)&buf[50] = v22;
          *(_WORD *)&buf[58] = 2082;
          *(void *)&buf[60] = v23;
          _os_log_impl(&dword_193671000, v13, OS_LOG_TYPE_INFO, "Created CIContext (%{public}s context %{public}d%{public}s%{public}s) %{public}s %{public}s %{public}s", buf, 0x44u);
        }
      }
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (CIContext)init
{
  return [(CIContext *)self initWithOptions:0];
}

+ (void)internalContextWithMTLDevice:(id)a3 options:(id)a4
{
  if (!a3) {
    return 0;
  }
  int v6 = [a4 valueForKey:@"CoreUI"] ? "com.apple.CoreImage-Internal" : "com.apple.CoreImage";
  int v7 = CIMetalCommandQueueCreate((uint64_t)v6, a3);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  CFAutorelease(v7);

  return +[CIContext internalContextWithMTLCommandQueue:v8 options:a4];
}

+ (CIContext)contextWithOptions:(NSDictionary *)options
{
  v3 = [[CIContext alloc] initWithOptions:options];

  return v3;
}

- (void)dealloc
{
  if (self->_priv)
  {
    v3 = [(CIContext *)self _internalContext];
    if (v3) {
      CI::Object::unref(v3);
    }
    pthread_mutex_destroy((pthread_mutex_t *)((char *)self->_priv + 8));
    free(self->_priv);
    self->_priv = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CIContext;
  [(CIContext *)&v4 dealloc];
}

- (id)device
{
  v2 = [(CIContext *)self _internalContext];
  if ((*((unsigned int (**)(id *))*v2 + 2))(v2) != 77) {
    return 0;
  }

  return (id)CI::MetalContext::device(v2);
}

- (unint64_t)identifier
{
  unint64_t result = [(CIContext *)self _internalContext];
  if (result) {
    return (*(int (**)(unint64_t))(*(void *)result + 272))(result);
  }
  return result;
}

- (BOOL)loadArchiveWithURL:(id)a3
{
  objc_super v4 = [(CIContext *)self _internalContext];
  if (((unsigned int (*)(NSObject ***))(*v4)[2])(v4) == 77)
  {
    BOOL v5 = +[CIContext loadArchiveWithURL:a3];
    if (v5)
    {
      CI::MetalContext::add_archive(v4, (const __CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "lastPathComponent"), "stringByDeletingPathExtension"));
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)loadArchiveWithName:(id)a3 fromURL:(id)a4
{
  int v6 = [(CIContext *)self _internalContext];
  if (((unsigned int (*)(NSObject ***))(*v6)[2])(v6) == 77)
  {
    BOOL v7 = +[CIContext loadArchiveWithName:a3 fromURL:a4];
    if (v7)
    {
      CI::MetalContext::add_archive(v6, (const __CFString *)a3);
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)loadArchive:(id)a3
{
  objc_super v4 = [(CIContext *)self _internalContext];
  if (((unsigned int (*)(NSObject ***))(*v4)[2])(v4) == 77)
  {
    BOOL v5 = +[CIContext loadArchive:a3];
    if (v5)
    {
      CI::MetalContext::add_archive(v4, (const __CFString *)a3);
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (BOOL)loadArchiveWithURL:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  int v4 = CI_USE_ARCHIVED_KERNELS();
  if (v4)
  {
    if ((CI_DISABLE_LOADING_ARCHIVES() & 1) != 0
      || (uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "lastPathComponent"), "stringByDeletingPathExtension"), (v6 = (CI::MetalContext *)CI_DISABLE_LOADING_ARCHIVES_BY_NAME()) != 0)&& (v6 = (CI::MetalContext *)objc_msgSend((id)objc_msgSend(NSString, "stringWithCString:encoding:", CI_DISABLE_LOADING_ARCHIVES_BY_NAME(), 1), "containsString:", v5), (v6 & 1) != 0))
    {
      LOBYTE(v4) = 0;
      return v4;
    }
    BOOL v7 = (void *)CI::MetalContext::binaryArchiveCache(v6);
    objc_sync_enter(v7);
    uint64_t v8 = [v7 objectForKey:v5];
    if (!v8)
    {
      if (CI_USE_ARCHIVED_KERNELS() != 2 || (uint64_t v10 = CILoadBinaryArchive((uint64_t)a3, 1)) == 0)
      {
        id v12 = ci_logger_api();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          +[CIContext loadArchiveWithURL:]();
        }
        char v9 = 0;
        uint64_t v8 = 0;
        goto LABEL_17;
      }
      BOOL v18 = @"bin";
      v19[0] = v10;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      int v11 = ci_logger_api();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v14 = 136446466;
        int v15 = "+[CIContext loadArchiveWithURL:]";
        __int16 v16 = 2114;
        id v17 = a3;
        _os_log_impl(&dword_193671000, v11, OS_LOG_TYPE_INFO, "%{public}s Loaded CoreImage stitched libraries binary archive from url %{public}@", (uint8_t *)&v14, 0x16u);
      }
      if (v8) {
        [v7 setObject:v8 forKey:v5];
      }
    }
    char v9 = 1;
LABEL_17:
    objc_sync_exit(v7);
    if (v8) {
      LOBYTE(v4) = v9;
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

+ (BOOL)loadArchiveWithName:(id)a3 fromURL:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  int v6 = CI_USE_ARCHIVED_KERNELS();
  if (v6)
  {
    if ((CI_DISABLE_LOADING_ARCHIVES() & 1) == 0
      && (!CI_DISABLE_LOADING_ARCHIVES_BY_NAME()
       || (objc_msgSend((id)objc_msgSend(NSString, "stringWithCString:encoding:", CI_DISABLE_LOADING_ARCHIVES_BY_NAME(), 1), "containsString:", a3) & 1) == 0))
    {
      uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:objc_msgSend(NSString, "stringWithFormat:", @"%@/%@.metallib", a4, a3)];
      uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:objc_msgSend(NSString, "stringWithFormat:", @"%@/%@_bin.metallib", a4, a3)];
      if (v7 | v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = (void *)CI::MetalContext::binaryArchiveCache((CI::MetalContext *)v8);
        objc_sync_enter(v10);
        uint64_t v11 = [v10 objectForKey:a3];
        if (v11)
        {
LABEL_7:
          char v12 = 1;
LABEL_8:
          objc_sync_exit(v10);
          if (v11) {
            LOBYTE(v6) = v12;
          }
          else {
            LOBYTE(v6) = 0;
          }
          return v6;
        }
        uint64_t v14 = CILoadAIRArchive(v7, 1);
        if (CI_USE_ARCHIVED_KERNELS() == 2) {
          uint64_t v15 = CILoadBinaryArchive(v9, 1);
        }
        else {
          uint64_t v15 = 0;
        }
        if (!(v14 | v15))
        {
          id v17 = ci_logger_api();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            +[CIContext loadArchiveWithName:fromURL:]();
          }
          char v12 = 0;
          uint64_t v11 = 0;
          goto LABEL_8;
        }
        if (v14 && !v15)
        {
          __int16 v16 = ci_logger_api();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            +[CIContext loadArchiveWithName:fromURL:]();
          }
          uint64_t v11 = 0;
          goto LABEL_7;
        }
        if (v14 || !v15)
        {
          v21[0] = @"air";
          v21[1] = @"bin";
          v22[0] = v14;
          v22[1] = v15;
          uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
          BOOL v18 = ci_logger_api();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
            goto LABEL_34;
          }
          *(_DWORD *)buf = 136446722;
          uint64_t v24 = "+[CIContext loadArchiveWithName:fromURL:]";
          __int16 v25 = 2114;
          id v26 = a3;
          __int16 v27 = 2114;
          id v28 = a4;
          uint64_t v19 = "%{public}s Loaded %{public}@ CoreImage AIR and binary archive from url %{public}@";
        }
        else
        {
          long long v29 = @"bin";
          v30[0] = v15;
          uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
          BOOL v18 = ci_logger_api();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
            goto LABEL_34;
          }
          *(_DWORD *)buf = 136446722;
          uint64_t v24 = "+[CIContext loadArchiveWithName:fromURL:]";
          __int16 v25 = 2114;
          id v26 = a3;
          __int16 v27 = 2114;
          id v28 = a4;
          uint64_t v19 = "%{public}s Loaded %{public}@ CoreImage stitched libraries binary archive from url %{public}@";
        }
        _os_log_impl(&dword_193671000, v18, OS_LOG_TYPE_INFO, v19, buf, 0x20u);
LABEL_34:
        if (v11) {
          [v10 setObject:v11 forKey:a3];
        }
        goto LABEL_7;
      }
      uint64_t v13 = ci_logger_api();
      int v6 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      +[CIContext loadArchiveWithName:fromURL:]();
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (BOOL)loadArchive:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v4 = CI_USE_ARCHIVED_KERNELS();
  if (!v4) {
    return v4;
  }
  if ((CI_DISABLE_LOADING_ARCHIVES() & 1) != 0
    || CI_DISABLE_LOADING_ARCHIVES_BY_NAME()
    && (objc_msgSend((id)objc_msgSend(NSString, "stringWithCString:encoding:", CI_DISABLE_LOADING_ARCHIVES_BY_NAME(), 1), "containsString:", a3) & 1) != 0)
  {
    goto LABEL_32;
  }
  if (([a3 isEqualToString:@"portrait_filters_archive"] & 1) == 0
    && ![a3 isEqualToString:@"portrait_filters_fullsize_archive"]
    || (+[CIFilter filterWithName:@"CIPortraitEffectLightV2"],
        uint64_t v5 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()],
        ![v5 URLForResource:objc_msgSend(NSString, "stringWithFormat:", @"%@_bin", a3), @"metallib" withExtension]))
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 URLForResource:a3 withExtension:@"metallib"];
    uint64_t v9 = [v7 URLForResource:objc_msgSend(NSString, "stringWithFormat:", @"%@_bin", a3), @"metallib" withExtension];
    if (v8 | v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = (void *)CI::MetalContext::binaryArchiveCache((CI::MetalContext *)v9);
      if (([a3 isEqualToString:@"portrait_filters_archive"] & 1) != 0
        || ([a3 isEqualToString:@"portrait_filters_fullsize_archive"] & 1) != 0)
      {
        int v12 = 1;
      }
      else
      {
        int v12 = [a3 isEqualToString:@"photo_style_archive"];
      }
      int v14 = [a3 isEqualToString:@"redeye_repair_archive"];
      objc_sync_enter(v11);
      uint64_t v15 = [v11 objectForKey:a3];
      if (v15)
      {
LABEL_19:
        objc_sync_exit(v11);
        [a3 isEqualToString:@"coreui_archive"];
        LOBYTE(v4) = v15 != 0;
        return v4;
      }
      int v16 = v12 | v14;
      uint64_t v17 = CILoadAIRArchive(v8, v16);
      if (CI_USE_ARCHIVED_KERNELS() == 2) {
        uint64_t v18 = CILoadBinaryArchive(v10, v16);
      }
      else {
        uint64_t v18 = 0;
      }
      if (v17 | v18)
      {
        if (v17 && !v18)
        {
          uint64_t v19 = ci_logger_api();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            +[CIContext loadArchive:]();
          }
          uint64_t v15 = 0;
          goto LABEL_19;
        }
        if (v17 || !v18)
        {
          v24[0] = @"air";
          v24[1] = @"bin";
          v25[0] = v17;
          v25[1] = v18;
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
          uint64_t v21 = ci_logger_api();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
            goto LABEL_41;
          }
          *(_DWORD *)buf = 136446466;
          long long v29 = "+[CIContext loadArchive:]";
          __int16 v30 = 2114;
          id v31 = a3;
          uint64_t v22 = "%{public}s Loaded %{public}@ CoreImage AIR and binary archive";
        }
        else
        {
          id v26 = @"bin";
          uint64_t v27 = v18;
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          uint64_t v21 = ci_logger_api();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
            goto LABEL_41;
          }
          *(_DWORD *)buf = 136446466;
          long long v29 = "+[CIContext loadArchive:]";
          __int16 v30 = 2114;
          id v31 = a3;
          uint64_t v22 = "%{public}s Loaded %{public}@ CoreImage stitched libraries binary archive";
        }
        _os_log_impl(&dword_193671000, v21, OS_LOG_TYPE_INFO, v22, buf, 0x16u);
LABEL_41:
        if (v15) {
          [v11 setObject:v15 forKey:a3];
        }
        goto LABEL_19;
      }
      uint64_t v20 = ci_logger_api();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[CIContext loadArchive:]();
      }
      objc_sync_exit(v11);
    }
    else
    {
      uint64_t v13 = ci_logger_api();
      int v4 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (!v4) {
        return v4;
      }
      +[CIContext loadArchive:]();
    }
LABEL_32:
    LOBYTE(v4) = 0;
    return v4;
  }
  int v6 = ci_logger_api();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446722;
    long long v29 = "+[CIContext loadArchive:]";
    __int16 v30 = 2112;
    id v31 = a3;
    __int16 v32 = 2112;
    uint64_t v33 = [v5 bundleURL];
    _os_log_impl(&dword_193671000, v6, OS_LOG_TYPE_INFO, "%{public}s Loading %@ from PortraitFilters bundle at: %@", buf, 0x20u);
  }
  LOBYTE(v4) = +[CIContext loadArchiveWithName:fromURL:](CIContext, "loadArchiveWithName:fromURL:", a3, [v5 bundleURL]);
  return v4;
}

+ (void)clearArchives
{
  v2 = (void *)CI::MetalContext::binaryArchiveCache((CI::MetalContext *)a1);
  objc_sync_enter(v2);
  [v2 removeAllObjects];

  objc_sync_exit(v2);
}

+ (void)purgeArchive:(id)a3
{
  int v4 = (void *)CI::MetalContext::binaryArchiveCache((CI::MetalContext *)a1);
  objc_sync_enter(v4);
  [v4 removeObjectForKey:a3];

  objc_sync_exit(v4);
}

+ (id)_singletonContext
{
  v4[2] = *MEMORY[0x1E4F143B8];
  {
    v3[0] = @"kCIContextName";
    v3[1] = @"kCIContextCacheIntermediates";
    v4[0] = @"CISingletonContext";
    v4[1] = MEMORY[0x1E4F1CC28];
    +[CIContext _singletonContext]::context = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2]);
  }
  return (id)+[CIContext _singletonContext]::context;
}

- (BOOL)testArchive:(id)a3
{
  int v4 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 URLForResource:a3 withExtension:@"metallib"];
  uint64_t v6 = [v4 URLForResource:objc_msgSend(NSString, "stringWithFormat:", @"%@_bin", a3), @"metallib" withExtension];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    NSLog(&cfstr_FailedToLoadMe.isa, a3);
  }
  else
  {
    uint64_t v8 = v6;
    uint64_t v9 = (void *)CILoadAIRArchive(v5, 1);
    uint64_t v10 = CILoadBinaryArchive(v8, 1);
    if (v9) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11) {
      testBinaryArchive(v9, v10);
    }
  }
  return 0;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v6 = [(CIContext *)self _internalContext];
  if (!v6) {
    return;
  }
  uint64_t v7 = (uint64_t)v6;
  (*(void (**)(void *))(*(void *)v6 + 328))(v6);
  if ([a4 isEqual:@"output_color_space"])
  {
    if (CI::ColorSpace_is_RGB_or_Gray_and_supports_output((BOOL)a3, v8))
    {
      CI::Context::updateColorSpace((CGColorSpaceRef *)v7, (CGColorSpaceRef)a3);
      return;
    }
    uint64_t v10 = ci_logger_api();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return;
    }
LABEL_26:
    -[CIContext setObject:forKey:]();
    return;
  }
  if ([a4 isEqual:@"working_color_space"])
  {
    if (!CI::ColorSpace_is_RGB_or_Gray_and_supports_output((BOOL)a3, v9))
    {
      BOOL v11 = ci_logger_api();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        return;
      }
      goto LABEL_26;
    }
    CI::Context::updateWorkingSpace((CGColorSpaceRef *)v7, (CGColorSpaceRef)a3);
    return;
  }
  if ([a4 isEqual:@"kCIContextName"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v13 = ci_logger_api();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        return;
      }
      goto LABEL_26;
    }
    CI::Context::set_client_name(v7, (CFStringRef)a4);
    return;
  }
  if ([a4 isEqual:@"quality"])
  {
    [a3 floatValue];
    int v12 = *(void (**)(uint64_t))(*(void *)v7 + 192);
    v12(v7);
    return;
  }
  if ([a4 isEqual:@"high_quality_downsample"])
  {
    if (a3 == (id)MEMORY[0x1E4F1CC38])
    {
      int v14 = *(void (**)(uint64_t, uint64_t))(*(void *)v7 + 208);
      uint64_t v15 = v7;
      uint64_t v16 = 1;
    }
    else
    {
      if (a3 != (id)MEMORY[0x1E4F1CC28]) {
        return;
      }
      int v14 = *(void (**)(uint64_t, uint64_t))(*(void *)v7 + 208);
      uint64_t v15 = v7;
      uint64_t v16 = 0;
    }
    goto LABEL_62;
  }
  if ([a4 isEqual:@"kCIContextAllowClampToAlpha"])
  {
    if (a3 == (id)MEMORY[0x1E4F1CC38])
    {
      *(unsigned char *)(v7 + 41) = 1;
    }
    else if (a3 == (id)MEMORY[0x1E4F1CC28])
    {
      *(unsigned char *)(v7 + 41) = 0;
    }
    return;
  }
  if (![a4 isEqual:@"kCIContextHLGOpticalScale"])
  {
    if (![a4 isEqual:@"kCIContextLossyCompressedIntermediates"])
    {
      uint64_t v20 = ci_logger_api();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[CIContext setObject:forKey:].cold.6();
      }
      return;
    }
    if (a3 == (id)MEMORY[0x1E4F1CC38])
    {
      int v14 = *(void (**)(uint64_t, uint64_t))(*(void *)v7 + 160);
      uint64_t v15 = v7;
      uint64_t v16 = 1;
    }
    else
    {
      if (a3 != (id)MEMORY[0x1E4F1CC28])
      {
        uint64_t v19 = ci_logger_api();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          return;
        }
        goto LABEL_26;
      }
      int v14 = *(void (**)(uint64_t, uint64_t))(*(void *)v7 + 160);
      uint64_t v15 = v7;
      uint64_t v16 = 0;
    }
LABEL_62:
    v14(v15, v16);
    return;
  }
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v21 = ci_logger_api();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        return;
      }
      goto LABEL_26;
    }
    [a4 floatValue];
    uint64_t v18 = *(void (**)(uint64_t, __n128))(*(void *)v7 + 144);
  }
  else
  {
    uint64_t v18 = *(void (**)(uint64_t, __n128))(*(void *)v7 + 144);
    v17.n128_u64[0] = 0;
  }

  v18(v7, v17);
}

- (id)objectForKey:(id)a3
{
  id result = [(CIContext *)self _internalContext];
  if (!result) {
    return result;
  }
  id v5 = result;
  if ([a3 isEqual:@"output_color_space"])
  {
    uint64_t v6 = (CGColorSpace *)*((void *)v5 + 2);
    if (v6) {
      goto LABEL_4;
    }
LABEL_10:
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA98];
    return (id)[v9 null];
  }
  if ([a3 isEqual:@"working_color_space"])
  {
    uint64_t v6 = (CGColorSpace *)*((void *)v5 + 3);
    if (v6)
    {
LABEL_4:
      int v7 = dyld_program_sdk_at_least();
      id result = CGColorSpaceRetain(v6);
      if (v7)
      {
        uint64_t v8 = (void *)CFMakeCollectable(result);
        return v8;
      }
      return result;
    }
    goto LABEL_10;
  }
  if ([a3 isEqual:@"quality"])
  {
    if ((*(float (**)(id))(*(void *)v5 + 200))(v5) == 0.0) {
      return &unk_1EE4A8270;
    }
    uint64_t v10 = NSNumber;
    goto LABEL_27;
  }
  if ([a3 isEqual:@"high_quality_downsample"])
  {
    if ((*(unsigned int (**)(id))(*(void *)v5 + 216))(v5)) {
      return (id)MEMORY[0x1E4F1CC38];
    }
    else {
      return (id)MEMORY[0x1E4F1CC28];
    }
  }
  if ([a3 isEqual:@"kCIContextAllowClampToAlpha"])
  {
    if (*((unsigned char *)v5 + 41)) {
      return (id)MEMORY[0x1E4F1CC38];
    }
    else {
      return (id)MEMORY[0x1E4F1CC28];
    }
  }
  if ([a3 isEqual:@"kCIContextHLGOpticalScale"])
  {
    BOOL v11 = NSNumber;
    (*(void (**)(id))(*(void *)v5 + 152))(v5);
    uint64_t v10 = v11;
LABEL_27:
    return (id)objc_msgSend(v10, "numberWithFloat:");
  }
  if ([a3 isEqual:@"kCIContextLossyCompressedIntermediates"])
  {
    int v12 = NSNumber;
    uint64_t v13 = (*(uint64_t (**)(id))(*(void *)v5 + 168))(v5);
    return (id)[v12 numberWithBool:v13];
  }
  else
  {
    int v14 = ci_logger_api();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CIContext objectForKey:]();
    }
    return 0;
  }
}

- (void)abort
{
  v2 = [(CIContext *)self _internalContext];
  if (v2)
  {
    v3 = *(void (**)(void))(*(void *)v2 + 240);
    v3();
  }
}

+ (CIContext)context
{
  return +[CIContext contextWithOptions:0];
}

uint64_t __29__CIContext_initWithOptions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 280))();
}

+ (CIContext)contextWithCGContext:(CGContextRef)cgctx options:(NSDictionary *)options
{
  int v4 = [[CIContext alloc] initWithCGContext:cgctx options:options];

  return v4;
}

- (CIContext)initWithCGContext:(CGContext *)a3 options:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  int v7 = (void *)MEMORY[0x199702DB0](self, a2);
  if (!a3)
  {
    uint64_t v10 = [(CIContext *)self initWithOptions:a4];
    goto LABEL_20;
  }
  int Type = CGContextGetType();
  switch(Type)
  {
    case 10:
      uint64_t ColorSpace = CGMetalContextGetColorSpace();
      break;
    case 8:
      uint64_t ColorSpace = CGIOSurfaceContextGetColorSpace();
      break;
    case 4:
      uint64_t ColorSpace = (uint64_t)CGBitmapContextGetColorSpace(a3);
      break;
    default:
      goto LABEL_10;
  }
  PropertCGFloat y = ColorSpace;
  if (ColorSpace) {
    goto LABEL_11;
  }
LABEL_10:
  PropertCGFloat y = CGContextGetProperty();
  if (Property)
  {
LABEL_11:
    if (a4)
    {
      if (![a4 objectForKey:@"output_color_space"])
      {
        a4 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a4];
        [a4 setValue:Property forKey:@"output_color_space"];
      }
    }
    else
    {
      uint64_t v18 = @"output_color_space";
      v19[0] = Property;
      a4 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    }
  }
  [a4 objectForKey:@"default_CGImage_format"];
  int v12 = [(CIContext *)self initWithOptions:a4];
  uint64_t v10 = v12;
  if (v12)
  {
    uint64_t v13 = [(CIContext *)v12 _internalContext];
    if (v13)
    {
      int v14 = v13;
      CI::Context::set_cgcontext(v13, a3);
      if (CGContextGetType() == 4)
      {
        double Width = (double)CGBitmapContextGetWidth(a3);
        size_t Height = CGBitmapContextGetHeight(a3);
        (*(void (**)(CI::Context *, double, double, double, double))(*(void *)v14 + 176))(v14, 0.0, 0.0, Width, (double)Height);
      }
    }
    CoreAnalytics(&cfstr_Contextwithcgc.isa, v10);
  }
LABEL_20:
  return v10;
}

+ (CIContext)contextWithEAGLContext:(EAGLContext *)eaglContext
{
  v3 = [[CIContext alloc] initWithEAGLContext:eaglContext];

  return v3;
}

+ (CIContext)contextWithEAGLContext:(EAGLContext *)eaglContext options:(NSDictionary *)options
{
  int v4 = [[CIContext alloc] initWithEAGLContext:eaglContext options:options];

  return v4;
}

- (CIContext)initWithEAGLContext:(id)a3
{
  return [(CIContext *)self initWithEAGLContext:a3 options:0];
}

- (CIContext)initWithEAGLContext:(id)a3 options:(id)a4
{
  int v7 = (void *)MEMORY[0x199702DB0](self, a2);
  if (CIEAGLContextGetAPI(a3) - 4 > 0xFFFFFFFD)
  {
    v19.receiver = self;
    v19.super_class = (Class)CIContext;
    uint64_t v16 = [(CIContext *)&v19 init];
    if (v16)
    {
      __n128 v17 = +[CIContext internalContextWithEAGLContext:a3 options:a4];
      uint64_t v16 = [(CIContext *)v16 _initWithInternalRepresentation:v17];
      if (v17) {
        CI::Object::unref(v17);
      }
      if (v16) {
        CoreAnalytics(&cfstr_Contextwitheag.isa, v16);
      }
    }
  }
  else
  {
    uint64_t v8 = ci_logger_api();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CIContext initWithEAGLContext:options:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    uint64_t v16 = 0;
  }
  return v16;
}

+ (CIContext)contextWithMTLDevice:(id)device
{
  v3 = [[CIContext alloc] initWithMTLDevice:device options:0];

  return v3;
}

+ (CIContext)contextWithMTLDevice:(id)device options:(NSDictionary *)options
{
  int v4 = [[CIContext alloc] initWithMTLDevice:device options:options];

  return v4;
}

- (CIContext)initWithMTLDevice:(id)a3 options:(id)a4
{
  int v7 = (void *)MEMORY[0x199702DB0](self, a2);
  v13.receiver = self;
  v13.super_class = (Class)CIContext;
  uint64_t v8 = [(CIContext *)&v13 init];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = +[CIContext internalContextWithMTLDevice:a3 options:a4];
    uint64_t v11 = [(CIContext *)v9 _initWithInternalRepresentation:v10];
    if (v10) {
      CI::Object::unref(v10);
    }
    if (v11) {
      CoreAnalytics(&cfstr_Contextwithmtl.isa, v11);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (CIContext)initWithMTLCommandQueue:(id)a3 options:(id)a4
{
  int v7 = (void *)MEMORY[0x199702DB0](self, a2);
  v13.receiver = self;
  v13.super_class = (Class)CIContext;
  uint64_t v8 = [(CIContext *)&v13 init];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = +[CIContext internalContextWithMTLCommandQueue:a3 options:a4];
    uint64_t v11 = [(CIContext *)v9 _initWithInternalRepresentation:v10];
    if (v10) {
      CI::Object::unref(v10);
    }
    *((unsigned char *)v9->_priv + 72) = 1;
    *((void *)v9->_priv + 10) = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"kCIContextIOSurfaceMemoryPoolID"), "unsignedIntValue");
    if (v11) {
      CoreAnalytics(&cfstr_Contextwithmtl_0.isa, v11);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

+ (CIContext)contextWithMTLCommandQueue:(id)commandQueue
{
  return +[CIContext contextWithMTLCommandQueue:commandQueue options:MEMORY[0x1E4F1CC08]];
}

+ (CIContext)contextWithMTLCommandQueue:(id)commandQueue options:(NSDictionary *)options
{
  int v4 = [[CIContext alloc] initWithMTLCommandQueue:commandQueue options:options];

  return v4;
}

+ (int)_crashed_because_nonaddressable_memory_was_passed_to_render:(id)a3 toBitmap:(void *)a4 rowBytes:(int64_t)a5 bounds:(CGRect)a6 format:(int)a7 colorSpace:(CGColorSpace *)a8
{
  double height = a6.size.height;
  double width = a6.size.width;
  int v12 = CI::format_bits_per_pixel(a7);
  unint64_t v13 = (v12 * vcvtmd_u64_f64(width)) >> 3;
  if (v12 == 12) {
    unint64_t v13 = a5;
  }
  if (!v12) {
    unint64_t v13 = a5;
  }
  return *((char *)a4 + (vcvtmd_u64_f64(height) - 1) * a5 + v13 - 1) + *(unsigned __int8 *)a4;
}

- (void)render:(CIImage *)image toBitmap:(void *)data rowBytes:(ptrdiff_t)rowBytes bounds:(CGRect)bounds format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace
{
  uint64_t v9 = *(void *)&format;
  CGFloat height = bounds.size.height;
  CGFloat width = bounds.size.width;
  CGFloat y = bounds.origin.y;
  CGFloat x = bounds.origin.x;
  uint64_t v18 = (void *)MEMORY[0x199702DB0](self, a2);
  [(CIContext *)self _gpuContextCheck];
  objc_super v19 = [(CIContext *)self _internalContext];
  if (!data) {
    goto LABEL_42;
  }
  if (!image) {
    goto LABEL_42;
  }
  uint64_t v20 = v19;
  if (!v19) {
    goto LABEL_42;
  }
  [(CIImage *)image extent];
  v78.origin.CGFloat x = v21;
  v78.origin.CGFloat y = v22;
  v78.size.CGFloat width = v23;
  v78.size.CGFloat height = v24;
  v70.origin.CGFloat x = x;
  v70.origin.CGFloat y = y;
  v70.size.CGFloat width = width;
  v70.size.CGFloat height = height;
  CGRect v71 = CGRectIntersection(v70, v78);
  if (CGRectIsEmpty(v71)) {
    goto LABEL_42;
  }
  unsigned int v26 = CI::format_modernize(v9, (CI *)"-[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:]", v25);
  if (v26 == 258) {
    unsigned int v27 = 259;
  }
  else {
    unsigned int v27 = v26;
  }
  if (v27 == 1794) {
    uint64_t v28 = 1795;
  }
  else {
    uint64_t v28 = v27;
  }
  if ((*(unsigned int (**)(unsigned char *))(*(void *)v20 + 16))(v20) == 76
    && CI::format_is_not_supported_as_destination_on_gles(v28))
  {
    long long v29 = ci_logger_api();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v28);
    }
    goto LABEL_42;
  }
  if (CI::format_is_supported_render_to_bitmap(v28))
  {
    if (!colorSpace) {
      goto LABEL_26;
    }
    CFTypeID TypeID = CGColorSpaceGetTypeID();
    if (TypeID == CFGetTypeID(colorSpace) && CGColorSpaceSupportsOutput(colorSpace))
    {
      int is_luminance = CI::format_is_luminance(v28);
      CGColorSpaceModel Model = CGColorSpaceGetModel(colorSpace);
      if (is_luminance)
      {
        if (Model) {
          goto LABEL_21;
        }
        goto LABEL_26;
      }
      if (Model == kCGColorSpaceModelRGB)
      {
LABEL_26:
        if (rowBytes % (unint64_t)CI::format_destination_rowbytes_requirement(v28))
        {
          uint64_t v42 = ci_logger_api();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:]();
          }
        }
        else
        {
          v72.origin.CGFloat x = x;
          v72.origin.CGFloat y = y;
          v72.size.CGFloat width = width;
          v72.size.CGFloat height = height;
          CGRect v73 = CGRectStandardize(v72);
          double v43 = v73.size.width;
          double v44 = v73.size.height;
          double v45 = floor(v73.origin.x);
          double v46 = floor(v73.origin.y);
          double v47 = floor(v73.size.width);
          double v48 = floor(v73.size.height);
          +[CIContext _crashed_because_nonaddressable_memory_was_passed_to_render:toBitmap:rowBytes:bounds:format:colorSpace:](CIContext, "_crashed_because_nonaddressable_memory_was_passed_to_render:toBitmap:rowBytes:bounds:format:colorSpace:", image, data, rowBytes, v28, colorSpace, v45, v46, v47, v48);
          unint64_t v69 = vcvtmd_u64_f64(v43);
          unint64_t v49 = vcvtmd_u64_f64(v44);
          uint64_t v50 = (v49 - 1) * rowBytes;
          if (rowBytes >= 0) {
            ptrdiff_t v51 = rowBytes;
          }
          else {
            ptrdiff_t v51 = -rowBytes;
          }
          if (rowBytes >= 0) {
            uint64_t v50 = 0;
          }
          uint64_t v52 = [[CIRenderDestination alloc] initWithBitmapData:(char *)data + v50 width:v69 height:v49 bytesPerRow:v51 format:v28];
          [(CIRenderDestination *)v52 setColorSpace:colorSpace];
          [(CIRenderDestination *)v52 setFlipped:rowBytes >= 0];
          if (!v20[40]) {
            [(CIRenderDestination *)v52 setAlphaMode:2];
          }
          if (!v20[41]) {
            [(CIRenderDestination *)v52 setClamped:0];
          }
          [(CIImage *)image extent];
          v79.origin.CGFloat x = v53;
          v79.origin.CGFloat y = v54;
          v79.size.CGFloat width = v55;
          v79.size.CGFloat height = v56;
          v74.origin.CGFloat x = v45;
          v74.origin.CGFloat y = v46;
          v74.size.CGFloat width = v47;
          v74.size.CGFloat height = v48;
          CGRect v75 = CGRectUnion(v74, v79);
          CGFloat v57 = v75.origin.x;
          CGFloat v58 = v75.origin.y;
          CGFloat v59 = v75.size.width;
          CGFloat v60 = v75.size.height;
          [(CIImage *)image extent];
          v80.origin.CGFloat x = v61;
          v80.origin.CGFloat y = v62;
          v80.size.CGFloat width = v63;
          v80.size.CGFloat height = v64;
          v76.origin.CGFloat x = v57;
          v76.origin.CGFloat y = v58;
          v76.size.CGFloat width = v59;
          v76.size.CGFloat height = v60;
          if (CGRectContainsRect(v76, v80))
          {
            [(CIImage *)image extent];
            v81.origin.CGFloat x = v65;
            v81.origin.CGFloat y = v66;
            v81.size.CGFloat width = v67;
            v81.size.CGFloat height = v68;
            v77.origin.CGFloat x = v57;
            v77.origin.CGFloat y = v58;
            v77.size.CGFloat width = v59;
            v77.size.CGFloat height = v60;
            if (!CGRectEqualToRect(v77, v81)) {
              image = [(CIImage *)image imageByCompositingOverImage:+[CIImage clearImage]];
            }
          }
          -[CIRenderTask waitUntilCompletedAndReturnError:](-[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", image, v52, 0, v45, v46, v47, v48, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8)), "waitUntilCompletedAndReturnError:", 0);
        }
        goto LABEL_42;
      }
    }
LABEL_21:
    uint64_t v33 = ci_logger_api();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      [(CIContext *)v33 render:v35 toBitmap:v36 rowBytes:v37 bounds:v38 format:v39 colorSpace:v40];
    }
    goto LABEL_42;
  }
  uint64_t v41 = ci_logger_api();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
    -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:].cold.4(v28);
  }
LABEL_42:
}

- (void)render:(CIImage *)image toCVPixelBuffer:(CVPixelBufferRef)buffer
{
  double Width = (double)CVPixelBufferGetWidth(buffer);
  double Height = (double)CVPixelBufferGetHeight(buffer);
  uint64_t v9 = CVImageBufferCopyColorSpace(buffer);
  -[CIContext render:toCVPixelBuffer:bounds:colorSpace:](self, "render:toCVPixelBuffer:bounds:colorSpace:", image, buffer, v9, 0.0, 0.0, Width, Height);

  CGColorSpaceRelease(v9);
}

- (void)render:(CIImage *)image toCVPixelBuffer:(CVPixelBufferRef)buffer bounds:(CGRect)bounds colorSpace:(CGColorSpaceRef)colorSpace
{
  double height = bounds.size.height;
  double width = bounds.size.width;
  double y = bounds.origin.y;
  double x = bounds.origin.x;
  uint64_t v14 = (void *)MEMORY[0x199702DB0](self, a2);
  [(CIContext *)self _gpuContextCheck];
  uint64_t v15 = [(CIContext *)self _internalContext];
  if (image)
  {
    if (buffer)
    {
      uint64_t v16 = v15;
      if (v15)
      {
        __n128 v17 = [[CIRenderDestination alloc] initWithPixelBuffer:buffer];
        [(CIRenderDestination *)v17 setColorSpace:colorSpace];
        if (!v16[40]) {
          [(CIRenderDestination *)v17 setAlphaMode:2];
        }
        if (!v16[41]) {
          [(CIRenderDestination *)v17 setClamped:0];
        }
        uint64_t v18 = -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", image, v17, 0, x, y, width, height, x, y);

        if (v18) {
          [(CIRenderTask *)v18 waitUntilCompletedAndReturnError:0];
        }
      }
    }
  }
}

- (BOOL)isMetalBased
{
  v2 = [(CIContext *)self _internalContext];
  if (v2) {
    LOBYTE(v2) = (*(unsigned int (**)(void *))(*(void *)v2 + 16))(v2) == 77;
  }
  return (char)v2;
}

- (BOOL)isOpenGLBased
{
  v2 = [(CIContext *)self _internalContext];
  if (v2) {
    LOBYTE(v2) = (*(unsigned int (**)(void *))(*(void *)v2 + 16))(v2) == 76;
  }
  return (char)v2;
}

- (BOOL)isOpenCLBased
{
  v2 = [(CIContext *)self _internalContext];
  if (v2) {
    LOBYTE(v2) = (*(unsigned int (**)(void *))(*(void *)v2 + 16))(v2) == 74;
  }
  return (char)v2;
}

- (BOOL)_isGLBackedContext
{
  v2 = [(CIContext *)self _internalContext];
  if (v2)
  {
    v3 = v2;
    LOBYTE(v2) = (*(unsigned int (**)(void *))(*v2 + 16))(v2) == 76 && v3[50] != 0;
  }
  return (char)v2;
}

- (BOOL)_isCGBackedContext
{
  v2 = [(CIContext *)self _internalContext];
  if (v2) {
    LOBYTE(v2) = v2[6] != 0;
  }
  return (char)v2;
}

- (void)_insertEventMarker:(const char *)a3
{
  int v4 = [(CIContext *)self _internalContext];
  if (v4)
  {
    id v5 = v4;
    if ((*((unsigned int (**)(void **))*v4 + 2))(v4) == 76)
    {
      CI::GLContext::insert_event_marker(v5, a3);
    }
  }
}

- (void)render:(id)a3
{
  id v5 = (void *)MEMORY[0x199702DB0](self, a2);
  if (!a3) {
    goto LABEL_10;
  }
  [a3 extent];
  if (CGRectIsEmpty(v40)) {
    goto LABEL_10;
  }
  [(CIContext *)self bounds];
  CGFloat x = v41.origin.x;
  CGFloat y = v41.origin.y;
  CGFloat width = v41.size.width;
  CGFloat height = v41.size.height;
  if (!CGRectIsInfinite(v41))
  {
    uint64_t v18 = self;
    id v19 = a3;
    double v20 = x;
    double v21 = y;
    double v22 = width;
    double v23 = height;
    double v24 = x;
    double v25 = y;
    double v26 = width;
    double v27 = height;
LABEL_9:
    -[CIContext drawImage:inRect:fromRect:](v18, "drawImage:inRect:fromRect:", v19, v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_10;
  }
  [a3 extent];
  if (!CGRectIsInfinite(v42))
  {
    [a3 extent];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    [a3 extent];
    double v24 = v36;
    double v25 = v37;
    double v26 = v38;
    double v27 = v39;
    uint64_t v18 = self;
    id v19 = a3;
    double v20 = v29;
    double v21 = v31;
    double v22 = v33;
    double v23 = v35;
    goto LABEL_9;
  }
  uint64_t v10 = ci_logger_api();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[CIContext render:](v10, v11, v12, v13, v14, v15, v16, v17);
  }
LABEL_10:
}

- (void)drawImage:(CIImage *)image atPoint:(CGPoint)atPoint fromRect:(CGRect)fromRect
{
  if (image)
  {
    CGFloat height = fromRect.size.height;
    CGFloat width = fromRect.size.width;
    CGFloat y = fromRect.origin.y;
    CGFloat x = fromRect.origin.x;
    double v9 = atPoint.y;
    double v10 = atPoint.x;
    [(CIImage *)image extent];
    if (!CGRectIsEmpty(v14))
    {
      v15.origin.CGFloat x = x;
      v15.origin.CGFloat y = y;
      v15.size.CGFloat width = width;
      v15.size.CGFloat height = height;
      CGRect v16 = CGRectStandardize(v15);
      -[CIContext drawImage:inRect:fromRect:](self, "drawImage:inRect:fromRect:", image, v10, v9, v16.size.width, v16.size.height, v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    }
  }
}

- (void)drawImage:(CIImage *)image inRect:(CGRect)inRect fromRect:(CGRect)fromRect
{
  CGFloat height = fromRect.size.height;
  CGFloat width = fromRect.size.width;
  CGFloat y = fromRect.origin.y;
  CGFloat x = fromRect.origin.x;
  CGFloat v9 = inRect.size.height;
  CGFloat v10 = inRect.size.width;
  CGFloat v11 = inRect.origin.y;
  CGFloat v12 = inRect.origin.x;
  CGRect v15 = (void *)MEMORY[0x199702DB0](self, a2);
  if ([(CIContext *)self _isGLBackedContext]
    || [(CIContext *)self _isCGBackedContext])
  {
    [(CIContext *)self _gpuContextCheck];
    CGRect v16 = [(CIContext *)self _internalContext];
    v64.origin.CGFloat x = x;
    v64.origin.CGFloat y = y;
    v64.size.CGFloat width = width;
    v64.size.CGFloat height = height;
    CGRect v65 = CGRectStandardize(v64);
    double v17 = v65.origin.x;
    double v18 = v65.origin.y;
    double v19 = v65.size.width;
    double v20 = v65.size.height;
    v65.origin.CGFloat x = v12;
    v65.origin.CGFloat y = v11;
    v65.size.CGFloat width = v10;
    v65.size.CGFloat height = v9;
    CGRect v66 = CGRectStandardize(v65);
    if (image)
    {
      if (v16)
      {
        double v21 = v66.origin.x;
        double v22 = v66.origin.y;
        double v23 = v66.size.width;
        double v24 = v66.size.height;
        if (!CGRectIsEmpty(v66))
        {
          [(CIImage *)image extent];
          v71.origin.CGFloat x = v25;
          v71.origin.CGFloat y = v26;
          v71.size.CGFloat width = v27;
          v71.size.CGFloat height = v28;
          v67.origin.CGFloat x = v17;
          v67.origin.CGFloat y = v18;
          v67.size.CGFloat width = v19;
          v67.size.CGFloat height = v20;
          CGRect v68 = CGRectIntersection(v67, v71);
          if (!CGRectIsEmpty(v68))
          {
            v69.origin.CGFloat x = v17;
            v69.origin.CGFloat y = v18;
            v69.size.CGFloat width = v19;
            v69.size.CGFloat height = v20;
            if (CGRectIsInfinite(v69)
              || (v70.origin.CGFloat x = v21,
                  v70.origin.CGFloat y = v22,
                  v70.size.CGFloat width = v23,
                  v70.size.CGFloat height = v24,
                  CGRectIsInfinite(v70)))
            {
              double v29 = ci_logger_api();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                -[CIContext drawImage:inRect:fromRect:](v29, v30, v31, v32, v33, v34, v35, v36);
              }
            }
            else if ([(CIContext *)self _isCGBackedContext])
            {
              double v45 = (CGContext *)*((void *)v16 + 6);
              if (CGContextGetType() == 4 && CGBitmapContextGetColorSpace(v45))
              {
                uint64_t ColorSpace = CGBitmapContextGetColorSpace(v45);
                size_t BitsPerComponent = CGBitmapContextGetBitsPerComponent(v45);
                __int16 BitmapInfo = CGBitmapContextGetBitmapInfo(v45);
                if ((BitmapInfo & 0x100) != 0)
                {
                  if ((BitmapInfo & 0x7000) == 0x1000) {
                    CGFloat v56 = &kCIFormatRGBAh;
                  }
                  else {
                    CGFloat v56 = &kCIFormatRGBAf;
                  }
                  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
                  unint64_t v49 = &kCIFormatLAf;
                  if (Model) {
                    unint64_t v49 = v56;
                  }
                }
                else if (CGColorSpaceGetModel(ColorSpace))
                {
                  unint64_t v49 = &kCIFormatRGBA8;
                }
                else
                {
                  unint64_t v49 = &kCIFormatLA16;
                  if (BitsPerComponent <= 8) {
                    unint64_t v49 = &kCIFormatLA8;
                  }
                }
              }
              else
              {
                CGFloat v53 = [(CIImage *)image colorSpace];
                if (!v53
                  || (uint64_t ColorSpace = v53, CGColorSpaceGetModel(v53) != kCGColorSpaceModelRGB)
                  || !CGColorSpaceSupportsOutput(ColorSpace))
                {
                  uint64_t ColorSpace = [(CIContext *)self _outputColorSpace];
                }
                BOOL v54 = CGColorSpaceUsesExtendedRange(ColorSpace);
                if (CGColorSpaceUsesITUR_2100TF(ColorSpace) || v54) {
                  unint64_t v49 = &kCIFormatRGBAh;
                }
                else {
                  unint64_t v49 = &kCIFormatRGBA8;
                }
              }
              CGFloat v55 = -[CIContext createCGImage:fromRect:format:colorSpace:](self, "createCGImage:fromRect:format:colorSpace:", image, *v49, ColorSpace, v17, v18, v19, v20);
              CGContextDrawImageFromRect();
              CGImageRelease(v55);
            }
            else
            {
              double v58 = v23 / v19;
              double v59 = v23 / v19 * 0.0;
              double v60 = v24 / v20 * 0.0;
              double v61 = v24 / v20;
              double v62 = v21 - v23 / v19 * v17 - v60 * v18;
              double v63 = v22 - v59 * v17 - v24 / v20 * v18;
              uint64_t v50 = [(CIImage *)image imageByApplyingTransform:&v58];
              CGColorSpaceRef v51 = (CGColorSpaceRef)*((void *)v16 + 2);
              if ((*(unsigned int (**)(void *))(*(void *)v16 + 16))(v16) == 76
                && CI::GLContext::is_user_destination_srgb((CI::GLContext *)v16))
              {
                CGColorSpaceRef v51 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC88]);
                CFAutorelease(v51);
              }
              uint64_t v52 = [[(CIImage *)v50 imageByColorMatchingWorkingSpaceToColorSpace:v51] _internalRepresentation];
              [(CIContext *)self lock];
              ++*((void *)v16 + 19);
              *((void *)v16 + 24) = 0;
              *((double *)v16 + 20) = v21;
              *((double *)v16 + 21) = v22;
              *((double *)v16 + 22) = v23;
              *((double *)v16 + 23) = v24;
              (*(void (**)(void *, void))(*(void *)v16 + 240))(v16, 0);
              CI::image_render_to_display((uint64_t)v16, v52, 264, v21, v22, v23, v24);
              [(CIContext *)self unlock];
            }
          }
        }
      }
    }
  }
  else
  {
    double v37 = ci_logger_api();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[CIContext drawImage:inRect:fromRect:](v37, v38, v39, v40, v41, v42, v43, v44);
    }
  }
}

- (void)render:(id)a3 toTexture:(unsigned int)a4 bounds:(CGRect)a5 colorSpace:(CGColorSpace *)a6
{
}

- (void)render:(id)a3 toTexture:(unsigned int)a4 target:(unsigned int)a5 bounds:(CGRect)a6 colorSpace:(CGColorSpace *)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  uint64_t v13 = *(void *)&a4;
  CGRect v16 = (void *)MEMORY[0x199702DB0](self, a2);
  if (a5 == 3553)
  {
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    CGRect v44 = CGRectStandardize(v43);
    if (a3)
    {
      double v17 = v44.origin.x;
      double v18 = v44.origin.y;
      double v19 = v44.size.width;
      double v20 = v44.size.height;
      if ([(CIContext *)self _internalContext])
      {
        [a3 extent];
        v47.origin.CGFloat x = v21;
        v47.origin.CGFloat y = v22;
        v47.size.CGFloat width = v23;
        v47.size.CGFloat height = v24;
        v45.origin.CGFloat x = v17;
        v45.origin.CGFloat y = v18;
        v45.size.CGFloat width = v19;
        v45.size.CGFloat height = v20;
        CGRect v46 = CGRectIntersection(v45, v47);
        if (!CGRectIsEmpty(v46))
        {
          [(CIContext *)self _gpuContextCheck];
          CGFloat v25 = [(CIContext *)self _internalContext];
          if ((*(unsigned int (**)(unsigned char *))(*(void *)v25 + 16))(v25) == 76
            || (*(unsigned int (**)(unsigned char *))(*(void *)v25 + 16))(v25) == 74)
          {
            CGFloat v26 = [[CIRenderDestination alloc] initWithGLTexture:v13 target:3553 width:(unint64_t)v19 height:(unint64_t)v20];
            [(CIRenderDestination *)v26 setColorSpace:a7];
            [(CIRenderDestination *)v26 setFlipped:0];
            if (!v25[40]) {
              [(CIRenderDestination *)v26 setAlphaMode:2];
            }
            if (!v25[41]) {
              [(CIRenderDestination *)v26 setClamped:0];
            }
            -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", a3, v26, 0, v17, v18, v19, v20, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
          }
          else
          {
            uint64_t v35 = ci_logger_api();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              -[CIContext render:toTexture:target:bounds:colorSpace:](v35, v36, v37, v38, v39, v40, v41, v42);
            }
          }
        }
      }
    }
  }
  else
  {
    CGFloat v27 = ci_logger_api();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[CIContext render:toTexture:target:bounds:colorSpace:](v27, v28, v29, v30, v31, v32, v33, v34);
    }
  }
}

- (void)render:(CIImage *)image toMTLTexture:(id)texture commandBuffer:(id)commandBuffer bounds:(CGRect)bounds colorSpace:(CGColorSpaceRef)colorSpace
{
  CGFloat height = bounds.size.height;
  CGFloat width = bounds.size.width;
  CGFloat y = bounds.origin.y;
  CGFloat x = bounds.origin.x;
  CGRect v16 = (void *)MEMORY[0x199702DB0](self, a2);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  CGRect v45 = CGRectStandardize(v44);
  if (image)
  {
    double v17 = v45.origin.x;
    double v18 = v45.origin.y;
    double v19 = v45.size.width;
    double v20 = v45.size.height;
    if ([(CIContext *)self _internalContext])
    {
      [(CIImage *)image extent];
      v48.origin.CGFloat x = v21;
      v48.origin.CGFloat y = v22;
      v48.size.CGFloat width = v23;
      v48.size.CGFloat height = v24;
      v46.origin.CGFloat x = v17;
      v46.origin.CGFloat y = v18;
      v46.size.CGFloat width = v19;
      v46.size.CGFloat height = v20;
      CGRect v47 = CGRectIntersection(v46, v48);
      if (!CGRectIsEmpty(v47))
      {
        CGFloat v25 = [(CIContext *)self _internalContext];
        if ([texture textureType] == 2)
        {
          if ((*(unsigned int (**)(unsigned char *))(*(void *)v25 + 16))(v25) == 77)
          {
            CGFloat v26 = [[CIRenderDestination alloc] initWithMTLTexture:texture commandBuffer:commandBuffer];
            [(CIRenderDestination *)v26 setColorSpace:colorSpace];
            if (!v25[40]) {
              [(CIRenderDestination *)v26 setAlphaMode:2];
            }
            if (!v25[41]) {
              [(CIRenderDestination *)v26 setClamped:0];
            }
            if ((dyld_program_sdk_at_least() & 1) == 0 && (dyld_program_sdk_at_least() & 1) == 0) {
              [(CIRenderDestination *)v26 setFlipped:0];
            }
            -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", image, v26, 0, v17, v18, v19, v20, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
          }
          else if (commandBuffer || (uint64_t v43 = [texture iosurface]) == 0)
          {
            uint64_t v35 = ci_logger_api();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              -[CIContext render:toMTLTexture:commandBuffer:bounds:colorSpace:](v35, v36, v37, v38, v39, v40, v41, v42);
            }
          }
          else
          {
            -[CIContext render:toIOSurface:bounds:colorSpace:](self, "render:toIOSurface:bounds:colorSpace:", image, v43, colorSpace, v17, v18, v19, v20);
          }
        }
        else
        {
          CGFloat v27 = ci_logger_api();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[CIContext render:toMTLTexture:commandBuffer:bounds:colorSpace:](v27, v28, v29, v30, v31, v32, v33, v34);
          }
        }
      }
    }
  }
}

- (__IOSurface)createIOSurface:(id)a3
{
  [a3 extent];

  return -[CIContext createIOSurface:fromRect:](self, "createIOSurface:fromRect:", a3);
}

- (__IOSurface)createIOSurface:(id)a3 fromRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v10 = (void *)MEMORY[0x199702DB0](self, a2);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGRect v24 = CGRectStandardize(v23);
  if (!a3) {
    goto LABEL_7;
  }
  double v11 = v24.origin.x;
  double v12 = v24.origin.y;
  double v13 = v24.size.width;
  double v14 = v24.size.height;
  if (![(CIContext *)self _internalContext]) {
    goto LABEL_7;
  }
  v25.origin.CGFloat x = v11;
  v25.origin.CGFloat y = v12;
  v25.size.CGFloat width = v13;
  v25.size.CGFloat height = v14;
  if (CGRectIsInfinite(v25)) {
    goto LABEL_7;
  }
  [a3 extent];
  v27.origin.CGFloat x = v15;
  v27.origin.CGFloat y = v16;
  v27.size.CGFloat width = v17;
  v27.size.CGFloat height = v18;
  v26.origin.CGFloat x = v11;
  v26.origin.CGFloat y = v12;
  v26.size.CGFloat width = v13;
  v26.size.CGFloat height = v14;
  if (CGRectIntersectsRect(v26, v27))
  {
    double v19 = [(CIContext *)self _internalContext];
    unsigned int v20 = (*(uint64_t (**)(void *, uint64_t))(*(void *)v19 + 544))(v19, 266);
    Surface = CreateSurface((__CVBuffer *)vcvtpd_u64_f64(v13), (__CVBuffer *)vcvtpd_u64_f64(v14), (void *)v20, 1111970369, 1);
    if (Surface) {
      -[CIContext render:toIOSurface:bounds:colorSpace:](self, "render:toIOSurface:bounds:colorSpace:", a3, Surface, [(CIContext *)self _outputColorSpace], v11, v12, v13, v14);
    }
  }
  else
  {
LABEL_7:
    Surface = 0;
  }
  return Surface;
}

- (void)render:(CIImage *)image toIOSurface:(IOSurfaceRef)surface bounds:(CGRect)bounds colorSpace:(CGColorSpaceRef)colorSpace
{
  double height = bounds.size.height;
  double width = bounds.size.width;
  double y = bounds.origin.y;
  double x = bounds.origin.x;
  double v14 = (void *)MEMORY[0x199702DB0](self, a2);
  [(CIContext *)self _gpuContextCheck];
  CGFloat v15 = [(CIContext *)self _internalContext];
  if (image)
  {
    if (surface)
    {
      CGFloat v16 = v15;
      if (v15)
      {
        CGFloat v17 = [[CIRenderDestination alloc] initWithIOSurface:surface];
        [(CIRenderDestination *)v17 setColorSpace:colorSpace];
        if (!v16[40]) {
          [(CIRenderDestination *)v17 setAlphaMode:2];
        }
        if (!v16[41]) {
          [(CIRenderDestination *)v17 setClamped:0];
        }
        CGFloat v18 = -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", image, v17, 0, x, y, width, height, x, y);

        if (v18) {
          [(CIRenderTask *)v18 waitUntilCompletedAndReturnError:0];
        }
      }
    }
  }
}

- (CGLayerRef)createCGLayerWithSize:(CGSize)size info:(CFDictionaryRef)info
{
  CGFloat height = size.height;
  CGFloat width = size.width;
  int v7 = CGColorSpaceRetain([(CIContext *)self workingColorSpace]);
  if (!v7) {
    int v7 = +[CIContext defaultRGBColorSpace];
  }
  uint64_t v8 = CGBitmapContextCreate(0, 1uLL, 1uLL, 8uLL, 0, v7, 2u);
  CGColorSpaceRelease(v7);
  if (!v8) {
    return 0;
  }
  v11.CGFloat width = width;
  v11.CGFloat height = height;
  CGFloat v9 = CGLayerCreateWithContext(v8, v11, info);
  CGContextRelease(v8);
  return v9;
}

- (unint64_t)maximumInputImageSize
{
  unint64_t result = [(CIContext *)self _internalContext];
  if (result)
  {
    v3 = *(uint64_t (**)(void))(*(void *)result + 448);
    return v3();
  }
  return result;
}

- (unint64_t)maximumOutputImageSize
{
  unint64_t result = [(CIContext *)self _internalContext];
  if (result)
  {
    v3 = *(uint64_t (**)(void))(*(void *)result + 456);
    return v3();
  }
  return result;
}

- (CGSize)inputImageMaximumSize
{
  v2 = [(CIContext *)self _internalContext];
  if (v2) {
    double v3 = (double)(unint64_t)(*(uint64_t (**)(void *))(*(void *)v2 + 448))(v2);
  }
  else {
    double v3 = 0.0;
  }
  double v4 = v3;
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (CGSize)outputImageMaximumSize
{
  v2 = [(CIContext *)self _internalContext];
  if (v2) {
    double v3 = (double)(unint64_t)(*(uint64_t (**)(void *))(*(void *)v2 + 456))(v2);
  }
  else {
    double v3 = 0.0;
  }
  double v4 = v3;
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (CGColorSpaceRef)workingColorSpace
{
  CGColorSpaceRef result = [(CIContext *)self _internalContext];
  if (result) {
    return (CGColorSpaceRef)*((void *)result + 3);
  }
  return result;
}

- (CIFormat)workingFormat
{
  v2 = [(CIContext *)self _internalContext];
  if (v2) {
    LODWORD(v2) = v2[8];
  }
  return (int)v2;
}

+ (CGColorSpace)defaultWorkingColorSpace
{
  v2 = (CGColorSpace *)CI::Context::defaultWorkingSpace((CI::Context *)a1);

  return CGColorSpaceRetain(v2);
}

+ (CGColorSpace)defaultRGBColorSpace
{
  {
    if (v4)
    {
      +[CIContext defaultRGBColorSpace]::space = CI::Context::defaultOutputRGBSpace(v4);
    }
  }
  v2 = (CGColorSpace *)+[CIContext defaultRGBColorSpace]::space;

  return CGColorSpaceRetain(v2);
}

+ (CGColorSpace)defaultGrayColorSpace
{
  {
    if (v4)
    {
      +[CIContext defaultGrayColorSpace]::space = CI::Context::defaultOutputGraySpace(v4);
    }
  }
  v2 = (CGColorSpace *)+[CIContext defaultGrayColorSpace]::space;

  return CGColorSpaceRetain(v2);
}

- (void)clearCaches
{
  v2 = [(CIContext *)self _internalContext];
  if (v2)
  {
    double v3 = *(void (**)(void))(*(void *)v2 + 608);
    v3();
  }
}

- (id)flatten:(id)a3 fromRect:(CGRect)a4 format:(int)a5 colorSpace:(CGColorSpace *)a6
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v7 = ci_logger_api();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 136446210;
    CGFloat v10 = "-[CIContext flatten:fromRect:format:colorSpace:]";
    _os_log_impl(&dword_193671000, v7, OS_LOG_TYPE_INFO, "%{public}s was called but ignored.", (uint8_t *)&v9, 0xCu);
  }
  return a3;
}

- (BOOL)measureRequirementsOf:(id)a3 query:(int)a4 :(id *)a5 results:(CGRect *)a6
{
  if (a3) {
    BOOL v6 = a4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v8 = v6 || a6 == 0 || a5 == 0;
  char v9 = v8;
  if (!v8)
  {
    uint64_t v11 = a5;
    LODWORD(v12) = a4;
    [(CIContext *)self bounds];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    memset(&v36, 0, sizeof(v36));
    if (self) {
      [(CIContext *)self CTM];
    }
    else {
      memset(&v35, 0, sizeof(v35));
    }
    CGAffineTransformInvert(&v36, &v35);
    CGAffineTransform v34 = v36;
    v37.origin.double x = v16;
    v37.origin.double y = v18;
    v37.size.double width = v20;
    v37.size.double height = v22;
    CGRect v38 = CGRectApplyAffineTransform(v37, &v34);
    if ((int)v12 >= 1)
    {
      double x = v38.origin.x;
      double y = v38.origin.y;
      double width = v38.size.width;
      double height = v38.size.height;
      uint64_t v12 = v12;
      p_size = &a6->size;
      do
      {
        uint64_t v28 = (uint64_t)*v11++;
        objc_msgSend(a3, "regionOfInterestForImage:inRect:", v28, x, y, width, height);
        p_size[-1].double width = v29;
        p_size[-1].double height = v30;
        p_size->double width = v31;
        p_size->double height = v32;
        p_size += 2;
        --v12;
      }
      while (v12);
    }
  }
  return v9 ^ 1;
}

- (void)setCTM:(CGAffineTransform *)a3
{
  double v4 = [(CIContext *)self _internalContext];
  if (v4)
  {
    long long v5 = *(_OWORD *)&a3->c;
    v6[0] = *(_OWORD *)&a3->a;
    v6[1] = v5;
    v6[2] = *(_OWORD *)&a3->tx;
    (*(void (**)(void *, _OWORD *))(*(void *)v4 + 128))(v4, v6);
  }
}

- (CGAffineTransform)CTM
{
  CGColorSpaceRef result = [(CIContext *)self _internalContext];
  if (result)
  {
    long long v5 = *(uint64_t (**)(void))(*(void *)&result->a + 136);
    return (CGAffineTransform *)v5();
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4F1DAB8];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v6 + 32);
  }
  return result;
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  long long v7 = [(CIContext *)self _internalContext];
  if (v7)
  {
    uint64_t v12 = *(void (**)(__n128, __n128, __n128, __n128))(*(void *)v7 + 176);
    v8.n128_f64[0] = x;
    v9.n128_f64[0] = y;
    v10.n128_f64[0] = width;
    v11.n128_f64[0] = height;
    v12(v8, v9, v10, v11);
  }
}

- (CGRect)bounds
{
  v2 = [(CIContext *)self _internalContext];
  if (v2)
  {
    (*(void (**)(void *))(*(void *)v2 + 184))(v2);
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (id)description
{
  double v3 = [(CIContext *)self _internalContext];
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __24__CIContext_description__block_invoke;
    v5[3] = &unk_1E5771328;
    v5[4] = self;
    v5[5] = v3;
    return (id)(id)stream_to_string((uint64_t)v5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CIContext;
    return [(CIContext *)&v6 description];
  }
}

uint64_t __24__CIContext_description__block_invoke(uint64_t a1, FILE *a2)
{
  double v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  fprintf(a2, "<%s: %p", v4, *(const void **)(a1 + 32));
  double v5 = (const char *)(*(uint64_t (**)(void))(**(void **)(a1 + 40) + 304))();
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 272))();
  fprintf(a2, " (%s %d)", v5, v6);
  if ([*(id *)(a1 + 32) isMetalBased])
  {
    long long v7 = (const void *)CI::MetalContext::device(*(id **)(a1 + 40));
    fprintf(a2, " MTLDevice=%p", v7);
  }
  [*(id *)(a1 + 32) bounds];
  double x = v24.origin.x;
  double y = v24.origin.y;
  double width = v24.size.width;
  double height = v24.size.height;
  if (!CGRectIsInfinite(v24))
  {
    v25.origin.double x = x;
    v25.origin.double y = y;
    v25.size.double width = width;
    v25.size.double height = height;
    if (CGRectIsEmpty(v25)) {
      fwrite(" bounds=[empty]", 0xFuLL, 1uLL, a2);
    }
    else {
      fprintf(a2, " bounds=[%g %g %g %g]", x, y, width, height);
    }
  }
  fwrite(">\n", 2uLL, 1uLL, a2);
  uint64_t v12 = (const void *)[*(id *)(a1 + 32) clientCommandQueue];
  if (v12) {
    fprintf(a2, "    withMTLCommandQueue: %p\n", v12);
  }
  if ([*(id *)(a1 + 32) _isCGBackedContext]) {
    fprintf(a2, "    withCGContext: %p\n", *(const void **)(*(void *)(a1 + 40) + 48));
  }
  if ([*(id *)(a1 + 32) _isGLBackedContext]) {
    fprintf(a2, "    withGLContext: %p\n", *(const void **)(*(void *)(a1 + 40) + 392));
  }
  double v13 = *(const char **)(a1 + 40);
  if (v13[236])
  {
    fprintf(a2, "    name: %s\n", v13 + 236);
    double v13 = *(const char **)(a1 + 40);
  }
  int v14 = (*(uint64_t (**)(const char *))(*(void *)v13 + 232))(v13);
  double v15 = "yes";
  if (v14 == -1) {
    double v15 = "no";
  }
  fprintf(a2, "    cacheIntermediates: %s\n", v15);
  int v16 = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 264))();
  if (v16 == -1)
  {
    double v17 = "    priority: low\n";
    size_t v18 = 18;
  }
  else if (v16 == 1)
  {
    double v17 = "    priority: high\n";
    size_t v18 = 19;
  }
  else
  {
    if (v16) {
      goto LABEL_24;
    }
    double v17 = "    priority: default\n";
    size_t v18 = 22;
  }
  fwrite(v17, v18, 1uLL, a2);
LABEL_24:
  fwrite("    workingSpace: ", 0x12uLL, 1uLL, a2);
  CI::fprintf_cs(a2, *(__sFILE **)(*(void *)(a1 + 40) + 24), (CGColorSpace *)1);
  fputc(10, a2);
  double v19 = CI::name_for_format(*(_DWORD *)(*(void *)(a1 + 40) + 32));
  fprintf(a2, "    workingFormat: %s\n", v19);
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 40) + 168))(*(void *)(a1 + 40))) {
    fwrite("    lossyIntermediates: true\n", 0x1DuLL, 1uLL, a2);
  }
  int v20 = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 216))(*(void *)(a1 + 40));
  double v21 = "Low";
  if (v20) {
    double v21 = "High";
  }
  fprintf(a2, "    downsampleQuality: %s\n", v21);
  unint64_t v22 = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 488))();
  uint64_t result = fprintf(a2, "    maxRenderLoad: %ld MB", v22 >> 20);
  if (*(void *)(*(void *)(a1 + 40) + 368)) {
    return fprintf(a2, "    memoryLimit: %ld MB", *(void *)(*(void *)(a1 + 40) + 368));
  }
  return result;
}

- (id)createColorCubeDataForFilters:(id)a3 dimension:(int)a4 colorSpace:(CGColorSpace *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int v9 = 4 * a4;
  int v10 = a4 * a4;
  uint64_t v11 = a4 * a4 * 4 * a4;
  uint64_t v12 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v11];
  if (!v12) {
    return 0;
  }
  double v13 = v12;
  int v14 = (unsigned char *)[v12 mutableBytes];
  if (a4 >= 1)
  {
    int v15 = 0;
    double v16 = (float)(a4 - 1);
    do
    {
      int v17 = 0;
      do
      {
        int v18 = 0;
        do
        {
          unsigned char *v14 = (int)((float)v18 * 255.0 / v16);
          v14[1] = (int)((float)v17 * 255.0 / v16);
          v14[2] = (int)((float)v15 * 255.0 / v16);
          v14[3] = -1;
          v14 += 4;
          ++v18;
        }
        while (a4 != v18);
        ++v17;
      }
      while (v17 != a4);
      ++v15;
    }
    while (v15 != a4);
  }
  CGAffineTransform v36 = self;
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  int v20 = DeviceRGB;
  if (a5) {
    double v21 = a5;
  }
  else {
    double v21 = DeviceRGB;
  }
  double v22 = (double)a4;
  double v23 = (double)v10;
  uint64_t v34 = v9;
  CGAffineTransform v35 = v21;
  CGRect v24 = +[CIImage imageWithBitmapData:bytesPerRow:size:format:colorSpace:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v13, (double)a4, (double)v10);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v25 = [a3 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(a3);
        }
        CGFloat v29 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v30 = (id)[v29 valueForKey:@"inputImage"];
        [v29 setValue:v24 forKey:@"inputImage"];
        CGRect v24 = (CIImage *)[v29 outputImage];
        [v29 setValue:v30 forKey:@"inputImage"];
      }
      uint64_t v26 = [a3 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v26);
  }
  CGFloat v31 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v11];
  CGFloat v32 = v31;
  if (v31) {
    -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v36, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v24, [v31 mutableBytes], v34, 264, v35, 0.0, 0.0, v22, v23);
  }
  CGColorSpaceRelease(v20);
  return v32;
}

- (id)createColorCubeDataForFilters:(id)a3 dimension:(int)a4
{
  return [(CIContext *)self createColorCubeDataForFilters:a3 dimension:*(void *)&a4 colorSpace:0];
}

+ (void)internalGLContextWithOptions:(id)a3
{
  return +[CIContext internalContextWithEAGLContext:0 options:a3];
}

+ (void)internalContextWithEAGLContext:(id)a3 options:(id)a4
{
  if (CIGLIsUsable())
  {
    BOOL v23 = 0;
    GetOutputColorSpaceFromOptions((NSDictionary *)a4, &v23);
    if (v23)
    {
      GetWorkingColorSpaceFromOptions((NSDictionary *)a4, &v23);
      if (v23)
      {
        double v5 = (void *)[a4 valueForKey:@"working_format"];
        long long v7 = v5;
        if (v5) {
          uint64_t v8 = [v5 intValue];
        }
        else {
          uint64_t v8 = 0;
        }
        int v10 = CI::format_modernize(v8, (CI *)"+[CIContext(Internal) internalContextWithEAGLContext:options:]", v6);
        if (v7 && v10 != 266 && v10 != 264 && v10 != 2056)
        {
          uint64_t v11 = CI::name_for_format(v10);
          uint64_t v12 = ci_logger_api();
          BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
          if (v11)
          {
            if (v13) {
              +[CIContext(Internal) internalContextWithEAGLContext:options:].cold.4();
            }
          }
          else if (v13)
          {
            +[CIContext(Internal) internalContextWithEAGLContext:options:](v12, v14, v15, v16, v17, v18, v19, v20);
          }
        }
        if (a4) {
          [a4 objectForKey:@"output_premultiplied"];
        }
        double v21 = (void *)[a4 objectForKey:@"kCIContextIntermediateMemoryTarget"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v21 intValue];
        }
        else if (defaultIntermediateMemoryTarget(void)::onceToken != -1)
        {
          dispatch_once(&defaultIntermediateMemoryTarget(void)::onceToken, &__block_literal_global_402);
        }
        double v22 = (void *)[a4 objectForKey:@"kCIContextMemoryLimit"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v22 intValue];
        }
        [a4 valueForKey:@"CoreUI"];
        operator new();
      }
    }
  }
  return 0;
}

uint64_t __66__CIContext_Internal__internalContextWithMTLCommandQueue_options___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "newCaptureScopeWithDevice:", objc_msgSend(*(id *)(a1 + 40), "device"));
  [v2 setLabel:objc_msgSend(NSString, "stringWithFormat:", @"CoreImage <%@>", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "device"), "name"))];
  double v3 = *(void **)(a1 + 32);

  return [v3 setDefaultCaptureScope:v2];
}

uint64_t __66__CIContext_Internal__internalContextWithMTLCommandQueue_options___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 208))();
}

uint64_t __66__CIContext_Internal__internalContextWithMTLCommandQueue_options___block_invoke_3(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(result + 32) + 41) = a2;
  return result;
}

uint64_t __66__CIContext_Internal__internalContextWithMTLCommandQueue_options___block_invoke_305(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 160))();
}

+ (void)internalSWContextWithOptions:(id)a3
{
  BOOL v25 = 0;
  GetOutputColorSpaceFromOptions((NSDictionary *)a3, &v25);
  if (v25)
  {
    GetWorkingColorSpaceFromOptions((NSDictionary *)a3, &v25);
    if (v25)
    {
      double v4 = (void *)[a3 valueForKey:@"working_format"];
      int v6 = v4;
      if (v4) {
        uint64_t v7 = [v4 intValue];
      }
      else {
        uint64_t v7 = 0;
      }
      int v8 = CI::format_modernize(v7, (CI *)"+[CIContext(Internal) internalSWContextWithOptions:]", v5);
      if (v6)
      {
        BOOL v9 = v8 == 266 || v8 == 264;
        BOOL v10 = v9 || v8 == 2056;
        if (!v10 && v8 != 2312)
        {
          uint64_t v12 = CI::name_for_format(v8);
          BOOL v13 = ci_logger_api();
          BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
          if (v12)
          {
            if (v14)
            {
              +[CIContext(Internal) internalContextWithMTLCommandQueue:options:]();
              if (!a3)
              {
LABEL_26:
                double v22 = (void *)[a3 objectForKey:@"kCIContextIntermediateMemoryTarget"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v22 intValue];
                }
                else if (defaultIntermediateMemoryTarget(void)::onceToken != -1)
                {
                  dispatch_once(&defaultIntermediateMemoryTarget(void)::onceToken, &__block_literal_global_402);
                }
                BOOL v23 = (void *)[a3 objectForKey:@"kCIContextMemoryLimit"];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [v23 intValue];
                }
                operator new();
              }
LABEL_24:
              [a3 objectForKey:@"output_premultiplied"];
              goto LABEL_26;
            }
          }
          else if (v14)
          {
            +[CIContext(Internal) internalContextWithMTLCommandQueue:options:](v13, v15, v16, v17, v18, v19, v20, v21);
            if (!a3) {
              goto LABEL_26;
            }
            goto LABEL_24;
          }
        }
      }
      if (!a3) {
        goto LABEL_26;
      }
      goto LABEL_24;
    }
  }
  return 0;
}

uint64_t __52__CIContext_Internal__internalSWContextWithOptions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 208))();
}

uint64_t __52__CIContext_Internal__internalSWContextWithOptions___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(result + 32) + 41) = a2;
  return result;
}

uint64_t __52__CIContext_Internal__internalSWContextWithOptions___block_invoke_306(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 160))();
}

+ (void)internalCLContextWithOptions:(id)a3 glContext:(void *)a4
{
  return 0;
}

+ (void)internalCLContextWithOptions:(id)a3
{
  return (void *)[a1 internalCLContextWithOptions:a3 glContext:0];
}

- (id)_CPUShadow
{
  id v2 = [(CIContext *)self _internalContext];
  if ((*(unsigned int (**)(CI::MetalContext *))(*(void *)v2 + 16))(v2) == 77)
  {
    double v3 = (CI::Object *)CI::MetalContext::SWShadow(v2);
    id v4 = [[CIContext alloc] _initWithInternalRepresentation:v3];
    if (v3) {
      CI::Object::unref(v3);
    }
    return v4;
  }
  else
  {
    return self;
  }
}

- (id)_createClone
{
  id v2 = [(CIContext *)self _internalContext];
  int v3 = (*(uint64_t (**)(void *))(*(void *)v2 + 16))(v2);
  switch(v3)
  {
    case 'K':
      operator new();
    case 'M':
      operator new();
    case 'L':
      operator new();
  }
  return 0;
}

- (id)_pdfDataRepresentation
{
  return 0;
}

+ (id)_namedCache
{
  if (+[CIContext(_createCached) _namedCache]::onceToken != -1) {
    dispatch_once(&+[CIContext(_createCached) _namedCache]::onceToken, &__block_literal_global_11);
  }
  return (id)+[CIContext(_createCached) _namedCache]::cache;
}

uint64_t __39__CIContext__createCached___namedCache__block_invoke()
{
  +[CIContext(_createCached) _namedCache]::cache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);
  [(id)+[CIContext(_createCached) _namedCache]::cache setName:@"com.apple.coreimage.nscache.CIContext"];
  [(id)+[CIContext(_createCached) _namedCache]::cache setCountLimit:256];
  v0 = (void *)+[CIContext(_createCached) _namedCache]::cache;

  return [v0 setEvictsObjectsWhenApplicationEntersBackground:1];
}

+ (id)_cachedContext:(id)a3 options:(id)a4
{
  int v6 = (void *)[a1 _namedCache];
  uint64_t v7 = (void *)[v6 objectForKey:a3];
  if (v7)
  {
    id v8 = v7;
    return v8;
  }
  else
  {
    BOOL v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [v10 addEntriesFromDictionary:a4];
    [v10 setObject:a3 forKeyedSubscript:@"kCIContextName"];
    [v10 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"kCIContextCacheIntermediates"];
    uint64_t v11 = +[CIContext contextWithOptions:v10];
    [v6 setObject:v11 forKey:a3];
    return v11;
  }
}

- (CGImage)createCGImage:(id)a3 fromRect:(CGRect)a4 format:(int)a5 premultiplied:(BOOL)a6 colorSpace:(CGColorSpace *)a7 deferred:(BOOL)a8 renderCallback:(id)a9
{
  BOOL v10 = a8;
  BOOL v12 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v19 = CI::format_modernize(*(uint64_t *)&a5, (CI *)"-[CIContext(createCGImageInternal) createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:]", (const char *)a3);
  if (v10) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = 255;
  }

  return -[CIContext _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:](self, "_createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:", a3, v19, v12, a7, v20, a9, x, y, width, height);
}

- (CGImage)createCGImage:(id)a3 fromRect:(CGRect)a4 format:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v12 = [(CIContext *)self _outputColorSpace];
  uint64_t v14 = CI::format_modernize(v5, (CI *)"-[CIContext(createCGImage) createCGImage:fromRect:format:]", v13);
  CFTypeID TypeID = CGColorSpaceGetTypeID();
  if (TypeID == CFGetTypeID(v12) && CGColorSpaceSupportsOutput(v12))
  {
    int is_luminance = CI::format_is_luminance(v14);
    CGColorSpaceModel Model = CGColorSpaceGetModel(v12);
    if (is_luminance)
    {
      if (Model) {
        goto LABEL_5;
      }
    }
    else if (Model != kCGColorSpaceModelRGB)
    {
      goto LABEL_5;
    }
    CGColorSpaceRetain(v12);
    goto LABEL_9;
  }
LABEL_5:
  if (CI::format_is_luminance(v14)) {
    uint64_t v18 = +[CIContext defaultGrayColorSpace];
  }
  else {
    uint64_t v18 = +[CIContext defaultRGBColorSpace];
  }
  BOOL v12 = v18;
LABEL_9:
  uint64_t v19 = -[CIContext createCGImage:fromRect:format:colorSpace:](self, "createCGImage:fromRect:format:colorSpace:", a3, v14, v12, x, y, width, height);
  CGColorSpaceRelease(v12);
  return v19;
}

- (CGImageRef)createCGImage:(CIImage *)image fromRect:(CGRect)fromRect format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace deferred:(BOOL)deferred
{
  BOOL v7 = deferred;
  double height = fromRect.size.height;
  double width = fromRect.size.width;
  double y = fromRect.origin.y;
  double x = fromRect.origin.x;
  uint64_t v15 = CI::format_modernize(*(uint64_t *)&format, (CI *)"-[CIContext(createCGImage) createCGImage:fromRect:format:colorSpace:deferred:]", (const char *)image);
  uint64_t v16 = *(unsigned __int8 *)([(CIContext *)self _internalContext] + 40);
  if (v7) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = 255;
  }

  return -[CIContext _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:](self, "_createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:", image, v15, v16, colorSpace, v17, 0, x, y, width, height);
}

- (id)addAuxOptionsForSDR:(id)a3 HDR:(id)a4 colorSpace:(CGColorSpace *)a5 rgbGainmap:(BOOL)a6
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return 0;
  }
  BOOL v6 = a6;
  [a4 extent];
  if (CGRectIsEmpty(v122)) {
    return 0;
  }
  [a4 extent];
  if (CGRectIsInfinite(v123)) {
    return 0;
  }
  [a4 contentHeadroom];
  float v12 = v11;
  ExtendedLinearized = CGColorSpaceCreateExtendedLinearized(a5);
  if (!ExtendedLinearized) {
    ExtendedLinearized = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE0]);
  }
  uint64_t v14 = (void *)[a3 imageByColorMatchingWorkingSpaceToColorSpace:ExtendedLinearized];
  uint64_t v15 = (void *)[a4 imageByColorMatchingWorkingSpaceToColorSpace:ExtendedLinearized];
  CGColorSpaceRelease(ExtendedLinearized);
  uint64_t v16 = (void *)[v14 _imageByClampingAlpha];
  [v15 extent];
  CGFloat v18 = -v17;
  [v15 extent];
  CGAffineTransformMakeTranslation(&v105, v18, -v19);
  CGAffineTransform v104 = v105;
  uint64_t v20 = (CIImage *)[v15 imageByApplyingTransform:&v104 highQualityDownsample:0];
  [v16 extent];
  CGFloat v22 = -v21;
  [v16 extent];
  CGAffineTransformMakeTranslation(&v120, v22, -v23);
  CGAffineTransform v105 = v120;
  CGAffineTransform v103 = v120;
  CGRect v24 = (CIImage *)[v16 imageByApplyingTransform:&v103 highQualityDownsample:0];
  [(CIImage *)v24 extent];
  double v26 = v25;
  [(CIImage *)v20 extent];
  *(float *)&double v26 = v26 / v27;
  [(CIImage *)v24 extent];
  double v29 = v28;
  [(CIImage *)v20 extent];
  float v31 = v29 / v30;
  CGFloat v32 = downScale(v20, *(float *)&v26, v31);
  [(CIImage *)v32 extent];
  double v34 = v33;
  [(CIImage *)v24 extent];
  *(float *)&double v34 = v34 / v35;
  [(CIImage *)v32 extent];
  double v37 = v36;
  [(CIImage *)v24 extent];
  float v39 = v37 / v38;
  long long v40 = downScale(v24, *(float *)&v34, v39);
  v120.a = 0.0;
  v120.b = 0.0;
  uint64_t v41 = [[CIRenderDestination alloc] initWithBitmapData:&v120 width:1 height:1 bytesPerRow:16 format:2054];
  uint64_t v42 = v41;
  [(CIRenderDestination *)v41 setColorSpace:0];
  if (v12 == 0.0)
  {
    uint64_t v43 = downScale([(CIImage *)v32 imageByApplyingFilter:@"CIMaximumComponent"], 0.125, 0.125);
    v118 = @"inputExtent";
    [(CIImage *)v43 extent];
    CFStringRef v119 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    uint64_t v44 = -[CIImage imageByApplyingFilter:withInputParameters:](v43, "imageByApplyingFilter:withInputParameters:", @"CIAreaMaximum", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1]);
    -[CIRenderTask waitUntilCompletedAndReturnError:](-[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", v44, v41, 0, 0.0, 0.0, 1.0, 1.0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8)), "waitUntilCompletedAndReturnError:", 0);
    _H0 = LOWORD(v120.a);
    __asm { FCVT            D0, H0 }
    double v51 = fmax(_D0, 1.0);
  }
  else
  {
    double v51 = v12;
  }
  float v52 = v51;
  float v53 = log2f(v52);
  if (v51 <= 1.0) {
    return 0;
  }
  BOOL v54 = +[CIKernel kernelWithInternalRepresentation:&CI::_flexMapLinGain];
  os_signpost_id_t v102 = +[CIKernel kernelWithInternalRepresentation:&CI::_flexMapLinGainRGB];
  [(CIImage *)v32 extent];
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;
  v117[0] = v32;
  v117[1] = v40;
  v117[2] = &unk_1EE4AB540;
  v117[3] = &unk_1EE4AB540;
  uint64_t v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:4];
  CGImageRef v115 = @"kCIKernelOutputFormat";
  uint64_t v116 = [NSNumber numberWithInt:2053];
  id v64 = -[CIColorKernel applyWithExtent:arguments:options:](v54, "applyWithExtent:arguments:options:", v63, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1], v56, v58, v60, v62);
  [(CIImage *)v32 extent];
  _D9 = v65;
  double v68 = v67;
  double v70 = v69;
  double v72 = v71;
  v114[0] = v32;
  v114[1] = v40;
  v114[2] = &unk_1EE4AB540;
  v114[3] = &unk_1EE4AB540;
  uint64_t v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:4];
  int v112 = @"kCIKernelOutputFormat";
  uint64_t v113 = [NSNumber numberWithInt:2056];
  id v74 = -[CIColorKernel applyWithExtent:arguments:options:](v102, "applyWithExtent:arguments:options:", v73, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1], _D9, v68, v70, v72);
  CGRect v75 = downScale((CIImage *)[v64 imageByApplyingFilter:@"CIMedianFilter"], 0.125, 0.125);
  int v110 = @"inputExtent";
  [(CIImage *)v75 extent];
  int v111 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  uint64_t v76 = -[CIImage imageByApplyingFilter:withInputParameters:](v75, "imageByApplyingFilter:withInputParameters:", @"CIAreaMinMaxRed", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1]);
  -[CIRenderTask waitUntilCompletedAndReturnError:](-[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", v76, v41, 0, 0.0, 0.0, 1.0, 1.0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8)), "waitUntilCompletedAndReturnError:", 0);
  _H0 = LOWORD(v120.a);
  __asm { FCVT            S0, H0; float }
  _H1 = WORD1(v120.a);
  __asm { FCVT            S9, H1 }
  float v80 = log2f(_S0);
  float v81 = log2f(*(float *)&_D9);
  if (v80 > -0.01 && v80 <= 0.0) {
    float v80 = 0.0;
  }
  if (v6)
  {
    uint64_t v83 = +[CIKernel kernelWithInternalRepresentation:&CI::_flexMapImageRGB];
    [v74 extent];
    double v85 = v84;
    double v87 = v86;
    double v89 = v88;
    double v91 = v90;
    id v109 = v74;
    CGFloat v92 = &v109;
  }
  else
  {
    uint64_t v83 = +[CIKernel kernelWithInternalRepresentation:&CI::_flexMapImage];
    [v64 extent];
    double v85 = v84;
    double v87 = v94;
    double v89 = v95;
    double v91 = v96;
    id v108 = v64;
    CGFloat v92 = &v108;
  }
  *(float *)&double v84 = v80;
  v92[1] = (id)[NSNumber numberWithFloat:v84];
  *(float *)&double v97 = v81;
  v92[2] = (id)[NSNumber numberWithFloat:v97];
  id result = -[CIColorKernel applyWithExtent:arguments:](v83, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:3], v85, v87, v89, v91);
  if (result)
  {
    id v98 = result;
    v106[0] = @"kCIImageRepresentationISOGainMapAlternateHeadroom";
    v107[0] = [NSNumber numberWithDouble:v53];
    v107[1] = &unk_1EE4A8280;
    v106[1] = @"kCIImageRepresentationISOGainMapBaseHeadroom";
    v106[2] = @"kCIImageRepresentationISOGainMapMin";
    *(float *)&double v99 = v80;
    v107[2] = [NSNumber numberWithFloat:v99];
    v106[3] = @"kCIImageRepresentationISOGainMapMax";
    *(float *)&double v100 = v81;
    v107[3] = [NSNumber numberWithFloat:v100];
    v107[4] = &unk_1EE4AB540;
    v106[4] = @"kCIImageRepresentationISOGainMapOffset";
    v106[5] = @"kCIImageRepresentationHDRGainMapAsRGB";
    uint64_t v101 = [NSNumber numberWithBool:v6];
    v106[6] = @"kCIImageRepresentationISOGainMapImage";
    v107[5] = v101;
    v107[6] = v98;
    return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:7];
  }
  return result;
}

- (id)_dataRepresentationOfImage:(id)a3 UTIType:(id)a4 format:(int)a5 premultiplied:(BOOL)a6 colorSpace:(CGColorSpace *)a7 options:(id)a8 addAuxData:(BOOL)a9 keysToMerge:(id)a10 error:(id *)a11
{
  BOOL v13 = a6;
  uint64_t v14 = *(void *)&a5;
  v214[7] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x199702DB0](self, a2);
  uint64_t v184 = 0;
  uint64_t v185 = (double *)&v184;
  uint64_t v186 = 0x5012000000;
  CGRect v187 = __Block_byref_object_copy__1;
  CGRect v188 = __Block_byref_object_dispose__1;
  CGRect v189 = "";
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v190 = *MEMORY[0x1E4F1DB20];
  long long v191 = v17;
  uint64_t v178 = 0;
  v179 = &v178;
  uint64_t v180 = 0x3052000000;
  v181 = __Block_byref_object_copy__53;
  uint64_t v182 = __Block_byref_object_dispose__54;
  uint64_t v183 = 0;
  if (([a4 isEqual:@"public.jpeg"] & 1) == 0) {
    [a4 isEqual:@"public.heic"];
  }
  [a3 extent];
  v177[0] = MEMORY[0x1E4F143A8];
  v177[1] = 3221225472;
  v177[2] = __138__CIContext_ImageRepresentation___dataRepresentationOfImage_UTIType_format_premultiplied_colorSpace_options_addAuxData_keysToMerge_error___block_invoke;
  v177[3] = &unk_1E5771460;
  v177[4] = &v184;
  v177[5] = &v178;
  CGFloat v18 = -[CIContext createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:](self, "createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:", a3, v14, v13, a7, 1, v177);
  double v19 = v18;
  if (!v18)
  {
    *(void *)&long long v205 = @"CINonLocalizedDescriptionKey";
    *(void *)&buf[0] = @"failed to create data representation.";
    uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v205 count:1];
    double v35 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CINonLocalizedDescriptionKey" code:3 userInfo:v34];
    id v36 = v35;
LABEL_162:
    dataa = 0;
    goto LABEL_163;
  }
  CFAutorelease(v18);
  int data = v14;
  uint64_t v20 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v20, "addEntriesFromDictionary:", objc_msgSend(a3, "properties"));
  uint64_t v21 = *MEMORY[0x1E4F2FB40];
  v195[0] = *MEMORY[0x1E4F2F6B8];
  v195[1] = v21;
  uint64_t v22 = *MEMORY[0x1E4F2FD10];
  v195[2] = *MEMORY[0x1E4F2F578];
  v195[3] = v22;
  double v23 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:4];
  CGRect v24 = a7;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  uint64_t v25 = [v23 countByEnumeratingWithState:&v173 objects:v194 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v174;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v174 != v26) {
          objc_enumerationMutation(v23);
        }
        [v20 removeObjectForKey:*(void *)(*((void *)&v173 + 1) + 8 * i)];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v173 objects:v194 count:16];
    }
    while (v25);
  }
  v164 = self;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  uint64_t v28 = [a10 countByEnumeratingWithState:&v169 objects:v193 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v170;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v170 != v29) {
          objc_enumerationMutation(a10);
        }
        uint64_t v31 = *(void *)(*((void *)&v169 + 1) + 8 * j);
        if ([a8 objectForKey:v31]) {
          objc_msgSend(v20, "setObject:forKey:", objc_msgSend(a8, "objectForKey:", v31), v31);
        }
      }
      uint64_t v28 = [a10 countByEnumeratingWithState:&v169 objects:v193 count:16];
    }
    while (v28);
  }
  if ([a4 isEqual:@"public.tiff"])
  {
    uint64_t v32 = *MEMORY[0x1E4F2FD40];
    id v33 = (id)objc_msgSend((id)objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E4F2FD40]), "mutableCopy");
    if (!v33) {
      id v33 = (id)[MEMORY[0x1E4F1CA60] dictionary];
    }
    if (CI::format_is_deep(data)) {
      [v33 removeObjectForKey:*MEMORY[0x1E4F2FD28]];
    }
    else {
      [v33 setObject:&unk_1EE4AA610 forKey:*MEMORY[0x1E4F2FD28]];
    }
    [v20 setObject:v33 forKeyedSubscript:v32];
  }
  dataa = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
  CGImageDestinationRef v37 = CGImageDestinationCreateWithData(dataa, (CFStringRef)a4, 1uLL, 0);
  double v38 = v37;
  if (!v37)
  {

    *(void *)&long long v205 = @"CINonLocalizedDescriptionKey";
    *(void *)&buf[0] = @"failed to create data representation.";
    uint64_t v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v205 count:1];
    double v35 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CINonLocalizedDescriptionKey" code:3 userInfo:v90];
    id v91 = v35;
    goto LABEL_162;
  }
  CFAutorelease(v37);
  CGImageDestinationAddImage(v38, v19, (CFDictionaryRef)v20);
  if (!a9) {
    goto LABEL_153;
  }
  uint64_t v39 = -[CIContext addAuxOptionsForSDR:HDR:colorSpace:rgbGainmap:](v164, "addAuxOptionsForSDR:HDR:colorSpace:rgbGainmap:", a3, [a8 objectForKeyedSubscript:@"kCIImageRepresentationHDRImage"], v24, objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", @"kCIImageRepresentationHDRGainMapAsRGB"), "BOOLValue"));
  v214[0] = @"kCIImageRepresentationSemanticSegmentationSkinMatteImage";
  v214[1] = @"kCIImageRepresentationSemanticSegmentationHairMatteImage";
  v214[2] = @"kCIImageRepresentationSemanticSegmentationTeethMatteImage";
  v214[3] = @"kCIImageRepresentationSemanticSegmentationGlassesMatteImage";
  v214[4] = @"kCIImageRepresentationSemanticSegmentationSkyMatteImage";
  v214[5] = @"kCIImageRepresentationHDRGainMapImage";
  v214[6] = @"kCIImageRepresentationISOGainMapImage";
  if (v39) {
    id v40 = (id)v39;
  }
  else {
    id v40 = a8;
  }
  uint64_t v41 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v214 count:7];
  uint64_t v42 = *MEMORY[0x1E4F2F3E0];
  v213[0] = *MEMORY[0x1E4F2F3E8];
  v213[1] = v42;
  uint64_t v43 = *MEMORY[0x1E4F2F3D8];
  v213[2] = *MEMORY[0x1E4F2F3F8];
  v213[3] = v43;
  uint64_t v44 = *MEMORY[0x1E4F2F3C0];
  v213[4] = *MEMORY[0x1E4F2F3F0];
  v213[5] = v44;
  v213[6] = @"kCGImageAuxiliaryDataTypeISOGainMap";
  long long v161 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v213 count:7];
  if ([v41 count])
  {
    unint64_t v46 = 0;
    uint64_t v159 = *MEMORY[0x1E4F2F370];
    uint64_t v157 = *MEMORY[0x1E4F2F378];
    uint64_t v158 = *MEMORY[0x1E4F2F380];
    *(void *)&long long v45 = 138543362;
    long long v156 = v45;
    do
    {
      uint64_t v47 = objc_msgSend(v41, "objectAtIndexedSubscript:", v46, v156);
      CGRect v48 = (void *)[v40 objectForKey:v47];
      if (v48)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v48 extent];
          CGFloat x = v215.origin.x;
          CGFloat y = v215.origin.y;
          double width = v215.size.width;
          double height = v215.size.height;
          if (!CGRectIsInfinite(v215))
          {
            v216.origin.CGFloat x = x;
            v216.origin.CGFloat y = y;
            v216.size.double width = width;
            v216.size.double height = height;
            if (!CGRectIsEmpty(v216))
            {
              auxiliaryImageDataint Type = (const __CFString *)[v161 objectAtIndexedSubscript:v46];
              metaint data = CGImageMetadataCreateMutable();
              if ((__CFString *)[v41 objectAtIndexedSubscript:v46] == @"kCIImageRepresentationISOGainMapImage")
              {
                uint64_t v57 = [v40 objectForKeyedSubscript:@"kCIImageRepresentationISOGainMapBaseHeadroom"];
                if (v57) {
                  double v58 = (void *)v57;
                }
                else {
                  double v58 = &unk_1EE4A8280;
                }
                double v59 = (void *)[v40 objectForKeyedSubscript:@"kCIImageRepresentationISOGainMapAlternateHeadroom"];
                uint64_t v60 = [v40 objectForKeyedSubscript:@"kCIImageRepresentationISOGainMapMin"];
                if (v60) {
                  double v61 = (const void *)v60;
                }
                else {
                  double v61 = v58;
                }
                uint64_t v62 = [v40 objectForKeyedSubscript:@"kCIImageRepresentationISOGainMapMax"];
                if (v62) {
                  uint64_t v63 = (const void *)v62;
                }
                else {
                  uint64_t v63 = v59;
                }
                uint64_t v64 = [v40 objectForKeyedSubscript:@"kCIImageRepresentationISOGainMapOffset"];
                if (v64) {
                  double v65 = (const void *)v64;
                }
                else {
                  double v65 = &unk_1EE4A8290;
                }
                int v162 = objc_msgSend((id)objc_msgSend(v40, "objectForKeyedSubscript:", @"kCIImageRepresentationHDRGainMapAsRGB"), "BOOLValue");
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & (v59 != 0)) == 1)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          [v58 floatValue];
                          int v67 = v66;
                          [v59 floatValue];
                          int v69 = v68;
                          CGImageMetadataRegisterNamespaceForPrefix(metadata, @"http://ns.apple.com/HDRToneMap/1.0/", @"HDRToneMap", 0);
                          CGImageMetadataSetValueWithPath(metadata, 0, @"HDRToneMap:Version", @"1");
                          LODWORD(v70) = v67;
                          CGImageMetadataSetValueWithPath(metadata, 0, @"HDRToneMap:BaseHeadroom", (CFTypeRef)[NSNumber numberWithFloat:v70]);
                          LODWORD(v71) = v69;
                          CGImageMetadataSetValueWithPath(metadata, 0, @"HDRToneMap:AlternateHeadroom", (CFTypeRef)[NSNumber numberWithFloat:v71]);
                          CGImageMetadataSetValueWithPath(metadata, 0, @"HDRToneMap:BaseColorIsWorkingColor", @"True");
                          CGImageMetadataSetValueWithPath(metadata, 0, @"HDRToneMap:ChannelMetadata[0].BaseOffset", v65);
                          CGImageMetadataSetValueWithPath(metadata, 0, @"HDRToneMap:ChannelMetadata[0].AlternateOffset", v65);
                          CGImageMetadataSetValueWithPath(metadata, 0, @"HDRToneMap:ChannelMetadata[0].GainMapMin", v61);
                          CGImageMetadataSetValueWithPath(metadata, 0, @"HDRToneMap:ChannelMetadata[0].GainMapMax", v63);
                          CGImageMetadataSetValueWithPath(metadata, 0, @"HDRToneMap:ChannelMetadata[0].Gamma", &unk_1EE4A82A0);
                        }
                      }
                    }
                  }
                }
              }
              else
              {
                int v162 = 0;
              }
              if ((__CFString *)[v41 objectAtIndexedSubscript:v46] != @"kCIImageRepresentationHDRGainMapImage") {
                goto LABEL_82;
              }
              CGImageMetadataTagRef v72 = CGImageMetadataCopyTagWithPath((CGImageMetadataRef)objc_msgSend((id)objc_msgSend(v48, "properties"), "objectForKeyedSubscript:", @"kCGImageAuxiliaryDataInfoMetadata"), 0, @"HDRGainMap:HDRGainMapHeadroom");
              if (v72)
              {
                float v73 = 0.0;
                CFRelease(v72);
              }
              else
              {
                [a3 _makernoteMeteorHeadroom];
                float v73 = v74;
              }
              CGRect v75 = (void *)[v40 objectForKeyedSubscript:@"kCIImageRepresentationHDRGainMapHeadroom"];
              if (v75)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v75 floatValue];
                  float v73 = v76;
                  goto LABEL_74;
                }
              }
              if (v73 > 0.0)
              {
LABEL_74:
                if (v73 > 0.0)
                {
                  CGImageMetadataRegisterNamespaceForPrefix(metadata, @"http://ns.apple.com/HDRGainMap/1.0/", @"HDRGainMap", 0);
                  if (v73 <= 1.0) {
                    uint64_t v77 = 0x10000;
                  }
                  else {
                    uint64_t v77 = 0x20000;
                  }
                  CGImageMetadataSetValueWithPath(metadata, 0, @"HDRGainMap:HDRGainMapVersion", (CFTypeRef)[NSNumber numberWithLong:v77]);
                  if (v73 > 1.0)
                  {
                    *(float *)&double v78 = v73;
                    CGImageMetadataSetValueWithPath(metadata, 0, @"HDRGainMap:HDRGainMapHeadroom", (CFTypeRef)[NSNumber numberWithFloat:v78]);
                  }
LABEL_82:
                  unint64_t v81 = vcvtmd_u64_f64(width);
                  unint64_t v82 = vcvtmd_u64_f64(height);
                  if (v162) {
                    uint64_t v83 = 1380401729;
                  }
                  else {
                    uint64_t v83 = 1278226488;
                  }
                  char v84 = 2;
                  if (!v162) {
                    char v84 = 0;
                  }
                  unint64_t v85 = ((v81 << v84) + 15) & 0xFFFFFFFFFFFFFFF0;
                  double v86 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v85 * v82];
                  uint64_t v87 = [v86 mutableBytes];
                  if (v162) {
                    uint64_t v88 = 268;
                  }
                  else {
                    uint64_t v88 = 259;
                  }
                  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v164, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v48, v87, v85, v88, 0, 0.0, 0.0, (double)v81, (double)v82);
                  v211[0] = v159;
                  v211[1] = v158;
                  v212[0] = v86;
                  v212[1] = metadata;
                  v211[2] = v157;
                  v209[0] = @"BytesPerRow";
                  v210[0] = [NSNumber numberWithUnsignedLong:v85];
                  v209[1] = @"Height";
                  v210[1] = [NSNumber numberWithUnsignedLong:v82];
                  v209[2] = @"Width";
                  v210[2] = [NSNumber numberWithUnsignedLong:v81];
                  v209[3] = @"PixelFormat";
                  v210[3] = [NSNumber numberWithUnsignedInt:v83];
                  v212[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v210 forKeys:v209 count:4];
                  CFDictionaryRef v89 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v212 forKeys:v211 count:3];
                  CFRelease(metadata);
                  if (v89) {
                    CGImageDestinationAddAuxiliaryDataInfo(v38, auxiliaryImageDataType, v89);
                  }
                  goto LABEL_42;
                }
              }
              CGRect v79 = objc_msgSend((id)objc_msgSend(v48, "properties"), "objectForKeyedSubscript:", @"kCGImageAuxiliaryDataInfoMetadata");
              if (v79)
              {
                CFRelease(metadata);
                id v80 = v79;
                metaint data = (CGImageMetadata *)v79;
              }
              goto LABEL_82;
            }
          }
          float v53 = ci_logger_api();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf[0]) = v156;
            *(void *)((char *)buf + 4) = v47;
            BOOL v54 = v53;
            double v55 = "Saving %{public}@ option requires an image with a finite non-empty extent.";
LABEL_68:
            _os_log_error_impl(&dword_193671000, v54, OS_LOG_TYPE_ERROR, v55, (uint8_t *)buf, 0xCu);
          }
        }
        else
        {
          double v56 = ci_logger_api();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf[0]) = v156;
            *(void *)((char *)buf + 4) = v47;
            BOOL v54 = v56;
            double v55 = "Saving %{public}@ option requires a CIImage object.";
            goto LABEL_68;
          }
        }
      }
LABEL_42:
      ++v46;
    }
    while ([v41 count] > v46);
  }
  CGFloat v92 = (void *)[v40 objectForKey:@"kCIImageRepresentationAVSemanticSegmentationMattes"];
  if (v92)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v208 = 0u;
      long long v207 = 0u;
      long long v206 = 0u;
      long long v205 = 0u;
      uint64_t v93 = [v92 countByEnumeratingWithState:&v205 objects:buf count:16];
      if (v93)
      {
        uint64_t v94 = *(void *)v206;
        do
        {
          for (uint64_t k = 0; k != v93; ++k)
          {
            if (*(void *)v206 != v94) {
              objc_enumerationMutation(v92);
            }
            double v96 = *(void **)(*((void *)&v205 + 1) + 8 * k);
            AVSemanticSegmentationMatteClass();
            if (objc_opt_isKindOfClass())
            {
              v201[0] = 0;
              CFDictionaryRef v97 = (const __CFDictionary *)AVSemanticSegmentationMatteDictionaryRepresentationForAuxiliaryType(v96, (const char *)v201);
              if (v97) {
                CGImageDestinationAddAuxiliaryDataInfo(v38, v201[0], v97);
              }
            }
          }
          uint64_t v93 = [v92 countByEnumeratingWithState:&v205 objects:buf count:16];
        }
        while (v93);
      }
    }
  }
  id v98 = (void *)[v40 objectForKey:@"kCIImageRepresentationAVPortraitEffectsMatte"];
  double v99 = (void *)[v40 objectForKey:@"kCIImageRepresentationPortraitEffectsMatteImage"];
  uint64_t isKindOfClass = [v99 extent];
  double v104 = v103;
  double v106 = v105;
  v197[0] = *(CFStringRef *)MEMORY[0x1E4F2F3D0];
  if (v99)
  {
    CGFloat v107 = v101;
    CGFloat v108 = v102;
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_109;
    }
    v217.origin.CGFloat x = v107;
    v217.origin.CGFloat y = v108;
    v217.size.double width = v104;
    v217.size.double height = v106;
    uint64_t isKindOfClass = CGRectIsInfinite(v217);
    if ((isKindOfClass & 1) != 0
      || (v218.origin.CGFloat x = v107,
          v218.origin.CGFloat y = v108,
          v218.size.double width = v104,
          v218.size.double height = v106,
          uint64_t isKindOfClass = CGRectIsEmpty(v218),
          isKindOfClass))
    {
LABEL_109:
      double v99 = 0;
    }
  }
  if (!v98 || (AVPortraitEffectsMatteClass(isKindOfClass), (v99 != 0) | ((objc_opt_isKindOfClass() & 1) == 0)))
  {
    if (!v99) {
      goto LABEL_120;
    }
    unint64_t v110 = vcvtmd_u64_f64(v104);
    unint64_t v111 = vcvtmd_u64_f64(v106);
    int v112 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:((v110 + 15) & 0xFFFFFFFFFFFFFFF0) * v111];
    -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v164, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v99, [v112 mutableBytes], (v110 + 15) & 0xFFFFFFFFFFFFFFF0, 259, 0, 0.0, 0.0, (double)v110, (double)v111);
    Mutable = CGImageMetadataCreateMutable();
    if (CGImageMetadataRegisterNamespaceForPrefix(Mutable, @"PortraitEffectsMatteVersion", @"portraitEffectsMatte", 0))
    {
      CGImageMetadataSetValueWithPath(Mutable, 0, @"portraitEffectsMatte:PortraitEffectsMatteVersion", &unk_1EE4AA670);
    }
    v203[0] = v112;
    v202[0] = @"kCGImageAuxiliaryDataInfoData";
    v202[1] = @"kCGImageAuxiliaryDataInfoDataDescription";
    v200[0] = @"BytesPerRow";
    v201[0] = (CFStringRef)[NSNumber numberWithUnsignedLong:(v110 + 15) & 0xFFFFFFFFFFFFFFF0];
    v200[1] = @"Height";
    v201[1] = (CFStringRef)[NSNumber numberWithUnsignedLong:v111];
    v200[2] = @"Width";
    v201[2] = (CFStringRef)[NSNumber numberWithUnsignedLong:v110];
    v200[3] = @"PixelFormat";
    v201[3] = (CFStringRef)[NSNumber numberWithUnsignedInt:1278226488];
    uint64_t v114 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v201 forKeys:v200 count:4];
    v202[2] = @"kCGImageAuxiliaryDataInfoMetadata";
    v203[1] = v114;
    v203[2] = Mutable;
    CFDictionaryRef v109 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v203 forKeys:v202 count:3];
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    CFDictionaryRef v109 = (const __CFDictionary *)AVPortraitEffectsMatteDictionaryRepresentation(v98, (const char *)v197);
  }
  if (v109) {
    CGImageDestinationAddAuxiliaryDataInfo(v38, v197[0], v109);
  }
LABEL_120:
  CGImageRef v115 = (void *)[v40 objectForKey:@"kCIImageRepresentationAVDepthData"];
  uint64_t v116 = (void *)[v40 objectForKey:@"kCIImageRepresentationDepthImage"];
  uint64_t v117 = [v40 objectForKey:@"kCIImageRepresentationDisparityImage"];
  uint64_t v118 = v117;
  if (v117) {
    uint64_t v116 = (void *)v117;
  }
  [v116 extent];
  double v120 = v119;
  double v122 = v121;
  double v124 = v123;
  double v126 = v125;
  float v127 = (void *)[v116 depthData];
  CFStringRef v192 = 0;
  if (!v116) {
    goto LABEL_126;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_126;
  }
  v219.origin.CGFloat x = v120;
  v219.origin.CGFloat y = v122;
  v219.size.double width = v124;
  v219.size.double height = v126;
  if (CGRectIsInfinite(v219)
    || (v220.origin.CGFloat x = v120,
        v220.origin.CGFloat y = v122,
        v220.size.double width = v124,
        v220.size.double height = v126,
        int v128 = v116,
        CGRectIsEmpty(v220)))
  {
LABEL_126:
    int v128 = 0;
  }
  if (!v115 || (AVDepthDataClass(), (v128 != 0) | ((objc_opt_isKindOfClass() & 1) == 0)))
  {
    size_t v130 = vcvtmd_u64_f64(v124);
    size_t v131 = vcvtmd_u64_f64(v126);
    if (v128 && v127)
    {
      uint64_t v132 = (CFStringRef *)MEMORY[0x1E4F2F3B8];
      if (!v118) {
        uint64_t v132 = (CFStringRef *)MEMORY[0x1E4F2F3B0];
      }
      CFStringRef v192 = *v132;
      v197[0] = 0;
      v199[0] = *MEMORY[0x1E4F24D20];
      v196[0] = MEMORY[0x1E4F1CC08];
      CFDictionaryRef v133 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v196 forKeys:v199 count:1];
      if (v118) {
        OSType v134 = 1751411059;
      }
      else {
        OSType v134 = 1717856627;
      }
      CVPixelBufferCreate(0, v130, v131, v134, v133, (CVPixelBufferRef *)v197);
      if (v197[0])
      {
        -[CIContext render:toCVPixelBuffer:bounds:colorSpace:](v164, "render:toCVPixelBuffer:bounds:colorSpace:", v128, v197[0], 0, v120, v122, v124, v126);
        uint64_t v135 = AVFDepthDataByReplacingDepthDataMapWithPixelBuffer(v127, (const char *)v197[0]);
        uint64_t v129 = AVFDepthDataDictionaryRepresentation(v135, (const char *)&v192);
        CFRelease(v197[0]);
      }
      else
      {
        uint64_t v129 = 0;
      }
    }
    else
    {
      if (!v128) {
        goto LABEL_153;
      }
      uint64_t v136 = (CFStringRef *)MEMORY[0x1E4F2F3B8];
      if (!v118) {
        uint64_t v136 = (CFStringRef *)MEMORY[0x1E4F2F3B0];
      }
      CFStringRef v192 = *v136;
      if (v118) {
        uint64_t v137 = 1751411059;
      }
      else {
        uint64_t v137 = 1717856627;
      }
      CGRect v138 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:2 * v130 * v131];
      -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v164, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v116, [v138 mutableBytes], 2 * v130, 2051, 0, 0.0, 0.0, (double)v130, (double)v131);
      if ([v116 properties])
      {
        BOOL v139 = (void *)[v116 properties];
        uint64_t v140 = [v139 objectForKeyedSubscript:*MEMORY[0x1E4F2F380]];
      }
      else
      {
        uint64_t v140 = 0;
      }
      v199[0] = v138;
      v198[0] = @"kCGImageAuxiliaryDataInfoData";
      v198[1] = @"kCGImageAuxiliaryDataInfoDataDescription";
      v196[0] = @"BytesPerRow";
      v197[0] = (CFStringRef)[NSNumber numberWithUnsignedLong:2 * v130];
      v196[1] = @"Height";
      v197[1] = (CFStringRef)[NSNumber numberWithUnsignedLong:v131];
      v196[2] = @"Width";
      v197[2] = (CFStringRef)[NSNumber numberWithUnsignedLong:v130];
      v196[3] = @"PixelFormat";
      v197[3] = (CFStringRef)[NSNumber numberWithUnsignedInt:v137];
      v199[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v197 forKeys:v196 count:4];
      uint64_t v129 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v199 forKeys:v198 count:2];
      if (v140)
      {
        uint64_t v129 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v129];
        [v129 setObject:v140 forKeyedSubscript:*MEMORY[0x1E4F2F380]];
      }
    }
  }
  else
  {
    uint64_t v129 = AVFDepthDataDictionaryRepresentation(v115, (const char *)&v192);
  }
  if (v129) {
    CGImageDestinationAddAuxiliaryDataInfo(v38, v192, (CFDictionaryRef)v129);
  }
LABEL_153:
  BOOL v141 = CGImageDestinationFinalize(v38);
  uint64_t v142 = v179[5];
  if (v142)
  {
    CGFloat v143 = v185[6];
    CGFloat v144 = v185[7];
    CGFloat v145 = v185[8];
    CGFloat v146 = v185[9];
    [a3 extent];
    v222.origin.CGFloat x = v147;
    v222.origin.CGFloat y = v148;
    v222.size.double width = v149;
    v222.size.double height = v150;
    v221.origin.CGFloat x = v143;
    v221.origin.CGFloat y = v144;
    v221.size.double width = v145;
    v221.size.double height = v146;
    LODWORD(v142) = !CGRectContainsRect(v221, v222);
  }
  if (!v141 || v142)
  {

    uint64_t v151 = v179[5];
    if (v151)
    {
      *(void *)&long long v205 = *MEMORY[0x1E4F28A50];
      *((void *)&v205 + 1) = @"CINonLocalizedDescriptionKey";
      *(void *)&buf[0] = v151;
      *((void *)&buf[0] + 1) = @"failed to create data representation.";
      uint64_t v152 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v205 count:2];
    }
    else
    {
      *(void *)&long long v205 = @"CINonLocalizedDescriptionKey";
      *(void *)&buf[0] = @"failed to create data representation.";
      uint64_t v152 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v205 count:1];
    }
    double v35 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CINonLocalizedDescriptionKey" code:3 userInfo:v152];
    id v153 = v35;
    goto LABEL_162;
  }
  double v35 = 0;
LABEL_163:
  _Block_object_dispose(&v178, 8);
  _Block_object_dispose(&v184, 8);
  if (a11 && v35) {
    *a11 = v35;
  }
  id v154 = v35;
  return dataa;
}

void __138__CIContext_ImageRepresentation___dataRepresentationOfImage_UTIType_format_premultiplied_colorSpace_options_addAuxData_keysToMerge_error___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  if (a2)
  {

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  }
  else
  {
    v8.size.double height = a6;
    v8.size.double width = a5;
    v8.origin.CGFloat y = a4;
    v8.origin.CGFloat x = a3;
    *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 48), v8);
  }
}

- (NSData)TIFFRepresentationOfImage:(CIImage *)image format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options
{
  return (NSData *)[(CIContext *)self _TIFFRepresentationOfImage:image format:*(void *)&format colorSpace:colorSpace options:options error:0];
}

- (id)_TIFFRepresentationOfImage:(id)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v12 = CI::format_modernize(*(uint64_t *)&a4, (CI *)"-[CIContext(ImageRepresentation) _TIFFRepresentationOfImage:format:colorSpace:options:error:]", (const char *)a3);
  if (!canCreateDataRepresentation((CIImage *)a3, a5, v12, (NSError **)a7)) {
    return 0;
  }
  LOBYTE(v14) = 0;
  return [(CIContext *)self _dataRepresentationOfImage:a3 UTIType:@"public.tiff" format:v12 premultiplied:1 colorSpace:a5 options:a6 addAuxData:v14 keysToMerge:0 error:a7];
}

- (NSData)PNGRepresentationOfImage:(CIImage *)image format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options
{
  return (NSData *)[(CIContext *)self _PNGRepresentationOfImage:image format:*(void *)&format colorSpace:colorSpace options:options error:0];
}

- (id)_PNGRepresentationOfImage:(id)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v12 = CI::format_modernize(*(uint64_t *)&a4, (CI *)"-[CIContext(ImageRepresentation) _PNGRepresentationOfImage:format:colorSpace:options:error:]", (const char *)a3);
  if (!canCreateDataRepresentation((CIImage *)a3, a5, v12, (NSError **)a7)) {
    return 0;
  }
  LOBYTE(v14) = 0;
  return [(CIContext *)self _dataRepresentationOfImage:a3 UTIType:@"public.png" format:v12 premultiplied:0 colorSpace:a5 options:a6 addAuxData:v14 keysToMerge:0 error:a7];
}

- (NSData)JPEGRepresentationOfImage:(CIImage *)image colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options
{
  return (NSData *)[(CIContext *)self _JPEGRepresentationOfImage:image colorSpace:colorSpace options:options error:0];
}

- (id)_JPEGRepresentationOfImage:(id)a3 colorSpace:(CGColorSpace *)a4 options:(id)a5 error:(id *)a6
{
  v19[6] = *MEMORY[0x1E4F143B8];
  if (!canCreateDataRepresentation((CIImage *)a3, a4, (NSError **)a6)) {
    return 0;
  }
  CGColorSpaceModel Model = CGColorSpaceGetModel(a4);
  uint64_t v12 = &kCIFormatL8;
  if (Model) {
    uint64_t v12 = &kCIFormatRGBX8;
  }
  uint64_t v13 = *v12;
  uint64_t v14 = *MEMORY[0x1E4F2F418];
  v19[0] = *MEMORY[0x1E4F2F430];
  v19[1] = v14;
  uint64_t v15 = *MEMORY[0x1E4F2FC00];
  void v19[2] = *MEMORY[0x1E4F2FC10];
  v19[3] = v15;
  uint64_t v16 = *MEMORY[0x1E4F2F470];
  v19[4] = *MEMORY[0x1E4F2FC08];
  v19[5] = v16;
  LOBYTE(v18) = 1;
  return -[CIContext _dataRepresentationOfImage:UTIType:format:premultiplied:colorSpace:options:addAuxData:keysToMerge:error:](self, "_dataRepresentationOfImage:UTIType:format:premultiplied:colorSpace:options:addAuxData:keysToMerge:error:", a3, @"public.jpeg", v13, 1, a4, a5, v18, [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:6], a6);
}

- (NSData)OpenEXRRepresentationOfImage:(CIImage *)image options:(NSDictionary *)options error:(NSError *)errorPtr
{
  if (!canCreateDataRepresentation(image, errorPtr)) {
    return 0;
  }
  CGColorSpaceRef v9 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE0]);
  CFAutorelease(v9);
  LOBYTE(v11) = 0;
  return (NSData *)[(CIContext *)self _dataRepresentationOfImage:image UTIType:@"com.ilm.openexr-image" format:2056 premultiplied:0 colorSpace:v9 options:options addAuxData:v11 keysToMerge:0 error:errorPtr];
}

- (NSData)HEIFRepresentationOfImage:(CIImage *)image format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options
{
  return (NSData *)[(CIContext *)self _HEIFRepresentationOfImage:image format:*(void *)&format colorSpace:colorSpace options:options error:0];
}

- (id)_HEIFRepresentationOfImage:(id)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5 options:(id)a6 error:(id *)a7
{
  v16[3] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = CI::format_modernize(*(uint64_t *)&a4, (CI *)"-[CIContext(ImageRepresentation) _HEIFRepresentationOfImage:format:colorSpace:options:error:]", (const char *)a3);
  if (!canCreateDataRepresentation((CIImage *)a3, a5, v12, (NSError **)a7)) {
    return 0;
  }
  uint64_t v13 = *MEMORY[0x1E4F2F418];
  v16[0] = *MEMORY[0x1E4F2F430];
  v16[1] = v13;
  v16[2] = *MEMORY[0x1E4F2F470];
  LOBYTE(v15) = 1;
  return -[CIContext _dataRepresentationOfImage:UTIType:format:premultiplied:colorSpace:options:addAuxData:keysToMerge:error:](self, "_dataRepresentationOfImage:UTIType:format:premultiplied:colorSpace:options:addAuxData:keysToMerge:error:", a3, @"public.heic", v12, 0, a5, a6, v15, [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3], a7);
}

- (NSData)HEIF10RepresentationOfImage:(CIImage *)image colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v145 = 0;
  uint64_t v11 = (void *)MEMORY[0x199702DB0](self, a2);
  [(CIImage *)image extent];
  CGRect v165 = CGRectInset(v164, 0.00100000005, 0.00100000005);
  CGRect v166 = CGRectIntegral(v165);
  CGFloat x = v166.origin.x;
  CGFloat y = v166.origin.y;
  CGFloat width = v166.size.width;
  CGFloat height = v166.size.height;
  if (CGRectIsEmpty(v166)
    || (v167.origin.x = x, v167.origin.CGFloat y = y, v167.size.width = width, v167.size.height = height, CGRectIsInfinite(v167)))
  {
    uint64_t v16 = ci_logger_api();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
    uint64_t v159 = @"CINonLocalizedDescriptionKey";
    *(void *)bytes = @"requires an image with a finite non-empty extent.";
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:bytes forKeys:&v159 count:1];
    uint64_t v25 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CINonLocalizedDescriptionKey" code:4 userInfo:v24];
LABEL_48:
    double v70 = v25;
    double v71 = v25;
    goto LABEL_49;
  }
  if (!colorSpace
    || (CFTypeID TypeID = CGColorSpaceGetTypeID(), TypeID != CFGetTypeID(colorSpace))
    || !CGColorSpaceSupportsOutput(colorSpace)
    || CGColorSpaceGetModel(colorSpace) && CGColorSpaceGetModel(colorSpace) != kCGColorSpaceModelRGB)
  {
    double v61 = ci_logger_api();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:](v61, v62, v63, v64, v65, v66, v67, v68);
    }
    uint64_t v159 = @"CINonLocalizedDescriptionKey";
    *(void *)bytes = @"unsupported colorspace.";
    uint64_t v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:bytes forKeys:&v159 count:1];
    uint64_t v25 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CINonLocalizedDescriptionKey" code:5 userInfo:v69];
    goto LABEL_48;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  CGColorSpaceModel Model = CGColorSpaceGetModel(colorSpace);
  BOOL v28 = [(CIImage *)image isOpaque];
  uint64_t v150 = *MEMORY[0x1E4F24D20];
  uint64_t v151 = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v29 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v151 forKeys:&v150 count:1];
  if (Model) {
    int v30 = 2019963440;
  }
  else {
    int v30 = 1278226736;
  }
  if (Model) {
    int v31 = 1815491698;
  }
  else {
    int v31 = 1279340854;
  }
  int v140 = v31;
  if (v28) {
    OSType v32 = v30;
  }
  else {
    OSType v32 = v31;
  }
  [(CIImage *)image extent];
  double v34 = v33;
  [(CIImage *)image extent];
  if (CVPixelBufferCreate(0, (unint64_t)v34, (unint64_t)v35, v32, v29, &pixelBufferOut)
    || !pixelBufferOut)
  {
    float v74 = ci_logger_api();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:](v74, v75, v76, v77, v78, v79, v80, v81);
    }
    uint64_t v159 = @"CINonLocalizedDescriptionKey";
    *(void *)bytes = @"failed to create a CVPixelBuffer.";
    uint64_t v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:bytes forKeys:&v159 count:1];
    double v70 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CINonLocalizedDescriptionKey" code:6 userInfo:v82];
    uint64_t v83 = v70;
  }
  else
  {
    BOOL v36 = Model == kCGColorSpaceModelMonochrome;
    CFAutorelease(pixelBufferOut);
    BOOL IsHLGBased = CGColorSpaceIsHLGBased(colorSpace);
    int v38 = IsHLGBased | CGColorSpaceIsPQBased(colorSpace);
    uint64_t v39 = (const void *)*MEMORY[0x1E4F24C40];
    if (v36) {
      uint64_t v39 = 0;
    }
    if (v38) {
      id v40 = (const void *)*MEMORY[0x1E4F24C30];
    }
    else {
      id v40 = v39;
    }
    if (v40) {
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24C18], v40, kCVAttachmentMode_ShouldPropagate);
    }
    ColorAttributesForuint64_t ColorSpace = CreateColorAttributesForColorSpace();
    if (ColorAttributesForColorSpace)
    {
      CVBufferSetAttachments(pixelBufferOut, ColorAttributesForColorSpace, kCVAttachmentMode_ShouldPropagate);
      CFRelease(ColorAttributesForColorSpace);
    }
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24A00], colorSpace, kCVAttachmentMode_ShouldPropagate);
    if (!v28) {
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F249D8], (CFTypeRef)*MEMORY[0x1E4F249E8], kCVAttachmentMode_ShouldPropagate);
    }
    [(CIImage *)image contentHeadroom];
    if (v42 > 1.0)
    {
      *(_WORD *)bytes = __rev16((int)fminf((float)(v42 * 203.0) + 0.5, 65535.0));
      *(_WORD *)&bytes[2] = 0;
      CFDataRef v43 = CFDataCreate(0, bytes, 4);
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24AD0], v43, kCVAttachmentMode_ShouldPropagate);
      CFRelease(v43);
    }
    CGFloat v143 = 0;
    uint64_t v44 = [CIRenderDestination alloc];
    long long v45 = [(CIRenderDestination *)v44 initWithPixelBuffer:pixelBufferOut];
    [(CIRenderDestination *)v45 setColorSpace:colorSpace];
    unint64_t v46 = [(CIContext *)self startTaskToRender:image toDestination:v45 error:&v143];
    if (!v46)
    {
      char v84 = ci_logger_api();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.4(v84, v85, v86, v87, v88, v89, v90, v91);
      }
      if (v143)
      {
        uint64_t v159 = (__CFString *)*MEMORY[0x1E4F28A50];
        v160 = (__CFString **)@"CINonLocalizedDescriptionKey";
        *(void *)bytes = v143;
        uint64_t v155 = @"failed to render image.";
        uint64_t v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:bytes forKeys:&v159 count:2];
      }
      else
      {
        uint64_t v152 = @"CINonLocalizedDescriptionKey";
        CFTypeRef arg = @"failed to render image.";
        uint64_t v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&arg forKeys:&v152 count:1];
      }
      uint64_t v60 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CINonLocalizedDescriptionKey" code:7 userInfo:v92];
      goto LABEL_66;
    }
    if (![(CIRenderTask *)v46 waitUntilCompletedAndReturnError:&v143])
    {
      uint64_t v93 = ci_logger_api();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
        -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.4(v93, v94, v95, v96, v97, v98, v99, v100);
      }
      uint64_t v60 = (NSError *)imageRepError(7, &cfstr_FailedToRender.isa, v143);
      goto LABEL_66;
    }
    CFTypeRef arg = 0;
    uint64_t v159 = 0;
    v160 = &v159;
    uint64_t v161 = 0x2020000000;
    uint64_t v47 = (__CFString *)getCMPhotoCompressionSessionCreateSymbolLoc(void)::ptr;
    int v162 = getCMPhotoCompressionSessionCreateSymbolLoc(void)::ptr;
    if (!getCMPhotoCompressionSessionCreateSymbolLoc(void)::ptr)
    {
      *(void *)bytes = MEMORY[0x1E4F143A8];
      uint64_t v155 = 3221225472;
      uint64_t v156 = (uint64_t)___ZL43getCMPhotoCompressionSessionCreateSymbolLocv_block_invoke;
      uint64_t v157 = &unk_1E57710B8;
      uint64_t v158 = &v159;
      CGRect v48 = (void *)CMPhotoLibrary();
      unint64_t v49 = dlsym(v48, "CMPhotoCompressionSessionCreate");
      v158[1]->length = (uint64_t)v49;
      getCMPhotoCompressionSessionCreateSymbolLoc(void)::ptr = (_UNKNOWN *)v158[1]->length;
      uint64_t v47 = v160[3];
    }
    _Block_object_dispose(&v159, 8);
    if (!v47) {
      -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.6();
    }
    ((void (*)(void, void, CFTypeRef *))v47)(0, 0, &arg);
    CFAutorelease(arg);
    if (!arg)
    {
      double v101 = ci_logger_api();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
        -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.7(v101, v102, v103, v104, v105, v106, v107, v108);
      }
      uint64_t v60 = (NSError *)imageRepError(8, &cfstr_FailedToCreate_1.isa);
      goto LABEL_66;
    }
    uint64_t v50 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v50, "addEntriesFromDictionary:", -[CIImage properties](image, "properties"));
    v148[0] = getkCMPhotoCompressionContainerOption_Format();
    v149[0] = &unk_1EE4AA628;
    v148[1] = getkCMPhotoCompressionContainerOption_ImageCountHint();
    v149[1] = &unk_1EE4AA640;
    v148[2] = getkCMPhotoCompressionContainerOption_BackingType();
    v149[2] = &unk_1EE4AA640;
    uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v149 forKeys:v148 count:3];
    if (soft_CMPhotoCompressionSessionOpenEmptyContainer((uint64_t)arg, v51))
    {
      float v52 = ci_logger_api();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:]1(v52, v53, v54, v55, v56, v57, v58, v59);
      }
      uint64_t v60 = (NSError *)imageRepError(9, &cfstr_FailedToOpenTh.isa);
LABEL_66:
      double v70 = v60;
      CFDictionaryRef v109 = v60;
      goto LABEL_49;
    }
    uint64_t v110 = [v50 valueForKey:*MEMORY[0x1E4F2FCA0]];
    if (v110) {
      unint64_t v111 = (void *)v110;
    }
    else {
      unint64_t v111 = &unk_1EE4AA640;
    }
    id v112 = [(NSDictionary *)options valueForKey:*MEMORY[0x1E4F2F430]];
    uint64_t v113 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [v113 setObject:v111 forKey:getkCMPhotoCompressionOption_ImageOrientation()];
    if (v112)
    {
      [v113 setObject:&unk_1EE4AA658 forKey:getkCMPhotoCompressionOption_QualityControllerType()];
      uint64_t v146 = getkCMPhotoQualityControllerParameter_QualityValue();
      id v147 = v112;
      objc_msgSend(v113, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1), getkCMPhotoCompressionOption_QualityControllerParameters());
    }
    uint64_t v159 = 0;
    if (soft_CMPhotoCompressionSessionAddImage((uint64_t)arg, (uint64_t)v113, (uint64_t)pixelBufferOut, (uint64_t)&v159))
    {
      uint64_t v114 = ci_logger_api();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)) {
        -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:]0(v114, v115, v116, v117, v118, v119, v120, v121);
      }
      double v122 = (NSError *)imageRepError(10, &cfstr_FailedToAddIma.isa);
LABEL_86:
      double v70 = v122;
      size_t v131 = v122;
      goto LABEL_49;
    }
    if (!v28)
    {
      *(void *)bytes = 0;
      uint64_t v155 = (uint64_t)bytes;
      uint64_t v156 = 0x2020000000;
      LOBYTE(v157) = 1;
      v141[0] = MEMORY[0x1E4F143A8];
      v141[1] = 3221225472;
      v141[2] = __87__CIContext_ImageRepresentation__HEIF10RepresentationOfImage_colorSpace_options_error___block_invoke;
      v141[3] = &unk_1E57714E0;
      int v142 = v140;
      v141[4] = bytes;
      PixelBufferApplyPlaneReadOnlyBlock(pixelBufferOut, (uint64_t)v141);
      if (!*(unsigned char *)(v155 + 24))
      {
        if (soft_CMPhotoCompressionSessionAddAuxiliaryImage((uint64_t)arg, (uint64_t)v159, (uint64_t)pixelBufferOut))
        {
          uint64_t v132 = ci_logger_api();
          if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR)) {
            -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.9(v132, v133, v134, v135, v136, v137, v138, v139);
          }
        }
      }
      _Block_object_dispose(bytes, 8);
    }
    if (v50) {
      soft_CMPhotoCompressionSessionAddMetadataFromImageProperties((uint64_t)arg, (uint64_t)v159, (uint64_t)v50);
    }
    if (soft_CMPhotoCompressionSessionCloseContainerAndCopyBacking((uint64_t)arg, (uint64_t)&v145))
    {
      double v123 = ci_logger_api();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR)) {
        -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.8(v123, v124, v125, v126, v127, v128, v129, v130);
      }
      double v122 = (NSError *)imageRepError(11, &cfstr_FailedToCloseT.isa);
      goto LABEL_86;
    }
    double v70 = 0;
  }
LABEL_49:
  CGImageMetadataTagRef v72 = v70;
  if (errorPtr) {
    *errorPtr = v70;
  }
  return (NSData *)v145;
}

uint64_t __87__CIContext_ImageRepresentation__HEIF10RepresentationOfImage_colorSpace_options_error___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a5)
  {
    uint64_t v6 = 0;
    if (*(_DWORD *)(result + 40) == 1815491698) {
      unsigned int v7 = 4;
    }
    else {
      unsigned int v7 = 2;
    }
    unint64_t v8 = (4 * (((unint64_t)(v7 - 2) >> 1) & 0x7FFFFFFF)) | 2;
    uint64_t v9 = 2 * v7;
    while (2)
    {
      unint64_t v10 = v8;
      uint64_t v11 = a5;
      do
      {
        if (*(__int16 *)(a2 + v10) != -1)
        {
          *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
          return result;
        }
        v10 += v9;
        --v11;
      }
      while (v11);
      ++v6;
      a2 += a6;
      if (v6 != a5) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (BOOL)writeTIFFRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = CI::format_modernize(*(uint64_t *)&format, (CI *)"-[CIContext(ImageRepresentation) writeTIFFRepresentationOfImage:toURL:format:colorSpace:options:error:]", (const char *)image);
  if (!canCreateDataRepresentation(image, colorSpace, v14, errorPtr)) {
    return 0;
  }
  uint64_t v21 = 0;
  id v15 = [(CIContext *)self _TIFFRepresentationOfImage:image format:v14 colorSpace:colorSpace options:options error:&v21];
  if (v15)
  {
    char v16 = [v15 writeToURL:url options:1 error:&v21];
    if (!errorPtr) {
      return v16;
    }
  }
  else
  {
    char v16 = 0;
    if (!errorPtr) {
      return v16;
    }
  }
  if ((v16 & 1) == 0)
  {
    if (v21)
    {
      v22[0] = *MEMORY[0x1E4F28A50];
      v22[1] = @"CINonLocalizedDescriptionKey";
      v23[0] = v21;
      v23[1] = @"failed to write TIFF data to file.";
      uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v18 = 2;
    }
    else
    {
      v22[0] = @"CINonLocalizedDescriptionKey";
      v23[0] = @"failed to write TIFF data to file.";
      uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v18 = 1;
    }
    uint64_t v19 = [v17 dictionaryWithObjects:v23 forKeys:v22 count:v18];
    *errorPtr = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CINonLocalizedDescriptionKey" code:3 userInfo:v19];
  }
  return v16;
}

- (BOOL)writePNGRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = CI::format_modernize(*(uint64_t *)&format, (CI *)"-[CIContext(ImageRepresentation) writePNGRepresentationOfImage:toURL:format:colorSpace:options:error:]", (const char *)image);
  if (!canCreateDataRepresentation(image, colorSpace, v14, errorPtr)) {
    return 0;
  }
  uint64_t v21 = 0;
  id v15 = [(CIContext *)self _PNGRepresentationOfImage:image format:v14 colorSpace:colorSpace options:options error:&v21];
  if (v15)
  {
    char v16 = [v15 writeToURL:url options:1 error:&v21];
    if (!errorPtr) {
      return v16;
    }
  }
  else
  {
    char v16 = 0;
    if (!errorPtr) {
      return v16;
    }
  }
  if ((v16 & 1) == 0)
  {
    if (v21)
    {
      v22[0] = *MEMORY[0x1E4F28A50];
      v22[1] = @"CINonLocalizedDescriptionKey";
      v23[0] = v21;
      v23[1] = @"failed to write PNG data to file.";
      uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v18 = 2;
    }
    else
    {
      v22[0] = @"CINonLocalizedDescriptionKey";
      v23[0] = @"failed to write PNG data to file.";
      uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v18 = 1;
    }
    uint64_t v19 = [v17 dictionaryWithObjects:v23 forKeys:v22 count:v18];
    *errorPtr = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CINonLocalizedDescriptionKey" code:3 userInfo:v19];
  }
  return v16;
}

- (BOOL)writeJPEGRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  if (!canCreateDataRepresentation(image, colorSpace, errorPtr)) {
    return 0;
  }
  uint64_t v19 = 0;
  id v13 = [(CIContext *)self _JPEGRepresentationOfImage:image colorSpace:colorSpace options:options error:&v19];
  if (v13)
  {
    char v14 = [v13 writeToURL:url options:1 error:&v19];
    if (!errorPtr) {
      return v14;
    }
  }
  else
  {
    char v14 = 0;
    if (!errorPtr) {
      return v14;
    }
  }
  if ((v14 & 1) == 0)
  {
    if (v19)
    {
      v20[0] = *MEMORY[0x1E4F28A50];
      v20[1] = @"CINonLocalizedDescriptionKey";
      v21[0] = v19;
      v21[1] = @"failed to write JPEG data to file.";
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = 2;
    }
    else
    {
      v20[0] = @"CINonLocalizedDescriptionKey";
      v21[0] = @"failed to write JPEG data to file.";
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = 1;
    }
    uint64_t v17 = [v15 dictionaryWithObjects:v21 forKeys:v20 count:v16];
    *errorPtr = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CINonLocalizedDescriptionKey" code:3 userInfo:v17];
  }
  return v14;
}

- (BOOL)writeHEIFRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = CI::format_modernize(*(uint64_t *)&format, (CI *)"-[CIContext(ImageRepresentation) writeHEIFRepresentationOfImage:toURL:format:colorSpace:options:error:]", (const char *)image);
  if (!canCreateDataRepresentation(image, colorSpace, v14, errorPtr)) {
    return 0;
  }
  uint64_t v21 = 0;
  id v15 = [(CIContext *)self _HEIFRepresentationOfImage:image format:v14 colorSpace:colorSpace options:options error:&v21];
  if (v15)
  {
    char v16 = [v15 writeToURL:url options:1 error:&v21];
    if (!errorPtr) {
      return v16;
    }
  }
  else
  {
    char v16 = 0;
    if (!errorPtr) {
      return v16;
    }
  }
  if ((v16 & 1) == 0)
  {
    if (v21)
    {
      v22[0] = *MEMORY[0x1E4F28A50];
      v22[1] = @"CINonLocalizedDescriptionKey";
      v23[0] = v21;
      v23[1] = @"failed to write HEIC data to file.";
      uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v18 = 2;
    }
    else
    {
      v22[0] = @"CINonLocalizedDescriptionKey";
      v23[0] = @"failed to write HEIC data to file.";
      uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v18 = 1;
    }
    uint64_t v19 = [v17 dictionaryWithObjects:v23 forKeys:v22 count:v18];
    *errorPtr = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CINonLocalizedDescriptionKey" code:3 userInfo:v19];
  }
  return v16;
}

- (BOOL)writeHEIF10RepresentationOfImage:(CIImage *)image toURL:(NSURL *)url colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  if (!canCreateDataRepresentation(image, colorSpace, errorPtr)) {
    return 0;
  }
  uint64_t v19 = 0;
  id v13 = [(CIContext *)self HEIF10RepresentationOfImage:image colorSpace:colorSpace options:options error:&v19];
  if (v13)
  {
    BOOL v14 = [(NSData *)v13 writeToURL:url options:1 error:&v19];
    if (!errorPtr) {
      return v14;
    }
  }
  else
  {
    BOOL v14 = 0;
    if (!errorPtr) {
      return v14;
    }
  }
  if (!v14)
  {
    if (v19)
    {
      v20[0] = *MEMORY[0x1E4F28A50];
      v20[1] = @"CINonLocalizedDescriptionKey";
      v21[0] = v19;
      v21[1] = @"failed to write HEIC data to file.";
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = 2;
    }
    else
    {
      v20[0] = @"CINonLocalizedDescriptionKey";
      v21[0] = @"failed to write HEIC data to file.";
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = 1;
    }
    uint64_t v17 = [v15 dictionaryWithObjects:v21 forKeys:v20 count:v16];
    *errorPtr = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CINonLocalizedDescriptionKey" code:3 userInfo:v17];
  }
  return v14;
}

- (BOOL)writeOpenEXRRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)errorPtr
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  if (!canCreateDataRepresentation(image, errorPtr)) {
    return 0;
  }
  uint64_t v17 = 0;
  uint64_t v11 = [(CIContext *)self OpenEXRRepresentationOfImage:image options:options error:&v17];
  if (v11)
  {
    BOOL v12 = [(NSData *)v11 writeToURL:url options:1 error:&v17];
    if (!errorPtr) {
      return v12;
    }
  }
  else
  {
    BOOL v12 = 0;
    if (!errorPtr) {
      return v12;
    }
  }
  if (!v12)
  {
    if (v17)
    {
      v18[0] = *MEMORY[0x1E4F28A50];
      v18[1] = @"CINonLocalizedDescriptionKey";
      v19[0] = v17;
      v19[1] = @"failed to write OpenEXR data to file.";
      id v13 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v14 = 2;
    }
    else
    {
      v18[0] = @"CINonLocalizedDescriptionKey";
      v19[0] = @"failed to write OpenEXR data to file.";
      id v13 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v14 = 1;
    }
    uint64_t v15 = [v13 dictionaryWithObjects:v19 forKeys:v18 count:v14];
    *errorPtr = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CINonLocalizedDescriptionKey" code:3 userInfo:v15];
  }
  return v12;
}

- (CIFilter)depthBlurEffectFilterForImageData:(NSData *)data options:(NSDictionary *)options
{
  v44[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[CIImage imageWithData:](CIImage, "imageWithData:");
  CFDataRef v43 = @"kCIImageAuxiliaryDisparity";
  v44[0] = &unk_1EE4AA688;
  unsigned int v7 = +[CIImage imageWithData:options:](CIImage, "imageWithData:options:", data, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1]);
  uint64_t v41 = @"kCIImageAuxiliaryPortraitEffectsMatte";
  float v42 = &unk_1EE4AA688;
  unint64_t v8 = +[CIImage imageWithData:options:](CIImage, "imageWithData:options:", data, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1]);
  uint64_t v39 = @"kCIImageAuxiliarySemanticSegmentationHairMatte";
  id v40 = &unk_1EE4AA688;
  uint64_t v9 = +[CIImage imageWithData:options:](CIImage, "imageWithData:options:", data, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1]);
  CGImageDestinationRef v37 = @"kCIImageAuxiliarySemanticSegmentationGlassesMatte";
  int v38 = &unk_1EE4AA688;
  unint64_t v10 = +[CIImage imageWithData:options:](CIImage, "imageWithData:options:", data, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1]);
  double v35 = @"kCIImageAuxiliaryHDRGainMap";
  BOOL v36 = &unk_1EE4AA688;
  uint64_t v11 = +[CIImage imageWithData:options:](CIImage, "imageWithData:options:", data, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1]);
  if (!v6)
  {
    uint64_t v16 = ci_logger_api();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CIContext(CIDepthBlurEffect) depthBlurEffectFilterForImageData:options:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
    return 0;
  }
  if (!v7)
  {
    uint64_t v24 = ci_logger_api();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[CIContext(CIDepthBlurEffect) depthBlurEffectFilterForImageData:options:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
    return 0;
  }
  BOOL v12 = v11;
  id v13 = [(CIImage *)v6 properties];
  if (v13)
  {
    int v14 = objc_msgSend(-[NSDictionary objectForKey:](v13, "objectForKey:", @"Orientation"), "intValue");
    if (v14 <= 1) {
      unsigned int v15 = 1;
    }
    else {
      unsigned int v15 = v14;
    }
    if (v15 >= 8) {
      unsigned int v15 = 8;
    }
  }
  else
  {
    unsigned int v15 = 1;
  }
  LODWORD(v33) = v15;
  return [(CIContext *)self depthBlurEffectFilterForImage:v6 disparityImage:v7 portraitEffectsMatte:v8 hairSemanticSegmentation:v9 glassesMatte:v10 gainMap:v12 orientation:v33 options:options];
}

- (CIFilter)depthBlurEffectFilterForImageURL:(NSURL *)url options:(NSDictionary *)options
{
  v44[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[CIImage imageWithContentsOfURL:](CIImage, "imageWithContentsOfURL:");
  CFDataRef v43 = @"kCIImageAuxiliaryDisparity";
  v44[0] = &unk_1EE4AA688;
  unsigned int v7 = +[CIImage imageWithContentsOfURL:options:](CIImage, "imageWithContentsOfURL:options:", url, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1]);
  uint64_t v41 = @"kCIImageAuxiliaryPortraitEffectsMatte";
  float v42 = &unk_1EE4AA688;
  unint64_t v8 = +[CIImage imageWithContentsOfURL:options:](CIImage, "imageWithContentsOfURL:options:", url, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1]);
  uint64_t v39 = @"kCIImageAuxiliarySemanticSegmentationHairMatte";
  id v40 = &unk_1EE4AA688;
  uint64_t v9 = +[CIImage imageWithContentsOfURL:options:](CIImage, "imageWithContentsOfURL:options:", url, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1]);
  CGImageDestinationRef v37 = @"kCIImageAuxiliarySemanticSegmentationGlassesMatte";
  int v38 = &unk_1EE4AA688;
  unint64_t v10 = +[CIImage imageWithContentsOfURL:options:](CIImage, "imageWithContentsOfURL:options:", url, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1]);
  double v35 = @"kCIImageAuxiliaryHDRGainMap";
  BOOL v36 = &unk_1EE4AA688;
  uint64_t v11 = +[CIImage imageWithContentsOfURL:options:](CIImage, "imageWithContentsOfURL:options:", url, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1]);
  if (!v6)
  {
    uint64_t v16 = ci_logger_api();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CIContext(CIDepthBlurEffect) depthBlurEffectFilterForImageURL:options:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
    return 0;
  }
  if (!v7)
  {
    uint64_t v24 = ci_logger_api();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[CIContext(CIDepthBlurEffect) depthBlurEffectFilterForImageURL:options:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
    return 0;
  }
  BOOL v12 = v11;
  id v13 = [(CIImage *)v6 properties];
  if (v13)
  {
    int v14 = objc_msgSend(-[NSDictionary objectForKey:](v13, "objectForKey:", @"Orientation"), "intValue");
    if (v14 <= 1) {
      unsigned int v15 = 1;
    }
    else {
      unsigned int v15 = v14;
    }
    if (v15 >= 8) {
      unsigned int v15 = 8;
    }
  }
  else
  {
    unsigned int v15 = 1;
  }
  LODWORD(v33) = v15;
  return [(CIContext *)self depthBlurEffectFilterForImage:v6 disparityImage:v7 portraitEffectsMatte:v8 hairSemanticSegmentation:v9 glassesMatte:v10 gainMap:v12 orientation:v33 options:options];
}

- (void)_performFaceDetection:(id)a3 image:(id)a4 orientation:(int)a5 filter:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  v85[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = +[CIDetector detectorOfType:@"CIDetectorTypeFace" context:self options:MEMORY[0x1E4F1CC08]];
  CGAffineTransformMakeScale(&v77, 0.25, 0.25);
  unint64_t v10 = (void *)[a4 imageByApplyingTransform:&v77 highQualityDownsample:0];
  [v10 extent];
  if (v11 < 1024.0 || ([v10 extent], v12 < 1024.0))
  {
    [a4 extent];
    float v14 = v13 * 0.0009765625;
    [a4 extent];
    float v16 = v15 * 0.0009765625;
    double v17 = 1.0 / v16;
    if (1.0 / v14 < v17) {
      double v17 = 1.0 / v14;
    }
    float v18 = v17;
    CGAffineTransformMakeScale(&v76, v18, v18);
    unint64_t v10 = (void *)[a4 imageByApplyingTransform:&v76 highQualityDownsample:0];
  }
  char v84 = @"CIDetectorImageOrientation";
  v85[0] = [NSNumber numberWithInt:v7];
  uint64_t v19 = -[CIDetector featuresInImage:options:](v9, "featuresInImage:options:", v10, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:&v84 count:1]);
  if (v19)
  {
    uint64_t v20 = v19;
    if ([(NSArray *)v19 count] <= 4)
    {
      uint64_t v21 = [(NSArray *)v20 count];
      if (!v21) {
        return;
      }
    }
    else
    {
      uint64_t v21 = 4;
    }
    uint64_t v22 = (double *)malloc_type_calloc(8 * v21, 8uLL, 0x100004000313F17uLL);
    if (v22)
    {
      uint64_t v23 = v22;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      uint64_t v24 = [(NSArray *)v20 countByEnumeratingWithState:&v72 objects:v83 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        double v70 = v10;
        unsigned int v65 = v7;
        unint64_t v26 = 0;
        uint64_t v67 = &v23[2 * v21];
        uint64_t v68 = &v23[4 * v21];
        uint64_t v69 = &v23[6 * v21];
        uint64_t v27 = *(void *)v73;
        double v71 = v23;
LABEL_13:
        uint64_t v28 = 0;
        while (1)
        {
          if (*(void *)v73 != v27) {
            objc_enumerationMutation(v20);
          }
          if (v26 > 3) {
            break;
          }
          uint64_t v29 = *(void **)(*((void *)&v72 + 1) + 8 * v28);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v29 hasLeftEyePosition])
            {
              if ([v29 hasRightEyePosition])
              {
                uint64_t v30 = (void *)[v29 landmarks];
                if (v30)
                {
                  uint64_t v31 = v30;
                  if ([v30 objectForKeyedSubscript:@"nose"])
                  {
                    OSType v32 = (void *)[v31 objectForKeyedSubscript:@"faceContour"];
                    float v33 = 0.0;
                    if ([v29 hasFaceAngle])
                    {
                      [v29 faceAngle];
                      float v33 = v34;
                    }
                    if (v32 && [v32 count])
                    {
                      objc_msgSend((id)objc_msgSend(v32, "objectAtIndexedSubscript:", 0), "CGPointValue");
                      double v36 = v35;
                      memset(&v82, 0, sizeof(v82));
                      if (v70) {
                        [v70 imageTransformForOrientation:v65];
                      }
                      id v64 = a6;
                      memset(&v81, 0, sizeof(v81));
                      CGAffineTransformMakeRotation(&v81, v33 * 3.14159265 / 180.0);
                      CGAffineTransform t1 = v82;
                      memset(&v80, 0, sizeof(v80));
                      CGAffineTransform t2 = v81;
                      CGAffineTransformConcat(&v80, &t1, &t2);
                      unint64_t v37 = 0;
                      if ([v32 count])
                      {
                        unint64_t v38 = 0;
                        do
                        {
                          objc_msgSend((id)objc_msgSend(v32, "objectAtIndexedSubscript:", v38), "CGPointValue");
                          double v41 = v80.ty + v39 * v80.d + v80.b * v40;
                          if (v41 < v36 || v38 == 0)
                          {
                            unint64_t v37 = v38;
                            double v36 = v41;
                          }
                          ++v38;
                        }
                        while (v38 < [v32 count]);
                      }
                      objc_msgSend((id)objc_msgSend(v32, "objectAtIndexedSubscript:", v37), "CGPointValue");
                      double v44 = v43;
                      double v46 = v45;
                      double v47 = *MEMORY[0x1E4F1DAD8];
                      double v48 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
                      a6 = v64;
                    }
                    else
                    {
                      double v47 = *MEMORY[0x1E4F1DAD8];
                      double v48 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
                      double v44 = *MEMORY[0x1E4F1DAD8];
                      double v46 = v48;
                    }
                    BOOL v49 = v44 == v47 && v46 == v48;
                    uint64_t v23 = v71;
                    if (!v49)
                    {
                      double v50 = CIVNAverage((void *)[v31 objectForKeyedSubscript:@"nose"]);
                      uint64_t v52 = v51;
                      [v29 leftEyePosition];
                      v71[2 * v26] = v53;
                      [v29 leftEyePosition];
                      uint64_t v54 = (16 * v26) | 8;
                      *(void *)((char *)v71 + v54) = v55;
                      [v29 rightEyePosition];
                      v67[2 * v26] = v56;
                      [v29 rightEyePosition];
                      *(void *)((char *)v67 + v54) = v57;
                      uint64_t v23 = v71;
                      v69[2 * v26] = v44;
                      *(double *)((char *)v69 + v54) = v46;
                      v68[2 * v26++] = v50;
                      *(void *)((char *)v68 + v54) = v52;
                    }
                  }
                }
              }
            }
          }
          if (++v28 == v25)
          {
            uint64_t v25 = [(NSArray *)v20 countByEnumeratingWithState:&v72 objects:v83 count:16];
            if (v25) {
              goto LABEL_13;
            }
            break;
          }
        }
        if (v26 >= 5) {
          -[CIContext(CIDepthBlurEffect) _performFaceDetection:image:orientation:filter:]();
        }
        if (v26)
        {
          [v70 extent];
          uint64_t v66 = v58;
          [v70 extent];
          uint64_t v59 = 4 * v26;
          float64x2_t v60 = (float64x2_t)vdupq_lane_s64(v66, 0);
          float64x2_t v62 = (float64x2_t)vdupq_lane_s64(v61, 0);
          uint64_t v63 = v23;
          do
          {
            float64x2x2_t v86 = vld2q_f64(v63);
            v87.val[0] = vdivq_f64(v86.val[0], v60);
            v87.val[1] = vdivq_f64(v86.val[1], v62);
            vst2q_f64(v63, v87);
            v63 += 4;
            v59 -= 2;
          }
          while (v59);
          objc_msgSend(a6, "setValue:forKey:", +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v23, 2 * v26), @"inputLeftEyePositions");
          objc_msgSend(a6, "setValue:forKey:", +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v67, 2 * v26), @"inputRightEyePositions");
          objc_msgSend(a6, "setValue:forKey:", +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v68, 2 * v26), @"inputNosePositions");
          objc_msgSend(a6, "setValue:forKey:", +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v69, 2 * v26), @"inputChinPositions");
        }
      }
      free(v23);
    }
  }
}

- (CIFilter)depthBlurEffectFilterForImage:(CIImage *)image disparityImage:(CIImage *)disparityImage portraitEffectsMatte:(CIImage *)portraitEffectsMatte orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  LODWORD(v8) = orientation;
  return [(CIContext *)self depthBlurEffectFilterForImage:image disparityImage:disparityImage portraitEffectsMatte:portraitEffectsMatte hairSemanticSegmentation:0 glassesMatte:0 gainMap:0 orientation:v8 options:options];
}

- (CIFilter)depthBlurEffectFilterForImage:(CIImage *)image disparityImage:(CIImage *)disparityImage portraitEffectsMatte:(CIImage *)portraitEffectsMatte hairSemanticSegmentation:(CIImage *)hairSemanticSegmentation orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  LODWORD(v9) = orientation;
  return [(CIContext *)self depthBlurEffectFilterForImage:image disparityImage:disparityImage portraitEffectsMatte:portraitEffectsMatte hairSemanticSegmentation:hairSemanticSegmentation glassesMatte:0 gainMap:0 orientation:v9 options:options];
}

- (CIFilter)depthBlurEffectFilterForImage:(CIImage *)image disparityImage:(CIImage *)disparityImage portraitEffectsMatte:(CIImage *)portraitEffectsMatte hairSemanticSegmentation:(CIImage *)hairSemanticSegmentation glassesMatte:(CIImage *)glassesMatte gainMap:(CIImage *)gainMap orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (!image || !disparityImage)
  {
    uint64_t v29 = ci_logger_api();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[CIContext(CIDepthBlurEffect) depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:](v29, v30, v31, v32, v33, v34, v35, v36);
    }
    return 0;
  }
  [(CIImage *)image extent];
  CGFloat x = v82.origin.x;
  CGFloat y = v82.origin.y;
  CGFloat width = v82.size.width;
  CGFloat height = v82.size.height;
  if (CGRectIsEmpty(v82)
    || (v83.origin.x = x, v83.origin.CGFloat y = y, v83.size.width = width, v83.size.height = height, CGRectIsInfinite(v83)))
  {
    uint64_t v21 = ci_logger_api();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CIContext(CIDepthBlurEffect) depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:](v21, v22, v23, v24, v25, v26, v27, v28);
    }
    return 0;
  }
  uint64_t v39 = orientation;
  if (orientation - 9 <= 0xFFFFFFF7)
  {
    double v40 = ci_logger_api();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[CIContext(CIDepthBlurEffect) depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:](v40, v41, v42, v43, v44, v45, v46, v47);
    }
    return 0;
  }
  unint64_t v37 = +[CIFilter filterWithName:@"CIDepthBlurEffect"];
  [(CIFilter *)v37 setDefaults];
  [(CIFilter *)v37 setValue:image forKey:@"inputImage"];
  [(CIFilter *)v37 setValue:disparityImage forKey:@"inputDisparityImage"];
  if (portraitEffectsMatte) {
    [(CIFilter *)v37 setValue:portraitEffectsMatte forKey:@"inputMatteImage"];
  }
  if (hairSemanticSegmentation) {
    [(CIFilter *)v37 setValue:hairSemanticSegmentation forKey:@"inputHairImage"];
  }
  if (glassesMatte) {
    [(CIFilter *)v37 setValue:glassesMatte forKey:@"inputGlassesImage"];
  }
  if (gainMap) {
    [(CIFilter *)v37 setValue:gainMap forKey:@"inputGainMap"];
  }
  double v48 = [(CIImage *)disparityImage properties];
  if (v48)
  {
    uint64_t v49 = [(NSDictionary *)v48 objectForKeyedSubscript:*MEMORY[0x1E4F2F380]];
    if (v49)
    {
      double v50 = (const CGImageMetadata *)v49;
      [(CIFilter *)v37 setValue:v49 forKey:@"inputAuxDataMetadata"];
      uint64_t v51 = CGImageMetadataCopyTagWithPath(v50, 0, @"depthBlurEffect:SimulatedAperture");
      if (v51)
      {
        uint64_t v52 = v51;
        CFTypeRef v53 = CGImageMetadataTagCopyValue(v51);
        [(id)(id)CFMakeCollectable(v53) floatValue];
        -[CIFilter setValue:forKey:](v37, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithFloat:"), @"inputAperture");
        CFRelease(v52);
      }
    }
  }
  uint64_t v54 = [(CIImage *)disparityImage depthData];
  double v56 = AVFDepthCameraCalibrationData(v54, v55);
  if (v56) {
    [(CIFilter *)v37 setValue:v56 forKey:@"inputCalibrationData"];
  }
  uint64_t v57 = options;
  if ([(CIImage *)image properties])
  {
    uint64_t v58 = [(CIImage *)image properties];
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v58, (const void *)*MEMORY[0x1E4F2FC20]);
    if (Value)
    {
      float64x2_t v60 = CFDictionaryGetValue(Value, @"29");
      if (v60) {
        [(CIFilter *)v37 setValue:v60 forKey:@"inputLumaNoiseScale"];
      }
    }
  }
  uint64_t v61 = [(CIImage *)image properties];
  if (v61)
  {
    id v62 = [(NSDictionary *)v61 objectForKey:*MEMORY[0x1E4F2F6D8]];
    if (v62)
    {
      uint64_t v63 = (void *)[v62 objectForKey:@"Regions"];
      if (v63)
      {
        id v64 = (void *)[v63 objectForKey:*MEMORY[0x1E4F2F778]];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        uint64_t v65 = [v64 countByEnumeratingWithState:&v76 objects:v80 count:16];
        if (v65)
        {
          uint64_t v66 = v65;
          uint64_t v67 = *(void *)v77;
          uint64_t v68 = *MEMORY[0x1E4F2F780];
          uint64_t v69 = *MEMORY[0x1E4F2F768];
          long long v74 = options;
          while (2)
          {
            for (uint64_t i = 0; i != v66; ++i)
            {
              if (*(void *)v77 != v67) {
                objc_enumerationMutation(v64);
              }
              double v71 = *(void **)(*((void *)&v76 + 1) + 8 * i);
              long long v72 = objc_msgSend(v71, "objectForKey:", v68, v74);
              if (v72
                && [v72 isEqualToString:v69]
                && CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v71, &rect))
              {
                rect.origin.CGFloat x = rect.origin.x - rect.size.width * 0.5;
                rect.origin.CGFloat y = 1.0 - rect.origin.y - rect.size.height * 0.5;
                long long v73 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
                uint64_t v39 = orientation;
                uint64_t v57 = v74;
                if (v73) {
                  [(CIFilter *)v37 setValue:v73 forKey:@"inputFocusRect"];
                }
                goto LABEL_48;
              }
            }
            uint64_t v66 = [v64 countByEnumeratingWithState:&v76 objects:v80 count:16];
            uint64_t v39 = orientation;
            uint64_t v57 = v74;
            if (v66) {
              continue;
            }
            break;
          }
        }
      }
    }
  }
LABEL_48:
  [(CIContext *)self _performFaceDetection:v57 image:image orientation:v39 filter:v37];
  return v37;
}

- (BOOL)prepareRender:(CIImage *)image fromRect:(CGRect)fromRect toDestination:(CIRenderDestination *)destination atPoint:(CGPoint)atPoint error:(NSError *)error
{
  double y = atPoint.y;
  double x = atPoint.x;
  double v11 = fromRect.origin.y;
  double v12 = fromRect.origin.x;
  float v14 = -[CIImage imageByCroppingToRect:](image, "imageByCroppingToRect:", fromRect.origin.x, fromRect.origin.y, fromRect.size.width, fromRect.size.height);
  CGAffineTransformMakeTranslation(&v16, x - v12, y - v11);
  return [(CIContext *)self _startTaskToRender:[(CIImage *)v14 imageByApplyingTransform:&v16] toDestination:destination forPrepareRender:1 forClear:0 error:error] != 0;
}

- (CIRenderTask)startTaskToClear:(CIRenderDestination *)destination error:(NSError *)error
{
  uint64_t v7 = [(CIRenderDestination *)destination blendKernel];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = v7;
    [(CIRenderDestination *)destination setBlendKernel:0];
  }
  unint64_t v10 = [(CIContext *)self _startTaskToRender:+[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor clearColor]) toDestination:destination forPrepareRender:0 forClear:1 error:error];
  if (v8)
  {
    [(CIRenderDestination *)destination setBlendKernel:v8];
  }
  return v10;
}

+ (void)loadArchiveWithURL:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s Failed loading binary archive from %{public}@", v2, v3, v4, v5, 2u);
}

+ (void)loadArchiveWithName:fromURL:.cold.1()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_193671000, v0, v1, "%{public}s Failed loading %{public}@ binary archive from %{public}@, Only AIR loaded", v2);
}

+ (void)loadArchiveWithName:fromURL:.cold.2()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_193671000, v0, v1, "%{public}s Failed loading %{public}@ AIR and binary archive from %{public}@", v2);
}

+ (void)loadArchiveWithName:fromURL:.cold.3()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_193671000, v0, v1, "%{public}s No %{public}@ AIR or binary archive found in %{public}@", v2);
}

+ (void)loadArchive:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s Failed loading %{public}@ binary archive, Only AIR loaded", v2, v3, v4, v5, 2u);
}

+ (void)loadArchive:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s Failed loading %{public}@ AIR and binary archive", v2, v3, v4, v5, 2u);
}

+ (void)loadArchive:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s No %{public}@ AIR or binary archive found", v2, v3, v4, v5, 2u);
}

- (void)setObject:forKey:.cold.1()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_193671000, v0, v1, "%{public}s unsupported object %{public}@ for key %{public}@.", v2);
}

- (void)setObject:forKey:.cold.6()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s unsupported key %{public}@.", v2, v3, v4, v5, 2u);
}

- (void)objectForKey:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s unsupported key %{public}@.", v2, v3, v4, v5, 2u);
}

- (void)initWithOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithEAGLContext:(uint64_t)a3 options:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)render:(int)a1 toBitmap:rowBytes:bounds:format:colorSpace:.cold.1(int a1)
{
  CI::name_for_format(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_193671000, v1, v2, "%{public}s format %{public}s is not supported on GLES.", v3, v4, v5, v6, 2u);
}

- (void)render:toBitmap:rowBytes:bounds:format:colorSpace:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s rowBytes must be a multiple of %ld.", v2, v3, v4, v5, 2u);
}

- (void)render:(uint64_t)a3 toBitmap:(uint64_t)a4 rowBytes:(uint64_t)a5 bounds:(uint64_t)a6 format:(uint64_t)a7 colorSpace:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)render:(int)a1 toBitmap:rowBytes:bounds:format:colorSpace:.cold.4(int a1)
{
  CI::name_for_format(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_193671000, v1, v2, "%{public}s format %{public}s is unsupported.", v3, v4, v5, v6, 2u);
}

- (void)render:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)drawImage:(uint64_t)a3 inRect:(uint64_t)a4 fromRect:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)drawImage:(uint64_t)a3 inRect:(uint64_t)a4 fromRect:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)render:(uint64_t)a3 toTexture:(uint64_t)a4 target:(uint64_t)a5 bounds:(uint64_t)a6 colorSpace:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)render:(uint64_t)a3 toTexture:(uint64_t)a4 target:(uint64_t)a5 bounds:(uint64_t)a6 colorSpace:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)render:(uint64_t)a3 toMTLTexture:(uint64_t)a4 commandBuffer:(uint64_t)a5 bounds:(uint64_t)a6 colorSpace:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)render:(uint64_t)a3 toMTLTexture:(uint64_t)a4 commandBuffer:(uint64_t)a5 bounds:(uint64_t)a6 colorSpace:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end