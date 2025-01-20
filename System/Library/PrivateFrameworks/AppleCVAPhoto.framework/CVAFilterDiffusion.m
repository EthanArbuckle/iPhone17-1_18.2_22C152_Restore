@interface CVAFilterDiffusion
- (CVAFilterDiffusion)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 bufferWidth:(unint64_t)a6 bufferHeight:(unint64_t)a7 edgeVariance:(float)a8 stepSize:(float)a9 error:(id *)a10;
- (void)encodeDavidIterationToCommandBufferInternal:(id)a3 priorTexture:(id)a4 confidenceTexture:(id)a5 sourceTexture:(id)a6 destinationTexture:(id)a7;
- (void)encodeDiffusionMapLaplacianToCommandBuffer:(id)a3 diffusionMapTexture:(id)a4 outputLaplacian:(id)a5;
- (void)encodeEdgeLaplacianToCommandBuffer:(id)a3 colorTexture:(id)a4 outputLaplacian:(id)a5;
- (void)encodeToCommandBuffer:(id)a3 priorTexture:(id)a4 sourceTexture:(id)a5 destinationTexture:(id)a6 diffusionMapTexture:(id)a7 confidenceTexture:(id)a8 iterations:(unsigned int)a9;
- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 colorTexture:(id)a6 iterations:(unsigned int)a7;
- (void)encodeToCommandBufferInternal:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5;
@end

@implementation CVAFilterDiffusion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laplacianDavidKernel, 0);
  objc_storeStrong((id *)&self->_laplacianJacobiKernel, 0);
  objc_storeStrong((id *)&self->_createDiffusionMapLaplacianKernel, 0);
  objc_storeStrong((id *)&self->_createEdgeLaplacianKernel, 0);
  objc_storeStrong((id *)&self->_jacobiConfigImmutable, 0);
  objc_storeStrong((id *)&self->_edgeLaplacianConfigImmutable, 0);
  objc_storeStrong((id *)&self->_davidConfigImmutable, 0);
  objc_storeStrong((id *)&self->_tmpOut32_1, 0);
  objc_storeStrong((id *)&self->_tmpOut32_0, 0);
  objc_storeStrong((id *)&self->_tmpOut16_1, 0);
  objc_storeStrong((id *)&self->_tmpOut16_0, 0);
  objc_storeStrong((id *)&self->_laplacian, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)encodeToCommandBuffer:(id)a3 priorTexture:(id)a4 sourceTexture:(id)a5 destinationTexture:(id)a6 diffusionMapTexture:(id)a7 confidenceTexture:(id)a8 iterations:(unsigned int)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v30 = a7;
  id v19 = a8;
  if (a9)
  {
    v29 = v18;
    v20 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut32_1;
    v21 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut32_0;
    if ([v17 pixelFormat] != 55 && objc_msgSend(v29, "pixelFormat") != 55)
    {
      v21 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut16_0;
      v20 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut16_1;
    }
    id v22 = *(id *)((char *)&self->super.super.isa + *v21);
    id v23 = *(id *)((char *)&self->super.super.isa + *v20);
    [(CVAFilterDiffusion *)self encodeDiffusionMapLaplacianToCommandBuffer:v15 diffusionMapTexture:v30 outputLaplacian:self->_laplacian];
    unsigned int v24 = a9 - 1;
    if (a9 == 1)
    {
      [(CVAFilterDiffusion *)self encodeDavidIterationToCommandBufferInternal:v15 priorTexture:v16 confidenceTexture:v19 sourceTexture:v17 destinationTexture:v29];
    }
    else
    {
      [(CVAFilterDiffusion *)self encodeDavidIterationToCommandBufferInternal:v15 priorTexture:v16 confidenceTexture:v19 sourceTexture:v17 destinationTexture:v23];
      if (v24 < 2)
      {
        id v27 = v22;
        v26 = v29;
      }
      else
      {
        v26 = v29;
        do
        {
          id v27 = v23;
          id v23 = v22;
          [(CVAFilterDiffusion *)self encodeDavidIterationToCommandBufferInternal:v15 priorTexture:v16 confidenceTexture:v19 sourceTexture:v27 destinationTexture:v22];
          --v24;
          id v22 = v27;
        }
        while (v24 > 1);
      }
      id v22 = v23;
      id v28 = v23;
      id v23 = v27;
      [(CVAFilterDiffusion *)self encodeDavidIterationToCommandBufferInternal:v15 priorTexture:v16 confidenceTexture:v19 sourceTexture:v28 destinationTexture:v26];
    }

    id v18 = v29;
  }
  else
  {
    v25 = [v15 blitCommandEncoder];
    memset(v33, 0, sizeof(v33));
    v32[0] = [v17 width];
    v32[1] = [v17 height];
    v32[2] = 1;
    memset(v31, 0, sizeof(v31));
    [v25 copyFromTexture:v17 sourceSlice:0 sourceLevel:0 sourceOrigin:v33 sourceSize:v32 toTexture:v18 destinationSlice:0 destinationLevel:0 destinationOrigin:v31];
    [v25 endEncoding];
  }
}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 colorTexture:(id)a6 iterations:(unsigned int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a7)
  {
    id v16 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut32_1;
    id v17 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut32_0;
    if ([v13 pixelFormat] != 55 && objc_msgSend(v14, "pixelFormat") != 55)
    {
      id v17 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut16_0;
      id v16 = &OBJC_IVAR___CVAFilterDiffusion__tmpOut16_1;
    }
    id v18 = *(id *)((char *)&self->super.super.isa + *v17);
    id v19 = *(id *)((char *)&self->super.super.isa + *v16);
    [(CVAFilterDiffusion *)self encodeEdgeLaplacianToCommandBuffer:v12 colorTexture:v15 outputLaplacian:self->_laplacian];
    unsigned int v20 = a7 - 1;
    if (a7 == 1)
    {
      [(CVAFilterDiffusion *)self encodeToCommandBufferInternal:v12 sourceTexture:v13 destinationTexture:v14];
    }
    else
    {
      [(CVAFilterDiffusion *)self encodeToCommandBufferInternal:v12 sourceTexture:v13 destinationTexture:v19];
      if (v20 < 2)
      {
        id v22 = v18;
      }
      else
      {
        do
        {
          id v22 = v19;
          id v19 = v18;
          [(CVAFilterDiffusion *)self encodeToCommandBufferInternal:v12 sourceTexture:v22 destinationTexture:v18];
          --v20;
          id v18 = v22;
        }
        while (v20 > 1);
      }
      id v18 = v19;
      id v23 = v19;
      id v19 = v22;
      [(CVAFilterDiffusion *)self encodeToCommandBufferInternal:v12 sourceTexture:v23 destinationTexture:v14];
    }
  }
  else
  {
    v21 = [v12 blitCommandEncoder];
    memset(v26, 0, sizeof(v26));
    v25[0] = [v13 width];
    v25[1] = [v13 height];
    v25[2] = 1;
    memset(v24, 0, sizeof(v24));
    [v21 copyFromTexture:v13 sourceSlice:0 sourceLevel:0 sourceOrigin:v26 sourceSize:v25 toTexture:v14 destinationSlice:0 destinationLevel:0 destinationOrigin:v24];
    [v21 endEncoding];
  }
}

