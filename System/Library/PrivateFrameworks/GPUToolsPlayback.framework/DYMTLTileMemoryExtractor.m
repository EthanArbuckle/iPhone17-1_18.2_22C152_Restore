@interface DYMTLTileMemoryExtractor
- (BOOL)encodeImageBlockDataReturn:(id)a3 isDrawCall:(BOOL)a4;
- (BOOL)getImageBlockStatus;
- (BOOL)getThreadgroupStatus;
- (BOOL)isArgumentExplicitImageBlock:(id)a3;
- (DYMTLTileMemoryExtractor)initWithRenderEncoder:(id)a3 metalDevice:(id)a4 tileSize:(id *)a5 texSize:(id *)a6;
- (id).cxx_construct;
- (id)_generateFunctionFromImageBlockMember:(DYMTLImageBlockMember *)a3 WithIndex:(unint64_t)a4;
- (id)_generateImageBlockShaderStringWithMember:(DYMTLImageBlockMember *)a3 index:(unint64_t)a4;
- (id)_generateImageBlockStructMember:(DYMTLImageBlockMember *)a3 WithCurrentName:(id)a4 WithIndent:(unint64_t)a5;
- (id)_generateIndentString:(unint64_t)a3;
- (id)_generateKernelFunctionFromString:(id)a3 funcName:(id)a4;
- (id)_generateStringForWritingDataToTexture:(unint64_t)a3;
- (id)_generateTextureFromImageBlockMember:(DYMTLImageBlockMember *)a3;
- (id)_generateThreadgroupShaderStringWithThreadgroupIndex:(unint64_t)a3 size:(unint64_t)a4;
- (id)_generateTileRenderPipelineStateWithTileFunction:(id)a3 renderPassDescriptor:(id)a4 renderPipelineState:(id)a5;
- (id)_processArrayType:(id)a3 WithProcessedArgument:(void *)a4 WithMemberName:(id)a5 WithCurrentName:(id)a6 WithIndent:(unint64_t)a7;
- (id)_processStructMember:(id)a3 WithProcessedArgument:(void *)a4 WithMemberName:(id)a5 WithIndent:(unint64_t)a6;
- (id)_processStructType:(id)a3 WithProcessedArgument:(void *)a4 WithMemberName:(id)a5 WithIndent:(unint64_t)a6;
- (id)harvestThreadgroupAtIndex:(unint64_t)a3 size:(unint64_t)a4;
- (void)_createDataTypeToStringDictionary;
- (void)_processArgument:(id)a3 WithImageBlockVector:(void *)a4;
- (void)harvestImageBlockData:(void *)a3;
- (void)processReflection:(id)a3 isDrawCall:(BOOL)a4;
@end

@implementation DYMTLTileMemoryExtractor

- (DYMTLTileMemoryExtractor)initWithRenderEncoder:(id)a3 metalDevice:(id)a4 tileSize:(id *)a5 texSize:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DYMTLTileMemoryExtractor;
  v13 = [(DYMTLTileMemoryExtractor *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_renderEncoder, a3);
    objc_storeStrong((id *)&v14->_device, a4);
    long long v15 = *(_OWORD *)&a5->var0;
    v14->_tileSize.depth = a5->var2;
    *(_OWORD *)&v14->_tileSize.width = v15;
    long long v16 = *(_OWORD *)&a6->var0;
    v14->_textureSize.depth = a6->var2;
    *(_OWORD *)&v14->_textureSize.width = v16;
    *(_WORD *)&v14->_aliasImplicitImageBlock = 0;
    v14->_aliasImplicitImageBlockColorIndex = 0;
    [(DYMTLTileMemoryExtractor *)v14 _createDataTypeToStringDictionary];
  }

  return v14;
}

- (void)processReflection:(id)a3 isDrawCall:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  self->_imageBlockArgumentsFromFragment.__end_ = self->_imageBlockArgumentsFromFragment.__begin_;
  self->_imageBlockArgumentsFromTile.__end_ = self->_imageBlockArgumentsFromTile.__begin_;
  self->_fragmentMemberIndex = 0;
  BOOL v7 = [(DYMTLTileMemoryExtractor *)self encodeImageBlockDataReturn:v6 isDrawCall:v4];
  v8 = [v6 fragmentBindings];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __57__DYMTLTileMemoryExtractor_processReflection_isDrawCall___block_invoke;
  v18[3] = &unk_265339190;
  v18[4] = self;
  [v8 enumerateObjectsUsingBlock:v18];

  v9 = [v6 tileBindings];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__DYMTLTileMemoryExtractor_processReflection_isDrawCall___block_invoke_2;
  v16[3] = &unk_2653390A8;
  v16[4] = self;
  id v10 = v6;
  id v17 = v10;
  [v9 enumerateObjectsUsingBlock:v16];

  if (v7)
  {
    id v11 = [v10 vertexBuiltInArguments];
    if (![v11 count])
    {
      id v12 = [v10 vertexBindings];
      if (![v12 count])
      {
        v14 = [v10 fragmentBindings];
        uint64_t v15 = [v14 count];

        if (!v15)
        {
          self->_imageBlockStatus = 2;
          v13 = [v10 imageBlockDataReturn];
          [(DYMTLTileMemoryExtractor *)self _processArgument:v13 WithImageBlockVector:&self->_imageBlockArgumentsFromTile];
          goto LABEL_7;
        }
LABEL_6:
        self->_imageBlockStatus = 1;
        v13 = [v10 imageBlockDataReturn];
        [(DYMTLTileMemoryExtractor *)self _processArgument:v13 WithImageBlockVector:&self->_imageBlockArgumentsFromFragment];
LABEL_7:

        goto LABEL_8;
      }
    }
    goto LABEL_6;
  }
LABEL_8:
}

void __57__DYMTLTileMemoryExtractor_processReflection_isDrawCall___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 type];
  BOOL v4 = *(void **)(a1 + 32);
  if (v3 == 1)
  {
    v4[25] = 3;
  }
  else if ([v4 isArgumentExplicitImageBlock:v5])
  {
    *(void *)(*(void *)(a1 + 32) + 192) = 1;
    [*(id *)(a1 + 32) _processArgument:v5 WithImageBlockVector:*(void *)(a1 + 32) + 104];
  }
}

void __57__DYMTLTileMemoryExtractor_processReflection_isDrawCall___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 type];
  BOOL v4 = *(void **)(a1 + 32);
  if (v3 == 1)
  {
    v4[25] = 3;
  }
  else if ([v4 isArgumentExplicitImageBlock:v8])
  {
    *(void *)(*(void *)(a1 + 32) + 192) = 2;
    id v5 = [*(id *)(a1 + 40) imageBlockDataReturn];

    id v6 = *(char **)(a1 + 32);
    if (v5)
    {
      BOOL v7 = [*(id *)(a1 + 40) imageBlockDataReturn];
      [v6 _processArgument:v7 WithImageBlockVector:*(void *)(a1 + 32) + 128];
    }
    else
    {
      [*(id *)(a1 + 32) _processArgument:v8 WithImageBlockVector:v6 + 128];
    }
  }
}

