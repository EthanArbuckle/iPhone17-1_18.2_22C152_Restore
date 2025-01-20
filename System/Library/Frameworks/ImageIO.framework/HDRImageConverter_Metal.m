@interface HDRImageConverter_Metal
+ (id)metalDevice;
+ (id)selectMetalDevice;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)computeGridSizeForThreadGroupSize:(SEL)a3 outputSize:(id *)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)computeThreadGroupSizeForOutputSize:(SEL)a3 pipelineState:(id *)a4;
- (BOOL)canUseImageBlocks;
- (BOOL)commitAndWaitUntilCompleted:(id)a3;
- (BOOL)computeLumaGainHistogram:(id *)a3 scale:(__CVBuffer *)a4 image:(id *)a5 transform:(__CVBuffer *)a6 gainMap:(id *)a7 transform:;
- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 gainMap:(__CVBuffer *)a6 transform:(id *)a7 alternate:(id *)a8 toImage:(__CVBuffer *)a9 transform:(id *)a10 gainMap:(__CVBuffer *)a11 transform:(id *)a12;
- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 toImage:(__CVBuffer *)a6 transform:(id *)a7 gainMap:(__CVBuffer *)a8 transform:(id *)a9;
- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 gainMap:(__CVBuffer *)a5 transform:(id *)a6 toImage:(__CVBuffer *)a7 transform:(id *)a8;
- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 toImage:(__CVBuffer *)a5 transform:(id *)a6;
- (BOOL)isPixelFormatSupported:(unsigned int)a3;
- (HDRImageConverter_Metal)init;
- (MTLBinaryArchive)metalArchive;
- (MTLBinaryArchive)metalBinaryArchive;
- (MTLCommandQueue)metalCommandQueue;
- (MTLDevice)metalDevice;
- (MTLLibrary)metalLibrary;
- (__CVBuffer)metalTextureFromBuffer:(__CVBuffer *)a3 plane:(unsigned int)a4;
- (__CVMetalTextureCache)metalTextureCache;
- (id)conversionFunctionWithName:(id)a3 subsampling:;
- (id)description;
- (id)metalBinaryArchiveFileForHarvest;
- (id)metalComputePipelineStateWithFunction:(id)a3;
- (id)metalLibraryFunctionWithName:(id)a3;
- (id)metalLibraryFunctionWithName:(id)a3 functionConstant:(id)a4;
- (id)metalTextureFromCubeData:(id)a3;
- (id)metalTextureFromTableData:(id)a3;
- (unint64_t)metalPixelFormatForPixelFormat:(unsigned int)a3 plane:(unsigned int)a4;
- (void)dealloc;
- (void)encodeInputColorTransform:(id *)a3 toBuffer:(id)a4 offset:(unint64_t)a5 withArgumentEncoder:(id)a6 computeEncoder:(id)a7 index:(unint64_t)a8;
- (void)encodeInputGainTransform:(id *)a3 toBuffer:(id)a4 offset:(unint64_t)a5 withArgumentEncoder:(id)a6 computeEncoder:(id)a7 index:(unint64_t)a8;
- (void)encodeInputImage:(__CVBuffer *)a3 transform:(id *)a4 toBuffer:(id)a5 offset:(unint64_t)a6 withArgumentEncoder:(id)a7 computeEncoder:(id)a8 index:(unint64_t)a9 textures:(id)a10;
- (void)encodeOutputColorTransform:(id *)a3 toBuffer:(id)a4 offset:(unint64_t)a5 withArgumentEncoder:(id)a6 computeEncoder:(id)a7 index:(unint64_t)a8;
- (void)encodeOutputGainTransform:(id *)a3 toBuffer:(id)a4 offset:(unint64_t)a5 withArgumentEncoder:(id)a6 computeEncoder:(id)a7 index:(unint64_t)a8;
- (void)encodeOutputImage:(__CVBuffer *)a3 transform:(id *)a4 toBuffer:(id)a5 offset:(unint64_t)a6 withArgumentEncoder:(id)a7 computeEncoder:(id)a8 index:(unint64_t)a9 textures:(id)a10;
@end

@implementation HDRImageConverter_Metal

- (HDRImageConverter_Metal)init
{
  v43.receiver = self;
  v43.super_class = (Class)HDRImageConverter_Metal;
  v2 = [(HDRImageConverter_Metal *)&v43 init];
  v3 = v2;
  uint64_t v4 = [(id)objc_opt_class() metalDevice];
  metalDevice = v2->_metalDevice;
  v2->_metalDevice = (MTLDevice *)v4;

  v6 = v2->_metalDevice;
  if (v6)
  {
    v7 = [(MTLDevice *)v6 name];
    uint64_t v8 = [v7 rangeOfString:@"virtual" options:3];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = [(MTLDevice *)v2->_metalDevice name];
      uint64_t v10 = [v9 rangeOfString:@"Intel" options:3];

      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.ImageIO"];
        v12 = v2->_metalDevice;
        id v42 = 0;
        uint64_t v13 = [(MTLDevice *)v12 newDefaultLibraryWithBundle:v11 error:&v42];
        id v14 = v42;
        metalLibrary = v2->_metalLibrary;
        v2->_metalLibrary = (MTLLibrary *)v13;

        if (v2->_metalLibrary)
        {
          id v16 = [v11 URLForResource:@"archive" withExtension:@"metallib"];
          if (v16)
          {
            id v17 = objc_alloc_init(MEMORY[0x1E4F351C8]);
            [v17 setUrl:v16];
            v18 = v2->_metalDevice;
            id v41 = v14;
            uint64_t v19 = [(MTLDevice *)v18 newBinaryArchiveWithDescriptor:v17 error:&v41];
            id v20 = v41;

            metalArchive = v2->_metalArchive;
            v2->_metalArchive = (MTLBinaryArchive *)v19;

            if (!v2->_metalArchive)
            {
              id v37 = v16;
              v38 = (const char *)[v37 fileSystemRepresentation];
              id v39 = [v20 description];
              LogError("-[HDRImageConverter_Metal init]", 87, "*** Failed to load metal archive from bundle: %s, error: %s", v38, (const char *)[v39 UTF8String]);

              v22 = 0;
              id v16 = v37;
              id v14 = v20;
              goto LABEL_27;
            }

            id v14 = v20;
          }
          if (gFunc_CVMetalTextureCacheCreate(0, 0, v2->_metalDevice, 0, &v2->_metalTextureCache))
          {
            LogError("-[HDRImageConverter_Metal init]", 95, "Failed to create Metal texture cache");
            v22 = 0;
LABEL_28:

            goto LABEL_17;
          }
          uint64_t v25 = [(MTLDevice *)v2->_metalDevice newCommandQueue];
          metalCommandQueue = v2->_metalCommandQueue;
          v2->_metalCommandQueue = (MTLCommandQueue *)v25;

          [(MTLCommandQueue *)v2->_metalCommandQueue setBackgroundGPUPriority:2];
          id v17 = [(HDRImageConverter_Metal *)v2 metalBinaryArchiveFileForHarvest];
          if (v17)
          {
            id v27 = objc_alloc_init(MEMORY[0x1E4F351C8]);
            v28 = [MEMORY[0x1E4F28CB8] defaultManager];
            v29 = [v17 path];
            int v30 = [v28 fileExistsAtPath:v29];

            if (v30) {
              [v27 setUrl:v17];
            }
            v31 = v3->_metalDevice;
            id v40 = v14;
            uint64_t v32 = [(MTLDevice *)v31 newBinaryArchiveWithDescriptor:v27 error:&v40];
            id v33 = v40;

            metalBinaryArchive = v3->_metalBinaryArchive;
            v3->_metalBinaryArchive = (MTLBinaryArchive *)v32;

            if (!v3->_metalBinaryArchive)
            {
              v35 = (const char *)[v17 fileSystemRepresentation];
              id v36 = [v33 description];
              LogError("-[HDRImageConverter_Metal init]", 112, "Failed to create Metal binary archive at path: '%s', error: '%s'", v35, (const char *)[v36 UTF8String]);
            }
            id v14 = v33;
          }
          v22 = v3;
        }
        else
        {
          id v16 = [v11 description];
          v24 = (const char *)[v16 UTF8String];
          id v17 = [v14 description];
          LogError("-[HDRImageConverter_Metal init]", 76, "*** Failed to load metal library from bundle: %s, error: %s", v24, (const char *)[v17 UTF8String]);
          v22 = 0;
        }
LABEL_27:

        goto LABEL_28;
      }
      if ((gIIODebugFlags & 0x300000) != 0) {
        ImageIOLog("☀️ Metal converter not available: Intel GPU does not support argument buffers [128179728]");
      }
    }
    else if ((gIIODebugFlags & 0x300000) != 0)
    {
      ImageIOLog("☀️ Metal converter not available: VM does not support argument buffers [100784848]");
    }
  }
  else if ((gIIODebugFlags & 0x300000) != 0)
  {
    ImageIOLog("☀️ Metal converter not available: no device!");
  }
  v22 = 0;
LABEL_17:

  return v22;
}

