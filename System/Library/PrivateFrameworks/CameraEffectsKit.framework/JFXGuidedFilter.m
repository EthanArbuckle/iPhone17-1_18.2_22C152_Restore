@interface JFXGuidedFilter
- (JFXGuidedFilter)initWithDiameter:(int)a3;
- (void)dealloc;
- (void)scaleImage:(__CVBuffer *)a3 guidanceImage:(__CVBuffer *)a4 destinationImage:(__CVBuffer *)a5;
@end

@implementation JFXGuidedFilter

- (JFXGuidedFilter)initWithDiameter:(int)a3
{
  v22.receiver = self;
  v22.super_class = (Class)JFXGuidedFilter;
  v4 = [(JFXGuidedFilter *)&v22 init];
  if (v4)
  {
    v5 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v4->_device;
    v4->_device = v5;

    v7 = v4->_device;
    if (v7)
    {
      CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v7, 0, &v4->_textureCache);
      if (!v4->_textureCache)
      {
        v8 = JFXLog_matting();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEFAULT, "Error: Failed to create a Metal texture cache", v21, 2u);
        }
      }
      uint64_t v9 = [(MTLDevice *)v4->_device newCommandQueue];
      commandQueue = v4->_commandQueue;
      v4->_commandQueue = (MTLCommandQueue *)v9;

      if (!v4->_commandQueue)
      {
        v11 = JFXLog_matting();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_234C41000, v11, OS_LOG_TYPE_DEFAULT, "Error: Failed to create a Metal command queue", v21, 2u);
        }
      }
      if (!v4->_osGuidedFilter)
      {
        if (a3 >= 0) {
          int v12 = a3;
        }
        else {
          int v12 = a3 + 1;
        }
        id v13 = objc_alloc(MEMORY[0x263F13290]);
        int v14 = v12 | 1;
        if (a3 < 2) {
          int v14 = 3;
        }
        uint64_t v15 = [v13 initWithDevice:v4->_device kernelDiameter:v14];
        osGuidedFilter = v4->_osGuidedFilter;
        v4->_osGuidedFilter = (MPSImageGuidedFilter *)v15;

        LODWORD(v17) = 981668463;
        [(MPSImageGuidedFilter *)v4->_osGuidedFilter setEpsilon:v17];
        LODWORD(v18) = 1068708659;
        [(MPSImageGuidedFilter *)v4->_osGuidedFilter setReconstructScale:v18];
        LODWORD(v19) = -1102263091;
        [(MPSImageGuidedFilter *)v4->_osGuidedFilter setReconstructOffset:v19];
        [(MPSImageGuidedFilter *)v4->_osGuidedFilter setLabel:@"Guided Filter for edge refinement"];
      }
    }
  }
  return v4;
}

