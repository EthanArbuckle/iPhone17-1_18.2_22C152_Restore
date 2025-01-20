@interface VideoSpillMapMetalSession
+ (unint64_t)metalPixelFormatForPixelFormat:(unsigned int)a3 withTransferFunction:(unsigned __int8)a4;
- (VideoSpillMapMetalSession)init;
- (id)loadTexture:(__CVBuffer *)a3 withAttributes:(id)a4 forPlane:(unsigned int)a5 withCache:(__CVMetalTextureCache *)a6 withFormat:(unint64_t)a7;
- (int)calculateDrmSpillmapMetal:(__CVBuffer *)a3 emitSpillmap:(__CVBuffer *)a4 setLayout:(int)a5 withAllocator:(void *)a6;
- (int)configureGPU;
- (int)configureIntermediateTextureProcessing:(int)a3 setHeight:(int)a4 setSigma:(float)a5;
- (int)configureSession:(__IOSurface *)a3 setWidth:(int)a4 setHeight:(int)a5;
- (void)dealloc;
@end

@implementation VideoSpillMapMetalSession

+ (unint64_t)metalPixelFormatForPixelFormat:(unsigned int)a3 withTransferFunction:(unsigned __int8)a4
{
  unint64_t result = 0;
  if ((int)a3 <= 875836517)
  {
    if ((int)a3 <= 645428783)
    {
      if (a3 != 641230384)
      {
        int v5 = 641234480;
LABEL_22:
        if (a3 != v5) {
          return result;
        }
      }
    }
    else
    {
      if (a3 == 645428784) {
        goto LABEL_17;
      }
      if (a3 != 875704422)
      {
        int v5 = 875704438;
        goto LABEL_22;
      }
    }
    BOOL v7 = a4 == 8;
    unint64_t v6 = 520;
    unint64_t v8 = 500;
    goto LABEL_25;
  }
  if ((int)a3 > 1885745711)
  {
    if (a3 != 1885745712)
    {
      if (a3 != 2016686640 && a3 != 2019963440) {
        return result;
      }
      unint64_t v6 = 525;
      if (a4 == 16) {
        unint64_t v6 = 564;
      }
      BOOL v7 = a4 == 8;
      unint64_t v8 = 505;
LABEL_25:
      if (v7) {
        return v8;
      }
      else {
        return v6;
      }
    }
LABEL_17:
    unint64_t v6 = 528;
    if (a4 == 16) {
      unint64_t v6 = 567;
    }
    BOOL v7 = a4 == 8;
    unint64_t v8 = 508;
    goto LABEL_25;
  }
  switch(a3)
  {
    case 0x34343466u:
      BOOL v7 = a4 == 8;
      unint64_t v6 = 523;
      unint64_t v8 = 503;
      goto LABEL_25;
    case 0x42475241u:
      return 80;
    case 0x70343230u:
      goto LABEL_17;
  }
  return result;
}

- (VideoSpillMapMetalSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)VideoSpillMapMetalSession;
  v2 = [(VideoSpillMapMetalSession *)&v6 init];
  v3 = v2;
  if (v2 && ![(VideoSpillMapMetalSession *)v2 configureGPU]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  spillBufferPoolUnprotected = self->_spillBufferPoolUnprotected;
  if (spillBufferPoolUnprotected) {
    CFRelease(spillBufferPoolUnprotected);
  }
  spillBufferPoolScreenScrapingProtected = self->_spillBufferPoolScreenScrapingProtected;
  if (spillBufferPoolScreenScrapingProtected) {
    CFRelease(spillBufferPoolScreenScrapingProtected);
  }
  spillBufferPoolHDCPType0 = self->_spillBufferPoolHDCPType0;
  if (spillBufferPoolHDCPType0) {
    CFRelease(spillBufferPoolHDCPType0);
  }
  spillBufferPoolHDCPType1 = self->_spillBufferPoolHDCPType1;
  if (spillBufferPoolHDCPType1) {
    CFRelease(spillBufferPoolHDCPType1);
  }
  spillmapBufferProperties = self->_spillmapBufferProperties;
  if (spillmapBufferProperties) {
    CFRelease(spillmapBufferProperties);
  }
  textureCacheBGRA = self->_textureCacheBGRA;
  if (textureCacheBGRA) {
    CFRelease(textureCacheBGRA);
  }
  textureCacheSpillmap = self->_textureCacheSpillmap;
  if (textureCacheSpillmap) {
    CFRelease(textureCacheSpillmap);
  }
  v10.receiver = self;
  v10.super_class = (Class)VideoSpillMapMetalSession;
  [(VideoSpillMapMetalSession *)&v10 dealloc];
}