- (id)metalBinaryArchiveFileForHarvest
{
  v2 = (void *)CFPreferencesCopyValue(@"IIOHDRMetalHarvestBinaryArchive", @"com.apple.ImageIO", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)dealloc
{
  metalTextureCache = self->_metalTextureCache;
  if (metalTextureCache)
  {
    CFRelease(metalTextureCache);
    self->_metalTextureCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)HDRImageConverter_Metal;
  [(HDRImageConverter_Metal *)&v4 dealloc];
}

- (id)description
{
  v2 = NSString;
  v3 = [(id)objc_opt_class() description];
  objc_super v4 = [(id)objc_opt_class() metalDevice];
  v5 = [v4 name];
  v6 = [v2 stringWithFormat:@"%@[%@]", v3, v5];

  return v6;
}

+ (id)metalDevice
{
  if (IIO_XPCServer())
  {
    id v3 = [a1 selectMetalDevice];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__HDRImageConverter_Metal_metalDevice__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (+[HDRImageConverter_Metal metalDevice]::onceToken != -1) {
      dispatch_once(&+[HDRImageConverter_Metal metalDevice]::onceToken, block);
    }
    id v3 = (id)+[HDRImageConverter_Metal metalDevice]::s_device;
  }

  return v3;
}

+ (id)selectMetalDevice
{
  id v2 = MTLCreateSystemDefaultDevice();

  return v2;
}

- (id)metalLibraryFunctionWithName:(id)a3
{
  id v4 = a3;
  v5 = [(HDRImageConverter_Metal *)self metalLibrary];
  v6 = (void *)[v5 newFunctionWithName:v4];

  if (v6) {
    id v7 = v6;
  }
  else {
    LogError("-[HDRImageConverter_Metal metalLibraryFunctionWithName:]", 174, "Failed to load Metal kernel function named '%s'", (const char *)[v4 UTF8String]);
  }

  return v6;
}

- (id)metalLibraryFunctionWithName:(id)a3 functionConstant:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F35240]);
  [v8 setName:v6];
  [v8 setConstantValues:v7];
  if (self->_metalArchive)
  {
    [v8 setOptions:4];
    v24[0] = self->_metalArchive;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [v8 setBinaryArchives:v9];
  }
  uint64_t v10 = [(HDRImageConverter_Metal *)self metalLibrary];
  id v23 = 0;
  v11 = (void *)[v10 newFunctionWithDescriptor:v8 error:&v23];
  id v12 = v23;

  if (v11) {
    goto LABEL_4;
  }
  if (!self->_metalArchive) {
    goto LABEL_7;
  }
  uint64_t v13 = (const char *)[v6 UTF8String];
  id v14 = [v7 description];
  v15 = (const char *)[v14 UTF8String];
  id v16 = [v12 description];
  LogWarning("-[HDRImageConverter_Metal metalLibraryFunctionWithName:functionConstant:]", 191, "Failed to load precompiled Metal kernel function named '%s' with constants values: '%s', error: %s. Will retry and allow compile, this is costly!", v13, v15, (const char *)[v16 UTF8String]);

  [v8 setOptions:0];
  [v8 setBinaryArchives:0];
  id v17 = [(HDRImageConverter_Metal *)self metalLibrary];
  id v22 = v12;
  v11 = (void *)[v17 newFunctionWithDescriptor:v8 error:&v22];
  id v18 = v22;

  id v12 = v18;
  if (v11)
  {
LABEL_4:
    [v11 setLabel:v6];
  }
  else
  {
LABEL_7:
    uint64_t v19 = (const char *)[v6 UTF8String];
    id v20 = [v12 description];
    LogError("-[HDRImageConverter_Metal metalLibraryFunctionWithName:functionConstant:]", 197, "Failed to load Metal kernel function named '%s', error: %s", v19, (const char *)[v20 UTF8String]);

    v11 = 0;
  }

  return v11;
}

- (id)metalComputePipelineStateWithFunction:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F35210]);
  [v5 setComputeFunction:v4];
  id v6 = [v4 label];
  [v5 setLabel:v6];

  if (self->_metalArchive)
  {
    v33[0] = self->_metalArchive;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    [v5 setBinaryArchives:v7];

    uint64_t v8 = 4;
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = [(HDRImageConverter_Metal *)self metalDevice];
  id v32 = 0;
  uint64_t v10 = (void *)[v9 newComputePipelineStateWithDescriptor:v5 options:v8 reflection:0 error:&v32];
  id v11 = v32;

  if (v10) {
    goto LABEL_5;
  }
  if (!self->_metalArchive) {
    goto LABEL_12;
  }
  id v19 = [v4 name];
  id v20 = (const char *)[v19 UTF8String];
  id v21 = [v11 description];
  LogWarning("-[HDRImageConverter_Metal metalComputePipelineStateWithFunction:]", 216, "Failed to create precompiled MTLComputePipelineState for function '%s', error: %s, will retry and allow compiling, this is inefficient!", v20, (const char *)[v21 UTF8String]);

  [v5 setBinaryArchives:0];
  id v22 = [(HDRImageConverter_Metal *)self metalDevice];
  id v31 = v11;
  uint64_t v10 = (void *)[v22 newComputePipelineStateWithDescriptor:v5 options:0 reflection:0 error:&v31];
  id v23 = v31;

  id v11 = v23;
  if (v10)
  {
LABEL_5:
    metalBinaryArchive = self->_metalBinaryArchive;
    if (!metalBinaryArchive) {
      goto LABEL_17;
    }
    id v30 = v11;
    char v13 = [(MTLBinaryArchive *)metalBinaryArchive addComputePipelineFunctionsWithDescriptor:v5 error:&v30];
    id v14 = v30;

    if (v13)
    {
      v15 = [(HDRImageConverter_Metal *)self metalBinaryArchiveFileForHarvest];
      id v16 = self->_metalBinaryArchive;
      id v29 = v14;
      char v17 = [(MTLBinaryArchive *)v16 serializeToURL:v15 error:&v29];
      id v11 = v29;

      if (v17)
      {
        if ((gIIODebugFlags & 0x300000) != 0)
        {
          id v18 = v15;
          ImageIOLog("Saved Metal binary archive to  '%s'", (const char *)[v18 fileSystemRepresentation]);
        }
        else
        {
          id v18 = v15;
        }
        goto LABEL_16;
      }
      id v18 = v15;
      id v27 = (const char *)[v18 fileSystemRepresentation];
      id v25 = [v11 description];
      LogError("-[HDRImageConverter_Metal metalComputePipelineStateWithFunction:]", 234, "Failed to save Metal binary archive to '%s', error: %s", v27, (const char *)[v25 UTF8String]);
    }
    else
    {
      id v18 = [v5 label];
      v26 = (const char *)[v18 UTF8String];
      id v25 = [v14 description];
      LogError("-[HDRImageConverter_Metal metalComputePipelineStateWithFunction:]", 229, "Failed to add compute pipeline state '%s' to binary archive, error: %s", v26, (const char *)[v25 UTF8String]);
      id v11 = v14;
    }
  }
  else
  {
LABEL_12:
    id v18 = [v4 name];
    v24 = (const char *)[v18 UTF8String];
    id v25 = [v11 description];
    LogError("-[HDRImageConverter_Metal metalComputePipelineStateWithFunction:]", 222, "Failed to create MTLComputePipelineState for function '%s', error: %s", v24, (const char *)[v25 UTF8String]);
    uint64_t v10 = 0;
  }

LABEL_16:
LABEL_17:

  return v10;
}

- (unint64_t)metalPixelFormatForPixelFormat:(unsigned int)a3 plane:(unsigned int)a4
{
  if ((int)a3 <= 1380410944)
  {
    if ((int)a3 <= 875836517)
    {
      if ((int)a3 > 875704933)
      {
        if (a3 == 875704934) {
          goto LABEL_41;
        }
        unsigned __int16 v12 = 12918;
      }
      else
      {
        if (a3 == 875704422) {
          goto LABEL_41;
        }
        unsigned __int16 v12 = 12406;
      }
      int v13 = v12 | 0x34320000;
    }
    else
    {
      if ((int)a3 > 1111970368)
      {
        switch(a3)
        {
          case 0x42475241u:
            if (a4) {
              goto LABEL_56;
            }
            goto LABEL_54;
          case 0x4C303038u:
            if (a4) {
              goto LABEL_56;
            }
            goto LABEL_54;
          case 0x4C303130u:
            uint64_t v8 = [(HDRImageConverter_Metal *)self metalDevice];
            MTLPixelFormatGetInfoForDevice();

            uint64_t v9 = 20;
            if (a4) {
              uint64_t v9 = 0;
            }
            uint64_t v10 = v9;
            goto LABEL_45;
        }
        goto LABEL_80;
      }
      if (a3 == 875836518)
      {
LABEL_41:
        if (a4 == 1) {
          uint64_t v10 = 30;
        }
        else {
          uint64_t v10 = 0;
        }
        if (!a4) {
          goto LABEL_54;
        }
        goto LABEL_45;
      }
      int v13 = 875836534;
    }
    if (a3 != v13) {
      goto LABEL_80;
    }
    goto LABEL_41;
  }
  if ((int)a3 <= 2016686641)
  {
    if ((int)a3 <= 1815162993)
    {
      if (a3 == 1380410945)
      {
        if (a4) {
          goto LABEL_56;
        }
        goto LABEL_54;
      }
      if (a3 == 1380411457)
      {
        if (a4) {
          goto LABEL_56;
        }
        goto LABEL_54;
      }
      goto LABEL_80;
    }
    if (a3 == 1815162994)
    {
      if (a4) {
        goto LABEL_56;
      }
      goto LABEL_54;
    }
    if (a3 == 1815491698)
    {
      if (a4) {
        goto LABEL_56;
      }
      goto LABEL_54;
    }
    unsigned __int16 v7 = 12848;
    goto LABEL_30;
  }
  if ((int)a3 <= 2019963439)
  {
    if (a3 == 2016686642) {
      goto LABEL_32;
    }
    unsigned __int16 v7 = 13364;
LABEL_30:
    int v11 = v7 | 0x78340000;
    goto LABEL_31;
  }
  if (a3 == 2019963440 || a3 == 2019963442) {
    goto LABEL_32;
  }
  int v11 = 2019963956;
LABEL_31:
  if (a3 == v11)
  {
LABEL_32:
    id v14 = [(HDRImageConverter_Metal *)self metalDevice];
    MTLPixelFormatGetInfoForDevice();

    if (a4 == 1) {
      uint64_t v10 = 60;
    }
    else {
      uint64_t v10 = 0;
    }
    if (!a4) {
      goto LABEL_54;
    }
LABEL_45:
    if (!v10)
    {
LABEL_56:
      if ((gIIODebugFlags & 0x300000) != 0)
      {
        uint64_t v16 = MEMORY[0x1E4F14390];
        if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * HIBYTE(a3) + 60) & 0x40000) != 0) {
          uint64_t v17 = HIBYTE(a3);
        }
        else {
          uint64_t v17 = 46;
        }
        unsigned int v18 = (int)(a3 << 8) >> 24;
        if (((a3 << 8) & 0x80000000) != 0) {
          int v19 = __maskrune((int)(a3 << 8) >> 24, 0x40000uLL);
        }
        else {
          int v19 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v18 + 60) & 0x40000;
        }
        if (v19) {
          uint64_t v20 = v18;
        }
        else {
          uint64_t v20 = 46;
        }
        unsigned int v21 = (__int16)a3 >> 8;
        if (((a3 << 16) & 0x80000000) != 0) {
          int v22 = __maskrune((__int16)a3 >> 8, 0x40000uLL);
        }
        else {
          int v22 = *(_DWORD *)(v16 + 4 * v21 + 60) & 0x40000;
        }
        if (v22) {
          uint64_t v23 = v21;
        }
        else {
          uint64_t v23 = 46;
        }
        if (a3 << 24 <= 0x7F000000) {
          int v24 = *(_DWORD *)(v16 + 4 * (char)a3 + 60) & 0x40000;
        }
        else {
          int v24 = __maskrune((char)a3, 0x40000uLL);
        }
        if (v24) {
          uint64_t v25 = (char)a3;
        }
        else {
          uint64_t v25 = 46;
        }
        ImageIOLog("☀️  metalPixelFormatForPixelFormat: '%c%c%c%c' plane: %u -> %lu\n", v17, v20, v23, v25, a4, 0);
      }
      return 0;
    }
