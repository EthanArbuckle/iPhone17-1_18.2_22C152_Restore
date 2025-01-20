@interface CNRenderingSession
+ (NSArray)destinationPixelFormatTypes;
+ (NSArray)sourcePixelFormatTypes;
- (BOOL)_encodeRenderToCommandBuffer:(id)a3 frameAttributes:(id)a4 sourceImage:(__CVBuffer *)a5 sourceDisparity:(__CVBuffer *)a6 destinationTexture:(id)a7;
- (BOOL)encodeRenderToCommandBuffer:(id)commandBuffer frameAttributes:(CNRenderingSessionFrameAttributes *)frameAttributes sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity destinationImage:(CVPixelBufferRef)destinationImage;
- (BOOL)encodeRenderToCommandBuffer:(id)commandBuffer frameAttributes:(CNRenderingSessionFrameAttributes *)frameAttributes sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity destinationLuma:(id)destinationLuma destinationChroma:(id)destinationChroma;
- (BOOL)encodeRenderToCommandBuffer:(id)commandBuffer frameAttributes:(CNRenderingSessionFrameAttributes *)frameAttributes sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity destinationRGBA:(id)destinationRGBA;
- (CGAffineTransform)preferredTransform;
- (CNRenderingQuality)quality;
- (CNRenderingSession)initWithCommandQueue:(id)commandQueue sessionAttributes:(CNRenderingSessionAttributes *)sessionAttributes preferredTransform:(CGAffineTransform *)preferredTransform quality:(CNRenderingQuality)quality;
- (CNRenderingSessionAttributes)sessionAttributes;
- (id)commandQueue;
- (void)dealloc;
@end

@implementation CNRenderingSession

- (CNRenderingSession)initWithCommandQueue:(id)commandQueue sessionAttributes:(CNRenderingSessionAttributes *)sessionAttributes preferredTransform:(CGAffineTransform *)preferredTransform quality:(CNRenderingQuality)quality
{
  v25[1] = *MEMORY[0x263EF8340];
  id v11 = commandQueue;
  v12 = sessionAttributes;
  v23.receiver = self;
  v23.super_class = (Class)CNRenderingSession;
  v13 = [(CNRenderingSession *)&v23 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_commandQueue, commandQueue);
    objc_storeStrong((id *)&v14->_sessionAttributes, sessionAttributes);
    long long v15 = *(_OWORD *)&preferredTransform->a;
    long long v16 = *(_OWORD *)&preferredTransform->c;
    *(_OWORD *)&v14->_preferredTransform.tx = *(_OWORD *)&preferredTransform->tx;
    *(_OWORD *)&v14->_preferredTransform.c = v16;
    *(_OWORD *)&v14->_preferredTransform.a = v15;
    v14->_quality = quality;
    CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v24 = *MEMORY[0x263F04068];
    v25[0] = &unk_26F897430;
    CFDictionaryRef v18 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v19 = [v11 device];
    p_textureCache = &v14->_textureCache;
    LODWORD(v17) = CVMetalTextureCacheCreate(v17, v18, v19, 0, &v14->_textureCache);

    if (v17 || !*p_textureCache)
    {
      v21 = _CNLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[CNRenderingSession initWithCommandQueue:sessionAttributes:preferredTransform:quality:](v21);
      }

      *p_textureCache = 0;
    }
  }

  return v14;
}

- (void)dealloc
{
  textureCache = self->_textureCache;
  if (textureCache) {
    CFRelease(textureCache);
  }
  v4.receiver = self;
  v4.super_class = (Class)CNRenderingSession;
  [(CNRenderingSession *)&v4 dealloc];
}

- (BOOL)encodeRenderToCommandBuffer:(id)commandBuffer frameAttributes:(CNRenderingSessionFrameAttributes *)frameAttributes sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity destinationImage:(CVPixelBufferRef)destinationImage
{
  v12 = (void *)MEMORY[0x263F5F300];
  v13 = frameAttributes;
  id v14 = commandBuffer;
  long long v15 = [v14 device];
  long long v16 = [v12 createFromPixelbuffer:destinationImage device:v15 textureCache:self->_textureCache read:0 write:1];
  LOBYTE(sourceDisparity) = [(CNRenderingSession *)self _encodeRenderToCommandBuffer:v14 frameAttributes:v13 sourceImage:sourceImage sourceDisparity:sourceDisparity destinationTexture:v16];

  return (char)sourceDisparity;
}

