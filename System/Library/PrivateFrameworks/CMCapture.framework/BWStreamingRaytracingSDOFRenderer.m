@interface BWStreamingRaytracingSDOFRenderer
+ (void)initialize;
- (BOOL)adjustsMetadata;
- (BOOL)supportsAnimation;
- (BWStreamingRaytracingSDOFRenderer)initWithCaptureDevice:(id)a3 commandQueue:(id)a4 smartStyleRenderingEnabled:(BOOL)a5;
- (CMTime)_getSampleBufferPresentationTimeStamp:(uint64_t)a3@<X8>;
- (NSString)displayName;
- (id)newTextureFromCacheUsingPixelBuffer:(void *)a3 textureDescriptor:(size_t)a4 plane:;
- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5;
- (signed)type;
- (uint64_t)_loadAndConfigureSmartStyleBundle;
- (uint64_t)_runSmartStyleIntegrate:(uint64_t)a1;
- (uint64_t)createTextureDescriptorsWithColorVideoFormat:(void *)a3 depthVideoFormat:;
- (void)dealloc;
- (void)getPTTexture:(uint64_t)a1;
- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8;
@end

@implementation BWStreamingRaytracingSDOFRenderer

+ (void)initialize
{
}

- (BWStreamingRaytracingSDOFRenderer)initWithCaptureDevice:(id)a3 commandQueue:(id)a4 smartStyleRenderingEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)BWStreamingRaytracingSDOFRenderer;
  v8 = [(BWStreamingRaytracingSDOFRenderer *)&v12 init];
  if (v8)
  {
    v9 = [[BWVideoDepthInferenceConfiguration alloc] initWithConcurrencyWidth:1 videoDepthLayout:0 captureDevice:a3 backpressureEvent:0];
    [(BWVideoDepthInferenceConfiguration *)v9 networkBias];
    v8->_networkBias = v10;
    v8->_captureDevice = (BWFigVideoCaptureDevice *)a3;
    v8->_commandQueue = (MTLCommandQueue *)a4;
    v8->_portTypeProvidingTuningParameters = [(BWVideoDepthInferenceConfiguration *)v9 portType];
    v8->_smartStyleRenderingEnabled = v5;
    if (v5) {
      -[BWStreamingRaytracingSDOFRenderer _loadAndConfigureSmartStyleBundle]((uint64_t)v8);
    }
  }
  return v8;
}

