@interface XMattingBoxTensorFilter
+ (id)supportedPixelFormats;
- (XMattingBoxTensorFilter)initWithDevice:(id)a3 library:(id)a4;
- (int)_compileShadersWithLibrary:(id)a3;
- (int)allocateResources:(id)a3;
- (int)encodeOnCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5;
- (int)encodeSeparableSlidingStackOnCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5;
- (void)releaseResources;
@end

@implementation XMattingBoxTensorFilter

- (XMattingBoxTensorFilter)initWithDevice:(id)a3 library:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)XMattingBoxTensorFilter;
  v9 = [(XMattingBoxTensorFilter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_library, a4);
    v10->_supportsReadWriteTextures = (unint64_t)[v7 readWriteTextureSupport] > 1;
  }

  return v10;
}

- (int)allocateResources:(id)a3
{
  v5 = (MPSImageBox *)[objc_alloc(MEMORY[0x1E4F35550]) initWithDevice:self->_device kernelWidth:(2 * a3.var0) | 1 kernelHeight:(2 * a3.var0) | 1];
  boxfilter = self->_boxfilter;
  self->_boxfilter = v5;

  [(MPSImageBox *)self->_boxfilter setEdgeMode:0];
  *($85CD2974BE96D4886BB301820D1C36C2 *)&self->_radius = a3;
  int v7 = [(XMattingBoxTensorFilter *)self _compileShadersWithLibrary:self->_library];
  if (v7) {
    [(XMattingBoxTensorFilter *)self releaseResources];
  }
  return v7;
}

- (void)releaseResources
{
  boxfilter = self->_boxfilter;
  self->_boxfilter = 0;

  tmpTexture = self->_tmpTexture;
  self->_tmpTexture = 0;

  depthFilterSeparableSlidingStacks_arrayKernel = self->_depthFilterSeparableSlidingStacks_arrayKernel;
  self->_depthFilterSeparableSlidingStacks_arrayKernel = 0;

  renormalizeFromMPSImageEdgeModeZeroKernel = self->_renormalizeFromMPSImageEdgeModeZeroKernel;
  self->_renormalizeFromMPSImageEdgeModeZeroKernel = 0;
}

- (int)_compileShadersWithLibrary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 newFunctionWithName:@"depthFilterSeparableSlidingStacks_array"];
  v6 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v5 error:0];
  depthFilterSeparableSlidingStacks_arrayKernel = self->_depthFilterSeparableSlidingStacks_arrayKernel;
  self->_depthFilterSeparableSlidingStacks_arrayKernel = v6;

  if (self->_depthFilterSeparableSlidingStacks_arrayKernel)
  {
    if (self->_supportsReadWriteTextures) {
      id v8 = @"renormalizeFromMPSImageEdgeModeZero_RWS";
    }
    else {
      id v8 = @"renormalizeFromMPSImageEdgeModeZero";
    }
    uint64_t v9 = [v4 newFunctionWithName:v8];

    v10 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v9 error:0];
    renormalizeFromMPSImageEdgeModeZeroKernel = self->_renormalizeFromMPSImageEdgeModeZeroKernel;
    self->_renormalizeFromMPSImageEdgeModeZeroKernel = v10;

    if (self->_renormalizeFromMPSImageEdgeModeZeroKernel) {
      int v12 = 0;
    }
    else {
      int v12 = -12786;
    }
    v5 = (void *)v9;
  }
  else
  {
    int v12 = -12786;
  }

  return v12;
}

+ (id)supportedPixelFormats
{
  if (supportedPixelFormats_onceToken != -1) {
    dispatch_once(&supportedPixelFormats_onceToken, &__block_literal_global_75);
  }
  v2 = (void *)_supportedPixelFormats;

  return v2;
}

uint64_t __48__XMattingBoxTensorFilter_supportedPixelFormats__block_invoke()
{
  _supportedPixelFormats = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1EE4AB930];

  return MEMORY[0x1F41817F8]();
}

- (int)encodeSeparableSlidingStackOnCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_depthFilterSeparableSlidingStacks_arrayKernel];
  [v10 setTexture:v9 atIndex:0];
  [v10 setTexture:v8 atIndex:1];

  [v10 setBytes:&self->_depthRadius length:4 atIndex:0];
  LODWORD(a3) = [(MTLComputePipelineState *)self->_depthFilterSeparableSlidingStacks_arrayKernel threadExecutionWidth];
  LODWORD(v8) = (int)[(MTLComputePipelineState *)self->_depthFilterSeparableSlidingStacks_arrayKernel maxTotalThreadsPerThreadgroup]/ (int)a3;
  int v11 = (int)(a3 + [v9 width] - 1) / (int)a3;
  LODWORD(self) = [v9 height];

  v14[0] = v11;
  v14[1] = ((int)v8 + (int)self - 1) / (int)v8;
  v14[2] = 1;
  v13[0] = (int)a3;
  v13[1] = (int)v8;
  v13[2] = 1;
  [v10 dispatchThreadgroups:v14 threadsPerThreadgroup:v13];
  [v10 endEncoding];

  return 0;
}

