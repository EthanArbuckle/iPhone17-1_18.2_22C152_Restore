@interface PKMetalShader
- (PKMetalShader)init;
- (id)msaaPipelineStateWithSampleCount:(id *)a1;
- (id)pipelineStateDescriptorSampleCount:(uint64_t)a1;
- (uint64_t)initWithVertexFunction:(void *)a3 fragmentFunction:(uint64_t)a4 blendMode:(uint64_t)a5 colorAttachmentIndex:(void *)a6 sharedPipelineDescriptor:(uint64_t)a7 numColorAttachments:;
- (uint64_t)newShaderWithBlendMode:(void *)a1;
- (void)shaderWithBlendMode:(void *)a1;
@end

@implementation PKMetalShader

- (PKMetalShader)init
{
}

- (uint64_t)initWithVertexFunction:(void *)a3 fragmentFunction:(uint64_t)a4 blendMode:(uint64_t)a5 colorAttachmentIndex:(void *)a6 sharedPipelineDescriptor:(uint64_t)a7 numColorAttachments:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v15 = a3;
  id v16 = a6;
  if (a1)
  {
    v25.receiver = (id)a1;
    v25.super_class = (Class)PKMetalShader;
    v17 = (id *)objc_msgSendSuper2(&v25, sel_init);
    a1 = (uint64_t)v17;
    if (v17)
    {
      objc_storeStrong(v17 + 1, a2);
      objc_storeStrong((id *)(a1 + 16), a3);
      *(void *)(a1 + 64) = a4;
      *(void *)(a1 + 72) = a5;
      objc_storeStrong((id *)(a1 + 80), a6);
      *(void *)(a1 + 88) = a7;
      v18 = [*(id *)(a1 + 8) device];
      v19 = -[PKMetalShader pipelineStateDescriptorSampleCount:](a1, 1);
      id v26 = 0;
      uint64_t v20 = [v18 newRenderPipelineStateWithDescriptor:v19 error:&v26];
      id v21 = v26;
      v22 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v20;

      if (!*(void *)(a1 + 24))
      {
        v23 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v21;
          _os_log_error_impl(&dword_1C44F8000, v23, OS_LOG_TYPE_ERROR, "Error creating pipeline state: %@", buf, 0xCu);
        }
      }
    }
  }

  return a1;
}