- (uint64_t)_loadAndConfigureSmartStyleBundle
{
  if (!a1) {
    return 0;
  }
  v2 = BWLoadProcessorBundle(@"SmartStyle", 1);
  if (!v2) {
    goto LABEL_10;
  }
  uint64_t v3 = [v2 classNamed:objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleProcessorInputOutputV%d", 1)];
  *(void *)(a1 + 152) = v3;
  if (!v3) {
    goto LABEL_10;
  }
  v4 = (objc_class *)[v2 classNamed:objc_msgSend(NSString, "stringWithFormat:", @"CMISmartStyleProcessorV%d", 1)];
  *(void *)(a1 + 160) = v4;
  if (!v4
    || (BOOL v5 = (void *)[[v4 alloc] initWithOptionalMetalCommandQueue:*(void *)(a1 + 128)],
        (*(void *)(a1 + 144) = v5) == 0)
    || ([v5 setInstanceLabel:@"StreamingSDOF"],
        uint64_t v6 = [*(id *)(a1 + 160) getSmartStyleCoefficientsFilterType:@"iir"],
        *(void *)(a1 + 168) = v6,
        objc_msgSend(*(id *)(a1 + 144), "setConfiguration:", objc_msgSend(*(id *)(a1 + 160), "getDefaultProcessorConfigurationForStreamingWithFilterType:", v6)), !objc_msgSend(*(id *)(a1 + 144), "configuration")))
  {
LABEL_10:
    uint64_t v8 = 4294954510;
LABEL_14:

    *(void *)(a1 + 144) = 0;
    return v8;
  }
  *(_DWORD *)(a1 + 184) = [*(id *)(a1 + 160) getRequiredFilteredCoefficientsPixelBufferPoolSizeForFilterType:*(void *)(a1 + 168)];
  uint64_t v7 = [*(id *)(a1 + 144) setup];
  if (v7)
  {
    uint64_t v8 = v7;
    fig_log_get_emitter();
LABEL_13:
    FigDebugAssert3();
    goto LABEL_14;
  }
  uint64_t v8 = [*(id *)(a1 + 144) prepareToProcess:2];
  if (v8)
  {
    fig_log_get_emitter();
    goto LABEL_13;
  }
  return v8;
}

- (void)dealloc
{
  textureCache = self->_textureCache;
  if (textureCache) {
    CFRelease(textureCache);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWStreamingRaytracingSDOFRenderer;
  [(BWStreamingRaytracingSDOFRenderer *)&v4 dealloc];
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if (self->_metalContext)
  {
    v17 = 0;
    goto LABEL_25;
  }
  uint64_t v8 = (FigMetalContext *)objc_msgSend(objc_alloc(MEMORY[0x1E4F55F60]), "initWithbundle:andOptionalCommandQueue:", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), self->_commandQueue);
  self->_metalContext = v8;
  [(FigMetalContext *)v8 setQueuePriority:2];
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v26 = *MEMORY[0x1E4F24C78];
  v27[0] = &unk_1EFAFF978;
  if (CVMetalTextureCacheCreate(v9, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1], (id)-[FigMetalContext device](self->_metalContext, "device"), 0, &self->_textureCache)|| !self->_textureCache)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v17 = 0;
    int v24 = -12786;
    goto LABEL_26;
  }
  float v10 = (PTRenderRequest *)[objc_alloc((Class)getPTRenderRequestClass()) init];
  self->_ptRenderRequest = v10;
  if (!v10 || (v11 = (void *)[a5 objectForKeyedSubscript:@"Depth"]) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v17 = 0;
LABEL_30:
    int v24 = -12780;
    goto LABEL_26;
  }
  objc_super v12 = (void *)[v11 resolvedVideoFormat];
  int v13 = -[BWStreamingRaytracingSDOFRenderer createTextureDescriptorsWithColorVideoFormat:depthVideoFormat:]((uint64_t)self, a4, v12);
  if (v13)
  {
    int v24 = v13;
    fig_log_get_emitter();
    FigDebugAssert3();
    v17 = 0;
    goto LABEL_26;
  }
  self->_disparityTextureWhileWaitingForCamera = (MTLTexture *)objc_msgSend((id)-[FigMetalContext device](self->_metalContext, "device"), "newTextureWithDescriptor:", self->_texDescDisparity);
  v14 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWFigVideoCaptureDevice sensorIDDictionaryByPortType](self->_captureDevice, "sensorIDDictionaryByPortType"), "objectForKeyedSubscript:", self->_portTypeProvidingTuningParameters), "valueForKeyPath:", @"CinematicVideoParameters.RenderVersion");
  if (v14) {
    uint64_t v15 = (int)[v14 intValue];
  }
  else {
    uint64_t v15 = [(id)getPTRenderPipelineClass() latestVersion];
  }
  v16 = objc_msgSend(objc_alloc((Class)getPTRenderPipelineDescriptorClass()), "initWithDevice:version:colorSize:disparitySize:", -[FigMetalContext device](self->_metalContext, "device"), v15, (double)(unint64_t)objc_msgSend(a4, "width"), (double)(unint64_t)objc_msgSend(a4, "height"), (double)(unint64_t)objc_msgSend(v12, "width"), (double)(unint64_t)objc_msgSend(v12, "height"));
  v17 = v16;
  if (!v16
    || ([v16 setDebugRendering:0],
        v18 = (PTRenderPipeline *)[objc_alloc((Class)getPTRenderPipelineClass()) initWithDescriptor:v17], (self->_ptRenderPipeline = v18) == 0)|| (v19 = (PTRenderState *)(id)-[PTRenderPipeline createRenderStateWithQuality:](v18, "createRenderStateWithQuality:", 0), (self->_ptRenderState = v19) == 0))
  {
LABEL_29:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_30;
  }
  self->_isFullRange = FigCapturePixelFormatIsFullRange([a4 pixelFormat]);
  int IsTenBit = FigCapturePixelFormatIsTenBit([a4 pixelFormat]);
  self->_isTenBit = IsTenBit;
  int64_t v21 = 8;
  if (IsTenBit) {
    int64_t v21 = 10;
  }
  self->_YCbCrColorDepth = v21;
  self->_alignment = ($470D365275581EF16070F5A11344F73E)0x200000002;
  if (FigCapturePixelFormatGetCompressionType([a4 pixelFormat])) {
    self->_alignment = ($470D365275581EF16070F5A11344F73E)FigCapturePixelFormatTileAlignment([a4 pixelFormat]);
  }
  if (!self->_smartStyleRenderingEnabled || !self->_smartStyleCoefficientsFilterType)
  {
LABEL_25:
    int v24 = 0;
    goto LABEL_26;
  }
  v22 = (void *)[a5 objectForKeyedSubscript:0x1EFA74840];
  if (!v22) {
    goto LABEL_29;
  }
  v23 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", [v22 resolvedVideoFormat], self->_smartStyleFilteredCoefficientsPixelBufferPoolSize, @"Cinematic preview", +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"));
  self->_smartStyleCoefficientsPixelBufferPool = v23;
  if (v23) {
    int v24 = 0;
  }
  else {
    int v24 = -12786;
  }