- (BOOL)isArgumentExplicitImageBlock:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 type];
  BOOL v5 = v4 == 16 || v4 == 17 && [v3 imageBlockKind] == 1;

  return v5;
}

- (BOOL)encodeImageBlockDataReturn:(id)a3 isDrawCall:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [v6 imageBlockDataReturn];
  if (v7 && [(DYMTLTileMemoryExtractor *)self isArgumentExplicitImageBlock:v7])
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    if (v4)
    {
      id v8 = [v6 fragmentBindings];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __66__DYMTLTileMemoryExtractor_encodeImageBlockDataReturn_isDrawCall___block_invoke;
      v16[3] = &unk_2653391B8;
      v16[4] = self;
      id v17 = v7;
      objc_super v18 = &v19;
      [v8 enumerateObjectsUsingBlock:v16];

      BOOL v9 = *((unsigned char *)v20 + 24) == 0;
      id v10 = v17;
    }
    else
    {
      id v11 = [v6 tileBindings];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __66__DYMTLTileMemoryExtractor_encodeImageBlockDataReturn_isDrawCall___block_invoke_2;
      v13[3] = &unk_2653391B8;
      v13[4] = self;
      id v14 = v7;
      uint64_t v15 = &v19;
      [v11 enumerateObjectsUsingBlock:v13];

      BOOL v9 = *((unsigned char *)v20 + 24) == 0;
      id v10 = v14;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __66__DYMTLTileMemoryExtractor_encodeImageBlockDataReturn_isDrawCall___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isArgumentExplicitImageBlock:*(void *)(a1 + 40)];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __66__DYMTLTileMemoryExtractor_encodeImageBlockDataReturn_isDrawCall___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isArgumentExplicitImageBlock:*(void *)(a1 + 40)];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)getImageBlockStatus
{
  return self->_imageBlockStatus - 1 < 2;
}

- (BOOL)getThreadgroupStatus
{
  return self->_threadgroupStatus == 3;
}

- (void)harvestImageBlockData:(void *)a3
{
  uint64_t v19 = [(DYMTLStatefulRenderCommandEncoder *)self->_renderEncoder renderPipelineState];
  BOOL v5 = [(DYMTLStatefulRenderCommandEncoder *)self->_renderEncoder descriptor];
  if (self->_imageBlockStatus == 2) {
    std::vector<unsigned long long>::__assign_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>((char *)&self->_imageBlockArgumentsFromFragment, (char *)self->_imageBlockArgumentsFromTile.__begin_, (uint64_t)self->_imageBlockArgumentsFromTile.__end_, self->_imageBlockArgumentsFromTile.__end_ - self->_imageBlockArgumentsFromTile.__begin_);
  }
  begin = self->_imageBlockArgumentsFromFragment.__begin_;
  end = self->_imageBlockArgumentsFromFragment.__end_;
  if (end != begin)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      id v10 = begin[v9];
      uint64_t v11 = *((void *)v10 + 9);
      if (*((void *)v10 + 10) != v11)
      {
        unint64_t v18 = v9;
        uint64_t v12 = 0;
        unint64_t v13 = 0;
        do
        {
          uint64_t v14 = v11 + v12;
          -[DYMTLTileMemoryExtractor _generateTextureFromImageBlockMember:](self, "_generateTextureFromImageBlockMember:", v11 + v12, v18);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v15 = [(DYMTLTileMemoryExtractor *)self _generateFunctionFromImageBlockMember:v14 WithIndex:v8 + v13];
          long long v16 = [(DYMTLTileMemoryExtractor *)self _generateTileRenderPipelineStateWithTileFunction:v15 renderPassDescriptor:v5 renderPipelineState:v19];
          [(DYMTLStatefulRenderCommandEncoder *)self->_renderEncoder pushDebugGroup:@"Dump Tile Data"];
          [(DYMTLStatefulRenderCommandEncoder *)self->_renderEncoder setRenderPipelineState:v16];
          [(DYMTLStatefulRenderCommandEncoder *)self->_renderEncoder setTileTexture:v22 atIndex:0];
          renderEncoder = self->_renderEncoder;
          long long v20 = *(_OWORD *)&self->_tileSize.width;
          unint64_t depth = self->_tileSize.depth;
          [(DYMTLStatefulRenderCommandEncoder *)renderEncoder dispatchThreadsPerTile:&v20];
          [(DYMTLStatefulRenderCommandEncoder *)self->_renderEncoder popDebugGroup];
          std::vector<objc_object  {objcproto11MTLResource}* {__strong}>::push_back[abi:ne180100]((char **)a3, &v22);

          ++v13;
          uint64_t v11 = *((void *)v10 + 9);
          v12 += 40;
        }
        while (v13 < 0xCCCCCCCCCCCCCCCDLL * ((*((void *)v10 + 10) - v11) >> 3));
        begin = self->_imageBlockArgumentsFromFragment.__begin_;
        end = self->_imageBlockArgumentsFromFragment.__end_;
        v8 += v13;
        unint64_t v9 = v18;
      }
      ++v9;
    }
    while (v9 < end - begin);
  }
}