- (BOOL)encodeRenderToCommandBuffer:(id)commandBuffer frameAttributes:(CNRenderingSessionFrameAttributes *)frameAttributes sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity destinationRGBA:(id)destinationRGBA
{
  v12 = (void *)MEMORY[0x263F5F300];
  v13 = frameAttributes;
  id v14 = commandBuffer;
  long long v15 = [v12 createRGBA:destinationRGBA];
  LOBYTE(sourceDisparity) = [(CNRenderingSession *)self _encodeRenderToCommandBuffer:v14 frameAttributes:v13 sourceImage:sourceImage sourceDisparity:sourceDisparity destinationTexture:v15];

  return (char)sourceDisparity;
}

- (BOOL)encodeRenderToCommandBuffer:(id)commandBuffer frameAttributes:(CNRenderingSessionFrameAttributes *)frameAttributes sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity destinationLuma:(id)destinationLuma destinationChroma:(id)destinationChroma
{
  id v14 = (void *)MEMORY[0x263F5F300];
  long long v15 = frameAttributes;
  id v16 = commandBuffer;
  CFAllocatorRef v17 = [v14 createYUV420:destinationLuma chroma:destinationChroma];
  LOBYTE(destinationLuma) = [(CNRenderingSession *)self _encodeRenderToCommandBuffer:v16 frameAttributes:v15 sourceImage:sourceImage sourceDisparity:sourceDisparity destinationTexture:v17];

  return (char)destinationLuma;
}

- (BOOL)_encodeRenderToCommandBuffer:(id)a3 frameAttributes:(id)a4 sourceImage:(__CVBuffer *)a5 sourceDisparity:(__CVBuffer *)a6 destinationTexture:(id)a7
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  commandQueue = self->_commandQueue;
  id v15 = a4;
  id v16 = [(MTLCommandQueue *)commandQueue device];
  CFAllocatorRef v17 = [v12 device];

  if (v16 != v17)
  {
    CFDictionaryRef v18 = _CNLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(MTLCommandQueue *)self->_commandQueue device];
      v20 = [v19 name];
      [v12 device];
      id v59 = v13;
      v21 = a5;
      objc_super v23 = v22 = a6;
      uint64_t v24 = [v23 name];
      *(_DWORD *)buf = 138412546;
      v62 = v20;
      __int16 v63 = 2112;
      v64 = v24;
      _os_log_impl(&dword_243267000, v18, OS_LOG_TYPE_DEFAULT, "warning: rendering session device (%@) and command buffer device (%@) are different!", buf, 0x16u);

      a6 = v22;
      a5 = v21;
      id v13 = v59;
    }
  }
  if (!self->_renderPipeline)
  {
    id v25 = objc_alloc(MEMORY[0x263F5F2E0]);
    v26 = [v12 device];
    v27 = [(CNRenderingSessionAttributes *)self->_sessionAttributes internalMetadata];
    uint64_t v28 = [v27 renderingVersion];
    double Width = (double)CVPixelBufferGetWidth(a5);
    double Height = (double)CVPixelBufferGetHeight(a5);
    double v31 = (double)(unint64_t)[v13 width];
    double v32 = (double)(unint64_t)[v13 height];
    double v33 = (double)CVPixelBufferGetWidth(a6);
    v34 = objc_msgSend(v25, "initWithDevice:version:colorInputSize:colorOutputSize:disparitySize:", v26, v28, Width, Height, v31, v32, v33, (double)CVPixelBufferGetHeight(a6));

    [v34 setDebugRendering:0];
    [v34 setVerbose:0];
    objc_msgSend(v34, "setUseRGBA:", objc_msgSend(v13, "isRGB"));
    long long v35 = *(_OWORD *)&self->_preferredTransform.c;
    v60[0] = *(_OWORD *)&self->_preferredTransform.a;
    v60[1] = v35;
    v60[2] = *(_OWORD *)&self->_preferredTransform.tx;
    [v34 setPreferredTransform:v60];
    v36 = (PTRenderPipeline *)[objc_alloc(MEMORY[0x263F5F2D8]) initWithDescriptor:v34];
    renderPipeline = self->_renderPipeline;
    self->_renderPipeline = v36;

    CNRenderingQuality v38 = [(CNRenderingSession *)self quality];
    if ((unint64_t)v38 > CNRenderingQualityExportHigh) {
      uint64_t v39 = 75;
    }
    else {
      uint64_t v39 = dword_24327AD90[v38];
    }
    v40 = [(PTRenderPipeline *)self->_renderPipeline createRenderStateWithQuality:v39];
    renderState = self->_renderState;
    self->_renderState = v40;

    v42 = [(CNRenderingSessionAttributes *)self->_sessionAttributes internalMetadata];
    [v42 applyToRenderState:self->_renderState];
  }
  v43 = objc_opt_new();
  v44 = [(CNRenderingSessionAttributes *)self->_sessionAttributes internalMetadata];
  [v44 applyToRenderRequest:v43];

  v45 = [v15 internalMetadata];
  [v45 applyToRenderRequest:v43];

  [v43 setRenderState:self->_renderState];
  [v15 fNumber];
  objc_msgSend(v43, "setFNumber:");
  [v15 focusDisparity];
  int v47 = v46;

  LODWORD(v48) = v47;
  [v43 setFocusDisparity:v48];
  v49 = (void *)MEMORY[0x263F5F300];
  v50 = [v12 device];
  v51 = [v49 createFromPixelbuffer:a5 device:v50 textureCache:self->_textureCache read:1 write:0];
  [v43 setSourceColor:v51];

  [v43 setDestinationColor:v13];
  v52 = (void *)MEMORY[0x263F5F2D0];
  v53 = [v12 device];
  v54 = [v52 createTextureFromPixelBuffer:a6 device:v53 textureCache:self->_textureCache sRGB:0];
  [v43 setSourceDisparity:v54];

  v55 = [v43 sourceColor];
  [v55 copyMetadataTo:v13];

  int v56 = [(PTRenderPipeline *)self->_renderPipeline encodeRenderTo:v12 withRenderRequest:v43];
  if (v56)
  {
    v57 = _CNLogSystem();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      -[CNRenderingSession _encodeRenderToCommandBuffer:frameAttributes:sourceImage:sourceDisparity:destinationTexture:]((uint64_t)v12, v57);
    }
  }
  return v56 == 0;
}