LABEL_54:
    v15 = [(HDRImageConverter_Metal *)self metalDevice];
    MTLPixelFormatGetInfoForDevice();

    LogError("-[HDRImageConverter_Metal metalPixelFormatForPixelFormat:plane:]", 309, "Unsupported Metal pixel format: %lu");
    return 0;
  }
LABEL_80:
  if ((a3 & 0x80000000) != 0) {
    __maskrune((int)a3 >> 24, 0x40000uLL);
  }
  if (((a3 << 8) & 0x80000000) != 0) {
    __maskrune((int)(a3 << 8) >> 24, 0x40000uLL);
  }
  if (((a3 << 16) & 0x80000000) != 0) {
    __maskrune((__int16)a3 >> 8, 0x40000uLL);
  }
  if (a3 << 24 > 0x7F000000) {
    __maskrune((char)a3, 0x40000uLL);
  }
  LogError("-[HDRImageConverter_Metal metalPixelFormatForPixelFormat:plane:]", 304, "Unsupported pixel format: '%c%c%c%c'");
  return 0;
}

- (__CVBuffer)metalTextureFromBuffer:(__CVBuffer *)a3 plane:(unsigned int)a4
{
  result = [(HDRImageConverter_Metal *)self metalPixelFormatForPixelFormat:gFunc_CVPixelBufferGetPixelFormatType(a3) plane:*(void *)&a4];
  if (result)
  {
    uint64_t v8 = result;
    int v11 = 0;
    uint64_t WidthOfPlane = gFunc_CVPixelBufferGetWidthOfPlane(a3, a4);
    uint64_t HeightOfPlane = gFunc_CVPixelBufferGetHeightOfPlane(a3, a4);
    if (((uint64_t (*)(void, __CVMetalTextureCache *, __CVBuffer *, void, __CVBuffer *, uint64_t, uint64_t, void, __CVBuffer **))gFunc_CVMetalTextureCacheCreateTextureFromImage)(0, [(HDRImageConverter_Metal *)self metalTextureCache], a3, 0, v8, WidthOfPlane, HeightOfPlane, a4, &v11))
    {
      LogError("-[HDRImageConverter_Metal metalTextureFromBuffer:plane:]", 328, "Failed to create Metal texture");
      return 0;
    }
    else
    {
      return v11;
    }
  }
  return result;
}

- (id)metalTextureFromTableData:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  id v6 = objc_alloc_init(MEMORY[0x1E4F35338]);
  [v6 setTextureType:0];
  [v6 setPixelFormat:25];
  v5 >>= 1;
  [v6 setWidth:v5];
  [v6 setResourceOptions:0];
  [v6 setUsage:1];
  unsigned __int16 v7 = [(HDRImageConverter_Metal *)self metalDevice];
  uint64_t v8 = (void *)[v7 newTextureWithDescriptor:v6];

  memset(v11, 0, sizeof(v11));
  unint64_t v12 = v5;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  id v9 = v4;
  objc_msgSend(v8, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v11, 0, objc_msgSend(v9, "bytes", 0, 0, 0, v12, *(_OWORD *)&v13), objc_msgSend(v9, "length"));

  return v8;
}

- (id)metalTextureFromCubeData:(id)a3
{
  id v5 = a3;
  unint64_t v6 = vcvtas_u32_f32(cbrtf((float)((unint64_t)[v5 length] >> 3)));
  unint64_t v7 = v6 * v6;
  uint64_t v8 = 8 * v6;
  if (8 * v6 * v6 * v6 != [v5 length])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HDRImageConverter_Metal.mm", 350, @"Invalid grid size: %lu for cube data size: %lu", v6, objc_msgSend(v5, "length"));
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F35338]);
  [v9 setTextureType:7];
  [v9 setPixelFormat:115];
  [v9 setWidth:v6];
  [v9 setHeight:v6];
  [v9 setDepth:v6];
  [v9 setResourceOptions:0];
  [v9 setUsage:1];
  uint64_t v10 = [(HDRImageConverter_Metal *)self metalDevice];
  int v11 = (void *)[v10 newTextureWithDescriptor:v9];

  memset(v15, 0, 24);
  v15[3] = v6;
  v15[4] = v6;
  v15[5] = v6;
  id v12 = v5;
  objc_msgSend(v11, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v15, 0, 0, objc_msgSend(v12, "bytes"), v8, 8 * v7);

  return v11;
}

- (BOOL)commitAndWaitUntilCompleted:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__HDRImageConverter_Metal_commitAndWaitUntilCompleted___block_invoke;
  v6[3] = &unk_1E53C06E8;
  v6[4] = &v7;
  [v3 addCompletedHandler:v6];
  [v3 commit];
  [v3 waitUntilCompleted];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)computeThreadGroupSizeForOutputSize:(SEL)a3 pipelineState:(id *)a4
{
  id v21 = a5;
  unint64_t v7 = [v21 threadExecutionWidth];
  unint64_t v8 = [v21 maxTotalThreadsPerThreadgroup];
  unint64_t v9 = v8 / v7;
  retstr->var0 = v7;
  retstr->unint64_t var1 = v8 / v7;
  retstr->var2 = 1;
  if (v7 <= v8)
  {
    uint64_t v10 = 0;
    unint64_t var1 = a4->var1;
    unint64_t v12 = a4->var0 + v7;
    unint64_t v13 = -1;
    unint64_t v14 = -(uint64_t)(var1 * a4->var0);
    unint64_t v15 = -1;
    do
    {
      if (v7 + v10 <= v9) {
        unint64_t v16 = v9;
      }
      else {
        unint64_t v16 = v7 + v10;
      }
      if (v7 + v10 >= v9) {
        unint64_t v17 = v9;
      }
      else {
        unint64_t v17 = v7 + v10;
      }
      if (v14 + (var1 + v9 - 1) / v9 * v9 * (v12 + v10 - 1) / (v7 + v10) * (v7 + v10) <= v13)
      {
        unint64_t v18 = v16 / v17;
        if (v18 <= v15)
        {
          retstr->var0 = v7 + v10;
          retstr->unint64_t var1 = v9;
          unint64_t v15 = v18;
          unint64_t v13 = v14 + (var1 + v9 - 1) / v9 * v9 * (v12 + v10 - 1) / (v7 + v10) * (v7 + v10);
          retstr->var2 = 1;
        }
      }
      unint64_t v19 = 2 * v7 + v10;
      v10 += v7;
      unint64_t v9 = v8 / v19;
    }
    while (v7 + v10 <= v8);
  }

  return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)MEMORY[0x1F4181878]();
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)computeGridSizeForThreadGroupSize:(SEL)a3 outputSize:(id *)a4
{
  unint64_t v5 = (a5->var1 + a4->var1 - 1) / a4->var1;
  retstr->var0 = (a5->var0 + a4->var0 - 1) / a4->var0;
  retstr->unint64_t var1 = v5;
  retstr->var2 = 1;
  return self;
}

- (void)encodeInputImage:(__CVBuffer *)a3 transform:(id *)a4 toBuffer:(id)a5 offset:(unint64_t)a6 withArgumentEncoder:(id)a7 computeEncoder:(id)a8 index:(unint64_t)a9 textures:(id)a10
{
  id v33 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a10;
  int var0 = a4->var0;
  uint64_t v20 = [(HDRImageConverter_Metal *)self metalTextureFromBuffer:a3 plane:0];
  if (var0 == 2) {
    id v21 = [(HDRImageConverter_Metal *)self metalTextureFromBuffer:a3 plane:1];
  }
  else {
    id v21 = 0;
  }
  [v16 setArgumentBuffer:v33 offset:a6];
  if (v20)
  {
    int v22 = gFunc_CVMetalTextureGetTexture(v20);
  }
  else
  {
    int v22 = 0;
  }
  [v16 setTexture:v22 atIndex:1];
  if (v20) {

  }
  if (v21)
  {
    uint64_t v23 = gFunc_CVMetalTextureGetTexture(v21);
  }
  else
  {
    uint64_t v23 = 0;
  }
  [v16 setTexture:v23 atIndex:2];
  if (v21) {

  }
  int v24 = (_OWORD *)[v16 constantDataAtIndex:3];
  long long v25 = *(_OWORD *)&a4->var0;
  long long v26 = *(_OWORD *)&a4[4].var0;
  long long v27 = *(_OWORD *)&a4[12].var0;
  void v24[2] = *(_OWORD *)&a4[8].var0;
  v24[3] = v27;
  _OWORD *v24 = v25;
  v24[1] = v26;
  long long v28 = *(_OWORD *)&a4[16].var0;
  long long v29 = *(_OWORD *)&a4[20].var0;
  long long v30 = *(_OWORD *)&a4[28].var0;
  v24[6] = *(_OWORD *)&a4[24].var0;
  v24[7] = v30;
  v24[4] = v28;
  v24[5] = v29;
  [v17 setBuffer:v33 offset:a6 atIndex:a9];
  if (v20)
  {
    id v31 = gFunc_CVMetalTextureGetTexture(v20);
    [v17 useResource:v31 usage:1];

    [v18 addObject:v20];
  }
  if (v21)
  {
    id v32 = gFunc_CVMetalTextureGetTexture(v21);
    [v17 useResource:v32 usage:1];

    [v18 addObject:v21];
  }
}

- (void)encodeOutputImage:(__CVBuffer *)a3 transform:(id *)a4 toBuffer:(id)a5 offset:(unint64_t)a6 withArgumentEncoder:(id)a7 computeEncoder:(id)a8 index:(unint64_t)a9 textures:(id)a10
{
  id v32 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a10;
  int var0 = a4->var0;
  uint64_t v20 = [(HDRImageConverter_Metal *)self metalTextureFromBuffer:a3 plane:0];
  if (var0 == 2) {
    id v21 = [(HDRImageConverter_Metal *)self metalTextureFromBuffer:a3 plane:1];
  }
  else {
    id v21 = 0;
  }
  [v16 setArgumentBuffer:v32 offset:a6];
  if (v20)
  {
    int v22 = gFunc_CVMetalTextureGetTexture(v20);
  }
  else
  {
    int v22 = 0;
  }
  [v16 setTexture:v22 atIndex:1];
  if (v20) {

  }
  if (v21)
  {
    uint64_t v23 = gFunc_CVMetalTextureGetTexture(v21);
  }
  else
  {
    uint64_t v23 = 0;
  }
  [v16 setTexture:v23 atIndex:2];
  if (v21) {

  }
  int v24 = (_OWORD *)[v16 constantDataAtIndex:4];
  long long v25 = *(_OWORD *)&a4->var0;
  long long v26 = *(_OWORD *)&a4[8].var0;
  v24[1] = *(_OWORD *)&a4[4].var0;
  void v24[2] = v26;
  _OWORD *v24 = v25;
  long long v27 = *(_OWORD *)&a4[12].var0;
  long long v28 = *(_OWORD *)&a4[16].var0;
  long long v29 = *(_OWORD *)&a4[24].var0;
  v24[5] = *(_OWORD *)&a4[20].var0;
  v24[6] = v29;
  v24[3] = v27;
  v24[4] = v28;
  [v17 setBuffer:v32 offset:a6 atIndex:a9];
  if (v20)
  {
    long long v30 = gFunc_CVMetalTextureGetTexture(v20);
    [v17 useResource:v30 usage:2];

    [v18 addObject:v20];
  }
  if (v21)
  {
    id v31 = gFunc_CVMetalTextureGetTexture(v21);
    [v17 useResource:v31 usage:2];

    [v18 addObject:v21];
  }
}