- (id)harvestThreadgroupAtIndex:(unint64_t)a3 size:(unint64_t)a4
{
  BOOL v7 = [(DYMTLStatefulRenderCommandEncoder *)self->_renderEncoder renderPipelineState];
  uint64_t v8 = [(DYMTLStatefulRenderCommandEncoder *)self->_renderEncoder descriptor];
  uint64_t v9 = DYMTLGetNullableAssociatedObject(v7, 0);
  uint64_t v10 = DYMTLGetNullableAssociatedObject(v7, 1u);
  if (v9 | v10)
  {
    uint64_t v27 = v10;
    v28 = v7;
    uint64_t v29 = v9;
    v26 = [(DYMTLTileMemoryExtractor *)self _generateThreadgroupShaderStringWithThreadgroupIndex:a3 size:a4];
    v31 = [(DYMTLTileMemoryExtractor *)self _generateKernelFunctionFromString:v26 funcName:@"dumpThreadgroupData"];
    uint64_t v30 = [(MTLDeviceSPI *)self->_device newBufferWithLength:vcvtps_u32_f32((float)self->_textureSize.width / (float)self->_tileSize.width)* a4* vcvtps_u32_f32((float)self->_textureSize.height / (float)self->_tileSize.height) options:0];
    uint64_t v11 = objc_opt_new();
    [v11 setLabel:@"Tile Pipeline for dumping Threadgroup data"];
    if (v10) {
      uint64_t v12 = [(id)v10 rasterSampleCount];
    }
    else {
      uint64_t v12 = [(id)v9 rasterSampleCount];
    }
    [v11 setRasterSampleCount:v12];
    for (uint64_t i = 0; i != 8; ++i)
    {
      uint64_t v15 = [v8 colorAttachments];
      long long v16 = [v15 objectAtIndexedSubscript:i];
      id v17 = [v16 texture];
      uint64_t v18 = [v17 pixelFormat];
      uint64_t v19 = [v11 colorAttachments];
      long long v20 = [v19 objectAtIndexedSubscript:i];
      [v20 setPixelFormat:v18];
    }
    [v11 setThreadgroupSizeMatchesTileSize:0];
    [v11 setTileFunction:v31];
    device = self->_device;
    id v34 = 0;
    id v22 = (void *)[(MTLDeviceSPI *)device newRenderPipelineStateWithTileDescriptor:v11 error:&v34];
    id v23 = v34;
    DYMTLSetAssociatedObject(v22, 1u, v11);
    [(DYMTLStatefulRenderCommandEncoder *)self->_renderEncoder pushDebugGroup:@"Dump Tile Threadgroup Data"];
    [(DYMTLStatefulRenderCommandEncoder *)self->_renderEncoder setRenderPipelineState:v22];
    [(DYMTLStatefulRenderCommandEncoder *)self->_renderEncoder setTileBuffer:v30 offset:0 atIndex:0];
    renderEncoder = self->_renderEncoder;
    int64x2_t v32 = vdupq_n_s64(1uLL);
    uint64_t v33 = 1;
    [(DYMTLStatefulRenderCommandEncoder *)renderEncoder dispatchThreadsPerTile:&v32];
    [(DYMTLStatefulRenderCommandEncoder *)self->_renderEncoder popDebugGroup];

    BOOL v7 = v28;
    uint64_t v9 = v29;
    uint64_t v10 = v27;
    unint64_t v13 = (void *)v30;
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (void)_processArgument:(id)a3 WithImageBlockVector:(void *)a4
{
}

- (id)_processStructType:(id)a3 WithProcessedArgument:(void *)a4 WithMemberName:(id)a5 WithIndent:(unint64_t)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v19 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [a3 members];
  id obj = v10;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    unint64_t v13 = &stru_2700F08A8;
    do
    {
      uint64_t v14 = 0;
      uint64_t v15 = v13;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(obj);
        }
        long long v16 = [(DYMTLTileMemoryExtractor *)self _processStructMember:*(void *)(*((void *)&v20 + 1) + 8 * v14) WithProcessedArgument:a4 WithMemberName:v19 WithIndent:a6];
        unint64_t v13 = [NSString stringWithFormat:@"%@%@", v15, v16];

        ++v14;
        uint64_t v15 = v13;
      }
      while (v11 != v14);
      uint64_t v10 = obj;
      uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
  else
  {
    unint64_t v13 = &stru_2700F08A8;
  }

  return v13;
}

