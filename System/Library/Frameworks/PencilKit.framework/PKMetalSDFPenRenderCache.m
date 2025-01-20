@interface PKMetalSDFPenRenderCache
- (BOOL)isCompatibleWithInk:(id)a3 renderZoomFactor:(int64_t)a4;
- (BOOL)lockPurgeableResourcesAddToSet:(id)a3;
- (BOOL)needsCompute;
- (id)buffers;
- (unint64_t)cacheCost;
- (void)addBuffer:(uint64_t)a1;
- (void)initWithPurgeableBuffers:(uint64_t)a3 renderZoomFactor:;
@end

@implementation PKMetalSDFPenRenderCache

- (void)initWithPurgeableBuffers:(uint64_t)a3 renderZoomFactor:
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)PKMetalSDFPenRenderCache;
  v5 = objc_msgSendSuper2(&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = (void *)v5[1];
    v5[1] = v6;

    *((unsigned char *)v5 + 32) = a2;
    v5[3] = a3;
  }
  return v5;
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
      uint64_t v4 = 24 * v5[6];
    }
    else {
      uint64_t v4 = 0;
    }
    *(void *)(a1 + 16) += v4;
  }
}

- (id)buffers
{
  if (a1)
  {
    a1 = (id *)a1[1];
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
  return self->_renderZoomFactor == a4;
}

- (BOOL)lockPurgeableResourcesAddToSet:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_purgeableBuffers)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = self->_buffers;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v10 = v4;
          v11 = v10;
          if (!v9) {
            goto LABEL_20;
          }
          uint64_t v12 = objc_msgSend(v10, "count", (void)v19);
          [v11 addObject:*(void *)(v9 + 16)];
          if ([v11 count] != v12 && (objc_msgSend(*(id *)(v9 + 16), "lock") & 1) == 0) {
            goto LABEL_20;
          }
          v13 = *(void **)(v9 + 8);
          if (v13 != *(void **)(v9 + 16))
          {
            uint64_t v14 = [v11 count];
            [v11 addObject:*(void *)(v9 + 8)];
            uint64_t v15 = [v11 count];
            v13 = *(void **)(v9 + 8);
            if (v15 != v14)
            {
              if (![v13 lock]) {
                goto LABEL_20;
              }
              v13 = *(void **)(v9 + 8);
            }
          }
          if ([v13 isPurged])
          {
LABEL_20:

LABEL_21:
            BOOL v17 = 0;
            goto LABEL_23;
          }
          char v16 = [*(id *)(v9 + 16) isPurged];

          if (v16) {
            goto LABEL_21;
          }
        }
        uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        BOOL v17 = 1;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v17 = 1;
    }
LABEL_23:
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (void).cxx_destruct
{
}

@end