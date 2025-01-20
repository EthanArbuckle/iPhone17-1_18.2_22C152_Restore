@interface ADJasperPointCloud
+ (BOOL)prepareDataBuffer:(__CVBuffer *)a3 forLength:(int)a4;
+ (BOOL)prepareDataBuffer:(__CVBuffer *)a3 forLength:(int)a4 additionalDataSize:(unint64_t)a5;
+ (id)JasperCSVAttributeNamesCannonicalOrder;
+ (id)makeWithDataBuffer:(__CVBuffer *)a3;
+ (id)pointCloudByMergingPointClouds:(id)a3;
+ (id)pointCloudByMergingPointClouds:(id)a3 applyingTransforms:(id *)a4 projectingToCamera:(id)a5;
+ (id)pointCloudFromCSV:(id)a3;
+ (id)pointCloudFromFile:(id)a3;
+ (id)pointCloudFromJSPP:(id)a3;
+ (int64_t)getKeyForName:(id)a3;
+ (unint64_t)requiredStorageBytesForLength:(int)a3;
+ (unint64_t)requiredStorageBytesForLength:(int)a3 additionalDataSize:(unint64_t)a4;
+ (unsigned)pixelFormat;
+ (void)setEmulatedDevice:(id)a3;
+ (void)setPerformanceOverrides:(id)a3;
- (ADJasperPointCloud)initWithDataBuffer:(__CVBuffer *)a3;
- (ADJasperPointCloud)initWithDictionaryRepresentation:(id)a3;
- (ADJasperPointCloud)initWithLength:(int)a3;
- (ADJasperPointCloud)initWithLength:(int)a3 storage:(__CVBuffer *)a4;
- (ADJasperPointCloud)initWithPointCloud:(id)a3;
- (ADJasperPointCloud)initWithPreparedStorage:(void *)a3 storageSize:(unint64_t)a4;
- (BOOL)pointCloudToCSV:(id)a3 atomically:(BOOL)a4;
- (BOOL)pointCloudToImageFile:(id)a3 uti:(id)a4 atomically:(BOOL)a5;
- (BOOL)pointCloudToJSPP:(id)a3 atomically:(BOOL)a4;
- (BOOL)reset;
- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4;
- (CGImage)cgImageRepresentation;
- (__CVBuffer)createVisualization;
- (__CVBuffer)createVisualizationOnImage:(__CVBuffer *)a3;
- (__CVBuffer)dataBuffer;
- (const)bankIds;
- (const)cameraPixels;
- (const)confidences;
- (const)echoIds;
- (const)euclideanDistances;
- (const)flags;
- (const)intensities;
- (const)signalToNoiseRatios;
- (const)spotIds;
- (const)undistortedCameraPixels;
- (id).cxx_construct;
- (id)additionalData;
- (id)debugQuickLookObject;
- (id)dictionaryRepresentation;
- (id)imageRepresentationForUTI:(id)a3;
- (id)initByMergingPointClouds:(id)a3;
- (id)jpegRepresentation;
- (id)mutableCopy;
- (id)pngRepresentation;
- (id)pointCloudByApplyingFilter:(id)a3;
- (id)pointCloudByChangingPointOfViewByTransform:(void *)a3 to:;
- (id)pointCloudByChangingPointOfViewFrom:(id)a3 to:(id)a4;
- (int)length;
- (int)size;
- (int64_t)projectJasperPointsCroppedBy:(CGRect)a3 rotatedBy:(int64_t)a4 andScaledInto:(__CVBuffer *)a5;
- (int64_t)projectJasperPointsFilteredBy:(id)a3 croppedBy:(CGRect)a4 rotatedBy:(int64_t)a5 andScaledInto:(__CVBuffer *)a6;
- (int64_t)projectJasperPointsFilteredBy:(id)a3 croppedBy:(CGRect)a4 rotatedBy:(int64_t)a5 andScaledMergingWith:(__CVBuffer *)a6;
- (uint64_t)points;
- (void)dealloc;
@end

@implementation ADJasperPointCloud

- (const)bankIds
{
  return (char *)self->_pc.m_header + *((void *)self->_pc.m_header + 9);
}

- (int)length
{
  m_header = self->_pc.m_header;
  if (m_header) {
    return *((_DWORD *)m_header + 2);
  }
  else {
    return 0;
  }
}

+ (id)makeWithDataBuffer:(__CVBuffer *)a3
{
  v3 = [[ADJasperPointCloud alloc] initWithDataBuffer:a3];

  return v3;
}

- (ADJasperPointCloud)initWithDictionaryRepresentation:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  v11.receiver = self;
  v11.super_class = (Class)ADJasperPointCloud;
  v5 = [(ADJasperPointCloud *)&v11 init];
  v6 = v5;
  v7 = v5;
  if (!v5
    || (appledepth::JasperPointCloud::initWithDictionaryRepresentation((appledepth::JasperPointCloud *)&v5->_pc, v4) & 1) != 0
    && (m_header = v7->_pc.m_header) != 0
    && *((void *)m_header + 1))
  {
    appledepth::JasperPointCloud::applyPerformanceOverrides((appledepth::JasperPointCloud *)&v6->_pc);
    v9 = v7;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)prepareDataBuffer:(__CVBuffer *)a3 forLength:(int)a4 additionalDataSize:(unint64_t)a5
{
  if (!a3) {
    return 0;
  }
  IOSurface = (__IOSurface *)CVDataBufferGetIOSurface();
  if (!IOSurface) {
    return 0;
  }
  v8 = IOSurface;
  OSType PixelFormat = IOSurfaceGetPixelFormat(IOSurface);
  if (PixelFormat != +[ADJasperPointCloud pixelFormat]) {
    return 0;
  }
  IOSurfaceLock(v8, 0, 0);
  BaseAddress = IOSurfaceGetBaseAddress(v8);
  unint64_t DataSize = CVDataBufferGetDataSize();
  char v12 = appledepth::JasperPointCloud::prepareStorage((uint64_t)BaseAddress, DataSize, a4, a5);
  IOSurfaceUnlock(v8, 0, 0);
  return v12;
}

