@interface JFXGuidedUpscaler
- (BOOL)initialized;
- (BOOL)scaleImage:(__CVBuffer *)a3 guidanceImage:(__CVBuffer *)a4 destinationImage:(__CVBuffer *)a5;
- (BOOL)showSimilarity;
- (JFXGuidedUpscaler)initWithDiameter:(int)a3;
- (MTLComputePipelineState)pipelineStateSimilarity;
- (MTLComputePipelineState)pipelineStateSmoothing;
- (MTLTexture)currentOutputTexture;
- (MTLTexture)oldScaledGuidance;
- (MTLTexture)previousOutputTexture;
- (MTLTexture)scaledGuidance;
- (MTLTexture)similarity;
- (float)similarityGaussianBlur;
- (float)temporalSmoothing;
- (float)updateRate;
- (void)dealloc;
- (void)setCurrentOutputTexture:(id)a3;
- (void)setOldScaledGuidance:(id)a3;
- (void)setPipelineStateSimilarity:(id)a3;
- (void)setPipelineStateSmoothing:(id)a3;
- (void)setPreviousOutputTexture:(id)a3;
- (void)setScaledGuidance:(id)a3;
- (void)setShowSimilarity:(BOOL)a3;
- (void)setSimilarity:(id)a3;
- (void)setSimilarityGaussianBlur:(float)a3;
- (void)setTemporalSmoothing:(float)a3;
- (void)setUpdateRate:(float)a3;
@end

@implementation JFXGuidedUpscaler

- (JFXGuidedUpscaler)initWithDiameter:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v22.receiver = self;
  v22.super_class = (Class)JFXGuidedUpscaler;
  v4 = [(JFXGuidedUpscaler *)&v22 init];
  id v5 = v4;
  if (v4)
  {
    v4[64] = 0;
    *(void *)(v4 + 68) = 0x42C800003F000000;
    id v6 = MTLCreateSystemDefaultDevice();
    v7 = [[JFXGuidedFilter alloc] initWithDiameter:v3];
    v8 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v7;

    objc_storeStrong((id *)v5 + 1, v6);
    if (v6)
    {
      uint64_t v9 = [*((id *)v5 + 1) newCommandQueue];
      v10 = (void *)*((void *)v5 + 5);
      *((void *)v5 + 5) = v9;

      if (v9)
      {
        uint64_t v11 = objc_opt_new();
        v12 = (void *)*((void *)v5 + 2);
        *((void *)v5 + 2) = v11;

        if (v11)
        {
          v13 = [[JFXMetalHelpers alloc] initWithDevice:v6];
          v14 = (void *)*((void *)v5 + 6);
          *((void *)v5 + 6) = v13;

          if (v13)
          {
            CVReturn v15 = CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v6, 0, (CVMetalTextureCacheRef *)v5 + 4);
            if (v15)
            {
              v16 = JFXLog_matting();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
                -[JFXGuidedUpscaler initWithDiameter:](v15, v16);
              }
            }
            goto LABEL_11;
          }
          v18 = JFXLog_matting();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v21 = 0;
            v19 = "\"Error: Could not initialize helpers\"";
            goto LABEL_20;
          }
LABEL_21:

          v17 = 0;
          goto LABEL_22;
        }
        v18 = JFXLog_matting();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        *(_WORD *)v21 = 0;
        v19 = "\"Error: Could not initialize scaler\"";
      }
      else
      {
        v18 = JFXLog_matting();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        *(_WORD *)v21 = 0;
        v19 = "\"Error: Failed to create a Metal command queue\"";
      }
    }
    else
    {
      v18 = JFXLog_matting();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      *(_WORD *)v21 = 0;
      v19 = "\"Error: Metal device must not be NULL\"";
    }
LABEL_20:
    _os_log_impl(&dword_234C41000, v18, OS_LOG_TYPE_DEFAULT, v19, v21, 2u);
    goto LABEL_21;
  }
LABEL_11:
  v17 = (JFXGuidedUpscaler *)v5;
LABEL_22:

  return v17;
}