LABEL_26:

  return v24;
}

- (uint64_t)createTextureDescriptorsWithColorVideoFormat:(void *)a3 depthVideoFormat:
{
  if (!result) {
    return result;
  }
  BOOL v5 = (id *)result;
  int v6 = [a2 pixelFormat];
  result = 4294954516;
  uint64_t v8 = 589;
  uint64_t v9 = 588;
  if (v6 <= 796423729)
  {
    *(void *)&long long v7 = 0x200000002;
    if (v6 > 762865199)
    {
      long long v29 = v7;
      if (v6 > 792225327)
      {
        if (v6 > 796419631)
        {
          if (v6 != 796419632)
          {
            if (v6 != 796419634)
            {
              int v10 = 796423728;
              goto LABEL_44;
            }
LABEL_50:
            uint64_t v8 = 589;
            uint64_t v9 = 588;
            int v16 = objc_msgSend(a3, "pixelFormat", 0x100000002, *((void *)&v7 + 1));
            goto LABEL_64;
          }
          goto LABEL_63;
        }
        if (v6 != 792225328)
        {
          int v12 = 792229424;
          goto LABEL_55;
        }
LABEL_56:
        uint64_t v8 = 30;
        uint64_t v9 = 10;
        goto LABEL_63;
      }
      if (v6 > 762869295)
      {
        if (v6 == 762869296) {
          goto LABEL_63;
        }
        unsigned __int16 v13 = 30258;
      }
      else
      {
        if (v6 == 762865200) {
          goto LABEL_63;
        }
        unsigned __int16 v13 = 26162;
      }
      int v11 = v13 | 0x2D780000;
LABEL_49:
      if (v6 != v11) {
        return result;
      }
      goto LABEL_50;
    }
    long long v29 = v7;
    if (v6 <= 645428783)
    {
      if (v6 <= 645424687)
      {
        if (v6 != 641230384)
        {
          int v12 = 641234480;
          goto LABEL_55;
        }
        goto LABEL_56;
      }
      if (v6 == 645424688) {
        goto LABEL_63;
      }
      unsigned __int16 v15 = 26162;
      goto LABEL_41;
    }
    if (v6 <= 758670895)
    {
      if (v6 == 645428784) {
        goto LABEL_63;
      }
      unsigned __int16 v15 = 30258;
LABEL_41:
      int v11 = v15 | 0x26780000;
      goto LABEL_49;
    }
    if (v6 == 758670896) {
      goto LABEL_56;
    }
    int v12 = 758674992;
LABEL_55:
    if (v6 != v12) {
      return result;
    }
    goto LABEL_56;
  }
  if (v6 <= 2016686641)
  {
    *(void *)&long long v7 = 0x200000002;
    long long v29 = v7;
    if (v6 <= 1882468913)
    {
      if (v6 <= 875704437)
      {
        if (v6 == 796423730) {
          goto LABEL_50;
        }
        int v12 = 875704422;
        goto LABEL_55;
      }
      if (v6 == 875704438) {
        goto LABEL_56;
      }
      int v10 = 1882468912;
LABEL_44:
      if (v6 != v10) {
        return result;
      }
      goto LABEL_63;
    }
    if (v6 <= 1885745713)
    {
      if (v6 == 1882468914) {
        goto LABEL_50;
      }
      int v10 = 1885745712;
      goto LABEL_44;
    }
    if (v6 == 1885745714) {
      goto LABEL_50;
    }
    int v14 = 2016686640;
    goto LABEL_59;
  }
  *(void *)&long long v7 = 0x200000002;
  if (v6 <= 2084075055)
  {
    long long v29 = v7;
    if (v6 > 2019963441)
    {
      if (v6 != 2019963442)
      {
        int v12 = 2084070960;
        goto LABEL_55;
      }
    }
    else if (v6 != 2016686642)
    {
      int v14 = 2019963440;
LABEL_59:
      if (v6 != v14) {
        return result;
      }
      goto LABEL_62;
    }
    *(void *)&long long v7 = 0x100000002;
    long long v29 = v7;
LABEL_62:
    uint64_t v8 = 578;
    uint64_t v9 = 576;
    goto LABEL_63;
  }
  long long v29 = v7;
  if (v6 <= 2088265265)
  {
    if (v6 == 2084075056) {
      goto LABEL_56;
    }
    int v10 = 2088265264;
    goto LABEL_44;
  }
  if (v6 == 2088269362) {
    goto LABEL_50;
  }
  if (v6 != 2088269360)
  {
    int v11 = 2088265266;
    goto LABEL_49;
  }
LABEL_63:
  int v16 = objc_msgSend(a3, "pixelFormat", v29);
LABEL_64:
  int v17 = v16;
  result = 4294954516;
  if (v17 <= 1278226487)
  {
    if (v17 == 641230384 || v17 == 875704422 || v17 == 875704438)
    {
      uint64_t v18 = 500;
LABEL_77:

      uint64_t v19 = [a2 width];
      uint64_t v20 = [a2 height];
      int64_t v21 = (void *)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:v9 width:v19 height:v20 mipmapped:0];
      [v21 setUsage:3];
      v5[5] = v21;
      unint64_t v22 = [a2 width] / (unint64_t)v30;
      unint64_t v23 = [a2 height];
      int v24 = (void *)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:v8 width:v22 height:v23 / v31 mipmapped:0];
      [v24 setUsage:3];
      v5[6] = v24;
      uint64_t v25 = [a3 width];
      uint64_t v26 = [a3 height];
      v27 = (void *)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:v18 width:v25 height:v26 mipmapped:0];
      [v27 setUsage:3];
      id v28 = v27;
      result = 0;
      v5[7] = v28;
    }
  }
  else
  {
    if (v17 <= 1278226535)
    {
      if (v17 == 1278226488)
      {
        uint64_t v18 = 10;
      }
      else
      {
        if (v17 != 1278226534) {
          return result;
        }
        uint64_t v18 = 55;
      }
      goto LABEL_77;
    }
    if (v17 == 1751411059 || v17 == 1278226536)
    {
      uint64_t v18 = 25;
      goto LABEL_77;
    }
  }
  return result;
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  unsigned __int16 v13 = (void *)CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v63 = *MEMORY[0x1E4F1DB20];
  long long v64 = v14;
  FigCFDictionaryGetCGRectIfPresent();
  unsigned __int16 v15 = (void *)MEMORY[0x1E4F54210];
  if (!self->_renderStateIsConfigured)
  {
    [(PTRenderState *)self->_ptRenderState setSourceColorBitDepth:LODWORD(self->_YCbCrColorDepth)];
    int v16 = a5;
    PTTuningParametersClass = (void *)getPTTuningParametersClass();
    -[PTRenderState setHwModelID:](self->_ptRenderState, "setHwModelID:", [PTTuningParametersClass hwModelIDFromFigModelSpecificName:FigCaptureGetModelSpecificName()]);
    uint64_t v18 = getPTTuningParametersClass();
    uint64_t v19 = [(PTRenderState *)self->_ptRenderState hwModelID];
    uint64_t v20 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *v15), "intValue");
    int64_t v21 = (void *)v18;
    a5 = v16;
    [v21 noiseScaleFactorForHwModelID:v19 sensorID:v20];
    -[PTRenderState setNoiseScaleFactor:](self->_ptRenderState, "setNoiseScaleFactor:");
    self->_renderStateIsConfigured = 1;
  }
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, @"Depth");
  CFTypeRef v23 = CMGetAttachment(a5, @"CinematicVideoCinematographyMetadata", 0);
  int v24 = (void *)v23;
  if (v23 && AttachedMedia)
  {
LABEL_10:
    ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
    disparityTextureWhileWaitingForCamera = -[BWStreamingRaytracingSDOFRenderer newTextureFromCacheUsingPixelBuffer:textureDescriptor:plane:]((uint64_t)self, ImageBuffer, self->_texDescDisparity, 0);

    self->_disparityTextureWhileWaitingForCamera = 0;
    goto LABEL_11;
  }
  disparityTextureWhileWaitingForCamera = self->_disparityTextureWhileWaitingForCamera;
  if (!disparityTextureWhileWaitingForCamera)
  {
    if (!AttachedMedia || !v23)
    {
      fig_log_get_emitter();
      goto LABEL_31;
    }
    goto LABEL_10;
  }