- (void)encodeInputColorTransform:(id *)a3 toBuffer:(id)a4 offset:(unint64_t)a5 withArgumentEncoder:(id)a6 computeEncoder:(id)a7 index:(unint64_t)a8
{
  id v40 = a4;
  id v14 = a6;
  id v15 = a7;
  if (a3->var0.var0 == 6)
  {
    id v16 = [(HDRImageConverter_Metal *)self metalTextureFromTableData:*(void *)&a3->var1.var1.var3];
  }
  else
  {
    id v16 = 0;
  }
  if (LODWORD(a3->var1.var1.var7) == 5)
  {
    id v17 = [(HDRImageConverter_Metal *)self metalTextureFromTableData:a3->var1.var4.var2];
  }
  else
  {
    id v17 = 0;
  }
  if (LODWORD(a3->var1.var1.var7) == 6)
  {
    id v18 = [(HDRImageConverter_Metal *)self metalTextureFromCubeData:a3->var1.var4.var2];
  }
  else
  {
    id v18 = 0;
  }
  if (LODWORD(a3[1].var1.var1.var3) == 6)
  {
    unint64_t v19 = [(HDRImageConverter_Metal *)self metalTextureFromTableData:*(void *)&a3[1].var1.var4.var1.var5];
  }
  else
  {
    unint64_t v19 = 0;
  }
  [v14 setArgumentBuffer:v40 offset:a5];
  int var0 = a3->var0.var0;
  *(_DWORD *)[v14 constantDataAtIndex:1] = var0;
  id v21 = (_OWORD *)[v14 constantDataAtIndex:2];
  long long v22 = *(_OWORD *)&a3->var0.var1.var3;
  long long v23 = *(_OWORD *)&a3->var1.var0;
  v21[1] = *(_OWORD *)&a3->var0.var1.var7;
  v21[2] = v23;
  *id v21 = v22;
  [v14 setTexture:v16 atIndex:11];
  float var7 = a3->var1.var1.var7;
  *(float *)[v14 constantDataAtIndex:12] = var7;
  long long v25 = (_OWORD *)[v14 constantDataAtIndex:13];
  long long v26 = *(_OWORD *)&a3->var1.var3.var1;
  long long v27 = *(_OWORD *)&a3->var1.var4.var1.var5;
  v25[1] = *(_OWORD *)&a3->var1.var4.var1.var1;
  v25[2] = v27;
  *long long v25 = v26;
  long long v28 = (_OWORD *)[v14 constantDataAtIndex:22];
  long long v29 = *(_OWORD *)&a3[1].var0.var0;
  long long v30 = *(_OWORD *)&a3[1].var0.var1.var3;
  long long v31 = *(_OWORD *)&a3[1].var1.var0;
  v28[2] = *(_OWORD *)&a3[1].var0.var1.var7;
  v28[3] = v31;
  _OWORD *v28 = v29;
  v28[1] = v30;
  [v14 setTexture:v17 atIndex:24];
  [v14 setTexture:v18 atIndex:25];
  float var3 = a3[1].var1.var1.var3;
  *(float *)[v14 constantDataAtIndex:26] = var3;
  id v33 = (_OWORD *)[v14 constantDataAtIndex:27];
  long long v34 = *(_OWORD *)&a3[1].var1.var1.var7;
  long long v35 = *(_OWORD *)&a3[1].var1.var4.var1.var1;
  v33[1] = *(_OWORD *)&a3[1].var1.var3.var1;
  void v33[2] = v35;
  *id v33 = v34;
  [v14 setTexture:v19 atIndex:36];
  id v36 = (_OWORD *)[v14 constantDataAtIndex:37];
  long long v37 = *(_OWORD *)&a3[1].var1.var4.var2;
  long long v38 = *(_OWORD *)&a3[2].var0.var0;
  long long v39 = *(_OWORD *)&a3[2].var0.var1.var7;
  v36[2] = *(_OWORD *)&a3[2].var0.var1.var3;
  v36[3] = v39;
  *id v36 = v37;
  v36[1] = v38;
  [v15 setBuffer:v40 offset:a5 atIndex:a8];
  if (v16) {
    [v15 useResource:v16 usage:1];
  }
  if (v17) {
    [v15 useResource:v17 usage:1];
  }
  if (v18) {
    [v15 useResource:v18 usage:1];
  }
  if (v19) {
    [v15 useResource:v19 usage:1];
  }
}

- (void)encodeOutputColorTransform:(id *)a3 toBuffer:(id)a4 offset:(unint64_t)a5 withArgumentEncoder:(id)a6 computeEncoder:(id)a7 index:(unint64_t)a8
{
  id v37 = a4;
  id v14 = a6;
  id v15 = a7;
  if (a3->var1.var4.var0 == 5)
  {
    id v16 = [(HDRImageConverter_Metal *)self metalTextureFromTableData:*(void *)&a3->var2.var1.var3];
  }
  else
  {
    id v16 = 0;
  }
  [v14 setArgumentBuffer:v37 offset:a5];
  id v17 = (_OWORD *)[v14 constantDataAtIndex:1];
  long long v18 = *(_OWORD *)&a3->var0.var1;
  long long v19 = *(_OWORD *)&a3->var1.var1.var1;
  long long v20 = *(_OWORD *)&a3->var1.var2;
  v17[2] = *(_OWORD *)&a3->var1.var1.var5;
  v17[3] = v20;
  *id v17 = v18;
  v17[1] = v19;
  int var0 = a3->var1.var4.var0;
  *(_DWORD *)[v14 constantDataAtIndex:3] = var0;
  long long v22 = (_OWORD *)[v14 constantDataAtIndex:4];
  long long v23 = *(_OWORD *)&a3->var1.var4.var1.var3;
  long long v24 = *(_OWORD *)&a3->var2.var0;
  v22[1] = *(_OWORD *)&a3->var1.var4.var1.var7;
  v22[2] = v24;
  _OWORD *v22 = v23;
  long long v25 = (_OWORD *)[v14 constantDataAtIndex:13];
  long long v26 = *(_OWORD *)&a3->var2.var1.var7;
  long long v27 = *(_OWORD *)&a3[1].var0.var1;
  long long v28 = *(_OWORD *)&a3[1].var1.var1.var5;
  v25[2] = *(_OWORD *)&a3[1].var1.var1.var1;
  v25[3] = v28;
  *long long v25 = v26;
  v25[1] = v27;
  [v14 setTexture:v16 atIndex:15];
  long long v29 = (_OWORD *)[v14 constantDataAtIndex:17];
  _OWORD *v29 = *(_OWORD *)&a3[1].var1.var2;
  long long v30 = *(_OWORD *)&a3[1].var1.var4.var0;
  long long v31 = *(_OWORD *)&a3[1].var1.var4.var1.var3;
  long long v32 = *(_OWORD *)&a3[1].var2.var0;
  v29[3] = *(_OWORD *)&a3[1].var1.var4.var1.var7;
  v29[4] = v32;
  v29[1] = v30;
  v29[2] = v31;
  id v33 = (_OWORD *)[v14 constantDataAtIndex:28];
  *id v33 = *(_OWORD *)&a3[1].var2.var1.var3;
  long long v34 = *(_OWORD *)&a3[1].var2.var1.var7;
  long long v35 = *(_OWORD *)&a3[2].var0.var1;
  long long v36 = *(_OWORD *)&a3[2].var1.var1.var5;
  v33[3] = *(_OWORD *)&a3[2].var1.var1.var1;
  v33[4] = v36;
  v33[1] = v34;
  void v33[2] = v35;
  [v15 setBuffer:v37 offset:a5 atIndex:a8];
  if (v16) {
    [v15 useResource:v16 usage:1];
  }
}

- (void)encodeInputGainTransform:(id *)a3 toBuffer:(id)a4 offset:(unint64_t)a5 withArgumentEncoder:(id)a6 computeEncoder:(id)a7 index:(unint64_t)a8
{
  id v16 = a4;
  id v13 = a6;
  id v14 = a7;
  long long v21 = *(_OWORD *)&a3[8].var0.var0;
  long long v22 = *(_OWORD *)&a3[10].var0.var0;
  long long v17 = *(_OWORD *)&a3->var0.var0;
  long long v18 = *(_OWORD *)&a3[2].var0.var0;
  long long v19 = *(_OWORD *)&a3[4].var0.var0;
  long long v20 = *(_OWORD *)&a3[6].var0.var0;
  long long v26 = *(_OWORD *)&a3[18].var0.var0;
  long long v27 = *(_OWORD *)&a3[20].var0.var0;
  long long v24 = *(_OWORD *)&a3[14].var0.var0;
  long long v25 = *(_OWORD *)&a3[16].var0.var0;
  long long v23 = *(_OWORD *)&a3[12].var0.var0;
  [v13 setArgumentBuffer:v16 offset:a5];
  id v15 = (_OWORD *)[v13 constantDataAtIndex:1];
  v15[8] = v25;
  v15[9] = v26;
  v15[10] = v27;
  v15[4] = v21;
  v15[5] = v22;
  void v15[6] = v23;
  v15[7] = v24;
  _OWORD *v15 = v17;
  v15[1] = v18;
  v15[2] = v19;
  v15[3] = v20;
  [v14 setBuffer:v16 offset:a5 atIndex:a8];
}