- (ADJasperPointCloud)initWithDataBuffer:(__CVBuffer *)a3
{
  v3 = a3;
  if (a3)
  {
    IOSurface = (__IOSurface *)CVDataBufferGetIOSurface();
    v6 = IOSurface;
    if (IOSurface
      && (OSType PixelFormat = IOSurfaceGetPixelFormat(IOSurface),
          PixelFormat == +[ADJasperPointCloud pixelFormat]))
    {
      IOSurfaceLock(v6, 0, 0);
      BaseAddress = IOSurfaceGetBaseAddress(v6);
      v9 = [(ADJasperPointCloud *)self initWithPreparedStorage:BaseAddress storageSize:CVDataBufferGetDataSize()];
      IOSurfaceUnlock(v6, 0, 0);
      if (v9)
      {
        v9->_dataBuffer = CVBufferRetain(v3);
        appledepth::JasperPointCloud::applyPerformanceOverrides((appledepth::JasperPointCloud *)&v9->_pc);
      }
      self = v9;
      v3 = (__CVBuffer *)self;
    }
    else
    {
      v3 = 0;
    }
  }

  return (ADJasperPointCloud *)v3;
}

+ (unsigned)pixelFormat
{
  return 1785950320;
}

- (ADJasperPointCloud)initWithPreparedStorage:(void *)a3 storageSize:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ADJasperPointCloud;
  v5 = [(ADJasperPointCloud *)&v10 init];
  v6 = v5;
  if (v5 && !appledepth::JasperPointCloud::initWithPreparedStorage((appledepth::JasperPointCloud *)&v5->_pc, a3))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed initializing ADJasperPointCloud from memory: contains invalid header", v9, 2u);
    }
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

+ (unint64_t)requiredStorageBytesForLength:(int)a3 additionalDataSize:(unint64_t)a4
{
  v7[11] = *MEMORY[0x263EF8340];
  unint64_t v6 = 0;
  calculateOffsetsForLength(a3, v7, &v6);
  return v6 + a4;
}

- (const)undistortedCameraPixels
{
  return (const CGPoint *)((char *)self->_pc.m_header + *((void *)self->_pc.m_header + 5));
}

- (const)cameraPixels
{
  return (const CGPoint *)((char *)self->_pc.m_header + *((void *)self->_pc.m_header + 4));
}

- (id).cxx_construct
{
  self->_pc.m_ownedStorage.__ptr_.__value_ = 0;
  self->_pc.m_header = 0;
  if (InitAttributes(void)::once != -1) {
    dispatch_once(&InitAttributes(void)::once, &__block_literal_global_1195);
  }
  return self;
}

- (id)dictionaryRepresentation
{
  DictionaryRepresentation = appledepth::JasperPointCloud::createDictionaryRepresentation((appledepth::JasperPointCloud *)&self->_pc);

  return DictionaryRepresentation;
}

- (BOOL)reset
{
  value = self->_pc.m_ownedStorage.__ptr_.__value_;
  self->_pc.m_ownedStorage.__ptr_.__value_ = 0;
  if (value) {
    MEMORY[0x24C570720](value, 0x1000C8077774924);
  }
  self->_pc.m_header = 0;
  if (self->_dataBuffer)
  {
    IOSurface = (__IOSurface *)CVDataBufferGetIOSurface();
    IOSurfaceUnlock(IOSurface, 0, 0);
    CVBufferRelease(self->_dataBuffer);
    self->_dataBuffer = 0;
  }
  return 1;
}

- (void)dealloc
{
  [(ADJasperPointCloud *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)ADJasperPointCloud;
  [(ADJasperPointCloud *)&v3 dealloc];
}

- (__CVBuffer)dataBuffer
{
  return self->_dataBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalData, 0);
  value = self->_pc.m_ownedStorage.__ptr_.__value_;
  self->_pc.m_ownedStorage.__ptr_.__value_ = 0;
  if (value)
  {
    JUMPOUT(0x24C570720);
  }
}

- (id)debugQuickLookObject
{
  v2 = [(ADJasperPointCloud *)self cgImageRepresentation];

  return (id)debugQuickLookObjectFromCGImage(v2);
}

- (BOOL)pointCloudToImageFile:(id)a3 uti:(id)a4 atomically:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [(ADJasperPointCloud *)self imageRepresentationForUTI:a4];
  objc_super v10 = v9;
  if (v9) {
    char v11 = [v9 writeToFile:v8 atomically:v5];
  }
  else {
    char v11 = 0;
  }

  return v11;
}

- (id)jpegRepresentation
{
  return [(ADJasperPointCloud *)self imageRepresentationForUTI:@"public.jpeg"];
}

