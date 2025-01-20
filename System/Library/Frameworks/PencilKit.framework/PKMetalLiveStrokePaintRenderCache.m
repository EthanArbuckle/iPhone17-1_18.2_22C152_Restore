@interface PKMetalLiveStrokePaintRenderCache
- (BOOL)isCompatibleWithInk:(id)a3 renderZoomFactor:(int64_t)a4;
- (BOOL)lockPurgeableResourcesAddToSet:(id)a3;
- (BOOL)needsCompute;
- (unint64_t)cacheCost;
- (void)addBuffer:(uint64_t)a1;
- (void)initWithRenderZoomFactor:(void *)a1;
@end

@implementation PKMetalLiveStrokePaintRenderCache

- (void)initWithRenderZoomFactor:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)PKMetalLiveStrokePaintRenderCache;
  v3 = objc_msgSendSuper2(&v9, sel_init);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = (void *)v3[1];
    v3[1] = v4;

    long long v6 = *MEMORY[0x1E4F1DB20];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *((_OWORD *)v3 + 2) = xmmword_1C4827030;
    *((_OWORD *)v3 + 3) = v6;
    *((_OWORD *)v3 + 4) = v7;
    v3[3] = a2;
  }
  return v3;
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
      uint64_t v4 = 40 * v5[6];
    }
    else {
      uint64_t v4 = 0;
    }
    *(void *)(a1 + 16) += v4;
  }
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
  return 1;
}

- (void).cxx_destruct
{
}

@end