- (void)scaleImage:(__CVBuffer *)a3 guidanceImage:(__CVBuffer *)a4 destinationImage:(__CVBuffer *)a5
{
  if (self->_device && (commandQueue = self->_commandQueue) != 0 && self->_textureCache)
  {
    uint64_t v10 = [(MTLCommandQueue *)commandQueue commandBuffer];
    if (v10)
    {
      v11 = v10;
      if (!self->_osGuidedFilter)
      {
        uint64_t v15 = JFXLog_matting();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(pixelBufferOut[0]) = 0;
          _os_log_impl(&dword_234C41000, v15, OS_LOG_TYPE_DEFAULT, "Error: guided filter is NULL in filterImage", (uint8_t *)pixelBufferOut, 2u);
        }
        goto LABEL_43;
      }
      pixelBufferOut[0] = 0;
      int v12 = +[JFXMetalHelpers createCVTextureFromImage:a3 withTextureCache:self->_textureCache];
      id v13 = +[JFXMetalHelpers createCVTextureFromImage:a4 withTextureCache:self->_textureCache];
      int v14 = +[JFXMetalHelpers createCVTextureFromImage:a5 withTextureCache:self->_textureCache];
      uint64_t v15 = CVMetalTextureGetTexture(v12);
      v16 = CVMetalTextureGetTexture(v13);
      uint64_t v17 = CVMetalTextureGetTexture(v14);
      v29 = (void *)v17;
      if (v15)
      {
        if (v16)
        {
          if (v17)
          {
            coeffPool = self->_coeffPool;
            if (!coeffPool)
            {
              if (([(MPSImageGuidedFilter *)self->_osGuidedFilter options] & 2) != 0) {
                int v22 = 1380411457;
              }
              else {
                int v22 = 1380410945;
              }
              unsigned int v28 = v22;
              self->_guideImageWidth = CVPixelBufferGetWidth(a4);
              size_t Height = CVPixelBufferGetHeight(a4);
              self->_guideImagesize_t Height = Height;
              if (JFXCreatePixelBufferPool(self->_guideImageWidth, Height, v28, &self->_coeffPool))
              {
                double v19 = JFXLog_matting();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  v20 = "Error: CreatePixelBufferPool for _coeffPool failed";
                  goto LABEL_32;
                }
                goto LABEL_33;
              }
              coeffPool = self->_coeffPool;
            }
            if (!CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], coeffPool, pixelBufferOut))
            {
              v25 = +[JFXMetalHelpers createCVTextureFromImage:pixelBufferOut[0] withTextureCache:self->_textureCache];
              uint64_t v26 = CVMetalTextureGetTexture(v25);
              if (v26)
              {
                v24 = (void *)v26;
                [(MPSImageGuidedFilter *)self->_osGuidedFilter encodeRegressionToCommandBuffer:v11 sourceTexture:v15 guidanceTexture:v16 weightsTexture:0 destinationCoefficientsTexture:v26];
                [(MPSImageGuidedFilter *)self->_osGuidedFilter encodeReconstructionToCommandBuffer:v11 guidanceTexture:v16 coefficientsTexture:v24 destinationTexture:v29];
                [v11 commit];
              }
              else
              {
                v27 = JFXLog_matting();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_234C41000, v27, OS_LOG_TYPE_DEFAULT, "Error: coeffTexture is NULL", buf, 2u);
                }

                v24 = 0;
              }
              goto LABEL_34;
            }
            double v19 = JFXLog_matting();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v20 = "Error: CVPixelBufferPoolCreatePixelBuffer for coeffImage failed";
LABEL_32:
              _os_log_impl(&dword_234C41000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
            }
          }
          else
          {
            double v19 = JFXLog_matting();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v20 = "Error: destination texture is NULL";
              goto LABEL_32;
            }
          }
        }
        else
        {
          double v19 = JFXLog_matting();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v20 = "Error: guidance texture is NULL";
            goto LABEL_32;
          }
        }
      }
      else
      {
        double v19 = JFXLog_matting();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v20 = "Error: source texture is NULL";
          goto LABEL_32;
        }
      }
LABEL_33:

      v24 = 0;
      v25 = 0;
LABEL_34:
      if (v12) {
        CFRelease(v12);
      }
      if (v25) {
        CFRelease(v25);
      }
      if (v13) {
        CFRelease(v13);
      }
      if (v14) {
        CFRelease(v14);
      }
      CVPixelBufferRelease(pixelBufferOut[0]);

LABEL_43:
      goto LABEL_44;
    }
    v11 = JFXLog_matting();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(pixelBufferOut[0]) = 0;
      v21 = "Error: failed to create a Metal command buffer";
      goto LABEL_15;
    }
  }
  else
  {
    v11 = JFXLog_matting();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(pixelBufferOut[0]) = 0;
      v21 = "Error: Metal compute not available.";
LABEL_15:
      _os_log_impl(&dword_234C41000, v11, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)pixelBufferOut, 2u);
    }
  }
LABEL_44:
}

- (void)dealloc
{
  textureCache = self->_textureCache;
  if (textureCache) {
    CFRelease(textureCache);
  }
  CVPixelBufferPoolRelease(self->_coeffPool);
  osGuidedFilter = self->_osGuidedFilter;
  self->_osGuidedFilter = 0;

  commandQueue = self->_commandQueue;
  self->_commandQueue = 0;

  v6.receiver = self;
  v6.super_class = (Class)JFXGuidedFilter;
  [(JFXGuidedFilter *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_osGuidedFilter, 0);
}

@end