- (id)_processArrayType:(id)a3 WithProcessedArgument:(void *)a4 WithMemberName:(id)a5 WithCurrentName:(id)a6 WithIndent:(unint64_t)a7
{
  id v12 = a3;
  id v38 = a5;
  id v39 = a6;
  v40 = v12;
  unint64_t v13 = [v12 elementStructType];

  if (v13)
  {
    v36 = [(DYMTLTileMemoryExtractor *)self _generateIndentString:a7];
    uint64_t v14 = [v12 arrayLength];
    if (v14)
    {
      uint64_t v15 = 0;
      long long v16 = 0;
      unint64_t v17 = a7 + 1;
      do
      {
        uint64_t v18 = [NSString stringWithFormat:@"%@%@[%ld].", v38, v39, v15];
        id v19 = [v12 elementStructType];
        long long v20 = [(DYMTLTileMemoryExtractor *)self _processStructType:v19 WithProcessedArgument:a4 WithMemberName:v18 WithIndent:v17];

        ++v15;
        long long v16 = v20;
      }
      while (v14 != v15);
    }
    else
    {
      long long v20 = 0;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"%@struct\n%@{\n%@%@}%@[%ld];\n",
      v36,
      v36,
      v20,
      v36,
      v39,
    BOOL v7 = v14);
  }
  else
  {
    long long v21 = [v12 elementArrayType];

    if (!v21)
    {
      v41 = &stru_2700F08A8;
      v42 = &stru_2700F08A8;
      *(void *)&long long v43 = [v12 pixelFormat];
      *((void *)&v43 + 1) = [v12 aluType];
      uint64_t v44 = [v12 arrayLength];
      if ([v39 containsString:@"user("]
      {
        long long v22 = [NSString stringWithFormat:@"%@fragmentMember%ld", v38, self->_fragmentMemberIndex];
        long long v23 = v41;
        v41 = v22;

        objc_storeStrong((id *)&v42, a6);
        unint64_t v24 = *((void *)a4 + 10);
        if (v24 >= *((void *)a4 + 11))
        {
          uint64_t v26 = std::vector<DYMTLImageBlockMember>::__push_back_slow_path<DYMTLImageBlockMember const&>((uint64_t *)a4 + 9, (uint64_t)&v41);
        }
        else
        {
          *(void *)unint64_t v24 = v22;
          *(void *)(v24 + 8) = v39;
          uint64_t v25 = v44;
          *(_OWORD *)(v24 + 16) = v43;
          *(void *)(v24 + 32) = v25;
          uint64_t v26 = v24 + 40;
        }
        *((void *)a4 + 10) = v26;
        uint64_t v33 = NSString;
        unint64_t fragmentMemberIndex = self->_fragmentMemberIndex;
        self->_unint64_t fragmentMemberIndex = fragmentMemberIndex + 1;
        v35 = objc_msgSend(v33, "stringWithFormat:", @"fragmentMember%ld", fragmentMemberIndex);
        BOOL v7 = [(DYMTLTileMemoryExtractor *)self _generateImageBlockStructMember:&v41 WithCurrentName:v35 WithIndent:a7];
      }
      else
      {
        ++self->_fragmentMemberIndex;
        v28 = [NSString stringWithFormat:@"%@%@", v38, v39];
        uint64_t v29 = v41;
        v41 = v28;

        unint64_t v30 = *((void *)a4 + 10);
        if (v30 >= *((void *)a4 + 11))
        {
          uint64_t v32 = std::vector<DYMTLImageBlockMember>::__push_back_slow_path<DYMTLImageBlockMember const&>((uint64_t *)a4 + 9, (uint64_t)&v41);
        }
        else
        {
          *(void *)unint64_t v30 = v28;
          *(void *)(v30 + 8) = v42;
          uint64_t v31 = v44;
          *(_OWORD *)(v30 + 16) = v43;
          *(void *)(v30 + 32) = v31;
          uint64_t v32 = v30 + 40;
        }
        *((void *)a4 + 10) = v32;
        BOOL v7 = [(DYMTLTileMemoryExtractor *)self _generateImageBlockStructMember:&v41 WithCurrentName:v39 WithIndent:a7];
      }
    }
  }

  return v7;
}

- (id)_processStructMember:(id)a3 WithProcessedArgument:(void *)a4 WithMemberName:(id)a5 WithIndent:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [v10 structType];

  if (v12)
  {
    unint64_t v13 = [(DYMTLTileMemoryExtractor *)self _generateIndentString:a6];
    uint64_t v14 = NSString;
    uint64_t v15 = [v10 name];
    long long v16 = [v14 stringWithFormat:@"%@%@.", v11, v15];

    unint64_t v17 = [v10 structType];
    uint64_t v18 = [(DYMTLTileMemoryExtractor *)self _processStructType:v17 WithProcessedArgument:a4 WithMemberName:v16 WithIndent:a6 + 1];

    id v19 = NSString;
    long long v20 = [v10 name];
    long long v21 = [v19 stringWithFormat:@"%@struct\n%@{\n%@%@}%@;\n", v13, v13, v18, v13, v20];

LABEL_5:
    goto LABEL_6;
  }
  long long v22 = [v10 arrayType];

  if (v22)
  {
    unint64_t v13 = [v10 arrayType];
    long long v16 = [v10 name];
    long long v21 = [(DYMTLTileMemoryExtractor *)self _processArrayType:v13 WithProcessedArgument:a4 WithMemberName:v11 WithCurrentName:v16 WithIndent:a6];
    goto LABEL_5;
  }
  long long v43 = &stru_2700F08A8;
  uint64_t v44 = &stru_2700F08A8;
  uint64_t v46 = 0;
  *(void *)&long long v45 = [v10 pixelFormat];
  *((void *)&v45 + 1) = [v10 aluType];
  unint64_t v24 = [v10 name];
  int v25 = objc_msgSend(v24, "containsString:", @"user(");

  uint64_t v26 = NSString;
  if (v25)
  {
    unint64_t fragmentMemberIndex = self->_fragmentMemberIndex;
    self->_unint64_t fragmentMemberIndex = fragmentMemberIndex + 1;
    v28 = objc_msgSend(v26, "stringWithFormat:", @"fragmentMember%ld", fragmentMemberIndex);
    uint64_t v29 = [NSString stringWithFormat:@"%@%@", v11, v28];
    unint64_t v30 = v43;
    long long v43 = v29;

    uint64_t v31 = [v10 name];
    uint64_t v32 = v44;
    uint64_t v44 = v31;

    unint64_t v33 = *((void *)a4 + 10);
    if (v33 >= *((void *)a4 + 11))
    {
      uint64_t v35 = std::vector<DYMTLImageBlockMember>::__push_back_slow_path<DYMTLImageBlockMember const&>((uint64_t *)a4 + 9, (uint64_t)&v43);
    }
    else
    {
      *(void *)unint64_t v33 = v43;
      *(void *)(v33 + 8) = v31;
      uint64_t v34 = v46;
      *(_OWORD *)(v33 + 16) = v45;
      *(void *)(v33 + 32) = v34;
      uint64_t v35 = v33 + 40;
    }
    *((void *)a4 + 10) = v35;
    uint64_t v42 = [(DYMTLTileMemoryExtractor *)self _generateImageBlockStructMember:&v43 WithCurrentName:v28 WithIndent:a6];
  }
  else
  {
    v36 = [v10 name];
    v37 = [v26 stringWithFormat:@"%@%@", v11, v36];
    id v38 = v43;
    long long v43 = v37;

    unint64_t v39 = *((void *)a4 + 10);
    if (v39 >= *((void *)a4 + 11))
    {
      uint64_t v41 = std::vector<DYMTLImageBlockMember>::__push_back_slow_path<DYMTLImageBlockMember const&>((uint64_t *)a4 + 9, (uint64_t)&v43);
    }
    else
    {
      *(void *)unint64_t v39 = v37;
      *(void *)(v39 + 8) = v44;
      uint64_t v40 = v46;
      *(_OWORD *)(v39 + 16) = v45;
      *(void *)(v39 + 32) = v40;
      uint64_t v41 = v39 + 40;
    }
    *((void *)a4 + 10) = v41;
    ++self->_fragmentMemberIndex;
    v28 = [v10 name];
    uint64_t v42 = [(DYMTLTileMemoryExtractor *)self _generateImageBlockStructMember:&v43 WithCurrentName:v28 WithIndent:a6];
  }
  long long v21 = (void *)v42;

LABEL_6:
  return v21;
}

- (id)_generateTextureFromImageBlockMember:(DYMTLImageBlockMember *)a3
{
  unint64_t var2 = a3->var2;
  if (!var2)
  {
    dataTypeToTextureTypeForInvalidPixelFormatMap = self->_dataTypeToTextureTypeForInvalidPixelFormatMap;
    BOOL v7 = [NSNumber numberWithUnsignedInteger:a3->var3];
    uint64_t v8 = [(NSDictionary *)dataTypeToTextureTypeForInvalidPixelFormatMap objectForKeyedSubscript:v7];
    unint64_t var2 = [v8 unsignedIntegerValue];
  }
  if (a3->var4)
  {
    uint64_t v9 = objc_opt_new();
    [v9 setTextureType:3];
    [v9 setPixelFormat:var2];
    [v9 setWidth:self->_textureSize.width];
    [v9 setHeight:self->_textureSize.height];
    [v9 setDepth:1];
    [v9 setArrayLength:a3->var4];
    [v9 setMipmapLevelCount:1];
    [v9 setSampleCount:1];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F12A58] texture2DDescriptorWithPixelFormat:var2 width:self->_textureSize.width height:self->_textureSize.height mipmapped:0];
  }
  [v9 setUsage:2];
  [v9 setStorageMode:0];
  [v9 setSampleCount:1];
  id v10 = DYMTLNewTexture(self->_device, v9);

  return v10;
}

- (id)_generateFunctionFromImageBlockMember:(DYMTLImageBlockMember *)a3 WithIndex:(unint64_t)a4
{
  BOOL v5 = [(DYMTLTileMemoryExtractor *)self _generateImageBlockShaderStringWithMember:a3 index:a4];
  id v6 = [(DYMTLTileMemoryExtractor *)self _generateKernelFunctionFromString:v5 funcName:@"dumpImageBlockData"];

  return v6;
}

