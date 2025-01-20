@interface PKMetalParticleRenderCache
- (BOOL)isCompatibleWithInk:(id)a3 renderZoomFactor:(int64_t)a4;
- (BOOL)lockPurgeableResourcesAddToSet:(id)a3;
- (BOOL)needsCompute;
- (id)initWithDevice:(void *)a3 ink:(void *)a4 renderZoomFactor:;
- (id)secondaryBuffers;
- (unint64_t)cacheCost;
- (void)addBuffer:(uint64_t)a1;
- (void)addSecondaryBuffer:(uint64_t)a1;
@end

@implementation PKMetalParticleRenderCache

- (id)initWithDevice:(void *)a3 ink:(void *)a4 renderZoomFactor:
{
  id v7 = a3;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)PKMetalParticleRenderCache;
    a1 = (id *)objc_msgSendSuper2(&v11, sel_init);
    if (a1)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      id v9 = a1[1];
      a1[1] = (id)v8;

      objc_storeStrong(a1 + 5, a3);
      a1[4] = a4;
    }
  }

  return a1;
}

- (void)addBuffer:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    v5 = v3;
    [*(id *)(a1 + 8) addObject:v3];
    v3 = v5;
    if (v5) {
      uint64_t v4 = 32 * v5[7];
    }
    else {
      uint64_t v4 = 0;
    }
    *(void *)(a1 + 24) += v4;
  }
}

- (void)addSecondaryBuffer:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 16);
    uint64_t v8 = v3;
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
      v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      uint64_t v4 = *(void **)(a1 + 16);
      v3 = v8;
    }
    [v4 addObject:v3];
    v3 = v8;
    if (v8) {
      uint64_t v7 = 32 * v8[7];
    }
    else {
      uint64_t v7 = 0;
    }
    *(void *)(a1 + 24) += v7;
  }
}

- (id)secondaryBuffers
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (unint64_t)cacheCost
{
  return self->_totalCost;
}

- (BOOL)needsCompute
{
  return 1;
}

- (BOOL)isCompatibleWithInk:(id)a3 renderZoomFactor:(int64_t)a4
{
  id v6 = a3;
  if (self) {
    ink = self->_ink;
  }
  else {
    ink = 0;
  }
  uint64_t v8 = ink;
  uint64_t v9 = [(PKInk *)v8 version];
  if (v9 == [v6 version])
  {
    if (self) {
      v10 = self->_ink;
    }
    else {
      v10 = 0;
    }
    objc_super v11 = v10;
    uint64_t v12 = [(PKInk *)v11 requiredContentVersion];
    if (v12 == [v6 requiredContentVersion])
    {
      if (self) {
        v13 = self->_ink;
      }
      else {
        v13 = 0;
      }
      id v14 = [(PKInk *)v13 color];
      double Alpha = CGColorGetAlpha((CGColorRef)[v14 CGColor]);
      id v16 = [v6 color];
      BOOL v17 = vabdd_f64(Alpha, CGColorGetAlpha((CGColorRef)[v16 CGColor])) < 0.00999999978
         && self->_renderZoomFactor == a4;
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)lockPurgeableResourcesAddToSet:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = self->_buffers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(v5);
      }
      if ((-[PKMetalParticleRenderCacheBuffer lockPurgeableResourcesAddToSet:](*(void *)(*((void *)&v18 + 1) + 8 * v8), v4) & 1) == 0)break; {
      if (v6 == ++v8)
      }
      {
        uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = self->_secondaryBuffers;
    uint64_t v9 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (!v9)
    {
      BOOL v12 = 1;
      goto LABEL_19;
    }
    uint64_t v10 = *(void *)v15;
LABEL_11:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v5);
      }
      if ((-[PKMetalParticleRenderCacheBuffer lockPurgeableResourcesAddToSet:](*(void *)(*((void *)&v14 + 1) + 8 * v11), v4) & 1) == 0)break; {
      if (v9 == ++v11)
      }
      {
        uint64_t v9 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
        BOOL v12 = 1;
        if (v9) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_secondaryBuffers, 0);

  objc_storeStrong((id *)&self->_buffers, 0);
}

@end