- (void)encodeOutputGainTransform:(id *)a3 toBuffer:(id)a4 offset:(unint64_t)a5 withArgumentEncoder:(id)a6 computeEncoder:(id)a7 index:(unint64_t)a8
{
  id v18 = a4;
  id v13 = a6;
  id v14 = a7;
  long long v23 = *(_OWORD *)&a3[8].var0.var0;
  long long v24 = *(_OWORD *)&a3[10].var0.var0;
  long long v19 = *(_OWORD *)&a3->var0.var0;
  long long v20 = *(_OWORD *)&a3[2].var0.var0;
  long long v21 = *(_OWORD *)&a3[4].var0.var0;
  long long v22 = *(_OWORD *)&a3[6].var0.var0;
  long long v28 = *(_OWORD *)&a3[18].var0.var0;
  long long v29 = *(_OWORD *)&a3[20].var0.var0;
  long long v26 = *(_OWORD *)&a3[14].var0.var0;
  long long v27 = *(_OWORD *)&a3[16].var0.var0;
  long long v25 = *(_OWORD *)&a3[12].var0.var0;
  $D79CC1B1AE515C1FB7988FA1E5926177 v15 = a3[22];
  long long v17 = *(_OWORD *)&a3[24].var0.var0;
  [v13 setArgumentBuffer:v18 offset:a5];
  uint64_t v16 = [v13 constantDataAtIndex:2];
  *(_OWORD *)(v16 + 128) = v27;
  *(_OWORD *)(v16 + 144) = v28;
  *(_OWORD *)(v16 + 160) = v29;
  *(_OWORD *)(v16 + 64) = v23;
  *(_OWORD *)(v16 + 80) = v24;
  *(_OWORD *)(v16 + 96) = v25;
  *(_OWORD *)(v16 + 112) = v26;
  *(_OWORD *)uint64_t v16 = v19;
  *(_OWORD *)(v16 + 16) = v20;
  *(_OWORD *)(v16 + 32) = v21;
  *(_OWORD *)(v16 + 48) = v22;
  *($D79CC1B1AE515C1FB7988FA1E5926177 *)(v16 + 176) = v15;
  *(void *)(v16 + 184) = 0;
  *(_OWORD *)(v16 + 192) = v17;
  *(void *)(v16 + 208) = 0;
  *(void *)(v16 + 216) = 0;
  [v14 setBuffer:v18 offset:a5 atIndex:a8];
}

- (BOOL)isPixelFormatSupported:(unsigned int)a3
{
  return [(HDRImageConverter_Metal *)self metalPixelFormatForPixelFormat:*(void *)&a3 plane:0] != 0;
}

- (BOOL)canUseImageBlocks
{
  id v2 = [(HDRImageConverter_Metal *)self metalDevice];
  char v3 = [v2 supportsFamily:1004];

  return v3;
}