- (id)_generateTileRenderPipelineStateWithTileFunction:(id)a3 renderPassDescriptor:(id)a4 renderPipelineState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = DYMTLGetNullableAssociatedObject(v10, 0);
  uint64_t v29 = v10;
  uint64_t v12 = DYMTLGetNullableAssociatedObject(v10, 1u);
  unint64_t v13 = objc_opt_new();
  [v13 setLabel:@"Tile Pipeline for dumping Image Block data"];
  [v13 setThreadgroupSizeMatchesTileSize:1];
  [v13 setTileFunction:v8];
  if (self->_imageBlockStatus == 1) {
    uint64_t v14 = (void *)v11;
  }
  else {
    uint64_t v14 = (void *)v12;
  }
  objc_msgSend(v13, "setSampleCount:", objc_msgSend(v14, "sampleCount"));
  uint64_t v26 = (void *)v12;
  uint64_t v27 = (void *)v11;
  v28 = v8;
  for (uint64_t i = 0; i != 8; ++i)
  {
    long long v16 = [v9 colorAttachments];
    unint64_t v17 = [v16 objectAtIndexedSubscript:i];
    uint64_t v18 = [v17 texture];
    uint64_t v19 = [v18 pixelFormat];
    long long v20 = [v13 colorAttachments];
    long long v21 = [v20 objectAtIndexedSubscript:i];
    [v21 setPixelFormat:v19];
  }
  device = self->_device;
  id v30 = 0;
  long long v23 = (void *)[(MTLDeviceSPI *)device newRenderPipelineStateWithTileDescriptor:v13 error:&v30];
  id v24 = v30;
  DYMTLSetAssociatedObject(v23, 1u, v13);

  return v23;
}

- (id)_generateStringForWritingDataToTexture:(unint64_t)a3
{
  dataTypeToChannelCount = self->_dataTypeToChannelCount;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  BOOL v7 = [(NSDictionary *)dataTypeToChannelCount objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 unsignedIntegerValue];

  dataTypeToTextureComponentTypeStringMap = self->_dataTypeToTextureComponentTypeStringMap;
  id v10 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v11 = [(NSDictionary *)dataTypeToTextureComponentTypeStringMap objectForKeyedSubscript:v10];

  if ((unint64_t)(v8 - 1) >= 4)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", off_2653391D8[v8 - 1], v11);
  }

  return v12;
}

- (id)_generateIndentString:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v3 = a3;
    BOOL v4 = &stru_2700F08A8;
    do
    {
      BOOL v5 = [NSString stringWithFormat:@"    %@", v4];

      BOOL v4 = v5;
      --v3;
    }
    while (v3);
  }
  else
  {
    BOOL v5 = &stru_2700F08A8;
  }
  return v5;
}

- (id)_generateImageBlockStructMember:(DYMTLImageBlockMember *)a3 WithCurrentName:(id)a4 WithIndent:(unint64_t)a5
{
  id v8 = a4;
  id v9 = [(DYMTLTileMemoryExtractor *)self _generateIndentString:a5];
  dataTypeToImageBlockTypeStringMap = self->_dataTypeToImageBlockTypeStringMap;
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3->var3];
  uint64_t v12 = [(NSDictionary *)dataTypeToImageBlockTypeStringMap objectForKeyedSubscript:v11];

  if (a3->var2)
  {
    pixelFormatToDataTypeStringMap = self->_pixelFormatToDataTypeStringMap;
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    uint64_t v15 = [(NSDictionary *)pixelFormatToDataTypeStringMap objectForKeyedSubscript:v14];

    [NSString stringWithFormat:@"%@%@<%@>", v9, v15, v12];
  }
  else
  {
    uint64_t v15 = 0;
    [NSString stringWithFormat:@"%@%@", v9, v12];
  long long v16 = };
  unint64_t v17 = [NSString stringWithFormat:@"%@ %@", v16, v8];

  unint64_t var4 = a3->var4;
  if (var4)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%@[%lu]", v17, var4];

    long long v20 = (void *)v19;
  }
  else
  {
    long long v20 = v17;
  }
  if ([a3->var1 isEqualToString:&stru_2700F08A8]) {
    [NSString stringWithFormat:@"%@;\n", v20];
  }
  else {
  long long v21 = [NSString stringWithFormat:@"%@[[ %@ ]];\n", v20, a3->var1];
  }

  return v21;
}

- (id)_generateImageBlockShaderStringWithMember:(DYMTLImageBlockMember *)a3 index:(unint64_t)a4
{
  unint64_t var3 = a3->var3;
  if (self->_aliasImplicitImageBlock)
  {
    id v8 = CFSTR("kernel void dumpImageBlockData(imageblock<ImageblockMaster, imageblock_layout_explicit> imageBlock [[ alias_implicit_imageblock ]],\n");
LABEL_3:
    unint64_t v39 = v8;
    goto LABEL_6;
  }
  if (!self->_aliasImplicitImageBlockColor)
  {
    id v8 = CFSTR("kernel void dumpImageBlockData(imageblock<ImageblockMaster, imageblock_layout_explicit> imageBlock,\n");
    goto LABEL_3;
  }
  unint64_t v39 = objc_msgSend(NSString, "stringWithFormat:", @"kernel void dumpImageBlockData(imageblock<ImageblockMaster, imageblock_layout_explicit> imageBlock [[ alias_implicit_imageblock_color(%ld) ]],\n"), self->_aliasImplicitImageBlockColorIndex;
LABEL_6:
  id v9 = NSString;
  dataTypeToTextureComponentTypeStringMap = self->_dataTypeToTextureComponentTypeStringMap;
  if (!a3->var4)
  {
    v28 = [NSNumber numberWithUnsignedInteger:var3];
    uint64_t v29 = [(NSDictionary *)dataTypeToTextureComponentTypeStringMap objectForKeyedSubscript:v28];
    unint64_t v13 = [v9 stringWithFormat:@"                               texture2d<%@, access::write> imageBlockData [[ texture(0) ]]\n"], v29);

    char v30 = [a3->var1 isEqualToString:&stru_2700F08A8];
    uint64_t v31 = NSString;
    if ((v30 & 1) == 0)
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"fragmentMember%ld", a4);
      uint64_t v35 = NSString;
      dataTypeToImageBlockTypeStringMap = self->_dataTypeToImageBlockTypeStringMap;
      uint64_t v18 = [NSNumber numberWithUnsignedInteger:var3];
      uint64_t v19 = [(NSDictionary *)dataTypeToImageBlockTypeStringMap objectForKeyedSubscript:v18];
      [(DYMTLTileMemoryExtractor *)self _generateStringForWritingDataToTexture:var3];
      long long v21 = v20 = 0x263F08000uLL;
      [v35 stringWithFormat:@"    threadgroup_imageblock ImageblockMaster* ib = imageBlock.data(lid);\n    %@ currData = ib->%@;\n    %@;\n"],
        v19,
        v14,
      uint64_t v22 = v21);
      goto LABEL_15;
    }
    uint64_t v32 = self->_dataTypeToImageBlockTypeStringMap;
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:var3];
    uint64_t v18 = [(NSDictionary *)v32 objectForKeyedSubscript:v14];
    id var0 = a3->var0;
    [(DYMTLTileMemoryExtractor *)self _generateStringForWritingDataToTexture:var3];
    uint64_t v19 = v20 = 0x263F08000;
    [v31 stringWithFormat:@"    threadgroup_imageblock ImageblockMaster* ib = imageBlock.data(lid);\n    %@ currData = ib->%@;\n    %@;\n"],
      v18,
      var0,
    uint64_t v27 = v19);