- (void)encodeDiffusionMapLaplacianToCommandBuffer:(id)a3 diffusionMapTexture:(id)a4 outputLaplacian:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 computeCommandEncoder];
  [v10 setLabel:@"_createDiffusionMapLaplacianKernel"];
  [v10 setComputePipelineState:self->_createDiffusionMapLaplacianKernel];
  [v10 setTexture:v8 atIndex:0];
  [v10 setTexture:v9 atIndex:1];
  v13[0] = (unint64_t)([v8 width] + 15) >> 4;
  v13[1] = (unint64_t)([v8 height] + 15) >> 4;
  v13[2] = 1;
  uint64_t v12 = 1;
  long long v11 = xmmword_1BA86C930;
  [v10 dispatchThreadgroups:v13 threadsPerThreadgroup:&v11];
  [v10 endEncoding];
}

- (void)encodeEdgeLaplacianToCommandBuffer:(id)a3 colorTexture:(id)a4 outputLaplacian:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 computeCommandEncoder];
  [v10 setLabel:@"_createEdgeLaplacianKernel"];
  [v10 setComputePipelineState:self->_createEdgeLaplacianKernel];
  [v10 setTexture:v8 atIndex:0];
  [v10 setTexture:v9 atIndex:1];
  [v10 setBuffer:self->_edgeLaplacianConfigImmutable offset:0 atIndex:0];
  v13[0] = (unint64_t)([v8 width] + 15) >> 4;
  v13[1] = (unint64_t)([v8 height] + 15) >> 4;
  v13[2] = 1;
  uint64_t v12 = 1;
  long long v11 = xmmword_1BA86C930;
  [v10 dispatchThreadgroups:v13 threadsPerThreadgroup:&v11];
  [v10 endEncoding];
}

- (void)encodeDavidIterationToCommandBufferInternal:(id)a3 priorTexture:(id)a4 confidenceTexture:(id)a5 sourceTexture:(id)a6 destinationTexture:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [a3 computeCommandEncoder];
  [v16 setLabel:@"_laplacianDavidKernel"];
  [v16 setComputePipelineState:self->_laplacianDavidKernel];
  [v16 setTexture:self->_laplacian atIndex:0];
  [v16 setTexture:v13 atIndex:1];
  [v16 setTexture:v12 atIndex:2];
  [v16 setTexture:v14 atIndex:3];
  [v16 setTexture:v15 atIndex:4];
  [v16 setBuffer:self->_davidConfigImmutable offset:0 atIndex:0];
  v19[0] = (unint64_t)([v14 width] + 15) >> 4;
  v19[1] = (unint64_t)([v14 height] + 15) >> 4;
  v19[2] = 1;
  uint64_t v18 = 1;
  long long v17 = xmmword_1BA86C930;
  [v16 dispatchThreadgroups:v19 threadsPerThreadgroup:&v17];
  [v16 endEncoding];
}

