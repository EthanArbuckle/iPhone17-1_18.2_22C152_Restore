@interface JFXMetalHelpers
+ (__CVBuffer)createCVTextureFromImage:(__CVBuffer *)a3 withTextureCache:(__CVMetalTextureCache *)a4;
+ (id)copyMetalLibraryWithDevice:(id)a3 error:(id *)a4;
+ (unint64_t)metalPixelFormatForImage:(__CVBuffer *)a3;
- (BOOL)runComputeEncoder:(id)a3 pipelineState:(id)a4 referenceTexture:(id)a5;
- (JFXMetalHelpers)initWithDevice:(id)a3;
- (id)device;
- (id)newPipelineStateForFunctionWithName:(id)a3;
- (id)newTexture:(id)a3;
- (id)newTextureWithSameSizeAs:(id)a3 pixelFormat:(unint64_t)a4;
- (id)newTextureWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(unint64_t)a5 usage:(unint64_t)a6;
@end

@implementation JFXMetalHelpers

- (id)device
{
  return self->m_device;
}

- (JFXMetalHelpers)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)JFXMetalHelpers;
  v6 = [(JFXMetalHelpers *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->m_device, a3);
  }

  return v7;
}

- (id)newTexture:(id)a3
{
  id v4 = a3;
  id v5 = -[JFXMetalHelpers newTextureWithSameSizeAs:pixelFormat:](self, "newTextureWithSameSizeAs:pixelFormat:", v4, [v4 pixelFormat]);

  return v5;
}

- (id)newTextureWithSameSizeAs:(id)a3 pixelFormat:(unint64_t)a4
{
  id v6 = a3;
  id v7 = -[JFXMetalHelpers newTextureWithWidth:height:pixelFormat:usage:](self, "newTextureWithWidth:height:pixelFormat:usage:", [v6 width], objc_msgSend(v6, "height"), a4, 3);

  return v7;
}

- (id)newTextureWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(unint64_t)a5 usage:(unint64_t)a6
{
  v8 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:a5 width:a3 height:a4 mipmapped:0];
  [v8 setUsage:a6];
  [v8 setStorageMode:2];
  objc_super v9 = (void *)[(MTLDevice *)self->m_device newTextureWithDescriptor:v8];

  return v9;
}

- (id)newPipelineStateForFunctionWithName:(id)a3
{
  id v4 = a3;
  m_device = self->m_device;
  id v34 = 0;
  id v6 = +[JFXMetalHelpers copyMetalLibraryWithDevice:m_device error:&v34];
  id v7 = v34;
  if (v6)
  {
    v8 = [v6 newFunctionWithName:v4];
    if (v8)
    {
      objc_super v9 = self->m_device;
      id v33 = v7;
      v10 = [(MTLDevice *)v9 newComputePipelineStateWithFunction:v8 error:&v33];
      id v11 = v33;

      if (v10)
      {
        v10 = v10;
        v12 = v10;
      }
      else
      {
        v25 = JFXLog_matting();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[JFXMetalHelpers newPipelineStateForFunctionWithName:]((uint64_t)v11, v25, v26, v27, v28, v29, v30, v31);
        }

        v12 = 0;
      }
    }
    else
    {
      v10 = JFXLog_matting();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[JFXMetalHelpers newPipelineStateForFunctionWithName:]((uint64_t)v7, v10, v19, v20, v21, v22, v23, v24);
      }
      v12 = 0;
      id v11 = v7;
    }

    id v7 = v11;
  }
  else
  {
    v8 = JFXLog_matting();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[JFXMetalHelpers newPipelineStateForFunctionWithName:]((uint64_t)v7, v8, v13, v14, v15, v16, v17, v18);
    }
    v12 = 0;
  }

  return v12;
}

- (BOOL)runComputeEncoder:(id)a3 pipelineState:(id)a4 referenceTexture:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [v8 threadExecutionWidth];
  unint64_t v11 = [v8 maxTotalThreadsPerThreadgroup];
  unint64_t v12 = v10 - 1;
  if (v10 - 1 >= v11)
  {
    uint64_t v13 = JFXLog_matting();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[JFXMetalHelpers runComputeEncoder:pipelineState:referenceTexture:]();
    }
  }
  else
  {
    v16[0] = [v9 width];
    v16[1] = [v9 height];
    v16[2] = 1;
    v15[0] = v10;
    v15[1] = v11 / v10;
    v15[2] = 1;
    [v7 dispatchThreads:v16 threadsPerThreadgroup:v15];
  }

  return v12 < v11;
}