LABEL_11:
  v27 = -[BWStreamingRaytracingSDOFRenderer getPTTexture:]((uint64_t)self, a4);
  id v28 = -[BWStreamingRaytracingSDOFRenderer getPTTexture:]((uint64_t)self, a7);
  double v60 = 0.0;
  double v61 = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  float64x2_t v57 = _Q0;
  float64x2_t v62 = _Q0;
  FigCFDictionaryGetCGRectIfPresent();
  [(PTRenderRequest *)self->_ptRenderRequest setSourceColor:v27];
  [(PTRenderRequest *)self->_ptRenderRequest setSourceDisparity:disparityTextureWhileWaitingForCamera];
  [(PTRenderRequest *)self->_ptRenderRequest setDestinationColor:v28];
  [(PTRenderRequest *)self->_ptRenderRequest setRenderState:self->_ptRenderState];
  [(PTRenderRequest *)self->_ptRenderRequest setTotalSensorCropRectSize:v64];
  *(float *)&double v34 = (float)(int)objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F53E98]), "intValue");
  [(PTRenderRequest *)self->_ptRenderRequest setFocalLenIn35mmFilm:v34];
  -[PTRenderRequest setSensorID:](self->_ptRenderRequest, "setSensorID:", objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *v15), "intValue"));
  -[PTRenderRequest setConversionGain:](self->_ptRenderRequest, "setConversionGain:", objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D88]), "intValue"));
  -[PTRenderRequest setReadNoise_1x:](self->_ptRenderRequest, "setReadNoise_1x:", objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F54170]), "intValue"));
  -[PTRenderRequest setReadNoise_8x:](self->_ptRenderRequest, "setReadNoise_8x:", objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F54178]), "intValue"));
  -[PTRenderRequest setAGC:](self->_ptRenderRequest, "setAGC:", objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F53C08]), "intValue"));
  [(PTRenderRequest *)self->_ptRenderRequest setFrameId:arc4random()];
  double v35 = 0.0;
  if (!self->_disparityTextureWhileWaitingForCamera) {
    objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", 0x1EFA732A0, 0.0), "floatValue");
  }
  [(PTRenderRequest *)self->_ptRenderRequest setAlphaLowLight:v35];
  LODWORD(v36) = 0.5;
  if (!self->_disparityTextureWhileWaitingForCamera) {
    objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", 0x1EFA732C0, v36), "floatValue");
  }
  [(PTRenderRequest *)self->_ptRenderRequest setFocusDisparity:v36];
  LODWORD(v37) = 4.5;
  if (!self->_disparityTextureWhileWaitingForCamera) {
    objc_msgSend((id)objc_msgSend(v24, "objectForKeyedSubscript:", 0x1EFA73280, v37), "floatValue");
  }
  [(PTRenderRequest *)self->_ptRenderRequest setFNumber:v37];
  *(float *)&double v38 = self->_networkBias;
  [(PTRenderRequest *)self->_ptRenderRequest setNetworkBias:v38];
  __asm { FMOV            V0.2S, #1.0 }
  [(PTRenderRequest *)self->_ptRenderRequest setVisCropFactor:_D0];
  [(PTRenderRequest *)self->_ptRenderRequest setVisCropFactorPreview:COERCE_DOUBLE(vcvt_f32_f64(vdivq_f64(v57, v62)))];
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  $470D365275581EF16070F5A11344F73E alignment = self->_alignment;
  float v43 = v60 * (double)Width;
  uint64_t v44 = (int)FigCaptureFloorFloatToMultipleOf(alignment.width, v43);
  double v45 = (double)Height;
  float v46 = v61 * (double)Height;
  int v47 = FigCaptureFloorFloatToMultipleOf(alignment.height, v46);
  float v48 = v62.f64[0] * (double)Width;
  int v49 = FigCaptureCeilFloatToMultipleOf(alignment.width, v48);
  float v50 = v62.f64[1] * v45;
  int v51 = FigCaptureCeilFloatToMultipleOf(alignment.height, v50);
  uint64_t v52 = alignment.width;
  if ((v60 + v62.f64[0]) * (double)Width <= (double)(unint64_t)(v49 + v44)) {
    uint64_t v52 = 0;
  }
  uint64_t v53 = v52 + v49;
  if ((v61 + v62.f64[1]) * v45 <= (double)(unint64_t)(v51 + (uint64_t)v47)) {
    uint64_t v54 = 0;
  }
  else {
    uint64_t v54 = *(uint64_t *)&alignment >> 32;
  }
  ptRenderRequest = self->_ptRenderRequest;
  v59[0] = v44;
  v59[1] = v47;
  v59[2] = v53;
  v59[3] = v54 + v51;
  [(PTRenderRequest *)ptRenderRequest setScissorRect:v59];
  if (self->_smartStyleRenderingEnabled && (BWSmartStyleRenderingShouldBeBypassed(a5) & 1) == 0) {
    -[PTRenderRequest setIntegratedStyleCoefficientsTextureArray:](self->_ptRenderRequest, "setIntegratedStyleCoefficientsTextureArray:", -[BWStreamingRaytracingSDOFRenderer _runSmartStyleIntegrate:]((uint64_t)self, a5));
  }
  if (!self->_disparityTextureWhileWaitingForCamera) {

  }
  v56 = objc_msgSend((id)-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"), "commandBuffer");
  if (![(PTRenderPipeline *)self->_ptRenderPipeline encodeRenderTo:v56 withRenderRequest:self->_ptRenderRequest])
  {
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __153__BWStreamingRaytracingSDOFRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke;
    v58[3] = &unk_1E5C27EB8;
    v58[4] = a8;
    [v56 addCompletedHandler:v58];
    [v56 commit];
    return;
  }
  fig_log_get_emitter();
LABEL_31:
  FigDebugAssert3();
  (*((void (**)(id, void, void))a8 + 2))(a8, 0, 0);
}

- (id)newTextureFromCacheUsingPixelBuffer:(void *)a3 textureDescriptor:(size_t)a4 plane:
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  CVMetalTextureRef image = 0;
  objc_super v4 = *(__CVMetalTextureCache **)(a1 + 32);
  if (!v4)
  {
    fig_log_get_emitter();
LABEL_12:
    FigDebugAssert3();
    id v10 = 0;
    goto LABEL_7;
  }
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v14[0] = *MEMORY[0x1E4F24C88];
  v15[0] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "usage"));
  v14[1] = *MEMORY[0x1E4F24C80];
  v15[1] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "storageMode"));
  if (CVMetalTextureCacheCreateTextureFromImage(v8, v4, a2, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2], (MTLPixelFormat)objc_msgSend(a3, "pixelFormat"), objc_msgSend(a3, "width"), objc_msgSend(a3, "height"), a4, &image)|| !image)
  {
    fig_log_get_emitter();
    goto LABEL_12;
  }
  id Texture = CVMetalTextureGetTexture(image);
  id v10 = Texture;
  if (Texture)
  {
    id v11 = Texture;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_7:
  if (image) {
    CFRelease(image);
  }
  return v10;
}