- (id)pipelineStateDescriptorSampleCount:(uint64_t)a1
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F352F0]);
  v5 = [*(id *)(a1 + 80) pipelineLibrary];
  [v4 setPipelineLibrary:v5];

  [v4 setLabel:@"Pipeline State"];
  [v4 setVertexFunction:*(void *)(a1 + 8)];
  [v4 setFragmentFunction:*(void *)(a1 + 16)];
  if (*(void *)(a1 + 88))
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [*(id *)(a1 + 80) colorAttachments];
      v8 = [v7 objectAtIndexedSubscript:v6];
      uint64_t v9 = [v8 pixelFormat];
      v10 = [v4 colorAttachments];
      v11 = [v10 objectAtIndexedSubscript:v6];
      [v11 setPixelFormat:v9];

      ++v6;
    }
    while (v6 < *(void *)(a1 + 88));
  }
  objc_msgSend(v4, "setStencilAttachmentPixelFormat:", objc_msgSend(*(id *)(a1 + 80), "stencilAttachmentPixelFormat"));
  if (*(void *)(a1 + 64))
  {
    v12 = [v4 colorAttachments];
    v13 = [v12 objectAtIndexedSubscript:*(void *)(a1 + 72)];

    [v13 setBlendingEnabled:1];
    uint64_t v14 = *(void *)(a1 + 64);
    switch(v14)
    {
      case 1:
        [v13 setRgbBlendOperation:4];
        [v13 setAlphaBlendOperation:4];
        break;
      case 2:
      case 3:
      case 4:
        uint64_t v15 = 2 * (v14 == 4);
        [v13 setRgbBlendOperation:v15];
        [v13 setAlphaBlendOperation:v15];
        [v13 setSourceRGBBlendFactor:1];
        [v13 setSourceAlphaBlendFactor:1];
        if (*(void *)(a1 + 64) == 3) {
          uint64_t v16 = 3;
        }
        else {
          uint64_t v16 = 5;
        }
        [v13 setDestinationRGBBlendFactor:v16];
        if (*(void *)(a1 + 64) == 3) {
          uint64_t v17 = 1;
        }
        else {
          uint64_t v17 = 5;
        }
        v18 = v13;
        goto LABEL_19;
      case 5:
        [v13 setRgbBlendOperation:0];
        [v13 setAlphaBlendOperation:0];
        [v13 setSourceRGBBlendFactor:7];
        [v13 setSourceAlphaBlendFactor:9];
        [v13 setDestinationRGBBlendFactor:0];
        v18 = v13;
        uint64_t v17 = 0;
        goto LABEL_19;
      case 6:
        [v13 setRgbBlendOperation:0];
        [v13 setAlphaBlendOperation:0];
        [v13 setSourceRGBBlendFactor:1];
        [v13 setSourceAlphaBlendFactor:1];
        v19 = v13;
        uint64_t v20 = 1;
        goto LABEL_18;
      case 7:
        [v13 setRgbBlendOperation:0];
        [v13 setAlphaBlendOperation:0];
        [v13 setSourceRGBBlendFactor:6];
        [v13 setSourceAlphaBlendFactor:0];
        [v13 setDestinationRGBBlendFactor:5];
        v18 = v13;
        uint64_t v17 = 1;
        goto LABEL_19;
      case 8:
        [v13 setRgbBlendOperation:0];
        [v13 setAlphaBlendOperation:0];
        [v13 setSourceRGBBlendFactor:1];
        [v13 setSourceAlphaBlendFactor:1];
        v19 = v13;
        uint64_t v20 = 5;
LABEL_18:
        [v19 setDestinationRGBBlendFactor:v20];
        v18 = v13;
        uint64_t v17 = 5;
LABEL_19:
        [v18 setDestinationAlphaBlendFactor:v17];
        break;
      default:
        break;
    }
  }
  [v4 setRasterSampleCount:a2];

  return v4;
}

- (id)msaaPipelineStateWithSampleCount:(id *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2 == 1)
    {
      id v3 = a1[3];
    }
    else
    {
      id v4 = a1;
      objc_sync_enter(v4);
      id v5 = v4[5];
      if (!v5 || v4[21] != (id)a2)
      {
        unint64_t v6 = [v4[1] device];
        v7 = -[PKMetalShader pipelineStateDescriptorSampleCount:]((uint64_t)v4, a2);
        id v13 = 0;
        uint64_t v8 = [v6 newRenderPipelineStateWithDescriptor:v7 error:&v13];
        id v9 = v13;
        id v10 = v4[5];
        v4[5] = (id)v8;

        v4[21] = (id)a2;
        if (!v4[5])
        {
          v11 = os_log_create("com.apple.pencilkit", "");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v15 = v9;
            _os_log_error_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_ERROR, "Error creating pipeline state: %@", buf, 0xCu);
          }
        }
        id v5 = v4[5];
      }
      id v3 = v5;
      objc_sync_exit(v4);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (uint64_t)newShaderWithBlendMode:(void *)a1
{
  id v4 = [PKMetalShader alloc];
  id v5 = (void *)a1[1];
  unint64_t v6 = (void *)a1[2];
  uint64_t v7 = a1[9];
  uint64_t v8 = (void *)a1[10];
  uint64_t v9 = a1[11];

  return -[PKMetalShader initWithVertexFunction:fragmentFunction:blendMode:colorAttachmentIndex:sharedPipelineDescriptor:numColorAttachments:]((uint64_t)v4, v5, v6, a2, v7, v8, v9);
}