- (int)configureGPU
{
  v38[1] = *MEMORY[0x263EF8340];
  v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v3;

  int v5 = self->_device;
  if (!v5)
  {
    v16 = *re::videoLogObjects(0);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      return 11;
    }
    *(_WORD *)buf = 0;
    v17 = "[VideoLightSpillGenerator] [configureGPU] Unable to get metal device";
LABEL_13:
    _os_log_error_impl(&dword_233120000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    return 11;
  }
  objc_super v6 = (MTLCommandQueue *)[(MTLDevice *)v5 newCommandQueue];
  commandQueue = self->_commandQueue;
  self->_commandQueue = v6;

  if (!self->_commandQueue)
  {
    v16 = *re::videoLogObjects(v8);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      return 11;
    }
    *(_WORD *)buf = 0;
    v17 = "[VideoLightSpillGenerator] [configureGPU] Unable to get command queue";
    goto LABEL_13;
  }
  v9 = (MPSImageBilinearScale *)[objc_alloc(MEMORY[0x263F13240]) initWithDevice:self->_device];
  bilinearScale = self->_bilinearScale;
  self->_bilinearScale = v9;

  if (!self->_bilinearScale)
  {
    v16 = *re::videoLogObjects(v11);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "[VideoLightSpillGenerator] [configureGPU] Unable to initialize bilinear scaling filter";
      goto LABEL_13;
    }
    return 11;
  }
  v12 = (re *)CVMetalTextureCacheCreate(0, 0, self->_device, 0, &self->_textureCacheBGRA);
  if (v12)
  {
    int v13 = (int)v12;
    v14 = *re::videoLogObjects(v12);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v32) = v13;
      v15 = "[VideoLightSpillGenerator] [configureGPU] Error creating texture cache BGRA: %d";
LABEL_19:
      _os_log_error_impl(&dword_233120000, v14, OS_LOG_TYPE_ERROR, v15, buf, 8u);
    }
  }
  else
  {
    v19 = (re *)CVMetalTextureCacheCreate(0, 0, self->_device, 0, &self->_textureCacheSpillmap);
    if (v19)
    {
      int v13 = (int)v19;
      v14 = *re::videoLogObjects(v19);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v32) = v13;
        v15 = "[VideoLightSpillGenerator] [configureGPU] Error creating texture cache spill map: %d";
        goto LABEL_19;
      }
    }
    else
    {
      if (!self->_readAttributes)
      {
        uint64_t v37 = *MEMORY[0x263F04070];
        v38[0] = &unk_26E749DB8;
        v20 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
        readAttributes = self->_readAttributes;
        self->_readAttributes = v20;
      }
      if (!self->_readWriteAttributes)
      {
        uint64_t v35 = *MEMORY[0x263F04070];
        v36 = &unk_26E749DD0;
        v22 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        readWriteAttributes = self->_readWriteAttributes;
        self->_readWriteAttributes = v22;
      }
      v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v25 = self->_device;
      id v30 = 0;
      v26 = (void *)[(MTLDevice *)v25 newDefaultLibraryWithBundle:v24 error:&v30];
      v27 = (re *)v30;
      v28 = v27;
      if (v26)
      {
        int v13 = 0;
      }
      else
      {
        v29 = *re::videoLogObjects(v27);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v32 = v24;
          __int16 v33 = 2112;
          v34 = v28;
          _os_log_impl(&dword_233120000, v29, OS_LOG_TYPE_DEFAULT, "[VideoLightSpillGenerator] [configureGPU] Unable to get metal library for bundle %@ error: %@", buf, 0x16u);
        }
        int v13 = 11;
      }
    }
  }
  return v13;
}