- (void)getPTTexture:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = -[BWStreamingRaytracingSDOFRenderer newTextureFromCacheUsingPixelBuffer:textureDescriptor:plane:](a1, a2, *(void **)(a1 + 40), 0);
  id v5 = -[BWStreamingRaytracingSDOFRenderer newTextureFromCacheUsingPixelBuffer:textureDescriptor:plane:](a1, a2, *(void **)(a1 + 48), 1uLL);
  int v6 = (void *)[(id)getPTTextureClass() createYUV420:v4 chroma:v5];
  objc_msgSend(v6, "setColorPrimaries:", CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F24A90], 0));
  objc_msgSend(v6, "setTransferFunction:", CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F24BC8], 0));
  objc_msgSend(v6, "setYCbCrMatrix:", CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F24C18], 0));
  [v6 setYCbCrFullRange:*(unsigned __int8 *)(a1 + 72)];
  [v6 setYCbCrColorDepth:*(void *)(a1 + 88)];

  return v6;
}

- (uint64_t)_runSmartStyleIntegrate:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (!sbuf) {
    goto LABEL_20;
  }
  if (!CMSampleBufferGetImageBuffer(sbuf)) {
    goto LABEL_20;
  }
  CFTypeRef v4 = CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v4) {
    goto LABEL_20;
  }
  CFTypeRef v5 = v4;
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(sbuf, 0x1EFA748A0);
  if (!AttachedMedia) {
    goto LABEL_25;
  }
  uint64_t v7 = BWSampleBufferGetAttachedMedia(sbuf, 0x1EFA74840);
  if (!v7)
  {
LABEL_21:
    uint64_t v19 = 0;
    AttachedMedia = 0;
    goto LABEL_18;
  }
  CFAllocatorRef v8 = (opaqueCMSampleBuffer *)v7;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!ImageBuffer || (CVImageBufferRef v10 = ImageBuffer, (v11 = CMSampleBufferGetImageBuffer(v8)) == 0))
  {
LABEL_20:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_21;
  }
  CVImageBufferRef v12 = v11;
  unsigned __int16 v13 = (opaqueCMSampleBuffer *)objc_opt_new();
  AttachedMedia = v13;
  if (!v13)
  {
    fig_log_get_emitter();
LABEL_24:
    FigDebugAssert3();
    goto LABEL_25;
  }
  [(opaqueCMSampleBuffer *)v13 setInputUnstyledThumbnailPixelBuffer:v10];
  [(opaqueCMSampleBuffer *)AttachedMedia setInputMetadataDict:v5];
  if (!*(void *)(a1 + 168))
  {
    [(opaqueCMSampleBuffer *)AttachedMedia setInputStyleCoefficientsPixelBuffer:v12];
    goto LABEL_16;
  }
  long long v23 = 0uLL;
  uint64_t v24 = 0;
  [(BWStreamingRaytracingSDOFRenderer *)sbuf _getSampleBufferPresentationTimeStamp:(uint64_t)&v23];
  if ((BYTE12(v23) & 1) == 0)
  {
LABEL_25:
    uint64_t v19 = 0;
    goto LABEL_18;
  }
  long long v14 = (void *)[*(id *)(a1 + 144) utilities];
  long long v21 = v23;
  uint64_t v22 = v24;
  if ([v14 enqueueCoefficientsForFiltering:v12 withMetadata:v5 pts:&v21]) {
    goto LABEL_23;
  }
  uint64_t v15 = [*(id *)(a1 + 176) newPixelBuffer];
  if (!v15) {
    goto LABEL_23;
  }
  int v16 = (const void *)v15;
  int v17 = (void *)[*(id *)(a1 + 144) utilities];
  uint64_t v18 = *(void *)(a1 + 168);
  long long v21 = v23;
  uint64_t v22 = v24;
  [v17 filterCoefficientsForFrameWithMetadata:v5 pts:&v21 filterType:v18 toPixelBuffer:v16];
  [(opaqueCMSampleBuffer *)AttachedMedia setInputStyleCoefficientsPixelBuffer:v16];
  CFRelease(v16);
