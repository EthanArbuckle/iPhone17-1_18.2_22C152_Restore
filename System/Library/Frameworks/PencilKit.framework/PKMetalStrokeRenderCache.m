@interface PKMetalStrokeRenderCache
- (BOOL)isCompatibleWithInk:(id)a3 renderZoomFactor:(int64_t)a4;
- (BOOL)lockPurgeableResourcesAddToSet:(id)a3;
- (BOOL)needsCompute;
- (NSArray)buffers;
- (NSArray)secondaryBuffers;
- (PKInk)ink;
- (PKMetalStrokeRenderCache)initWithInk:(id)a3 renderZoomFactor:(int64_t)a4;
- (unint64_t)cacheCost;
- (void)addBuffer:(id)a3;
- (void)addSecondaryBuffer:(id)a3;
@end

@implementation PKMetalStrokeRenderCache

- (PKMetalStrokeRenderCache)initWithInk:(id)a3 renderZoomFactor:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKMetalStrokeRenderCache;
  v8 = [(PKMetalStrokeRenderCache *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    buffers = v8->_buffers;
    v8->_buffers = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v8->_ink, a3);
    v8->_renderZoomFactor = a4;
  }

  return v8;
}

- (void)addBuffer:(id)a3
{
  v5 = a3;
  -[NSMutableArray addObject:](self->_buffers, "addObject:");
  if (v5) {
    uint64_t v4 = v5[4] * v5[3];
  }
  else {
    uint64_t v4 = 0;
  }
  self->_totalCost += v4;
}

- (void)addSecondaryBuffer:(id)a3
{
  uint64_t v4 = a3;
  secondaryBuffers = self->_secondaryBuffers;
  uint64_t v9 = v4;
  if (!secondaryBuffers)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_secondaryBuffers;
    self->_secondaryBuffers = v6;

    secondaryBuffers = self->_secondaryBuffers;
    uint64_t v4 = v9;
  }
  [(NSMutableArray *)secondaryBuffers addObject:v4];
  if (v9) {
    uint64_t v8 = v9[4] * v9[3];
  }
  else {
    uint64_t v8 = 0;
  }
  self->_totalCost += v8;
}

- (NSArray)buffers
{
  return (NSArray *)self->_buffers;
}

- (NSArray)secondaryBuffers
{
  return (NSArray *)self->_secondaryBuffers;
}

- (unint64_t)cacheCost
{
  return self->_totalCost;
}

- (BOOL)needsCompute
{
  return 0;
}

- (BOOL)isCompatibleWithInk:(id)a3 renderZoomFactor:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PKMetalStrokeRenderCache *)self ink];
  uint64_t v8 = [v7 version];
  if (v8 == [v6 version])
  {
    uint64_t v9 = [(PKMetalStrokeRenderCache *)self ink];
    uint64_t v10 = [v9 requiredContentVersion];
    if (v10 == [v6 requiredContentVersion])
    {
      v11 = [(PKMetalStrokeRenderCache *)self ink];
      id v12 = [v11 color];
      double Alpha = CGColorGetAlpha((CGColorRef)[v12 CGColor]);
      id v14 = [v6 color];
      BOOL v15 = vabdd_f64(Alpha, CGColorGetAlpha((CGColorRef)[v14 CGColor])) < 0.00999999978
         && self->_renderZoomFactor == a4;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)lockPurgeableResourcesAddToSet:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_buffers;
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
      if ((-[PKMetalStrokeRenderCacheBuffer lockPurgeableResourcesAddToSet:](*(void *)(*((void *)&v18 + 1) + 8 * v8), v4) & 1) == 0)break; {
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
    v5 = self->_secondaryBuffers;
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
      if ((-[PKMetalStrokeRenderCacheBuffer lockPurgeableResourcesAddToSet:](*(void *)(*((void *)&v14 + 1) + 8 * v11), v4) & 1) == 0)break; {
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

- (PKInk)ink
{
  return self->_ink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_secondaryBuffers, 0);

  objc_storeStrong((id *)&self->_buffers, 0);
}

@end