- (id)pngRepresentation
{
  return [(ADJasperPointCloud *)self imageRepresentationForUTI:@"public.png"];
}

- (id)imageRepresentationForUTI:(id)a3
{
  CFDictionaryRef v4 = (__CFString *)a3;
  BOOL v5 = [MEMORY[0x263EFF990] data];
  CGImageRef image = [(ADJasperPointCloud *)self cgImageRepresentation];
  CFMutableDataRef Mutable = CFDataCreateMutable(0, 0);
  CGImageDestinationRef idst = CGImageDestinationCreateWithData(v5, v4, 1uLL, 0);
  CGImageDestinationAddImage(idst, image, 0);
  if (CGImageDestinationFinalize(idst)) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 0;
  }
  ScopedCFObject<CGImageDestination *>::~ScopedCFObject((const void **)&idst);
  ScopedCFObject<__CFData *>::~ScopedCFObject((const void **)&Mutable);
  ScopedCFObject<CGImage *>::~ScopedCFObject((const void **)&image);

  return v6;
}

- (CGImage)cgImageRepresentation
{
  v2 = [(ADJasperPointCloud *)self createVisualization];

  return PixelBufferUtils::pixelBufferToCGImage(v2, v3);
}

- (__CVBuffer)createVisualization
{
  return [(ADJasperPointCloud *)self createVisualizationOnImage:0];
}

- (__CVBuffer)createVisualizationOnImage:(__CVBuffer *)a3
{
  if (a3)
  {
    PixelBufferUtils::createConvertedPixelBufferFormat(a3, (__CVBuffer *)0x42475241, 0);
    goto LABEL_19;
  }
  int v3 = 0;
  unint64_t v4 = 0;
  m_header = self->_pc.m_header;
  float64x2_t v6 = (float64x2_t)vdupq_n_s64(0x47EFFFFFE0000000uLL);
  float64x2_t v7 = (float64x2_t)vdupq_n_s64(0x3810000000000000uLL);
  while (v4 < *((void *)m_header + 1))
  {
    if (*(float *)((char *)m_header + 4 * v4 + *((void *)m_header + 3)) > 0.0)
    {
      float64x2_t v8 = *(float64x2_t *)((char *)m_header + 16 * v4 + *((void *)m_header + 4));
      float64x2_t v6 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v6, v8), (int8x16_t)v8, (int8x16_t)v6);
      float64x2_t v7 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v8, v7), (int8x16_t)v8, (int8x16_t)v7);
      ++v3;
    }
    ++v4;
  }
  if (!v3) {
    return 0;
  }
  __asm { FMOV            V1.2D, #24.0 }
  float32x2_t v14 = vcvt_f32_f64(vaddq_f64(vsubq_f64(v7, v6), _Q1));
  float v15 = v14.f32[1];
  if (v14.f32[1] >= v14.f32[0]) {
    float v16 = v14.f32[0];
  }
  else {
    float v16 = v14.f32[1];
  }
  if (v16 < 600.0)
  {
    v14.f32[0] = (float)(600.0 / v16) * v14.f32[0];
    float v15 = (float)(600.0 / v16) * v14.f32[1];
  }
  size_t v17 = (unint64_t)v14.f32[0];
  size_t v18 = (unint64_t)v15;
  CVPixelBufferRef pixelBufferOut = 0;
  CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef BufferAttributes = (const __CFDictionary *)getBufferAttributes();
  if (CVPixelBufferCreate(v19, v17, v18, 0x42475241u, BufferAttributes, &pixelBufferOut)) {
    v22 = 0;
  }
  else {
    v22 = pixelBufferOut;
  }
  if (v22)
  {
    PixelBufferUtils::blacken(v22, v21);
LABEL_19:
    operator new[]();
  }
  return v22;
}

- (id)pointCloudByApplyingFilter:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[ADMutableJasperPointCloud alloc] initWithCapacity:[(ADJasperPointCloud *)self length]];
  if (v5)
  {
    uint64_t v6 = [v4 echoMode];
    [v4 confidenceThreshold];
    float v8 = v7;
    [v4 minDistance];
    float v10 = v9;
    [v4 maxDistance];
    float v12 = v11;
    [v4 shortRangeDepthThreshold];
    float v14 = v13;
    [v4 shortRangeConfidenceThreshold];
    appledepth::JasperPointCloud::initByApplyingFilters((uint64_t)&v5->super._pc, (uint64_t)&self->_pc, v6, [v4 bankIDMask], v8, v10, v12, v14, v15);
    float v16 = v5;
  }

  return v5;
}

+ (void)setEmulatedDevice:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3) {
    BOOL v5 = (char *)[v3 UTF8String];
  }
  else {
    BOOL v5 = "";
  }
  uint64_t v6 = (ADJasperPerformanceOverride *)std::string::basic_string[abi:ne180100]<0>(&__str, v5);
  uint64_t Instance = ADJasperPerformanceOverride::getInstance(v6);
  std::string::operator=((std::string *)(Instance + 8), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

+ (void)setPerformanceOverrides:(id)a3
{
  id v3 = a3;
  id v4 = (ADJasperPerformanceOverride *)std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v3 UTF8String]);
  uint64_t Instance = (uint64_t *)ADJasperPerformanceOverride::getInstance(v4);
  ADJasperPerformanceOverride::initFromCsv(Instance, (uint64_t *)__p);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
}

