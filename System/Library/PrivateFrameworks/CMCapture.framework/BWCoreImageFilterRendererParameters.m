@interface BWCoreImageFilterRendererParameters
+ (BOOL)containsFilterRequiringFaceLandmarks:(id)a3;
+ (void)initialize;
- (BOOL)requiresDepthMap;
- (BOOL)requiresFaceLandmarks;
- (BWCoreImageFilterRendererParameters)initWithFilters:(id)a3 originalOutputFilter:(id)a4;
- (CIFilter)originalOutputFilter;
- (NSArray)filters;
- (float)interpolationFractionComplete;
- (id)copyWithZone:(_NSZone *)a3;
- (int)depthTypeForFilter:(id)a3;
- (int)prepareForRenderingWithInputVideoFormat:(id)a3;
- (signed)type;
- (uint64_t)_ensureResourceRequirementsForFilters:(unsigned char *)a3 outputRequiresFaceLandmarks:(unsigned char *)a4 outputRequiresDepthMap:;
- (void)dealloc;
- (void)setFilters:(id)a3;
- (void)setOriginalOutputFilter:(id)a3;
@end

@implementation BWCoreImageFilterRendererParameters

+ (void)initialize
{
}

- (BWCoreImageFilterRendererParameters)initWithFilters:(id)a3 originalOutputFilter:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)BWCoreImageFilterRendererParameters;
  v6 = [(BWCoreImageFilterRendererParameters *)&v10 init];
  v7 = v6;
  if (v6)
  {
    __int16 v9 = 0;
    -[BWCoreImageFilterRendererParameters _ensureResourceRequirementsForFilters:outputRequiresFaceLandmarks:outputRequiresDepthMap:]((uint64_t)v6, a3, (unsigned char *)&v9 + 1, &v9);
    v7->_filters = (NSArray *)[a3 copy];
    v7->_originalOutputFilter = (CIFilter *)a4;
    v7->_requiresFaceLandmarks = HIBYTE(v9);
    v7->_requiresDepthMap = v9;
  }
  return v7;
}

- (uint64_t)_ensureResourceRequirementsForFilters:(unsigned char *)a3 outputRequiresFaceLandmarks:(unsigned char *)a4 outputRequiresDepthMap:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    result = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (result)
    {
      uint64_t v5 = result;
      char v6 = 0;
      char v7 = 0;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(a2);
          }
          objc_super v10 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v9) inputKeys];
          char v11 = [v10 containsObject:@"inputFaceLandmarkArray"];
          if (([v10 containsObject:@"inputDepthMap"] & 1) != 0
            || ([v10 containsObject:@"inputDisparity"] & 1) != 0
            || ([v10 containsObject:@"inputBlurMap"] & 1) != 0
            || [v10 containsObject:@"inputShiftMap"])
          {
            char v6 = 1;
          }
          v7 |= v11;
          ++v9;
        }
        while (v5 != v9);
        result = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
    else
    {
      char v6 = 0;
      char v7 = 0;
    }
    if (a3) {
      *a3 = v7 & 1;
    }
    if (a4) {
      *a4 = v6 & 1;
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWCoreImageFilterRendererParameters;
  [(BWCoreImageFilterRendererParameters *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[objc_alloc((Class)objc_opt_class()) initWithFilters:self->_filters originalOutputFilter:self->_originalOutputFilter];
  *((unsigned char *)result + 24) = self->_requiresFaceLandmarks;
  *((unsigned char *)result + 25) = self->_requiresDepthMap;
  return result;
}

- (signed)type
{
  return 4;
}

- (int)prepareForRenderingWithInputVideoFormat:(id)a3
{
  return 0;
}

- (float)interpolationFractionComplete
{
  return 1.0;
}

- (void)setFilters:(id)a3
{
  if (self->_filters != a3)
  {
    __int16 v5 = 0;
    -[BWCoreImageFilterRendererParameters _ensureResourceRequirementsForFilters:outputRequiresFaceLandmarks:outputRequiresDepthMap:]((uint64_t)self, a3, (unsigned char *)&v5 + 1, &v5);

    self->_filters = (NSArray *)[a3 copy];
    self->_requiresFaceLandmarks = HIBYTE(v5);
    self->_requiresDepthMap = v5;
  }
}

- (int)depthTypeForFilter:(id)a3
{
  v4 = (void *)[a3 inputKeys];
  if (v4)
  {
    __int16 v5 = v4;
    if ([v4 containsObject:@"inputBlurMap"])
    {
      return 3;
    }
    else if ([v5 containsObject:@"inputDisparity"] {
           && ((objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", @"CIPortraitEffectStage") & 1) != 0
    }
            || (objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", @"CIPortraitEffectStageMono") & 1) != 0))
    {
      return 2;
    }
    else
    {
      return [v5 containsObject:@"inputDepthMap"];
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

+ (BOOL)containsFilterRequiringFaceLandmarks:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        v6 |= objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "inputKeys"), "containsObject:", @"inputFaceLandmarkArray");
      }
      uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6 & 1;
}

- (NSArray)filters
{
  return self->_filters;
}

- (CIFilter)originalOutputFilter
{
  return self->_originalOutputFilter;
}

- (void)setOriginalOutputFilter:(id)a3
{
}

- (BOOL)requiresFaceLandmarks
{
  return self->_requiresFaceLandmarks;
}

- (BOOL)requiresDepthMap
{
  return self->_requiresDepthMap;
}

@end