- (void)dealloc
{
  textureCache = self->_textureCache;
  if (textureCache) {
    CFRelease(textureCache);
  }
  guidedFilter = self->_guidedFilter;
  self->_guidedFilter = 0;

  blur = self->_blur;
  self->_blur = 0;

  scaler = self->_scaler;
  self->_scaler = 0;

  helpers = self->_helpers;
  self->_helpers = 0;

  commandQueue = self->_commandQueue;
  self->_commandQueue = 0;

  [(JFXGuidedUpscaler *)self setPipelineStateSimilarity:0];
  [(JFXGuidedUpscaler *)self setPipelineStateSmoothing:0];
  [(JFXGuidedUpscaler *)self setCurrentOutputTexture:0];
  [(JFXGuidedUpscaler *)self setPreviousOutputTexture:0];
  [(JFXGuidedUpscaler *)self setOldScaledGuidance:0];
  [(JFXGuidedUpscaler *)self setScaledGuidance:0];
  device = self->_device;
  self->_device = 0;

  v10.receiver = self;
  v10.super_class = (Class)JFXGuidedUpscaler;
  [(JFXGuidedUpscaler *)&v10 dealloc];
}

- (BOOL)scaleImage:(__CVBuffer *)a3 guidanceImage:(__CVBuffer *)a4 destinationImage:(__CVBuffer *)a5
{
  if (!self->_device)
  {
    uint64_t v11 = JFXLog_matting();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_53;
    }
    *(_WORD *)buf = 0;
    v35 = "\"Error: Metal device must not be NULL\"";
LABEL_52:
    _os_log_impl(&dword_234C41000, v11, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
    goto LABEL_53;
  }
  commandQueue = self->_commandQueue;
  if (!commandQueue)
  {
    uint64_t v11 = JFXLog_matting();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_53;
    }
    *(_WORD *)buf = 0;
    v35 = "\"Error: Metal command queue must not be NULL\"";
    goto LABEL_52;
  }
  if (!self->_textureCache)
  {
    uint64_t v11 = JFXLog_matting();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_53;
    }
    *(_WORD *)buf = 0;
    v35 = "\"Error: texture cache must not be NULL\"";
    goto LABEL_52;
  }
  uint64_t v10 = [(MTLCommandQueue *)commandQueue commandBuffer];
  if (v10)
  {
    uint64_t v11 = v10;
    v12 = +[JFXMetalHelpers createCVTextureFromImage:a3 withTextureCache:self->_textureCache];
    v13 = +[JFXMetalHelpers createCVTextureFromImage:a4 withTextureCache:self->_textureCache];
    v14 = +[JFXMetalHelpers createCVTextureFromImage:a5 withTextureCache:self->_textureCache];
    CVReturn v15 = CVMetalTextureGetTexture(v12);
    v68 = CVMetalTextureGetTexture(v13);
    v67 = CVMetalTextureGetTexture(v14);
    if (v15 && v68 && v67)
    {
      if ([v15 width]
        && [v15 height]
        && [v68 width]
        && [v68 height]
        && [v67 width]
        && [v67 height])
      {
        if (![(JFXGuidedUpscaler *)self initialized])
        {
          v27 = JFXLog_matting();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_60;
          }
          *(_WORD *)buf = 0;
          v37 = "\"Error: Not yet initialized\"";
          goto LABEL_59;
        }
        v16 = [(JFXGuidedUpscaler *)self scaledGuidance];

        if (!v16)
        {
          id v17 = -[JFXMetalHelpers newTextureWithSameSizeAs:pixelFormat:](self->_helpers, "newTextureWithSameSizeAs:pixelFormat:", v15, [v68 pixelFormat]);
          [(JFXGuidedUpscaler *)self setScaledGuidance:v17];

          v18 = [(JFXGuidedUpscaler *)self scaledGuidance];

          if (!v18)
          {
            v27 = JFXLog_matting();
            if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_60;
            }
            *(_WORD *)buf = 0;
            v37 = "\"Error: Could not setup scaledGuidance texture\"";
            goto LABEL_59;
          }
        }
        scaler = self->_scaler;
        v19 = [(JFXGuidedUpscaler *)self scaledGuidance];
        [(MPSImageBilinearScale *)scaler encodeToCommandBuffer:v11 sourceTexture:v68 destinationTexture:v19];

        v20 = [(JFXGuidedUpscaler *)self currentOutputTexture];

        if (v20
          || (v21 = -[JFXMetalHelpers newTextureWithSameSizeAs:pixelFormat:](self->_helpers, "newTextureWithSameSizeAs:pixelFormat:", v67, [v67 pixelFormat]), -[JFXGuidedUpscaler setCurrentOutputTexture:](self, "setCurrentOutputTexture:", v21), v21, -[JFXGuidedUpscaler currentOutputTexture](self, "currentOutputTexture"), objc_super v22 = objc_claimAutoreleasedReturnValue(), v22, v22))
        {
          [(JFXGuidedUpscaler *)self updateRate];
          if (v23 <= 0.0) {
            goto LABEL_35;
          }
          v24 = [(JFXGuidedUpscaler *)self previousOutputTexture];

          if (!v24) {
            goto LABEL_35;
          }
          blur = self->_blur;
          if (blur)
          {
            [(MPSImageGaussianBlur *)blur encodeToCommandBuffer:v11 inPlaceTexture:&self->_oldScaledGuidance fallbackCopyAllocator:0];
            [(MPSImageGaussianBlur *)self->_blur encodeToCommandBuffer:v11 inPlaceTexture:&self->_scaledGuidance fallbackCopyAllocator:0];
          }
          v26 = [v11 computeCommandEncoder];
          v27 = v26;
          if (v26)
          {
            [v26 pushDebugGroup:@"JFXGuidedUpscalerSimilarity"];
            v57 = [(JFXGuidedUpscaler *)self pipelineStateSimilarity];

            if (!v57)
            {
              id v58 = [(JFXMetalHelpers *)self->_helpers newPipelineStateForFunctionWithName:@"JFXGuidedUpscalerSimilarity"];
              [(JFXGuidedUpscaler *)self setPipelineStateSimilarity:v58];
            }
            if (self->_pipelineStateSimilarity)
            {
              -[NSObject setComputePipelineState:](v27, "setComputePipelineState:");
              v59 = [(JFXGuidedUpscaler *)self oldScaledGuidance];
              [v27 setTexture:v59 atIndex:3];

              v60 = [(JFXGuidedUpscaler *)self scaledGuidance];
              [v27 setTexture:v60 atIndex:2];

              v61 = [(JFXGuidedUpscaler *)self similarity];

              if (v61) {
                goto LABEL_29;
              }
              helpers = self->_helpers;
              uint64_t v28 = [(JFXGuidedUpscaler *)self scaledGuidance];
              v29 = helpers;
              v63 = (void *)v28;
              id v55 = [(JFXMetalHelpers *)v29 newTextureWithSameSizeAs:v28 pixelFormat:10];
              [(JFXGuidedUpscaler *)self setSimilarity:v55];

              v64 = [(JFXGuidedUpscaler *)self similarity];

              if (v64)
              {
LABEL_29:
                v65 = [(JFXGuidedUpscaler *)self similarity];
                [v27 setTexture:v65 atIndex:4];

                [v27 setBytes:&self->_temporalSmoothing length:4 atIndex:0];
                if ([(JFXMetalHelpers *)self->_helpers runComputeEncoder:v27 pipelineState:self->_pipelineStateSimilarity referenceTexture:self->_similarity])
                {
                  [v27 popDebugGroup];
                  [v27 endEncoding];
                  v30 = self->_blur;
                  if (v30) {
                    [(MPSImageGaussianBlur *)v30 encodeToCommandBuffer:v11 inPlaceTexture:&self->_similarity fallbackCopyAllocator:0];
                  }
                  if (self->_showSimilarity)
                  {
                    v31 = self->_scaler;
                    v32 = [(JFXGuidedUpscaler *)self similarity];
                    [(MPSImageBilinearScale *)v31 encodeToCommandBuffer:v11 sourceTexture:v32 destinationTexture:v67];
LABEL_34:

LABEL_35:
                    [v11 commit];
                    [(JFXGuidedUpscaler *)self updateRate];
                    if (v33 > 0.0)
                    {
                      std::swap[abi:ne180100]<objc_object  {objcproto10MTLTexture}* {__strong}>((void **)&self->_previousOutputTexture, (void **)&self->_currentOutputTexture);
                      std::swap[abi:ne180100]<objc_object  {objcproto10MTLTexture}* {__strong}>((void **)&self->_oldScaledGuidance, (void **)&self->_scaledGuidance);
                    }
                    if (v12) {
                      CFRelease(v12);
                    }
                    if (v13) {
                      CFRelease(v13);
                    }
                    if (v14) {
                      CFRelease(v14);
                    }
                    BOOL v34 = 1;
                    goto LABEL_61;
                  }
                  [(JFXGuidedFilter *)self->_guidedFilter scaleImage:a3 guidanceImage:a4 destinationImage:a5];
                  v39 = [(JFXGuidedUpscaler *)self currentOutputTexture];

                  if (v39
                    || (id v40 = [(JFXMetalHelpers *)self->_helpers newTextureWithSameSizeAs:v67 pixelFormat:10], [(JFXGuidedUpscaler *)self setCurrentOutputTexture:v40], v40, [(JFXGuidedUpscaler *)self currentOutputTexture], v41 = objc_claimAutoreleasedReturnValue(), v41, v41))
                  {
                    v42 = self->_scaler;
                    v43 = [(JFXGuidedUpscaler *)self currentOutputTexture];
                    [(MPSImageBilinearScale *)v42 encodeToCommandBuffer:v11 sourceTexture:v67 destinationTexture:v43];

                    v44 = [v11 computeCommandEncoder];
                    v32 = v44;
                    if (v44)
                    {
                      [v44 pushDebugGroup:@"JFXGuidedUpscalerSmoothing"];
                      v45 = [(JFXGuidedUpscaler *)self pipelineStateSmoothing];

                      if (!v45)
                      {
                        id v46 = [(JFXMetalHelpers *)self->_helpers newPipelineStateForFunctionWithName:@"JFXGuidedUpscalerSmoothing"];
                        [(JFXGuidedUpscaler *)self setPipelineStateSmoothing:v46];
                      }
                      v47 = [(JFXGuidedUpscaler *)self pipelineStateSmoothing];

                      if (v47)
                      {
                        [v32 setComputePipelineState:self->_pipelineStateSmoothing];
                        v48 = [(JFXGuidedUpscaler *)self currentOutputTexture];
                        [v32 setTexture:v48 atIndex:0];

                        v49 = [(JFXGuidedUpscaler *)self previousOutputTexture];
                        [v32 setTexture:v49 atIndex:1];

                        v50 = [(JFXGuidedUpscaler *)self similarity];
                        [v32 setTexture:v50 atIndex:4];

                        [v32 setBytes:&self->_updateRate length:4 atIndex:1];
                        v51 = self->_helpers;
                        v66 = [(JFXGuidedUpscaler *)self pipelineStateSmoothing];
                        v52 = [(JFXGuidedUpscaler *)self previousOutputTexture];
                        LOBYTE(v51) = [(JFXMetalHelpers *)v51 runComputeEncoder:v32 pipelineState:v66 referenceTexture:v52];

                        if (v51)
                        {
                          [v32 popDebugGroup];
                          [v32 endEncoding];
                          [(MPSImageBilinearScale *)self->_scaler encodeToCommandBuffer:v11 sourceTexture:self->_currentOutputTexture destinationTexture:v67];
                          goto LABEL_34;
                        }
                        v53 = JFXLog_matting();
                        if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
                          goto LABEL_93;
                        }
                        *(_WORD *)buf = 0;
                        v54 = "\"Error: Could not run compute encoder\"";
                        goto LABEL_92;
                      }
                      v53 = JFXLog_matting();
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        v54 = "\"Error: Could not get pipelineStateSmoothing\"";
                        goto LABEL_92;
                      }
                    }
                    else
                    {
                      v53 = JFXLog_matting();
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        v54 = "\"Error: Could not create compute encoder\"";
LABEL_92:
                        _os_log_impl(&dword_234C41000, v53, OS_LOG_TYPE_DEFAULT, v54, buf, 2u);
                      }
                    }
LABEL_93:

                    goto LABEL_85;
                  }
                  v32 = JFXLog_matting();
                  if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_85;
                  }
                  *(_WORD *)buf = 0;
                  v38 = "\"Error: Could not setup destination texture 2\"";
                  goto LABEL_84;
                }
                v32 = JFXLog_matting();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  v38 = "\"Error: Could not run compute encoder\"";
                  goto LABEL_84;
                }
              }
              else
              {
                v32 = JFXLog_matting();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  v38 = "\"Error: Could not setup similarity texture\"";
                  goto LABEL_84;
                }
              }