+ (id)pointCloudByMergingPointClouds:(id)a3 applyingTransforms:(id *)a4 projectingToCamera:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  float v9 = [ADJasperPointCloud alloc];
  if (v9)
  {
    std::vector<appledepth::JasperPointCloud const*>::vector(&__p, [v7 count]);
    if (v24 != __p)
    {
      unint64_t v10 = 0;
      do
      {
        float v11 = [v7 objectAtIndexedSubscript:v10];
        *((void *)__p + v10) = v11 + 8;

        ++v10;
      }
      while (v10 < (v24 - (unsigned char *)__p) >> 3);
    }
    uint64_t v12 = [v7 count];
    if (appledepth::JasperPointCloud::initByMerging((appledepth::JasperPointCloud *)&v9->_pc, v12, (const appledepth::JasperPointCloud **)__p))
    {
      int v13 = 0;
      unint64_t v14 = 0;
      float v15 = (double *)((char *)a4 + 32);
      while (v14 < [v7 count])
      {
        float v16 = [v7 objectAtIndexedSubscript:v14];
        int v17 = [v16 length];

        uint64_t v18 = (uint64_t)v9->_pc.m_header + 16 * v13 + *((void *)v9->_pc.m_header + 2);
        +[ADCameraCalibration transform:points:with:outPoints:](ADCameraCalibration, "transform:points:with:outPoints:", v17, v18, v18, *(v15 - 4), *(v15 - 2), *v15, v15[2]);
        v13 += v17;
        ++v14;
        v15 += 8;
      }
      int v20 = [(ADJasperPointCloud *)v9 length];
      m_header = v9->_pc.m_header;
      [v8 project:v20 points:(char *)m_header + *((void *)m_header + 2) outUndistortedPixels:(char *)m_header + *((void *)m_header + 5) outR:(char *)m_header + *((void *)m_header + 6)];
      objc_msgSend(v8, "distort:undistortedPixels:outDistorted:", -[ADJasperPointCloud length](v9, "length"), (char *)v9->_pc.m_header + *((void *)v9->_pc.m_header + 5), (char *)v9->_pc.m_header + *((void *)v9->_pc.m_header + 4));
      CFAllocatorRef v19 = v9;
    }
    else
    {
      CFAllocatorRef v19 = 0;
    }
    if (__p)
    {
      v24 = __p;
      operator delete(__p);
    }
  }
  else
  {
    CFAllocatorRef v19 = 0;
  }

  return v19;
}

+ (id)pointCloudByMergingPointClouds:(id)a3
{
  id v3 = a3;
  id v4 = [[ADJasperPointCloud alloc] initByMergingPointClouds:v3];

  return v4;
}