- (void)encodeToCommandBufferInternal:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 computeCommandEncoder];
  [v10 setLabel:@"_laplacianJacobiKernel"];
  [v10 setComputePipelineState:self->_laplacianJacobiKernel];
  [v10 setTexture:self->_laplacian atIndex:0];
  [v10 setTexture:v8 atIndex:1];
  [v10 setTexture:v9 atIndex:2];
  [v10 setBuffer:self->_jacobiConfigImmutable offset:0 atIndex:0];
  v13[0] = (unint64_t)([v8 width] + 15) >> 4;
  v13[1] = (unint64_t)([v8 height] + 15) >> 4;
  v13[2] = 1;
  uint64_t v12 = 1;
  long long v11 = xmmword_1BA86C930;
  [v10 dispatchThreadgroups:v13 threadsPerThreadgroup:&v11];
  [v10 endEncoding];
}

- (CVAFilterDiffusion)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 bufferWidth:(unint64_t)a6 bufferHeight:(unint64_t)a7 edgeVariance:(float)a8 stepSize:(float)a9 error:(id *)a10
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  v45.receiver = self;
  v45.super_class = (Class)CVAFilterDiffusion;
  id v22 = [(ImageSaverRegistrator *)&v45 init];
  id v23 = v22;
  if (v22)
  {
    id v44 = v21;
    p_device = (void **)&v22->_device;
    objc_storeStrong((id *)&v22->_device, a3);
    objc_storeStrong((id *)&v23->_library, a4);
    objc_storeStrong((id *)&v23->_pipelineLibrary, a5);
    v23->_uint64_t width = a6;
    v23->_height = a7;
    v23->_edgeVariance = a8;
    uint64_t width = v23->_width;
    uint64_t v26 = sub_1BA862650(*p_device, 115, width, a7, 0, a10);
    laplacian = v23->_laplacian;
    v23->_laplacian = (MTLTexture *)v26;

    uint64_t v28 = sub_1BA862650(*p_device, 25, width, a7, 0, a10);
    tmpOut16_0 = v23->_tmpOut16_0;
    v23->_tmpOut16_0 = (MTLTexture *)v28;

    uint64_t v30 = sub_1BA862650(*p_device, 25, width, a7, 0, a10);
    tmpOut16_1 = v23->_tmpOut16_1;
    v23->_tmpOut16_1 = (MTLTexture *)v30;

    uint64_t v32 = sub_1BA862650(*p_device, 55, width, a7, 0, a10);
    tmpOut32_0 = v23->_tmpOut32_0;
    v23->_tmpOut32_0 = (MTLTexture *)v32;

    uint64_t v34 = sub_1BA862650(*p_device, 55, width, a7, 0, a10);
    tmpOut32_1 = v23->_tmpOut32_1;
    v23->_tmpOut32_1 = (MTLTexture *)v34;

    uint64_t v36 = [*p_device newBufferWithLength:4 options:0];
    edgeLaplacianConfigImmutable = v23->_edgeLaplacianConfigImmutable;
    v23->_edgeLaplacianConfigImmutable = (MTLBuffer *)v36;

    *(float *)[(MTLBuffer *)v23->_edgeLaplacianConfigImmutable contents] = -1.0 / (float)(a8 + a8);
    uint64_t v38 = [*p_device newBufferWithLength:4 options:0];
    jacobiConfigImmutable = v23->_jacobiConfigImmutable;
    v23->_jacobiConfigImmutable = (MTLBuffer *)v38;

    *(float *)[(MTLBuffer *)v23->_jacobiConfigImmutable contents] = a9;
    uint64_t v40 = [*p_device newBufferWithLength:4 options:0];
    davidConfigImmutable = v23->_davidConfigImmutable;
    v23->_davidConfigImmutable = (MTLBuffer *)v40;

    *(_DWORD *)[(MTLBuffer *)v23->_davidConfigImmutable contents] = 1061997773;
    sub_1BA8328CC((void **)&v23->_createEdgeLaplacianKernel, v23->_library, v23->_pipelineLibrary, *p_device, @"createEdgeLaplacian", a10, 0);
    sub_1BA8328CC((void **)&v23->_createDiffusionMapLaplacianKernel, v23->_library, v23->_pipelineLibrary, *p_device, @"createDiffusionMapLaplacian", a10, 0);
    sub_1BA8328CC((void **)&v23->_laplacianJacobiKernel, v23->_library, v23->_pipelineLibrary, *p_device, @"laplacianJacobi", a10, 0);
    sub_1BA8328CC((void **)&v23->_laplacianDavidKernel, v23->_library, v23->_pipelineLibrary, *p_device, @"laplacianDavid", a10, 0);
    v42 = v23;
    id v21 = v44;
  }

  return v23;
}

@end