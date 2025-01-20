@interface PKMetalRenderState
- (id).cxx_construct;
- (id)commandBufferCreateIfNecessary;
- (id)computeCommandBufferCreateIfNecessary;
- (id)initWithCommandQueue:(char)a3 liveRendering:(uint64_t)a4 defaultPipelineConfig:;
- (id)lastCommandBuffer;
- (id)maskCommandBufferCreateIfNecessary;
- (unint64_t)pipelineConfig;
- (void)addCommandBuffer:(uint64_t)a1;
- (void)addPurgeableFramebuffer:(uint64_t)a1;
- (void)commitAndPurgeResourceSet:(uint64_t)a1;
- (void)dealloc;
- (void)extendLifetimeUntilCompleted:(uint64_t)a1;
- (void)pushDebugGroup:(uint64_t)a1;
- (void)setComputeEncoder:(uint64_t)a1;
- (void)setDestinationTexture:(uint64_t)a1;
- (void)setMaskRenderEncoder:(uint64_t)a1;
- (void)setMultiplyDestinationTexture:(uint64_t)a1;
- (void)setRenderEncoder:(uint64_t)a1;
- (void)setSixChannelContentTexture:(uint64_t)a1;
@end

@implementation PKMetalRenderState

- (id)initWithCommandQueue:(char)a3 liveRendering:(uint64_t)a4 defaultPipelineConfig:
{
  id v8 = a2;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)PKMetalRenderState;
    v9 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v9;
    if (v9)
    {
      *((unsigned char *)v9 + 38) = a3;
      objc_storeStrong(v9 + 6, a2);
      a1[16] = 0;
      uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
      id v11 = a1[1];
      a1[1] = (id)v10;

      uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
      id v13 = a1[3];
      a1[3] = (id)v12;

      uint64_t v14 = MEMORY[0x1E4F1DAB8];
      long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *((_OWORD *)a1 + 12) = *MEMORY[0x1E4F1DAB8];
      *((_OWORD *)a1 + 13) = v15;
      *((_OWORD *)a1 + 14) = *(_OWORD *)(v14 + 32);
      uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:8];
      id v17 = a1[2];
      a1[2] = (id)v16;

      a1[19] = (id)1;
      *((_WORD *)a1 + 18) = WORD2(a4);
      *((_DWORD *)a1 + 8) = a4;
    }
  }

  return a1;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(NSMutableSet *)self->_purgeableFramebuffers allObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        -[PKMetalFramebuffer decrementNonPurgeableCount](*(unsigned char **)(*((void *)&v8 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  v7.receiver = self;
  v7.super_class = (Class)PKMetalRenderState;
  [(PKMetalRenderState *)&v7 dealloc];
}

- (id)commandBufferCreateIfNecessary
{
  if (a1)
  {
    v2 = a1;
    id v3 = a1[7];
    if (!v3)
    {
      uint64_t v4 = [a1[6] commandBuffer];
      id v5 = v2[7];
      v2[7] = (id)v4;

      [v2[7] setLabel:@"Main render command buffer"];
      id v3 = v2[7];
    }
    a1 = (id *)v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)computeCommandBufferCreateIfNecessary
{
  if (a1)
  {
    v2 = a1;
    id v3 = a1[8];
    if (!v3)
    {
      uint64_t v4 = [a1[6] commandBuffer];
      id v5 = v2[8];
      v2[8] = (id)v4;

      [v2[8] setLabel:@"Compute command buffer"];
      id v3 = v2[8];
    }
    a1 = (id *)v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)maskCommandBufferCreateIfNecessary
{
  if (a1)
  {
    v2 = a1;
    id v3 = a1[9];
    if (!v3)
    {
      uint64_t v4 = [a1[6] commandBuffer];
      id v5 = v2[9];
      v2[9] = (id)v4;

      [v2[9] setLabel:@"Mask command buffer"];
      id v3 = v2[9];
    }
    a1 = (id *)v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)commitAndPurgeResourceSet:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    [(id)objc_opt_class() renderTargetBarrierForRenderEncoder:*(void *)(a1 + 80)];
    uint64_t v4 = *(void **)(a1 + 96);
    [v4 endEncoding];
    id v5 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;

    [*(id *)(a1 + 72) enqueue];
    [*(id *)(a1 + 72) commit];
    uint64_t v6 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = 0;

    [*(id *)(a1 + 88) endEncoding];
    objc_super v7 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = 0;

    [*(id *)(a1 + 64) enqueue];
    [*(id *)(a1 + 64) commit];
    long long v8 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    [*(id *)(a1 + 80) endEncoding];
    long long v9 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;

    if ([*(id *)(a1 + 8) count])
    {
      id v10 = [*(id *)(a1 + 8) lastObject];
    }
    else
    {
      id v10 = *(id *)(a1 + 56);
    }
    long long v11 = v10;
    uint64_t v12 = [*(id *)(a1 + 16) allObjects];
    [*(id *)(a1 + 16) removeAllObjects];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__6;
    v33 = __Block_byref_object_dispose__6;
    id v34 = (id)[*(id *)(a1 + 24) copy];
    [*(id *)(a1 + 24) removeAllObjects];
    if ([v3 count] || objc_msgSend(v12, "count") || objc_msgSend((id)v30[5], "count"))
    {
      uint64_t v13 = (void *)[v3 copy];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __48__PKMetalRenderState_commitAndPurgeResourceSet___block_invoke;
      v25[3] = &unk_1E64C70D0;
      id v26 = v13;
      id v27 = v12;
      v28 = &v29;
      id v14 = v13;
      [v11 addCompletedHandler:v25];
    }
    [*(id *)(a1 + 56) enqueue];
    [*(id *)(a1 + 56) commit];
    long long v15 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;

    *(void *)(a1 + 104) = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v16 = *(id *)(a1 + 8);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v16);
          }
          v20 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_msgSend(v20, "enqueue", (void)v21);
          [v20 commit];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v35 count:16];
      }
      while (v17);
    }

    [*(id *)(a1 + 8) removeAllObjects];
    if (v4) {
      [v11 waitUntilScheduled];
    }
    if (*(unsigned char *)(a1 + 39)) {
      [v11 waitUntilCompleted];
    }
    _Block_object_dispose(&v29, 8);
  }
}