LABEL_85:

              goto LABEL_60;
            }
            v32 = JFXLog_matting();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_85;
            }
            *(_WORD *)buf = 0;
            v38 = "\"Error: Could not get pipelineStateSimilarity\"";
          }
          else
          {
            v32 = JFXLog_matting();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_85;
            }
            *(_WORD *)buf = 0;
            v38 = "\"Error: Could not create compute encoder\"";
          }
LABEL_84:
          _os_log_impl(&dword_234C41000, v32, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
          goto LABEL_85;
        }
        v27 = JFXLog_matting();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v37 = "\"Error: Could not setup coefficients texture\"";
          goto LABEL_59;
        }
LABEL_60:

        BOOL v34 = 0;
LABEL_61:

        goto LABEL_54;
      }
      v27 = JFXLog_matting();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_60;
      }
      *(_WORD *)buf = 0;
      v37 = "\"Error: Textures must not be empty\"";
    }
    else
    {
      v27 = JFXLog_matting();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_60;
      }
      *(_WORD *)buf = 0;
      v37 = "\"Error:Inputs must not be nil\"";
    }
LABEL_59:
    _os_log_impl(&dword_234C41000, v27, OS_LOG_TYPE_DEFAULT, v37, buf, 2u);
    goto LABEL_60;
  }
  uint64_t v11 = JFXLog_matting();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v35 = "\"Error: failed to create a Metal command buffer\"";
    goto LABEL_52;
  }