+ (id)pointCloudFromFile:(id)a3
{
  id v3 = a3;
  id v4 = [v3 lowercaseString];
  int v5 = [v4 hasSuffix:@".csv"];

  if (v5)
  {
    uint64_t v6 = +[ADJasperPointCloud pointCloudFromCSV:v3];
  }
  else
  {
    id v7 = [v3 lowercaseString];
    int v8 = [v7 hasSuffix:@".jspp"];

    if (!v8)
    {
      unint64_t v10 = [NSDictionary dictionaryWithContentsOfFile:v3];
      if (v10) {
        float v9 = [[ADJasperPointCloud alloc] initWithDictionaryRepresentation:v10];
      }
      else {
        float v9 = 0;
      }

      if (!v9) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v6 = +[ADJasperPointCloud pointCloudFromJSPP:v3];
  }
  float v9 = (ADJasperPointCloud *)v6;
  if (v6)
  {
LABEL_11:
    appledepth::JasperPointCloud::applyPerformanceOverrides((appledepth::JasperPointCloud *)&v9->_pc);
    float v11 = v9;
  }
LABEL_12:

  return v9;
}

+ (id)pointCloudFromJSPP:(id)a3
{
  id v3 = [MEMORY[0x263EFF990] dataWithContentsOfFile:a3];
  id v4 = [ADJasperPointCloud alloc];
  id v5 = v3;
  uint64_t v6 = -[ADJasperPointCloud initWithPreparedStorage:storageSize:](v4, "initWithPreparedStorage:storageSize:", [v5 mutableBytes], objc_msgSend(v5, "length"));
  id v7 = [[ADJasperPointCloud alloc] initWithPointCloud:v6];

  return v7;
}

+ (id)pointCloudFromCSV:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v85 = 0;
  v84 = [NSString stringWithContentsOfFile:v4 encoding:1 error:&v85];
  id v5 = v85;
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      v73 = [v5 description];
      *(_DWORD *)v88 = 138412290;
      *(void *)&v88[4] = v73;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "error opening jasper file: %@", v88, 0xCu);
    }
    uint64_t v6 = 0;
  }
  else
  {
    v83 = [v84 componentsSeparatedByString:@"\n"];
    if ((unint64_t)[v83 count] > 1)
    {
      *(void *)&long long v7 = -1;
      *((void *)&v7 + 1) = -1;
      *(_OWORD *)&v90[12] = v7;
      long long v89 = v7;
      *(_OWORD *)v90 = v7;
      *(_OWORD *)v88 = v7;
      int v8 = [v83 objectAtIndexedSubscript:0];
      float v9 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      v77 = [v8 stringByTrimmingCharactersInSet:v9];

      unint64_t v10 = [v77 componentsSeparatedByString:@","];
      unint64_t v11 = 0;
      uint64_t v12 = &_os_log_internal;
      id v76 = v4;
      while (v11 < [v10 count])
      {
        int v13 = [v10 objectAtIndexedSubscript:v11];
        uint64_t v14 = [a1 getKeyForName:v13];

        if (v14 < 15)
        {
          *(_DWORD *)&v88[4 * v14] = v11;
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          float v15 = [v10 objectAtIndexedSubscript:v11];
          *(_DWORD *)buf = 138412290;
          v87 = v15;
          _os_log_error_impl(&dword_247EC4000, v12, OS_LOG_TYPE_ERROR, "unknown jasper point cloud key %@. ignoring", buf, 0xCu);
        }
        ++v11;
      }
      int v16 = *(_DWORD *)&v90[16];
      int v17 = *(_DWORD *)&v90[20];
      int v18 = *(_DWORD *)&v90[12];
      int v19 = *(_DWORD *)&v88[4];
      v20.i64[0] = __PAIR64__(*(unsigned int *)&v90[12], *(unsigned int *)&v90[16]);
      v20.i64[1] = __PAIR64__(*(unsigned int *)&v88[4], *(unsigned int *)&v90[20]);
      if ((vmaxv_u16((uint16x4_t)vmovn_s32(vcltzq_s32(v20))) & 1) != 0
        || (int v21 = *(_DWORD *)v88, v22 = *(_DWORD *)&v88[8], (*(_DWORD *)v88 | *(_DWORD *)&v88[8]) < 0)
        || (uint64_t v75 = v89, (v89 & 0x80000000) != 0))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to load point cloud: file is missing essential fields", buf, 2u);
        }
        uint64_t v6 = 0;
        id v5 = 0;
        id v4 = v76;
      }
      else
      {
        v23 = -[ADMutableJasperPointCloud initWithCapacity:]([ADMutableJasperPointCloud alloc], "initWithCapacity:", [v83 count] - 1);
        uint64_t v24 = 0;
        uint64_t v25 = 0;
        uint64_t v78 = v16;
        uint64_t v79 = v18;
        uint64_t v82 = v22;
        uint64_t v80 = v19;
        uint64_t v81 = v21;
        id v5 = 0;
        id v4 = v76;
        while (1)
        {
          if (v25 >= [(ADMutableJasperPointCloud *)v23 capacity]) {
            goto LABEL_52;
          }
          v26 = [v83 objectAtIndexedSubscript:v25 + 1];
          v27 = [v26 componentsSeparatedByString:@","];

          if ([v27 count] == 1)
          {
            v28 = [v27 objectAtIndexedSubscript:0];
            int v29 = [v28 isEqualToString:&stru_26FC22BA0];

            if (v29)
            {

LABEL_52:
              [(ADMutableJasperPointCloud *)v23 resize:v25];
              uint64_t v6 = v23;
              goto LABEL_53;
            }
          }
          uint64_t v30 = [v27 count];
          if (v30 != [v10 count]) {
            break;
          }
          v31 = [v27 objectAtIndexedSubscript:v82];
          [v31 floatValue];
          [(ADMutableJasperPointCloud *)v23 mutableEchoIds][v25] = (int)v32;

          v33 = [v27 objectAtIndexedSubscript:v81];
          [v33 floatValue];
          [(ADMutableJasperPointCloud *)v23 mutableBankIds][v25] = (int)v34;

          v35 = [v27 objectAtIndexedSubscript:v80];
          [v35 floatValue];
          [(ADMutableJasperPointCloud *)v23 mutableSpotIds][v25] = (int)v36;

          v37 = [v27 objectAtIndexedSubscript:v75];
          [v37 floatValue];
          *(_DWORD *)([(ADMutableJasperPointCloud *)v23 mutableConfidences] + 4 * v25) = v38;

          v39 = [v27 objectAtIndexedSubscript:v79];
          [v39 floatValue];
          *(_DWORD *)([(ADMutableJasperPointCloud *)v23 mutablePoints] + v24) = v40;

          v41 = [v27 objectAtIndexedSubscript:v78];
          [v41 floatValue];
          *(_DWORD *)([(ADMutableJasperPointCloud *)v23 mutablePoints] + v24 + 4) = v42;

          v43 = [v27 objectAtIndexedSubscript:v17];
          [v43 floatValue];
          *(_DWORD *)([(ADMutableJasperPointCloud *)v23 mutablePoints] + v24 + 8) = v44;

          double v45 = NAN;
          if ((HIDWORD(v89) & 0x80000000) != 0)
          {
            double v47 = NAN;
          }
          else
          {
            uint64_t v46 = *(unsigned int *)v90;
            double v47 = NAN;
            if ((*(_DWORD *)v90 & 0x80000000) == 0)
            {
              v48 = objc_msgSend(v27, "objectAtIndexedSubscript:");
              [v48 floatValue];
              float v50 = v49;
              v51 = [v27 objectAtIndexedSubscript:v46];
              [v51 floatValue];
              float v53 = v52;

              double v45 = v50;
              double v47 = v53;
            }
          }
          v54 = (double *)([(ADMutableJasperPointCloud *)v23 mutableCameraPixels] + v24);
          double *v54 = v45;
          v54[1] = v47;
          double v55 = NAN;
          if ((*(_DWORD *)&v90[4] & 0x80000000) != 0)
          {
            double v57 = NAN;
          }
          else
          {
            uint64_t v56 = *(unsigned int *)&v90[8];
            double v57 = NAN;
            if ((*(_DWORD *)&v90[8] & 0x80000000) == 0)
            {
              v58 = objc_msgSend(v27, "objectAtIndexedSubscript:");
              [v58 floatValue];
              float v60 = v59;
              v61 = [v27 objectAtIndexedSubscript:v56];
              [v61 floatValue];
              float v63 = v62;

              double v55 = v60;
              double v57 = v63;
            }
          }
          v64 = (double *)([(ADMutableJasperPointCloud *)v23 mutableUndistortedCameraPixels]+ v24);
          double *v64 = v55;
          v64[1] = v57;
          if ((*(_DWORD *)&v88[12] & 0x80000000) != 0)
          {
            [(ADMutableJasperPointCloud *)v23 mutableEuclideanDistances][4 * v25] = NAN;
          }
          else
          {
            v65 = objc_msgSend(v27, "objectAtIndexedSubscript:");
            [v65 floatValue];
            *(_DWORD *)([(ADMutableJasperPointCloud *)v23 mutableEuclideanDistances]
                      + 4 * v25) = v66;
          }
          if ((DWORD1(v89) & 0x80000000) != 0)
          {
            [(ADMutableJasperPointCloud *)v23 mutableIntensities][4 * v25] = NAN;
          }
          else
          {
            v67 = objc_msgSend(v27, "objectAtIndexedSubscript:");
            [v67 floatValue];
            *(_DWORD *)([(ADMutableJasperPointCloud *)v23 mutableIntensities] + 4 * v25) = v68;
          }
          if ((DWORD2(v89) & 0x80000000) != 0)
          {
            [(ADMutableJasperPointCloud *)v23 mutableSignalToNoiseRatios][4 * v25] = NAN;
          }
          else
          {
            v69 = objc_msgSend(v27, "objectAtIndexedSubscript:");
            [v69 floatValue];
            *(_DWORD *)([(ADMutableJasperPointCloud *)v23 mutableSignalToNoiseRatios]
                      + 4 * v25) = v70;
          }
          if ((*(_DWORD *)&v90[24] & 0x80000000) != 0)
          {
            [(ADMutableJasperPointCloud *)v23 mutableFlags][4 * v25] = 0;
          }
          else
          {
            v71 = objc_msgSend(v27, "objectAtIndexedSubscript:");
            [v71 floatValue];
            [(ADMutableJasperPointCloud *)v23 mutableFlags][4 * v25] = v72;
          }
          v24 += 16;
          ++v25;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to load point cloud: number of fields in header do not match data.", buf, 2u);
        }

        uint64_t v6 = 0;
LABEL_53:
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v88 = 0;
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "error parsing jasper file: no enough points", v88, 2u);
      }
      uint64_t v6 = 0;
    }
  }

  return v6;
}