void __48__PKMetalRenderState_commitAndPurgeResourceSet___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v5++) unlock];
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v3);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        -[PKMetalFramebuffer decrementNonPurgeableCount](*(unsigned char **)(*((void *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

- (void)addCommandBuffer:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (*(void *)(a1 + 56))
    {
      [*(id *)(a1 + 8) addObject:v3];
    }
    else
    {
      [v3 enqueue];
      [v3 commit];
      if (*(unsigned char *)(a1 + 39)) {
        [v3 waitUntilCompleted];
      }
    }
  }
}

- (id)lastCommandBuffer
{
  if (a1)
  {
    id v2 = a1;
    if ([a1[1] count])
    {
      a1 = [v2[1] lastObject];
    }
    else
    {
      a1 = (id *)v2[7];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addPurgeableFramebuffer:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (v3)
    {
      if (([*(id *)(a1 + 16) containsObject:v3] & 1) == 0)
      {
        [*(id *)(a1 + 16) addObject:v4];
        -[PKMetalFramebuffer incrementNonPurgeableCount](v4);
      }
    }
    else
    {
      uint64_t v5 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_fault_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_FAULT, "Tried to add a nil framebuffer as a purgeable buffer", v6, 2u);
      }
    }
  }
}

- (void)extendLifetimeUntilCompleted:(uint64_t)a1
{
  id v3 = a2;
  if (a1) {
    [*(id *)(a1 + 24) addObject:v3];
  }
}

- (void)pushDebugGroup:(uint64_t)a1
{
  id v3 = a2;
  if (a1) {
    [*(id *)(a1 + 80) pushDebugGroup:v3];
  }
}

- (void)setRenderEncoder:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 80), a2);
    if (v4)
    {
      if (*(void *)(a1 + 176) && *(void *)(a1 + 184))
      {
        long long v5 = *(_OWORD *)(a1 + 176);
        v6[0] = *(_OWORD *)(a1 + 160);
        v6[1] = v5;
        [v4 setScissorRect:v6];
      }
    }
  }
}

- (unint64_t)pipelineConfig
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 43))
    {
      unsigned __int16 v6 = 0;
      unsigned int __b = 0;
      size_t v1 = 2 * *(void *)(a1 + 152);
      if (v1) {
        memset(&__b, *(unsigned __int8 *)(a1 + 33), v1);
      }
    }
    else
    {
      uint64_t v2 = *(void *)(a1 + 152);
      unsigned int v3 = *(_DWORD *)(a1 + 32);
      unsigned __int16 v6 = *(_WORD *)(a1 + 36);
      unsigned int __b = v3;
      if (v2 == 2)
      {
        LOBYTE(v6) = BYTE1(v3);
        HIBYTE(v6) = BYTE2(v3);
      }
    }
  }
  else
  {
    unsigned __int16 v6 = 0;
    unsigned int __b = 0;
  }
  return __b | ((unint64_t)v6 << 32);
}

- (void)setComputeEncoder:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void)setMaskRenderEncoder:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (void)setDestinationTexture:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 112), a2);
  }
}

- (void)setMultiplyDestinationTexture:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 120), a2);
  }
}

- (void)setSixChannelContentTexture:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 144), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sixChannelContentTexture, 0);
  objc_storeStrong((id *)&self->_multiplyDestinationTexture, 0);
  objc_storeStrong((id *)&self->_destinationTexture, 0);
  objc_storeStrong((id *)&self->_maskRenderEncoder, 0);
  objc_storeStrong((id *)&self->_computeEncoder, 0);
  objc_storeStrong((id *)&self->_renderEncoder, 0);
  objc_storeStrong((id *)&self->_maskCommandBuffer, 0);
  objc_storeStrong((id *)&self->_computeCommandBuffer, 0);
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_extendedLifetimeObjects, 0);
  objc_storeStrong((id *)&self->_purgeableFramebuffers, 0);

  objc_storeStrong((id *)&self->_commandBuffers, 0);
}

- (id).cxx_construct
{
  *((_WORD *)self + 18) = 0;
  *((_DWORD *)self + 8) = 0;
  return self;
}

@end