LABEL_53:
  BOOL v34 = 0;
LABEL_54:

  return v34;
}

- (BOOL)initialized
{
  return self->_device != 0;
}

- (void)setSimilarityGaussianBlur:(float)a3
{
  if (![(JFXGuidedUpscaler *)self initialized])
  {
    v13 = JFXLog_matting();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[JFXGuidedUpscaler setSimilarityGaussianBlur:](v13);
    }
    goto LABEL_9;
  }
  blur = self->_blur;
  if (blur)
  {
    [(MPSImageGaussianBlur *)blur sigma];
    if (v6 == a3) {
      return;
    }
  }
  if (a3 <= 0.0)
  {
    guidedFilter = self->_blur;
    self->_blur = 0;
    goto LABEL_12;
  }
  id v7 = objc_alloc(MEMORY[0x263F13288]);
  *(float *)&double v8 = a3;
  uint64_t v9 = (MPSImageGaussianBlur *)[v7 initWithDevice:self->_device sigma:v8];
  uint64_t v10 = self->_blur;
  self->_blur = v9;

  uint64_t v11 = self->_blur;
  if (!v11)
  {
    v13 = JFXLog_matting();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[JFXGuidedUpscaler setSimilarityGaussianBlur:](v13);
    }
LABEL_9:

    return;
  }
  [(MPSImageGaussianBlur *)v11 setEdgeMode:1];
  guidedFilter = self->_guidedFilter;
  self->_guidedFilter = 0;