- (void)shaderWithBlendMode:(void *)a1
{
  if (a1)
  {
    uint64_t v3 = a1[8];
    id v4 = a1;
    id v5 = v4;
    if (v3 != a2)
    {
      objc_sync_enter(v4);
      unint64_t v6 = v5;
      switch(a2)
      {
        case 0:
          uint64_t v7 = v5 + 12;
          unint64_t v6 = v5[12];
          if (!v6)
          {
            uint64_t v8 = -[PKMetalShader newShaderWithBlendMode:](v5, 0);
            goto LABEL_22;
          }
          break;
        case 1:
          uint64_t v7 = v5 + 19;
          unint64_t v6 = v5[19];
          if (!v6)
          {
            uint64_t v8 = -[PKMetalShader newShaderWithBlendMode:](v5, 1);
            goto LABEL_22;
          }
          break;
        case 2:
          uint64_t v7 = v5 + 13;
          unint64_t v6 = v5[13];
          if (!v6)
          {
            uint64_t v8 = -[PKMetalShader newShaderWithBlendMode:](v5, 2);
            goto LABEL_22;
          }
          break;
        case 3:
          uint64_t v7 = v5 + 14;
          unint64_t v6 = v5[14];
          if (!v6)
          {
            uint64_t v8 = -[PKMetalShader newShaderWithBlendMode:](v5, 3);
            goto LABEL_22;
          }
          break;
        case 4:
          uint64_t v7 = v5 + 18;
          unint64_t v6 = v5[18];
          if (!v6)
          {
            uint64_t v8 = -[PKMetalShader newShaderWithBlendMode:](v5, 4);
            goto LABEL_22;
          }
          break;
        case 5:
          uint64_t v7 = v5 + 20;
          unint64_t v6 = v5[20];
          if (!v6)
          {
            uint64_t v8 = -[PKMetalShader newShaderWithBlendMode:](v5, 5);
            goto LABEL_22;
          }
          break;
        case 6:
          uint64_t v7 = v5 + 15;
          unint64_t v6 = v5[15];
          if (!v6)
          {
            uint64_t v8 = -[PKMetalShader newShaderWithBlendMode:](v5, 6);
            goto LABEL_22;
          }
          break;
        case 7:
          uint64_t v7 = v5 + 16;
          unint64_t v6 = v5[16];
          if (!v6)
          {
            uint64_t v8 = -[PKMetalShader newShaderWithBlendMode:](v5, 7);
            goto LABEL_22;
          }
          break;
        case 8:
          uint64_t v7 = v5 + 17;
          unint64_t v6 = v5[17];
          if (!v6)
          {
            uint64_t v8 = -[PKMetalShader newShaderWithBlendMode:](v5, 8);
LABEL_22:
            uint64_t v9 = *v7;
            void *v7 = (void *)v8;

            unint64_t v6 = *v7;
          }
          break;
        default:
          break;
      }
      id v10 = v6;
      objc_sync_exit(v5);

      id v5 = (void **)v10;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invertBlendModeShader, 0);
  objc_storeStrong((id *)&self->_maxBlendModeShader, 0);
  objc_storeStrong((id *)&self->_subtractBlendModeShader, 0);
  objc_storeStrong((id *)&self->_sourceOverBlendModeShader, 0);
  objc_storeStrong((id *)&self->_multiplyBlendModeShader, 0);
  objc_storeStrong((id *)&self->_linearDodgeBlendModeShader, 0);
  objc_storeStrong((id *)&self->_addNoAlphaBlendModeShader, 0);
  objc_storeStrong((id *)&self->_addBlendModeShader, 0);
  objc_storeStrong((id *)&self->_noBlendModeShader, 0);
  objc_storeStrong((id *)&self->_sharedPipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_msaaPipelineStateWithColorMaskNone, 0);
  objc_storeStrong((id *)&self->_msaaPipelineState, 0);
  objc_storeStrong((id *)&self->_pipelineStateWithColorMaskNone, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_fragmentFunction, 0);

  objc_storeStrong((id *)&self->_vertexFunction, 0);
}

@end