+ (unint64_t)metalPixelFormatForImage:(__CVBuffer *)a3
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  unsigned int v4 = PixelFormatType;
  if (PixelFormatType > 1278226535)
  {
    if (PixelFormatType > 1380411456)
    {
      if (PixelFormatType == 2019963440 || PixelFormatType == 2016686640) {
        return 20;
      }
      if (PixelFormatType == 1380411457) {
        return 115;
      }
    }
    else
    {
      switch(PixelFormatType)
      {
        case 1278226536:
          return 25;
        case 1380401729:
          return 70;
        case 1380410945:
          return 125;
      }
    }
    goto LABEL_23;
  }
  if (PixelFormatType > 1111970368)
  {
    if (PixelFormatType == 1111970369) {
      return 80;
    }
    if (PixelFormatType != 1278226488)
    {
      if (PixelFormatType == 1278226534) {
        return 55;
      }
      goto LABEL_23;
    }
    return 10;
  }
  if (PixelFormatType == 875704422 || PixelFormatType == 875704438) {
    return 10;
  }
LABEL_23:
  id v6 = JFXLog_matting();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[JFXMetalHelpers metalPixelFormatForImage:](v4, v6);
  }

  return 0;
}

+ (__CVBuffer)createCVTextureFromImage:(__CVBuffer *)a3 withTextureCache:(__CVMetalTextureCache *)a4
{
  if (!a4)
  {
    unint64_t v10 = JFXLog_matting();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[JFXMetalHelpers createCVTextureFromImage:withTextureCache:]();
    }
    goto LABEL_10;
  }
  if (!a3)
  {
    unint64_t v10 = JFXLog_matting();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[JFXMetalHelpers createCVTextureFromImage:withTextureCache:]();
    }
    goto LABEL_10;
  }
  CVMetalTextureRef textureOut = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  MTLPixelFormat v7 = +[JFXMetalHelpers metalPixelFormatForImage:a3];
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  if (CVMetalTextureCacheCreateTextureFromImage(v6, a4, a3, 0, v7, Width, Height, 0, &textureOut))
  {
    unint64_t v10 = JFXLog_matting();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[JFXMetalHelpers createCVTextureFromImage:withTextureCache:]();
    }
LABEL_10:

    return 0;
  }
  return textureOut;
}

+ (id)copyMetalLibraryWithDevice:(id)a3 error:(id *)a4
{
  id v5 = a3;
  CFAllocatorRef v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  MTLPixelFormat v7 = [v6 pathForResource:@"default" ofType:@"metallib"];

  if (v7
    && ([NSURL fileURLWithPath:v7 isDirectory:0],
        (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v14 = 0;
    id v9 = (void *)[v5 newLibraryWithURL:v8 error:&v14];
    id v10 = v14;
    unint64_t v11 = v10;
    if (v10)
    {
      id v12 = 0;
      if (a4) {
        *a4 = v10;
      }
    }
    else
    {
      id v12 = v9;
    }
  }
  else
  {
    id v8 = JFXLog_matting();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[JFXMetalHelpers copyMetalLibraryWithDevice:error:]();
    }
    id v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
}

- (void)newPipelineStateForFunctionWithName:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)newPipelineStateForFunctionWithName:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)newPipelineStateForFunctionWithName:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)runComputeEncoder:pipelineState:referenceTexture:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "Error: threadsPerGroup is wrong", v2, v3, v4, v5, v6);
}

+ (void)metalPixelFormatForImage:(unsigned int)a1 .cold.1(unsigned int a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2[0] = 67110144;
  v2[1] = HIBYTE(a1);
  __int16 v3 = 1024;
  unsigned int v4 = HIWORD(a1);
  __int16 v5 = 1024;
  unsigned int v6 = a1 >> 8;
  __int16 v7 = 1024;
  unsigned int v8 = a1;
  __int16 v9 = 1024;
  unsigned int v10 = a1;
  _os_log_error_impl(&dword_234C41000, a2, OS_LOG_TYPE_ERROR, "Error: tried to get metal pixel format for %c%c%c%c (0x%04x)", (uint8_t *)v2, 0x20u);
}

+ (void)createCVTextureFromImage:withTextureCache:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "Error: texture cache must not be NULL", v2, v3, v4, v5, v6);
}

+ (void)createCVTextureFromImage:withTextureCache:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "Error: image must not be NULL", v2, v3, v4, v5, v6);
}

+ (void)createCVTextureFromImage:withTextureCache:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "Error: Failed to create CVMetalTextureRef.", v2, v3, v4, v5, v6);
}

+ (void)copyMetalLibraryWithDevice:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "Error: Could not find metal library", v2, v3, v4, v5, v6);
}

@end