- (int)configureSession:(__IOSurface *)a3 setWidth:(int)a4 setHeight:(int)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a3)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (!Mutable) {
      return 7;
    }
    v9 = Mutable;
    CFDictionarySetInt32(Mutable, (const __CFString *)*MEMORY[0x263F0EF50], a4);
    CFDictionarySetInt32(v9, (const __CFString *)*MEMORY[0x263F0EDF8], a5);
    CFDictionarySetInt32(v9, (const __CFString *)*MEMORY[0x263F0EE48], 1111970369);
    CFDictionarySetInt32(v9, (const __CFString *)*MEMORY[0x263F0ED50], 4 * a4);
    CFDictionarySetInt32(v9, (const __CFString *)*MEMORY[0x263F0ED48], 4);
    objc_super v10 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    self->_spillmapBufferProperties = v10;
    if (v10)
    {
      CFDictionarySetInt32(v10, (const __CFString *)*MEMORY[0x263F04240], a4);
      CFDictionarySetInt32(self->_spillmapBufferProperties, (const __CFString *)*MEMORY[0x263F04118], a5);
      CFDictionarySetInt32(self->_spillmapBufferProperties, (const __CFString *)*MEMORY[0x263F04180], 1111970369);
      CFStringRef v11 = (const __CFString *)*MEMORY[0x263F0EF40];
      CFDictionarySetInt32(v9, (const __CFString *)*MEMORY[0x263F0EF40], 0);
      v12 = (const void *)*MEMORY[0x263F04130];
      CFDictionarySetValue(self->_spillmapBufferProperties, (const void *)*MEMORY[0x263F04130], v9);
      int v13 = (re *)CVPixelBufferPoolCreate(0, 0, self->_spillmapBufferProperties, &self->_spillBufferPoolUnprotected);
      if (v13)
      {
        int v14 = (int)v13;
        v15 = *re::videoLogObjects(v13);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v22 = 67109120;
          int v23 = v14;
          v16 = "[VideoLightSpillGenerator] [configureSession] Error creating unprotected spill map buffer pool: %d";
LABEL_21:
          _os_log_error_impl(&dword_233120000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v22, 8u);
        }
      }
      else
      {
        CFDictionarySetInt32(v9, v11, 1);
        CFDictionarySetValue(self->_spillmapBufferProperties, v12, v9);
        v19 = (re *)CVPixelBufferPoolCreate(0, 0, self->_spillmapBufferProperties, &self->_spillBufferPoolScreenScrapingProtected);
        if (v19)
        {
          int v14 = (int)v19;
          v15 = *re::videoLogObjects(v19);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v22 = 67109120;
            int v23 = v14;
            v16 = "[VideoLightSpillGenerator] [configureSession] Error creating screen scraping protected spill map buffer pool: %d";
            goto LABEL_21;
          }
        }
        else
        {
          CFDictionarySetInt32(v9, v11, 3);
          CFDictionarySetValue(self->_spillmapBufferProperties, v12, v9);
          v20 = (re *)CVPixelBufferPoolCreate(0, 0, self->_spillmapBufferProperties, &self->_spillBufferPoolHDCPType0);
          if (v20)
          {
            int v14 = (int)v20;
            v15 = *re::videoLogObjects(v20);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              int v22 = 67109120;
              int v23 = v14;
              v16 = "[VideoLightSpillGenerator] [configureSession] Error creating HDCPType0 spill map buffer pool: %d";
              goto LABEL_21;
            }
          }
          else
          {
            CFDictionarySetInt32(v9, v11, 7);
            CFDictionarySetValue(self->_spillmapBufferProperties, v12, v9);
            v21 = (re *)CVPixelBufferPoolCreate(0, 0, self->_spillmapBufferProperties, &self->_spillBufferPoolHDCPType1);
            int v14 = (int)v21;
            if (!v21)
            {
              CFRelease(v9);
              return v14;
            }
            v15 = *re::videoLogObjects(v21);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              int v22 = 67109120;
              int v23 = v14;
              v16 = "[VideoLightSpillGenerator] [configureSession] Error creating HDCPType1 spill map buffer pool: %d";
              goto LABEL_21;
            }
          }
        }
      }
    }
    else
    {
      return 7;
    }
  }
  else
  {
    v17 = *re::videoLogObjects((re *)self);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_error_impl(&dword_233120000, v17, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [configureSession] Source iosurface is unavailable", (uint8_t *)&v22, 2u);
    }
    return 11;
  }
  return v14;
}