LABEL_16:
  [*(id *)(a1 + 144) setInputOutput:AttachedMedia];
  if ([*(id *)(a1 + 144) process])
  {
LABEL_23:
    fig_log_get_emitter();
    goto LABEL_24;
  }
  uint64_t v19 = [*(id *)(a1 + 144) outputIntegratedStyleCoefficientsTexture];
LABEL_18:

  return v19;
}

uint64_t __153__BWStreamingRaytracingSDOFRenderer_renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 error]) {
    objc_msgSend((id)objc_msgSend(a2, "error"), "description");
  }
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  CFTypeRef v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (signed)type
{
  return 0;
}

- (BOOL)supportsAnimation
{
  return 0;
}

- (BOOL)adjustsMetadata
{
  return 0;
}

- (NSString)displayName
{
  return (NSString *)@"Raytracing SDOF Renderer";
}

- (CMTime)_getSampleBufferPresentationTimeStamp:(uint64_t)a3@<X8>
{
  if (result)
  {
    uint64_t v5 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)a3 = *MEMORY[0x1E4F1F9F8];
    *(void *)(a3 + 16) = *(void *)(v5 + 16);
    if (target)
    {
      int v6 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      if (v6
        && (uint64_t v7 = v6, v8 = *MEMORY[0x1E4F530C0], [v6 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]]))
      {
        result = CMTimeMakeFromDictionary(&v9, (CFDictionaryRef)[v7 objectForKeyedSubscript:v8]);
      }
      else
      {
        result = CMSampleBufferGetPresentationTimeStamp(&v9, (CMSampleBufferRef)target);
      }
      *(CMTime *)a3 = v9;
    }
    else
    {
      fig_log_get_emitter();
      return (CMTime *)FigDebugAssert3();
    }
  }
  else
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
  }
  return result;
}

@end