LABEL_12:
}

- (float)updateRate
{
  return self->_updateRate;
}

- (void)setUpdateRate:(float)a3
{
  self->_updateRate = a3;
}

- (BOOL)showSimilarity
{
  return self->_showSimilarity;
}

- (void)setShowSimilarity:(BOOL)a3
{
  self->_showSimilarity = a3;
}

- (float)temporalSmoothing
{
  return self->_temporalSmoothing;
}

- (void)setTemporalSmoothing:(float)a3
{
  self->_temporalSmoothing = a3;
}

- (MTLTexture)scaledGuidance
{
  return self->_scaledGuidance;
}

- (void)setScaledGuidance:(id)a3
{
}

- (MTLTexture)oldScaledGuidance
{
  return self->_oldScaledGuidance;
}

- (void)setOldScaledGuidance:(id)a3
{
}

- (MTLTexture)currentOutputTexture
{
  return self->_currentOutputTexture;
}

- (void)setCurrentOutputTexture:(id)a3
{
}

- (MTLTexture)previousOutputTexture
{
  return self->_previousOutputTexture;
}

- (void)setPreviousOutputTexture:(id)a3
{
}

- (MTLTexture)similarity
{
  return self->_similarity;
}

- (void)setSimilarity:(id)a3
{
}

- (MTLComputePipelineState)pipelineStateSimilarity
{
  return self->_pipelineStateSimilarity;
}

- (void)setPipelineStateSimilarity:(id)a3
{
}

- (MTLComputePipelineState)pipelineStateSmoothing
{
  return self->_pipelineStateSmoothing;
}

- (void)setPipelineStateSmoothing:(id)a3
{
}

- (float)similarityGaussianBlur
{
  return self->_similarityGaussianBlur;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineStateSmoothing, 0);
  objc_storeStrong((id *)&self->_pipelineStateSimilarity, 0);
  objc_storeStrong((id *)&self->_similarity, 0);
  objc_storeStrong((id *)&self->_previousOutputTexture, 0);
  objc_storeStrong((id *)&self->_currentOutputTexture, 0);
  objc_storeStrong((id *)&self->_oldScaledGuidance, 0);
  objc_storeStrong((id *)&self->_scaledGuidance, 0);
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_helpers, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_blur, 0);
  objc_storeStrong((id *)&self->_scaler, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)initWithDiameter:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_234C41000, a2, OS_LOG_TYPE_ERROR, "Error: Failed to create a Metal texture cache CVReturn = %d", (uint8_t *)v2, 8u);
}

- (void)setSimilarityGaussianBlur:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_234C41000, log, OS_LOG_TYPE_ERROR, "Error: Could not initialize gaussian blur", v1, 2u);
}

- (void)setSimilarityGaussianBlur:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_234C41000, log, OS_LOG_TYPE_ERROR, "Cannot set similarity blur before initializing upscaler", v1, 2u);
}

@end