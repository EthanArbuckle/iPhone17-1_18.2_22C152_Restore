@interface GlobalReductionAverage
- (GlobalReductionAverage)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 textureSize:(CGSize)a6;
- (void)parallelReductionAverage:(id)a3 inTexture:(id)a4 outGlobalAverage:(id)a5;
@end

@implementation GlobalReductionAverage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parallelReductionAverageSimd, 0);
  objc_storeStrong((id *)&self->_simdTextures, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)parallelReductionAverage:(id)a3 inTexture:(id)a4 outGlobalAverage:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v8 width] != (int)self->_textureSize.width
     || [v8 height] != (int)self->_textureSize.height)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    double width = self->_textureSize.width;
    double height = self->_textureSize.height;
    *(_DWORD *)buf = 67109888;
    int v25 = (int)width;
    __int16 v26 = 1024;
    int v27 = (int)height;
    __int16 v28 = 1024;
    int v29 = [v8 width];
    __int16 v30 = 1024;
    int v31 = [v8 height];
    _os_log_error_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "TextureSize does not mathc input, expected w:%i h:%i got w:%i h:%i", buf, 0x1Au);
  }
  v10 = objc_msgSend(v19, "computeCommandEncoder", v19);
  for (unint64_t i = 0; i <= [(NSArray *)self->_simdTextures count]; ++i)
  {
    if (i)
    {
      id v12 = [(NSArray *)self->_simdTextures objectAtIndexedSubscript:i - 1];
    }
    else
    {
      id v12 = v8;
    }
    v13 = v12;
    if (i == [(NSArray *)self->_simdTextures count])
    {
      v14 = 0;
    }
    else
    {
      v14 = [(NSArray *)self->_simdTextures objectAtIndexedSubscript:i];
    }
    uint64_t v15 = [v13 width];
    uint64_t v16 = [v13 height];
    [v10 setComputePipelineState:self->_parallelReductionAverageSimd];
    [v10 setTexture:v13 atIndex:0];
    [v10 setTexture:v14 atIndex:1];
    [v10 setBytes:&self->_numberOfElements length:4 atIndex:0];
    [v10 setBuffer:v9 offset:0 atIndex:1];
    v23[0] = (unint64_t)(v15 + 1) >> 1;
    v23[1] = (unint64_t)(v16 + 1) >> 1;
    v23[2] = 1;
    long long v21 = *(_OWORD *)&self->_simdReductionThreadsPerGroup.width;
    unint64_t depth = self->_simdReductionThreadsPerGroup.depth;
    [v10 dispatchThreads:v23 threadsPerThreadgroup:&v21];
  }
  [v10 endEncoding];
}

- (GlobalReductionAverage)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 textureSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v33.receiver = self;
  v33.super_class = (Class)GlobalReductionAverage;
  uint64_t v15 = [(GlobalReductionAverage *)&v33 init];
  if (v15 && ([v12 supportsFamily:1007] & 1) != 0)
  {
    objc_storeStrong((id *)&v15->_device, a3);
    objc_storeStrong((id *)&v15->_library, a4);
    objc_storeStrong((id *)&v15->_pipelineLibrary, a5);
    v15->_textureSize.double width = width;
    v15->_textureSize.double height = height;
    sub_1BA8328CC((void **)&v15->_parallelReductionAverageSimd, v15->_library, v15->_pipelineLibrary, v15->_device, @"parallelReductionAverageSimd", 0, 0);
    parallelReductionAverageSimd = v15->_parallelReductionAverageSimd;
    id v32 = v13;
    if (width <= height)
    {
      unint64_t v18 = (unint64_t)[(MTLComputePipelineState *)parallelReductionAverageSimd threadExecutionWidth] >> 2;
      unint64_t v17 = 4;
    }
    else
    {
      unint64_t v17 = (unint64_t)[(MTLComputePipelineState *)parallelReductionAverageSimd threadExecutionWidth] >> 2;
      unint64_t v18 = 4;
    }
    v15->_simdReductionThreadsPerGroup.double width = v17;
    v15->_simdReductionThreadsPerGroup.double height = v18;
    v15->_simdReductionThreadsPerGroup.unint64_t depth = 1;
    float v20 = width * height;
    v15->_numberOfElements = v20;
    long long v21 = objc_opt_new();
    unint64_t v22 = (unint64_t)width;
    unint64_t v23 = (unint64_t)height;
    unint64_t v24 = 2 * v15->_simdReductionThreadsPerGroup.width;
    unint64_t v25 = 2 * v15->_simdReductionThreadsPerGroup.height;
    if (v24 < (unint64_t)width || v25 < v23)
    {
      do
      {
        unint64_t v22 = (int)vcvtps_s32_f32((float)v22 / (float)v24);
        unint64_t v23 = (int)vcvtps_s32_f32((float)v23 / (float)v25);
        __int16 v26 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:25 width:v22 height:v23 mipmapped:0];
        [v26 setUsage:19];
        [v26 setResourceOptions:0];
        int v27 = (void *)[(MTLDeviceSPI *)v15->_device newTextureWithDescriptor:v26];
        [v21 addObject:v27];

        unint64_t v24 = 2 * v15->_simdReductionThreadsPerGroup.width;
        unint64_t v25 = 2 * v15->_simdReductionThreadsPerGroup.height;
      }
      while (v24 < v22 || v25 < v23);
    }
    uint64_t v29 = [v21 copy];
    simdTextures = v15->_simdTextures;
    v15->_simdTextures = (NSArray *)v29;

    id v19 = v15;
    id v13 = v32;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

@end