+ (int64_t)getKeyForName:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[ADJasperPointCloud JasperCSVAttributeNamesCannonicalOrder];
  for (unint64_t i = 0; i < [v4 count]; ++i)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = objc_msgSend(v4, "objectAtIndexedSubscript:", i, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          unint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) lowercaseString];
          unint64_t v11 = [v3 lowercaseString];
          char v12 = [v10 isEqualToString:v11];

          if (v12)
          {

            goto LABEL_13;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  unint64_t i = 15;
LABEL_13:

  return i;
}

+ (id)JasperCSVAttributeNamesCannonicalOrder
{
  return &unk_26FC288E0;
}

+ (BOOL)prepareDataBuffer:(__CVBuffer *)a3 forLength:(int)a4
{
  return +[ADJasperPointCloud prepareDataBuffer:a3 forLength:*(void *)&a4 additionalDataSize:0];
}

+ (unint64_t)requiredStorageBytesForLength:(int)a3
{
  return +[ADJasperPointCloud requiredStorageBytesForLength:*(void *)&a3 additionalDataSize:0];
}

- (id)pointCloudByChangingPointOfViewByTransform:(void *)a3 to:
{
  id v4 = a3;
  id v5 = (char *)objc_alloc((Class)objc_opt_class());
  if (v5) {
    appledepth::JasperPointCloud::initByCloning((appledepth::JasperPointCloud *)(v5 + 8), (const appledepth::JasperPointCloud *)(a1 + 8));
  }

  return 0;
}

- (id)pointCloudByChangingPointOfViewFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 getTransformationTo:v7];
  uint64_t v8 = -[ADJasperPointCloud pointCloudByChangingPointOfViewByTransform:to:](self, "pointCloudByChangingPointOfViewByTransform:to:", v7);

  return v8;
}

- (int64_t)projectJasperPointsCroppedBy:(CGRect)a3 rotatedBy:(int64_t)a4 andScaledInto:(__CVBuffer *)a5
{
  return appledepth::JasperPointCloud::projectJasperPoints((uint64_t)&self->_pc, a4, 3, 0xFFFFFFFFuLL, 0, a5, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, 0.0, 3.4028e38, 0.0, 0.0);
}