LABEL_13:
    uint64_t v34 = (void *)v27;
    goto LABEL_16;
  }
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:var3];
  uint64_t v12 = [(NSDictionary *)dataTypeToTextureComponentTypeStringMap objectForKeyedSubscript:v11];
  unint64_t v13 = [v9 stringWithFormat:@"                               texture2d_array<%@, access::write> imageBlockData [[ texture(0) ]]\n"], v12);

  if (self->_imageBlockStatus != 1 || ![a3->var1 length])
  {
    long long v23 = NSString;
    unint64_t var4 = a3->var4;
    int v25 = self->_dataTypeToImageBlockTypeStringMap;
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:var3];
    uint64_t v18 = [(NSDictionary *)v25 objectForKeyedSubscript:v14];
    id v26 = a3->var0;
    [(DYMTLTileMemoryExtractor *)self _generateStringForWritingDataToTexture:var3];
    uint64_t v19 = v20 = 0x263F08000;
    [v23 stringWithFormat:@"    threadgroup_imageblock ImageblockMaster* ib = imageBlock.data(lid);\n    for (int uint64_t i = 0; i < %ld; ++i)\n    {\n        %@ currData = ib->%@[i];\n        %@, i;\n    }\n"],
      var4,
      v18,
      v26,
    uint64_t v27 = v19);
    goto LABEL_13;
  }
  uint64_t v14 = [NSString stringWithFormat:@"%@fragmentMember%ld", a3->var0, a4];
  uint64_t v15 = NSString;
  unint64_t v16 = a3->var4;
  unint64_t v17 = self->_dataTypeToImageBlockTypeStringMap;
  uint64_t v18 = [NSNumber numberWithUnsignedInteger:var3];
  uint64_t v19 = [(NSDictionary *)v17 objectForKeyedSubscript:v18];
  [(DYMTLTileMemoryExtractor *)self _generateStringForWritingDataToTexture:var3];
  long long v21 = v20 = 0x263F08000;
  [v15 stringWithFormat:@"    threadgroup_imageblock ImageblockMaster* ib = imageBlock.data(lid);\n    for (int uint64_t i = 0; i < %ld; ++i)\n    {\n        %@ currData = ib->%@[i];\n        %@, i;\n    }\n"],
    v16,
    v19,
    v14,
  uint64_t v22 = v21);
LABEL_15:
  uint64_t v34 = (void *)v22;

LABEL_16:
  objc_msgSend(*(id *)(v20 + 2880), "stringWithFormat:", @"#include <metal_stdlib>\n#include <metal_imageblocks>\n#include <simd/simd.h>\nusing namespace metal;\n\n%@\n%@                               uint2 gid [[ thread_position_in_grid ]],\n                               ushort2 lid [[ thread_position_in_threadgroup ]],\n%@{\n%@}\n",
    self->_imageBlockSignature,
    v39,
    v13,
  v37 = v34);

  return v37;
}

- (id)_generateThreadgroupShaderStringWithThreadgroupIndex:(unint64_t)a3 size:(unint64_t)a4
{
  objc_msgSend(NSString, "stringWithFormat:", @"#include <metal_stdlib>\nusing namespace metal;\n\n#define THREADGROUP_MEMORY_LENGTH %ld\n\nkernel void dumpThreadgroupData(uint2 threadgroupInGrid [[ threadgroup_position_in_grid ]],\n                                uint2 threadgroupsPerGrid [[ threadgroups_per_grid ]],\n                                device uint8_t* threadgroupBufferDump [[ buffer(0) ]],\n                                threadgroup uint8_t* threadgroupData [[ threadgroup(%ld) ]])\n{\n   uint tileIndex = (threadgroupInGrid.y * threadgroupsPerGrid.x) + threadgroupInGrid.x;\n   uint offset = THREADGROUP_MEMORY_LENGTH * tileIndex;\n\n   for (uint32_t uint64_t i = 0; i < THREADGROUP_MEMORY_LENGTH; ++i)\n   {\n       threadgroupBufferDump[offset + i] = threadgroupData[i];\n   }\n}\n",
    a4,
  BOOL v4 = a3);
  return v4;
}

- (id)_generateKernelFunctionFromString:(id)a3 funcName:(id)a4
{
  id v6 = a4;
  device = self->_device;
  id v12 = 0;
  id v8 = (void *)[(MTLDeviceSPI *)device newLibraryWithSource:a3 options:0 error:&v12];
  id v9 = v12;
  id v10 = (void *)[v8 newFunctionWithName:v6];

  return v10;
}