- (int)encodeOnCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = +[XMattingBoxTensorFilter supportedPixelFormats];
  int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "pixelFormat"));
  int v13 = [v11 containsObject:v12];

  if (!v13) {
    goto LABEL_34;
  }
  v14 = +[XMattingBoxTensorFilter supportedPixelFormats];
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "pixelFormat"));
  int v16 = [v14 containsObject:v15];

  if (!v16) {
    goto LABEL_34;
  }
  uint64_t v17 = [v9 width];
  if (v17 == [v10 width]
    && (uint64_t v18 = [v9 height], v18 == objc_msgSend(v10, "height"))
    && (uint64_t v19 = [v9 arrayLength], v19 == objc_msgSend(v10, "arrayLength"))
    && [v9 textureType] == 3
    && [v10 textureType] == 3)
  {
    id v20 = v10;
    [v8 pushDebugGroup:@"encode"];
    id v52 = v10;
    id v50 = v20;
    if (self->_depthRadius)
    {
      v21 = objc_msgSend(MEMORY[0x1E4F35578], "imageDescriptorWithChannelFormat:width:height:featureChannels:numberOfImages:usage:", 4, objc_msgSend(v9, "width"), objc_msgSend(v9, "height"), 4, objc_msgSend(v9, "arrayLength"), 19);
      v22 = [MEMORY[0x1E4F35978] temporaryImageWithCommandBuffer:v8 imageDescriptor:v21];
      uint64_t v23 = [v22 textureType];
      v51 = v22;
      v24 = [v22 texture];
      if (v23 == 3)
      {
        v25 = v20;
      }
      else
      {
        uint64_t v26 = objc_msgSend(v24, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v9, "pixelFormat"), 3, 0, 1, 0, objc_msgSend(v9, "arrayLength"));

        v25 = v24;
        v24 = (void *)v26;
      }
    }
    else
    {
      v51 = 0;
      v24 = v20;
    }
    if ([v9 arrayLength])
    {
      unint64_t v27 = 0;
      id v53 = v8;
      do
      {
        v28 = objc_msgSend(v9, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v9, "pixelFormat"), 2, 0, 1, v27, 1);
        v29 = objc_msgSend(v24, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v24, "pixelFormat"), 2, 0, 1, v27, 1);
        [(MPSImageBox *)self->_boxfilter encodeToCommandBuffer:v8 sourceTexture:v28 destinationTexture:v29];
        if (!self->_supportsReadWriteTextures)
        {
          tmpTexture = self->_tmpTexture;
          if (!tmpTexture
            || (uint64_t v31 = -[MTLTexture width](tmpTexture, "width"), v31 != [v29 width])
            || (uint64_t v32 = -[MTLTexture height](self->_tmpTexture, "height"), v32 != [v29 height])
            || (uint64_t v33 = [(MTLTexture *)self->_tmpTexture pixelFormat],
                v33 != [v29 pixelFormat]))
          {
            v34 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(v29, "pixelFormat"), objc_msgSend(v29, "width"), objc_msgSend(v29, "height"), 0);
            if (!v34) {
              goto LABEL_33;
            }
            v35 = v34;
            [v34 setUsage:3];
            v36 = [v24 device];
            v37 = (MTLTexture *)[v36 newTextureWithDescriptor:v35];
            v38 = self->_tmpTexture;
            self->_tmpTexture = v37;

            v39 = self->_tmpTexture;
            if (!v39)
            {
LABEL_33:

              int v48 = -12786;
              v47 = v51;
              id v10 = v52;
              goto LABEL_31;
            }
          }
          v40 = [v8 blitCommandEncoder];
          [v40 copyFromTexture:v29 toTexture:self->_tmpTexture];
          [v40 endEncoding];
        }
        v41 = [v8 computeCommandEncoder];
        [v41 setComputePipelineState:self->_renormalizeFromMPSImageEdgeModeZeroKernel];
        if (self->_supportsReadWriteTextures)
        {
          uint64_t v42 = 0;
        }
        else
        {
          [v41 setTexture:self->_tmpTexture atIndex:0];
          uint64_t v42 = 1;
        }
        [v41 setTexture:v29 atIndex:v42];
        [v41 setBytes:&self->_radius length:4 atIndex:0];
        int v43 = [(MTLComputePipelineState *)self->_renormalizeFromMPSImageEdgeModeZeroKernel threadExecutionWidth];
        int v44 = (int)[(MTLComputePipelineState *)self->_renormalizeFromMPSImageEdgeModeZeroKernel maxTotalThreadsPerThreadgroup]/ v43;
        int v45 = (int)(v43 + [v9 width] - 1) / v43;
        int v46 = [v9 height];
        v55[0] = v45;
        v55[1] = (v44 + v46 - 1) / v44;
        v55[2] = 1;
        v54[0] = v43;
        v54[1] = v44;
        v54[2] = 1;
        [v41 dispatchThreadgroups:v55 threadsPerThreadgroup:v54];
        [v41 endEncoding];

        ++v27;
        id v8 = v53;
      }
      while (v27 < [v9 arrayLength]);
    }
    v47 = v51;
    if (self->_depthRadius)
    {
      [(XMattingBoxTensorFilter *)self encodeSeparableSlidingStackOnCommandBuffer:v8 sourceTexture:v24 destinationTexture:v50];
      [v51 setReadCount:0];
    }
    [v8 popDebugGroup];
    int v48 = 0;
    id v10 = v52;
LABEL_31:
  }
  else
  {
LABEL_34:
    int v48 = -12780;
  }

  return v48;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renormalizeFromMPSImageEdgeModeZeroKernel, 0);
  objc_storeStrong((id *)&self->_depthFilterSeparableSlidingStacks_arrayKernel, 0);
  objc_storeStrong((id *)&self->_tmpTexture, 0);
  objc_storeStrong((id *)&self->_boxfilter, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end