- (int64_t)projectJasperPointsFilteredBy:(id)a3 croppedBy:(CGRect)a4 rotatedBy:(int64_t)a5 andScaledMergingWith:(__CVBuffer *)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  uint64_t v13 = [v12 echoMode];
  [v12 confidenceThreshold];
  float v15 = v14;
  [v12 minDistance];
  float v17 = v16;
  [v12 maxDistance];
  float v19 = v18;
  [v12 shortRangeDepthThreshold];
  float v21 = v20;
  [v12 shortRangeConfidenceThreshold];
  int64_t v23 = appledepth::JasperPointCloud::projectJasperPoints((uint64_t)&self->_pc, a5, v13, [v12 bankIDMask], objc_msgSend(v12, "duplicateProjectedSpotsMode"), a6, 0, x, y, width, height, v15, v17, v19, v21, v22);

  return v23;
}

- (int64_t)projectJasperPointsFilteredBy:(id)a3 croppedBy:(CGRect)a4 rotatedBy:(int64_t)a5 andScaledInto:(__CVBuffer *)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  uint64_t v13 = [v12 echoMode];
  [v12 confidenceThreshold];
  float v15 = v14;
  [v12 minDistance];
  float v17 = v16;
  [v12 maxDistance];
  float v19 = v18;
  [v12 shortRangeDepthThreshold];
  float v21 = v20;
  [v12 shortRangeConfidenceThreshold];
  int64_t v23 = appledepth::JasperPointCloud::projectJasperPoints((uint64_t)&self->_pc, a5, v13, [v12 bankIDMask], objc_msgSend(v12, "duplicateProjectedSpotsMode"), a6, 1, x, y, width, height, v15, v17, v19, v21, v22);

  return v23;
}

- (id)additionalData
{
  additionalData = self->_additionalData;
  if (!additionalData)
  {
    m_header = self->_pc.m_header;
    uint64_t v5 = *((void *)m_header + 13);
    if (v5)
    {
      id v6 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:(char *)m_header + *((void *)m_header + 14) length:v5 freeWhenDone:0];
      id v7 = self->_additionalData;
      self->_additionalData = v6;

      additionalData = self->_additionalData;
    }
    else
    {
      additionalData = 0;
    }
  }

  return additionalData;
}

- (const)flags
{
  return (const unsigned int *)((char *)self->_pc.m_header + *((void *)self->_pc.m_header + 12));
}

- (const)echoIds
{
  return (char *)self->_pc.m_header + *((void *)self->_pc.m_header + 11);
}

- (const)spotIds
{
  return (char *)self->_pc.m_header + *((void *)self->_pc.m_header + 10);
}

- (const)signalToNoiseRatios
{
  return (const float *)((char *)self->_pc.m_header + *((void *)self->_pc.m_header + 8));
}

- (const)confidences
{
  return (const float *)((char *)self->_pc.m_header + *((void *)self->_pc.m_header + 3));
}

- (const)intensities
{
  return (const float *)((char *)self->_pc.m_header + *((void *)self->_pc.m_header + 7));
}

- (uint64_t)points
{
  return *(void *)(a1 + 16) + *(void *)(*(void *)(a1 + 16) + 16);
}

- (const)euclideanDistances
{
  return (const float *)((char *)self->_pc.m_header + *((void *)self->_pc.m_header + 6));
}

- (int)size
{
  m_header = self->_pc.m_header;
  if (m_header) {
    return *((_DWORD *)m_header + 2);
  }
  else {
    return 0;
  }
}

- (id)initByMergingPointClouds:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    std::vector<appledepth::JasperPointCloud const*>::vector(&__p, [v4 count]);
    if (v11 != __p)
    {
      unint64_t v5 = 0;
      do
      {
        id v6 = [v4 objectAtIndexedSubscript:v5];
        *((void *)__p + v5) = v6 + 8;

        ++v5;
      }
      while (v5 < (v11 - (unsigned char *)__p) >> 3);
    }
    uint64_t v7 = [v4 count];
    if (appledepth::JasperPointCloud::initByMerging((appledepth::JasperPointCloud *)&self->_pc, v7, (const appledepth::JasperPointCloud **)__p))uint64_t v8 = self; {
    else
    }
      uint64_t v8 = 0;
    if (__p)
    {
      unint64_t v11 = __p;
      operator delete(__p);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (ADJasperPointCloud)initWithPointCloud:(id)a3
{
  id v4 = (char *)a3;
  v8.receiver = self;
  v8.super_class = (Class)ADJasperPointCloud;
  unint64_t v5 = [(ADJasperPointCloud *)&v8 init];
  if (v5) {
    appledepth::JasperPointCloud::initByCloning((appledepth::JasperPointCloud *)&v5->_pc, (const appledepth::JasperPointCloud *)(v4 + 8));
  }
  id v6 = (ADJasperPointCloud *)0;

  return v6;
}

- (id)mutableCopy
{
  id v3 = [ADMutableJasperPointCloud alloc];

  return [(ADJasperPointCloud *)v3 initWithPointCloud:self];
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 lowercaseString];
  int v8 = [v7 hasSuffix:@".csv"];

  if (v8)
  {
    BOOL v9 = [(ADJasperPointCloud *)self pointCloudToCSV:v6 atomically:v4];
LABEL_10:
    char v16 = v9;
    goto LABEL_11;
  }
  unint64_t v10 = [v6 lowercaseString];
  int v11 = [v10 hasSuffix:@".jspp"];

  if (v11)
  {
    BOOL v9 = [(ADJasperPointCloud *)self pointCloudToJSPP:v6 atomically:v4];
    goto LABEL_10;
  }
  id v12 = [v6 lowercaseString];
  if ([v12 hasSuffix:@".jpeg"])
  {

LABEL_8:
    float v15 = @"public.jpeg";
LABEL_9:
    BOOL v9 = [(ADJasperPointCloud *)self pointCloudToImageFile:v6 uti:v15 atomically:v4];
    goto LABEL_10;
  }
  uint64_t v13 = [v6 lowercaseString];
  char v14 = [v13 hasSuffix:@".jpg"];

  if (v14) {
    goto LABEL_8;
  }
  float v18 = [v6 lowercaseString];
  int v19 = [v18 hasSuffix:@".png"];

  if (v19)
  {
    float v15 = @"public.png";
    goto LABEL_9;
  }
  float v20 = [(ADJasperPointCloud *)self dictionaryRepresentation];
  float v21 = v20;
  if (v20) {
    char v16 = [v20 writeToFile:v6 atomically:v4];
  }
  else {
    char v16 = 0;
  }

LABEL_11:
  return v16;
}