- (id)conversionFunctionWithName:(id)a3 subsampling:
{
  char v4 = v3;
  unint64_t v6 = (__CFString *)a3;
  char v20 = 0;
  int v19 = *v4;
  if ([(__CFString *)v6 isEqualToString:@"convert_image_to_image"])
  {
    unint64_t v7 = [(HDRImageConverter_Metal *)self metalDevice];
    char v8 = [v7 supportsFamily:1001];

    if (v8)
    {

      int v19 = *v4;
      unint64_t v9 = @"xdr::convert_image_to_image_loop";
    }
    else
    {
      char v20 = 1;

      *char v4 = 65537;
      unint64_t v9 = @"xdr::convert_image_to_image_reduce";
    }
  }
  else if ([(__CFString *)v6 isEqualToString:@"convert_gainmap_image_to_image"])
  {
    uint64_t v10 = [(HDRImageConverter_Metal *)self metalDevice];
    char v11 = [v10 supportsFamily:1001];

    if (v11)
    {

      int v19 = *v4;
      unint64_t v9 = @"xdr::convert_gainmap_image_to_image_loop";
    }
    else
    {
      char v20 = 1;

      *char v4 = 65537;
      unint64_t v9 = @"xdr::convert_gainmap_image_to_image_reduce";
    }
  }
  else if ([(__CFString *)v6 isEqualToString:@"convert_image_to_gainmap_image"])
  {
    unint64_t v12 = [(HDRImageConverter_Metal *)self metalDevice];
    char v13 = [v12 supportsFamily:5001];

    if (v13)
    {
      *char v4 = 65537;
      unint64_t v9 = @"xdr::convert_image_to_gainmap_image_reduce";
    }
    else
    {
      int v19 = *v4;
      unint64_t v9 = @"xdr::convert_image_to_gainmap_image_loop";
    }
  }
  else if ([(__CFString *)v6 isEqualToString:@"convert_gainmap_image_to_gainmap_image"])
  {
    id v14 = [(HDRImageConverter_Metal *)self metalDevice];
    char v15 = [v14 supportsFamily:5001];

    if (v15)
    {
      *char v4 = 65537;
      unint64_t v9 = @"xdr::convert_gainmap_image_to_gainmap_image_reduce";
    }
    else
    {
      int v19 = *v4;
      unint64_t v9 = @"xdr::convert_gainmap_image_to_gainmap_image_loop";
    }
  }
  else
  {
    unint64_t v9 = v6;
    if ([(__CFString *)v6 isEqualToString:@"compute_luma_gain_histogram"])
    {

      *char v4 = 524296;
      int v19 = 131074;
      unint64_t v9 = @"xdr::compute_luma_gain_histogram_8x8";
    }
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F35230]);
  [v16 setConstantValue:&v19 type:42 atIndex:1];
  [v16 setConstantValue:&v20 type:53 atIndex:2];
  long long v17 = [(HDRImageConverter_Metal *)self metalLibraryFunctionWithName:v9 functionConstant:v16];

  return v17;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 toImage:(__CVBuffer *)a5 transform:(id *)a6
{
  uint32x4_t v7 = vmovl_u16(vmax_u16((uint16x4_t)vdup_lane_s16(*(int16x4_t *)&a6[2].var0.var2.var1.var3, 0).u32[0], (uint16x4_t)vext_s8(*(int8x8_t *)&a6[2].var0.var2.var1.var3, *(int8x8_t *)&a6[2].var0.var2.var1.var3, 2uLL).u32[0]));
  unsigned __int16 v75 = v7.u16[2];
  unsigned __int16 v74 = v7.i16[0];
  char v8 = [(HDRImageConverter_Metal *)self conversionFunctionWithName:@"convert_image_to_image" subsampling:&v74];
  if (v8)
  {
    v53 = v8;
    v58 = [(HDRImageConverter_Metal *)self metalComputePipelineStateWithFunction:v8];
    if (v58)
    {
      v46 = [(HDRImageConverter_Metal *)self metalCommandQueue];
      v45 = [v46 commandBuffer];
      v49 = [v45 computeCommandEncoder];
      [v49 setComputePipelineState:v58];
      id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v48 = (void *)[v53 newArgumentEncoderWithBufferIndex:1];
      v47 = (void *)[v53 newArgumentEncoderWithBufferIndex:2];
      v52 = (void *)[v53 newArgumentEncoderWithBufferIndex:5];
      v44 = (void *)[v53 newArgumentEncoderWithBufferIndex:7];
      uint64_t v43 = [v48 alignment];
      uint64_t v42 = [v48 encodedLength];
      uint64_t v41 = [v48 alignment];
      unint64_t v40 = [v48 alignment];
      uint64_t v39 = [v47 alignment];
      uint64_t v38 = [v47 encodedLength];
      uint64_t v37 = [v47 alignment];
      unint64_t v9 = [v47 alignment];
      uint64_t v36 = [v52 alignment];
      uint64_t v35 = [v52 encodedLength];
      uint64_t v10 = [v52 alignment];
      unint64_t v11 = [v52 alignment];
      uint64_t v12 = [v44 alignment];
      uint64_t v13 = [v44 encodedLength];
      uint64_t v14 = [v44 alignment];
      unint64_t v15 = [v44 alignment];
      id v16 = [(HDRImageConverter_Metal *)self metalDevice];
      unint64_t v17 = (v42 + v41 - 1) / v40 * v43;
      unint64_t v18 = v17 + (v38 + v37 - 1) / v9 * v39;
      unint64_t v19 = v18 + (v35 + v10 - 1) / v11 * v36;
      char v20 = (void *)[v16 newBufferWithLength:v19 + (v13 + v14 - 1) / v15 * v12 options:0];

      [(HDRImageConverter_Metal *)self encodeInputImage:a3 transform:a4 toBuffer:v20 offset:0 withArgumentEncoder:v48 computeEncoder:v49 index:1 textures:v51];
      [(HDRImageConverter_Metal *)self encodeOutputImage:a5 transform:&a6[2].var0.var1.var1.var5 toBuffer:v20 offset:v17 withArgumentEncoder:v47 computeEncoder:v49 index:2 textures:v51];
      [(HDRImageConverter_Metal *)self encodeInputColorTransform:&a4->var1.var1.var4.var1.var3 toBuffer:v20 offset:v18 withArgumentEncoder:v52 computeEncoder:v49 index:5];
      [(HDRImageConverter_Metal *)self encodeOutputColorTransform:a6 toBuffer:v20 offset:v19 withArgumentEncoder:v44 computeEncoder:v49 index:7];
      LODWORD(v11) = gFunc_CVPixelBufferGetWidth(a5);
      unsigned int Height = gFunc_CVPixelBufferGetHeight(a5);
      v22.i32[0] = v74;
      v22.i32[1] = v75;
      int8x8_t v57 = (int8x8_t)__PAIR64__(Height, v11);
      int8x8_t v23 = vand_s8((int8x8_t)vadd_s32((int32x2_t)__PAIR64__(Height, v11), vadd_s32(v22, (int32x2_t)-1)), (int8x8_t)0xFFFF0000FFFFLL);
      unsigned __int16 v73 = v23.i32[1] / v75;
      unsigned __int16 v72 = v23.i32[0] / v74;
      [v49 setBytes:&v72 length:4 atIndex:13];
      float32x2_t v24 = vadd_f32((float32x2_t)vorr_s8(vand_s8(v57, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
      __asm { FMOV            V1.2S, #1.0 }
      *(float32x2_t *)&long long v30 = vdiv_f32(_D1, v24);
      *((float32x2_t *)&v30 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v24);
      long long v71 = v30;
      [v49 setBytes:&v71 length:16 atIndex:14];
      uint64_t v31 = v72;
      uint64_t v32 = v73;
      long long v69 = 0uLL;
      uint64_t v70 = 0;
      v68[0] = v72;
      v68[1] = v73;
      v68[2] = 1;
      [(HDRImageConverter_Metal *)self computeThreadGroupSizeForOutputSize:v68 pipelineState:v58];
      long long v66 = 0uLL;
      uint64_t v67 = 0;
      long long v64 = v69;
      uint64_t v65 = v70;
      v63[0] = v31;
      v63[1] = v32;
      v63[2] = 1;
      [(HDRImageConverter_Metal *)self computeGridSizeForThreadGroupSize:&v64 outputSize:v63];
      long long v61 = v66;
      uint64_t v62 = v67;
      long long v59 = v69;
      uint64_t v60 = v70;
      [v49 dispatchThreadgroups:&v61 threadsPerThreadgroup:&v59];
      [v49 endEncoding];
      BOOL v33 = [(HDRImageConverter_Metal *)self commitAndWaitUntilCompleted:v45];
    }
    else
    {
      BOOL v33 = 0;
    }

    char v8 = v53;
  }
  else
  {
    BOOL v33 = 0;
  }

  return v33;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 gainMap:(__CVBuffer *)a5 transform:(id *)a6 toImage:(__CVBuffer *)a7 transform:(id *)a8
{
  uint32x4_t v10 = vmovl_u16(vmax_u16((uint16x4_t)vdup_lane_s16(*(int16x4_t *)&a8[2].var0.var2.var1.var3, 0).u32[0], (uint16x4_t)vext_s8(*(int8x8_t *)&a8[2].var0.var2.var1.var3, *(int8x8_t *)&a8[2].var0.var2.var1.var3, 2uLL).u32[0]));
  unsigned __int16 v91 = v10.u16[2];
  unsigned __int16 v90 = v10.i16[0];
  unint64_t v11 = [(HDRImageConverter_Metal *)self conversionFunctionWithName:@"convert_gainmap_image_to_image" subsampling:&v90];
  if (v11)
  {
    v68 = v11;
    unsigned __int16 v74 = [(HDRImageConverter_Metal *)self metalComputePipelineStateWithFunction:v11];
    if (v74)
    {
      v58 = [(HDRImageConverter_Metal *)self metalCommandQueue];
      int8x8_t v57 = [v58 commandBuffer];
      v63 = [v57 computeCommandEncoder];
      [v63 setComputePipelineState:v74];
      id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v66 = (void *)[v68 newArgumentEncoderWithBufferIndex:1];
      uint64_t v62 = (void *)[v68 newArgumentEncoderWithBufferIndex:2];
      uint64_t v67 = (void *)[v68 newArgumentEncoderWithBufferIndex:5];
      long long v61 = (void *)[v68 newArgumentEncoderWithBufferIndex:8];
      uint64_t v60 = (void *)[v68 newArgumentEncoderWithBufferIndex:7];
      uint64_t v55 = [v66 alignment];
      uint64_t v54 = [v66 encodedLength];
      uint64_t v53 = [v66 alignment];
      unint64_t v52 = [v66 alignment];
      uint64_t v51 = [v66 alignment];
      uint64_t v50 = [v66 encodedLength];
      uint64_t v49 = [v66 alignment];
      unint64_t v48 = [v66 alignment];
      uint64_t v47 = [v62 alignment];
      uint64_t v46 = [v62 encodedLength];
      uint64_t v45 = [v62 alignment];
      unint64_t v12 = [v62 alignment];
      uint64_t v44 = [v67 alignment];
      uint64_t v43 = [v67 encodedLength];
      uint64_t v42 = [v67 alignment];
      unint64_t v41 = [v67 alignment];
      uint64_t v40 = [v61 alignment];
      uint64_t v39 = [v61 encodedLength];
      uint64_t v38 = [v61 alignment];
      unint64_t v13 = [v61 alignment];
      uint64_t v14 = [v60 alignment];
      uint64_t v15 = [v60 encodedLength];
      uint64_t v16 = [v60 alignment];
      unint64_t v17 = [v60 alignment];
      long long v59 = a7;
      unint64_t v18 = [(HDRImageConverter_Metal *)self metalDevice];
      unint64_t v19 = (v54 + v53 - 1) / v52 * v55;
      unint64_t v20 = v19 + (v50 + v49 - 1) / v48 * v51;
      unint64_t v21 = v20 + (v46 + v45 - 1) / v12 * v47;
      unint64_t v56 = v21 + (v43 + v42 - 1) / v41 * v44;
      uint64_t v22 = v56 + (v39 + v38 - 1) / v13 * v40;
      int8x8_t v23 = (void *)[v18 newBufferWithLength:v22 + (v15 + v16 - 1) / v17 * v14 options:0];

      [(HDRImageConverter_Metal *)self encodeInputImage:a3 transform:a4 toBuffer:v23 offset:0 withArgumentEncoder:v66 computeEncoder:v63 index:1 textures:v73];
      [(HDRImageConverter_Metal *)self encodeInputImage:a5 transform:a6 toBuffer:v23 offset:v19 withArgumentEncoder:v66 computeEncoder:v63 index:3 textures:v73];
      [(HDRImageConverter_Metal *)self encodeOutputImage:v59 transform:&a8[2].var0.var1.var1.var5 toBuffer:v23 offset:v20 withArgumentEncoder:v62 computeEncoder:v63 index:2 textures:v73];
      [(HDRImageConverter_Metal *)self encodeInputColorTransform:&a4->var1.var1.var4.var1.var3 toBuffer:v23 offset:v21 withArgumentEncoder:v67 computeEncoder:v63 index:5];
      [(HDRImageConverter_Metal *)self encodeInputGainTransform:&a6[10].var1.var1 toBuffer:v23 offset:v56 withArgumentEncoder:v61 computeEncoder:v63 index:8];
      [(HDRImageConverter_Metal *)self encodeOutputColorTransform:a8 toBuffer:v23 offset:v22 withArgumentEncoder:v60 computeEncoder:v63 index:7];
      LODWORD(v18) = gFunc_CVPixelBufferGetWidth(v59);
      unsigned int Height = gFunc_CVPixelBufferGetHeight(v59);
      v25.i32[0] = v90;
      v25.i32[1] = v91;
      int8x8_t v72 = (int8x8_t)__PAIR64__(Height, v18);
      int8x8_t v26 = vand_s8((int8x8_t)vadd_s32((int32x2_t)__PAIR64__(Height, v18), vadd_s32(v25, (int32x2_t)-1)), (int8x8_t)0xFFFF0000FFFFLL);
      unsigned __int16 v89 = v26.i32[1] / v91;
      unsigned __int16 v88 = v26.i32[0] / v90;
      [v63 setBytes:&v88 length:4 atIndex:13];
      float32x2_t v27 = vadd_f32((float32x2_t)vorr_s8(vand_s8(v72, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
      __asm { FMOV            V1.2S, #1.0 }
      *(float32x2_t *)&long long v33 = vdiv_f32(_D1, v27);
      *((float32x2_t *)&v33 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v27);
      long long v87 = v33;
      [v63 setBytes:&v87 length:16 atIndex:14];
      uint64_t v34 = v88;
      uint64_t v35 = v89;
      long long v85 = 0uLL;
      uint64_t v86 = 0;
      v84[0] = v88;
      v84[1] = v89;
      v84[2] = 1;
      [(HDRImageConverter_Metal *)self computeThreadGroupSizeForOutputSize:v84 pipelineState:v74];
      long long v82 = 0uLL;
      uint64_t v83 = 0;
      long long v80 = v85;
      uint64_t v81 = v86;
      v79[0] = v34;
      v79[1] = v35;
      v79[2] = 1;
      [(HDRImageConverter_Metal *)self computeGridSizeForThreadGroupSize:&v80 outputSize:v79];
      long long v77 = v82;
      uint64_t v78 = v83;
      long long v75 = v85;
      uint64_t v76 = v86;
      [v63 dispatchThreadgroups:&v77 threadsPerThreadgroup:&v75];
      [v63 endEncoding];
      BOOL v36 = [(HDRImageConverter_Metal *)self commitAndWaitUntilCompleted:v57];
    }
    else
    {
      BOOL v36 = 0;
    }

    unint64_t v11 = v68;
  }
  else
  {
    BOOL v36 = 0;
  }

  return v36;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 toImage:(__CVBuffer *)a6 transform:(id *)a7 gainMap:(__CVBuffer *)a8 transform:(id *)a9
{
  uint16x4_t v11 = *(uint16x4_t *)&a7[2].var0.var2.var1.var3;
  v11.i16[3] = 0;
  uint16x4_t v12 = *(uint16x4_t *)&a9[26].var1.var0;
  v12.i16[3] = 0;
  int16x4_t v13 = (int16x4_t)vmax_u16(v11, v12);
  uint32x4_t v14 = vmovl_u16(vmax_u16((uint16x4_t)vdup_lane_s16(v13, 0).u32[0], (uint16x4_t)vext_s8((int8x8_t)v13, (int8x8_t)v13, 2uLL).u32[0]));
  unsigned __int16 v98 = v14.u16[2];
  unsigned __int16 v97 = v14.i16[0];
  uint64_t v15 = [(HDRImageConverter_Metal *)self conversionFunctionWithName:@"convert_image_to_gainmap_image" subsampling:&v97];
  long long v80 = (void *)v15;
  if (v15)
  {
    uint64_t v81 = [(HDRImageConverter_Metal *)self metalComputePipelineStateWithFunction:v15];
    if (v81)
    {
      long long v66 = [(HDRImageConverter_Metal *)self metalCommandQueue];
      uint64_t v65 = [v66 commandBuffer];
      long long v69 = [v65 computeCommandEncoder];
      [v69 setComputePipelineState:v81];
      id v78 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v68 = (void *)[(id)v15 newArgumentEncoderWithBufferIndex:1];
      unsigned __int16 v74 = (void *)[(id)v15 newArgumentEncoderWithBufferIndex:2];
      v79 = (void *)[(id)v15 newArgumentEncoderWithBufferIndex:5];
      id v73 = (void *)[(id)v15 newArgumentEncoderWithBufferIndex:7];
      long long v64 = (void *)[(id)v15 newArgumentEncoderWithBufferIndex:10];
      uint64_t v62 = [v68 alignment];
      uint64_t v60 = [v68 encodedLength];
      uint64_t v59 = [v68 alignment];
      unint64_t v58 = [v68 alignment];
      uint64_t v57 = [v74 alignment];
      uint64_t v56 = [v74 encodedLength];
      uint64_t v55 = [v74 alignment];
      unint64_t v54 = [v74 alignment];
      uint64_t v53 = [v74 alignment];
      uint64_t v52 = [v74 encodedLength];
      uint64_t v51 = [v74 alignment];
      unint64_t v50 = [v74 alignment];
      uint64_t v49 = [v79 alignment];
      uint64_t v48 = [v79 encodedLength];
      uint64_t v47 = [v79 alignment];
      unint64_t v46 = [v79 alignment];
      uint64_t v45 = [v79 alignment];
      uint64_t v44 = [v79 encodedLength];
      uint64_t v43 = [v79 alignment];
      unint64_t v42 = [v79 alignment];
      uint64_t v41 = [v73 alignment];
      uint64_t v40 = [v73 encodedLength];
      uint64_t v39 = [v73 alignment];
      unint64_t v16 = [v73 alignment];
      uint64_t v17 = [v64 alignment];
      uint64_t v18 = [v64 encodedLength];
      uint64_t v19 = [v64 alignment];
      unint64_t v20 = [v64 alignment];
      uint64_t v67 = a6;
      unint64_t v21 = [(HDRImageConverter_Metal *)self metalDevice];
      unint64_t v22 = (v60 + v59 - 1) / v58 * v62;
      unint64_t v23 = v22 + (v56 + v55 - 1) / v54 * v57;
      unint64_t v24 = v23 + (v52 + v51 - 1) / v50 * v53;
      unint64_t v63 = v24 + (v48 + v47 - 1) / v46 * v49;
      uint64_t v61 = v63 + (v44 + v43 - 1) / v42 * v45;
      uint64_t v25 = v61 + (v40 + v39 - 1) / v16 * v41;
      int8x8_t v26 = (void *)[v21 newBufferWithLength:v25 + (v18 + v19 - 1) / v20 * v17 options:0];

      [(HDRImageConverter_Metal *)self encodeInputImage:a3 transform:a4 toBuffer:v26 offset:0 withArgumentEncoder:v68 computeEncoder:v69 index:1 textures:v78];
      [(HDRImageConverter_Metal *)self encodeOutputImage:v67 transform:&a7[2].var0.var1.var1.var5 toBuffer:v26 offset:v22 withArgumentEncoder:v74 computeEncoder:v69 index:2 textures:v78];
      [(HDRImageConverter_Metal *)self encodeOutputImage:a8 transform:&a9[18].var1 toBuffer:v26 offset:v23 withArgumentEncoder:v74 computeEncoder:v69 index:4 textures:v78];
      [(HDRImageConverter_Metal *)self encodeInputColorTransform:&a4->var1.var1.var4.var1.var3 toBuffer:v26 offset:v24 withArgumentEncoder:v79 computeEncoder:v69 index:5];
      [(HDRImageConverter_Metal *)self encodeInputColorTransform:&a5->var1.var1.var4.var1.var3 toBuffer:v26 offset:v63 withArgumentEncoder:v79 computeEncoder:v69 index:6];
      [(HDRImageConverter_Metal *)self encodeOutputColorTransform:a7 toBuffer:v26 offset:v61 withArgumentEncoder:v73 computeEncoder:v69 index:7];
      [(HDRImageConverter_Metal *)self encodeOutputGainTransform:a9 toBuffer:v26 offset:v25 withArgumentEncoder:v64 computeEncoder:v69 index:10];
      LODWORD(v24) = gFunc_CVPixelBufferGetWidth(v67);
      unsigned int Height = gFunc_CVPixelBufferGetHeight(v67);
      v28.i32[0] = v97;
      v28.i32[1] = v98;
      int8x8_t v77 = (int8x8_t)__PAIR64__(Height, v24);
      int8x8_t v29 = vand_s8((int8x8_t)vadd_s32((int32x2_t)__PAIR64__(Height, v24), vadd_s32(v28, (int32x2_t)-1)), (int8x8_t)0xFFFF0000FFFFLL);
      unsigned __int16 v96 = v29.i32[1] / v98;
      unsigned __int16 v95 = v29.i32[0] / v97;
      [v69 setBytes:&v95 length:4 atIndex:13];
      float32x2_t v30 = vadd_f32((float32x2_t)vorr_s8(vand_s8(v77, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
      __asm { FMOV            V1.2S, #1.0 }
      *(float32x2_t *)&long long v36 = vdiv_f32(_D1, v30);
      *((float32x2_t *)&v36 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v30);
      long long v94 = v36;
      [v69 setBytes:&v94 length:16 atIndex:14];
      uint64_t v15 = v95;
      uint64_t v37 = v96;
      long long v92 = 0uLL;
      uint64_t v93 = 0;
      v91[0] = v95;
      v91[1] = v96;
      v91[2] = 1;
      [(HDRImageConverter_Metal *)self computeThreadGroupSizeForOutputSize:v91 pipelineState:v81];
      long long v89 = 0uLL;
      uint64_t v90 = 0;
      long long v87 = v92;
      uint64_t v88 = v93;
      v86[0] = v15;
      v86[1] = v37;
      v86[2] = 1;
      [(HDRImageConverter_Metal *)self computeGridSizeForThreadGroupSize:&v87 outputSize:v86];
      long long v84 = v89;
      uint64_t v85 = v90;
      long long v82 = v92;
      uint64_t v83 = v93;
      [v69 dispatchThreadgroups:&v84 threadsPerThreadgroup:&v82];
      [v69 endEncoding];
      LOBYTE(v15) = [(HDRImageConverter_Metal *)self commitAndWaitUntilCompleted:v65];
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  return v15;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 gainMap:(__CVBuffer *)a6 transform:(id *)a7 alternate:(id *)a8 toImage:(__CVBuffer *)a9 transform:(id *)a10 gainMap:(__CVBuffer *)a11 transform:(id *)a12
{
  uint16x4_t v13 = *(uint16x4_t *)&a10[2].var0.var2.var1.var3;
  v13.i16[3] = 0;
  uint16x4_t v14 = *(uint16x4_t *)&a12[26].var1.var0;
  v14.i16[3] = 0;
  int16x4_t v15 = (int16x4_t)vmax_u16(v13, v14);
  uint32x4_t v16 = vmovl_u16(vmax_u16((uint16x4_t)vdup_lane_s16(v15, 0).u32[0], (uint16x4_t)vext_s8((int8x8_t)v15, (int8x8_t)v15, 2uLL).u32[0]));
  unsigned __int16 v123 = v16.u16[2];
  unsigned __int16 v122 = v16.i16[0];
  uint64_t v17 = [(HDRImageConverter_Metal *)self conversionFunctionWithName:@"convert_gainmap_image_to_gainmap_image" subsampling:&v122];
  if (v17)
  {
    long long v94 = v17;
    v104 = [(HDRImageConverter_Metal *)self metalComputePipelineStateWithFunction:v17];
    if (v104)
    {
      long long v89 = [(HDRImageConverter_Metal *)self metalCommandQueue];
      uint64_t v88 = [v89 commandBuffer];
      v105 = [v88 computeCommandEncoder];
      [v105 setComputePipelineState:v104];
      id v106 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v103 = (void *)[v94 newArgumentEncoderWithBufferIndex:1];
      v102 = (void *)[v94 newArgumentEncoderWithBufferIndex:2];
      v101 = (void *)[v94 newArgumentEncoderWithBufferIndex:5];
      v100 = (void *)[v94 newArgumentEncoderWithBufferIndex:8];
      v99 = (void *)[v94 newArgumentEncoderWithBufferIndex:7];
      uint64_t v93 = (void *)[v94 newArgumentEncoderWithBufferIndex:10];
      uint64_t v86 = [v103 alignment];
      uint64_t v84 = [v103 encodedLength];
      uint64_t v82 = [v103 alignment];
      unint64_t v80 = [v103 alignment];
      uint64_t v79 = [v103 alignment];
      uint64_t v78 = [v103 encodedLength];
      uint64_t v77 = [v103 alignment];
      unint64_t v76 = [v103 alignment];
      uint64_t v75 = [v102 alignment];
      uint64_t v74 = [v102 encodedLength];
      uint64_t v73 = [v102 alignment];
      unint64_t v72 = [v102 alignment];
      uint64_t v71 = [v102 alignment];
      uint64_t v70 = [v102 encodedLength];
      uint64_t v69 = [v102 alignment];
      unint64_t v68 = [v102 alignment];
      uint64_t v67 = [v101 alignment];
      uint64_t v66 = [v101 encodedLength];
      uint64_t v65 = [v101 alignment];
      unint64_t v64 = [v101 alignment];
      uint64_t v63 = [v101 alignment];
      uint64_t v62 = [v101 encodedLength];
      uint64_t v61 = [v101 alignment];
      unint64_t v60 = [v101 alignment];
      uint64_t v59 = [v100 alignment];
      uint64_t v58 = [v100 encodedLength];
      uint64_t v57 = [v100 alignment];
      unint64_t v56 = [v100 alignment];
      uint64_t v55 = [v100 alignment];
      uint64_t v18 = [v100 encodedLength];
      uint64_t v19 = [v100 alignment];
      unint64_t v54 = [v100 alignment];
      uint64_t v53 = [v99 alignment];
      uint64_t v20 = [v99 encodedLength];
      uint64_t v21 = [v99 alignment];
      unint64_t v52 = [v99 alignment];
      uint64_t v22 = [v99 alignment];
      uint64_t v23 = [v93 encodedLength];
      uint64_t v24 = [v99 alignment];
      unint64_t v25 = [v99 alignment];
      int8x8_t v26 = [(HDRImageConverter_Metal *)self metalDevice];
      uint64_t v27 = v18 + v19;
      uint64_t v28 = v20 + v21;
      unint64_t v29 = (v84 + v82 - 1) / v80 * v86;
      unint64_t v30 = v29 + (v78 + v77 - 1) / v76 * v79;
      unint64_t v31 = v30 + (v74 + v73 - 1) / v72 * v75;
      unint64_t v32 = v31 + (v70 + v69 - 1) / v68 * v71;
      uint64_t v87 = v32 + (v66 + v65 - 1) / v64 * v67;
      uint64_t v85 = v87 + (v62 + v61 - 1) / v60 * v63;
      uint64_t v83 = v85 + (v58 + v57 - 1) / v56 * v59;
      uint64_t v81 = v83 + (v27 - 1) / v54 * v55;
      unint64_t v33 = v81 + (v28 - 1) / v52 * v53 + (v23 + v24 - 1) / v25 * v22;
      uint64_t v34 = v81 + (v28 - 1) / v52 * v53;
      uint64_t v35 = (void *)[v26 newBufferWithLength:v33 options:0];

      [(HDRImageConverter_Metal *)self encodeInputImage:a3 transform:a4 toBuffer:v35 offset:0 withArgumentEncoder:v103 computeEncoder:v105 index:1 textures:v106];
      if (a7->var0.var0) {
        long long v36 = a7;
      }
      else {
        long long v36 = a8;
      }
      [(HDRImageConverter_Metal *)self encodeInputImage:a6 transform:v36 toBuffer:v35 offset:v29 withArgumentEncoder:v103 computeEncoder:v105 index:3 textures:v106];
      [(HDRImageConverter_Metal *)self encodeOutputImage:a9 transform:&a10[2].var0.var1.var1.var5 toBuffer:v35 offset:v30 withArgumentEncoder:v102 computeEncoder:v105 index:2 textures:v106];
      [(HDRImageConverter_Metal *)self encodeOutputImage:a11 transform:&a12[18].var1 toBuffer:v35 offset:v31 withArgumentEncoder:v102 computeEncoder:v105 index:4 textures:v106];
      [(HDRImageConverter_Metal *)self encodeInputColorTransform:&a4->var1.var1.var4.var1.var3 toBuffer:v35 offset:v32 withArgumentEncoder:v101 computeEncoder:v105 index:5];
      [(HDRImageConverter_Metal *)self encodeInputColorTransform:&a5->var1.var1.var4.var1.var3 toBuffer:v35 offset:v87 withArgumentEncoder:v101 computeEncoder:v105 index:6];
      [(HDRImageConverter_Metal *)self encodeInputGainTransform:&a7[10].var1.var1 toBuffer:v35 offset:v85 withArgumentEncoder:v100 computeEncoder:v105 index:8];
      [(HDRImageConverter_Metal *)self encodeInputGainTransform:&a8[10].var1.var1 toBuffer:v35 offset:v83 withArgumentEncoder:v100 computeEncoder:v105 index:9];
      [(HDRImageConverter_Metal *)self encodeOutputColorTransform:a10 toBuffer:v35 offset:v81 withArgumentEncoder:v99 computeEncoder:v105 index:7];
      [(HDRImageConverter_Metal *)self encodeOutputGainTransform:a12 toBuffer:v35 offset:v34 withArgumentEncoder:v93 computeEncoder:v105 index:10];
      unsigned int Width = gFunc_CVPixelBufferGetWidth(a9);
      unsigned int Height = gFunc_CVPixelBufferGetHeight(a9);
      v39.i32[0] = v122;
      v39.i32[1] = v123;
      int8x8_t v98 = (int8x8_t)__PAIR64__(Height, Width);
      int8x8_t v40 = vand_s8((int8x8_t)vadd_s32((int32x2_t)__PAIR64__(Height, Width), vadd_s32(v39, (int32x2_t)-1)), (int8x8_t)0xFFFF0000FFFFLL);
      unsigned __int16 v121 = v40.i32[1] / v123;
      unsigned __int16 v120 = v40.i32[0] / v122;
      [v105 setBytes:&v120 length:4 atIndex:13];
      float32x2_t v41 = vadd_f32((float32x2_t)vorr_s8(vand_s8(v98, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
      __asm { FMOV            V1.2S, #1.0 }
      *(float32x2_t *)&long long v47 = vdiv_f32(_D1, v41);
      *((float32x2_t *)&v47 + 1) = vdiv_f32((float32x2_t)0x3F0000003F000000, v41);
      long long v119 = v47;
      [v105 setBytes:&v119 length:16 atIndex:14];
      uint64_t v48 = v120;
      uint64_t v49 = v121;
      long long v117 = 0uLL;
      uint64_t v118 = 0;
      v116[0] = v120;
      v116[1] = v121;
      v116[2] = 1;
      [(HDRImageConverter_Metal *)self computeThreadGroupSizeForOutputSize:v116 pipelineState:v104];
      long long v114 = 0uLL;
      uint64_t v115 = 0;
      long long v112 = v117;
      uint64_t v113 = v118;
      v111[0] = v48;
      v111[1] = v49;
      v111[2] = 1;
      [(HDRImageConverter_Metal *)self computeGridSizeForThreadGroupSize:&v112 outputSize:v111];
      long long v109 = v114;
      uint64_t v110 = v115;
      long long v107 = v117;
      uint64_t v108 = v118;
      [v105 dispatchThreadgroups:&v109 threadsPerThreadgroup:&v107];
      [v105 endEncoding];
      BOOL v50 = [(HDRImageConverter_Metal *)self commitAndWaitUntilCompleted:v88];
    }
    else
    {
      BOOL v50 = 0;
    }

    uint64_t v17 = v94;
  }
  else
  {
    BOOL v50 = 0;
  }

  return v50;
}

- (BOOL)computeLumaGainHistogram:(id *)a3 scale:(__CVBuffer *)a4 image:(id *)a5 transform:(__CVBuffer *)a6 gainMap:(id *)a7 transform:
{
  v79[0] = v7;
  int v78 = 524296;
  uint32x4_t v10 = [(HDRImageConverter_Metal *)self conversionFunctionWithName:@"compute_luma_gain_histogram" subsampling:&v78];
  if (v10)
  {
    uint64_t v58 = v10;
    uint64_t v62 = [(HDRImageConverter_Metal *)self metalComputePipelineStateWithFunction:v10];
    if (v62)
    {
      uint64_t v48 = [(HDRImageConverter_Metal *)self metalCommandQueue];
      uint64_t v51 = [v48 commandBuffer];
      unint64_t v52 = [v51 computeCommandEncoder];
      [v52 setComputePipelineState:v62];
      id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v57 = (void *)[v58 newArgumentEncoderWithBufferIndex:1];
      unint64_t v56 = (void *)[v58 newArgumentEncoderWithBufferIndex:5];
      uint64_t v49 = (void *)[v58 newArgumentEncoderWithBufferIndex:8];
      uint64_t v47 = [v57 alignment];
      uint64_t v46 = [v57 encodedLength];
      uint64_t v45 = [v57 alignment];
      unint64_t v44 = [v57 alignment];
      uint64_t v43 = [v57 alignment];
      uint64_t v42 = [v57 encodedLength];
      uint64_t v41 = [v57 alignment];
      unint64_t v11 = [v57 alignment];
      uint64_t v40 = [v56 alignment];
      uint64_t v39 = [v56 encodedLength];
      uint64_t v12 = [v56 alignment];
      unint64_t v13 = [v56 alignment];
      uint64_t v14 = [v49 alignment];
      uint64_t v15 = [v49 encodedLength];
      uint64_t v16 = [v49 alignment];
      unint64_t v17 = [v49 alignment];
      BOOL v50 = a4;
      uint64_t v18 = [(HDRImageConverter_Metal *)self metalDevice];
      unint64_t v19 = (v46 + v45 - 1) / v44 * v47;
      unint64_t v20 = v19 + (v42 + v41 - 1) / v11 * v43;
      unint64_t v21 = v20 + (v39 + v12 - 1) / v13 * v40;
      unint64_t v22 = v21 + (v15 + v16 - 1) / v17 * v14;
      uint64_t v23 = (void *)[v18 newBufferWithLength:v22 + 4096 options:0];

      [(HDRImageConverter_Metal *)self encodeInputImage:v50 transform:a5 toBuffer:v23 offset:0 withArgumentEncoder:v57 computeEncoder:v52 index:1 textures:v55];
      [(HDRImageConverter_Metal *)self encodeInputImage:a6 transform:a7 toBuffer:v23 offset:v19 withArgumentEncoder:v57 computeEncoder:v52 index:3 textures:v55];
      [(HDRImageConverter_Metal *)self encodeInputColorTransform:&a5->var1.var1.var4.var1.var3 toBuffer:v23 offset:v20 withArgumentEncoder:v56 computeEncoder:v52 index:5];
      [(HDRImageConverter_Metal *)self encodeInputGainTransform:&a7[10].var1.var1 toBuffer:v23 offset:v21 withArgumentEncoder:v49 computeEncoder:v52 index:8];
      [v52 setBuffer:v23 offset:v22 atIndex:11];
      [v52 setBytes:v79 length:8 atIndex:12];
      LODWORD(v16) = gFunc_CVPixelBufferGetWidth(v50);
      unsigned int Height = gFunc_CVPixelBufferGetHeight(v50);
      v25.i32[0] = (unsigned __int16)v78;
      v25.i32[1] = HIWORD(v78);
      int8x8_t v61 = (int8x8_t)__PAIR64__(Height, v16);
      int8x8_t v26 = vand_s8((int8x8_t)vadd_s32((int32x2_t)__PAIR64__(Height, v16), vadd_s32(v25, (int32x2_t)-1)), (int8x8_t)0xFFFF0000FFFFLL);
      unsigned __int16 v77 = v26.i32[1] / HIWORD(v78);
      unsigned __int16 v76 = v26.i32[0] / (unsigned __int16)v78;
      [v52 setBytes:&v76 length:4 atIndex:13];
      float32x2_t v27 = vadd_f32((float32x2_t)vorr_s8(vand_s8(v61, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000));
      __asm { FMOV            V1.2S, #1.0 }
      *(float32x2_t *)&long long v33 = vdiv_f32(_D1, v27);
      *((float32x2_t *)&v33 + 1) = vdiv_f32(0, v27);
      long long v75 = v33;
      [v52 setBytes:&v75 length:16 atIndex:14];
      uint64_t v34 = v76;
      uint64_t v35 = v77;
      long long v73 = 0uLL;
      uint64_t v74 = 0;
      v72[0] = v76;
      v72[1] = v77;
      v72[2] = 1;
      [(HDRImageConverter_Metal *)self computeThreadGroupSizeForOutputSize:v72 pipelineState:v62];
      long long v70 = 0uLL;
      uint64_t v71 = 0;
      long long v68 = v73;
      uint64_t v69 = v74;
      v67[0] = v34;
      v67[1] = v35;
      v67[2] = 1;
      [(HDRImageConverter_Metal *)self computeGridSizeForThreadGroupSize:&v68 outputSize:v67];
      long long v65 = v70;
      uint64_t v66 = v71;
      long long v63 = v73;
      uint64_t v64 = v74;
      [v52 dispatchThreadgroups:&v65 threadsPerThreadgroup:&v63];
      [v52 endEncoding];
      BOOL v36 = [(HDRImageConverter_Metal *)self commitAndWaitUntilCompleted:v51];

      id v37 = v23;
      memcpy(a3, (const void *)([v37 contents] + v22), sizeof($1FF2F8D2599020761ACEFF31D93EEB84));
    }
    else
    {
      BOOL v36 = 0;
    }

    uint32x4_t v10 = v58;
  }
  else
  {
    BOOL v36 = 0;
  }

  return v36;
}

- (MTLDevice)metalDevice
{
  return self->_metalDevice;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (MTLLibrary)metalLibrary
{
  return self->_metalLibrary;
}

- (MTLBinaryArchive)metalArchive
{
  return self->_metalArchive;
}

- (MTLBinaryArchive)metalBinaryArchive
{
  return self->_metalBinaryArchive;
}

- (__CVMetalTextureCache)metalTextureCache
{
  return self->_metalTextureCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalBinaryArchive, 0);
  objc_storeStrong((id *)&self->_metalArchive, 0);
  objc_storeStrong((id *)&self->_metalLibrary, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);

  objc_storeStrong((id *)&self->_metalDevice, 0);
}

@end