- (int)configureIntermediateTextureProcessing:(int)a3 setHeight:(int)a4 setSigma:(float)a5
{
  BOOL v7 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:81 width:a3 height:a4 mipmapped:0];
  intermediateImageDescriptor = self->_intermediateImageDescriptor;
  self->_intermediateImageDescriptor = v7;

  [(MTLTextureDescriptor *)self->_intermediateImageDescriptor setStorageMode:2];
  [(MTLTextureDescriptor *)self->_intermediateImageDescriptor setUsage:3];
  if (!self->_intermediateImageDescriptor) {
    return 7;
  }
  id v9 = objc_alloc(MEMORY[0x263F13288]);
  *(float *)&double v10 = a5;
  CFStringRef v11 = (MPSImageGaussianBlur *)[v9 initWithDevice:self->_device sigma:v10];
  gaussianBlur = self->_gaussianBlur;
  self->_gaussianBlur = v11;

  int v13 = self->_gaussianBlur;
  if (v13)
  {
    [(MPSImageGaussianBlur *)v13 setEdgeMode:1];
    return 0;
  }
  else
  {
    v15 = *re::videoLogObjects(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_233120000, v15, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [configureIntermediateTextureProcessing] Unable to initialize gaussian filter", v16, 2u);
    }
    return 11;
  }
}

- (id)loadTexture:(__CVBuffer *)a3 withAttributes:(id)a4 forPlane:(unsigned int)a5 withCache:(__CVMetalTextureCache *)a6 withFormat:(unint64_t)a7
{
  CVMetalTextureRef image = 0;
  size_t v10 = a5;
  CFDictionaryRef v11 = (const __CFDictionary *)a4;
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, v10);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v10);
  LODWORD(a7) = CVMetalTextureCacheCreateTextureFromImage(0, a6, a3, v11, (MTLPixelFormat)a7, WidthOfPlane, HeightOfPlane, v10, &image);

  if (a7)
  {
    if (image) {
      CFRelease(image);
    }
  }
  else
  {
    if (image)
    {
      int v14 = CVMetalTextureGetTexture(image);
      CFRelease(image);
      goto LABEL_9;
    }
    v15 = *re::videoLogObjects(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_233120000, v15, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [VideoSpillMapMetalSession->loadTexture] Unable to create texture from pixel buffer.", buf, 2u);
    }
  }
  int v14 = 0;
LABEL_9:
  return v14;
}