- (BOOL)pointCloudToJSPP:(id)a3 atomically:(BOOL)a4
{
  uint64_t v4 = a4;
  v14[11] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x263EFF8F8];
  m_header = self->_pc.m_header;
  m_capacitCGFloat y = self->_pc.m_capacity;
  uint64_t v10 = *((void *)m_header + 13);
  unint64_t v13 = 0;
  calculateOffsetsForLength(m_capacity, v14, &v13);
  int v11 = [v7 dataWithBytes:m_header length:v13 + v10];
  LOBYTE(v4) = [v11 writeToFile:v6 atomically:v4];

  return v4;
}

- (BOOL)pointCloudToCSV:(id)a3 atomically:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v23 = a3;
  uint64_t v24 = +[ADJasperPointCloud JasperCSVAttributeNamesCannonicalOrder];
  m_header = self->_pc.m_header;
  if (m_header) {
    uint64_t v7 = *((void *)m_header + 1) + 1;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v25 = [MEMORY[0x263EFF980] arrayWithCapacity:v7];
  BOOL v22 = v4;
  int v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v24, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v24;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = [*(id *)(*((void *)&v26 + 1) + 8 * v12) objectAtIndexedSubscript:0];
        [v8 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  char v14 = [v8 componentsJoinedByString:@","];
  [v25 addObject:v14];

  uint64_t v15 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    float v17 = self->_pc.m_header;
    if (v17) {
      float v17 = (JasperPointCloudDataHeader *)*((void *)v17 + 1);
    }
    if (i >= (unint64_t)v17) {
      break;
    }
    float v18 = objc_msgSend(NSString, "stringWithFormat:", @"%u,%u,%u,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%u", -[ADJasperPointCloud bankIds](self, "bankIds")[i], -[ADJasperPointCloud spotIds](self, "spotIds")[i], -[ADJasperPointCloud echoIds](self, "echoIds")[i], -[ADJasperPointCloud euclideanDistances](self, "euclideanDistances")[4 * i], -[ADJasperPointCloud confidences](self, "confidences")[4 * i], -[ADJasperPointCloud intensities](self, "intensities")[4 * i], -[ADJasperPointCloud signalToNoiseRatios](self, "signalToNoiseRatios")[4 * i], (void)-[ADJasperPointCloud cameraPixels](self, "cameraPixels")[v15], (void)(-[ADJasperPointCloud cameraPixels](self, "cameraPixels") + v15)[8], (void)-[ADJasperPointCloud undistortedCameraPixels](self, "undistortedCameraPixels")[v15], (void)(-[ADJasperPointCloud undistortedCameraPixels](self, "undistortedCameraPixels") + v15)[8], *(float *)(-[ADJasperPointCloud points](self, "points") + v15), *(float *)(-[ADJasperPointCloud points](self, "points") + v15 + 4), COERCE_FLOAT(*(void *)(-[ADJasperPointCloud points](self, "points") + v15 + 8)), -[ADJasperPointCloud flags](self, "flags")[4 * i]);
    [v25 addObject:v18];

    v15 += 16;
  }
  int v19 = [v25 componentsJoinedByString:@"\r\n"];
  char v20 = [v19 writeToFile:v23 atomically:v22 encoding:1 error:0];

  return v20;
}

- (ADJasperPointCloud)initWithLength:(int)a3 storage:(__CVBuffer *)a4
{
  unint64_t v5 = self;
  if (a4)
  {
    if (!+[ADJasperPointCloud prepareDataBuffer:a4 forLength:*(void *)&a3])
    {
      uint64_t v7 = 0;
      goto LABEL_7;
    }
    id v6 = [(ADJasperPointCloud *)v5 initWithDataBuffer:a4];
  }
  else
  {
    id v6 = [(ADJasperPointCloud *)self initWithLength:*(void *)&a3];
  }
  unint64_t v5 = v6;
  uint64_t v7 = v5;
LABEL_7:

  return v7;
}

- (ADJasperPointCloud)initWithLength:(int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ADJasperPointCloud;
  BOOL v4 = [(ADJasperPointCloud *)&v7 init];
  if (v4) {
    appledepth::JasperPointCloud::initWithLength((appledepth::JasperPointCloud *)&v4->_pc, a3);
  }
  unint64_t v5 = (ADJasperPointCloud *)0;

  return v5;
}

@end