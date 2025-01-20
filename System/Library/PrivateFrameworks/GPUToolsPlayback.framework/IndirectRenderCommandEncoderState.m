@interface IndirectRenderCommandEncoderState
+ (id)saveEncoder:(id)a3 withDescriptor:(id)a4 player:(id)a5;
- (void)restoreEncoder:(id)a3 withDescriptor:(id)a4;
@end

@implementation IndirectRenderCommandEncoderState

+ (id)saveEncoder:(id)a3 withDescriptor:(id)a4 player:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = objc_alloc_init(IndirectRenderCommandEncoderState);
  if (([v8 inheritPipelineState] & 1) == 0)
  {
    uint64_t v10 = [v7 renderPipelineState];
    uint64_t v11 = v23[5];
    v12 = *(void **)(v11 + 8);
    *(void *)(v11 + 8) = v10;
  }
  if (([v8 inheritBuffers] & 1) == 0)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__IndirectRenderCommandEncoderState_saveEncoder_withDescriptor_player___block_invoke;
    v19[3] = &unk_265338FA0;
    id v13 = v9;
    id v20 = v13;
    v21 = &v22;
    [v7 enumerateVertexBuffersUsingBlock:v19];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__IndirectRenderCommandEncoderState_saveEncoder_withDescriptor_player___block_invoke_2;
    v16[3] = &unk_265338FA0;
    id v17 = v13;
    v18 = &v22;
    [v7 enumerateFragmentBuffersUsingBlock:v16];
  }
  id v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __71__IndirectRenderCommandEncoderState_saveEncoder_withDescriptor_player___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = *(void **)a2;
  if (!v6 && *(void *)(a2 + 8))
  {
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "vertexBytesForKey:", +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:](DYMTLFunctionPlayer, "vertexBytesKeyAtIndex:", a3));
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v7 = a1 + 40;
    *(void *)(*(void *)(*(void *)(v11 + 8) + 40) + 8 * a3 + 264) = v10;
    if (*(void *)a2)
    {
      uint64_t v9 = 0;
      uint64_t v8 = 760;
      goto LABEL_11;
    }
    uint64_t v9 = *(void *)(a2 + 8);
    uint64_t v8 = 760;
    if (!v9) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v9 = *(void *)(a2 + 16);
    goto LABEL_11;
  }
  uint64_t v7 = a1 + 40;
  objc_storeStrong((id *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 8 * a3 + 16), v6);
  if (!*(void *)a2)
  {
    uint64_t v9 = 0;
    uint64_t v8 = 512;
    goto LABEL_11;
  }
  uint64_t v8 = 512;
  if (!*(void *)(a2 + 8)) {
    goto LABEL_10;
  }
  uint64_t v9 = 0;
LABEL_11:
  *(void *)(*(void *)(*(void *)(*(void *)v7 + 8) + 40) + v8 + 8 * a3) = v9;
}

void __71__IndirectRenderCommandEncoderState_saveEncoder_withDescriptor_player___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = *(void **)a2;
  if (!v6 && *(void *)(a2 + 8))
  {
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "fragmentBytesForKey:", +[DYMTLFunctionPlayer fragmentBytesKeyAtIndex:](DYMTLFunctionPlayer, "fragmentBytesKeyAtIndex:", a3));
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v7 = a1 + 40;
    *(void *)(*(void *)(*(void *)(v11 + 8) + 40) + 8 * a3 + 1256) = v10;
    if (*(void *)a2)
    {
      uint64_t v9 = 0;
      uint64_t v8 = 1752;
      goto LABEL_11;
    }
    uint64_t v9 = *(void *)(a2 + 8);
    uint64_t v8 = 1752;
    if (!v9) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v9 = *(void *)(a2 + 16);
    goto LABEL_11;
  }
  uint64_t v7 = a1 + 40;
  objc_storeStrong((id *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 8 * a3 + 1008), v6);
  if (!*(void *)a2)
  {
    uint64_t v9 = 0;
    uint64_t v8 = 1504;
    goto LABEL_11;
  }
  uint64_t v8 = 1504;
  if (!*(void *)(a2 + 8)) {
    goto LABEL_10;
  }
  uint64_t v9 = 0;
LABEL_11:
  *(void *)(*(void *)(*(void *)(*(void *)v7 + 8) + 40) + v8 + 8 * a3) = v9;
}

- (void)restoreEncoder:(id)a3 withDescriptor:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (([v6 inheritPipelineState] & 1) == 0 && self->_pipelineState) {
    objc_msgSend(v17, "setRenderPipelineState:");
  }
  if (([v6 inheritBuffers] & 1) == 0)
  {
    uint64_t v7 = [v6 maxVertexBufferBindCount];
    if (v7)
    {
      uint64_t v8 = -v7;
      uint64_t v9 = 64;
      uint64_t v10 = self;
      do
      {
        uint64_t v11 = v9 - 64;
        v12 = v10->_vertexBytes[0];
        if (v12) {
          [v17 setVertexBytes:v12 length:v10->_vertexBytesLength[0] atIndex:v11];
        }
        else {
          [v17 setVertexBuffer:v10->_vertexBuffers[0] offset:v10->_vertexBufferOffsets[0] atIndex:v11];
        }
        ++v9;
        uint64_t v10 = (IndirectRenderCommandEncoderState *)((char *)v10 + 8);
      }
      while (v8 + v9 != 64);
    }
    uint64_t v13 = [v6 maxFragmentBufferBindCount];
    if (v13)
    {
      uint64_t v14 = 0;
      fragmentBuffers = self->_fragmentBuffers;
      do
      {
        v16 = fragmentBuffers[31];
        if (v16) {
          [v17 setFragmentBytes:v16 length:fragmentBuffers[93] atIndex:v14];
        }
        else {
          [v17 setFragmentBuffer:*fragmentBuffers offset:fragmentBuffers[62] atIndex:v14];
        }
        ++v14;
        ++fragmentBuffers;
      }
      while (v13 != v14);
    }
  }
}

- (void).cxx_destruct
{
  uint64_t v3 = 0;
  v4 = &self->_fragmentBuffers[30];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -31);
  for (uint64_t i = 256; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
}

@end