+ (NSArray)sourcePixelFormatTypes
{
  if (sourcePixelFormatTypes_onceToken != -1) {
    dispatch_once(&sourcePixelFormatTypes_onceToken, &__block_literal_global);
  }
  v2 = (void *)sourcePixelFormatTypes_sSourcePixelFormatTypes;

  return (NSArray *)v2;
}

void __44__CNRenderingSession_sourcePixelFormatTypes__block_invoke()
{
  v0 = (void *)sourcePixelFormatTypes_sSourcePixelFormatTypes;
  sourcePixelFormatTypes_sSourcePixelFormatTypes = (uint64_t)&unk_26F8974E8;
}

+ (NSArray)destinationPixelFormatTypes
{
  if (destinationPixelFormatTypes_onceToken != -1) {
    dispatch_once(&destinationPixelFormatTypes_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)destinationPixelFormatTypes_sDestinationPixelFormatTypes;

  return (NSArray *)v2;
}

void __49__CNRenderingSession_destinationPixelFormatTypes__block_invoke()
{
  v0 = (void *)destinationPixelFormatTypes_sDestinationPixelFormatTypes;
  destinationPixelFormatTypes_sDestinationPixelFormatTypes = (uint64_t)&unk_26F897500;
}

- (id)commandQueue
{
  return objc_getProperty(self, a2, 40, 1);
}

- (CNRenderingSessionAttributes)sessionAttributes
{
  return (CNRenderingSessionAttributes *)objc_getProperty(self, a2, 8, 1);
}

- (CGAffineTransform)preferredTransform
{
  objc_copyStruct(retstr, &self->_preferredTransform, 48, 1, 0);
  return result;
}

- (CNRenderingQuality)quality
{
  return self->_quality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_renderState, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);

  objc_storeStrong((id *)&self->_sessionAttributes, 0);
}

- (void)initWithCommandQueue:(os_log_t)log sessionAttributes:preferredTransform:quality:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_243267000, log, OS_LOG_TYPE_ERROR, "Error allocating texture cache", v1, 2u);
}

- (void)_encodeRenderToCommandBuffer:(uint64_t)a1 frameAttributes:(NSObject *)a2 sourceImage:sourceDisparity:destinationTexture:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_243267000, a2, OS_LOG_TYPE_ERROR, "error: encodeRenderToCommandBuffer failed (%@)", (uint8_t *)&v2, 0xCu);
}

@end