- (int)calculateDrmSpillmapMetal:(__CVBuffer *)a3 emitSpillmap:(__CVBuffer *)a4 setLayout:(int)a5 withAllocator:(void *)a6
{
  CFDictionaryRef v11 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  CVPixelBufferGetIOSurface(a3);
  unint64_t ProtectionOptions = IOSurfaceGetProtectionOptions();
  int v13 = (re *)[v11 setProtectionOptions:ProtectionOptions];
  if (ProtectionOptions >= 8 || ((0x8Bu >> ProtectionOptions) & 1) == 0)
  {
    int v14 = *re::videoLogObjects(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_233120000, v14, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Unsupported frame protection option", buf, 2u);
    }
    int v15 = 10;
    goto LABEL_6;
  }
  PixelBuffer = (re *)CVPixelBufferPoolCreatePixelBuffer(0, *(CVPixelBufferPoolRef *)((char *)&self->super.isa+ *(void *)&asc_2344172A0[8 * ProtectionOptions]), a4);
  if (!(_WORD)PixelBuffer)
  {
    uint64_t v19 = [(VideoSpillMapMetalSession *)self loadTexture:*a4 withAttributes:self->_readWriteAttributes forPlane:0 withCache:self->_textureCacheSpillmap withFormat:81];
    v20 = (void *)v19;
    if (!v19)
    {
      v28 = *re::videoLogObjects(0);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_233120000, v28, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Unable to create spillmap texture from cache", buf, 2u);
      }
      int v15 = 11;
      goto LABEL_60;
    }
    v61 = (void *)v19;
    int v78 = 0;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    *(_OWORD *)buf = 0u;
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
    re::_IOSurfaceGetBulkAttachments((uint64_t)IOSurface, (uint64_t)buf);
    int v23 = v22;
    unsigned int v24 = BYTE12(v74);
    v25 = CVPixelBufferGetIOSurface(*a4);
    char v70 = 13;
    v26 = (re *)re::_IOSurfaceSetBulkAttachments2();
    if (v26)
    {
      int v15 = (int)v26;
      v27 = *re::videoLogObjects(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v65 = 0;
        _os_log_error_impl(&dword_233120000, v27, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Unable to set surface properties", v65, 2u);
      }
      v20 = v61;
      goto LABEL_60;
    }
    if (v23) {
      uint64_t v29 = 2;
    }
    else {
      uint64_t v29 = v24;
    }
    unint64_t v30 = +[VideoSpillMapMetalSession metalPixelFormatForPixelFormat:CVPixelBufferGetPixelFormatType(a3) withTransferFunction:v29];
    if (!v30)
    {
      v57 = *re::videoLogObjects(0);
      v20 = v61;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v65 = 0;
        _os_log_error_impl(&dword_233120000, v57, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Unsupported pixel format", v65, 2u);
      }
      int v15 = 10;
      goto LABEL_60;
    }
    v31 = [(VideoSpillMapMetalSession *)self loadTexture:a3 withAttributes:self->_readAttributes forPlane:0 withCache:self->_textureCacheBGRA withFormat:v30];
    if (!v31)
    {
      v58 = *re::videoLogObjects(0);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v65 = 0;
        _os_log_error_impl(&dword_233120000, v58, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Unable to create BGRA texture from cache", v65, 2u);
      }
      int v15 = 11;
      v20 = v61;
      goto LABEL_59;
    }
    if (!*((void *)a6 + 6))
    {
      v32 = self->_device;
      id v69 = v32;
      if (!*((void *)a6 + 6))
      {
        re::ObjCObject::operator=((id *)a6 + 6, &v69);
        v32 = (MTLDevice *)v69;
      }
    }
    __int16 v33 = v31;
    uint64_t v34 = [(MTLTextureDescriptor *)self->_intermediateImageDescriptor width];
    uint64_t v35 = [(MTLTextureDescriptor *)self->_intermediateImageDescriptor height];
    CGRect CleanRect = CVImageBufferGetCleanRect(a3);
    float v36 = (float)(unint64_t)v34 / CleanRect.size.width;
    float v37 = (float)(unint64_t)v35;
    float v38 = (float)(unint64_t)v35 / CleanRect.size.height;
    double v39 = v36;
    if (CleanRect.origin.x != 0.0) {
      CleanRect.origin.float x = 0.0 - CleanRect.origin.x * v36;
    }
    float x = CleanRect.origin.x;
    double v41 = v38;
    if (CleanRect.origin.y != 0.0) {
      CleanRect.origin.float y = 0.0 - CleanRect.origin.y * v38;
    }
    float y = CleanRect.origin.y;
    double v43 = (float)(v38 + v38);
    float v44 = x + x;
    double v45 = (float)(v36 + v36);
    if (a5 != 1)
    {
      double v45 = v39;
      float v44 = x;
    }
    if (a5 == 2) {
      double v45 = v39;
    }
    else {
      double v43 = v41;
    }
    if (a5 == 2) {
      float y = y + y;
    }
    else {
      float x = v44;
    }
    *(double *)v65 = v45;
    double v66 = v43;
    double v67 = x;
    double v68 = y;
    [(MPSImageBilinearScale *)self->_bilinearScale setScaleTransform:v65];
    memset(v64, 0, 24);
    bilinearScale = self->_bilinearScale;
    v64[3] = v34;
    v64[4] = v35;
    v64[5] = 1;
    [(MPSImageBilinearScale *)bilinearScale setClipRect:v64];
    re::VideoTextureAllocator::createTextureInternal((uint64_t)a6, v34, v35, 81, 2, 3u, 0, 0, (unint64_t *)v63, ProtectionOptions);
    id v47 = *(id *)v63;
    v48 = v47;
    if (v47) {

    }
    re::VideoTextureAllocator::createTextureInternal((uint64_t)a6, v34, v35, 81, 2, 3u, 0, 0, (unint64_t *)v63, ProtectionOptions);
    id v49 = *(id *)v63;
    v50 = v49;
    if (v49)
    {

      v31 = v33;
      if (v48)
      {
        [(MPSImageBilinearScale *)self->_bilinearScale encodeToCommandBuffer:v11 sourceTexture:v33 destinationTexture:v48];
        [(MPSImageGaussianBlur *)self->_gaussianBlur encodeToCommandBuffer:v11 sourceTexture:v48 destinationTexture:v50];
        int Width = IOSurfaceGetWidth(v25);
        int Height = IOSurfaceGetHeight(v25);
        uint64_t v53 = Width;
        float v54 = (float)Width;
        uint64_t v55 = Height;
        *(double *)v65 = (float)(v54 / (float)(unint64_t)v34);
        double v66 = (float)((float)Height / v37);
        double v67 = 0.0;
        double v68 = 0.0;
        [(MPSImageBilinearScale *)self->_bilinearScale setScaleTransform:v65];
        memset(v62, 0, 24);
        v56 = self->_bilinearScale;
        v62[3] = v53;
        v62[4] = v55;
        v62[5] = 1;
        [(MPSImageBilinearScale *)v56 setClipRect:v62];
        v20 = v61;
        [(MPSImageBilinearScale *)self->_bilinearScale encodeToCommandBuffer:v11 sourceTexture:v50 destinationTexture:v61];
        if (([v11 commitAndWaitUntilSubmitted] & 1) == 0) {
          [v11 waitUntilScheduled];
        }
        int v15 = 0;
        goto LABEL_58;
      }
    }
    else
    {
      v31 = v33;
      if (v48)
      {
        v59 = *re::videoLogObjects((re *)[(MPSImageBilinearScale *)self->_bilinearScale encodeToCommandBuffer:v11 sourceTexture:v33 destinationTexture:v48]);
        if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
LABEL_57:
          int v15 = 7;
          v20 = v61;
LABEL_58:

LABEL_59:
LABEL_60:

          goto LABEL_6;
        }
        *(_WORD *)v63 = 0;
        v60 = "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Failed to generate imgIntermediateBlurTexture";
LABEL_62:
        _os_log_error_impl(&dword_233120000, v59, OS_LOG_TYPE_ERROR, v60, v63, 2u);
        goto LABEL_57;
      }
    }
    v59 = *re::videoLogObjects((re *)v49);
    if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      goto LABEL_57;
    }
    *(_WORD *)v63 = 0;
    v60 = "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Failed to generate imgIntermediateTexture";
    goto LABEL_62;
  }
  v18 = *re::videoLogObjects(PixelBuffer);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_233120000, v18, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Unable to create spillmap pixel buffer from pool", buf, 2u);
  }
  int v15 = 11;
LABEL_6:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gaussianBlur, 0);
  objc_storeStrong((id *)&self->_intermediateImageDescriptor, 0);
  objc_storeStrong((id *)&self->_readWriteAttributes, 0);
  objc_storeStrong((id *)&self->_readAttributes, 0);
  objc_storeStrong((id *)&self->_bilinearScale, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end