- (void)_createDataTypeToStringDictionary
{
  v22[36] = *MEMORY[0x263EF8340];
  v21[0] = &unk_2700F9918;
  v21[1] = &unk_2700F9930;
  v22[0] = @"float";
  v22[1] = @"float";
  v21[2] = &unk_2700F9948;
  v21[3] = &unk_2700F9960;
  v22[2] = @"float";
  v22[3] = @"float";
  v21[4] = &unk_2700F9978;
  v21[5] = &unk_2700F9990;
  v22[4] = @"half";
  v22[5] = @"half";
  v21[6] = &unk_2700F99A8;
  v21[7] = &unk_2700F99C0;
  v22[6] = @"half";
  v22[7] = @"half";
  v21[8] = &unk_2700F99D8;
  v21[9] = &unk_2700F99F0;
  v22[8] = @"int";
  v22[9] = @"int";
  v21[10] = &unk_2700F9A08;
  v21[11] = &unk_2700F9A20;
  v22[10] = @"int";
  v22[11] = @"int";
  v21[12] = &unk_2700F9A38;
  v21[13] = &unk_2700F9A50;
  v22[12] = @"uint";
  v22[13] = @"uint";
  v21[14] = &unk_2700F9A68;
  v21[15] = &unk_2700F9A80;
  v22[14] = @"uint";
  v22[15] = @"uint";
  v21[16] = &unk_2700F9A98;
  v21[17] = &unk_2700F9AB0;
  v22[16] = @"short";
  v22[17] = @"short";
  v21[18] = &unk_2700F9AC8;
  v21[19] = &unk_2700F9AE0;
  v22[18] = @"short";
  v22[19] = @"short";
  v21[20] = &unk_2700F9AF8;
  v21[21] = &unk_2700F9B10;
  v22[20] = @"ushort";
  v22[21] = @"ushort";
  v21[22] = &unk_2700F9B28;
  v21[23] = &unk_2700F9B40;
  v22[22] = @"ushort";
  v22[23] = @"ushort";
  v21[24] = &unk_2700F9B58;
  v21[25] = &unk_2700F9B70;
  v22[24] = @"int";
  v22[25] = @"int";
  v21[26] = &unk_2700F9B88;
  v21[27] = &unk_2700F9BA0;
  v22[26] = @"int";
  v22[27] = @"int";
  v21[28] = &unk_2700F9BB8;
  v21[29] = &unk_2700F9BD0;
  v22[28] = @"uint";
  v22[29] = @"uint";
  v21[30] = &unk_2700F9BE8;
  v21[31] = &unk_2700F9C00;
  v22[30] = @"uint";
  v22[31] = @"uint";
  v21[32] = &unk_2700F9C18;
  v21[33] = &unk_2700F9C30;
  v22[32] = @"uint";
  v22[33] = @"uint";
  v21[34] = &unk_2700F9C48;
  v21[35] = &unk_2700F9C60;
  v22[34] = @"uint";
  v22[35] = @"uint";
  unint64_t v3 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:36];
  dataTypeToTextureComponentTypeStringMap = self->_dataTypeToTextureComponentTypeStringMap;
  self->_dataTypeToTextureComponentTypeStringMap = v3;

  v20[0] = @"float";
  v20[1] = @"float2";
  v20[2] = @"float3";
  v20[3] = @"float4";
  v20[4] = @"half";
  v20[5] = @"half2";
  v20[6] = @"half3";
  v20[7] = @"half4";
  v20[8] = @"int";
  v20[9] = @"int2";
  v20[10] = @"int3";
  v20[11] = @"int4";
  v20[12] = @"uint";
  v20[13] = @"uint2";
  v20[14] = @"uint3";
  v20[15] = @"uint4";
  v20[16] = @"short";
  v20[17] = @"short2";
  v20[18] = @"short3";
  v20[19] = @"short4";
  v20[20] = @"ushort";
  v20[21] = @"ushort2";
  v20[22] = @"ushort3";
  v20[23] = @"ushort4";
  v20[24] = @"char";
  v20[25] = @"char2";
  v20[26] = @"char3";
  v20[27] = @"char4";
  v20[28] = @"uchar";
  v20[29] = @"uchar2";
  v20[30] = @"uchar3";
  v20[31] = @"uchar4";
  v20[32] = @"BOOL";
  v20[33] = @"BOOL2";
  v20[34] = @"BOOL3";
  v19[0] = &unk_2700F9918;
  v19[1] = &unk_2700F9930;
  v19[2] = &unk_2700F9948;
  v19[3] = &unk_2700F9960;
  v19[4] = &unk_2700F9978;
  v19[5] = &unk_2700F9990;
  v19[6] = &unk_2700F99A8;
  v19[7] = &unk_2700F99C0;
  v19[8] = &unk_2700F99D8;
  v19[9] = &unk_2700F99F0;
  v19[10] = &unk_2700F9A08;
  v19[11] = &unk_2700F9A20;
  v19[12] = &unk_2700F9A38;
  v19[13] = &unk_2700F9A50;
  v19[14] = &unk_2700F9A68;
  v19[15] = &unk_2700F9A80;
  v19[16] = &unk_2700F9A98;
  v19[17] = &unk_2700F9AB0;
  v19[18] = &unk_2700F9AC8;
  v19[19] = &unk_2700F9AE0;
  v19[20] = &unk_2700F9AF8;
  v19[21] = &unk_2700F9B10;
  v19[22] = &unk_2700F9B28;
  v19[23] = &unk_2700F9B40;
  v19[24] = &unk_2700F9B58;
  v19[25] = &unk_2700F9B70;
  v19[26] = &unk_2700F9B88;
  v19[27] = &unk_2700F9BA0;
  v19[28] = &unk_2700F9BB8;
  v19[29] = &unk_2700F9BD0;
  v19[30] = &unk_2700F9BE8;
  v19[31] = &unk_2700F9C00;
  v19[32] = &unk_2700F9C18;
  v19[33] = &unk_2700F9C30;
  v19[34] = &unk_2700F9C48;
  v19[35] = &unk_2700F9C60;
  v20[35] = @"BOOL4";
  BOOL v5 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:36];
  dataTypeToImageBlockTypeStringMap = self->_dataTypeToImageBlockTypeStringMap;
  self->_dataTypeToImageBlockTypeStringMap = v5;

  v17[0] = &unk_2700F9C78;
  v17[1] = &unk_2700F9C90;
  v18[0] = @"r8unorm";
  v18[1] = @"r8snorm";
  v17[2] = &unk_2700F9CA8;
  v17[3] = &unk_2700F9CC0;
  v18[2] = @"r16unorm";
  v18[3] = @"r16snorm";
  v17[4] = &unk_2700F99F0;
  v17[5] = &unk_2700F9A20;
  v18[4] = @"rg8unorm";
  void v18[5] = @"rg8snorm";
  v17[6] = &unk_2700F9CD8;
  v17[7] = &unk_2700F9CF0;
  v18[6] = @"rg16unorm";
  v18[7] = @"rg16snorm";
  v17[8] = &unk_2700F9D08;
  v17[9] = &unk_2700F9D20;
  v18[8] = @"rgba8unorm";
  v18[9] = @"srgba8unorm";
  v17[10] = &unk_2700F9D38;
  v17[11] = &unk_2700F9D50;
  v18[10] = @"rgba8snorm";
  v18[11] = @"rgba16unorm";
  v17[12] = &unk_2700F9D68;
  v17[13] = &unk_2700F9D80;
  v18[12] = @"rgba16snorm";
  v18[13] = @"rgb10a2";
  v17[14] = &unk_2700F9D98;
  v17[15] = &unk_2700F9DB0;
  v18[14] = @"rg11b10f";
  v18[15] = @"rgb9e5";
  BOOL v7 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:16];
  pixelFormatToDataTypeStringMap = self->_pixelFormatToDataTypeStringMap;
  self->_pixelFormatToDataTypeStringMap = v7;

  v16[1] = &unk_2700F9DC8;
  v16[2] = &unk_2700F9DE0;
  v16[3] = &unk_2700F9DE0;
  void v16[5] = &unk_2700F9DF8;
  v16[6] = &unk_2700F9E10;
  v16[7] = &unk_2700F9E10;
  v16[9] = &unk_2700F9E28;
  v16[10] = &unk_2700F9E40;
  v16[11] = &unk_2700F9E40;
  v16[12] = &unk_2700F9E58;
  v16[13] = &unk_2700F9E70;
  v16[14] = &unk_2700F9E88;
  v16[15] = &unk_2700F9E88;
  v16[16] = &unk_2700F9EA0;
  v16[17] = &unk_2700F9EB8;
  v16[18] = &unk_2700F9ED0;
  v16[19] = &unk_2700F9ED0;
  v16[20] = &unk_2700F9EE8;
  v16[0] = &unk_2700F9C30;
  v16[4] = &unk_2700F9C18;
  v16[8] = &unk_2700F9C48;
  v15[0] = &unk_2700F99D8;
  v15[1] = &unk_2700F99F0;
  v15[2] = &unk_2700F9A08;
  v15[3] = &unk_2700F9A20;
  v15[4] = &unk_2700F9A38;
  v15[5] = &unk_2700F9A50;
  v15[6] = &unk_2700F9A68;
  v15[7] = &unk_2700F9A80;
  v15[8] = &unk_2700F9918;
  v15[9] = &unk_2700F9930;
  v15[10] = &unk_2700F9948;
  v15[11] = &unk_2700F9960;
  v15[12] = &unk_2700F9978;
  v15[13] = &unk_2700F9990;
  v15[14] = &unk_2700F99A8;
  v15[15] = &unk_2700F99C0;
  v15[16] = &unk_2700F9A98;
  v15[17] = &unk_2700F9AB0;
  v15[18] = &unk_2700F9AC8;
  v15[19] = &unk_2700F9AE0;
  v15[20] = &unk_2700F9AF8;
  v15[21] = &unk_2700F9B10;
  v16[21] = &unk_2700F9F00;
  v15[22] = &unk_2700F9B28;
  v15[23] = &unk_2700F9B40;
  v16[22] = &unk_2700F9F18;
  v16[23] = &unk_2700F9F18;
  v15[24] = &unk_2700F9B58;
  v15[25] = &unk_2700F9B70;
  v16[24] = &unk_2700F9F30;
  v16[25] = &unk_2700F9A50;
  v15[26] = &unk_2700F9B88;
  v15[27] = &unk_2700F9BA0;
  v16[26] = &unk_2700F9F48;
  v16[27] = &unk_2700F9F48;
  v15[28] = &unk_2700F9BB8;
  v15[29] = &unk_2700F9BD0;
  v16[28] = &unk_2700F9F60;
  v16[29] = &unk_2700F9A38;
  v16[32] = &unk_2700F9F60;
  v15[30] = &unk_2700F9BE8;
  v15[31] = &unk_2700F9C00;
  v16[30] = &unk_2700F9F78;
  v16[31] = &unk_2700F9F78;
  v15[32] = &unk_2700F9C18;
  v15[33] = &unk_2700F9C30;
  v16[33] = &unk_2700F9A38;
  v15[34] = &unk_2700F9C48;
  v15[35] = &unk_2700F9C60;
  v16[34] = &unk_2700F9F78;
  v16[35] = &unk_2700F9F78;
  id v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:36];
  dataTypeToTextureTypeForInvalidPixelFormatMap = self->_dataTypeToTextureTypeForInvalidPixelFormatMap;
  self->_dataTypeToTextureTypeForInvalidPixelFormatMap = v9;

  v13[0] = &unk_2700F9918;
  v13[1] = &unk_2700F9930;
  v13[2] = &unk_2700F9948;
  v13[3] = &unk_2700F9960;
  v13[4] = &unk_2700F99D8;
  void v13[5] = &unk_2700F99F0;
  v13[6] = &unk_2700F9A08;
  v13[7] = &unk_2700F9A20;
  v14[0] = &unk_2700F9F90;
  v14[1] = &unk_2700F9FA8;
  v13[8] = &unk_2700F9978;
  v13[9] = &unk_2700F9990;
  v14[2] = &unk_2700F9FC0;
  v14[3] = &unk_2700F9FD8;
  v14[4] = &unk_2700F9F90;
  v14[5] = &unk_2700F9FA8;
  v14[6] = &unk_2700F9FC0;
  v14[7] = &unk_2700F9FD8;
  v14[8] = &unk_2700F9F90;
  v14[9] = &unk_2700F9FA8;
  v13[10] = &unk_2700F99A8;
  v13[11] = &unk_2700F99C0;
  v14[10] = &unk_2700F9FC0;
  v14[11] = &unk_2700F9FD8;
  v13[12] = &unk_2700F9A38;
  v13[13] = &unk_2700F9A50;
  v14[12] = &unk_2700F9F90;
  v14[13] = &unk_2700F9FA8;
  v13[14] = &unk_2700F9A68;
  v13[15] = &unk_2700F9A80;
  v14[14] = &unk_2700F9FC0;
  v14[15] = &unk_2700F9FD8;
  v13[16] = &unk_2700F9A98;
  v13[17] = &unk_2700F9AB0;
  v14[16] = &unk_2700F9F90;
  v14[17] = &unk_2700F9FA8;
  v13[18] = &unk_2700F9AC8;
  v13[19] = &unk_2700F9AE0;
  v14[18] = &unk_2700F9FC0;
  v14[19] = &unk_2700F9FD8;
  v13[20] = &unk_2700F9AF8;
  v13[21] = &unk_2700F9B10;
  v14[20] = &unk_2700F9F90;
  v14[21] = &unk_2700F9FA8;
  v13[22] = &unk_2700F9B28;
  v13[23] = &unk_2700F9B40;
  v14[22] = &unk_2700F9FC0;
  v14[23] = &unk_2700F9FD8;
  v13[24] = &unk_2700F9B58;
  v13[25] = &unk_2700F9B70;
  v14[24] = &unk_2700F9F90;
  v14[25] = &unk_2700F9FA8;
  v13[26] = &unk_2700F9B88;
  v13[27] = &unk_2700F9BA0;
  v14[26] = &unk_2700F9FC0;
  v14[27] = &unk_2700F9FD8;
  v13[28] = &unk_2700F9BB8;
  v13[29] = &unk_2700F9BD0;
  v14[28] = &unk_2700F9F90;
  v14[29] = &unk_2700F9FA8;
  v13[30] = &unk_2700F9BE8;
  v13[31] = &unk_2700F9C00;
  v14[30] = &unk_2700F9FC0;
  v14[31] = &unk_2700F9FD8;
  v13[32] = &unk_2700F9C18;
  v13[33] = &unk_2700F9C30;
  v14[32] = &unk_2700F9F90;
  v14[33] = &unk_2700F9FA8;
  v13[34] = &unk_2700F9C48;
  v13[35] = &unk_2700F9C60;
  v14[34] = &unk_2700F9FC0;
  v14[35] = &unk_2700F9FD8;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:36];
  dataTypeToChannelCount = self->_dataTypeToChannelCount;
  self->_dataTypeToChannelCount = v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTypeToChannelCount, 0);
  objc_storeStrong((id *)&self->_pixelFormatToDataTypeStringMap, 0);
  objc_storeStrong((id *)&self->_dataTypeToImageBlockTypeStringMap, 0);
  objc_storeStrong((id *)&self->_dataTypeToTextureTypeForInvalidPixelFormatMap, 0);
  objc_storeStrong((id *)&self->_dataTypeToTextureComponentTypeStringMap, 0);
  begin = self->_imageBlockArgumentsFromTile.__begin_;
  if (begin)
  {
    self->_imageBlockArgumentsFromTile.__end_ = begin;
    operator delete(begin);
  }
  BOOL v4 = self->_imageBlockArgumentsFromFragment.__begin_;
  if (v4)
  {
    self->_imageBlockArgumentsFromFragment.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_imageBlockSignature, 0);
  objc_storeStrong((id *)&self->_renderEncoder, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  return self;
}

@end